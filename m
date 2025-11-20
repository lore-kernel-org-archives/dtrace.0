Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8E229B38
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664802; cv=fail; b=MdNjoLshzc7umShu+UCIIyNsvyNTXXGFtjqvZg15x9nVzNLwm43uoqjNs1t7kL7TmONueUigKjhqUOISikNa0OIdHMCm+ehpeX1y7u076oVdu466H7R4EfGLpBIwnXuV3gLv1tBKIal7HaeAFvACAWs9HFCQPPgubjK0WAF4bXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664802; c=relaxed/simple;
	bh=itTNO0I8k9WbZszpcJ4tH5EMVjx/nF+p/3xduses2Bg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RtSwzdeSP4enwqUK+lV4MgiHQC+SoVRHV/zsA9Yz9NLBXynjhMVnK0tGeGsgw/TOMo04Ud3ZxMsWr9i2kE91xefP6xrvB3F8BNaFZnAeFQAsUaeGU5a5SyR+COjo09msjTdey5Uvpni9cHuUF7sY8REY57a6ZLVWxKKKppdPnzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k1zVMgp5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uggWxq9k; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k1zVMgp5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uggWxq9k"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKGNFO9011372
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 18:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=EzXuDUmEQWhiKatlBydCTbhBEPoQFTWD4ft+f+w6hvo=; b=
	k1zVMgp5+wGl0e8W7chx8CdISmZzD1RRkQe/ed9UJH957phD1aGs5uTbMRIqgGG8
	iEmDC+Fr7F3IIbV6+h4+rbIrWpROH8Kaa97bl0k7/kohm1pzITcLw+tMejuMeDjb
	/W7LwnfhkIaK15vyKBwnlM1YP5qoNKFdJRskPbNzSr5OntClbxnJQ+F2LD+g8XA3
	sPWBiFr7ygvZwyw19ICgdBA3e9wnxaZXMY+y+vDUx7470ryB0GPxYHFCZSZbblY5
	7P85xZZlg9gV7u1R3t5zIUUFh8KxPbe7PDh8V0OEJJlKMUkNmi7lWIqe5Cj1Fg9l
	VLwyoqeda+9BKggaiq+8ig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej909tb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 18:53:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKHCNKh002515
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 18:53:18 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefychcu7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 18:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAyieo7+el3ROMdca8I3h/XZflKS2Zln5TaMdHG6oBcda5qrNMfuiM7GPi2n16/eRuRtL3mxKvXleB3GOF+4vAUWXc6S1KUAAafLaSC8WbVYVAKyNrLLHu7KATQBnxF3ZV/UYTOG59IJa3EUtl+NvvI8/J4Hx26SpsuTdOhZRLKc6J22kzzNCyXh03jl4JmvxfmhWsT84qcku0OtWV3Hrap2rSGjeZ1bahj3dzuFgFtG0HF7r0YwpopfbgXFdi7QA7b0CiIe9fuyCqxupyhGzyXO0xwt/2lgXpDa77kNdo/Nmtm1UZWZF7gOAIZxOSPzDaSdQK51G8o+OrKwy0G19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzXuDUmEQWhiKatlBydCTbhBEPoQFTWD4ft+f+w6hvo=;
 b=mJ5Y6d/fjLcMhl+hLRVM5iwsBx2EyavynUHw5CrdP3xjZl5XVmTDrwAXV1fiweDdIzqAmXvr/wsM41CU/I+/kLqcb21c7Rvy283JPYrcqWWLLJ5FTi7kwrClNQXdQubsZIIN2zgKZuJZH88HAAyfYtSQX5rxaenLVmXlNgFCQEIFr4/5JupSNY7OMyk/IP00Xb0e9VQ7oVZ0FH0ls2mWMyuLTZp+GfcVHym2OPsm0R0sQY5JN5sfE8+IZWIDOyiV4hR8ld6pJIO8aA0Oh+MyG6RluF/CnXPSYPDSfC4WL/LAQQChucYivSBbB2aMesqQbB7llMX/r18XplLItRvL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzXuDUmEQWhiKatlBydCTbhBEPoQFTWD4ft+f+w6hvo=;
 b=uggWxq9kfhYJXdJgzI3f/MXdSU3kggMp2zF35yDM48TQIVnupGgj19pJZcFy08r4bsiGWreOOOIZrHowDpvIA4ikPB/zHayOiUXasCnVpqMz7uXI3fZ092iuQgflXJibiBNpYInfmVNsTmik4aI5fYO0VOhU5BTlKHO2QU/h5r4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS4PPF6C5A39D55.namprd10.prod.outlook.com (2603:10b6:f:fc00::d26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 18:53:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 18:53:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Do not convert "__" to "-" for stapsdt provider names
Date: Thu, 20 Nov 2025 13:53:11 -0500
Message-Id: <20251120185311.28904-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS4PPF6C5A39D55:EE_
X-MS-Office365-Filtering-Correlation-Id: 0909c7de-7c63-4ff6-bda6-08de28660f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MmqNTDoQf2xonUrnZzFyUUbRR8+jRpm4WRC1bUGlVE6hLnkPlDGa0zLgxICM?=
 =?us-ascii?Q?7I5aQYuF2eSU/A4lN/nV/ZOTKnrFNm5JGTrHD8q5xhEbP+Q4EvFYUmynvW/o?=
 =?us-ascii?Q?wAi/tqPbE5MjA7yc8xDdDEysrJPVtEpBVTiDJFNQmW8fqdlFUkrNVLrNaEH8?=
 =?us-ascii?Q?dFcvph9/8tuWKeT1clqa0hUPBZAPTtpyHcNyybZ2qc8tmXDxU3qtC+L/KnQc?=
 =?us-ascii?Q?uTxw++S0Z/Ht7NQLuLCqcrpdf7bKS17VV8aFZ/mD9ChAC1okqXqqg3Tj2rRN?=
 =?us-ascii?Q?P77lHIF37yjt1CFODD6eQzHUXrKENJieWTqPOHTEls8UaRYGJWUq52cFpwAm?=
 =?us-ascii?Q?er6OO7kwrl6ssyScjIWW9tyIHdv2g7womjye1wWTvfhRzNdzWq2KVBNOEdJO?=
 =?us-ascii?Q?KlPRCqcQgCj4Fxw4vZ2cFIGQkupxXWyPFoB9lXdBtDWIGzyixMHcNFPmVjVC?=
 =?us-ascii?Q?fnKjXlWjgx9SQdrsgIUd4Jl+BqNJSDzC+66pM1dt2fwXoisDN8HvGLj+6zfw?=
 =?us-ascii?Q?hhI7y5SVmun5yZwSnu+PlaeLPdcC+d9JcI7b86j1RHJTNZdWa5CZ513F+JZJ?=
 =?us-ascii?Q?CUo6gw5cyuU+NqAHqvXv21iRrOmPoWrQ2iF0zgNj1Rcacz4WzvOCb1s2H0gs?=
 =?us-ascii?Q?wBG/HS5RCXKC9R/hD7KmWwD0j/LojSPN4QllU5I1VxJpxt1NrWkPS0Wb158A?=
 =?us-ascii?Q?wfHkEGRmTxN/vL4jEThXL0tF0sGzt2ibMsoQwqFWdWByzYNN4X/2+NOt8mzw?=
 =?us-ascii?Q?Pa7nfduO7If/RM1TktyFkPWKuvKBq+WlrS5eA1j7ewzSQtZ5tjkBt0LbF62Q?=
 =?us-ascii?Q?tzNWsr0wWCgxv73LQQp3e7C44K4mCGeCGANB7OodbuNiZbQ1c9SUQ6uA7Kle?=
 =?us-ascii?Q?LAKHjrHZjVqDcmg4oLQkDIbR+ineBMzPWerJK2MKnfvN2L9ZIuJfiUOY3SfJ?=
 =?us-ascii?Q?/bPGS53c09yu7wSOZzktcrdK3jLffHQEkfrko9/2JK5duXVIv0UKcJKsM56A?=
 =?us-ascii?Q?b/Hf67gbOenYSTs7LpRzQZQRLgR0xCrS67IpVx+8lG2ZXgFbll8wBo9xf1iG?=
 =?us-ascii?Q?Cm2RQCjaoFvSMb+inNkkjypX2GYFWvhOMiqt5gMSs2DJgWiiC48wnT2i/IQ3?=
 =?us-ascii?Q?F9S2I2FddVx8ZCowXOQDL0KZJZ3DWTOpFSNC+aWX8rTKxlgC28Z6QYyWkIkU?=
 =?us-ascii?Q?vKBBQJ+1IpsuZfmrNGBKqI/34Nm3l4LheypMqXo/UoA8m1rvFsHSSUcsN3Fz?=
 =?us-ascii?Q?ISwlmtIyx6fyQWxmh8oB+p3mJKTbQES9+MLJzBRRYLOZI3PBE0SmNb4eTF9P?=
 =?us-ascii?Q?S9kqF5LOQxeT2Y6f5RiGTEiptCQtZ8VtLdFaNzA7W7NjsJUz6YyLen1dARnL?=
 =?us-ascii?Q?i1PVWhq4En07EnRq4ckDLk1RalsH64DH5J78dLSvw/AaTnOMFKc0ptHS12Qj?=
 =?us-ascii?Q?vWRKUQi1YcMs332NNVyeLkJ1MWNKAVlg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WvQXQ4zB0r2asY7AgfW1jHk8PBtxmztNPAhc9FDcmrb3Wdg/6ehRO4QLPR8?=
 =?us-ascii?Q?/cDln7+9WvHIkMZX+fXBU3AwDeQgh6uKFe24YXd+pr+oSoGiwYvtjrA0i1Vk?=
 =?us-ascii?Q?cw+OPAmsskEE7hbTDDlKIiLsoH2TZMqMSEfzNtb1QZp3TP/iiqiJI4V/A1LH?=
 =?us-ascii?Q?MehAFOZM7MpfnZLC9UcI7qBJXieqv/Zq9MPds/tRq0cJyGzzS1pdlw1lvMyn?=
 =?us-ascii?Q?5pN64ixKwpoH19tE4wzbMwAktjzMADTFLIWp+zqFjY942WO8RD//2iC6cH4f?=
 =?us-ascii?Q?wEQ23K3BrAee3qMsgsWI22IlHWdOtf3ad/5ekNx+5ebWuibM97oAWogKNl0r?=
 =?us-ascii?Q?VGef89MFZFdslgHhEFHj7ODGsI/eghZlENqalVZH6JBy+RXxj0TCuYytObmV?=
 =?us-ascii?Q?iRizmCA7yXO6e5YhkJ5oysyArlJPBoc0qUv0nQXem51X9C9UTH83guAD2Fk7?=
 =?us-ascii?Q?0kbfNmZdEdKRiFdB2sx4lUyZF6Hjz9DAPqFXPD8l0xc4EHgGTB7qB0NMIDIF?=
 =?us-ascii?Q?K6+C5+oYD715t80x8b+avn0oQ5/M+Dhr6Kuob6jpgxzC9H4x2Ni3Penh9/p3?=
 =?us-ascii?Q?OcMF6VueWtxRdbBYbZD3bbZ/NOlAKoyFc5OcqDRApHU55WaZwjMzz+/Z/XZy?=
 =?us-ascii?Q?HbLVsk2saiAvScAMwVpuEKW8/Vy9QxCIbGUKXyf0Paz5qVtQ56kXSe5ZRnVU?=
 =?us-ascii?Q?LB09sZRVjsLXJ3QFKoR8IIMcVNAVu63NPI6cjPR3Ll/SSLGXfmh9I1Zz3Dfb?=
 =?us-ascii?Q?jhmtNaiVXVD47HEsa9M8RUDQ4K5wBMz+E64QyJZY5ymc2HerrIIsavCCfRkx?=
 =?us-ascii?Q?jJ4STMPCYkab39DsGobw/GYQcIddtTjJNHUFgaeYVH1e6/a5qdJBMdmL6w3n?=
 =?us-ascii?Q?lEb2Q+ocdowDGdL9OuLCQPUTFP1OvYi1TrpPKlMiBkjDeTB6LYzIq6vscuBr?=
 =?us-ascii?Q?s6uI8QP4pZgugOeKNnUNLGu4DoHDFjttRdtqi/ulrEdep6QAPH337x8j/ADY?=
 =?us-ascii?Q?bxr0Q3jPbB4SzRgvZRdf6HMq1MorYHsxgFtoAHY39QJ/SppGP6aDt+PNKz/w?=
 =?us-ascii?Q?/v+XPBy/Q0f3gnCo9dkD4/YBdHZnmXtfZ3j++BsHKIBcRcbEjL7vLKvZogqs?=
 =?us-ascii?Q?aVr5QVDKv+1EOCA4jYZBFuXBRdpbNZC/ueoXoYPZTTfFRjLpGP3tXsuXCWHE?=
 =?us-ascii?Q?JUO3Z7ksrRkm2JL58IaiUJUL7TUNkTXDep7hDGD9nvjJZcrg3YYpMW/ybHR/?=
 =?us-ascii?Q?edyPqtiIFAmu2KO5PIL4mF+koMKJP/8zWAm/DfrGuDlDxeasUJ+Nmj+rRWXk?=
 =?us-ascii?Q?svBqLi2gT0qtFKb1ldyRcDJwGGsgMrsmjXuRUe5bx+0gaNWmGLhitdf4Vrqq?=
 =?us-ascii?Q?1FhW6gWyhyF1ByC2xKPgA+kwAllVIjXvDT9ppRo5QzvULHDN0jgP10DOPIo8?=
 =?us-ascii?Q?87qC6YkU7ZDY1D6/nRQKq4eVzLKwKB2KMFluM14erPBnsVy8BMQksoZ04Lo9?=
 =?us-ascii?Q?LTw20RJae1SlBp8Ux3E/GzBv+Oylfb1tNdwt5efv+taD+ZUQS3JOgY29aRF6?=
 =?us-ascii?Q?i6M55L/meO8rwScQaSFHIaNKMayMBjeyq40f0TGI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cToA7PzyFbCdI1XQ1c6hZnIf/kOTqIfBrsKW2I6etcd6R8jjiuLUTvWjRppAJgolFCQ6XkuHMxy50oNB4HYOTPCbNBkagczm0kSzxSg+QwHvZUyRJChExYfaVrIkoiXJ9R/x2YMFpSjq9KDcNlBORnQDhe8uvFgp3eyjIxHTD0WviWoBMD6e21vIwqab7MjGwEYikmAaQbujU5xORb0/s5BunH26uiJftvRmCDhgQ5/Y62G7HXNltxDY4iPf8z1LEXKSSAT2sKsQ9SHPjbpcG15iMh7JwDBYPx0IrZnk0LBhbQOluxaPtpYogJ21ic9TwvpjoTJ/YT1jHM+wja1xa3vLmr0QfKqNvK5QcAT+MoWYXA+oHrnM3EKtPhmiLfg1ZTXVk/y+wzYTzXeonE9yQ5ECR4sZTVah3ULbwWdvYbSb40dYeZIgiu7flX4QGrgr5Gw/dJtcR3ax0sKWlOfuAP4s8b8gf8qp1lLZObpgNzfygdLcpImpU2rrGkleHdDN11PBMWP8UTw5NbRyHMvJE36VwWtRdleJo0Hl2Lp3Hw5ZQ50IbmzmMF80YmB4nQp9Ty9XNGgMbgsZ3XTUs+wtmg6pwh7aGdS93/QjUY+I1TI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0909c7de-7c63-4ff6-bda6-08de28660f0b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:53:13.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fLZnGVG8pyBL8k9wQMWPYiAMi9BV2vE+TkeGgiznX7lIirGoIyodJoaloZTxxFvON2lv7QVXwesmxmc3GWy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6C5A39D55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_07,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511200129
X-Authority-Analysis: v=2.4 cv=OMAqHCaB c=1 sm=1 tr=0 ts=691f639f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=mSloJuqm0mKYJb6S5dsA:9
X-Proofpoint-ORIG-GUID: 1LD8ukwyitDIHHiANsGI_htzCnTkNUFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX/dY1ZCs0sRYQ
 QFLu6KAlPYza/4KNJG9CpBlb9JG6cPuFj0F0t13/+crMW+GyOYh3GW1AWFHL/1diCY/U1Fq9xzH
 CLbbTMk4IZKlzYxT97YQXbKZc3Yvq5AV7NKgbJReAzMKfr3tKFRSVrbI5MYDctXhbG9Q9n0Px5Z
 dXmI2+FXHiEaPmikkxpfUV4usCj2/TaGURrpIj2RTVyLULdjzC7YVkztxdVMpx23VZA+plifBbw
 UuhJsgphnzYLQjQNr9TKXxTtmDViWL7Zu6mno5VTeVMXuOzLVu+aAEpva0xvrZA3Mmf5VeaYw6z
 KuLqotmI+7SEw1SQuZ398JLUQl3EqXJ0L+/Fopizl6OIsN13JKW50TdefZ47GOZJIKxG50iWqnZ
 5WXrrH5qyCsAFyWLQ/UXshv/cgpzgw==
X-Proofpoint-GUID: 1LD8ukwyitDIHHiANsGI_htzCnTkNUFh

From: Eugene Loh <eugene.loh@oracle.com>

DTrace converts "__" to "-" for USDT probe names, but not for functions,
modules, or providers.  We document this behavior.

We provide the same conversion for stapsdt probe names, but we also
convert stapsdt provider names and in commit 22932a9875
("selftests/usdt: add is-enabled stapsdt tests using semaphores") we
test that conversion.

SystemTap performs the conversion for the probe name but not for the
provider name.

Remove the conversion for stapsdt provider names.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c                            |  1 -
 .../usdt/tst.stapsdt-notes-isenabled.r        | 24 ++++----
 .../usdt/tst.stapsdt-notes-isenabled.r.p      |  4 ++
 .../usdt/tst.stapsdt-notes-isenabled.sh       | 61 +++++++++++--------
 4 files changed, 52 insertions(+), 38 deletions(-)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 703be112e..39714bdb2 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1360,7 +1360,6 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		if (strlen(prv) >= nhdr.n_descsz)
 			continue;
 		strncpy(prvname, prv, sizeof(prvname));
-		(void) strhyphenate(prvname);
 		prb = prv + strlen(prv) + 1;
 		if (strlen(prb) >= nhdr.n_descsz)
 			continue;
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
index b088b285f..19924aa6b 100644
--- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
@@ -1,13 +1,13 @@
-test:main:zero-probe
-test:main:one-probe:1
-test:main:two-probe:2:3
-test:main:three-probe:4:5:7
-test:main:four-probe:7:8:9:10
-test:main:five-probe:11:12:13:14:15
-test:main:six-probe:16:17:18:19:20:21
-test:main:seven-probe:22:23:24:25:26:27:28
-test:main:eight-probe:29:30:31:32:33:34:35:36
-test:main:nine-probe:37:38:39:40:41:42:43:44:45
-test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
-test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
+test__prov$pid:test:main:zero-probe
+test__prov$pid:test:main:one-probe:1
+test__prov$pid:test:main:two-probe:2:3
+test__prov$pid:test:main:three-probe:4:5:7
+test__prov$pid:test:main:four-probe:7:8:9:10
+test__prov$pid:test:main:five-probe:11:12:13:14:15
+test__prov$pid:test:main:six-probe:16:17:18:19:20:21
+test__prov$pid:test:main:seven-probe:22:23:24:25:26:27:28
+test__prov$pid:test:main:eight-probe:29:30:31:32:33:34:35:36
+test__prov$pid:test:main:nine-probe:37:38:39:40:41:42:43:44:45
+test__prov$pid:test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
+test__prov$pid:test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
 
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
new file mode 100755
index 000000000..234d1fa55
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# Replace pid in provider name with "$pid" for standardized output.
+{ sub(/^test__prov[0-9][0-9]*:/, "test__prov$pid:"); print; }
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
index 322bf53aa..a839d5722 100755
--- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
@@ -83,67 +83,78 @@ if [ $? -ne 0 ]; then
 fi
 
 $dtrace -c ./test -qs /dev/stdin <<EOF
-test-prov\$target:::zero-probe
+test__prov\$target:::zero-probe
 {
-	printf("%s:%s:%s\n", probemod, probefunc, probename);
+	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
 }
 
-test-prov\$target:::one-probe
+test__prov\$target:::one-probe
 {
-	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
+	printf("%s:%s:%s:%s:%li\n", probeprov, probemod, probefunc, probename,
+	       arg0);
 }
 
-test-prov\$target:::two-probe
+test__prov\$target:::two-probe
 {
-	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
+	printf("%s:%s:%s:%s:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
+	       arg0, arg1);
 }
 
-test-prov\$target:::three-probe
+test__prov\$target:::three-probe
 {
-	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
-	       arg2);
+	printf("%s:%s:%s:%s:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
+	       arg0, arg1, arg2);
 }
 
-test-prov\$target:::four-probe
+test__prov\$target:::four-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
-	       arg2, arg3);
+	printf("%s:%s:%s:%s:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3);
 }
 
-test-prov\$target:::five-probe
+test__prov\$target:::five-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4);
 }
 
-test-prov\$target:::six-probe
+test__prov\$target:::six-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5);
 }
 
-test-prov\$target:::seven-probe
+test__prov\$target:::seven-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
 }
 
-test-prov\$target:::eight-probe
+test__prov\$target:::eight-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
 }
 
-test-prov\$target:::nine-probe
+test__prov\$target:::nine-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
 }
 
-test-prov\$target:::eleven-probe,
-test-prov\$target:::twelve-probe
+test__prov\$target:::eleven-probe,
+test__prov\$target:::twelve-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
 }
 EOF
-- 
2.47.3

