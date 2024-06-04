Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87514A0AD
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524726; cv=fail; b=rFItDPe7Ejb7Vjq6CQwZNQ+/VEBhalZziW4Xyg+cL+IoMtX0TG1EWDf543U9F+uh3qUJbLzFRTZm0tDmR1HwsvhO3g02VZ9bMp+M1FaUol8poFP10hV5FLNfjemOMXlTU4T8ZMPUW7i6/6/HSxglAasANobmgOPjVg8ckINa7dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524726; c=relaxed/simple;
	bh=CZUwa6Ek4fT2w3Cg70K7tWiXw+I+an1yaLKctNICj6M=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sVN3t5GC18PONJk47LFaIqzo/7YFB9pETm4G00+wFPQhIM31iAm8nEawinMLCeD5Ch/3kZxNooWOuxDYd4igV/ipQpyChXdLoV3MlRDXi0RLBEdasbK5vsNfWa6P5+1r01nRDLZVuZFAPxPiiqw4L/EZTkxRUASJt5v1nBSE7l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnZoK024271
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:03 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DKoF5A8cq2dfk0FP?=
 =?UTF-8?Q?lD57qzTcaQnrMRbwFH+9T8LNzX9M=3D;_b=3DN0nLwoOtIUsQvki4HcJmXhENFD?=
 =?UTF-8?Q?8OgRN1jvhic2eghOhRPAG+7nXG8jQ06jlmfzSKpA0m_ig5tGSgJ00ejPfA6/mE8?=
 =?UTF-8?Q?UALYcRx4sdaTGhfioV+YPiCNypLOVEgEBKSLlvKpQKj5SxcD_80JgFa3YV/lc8T?=
 =?UTF-8?Q?rPavwddGlVZ1UBHNJG3nYNrTcc1pVJqerJAodG1UUnvPLYzC1KNjkO_NRfP8f38?=
 =?UTF-8?Q?j+u99dmlnSspS+wiXlKl1w8XHe6lhDiOTzJhNGI+5Ag9oL2wLvs1uZqSbgSn_FF?=
 =?UTF-8?Q?n8BlML5aIqpAnJKH74eCqDoHs2gsycHSh+clO1Eba5AB4P+X9jzX1+2sStdDSBp?=
 =?UTF-8?Q?3XO_sg=3D=3D_?=
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv3nwkth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:02 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HWnoa005458
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrmdxnyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUEYDBBPabakUG2/HfNH37hB6h1sNCt69/TVl0hmLJt2yXR+hZam+g6fLeB9+EMh2+FIfe54SR2QMb6y4ff0hURpY289lUTvIf2Wgm4iJOwbdm/d/aMxcjcWS7GaBK1hoqBoTUEwGlTiZiKS5HGsGzeOZIL7sG5P9dJIJoIlzCTrovKUdm7SMTuhgWrs4i743F42hXceW1+g9ooxVBXIvg5zTj+4YILpyRdiLfGufz9j8Z54jQ+CYbEu6H7cpJGm3/VS+mq4dJK4sXStm8MGOqwntOP6WEDteXFN9nW0UCL3M2CyUtMU6FnIzVwPGKGQO9zyYw07ngt4ccGkY/NIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoF5A8cq2dfk0FPlD57qzTcaQnrMRbwFH+9T8LNzX9M=;
 b=cj7MO6QFYME5oLrD7xPfiq1MHFOp4c0pxMb7NXPYrkMUvKVVQUndifq9xOdT2VcDkqmjKM1n5aKOINiCoVjlWdPX6c7qpnOMIk1mFGmHp2ToqkY+0E4g1zkesfw/HkDE9OtJY4avjCuS2zBGeGKBqmTXemvY6wO7wU20sgHESfUR9HItj8FVMBxDT4H+HgOQJiwPZCqPUAiASUmuLlv3Z8EdIfA1W+l5Mnnbzzz8Hya3r8RCfl+UurEBJO+gmNkiiEXuX16uQZNu/zaHe/vd0t8oOuWgOPTM07VfFEFATYpuuvN4HcHqc+F2NUKUGFMielD7n2lCn8yKcsIUojG9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoF5A8cq2dfk0FPlD57qzTcaQnrMRbwFH+9T8LNzX9M=;
 b=dafUWIwAwb4XxTW1ncnCLyB/VjaKEXDX5xOPU1FRJB67eHFaXksOxt9S556rRVZUYUppyrBnbkPYr7Il/UwRfQBBcWcTghgupHIFqoJB5sp0Chdsoj1APkjBSSbh8iZ0ZlM3XaSMUYO+ZnCIxjiXneP4vbgafeaptjBLamTVGTM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:56 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/14] Fix the consumer's picture of the EPID
Date: Tue,  4 Jun 2024 14:11:09 -0400
Message-Id: <20240604181113.11505-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0062.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: f60f7b4e-1c1e-40c6-f899-08dc84c1d195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?idN2zczTx865guYm3+mcY2w/Uc2QhH+xWpU7/NH/EKPOa4dgSyZ2pExGZAV8?=
 =?us-ascii?Q?2Sijh4wK+eqFh1oZrOAK5J08QMCTmFUDykfT9pezoE6ucDa2GDR3D1+2klQM?=
 =?us-ascii?Q?mlIWvBipBoELVrjyD7nSoyDicLkP46CUUc5HkRxzZVhffefHgRQTS/MndL5Z?=
 =?us-ascii?Q?dGdJW+aHMVwmCxbA3TPnmO9EMMeLDqzdXMl9rd+WNnBdCDUeaPBgiNhncwqc?=
 =?us-ascii?Q?azcPEHg5Q2wPuasIP9Ep4Bz8Tp1OZ8HSrArBFwaArbqaAZkT2Z/W7TKJRtVq?=
 =?us-ascii?Q?yFtiRetUBqXEZRiKBOxYc0VO8fZVs7fLyYdXbTClYl0P4FxgpU2/FMAMPOfh?=
 =?us-ascii?Q?HIf8aJngGo6Yv6Y0IDUtKR6Jn8ws5iAcuGjgr8xmP/jkt/otdegVjMDvern2?=
 =?us-ascii?Q?tjlXuBr5LOJw4dK8UBNlQZWuVVXgojNORrhW0zH8qkIWgWPkElxac67MlfRG?=
 =?us-ascii?Q?qA2Ll2KhOvbiN7RXxMCNlFCfM+4rLGFM6qV1CXUchaF47+SIGUk8zNufJObP?=
 =?us-ascii?Q?OlKSaz1wTqf0EDmtwyAHwrA+5u9/NjESe5kQdIgrfJ+KnnnX/zNNQ8hffi1F?=
 =?us-ascii?Q?CWXNNEUGJB/mXb8KCdWnuIQ6pqzy764YqYLNvduChJBSWO56uwpUCu8IEp54?=
 =?us-ascii?Q?EcCrmDmp5DCu0oRsRKiGKJnSLlpraSaR5vfCFBOgxqcouO0lPylxhuJyMFlF?=
 =?us-ascii?Q?U40nVJw9r2kNhSv755a1fZVCKYrYGbS0un+JCgHuxwmTvOFF4MwmFFkSbP+U?=
 =?us-ascii?Q?NOqsV4SfmezfMMQ6CR4q9fdUYW7/oNxzX9DL4iAR3LEpmOGUq7M7xNrJfdHP?=
 =?us-ascii?Q?ikvetCHdJtmWCq2Y1XrV7CtRxtEmKEpTlEnzD0lQiY9uxmoG+VUbMVHKpRWN?=
 =?us-ascii?Q?Z+Ks9PAdSaReOZxEGpiuSkRvVci2j8vi3VINcpUnG7jy1OfHUJJV2pd+Q2Dl?=
 =?us-ascii?Q?t/bpvbvIhGmu7BXz6H8eYEqeqjG26xDdVD1rG7cKLbCEkJDdrDYcw4lMziOR?=
 =?us-ascii?Q?pOcYkvAHphV0+09n6Z4XdrnjCwxGa6BOuxdGsGzIeB3UMi8ugHuNemG/gRqP?=
 =?us-ascii?Q?GlKKrYYeERdsHuaC/wAKNtSSiW3kSjCG821IHlYa++7vS/sABrOhjDXht05S?=
 =?us-ascii?Q?b8mq9p/pvr98VoEv4bK3uaPXjbnBlPyojEXP0Ca6wzBvI4a5TnR7LQnWU0kQ?=
 =?us-ascii?Q?8myeAKBCzO5GJ0u42HcCGj/IO6xn9jadCnFw4zfBlFf5akBDcR7sNxNdEiYq?=
 =?us-ascii?Q?7ytpr/HG0BvtHoRIbqOnKgM0HxGSq1QWLWY4aqrbjQ=3D=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?2y9HlDX0F8eImlr+EgzK3v6BAMkLXLUtUAlZvq03qRJ/2ixr/0dSfXGylAfU?=
 =?us-ascii?Q?Huah4PfVuwt4C9yX52Sb9ZE6k5L6C/S4NBqzJYGrfdrFHCPgqw64sRndHGkx?=
 =?us-ascii?Q?lMpUa34JRzGJFOViIsKfW9jej6h8LpA7NlaaFd8yp/EHpIlQVFnke/h7olv/?=
 =?us-ascii?Q?i0/BjCMFh2l3CXGhJfokO43NTUpJib36SjbuywuwlIowNa9CZP6SqN/Y0JK8?=
 =?us-ascii?Q?92jHvkttmfy8I/zPOCuEVNfm0VFX+tGD/j/mQhBTeDRZWJZlRkRkKWHjq4Cn?=
 =?us-ascii?Q?pBZAFUadSklhNLuaoZlAVKG6h4U/iDpG7taaNHcXRzNX/a4lPORgPaB/Clur?=
 =?us-ascii?Q?+vJrb4J0H2KGqowjAMF2AtZq0YdOffD9nssNAv15Hy0EsAnvIwH5H1CX1hZH?=
 =?us-ascii?Q?5vbcByop/KkySNsHJf/zhNIDBostOuK9xSH9Mkv4xGS6ilBcZc7H4Ci6E3zk?=
 =?us-ascii?Q?2FzwXWiuJr5TUz9h0a7a7ZCU5ce5tLjps6UxYmAh7Vbv4RJ7yF6gslJ+Fnxy?=
 =?us-ascii?Q?tQntFoHgfjXtyf26zuWCLO9CTAGDnZPrtBy4G4du4OWvkAlDhUgDjKhH83bY?=
 =?us-ascii?Q?HJK6fRvZgNMLUh8A8Fc4mv8xkFGTc5NINS6XwqffyqSjVfTdlVavccOOAPdh?=
 =?us-ascii?Q?eggDqtv69z5ZYpoPf+TrXKQdVcWqwG9B7JlDQM7adk3AHhnM9oK1jNhQ+V6i?=
 =?us-ascii?Q?dIYzmD6PSB3k3dUTPJ2576a2Vzh1zscIuhnUkslRGrYYbNyNz/xpi6V7Ca4T?=
 =?us-ascii?Q?afQb4UmH2Errhc0Q1iwNNc1DeiP00RblI5ESp4OEwWdP42D4KKUD6YLlPE+c?=
 =?us-ascii?Q?ZkosA2gB1HVmXqiCEYSNuZ5RfuYXIs5ICvAqAUvkdSqu4TIt4zUYd9aAsNy9?=
 =?us-ascii?Q?MO0naLgf8S9kPkQ6Y0dIL/umQfClYD9KhDLk9GvvJpYhEQsXDpL03686fK2i?=
 =?us-ascii?Q?OHdX4tM1DHuqPLYfmCSmd/HYO77wO6JMb6g2FbL8mn/otn8txHerbpElIMMj?=
 =?us-ascii?Q?u6zLDMlF55HKecSc+4TKMBUMP5/auPAB0Z6ihWlo5dwIm1lgWUqi3tQv6kKD?=
 =?us-ascii?Q?C3K0oa65ex1OA/77ZtqiWYViML/CIN3shxcPbhsDTfyVj+c5RR+C0AKipWvL?=
 =?us-ascii?Q?qiw+FVOgTgZ9q4BRxGFo6Nu2Jgoy32GtlBYj5XW/INss3ju/91/KuU3KjCef?=
 =?us-ascii?Q?SijyRwkaoD6TvEKVR7ExoKgPg/5rwM8x5g1+Mqyggks9/myNZxpbaYL/1HZn?=
 =?us-ascii?Q?cL945rIx7K9/13M0qngzA7+aIT6n1uZ4ZMTeozSHcaUExzEy6704mJ6B8N2J?=
 =?us-ascii?Q?IkSuKl3tHeErbMWm8WiREZKyQ0/aIOusuNCpU3qZLldWoYqTLQdB9yrDy0bY?=
 =?us-ascii?Q?LVSIKNhmoeeHge6EeYE7WRq0aBQ7rdsOqnHPQnL9ylNRCd0tzQA7vmAEZUvq?=
 =?us-ascii?Q?fHVy5JvbD5F09IF9x89WE+eLuKEF9BI+6E2h1TUwAGdUoV2N2vIEYnkjiX5+?=
 =?us-ascii?Q?MJf9+EQppFoTP9uhDxAEvNz6W7wHmmPwaI0t0Crvyvw8jyaO5TM5oGBFmmKp?=
 =?us-ascii?Q?3NalN61NuhMsjuNCOR6v/VStgpJR6rsV+BrbY62m?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
 qMiV3y2HV91BpZosfaJn8kRW/YKtwRaX83TP5LjwZQ/DfZP28gnOXsoIB9dWoY7OJgb2kz8XMIq48puOG1mSzbGwMB8LFNzrxrTSQxbG5MpRPk/Hok3Wgvu9d9FUcxirVMfB8BNisGGiG0LD69oS2louj3R8KN5aCoRiFSSJ48eXveve9B3zmbBJjWGaZpGblSD89kJd+9j3/I2uvV0ESybUp7juwFd0XN4Nbez3gEORlFdW9ivVhtkNlLJPq6/XsqEsHTerZbNgQ7uukr/+caUE08AXS7xdBg4WxA+vI1zsWKqs9RY7Loo+xIqBGFWySMwoWS0zMumciEy2+S5QE37C1WKoX1Cra/spO6iyIlqX+HZ3VuQ4HpJjmmhbVddRAruYdZOg1PvscOMg6UOa2/IqCdrzFULqb2/+3jKNBfngLZmHwY17iemW35XVSLfeSyb8jZGk8mCfgl0Y+6gw0KlBgrm3DRje227LiSNUJP5Dsp8YVIDUsG+AcBYjyL1f2O2D+bQ1m2clORYL2WDmKAN+2kMxcV2t2FdvbhMcneF/k5A/ofDhayGgcmFHoWN8/x5ak/JnT0NYmtsO4iUwwFrzCWq9hP1gro2xXgbDQ58=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60f7b4e-1c1e-40c6-f899-08dc84c1d195
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:56.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5yugUcO48/mWTSXJbAy4dr2MlSlycCYMCqS7quzF71UM/UXt3F5XBAB7779u+MGJVSV5Op3wkZ9hT56oCg9/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: NL2HqeHAh854vU0wOhpg8hT5Do_pjVZB
X-Proofpoint-GUID: NL2HqeHAh854vU0wOhpg8hT5Do_pjVZB

From: Eugene Loh <eugene.loh@oracle.com>

THIS PATCH IS BACKED OUT BY THE PATCH THAT IMMEDIATELY SUCCEEDS IT!

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 80 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 618219b8..83acb7a4 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -498,7 +498,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
-//	const list_probe_t	*pop;
+	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 
 	dt_cg_tramp_prologue(pcb);
@@ -585,6 +585,84 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
 
+#if 1
+/*
+ * Here is a big hack.  I hope I understand and explain it correctly.
+ *
+ * DTrace's underlying model is that each EPID represents a combination
+ * of PRID and clause.  EPIDs are enumerated so that, for a given EPID,
+ * the consumer can look up which PRID to use.  A clause sets its EPID
+ * to some placeholder value.
+ *
+ * During dt_bpf_load_progs(), each probe's BPF program is loaded into
+ * the kernel.  Each clause it calls is likewise loaded.  Each time a
+ * clause is loaded for a probe, a new EPID is assigned.  Clause code
+ * undergoes relocation, and the placeholder EPID value is replaced with
+ * the newly assigned EPID value.
+ *
+ * What's tricky is that the BPF code and the consumer get their PRID
+ * values from different places.  While producer might send a PRID value
+ * to the consumer -- e.g., with "trace(id)" -- usually what happens is:
+ *
+ *   - BPF code has PRID set in the trampoline, to a value that
+ *       is set during relocation
+ *
+ *   - the consumer sees the EPID for a record and looks up the
+ *       associated PRID, that association made during relocation
+ *
+ *       Specifically, during dt_link_construct(), when a new
+ *       clause is added, the PRID is associated with the new
+ *       EPID through a dt_epid_add() call.
+ *
+ *       Further, if an underlying probe trampoline needs to call
+ *       clauses for an overlying probe, then dt_link_construct()
+ *       watches -- for idp->di_kind==DT_IDENT_SCALAR and
+ *       idp->di_id default -- for any overlying probe specification,
+ *       switching the prid to the new value.
+ *
+ * We are now changing our USDT support.  The PRID is longer set in the
+ * trampoline to a value known at relocation.  Rather, the trampoline
+ * now looks a PRID up at run time in a BPF map.  The side effect of
+ * associating a PRID with an EPID during relocation is lost.  An EPID
+ * could be associated with multiple PRIDs.
+ *
+ * A variety of solutions are possible.
+ *
+ * For example, the BPF map could be keyed on pid, clause, and uprobe.
+ * The output value could be a PRID and EPID for the clause.  Clearly,
+ * this would take more BPF map space and more lookups than the current
+ * bitmap approach.
+ *
+ * Here, a different approach is chosen.  The PRID that the consumer
+ * associates with an EPID does not need to be exact.  A "representative"
+ * PRID suffices.  Usually, the consumer only cares about the function
+ * and name components of the probe.  So, set the mst->prid in the trampoline
+ * to any representative PRID.  Then, dt_link_construct() will continue
+ * to have the same side effect, associating the PRID with the EPID.
+ *
+ * Another option is to write the PRID alongside the EPID in the output
+ * buffer.
+ *
+ * Work in progress.
+ */
+	/*
+	 * Store a representative PRID to mst->prid.  It will immediately
+	 * be overwritten by the correct PRID, but we store it anyhow for
+	 * the side effect it has of making a representative PRID known to
+	 * the consumer.
+	 */
+	pop = dt_list_next(&upp->probes);
+	if (pop != NULL) {
+		const dt_probe_t	*pprp = pop->probe;
+		dt_ident_t		*idp;
+
+		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, pprp);
+		assert(idp != NULL);
+
+		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, pprp->desc->id), idp);
+	}
+#endif
+
 	/* Read the PRID from the table lookup and store to mst->prid. */
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
-- 
2.18.4

