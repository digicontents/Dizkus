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

/**
 * readlastposts
 * reads the last $maxposts postings of forum $forum_id and assign them in a
 * variable lastposts and the number of them in lastpostcount
 *
 *@params maxposts (int) number of posts to read, default = 10
 *@params forum_id (int) forum_id, if not set, all forums
 *@params user_id  (int) -1 = last postings of current user, otherwise its treated as an user_id
 *
 */
function smarty_function_readlastposts($params, &$smarty) 
{
    extract($params); 
	unset($params);

    // get some enviroment
    list($dbconn, $pntable) = pnfOpenDB();

    $whereforum = "";
    if(!empty($forum_id) && is_numeric($forum_id)) {
        // get the category id and check permissions

        // get the category id
        $sql = "SELECT cat_id 
                FROM " . $pntable['pnforum_forums'] . "
                WHERE forum_id = $forum_id ";
        
        $result = pnfExecuteSQL($dbconn, $sql, __FILE__, __LINE__);        
        if($result->EOF) {
            $result->Close();
            return false;
        }
        $row = $result->GetRowAssoc(false);
        $cat_id = $row['cat_id'];
        pnfCloseDB($result);
        if(!allowedtoreadcategoryandforum($cat_id, $forum_id)) {
            return;
        }
        $whereforum = "t.forum_id = $forum_id AND ";
    }

    $postmax = (!empty($maxposts)) ? $maxposts : 5;

    // user_id set?
    $whereuser = "";
    $pn_uid = pnUserGetVar('uid');
    if(!empty($user_id)) {
        if($user_id==-1 && pnUserLoggedIn()) {
            $whereuser = "pt.poster_id = $pn_uid AND ";
        } else {
            $whereuser = "pt.poster_id = $user_id AND ";
        }
    }

    $sql = "SELECT t.topic_id, 
                   t.topic_title, 
                   t.topic_replies,
                   t.topic_time,
                   t.topic_last_post_id,
                   f.forum_id, 
                   f.forum_name, 
                   c.cat_title,
                   c.cat_id,
                   pt.poster_id,
                   pt.post_id
        FROM ".$pntable['pnforum_topics']." as t, 
                ".$pntable['pnforum_forums']." as f,
                ".$pntable['pnforum_posts']." as pt,
                ".$pntable['pnforum_categories']." as c
        WHERE $whereforum
              $whereuser
              t.forum_id = f.forum_id AND
              t.topic_last_post_id = pt.post_id AND
              f.cat_id = c.cat_id
        ORDER by t.topic_time DESC";
        
    $result = pnfSelectLimit($dbconn, $sql, $postmax, false, __FILE__, __LINE__);
    $result_postmax = $result->PO_RecordCount();
    if ($result_postmax <= $postmax) {
        $postmax = $result_postmax;
    }

    $lastposts = array();
    if($result->RecordCount()>0) {
        for (; !$result->EOF; $result->MoveNext()) {
            list($topic_id, 
                 $topic_title, 
                 $topic_replies, 
                 $topic_time, 
                 $topic_last_post_id,
                 $forum_id, 
                 $forum_name, 
                 $cat_title, 
                 $cat_id, 
                 $poster_id, 
                 $post_id) = $result->fields;
            if(allowedtoreadcategoryandforum($cat_id, $forum_id)) {
                $lastpost = array();
                $lastpost['topic_id'] = $topic_id;
                $lastpost['forum_id'] = $forum_id;
                $lastpost['forum_name'] = $forum_name;
                $lastpost['topic_title'] = pnVarPrepForDisplay(pnVarCensor($topic_title));
                $lastpost['title_tag'] = $topic_title;
                $lastpost['topic_replies'] = $topic_replies;
                $lastpost['topic_time'] = $topic_time;
                $lastpost['topic_last_post_id'] = $topic_last_post_id;
                $lastpost['poster_id'] = $poster_id;
                $lastpost['cat_title'] = $cat_title;
                $lastpost['cat_id'] = $cat_id;
                $lastpost['post_id'] = $post_id;

                $post_sort_order = pnModGetVar('pnForum', 'post_sort_order');
                $posts_per_page  = pnModGetVar('pnForum', 'posts_per_page');
                
                if($post_sort_order == "ASC") {
                    $hc_dlink_times = 0;
                    if (($lastpost['topic_replies']+1-$posts_per_page)>= 0) { 
                        $hc_dlink_times = 0; 
                        for ($x = 0; $x < $lastpost['topic_replies']+1-$posts_per_page; $x+= $posts_per_page) 
                        $hc_dlink_times++; 
                    } 
                    $start = $hc_dlink_times*$posts_per_page;
                } else {
                    // latest topic is on top anyway...
                    $start = 0;
                }
                $lastpost['start'] = $start;
                if ($poster_id != 1) { 
                    $user_name = pnUserGetVar('uname', $poster_id);
                    if ($user_name == "") {
                        // user deleted from the db?
                        $user_name = pnConfigGetVar('anonymous');
                    }
                } else {
                    $user_name = pnConfigGetVar('anonymous');
                }
                $lastpost['poster_name'] = $user_name;
           
                $posted_unixtime= strtotime ($lastpost['topic_time']); 
                $posted_ml = ml_ftime(_DATETIMEBRIEF, GetUserTime($posted_unixtime)); 
                $lastpost['posted_time'] =$posted_ml;
                $lastpost['posted_unixtime'] = $posted_unixtime;

                // we now create the url to the last post in the thread. This might
                // on site 1, 2 or what ever in the thread, depending on topic_replies
                // count and the posts_per_page setting
                $posts_per_page = pnModGetVar('pnForum', 'posts_per_page');
                $lastpost['last_post_url'] = pnModURL('pnForum', 'user', 'viewtopic',
                                                      array('topic' => $lastpost['topic_id'],
                                                            'start' => (ceil(($lastpost['topic_replies'] + 1)  / $posts_per_page) - 1) * $posts_per_page));
                $lastpost['last_post_url_anchor'] = $lastpost['last_post_url'] . "#pid" . $lastpost['topic_last_post_id'];

                
                array_push($lastposts, $lastpost);
            }
        }
    }
    pnfCloseDB($result);
    $smarty->assign('lastpostcount', count($lastposts));
    $smarty->assign('lastposts', $lastposts);
    return;
}

?>