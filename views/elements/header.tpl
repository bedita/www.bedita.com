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
            {*<img class="logo-big" src="{$html->url('/')}img/logo_w.png" alt="home" />
            <img class="logo-small" src="{$html->url('/')}img/be_w.png" alt="home" />*}
            <div class="logo-big">Bedita</div>
            <div class="logo-small">Bedita</div>
          </a>
        </div>

        {if !empty($topMenu)}
        <nav class="link-menu">
        <button class="btn dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            <span class="glyphicon-plus"></span>
        </button>          
            <div class="link-wrapper">
              {foreach $topMenu as $item}
                  <a class="navbar-brand menu-item" href="{$html->url($item.url)|default:$item.canonicalPath}" target="_blank">
                      {$item.title|default:""}
                  </a>
              {/foreach}
            </div>
        </nav>
        {/if}

      </div>
    </div>
