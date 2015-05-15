<?php
    // specific publication routing rules

    // DO NOT EDIT OR CHANGE BELOW!!
    Router::connect('/', array('controller' => 'pages', 'action' => 'index'));
    Router::connect('/*', array('controller' => 'pages', 'action' => 'route'));
