Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F3212568
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 21:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760045632; cv=fail; b=oz8mpflgFngdVgnB1ulRoQzZ17NjJrEK9GxL5yKs5twnCWZi8qO6pg4gqJKcRRGq7nibsOQNMTnJLRqtf8D3m8YTh4NYnLO423XSGd1+9/JiezOGxzelO4K0ZZohNzzd1BxUovDEd5YRsjUW00MbiHR2nc23Cwt+TUEEBzuBdto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760045632; c=relaxed/simple;
	bh=chrtdypmlIJ6Ln+yDX6MEy8OVyhBTFIqxQImzLK3HJ8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GzxIQHDYE/Rr1fxGeOUMZDy5UkfU6r/vEQZryCFvGEyjl7/+NkDsGWUsVrh1JTQ50zsV6eHxKHKIx49cCS98zBfSxdiOJEt+rKvB0K8+8dyQ5zWKXEwjLnRgWljxsUCEZHJxC1OJ9xURbF82wREEDC18nV0woTZRck7TvdDg+nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HvlL+Vde; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fiV/thMu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HvlL+Vde";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fiV/thMu"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Kg3p6013734
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=/BafP0NuLIOidrfuFwGi2RE9eIv+SEISm729gF2gNnk=; b=
	HvlL+Vde9EvAE2O1Za4ihzLUcsuyTppI9dBGDaVmxTyUrpDIPPYbqMKwV1njrI3r
	Z/gOPkQp6xT+fAo1cZWxd6uqHmYsiljX/W0H+yT7L01a5mOk+NWKBdosk1vVekCI
	92MSketqWSmH4m329bLbXifMsWF5DiNDvJuqPvO3Vnaqf32FT0q4akJ0Ds9Fcfnn
	J/un6NTuB+rDjGlv37cgB4GhPwTVlqcDJSn5Jlttm13MCQG5+JfiYFuBgx/Tmd4E
	Yk3vDv4qOUGimHX2J6ePizwGrk+rOZ3IebOmVjdlzPA6919MV14XTMYYQ1TlznUl
	90yjWgGEs7GNYI8XdHgdOQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv8ptjpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:33:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599Jkpq4010286
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:33:49 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv67fc2x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BO97d3KJmqwlAeW7CTzweEwRScrUbZG7n9EAF/Qo7zUUguxt5b+9tkLD+NEq+V/1qHZIYdOD0LxMGOkjpe+9oHVhPH10mZC6hAUP8jll5Qvgl0Ok3tv73dufGq0Kw6MnrhlQcKf5V0gTfC1LT9JuvqtXGJZHbOcxQ/u1NsnhJvxznNFBi/Ocrhtff7JiwQkybpJVkQOCWYmCtGdPZr9j9fmfN2Yl2T79G7sZ+tKaZAYHNK5RrepoSyXTIT8PKNoP2t5UPpziISJIUGIcdG3Ol828hZ8/Bgx0cl0EW9bOMmrm1uO7pTWgpjksYnSCtu8tXzwU2Xm9FS552Lwie9+03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BafP0NuLIOidrfuFwGi2RE9eIv+SEISm729gF2gNnk=;
 b=EIH9aY55J8b9J/mx19HeAbOlmkQPRX+iqRy3jNrAOBW+n7+1eN5kabeJmiyFhWl4MXduKc8R05AgCq9UQAqbUzt0hjqMB6W+/QFGbTjkhO0KAkvlZQsZ+OGk/g6idfQeXcalWH1U4P7SgGhvlkHztM/i+Pi523ckQ0pov+l+Omz67+2pL0oy3JiFpCDffxUQ7RyNxsqPFtwmOQLRD5wcLzlgWDY3iaCJIbMsZQzfTS1brIU1d0eDRdszyWn+nI++wuOXr4vlYckm/ozH7hFgzS2j68cscJx03n+wWDkY08r6jhwbmS8gz2PgWbrtf2/nxHmi28BcSDNn5UVRe7Yirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BafP0NuLIOidrfuFwGi2RE9eIv+SEISm729gF2gNnk=;
 b=fiV/thMudZLTrjWQq61DkmZDnAuQsEnfDpcBK0l2oluGnXNY+IuZKd5fzJ8fflxZZcimXTQKxEjopI/QiQQ9PZorcj0IPfRgy0KY9NbqFGA/NtdiQYN/RNLXtcRU64A+q7H0aj7D1vVaYzJIWI3ujDkipYRcPFuk/5hgjgXseBg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB6421.namprd10.prod.outlook.com (2603:10b6:a03:44b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 21:33:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 21:33:45 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: Account for large stack-limit kernel parameter
Date: Thu,  9 Oct 2025 17:33:42 -0400
Message-Id: <20251009213342.31010-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc641a9-5ca0-45c0-2a46-08de077b8687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ve6UfOwDjS9jjBs4+8nUM1RV2mxlkucggvjyMwkZAuGPFYGyoBFQgup7UtEv?=
 =?us-ascii?Q?8u32UjCAia3SIZJ8wMJ8lg/DSotdVQcdQlU/NeM8qDXZYOK/2s3LotYxIxMf?=
 =?us-ascii?Q?rukjo1zLPhD2VtlNh1VTfTlULDPMRNLpfRTMJiMZYs7HvQFR/UYsdhKhEswt?=
 =?us-ascii?Q?vOqME2oExgqbnvsWwb4SEMnlsapozKpgXyaOn7cpuuamU720ILJzUOIAAU/7?=
 =?us-ascii?Q?YdOEA9a4fFWa6C4Ahcd/LTn9t+7TSNVIPYaX8lHP3Q2MbxK8YOMi9+W5CU9u?=
 =?us-ascii?Q?p2MkFK0/sXW2qLiVh9ynDbofJCBetjQDF7YoFnKg25hRisdrQlQG3+83fHb2?=
 =?us-ascii?Q?NHH7ybB6DZnuN3Les9CkOE/981RmLyf50Q8otFflJsGrTFPXj1SvJyZBbyd+?=
 =?us-ascii?Q?u+rs7F7iwOeByaOhM27iyV4pvryiSKhAQ5VMKzi3q38eBQrTO84VDFe65wF7?=
 =?us-ascii?Q?I6We7VZaGNT9r1Nl97sZ9DjCavj5eT+AFfZ9Vf8cHQKlLifZvpaZn2V4Hbh3?=
 =?us-ascii?Q?c0l/MrkiIQNOA45tZkHFWCowULIA9uhUsUn4g7wBc5tks2NryUPDGv1tAHA3?=
 =?us-ascii?Q?4zvWPxTvd0IRRfYTiLStcMU1+pdepGDUI/XNKjCBKsIJawN9lnWpzNnYROTq?=
 =?us-ascii?Q?9/dQyXcObYhmhaVS+PrWy3eKrgYYSD6++44em30QmolKQYixN0EC0jyE8M7g?=
 =?us-ascii?Q?nyKe4B4mIBrrdlRbLkyhLatwaU4re9VzJMgu+ugEX2gdWwkrzVvTd4/cSF4S?=
 =?us-ascii?Q?41+QuBXAEkUo+sKen3n8LUjKQ27gL25Fer3YKy1cHGoET4l9Zek1HKGpl1Hc?=
 =?us-ascii?Q?gEXR19I231tQ0RKr+hL3S3SzSzUh9BJN4qZMSynuep1/rDx1T41zpAeL7qyC?=
 =?us-ascii?Q?9wfg1+ZlHaVH/zM8dN+X8hGuBNK3thPNq16TeXNWsZZ4tVekJJMOqDQTufyF?=
 =?us-ascii?Q?Dg+CImqHohElNRa28eaeCUzSU0m/difSx057aFvtj7iFcnmXsY55WpnvESI4?=
 =?us-ascii?Q?94mPvON9oMW98DyICkj6/i0nOrOWU02bQcER6ib59P7LSeDE18ThFS/ddzuT?=
 =?us-ascii?Q?0LIb40fz7btpWO1PSdToyKobJDN0IUqdovDXjG015FV+ZoRhAiQp3nAYMxHS?=
 =?us-ascii?Q?sP5tOBulxndWtMnkO8LEf+V4n7ctQCMOOW3geDFT73o4QefW25pEaSlr3Gpo?=
 =?us-ascii?Q?c0TLp1wMq9KScvwCzXiBaVwyOKxQjpwv9/oRVcbG3Xn2uSJ490QTVa+C/82K?=
 =?us-ascii?Q?Ox2OG/IBm1hK/UCXTwObb/taBk83/gsO9qMyCuECKR/b4OZ3cd64vMK3uv3n?=
 =?us-ascii?Q?q/wUs3LV+k0w16nZlq5IFDJEKR+oANljZhJrycKFIWB9Hhh7hYk/ZYnukzgI?=
 =?us-ascii?Q?SOhUAGFS7rJWiVlfU0j9kTh9owGMD1vzAxZG+D7KRaKDkCF7guqocjJ7kulj?=
 =?us-ascii?Q?UkcvSQHUHT2/W8Cnrqj3TP7R//mUe9kJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bvd6FXXihifp6/Jhezj1oQJtCe1LoVO47Ymye2wkyr+NNAvn/Cx/LSUiPlJD?=
 =?us-ascii?Q?FnjC+oA+s7bQWWtlGryIKFZElakR51gTa0g6z3P9zjH99SP7N8w8d/POQ9NO?=
 =?us-ascii?Q?s1PQImFf1/jaTr0zO4z7VHrvslOBM8nQ2ob/80Rhc/nIoKG622SQ4fi7eTZb?=
 =?us-ascii?Q?yhlJ91G34X/51i5wn2M+bmILbrfYqLaotBsI2DmqViQFDTux1fOLAZDfU1Ky?=
 =?us-ascii?Q?8E5kf7FaAh9iDmZDvKx0kwJWXdLPxuBzw0gvO3wBd7NPJu05eW79JMiTXARC?=
 =?us-ascii?Q?pJ34ogifynrnhgy+5Ao/Q5VK+brMWJoi1O7uF7df/lMlarrnil0a63gtCsE4?=
 =?us-ascii?Q?RuH7pe8F1PIYGUgS+jOo3s85yWz53ztZT/ZCJoKJ8sUtmA1l52HFrNrWACor?=
 =?us-ascii?Q?8IY6z5kDIePGy7RrgE/Po5QBTWXq2Nau9UgV6V1pUlbguhiTPayDMW8TIyOs?=
 =?us-ascii?Q?TkSvc0oSyGu4QyaCQJeYuS2L1Yko5cFyUhGA6UessOwBTEAMTwmZsLFzn0ea?=
 =?us-ascii?Q?55e2AVbdkKVpT13Ki8rT/gV4CNKzp8il4H863shid5OTaiblzra7COrSpKfQ?=
 =?us-ascii?Q?kAL3nXr87KSFCy+qMWmKvgiD41DjWw4lo0FxEqInHqpF7mp/SPwXylzu3wZB?=
 =?us-ascii?Q?0uJGJPU6TtOqLh9YBLAIwTcgEegKw0P6r0EcgQzDFnkdiYGswi35pgEjqT1n?=
 =?us-ascii?Q?fx1WBSO9NRhKPMruSWTCBQFiSYsmE9bNSRAa/0g2UD4eWdzw02UfDMgDm86X?=
 =?us-ascii?Q?sICErB6o/ZGs+pX+cOVb+NJVk0sCuPpuB7iax88LxDN4NNkjRyeczPYO5DPE?=
 =?us-ascii?Q?k5nvu+AUT5Il/G/6eQjnanQyuc0x5VlIC1Vk7WcN1tiB5KwdCfTJeYmVgs7D?=
 =?us-ascii?Q?UPdSMRDSugMtWjfvTi2m0y5qMoBvsK4+s0RLJbwVDhkT5937W84piS8jDpnw?=
 =?us-ascii?Q?qCIxZ730nTxUmnuj2jY1UGYe2AJsE+CgKgCHJDUj40ipy4ubM4HM9F4CB9ng?=
 =?us-ascii?Q?EFpIb4yTLagmz9LbaJd66dGVNq9Lugp82MRKhILFSzx0xXMd6u2yOmzv9q3U?=
 =?us-ascii?Q?CUH1lYIPuSrd7V5geF/MQY7Lr5joH3zb2vuJ5MjbsqVurXJQRUV/rEXWQA9o?=
 =?us-ascii?Q?9xjegrEdZ5sp+rbld5ymVBuD3ijEeoB85YPsi7RFRXakYT8/FDDum40r04Rj?=
 =?us-ascii?Q?D4N0Iw6nT2VN82yXCiN9ECXSSbo7N1Wv8h5oqc8PsVzHHEcUPUnyVL8Lb4oU?=
 =?us-ascii?Q?SkVONoYqEzKLUY23jTsU//8kI9ddpV9FTYeuOrtFTehEvcejySJ/KriOqf/T?=
 =?us-ascii?Q?8Myj/yKa726IBTBtKcmKB2TRDbuEwViQosc6TZyvUsw3fpf2K0zLb4b4veoz?=
 =?us-ascii?Q?T4pFyU6DIA3PlWa5FH4LRYj6mzUqa+MmE5tCMwS5y3MsX4C9wKvAKcho+s0U?=
 =?us-ascii?Q?FdyI6jTymAfWAAyy3tx84tMoewBLSgrhWdlCJI5JdgHl8ulEcPfHebBkUGRL?=
 =?us-ascii?Q?rDL5NSst0+nbkhOX0di0/d9Sc2y7vE0doEbMfKF1K9zL0xZ6ISE4yUwjpKLP?=
 =?us-ascii?Q?aaTPK1HSpd6RMgQoHKNqTHbWtWNUzh67kP34ecYQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BEbZKJCnl/wW18GyomtJFbf/ClJRlt01+1h7kA4QdysSLt6r3cPKs7sqkJUC15FDHc80z963AEhMCNkTCT3FV/0pQurhangIADs0b/Ps1GlwxuU+Sj/UvX5cJiUwf4h0COo43NjNhoiefH4uvpCk3LEsP4wpI+VufAFSg2d1QIQ6RR85KF4WAEuBKGi/6V3hFSv3DWqzOzLlCNDIgVayeWkffCbOkN7PevYj4+cUr57mcr82mtkzr9hYKfAFilOnRE5XaItXZCPkTqreN5PiTOwWxCKHt/q8jMcbRU2u15WmL09CFXKe3KzT3P3KcnHC2TJbNsOlv0k7MhU2oZ8fSpSkptThSVPU8juU/1SdV0iRmbqBuuzVBy2SFi9QVkk+YyxwsuOqQvNf5ICJoOGMZtUu8bak8MZCeqHVZBVczYYLKU5RdcCQIDsOh0stw1cmdKsMUGxMx8XT1PzunQaOLfFo7EhBsn0drQHMhdt96bKSMJ+xTYdcfL9kklFLMJGi+84XpZSWEluDIpnU9jwL3c339g15679k66qcNPDX8PVT/92BafFcYSJ0N1Ie2bFX7g+dVUI8/hhsqzfkdCbBgLaqq/66usjmhVR2yMe9B3k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc641a9-5ca0-45c0-2a46-08de077b8687
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:33:45.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJzBV/yHwVDzBmN6fwTCAXj6L3r7c1/kF4DlizFJPfO22GrfJKFHzOO/aOGB/Pu9fssWuds/vgoGMU7EV3NdDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090130
X-Proofpoint-GUID: sa4ixFF8fQREAcllYNA6fauz-WSqXbJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX/6aNEBo9WX9p
 QU6w8INuf7oGCcnmGe1rdjgmHD7OOdVIPE49nTkoJ/MSGlZIFwJDoWHappxJ6FnAcIf9zDL7zsO
 FpjQm32WPbuHlktCNLX4jBnslXazxK0nKxIZSy3uyczPYP083NvItBzGk3Jv00us5vqoYxRKqPR
 6tl9MS98EbglBbiCiV4SBjBxN1anegikUG9WbKJICTZfPH2RV251DxrvT8R7moKRImgILrexhlP
 8GzIY+Dg1xwcWFx7MGu8AyaVlQTfxnsKA9mzAi0j6oNDSkG0tuE+o3UWkAA/vDV6i6pz44ws9cP
 0aVExQI+1y01IV1hF9q8gMJbbm+45TbDBI9egeZWDsTiwSjfqtOARL4apQZ9gxwEcVdiX+mYdU8
 GUvxHvIvEHSKqQzlxseNdbv8eOPKjA==
X-Proofpoint-ORIG-GUID: sa4ixFF8fQREAcllYNA6fauz-WSqXbJ1
X-Authority-Analysis: v=2.4 cv=U6SfzOru c=1 sm=1 tr=0 ts=68e82a3e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=AjYYjH9JHWbp5wQmh74A:9
 a=HhbK4dLum7pmb74im6QT:22

From: Eugene Loh <eugene.loh@oracle.com>

In commit d0fdeec50 ("test: Fix some ustackdepth tests"), the test was
tweaked to check that the full stack would be recovered if the kernel
stack-limit parameter were increased from a default 127 to greater than
about 190 frames.  But this does not work if the system already has
reset the kernel parameter to a high value.

Change the test to deliberately try a "too small" and a "big enough"
value -- again, ultimately restoring the original value.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/tst.ustackdepth_big.sh     | 106 +++++++++++-------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.sh b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
index 4ce53d929..aeef9982c 100755
--- a/test/unittest/variables/bvar/tst.ustackdepth_big.sh
+++ b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
@@ -23,52 +23,82 @@ cd $DIRNAME
 
 orig_maxstack=`sysctl -n kernel.perf_event_max_stack`
 echo kernel.perf_event_max_stack was $orig_maxstack
-trap "sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
-sysctl kernel.perf_event_max_stack=200
+trap "sleep 2; sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
 
-$dtrace $dt_flags -c $TRIGGER -qn '
-profile-1
-/pid == $target/
-{
-    printf("DEPTH %d\n", ustackdepth);
-    printf("TRACE BEGIN\n");
-    ustack(200);
-    printf("TRACE END\n");
-    exit(0);
-}
-ERROR
-{
-    exit(1);
-}
-' > D.out
-if [ $? -ne 0 ]; then
-    echo DTrace failure
-    exit 1
-fi
+# set bounds on the full stack depth (which is ambiguous)
+lo=188
+hi=192
 
-sleep 2
-sysctl kernel.perf_event_max_stack=$orig_maxstack
+function do_dtrace() {
+    # set the kernel parameter
+    sysctl kernel.perf_event_max_stack=$stack_limit
 
-$POSTPROC D.out > awk.out
-if [ $? -ne 0 ]; then
-    echo post processing failure
-    exit 1
-fi
+    # run dtrace
+    $dtrace $dt_flags -c $TRIGGER -qn '
+    profile-1
+    /pid == $target/
+    {
+        printf("DEPTH %d\n", ustackdepth);
+        printf("TRACE BEGIN\n");
+        ustack(200);
+        printf("TRACE END\n");
+        exit(0);
+    }
+    ERROR
+    {
+        exit(1);
+    }
+    ' > D.out.$stack_limit
+    if [ $? -ne 0 ]; then
+        echo ERROR: DTrace failure with $stack_limit
+        exit 1
+    fi
 
-if echo "Stack depth OK" | diff -q - awk.out; then
-    mydepth=`gawk '/DEPTH/ { print $2 }' D.out`
-    if [ $mydepth -gt $orig_maxstack ]; then
-        echo success depth $mydepth exceeded original limit $orig_maxstack
-        exit 0
-    else
-        echo ERROR: $mydepth does not exceed original limit $orig_maxstack
+    # check stackdepth consistency
+    $POSTPROC D.out.$stack_limit > awk.out.$stack_limit
+    if [ $? -ne 0 ]; then
+        echo ERROR: post processing failure
+        exit 1
+    fi
+    if ! grep -q "Stack depth OK" awk.out.$stack_limit; then
+        echo ERROR: stack depth does not match stack
         cat D.out
         exit 1
     fi
-else
-    echo "ERROR: stack depth does not match stack"
-    cat D.out
+
+    # get actual stack depth
+    mydepth=`gawk '/DEPTH/ { print $2 }' D.out.$stack_limit`
+    echo with limit $stack_limit got stack depth $mydepth
+
+    # provide breathing room between dtrace and resetting kernel parameter
+    sleep 2
+}
+
+# try a stack limit that is too small
+stack_limit=$(($lo / 2))
+do_dtrace
+echo "   " stack limit $stack_limit is too small for the entire stack
+if [ $mydepth -ne $stack_limit ]; then
+    echo ERROR: $mydepth does not match $stack_limit
     exit 1
 fi
+echo "   " success:  actual depth matches limit
+
+# try a stack limit that is large enough
+stack_limit=$(($hi + 20))
+do_dtrace
+echo "   " stack limit $stack_limit is large enough
+if [ $mydepth -lt $lo ]; then
+    echo ERROR: $mydepth is lower than low bound $lo
+    exit 1
+fi
+if [ $mydepth -gt $hi ]; then
+    echo ERROR: $mydepth is greater than high bound $hi
+    exit 1
+fi
+echo "   " success:  actual depth captures full stack
+
+# restore the kernel parameter
+sysctl kernel.perf_event_max_stack=$orig_maxstack
 
 exit 0
-- 
2.47.3

