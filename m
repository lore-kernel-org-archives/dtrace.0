Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E77260D
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768603730; cv=fail; b=tnU9KeUQDJAJetp/ylY8AYPwqKGXJnIpZgkbLi8hfRDFxFze2ZSzMNaS1+3jU5BGJbH49nUiIUBgVGBNAaiZkiMzsaBYoftYEF0k/7FYqMmXT+1YvvI5hi5tB/wNHX9BqePnJcwnrX4MMKHySHGMsoX99HBnqnkKJbeJFWBfrsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768603730; c=relaxed/simple;
	bh=Rwp2FjkD3L58Gk2sRtArgX1w+LcIwNmKo8BvEeP0/nc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=cJZzScz2eROIIC1nh29KpQduXpCggNKwKAQkUsDuFmMxB2xepR9xdljNzfpMV6XPganH7yryOFEUCKu4LdUOj+kf02xeB3WD7VC/dCR5tIOXPDjaCU2zdXAchI+kgO4xcLi9zlYRLC3PDW2csl23u+WFtqDrzxzycaCP/tMtPrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=izX6at5G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zPS6ov5v; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="izX6at5G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zPS6ov5v"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKWGnJ3528733
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=TGkRbE/rX0jzCBgmPL7kKYgipeGeyvpOwcY0Jai3fPk=; b=
	izX6at5GW1Qe/WqxZIZS76DvAb5Ny4RWl8nQ/vaWuH4FodJcgwZBayWBmDYnjNbh
	m7SSeYo0RYe/T1IdHzCKLYzVuPtj8njUBCVgy99606XO+gc+i/l/AwBK/QT6b6Jk
	3oHpNgl3ysTGGlhEtiy04n55u1B5ppds/Y+Dzw08qc0ghVnJUArpEm/N7TylLMwd
	MrecKCqlrsTHwTsrLrZfa9d8ZqfJW5FMISC9QaOHcTG5LoZqvVLZClipW5rJcvFv
	bcImwjdZjrb6g3iM39pfBLJ1cE2vWc5CipCIVlBHc3EKB3MFi8CbpXMEbzr0JPCt
	0o6KvCF11B/2J8Zz3uQarQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqveqg5dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:48:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKt425023085
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:48:47 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqvsqk5v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o76ocY0ea7E4oLVlqem4ggIfFG1+HrepbbwIyD5VgG3yc4jFUAVKx7zIky3TNArh02BMFATnjPme1bbjoFpjDbSaxoArdLkZyUCxaTt0vnHBiVkF65l0k0mOM/+4VTyOrYVD5D4rAvYbiue0NSB3+Wvz9tOUivcF1n8qjprRj3a6+T6yU9wQm6rgAsTCqJbhfMFy/VvbtiMWont0syFZEJ7LM0nbVLMpmM49WLIxS3xxpd9mPNsHv/HMpB3JNJ7jOQf2/4X5d/NRU+k68b/fEf5PGWcdMy15MyuHXKOfkTdT+qPCORl5a5h38BQ2OUNynLNL2EGWtxcf7aMP/XT4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGkRbE/rX0jzCBgmPL7kKYgipeGeyvpOwcY0Jai3fPk=;
 b=v7XPAKhApq5wviJbKyoLx2yzsZoCymaCTbb66ATys+geFQ0qv3Rue1s1dUyn2jBBNZNdUZmsJumOz+npQLGpJAiUG+aCmhfu5S4FDyM6yyA59cdzvQ46WRZLyoJiq9Sh/FdYfplbh8dSW0vtetx6K3atMe87yKFNSZfhLe2Cfv6LysQSMu3MjvZAUMsm9+LmnpaMTKbg8ej31cm8nQXSFnCqeoLJ0UfpeZqbrWuH9fwY95trivK+VJNRTIj65f+LKTpAHcRYjY9egQ8obzhMozAoQdiefboUDj4pxP/Shgl04+1HDW1qRtBQnJPgDtplAO/gupahXqNiIy11N7VvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGkRbE/rX0jzCBgmPL7kKYgipeGeyvpOwcY0Jai3fPk=;
 b=zPS6ov5vrZIS4JTotZYyG6VIP+uWUAZ20wvoETFV+H1nQlXpEZFqgeU8pAGpqrbL5ajHEMdZfAydpaslV7+2RhZ/1fHuL0zQ490U+UStrl+W+TxVeI15VdMWYwoZo9uUP8QafakXnytsytKCKwFm3CoA6Cew4qXN59vhMSo3ZmI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SA1PR10MB7634.namprd10.prod.outlook.com (2603:10b6:806:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 22:48:43 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:48:43 +0000
Date: Fri, 16 Jan 2026 17:48:42 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: [PATCH] uts: remove unused header file
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522337539F9353C9813DB7BC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SA1PR10MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c7c9a2-405b-481a-7a07-08de555166b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S0OKTeLLkY5a3Me5S/UYskgPN5OcVb+qW2SIKZK9PYbwD6r9izjkvGTiT0bY?=
 =?us-ascii?Q?5YU3ir/vsAajQbKMSmPOn8YKAiwT2Gs6Mcm2VrgRgTkCG+WdFtnDFeRF+DOn?=
 =?us-ascii?Q?kl8ST5C2w754KZ/lq4SEG7Tzvo53oBASyZW5iTaRWCKYPF/HLPT4al4hVO04?=
 =?us-ascii?Q?lwOtppv4N/lL3IdLCxLlmWQNMb4m1gGpZ06mcO9jZPz42Mc+xOVVbaOTgrzG?=
 =?us-ascii?Q?4bHzqGoIeJfg0LDWceHrwfQgT0gNpgajIct/XzNdrJhbOpr7ednANtHwaWGe?=
 =?us-ascii?Q?JV1QVwjMo7BX3uXLRneNQFqq42RPzcR/szeGqpy5W6pl11yNMXNPMbKCN8pN?=
 =?us-ascii?Q?mhxY9WeZgaP8vubUUpzzcn72MMI8XyvSp4CtdTBLk2jKf2g/mM75JC5/fpEt?=
 =?us-ascii?Q?xav86MwEmqcDCvl4LLX1I5Acn5HhCIIq2EtiMl6ZFFj+yboFyWsZR8sB3i5Z?=
 =?us-ascii?Q?3p70jyJtqTAdOke6W7Ah6ncbOMKP+r4Gv28MBsXVa7lNs299p4zQkVKmRsZw?=
 =?us-ascii?Q?fFPwbRJzIHJur2XgdiLStJpl+0Z2XZz1J2OE75HQ8FgYCAym4jcuASeHZBu5?=
 =?us-ascii?Q?vrx5W9CqVNfiJ8syI+ZJda8hQwuz/j0iSHPQbtT/Cg4GSI5POpmc7BC25Jmp?=
 =?us-ascii?Q?qzUBZpnhdY2PKqAT3h0UtgJkVBd3XGYhck/1ziHaMiEB4/tXQEeGkB6MfcVV?=
 =?us-ascii?Q?ok9YZXh0jt8SsjbhrlHDe0F1HweqQLx5YqcwDc7yTa/17vhC3d5muxTcNUfP?=
 =?us-ascii?Q?TEjiEXLGIdPd+aluA45/pLri5Ds0ZUNPx5Nqpgk4V98k1FZGPD8HPwTnZFzP?=
 =?us-ascii?Q?qx8/fgjJ/+d6IngEHKDZXA7Jdw/Kj7AXreCXrtaTzZne0NoSw5i860b4/piS?=
 =?us-ascii?Q?oyFQPN2ojoCmZz5+4A9WfHFKQi+ImYGCpFKrQZGZs3Dsas7Z7gxswDG8DMw3?=
 =?us-ascii?Q?gx1LCaQxjtRHgErIFugShRJo7piI+WSpghtineyCo+a2E/r1O5/N2gTfdPwM?=
 =?us-ascii?Q?5rW9DPE7Nc97JBExtxGKToGhhuncivZ+42KRhwHzp53iuMckL1CfsFfGZou1?=
 =?us-ascii?Q?nbxrnuzglbbSos5xwWrwpQJwAYvjdjhf0m7cesyOx0mDJmoh/5kiBfOxiIDE?=
 =?us-ascii?Q?04Bfm3ntKW2000MhEa9cN4TkyvcnbDYdqXO5Ks7zXfmePS2S567Blw4dLDMT?=
 =?us-ascii?Q?I8w7sgV12uq+nDOYYTtxR9dZgCFGvr1cMGjUHqDino8Wzy54V1LytfVvYYu4?=
 =?us-ascii?Q?DXtBTE5T/WnMimQvbfIbT8dss+YdHETc89BwM74PS9B9l4xmE2e0jkN4JbX3?=
 =?us-ascii?Q?J3GZCPBMu+q/IY0z5o3Ei5k/k5HjDk9d/5crJlizVyP50l+TBSCvT8S82C6I?=
 =?us-ascii?Q?PuzZ3gJE3N53BFw/Bwp6YceCV1Pwj9R04dpLyOs5K0UeSuBZhou0bHiXwPtZ?=
 =?us-ascii?Q?LSARFBPByInN1cWOuVtna5bQ22QTv6tMkvhwjaHfhHFAAywnBspxUtdSgiAt?=
 =?us-ascii?Q?o8OqIhA6XVwAl9nApjWCdl3BwtSHFSTLlsTSjIhCFkfMYUcrfXvIvn9mzrXg?=
 =?us-ascii?Q?GO5tDs3nDkV4dlfqVSU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jhLIHQ+GSeVRyEW5GRJKQQrbOLYmGwgRWxSzA5Ebf77al7pzAijh5bfmiuXg?=
 =?us-ascii?Q?3SqlhQ1jR+FfJ5QnFZR+Uv25xizbkjeR63s+CWEO3T1JVh68Pi9bamYMJpBp?=
 =?us-ascii?Q?Z5K6HKTL+sFh9GCLZvzaB6W3Qx6WtK5GnEHPTZP2FVLXl1XcNQXkMrdjgmPI?=
 =?us-ascii?Q?ty6Ykj5jfGaomYFLhDJ0yW0D2GF8hToyQBDkUFrzP5BoBD3Zub1T80D9+L8G?=
 =?us-ascii?Q?HCBcqfq9S2dUMHgLmJstsvomrclttMbQX02Ar21SjMS9lwqlzXt66Rr7Pcjd?=
 =?us-ascii?Q?IxqPMPGFVloSCwYgruOwRKpt/tPJJl8laumSq3vL5KjMGIy90VbDWzkitA6a?=
 =?us-ascii?Q?1JteWiIWAwKhjMcgLgg13jDhBWgjCRG7nHH9bFwP09PrtrlI9LNsvExfErd9?=
 =?us-ascii?Q?4SlPUZxMBeMbRROweMwlblUc27cN/g0Xh4I2OlmjcRGkGlROZx5wvPqRTMCn?=
 =?us-ascii?Q?kXcKc7Erg/8EPg0apgUuQloep3ayNoxyum4ftLLvaanY4/FDzoStwWs5qSon?=
 =?us-ascii?Q?wcNciX7+eGkqiiu2aIX2YC3PBINoolhSLo2dV7jNQvq5ltWVNO1VkwK6ymat?=
 =?us-ascii?Q?ECHTZ/+GQdIRnlkrlYm17eIExOLgrtqBRYiB1hDkkokV0KuCQ3Hm1/+OWM5I?=
 =?us-ascii?Q?Sqrx47bPl8tSgjDCJl4kEXEVsD7bKQDjklRUmxazVeyYyIwJdt9OiBDz88hQ?=
 =?us-ascii?Q?v6qWCCqlRXZ379V0+HN35oocmT+WQqj9DL1Hjs16EnbWQlp+AyNLBu/AsPFP?=
 =?us-ascii?Q?cgryVFegQTfNFF4EC2LfmbXH4wYUx+YZ68OVmv12HFd1W0RpA5QrNP4GaKO2?=
 =?us-ascii?Q?wEcj+t4xQ6b22eHhWSoIPvRn4DQJ/9wuZ0c3y0+ymo6qgahzHDk3vMn3G5u7?=
 =?us-ascii?Q?4GqXCitvg5J9rtoO3TKK4VC3FyEbPWlCT/mZ+GiAfW7q52dhtLovK+aGqTgt?=
 =?us-ascii?Q?rtZEgrtOkvq4ySBtvtOGwQkKLHWBkC0RjSdOgVFMi+/8HUsYKal1J18A0c8n?=
 =?us-ascii?Q?vDxQ+k0deU707d7HUYBbSwj+qveJTcEkPVRQTkzYDdfxmT5LHnTiCJ5h9n96?=
 =?us-ascii?Q?RRusQeQNDQ+15/2NbRMyuCwe+WlutVekJK1eo6I2Jn21hWY2XG6qW8eFykFQ?=
 =?us-ascii?Q?ZjnHrSwSQEGunB3/jDSakV25HXK9prohRGnK9MbOt+wXJe1ZfhFRMXTaUynP?=
 =?us-ascii?Q?wt2HJBPJMv+E6hmK984AM7jYqOCuZu22uc0fhFPt/cCmAJP8+eM9FAQAhXSl?=
 =?us-ascii?Q?BIst7uSq5isOa9JF+HpJnjpDZiFWhI8hnlIo7PZtA/TaoJr4R9gOdVgvBQPj?=
 =?us-ascii?Q?O/GfrydkcZNBMIkylv/ss2h06ckGLin9Jv1gcRjPNBGmOp9+vgVuxvRaB43z?=
 =?us-ascii?Q?7hDD8R3kjqWQ8nPGrKc/kitjbLw/95dS/GSMb6c3vEpJIMr9jO6iYhBcEiR2?=
 =?us-ascii?Q?L0AZV8LX4oXWbDf3a65/wxwwbnE6Fki/pTtbWpGbD4lg94PdcW6wSup1C4EU?=
 =?us-ascii?Q?2q/Xm52cxqMNv8+I7M3/3lOidDnpC52jlkDy+msI+OTtwzw1NxlT19BRZOEe?=
 =?us-ascii?Q?Ce4zEQ17GgnDdl00o5A0L9FV7Xt7lvMaXdRG4nJVnHAP8PWMCmIM1FlAnL+3?=
 =?us-ascii?Q?MKjEa5Tr9EzXER3wOLJendYV5gExVXfP8Lw5Jx1vnDFHg0PGyg/iGeRUwEA7?=
 =?us-ascii?Q?uV+u7vsl+MIbkbujunmTTvUzeV5yWj6PpwmEjXbTydKCz+jGsIjPpGkat82P?=
 =?us-ascii?Q?RuE3BjpuwwiK/t2im9TmnpNoeProomA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e7/4N2OAeyMGG9sa1WPhEJCrmy1xMHXScqIh/EljODLK5p6mYjobXvIe23LskkNegxFMwDZzy9gAasU8DvSy/cnD1K7meceWPTcyyCRep2KnhOSpOX8pgRufdhIog+5cXq2Uah74Iq8jfKHKquRuX2crfjCOCOM3pgHid4e+Tp10+TQdajdwJDNtI5IFqWTPT5KjVXWuXjGE22ZQLZDH66RfQKcmyd1I/IOtoorQBMAKsYeYT3OyJHxKTlYqzRgJazbYcXn6vgSfu6mnQ3cctWn6PmrXQPOq0SOoc1lA/KhjYWrbabW76rzPS4lzaluE5NcRhaaHWPgJ3Zs7FKvX1EOqlChuMA2MZeoh4Yu//p/gMnYdVyedp6s/kZHj/dQAOOC2lz2eAkEwLw4MXHv3HTjrq/rZ/Na3QqrEHPz0weZwLWzwPixuFxfgBA13FxatnDXj+3ad5xnxbGT+wiQR4lLPV5yaTqj6lgBNb5tMVBFg9SbTq8124PpxBHfcz3MwpB4yNnlb+I6aMCwmxABtLWPWadkXSXWc9MC1W1VVn4azbd1AeOMHRVZkEeztGNQp1Mss64G9+XW4fv6fJ/4W8JI3DsJ89IobNKXpKWlIZpQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c7c9a2-405b-481a-7a07-08de555166b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:48:43.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6OYsDWoaBjlTmp/WRWh1J8PwmPpRnnzneM6UJ+dgitYf4l41naMG/fULi2wj/6a7qAIUA4sRMKyMRStXq60+sKE2jYFyIDKdeNjOwDn9Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3MSBTYWx0ZWRfXzEmHE4I7W7RU
 IAosBHUPHglWjB+2QheMaJqHDshmy2HQOP2PCtlJi8CE8TOw5+VUvnMWpys4ZUp8tUC8bnUv6za
 EXfy2HE53YXeEmAayEDnGYLdIfV7/TNuKdb+f1bWTlHz6T5q/l6k6pmjWjt7Ud2Gj9PM9ukfK2i
 UxAFGZotLHGqxlcqSs3c7LJWWWcNcGylJKzJ8QjQD0hxvShs5dh7aBL6eR0AAVymWqCjxswSb+t
 ecYu2KTRYcMJAVDUTIJVBy0wSC9AWNEUWlVMwjLTswjGRc4bfXeMC4BzfiP8hrpffR9X9L/tHbJ
 tIYr9hDdv/0kiZU4KP79AGd4elndEHPXm5po3FLcQLHUW7nKjzVU32ak7/E5DrOwT60+mat7ofD
 2OVx1epyaj9JlfnMVkoL32BGhbphlymarPebtq38n3Gm/85kGhE8rQH642JbWWRteVdqxprzz5b
 47xYYjWt/g9rgRNRWXMQ//Q8pUqoTLTzxmvm/q/o=
X-Authority-Analysis: v=2.4 cv=TOJIilla c=1 sm=1 tr=0 ts=696ac050 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Kq2MiXChuEZ7X8jRr4oA:9 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: CekeqS1leBiZ9hWZqjrZ3j_RiOvpBVWl
X-Proofpoint-GUID: CekeqS1leBiZ9hWZqjrZ3j_RiOvpBVWl

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 uts/common/sys/mnttab.h | 88 -----------------------------------------
 1 file changed, 88 deletions(-)
 delete mode 100644 uts/common/sys/mnttab.h

diff --git a/uts/common/sys/mnttab.h b/uts/common/sys/mnttab.h
deleted file mode 100644
index fdc2ec47..00000000
--- a/uts/common/sys/mnttab.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2009, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-/*	Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T	*/
-/*	  All Rights Reserved  	*/
-
-#ifndef _SYS_MNTTAB_H
-#define	_SYS_MNTTAB_H
-
-#include <sys/types.h>
-#include <stdio.h>
-
-#ifdef	__cplusplus
-extern "C" {
-#endif
-
-#define	MNTTAB	"/etc/mnttab"
-#define	MNT_LINE_MAX	1024
-
-#define	MNT_TOOLONG	1	/* entry exceeds MNT_LINE_MAX */
-#define	MNT_TOOMANY	2	/* too many fields in line */
-#define	MNT_TOOFEW	3	/* too few fields in line */
-
-#define	mntnull(mp)\
-	((mp)->mnt_special = (mp)->mnt_mountp = \
-	    (mp)->mnt_fstype = (mp)->mnt_mntopts = \
-	    (mp)->mnt_time = NULL)
-
-#define	putmntent(fd, mp)	(-1)
-
-/*
- * The fields in struct extmnttab should match those in struct mnttab until new
- * fields are encountered. This allows hasmntopt(), getmntent_common() and
- * mntioctl() to cast one type to the other safely.
- *
- * The fields in struct mnttab, struct extmnttab and struct mntentbuf must all
- * match those in the corresponding 32-bit versions defined in mntvnops.c.
- */
-struct mnttab {
-	char	*mnt_special;
-	char	*mnt_mountp;
-	char	*mnt_fstype;
-	char	*mnt_mntopts;
-	char	*mnt_time;
-};
-
-struct extmnttab {
-	char	*mnt_special;
-	char	*mnt_mountp;
-	char	*mnt_fstype;
-	char	*mnt_mntopts;
-	char	*mnt_time;
-	uint_t	mnt_major;
-	uint_t	mnt_minor;
-};
-
-struct mntentbuf {
-	struct	extmnttab *mbuf_emp;
-	size_t 	mbuf_bufsize;
-	char	*mbuf_buf;
-};
-
-#if !defined(_KERNEL)
-#ifdef __STDC__
-extern void	resetmnttab(FILE *);
-extern int	getmntent(FILE *, struct mnttab *);
-extern int	getextmntent(FILE *, struct extmnttab *, size_t);
-extern int	getmntany(FILE *, struct mnttab *, struct mnttab *);
-extern char	*hasmntopt(struct mnttab *, char *);
-extern char	*mntopt(char **);
-#else
-extern void	resetmnttab();
-extern int	getmntent();
-extern int	getextmntent();
-extern int	getmntany();
-extern char	*hasmntopt();
-extern char	*mntopt();
-#endif
-#endif
-
-#ifdef	__cplusplus
-}
-#endif
-
-#endif	/* _SYS_MNTTAB_H */
-- 
2.51.0

