{if !empty($section.childContents)}
    {foreach $section.childContents as $content}
       {if $content@index gt 0}
       <div class="col-md-4 col-item" style="background-color:#{$content.customProperties.color|default:''}">
         <h2>{$content.title|default:''}</h2>
         <p>{$content.body|strip_tags|truncate:200|default:"<i>[no body]</i>"}</p>
         <p><a class="{if !empty($content.customProperties.color)}btn btn-default{else}main-link{/if}" href="{$html->url($content.canonicalPath)}" 
            role="button">Read more &raquo;</a></p>
        </div>
       {/if}
    {/foreach}
{else}
       <div class="col-md-4">
         <p>{t}Section is empty{/t}</p>
       </div>
{/if}
