{hook run='people_sidebar_begin'}


{widget name="tagsCountry"}
{widget name="tagsCity"}

<section class="block">

	<header class="block-header">
		<h3>{$aLang.user_stats}</h3>
	</header>
	
	<div class="block-content">
		<ul class="unstyled">
			<li>{$aLang.user_stats_all}: <strong>{$aStat.count_all}</strong></li>
			<li>{$aLang.user_stats_active}: <strong>{$aStat.count_active}</strong></li>
			<li>{$aLang.user_stats_noactive}: <strong>{$aStat.count_inactive}</strong></li>
		</ul>
		
		<br />
		
		<ul class="unstyled">
			<li>{$aLang.user_stats_sex_man}: <strong>{$aStat.count_sex_man}</strong></li>
			<li>{$aLang.user_stats_sex_woman}: <strong>{$aStat.count_sex_woman}</strong></li>
			<li>{$aLang.user_stats_sex_other}: <strong>{$aStat.count_sex_other}</strong></li>
		</ul>
	</div>
	
</section>

{hook run='people_sidebar_end'}
