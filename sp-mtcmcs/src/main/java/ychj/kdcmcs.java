package ychj;

public class kdcmcs {
	
	// mcs 接口
	public native int kdcvisitstart(kdcconfinfo[] cconfinfo, kdcmcuinfo mcuinfo, kdvmcsset mcsset, kdcmeminfo[] otherparticipant);
	public native int kdcvisitend(String strconfname, kdcvideoinfo videoinfo);
	public native int kdcvisitpause(String strconfname);
	public native int kdcvisitresume(String strconfname);
	public native kdcconfinfo[] kdcvisitgetconftable();
	public native int kdcvisitinterposestart(String strconfname, kdcmeminfo cofficerinfo);
	public native int kdcvisitinterposestop(String strconfname, kdcmeminfo cofficerinfo);
	public native int kdcvisitmonitorstart(String strconfname, kdcmeminfo cofficerinfo);
	public native int kdcvisitmonitorstop(String strconfname, kdcmeminfo cofficerinfo);
	public native int kdcvisitmonitorvolumeadjust(String strconfname, kdcmeminfo cofficerinfo, short sinout, int nvolumval);
	public native int kdcvisitrecorderstate();
	public native int kdcvisitpaperwork(String strconfname, int ndsmode);
	public native int kdcmcsver(String mcsversion) ;	
	public native void setCallBack();
	
	/**
	 * 获取所有的会议模板列表
	 */
	public native kdcconftem[] GetConfTemSchTable(kdcmcuinfo mcuinfo);
	
	/**
	 * 开启会议模板会议
	 * @param conftem
	 * @return
	 */
	public native int HoldConfByTemplateReq(kdcconftem conftem);
	

	/**
	 * 切换发言人
	 * @param strconfname
	 * @param speakermt
	 * @return
	 */
	public native int kdcSpecSpeakerReq(String strconfname,kdcmeminfo speakermt);
	
	/**
	 * 呼入终端
	 * @param strconfname
	 * @param callmt
	 * @return
	 */
	public native int kdcCallMtReq(String strconfname,kdcmeminfo callmt);
	
	/**
	 * 会议是否开启
	 * @param strconfname
	 * @return
	 */
	public native int kdcIsConfStart(String strconfname);
	
	/**
	 * 获取会议模板终端列表
	 * @param conftem
	 * @return
	 */
	public native kdcmeminfo[] GetConfTemSchMtList(kdcconftem conftem);
	
	
	
	private InterestingEvent ie;

	public InterestingEvent getIe() {
		return ie;
	}
	public void setIe(InterestingEvent ie) {
		this.ie = ie;
	}
	public kdcmcs(InterestingEvent event) {
        ie = event;
    }

	public void callbackmtstatus(int nEvent, String strMtName, String strMtIp, int isOnLine)
	{	
		ie.CallBackEvent(nEvent,strMtName, strMtIp, isOnLine);
	}
	
	public void callbackmcudisconnect()
	{
		ie.CallBackEvent();
	}

	static {System.loadLibrary("mcs");}
}
