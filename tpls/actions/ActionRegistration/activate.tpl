{extends file="themes/$sSkinTheme/layouts/default_light.tpl"}

{block name="layout_vars"}
{/block}

{block name="layout_content"}


<h2 class="page-header">{$aLang.registration_activate_ok}</h2>
<a href="{Config::Get('path.root.url')}">{$aLang.site_go_main}</a>


{/block}
