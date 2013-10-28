

{$view->element("_testata")}

<div class="main">

	<div class="content-main">

	<div class="subdocs">

		<ul>
		
		{assign var="objects" value=$ancestor.childContents|default:$section.childContents|default:""}
		
		{if !empty($objects)}
			{foreach from=$objects item="object"}
			<li><a href="{$html->url('/')}{$ancestor.nickname|default:$section.nickname}/{$object.nickname}" 
			{if $section.currentContent.nickname == $object.nickname}class="subon"{/if}>{$object.title}</a></li>
			{/foreach}
		{/if}
		
		{if !empty($submenu)}
			{foreach from=$submenu item="subsection"}
			<h1{if $section.id == $subsection.id} class="on"{/if}><a href="{$html->url('/')}{$subsection.nickname}">{$subsection.title}</a></h1>
			{if !empty($subsection.objects)}
				{foreach from=$subsection.objects item="subContent"}
				<li><a title="" href="{$html->url('/')}{$subsection.nickname}/{$subContent.nickname}"
					{if !empty($section.contentRequested) && $section.currentContent.nickname == $subContent.nickname}class="subon"{/if}>{$subContent.title}</a></li>
				{/foreach}
			{/if}
			{/foreach}
		{/if}
		</ul>

	</div>

	
	<div class="textC twocols">
	{if empty($section.contentRequested) && !empty($section.childContents)}
	
		{foreach from=$section.childContents item="post"}
			<h1><a href="{$html->url('/')}{$section.nickname}/{$post.nickname}">{$post.title}</a></h1>
			{if !empty($post.description)}
				<h2 class="post_description">{$post.description}</h2>
			{else}
				<h2 class="post_description">{$post.body|html_substr:200:"..."}</h2>
			{/if}
			
			<div style="margin-left:0px; border-left:0px solid silver; padding-bottom:5px; border-bottom:1px solid silver; font-size: 0.9em;">
			{t}published on{/t} {$post.publication_date|date_format:$conf->datePattern}&nbsp;
			{t}by{/t} <span style="font-weight: bold;">{$post.UserCreated.realname}</span>
			{if !empty($post.Tag)}
				<br/>
				tag:&nbsp;
				{foreach from=$post.Tag item="tag" name="t"}
					<a href="{$html->url('/tag/')}{$tag.name|replace:' ':'+'}">{$tag.label}</a>{if !$smarty.foreach.t.last},&nbsp;{/if}
				{/foreach}
			{/if}
			</div>
			
			<div style="margin-bottom:30px;">
			<a href="{$html->url('/')}{$section.nickname}/{$post.nickname}">{t}continue{/t}</a>
			</div>
			
		{/foreach}
	
	{elseif (!empty($section.currentContent))}
		
		<h1>{$section.currentContent.title}</h1>
		
		{if !empty($section.currentContent.description)}
			<h2 class="post_description">{$section.currentContent.description}</h2>
		{/if}
		
		<div style="margin-left:0px; border-left:0px solid silver; padding-bottom:5px; border-bottom:1px solid silver; font-size: 0.9em;">
		{t}published on{/t} {$section.currentContent.publication_date|date_format:$conf->datePattern}&nbsp;
		{t}by{/t} <span style="font-weight: bold;">{$section.currentContent.UserCreated.realname}</span>
		{if !empty($section.currentContent.Tag)}
			<br/>
			tag:&nbsp;
			{foreach from=$section.currentContent.Tag item="tag" name="t"}
				<a href="{$html->url('/tag/')}{$tag.name|replace:' ':'+'}">{$tag.label}</a>{if !$smarty.foreach.t.last},&nbsp;{/if}
			{/foreach}
		{/if}
		</div>
		
		<div class="testo" style="padding-left:30px;">
		{$section.currentContent.body}
		</div>

		{assign_associative var="options" object=$section.currentContent showForm=true}
		{$view->element('show_comments', $options)}
		
	{/if}
	</div>
		
	<div class="abstract twocols">
	{if !empty($section.contentRequested)}
		{$section.currentContent.abstract|default:''}
		
		{assign var="item" value=$section.currentContent.relations.attach|default:''}
		{section name=g loop=$item}
			{assign_associative var="paramsBig" width=680 mode="fill" upscale=false URLonly=true}
			<div>
				{assign_associative var="params" width=220 mode="fill" upscale=false}
				<a class="thickbox" href="{$beEmbedMedia->object($item[g],$paramsBig)}" 
				title="{$item[g].description}" rel="gallery">
				{$beEmbedMedia->object($item[g],$params)}
				</a>
				<p class="dida">{$item[g].description}</p>
			</div>
		{/section}
		
		{assign var="parents" value=$section.currentContent.relations.parent|default:''}
		<ul>
		{section name="i" loop=$parents}
			<li>
				<a title="{$parents[i].title}" href="{$html->url('/')}{$parents[i].nickname}">
					{$parents[i].title}
				</a>
			</li>
		{/section}
		</ul>
		
		{if !empty($section.currentContent.relations.link)}
			<h2>{t}Links{/t}</h2>
		{/if}
		{assign var="links" value=$section.currentContent.relations.link|default:''}
		<ul>
		{section name="i" loop=$links}
			<li>
				<a title="{$links[i].title}" href="{$links[i].url}" target="{$links[i].target|default:'_blank'}">
					{$links[i].title}
				</a>
			</li>
		{/section}
		</ul>
	{/if}
		
	{if !empty($listTags)}
		<div style="margin-top: 40px; width:220px;">
		<h2>{t}Tag cloud{/t}</h2>
		
		{foreach from=$listTags item=tag}
			<a title="{$tag.weight}" class="tagCloud {$tag.class|default:""}" href="{$html->url('/tag/')}{$tag.name|replace:' ':'+'}">
				{$tag.label}
			</a>
		{/foreach}
		
		</div>
	{/if}
	</div>
		
	
	
	</div>
	
	
</div>	
		
{$view->element("_footer")}


