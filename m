Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA856BA2E
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257683; cv=fail; b=JO6Qyclj4lNNEbWUDTk/I9QfjARV9VW7B6riWJaf2Gbm5LaWFCHlCu8OQABofGDdlvA7DONKl82tLKCVJDug2Vf5iVnQsuj1Z+5NNFn8NCQyzcIw3xHqIVD40VPYuSl7PCOOubIOXygiLK0z8kGrkzolYGZz29qXTRTmyqJKY2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257683; c=relaxed/simple;
	bh=bh2i36yitJ+ZjjwG65QZECanwWRNJPRs9L1TjqjGHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CyJrefaTGMpWDy2XMRlE98hHg9A294L5cs0dNXh1tl7dFfV2soAEhBmz/37VKb6a2VApgMfZ7Aht8Q41wyMwbHxQF4BOsawgFV6FMwU8fZqJeDtS2+rZo/Gx+/JT609b8wYxa/UjdHjlNw7h0ix+gu/rYzdYHDjV6MgqDCYxnxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YwCbNmNb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OPAfa868; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YwCbNmNb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OPAfa868"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DJ0oZj004386
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 20:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=MJbWXK503emM21/
	1lfrwonw/DwOOKf0MvRdWfMqSnbk=; b=YwCbNmNbgFMKTIwYDa6x7JpOPhFdBSK
	53vN0nOv4g7PO8mM4WigK/uVzKAiGYU69v3JXDIt96reX0GTLuHduIAtN8FVnQ42
	k5qB2svm0jJGb3eiUwcySapXlOpheQnUg/mXlm32BO/P5Y/RXFkDVKmb1C5Al9Da
	XXltaj97Ttb4prOzx95OMafVAlg8+IUpEIfExJOnwPj2HPnc8559JwAOaIAaglxj
	KV0AvX52H6zRzknFJbPxK3OfhBo0iS8KXtvGMvAoG1teoy9943JtmuHEr6HbpzLd
	Z8VAbqbZ3IeB0ofoAlqEY+Z8TGnpkwO8XsG+6LA9Fg+luqB1m4F3Gyw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gd8d69v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 20:01:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48DJLnbQ033605
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 20:01:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9d3bwp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 20:01:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoNigWonph8ZPLZ2YVtddBbmbaCMLTcNT+o0jqzAoNujERj/AYfIO9iYAqvlejGQhn5xsFwNkB02+frFeMLl/G5b9CsJvw47cUjlV0aaPUYgYTYlFY46GjSroyW3+/KUui1wR2j8cP4ovHB0MyZJ44wct92u7TCgjAmPlh0MA64Nut+FGCgdEKPEaQ3XBbPpNPBtQE3Z2G3FZ9cX2ngMB/nOm+SdU0E/yUytdFysTRgxE6KQj2Apw/NyCZ6IqFephZTAeFYdWtkj30dsp4UjrdFZhQnMEUD4Kwnr8SVg2ET//SHjdh7TMvFEGV1QjCDdcguio13f4EaDTFkJmfb7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJbWXK503emM21/1lfrwonw/DwOOKf0MvRdWfMqSnbk=;
 b=p7nHJdHtb7ldoGMSE2aGK8fikaNjewqldcBleDDuJoVkthxoGjoBc2RhcCV7Xr+ghesSPuaDqoOd4W826hHNVM6Sjfwx2T6qNE1lOqyYGAiDLADWSN59Zs/2/4nLpXoUehJLgUPpqK5v6hMAfn8LaVeGqqtYVlcSiIOoqE5jcTE6nHT0f8Uv8fT0OvTPjtMCuKDw/L0dSo+zS+6vOkkPmm4OG1ESbJxUy5Qh8kEut2yS8IsV1+H85wLhbgR6f4B3TpnnDRFMOR4GZX1oTYeVxupIikFrwYJ/8Bziu8Tg4QhsjbzlPISYu3s7VlwesOmzuxRBCVN6bkU6VmpssFzs6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJbWXK503emM21/1lfrwonw/DwOOKf0MvRdWfMqSnbk=;
 b=OPAfa868nPx67QEDQWlakznS4nTgx3ztpZGlOJcwGuKP6SL4XQLLTsidpX3RmOAe7tnf+YZRXH1uSyCKIh/h5yY14cTiVQ5Tyay823N7HeTGg5iEK9mxpaRjV6FJS/nbsPt/rG0RGT2c1VJiTJXLneLCTAjQaBCrfDB3m6gX8Rc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH2PR10MB4359.namprd10.prod.outlook.com (2603:10b6:610:af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.8; Fri, 13 Sep
 2024 20:01:16 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Fri, 13 Sep 2024
 20:01:16 +0000
Date: Fri, 13 Sep 2024 16:01:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 06/22] Fix provider lookup to use prv not prb
Message-ID: <ZuSaCUfQdc/IW6XP@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-6-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0282.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH2PR10MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: b1eae944-e8f4-4444-0e98-08dcd42ed35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W7jjNMJ1HxvgcsATRbR9+4jtZI69LPIivTfHd1cyGomCFJHuhZiEVFlKK1Sk?=
 =?us-ascii?Q?kicdph+PmTSs8vz9lEI8UZfgIj+AWVyZWz59Wq1qIa51fyRgaUQkE64rh4Yg?=
 =?us-ascii?Q?ZZm3dG+vABJrzkKKdikMddpIJYbvjPNpWfpSCxy+IaI0JU7nXeq0hgyM+gKW?=
 =?us-ascii?Q?btr5t/2IlTFTzKqp7auBdg0qObnScezKTu43uIDSZogs41ShfpUqJN1dwDH7?=
 =?us-ascii?Q?vRALNPH7qswmcwdZ3SajJ5Ri4aXtlqFc+FmRjdbt1/EDJBylc74S2Lhe+uy/?=
 =?us-ascii?Q?izJFZtlNaGDT2WpGNuhX1gTyEetfGzd4MRlYz+aCesAGGWeNmmkMgGGBCylK?=
 =?us-ascii?Q?CQHx+8jdqFsXUgQskH8qaUDZE+DigJDQ9xiHICoG4uMWqdFiloLB9eNmefE/?=
 =?us-ascii?Q?V2OjGvQI7oEraMvyC29M04gatfYrOPvxfg2LZaH1cKmsyiQ64uhpvpkiyldZ?=
 =?us-ascii?Q?QItJL2wP9WTXr1ysdiHsHocO5vO3n1VCAfHMxi4MxdSN6yZqjesHK+M2lWSG?=
 =?us-ascii?Q?tEkbyziWvwgwFZrqlgGE4RWL0nn/kpo2pqMmzNn1EBvcuriIccgwxsoNwdq+?=
 =?us-ascii?Q?RNiDrdabCFnhE2tD6Ewg425NLX1+YeTzJ0nBBJ/5urQHXpVSXkhmpXVcpEHv?=
 =?us-ascii?Q?+X7/XDm3A5dwIX6AoftHc0O2moHrz9KBbyXccFInqzE+tmcAx+bYbi03ApfY?=
 =?us-ascii?Q?nXil4hJTiaE07LiYRuylt6Vgxpe/InCiGbkCzqHtgZu58P0E1F0gC+XSXE4g?=
 =?us-ascii?Q?Au50yVL35bN4M7qHV9BnRVN3ouibFr60NvI9VGEdNYYvM0XHF/2uJnpQ3htx?=
 =?us-ascii?Q?M3O5liAIR62YWVaxEkIsb1e435Q2fQF0tW2EmyRYy3j8hwgNOiOzj95e4NAh?=
 =?us-ascii?Q?I9Lwhf2jsW+0Ekiv4h5leXorLDJ999/gIu8pgnGBBOLB4z4yNrXCUcEi+1MZ?=
 =?us-ascii?Q?KPkLaSXbtKKyH46QKpG7Yr0dBaAz1u3GLiq2x3ywM/lSfq0WsyeCimOS3Tvk?=
 =?us-ascii?Q?7nTgBhgH00yAaQntgFGMjXdd5RZnl3yyhmy2LTihRrF22T1APjZayIxADJvh?=
 =?us-ascii?Q?Ezeq49xZuhOvl1MeY7F9WkS5nyOztDRHDOfixcswfr2QnomUn6WaUscTO3j8?=
 =?us-ascii?Q?8AbtPZiiGlYo0TfQIajrLJit/BMVhGfYatgr0T6oHRGdfgYx6tUyJ9mCG4nu?=
 =?us-ascii?Q?7RX3VkbxppbKTEWy4YiONWWXWCWBaW8httIuAcdQRht8nQkqBF0et2aIh05D?=
 =?us-ascii?Q?w6xKRgTWQ85sgPU/W8bCNkVAVjChWqHSCGlBdWAMCGehvOUuK2gEbORMOKg3?=
 =?us-ascii?Q?bDisoCUZauJtx9W+1K+XllsSVwDBfKdtxmFLIs+OEiZsBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rA6Z7aRYzMNy9hOLd6Kh5MAD6sNT6cMcOdi/yKklJifb0h9TO5ufwSf0+YLG?=
 =?us-ascii?Q?fFmziRw0ACNgUZMsqMm1JO+BjACk7vF8tUaJuzaQxtygBistWV+fd8juCAFH?=
 =?us-ascii?Q?6AiZkyFOZInxDvF8LKmVI+EwRxAkDWxIQqpYUscY/i7AaKSEPmzSJFMVuqqa?=
 =?us-ascii?Q?dO6Ly63ZXG0FQE7HTDzVVH86CLKeOhCXV3CPGly96HfHNIxNvyeOw6soatoV?=
 =?us-ascii?Q?s1k/v7QPsZwi8Z7CnvQPTBGBE+51a0K+BHoiZ2f3vmVEMvwZAvXsXn/5BKpm?=
 =?us-ascii?Q?xzjdu2mV0bZyCkOiDCve/HYsF7HgaOQf2W10mLkNyVpb90qPn5Ml7AM36moL?=
 =?us-ascii?Q?vRJxwYmurLgsRRwBS6LUm/tt2qsM/Av3Mz28SdwL34NoAIrW9G0EBlSFcJCs?=
 =?us-ascii?Q?4nu+LYj9it2nFA8ARueLSGamnPrWBuwte+hb90dBKAji3/RP/CIwgQhXedRi?=
 =?us-ascii?Q?rc3WvzwyQGnQ65Uhy+xkXXA5l9ESeGcOwlqYEqWbK2XDx5KuiP3r+InOIO0b?=
 =?us-ascii?Q?jwdIb3r8oqUUrvEnkFl+OUBEKW6GuCSYQH2VDvFJwl4zUDxKDs1DJffHfNcX?=
 =?us-ascii?Q?iuD1ZrAnj6HiJnKyIhNdmYEMKGukyoUEFNuqozcUC1U9jnD4crMJQKXZohcO?=
 =?us-ascii?Q?2jMItcMOADdaPOYnvyJz3V7a2tTqXzTNtqeIUskM70abhN0xGM7syrJV5h75?=
 =?us-ascii?Q?3mvWfo0vD/67Whd+NZ+ZZ729qeI9kQKkfhdvartpO9PT3AhMDPhbh4xtAFg1?=
 =?us-ascii?Q?tNNdhaZE0WrJs8WZ5J7LdWFeSDWhZGcseKyneKUeCWL7AhNzod6ELMvt/10+?=
 =?us-ascii?Q?LXWYfx4FQ3ijMDH9IKY0B8cI7LA0htqNCTExYJID241pP7o6KFGRtxk22825?=
 =?us-ascii?Q?5ihwZSxqiEd7x6/JImQTn0/JGFZHdR6yWg5RNsvqxPpAmzfgfnmbysiqKw1C?=
 =?us-ascii?Q?EqO9DhY2U3Gm/uyNLwczNe71o9CZZLDZCp+wlYURr3r7z8zsw1L9vKrxq+dR?=
 =?us-ascii?Q?NJU/+760xV1lOQBmeEN0IkR64oEapK1T+lIS8iZp32xEvpYtAs3P1BbrUHYG?=
 =?us-ascii?Q?NteWQloCZ6AwtxtUQlbKg06c2p7qulHlAEOH3nJ1IuD+Q9OTkrjtUifAc4jw?=
 =?us-ascii?Q?/Hg3OSjxVKs5sf/S3yPa9ISmGFHoxBMkssQibP8kX/TxENJX3I7+IBOxiwE9?=
 =?us-ascii?Q?t5WqbgH69yNW5rpA/6Mqkcp3NgQ73GP+1904FP7nZ72u4z5gkIkTsxABmiru?=
 =?us-ascii?Q?XSi34j+xt6axD0nlWc7gqtL4oWVm3cLtCzbQAvMQUwJwe6N6KGI1x1G8/lGw?=
 =?us-ascii?Q?pmlwcFubp6LNyPu+IYBdAMBwcZ5n8V7USi6AEoXQrNnM1O9+X/qmmXk9Ts5g?=
 =?us-ascii?Q?ckUVjnTnJqbTOH2CVendNnWOCFmFInRcSjphylxCtgsqG5ATq8H8rPHiIOsP?=
 =?us-ascii?Q?jt/lAAal9YU9Q4F09zeWZTxzZfxqU/4ioNSKtRiM02y3Jkuyzo78Lnwq1ZpR?=
 =?us-ascii?Q?ovw4t10MNk6FTf2weBVoHBxiFuhJg1mRz4hRQTZHvNlZpNt7xlaYgOEDvj46?=
 =?us-ascii?Q?prTykDhDl6ej0Plk88jIE4TJgZqRo8YblzJmq+L/xpISQQVCREU7ZwxQmOYp?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xUHrbItgYGRdMMrxx/1J8JyxvS0nbVm6tCf/rOsOZpCOswj+0EQtq2pg54De+5ad/sNE/EgiWLWZ5Sey/c9fhS/SPaP0KpKPMX7xfn3d029we6KvEz8q1hoxU9d0EvqnrTMn2+04DFMiHvFt9Lw6M7SXVYGundqrLM4OtaFKNuObA8Gi5bDi5HnK5sc9afGlO7W4mCjWloIDw5J5invs13ra/VYfzmHQFC2ALWb2S/LiNJTRAKgb6OsMv0eF2bQjgjVLKixmwUiAiGanNdck8mp7L6bz9tmVBa/2MuG3aGWlvg3gXU3QKosPZRAtiOVCHrt3loDqz2ztIVcA9YlB8Usi5z3f4kJJ07q07Al+edvGKyF1wZ0wQW8461T1ykVNQFIl4yyXz1ZyhF/8uSiXPugNWFZ2DRV/sk+an+FQqytZCiDS/fEPQMu0uSwTh34fO7I1hKBpxy9bDB6SEz1oxyBHHVwpu9HdZcukkB2ZEvIbVFGZdmmTEpU388tPREfu2xcOTRNKcIJUJ9SSaaSvFFwY5SherHIalxE7j59hrFVxfZajZXB0f9yhYo0OnP6YJlVRZ1uIwAe8uLvsSoZJkmqTx4B2MldEEgZmSYQkLNE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eae944-e8f4-4444-0e98-08dcd42ed35a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 20:01:16.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UNLuFBYpdlmsY849sIR21pUBOM1TdF2+5dcd2oiYZ6DS/axE5ZxTdjCKm8ot0aRQNnmJvZRXIsGeItnTvIVDDYMKf7n65O2Z4PwztJfOZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4359
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_11,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409130141
X-Proofpoint-ORIG-GUID: Vtm7tv79lgxSIJ5JHykzGBjk9V8RGbcY
X-Proofpoint-GUID: Vtm7tv79lgxSIJ5JHykzGBjk9V8RGbcY

On Thu, Aug 29, 2024 at 01:22:03AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 09a9ae58..cbde6a48 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -247,7 +247,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	pd.prb = prb;
>  
>  	/* Get (or create) the provider for the PID of the probe. */
> -	pvp = dt_provider_lookup(dtp, pd.prb);
> +	pvp = dt_provider_lookup(dtp, pd.prv);
>  	if (pvp == NULL) {
>  		pvp = dt_provider_create(dtp, pd.prv, pvops, &pattr, NULL);
>  		if (pvp == NULL)
> -- 
> 2.43.5
> 
