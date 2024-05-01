Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DED7C082
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567769; cv=fail; b=UENUzBtW73C/FN4tECxIT9GDXwtfe+bX1u2sORqD2kWcTwuNjQWell8nVwWs18m7oRXjEwEO9hEuWkLlbDJQ94KT63fSxGJ2aOFFe/I+aRJhWBb31JxaMiBCuKSjFTzIET52Td3+DM2g7Z+gl6om9/kRyajhOA1dsjnW4qYdbXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567769; c=relaxed/simple;
	bh=uZmoln3RfG+Opy5rcpcuV2Gxm9/DD6F9erdyTuphvcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BEU3YrsnOBRLSlnsC5apTFL7RWra1Xv7HkMws8h5NYQ5lFpTcWN54G+SS3d8DfYLJES66/SsLcLr0AXtGTjkuZa9aTpA+Dhns3b+61bKf+vRP2XsD58N5NmODqjYfT088f3a5bVF9WS8gXYcWZs+FkZwvH0tjQCVlfA6B/gyx9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nSzvYSfX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zZwpO8tg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nSzvYSfX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zZwpO8tg"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441ASNpw000832
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=bBWsgeydGj3ukPUztUmIUKwqwEZ1evP3112T0pPffFk=;
 b=nSzvYSfXlZmMii0Tl/DS+On/FHXOzEMYlUt1X3Uk26i87aa0SiBwQ57Dgk+4c3FwncDt
 1q54idbRxMP+99JIRY9ay3yAHGF3LRgzJE9WkMZMRo3+f0N3IVEwX3WoV7zkC3uIBnXk
 xRlT2peg8oz3R49MDM6SpyWeCbO9sy+IxRhzkiQ3a4rDnuQbjt0fy0AzezhwpO1w34AZ
 4Tw7dP3PK/U/a2JGiOc69/0rq1fAT1wtQ/q2O3zZ5+MTDDQ1bHTxE3lX1Pm2Ykyvholq
 MGhnBd7/Fb86TxkLRfNnlitIbMVEWh6x9nJbJWPW4QVJ6M1Ton+moB+hSBI5W+75ULjK zg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrqsey20m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 12:49:25 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441C3lJw005250
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 12:49:24 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt8s4jp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 12:49:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFGmEAhbKtOTYdkXJoeKlvvMZCOMDY9NhOfXJy/Jdv2kMul3sdw6Sf8t7YoxW7nF2KRtfIqqO2NMz6RqKQ/G0yGHsKx0YZdBfAJh/ptkh3Pkfwg0udDY62co3Oy6vxOWjaDV21iIgsK9Xu7/JXfhPq/6RwTFJVcCD8/4Mdk8s9CvEp08fO8HWmy3knnLz9j8YOFkF6UAAp0LoYPrRx5jyr5hxBM5OmpmoQSBvK4hqD6tUei/t5EH+4eyWfsREED4GzbU79rd6ODVCE4CumQqhSEXDi8mbHfgDrs7sdi8dG4fzLKVnIlPVsnnW+wL33tDkJi62tfUAoWiXCewIw1MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBWsgeydGj3ukPUztUmIUKwqwEZ1evP3112T0pPffFk=;
 b=mvkN/k0RlQmiakqRA3l3HnuHzbZoId1LtsoeMtHnNYHipH9qnzsB2RqVcGqj52cir9hqu5Mx9qeIk8RwcYlTNcd2KSTBvmtLvn96brgBLVh1Ha+x/yMuvRi7RzZAp1Y8+b61OV9+lEpUmImY46PA7vDYF1+vz/V1+gGiCB6vg3e4uVP7VoqphhZcK2uicqgF9ZorynCpm7qHjMcszm21o3HomM1EgiV2tUl02/muw2RjZBYOPbojleK+bPUmG03/G6jT38IOWSJIVh5y9Jwp2u8Ii7uBvgGXhbIYDaim0ZTmzhLtE7wjZugFsJ5U8Dn2JvY5DZ+Efg7KYd19Sn/uRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBWsgeydGj3ukPUztUmIUKwqwEZ1evP3112T0pPffFk=;
 b=zZwpO8tgx/9EocG6jvOezOTMK0PPQIkpHZ8BoIfWBpNy5asQ13vcducMMR8Tc1ZR9KqIK9wmtQF/o8J6hvtHm13nhp2T/m4P+Yzp7dUiV3JukaDDsiXHYSMjzrpsbwn7mktfmTepfyGswYK0dD8rEDW0bHqSWZ4rTt2lZeP9kaQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7794.namprd10.prod.outlook.com (2603:10b6:408:1b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Wed, 1 May
 2024 12:49:21 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 12:49:21 +0000
Date: Wed, 1 May 2024 08:49:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: use better condidate probe
Message-ID: <ZjI6TnrDwFiA5GWA@oracle.com>
References: <SN7PR10MB628768B5383620FC60775A35C2192@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR10MB628768B5383620FC60775A35C2192@SN7PR10MB6287.namprd10.prod.outlook.com>
X-ClientProxiedBy: BL0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:2d::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e8020e-9904-4c92-306a-08dc69dd1f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YaAsMQ30L2aeqnHq3P+1boYUuvPATDsxuo00ZvA68A7yylKNPlRC66QjD3ka?=
 =?us-ascii?Q?dN05b4Dp87OiN1KSbQSYCvByn9B8oC/JZgwe5iT+sYWA0RnRzRZ4T+RMpbxI?=
 =?us-ascii?Q?InxQcbeuNAo9aigeZL5LT3RecYHaGexxd6Xmqb5qPKLlBhvfb+35aWpFNXr1?=
 =?us-ascii?Q?AEF4/Fe0voSqr5eh5tJV2eWk8YSc08JoGu6VI9A+WoE3n3prM4jyEwjcZviv?=
 =?us-ascii?Q?Kj1DmXQwXwDVv6aHHlESKHL/JFcSbplRAc/2tj+QlHSVX7ixJdAlr1PbKHKt?=
 =?us-ascii?Q?d08Nd79Z7Ay50YBKo78FoWDimX/1j/i3YR/vhC6DBv+bJWnxqhK/XEuf5hon?=
 =?us-ascii?Q?01J/jNbPxhTO54ZqEUBE9iLo38ngfCVTQMWqiD0PO1xTOKqYbvq5ZNdXnDq8?=
 =?us-ascii?Q?AZE+eNmEhcOYAjEZOa1hkdHMXSFbCQ1/toKPR7tUAva/ztYDPYw1FQXpzXBt?=
 =?us-ascii?Q?7ajMOZ8BsYni21xzL2+E2nyImdL8MFecRat+Qz45hPe5DVAwfNWoPEKAIna7?=
 =?us-ascii?Q?QcXNdRdEUFgNInDikkE9tUguWwd4j/qNqD6kMf+/7KuGproesaaCh8erCXTa?=
 =?us-ascii?Q?Wu0Rdn8bptIQ9s6As8bXpO0Pl0u6uTxEtbA4hMTCC0vzQjMDx9caLfHMJLqd?=
 =?us-ascii?Q?vz9Bp/Z/iSzrlB/cGOe6/+ifLH39wXlluD7qk1iX82jeAdVLqkCtrJpG/Xp9?=
 =?us-ascii?Q?xhUesxeYf3rTIY4VLN9JABNkU7eDj/JF/C92jVijj9x1WkAul6cbpjPwAUsV?=
 =?us-ascii?Q?s+C/SsjdWM+IBlnkqexuTTcUOg2fmlC5TuCEw6QGAXRvhOFAMQvcf9d8mpdR?=
 =?us-ascii?Q?Rp0E3FLP49efjvR+ilzF6fB99tZ8biq09OjWw86JDxX+lt5gnlsxMP8oBbxq?=
 =?us-ascii?Q?i0mSSqcpMSEzfX9waDBE6s3gRAlxB7prlw1MQ9JignuMp+EstxOjQJYKeJDM?=
 =?us-ascii?Q?rc1emXhnhhjFMWk8+6s9HiFRpTrP4T5mUgLDrXE00TSmFe73qI6JxLklImdk?=
 =?us-ascii?Q?BlWpbWVJiw8DV/2ejYU+6b6KLmPpJR/W1pvbb/aIb4N6UeWAnWhhYXhFrNwp?=
 =?us-ascii?Q?FCCvbaIkihO/r0/2LP8zy/D153Ld7tctGtgzjFY5RFu2Z/K0fAY66hWzQyC4?=
 =?us-ascii?Q?H4x6ZguWxCY1L/VlA/bmjX3Wd9ct9hEeQTVtmlbxMSxWESw3L2udg60YX2hh?=
 =?us-ascii?Q?0bJ3B3NQaSPtu5F7qCyhT53CvGtbY8KyWJOErRJacof/Jmh0zUEdR8qejD8I?=
 =?us-ascii?Q?MqL9dCSj59+wnBPC2iE4Y03mWfhaLya1HZ7bx2WUzw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rfokooM5C69545ZwdOtsvr8PJlshXSpHXolYa21Ganr7vnisifqz6pvaFAfR?=
 =?us-ascii?Q?C6GCOCGZab7H2dsIpCKZ5QFoQgu4w4Y0KDITmRCj4u5LJZv0PPv6hGYF6qIO?=
 =?us-ascii?Q?DZ6qslv5OsHuY3BSN09m/GexKO6h3DX8RM1678pithDcyVP8hOQMyguBd0SZ?=
 =?us-ascii?Q?985q4o0yeSs8qU4liMkWG0rLF4AHas8S7O9nFFRfMLwzVLYqIyfvU0ZKVUIX?=
 =?us-ascii?Q?W85LU5z5k9Jg2fuxFLzTMgcDFQF8Rm1DNILLNktaVf4j1+cwS/8nc4pI2HEk?=
 =?us-ascii?Q?Fes+On1s9HChVZxu6wlwYbVTkENFO2puRGVZ4VSvjFuUlcE80PkFGdwpJF4+?=
 =?us-ascii?Q?gE5gTz3mQHWWIBBVRBChMAWBxSoiylhmBtqzHS2GPZIAoMFBuYIKwPA96d66?=
 =?us-ascii?Q?tQ6TifZqBFu4GthON6gGhWRZ80XeY4fpJnwdmW3AKPH1Ck7N89TzlyRxiW7T?=
 =?us-ascii?Q?lFkWeyuPR7ly+SboAWUzWvVa/kfU+AMRQxpzgvTsqacuNXVCmYkMmbLP3MZb?=
 =?us-ascii?Q?H275lMz7GLRnHCGCWcPpi2HknUFhBkD2BVLlqk8Y9C6TgBgPQvFf+r1UQzlW?=
 =?us-ascii?Q?2zUejc56cvRf2snOIZJ9VTFEMlARyGMJqtO+anGTY7SgmdA+9gd8N3RuM55Z?=
 =?us-ascii?Q?hsF1e4TMvuGHD1i16E9Gt75JuSlTmzDpApotoU1H4+D5afkEv2wgIhAkEJ3W?=
 =?us-ascii?Q?bitWV5VtvdIwfs87KZy9vnVSVDy9D1EVa3YX7acPSufTh659fKAliajhZbAx?=
 =?us-ascii?Q?sJqIE87wbIDYL2E9yQhvRCAvaoxL06peSM2SZqk/Rm+JmzMU0CACSGZtfibh?=
 =?us-ascii?Q?YOf7YRif36v8t60SQndBcjMHDgyaNkYEArjCkCaeTdly1eUFPJrah3cLqucD?=
 =?us-ascii?Q?l5EudrhjXTED7xx+A4Q+8r+BQd+C6vFd9boQhj2ChVmpHgHfJIcDNrI1j+Xm?=
 =?us-ascii?Q?EwTSX5cc/lqREKzyN3v8kQCXJJcj/DeWJL3W7OWF/qzm9huFaGlHx2ArLkiL?=
 =?us-ascii?Q?jOOMcV8i2UBC1MgK3RjEhmmXflzn77tvpbkTaR81Lttc9jMJQ/N59R17uBO8?=
 =?us-ascii?Q?Nxf0YB85yBxrSDHhxoQZGSqqgAoYtc8KzAeBHVdq0jK583GkCGf6E0Vu0rlJ?=
 =?us-ascii?Q?QKmaSjx8aUTyrycutw0P6N6KiBvftdHiBCN27BKPaGWb0fUX6ndtLMlqJkU/?=
 =?us-ascii?Q?9fM6tRFgPfGDiew2iw7YxlKQEZEIJJammEKz9Nf8c+es0kbmx+2WiPw/o833?=
 =?us-ascii?Q?x9Z8pmRA/qpsla4+4SIo7OMZnP/dpSsiXBHENkzESC2/SWo3J7maVHkp3isE?=
 =?us-ascii?Q?aPjjkICu14fW9Hnip6FpNyvhk8uKvUBiA9zNC+dU/HADELimb+FXem/9erOT?=
 =?us-ascii?Q?iMQpu8t4EDfj2+YzuqnnQdCTORmThbJphoxU1hOa6g9y+hzGPDL8ntjxSAU/?=
 =?us-ascii?Q?mZH6PDe+DKu14ngqWJqbNnpqyyTtJijSdBLGn3Gi2ITUYNygbxqSaCm4d7ra?=
 =?us-ascii?Q?apyLeOHCEwSZwphgK3SvmoKSM/tGlo1I3lEHKialk4TbNlWnKsSxGqN7w8s7?=
 =?us-ascii?Q?JzRcyYDXsOyeGsmxzqyXf6cnq/lR+KoWLQ+bDQhSNxbDjH5UUS+BkfuVusFd?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	g3r05VLoEDiXeGadNjAW/xwFJ/rNHBz/k9M/hM2AXgdrDNMyDXcewNRlrSq15fcAjp3iWgAHFC/sZ4WbXTWO2VqCYkGmjnfWeFVknLruHXP7xY59FFRHRze+rDR6bOHhHjtHKL3O75M47Q7xQRWph5xi/cdYgsPtF+ufSjFv6lPptIvIaGMhvP0nDPW/IxY3DTV9+P2aTtFXThiHI0VoFqvnh5/hh4J3OhznqPqudvG395FpFPgEBGWrd1l7UX2N5JTxu8QOKht2fuFQuwG4tKCZ0rm7wp786GrPguwr1IxXdb1VG/vZ4FKFt2b9vSM4gq+49xm3fJkcITGDQlsB3cP/5MaPAtHgQpz3Q/lFiGYbpbFIFjrpdImtkwrq2CGTp7TZI4jancWOA+RXXSXzJdOjAnStdvIdWDzAK+iQkZIOlc8pxCg6vsodeqcYan1NFfNGJkuVflDggC6dAb7aoyZ4N053XbuAYQSc37bu8bhgwQBblzQ1kYZSkD0cpdkfaNrviqA0q5MST7w2Pt2ojDj77lfYeNFVoi3sGRXtyVF/R3cIs/CDgEYAysWRSZJPw0BzB+qtjsO4MIVgRJcEuuvyuEZf2mlecgEUIGU7iMY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e8020e-9904-4c92-306a-08dc69dd1f20
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 12:49:21.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkwKkrB9p7J+8dQAwmpKS6vPcZnEOdkR/Bp3Qe71pWn6ls2R5gxbE8FKo//8/gHUrsGbjsbyB3yJKILu/irhfH4zsA3KPsEgEXzJChnnqEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7794
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405010090
X-Proofpoint-ORIG-GUID: yMozjLRYMrZeErUhhU86UFA9xr0JbPcN
X-Proofpoint-GUID: yMozjLRYMrZeErUhhU86UFA9xr0JbPcN

Withdrawing this for now - there is something else fishy going on with stacks,
that is not resolved by this change.

On Wed, May 01, 2024 at 01:06:49AM -0400, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  test/unittest/aggs/tst.stack.d    | 17 ++++++++---------
>  test/unittest/stack/tst.stack.d   |  2 +-
>  test/unittest/stack/tst.stack.r.p | 12 ++++++------
>  3 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/test/unittest/aggs/tst.stack.d b/test/unittest/aggs/tst.stack.d
> index 6c3c530e..c270f5ac 100644
> --- a/test/unittest/aggs/tst.stack.d
> +++ b/test/unittest/aggs/tst.stack.d
> @@ -1,19 +1,18 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@trigger: periodic_output */
>  /* @@nosort */
>  
>  #pragma D option quiet
>  
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { func(caller); printf("\n"); }
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ {  mod(caller); printf("\n"); }
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ {  sym(caller); printf("\n"); }
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { stack(5); }
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(  34); }
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(1200); }
> -fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { exit(0); }
> +fbt:vmlinux:schedule:entry { func(caller); printf("\n"); }
> +fbt:vmlinux:schedule:entry {  mod(caller); printf("\n"); }
> +fbt:vmlinux:schedule:entry {  sym(caller); printf("\n"); }
> +fbt:vmlinux:schedule:entry { stack(5); }
> +fbt:vmlinux:schedule:entry { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(  34); }
> +fbt:vmlinux:schedule:entry { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(1200); }
> +fbt:vmlinux:schedule:entry { exit(0); }
> diff --git a/test/unittest/stack/tst.stack.d b/test/unittest/stack/tst.stack.d
> index 05c2644b..10ee1270 100644
> --- a/test/unittest/stack/tst.stack.d
> +++ b/test/unittest/stack/tst.stack.d
> @@ -18,7 +18,7 @@ BEGIN
>  	system("echo write something > /dev/null");
>  }
>  
> -fbt::ksys_write:entry
> +fbt::schedule:entry
>  {
>  	stack(1);
>  	stack(2);
> diff --git a/test/unittest/stack/tst.stack.r.p b/test/unittest/stack/tst.stack.r.p
> index 895f96f5..5ce889ac 100755
> --- a/test/unittest/stack/tst.stack.r.p
> +++ b/test/unittest/stack/tst.stack.r.p
> @@ -1,17 +1,17 @@
>  #!/usr/bin/gawk -f
>  
> -/ksys_write/ {
> +/schedule/ {
>      # check probe
> -    if ( $1 != "ksys_write:entry" ) {
> -        print "ERROR: expected fun:prb = ksys_write:entry";
> +    if ( $1 != "schedule:entry" ) {
> +        print "ERROR: expected fun:prb = schedule:entry";
>          exit 1;
>      }
>  
>      # check stack(1)
>      getline;
> -    if (index($1, "`ksys_write+0x") == 0 &&
> -        match($1, "`ksys_write$") == 0) {
> -        print "ERROR: expected leaf frame to be ksys_write";
> +    if (index($1, "`schedule+0x") == 0 &&
> +        match($1, "`schedule$") == 0) {
> +        print "ERROR: expected leaf frame to be schedule";
>          exit 1;
>      }
>      FRAME1 = $1;
> -- 
> 2.39.3
> 
