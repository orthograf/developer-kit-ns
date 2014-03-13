{extends file='_index.tpl'}

{block name="layout_vars"}
    {$menu="blog"}
{/block}

{block name="layout_content"}
	{include file='topics/topic.tpl'}
		{if $oTopic->getForbidComment()}	 	 	 	 
				{$sNoticeNotAllow=$aLang.topic_comment_notallow}	 	 	 	 
			{else}	 	 	 	 
				{$sNoticeNotAllow=$aLang.acl_cannot_comment}	 	 	 	 
		{/if} 
		
		{include
		file='comment_tree.tpl'
		iTargetId=$oTopic->getId()
		iAuthorId=$oTopic->getUserId()
		sAuthorNotice=$aLang.topic_author
		sTargetType='topic'
		iCountComment=$oTopic->getCountComment()
		sDateReadLast=$oTopic->getDateRead()
		sNoticeCommentAdd=$aLang.topic_comment_add
		bAllowSubscribe=true
		oSubscribeComment=$oTopic->getSubscribeNewComment()
		oTrackComment=$oTopic->getTrackNewComment()
		aPagingCmt=$aPagingCmt}
{/block}