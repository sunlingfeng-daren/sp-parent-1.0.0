<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<%@ include file="/resource.jsp"%>
    <title>广西壮族自治区地图</title>
	<script src="${RESOUCE_STATIC_URL}/js/jquery1.11.1.js"></script>
</head>
<script type="text/javascript">
 function startmonitor(){
	 var localip = $('#lcoalip').val();//H600终端ip
	 var remoteip = $('#remoteip').val();//5610终端ip
	 <%--alert(${RESOUCE_STATIC_URL});--%>
	 $.get('${RESOUCE_SYSTEM_URL}/meeting/sp/p2p/start',{'localip':localip,'remoteip':remoteip},function(data){
		 alert(data.msg);
		 if(data.success==true){
				$('#meetingid').val(data.meetingid);
				//开始监控 图像 
				var monitor = document.getElementById("monitor_obj");
				monitor.StartMonitor(localip,"HD");
			}
		});
 }
 
 function stopmonitor(){
	 var meetingid = $('#meetingid').val();
	 var localip = $('#lcoalip').val();//H600终端
	 $.get('${RESOUCE_SYSTEM_URL}/meeting/sp/p2p/stop',{'meetingid':meetingid,'localip':localip},function(data){
			alert(data.msg);
			if(data.success==true){
				var monitor = document.getElementById("monitor_obj");
				monitor.ExitMonitor("HD");
			}
		});
 }
 
 /* function startmonitor(){
		var monitor = document.getElementById("monitor");
		monitor.StartMonitor("58.244.185.34","HD");
 }
	function exitmonitor(){
		var monitor = document.getElementById("monitor");
		monitor.ExitMonitor("HD");
 } */

</script>
<body>
	<div style="height:100%; width:40%;float:left">
		<input id="meetingid" type="hidden"/>
		<div>本地ip:<input id="lcoalip" type="text" value="58.244.185.34"/></div>
		<div>远端ip:<input id="remoteip" type="text" value="58.244.177.250"/></div>
		<button onclick="startmonitor()">监控</button>
		<button onclick="stopmonitor()">结束监控</button>
	</div>
	<div id="remotemonitor" style="width:57%;height:600px;float:left">
			<OBJECT id="monitor_obj" width="100%" height="100%" CLASSID="CLSID:57827d40-8860-42a4-93ee-66c5c16412c9" codebase="${RESOUCE_STATIC_URL}/RemoteMonitor.cab#version=1,0,0,6"></OBJECT>
	</div>
	
</body>
</html>