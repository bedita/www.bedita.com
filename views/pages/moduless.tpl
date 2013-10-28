{strip}

{$view->element("_testata")}

<div class="main">

	<div class="content-main">
	
		<div class="subdocs modules" style="margin-top:5px; padding-top:0px;">
			<ul>
			{assign var="objects" value=$ancestor.childContents|default:$section.childContents|default:""}
			
			{if !empty($submenu)}
				{foreach from=$submenu item="subsection"}
				<h1{if $section.id == $subsection.id} class="on"{/if}><a href="{$html->url('/')}{$subsection.nickname}">{$subsection.title}</a></h1>
				{if !empty($subsection.objects)}
					{if $subsection.nickname == "modules"}
						{foreach from=$subsection.objects item="d" name="contents"}
							{if $smarty.foreach.contents.index > 0}
							<li>
								<a href="{$html->url('/')}{$section.nickname}/{$d.nickname}" {if $section.currentContent.nickname == $d.nickname}class="subon"{/if}>
									
									<div class="{$d.nickname}" style="float:left; margin:0px 5px 0px -10px; width:15px; height:15px;">&nbsp;</div>	
											{$d.title}
									
								</a>
							</li>
							{/if}
						{/foreach}
					{else}
						{foreach from=$subsection.objects item="subContent"}
						<li><a title="" href="{$html->url('/')}{$subsection.nickname}/{$subContent.nickname}"
							{if $section.currentContent.nickname == $subContent.nickname}class="subon"{/if}>{$subContent.title}</a></li>
						{/foreach}
					{/if}
				{/if}
				{/foreach}
			{/if}
			
			
			</ul>
	
		
		</div>		
		
		<div class="textC twocols">
			
			<h1>{$section.currentContent.title}</h1>
	
			<p class="testo">{$section.currentContent.body}</p>

		</div>
		
		<div class="abstract twocols">
			
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
		
		
	</div>


	
</div>


{$view->element("_footer.tpl")}



{/strip}