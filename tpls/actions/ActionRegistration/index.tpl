{extends file="themes/$sSkinTheme/layouts/default_light.tpl"}

{block name="layout_vars"}
    {$noSidebar=true}
{/block}

{block name="layout_content"}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#registration-form').find('input.js-ajax-validate').blur(function(e){
			var aParams={ };
			if ($(e.target).attr('name')=='password_confirm') {
				aParams['password']=$('#registration-user-password').val();
			}
			if ($(e.target).attr('name')=='password') {
				aParams['password']=$('#registration-user-password').val();
				if ($('#registration-user-password-confirm').val()) {
					ls.user.validateRegistrationField(
'password_confirm',
$('#registration-user-password-confirm').val(),
$('#registration-form'),
{ 
'password': $(e.target).val() 
}
);
				}
			}
			ls.user.validateRegistrationField($(e.target).attr('name'),$(e.target).val(),$('#registration-form'),aParams);
		});
		$('#registration-form').bind('submit',function(){
			ls.user.registration('registration-form');
			return false;
		});
		$('#registration-form-submit').attr('disabled',false);
	});
</script>

<h2 class="page-header">{$aLang.registration}</h2>

{hook run='registration_begin'}

<form action="{router page='registration'}" method="post" id="registration-form" class="form-horizontal">
	{hook run='form_registration_begin'}

	<div class="control-group">
		<label for="registration-login" class="control-label">{$aLang.registration_login}:</label>
		<div class="controls">
			<input type="text" name="login" id="registration-login" value="{$_aRequest.login}" class="span4 js-ajax-validate" />
			<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_login_notice}"></i>
			<i class="icon-ok text-success validate-ok-field-login" style="display: none"></i>
			<span class="help-block"><small class="text-error validate-error-hide validate-error-field-login"></small></span>
		</div>
	</div>
	
	<div class="control-group">
		<label for="registration-mail" class="control-label">{$aLang.registration_mail}:</label>
		<div class="controls">
			<input type="text" name="mail" id="registration-mail" value="{$_aRequest.mail}" class="span4 js-ajax-validate" />
			<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_mail_notice}"></i>
			<i class="icon-ok text-success validate-ok-field-mail" style="display: none"></i>
			<span class="help-block"><small class="text-error validate-error-hide validate-error-field-mail"></small></span>
		</div>
	</div>
	
	<div class="control-group">
		<label for="registration-user-password" class="control-label">{$aLang.registration_password}:</label>
		<div class="controls">
			<input type="password" name="password" id="registration-user-password" value="" class="span4 js-ajax-validate" />
			<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_password_notice}"></i>
			<i class="icon-ok text-success validate-ok-field-password" style="display: none"></i>
			<span class="help-block"><small class="text-error validate-error-hide validate-error-field-password"></small></span>
		</div>
	</div>
	
	<div class="control-group">
		<label for="registration-user-password-confirm" class="control-label">{$aLang.registration_password_retry}:</label>
		<div class="controls">
			<input type="password" value="" id="registration-user-password-confirm" name="password_confirm" class="span4 js-ajax-validate" />
			<i class="icon-ok text-success validate-ok-field-password_confirm" style="display: none"></i>
			<span class="help-block"><small class="text-error validate-error-hide validate-error-field-password_confirm"></small></span>
		</div>
	</div>
	
{hookb run="registration_captcha"}
            <dl class="form-item">
                <dt><label for="registration-user-captcha">{$aLang.registration_captcha}:</label></dt>
                <dd>
                    <img src="{Config::Get('path.root.url')}captcha/" class="captcha-image"
                         onclick="this.src='{Config::Get('path.root.url')}captcha/?n='+Math.random();"/>
                    <input type="text" name="captcha" id="registration-user-captcha" value="" maxlength="3"
                           class="input-text captcha-text js-ajax-validate" style="width: 165px"/>
                    <small class="validate-error-hide validate-error-field-captcha"></small>

                    <div class="form-item-help form-item-help-captcha">
                        <i class="icon-ok-green validate-ok-field-captcha" style="display: none"></i>
                    </div>
                </dd>
            </dl>
        {/hookb}

	{hook run='form_registration_end'}
	<br />
	
	<div class="control-group">
		<div class="controls">
			<button type="submit" name="submit_register" class="btn btn-primary" id="registration-form-submit" disabled="disabled">{$aLang.registration_submit}</button>
		</div>
	</div>
</form>

{hook run='registration_end'}

{/block}
