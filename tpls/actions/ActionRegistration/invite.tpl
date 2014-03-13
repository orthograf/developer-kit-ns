{extends file="themes/$sSkinTheme/layouts/default_light.tpl"}

{block name="layout_vars"}
    {$noSidebar=true}
{/block}

{block name="layout_content"}


<h2 class="page-header">{$aLang.registration_invite}</h2>

<form action="{router page='registration'}invite/" method="POST" class="form-horizontal">
	<div class="control-group">
		<label class="control-label">{$aLang.registration_invite_code}:</label>
		<div class="controls">
			<input type="text" name="invite_code" class="span3" />
		</div>
	</div>
	
	<div class="control-group">
		<div class="controls">
			<input type="submit" name="submit_invite" value="{$aLang.registration_invite_check}" class="btn" />
		</div>
	</div>
</form>
{/block}
