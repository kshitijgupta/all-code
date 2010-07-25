/*
 * 2010.7.25 author 罗磊
 *
 * 用于提供提供对WebTable写的cpp借口。
 *
 * 使用thrift与Hbase通讯，如果运行过程中报错：
 * Thrift: Sun Jul 25 15:01:32 2010 TSocket::open() connect() <Host: xx.xxx.xx.xxx Port: 9090>Connection refused
 * terminate called after throwing an instance of 'apache::thrift::transport::TTransportException'
 *   what():  connect() failed: Connection refused
 *   忽略
 *
 *证明thrift服务器没有开启
 *
 * */

#ifndef _WEBTABLEWRITER_H
#define _WEBTABLEWRITER_H

#include <iostream>
#include <string>

#include <protocol/TBinaryProtocol.h>
#include <transport/TSocket.h>
#include <transport/TTransportUtils.h>

#include "Hbase.h"

using namespace apache::thrift;
using namespace apache::thrift::protocol;
using namespace apache::thrift::transport;
using namespace apache::hadoop::hbase::thrift;


namespace luolei { namespace hit { namespace cir { namespace se {namespace hbase {

    class WebTableWriter{
        public:
            enum TYPE{
                HTML = 1,
                PDF  = 2,
                MSDOC= 3,
                MSXSL= 4,
                MSPPT= 5,
            };
            /*
             * write方法需要特别注意的是，HBase非关系数据库，如果对同样的id重复插入内容，并不会报错，会
             * 直接覆盖！这里为了插入效率，write方法并没有进行对插入id的检查，使用者要慎重！
             *
             * 参数说明：
             *
             * id：是每一行记录的id，因为Hbase本身不提供自增机制，所以在多线程／进程环境下需要在外部同步，
             *     大量的同步操作可能造成系统瓶颈，使用者可以考虑每个线程／进程每次申请若干个id（如申请
             *     10000～20000的id），这样在使用时候可以明显减少锁的操作频率。或采用其他技巧减少同步消耗
             *
             * type：表明写入的是什么类型的内容html、pdf、微软word、微软excel、微软ppt
             *
             * url: 内容来源
             * 
             * content: 不需要进行任何预处理的文档内容
             *
             * text: 经过预处理后的正文结果，爬虫可以不加入，待后续工作处理
	     *	    
 	     * title: 经过预处理后的标题，爬虫可以不加入，待后续工作处理
             *
             */
            void write(const int id, TYPE type, const std::string& url, const std::string& content, const std::string& title="", const std::string& text="");

            /*
             * WebTableWritter的构造函数，参数说明
             *
             * host: 要连接的Hbase主机ip地址
             *
             * port：要连接的HBase主机端口
             */
            WebTableWriter(std::string host, int port=9090);

	    ~WebTableWriter();

        private:
            boost::shared_ptr<TTransport> socket;
            boost::shared_ptr<TTransport> transport;
            boost::shared_ptr<TProtocol> protocol;
            HbaseClient client;
	    
	    const std::string tableName;
    };

}}}}}//namespace
#endif //_WEBTABLEWRITER_H
