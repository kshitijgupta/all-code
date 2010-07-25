#include "WebTableWriter.h"
#include <boost/lexical_cast.hpp>
#include <sstream>
#include "Hbase.h"

using boost::lexical_cast;


namespace luolei { namespace hit { namespace  cir { namespace se { namespace hbase {

    WebTableWriter::WebTableWriter(std::string host, int port):
	tableName("WebTable"),
        socket(new TSocket(host, port)),
        transport(new TBufferedTransport(socket)),
        protocol(new TBinaryProtocol(transport)),
        client(protocol)
    {
        transport->open();
    }
    
    WebTableWriter::~WebTableWriter(){
	transport->close();
    }

    void WebTableWriter::write(const int id, TYPE type, const std::string& url, const std::string& content, const std::string& title, const std::string& text){
        std::vector<Mutation> mutations;
        mutations.push_back(Mutation());
        mutations.back().column = "content:type";
        mutations.back().value  = lexical_cast<std::string>(type);

        mutations.push_back(Mutation());
        mutations.back().column = "content:url";
        mutations.back().value = url;

        mutations.push_back(Mutation());
        mutations.back().column = "content:content";
        mutations.back().value = content;

	if(!title.empty()){
	    mutations.push_back(Mutation());
	    mutations.back().column = "content:title";
	    mutations.back().value  = title;
	}
        if(!text.empty()){
            mutations.push_back(Mutation());
            mutations.back().column = "content:text";
            mutations.back().value = text;
        }

	std::string strid = lexical_cast<std::string>(id);
        client.mutateRow(tableName, strid, mutations);
    }


}}}}}//namespace
