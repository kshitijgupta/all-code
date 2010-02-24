package com.chapter12;

import java.sql.ResultSet;

public class MyFile extends ExecuteDB
{
    
    private long fileID;
    private String fileTitle; 
    private String fileContent;
    private String createTime;
    private String part;
    private String fileURL;
    private String strSql;
    
    public MyFile() 
    {
        fileContent="";
        java.util.Date NowTime = new java.util.Date();
	this.createTime = NowTime.toLocaleString();    
    }
    
    //各种get和set方法
    public long getFileID()
    {
        return this.fileID;
    }
    public void setFileID(long id)
    {
        this.fileID = id;
    }
    public String getFileTitle()
    {
        return fileTitle;
    }
    public void setFileTitle(String t)
    {
        this.fileTitle = t;
    }
    public String getFileContent()
    {
        return this.fileContent;
    }
    public void setFileContent(String fc)
    {
        this.fileContent = fc;
    }
    public String getCreateTime()
    {
        return this.createTime;
    }
    public void setCreateTime(String ct)
    {
        this.createTime = ct;
    }
    public String getPart()
    {
        return this.part;
    }
    public void setPart(String p)
    {
        this.part = p;
    }
    public String getFileURL()
    {
        return this.fileURL;
    }
    public void setFileURL(String url)
    {
        this.fileURL = url;
    }
    
    
    //获得主页板块FileID对应的文章信息，将这些信息赋值给相应的类变量
    public boolean init()
    {
	this.strSql="select * from `myfile` where FileID=";
	this.strSql=this.strSql + "'" + this.fileID + "'";        
	try
	{
		ResultSet rs = super.exeQuery(this.strSql);
		if (rs.next())
		{
			//this.fileID=rs.getLong("FileID");
			this.fileTitle=rs.getString("FileTitle");
                        this.createTime = rs.getString("CreateTime");
                        this.fileContent = rs.getString("FileContent");
                        this.fileURL = rs.getString("FileURL");
                        this.part = rs.getString("Part");
			return true;
		}
		else
		{
			return false;
		}
	}
	catch(Exception e)
	{
		//System.out.println(e.toString());            
		return false;
	}        
    }
    //获得Part对应的讨论区的所有主贴的文章信息，返回一个ResultSet类型对象
    public ResultSet show()
    {	
	this.strSql="select CreateTime,FileTitle,FileURL,FileID from `myfile`";
        this.strSql=this.strSql + " where Part = '" + this.part + "'";        
        this.strSql=this.strSql + "  order by CreateTime desc";
	ResultSet rs = null;              
	try
	{
		rs = super.exeQuery(this.strSql); 
	}
	catch(Exception e)
	{
		System.out.println(e.toString()); 
	}
	return rs;	    
    }
    
    //添加新文章，往articles数据表中添加一条新记录
    public boolean add()
    {	
	this.strSql="insert into myfile ";
	this.strSql=this.strSql + "(";
        this.strSql=this.strSql + "FileTitle,FileContent,CreateTime,Part,FileURL)";		
	this.strSql=this.strSql + "values('" + this.fileTitle + "','" + this.fileContent + "','"   + this.createTime + "','" +this.part + "','" +  this.fileURL+ "')";		
	boolean isAdd = super.exeSql(this.strSql);
		
	return isAdd;
    }
    
      //删除属于某个数据库中的文件
    public boolean delete(String sFileID)
    {
        this.strSql="delete from myfile";
	this.strSql=this.strSql + "  where FileID in ("+sFileID+")";
		
	boolean isDelete = super.exeSql(this.strSql);      
        return isDelete;	
    }
    
}
