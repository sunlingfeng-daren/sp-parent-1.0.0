package ychj;

public class kdcconfinfo {
	public String strconfname;
	public String strconfe164;
	public String strconfpasswd;
	public long lstarttime;
	public int nduration;
	public short sbitrate;
	public kdcmeminfo cvisitorinfo;
	public kdcmeminfo cvisitedinfo;
	public kdcmeminfo cfirstparticipant;
	public kdcmeminfo csecondparticipant;
	public int nconfid;
	public int isMcuRecord ;      // 是否mcu 录像
	public int isMmp ;            // 是否混音或画面合成
	public int isHasRecord ; 	  // 无录像机是否开会
	
	public kdcconfinfo()
	{
		cvisitorinfo = new kdcmeminfo();
		cvisitedinfo = new kdcmeminfo();
		cfirstparticipant = new kdcmeminfo();
		csecondparticipant = new kdcmeminfo();
	}
}
