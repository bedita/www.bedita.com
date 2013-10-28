{$html->docType('xhtml-trans')}
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it" dir="ltr">
<head>
	<title>{$publication.public_name|default:$publication.title}{if !empty($section.currentContent.title)} - {$section.currentContent.title|truncate:"60"}{elseif !empty($section.title)} - {$section.title|truncate:"60"}{/if}  </title>

	<meta http-equiv="Content-Style-Type" content="text/css" />

	<link rel="icon" href="{$session->webroot}favicon.ico" type="image/gif" />
	<link rel="shortcut icon" href="{$session->webroot}favicon.gif" type="image/gif" />
	
	<meta name="description" content="{$publication.description}" />
	<meta name="author" content="{$publication.creator}" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	
	<meta name="BEdita.base" content="{$html->url('/')}" />
	<meta name="BEdita.webroot" content="{$html->webroot}" />
	 
    <!-- RTF dublin core dataset -->
    
    <link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
    <meta name="DC.title" 		content="{$publication.public_name|default:$publication.title}" />
    <meta name="DC.description" content="{$publication.description}" />
	<meta name="DC.language" 	content="{$publication.lang}" />
    <meta name="DC.creator" 	content="{$publication.creator}" />
    <meta name="DC.publisher" 	content="{$publication.publisher}" />
    <meta name="DC.date" 		content="{$publication.created}" />
	<meta name="DC.modified" 	content="{$publication.modified}" />
	<meta name="DC.format" 		content="text/html" />
	<meta name="DC.identifier"  content="{$publication.id}" />
    <meta name="DC.rights" 		content="{$publication.rights}" />
 	<meta name="DC.license" 	content="{$publication.license}" />

    <!-- end -->

	{if !empty($feedNames)}
		{foreach from=$feedNames item=feed}
		<link rel="alternate" type="application/rss+xml" title="{$feed.title}" href="{$html->url('/rss')}/{$feed.nickname}" />
		{/foreach}
	{/if}
	
	{$html->css('beditaBase')}
	{$html->css('thickbox.BEfrontend')}
	
	{$html->script("jquery")}
	{$html->script("jquery.pngFix.pack")}
	{$html->script("ui/ui.core.min")}
	{$html->script("ui/ui.draggable.min")}
	{$html->script("bedita")}
	{$html->script("jquery.thickbox.BEfrontend")}

<!--[if IE 6]>
	{literal}
	<style type="text/css">
		BODY {
		background-image: none !important;
		}
		
	</style>
	{/literal}
<![endif]-->


</head>


<body>


{$content_for_layout}

{if $conf->staging}{$view->element('staging_toolbar')}{/if}


{if empty($conf->staging) && !empty($publication.stats_code)}{$publication.stats_code}{/if}
</body>
</html>