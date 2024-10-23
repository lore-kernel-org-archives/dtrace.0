Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD713B7BE
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722154; cv=fail; b=Ck2J9HcrLfWZ+Ns1TqF74iMs7ey+KYQ+a7p5jKgkiiVLxGwnHzgkCVjERdvxNBk+WpFxt3kMCKEYvPhxgO20ATlR+1dsC1caCsxhp2INlzkatQH/KAwHxzJZZzfyjoBCZPEWoh75jsWj1r9Uzx6Y5/yQXBhGIzPDQKdEilx9TU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722154; c=relaxed/simple;
	bh=3WcLVay6fxOH78lTSymxUWuD2KBb7Zs1IC4KDfaROB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T5VqvS0OMk1n8m4rndtbhssIpI9mtTr13Zs3hzXlXZxRi6XnqmSIorpG2ih2eRMh0OiyRTxIsukRsaUMY4T2gFxQcO3geoABUD2qFmhSGpjYUziRv1HIBrpg1Bvtp8slCWOwoODECnMUHT6Q4v50XN5iGFvhrkU15fQ0x8d0D08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YZIXLzoT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pp3OQ8KJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YZIXLzoT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pp3OQ8KJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKcb6q026726
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9e+zJo1zwtF2d/L3Ge
	7KWOUgpAv3yts5wHGOxUpTRZc=; b=YZIXLzoTtX6fTlpVLfdPvASQh9JRSpGGzT
	Yc0PM7n2yj7MpykBYphs2KrAfKacS7n4blxbocXDJhfSOS4thBKaZZKJBkKP3YoU
	z6pVSE9XmAKHqNCVSKaX8o0aSd8jMSjruq+btPMR8G4TBuz8eHNsswsTsjSE2YTO
	Hcd2AY5/PGKQTitQtQZKNmdagaRElg0SWaIHJOrVR2HDGkorKasD7YQAhuwERWwW
	Z5nTmtnqtZ+h+F9glyMsfdjXn4Td+IZAxCC3waxyO8P7DNb1fei84KPeu4ro+a+j
	99ZcnGJFvuAKckaGpJbOongN8Frl4hdDixVm2TiEhzb9iUmSk1Og==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v19f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:22:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49NLmilC018359
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:22:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhk5c74-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QO7mVxl+74KwQUKjXDHAyMoapOfSM/IHOQHeQrvS0ifRrwrvCfPiVpqaQxw2Elo0xJhqpD+iTJfQndcTiGGsBRGJYF3+WrXptLXN8Rv8tPoplsqvylk1gTvK+xB5DiDlkMRrSmIuq36aFKcPzmZ1uVeXVG0lFZhjw2sYF7d+8XmPJo7VHvzdyl2bv1aYZW0V9j/zf1qScPMfjGWpfikzGXWYyRUrshG/Sv1iCHa1d1rYIUsa0KyXU1So31Ez6p6RnOknvEadCiik3F4rD10egVub5gFUPZ0TodUH9FRdvuI1MkLN61Mc0KEzAxcKU1PI1Py+N6M18JQuYMUASwOJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e+zJo1zwtF2d/L3Ge7KWOUgpAv3yts5wHGOxUpTRZc=;
 b=rZB3kIcccw3iQZRId9SALVHX/hGO6XzICFs3kSO4HiGN6CG7wWPQqwvBhUo9FcbMTJvNKimmYiFW7orgYLrPb6q+vqeK8/m30dlgcMpHB8mN6ugHy1QYorA1A/1dkbhfplPKvnsO2v3Q0/6S8S97Fcssu6VAvPPS1ZLDfBBj8F6JfSRlvfWc1Gs4uAokRKxJ6lfRo4VoeNkob6e4f03RPogecPuzRZs/Tak2reFdBeaOGTGEpwN21snmf8l4zdkjMQ94XTuVUdF/FbnrubqkgUwJL/AIGf+7J2Hvy4Rer6xzT1sJUXXGKRqavmS45WvWHYFfJzP6jR98XMhcVlurBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e+zJo1zwtF2d/L3Ge7KWOUgpAv3yts5wHGOxUpTRZc=;
 b=Pp3OQ8KJuPRS9TVrjxXlf2A1XB/OcQNOpTjsUG1JLVlNLQrTB5ns8ZNN7XBkp8CYm0JjnUmn6gO/rCAuwHYbndEzpYdUDRvY6mfIiLyOhKrXyBBcf3tRSdoBtPOv73I5Hp3mo/+knwfGAypvgxcXlhaL+sXtpMkSbYqtpPuhXd4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB4760.namprd10.prod.outlook.com (2603:10b6:510:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 22:22:25 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:22:25 +0000
Date: Wed, 23 Oct 2024 18:22:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 02/19] Add a dt_provider_discover() function
Message-ID: <Zxl3H8sMUZJwBNsi@kvh-deb-bpf.us.oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016160139.29589-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: aa867afb-6fbb-4b1d-d6ce-08dcf3b12c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qjGu7DPu9NlsF4Pk/vZp+OzagTqhW0DZjwBNqspZeMdmLNw8RxvRBuhtxdSi?=
 =?us-ascii?Q?mxPYgI9hvxlEpv5plhqYWunxbEjuEM3n2Trsk2ooTD+GH1nsmT0+Pbex0Yxf?=
 =?us-ascii?Q?7Vj2qUnJUdHzCM5wpwslna1pMWwcX4jln189c5dNcyRiTItV0hqLaX1VSzag?=
 =?us-ascii?Q?8sE7hP7lufXzStoHjuWAeVgkiU5GV48Jey0oBDc5cGezz9gvEu+b4mASNsFx?=
 =?us-ascii?Q?mj0lHwDqtw+/BkjGs4xKWDCJS5q8osJZXUkwgXJoKVs5c2cbbJvK3x3YxPTK?=
 =?us-ascii?Q?30YBNqZnYJFqriqDXxRM33dCUak4lcI1DMXsWJPHRfvfWs660LTZT247Wz8n?=
 =?us-ascii?Q?DywmBljs3bbKL3K/HR0/8TA5ERIzLZz5pVC6NEo5bxXKr7CRTVW4qQK9nqWp?=
 =?us-ascii?Q?B7rPKxKV5bf3VEfjGMbwjLrwcmaBabPRaRFNZIOMCFnEkzuTD4xqM/ZiPXUA?=
 =?us-ascii?Q?G9dkzuTQz11oseLu9IJ1vWjRcm4oXxv0AJYbf6D57gIH0VlJi8zcMLN7/80l?=
 =?us-ascii?Q?NZY+Y1lU/Zdli9yAIPgHX7VF/uBER5SZrWKTkgHK70D3FlSVqJGkxtoVYD0k?=
 =?us-ascii?Q?iDAcVcQtXl2/WavC7h5epPFFG/Uk5u4KG8LBpsIBeDeV8n4267QE3bV+bS3P?=
 =?us-ascii?Q?Ic5Iv1Z3gbPAcw7NF/UPLFa8tCYcmcTKfDNOtTrMb4fDK2HlOpletT1WaXt6?=
 =?us-ascii?Q?HD2VTREyQY1xAmMHRv0JUYr6Rx1mOAP2AD+evh0w5USm3w1UXXbMqsA4hOov?=
 =?us-ascii?Q?FVSMOzy1t1y+e8+BYQ/EBc/pe4AORfpYy4/mj/UMor35h+fQMwaObj498E9z?=
 =?us-ascii?Q?/W+rFwXk5TX35QQ5v1/0MNunRajxI6JBUKr7Oote2Ju45DwggnP0/o4AG30P?=
 =?us-ascii?Q?97JPr9WYdhOHrPHcp+qMEhqw60Giddcvt6Q6zJi0OEcY9xQrwrMBZ7anEe7O?=
 =?us-ascii?Q?1j0ZM/K5mPAp1cOlm3nzNafYtriFVzx0z6Vk4OGY/rptnxjG8M5EJQZGLM5d?=
 =?us-ascii?Q?HDTrR3/5gGIIafPVYiVwk7NCGmX3KrAwejNBLjoz2ZL5s9SD9x4UK8RMIzGQ?=
 =?us-ascii?Q?I6xX9KpD9Q2u+DJUG+JOeeXC84Wrc2CGfYvry/ZwKsKMT7FJgX/dfrSFsZac?=
 =?us-ascii?Q?hA4ScisM/oRU83Cj2P94kyXRfQFurqHsJRjR8w25CLVR3xIHVD4+C6sdI7k4?=
 =?us-ascii?Q?TDcZyUCY0nEyJuxBQ468Je29UQQCSeqCvASYwYKGZiskLCtHeMZykVS9lVIk?=
 =?us-ascii?Q?4v7UiGJCs/H7kb75R4gAzjYyXQMy3UoKehLB5EusxJEZyRhSOlxeiXOlvevj?=
 =?us-ascii?Q?2njtKxU+xOo6Ty0XKLhVQUFb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7oCyjXh974mos+NmsVrnJe/NcCaFIXYZiMlroe+CP80UpgAcZXALnt+09is3?=
 =?us-ascii?Q?NCIzEqeA5otNOjRdg7B77w83rxOwlwn+MsEKmXjWCVBO5xsH3pK6BI2AXnMi?=
 =?us-ascii?Q?xubEXMXhgpnpZbuQ59bnf6UBRBMtnNADpvyhkBcu2weMchpRhrcKnG4ghj9Q?=
 =?us-ascii?Q?p/Yz8uEWxbQvHesPKVqnIkNe4sKTaicPy+P81yXY3LrWmgihGw3Hj0pPu9dN?=
 =?us-ascii?Q?UH4ja8D6D/jeR5karGr1Hk3TfUMABMfD9djEaOR8PKudmyiCsamI5rHz4CnG?=
 =?us-ascii?Q?AR4yfNjKx+mPJkVMlQl8/GvPlm6tagbQ7Wv/QQvuJIG2/SA5Gm+PYgmd5S5v?=
 =?us-ascii?Q?3UhDwb/OOSLXdHWCu/Q5lDibMgsthEEsy3wCPfOBpfNjzZrz+VrnVL9ohBdT?=
 =?us-ascii?Q?O3VqNqRaYbDKUZzcn/AMxHwjbbJzJlYaN85gtC9ko1vgB3cn7/WYl9et/py9?=
 =?us-ascii?Q?CwcWqlrXJklhT5PF2gw1olstQG68BKTAtiazrmdKh3FC4voRMRpD0VQKx/EF?=
 =?us-ascii?Q?/C2OiaSgl5p6GGvvF1QdogSR8IZDq88S2zoU6x3lDhGwp8YpyfnfNEJBTRzR?=
 =?us-ascii?Q?VkNm+L88ub3YvAoBObFJwrnVvBmQ7q0oSi07r4gLlmdv2AhT91Pf09jw66h2?=
 =?us-ascii?Q?NecMCjIhznZYIZ0XeI2o57xkjkr18XjoRcN0EyTp+oHhEN/hNvf5PuMOgR17?=
 =?us-ascii?Q?NnYbP+POg4LHHzdahvYMcRIr9DLYdviFM7uaSoCKIyBURC/R4jfFr+QX2644?=
 =?us-ascii?Q?z+l/ICXoLvIzyJ05wXYfkoM3j6UtDVsgdyxl1c/Y0BFwD9Bn3efPYp5yaybO?=
 =?us-ascii?Q?GqaXfZDtlEOexT555sAvVqoDaZQvZDOAgHKoEplPEWjHB8ikG9/7F2SjpQs4?=
 =?us-ascii?Q?5Iofo+Easb+AMUubbFvi9Jlox+n/0j4zAIoloBOWZ/Mp5WF9IgtUKjNGZvYT?=
 =?us-ascii?Q?AhtMmcKR+dsXNfcUv4/53YQ4xGBzdCW7zfSJtwzISXCvMDgiwkVSWPDsHf8C?=
 =?us-ascii?Q?upNjwROXHlBu8JdCtJHb3CZcakbYwY1UqBcaNLzDfvuiORlYLqrQNDoiqvQb?=
 =?us-ascii?Q?RcfgEfbx6z3X6RcKZwdslp+UFISckfpygSm7Q2J7qjglBrl9hHhBdSfsolX+?=
 =?us-ascii?Q?p5I0DGAW2xPfs0dKfxBa+Qx957jVCJMtvUh+J6LCT6Jjf5cGHWv2kUdqv7Vm?=
 =?us-ascii?Q?1M2l4oAf2U/17HJzCRlG6Lf9+NrUsS2JcmuOriwhawNkwxIjTif+XjQvL0XI?=
 =?us-ascii?Q?gcPQbOaq/qzzMBr3z3MlcbmG82JocjnSAqvvPzKqqshm6fTCTIZxkMAgs/Tl?=
 =?us-ascii?Q?RpvRHKBLHmrPTIgkX+9hklYsP3iDgxMkdYUkoLCAkGyhujwRQJx4IpKENNC/?=
 =?us-ascii?Q?3JUTZACsQIz86UNaff/X/rDrlZJsn4YZkYH9IqBlqBgVm0iJB1uLkTQ8BJjB?=
 =?us-ascii?Q?kcKeaTcePKnuemFgOMatXM9R2LvHU0WG5TCrHZIgzWt7wckyc+bOzuuf9GfQ?=
 =?us-ascii?Q?wASDEnlb/5g50XnvrK/9kPFN1yEUsn8jlaev+4FPwIjJTdEkwWI8c20CnbhA?=
 =?us-ascii?Q?e0aiecG1HAOPdltVCxOW76pbWV/vDx4twP9OlzMAtbWukM0cnVlFCtfDPykt?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DoaESrNvh8KIdQ97sEKgNvee/pCKuXb0d1hkB3psxnmcGWJSo4xeq8NRF4IdvNUHlzwR7B9e/7yf+MLQPjdn6odeHWANgAuUP4C1il7mRFHsOkuh59DaiWxpdBhQyWdB/xtiQtV3adFUXQRtbxDoH5YxD4Xkcb9y9pnkqv+X4qcr9RhJ/pwiANo7d3se36TR1y1NdorJICBp4eiFgY/wkwrGV5GvzUV1bEd/uA14TMlKekqmUyxKVo6PQ6xwHBr83UiCPcumk9rGWygST/y2x/aFKtUQhFiPAL/rhMxzjKOvAmx28r9NdvonoJAypuBD7AdzsLmqtyBgVx+zFZ/7c938k7gAyM82DP93chJnVahkaQgBmOD+UWgrMlf2cWRPWAPCbxjfsLA7T/V9n4YWFbiWhEiD/kF319slqactYzeePFy3lU0QbzRHQJP56c19xb7X/rfzDkWAE1X+v55n0hNgwp0JeeQnc3Y4KD7ia8VH+kWkjYtXJL4JMk5XTiMYLtzSBwFkliIGqwvudiXGu7Q1JkCdUdpyuu6q30o7XFfDD09R6ldLAuMfUWRWz0FpdThrfUZafD9yyAaLKw6R/5z62975O2iDJxs6Fm+NPp0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa867afb-6fbb-4b1d-d6ce-08dcf3b12c14
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:22:25.5188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yklnxo0fcXFbGmjo1iYScCmkLTOvujquPm0EBsj0nJtBOCENTQ9PjbngOzZLHOJSnz23aY5lTyX9JqdEr7CBTCWE8sWrWPdWZlNHBtMx93Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4760
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_17,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410230145
X-Proofpoint-GUID: bUbNNIMrQWQLVwwI8pRIEBpA-wZ7BLWj
X-Proofpoint-ORIG-GUID: bUbNNIMrQWQLVwwI8pRIEBpA-wZ7BLWj

On Wed, Oct 16, 2024 at 12:01:36PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> It is possible for new providers and probes to appear after dtrace_go().
> Add a function that can be called for such discovery, on a per-provider
> basis.  Each provider that supports such discovery needs to provide:
> 
> *)  a function discover() that performs discovery on behalf of the provider
> 
> *)  a function add_probe() that adds a particular (discovered) probe
> 
> To support looping over providers, move dt_providers[] from
> dt_open.c to dt_provider.c and extern it in dt_provider.h.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c      |  6 +++++
>  libdtrace/dt_open.c     | 22 +---------------
>  libdtrace/dt_provider.c | 57 +++++++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_provider.h |  6 +++++
>  libdtrace/dt_work.c     |  3 +++
>  5 files changed, 73 insertions(+), 21 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ad11d178e..7a36b6187 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1275,6 +1275,12 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  		int		fd;
>  		int		rc = -1;
>  
> +		if (prp->prov->impl->prog_type == BPF_PROG_TYPE_UNSPEC) {
> +			if (prp->prov->impl->add_probe)
> +				prp->prov->impl->add_probe(dtp, prp);
> +			continue;

This could benefit from a comment perhaps?  It took me a bit to figure out
why we would want this here, since this is the case where the probes are
already known to exist (they were discovered during program compilation).
So, needing a call to add_probe seems out-of-place here.

I do understand (after digging through the code a bit) that it is needed for
USDT because you add probe name data to the usdt_names BPF map and probe data
to the usdt_prids BPF map from the add_probe() callback.  But thatis far from
obvious...  But try to keep the comment non-USDT specific if you can.  Perhaps
just mention this is needed to handle probe types that are discoverable at a
later time, because they may need additional processing.

I think that testing for prog_type == UNSPEC is not appropriate here.  That
seems to be a case of leaking USDT-specific implementation detail into this
generic function.  One way to deal with this might be to add a test in
add_probe_uprobe() on dtp->dt_active.  If dt_active == 0, then
add_probe_uprobe() should immediately return (because the probe already exists
in the system).  If dt_active == 1, then it is a runtime discovered probe.

> +		}
> +
>  		dp = prp->difo;
>  		if (dp == NULL)
>  			continue;
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 848141ddc..1f586fc4f 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -61,26 +61,6 @@ const dt_version_t _dtrace_versions[] = {
>  	0
>  };
>  
> -/*
> - * List of provider modules that register providers and probes.  A single
> - * provider module may create multiple providers.
> - */
> -static const dt_provimpl_t *dt_providers[] = {
> -	&dt_dtrace,		/* list dt_dtrace first */
> -	&dt_cpc,
> -	&dt_fbt_fprobe,
> -	&dt_io,
> -	&dt_ip,
> -	&dt_lockstat,
> -	&dt_proc,
> -	&dt_profile,
> -	&dt_rawtp,
> -	&dt_sched,
> -	&dt_sdt,
> -	&dt_syscall,
> -	&dt_uprobe,
> -};
> -
>  /*
>   * Table of global identifiers.  This is used to populate the global identifier
>   * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
> @@ -1210,7 +1190,7 @@ dtrace_init(dtrace_hdl_t *dtp)
>  	 * known providers.
>  	 */
>  	dt_probe_init(dtp);
> -	for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
> +	for (i = 0; dt_providers[i]; i++) {
>  		int	n;
>  
>  		n = dt_providers[i]->populate(dtp);
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 8cfef0ba2..5f9766183 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -18,10 +18,32 @@
>  #include <port.h>
>  
>  #include <dt_provider.h>
> +#include <dt_probe.h>
>  #include <dt_module.h>
>  #include <dt_string.h>
>  #include <dt_list.h>
>  
> +/*
> + * List of provider modules that register providers and probes.  A single
> + * provider module may create multiple providers.
> + */
> +const dt_provimpl_t *dt_providers[] = {
> +	&dt_dtrace,		/* list dt_dtrace first */
> +	&dt_cpc,
> +	&dt_fbt_fprobe,
> +	&dt_io,
> +	&dt_ip,
> +	&dt_lockstat,
> +	&dt_proc,
> +	&dt_profile,
> +	&dt_rawtp,
> +	&dt_sched,
> +	&dt_sdt,
> +	&dt_syscall,
> +	&dt_uprobe,
> +	NULL
> +};
> +
>  static uint32_t
>  dt_provider_hval(const dt_provider_t *pvp)
>  {
> @@ -149,3 +171,38 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
>  	BT_SET(pvp->pv_xrefs, id);
>  	return 0;
>  }
> +
> +int
> +dt_provider_discover(dtrace_hdl_t *dtp)
> +{
> +	int i, prid = dtp->dt_probe_id;
> +
> +	/* Discover new probes. */
> +	for (i = 0; dt_providers[i]; i++) {
> +		int n;
> +
> +		if (dt_providers[i]->discover == NULL)
> +			continue;
> +
> +		n = dt_providers[i]->discover(dtp);
> +		if (n < 0)
> +			return -1;        /* errno is already set */
> +	}
> +
> +	/* Add them. */
> +	for ( ; prid < dtp->dt_probe_id; prid++) {
> +		dt_probe_t	*prp = dtp->dt_probes[prid];
> +		int		rc;
> +
> +		dt_probe_enable(dtp, prp);
> +
> +		if (prp->prov->impl->add_probe == NULL)
> +			continue;
> +
> +		rc = prp->prov->impl->add_probe(dtp, prp);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 17b1844cb..384d4fd33 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -62,6 +62,9 @@ typedef struct dt_provimpl {
>  	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
>  			  const struct dt_probe *prp,
>  			  int *argcp, dt_argdesc_t **argvp);
> +	int (*discover)(dtrace_hdl_t *dtp);	/* discover new probes */
> +	int (*add_probe)(dtrace_hdl_t *dtp,	/* add a new probe */
> +			 struct dt_probe *prp);
>  	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
>  		       const struct dt_probe *prb);
>  	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
> @@ -86,6 +89,8 @@ extern dt_provimpl_t dt_sdt;
>  extern dt_provimpl_t dt_syscall;
>  extern dt_provimpl_t dt_uprobe;
>  
> +extern const dt_provimpl_t *dt_providers[];
> +
>  typedef struct dt_provider {
>  	dt_list_t pv_list;		/* list forward/back pointers */
>  	struct dt_hentry he;		/* htab links */
> @@ -110,6 +115,7 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
>  					 const dt_provimpl_t *,
>  					 const dtrace_pattr_t *, void *);
>  extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
> +extern int dt_provider_discover(dtrace_hdl_t *dtp);
>  
>  #ifdef	__cplusplus
>  }
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 11335345a..5318cdb7e 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>  	dtrace_workstatus_t	rval;
>  	int			gen;
>  
> +	if (dt_provider_discover(dtp) < 0)
> +		return DTRACE_WORKSTATUS_ERROR;
> +
>  	switch (dtrace_status(dtp)) {
>  	case DTRACE_STATUS_EXITED:
>  	case DTRACE_STATUS_STOPPED:
> -- 
> 2.43.5
> 
