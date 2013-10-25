{$html->docType('xhtml-trans')}
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it" dir="ltr">
<head>
	<title>BEdita | Error 404 - Missing page</title>
	{$html->css('beditaBase')}

</head>
<body>

<div class="top">

	<div class="logo">
		<a title="BEdita" href="{$html->url('/')}"><img src="{$html->webroot}img/BElogo24.png" alt="" /></a>
	</div>
	<div class="documents logomoduli">&nbsp;</div>
	<div class="events logomoduli">&nbsp;</div>
	<div class="galleries logomoduli">&nbsp;</div>

	<div class="strillo" style="font-size: 12pt">
		<h1>Page not found</h1>
		We're sorry, the requested URL is not available, you may want to:
		<ul>
			<li><a href="{$html->url('/')}">go to home page</a></li>
			<li style="line-height:1.15em">	
				<a href="javascript:history-back(-1)">go back to previous page</a>
			</li>
		</ul>
	</div>

	<div class="illustrazione" style="margin-left:30px;">
		<img src="{$html->webroot}img/tree_ulmus.png" style="margin-top:13px;" />
	</div>
		
</div>

</body>