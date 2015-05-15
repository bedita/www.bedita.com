{if !empty($sectionsTree)}
  <div id="sidebar-wrapper">
      <div class="intro">
        {$publication.description}
      </div>
      <ul class="sidebar-nav">

      {foreach $sectionsTree as $item}
          <li class="sidebar-brand">
            <a href="{$html->url($item.canonicalPath)}" {if !empty($section) && ($section.nickname == $item.nickname)}class="on"{/if}>
              {$item.title|truncate:20|default:"<i>[no title]</i>"}</a>
              {if !empty($submenu) && ($section.nickname == $item.nickname) or !empty($pathArray) && (in_array($item.nickname, $pathArray))}                
                <ul class="sub-menu">
                  {foreach $submenu as $subsection}
                    <li><a title="{$subsection.title}" href="{$subsection.canonicalPath}" {if $section.nickname == $subsection.nickname}class="on"{/if}>{$subsection.title|default:''}</a></li>
                  {/foreach}
                </ul>
              {/if}
        </li>
      {/foreach}
    </ul>
  </div>
{/if}