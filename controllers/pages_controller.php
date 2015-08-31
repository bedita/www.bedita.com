<?php

class PagesController extends FrontendController {

    public $helpers = array('BeFront');
    public $uses = array() ;
    public $components =array('BeTree');
    
    /**
     * Load common data for all frontend pages
     */ 
    protected function beditaBeforeFilter() {
        $this->set('feedNames', $this->Section->feedsAvailable(Configure::read('frontendAreaId')));
        //$this->set('sectionsTree', $this->loadSectionsTree(Configure::read('frontendAreaId')));

        // vede se c'è la sezione menu
        $this->getMenu = $this->BeTree->getChildren($this->publication['id'], null, array('nickname'=>'menu'));

        if (!empty($this->getMenu['items'])) {

            $this->baseLevel = true;
            $this->set("sectionsTree", $this->loadSectionsTree('menu',true,array(),1));
            $this->baseLevel = false;

            $topMenu = $this->loadSectionObjectsByNick("top-menu");
            $this->set('topMenu', @$topMenu['childContents']);
            
            // get submenu
            if (!empty($this->params['pass'])) {   
                $path = $this->params['pass'];        
                $this->set('pathArray', $path);
                $this->set("submenu", $this->loadSectionsTree($path[1],true,array(),1));
            }

        }


        /* oggetti in footer */
        $footer = $this->loadSectionObjectsByNick("footer");
        $this->set('footer', @$footer['childContents']);
        
    }

    public function index() {
        if (!empty($this->getMenu['items'])) {
            /* oggetti in home */
            $homeItems = $this->loadSectionObjectsByNick("home-be");
            $this->set('homeItems', @$homeItems['childContents']);

            /* news */
            $homeNews = $this->loadSectionObjectsByNick("news", array('dim' => 4));
            $this->set('homeNews', @$homeNews['childContents']);
        }

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
}
