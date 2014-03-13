<header id="header" role="banner">
	{hook run='header_banner_begin'}
		
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="navbar-inner">
			<div class="container">
				<div class="header-inner">
			
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				
					<hgroup class="site-info">
						<a class="brand site-name" href="{Config::Get('path.root.url')}">{Config::Get('view.name')}</a>
					</hgroup>
				
					{hook run='userbar_nav'}
				
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li {if $sMenuHeadItemSelect=='blog'}class="active"{/if}><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
							<li {if $sMenuHeadItemSelect=='blogs'}class="active"{/if}><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
							<li {if $sMenuHeadItemSelect=='people'}class="active"{/if}><a href="{router page='people'}">{$aLang.people}</a></li>
							<li {if $sMenuHeadItemSelect=='stream'}class="active"{/if}><a href="{router page='stream'}">{$aLang.stream_menu}</a></li>

							{hook run='main_menu_item'}
						</ul>
					
						{hook run='main_menu'}
					
						<ul class="nav pull-right">
							{if E::IsUser()}
								{if $iUserCurrentCountTalkNew}
									<li>
										<a href="{router page='talk'}" class="new-messages" title="{if $iUserCurrentCountTalkNew}{$aLang.user_privat_messages_new}{/if}">
											{$iUserCurrentCountTalkNew} <i class="icon-envelope icon-white"></i>
										</a>
									</li>
								{/if}
								<li class="dropdown nav-userbar-username">
									<a data-toggle="dropdown" data-target="#" href="{E::User()->getProfileUrl()}" class="dropdown-toggle username">
										<img src="{E::User()->getAvatarUrl(24)}" alt="{E::User()->getDisplayName()}" class="avatar"/>
										{E::User()->getDisplayName()}
										<b class="caret"></b>
									</a>
									<ul class="dropdown-menu">
										<li><a href="{E::User()->getProfileUrl()}">{$aLang.user_menu_profile}</a></li>
										<li><a href="{router page='talk'}" id="new_messages" title="{if $iUserCurrentCountTalkNew}{$aLang.user_privat_messages_new}{/if}">{$aLang.user_privat_messages}{if $iUserCurrentCountTalkNew} ({$iUserCurrentCountTalkNew}){/if}</a></li>
										<li><a href="{E::User()->getProfileUrl()}favourites/topics/">{$aLang.user_menu_profile_favourites}</a></li>
										<li><a href="{router page='settings'}profile/">{$aLang.user_settings}</a></li>
										{hook run='userbar_item'}
										<li class="divider"></li>
										<li><a href="{router page='login'}exit/?security_ls_key={$ALTO_SECURITY_KEY}">{$aLang.exit}</a></li>
								</li>
							{else}
								{hook run='userbar_item'}
								<li><a href="{router page='login'}" class="js-login-form-show">{$aLang.user_login_submit}</a></li>
								<li><a href="{router page='registration'}" class="js-registration-form-show">{$aLang.registration_submit}</a></li>
							{/if}
						</ul>
					</div>
				
				</div>
			</div>
		</div>
	</nav>

	{hook run='header_banner_end'}
	
</header>
