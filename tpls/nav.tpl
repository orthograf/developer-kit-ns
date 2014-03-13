<nav id="nav" class="clearfix">
	<div class="container">
		<div class="nav-inner">
		
			<div class="row-fluid">
		
				<div class="span7">
					{if $menu}
						{if in_array($menu,$aMenuContainers)}
                            {$aMenuFetch.$menu}
                        {else}
                            {include file="menus/menu.$menu.tpl"}
                        {/if}
					{/if}
				</div>
		
				<div class="span5 hidden-phone">
					{if $oUserCurrent}
						<a href="{router page='content'}add/" class="btn btn-success btn-write pull-right" id="modal_write_show">
							{$aLang.block_create}
						</a>
					{/if}
				
					<form action="{router page='search'}topics/" class="navbar-search pull-right visible-desktop">
						<input type="text" placeholder="{$aLang.search}" maxlength="255" name="q" class="search-query">
					</form>
				</div>
		
			</div>
			
		</div>
	</div>
</nav>
