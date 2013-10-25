<div class="footer">
	
	<ul class="footel" style="max-width:140px;min-width:140px;width:140px; border:0px; margin-top:2px;">
	{if count($conf->frontendLangs) > 1}
		{foreach from=$conf->frontendLangs item="g" key="k"}
			<li>
				<a {if $currLang == $k}style="color:white;"{/if} title="{$g}" href="{$html->url('/')}lang/{$k}">{$g}</a>
			</li>
		{/foreach}
	{/if}
	</ul>
	
	<ul class="footel">
	{section name=m loop=$footer}
		{if $footer[m].nickname != "who-are-we"}
			{if $footer[m].nickname == "footer-resources"}
			<li>
				<h3>{$footer[m].title}</h3>
				{$footer[m].body}
			</li>
			{else}
			<li>
				<a title="{$footer[m].title}" href="{$html->url('/')}{$footer[m].nickname}">
				<h3>{$footer[m].title}</h3>
				{$footer[m].description|nl2br}
				</a>
			</li>
			{/if}

			{if $footer[m].nickname != "licensing" && $footer[m].nickname != "contact"}
			</ul>
			<ul class="footel">
			{/if}
		{else}
		<li>
			<h3>&copy; 2006-{$smarty.now|date_format:"%Y"}</h3>
			{$footer[m].description|nl2br}
		</li>
		{/if}
	{/section}
	</ul>
	
{*
	<ul class="footel" style="border:0px; width:140px;">
		<li>{$publication.public_name}<br />{$smarty.now|date_format:"%Y"}</li>
	</ul>
*}
</div>



