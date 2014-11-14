package com.kedacom.jkzx.mtc;


import org.xvolks.jnative.JNative;
import org.xvolks.jnative.Type;
import org.xvolks.jnative.exceptions.NativeException;
import org.xvolks.jnative.pointers.Pointer;


public class Kdv2000BCtl implements Kdv2000B {
	private final static String dll_name = "ycjfsdk.dll" ;
	private final static int ret = 1 ;
	private final static int iNum = 2 ;
	private  MtcCallBoker boker ;   //回调处理le
	
	public native void setCallBack();
	
	public void setMtcCallBoker(MtcCallBoker boker) {
		this.boker = boker ;
	}
	
	public void NotifyCallback(int nEvent, int nValue, int index, int userdata/*保留字段*/) {	
		boker.saveEvent( nEvent, nValue, index ) ;	
	}
	
	public Kdv2000BCtl(MtcCallBoker boker) {
		this.boker = boker ;
	}
	
	static {
		System.loadLibrary("ycjfsdk") ;
	}
	
	public String regCallBack(String filename) {
		//注册回调函数
		String ret = "**" ;
		try {
			JNative jnCallBack = new JNative(dll_name,  "RegCBNotifyJava");
			jnCallBack.setRetVal(Type.VOID);
			jnCallBack.setParameter(0, filename);
			jnCallBack.invoke();
			return ret ;
		} catch (NativeException e) {
			return e.getMessage() ;
		} catch (IllegalAccessException e) {
			return e.getMessage() ;
		}
	}
	
	@Override
	public short BurnLabelControl(int wFileCount, String lpstrUploadFileName,
			String lpstrIpAddr, String lpstrName, String lpstrPassWord, /*String mtip,*/ 
			/*String burnip, int version, int serverid,*/ int index)   {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "BurnLabelControl");		
			startMeet.setParameter(0, wFileCount) ;
			startMeet.setParameter(1, lpstrUploadFileName) ;
			startMeet.setParameter(2, lpstrIpAddr) ;
			startMeet.setParameter(3, lpstrName) ;
			startMeet.setParameter(4, lpstrPassWord) ;
			/*startMeet.setParameter(5, mtip) ;
			startMeet.setParameter(6, burnip) ;
			startMeet.setParameter(7, version) ;
			startMeet.setParameter(8, serverid) ;*/
			startMeet.setParameter(5, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	
	@Override
	public short InquireBurnStatus(int index) { 
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "InquireBurnStatus");	
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public short InquireRecStatus(int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "InquireRecStatus");
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int LaterBurnControl(String lpmtip, String lpstrBurnIP, int dwVersion,
			int dwServerID, String lpstrFilePath, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "LaterBurnControl");	
			startMeet.setParameter(0, lpmtip) ;
			startMeet.setParameter(1, lpstrBurnIP) ;
			startMeet.setParameter(2, dwVersion) ;
			startMeet.setParameter(3, dwServerID) ;
			startMeet.setParameter(4, lpstrFilePath) ;
			startMeet.setParameter(5, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public short ReleaseBurnSource(int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "ReleaseBurnSource");	
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int StartVisit(String lpstrLocalIP, String lpstrRemoteIP,
			String lpstrRecIP, String lpstrVmpIP, String lpstrMixerIP,
			String lpstrBurnIP, short wCallRate, EmMtVideoPort emFVPort,
			EmMtVideoPort emSVPort, int dwVersion, int dwServerID, int index, int isDual, int isHasRecorder) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "StartVisit");
			startMeet.setParameter(0, lpstrLocalIP) ;
			startMeet.setParameter(1, lpstrRemoteIP) ;
			startMeet.setParameter(2, lpstrRecIP);
			startMeet.setParameter(3, lpstrVmpIP);
			startMeet.setParameter(4, lpstrMixerIP);
			startMeet.setParameter(5, lpstrBurnIP);
			startMeet.setParameter(6, wCallRate) ;
			startMeet.setParameter(7, emFVPort.getValue()) ;
			startMeet.setParameter(8, emSVPort.getValue()) ;
			startMeet.setParameter(9, dwVersion) ;
			startMeet.setParameter(10, dwServerID) ;
			startMeet.setParameter(11, index) ;
			startMeet.setParameter(12, isDual) ;
			startMeet.setParameter(13, isHasRecorder);
			
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}
	
	@Override
	public int StartVisitWithOutRecVmpMixerBurn(String lpstrLocalIP, String lpstrRemoteIP,
			short wCallRate, EmMtVideoPort emFVPort,
			EmMtVideoPort emSVPort, int dwVersion, int dwServerID, int index, int isDual, int isHasRecorder) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "StartVisitWithOutRecVmpMixerBurn");
			startMeet.setParameter(0, lpstrLocalIP) ;
			startMeet.setParameter(1, lpstrRemoteIP) ;
			startMeet.setParameter(2, wCallRate) ;
			startMeet.setParameter(3, emFVPort.getValue()) ;
			startMeet.setParameter(4, emSVPort.getValue()) ;
			startMeet.setParameter(5, dwVersion) ;
			startMeet.setParameter(6, dwServerID) ;
			startMeet.setParameter(7, index) ;
			startMeet.setParameter(8, isDual) ;
			startMeet.setParameter(9, isHasRecorder);
			
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}
	
	@Override
	public int StopVisit(EmMtVideoPort emVPort, byte bBurnLabel, Pointer path, int len, int index) {
		int r = 0 ;
		try {
			JNative startMeet = new JNative(dll_name, "StopVisit");
			
			startMeet.setParameter(0, emVPort.getValue()) ;
			startMeet.setParameter(1, bBurnLabel) ;
			startMeet.setParameter(2, path) ;
			startMeet.setParameter(3, len) ;
			startMeet.setParameter(4, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return  r;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}
	
	
	public int MonitorStyle(byte bBurnLabel, String localIP, String lpstrRecIP, String burnip, int bStart, int dwVersion, byte byRecServerID, Pointer path, int len, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "MonitorStyle");
			startMeet.setParameter(0, bBurnLabel) ;
			startMeet.setParameter(1, localIP) ;
			startMeet.setParameter(2, lpstrRecIP) ;
			startMeet.setParameter(3, burnip) ;
			startMeet.setParameter(4, bStart) ;
			startMeet.setParameter(5, dwVersion);
			startMeet.setParameter(6, byRecServerID);
			startMeet.setParameter(7, path) ;
			startMeet.setParameter(8, len) ;
			startMeet.setParameter(9, index) ;
			
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
			return r ;
		}catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}
	
	public int SelVideoSrc(String mtip, EmMtVideoPort emVPort, int index){
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "SelVideoSrc");
			startMeet.setParameter(0, mtip) ;
			startMeet.setParameter(1, emVPort.getValue()) ;
			startMeet.setParameter(2, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
			return r ;
		}catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int StartVisitInConf(String lpstrLocalIP, String lpstrRecIP,
			String lpstrMixerIP, String lpstrBurnIP, EmMtVideoPort emFVPort,
			EmMtVideoPort emSVPort, int dwVersion, int dwServerId, int index, int isDual, int isHasRecorder) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "StartVisitInConf");		
			startMeet.setParameter(0, lpstrLocalIP) ;
			startMeet.setParameter(1, lpstrRecIP) ;
			startMeet.setParameter(2, lpstrMixerIP) ;
			startMeet.setParameter(3, lpstrBurnIP) ;
			startMeet.setParameter(4, emFVPort.getValue()) ;
			startMeet.setParameter(5, emSVPort.getValue()) ;
			startMeet.setParameter(6, dwVersion) ;
			startMeet.setParameter(7, dwServerId) ;
			startMeet.setParameter(8, index) ;
			startMeet.setParameter(9, isDual) ;
			startMeet.setParameter(10, isHasRecorder);
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ; 
			
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int StopVisitInConf(EmMtVideoPort emVPort, byte bBurnLabel, Pointer path, int len, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "StopVisitInConf");
			startMeet.setParameter(0, emVPort.getValue()) ;
			startMeet.setParameter(1, bBurnLabel) ;
			startMeet.setParameter(2, path) ;
			startMeet.setParameter(3, len) ;
			startMeet.setParameter(4, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt();
			return r ;
		}catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return  iNum;
		}
	}

	@Override
	public short GiveProof(EmMtVideoPort emVPort, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "GiveProof");		
			startMeet.setParameter(0, emVPort.getValue()) ;
			startMeet.setParameter(1, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return (short)r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int SdkLogSwitch(int bStdOutOn, int bOspOutOn, int bFileOutOn,
			String filepath) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "SdkLogSwitch");		
			startMeet.setParameter(0, bStdOutOn) ;
			startMeet.setParameter(1, bOspOutOn) ;
			startMeet.setParameter(2, bFileOutOn) ;
			startMeet.setParameter(3, filepath) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int YCJFInit(int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "YCJFInit");		
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
		return r;
	}

	@Override
	public int DualStream(String mtip, EmMtVideoPort emVPort, int bStart, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "Dual");	
			startMeet.setParameter(0, mtip) ;
			startMeet.setParameter(1, emVPort.getValue()) ;
			startMeet.setParameter(2, bStart) ;
			startMeet.setParameter(3, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
		return r;
	}

	@Override
	public int YCJFUploadFile(int wFileCount, String lpstrUpldFileName,
			String lpstrFtpIpAddr, String lpstrFtpName, String lpstrFtpPswd, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "YCJFUploadFile");		
			startMeet.setParameter(0, wFileCount) ;
			startMeet.setParameter(1, lpstrUpldFileName) ;
			startMeet.setParameter(2, lpstrFtpIpAddr) ;
			startMeet.setParameter(3, lpstrFtpName) ;
			startMeet.setParameter(4, lpstrFtpPswd) ;
			startMeet.setParameter(5, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public int RecoveVisit(int isP2p, String lpstrLocalIP, String lpstrRecIP,
			String lpstrVmpIP, String lpstrMixerIP, String lpstrBurnIP,
			int dwServerID, int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "RecoverVisit");	
			startMeet.setParameter(0, isP2p) ;
			startMeet.setParameter(1, lpstrLocalIP) ;
			startMeet.setParameter(2, lpstrRecIP) ;
			startMeet.setParameter(3, lpstrVmpIP) ;
			startMeet.setParameter(4, lpstrMixerIP) ;
			startMeet.setParameter(5, lpstrBurnIP) ;
			startMeet.setParameter(6, dwServerID) ;
			startMeet.setParameter(7, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			
			r = startMeet.getRetValAsInt() ;
			return r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
	}

	@Override
	public void SendVmpFrameCmd(int bP2PConf, byte byMode, int index) {
		JNative startMeet;
		try {
			startMeet = new JNative(dll_name, "SendVmpFrameCmd");
			startMeet.setParameter(0, bP2PConf) ;
			startMeet.setParameter(1, byMode) ;
			startMeet.setParameter(2, index) ;
			startMeet.setRetVal(Type.VOID) ;
			startMeet.invoke() ;
		} catch (NativeException e) {
			System.out.println(e.getMessage());
		} catch (IllegalAccessException e) {
			System.out.println(e.getMessage());
		}	
	}

	@Override
	public void SendMtLocalFrameCmd(String mtip, int index) {
		JNative startMeet;
		try {
			startMeet = new JNative(dll_name, "SendMtLocalFrameCmd");
			startMeet.setParameter(0, mtip) ;
			startMeet.setParameter(1, index) ;
			startMeet.setRetVal(Type.VOID) ;
			startMeet.invoke() ;
		} catch (NativeException e) {
			System.out.println(e.getMessage());
		} catch (IllegalAccessException e) {
			System.out.println(e.getMessage());
		}	
	}

	@Override
	public int RecoveMonitor(String lpstrLocalIP, String lpstrRecIP,
			String lpstrBurnIP, int index) {
		int r = 0 ;
		JNative startMeet;
		try {
			startMeet = new JNative(dll_name, "RecoverMonitor");
			startMeet.setParameter(0, lpstrLocalIP) ;
			startMeet.setParameter(1, lpstrRecIP) ;
			startMeet.setParameter(2, lpstrBurnIP) ;
			startMeet.setParameter(3, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
			return r ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}	
		
	}
	
	/*public static int bytesToInt(byte[] bytes,int i)   
    {   
        int intval = bytes[i]&0xff;   
        intval |=(bytes[i+1]<<8)&0xff00;   
        intval |=(bytes[i+2]<<16)&0xff0000;   
        intval |=(bytes[i+3]<<24)&0xff000000;   
        return intval;   
    } */

	/*public static void main(String args[]) {
		byte b[] = {0,1,2,3} ;
		Kdv2000BCtl kdv = new Kdv2000BCtl(null) ;
		int index = kdv.YCJFInit(0) ;
		
		kdv.setCallBack() ;
		int r = kdv.LaterBurnControl("127.0.0.1", "172.16.82.150", 1, 0, "201211_3011_0734K", index) ;
		System.out.println("start meet r "+ GetRetInfo.getErrorInfo(r));
		while(true) ;
	}*/

	@Override
	public int YCJFDestory(int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "YCJFDestory");		
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
		return r;
	}

	@Override
	public int RecoverConnect(String lpstrLocalIP,
			String lpstrRecIP, String lpstrVmpIP, String lpstrMixerIP,
			String lpstrBurnIP, byte bConnectMT, byte bConnectRec,
			byte bConnectVmp, byte bConnectMixer, byte bConnectBurn,
			int dwServerID, int dwIndex) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "RecoverConnect");		
			startMeet.setParameter(0, lpstrLocalIP) ;
			startMeet.setParameter(1, lpstrRecIP) ;
			startMeet.setParameter(2, lpstrVmpIP) ;
			startMeet.setParameter(3, lpstrMixerIP) ;
			startMeet.setParameter(4, lpstrBurnIP) ;
			startMeet.setParameter(5, bConnectMT) ;
			startMeet.setParameter(6, bConnectRec) ;
			startMeet.setParameter(7, bConnectVmp) ;
			startMeet.setParameter(8, bConnectMixer) ;
			startMeet.setParameter(9, bConnectBurn) ;
			startMeet.setParameter(10, dwServerID) ;
			startMeet.setParameter(11, dwIndex) ;
			
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
		return r;
	}

	@Override
	public int DisconnectMT(int index) {
		int r ;
		try {
			JNative startMeet = new JNative(dll_name, "DisconnectMT");		
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			r = startMeet.getRetValAsInt() ;
		} catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return iNum ;
		}
		return r;
	}

	@Override
	public String getPeerTerminalIp(int index) {
		String peerip = null ;
		try {
			JNative startMeet = new JNative(dll_name, "GetPeerTerminalIp");		
			startMeet.setParameter(0, index) ;
			startMeet.setRetVal(Type.INT) ;
			startMeet.invoke() ;
			peerip = startMeet.getRetVal() ;
		} catch (NativeException e) {
			
		} catch (IllegalAccessException e) {
			
		}
		return peerip;
	}

	@Override
	public int IsInP2PConf(String localipaddr, Pointer remotee164,
			Pointer remotealias, int index) {
		int r ;
		try {
			JNative IsInP2PConf = new JNative(dll_name, "IsInP2PConf");
			IsInP2PConf.setParameter(0, localipaddr) ;
			IsInP2PConf.setParameter(1, remotee164) ;
			IsInP2PConf.setParameter(2, remotealias) ;
			IsInP2PConf.setParameter(3, index) ;
			IsInP2PConf.setRetVal(Type.INT) ;
			IsInP2PConf.invoke() ;
			r = IsInP2PConf.getRetValAsInt();
			return r ;
		}catch (NativeException e) {
			return ret ;
		} catch (IllegalAccessException e) {
			return  iNum;
		}
	}
}
