Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3B01E487
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726328468; cv=fail; b=q0M32ceutOQMM8SQwutoiy91jp3ufwCOkkQX5daHQkige+oPdfgq0pFesp2cghZramMAM0DiLybF+oLqLWiT06QdJC1qamG/veOazZl9vbHWCEG0EALkH6C1kYjI8sSO2zjSlegrA55jYJj2f/m2cFOpY3EEahSbH0oMlGf21VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726328468; c=relaxed/simple;
	bh=DCDislLwQnXH3i6epY27QnNhyHtyUMw5SnWa+u6GGcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QSQqra1uqF9flMkulge+UeckLx0YF/+Av+nsEL0KCC2Sk42/uBZ7ozW+BOuX84StUjI8CM36isvxjA1eld17fSnj1tGM6kY+tx/FMkwEtA0+OLtVJr4gzmlppPWvvWev98czZvmzbc5TKqkJqTbKSWR/EQhZ0yGhlUvEaGBk9RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NzIeTTN5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZiJxfip+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NzIeTTN5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZiJxfip+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EFbW14008301
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=FshMPsRrKYxvJE8
	IIdGiKQn+uxkicvdL1OxgA1w+ET4=; b=NzIeTTN5gbT1vLdrr4AMkEjNFodEa7p
	tSMkB+R5l0Q0C+lPFESiPkVO6rgg867VvXsZrDWGed5fjPRzD8ou0RJwkJ4c+nxH
	hA6eZNCPPEU3ym7xBv447NyJ6rXT2BAjG0tyC76TIJbaol51y/S+pA3Soi4Na8Ix
	q97onxEy5idQ06qfSK40+1Ln3TpelEAyWch3OuY9ag9XPf5iL6GAhTzhQQi4w09C
	56N00MUfoDQgrO97a0sz+T0l/VqOImx/r9M26sbRu10D5eaCcidQI9hWpQpQA7PT
	ZqAp2PnaEjh3xz2iMZnNHDVINFGwVJatL32ygVmqY20rZN3g1vLsqaA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n38jks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:40:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EF6Pf2002180
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:40:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6c0h0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6xsLjEW0AYOTLXX1swzb8a1a/QHGPy+V+bxEROqPA3aT6MfBR81aYxlF+2vv8KfPcdcs+kvToCmn7mGcqB7R56MR4IPkHQNcUg+qnjh4DjAu+OZUS9fL+MDWGClIc+H2vzzFpNfVe7BH3ErijnCuGMkz5+q6kRT7FkXg0I2wa+q0boII6mAxweVhW8muske8AlaerOIabqSoHk2LmzE8CtEYce+WLvpxF2Xe8ED/b1XCyY2AyhMgzaGLStR9tI8ejWL6Tp5WkXc/BvBsX9WVOo+tR75S5TkKr/Bmbet/zSgFZvdEUP1sCwnP/Jl7hVVLB1grFIjFlRE4/ZM8na4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FshMPsRrKYxvJE8IIdGiKQn+uxkicvdL1OxgA1w+ET4=;
 b=YSPQiHVM8Kh23ppvX2OP5Q28wIsOauiRv2ZN/BxsJ/YSQjA+G7j8HowKIjHSX7d5DeRs7Ew+mY15k4o++1B/1LlJQWbDRgMbeCQy1B2NrBzeZi2ntzRR6vYeMtjnydJOin6d3VWalPMUWuik71zf/buE3oQOxNbev7ygbqzui/ZtX6v+23dVpW4kf4b2uR9PF9PTLwj1/SgPTerzIs0zvS/ofvVYI18IKHVjbgbE/V+3JzyCrSag29oP41I86gJ4abyYDp4J0znk03WMU7aso36ecqvxxxc+DIrHsirX+FeM68byDoUzrnbPjajYoMUWwZsSDg3QrdLW5camUMVgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FshMPsRrKYxvJE8IIdGiKQn+uxkicvdL1OxgA1w+ET4=;
 b=ZiJxfip+VZHgJSyWLdbH4g8fAF5DamXkm0OiK1lJIev9fWbkeJl/6xYWJMKZc72cS1IfV42aXzlWRIj9BZq4NhIOXFnKwHM27Qu26h+HLDPYBuFVeenIpWS1kGS91K3QQm+ZNskaIWmgyyENb70NIecOL4FV0XJHBaeKxweGB7c=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7229.namprd10.prod.outlook.com (2603:10b6:208:400::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 15:40:53 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 15:40:53 +0000
Date: Sat, 14 Sep 2024 11:40:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 09/22] Clean up dtsd_* members
Message-ID: <ZuWugCsPZoTYsQ4M@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-9-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-9-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e935f8-639c-4a04-ff66-08dcd4d39def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OQ07aD+xlBNvkD4/yReVhEuBzadYbVFHKSAoQsV+usGQk/mgvJFUh6fxIa1P?=
 =?us-ascii?Q?y8dhgnE73mURTX3i3PTYvMqqIlRWQwQCcpSDy+ZrUT4jfe47BhnYz3D6+5Oz?=
 =?us-ascii?Q?NkqcVoK/y1cOdksIT64qRmyZ90NzE4yk+Cd8uOQGvSrxEBHZq5vHXBPz297I?=
 =?us-ascii?Q?wyRVCvfVKpmlHD3QlJWly8VqtFdXGfBxofLGTf1dYCzMkhH5z+ZDyKAOtPOV?=
 =?us-ascii?Q?R9ALQnmJ6MvNbR+9k3PT6mw2iSNawwsyGZ/Ko3UsdSNgKdMrjnp6mMKBUzWn?=
 =?us-ascii?Q?TxNMHLg3bxcbt+pO+3YpMj3I6ekx2U6nvdEM77OVSxhKs48MZdsIbD20WKQb?=
 =?us-ascii?Q?T9j4oIXQZEuOpwnCrUuyxweYOgpP/ykd+SEJfs2BeYzmvXcDymwBFebWhvAU?=
 =?us-ascii?Q?EGzAYXpNJgF12I4EtvlyoDy5h/TaklwfEW9JAf3djrKdjSw6WC9NirTfbE3/?=
 =?us-ascii?Q?WFCjdUQLQDTSn/ttJWPGoUzkUy8Mmruvnpu6oD3M3fr6ftrlmxLDJwzttzra?=
 =?us-ascii?Q?9BjArhKYmhPcrT9Yya97D9OZFJBWVmduWyJQK5ZFEO1PdwyNbOp11/gUFq9C?=
 =?us-ascii?Q?hTuDBVtB9ajx1k3rEttTgXo8DqdXYq1EA9qpgFFwN0jMqxEPF+kT8h8xck9s?=
 =?us-ascii?Q?dp/fEq1L3HcR9WQ24VwPvaJV0dzfenVOAKgSwphT06+EsB6hxeNlSOHAPONN?=
 =?us-ascii?Q?MparLl//wfcXgrTkO/dkg0LsxWoFnpWoNLacTMXatsSizYSsgL+ZuvTzt1UA?=
 =?us-ascii?Q?7S3Xq89kXCkjLU9t3/JFVYvrplEoA7tmA7qt9Symfbd8IVCJ4TPez2RzvhAJ?=
 =?us-ascii?Q?X04Eeqbm4QqJyE8B8xsLhQ0LJ/MWqoouWPt32rfOpvoIQtVAnqhtD3RDiPU0?=
 =?us-ascii?Q?QgeIq+k0YQ0yB7GyqUp6uRGuQo9/HvgkRmZaCjaYnvjr9tqN01ZtGjFX2Cl5?=
 =?us-ascii?Q?fEnEWzkfU7s3efjjlkRdsvgQywOlmClQi8+9IYWn+NT2mAd4HRWSKKx0p63X?=
 =?us-ascii?Q?M7qAz52zSx09NtMaGkBq+bYIGC5+NtrVcKlkIiNoDYAhTAqNj7T+bFgWPlG4?=
 =?us-ascii?Q?sAc3F1l+L0n8p+7maIoVF/BSjROv0T0cmWD5XJS7ZG+/+kUG9sMy8WEA5NRO?=
 =?us-ascii?Q?UqJKSmVvgMV6EhtbopouUdutC7kw34XfJhwEe4BjAze5lvUXfuL6xoSSOtI4?=
 =?us-ascii?Q?ndZZ/MOSyCBxzW+/rgKP9XiUB5LX0iHH1L6XPJt+zhkDuhDdo5MDE0OMzrmb?=
 =?us-ascii?Q?OQHRRbPsYYLGBQDOYx7eJZ3fPfzbA7MnrZFqrDHeQyErCuLkuI8RVSGREZUs?=
 =?us-ascii?Q?hzycZwZlSTWqo/xkKDkYSJNRX530vTSGoLsSyDBO5KiE7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QrvC+9mIWLA0yBl4xXDoDfQrx2FIsb3ng95Ww/7KGy28hJykkyTyr6h8L8br?=
 =?us-ascii?Q?REAoq42DRVRhl3vZjYfJ/ru6HCq+R+vYrUdCnLsFWeh/eigPezIV2eh00ctu?=
 =?us-ascii?Q?Lmz5t3lweoL7i/L7SEiakICd2NCWdh+MTcCVQ5JAT+vFZqHps1euVyI57c1b?=
 =?us-ascii?Q?4yZMf+Dgwspwly6Gfc2PbcwCo0jTTLCgtUy0EYsF4PXi0rsLBybrdmto9Tlb?=
 =?us-ascii?Q?SVaVKju6kHV83sd7QLRiStR4/tLrYYocOaoTEXB3IkfdNMXnu7NfzyHH6yyK?=
 =?us-ascii?Q?7vA3Ja5JbX8/DhpSZ8h1JAckNtICKGBwr4rz5ljBAtaJTLvf5w4/Q3Qbj/Wd?=
 =?us-ascii?Q?7mKJD35flRKge3J7K0bGkzXb3WmwS//OLS6aicQP4Pda4eZ3aYoFR1QCaKRC?=
 =?us-ascii?Q?z0DfxleGusbUMNko7XqWRqvWedyGOC+MD89+JdqQzgCFH8Gx+B8jLQi9cjlK?=
 =?us-ascii?Q?8VyUIn8dIVx0fBfYDxkeTF3W+Iuj8C67/BWm23k4vjn7LCHtkeyaTzUwNdBH?=
 =?us-ascii?Q?+7FspYdnrR2HT6hWipJihSADsCEmwpwHz2STm6CdxGG73EhIPwlX/mCP0AeX?=
 =?us-ascii?Q?wgJmHeVQ1gXPa7FowAGAyZDTx5O7iKdVKZvND8pfjTdMAlI6/p18VlIYU4iH?=
 =?us-ascii?Q?gx0565cHj/ULbwxCiyKgl1iOG6vllKPsK+5Z9D+yvrsN3n7eXkacdmPYFbql?=
 =?us-ascii?Q?lBE9KhDKRvVuCD8ru+AYGmpBrD0ZKQ4GCdcX72iA3Mh6/WKQqOAMmBx5poM5?=
 =?us-ascii?Q?fX8aoz4Mv3EuiS2g6pNCIesAQbM8R5qJZFVmMz43cYK163BUr/Ja1kM+rlm5?=
 =?us-ascii?Q?AuAc+t0AQqjhwIHUPSgy/8k7YwYHTekyboazrk4nAum7lgRV5ZfFZmmb3fdE?=
 =?us-ascii?Q?r/dgLz/Mv2fmFeA0KTC+chspcnNHySE2fuButfACoCGjgaq3nCMWB7MIrXrR?=
 =?us-ascii?Q?i+PbzLObn2TSR2emdOgevBDoHszE9j6mqMc2im/vyJ2zW5E1e3XvD/552DWS?=
 =?us-ascii?Q?s6tJ7XA8Ywz4mW5Uo3mZXeRMr1yltfem4QxkAk/cutmuIJ+Yiw4p2xeL8wjZ?=
 =?us-ascii?Q?rHtJpLFZ2DD2cceIQOZU2UUI/kwCV/0iS4MyCdtG8Sq1aUa7OU/+uc9m3QqD?=
 =?us-ascii?Q?aJdAi9LrVLIUmM9hzBXrMIm4XCMSHH3HaDh/XA4Ja4z0UIp8UUeIqyq3+C6d?=
 =?us-ascii?Q?M93m5sEnm2R8cvaRBoIxjnG4HxVDwPoHpgs1HUC9NdvN0T+J1RU3qTSUIuZr?=
 =?us-ascii?Q?7DVf8HWit4TAL8komfzCxSZ9/Ojxu2n8pgKe+5dlvA2uH64uGK2vlIuVKEpW?=
 =?us-ascii?Q?3wfOpFrNWQ7c+uLxaKwPgoqL8Wd0JDv/XunbhRVZOEWBXjKxglKKw9ngLuJ9?=
 =?us-ascii?Q?+YaZLX/4GtCQMm9rnDPpOwPsSa8OWzGfJCStQrPJU0uiWet5cRKupUEkz4yi?=
 =?us-ascii?Q?pyaIWawyXj/20Xmv6n2+UjHg2Gh4apvfTf+hcdz8rSddzZM2Xsdfz0HR8TY+?=
 =?us-ascii?Q?jn25ovvKvSdKIxMnHndeZjEMvipf+nHurcHxkZ57FgtfdLMIgNpEFATmx/o4?=
 =?us-ascii?Q?f3QViIhvo2tOvgvKP3xx6znqowkNDTCMzb297cSDOQO6LcebfRyeP//T1U8Q?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I5M14R/jTHL4WH+xibjxaY/ZUjI+j5l/KAQJHhtY5VVvAunxAHrqOIFqa0NJR2DNguj+myiFiZzYWyivHjximr8ujy+/sFG46nTNmZaGgPmkVvTbAaU7IjbxUJl75swRr7kxv2nOctuMEGXu9k66FiUDIzKyQX0FDnF36Kf3r+jTRoaEg++wT0DztSqISNblWMMb6n+tTjeVjRCRS835htPHsXdCWTBKeiboV+YYGciNTGCbMpP3mVSNNdGHhcByIrN5DTMLeswTGuD6eDBd4umHT/qJ55+m5J6fLbyH74sEdOlfm2T5LTMayhivbZ8lm3bpCQhf4B6jsMFIJFCce1Ihs8ZNsKGv0C3l2Dk3ozJMnNbpqfG8EEG2O06BkmvfYBdEltt7c4fbfSB152nwVekVn/NFjg8i7eAhOVNdaP6pLNxhzrRVnRu6luuBNfQQ+VPo0RQAPZwf8Vsb74197nt+Qgs/iuMi0Z61vQVQUkDnjnbyWw3XRA06ozNaZT9xemZh11+YuMcnkbCFZ5EiZCZEnIoDvDqx01ttflyfIdFf8pm3iQCLvGa4Am93GeSPqBe5TVLdk9DDQFJnNa/h86wHYDviQNYngj8ftXZScnM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e935f8-639c-4a04-ff66-08dcd4d39def
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 15:40:53.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Azp7x1MuNS2MIdCAxoEbB0SIpbjzkIgp5WsgADrqM7Jgg/vYW8t2XERM4hVHCyT+jD8s1k39DhS8YC6T6aEVITzIDg0xCI7YxxxKwshVzxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140110
X-Proofpoint-GUID: tdiPGR3GNb2rFzfX4mkHGDpzpZCk4qEX
X-Proofpoint-ORIG-GUID: tdiPGR3GNb2rFzfX4mkHGDpzpZCk4qEX

On Thu, Aug 29, 2024 at 01:22:06AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dtrace.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index 8f40a581..09a87977 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -146,10 +146,7 @@ extern void *dtrace_geterr_dof(dtrace_hdl_t *dtp);
>  typedef struct dtrace_stmtdesc {
>  	dtrace_ecbdesc_t *dtsd_ecbdesc;		/* ECB description */
>  	struct dt_ident *dtsd_clause;		/* clause identifier */
> -	void *dtsd_aggdata;			/* aggregation data */
> -	void *dtsd_fmtdata;			/* type-specific output data */
> -	void (*dtsd_callback)();		/* callback function for EPID */
> -	void *dtsd_data;			/* callback data pointer */
> +	void *dtsd_fmtdata;			/* type-specific output data */    /* FIXME: dead code */
>  	dtrace_attribute_t dtsd_descattr;	/* probedesc attributes */
>  	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
>  	int dtsd_clauseflags;			/* clause flags */
> -- 
> 2.43.5
> 
