Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B30350A2E
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771524772; cv=fail; b=Afp4bC6RLjwlNIXjQiaZp6rL+ZVrSFghScBBcRrumKUFCbqjKi/VwL6V5S485WZOWuHB42cp0Oy6mpPm8edF5R9Ukje6mmN/a3Ba9Wdk5YXz+REbDlShythp+OFMPL9Sqq7v7xf3/M40Cpjfdm8+V5v2DII8TGrEohAGlHswYD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771524772; c=relaxed/simple;
	bh=P9Jnha5IN5zH2n/xcNzXxuO+Nwj7kJMoxIsp12+LsEo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XyBpYLChSE4zpkOzTGw36deesU2dUjZT2WLlX6iJZSgx4d/rofaHicNPNjXAORgyPgFR9AIRryzNNBqIvfZbXEAaCMPsoEqAPZcSijBVuIX/P2jikffdkxlWQIX9mfIs0+vc1UZNlBs3SvVnllHoJ0EpcYF1lN4z6l4BxULagfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HAjq5tty; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YuDAZWmA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HAjq5tty";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YuDAZWmA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JGwsbM495371
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zkfsSbOz4zm1uMK/PIaHx6FSyFt/UoRLVLXCcVYca7E=; b=
	HAjq5ttywCDhB8QKXbdd8UNxgm39/p4T7e/v5qlstnMZGEOfWj5awk0qdUqTVntW
	j59QJxgKpPVhAPquBAEZx02VCZQs1Usy4IFC/l8eU2OfY/ANzM5GiNTQXQf9k07Y
	EsL73O0AWqdWBnQs+A7Iwm+xJF7nflcTY2aCd0HJN7wphYQKpHnOkT/HIpPciofe
	yB09D6Mm8+gZHQj2CYMIzcxXzRCBgnKay2kUYgcyYavwUJHgaUckPSEJMY3zMr71
	uH0hdsgZDEwteNXID+s139tmPytmjI0PQb/zKvKm26naWJg+/pqNCrh8v9GZi0cT
	DZ8DdABilBI08z+Bdae8RQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj6mfvus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:12:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JI9c4C022943
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:12:43 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2f974e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 18:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2rFz6kn/KmRryAyPFahhEwRtlDkxGdSJ5gA6Vtc9o/05+dH4hP0C2zF8QXuNOZa7ZPmqe2w1B38UIpxwaYKMZP0i8wwhfHf/lbku0GNqTgDle7LvnpJLwhLnokHYFwjmLQw2wy5O7iwrsQjc6jg6/YjbbMLZMysZ+YvoJojKHmkzEM+YZiE21h8RdRyiXaoUnAcj1Al07DP02rKufJhssGccJywl3DCKxu9uYA0akQPzIf3T3saCAWjfxTiwr27qxA7vYnYNcZJbIyEC4meqChb5Re2S3TSl4TVI+n/yDtNTfvqUYiVnGZmCxshWWK6ELjTG1LN2wzP3py7YvIuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkfsSbOz4zm1uMK/PIaHx6FSyFt/UoRLVLXCcVYca7E=;
 b=VC/MewhyeFNKSXTI4TpYBxw99gS+pU1xYjSVJLOB86Rdfk6Ye7P9GI2OeGgERw8UcAyOBRT28Wr7b3r4yKSjfGHUY+/ZVldwVY3+r8ZDODtYb6OGJ3AYjMlGHXR2Cac152oiPdigjxITiWofEMTokN6mK6IojDk2sjyEMDL7oMZ7/2NpOBz8WT0Zd6PlXE4DOk/jZsYoP/G4NJWYoyKeMXYs4JDhO5oM58NUcfEnky8/24oKCiiDhKCzlPo8NsEwtlGAOw59u+aRarXac2GkaZGqRz8p83GCFa6kzUN4tukFhO3Ou5u7I/O0fVsfEKtlAfyc9nSKv7BaAHkHllT4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkfsSbOz4zm1uMK/PIaHx6FSyFt/UoRLVLXCcVYca7E=;
 b=YuDAZWmAR8M77T1Um8mzaoMN19FMRNPYcn54XxgmWV72gDApgZH9gAMIQJlLINfVyT28q4gt8OglslYU0Tf8DQHqXY1+XztlHCC0xRLrjjFsyoeIaj4qc5dXue5JcvEBYFU/P3hKgay/4P5Rtt3a0o/BOjIrfmHCI0eYQbtlnv8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7408.namprd10.prod.outlook.com (2603:10b6:8:15d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 18:12:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:12:37 +0000
Message-ID: <8b6c077b-8d29-ea29-e400-5de72ec894b0@oracle.com>
Date: Thu, 19 Feb 2026 13:12:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] usdt: enforce provider name size limit
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522E8B33F4324C52F522B90C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522E8B33F4324C52F522B90C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: f05e4859-1181-4ed0-624a-08de6fe27623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZoSEdveW5pU1BPdFE3ZFp2dWRZQXJjbTQyUGNqdE9TT3p0TzlpY1N5d0ZJ?=
 =?utf-8?B?RFBGMU8wRk4vMXQ5T05oeER0eFQwdGx3bjN1c283Y2RXOCsveWdJWk9oUGNm?=
 =?utf-8?B?L2phTTllWGJuOGUxcXpqYkppaUlodzYwTGVCblJ1M1JMV3h4S2h5Z1pGQjBK?=
 =?utf-8?B?K0NpcGMwWEVuNk1MZVcrZno1c2FwcjYvKzlHM3AyN0lnVXBMdWVxUUlwY3Bs?=
 =?utf-8?B?NmJ2cjZzY3AwZ0tFck9MR2R2WldnWW03NkppUSt6U2hBMnd3MWNSN3JDMUdM?=
 =?utf-8?B?MXg4Z1FFK1VybGM3N2lzUHdXMFM3amo0ZEZVVDFaVmVORHZLZVRYSHhuYTZV?=
 =?utf-8?B?VmlBN3ExTEI4WXlqaWdJTERjKzNISVUzVkxsZlMzWkRhdXdObzBQSVdKdnlt?=
 =?utf-8?B?ZHdQM0JCZWdwN0liRFkwWEFDVzNFUXI3NlpnMDg3aTBtbjNPSXhkNndBQjhI?=
 =?utf-8?B?MkJzbG5DdGNFbGFDRTgrbDdxL1RIcnozMFpld0RYOHZEZUE4QnNDakJGaHJx?=
 =?utf-8?B?emtqcnBrdXQ5VjRwVXFkNVpXc1JOQll6WnNiZHBFeDB1OEdDYmQ2WGN5OGRP?=
 =?utf-8?B?MDJBRHl6WXY0TUVubmdGVWZpaGVvYUV3ZHNXRnY3YmttU0FFNEpFWCtRZTNn?=
 =?utf-8?B?VmpnOE0waExSV011WWkxaHgxQ1IrNlNxZHFCZzYvRXVRMDQwOG85WnJsRi9T?=
 =?utf-8?B?enJ5dDBadjQwam5ITkI3ZHRLWXFHZTBYcTg2emE0OUI1SXI0ZmlFbTNBUzhy?=
 =?utf-8?B?NVEvUUFCOHd0cGpYeHVMdzloamxBa1VJOStoOExTUGxOZnhCdmdnc2YrcVJ4?=
 =?utf-8?B?cFVSSjRzK3dydUU2M3huTHRBM0VkZVYxZGNISnJOeU8wMmUrK2FxenlySHlM?=
 =?utf-8?B?M0tNSzB6Zm0rb1A3eFBpMFdDYUEyR0c3bjhLWStjTWxJWnJ0RFhNTzlaYW1F?=
 =?utf-8?B?d1hxdzlJM1ltT2RqK2l2SDZsYkpyUFE2RjJRcWVwRHc4cUdHMWh1cGRtRjNJ?=
 =?utf-8?B?ZTBLNHAyVWtWREYveWovYVIrbGRmOHd5aWsvY3YrYTdpWDhqOHVtVTIrczVM?=
 =?utf-8?B?S0RseUN0dCtzalVwbGpJUjVPcVJudllOa2FWK21nM2lNYmxYcDRWaGdURDFP?=
 =?utf-8?B?YXllRzZ3YlJXNEFGa1c2bkdhTFo3Z2FnY05BU3REd1JnQkVoQ3NQdkFYbWx3?=
 =?utf-8?B?aGNYa2dmblBlMlozL0RXeXFqZTMrQjBQbnVTSjd6ZFhCUUU2TG9QTUdMZ2Js?=
 =?utf-8?B?cVR4ZzN1MG9abElCZmV2Y0NDUGt1V0hqekJaNEVHU0hUTTBBdjBScDZJR2VV?=
 =?utf-8?B?UmprSXVWdEpVb1ZaY2hzZVpHcG1EWDZRajRLVGN4eTdtMXNTbVNwMVNpaHd3?=
 =?utf-8?B?a3B0YStuZEt2bG9VNVpkQkZxVUJhc2JUZ2x6aDFnblM5M3JMMHg1SHBzajFi?=
 =?utf-8?B?MzRWaks5SkExOWMyNGlHakdhZmNJVlN5c1ZHUU1ock5pRXhDdjhjdzhTbWdw?=
 =?utf-8?B?Y3h3SkVwOFZ2VW1nS3pkS3VEUisxTUROZHJnWDZ6LzJRcVhIeDNMWjhFWHVo?=
 =?utf-8?B?cmFCRTBGK0F0ZDIzWXdoWVZVUlludzRoQWxKa1RVTVpHVVZjeDRiY3JRVDBG?=
 =?utf-8?B?WUpXb2V4QnlFb2l4Q29SOExxT3ZRb1VlZ0h3eVhRNlkwTmk3ZnE5RlZWSzNa?=
 =?utf-8?B?ZVk0YWoxRFdWcDdVT2VCN2hTOVFrRnN0SStHNllRQlc2Ujkxc0wvOEVpUXA0?=
 =?utf-8?B?eW83aDloNWFELytGUjNIUnZHU0FzUzRlK05RSG9YTk8vSUFubXFzM2k4NmdR?=
 =?utf-8?B?RDhSbTR1R2hkb3E2RE5oYU5qT0xjVTVvWitVQ1c1OStaSVFIYVdnNng5SlEw?=
 =?utf-8?B?Wmg1T2E1MGMxMWRNeTNPajNWOHFEZjJXZi9RSFg1Z25FSFBHMnMwb2J5OHNq?=
 =?utf-8?B?YjdkNlJDNTRMdW1ReXY4VjZBMWNkbGhlSEFNbGxiQ1FPTUl3b1BRRzd2cWM0?=
 =?utf-8?B?M0MxV1JkbGxtVmJRM1RoeG1pOWZPbHJyVGR2ZWZQamdzVUM3VFBudUJiVTc1?=
 =?utf-8?B?SlgxU3FMb0doWjJYbGVWZElvMFo3SW9WUXdSV2VEbTlTblpuZE1PV1dxaWlw?=
 =?utf-8?Q?ZRyU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFQxRUZYZ2o2b1g3eUZIT0k5c2RvbngrUUdYd3hnTVNieWRpSDVycDVhdzk4?=
 =?utf-8?B?L3BvYTdBRXovSFBOZ1htN01XZHhVaFFhNlpsazZVUURNbDhEVVk3RHR4M084?=
 =?utf-8?B?eXVGQytpRUhOd1lZTmxNd1hJZXJ5WWhqeG9nWG5jUGpHV0I4VktSNVF3R2dx?=
 =?utf-8?B?MUZNSUx4RitiV1ZwUXVUV1JFQlhjYUFjZ3B3QzUxdkZjZnN0TTB0NlgwdDd6?=
 =?utf-8?B?dDlCc3Y2TzAzNnkzSDNZcFIvMU40WWkzcjErUnY5REM4OVp3akR6LytEc2tw?=
 =?utf-8?B?RVl4UmpaMUpyQm40Y1o4MGxMbUtyMmRWaEhId2FaeFB2VmwwbThvV2xKVElS?=
 =?utf-8?B?WU9wa2s4eDlrNm12Q3M1SzVaQmNFT3lSeFEyaWNJNzE3RHAwMHpRRzJZdXgw?=
 =?utf-8?B?NUcwVmp1b2JHOGlJUDlVZGo3SmROekdhbmloSlJPeXFjazJRT2NvcDl2RHZY?=
 =?utf-8?B?RFRrb1ZwSTJ1T2EyL1BVbVZOMnRzbmlWOE0yYkg1cnlySCthOFA3eTJEaHRZ?=
 =?utf-8?B?WmNpb0VKMnpBcWlPUElqSGZWUkVuS2cyV1JhRStZZlNRc05uS05DdEw3V09U?=
 =?utf-8?B?eVFHNDlHTlVKUVBQckVSNG5mUFhIMlVXUlVYK3NnNHFMZHplL2hLM29DTmVq?=
 =?utf-8?B?ekRxTitjdXFEa2hvcWJoMVBBUktSVHB2aTlyK3NVWUxxeFZYM0lieTdmVXlQ?=
 =?utf-8?B?c0pFWEh5MWxQckFqaExoUTJnZUVBTUwzckVxSUNYM0MvemJydjlVcUhQMWdr?=
 =?utf-8?B?YnpZTDYzMEtoRWJtclFUanZjNUgxQmJoTmNJaVJ1Q3Z0TXRCb2NVVmJxaGhm?=
 =?utf-8?B?dUFOckxiQ1Y3UG1YTkY3VEVCRnRweThjK0pqU3hCN3lUK1N0RlFzWWU2TnVX?=
 =?utf-8?B?WVNHSHE5RDVEUnpZTURaamYxZ1J2SURJVnE3RmZhY1pWSExoSml0dEIrTWNo?=
 =?utf-8?B?SXJ4YkUrMDNpWWRvQmdsYU5oZ3h6MDI0ZUJRakJkTnIyS1JVUTVQQjd4S3pp?=
 =?utf-8?B?eHpJWnJrZ2sxc0M0Z211Qnh5RzVDUVlGdlpLREUvK2ZyTlBRblgyb1VueTJD?=
 =?utf-8?B?bDhpbUZMdUlLcGFMbEYvMUlSZE83RnoxZnllN2hseGduWnQ3Nk1mS1JNL2M2?=
 =?utf-8?B?K0ppVm83anhnQ1JCZmpGRWErS2NyWTk2Qm5tajhKZDJqdlI2ZkhoRUY4KzBF?=
 =?utf-8?B?RFg0KzlWNDZXd3hUR3FiQVVUN3ovUlUzZm05K0JsY2FGNHVXeVp5emNhSkNQ?=
 =?utf-8?B?cm1hbVQ0ajB0MWZTV3Q5YlhPczJqVzVLQUtLY0RPSDYzQkxoYlFNbGE4a3ly?=
 =?utf-8?B?NkUwU1ZIMFhxcURWbTBwNklrSHJYNzVmR2Z0Z1JCMCtrNGdENTNnY3d1dlk4?=
 =?utf-8?B?Q1YzaFdpSWJkVlhCaTJyT1VWZ0V4WndLSzg3bGVtSlpOUEhXMnVNbXQ4RFRI?=
 =?utf-8?B?TVNONUh0YmUzd3N3dGN6RHg2eVpaKzkwUzU2ZnFvdUl5NjBrMlRPeUlIZTNO?=
 =?utf-8?B?OWlSb0k0TGJCKytIM08yN2tFcDJDSFVydnlQYnFSMGJUOXdNTHp4UWlRYnRa?=
 =?utf-8?B?V3pLUElZZUN1Z2lER2VRb055V0dMRWlBS0JsNzBESG1MT1U2dmhKOFNybm4x?=
 =?utf-8?B?S2ZlL0syWEM3UWl1amE2c0JpWnhvZ1ZvSmljKzRSSGx1YWJWMEZ2ZU1TZlVl?=
 =?utf-8?B?aUl1eHVsSHJrZStLMVpGMUdTT2krTU5vaE1vMTV5WG5TWWVpT2g1aUtORXVS?=
 =?utf-8?B?bkdyVVFQMjFTWW00VVl0UDJoSVBOVks2dzNkVWJmZEZORHl5S2sxUUdUTHd1?=
 =?utf-8?B?WWpWQjdqMHRQbDZzR1RJOW8reXFZa25nQ1JRSHRDTDRRSFhHMGhJZXRUY095?=
 =?utf-8?B?K2hJZGNJbzRNQjZpQjY2b2pKbWJDUnZOd1pJaXNHdE5ZT0o0czJBb0hPNndB?=
 =?utf-8?B?ai9ENkd0YVFyRFI2YXJRT2d4TkVoRy9oTFNPQk52T3BQcEZhNitCZDlHYkIx?=
 =?utf-8?B?UHlNRm56Y3lFKzhabkRVM2NpM1h1TFY2T0dtRHJaT05yMGtybk1pZlMyY0c2?=
 =?utf-8?B?NVAwMEQxMjRpWFhZUlc3SjM5RHVSRGFXTktCaXRScTVnUUJqZFZrNUd5aG9w?=
 =?utf-8?B?WkJkLzJmYmZBeDVacnVvbnVOMGJER1VONG13NjZpa1B2LytJcGhnL3krS012?=
 =?utf-8?B?ODlnamdOTWhwSEd5QVMxS2V1WGRDV093dG9OSTF0ckd3LzJ1S1BybXAzVzZv?=
 =?utf-8?B?dzQ3ZGxOeE5hODY3UVRFWXRyc2EzdkFJeGxpczhqanVGalFlaFVCWDNRMVd5?=
 =?utf-8?B?dmNnVjlNMXBtTXpuMjc0UVhvWklHR1Mxb3VXaWcwN1NFV2Z6bUlpUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nBLqn4uXLynfdurj760eRnOIqfGZgaIAuTAq9LGOpOmclgewsQpHoOOhrkMXBai8i5It/q5tSB3IiTT8W/uKpqpBygTzs3UzG2B3V2Njm63PLClOYsL+CQwsB2y6X9X3uaaj7gqPQUBeTDA3x9eX3NIVlds6gkfvjfB7zppCdoJpLAV2fBRupHv9ln9bI2++DjrMi5SyFiidMp9t32JUtm8+7Hvcs6ntzRZoHzKp+XXmpN/Mz9Tkvygh1Ebf9skTVJHkJ/uTaL+l/l5QduU2wjqUimxehxXW5ZvlBQAkiqD7lU8UyECYv9UlLtVXZSsA7QKnHld1iX10774/9X/uF8xg3UU4s8L3mNFkpxfIXsfl5xMh9GD1q6k0hjGSePXHhVvTIctpd61D1Yb3dF0EIcUVpNjQnJ2GZe88L178bOAQGYT5wZu2PW3qpE9/pkWKJuWJdmwyJ1R/0wYGIqTqEklYh+MXKX2nKMQ4q+hzWH/DJSmZ3+T3z1a7zAyCLB2UP1HZoMWAbuGWv5QirdSVXZMnKBUMd7WdBaSWwDuWUiOOzkoOOm8HiPjufvWnYcjmcP5LbRp0Df2npIu8xZ8tbmAgalwA6SHyu/GF1hBgUFA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05e4859-1181-4ed0-624a-08de6fe27623
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:12:37.0117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTJ53KYl+OjUc51P2I0dG9GoiL9gzks0v+IAfzPM6zFNFu5nAKBJ5Y3w+mgiw+BcYiQqMJItRxyqLdxCVufJMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7408
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190164
X-Proofpoint-GUID: Oc2JikCQBQ3ngde5y5adC8TZS3m24JOm
X-Proofpoint-ORIG-GUID: Oc2JikCQBQ3ngde5y5adC8TZS3m24JOm
X-Authority-Analysis: v=2.4 cv=JO82csKb c=1 sm=1 tr=0 ts=6997529b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=fHb_Z_Y7H0Io_TG1UcgA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12264
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE2NCBTYWx0ZWRfX3twHp5LxfTbJ
 rxi8y4NSp7oQ3gI9En/N1RvEyRy3mrxIh/LkPSwYDjcPM+8gI9HTIyqDHFgXm7Wp5oZMN+YypfK
 SQz+xS3fYVetDIvXEMThJYGAapeNlk+dUOEXjsSsf2L8pNf+Svxa23ShsWLRE3HkSZUqHXl9afK
 Pd0CML4eHPspSU76Ata510PF1ddNRYqt9oOy93Iaqbccbbyuf/ss6WkbK/z4Fiukv89CHvqnm5Q
 9inDSK0nAquNdbP2o2i5EGyCOBNL/8/35LYdPNdMfJuh8TwJlPRwiv5fXVnyTjSUxzrwpAp5zcV
 XOWHwR0uNnm1N7qtOtZI+si8m+angyMBjN+8rz/KeaW71lr/7jplA4/hRVqzHGnXmiuPxgIIj2Q
 40BxZ/YRr+NyJRnQlFN5KSYcH7BbX3wG7WvzqECRPLhm1MOMfPJ3QVWtZYJUvXaly/R3CnBmdiB
 9VQ6Ge8yofmtgXwkUDtGTwO/5ANthO5Ig536jRQQ=

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/19/26 10:55, Kris Van Hees via DTrace-devel wrote:
> Since USDT provider names have a PID appended to them, the base provider
> name cannot be longer than 53 characters (PID can take up to 10 chars).
>
> This patch also fixes error reporting for linker errors.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_link.c                     | 24 ++++++++++++---
>   test/unittest/usdt/err.prov-too-long.r  |  3 ++
>   test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
>   3 files changed, 63 insertions(+), 5 deletions(-)
>   create mode 100644 test/unittest/usdt/err.prov-too-long.r
>   create mode 100755 test/unittest/usdt/err.prov-too-long.sh
>
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index ffa16d9a..6d733881 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt, dt_provider_t *pvp)
>   	usdt->base = ALIGN(usdt->base + usdt->size, 4);
>   	usdt->size = 0;
>   
> +	/* Ensure there is enough space in the provider name for the PID. */
>   	len = strlen(pvp->desc.dtvd_name);
> +	if (len > DTRACE_PROVNAMELEN - 11)
> +		return dt_link_error(usdt->dtp, NULL, -1,
> +				     "USDT provider name may not exceed %d "
> +				     "characters: %s\n",
> +				     DTRACE_PROVNAMELEN - 11,
> +				     pvp->desc.dtvd_name);
> +
>   	sz = PROV_NOTE_HEADSZ +
>   	     ALIGN(len + 1, 4) +	/* provider name */
>   	     6 * sizeof(uint32_t);	/* stability attributes */
> @@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
>   	shdr->sh_addralign = sizeof(char);
>   
>   	/* Add the provider definitions. */
> -	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
> -		note_add_provider(usdt, pvp);
> +	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> +		if (note_add_provider(usdt, pvp) == -1)
> +			goto fail;
> +	}
>   
>   	if (!(flags & DTRACE_D_STRIP)) {
> -		note_add_version(usdt);
> -		note_add_utsname(usdt);
> +		if (note_add_version(usdt) == -1)
> +			goto fail;
> +		if (note_add_utsname(usdt) == -1)
> +			goto fail;
>   	}
>   
>   	dt_free(dtp, usdt);
> @@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>   	if (!dtp->dt_lazyload)
>   		unlink(file);
>   
> -	create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> +	ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> +	if (ret == -1)
> +		goto done;
>   
>   	if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
>   		return dt_link_error(dtp, NULL, -1,
> diff --git a/test/unittest/usdt/err.prov-too-long.r b/test/unittest/usdt/err.prov-too-long.r
> new file mode 100644
> index 00000000..1305f434
> --- /dev/null
> +++ b/test/unittest/usdt/err.prov-too-long.r
> @@ -0,0 +1,3 @@
> +-- @@stderr --
> +dtrace: failed to link script prov: USDT provider name may not exceed 53 characters: test_12345678901234567890123456789012345678901234_prov
> +failed to create DOF
> diff --git a/test/unittest/usdt/err.prov-too-long.sh b/test/unittest/usdt/err.prov-too-long.sh
> new file mode 100755
> index 00000000..599e461e
> --- /dev/null
> +++ b/test/unittest/usdt/err.prov-too-long.sh
> @@ -0,0 +1,41 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +# Ensure that provider names longer than 53 chars are rejected at link time.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > prov.d <<EOF
> +/* Provider name is 53 chars long */
> +provider test_1234567890123456789012345678901234567890123_prov {
> +	probe go();
> +};
> +/* Provider name is 54 chars long */
> +provider test_12345678901234567890123456789012345678901234_prov {
> +	probe go();
> +};
> +EOF
> +
> +$dtrace $dt_flags -G -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +
> +echo "DOF creation should have failed" >& 2
> +exit 0
