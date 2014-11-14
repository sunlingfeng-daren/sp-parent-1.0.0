package com.kedacom.jkzx.mtc;

/**
 * 2000B 错误码描述
 * @author wanglifei
 *
 */
public class GetRetInfo {
	 public final static int YCJF_OK = 0 ;	//操作正常
	 public final static int YCJF_ERR_BASE = 1000 ; //基准值
	 public final static int YCJF_ERR_EQP_MEMORY_LIMITED	=	YCJF_ERR_BASE+1	;	//内存不足	
	 public final static int YCJF_ERR_CONNECT_MT_FAILED	=	YCJF_ERR_BASE+2	;	//连接MT失败
	 public final static int YCJF_ERR_EQP_GETCONTACK_FAILED	=YCJF_ERR_BASE+3;		//未收到连接成功回复
	 public final static int YCJF_ERR_EQP_MT_IN_CONF		=	YCJF_ERR_BASE+4;		//终端在多点会议中
	 public final static int YCJF_ERR_EQP_MT_IN_P2PCONF	=	YCJF_ERR_BASE+5	;	//终端在点对点会议中
	 public final static int YCJF_ERR_EQP_P2P_FAILED	=		YCJF_ERR_BASE+6	;	//创建点对点会议失败
	 public final static int YCJF_ERR_NULL_POINTER			=	YCJF_ERR_BASE+7	;	//空指针
	 public final static int YCJF_ERR_EQP_STARTDUAL_FAILED =	YCJF_ERR_BASE+8	;	//发送双流失败
	 public final static int YCJF_ERR_CONNECT_MT_FIRST		=YCJF_ERR_BASE+9;		//请先连接终端
	 public final static int YCJF_ERR_CHANGE_PROOF			=YCJF_ERR_BASE+10;	//切换举证失败
	 public final static int YCJF_ERR_FTP_UPLOAD			=	YCJF_ERR_BASE+11;	//FTP上传失败
	 public final static int YCJF_ERR_GET_FULLNAME			=YCJF_ERR_BASE+12;	//获取文件全名失败
	 public final static int YCJF_ERR_SYS_API_INIT			=	YCJF_ERR_BASE+13;	//系统API初始化失败
	 public final static int YCJF_ERR_REQ_EQP_SOURCE		=	YCJF_ERR_BASE+14;	//请求外设资源失败
	 public final static int YCJF_ERR_INVALID_VIDEO_SOURCE	=YCJF_ERR_BASE+15	;//无效视频源
	 public final static int YCJF_ERR_INVALID_IP			=		YCJF_ERR_BASE+16;	//无效IP
	 public final static int YCJF_ERR_START_VISIT_FIRST		=	YCJF_ERR_BASE+17;	//请先开启接访
	 public final static int YCJF_ERR_BURN_LABEL_UNFINISH	=YCJF_ERR_BASE+18	;//刻录笔录文件未完成
	 public final static int YCJF_ERR_FTP_INIT				=	YCJF_ERR_BASE+19;	//FTP初始化失败
	 public final static int YCJF_ERR_SELECT_SECOND_SOURCE	=YCJF_ERR_BASE+20;	//切换双流视频源失败
	 public final static int YCJF_ERR_INQUIRE_STREAM		=	YCJF_ERR_BASE+21;	//查询码流信息失败[kb 20120806]
	 public final static int YCJF_ERR_INVALID_PRIMARY_VIDEO_SOURCE =	YCJF_ERR_BASE+22;	//无效主视频源
	 public final static int YCJF_ERR_INVALID_SECOND_VIDEO_SOURCE =	YCJF_ERR_BASE+23;	//无效双流源
	 public final static int YCJF_ERR_NOT_SPEAKER		=		YCJF_ERR_BASE+24;	//该终端非发言人，不能发起双流
	 public final static int YCJF_ERR_FILE_LENGTH_SHORT	=	YCJF_ERR_BASE+25;	//文件路径长度过短
	 public final static int YCJF_ERR_SELECT_VIDEO			=	YCJF_ERR_BASE+26;	//切换主视频源失败[znn 20120802]
	 public final static int YCJF_ERR_MT_IN_FREE			=	YCJF_ERR_BASE+27;	//终端处于空闲[znn 20120803]
	 public final static int YCJF_ERR_CREATE_FILE_FAILED	=	YCJF_ERR_BASE+28;	//创建文件失败
	 public final static int YCJF_ERR_BURN_NOT_IN_SERVICE	=	YCJF_ERR_BASE+29;	//刻录机不在服务中
	 public final static int YCJF_ERR_NOT_IN_DUAL			=	YCJF_ERR_BASE+30;	//未发起双流
	 public final static int YCJF_ERR_REC_REG_FAILED		=	YCJF_ERR_BASE+31;	//录像机注册失败
	 public final static int	YCJF_ERR_REC_SER_FAILED		=	YCJF_ERR_BASE+32;	//录像机服务请求失败
	 public final static int YCJF_ERR_REC_STATUS_FAILED	=	YCJF_ERR_BASE+33	;//录像机状态查询失败
	 public final static int YCJF_ERR_BURN_REG_FAILED		=	YCJF_ERR_BASE+34;	//刻录机注册失败
	 public final static int	YCJF_ERR_BURN_SER_FAILED	=	YCJF_ERR_BASE+35;	//刻录机服务请求失败
	 public final static int YCJF_ERR_BURN_STATUS_FAILED	=	YCJF_ERR_BASE+36;	//刻录机状态查询失败
	 public final static int YCJF_ERR_CREATE_THREAD_FAILED	=	YCJF_ERR_BASE+37 ;	//创建线程失败
	 public final static int  YCJF_ERR_BURN_NOT_IN_IDLE		=	YCJF_ERR_BASE+38 ; // 刻录机正在服务  
	 
	 public final static int YCJF_ERR_FILE_NAME_LENGTH		=		YCJF_ERR_BASE+39 ;	//文件名长度错误
	 public final static int YCJF_ERR_CONF_FULL				=		YCJF_ERR_BASE+40 ;	//会议已满，不允许再开会议
	 public final static int YCJF_ERR_INDEX					=		YCJF_ERR_BASE+41 ;	//索引值错误
	 
	 public final static int YCJF_ERR_CONNECT_MT_AGAIN		=		YCJF_ERR_BASE+44 ;	//重连终端失败
	 public final static int YCJF_ERR_CONNECT_EQP_AGAIN		=		YCJF_ERR_BASE+45  ;  //重新连接外设失败
	 public final static int YCJF_ERR_FORBID_SELECT_VIDEO	=		YCJF_ERR_BASE+46 ;   // 该型号终端不支持切源功能
	 
	 public static String getErrorInfo(int ret) {
		 String error = "" ;
		 switch(ret) {
		 case YCJF_ERR_EQP_MEMORY_LIMITED :
			 error = "会议插件空间不足" ;
			 break ;		
		 case YCJF_ERR_CONNECT_MT_FAILED :
		 	error = "连接终端失败" ;
		 	break ;
		 case YCJF_ERR_EQP_GETCONTACK_FAILED :
			 error = "请确定网络连接正常或设备正常工作" ;
			 break ;
		 case YCJF_ERR_EQP_MT_IN_CONF :
			 error = "终端已参加其它多点接访" ;
			 break ;
		 case YCJF_ERR_EQP_MT_IN_P2PCONF :
			 error = "终端已参加其它点对点接访" ;
			 break ;
		 case YCJF_ERR_EQP_P2P_FAILED :
			 error = "创建点对点会议失败" ;
			 break ;
		 case YCJF_ERR_NULL_POINTER :
			 error = "系统数据传递错误或数据获取错误" ;
			 break ;
		 case YCJF_ERR_EQP_STARTDUAL_FAILED	:
		     error = "发送双流失败" ;
		 	 break ;
		 case YCJF_ERR_CONNECT_MT_FIRST :
			 error = "请先连接终端" ;
			 break ;
		 case YCJF_ERR_CHANGE_PROOF :
			 error = "切换举证失败" ;
			 break ;
		 case YCJF_ERR_FTP_UPLOAD :
			 error = "FTP上传文件到刻录播服务器失败" ;
			 break ;
		 case YCJF_ERR_GET_FULLNAME :
			 error = "获取文件全名失败" ;
			 break ;
		 case YCJF_ERR_SYS_API_INIT :
			 error = "视频会议系统调用初始化错误" ;
			 break ;
		 case YCJF_ERR_REQ_EQP_SOURCE :	
			 error = "请求外设资源失败" ;
			 break ;
		 case YCJF_ERR_INVALID_VIDEO_SOURCE :
			 error = "无效视频源" ;
			 break ;
		 case YCJF_ERR_INVALID_IP :
			 error = "无效IP" ;
			 break ;
		 case YCJF_ERR_START_VISIT_FIRST :
			 error = "请先开启接访" ;
			 break ;
		 case YCJF_ERR_BURN_LABEL_UNFINISH :
			 error = "刻录笔录文件未完成" ;
			 break ;
		 case YCJF_ERR_FTP_INIT :
			 error = "FTP初始化失败" ;
			 break ;
		 case YCJF_ERR_SELECT_SECOND_SOURCE :
			 error = "切换双流视频源失败" ;
			 break ;
		 case YCJF_ERR_INQUIRE_STREAM :
			 error  = "查询码流信息失败" ;
			 break ;
		 case YCJF_ERR_INVALID_PRIMARY_VIDEO_SOURCE	:
			 error = "无效主视频源" ;
			 break ;
		 case YCJF_ERR_INVALID_SECOND_VIDEO_SOURCE :
			 error = "无效双流源" ;
			 break ;
		 case YCJF_ERR_NOT_SPEAKER :
			 error = "该终端非发言人，不能发起双流" ;
			 break ;
		 case YCJF_ERR_FILE_LENGTH_SHORT :
			 error = "文件路径长度过短" ;
			 break ;
		 case YCJF_ERR_SELECT_VIDEO :
			 error = "切换主视频源失败" ;
			 break ;
		 case YCJF_ERR_CREATE_FILE_FAILED :
			 error = "创建文件失败" ;
			 break ;
		 case YCJF_ERR_MT_IN_FREE :
			 error = "终端处于空闲终端" ;
			 break ;
		 case YCJF_ERR_BURN_NOT_IN_SERVICE :
			 error = "刻录机不在服务中" ;
			 break ;
		 case YCJF_ERR_NOT_IN_DUAL :
			 error = "双流未发起" ;
			 break ;
		 case YCJF_ERR_REC_REG_FAILED :
			 error = "录像机注册失败" ;
			 break ;
		 case	YCJF_ERR_REC_SER_FAILED :
			 error = "录像机服务请求失败" ;
			 break ;
		 case YCJF_ERR_REC_STATUS_FAILED :
			 error = "录像机状态查询失败" ;
			 break ;
		 case YCJF_ERR_BURN_REG_FAILED :
			 error = "刻录机注册失败" ;
			 break ;
		 case	YCJF_ERR_BURN_SER_FAILED :
			 error = "刻录机服务请求失败" ;
			 break ;
		 case YCJF_ERR_BURN_STATUS_FAILED :
			 error = "刻录机状态查询失败" ;
			 break ;
		 case YCJF_ERR_BURN_NOT_IN_IDLE :
			 error = "已有刻录进行无法再次刻录" ;
			 break ;
		 case YCJF_ERR_CREATE_THREAD_FAILED :
			 error = "视频会议组件无法初始化" ;
			 break ;
		 case YCJF_ERR_FILE_NAME_LENGTH	 :
			 error = "文件名长度错误" ;
			 break ;
		 case YCJF_ERR_CONF_FULL :
			 error = "视频会议服务组件已达最大值， 无法提供新服务" ;
			 break ;
		 case YCJF_ERR_INDEX :
			 error = "视频服务不存在" ;
			 break ;
		 case YCJF_ERR_CONNECT_MT_AGAIN :
			 error = "重连终端失败" ;
			 break ;
		 case YCJF_ERR_CONNECT_EQP_AGAIN :
			 error = "重连外设失败" ;
			 break ;
		 case YCJF_ERR_FORBID_SELECT_VIDEO :
			 error = "该型号终端不支持切源功能" ;   
			 break ;
		default :
			error = "未知错误，错误码：" + ret ;
			break ;
		 }
		 return error ;
	 }

}
