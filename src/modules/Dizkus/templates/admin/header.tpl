{pageaddvar name='javascript' value='javascript/ajax/prototype.js'}
{pageaddvar name='javascript' value='javascript/ajax/scriptaculous.js'}
{pageaddvar name='javascript' value='modules/Dizkus/javascript/dizkus_tools.js'}
{pageaddvar name='javascript' value='modules/Dizkus/javascript/dizkus_admin.js'}

{admincategorymenu}
<div class="z-adminbox">
    {img modname='Dizkus' src='admin.gif'}
    <h1>{gt text="Forum Administration"}</h1>
    {modulelinks modname='Dizkus' type='admin'}
</div>

<div class="z-admincontainer">
    <div class="z-adminpageicon">{icon type=$templateicon|default:'config' size="large"}</div>
    <h2>{$templatetitle|default:'Dizkus'}</h2>
    

    <div id="dizkus_admin">

        <noscript>
            <div class="z-warningmsg">{gt text="Warning! The Dizkus admin panel needs JavaScript enabled. Some parts of the admin panel will not function without it."}</div>
        </noscript>
