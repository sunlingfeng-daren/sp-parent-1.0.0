/*
MySQL Data Transfer
Source Host: localhost
Source Database: jkzx
Target Host: localhost
Target Database: jkzx
Date: 2014/5/22 11:42:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for jkzx_area
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_area`;
CREATE TABLE `jkzx_area` (
  `jkzx_id` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_areaname` varchar(100) collate utf8_bin NOT NULL,
  `jkzx_areanum` varchar(50) collate utf8_bin NOT NULL,
  `jkzx_parentareanum` varchar(50) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`jkzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for jkzx_device
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_device`;
CREATE TABLE `jkzx_device` (
  `jkzx_servicetype` int(11) default NULL,
  `jkzx_areanum` varchar(50) collate utf8_bin NOT NULL,
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
INSERT INTO `jkzx_area` VALUES ('1', '广西省', '010000', '000000');
INSERT INTO `jkzx_area` VALUES ('10', '贵港市', '010900', '010000');
INSERT INTO `jkzx_area` VALUES ('11', '玉林市', '011000', '010000');
INSERT INTO `jkzx_area` VALUES ('12', '崇左市', '011100', '010000');
INSERT INTO `jkzx_area` VALUES ('13', '来宾市', '011200', '010000');
INSERT INTO `jkzx_area` VALUES ('14', '贺州市', '011300', '010000');
INSERT INTO `jkzx_area` VALUES ('15', '百色市', '011400', '010000');
INSERT INTO `jkzx_area` VALUES ('16', '铁路运输', '011500', '010000');
INSERT INTO `jkzx_area` VALUES ('17', '海事法院', '011600', '010000');
INSERT INTO `jkzx_area` VALUES ('2', '南宁市', '010100', '010000');
INSERT INTO `jkzx_area` VALUES ('3', '柳州市', '010200', '010000');
INSERT INTO `jkzx_area` VALUES ('4', '桂林市', '010300', '010000');
INSERT INTO `jkzx_area` VALUES ('5', '梧州市', '010400', '010000');
INSERT INTO `jkzx_area` VALUES ('6', '北海市', '010500', '010000');
INSERT INTO `jkzx_area` VALUES ('7', '防城港市', '010600', '010000');
INSERT INTO `jkzx_area` VALUES ('8', '河池市', '010700', '010000');
INSERT INTO `jkzx_area` VALUES ('9', '钦州市', '010800', '010000');
INSERT INTO `jkzx_device` VALUES ('2', '010100', '2', '147.1.11.243', '广西高法九楼', '180d1e6e391441348178339ec685c60a', '0', '广西高法', '远程提讯', '2');
INSERT INTO `jkzx_device` VALUES ('1', '010000', '2', '147.110.10.100', '广西高法二楼', '4c47c9b59bec414cbe1f58eeaba2a89c', '0', '广西高法', '远程提讯', '3');
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
