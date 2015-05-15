<!DOCTYPE html>
<html lang="{$currLang2}">
<head>
	{$html->charset()}
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	{$beFront->metaAll()}
	{$beFront->metaDc()}
	{$beFront->metaOg()}
	
    {if $conf->version >= '3.5.2'}
        {$beFront->metaWebApp($publication.title, ['default' => 'apple-touch-icon.png'], '#000')}
    {/if}

    <link rel="icon" href="{$html->webroot}favicon.ico">

    <title>{$beFront->title()}</title>

    <!-- Bootstrap core CSS -->
    {$html->css('bootstrap.min')}

    <!-- Custom styles for this template -->
    {$html->css('jumbotron')}

    <!-- custom override CSS -->
    {$html->css('base')}

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    {$html->script('ie-emulation-modes-warning')}

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    {$html->script('ie10-viewport-bug-workaround')}

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- webfonts -->
    <link rel="stylesheet" href="https://code.cdn.mozilla.net/fonts/fira.css">
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,400italic,700,700italic,300italic,300' rel='stylesheet' type='text/css'>
    
    {$beFront->feeds()}

    {$scripts_for_layout}
  </head>

<body>
	{$view->element('header')}

	{$content_for_layout}

	{$view->element('footer')}

	{$beFront->stats()}

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    {$html->script('bootstrap.min')}
    {$html->script('base')}
</body>
</html>