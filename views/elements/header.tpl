    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" id="menu-toggle">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{$html->url('/')}">
            <img class="logo-big" src="{$html->url('/')}img/logo_w.png" alt="home" />
            <img class="logo-small" src="{$html->url('/')}img/be_w.png" alt="home" />
          </a>
        </div>

      
        {if !empty($topMenu)}
        <nav>
          
            {foreach $topMenu as $item}
                <a class="navbar-brand menu-item" href="{$html->url($item.url)}">
                    {$item.title|truncate:20|default:"<i>[no title]</i>"}
                </a>
            {/foreach}
        </nav>
        {/if}
        

        {*
        <div class="navbar-collapse collapse">
        {if !empty($BEAuthUser)}
          <div class="navbar-right">
             <span class="navbar-brand">Hi, {$BEAuthUser.realname}</span>
             <a class="navbar-brand" href="{$html->url('/logout')}">[Logout]</a>
          </div>
        {else}
          {$view->element('form_login')}
        {/if}
        </div><!--/.navbar-collapse -->
        *}
      </div>
    </div>
