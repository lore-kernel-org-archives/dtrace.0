Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B715491
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721883658; cv=fail; b=fwtYGCfSKdnDjq/AjMSrA3kntM3QJ+6zhDZ15ltbVv+GMeHYDdeqqUatfOgysfb/1pJIb6FnCGEEha/xT617fVj2VMSN/iVx8JsQrMmoLxito8mJtItQTTAn+IL6BsGWfHp7zWotnLxl7ziHC0EBP7EBEwMjeptMwhqIz833C7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721883658; c=relaxed/simple;
	bh=g8fjg81Yo6Kommso5ozQrSE4tEHqVpyE+VZ9eOOD4fk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=E1HOkrQo5Cm7bONR58N10s26vdtsJzSfTqkj5qpGJ77VOiqUPkYSSsdMX+hsh51c6Em+9tAonWH0LySHU2IuWh3BXLG+ehhScGKeS5qXunwOzNOtfbVUWAgs1/tPTitk51zpkf38a7eLcReSpP9xHfkITX299+a0L129XBI1xPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q12XTavn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sGkEiR/o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q12XTavn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sGkEiR/o"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46OJeFH5028960
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 05:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=r5wyS/UpSNp/MEXauIMGrlMR5I2Tldo6dDqWEZFcw1c=; b=
	Q12XTavnFC9n10CsOGLixI+ZI3Tkf1dVx1pHyosxNIIjBZfsdRbhUd1XlJYWxho8
	BVcYzNQ8HHdhbSq2O1bBo7+p2jWS+HM8LSom8X6QttEsLc+z6ej/i7K95dfm3RGa
	5CfoZKt3isRj1Ws4Of9K8gPYJpZ3dZh9WCYtz2lkT85y+HMXVO1CIHKoGPgz09nH
	/GZZiBVQLRD57PKfQGWhw5dl9LUO9UAo+YK8kF9gxiLp4DG8+FdriaYM/l5nl5zz
	vsvUARgQZ/ewFh5AApHs610S1/OCClRDX0MbzTZmQEpiIc8U7Bd+OnrBkXoJKJzI
	nP8/Jnfhct5SYAfDCpYXdw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hgcrjjh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 05:00:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46P4ixif033735
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 05:00:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h26bqv9t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 05:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJ1YsbvalunD34ySc45MVEl8aNlDm+As1J7uspaisP9rgsOppm+rpoi0nuhtOdBBNxWbwd9cltKuUO7qOHhD1bSKNT5m25PHl6/6oWBn/eEkoUoqoAHwO8Wszv9bo3k5mKSggvIZmbpnL/MbhreHVQSuQeS1Of2Lw7ZBfLqk2h7xMMA07299JIvzAJPdVQE4ipJ9B9dTcHrOe0WGAx1Zjnk7f2UX4LmfA+s8/Q/eh32d9djdO6VZaXDOHUrPmYnKpjXZu4AM/bejZQzp21OamJxsJAQxHvwNiGSO5dfwQGV+FJDbh7f5XZJrW1DDs/UWog50rv9TXAYoF54Ps6dP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5wyS/UpSNp/MEXauIMGrlMR5I2Tldo6dDqWEZFcw1c=;
 b=ofDUnrdrV/1+p8Qt08pqqD7keZXrK141hoHtAQX0gC1VCOJ2AqxqbQ8ZqIB5DCRUOjknA5mBP/6IfgLTnECT+xJqxcBNf1VZbSiOW1ImmDSopAt6khw/k/FguO2pSOle3cXAppw2Y8b/kZvqv/Qxg7/wly+crroZbZiRZn8WiZOhoCEkOeLKV7oVaR/H6mN+3c2SEETQbOyVToQedU4JTFdZWypYWicOmlKSMbhszo2DaKu7To1QVXAVcmW/zoctU65eeQmUTWl8M2jka8Vx1W8TdKuLl7wskjvbxFfeWXwAVWFbM5tQtiyddmcITUIiFxmgvJX3BEOYoovwjFhXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5wyS/UpSNp/MEXauIMGrlMR5I2Tldo6dDqWEZFcw1c=;
 b=sGkEiR/o2E0+HYsez7PNQIcuZMDKV5Pj2h/iQgDTCO4h7gmUqdvL0zwATdVS32ud9BJ9qlQekGAosUHO+MIZkB4y4Ym/hnF+dh91oNxi9nT5BQUPxr9LTiAkA1TgSPLdBbG86UgmpdxEnERU6KWbppGn/RVlIhGW9+Qif/XaM00=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7238.namprd10.prod.outlook.com (2603:10b6:208:3f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 05:00:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 05:00:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/7] Generate clearer error message when dtrace is run not as root
Date: Thu, 25 Jul 2024 01:00:48 -0400
Message-Id: <20240725050048.28226-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:530::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: a275beff-4e17-49e3-cc20-08dcac66c1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yk7DvFI+yFHfuyi4MrTX6lzRjwY1vrrtTmJiwyddOyGCA0I7hX6tL98xKgXC?=
 =?us-ascii?Q?4dCmtNivFC65nyOf04jRUXHoPtNQKskS7yYesTnh25kOvab2zqkhF6anWMnU?=
 =?us-ascii?Q?Ox3/TpG2czosDPCVmGyVyEYdlFd2zyn1nLR1iCFb7ob6q2sflrMyEv8foW7T?=
 =?us-ascii?Q?yqbidBJXyP6pYVuVDzRsDXdVC7zxdIQud1IXZw2KaocO7Gj5V2fQbc5BKB7v?=
 =?us-ascii?Q?48uHuZTcfv1H0xkjOLtpi2BKVQG4GrSv/F6WZW8pwjqxlUJXKSjsCB4JfpF9?=
 =?us-ascii?Q?c5gmZtQ98fFUsiHhq6iwYjkiRCAGAjAVYBaKkOgS9J9S9BxGwAPzvxXEz2+W?=
 =?us-ascii?Q?EKGu8RyFQuCk+V+i4nzUNt+ZOd4ZMCY4xbDjEf+zXopN32A51sATvOkgMQki?=
 =?us-ascii?Q?16ypcDmevKcT6sKZ9/If/cXIEhUjLML08b7XKLwc840aya15AWggdnodWrPp?=
 =?us-ascii?Q?9mF9cYvGL4+hCwYtH5caGgU0RgjJc6VozQXBeYGaDUz3R2tdR9/viABnnfRY?=
 =?us-ascii?Q?AnOLapzfCTdLok1UljGfnvRUCAjZOzURMkNnFqUpgzBAPbNnUXhlqQnq3W3K?=
 =?us-ascii?Q?I/rEnrbczNQ371W+4z4ZfqX7JqZkNzuzrdPIwRwvzbqALHzlc5whlgn54nzi?=
 =?us-ascii?Q?gCh9t4Lbeh2fvHB32DAmd+V8LbLzxfJTWpLeTT9wz9Yd9dkepjimZYbMkfuQ?=
 =?us-ascii?Q?eUU7yPlxZ9KwdFpnM0NPMXq4qLujVENd80M7LI+es0vjrPRlMHL091iB1JV+?=
 =?us-ascii?Q?xdHLXc1rQh5wTcJ8BRHJXoRqRv9txY/X2QWLE9XOp0YWIOtBgzjs39xc9n+q?=
 =?us-ascii?Q?DOvPHtvGizsDPTh8kxP5Fb8c5sOTUyapUVRhdA8FIUWINMWl8IpWuVcVGV6z?=
 =?us-ascii?Q?wvd4Xbd4NyXQM75S3x8LZ36T9s1LCrJyZJWM/jspKpenXFd8zQyjvX35ECFN?=
 =?us-ascii?Q?vf/ZCJVkege5TmPFfFSnBTwkqu+zNsU7uccWnTDBcVYkoU05eQ4zgEp2Uwdw?=
 =?us-ascii?Q?ojCjtNeT13NggM4Cq9cmdcbx62srXM7hy9oPE5rKQmjULAJP4BNop/ezGeE3?=
 =?us-ascii?Q?Jai4UnkvRZNyCVK5IAheMykiPJllAMPjfdptWIjUiGHwCzkCs/79b3NrIpCS?=
 =?us-ascii?Q?O+ZAQVyM8guaAQAL/xLPT59UEl65+DVgUN8fQgekkqar05NCYYd1bCvqdqLy?=
 =?us-ascii?Q?F8SS5Afx5WYfYKb0sQPwVZM8zPv4Fbi9hKkcCDfGr4N+m7f8ITj77lHVH7XZ?=
 =?us-ascii?Q?bWq0tMly1wNHA7goiv89WXgTJt2ZENTVZ5gZTcBLM/VBab78m0I0tg3AwEra?=
 =?us-ascii?Q?JS3ah+g0I9Y/3Ebj9+ukGQFWjKqYlOIbCn1jpeBCFhZ7QQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZZM8g93ZgeozT3ql8eDjw83AsSJirugtsig8Qlwp841E4XhogdkOe1vghJiR?=
 =?us-ascii?Q?03udhfESW/24FoB0DFV66aFk8VOa5/kt8yG9c6cAr4XKiMTR69V+45KK5x5o?=
 =?us-ascii?Q?MUbcEJthyfin2CB8gNgIAwfNa7G176KV9ygCgMAnXeqIcDmpWnVFAz6Gx0Qd?=
 =?us-ascii?Q?66JKSje+DLTL0L7CoqrUvfIRi+ON+PWYDdQCsEwXkhPa07YnLG0K3SlpmCcK?=
 =?us-ascii?Q?qfDoaSKCNugEvqFVXoztQ1v/2We5M20gkOAwv++nA8Ukq5339bXU/j+c3hT5?=
 =?us-ascii?Q?tREBfzzyFCTUeYOjpvuERYT6giC5Z2v35gIveJejn9rjtB/lkmASnjswFHY8?=
 =?us-ascii?Q?06ce5hqrXioC5notR9K3nOmkK4/JP9HzDMxuTJvU6TA/HYCpwKvk+HqHyt/3?=
 =?us-ascii?Q?SWjWeV3sATXFoROmw0ehjpSL4I3LduOchmaa+DV8VGheS0O80BtHzbTYT6V7?=
 =?us-ascii?Q?RljfLm0qIl6ZdGpd3Wvdh3DYlvo3lqTvVqXv3pOLghSyJy3EPpIs+brTfan4?=
 =?us-ascii?Q?xXQ8mCPHtKGpJBrn/fAkPnW/EDfvtIVWYt4K2DnC9XGP4qVS3YLXdRHRcm1p?=
 =?us-ascii?Q?bDqy9Rd097u2du7C1yNz2j3hko6QHGIEBx8KvSkm6eskxKL/D1fKPblr4yKP?=
 =?us-ascii?Q?yI8ylScGxYZs2fdJCfOHz1UvG8gZ+4+1MZhp6XJYkmDzMKGegLsHieadK6bK?=
 =?us-ascii?Q?POHR6AHxhYGjHsIutsmrbKzu5dmXhwm3W6CYRXl8Y/58vL/2lyJzVJMc8c9d?=
 =?us-ascii?Q?XySdYAVgD4jBDIXtq3GEo369Hqskhkx3I5qxth+BZqt/PQ1Bg6A5UX/jz5r+?=
 =?us-ascii?Q?5ioxtGSHNl07wFXlUvk/NKxmRmjza/bu+f/X9bj2i/SvKNzs6VuGSvuFRyH7?=
 =?us-ascii?Q?043XQVE3SXxlTCZbzAP9A6326De8bu5rcd8yL5P0r5Rq2pRm23lWsywlyjWz?=
 =?us-ascii?Q?a0PooiGagEW/YDZrGovfYOq6JhWieytlmmUSwqSDZpqMgRbTV+HBmpL9JPqR?=
 =?us-ascii?Q?cepLbfBD84PoAvs6CN98wJ/A9Fgtux89qcTM6+QGLOo2GLStPoGJ7uDeQzXw?=
 =?us-ascii?Q?co/rU57A+COdBhWBz6t/RTII/rhBpMPCHvwxFjQOvbXH6mZ0vDCx70y2wojT?=
 =?us-ascii?Q?ggEtcITrznNdHaDJRK2WNqbU9ZJoV1CZc1F8K6OIEQ4R0zAHZWfkdplwP7gp?=
 =?us-ascii?Q?+no1tn1RWjiZ1wfNMml7EWPIMV1CuRDcU34a9mZYUgzSBlHlFyYMshZRj5Wr?=
 =?us-ascii?Q?EXTHfIxLaQyf/2KyxTLSqHPsxJ6yy/B7aZOZ3XvV+ZArKHJ07YqUYMweGN48?=
 =?us-ascii?Q?mETWfsH9QSBhws+wVC8qwuCOrkKZHzcDyKERjxVJiDdEoClVgi7YvCCbyaKt?=
 =?us-ascii?Q?E3zgH+U7+I9tYFzuAwa3nODQdk6cg+hyxqOb7HIlUYYc8gs/Jh1kiTndfFZk?=
 =?us-ascii?Q?C17x21ssInhRFl1inCM8fOvSZvWDqtp2yWyaucL3lIr8PkOzJGI17CrwhawN?=
 =?us-ascii?Q?kxFWpjCV6DlOdm8LRoszmUqZKAOjnlblIwwPGaOhCrP4Pv1+V+nyLNLp7gRy?=
 =?us-ascii?Q?ev9a2gL7D25mbmapipLsAf/GJDtcCokQFgWc3z9e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lu7R6rH2/ztfg9NFmkd2Zyya64fCk+v4qn8tNYizFGtf+nMeLHSJLO5BlIlUiJI50hjwRc5qVmrDSBhDlEwXTgG9V/RsH/LUUBQazKdHz8kGKvcJMcZjVOLIqpVIdJiEEj64h0CZR0uD+yax9tjFbsrtT9SML/jt2Mq/gVgDqD9KdMs76piDVQQfp99ifr/jTVW30Dpx5lus63NOQDANZMlT34faCZa2QJS+DwxQlBUEB3UinrvWjZGUsnalHyFh4LeYxNR/ngscfAREnj3JYLvE67Mt9SGe/krJCrKlHbhanD9iq0GD0NkFvvK39sYLnpJPB/Y30qySSe0GYZWbaPCwf/7RNtzHJrJ+q2CNIcLrKgdl7llGlOxA4r7ulD2mDMrYygMqem7vtw2w0dC1FNzU1181vyB78K25nhiED2dKyHsPUCWXPwFmzyUwsUSlFMAU8snxGVKvcYJkHl+gVV6AhSQYKClm41J5k+q8L0OwBjoCIDtmZsBPmYfBWWGjEG9aGLFtNZp7h+pxcxZpgIL93Sd0G+Wv0sIL06+QdPq1+naS7eqgmM+iy42zCgJ6rcsHCdfNUM/Vr8v4I4E7NwQQOzPvSx4n9/qhgYPkvxs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a275beff-4e17-49e3-cc20-08dcac66c1fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 05:00:52.1933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zkD0A535K9lyXxidjjrER1OJPcIbmuxGk6TQ4udPte7LKK/7nQ356a9AezJV+Q2J6ZjHyrT+NzMlzk5S4rfAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7238
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_05,2024-07-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250031
X-Proofpoint-GUID: ptAkcqec2fwhZ7E-DFVxqDah-qAzaDGW
X-Proofpoint-ORIG-GUID: ptAkcqec2fwhZ7E-DFVxqDah-qAzaDGW

From: Eugene Loh <eugene.loh@oracle.com>

It is a relatively simple mistake to run dtrace not as root, but
the resulting error message is not very clear.  Specifically, it
currently reports a very specific -xlockmem=unlimited message that
is no longer a common failure.  Generate a clearer message.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 cmd/dtrace.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index 9c820686..ab5817ef 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1036,6 +1036,21 @@ main(int argc, char *argv[])
 		}
 	}
 
+	/*
+	 * Generate a helpful error message if the user forgets to run as root.
+	 *
+	 * Note that DMODE_VERS has already been handled, and DMODE_HEADER and
+	 * DMODE_LINK are okay without root.
+	 *
+	 * Insist on root for tracing, but also for DMODE_LIST and even for
+	 * DMODE_EXEC with g_exec==0, since otherwise too many probes will
+	 * simply not be recognized, likely causing puzzling behavior.
+	 */
+	if (getuid() != 0 && (g_mode == DMODE_LIST || g_mode == DMODE_EXEC)) {
+		fprintf(stderr, "%s: run as root for tracing and listing probes\n", g_pname);
+		return E_USAGE;
+	}
+
 	/*
 	 * If we're in linker mode and the data model hasn't been specified,
 	 * we try to guess the appropriate setting by examining the object
-- 
2.43.5

