{gt text="Reply to" assign=templatetitle}
{pagesetvar name='title' value=$templatetitle}

{include file='user/header.tpl'}

{*modcallhooks hookobject='item' hookaction='display' hookid=$reply.topic_id implode=false*}

{if $preview|default:false}
<div id="replypreview" style="margin:1em 0;">
    {include file='user/replypreview.tpl'}
</div>
{/if}

<div id="dzk_quickreply" class="forum_post post_bg2 dzk_rounded">
    <div class="inner">

        <div class="dzk_subcols z-clearfix">

            <form id="post" class="dzk_form" action="{modurl modname='Dizkus' type=user func=reply}" method="post" enctype="multipart/form-data">
                <div>
                    <input type="hidden" name="topic" value="{$reply.topic_id}" />
                    <input type="hidden" name="authid" value="{insert name='generateauthkey' module='Dizkus'}" />
                    <fieldset>
                        <legend class="post_header">{gt text="Reply to"}: {$reply.topic_subject|dzkbbsmile}</legend>
                        <div class="post_text_wrap">
                            <div id="dizkusinformation" style="visibility: hidden;">&nbsp;</div>

                            <div>
                                <label for="message">{gt text="Message body"}</label><br />
                                <textarea id="message" name="message" class="dzk_texpand" rows="10" cols="60">{$reply.message}</textarea>
                                {if isset($hooks.MediaAttach)}{$hooks.MediaAttach}{/if}
                                {if $coredata.Dizkus.striptags == 'yes'}
                                <p>{gt text="No HTML tags allowed (except inside [code][/code] tags)"}</p>
                                {/if}
                            </div>

                            <div class="dzk_subcols z-clearfix">
                                <div id="replyoptions" class="dzk_col_left">
                                    <ul>
                                        <li><strong>{gt text="Options"}</strong></li>
                                        {if $coredata.logged_in}
                                        <li>
                                            <input type="checkbox" id="attach_signature" name="attach_signature" checked="checked" value="1" />
                                            <label for="attach_signature">{gt text="Attach my signature"}</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="subscribe_topic" name="subscribe_topic" {if $reply.subscribe_topic eq true}checked="checked"{/if} value="1" />
                                            <label for="subscribe_topic">{gt text="Notify me when a reply is posted"}</label>
                                        </li>
                                        {/if}
                                        <li id="nonajaxreplybuttons" class="dzk_buttonmargin">
                                            <input class="dzk_img ok" type="submit" name="submit" value="{gt text="Submit"}" />
                                            <input class="dzk_img preview" type="submit" name="preview" value="{gt text="Preview"}" />
                                            <input class="dzk_img cancel" type="submit" name="reset" value="{gt text="Cancel"}" />
                                        </li>
                                    </ul>
                                </div>
                                <div class="dzk_col_left">
                                    {plainbbcode textfieldid='message'}
                                    {bbsmile textfieldid='message'}
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>

    </div>
</div>

{include file='user/footer.tpl'}
