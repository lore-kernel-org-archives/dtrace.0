Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F8481B1
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908999; cv=fail; b=l48DnrHww5Ny6RZZB/w0XXRl/mxRbV3Tf1O8Tqjxy2LPeaVpLktWnmySSNIPLjm+JWXD29UTLfGbEYNtqe1MmXkHnYFKhiFW/l2MlfbWbEvjB8DRLdd5vDcyZ4aEql9pXKBkbXwRHYqpTtwTL5TJyc1t89qosglMsHyP+bNu9jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908999; c=relaxed/simple;
	bh=GzJWqg70roKUUQAU9YOeJRgtAIS7d3m6VDo+xP9nyyo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nMmxYJJKDN5QmasCBbBRDJpfWhfpAVQWeL/NZ0A04FKtOLh7CdsuE2ogVhTrRz9w0uE4pmyA7GgtL4D4IB6zyM6tKzylrXOeyfflvHlCeAS2O+e27GSCvoExPHTQKp1PHsHMsGFu+aXQc8nzbU/7GNxqjfX2DU+1WrqK1/24yqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gaLj6Euh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MKU5RBLV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gaLj6Euh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MKU5RBLV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1gW3P014726
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=68W/SEPl6r32Q7
	/AEREb/z6dL3IYupbh6wlXSyOzslk=; b=gaLj6EuhsBDuF1zThiTWF08qofNCwl
	QlbclVYGuIfUEIEIXM2z1tZXqCrgWegxByvs1o1+9Rh0Civ3RbYSgs+0eUddxELg
	Fw36x8kqCo93Cf6RZkGxY+AxNgigj2uvZipk1kQziC2gU7q2+bkMbVTU8r66UgX7
	MLJx2irebbEutBpv1WtId6aAwBWuMf/jbMZ2iD0Byv277ktJuqSYZQCxHWKeHNVW
	hRD9XjzDqyBj8x3+upCh0liejaHfhPVSerJtE7gEJkRotKfUUWUYul2rcAlTZAVT
	SWguk4Uao+nH8XFB2dph2LXsfMF4iPdeu9kK6eu/TgJhmEW4pOAoV3iA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus39fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T42U4l016697
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5ungne-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h34hJwxpwUibbd2iLlRo3k5ZUVg+3rJ9p46N2Sb8MtVOimmkI8rAQJjlUTCHN6KdQBPteENGSrp20UcJSBavtDYWVDZq8RTRWn0uMpo28AlhoCLTbrrK24ncS3VsZMv4+P59usKEzMngO/sE/mo26FDKZd3dpLj0cMb+pLziGFQ2Xgr4QIJtxKwB+KsFgRU///935JesezIqPbvEsdMjsE52YNpnJ9dWkt0yKNHAgI2rsHLQjFzvYBK8rzBag+55pSRc6RNGKxT9jaRpP8Ts63Gi6UzlHAfCzR587eyOQFPRIRQa0PNHmE+4VaZy3owbgyB8Zf/st3aNroNYy+nwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68W/SEPl6r32Q7/AEREb/z6dL3IYupbh6wlXSyOzslk=;
 b=ettcSQwCdTpy1kt128Crln5LoX/Se4lTi79ObTg6FRpew3HBAhJ8ICzqyk/ToD3/e3rOtpKLbls1tfbmT6ivr3pPg045Y7zDJvx7vy+6KVFX/OoiPXVQeiGpSP2CB3tGIMPlrI/cTVlHyhdrpIOggy42XC7DZ7d9y/HQe+WegB2g1KK4vY+zdnLXxZkJrZ7dQtbJFsnHZkpizZEdkAOnFykYtN2a5GF6xp1LohxcnpuxBQzxHAqQm5Pl53uRfX2leRgiuRG/NyTqIftVQqKqMrx71KaWxJivZ0/PPzKv1JakOUse85yI+8Nzu+b8YYn+83YF0zFcPxYecqQpnXgNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68W/SEPl6r32Q7/AEREb/z6dL3IYupbh6wlXSyOzslk=;
 b=MKU5RBLVvAZZ94RnsjRErQuaenngUok0xqISbyWez9/P2Q0AynCi59XeHlB1KHnzFaVEg77IjJCfaQ1wzKr4xS0/Y2Nqg7APV93NQ1hEGNwYXzjndBSUSSst/Fz8jft7k4TH9scmAYnfb5tYs1Y3mZ1p0E5Z4rQMFyU7Hltq7+Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:23:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:23:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 20/22] test: Annotate some XFAILs
Date: Thu, 29 Aug 2024 01:22:17 -0400
Message-Id: <20240829052219.3234-20-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:208:d4::41) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbbc578-4140-4f53-78e6-08dcc7eaab08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zp78iasSwLCoB83oHFhq5+TGOMO/4CJU0m/cRL0m/fiiaLAu/F1/itL1MTmV?=
 =?us-ascii?Q?yyuq4TxCVpzl3o3KJD8i9EYe21q0qz6gkPshTi1fALvTt9pPwNfO/6NXBdm5?=
 =?us-ascii?Q?5RWvuHdMBdUNKPn1OZo64Wcad7+oE4vCNcyIq8CSZFLIR4/h8arxR1zcNufw?=
 =?us-ascii?Q?nCsAiHmFkksmnIMl+9/LiuM7blwbh3wxFBIxRAefG33t8QvdHvNz+ZYvlEas?=
 =?us-ascii?Q?9500rRLWNzU6+oxww83bQezgEwabeTxy64FUtpPMrYQxsprSdxPoBEKbRm0m?=
 =?us-ascii?Q?NUoPjpp1zK7xMDa0HadANbPNV8UB22svRZInZmRhz2ocWEejtGEPJ48783tK?=
 =?us-ascii?Q?FzrOyBFLm296a42PXqSnJTSlWRAJiV2E5am76IwbNzVoVGYEPVhTo9uT6Klq?=
 =?us-ascii?Q?Q9lsJoVS9lrY1yDvpzcRp5V5ufsgyCwg+TG7FLhsIw6O6/w5KvtDboylL5DY?=
 =?us-ascii?Q?/G6YJ5ZgeeWRl/X9kSXBAstBFFYTzjT3uBbqwrmb9gd2PalErBWcY6t6NINA?=
 =?us-ascii?Q?e4bbRbnzxg+QIoMafnE/eqAMC3t99h6WJfGivtNICx2k00neZpFir0XAd4jh?=
 =?us-ascii?Q?Glp1dBwsLy3gIAR3jcUUjgFME42SgR+zgNBSDXWMDVy90W1BIHqQUC596im0?=
 =?us-ascii?Q?Cyl8ieO+/w+yI9t+cLoEI8VevjGkSIVamny2xXBFVijZ8E+Ib+6EnQ8mi1uW?=
 =?us-ascii?Q?TWSRWd7q9Linfu+qsw0iHA37qqKPXTVIts/GN/6nIMFUyhflzbRamjZFtU8t?=
 =?us-ascii?Q?jYP2VbrqRaduF6NFxGVtMBO/OSBvV48R9nLds+QU4gMtKYp8UFn/9neUw/gC?=
 =?us-ascii?Q?67vo78HK7Xop8v4y+VBGlzRiUoP8Z2g8wuCWZpiHMh5kACwgeNMFT2pF1Qtq?=
 =?us-ascii?Q?G4KiIhZysWTF9WwexQCPl7EH7Mu7aKO2wkPWupH4Rx5Nrz15UXXKR5lMkd6g?=
 =?us-ascii?Q?ckk5C7GIzouSgxQwG4IIJlOoV0aq84/B7V0ZNBDSGrxsIJ5vKmqsU3M0c8J4?=
 =?us-ascii?Q?89s+FRUsKJ0CVQdrWxkWN0VvVi+H9oVbaKUpFUAIPZXMFxEPTXDOuyGKSE8H?=
 =?us-ascii?Q?Oi9K/DffOeP1zaUzSt30hOyFP6OtvTAZ+B+qMHzJzMXDtq7kRuIi3v6lk8RP?=
 =?us-ascii?Q?HXLx/yixYeGUc5kxa2U4cOqLS0rueN6CfvjTAkvidWKg8dISZc/3FyEd0WXl?=
 =?us-ascii?Q?zLcvV7GRid+eOzQrjyRT5Sp13Z1/HwKmCF687QFCWD2bJoTJkvubPbSlxWz7?=
 =?us-ascii?Q?ymRinaVksj6vlcpLSJjlxJzrxWsBxt7PO/D9aJ1moJ1EjSbnsTjSP8ls3skd?=
 =?us-ascii?Q?vGg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NdXp+am2fOZ7SZ+Z1m3bWuiGzjhpSWgkx9+PwrI3XcwWAYjn1kUnG55KEfNO?=
 =?us-ascii?Q?OB56QjSpSa3gVt9BDi/1hCr0MvIXEQGJAIwEd/hmeNviqAiiYJLTBn/pJt4R?=
 =?us-ascii?Q?sZqNLL07RWh15JOUPl/6qZLiv6d3R974ocuXJx7pi9zfp0h8xPhhjW6k9TJT?=
 =?us-ascii?Q?2iczN9+NyVvGsgjXXAijqEbODcBnZi1FlzQWrIot0yYiKivzefEArqDCCTX/?=
 =?us-ascii?Q?fwt3H+MRUFX+VoQqCuHUTGzAiMQEBTs0XMZITmm/zEBYHx9P53X46V5t12rR?=
 =?us-ascii?Q?JgNpGV/z2oQDBmra4uVEv4xzbdZqlf6UOG6qd7zBrbPE5v7RfRyf2miW0cre?=
 =?us-ascii?Q?SoAT24CkZ7oMNsgkXbdlBg0r33V7EvgYo5EWhRrx3p6kfwnXdqpK8UBSWoN1?=
 =?us-ascii?Q?7D+2162VQXcWjEp9r0PZbO4WlYaGQGQvwSrpAjJzt4653yMD0ZZEa75NJctB?=
 =?us-ascii?Q?HhjnGYJYO8Ers28I/GbAbyrkJwUx4MFRBEYrD9YIYXgeCcyjgG++gSeBElVj?=
 =?us-ascii?Q?uq61jrFmOS3jwwRjxVsNBDeaKZqkGNQe/ZqMBjEsE4+kfx/H1wI6Vz/FF7r1?=
 =?us-ascii?Q?Po8HxlyRDlnWsrQkOAtXwUSv2OfbalinBJmmQFHtMT/z15E4dApmJFw/gK+K?=
 =?us-ascii?Q?sLQoTi43G4e2VXM7TvK4rKRHXwBZvQYdfkq/lncqV+D4TAcZNL57oGVM+eSW?=
 =?us-ascii?Q?4lEQjpArV/DKPV6M6+yf6yNsee+GZkKrje9sDT23QYLzZA9mQYVPuLTUqEu/?=
 =?us-ascii?Q?CWB7BN5bgdFxreHkWT3edvcFcQisGXZjyq9OFXSGGZctfYuqvAJOWHgjP4At?=
 =?us-ascii?Q?LXmQ2+0CQRViDZGJqrawm7gJx39jBFrbgthJ4HM3EXob0+UiGVchpBf2dWov?=
 =?us-ascii?Q?t5pCfWZNx8pm4gDLVQy154VrvyexPb1KEdASwA4uT+WRngtTMXlFS/Gk/IS0?=
 =?us-ascii?Q?fhzAK4AWYcX9lP/4qper0k6asm1gFKBDnirx1LHCUvKMQQMgKyeTGvvltzJ1?=
 =?us-ascii?Q?VQg5OAk+xLvjlpJ7mkIgeJmP1SVCelAxWvtbTWCUYjeONZWO7xuJZX+AXxkW?=
 =?us-ascii?Q?qKK8cLsYVAv34aVGDccL7PmFqLdIRSC1TGEamuGry8LkdEZ7ZrCVJzJEMt2w?=
 =?us-ascii?Q?iTlOQxfyT5tYSta0izdEE+91ydneXrpad8kfPQm5vU0Qes1kyEYDFaNtAWnk?=
 =?us-ascii?Q?NzB+uyI2qn7UA+FTa/IBLmaJqZhsgzE4WikgbDVxw2Fpkar372JNwAsBYAAV?=
 =?us-ascii?Q?j16jeP4N6mvWVLO0xTvlW5mdYqhsgIR/2H3IfOn6X3S1LW7+LkkKVJxS/Z9/?=
 =?us-ascii?Q?84b5Ll6E8l6NJMVslbitHBoIujKuG27EEodK9uRfIbdqeMZ7oPt/H8+SqydU?=
 =?us-ascii?Q?jW2jgKnvQ1zNcXJdni7MXmxvCWqaTWIx6LVp3Puj2nD3vy/RdWTZ5ExFuOTq?=
 =?us-ascii?Q?+y1G2QUegNUScaQfy0ehCV6kHUpkU7ysMzqhPJUkJg5In5v9pbGDgIgIrwXJ?=
 =?us-ascii?Q?5AveHSP9ozcUHASQMIPbjy4OZbWj1/ifG5LsT82fb/snpthJ0JqDYXaKWuVU?=
 =?us-ascii?Q?MPKZLDWiKEKFgk6A64lZZR9GoxpsvTdeqWEK0NZk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EGeEk3RPqgFWQHLsnudL9MixJEzCp9QnzCYPPWcfGJSEe8DqCrsJPpafFKHgux0K2wso7ki1FR5KsnhRLh9Lf36OES9qLycFXsKIanNvkR9aMzJE07I2FufjhvHxuXwHtDl27sjCkx6RW3z5Tlx+Sv68mWdY9qb1HHW0MaZfylChuA/zAZJf3Rxzjm9I7p/0RGo9YtuIr9dnpjwfv2JMSC4t+4q9ZhOOKp0Q/EWRBVvY6+jxv8yWA6YcDUqdjPDIo4dqk+JGsunzZ2JrOoidtxO1KuFXRQUoMT9GtaujF4cjhY62g8ytjmR8dPyf62qm3HQWfDIJXcqZytpzpGr9w3PkbxgfPPtk3PofT5NT+R0ky+BkZUOHdWUNLJE/A8EC42ZWtjSHc/w1WfOaUr4bj0g9tyxylzTr9aIFbR/KzPV4WNnj49ZYL0pylKN7slImMDRXPUldRrzaCrmgy1ybeTeJ2Qw1lWGWRwiTyVZaWwQyqUrycB6EljNtRCWNF+G+ulAteRgfzpsMnuihBPFz5TNxVM2QqpUb/1uUT+CkQLgiGeA8zHqAuO391zvLIIWER0SRvalGgwqQABb/y4lpcHgSCB/WzULeaRT/i8/IggA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbbc578-4140-4f53-78e6-08dcc7eaab08
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:23:08.7163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9RFsfIpQWbmrlPm9oxdvN9gGNVutdDkScSHu/dZtvJdQJEnNqBtu+BG1VQM8dkgp/kKQggpUedeh9zC+7LgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: i-o58ALSR3pMHILPQPUvYtKA1iQq-lxD
X-Proofpoint-ORIG-GUID: i-o58ALSR3pMHILPQPUvYtKA1iQq-lxD

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/assocs/tst.invalidref.d         |  2 +-
 test/unittest/builtinvar/tst.ipl.d            |  2 +-
 test/unittest/builtinvar/tst.ipl1.d           |  2 +-
 test/unittest/builtinvar/tst.vtimestamp.d     |  2 +-
 test/unittest/builtinvar/tst.vtimestamp2.d    |  2 +-
 .../lquantize/tst.32bit-bug26268136.sh        | 29 ++++++++++++++++++-
 .../printa/err.D_PRINTF_ARG_TYPE.jstack.d     |  2 +-
 test/unittest/printa/tst.jstack.d             |  2 +-
 .../tst.jstack_unprintable-bug26045010.sh     |  2 +-
 test/unittest/variables/bvar/tst.ipl.d        |  2 +-
 test/unittest/variables/bvar/tst.vtimestamp.d |  2 +-
 11 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/test/unittest/assocs/tst.invalidref.d b/test/unittest/assocs/tst.invalidref.d
index 0ed17959..34367c6b 100644
--- a/test/unittest/assocs/tst.invalidref.d
+++ b/test/unittest/assocs/tst.invalidref.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 no support for index of assoc array; last_cmds[1][3]=0 dumps BPF */
 
 /*
  * Test to ensure that invalid stores to a global associative array
diff --git a/test/unittest/builtinvar/tst.ipl.d b/test/unittest/builtinvar/tst.ipl.d
index c2b9850f..41a89b00 100644
--- a/test/unittest/builtinvar/tst.ipl.d
+++ b/test/unittest/builtinvar/tst.ipl.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2: need ipl support */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/builtinvar/tst.ipl1.d b/test/unittest/builtinvar/tst.ipl1.d
index 1b489229..654b16ce 100644
--- a/test/unittest/builtinvar/tst.ipl1.d
+++ b/test/unittest/builtinvar/tst.ipl1.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2: need ipl support */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/builtinvar/tst.vtimestamp.d b/test/unittest/builtinvar/tst.vtimestamp.d
index c9e2a112..11ffae7b 100644
--- a/test/unittest/builtinvar/tst.vtimestamp.d
+++ b/test/unittest/builtinvar/tst.vtimestamp.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2: need vtimestamp support */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/builtinvar/tst.vtimestamp2.d b/test/unittest/builtinvar/tst.vtimestamp2.d
index 087a11e3..68a57ea8 100644
--- a/test/unittest/builtinvar/tst.vtimestamp2.d
+++ b/test/unittest/builtinvar/tst.vtimestamp2.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2: need vtimestamp support */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/lquantize/tst.32bit-bug26268136.sh b/test/unittest/lquantize/tst.32bit-bug26268136.sh
index d5f143f5..91f4b65c 100755
--- a/test/unittest/lquantize/tst.32bit-bug26268136.sh
+++ b/test/unittest/lquantize/tst.32bit-bug26268136.sh
@@ -5,7 +5,34 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
+# @@xfail: dtv2 since BPF verifier fails, see test source code
+
+# This test passes with BEGIN or even proc:::start but BPF verifier fails with proc:::exit.
+#
+# When the BPF verifier dives into
+#     uint64_t *dt_get_agg(const dt_dctx_t *dctx, uint32_t id, const char *key, uint64_t ival, const char *dflt) {
+#         uint64_t *genp;
+#         uint64_t *valp;
+#
+#         /* get the gen value */
+#         genp = bpf_map_lookup_elem(&agggen, &id);
+#         if (genp == 0)
+#             return dt_no_agg();
+#
+#         /* place the variable ID at the beginning of the key */
+#         *(uint32_t *)key = id;
+#
+#         /* try to look up the key */
+#         valp = bpf_map_lookup_elem(dctx->agg, key);
+# it tries to look up the key.  For the first argument (dctx->agg, where DCTX_AGG==64),
+# the BPF verifier shows
+#     (79) r1 = *(u64 *)(r8 +64)      R1= invP(id=0)
+# Since nothing is known about the first argument, the BPF verifier complains about
+# bpf_map_lookup_elem():
+#     R1 type=inv expected=map_ptr
+# In contrast, with proc:::start, we get
+#     (79) r1 = *(u64 *)(r8 +64)      R1= map_ptr(id=0,off=0,ks=12,vs=56,imm=0)
+# and the BPF verifier is then happy with the bpf_map_lookup_elem() call.
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d
index f04f9778..d2fccff7 100644
--- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d
+++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 jstack not implemented */
 BEGIN
 {
 	@[jstack()] = count();
diff --git a/test/unittest/printa/tst.jstack.d b/test/unittest/printa/tst.jstack.d
index 4ef1ed58..7a404a09 100644
--- a/test/unittest/printa/tst.jstack.d
+++ b/test/unittest/printa/tst.jstack.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 jstack not implemented */
 
 BEGIN
 {
diff --git a/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh b/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
index c5fca2a5..e6d8b43c 100755
--- a/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
+++ b/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
@@ -5,7 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
+# @@xfail: dtv2 jstack not implemented
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
 	exit 2
diff --git a/test/unittest/variables/bvar/tst.ipl.d b/test/unittest/variables/bvar/tst.ipl.d
index a61e3b5b..7e2a432f 100644
--- a/test/unittest/variables/bvar/tst.ipl.d
+++ b/test/unittest/variables/bvar/tst.ipl.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 need ipl support */
 
 /*
  * ASSERTION: The 'ipl' variable can be accessed and is not -1.
diff --git a/test/unittest/variables/bvar/tst.vtimestamp.d b/test/unittest/variables/bvar/tst.vtimestamp.d
index dc985ad1..b72eb8a7 100644
--- a/test/unittest/variables/bvar/tst.vtimestamp.d
+++ b/test/unittest/variables/bvar/tst.vtimestamp.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 need vtimestamp support */
 
 /*
  * ASSERTION: The 'vtimestamp' variable can be accessed and is not -1.
-- 
2.43.5

