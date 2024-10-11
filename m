Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEF1CFEDB
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677845; cv=fail; b=ddFk5c/Gj6deId06CBqivJYRZSWObApKs33vw6GeG/tp01aNPkSYMh0OJfat+6uiwPQFrr280MlkwEu/F7WYSVTMs5rYsmhgF0jKFQLEG2X+a8Pq9ZCIqeHitNGXqW++aS7KrmeImpaLn4qnNi6+8P8IV76j5dTh0KEVeLFWcxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677845; c=relaxed/simple;
	bh=A9xLczQA2MOU1T77L1WuWLMERmLtOd7XWghpQJcaC3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sut78CiDEZ1kkRRUrz91I6BT9AyfeWgWduQn1BKf2CGplr592BsVPqiFB/0pCDuF7fAqZLqEtdBYGjsy2Wu0phUVyyMMGFmMnjK3gRJI1SgQBGElyQ4bRrSnL2aPHqODqnvgplDPnW4rEdZGMTVXfP/jX611NrpBACFARSGD6/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OvpFFZKq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ixzGbtJL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OvpFFZKq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ixzGbtJL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BJ7hXN020253
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 20:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VxopMrRgT3Z4pw5V15
	zs7hV25jZB8TYET3XFQrPFliM=; b=OvpFFZKqex3ehBM91VvnIQnJc5Dr/B+pZO
	z84AB+8VKAaT0CDDFhaLqh7uznFhFHgOJtvh1sgGaptzwZGsOvepNcTAI3CXvMj/
	Bj0UjyB78WaqL411I67r0Wtjf7KROSHu9IreVd7Kk1O4BFOYWDAQiaOIccyhN3Jf
	El1GWvghlaLzmuyvllDilruaX5Lsf4HqyiuZ8OtvYxA8uZTx0VxwDjttf2WMpfzc
	ORwcThYCH+rDemWtyGc4OEHQusW/qZ25phssGY4eeXdWC3BwN3T76O3unVd+WFiO
	VBQzIUV1c++kmIAZOwcAHIjEUt/KsH9WwYtUorpyz25ho7P9K8Sw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42306entjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 20:17:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BIA6Vx040253
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 20:17:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwj228y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 20:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6s/SNDRY8/8F8/Y5QAYhM2w2c5mPAnWNP9vwUXovjeM+pDP/A67GPxFyCSeXvJJScVk8qvOmuQqAnBhdiR5jpR/uqBnyM9R7tk7rphldB60pTp07Q0qftX4Pr87qMtx6yZCnl/97QGKGYxcr9jsbDwr2udgzGlqT1brynkM3FdjXtKJUFXu5xfY/Fc9LOtkAVqpNJQ4X7NpvCtj5eifg5HUSwYV9m0xYiy7PV2b/rHJdBwI2dBbS3dpuQ1zDPR71JEVbIq8jyvwRgx+wcrGqRZg59A0ICDzTnxlXlm2MlYn+CBVx0IYX7JJNmcGzAYfKINpwxdGpBNzMHS0XHZDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxopMrRgT3Z4pw5V15zs7hV25jZB8TYET3XFQrPFliM=;
 b=UGvNH4+AICcFCSApIzwHi7D9xhCA/eeQmnrPH1SmW+7Dr9sUjbuMjmWsFZPT3gz48zFjCPtZUQrwvEEKv3+qEpUXjFhH9LddFNohbypPNoNTavopHinOxqqdl5w1q+FdAmqic/SARtqmPxdQGKrfVs7ujDLOT9nWIEPwLRtrB9Yfz7QsouzMsnBhMGYkBAWSWXqSnUt6yQOFKyzwg3b+z/ZkPCTwRWz2T9IN/tfYx8ziU95YvR0CUOcKqqboayOW/66Hw7h/QQyyzVnCGP0IR477K1s8Jtd63SDzr4rzxkeVqPVjt73WTl4TX7cyVMhfct43FRyH8QqFfpMgqphHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxopMrRgT3Z4pw5V15zs7hV25jZB8TYET3XFQrPFliM=;
 b=ixzGbtJL9DT4Xhpvep3DKrr2evlOTn1JaKntR2mMG53W6bQZLeq2ncx48PD8P7zUisOFGM4C1t/XSpzcCdZjbF381y1LqWa6dY/l8KRygCYSO1qB5dUSSa7JdK5UQcyvu2Shh6HoWOJUjbiVAYYlrei0qICBvNULdTQcgMtar7w=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB6683.namprd10.prod.outlook.com (2603:10b6:930:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19; Fri, 11 Oct
 2024 20:17:18 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 20:17:18 +0000
Date: Fri, 11 Oct 2024 16:17:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 dtrace 1/3] fbt: support "."-suffixed functions for
 kprobes
Message-ID: <ZwmHyQptm19CO/WZ@oracle.com>
References: <20241011102810.989562-1-alan.maguire@oracle.com>
 <20241011102810.989562-2-alan.maguire@oracle.com>
 <Zwk9hzo9WEqrcKdp@kvh-deb-bpf.us.oracle.com>
 <86bd5c9c-572a-40b4-b655-6c61ebdf1960@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bd5c9c-572a-40b4-b655-6c61ebdf1960@oracle.com>
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: 37dbdfe0-e3b4-4e37-ed3e-08dcea31b438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SWyet/CAwyJaKqwh2190UJhcA8ac+JTLqp4hBd5L2JvpQytppUh195lYpa0i?=
 =?us-ascii?Q?7e80VPniJ8bNNekd36KN2jdEkr79QwJEWX+4fSXaLLpx3UsS/2JXgE3dT9iL?=
 =?us-ascii?Q?U44XYdyMNKU86Ln1VKKs7NcmzH3VGv4iT2D1NnXyszesxWE0cm22/pirxF0H?=
 =?us-ascii?Q?dsW29Qr4zyJandaXX2vSBwXPqDLjSpA1GAOCLYOe/MlEogdAZGfUnvk5qw9j?=
 =?us-ascii?Q?whkyMOxDHAEsFPxUlNnm0EFcRZhLNpt3azgox7feQMzGa+ftWYdLwvxQQeWN?=
 =?us-ascii?Q?FL15ND3JPlLEgaWS95CsRcfejilhaaD/8M+XCScl3BRxnZcPZ7fhkZ1IgK4T?=
 =?us-ascii?Q?nHVrC+5krj7iiHkzt33Ef91ojqhKvvoFd5oPQerIfQ64PLmCjDfG/k+oBusW?=
 =?us-ascii?Q?rGEbqKVdm+PLf1Rd21iJGwhl0n9euTZO8hUz/YCqIexjroursvQKAY0vhDjP?=
 =?us-ascii?Q?hTb/i39np8yqAQKVLlYA6VshECpWBP4ESNrJwxYyIjrkV6MzevPPjuP7vVhW?=
 =?us-ascii?Q?yMo1yY81z0mH8+xiksDDGhkLTcwKOWAtnuD7mXvjW4T9e6jWfn2VwdIZe42U?=
 =?us-ascii?Q?kD+k1KCR8cUSzbiHUVi7qEaRRAEXj+tQASLOA3fzXMbn1yAJF2/vBYK1m7Sh?=
 =?us-ascii?Q?vTmfmnHPrDndkp4OzYM0uF50huiHOaOBk88NQ6iaoCTAeiNigrdu0pN5rDTz?=
 =?us-ascii?Q?YgFJb5EdjizulcG490bq7AD8PRxp/kIIm6hxwTI2xVTXVM9PLoaoq3LkmySK?=
 =?us-ascii?Q?/CVh/69S/vgZH5YbOaDPPRRMJpY+UjdAOJsht5IzHfbFTCnIwDhcj5YnBQ1u?=
 =?us-ascii?Q?pbZTswAOCnRJATn+LHYqAxFRF+6zPcCV9vmB7yFp0GC8pn89HZviE06kcw58?=
 =?us-ascii?Q?d3mTvAt88beHduI882he8ZcK+8mFsCkesHztoDxGiBuKW92S51Qw6de3HKaT?=
 =?us-ascii?Q?qpvYSBTTQI84Mg2dh3xe0JgxGhUX45AzPhW0pEokWcrqpw7YEQqflaliQwfX?=
 =?us-ascii?Q?FZOrOXB4cIU6zpMduetOp851ypcouSc9JXYGp82htivz/wFYXaMNhhMtqaaw?=
 =?us-ascii?Q?CFscnNKY7AcH5bCm5RV8IwFcyvfmFC+vE9NocaPmK5lMNONWvU939DG0O2n0?=
 =?us-ascii?Q?SzQ/zOY4CwggTJ9Tqgnq/BQ3wtzhDL4JNXhH1ZKwdB3cm6sjN6IcDnaYP3WI?=
 =?us-ascii?Q?0mWoSjJZRCOwFnpg6bbqC0toLegM43/kGVk9wxaklqkmIh31fuvmxkiq5hc1?=
 =?us-ascii?Q?8c+pNKdQU4XZR3FuQRWct82z3Cyjc4mdEo9K11JnyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DVHV7UC54dl+ra0i22flyYLouOVHzJOFawazmMMKyTueoQ/I3gq7aoX9lmHc?=
 =?us-ascii?Q?6CGITpaznRsq9VE2D67vyxu4h5E2WX7/LgV+TuTUeAR3E00He+MaIp7XqA4c?=
 =?us-ascii?Q?VGn7Ou0k4iD7s+VkQfVp0VpEYZzzBliBeAWgf1G4PrKaf0+LOwL2F+y1YiJG?=
 =?us-ascii?Q?/h2b3i81vfeh5U7Xlv9cZYsEr/WmWB24vMdhUeZpQS7POTwlspaF52TcvwsX?=
 =?us-ascii?Q?mT4iwEuJ4WiC4ygEV3dLh0tBM2XuE/AYja0Jp24yaM/q+9lwFuGD45rVYTFi?=
 =?us-ascii?Q?3IkBB16Do73tXT6zUK1JU44LmCfoDAzxoSnUlG9ziMwcQpekj3cjjiVgqlI/?=
 =?us-ascii?Q?RqSrP9VGp2kVXclvp/4DFuqyvNTWzUfXTZwg+SsYDfs7poCWLAg5mz9GXL/u?=
 =?us-ascii?Q?k1EePGyjMLi5n5j3rjF70fAbxU5xCkmdo21UtiRoT51EWEiXKm4RF8Gk8zk4?=
 =?us-ascii?Q?OujVO7XhnAgoxaWFktu2u+GWbSByKh8jOXWUgEtBRERPHMCYcGvBzvBScN1k?=
 =?us-ascii?Q?Tq1gEiBPGxESYda3EO2a2rfdhSUogf15Oi0kya3GMEK4KMl+AqawZ0hbhJxl?=
 =?us-ascii?Q?4JgK/8iGcKWtiQS0mFTrpB0HEIprC3IcQaAVGdmFRF8h85ruhmANAoXgER0f?=
 =?us-ascii?Q?QfrBmnlnxFBmkV/I0Hfxifx5E5E8MVMR3fVtwj5TQMfmXbYsWavzB+xTSQoc?=
 =?us-ascii?Q?ZrnqbfT9zKRrertm9CqONkUSTA4QbCm8e2tJAcqiegtMvpt/v89E74JQALM6?=
 =?us-ascii?Q?brytEAtqvcNxpWXmwqAIx9eKEu7DMOd2hvlSCODus5KC4Ts7T+WQLGrotmEr?=
 =?us-ascii?Q?8oTOfS9LUAaSm45IIg+lVMEAXfOhl0w4g5yXhh+oquI3CYiqDWyW4o4kdphd?=
 =?us-ascii?Q?m8ATZWH602EXMjAQnsFxJnpnuUZ0sXBWoVa1d8024A9q/vasrjrGIXhpJB4n?=
 =?us-ascii?Q?z1joTzq3GHLXyf/ROHxFOhnpohvNgA5VNbunYO2OyXq0pBuEt4Bz7kMWQv/E?=
 =?us-ascii?Q?Go3jE/2jDk45masSuXWV/BfTOB92sEOxpztmEQBe1knOji3ZuaaM/e/z807K?=
 =?us-ascii?Q?md6wQlolMb0jSjhB+lqcTh/XGGanMg/c2ZfuYLec5S8GC3RPhdRp9WSAOv5/?=
 =?us-ascii?Q?PQj7bAdyJW3ur1XC5K1DLmE8O8UeT3Ofx8xRkXTbtPqd2tAsgYsGpofl+hpP?=
 =?us-ascii?Q?8Ii5c/sr6M2SoxARvZamOiuKcaz8dZ4OqURfgPQVYf6cc/AMJhVFXSWfoEIx?=
 =?us-ascii?Q?1av9gT5Cpnw/C3fpDah2X9+v6xNjEhzMUOaX8NmYfTaOwQlYMqB0WOhNvmHg?=
 =?us-ascii?Q?KCWutKd2B9Vx88Aa5PHgvhp/2FAm1/N/kEwKMyoenfccKePwhaJUga3ri2bp?=
 =?us-ascii?Q?Fmtuscc/b7SFK4gnbv5D5B/UJenu8KbZ+4MHYm6GNSVJrj2AggobdMqrqMjI?=
 =?us-ascii?Q?kmOCDeMFI+J+aE9bym0GzN7nquUbZcaTYL8e8uAz2VZ+G6Nzix9AUre9RG5S?=
 =?us-ascii?Q?9+cBcoMz7hZbjvgIHFi4BKYlaeIr2bIgqJc+oZC/l0h2+mG5p5f6o9V7/TQP?=
 =?us-ascii?Q?GNMPL4RqEAn7Vy4cAoMBzSx8pq+rI/ob4KMhgYJUP0ji8x+neZ6kqXk7gtjX?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Elz1spOn/f1sUnUzMbeHbEzn0tBMRgnhIogYfFDG8dPX3QEMr9JDUhSp4apVq9aKM49Bv0ORbI7Fr/jc/2ZuIxIKf73wchTZPk1PXBI02CxAIDOMzrvK0qdFCKn5RadAVR00+/fncT8nvHo7oOEdEW0hMaloYbNBx/IZp3MDwMAP4t5GAyLxhI3FmlhlNlX3w8wB69jqW499I/+vjszQsmhVDLXekC+WiDsRNgjFixPEd0k9As6YS/Ue1XJpzBamMi63esBnV/dOgCOpt896PU71TtQZYqGHJmncKHrTF98Cxu4D9ahVz0Mm8cmrQt2Lx9B8QYR87W2FI8bcF4r28lWXjC7GBhpqHCMHVhPso/8TkHLVSTC4ZgLY2XNuBpwz7XpxGEg4yoHUPN3hy85YFHMt1MCH5MPaNn3EC4QA7aGOqWmoOAx0APMNH4QZr+XVhjIxQhNQXQYpDKJ6iJVMug3mX3tU/fHXomRClvkFOnOGgKjCnKdZmWfMI3kidaKxncx2R0wJ1TvKuWYsDyOWqVoXOb1tyL/aTbPhDiY4N1ZNdx+zLb88n50MlfYfzty5GpjR5NYPVjYlK3hKXwWp1MEFGOcNzqy0sD2rdhdU/Zg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dbdfe0-e3b4-4e37-ed3e-08dcea31b438
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 20:17:17.9941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JUMjRCWAogZlM9QbC8RSJbp1JQfIpDhVmzXROyVoypcibibx12osG6m3g/sAj/Ryz37CCj43jBtPvCM5v2leQ9n7EUasiJaSMNFg0KnCBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6683
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_17,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410110141
X-Proofpoint-GUID: OGC12ev2iqHgBY44tpGiN_5-zl5MVSD5
X-Proofpoint-ORIG-GUID: OGC12ev2iqHgBY44tpGiN_5-zl5MVSD5

On Fri, Oct 11, 2024 at 05:23:48PM +0100, Alan Maguire wrote:
> On 11/10/2024 16:00, Kris Van Hees wrote:
> > On Fri, Oct 11, 2024 at 11:28:08AM +0100, Alan Maguire wrote:
> >> gcc adds suffixes when it carries out optimizations, but often
> >> these leave parameters to functions intact.  Many of these functions
> >> (like finish_task_switch()) are important for tracing (and they
> >> are present in available_filter_functions so are traceable) so it is
> >> valuable to support probing them.  For kprobes, all that is needed
> >> is to ensure that the event name does not contain a ".".
> > 
> > The challenge here is that not everything that is present in
> > available_filter_functions is actually traceable.  I.e. anything with a
> > compiler-optimization-generated name (*.*) cannot be traced with fprobes.
> > Also, at least with older kernels, my testing has shown that not all that
> > is listed in that file can even be traced with kprobes (probably due to a
> > kernel bug that has since been fixed).
> 
> Yeah the results of wildcarding on all fbt functions are pretty varied
> unfortunately. I wonder if there's a way we could come up with a test
> and feed back the results upstream; maybe a few more functions just need
> to be annotated notrace. Unfortunately it's such a fast-moving target..
> 
> The logic in this patch is coupled with that in the next in a way; so we
> present fprobes for everything in available_filter_functions, and if any
> probes are _used_ that do not have a BTF representation, we can then
> fall back to kprobes. Previously I just added "."-suffixed functions as
> kprobes initially, but that then raises the issue of intermixing of
> kprobe- and fprobe-backed fbt at a clause.

Yes, but my point is that this is the function that creates the probes that
are listed when you do dtrace -lP fbt, so by not filtering out the names
with "." in them, you end up creating probe entries for things that we will
not be able to probe at all.  We already know we cannot provide fprobe-based
probes for everything in available_filter_functions, so pretending to the user
that we can would be a bad user experience.

> > This leaves us with an interesting challenge.  Since we prefer fprobes
> > because they are faster (and give us argument type info), using the content
> > of that file indiscriminately is not a good idea because it will cause us
> > to list probes that cannot be used.  On the other hand, if probes with "."
> > in their names *can* be probed using kprobe, then it would certainly be
> > beneficial to make use of that.
> > 
> > Now, since the .-names are compiler generated we do not necessarily need to
> > list those as probes.  We could just list the base function *if* we can
> > determine (for FBT) which suffixes refer to variants that actually constitute
> > a valid alternative (where function entry and return are valid representations
> > of the original function).
> >
> 
> Right, we could eliminate for example .cold. suffixes and .part.
> suffixes as these do not represent function boundaries; we'd want to
> keep .isra and .constprop as these do correspond to function boundaries.
> As you say, after doing that, it might be better to represent the probe
> to the user without the suffix, as this would mean they could trace the
> function in a stable manner regardless of what the compiler did for a
> specific kernel.
> 
> >> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >> ---
> >>  libdtrace/dt_prov_fbt.c | 31 +++++++++++++++++++++----------
> >>  1 file changed, 21 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> >> index 21f63ddf..0ba0fb71 100644
> >> --- a/libdtrace/dt_prov_fbt.c
> >> +++ b/libdtrace/dt_prov_fbt.c
> >> @@ -106,10 +106,6 @@ static int populate(dtrace_hdl_t *dtp)
> >>  				p++;
> >>  		}
> >>  
> >> -		/* Weed out synthetic symbol names (that are invalid). */
> >> -		if (strchr(buf, '.') != NULL)
> >> -			continue;
> >> -
> >>  #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> >>  		/* Weed out __ftrace_invalid_address___* entries. */
> >>  		if (strstarts(buf, "__ftrace_invalid_address__") ||
> >> @@ -363,7 +359,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >>  {
> >>  	if (!dt_tp_probe_has_info(prp)) {
> >> -		char	*fn;
> >> +		char	*fn, *event, *s;
> >>  		FILE	*f;
> >>  		size_t	len;
> >>  		int	fd, rc = -1;
> >> @@ -376,22 +372,37 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >>  		if (fd == -1)
> >>  			return -ENOENT;
> >>  
> >> +		if (asprintf(&event, "%s", prp->desc->fun) < 0)
> >> +			return -ENOMEM;
> >> +		/* replace possible "." in event name as "." is not supported
> >> +		 * in trace event names, and function could be named foo.isra.0
> >> +		 */
> >> +		for (s = strchr(event, '.'); s != NULL && *s != '\0'; s++) {
> >> +			if (*s == '.')
> >> +				*s = '_';
> >> +		}
> >> +
> >>  		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> >>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> >> -			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
> >> +			     FBT_GROUP_DATA, event, prp->desc->fun);
> >>  		close(fd);
> >> -		if (rc == -1)
> >> +		if (rc == -1) {
> >> +			free(event);
> >>  			return -ENOENT;
> >> +		}
> >>  
> >>  		/* create format file name */
> >>  		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> >> -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> >> +			       EVENTSFS, FBT_GROUP_DATA, event) + 1;
> >>  		fn = dt_alloc(dtp, len);
> >> -		if (fn == NULL)
> >> +		if (fn == NULL) {
> >> +			free(event);
> >>  			return -ENOENT;
> >> +		}
> >>  
> >>  		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> >> -			 FBT_GROUP_DATA, prp->desc->fun);
> >> +			 FBT_GROUP_DATA, event);
> >> +		free(event);
> >>  
> >>  		/* open format file */
> >>  		f = fopen(fn, "r");
> >> -- 
> >> 2.43.5
> >>
