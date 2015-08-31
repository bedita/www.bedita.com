{if !empty($sectionsTree)}
  <div id="sidebar-wrapper">
      <div class="intro">
        {$publication.description}
      </div>
      <ul class="sidebar-nav">

      {foreach $sectionsTree as $item}
          <li class="sidebar-brand">
            <a href="{if !empty($item.objects.1)}{$html->url($item.canonicalPath)}{else}{$html->url($item.objects.0.canonicalPath)}{/if}" {if !empty($section) && ($section.nickname == $item.nickname)}class="on"{/if}>
              {$item.title|truncate:20|default:"<i>[no title]</i>"}</a>
              {if !empty($submenu) && ($section.nickname == $item.nickname) or !empty($pathArray) && (in_array($item.nickname, $pathArray))}                
                {strip}
                <ul class="sub-menu">
                  {foreach $submenu as $subsection}
                    <li><a title="{$subsection.title}" href="{if !empty($subsection.objects.1)}{$html->url($subsection.canonicalPath)}{else}{$html->url($subsection.objects.0.canonicalPath)}{/if}" {if $section.nickname == $subsection.nickname}class="on"{/if}>{$subsection.title|default:''}</a></li>
                  {/foreach}
                </ul>
                {/strip}
              {/if}
        </li>
      {/foreach}
    </ul>
  </div>
{/if}