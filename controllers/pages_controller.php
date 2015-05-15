<?php

class PagesController extends FrontendController {

    public $helpers = array('BeFront');
    public $uses = array() ;
	
    /**
     * Load common data for all frontend pages
     */ 
    protected function beditaBeforeFilter() {
        $this->set('feedNames', $this->Section->feedsAvailable(Configure::read('frontendAreaId')));
        //$this->set('sectionsTree', $this->loadSectionsTree(Configure::read('frontendAreaId')));

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

    public function index() {
        
        /* segnalazioni */
        $homeItems = $this->loadSectionObjectsByNick("home-be");
        $this->set('homeItems', @$homeItems['childContents']);

    }
}
