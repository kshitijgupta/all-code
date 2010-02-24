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
    
    //����get��set����
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
    
    
    //�����ҳ���FileID��Ӧ��������Ϣ������Щ��Ϣ��ֵ����Ӧ�������
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
    //���Part��Ӧ��������������������������Ϣ������һ��ResultSet���Ͷ���
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
    
    //��������£���articles���ݱ������һ���¼�¼
    public boolean add()
    {	
	this.strSql="insert into myfile ";
	this.strSql=this.strSql + "(";
        this.strSql=this.strSql + "FileTitle,FileContent,CreateTime,Part,FileURL)";		
	this.strSql=this.strSql + "values('" + this.fileTitle + "','" + this.fileContent + "','"   + this.createTime + "','" +this.part + "','" +  this.fileURL+ "')";		
	boolean isAdd = super.exeSql(this.strSql);
		
	return isAdd;
    }
    
      //ɾ������ĳ�����ݿ��е��ļ�
    public boolean delete(String sFileID)
    {
        this.strSql="delete from myfile";
	this.strSql=this.strSql + "  where FileID in ("+sFileID+")";
		
	boolean isDelete = super.exeSql(this.strSql);      
        return isDelete;	
    }
    
}
