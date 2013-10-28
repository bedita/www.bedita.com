{strip}

{$view->element("_testata")}

<div class="main">

	<div class="content-main">

	
		<div class="subdocs">
		{if $section.nickname != "footer"}
				
			<ul class="js-listnews">
			{if (!empty($section.childContents[1]))}
				
				{foreach from=$section.childContents item="d" name="fc_listnews"}
				<li{if $smarty.foreach.fc_listnews.index > 4} style="display: none;" class="js-expandable"{/if}>
				<a href="{$html->url('/')}{$section.nickname}/{$d.nickname}" {if !empty($section.contentRequested) && $section.currentContent.nickname == $d.nickname}class="subon"{/if}>{$d.title}</a>
				<br/>
				<span style="font-style: italic; font-size: 0.8em;">{$d.publication_date|date_format:$conf->datePattern}</span>
				</li>
				{/foreach}
			
			{/if}
			</ul>
		
			<p style="font-size: 12px; margin-top: 20px;"><a href="javascript:void(0);" class="js-seemore-news">See more</a></p>
		{/if}
		</div>
		

		{if (!empty($section.contentRequested) && !empty($section.currentContent))}	
		
			{assign_concat var="objectNick" 1=$section.currentContent.nickname|default:'' 2=".tpl"}
			{assign_concat var="objtplfile" 1=$smarty.const.VIEWS 2="pages/" 3=$objectNick}
		
			{if file_exists($objtplfile)}
			
				{include file=$objtplfile}
				
			{else}
			
				{if (!empty($section.currentContent.abstract)) or (isset($section.currentContent.relations))}
				
					{assign var="class" value="twocols"}
					
				{/if}
			

				<div class="textC {$class|default:''}">
					<h3 style="margin-bottom: 15px;">{$section.currentContent.publication_date|date_format:$conf->datePattern}</h3>
					<h1>{$section.currentContent.title}</h1>
			
					<p class="testo">{$section.currentContent.body}</p>
					
					{assign_associative var="options" object=$section.currentContent showForm=true}
					{$view->element('show_comments', $options)}	
			
				</div>
					
			
				<div class="abstract {$class|default:''}">
			
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
						
						{if !empty($section.currentContent.relations.download)}
						<br/>
						<h2>{t}Download{/t}</h2>
						{assign var="down" value=$section.currentContent.relations.download|default:''}
						<ul>
						{section name="i" loop=$down}
							<li>
								<a title="{$down[i].title}" href="{$html->url('/download/')}{$down[i].nickname}" >
									{$down[i].title}
								</a>
							</li>
						{/section}
						</ul>
						{/if}

						{if !empty($section.currentContent.relations.seealso)}
						<br/>
						<h2>{t}See also{/t}</h2>
						{assign var="sa" value=$section.currentContent.relations.seealso|default:''}
						<ul>
						{section name="i" loop=$sa}
							<li>
								<a title="{$sa[i].title}" href="{$html->url('/')}{$sa[i].nickname}">
									{$sa[i].title}
								</a>
							</li>
						{/section}
						</ul>
						{/if}
						
				</div>
			
			{/if}
					
		{elseif !empty($section.childContents)}
			{assign_associative var="params" width=150 mode="fill" upscale=false}
			{assign_associative var="htmlAttr" width=150 style="float: right; margin: 0 10px 0 10px;"}
			<div class="textC">
				{foreach from=$section.childContents item="d" name="news"}
					{if $smarty.foreach.news.iteration <= 3}
						
						<div style="margin: 20px 0 30px; overflow: hidden;">		
							<h3 style="margin-bottom: 5px;">{$d.publication_date|date_format:$conf->datePattern}</h3>
							
							{if !empty($d.relations.attach)}
								<a href="{$html->url('/')}{$section.nickname}/{$d.nickname}">{$beEmbedMedia->object($d.relations.attach.0,$params,$htmlAttr)}</a>
							{/if}
							
							<h1><a href="{$html->url('/')}{$section.nickname}/{$d.nickname}">{$d.title}</a></h1>
							{assign var="continue" value=$d.body|html_substr:350:"..."}
					
							<p class="testo">
							{$continue}
							</p>
							{if $continue|count_characters > 353} 
							<a href="{$html->url('/')}{$section.nickname}/{$d.nickname}">{t}continue{/t}</a>
							{/if}
						</div>
						
					{/if}
				{/foreach}
			</div>
		{/if}
	
	</div>
</div>

	
		
{$view->element("_footer")}

		



{/strip}
