package com.kedacom.yctx.controller;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xvolks.jnative.exceptions.NativeException;
import org.xvolks.jnative.pointers.Pointer;
import org.xvolks.jnative.pointers.memory.MemoryBlockFactory;
import com.kedacom.jkzx.mtc.EmMtVideoPort;
import com.kedacom.jkzx.mtc.GetRetInfo;
import com.kedacom.jkzx.mtc.Kdv2000BCtl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 会议控制器
 * @author zhuyaoyao
 * @date 2014年5月9日
 */
@Controller
@RequestMapping("/")
public class MeetingController {

	Logger logger = LoggerFactory.getLogger(getClass());
	private Kdv2000BCtl kdv = new Kdv2000BCtl(null); // 2000B开会类
	private Map<String,Integer> meetingMap = new HashMap<String,Integer>();//保存会议和index的对应关系
	
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(){
		return "index";
	}
	/**
	 * 开点对点会议，HD终端
	 * @param terminallist
	 * @param terminalids
	 * @param startcx
	 * @param startcy
	 * @param endcx
	 * @param endcy
	 * @param localfayuannum
	 * @param remotefayuannum
	 * @return jar/lib/ext
	 */
	@RequestMapping(value="/meeting/sp/p2p/start",method=RequestMethod.GET)
	@ResponseBody
	public ModelMap spStartHDP2PMeeting(String localip,String remoteip,HttpServletRequest request, HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		String msg = "开会失败";
		boolean success = false;
		String meetingid = String.valueOf(System.currentTimeMillis());
		
		// 保存服务索引 add wlf @20121203
		//int index = kdv.YCJFInit(0);
		logger.debug("kdvlog ret = " + kdv.SdkLogSwitch(1, 1, 1, "D:\\2000B_log\\log.txt"));
		int index = kdv.YCJFInit(0);
		logger.debug("ycjfsdk init " + index);
		modelMap.put("meetingid", meetingid);//会议索引
		// add by wlf 2012-12-07 对组件初始化进行判断
		if (index == GetRetInfo.YCJF_ERR_CREATE_THREAD_FAILED) {
			success = false;
			msg = "无法初始化视频会议组件";
		}
		int ret = kdv.StartVisitWithOutRecVmpMixerBurn(localip, remoteip, (short) 2048, /*
					* EmMtVideoPort.
					* emMtDVi1d
					*/
				EmMtVideoPort.emMtSdi5d/* 主源sdi */, EmMtVideoPort.emMtDVi1d/* 工作人员 */, 1, 0, index, 0/*是否发送辅流*/, 1/* 无录像机是否开会 */);
		if (0 != ret) {
			System.out.println("======================="+ret);
			System.out.println("======================="+GetRetInfo.YCJF_ERR_EQP_STARTDUAL_FAILED);
			if (ret != GetRetInfo.YCJF_ERR_EQP_STARTDUAL_FAILED) {
				kdv.YCJFDestory(index);
				success = false;
				msg = GetRetInfo.getErrorInfo(ret);
				
			} else if (ret == GetRetInfo.YCJF_ERR_REQ_EQP_SOURCE) {// 请求外设失败
					success = false;
					msg = GetRetInfo.getErrorInfo(ret);
					
			}
		} else {// 会议开启
			success = true;
			msg = "会议开启成功";
			meetingMap.put(meetingid, index);
		}
		modelMap.put("success", success);
		modelMap.put("msg", msg);
		writeJsonpRes(modelMap, request, response);
		return null;
	}
	
	
	/**
	 * 停止点对点会议 HD 高清终端
	 * @param index
	 * @param localip
	 * @return
	 * @throws NativeException
	 */
	@RequestMapping(value="/meeting/sp/p2p/stop",method=RequestMethod.GET)
	@ResponseBody
	public ModelMap spStopp2pHD(String meetingid,String localip, HttpServletRequest request, HttpServletResponse response) throws NativeException{
		ModelMap modelMap = new ModelMap();
		String msg = "结束点对点失败";
		boolean success = false;
		logger.debug("kdvlog ret = " + kdv.SdkLogSwitch(1, 1, 1, "D:\\2000B_log\\log.txt"));
		//获取会议模板
		byte isBurnLabel = 0;//不刻录笔录
		Pointer p = null;
		p = new Pointer(MemoryBlockFactory.createMemoryBlock(128));
		int index =  meetingMap.get(meetingid);
		int ret = kdv.StopVisit(EmMtVideoPort.emMtDVi1d, isBurnLabel, p, 128, index);

		logger.debug("2000B  点对点结会    " + ret);
		String videopath = null; // 录像地址
		videopath = p.getAsString();
		
		if (ret == GetRetInfo.YCJF_ERR_INDEX || ret == GetRetInfo.YCJF_ERR_CONNECT_MT_FAILED) { // 无效的服务索引， 认为崩溃
			ret = kdv.YCJFInit(index);
			
			if (ret == GetRetInfo.YCJF_ERR_CREATE_THREAD_FAILED) {
				success = false;
				msg = "无法初始化视频会议组件";
				
			}else{
				success = false;
				ret = kdv.RecoveVisit(0, localip, localip, localip, localip, localip, 0, index);
				logger.debug("  点对点连接2000B   " + ret);
				ret = kdv.StopVisit(EmMtVideoPort.emMtDVi1d, isBurnLabel, p, 128, index);
				videopath = p.getAsString();
				logger.debug("崩溃后点对点结会           " + ret);
				meetingMap.put(meetingid, ret);
			}
		}
		
		if(ret == 0){
			msg = "结束点对点会议成功";
			success = true;
			meetingMap.remove(meetingid);
		}
		modelMap.put("success", success);
		modelMap.put("msg", msg);
		writeJsonpRes(modelMap, request, response);
		return null;
		
	}

	/**
	 * 获取到callback，把返回值写到页面
	 * @param modelMap
	 * @param request
	 * @param response
	 */
	private void writeJsonpRes(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response){
		String callback = request.getParameter("callback");
		Gson gson=new Gson();
		gson.toJson(modelMap);
		String str = callback + "("+gson.toJson(modelMap)+")";
		try{
			response.setContentType("text/plain; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getOutputStream().write(str.getBytes("UTF-8"));
			response.getOutputStream().flush();
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
