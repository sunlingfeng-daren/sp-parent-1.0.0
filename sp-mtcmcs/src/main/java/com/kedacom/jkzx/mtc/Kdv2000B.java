package com.kedacom.jkzx.mtc;

import org.xvolks.jnative.pointers.Pointer;

// modify wlf 2013-05-09  改动startvisist  和 startvisitinconf  两个接口，增加isDual  是否发起双流接口

/**
 * kdv2000B 接口类
 */
public interface Kdv2000B {
	
	// index 均为视频会议组件返回给接访平台的用于以后服务的凭证
	/**
	 * 提示日志接口
	 */
	public int SdkLogSwitch(int bStdOutOn, int bOspOutOn, int bFileOutOn, String filepath) ;
	
	/**
	 * 初始化视频会议组件
	 */
	public int YCJFInit( int index ) ; 
	
	public int YCJFDestory(int index)  ;
	
	/**
	 * 点对点和多点会议通用接口
	 */
	//切换双流接口
	public short GiveProof(EmMtVideoPort emVPort, int index)  ;  
	// 释放刻录机
	public short ReleaseBurnSource(int index);   
	
	// 重连终端或外设
	public int RecoverConnect(String lpstrLocalIP, String lpstrRecIP, String lpstrVmpIP,String lpstrMixerIP, 
			String lpstrBurnIP, byte bConnectMT, byte bConnectRec, byte bConnectVmp, byte bConnectMixer, byte bConnectBurn, 
			int dwServerID/*暂时为零*/, int dwIndex);
	
	/**
	 * 上传并刻录笔录文件
	 * @param wFileCount  上传文件数量 
	 * @param lpstrUploadFileName  上传文件名
	 * lpstrIpAddr burnip 暂时为同一ip 均为2000B ip 
	 */
	public short BurnLabelControl(int wFileCount, String lpstrUploadFileName, String lpstrIpAddr, String lpstrName, String lpstrPassWord,/* String mtip, */
			/*String burnip, int version, int serverid,*/ int index);   
	
	/**
	 * 后期补刻使用
	 * @param lpstrBurnIP   刻录机IP
	 * @param dwVersion     SDK版本号
	 * @param dwServerID    服务ID
	 * @param lpstrFilePath 2000B中的文件路径   和停止接访时路径一致即可
	 * @return
	 */
	public int LaterBurnControl(String lpmtip, String lpstrBurnIP, int dwVersion, int dwServerID, String lpstrFilePath, int index) ;
	
	/**
	 * 重连终端和外设，主要是为了避免tomcat崩溃后无法结束会议
	 * @param lpstrLocalIP   本地终端地址
	 * @param lpstrRecIP     录像机地址
	 * @param lpstrVmpIP     画面合成器地址
	 * @param lpstrMixerIP   混音器地址
	 * @param lpstrBurnIP    刻录机地址
	 * @param dwServerID     服务号
	 * @return
	 */
	public int RecoveVisit(int isPp, String lpstrLocalIP, String lpstrRecIP, String lpstrVmpIP, String lpstrMixerIP, String lpstrBurnIP, 
			int dwServerID, int index);
	public int RecoveMonitor(String lpstrLocalIP, String lpstrRecIP, String lpstrBurnIP, int index); // 本地重连终端
	
	
	/**
	 * 
	 * 向vmp请求编关键帧
	 */
	public void SendVmpFrameCmd(int bP2PConf, byte byMode, int index)  ;   // bp2pconf  0 多点会议  1  点对点    bymode 1 2000B 模式   2 2000模式
	
	// 本地录像中请求编关键帧
	public void SendMtLocalFrameCmd(String mtip, int index) ;
	
	/**
	 * 两点会议中使用
	 * 
	 */
	// 获取录像机状态 , 只能在会议中调用
	public short InquireRecStatus(int index);    
	// 获取刻录机状态，只能在会议中调用
	public short InquireBurnStatus(int index );   
	/**
	 * 开始接访
	 * @param lpstrLocalIP   上访终端IP
	 * @param lpstrRemoteIP  接访终端IP
	 * @param lpstrRecIP     录像机IP
	 * @param lpstrVmpIP     画面合成器IP
	 * @param lpstrMixerIP   混音IP
	 * @param lpstrBurnIP    刻录机IP
	 * @param wCallRate      点对点呼叫码率
	 * @param emFVPort       主视频端口（c1-c6端口）
	 * @param emSVPort       双流视频端口
	 * @param dwVersion      SDK版本号
	 * @param dwServerID     本次服务id号
	 * @param isHasRecorder  无录像机资源时，是否允许开启接访
	 * @return
	 */
	public int StartVisit(String lpstrLocalIP, String lpstrRemoteIP, String lpstrRecIP, String lpstrVmpIP,
			String lpstrMixerIP, String lpstrBurnIP, short wCallRate, EmMtVideoPort emFVPort, EmMtVideoPort emSVPort,
	  int dwVersion, int dwServerID, int index , int isDual,int isHasRecorder);   // 开始接访
	
	/**
	 * 开始接访
	 * @param lpstrLocalIP   上访终端IP
	 * @param lpstrBurnIP    刻录机IP
	 * @param wCallRate      点对点呼叫码率
	 * @param emFVPort       主视频端口（c1-c6端口）
	 * @param emSVPort       双流视频端口
	 * @param dwVersion      SDK版本号
	 * @param dwServerID     本次服务id号
	 * @param isHasRecorder  无录像机资源时，是否允许开启接访
	 * @return
	 */
	public int StartVisitWithOutRecVmpMixerBurn(String lpstrLocalIP, String lpstrRemoteIP, short wCallRate, EmMtVideoPort emFVPort, EmMtVideoPort emSVPort,
	  int dwVersion, int dwServerID, int index , int isDual,int isHasRecorder);   // 开始接访
	
	/**
	 * 获取是否在点对点会议中
	 * @param localipaddr
	 * @param remotee164
	 * @param remotealias
	 * @param index
	 * @return
	 */
	public int IsInP2PConf(String localipaddr, Pointer remotee164, Pointer remotealias, int index);
	
	/**
	 * 停止接访
	 * @param emVPort 对应的双流源端口
	 * bBurnLabel 是否刻录笔录           1， 刻录笔录， 0， 不刻录
	 * @return 文件夹地址   （rtsp 地址格式）
	 */
	public int StopVisit(EmMtVideoPort emVPort, byte bBurnLabel, Pointer path, int len, int index);   // 停止接访  参数：对应的双流源端口   
	
	
	/**
	 * 多点会议接口
	 * @param isHasRecorder 无录像机资源时，是否允许开启接访
	 */
	
	// 多点会议中开始录像，混音以及刻录
	public int StartVisitInConf(String lpstrLocalIP, String lpstrRecIP, String lpstrMixerIP, String lpstrBurnIP, 
			EmMtVideoPort emFVPort, EmMtVideoPort emSVPort, int dwVersion, int dwServerID, int index ,int isDual, int isHasRecorder) ;
	// 结束录像 bBurnLabel 是否刻录笔录
	public int StopVisitInConf(EmMtVideoPort emVPort, byte bBurnLabel, Pointer path, int len, int index) ;
	
	
	/**
	 * 以下为本地监控接口
	 */
	// 开启本地监控模式
	public int MonitorStyle(byte bBurnLabel, String localIP, String burnip, String lpstrRecIP, int bStart, int dwVersion, byte byRecServerID, Pointer path, int len, int index) ;
	// 本地监控模式, mcu录像,切换主源
	int SelVideoSrc(String mtip, EmMtVideoPort emVPort, int index) ;
	
	/**
	 * 一下接口均为2000模式下的定制接口
	 */
	
	int DualStream(String mtip, EmMtVideoPort emVPort, int bStart, int index ) ; //发送双流
	
	int YCJFUploadFile(int wFileCount, String lpstrUpldFileName,String lpstrFtpIpAddr, String lpstrFtpName, String lpstrFtpPswd, int index) ;
	
	// 断开终端连接
	int DisconnectMT(int index);
	
	/**
	 * 获取与会对端终端的ip
	 * @param index
	 * @return
	 */
	String getPeerTerminalIp(int index);
	
	

	
}
