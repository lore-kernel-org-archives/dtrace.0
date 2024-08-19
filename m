Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE43C6BA
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109355; cv=fail; b=sbHuxaviUCuuEsdDm2YypUQOCMURlT35zKp/Fh2o19awbEOnaFsjY8T2bA1vSBIQloyUk/+ACTQUxHX7BnhfyLn9z+UarNavfpHnSEsL+PpPzYfhH8ZQhcPhp8SxaHEfYWzuV5CcDBeIlUa5tcl509cWWIh5TtK+UxMqYetA7Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109355; c=relaxed/simple;
	bh=FvpNxpMjT+O+xIBMDtj7qMsC6mAzNJrZ4oRVA5ywkIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tq232nojj3tgBTrr51Nyjz9a8lL1aKDzVq1rvLz6LzPbiWEMSBljKpjVDG/K2E9EhuMlx/NOdzLlek8fJa/TyK4aJyyRa+twnx8PdDGnrLyeL7yxxZcLr5JkrY3pu5zmVLITGuR8JKdpVk1mzU0S7dbwOuTlEWr7h2DeRb1f8mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=efYrIkOq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l8ZGkFa/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="efYrIkOq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l8ZGkFa/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKH8G022328
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=w+9Ph0APncEr9pI
	X2q60Tv9mImVx1hJjGMVyp7Wyj2o=; b=efYrIkOq2mEFr0/BjoLbSBl+8dXneVf
	EDrvq4mDdwVIfwf13qAI1Y/acJC9/8mhmqlL8CPYjsIARZTfH1Rq4cgxB+UU56s1
	iFmryFmbpBhX2uUdsEYaySjIjg+PtAvgqzL2eNTUDufcQH2E97qSlp4WP61disrM
	cMIks9x2/V2E4ntRewnAGgL2hX/E/qDbo0hl4UyXxyD0bC6wp2X2DBvyXlY220sT
	TNovazcFJhBg6zNIFkTYbkP4LYMy4NUuIFW+TuwPuWgL/hkd+4/Q1FUVFBQBhL96
	alm/efFzBhKaRO6b1jkh67c39dc5TJOjgA8Y9PbYnMfeFlg0wCe79dw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3dkusa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMx6uo027532
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414faw0e19-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJmrlou7OWs8csPjT2LLLs+tHRVZgwNBVOd0y2U/DRDdyJW2omVrFrsEKrC/4NCdiWZKWK8v38HbCGHsXmmKzljUjk/EMALs5Fp1EuriMDmlqQJN3M6PPISTEW7g+9QVNLBT9xJL10ABA88z/Uw2ioqXVdUmw8rdMyxCBixIheorq373mDqrP57HBzDZu/unMeYJKVYNWBoX24Pn3j+85DKWXRyZcGUp8OzJK6a3diSuO9OGj45hlwhI8hGdIeScnoXP5XlI7e8WAykKNjAdXEnT74acHc4eCbZefaCEJ/G2O1vEoQBSW166gCfsIa3kpe91U3wZ9kDhQiFXCOeifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+9Ph0APncEr9pIX2q60Tv9mImVx1hJjGMVyp7Wyj2o=;
 b=fcicHFS2s8aB0E4yNtQltrn/SZGSFs7cx6LVPVi6Xw4pBBXBDGiMQ1jkGFrx+EKdXNBZWjKs5tScWMlrNPPj+5Lf3jF79Qid6ER2Zh8M+dJHCNGfYp0inIPNBDRb7duIKny9kiThHVbpb6VJ9qwy10t8j1n7Bo4HzKcL1TZva91HFKgQALOF32yOfUWG1NHAJqtgHD0KSkUuJuHGnKWivF8nZW3Gq47o0mfz6BsnycrTAGysIj7aieiu1b6BiP7DGQzStEZmyau6YO4NAoC29LuVHszei9ttTJ6U63lkA5ekmSvOFmj8IGxjon8TozzYhyammG2BtnIADh/sUaTNPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+9Ph0APncEr9pIX2q60Tv9mImVx1hJjGMVyp7Wyj2o=;
 b=l8ZGkFa/PJGgx8fHqa4GEIcg92mTNMAhCH+5kdpxQTkKUwgmbo4+lJ0Ni9n+TvJCQ3PrdBppvB23E5CaVUuvwFoQJFVbHndQ2ZR5TFQRCb5FnSQjXZjW4EqnBJ6y9ulSEHjzinjGguI1iQFoyVloDOkNA5FcEcrUYUhd1nwJpBQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH8PR10MB6291.namprd10.prod.outlook.com (2603:10b6:510:1c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.11; Mon, 19 Aug
 2024 23:15:48 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:15:47 +0000
Date: Mon, 19 Aug 2024 19:15:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/8] test: Fix nonexistent @@sort option
Message-ID: <ZsPSIGyOy7Q5tTCv@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH8PR10MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dc09f3-f42b-48b4-72f6-08dcc0a4dc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SHiXrci0eczdkSn3uskh7BdUv2RTbjRH8B+7Cp89fHTTZlweKkHT4NVw2flv?=
 =?us-ascii?Q?OZlBOu5ZiB+YIgu+nU4Uzg82+ZJ/b0fG0XYqQx4eUs/k5PoUpHCaxvQi+3NA?=
 =?us-ascii?Q?+EAyh0FnYT52tcfnYxWkh3SEwMZs4V7F/cqABackgdIuzLGd+k2G1g56BZav?=
 =?us-ascii?Q?cWm8iOjdlBGqXum4b4zjMMYpgsdXCfhHThGAGLaMoaq7N3WiA2B+Yzn7bFwf?=
 =?us-ascii?Q?XwQGJ/xa+9X7jEXWVVIS5fQVD5vKmT5K27rDFXtmdux2To6N2gGU1dbxD67r?=
 =?us-ascii?Q?RFoN2GDu36oGo4QsIHjFxM7UjCYOi/vDgXkAq4BaIXz0OMh7rYtDUi570zJ6?=
 =?us-ascii?Q?ok2XfbE0PcCPZXr37vnkVN/ScQUcBiRw/hs/zt2W5xJE3yX5Fw43kvcHc2gH?=
 =?us-ascii?Q?TKhaxmqFgWYx4gAvsYRw8oFDTC5H1w3F+Be2h9LiKD/tBhFLupd4wFtDEQEV?=
 =?us-ascii?Q?pPjvDRLRx8cg0Oim+wGPb/UPdKyoRpdrZVrfIqTBF2DqzyFz7X1De4s/LUX+?=
 =?us-ascii?Q?sDlFMVd+SeJyH/IC0Fx7sSv/x2ev9Sgbyn2maXDG1SNW1Ib3PLTmdWqQRDYl?=
 =?us-ascii?Q?dq64kwNrYnQ3g405e9Lwt8KJ8Z0w6yS3sCseD7mfaUTvAKC4t86rgKtEpRU2?=
 =?us-ascii?Q?J5LIW+F6UBmNBLilt3bHcHlM5/cGULXVT7D5f9vTGAKc5C/8biY/DTvC5++n?=
 =?us-ascii?Q?lWBBpCIrLxWwrCExYG2hagAmWA/kpMGqADxtczVDGBCBA5xfl+7h7ggmNEKe?=
 =?us-ascii?Q?zLC+fqEZogfPhwfkrgptHuPzGwYEaYJGqDhYyRjYe+QABkZ61/t2Ju76lKKz?=
 =?us-ascii?Q?dANDw/76VTzV/e/loXkSiLACBeABgWQR9hcJPNnh4wLA4wxt7jyDlRJFeOik?=
 =?us-ascii?Q?cMfDU403Skh4NUyE6LWmLh8P/XsZXUW0Kt+VyClhiKOTdmvOZoskpQBKHvqr?=
 =?us-ascii?Q?3/xSYvTCDmwdNb9zhaOBb2CS3aQOIffCgUSouN0wrE1AwtUkBVDs2WgG11oL?=
 =?us-ascii?Q?+FssDW38hchh1TrFW+YN8oA4nrW0R92AkpGyd5MBEHigrd6EI67PyXU9y1qD?=
 =?us-ascii?Q?82lcj/AEWtlAVNxQu9z9NTVq9rm5/cdBI7dGhHe1iNuEjy3nolA1df7h4NIS?=
 =?us-ascii?Q?YX79BOO/u4Cv4+cIbaNdnoIb5gscTq/lB6m0AU6+YHHq4jvEZTn8GlHlvNvI?=
 =?us-ascii?Q?ZzjAOSr3pXX1TcdZNSnP+btK2fLekwlno5iysuWQpiTkvC0DmRfNUUwtALOO?=
 =?us-ascii?Q?FNtKI1LaHSde8tKEw5yqvrMX5aCadAIixH8UU6PXoMVfjCnxVZIyV2vixnbD?=
 =?us-ascii?Q?oDdkd1yEgruBJ+MkKAQiqAnk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hcpRM+BbLdKtFdQiQAwqaZ+UnjsB8QpCM+o7UzMFMYkUCsDZUu99QvPyR6DG?=
 =?us-ascii?Q?k13PFL0HqcOetg2sa3/USa6NHMpY8t11KaYOJDgpWu97mW5G/M9MKX0g5g0K?=
 =?us-ascii?Q?elthyEzLGYqt2wcYRMaHOcGwWHpCUKPLiL54OowqTJDoJ8UZHeDFb7H4Y3gY?=
 =?us-ascii?Q?6kYuNV7mhSkFj4u4VWeCnUAlOUa2KFfucwoJMKR/JXj8ER5Slm/a+2m2OlyI?=
 =?us-ascii?Q?tc5gxO4qb94658GOeYbAr16IUgBS6WdxtJGcUVExbEB851qTb7IqUMCr177T?=
 =?us-ascii?Q?5j11U9jaNVKn4OzD9/6sR3pApfKTC7LaZqs+ty1B+vD/sxvh1jUpB7IC6ga5?=
 =?us-ascii?Q?rEamM7a1MR21yfBdQB0SxlVzcFKrANyrRChAaSEgKEFEBiUVxudGau7DRMxF?=
 =?us-ascii?Q?GEtbR5pII4aLxQm2I1A40p5UIJGMRZ5Xlyw8V2ROZeFj5YAkeeuVU8iAisff?=
 =?us-ascii?Q?qLQM7LOzHJfh2WN6j+/9HACbZPI0++J6WG7T9sxcMWPIc3KyM+u/X1/19JW9?=
 =?us-ascii?Q?OfXsigznAQv32t1I6eBVdh/AT+W5FYExDBKf/QYhCgb4oKBTc/5ZSk3cFUxR?=
 =?us-ascii?Q?XfcbtVybZpuB5p7hLL2Kz662Mp3qOBYQgi83V3jHrPuepEYHWevgQASue764?=
 =?us-ascii?Q?dQ5FX09miSHn2KSQGeYI/fPIr3Wecyw9eAuVaCxImW8SMcCNzdEX10zYxd52?=
 =?us-ascii?Q?RMZRSZw0/cztMPjPhQd50ALFQSzeoqGht4Sofk9kEaq1h3s8kRI78Mh+B8AR?=
 =?us-ascii?Q?BuPIUiKqwn+huPrf33E2SiOoGN+wA3Ud90kUvOuDQr2ASFGUImEG2kOHlJB0?=
 =?us-ascii?Q?3LkKFi+cNjC4iUreh4TXo11mR13MWlhCEVvHn0T26iJedWyFrxqNJo2v0GYA?=
 =?us-ascii?Q?y2mxw3DaGTjd9qkKozMkKMd7YHABjMcWbWhXiWjzFThV0Sn/skKSjCzwzaMF?=
 =?us-ascii?Q?uyKsehKSwtPtxkJbDE7oS/KZKpIRjRxM9kjgKcSoy/m+zf8yYvYrvdSrNZco?=
 =?us-ascii?Q?kdjzxkwqsaPvSdEShJbQoMTQ/2MLOA5w8E6XLIMhJldW6IjmKjVDPZhhJL/C?=
 =?us-ascii?Q?vUHotSAG+qMRue5Lc7Ll0+1JcHKUdesYqf/48VegLw2fUI/myynaQFD99hfp?=
 =?us-ascii?Q?oJNeKZfdCkTBc/lV36n5O3IbhBF9+g31PKgtgFZOMNeXcoclSFj5sA96Erke?=
 =?us-ascii?Q?V3sxtixtj7iR10Tbsb86YCg5weucrgb38J62lfKPpVUth3kuV59ftfvaYvLJ?=
 =?us-ascii?Q?1JNu1oc57LzCpHHVR9d8G2UtByYpH+YwOF7BpnWusqKnBx3ApIkwUJc4v3WQ?=
 =?us-ascii?Q?WNrRYcLNW6AZHeJUUqAKig3ErO9LKNA4GqEntNrSQ0uHeLNzozHKFKNt+CSx?=
 =?us-ascii?Q?ow6DBdllMq/IjFAdoMFZfDXCxOq2L0pdzC+J2OqNLs2pkjifVOEjE9mZI1pQ?=
 =?us-ascii?Q?KFNoQJ3B1b6EKBhr/zNym20gk48/3BANKBkY4ijfRh8s58N+R0nxfTzDSVSq?=
 =?us-ascii?Q?KjOe8awR8YgoV7MgKYXXOvqShwcSZZz4yBY5XwXFcBzp3ZGFP58dE2yFzRoF?=
 =?us-ascii?Q?8O+H3JDkLVVtJJzLQVz8xeZiUIB39u0PUkiZVDV+CVQCKv1cGAq4XRZw+ZLJ?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cipLJ9jP/F2SD0XWax6Jk8U0UBLMkFWTG4sqh1rJEWxachOmUm0I0bUU0OtrnOARi9b45zkJJc9Bdq2vjY/W0wgPDJ2uzKcL/ZK59E341QAvh8mpu/RIE8p3KdLmpVg6BiWP4WzOeACF7rp+KkLrkd3FJ+0tRB4cSBmuI+Vo/qaprbcnTx4mGDXV6PmmhguGMarL51l/5uFaNOpHeQ27VK+kZwG1KvP2nzWNhI59MdME/sDkUVx4TQtmdbI7uBrJnkc8bmXiH+JypWMlwfPV/kDpOmY1qskjUVIxshxOgU18hj5YHGYvogkFagKH56DI3N4CrhYsPX8538ndO7ueHTzItVwffddt3Mgh2lDKhVeNzdDLvUezKRc0wLRQW+EEzFRStFAqOs4h3SRRR3tkwCQHlyiHtqJ8KW1lRq8vMFUbKVKkbBLoskod1riNzYtgRll+4v2o4hY/9QCMYVWgCh9YIQxAXZPDOaX7FKr3K0unjzfMjOQj+aKwA9m8vvzxqMcPTdKE26cdsnqU6cOLZ3FcdsdiAEzAOIF3jBZGdkeqZEogxAkzibxD+5zGq0WE9MkZzL1fkFlQneobDs+6TBdURIj6Nbpxd6gSOlLYeeE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dc09f3-f42b-48b4-72f6-08dcc0a4dc04
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:15:47.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc6AEun3qONeiXOVZex8NyT6L3qpv87KGdwrYO/MOmUPdZvquFzNPdyJ1XkmD6Rim/VXq6JFdYj7O5KIQbqyn4ECm/FXmMg0OGQx2NVyZ3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6291
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190155
X-Proofpoint-ORIG-GUID: 5M6oee8xp8t_bSCb0VGYIY1Z0GrJj-UZ
X-Proofpoint-GUID: 5M6oee8xp8t_bSCb0VGYIY1Z0GrJj-UZ

On Tue, Jun 04, 2024 at 02:00:03PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/options/tst.aggrate-fast.d | 4 ++--
>  test/unittest/options/tst.aggrate-fast.r | 2 +-
>  test/unittest/options/tst.aggrate-slow.d | 4 ++--
>  test/unittest/options/tst.aggrate-slow.r | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/test/unittest/options/tst.aggrate-fast.d b/test/unittest/options/tst.aggrate-fast.d
> index 17fe0225..68c46a1d 100644
> --- a/test/unittest/options/tst.aggrate-fast.d
> +++ b/test/unittest/options/tst.aggrate-fast.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -11,7 +11,7 @@
>   */
>  
>  /* @@trigger: periodic_output */
> -/* @@sort */
> +/* @@nosort */
>  
>  #pragma D option quiet
>  #pragma D option switchrate=100ms
> diff --git a/test/unittest/options/tst.aggrate-fast.r b/test/unittest/options/tst.aggrate-fast.r
> index a32cf7df..c47c6a20 100644
> --- a/test/unittest/options/tst.aggrate-fast.r
> +++ b/test/unittest/options/tst.aggrate-fast.r
> @@ -1,3 +1,4 @@
> +
>                  1
>  
>                  2
> @@ -14,4 +15,3 @@
>  
>                  8
>  
> -
> diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
> index c4bac5e4..e2a0f2cb 100644
> --- a/test/unittest/options/tst.aggrate-slow.d
> +++ b/test/unittest/options/tst.aggrate-slow.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -10,7 +10,7 @@
>   * actions, multiple printa() should all reflect the same stale count.
>   */
>  /* @@trigger: periodic_output */
> -/* @@sort */
> +/* @@nosort */
>  
>  #pragma D option quiet
>  #pragma D option switchrate=100ms
> diff --git a/test/unittest/options/tst.aggrate-slow.r b/test/unittest/options/tst.aggrate-slow.r
> index 6cbd6c2f..ba2e979f 100644
> --- a/test/unittest/options/tst.aggrate-slow.r
> +++ b/test/unittest/options/tst.aggrate-slow.r
> @@ -1,3 +1,4 @@
> +
>                  1
>  
>                  1
> @@ -14,4 +15,3 @@
>  
>                  5
>  
> -
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
