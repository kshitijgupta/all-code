/*
 * Created on 2004-7-29
 *
 */
package com.chinasofti.base.ctrl;

/**
 * @author Administrator
 *
 */
public class ChartData {
	private String xkey	= "";
	private String ykey	= "";
	private String zkey	= "";
	private int		dimension	= 1; 	
	double	data	= 0.0;


	public double getData(){
		return this.data ;
	}	

	public void setData(double data){
		this.data = data ;
	}
	public java.lang.String getXKey() {
	  return this.xkey;
	}	
	public java.lang.String getYKey() {
	  return this.ykey;
	}
	public java.lang.String getZKey() {
	  return this.zkey;
	}
	public void setXkey(String value) {
		if(value!=null) this.xkey = value.trim();
	}	
	public void setYKey(String value) {
		if(value!=null) this.ykey = value.trim();
	}
	public void setZKey(String value) {
		if(value!=null) this.zkey = value.trim();
	}	
	public void setDimension(int value) {
		this.dimension = value;
	}
	public int getDimension() {
		return this.dimension;
	}			
}
