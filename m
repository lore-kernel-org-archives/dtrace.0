Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A9192D84
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216227; cv=fail; b=Sb0TDLoo5y/qeyhNjq0GEtPkWrhtzXJ1WCV6e5Dvv6uN9t63kX6UVfRoVT9v6s2NHRf2+trhuxWy9J5d9v+Z7/HglOHlPb4QdC59Mejx53eAZ5+ieykzhEh9hqEDvXW5RTGdbMp+aNoA1eDv2lzXPNnnZ2q9+l0FyHZzPTDdhDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216227; c=relaxed/simple;
	bh=dTWyMk9Y4W+QmSXi0M/88HKsIySS3LJd5KXQMlavZp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a0hT43sOYaab+KfrK6qtIDpudmMTLJ6pBuDzX54xKzir3LHycPhcr23aId4Cm3f17PTF2OhiHUh70DyEq720GQRTg9orWPS7nZfFW5cvwIBoWCywg90daMaSMkPqGJbG1aECsMHEs+iZSCjNtaLJFhx8yAv3a9XNtRFO7Fn1iEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A8bCxeJF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z9Axl4Rm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A8bCxeJF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z9Axl4Rm"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEtc45015067
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=RfOS0/snpJ3q49KBmZ
	pyJkr3l8E5OcscidhNTpu7uic=; b=A8bCxeJFK+D04QM9ZAcVccVNsrOlWIRdv2
	LJTpUXqIgLsi9QzHwBlidUrMlWCU9Uk5jp3MMJ908VSHOQf2dXBMXuLGENtQf8By
	G9GFLz7sGXRR438GETO1A0/dENh/vQsB0mMk51ENbAV7tLS8iW+bsMLXLCgO71a7
	kYiwdjjXjyOx7XcQTs9HDIB1x/A9Fxc4IDRL9jL71zI3TOlQ3nJKD717ddxOui/P
	bvpiNDaQmHzTenJa/dedDnnNRgHDGz2eMb7JYUFnIdlLVlmlSpME37rwLobrrk7j
	1FC6yYC8kwGxJxT7e+yIJ3IF9LAbXUu8AL/jc/sihlgCOKBTNdCw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqdt0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TFQJcL040258
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnapa3n8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 15:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2TfT83tsOARXqneNVW/5mQjcaAeGOXk1PivW9jViuoeAOwToShri3ZAgI8PkuCdSSge0GBPtB/zebu2OC8wODjIwnkpSKNFQCLYq5pHnlY/96ujS1GdvgYo3P8evVkakmHyoAgEmdLO5aHYwaMwT1TB7c/W0j1S+42diRlcxUIymjULxv5BsAMbgILwf4jM1v2LO3bxdoDiUnqboaKXuU9j+ziCwNC7DNHZmaQNA6brup3FLdw+faFdSosmF7fXYgdRQVyt0n0j3bpWxcUS0j7sGXcN1gB/bxyKLXryyEjG+iGZLs+FaSfFPwoHsO39TkS3f54HLu84cqYYYNrCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfOS0/snpJ3q49KBmZpyJkr3l8E5OcscidhNTpu7uic=;
 b=FrZ1cyonCeq6erO9nSRst2WtHKaADc/fUysNZB7zdn6zg+CgkdBgm7tLYJ380Iw4qZ2PhLTgFScMJJbygqCYU0+tdQCq2FLwXTkQAqECTNKm1BiCCYRhjA6fizSYykHzf93+DizLWp6b5dLM23NEuiMA/p1EcsyvVnYeLsxnNRm4SAGDljrcyDm8RqCzkjwY6S5YaJZGAv2ZAo65lzvLpfJZ13OUo9EJWEmQgj0avuEX07BjeNgpHZOt6M8jBBD1isNnxirAfH21mEeBFKo5SozNAUpLVj1IaXEuPuL5IMZ3IMd86wJ18oeyIExCruekpTSax/oc89F+PjVfPLQGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfOS0/snpJ3q49KBmZpyJkr3l8E5OcscidhNTpu7uic=;
 b=z9Axl4RmbbDOizv5MTfbsMyjlcqV22fuPbSicYn399ejrpuF4xAGs7thntc/CLhOqjjH+uupTRNbhqIOsqZZftxANjqHvdNP0yBXGjGDdQ/XDI8Yu/6KblwnFF7J6MwZPaNGxRMBDh3JXM2d5IcYw3sEGuyl3vlirGNn7bAvLwY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB4677.namprd10.prod.outlook.com (2603:10b6:510:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 15:36:59 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 15:36:59 +0000
Date: Tue, 29 Oct 2024 11:36:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] Fix prid fencepost errors
Message-ID: <ZyEBFaqCr6Fzde8L@kvh-deb-bpf.us.oracle.com>
References: <20241009223035.5659-1-eugene.loh@oracle.com>
 <20241009223035.5659-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009223035.5659-2-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::14) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB4677:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a2f7ad-94e9-4308-ac47-08dcf82f86d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?469BU00j5t+79gmbObTwpzUfVPzreZ4NfIh6vC160pQ+UpvduNnzyjGIB9cc?=
 =?us-ascii?Q?NwPIHUecRo1YlP6SpTK38LEkykADuRuX74sOrLrj8k7MSc/G8jodfEdW6yAR?=
 =?us-ascii?Q?NKkQZXHTDM6BTxvt3uPUZuFxwJeimvbpVfaSnEXvJkjo4LIQ07gO/mSL7PLb?=
 =?us-ascii?Q?hV51QCO/WHvbNswHhQPRbHG5I5ijKheubh8vIohGJgIyc+WAQq3Vo465tPkG?=
 =?us-ascii?Q?G82TB9bdoogrRtc09cp5DkOJQI7DjA7d91nvww6bnu4pnpxVyluqQ/Vag8hV?=
 =?us-ascii?Q?rx/hTfmaRpklVLbAl4WeQxGzO9HF4dFOzNmOcw4aJu1RrIVOeB4v+fNBdDD/?=
 =?us-ascii?Q?zWQuqrv/17qnrTgS696YLmGGeIfxGS5vRzMm0gMuuTpfValNDPzS6oYeUFcO?=
 =?us-ascii?Q?FO2PgFskBuKOp46ERcx+e2J5x0Vy91/duybhmBV8z03D1rx0jTFu1rjuOEHU?=
 =?us-ascii?Q?Ww6ZxKJV5BnuBqY2tK9r9meQF5Za/SsWRodxiApefWTn29yadYceq4RXwV41?=
 =?us-ascii?Q?DoCpLqIM87e3PPzWW16ghrsWn8wF++oTPNC94MXTMRtCxFE9yg8xIxLywn4o?=
 =?us-ascii?Q?eYTtc3dRDRaHIIOdV5fMDCK2KyQdc0CMOfzWoJ751gOse63rGPcATdBR/gL2?=
 =?us-ascii?Q?Z7rJrqP8Z4UTdYca8QKAnWKjc5c+rRygyznt4bgIh9sHuhkrcXzhnMYmQhCV?=
 =?us-ascii?Q?cBsee3s0UyfNaCPrSoBCdm3SRnFwBnfXThhHxLHBTLrHefxdCbSzhK2uOZC/?=
 =?us-ascii?Q?lAIhRpCTeyby1I/0JYzsucThq4dZ4HQX5T2G/j/6IBVouOO/SXzGtNKxnuXZ?=
 =?us-ascii?Q?VYnM/UJ+XxEEliNb7knYhnZ9Cgl66ulz+0hNhqltEbTGKRWmHtg2bzmCQgDo?=
 =?us-ascii?Q?aQeneNO6J9nmv6cokFuVd7fgAgghFI+v4zO+H7D6NRbEThjsnmPsj1Uyn7KW?=
 =?us-ascii?Q?m4ULrf0TAnwfiT1ShopBAiclza4iLJjKYD2/va4NJCvT+v6z09DukPxuZtiY?=
 =?us-ascii?Q?bnRt5PBKN0nz9uQV1ENvECxNmJEQXn+uhbrdo7elJY0f9Spe6ofim1fzuDjY?=
 =?us-ascii?Q?PLyOeELbfm7V6PoqC46bE+OunfjpzhkYHG7UE2P54cu7pE56J45gHqFCYzw/?=
 =?us-ascii?Q?UrU/37FA6BIKWDdgJQawOb9it9ymEtz/Xo4LKTetgY5VU7UNG6kI61FTk1JA?=
 =?us-ascii?Q?N76psJRBVL2scSj9RATLwwSKnlMIzKkxKMw2n+IB8kf/edzDH+GSivBGJrOq?=
 =?us-ascii?Q?RkbLAeUaWBkXfdlZq3xETIFB5n0LH8uMC/WBtcCEMivWhW8qx7MW+JlGZB5K?=
 =?us-ascii?Q?02otxsLGuq4H6gCzvmPBWEft?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nbxVZ91xssYNEvQQ7ofQ9rLO6T7/+VB5b9+uh1+1gRIc70Kwv/H8V1TyIIL2?=
 =?us-ascii?Q?Oq2wVjjY4RhGRYqUU9TYCuhytRXtd+yJY53yD13AImXCdsdf2bdWs0F4CHsa?=
 =?us-ascii?Q?7wBj/h5XLaYswW4fmcHIGUfwBnwK4PlnngPfDTORGWjIqVsPO1+Wd6dXNSCf?=
 =?us-ascii?Q?+XLq/SmUclYBGqo18ELEeYbAgzyjszGuGCkZiciGxa4VPvP2ByNTQ+3Yy8jM?=
 =?us-ascii?Q?ufdcjbXQB30eoc5aOHd17jfF3zCbnbqhZUvaehlMr8JgaixSMWCUDeDAcRh3?=
 =?us-ascii?Q?1l42J1PPVOa8yoEQt5jSrFIHB23RrF/XjwRFPrRx5JxB7ubxZpw0HABiV01S?=
 =?us-ascii?Q?8br8ANtDUi0lwgBEaJrumFy47g42YmMFe5jzVSywK1ML4Td57ceWX/0qwdV3?=
 =?us-ascii?Q?nVeKdJ+dVW7fRaStOScOCaFKSYHlQPcd4aQ9HLaVjRUds4p00r65aQtrIcC0?=
 =?us-ascii?Q?/aMLiCmcM0TkHeYKxqUK3TStLKnLAn3ujajNbRfnOx8Y5O8M6KOa5DfUo47z?=
 =?us-ascii?Q?m1qKFztLD2MVMCfHF4nAYuARyOlYAZGE/APybAB1t3Irs+SqxXfevsGzkOU/?=
 =?us-ascii?Q?9T/3PZeLYckZCA9k9eHrH4Vb/j9qMx/QpjGjicsX0/sua3iQ7R0oBzzSCtQT?=
 =?us-ascii?Q?spYqDIhZvjRzSY2KDWdjEQhtqVaTlR0Z+T/OABvZVPPelhHS+BDA2l3jcCkx?=
 =?us-ascii?Q?kFWeixd9LW8szOmKR0zlV2yRnqXyDzGYCtv1SMSndAhRzwBSCEJIG+nLFIs6?=
 =?us-ascii?Q?WyYSJgu4scwYMYN84SK9eP0fGEhu4bmHAs/J/H0uZ/3Av8+ayYaoS7Wsnaxm?=
 =?us-ascii?Q?p3SJiCQ5UQgYkqfNDIOnqDCOe9H7asvEtcpgU+KvtHh4im3cXG2LKarYu7kU?=
 =?us-ascii?Q?+5rnI1lSAKj5ncFAm3l0B5FcNyZCm2dBRL5TkITmz7Na5sDVEwrZ8J11IgNi?=
 =?us-ascii?Q?QxzEvvyJOT8VkH9SuHvlT0bDrUQFVpNUDsAs0JfnWCeMFTDuh10t8uHzf0wN?=
 =?us-ascii?Q?g7TrbKgaCxpTAvgEpoJN/mcPT0HdH3cp8oHWYPlBUg0snfw+gLjr8OrBZuwq?=
 =?us-ascii?Q?IsiUkGC2kk5BYaYOQKYmmyM8iJpNv/OH3PJlsvjNSoV/ZqAYKXOE/bzJPJHd?=
 =?us-ascii?Q?zK7ij78V4yngL/zVUK7Md+F1ZGSZ5O+aN3am5QR4tq6+dngYl01ZUI4e7KKj?=
 =?us-ascii?Q?juLkJLk3XVBoJr113KH+sYozuLZRAzqeHxknGGGRUd4rksm9LF2oP2eT9mHi?=
 =?us-ascii?Q?fYA068PBr+z9vYlhWOHjsOI7zYZwK/4E0RSmwtHsK8RxvhUgGYPpZHnSp63p?=
 =?us-ascii?Q?wRoQAISL80RVZ9HHHOkgew4T9O2ArBpw+LT7DoGYlmBF0/GxiGGAHYvY5KW4?=
 =?us-ascii?Q?f54+nvWLJeSA2ltXyKHgyjQjWiteEmCia61CiELvLFOPLV0a5MqJwsZo9HKJ?=
 =?us-ascii?Q?8m0qkePWnryMw2QUri8AF1+j0iERlLkVUjG+geXxTBeSqZXgUmoiF/NPZsvU?=
 =?us-ascii?Q?JJ7B5VTCK+FmZa3IGbXuGaleUrblEk03CkI1bbELRL9KhfkbmO2EW6h27eu8?=
 =?us-ascii?Q?7sBGf5+BlmJ4hJCWIxq1We67uIDEcKGZVyC0dwuXzdurIKKwixR4EYQY9Llu?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BIDufn/79t4TDIjQG8fhf3ISdoQvIHvW6QNq3dX/XCbdNpOn11IQtoRIYBiEi4egtPdcYg/jgbHX0k0al8IGIIxSNvUdQFJLUMf30dOscM76Rh6OBC5Y2REklizKzn804OtpqNjPOjvhvPjroChk0OhDDlKp4K+kxSAUqMmAHfiXRtyEGp9nBOYuOp8BLxMQNHkE1i3DcDouHhyeH47J9x8vy14EmGK//J1AtASHux9GDPysCaJzpxGvsp6NIeLR8cXo/dtSD9X0s80S1KXobrRaEOf+bj49NLhvT8GRTl6OxpS+6qlpm7AEwSss0NgLSwnmFz9ycmanRab8KKqdiV5iDziZ/y9wdQtGOvmP3x1j3XaYJbW5rz+zeieoejbCrICYNOdyEiLCjR+kcC+2Snmm00QLt9eiZTaNnldhyfCvthiIrWki8crgz0F9A+tR+k3AtKlhx8VulrX7Nc4ZTMPAnrAJkRpfA79F6k7r7upK6kbsgNdNvmDHk9ycSZk+/wF3tPTGmYAFhJ6DuuqyxePqHeO2SM9awxD8FbVlbtNtgaJWD+Fq9ETez5nDkDIV2fYrotgYF8nrpi9lNV2mQK6xzSRswVfXob+oF/lEFkc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a2f7ad-94e9-4308-ac47-08dcf82f86d6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:36:59.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWZDtjS0nen4FMzyEIKtJZusZSU+wQUExp5sQm+h3A8CD4KLl8+JHq8WUJB1PYulbo9yIA4wA+zYXuYZUmfC6V9ERV+pu9WugCzLG+xf3GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290119
X-Proofpoint-GUID: rrLUklFPBuiQk5bbzZOxBz_a0sAT2tOx
X-Proofpoint-ORIG-GUID: rrLUklFPBuiQk5bbzZOxBz_a0sAT2tOx

On Wed, Oct 09, 2024 at 06:30:35PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_consume.c | 2 +-
>  libdtrace/dt_handle.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 3e8e1b465..74004c69a 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -2205,7 +2205,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  	pdat->dtpda_stid = stid;
>  	pdat->dtpda_data = data;
>  
> -	if (prid > dtp->dt_probe_id)
> +	if (prid >= dtp->dt_probe_id)
>  		return dt_set_errno(dtp, EDT_BADID);
>  	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
>  	if (dt_stid_lookup(dtp, stid, &pdat->dtpda_ddesc) != 0)
> diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
> index 09fae99c3..69a6dd388 100644
> --- a/libdtrace/dt_handle.c
> +++ b/libdtrace/dt_handle.c
> @@ -148,7 +148,7 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
>  	prid = DT_REC(uint64_t, 0);
>  	stid = DT_REC(uint64_t, 1);
>  
> -	if (prid > dtp->dt_probe_id)
> +	if (prid >= dtp->dt_probe_id)
>  		return dt_set_errno(dtp, EDT_BADERROR);
>  	if (dt_stid_lookup(dtp, stid, &errdd) != 0)
>  		return dt_set_errno(dtp, EDT_BADERROR);
> -- 
> 2.43.5
> 
