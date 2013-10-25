<h3>Language: {$currLang}</h3>
<h3>Frontend: {$conf->frontendNickname} - id {$conf->frontendAreaId} </h3>

<h3>Sections Tree</h3>
<pre>
{dump var=$sections}
</pre>

<a href="{$html->url('/pages/section/sezione1')}">sezione 1</a>
