Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C998182
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594580; cv=fail; b=H5sgxhddewp6/BOLIcOj8BM+qxu3ijaYuERKhb2EjIGR8R1eMG2DPbWR9MGTbQPven3tXGHzGUCqQXHASAsCoRL34a/h35n5BZ3MboMkUP8hbKGQjkyUOjiKSgBemAOp3U2M6MKNTR5nB69zgYq8lR9W+nAT7qwhNw1U0x8QZm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594580; c=relaxed/simple;
	bh=K096M8RkoH28PAzQHxqxmh7GyoE5YwuVrYD5ZUF3ZbM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=puGVj6BE4mK0dqYmFYnAHKuZijWYLMKSz4F9xI1liKQDJ28FPhOeDk5G5cF4CHefk2WAtK+wLwZcjYwXO32exeoYXZONs7iG8Tti8gPH3LUFOdoK9AGzaHS26YGkPwEr0wYirqKB/fsUhRv2OCVf6SXPDJ8IfeDatu8WbIaJzGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hjG8GZyR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZPDckFWi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hjG8GZyR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZPDckFWi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HEMbEt024565
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=uPBvy3Ry6vPgunV+Rm+8UcWMMcr0LqEfR2u0WtiqA7A=; b=
	hjG8GZyRAHrfEwdB9ys5wirrjiG4BK3b5qXWb7nR4vE7QWViHIBudW/fw9gPyBtx
	jcS6Y2jSVl0OfVGCXq22guljhueO2H+N3d4EKKF/yhAAysYDEJtKwtD0TQHkbOkR
	pZ3n8h+TkvIKPZ7FcMWlP4DNOxF6vV8fqqMk12y3rlqa5h18WDOOd5Etl5cW8w3k
	WXRo6Ynlj5TX3QaL7ZvTsa72SGQvNyCBblCpvpkrgRthu9L/hzuPnlzy3yu+Htt+
	hdh7ScqAGkmjio09jmljaagYiIUzmij3dmhhu02FUSoeg1ICqbzQlG0Vi0A8/es7
	RqVTU2dLOmUii8/U88I/kQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rwxtbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:36:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48HH2olV000625
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:36:16 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nydvfk0e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Sep 2024 17:36:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOrtj/i/GlQoDoLhjHQFRUn+M/7pd55140xBeb2Y/d2RYBPZzzHhskSH6QUlpGNs3QOaYDLpoozM3MCRve4tgbsh6Sp9XvD1Fpptl5l2rvdyCHzkvdB0s53ZeD52J+ls/Ie5npk6mPy0zH7R/rnMYW1Euqk5Mm3IJXiiYK3BC8CHhUULjFBbXgRrbLofLXWTV6wrTd6aBAC4LDUEzgaLMJ/azRUiyu0yw/lXnlzKaEiEbsSs6Uas/lECPgdRwuYF0/6CV+z99VyW550A02uNiCcqXvq/dVHmqboMmfbrit5siJ2WSU9wwZ9HJHX679PwUW6wpJW0lCIlhGIpT0Izpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPBvy3Ry6vPgunV+Rm+8UcWMMcr0LqEfR2u0WtiqA7A=;
 b=BkgPq3KY1eeEjP6mCSofGcvGP5aWCeiCpPczh2nO1LY0+6qp9c1uxk/cn5lPwGRweg9M7sSgUeEL101vpMuZFVeZi1KsCWw3/T5dBxlntt5Hc0W+gzb5z7sComThy6BppinxI4KVVryYgP7/QEP63yenMZyg/nz0BTvMWXCOAOqxLIh4VuzHx+a/L6PiF1gEXuAu2NUnDEztvQaxElyDIe0kSlyqgH7nAa/PYaXj5EkvlrYig4CNhAwq6ItkiGjWRdBoMHo1D6CIKKQmnZ1yjylb8kPGHPve0vMvcNLBTO1LRnEHWoZK4/Aq5VN0NKJpXynlMaUMNXcifyVu4ky0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPBvy3Ry6vPgunV+Rm+8UcWMMcr0LqEfR2u0WtiqA7A=;
 b=ZPDckFWiKBqJ38S/yVP/W7ZnxPf7DJ3wMi0ky0rTYUdqg0qVhu0V6rRx9489cLdDWiNCpI3+cFCWACoImks9dPjlYuKh+RexeXGqd5qxdxa7ifqlY8Dhhz1Cv3ZJ9G9+e4E77DSAoGSllEWO2cvHezOOuCIk4zrkBoKpYRuTbwQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6097.namprd10.prod.outlook.com (2603:10b6:208:3ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 17 Sep
 2024 17:36:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Tue, 17 Sep 2024
 17:36:13 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 11/19] Support USDT wildcard provider descriptions
Date: Tue, 17 Sep 2024 13:36:11 -0400
Message-Id: <20240917173611.18445-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: c92fb29b-af0b-4bef-33c0-08dcd73f39a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oVvymWk224xvQZsrIE9sCbYERa7zhq+DmDMcU8nkPQ0JSi1Sh0S5j8PTxmjT?=
 =?us-ascii?Q?i4ykBv2CyC1V4QtjtYLmWNXX78DgIdSDYIHH8j1FKOFKhZuO99M0c74oFgi4?=
 =?us-ascii?Q?XCF+nGf8kLfZWLW1ZiXSzyrhbNo9iBsix9L3jOcdV65qdRMcQJHW6CQ5+LVA?=
 =?us-ascii?Q?gJ5+NzgPSGGK1pmHXyzXbAje0GW83BE7OfEjpXT03GVdN3+ukJ9XHY7HoiCp?=
 =?us-ascii?Q?lU1+m72oe4LTuTiKldDwaZy/SAf88axIdU742oyCAXguOF5oq5UPUPM/mBx9?=
 =?us-ascii?Q?b3bIwr1tBBjIoJFMfJ4AOluCjUJcZtzwWlNzO/sJ18lOxa4TsH832AfdZ7wg?=
 =?us-ascii?Q?LdxTQKjsA/mNEzQJjEBHYWAnJ1rsSWTQC4k6WUGMkBSVBfnvcEO3d+YJwbU7?=
 =?us-ascii?Q?S5blHQeWRop0rFpzcqw5PGZU2ffElwPKgrdYEmqFQVa4Tq9xjlU7pr5bKPIP?=
 =?us-ascii?Q?/CQj8p9sIyS4+ReHkrdH20Utr7BH1GjiEacRHpVa7iupEhyqsW2gSQ/Xs1i3?=
 =?us-ascii?Q?5ImGPINi/isACaK3FvL8BOnblGkJAFZvYsgLkrSRuGAjSsoOcbUl8XkXiBK6?=
 =?us-ascii?Q?ZkSzLUb1ru2OFU6ypbE3hwnkB/V0mfx9zWjbMX/rpxWi1LXO3fNxw26+FxTp?=
 =?us-ascii?Q?iW6mtFhuVL8/2pQogaJRGVwu3kjX6v26ikJajHQejxcMIkoVSao9EA2/jSPK?=
 =?us-ascii?Q?b95Ge7tmcOJzncaH2RLEalW6WHws7FSbhdqOnDbEgynlve/X9kUZRpmcXSIb?=
 =?us-ascii?Q?O7mafLmFCVoPffNU8BsFgl+ecbYokdz34r0syfv+9LxXVVOEbjkwmJkEG0zw?=
 =?us-ascii?Q?k1GGPEwQ6PGu9VrRZQ4q4wu0bVHAZxMXa6Fzbbc0EWMxpJy1UYq15X63rbib?=
 =?us-ascii?Q?p4rp2iNsbuPbCxAJOpN9Av26ed0OMsCIf9l/ytFPzBNtfnGlTbL/IQ6SYGf8?=
 =?us-ascii?Q?2Cs3vEfd5DtV4rQ0gUOBwYkuGQM722Py1odauJYLwEDRmLA2ETy5UdgxPj7R?=
 =?us-ascii?Q?1tkcJVKmEQIbp0yqZgNxVyUw6+kJ6IukWn+dFCNextK6hHD09SUiHaV4OrhV?=
 =?us-ascii?Q?fXKa0pnJNhCpqngBWlyqYGA/L8nXbFPk0JhMViNFso2kkVgkE5jnrCtpEA6G?=
 =?us-ascii?Q?2FrhBSANjnq/qiBExW6GaJvB34doDXcGlrr+uYwdefps+UIS7HRmupDqWm0P?=
 =?us-ascii?Q?WOWOEjKbmWkxgGMk/ySVtiXox0RIIFfZxOyoJTG9Jqry9a9jrRS9aG3u1K4f?=
 =?us-ascii?Q?2taGD1xcJ/cXa2HEYK1NKsF+IYveQsML5/0Bro3kuK9jPgAWwfBrQH4WxPEf?=
 =?us-ascii?Q?DUoenIEmweAIji5HHJQfLhrgOC5JDMafwDaFMqjPMSv4yA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I4foN5ilXtAJRD2LicdBKvh0IbWCOHeotM3T6KGSpnS0VqqzxE/UjQ9wwoDW?=
 =?us-ascii?Q?9RJFVkKFgu9ER42tUYGCJtU2QTBETRzZjdEMr5D23Ms6UxSAM78kIgV4fMDf?=
 =?us-ascii?Q?a5MO1r3QCv8WlfPJaffHiAg8nZgVUkPfgkarGZ71xfl8CuJulDLXrPNRhBBo?=
 =?us-ascii?Q?fYH6kSU3p91g1knezwMXAT0B2dxJ4VO4Iw6DdoikZiSXSU0SFkSBZHFElJk1?=
 =?us-ascii?Q?LGbW48sAeZS9ufiAK16UCB9vcsXukadJhWfblJsB9d495vnMe9HT4bZKDRQZ?=
 =?us-ascii?Q?CJZBer80rMpLBAnSeUwweRcPTc9+5j0Yn0D32fUwnHUT6d6Nt1gMEaaGt0jt?=
 =?us-ascii?Q?/tO9FZF+Pm3973h8MmzakbJLbffPUlzh/JGnVe1VecJCzNbusIpZ6tvfazzp?=
 =?us-ascii?Q?cGZ8fH+jUYmemTvTxTUFFU+GDNx6B0JZUWPqOlcndK0ezmIoJHr9M/PRnEU2?=
 =?us-ascii?Q?/L4f4JEg2uPeJsOsIxFdabdbzxx11s+gjPmTTv4mCyRHiMrJRwWhHAcC0WMa?=
 =?us-ascii?Q?bGzcpx/tuYWqYW9cKckSF4Fx5dchOL+olK3E1h9maKrUYEfylRVcm7nBKSlE?=
 =?us-ascii?Q?1nQAQiQUOV2fQl0LAjYdq+DpWMLM8sm+kL+0YFFha+7+4W272UF5MeQgciNk?=
 =?us-ascii?Q?Fck9B/p9xeQXlZ10F9Rogi++qnwxliPkiX7IkJX71jFtkz3jMmC7SxkvB0qG?=
 =?us-ascii?Q?pBugDAB4wBTLLztuHH4j/W8dqOJ4ebjwYOL1wlBsTdpQETAd9nJLPPMcU38S?=
 =?us-ascii?Q?gyelXm2KCeWf8jnK4CFl3wUzf/MjWNSeudt4ejFvAzFXnmTOTdU7wFYI+BiH?=
 =?us-ascii?Q?keXgqu4IcRLr8TzhKGQvFBB0VNffAKbNc4ZHnqJf+Q9CEe6tDyJxi0IA8Nvb?=
 =?us-ascii?Q?nAL9Qh0MaLuOoZ9p5dja82LC3qkqXxXcaQQTFHP5aQdEDyACxP1+keVuL5oK?=
 =?us-ascii?Q?O5sdWKBIgMhDFEOjGpnlNKlYzB5/02AveRlcTdDWFq5nhgW97UiAAZjKODJV?=
 =?us-ascii?Q?6iw+8vrY6xZomXe7X9XujM3s8Wb/FzeWlHDzjBjdlgvrke2WMLnOAzwRatJM?=
 =?us-ascii?Q?Ikzt3TfuXefNQiq80vGS6QJX0xlJGGXuBcyAvxSLZPkLu2JdvWq/HRpSQ/dq?=
 =?us-ascii?Q?tRExMxHe8wjArHTbbnccFsHyPE3zPtBWO3WEgMC++2+YYVBG8+3bRcKoiE4y?=
 =?us-ascii?Q?WldtqWT30iaFZ/shEWxQRNq03AIeAZKqP08yphMyoEFpEiH3Ga5GYuNcKqCQ?=
 =?us-ascii?Q?YNeL90w2qcG4EMCCUHsqaa20wE/4ii4PPiUFf1AhnBW6NIOHjsJh+nel4EA0?=
 =?us-ascii?Q?j7wvwY6lsbyfy4O11ZnwGF2gB7lcnMHHgQqnWsszCE4kiviFw8yvpvEQiqCv?=
 =?us-ascii?Q?ko430hSTDNzHbNnw8Z+mIpIJI/wQOxSQpwS1f+Oh1DC0brwVSglr45DIPOpR?=
 =?us-ascii?Q?y3Z1Ut8z+0GnOHxXH+GXottAUiAgdiTVkPoykIlSo9u2mOKLzCyrCnM1/Utf?=
 =?us-ascii?Q?PIuubcoIDMk3qZ9dz/y6Wht65kty8Vg8hSPqG5/Z73tYWh2i/pmlwet16GGb?=
 =?us-ascii?Q?WKg0k3ysXPiykagmXToBCrOKqsmvpg3xStNMLXrM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n3/maCy9J2tLWX5BMT0tbBdbZyxzLbQdRuznCva8N5SuwL8egsYyWP7WPrrwgkDzDvwxnn9lq0cYkbFE4rTAgaPnpsnj8lNYEP4J3hgga4MabnWsc8FIJQRjrsn5+zYFBGyck/fGl2hS8qYzdoBAfcC5C23lZgFZe5JRni0JuQ0NsKH902iw4CuShd8i7NwO5VjLCjgJkLzzDIoqW0Jbu4dxiMiUcLPwrOTC2P2Ul4BowNHLA9L35AYmQR1awFxOPvOjknkXsl2BDqxhMkXSdAOWVMfH5sd49gea3FQVU/dFqTkmH7DmZkkGQJO0nd5g7+EtMDU+YIAIvmBBuNmea48f7xNINxkIop+uRFVuRw/6uI1odHakzGUHs8KXiYSy7YWh3+BhXz29xgluL5jayFReraLL0DZGKvw/etMZquWGXw2fu4LCtlVSlSSQyO7LW3up46CbAi840N4sHX9zGnTj8qXj8eZ4NcvFLLiCzHjBjjVEHWbaq+Q/G87i+a1Yim9dun4da9ILhECukNTJ8SfCyiMsUk1SIA8+Sf3fnbaTr8T4w2chKioMmABh5DwzzSxYyYTTnZuLW/KMFfXWYVcBgXcX5j9+MYK8NIX9O0w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92fb29b-af0b-4bef-33c0-08dcd73f39a9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 17:36:13.1444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhHA0KVXneHGclV0dLDNYWjD2WXTT7yU6yKKUIhUHf7PDJTGPa5jvbjyj0DdMhLDHpQqrkJAo4dsqIJ9iPkDNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_08,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409170124
X-Proofpoint-GUID: qmIFqPb2WoG2WTM4TnrLbPS5DyOI1YB0
X-Proofpoint-ORIG-GUID: qmIFqPb2WoG2WTM4TnrLbPS5DyOI1YB0

From: Eugene Loh <eugene.loh@oracle.com>

To look for pid probes, whose pid values must be specified explicitly,
we can require that the provider description should end in a digit.

For USDT probes, however, there can be wildcard descriptions.  This
includes a blank provider description as well as a description that
ends in an '*'.

So, in dt_setcontext(), expand the criteria appropriately.  And
modify dt_pid_create_probes() accordingly.

This is rudimentary support.  We still need to:
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify
- deal with FIXMEs

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                             |  5 +-
 libdtrace/dt_pid.c                            | 76 +++++++++++++++----
 .../dtrace-util/tst.ListProbesFuncUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesModuleUSDT.sh   |  1 -
 .../dtrace-util/tst.ListProbesNameUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh |  1 -
 test/unittest/usdt/tst.forker.sh              |  1 -
 7 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 85352f46a..9884b28c2 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -270,8 +270,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * On an error, dt_pid_create_probes() will set the error message
 	 * and tag -- we just have to longjmp() out of here.
 	 */
-	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	if (pdp->prv &&
+	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb, 0) != 0) {
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 3f3453aff..356e02a45 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -605,6 +605,9 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	return pmp;
 }
 
+/*
+ * Create pid probes for the specified process.
+ */
 static int
 dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 			 dt_pcb_t *pcb, dt_proc_t *dpr)
@@ -702,6 +705,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 
 	return ret;
 }
+
 /*
  * Read a file into a buffer and return it.
  */
@@ -780,8 +784,8 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
@@ -795,9 +799,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1100,16 +1101,27 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	pid_t pid;
-	int err = 0;
+	int err = 0, i, nmatches = 0;
+	glob_t globbuf;
+	char *globpat = NULL;
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
 
-	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
-
-	if ((usdt_only == 0) && gmatch(provname, pdp->prv) != 0) {
+	/*
+	 * Is this a pid$pid probe?
+	 */
+	provname[0] = '\0';
+	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) > 0 &&
+	    snprintf(provname, sizeof(provname), "pid%d", (int)pid) > 0 &&
+	    (usdt_only == 0) &&
+	    gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
@@ -1119,14 +1131,45 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
+		// FIXME How should err be handled?
+		/*
+		 * Nick writes (also, see USDT case below):
+		 * Well, if you get an error, probe creation failed. I guess we do what
+		 * DTrace normally does in that case: log an error about it and keep going
+		 * as long as any probes at all are left...
+ 		 */
 		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
 		dt_proc_release_unlock(dtp, pid);
 	}
 
 	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
+	 * If it's strictly a pid provider, we're done.
+	 */
+	if (pid > 0 && strcmp(provname, pdp->prv) == 0)
+		return err ? -1 : 0;
+
+	/*
+	 * Look for USDT probes.
 	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	asprintf(&globpat, "%s/probes/*/%s", dtp->dt_dofstash_path, pdp->prv[0] ? pdp->prv : "*");
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		char *s = globbuf.gl_pathv[i]
+			  + strlen(dtp->dt_dofstash_path)
+			  + strlen("/probes/");
+		dtrace_probedesc_t pdptmp;
+
+		pdptmp.prv = strchr(s, '/') + 1;
+		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
+		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
+		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
+
+		pid = atoll(s);
+
+		// Check, since dtprobed takes a while to clean up dead processes.
+		if (!Pexists(pid))
+			continue;
+
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1137,17 +1180,18 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		// FIXME: How should err be handled?
+		err = dt_pid_create_usdt_probes(dtp, dpr, &pdptmp, pcb);
 
 		/*
 		 * Put the module name in its canonical form.
 		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	free(globpat);
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index bd0552dca..99ae995eb 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index 7b9c6a5fc..5ae087fbf 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index f9b1d8bf8..5c0509d89 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac2..6eae82ed9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 7cfa9eb5f..92513eb5d 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -7,7 +7,6 @@
 #
 #
 # @@timeout: 120
-# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

