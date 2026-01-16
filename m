Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56B23093AD
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604646; cv=fail; b=DT8SrEFKqkNksYPjACy3ODl+lWcSknHAPOuF7zQARZepEBlI3awhnCln0SE1K4MlOSV/0+9uIIseKtNd9ZDxN40+TgkqyDN8vLiNE54rnpnJI8Da3OSlbCw5RgeoGIgd4kseGWbB9AsN73uth1+tIyI4pVDSmK60DDAieq2uvyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604646; c=relaxed/simple;
	bh=NU6wsZAkjd6IpwV/7S4qx+86vm7M0/LiIO4Y6eQRxKo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N/Njh1BVFjsbIlOb6aFy+zDCKOOFVzun0TZDKtU/CZOkSAoMHWsl+w4jLeub6QDbKUvEfr2ouavW9Iw4aJKX1dDNK4ZDDNE2AW76LzemBSGBEPumUCySLgVVKA4K2UZXoeOPmeqQjaJmYvKK/WCAB1YxpcDA3f6/Zs/jtTlPaNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RnD317B6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j1Qp26UR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RnD317B6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j1Qp26UR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKWIfA3528508
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SNYxBbUb3WujmcELeo83r4wxF3D1NmdAVajpwVB3/Kk=; b=
	RnD317B6JOBOFOKpMAPssOhdblK+SahpZkHOuUVM0k9bEUwwNTI+LcxNScqeTePt
	ECubdU2r1ug7n826rZRHxgm/QzOinMXXX1MBUY5PDX1c4Fotl+otKciW7n0zge29
	nThxvIyH96XX/gXqMOzAGO9ZcI9LpPGJkOe9ev3/nZCSkPSolFhvONJhXWL3i3Fc
	uUHeGwXvR+lNSiMHpHon2AvqWdKjA/VlVSfnprNjcxHE5jHi1HWTvKBCi4CBkRoA
	quW8zP4Z6CrJCyDHvB0gnKCGazXopzGmGqxSslNFPpo/rrSwZYCN31PK7IvjE7Ti
	kkDcDgqLyJIRUwUZhvmGjw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvf005pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:04:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GMmfWn012756
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:04:02 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv7a4pnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 23:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E02t4HpCpf+x/pAY/3CHFYyMLqoKRlR7LQN1Tk4j4gK7Pgoln9p52VSPyt/CZx6PyZLv6quOh5v7/7kjs2OskEt0sUpwwcW+TPf6Ca6EbhL57vwCNFxFtZPv12gudcJqHwPQy5XVsSKqtrTAYobWDiR/6jaOsxjSfY6zraXuopkx7QLJWG+0NeTq2PorX7+khERRLQm4yYmYdvCbpVNS2LxkcgEC2c83i9cCzZu6u788bkHdRu2JMViAdeZXEffb/LPuBMWVL9wKJFdOqxZU+PRIIih201EXFj/XM/4Eehjb90O8yib+/C4iqT6oUYfWHKCEzq7xllq+FyjuEwmk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNYxBbUb3WujmcELeo83r4wxF3D1NmdAVajpwVB3/Kk=;
 b=OGd7BGgH/CTNqfQ6Pks9cXSzC/NcJK7BuuWHdXKsNtPNQkN6Jmod07UfntA8oPt+EqLYgdYUul761xGdIG1vnmlJzGAIj4xrPKCUwgIpqLlMX4xBFNnmH4aVs5viA9HVwNTujXnbJl7m76Yqy4Sy+MFr9zJ2UeUEPO5DtbtSoteiHeUqjyn2HTnhU4FHOBTaxvSmhWJW4f067XjnHw3xqqkPTarmaL5mQ7o+Wd26sK1D/e+f5Ro6UdAxBhyNRPGpE43jMNkNgm0p9YoPsOYrHDm7Uq5P8+0lTfRq6EprJFno3u9dLCC0O1MA2CQL07rNX35tq9TBabs0LDVxCSX0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNYxBbUb3WujmcELeo83r4wxF3D1NmdAVajpwVB3/Kk=;
 b=j1Qp26URMvwKb2R4zROOXzYwVjV+bw8zCq8+GpklLKmo0dmTNlrR5V2DygSz2cbzMLzOU1hdPyJBi0Yvx5TnLQ+liqLS3O/VrDuzMrWFjpDtA5nmTXjvpcNP8loOrulPLSn/r0UzFwuKTG9TVGOFreThnhH4ht368cB5NcPqrxw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6417.namprd10.prod.outlook.com (2603:10b6:303:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 23:03:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 23:03:56 +0000
Message-ID: <4f2a00c7-adcb-50a3-8963-d97cc0122c2c@oracle.com>
Date: Fri, 16 Jan 2026 18:03:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] spec: various fixes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev
References: <DS0PR10MB752287C32D26FEB3EF6F32F8C28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752287C32D26FEB3EF6F32F8C28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b016b3-2ef7-4f5f-0158-08de555386b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnFwUEhqQTROQ0xLbVIvdUFOTTdwWmNoODBXRzc1SkNBTGxDaFV4TVd0TTkw?=
 =?utf-8?B?cEhCYjU5Sk1lY3NWZkk4eDJEUy9rblIrcFI4MGRWdFFPNzhhVEYzNUl1VFJk?=
 =?utf-8?B?MnA4REcyaFdoK2hESTlQKzhjMHZzMVdPY0VsejRicHhSM3JsQ1ErU2xTaXp3?=
 =?utf-8?B?Q3RUdzFLdGkwOEF5K1BWKzRLN2hhZFgvV0JuR0FhaDRMbWU4RnViMlc5OVBJ?=
 =?utf-8?B?WVM5UTJnQzdyd3RFQ0NlZkFVc3JHQXM0SWlwMnNGSE55d1RyaTRkQVZSZURJ?=
 =?utf-8?B?aUNLekh6RjdPcmNXUEhRNHJuV2JzSkx5aXdQWWxxSFE2ZE9jaW5UUzhOVWtI?=
 =?utf-8?B?U3luL0pRdlN1ZDRmR0dHVk9OL1VjK1A2cXFmb1hHMlFDWkJySzdJbVZ2andW?=
 =?utf-8?B?TVVTa1JtQ1JDN2I0aXdMZDlEUUM3UXNGZHRkVFk5dWlQamRyZnBORnJqYlRT?=
 =?utf-8?B?K1lGTkNET0hDNWQ5c2ZkcEUxZUJabWdpWDdHeTdBRzRyU0xERHJHZHdhNTVl?=
 =?utf-8?B?QktwaFhNbUFzRXRwNkxsUEZVSHVBb0ZIVCtTakJDaXhLbGc5MDhwb0ZkMmZU?=
 =?utf-8?B?N04zNGJkeE92cVRlMDBLbWY2blhFYzE4VVNDbWtsWFFjSUNkV2hqZmU2L2lB?=
 =?utf-8?B?TytBanV1Sjhjczh3dTlWZTBjNFhqZktobTg4Y3JFVGVVbm13Q2lncUpIay8v?=
 =?utf-8?B?Z01lOWI2SHlqOTBNVkpORjFoQW5mRUpKSWtSbExUKzBadnh3WGtuRFE2UnV3?=
 =?utf-8?B?R2RuOTRPVFk5MTVwZE03NzNsdU1JbHVBUEN0NTd3Nm9Ic0ZWQ1lrbGExUTBB?=
 =?utf-8?B?aEVTZzRZa0s0b0ozUW5IV2hNanhEZzNHUDNRdmF6NGExaitHNzNUZU9zdzdv?=
 =?utf-8?B?eFRYWnp2dXEyNGF0THRTemFnWDZqTU56NXQ3Ly96ZUUrWmh6TVRUdDV3STAy?=
 =?utf-8?B?dUtjR0xFYnVXUkhObmVoS2QwVjFRdWY0My9nY3BsTlF3ZDBlKzZla3VIRTdX?=
 =?utf-8?B?eDNhQkpINVZuMlJoc3puM0M3SEI4T0dKQXdNdklLS1BESVcwekdpTUUySXNZ?=
 =?utf-8?B?WkRZMkRTWGd2Y0tyME9GN2h2TWQvQktBb0VlWktJb3VIT2V0c2pVSVgrd1NL?=
 =?utf-8?B?MlVaNG04NW14ck11R3NrcjRCZm9JS0xsclVJUVhxV3FCS21reTk4cHhRb3Fq?=
 =?utf-8?B?TFc0SDltNXNnbkt4eHlyWkJJSDRZZGhyUjVzMUs0R05xbUtJbEFmRk1jS0Vo?=
 =?utf-8?B?a3ZSN3VLMklBckhoSFR1UDRhRUx2amtSeW1MaDJGL2VYeGdEby9tYU5zcFRm?=
 =?utf-8?B?a1FpSUgyb3FxZzRKa1VFblI1TSttSllsWE5uWlBlWStPLy9oWUgrTnY2ZnhY?=
 =?utf-8?B?WjhsZnBGbGsxR0hYR05NL3M2bjMrSlA2azZ2RUo0ZW1YbmdBWDVQaEtjcUpF?=
 =?utf-8?B?TUtrSm1aNWpCbzdqMy9YSEFKNncrS3hGUFdrVWlsalg3MmlaQ0dYZHBlSEZt?=
 =?utf-8?B?Y1NlSGI4KzhIMk8rRlJYV3pyVXlLZTh6NndNVVIyMmxMYjNrYjhvUm0zMDNC?=
 =?utf-8?B?SVZGSXZ2VVlueTNZRmhZY2xCL3RKYzlKWWJGY3g5dXgyWlR3eWlSd1N2K21G?=
 =?utf-8?B?TzRCcmNLQ0pLNjFIZUhrQXpMVzVOT1VmVnJ3aTMra3hlbm1SQzBXK0dIRnZ2?=
 =?utf-8?B?WVJyb0FHK2phbGw2WUlaMGdBWDRlbUUvUVhzdi9WTDlyNDdhaVJHbytSK1lh?=
 =?utf-8?B?bXl3MEFGNE1xdnVJeWhYa0xSWm1YNy93a3hDWlV0SnpucnR4TWNscndyVFhx?=
 =?utf-8?B?dStwUkJhNWNBeHkvK2gwWnJ3MEV3RjZHNmdLSDRDMnBhMUFBdDJlMDVGTE1L?=
 =?utf-8?B?QmsxTXNwbU5lWTZlMFk1UnBJTjVqWDJ5UGk0aVlDTGNMeGUwSkZlWXhFUlla?=
 =?utf-8?B?RE9SeE53QVJudTRVaFBFN3VpYkd3UVc3WjRPbk1qUzlrM25QbnU4eGNZZVZo?=
 =?utf-8?B?R3RsNk52bVlNaGhwV3FwMzhjYWdvcytOSStiVnVUcW1SUHRpUlhBM3kwUkc5?=
 =?utf-8?B?UFRIOEpkSkp4a3N3Z3AxMjNqNkMzZVFJSjRySllQZ2VyN3N1bWV3bzVjYXQx?=
 =?utf-8?Q?Xww4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE1IUDlLMEFBb2wwZXYzL3hOZFoxdDRseXIrMUU2eG0reW9FaUJqYTNQd1Yv?=
 =?utf-8?B?bmZtYnEyTnVpMm92TTdCS0xFbEM0aWNEdDdnRmlHVHRUaHBkZzBDWWFNTVJu?=
 =?utf-8?B?ZnN2Z2dYL0gzS2lIaS91cmJnRXVmSU13czJBM0Y3c0hjajQ1QUV2M0o3WnNh?=
 =?utf-8?B?YkRUdkhuUG5uNWRXNkRvSVl0KzYxd2hRSEwvbm5jcmhqVUR3bVZwc3UzQ2dE?=
 =?utf-8?B?UVZkN1ppNVRXQ2NTRjlTUkM1TkQ0Q1BXdFpOV1FncVZ6dVU0VDEreVpENTFN?=
 =?utf-8?B?NVNsMGtqSkkxVFcxbkp6SkJMdmpRZlpkZGptSGJPWFZCbTNMNzFnNmR3Vk0z?=
 =?utf-8?B?RVFGZS9NRWpQbGNBVlRIS3dQcUxjU05rQ04zOG5uMVVTVDNmSkhZS0tOQWVV?=
 =?utf-8?B?UUZFM0I2bDNnZ0kwQ2Q3TFMxWE1nYmdmcTZvVGxUK3V2ZDRkTGdKb3V2Y2R6?=
 =?utf-8?B?T3pBMlRQNE0yUUs5dW40WXJtdUxTU1NId05MMTFkcnIvM3o2SUdUbS9idUpF?=
 =?utf-8?B?dlpLTThBekZweTEybE9ENnBOUmNJUFBoczQ2c0I1N1JkMlJ0RzdRaGRNeC9n?=
 =?utf-8?B?clZ1V2diaU1hWi9oSWxCQUxDcGZSZEtTOXdkNE9TNE1venlHbFhudkJwQ0x5?=
 =?utf-8?B?dW5vbWpEYlRjZ0RuczFxU3pudTNNNkFscjllT0E3VUlKQS9VS29QVkNMbWd0?=
 =?utf-8?B?ZHhpQTh0SFBMc2VodTAxaXJEbFBDNkNlTnlETHplMDRiQmxHbUd4QlRMSVBm?=
 =?utf-8?B?ZWVyb2FUK0FMNDZMeUhPUVFaZHBqYytRdTN4Z3VwRmRSQWM3eG9JeHdUOFY5?=
 =?utf-8?B?SGppdnZpdFZ6VmVFYVNVR2kvQTJMYUNKMmM3UnlNV0wvbzJueGl0RlphOXVD?=
 =?utf-8?B?QVFBaUVHNVk0cGYwYlhrYUhScHhUMVZGeXU3ekRlbnZPUWw4TU9RQ2g4c0xB?=
 =?utf-8?B?TVRVMkFtZXFRM09URjBzdzROSFJYUDUxSDQyQ0xPWllOQktkRmVKZlJydXFD?=
 =?utf-8?B?NXRBWXlBVFdINGVKRUpNajlaVDdsbUJxT1pheGpHKzNIRzRzem4wUGpOcnJ3?=
 =?utf-8?B?ajVrcGdxT2NUK0FSTkNJbXhSKzdPNklBOHM5NjRVV1VIR0dQeEVKQXp3bUV6?=
 =?utf-8?B?aERJOWNaWDdGcXlSOVNwVGFoclZDMU8wcTBqa3ZQUUtmUEo1aGNUeTI1QVFt?=
 =?utf-8?B?UmhUR0ZXQ25ncm1PZElpd0pKWnVvdFFFMEo1MHZscEs0dGJCK3RERjNuc1Y0?=
 =?utf-8?B?Sml4L2lsaytTWUtwT3JJV0lEVjVyT3NZZWk1WE5lUTQvcHI5cUZnUDNMSXM5?=
 =?utf-8?B?MVowOUFGV3NDZ2tPSDlYSExHQ2ZTaTJjb3RudVJJcy8yZm4rVUN3RHRUMDdO?=
 =?utf-8?B?ZVd2NXBnSURSZjAzZURyeHZCTUlDd0krSFpGM1FETUF4OVdUR0t2aXBLRUJI?=
 =?utf-8?B?d3pDb0N5bnY4TzNna0NGeTlGMGFRWitEZ2tTajhwRGY3QlM4L3Fzajh3Uld0?=
 =?utf-8?B?QjJaQVczYzhWeC8zWnB1a2tiT2tkWmlxN2IyMjVCeUdJdjBYWmV2WE5GcTJB?=
 =?utf-8?B?OG5Vb3IyQit3R0IxcW5jSU02amNCMzBFUUJmYlJuQlBGamIvNXlkUFFKVm9U?=
 =?utf-8?B?aUxscjhHdWlXNGtlRWxxSG5qeWlsa2JSdzhVT2RPUkNFVzIxY0xIelBJRThk?=
 =?utf-8?B?Yyt1SWZrRWpySEZLWWIrUHh1OWRlTmROd2JVa2hjaXZ4ekUraXBxTEtZOXF3?=
 =?utf-8?B?dG5mVElPVlBVWUVqTHg1U3BFSjJxREV4R0h0Ui9Sdm9ZQXY5aFRhZXpSODFu?=
 =?utf-8?B?WVNySUVhdlhjYmFITEUxbHBOblNTL2hMMVhYS05EUTRTWmhBUVZXSTVUb3U5?=
 =?utf-8?B?ejZGTFpnQ2oxaVV5WGcwa2tQT0FzVzh2OVF4QVJTTFFzaFcwTnhhcmMvWllY?=
 =?utf-8?B?WUpNWitrTWNCdUMyVHlCcE1ROGtZQnUrQVZyYzlBL3ZUdW9Ec2hyODNKVEln?=
 =?utf-8?B?cGJvdUdYcW1LUFJDYVk4Z0kvb2kxRXR6TzVNL3BFNkxtaFE5ZHRWQm1SSlNk?=
 =?utf-8?B?QWh4MHhrQXBudnBBeXFoSDNNc2cxY2YzRnZlUHZBWkJnWHljVER6aXJIK3ZD?=
 =?utf-8?B?RWpLRzFueGpNc2NyUTcwcS8xNXZuTFE1Zk9ua2hHMDM2MXNRbnpJbFpSMlhi?=
 =?utf-8?B?bUkwT0g2c2pOdzRUdGh0WWkzWVZ4eWhreE9qRVVPcWtIbzZCTlI2RUtMdmdr?=
 =?utf-8?B?VzRZdEtqVXpXR0tvZU1uWDM0UXNlTDZwd0tHb0J1bWlqNE9kYWpGRkhjZVUy?=
 =?utf-8?B?SklQSUpFV1p5VGFmQmE3aEMvS2lhSXRraXlJYnhqOGxoSEVxNWliZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9+/qm1iZs7Z0Ln6Ch9H3tkDNgvzTFSp9rcxXitfdDYV7HmnpERr+EDAYWXNu3HVkNpH2js+ATNKluKhB/W3eF36xURMLSdoIkKgXKuHaxJca9JGSJ59njHKiueDIialFkgeoEmft89rocT0o7Z/SMGbJHITOEqLWWSvP8wfU5+AtYDhKelxXn5mejOJABYLiwHU/VYUGUd/V1r6JGq0DMT7wjzbsdIOpvZtDxrJGbvUcsqh35vPX0RUT6wAvR8S2YUmoNBIO51HyabJ1kPJGsT1DgH6VECat+DIIlLDuW5QRyTRJ3RnN1sXKUyUNSOZhcEbndBCQIMbNu5OsVBID39kjgnD3KiDO+1iLoPgQNBkjv3VHiSaw/7qOUVlfZAeq77J+F5BLSvBWSf6cViw6pnD2D6Tg6YI/rO1Vo1+hDBzIgF3OvnnHm6+TNMK3Nq0AWqV0WcpFNzySiDpo5Olr1XvM2RZnG5M4r3KUWmrpIZ9qHPP5mzqjLeyR2MeFXBASGMAn8a3dzOeRt/+itmeuaXH2V0qBJFA8KIjXfVeQROd1ZaHN0g/E1/BAyU3k7EtuPGc0jaoYNa+qqlXpMw7YIkkfj4C5uk5PIC7TznjH6iA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b016b3-2ef7-4f5f-0158-08de555386b6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 23:03:56.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCBFSWsgbhT249nnrxk/iaOkJ45ISdcjLt0iMnrAcGynKcP2VzbJeayaJQRU1U8VgE0J2FwLUzhcx9Tx0clhXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6417
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160173
X-Authority-Analysis: v=2.4 cv=AJKKJ3lP c=1 sm=1 tr=0 ts=696ac3e3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=9CPj241U2dBcJ7DSbn8A:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3MyBTYWx0ZWRfX/2R0t84bMwmw
 Waq227cy+g7b7/4ygpg0FWCe1U1csjCKq3bqtqpxm5MyHR03Pw60F2MyVXNh0U1+5n/yaBo2KjE
 sY7WSlWyeHFNe9egfoHQC5wsS4wrL7ItzHUKEdM9s1aeAeihYNpRvovlDZsyyxbr+kTwRgnwdxF
 RQ9FCTGw2RmBWNFF9bW4zcsfEficQHn1I5qszzJpnjfnwKtiEUHvqRp3aOWoeXdeGEKgOBkLo9x
 Gm1bHkYcyFovYPK1v6fOagkKnrH7N42wjzsm9hIxzqA0b7svSvlLI97+B/o/XYf+U5dFFx89JC/
 3loFzDOETy9hGUinCE/MmDf6MeUEQor4YF1e+KF4ARZLko64Vjx65/LNOa5MHcGEe/Pp3r+wJgD
 JSg1kVCyCviqWgcdqvFnxaK1X6W119I4XBGLq+Oay7g9bcEtDF9FK1zF/2WfwVvr9dmgZIQVD/c
 +k6HBn9i3poUw73hJZSyMfL6x/fOYFKXXepY16Ks=
X-Proofpoint-ORIG-GUID: iRwMLLHRwlvW_rLVJnE64680rqfvKI0T
X-Proofpoint-GUID: iRwMLLHRwlvW_rLVJnE64680rqfvKI0T

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/16/26 17:47, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dtrace.spec | 96 ++++++++++++++++++++++++++---------------------------
>   1 file changed, 48 insertions(+), 48 deletions(-)
>
> diff --git a/dtrace.spec b/dtrace.spec
> index 4b20dc40..d8c3e9b3 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -588,7 +588,7 @@ systemctl start dtprobed || :
>   * Tue Jul 30 2019 Kris van Hees <kris.van.hees@oracle.com> - 2.0.0-0.1
>   - DTrace implementation based on BPF (initial portions).
>   
> -* Fri Aug 10 2018 - <nick.alcock@oracle.com> - 1.1.0-0.1
> +* Fri Aug 10 2018 Nick Alcock <nick.alcock@oracle.com> - 1.1.0-0.1
>   - Add more DTRACE_PROBE definitions to sdt.h, for SystemTap
>     compatibility, and test them (Tomas Jedlicka) [Orabug: 27721525]
>   - Fix disassembler coredump (Tomas Jedlicka) [Orabug: 28054399]
> @@ -615,19 +615,19 @@ systemctl start dtprobed || :
>     [Orabug: 28142056]
>   - Clean up compiler warnings (Eugene Loh) [Orabug: 27934422, 27998779]
>   
> -* Thu May 10 2018 - <nick.alcock@oracle.com> - 1.0.2-1
> +* Thu May 10 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.2-1
>   - Testsuite fixes [Orabug: 27995907]
>   
> -* Fri Apr 27 2018 - <nick.alcock@oracle.com> - 1.0.1-1
> +* Fri Apr 27 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.1-1
>   - ARM64 USDT and pid probe support (Kris Van Hees) [Orabug: 27847969]
>   - Fix -c option on ARM64 (Kris Van Hees) [Orabug: 27847946]
>   - Disable pid provider tests on UEK4.
>   - Testsuite fixes [Orabug: 27921244, 27919918]
>   
> -* Thu Mar 29 2018 - <tomas.jedlicka@oracle.com> - 1.0.0-10
> +* Thu Mar 29 2018 Tomas Jedlicka <tomas.jedlicka@oracle.com> - 1.0.0-10
>   - Enabled tst.default.d in smoketests.
>   
> -* Tue Mar 27 2018 - <tomas.jedlicka@oracle.com> - 1.0.0-9
> +* Tue Mar 27 2018 Tomas Jedlicka <tomas.jedlicka@oracle.com> - 1.0.0-9
>   - Updated translators to match new kernel redesign of per-task and
>     per-process data. [Orabug: 27731759]
>   - Enhanced build system to support multiple kernels [Orabug: 27731756]
> @@ -635,7 +635,7 @@ systemctl start dtprobed || :
>   - Adjusted the interpretation of /proc/kallmodsyms for aarch64
>     (Eugene Loh) [Orabug: 27214992]
>   
> -* Thu Mar  8 2018 - <nick.alcock@oracle.com> - 1.0.0-8
> +* Thu Mar  8 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-8
>   - Change dtrace_proc_*() public interfaces to take a struct dtrace_proc,
>     avoiding lifecycle issues that can cause access to freed memory when
>     victims are exec()ing rapidly [Orabug: 27501199]
> @@ -651,37 +651,37 @@ systemctl start dtprobed || :
>   - Consider erratically failing tests in some directories to be passes
>   - Test fixes [Orabug: 27583002, 27651838]
>   
> -* Fri Feb 16 2018 - <nick.alcock@oracle.com> - 1.0.0-7
> +* Fri Feb 16 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-7
>   - Internal development release.
>   - Several latent porting bugs fixed (Kris Van Hees)
>   - Make tests used in smoke testsuite rely on sdt less
>     (Kris Van Hees)
>   
> -* Tue Jan 30 2018 - <nick.alcock@oracle.com> - 1.0.0-6
> +* Tue Jan 30 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-6
>   - Internal development release.
>   - ARM64 support [Orabug: 27438960, 27438993, 27438977]
>   - Include correct procfs.h (Tomas Jedlicka) [Orabug: 27266725]
>   
> -* Thu Jan 18 2018 - <nick.alcock@oracle.com> - 1.0.0-5
> +* Thu Jan 18 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-5
>   - Internal development release.
>   - Bring back translators for 4.14.
>   
> -* Fri Jan 12 2018 - <nick.alcock@oracle.com> - 1.0.0-4
> +* Fri Jan 12 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-4
>   - Internal development release.
>   - Eliminate new symbol at address 0 on KPTI-enabled kernels
>     [Orabug: 27364377]
>   - Boost some test timeouts
>   
> -* Fri Jan  5 2018 - <nick.alcock@oracle.com> - 1.0.0-3
> +* Fri Jan  5 2018 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-3
>   - Internal development release.
>   - New tests and test fixes (Kris Van Hees, Nicolas Droux)
>     [Orabug: 27194352, 27282243]
>   
> -* Fri Dec 15 2017 - <nick.alcock@oracle.com> - 1.0.0-2
> +* Fri Dec 15 2017 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-2
>   - Internal development release.
>   - Fix rare assertion failures at exit [Orabug: 26848964]
>   
> -* Thu Nov 30 2017 - <nick.alcock@oracle.com> - 1.0.0-1
> +* Thu Nov 30 2017 Nick Alcock <nick.alcock@oracle.com> - 1.0.0-1
>   - Release for smoketesters, not GA
>   - Fix mod() normalization: add test for it (Tomas Jedlicka, Eugene Loh)
>     [Orabug: 26826564]
> @@ -698,16 +698,16 @@ systemctl start dtprobed || :
>   - New tests for the lockstat provider and fixes to jstack and 3-arg
>     tracemem tests (Eugene Loh, Alan Maguire) [Orabug: 26149894, 27015838]
>   
> -* Mon Oct 16 2017 - <nick.alcock@oracle.com> - 0.6.2-3
> +* Mon Oct 16 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.2-3
>   - Apply correct version of lockstat patch [Orabug: 26149894]
>   
> -* Mon Oct 16 2017 - <nick.alcock@oracle.com> - 0.6.2-2
> +* Mon Oct 16 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.2-2
>   - Add lockstat provider [Orabug: 26149894] (Alan Maguire)
>   - Add missing obsolete of dtrace-modules-provider-headers (Tomas Jedlicka)
>     [Orabug: 26883486]
>   - Add missing testsuite NFS dependency (Tomas Jedlicka) [Orabug: 26860985]
>   
> -* Thu Sep 21 2017 - <nick.alcock@oracle.com> - 0.6.2-1
> +* Thu Sep 21 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.2-1
>   - Internal development release.
>   - Fix segfault at shutdown time if grabbed processes die at
>     precisely the wrong time [Orabug: 26528776]
> @@ -727,14 +727,14 @@ systemctl start dtprobed || :
>   - Testsuite fixes and new tests for inet_*() and lquantize
>     (Eugene Loh, Alan Maguire, Nick Alcock)
>   
> -* Wed Sep 13 2017 - <nick.alcock@oracle.com> - 0.6.1-3
> +* Wed Sep 13 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.1-3
>   - Relicense all of userspace, including the testsuite, to UPL.
>   - Merge NEWS from the modules into NEWS for userspace: there is
>     only one NEWS now.
>   - Test fixes (Tomas Jedlicka, Nick Alcock) [Orabug: 26522961]
>   - make check-quick support, skipping long-running tests
>   
> -* Fri Jul 14 2017 - <tomas.jedlicka@oracle.com> - 0.6.1-2
> +* Fri Jul 14 2017 Tomas Jedlicka <tomas.jedlicka@oracle.com> - 0.6.1-2
>   - Internal development release
>   - Fix name of lowest bucket in dtrace_print_lquantize() (Eugene Loh)
>     [Orabug: 26261502]
> @@ -754,7 +754,7 @@ systemctl start dtprobed || :
>   - dtrace-utils-testsuite now depends on dtrace-devel.
>     (Nick Alcock) [Orabug: 26415697]
>   
> -* Thu May 25 2017 - <nick.alcock@oracle.com> - 0.6.1-1
> +* Thu May 25 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.1-1
>   - Add translators and tests for TCP and UDP (Alan Maguire)
>     [Orabug: 25815242]
>   - Add translators for the IO provider (Nicolas Droux) [Orabug: 25816562]
> @@ -764,15 +764,15 @@ systemctl start dtprobed || :
>   - Repeated dtrace -G no longer corrupts the object file (Kris Van Hees)
>     [Orabug: 22509887]
>   
> -* Tue Mar 21 2017 - <nick.alcock@oracle.com> - 0.6.0-3
> +* Tue Mar 21 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.0-3
>   - Test fixes
>   
> -* Fri Mar  3 2017 - <nick.alcock@oracle.com> - 0.6.0-2
> +* Fri Mar  3 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.0-2
>   - Internal development release
>   - Add translator for ip provider [Orabug: 25557249]
>   - Test fixes and new tests.
>   
> -* Tue Jan 17 2017 - <nick.alcock@oracle.com> - 0.6.0-1
> +* Tue Jan 17 2017 Nick Alcock <nick.alcock@oracle.com> - 0.6.0-1
>   - Internal development release
>   - Allow self-grabs [Orabug: 24829169]
>   - Use /proc/pid/map_files if available [Orabug: 24843582]
> @@ -780,22 +780,22 @@ systemctl start dtprobed || :
>   - Add improved multi-argument DTRACE_PROBE macro [Orabug: 24678905]
>   - Fix infloops in SPARC breakpoint handling [Orabug: 24454127]
>   
> -* Tue Nov  8 2016 - <nick.alcock@oracle.com> - 0.5.4-1
> +* Tue Nov  8 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.4-1
>   - Work around elfutils bug causing object file corruption [Orabug: 25059329]
>   
> -* Wed Jul 20 2016 - <nick.alcock@oracle.com> - 0.5.3-2
> +* Wed Jul 20 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.3-2
>   - New tests
>   
> -* Thu Apr 28 2016 - <nick.alcock@oracle.com> - 0.5.3-1
> +* Thu Apr 28 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.3-1
>   - Prevent intermittent assertion failures crashes and hangs when
>     shutdown races with termination of a grabbed process [Orabug: 22824594]
>     [Orabug: 23028026]
>   
> -* Fri Feb  5 2016 - <nick.alcock@oracle.com> - 0.5.2-2
> +* Fri Feb  5 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.2-2
>   - Fix uregs array on SPARC [Orabug: 22602756]
>   - Testsuite fixes
>   
> -* Tue Jan 12 2016 - <nick.alcock@oracle.com> - 0.5.2-1
> +* Tue Jan 12 2016 Nick Alcock <nick.alcock@oracle.com> - 0.5.2-1
>   - Do not crash USDT probe users when shared libraries are in the upper half of
>     the address space [Orabug: 22384028]
>   - Do not waste CPU time busywaiting in a do-nothing ioctl()-heavy loop
> @@ -805,39 +805,39 @@ systemctl start dtprobed || :
>     [Orabug: 22390414]
>   - Fix smoketests on SPARC [Orabug: 22533468]
>   
> -* Tue Dec  8 2015 - <nick.alcock@oracle.com> - 0.5.1-4
> +* Tue Dec  8 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-4
>   - Internal development release.
>   - Prevent testsuite hangs when per-arch options are in use [Orabug: 22030161]
>   
> -* Thu Nov 19 2015 - <nick.alcock@oracle.com> - 0.5.1-3
> +* Thu Nov 19 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-3
>   - Fix buggy performance improvements to correctly detect out-of-tree modules
>     (like dtrace.ko) and speed them up some more [Orabug: 22237449]
>     [Orabug: 22238204]
>   
> -* Wed Nov 18 2015 - <nick.alcock@oracle.com> - 0.5.1-2
> +* Wed Nov 18 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-2
>   - Internal development release.
>   - Remove typoed non-bug from rpm changelog.
>   
> -* Wed Nov 18 2015 - <nick.alcock@oracle.com> - 0.5.1-1
> +* Wed Nov 18 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.1-1
>   - Internal development release.
>   - Improve startup performance when disk cache is cold [Orabug: 22185787]
>     [Orabug: 22185763] [Orabug: 22083846]
>   - Fix various problems in the testsuite and in DTRACE_DEBUG output
>     [Orabug: 21431540] [Orabug: 22170799]
>   
> -* Wed Nov  4 2015 - <nick.alcock@oracle.com> - 0.5.0-4
> +* Wed Nov  4 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-4
>   - Improve identification of system daemons that must not be ptraced
>     unless explicitly specified [Orabug: 21914902]
>   - Improve symbol resolution in the absence of ptrace() [Orabug: 22106441]
>   - Fix dtrace -p with an invalid PID [Orabug: 21974221]
>   - Close any inherited fds before running testsuite [Orabug: 21914934]
>   
> -* Wed Sep 23 2015 - <nick.alcock@oracle.com> - 0.5.0-3
> +* Wed Sep 23 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-3
>   - Internal development release
>   - No longer reference UEK3 kernels on SPARC.
>   - Do not require 32-bit glibc on SPARC.
>   
> -* Wed Sep  9 2015 - <nick.alcock@oracle.com> - 0.5.0-2
> +* Wed Sep  9 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-2
>   - Internal development release
>   - No longer Provide: an unversioned dtrace-utils [Orabug: 21622263]
>   - Add missing testsuite package deps [Orabug: 21663841] [Orabug: 21753123]
> @@ -845,29 +845,29 @@ systemctl start dtprobed || :
>   - Test logfiles should not be affected by the verbosity of the test run
>     [Orabug: 21769905]
>   
> -* Wed Aug 12 2015 - <nick.alcock@oracle.com> - 0.5.0-1
> +* Wed Aug 12 2015 Nick Alcock <nick.alcock@oracle.com> - 0.5.0-1
>   - Internal development release
>   - SPARC64 support. [Orabug: 19005071]
>   - Translator support for 4.1 kernel.
>   
> -* Tue Jun 30 2015 - <nick.alcock@oracle.com> - 0.4.6-4
> +* Tue Jun 30 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-4
>   - Add DTrace release and SCM version info via dtrace -Vv [Orabug: 21351062]
>   - Add source-tree-independent testsuite RPM (not distributed)
>   - Fix the testsuite module-loading pre-checks to actually work
>     [Orabug: 21344988]
>   - Various build system fixes
>   
> -* Tue Jun 23 2015 - <nick.alcock@oracle.com> - 0.4.6-3
> +* Tue Jun 23 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-3
>   - Internal development release
>   - Fix deadlocks and failures to latch processes for symbol lookup caused
>     by failure to correctly track their state over time, in 0.4.6-1+ only.
>   
> -* Mon Jun 22 2015 - <nick.alcock@oracle.com> - 0.4.6-2
> +* Mon Jun 22 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-2
>   - Internal development release
>   - Fix a rare race causing stalls of fork()ed children of traced processes
>     under load, in 0.4.6-1 only [Orabug: 21284447]
>   
> -* Thu Jun 18 2015 - <nick.alcock@oracle.com> - 0.4.6-1
> +* Thu Jun 18 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.6-1
>   - Internal development release
>   - Support multiple kernels with a single userspace tree, loading system
>     D libraries from directories named like /usr/lib64/dtrace/3.8.
> @@ -882,14 +882,14 @@ systemctl start dtprobed || :
>     being monitored is unchanged since it was last inspected. [Orabug: 21279300]
>   - Properly remove breakpoints from fork()ed children. [Orabug: 21279300]
>   
> -* Mon Feb 16 2015 - <nick.alcock@oracle.com> - 0.4.5-3
> +* Mon Feb 16 2015 Nick Alcock <nick.alcock@oracle.com> - 0.4.5-3
>   - The dependencies are adjusted to pick up the renamed dtrace headers package.
>     [Orabug: 20508087]
>   
> -* Tue Nov 18 2014 - <nick.alcock@oracle.com> - 0.4.5-2
> +* Tue Nov 18 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.5-2
>   - A number of crashes when out of memory are fixed. [Orabug: 20014606]
>   
> -* Thu Oct 23 2014 - <nick.alcock@oracle.com> - 0.4.5-1
> +* Thu Oct 23 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.5-1
>   - Automatically load provider modules from /etc/dtrace-modules, if present
>     [Orabug: 19821254]
>   - Fix intermittent crash on failure of initial grabs or creations of processes
> @@ -903,15 +903,15 @@ systemctl start dtprobed || :
>     [Orabug: 19882050]
>   - Fix DIF subr names in dtrace -S output [Orabug: 19881997]
>   
> -* Tue Jul 22 2014 - <nick.alcock@oracle.com> - 0.4.4-2
> +* Tue Jul 22 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.4-2
>   - Ensure that the DOF ELF object does not require execstack
>     (Kris Van Hees) [Orabug: 19217436]
>   
> -* Tue Jul  8 2014 - <nick.alcock@oracle.com> - 0.4.4-1
> +* Tue Jul  8 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.4-1
>   - New -xcppargs option as part of fixes for the testsuite on OL7
>     [Orabug: 19054052]
>   
> -* Tue May 13 2014 - <nick.alcock@oracle.com> - 0.4.3-1
> +* Tue May 13 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.3-1
>   - Fix array underrun when no textual mapping for the executable can be found
>     [Orabug: 18550863]
>   - Fix unlikely buffer overrun at process-map-read time [Orabug: 18550863]
> @@ -920,13 +920,13 @@ systemctl start dtprobed || :
>   - Fix error-path dereference of uninitialized variable in error message
>     [Orabug: 18550863]
>   
> -* Thu May  1 2014 - <nick.alcock@oracle.com> - 0.4.2-2
> +* Thu May  1 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.2-2
>   - Interrupting dtrace with a SIGINT while monitored processes are dying no
>     longer hangs dtrace on a condition variable [Orabug: 18689795]
>   - Symbol lookups on processes that died at the same instant now always fail
>     and no longer access freed memory [Orabug: 18550863]
>   
> -* Wed Apr 16 2014 - <nick.alcock@oracle.com> - 0.4.2-1
> +* Wed Apr 16 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.2-1
>   - killing dtrace while a ustack() is in progress no longer risks killing
>     crucial system daemons [Orabug: 18600515]
>   - Fix a leak of filehandles to executables [Orabug: 18600594]
> @@ -936,7 +936,7 @@ systemctl start dtprobed || :
>     [Orabug: 18603463]
>   - Fixes for newer versions of make, ld, and bison [Orabug: 18551552]
>   
> -* Tue Jan  7 2014 - <nick.alcock@oracle.com> - 0.4.1-1
> +* Tue Jan  7 2014 Nick Alcock <nick.alcock@oracle.com> - 0.4.1-1
>   - Install showUSDT in docdir. (Kris van Hees) [Orabug: 17968414]
>   - Install ctf_module_dump. [Orabug: 17968381]
>   - A lexer bug was fixed causing spurious errors if D scripts contained a
