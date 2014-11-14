/*
MySQL Data Transfer
Source Host: localhost
Source Database: jkzx
Target Host: localhost
Target Database: jkzx
Date: 2014/7/6 11:07:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for jkzx_device
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_device`;
CREATE TABLE `jkzx_device` (
  `jkzx_servicetype` int(11) default NULL,
  `jkzx_fayuannum` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_type` int(11) default NULL,
  `jkzx_ip` varchar(50) collate utf8_bin default NULL,
  `jkzx_name` varchar(50) collate utf8_bin default NULL,
  `jkzx_id` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_online` int(11) NOT NULL,
  `jkzx_fayuanmame` varchar(100) collate utf8_bin NOT NULL,
  `jkzx_departmentname` varchar(100) collate utf8_bin NOT NULL,
  `jkzx_terminaltype` int(11) NOT NULL,
  PRIMARY KEY  (`jkzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for jkzx_fayuan
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_fayuan`;
CREATE TABLE `jkzx_fayuan` (
  `jkzx_id` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_fayuanname` varchar(100) collate utf8_bin NOT NULL,
  `jkzx_fayuannum` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_cx` int(11) NOT NULL default '0',
  `jkzx_cy` int(11) NOT NULL default '0',
  `jkzx_parentfayuannum` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_cx2` int(11) NOT NULL default '0',
  `jkzx_cy2` int(11) NOT NULL default '0',
  PRIMARY KEY  (`jkzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for jkzx_meeting
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_meeting`;
CREATE TABLE `jkzx_meeting` (
  `jkzx_id` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_status` int(11) NOT NULL default '0',
  `jkzx_terminalids` varchar(1000) collate utf8_bin NOT NULL,
  `jkzx_type` int(11) NOT NULL default '0',
  `jkzx_meetingname` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_index` int(11) default '0',
  `jkzx_fayuannumlist` varchar(1000) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`jkzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for jkzx_meettemplate
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_meettemplate`;
CREATE TABLE `jkzx_meettemplate` (
  `jkzx_id` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `jkzx_audiomediatype` int(11) default NULL,
  `jkzx_dstreamframerate` int(11) default NULL,
  `jkzx_dstreamresolution` int(11) default NULL,
  `jkzx_dstreamscale` int(11) default NULL,
  `jkzx_videoframerate` int(11) default NULL,
  `jkzx_videomediatype` int(11) default NULL,
  `jkzx_videoresolution` int(11) default NULL,
  `jkzx_meetingbitrate` int(10) default NULL,
  `jkzx_dresex4cif` int(10) default NULL,
  `jkzx_dresex720` int(10) default NULL,
  `jkzx_dresexcif` int(10) default NULL,
  `jkzx_ddstreamtype` int(10) default NULL,
  `jkzx_bp2pusemcu` bit(1) NOT NULL,
  `jkzx_sdoublebitrate` smallint(6) default NULL,
  `jkzx_bsecvideo` bit(1) NOT NULL,
  `jkzx_sxga5fps` int(10) default NULL,
  `jkzx_bhasrecorder` bit(1) default NULL,
  PRIMARY KEY  (`jkzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for yctx_approvalflow
-- ----------------------------
DROP TABLE IF EXISTS `yctx_approvalflow`;
CREATE TABLE `yctx_approvalflow` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_arraignmentId` varchar(100) NOT NULL,
  `yctx_curApprovalUser` varchar(255) default NULL,
  `yctx_nextApprovalUser` varchar(100) default NULL,
  `yctx_timeStamp` varchar(100) NOT NULL,
  `yctx_result` varchar(100) NOT NULL,
  `yctx_approvalInfor` varchar(512) default NULL,
  PRIMARY KEY  (`yctx_id`),
  KEY `fk_flow_arraignment` (`yctx_arraignmentId`),
  KEY `fk_flow__user` (`yctx_nextApprovalUser`),
  CONSTRAINT `fk_flow_arraignment` FOREIGN KEY (`yctx_arraignmentId`) REFERENCES `yctx_arraignment` (`yctx_id`),
  CONSTRAINT `fk_flow__user` FOREIGN KEY (`yctx_nextApprovalUser`) REFERENCES `yctx_users` (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_arraignment
-- ----------------------------
DROP TABLE IF EXISTS `yctx_arraignment`;
CREATE TABLE `yctx_arraignment` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_arrProinfor` varchar(100) NOT NULL,
  `yctx_interedPerson` varchar(100) NOT NULL,
  `yctx_interUserOne` varchar(100) NOT NULL,
  `yctx_interUserTwo` varchar(100) NOT NULL,
  `yctx_lawCase` varchar(100) NOT NULL,
  `yctx_status` tinyint(4) default NULL,
  `yctx_commitDateTime` varchar(50) NOT NULL,
  PRIMARY KEY  (`yctx_id`),
  KEY `fk_arraignment_infor` (`yctx_arrProinfor`),
  KEY `fk_arraignment_remoteRoom` (`yctx_interedPerson`),
  KEY `fk_arraignment_user_one` (`yctx_interUserOne`),
  KEY `fk_arraignment_user_two` (`yctx_interUserTwo`),
  CONSTRAINT `fk_arraignment_infor` FOREIGN KEY (`yctx_arrProinfor`) REFERENCES `yctx_arraignmentproinfor` (`yctx_id`),
  CONSTRAINT `fk_arraignment_remoteRoom` FOREIGN KEY (`yctx_interedPerson`) REFERENCES `yctx_interrogatedperson` (`yctx_id`),
  CONSTRAINT `fk_arraignment_user_one` FOREIGN KEY (`yctx_interUserOne`) REFERENCES `yctx_users` (`yctx_id`),
  CONSTRAINT `fk_arraignment_user_two` FOREIGN KEY (`yctx_interUserTwo`) REFERENCES `yctx_users` (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_arraignmentproinfor
-- ----------------------------
DROP TABLE IF EXISTS `yctx_arraignmentproinfor`;
CREATE TABLE `yctx_arraignmentproinfor` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_arrId` varchar(100) default NULL,
  `yctx_localArrRoom` varchar(100) NOT NULL,
  `yctx_remoteArrRoom` varchar(100) NOT NULL,
  `yctx_assistor` varchar(100) NOT NULL,
  `yctx_approver` varchar(100) NOT NULL,
  `yctx_arrStartTime` varchar(50) NOT NULL,
  `yctx_arrEndTime` varchar(50) NOT NULL,
  PRIMARY KEY  (`yctx_id`),
  KEY `fk_arrInfor_localRoom` (`yctx_localArrRoom`),
  KEY `fk_arrInfor_remoteRoom` (`yctx_remoteArrRoom`),
  KEY `fK_arrInfor_assistor` (`yctx_assistor`),
  KEY `fK_arrInfor_approver` (`yctx_approver`),
  KEY `fK_arrInfor_arraignment` (`yctx_arrId`),
  CONSTRAINT `fK_arrInfor_approver` FOREIGN KEY (`yctx_approver`) REFERENCES `yctx_users` (`yctx_id`),
  CONSTRAINT `fK_arrInfor_arraignment` FOREIGN KEY (`yctx_arrId`) REFERENCES `yctx_arraignment` (`yctx_id`),
  CONSTRAINT `fK_arrInfor_assistor` FOREIGN KEY (`yctx_assistor`) REFERENCES `yctx_users` (`yctx_id`),
  CONSTRAINT `fk_arrInfor_localRoom` FOREIGN KEY (`yctx_localArrRoom`) REFERENCES `yctx_arraignmentroom` (`yctx_id`),
  CONSTRAINT `fk_arrInfor_remoteRoom` FOREIGN KEY (`yctx_remoteArrRoom`) REFERENCES `yctx_arraignmentroom` (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_arraignmentroom
-- ----------------------------
DROP TABLE IF EXISTS `yctx_arraignmentroom`;
CREATE TABLE `yctx_arraignmentroom` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_name` varchar(100) default NULL,
  `yctx_departmentId` varchar(100) default NULL,
  `yctx_terminalIPAddr` varchar(100) default NULL,
  `yctx_vcrIPAddr` varchar(100) default NULL,
  PRIMARY KEY  (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_department
-- ----------------------------
DROP TABLE IF EXISTS `yctx_department`;
CREATE TABLE `yctx_department` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_departmentId` int(100) NOT NULL,
  `yctx_departmentName` varchar(100) NOT NULL,
  `yctx_parentDepartmentId` varchar(100) default NULL,
  `yctx_grade` int(10) default NULL,
  PRIMARY KEY  (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_elecconstdata
-- ----------------------------
DROP TABLE IF EXISTS `yctx_elecconstdata`;
CREATE TABLE `yctx_elecconstdata` (
  `yctx_id` varchar(50) NOT NULL,
  `yctx_content` text NOT NULL,
  PRIMARY KEY  (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_eleceditor
-- ----------------------------
DROP TABLE IF EXISTS `yctx_eleceditor`;
CREATE TABLE `yctx_eleceditor` (
  `yctx_id` varchar(50) collate utf8_bin NOT NULL,
  `yctx_ajid` varchar(50) collate utf8_bin NOT NULL,
  `yctx_htmlcontent` longtext collate utf8_bin,
  PRIMARY KEY  (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for yctx_interrogatedperson
-- ----------------------------
DROP TABLE IF EXISTS `yctx_interrogatedperson`;
CREATE TABLE `yctx_interrogatedperson` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_idCard` varchar(100) NOT NULL,
  `yctx_code` varchar(100) NOT NULL,
  `yctx_gender` tinyint(4) NOT NULL,
  `yctx_age` int(100) NOT NULL,
  `yctx_lockedPlace` varchar(100) NOT NULL,
  `yctx_name` varchar(100) NOT NULL,
  PRIMARY KEY  (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_lawcase
-- ----------------------------
DROP TABLE IF EXISTS `yctx_lawcase`;
CREATE TABLE `yctx_lawcase` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_caseNo` varchar(100) NOT NULL,
  `yctx_caseType` tinyint(4) NOT NULL,
  `yctx_caseDescription` varchar(1024) NOT NULL,
  `yctx_interedPersonId` varchar(100) NOT NULL,
  `yctx_caseName` varchar(100) NOT NULL,
  PRIMARY KEY  (`yctx_id`),
  KEY `fk_lawcase_interedperosn` (`yctx_interedPersonId`),
  CONSTRAINT `fk_lawcase_interedperosn` FOREIGN KEY (`yctx_interedPersonId`) REFERENCES `yctx_interrogatedperson` (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_userrole
-- ----------------------------
DROP TABLE IF EXISTS `yctx_userrole`;
CREATE TABLE `yctx_userrole` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_roleId` varchar(100) NOT NULL,
  `yctx_roleName` varchar(100) NOT NULL,
  PRIMARY KEY  (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yctx_users
-- ----------------------------
DROP TABLE IF EXISTS `yctx_users`;
CREATE TABLE `yctx_users` (
  `yctx_id` varchar(100) NOT NULL,
  `yctx_username` varchar(100) NOT NULL,
  `yctx_password` varchar(100) NOT NULL,
  `yctx_userRealName` varchar(100) default NULL,
  `yctx_userCode` varchar(100) default NULL,
  `yctx_departmentId` varchar(100) default NULL,
  `yctx_position` varchar(100) default NULL,
  `yctx_userRole` varchar(100) default NULL,
  PRIMARY KEY  (`yctx_id`),
  KEY `fk_users_department` (`yctx_departmentId`),
  KEY `fk_users_user_role` (`yctx_userRole`),
  CONSTRAINT `fk_users_department` FOREIGN KEY (`yctx_departmentId`) REFERENCES `yctx_department` (`yctx_id`),
  CONSTRAINT `fk_users_user_role` FOREIGN KEY (`yctx_userRole`) REFERENCES `yctx_userrole` (`yctx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `jkzx_device` VALUES (null, 'K1B', '2', '147.4.162.211', '上林县人民法院', '00a37da28e8d44deb62690ac7c46cc63', '0', '上林县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K24', '2', '147.8.66.133', '柳州市柳北区人民法院', '03aa52c2cddb450db8b28173e1bc1394', '0', '柳州市柳北区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K67', '2', '147.24.34.248', '崇左市江州区人民法院', '048d8fce0c644a08bb8975f7e49319c3', '0', '崇左市江州区人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB9', '2', '147.40.146.60', '乐业县人民法院', '052b83c70151482eaabbcbe006ba342c', '0', '乐业县人民法院', '民四庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K29', '2', '147.8.114.196', '融安县人民法院', '066e053c12bf4fa6a031c8687267007a', '0', '融安县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K53', '2', '147.20.66.150', '合浦县人民法院', '0706ff0b28984cafadd8abfc45a112d6', '0', '合浦县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KF1', '2', '147.56.18.130', '防城港市防城区人民法院', '07a35f23d641471283a9e7042897f8dc', '0', '防城港市防城区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K31', '2', '147.12.18.196', '桂林市秀峰区人民法院', '0b8575a049064ce491c3576227ea8dbb', '0', '桂林市秀峰区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3F', '2', '147.110.64.11', '荔浦县人民法院', '0e8022891ca544848a25b88e89ad45e7', '0', '荔浦县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3G', '2', '147.13.3.220', '龙胜各族自治县人民法院', '0eee65f70c274d648a2c1f907c5a7a9c', '0', '龙胜各族自治县人民法院', '审监庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KG2', '2', '147.60.34.232', '贵港市港北区人民法院', '0ff31bbf7835422ba28449319fcb39bf', '0', '贵港市港北区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K40', '2', '147.16.4.13', '梧州市中级人民法院', '101d07b98de74a7f83b11ef493baed98', '0', '梧州市中级人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KF2', '2', '147.56.34.17', '防城港市港口区人民法院', '11424d14b92f4012b2d15c94b1e6b409', '0', '防城港市港口区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KF3', '2', '147.56.66.80', '上思县人民法院', '14c04b9eb7a44c5bbc49f8d1a81b8b90', '0', '上思县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('2', 'K00', '2', '192.168.24.160', '广西高法九楼', '180d1e6e391441348178339ec685c60a', '0', '广西高法', '远程提讯', '2');
INSERT INTO `jkzx_device` VALUES ('1', 'K69', '2', '147.24.82.166', '天等县人民法院', '1a5309600daf439eaa1ba75cf1f94064', '0', '天等县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K73', '2', '147.28.34.120', '象州县人民法院', '1f0e093afc0c4b4781e9b628b7af7a39', '0', '象州县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K6B', '2', '147.24.50.199', '龙州县人民法院', '215ee2481ac245f8a3a819ce4e89cc86', '0', '龙州县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3E', '2', '147.12.226.240', '平乐县人民法院', '24d22ed6908d4e7aad5a65c4616baf86', '0', '平乐县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K1C', '2', '147.4.194.11', '隆安县人民法院', '2769f83c6d734c7abd765435d4344f38', '0', '隆安县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K93', '2', '147.32.50.100', '钟山县人民法院', '2a08f1c77ff544d1a30d10b68e4d384c', '0', '钟山县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K22', '2', '147.8.34.205', '柳州市鱼峰区人民法院', '2b4cf9019c0b4207a445cca74a42c724', '0', '柳州市鱼峰区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K19', '2', '147.4.130.220', '横县人民法院', '2e7b12e91aba4fdc8d7000f744c1f3c3', '0', '横县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC0', '2', '147.44.3.230', '河池市中级人民法院', '380eaef409b94f38947e66416bd85758', '0', '河池市中级人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC6', '2', '147.44.98.91', '东兰县人民法院', '39b53adc27c04985a65ab7079a87f674', '0', '东兰县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KCB', '2', '147.44.178.5', '大化瑶族自治县人民法院', '3dc525eaf16a48f395f9f02cada0f738', '0', '大化瑶族自治县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3A', '2', '147.12.162.140', '兴安县人民法院', '404cf891cdf24b19982187a2582a1360', '0', '兴安县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB3', '2', '147.40.50.100', '田东县人民法院', '40a39535139e4da8bc375680826abadb', '0', '田东县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA5', '2', '147.36.82.198', '兴业县人民法院', '43294f3cd6f942ecb293df19f9312d8c', '0', '兴业县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K61', '2', '147.24.18.25', '凭祥市人民法院', '43944321c14f45979f9d8490b7ed2dc6', '0', '凭祥市人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB2', '2', '147.40.34.150', '田阳县人民法院', '448db9180dd04242ad6a5c77a191905d', '0', '田阳县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K71', '2', '147.28.18.11', '合山市人民法院', '47295ede62a0420c8cb78aa9a762cf53', '0', '合山市人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K37', '2', '147.12.114.80', '临桂县人民法院', '4912c61edaa341c4809ba905a8689491', '0', '临桂县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KCA', '2', '147.44.162.230', '都安瑶族自治县人民法院', '4b61c585c49b4c79bd079a75f21597e8', '0', '都安瑶族自治县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K00', '2', '192.168.24.94', '广西高法二楼', '4c47c9b59bec414cbe1f58eeaba2a89c', '0', '广西高法', '远程提讯', '3');
INSERT INTO `jkzx_device` VALUES ('1', 'K32', '2', '147.12.34.186', '桂林市叠彩区人民法院', '4e6898d2c2084e59b544546ae704dcd8', '0', '桂林市叠彩区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K41', '2', '147.16.18.2', '梧州市万秀区人民法院', '50691e73c6a44a7980d91b96fdade57b', '0', '梧州市万秀区人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KBB', '2', '147.40.178.30', '西林县人民法院', '51248e6d885c48bba862d695bebac340', '0', '西林县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC2', '2', '147.44.34.8', '宜州市人民法院', '51544aff290d4ac3b8fd02c97e70ae6c', '0', '宜州市人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K21', '2', '147.8.18.41', '柳州市城中区人民法院', '520bdef3a99649efa7b947e75418dc21', '0', '柳州市城中区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB7', '2', '147.40.114.98', '那坡县人民法院', '527fd919db9b4a13ab218b589d65faef', '0', '那坡县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K43', '2', '147.16.50.210', '梧州市长洲区人民法院', '530e88b65e4049d3969c4cbf2e94a282', '1', '梧州市长洲区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB0', '2', '147.40.3.7', '百色市中级人民法院', '533c4d9175184952b74f7b28ce3e300d', '0', '百色市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K18', '2', '147.4.114.190', '武鸣县人民法院', '55d4e58e60a344789d6a65e8b911587e', '0', '武鸣县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K11', '2', '147.4.34.228', '南宁市兴宁区人民法院', '5955f024bfa84aeca779551b727e03fb', '0', '南宁市兴宁区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K74', '2', '147.110.95.120', '武宣县人民法院', '5a5609b621e64debb1301ffaad6a0272', '0', '武宣县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KG0', '2', '147.60.5.140', '贵港市中级人民法院', '5a711a789d854e82930f7f3a32229556', '0', '贵港市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3B', '2', '147.12.178.220', '永福县人民法院', '5b31483f700042a6b89d8ff0cef32603', '0', '永福县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K39', '2', '147.12.146.220', '全州县人民法院', '5e63859f416e4d9b85e4c532248fe6b0', '0', '全州县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC8', '2', '147.44.130.9', '环江毛南族自治县人民法院', '5ed1e852cc244f59bb9c9e1b6ff35ddc', '0', '环江毛南族自治县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K90', '2', '147.32.3.175', '贺州市中级人民法院', '5f00ff08a1e243278783f78a5b0a857e', '0', '贺州市中级人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KG1', '2', '147.60.18.231', '贵港市港南区人民法院', '5f375071124b439db10dd697bb1b1e06', '0', '贵港市港南区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K28', '2', '147.8.146.99', '鹿寨县人民法院', '617cfe309acf41a4a176022193269290', '0', '鹿寨县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3D', '2', '147.1.8.143', '资源县人民法院', '639f4804b18640e987c8a773cc9926fe', '0', '资源县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K70', '2', '147.28.8.230', '来宾市中级人民法院', '66b73acbb3c64868903f74ba40bb7a30', '0', '来宾市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K36', '2', '147.12.98.240', '阳朔县人民法院', '679678b1bd38425189894ff8ba0aa5ec', '0', '阳朔县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA6', '2', '147.36.98.210', '博白县人民法院', '6af32df54dc54ff19244070fec938ab8', '0', '博白县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KD2', '2', '147.48.66.155', '灵山县人民法院', '6b81eee187a64a4ca6e14a4b73256146', '0', '灵山县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KE0', '2', '147.52.3.222', '南宁铁路运输中级法院', '6bf5268bc9e14378a71dade941d66f45', '0', '南宁铁路运输中级法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KD1', '2', '147.48.34.190', '钦州市钦北区人民法院', '70f79cb0daf6404d9951f7f60af19d34', '0', '钦州市钦北区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC4', '2', '147.44.66.213', '天峨县人民法院', '74033fd7d26e4d96be23a1013194fb7c', '0', '天峨县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K2A', '2', '147.8.130.251', '融水苗族自治县人民法院', '76410cc307144c0c99c00ad34ae67372', '0', '融水苗族自治县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K1F', '2', '147.4.82.160', '南宁市良庆区人民法院', '76a749f2f50049daabd434a3a4faee74', '0', '南宁市良庆区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K20', '2', '147.8.3.167', '柳州市中级人民法院', '7c2d951e7ccc43169ac2a1552c72e397', '0', '柳州市中级人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KBA', '2', '147.40.162.45', '田林县人民法院', '84eda0ca1b8e40f6b37b571167d1ae59', '0', '田林县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K92', '2', '147.32.18.16', '贺州市八步区人民法院', '84fe903188284f828c92b770599e1c59', '0', '贺州市八步区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K6A', '2', '147.24.98.210', '宁明县人民法院', '880cbbe05b61402d8103b3c1f35ddf0e', '0', '宁明县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA2', '2', '147.36.50.220', '容县人民法院', '89d822105a9448f99dcd1364d239ef03', '0', '容县人民法院', '审管办', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA1', '2', '147.36.18.10', '玉林市玉州区人民法院', '8c289a753d8146c4b56ae3c737ea9fc4', '0', '玉林市玉州区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K50', '2', '147.20.3.15', '北海市中级人民法院', '8e5c8ce7087e4126ac4d21a4d1ba579b', '0', '北海市中级人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KD0', '2', '147.48.3.10', '钦州市中级人民法院', '8f4da5e22c13423c93958c1611cab469', '0', '钦州市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K60', '2', '147.24.3.238', '崇左市中级人民法院', '8fe2d0ea37b64634a52503b1e6a14c4b', '0', '崇左市中级人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K26', '2', '147.8.82.220', '柳江县人民法院', '95d4c3e113544d2ea5b13541dacf56a8', '0', '柳江县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA3', '2', '147.110.124.11', '北流市人民法院', '97a514d51c3e43a4ab188a9f0f21af32', '0', '北流市人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KG4', '2', '147.60.82.73', '平南县人民法院', '98fd83a5c73c46d1b5f5ce238641ce2e', '0', '平南县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K77', '2', '147.28.66.120', '忻城县人民法院', '9bb60a7448e34305b9d74b1b27f80ad7', '0', '忻城县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB1', '2', '147.40.8.202', '百色市右江区人民法院', '9db48c19462d403ea5087b9f089815a7', '0', '百色市右江区人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K33', '2', '147.110.51.11', '桂林市象山区人民法院', '9f5bd8c75c9843a683c5205ac6f61bb8', '0', '桂林市象山区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K10', '2', '147.4.4.223', '南宁市中级人民法院', 'a404b44873e541d1b6bf7540aebf5658', '0', '南宁市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K38', '2', '147.12.130.110', '灵川县人民法院', 'a40a76feace044b18a6759723a6219d1', '0', '灵川县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K27', '2', '147.110.45.11', '柳城县人民法院', 'a5e89b13266a4c9da585f2ed9c69fb99', '0', '柳城县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K91', '2', '147.32.34.248', '昭平县人民法院', 'a5ff1276c65a4c219aa772c61a89d4d9', '0', '昭平县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3C', '2', '147.12.194.120', '灌阳县人民法院', 'a652af1d278745f0b71eb1248526a7b7', '0', '灌阳县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KE2', '2', '147.52.18.253', '南宁铁路运输法院', 'a67cf1f19fe44ec38faeb6fddef6a557', '0', '南宁铁路运输法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K1E', '2', '147.4.50.6', '南宁市西乡塘区人民法院', 'a966e26753fc455ea94c152aadaebfed', '0', '南宁市西乡塘区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KF0', '2', '147.56.3.133', '防城港市中级人民法院', 'aa636d0a68454e17bab5e8eb0b60f109', '0', '防城港市中级人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K46', '2', '147.16.98.16', '藤县人民法院', 'ab5ca50cfe6f4b3fb174c298dfacd953', '0', '藤县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K47', '2', '147.16.114.214', '蒙山县人民法院', 'acb81208ec9b4786a4b983ecc98bdb48', '0', '蒙山县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB4', '2', '147.40.66.247', '平果县人民法院', 'acb9760438fb47cdb1ee6ff65affa707', '0', '平果县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB6', '2', '147.40.98.113', '靖西县人民法院', 'af1e6ecd1c5b4764b871ccc7305955c8', '0', '靖西县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K1A', '2', '147.4.146.121', '宾阳县人民法院', 'b29f87df94804dcab711bc7dcd9595c9', '0', '宾阳县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K94', '2', '147.32.66.230', '富川瑶族自治县人民法院', 'b488c293b36144afac6d3522051b8293', '0', '富川瑶族自治县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KD4', '2', '147.48.18.17', '钦州市钦南区人民法院', 'b5437692efde460d87ee93546ac18ba1', '0', '钦州市钦南区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KG3', '2', '147.60.66.181', '桂平市人民法院', 'b743a23395af410ea3d5bab0b7355686', '0', '桂平市人民法院', '信息中心', '5');
INSERT INTO `jkzx_device` VALUES ('1', 'K44', '2', '147.16.66.230', '苍梧县人民法院', 'b7faf3cf6f4f4bdf9b612edb26131b40', '0', '苍梧县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K51', '2', '147.20.18.15', '北海市海城区人民法院', 'b957064bec16417d901bdfbd720f283c', '0', '北海市海城区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC1', '2', '147.44.18.60', '河池市金城江区人民法院', 'bb4db3efa608403d9e0cc349df155c9a', '0', '河池市金城江区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KF4', '2', '147.56.50.9', '东兴市人民法院', 'c1913e5f61c94514b6b402235b8f8c0b', '0', '东兴市人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KBB', '2', '147.40.178.30', '西林县人民法院', 'c1939ab0c32148c9998d478240a0b741', '0', '西林县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB8', '2', '147.40.132.150', '凌云县人民法院', 'c2301907e0574d1582cdaa072100aece', '0', '凌云县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K79', '2', '147.110.94.11', '金秀瑶族自治县人民法院', 'cc43ffada7e34b88b8f098d0dcaf8328', '0', '金秀瑶族自治县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA4', '2', '147.36.66.8', '陆川县人民法院', 'cea9545d20a6434da782dd21d6c2701d', '0', '陆川县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K54', '2', '147.110.115.12', '北海市铁山港区人民法院', 'cf1b688fe7264e47b9333f06993f64bc', '0', '北海市铁山港区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K12', '2', '147.4.23.253', '南宁市青秀区人民法院', 'd0e73b8c31224e06bfd2bf77420e1af2', '1', '南宁市青秀区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC3', '2', '147.44.50.3', '南丹县人民法院', 'd27daefe4b62406b92c817c35a31eb6b', '0', '南丹县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KG5', '2', '147.60.50.33', '贵港市覃塘区人民法院', 'd3438088d8414a83920f4db406daba5e', '0', '贵港市覃塘区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K30', '2', '147.12.4.9', '桂林市中级人民法院', 'd433756f23484bed816c6a16c8652d65', '0', '桂林市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KA0', '2', '147.36.3.30', '玉林市中级人民法院', 'd4fb5640f4bb4190a20a61be36d625a6', '0', '玉林市中级人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC7', '2', '147.44.114.70', '罗城仫佬族自治县人民法院', 'd76957e0603245be9bb68a7a91983e88', '0', '罗城仫佬族自治县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K23', '2', '147.8.50.238', '柳州市柳南区人民法院', 'd7745e98fd734ad88a75195bd85aee76', '1', '柳州市柳南区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K1D', '2', '147.4.178.25', '马山县人民法院', 'd7766a0dc4ea469daee8f6c323294701', '0', '马山县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KE1', '2', '147.52.34.64', '柳州铁路运输法院', 'd82147c25dbe417d9e676555fb581aa0', '0', '柳州铁路运输法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K14', '2', '147.4.66.229', '南宁市江南区人民法院', 'db185fe041ab40b29881e083ec2d4791', '0', '南宁市江南区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K75', '2', '147.28.98.230', '来宾市兴宾区人民法院', 'de14585f9c35439da1b54e307a1fd070', '0', '来宾市兴宾区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K3H', '2', '147.13.18.22', '恭城瑶族自治县人民法院', 'e53965376c1a4f21a7ab95d113f77557', '0', '恭城瑶族自治县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K00', '2', '147.1.8.143', '广西壮族自治区高级人民法院', 'e674cdb485704e539afee416f26047ea', '0', '广西壮族自治区高级人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC9', '2', '147.44.146.180', '巴马瑶族自治县人民法院', 'ea67c840fc6c42c7924c55915134b9c2', '0', '巴马瑶族自治县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KB5', '2', '147.40.82.114', '德保县人民法院', 'ea6fab05ac484988864fa9ab5145eaf2', '0', '德保县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K52', '2', '147.20.34.150', '北海市银海区人民法院', 'eaebc0e446f9435ba85a39c86562646b', '0', '北海市银海区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K34', '2', '147.12.66.217', '桂林市七星区人民法院', 'ebba1b298e3e4f8ba259862c03eeb980', '0', '桂林市七星区人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KBC', '2', '147.40.194.253', '隆林各族自治县人民法院', 'f0214a75c9674c1d89b44815166f4ee4', '0', '隆林各族自治县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KH0', '2', '147.64.3.75', '北海海事法院', 'f12ba41c720f4fe9a602f54a6844c440', '0', '北海海事法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K35', '2', '147.12.82.21', '桂林市雁山区人民法院', 'f280f649328c47728eddf99edd63a80b', '0', '桂林市雁山区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K45', '2', '147.16.82.166', '岑溪市人民法院', 'f3dfef5b75c943d8a6013f85580adce0', '0', '岑溪市人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K2B', '2', '147.8.162.9', '三江侗族自治县人民法院', 'f4bff8df97854cbdb2d699f9f8ffe53b', '0', '三江侗族自治县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KC5', '2', '147.44.82.46', '凤山县人民法院', 'f63bdd0428fe47d29c5c464ab7a4992e', '0', '凤山县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K68', '2', '147.24.66.38', '大新县人民法院', 'f7019ab719674a9ca2cae5a0e6d1d7ea', '0', '大新县人民法院', '办公室', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K6C', '2', '147.24.114.81', '扶绥县人民法院', 'f9d07caab1c94053a37209f103dc1fd0', '0', '扶绥县人民法院', '信息中心', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'KD3', '2', '147.48.50.10', '浦北县人民法院', 'fc80c6158cf04b22a2cd873377c05d55', '0', '浦北县人民法院', '立案一庭', '1');
INSERT INTO `jkzx_device` VALUES ('1', 'K17', '2', '147.4.98.4', '南宁市邕宁区人民法院', 'fe926db95b8946a6a041cae07eb4fae6', '1', '南宁市邕宁区人民法院', '立案一庭', '1');
INSERT INTO `jkzx_fayuan` VALUES ('039dbccb84304b36917843243578ebab', '梧州市万秀区人民法院', 'K41', '667', '447', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0745facbfe8143aaa3f7ad9340f85646', '西林县人民法院', 'KBB', '191', '163', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0ca5cc8affb643bfa7cbbf5be64c8b46', '北海市海城区人民法院', 'K51', '315', '425', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0ce44c70a2904adeb3c776d4be08a2ad', '桂林市秀峰区人民法院', 'K31', '820', '194', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0e3e1b10ab0a433986c03a865784dafa', '广西壮族自治区高级人民法院', 'K00', '440', '457', '000', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('10ca738e994840a598a8bbf3f514539d', '桂林市七星区人民法院', 'K34', '925', '315', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('115edef7d30e41cebcb35141165fb768', '钟山县人民法院', 'K93', '470', '281', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('14094738ceee470088aeb90dc4121275', '象州县人民法院', 'K73', '559', '292', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('147e4c3548d34bcc8f7e415f66fa2fd5', '隆林各族自治县人民法院', 'KBC', '229', '95', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1603c11a5d224f959dce7f8e69e45098', '金秀瑶族自治县人民法院', 'K79', '770', '215', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1723f1626bf44c0bafc38aa5192a9d30', '柳州市柳南区人民法院', 'K23', '722', '345', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('19f5bf9cfd7345e0880d9dc09d69ca6b', '资源县人民法院', 'K3D', '490', '100', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1cd0b60794364cde98e600c6914d05f3', '大新县人民法院', 'K68', '402', '195', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1de63872e29e44778e583f06bf467cf8', '柳州铁路运输法院', 'KE1', '820', '530', 'KE0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1f8d9e9a15a548c58e6d28e3c738d04b', '荔浦县人民法院', 'K3F', '374', '578', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('221033dbf0e641de965958aa78708639', '平乐县人民法院', 'K3E', '476', '566', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('23587a011dc6487a81ce4b2e9349d153', '崇左市中级人民法院', 'K60', '316', '518', 'K00', '450', '351');
INSERT INTO `jkzx_fayuan` VALUES ('237941c102454168b4dc4e2e308ad261', '乐业县人民法院', 'KB9', '527', '128', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('243772b555bd4240808097ef99e96539', '田阳县人民法院', 'KB2', '589', '375', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('25cd75f31610417eab525d6702c1c27d', '浦北县人民法院', 'KD3', '637', '301', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('25db6575362c4196b03181eb6da81be9', '融水苗族自治县人民法院', 'K2A', '400', '300', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('290c13c16bff40e4ae18176583eb6add', '梧州市中级人民法院', 'K40', '785', '385', 'K00', '845', '455');
INSERT INTO `jkzx_fayuan` VALUES ('29adcb0f24d04ef58c61a4f96cec79b7', '罗城仫佬族自治县人民法院', 'KC7', '620', '260', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('32c82cf0b2664c13b302d95a0d5bf398', '阳朔县人民法院', 'K36', '403', '501', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('32d56262c5e24f2d956f2ba6125198f8', '北流市人民法院', 'KA3', '518', '225', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('36fef08fa55c447f8d77a9a36b615e7b', '柳江县人民法院', 'K26', '407', '544', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('382d90fe981c4a01a911a90f53f26ed5', '陆川县人民法院', 'KA4', '466', '357', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('38b6421f627a4aebb48dea391a3e6b20', '南宁市邕宁区人民法院\r\n武鸣县人民法院', 'K17', '540', '512', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('3a53a040afc94465ab8db3be1449e57e', '都安瑶族自治县人民法院', 'KCA', '375', '488', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('465047b5ab0a49b9b51e57da1924cb61', '玉林市玉州区人民法院', 'KA1', '440', '219', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('46ea5e108c3c42fe8310113f4e978891', '东兴市人民法院', 'KF4', '264', '441', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('47c8e12033dc492a9a1a3e78d39f7bc3', '贺州市八步区人民法院', 'K92', '550', '315', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('481eea0fadbe466e9e4031526a43ac8f', '横县人民法院', 'K19', '697', '500', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('4bfc1cdc9950417a815340aaff406104', '三江侗族自治县人民法院', 'K2B', '470', '90', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('4df108c578a14708b0bd9ffcf068a1a1', '贵港市覃塘区人民法院', 'KG5', '243', '410', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('501bc3c9762e4d29a966aba8792ee071', '德保县人民法院', 'KB5', '512', '470', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('502c1c1394fd49098539f8b475adbb33', '百色市中级人民法院', 'KB0', '242', '306', 'K00', '540', '320');
INSERT INTO `jkzx_fayuan` VALUES ('5398dfce7af9487390c62d308f1c2c4d', '田林县人民法院', 'KBA', '451', '220', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5671bb243697474da56485d33fc1e506', '富川瑶族自治县人民法院', 'K94', '450', '135', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('573c7f046609414fba00c2385925196c', '隆安县人民法院', 'K1C', '185', '313', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('595f83a4c8204b8e9732bf4b0d99a4ae', '宜州市人民法院', 'KC2', '535', '355', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('598e22ee0e6d44b2b7e3620516cc4c49', '扶绥县人民法院', 'K6C', '647', '283', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5d691aacd8d04acab1e771b9fe464d3c', '南宁铁路运输法院', 'KE2', '820', '490', 'KE0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5e304b1e97dc49aa82abcab67576bf98', '平果县人民法院', 'KB4', '731', '491', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5e803d17b24a4a7ab80abae27231f9bc', '灵山县人民法院', 'KD2', '551', '225', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('6997f32457b240bf91fb680895f76880', '北海市铁山港区人民法院', 'K54', '561', '390', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('69c80162865747018a39f90cb3051b09', '岑溪市人民法院', 'K45', '439', '550', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('6b302aea2b0d407b945f6e1efcac0a18', '兴安县人民法院', 'K3A', '485', '245', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('727ecf0d48a5493dac5d0114d20d4c26', '防城港市防城区人民法院', 'KF1', '450', '300', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('734758bff67b46579161c67424f2d612', '临桂县人民法院', 'K37', '310', '316', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('7af3d09e20d54c6e8c1f463a5a43be05', '来宾市中级人民法院', 'K70', '558', '348', 'K00', '327', '377');
INSERT INTO `jkzx_fayuan` VALUES ('7b9619ef99124f459340c92096ea51b9', '南宁市青秀区人民法院', 'K12', '470', '465', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('7ce16e294cbb4b468afa2f3c182ab944', '柳城县人民法院', 'K27', '427', '420', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('7d8c7589625a46c69d734c7768150935', '靖西县人民法院', 'KB6', '490', '500', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('81bd52f98f11497c8983eaf3de1cbe0e', '藤县人民法院', 'K46', '418', '384', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('86384830645f4edfac4f4cba7ce499a7', '河池市金城江区人民法院', 'KC1', '405', '315', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('86a627d07b12455b8bbbdbfb74279f89', '河池市中级人民法院', 'KC0', '422', '212', 'K00', '405', '295');
INSERT INTO `jkzx_fayuan` VALUES ('87bf1f26681743bbb716a5d1a8c83346', '玉林市中级人民法院', 'KA0', '657', '499', 'K00', '450', '200');
INSERT INTO `jkzx_fayuan` VALUES ('87f0aca3367944a79a528f32eca14f9a', '巴马瑶族自治县人民法院', 'KC9', '172', '448', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('8a2282be6a1d4b34a300e8be36c864fb', '上思县人民法院', 'KF3', '222', '146', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('8a3cb2337a5a4ee4bd4adb10d6fb7aa0', '贵港市港北区人民法院', 'KG2', '351', '400', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('8cdff90f937f49038ab40b176ac189d0', '南宁铁路运输中级法院', 'KE0', '820', '450', 'K00', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('90b1d269fde0407cade5169e4bb81035', '环江毛南族自治县人民法院', 'KC8', '470', '250', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('930f96e2cf2e47eb8ae693244775b0b5', '合浦县人民法院', 'K53', '418', '280', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9336b8bcd83a4a55adf6f4d14dc26d82', '北海海事法院', 'KH0', '820', '570', 'K00', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('953e7dbcec6c421cb7e45990516be93a', '田东县人民法院', 'KB3', '634', '419', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('95cb4ddebaca460c95b4831f4f8e11d1', '桂林市雁山区人民法院', 'K35', '900', '397', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('967d7b213e5d48cb9e46acfa2b34d459', '柳州市城中区人民法院', 'K21', '805', '295', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9792958c4c1947afba3e532706304564', '桂平市人民法院', 'KG3', '500', '370', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('982bb025463a4d90954a340acbd449b5', '龙胜各族自治县人民法院', 'K3G', '320', '200', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9a4c6bc2e8544f3e86de79c076f10cbf', '合山市人民法院', 'K71', '228', '345', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9a7630479e8f4e90b9f49d0d67c8ef26', '昭平县人民法院', 'K91', '242', '480', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9f429f01f1a746aa895fbf726ba2dde7', '马山县人民法院', 'K1D', '369', '125', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a02cf2f1b1e44f749e8aec56566368e5', '钦州市中级人民法院', 'KD0', '475', '575', 'K00', '310', '403');
INSERT INTO `jkzx_fayuan` VALUES ('a09b1d707a734bec98ce2ce1f6735935', '南宁市西乡塘区人民法院', 'K1E', '333', '375', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a1766c1811204fd8820db5eaa30133f1', '桂林市叠彩区人民法院', 'K32', '870', '217', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a40b57df15a345b59e804c0e68bbdabe', '防城港市中级人民法院', 'KF0', '408', '590', 'K00', '450', '335');
INSERT INTO `jkzx_fayuan` VALUES ('a4ead12a7e704fa78858113c9f0542e4', '崇左市江州区人民法院', 'K67', '450', '370', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a54a9eb5164d461288049ab46d7c44d2', '大化瑶族自治县人民法院', 'KCB', '329', '570', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a5eec1e39bf94dabac972b87bf9c3555', '贵港市中级人民法院', 'KG0', '592', '435', 'K00', '368', '390');
INSERT INTO `jkzx_fayuan` VALUES ('a81f524b1e6f4fcfad69eeeb004a0880', '恭城瑶族自治县人民法院', 'K3H', '517', '482', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a829498994e34013943e382f8522b079', '桂林市象山区人民法院', 'K33', '880', '267', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('aca014ce60c84332bc62c001837d556e', '东兰县人民法院', 'KC6', '188', '310', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('b267d4887d5443b582b363a14e622097', '柳州市鱼峰区人民法院', 'K22', '816', '395', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ba51ff41e00a46a58e3c9fa313576c16', '防城港市港口区人民法院', 'KF2', '300', '300', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bb8cb13628e7452e9cd8a9488ee3a384', '平南县人民法院', 'KG4', '655', '275', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bd0030a7514740248195b112da75d454', '钦州市钦南区人民法院', 'KD4', '300', '385', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bd6f9cbac67e4c0f98115f57c8ae386c', '鹿寨县人民法院', 'K28', '529', '480', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bea1c4f746c842b49058892716f18684', '全州县人民法院', 'K39', '600', '140', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('beb12b5627724f109ac30bbb222a7821', '贵港市港南区人民法院', 'KG1', '379', '500', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c148c9ebba7b45578223c78bfd0bd3c9', '容县人民法院', 'KA2', '583', '144', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c36aedb526204defafdf3237ad3e8590', '灌阳县人民法院', 'K3C', '596', '282', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c37277cb73a84c8f8e74650440ab69f9', '钦州市钦北区人民法院', 'KD1', '275', '300', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c46375acff2046ffb84daa430b3582cd', '武鸣县人民法院', 'K18', '396', '280', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c6763b97c80643a7a8db045fafb5edfd', '上林县人民法院', 'K1B', '509', '194', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('cbd0022e60b144afaee99305f715e898', '贺州市中级人民法院', 'K90', '841', '269', 'K00', '580', '315');
INSERT INTO `jkzx_fayuan` VALUES ('cbf0f17e9dcc4336b08ae38281426878', '南宁市良庆区人民法院', 'K1F', '419', '590', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('cd3f357d013c4a8591690ce2abdeb76e', '永福县人民法院', 'K3B', '257', '440', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ce7e1cf0770a4a6b828f4b03130e2235', '凭祥市人民法院', 'K61', '258', '442', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ce8b98e33f794953825ee4cde1100541', '灵川县人民法院', 'K38', '382', '290', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('d491a1581f1e40c593954e16c1dee9ba', '来宾市兴宾区人民法院', 'K75', '320', '400', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('d6e6271563644a72be32685cc255cdf0', '柳州市柳北区人民法院', 'K24', '765', '213', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('d805f0a76b1341dca1972876cc50cb20', '凌云县人民法院', 'KB8', '516', '220', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('da180a3685894feea9a0d0fd45a3097c', '桂林市中级人民法院', 'K30', '686', '140', 'K00', '900', '320');
INSERT INTO `jkzx_fayuan` VALUES ('da262e1f88dc497bbf690c205199ef7b', '忻城县人民法院', 'K77', '142', '233', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('da397e90db46447ca5c6fbd1e3a60b05', '天等县人民法院', 'K69', '387', '133', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('def62d8c64174c46a17413be56ba8333', '那坡县人民法院', 'KB7', '343', '463', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('df9d62bfc9da4b55bfbc45d1cdbe9f11', '宾阳县人民法院', 'K1A', '579', '314', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e1caf93181924ea6ad7a3736eee7b544', '天峨县人民法院', 'KC4', '148', '175', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e228709420ef4d399054db559e946030', '武宣县人民法院', 'K74', '526', '456', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e4b279960a1c4705b2ce6c5cddc81d46', '南宁市兴宁区人民法院', 'K11', '518', '390', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e6074bbdb80743859675d489ec5d3def', '百色市右江区人民法院', 'KB1', '519', '320', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('eeeeb2311f094fb19d18399bc56f9dbd', '梧州市长洲区人民法院', 'K43', '840', '430', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ef441da8a4b2494a936a509097f0ed5c', '南丹县人民法院', 'KC3', '255', '148', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f1bca46a7b2b4825abec2b32aed30229', '南宁市中级人民法院', 'K10', '445', '477', 'K00', '435', '477');
INSERT INTO `jkzx_fayuan` VALUES ('f32ba37c35ee4a57b203599f4b9da1a0', '柳州市中级人民法院', 'K20', '576', '265', 'K00', '795', '330');
INSERT INTO `jkzx_fayuan` VALUES ('f3fecb5cd91641ffa463ff7991e964ca', '苍梧县人民法院', 'K44', '509', '380', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f63bf12423f2482fb47529e65cbe0bef', '北海市中级人民法院', 'K50', '520', '628', 'K00', '305', '410');
INSERT INTO `jkzx_fayuan` VALUES ('f67c1fae8a1e4ceaae7dde613b5560f4', '北海市银海区人民法院', 'K52', '416', '400', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f6a2379ac6614ef59e4f00fffa32d6cf', '兴业县人民法院', 'KA5', '341', '165', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f9e67a41ca6741bd966a19c3c3606b7e', '宁明县人民法院', 'K6A', '341', '453', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fbb502135cde4ae18a8112d23e5ec53f', '梧州市蝶山区人民法院', 'K42', '767', '423', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fc0e4951189c4e6abc408759d96945a3', '凤山县人民法院', 'KC5', '105', '300', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fd8f61eaa9c34e68bf3d83df08beecb8', '融安县人民法院', 'K29', '448', '257', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fdc50e3b163d4b23a253173c460ce26b', '蒙山县人民法院', 'K47', '302', '75', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fe312974c7c04221a55a4cd8e9e26dfc', '博白县人民法院', 'KA6', '350', '377', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ff70788b6a01441098a821f615d646a3', '龙州县人民法院', 'K6B', '280', '350', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fff5de7aec0a4fd4a2e7d5deb6512c17', '南宁市江南区人民法院', 'K14', '346', '515', 'K10', '0', '0');
INSERT INTO `jkzx_meeting` VALUES ('0aa1ce3ec48d4d2a842d2a4e45d1bf64', '2', '180d1e6e391441348178339ec685c60a,4c47c9b59bec414cbe1f58eeaba2a89c', '1', '1404388398822', '1', 'K00,KG0');
INSERT INTO `jkzx_meeting` VALUES ('2795aaa609044987ae6fb4cbe3f2249a', '3', '180d1e6e391441348178339ec685c60a,4c47c9b59bec414cbe1f58eeaba2a89c', '1', '1404388775888', '1', 'K00,KG0');
INSERT INTO `jkzx_meeting` VALUES ('640f1173cc0a4780b812a09e090e3625', '3', '180d1e6e391441348178339ec685c60a,4c47c9b59bec414cbe1f58eeaba2a89c', '2', '1404388870968', '0', 'K00,KG0');
INSERT INTO `jkzx_meeting` VALUES ('ac2c861ead7b48fc9cfc56c753a37df6', '2', '380eaef409b94f38947e66416bd85758,101d07b98de74a7f83b11ef493baed98,5f00ff08a1e243278783f78a5b0a857e,d433756f23484bed816c6a16c8652d65', '2', '1404613057440', '0', 'KC0,K40,K90,K30');
INSERT INTO `jkzx_meeting` VALUES ('b84636b7afaf452a9fa40148672ad369', '3', '180d1e6e391441348178339ec685c60a,4c47c9b59bec414cbe1f58eeaba2a89c', '2', '1404388414943', '0', 'K00,KG0');
INSERT INTO `jkzx_meeting` VALUES ('dac190ba459143549189692a164ab1cc', '3', '6bf5268bc9e14378a71dade941d66f45,7c2d951e7ccc43169ac2a1552c72e397', '2', '1404613111573', '0', 'KE0,K20');
INSERT INTO `jkzx_meettemplate` VALUES ('1', '8', '30', '35', '30', '30', '34', '5', '1024', '0', '0', '0', '1', '', '0', '', '0', '');
INSERT INTO `yctx_approvalflow` VALUES ('024bff21b6a64f498e6aeab4781a1de6', '20b982cfc2fb4db4a4cce4440e40ff84', '965bb4e81ddb4de9b50366420f96c83d', null, '1399345456747', '2', 'dd');
INSERT INTO `yctx_approvalflow` VALUES ('08303f4f0fd74bed87866792af3aedbb', '1b49339518b943ea8a6ad8f2feb904dc', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399345935299', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('0af68b5d7c424506b08dd292ea3c6db5', '5fc48effedac4c61ae15239aef8a1718', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399342240644', '1', 'dddddd');
INSERT INTO `yctx_approvalflow` VALUES ('16ed78c289734523be8beb9d98d30a85', 'a49fbaf7d06c4426ad453d32f1fd1eac', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399365819468', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('21bd96daab80413799ffed5d361abc6e', 'ab9b48e179b9423cb661c0f18412659a', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399365226100', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('220de191029b43b18bfd802e13983ba0', '7d45939577f549a4bc50ffb489082dc5', '965bb4e81ddb4de9b50366420f96c83d', null, '1399344754589', '2', 'ddd');
INSERT INTO `yctx_approvalflow` VALUES ('22b7647ede6b4d1aba6893c8e3ffc848', '7d45939577f549a4bc50ffb489082dc5', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '1399342261701', '1', 'dddd');
INSERT INTO `yctx_approvalflow` VALUES ('2370bbacad524545a9d25af3cfd7bc1b', '1f48d818bf2343839b9b3575fa137ba5', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399365823239', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('410b754119e54c489a850c192f40af7d', '763e053c4fed43fe9a85dffdbcad9379', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399365748638', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('713683c0e11e4cd1a4c3c1c70d2cb838', '20b982cfc2fb4db4a4cce4440e40ff84', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399345430748', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('78a6d96c5af14ea7b15c88dc7a1a21bb', '5fc48effedac4c61ae15239aef8a1718', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1398772726229', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('801765e51af44117afaafc48ba5b35fe', 'efe58963eb7d4d1c898c976f56f435f9', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1398836955853', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('99e6739e9e004c8b8926600c72cdee51', '1b49339518b943ea8a6ad8f2feb904dc', '965bb4e81ddb4de9b50366420f96c83d', null, '1399346670613', '2', 'ddddddd');
INSERT INTO `yctx_approvalflow` VALUES ('9e8f9ff1414e4ec7adbefaeef6cc4707', '5fc48effedac4c61ae15239aef8a1718', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '1399342518793', '1', 'aaa');
INSERT INTO `yctx_approvalflow` VALUES ('bbf8b65754774ca188281ab61b8859ea', '5fc48effedac4c61ae15239aef8a1718', '965bb4e81ddb4de9b50366420f96c83d', null, '1399344592131', '1', 'dddd');
INSERT INTO `yctx_approvalflow` VALUES ('d5e0a062a15d4b2a9c37e5a83fcf2403', '5dbe5c6453054b58b14c32bf1704ca72', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399345425771', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('de493cb58b614ccfa004f26be6b5951d', 'f1f602d55f1846a4bbc6d9830419c032', '965bb4e81ddb4de9b50366420f96c83d', null, '1399344930645', '2', 'd');
INSERT INTO `yctx_approvalflow` VALUES ('e179dcd7753846b5bde519e20f3a0957', '7c4616cb894d4666918168553dcd9fb0', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399365762289', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('ebb08563b1f3476288fe6c52b7ca2f9a', '1f48d818bf2343839b9b3575fa137ba5', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1399376921068', '3', '');
INSERT INTO `yctx_approvalflow` VALUES ('f6d738731bcf4adfb2e964370da35a19', 'f1f602d55f1846a4bbc6d9830419c032', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1398772719142', '1', null);
INSERT INTO `yctx_approvalflow` VALUES ('f955962b55be4e978138e476877f3985', '7d45939577f549a4bc50ffb489082dc5', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1398772724245', '1', null);
INSERT INTO `yctx_arraignment` VALUES ('0d080dafc3e24aaba5d9babde3a0a920', 'e0398e78997d41a4b1bd8968c35361ce', '1259988b41de4bb598a21856a7ace69c', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', 'fa16a4326ab84735bb9898fe43ca05bd', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('10fa168b4e6f48bc9181c341f216d31a', 'f256d46fbdef4eba81d544f7ad388d5b', '01ee4192eb714439a07b617823c3457f', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '79aa1ac97c074c26b83a3186d24c4859', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('199990a9ceba44d4b251528c75b75d42', '561284772a5242918a1d4db8b6cb5675', 'fc53a3658560456d82742c46076f0e64', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '941f57f050a241029ce73302e8263c4d', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('1a2555753b6642d289b6f4f5c6d300d0', 'f1509c55a16342dbb00571ae171b1c01', '5a42ec5ea5c4475d93715dc4f83ed91c', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '1856355b65fe4317b27661bdfe00626c', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('1b49339518b943ea8a6ad8f2feb904dc', '899941a6450947dc812745a2a4149664', '6a7520d87652450a88baf761b3142ca2', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '97a784a790a748bb8e73004876f7e4af', '3', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('1f48d818bf2343839b9b3575fa137ba5', 'bf019d8fc37a4df785e3de80bfec4ad6', '8e25199a2fca4ceb9a82f744cd8a9adc', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '0cbd1ad35c8246d9b9ed4710bf8663c7', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('1f7770736e634d0d88cff23fd8ff4f04', '6c2c1c5d1cda4b58a99a44d72772db97', '624b02f30d48468fbe98d9237c268512', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '68295e02e93740eebfe67796e38333f9', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('20b982cfc2fb4db4a4cce4440e40ff84', 'ca0e15e2b1164bf288a3198a382497b2', '2cd79e46b15549fc9bc9f4c599b64200', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '29f5dfedafb2484899f99d049d712de8', '3', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('20be2f703f754367a68c7e72863d0b92', '752fee9072ad42f39d99aed39530ec88', 'ab1d57230d3f4ce7a3db003b0c69f6d5', 'aad220a5a1cf428c8e93800edc48b281', 'aad220a5a1cf428c8e93800edc48b281', 'e4277c8c61ff4b09909a1376ebae73ca', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('37a3b3e401084cfc9fe83f6e9c435f8c', 'cce2f342fc4c43308389197ab909c77f', '76a661262e02488892c2e4c7459cb9ea', 'aad220a5a1cf428c8e93800edc48b281', 'aad220a5a1cf428c8e93800edc48b281', 'ab14dbeb1d2140319252a83af0f65633', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('488f70e2c3e94e2084b9a7df6ef0b77e', '3c2d41fa731941a6af03aba94f797453', 'ee6febdd248b49048c86ddb6ae707738', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '3f3ce76e16074152a02baecb3c20d8a9', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('50c9c1f4a7874199a93be6c3a50cdedf', '47ae614f73a546dcaba3af08bce7d3a4', '0a61fadb679649969b71e16cffd60027', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', 'd76efc611f514189b85b9b6b4ff37fa5', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('5562b2d4145d438fa5dc342e5e96d23d', 'de332bf91c4f466197fb45ac3e336fa2', '299b59661a3143bb85a1d73f4847e52a', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '59308799b7d64e78a17ffb7e31c21e82', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('5dbe5c6453054b58b14c32bf1704ca72', '06e39986f6b043b99d4a0374a41f88d5', '2828914b6a8c478cb8d190cd170fceaa', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '285fae4713f5494e94cdad7a588f23af', '1', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('5fc48effedac4c61ae15239aef8a1718', 'bb2b78b4c83c4785bb2692140f731400', '2775d9c9f99542e1a6a43abdf1d8e59c', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '5f958a850f454642a8d103eaf7a1d4f3', '5', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('620a83e1c41e4996923e2507973340ad', '012c05814ec2449d9e8c1cd20ced7895', '3fe1bc3674444ba4a1fbaf5bbd902d4e', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '9faf1b8423984c84a9bb11877e40da9e', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('763e053c4fed43fe9a85dffdbcad9379', 'e5f9341a48cb46678346189de46212dd', '3c9a0bd9833b41c3a4634b83a661e3d2', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '16a3356eac5a48d8b676fa8a95d5232e', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('7c4616cb894d4666918168553dcd9fb0', '98874e0f727746d3b7430bbadf56f268', '36561f035683482698b3386bf0f1f812', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', 'df8b62fb82c2446f9c930cd7b86603df', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('7d45939577f549a4bc50ffb489082dc5', 'e4553c1b8af943c8a166c06f1f5c5a7d', 'f65d2acd96e94c39a00f020c27cee1e5', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', 'b1463fbcef4145758160c4937a66701e', '5', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('9205e63fd0a74e29926db25dddee7976', '2058fd6c23f340f39b02160d04a678d3', 'da56b3775e1649099fbb5747783a6812', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', 'fa3be70c9739405d975b94adbea45f8b', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('a49fbaf7d06c4426ad453d32f1fd1eac', 'bd5ce1ea54e8459ebde8079b37be5dad', '249c32be4342465e9a55857c8728647f', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '713450c700ce42a198689b976f41db76', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('a65ba17923d2495a8a5b585358798b82', '60f845d61258477d8917227cead7446d', '805ab4bd65894be590b432a2d871d93d', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '726a43417c7541899fc91c9a5d36eb46', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('ab9b48e179b9423cb661c0f18412659a', '6991d3a08bbd4eedb3420b0d346ff372', '207590595ae04e51a9a43b12a3fdd67b', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', 'a30a1420b3c7424689cd965110dc3a22', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('b56decf7c0c54f09a8bc4424c3faa4cf', '75e5df8e0429450493544e3dbdd72baa', 'e1695ef7adb041c49f6b850d834484c5', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '7414b1f3618f4a5295d58fb319ba5200', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('bf9b2b2789d8419090fee9889073bc07', 'c04aed0963b745aabd64181275159adb', '144611cdb28f4b9e9388cdb6f5130960', 'aad220a5a1cf428c8e93800edc48b281', '965bb4e81ddb4de9b50366420f96c83d', '7284227393ad41c99ef26db79ef6f13f', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('c52714aa28be47ceb66c07ab14b85081', '1f9a13a630d5408eb66b44d3b1d8d969', '80a8258c30344dfdbc5e446d7430d422', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', 'af8c3644fc1047f9aeac39e8318c0e1e', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('d0187c92d864449a94b1744704c3dbb5', '4d083551aa6d43eb8914eff8d5d399db', 'cddca04251834845bda4ee06ede4a920', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '5f7fdb7769a5412f80d075e6802484e2', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('d860be1f6a164e1590448dbdba356312', 'b74000f896594b1a840af16d0009c992', '4cc9b95d20b0457abf0ab7b4c1df2afc', 'aad220a5a1cf428c8e93800edc48b281', 'aad220a5a1cf428c8e93800edc48b281', 'e0b32fb74cfc47289845c576c085fca6', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('e960fc2a4c2d4781b6b125e9e2630cb5', '0065f51d9f9b4efab125fd91b2ed6070', 'ebe9b834e5c54ae88584ae7beee82f90', 'aad220a5a1cf428c8e93800edc48b281', '965bb4e81ddb4de9b50366420f96c83d', '35cedfa3a9734155bb608efdd4b4073f', '2', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('efe58963eb7d4d1c898c976f56f435f9', '12b7160ace5a4cb88ab9e22ce00e26a8', 'ad1b319f178141d0a0c88db56c9ebe3e', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', 'f5b76f750c5f4125b164f6cc99d1be45', '1', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignment` VALUES ('f1f602d55f1846a4bbc6d9830419c032', '2051a58b7fb246259a0f0ebf203fe283', 'd2dab52fcb3e4ada9f21318cf7df1a6d', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', 'fc24dd0e8fdb40fd8533f476a3fd60a6', '5', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('0065f51d9f9b4efab125fd91b2ed6070', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-019:30:00', '2014-04-0122:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('012c05814ec2449d9e8c1cd20ced7895', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0922:45:00', '2014-04-0922:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('06e39986f6b043b99d4a0374a41f88d5', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-0622:45:00', '2014-05-0622:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('12b7160ace5a4cb88ab9e22ce00e26a8', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-2422:45:00', '2014-04-2422:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('1f9a13a630d5408eb66b44d3b1d8d969', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0816:30:00', '2014-04-0822:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('2051a58b7fb246259a0f0ebf203fe283', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-2423:45:00', '2014-04-2423:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('2058fd6c23f340f39b02160d04a678d3', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0222:45:00', '2014-04-0222:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('3c2d41fa731941a6af03aba94f797453', null, '6c4a5413056b42468cfc6f5a1ba0946c', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-11 15:30:00', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('47ae614f73a546dcaba3af08bce7d3a4', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-2922:45:00', '2014-04-2913:00:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('4d083551aa6d43eb8914eff8d5d399db', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0816:30:00', '2014-04-0822:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('561284772a5242918a1d4db8b6cb5675', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0816:30:00', '2014-04-0822:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('60f845d61258477d8917227cead7446d', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0816:30:00', '2014-04-0822:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('6991d3a08bbd4eedb3420b0d346ff372', null, '30d18f03c3e44208901157b11af2b2fd', '6c4a5413056b42468cfc6f5a1ba0946c', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-1523:45:00', '2014-05-1522:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('6c2c1c5d1cda4b58a99a44d72772db97', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-0816:30:00', '2014-04-0822:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('752fee9072ad42f39d99aed39530ec88', null, '6c4a5413056b42468cfc6f5a1ba0946c', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '2014-04-14 10:30:00', '2014-04-14 11:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('75e5df8e0429450493544e3dbdd72baa', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-02 22:45:00', '2014-04-02 14:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('899941a6450947dc812745a2a4149664', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-1520:45:00', '2014-05-1521::00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('98874e0f727746d3b7430bbadf56f268', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-212014-05-0823:30:00:00', '2014-05-212014-05-0822:45:00:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('aca1bb70e99940158280cffd73711ffa', null, '6c4a5413056b42468cfc6f5a1ba0946c', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '2014-04-14 10:30:00', '2014-04-14 11:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('b74000f896594b1a840af16d0009c992', null, '6c4a5413056b42468cfc6f5a1ba0946c', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '2014-04-14 10:30:00', '2014-04-14 11:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('bb2b78b4c83c4785bb2692140f731400', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-2423:45:00', '2014-04-2423:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('bd5ce1ea54e8459ebde8079b37be5dad', null, '30d18f03c3e44208901157b11af2b2fd', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-1322:45:00', '2014-05-1322:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('bf019d8fc37a4df785e3de80bfec4ad6', null, '30d18f03c3e44208901157b11af2b2fd', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-1322:45:00', '2014-05-1322:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('c04aed0963b745aabd64181275159adb', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-019:30:00', '2014-04-0122:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('c7d7447146c24139a68642391c4be9f2', null, '6c4a5413056b42468cfc6f5a1ba0946c', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '2014-04-14 10:30:00', '2014-04-14 11:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('ca0e15e2b1164bf288a3198a382497b2', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-0622:45:00', '2014-05-0622:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('cce2f342fc4c43308389197ab909c77f', null, '6c4a5413056b42468cfc6f5a1ba0946c', '81ce7206880547b08d54ac6cc3318d92', '965bb4e81ddb4de9b50366420f96c83d', 'aad220a5a1cf428c8e93800edc48b281', '2014-04-14 10:30:00', '2014-04-14 11:30:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('de332bf91c4f466197fb45ac3e336fa2', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-222014-04-2922:45:00:00', '2014-04-222014-04-2913:00:00:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('e0398e78997d41a4b1bd8968c35361ce', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-02 22:45:00', '2014-04-02 14:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('e4553c1b8af943c8a166c06f1f5c5a7d', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-2423:45:00', '2014-04-2423:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('e5f9341a48cb46678346189de46212dd', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-05-0823:30:00', '2014-05-0822:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('f1509c55a16342dbb00571ae171b1c01', null, '30d18f03c3e44208901157b11af2b2fd', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-02 22:45:00', '2014-04-02 14:45:00');
INSERT INTO `yctx_arraignmentproinfor` VALUES ('f256d46fbdef4eba81d544f7ad388d5b', null, '6c4a5413056b42468cfc6f5a1ba0946c', '30d18f03c3e44208901157b11af2b2fd', '965bb4e81ddb4de9b50366420f96c83d', '965bb4e81ddb4de9b50366420f96c83d', '2014-04-11 15:30:00', '2014-04-11 16:30:00');
INSERT INTO `yctx_arraignmentroom` VALUES ('30d18f03c3e44208901157b11af2b2fd', '远端提讯室1', '26da0c0f027344198e4064054fbe5e78', '172.16.40.86', '172.16.40.85');
INSERT INTO `yctx_arraignmentroom` VALUES ('497e74f92594442298ca1564790aceda', '远端提讯室1', '10000000', '172.16.40.86', '172.16.40.85');
INSERT INTO `yctx_arraignmentroom` VALUES ('519ecbc114ab4aa88f31e3815e03c282', '远端提讯室1', '10000000', '172.16.40.86', '172.16.40.85');
INSERT INTO `yctx_arraignmentroom` VALUES ('6c4a5413056b42468cfc6f5a1ba0946c', '远端提讯室2dd', '26da0c0f027344198e4064054fbe5e78', '172.16.40.86', '172.16.40.85');
INSERT INTO `yctx_arraignmentroom` VALUES ('81ce7206880547b08d54ac6cc3318d92', '远端提讯室1', '26da0c0f027344198e4064054fbe5e78', '172.16.40.86', '172.16.40.85');
INSERT INTO `yctx_department` VALUES ('26da0c0f027344198e4064054fbe5e78', '10000000', '最高检察院', null, null);
INSERT INTO `yctx_elecconstdata` VALUES ('1', '<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (第&nbsp;&nbsp;次)</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">询问时间&nbsp;&nbsp;：开始时间&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>时<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>分</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>时<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>分</span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">询问地点&nbsp;&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </u></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">询问方式&nbsp;&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">询&nbsp; 问 人&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>&nbsp;单位&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </u></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">记&nbsp; 录&nbsp;人&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>&nbsp;单位&nbsp;：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </u></span></span></p>\r\n\r\n<p><span style=\"font-size:14px\"><span style=\"font-family:宋体\">告知:我们是&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </u>&nbsp;人民检察院的&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>&nbsp;、<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>(出示证件),今天依法对你进行询问,你要如实回答。</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n');
INSERT INTO `yctx_interrogatedperson` VALUES ('01ee4192eb714439a07b617823c3457f', 'dfafa', 'fdf', '1', '222', 'df', 'dafa');
INSERT INTO `yctx_interrogatedperson` VALUES ('0a61fadb679649969b71e16cffd60027', 'aaaa', 'd', '1', '222', 'dd', 'a');
INSERT INTO `yctx_interrogatedperson` VALUES ('1259988b41de4bb598a21856a7ace69c', 'aaaaaa', 'aaaaaaaaa', '1', '333', 'aaaaaaaaaaa', 'ffffffff');
INSERT INTO `yctx_interrogatedperson` VALUES ('144611cdb28f4b9e9388cdb6f5130960', '2222222222222', '434', '1', '2', 'aaaaaaaaa', '222');
INSERT INTO `yctx_interrogatedperson` VALUES ('207590595ae04e51a9a43b12a3fdd67b', 'ddd', '3', '1', '2', 'd', 'dd');
INSERT INTO `yctx_interrogatedperson` VALUES ('249c32be4342465e9a55857c8728647f', 'd', '', '1', '3', 'df', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('2775d9c9f99542e1a6a43abdf1d8e59c', 'ddd', '', '1', '222', '22', 'ddd');
INSERT INTO `yctx_interrogatedperson` VALUES ('2828914b6a8c478cb8d190cd170fceaa', 'dd', 'd', '1', '2', 'd', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('299b59661a3143bb85a1d73f4847e52a', 'aaaa', 'd', '1', '222', 'dd', 'a');
INSERT INTO `yctx_interrogatedperson` VALUES ('2cd79e46b15549fc9bc9f4c599b64200', 'dd', 'd', '1', '2', 'd', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('36561f035683482698b3386bf0f1f812', 'dd', '', '1', '3', 'dddddddddd', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('3c9a0bd9833b41c3a4634b83a661e3d2', 'dd', '', '1', '3', 'dddddddddd', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('3fe1bc3674444ba4a1fbaf5bbd902d4e', 'd', 'd', '1', '3', 'd', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('4cc9b95d20b0457abf0ab7b4c1df2afc', '111111111111111', '1233', '1', '23', 'ddddddd', 'jack');
INSERT INTO `yctx_interrogatedperson` VALUES ('5a42ec5ea5c4475d93715dc4f83ed91c', 'aaaaaa', 'aaaaaaaaa', '1', '333', 'aaaaaaaaaaa', 'ffffffff');
INSERT INTO `yctx_interrogatedperson` VALUES ('624b02f30d48468fbe98d9237c268512', '3232', 'd', '1', '3', 'd', 'adf');
INSERT INTO `yctx_interrogatedperson` VALUES ('6a7520d87652450a88baf761b3142ca2', 'ddd', 'dfas', '1', '22', 'fda', 'ddd');
INSERT INTO `yctx_interrogatedperson` VALUES ('76a661262e02488892c2e4c7459cb9ea', '111111111111111', '1233', '1', '23', 'ddddddd', 'jack');
INSERT INTO `yctx_interrogatedperson` VALUES ('805ab4bd65894be590b432a2d871d93d', '3232', 'd', '1', '3', 'd', 'adf');
INSERT INTO `yctx_interrogatedperson` VALUES ('80a8258c30344dfdbc5e446d7430d422', '3232', 'd', '1', '3', 'd', 'adf');
INSERT INTO `yctx_interrogatedperson` VALUES ('8e25199a2fca4ceb9a82f744cd8a9adc', 'd', '', '1', '3', 'df', 'd');
INSERT INTO `yctx_interrogatedperson` VALUES ('ab1d57230d3f4ce7a3db003b0c69f6d5', '111111111111111', '1233', '1', '23', 'ddddddd', 'jack');
INSERT INTO `yctx_interrogatedperson` VALUES ('ad1b319f178141d0a0c88db56c9ebe3e', 'a', '3', '1', '2', 'd', 'a');
INSERT INTO `yctx_interrogatedperson` VALUES ('cddca04251834845bda4ee06ede4a920', '3232', 'd', '1', '3', 'd', 'adf');
INSERT INTO `yctx_interrogatedperson` VALUES ('d2dab52fcb3e4ada9f21318cf7df1a6d', 'ddd', '', '1', '222', '22', 'ddd');
INSERT INTO `yctx_interrogatedperson` VALUES ('da56b3775e1649099fbb5747783a6812', '3e434', '', '1', '3', 'ddd', '3');
INSERT INTO `yctx_interrogatedperson` VALUES ('e1695ef7adb041c49f6b850d834484c5', 'aaaaaa', 'aaaaaaaaa', '1', '333', 'aaaaaaaaaaa', 'ffffffff');
INSERT INTO `yctx_interrogatedperson` VALUES ('ebe9b834e5c54ae88584ae7beee82f90', '2222222222222', '434', '1', '2', 'aaaaaaaaa', '222');
INSERT INTO `yctx_interrogatedperson` VALUES ('ee6febdd248b49048c86ddb6ae707738', 'dfafa', 'fdf', '1', '222', 'df', 'dafa');
INSERT INTO `yctx_interrogatedperson` VALUES ('f65d2acd96e94c39a00f020c27cee1e5', 'ddd', '', '1', '222', '22', 'ddd');
INSERT INTO `yctx_interrogatedperson` VALUES ('fc53a3658560456d82742c46076f0e64', '3232', 'd', '1', '3', 'd', 'adf');
INSERT INTO `yctx_lawcase` VALUES ('0cbd1ad35c8246d9b9ed4710bf8663c7', 'd', '1', 'aaad', '8e25199a2fca4ceb9a82f744cd8a9adc', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('16a3356eac5a48d8b676fa8a95d5232e', 'dd', '1', 'dd', '3c9a0bd9833b41c3a4634b83a661e3d2', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('1856355b65fe4317b27661bdfe00626c', 'aaaaaaaaaaaaaaa', '1', 'aaaaaaaaaaa', '5a42ec5ea5c4475d93715dc4f83ed91c', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('285fae4713f5494e94cdad7a588f23af', 'aaaaaa', '1', 'd', '2828914b6a8c478cb8d190cd170fceaa', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('29f5dfedafb2484899f99d049d712de8', 'aaaaaa', '1', 'd', '2cd79e46b15549fc9bc9f4c599b64200', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('35cedfa3a9734155bb608efdd4b4073f', 'fff', '1', 'a', 'ebe9b834e5c54ae88584ae7beee82f90', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('3f3ce76e16074152a02baecb3c20d8a9', 'ffffffffffffffffffffffff', '1', 'df', 'ee6febdd248b49048c86ddb6ae707738', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('59308799b7d64e78a17ffb7e31c21e82', 'ddddddddddddd', '1', 'ddd', '299b59661a3143bb85a1d73f4847e52a', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('5f7fdb7769a5412f80d075e6802484e2', 'dddddd', '1', 'd', 'cddca04251834845bda4ee06ede4a920', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('5f958a850f454642a8d103eaf7a1d4f3', 'ddddddddddd', '1', 'd', '2775d9c9f99542e1a6a43abdf1d8e59c', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('68295e02e93740eebfe67796e38333f9', 'dddddd', '1', 'd', '624b02f30d48468fbe98d9237c268512', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('713450c700ce42a198689b976f41db76', 'd', '1', 'aaad', '249c32be4342465e9a55857c8728647f', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('726a43417c7541899fc91c9a5d36eb46', 'dddddd', '1', 'd', '805ab4bd65894be590b432a2d871d93d', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('7284227393ad41c99ef26db79ef6f13f', 'fff', '1', 'a', '144611cdb28f4b9e9388cdb6f5130960', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('7414b1f3618f4a5295d58fb319ba5200', 'aaaaaaaaaaaaaaa', '1', 'aaaaaaaaaaa', 'e1695ef7adb041c49f6b850d834484c5', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('79aa1ac97c074c26b83a3186d24c4859', 'ffffffffffffffffffffffff', '1', 'df', '01ee4192eb714439a07b617823c3457f', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('941f57f050a241029ce73302e8263c4d', 'dddddd', '1', 'd', 'fc53a3658560456d82742c46076f0e64', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('97a784a790a748bb8e73004876f7e4af', 'ddddddddd', '1', 'dfaf', '6a7520d87652450a88baf761b3142ca2', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('9faf1b8423984c84a9bb11877e40da9e', 'ffffff', '1', 'd', '3fe1bc3674444ba4a1fbaf5bbd902d4e', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('a30a1420b3c7424689cd965110dc3a22', 'dd', '1', 'd', '207590595ae04e51a9a43b12a3fdd67b', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('ab14dbeb1d2140319252a83af0f65633', 'fffffff', '1', 'dfafafa', '76a661262e02488892c2e4c7459cb9ea', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('af8c3644fc1047f9aeac39e8318c0e1e', 'dddddd', '1', 'd', '80a8258c30344dfdbc5e446d7430d422', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('b1463fbcef4145758160c4937a66701e', 'ddddddddddd', '1', 'd', 'f65d2acd96e94c39a00f020c27cee1e5', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('d76efc611f514189b85b9b6b4ff37fa5', 'ddddddddddddd', '1', 'ddd', '0a61fadb679649969b71e16cffd60027', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('df8b62fb82c2446f9c930cd7b86603df', 'dd', '1', 'dd', '36561f035683482698b3386bf0f1f812', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('e0b32fb74cfc47289845c576c085fca6', 'fffffff', '1', 'dfafafa', '4cc9b95d20b0457abf0ab7b4c1df2afc', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('e4277c8c61ff4b09909a1376ebae73ca', 'fffffff', '1', 'dfafafa', 'ab1d57230d3f4ce7a3db003b0c69f6d5', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('f5b76f750c5f4125b164f6cc99d1be45', 'a', '1', 'dd', 'ad1b319f178141d0a0c88db56c9ebe3e', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('fa16a4326ab84735bb9898fe43ca05bd', 'aaaaaaaaaaaaaaa', '1', 'aaaaaaaaaaa', '1259988b41de4bb598a21856a7ace69c', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('fa3be70c9739405d975b94adbea45f8b', 'dddddddddddddddddd', '1', 'dddddddddddd', 'da56b3775e1649099fbb5747783a6812', '远程提讯');
INSERT INTO `yctx_lawcase` VALUES ('fc24dd0e8fdb40fd8533f476a3fd60a6', 'ddddddddddd', '1', 'd', 'd2dab52fcb3e4ada9f21318cf7df1a6d', '远程提讯');
INSERT INTO `yctx_userrole` VALUES ('05e76b6e47cd4c6692057d3d812842de', 'arraignmentPerson', '提讯员');
INSERT INTO `yctx_userrole` VALUES ('0f712898ee0442c3b47eaf0b108ba8c6', 'approver', '审批员');
INSERT INTO `yctx_userrole` VALUES ('66af0716b6c743028bfc4b7ccf7d55e6', 'administrator', '配置管理员');
INSERT INTO `yctx_userrole` VALUES ('846ba2b2499640ce8a3b6dfc3ac2e151', 'handleCaseHelper', '办案协作员');
INSERT INTO `yctx_users` VALUES ('965bb4e81ddb4de9b50366420f96c83d', 'admin', 'admin', 'admin', '000000', '26da0c0f027344198e4064054fbe5e78', 'administrator', '66af0716b6c743028bfc4b7ccf7d55e6');
INSERT INTO `yctx_users` VALUES ('aad220a5a1cf428c8e93800edc48b281', 'tixun', '888888', '张三王五', '007', '26da0c0f027344198e4064054fbe5e78', '提讯员', '05e76b6e47cd4c6692057d3d812842de');
