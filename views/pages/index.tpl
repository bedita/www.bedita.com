  <div id="wrapper">
    
    {$view->element('menu_left')}
    
    <div id="page-content-wrapper">

    <div id="home-container">
      
        <div class="container-fluid" id="content-block">
          {foreach $homeItems as $content}
           {if $content@first}
            <!-- Main jumbotron for a primary marketing message or call to action -->
            <div class="jumbotron">
            
                <h1>{$content.title|default:''}</h1>
                 <p>{$content.body|strip_tags|truncate:200|default:"<i>[no body]</i>"}</p>
                 <p><a class="btn btn-default" href="{$html->url($content.canonicalPath)}" 
                    role="button">View details &raquo;</a></p>
                </div>
             
            </div>
          
        {else}

            <div class="col-md-4 col-item" style="background-color:#{$content.customProperties.color|default:''}">
            
            {if !empty($content.relations.attach)}
            {$options = ["mode" => "crop", "width" => 200, "height" => 200, "modeparam" => "000000", "upscale" => true]}
            {assign var=item value=$content.relations.attach.0}          
            <div class="img">
                <a rel="gallery" title="{$item.title}">{$beEmbedMedia->object($item, $options)}</a>
            </div>
            {/if}
              
              <h2>
              {if $content.object_type == 'Link'}
                <a href="{$content.url}" target="_blank"><h2>{$content.title|default:''}</h2></a>
              {else}
                {$content.title|default:''}
              {/if}
              </h2>
               
               {if $content.object_type != 'Link'}
               <p>{$content.body|strip_tags|truncate:200|default:"<i>[no body]</i>"}</p>
               
                <p><a class="btn btn-default" href="{$html->url($content.canonicalPath)}" 
                  role="button">View details &raquo;</a></p>
              {/if}
            </div>
           {/if}
        {/foreach}
        </div>
        <hr>

        <footer>
          <p>&copy; Company {$smarty.now|date_format:"%Y"}</p>
        </footer>
      

    </div> <!-- /container -->

  </div>
</div>