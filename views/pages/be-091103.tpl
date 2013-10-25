

{include file="./inc/_testata.tpl"}

<div class="main">

	<div class="content-main">
	
	{include file="./inc/_menu_left.tpl"}
	
	





<script type="text/javascript">
var msg = "{t}The following fields are required{/t}";
var regEvent = false;
{if $msg->check('Message.error') || $msg->check('Message.info')}
	regEvent = true;
{/if}
{literal}

function checkFields(idForm) {
	$('#'+idForm+' :input').removeClass('warning');
	$('#'+idForm+' :input').each(function() {
		if ( $(this).is('.required') ) {
			if ( ($(this).attr('type') == "text" || $(this).attr('type') == "textarea") && !$(this).val() ) {
				$(this).addClass('warning');
			}
			else if ( $(this).attr('type') == "checkbox" && !$(this).attr("checked")) {
				$(this).addClass('warning');
			}
		}
	});
	
	var numWarnings = $('#'+idForm).find('.warning').length;

	if (numWarnings) {
		var fieldList = [ ];
		var text = "";
		$('#'+idForm+' .warning').each ( function() {
			text = $(this).prevAll("label:first").text();
			fieldList.push (text);
		});
		alert( msg + ": " + fieldList.join (', ') + ".");
		$('.warning:eq(0)').focus();
		return false;
	}

	return true;
}

$(document).ready(function() {

	if (regEvent) {
		$(".message").fadeIn("fast");
	}

	$("#register").click(function() {
		$(".message").fadeOut("fast");
	});

	$("#registrationForm").submit(function() {
		if (!checkFields("registrationForm"))
			return false;
		else
			return true;
	});
	
});
{/literal}
</script>

<div class="textC twocols">

	<h1 style="margin-bottom: 10px;">{$section.currentContent.title}</h1>
	
	<h5 style="display: inline;">{t}start{/t}:</h5> 
	<div style="display: inline;">{$section.currentContent.DateItem.0.start|date_format:$conf->datePattern} {$section.currentContent.DateItem.0.start|date_format:"%H:%M"}</div>
	<br/>
	<h5 style="display: inline;">{t}end{/t}:</h5> 
	<div style="display: inline;">{$section.currentContent.DateItem.0.end|date_format:$conf->datePattern} {$section.currentContent.DateItem.0.end|date_format:"%H:%M"}</div>
	<br/>
	<h5 style="display: inline;">{t}address{/t}:</h5> 
	<div style="display: inline;">{$section.currentContent.GeoTag.0.address}</div>
	
	<hr />
	
	
	<p class="testo">{$section.currentContent.body}</p>
	
	{assign_associative var="options" object=$section.currentContent showForm=true}
	{$view->element('show_comments', $options)}	

</div>
	

<div class="abstract twocols">

		<div id="registerForEvent">
		<h4>{t}Event registration{/t}</h4>
		<form id="registrationForm" method="post" action="{$html->url('/pages/eventRegistration')}">
		<input type="hidden" name="category" value="bedita@salaborsa"/>
		<input type="hidden" name="event_id" value="{$section.currentContent.id}"/>
		<label id="data[name]" for="data[name]">{t}name{/t}</label> <sup style="color: #FF4500;">*</sup><br/>
		<input type="text" name="data[name]" class="required"/><br/>
		
		<label id="data[surname]" for="data[surname]">{t}surname{/t}</label> <sup style="color: #FF4500;">*</sup><br/>
		<input type="text" name="data[surname]" class="required"/><br/>
		
		<label id="data[email]" for="data[email]">{t}email{/t}</label> <sup style="color: #FF4500;">*</sup><br/>
		<input type="text" name="data[email]" class="required"/><br/>
		
		{t}organisation{/t}<br/>
		<input type="text" name="data[company_name]"/><br/>
		<input id="register" type="submit" value="{t}register{/t}" style="width:164px; font-size:1em; padding:5px; border:1px solid silver; margin-top:20px;"/>
		<br/>
		<p style="margin-top: 10px; color: #FF4500;">
		<sup style="color: #FF4500;">*</sup> {t}required fields{/t}
		</p>
		</form>
		</div>
		
		<div class="message{if $msg->check('Message.error')} error
						   {elseif $msg->check('Message.info')} info{/if}" style="display:none;">
		{if ($msg->check('Message.error'))}
			{$msg->userMsg('error')}
		{elseif $msg->check('Message.info')}
			{$msg->userMsg('info')}
		{/if}
		</div>
		
		{assign var="item" value=$section.currentContent.relations.attach|default:''}
		<div style="margin-top: 40px;">
		{section name=g loop=$item}
			{assign_associative var="paramsBig" width=680 mode="fill" upscale=false URLonly=true}
			<div>
				{assign_associative var="params" width=220 mode="fill" upscale=false}
				<a class="thickbox" href="{$beEmbedMedia->object($item[g],$paramsBig)}" 
				title="{$item[g].description}" rel="gallery">
				{$beEmbedMedia->object($item[g],$params)}
				</a>
				<p class="dida">{$item[g].description}</p>
			</div>
		{/section}
		</div>

		
		{assign var="parents" value=$section.currentContent.relations.parent|default:''}
		<ul>
		{section name="i" loop=$parents}
			<li>
				<a title="{$parents[i].title}" href="{$html->url('/')}{$parents[i].nickname}">
					{$parents[i].title}
				</a>
			</li>
		{/section}
		</ul>
		
		{if !empty($section.currentContent.relations.link)}
		<h2>{t}Links{/t}</h2>
		{assign var="links" value=$section.currentContent.relations.link|default:''}
		<ul>
		{section name="i" loop=$links}
			<li>
				<a title="{$links[i].title}" href="{$links[i].url}" target="{$links[i].target|default:'_blank'}">
					{$links[i].title}
				</a>
			</li>
		{/section}
		</ul>
		{/if}
		
		{if !empty($section.currentContent.relations.download)}
		<br/>
		<h2>{t}Download{/t}</h2>
		{assign var="down" value=$section.currentContent.relations.download|default:''}
		<ul>
		{section name="i" loop=$down}
			<li>
				<a title="{$down[i].title}" href="{$html->url('/download/')}{$down[i].nickname}" >
					{$down[i].title}
				</a>
			</li>
		{/section}
		</ul>
		{/if}
		
</div>

</div></div>