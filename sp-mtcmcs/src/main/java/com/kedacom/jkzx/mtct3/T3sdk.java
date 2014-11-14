package com.kedacom.jkzx.mtct3;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Vector;

public class T3sdk {
	
	
	
	/**
	 * 加载动态库
	 */
	static {
		System.loadLibrary("mtct3dll");
	}
	
	
	
	/**
	 * 加载dll
	 */
	public void loadDll(){
		System.loadLibrary("mtct3dll");
	}
	/**
	  * 卸载已经装载的dll
	  * 
	  * @param dllName
	  *            库名，如Decode.dll
	  */
	 

	 public void freeDll() {
		 String dllName = "mtct3dll.dll";
	  try {
	   ClassLoader classLoader = this.getClass().getClassLoader();
	   Field field = ClassLoader.class.getDeclaredField("nativeLibraries");
	   field.setAccessible(true);
	   Vector<Object> libs = (Vector<Object>) field.get(classLoader);
	   Iterator<Object> it = libs.iterator();
	   System.out.println("[HHHHHHHHHHHHHHHHHHHHHHHHH]" + libs.size());
	   Object o;
	   while (it.hasNext()) {
	    o = it.next();
	    Field[] fs = o.getClass().getDeclaredFields();
	    boolean hasInit = false;
	    for (int k = 0; k < fs.length; k++) {
	     if (fs[k].getName().equals("name")) {
	      fs[k].setAccessible(true);
	      String dllPath = fs[k].get(o).toString();
	      System.out.println("[AAAAAAAAAAAAAAAAAAAAAAAAAAA]" + dllPath);
	      if (dllPath.endsWith(dllName)) {
	       hasInit = true;
	       System.out.println("[BBBBBBBBBBBBBBBBBBBBBBBBBBB]" + hasInit);
	      }
	     }
	    }
	    if (hasInit) {
	     Method finalize = o.getClass().getDeclaredMethod(
	       "finalize", new Class[0]);
	     finalize.setAccessible(true);
	     finalize.invoke(o, new Object[0]);
	     it.remove();        
	     libs.remove(o);
	     System.out.println("[CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCc]" + o);
	    }
	   }

	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	 }
	 
	/**
	 * 初始化sdk
	 * @return
	 */
	public native int initsystem();
	
	/**
	 * 销毁sdk
	 * @return
	 */
	public native void closesystem();
	
	/**
	 * 连接终端
	 * @param ip
	 * @return
	 */
	public native int connectmt(String ip);
	
	/**
	 * 开启点对点会议
	 * @param localip
	 * @param remoteip
	 * @return
	 */
	public native int startp2pmeeting(String localip,String remoteip);
	
	
	/**
	 * 请求发言人
	 * @return
	 */
	public native int reqspeak();
	
	/**
	 * 断开终端连接
	 * @return
	 */
	public native int disconnectmt();
	
	/**
	 * 退出点对点会议，结束点对点会议
	 * @return
	 */
	public native int quitp2p();
	
	/**
	 * 是否在会议中
	 * @return
	 */
	public native int isinconf();
	
	/**
	 * 是否在多点会议中
	 * @return
	 */
	public native int IsInMultiConf();
	
	
	
	
	
	
	

}
