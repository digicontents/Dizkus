<?php
/************************************************************************
 * Dizkus - The Post-Nuke Module                                       *
 * ==============================                                       *
 *                                                                      *
 * Copyright (c) 2001-2004 by the Dizkus Module Development Team       *
 * http://www.dizkus.com/                                            *
 ************************************************************************
 * License *
 ************************************************************************
 * This program is free software; you can redistribute it and/or modify *
 * it under the terms of the GNU General Public License as published by *
 * the Free Software Foundation; either version 2 of the License, or    *
 * (at your option) any later version.                                  *
 *                                                                      *
 * This program is distributed in the hope that it will be useful,      *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of       *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        *
 * GNU General Public License for more details.                         *
 *                                                                      *
 * You should have received a copy of the GNU General Public License    *
 * along with this program; if not, write to the Free Software          *
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 *
 * USA                                                                  *
 ************************************************************************
 *
 * mailcron.phpadmin functions
 * @version $Id$
 * @author Frank Schummertz
 * @copyright 2004 by Frank Schummertz
 * @package Dizkus
 * @license GPL <http://www.gnu.org/licenses/gpl.html>
 * @link http://www.dizkus.com
 *
 ***********************************************************************/

//
// store the absolut path to your Zikula folder here
//
chdir('/opt/lampp/htdocs/760');
//<img src="">chdir('/www/htdocs/postnet');

//
// no changes necessary beyond this point!
//
include "includes/pnAPI.php";
pnInit();

$debug = FormUtil::getPassedValue('debug', 0, 'GETPOST');
$debug = ($debug==1) ? true : false;

$forums = pnModAPIFunc('Dizkus', 'admin', 'readforums', array('permcheck' => 'nocheck'));
if(is_array($forums) && count($forums)>0 ) {
    echo count($forums) . " forums read<br />";
    foreach($forums as $forum) {
        if($forum['externalsource'] == 1) {    // Mail
            pnModAPIFunc('Dizkus', 'user', 'mailcron',
                         array('forum' => $forum,
                               'debug' => $debug));
        }
    }
}

?>