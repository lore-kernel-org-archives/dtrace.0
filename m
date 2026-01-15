Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED12D47F4
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514846; cv=fail; b=IF2xkmAWCQuIm1BweiCP8vGMtNXEwVsQ69UrOXCXjtcLoz7O87nmswNQWjVsDxuDdkz43TpqgDv466YKWoU0olOgnJqPowJM7wggMq/ggLIuNfAiJwGJ7W9HeH2Mos5+9AdmU8VQaVGUKbkH9esMGUdl0A7+K04J0TEB1MUAQMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514846; c=relaxed/simple;
	bh=p2HOc/iHf9OXitOdTEcwsvF8P4XLkkyVrS5uQufFFdU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CcvH4XEH9N1Q5CNNpScmugdcbVkDeVWr6lj89wJcfVykxg9mN1UmEygaLPvp5/UbLJiYGjg2NRZPbMn9SrIxODjf0bHryylS/APDO2VBYJPNRKOcgMQk7ozuPahj2jCI94ORrNRHPzkZVLHrikDlzahUesavgwkCJFsYCeTtRtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YmaejA/J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jVJPGBiQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YmaejA/J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jVJPGBiQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FL1R3O2682266
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KHC5fSd7arYDifTFdPbgT1zvuapuerPcHVKCh52ihvQ=; b=
	YmaejA/JupiEa1kpPS2HVuMLa3kMsR1s4R2df7hB+AYnNmfwDrQFTNdWAoCHHnOi
	qsNu0svlHg6bEAwQnQpyNeG64EXxaNmV4UPpKSPMwdoYPkGO0SVGXIaruTYdiQbp
	RMnlPJWcNSkCGITvL83It+egXmbsBqpnOQfWjA2Tg2IcQXJ+bEW1+9kvrU6qpWe7
	gh9Wh46nXnQ2hBo6GWhTNGDFXw2I8Pmxjc+pKEoR4vn4kb0yVjtvYxEwsoBWpG+m
	ah/rrd/yXH1JIqOQ+zJI0M1paWXE7rux35R4i6PqLzMDVIdUbwPSRFqkXSqZqK8A
	xI1mxODfHMdrBTJPHbYIeg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb8v0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:07:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FLPU2q008248
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:07:22 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bne1b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:07:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUmLM6I9tpTZbn+ITW67is9iJqDQ6CfesXMrDjJF3TjZ6fZTMilL347xnfl5OfAeblW6CEkvqo0/HZJdAH/p+obM3o457g01zOVpaHlPkadMJCJwg8ionmd26ekEDJij5hmlq3w7BfZjx+xr6gJYbC0b/saimngmNLf9pxd3ztvdu00O2ctwAXz5lmBXx2YkUUquK4JYAa+FiHk95urOvoBiYJDKFe1lEoGkhDfCc3N/1jb/7XuVHaLeCqNL3Dh2yyD2kck4EcC1TN4kBQuWxbM8v0/foIPw+FtGSR2JkgWEyr1hMAwdHaOxAlHGSkAaaLKnm9JrupBZGdYOdVUFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHC5fSd7arYDifTFdPbgT1zvuapuerPcHVKCh52ihvQ=;
 b=BvgWvb4c584Dx6JSU0+vm1BTtws7pOO/R5fv8tUu4TtoDw+qnYYD9ORIvaPW0cdExGKr7mcKTaXTKEaDjcSc1SDmEznJtd9z+ETgJsL5FUqfdbEuj1ywXfbEoMn7V1ndeH4D7b8sNrlMRRmkxEuNhVakWRbZJ4YP448bVX2fj1c8bXDHuPBRmaVxeFiS5qC8TVPhH/+j5fFEKOLH9gse9Mk3qOC8AsP7xG5evdXdLb2MPlB/y/HTPGDIwR0XEZvYRj/WTq1fZDwiT44cnrFlhZCtSdmnyhPDV/o0LqyYGD0OgvpffO4L6JWJxQlVlnQjMu4iYDxX17t827LYy0TIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHC5fSd7arYDifTFdPbgT1zvuapuerPcHVKCh52ihvQ=;
 b=jVJPGBiQeMZ+buErzVlkSOURmoyT8ydjmWJd07F6XmEILisBw6T2IL3at/1Nu2CDy3G6OeR2S3QJtVsSoMoFDfQp441PfgaVdW9XRsY+GYhU6ysI4dzfko7Zb7zQdGbf9wR2YZWMBybiQqBca515k5As99UM9P63AWVqjhXNbx8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPFBD8703CAB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 22:07:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:07:16 +0000
Message-ID: <5d614822-670f-31a6-295a-700b8e2e9791@oracle.com>
Date: Thu, 15 Jan 2026 17:07:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] fbt: Populate just once
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260113214205.9159-1-eugene.loh@oracle.com>
 <aWldrTXBAla0jjKO@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aWldrTXBAla0jjKO@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:510:324::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPFBD8703CAB:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cfb9ad-95f1-405f-5e51-08de54827166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3RKbUcveEdBdm8zWTMzK3hLQUNiVGRodHlSMVE0OGk2K1dBS1U0YUVKT3Fi?=
 =?utf-8?B?M1J6VUFWWTIwKzVDV3JHY1FqOEVRY3d1cHR4L2ZIMnc1TVZEdFhVdEsrVSt1?=
 =?utf-8?B?Y2ZWc1RTeGIvWk5KM2kweEpoNGFTak1tRkhFbmJiODhNVWlHV2I5TkUzbjJz?=
 =?utf-8?B?QkVSdDZOUElkdGYrd3VoOUMwOXluK0VwVWNsVU9DWEg1azJ5UHNDSzdBeU4z?=
 =?utf-8?B?SE5XUlF5anpDRDkvcFNTWjRKdE9KQVFWNXZ6bmU5YVJLdGdDUTByeXFhc2R1?=
 =?utf-8?B?RmN6UUd1Y1J3RjRxZ0hlMlRzakZoSVUvb0ZiQzFReUFCTWtERnR1N2hiS0Vo?=
 =?utf-8?B?RG9VSzRrV2QybFFxUEIyZHk5bHpHZGZYOFA0NDVUYjdaRnFBQkxnWmdyVHZC?=
 =?utf-8?B?b3RVSGJiV3FRVlpLaEREZThHM2syZWErbVRaVmxTYzg0c2IybGsvRkRMejYr?=
 =?utf-8?B?ZWNhVG8rV3dKVE5HYkU0akhMMmJIUU9VU2YwYm1VSEh6eW8wbnJoUEdvbmNv?=
 =?utf-8?B?TWNrM2FOaXBweWhBMWJRRlhkZ1MzaVJRbGNldkhyTHdURVFGL1Vnbm9WbEdQ?=
 =?utf-8?B?NmJsb1pTbzdQOHJyUFlKVi9vUE9zQkptOExkNDBQVTRidVZZYVg4b0VQVXZ1?=
 =?utf-8?B?SzRSTzFFY2x2SGdlRkp3TVB4MTdUZFVQRm9jR1I2cHZVU3BheG9pTEFTUTFm?=
 =?utf-8?B?QkQ4eFdNNFRvMm1UOTBsN1VrTHlkR2lOa2FwMlhCSTV6ZkV0Q21ZbUw5RWlQ?=
 =?utf-8?B?dUZyd0VQYTR2ZWtTczRTdzZxRmxNdkliK1AyVkJhYWpmanpFTEZCZUg0eWNS?=
 =?utf-8?B?Q1V5Y2VzZVQwcExndEl6aWp1ZXdMbS8vUnpEVmI3ZVNjSGhCcGhGMGVxdFQr?=
 =?utf-8?B?Ui9oU2lMTkNkVU80dlR0QmU1L0JjZEQ2NmZQVzBuS2tOS0hRVjZmazRxOWJm?=
 =?utf-8?B?TGF2aFpRR1Y2aFRyRExTSVJZbmV0R2dDbG9DWGRYVmVYWEZDVGJaUGtLVjMx?=
 =?utf-8?B?eUs0TWU3eHAvZzE3MXNxVDI5ZHF2cVRBZUEwald0SlY3d1NKVEZjY3g1RWU0?=
 =?utf-8?B?MHhNRkZ3MlF6aVZaWUQ4THljUlYya3BTSGcwaUxBcE9GMEpHNUhabEx0N1J4?=
 =?utf-8?B?UklSSTFDb2dBUlNydEtpOXgvblR4WUE2amNicjNsT25kMHlickF4U1JnT0JO?=
 =?utf-8?B?LzdPYlRMZTg5QWJMTjhuR3VLaFpUWDdVclVnUDc4RGNJUWJVQkxmTG0xbHNs?=
 =?utf-8?B?Qng4UUJLUUZzaDVnTkZFYU1icHRTeDJlZ1pMYS9SdlFoRXNIRVo4QXRDRlhI?=
 =?utf-8?B?dFpwYUZuUFBaNU5TY00xc1h5U3hmQTRNdGtrTEZZZlFldHlxeUhqb1BkemZx?=
 =?utf-8?B?UHJzWk1WTnVMVE9XT2Z2aG9naVk4MWdtalo1MVhKRXdlQTFsbUxNU1YxS2w4?=
 =?utf-8?B?czlxY01jWGZQMHVTK1ZENjhVWGpRQi9yaVBnVm1YRlBvNzc5aGRPc2k4TmFu?=
 =?utf-8?B?eThEc0dVK3llazlacXNPVm1ZY1FiQXB0SnBYMTRtMFN5aG5lbys3U29VRW4z?=
 =?utf-8?B?WFBSWkprSG5tajg0VXBOUVZ2ZGw0c3ZuZlV1UmprRUNiVXRoQzVzOFhnY21n?=
 =?utf-8?B?RmVMaHZ3SmZyZnpSZi9MNjNDS1NvMGE4em1wL3NDU2NncFRzb0ZPOXZNMjlP?=
 =?utf-8?B?dXdqbXpWU3FLMmgyYS9DRGM5OE4vWFdmUzd2aTBseTdETURVZXdPQ3Q3T1ov?=
 =?utf-8?B?R2lEcXdpb2IyLzN3bS9rSUs0THpMNEYxdExoRXdPYWNhY0I5Y1RFYW1QbHgy?=
 =?utf-8?B?dFMzWW84R0lSVSsrRm9wNUxjalByL2JHaEdEMmV6OXRReWJORlQvNUJVREhS?=
 =?utf-8?B?NVlJZ2JoQzV3QVhqa1A3RS9KZ3N5MmpOZVdTdWFOQWhiQ0czcGp3UGpOSXlw?=
 =?utf-8?B?UlVIbzUwcW00WlAybU9CUFJlL1I0dm0xMHpncHk5dHJGV3N2K0lMUE84Wi9N?=
 =?utf-8?B?Nk1aQi80TjZpLzRSVGdUem5KaUp2M1F1V2ZtN3doU1dqVFYxVzFmcXR2eUMz?=
 =?utf-8?B?Y2tDTzVFd3NoOS9TV21MazdMV1pPb2V2UXNFS3lieC8zU1FtMTRJQmIrdEZC?=
 =?utf-8?Q?CJvw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGpkcm1OQzdMMEVYNC9nOTlBNEtWL3VYc3hCb3ZFOXJTMGd5UWFhdFNlZ3hs?=
 =?utf-8?B?OUhIZlA0UjRxYmhxSEhjRnpVM2cyOFFMRXhBd3VwbWVUT3NXSDFsYlhjYUJ3?=
 =?utf-8?B?eHlYRVJLVTlqWHloZ2RSQ2xHYnJ1NWJvOGI5amlaQTduR0luMUkwRHR5L0FK?=
 =?utf-8?B?bjAxb1p6amFDWHg0NjFWb0V4bmdibHF0TU9QZWltUmhKR0lQSWxWMFZNVmFI?=
 =?utf-8?B?RUNJZEtCYVlZVnBKVlJpd213SDFGMUVVa2J6ZEZhVlJ0TXF4MGtLZm1RN1B6?=
 =?utf-8?B?cGRjU05sV2w4VnJlbU9MdThsNDFlUmFiODhtRFU1Szlta3k4b3JSR2tBdktU?=
 =?utf-8?B?dVhocjNaUGxWcjI0TTBuVTNQTG9HbUVaZ21MMGQxZk5BME9VeC9sZ1liczFp?=
 =?utf-8?B?bU11Wi9kOEVKdDAvNjNaWlhlZVhpaDl4OXM3Z2J3N2FpcGtiVVB3RDUvc2dw?=
 =?utf-8?B?Tm1xK2NDdGw4VGNWNW42azFwTXE0WFg3M0NrZlFZVWJKUkdMMGZ2S3J1VERa?=
 =?utf-8?B?SE03T1I4dmkzVWZPbU1LYUR0bmRUb2ZwTlFscURoSFJySFNSM0JvYjVGell1?=
 =?utf-8?B?bE1SdkdVR2VOeFdYZlhRbnBHRGR4UE5adXMzMmxuYW9yRi9jY3FuNlpsRzl3?=
 =?utf-8?B?eldyRC9tSDM4MDBLcG1NazIvTFBSVGFyNmdsT08zczUzVnBBZnRNbzVmU1dn?=
 =?utf-8?B?TmQ0djE5NVhCZzkwZlJBd3ltY0hwWUFCaGtWMnNwMXJOc1c0cUM3eTk0WkhO?=
 =?utf-8?B?NXdaLzd2OEJQcnZ3M3dRSEx6TFZLRHlJOGMxWGtTZ1YxYW5WUWZWNHdRZUpv?=
 =?utf-8?B?NXJRaDRmNG9VVU11N1k0NE16aDRPTjBUeVZZWkVYcjZuczU3QlE3NndETThu?=
 =?utf-8?B?ZVFrVmptQXFvVGZVaFNNWHFjVm1WUUhuRXJ3Y1hMSVNnd1haMUF1c016NWpt?=
 =?utf-8?B?NzVJL25MYTJoNHNlQW5IeHRsZ2ZpeldKMkphNUsxWXBNeExUYitSWjJEZHlW?=
 =?utf-8?B?WEE3RnFoejZsb2pvcHlBSy9mMXU4QmpLb1NpVkNFUU9MYzNuRXpOQ1NLVCtn?=
 =?utf-8?B?Vit0RkdDOVBxNWpNREJyT0w3akxQdXM1M3BJTFZkQ0llZzEreHQxMGtCK2dj?=
 =?utf-8?B?dnBOb05oUDZQQm1oczFLcHN4V1g5akgxb0lHU2xFWG1ITkpQUVpDbjNhWExp?=
 =?utf-8?B?L0VGUTV2SzZNZlFrNGM4QU1uSmZ5a2libnV4MUlYTG5ocmhNOGc1S2lUbEdL?=
 =?utf-8?B?UFBuL2hvM01tdDBYb2QrS3VXS1VEMlJRU0JWREFhVmpFemZyRDBmMEhwWDRO?=
 =?utf-8?B?UG55NmU1YkZiMGxNK1VKbGJQdXZESFM5dHRkYWFURUJEU1B1SXJndFJDL0hI?=
 =?utf-8?B?M0d0SUZOa2ZQcVorSllTUmVYMU9uRzAveXVpeGp3NUFUcWsvMVNYdjhxc0pV?=
 =?utf-8?B?ZUdmVldtcmNHTEVGd05KMExtOWZnRWg2R2FUN3RUdGRpZ0dmcWtDdm9BWnE0?=
 =?utf-8?B?S09uVUU5c1FaY05NOVVOVVA5ekVjdzBJa2FXT0N2UWlNYWJKelFGeWtZMTAz?=
 =?utf-8?B?L2I2WnZ5VG1nTmNjZG5FZkwyUE5JeE5ndjZSN3E5MUwwQUJWZGZFUFYxZlFN?=
 =?utf-8?B?dGxGSGlScUlqWkF4UlU1NGxmOEhsS1lJYkVjY2NTZU1VUVJrMFFGSmo0WnRV?=
 =?utf-8?B?b1R6V0lldThidHF5UmRTWjNZQnQ3bTVZWm00UVE4eUZwL3k3Slh1b3ZiYmVj?=
 =?utf-8?B?U0FLUGg0RFV0bFBjUTZ6UHFEM3ZWQitDdExSa0ZTZnJuUmxoVVk5LzcvZnlU?=
 =?utf-8?B?aXhFWUpsOUFSN1N5Y0hrN0JlYUtBRVZXa3UreEVGejU3SUdLbWJGa25leG5C?=
 =?utf-8?B?L1ZaM1dDV0tuRkc4bG5QS3Q5VVBaMXpGdE4wNjc0TTZQTUx3VStFTER3VG03?=
 =?utf-8?B?YXFnSkxDTkJDQTlXdnhVek9xR3pwcVIvditCd1hlQkovclBSV1dWRVhhd1B5?=
 =?utf-8?B?NnphK3BzcmFxNnlqTEh3T0pRSmlMRi8vcnp0TDQrYmJmVWZRVUFZVXFxRmhL?=
 =?utf-8?B?M2I4SjFrUFdSUVFUZzNZMVRJZWxkWFd5b3lRemZQNVErckN2MW5HZnY3U2ZB?=
 =?utf-8?B?ZStBZ2djYnFsRHhlS3VycjQyeWNpYk5xb0JVamRURWlWVXpEUE1zUFJDOWNP?=
 =?utf-8?B?bG5ncXlRcDZyV2ZPT2k5UWhmKzVyeVhUbVBJcDQ4Y0pqdWdwNUIxM1hIeDJt?=
 =?utf-8?B?TWRVUUowdVJOb3pOd25qSW9ycFVBY3ZRNWJFTExJZ3hmYW9aOXRYZCtZRmxv?=
 =?utf-8?B?azgybjAzSG9ORE5oSmVZR2RxeXRiRTlvZklwNExFUGNJai9DOEp1Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k6P9DS1SWdR6ictlHUV9NoKIg+j7VSrTzLITSdnmp9TImvUbjybLRo6fP5pbicsJK1vgdjsM36VWCl9tmUSEbvCMhIepfnc7Gyi+qP/AW/hAD1O9hh6znuc9rOVyxZ3buqP3hrQ6hPnTXctso7FZ0+g81mc/ASL5M3+eEPbVdGjvAtxCSZyoZChL65fByIFy4wE2hinUbgJm0u21fazAiWjme3m3p0lu3yAg+X9VCV4beTHC+gNwhSBJ0TlPeIQWfvyQCYYzSFLLBl7LMIDw7VD7EUwJVt8HFp+9DQ/J1bFdfdjyGipW51U34xhg7bHBuGf38/VrTJ/lteNIFicPtOlbVbzsSGiXHaUDKBVaiELlM8XLWFq6yYmbCY3rn/BDqwSlhjxCTM4YRLC+pYQRo7WZKhgNIggcGfgrnFJtZ1sFuLfM7/MtV4XHfPDXqmpl7vzr7+nQDNHPN4FmDtKgyuuS2eR2yo4x73CMp7VoEzUB6e0hQT61rAWRYQG85IvTMdh4VMD3rUAN9HM9h8bHoVuulktY3tupjpH4GuK5End3K5vatzjXbGYzxKXJEOUlOB3jiWimwG0jkiITpEz+xZU4+khZhyfLCIzA+AvtlRU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cfb9ad-95f1-405f-5e51-08de54827166
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:07:16.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZocVDAFObxZCNIEvP7VSHIpIeaXHgHDXLmlZfjK4RBbyax8pvGIreaf+yqcR2N1yYmlShaeABtjMQ2BTtK5Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFBD8703CAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150174
X-Proofpoint-GUID: v6VXvOx0EsRN6Qz3B7uZpYdasZ2P-Zta
X-Proofpoint-ORIG-GUID: v6VXvOx0EsRN6Qz3B7uZpYdasZ2P-Zta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NCBTYWx0ZWRfX8QDR5/5BxJZJ
 Uba7XK/PP6wMZ5oLy9qXtJgUQYZpO1afh03AvjYt6j5wDqI+ZLXZGTaTKPLQGtrUVKNYOjUOfX6
 Baekxzw+RBdu2/ifCG2Tfx18tKN/BoSU+8TzCOhYQwcKQozLG+XLU76exsB6NYnMsxtDD8gbcJd
 h0SRatK4UGNO+VAnr3F6QPzjpCiaS+KPZ7gfe+6tBiCNcFTWne//2HNGlVG4HbhMXHwJ+cPtPpM
 jwVaIrw/XGs5/mzSOZHVW4HCHzi+w0e9HTzODTcwGdR84Jf9lCvSBnbuv/vceL0xYjP5cnx0+7s
 8RhlBrw9TfESo/7zZP1Qq8RWRRM+KNXaKPmJcCWo1skuXIwrekIdP50Styt8IqVkmAj1/RSyqRr
 S3AiTL+3skaoTaoDwqyMVvR3nxH6q8yr3pj4cRX5RRIjyT3JJ9USA9I2uK/pQHSZH/OCZBuwxVE
 p5fHLanXFwhYD519iYQ==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6969651b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Ax8te3d8Y_54XBZtGZMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 1/15/26 16:35, Kris Van Hees wrote:

> On Tue, Jan 13, 2026 at 04:42:04PM -0500, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
>> the populate() functions for fbt and rawfbt were combined, populating both
>> providers, but the function was still called twice.  That is, dt_open.c
>> tries to insert each provider twice.
> Where do you see evidence that the populate function is being called twice?
> Only the providers listed in the static initial list have populate() called,
> and while &dt_fbt is in that list, &dt_rawfbt is not.  Also, adding debugging
> output to populate() in dt_prov_fbt.c (or enabling DTRACE_DEBUG) shows that
> it is only called once.

I agree with you.  Thanks.  I'll resubmit the patch, keeping only the 
"harmless safety net" and typo correction, along with an appropriately 
reworded subject line.

>> One solution would be to have a different populate() function for each
>> provider.
>>
>> Here, we employ another solution:  in dt_provider_create(), check to see
>> if a specified provider has already been inserted.
> This change is not needed but it is also harmless and can avoid future problems
> so I would not object having this as a safety net.
>
>> This also requires a corresponding change in dt_provider_lookup(), so
>> that it will work even if no providers have yet been inserted.
>>
>> Also, fix a minor comment in the fbt provider.
> Thanks for this fix.
>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_prov_fbt.c | 2 +-
>>   libdtrace/dt_provider.c | 6 ++++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>> index bbe44a842..3feac56ea 100644
>> --- a/libdtrace/dt_prov_fbt.c
>> +++ b/libdtrace/dt_prov_fbt.c
>> @@ -228,7 +228,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   		if (!dt_symbol_traceable(sym))
>>   			continue;
>>   
>> -		/* Function name cannot be synthetic and must match. */
>> +		/* Function name cannot be synthetic (unless rawfbt) and must match. */
>>   		fun = dt_symbol_name(sym);
>>   		if ((!rawfbt && strchr(fun, '.')) || !dt_gmatch(fun, pdp->fun))
>>   			continue;
>> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
>> index 848fdc132..9d75225fa 100644
>> --- a/libdtrace/dt_provider.c
>> +++ b/libdtrace/dt_provider.c
>> @@ -114,6 +114,8 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
>>   		return NULL;
>>   
>>   	strcpy(tmpl.desc.dtvd_name, name);
>> +	if (dtp->dt_provs == NULL)
>> +		return NULL;
>>   	return dt_htab_lookup(dtp->dt_provs, &tmpl);
>>   }
>>   
>> @@ -124,6 +126,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
>>   {
>>   	dt_provider_t *pvp;
>>   
>> +	pvp = dt_provider_lookup(dtp, name);
>> +	if (pvp)
>> +		return pvp;
>> +
>>   	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
>>   		goto nomem;
>>   
>> -- 
>> 2.47.3
>>
