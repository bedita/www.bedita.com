{if $section.nickname != 'moduli'}


		{section name=l loop=$slideshow.Document}
		
		<div class="loop_1" style="display:block; z-index:1;">
			
			<img class="imloop" src="{$beThumb->image($slideshow.Document[l].relations.attach[0],260 ,219)}" />
			
			<br />
				<span class="slideH">{$slideshow.Document[l].title}</span>
				{$slideshow.Document[l].abstract}
		
			
		</div>
		
		{/section}






		{else}		
		
		<div class="loop_2" style="display:block; z-index:100;">
				
					<ul class="modules">
						<li class="galleries">gallerie</li>
						<div class="txtMod">
						<h2>Gallerie multimediali</h2>
						<h3>modulo 08</h3>
						</div>
					</ul>

		</div>	
		
		<div class="loop_2" style="display:block; z-index:100;">
				
					<ul class="modules">
						<li class="documents">documenti</li>
						<div class="txtMod">
						<h2>Documenti</h2>
						<h3>modulo 06</h3>
						</div>
					</ul>

		</div>	
		
		<div class="loop_2" style="display:block; z-index:100;">
				
					<ul class="modules">
						<li class="events">eventi</li>
						<div class="txtMod">
						<h2>Eventi</h2>
						<h3>modulo 03</h3>
						</div>
					</ul>

		</div>		

{/if}


