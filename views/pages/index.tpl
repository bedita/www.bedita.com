  <div id="wrapper">
    
    {$view->element('menu_left')}
    
    <div id="page-content-wrapper">

    <div id="home-container">
        <!-- elementi in home -->
        <div class="container-fluid" id="content-block">
          {foreach $homeItems as $content}
              {if $content@first}
                  <!-- Main jumbotron for a primary marketing message or call to action -->
                  <div class="jumbotron">                  
                      <h1>{$content.title|default:''}</h1>
                      {if !empty($content.description) or !empty($content.body)}
                          <h2>{$content.description|default:$content.body|strip_tags|truncate:200|default:''}<h2>
                      {/if}
                       <p><a class="btn btn-default" href="{$html->url($content.canonicalPath)}" 
                          role="button">Read more &raquo;</a></p>
                      </div>                   
                  </div>                  
              {else}
                  <div class="col-md-4 col-item{if $content.object_type == 'Link'} link{/if}" style="background-color:#{$content.customProperties.color|default:''}">
                  
                  {if !empty($content.relations.attach)}
                  {$options = ["mode" => "crop", "width" => 200, "height" => 200, "modeparam" => "000000", "upscale" => true]}
                  {assign var=item value=$content.relations.attach.0}          
                  <div class="img">
                      <a rel="gallery" title="{$item.title}">{$beEmbedMedia->object($item, $options)}</a>
                  </div>
                  {/if}
                    
                    <h2>
                    {if $content.object_type == 'Link'}
                      {*<span class="glyphicon glyphicon-download" aria-hidden="true" style="display:inline;"></span>*}
                      <a href="{$content.url}" target="_blank">
                        <span style="display:inline; vertical-align:top;">{$content.title|default:''}</span>
                      </a>
                    {else}
                      {$content.title|default:''}
                    {/if}
                    </h2>
                     
                     {if $content.object_type != 'Link'}
                     <h3>{$content.description|strip_tags|default:""}</h3>
                     {*<p>{$content.body|strip_tags|truncate:300|default:""}</p>*}
                     
                      <p><a class="btn btn-default" href="{$html->url($content.canonicalPath)}" 
                        role="button">Read more &raquo;</a></p>
                    {/if}
                  </div>
              {/if}
          {/foreach}
        </div>

        <hr style="clear:both;" />
        <!-- ultime news -->
        <div id="news-block">
          <h1>Latest news</h1>
          {foreach $homeNews as $content}
            
              <div class="col-md-3 col-item">
                <h2>       
                  {$content.title|default:''}
                </h2>

                 <p>{$content.body|strip_tags|truncate:200|default:"<i>[no body]</i>"}</p>
                 
                  <p><a class="main-link" href="{$html->url($content.canonicalPath)}" 
                    role="button">Read more &raquo;</a></p>
              </div>          
            {/foreach}
        </div>

        <hr style="clear:both;" />

        <footer>
          {$view->element('footer')}
          <p>&copy; chialab & channelweb {$smarty.now|date_format:"%Y"}</p>
        </footer>
      

    </div>
    <!-- /container -->

  </div>
</div>

