package com.abc.scan.constants;

import java.util.ResourceBundle;

public final class Constants {

    public static final String SUCCESS = "success";
    public static final String ERROR   = "error";
    public static final String MAIN    = "main";
    public static final String UNLOAD  = "unload";

    public static final int DEBUG = 1;


    public static final int NORMAL = 0;
    
    
    public static final int SMALLLIST = 5;
    public static final int BIGLIST   = 20;
    public static final int SCREENPAGE= 11;
    
    public static final String MOV = "movie";
	public static final String MUS = "music";
	public static final String PIC = "picture";
	public static final String OTH = "other";
	
	public static final String MEDIA   = "media";
	public static final String FILEPIC = "filePic";
	
	public static final String USER_KEY = "userid";
	
	public static final int UPDATE   = 3;
	public static final int UPLOAD   = 6;
	public static final int DOWNLOAD = 9;
	
	public static final String MOVE   = "move";
	public static final String DELETE = "delete";
	
	public static String getMedia(String kind){
		String media = null;
		
		ResourceBundle resources = ResourceBundle.getBundle(MEDIA);
		
		try{
			media = resources.getString(kind);
		}catch(Exception e){
			return null;
		}
		return media;
	}
	
	public static String getFilePic(String kind){
		String pic = null;
		
		ResourceBundle resources = ResourceBundle.getBundle(FILEPIC);
		
		try{
			pic = resources.getString(kind);
		}catch(Exception e){
			return null;
		}
		return pic;
	}
	
	public static String getClassType(String type){
		if(type!=null){
			if(type.equals(MOV))	  return " ”∆µ";
			else if(type.equals(MUS)) return "“Ù∆µ";
			else if(type.equals(PIC)) return "Õº∆¨";
			else if(type.equals(OTH)) return "∆‰À˚";
			else return null;
		}
		return null;
	}
}
