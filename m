Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A784FDB
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714408970; cv=fail; b=JPImlrfkKoGqsXk9MrUAllYxVAOEQOvnDVBt13VEsrT+RlJOcbp6qPV8n3rs/vXqwdSL3k3XYEhhKiuovWK3L1W4q5C19Nxq7d6HX8JmKsg46HpeVk3r5CzuOTzGbHTFUdjUpmHaR2IALtxsu7NAyjUKcOR2pdf2Gw2NLTvAvQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714408970; c=relaxed/simple;
	bh=h+PsGvA1WrBruByjXDBgLcX5r6FLDyAsybAN2QO24k4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c6LK3zamsdbYPp8L/dbulBG0SWhLnyBIR0sQ0wZGgZksebOhNKNtHj9uPRj0t6TYsMKIi69LYLinGAu/4p1Rna4lmapyar/41j+yNo3LIJTIEuU2U2sCeLkvMDl3+helUDMib5fN+ScBaEu0TrPuUZrf/zpYsOAUZUyTotZgetw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SP1XfbiL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hcC5ADDz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SP1XfbiL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hcC5ADDz"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TFnZ5N028127
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 16:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=BW7dzvf6k3jhGUxsPMH1ZehKsEvFbOSS/Kbql8Pbof4=;
 b=SP1XfbiLp42x+hP32Ab/aFbugvXYaFUUW5KwvyYvBFOvUBjOLtnFQomiRSyoD3rSFihO
 30JKIK6BP9QPgqOVsCBTs7w91LH+By/KlqqEb5j/IBWafQVJnVmfmbViz0T4MZkzEL5p
 TgSPO9IqCVVRtezCSjqCKRGEQLitBdBVG05Zmg87RExaT5RiUa69m8yWOH78r1dDd0eD
 e2hJYVw0htnjH/9awyw2dWFubMf9kjiizAccyPTyOzc1amzWBZqh+2ZmnWqNwVxnAN3n
 q6AulKUkYKi6noj1qcPvClP3kOZFSGQ9VWfSKQGdOasPYetlfQoYraTzT4Tkq9q4jKh5 pg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrswvk2cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 16:42:47 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43TG4N28011469
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 16:42:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt6mfhm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 16:42:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBDF77UDRyeiX+UwanktB2QPLA39kEv+Vtgr+ni8/JLBV4457qEtGAaBpJDnwgI18Fipioc1jquJpNApO2vcMguzDAvYDUGS//Q8SPLhucDv+Aol5GRPzGH4cp3TEJYqhgKOlmhWCVkm1Q/ufk+rNQX1VmQm4Y0rBJcicAH4oy3uKE3M3CbPlEikRzaWsCMJj4x9XrzZn2YSGR0NiNrvee0835M/OhAWBE3W8fyJXJjNVYc0F2pFHM3ZWcU0W0Iv8IXJqJYsxXOfikd7tlrM2QGw8zwbimLkR4J6vnMfJYCzIZTPBlY6g8vpGbSNUCdJZ8/tY1GsEA1y3/iDMeyBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW7dzvf6k3jhGUxsPMH1ZehKsEvFbOSS/Kbql8Pbof4=;
 b=cnXMs3oTqh89NX7v83cuks1wTBfaT1WaW+aYH73TPGrON2ZghCH9likxCyiLfQDLsRmMx35rQ/hqVVCXsnWi43dF/CcNuJhliFCQ8AE4c6CIG/VT33aaRwt7gOH3DA0qY3OZ7e2Pf5m2SnoBdgPl0wh0ys/FB4xANWDfqD6tOdL93fsbG7+mfpR2DOVql6j78P3tzaNIdrcJM1z2KlgZBR/BOvyOygja3DXpNUf6586S1+MvRCMkUUPLkIswyttdMMhgF6RYnL73j7LYy0PFX3Wt/kKMJ50ko6PECixhn7nMb2/Eh0zxFI6j18x2YRL785Lvu4x6VC0+TbhmKe1HuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW7dzvf6k3jhGUxsPMH1ZehKsEvFbOSS/Kbql8Pbof4=;
 b=hcC5ADDzQYh5E1VEHEG/sZ/dQi+MIKx2pJqXOzFP7RDo4kiojHPAmGi0VXn6JZKdzqzdnBedBzdYaprKPV4REwxKG7+BAjaMhR+czWE1u17E2y26/WYA9zZAkyhwIer2uMuRN8zEwPNk4DCuzuHFa6EdS+S/PQWSFoK0U/Hmvt0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB7482.namprd10.prod.outlook.com (2603:10b6:610:18b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Mon, 29 Apr
 2024 16:42:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 16:42:42 +0000
Message-ID: <26b372d8-2ad0-5464-92e8-ace3fca9119e@oracle.com>
Date: Mon, 29 Apr 2024 12:42:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Possible (long standing) issue in the BPF verifier?
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
References: <Zi2n0lpb7Kk15qKE@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zi2n0lpb7Kk15qKE@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f78f323-fe2c-416a-07b8-08dc686b63e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGJCSWlnWWlvbnhYdXlLNVhJclZiWFJyS0lkRFlCK294czRESStpM2pDODZt?=
 =?utf-8?B?c2loeXVLcFZTaW1TT3owRWcwRVh6MTJZQmJHYXpqejdpd0NDemkvbGllL2xZ?=
 =?utf-8?B?N1NodmJ3MFR6OWJRaFlaUzdEM1llMzhNdTNNcko4dFQ5UkF4eE0ya2ttbzhV?=
 =?utf-8?B?ejFZcUFPWGU2alN6bUxNNUM1RkpWR25CZFV4ODhVN28wMnJrN3ZxSjcwckRh?=
 =?utf-8?B?VERmamo0WWhwZHAwc0tEOEtIeEVjbllSZkRTWmc0ZUIyaTlOYTllU1hOeEg0?=
 =?utf-8?B?TWxUNmduU0t2ZENPQXB5OUxxWnBHQ1NJR2J2UzBwTXR2ZVVLMzJrb3FMTjhl?=
 =?utf-8?B?K0NNWmxaa2o1K1BJM1NxWDJ2TWh3SjJab1BDY0grb0tHOFNNajdFRTZnN0Jw?=
 =?utf-8?B?cTBYL3AvTkVSZXk2d2lmWmcvdFoxWGNLYW1FVFBReCtWTm96SXAvdkNUVldL?=
 =?utf-8?B?K0szb2VzYVlmVy9kc2tldXhiL05ueXU3dnFCcDY3K1dYc2E1MTkwVGYrOUhz?=
 =?utf-8?B?bzYyVmloS3c2ZkxtT2RqMzZoQy9aSGpVVE1QaHJQdWZrYm95b2xVREpndHpw?=
 =?utf-8?B?N2Q2YllLY01sRnNaTUJTMmRBNzRJL2dOV01PZG5MZUxwL3ZCT3hUTDQrRHJH?=
 =?utf-8?B?U1Zodldlai9XOUV2NjR4K1VpYUZ4K2loNzMzTTFDMUgxbWdBcnlLSzdkVGJM?=
 =?utf-8?B?eVJoUUJONU0wZTM4aVFsTTQxR1hjaVVmSC84NmhjUUVVR3hReC9hV2Yzek9j?=
 =?utf-8?B?TllJVFBVTjZRUXJMbHBMZWFDcUI1dDBPR3R4ZGd5NnJSSjd0eFpHbmhVRTF3?=
 =?utf-8?B?djJBUmJFVnZiMituU0x6cGxwRXdKdXNXY0lsY3d4eEpscHhsS0dIeHhyeENz?=
 =?utf-8?B?d3Bnay9jS0p2V3NEbjJwMWh6Y0N6WGZweWd6UHNXYkZqZWtLRVV6M211OGtS?=
 =?utf-8?B?eGtJZCsxdDB4UitZcG5sODVkOWZvblgvMCt2dTVPMDRxLzRtblkvUW5rRHVY?=
 =?utf-8?B?Zkl0bHpuSXZ3WDVRbURHTXRQUWZibDVxdytqck9mT1dPWUtkTVVneGhCODFu?=
 =?utf-8?B?S0pLcnV6MnJmeUN0a3ZPVHBZbzQ4alVOZG85eHZSNTVSMldOeG5OWnJPTytK?=
 =?utf-8?B?N245YlRDOTdiVVZneGJqeG1XSUpacXRsNXpDbXRwYzZuTDc4VlM1WlhkdDI4?=
 =?utf-8?B?QnZoNjd4dU9QbXh6bjJLeWJoS3ZvNjlFWC9zMUxYS2lZS1JRNWcwelpjc040?=
 =?utf-8?B?azZkRSsvanE1eDRja2YxVUZSMEZNdjdEZHZnN3Q1OFlYcU11cnBNbXBPSWJi?=
 =?utf-8?B?SEpGaFhxaE05L2swWXA2dS83NHlYemZxRXVRWTg4cXZsdlRTcFU5NG9TRjcv?=
 =?utf-8?B?eWVZb3pUM2VrcE9FeWNyeVhNZkt5ZmVQcXpJWWhnTE9kTjZRVjRycHdGNEUx?=
 =?utf-8?B?bmt0RmRvUm10TGdWWThOWS9FR2RjUysvMW03emxETlEzY0ZGNnM0NEtnazEx?=
 =?utf-8?B?dExjSkZVMUFMeU5GbmxuVFA1YnJXNmxLN29OMUF1dGxpVkNxd0cyemZ5dEhp?=
 =?utf-8?B?Ry9Ec29SQldXZDRieTd1NzFwWm93dUFpS2dVZFdpZndYT0lrYWZWU0NUa3Ft?=
 =?utf-8?B?Q0tCakloeEY0THRRS0FtUExveUw2Q0piWW5yYldGekI3UTNGNU5aMFBDOXJV?=
 =?utf-8?B?OUlKTFJJNUtUT2oyK082ZTQvNCtLdXNQVG1nYUdlYXNIL1BENzZ5aXZ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFNjNlRTOTR2OEdqL1FwNzJHZHI1VnNJQ2s0ZnFFNENsbHdNcEtadnFTUnFY?=
 =?utf-8?B?N1J3T1ZzN0lnckx0MFRUdTJUYytzZ2hQUXhqbDRIZS9oRk45NmFqaWVnYnVQ?=
 =?utf-8?B?amN3cnE5Vld5WTFWVW1EczU1bkZPa2tuOGcydmE3VXhvajZqYTJnWHlMb214?=
 =?utf-8?B?N1BOVEJGQUVGaE1QVnZvcGF6RXE3RFVVRG52OGhXN3V6a092L3BoVTZFa2Rv?=
 =?utf-8?B?QjB5SGJ2d1p4K0hLZWh6enFqdzd1SjFVa2VsZ2lubUgzdVlvbUM5TkxJZ2RQ?=
 =?utf-8?B?QnMwTjFoOCtRWEF0V1N3d29VS3g3aHh5RkVzNkV4NkZXQ2NpZ3pHcDJOeWI0?=
 =?utf-8?B?a1dUZ3FqYncva3dRUGxaaVNMcFA0QkRpSmhxdU5vMUkrNFlrOVd0MFJibDRK?=
 =?utf-8?B?bFFnMkFCbU5ZT2l0bi82U3FZSFczV3NlKzB4Y0RjZHRyVC95NkdoanJpYUhY?=
 =?utf-8?B?b2JzU212SUtTNnN6Mzd0dW12UUd1S3pGUkhaRlBaMjN1QmpsTVAzdk80cFhI?=
 =?utf-8?B?Ky9xVHV0Ri9aMjl2YnNNUTBOMnNxaGlFcmQ3TGRrVktvNG40Yk9ta1h0YzBm?=
 =?utf-8?B?WFh1L095cTU3RXpHRlQrUEZPTG5RWHltc0F0K1VzYlpaMEJFemw2akhpd1pj?=
 =?utf-8?B?Yld4Ulp4bHlzeEZHZmNpMGllZkw1anU2N1ZYb3FBT1ErVDJkUnA0UytMWnpn?=
 =?utf-8?B?NWxEUjk4a0NIZWxndzFHVnQ0QnIxbEVNdmUycEN6YXdtUXI3VmVDRzRLdEFv?=
 =?utf-8?B?dXdaZmJ2U1czZjN2R1B4eDl3ZmlvcURPcDJzU0dsdlVsQVlsaStxSjhwdWx6?=
 =?utf-8?B?d3AwV1VwMy8wbnRvekhwTEd1QUwrUG13SEJIcDVKZ2VibzkzUnhOVDBlUmJn?=
 =?utf-8?B?QjhNWmxOZ083ekYwR0Q5QTAwSmZzam10YUVRa2ZmUXZjRmhtQkYxMkl1dTVt?=
 =?utf-8?B?Wm9Ua3RkR1ZhZVZQM2lZQk8wMXNNYWZIYUlreGJ3SFUwTGtpRDJvTEFhcE4v?=
 =?utf-8?B?TnVldXUwWFZKMlc0NjdzL0doM2dhSTc4MWhqWmhSa2FTNHljeFFuL0dKMkF6?=
 =?utf-8?B?VU1Vd0Q5aHJBR1JGTWxvY0ZtM05MRklBeFBTRjJlSWZGMW82ZTg2R0F6V1V4?=
 =?utf-8?B?b0x2WTJSdytJYmZCblZQenRNamJoVUtpMTR5Mm9aaHpERHFudHVkOWo1WUJr?=
 =?utf-8?B?QWoyY1hVVXdpdmFjV0l2NGRVSXlGeUxDd0lvbmVGWndLVU1XWnBMbTRxUytm?=
 =?utf-8?B?QjNJdVAzV3AwMllEbitHQjlwM2RleFg3UG9QZGQvMmVkdDdlOVRhNE9HTzhs?=
 =?utf-8?B?V1czd0hRWkZtYVBsRTVQUjFaY2tzV2hURXpIL0tXT3d6K3dETXI4ZzZSQld5?=
 =?utf-8?B?TURqdFpUV0R1aUQ4NnJkMTVRV1FuTHQwaFB5WGp1ZGZQUUdKeEtOTUZvdzFh?=
 =?utf-8?B?bnRxT1RlbEl0UzJidkxGTGVvUkM5K1UzYi9MaG10ODdOaWE2S1JzbHhGTnY3?=
 =?utf-8?B?cHluREFuc0JIYXM0L0RyNnUrbVNURk9lWXB6SVVVR25OQnpBcWNiVGZvTFg2?=
 =?utf-8?B?eml4YlNMMENHOTdrRXAyenhpU2ZzMjNORjEyd1dRRlEyMzlXMWMyZzN4Y2dD?=
 =?utf-8?B?V21XaWVJVHFhb3Q2NklTL29TWkRxSWcxUDJhRTQ5LzZlOTZROGJZYWJEeGJF?=
 =?utf-8?B?eTQwVU1PSlNtY2pLQTgyZGprcVBPZTF5dTZERExCYnhmdlQwalNRZ0RjR0pv?=
 =?utf-8?B?LzcvbDd3dDZWR0VMdEVRZVRYTWpqaE1nS2cvL3NndUZEcmtaTjdTZ3oxeVA5?=
 =?utf-8?B?bVlva1cwT2NlQVB3WitlMXRtdGZUYWVMcEpsUmtiMU1iRWw1MWp5bnNUSVNE?=
 =?utf-8?B?ZnEwMCs2V0ZJa25ITEhiMW5JSUFET0g5bThSUE0yTDloNmxPenUwTVVadU5S?=
 =?utf-8?B?dUtCdUd2OFhCR1hBaC9PUHROUmZQZS9vbVNKbnBEaFVwQlg3dE9Qak9wTWxh?=
 =?utf-8?B?RVI0Vm14b3lONWtteE95SXVCaC8wUkY4b1lpOFNJSGgwd1A0ZkF5RSs0dVl3?=
 =?utf-8?B?Ry9jN29sUFFSQWdpQ1JVZ28zV0dScUNhTERGUDhSNURuc0c3Z1Q3SkEwajVI?=
 =?utf-8?Q?h5EV6NREF5QLCw5A+Y1CtLgk9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tC8lDV8bwl7d2uZ0I3lQX1Ld4PJlfR8l2fphtYcIO/TC6/x947cDO++R/IQQbFJ71eRag+QC/j7+xywXhCAJVerg/6w12RN6RKytYTlBrOu03+kWq1/AApZSGTz4sVYyfAqNO6MruO7OMbJ/YsRGCIEpH58UZ/5UB3qVH5PETEkPcKbdQYgPb2f+5D3qYTpm91yF5QDmsNV8Auc1EH6xtcSiRrvAHYN6nWjSYj6irJLoTo1GSDpPIGP8gox22sQtcF/NJgNiFgKqNQWEZy9YESSyEPYXOJQ2/cn3kaajoTM3seYjMdRyxF4h+W40jmceP1NijQO6viwXd8F5oiwVMgfrjuWZcSA4C8HkYwLiPFooNy+MqoswNOUIhUxSpEDAyIKOGI15Gh3IDgxbwABNwB9WGlkSsllUT6hCA0kJndmGIKXE/CtSn/jzFQeP/wn5UJzfhSUd8GNry1PJIsnyNy1DLZJyQfY6nog5X2WwpquySlkTuCrZx9EiJbrKi9TwLJ3tdcGa7i6rmst38i4X4Uzz9dhiYcGNgVp8mW6GT5fhe6+nU2/FoiLk40WIFMrfdPFsUzzozwu3hrF8evX4F06qwp+yLqy4GtdBs1T3X9o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f78f323-fe2c-416a-07b8-08dc686b63e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 16:42:42.9276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdrGQP0ZAlYwNz0JQ2rQMYcMivwznbF0/ofAiMiepR/5yXvMrKHg8J4p7isxVl+YWBC3FufrgiM1iOKCxIy5ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7482
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_14,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290107
X-Proofpoint-GUID: _wpHsHllUh8HeMRj20drTAGpKAKdxVeH
X-Proofpoint-ORIG-GUID: _wpHsHllUh8HeMRj20drTAGpKAKdxVeH

I'm confused what problem you're describing here.  Are you saying there 
is an opportunity for the verifier to do better?  Or are you saying that 
the actual computation is incorrect?

So far as I can tell, the actual computation is fine (at least with 
5.15.0).  Specifically, if r4 is assigned 253, 254, 255, 256, and 257, 
then after the +=7 and &=-8 I get 256, 256, 256, 256, and 264, 
respectively.  That looks right.

Now, [7:262] & -8 = [0:256].  So when the verifier bounds the result as 
[0:262], it isn't wrong -- it simply is not as aggressive as it could 
be.  It should be able to bound the result more tightly.  Is that the 
issue you're talking about?

On 4/27/24 21:35, Kris Van Hees wrote:
> So, I found the following in a BPF log on kernel 6.8.0:
>
> BPF: 799: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,smin=smin3
> 2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,smin=smin3
> 2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff))
> BPF: 800: (07) r4 += 7                     ; frame2: R4_w=scalar(smin=umin=smin32=umin32=7,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1ff))
> BPF: 801: (57) r4 &= -8                    ; frame2: R4_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1f8))
>
> And when checking kernel 6.5.0:
>
> BPF: 791: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,umax=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,umax=255,var_off=(0x0; 0xff))
> BPF: 792: (07) r4 += 7                     ; frame2: R4_w=scalar(umin=7,umax=262,var_off=(0x0; 0x1ff))
> BPF: 793: (57) r4 &= -8                    ; frame2: R4_w=scalar(umax=262,var_off=(0x0; 0x1f8))
>
> And kernel 5.15.0:
>
> BPF: 799: (bf) r4 = r6
> BPF: 800: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
> BPF: 800: (07) r4 += 7
> BPF: 801: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umin_value=7,umax_value=262,var_off=(0x0; 0x1ff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
> BPF: 801: (57) r4 &= -8
> BPF: 802: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umax_value=262,var_off=(0x0; 0x1f8)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
>
> This code is supposed to round the value in %r4 up to the nearest multiple of
> 8.  So, if %r4 is 255, one would expect this to yield 256.  Yet, it does not.
>
