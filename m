Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF9935F16B
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776203083; cv=fail; b=kZPJX/3cdeHun0nBHhUzgRo/ITlgG0iHZzHHt1qDLoZ2Eh4hDhqxcx9C3RPbwji6s2NIesH11ScUtaMXIRMJ5ZvDlZ81FRo2s8mDoegLqH+NJBVlLpdNzUhJtOUn8p/iaNnRGVbplU8yQvVf7Hcr79u/3IshkFjVOv+hvxvCPm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776203083; c=relaxed/simple;
	bh=37hzpLUzYPQNBGumHmGpKYCOBK4IYNkUdS80Lmgw/+Y=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=MtjNCpHzWyFSlxVKa5C3jq5uzRrAMcwBAS9Dx4OrLan4pr1ZTMMxMAMf6a8PfvMLxpCTkkige/nc2s/WyN6Q4XhLR760jVNE0vWo325B5IbuheGaiN5HnkItMPgucfzewPtJah++DQ5l6SSzOWnJY8KPY0igoFLSEU3XZcxbNPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cIurW3A2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P/M5GLSW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cIurW3A2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P/M5GLSW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EJDXCW779604
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=q5dLdECwPiiveVq9mP
	dB/WDC0WxHgKxR1Yped3u5J08=; b=cIurW3A29Xst9e6Mmx+8EqZHQcpvjB3xaJ
	eO6//zq/Z2n2QC9PcdPrIhxmmmwKs0WJ3bNKweMar+DnecOzcHeGHaY4O/vT7OyC
	iT0MiV7CVf4DamA1ysySX9zA0vJkEw+NNb+B3Oz/36SVUzhnm/787wWzBB8mfCfa
	LaL/a3v9ek+ytHIbsl/iCLJescZ8CYcq4Wwhq1uIhPwqEQFggypZ7AeShD2F2Iez
	izfKoKewYXEpBzdE6lDUbZGi5KcUUY4rXi0A4bNPutATxgoFrlYn9dUUU8q1P32L
	A9MtX4C5ueQa5zfV8eyTYLkHv+cBgbQBrKrkk261lcg6PCoqGbWQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qkqgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:44:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELiRjY029506
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:44:41 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nksyeu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:44:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oi6qxtQYxGeFn1oLdV3WkYNfrUzYL1BTNxYi+ZwqfrRM4/miN6TO0asIhPhy2ZGvIUdcF4pImpqdSXgsfij1T2IgFblCN/qMWhgRRgFIUnkMpSDnbzmzMJhILptrdlrPI4+Q04hIWwnHOKto+B5wPbRf9ix1Z2fw4vAxI6OG/MgGkJo0xfr22iNqm1iekKH8YwyV/+x4Z48guV+5RSbI0/r06N+1+tcHAPFIrd9UKqQx71igZU8IEYRrBKZdhIU10bwCNgzrA7tRM4VzxhQ0pHVkPzypoppo0TWkdjH1dXVRjAXfpb602pI7vsM1qm1Yic1FJ3WrP/j/JexBVOzi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5dLdECwPiiveVq9mPdB/WDC0WxHgKxR1Yped3u5J08=;
 b=GC887IG6BcaxMIuYyaMMzmADJSoBOnUMNkS0zyPNcUeCAkbkfM88bNLSgeeD5wDZzezTmQ1dQ8//5VmJNg7Vw8Ef4okt9U9+4F8jK2M6WDyIbPwIKtFyzt6ljt6SVG4em0nJc6g/KuqId6umtjE9hKLkHHFDRWVGVR3/ReLfEC+enPOwAXxNsrwOCghWulM0HSLl8HJKaG34vk5TG2e+A0XWRL5ssbGwc46316LU7D3EW0sGEj5EFKxzq7AznS5E7Q2vR9RCZuHWA5mhIughhwEeQww3+AAqY5AiR5jAAWK1DRPRadL4VJIn9wEdQ8TwGIuIUspZJfyc3FNkpS3wTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5dLdECwPiiveVq9mPdB/WDC0WxHgKxR1Yped3u5J08=;
 b=P/M5GLSWm46bQeysvoC1MPkKdwjEglkA9EZyhTWeRiyYfuA/w9QdT4vzs8lcK5cqeaPjxnAHOr5L/lV044cGVPQ08zhd6nWY8iExVW8vaEgIXohR3ZusCHE+443aTv73/ZbS2ul62n9WRW3rx3SSK12cwfVdFPq3uEl8xnohPVs=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SAWPR10MB997791.namprd10.prod.outlook.com
 (2603:10b6:806:4e2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:44:38 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:44:38 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 6/6] test: Check declaration (without
 init) inside a probe
In-Reply-To: <20260331010224.16165-6-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 30 Mar 2026 21:02:24 -0400")
References: <20260331010224.16165-1-eugene.loh@oracle.com>
	<20260331010224.16165-6-eugene.loh@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Tue, 14 Apr 2026 22:44:36 +0100
Message-ID: <87o6jl1akb.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::9) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SAWPR10MB997791:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3c9841-cc0e-4dce-0a2c-08de9a6f0736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	blDJgto9GeuPXcFAbgg9LfE/1VqFibQeLrZ6U/iqrqQy4W01/Y1nbKxQiTVT09ZwVsahqXLWPFSjn4PJrIiUVFbO9EsQn2UnVjXI38k3MKhmHuyG2xGRo/c/ij4+L0uV386Uvfj/biKafgk0tTViDr4HZ9vcgyxrOOujO9jxinkU5kyUFS+aJ098Ek51z0wM7l3JNeC3Wqr8tuh5gVZia9FIjzDaCuFgwpsaNAI+BCldd7F8MHGpHWKoOZUOvPOMAFDOmYraVKjfl+NQA7Fd6EZYP74B/SDgSeTiBhbZtqDaqYNmFTyhONj1t6/BnR6sOHXn2HlfuvJiBMIQvRdEhDpPW4LaywO3kcNsPMhiYvwcIDGyJOl3TKXapQJA2nuBF7Uw99+9fDHBF91CUxu1dljVZSTD4hhJK6OuXXXb2le+EfZNwvQMu5jtXzmnx9/y6T88Sew7AU13TC9Onao8kOqE8oB21YcMCijcVZ4rR+Nhi7BhwGxGuuYrhFK6JXLzsLRDwUulPmYtY0199FGFdvvqpJhozj3Md4Xuc4lmyzRKpq2jnKAODgJTMm1rp+X3mnMNQtik5IkObmbpX2thBev9Kj18Hqi54XHKQvORmnD38SIgGlQAsaDBcbRO5TyptFpqG/VkCHehtoj9bCUC+iz3jFVTdDOxq70l/bVkJlqQ5iZIi3OFIOWW0dUUW1Vlk8aXUsBsejnuj928jQXFel74x/79f1udrcwXmTdRZwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83eY4qwjnIP8vLO0tUDcVeltcMxwOpYP4Q9Zig+qPup7OLb76uzhMiikoVyD?=
 =?us-ascii?Q?FR0wKqhNsq2DgSP+IJmlt96khERaZ6TI11YKbs7Iu2uPa+7+NCGB5xB2F0Jv?=
 =?us-ascii?Q?TVzMFX0fN4jkZg+nzhesVvsXesowWj+XxO8erCZwzI5eiP3BY9T8YLxT+GiZ?=
 =?us-ascii?Q?vedms3kvqltgGszokFb1DviEPIK7dkmEsKSgTWWWYMzX28RtLUwECE6QVPH9?=
 =?us-ascii?Q?Gc2SXO/RW5NW9HurpzCKIh5mhPME8lxYxoEInf6ICyZx05cBad2pWi24yTzG?=
 =?us-ascii?Q?LB45KcCdJPHcSSJiGoGfzpO3X9ZLCgRXGnIWnG580brRN/Kwq+ghjfkmCAHl?=
 =?us-ascii?Q?T5C5oJDhWZFF55yu5rUVNgJJKy6X+u/RI3d++b/tTFA5kPy8jWKkOeBnFpmV?=
 =?us-ascii?Q?SRSfqqLr2L5Z4eun14DmqnBxWEYZtk7+qqube3eilgSMc15Yc2oxSltI1pHc?=
 =?us-ascii?Q?oWXi6IFlgoVrufRoi5xL1Dzm4sAJeZdfGC0A0uBYX2PyuBCfsS8Qfb0zEtg1?=
 =?us-ascii?Q?8906HIuIQ7jKlj0VMFoyEQWq/wQirsLEdYwszYVqcuYLmPgt1XGNFSfj07CO?=
 =?us-ascii?Q?5EmAhrULH/nNDtNw6X9i6E/WkgaAZlwvrlFPbg5qJE7o1kNIbejlsdg7MAUx?=
 =?us-ascii?Q?1tVquS9HAR1GiDwTA+/GpiHdWvUFKSEcWPcCjbxlgpz3Hc3/q0ImRdepcuDr?=
 =?us-ascii?Q?EfR2SxHCwy5kR1rGYM1ttU80WNA8iXzKK9CLtTSJEwsRD0Y1BuLOnBGVccW/?=
 =?us-ascii?Q?Nt1G79D1nRADkYkwwIiHDFW40T8h1AvVcPp1xIpVk54XxBVB69G98MWlNQI5?=
 =?us-ascii?Q?PkYEquJjliufBMPE7F0b0X78Fct9zlgeXTlyF+0IDVi3gVmdZfC7iGEuqoaU?=
 =?us-ascii?Q?U5+MvMrGmXUdr+/Pugb0gaXD2XBHApElYtOdxlfqVqQMovLv+Ilh57BA3o0r?=
 =?us-ascii?Q?TsSz2rGk56ezOIvMOXPLe+VUJ0h65C1zQlXidC4Eq6FKKcYqVAgloDGqC70Q?=
 =?us-ascii?Q?DjlC5ZwmAfj5OYVJzEK8ZA5gD627eCAjnhvIuzmpIxqJxx313bMDckHN83oV?=
 =?us-ascii?Q?xov0/Ky8UjFvgMk0JRPex1g9p73Y2KFM+QNk35HBnFMbiFaLU8uT1Da7mZAb?=
 =?us-ascii?Q?BP/fTNBOmD72y/ReC39rAeavLvxKFWVj2Tvt4ahoqkuiOqVuBviEII5u25rt?=
 =?us-ascii?Q?WoI4XcNwCgD1jlG+WKoJfpt8epO/sLFj3uiGgWXaE6odzqNHj6XjMHzdnNDJ?=
 =?us-ascii?Q?R5w+Dmc+3ijEwuLDSnyFn0cxa5ExJ17hSBzjtdvahkhhwyb3jttJ48NZGzTW?=
 =?us-ascii?Q?nGZd1dIrTQH9BLnDz8ruvsKOqEjYQqNwU8gecR1ZMuY+pOA8HZKTWl0NKuQ6?=
 =?us-ascii?Q?yypqMe7LQQYS1MRhPrS7z8gM5OCnZUr6M3Vxcwos1z7tSjlxMp/C9rsKTS4M?=
 =?us-ascii?Q?EwiGmSTN90M7Q05gNuWb3y+WNWauf/Bt0ojOcWm4BS850yZNrdbPuDr1uTDx?=
 =?us-ascii?Q?XMw9lWslbhgvbpHZijcl5g8w37wcIIn1Dvay1J+37xnsB3lPkTeNwidN7ICG?=
 =?us-ascii?Q?YsL609mUBygTjpSP8c/2YNoRXSHD7+Zfoy2sNtataFld6QK/J8kEnMbBEoSK?=
 =?us-ascii?Q?uS6KKA+QE/cA+5teB3nzM38a0yfCU0lK6W63pT8SH+oNdLV58IZIteon+jWE?=
 =?us-ascii?Q?wabzI8+yHn5CJnVolud5Spg5ycHM3SJKi/qY5ENiz97sJL2QRnQctBE1ix9n?=
 =?us-ascii?Q?OeAxXHTexw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	FNj6JuVvw7I09wzleQLjykOT2+/bKRaL4x7le4aceTjF3EDFf0sViRDSxg1Q4baisqvRnOHdzzJVu4agGdaWBxa87kLqOzgiirxIimGLEfMaLM/F8V1K1ew8u73TTB6zKE0Kd1yPWemajLXgN5foDZhvAe9DsyMLHt0NbSaMZ6euXxVTcxQhSeuca0vCCPGFQ0bh8JcSJ6ZPAf5uP0YyPQhdD15ab0PUzzUxATu5+k2Z6BJzs+PlJ/XaHLln2Mja+ve/zzDTESsyzTI3MWAbv52uJN+BTf/WLFVTW5mFCHS6Ms7mhzFaWudrKNij4wgjUGaVK4Jy5xZTAQc5kKTt+A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	shqd5ZnpRTSK0pOmvVPiD8jXZTzAE8IyhvCt0wXj+8JnQoa7pJGq2hGhNgEZheBSz4vZzTB/PDkskcgt8t/+0gg/D1ePRc1Rj/guUABxZgWy+AIOVZKM3cDb9rUMwdS94cXGREsxlf2gDGIhOLvMasAGhSYjrWloZ8RgGa5WWP7wXH8OE7n2LCmdUMJ+HN6pJ/6lhkhH/X06LemPdTUMiT6kdHd8HsSjoAN6SF/hhH+zM5eixddRQWgW0fNRoZg/19Vs9kkOwlKRcvPNWZyToXuUc5x5v/7bcBdNA0mI6CQC4uAgZY1HryBLoYELta5g6tneKmykLmCfmZqGmqkFQfTfqEBBDJAWhkQgMKTqlQL2sbb/y5wQAYbsDRpBVCmKM/jiEiz/HfO5s7hGEA/OSWQ0ibLYRIDNJ3viQi1IZpyS2t+L7A7yg8LWiBGdvj98M6m6GsgH/fU93XVzvw8itocEiQKtUetTbdmDfvjoUldVeDtAxhd557kWlN175ABDrygExJ2LnjSSZB6ON9l4XSh5JgyTinv61AEWNqpGRyOmJvLpjCkZX7AnFlU2/FQF9hKSmTmhY/pk59gwD+6tBJcf1yXe6z01lYO5KxibEZI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3c9841-cc0e-4dce-0a2c-08de9a6f0736
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:44:38.7999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR5hy19ifBgtVqXGXRwJf3bg7mZLkvJGETCLAWKV8Jqosf1qOedooHXv985jW5GAIG+gtEatS6Bev4S9amJ2Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140203
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMyBTYWx0ZWRfX7LscTOOU9jsh
 A1/4Blpy9GlSnOEBryZMav9P/WeGQrNq/bEuBciKbNUwcrTekynCgjH8+pwSmiXewMGfxd5glF7
 HBBvWaJSvZVBjoHkyAycJpRSubxGSn60aMtZGXljJQ6bwj7sp83Q0Wl29JxMsJbfqDyVtdMyyox
 j/y42zS6q4jInRZ0qvOHP0KOw9P3PPIu7i5LuS+x9ziWR45JjqWDdA1J/HhuK+rHskwUehkzy5P
 L/wJhEi8YgQG6f+M0SjujYaLT3FTTP6+w1kNt6Mdpj3DbA9bpX5xNCu3hMFly/XeTsrDRYQqGj5
 wf5TTESKAMB61kY+zaa161vnNTm4Sz3Kx1ZYS8kY9Uu0kd2MJDUB68AOSlIzT3LZEIuHOC6JLIy
 Yy0CwaI+m5xncRqmJHh2VtPE4UPpGQXNYewyQTu13aOQRD5iXc0YH5m+HbfNOPfJ5Xq8409y55D
 BHpiBQw5llwvQuo7i8Q==
X-Authority-Analysis: v=2.4 cv=Lo6iDHdc c=1 sm=1 tr=0 ts=69deb549 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=nMhtIetSIoN_eQlvKHIA:9
X-Proofpoint-GUID: -M-Pc2j0Jh3ZomYa6OoJILJ7By6mszaU
X-Proofpoint-ORIG-GUID: -M-Pc2j0Jh3ZomYa6OoJILJ7By6mszaU

On 31 Mar 2026, eugene loh stated:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> We test that declaration (with init) of a variable inside a probe is not
> allowed.
>
> Check also that declaration without init inside a probe is also
> forbidden.
>
> The related test/unittest/probes/err.D_SYNTAX/err.D_SYNTAX.declare*.d
> tests are left alone.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
