Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B65256D
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616600; cv=fail; b=AE8imNHF+AzNjR2+dYOU22B1qEfrSKkujplUlsfViH2o8RYfidjMsct8MjCiNDQJ9DQNaNsUWoMEl9X5/KMiFm4BUDK+vRlh2feAN8775V10w7S+DkoN3QpTY+TjRwLfqGfd8Swcpsrzc7+QxYmp9r+VLdnhNPzqeyVFdnFXYd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616600; c=relaxed/simple;
	bh=jTRrX6jrIGq9plGXmlXAsNO1cYCDo7fpbFVj9vYtAAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ootX+MN6sqHYEx/csoEKpF6sBF/4pK6zgzj2VNoyVtzUwJTySFSCXHHKv59keNSvzMeKfqqh2oElgXtkPd0fMXjUnIchT1+YA9kdxjys3yjf7Rt3sRRtsVUPtashxfXpMaBDt1/bFYdSnhzgwTZEcArzE4UmmiaEpVqJL13VqHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KfYVkMHV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z2jkA7X+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KfYVkMHV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z2jkA7X+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MFBfKB005954
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=kghhvqYEBhlth7PEgQ
	aT7xrX3vzbMe8WTHEBJ3hKLtE=; b=KfYVkMHVwmM9iJRgQWjO9z0To9+HT9mxT+
	llcrAhSAtdQiwJ4MqCzV2bB9VA1WetxWWF2Zh12FFOjXR5PjsWGqKjfNou45dTD0
	P52bpOrcXjYz8LVXjs7JEk+pL+W0uoNHtt0fh2BpgtjldSII/Urwt1xWlgIITmuM
	rMDkiel1cHQD1HTbGCs+MCHZ7Hde/bP4Xfqvqb5ru9dbqLnejO8wGPR0U8+r3A6A
	FCrj0Oa7GaivMghvBpji26inky35CtgWtJxBebnm/vYQ12Q8PeYTSMgADvljazuw
	bxfDJMgqOBo/661xWM2e3jalphiWMT0hsmZCwqxs5aPLo9NisogQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ee446-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:03:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MGVttF012296
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:03:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42c377rm6k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 17:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZifFNzxNA5Mhw5w+gaXOlRbQKYUy4lRdaqGHIa4mDFn8yMokIpJ7m49EVfQjzEvTUW/lUEUIonwMs/l09FIiYtMPm6GDsItGGD+l14UOxqNDlW/AimrkLwYaqH0gjllA1EAS5y1SDP3/V6QCG1s30sdUw6Nu71CeM1dxt0nUnTWKyArVQYHuRxKoW3/uA5bbSpGhUtzyzwRti/HkIZpTEtgK28sMn0GPGCg0DLdKKSQSdcR7khiZEdSuHF3Bn2n906myJkELeSDVHNhgl4ZiSN1sSnjJ4KI57kD20AHw9pmE5Zna09rQPQ+iZ5UM2G35M5s9ComjR5nLNpIEOB8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kghhvqYEBhlth7PEgQaT7xrX3vzbMe8WTHEBJ3hKLtE=;
 b=sTYkWi4zXTbLprAMMpGho+PPKjSe36AH5kVG6fHkxidxTzDJk7FOqiB8aFyw4E9a74kCSWbbgvnZz3m87QkVXLD1xh+OXp1Hn/9LVyC51NedvCa7lA/DKirmGlARh+D3aqvkEIwPdJHmAojaKXFKM1lsPPkdbbMXS81O14XZhcAhNXpkpjMCC7Cb+cYNzyJe/Q4JPQxauA7xhL1veJEMATVIT6B5HRnfnGm4WzNtz7ZTvUICpajsBBt3VUU27yH87i3qc8tyd8Oey7cy3UVVoJaLO3Ahj253zpbNisVTYanTfYd4V+E9LexpInyVNrwlig80AHqMueKV1ujshG8VJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kghhvqYEBhlth7PEgQaT7xrX3vzbMe8WTHEBJ3hKLtE=;
 b=z2jkA7X+8iVmI1nkG0Ewx+yKcEgJkKPfEIpVqR9si9OoSGeDvCiBETsjIS8tBuT01f7d3AEM1kMPfTbwS/rwScq4eTEx90fyGmP2ZVjHY0Wq5zSWaru9KpORbpVc/mNd0pzG5k5HLfwEodkGHoD1Zmo33fd4cCoIzmJRrhzwFrE=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB7138.namprd10.prod.outlook.com (2603:10b6:610:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 17:03:04 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 17:03:04 +0000
Date: Tue, 22 Oct 2024 13:03:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/6] usdt: get arg types and xlations into DTrace from
 the DOF
Message-ID: <ZxfaxSlPli2z5j4C@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018195808.270688-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BN0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:408:e7::28) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: f33fcc82-3e5a-4b29-e3f3-08dcf2bb64dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?znCLDG/K9nCNkL1/WFyaeQWuuyTEmnaG3HbtFzo5HQa21BNnEhpRQ0Y9PEMo?=
 =?us-ascii?Q?au1mNyCdw84/2+6PTWjQobQZIsY2Ew++ZHDVH5ktVSdkXPZSRavlqhya5AhY?=
 =?us-ascii?Q?EzXviY6Kf244xHxC33Nq/Spj8OxgMBBVBNcrl77nhUHy3sEOZ9qXworCzHM0?=
 =?us-ascii?Q?54jv1PeKbnD5xUk3+kmZfDKH3HK3cibt3um3dj5AgaxjwjHNGTxYwqlwJl6F?=
 =?us-ascii?Q?toCSWlDL+NVlOF6SLWcdsD4euij/SbJ6pyN6g2sVuEtpPwOAYjmtZmerZJ5J?=
 =?us-ascii?Q?mJR/8Nz9zdatubRkYdSh4swe0VrxAjqCi2u/jzMl7qKDnpHxC/HmVcGoFG5W?=
 =?us-ascii?Q?Le2ENJc3znC5DMQMf3eTYKrWgXE2lNgF0k6dnqt4ClZoEMz4XyAoPRIeqtT/?=
 =?us-ascii?Q?eQuJ2rN3caposyzZirlZ49v9ETDDtOA1G5TT7Vs02Nen1I8GRTsb5tax32H0?=
 =?us-ascii?Q?FbJ8vkNhpNDWa9FMXoTOz1YlND1m1L+4Qy9ucz+/YxKoqHkBpgecdStetP4L?=
 =?us-ascii?Q?67ymMhYtM9vqkoCo2eZC6Y4vuJ5Edr0nBhV7fgrONtDtPbwa1h9YtpPYmCr2?=
 =?us-ascii?Q?HUu9T1TKAnBSEYifOWYNhekGddblnr8P0ANknQ5IYDLtjPA9oPmECDSN7MSA?=
 =?us-ascii?Q?OufAKnq0oVvPvhWfBEpYs1YLIiN/+6+li8orS1D+t/7QaQRGvTxLvVuIirVP?=
 =?us-ascii?Q?OjsO1aDfAutgYlf+AtuSK9taymGwCD1tPbwMi1fDUgll4XcvtTFNBcl36SUo?=
 =?us-ascii?Q?d6vjcsG6REFLPWT/REi2TSiwKNBiYhaEnk8s5hgfJiW3QnRYlX2dMMzWrjBh?=
 =?us-ascii?Q?IOv8Hgl+FmETUIChncAfdeM1T374ZUs4sA47/3H6P60VzQwXVUjSV67N0rWe?=
 =?us-ascii?Q?GJf3wBNdQfOMOxD6Jts1t1s/rFmEQs/mLsrx1NQ/eZa/zemj+jMeOugcl4/+?=
 =?us-ascii?Q?7otB93t/wj+ZAqBjDwvGjE7NGhDZv23hKMdrVjgvogSoRIkNpMt96lbzjgPP?=
 =?us-ascii?Q?pAjExQFbSznjcIwmX6kdrl+XaGT0AonmgfY/cNyeQYU1ZkNo1X/rV59N2wfp?=
 =?us-ascii?Q?FVszNgfv9SLyX5M2bIEEK4C7Upp+uKc4DmBCdknTfqRWgyqSEY7tF8Hk9wnq?=
 =?us-ascii?Q?jR6l2zNFQX0AoMeYA/5szYy8CnlPHcdyTHYOKZaKTCBmCJOLcQPkM4c4oMlx?=
 =?us-ascii?Q?XGm938yHiNLlbi/RwfCauBWz8CkZRQDTZSDq13im5k4Jyx0svNcmRp3ZpehL?=
 =?us-ascii?Q?CoQ18yAXGnXJzutZEdU6agP53ajAOmIxDAMKLGsGEIVZjKKry+lxbTAL+mAN?=
 =?us-ascii?Q?LXib6H3cTxLSkIECbZaQRGem?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IVmCU7zn4WwrDbTfxvHFz8cBk5lCugGaYAi1ufXRyVfpZ/sNJ6qaV/QqbYOY?=
 =?us-ascii?Q?U6FMMUmJGrdyQsRUp9owBQSVg0RA9HkGwH0rihyMGHm5Hkg7eTCdWgd+OPsS?=
 =?us-ascii?Q?N8a3PqZ4HDQkGfwQRV8WW2K2U/ok/qv9YYrcr29zErjK/3UG66B4kGr/B2df?=
 =?us-ascii?Q?SOzIQ4YfhDRSLkXoUoe+vOAwXMuMNU/+2eITI/gIgEEzA//WmnA/fjqkcuc9?=
 =?us-ascii?Q?hWwi3mcg/hcEGhjN8mVdx9FrffbyZX1HgHe9UhzkY2yy/4E5ra/0JuhSTJCj?=
 =?us-ascii?Q?hODfJ9vfC6jHJ3iivUr6/oWpVxj0g7f4F/gr0o23ujTfkWWPhzat+tqi+CB1?=
 =?us-ascii?Q?l1G+DZBvTVBZKawuhtpXKScUzOrPUb8LZvmwR4XHP6jphLomRznVWQc4YJnb?=
 =?us-ascii?Q?nugcPqrBZpRtc1nos8DEgbaKpi+0N9Fef5BD5Ea871D1S41XjVb1VcJrkr9x?=
 =?us-ascii?Q?pz3quXaHxrNJBvmdUKJG8Uf2HDOJYafPqH0CNQQAyZmyUibdZrHhwq6Ita6e?=
 =?us-ascii?Q?0e1hKRlp3Vo7IUEAVbwnRAnWtQlstZjHvHCaiensabsw5NrR6l4sI970kbKV?=
 =?us-ascii?Q?n6qmDJAaG9WYpa0tH0BZ9yR+MnyLl2wzxUdny7FZOPLMhH0YhOJLfhWUqGj+?=
 =?us-ascii?Q?pze0ROmq6TtuqwS2A8ux5wO7UIauVd5EPL6WRDoROQCnetYDZcpEL+MgyZ+U?=
 =?us-ascii?Q?ohjRXs+zzdK5YoofEThwY6fFmnnRAB6y4ySjeNECAbLBxo1F2eOt15gaQtiW?=
 =?us-ascii?Q?ygNSUHk1woG96ldnaum/NvKRXc/whbsb19uJLZD5Jmi3w/15yzxhEcc+Fjsi?=
 =?us-ascii?Q?Bjsp3WDmKoIgwCcRRAMcJ9MMst37yGF7uQMYSI1Q6aChhOkTJ3vBHYpBuEgy?=
 =?us-ascii?Q?lAMZp+274m944Cr7+dp+NdJBUU8q4QACOrHFs5gZZ14o53g6k2WDwhFNVfJo?=
 =?us-ascii?Q?rAd0gyI+UJ4heGQzaS4/583X6PKSPCSxTtYykJkznFaCCIesxzIHrG7a4JdF?=
 =?us-ascii?Q?TKSupg5uJ9k2NlRS4K0D4sCuC61K9b5FdJldULS7SXzedqFfUkejyw+K9+3D?=
 =?us-ascii?Q?34cyN0ncOAMZSFPDSMqHlMSF9kRQnU0XY8o+2ztZ90AALzEDsm84x9IEQJCQ?=
 =?us-ascii?Q?4+q2OYVvAaS8T4UArQPDEnkm/zAp0qMhDJY628cpYkq5NgFPx9tPJUthzPVm?=
 =?us-ascii?Q?OsyIxP9YmXG+kradz6slFCOdzZmYFPwOMAfBK7rO1Qa3MGPkQoCNu9n1J1GS?=
 =?us-ascii?Q?ycGDM1Ku1+LcT9Nhjhg2scr2lw5lgrpiP42A6xR2st7T9weY/+PDcyIeF8qz?=
 =?us-ascii?Q?96MX/UjYdDb6+MCPba/Oz1tFmatq/XL435PE4Ouh/4V3MwczG133lETv8Ahl?=
 =?us-ascii?Q?Enae/7sogYsIMac/cHngOE6Idn1XZp8T3SaN5DR8jWURq9gnBK9rYcixV0fF?=
 =?us-ascii?Q?0peEbTBToWeW77iM6AxzqpR9Uu4zJTR7W0scw+zlMn8MjaqdA38ZgdzDzoxO?=
 =?us-ascii?Q?PUf+rgV44sN3/fqs9rf5X0sKTtgntfGZ/B7C209a9DOYFlAaNsOL8/q9Ki8O?=
 =?us-ascii?Q?nrDGTeC4i6ZBGlZsTHYk9TEah7zXv2O9+tNpRLs8UezLLVxEVQD1dEt28YaV?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LJDpPkZ6prE3h/21J+C3uv2jddj4SrKZx0zZ4Ox5q5RxyEjftid29qpPXoC3Trk4DHxFmMzBeRDYVjJuvkhkG/hCaOKdo3ARkzlWW/2K+fMYeNELfQ0qzVlaffulItJrkUlxb2Oqk70ThbJXjbAsmMlgVc+QMlBXrIXhIADJnRQeMfrY4rhsQntNiyjeQDeGu05DNqk8Yc50+kDtfLnsPc35L7xTNnRT8j9eRnPACLGz0znPOyyd/Bj5Sw09b9l4SLms0wPxmjH4wTOkGuT5vRYZ9yvezom2Qc1Qabzd7DPKSCfBQYF/TaWVZu72LDVEbtZHZCgPqQ2xs2RGZpSXt8y40IZor+JlEt4XnsKMm4BIFa+lM5k21rEcyPm0O9llUGQD+UVNg4SgnrZqscbEat7pqjFk7IeRc185pvmxqfk51QBCrUrsJ/0V9v6vntLt+Ijc25Ag1M3XEeKpJ/cMzeiewBIynpLdq1ZQQwqDIVf3Okl2RpFXi264duTxt7Bg+pckRlSs441NkPyj209VapVWukQhVNpQfBUTURptJA6YKJl5iy83TzlZ7tOkHZvJNqHuecRCeppGKMPyhfqkURx4yHkr6VihzeOHcasKKDE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33fcc82-3e5a-4b29-e3f3-08dcf2bb64dc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 17:03:04.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsxMSmVaVuSyLmYubQbO9ye5zOnEvEXMLxytbnu8xFztvMZA93P3m+UuAeCGBmMP2FYWdjXR9wCDrBaaL5VLKBpvOYM5hB7ePNDRZ1YV31o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_17,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220108
X-Proofpoint-ORIG-GUID: OkRlyuWod9xDCtiSXEb608paDKVQQieL
X-Proofpoint-GUID: OkRlyuWod9xDCtiSXEb608paDKVQQieL

On Fri, Oct 18, 2024 at 08:58:04PM +0100, Nick Alcock wrote:
> This change propagates native and xlated arg types and remapping info all
> the way from the DOF, through the parser and dtprobed and the DOF stash,
> into DTrace, where they end up in the pid_probespec_t for USDT probes.
> We don't do anything with them once they get there in this commit: no
> user-visible impacts expected.

General comment for the entire series...  the DTrace code consistently uses
'mapping arguments' rather than 'remapping'.  I think it would be wise for us
to be consistent with that.  That affects commit messages, comments, code,
and variable naming, but it really helps if we are consistent with the
existing code base.  (When I see 'remapping' I start wondering why we are
mapping twice...)

> We bump the DOF_PARSED_VERSION since we add three new types of record to the
> dof_parser_t, all optional, covering native and xlated args and arg
> remapping tables; to make life easier for consumers we emit them in a
> defined order (documennted in dof_parser.h), and add a flags word to the

documented

> DIT_PROBE record that precedes them indicating which will be present.  This
> means we retain the property that you can always tell which records within a
> provider are coming next purely from records you already have: there's no
> need to make decisions once the records turn up.  The DOF stash hardly
> changes: all that happens is that the parsed data written to each per-probe
> file gains some extra types of record (it can have DIT_NATIVE_ARGS,
> DIT_XLAT_ARGS and DIT_REMAP_ARGS entries following the DIT_PROBE record
> now).

The generated DOF will always contains a list of native arg types, a list
of translated arg types, and a mapping.  So, it is an all or nothing deal,
if the probe has arguments.  Also, since your probe record already records
the number of tracepoints for the probe, it would be more consistent that you
als include an entry in the probe record for the number of probe arguments
and similarly, number of translated arguments (no need to record number of
arguument mapping values because that always equals the number of translated
argumwnts).

So, adding those two counts to the probe record (similar to number of
tracepoints) is consistent with the code you wrote before, and removes the need
for the flags member.  The argument type and mapping data then no longer needs
to have its count at the start of their record, because you fold the flags
and counts into the probe record.  That is also consistent with how DOF itself
stores this.

> As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
> refuse to read probes added by dtprobeds that are on the other side of it.
> (Restarting dtprobed will reparse all the probes in the stash to match the
> new layout, and newly-started DTraces will pick that up -- so this only
> affects running DTraces picking up new probes, which DTrace cannot do yet:
> so no visible effects are expected.)
> 
> The code is a bit repetitive, with nargs, xargs and remapping all handled
> separately even though the code is very similar.  In future maybe we could
> unify them (but my attempts led to code that was much harder to read than
> the original).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  dtprobed/dof_stash.c   |  14 +++-
>  dtprobed/dtprobed.c    |  12 ++-
>  include/dtrace/pid.h   |   9 +++
>  libcommon/dof_parser.c | 167 ++++++++++++++++++++++++++++++++---------
>  libcommon/dof_parser.h |  80 ++++++++++++++++++--
>  libdtrace/dt_pid.c     |  71 ++++++++++++++++++
>  6 files changed, 302 insertions(+), 51 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 0e639076f655..d9731844066c 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -59,8 +59,9 @@
>   *    startup if the dof_parsed_t structure changed.  The file consists of a
>   *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
>   *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
> - *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
> - *    the DIT_PROBE record specifies.
> + *    DIT_PROBE, then optionally some DIT_*ARGS records if the probe's flags
> + *    word calls for them, then as many struct dof_parsed_t's of type
> + *    DIT_TRACEPOINT as the DIT_PROBE record specifies.

Rewrite based on storing nargc and xargc in DIT_PROBE.

>  /*
>   * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
>   *
> @@ -640,9 +641,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			break;
>  		}
>  
> -		/* Tracepoint: add to already-open file.  */
> +		/* Args info or tracepoint: add to already-open file.  */
> +		case DIT_NATIVE_ARGS:
> +		case DIT_XLAT_ARGS:
> +		case DIT_REMAP_ARGS:

DIT_MAP_ARGS

>  		case DIT_TRACEPOINT:
> -			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
> +			assert(state == DIT_PROBE || state == DIT_NATIVE_ARGS ||
> +			       state == DIT_XLAT_ARGS || state == DIT_REMAP_ARGS ||

DIT_MAP_ARGS

> +			       state == DIT_TRACEPOINT);
>  			state = accump->parsed->type;
>  
>  			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index fdcdee14f851..ecf27216ff80 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -795,16 +795,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  		if (dof_stash_push_parsed(&accum, probe) < 0)
>  			goto oom;
>  
> -		for (j = 0; j < probe->probe.ntp; j++) {
> +		j = 0;
> +		do {
>  			dof_parsed_t *tp = dof_read(pid, in);
>  
> -			errmsg = "no tracepoints in a probe, or parse state corrupt";
> -			if (!tp || tp->type != DIT_TRACEPOINT)
> +                        errmsg = "no tracepoints in a probe, or parse state corrupt";

Indent using spaces rather than tabs.

> +			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
>  				goto err;
>  
>  			if (dof_stash_push_parsed(&accum, tp) < 0)
>  				goto oom;
> -		}
> +
> +                        if (tp->type == DIT_TRACEPOINT)

Indent using spaces rather than tabs.

> +				j++;
> +		} while (j < probe->probe.ntp);
>  	}
>  
>  	if (!reparsing)
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 0129674adf0c..d9a5a40484a5 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -35,6 +35,15 @@ typedef struct pid_probespec {
>  	ino_t pps_inum;				/* object inode */
>  	char *pps_fn;				/* object full filename */
>  	uint64_t pps_off;			/* probe offset (in object) */
> +	int pps_nargc;				/* number of native args */
> +	int pps_xargc;				/* number of xlated args */
> +	int pps_remapargc;			/* number of remapped args */

Always the same as pps_xargc so not needed.

> +	char *pps_nargv;			/* array of native args */
> +	size_t pps_nargvlen;			/* (high estimate of) length of array */
> +	char *pps_xargv;			/* array of xlated args */
> +	size_t pps_xargvlen;			/* (high estimate of) length of array */
> +	int8_t *pps_remapargs;			/* remapped arg indexes */

pps_argmap (which is a more consistent name than e.g. pps_mapargs)

> +	size_t pps_remapargslen;		/* (high estimate of) length of array */

Not needed (always pps_xargc * sizeof(uint8_t)).

>  
>  	/*
>  	 * Fields below this point do not apply to underlying probes.
> diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> index d6631a1afdcb..4a45ac41a64d 100644
> --- a/libcommon/dof_parser.c
> +++ b/libcommon/dof_parser.c
> @@ -879,13 +879,31 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	return 0;
>  }
>  
> +static size_t
> +strings_len(const char *strtab, size_t count)
> +{
> +	size_t len = 0;
> +
> +	for (; count > 0; count--) {
> +		size_t this_len = strlen(strtab) + 1;
> +
> +                len += this_len;

Indent using spaces rather than tabs.

> +		strtab += this_len;
> +	}
> +	return len;
> +}
> +
>  static void
>  emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  {
>  	int		i;
> -	dof_parsed_t	*probe_msg;
> -	size_t		probe_msg_size;
> +	dof_parsed_t	*msg;
> +	size_t		msg_size;
> +	size_t		nargs_size;
> +	size_t		xargs_size;
> +	size_t		remap_size = 0;

map_size

>  	char		*ptr;
> +	int		remap_args = 0;

Not needed, because baswd on your code you could simply use the fact that
map_size will be 0 if there is no need to map.

>  
>  	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
>  	    dhpb->dthpb_mod, dhpb->dthpb_func, dhpb->dthpb_name);
> @@ -893,37 +911,124 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	if (validate_probe(out, dhpb) != 0)
>  		return;
>  
> -	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
> -	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
> -	    strlen(dhpb->dthpb_name) + 1;
> -
> -	probe_msg = malloc(probe_msg_size);
> -	if (!probe_msg) {
> -		dof_error(out, ENOMEM, "Out of memory allocating probe");
> -		return;
> +	/*
> +	 * Figure out if the arguments are shuffled around (in which case we
> +	 * need to emit the argument remapping table).
> +	 */
> +	for (i = 0; i < dhpb->dthpb_xargc; i++) {
> +		if (dhpb->dthpb_args[i] != i) {
> +			remap_args = 1;
> +			break;
> +		}
>  	}

The existing implementation expects mapping data regardless of whether real
argument mapping takes place or not.  So, it is best to always emit mapping
data, even if it is simply i -> i.

>  
> -	memset(probe_msg, 0, probe_msg_size);
> +	/*
> +	 * Compute the size of all the optional elements first, to fill out the
> +	 * flags.
> +	 */
>  
> -	probe_msg->size = probe_msg_size;
> -	probe_msg->type = DIT_PROBE;
> -	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> -	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
> +	msg_size = offsetof(dof_parsed_t, probe.name) +
> +		   strlen(dhpb->dthpb_mod) + 1 +
> +		   strlen(dhpb->dthpb_func) + 1 +
> +		   strlen(dhpb->dthpb_name) + 1;
> +
> +        nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);

Indent using spaces rather than tabs.

> +	xargs_size = strings_len(dhpb->dthpb_xtypes, dhpb->dthpb_xargc);

I would move the assignment of nargs_size and xargs_size firther down, into
the conditionals that handle storing their data.  If you give them an initial
0 value, then the remainder of this function will be handle things fine as far
as I can see.

> +	if (remap_args)
> +		remap_size = dhpb->dthpb_xargc * sizeof(uint8_t);

No need for the conditional.  Always emit mapping data.

> +
> +	msg = malloc(msg_size);
> +	if (!msg)
> +		goto oom;
> +
> +	memset(msg, 0, msg_size);
> +
> +	msg->size = msg_size;
> +	msg->type = DIT_PROBE;
> +	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> +
> +	if (nargs_size)
> +		msg->probe.flags |= DIT_HAS_NATIVE_ARGS;
> +	if (xargs_size)
> +		msg->probe.flags |= DIT_HAS_XLAT_ARGS;
> +	if (remap_size)
> +		msg->probe.flags |= DIT_HAS_REMAP_ARGS;

Not needed - just store the nargc and xargc in the probe record.

> +
> +	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
>  	ptr++;
>  	ptr = stpcpy(ptr, dhpb->dthpb_func);
>  	ptr++;
>  	strcpy(ptr, dhpb->dthpb_name);
> -	dof_parser_write_one(out, probe_msg, probe_msg_size);
> +        dof_parser_write_one(out, msg, msg_size);

Indent using spaces rather than tabs.

>  
> -	free(probe_msg);
> -
> -	/* XXX TODO translated args
> -	   pp->ftp_nargs = dhpb->dthpb_xargc;
> -	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
> -	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
> -	*/
> +	free(msg);
>  
>  	/*
> +	 * Emit info on all native and translated args in turn.
> +	 *
> +	 * FIXME: this code is a bit repetitious.
> +	 *
> +	 * First native args (if any).
> +	 */
> +
> +	if (nargs_size > 0) {

Make the conditional on dhpb->dthpb_ntypes instead, and the calculation of
nargs_size would be within the contional.

> +		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
> +
> +		msg = malloc(msg_size);
> +		if (!msg)
> +			goto oom;
> +
> +		memset(msg, 0, msg_size);
> +
> +		msg->size = msg_size;
> +		msg->type = DIT_NATIVE_ARGS;
> +		msg->nargs.nargc = dhpb->dthpb_nargc;

Not needed.

> +		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
> +		dof_parser_write_one(out, msg, msg_size);
> +
> +		free(msg);
> +	}
> +
> +	/* Then translated args. */

You could put this conditional inside the previous one in the sense that you
cannot have translated arguments if there are no native arguments (but the
opposite *is* possible, by the way).

> +
> +        if (xargs_size > 0) {

Indent using spaces rather than tabs.

Make the conditional on dhpb->dthpb_xtypes instead, and the calculation of
xargs_size would be within the contional.

> +		msg_size = offsetof(dof_parsed_t, xargs.args) + xargs_size;
> +
> +		msg = malloc(msg_size);
> +		if (!msg)
> +			goto oom;
> +
> +		memset(msg, 0, msg_size);
> +
> +		msg->size = msg_size;
> +		msg->type = DIT_XLAT_ARGS;
> +		msg->xargs.nargc = dhpb->dthpb_xargc;

Not needed.  Besides, an nargc member of xargs seems odd anyway :)

> +		memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
> +		dof_parser_write_one(out, msg, msg_size);
> +
> +		free(msg);
> +	}
> +
> +	/* Then the remapping table. */
> +
> +	if (remap_size > 0) {

Move this into the handling of xargs because translated arg data and mapping
always go together.  There is always a mapping entry for every translated
type.

> +		msg_size = offsetof(dof_parsed_t, argremap.remapargs) + remap_size;

argmap.map perhaps?
map_size

> +
> +		msg = malloc(msg_size);
> +		if (!msg)
> +			goto oom;
> +
> +		memset(msg, 0, msg_size);
> +
> +		msg->size = msg_size;
> +		msg->type = DIT_REMAP_ARGS;
> +		msg->argremap.nremapargs = dhpb->dthpb_xargc;

Not needed.

> +		memcpy(msg->argremap.remapargs, dhpb->dthpb_args, remap_size);

argmap.map perhaps?
map_size

> +		dof_parser_write_one(out, msg, msg_size);
> +		free(msg);
> +	}
> +
> +        /*

Indent using spaces rather than tabs.

>  	 * Emit info on each tracepoint in turn.
>  	 */
>  	for (i = 0; i < dhpb->dthpb_noffs; i++)
> @@ -938,18 +1043,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
>  		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
>  
> -	/*
> -	 * XXX later:
> -	 * If the arguments are shuffled around we set the argument remapping
> -	 * table. Later, when the probe fires, we only remap the arguments
> -	 * if the table is non-NULL.
> -	 *
> -	for (i = 0; i < dhpb->dthpb_xargc; i++) {
> -		if (dhpb->dthpb_args[i] != i) {
> -			pp->ftp_argmap = dhpb->dthpb_args;
> -			break;
> -		}
> -	} */
> +        return;

Indent using spaces rather than tabs.

> + oom:
> +	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
> +		  msg_size);
>  }
>  
>  static void
> diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> index d3a6836f15fd..bfcac2c52de4 100644
> --- a/libcommon/dof_parser.h
> +++ b/libcommon/dof_parser.h
> @@ -15,10 +15,19 @@
>  #include <dtrace/helpers.h>
>  
>  /*
> - * Result of DOF probe parsing.  We receive a provider info structure, followed
> - * by N probe info structures each of which is followed by possibly many
> - * tracepoint info structures, all tagged.  Things not yet used for probe
> - * creation (like args, translated types, etc) are not returned.
> + * Result of DOF probe parsing.  The order of elements in the parsed stream
> + * is:
> + *
> + * DIT_PROVIDER (at least 1, which contains...)
> + *   DIT_PROBE (at least 1, each of which has...)
> + *     DIT_NATIVE_ARGS (1, optional)
> + *     DIT_XLAT_ARGS (1, optional)

A more accurate naming might be DIT_NATIVE_ARGTYPES and DIT_XLAT_ARGTYPES?
Since this is all the data that is contains in those elements?

> + *     DIT_REMAP_ARGS (1, optional)
> + *     DIT_TRACEPOINT (any number >= 1)
> + *
> + * The dof_parsed.provider.flags word indicates the presence of the
> + * various optional args records in the following stream (you can rely on
> + * them if it simplifies things, but you don't have to).

Not needed if you store the number of nargs and xargs, which is certainly
more consistent with e.g. how you handle tracepoints.  And avoids duplicating
data (since you were only using the flags to indicate whether there are any
native args or xlat types, and that is as easily determined by nargc > 0 and
xargc > 0).

>   *
>   * On error, a DIT_ERR structure is returned with an error message.
>   */
> @@ -27,9 +36,19 @@ typedef enum dof_parsed_info {
>  	DIT_PROVIDER = 0,
>  	DIT_PROBE = 1,
>  	DIT_TRACEPOINT = 2,
> -	DIT_ERR = 3
> +	DIT_ERR = 3,
> +	DIT_NATIVE_ARGS = 4,
> +	DIT_XLAT_ARGS = 5,
> +	DIT_REMAP_ARGS = 6,
>  } dof_parsed_info_t;
>  
> +/*
> + * Record-presence flags for dof_parsed.provider.flags.
> + */
> +#define DIT_HAS_NATIVE_ARGS	0x1
> +#define DIT_HAS_XLAT_ARGS	0x2
> +#define DIT_HAS_REMAP_ARGS	0x4

Not needed.

> +
>  /*
>   * Bump this whenever dof_parsed changes.
>   *
> @@ -37,7 +56,7 @@ typedef enum dof_parsed_info {
>   * start which is the version of the dof_parseds within it.  The data flowing
>   * over the stream from the seccomped parser has no such prefix.
>   */
> -#define DOF_PARSED_VERSION 1
> +#define DOF_PARSED_VERSION 2
>  
>  typedef struct dof_parsed {
>  	/*
> @@ -59,17 +78,62 @@ typedef struct dof_parsed {
>  			 */
>  			char name[1];
>  		} provider;
> -		struct dpi_probe_info {
> +
> +                struct dpi_probe_info {

Indent using spaces rather than tabs.

>  			/*
>  			 * Number of tracepoints that follow.
>  			 */
>  			size_t ntp;
>  
> +			/*
> +			 * Flags indicating the presence of DIT_*_ARGS.
> +			 */
> +			int flags;
> +

Add int nargc and int xargc instead?

>  			/*
>  			 * Probe module, function, and name (\0-separated).
>  			 */
>  			char name[1];
> -		} probe;
> +                } probe;

Indent using spaces rather than tabs.

> +
> +		/* V2+ only.  */
> +		struct dpi_probe_native_args {
> +			/*
> +			 * Number of native args.
> +			 */
> +			uint8_t nargc;

Move to probe record.

> +			/*
> +			 * Array of native args.
> +			 */
> +			char args[1];
> +		} nargs;
> +
> +		/* V2+ only.  */
> +		struct dpi_probe_xlat_args {
> +			/*
> +			 * Number of translated args.
> +			 */
> +			uint8_t nargc;

Move to probe record.

> +			/*
> +			 * Array of translated args.
> +			 */
> +			char args[1];
> +		} xargs;
> +
> +		/*
> +		 * V2+ only.  If provided, the given args have been shuffled.
> +		 */
> +		struct dpi_probe_remap_args {

map instead of remap

> +			/*
> +			 * Number of remapped arguments.
> +			 */
> +			uint8_t nremapargs;

Not needed - same as xargc in probe record.

> +
> +			/*
> +			 * Mapping from native arg index to xlated arg index.
> +			 */
> +			uint8_t remapargs[1];

argmap seems more appropriate as a name?

> +		} argremap;
>  
>  		struct dpi_tracepoint_info {
>  			/*
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 62060b5921b6..356b671c8385 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -866,6 +866,10 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		uint64_t *dof_version;
>  		char *prv, *mod, *fun, *prb;
>  		dof_parsed_t *provider, *probe;
> +		int nargc = 0, xargc = 0, remapargc = 0;

remapargc not needed.

> +		ssize_t nargvlen = 0, xargvlen = 0, remapargslen = 0;

remapargslen not needed.

> +		char *nargv = NULL, *xargv = NULL;
> +		int8_t *remapargs = NULL;

int8_t *argmap = NUL;

>  
>  		/*
>  		 * Regular files only: in particular, skip . and ..,
> @@ -917,6 +921,55 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		p += probe->size;
>  		seen_size += probe->size;
>  
> +		/*
> +		 * Assume the order given in dof_parser.h, for simplicity.
> +		 */
> +                if (probe->probe.flags & DIT_HAS_NATIVE_ARGS) {

Indent using spaces rather than tabs.

Use probe->probe.nargc instead.

> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +                        if (!validate_dof_record(path, args, DIT_NATIVE_ARGS,

Indent using spaces rather than tabs.

> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			nargc = args->nargs.nargc;
> +			nargv = args->nargs.args;
> +			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
> +			assert(nargvlen >= 0);
> +
> +			p += args->size;
> +			seen_size += args->size;
> +		}
> +		if (probe->probe.flags & DIT_HAS_XLAT_ARGS) {

You can move this into the previous conditional, and make this condition on
probe->probe.xargc > 0.

> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +                        if (!validate_dof_record(path, args, DIT_XLAT_ARGS,

Indent using spaces rather than tabs.

> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			xargc = args->xargs.nargc;
> +			xargv = args->xargs.args;
> +			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
> +			assert(xargvlen >= 0);
> +
> +                        p += args->size;

Indent using spaces rather than tabs.

> +			seen_size += args->size;
> +		}
> +		if (probe->probe.flags & DIT_HAS_REMAP_ARGS) {
> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +                        if (!validate_dof_record(path, args, DIT_REMAP_ARGS,

Indent using spaces rather than tabs.

> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			remapargc = args->argremap.nremapargs;

Not needed.  Same as xargc.

> +			remapargs = args->argremap.remapargs;
> +			remapargslen = args->size - offsetof(dof_parsed_t, argremap.remapargs);

Not needed.  We know that argmap is an array of xargc unsigned bytes.

> +			assert(remapargslen >= 0);
> +
> +                        p += args->size;

Indent using spaces rather than tabs.

> +			seen_size += args->size;
> +		}
> +
>  		/*
>  		 * Now the parsed DOF for this probe's tracepoints.
>  		 */
> @@ -967,6 +1020,24 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
>  			psp.pps_nameoff = 0;
>  
> +			if (nargv) {
> +				psp.pps_nargc = nargc;
> +				psp.pps_nargvlen = nargvlen;
> +				psp.pps_nargv = nargv;
> +			}
> +
> +                        if (xargv) {

Indent using spaces rather than tabs.

> +				psp.pps_xargc = xargc;
> +				psp.pps_xargvlen = xargvlen;
> +				psp.pps_xargv = xargv;
> +			}
> +
> +                        if (remapargs) {

Indent using spaces rather than tabs.

> +				psp.pps_remapargc = remapargc;
> +				psp.pps_remapargslen = remapargslen;

Previous 2 lines not needed.

> +				psp.pps_remapargs = remapargs;

argmap

> +			}
> +
>  			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
>  				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
>  			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> -- 
> 2.46.0.278.g36e3a12567
> 
