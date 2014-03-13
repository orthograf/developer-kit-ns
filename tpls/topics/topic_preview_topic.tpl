{$oUser=$oTopic->getUser()}

<h3 class="page-header">{$aLang.topic_preview}</h3>

<article class="topic topic-type-{$oTopic->getType()}">
	<header class="topic-header">
		<h1 class="topic-title">
			{$oTopic->getTitle()|escape:'html'}
		</h1>
	</header>

	<div class="topic-content text">
		{hook run='topic_preview_content_begin' topic=$oTopic}

		{$oTopic->getText()}

		{hook run='topic_preview_content_end' topic=$oTopic}
	</div>

	<footer class="topic-footer">
		<small>
			<ul class="muted unstyled inline topic-tags">
				<li><i class="icon-tags"></i></li>
				{strip}
					{if $oTopic->getTagsArray()}
						{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
							<li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/" class="muted">{$sTag|escape:'html'}</a></li>
						{/foreach}
					{else}
						<li>{$aLang.topic_tags_empty}</li>
					{/if}
				{/strip}
			</ul>
		</small>

		<small>
			<ul class="muted unstyled inline topic-info">
				<li class="topic-info-author">
					<a href="{$oUser->getProfileUrl()}"><img src="{$oUser->getAvatarUrl(24)}" alt="avatar" class="avatar"/></a>
					<a rel="author" href="{$oUser->getProfileUrl()}">{$oUser->getDisplayName()}</a>
				</li>
				<li class="topic-info-date">
					<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" pubdate title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
						{date_format date=$oTopic->getDateAdd() format="j F Y, H:i"}
					</time>
				</li>
				
				{hook run='topic_preview_show_info' topic=$oTopic}
			</ul>
		</small>

		{hook run='topic_preview_show_end' topic=$oTopic}
	</footer>
</article>


<button type="submit" name="submit_topic_publish" class="btn btn-primary pull-right" onclick="jQuery('#submit_topic_publish').trigger('click');">{$aLang.topic_create_submit_publish}</button>
<button type="submit" name="submit_preview" onclick="jQuery('#text_preview').html('').hide(); return false;" class="btn">{$aLang.topic_create_submit_preview_close}</button>
<button type="submit" name="submit_topic_save" class="btn" onclick="jQuery('#submit_topic_save').trigger('click');">{$aLang.topic_create_submit_save}</button>
