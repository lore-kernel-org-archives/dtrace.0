Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C00D531
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825297; cv=fail; b=IBm5eV+Uha86UuL4Oj79IqtJIg7m6ylFYG3vb2czyYL2NY9igGjtGAc2MWA57xUS8CTAdiMd6byUHDVgQgGX+v0q64x/f3M7oNHj+sra2c2aUwmvgVQWuur2uqIUY2LCPV1q2Q5HkRwj4hpwUxKbDTdiDDiPj4c6LujlgPRSY8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825297; c=relaxed/simple;
	bh=E+xKXS96gqJi1x2qmZfJEDI9wHWkjMvFwVuTmMUiYks=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LLagIpGpwFaELS+UilZkgO5zpWksKB3zNvTWsVCFmNkCu3iHyH5tWdT9wRd9FQ+Fdv8FeK5Yyz9BQSeT30iM7EEMx5DpuO6f4q7Iwkbj3mb05yuJgJQ07zT3aJVMKzTEA66uyGWFKOt//V6p5PuxSbvvgdhZxiSnh0vcvh7SlFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DVxMsuHc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OVhJdHnp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DVxMsuHc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OVhJdHnp"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMieik029830
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=C5hYjCD0xI0xF8Yq8w
	prZU1bh3/Z8oupLbzlQ7ViDpM=; b=DVxMsuHcvzw16vie/8lDDuLM8STbfiGofu
	old4a6yFeIlHyzOZMivVDMv/EqI923WjJA7ur1F79PaeEAVnYnkwV5D9b0lCmKg0
	3eKtBIxgh/wCgf9ipSZXsfyTQywz6xeEWe2nSn4XJMXluPJYhVJO+d/PBsMjptZp
	UO+Xh3ADA3NhfgNGbf+fMK5rqEUFLNjmN8J39PdqQmpKIqPKONRMEVq7NX7Bc8gW
	SzwqMHFjyMKd0xzU93rYtMO/lEsu3npvg7ZRdx+e0hRdL1a+hYVQmkzhASNfmwoy
	e4cJBeBGy/yTkGiNaiUWBasNht2+5WRLGu4KEE1PU5MZLzSWkPgA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y6h10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1wdX6005009
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hm0h-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8kkjqvxoiiqDKBN0kHPoYIRgBKbNhhE1007gfDPUGMl42P4B4aQXN0ff/HLUQc5vFtGkdiSkmzT1bR2j5pwmGA3eUW+r6DxqgXwLtKc4xAFizHXpgAtT3Kp5zGS4i40PONdNiQ77ST//iJhXe1aJlNBexdfU8+ng2M0OWLKkEy+EeBckon8BtHwZFIXGtrQOoAIDOhWzTfOhxcuNiNorhjnUalOyv/MSCZXf72XxEyUYmkwT2Z+wMKyvw4fBMWHjkBov0gJ782F6/z80PJh4y/J+ekO1fKOn+f+ygdnMbNNT7QC198l/x/1s57MAFb4PdacjiivogmiGJEGU19fSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5hYjCD0xI0xF8Yq8wprZU1bh3/Z8oupLbzlQ7ViDpM=;
 b=vUvOWQoh2xOZktkx0TySQ9zj9Gvi79FjiWs2Kzeihv3tJQ5BtBWaupVJ8Pp5yuli0LocmfvgjX5vhrgNoCpcYmAFvXzzi8m6fa1s8XNVaYQtEj5ZZs6ijgbw5KIF48M2eOgZfmY5xOrh3tHHfuPqyAdd8C6KWI8bgemI7TBIsQycv0BoaLKZTUZ+o2m1BeWD1A+l71n0odyIOMH1MpIcxZjVSjbGfJTvcnLL6CGvv/V0JnLDCspomsWzbqWQF86DVML4U0renhpq5ZC64uq428vLFuR4Ho5TVJ/KLX2ivs/0Z3/wZpQ6cwAdKuYoaUIbHZj/+S2S1xeDNUIteD5i/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5hYjCD0xI0xF8Yq8wprZU1bh3/Z8oupLbzlQ7ViDpM=;
 b=OVhJdHnp0ET3sJfWcbPPqVgaz+ehFzP6+FBWux+QMR7t0wvwKzJfn8LfbkB2h7Gi6Y5YjZgQ8Qqa5YqEU+LMUIi9ZZVAldCK0EEY+YQm6OnhmbZ9iQa9yldkYRud3ePn5p2G2Wj7W9KALmG9kCm8KuzyJZDXeBz0WosZntpmJkE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 04:21:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 13/14] test: caller and stackdepth tests for io provider
Date: Wed, 25 Jun 2025 00:21:06 -0400
Message-Id: <20250625042107.13571-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ee4dd3-47c5-4c04-99d6-08ddb39fc21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cftrSOe6goWu0w5PN+MeN+Mup1QF/7HbXw6WBMq8uaqHCV0i1xgv/62ygDRD?=
 =?us-ascii?Q?eiWJhi57AKZoPnsNwrXBj5l4FE/lPFMcOoGw3sgSd/w+rom7Wu7PzRkuhjNb?=
 =?us-ascii?Q?wPOK4cWHb1Q4tK+YLFR5Z/dEZN9nqJHzM13T9h1plW3TPM7Zif7eZ8mgoX3o?=
 =?us-ascii?Q?XON13Kkph64oI2shM+FLenKb8kufYin99UWYamcM61WuaAvXBQwQxWOjpC3W?=
 =?us-ascii?Q?5Uny8KBuNeEbzZpQvbkVutUVtcLc87fCMU3K2rY48AQeaYsZ6dSxRCD8uTUF?=
 =?us-ascii?Q?n2Aj+UULc38UBnmdKLeGCbKXGSoT9ZrFJBiiaaT1ToxBVRDDwyfu0MqR4EZh?=
 =?us-ascii?Q?1i9sVCDsU68X6vfcY0AO9HgHBIZ8YvEQ3TXSKLuToS+Q1Pm+6lb0GgrP5L04?=
 =?us-ascii?Q?Tq2rza+s/CeLAbFWnINfhU8bCMNy3bOBcp7N3xvHRjG2JHPCG8brqOnd13BU?=
 =?us-ascii?Q?UnvZXM2mh5ejpBstkzU/SVQT1VIwzI9Idl1Fl2wni6BqrfKAFUiKzLoO5rxu?=
 =?us-ascii?Q?2F9F0ZdcVOBHbSHfzjC/qebrm1BKMUQqmShDlxHWRrWaWEAE/eosQOeDYx0a?=
 =?us-ascii?Q?LHd2wvM3WHJrpQP/2mIm6MLtMKTD7Jzf1FgM9cXq3bWXuKVrZzzghWYFD0gs?=
 =?us-ascii?Q?Ihj4vnhoptc53B0++fGkBwA7t9PZwYWy3tzM6N569U8rB7Znxmk6vkuQxNBd?=
 =?us-ascii?Q?rd2Tb6PNBD2EvO1dYM6U49+ZjW5TYizeYCsehMzeNFJtXmD4f/4f2CO/Sa2F?=
 =?us-ascii?Q?rFROoEplyrJ6U1/DjTbJbKr+5pe4KPd3UxZq+faR4LJzG7M4bdroLikIvder?=
 =?us-ascii?Q?RLLa0tY+XG15XJcPMw/gr5tDgvOxJBmrIUERqIjKhKt1I7t5c4/CJAht/key?=
 =?us-ascii?Q?tbYEfIVJjxIhaEwuagoj79EKjx0MlSBnVZ6HXQ5qMw4mEeVUakQFlAz0u1hF?=
 =?us-ascii?Q?bBxae5caD6snbuxgBdyZpFSFiwxJ75Z06u5f3Rlsqr/+R7CbEHus5coLeKUk?=
 =?us-ascii?Q?d3Vb0E/86SIxBVDukhY9FNTupFDZ4nGVOiPPIs9ZJBRm2elRr2fjZa8jIkLK?=
 =?us-ascii?Q?sqzOJW54+sBAU2yXop56ooKi5vh6xkx/a1YXMdjs2B3A2CHgjJ0JkOvpZMSr?=
 =?us-ascii?Q?P1XAwNiAfztCi3z+ox/W8OHy+2OnELj7iKgXxn35qympEiQUOciqkBSzqzRv?=
 =?us-ascii?Q?feab3LjL1PTewBIdqHTjRqdIHjJGCBQhpB4UHwCi2jWhC7pSe5mX7e1N9jav?=
 =?us-ascii?Q?gK0HxIMPZorIYZiiLK05hMh8a2ATYQ8opzwwZx805X9sIQ0uCwb8ykJIupiy?=
 =?us-ascii?Q?j6u6VxFxoHimBhC/RKhQb/Owpp0BsPc0GfWnb5V33d/ISfiG/9vmjE3kYjcA?=
 =?us-ascii?Q?YuczPa5hNsXNl7pms+whJ7QhCcXyF31wT9J5nDLUhgU1gNfhl3VcHTegTUpQ?=
 =?us-ascii?Q?gPEI0Qe9YVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ykk8bjgHMnYV+d0RNhDgg4TqnLA1YfoFLP85fXAR4cds5A/CapD6hymnfd7r?=
 =?us-ascii?Q?rGXoVS79XrXTTrk+a3yoXhofN6HLo53UG37J6amhPvbgszOVAA/ELdzOsowq?=
 =?us-ascii?Q?9fqjpUlupueBgf5WN+ATcdYY3bsHi2+MQD8tkfvMWk6dRDwhU3q4/x5/lAxm?=
 =?us-ascii?Q?RnOgppw7zmUsg0usI1uPD02PEqNacdnDZiptpcb1CZJlede+qzGWWrcQT0yt?=
 =?us-ascii?Q?+vi0Pk7ntFTK9facTpHZfD0j+ChqRplis/NypRRBiS9aPm1JH+PVrcwMLAAx?=
 =?us-ascii?Q?mi+Q/7ZtK7Nud7xxgH3kLbR5hl+gVpC3zO9rvtqV4xRh5wl8MmILVJiCl4Sz?=
 =?us-ascii?Q?DkF85wAycbov/4oF4VDRK68oNlJ6z4BBvgLaSg6HS6a1msG6/y3KAnVcXtOV?=
 =?us-ascii?Q?776FRNGdFWq3RekQKcwdLfhzWt6hQ1MFhXCSSHWH3MmxJRZMWz7WIPldZOvY?=
 =?us-ascii?Q?ak6FWBSx9NkPTJ+wbmyanUqnBxJ3ieMXown90oyRWU2lhndsJFGewVuCb8rP?=
 =?us-ascii?Q?bt1d0aEYOKloTxoNNEczGU3aa43pnrqrsPrY6Uzkp0qDNJi5hew262/p7Xqk?=
 =?us-ascii?Q?ZQpQKiMKd0vKvRaixw4Tsxx4c9AzLTuJrC35soCowv2oI6EXp6nS/DpJL+Az?=
 =?us-ascii?Q?U7OKBv917yX4jFUeli6rD76XsGqwdkqrqeEgMeyGq6cvYVBHFMy9L8KelPj+?=
 =?us-ascii?Q?zF+K/Hey8F4GzI/by7JVgNqRjlVDwMDf0IqWNn3IEi8zbFNuoiVOohxjmoVc?=
 =?us-ascii?Q?+ZMrdgsKAfDZrk0oGkazv+IrmdbjqKEzsONg2qv4qCVVnDouCbKsq3JOmmVp?=
 =?us-ascii?Q?NH+O1gfmG6YmQNWYHjnvJgsMlgEEZ2yKTBF70ft8bCAhpidvWmOTjom4O6EB?=
 =?us-ascii?Q?KrJ7IZB8llDE+OFoiJrmS6UnTbGE3jLwgOAfL/v+Mu9XfVXWIGWgO3Lp0Cpl?=
 =?us-ascii?Q?z6eeGvbHZuARrh9jDN6Rc9kXICCn/9kwTn4Ha1ZSMa+yBmG32QhlkVGjIM9Y?=
 =?us-ascii?Q?JIhwU+4wvR3HtA3pCyeUB8hiLZQ6pZh0zsMo1sTTDWsRVI5Xk2h1pV2TJGIR?=
 =?us-ascii?Q?HEZjWrCWT7lR6/+ti3RNpZtWiVEoG4CMe39oBmQwKusXXNIDvUuH25y6GKb7?=
 =?us-ascii?Q?SBx8ugi0r5lKznmxKl7IpXFUyqeL+tsnOuD5B3REbSphT8BBy2u6nSM0zn+y?=
 =?us-ascii?Q?EgiMxwJ47w27FDwDWq0eW8X8B17v5/axbi6YO56IjCEfOJDyAcfPo8ox9fy0?=
 =?us-ascii?Q?Wi1ZjMxu7WCzgAHV5/U+Yg45HQNjs7fsbAJe6LU/s2jTfpgMItJn7+aSFVwa?=
 =?us-ascii?Q?eEpB/XJbGyJZ8AM69mZieaarWOO/tchBDM5bxKByj+oQLBV+ib5NTBBgJt/9?=
 =?us-ascii?Q?2tIqBSoGwdoS5CeSMV6EPUoeeW/vouSPbzT8KggWFXCMW4aeXDks01Pjj59b?=
 =?us-ascii?Q?h5EMgAttstjc2QblMEFzCYqyeCGkm9hifVB2vN1vOkNwyZw0YJIT4Jm9IMpF?=
 =?us-ascii?Q?anUtiM+ZwtNzFQE379HwM4Sk6CNTsq6ykrl3RIqY5dEQ6d+2/hNmG7Twq2ww?=
 =?us-ascii?Q?PBeY6EAk2WkUVMKjJbpFy++gMSd+sIiCcCYbliv7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TDzW2DTgTLyAhew9bFSPPU0uAbLs73fCWo9s+53R3w59qqnvTsqKngaQKSkO3ZP3If/h/H5Xd2gUec12ajn5g8WNgmO/5uR7mLRhdYd5w8Mr6l+LCFKjqcxjjKKCHTwRbI/2mokwd7PMKrmGpXNPo5kg0D2uKqYFeP/et4DWyN8yKyuB9W+2MsNfGyzr8c023hZEiHB3qJ5GQY/bsjCepwxsmWMkmEoLrCPimlo97g7Ape9/Q1wBeL5uRtDoMaY4+B5zOvCm9cu/hNugKPZceSH9q44Trl2LlQwvO5gInMbmZwcIpBoB3PfvNjh/N66rJ8l90E8ZGxBEfRhR7SDuafYSVYlBFvx5/056h4/1LUYoAA35HI1z+jfNodRj3t7FgJiyIzkgS2JSY8SM5PgHiJwS/z2hQ6sn0hPmM70BOxqaBbwviGRQibuoMNdq6rPWUOoSUkTNxFuydOBR3oEGAEm0wSTUTIczQ0CQ0lPgOEeamllzS1VCGQLt+NtTOnuHlaB4FFIKqDsRgxPyCxOJk2U9hwXjDr6Na8zOF5MCoPlPYMjlxhuLrxJBYe9tJS8gUI32Sk2UsgrLoE/hFLii46dy+EUOxcqdHAzFggjSoU4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ee4dd3-47c5-4c04-99d6-08ddb39fc21f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:29.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEPHEYp8+keWKd916fQgVVjbaA5uc0jGDnKfBomVpqD9pVPTqgyHy30HGcTF8PikD7PDJBQlmm3zsmihPLNXdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-ORIG-GUID: 1gaF1RwAeVbP8Fq_ozknF1YJxaTT-kbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX9O/GotbiWiG7 bJ1JW1z6IqEdaRrTZoWxds2ETCACoGYaxSh+cmcr0xiGbrv5+K/7qCIypNdHV+D9fa+dpis24Z2 zo62VlNO8H4CJMgi9KRG2hGXYje/SmEaT37yvcmfWMv/39mvJjAcSG7EOKyL92CVu7QvMwYbg1k
 5PrwAHsJNFTyifVJPi8HwD3Bwb0VGIX1C2yiHhlK0uFLAYEJPO4pIsMh1VxdNbarVUk6p1rGToi HG3irxV3KtpJhmI42ZRuo/qJ4hdygnXrRa9yCb0OSjju3YLaEqT3Y7cK9xoOQTYJ6SmlLsutR/w Bg0JUy6R7dUMznRiuRCZklZN+CveKPvLzn1PTQkZg3Q7KnH046Zu6XyXGVYwR58e1INU53dqjwy
 dcpEmAGoPpOLo4i+t8k2t3XIdoyg0H4FVLQvos+5/oerPP3vVZzZVdQIUKCcUwaacUpeI3JO
X-Proofpoint-GUID: 1gaF1RwAeVbP8Fq_ozknF1YJxaTT-kbM
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685b794e cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tigEIFbzDRcQ18ulKJwA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/variables/bvar/tst.caller-io.r  |  1 +
 .../unittest/variables/bvar/tst.caller-io.r.p |  1 +
 test/unittest/variables/bvar/tst.caller-io.sh | 39 ++++++++++++++++++
 test/unittest/variables/bvar/tst.caller-io.x  |  1 +
 .../variables/bvar/tst.stackdepth-io.r        |  1 +
 .../variables/bvar/tst.stackdepth-io.r.p      |  1 +
 .../variables/bvar/tst.stackdepth-io.sh       | 41 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-io.x        |  1 +
 8 files changed, 86 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-io.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-io.r.p
 create mode 100755 test/unittest/variables/bvar/tst.caller-io.sh
 create mode 120000 test/unittest/variables/bvar/tst.caller-io.x
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-io.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-io.r.p
 create mode 100755 test/unittest/variables/bvar/tst.stackdepth-io.sh
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-io.x

diff --git a/test/unittest/variables/bvar/tst.caller-io.r b/test/unittest/variables/bvar/tst.caller-io.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-io.r.p b/test/unittest/variables/bvar/tst.caller-io.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-io.sh b/test/unittest/variables/bvar/tst.caller-io.sh
new file mode 100755
index 000000000..957406da4
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# Check that 'caller' is consistent with stack().
+
+dtrace=$1
+nblocks=1024
+filesize=$((1024*$nblocks))
+fsoptions="defaults,atime,diratime,nosuid,nodev"
+iodir=$tmpdir/tst-caller-io.$$
+tempfile=`mktemp -u -p $iodir`
+
+trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
+
+# create loopback file system
+dd if=/dev/zero of=$iodir.img bs=1024 count=$((300*$nblocks)) status=none
+mkfs.xfs $iodir.img > /dev/null
+mkdir $iodir
+test/triggers/io-mount-local.sh $iodir xfs $fsoptions
+
+$dtrace $dt_flags -c "test/triggers/doio.sh $tempfile $filesize test/triggers/io-mount-local.sh $iodir xfs $fsoptions" -qn '
+io:::
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}'
+
+exit $?
diff --git a/test/unittest/variables/bvar/tst.caller-io.x b/test/unittest/variables/bvar/tst.caller-io.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.r b/test/unittest/variables/bvar/tst.stackdepth-io.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.r.p b/test/unittest/variables/bvar/tst.stackdepth-io.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.sh b/test/unittest/variables/bvar/tst.stackdepth-io.sh
new file mode 100755
index 000000000..51aeecd16
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# Check that 'stackdepth' is consistent with stack().
+
+dtrace=$1
+nblocks=1024
+filesize=$((1024*$nblocks))
+fsoptions="defaults,atime,diratime,nosuid,nodev"
+iodir=$tmpdir/tst-stackdepth-io.$$
+tempfile=`mktemp -u -p $iodir`
+
+trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
+
+# create loopback file system
+dd if=/dev/zero of=$iodir.img bs=1024 count=$((300*$nblocks)) status=none
+mkfs.xfs $iodir.img > /dev/null
+mkdir $iodir
+test/triggers/io-mount-local.sh $iodir xfs $fsoptions
+
+$dtrace $dt_flags -c "test/triggers/doio.sh $tempfile $filesize test/triggers/io-mount-local.sh $iodir xfs $fsoptions" -qn '
+io:::
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}'
+
+exit $?
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.x b/test/unittest/variables/bvar/tst.stackdepth-io.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
-- 
2.43.5

