{strip}

{include file="./inc/_testata.tpl"}

<div class="main">
	
	<div class="content-main sitemap">
	
	{$beTree->sitemap($sections_tree, $publication.public_url)}
	
	</div>

</div>

{include file="./inc/_footer.tpl"}

{/strip}