Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066425;
	b=g1TcvMT6vazkQ/DcJro/RG0+A3bw7niokcYEdZKbXERYyPwF4O7qi6AEeW7GV6Nc23lj
	 JuVanaws7eyvffpFgxdO4lSYhSmifDUKeHjV8hyIe1fpq1iPtpnljQujiBqiE43i1Y3yP
	 IyMFS7WGm8aZNuq3I78NtUHRLjfd+bW9e1kxh3JpBlNl4TPfm9/VUMiPe2NunYyQbQ7gn
	 JqG6d490t6CmUjCslv1JdAppqE5qSKVIQQtZ1KaYtdP4tyW4qZDPvh5IkRh96zMtuwT8x
	 OkKnJQDs7rS/bbBYQzYI0t7XPl2L3awOp9kZqISld2zUVO7RuBJOrMkeg6rxekeuNXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID;
	bh=uNpT3dZ+kABbBVFWn4RQ8OVHp22TtKpT7CC0NJKeEsw=;
	b=ZyoCZH7AxWJtuy2d+PpB2eknFrd0HOmP+8A7bC2o8dSKz78uUIy1L470gbeAKosG4qvA
	 yWDuYn6hc2X4e7YRws2fKkaxpBk2bvpMXzbe9yVPr3qz5wCaFITz4Nli7YPobe00dF68V
	 5fY+KVJb0nzC2fy/ytetYEvnaE0cHl+pzoOtYkgsNAruyCZeAxpwRkXKEoLcdM9HcuHSt
	 n8SMgyYYKx5l7ardjhj2FZL89aJeCT+s3rSNjKeS+dCNWFagU+a7h8RO7MHCriG/Exq+9
	 WKYWdJp+0uJjO5uiUqpZJxNln89hyMQSj98cWaNa0Ku7IWYCD4G6AxElDnvM7vY4Ong==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b="C8m7g/MO";
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b="VqjJ3k/F";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476B606A32C
	for <dtrace@lists.linux.dev>; Sat,  7 Nov 2026 15:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9476B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=C8m7g/MO;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VqjJ3k/F
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7FkaHt4129162;
	Sat, 7 Nov 2026 15:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uNpT3dZ+kABbBVFWn4
	RQ8OVHp22TtKpT7CC0NJKeEsw=; b=C8m7g/MOZEth26bWdUBbNtkGYj0cnnfHYu
	squD/ab4coBEt0v8fCnqnZJjetU2K0QCSM6H0KesndfQe8EXRVyQhn2yDQUEsdDk
	wPGE0yPGa0iAHXzVcmLQ+Nu16IxZiUlkla44DhKLzBscXtZpBWBA/ZUSBd71d+PG
	Mx7xbmruHhPXpCLv1f0kE8Yg0iq7f60MbdJffjvEtd2buNjGNypvl0rD53p47m4P
	Wtp14wN92/EWuU6UskSEhKceJ+NCek+IftTHkdje53y5yHPUd5LiDrr20ToXsRdw
	u1iQ4z9TnDXP4WTuTlLL1ACemScK4nv8BS2a6IW0+D1g2AD4qxbQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hsvhs0a8r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2026 15:46:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7F03Xl3527962;
	Sat, 7 Nov 2026 15:46:52 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ht28xduuq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2026 15:46:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCEqZoS/b2q2AgtVEuV+FvHzaNL9jNrSH4sijGM721nsE7X+hnykXCCwhu0F5yzlmYuxb9b2/0IWZUXaG+82gceu+I8f/lJs2iYyqJXCgj2XAVAEH/hpTljar+nlq9e5EoROGQSgrjv3hLu+ikAutb1UtI8v/P1qHstG3COPrOpgUAj31meKd4+Pp7K0Ozyir/lm71M60NPVBUcJPANqTcFVeaQMZCSn4WaWBGkx/dIRCDIvmY4Yj3LZUlkLicFZyinXvnMD0eTgB2dNLY+X9j1OTDRtGP9OXW1Bi0Jfn1pV/RWXqKFD5gVH7absAQD9bskoEHmBcLsU+Ank6MRnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNpT3dZ+kABbBVFWn4RQ8OVHp22TtKpT7CC0NJKeEsw=;
 b=ZWHkxtXW3KecHl2XfnWulgXfCl3GqEpQlJ3ReTvdc2MCKQwHTVLnqh01XnkGl7Mwc0mKgovfnBelMd6Rih9Nmpd/WevpEYe5keQJGWMJ17dC2dUh4xZz742siwjpE/Ig9Xdw9CQzcUqqaar8Dei3h1KTL6nAIvCQYQisWY7PxzEX9cV6uJH4MMjguCsEIKPe7pAz+y8ASPyYbdTYnGHnRnqoj6QdG8a6SzQ66VS0aCaR7JI8eDW9G/VrvswYP62v7ObzRylQvEZH/3uU2BuDL5K4gKPxgVzam7HuDAt08TlfSiy766S+MYQ0neh9h93M4oSyGtjRyLPOCnixE2z38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNpT3dZ+kABbBVFWn4RQ8OVHp22TtKpT7CC0NJKeEsw=;
 b=VqjJ3k/Foq3LAMe+DXj5kZvfoKOR2GHoH3kiHIXZTw/GnywvsMzC6I/Mto6gcpDnHuZ6KW42kEN1sjA6zwDqepG/914PsW2ny1z2lmJ7Vi8g+lRtpjeCvT72MhIxVx42ubrdyfCGNoi8CuEFoDa61SBvfvN/SEC+G4iPJnbHnbQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6030.namprd10.prod.outlook.com (2603:10b6:8:ce::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Sat, 7 Nov 2026 15:46:50 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 15:46:50 +0000
Date: Sat, 7 Nov 2026 15:45:09 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nix <nix@esperi.org.uk>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 06/20] btf: convert kernel types to CTF on demand
Message-ID: <au9HhRL-aJnNJCiw@kvh-deb-bpf>
References: <155d3efad06100688e3878b86d99cdd7@oracle.com>
 <87qzgyt93h.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzgyt93h.fsf@esperi.org.uk>
X-ClientProxiedBy: PH7PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:510:323::14) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 102abbea-38ca-48fa-2b2d-08df3ce656b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261022105027099003|56012099006|261026140227099003|4143699003|261028144727099003|261022075727099003|261021135927099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6fTBSdijiyy5BK5jW3WMr7z8DLSzfiUT8FwezWpv5CLo0bzBkzgJVXUYw7CrjnAIfs8ERBl/G1OrWRO32Ci1Ushu+XpwZJZQ2VNBOyCiBfZkdIDuXZsij4tZmnGXsjo8KkUuNar/+Gtsz/8SLi+gJMwUp4n6hp8EoBPMgBff2EFblfFjX+hrEr4velKUoCwGKtMo2gpgeu/WiXQORcqaLzvqH7Pbx7fLJAbFDtyfNYV0w/7jBknXzqyUfdqQK0pHBZULrr+cfeuxjV+XcLokuG6RPP8vBN9HvVw/4eWv3aD2F7jtMiyMRwmiFe1fxBsNTgA+kT3dL9SFlkhXeLJXle170EYyT7Me4LOGfc/PIlYKyCEXNZ8L0kjzrtbimfZ3pDmde0ME01AsnKt+CwjcU/XCE0IQqcKzKQEBzMM3Gusd8cRH4GwTlHOQwfO9N2BU62QRiCkqwKAM2jUYXTapf3Rx+Fj/BVNFyna+D6xFZOwA2hWRAj4GZ+0gMwJKrYB8C8ij3VyuQ/0zlJOwWV0ZDI3aDBNdPwtcTfsuy5mIMdEQngdF5Jsj1a4y3AsllVAeh8s3Tze9JLvhyyVX3rjMbJiUF+cxv8/HW6WoWpWFGB8FltzeBd4zG/DfO08XuCNmSW53efw1WVOzVhAAv67QTAHooSHDq2UuK1Bi6P2EVF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261022105027099003)(56012099006)(261026140227099003)(4143699003)(261028144727099003)(261022075727099003)(261021135927099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wzI34qmTLpi0JbMdS1UJGimfK0GBdlWTZVngsCFWD1T8y49nxEr+GYRXZ+en?=
 =?us-ascii?Q?nHwTjPKptvFXDBRzqUzE1d9OUjuaSqSTbn7+KHPPwW8kfI+G2h0OzJ44hmEy?=
 =?us-ascii?Q?Q2xX9uou48kCyiyb++N4iUlB9+UjyoIci59Dh44xDksz3gxc2DEjXwTAfv2t?=
 =?us-ascii?Q?W9T5P4Pt7cPa0YJWU8bskPmNbnbmOe8GFVsZ9lfRc5kD7rxUZUL+fRxegqBW?=
 =?us-ascii?Q?gSC0vBKBsYtGMT7KI6lCqLuymxX67EC+3ozl1/LOYjUMxTta4OwESj/mo1nu?=
 =?us-ascii?Q?h9pImjAiZcKVykCImD8SGgk9EH/Qp6W8f4p6rLxEtF2PR/xiNTybeiAFAvW9?=
 =?us-ascii?Q?+NZYHAOJ8zVwYFa0NzA0rCiHSXojc5RcDEi2iCqIP9rga2oH2L85wJvdlp+g?=
 =?us-ascii?Q?x9PlEP4ROeD+uu7n9qI4HJjCHbxYvf2QhWCRxKHzTjQtCJX356V+RfErh+qG?=
 =?us-ascii?Q?/uqmPeGywgLvfasJEdDr65Kfj0EFw3H6fLVDekbbEOd1GES0QUsCTgY2SjVw?=
 =?us-ascii?Q?QM/5xKXPrLEgL5yD4/r2bKiuDD/CQUUYwq0TYraDBUpfWl2nZ+i+63BlWE5c?=
 =?us-ascii?Q?1W7WTzWI8aULa4co4xp+iWWb034SzjLZEMKaOuCFlgQoWTcXeVL33S/TNbW6?=
 =?us-ascii?Q?2WVu5LvtgJlGMjcCn0mB5NwdTLmhzu+mTgAsnVWnVx378WHvTHxfghdPMBeQ?=
 =?us-ascii?Q?jNoplov8hREX1xIq0l+5zq5HfhLRA9ndLLGKqerYCsxqMrJXp28aPAGJOyhW?=
 =?us-ascii?Q?wO8GXw2CBnI1lSgVII1KYWnO5950vUKcROc85er4zptwVdJl/0gMw7wgplzB?=
 =?us-ascii?Q?T3oIu74vgOcoua/lQdpKXAfkzQ8maT/CBOcF3Ksyr97AEDt8JR5aTj2PwC/q?=
 =?us-ascii?Q?ueP5JG1Lyd/YbLrqEWuMtICUD7HmB86JgrV3r/nOz+J3Om1MdwCmpPCA2Tek?=
 =?us-ascii?Q?nQwYuFs7Kub+yx3AakZ0ECZkr0pu848Q2iM8qk0uI0581VjO6toISA6dZhJW?=
 =?us-ascii?Q?e1pykm+DxF7QfSpdit2pHdvercxhspQkNyEBwccxbPReYeKxtp/pGf2G+dhn?=
 =?us-ascii?Q?5euKw5WCpf+2Lhz/PnxfJCnvlOSP+r/L1rODzSyEPbisPAFifAj9r2fmktRB?=
 =?us-ascii?Q?qe2h74YgJiHWFhsod//deG6qVNZ3XI8o6WIjJKi9az7pmLFi4lqNIvdSvuu5?=
 =?us-ascii?Q?yTpqzSvtVcLaEj6+nMtGccmTMzVcBd0ZvgG83q60nuNHOhRCoXTYlj0pZ9DC?=
 =?us-ascii?Q?lfRurKM54gUEYsoE6DaFTrZJ3ivBrBMVzM4u2iP+SJ+fl/JEn+acYPDatHfL?=
 =?us-ascii?Q?KBg2AF/xcuHeCZ62honla/DNNtLJWUtpQSZ3lmfTWSbtX92yV53EE/lX7mT0?=
 =?us-ascii?Q?XzImglI5abKmSUwdC8wm7zPijRWczXS+Is0N4WVfc8d2NJ9524+t+6OKJBPK?=
 =?us-ascii?Q?GuK2uDUs1FHaYKnSBDuHry6OzJwCByDTwHarZHFvI19iEi95cSKWuehhAWF7?=
 =?us-ascii?Q?5YYtwRfC/RRq4Z6i+GqV/vHcFfJPxau5MtEeusElLSyBaBuVe9doq3Dh9sbq?=
 =?us-ascii?Q?WJfb607u19ndXrJqOYFTbfmelLv9Mpbb/iB+bH3/FXH8SSAYzexGegUBhhRy?=
 =?us-ascii?Q?VvoW4RRJ/7i9vsqu1sx4AtmiJQEs/AU2n1HALPynI+wq4yOYbvG/F5BYDk3q?=
 =?us-ascii?Q?51nzkNi6FqWV4pT/p6zRyiVD4TjEEOys92bLTdeRuo53M+0jCFPXzt8Uj6JH?=
 =?us-ascii?Q?UbHMXdk03Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	mcHY9D3NLbCaID7JGGk8MNkuEsQvYlUgxFRL8paxgYLEnJyoJooPdpAV6Rs4FyFfe44ul6T/70oqJTQi0wwVBlgCicrMQW0ZGv7iuabJjdGejcAG1PUWI49y/Bj/BYRH9lS4No7jEvZijmIy6qh2rxA67IrjzsTtaGaXnv61PspK4M69JGmsDeYvCcTB9q1fAIYly6/KG2U+KlIS60MhivnCnuvG++Wt0+XTWHSkzeo+l0c2KsRsvRK63ZWIbqy9u2g5htrH/rVBRu5ygrAhEiVW/P/Y7ZZxAbOf/mVqh/uPNHUdrMnFKX3nLQPf/2oA6B80VnPImoKhqKFMLg8a2g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AsePwmH6gYSwivTQGZ7RWHkOty/EDBDRyt7JMgaQnMi16Z5SDm6PF472vr7BNzD+v7mZxa21wYLwXbZiEHkdIpzQQQFux2j3/oqBDEq9PoZ/d/bq5AhtqT8uCVjqAwOzVlICbSHcR5QVZzmud4bD3nSJVp6JPUe0Eu0To8yTXY6VCwPyhFjH6IptjpVYSCT9KRhMcEUvT6rCYnlflg5wzlKyx0gnJDN0LFTOW+x/AKLBaMc3ZxNXsAwXFs20WSoiPFdaGm4ftB7QehnCZQ8XzBKGmjn1X9uosE7PW4tvtJh1thlcYv6rgAP/f/ZQT84Po5JZQ7CdA0cjpSyAyP/yLu3hPGvL+fCvVZ7Y+jqhdycebysedL1jYdC84XsP0NRqQ7HjA1a+OT1naKBE6u2QytZntmlGPjM3yhx5ag4VYhzObCt5boOj5mHJffWa7JzZzI1OtoWk07eOERqv26acu8aIMyVMiEuDHsXb2FguCgpRSKgAKujtaqmORFGB595m0NCUOPNuhjhrnlloZUEm2ROMYLBkt9yTOBWDMdtIUDdsBSAWxs41QUVQoa6Yc4wys3VTIJAjJ8um2RXoC8pHwnUpCaLEgJWRUaWUzu/R12A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102abbea-38ca-48fa-2b2d-08df3ce656b9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:46:50.5871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhszKgrB5v6rEYTDTe7cWGfnLoGNA3mPi1pJUNNjDCFOLGXPDNQArcQLu7GVpho7o2hL3tp9LSJcWQWf4dSS3V1zRcy83aOiF0QXXRNLb3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6030
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611070062
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA2MiBTYWx0ZWRfX1ejILCU50X0M
 qFnur9jN+cxEIh565/1iNzI3JDYXzUfrrqZG7TDmOyH0+ghMjQ4nF7OzCWvrMZT7MYR56UmZ0pn
 7Gxn4h5nB0TG6VWo4GJUIuxhtBmoqZul+6SBnqzra+u8QmeoP5E3
X-Proofpoint-GUID: V4nLSDbO5dNo9ppeau7b_AbJ_DicVIlK
X-Authority-Analysis: v=2.4 cv=B6EsQ+tM c=1 sm=1 tr=0 ts=6aef47ed b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=TUBhBL3BP78BQ8eBtukA:9
 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA2MiBTYWx0ZWRfX0TrvFHbCSIXj
 fh93YaI5YBDA4OGXVQ8s1qNLA5j5OW1YSEKmGoU/s8oAQzrSKz2hu5pKUhjG7oYBl2AQ7j8lRF7
 lsZkY8NOj9ThRbZu59i+RRRfvHJ6KaIZHAlOtQLWr2a3U7lB7jG6yCMytvlq4cw2GLMS8oB7p+T
 yC8Yhn0hmkPBXVtSHB/EeEu05hKTMIBREqXAKqqsQ+edSvQqBdp265NNlB/queTo/MgCJgcoD/l
 9lBZZnzfREuM2rCLH7DfrsyVpXdniRAwfbgLGjaE4yhRlenz5+oYv9Y7xU1FSuZat7PJVJZxP1C
 +uM2QCOlYXIzylkBStQCQWWzpB60yMSBjafQs6XJDkOT94u69DGNjkQXGUvPt+mzeMpdpNor/gk
 1XVN49nA0oXxOR+AjcQbKQzWSVsr3PoX46JKj0dTgzscAhl8AgUEoV0RS7G48PJvDZOjTrveDRK
 hrqpEfw746X+kbObdGSfFzGk71f5Zias5sV75lrs=
X-Proofpoint-ORIG-GUID: V4nLSDbO5dNo9ppeau7b_AbJ_DicVIlK

On Fri, Nov 06, 2026 at 12:53:06PM +0000, Nix wrote:
> On 30 Oct 2026, Kris Van Hees said:
> 
> > Index BTF type names while decoding, and initialize CTF dictionaries without
> > converting every BTF type.  Materialize requested named types and their
> > reachable dependencies through a common CTF lookup helper, including direct
> > compiler and provider lookups of shared kernel types.
> 
> Nice speedup!
> 
> > Reserve aggregate shells before converting references so recursive typedefs
> 
> Maybe 'wrappers'? 'Skeletons'? Shells seems a bit... strange to me,
> terminology-wise. (Also, 'shell' is rather overloaded in Unix already.)

I will go with "werappers".

> > and callback prototypes work regardless of the requested root.  Grow the
> > shared parent dictionary lazily for split BTF, and roll back newly added
> > CTF types and cache entries when conversion fails.  Prefer available
> > aggregate definitions over forward references.
> >
> > Advance the BTF function parameter iterator and preserve packed member
> > offsets so converted prototypes and conversion retries retain their BTF
> > information.
> >
> > Reject split conversion when archive-backed shared CTF has no matching
> > BTF-to-CTF parent mapping, leaving the module to the existing CTF fallback.
> > Keep this guard with lazy conversion so provider header generation also
> > works when the kernel CTF archive is present.
> >
> > Add synthetic coverage for lazy conversion, recursive graphs, pointer
> > lookups, bitfields, forwards, split and parent-only BTF, failure recovery,
> > and ordinary CTF dictionaries.
> 
> There doesn't seem to be any attempt to preserve IDs here -- I guess we
> don't care? (In particular, aggregate types end up in a completely
> different place in the type ID space than they did before, before
> everything else... which makes me worry slightly, though it *should*
> work.)

As far as I can see, preserving IDs is not really needed, because the
BTF is of course the authoritative source in this case, and we construct
the CTF from it.  The construction process is, as far as I can see, safe
and ensures that IDs are as they ought to be.

I honestly cannot see any way this can go wrong, even thugh things are
going to be in a different order.  We never actually care about the
order, right?
