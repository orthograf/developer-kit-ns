{extends file="_index.tpl"}

{block name="layout_vars"}
    {$menu="people"}
    {$sMenuItemSelect="profile"}
{/block}

{block name="layout_content"}

{$oSession=$oUserProfile->getSession()}
{$oVote=$oUserProfile->getVote()}
{$oGeoTarget=$oUserProfile->getGeoTarget()}

{include file='actions/ActionProfile/profile_top.tpl'}

<div class="alert">
    <h3 style="font-size: 15.5px;"><strong>{$aLang.profile_about}</strong></h3>
    {if $oUserProfile->getProfileAbout()}
        <p>{$oUserProfile->getProfileAbout()}</p>
    {else}
        <p>{$aLang.profile_about_empty}</p>
    {/if}
    <br/>
    {if $oUserCurrent AND $oUserCurrent->getId() == $oUserProfile->getId()}
        <a href="{router page='settings'}" class="edit">{$aLang.profile_about_edit}</a>
    {/if}
</div>


<div class="bui wrapper">
    <div class="profile-left">
        {assign var="aUserFieldValues" value=$oUserProfile->getUserFieldValues(true,array(''))}

        {if $oUserProfile->getProfileSex()!='other' OR $oUserProfile->getProfileBirthday() OR $oGeoTarget OR $oUserProfile->getProfileAbout() OR count($aUserFieldValues)}
            <h2 class="header-table">{$aLang.profile_privat}</h2>
            <ul class="profile-dotted-list">
                {if $oUserProfile->getProfileSex()!='other'}
                    <li>
                        <span>{$aLang.profile_sex}:</span>
                        <strong>
                            {if $oUserProfile->getProfileSex()=='man'}
                                {$aLang.profile_sex_man}
                            {else}
                                {$aLang.profile_sex_woman}
                            {/if}
                        </strong>
                    </li>
                {/if}

                {if $oUserProfile->getProfileBirthday()}
                    <li>
                        <span>{$aLang.profile_birthday}:</span>
                        <strong>{date_format date=$oUserProfile->getProfileBirthday() format="j F Y" notz=true}</strong>
                    </li>
                {/if}

                {if $oGeoTarget}
                    <li>
                        <span>{$aLang.profile_place}:</span>
                        <strong itemprop="address" itemscope itemtype="http://data-vocabulary.org/Address">
                            {if $oGeoTarget->getCountryId()}
                                <a href="{router page='people'}country/{$oGeoTarget->getCountryId()}/"
                                   itemprop="country-name">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oGeoTarget->getCityId()},{/if}
                            {/if}

                            {if $oGeoTarget->getCityId()}
                                <a href="{router page='people'}city/{$oGeoTarget->getCityId()}/" itemprop="locality">{$oUserProfile->getProfileCity()|escape:'html'}</a>
                            {/if}
                        </strong>
                    </li>
                {/if}

                {if $aUserFieldValues}
                    {foreach from=$aUserFieldValues item=oField}
                        <li>
                            <span><i class="icon-contact icon-contact-{$oField->getName()}"></i> {$oField->getTitle()|escape:'html'}
                                :</span>
                            <strong>{$oField->getValue(true,true)}</strong>
                        </li>
                    {/foreach}
                {/if}

                {hook run='profile_whois_privat_item' oUserProfile=$oUserProfile}
            </ul>
        {/if}

        {hook run='profile_whois_item_after_privat' oUserProfile=$oUserProfile}

        <h2 class="header-table">{$aLang.profile_activity}</h2>
        <ul class="profile-dotted-list">
            {if Config::Get('general.reg.invite') AND $oUserInviteFrom}
                <li><span>{$aLang.profile_invite_from}:</span>
                    <strong>
                        <a href="{$oUserInviteFrom->getUserUrl()}">{$oUserInviteFrom->getDisplayName()}</a>&nbsp;
                    </strong>
                </li>
            {/if}

            {if Config::Get('general.reg.invite') AND $aUsersInvite}
                <li><span>{$aLang.profile_invite_to}:</span>
                   <strong>
                        {foreach $aUsersInvite as $oUserInvite}
                            <a href="{$oUserInvite->getUserUrl()}">{$oUserInvite->getDisplayName()}</a>
                            &nbsp;
                        {/foreach}
                    </strong>
                </li>
            {/if}

            {if $aBlogsOwner}
                <li><span>{$aLang.profile_blogs_self}:</span>
                    <strong>
                        {foreach $aBlogsOwner as $oBlog}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$oBlog@last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}

            {if $aBlogAdministrators}
                <li>
                    <span>{$aLang.profile_blogs_administration}:</span>
                    <strong>
                        {foreach $aBlogAdministrators as $oBlogUser}
                            {assign var="oBlog" value=$oBlogUser->getBlog()}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$oBlogUser@last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}

            {if $aBlogModerators}
                <li>
                    <span>{$aLang.profile_blogs_moderation}:</span>
                    <strong>
                        {foreach $aBlogModerators as $oBlogUser}
                            {assign var="oBlog" value=$oBlogUser->getBlog()}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$oBlogUser@last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}

            {if $aBlogUsers}
                <li>
                    <span>{$aLang.profile_blogs_join}:</span>
                    <strong>
                        {foreach $aBlogUsers as $oBlogUser}
                            {assign var="oBlog" value=$oBlogUser->getBlog()}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$oBlogUser@last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}

            {hook run='profile_whois_activity_item' oUserProfile=$oUserProfile}

            <li>
                <span>{$aLang.profile_date_registration}:</span>
                <strong>{date_format date=$oUserProfile->getDateRegister()}</strong>
            </li>

            {if $oSession}
                <li>
                    <span>{$aLang.profile_date_last}:</span>
                    <strong>{date_format date=$oSession->getDateLast()}</strong>
                </li>
            {/if}
        </ul>

        {if $aUsersFriend}
            <h2 class="header-table mb-15"><a
                        href="{$oUserProfile->getUserUrl()}friends/">{$aLang.profile_friends}</a>
                <span>{$iCountFriendsUser}</span></h2>
            {include file='user_list_avatar.tpl' aUsersList=$aUsersFriend}
        {/if}

        {hook run='profile_whois_item_end' oUserProfile=$oUserProfile}
    </div>
    <!-- /profile-left -->

    <div class="profile-right">
        {assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('contact'))}
        {if $aUserFieldContactValues}
            <h2 class="header-table">{$aLang.profile_contacts}</h2>
            <ul class="profile-contact-list">
                {foreach from=$aUserFieldContactValues item=oField}
                    <li><i class="icon-contact icon-contact-{$oField->getName()}"
                           title="{$oField->getName()}"></i> {$oField->getValue(true,true)}</li>
                {/foreach}
            </ul>
        {/if}

        {assign var="aUserFieldContactValues" value=$oUserProfile->getUserFieldValues(true,array('social'))}
        {if $aUserFieldContactValues}
            <h2 class="header-table">{$aLang.profile_social}</h2>
            <ul class="profile-contact-list">
                {foreach $aUserFieldContactValues as $oField}
                    <li><i class="icon-contact icon-contact-{$oField->getName()}"
                           title="{$oField->getName()}"></i> {$oField->getValue(true,true)}</li>
                {/foreach}
            </ul>
        {/if}

        {hook run='profile_whois_item' oUserProfile=$oUserProfile}
    </div>
</div>

{/block}
