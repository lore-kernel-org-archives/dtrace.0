Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8622B8B6
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756525142; cv=fail; b=qeDcTsozQR/iPcuHWWDOn/CPIRCzKQgLy6ivY2SVorui9oXWHqZ+31cJZEShBpHqWiNPQSbqm8j1jzJaaIkAGmxuELt0F47BkO3EYd1M/ViafwJTEkNhF3CO19RiEdACRHNgR99+L2/SxTo/JmklXqLr77n9JYL24NH+mhGzLaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756525142; c=relaxed/simple;
	bh=LEdgbL2AXgoegeDg4i8px5/IkkjLWqxbD4z/ix4tsUM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=otuNY0OwEL0HJOr3aqTuLBq9WI6kfs+vIW32QE+scBi53vBAXhViN/dWGHwnGTu2CxCESQh+q/G5uR1dbUZLhyn7gKTkoiX/nvsWundr3wRRy4mKPLxsdK5P8dl2YYbaztyaS1Fx3L1S+HYBF93ZxmWJOKQoEMmNMYFXFNGW+m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WzMn2Y6/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Av2LyEwr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WzMn2Y6/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Av2LyEwr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3ZpFt019134
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9EYs5xBrumVro8r68fdwIgvV7DOIEJdkrU1AYF49Au4=; b=
	WzMn2Y6/2+IIcAiWkcBQofws6TkufjrvMYF49DOWPryQVpLSUWQW/tE6F/ke6TKX
	qakpOwhKkG7K1QYiSRUlpxAN5MeWPG72Y9VVkPA3uVvuB0jMaTY5Uf9XnDB3PzC6
	XhnWZkN3IavrHLvBUHCsqDXRvsUD5vcFN9hP9nqf1l3upBHHZf4jMo0T9x8S5rie
	sj4OtBGJNaicM8rxVTevhNx//6WRPanNn1x9wTudT3kGrDh0NXuTD/OWurvCSF7S
	UzktCqRvDyKKr+4Hum9Gu3Jyn+RWYx6mhZFSRZfbGAhZ1+8VueETKKTpFPUw/Jm5
	AysXUHM47bICvYYemCZF9A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ushgr01h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:38:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57U1XR78037797
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:38:58 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr69y2f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evokE+UDhJXDP9j2OxN7UrIX1VXcOcBBDac2wEGypehbZL1PjTJWL/DdtL+UscVSg3oU6Nkz2JsiDiZWTOYgbZ6CSF47RLomisSI4WCwO/XfRZpZ3gx8oDsam2+d7qc+l/f7rd5ZweyAZhOfMKxHnenQhSP0XCW8Pz21bfLJxfDW3k2UZcTHg+08vzhabeJrk7sOEGLCiBz6xCKC7biJEj9yJ3qLO6j+Ry/f9/f2jXeVMMqLqype9ZWLXquRuNlIDOeJID9c+YpjeyHX1iMi1FtR75NnhwSseyiZLZPM1Q0B0QO+aOqXKPGGgrFH7mMdWr73ReEt9Ljr5UYIISv8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EYs5xBrumVro8r68fdwIgvV7DOIEJdkrU1AYF49Au4=;
 b=BpnD8LuFs4UT1JTTLYXUNhrbSP81z0CFSAn0YjoNbhTFaJvYn68PCnwXHRpt1GAecmy/SwYsaKwtYrgI43bxHjIU6WT7tLGnrChpbFayVagrxafFEXo8IIj/msQ+PTZ+ALoWLQ6f3P6idmXatXBeXvL29e4ohdFKB/ekTxCUr1dWPf6mUAAZUc18DTGVhoEHvfRoBoHtDEHAUpwul6Agzf5jYsr6TRS5Evxnf2ByZztLaGNov5OdmpMWNAaq15eIBIaHkxD/NRNPkjD2uFEmglH0Y3CI3CzoSV9B3C5pkddbD7OGpWj/cN/kOU3GsBqzMWZlnS1ZjXPJ6Bfwi/E2+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EYs5xBrumVro8r68fdwIgvV7DOIEJdkrU1AYF49Au4=;
 b=Av2LyEwrLJTgdIPEesDFB0qhjeQP+wrZVhb9biIOPbVCokqtYB5GLLOlHqiVqRVY6KFPL/1/KRVtjbogeQltUQfUoC3XeG6WBkJzHZ0q/tilGih8QiPmB9d6yEsb1/Kmb9BjbkxxEIW9v5l/5MNMsQe5ii8NswdQnKvr+nL0Ans=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA3PR10MB6950.namprd10.prod.outlook.com (2603:10b6:806:31d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sat, 30 Aug
 2025 03:38:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 03:38:52 +0000
Message-ID: <f52658fe-2e06-58ca-341e-a53cd72ca32a@oracle.com>
Date: Fri, 29 Aug 2025 23:38:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] printf: fake type node is only needed for aggregation
 printing
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672F55FFAD98804D8BEBF08C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672F55FFAD98804D8BEBF08C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA3PR10MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 991e86bf-447e-4ec2-f99a-08dde776bd02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1ZWN3FrbGZmbkFlTVQ1emdTQ2dZaGFRUFM3ZzY4TEoxazdKaEhOSU52UE83?=
 =?utf-8?B?eWhjeVRaczNhak1EdXZTa2RvNE1mdVJPMmpNR0RrUVQzTXBSS085MUZMRzdT?=
 =?utf-8?B?MlhBVDBUQzRUVlF4dWtvam1EY2dURkgzSS9UZjdPTWU2L24rckZYY0U5aXVM?=
 =?utf-8?B?NzY4ZjRjY281U2doaWhBMm5vcXQyMHQrU3lOTCtBUlUyZW1aTmc3eVJFandK?=
 =?utf-8?B?OHFVNUpkVUVtejNVbmo4Si9wR0l3MGVVK2F5U0xZVFUyOEkyODdDeEtKVEhI?=
 =?utf-8?B?Z005Y2VPOHR3RUdMZjZ2MVh6VnZUS2dvTC8rZE1BS0VPYjRWWFoyQkNSM2d2?=
 =?utf-8?B?a0J3TkMxRStvTWtheGNZZUJEV3VqZEpjK0Y1UVRJNDJlM1dSTGJXd3poQTJJ?=
 =?utf-8?B?MEtiU0ZTUDFDRlJCWFJPRHR1a1MySnJMcUczdXp2azh4dW01cFI2SkxjK2NQ?=
 =?utf-8?B?cW0vUXZWNElVRzd4eXFZSVhWeS9veWNwUFZnTWp1QWt5OXU5ZG81VFI1N0pH?=
 =?utf-8?B?L3ZhaWNIUlRmNmFrd1Zoa0NXWEk4WGVnMVNJMXV2SzNubElkVmlHcXhQOXc0?=
 =?utf-8?B?THpVdTU4WGtaSm9XZlBZWlhibmM1YTdoYmRRNWtoSGJJRGlvTGh4eE5qallv?=
 =?utf-8?B?Sk13YXp3SUFkVTBuUTlHajVJWFhGR1V2UTFXdXBwMEpDcDN4cGRGZzgrYlJM?=
 =?utf-8?B?YzZGbGJzc0lndTU3SXBpZENVVDdCVy9tM1BtRnJ2MldrL2pGKzY1ZExPaFBJ?=
 =?utf-8?B?YmxHNmFmSlNDanhHcjJySTY1K0N1bElMWEpCS20vT3JhNXVkSHZEaXMyd1Bw?=
 =?utf-8?B?Y2IvRXE0NUVCU1Z4M1JwZUp5Zkh2M0FwMU5zclFDSklLOEd1SXJiZ1ZTejNL?=
 =?utf-8?B?WFplQWl5Nmc0RWZaUk1HQ3ZIcFVrKzBCUnprV0dRbHBPcU9iNG9JWS9yU1Jr?=
 =?utf-8?B?aEI0S2gzY0Y0WnlIaUVpbWtOb0hwMU41MHFybVdManRCUHZtRHR4bzlGNVg4?=
 =?utf-8?B?UlFOempPdnpRMkhZQWZnVHJsY255bkFtMnJKcE1JZzRERmFBSDNqNy9QVjJ6?=
 =?utf-8?B?cHhnWTVZWU5TSGdoZ0pDSkdDaDNHRU5xL0liVFhySkpnTU5WWXZDaVczWVh5?=
 =?utf-8?B?d1FiejBBcVhFUFJnMUxwTXl1aVU1Z0h1RDRGelhyTFJZQW9QVWE5MFB3T0Yr?=
 =?utf-8?B?MjJpanUyeGFDMTJocVpDWjRjdVhvdzlvWnRDeURxM1VJeWc2S3Y1TWFIQmlT?=
 =?utf-8?B?MzkwWUVsVUE2bE9keTRpUFNrRXZjZDdaV2lob0c3SmtaWGRqWjJsQTIvQUZB?=
 =?utf-8?B?RDU4VEFMd1c1enVLU1VDQW5PM2FDc1RaYmdrQ2xGY05jK211emV2eDJCMWFk?=
 =?utf-8?B?VEVuMmhZYzBQdXArVklSNzVzNkp4dEwvK3Z1dlBuSkVqQlk3UW9iYnZaVTMw?=
 =?utf-8?B?dkNzdjM5WGVYWDRUS0wyNDYveFFhMENkeEw4aEgzUlRLT3Vac0taZDc3SzJB?=
 =?utf-8?B?R1IyVFpOa1ZjT1ZhWGRaYzhTTy8vMUU5VDY1VWRCcEQzZlBMRHVzZnlJdld0?=
 =?utf-8?B?N0lxVEp1cGx6Z2J5TTB0OUFOWnZKYWhXNVJqTkUvWVFvTlZFYUhuOVl0dUM5?=
 =?utf-8?B?VWRzdDIzT3JtaFJxdWpQVDJXa0VlQTVndXozSEw3WFNPZ2FCYVJ5WFV3Y25N?=
 =?utf-8?B?K1Zsd0owTGJONFN1ekJNdmZPeWE2MTJvd2NLLytrRVQ3T211QVZrc3QxS1V5?=
 =?utf-8?B?eHQ4Q3M4UWIyUkd1WlhQZDg0cWxaYUxaem0wWmJCWG5KZ1p6eklEeHlTdkFo?=
 =?utf-8?B?a2dzWW5SYnF6S3ZudFh6NndyUmpIdy8rTGl2RFc4RkxkeGxtZ210a242WHgx?=
 =?utf-8?B?eXRVOEdUV2hKQ2d3aFAyemZ1bkovT2gyV1FtTzBvL3g5bHFLdjBoZUJHM3lz?=
 =?utf-8?Q?2J3i5PB+lyk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VWb0RJZlJteDNVa1QyeEF2VExybHJDVjI0WTIwZzhlTzFPYWMzY3NJRHcy?=
 =?utf-8?B?cHIxcGJTZDNLMy9Jck1WbnRJZTV5WXBpOWhGeXlhd25EWlhkelIrTENjZU5N?=
 =?utf-8?B?THNRNXg4TVNubnMvUUlBdlBMY1hIOVlWYU5nYnl3dkl1RWZRNkdZN1Z6SHNx?=
 =?utf-8?B?UjA4eDRDbFVXV290eXdEcnRkSFBQMk91WUtZdlFKUStUQmJXTnF4d2dKY1Zj?=
 =?utf-8?B?REJWWmU0MHk3RGRFZ2JXSUFYcGlZNDZaSEIvb3pLanJ6eGJPdHZBTnhHcXdt?=
 =?utf-8?B?NHpUSTJCWFhWUXJZcjhMcGN6MCtUOGxDaXFJTGlLZGUwc0tETy9XZ2VPM1Vr?=
 =?utf-8?B?UVZQVXNveTB2VnFPeHVNK3NRbkNMYWk3Y3BoVkc3SUMrLzRGZDJXZ2NNOHR5?=
 =?utf-8?B?YWlNWi9jaGVqMVNMd3pKSUNQRllSUVpWbWZQWE1lRUlnd3ltYy9PNVM3ekpv?=
 =?utf-8?B?NCtUZ2UxYU9lTHlOMnpEZjRCVGhsdy84UUJBdHYxQmwzUysrcnE1NG54bW1m?=
 =?utf-8?B?eW1mazB0WXZCVzRudkhWSGFRNlRUd3p3TmN2YnJKdzhiVGZxTXI0ekNMbFFl?=
 =?utf-8?B?L2FaK1R1clBHaUZwUTlWV20wRnc4VEIxbWloRjhkMzRzMGZxb1hXWk9NOHpC?=
 =?utf-8?B?WEo2YU5JYXIweFhNRk9GZklmYVJZTEorcE11SjJ0NjRnc2UxQkFjSi9EVUI4?=
 =?utf-8?B?K0F0b1BOSkpNM0J2ZjdhY2J3cFBaSVVrUERhUlFyQVlkTW56ZVU2VG1DMXVi?=
 =?utf-8?B?QmR0UlVrdDQySHJOWTlyRnB6d2hUVGgvaUJTRURzMVNiOGJBVVVCZTluMTdN?=
 =?utf-8?B?b1IxVEV0UWEwS0ZDVlhZTW9pRDVqcjd2N1I3ak9aaFRrbG5YTlNGa2lNNUQw?=
 =?utf-8?B?NkZxT3RtekFCbmtnQWloOGMyV3hHUy92YjRpbVlFRDdpZk5EcVh6UmRnVHEz?=
 =?utf-8?B?L084WCtwRm9MM3dWb1VqVFR1TmNiOU10YjU5ZjdnZElYSWlBbE1DYmNPOE1k?=
 =?utf-8?B?cnIrZnp1b084aEpsYVVNOStaNm81VEJWV1YwVEo4dFVhalhJYUVNWVZQWEk0?=
 =?utf-8?B?Z2JQSnc3ckpaQUZSMHhWVFVKK1gwQ3QzeDNBR3BYQUF0S3ZMdG8ybXB6RFVW?=
 =?utf-8?B?VUVJdFJ1Z0hpYXFKU0tKZm93THdYRVRGNWpNYU9yWjVNcnpxbkZjdG0wbmVN?=
 =?utf-8?B?RFV5ZFRhTDlidW9uZHErOUloenlpanNLR251MVdZcEtmSXdTV0VlRnZkL0dm?=
 =?utf-8?B?bzVXNmxnZTgzL1N6aURpck41NFhXWVdqRDF0aGdmUmVwbHlXNU1YOXVIUUYv?=
 =?utf-8?B?VU10Qy9IWmozejhBWWVmQ3l0Zll3d3JscHlsQTZPNlA1dGlKSCtIbGt1SGNo?=
 =?utf-8?B?NUxTZVVoemdSd2N3KzJ4dFZockQ4d25EWGRoVW1ERWFtUk9LVnlBYzhqcGFm?=
 =?utf-8?B?QWtKN2RianRDOHJaQlB3UWpJWUdFR2NkOVp6SU9LRFdFSnpnTUswdkcvT2ZO?=
 =?utf-8?B?YXJGdzdwZk9IMHgrS3JNenlLT0ZsaE81dUJMa1VHcll0WUFyd1N2cUlaNVZ4?=
 =?utf-8?B?dklqZ2VOcG53QlFGeWQ4ZkkvMXBNZGJ5VkVpZ2Q2TE1JaXc2WGFoamFuT1Ex?=
 =?utf-8?B?M1pKS1hreDhKOHJKTEw1NVcybTNtWnJvMHI0S0dQSVN0WVhyVERReGdhY1Q3?=
 =?utf-8?B?ejlhVk55K2MrY2ZwZm1mSW82MlVoSWxaSnE4Q1I1b05keGY3TjI4SUVXRFJP?=
 =?utf-8?B?MDJGRHE1bnVhTlNQOEZ6bFZJMDk0b3kzd1JZQWxIMThiY1FZdktHd3pxWVJ4?=
 =?utf-8?B?TUw0Ymg0cmpmdjJlMjhmUnpvc2hFY2xJcWdwM0JMSGMySU1wRklqT1pidFhu?=
 =?utf-8?B?ZkJXdkJGTHNuT0VRWGFWR3B1SE5tdmhDaE5BamxzQVhRdXc5YUVaMk1YN1N1?=
 =?utf-8?B?dGJ1R1h4bEM4aG9Ua080Z1dLRWdsZGNtT1JYckJGemJTdVVxMkVweWlBVVky?=
 =?utf-8?B?bUs4Q2FYTG9ieENiTkVZbXhvODdZUVJUcVd3dW8raEU2R054TjNVNkh5S2Vr?=
 =?utf-8?B?cTcvUm80KytwWVYzUEJVMHA4NnFvM3FrbkEyZUFtd1dPSWhqVVZGTlpyNmI0?=
 =?utf-8?Q?L+KQfKa4RTHj9spx0O2RYORIu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZowsiYnAZQC5lKex9dVXnJgnb2ng4zqqukD6ggrMzKEx3S9r6HQIN8a7aEpdGNsu/84DM+w1am7rli94NVmQSz5cKo/2mPYRTACNd2Ab2hSeSxzkbOH3N9glMNxGONoNspr6tY8f6MRWXz5EVg53tCCx3VO8aD6lxZzrqzvO/PmK8E2zdKuAz3jsvsoHZbHv02LWlQG4A1wtvPxiRGkjCxatg/gCO2AgzCSV6SZeNSgzyGVliL3vhxvLzcwXfQczMdwbuq7uWCyD1jr2SI3VOFf/xCCsvSZefcQzw2yPr9F0fYOSLrJn7pEf9+UxbwHlg/L9kL+AUUNbUewDNvVKbNDk2j6QE0A1VYoaM8DINgVhroXW+2EnOvYBBOQkysCdSD0h5YLSdgH1R+6MU5jmtYFe06NchGEF0zjGmc7nrlXOvHaBBomX86P5vUuDsv9YifNHghihnW+aJSVCPCGwa+Y6c7933wskpeoeh9jdwibOLeG49EtiTCouB18WZXX+amhppBKHR2iDw6kJafVSmR2Q78a78xsVl3R+73CKfbjRVCDNw1HCQhMHkFtlQ5SZltK9JnIKuT3L0E0oSgLFg6g/HderzNZw2Hqdeml/APk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991e86bf-447e-4ec2-f99a-08dde776bd02
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 03:38:52.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYGPYM54djgv2oBumpvxN+EZJISx9PdjrLCFWFhIlqWCdEBraBK+w08F/9NxQgj3/NRGANN+IUZYMn3uE3mEsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6950
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508300032
X-Proofpoint-ORIG-GUID: 3FwI-P-Cplhg_rLljzrdqV9TghJDRBsR
X-Authority-Analysis: v=2.4 cv=YKifyQGx c=1 sm=1 tr=0 ts=68b27253 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FxuJlQCR5zvWby0viQQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXxJ7G0FfiY592
 OhDs3D1VIUrkJo8grjBH/IVslQhi/QgQUporBv/rCg1q5/dPvPtNnKXFQRxofNvZxs/iYjKhid2
 CCL8w1+wNH36yCnOXTlnfLZ/87Jl8MbS82/TURP84LDc/JY4d+oaTDVmDdV6oVlIaddNEfRI4GT
 BvX+Y0AwIvqjc4UhjgTJTOhyhkFoowDomIEVyvs+O7vwvXp9GYb4uC1pD/+in39mWbwhaWToXfN
 NO/ETu84eIEHyGVzorLjIYtGJL4S1s+rWueipxKWb/3XzGPzN4wtIWLB1BTcIVLZXuIzxBOoS6K
 emNQBiC417jv2SbqlomLjSyBYPGD93SwuUmMyxZzuvp1dmmrVLAfc1EPwvvriJa6goC5pYthjT5
 EwvNFxB1
X-Proofpoint-GUID: 3FwI-P-Cplhg_rLljzrdqV9TghJDRBsR

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/29/25 14:46, Kris Van Hees wrote:
> Regular printf validation was passing DTRACEACT_AGGREGATION as kind
> argument, even though the action was not doing anything with
> aggregations.  Pass DTRACEACT_NONE instead because the argument is not
> used in that case.
>
> Also, do not populate the fake type node if the validation is called
> for anything other than aggregations.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c     |  2 +-
>   libdtrace/dt_printf.c | 34 +++++++++++++++++++---------------
>   2 files changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 7af3dd44b..77699c786 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2482,7 +2482,7 @@ dt_cg_act_printf(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>   	 */
>   	pfp = dt_printf_create(pcb->pcb_hdl, str);
>   	dt_printf_validate(pfp, DT_PRINTF_EXACTLEN, dnp->dn_ident, 1,
> -			   DTRACEACT_AGGREGATION, arg1);
> +			   DTRACEACT_NONE, arg1);
>   
>   	/*
>   	 * If no arguments are provided we will be printing a string constant.
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 21ec74111..1e01d4687 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -961,8 +961,8 @@ dt_printf_destroy(dt_pfargv_t *pfv)
>   }
>   
>   void
> -dt_printf_validate(dt_pfargv_t *pfv, uint_t flags,
> -    dt_ident_t *idp, int foff, dtrace_actkind_t kind, dt_node_t *dnp)
> +dt_printf_validate(dt_pfargv_t *pfv, uint_t flags, dt_ident_t *idp, int foff,
> +		   dtrace_actkind_t kind, dt_node_t *dnp)
>   {
>   	dt_pfargd_t *pfd = pfv->pfv_argv;
>   	const char *func = idp->di_name;
> @@ -980,21 +980,25 @@ dt_printf_validate(dt_pfargv_t *pfv, uint_t flags,
>   
>   	pfv->pfv_flags = flags;
>   
> -	/*
> -	 * We fake up a parse node representing the type that can be used with
> -	 * an aggregation result conversion, which -- for all but count() --
> -	 * is a signed quantity.
> -	 */
> -	if (kind != DT_AGG_COUNT)
> -		aggtype = "int64_t";
> -	else
> -		aggtype = "uint64_t";
> +	memset(&aggnode, 0, sizeof(aggnode));
> +
> +	if (flags & DT_PRINTF_AGGREGATION) {
> +		/*
> +		 * We fake up a parse node representing the type that can be
> +		 * used with an aggregation result conversion, which -- for all
> +		 * but count() -- is a signed quantity.
> +		 */
> +		if (kind != DT_AGG_COUNT)
> +			aggtype = "int64_t";
> +		else
> +			aggtype = "uint64_t";
>   
> -	if (dt_type_lookup(aggtype, &dtt) != 0)
> -		xyerror(D_TYPE_ERR, "failed to lookup agg type %s\n", aggtype);
> +		if (dt_type_lookup(aggtype, &dtt) != 0)
> +			xyerror(D_TYPE_ERR, "failed to lookup agg type %s\n",
> +				aggtype);
>   
> -	memset(&aggnode, 0, sizeof(aggnode));
> -	dt_node_type_assign(&aggnode, dtt.dtt_ctfp, dtt.dtt_type);
> +		dt_node_type_assign(&aggnode, dtt.dtt_ctfp, dtt.dtt_type);
> +	}
>   
>   	for (i = 0, j = 0; i < pfv->pfv_argc; i++, pfd = pfd->pfd_next) {
>   		const dt_pfconv_t *pfc = pfd->pfd_conv;
