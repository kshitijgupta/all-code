import org.htmlparser.filters.*;
import org.htmlparser.*;
import org.htmlparser.nodes.*;
import org.htmlparser.tags.*;
import org.htmlparser.util.*;
import org.htmlparser.visitors.*;

public class AstroExtractor {
public static void main(String[] args)
{
   String title=null;//标题
   String constellation;//星座
   String body=null;//主要内容
   try{
    Parser parser = new Parser("http://astro.sina.com.cn/pc/west/frame0_8.html");
    parser.setEncoding("gb2312");
   
    //修改后的，提取日期,已经正确
    NodeFilter filter_constellation_summary=new AndFilter(new TagNameFilter("li"),
      new HasAttributeFilter("class","datea"));
   
    //修改后的,"健康指数"等等,有问题,不能正确提取
    NodeFilter filter_title=new AndFilter(new TagNameFilter("div"),
      new HasAttributeFilter("class","tab"));
   
    //修改后的，已经正确
    NodeFilter filter_body=new AndFilter(new TagNameFilter("div"),
      new HasAttributeFilter("class","lotconts"));
   
   
    NodeList nodelist=parser.parse(filter_constellation_summary);
    Node node_constellation=nodelist.elementAt(0);
    //提取星座信息
   
    constellation=node_constellation.getFirstChild().toHtml();
    /*
    Node node_summary=nodelist.elementAt(1);
    NodeList summary_nodelist=node_summary.getChildren();
    //提取总结信息
    summary=summary_nodelist.elementAt(3).toHtml();
    */
    //重置parser
    parser.reset();
   
    nodelist=parser.parse(filter_title);
    TextExtractingVisitor visitor1=new TextExtractingVisitor();
    NodeIterator it=nodelist.elements();
    while(it.hasMoreNodes())
    {
     Node node_title=(Node)it.nextNode();
     //title+=node_title.getFirstChild().toHtml();
     Parser title_parser=new Parser(node_title.toHtml());
     title_parser.visitAllNodesWith(visitor1);
     title=visitor1.getExtractedText();
     //System.out.println("temp is"+temp);
     //title=title+temp+"\n";
    }

    parser.reset();
   
   
    //过滤内容信息
    nodelist=parser.parse(filter_body);
    Node node_body=nodelist.elementAt(0);
    body=node_body.getFirstChild().toHtml()+node_body.getLastChild().toHtml();
   

    System.out.println(constellation.trim());
    System.out.println(title);
    System.out.println(body.trim());
   // System.out.println(node_body.getFirstChild().toHtml());
      
   }catch(Exception e)
   {
    e.printStackTrace();
   }

}

}

