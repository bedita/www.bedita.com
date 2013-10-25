{if !empty($section.currentContent.relations)}
<h3>&nbsp;</h3>

			{assign var="seealso" value=$section.currentContent.relations.seealso|default:''}
			{if !empty($seealso)}
			<div class="related">
			<h2>See also:</h2>
			<ul>
			{section name="i" loop=$seealso}
				<li>
					<a title="{$seealso[i].title}" href="{$html->url('/')}{$seealso[i].nickname}">
						{$seealso[i].title}
					</a>
				</li>
			{/section}
			</ul>
			</div>
			{/if}
			
			{assign var="links" value=$section.currentContent.relations.link|default:''}
			{if !empty($links)}
			<div class="related">
			<h2>Links:</h2>
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
			
			{assign var="downloads" value=$section.currentContent.relations.download|default:''}
			{if !empty($download)}
			<div class="related">
			<h2>Download:</h2>
			<ul>
			{section name="i" loop=$downloads}
				<li>
					<a title="{$downloads[i].title}" href="{$html->url('/')}download/{$downloads[i].nickname}">
						{$downloads[i].title|default:$downloads[i].nickname}
					</a>
				</li>
			{/section}
			</ul>
			</div>
			{/if}
			
{/if}