{if empty($object) && !empty($section.currentContent)}
	{assign var="object" value=$section.currentContent}
{/if}

{if $object.comments != "off"}
	
	<div style="border-top: 1px solid silver; width: 100%; height: 1px;margin-bottom:50px;"><span></span></div>
	
	{if !empty($object.Comment)}
		
		{foreach from=$object.Comment item="comment" name="fc_com"}
	
			{if $smarty.foreach.fc_com.index == 0}
				<h3>{$smarty.foreach.fc_com.total}&nbsp; 
				{if $smarty.foreach.fc_com.total == 1}{t}Comment{/t}{else}{t}Comments{/t}{/if}</h3>
			{/if}
			
			<a name="comment-{$comment.id}"></a>
			<div class=commentContainer>
				<h3>
				{if !empty($comment.url)}
					<a href="{$comment.url}" rel="nofollow" target="_blank">{$comment.author}</a>
				{else}
					{$comment.author}
				{/if}
				</h3>
				
				<p>{$comment.created|date_format:$conf->datePattern}</p>
				
				<p>{$comment.description|nl2br}</p>
			</div>
		{/foreach}
		<div style="border-top: 1px solid silver; width: 100%; height: 1px;margin-bottom:20px;"><span></span></div>
	{/if}

	{if !empty($showForm)}{$view->element('form_comments')}{/if}
	
{/if}