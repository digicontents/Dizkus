<?php
// $Id$
// ----------------------------------------------------------------------
// PostNuke Content Management System
// Copyright (C) 2002 by the PostNuke Development Team.
// http://www.postnuke.com/
// ----------------------------------------------------------------------
// Based on:
// PHP-NUKE Web Portal System - http://phpnuke.org/
// Thatware - http://thatware.org/
// ----------------------------------------------------------------------
// LICENSE
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License (GPL)
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// To read the license please visit http://www.gnu.org/copyleft/gpl.html
// ----------------------------------------------------------------------

include_once('modules/pnForum/common.php');

// cat_id, forum_id, topic_id
function smarty_function_mailtopic_button($params, &$smarty) 
{
    extract($params); 
	unset($params);

    $out = "";
    if(allowedtowritetocategoryandforum($cat_id, $forum_id)) {
	    $authid = pnSecGenAuthKey();
	    $lang = pnUserGetLang();
		$out = "<a title=\"" . pnVarPrepHTMLDisplay(_PNFORUM_EMAIL_TOPIC) . "\" href=\"". pnModURL('pnForum', 'user', 'emailtopic', array('topic'=>$topic_id)) . "\"><img src=\"modules/pnForum/pnimages/$lang/sendto.gif\" alt=\"" . pnVarPrepHTMLDisplay(_PNFORUM_EMAIL_TOPIC) ."\"></a>";
	}
    return $out;
}

?>