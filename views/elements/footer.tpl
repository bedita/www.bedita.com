<div class="footer-menu">
{foreach $footer as $item}
    <a href="{$item.canonicalPath}" title="{$item.title}">{$item.title}</a>
{/foreach}
</div>