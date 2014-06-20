{strip}

{$view->element("_testata")}

<link rel="stylesheet" href="/bedita/frontends/www.bedita.com/css/flexslider.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="/bedita/frontends/www.bedita.com/js/jquery.flexslider.js"></script>

<div class="main home index">

	<div class="content-main">
	
{if (!empty($section.currentContent))}

	{if $section.currentContent.object_type == "Gallery"}

		{$view->element("_galleria")}
		
	{else}
	
	{if (!empty($section.currentContent.abstract)) or (isset($section.currentContent.relations))}
	
		{assign var="class" value="twocols"}
		
	{/if}

	{if empty($section.childContents)}
	<div class="textC {$class|default:''} {$section.currentContent.nickname}">
		
		<h1>{$section.currentContent.title}</h1>

		<p class="testo">{$section.currentContent.body}</p>
		
		{assign_associative var="options" object=$section.currentContent showForm=true}
		{$view->element('show_comments', $options)}	

	</div>
	{else}
		{foreach from=$section.childContents item=child}
			<div class="textC {$class|default:''} {$child.nickname}">
		
				<h1>{$child.title}</h1>

				<p class="testo">{$child.body}</p>

				{assign var="item" value=$child.relations.attach|default:''}
			

			<div class="flexslider">
				
				<ul class="slides">

				{section name=g loop=$item}
				
					{assign_associative var="paramsBig" width=244 mode="fill" upscale=false URLonly=true}
					<li>
						{assign_associative var="params" width=900 mode="fill" upscale=false}
						{assign_associative var="htmlAttr" width=500}
						{if $item[g].object_type_id == $conf->objectTypes.image.id}
							<a class="thickbox" href="{$beEmbedMedia->object($item[g],$paramsBig)}" 
							title="{$item[g].title}" rel="gallery">
							{$beEmbedMedia->object($item[g],$params)}
							</a>
						{elseif $item[g].object_type_id == $conf->objectTypes.video.id}
							{$beEmbedMedia->object($item[g],null,$htmlAttr)}
						{else}
							{assign_associative var="params" URLonly=true}
							<a href="{$beEmbedMedia->object($item[g],$params,$htmlAttr)}" title="{$item[g].title|replace:'<br/>':' -  '}"  alt="{$item[g].title|replace:'<br/>':' -  '}">{$item[g].title}</a>
						{/if}
						{if !empty($item[g].description)}<p class="dida">{$item[g].description}</p>{/if}
					</li>
					
				{/section}

				</ul>
			</div>

				{assign_associative var="options" object=$child showForm=true}
				{$view->element('show_comments', $options)}	

			</div>
		{/foreach}
	{/if}

{* copia di menu left *}
	<div class="subdocs">

		<ul>
		
		{assign var="objects" value=$ancestor.childContents|default:$section.childContents|default:""}
			
		{if !empty($objects[1])}
			{foreach from=$objects item="object"}
			<li><a href="{$html->url('/')}{$ancestor.nickname|default:$section.nickname}/{$object.nickname}" rel="{$object.nickname}" target="scroll"
			{if $section.currentContent.nickname == $object.nickname}class="subon"{/if}>{$object.title}</a></li>
			{/foreach}
		{/if}

		{if !empty($submenu)}
			{foreach from=$submenu item="subsection"}
			<a href="{$html->url('/')}{$subsection.nickname}"><h1{if $section.id == $subsection.id} class="on"{/if}>{$subsection.title}</h1></a>
			{if !empty($subsection.objects)}
				{foreach from=$subsection.objects item="subContent" name="contents"}
					
					<li><a title="" href="{$html->url('/')}{$subsection.nickname}/{$subContent.nickname}" rel="{$subContent.nickname}" target="scroll"
						{if $section.currentContent.nickname == $subContent.nickname}class="subon"{/if}>{$subContent.title}</a></li>
					
				{/foreach}
			{/if}
			{/foreach}
		{/if}
		
		</ul>

	</div>

	<div class="abstract {$class|default:''} {$section.currentContent.nickname}">

			<div>{$section.currentContent.abstract|default:''}</div>
			{*
			{assign var="item" value=$section.currentContent.relations.attach|default:''}
			{section name=g loop=$item}
				{assign_associative var="paramsBig" width=680 mode="fill" upscale=false URLonly=true}
				<div>
					{assign_associative var="params" width=500 mode="fill" upscale=false}
					{assign_associative var="htmlAttr" width=500}
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
			*}
			
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


		
{$view->element("_footer")}


{/strip}
