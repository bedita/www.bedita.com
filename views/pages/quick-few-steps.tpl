{strip}

{$view->element("_testata")}



<div class="main">

	
	<div class="content-main">
	
	{$view->element("_menu_left")}

	<div class="textC" style="padding:0px 0px 0px 20px;">
		<h1>{$section.currentContent.title}</h1>
		<h2>{$section.currentContent.description}</h2>
		
		{assign var="item" value=$section.currentContent.relations.attach[0]}
		{assign_associative var="params" width=570 mode="fill" upscale=false}
		{assign_associative var="htmlAttributes" style="margin-bottom:10px"}
		{if !empty($item)}{$beEmbedMedia->object($item,$params, $htmlAttributes)}{/if}
		
		{$section.currentContent.body}

	</div>
	{*
		<div class="abstract" style="padding-top:0px;"></div>
		*}
	</div>

	
</div>


{$view->element("_footer")}






{/strip}