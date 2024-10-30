Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD22144B2
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306143; cv=fail; b=Z1NEKWWBOB6apuLUwyKiJYkvjiX/SDJaIwezsVqe9yE6tFOCDV9IDyiy0cd1VfvwOlZOkOOZwdQfJ41MbFDLsMwjqNFGf6e0J3BeqGn7kRq483UwS8V7L6pb1YsOqz5VfnJyTI/wGOIMRDLLaCq3ftZcWeu8f+ZLluI9PCF+8uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306143; c=relaxed/simple;
	bh=rUFpoeQWJFr25LWX5kAlHHmxsuENGvKE7VoUyb+9FwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DVwMJiuLmrDGMS3pAx57f4i0jP3Ly6pZIHXOVaaaUJrZ0VxDt2q8PBdg9F61A+6pk4T1SaOwFpLb7KYz+2XyFk5JlUn1oTzCMbDd6abWOhN+hPVGOStVWE0tFe36ZSkPznSHy+yWXFy+2/kfbM8fbS56z4d8XjW67u409UlUED4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RVqi+rit; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=snspB29w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RVqi+rit";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="snspB29w"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UGXhLS008258
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SVG/r4tutL0F6MCLsG
	YosIJv1XoNTQDpYreYAfc2GAI=; b=RVqi+rituE73kiRUEocZJ8qP9QN3s9Jzs2
	9K9Zeg80HQk9Bh5AnLq3GZju5bGSuArQN9u7TbyKNLwd2iXxs5LK3Udk9XoXIshW
	w2rpqVmcWPWGgJuJmKafFfdyv6taW+BATa7H8W5/GXsUHLxtEwQUPR09MupnZDvk
	yFqeAnN2CBBHOiNWqtATpbFSPB+lZVLACKl0qs8kGMaKdq+i2b8Ja1QE3xj5Apoa
	t2KBvXg2QKEoofatC4YQ/+cOPnWSGqZSJHv2iiceVkXJ022fRSM0nAnNm03p6hrw
	GWeaPU2PiKjg2r7NvWOhiErcapob0oHayhWeODbVSXQM4idomM3g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc20cv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UFo5hF004798
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2vxshv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm/p8omEVGTVPauqt9BRV3LF4hDd4LTIEpCxOUei3JdwXcdDCxN8vpNpp3j02Fj/OuWaCal4WAGDvLBFM57/Tgz+eh1F4F0A2UEvfjlioKCTNvXmlYB+gi+/LbfxLHk5Sn5c+hRZHMJpvdnY+mUytf4GNGtcE0JFy5M5D/cxa4CzvCqCx1Ac1NLBypNm8E89JyujQwHR03iklLcUK/eLwOL+v2knHEoYFxZsCfuWFfg1mr/R7AM679rcis1/E8XN4DPimEypMQRTpnjwq8OBiRrXoDq/btX0l0E50LeXd/woXUibQV7HsJmIUUJfIrB0in88L5/CJs8LK1Z4P7Y3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVG/r4tutL0F6MCLsGYosIJv1XoNTQDpYreYAfc2GAI=;
 b=H1C4TmpAv03jsCntX5U55N6VzpuhEXmRBNiA9YgeBSGVliU28DerEnES5rzb4bdPxl5TZvx+7Qn9E8mpFUekIDzPMlXhIGe+vMdtJybz6dcvCXNQgup80ZmSbXPBCfHyer+pGUMDMujxEc45aeCtymK0uWUAfbsLDOpXrU7UDlRiGfQdYiDFJIUsxOPRvbykug+gsKzzuDRt1fO36B9ioHFZhB+OIOXy2bMEWgUt8uOE+PxZD2mmUHPcvw1ozqBoBtVLNq+GdcdmMIWAQUXouhOX0g/PAe+0A8Af90cMJyV6OnERYDOtE71oZJ0M9oKODk9a4A6b8bWiM2yGLuf3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVG/r4tutL0F6MCLsGYosIJv1XoNTQDpYreYAfc2GAI=;
 b=snspB29wzDxd7Gqapejm5nR0qXExbdj/7Lx7HFLYbfKXWrwPXBgWa5xgMNe4saUVAm5+s2mt9D66am7c3sU+/cgkAaMhrT0hKJV4EhacshUuZeSWfp9x38KWF2wHMc5EqAYt0eg0c6ROj0nM1Cnac01fiMllwHq9MnqnYIPAiOc=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ2PR10MB7812.namprd10.prod.outlook.com (2603:10b6:a03:574::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 16:35:35 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:35:35 +0000
Date: Wed, 30 Oct 2024 12:35:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 01/14] No longer depend on libsystemd
Message-ID: <ZyJgVNFkIk9xahKU@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
 <20241030121236.257803-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030121236.257803-2-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR15CA0053.namprd15.prod.outlook.com
 (2603:10b6:208:237::22) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ2PR10MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 8217864d-2a53-48d0-8e67-08dcf900e0de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZEFCFc9z3k+F7hDQa4+puQLdxpiCYX0+IZ3h27BaFaGb6l2KR76MLDWGkpTe?=
 =?us-ascii?Q?b7v0PBkyoLI9L1iRGMkVSpD8jFwecMKdmsF4qOLP4eRDzedNhTaQzJLxiFoW?=
 =?us-ascii?Q?MbaL2w3xykTk5Hg/WQg81e5FP/pKOb9IS65Ljh25zFewpUTdMwfcNu5/T2/R?=
 =?us-ascii?Q?ZFbdu3tClyyzIEl8qN3ta4AgTJsN5hUbi1XLqvISRMBxdYxJLWJGmPXBwzHq?=
 =?us-ascii?Q?H8N88vELkRUcWTto1ajzHHNaSv5YZID8g0YjcKEKadQCW5drvq4dw0eVS2/n?=
 =?us-ascii?Q?SKhYP14YU53SHbuiPhZL4oOFVNhHHEBYsZR6eIvFD4UUeOm5FXyS6peUwGmf?=
 =?us-ascii?Q?lBFsSaeG7MnVtVod5FBzlj7gpWJdCVl0y5vEXvcHu3ppnfmZPpvOmgprKCZM?=
 =?us-ascii?Q?XsfSaHpg00f87tKAzAzrga5KUiizoWG8FHCiCQ4br7ypORnloett1PZ/ZF6h?=
 =?us-ascii?Q?SSQwZAzbeZceiRojHHGHq4ksdDPugBkCwnAL5K0gedHhjD4HDAMMdD4HAUU0?=
 =?us-ascii?Q?NAIFfQwMp5cmOQJPGNka6q4ri/tPCPuP2b2a50ZuHxZVniaHMxAjEHlRGKW7?=
 =?us-ascii?Q?Yt6r8zRi5R1R7Jt3g13Vri8SkvCqW1tlokZNeWvxvqorvlNOMBcU3YVSpK1U?=
 =?us-ascii?Q?7t9HVYh7TDc7PNvtkODPSXwDMW6hWLaiIkC7VuEbSmU8Phje4LW5pN0xU+tK?=
 =?us-ascii?Q?GcFrZk/66O5snfD1rM0TITbil+7zZE9YeyYjzEh+aXkZPqzhfjnteT7vY2z0?=
 =?us-ascii?Q?4oExQgv6cX54WjMtWWDqCr5gtQDDwa9efvK777BfbgsL142C2vBmJdBQpIER?=
 =?us-ascii?Q?WgmWktOOnhEJGLOlSI8SWR2d9zvjQMADfQ0xr/xPbYhIsSkHo/rkTkjooBgM?=
 =?us-ascii?Q?OOmopBVEdCtub3kdkqR2+wGAVTzDFI9tcpEJ5oGRi5uTou30bM7AvFrumjA2?=
 =?us-ascii?Q?b1TEAN0vHzV4MGLuMolwdSdmT3IOlZbRiUoVBaaGCMCCem+Bxt+vtp6AaG+P?=
 =?us-ascii?Q?VsIK0hFPN958gN1BjQGzfN2brRDstXf3WxAJ6K8Wvys+/Y9JvXycXsNe1+aJ?=
 =?us-ascii?Q?UArfNk3pHBobLv3T0m2s2JEsKJeMpRnaFa6CFvSaeWlZGnv4NhSksSPsehKM?=
 =?us-ascii?Q?W3mqeU1l4GynfvEz9diC3zbVF75yTKXWcEV9Nz9hI/JSSx0iU2ybNxXErJci?=
 =?us-ascii?Q?I3N+TeIAnCl24sg4Zn3ykCj3106w87sJ91kTo9ANps7iLI18m9CCxOBaH9dg?=
 =?us-ascii?Q?ucXwEGoYIva9ZaNPggBMlnV+miHxRpWc2FvvAAgrjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+PoR7ZEm1u5CZj9W1oW0vlp6TnEiK0lL6lB0u9DapXWmNNrnFottNSvYChSk?=
 =?us-ascii?Q?ohLTPLMak00dVyHz9aTgOr0RDMTeuvz1B8FUKF1aVImRlVqoIqJdUcZ5OOSm?=
 =?us-ascii?Q?dyeSqeM+l3wnYwb84dnhsyllyJZzSMuqOxnOfaFvjs52OnPpAXoLzgeERw+1?=
 =?us-ascii?Q?jHfRZ+EqU/tjdtKHH+85RhMzrg2DmXpFky62foVGkGlRTTsJ3xJK5o3fwIXd?=
 =?us-ascii?Q?BFPm5VVdcTMSmjw4Eig4an5FakzhjO3gzQa/Y3yUgjPl2DJcjcQOkO8OMjm2?=
 =?us-ascii?Q?/altU6+yNUsaD1RUa2HMVpa+5s5Ln84fi2HHRmw4UhS4LiRuGAFFP92V6iN7?=
 =?us-ascii?Q?iOHuUgq95bAe1ir+KJLHOcTrd1fSuU9axwnWkdYMV+GMgaOnoHOSM1c2FNTc?=
 =?us-ascii?Q?8Sj54wjQ8x9NxTwy2UcrGeo1eD6TKfOLEwRLeucMTcRa/HVC3J9wzsT5Xv1W?=
 =?us-ascii?Q?kIFBFKN3s30ncFKOcKrWC2lEIpOPmtw8ILRkwAqDqmwtWNYGFCrWP+Zn/LP7?=
 =?us-ascii?Q?MUUPEEaBbZDZH8nIo7PiyoqL2WNo1QEhVEPHJ0wwNFIFt7/LxYCy+oueLZrO?=
 =?us-ascii?Q?LCj+el1soiisUpZ9YoFR060hswQ3RP12Y8zRaI4LJFBiObIlGQ266sRPtKuR?=
 =?us-ascii?Q?uelXMTxOOOusW51L9RcO0shZVeurPjvTOOoal/iKMZHqJS2tW+xPJkBYL/5D?=
 =?us-ascii?Q?w94nOnDIZg80FpVr6q4MsnJTwXh6pePlLcIb3PnEw790iRDBWLu+RRIiscHm?=
 =?us-ascii?Q?YR08U4rNZlbe0AApvGePCq5Kj6w18a1llOna7iOEyNv27OLcXJVHuge0AeOU?=
 =?us-ascii?Q?Bp8KKCMXOFG620mwSf3H6rvlowQXng35uMiibobQ/wuEHyt78viUiGaNBFio?=
 =?us-ascii?Q?cDWTNrENe1zpm4FVNd5HUkPLz039HWpems6B5gePlYaVWZFcA1pRBUeikSIF?=
 =?us-ascii?Q?5AxCGzGhEqSLCW7Q7/Me14iKBS3TUYe0K/qkGI8wKi3rPIGCcVizHNnCPUPh?=
 =?us-ascii?Q?qIR+zIpfk5qs3FKXg+MdMnJGfssQAXXgPR+FFbhzbmm33OYQ1dCAZPjA4gn1?=
 =?us-ascii?Q?vFM13kHu1doQ6N3+ZdRWVHVeO+5GpeRUgkuE/3GX0HyNGj4vXwB6eVIcJI8H?=
 =?us-ascii?Q?MMTPzWHA4BkmY0FQKqWbq3qqkeKnpZ0zW+23/+boO2/z5pm1ev8fb9KTnN/Z?=
 =?us-ascii?Q?1Kuui72Cz8lpynMXDzsN67+KmsS+ENk4bWOPNyR7PRFPx2eZmPD20r6MHgct?=
 =?us-ascii?Q?wwI7kMMOO4ox3qSWFYR+mVLknrWh2YH1toQeQ9hJmY5NtBIxoBteCkCsM8nV?=
 =?us-ascii?Q?WzXc5SQxe7Cbcrsx+NUw70zCZTzdyrkltibx85+XbGOu9BnbQBwbkVu6j22N?=
 =?us-ascii?Q?1m5DfL0ujzlvMXfvQ2xwKHD9/p5kE5jSqn8IF2auZWRFakWcWL5yrleREmLq?=
 =?us-ascii?Q?1BE7m4jOd3SS0c8nYaOeuJ2JTdz2jn3GlqmMFiJ6ELeSBBqzv05Q3AOWPL9r?=
 =?us-ascii?Q?cACNdwzZ6QDiLJaiBlzx3t75brZHuLbQ/FCQSPjqpPGGbw8oRkliWRIYQpv3?=
 =?us-ascii?Q?fMqyGVv7KXgPpynrl/j0PkMJMFDos4DEdEyDU9YuGy+8f+VHxchc/j7Sh+ZB?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j9NR+D/PQSPMjhsW0Vxz1w8/D+I3pA28E9YmpPG2g+yxCNbO/PzGUyaU9LYqmo+17jwx9zLdXx2ejaSH+cKViX0+dtxH0/4+QJBL/I9iIFUz+oDiXNwMbEd2EwVXNLGfD3EpC+XTpSHML9MeeVgj594ibV3Abbm6WnhXP4o/feraLmcgo9DWFX9pbsO/5ew00qw+nR7gVLk9HtZoDHnQXf6XV/KXeTYN+vCRVUKvSmzBcUEaXA79lhoaTSpM95rl8Rpu0MPvScM6BSBde/Ug03hjNgx6rV0vv1CScBHMxlwETqXg2ElRiXrC9XXfCvjWOQl8/QFrtaKm0wVLWY3hsKsa8s7p0agLVcpR0nRjMEcVhQ6mmzEo+Es8rX3l9Sf//ELpDG+kr28s0fZhUeg7ZAHHqfOef7DHSlZIG64cTMZWNp1nGstdv1B/IWA2kETUmag4uFqkLQIc9no8OT2SPR6EP5p/vOaOh7aYKuPKAfjhxK9MEMOR+gt4/1pMptcucs8GFvTr6few5rqwpmTVY+fk0aTpEuk1xF3813bd5zcgTyu81bxgTkt/kyvHq+S+0z+ieYBiJRrFVYYsVxoq553NBBiHcteQ7pHZpgP6nz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8217864d-2a53-48d0-8e67-08dcf900e0de
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:35:34.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX++FagnKRCIo94lUQenF60rUowWevQV0n/ctzFTDppsO6AmK6SGzPR5sUxkvUw8TEnxHFQupg8h5i0R985U0NisgpahQRDnH4YmAYMgzZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7812
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300129
X-Proofpoint-GUID: L1HTkqd-7I5fSQqmcjRg5ZCfLTPgc6aY
X-Proofpoint-ORIG-GUID: L1HTkqd-7I5fSQqmcjRg5ZCfLTPgc6aY

On Wed, Oct 30, 2024 at 12:12:23PM +0000, Nick Alcock wrote:
> We only need this for the systemd notification protocol, and that's so
> simple there is MIT-0-licensed reusable code in the sd_notify manpage
> showing you how to use it.  That code looks pretty much OK, so I modified it
> lightly and pulled it into libport, with one tweak to remove the use of
> __attribute__((cleanup)) (it could be replaced by one line of perfectly
> trivial standard C code, saving five or six lines in all).
> 
> With libsystemd linkage gone, we need another way for the user to indicate
> that systemd is not in use and the systemd unit files are not wanted: so
> introduce a new --without-systemd (and corresponding --with-systemd=no,
> etc) in configure.  (Someone directly running make can just pass
> WITH_SYSTEMD= to make.)
> 
> We lose one feature of libsystemd's sd_notify: we no longer remove the
> NOTIFY_SOCKET env var from the environment, so our children could in theory
> pretend to be us and notify systemd on our behalf.  Since our only child
> is in a seccomped jail and is part of dtprobed anyway, this loss of
> functionality is purely theoretical.
> 
> (Fix a bit of tabdamage in configure while we're at it.)
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/92
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  GNUmakefile              |  1 +
>  Makeconfig               |  1 -
>  configure                | 16 +++++----
>  dtprobed/Build           |  7 +---
>  dtprobed/dtprobed.c      |  8 +----
>  include/port.h           |  1 +
>  libport/Build            |  4 +--
>  libport/systemd_notify.c | 70 ++++++++++++++++++++++++++++++++++++++++
>  8 files changed, 86 insertions(+), 22 deletions(-)
>  create mode 100644 libport/systemd_notify.c
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index e7657d466df5..cbf27b6be111 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
> +WITH_SYSTEMD = y
>  TARGETS =
>  
>  DTRACE ?= $(objdir)/dtrace
> diff --git a/Makeconfig b/Makeconfig
> index f3d47c086f4a..346078598624 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -218,7 +218,6 @@ $(eval $(call check-symbol-rule,ELF_GETSHDRSTRNDX,elf_getshdrstrndx,elf))
>  $(eval $(call check-symbol-rule,LIBCTF,ctf_open,ctf,t))
>  $(eval $(call check-symbol-rule,STRRSTR,strrstr,c))
>  $(eval $(call check-symbol-rule,PTHREAD_ATFORK,pthread_atfork,c))
> -$(eval $(call check-symbol-rule,LIBSYSTEMD,sd_notify,systemd,t))
>  ifndef WANTS_LIBFUSE2
>  $(eval $(call check-symbol-rule,FUSE_LOG,fuse_set_log_func,fuse3))
>  $(eval $(call check-symbol-rule,LIBFUSE3,fuse_session_receive_buf,fuse3,t))
> diff --git a/configure b/configure
> index 4026a3eafcd3..c44c77383dd0 100755
> --- a/configure
> +++ b/configure
> @@ -92,10 +92,14 @@ built locally, none of these should be needed):
>  				"build"); seen under /lib/modules
>  
>  EOF
> -	make help-overrides-header help-overrides-option
> +        make help-overrides-header help-overrides-option
> +        cat >&2 <<'EOF'
> +--with-systemd=[yes/no]		Install the systemd unit files (default: yes)
> +EOF
>          echo >&2
>          make help-overrides
> -	cat >&2 <<'EOF'
> +        cat >&2 <<'EOF'
> +
>  Options controlling the compiler (pass on the command line):
>  
>  CC				C compiler (may be a cross-compiler)
> @@ -122,7 +126,7 @@ trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
>  for option in "$@"; do
>      case "$option" in
>          --help) help; exit 1;;
> -	--prefix=*) write_make_var prefix "$option";;
> +        --prefix=*) write_make_var prefix "$option";;
>          --objdir=*) write_make_var objdir "$option";;
>          --libdir=*) write_make_var LIBDIR "$option";;
>          --bindir=*) write_make_var SBINDIR "$option";;
> @@ -153,12 +157,12 @@ for option in "$@"; do
>          --kernel-obj-dir=*) write_make_var KERNELOBJDIR "$option";;
>          --kernel-src-suffix=*) write_make_var KERNELSRCNAME "$option";;
>          --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
> +        --with-systemd|--with-systemd=y*) write_make_var WITH_SYSTEMD "y";;
> +        --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
>          HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
>          --with-libctf=*) write_config_var LIBCTF "$option";;
>          HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
>          HAVE_STRRSTR=*) write_config_var STRRSTR "$option";;
> -        --with-libsystemd=*) write_config_var LIBSYSTEMD "$option";;
> -        HAVE_LIBSYSTEMD=*) write_config_var LIBSYSTEMD "$option";;
>          HAVE_FUSE_LOG=*) write_config_var FUSE_LOG "$option";;
>          --with-libfuse3=*) write_config_var LIBFUSE3 "$option";;
>          HAVE_LIBFUSE3=*) write_config_var LIBFUSE3 "$option";;
> @@ -167,7 +171,7 @@ for option in "$@"; do
>          HAVE_GETTID=*) write_config_var GETTID "$option";;
>          HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
>          HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> -	*) echo "Unknown option $option" >&2
> +        *) echo "Unknown option $option" >&2
>             exit 1;;
>      esac
>  done
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 9132c3e31c8a..346cd6aee190 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -29,11 +29,6 @@ dtprobed_DEPS := libproc.a libcommon.a libport.a
>  dtprobed_SOURCES := dtprobed.c dof_stash.c seccomp-assistance.c
>  dtprobed_LIBSOURCES := libproc libcommon
>  
> -ifdef HAVE_LIBSYSTEMD
> -dtprobed_CFLAGS += $(shell pkg-config --cflags libsystemd)
> -dtprobed_LIBS += $(shell pkg-config --libs libsystemd)
> -endif
> -
>  ifndef HAVE_FUSE_LOG
>  dtprobed_SOURCES += rpl_fuse_log.c
>  endif
> @@ -43,7 +38,7 @@ seccomp-assistance.c_CFLAGS := -fno-lto
>  endif
>  
>  install-dtprobed-autostart::
> -ifdef HAVE_LIBSYSTEMD
> +ifneq ($(WITH_SYSTEMD),)
>  	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
>  	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
>  	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index fdcdee14f851..c83f0adb56c4 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -61,10 +61,6 @@
>  
>  #include <dtrace/ioctl.h>
>  
> -#ifdef HAVE_LIBSYSTEMD
> -#include <systemd/sd-daemon.h>
> -#endif
> -
>  #include <dt_list.h>
>  #include "dof_parser.h"
>  #include "dof_stash.h"
> @@ -1073,9 +1069,7 @@ main(int argc, char *argv[])
>  		sync_fd = -1;
>  	}
>  
> -#ifdef HAVE_LIBSYSTEMD
> -	sd_notify(1, "READY=1");
> -#endif
> +	systemd_notify("READY=1");
>  
>  	ret = loop();
>  
> diff --git a/include/port.h b/include/port.h
> index 427129000b4f..6ce8611e9025 100644
> --- a/include/port.h
> +++ b/include/port.h
> @@ -29,6 +29,7 @@ int p_online(int cpun);
>  #define MUTEX_HELD(x)	((x)->__data.__count == 0)
>  
>  int daemonize(int close_fds);
> +int systemd_notify(const char *message);
>  
>  _dt_noreturn_ void daemon_perr(int fd, const char *err, int err_no);
>  _dt_printflike_(2, 3) void daemon_log(int fd, const char *fmt, ...);
> diff --git a/libport/Build b/libport/Build
> index 48ed99e2b017..822049f5e547 100644
> --- a/libport/Build
> +++ b/libport/Build
> @@ -1,5 +1,5 @@
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -8,7 +8,7 @@ LIBS += libport
>  
>  libport_TARGET = libport
>  libport_DIR := $(current-dir)
> -libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c
> +libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c systemd_notify.c
>  ifndef HAVE_CLOSE_RANGE
>  libport_SOURCES += close_range.c
>  endif
> diff --git a/libport/systemd_notify.c b/libport/systemd_notify.c
> new file mode 100644
> index 000000000000..f78bca6e14c5
> --- /dev/null
> +++ b/libport/systemd_notify.c
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: MIT-0 */
> +/* Lightly modified from the sd_notify manpage.  */
> +
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <stddef.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +int
> +systemd_notify(const char *message)
> +{
> +	union sockaddr_union {
> +		struct sockaddr sa;
> +		struct sockaddr_un sun;
> +	} socket_addr = {
> +		.sun.sun_family = AF_UNIX,
> +	};
> +
> +	size_t path_length, message_length;
> +	int fd = -1;
> +	const char *socket_path;
> +
> +	/* Verify the argument first */
> +	if (!message)
> +		return -EINVAL;
> +
> +	message_length = strlen(message);
> +	if (message_length == 0)
> +		return -EINVAL;
> +
> +	/* If the variable is not set, the protocol is a noop */
> +	socket_path = getenv("NOTIFY_SOCKET");
> +	if (!socket_path)
> +		return 0; /* Not set? Nothing to do */
> +
> +	/* Only AF_UNIX is supported, with path or abstract sockets */
> +	if (socket_path[0] != '/' && socket_path[0] != '@')
> +		return -EAFNOSUPPORT;
> +
> +	path_length = strlen(socket_path);
> +	/* Ensure there is room for NUL byte */
> +	if (path_length >= sizeof(socket_addr.sun.sun_path))
> +		return -E2BIG;
> +
> +	memcpy(socket_addr.sun.sun_path, socket_path, path_length);
> +
> +	/* Support for abstract socket */
> +	if (socket_addr.sun.sun_path[0] == '@')
> +		socket_addr.sun.sun_path[0] = 0;
> +
> +	fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
> +	if (fd < 0)
> +		return -errno;
> +
> +	if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	ssize_t written = write(fd, message, message_length);
> +	if (written != (ssize_t) message_length) {
> +		close(fd);
> +		return written < 0 ? -errno : -EPROTO;
> +	}
> +
> +	return 1; /* Notified! */
> +}
> -- 
> 2.46.0.278.g36e3a12567
> 
