<ul class="nav nav-pills">
    <li {if $sShow=='collective'}class="active"{/if}><a href="{router page='blogs'}">{$aLang.blog_menu_collective}</a></li>
    <li {if $sShow=='personal'}class="active"{/if}><a href="{router page='blogs'}personal/">{$aLang.blog_menu_personal}</a></li>
    {hook run='blog_list_nav_menu'}
</ul>