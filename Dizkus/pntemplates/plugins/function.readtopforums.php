<?php

/**
 * readtopforums
 * reads the last $maxforums forums and assign them in a
 * variable topforums and the number of them in topforumscount
 *
 * @params maxforums (int) number of forums to read, default = 5
 *
 */
function smarty_function_readtopforums($params, &$smarty) 
{
    extract($params); 
	  unset($params);

    $forummax = (!empty($maxforums)) ? $maxforums : 5;
    
    $pntable = pnDBGetTables();
    $sql = "SELECT f.forum_id, 
                   f.forum_name, 
                   f.forum_topics, 
                   f.forum_posts, 
                   c.cat_title,
                   c.cat_id
          FROM ".$pntable['dizkus_forums']." AS f, 
               ".$pntable['dizkus_categories']." AS c
          WHERE f.cat_id = c.cat_id
          ORDER BY forum_posts DESC";

    $res = DBUtil::executeSQL($sql, -1, $forummax);
    $colarray = array('forum_id', 'forum_name', 'forum_topics', 'forum_posts', 'cat_title', 'cat_id');
    $result    = DBUtil::marshallObjects($res, $colarray);

    $result_forummax = count($result);
    if ($result_forummax <= $forummax) {
        $forummax = $result_forummax;
    }

    $topforums = array();
    if (is_array($result) && !empty($result)) {
        foreach ($result as $topforum) {
            if (allowedtoreadcategoryandforum($cat_id, $forum_id)) {
                $topforum['forum_name'] = DataUtil::formatForDisplay($topforum['forum_name']);
                $topforum['cat_title'] = DataUtil::formatForDisplay($topforum['cat_title']);
                array_push($topforums, $topforum);
            }
        }
    }

    $smarty->assign('topforumscount', count($topforums));
    $smarty->assign('topforums', $topforums);
    return;
}
