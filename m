Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF4519F110
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 04:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728536118; cv=fail; b=R1pDhdrf0T7kOalJthByoADzLIz2Bv/ybhhyeK5MnAFRj7wGsoLDGUcrv1qxqCeWtJ2ZpbEaxsIMHAndCFsR3n6l9hzpMZcDcCPkI9Qm6bcP1afHNzqd5E5k7AD1dcevOn19tvtyxR+WKK/hqy5wgchdUfIXpBCMiLy0YIzA29E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728536118; c=relaxed/simple;
	bh=Mvc244lQl8zmXPvKI6KK0m+X7zECIOWDit/Za34JUk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BVGe4z5yqBCy+Z9nE2eISI6yQMQK0g7GdnRFgET+21jvmEla2K4rTfeAORWwIFGHmEcwzx1wIhNUfb+Pf2vhyDp+XGTZYbzhORbprYOorxG0R50PbBM76ZjUAx8j95pzlpQ3iZ/clhpKEyLnsvisjPf6/1TnOX0lU63qm3vcHGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CMxhOmXg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Iro9bsv6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CMxhOmXg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Iro9bsv6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A2tcHj024876
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 04:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=4a4Iv+YWC89GxxyCt8
	fuzJPi5hrzL2BN90bK2AQHrxU=; b=CMxhOmXgjBDjOAvBaprAl705R0Dk0b5vgo
	ldZXFgoEsrOkpMKKre8/NP47mwf2u5qGpdlFEarC8FLnMceyh30Gb8yi2kKHybDD
	0HEzNfd07xWOSsS2KWpDibT5uWhD+Zpz0Sm9jAiel2Rih3PU5EgTqBnBsxEo9j8Y
	a+v72+9pPvFHlC3Eu6c7p1YBV224o3AWbYQk/qAoShQNYZ3LGCvF9IF2vCso9DbT
	djZk+2gQkltFphPw0OLLCbuv7ZCCBhGwf1FxF0xz2mB9eRj4jq3qx+azNO1Oe16U
	6dADq9nBkwhUmuYYIGf5jfTATRqcnStkLJm8Acl4l23c/u5T/hHA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423063svx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 04:55:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49A26fRA031103
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 04:55:13 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw9hk8q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 04:55:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPmlLuMOiltebqhLpXXyRPT2AV2WDGPltZ4H4jWuW2SA8JWg1mKUToGSLY5myoUIxQ55UO6vEWpDYsLAROYjjBwZZUV0uus+8JwsN/1ptJcRW9/FfsY7fI2I7DHCHtetDlFrTe7iQ3WMQyItZ3T89XN7Sz9MELJBYDvmdrLoMh2P+VIkbOq0mQ/GNGd5ZyP/7RXY8Z3QpoKA7/tc1SzoefaM0b9bF3n+O6At4zZelKS2PvmBt+nkGbiwd+UTGzUdkqKuYOQZ064BcaWo7gKNAAbvav1ABo870SiGR+HrTINq2WsEf/C3SbMrYfZfYcsFXGVcFrq0J+FYskSszoZ7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a4Iv+YWC89GxxyCt8fuzJPi5hrzL2BN90bK2AQHrxU=;
 b=NKwSkKyEOCfAYqNnNV3hHTVbD9rjT3FD46z9yHdBmRY7N3DY7Wjq+x5JHMi062rcS9vCgS6no9znzDYUgNiI1OPI9lSZmOQLCd2VUwUgAOMagPEP/lkdZ8oDjX1W2qQaVqg7T2wNnODVbWpKy1LhyAw4pk8/ciVuYE2tnRaIS/hAtDPhBT+J74qYPdsDzcuXcAKQzC6FPwZIm3EMOQYJ38yY9OT471KmYVrasz6S+/aJig80/OIKv6195coZL4osMZvacOmAi6eWXeJzfn+JCuLiNpyknloEnAIDWl454zhJgUkkWatJ5C5GWz0JpJ0mcUow2wUyjNKtxBs3YgV8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a4Iv+YWC89GxxyCt8fuzJPi5hrzL2BN90bK2AQHrxU=;
 b=Iro9bsv6TDXA03VsZZfuWm5qCOsyUwhfX0xfRwBGVbFWBBG0rfoslgjlZIB8ev2/38zzibAHF2z1P0pdXYjZxT6qvz3LbWrtdrKCAxH6u48uP8Zxxj+Kgn6LVMHPVPnmgHoC6a93uhR6n04G7YhdNUR6ha34EgwUuDvUImZR9WM=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB4915.namprd10.prod.outlook.com (2603:10b6:208:330::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13; Thu, 10 Oct
 2024 04:55:10 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 04:55:09 +0000
Date: Thu, 10 Oct 2024 00:55:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 07/19] Create the BPF usdt_names and usdt_prids maps
Message-ID: <ZwdeK90de5dmBFT4@oracle.com>
References: <20241009054535.28199-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009054535.28199-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0874.namprd03.prod.outlook.com
 (2603:10b6:408:13c::9) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c1b70f-f50c-41aa-3753-08dce8e7b7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zARdIfQgXx+cd4eH+lCWwsV9oblVcbSycoLGTeDaiNTP+sP3GRTKCFZJAwwC?=
 =?us-ascii?Q?tnOQ+NVk/R5yu0ILZba6sjUnSDScFcSgth1aSObV2sLemCGi0GOfByBw/GgW?=
 =?us-ascii?Q?MvS9eFWSNp68Y/0CItd5LxLWuRAh2yVDrNxO6GCDWWbuJv6/wj9On85GqW2X?=
 =?us-ascii?Q?O85v5s2XkYpqgHhJ53hQ8xTy+n7KG7bP9gG+p37FWFEBpclnL+EPjefyY9p8?=
 =?us-ascii?Q?pTceDHFNFp0xwUcR8OFF33OIrtZvRI8dLprWCkP5YPdXt7q7vXMDas4ItYdb?=
 =?us-ascii?Q?QZYUt1noTTCFETzWPc+8Dl2M0vZv04b6NJdVV1sMG0sRWFIuadhBMc/hf51T?=
 =?us-ascii?Q?WTbyrGL4V6rObD2v/4kfJChrU0597Gr67TEXRD0qZ8X+4hh3D35eSNBcIrZ+?=
 =?us-ascii?Q?/zz+TS8uH1Z+owZirrzwR0z1jbahSVZn3mqEasn6ZQKzZDBqidEPXEMjgcC2?=
 =?us-ascii?Q?kgYBXR4k0NQ4xelKRTCHVjRiqtsgj2L7XArBQZlKOLCtQFs0gOggd/HwC5O/?=
 =?us-ascii?Q?U/NhLs5owC7por/aVkJtyOwH3uCwhUeoiITrjzlICSxY/OM9r5LpAeKPHrjC?=
 =?us-ascii?Q?UF1sESClSSOEQxVb89Cy9uU2tOxLPytUFHQsnwV5LN3mVKlq2lEvMdppMm+r?=
 =?us-ascii?Q?sajKVnEOiHsHpZ0dVXztGKDag6A5VKZvRCrfNAlXpvfd94PgToRMGeNCf8Sz?=
 =?us-ascii?Q?iwAhMwTf2p3YlmfXK9d6APbzXr75Ay/8s5wCl6VC1tIV5AwKndsij9QiFcsC?=
 =?us-ascii?Q?vlfTg8ZVpLbzoNVsntpFLxhIhP3Gi5SuhOSa0Wi1IloYnO+AMednP6GlFPH+?=
 =?us-ascii?Q?FH6DqXYg/s61m//3fQklq1K28FnGpwqaoN+NU2025Dvg5mabTDQkUffWXND9?=
 =?us-ascii?Q?HfFF5sBbBVzoxxGJkfY8XlDnxDcWttmvL0+JkQAa/OkkLzhjkUXMAxjkFBC0?=
 =?us-ascii?Q?z4HRMH9arCzilnmfPwZ8UE/gzUa2W2F6/q4p0JxpuhRdxuybqoTJUJcO/RoJ?=
 =?us-ascii?Q?GWfyPkx3euD2tYbGWzOlyr8M79VKv9V+M/xRcuFM5VqIDvN9CxCpGeI2s1cj?=
 =?us-ascii?Q?ON78lcM2KJKTOCgqZ2I5apMjaen1f0dW7eUM9cv9SebDEgiTZetKko9wTIoD?=
 =?us-ascii?Q?hN5wtJy+Uq27GS2y4NXWhPizB2dgvqQ1hzcO9HOQTAj4miNgCZUS2xkDDDnS?=
 =?us-ascii?Q?xiBXGHUBit0m/KpXh6JrFEXwpRXkuqMvAFHU925+aY4fKw+viddr3Fked0Nh?=
 =?us-ascii?Q?/IQoi0hZZI3UrZ1lQ+bPepTdws0P95m3RjSnfnqz+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rWZkyxc1oX7rxaaOJ8RTfyJ4pdLE5qYzSonfhAbo+xpAHVmk0nYGczpClAy+?=
 =?us-ascii?Q?+hON8zcPZsf9S+3GWDWG5PVY27pZanWC/UOvwJ85R4PUh/09TaMhYr3wNech?=
 =?us-ascii?Q?MZ8mPgPJukUtyjBFajhetdd7M6WbOequ4MEC+l15oNcE8pxv4oXHFEsJDr81?=
 =?us-ascii?Q?gPW9MmBHu+U2bZqZUMiDXrvpbw8fsOGm6T8ZPmahEpORcgMxAG2gpxi7WYrF?=
 =?us-ascii?Q?eW0l0MZfe2loC2uEE8z22eQn0/RqQZiNIWIs9GlqYSO5mz5cPC7V9RtdqfYh?=
 =?us-ascii?Q?G7LccgWa/KFyvl3Ne23fdjyq8FY1XYxc8lsXVQtGsC0FG75pIYHkv5UrPyvX?=
 =?us-ascii?Q?BWYoiuWY1BTGOWHZP7cVYVo49heQNAQcZCC0IegOUNeo5CX+Q9CrDzdreKOD?=
 =?us-ascii?Q?WwodOXvSUFOMMUYVrH93wJQpc6qH0dUtfdBp64l4n3fsME3dfJJ9TDtbSbwQ?=
 =?us-ascii?Q?Gi3T4TZdBsxmtxEojxJ0C1I4KGGhXpVUqukZyro88hotIWltgsTimg7Rcu8b?=
 =?us-ascii?Q?erwX8+JhmxS97XUM3RhcmwhyoDwakTxVSxZ8aPvmIvmh7OFhbFbys8bhWrkV?=
 =?us-ascii?Q?/sr9tYgeIn7atBOu1DnlnJdPr/M9iftkVDIwZNkIZSRPm0ouwFBD+IhiAUtc?=
 =?us-ascii?Q?P7YLf+oYPAd0jJY8wlIs7yaskDInG7ZUFjJhIdadXhcprFex9JK/TTt0TUqm?=
 =?us-ascii?Q?MPuSyIXBgB4EKC4IAPg75aLUqyNUrWZ+UA5uld/04p8PoPrGV3l7hupwsayk?=
 =?us-ascii?Q?M3/IrVv4YwGvW/ZxiQrBpl34nxe6kogB6+wdoHmsSqSdAPhD8QWcDqs18Hxn?=
 =?us-ascii?Q?l+1v1eEBmcX9X5DwiCp5RbvB0TlLJmjInvW+BePJWTbB+32UJERE90TDPRyN?=
 =?us-ascii?Q?l/usofZ12r+xgktwldR74uZ9aHXL5ZlTN0JATs/i214Yhm3x++XJPABhB+LG?=
 =?us-ascii?Q?sAypQuF/m5IRA8E8JUp4TlvD5bSMMwE48TyX9lba/TDdipUnviHglqzj/ElN?=
 =?us-ascii?Q?B4rW7gHeV2Ey2nrT6LWJAJYf9NEcTvFuc50UF2SP9hBsKoxZ+dQQi4JZs1BA?=
 =?us-ascii?Q?mvxg8F/fLpqpFvZQfUgliZRZK4PlU+jW3dBhx8wp523onrjgevQLuQ6YNtfw?=
 =?us-ascii?Q?GSnhyobeajY9jNsbyId0aodo36CPsNL3nsLC7AhVs089Gl+bHP9iB/4fQmOS?=
 =?us-ascii?Q?KJlnBZ1iuIAgXmnQEhXKZ3LsMvUVjZ+U5sNBTmqTVMLNY8tOwdMGS5oU5XNH?=
 =?us-ascii?Q?2ZMVsn4tzWCYKAqoNKvnLui5Qy3mxyL8WtcKWjnaPvGpskrtPvmLV+OKcy4z?=
 =?us-ascii?Q?/ZetUbeUZm0q4J56D+sPFo05L588rzZ5XmtmuygT5uLvcAr4o95bNgAVF759?=
 =?us-ascii?Q?H0+AxotkHzbUKjO9JcdBp+K5AhEAVHNFs4Pvr9r+Z1ETYukR7MsuqMpCVFoh?=
 =?us-ascii?Q?WggTuxqitpkijelN62f/08vRNv2tNnUw+kYXwdQcgicHiKxWW6XXIeGlQnPj?=
 =?us-ascii?Q?SzFHKZh2DlpJu9UxDQFD6O/WREeWgTmLzsu/dhSQP8xYbx0105KPlQWx2zDp?=
 =?us-ascii?Q?ruDrlqCSAGFHF3P5CeXjNq/5nd/f88LayzdwQGO6IP+aIBxR5YcMK8H4lzBz?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xhsXsten3+sDKTA3Iq7d5MY1AWaQlaR6uUsuuRw9ACe2MJhjADNOn1m0i2kfHumdDNNtshoonGj4QGgCR9V+JmWCYQTjnr364S2ocGvEBe5w1nPd/09S35H+m9jIClsu4GDvJv0e845X3VmGi1PPoVlbGZF8YUsyUScV8bhyCWsOseWVMbYAEhpSQzEn5m0ZT49WWOFOc9Fbjx+Wiumfh6Nz0LkDfCzSIwCDeFbG5C0AMStQufzfJNnkwh7/C+H4lynfOdQULDH879qkjbJFTDc+FVPdMydD1qmuOh1Lo0HzXogjZn0yoY5DzrV2naskttHB6YrkAZi0xtL9Pg+zvUWmomfsKXJXsAzttHFcMP92Eb3C+HIxgHiKtO2pbQZSxZyXo23CmPYYohMXhTj6C/kwhKqhAPK/v0PToElBLZOTUllZnIe39l5viEiy2ZDTesvkwdfWyAmx3/Tbw3DT4Iv+dWpkaw2wGpDUoWEZYlnIZD6hHUVASWAUDVTkPPgJJmFR82zIYi6erqyFltJypb/L47/41xZvzGi7lhK5wWlhl7AAASrpcqAG6t7ShVKY38BnvhF5we0VTwQpiBUIES/LRjKn3nnDes0o47WArAM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c1b70f-f50c-41aa-3753-08dce8e7b7be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 04:55:09.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMuQ9DcY2U86MyJ+04UzrKyLejMsN9y9kRCVRdcLBJnvxu2iou7Q01ELJh5ZH+diARv3rBKRNwe5hBeHhtJY/SLDxKiBRY5e3VGqnFN2zv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4915
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_01,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410100030
X-Proofpoint-ORIG-GUID: CGpZAUqmyh2jmgduI8AarzeioSPLA7H3
X-Proofpoint-GUID: CGpZAUqmyh2jmgduI8AarzeioSPLA7H3

On Wed, Oct 09, 2024 at 01:45:34AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> As USDT processes come and go, the overlying probes for an underlying
> probe will change.  Hence, we will move to a scheme in which an
> underlying probe will walk all possible clauses it could call,
> deciding at run time (using a bit mask for the overlying USDT probe)
> which of the clauses to call.

I think this could be explained a bit better.  I'd say that it is the "set of
overlying probes for an underlying probe" that will change.  And I would add
that the underlying probe program will walk all possible clauses that any of
its overlying probes might call for each overlying probe, only executing the
clauses that apply to that overlying probe (using a bitmask).

> In this patch, we create and update the BPF "usdt_prids" map.  This
> is a hash map, where:
> 
>   *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
>         - the PID of the firing process
>         - the PRID of the underlying probe
> 
>   *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
>         - the PRID over the overlying USDT probe
>         - a bit mask indicating which clauses should be called

Why are these sizes stored in members of dtrace_hdl_t rather than being
defined as constants?  Since they are constant values, there should be no
reason to store them.  (Commenting on that below as well, for context.)
> 
> As USDT processes start up, we also add new overlying USDT probes,
> whose name elements must be retrieved by prid for the built-in
> variables probeprov, probemod, probefunc, and probename.  While
> this is currently done with the BPF "probes" and "strtab" maps,
> the monolithic strtab map cannot safely be updated by the consumer
> while the kernel might be reading the map.  Therefore, we introduce
> a new variable, dtp->dt_ninitprobes, that records the number of
> initial probes, those created when a dtrace starts up.  For a
> prid < dtp->ninitprobes, the existing scheme is used to retrieve
> probe name elements.  For newer prids, necessarily USDT probes,
> we use new a new BPF "usdt_names" map.

I think this could do with a bit of rewording for clarity.  I am also a bit
wondering about the dt_ninitprobes name.  I think that dt_nprobes would be
sufficient, as the number of probes that DTrace creates.  Any probes added
later are numbered higher than dt_nprobes.  Not an ideal name, but I think
it is sufficient (and pre-tracing is the only time we really care about
counting probes in general - the later ones are counter towards nusdtprobes).

> The underlying-probes "update" function is called sporadically.
> The focus of this patch is the function.  When it is called can
> be tuned in future patches.

This seems to be an old paragraph because the focus of this patch seems to
be the creation (and mgmt) of the two new maps.  Ideally, this would be
multiple patches actually (creating the maps, populating the maps, using the
maps, ...)  More on that function below...

> The number of new USDT probes that can be accommodated is set by
> the new "nusdtprobes" option.
> 
> The size of the bit mask -- that is, the greatest number of clauses
> an underlying probe might call.  This is relatively easy to extend;
> nevertheless, that work is left for a future patch.

The first sentence here seems to have part missing?  I assume you were
going to mention what the size is for now?

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/get_bvar.c                   |  72 ++++++----
>  include/dtrace/options_defines.h |   4 +-
>  libdtrace/dt_bpf.c               |  39 ++++++
>  libdtrace/dt_bpf.h               |   1 +
>  libdtrace/dt_cc.c                |   3 +
>  libdtrace/dt_dlibs.c             |   3 +
>  libdtrace/dt_impl.h              |   7 +-
>  libdtrace/dt_open.c              |   9 ++
>  libdtrace/dt_options.c           |   1 +
>  libdtrace/dt_prov_uprobe.c       | 222 +++++++++++++++++++++++++++++++
>  libdtrace/dt_work.c              |   3 +
>  11 files changed, 337 insertions(+), 27 deletions(-)
> 
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index 37f29a591..bc184c50f 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -21,6 +21,7 @@
>  
>  extern struct bpf_map_def cpuinfo;
>  extern struct bpf_map_def probes;
> +extern struct bpf_map_def usdt_names;
>  extern struct bpf_map_def state;

Pedantic but maybe add at the end for alphabetic order (since that is what
was there and there is not really any other ordering used here).

>  extern uint64_t PC;
> @@ -29,6 +30,7 @@ extern uint64_t STKSIZ;
>  extern uint64_t BOOTTM;
>  extern uint64_t STACK_OFF;
>  extern uint64_t STACK_SKIP;
> +extern uint64_t NINITPROBES;

As suggested above, I would name this NPROBES.

>  #define error(dctx, fault, illval) \
>  	({ \
> @@ -122,32 +124,52 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>  	case DIF_VAR_PROBEMOD:
>  	case DIF_VAR_PROBEFUNC:
>  	case DIF_VAR_PROBENAME: {
> -		uint32_t	key;
> -		dt_bpf_probe_t	*pinfo;
> -		uint64_t	off;
> -
> -		key = mst->prid;
> -		pinfo = bpf_map_lookup_elem(&probes, &key);
> -		if (pinfo == NULL)
> -			return (uint64_t)dctx->strtab;
> -
> -		switch (id) {
> -		case DIF_VAR_PROBEPROV:
> -			off = pinfo->prv;
> -			break;
> -		case DIF_VAR_PROBEMOD:
> -			off = pinfo->mod;
> -			break;
> -		case DIF_VAR_PROBEFUNC:
> -			off = pinfo->fun;
> -			break;
> -		case DIF_VAR_PROBENAME:
> -			off = pinfo->prb;
> +		uint32_t	key = mst->prid;
> +
> +		if (key < ((uint64_t)&NINITPROBES)) {

		if (key < ((uint64_t)&NPROBES)) {

> +			dt_bpf_probe_t	*pinfo;
> +			uint64_t	off;
> +
> +			pinfo = bpf_map_lookup_elem(&probes, &key);
> +			if (pinfo == NULL)
> +				return (uint64_t)dctx->strtab;
> +
> +			switch (id) {
> +			case DIF_VAR_PROBEPROV:
> +				off = pinfo->prv;
> +				break;
> +			case DIF_VAR_PROBEMOD:
> +				off = pinfo->mod;
> +				break;
> +			case DIF_VAR_PROBEFUNC:
> +				off = pinfo->fun;
> +				break;
> +			case DIF_VAR_PROBENAME:
> +				off = pinfo->prb;
> +			}
> +			if (off > (uint64_t)&STBSZ)
> +				return (uint64_t)dctx->strtab;
> +
> +			return (uint64_t)(dctx->strtab + off);
> +		} else {
> +			char *off;

Hm?  I would not expect a variable named off to be a char *.  Especially since
the preceding leg of the conditional also has an off variable and that one is
uint64_t.  Why not name it s, str, or even ptr or something?

> +
> +			off = bpf_map_lookup_elem(&usdt_names, &key);
> +			if (off == NULL)
> +				return (uint64_t)dctx->strtab;
> +
> +			switch (id) {
> +			case DIF_VAR_PROBENAME:
> +				off += DTRACE_FUNCNAMELEN;
> +			case DIF_VAR_PROBEFUNC:
> +				off += DTRACE_MODNAMELEN;
> +			case DIF_VAR_PROBEMOD:
> +				off += DTRACE_PROVNAMELEN;
> +			case DIF_VAR_PROBEPROV:
> +			}
> +
> +			return (uint64_t)off;
>  		}
> -		if (off > (uint64_t)&STBSZ)
> -			return (uint64_t)dctx->strtab;
> -
> -		return (uint64_t)(dctx->strtab + off);
>  	}
>  	case DIF_VAR_PID: {
>  		uint64_t	val = bpf_get_current_pid_tgid();
> diff --git a/include/dtrace/options_defines.h b/include/dtrace/options_defines.h
> index 80246be8c..7a49b89f2 100644
> --- a/include/dtrace/options_defines.h
> +++ b/include/dtrace/options_defines.h
> @@ -63,7 +63,9 @@
>  #define	DTRACEOPT_SCRATCHSIZE	33	/* max scratch size permitted */
>  #define	DTRACEOPT_LOCKMEM	34	/* max locked memory */
>  #define	DTRACEOPT_PRINTSIZE	35	/* max # bytes printed by print() action */
> -#define	DTRACEOPT_MAX		36	/* number of options */
> +#define	DTRACEOPT_NUSDTPROBES	36	/* max number of (added) USDT probes */
> +
> +#define	DTRACEOPT_MAX		37	/* number of options */
>  
>  #define	DTRACEOPT_UNSET		(dtrace_optval_t)-2	/* unset option */
>  
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ad11d178e..7e4a4461a 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -940,6 +940,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +/*
> + * Create the 'usdt_names' and 'usdt_prids' BPF maps.
> + *
> + * 'usdt_names':  for get_bvar() to look up probe name elements for any
> + *                prid that was created after the initial probes.

The convention is to mention what type of map this is, what the key is, and
what the value is.

> + *
> + * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
> + *                The value is a probe ID for the overlying USDT probe and
> + *                a bit mask indicating which clauses to execute for this pid.
> + *
> + *                For a given (pid, PRID) key, there can be at most one
> + *                overlying USDT probe.
> + */
> +static int
> +gmap_create_usdt(dtrace_hdl_t *dtp)
> +{
> +	dtp->dt_usdt_namesmap_fd = create_gmap(dtp, "usdt_names", BPF_MAP_TYPE_HASH,
> +	    sizeof(dtrace_id_t),
> +	    DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN,

Any reason why you are not using DTRACE_FULLNAMELEN?

> +	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);

Probably want to put this in a variable because you will use it again below.

> +	if (dtp->dt_usdt_namesmap_fd == -1)
> +		return -1;
> +
> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> +	    dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz,

These are constants so there is no need to store them in dtrace_hdl_t and use
them here.  Just define them in dt_bpf_maps.h and use those defs here.

> +	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);

empty line perhaps?0~

> +	if (dtp->dt_usdt_pridsmap_fd == -1)
> +		return -1;
> +
> +	dtp->dt_ninitprobes = dtp->dt_probe_id;

	dtp->dt_nprobes = dtp->dt_probe_id;

> +
> +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
> +	if (dt_uprobe.update(dtp, NULL) < 0)
> +		return -1;

Yes and no.  You are using the probe name data for USDT probes that already
exist at this time from the strtab so there is no need to update the usdt_names
map at this point.  The usdt_prids map does need updating, but I don't think it
makes sense to do that here.  During program load would seem a much better
time.  Also, we certainly wouldn't want to use a direct call to a function in
a specific provider.

> +
> +	return 0;
> +}
> +
>  /*
>   * Create the 'gvars' BPF map.
>   *
> @@ -1045,6 +1083,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  	CREATE_MAP(scratchmem)
>  	CREATE_MAP(strtab)
>  	CREATE_MAP(probes)
> +	CREATE_MAP(usdt)
>  	CREATE_MAP(gvars)
>  	CREATE_MAP(lvars)
>  	CREATE_MAP(dvars)
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 5716d2320..64f6c00a2 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -54,6 +54,7 @@ extern "C" {
>  #define DT_CONST_ZERO_OFF		20
>  #define DT_CONST_STACK_OFF		21
>  #define DT_CONST_STACK_SKIP		22
> +#define DT_CONST_NINITPROBES		23

DT_CONST_NPROBES

>  
>  #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>  #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 4202771a9..421084381 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1064,6 +1064,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  				nrp->dofr_data = sizeof(uint64_t)
>  				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
>  				continue;
> +			case DT_CONST_NINITPROBES:
> +				nrp->dofr_data = dtp->dt_ninitprobes;

			case DT_CONST_NPROBES:
				nrp->dofr_data = dtp->dt_nprobes;

> +				continue;
>  			case DT_CONST_BOOTTM:
>  				if (boottime == 0 && get_boottime())
>  					return -1;
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index ba4d4abef..f7b31f7be 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -71,6 +71,8 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(strtab, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(usdt_names, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
>  
>  	/* BPF internal identifiers */
>  	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
> @@ -95,6 +97,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL_ID(ZERO_OFF, DT_IDENT_SCALAR, DT_CONST_ZERO_OFF),
>  	DT_BPF_SYMBOL_ID(STACK_OFF, DT_IDENT_SCALAR, DT_CONST_STACK_OFF),
>  	DT_BPF_SYMBOL_ID(STACK_SKIP, DT_IDENT_SCALAR, DT_CONST_STACK_SKIP),
> +	DT_BPF_SYMBOL_ID(NINITPROBES, DT_IDENT_SCALAR, DT_CONST_NINITPROBES),

	DT_BPF_SYMBOL_ID(NPROBES, DT_IDENT_SCALAR, DT_CONST_NPROBES),

>  
>  	/* End-of-list marker */
>  	{ NULL, }
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 340dc1960..198405db2 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -319,7 +319,8 @@ struct dtrace_hdl {
>  	 */
>  	struct dt_probe **dt_probes; /* array of probes */
>  	size_t dt_probes_sz;	/* size of array of probes */
> -	uint32_t dt_probe_id;	/* next available probe id */
> +	dtrace_id_t dt_probe_id; /* next available probe id */
> +	dtrace_id_t dt_ninitprobes; /* number of initial probes */

	dtrace_id_t dt_nprobes; /* number of probes (pre-'go') */

>  
>  	struct dt_probe *dt_error; /* ERROR probe */
>  
> @@ -389,6 +390,10 @@ struct dtrace_hdl {
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> +	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> +	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
> +	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */

No need for these two size variables.  These values are constants.

> +	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>  	void *dt_errarg;	/* error handler argument */
>  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 848141ddc..113ffff2b 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -817,6 +817,15 @@ dt_vopen(int version, int flags, int *errp,
>  	dtp->dt_options[DTRACEOPT_SWITCHRATE] = 0;
>  	dtp->dt_options[DTRACEOPT_AGGRATE] = 0;
>  
> +	/*
> +	 * Set the default maximum number of (added) USDT probes.
> +	 */
> +	dtp->dt_options[DTRACEOPT_NUSDTPROBES] = 256;
> +
> +	/*
> +	 * Pre-processor.
> +	 */
> +

Drop empty line.

>  	dtp->dt_cpp_argv[0] = (char *)strbasename(dtp->dt_cpp_path);
>  
>  	snprintf(isadef, sizeof(isadef), "-D__SUNW_D_%u",
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index ec53358b3..377b396b0 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -1137,6 +1137,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
>  	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
>  	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
>  	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
> +	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
>  	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
>  	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
>  	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index bb172ace2..b02b84263 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -37,8 +37,10 @@
>  #include "dt_list.h"
>  #include "dt_provider_tp.h"
>  #include "dt_probe.h"
> +#include "dt_program.h"
>  #include "dt_pid.h"
>  #include "dt_string.h"
> +#include "port.h"
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> @@ -63,6 +65,15 @@ typedef struct list_probe {
>  	dt_probe_t	*probe;
>  } list_probe_t;
>  
> +typedef struct usdt_prids_map_key {
> +	pid_t		pid;
> +	dtrace_id_t	uprid;
> +} usdt_prids_map_key_t;
> +typedef struct usdt_prids_map_val {
> +	dtrace_id_t	prid;
> +	long long	mask;
> +} usdt_prids_map_val_t;

Move these to dt_bpf_maps.h?

> +
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
>  
>  static int populate(dtrace_hdl_t *dtp)
>  {
> +	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
> +	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);

Unnecessary.

> +
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
> @@ -123,6 +137,213 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>  	free_probe_list(dtp, datap);
>  }
>  
> +/*
> + * Clean up the BPF "usdt_prids" map.
> + */
> +static int
> +purge_BPFmap(dtrace_hdl_t *dtp)

The function name is too generic compared to the comment that describes what
it does.  Since this performs cleanup for a particular BPF map, it function
name should reflect that.

Then again, it turns out that the function actually purges data from the two
USDT BPF maps, so while the name probably should still be a bit more
descriptive, the comment above it certainly needs updating.

> +{
> +	int			fdprids = dtp->dt_usdt_pridsmap_fd;
> +	int			fdnames = dtp->dt_usdt_namesmap_fd;
> +	usdt_prids_map_key_t	key, nxt;
> +	usdt_prids_map_val_t	val;
> +
> +	/* Initialize key to a pid/uprid that cannot be found. */
> +	key.pid = 0;
> +	key.uprid = 0;
> +
> +	/* Loop over all entries. */
> +	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
> +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> +
> +		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
> +			return dt_set_errno(dtp, EDT_BPF);
> +
> +		/* Check if the process is still running. */
> +		if (!Pexists(key.pid)) {
> +			dt_bpf_map_delete(fdprids, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
> +			dt_bpf_map_delete(fdnames, &val.prid);

I expect you may want to create a list of entries to delete, and then do a
batch delete (if bpf_map_delete_batch() exists) or a delete of each element
in the to-purge list.  That way you do not interfere with the iterator.

> +			continue;
> +		}
> +
> +		/*
> +		 * FIXME.  There might be another case, where the process
> +		 * is still running, but some of its USDT probes are gone?
> +		 * So maybe we have to check for the existence of one of
> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> +		 *     char *prv = ...pdp->prv minus the numerial part;
> +		 *
> +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 */

Yes, there is the case where a dlclose() can cause some of the task's USDT
probes to be dropped.

> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Update the uprobe provider.
> + */

I'll look at this function more tomorrow.  It is doing a lot and it is a bit
more complex, so I want to take my time with it.  One (minor) concern is that
the probnam is filled in with garbage potentially residing between probe name
components that do not fill the entire allocated space.

More tomorrow...

> +static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
> +{
> +	dt_probe_t	*prp;
> +	dt_probe_t	*prp_next;
> +	int		i, prid = dtp->dt_probe_id;
> +	dt_pcb_t	pcb;
> +	int		fd = dtp->dt_usdt_namesmap_fd;
> +	char		probnam[DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN];
> +
> +	/* Clear stale pids. */
> +	purge_BPFmap(dtp);
> +
> +	/* Update dt_probes[] and dt_enablings. */
> +	/*
> +	 * pcb is only used inside of dt_pid_error() to get:
> +	 *     pcb->pcb_region
> +	 *     pcb->pcb_filetag
> +	 *     pcb->pcb_fileptr
> +	 * While pcb cannot be NULL, these other things apparently can be.
> +	 */
> +	memset(&pcb, 0, sizeof(dt_pcb_t));
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> +		dtrace_stmtdesc_t *stp;
> +
> +		stp = dtp->dt_stmts[i];
> +		assert(stp != NULL);
> +		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> +	}
> +
> +	/*
> +	 * Add probe name elements for any new USDT probes.
> +	 */
> +	while (prid < dtp->dt_probe_id) {
> +		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
> +
> +		dt_probe_enable(dtp, dtp->dt_probes[prid]);
> +
> +		if (dtp->dt_probes[prid]->prov->impl == &dt_usdt) {
> +			snprintf(probnam, DTRACE_PROVNAMELEN, "%s", pdp->prv);
> +			snprintf(&probnam[DTRACE_PROVNAMELEN],
> +					  DTRACE_MODNAMELEN, "%s", pdp->mod);
> +			snprintf(&probnam[DTRACE_PROVNAMELEN +
> +					  DTRACE_MODNAMELEN],
> +					  DTRACE_FUNCNAMELEN, "%s", pdp->fun);
> +			snprintf(&probnam[DTRACE_PROVNAMELEN +
> +					  DTRACE_MODNAMELEN +
> +					  DTRACE_FUNCNAMELEN],
> +					  DTRACE_NAMELEN, "%s", pdp->prb);
> +			if (dt_bpf_map_update(fd, &prid, probnam) == -1)
> +				assert(0);   // FIXME do something here
> +		}
> +
> +		prid++;
> +	}
> +
> +	/* Review enablings. */
> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
> +		pid_t		pid;
> +		list_probe_t	*pup;
> +
> +		prp_next = dt_list_next(prp);
> +
> +		/* Make sure it is an overlying USDT probe. */
> +		if (prp->prov->impl != &dt_usdt)
> +			continue;
> +
> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> +		/*
> +		 * Nick writes:
> +		 * This is a general problem with running compiler-adjacent things outside
> +		 * compile time. I think we should adjust dt_pid_error() so that it works
> +		 * with NULL pcb and dpr at once, probably by using the code path for
> +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> +		 * already handle this case.)
> +		 */
> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> +
> +		if (!Pexists(pid)) {
> +			/* Remove from enablings. */
> +			dt_list_delete(&dtp->dt_enablings, prp);
> +
> +			/* Make it evident from the probe that it is not in enablings. */
> +			((dt_list_t *)prp)->dl_prev = NULL;
> +			((dt_list_t *)prp)->dl_next = NULL;
> +
> +			/* Free up its list of underlying probes. */
> +			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
> +				dt_list_delete(prp->prv_data, pup);
> +				dt_free(dtp, pup);
> +			}
> +			dt_free(dtp, prp->prv_data);
> +			prp->prv_data = NULL;
> +
> +			continue;
> +		}
> +
> +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +			dt_probe_t		*uprp = pup->probe;
> +			long long		mask = 0, bit = 1;
> +			usdt_prids_map_key_t	key;
> +			usdt_prids_map_val_t	val, oval;
> +			dt_uprobe_t		*upp = uprp->prv_data;
> +
> +			/*
> +			 * For is-enabled probes, the bit mask does not matter.
> +			 * It is possible that we have this underlying probe due to
> +			 * an overlying pid-offset probe and that we will not know
> +			 * until later, when some new pid is created, that we also
> +			 * have an overlying USDT is-enabled probe, but missing this
> +			 * optimization opportunity is okay.
> +			 */
> +			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> +				int n;
> +
> +				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +					dtrace_stmtdesc_t *stp;
> +
> +					stp = dtp->dt_stmts[n];
> +					assert(stp != NULL);
> +
> +					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
> +					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> +					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
> +					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
> +						mask |= bit;
> +
> +					bit <<= 1;
> +				}
> +			}
> +
> +			key.pid = pid;
> +			key.uprid = uprp->desc->id;
> +
> +			val.prid = prp->desc->id;
> +			val.mask = mask;
> +
> +			/* linux/bpf.h says error is -1, but it could be -2 */
> +			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
> +				/*
> +				 * Set the map entry.
> +				 */
> +				// FIXME Check return value, but how should errors be handled?
> +				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> +			} else if (val.prid != oval.prid || val.mask != oval.mask) {
> +				/*
> +				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
> +				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
> +				 */
> +			} else {
> +				/*
> +				 * Nothing to do, it already is in the map.
> +				 */
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
>  
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
> @@ -782,6 +1003,7 @@ dt_provimpl_t	dt_uprobe = {
>  	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
> +	.update		= &update_uprobe,

I would think that this functionality resides at the USDT level rather than at
the underlying uprobe level.

>  };
>  
>  /*
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 11335345a..2e7884cb9 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>  	dtrace_workstatus_t	rval;
>  	int			gen;
>  
> +	if (dt_uprobe.update(dtp, NULL) < 0)
> +		return DTRACE_WORKSTATUS_ERROR;

We probably should to do this with a callback function instead of calling a
function directly in a specific provider.  Still thinking about a better name
for the callback though.  Perhaps dt_usdt->rematch() or something like that?
Or dt_usdt->matchall()?  One of those was used in the original DTrace code
base as far as I recall.

> +
>  	switch (dtrace_status(dtp)) {
>  	case DTRACE_STATUS_EXITED:
>  	case DTRACE_STATUS_STOPPED:
> -- 
> 2.43.5
> 
