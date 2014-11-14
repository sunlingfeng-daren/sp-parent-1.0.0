package com.kedacom.yctx.listener;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import com.keacom.yctx.meeting.SystemTools;

/**
 * 系统启动监听器
 * @author zhuyaoyao
 * @date 2014年4月30日
 */
public class SystemInitListener implements ServletContextListener {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void contextInitialized(ServletContextEvent sce) {

		String projectPath = sce.getServletContext().getRealPath("/");
		/*try {

			// 1启动中间件
//			SystemTools.startMiddleWare(projectPath);
			// 2登录中间件
//			SystemTools.loginTerminal();

			logger.info("login middle ware successful!");
		} catch (IOException e) {

			logger.info("start middle ware failed!");
			e.printStackTrace();
		} catch (InterruptedException e) {

			logger.info("login terminal error!");
			e.printStackTrace();
		}*/
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO 该方法尚未实现

	}

}
