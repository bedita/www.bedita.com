{strip}

{$view->element("_testata")}

<div class="main">
	
	<div class="content-main sitemap">
	
	{$beTree->sitemap($sections_tree, $publication.public_url)}
	
	</div>

</div>

{$view->element("_footer")}

{/strip}