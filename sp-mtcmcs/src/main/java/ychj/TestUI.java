package ychj;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class TestUI {
	public static void main(String args[]) {
		UI u = new UI("mcs sdk 测试") ;
		u.pack() ;
		u.addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e) {
				System.exit(0) ;
			}
		}) ;
		u.setVisible(true) ;
	}
}

class UI extends JFrame implements ActionListener ,InterestingEvent{
	private static final long serialVersionUID = 1L;
	JLabel ip = new JLabel("网络地址") ;
	JTextField jt = new JTextField(10) ;
	JButton start = new JButton("开始接访") ;
	JButton end = new JButton("结束接访") ;
	kdcmcs mKdcmcs = new kdcmcs(null);
	
	@Override
	public void CallBackEvent(int nEvent, String strMtName, String strMtIp,
			int isOnLine) {
		System.out.println(nEvent);
		
	}

	@Override
	public void CallBackEvent() {
		// TODO Auto-generated method stub
		System.out.println("mcsu    ^^^^^^^^^^^^  ");
	}
	
	public UI(String name) {
		super(name) ;
		
		this.setLayout(new BorderLayout()) ;
		
		this.setLocation(300, 300) ;
		start.addActionListener(this) ;
		end.addActionListener(this) ;
		
		JPanel p1 = new JPanel() ;
		p1.setLayout(new FlowLayout()) ;
		p1.add(ip, FlowLayout.LEFT) ;
		p1.add(jt, FlowLayout.CENTER) ;
		
		JPanel p = new JPanel() ;
		p.setLayout(new FlowLayout(FlowLayout.CENTER)) ;
		
		p.add(start) ;
		p.add(end) ;
		
		this.add(p1, BorderLayout.NORTH) ;
		this.add(p, BorderLayout.SOUTH) ;
	}

	@Override
	public void actionPerformed(ActionEvent arg) {
		if(arg.getSource() == start) {
			kdcmcuinfo mmcuinfo = new kdcmcuinfo();
			kdcconfinfo[] arryconfinfo = new kdcconfinfo[1];
			kdvmcsset mcsset = new kdvmcsset() ;  //会议模板
			
			arryconfinfo[0] = new kdcconfinfo();
			kdcmeminfo cvisitorinfo = new kdcmeminfo();
			kdcmeminfo cvisitedinfo = new kdcmeminfo();
			
			//构造上访者信息
			cvisitedinfo.straliasname = "qq";//改成上访部门名（上访者）
			cvisitedinfo.smemidentify = 2;
			cvisitedinfo.strip = "172.16.178.183" ;  
			
			//构造接访者信息
			cvisitorinfo.straliasname = "qq";//改成接访部门名称（接访者）
			cvisitorinfo.smemidentify = 1;
			cvisitorinfo.strip = "172.16.178.183" ;
				
			//构造会议信息
			Date curTime = new Date();
			arryconfinfo[0].strconfname = "bendi"+"本地接访";
			arryconfinfo[0].strconfe164 = String.valueOf(System.currentTimeMillis());
			arryconfinfo[0].lstarttime = curTime.getTime();
			arryconfinfo[0].nduration = 0;
			arryconfinfo[0].cvisitorinfo = cvisitorinfo;
			arryconfinfo[0].cvisitedinfo = cvisitedinfo;
			arryconfinfo[0].sbitrate = 11 ; // 设置会议码率
			arryconfinfo[0].isMcuRecord = 1 ;
			arryconfinfo[0].isMmp = 0 ;
			
			//构造mcu信息
			mmcuinfo.strname = "gaojian";//这里查询出可以的MCU设备的alias
			mmcuinfo.strip = this.jt.getText() ;//这里查询出可以的MCUIP
			mmcuinfo.strusername = "admin";//这里要改,暂时不需要动
			mmcuinfo.struserpasswd = "admin";//这里要改,暂时不需要动
			
			mcsset.audioMediaType = 11 ;
			mcsset.dStreamFrameRate = 11 ;
			mcsset.dStreamResolution = 11 ;
			mcsset.dStreamScale = 11 ;
			mcsset.videoFrameRate = 11 ;
			mcsset.videoMediaType = 11 ;
			mcsset.videoResolution = 11 ;	
			mcsset.dResExCif = 11 ;
			mcsset.dResEx4Cif = 11 ;
			mcsset.dResEx720 = 11 ; 
			mcsset.sDoublebitrate = 11 ;
			mcsset.dDStreamType = 11 ;
			
			//mKdcmcs.setCallBack() ;
			int ret = mKdcmcs.kdcvisitstart(null, mmcuinfo, null,null) ;
			if(ret != 0) {
				JOptionPane.showMessageDialog(null, "创建点对点会议失败" + ret) ;
			}else {
				ret = mKdcmcs.kdcvisitstart(arryconfinfo, mmcuinfo, mcsset,null) ;
				System.out.println("ret  " + GetMcuErrorInfo.getErrorInfo(ret) ) ;
			}
		}else if(arg.getSource() == end) {
			
		}
	}
	
}
