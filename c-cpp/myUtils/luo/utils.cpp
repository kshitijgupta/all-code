
#include "utils.hpp"
#include <dirent.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>


namespace luo
{
    void list_dir(const std::string& dir, std::vector<std::string>& files)
    {
        files.clear();

        struct dirent* ent = NULL;
        DIR *pDir;
        pDir = opendir(dir.c_str());
        if (pDir == NULL) 
        {
            //被当作目录，但是执行opendir后发现又不是目录，比如软链接就会发生这样的情况。
            return;
        }
        while (NULL != (ent = readdir(pDir))) 
        {
            if (ent->d_type == 8) 
            {
                //file
                files.push_back(ent->d_name);
            } 
        }
    }


    void list_dir_r(const std::string dir, std::vector<std::string>& files)
    {
        files.clear();
        _luo_closed::_list_dir_r(dir, files);
    }

}

namespace _luo_closed
{

    void _list_dir_r(const std::string dir, std::vector<std::string>& files)
    {
        struct dirent* ent = NULL;
        DIR *pDir;
        pDir = opendir(dir.c_str());
        if (pDir == NULL) 
        {
            //被当作目录，但是执行opendir后发现又不是目录，比如软链接就会发生这样的情况。
            return;
        }
        while (NULL != (ent = readdir(pDir))) 
        {
            if (ent->d_type == 8) 
            {
                //file
                files.push_back(ent->d_name);
            } 
            else 
            {
                if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0) 
                {
                    continue;
                }
                //directory
                std::string _path(dir);
                std::string _dirName(ent->d_name);
                std::string fullDirPath = _path + "/" + _dirName;
                _list_dir_r(fullDirPath.c_str(), files);
            }
        }
    }
}
