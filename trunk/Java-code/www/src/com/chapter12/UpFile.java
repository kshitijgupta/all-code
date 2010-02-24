package com.chapter12;

import java.sql.ResultSet;

public class UpFile extends ExecuteDB
{
    private long fileID;
    private String fileInfo;
    private String fileURL;
    private String strSql;
    private String CreateTime;
    private String tag;
    private String sender;
    java.util.Date NowTime = new java.util.Date();
    
    public UpFile()
    {
        fileInfo="";
        fileURL="";
        strSql="";
        tag="0";
        sender="0";
        this.CreateTime = NowTime.toLocaleString();     
    }
    public boolean add()
    {	
		this.strSql="insert into upfile ";
		this.strSql=this.strSql + "(FileInfo,FileURL,sender)";		
		this.strSql=this.strSql + "values('" + this.fileInfo + "','" + this.fileURL+"','" +this.sender+"')";		
	
		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
     }
     
    //fileID��get��set
    public long getFileID()
    {
        return this.fileID;
    }
    public void setFileID(long id)
    {
        this.fileID = id;
    }
    //�������Ա����FileUrl��ֵ 
 	public void setFileURL(String FileUrl)
	{
		this.fileURL = FileUrl;	
	}   

	//��ȡ���Ա����FileUrl��ֵ  
	public String getFileURL()
	{
		return this.fileURL;	
	}
        //get��set�û��ϴ����ļ�˵��
        public void setFileInfo(String info)
        {
            this.fileInfo = info;
        }
        public String getFileInfo()
        {
            return this.fileInfo;
        }
        //tag��get��set
        public boolean setTag()
        {
            this.strSql="update upfile set ";
		this.strSql=this.strSql + " tag=" + "'" + 1 + "'";
		this.strSql=this.strSql + " where FileID='" + this.fileID + "'";
		boolean updateTag = super.exeSql(strSql);		
		return updateTag;
        }
        public String getTag()
        {
            return this.tag;
        }
        public void setSender(String s)
        {
            this.sender = s;
        }
        public String getSender()
        {
            return this.sender;
        }
        
        
        public ResultSet showAll()
	{
		this.strSql="select * from upfile ";
		this.strSql=this.strSql + " order by FileURL desc";
		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if(rs == null)
			{
				//System.out.println("test"); 			
			}               
                                  
			return rs;          
		}
		catch(Exception e)
		{			
			//System.out.println(e.toString()); 
			return null;
		}
	}
        
        
        //ɾ������ĳ�������е��ʼ�
	public boolean delete(String sFileID)
	{
		this.strSql="delete from upfile";
		this.strSql=this.strSql + "  where FileID in ("+sFileID+")";
		
		boolean isDelete = super.exeSql(this.strSql);      
		return isDelete;	
	}
        
        
        
        //��ȡ�ļ���ϸ��Ϣ������Щ��Ϣ��ֵ����Ӧ�������
	public boolean  init()
	{
		this.strSql="select * from upfile";
		this.strSql=this.strSql + " where FileURL='" + this.fileURL + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				this.fileID=rs.getLong("FileID");
				this.fileInfo=rs.getString("FileInfo");
				this.sender=rs.getString("sender");				
				this.tag=rs.getString("tag");
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
	}public boolean  initForID()
	{
		this.strSql="select * from upfile";
		this.strSql=this.strSql + " where FileID='" + this.fileID + "'";

		try
		{
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next())
			{
				//this.fileID=rs.getLong("FileID");
                                this.fileURL = rs.getString("FileURL");
				this.fileInfo=rs.getString("FileInfo");
				this.sender=rs.getString("sender");				
				this.tag=rs.getString("tag");
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
 
    
}