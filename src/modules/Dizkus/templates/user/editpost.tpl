{gt text="Edit post" assign=templatetitle}
{pagesetvar name=title value=$templatetitle}
{include file='user/header.tpl'}

{*modcallhooks hookobject='item' hookaction='display' hookid=$post.topic_id implode=false*}

{if $preview}
<div id="editpostpreview" style="margin:1em 0;">
    {include file='user/editpostpreview.tpl'}
</div>
{/if}

<div id="dzk_newtopic" class="forum_post post_bg2 dzk_rounded">
    <div class="inner">

        <div class="dzk_subcols z-clearfix">

            <form id="editpost" class="dzk_form" action="{modurl modname='Dizkus' type='user' func='editpost'}" method="post" enctype="multipart/form-data">
                <div>
                    <input type="hidden" name="post" value="{$post.post_id}" />
                    <input type="hidden" name="forum"  value="{$post.forum_id}" />
                    <input type="hidden" name="topic"  value="{$post.topic_id}" />
                    <input type="hidden" name="authid" value="{insert name='generateauthkey' module='Dizkus'}" />
                    <fieldset>
                        <legend class="post_header">{gt text="Edit post"}: {$post.topic_subject|safetext}</legend>
                        <div class="post_text_wrap">
                            <div id="dizkusinformation" style="visibility: hidden;">&nbsp;</div>

                            {if $post.moderate eq true OR $post.edit_subject eq true}
                            <div>
                                <label for="subject">{gt text="Subject line"}</label><br />
                                <input style="width: 98%" type="text" name="subject" size="80" maxlength="100" id="subject" tabindex="0" value="{$post.topic_subject|safehtml}" />
                            </div>
                            {/if}
                            <div>
                                <label for="message">{gt text="Message body"}</label><br />
                                <textarea id="message" name="message" class="dzk_texpand" rows="10" cols="60">{$post.post_rawtext}</textarea>
                                {if $coredata.Dizkus.striptags == 'yes'}
                                <p>{gt text="No HTML tags allowed (except inside [code][/code] tags)"}</p>
                                {/if}
                            </div>

                            <div class="dzk_subcols z-clearfix">
                                <div id="editpostoptions" class="dzk_col_left">
                                    <ul>
                                        {if $post.moderate eq true}
                                        <li><strong>{gt text="Options"}</strong></li>
                                        <li>
                                            <input type="checkbox" name="delete" id="delete" tabindex="0" value="1" />
                                            <label for="delete">&nbsp;{gt text="Delete post"}</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="attach_signature" id="attach_signature" {if $post.has_signature eq true}checked="checked"{/if} value="1" />
                                            <label for="attach_signature">&nbsp;{gt text="Attach my signature"}</label>
                                        </li>
                                        {/if}
                                        <li id="editpostbuttons" class="dzk_buttonmargin">
                                            <input class="dzk_img ok" type="submit" name="submit" value="{gt text="Submit"}" />
                                            <input class="dzk_img preview" type="submit" name="preview" value="{gt text="Preview"}" />
                                            <input class="dzk_img cancel" type="submit" name="cancel" value="{gt text="Cancel"}" />
                                        </li>
                                    </ul>

                                </div>
                                <div class="dzk_col_right">
                                    {plainbbcode textfieldid=message}
                                    {bbsmile textfieldid=message}
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
