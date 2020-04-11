-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL COMMENT '左',
  `rgt` int(10) unsigned NOT NULL COMMENT '右',
  `parent_id` int(10) unsigned NOT NULL COMMENT '父id',
  `level` int(10) unsigned NOT NULL COMMENT '等级',
  `name` varchar(64) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `lftrgt` (`lft`,`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `category` (`id`, `lft`, `rgt`, `parent_id`, `level`, `name`) VALUES
(9,	25,	26,	0,	1,	'电视剧'),
(10,	21,	22,	0,	1,	'电影'),
(19,	23,	24,	0,	1,	'综艺'),
(20,	27,	28,	0,	1,	'动漫'),
(21,	29,	30,	0,	1,	'少儿'),
(22,	31,	32,	0,	1,	'纪录片'),
(23,	33,	34,	0,	1,	'教育'),
(24,	35,	36,	0,	1,	'VR'),
(25,	37,	38,	0,	1,	'资讯'),
(26,	39,	42,	0,	1,	'体育'),
(27,	40,	41,	26,	2,	'体育');

DROP TABLE IF EXISTS `manage_group`;
CREATE TABLE `manage_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `manage_group` (`id`, `name`, `create_time`, `update_time`) VALUES
(9,	'超级管理员',	1456827449,	1456827449),
(10,	'运营编辑',	1465809454,	1465809454);

DROP TABLE IF EXISTS `manage_group_menu`;
CREATE TABLE `manage_group_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manage_group_id` int(10) unsigned NOT NULL,
  `manage_menu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `manage_group_menu` (`id`, `manage_group_id`, `manage_menu_id`) VALUES
(1,	2,	1),
(16,	9,	151),
(17,	9,	150),
(18,	9,	149),
(19,	9,	148),
(20,	9,	147),
(21,	9,	146),
(22,	9,	145),
(23,	9,	144),
(24,	9,	143),
(25,	9,	142),
(26,	9,	141),
(27,	9,	140),
(28,	9,	139),
(29,	9,	138),
(30,	9,	137),
(31,	9,	136),
(32,	9,	135),
(33,	9,	134),
(34,	9,	133),
(35,	9,	132),
(36,	9,	131),
(37,	9,	130),
(38,	9,	129),
(39,	9,	128),
(40,	9,	127),
(41,	9,	126),
(42,	9,	124),
(43,	9,	123),
(44,	9,	122),
(45,	9,	121),
(46,	9,	120),
(47,	9,	119),
(48,	9,	118),
(49,	9,	117),
(50,	9,	116),
(51,	9,	115),
(52,	9,	114),
(53,	9,	112),
(54,	9,	111),
(55,	9,	110),
(56,	9,	109),
(57,	9,	108),
(58,	9,	107),
(59,	9,	106),
(60,	9,	105),
(61,	9,	104),
(62,	9,	103),
(63,	9,	102),
(64,	9,	100),
(65,	9,	99),
(66,	9,	98),
(67,	9,	97),
(68,	9,	96),
(69,	9,	95),
(70,	9,	94),
(71,	9,	93),
(72,	9,	91),
(73,	9,	90),
(74,	9,	89),
(75,	9,	88),
(76,	9,	87),
(77,	9,	86),
(78,	9,	85),
(79,	9,	83),
(80,	9,	82),
(81,	9,	81),
(82,	9,	80),
(83,	9,	78),
(84,	9,	77),
(85,	9,	76),
(86,	9,	75),
(87,	9,	74),
(88,	9,	73),
(89,	9,	72),
(90,	9,	71),
(91,	9,	70),
(92,	9,	69),
(93,	9,	68),
(94,	9,	67),
(95,	9,	66),
(96,	9,	65),
(97,	9,	64),
(98,	9,	63),
(99,	9,	62),
(100,	9,	61),
(101,	9,	60),
(102,	9,	59),
(103,	9,	58),
(104,	9,	56),
(105,	9,	55),
(106,	9,	54),
(107,	9,	51),
(108,	9,	50),
(109,	9,	49),
(110,	9,	48),
(111,	9,	47),
(112,	9,	46),
(113,	9,	45),
(114,	9,	44),
(115,	9,	41),
(116,	9,	38),
(117,	9,	37),
(118,	9,	36),
(119,	9,	35),
(120,	9,	34),
(121,	9,	33),
(122,	9,	32),
(123,	9,	31),
(124,	9,	30),
(125,	9,	29),
(126,	9,	28),
(127,	9,	27),
(128,	9,	26),
(129,	9,	25),
(130,	9,	24),
(131,	9,	23),
(132,	9,	22),
(133,	9,	21),
(134,	9,	20),
(135,	9,	19),
(136,	9,	18),
(137,	9,	17),
(138,	9,	16),
(139,	9,	15),
(140,	9,	14),
(141,	9,	13),
(142,	9,	12),
(143,	9,	11),
(144,	9,	10),
(145,	9,	9),
(146,	9,	8),
(147,	9,	7),
(148,	9,	6),
(149,	10,	184),
(150,	10,	183),
(151,	10,	182),
(152,	10,	181),
(153,	10,	180),
(154,	10,	179),
(155,	10,	178),
(156,	10,	177),
(157,	10,	176),
(158,	10,	175),
(159,	10,	174),
(160,	10,	173),
(161,	10,	172),
(162,	10,	171),
(163,	10,	169),
(164,	10,	168),
(165,	10,	167),
(166,	10,	166),
(167,	10,	165),
(168,	10,	164),
(169,	10,	163),
(170,	10,	162),
(171,	10,	161),
(172,	10,	159),
(173,	10,	158),
(174,	10,	157),
(175,	10,	156),
(176,	10,	155),
(177,	10,	151),
(178,	10,	150),
(179,	10,	148),
(180,	10,	147),
(181,	10,	146),
(182,	10,	144),
(183,	10,	143),
(184,	10,	142),
(185,	10,	141),
(186,	10,	140),
(187,	10,	139),
(188,	10,	138),
(189,	10,	137),
(190,	10,	136),
(191,	10,	135),
(192,	10,	134),
(193,	10,	133),
(194,	10,	132),
(195,	10,	131),
(196,	10,	130),
(197,	10,	129),
(198,	10,	128),
(199,	10,	127),
(200,	10,	126),
(201,	10,	124),
(202,	10,	123),
(203,	10,	122),
(204,	10,	121),
(205,	10,	120),
(206,	10,	119),
(207,	10,	118),
(208,	10,	117),
(209,	10,	116),
(210,	10,	115),
(211,	10,	114),
(212,	10,	112),
(213,	10,	111),
(214,	10,	110),
(215,	10,	109),
(216,	10,	108),
(217,	10,	107),
(218,	10,	106),
(219,	10,	105),
(220,	10,	104),
(221,	10,	103),
(222,	10,	102),
(223,	10,	100),
(224,	10,	99),
(225,	10,	98),
(226,	10,	97),
(227,	10,	96),
(228,	10,	95),
(229,	10,	94),
(230,	10,	93),
(231,	10,	91),
(232,	10,	89),
(233,	10,	88),
(234,	10,	86),
(235,	10,	85),
(236,	10,	83),
(237,	10,	82),
(238,	10,	81),
(239,	10,	80),
(240,	10,	78),
(241,	10,	77),
(242,	10,	76),
(243,	10,	75),
(244,	10,	74),
(245,	10,	73),
(246,	10,	72),
(247,	10,	71),
(248,	10,	70),
(249,	10,	69),
(250,	10,	68),
(251,	10,	67),
(252,	10,	65),
(253,	10,	64),
(254,	10,	63),
(255,	10,	62),
(256,	10,	61),
(257,	10,	60),
(258,	10,	59),
(259,	10,	58),
(260,	10,	56),
(261,	10,	55),
(262,	10,	54),
(263,	10,	51),
(264,	10,	50),
(265,	10,	49),
(266,	10,	48),
(267,	10,	47),
(268,	10,	45),
(269,	10,	44),
(270,	10,	41),
(271,	10,	38),
(272,	10,	37),
(273,	10,	13),
(274,	10,	12);

DROP TABLE IF EXISTS `manage_menu`;
CREATE TABLE `manage_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lft` int(10) unsigned NOT NULL COMMENT '左',
  `rgt` int(10) unsigned NOT NULL COMMENT '右',
  `parent_id` int(10) unsigned NOT NULL COMMENT '父id',
  `level` int(10) unsigned NOT NULL COMMENT '等级',
  `name` varchar(64) NOT NULL COMMENT '分类名称',
  `url` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `lft_rgt` (`lft`,`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `manage_menu` (`id`, `lft`, `rgt`, `parent_id`, `level`, `name`, `url`) VALUES
(263,	7749,	7820,	0,	1,	'栏目权限管理',	NULL),
(264,	7790,	7819,	263,	2,	'系统用户管理',	NULL),
(265,	7774,	7789,	263,	2,	'分组管理',	NULL),
(266,	7750,	7773,	263,	2,	'栏目管理',	NULL),
(267,	7821,	7968,	0,	1,	'资源库管理',	NULL),
(268,	7940,	7967,	267,	2,	'角标管理',	NULL),
(269,	7878,	7939,	267,	2,	'点播',	NULL),
(270,	7854,	7877,	267,	2,	'内容同步管理',	NULL),
(271,	7969,	8040,	0,	1,	'系统管理',	NULL),
(272,	8032,	8039,	271,	2,	'热词管理',	NULL),
(273,	8020,	8031,	271,	2,	'消息管理',	NULL),
(274,	7996,	8019,	271,	2,	'活动管理',	NULL),
(275,	7990,	7995,	271,	2,	'参数管理',	NULL),
(276,	7970,	7989,	271,	2,	'明星库管理',	NULL),
(277,	8041,	8128,	0,	1,	'媒资包管理',	NULL),
(278,	8106,	8127,	277,	2,	'专题管理',	NULL),
(279,	8042,	8105,	277,	2,	'媒资包',	NULL),
(280,	8129,	8170,	0,	1,	'标签管理',	NULL),
(281,	8154,	8169,	280,	2,	'标签类型管理',	NULL),
(282,	8130,	8153,	280,	2,	'标签',	NULL),
(283,	8171,	8200,	0,	1,	'产品管理',	NULL),
(284,	8172,	8199,	283,	2,	'产品包管理',	NULL),
(285,	8201,	8268,	0,	1,	'终端UI管理',	NULL),
(286,	8202,	8267,	285,	2,	'终端UI',	NULL),
(287,	8269,	8300,	0,	1,	'业务管理',	NULL),
(288,	8286,	8299,	287,	2,	'版本管理',	NULL),
(289,	8270,	8285,	287,	2,	'业务号管理',	NULL),
(290,	7767,	7772,	266,	3,	'栏目添加',	'admin.menu.add'),
(291,	7770,	7771,	290,	4,	'子栏目添加',	'admin.menu.addchild'),
(292,	7768,	7769,	290,	4,	'栏目添加处理',	'admin.menu.create'),
(293,	7751,	7766,	266,	3,	'栏目列表',	'admin.menu.index'),
(294,	7764,	7765,	293,	4,	'栏目修改',	'admin.menu.edit'),
(295,	7762,	7763,	293,	4,	'栏目修改处理',	'admin.menu.update'),
(296,	7760,	7761,	293,	4,	'栏目删除',	'admin.menu.delete'),
(297,	7758,	7759,	293,	4,	'获取栏目名称',	'admin.menu.getmenuname'),
(298,	7754,	7755,	293,	4,	'栏目列表弹出层',	'admin.menu.iframe'),
(299,	7752,	7753,	293,	4,	'栏目移动',	'admin.menu.move'),
(300,	7756,	7757,	293,	4,	'栏目重置',	'admin.menu.rebuild'),
(301,	7783,	7788,	265,	3,	'分组列表',	'admin.group.index'),
(302,	7775,	7782,	265,	3,	'分组添加',	'admin.group.add'),
(303,	7780,	7781,	302,	4,	'分组添加处理',	'admin.group.create'),
(304,	7786,	7787,	301,	4,	'分组修改',	'admin.group.edit'),
(305,	7784,	7785,	301,	4,	'分组修改处理',	'admin.group.update'),
(306,	7778,	7779,	302,	4,	'分组删除',	'admin.group.delete'),
(307,	7776,	7777,	302,	4,	'分组列表弹出层',	'admin.group.iframe'),
(308,	7795,	7818,	264,	3,	'系统用户列表',	'admin.user.index'),
(309,	7791,	7794,	264,	3,	'系统用户添加',	'admin.user.add'),
(310,	7792,	7793,	309,	4,	'系统用户添加处理',	'admin.user.create'),
(311,	7816,	7817,	308,	4,	'系统用户修改',	'admin.user.edit'),
(312,	7814,	7815,	308,	4,	'系统用户修改处理',	'admin.user.update'),
(313,	7812,	7813,	308,	4,	'系统用户删除',	'admin.user.delete'),
(314,	7810,	7811,	308,	4,	'系统用户绑定分组列表',	'admin.user.group'),
(315,	7808,	7809,	308,	4,	'系统用户解绑分组',	'admin.usergroup.delete'),
(316,	7806,	7807,	308,	4,	'系统用户批量解绑分组',	'admin.usergroup.alldelete'),
(317,	7804,	7805,	308,	4,	'系统用户绑定分组',	'admin.usergroup.groupbinduser'),
(318,	7802,	7803,	308,	4,	'分组绑定栏目列表',	'admin.groupmenu.menu'),
(319,	7800,	7801,	308,	4,	'分组解绑栏目',	'admin.groupmenu.delete'),
(320,	7798,	7799,	308,	4,	'分组批量解绑栏目',	'admin.groupmenu.alldelete'),
(321,	7796,	7797,	308,	4,	'分组绑定栏目处理',	'admin.groupmenu.bindmenu'),
(322,	7929,	7938,	269,	3,	'点播分类管理',	'admin.video.category.index'),
(323,	7936,	7937,	322,	4,	'点播分类添加',	'admin.video.category.create'),
(324,	7934,	7935,	322,	4,	'点播分类删除',	'admin.video.category.delete'),
(325,	7932,	7933,	322,	4,	'点播分类修改',	'admin.video.category.update'),
(326,	7930,	7931,	322,	4,	'点播分类移动',	'admin.video.category.move'),
(327,	7879,	7928,	269,	3,	'点播管理',	'admin.video.video.index'),
(328,	7926,	7927,	327,	4,	'影片搜索',	'admin.video.video.search'),
(329,	7924,	7925,	327,	4,	'删除影片',	'admin.video.video.delete'),
(330,	7922,	7923,	327,	4,	'批量删除影片',	'admin.video.video.alldelete'),
(331,	7920,	7921,	327,	4,	'影片添加',	'admin.video.video.add'),
(332,	7918,	7919,	327,	4,	'影片添加处理',	'admin.video.video.create'),
(333,	7912,	7917,	327,	4,	'影片详情',	'admin.video.video.show'),
(334,	7910,	7911,	327,	4,	'影片修改',	'admin.video.video.edit'),
(335,	7908,	7909,	327,	4,	'影片修改处理',	'admin.video.video.update'),
(336,	7906,	7907,	327,	4,	'影片详细',	'admin.video.episode.show'),
(337,	7904,	7905,	327,	4,	'展示添加分集页面',	'admin.video.episode.add'),
(338,	7902,	7903,	327,	4,	'添加分集',	'admin.video.episode.create'),
(339,	7900,	7901,	327,	4,	'影片详细修改',	'admin.video.episode.update'),
(340,	7898,	7899,	327,	4,	'影片分集删除',	'admin.video.episode.delete'),
(341,	7896,	7897,	327,	4,	'设置分集状态',	'admin.video.episode.status'),
(342,	7894,	7895,	327,	4,	'影片片源删除',	'admin.video.media.delete'),
(343,	7892,	7893,	327,	4,	'影片片源添加',	'admin.video.media.add'),
(344,	7890,	7891,	327,	4,	'影片片源处理',	'admin.video.media.create'),
(345,	7888,	7889,	327,	4,	'影片片源编辑',	'admin.video.media.edit'),
(346,	7886,	7887,	327,	4,	'影片片源更新',	'admin.video.media.update'),
(347,	7884,	7885,	327,	4,	'影片下线',	'admin.asset.video.delete'),
(348,	7882,	7883,	327,	4,	'影片批量下线',	'admin.asset.video.alldelete'),
(349,	7880,	7881,	327,	4,	'预览电影基本信息',	'admin.video.video.showinfo'),
(350,	8065,	8104,	279,	3,	'媒资管理',	'admin.asset.video.index'),
(351,	8102,	8103,	350,	4,	'媒资搜索',	'admin.asset.video.search'),
(352,	8100,	8101,	350,	4,	'媒资包绑定影片',	'admin.video.video.iframe'),
(353,	8098,	8099,	350,	4,	'媒资包绑定影片',	'admin.video.video.iframesearch'),
(354,	8096,	8097,	350,	4,	'媒资包绑定影片处理',	'admin.asset.video.binding'),
(355,	8094,	8095,	350,	4,	'媒资包数据浮层',	'admin.asset.video.iframe'),
(356,	8092,	8093,	350,	4,	'媒资包数据浮层搜索',	'admin.asset.video.iframesearch'),
(357,	8043,	8064,	279,	3,	'媒资包栏目管理',	'admin.asset.asset.index'),
(358,	8062,	8063,	357,	4,	'媒资包栏目添加',	'admin.asset.asset.create'),
(359,	8060,	8061,	357,	4,	'媒资包栏目删除',	'admin.asset.asset.delete'),
(360,	8058,	8059,	357,	4,	'媒资包栏目修改',	'admin.asset.asset.update'),
(361,	8056,	8057,	357,	4,	'媒资包栏目移动',	'admin.asset.asset.move'),
(362,	8054,	8055,	357,	4,	'媒资包栏目浮层',	'admin.asset.asset.iframe'),
(363,	8107,	8126,	278,	3,	'专题列表',	'admin.special.special.index'),
(364,	8124,	8125,	363,	4,	'查看专题',	'admin.special.special.show'),
(365,	8122,	8123,	363,	4,	'添加专题',	'admin.special.special.add'),
(366,	8120,	8121,	363,	4,	'添加专题处理',	'admin.special.special.create'),
(367,	8118,	8119,	363,	4,	'修改专题处理',	'admin.special.special.update'),
(368,	8116,	8117,	363,	4,	'专题删除处理',	'admin.special.special.delete'),
(369,	8114,	8115,	363,	4,	'专题绑定列表',	'admin.special.special.bing'),
(370,	8112,	8113,	363,	4,	'专题绑定视频处理',	'admin.special.special.bingvideo'),
(371,	8110,	8111,	363,	4,	'专题解绑绑视频处理',	'admin.special.special.unbingvideo'),
(372,	8108,	8109,	363,	4,	'专题iframe',	'admin.special.special.specialiframe'),
(373,	8131,	8152,	282,	3,	'标签管理',	'admin.label.label.index'),
(374,	8150,	8151,	373,	4,	'标签删除',	'admin.label.label.delete'),
(375,	8148,	8149,	373,	4,	'媒资详情标签绑定列表',	'admin.video.video.label'),
(376,	8146,	8147,	373,	4,	'媒资标签绑定列表',	'admin.video.video.iframelabel'),
(377,	8144,	8145,	373,	4,	'媒资角标绑定列表',	'admin.video.video.iframecorner'),
(378,	8142,	8143,	373,	4,	'媒资明星绑定列表',	'admin.video.video.iframestar'),
(379,	8140,	8141,	373,	4,	'标签浮动层',	'admin.label.label.iframe'),
(380,	8138,	8139,	373,	4,	'删除媒资标签绑定',	'admin.video.video.deletelable'),
(381,	8136,	8137,	373,	4,	'标签绑定视频处理',	'admin.label.label.binging'),
(382,	8134,	8135,	373,	4,	'删除标签绑定',	'admin.label.label.del_label_ding'),
(383,	8132,	8133,	373,	4,	'删除标签绑定视频',	'admin.label.label.labelunbingvideo'),
(384,	8155,	8168,	281,	3,	'标签类型管理',	'admin.label.labeltype.index'),
(385,	8166,	8167,	384,	4,	'添加标签类型管理',	'admin.label.labeltype.add'),
(386,	8164,	8165,	384,	4,	'添加标签类型管理处理',	'admin.label.labeltype.create'),
(387,	8162,	8163,	384,	4,	'编辑标签类型',	'admin.label.labeltype.show'),
(388,	8160,	8161,	384,	4,	'编辑标签类型处理',	'admin.label.labeltype.update'),
(389,	8158,	8159,	384,	4,	'标签类型删除',	'admin.label.labeltype.delete'),
(390,	8156,	8157,	384,	4,	'标签状态修改',	'admin.label.label.status'),
(391,	8173,	8198,	284,	3,	'产品包列表',	'admin.product.product.index'),
(392,	8196,	8197,	391,	4,	'产品包添加',	'admin.product.product.add'),
(393,	8194,	8195,	391,	4,	'处理产品包添加',	'admin.product.product.create'),
(394,	8192,	8193,	391,	4,	'产品包详情',	'admin.product.product.show'),
(395,	8190,	8191,	391,	4,	'产品包跟新',	'admin.product.product.update'),
(396,	8188,	8189,	391,	4,	'产品包删除',	'admin.product.product.delete'),
(397,	8186,	8187,	391,	4,	'产品包绑定列表',	'admin.product.product.binding'),
(398,	8184,	8185,	391,	4,	'产品绑定处理',	'admin.product.product.bindingvideo'),
(399,	8182,	8183,	391,	4,	'产品解绑处理',	'admin.product.product.deletebinding'),
(400,	8180,	8181,	391,	4,	'产品绑定媒资包处理',	'admin.product.product.bindingasset'),
(401,	8178,	8179,	391,	4,	'产品批量解绑处理',	'admin.product.product.alldeletebinding'),
(402,	8231,	8266,	286,	3,	'终端下发栏目管理',	'admin.terminal.menu.index'),
(404,	8264,	8265,	402,	4,	'启用导航',	'admin.terminal.menu.enable'),
(405,	8262,	8263,	402,	4,	'终端栏目管理',	'admin.terminal.menu.add'),
(406,	8260,	8261,	402,	4,	'终端栏目修改',	'admin.terminal.menu.edit'),
(407,	8258,	8259,	402,	4,	'终端栏目删除',	'admin.terminal.menu.delete'),
(408,	8256,	8257,	402,	4,	'终端栏目添加处理',	'admin.terminal.menu.create'),
(409,	8254,	8255,	402,	4,	'终端栏目修改处理',	'admin.terminal.menu.update'),
(410,	8252,	8253,	402,	4,	'终端栏目页面编辑',	'admin.terminal.menu.page'),
(411,	8250,	8251,	402,	4,	'终端栏目页面编辑',	'admin.terminal.terminal.add'),
(412,	8248,	8249,	402,	4,	'终端栏目页面添加处理',	'admin.terminal.terminal.create'),
(413,	8246,	8247,	402,	4,	'终端栏目页面编辑',	'admin.terminal.terminal.show'),
(414,	8244,	8245,	402,	4,	'终端栏目页面编辑处理',	'admin.terminal.terminal.update'),
(415,	8242,	8243,	402,	4,	'终端栏目页面删除处理',	'admin.terminal.terminal.delete'),
(416,	8240,	8241,	402,	4,	'终端栏目页面移动处理',	'admin.terminal.terminal.move'),
(417,	8238,	8239,	402,	4,	'终端栏目页面绑定浮层',	'admin.terminal.menu.iframe'),
(418,	8236,	8237,	402,	4,	'终端绑定EPG',	'admin.terminal.menu.itembandingepg'),
(419,	8234,	8235,	402,	4,	'终端解绑EPG',	'admin.terminal.menu.unbanding'),
(420,	8203,	8230,	286,	3,	'终端首页推荐页面管理',	'admin.terminal.recom.index'),
(421,	8228,	8229,	420,	4,	'终端首页推荐页面查看',	'admin.terminal.recom.show'),
(422,	8226,	8227,	420,	4,	'终端首页推荐页面修改处理',	'admin.terminal.recom.update'),
(423,	8224,	8225,	420,	4,	'终端首页推荐页面添加处理',	'admin.terminal.recom.create'),
(424,	8222,	8223,	420,	4,	'终端首页推荐页面添加',	'admin.terminal.recom.add'),
(425,	8220,	8221,	420,	4,	'终端首页推荐页面删除',	'admin.terminal.recom.delete'),
(426,	8218,	8219,	420,	4,	'终端首页推荐页面编辑',	'admin.terminal.recom.page'),
(427,	8216,	8217,	420,	4,	'终端推荐位日程安排',	'admin.terminal.recom.recomschedule'),
(428,	8214,	8215,	420,	4,	'删除推荐位日程安排',	'admin.terminal.recom.delschedule'),
(429,	8212,	8213,	420,	4,	'添加推荐位日程安排',	'admin.terminal.recom.addrecomschedule'),
(430,	8210,	8211,	420,	4,	'编辑推荐位日程安排',	'admin.terminal.recom.editrecomschedule'),
(431,	8208,	8209,	420,	4,	'更新推荐位日程安排',	'admin.terminal.recom.updaterecomschedule'),
(432,	8206,	8207,	420,	4,	'终端首页推荐编排页面',	'admin.terminal.recom.recom'),
(433,	8204,	8205,	420,	4,	'终端首页推荐编排处理页面',	'admin.terminal.recom.recomcreate'),
(434,	7991,	7994,	275,	3,	'CMS下发参数',	'admin.system.index'),
(435,	7992,	7993,	434,	4,	'更新系统变量',	'admin.system.update'),
(436,	8033,	8038,	272,	3,	'热词列表',	'admin.video.hot.index'),
(437,	8036,	8037,	436,	4,	'删除热词',	'admin.video.hot.delete'),
(438,	8034,	8035,	436,	4,	'添加热词',	'admin.video.hot.add'),
(439,	8021,	8030,	273,	3,	'公共消息列表',	'admin.message.message.index'),
(440,	8028,	8029,	439,	4,	'公共消息添加',	'admin.message.message.add'),
(441,	8026,	8027,	439,	4,	'公共消息添加处理',	'admin.message.message.create'),
(442,	8024,	8025,	439,	4,	'公共消息查看',	'admin.message.message.show'),
(443,	8022,	8023,	439,	4,	'公共消息编辑',	'admin.message.message.update'),
(444,	7997,	8018,	274,	3,	'活动列表',	'admin.lottery.lottery.index'),
(445,	8016,	8017,	444,	4,	'活动添加',	'admin.lottery.lottery.add'),
(446,	8014,	8015,	444,	4,	'活动添加处理',	'admin.lottery.lottery.create'),
(447,	8012,	8013,	444,	4,	'查看活动详情',	'admin.lottery.lottery.show'),
(448,	8010,	8011,	444,	4,	'活动更新',	'admin.lottery.lottery.update'),
(449,	8008,	8009,	444,	4,	'奖品列表',	'admin.lottery.lottery.bing'),
(450,	8006,	8007,	444,	4,	'奖品添加',	'admin.lottery.lottery.addlotteryitem'),
(451,	8004,	8005,	444,	4,	'添加奖品处理',	'admin.lottery.lottery.createlotteryitem'),
(452,	8002,	8003,	444,	4,	'修改奖品属性',	'admin.lottery.lottery.updatelotteryitem'),
(453,	8000,	8001,	444,	4,	'查看奖品属性',	'admin.lottery.lottery.showlotteryitem'),
(454,	7998,	7999,	444,	4,	'抽奖浮动列表层',	'admin.lottery.lottery.iframe'),
(455,	7971,	7988,	276,	3,	'明星库列表',	'admin.star.person.index'),
(456,	7986,	7987,	455,	4,	'明星库明星编辑页面',	'admin.star.person.edit'),
(457,	7984,	7985,	455,	4,	'明星库iframe',	'admin.star.person.iframe'),
(458,	7982,	7983,	455,	4,	'明星库绑定媒资',	'admin.star.person.starbind'),
(459,	7980,	7981,	455,	4,	'明星库解除绑定媒资',	'admin.star.person.starunbind'),
(460,	7978,	7979,	455,	4,	'明星库激活或者不激活绑定媒资',	'admin.star.person.starstatus'),
(461,	7976,	7977,	455,	4,	'明星绑定库的编辑',	'admin.star.person.starweight'),
(462,	7974,	7975,	455,	4,	'明星库明星编辑',	'admin.star.person.update'),
(463,	7947,	7966,	268,	3,	'角标管理',	'admin.video.corner.index'),
(464,	7945,	7946,	268,	3,	'角标添加',	'admin.video.corner.add'),
(465,	7964,	7965,	463,	4,	'角标添加处理',	'admin.video.corner.create'),
(466,	7941,	7944,	268,	3,	'角标浮动层',	'admin.corner.corner.iframe'),
(467,	7942,	7943,	466,	4,	'媒资详情角标绑定列表',	'admin.video.video.corner'),
(468,	7962,	7963,	463,	4,	'角标详情',	'admin.video.corner.show'),
(469,	7960,	7961,	463,	4,	'角标修改',	'admin.video.corner.update'),
(470,	7958,	7959,	463,	4,	'角标删除',	'admin.video.corner.delete'),
(471,	7956,	7957,	463,	4,	'视频绑定角标列表',	'admin.video.corner.video'),
(472,	7954,	7955,	463,	4,	'角标绑定视频',	'admin.video.corner.bing'),
(473,	7952,	7953,	463,	4,	'角标解绑视频',	'admin.video.corner.unbing'),
(474,	7950,	7951,	463,	4,	'角标绑定视频处理',	'admin.corner.corner.binging'),
(475,	7948,	7949,	463,	4,	'删除角标 ',	'admin.corner.corner.delete_corner'),
(476,	7915,	7916,	333,	5,	'获取影片明星',	'admin.video.video.videospiderstar'),
(477,	7913,	7914,	333,	5,	'获取分集明星',	'admin.video.video.episodespiderstar'),
(478,	7972,	7973,	455,	4,	'获取明星封面',	'admin.star.person.getposter'),
(479,	8090,	8091,	350,	4,	'媒资筛选标签列表',	'admin.asset.video.label'),
(480,	8088,	8089,	350,	4,	'媒资筛选标签json',	'admin.asset.video.labeljson'),
(481,	8086,	8087,	350,	4,	'媒资标签绑定处理',	'admin.asset.video.assetbindlabel'),
(482,	8084,	8085,	350,	4,	'媒资明星绑定处理',	'admin.asset.assetstar.bind'),
(483,	8082,	8083,	350,	4,	'媒资明星删除处理',	'admin.asset.assetstar.delete'),
(484,	8080,	8081,	350,	4,	'媒资明星编辑处理',	'admin.asset.assetstar.modify'),
(485,	8078,	8079,	350,	4,	'媒资专题绑定处理',	'admin.asset.assetspecial.bind'),
(486,	8076,	8077,	350,	4,	'媒资专题删除处理',	'admin.asset.assetspecial.delete'),
(487,	8074,	8075,	350,	4,	'媒资专题编辑处理',	'admin.asset.assetspecial.modify'),
(488,	8072,	8073,	350,	4,	'媒资绑定业务列表',	'admin.asset.asset.iframebusiness'),
(489,	8070,	8071,	350,	4,	'媒资绑定业务',	'admin.asset.asset.bindasset'),
(490,	8068,	8069,	350,	4,	'媒资解除绑定业务',	'admin.asset.asset.unbindbusiness'),
(491,	7873,	7876,	270,	3,	'同步日志',	'admin.sync.synccontentlog.index'),
(492,	7874,	7875,	491,	4,	'重新同步内容',	'admin.sync.synccontentlog.reexec'),
(493,	7865,	7872,	270,	3,	'同步点播',	'admin.sync.synccontent.index'),
(494,	7870,	7871,	493,	4,	'执行同步内容',	'admin.sync.synccontent.execsycn'),
(495,	7868,	7869,	493,	4,	'执行批量任务',	'admin.sync.synccontent.allexec'),
(496,	7866,	7867,	493,	4,	'判断同步内容的状态',	'admin.sync.synccontent.operation'),
(497,	7855,	7864,	270,	3,	'中心列队',	'admin.sync.queue.index'),
(498,	7862,	7863,	497,	4,	'执行中心列队',	'admin.sync.queue.implort'),
(499,	7860,	7861,	497,	4,	'启动中心列队',	'admin.sync.queue.start'),
(500,	7858,	7859,	497,	4,	'批量删除中心列队',	'admin.sync.queue.alldelete'),
(501,	7856,	7857,	497,	4,	'执行单个中心列队',	'admin.sync.queue.exec'),
(502,	8287,	8298,	288,	3,	'版本列表',	'admin.version.version.index'),
(503,	8296,	8297,	502,	4,	'版本添加',	'admin.version.version.create'),
(504,	8294,	8295,	502,	4,	'版本绑定业务',	'admin.version.version.bind'),
(505,	8292,	8293,	502,	4,	'版本绑定业务post',	'admin.version.version.bindbusiness'),
(506,	8290,	8291,	502,	4,	'版本修改',	'admin.version.version.update'),
(507,	8288,	8289,	502,	4,	'查看版本',	'admin.version.version.show'),
(508,	8271,	8284,	289,	3,	'业务号列表',	'admin.business.business.index'),
(509,	8282,	8283,	508,	4,	'业务号添加',	'admin.business.business.create'),
(510,	8280,	8281,	508,	4,	'业务号修改',	'admin.business.business.update'),
(511,	8278,	8279,	508,	4,	'业务绑定版本',	'admin.business.business.bind'),
(512,	8276,	8277,	508,	4,	'业务绑定版本post',	'admin.business.business.bindversion'),
(513,	8176,	8177,	391,	4,	'媒资产品绑定列表',	'admin.video.video.productpackage'),
(514,	8174,	8175,	391,	4,	'解绑产品包',	'admin.video.video.unbind_product_package'),
(515,	8274,	8275,	508,	4,	'查看业务号',	'admin.business.business.show'),
(516,	8272,	8273,	508,	4,	'删除绑定关系',	'admin.business.business.deleterelation'),
(517,	7822,	7853,	267,	2,	'轮播管理',	NULL),
(518,	7823,	7852,	517,	3,	'轮播列表',	'admin.playbill.playbill.index'),
(520,	7850,	7851,	518,	4,	'创建节目单',	'admin.playbill.playbill.store'),
(521,	7848,	7849,	518,	4,	'更新节目单',	'admin.playbill.playbill.update'),
(522,	7846,	7847,	518,	4,	'节目单内容列表',	'admin.playbill.playbillcontent.playbillindex'),
(523,	7844,	7845,	518,	4,	'节目单内容绑定',	'admin.playbill.playbillcontent.playbillbind'),
(524,	7842,	7843,	518,	4,	'节目单内容编辑',	'admin.playbill.playbillcontent.update'),
(525,	7840,	7841,	518,	4,	'节目单内容创建',	'admin.playbill.playbillcontent.store'),
(526,	7838,	7839,	518,	4,	'节目单内容创建推荐',	'admin.playbill.playbillcontentrecom.store'),
(527,	7836,	7837,	518,	4,	'节目单某个内容绑定列表',	'admin.playbill.playbillcontentrecom.bindindex'),
(528,	7834,	7835,	518,	4,	'节目单内容删除',	'admin.playbill.playbillcontent.delete'),
(529,	7832,	7833,	518,	4,	'节目单某个内容推荐删除',	'admin.playbill.playbillcontentrecom.delete'),
(530,	7830,	7831,	518,	4,	'节目单内容编辑页面',	'admin.playbill.playbillcontent.edit'),
(531,	8066,	8067,	350,	4,	'某个video下的分集',	'admin.video.video.videoepisode'),
(532,	7828,	7829,	518,	4,	'业务绑定轮播',	'admin.playbill.playbillcontent.bindbusiness'),
(533,	7826,	7827,	518,	4,	'业务解绑绑定轮播',	'admin.playbill.playbillcontent.unbindbusiness'),
(534,	7824,	7825,	518,	4,	'轮播绑定列表',	'admin.playbill.playbill.bindindex'),
(535,	8301,	8346,	0,	1,	'体育专区',	NULL),
(536,	8302,	8345,	535,	2,	'体育管理',	NULL),
(537,	8321,	8326,	536,	3,	'赛事列表',	'admin.sport.sport.index'),
(538,	8324,	8325,	537,	4,	'创建赛事',	'admin.sport.sport.store'),
(539,	8322,	8323,	537,	4,	'修改赛事',	'admin.sport.sport.update'),
(543,	8327,	8344,	536,	3,	'赛季列表',	'admin.sport.season.index'),
(544,	8342,	8343,	543,	4,	'创建赛季',	'admin.sport.season.store'),
(545,	8340,	8341,	543,	4,	'修改赛季',	'admin.sport.season.update'),
(546,	8315,	8320,	536,	3,	'球队列表',	'admin.sport.team.index'),
(547,	8318,	8319,	546,	4,	'创建球队',	'admin.sport.team.store'),
(548,	8316,	8317,	546,	4,	'修改球队',	'admin.sport.team.update'),
(549,	8303,	8314,	536,	3,	'比赛列表',	'admin.sport.match.index'),
(550,	8312,	8313,	549,	4,	'创建比赛',	'admin.sport.match.store'),
(551,	8310,	8311,	549,	4,	'修改比赛',	'admin.sport.match.update'),
(554,	8338,	8339,	543,	4,	'赛季绑定的赛事',	'admin.sport.seasonsport.sportindex'),
(555,	8336,	8337,	543,	4,	'赛季绑定赛事',	'admin.sport.seasonsport.store'),
(556,	8334,	8335,	543,	4,	'赛季绑定赛事的编辑',	'admin.sport.seasonsport.update'),
(557,	8332,	8333,	543,	4,	'赛季赛事绑定的球队',	'admin.sport.seasonsportteam.sportseasonindex'),
(558,	8330,	8331,	543,	4,	'赛季赛事绑定球队',	'admin.sport.seasonsportteam.store'),
(559,	8328,	8329,	543,	4,	'赛季绑定赛事的编辑',	'admin.sport.seasonsportteam.update'),
(560,	8308,	8309,	549,	4,	'删除比赛',	'admin.sport.match.destory'),
(561,	8232,	8233,	402,	4,	'终端栏目页面解绑绑定浮层',	'admin.terminal.menu.unbindiframe'),
(562,	8306,	8307,	549,	4,	'添加比赛',	'admin.sport.match.add'),
(563,	8304,	8305,	549,	4,	'比赛详情',	'admin.sport.match.show'),
(564,	8347,	8358,	0,	1,	'鉴权白名单',	'admin.whitelist.epgauth.index'),
(565,	8352,	8357,	564,	2,	'鉴权白名单添加',	'admin.whitelist.epgauth.add'),
(566,	8355,	8356,	565,	3,	'鉴权白名单添加处理',	'admin.whitelist.epgauth.create'),
(567,	8350,	8351,	564,	2,	'鉴权白名单详情',	'admin.whitelist.epgauth.show'),
(568,	8348,	8349,	564,	2,	'鉴权白名单更新',	'admin.whitelist.epgauth.update'),
(569,	8353,	8354,	565,	3,	'鉴权白名单删除',	'admin.whitelist.epgauth.destroy'),
(570,	8052,	8053,	357,	4,	'添加景点',	'admin.travel.touristspots.add'),
(571,	8050,	8051,	357,	4,	'创建景点',	'admin.travel.touristspots.create'),
(572,	8048,	8049,	357,	4,	'删除景点',	'admin.travel.touristspots.destroy'),
(573,	8046,	8047,	357,	4,	'查看景点',	'admin.travel.touristspots.show'),
(574,	8044,	8045,	357,	4,	'更新景点',	'admin.travel.touristspots.update');

DROP TABLE IF EXISTS `manage_user`;
CREATE TABLE `manage_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `is_lock` int(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `manage_user` (`id`, `username`, `password`, `is_lock`, `create_time`, `update_time`) VALUES
(2,	'zhouguanghu',	'944f0fc0f1fdd416b3b85d2aa97b9862',	0,	1456831293,	1459235315),
(3,	'Allen',	'4aa5d74ec954da27700870597bd6fe3b',	0,	1459235128,	1459235128),
(4,	'tam',	'2c97f7dce5f7e95db5cc663f83cc7d1d',	0,	1459236949,	1464857318),
(8,	'shawn',	'b652a95a58d3bfbf144dc69fae44d079',	0,	1464857352,	1464860502),
(9,	'cms_yunying',	'536df69ac4b0032490bec4f1a10eaa56',	0,	1465809406,	1465809406);

DROP TABLE IF EXISTS `manage_user_group`;
CREATE TABLE `manage_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manage_user_id` int(10) unsigned NOT NULL,
  `manage_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_group_id` (`manage_group_id`,`manage_user_id`),
  KEY `user_id` (`manage_user_id`),
  KEY `group_id` (`manage_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `manage_user_group` (`id`, `manage_user_id`, `manage_group_id`) VALUES
(17,	2,	9),
(18,	3,	9),
(19,	4,	9),
(20,	8,	9),
(21,	9,	10);

-- 2017-11-09 06:58:30
