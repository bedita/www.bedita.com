{if !empty($glossary)}
	<h1>{$glossary.title}</h1>

	{if !empty($glossary.description)}

		<div id="glossarydescription">{$glossary.description}</div>

	{/if}
{else}
	<h1>oops :(</h1>
	<div id="glossarydescription">definition term not found</div>
{/if}