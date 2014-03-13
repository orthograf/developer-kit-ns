{extends file="themes/$sSkinTheme/layouts/default_light.tpl"}

{block name="layout_vars"}
{$noSidebar=true}
{/block}

{block name="layout_content"}


<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#reactivation-form').bind('submit',function(){
			ls.user.reactivation('reactivation-form');
			return false;
		});
		$('#reactivation-form-submit').attr('disabled',false);
	});
</script>

<h2 class="page-header">{$aLang.reactivation}</h2>

<form action="{router page='login'}reactivation/" method="POST" id="reactivation-form" class="form-horizontal">
	<div class="control-group">
		<label for="reactivation-mail" class="control-label">{$aLang.password_reminder_email}:</label>
		<div class="controls">
			<input type="text" name="mail" id="reactivation-mail" class="span3" />
			<span class="help-block"><small class="text-error validate-error-hide validate-error-reactivation"></small></span>
		</div>
	</div>
	
	<div class="control-group">
		<div class="controls">
			<button type="submit" name="submit_reactivation" class="btn btn-primary" id="reactivation-form-submit" disabled="disabled">{$aLang.reactivation_submit}</button>
		</div>
	</div>
</form>


{/block}
