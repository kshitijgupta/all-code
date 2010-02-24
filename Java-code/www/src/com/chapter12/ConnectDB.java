package com.chapter12;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB
{ 
	//���ݿ��û���
	String userName="root";
	//���ݿ�����
	String userPassword="luolei";
	//���ݿ��URL�������������ݿ���ʹ�õı����ʽ
	
         String url= "jdbc:mysql://localhost:3306/chapter12?useUnicode=true&characterEncoding=utf8";
	//����һ�����Ӷ���
	Connection dbConn;   
	//������Ϣ��
	String errMes;
    	
   	public ConnectDB()
   	{
   		//��ʼ������
		errMes="";
   		dbConn=null;
   	}
   	
	//�������ݿ�
   	public Connection getConn()
   	{   	
	   	try
	   	{ 
			//�������õ����
			
                        Class.forName("com.mysql.jdbc.Driver");
                
             
			//������ݿ�����Ӷ���
			dbConn= DriverManager.getConnection(url,userName,userPassword);
                        
	   	}
	   	catch(Exception e)
	   	{	   		
	   		dbConn = null;
	   		errMes=e.toString();	   		
	   	}
	   	return dbConn;
   }
   
   //��ȡ������Ϣ
   public String getErrMes()
   {
   		return errMes;	
   }
}
