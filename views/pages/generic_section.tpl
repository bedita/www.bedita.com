{strip}

{include file="./inc/_testata.tpl"}

<div class="main">

	<div class="content-main">
	
	{include file="./inc/_menu_left.tpl"}

{if (!empty($section.currentContent))}

	{if $section.currentContent.object_type == "Gallery"}

		{include file="./inc/_galleria.tpl"}
		
	{else}
	
	{if (!empty($section.currentContent.abstract)) or (isset($section.currentContent.relations))}
	
		{assign var="class" value="twocols"}
		
	{/if}
	
	<div class="textC {$class|default:''}">
		
		<h1>{$section.currentContent.title}</h1>

		<p class="testo">{$section.currentContent.body}</p>
		
		{assign_associative var="options" object=$section.currentContent showForm=true}
		{$view->element('show_comments', $options)}	

	</div>
		
	<div class="abstract {$class|default:''}">

			<div>{$section.currentContent.abstract|default:''}</div>
			
			{assign var="item" value=$section.currentContent.relations.attach|default:''}
			{section name=g loop=$item}
				{assign_associative var="paramsBig" width=680 mode="fill" upscale=false URLonly=true}
				<div>
					{assign_associative var="params" width=220 mode="fill" upscale=false}
					{assign_associative var="htmlAttr" width=270}
					{if $item[g].object_type_id == $conf->objectTypes.image.id}
						<a class="thickbox" href="{$beEmbedMedia->object($item[g],$paramsBig)}" 
						title="{$item[g].description}" rel="gallery">
						{$beEmbedMedia->object($item[g],$params)}
						</a>
					{elseif $item[g].object_type_id == $conf->objectTypes.video.id}
						{$beEmbedMedia->object($item[g],null,$htmlAttr)}
					{else}
						{assign_associative var="params" URLonly=true}
						<a href="{$beEmbedMedia->object($item[g],$params,$htmlAttr)}" title="{$item[g].title|replace:'<br/>':' -  '}"  alt="{$item[g].title|replace:'<br/>':' -  '}">{$item[g].title}</a>
					{/if}
					{if !empty($item[g].description)}<p class="dida">{$item[g].description}</p>{/if}
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

			{assign var="download" value=$section.currentContent.relations.download|default:''}
			<ul>
			{section name="i" loop=$download}
				<li>
					<a title="{$download[i].title}" href="{$html->url('/download/')}{$download[i].nickname}">
						{$download[i].title}
					</a>
					{if !empty($download[i].description)}
						<br/>
						{$download[i].description}
					{/if}
					{if !empty($download[i].creator)}<br/>by <span style="font-style: italic">{$download[i].creator}</span>{/if}
				</li>
			{/section}
			</ul>

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
			
	</div>
		
	{/if}	
		
	</div>
	
{/if}
	
</div>	
		
{include file="./inc/_footer.tpl"}


{/strip}
