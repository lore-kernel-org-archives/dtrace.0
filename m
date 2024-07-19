Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58E22066
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721361758; cv=fail; b=ewtCVvJcF2uo7lxVw2vWChS+MunEEwCzyZoN9Nvhj2qI24MW97ntM7cBKgu8ZmIZiNku3XjZh5VJBl43SEoQGKGgIiJkBaIk8g8C5gWK/70X8HTEaUD715vPx7Yl3p/GewCamWDYGlu2eHEG4O0aCfvvH9w5YsRmwmL4O8TzUGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721361758; c=relaxed/simple;
	bh=94EFKrn5OSwgdKRDlcSDVO8yEJod0mEtDbFlQAbqWwU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ElsJQP7KX/FyeYPBYQS1pE5QYx8f+B6Eq0TNHf4FuSMW9AyUshUPnFm5tnVaRtkxVy2P54SIuMqM3A9M4ec53s3LOWr5ig6Wxdpk7UBDq5uqp9hIXMcZr1uQLyqUKV4It61isF68ItYNEdtEdEEymPZiKNTQpDmp00ChuANuicY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ow8UtIkj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k1zSIRji; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ow8UtIkj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k1zSIRji"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J3jsc2015690
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=q5qOorqCTLVBD25vdBZjAomiVhUo9zgjow1Uza4wju8=; b=
	ow8UtIkjuXEuPGjMJfIXVQOENWcdjO4Cj3RaxIm2/ClBUipnDLKtDIU9e8anrzrq
	AtfSB3aL+0v0bjTnXygdIP4RTsHtb2htImUGzmSMrauJxkA/Nc0NVrle/SdimOes
	5nw51kEWivvs1IfALZ4U5zqe/zW2orVNnUTDBPeqZqWoaRbGtX43et2+gufB2Xjf
	wmXtN++NyK0gjAhKJLQYSgJ2oV1/tf/aAX4uI2Xqdk5vByQp0bImSOx6xM4qLP29
	XXei0iT00/keHbPzNAiuujBCZgrKuaas1pfSNc3tKLv+tZdatx+/hNk7ZZzknL4f
	7JgKYlLj4NbB/xIZvxC+4Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fggwr0q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:02:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46J3ZWmi006959
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:02:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0rcg8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2aXiqIxAwWxDnOfwHze1qfHgq4hOhvcuI5XWCyoHcI5rrhdxkJIDFUUzmIqQhQxR9Hd452JoWR6HgrgwuVzTrgjEq9maMP8qum488P3LipnWDrE+vsuPf3U3pqeJld3p7yPzy5OFj2iB0t7AhwWH6WD+FzWyaZdBIgsj0Iw+mMsj1Eq31ZqpuM2lfozCREXEF6nxaGGipBx29Ijovorga8rUsqNI1NwkyMEo1PlYaiM7Vp/fZGLJoVmL6T1PeMHbmYaay5GLTL25sV4J6HdbnJeXukZ17KqVFnDSPHwwxDDP32hY0eRmLiPTy5qrsFxSGBN/t5b21FuH2bWlcNGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5qOorqCTLVBD25vdBZjAomiVhUo9zgjow1Uza4wju8=;
 b=CqNPhs+smjiSVv/sMdJJyCL874JeupQ44X3SPmGCDFvGhRZz64d0poblHgutSf/db5dXT2hd32cr95RkUfbXAd1xrXEYH1/sWEMG7BJRlpVpyy70wloh3VEc86lQwEgzn6a+mME2xlEeY7Udvujfm/Hp6Fys+q9s0OmrOZIhGuQf3//Q4xxg7Wk8SkJ98SMn0XNTsnorgnex0vV/TmGfXvgTghPDi9/Fg/rOOnJWkIfCnmkyztMH22O9tZiFgfdSyEJOpWOyfChTUYX6sA62a+5SyGgYrpBiwlatyBiw2DBany+TtEHMkMgw1MVjKG9XuBHH07Cw2P/8ME96gVuRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5qOorqCTLVBD25vdBZjAomiVhUo9zgjow1Uza4wju8=;
 b=k1zSIRji3S6TFubFVyNmReJ/d/DWi9dsXUyn8Dp4CNp/byj6z77OSel9BubyMGeJqFBnVqDt6gLB43RmNqs06WwFPXe7MzcrgeaRaU8MWp4wrnknhZ1/Ylar0dX7SDfRcOIy7Uqt7q+wC5kE267ScuQ6nksJRD7osZeQcZv/XEs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6158.namprd10.prod.outlook.com (2603:10b6:8:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 04:02:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 04:02:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 16/38] Add provider-specific probe_add_clause() for USDT tracing
Date: Fri, 19 Jul 2024 00:02:29 -0400
Message-Id: <20240719040229.3630-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ffdbdd-8de9-4681-79fd-08dca7a79d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y+aDP8wK79gjnbxrFdTXUGRa2s761f5hk0I5OekDSVPxinAXY51HHaJR+AXF?=
 =?us-ascii?Q?zUzqgcOEEGpDVAyB90i0klzAw9Aa+Z/OaF3kZS8ybCldGozAUQ4P5xowURKV?=
 =?us-ascii?Q?fdjk4ybP0xXhlyn7kZefaA2ok2VVChqsSPF6oHi9aR0pKZztDRyo+T6IxPaF?=
 =?us-ascii?Q?Aj7spzeI9BLuC2EJgsUp0NpZXuVODVIThf3G+Lw8pRye1gSrHiNKWgs+tlin?=
 =?us-ascii?Q?Rdyr1YhFSWiSJSt9/9NoW4x+uqRkwqQ0xehGMCdmdWkAb4/P1qjZ2Z5dqwZf?=
 =?us-ascii?Q?DiyMm80nSn6Lp6Q5SdvPNxwSYvLvtcpmj6whmWQEHPmZXrOvbSE6K50z5Puu?=
 =?us-ascii?Q?qtSplsd1J5/H62xWQOPlJKwb5gbAXshB4S4Ie1rpxXFJIUh2KsCT/wP0x510?=
 =?us-ascii?Q?SYCfj4d8qWxC0hJHsDuJ6Of6j5i+3cZT+dRz8ZIzpl+EN6DBgcOkfWHf3msb?=
 =?us-ascii?Q?gzfYxjzdOqUkE0Sz+fQdVOD4vnrFEIlNegyd1cjED8/utlajPFckfWiW9Xa7?=
 =?us-ascii?Q?tjzDvqWut6sEfJiasFOAfD0SWoTkgfe+pFFxJLT4pZSs5C4iNwvQcgPL247M?=
 =?us-ascii?Q?w9/c6kivVdPDi4omFEZNDXwE69CfVCVNTkrZLWzhg4sjQ+sMfKVXtLOTBdZP?=
 =?us-ascii?Q?CXCSpz5z8WCoBqC5T6WjXPa+ll/VyxRjnH+RehPqTTbHt7GeRB8w/6/65MnN?=
 =?us-ascii?Q?8SzKl5QoobUTprLFKngWuWSrAqWbB2sbakakoH5xxnT2HeKra6sDiw1ZKNPl?=
 =?us-ascii?Q?sQxvLNKMwj851F4SUxJ35d5cOS7UmzDL3G0WYoJiBNKYZY3SQSwhGrVO7erb?=
 =?us-ascii?Q?RBqifZx1exEzD7BBtznTEtsS1b6a7W6mB01/U8DmWBCH9mikgAr/0Cn7MwEZ?=
 =?us-ascii?Q?+a0arcR2ykkP2cz8KASynNCyvkVmppMkElb+H18Ghk3wuvNxN3n5kisv//FV?=
 =?us-ascii?Q?RCGqkKpioPe66dADODnlI/DWCIGpDeUJcQ33iyKolxfJ4Avzu6BnJmp3C9Rg?=
 =?us-ascii?Q?A5lSzf6hDAL7DqX+jUK7ytfqepHbLt84TkxAOCX5x+LrAcH6+Rh/NewYXs6e?=
 =?us-ascii?Q?IDL7FJkp60nOp/vDTW1lenCgb41gkNV64RiYQ4xd+l82KAirzfM6l2hEWRDY?=
 =?us-ascii?Q?iqvvjJ5259OmPeyoU5JLjngsME1JlW9Q0YQtcvKg4RC3p8aGeHTaItqgHD7k?=
 =?us-ascii?Q?lIfd3NJ5C3sSoyhkdB//tb8mY4ahvfnMRIHzl98V2PG8V7c41GglJuWgUq8Y?=
 =?us-ascii?Q?VG7jckUDwvRFWBkGSJeYDGsA18wcF27jIzmv4VIo/nxXRN0k7mS2YnqoXPrO?=
 =?us-ascii?Q?yqbW3dN3FYZjU5v0I2mOb8sNd91EgLhOScHxBNhiQQxafQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MlQKVMHV/AWtaOETPmu2r5Js7vOFqwckbq+O9/bnD575tCFvuL12+kRyRO/X?=
 =?us-ascii?Q?MWME3FCh7UijR9ZcruY8BQnLdssBfqkVvkCGuZGzgpsp3n5VuyKJpDv4klZt?=
 =?us-ascii?Q?EkA6vovuAeh/6RHIsBqHLRbcHS8/7rJbaiVcj5b8/hqkHYXlO1E5O083BKFc?=
 =?us-ascii?Q?647gu8ttGIoCq9Lc2XT1XDajFSpEP0Ltase1fpI8VxutWr2Ra4vCVCN/uLYZ?=
 =?us-ascii?Q?gWiuXFxdfmJ/nVgyHIZ5wVWj/SFTeI5RDCFIVK8/67IoybP37RkL8/TPjZk8?=
 =?us-ascii?Q?jSEQ3e7jqFpugZsek4al1WrOfmRFLC7OT90TbveCj4kWMn9e5GUre7gNDpCN?=
 =?us-ascii?Q?cHe/qhLo1ZZDqgX48lQUhCdCrcCQykvZDoszoPm6X/8tYzj5sCiri1iGe4A2?=
 =?us-ascii?Q?72wPF5oS2G7hkygrOSOMmRmeWbrnCE/5G1OgTXKsjxJmNXulUfbhiS3RXu0A?=
 =?us-ascii?Q?IFMde4j1uYu+d0HKdtxAB3HUtDUbqgIne8EGiSNmPvHfGQCq3FAU7NzQ4Ic9?=
 =?us-ascii?Q?Y8kAEIjJ9lo0ADch7DpDisM7RnzWNhX7C8HrixhpUK4M2tjpwP/qWPRxiPVO?=
 =?us-ascii?Q?rbwJaUhH/1mGRox3xBdkmlho0UPJ5uGL6uS2uT+0zM8eQIiZGRrDwXIK0Blx?=
 =?us-ascii?Q?LzBtsMBT4n5+o47ReJDHhAKimSLvtcipGMfuZ7PuAfj4ZvfurKis2entUb7w?=
 =?us-ascii?Q?XmU9J8/3uglxgBTfV7r2CFrnhCImMwNvXYEN5hFxWnBWZ7cSNLcBXzZiaPy5?=
 =?us-ascii?Q?jgHgtVXSVuj8rbPIZNJ3et2Wekk7m5qrqNonalKUbXL4+cZuUA0xssctu46a?=
 =?us-ascii?Q?3WgEOG85tNb9M3XpFak3GPA22+TgSNPeQGo3pJYXb7YDzrXTZa/E0ZhbTk+I?=
 =?us-ascii?Q?8Rfpek225BSNzGeCZ/yYMOhW7klentuFYER4/5DmVAHI44IQBnnOLGvsQIFg?=
 =?us-ascii?Q?c+xYqJrC2fDzkWmE3ysGhZQtHxRJXgV/cdB4X53b6wRF6o6Z66APWXv2azRq?=
 =?us-ascii?Q?lew/FRIAZGrQEFJ25BCu8nmyAEADIeGwtl48jx+E/gSBxp6Ln0xwmq6N4osO?=
 =?us-ascii?Q?WmoagwTnka40FCDZFhTqpaGA+l9Ply3LE2LoOvh8b3VaCfJXsIySTkViUZYL?=
 =?us-ascii?Q?3rJjaLFg7xSkGUj2m+SD0oKzaM3EFIjuQ4QHwsnDInUtammm8QjXispYaCF5?=
 =?us-ascii?Q?o5owlg92UJVtjNF5Dd3VZ01vLkHVpNLUkPpfZPK/kSWMreDqpBDFOlERlD43?=
 =?us-ascii?Q?/g6GKCP5UC7yvXAeyjsurfnrDduS0ZFOVwhd7sw4y+dBy5R6snxOi8/ipp2R?=
 =?us-ascii?Q?Q4O+m4iO7X5WLNgGYlkRmcvmc77cuE4VcGSYjx0CzmfxgU8sp8Rqq9dq+DXe?=
 =?us-ascii?Q?ofq+gtGv/R50lNOPWSMTkvt3zFM4lQF+m8yazFsrRYUYACZBcXvGV3726hjK?=
 =?us-ascii?Q?ZoFFvwTVPHvzgYh1r6wV5C1wktU/F9mL0LA4ggRXe6ru+l8Q07+4b/IcuPV8?=
 =?us-ascii?Q?/Acige8luKSkxS4YBCK89GoaoZXoYpVSFIpMIZdkiWQbM9BJGXhIXMwCI7G7?=
 =?us-ascii?Q?Ah8Dw98kSyM8EuXqBUFf19C4IA4EK/TeqAQNK+35?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	O5kCQrAhoOyHVvrJ8xlrrcy07Ep+2RL70PInVFZ96teQLBLz3tvV1tCyqhvZFeDOUorntKtYAjX2yOX0YI+lcTowRViLrNuAtuZNO24xSDiktwrlFt8jITuNEvPLYnFp68E/OHnZHIDtHS0HuIN9qukQ6wLW8zPxw91UCEv47Ykn3RSiipibOmNxnWPuRUbYzlUrEUyq7TIpaYRgCKNv3fD7+YqIDCLgAc1vw+/lrfmylYH0PSw6TMjiLoWMyqpewmCWmZpc3daHYbK7HGF5BnDcsH8FklkYM8UupRG6P0S/0Yb4FS2is3CeEF5VHWi8FYDs39WsV0CnW21kNy8DTp55khFHfSGI6hohlTV+ULCbTEHeORAAEyQvmLzqoIAn2KwgVdlHBImkjUqgbhVobfzoNikJgof10lF2VDVioHrH5NvWuxFWvgItHR9L0BsA1aXXuonjKIKVthhKj41tvfR04RES1tl0YwFGDARJVlEE/HxWk8KwDi9wh42ze9xV7B9TtsTusH6/xwq0M3XFvwg9RYNDfowPZYljUJ731rUJiJxguTXqNfz9dfM4ItSEr7IMbvi9DqSb4fnHvzfvAapy/NTfwmG/MQaUjKrffSA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ffdbdd-8de9-4681-79fd-08dca7a79d0d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 04:02:31.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uuw70yuV5xjYQQ4fpcpVOuHhBMUO85RV3FgF0MiCszKs0FIdFYjydSWb3cEihRBSBzErJRRXuFaJGLmR0Ni3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190029
X-Proofpoint-ORIG-GUID: 5L9EsUA1Wv5js3ql0OGd--V7FzOHTulT
X-Proofpoint-GUID: 5L9EsUA1Wv5js3ql0OGd--V7FzOHTulT

From: Eugene Loh <eugene.loh@oracle.com>

To support USDT tracing of processes that start after the dtrace
session starts, we will move to a new USDT trampoline.  Based on
the firing pid, it will look a bit mask up in a BPF map.  It will
walk all its clauses, calling conditionally those clauses that are
in the map for that particular pid (overlying probe).

Thus, for each underlying probe, we need a list of clauses.

There is already a dt_probe_add_clause().  It adds clauses to
overlying probes.

Add the ability for a provider to supply a provider-specific
probe_add_clause() function.

Have the pid and USDT providers supply such a function that adds
a clause to an overlying probe's underlying probes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_impl.h        |  5 +++++
 libdtrace/dt_probe.c       |  7 ++-----
 libdtrace/dt_prov_uprobe.c | 34 ++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.h    |  3 +++
 4 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index d15c238c..2132eda2 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -283,6 +283,11 @@ typedef struct dt_percpu_drops {
 
 typedef uint32_t dt_version_t;		/* encoded version (see below) */
 
+typedef struct dt_probe_clause {
+	dt_list_t	list;
+	dt_ident_t	*clause;
+} dt_probe_clause_t;
+
 struct dtrace_hdl {
 	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
 	void *dt_varg;	/* vector argument, if vectored open */
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 0b53121a..48b02e11 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -24,11 +24,6 @@
 #include <dt_list.h>
 #include <dt_bpf.h>
 
-typedef struct dt_probe_clause {
-	dt_list_t	list;
-	dt_ident_t	*clause;
-} dt_probe_clause_t;
-
 typedef struct dt_probe_dependent {
 	dt_list_t	list;
 	dt_probe_t	*probe;
@@ -1359,6 +1354,8 @@ dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
 		pcp->clause = idp;
 
 	dt_list_append(&prp->clauses, pcp);
+	if (prp->prov->impl->probe_add_clause)
+		return prp->prov->impl->probe_add_clause(dtp, prp, idp);
 
 	return 0;
 }
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index c77063a8..5dbd75e3 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -129,6 +129,38 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Add clause to probe.
+ */
+static int probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
+{
+	const list_probe_t	*pup;
+
+	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+		dt_probe_t		*uprp = pup->probe;
+		dt_probe_clause_t	*prev, *pcp;
+
+		/*
+		 * Check if the clause is already there.  Since the clauses
+		 * are added "in order," we only need to check the previous
+		 * entry.
+		 */
+		prev = dt_list_prev(&uprp->clauses);
+		if (prev && strcmp(prev->clause->di_name, idp->di_name) == 0)
+			continue;
+
+		/*
+		 * Add the clause.
+		 */
+		pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
+		if (pcp == NULL)
+			return -1;
+		pcp->clause = idp;
+		dt_list_append(&uprp->clauses, pcp);
+	}
+
+	return 0;
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -811,6 +843,7 @@ dt_provimpl_t	dt_pid = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_pid_probe,
 	.enable		= &enable_pid,
+	.probe_add_clause = &probe_add_clause,
 	.probe_destroy	= &probe_destroy,
 };
 
@@ -822,5 +855,6 @@ dt_provimpl_t	dt_usdt = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_add_clause = &probe_add_clause,
 	.probe_destroy	= &probe_destroy,
 };
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844c..b1b1b1b8 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -62,6 +62,9 @@ typedef struct dt_provimpl {
 	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
 			  const struct dt_probe *prp,
 			  int *argcp, dt_argdesc_t **argvp);
+	int (*probe_add_clause)(dtrace_hdl_t *dtp, /* add clause to probe */
+				struct dt_probe *prp,
+				dt_ident_t *idp);
 	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
 		       const struct dt_probe *prb);
 	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
-- 
2.43.5

