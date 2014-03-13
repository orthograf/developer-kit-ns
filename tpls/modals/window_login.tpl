{if !$oUserCurrent}
	<div class="modal modal-login" id="window_login_form">
	
	<div class="modal-dialog">
        <div class="modal-content">
		
		<header class="modal-header">
			<button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>{$aLang.user_authorization}</h3>
		</header>
		
		<script type="text/javascript">
			jQuery(function($){
				$('#popup-login-form').bind('submit',function(){
					ls.user.login('popup-login-form');
					return false;
				});
				$('#popup-login-form-submit').attr('disabled',false);
			});
		</script>
		
		<div class="modal-body">
			<ul class="nav nav-tabs">
				<li class="active js-block-popup-login-item" data-type="login"><a href="#">{$aLang.user_login_submit}</a></li>
				{if !$oConfig->GetValue('general.reg.invite')}
					<li class="js-block-popup-login-item" data-type="registration"><a href="#">{$aLang.registration}</a></li>
				{else}
					<li><a href="{router page='registration'}">{$aLang.registration}</a></li>
				{/if}
				<li class="js-block-popup-login-item" data-type="reminder"><a href="#">{$aLang.password_reminder}</a></li>
			</ul>
			
			
			<div class="tab-content js-block-popup-login-content" data-type="login">
				{hook run='login_popup_begin'}
				<form action="{router page='login'}" method="post" id="popup-login-form" class="form-horizontal">
					{hook run='form_login_popup_begin'}
					
					<div class="control-group">
						<label for="popup-login" class="control-label">{$aLang.user_login}:</label>
						<div class="controls">
							<input type="text" name="login" id="popup-login" class="span3">
						</div>
					</div>
					
					<div class="control-group">
						<label for="popup-password" class="control-label">{$aLang.user_password}:</label>
						<div class="controls">
							<input type="password" name="password" id="popup-password" class="span3">
							<span class="help-block"><small class="text-error validate-error-hide validate-error-login"></small></span>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<label class="checkbox"><input type="checkbox" name="remember" class="input-checkbox" checked>{$aLang.user_login_remember}</label>
							
							{hook run='form_login_popup_end'}
							
							<input type="hidden" name="return-path" value="{$PATH_WEB_CURRENT|escape:'html'}">
							<button type="submit" name="submit_login" class="btn btn-primary" id="popup-login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
						</div>
					</div>
				</form>
				{hook run='login_popup_end'}
			</div>


			{if !$oConfig->GetValue('general.reg.invite')}
			<div data-type="registration" class="tab-content js-block-popup-login-content" style="display:none;">
				<script type="text/javascript">
					jQuery(document).ready(function($){
						$('#popup-registration-form').find('input.js-ajax-validate').blur(function(e){
							var aParams={ };
							if ($(e.target).attr('name')=='password_confirm') {
								aParams['password']=$('#popup-registration-user-password').val();
							}
							if ($(e.target).attr('name')=='password') {
								aParams['password']=$('#popup-registration-user-password').val();
								if ($('#popup-registration-user-password-confirm').val()) {
									ls.user.validateRegistrationField('password_confirm',$('#popup-registration-user-password-confirm').val(),$('#popup-registration-form'),{ 'password': $(e.target).val() });
								}
							}
							ls.user.validateRegistrationField($(e.target).attr('name'),$(e.target).val(),$('#popup-registration-form'),aParams);
						});
						$('#popup-registration-form').bind('submit',function(){
							ls.user.registration('popup-registration-form');
							return false;
						});
						$('#popup-registration-form-submit').attr('disabled',false);
					});
				</script>

				{hook run='registration_begin' isPopup=true}
				<form action="{router page='registration'}" method="post" id="popup-registration-form" class="form-horizontal">
					{hook run='form_registration_begin' isPopup=true}
					
					<div class="control-group">
						<label for="popup-registration-login" class="control-label">{$aLang.registration_login}:</label>
						<div class="controls">
							<input type="text" name="login" id="popup-registration-login" value="{$_aRequest.login}" class="span3 js-ajax-validate" />
							<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_login_notice}"></i>
							<i class="icon-ok text-success validate-ok-field-login" style="display: none"></i>
							<span class="help-block"><small class="text-error validate-error-hide validate-error-field-login"></small></span>
						</div>
					</div>
					
					<div class="control-group">
						<label for="popup-registration-mail" class="control-label">{$aLang.registration_mail}:</label>
						<div class="controls">
							<input type="text" name="mail" id="popup-registration-mail" value="{$_aRequest.mail}" class="span3 js-ajax-validate" />
							<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_mail_notice}"></i>
							<i class="icon-ok text-success validate-ok-field-mail" style="display: none"></i>
							<span class="help-block"><small class="text-error validate-error-hide validate-error-field-mail"></small></span>
						</div>
					</div>
					
					<div class="control-group">
						<label for="popup-registration-user-password" class="control-label">{$aLang.registration_password}:</label>
						<div class="controls">
							<input type="password" name="password" id="popup-registration-user-password" value="" class="span3 js-ajax-validate" />
							<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_password_notice}"></i>
							<i class="icon-ok text-success validate-ok-field-password" style="display: none"></i>
							<span class="help-block"><small class="text-error validate-error-hide validate-error-field-password"></small></span>
						</div>
					</div>
					
					<div class="control-group">
						<label for="popup-registration-user-password-confirm" class="control-label">{$aLang.registration_password_retry}:</label>
						<div class="controls">
							<input type="password" value="" id="popup-registration-user-password-confirm" name="password_confirm" class="span3 js-ajax-validate" />
							<i class="icon-ok text-success validate-ok-field-password_confirm" style="display: none"></i>
							<span class="help-block"><small class="text-error validate-error-hide validate-error-field-password_confirm"></small></span>
						</div>
					</div>

					{hookb run="popup_registration_captcha"}
                        <p>
                            <label for="popup-registration-captcha">{$aLang.registration_captcha}</label>
                            <img src="{Config::Get('path.root.url')}captcha/" class="captcha-image"
                                 onclick="this.src='{Config::Get('path.root.url')}captcha/?n='+Math.random();" />
                            &rarr;
                            <input type="text" name="captcha" id="popup-registration-captcha" value="" maxlength="3"
                                   class="input-text captcha-text js-ajax-validate"/>
                            <small class="validate-error-hide validate-error-field-captcha"></small>
                        </p>
                    {/hookb}
					
					{hook run='form_registration_end' isPopup=true}
					
					<div class="control-group">
						<div class="controls">
							<input type="hidden" name="return-path" value="{$PATH_WEB_CURRENT|escape:'html'}">
							<button type="submit" name="submit_register" class="btn btn-primary" id="popup-registration-form-submit" disabled="disabled">{$aLang.registration_submit}</button>
						</div>
					</div>
				</form>
				{hook run='registration_end' isPopup=true}
			</div>
			{/if}
			
			
			<div data-type="reminder" class="tab-content js-block-popup-login-content" style="display:none;">
				<script type="text/javascript">
					jQuery(document).ready(function($){
						$('#popup-reminder-form').bind('submit',function(){
							ls.user.reminder('popup-reminder-form');
							return false;
						});
						$('#popup-reminder-form-submit').attr('disabled',false);
					});
				</script>
				<form action="{router page='login'}reminder/" method="POST" id="popup-reminder-form" class="form-horizontal">
					<div class="control-group">
						<label for="popup-reminder-mail" class="control-label">{$aLang.password_reminder_email}:</label>
						<div class="controls">
							<input type="text" name="mail" id="popup-reminder-mail" class="span3" />
							<span class="help-block"><small class="text-error validate-error-hide validate-error-reminder"></small></span>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<button type="submit" name="submit_reminder" class="btn btn-primary" id="popup-reminder-form-submit" disabled="disabled">{$aLang.password_reminder_submit}</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<footer class="modal-footer"></footer>
	</div></div></div>
{/if}
