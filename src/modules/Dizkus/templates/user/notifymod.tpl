{gt text="Notify moderator about this posting" assign=templatetitle}
{pagesetvar name=title value=$templatetitle}
{include file='user/header.tpl'}

<h2>{$templatetitle}</h2>
<p class="z-informationmsg">
    {gt text="A moderator will be notified about the selected posting.<br />Valid reasons are: Copyright violations, personal insults and so on.<br />The following are not valid reasons for moderation: Typos, difference of opinion on the topic et cetera."}
</p>
<form class="z-form z-linear" action="{modurl modname=Dizkus type=user func=report}" method="post">
    <div>
        <input type="hidden" name="post" value="{$post.post_id}" />
        <input type="hidden" name="authid" value="{insert name='generateauthkey' module='Dizkus'}" />
        <fieldset id="dzk_notifymoderator">
            <legend>{$templatetitle}</legend>
            <div class="z-formrow">
                <label for="modcomment">{gt text="Your comment"}:</label>
                <textarea id="modcomment" rows="6" cols="60" name="comment" class="dzk_texpand"></textarea>
            </div>
        </fieldset>
        <div class="z-formbuttons">
            <button class="dzk_img ok" type="submit" name="submit" value="{gt text="Submit"}">{gt text="Submit"}</button>
        </div>
    </div>
</form>

{include file='user/footer.tpl'}
