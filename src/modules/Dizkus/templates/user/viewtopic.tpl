{include file='user/header.tpl'}

<div class="dzk_topicoptions roundedbar dzk_rounded" id="topic_{$topic.topic_id}">
    <div class="inner">
        <div id="dzk_javascriptareatopic" class="hidden">
            <ul class="dzk_topicoptions linklist z-clearfix">
                {if $topic.prev_topic_id and $topic.topic_id neq $topic.prev_topic_id}
                <li><a class="dzk_img previoustopiclink" title="{gt text="Previous topic"}" href="{modurl modname='Dizkus' type=user func=viewtopic topic=$topic.prev_topic_id}">&nbsp;</a></li>
                {/if}

                {if $topic.access_comment}
                <li><a class="dzk_img newtopiclink" title="{gt text="Create a new topic"}" href="{modurl modname='Dizkus' type=user func=newtopic forum=$topic.forum_id}">{gt text="New topic"}</a></li>
                {/if}

                {if $coredata.logged_in}
                <li><a class="dzk_img mailtolink" title="{gt text="Send the posts within this topic as an e-mail message to someone"}" href="{modurl modname='Dizkus' type=user func=emailtopic topic=$topic.topic_id}">{gt text="Send as e-mail"}</a></li>
                {/if}

                <li>{printtopic_button topic_id=$topic.topic_id cat_id=$topic.cat_id forum_id=$topic.forum_id}</li>

                {if $coredata.logged_in}
                <li>
                    {if $topic.is_subscribed eq 0}
                    <a id="toggletopicsubscriptionbutton_{$topic.topic_id}_unsubscribed" class="dzk_img" href="javascript:void(0);" title="{gt text="Subscribe to topic"}">{gt text="Subscribe to topic"}</a>
                    {else}
                    <a id="toggletopicsubscriptionbutton_{$topic.topic_id}_subscribed" class="dzk_img" href="javascript:void(0);" title="{gt text="Unsubscribe from topic"}">{gt text="Unsubscribe from topic"}</a>
                    {/if}
                </li>
                {/if}
                {if $topic.next_topic_id and $topic.topic_id neq $topic.next_topic_id}
                <li><a class="dzk_img nexttopiclink" title="{gt text="Next topic"}" href="{modurl modname='Dizkus' type=user func=viewtopic topic=$topic.next_topic_id}">&nbsp;</a></li>
                {/if}
            </ul>

            {if $topic.access_moderate eq 1}
            <ul class="dzk_topicoptions linklist z-clearfix">
                <li>
                    {if $topic.topic_status eq 0}
                    <a id="toggletopiclockbutton_{$topic.topic_id}_unlocked" class="dzk_img" title="{gt text="Lock topic"}" href="javascript:void(0);">{gt text="Lock topic"}</a>
                    {else}
                    <a id="toggletopiclockbutton_{$topic.topic_id}_locked" class="dzk_img" title="{gt text="Unlock topic"}" href="javascript:void(0);">{gt text="Unlock topic"}</a>
                    {/if}
                </li>

                <li>
                    {if $topic.sticky eq 0}
                    <a class="dzk_img" id="toggletopicstickybutton_{$topic.topic_id}_unsticky" title="{gt text="Give this topic 'sticky' status"}"   href="javascript:void(0);">{gt text="Give this topic 'sticky' status"}</a>
                    {else}
                    <a class="dzk_img" id="toggletopicstickybutton_{$topic.topic_id}_sticky" title="{gt text="Remove 'sticky' status"}" href="javascript:void(0);">{gt text="Remove 'sticky' status"}</a>
                    {/if}
                </li>

                <li><a class="dzk_img movetopiclink" title="{gt text="Move topic"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=move topic=$topic.topic_id}">{gt text="Move topic"}</a></li>
                <li><a class="dzk_img deletetopiclink" title="{gt text="Delete topic"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=delete topic=$topic.topic_id}">{gt text="Delete topic"}</a></li>
            </ul>
            {/if}
        </div>

        <noscript>
            <div id="dzk_nonjavascriptareatopic">
                <ul class="dzk_topicoptions linklist z-clearfix">
                    {if $topic.topic_id neq $topic.prev_topic_id}
                    <li><a class="dzk_img previoustopiclink" title="{gt text="Previous topic"}" href="{modurl modname='Dizkus' type=user func=viewtopic topic=$topic.prev_topic_id}">&nbsp;</a></li>
                    {/if}

                    {if $topic.access_comment}
                    <li><a class="dzk_img newtopiclink" title="{gt text="Create a new topic"}" href="{modurl modname='Dizkus' type=user func=newtopic forum=$topic.forum_id}">{gt text="New topic"}</a></li>
                    {/if}

                    {if $coredata.logged_in}
                    <li><a class="dzk_img mailtolink" title="{gt text="Send the posts within this topic as an e-mail message to someone"}" href="{modurl modname='Dizkus' type=user func=emailtopic topic=$topic.topic_id}">{gt text="Send as e-mail"}</a></li>
                    {/if}

                    <li>{printtopic_button topic_id=$topic.topic_id cat_id=$topic.cat_id forum_id=$topic.forum_id}</li>

                    {if $coredata.logged_in}
                    {if $topic.is_subscribed == 0}
                    <li><a class="dzk_img subscribetopiclink" href="{modurl modname="Dizkus" type="user" func="prefs" act="subscribe_topic" topic=$topic.topic_id}" title="{gt text="Subscribe to topic"}">{gt text="Subscribe to topic"}</a></li>
                    {else}
                    <li><a class="dzk_img unsubscribetopiclink" href="{modurl modname="Dizkus" type="user" func="prefs" act="unsubscribe_topic" topic=$topic.topic_id}" title="{gt text="Unsubscribe from topic"}">{gt text="Unsubscribe from topic"}</a></li>
                    {/if}
                    {/if}

                    {if $topic.topic_id neq $topic.next_topic_id}
                    <li><a class="dzk_img nexttopiclink" title="{gt text="Next topic"}" href="{modurl modname='Dizkus' type=user func=viewtopic topic=$topic.next_topic_id}">&nbsp;</a></li>
                    {/if}
                </ul>

                {if $topic.access_moderate eq 1}
                <ul class="dzk_topicoptions linklist z-clearfix">
                    {if $topic.topic_status eq 0}
                    <li><a class="dzk_img locktopiclink" title="{gt text="Lock topic"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=lock topic=$topic.topic_id}">{gt text="Lock topic"}</a></li>
                    {else}
                    <li><a class="dzk_img unlocktopiclink" title="{gt text="Unlock topic"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=unlock topic=$topic.topic_id}">{gt text="Unlock topic"}</a></li>
                    {/if}

                    {if $topic.sticky eq 0}
                    <li><a class="dzk_img stickytopiclink" title="{gt text="Give this topic 'sticky' status"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=sticky topic=$topic.topic_id}">{gt text="Give this topic 'sticky' status"}</a></li>
                    {else}
                    <li><a class="dzk_img unstickytopiclink" title="{gt text="Remove 'sticky' status"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=unsticky topic=$topic.topic_id}">{gt text="Remove 'sticky' status"}</a></li>
                    {/if}
                    <li><a class="dzk_img movetopiclink" title="{gt text="Move topic"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=move topic=$topic.topic_id}">{gt text="Move topic"}</a></li>
                    <li><a class="dzk_img deletetopiclink" title="{gt text="Delete topic"}" href="{modurl modname='Dizkus' type=user func=topicadmin mode=delete topic=$topic.topic_id}">{gt text="Delete topic"}</a></li>
                </ul>
                {/if}
            </div>
        </noscript>

    </div>
</div>

{dzkpager total=$topic.total_posts}

<div id="dzk_postinglist">
    <ul>
        {counter start=0 print=false assign='post_counter'}
        {foreach key='num' item='post' from=$topic.posts}
        {counter}
        <li class="post_{$post.post_id}">
            {include file='user/singlepost.tpl'}
        </li>
        {/foreach}
        <li id="quickreplyposting" class="hidden">&nbsp;</li>
        <li id="quickreplypreview" class="hidden">&nbsp;</li>
    </ul>
</div>

{dzkpager total=$topic.total_posts}

{if ($topic.topic_status neq 1) and ($topic.access_comment eq true)}


<form id="quickreplyform" name="quickreplyform" class="dzk_form" action="{modurl modname='Dizkus' type=user func=reply}" method="post" enctype="multipart/form-data">
    <div id="dzk_quickreply2">
        <input type="hidden" id="forum" name="forum" value="{$topic.forum_id}" />
        <input type="hidden" id="topic" name="topic" value="{$topic.topic_id}" />
        <input type="hidden" id="quote" name="quote" value="" />
        <input type="hidden" id="authid" name="authid" value="" />

        {notifydisplayhooks eventname='dizkus.ui_hooks.editor.display_view' id='message'}
        <textarea id="message" name="message" cols="10" rows="10"></textarea>


        {if isset($hooks.MediaAttach)}{$hooks.MediaAttach}{/if}
        {if $coredata.Dizkus.striptags == 'yes'}
        <p>{gt text="No HTML tags allowed (except inside [code][/code] tags)"}</p>
        {/if}
        <div class="dzk_subcols z-clearfix">
            <ul>
                <li><strong>{gt text="Options"}</strong></li>
                {if $coredata.logged_in}
                <li>
                    <input type="checkbox" id="attach_signature" name="attach_signature" checked="checked" value="1" />
                    <label for="attach_signature">{gt text="Attach my signature"}</label>
                </li>
                <li>
                    <input type="checkbox" id="subscribe_topic" name="subscribe_topic" checked="checked" value="1" />
                    <label for="subscribe_topic">{gt text="Notify me when a reply is posted"}</label>
                </li>
                {/if}
                <li id="quickreplybuttons" class="dzk_buttonmargin hidden">
                    <button id="btnCreateQuickReply" class="dzk_img ok" type="submit" title="{gt text="Submit"}">{gt text="Submit"}</button>
                    <button id="btnPreviewQuickReply" class="dzk_img preview" type="submit" title="{gt text="Preview"}">{gt text="Preview"}</button>
                    <button id="btnCancelQuickReply" class="dzk_img cancel" type="reset" title="{gt text="Cancel"}">{gt text="Cancel"}</button>
                </li>

                <li id="nonajaxquickreplybuttons" class="dzk_buttonmargin">
                    <input class="dzk_img ok" type="submit" name="submit" value="{gt text="Submit"}" />
                    <input class="dzk_img preview" type="submit" name="preview" value="{gt text="Preview"}" />
                    <input class="dzk_img cancel" type="submit" name="cancel" value="{gt text="Cancel"}" />
                </li>
            </ul>

        </div>
    </div>
</form>


{mediaattach_fileuploads objectid=$topic.topic_id}
<div id="dzk_displayhooks">
    {if isset($hooks.Ratings)}{$hooks.Ratings}{/if}
</div>

{/if}

{if $topic.forum_mods|@count > 0}
<ul id="dzk_moderatorlist" class="linklist z-clearfix">
    <li><em>{gt text="Moderated by"}:</em></li>
    {foreach name=moderators item=mod from=$topic.forum_mods}
    <li>{$mod|profilelinkbyuname}{if !$smarty.foreach.moderators.last}, {/if}</li>
    {/foreach}
</ul>
{/if}

<script type="text/javascript">
    // <![CDATA[
    var storingReply = "{{gt text='Storing reply...'}}";
    var preparingPreview = "{{gt text='Preparing preview...'}}";
    var storingPost = "{{gt text='Storing post...'}}";
    var deletingPost = "{{gt text='Deleting post...'}}";
    var updatingPost = "{{gt text='Updating post...'}}";
    var statusNotChanged = "{{gt text='Unchanged'}}";
    var statusChanged = "{{gt text='Changed'}}";
    var subscribeTopic = "{{gt text='Subscribe to topic'}}";
    var unsubscribeTopic = "{{gt text='Unsubscribe from topic'}}";
    var lockTopic = "{{gt text='Lock topic'}}";
    var unlockTopic = "{{gt text='Unlock topic'}}";
    var stickyTopic = "{{gt text="Give this topic 'sticky' status"}}";
    var unstickyTopic = "{{gt text="Remove 'sticky' status"}}";
    // ]]>
</script>

{include file='user/footer.tpl'}







