/* Copyright (C) 
 * 2012 - 罗磊, luolei@gmail.com
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 * 
 */
#ifndef _UTILS_H
#define _UTILS_H

#include <iostream>
#include <vector>
#include <string>
#include <stdio.h>

namespace luo
{

    /* --------------------------------------------------------------------------*/
    /**
     * @Synopsis  listDir 遍历文件夹忽视文件夹里的目录文件，只读取普通文件
     *
     * @Param dir
     * @Param files
     */
    /* ----------------------------------------------------------------------------*/
    void list_dir(const std::string& dir, std::vector<std::string>& files);

    /* --------------------------------------------------------------------------*/
    /**
     * @Synopsis  list_dir_r 递归遍历文件夹
     *
     * @Param dir
     * @Param files
     */
    /* ----------------------------------------------------------------------------*/
    void list_dir_r(const std::string dir, std::vector<std::string>& files);

    
}

namespace _luo_closed
{
    void _list_dir_r(const std::string dir, std::vector<std::string>& files);
}

#endif//_UTILS_H
