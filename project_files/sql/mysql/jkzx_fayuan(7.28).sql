/*
Navicat MySQL Data Transfer

Source Server         : activeuc
Source Server Version : 60000
Source Host           : localhost:3306
Source Database       : jkzx

Target Server Type    : MYSQL
Target Server Version : 60000
File Encoding         : 65001

Date: 2014-07-28 10:14:05
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `jkzx_fayuan`
-- ----------------------------
DROP TABLE IF EXISTS `jkzx_fayuan`;
CREATE TABLE `jkzx_fayuan` (
  `jkzx_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `jkzx_fayuanname` varchar(100) COLLATE utf8_bin NOT NULL,
  `jkzx_fayuannum` varchar(50) COLLATE utf8_bin NOT NULL,
  `jkzx_cx` int(11) NOT NULL DEFAULT '0',
  `jkzx_cy` int(11) NOT NULL DEFAULT '0',
  `jkzx_parentfayuannum` varchar(50) COLLATE utf8_bin NOT NULL,
  `jkzx_cx2` int(11) NOT NULL DEFAULT '0',
  `jkzx_cy2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jkzx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of jkzx_fayuan
-- ----------------------------
INSERT INTO `jkzx_fayuan` VALUES ('039dbccb84304b36917843243578ebab', '梧州市万秀区人民法院', 'K41', '650', '447', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0745facbfe8143aaa3f7ad9340f85646', '西林县人民法院', 'KBB', '340', '175', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0ca5cc8affb643bfa7cbbf5be64c8b46', '北海市海城区人民法院', 'K51', '350', '390', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0ce44c70a2904adeb3c776d4be08a2ad', '桂林市秀峰区人民法院', 'K31', '820', '194', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('0e3e1b10ab0a433986c03a865784dafa', '广西壮族自治区高级人民法院', 'K00', '440', '450', '000', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('10ca738e994840a598a8bbf3f514539d', '桂林市七星区人民法院', 'K34', '925', '315', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('115edef7d30e41cebcb35141165fb768', '钟山县人民法院', 'K93', '470', '281', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('14094738ceee470088aeb90dc4121275', '象州县人民法院', 'K73', '580', '320', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('147e4c3548d34bcc8f7e415f66fa2fd5', '隆林各族自治县人民法院', 'KBC', '379', '95', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1603c11a5d224f959dce7f8e69e45098', '金秀瑶族自治县人民法院', 'K79', '770', '215', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1723f1626bf44c0bafc38aa5192a9d30', '柳州市柳南区人民法院', 'K23', '722', '375', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('19f5bf9cfd7345e0880d9dc09d69ca6b', '资源县人民法院', 'K3D', '490', '100', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1cd0b60794364cde98e600c6914d05f3', '大新县人民法院', 'K68', '418', '180', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1de63872e29e44778e583f06bf467cf8', '柳州铁路运输法院', 'KE1', '745', '610', 'KE0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('1f8d9e9a15a548c58e6d28e3c738d04b', '荔浦县人民法院', 'K3F', '360', '585', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('221033dbf0e641de965958aa78708639', '平乐县人民法院', 'K3E', '476', '566', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('23587a011dc6487a81ce4b2e9349d153', '崇左市中级人民法院', 'K60', '316', '518', 'K00', '450', '351');
INSERT INTO `jkzx_fayuan` VALUES ('237941c102454168b4dc4e2e308ad261', '乐业县人民法院', 'KB9', '650', '100', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('243772b555bd4240808097ef99e96539', '田阳县人民法院', 'KB2', '739', '375', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('25cd75f31610417eab525d6702c1c27d', '浦北县人民法院', 'KD3', '655', '301', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('25db6575362c4196b03181eb6da81be9', '融水苗族自治县人民法院', 'K2A', '400', '300', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('290c13c16bff40e4ae18176583eb6add', '梧州市中级人民法院', 'K40', '785', '385', 'K00', '810', '490');
INSERT INTO `jkzx_fayuan` VALUES ('29adcb0f24d04ef58c61a4f96cec79b7', '罗城仫佬族自治县人民法院', 'KC7', '750', '290', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('32c82cf0b2664c13b302d95a0d5bf398', '阳朔县人民法院', 'K36', '380', '501', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('32d56262c5e24f2d956f2ba6125198f8', '北流市人民法院', 'KA3', '518', '225', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('36fef08fa55c447f8d77a9a36b615e7b', '柳江县人民法院', 'K26', '400', '535', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('382d90fe981c4a01a911a90f53f26ed5', '陆川县人民法院', 'KA4', '466', '357', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('38b6421f627a4aebb48dea391a3e6b20', '南宁市邕宁区人民法院\r\n武鸣县人民法院', 'K17', '560', '520', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('3a53a040afc94465ab8db3be1449e57e', '都安瑶族自治县人民法院', 'KCA', '550', '488', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('465047b5ab0a49b9b51e57da1924cb61', '玉林市玉州区人民法院', 'KA1', '440', '225', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('46ea5e108c3c42fe8310113f4e978891', '东兴市人民法院', 'KF4', '264', '441', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('47c8e12033dc492a9a1a3e78d39f7bc3', '贺州市八步区人民法院', 'K92', '550', '315', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('481eea0fadbe466e9e4031526a43ac8f', '横县人民法院', 'K19', '697', '500', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('4bfc1cdc9950417a815340aaff406104', '三江侗族自治县人民法院', 'K2B', '470', '90', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('4df108c578a14708b0bd9ffcf068a1a1', '贵港市覃塘区人民法院', 'KG5', '243', '410', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('501bc3c9762e4d29a966aba8792ee071', '德保县人民法院', 'KB5', '635', '470', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('502c1c1394fd49098539f8b475adbb33', '百色市中级人民法院', 'KB0', '240', '315', 'K00', '685', '330');
INSERT INTO `jkzx_fayuan` VALUES ('5398dfce7af9487390c62d308f1c2c4d', '田林县人民法院', 'KBA', '480', '220', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5671bb243697474da56485d33fc1e506', '富川瑶族自治县人民法院', 'K94', '450', '100', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('573c7f046609414fba00c2385925196c', '隆安县人民法院', 'K1C', '170', '313', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('595f83a4c8204b8e9732bf4b0d99a4ae', '宜州市人民法院', 'KC2', '750', '340', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('598e22ee0e6d44b2b7e3620516cc4c49', '扶绥县人民法院', 'K6C', '647', '283', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5d691aacd8d04acab1e771b9fe464d3c', '南宁铁路运输法院', 'KE2', '745', '570', 'KE0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5e304b1e97dc49aa82abcab67576bf98', '平果县人民法院', 'KB4', '881', '491', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('5e803d17b24a4a7ab80abae27231f9bc', '灵山县人民法院', 'KD2', '551', '225', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('6997f32457b240bf91fb680895f76880', '北海市铁山港区人民法院', 'K54', '590', '390', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('69c80162865747018a39f90cb3051b09', '岑溪市人民法院', 'K45', '439', '500', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('6b302aea2b0d407b945f6e1efcac0a18', '兴安县人民法院', 'K3A', '485', '230', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('727ecf0d48a5493dac5d0114d20d4c26', '防城港市防城区人民法院', 'KF1', '450', '300', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('734758bff67b46579161c67424f2d612', '临桂县人民法院', 'K37', '310', '316', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('7af3d09e20d54c6e8c1f463a5a43be05', '来宾市中级人民法院', 'K70', '558', '348', 'K00', '327', '360');
INSERT INTO `jkzx_fayuan` VALUES ('7b9619ef99124f459340c92096ea51b9', '南宁市青秀区人民法院', 'K12', '460', '465', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('7ce16e294cbb4b468afa2f3c182ab944', '柳城县人民法院', 'K27', '440', '420', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('7d8c7589625a46c69d734c7768150935', '靖西县人民法院', 'KB6', '600', '500', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('81bd52f98f11497c8983eaf3de1cbe0e', '藤县人民法院', 'K46', '418', '384', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('86384830645f4edfac4f4cba7ce499a7', '河池市金城江区人民法院', 'KC1', '500', '320', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('86a627d07b12455b8bbbdbfb74279f89', '河池市中级人民法院', 'KC0', '422', '212', 'K00', '500', '270');
INSERT INTO `jkzx_fayuan` VALUES ('87bf1f26681743bbb716a5d1a8c83346', '玉林市中级人民法院', 'KA0', '657', '499', 'K00', '450', '200');
INSERT INTO `jkzx_fayuan` VALUES ('87f0aca3367944a79a528f32eca14f9a', '巴马瑶族自治县人民法院', 'KC9', '300', '410', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('8a2282be6a1d4b34a300e8be36c864fb', '上思县人民法院', 'KF3', '222', '146', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('8a3cb2337a5a4ee4bd4adb10d6fb7aa0', '贵港市港北区人民法院', 'KG2', '385', '365', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('8cdff90f937f49038ab40b176ac189d0', '南宁铁路运输中级法院', 'KE0', '745', '530', 'K00', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('90b1d269fde0407cade5169e4bb81035', '环江毛南族自治县人民法院', 'KC8', '620', '250', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('930f96e2cf2e47eb8ae693244775b0b5', '合浦县人民法院', 'K53', '400', '290', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9336b8bcd83a4a55adf6f4d14dc26d82', '北海海事法院', 'KH0', '745', '650', 'K00', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('953e7dbcec6c421cb7e45990516be93a', '田东县人民法院', 'KB3', '770', '400', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('95cb4ddebaca460c95b4831f4f8e11d1', '桂林市雁山区人民法院', 'K35', '900', '440', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('967d7b213e5d48cb9e46acfa2b34d459', '柳州市城中区人民法院', 'K21', '815', '315', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9792958c4c1947afba3e532706304564', '桂平市人民法院', 'KG3', '500', '320', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('982bb025463a4d90954a340acbd449b5', '龙胜各族自治县人民法院', 'K3G', '320', '220', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9a4c6bc2e8544f3e86de79c076f10cbf', '合山市人民法院', 'K71', '228', '330', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9a7630479e8f4e90b9f49d0d67c8ef26', '昭平县人民法院', 'K91', '242', '480', 'K90', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('9f429f01f1a746aa895fbf726ba2dde7', '马山县人民法院', 'K1D', '388', '135', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a02cf2f1b1e44f749e8aec56566368e5', '钦州市中级人民法院', 'KD0', '475', '575', 'K00', '310', '410');
INSERT INTO `jkzx_fayuan` VALUES ('a09b1d707a734bec98ce2ce1f6735935', '南宁市西乡塘区人民法院', 'K1E', '333', '375', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a1766c1811204fd8820db5eaa30133f1', '桂林市叠彩区人民法院', 'K32', '870', '217', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a40b57df15a345b59e804c0e68bbdabe', '防城港市中级人民法院', 'KF0', '408', '590', 'K00', '450', '335');
INSERT INTO `jkzx_fayuan` VALUES ('a4ead12a7e704fa78858113c9f0542e4', '崇左市江州区人民法院', 'K67', '450', '380', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a54a9eb5164d461288049ab46d7c44d2', '大化瑶族自治县人民法院', 'KCB', '500', '570', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a5eec1e39bf94dabac972b87bf9c3555', '贵港市中级人民法院', 'KG0', '592', '435', 'K00', '390', '390');
INSERT INTO `jkzx_fayuan` VALUES ('a81f524b1e6f4fcfad69eeeb004a0880', '恭城瑶族自治县人民法院', 'K3H', '520', '490', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('a829498994e34013943e382f8522b079', '桂林市象山区人民法院', 'K33', '880', '267', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('aca014ce60c84332bc62c001837d556e', '东兰县人民法院', 'KC6', '350', '330', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('b267d4887d5443b582b363a14e622097', '柳州市鱼峰区人民法院', 'K22', '835', '395', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ba51ff41e00a46a58e3c9fa313576c16', '防城港市港口区人民法院', 'KF2', '500', '330', 'KF0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bb8cb13628e7452e9cd8a9488ee3a384', '平南县人民法院', 'KG4', '655', '225', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bd0030a7514740248195b112da75d454', '钦州市钦南区人民法院', 'KD4', '300', '385', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bd6f9cbac67e4c0f98115f57c8ae386c', '鹿寨县人民法院', 'K28', '510', '495', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('bea1c4f746c842b49058892716f18684', '全州县人民法院', 'K39', '600', '130', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('beb12b5627724f109ac30bbb222a7821', '贵港市港南区人民法院', 'KG1', '379', '500', 'KG0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c148c9ebba7b45578223c78bfd0bd3c9', '容县人民法院', 'KA2', '583', '130', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c36aedb526204defafdf3237ad3e8590', '灌阳县人民法院', 'K3C', '596', '270', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c37277cb73a84c8f8e74650440ab69f9', '钦州市钦北区人民法院', 'KD1', '290', '300', 'KD0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c46375acff2046ffb84daa430b3582cd', '武鸣县人民法院', 'K18', '396', '260', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('c6763b97c80643a7a8db045fafb5edfd', '上林县人民法院', 'K1B', '500', '225', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('cbd0022e60b144afaee99305f715e898', '贺州市中级人民法院', 'K90', '841', '269', 'K00', '580', '315');
INSERT INTO `jkzx_fayuan` VALUES ('cbf0f17e9dcc4336b08ae38281426878', '南宁市良庆区人民法院', 'K1F', '419', '620', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('cd3f357d013c4a8591690ce2abdeb76e', '永福县人民法院', 'K3B', '235', '440', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ce7e1cf0770a4a6b828f4b03130e2235', '凭祥市人民法院', 'K61', '258', '450', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ce8b98e33f794953825ee4cde1100541', '灵川县人民法院', 'K38', '382', '290', 'K30', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('d491a1581f1e40c593954e16c1dee9ba', '来宾市兴宾区人民法院', 'K75', '320', '400', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('d6e6271563644a72be32685cc255cdf0', '柳州市柳北区人民法院', 'K24', '765', '213', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('d805f0a76b1341dca1972876cc50cb20', '凌云县人民法院', 'KB8', '666', '200', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('da180a3685894feea9a0d0fd45a3097c', '桂林市中级人民法院', 'K30', '686', '140', 'K00', '900', '320');
INSERT INTO `jkzx_fayuan` VALUES ('da262e1f88dc497bbf690c205199ef7b', '忻城县人民法院', 'K77', '142', '233', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('da397e90db46447ca5c6fbd1e3a60b05', '天等县人民法院', 'K69', '410', '133', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('def62d8c64174c46a17413be56ba8333', '那坡县人民法院', 'KB7', '493', '463', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('df9d62bfc9da4b55bfbc45d1cdbe9f11', '宾阳县人民法院', 'K1A', '570', '314', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e1caf93181924ea6ad7a3736eee7b544', '天峨县人民法院', 'KC4', '310', '175', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e228709420ef4d399054db559e946030', '武宣县人民法院', 'K74', '526', '400', 'K70', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e4b279960a1c4705b2ce6c5cddc81d46', '南宁市兴宁区人民法院', 'K11', '530', '400', 'K10', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('e6074bbdb80743859675d489ec5d3def', '百色市右江区人民法院', 'KB1', '665', '310', 'KB0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('eeeeb2311f094fb19d18399bc56f9dbd', '梧州市长洲区人民法院', 'K43', '840', '380', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ef441da8a4b2494a936a509097f0ed5c', '南丹县人民法院', 'KC3', '450', '155', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f1bca46a7b2b4825abec2b32aed30229', '南宁市中级人民法院', 'K10', '445', '477', 'K00', '435', '477');
INSERT INTO `jkzx_fayuan` VALUES ('f32ba37c35ee4a57b203599f4b9da1a0', '柳州市中级人民法院', 'K20', '576', '265', 'K00', '795', '330');
INSERT INTO `jkzx_fayuan` VALUES ('f3fecb5cd91641ffa463ff7991e964ca', '苍梧县人民法院', 'K44', '509', '380', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f63bf12423f2482fb47529e65cbe0bef', '北海市中级人民法院', 'K50', '520', '628', 'K00', '280', '420');
INSERT INTO `jkzx_fayuan` VALUES ('f67c1fae8a1e4ceaae7dde613b5560f4', '北海市银海区人民法院', 'K52', '400', '400', 'K50', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f6a2379ac6614ef59e4f00fffa32d6cf', '兴业县人民法院', 'KA5', '320', '180', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('f9e67a41ca6741bd966a19c3c3606b7e', '宁明县人民法院', 'K6A', '341', '453', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fbb502135cde4ae18a8112d23e5ec53f', '梧州市蝶山区人民法院', 'K42', '767', '410', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fc0e4951189c4e6abc408759d96945a3', '凤山县人民法院', 'KC5', '315', '295', 'KC0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fd8f61eaa9c34e68bf3d83df08beecb8', '融安县人民法院', 'K29', '448', '257', 'K20', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fdc50e3b163d4b23a253173c460ce26b', '蒙山县人民法院', 'K47', '302', '75', 'K40', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fe312974c7c04221a55a4cd8e9e26dfc', '博白县人民法院', 'KA6', '350', '377', 'KA0', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('ff70788b6a01441098a821f615d646a3', '龙州县人民法院', 'K6B', '280', '350', 'K60', '0', '0');
INSERT INTO `jkzx_fayuan` VALUES ('fff5de7aec0a4fd4a2e7d5deb6512c17', '南宁市江南区人民法院', 'K14', '346', '515', 'K10', '0', '0');
