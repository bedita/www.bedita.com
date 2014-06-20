<div class="subdocs">

	<ul class="{$section.nickname}">
	
	{assign var="objects" value=$ancestor.childContents|default:$section.childContents|default:""}
		
	{if !empty($objects[1])}
		{foreach from=$objects item="object"}
		<li><a href="{$html->url('/')}{$ancestor.nickname|default:$section.nickname}/{$object.nickname}" rel="{$object.nickname}" 
		{if $section.currentContent.nickname == $object.nickname}class="subon"{/if}>{$object.title}</a></li>
		{/foreach}
	{/if}

	{if !empty($submenu)}
		{foreach from=$submenu item="subsection"}
		<a href="{$html->url('/')}{$subsection.nickname}"><h1{if $section.id == $subsection.id} class="on"{/if}>{$subsection.title}</h1></a>
		{if !empty($subsection.objects)}
			{foreach from=$subsection.objects item="subContent" name="contents"}
				
				<li><a title="" href="{$html->url('/')}{$subsection.nickname}/{$subContent.nickname}" rel="{$subContent.nickname}"
					{if $section.currentContent.nickname == $subContent.nickname}class="subon"{/if}>{$subContent.title}</a></li>
				
			{/foreach}
		{/if}
		{/foreach}
	{/if}
	
	</ul>

</div>
