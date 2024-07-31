Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734481396
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452511; cv=fail; b=j4RnWGdsPCjLjPSyvktuqQ1uTUGonJH4/0wY+5KOvsZrLGrN6Rtw1MyD0Ye/RfOXCGn+JfZhylD+ZBwZ5joL8wkQE4chKBCMgSGJM0BBUvs06ih8BAC3dj+jRZo8TI5U7VqGc5Qhdb62xfHdrmc3dBXr2+75S/w8UZLBTCaEUmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452511; c=relaxed/simple;
	bh=qP6ijgwRIJ1nIWo+8bwHjiwKpuSkgSEMW74+hbDRFx8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=jZxP9J+u4M3Aa+GPF87lADGsh5aWB/XI2nI/BBh105VjHLatd0uE8nb+J1B75Y+9Vq8Y2vJ2FogGdForiwYolebYWbthYEXbxaWKsXVoRRpVZkUtE8c9F9OzUJcAGx5SiiVaE7dUmTsd06WfuWF9oNToccaRXf75bqQvY45K3vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fsgu74IG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VL5XqRsA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fsgu74IG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VL5XqRsA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtUqV020439
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=H4La2RVy1xjDxAMBV8tWbyh5OhRm7fipJG9KJi+yNDU=; b=
	Fsgu74IGtoEAZstR4ugwk2/8Affb88cH/3vmxIKLP4z5ErniFs2P96hU+QbQCvSt
	BK8aU4VaXOvhDimHMdYqxQnOHpVamPVqsmo+0siq8+1wkJN+mo+AAXBUY5BXvx8J
	bdQgZieInfpUpFBbr3JzGPhoOb7hNNovvKtErZVfRiERiLncMqFH+dNSbv5ejVnQ
	0fV7Lg1sjUS9EbbaQKThEojaX2Eqvwr/EyhFnID3xxAVqWwpoIGOmfWXWNkfHzOH
	kujWeyJS9AAlBZqmRsd/472mLu3eWG9ZhUL9F1Yz3fUt901hjCN2slKor9Yvvm+I
	k/cnyuSrEinSSh/60VafOQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyg459-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:01:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VI24ij019040
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:01:46 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmsnewr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:01:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8dSXMZxBExoI9YaN2UF/Yp38YQTgb4ZpY3zoeD9TBOhm64I383OWi747u25d1IaDAOax62PLqHyCLo5vYu8akbL9I/ABBlgRDQNQDg3Z18GmDYj5pcVZYA/yjfv9+vT/hP2HqKtuwo4cJvjlYmeK9Q0EDZ0Gvq1zBoswW5jYehPBDBqmWjtrkG28sHnALMbY56E9VtSs2Ihesqi/+30qOesULNcp9bxnzZ7FU3I/wPUrmz5yGSCzlhu/reeFyPG5toM79+gMqR8CURxFUJkXbT1P1eC6qPZ5O+ROZTkeW9CUcWvG4XyU14xJ12+zuYOtWCr3XT99fLZZuCcNCB6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4La2RVy1xjDxAMBV8tWbyh5OhRm7fipJG9KJi+yNDU=;
 b=N0EdAYnC1ad4ChlUAn4CEOTBNJGTfUdlmKnES6wie1l35+FLRvSHJQPVcRz3pR/ujcEDZKjXEWDS9boGSiqKY3yHBR3YNeiTAX4RxK7kirY0ygONGp9yW4xRcNYccLCwXJ3nSJCrfhGko0AMrIYz+X3d2J/idx+UbPdXLi16VeFf6hIwf3AKe++JUr4RDelAFS87y/tFpwESr7xgzUEyZxxj5cMkP26Cv46pU06UMGcRjn5Mj+BVVdff4v9y1PKjO0tQY9V/1Az4XxFTE/2LBERecgIVp9mbWVTVzbDg0z2tLkPpz+7CFsf6tvGD3/Og+XIMYAl3ltIOcAXPQNJUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4La2RVy1xjDxAMBV8tWbyh5OhRm7fipJG9KJi+yNDU=;
 b=VL5XqRsAROV/s2fiHl72JfZvLpm0wB9oI1qgbkPcc62e7oyL/u93xlBinMgohjOxAu7t0B6mfwlGXzCn4PFDhh3Lno7V3IviHbGTqd9c7f99URTnu/iUcnJH84yO8u3cdf+s91f62Y11fKCdKXHL6eDyW1521Qy77duef/xPpBQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM3PR10MB7911.namprd10.prod.outlook.com (2603:10b6:0:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 19:01:44 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:01:44 +0000
Date: Wed, 31 Jul 2024 15:01:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: ensure casting does not affect value
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0017.namprd11.prod.outlook.com
 (2603:10b6:208:23b::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM3PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e422dcc-bb30-4252-dce9-08dcb1933812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?isDjYbWNOFeE3F1X0IVv97yWIEBmTLqi9fROiH6SsYiIOTJTkkGb4gExs2OY?=
 =?us-ascii?Q?ub/kjdC5MYSlT+V7niodkQCcGUC2qsUagd0PTFVx8W9iDhDV4ngsZG0I3ESu?=
 =?us-ascii?Q?OzAXBKw+oZnm+mknq4MhUeCsVkCb/j0Yfq5XaeWRJSERhKDy63yBDkhZ2Wt3?=
 =?us-ascii?Q?0FV7d2048HyhvRTTs7nO0r2EAYmlcXHPB6b56CfAnDRuE0rVnHlFxrctmhBS?=
 =?us-ascii?Q?T8yfsmUXbqb/TWOoyqyQJtOqnJIYjhrpKnVbU71Eu8HtY8eTYkhxz0oKdhx2?=
 =?us-ascii?Q?C/GQ/AWiGO/pflOBLKy0YbVeLPmbpz7fmg7x15q7Z8bgWdTbOghyylwKMnng?=
 =?us-ascii?Q?XFwOyyCeUtvDij5W7Pip4AnJZX8pwL/T3TIApUSVZbq1MEezDwl3t8EtPUCX?=
 =?us-ascii?Q?sFvNrA9il+oeeT9Jrqes4rlqtFqSAGES5K8al3nQR74f+KG2C46IuuHFYF4c?=
 =?us-ascii?Q?Zb9wfsAjaXfACKelZ1pElepv2ufHbiQg6HsttPwCWNZulmJt0gnyj4pmMMbI?=
 =?us-ascii?Q?KQ7ZpUD3PiXKSBSAjct+f48sCt6bqbyXa7iqtVjYJ9nRKTITMVpPpbwYDBd2?=
 =?us-ascii?Q?75aEdNmGjxsI9M3avQWsMBiKayhfZzclcsYPWsOKNtSyu9PpQ5HkaSDR4FTs?=
 =?us-ascii?Q?JYwq7LaxNqifjXWPuEHxmxmnwiZu+szM+QBnGffazW8plzV/Hn+btvEpduxp?=
 =?us-ascii?Q?BjPWui9ESLdAZFPFYMUOoh8TMiwLtzsmTjQw/LCOyBhCVDqlT17IO29H/5pq?=
 =?us-ascii?Q?f3rjRCM1YHqHyPMGLRk06Cs1O/0VaKNWZsbUK5wC/SMf228eVcNSEb/jqLJL?=
 =?us-ascii?Q?M5mUrIZEbIOry2Xs/B6hI1RgbXadtE4BWcRqBRhZ/w0RkKKLLkju1sAaCWPi?=
 =?us-ascii?Q?aSotGzVPGwUdMdZRtpy2hcsFtUa/Q3zmtNMIBMPqak+brCH07vdaJQdIN/7L?=
 =?us-ascii?Q?8OGgXm3HkDJ4ZwwUdNgPNzNwbe4k1c6CBqcXutd4qQHZlaeOm97GIk7WHMmD?=
 =?us-ascii?Q?gO3HlbjQDPVLOVJ6+rXcZFZrxmUcCAAelMCpiwWQzBCA+J260B6g6Yia5aWz?=
 =?us-ascii?Q?7sg/6OdSA/8VaEsF+aL+rDRZWlYfFFFsgTHAuvFGO4YF6V0ykf4n5rpskiN6?=
 =?us-ascii?Q?d47Cs6WZKkoxPCoXfxzFSiZzMpug+dM7UlzxR6jxvcQ7HOsfq/ydipki2FWK?=
 =?us-ascii?Q?CZSyKr2sgb9AwqGGYQ9TnsVa55vV+60gyEBJZPpHPUxTCtM87pCDvgOsLtBA?=
 =?us-ascii?Q?eUiHLmyjJB70Cr4MgNbMGEZqQfSY/TrExfPwFfeAWE20JJ9GfuyiH1K43ru/?=
 =?us-ascii?Q?Ud6JcXGGfoY6WlLc+B3vLLGRUabe0LQZJ0268YvDH65UT+38ip0YDNgwXTiG?=
 =?us-ascii?Q?hl4kRFM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bCh3pGF8dBnSWGpHIIAmfsbGIgp8aupNW6+p9Ud+s6u1f8j9QupB7F7nWacO?=
 =?us-ascii?Q?IyDWISuESKTEbRCTQrLXZWBaaajW46SEs1u3Yc282K/Pe+WilSqxZBy+hwCT?=
 =?us-ascii?Q?Z2kZgPCSzNVp+cLupbhj903ehkAncNZmB/6yuUnxGW64ndU46rDS6w64cule?=
 =?us-ascii?Q?VHraMveAxO9oheyRJTYWCYuIfZ8bEpdG45CmWxcCAxdAskPRGXqta003yuUB?=
 =?us-ascii?Q?jNQke17p+v9krUsOWBeYOdrCVWhRE6GxXyTTwFgUBs86621DhZ0MtTryvYLj?=
 =?us-ascii?Q?R6LM8pxzEVAY0UQCZsRlqMLKPjnTYyEXyk06YMaieWnfKTwqyqXXZlPwOk6i?=
 =?us-ascii?Q?fK1Fe6pur+BD17WHDugBxET5/yONTZDbb8P05++P2R8EVgBjanjOEbkx6Z41?=
 =?us-ascii?Q?/4qFBdGrLh6RsniqB5F/UpIyWuW8SQJnCHQbmQS4URpFw3xsxKiGOXeP5xyc?=
 =?us-ascii?Q?EH2qVE9P1ddr2pUaYprWqpIMiN+ZYXIlwGksMYPqsAriCJ1nuO7M7k1XkG1f?=
 =?us-ascii?Q?LMKGTE4QIVutbWZ8J8ZFaQd4+7hYXOVfU1VzYZLeQ3e8SOEso2I0ckcgNwZj?=
 =?us-ascii?Q?A8PJTW7mDSV2YFP3sCr0kxaSEp+X2KpPFG2KkNG/sMMPFUogseD5RAWU80MQ?=
 =?us-ascii?Q?Bf0YwE7wX9FYOxkAK16yE82ZaEot0a7ZbRi1DF4UtqvdRsFkeseG3oN6OAXV?=
 =?us-ascii?Q?JOX4ABI+w4Dw4fM7v/y3AYzvY5NoU82Q69jqGFR0kc5+O/DOUljBTl7b89+i?=
 =?us-ascii?Q?YUYyCxFLhJLWCsRi1gkRpKYUEgmT2FqdtuXNNrG8fNjqCHzYlz2V0OKQDJVT?=
 =?us-ascii?Q?XAKhZLTyFEPNGFkLBt6qN/fPFCoRNGSWzyd8BC5Skz8uSiHcgQcL4VEX/J3n?=
 =?us-ascii?Q?/zjt1PsFEXer1S6bKkScg6I0w1237Y8Rz9l8Yc97AL6VnhlzC7g68lpKlmzL?=
 =?us-ascii?Q?DNPioj6kIM0jGKHGwvTGywnmDe1L0DKlwhdnIU+gxebn0t/58f16/EU9mcEG?=
 =?us-ascii?Q?GPQDGxVlKOCsROMQGzI9Cb1yYB/tCCOin9VnSIS91n8WyoyX5SQpvzT0Z5ga?=
 =?us-ascii?Q?KrqpFI1CAbEiYjYkRgUgltVJ8W64+rHiojWSyaktl53vIi88P3gOb1f8ok20?=
 =?us-ascii?Q?Flu7j35R6+YVI2MpMMP9DnXKNOovBYzH5MAODD/TdGiyLPCCtWC9izMpTM34?=
 =?us-ascii?Q?kHG/0k59b6jEGqQaNfwODXUjMePsWVC08inAmOlFwcF4ou+l/IP48X5PBM0b?=
 =?us-ascii?Q?LAgAtBpnx13T8qJ+h1OF/DmT9dhcUWWUuCC9JwN2wMcCaBrEyaoen5Ou6KMc?=
 =?us-ascii?Q?3CY2pS1cQ79FW0U3G3T11lB7FElu+P0YR+XBJS3t5j696gZJBL2DsoxGuNqZ?=
 =?us-ascii?Q?uCAAezkLJSQx4ssifufJYZrJiwZtIA9Qd9lHmDLveE8b6ZjafzjX9GLd/uab?=
 =?us-ascii?Q?GiRjXCGj6bbLjluSo/y4+j5O1FARaqaL/L2e5eZKW8RR/pULAxNgdDLvVIzf?=
 =?us-ascii?Q?cXCfsmddOZSPIIX+NLV6hrwpvX4lU5sflSaulfIcz8qsbduaZawuTEKIp4/+?=
 =?us-ascii?Q?KMpK4XQrJ9JKBunOC+V2fNbfLNxTOgtndRfJRwVwE/NJMT1NsBOdPlsSgLWW?=
 =?us-ascii?Q?AeW5nE/w+agDsSUTRQUH264=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c4LXR8pdbm/t5osQW2qFc2I12W/fAnricurCRTIjUHQJjElzqiproSYSwoQIyAVjEQ7lUv16BGxNVjvs60KynYV8X/Win6TCdXtvKNpw3uPGgD+3fhv9fh1q7DCZYItvL7Fq3FEHWtEhY8oKVJzzSGK7OxcMRwZElPniYBeJTac7gwRCNDoYweJArEDyjHmQyW7He8l49wyMawrOu0Opq0g7uLmgjlrM182A17B0l6YXgoMASCNYtgcVzkr5bwHQFgVP89pZmkU8YL0XOC4t5Vj90SSyj5wNE9NmhZmrneK1nR7YCuR6SAJ1rX+QNYJlTqslha4UseUL9E9yGq+bugSOvGatsOUHljROR7tCJtJqA4unlF4qtcNjRn7cEYPmouVm60pTVe85omgmYsG2Lqhw8UI8NyApM50X/0782isY9cfKh0Zf2dRzVQiJbvImnEAjPQUtpip4uZJHkGcDcohWGB4keeZ0DVNVuAktqmYk3RbZO2UHC2dHdXI5v9VMnR4ahpV9ppV3qipV9UrHGnv6bqjZVWfzUvXMtXNHid8SY0mxjPU10sSivjpGPHNRJYpyX7uK6J8NI3hMbvhQun1mj/htdl4tmu5rJuCVQ/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e422dcc-bb30-4252-dce9-08dcb1933812
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:01:43.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMzc+hikLy5OMLdO/qa185XA050JQoBIgpDrURxW+m1RGFqD8wLSAW4R8Ha56guHAIOWt8hf2UtiWtr61ZHoETx0mUjhcS3RsN03yh8ECF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=962 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310133
X-Proofpoint-GUID: kP4LujX0pzdY1UyXrvtEfrSyCVqL8Pbg
X-Proofpoint-ORIG-GUID: kP4LujX0pzdY1UyXrvtEfrSyCVqL8Pbg

On systems without CTF, we do not know the type of kernel variables.
By doing an explicit cast to int64_t a negative int is converted into a
large positive integer.  The proper cast is 'int' of course.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/codegen/tst.kernel_read_neg_small_scalar.d | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d b/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
index 7c585d1b..cda6649b 100644
--- a/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
+++ b/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,10 +11,10 @@ BEGIN
 {
 	/*
 	 * Unless we are actually crashing, the `crashing_cpu int will be -1.
-	 * We cast it to int64_t to ensure that the value read from the kernel
+	 * We cast it to int to ensure that the value read from the kernel
 	 * is sign-extended.
 	 */
-	trace((int64_t)`crashing_cpu);
+	trace((int)`crashing_cpu);
 	exit(0);
 }
 
-- 
2.45.2

