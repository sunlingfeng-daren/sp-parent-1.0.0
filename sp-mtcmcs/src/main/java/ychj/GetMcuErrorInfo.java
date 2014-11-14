package ychj;

public class GetMcuErrorInfo {
	public static final int  YCHJ_ERR_BASE =  1000 ;
	public static final int YCHJ_OK  =  0 ;
	public static final int YCHJ_ERR_GET_MCUCONFINFO_FIELD     =  YCHJ_ERR_BASE+1 ;        // 获取obj mcuinfo field失败
	public static final int YCHJ_ERR_MCS_INI_FAILED            =  YCHJ_ERR_BASE+2 ;       // mcs初始化失败
	public static final int YCHJ_ERR_NO_FREE_SESSION           =  YCHJ_ERR_BASE+3 ;       // 无空闲会话
	public static final int YCHJ_ERR_INVALID_SESSION           =  YCHJ_ERR_BASE+4 ;        // 会话无效
	public static final int YCHJ_ERR_CREATE_SESSION_FAILED     =  YCHJ_ERR_BASE+5 ;        // 创建对话失败
	public static final int YCHJ_ERR_CONN_MCU_FAILD            =  YCHJ_ERR_BASE+6 ;        // 连接mcu失败
	public static final int YCHJ_ERR_GET_CONFINFO_FIELD        =  YCHJ_ERR_BASE+7 ;        // 获取obj confinfo filedid失败
	public static final int YCHJ_ERR_PARAM_INVALID             =  YCHJ_ERR_BASE+8 ;        // 参数无效
	public static final int YCHJ_ERR_MEM_JOINED_CONF           =  YCHJ_ERR_BASE+9 ;        // 成员已经在其它会见中
	public static final int YCHJ_ERR_CONFTABLE_INVALID         =  YCHJ_ERR_BASE+10;        // 会议表单无效
	public static final int YCHJ_ERR_MCUINFO_INVALID           =  YCHJ_ERR_BASE+11 ;       // mcu信息无效
	public static final int YCHJ_ERR_NO_CONF_SELECTED          =  YCHJ_ERR_BASE+12  ;      // 未指定会议
	public static final int YCHJ_ERR_GET_MEMINFO_FIELD         =  YCHJ_ERR_BASE+13 ;       // 获取obj meminfo filedid失败
	public static final int YCHJ_ERR_OFFICERINFO_INVALID       =  YCHJ_ERR_BASE+14 ;       // 狱警信息无效
	public static final int YCHJ_ERR_NO_CONF_ONGOING           =  YCHJ_ERR_BASE+15 ;       // 无进行中的会议
	public static final int YCHJ_ERR_CONF_INFO_INVALID         =  YCHJ_ERR_BASE+16 ;       // 会议信息无效 
	public static final int YCHJ_ERR_MEM_INFO_INVALID          =  YCHJ_ERR_BASE+17 ;       // 访问者\受访者信息无效 
	public static final int YCHJ_ERR_MCU_DISCONNECT			   =  YCHJ_ERR_BASE+18 ;       // mcu断链 
	public static final int YCHJ_ERR_GET_VIDEOINFO_FIELD       =  YCHJ_ERR_BASE+19 ;       // 获取videoinfo filedid失败
	public static final int YCHJ_ERR_GET_CONF_NAME_FAILED      =  YCHJ_ERR_BASE+20 ;       // 获取conftable's conf name失败
	public static final int YCHJ_ERR_MEMORY_NOT_ENOUGH         =  YCHJ_ERR_BASE+21 ;       // 空间不足
	public static final int YCHJ_ERR_CONF_CREATE_FAILED        =  YCHJ_ERR_BASE+22 ;       // 创会失败
	public static final int YCHJ_ERR_GET_OFFICER_INFO_FAILED   =  YCHJ_ERR_BASE+23 ;       // 查询预警信息失败
	public static final int YCHJ_ERR_MT_INFO_INVALID           =  YCHJ_ERR_BASE+24 ;       // 终端别名无效
	public static final int YCHJ_ERR_GET_MSGINFO_FIELD         =  YCHJ_ERR_BASE+50 ;      // 获取obj msginfo filedid失败
	public static final int YCHJ_ERR_MSG_ROLL_TIMES            =  YCHJ_ERR_BASE+51 ;      // 短消息滚动次数范围[1，255]
	public static final int YCHJ_ERR_MSG_ROLL_RATE             =  YCHJ_ERR_BASE+52 ;       // 短消息滚动频率范围[1，3]
	public static final int YCHJ_ERR_MSG_ROLL_TYPE             =  YCHJ_ERR_BASE+53 ;       // 短消息滚动类型范围[0，2]
	public static final int YCHJ_ERR_MSG_INVALID               =  YCHJ_ERR_BASE+54 ;       // 短消息内容或长度无效
	public static final int YCHJ_ERR_MSG_PAGE_INVALID          =  YCHJ_ERR_BASE+55 ;       // 字幕内容无效
	public static final int YCHJ_ERR_PAPERWORK_MODE_INVALID    =  YCHJ_ERR_BASE+56 ;       // 举证类型错误
	public static final int YCHJ_ERR_MCURECODE_IDEL            =  YCHJ_ERR_BASE+58 ;       // mcu没有远程接访录像机资源
	public static final int YCHJ_ERR_MCUVMPORMIX_IDEL          =  YCHJ_ERR_BASE+59 ;      // mcu没有混音或画面合成资源
	public static final int YCHJ_ERR_MCUCONFNAME_EXIST        =   YCHJ_ERR_BASE+60  ;     // 会议名重复      

	
	
	public static String getErrorInfo(int ret) { //根据错误码返回错误描述
		switch(ret) {
		case 0 :
			return "success" ;
		case 1001:
			return "获取mcu信息失败" ;
		case 1002:
			return "会议控制台初始化失败" ;
		case 1003:
			return "无空闲会话" ;
		case 1004:
			return "会话无效" ;
		case 1005:
			return "创建对话失败" ;
		case 1006:
			return "连接mcu失败" ;
		case 1007:
			return "获取会议信息失败" ;
		case 1008:
			return "参数无效" ;
		case 1009:
			return "成员已在其他会见中" ;
		case 1010:
			return "会议表单无效" ;
		case 1011:
			return "mcu信息无效" ;
		case 1012:
			return "未指定会议" ;
		case 1015:
			return "无进行中的会议" ;
		case 1016:
			return "会议信息无效" ;
		case 1017:
			return "上访\\受访者信息无效" ;
		case 1018:
			return "mcu断链" ;
		case 1020 :
			return "mcu 无法获取相应的会议" ;
		case 1021:
			return "空间不足 " ;
		case 1022:
			return "创建会议失败" ;
		case 1024:
			return "终端别名无效" ;
		case 1058 :
			return "MCU侧无录像机或没有配置远程接访专用录像机" ;
		case YCHJ_ERR_MCUVMPORMIX_IDEL :
			return "MCU没有混音或画面合成资源" ;
		case YCHJ_ERR_MCUCONFNAME_EXIST :
			return "MCU上同名会议已存在，请改变会议名称" ;
		default:
			if(ret > 12000) {
				return "视频会议平台内部错误，错误码：" + ret ;
			}
			return "未知错误错误码 ： " + ret ;
		}
	}
}
