<?php
/**
  * @author ste@channelweb.it
 * 
 *  frontend.ini.php - constants and global variables for bedita frontend + backend overrides
 * 
 */
 
require_once(BEDITA_CORE_PATH . DS . "config" . DS . "bedita.ini.php") ;
if (file_exists (BEDITA_CORE_PATH . DS . "config" . DS . "bedita.cfg.php") ) {
	include(BEDITA_CORE_PATH . DS . "config" . DS . "bedita.cfg.php") ;	
}

//////////////////////////////////////////////////////
// EDITABLE STUFF         ///////////////
//////////////////////////////////////////////////////
$config['sitemapAllContent'] = true;
$config['authorizedGroups'] = array('frontend');

$config['draft']            = false;
$config['staging']          = false;
$config['frontendNickname'] = 'beditafrontsite';
$config['frontendAreaId'] = 22;
$config['frontendUser']     = array ("userid" => null);
$config['frontendLang']     = 'eng';
$config['frontendLangs']    = array (
									"eng"	=> "english",
								/*	
									"ita"	=> "italiano",
									"spa"	=> "espa&ntilde;ol",
									"por"	=> "portugu&ecirc;s",
									"fra"	=> "fran&ccedil;oise",
									"deu"	=> "deutsch"
								*/
								);

$config['frontendLangsMap'] = array(
	"it"	=> "ita",
	"en"	=> "eng",
	"en-us"	=> "eng",
	"en_us"	=> "eng",
	"en_gb"	=> "eng"
) ;

$config["cookieName"] = array(
	"langSelect" => "wwwBEComLang"
);

$config['blip'] = array(
	"width"		=> 320,
	"height"	=> 200,
	"urlinfo" 	=> "http://www.blip.tv/file/%s?skin=json",
	"urlembed" 	=> "http://blip.tv/syndication/copypaste/?item_type=file&id=%s&skin=json&callback=DoSomethingActions.legacySelector.gotEmbedCode",
	"urlembed"	=> "http://www.blip.tv/players/embed/?posts_id=%s&players_id=-1&skin=json&callback=DoSomethingActions.playerSelector.gotEmbedCode"
) ;

$config['youtube'] = array(
	"width"		=> 320,
	"height"	=> 200,
) ;

?>
