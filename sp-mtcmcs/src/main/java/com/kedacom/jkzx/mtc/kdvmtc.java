package com.kedacom.jkzx.mtc;

public class kdvmtc { 
	public String strPort ;     // 取值 0-9   
	public String strStart ;    // 是否发双流  0否 1是
	public String strIP ;      // 终端IP
	public String strState ;   // 是否切换画中画     0 否 1 是
	public String strSpeaker ;  // 指定MT是否为发言人 0否 1 是
	
	public native int kdvdual(kdvmtc m) ; // 双流
	public native int kdvpip(kdvmtc m) ;   // 画中画
	
	/*static{
		System.loadLibrary("mtc2") ;
	}*/
}
