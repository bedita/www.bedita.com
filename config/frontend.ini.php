<?php
/**
  * @author ste@channelweb.it
 * 
 *  frontend.ini.php - constants and global variables for bedita frontend + backend overrides
 * 
 */
 
require BEDITA_CORE_PATH . DS . "config" . DS . "bedita.ini.php";
include(APP. "config" . DS . "mapping.cfg.php");

//////////////////////////////////////////////////////
// EDITABLE STUFF         ///////////////
//////////////////////////////////////////////////////

/**
 * Publication id referenced by frontend, 
 * change if different from id = 1 (default)
 */
$config['frontendAreaId'] 	= 22;
$config['frontendNickname'] = 'beditafrontsite';

/**
 * show or not objects with status = draft
 * default: show only objects with status = ON
 */ 
$config['draft']            = false;


/**
 * staging site ? default: false -> production site
 */  
$config['staging'] 			= false;


/**
 * check the objects publication date and throw a 404 error if the publication date of the object requested 
 * is expired or is in the future
 */   
$config['filterPublicationDate'] = true;

/**
 * array of frontend groups that can access frontend
 * leave empty to define permissions at object level
 */
$config['authorizedGroups'] = array();


/**
 * user validation delegated to user himself with email confirm (false)
 * or moderated by administrators in User module (true or administrator's email)
 */
$config['userModerateSignup'] = false;


/**
 * default frontend language
 */
$config['frontendLang']     = 'eng';

/**
 * supported frontend languages
 */
$config['frontendLangs']    = array (
								 	"eng"	=> array("en", "english"),
								/* 	"ita"	=> array("it", "italiano"),
									
									"spa"	=> array("es", "espa&ntilde;ol"),
									"por"	=> array("pt", "portugu&ecirc;s"),
									"fra"	=> array("fr", "fran&ccedil;oise"),
									"deu"	=> array("de", "deutsch"),
								*/
								);

/**
 * maps of languages to autodetecting language choice 
 */
$config['frontendLangsMap'] = array(
	"it"	=> "ita",
	"en"	=> "eng",
	"en_us"	=> "eng",
	"en-us"	=> "eng",
	"en_gb"	=> "eng"
) ;

/**
 * show all contents in sitemap. If it's false show only sections' tree
 */ 
$config['sitemapAllContent'] = true;

/**
 * custom model bindings for BEdita objects (defaults defined in Model of BEdita object)
 */
//$config['modelBindings'] = array(
	//'Document' => array("BEObject" => array("LangText","RelatedObject", "GeoTag")),
	//'Event' => ...
	//...
//);

/**
 * frontend cookie names 
 */
$config["cookieName"] = array(
	"langSelect" => "wwwBEComLang"
);

/**
 * save history navigation
 
 * "sessionEntry" => number of history items in session
 * "showDuplicates" => false to not show duplicates in history session 
 * "trackNotLogged" => true save history for all users (not logged too)
 */
//$config["history"] = array(
//	"sessionEntry" => 5,
//	"showDuplicates" => false,
//	"trackNotLogged" => false
//);


?>
