{extends file="themes/$sSkinTheme/layouts/default_light.tpl"}

{block name="layout_vars"}
    {$noSidebar=true}
{/block}

{block name="layout_content"}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#reminder-form').bind('submit',function(){
			ls.user.reminder('reminder-form');
			return false;
		});
		$('#reminder-form-submit').attr('disabled',false);
	});
</script>

<h2 class="page-header">{$aLang.password_reminder}</h2>

<form action="{router page='login'}reminder/" method="POST" id="reminder-form" class="form-horizontal">
	<div class="control-group">
		<label for="reminder-mail" class="control-label">{$aLang.password_reminder_email}:</label>
		<div class="controls">
			<input type="text" name="mail" id="reminder-mail" class="span3" />
			<span class="help-block"><small class="text-error validate-error-hide validate-error-reminder"></small></span>
		</div>
	</div>
	
	<div class="control-group">
		<div class="controls">
			<button type="submit" name="submit_reminder" class="btn btn-primary" id="reminder-form-submit" disabled="disabled">{$aLang.password_reminder_submit}</button>
		</div>
	</div>
</form>


{/block}
