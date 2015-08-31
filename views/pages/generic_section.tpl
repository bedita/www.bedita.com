  <div id="wrapper">
    
    {$view->element('menu_left')}
    
    <div id="page-content-wrapper">
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        {$view->element('content')}
      </div>
    </div>

    <div class="container">
      {if empty($section.contentRequested)}
        <div class="row" id="content-block">
          {$view->element('list_contents')}
        </div>
      {/if}
      <hr>
      <footer>
        {$view->element('footer')}
        {$view->element('colophon')}
       </footer>

    </div> <!-- /container -->

  </div>
</div>