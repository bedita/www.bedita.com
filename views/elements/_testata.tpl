{strip}

<div class="white"> </div>
<!--<div class="headmenu-short">
		<div class="toggle-menu-short"></div>
	</div>-->
<div class="headmenu">
	<div class="toggle-menu"></div>
	<ul class="menuP">
	{foreach from=$menu item="m" name="menuitems"}
	<li title="{$m.nickname}" 
		{*if ($section.nickname|default:'' == $menu[m].nickname|default:'')*}
		{if !empty($section) && ( $section.nickname|default:'' == $m.nickname|default:'' || !empty($section.pathSection[$m.id]) )}
			class="on"
		{/if}
		{if $smarty.foreach.menuitems.first}
			style="margin-left:0;"
		{/if}>

		<a title="{$m.title}" href="{$html->url('/')}{$m.nickname}">{$m.title}</a>
		{if $section.nickname == $m.nickname}
			{$view->element("_menu_left")}
		{/if}
		</li>
	{/foreach}
	</ul>
	
	{if !empty($banner)}
		<a class="banner" style="margin-left:0px;" href="{$banner.relations.link[0].url|default:''}">
			{$banner.body|default:''}
		</a>
	{/if}	
	<div class="github"><a href="https://github.com/bedita">
		<p>fork me on Github!</p></a></div>
</div>

<div class="top">

	<div class="lang">
	{if count($conf->frontendLangs) > 1}
	<ul 
		{foreach from=$conf->frontendLangs item="g" key="k"}
			<li>
				<a {if $currLang == $k}style="color:white;"{/if} title="{$g}" href="{$html->url('/')}lang/{$k}">{$g}</a>
			</li>
		{/foreach}

	</ul>
	{/if}
	</div>

	<div class="logo">
		<a title="{$publication.public_name}" href="{$html->url('/')}"><img src="{$html->webroot}img/BElogo24.png" alt="" /></a>
	</div>
{if !empty($section)}
	{if $section.nickname != "modules"}
		
			{section name=m loop=$moduleList max=3}
			<div class="{$moduleList[m]} logomoduli">
				&nbsp;
			</div> 
			{/section}
		
	{else}
	
		{if strstr($section.currentContent.nickname, 'modules-')}
			{section name=m loop=$moduleList max=3}
				<div class="{$moduleList[m]} logomoduli">
					&nbsp;
				</div>
			{/section}
		{else}
		<div class="moduli {$section.currentContent.nickname}">
			{$section.currentContent.title}
		</div>
		{/if}

	{/if}	

	<div class="strillo">
		{$publication.public_name|default:$publication.title}
	</div>
	
	<div class="illustrazione" style="margin-left:60px;">
		<img src="{$html->webroot}img/tree_corylus.png" style="margin-top:-36px; opacity: 0.7" />
	</div>
	
	
{else}

	<div class="strillo">
		{$publication.public_name|default:$publication.title}
	</div>
	
	<div class="illustrazione" style="margin-left:30px; ">

		<img src="{$html->webroot}img/albero.png" />
		
	</div>

{/if}

	<div class="topG"></div>

</div>
{/strip}

{*<a href="https://github.com/bedita/bedita" target="_blank"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_orange_ff7600.png" alt="Fork me on GitHub"></a>*}
