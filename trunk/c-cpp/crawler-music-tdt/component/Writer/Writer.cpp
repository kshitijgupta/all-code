/*
 * Writer.cpp
 *
 *  Created on: Apr 8, 2009
 *      Author: luo
 */

#include "Writer.h"
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string.h>
#include <errno.h>


const char * Writer::writer_wday[7] = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
const char * Writer::writer_month[12] = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
			"Aug", "Sept", "Oct", "Nov", "Dec" };

Writer::Writer(int id):tid(id),server("127.0.0.1"), user("root"), password("admin"), database("music_tdt_pages")
#ifdef DEBUG
		       ,tp(id)
#endif

{

	bzero(stime, sizeof(stime));

	time(&timep);
	p = gmtime(&timep);

	/*sprintf(stime, "Last-Modified: %s, %d %s %d %d:%d:%d", Writer::writer_wday[p->tm_wday], p->tm_mday,
			Writer::writer_month[p->tm_mon], (1900 + p->tm_year), (p->tm_hour+8), p->tm_min,
			p->tm_sec);*/
	sprintf(stime, "%s, %d %s %d %d:%d:%d", Writer::writer_wday[p->tm_wday], p->tm_mday,
				Writer::writer_month[p->tm_mon], (1900 + p->tm_year), (p->tm_hour+8), p->tm_min,
				p->tm_sec);
        sqldate = integer2string(1900 + p->tm_year);
        if(p->tm_mon < 9)//tm_mon从0开始计数
            sqldate += "0";
        sqldate += integer2string(p->tm_mon+1);
        if(p->tm_mday < 10)
            sqldate += "0";
        sqldate += integer2string(p->tm_mday);

        //for mysql
        conn = mysql_init(NULL);
        if(!mysql_real_connect(conn, server, user, password, database, 0, NULL, 0))
        {
            fprintf(stderr, "%s\n", mysql_error(conn));
            exit(1);
        }
   
}

Writer::~Writer() {

    mysql_close(conn);
}

bool Writer::WriteIt(struct page_link* pl, char* p, int size) {

	fstream fp;
	fill_filename(*pl);
	string filename("./HTMLFiles/");
	filename += file;

	fp.open(filename.c_str(), ios_base::out);
	if (!fp.is_open()) {
#ifdef DEBUG
		tp.print( "error:writer is trying to write but cannot to open it error: %s\n", strerror(errno) );
#endif
		return false;
	}

	fp.write(p, min(strlen(p), size));
	fp.flush();

    sql = "insert into pages(host,file,port,date,content) values(\"";
    sql += pl->_host_addr;
    sql += "\",\"";
    if(pl->_host_file != NULL)
        sql += pl->_host_file;
    sql += "\",";
    sql += integer2string(pl->_portnumber);
    sql += ",";
    sql += sqldate;
    sql += ",\"";
    sql += filename;
    sql += "\")";
    
    if((mysql_query(conn, sql.c_str()))||(mysql_affected_rows(conn) <= 0))
    {
        printf("%s", mysql_error(conn));
        return false;
    }

    return true;
}
void Writer::fill_filename(struct page_link pl) {

	file = "";

	char* str = newStrChangeC(pl._host_addr, '/', '_', 256);
	file += str;
	file += "_" + integer2string(pl._portnumber) + "_";
	delete str;
	str = newStrChangeC(pl._host_file, '/', '_', 1024);
	file += str;
	delete str;
}
bool Writer::writeHeader(int tid, char* buf, struct page_link* p_pl, char* p_ip, int size) {

	//因为这个函数在wirteIt后调用所以类成员变量file已经被封装好
	string filename("./Header/");
	filename = filename + integer2string(tid) + "/" + file + ".txt";

	fstream fp;
	fp.open(filename.c_str(), ios_base::out);
	if (!fp.is_open()) {
#ifdef DEBUG
tp.print("writerheader:error:writer is trying to write but cannot to open it error:%s\n",  strerror(errno));
#endif

		return false;
	}
	//把数据结构写入
	fp.write(reinterpret_cast<char *> (p_pl), sizeof(struct page_link));
	//把时间写入
	fp.write(stime, sizeof(stime));
	//把ip地址写入
	fp.write(p_ip, size);

	fp.flush();
	fp.close();//write header ok!
	return true;


}

bool Writer::writeLocal(int tid, struct page_link* pl, char* p_ip,RIS& ris , const char * vaildstr, int size) 
{
   if(strstr(ris.getHead(), vaildstr) == NULL)return false; 
   
   if(WriteIt(pl, ris.getPtr())/*&&writeHeader(tid, ris.getHead(), pl, p_ip)*/)
      return true ;
   else 
       return false;
  return true;
}

