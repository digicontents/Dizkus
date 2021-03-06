{gt text="Manage subscriptions" assign=templatetitle}
{include file='admin/header.tpl'}

<form class="z-form" id="subscriptions" action="{modurl modname='Dizkus' type='admin' func='managesubscriptions'}" method="post">
    <fieldset>
        <label for="username">{gt text="User name"}</label>&nbsp;<input type="text" name="username" id="username" value="{$username}" />&nbsp;<button class="dzk_img search" type="submit" name="submit">{gt text="Show users' subscriptions"}</button>
    </fieldset>
</form>

<form class="z-form" id="managesubscriptions" action="{modurl modname='Dizkus' type='admin' func='managesubscriptions'}" method="post">
    <div>
        <input type="hidden" name="uid" value="{$uid}" />
        {if $topicsubscriptions|@count <> 0}
        <input type="hidden" name="authid" value="{insert name='generateauthkey' module='Dizkus'}" />
        <h2>{gt text="Manage topic subscriptions"}</h2>
        <table class="z-admintable">
            <caption>(<label for="alltopic">{gt text="Remove all topic subscriptions"}</label>&nbsp;<input name="alltopic" id="alltopic" type="checkbox" value="1" />&nbsp;)</caption>
            <thead>
                <tr>
                    <th>{gt text="Topic"}</th>
                    <th>{gt text="Poster"}</th>
                    <th>{gt text="Unsubscribe from topic"}</th>
                </tr>
            </thead>
            <tbody>
                {foreach item='subscription' from=$topicsubscriptions}
                <tr class="{cycle values='z-odd,z-even'}">
                    <td>
                        <a href="{$subscription.last_post_url_anchor|safetext}" title="{$subscription.forum_name|safetext} :: {$subscription.topic_title|safetext}">{$subscription.topic_title|safetext}</a>
                    </td>
                    <td>
                        {$subscription.poster_name|profilelinkbyuname}
                    </td>
                    <td>
                        <input class="topic_checkbox" type="checkbox" name="topic_id[]" value="{$subscription.topic_id}" />
                    </td>
                </tr>
                {/foreach}
            </tbody>
        </table>
        {else}
        <h3>{gt text="No topic subscriptions found."}</h3>
        {/if}

        {if $forumsubscriptions|@count <> 0}
        <input type="hidden" name="authid" value="{insert name='generateauthkey' module='Dizkus'}" />
        <h2>{gt text="Manage forum subscriptions"}</h2>
        <table class="z-admintable">
            <caption>(<label for="allforum">{gt text="Remove all forum subscriptions"}</label>&nbsp;<input name="allforum" id="allforum" type="checkbox" value="1" />&nbsp;)</caption>
            <thead>
                <tr>
                    <th>{gt text="Forum"}</th>
                    <th>{gt text="Unsubscribe from forum"}</th>
                </tr>
            </thead>
            <tbody>
                {foreach item='subscription' from=$forumsubscriptions}
                <tr class="{cycle values='z-odd,z-even'}">
                    <td>
                        <a href="{modurl modname='Dizkus' type='user' func='viewforum' forum=$subscription.forum_id}" title="{$subscription.cat_title} :: {$subscription.forum_name}">{$subscription.forum_name|safetext}</a>
                    </td>
                    <td>
                        <input class="forum_checkbox" type="checkbox" name="forum_id[]" value="{$subscription.forum_id}" />
                    </td>
                </tr>
                {/foreach}
            </tbody>
        </table>

        {else}
        <h3>{gt text="No forum subscriptions found."}</h3>
        {/if}

        <div class="z-formbuttons">
            <button class="dzk_img ok" type="submit" name="submit" value="{gt text="Submit"}">{gt text="Submit"}</button>
        </div>
    </div>
</form>

{include file='admin/footer.tpl'}
