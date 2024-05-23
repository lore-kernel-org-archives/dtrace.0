Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1C87D3E6
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716487031; cv=fail; b=Cr2P0v+8vmoXaPUZoGbo+gH1YhxjT1DDEZYmxJe8Ibs8DPt/x1xhHACLqGH5EnoTXVkhynB7mlSNwqjoHilww1oI3+sbLEkBBYPEuQuFe2LzvP054z82YUwhObF7YByYRHqyoCzHdFNn6jzFBEMaeGA+XIX/eRtq/ZKgOl3LLi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716487031; c=relaxed/simple;
	bh=jNiGtTPyXXZvAZSH4l5/ixkjgtZC4Iq4f5kKFg0ggNw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MLs1uGvfNentyn+avjqxmAab8SCTmDxsR93l4AawcXUcu1Zp0brV8QDh/NXshP7nJxKaU9oy9x5UYxYRKrNG8EjkySk79va2ijHLxV2zXBmLulrZ48w4AXrjXERrQum6RNTgNpX8ujeUp+Mkl4CHqHvN35ULl/lXmGpFiaonuUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OP0RFYoG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cLvOrtWL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OP0RFYoG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cLvOrtWL"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NGDoDe013205
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 17:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=AE54MgQilAbVrMpaomZl7gPVxagwf7qcVSVjtyUuIRc=;
 b=OP0RFYoGdQA/VNZQCerKUVX5OGwCXW2Z2R9sOyfhohuFaByE7aARNuqG2KZOoJpYA5t8
 DnTDIvthd1ZbkgymMX5mQvdidq5pKVL/WD8wEq5DwWKPmoIeKBGCsi8fEVd5txn0hBAi
 84pejKbJRGbTK/8l1qkG45ufouuS28ZabEn82UTyIE8fL71IZw2OIElrYybc07B6vEbu
 wHFRnnL/NZEaUrQuMqizUTS6iLr3TwTgoNF6M1B9mTFrWDhhCzOwCUHR977o7on+FYH6
 zobfRvjJbtb2W+DzSDMJ3Pyr1YNqGgBHBJxiUavoZlhhDoXhyzIlHVJNk5GvIAE8RLyP wQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mce2xsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 17:57:08 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NHugIx002741
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 17:57:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsaw79t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 17:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=of7BHqeInXM8AId8mXF8+o+RuXHc1C5y4jVGyqoYYB+GEUCojXaH5w22wolUAcAxglTd5XR79apgT7Fwyw/M/cPVyQwiohNBASe4HYoFge4Ynmj/bMsYS78AsnYjRyC/SHOFPM0Ik7H+PRQqaDfiIZM1r/ljtX3QA08kai4VfETJ4bqOapZ5HrDKS4ZqvCLeRH1Wg3LoSoG7QweKoucmjyhgAdlemy7dApqnUub3IZNbqrh5+8UnTlSYref5g6xy4UECXKbC5D8hxIjUiHZQagjJ09EVuyO76LtRfaDQwHz/XY5gTU/39VS7xiqXp6rSwlenB8iV51MAoDzzQA36Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE54MgQilAbVrMpaomZl7gPVxagwf7qcVSVjtyUuIRc=;
 b=Q2TnmOy9mfPDmQUbxog5N+DzMncO78VdxWa7V9wQ7rx7Dg9bdscDggGr+3wNdw7JeqgmrbFFvdvXhBESB+ds5uSflGKRftqxmywQHK9SddQ7TpkPlDOepa92RWg5efae66l7URh0EzZhrL4q319EuZeqZY+x+dRSQxrV4UZn8vXB+UJX0ezQFyi79usGeD1bhQUuvBA54ZWNZNiWUXtePTWYxv1vznE5+1ITW0YNNFY/FFJgnNZVDiWsusq+jZ44aWOHqOrP4ONUgW/QxuEJC8/dL/B22r/ul9A9W4qrHg8AAV516IVL9u6qY7yiQ0/rfpmkfnmyaNICeb3PNYvIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AE54MgQilAbVrMpaomZl7gPVxagwf7qcVSVjtyUuIRc=;
 b=cLvOrtWLo0bPUDBM/QgeAKvtsrxFaRz5PMBGMuj1+LuFROM/MszMS6/0agnc5oJr5m5OMRY2NLjrDgesCD9nk2eIWHr/t+/Mp708f5vfDJxEHXE2UXwZ//CYmd5RwlHweniwJS0xjrcl+TEupSZ1n7MaEz2vyOxQCaZ5WfjQFGc=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by BN0PR10MB5080.namprd10.prod.outlook.com (2603:10b6:408:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Thu, 23 May
 2024 17:57:04 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 17:57:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] build: install sdt*.h in /usr/lib64/dtrace/include/sys
Date: Thu, 23 May 2024 18:56:54 +0100
Message-ID: <20240523175654.462908-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0042.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::14) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|BN0PR10MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb69b13-b20f-4413-7894-08dc7b51c13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8QnJw0qlx0Xbmz8tsEzb/RepieqqIgdE7PjQpTmNI3+UQxk7+rlRsCfYVrZF?=
 =?us-ascii?Q?mYVuD2mWX4sG9npBmtxUmmP7feR6M4v62N+0cDLj8TFaY9rlBqmq6CQ+4U6x?=
 =?us-ascii?Q?7gKUL09BwSjIpI0zyJG6iaOUoykkyIC90s0XP0ot5Kf16gfWs/4FrAd4fubu?=
 =?us-ascii?Q?CsKeK1QlLxy7kM0mQhdWZVwWKJIuZvCr83SeMDkMTfHzviNHC+8g2+R4mz+t?=
 =?us-ascii?Q?ANKFOOWgdr+aCngoTahjumTT8KnCb12Ai9hmToTw/Y44w1f7Se6LhQYJfw+O?=
 =?us-ascii?Q?sSReETGMCjeC7s5s0qBZ/Q5wPfuqC6nxaobI/FR1lQ77KyJmhtm2y67rlVkb?=
 =?us-ascii?Q?9GVB+9BqvrOSy2/Odu/a3w7Ic0vBR772jKqZhnJnAyhPQY+tSJjviQ2/XlOZ?=
 =?us-ascii?Q?jOKPhM7wDr/ic41GtmQfpbvc/bR+xvw0GnuqxQS5dQQTI77wRu320QwMFsGR?=
 =?us-ascii?Q?K8flSz9nn31FkvmNAbsY3x3jwDvaesPwqXVjucZ7P/8u1d/eKuJNS2+yKxoH?=
 =?us-ascii?Q?gmWTKXTlYILfvZoQyY/vg9tjQJqOkRLQxRb6zYpJ5lVPsW/YFJqQPXmqD3bL?=
 =?us-ascii?Q?E6mFa9kftX9svS7D56tUo9T5N9cN+r4L5ypoi5iDqIz3zWzh+ZfDrq4s6o9n?=
 =?us-ascii?Q?iGeSDx1WAxKQ5naW9mM6199HBEhs50DLIKikGfPnSQULv0YzpbRexnrA/olu?=
 =?us-ascii?Q?NiH0wdDlZjz8wIxNZj+csRE6qkR4OsU6qU/OTYVgnzqrg490Xxp65A5RR+jS?=
 =?us-ascii?Q?D7lHEWZp29vczgFKppDptkhWZyQx9b9mEOYUx/jqtH6HCoogD6C0bn+kbnS6?=
 =?us-ascii?Q?FyBdxF62IrfWQScDRsL9F8lH4ahynO3dba//fhwoRAJToEXNERHrTCxSGw80?=
 =?us-ascii?Q?8KR3Sdw7YzXowI96x6dCBAFgqPM3j+4jHNF2hhTa1OZvZuUnjckpTOqENEE7?=
 =?us-ascii?Q?Ywmoj29fbp2a0a3G3YtelaF1GcO0qxE1niauGlpV9HpGvVb4BEraxzoxI2+N?=
 =?us-ascii?Q?Zoy5bzJaDljVbqtl939Xq2PZEc+Y/2o3xLvko0EX24cE6HoP4WpamPYSK/eV?=
 =?us-ascii?Q?Hrx8SPryhpY7GSmHYHEKkTSF/tQj1RsatQUl4F7gE04G/xM8yYQfj2GZTg1x?=
 =?us-ascii?Q?Nq9llOBf771w7InoM5Kytg/myw74yJG3Lf1DqOLC76a2y+rymQNTrzYP0P90?=
 =?us-ascii?Q?wbBetP69QWxAb9HGuvKisJJwH2pP2Ih8zsO8vtwkpNxDO7Sjux9XYPuU+pN7?=
 =?us-ascii?Q?Iok7OLAbcKg9rxSHyMLLuiJNd2xNQsQUN4jpz5aooA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xfZdf1xK7rKNlUSIGPaMFoXnBauZvt2N3BRatnbQQzED2O9LRIbpHH3Bnls3?=
 =?us-ascii?Q?7jCNiXgoZw/7oBTScxmMBNCvYUvkDMcYrDXgDPvYIxKQ/pc75zJGDS00woJ4?=
 =?us-ascii?Q?LdvYD0VvVoxQVziiYpeGPklLUpDkeIeoc/y/Szhw4egGslfD/m9Thlapvp6K?=
 =?us-ascii?Q?fOGImeNqXKcf7cYRB0AkHOqb5gqEiBZ5L8HZ6/ZtBmdgwUXE4R6vEGQZ2KI9?=
 =?us-ascii?Q?28+a76p3f+QouWAZM/llOcepcEUApwDGskaTOEK0Go5VPyivWoSSxsWUSsh5?=
 =?us-ascii?Q?QAL5cYBd2t/wGygDaBxQGUHjGDBSddm0VzGSpqV/t1DPJoJ1mWGrqduZHQ5R?=
 =?us-ascii?Q?eSJZXRoTKCoaxBzSvTv4h9O8oF12cMEa4aQuIivfFZaGRY+mIwRIpc4U1l7C?=
 =?us-ascii?Q?B6lV9I8YZqmAoBX6kxlc+y6Pn7HooOd3Wl2q75dfwbyhK9OpWf/0eDyGESFb?=
 =?us-ascii?Q?gE0TlA9Mm2y5vZSosNIhoA0tWJpxdyIDBvQVX9ZRYMrB7xsU7DqCliu5EYg+?=
 =?us-ascii?Q?K8hfVlsifq6Fo74nPeNJu2XkiYV77/2dvkLVDSrIGI4TbczWp2K0kH01PZEq?=
 =?us-ascii?Q?Yj1+paobqB/grFu0VDs/emi8g/F7VGs0IfCLQGa06uVlj5kGPuKDBAI/uWQg?=
 =?us-ascii?Q?5AnSDYwjGJxtBvUParu7kpQL0I6TYxoBxOkIfm8cphWG7Lv2mFyGHrlmpZHE?=
 =?us-ascii?Q?kWoEsUp/S3TiuKCRK2/eRtQoJ3Mt+SZNYPpaMl0trWE9jMZ45LoXJmlmG1xG?=
 =?us-ascii?Q?Ib7RYzvGow6ap2FrE0MEw0ZT06TD/HORW7HYRIGAT6m1XZUKDeunOPTPaSqd?=
 =?us-ascii?Q?4sIw1N8teHaWa9CkXMTDSB5LwlgJaWnyeDZeTV6ERFoBgKLMS6dpLCxLCABX?=
 =?us-ascii?Q?SWi5Fcdd4twUdzm9IuE3ZoY3rgsgKJKKOn9BqsCsqagympoTnnAEdhGWE4nr?=
 =?us-ascii?Q?ZzzHeXTTjzj0MAY8Cytl/PXO2IS7EK+i3EtC8kjM1OxnXEqklW6Lcn2Qg7IP?=
 =?us-ascii?Q?L0eZwU/sbEpekU8zaFRtLbUpOJtsskExInWNgHXevCyAftb2XMUbEHO/YPuI?=
 =?us-ascii?Q?GqKeJlr0pcpP5h26cRYA6QBu28oCh1m+FW734qktuts18R9Hs7dvpplVO1UJ?=
 =?us-ascii?Q?KGGMnMqIU5Ay2daleF+2eDftLhNyfwxrytaaOwu2euKVOg0Xd+mbY4u0YqNN?=
 =?us-ascii?Q?/4Tvoalc50h9b/RvCdeSwaUrSSfm/3HqYjX8FJ/OZ//2hndGKgTbFG2NK1E7?=
 =?us-ascii?Q?tpIWf0aot18nTqaWFU0PWvKkqgXT77xRyncfHzHFrVRBJgwP4x1j/2iaGIQ4?=
 =?us-ascii?Q?ozniEdikWbhiqFRSWscVQtOeiaGMjPRtZ/0fzHHNrEm13Hwczu9mGCyqWbfq?=
 =?us-ascii?Q?CuDpqgjjbwkEABqmpFuc64JoXEQfDHcR1kHfQJPu83JyHwnFytMyde2AXRVE?=
 =?us-ascii?Q?B3G2nP+NHJ8g8d58WvqlRMpUkK0nawD/MMBux4r37LAniKdxSwPtPySyxqXV?=
 =?us-ascii?Q?LYxFIN1kGhXrDHw9/nNmkLO5j44KvVGEgjNY3FAzau98XWvORlp5rHTQ/UI6?=
 =?us-ascii?Q?D5ycJ89m/pXr5eNq/CyyhmBPX4lYauXqMYwm+F8z2ZhthvYL7pURQR2qfMtM?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EaU1iYrsWzmSw7cPdm/bRKwUK9vzNKKKgxX++wJ2YNL/Eafu/Gu1QaYzqgIQkhx2wTh95QJ+OaMN5Gv3ed8DSYTtf08tDLTu2YwQLBUpx9J8JgXL3YT0Dumz9v6AhKk0N/dMx8f9JeKlDzKSJ2AzkdIeSl0ZoKwzpLFG5lCeSY6GbRdIsSfEheosM21FC1FfdhuJhuerJb1vFTtQQP5LbgKBECdcC0KjcVf1Elw2eKL5735ot94HenEF7DQHMZVhgeUNXr3uthEROQXhet476enHPUl9nUq+EMaEc37vPYTVumaP9tgTnwGu34JPqSGyOm3E5jSS+O4f/NAgY4FSM/DHWoXUVNXi1GcxC1DUzep1tGgaIWRiFCB1LpbHxEQQH3C6DrDB1eyYOoBsXhMGvoxRuZMRaV7DLnn1SALRjXW7kNaERLqv/m5wqHdE1LLpW4fWhLsMiTo83LyEnRLvFTI0+OMs7CIhIR/sNARcqvZSJj0l3cPd/ijo1Genqom1uxOCTTJiCAdoAjJ1PAOYjJL+ZdMjvErSMTPOdDjgF1FBk1R+iD+LR3bxl7MfxE9SD75tA9GZKQv6VSdZ2QwwnYx6hZwtr52G9/Z7yreVTww=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb69b13-b20f-4413-7894-08dc7b51c13c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:57:04.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsYGMrEBClWsLr1UxE/TrHZ/ucQg6UygkmlQY29oCeR9CnIMI1dRJDCHBzu7xe+nPt+GmEbo6VZoa9q8agFwgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5080
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230124
X-Proofpoint-ORIG-GUID: a3RmUFlE8VPYSQ4ALAT7itwlTsrWF9Ba
X-Proofpoint-GUID: a3RmUFlE8VPYSQ4ALAT7itwlTsrWF9Ba

This moves it out of the way of SystemTap's rather different sdt.h,
and lets us remove the barely-working kludgery in the specfile
to work around it.  We point at the new location with a pkg-config
file, and can immediately use it in make check in the installed
testsuite, compensating for any install-time changes in the
location of the dtrace libdir.

With this change, we no longer confict with any systemtap packages!

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile          |  4 ++++
 configure            |  2 ++
 dtrace.spec          | 19 +------------------
 runtest.sh           |  2 +-
 uts/Build            | 26 +++++++++++++++++++++++---
 uts/dtrace_sdt.pc.in |  6 ++++++
 6 files changed, 37 insertions(+), 22 deletions(-)
 create mode 100644 uts/dtrace_sdt.pc.in

This is a provisional patch so people can see what I'm up to --
tests are still running.  Don't commit yet.

diff --git a/GNUmakefile b/GNUmakefile
index 7d1af5641f54a..0390db77b4780 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -86,6 +86,8 @@ BINDIR = $(prefix)/bin
 INSTBINDIR = $(DESTDIR)$(BINDIR)
 INCLUDEDIR = $(prefix)/include
 INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
+SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
+INSTSDTINCLUDEDIR = $(DESTDIR)$(SDTINCLUDEDIR)
 SBINDIR = $(prefix)/sbin
 INSTSBINDIR = $(DESTDIR)$(SBINDIR)
 UDEVDIR = $(prefix)/lib/udev/rules.d
@@ -98,6 +100,8 @@ DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
 MANDIR = $(prefix)/share/man/man8
 INSTMANDIR = $(DESTDIR)$(MANDIR)
+PKGCONFIGDIR = $(prefix)/share/pkgconfig
+INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 TARGETS =
diff --git a/configure b/configure
index 40b870f81d6ff..bc42c4f49a3fa 100755
--- a/configure
+++ b/configure
@@ -60,6 +60,7 @@ Installation paths:
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
 --mandir=PREFIX/share/man/man8			Manpage directory
+--pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
 --docdir=PREFIX/share/doc/dtrace		Documentation directory
@@ -130,6 +131,7 @@ for option in "$@"; do
         --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
         --docdir=*) write_make_var DOCDIR "$option";;
         --mandir=*) write_make_var MANDIR "$option";;
+        --mandir=*) write_make_var PKGCONFIGDIR "$option";;
         --testdir=*) write_make_var TESTDIR "$option";;
         CC=*) write_make_var CC "$option";;
         CPP=*) write_make_var PREPROCESS "$option";;
diff --git a/dtrace.spec b/dtrace.spec
index 42ea9bc339586..7823b13d981cf 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
 Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
-Conflicts:    systemtap-sdt-devel
-Provides:     systemtap-sdt-devel
 Summary:      DTrace user interface.
 Version:      2.0.1
 Release:      0%{?dist}
@@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
 %endif
 
-# Because systemtap creates a sdt.h header file we have to rename
-# ours and then shift theirs out of the way.
-mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
-   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
-
 %clean
 [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
 rm -rf $RPM_BUILD_DIR/%{name}-%{version}
@@ -222,15 +215,6 @@ if [ $1 -ge 2 ] ; then
     %systemd_postun_with_restart dtprobed.service
 fi
 
-# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
-SYSINCDIR=/usr/include/sys
-if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
-    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-elif [ ! -e $SYSINCDIR/sdt.h ]; then
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-fi
-
 %preun
 %systemd_preun dtprobed.service
 
@@ -252,9 +236,8 @@ systemctl start dtprobed || :
 %{_libdir}/libdtrace.so.*
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
+%{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
-%{_includedir}/sys/sdt-dtrace.h
-%{_includedir}/sys/sdt_internal.h
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
diff --git a/runtest.sh b/runtest.sh
index 35d5006978469..78f47c23897c8 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_incflags="-DARCH_$arch"
+    test_incflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
diff --git a/uts/Build b/uts/Build
index f445115d683db..99bdf19638a50 100644
--- a/uts/Build
+++ b/uts/Build
@@ -10,11 +10,31 @@ uts_DIR := $(current-dir)
 # provide the userspace versions of types defined distincty by the kernel.
 
 SYS_HEADERS_INSTALL := common/sys/dtrace.h \
-                       common/sys/dtrace_types.h \
-                       common/sys/sdt.h \
-                       common/sys/sdt_internal.h
+                       common/sys/dtrace_types.h
+
+# sdt*.h are used by programs that contain USDT probes that want to define
+# probes by hand rather than using dtrace -h.  SystemTap has another header
+# with the same name, so we install these out of the way and provide a
+# pkg-config file to pull them in.
+
+PROBE_HEADERS_INSTALL := common/sys/sdt.h \
+                         common/sys/sdt_internal.h
+
+# The pkg-config files undergo a few translations with sed before installation.
+
+SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
 
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
 	cd $(uts_DIR) && install -m 644 $(SYS_HEADERS_INSTALL) $(INSTINCLUDEDIR)/sys
+	mkdir -p $(INSTSDTINCLUDEDIR)/sys
+	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
+	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
+	mkdir -p $(INSTPKGCONFIGDIR)
+	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
+	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
+		cd $(uts_DIR) && \
+		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
+			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
+	done
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
new file mode 100644
index 0000000000000..c5506f9355d92
--- /dev/null
+++ b/uts/dtrace_sdt.pc.in
@@ -0,0 +1,6 @@
+sdtincludedir = @SDTINCLUDEDIR@
+
+Name: DTrace SDT
+Description: DTrace raw SDT headers
+Version: @VERSION@
+Cflags: -I${sdtincludedir}

base-commit: 0f499300c150a3a8878361e31f3ba167f7d5b851
-- 
2.45.1.275.g567cb0950c

