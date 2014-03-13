{include file='topics/topic_part_header.tpl'}

{assign var=oType value=$oTopic->getContentType()}

{if $oType->isAllow('photoset')}
    <script type="text/javascript">
        jQuery(window).load(function($) {
            ls.photoset.showMainPhoto({$oTopic->getId()});
        });
    </script>
    {assign var=oMainPhoto value=$oTopic->getPhotosetMainPhoto()}
    {if $oMainPhoto}
        <div class="topic-photo-preview" id="photoset-main-preview-{$oTopic->getId()}" onclick="window.location='{$oTopic->getUrl()}#photoset'">
            <div class="topic-photo-count" id="photoset-photo-count-{$oTopic->getId()}">{$oTopic->getPhotosetCount()} {$aLang.topic_photoset_photos}</div>

            {if $oMainPhoto->getDescription()}
                <div class="topic-photo-desc" id="photoset-photo-desc-{$oTopic->getId()}">{$oMainPhoto->getDescription()}</div>
            {/if}

            <img src="{$oMainPhoto->getWebPath(500)}" alt="image" id="photoset-main-image-{$oTopic->getId()}" />
        </div>
    {/if}

    {assign var=iPhotosCount value=$oTopic->getPhotosetCount()}
{/if}

<div class="topic-content text">
    {hook run='topic_content_begin' topic=$oTopic bTopicList=$bTopicList}

    {if $bTopicList}
        {$oTopic->getTextShort()}

        {if $oTopic->getTextShort()!=$oTopic->getText()}
          <br/>
            <a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
                {if $oTopic->getCutText()}
                    {$oTopic->getCutText()}
                {else}
                    {$aLang.topic_read_more} &rarr;
                {/if}
            </a>
        {/if}
    {else}
        {$oTopic->getText()}
    {/if}

    </br></br>

    {hook run='topic_content_end' topic=$oTopic bTopicList=$bTopicList}
</div>

{if $oType->isAllow('photoset') && !$bTopicList && $iPhotosCount}
   <script type="text/javascript"
            src="{Config::Get('path.frontend.url')}/libs/js/vendor/prettyphoto/js/jquery.prettyphoto.js"></script>
    <link rel='stylesheet' type='text/css'
          href="{Config::Get('path.frontend.url')}/libs/js/vendor/prettyphoto/css/prettyphoto.css"/>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('.photoset-image').prettyPhoto({
                social_tools: '',
                show_title: false,
                slideshow: false,
                deeplinking: false
            });
        });
    </script>


    <div class="topic-photo-images">
        <h2>{$oTopic->getPhotosetCount()} {$oTopic->getPhotosetCount()|declension:$aLang.topic_photoset_count_images}</h2>
        <a name="photoset"></a>

        <ul id="topic-photo-images" class="unstyled inline clearfix">
            {assign var=aPhotos value=$oTopic->getPhotosetPhotos(0, $oConfig->get('module.topic.photoset.per_page'))}
            {if count($aPhotos)}
                {foreach from=$aPhotos item=oPhoto}
                    <li><a class="photoset-image" href="{$oPhoto->getWebPath(1000)}" rel="[photoset]"  title="{$oPhoto->getDescription()}"><img src="{$oPhoto->getWebPath('50crop')}" alt="{$oPhoto->getDescription()}" /></a></li>
                    {assign var=iLastPhotoId value=$oPhoto->getId()}
                {/foreach}
            {/if}
            <script type="text/javascript">
                ls.photoset.idLast='{$iLastPhotoId}';
            </script>
        </ul>

        {if count($aPhotos)<$oTopic->getPhotosetCount()}
            <a href="javascript:ls.photoset.getMore({$oTopic->getId()})" id="topic-photo-more" class="btn btn-large btn-block topic-photo-more">{$aLang.topic_photoset_show_more} &darr;</a>
        {/if}
    </div>
{/if}

{if $oType->isAllow('question') && $oTopic->getQuestionAnswers()}
    <div class="poll-zone">
        <h2>{$aLang.topic_create_question_title}</h2>
        <div id="topic_question_area_{$oTopic->getId()}" class="poll">
            {if !$oTopic->getUserQuestionIsVote()}
                <ul class="unstyled poll-vote">
                    {foreach from=$oTopic->getQuestionAnswers() key=key item=aAnswer}
                        <li><label><input type="radio" id="topic_answer_{$oTopic->getId()}_{$key}" name="topic_answer_{$oTopic->getId()}" value="{$key}" onchange="jQuery('#topic_answer_{$oTopic->getId()}_value').val(jQuery(this).val());" /> {$aAnswer.text|escape:'html'}</label></li>
                    {/foreach}
                </ul>

                <button type="submit"  onclick="ls.poll.vote({$oTopic->getId()},jQuery('#topic_answer_{$oTopic->getId()}_value').val());" class="btn btn-primary">{$aLang.topic_question_vote}</button>
                <button type="submit"  onclick="ls.poll.vote({$oTopic->getId()},-1)" class="btn">{$aLang.topic_question_abstain}</button>

                <input type="hidden" id="topic_answer_{$oTopic->getId()}_value" value="-1" />
            {else}
                {include file='question_result.tpl'}
            {/if}
        </div>
    </div>
{/if}


{if $oType->isAllow('link') && $oTopic->getLinkUrl()}
    <div class="topic-url">
        {$aLang.topic_link_create_url}: <a href="{router page='content'}go/{$oTopic->getId()}/" title="{$aLang.topic_link_count_jump}: {$oTopic->getLinkCountJump()}">{$oTopic->getLinkUrl()}</a> <span class="link-note">{$aLang.topic_link_count_jump}: {$oTopic->getLinkCountJump()}</span>
    </div>
{/if}

{include file='topics/topic_part_footer.tpl'}

