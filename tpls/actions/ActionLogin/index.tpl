{extends file="themes/$sSkinTheme/layouts/default_light.tpl"}

{block name="layout_vars"}
    {$noSidebar=true}
{/block}

{block name="layout_content"}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#login-form').bind('submit',function(){
			ls.user.login('login-form');
			return false;
		});
		$('#login-form-submit').attr('disabled',false);
	});
</script>

<h2 class="page-header">{$aLang.user_authorization}</h2>

{hook run='login_begin'}

<form action="{router page='login'}" method="POST" id="login-form" class="form-horizontal">
	{hook run='form_login_begin'}
	
	<div class="control-group">
		<label for="login" class="control-label">{$aLang.user_login}:</label>
		<div class="controls">
			<input type="text" id="login" name="login" class="span3" />
		</div>
	</div>
	
	<div class="control-group">
		<label for="password" class="control-label">{$aLang.user_password}:</label>
		<div class="controls">
			<input type="password" id="password" name="password" class="span3" />
			<span class="help-block"><small class="text-error validate-error-hide validate-error-login"></small></span>
		</div>
	</div>
	
	<div class="control-group">
		<div class="controls">
			<label class="checkbox"><input type="checkbox" name="remember" checked class="input-checkbox" />{$aLang.user_login_remember}</label>
			
			{hook run='form_login_end'}
			
			<button type="submit" name="submit_login" class="btn btn-primary" id="login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
			
			<br />
			<br />
			<a href="{router page='registration'}">{$aLang.user_registration}</a><br />
			<a href="{router page='login'}reminder/">{$aLang.user_password_reminder}</a>
		</div>
	</div>
</form>


{if $oConfig->GetValue('general.reg.invite')}
	<br /><br />
	<form action="{router page='registration'}invite/" method="POST" class="form-horizontal">
		<h3 class="page-header">{$aLang.registration_invite}</h3>
		
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
{/if}

{hook run='login_end'}
{/block}
