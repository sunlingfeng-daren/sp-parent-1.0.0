package ychj;

public class kdvmcsset {
	public int videoMediaType ;   // 主视频格式
	public int videoResolution ;   //主视频分辨率
	public int videoFrameRate ;    //主视频帧率
	public int audioMediaType ;    // 主音频格式
	public int dStreamResolution;   //双流分辨率 
	public int dStreamFrameRate ;   //双流帧率
	public int dStreamScale ;       // 双流比率
	public int dResEx4Cif ;        //适配会议
	public int dResEx720 ;        //适配会议
	public int dResExCif ;		  //适配会议
	public short sDoublebitrate ;  // 双流比率
	public int dDStreamType ;      // 双流格式 
	public int dDStreamExStyle ;   //双流适配格式， 主要用于kdv1000
	
	
}



/*//主视频格式
tCapSet.SetVideoMediaType(MEDIA_TYPE_H264);

//主视频分辨率
tCapSet.SetVideoResolution(VIDEO_FORMAT_HD720);

//主视频帧率
tCapSet.SetVideoFrameRate(VIDEO_FPS_2997_1);

// 主音频格式
tCapSet.SetAudioMediaType(MEDIA_TYPE_PCMA);


//双流分辨率
tCap.SetDStreamResolution(VIDEO_FORMAT_HD720);
// 双流帧率
tCap.SetDStreamFrameRate( VIDEO_FPS_2997_1 );

//双流比率
temconf->SetDStreamScale(30);*/


