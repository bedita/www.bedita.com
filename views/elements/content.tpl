    {if !empty($section.currentContent)}
        {$content = $section.currentContent}
        <h1>{$content.title|default:'[no title]'}</h1>
        {if !empty($content.description)}
            <h2>{$content.description|strip_tags}</h2>
        {/if}
        {if !empty($section.contentRequested)}
            {if !empty($content.relations.attach)}
        	    <section>        	        
        	        {foreach $content.relations.attach as $item}


                    {if $item@iteration > 1}
                        {$options = ["mode" => "fill", "width" => 250, "modeparam" => "000000", "upscale" => true]}
                        {$htmlAttr = [style => "float: left; width: 250px; margin: 10px 10px 10px 0"]}
                    {else}
                        {$options = ["mode" => "fill", "width" => 500, "modeparam" => "000000", "upscale" => true]}
                        {$htmlAttr = [style => "float: left; width: 500px; margin: 10px 10px 10px 0", class=> "single-image"]}
                    {/if}
                    {$optionsBig = ["mode" => "fill", "longside" => 960, "URLonly" => true]}

                    <p>
        	          {if $item.object_type_id == $conf->objectTypes.image.id}
        	            <div class="img" {if $item@iteration is div by 4}style="margin-right:0px;"{/if}>
        	                <a rel="gallery" title="{$item.title}" data-href="{$beEmbedMedia->object($item, $optionsBig)}">
                                {$beEmbedMedia->object($item, $options, $htmlAttr)}
                            </a>
        	            </div>
        	            {if $item@iteration is div by 4}
        	            <br style="clear:both;" />
        	            {/if}
                        {elseif $item.object_type_id == $conf->objectTypes.video.id}
                        {* se è un video youtube *}
                        <div class="embed-responsive embed-responsive-16by9">
                          <iframe class="embed-responsive-item" src="{$item.body}"></iframe>
                        </div>
        	          {/if}
                    </p>
        	        {/foreach}
        	        <br style="clear:both;" />
        	    </section>                
                {* modale per i multimedia *}
                {$view->element('modal')}
            {/if}
        <p>{$content.abstract|default:''}</p>
        <p>{$content.body|default:''}</p>
        {else}
        <p>{$content.body|strip_tags|truncate:150|default:''}</p>
        <a class="btn btn-primary" href="{$html->url($content.canonicalPath)}" 
                role="button">Read more &raquo;</a>
        {/if}
    {/if}