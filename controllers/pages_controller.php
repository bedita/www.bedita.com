<?php
/*-----8<--------------------------------------------------------------------
 * 
 * BEdita - a semantic content management framework
 * 
 * Copyright 2009 ChannelWeb Srl, Chialab Srl
 * 
 * This file is part of BEdita: you can redistribute it and/or modify
 * it under the terms of the Affero GNU General Public License as published 
 * by the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version.
 * BEdita is distributed WITHOUT ANY WARRANTY; without even the implied 
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the Affero GNU General Public License for more details.
 * You should have received a copy of the Affero GNU General Public License 
 * version 3 along with BEdita (see LICENSE.AGPL).
 * If not, see <http://gnu.org/licenses/agpl-3.0.html>.
 * 
 *------------------------------------------------------------------->8-----
 */

/**
 * BEdita site frontend, main controller
 */	
class PagesController extends FrontendController {
	
	var $helpers = array();
	var $components = array('BeTree');
	var $uses = array('BEObject','Tree') ;
	
	var	$modules = array("documents","events","galleries","tags","comments");
	
	
	/**
	* load common data, for all frontend pages...
	*/ 
	function beditaBeforeFilter() {

		// first menu level
		$this->set("menu", $this->loadSectionsTree("menu", false, array(), 1));
		
		// get footer
		$footer = $this->loadSectionObjectsByNick("footer"); 
		$this->set('footer', @$footer['childContents']);

		// get banners
		$footer = $this->loadSectionObjectsByNick("banners"); 
		$this->set('banner', @$footer['childContents'][0]);
		
		
		// random modules colors
		$randomkeys = array_rand($this->modules,4);
		foreach ($randomkeys as $value) $moduleList[] = $this->modules[$value];
		$this->set('moduleList', $moduleList) ;
		
		$this->set('feedNames', $this->Section->feedsAvailable(Configure::read("frontendAreaId")));
	
	}
	
	
	protected function blogBeforeFilter() {
		$this->loadTags(null, true);
	}

	protected function sitemapBeforeRender() {
		$sections_tree = array();
		if(!empty($this->viewVars['sections_tree'][0]['sections'])) {
			$sections_tree = $this->viewVars['sections_tree'][0]['sections'];
		}
		
		$this->set('sections_tree',$sections_tree);
	}
	
	protected function sitemapXmlBeforeRender() {
		if(!empty($this->viewVars['urlset'])) {
			foreach ($this->viewVars['urlset'] as &$uSet) {
				$uSet['loc'] = str_replace("/menu/", "/", $uSet['loc']);
			}
		}
	}
	
	protected function beditaBeforeRender() {
		// get submenu
		$submenu = array();
		$this->baseLevel = true;
		if (!empty($this->viewVars["section"]["pathSection"])) {
			
			$ancestorsArr = array_slice($this->viewVars["section"]["pathSection"],1);
			if ($ancestor = current($ancestorsArr)) {
				$submenu = $this->loadSectionsTree($ancestor["id"], true);
				$this->set("ancestor", array_merge($ancestor, $this->loadSectionObjects($ancestor["id"])));
			}
			
		}
		
		if (empty($submenu) && !empty($this->viewVars["section"])) {
			$submenu = $this->loadSectionsTree($this->viewVars["section"]["id"], true);
		}
		$this->set("submenu", $submenu);
		$this->baseLevel = false;
	}
	
	protected function downloadBeforeFilter() {
		if (!empty($this->params['pass'][1])) {
			$id = $this->BEObject->getIdFromNickname($this->params['pass'][1]);
			if (!empty($id)) {
				$object = $this->loadObj($id);
				$data = array(
					'package_file' => $object['uri'],
					'object_id' => $object['id'],
					'ip_address' => $_SERVER['REMOTE_ADDR']
				);	
				ClassRegistry::init('DownloadPackage')->save($data);
			}
		}
	}

	public function getGlossary() {
		$this->layout = "ajax";
		$glossary = ClassRegistry::init('DefinitionTerm')->findByWord($this->params['form']['title'], array(
			"conditions" => array(
				"BEObject.status" => $this->getStatus()
			)
		));
		$this->set('glossary', $glossary);
	}


	public function eventRegistration() {
		if (!empty($this->params["form"]["category"])) {
			try {
				$emailForm = trim($this->data["email"]);
				if (empty($emailForm)) {
					throw new BeditaException(__("Registration failed. Missing email. Please, try again",true));
				}
				$categoryModel = ClassRegistry::init("Category");
				$categoryModel->bviorCompactResults = false;
				$cat_id = $categoryModel->field("id", array("name" => $this->params["form"]["category"]));
				if (empty($cat_id)) {
					throw new BeditaException(__("Registration failed. Please, try again",true));
				}
				$categoryModel->bviorCompactResults = true;
				$cardModel = ClassRegistry::init("Card");
				$card_id = $cardModel->field("id", array("email" => $emailForm));
				$this->Transaction->begin();
				// save only the association between card and category
				if (!empty($card_id)) {
					$objCatModel = ClassRegistry::init("ObjectCategory");
					$count = $objCatModel->find("count", array(
						"conditions" => array("object_id" => $card_id,"category_id" => $cat_id)
						)
					);
					if ($count > 0) {
						throw new BeditaException(__("Registration failed. Email results already registered",true));
					}
					$this->data["id"] = $card_id;
					unset($this->data["name"]);
					unset($this->data["surname"]);
					unset($this->data["company_name"]);
					$cardModel->contain(array("BEObject" => array("Category")));
					$card = $cardModel->findById($card_id);
					foreach ($card["Category"] as $c) {
						$this->data["Category"][] = $c["id"];
					}
				}
				
				$this->data["Category"][] = $cat_id;
				if (!empty($this->data["name"]) && !empty($this->data["surname"])) {
					$this->data["title"] = $this->data["name"] . " " . $this->data["surname"];
				} 
				$this->data["status"] = "on";
				if (!$cardModel->save($this->data)) {
					throw new BeditaException(__("Registration failed. Please, try again",true));
				}
				
				$this->Transaction->commit();
				$this->userInfoMessage(__("Registration completed. Thanks",true));
			} catch (BeditaException $ex) {
				$this->Transaction->rollback();
				$this->log($ex->errorTrace());
				$this->userErrorMessage($ex->getMessage());
				$this->redirect($this->referer());
			}
			
			// get event detail and send email
			$this->modelBindings["Event"] = array("BEObject" => array("LangText"), "DateItem", "GeoTag");
			$event = $this->loadObj($this->params["form"]["event_id"]);
			
			$mailOptions = Configure::read("mailOptions");
			$data["to"] = $emailForm;
			$data["from"] =  $mailOptions["sender"];
			$data["subject"] = __("[BEdita Event Registration]", true) . " " . $event["title"];
			$data["replay_to"] = $mailOptions["reply_to"];
			$body = __("Hi", true);
			if (!empty($this->data["title"])) {
				$body .= " " . $this->data["title"];
			}
			$body .=  ",\n\n" . __("this is a reminder as you have been registered at the event", true);
			$body .= "\n\n\"". $event["title"] ."\"\n";
			$body .= __("start", true);
			$formatDate = Configure::read("dateTimePattern");
			$body .= ": " . strftime($formatDate, $this->convert_datetime($event["DateItem"][0]["start"])) . "\n";
			$body .= __("end", true);
			$body .= ": " . strftime($formatDate, $this->convert_datetime($event["DateItem"][0]["end"])) . "\n";
			$body .= __("address", true) . ": " . $event["GeoTag"][0]["address"] . "\n\n";
			$body .= __("For more information see the web page", true) . " " . $this->publication["public_url"] ."/". $event["nickname"] . "\n\n";
			$body .= __("See you soon", true) . "\n" . "BEdita staff";
			$body .= "\n\n\n-----\n" . $mailOptions["signature"];
			$data["body"] = $body;
			try {
				$this->BeHash->BeMail->sendMail($data);
			} catch (BeditaException $ex) {
				$this->log($ex->errorTrace());
			} catch (BeditaMailException $ex) {
				$this->log($ex->errorTrace());
			}
		}
		$this->redirect($this->referer());
	}
	
	private function convert_datetime($str) {
		list($date, $time) = explode(' ', $str);
		list($year, $month, $day) = explode('-', $date);
		list($hour, $minute, $second) = explode(':', $time);
		$timestamp = mktime($hour, $minute, $second, $month, $day, $year);
		return $timestamp;
	}
}

?>