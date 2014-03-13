						{hook run='content_end'}
					</div> <!-- /content -->

					{if !$noSidebar && $sidebarPosition != 'left'}
						{include file='sidebar.tpl'}
					{/if}
				</div> <!-- /row-fluid -->
		
			</div> <!-- /wrapper-inner -->
		</div> <!-- /wrapper -->
	</section> <!-- /container -->


	<footer id="footer">
		<div class="container">
			<div class="footer-inner">
		
				<div class="row-fluid">
					<div class="span3">
						{if $oUserCurrent}
							<ul class="unstyled footer-list">
								<li class="footer-list-header word-wrap">{$oUserCurrent->getDisplayName()}</li>
								<li><a href="{$oUserCurrent->getProfileUrl()}">{$aLang.footer_menu_user_profile}</a></li>
								<li><a href="{router page='settings'}profile/">{$aLang.user_settings}</a></li>
								<li><a href="{router page='topic'}add/" class="js-write-window-show">{$aLang.block_create}</a></li>
								{hook run='footer_menu_user_item' oUser=$oUserCurrent}
								<li><a href="{router page='login'}exit/?security_ls_key={$ALTO_SECURITY_KEY}">{$aLang.exit}</a></li>
							</ul>
						{else}
							<ul class="unstyled footer-list">
								<li class="footer-list-header word-wrap">{$aLang.footer_menu_user_quest_title}</li>
								<li><a class="js-registration-form-show" href="{router page='registration'}" class="js-registration-form-show">{$aLang.registration_submit}</a></li>
								<li><a class="js-login-form-show" href="{router page='login'}" class="js-login-form-show sign-in">{$aLang.user_login_submit}</a></li>
								{hook run='footer_menu_user_item' isGuest=true}
							</ul>
						{/if}
					</div>
				
					<div class="span3">
						<ul class="unstyled footer-list">
							<li class="footer-list-header">{$aLang.footer_menu_navigate_title}</li>
							<li><a href="{Config::Get('path.root.url')}">{$aLang.topic_title}</a></li>
							<li><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
							<li><a href="{router page='people'}">{$aLang.people}</a></li>
							<li><a href="{router page='stream'}">{$aLang.stream_menu}</a></li>
							{hook run='footer_menu_navigate_item'}
						</ul>
					</div>
				
					<div class="span3">
						<ul class="unstyled footer-list">
							<li class="footer-list-header">{cfg name='view.name'}</li>
							<li><a href="#">{$aLang.footer_menu_project_about}</a></li>
							<li><a href="#">{$aLang.footer_menu_project_contact}</a></li>
							<li><a href="#">{$aLang.footer_menu_project_advert}</a></li>
							<li><a href="#">{$aLang.footer_menu_project_help}</a></li>
							{hook run='footer_menu_project_item'}
						</ul>
					</div>
		
					<div class="span3 copyright">
						{hook run='copyright'}
						<br />
						Автор шаблона &mdash; <a href="http://webtown.by/profile/vOFFka/">вOFFка</a>
					</div>
				</div>
			
				{hook run='footer_end'}

			</div>
		</div>
	</footer>


	{include file='toolbar.tpl'}

	{hook run='body_end'}

</body>

<script type="text/javascript">
	(function(w, d){
		// ширина scrollbar
		var scrollbar_width = 18;
		
		var currentStyle = (d.body.currentStyle ? d.body.currentStyle : w.getComputedStyle(d.body, null));
		
		// убрать margin справа
		if(parseInt(currentStyle.marginRight) > 0)
		{
			d.body.style.marginRight = 0;
		}
		
		var marginLeft = parseInt(currentStyle.marginLeft);
		if(marginLeft > 0)
		{
			scrollbar_width += marginLeft;
		}
		
		// выполняет код при изменении размеров окна
		(d.body.onresize = function()
		{
			d.body.style.width = (w.innerWidth - scrollbar_width)+'px';
		})(); // сразу же и выполнить его
	
	})(window, document);
</script>

</html>
