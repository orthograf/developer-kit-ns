{include file='header.tpl'}
{include file='menu.settings.tpl'}


{hook run='settings_account_begin'}

<form method="post" enctype="multipart/form-data" class="wrapper-content form-actions">
	{hook run='form_settings_account_begin'}

	<input type="hidden" name="security_ls_key" value="{$ALTO_SECURITY_KEY}">
	
	<fieldset>
		<legend>{$aLang.settings_account}</legend>
		
		<label for="mail">{$aLang.settings_profile_mail}:</label>
		<input type="email" name="mail" id="mail" value="{$oUserCurrent->getMail()|escape:'html'}" class="span6" required />
		<span class="help-block"><small>{$aLang.settings_profile_mail_notice}</small></span></p>
	</fieldset>

	
	<br />
		
	<fieldset>
		<legend>{$aLang.settings_account_password}</legend>
		
		<span class="help-block"><small>{$aLang.settings_account_password_notice}</small></span>
			
		<label for="password_now">{$aLang.settings_profile_password_current}:</label>
		<input type="password" name="password_now" id="password_now" value="" class="span6" />
		
		<label for="password">{$aLang.settings_profile_password_new}:</label>
		<input type="password" id="password" name="password" value="" class="span6" />
		
		<label for="password_confirm">{$aLang.settings_profile_password_confirm}:</label>
		<input type="password" id="password_confirm" name="password_confirm" value="" class="span6" />
	</fieldset>
	
	{hook run='form_settings_account_end'}
	<br />
	
	<button type="submit" name="submit_account_edit" class="btn btn-primary" />{$aLang.settings_profile_submit}</button>
</form>

{hook run='settings_account_end'}


{include file='footer.tpl'}
