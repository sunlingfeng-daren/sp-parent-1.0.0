package com.kedacom.jkzx.mtc;

public enum EmMtVideoPort {
	/*emMtVGA(0) , //VGA 
	emMtSVid(1)   , //S 端子
	emMtPC(2)      , //PC
	emMtC1Vid(3)   ,  //C1端子   DVI 1
	emMtC2Vid(4)   ,  //C2端子   DVI 2
	emMtC3Vid(5)   ,  //C3端子   DVI 3
	emMtC4Vid(6)   ,  //C4端子   c
	emMtC5Vid(7)   ,  //C5端子   sdi 1
	emMtC6Vid(8)   ,  //C6端子   sdi 2

	emMtExternalVid (10),//外置矩阵映射基始值
	emMtVideoMaxCount (74), //最多支持视频源个数
	emMtVidInvalid (255) ;*/
	emMtDVi1d(0)   ,  //C1端子   DVI 1
	emMtDvi2d(1)   ,  //C2端子   DVI 2
	emMtDvi3d(2)   ,  //C3端子   DVI 3
	emMtHdmi(3)     ,
	emMtC4Vid(4)   ,  //C4端子   c
	emMtSdi5d(5)   ,  //C5端子   sdi 1
	emMtSdi6d(6)    ; //C6端子   sdi 2
	
	private int value ;
	private EmMtVideoPort(int value) {
		this.value = value ;
	}
	
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
}
