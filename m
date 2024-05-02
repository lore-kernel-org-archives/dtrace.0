Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783B21106
	for <dtrace@lists.linux.dev>; Thu,  2 May 2024 06:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714630568; cv=fail; b=QFF8EtTouQqJh3v6puriQWzWwMO1pkk437M47lXD4N218nEihLUFqnmjz+gN1rAZ6cWKLNd9lXSxI0opeHnHUU9tqniefQFza7pUw0Q56X8lllFPaakoWAmY++0aOc66Hrj5pWkLLvdeemDsmsKPCCVqul5409y/4w7BINyMKEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714630568; c=relaxed/simple;
	bh=9ISSw16O5v4HkZqUKhHsBfg+LOXZ5wTeNsHGCF7/mV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M6VPZBd79/8792tnVLXwmxr3A0pZ6onMfEquBCPnnSx2SikhMWQbtXjfxJqumRSC252OYGZ5MEfTltKV9L/SlW2R2pZBRz05ikmtw0o3rxwMqj7GTUpS9g0nzyO2H2Rf/a549BdHjjyAViTmBZOnP21ckqxvN693pL9LM+gqDQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=naSf3Tey; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sXIkdthd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="naSf3Tey";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sXIkdthd"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4424kPL6020350
	for <dtrace@lists.linux.dev>; Thu, 2 May 2024 06:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=k1JtvuH6e+oF7PU03nVjJEjraPjZzacEYYqCBQllY/o=;
 b=naSf3TeyMaE3ITS8eRSPrvgvN/aOrM74/86ROrvzjyP6SaCYcNLM/ZcWpl6AF1HeZ2LQ
 SrfWAVkmXVwGUdlrMNHvdiU6hGORhiXn2sEz5/vacoQJNP6O0NKrrt2YixF0UOs5tNjo
 cwFrRF6cXf0Jw1nzhrI7eI9LJyOX7pgFEgIJxYSv7r7VZYmz3baE1uUkIqQwV4hdl0Rj
 LlUczJYovPGGvvXByTNogHHTuXgxALoyUhRrWmvtoyxGYgTVAJs9Q50R0Zl3PHq9jZdL
 KOIwSaH6omwq8o3Y4C/F26Vg/CIqFtW2Qi+xK68hJaGSYaTATqsoMyDImf60HGMkRmjV FQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrr9cwe2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 May 2024 06:16:02 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4425LgB9008582
	for <dtrace@lists.linux.dev>; Thu, 2 May 2024 06:16:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqtahyxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 May 2024 06:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZu8ML6Plxymi1I6DWAtqBucYyRJO73r92FGB881j2OKxNxFPBpxje/tVhhGD/l6qa18hEKbXmjBiViNnv0u7ETFIHptpWA+ltmYFA1ze4B2q0lN0WTtnc3sL9g/sVuMkqg+1YXfHYGgocqmQFW+k0adJMXcqf/rs5IDNIPis9lXhyKuxIY1s/kLdUqlsm8+eNvIMSH0bp+hUPvbidvyD65oKGaMoed+KalElbqa5geqxDk31kriJWxBnfOcDd0CLInl1uAbqlJO9FNgJKrVMk/RCq9vs2ca3uo+llUJ4+5iUqalK8QLKUgbTiCKE/eETXbGWdMcTB6+M3Xsz637uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1JtvuH6e+oF7PU03nVjJEjraPjZzacEYYqCBQllY/o=;
 b=KG0in8WhsiIQB7WjveZIkkIhHcVmre+oqvhonmLj8oCKIOxKfrGS7fhG4OkN1f0RLnSUKx331g01cgUvd5L18sK6V39iOb3VHgEs163VDTbpXgwvF+vP7PANxAzmSzx7FwYsb23t2l12Yfz22dJKZsvHSWH+uQRVHjqq8l5E2zJ65vdueS3MWVlXfpugV3Pr7POCf0qSX4C25mLlCKXxFhE3W2oKtA1a3vSWkpcZ+vbwQ6wvo4wBsp5LcmFUzMRL6HMbt3f62f6CuBc00G4j8bplI94etsLTvgRfnQS8wDezJ6GzZFhWRQ5khA78mP8D4BcDyYtvTozlnrgkOl+BSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1JtvuH6e+oF7PU03nVjJEjraPjZzacEYYqCBQllY/o=;
 b=sXIkdthdxb2/lE2vRk00Nk2tb7VxCHwPce58tDgE4QFsdaSIhkQMF66b4xfT8bQB0a7j92WrtIpecmi3+eGZOhdDGq52J9oJKiC3t4zz6XeKjycRXMs4fxQo0LDlq+/n1v8k+7aKDEgPczo+FCjJd4ltV89ZlwML0esFUalswCI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB4953.namprd10.prod.outlook.com (2603:10b6:610:de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 06:16:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 06:15:59 +0000
Date: Thu, 2 May 2024 02:15:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH] build: install all pregenerated dlibs
Message-ID: <ZjMvnWqk4Xp2Ty7U@oracle.com>
References: <ZjMq7lGJ7h9Ko+5e@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjMq7lGJ7h9Ko+5e@oracle.com>
X-ClientProxiedBy: BL0PR02CA0119.namprd02.prod.outlook.com
 (2603:10b6:208:35::24) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 681e16a5-3796-4bd6-bd2b-08dc6a6f55df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HSwyuqjvP7k2jMJJDW+niIaZVUSyTNjMya0o2Eea+O+7cIpo+QFHbAvZx3Lo?=
 =?us-ascii?Q?9crUv9Ev5iUM93T+rNz+ESdgf67Ke6jCU2FfGt/wkc7j9X5lVWxozXrRF0sz?=
 =?us-ascii?Q?dmsAEKgnav6Cx7pulnegYzE5qDFVAnAicsU9rZccK4+qgiU4LlYMcrdcs7Eu?=
 =?us-ascii?Q?7Xm5hsal4ZQX8HyRQGPeJSwKqCp/oWLuVNbZvV6cbq5YeSZH0I27W26ulnHg?=
 =?us-ascii?Q?5KB40v8ghiGie/7Gg4yPrTuerP20JO8Ws+mRbxca6WqLN/z63NiG8gpL7DPt?=
 =?us-ascii?Q?qUojmm/+oe46rfjPA7gNDd/Ghmu1TGmufStPEz0fijnRmMDTtMiWgOLUySjG?=
 =?us-ascii?Q?l3WTqdUEbXL6g82sOZJaNSw9EE9+zkiA2UX9ciNZ5pNRHUkVhMCWgmFB+QOg?=
 =?us-ascii?Q?X3V7dyH1hNG8oFHZa7ER0GltlCD7COaKtZplN9gPjO2UcClrOKLUAFghW2sC?=
 =?us-ascii?Q?FV6MjotfZQpb/AJ6md0nTAcBBu2SLN0jd29f/Z7fIPZ9vmnEmDXrQFkpBo6M?=
 =?us-ascii?Q?rAob7Ynv+iTEY8QgCxNdLLBpRLJo4x4hwQXNWAOFQefyowD4+HwAYVEx60KT?=
 =?us-ascii?Q?me12TEKVsnHS0Tg/Ex+MnvQYdoZaL9pzXFbPziroYCBI8si1dfDBRSPEVBE3?=
 =?us-ascii?Q?2h+s3RE8D3WyWgi4PtwsbowYoadowhxBT61oBRyRrHdXvOzuvc0BsNpMUgMH?=
 =?us-ascii?Q?OlrCTUZja6afhJuEGgVTgtalGzDEX3VgyItFcwENIRna1d1o4o4t92r89BVe?=
 =?us-ascii?Q?3KQFhPFhC5hAZTBZcYkMz1K/zRMrm9qBAUZWeXKEb2MV7uaPnjJfQCXMckyt?=
 =?us-ascii?Q?JsEFFvsg7SDWsdat3qMAaBLYZcK7meZEo8GNvuDgP/Wk4a4GMT6aNT+1nesM?=
 =?us-ascii?Q?SEspWxaK9X889bvbyIstfgxBksgUk2njq8h5es1SnfNIxiNoy53Mo3VIqe5j?=
 =?us-ascii?Q?WwlI7+ImMSc7T4sKnAYGCrZDE4DF7unY0gb5o9X5WnZzBLphbmEUMFAg20iC?=
 =?us-ascii?Q?pMBSeQ/EiLcgRmrhcOcRR97tPIYEro0ONua3jkm77LaFes5+e1lUJepq/Uvr?=
 =?us-ascii?Q?asxNj9aPJR6ZgB/RZg7bZCA8WwU6jWELDVTW8DSW5+DN7Bk5ORoAH2DFrwBQ?=
 =?us-ascii?Q?GIhDYoZLxaDPqOvAOdMqs66S90zxYCDjubTrv55PabSeCdtot/PIPhH1qyo+?=
 =?us-ascii?Q?073+kONK7wCAtn5URByqxZOktnn8rmWAr63K7+CfcNhF9GkNQFC++TrWzujI?=
 =?us-ascii?Q?3yM0xrXlU8RJJPSnBG3IF35UCfS4ob3VlDPR8ESGOg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LoTFPcjFQL1MftFs7FEB/3AHgxoTkXA9BLb1eCvIDHzAP2wP8ssTiQaKBMHW?=
 =?us-ascii?Q?bPW3f3+nhYcC4/6o0myBb+FQ4RSqUV6EfusxtAbpm++RG9wcQKlfy5aF0mrV?=
 =?us-ascii?Q?pfIk8SFp5kxEgZcpEmaGIYVE9BSQ+cqEyVvkDtX2irGVHtn6n49mF8iJy9Zm?=
 =?us-ascii?Q?x6QXxQNaTaLnI/aRA5UH37m0HLPbVhiPcpk9b+EnITYx4vN38FwhMt3rZY0j?=
 =?us-ascii?Q?depzDGYYL4SiepKtfoksVbkb8wlnloy8y3M7Vocsf/wgMuseWiTcluteAZMD?=
 =?us-ascii?Q?lIIKTXbHdKI5eNZVPIzp3pVIqlFK9P45jgy8eNX/RWcSaVoyBgZfbszOVI01?=
 =?us-ascii?Q?H7tnvW48ofEqQ/s3n3Q8NJRgafhNDvYuAE4Nv96lXzo99e0UefCpm4ll2UA7?=
 =?us-ascii?Q?+Bhns7jL8dPgMTE8auiRH86d4lpfK6txgHxxDGqLDZvL7e24BC8sTRtCWQlU?=
 =?us-ascii?Q?L5XGv1HKej34tLx6w3mmdR4nwm79yNT5XOul5TrRPZzY6l/Nmwdk+scQtIt7?=
 =?us-ascii?Q?06v/fiCIZIwGnScQUZ2NS5Uwxm1NssCf74V1f26GlCzcowaGQRMsq1oXQx+N?=
 =?us-ascii?Q?Ap08j9KDTwfoG+7eSWaRZ6xQ4vKEOoOmpMYI4Y3A7mkpDaRMX2BCnud/KeKU?=
 =?us-ascii?Q?tfLkNrBxZ1YXUzVbtriSgEk9CiQy7zlXbo3EkJy5uQoK44FJDo7ld2pn2Bhg?=
 =?us-ascii?Q?MvV86iJUtCKd+XtM7yVrkL/cypm1JBV5VLu81e0PLGwK4/0hbmaNFFK+Mkkn?=
 =?us-ascii?Q?IDNTwwSaRvaNHx354OlQosfGt9SdYs0g3Jd7G3kB21uovfXbCdG0DKhnGm5r?=
 =?us-ascii?Q?CigYC+yhItEfxixbRdMziK6IVfoJFMERdzBSqDBniW/VVHtMswZnl++94saz?=
 =?us-ascii?Q?7wl+Foy+fMPlOH0fwGwLjFGbINQV9tCoTcq2shsmDwQM0kfMQRCPkgyfcl9B?=
 =?us-ascii?Q?P4rckuMlNMZ7AEMeWqCyzwLCP8qdOIUWdZ50TEgJIg/LyoqDuPW/tj7+FQGC?=
 =?us-ascii?Q?rHxrmRgo5hCJ+V4Z5Od3JUwYPm7xE5DcWWVF2P9DTenF9qjyBf7yjTV14mYx?=
 =?us-ascii?Q?IiwK+0ueEDktq2Bzg2+UuhnJCMxx5rF6R7PnkqIgaCJ39Dp+ClT1HkzZ/8Bz?=
 =?us-ascii?Q?smQQP+F3Nt19Ox0T25jQInztdHcLlldX3Qwesc9gdnAb97P58K9QNXx9ah+8?=
 =?us-ascii?Q?oNmRLmIQ5N4KcFk/ULEjQcOjB2Ewhk1O7HV5STAN8ELxkR70tHCBGvZZVnca?=
 =?us-ascii?Q?2u7d6FYPGCBbPf1GX0QvlAAPVHXULaQA6rM6Eurq9zT6CDb/X7LbeR5DDuUm?=
 =?us-ascii?Q?ZoBUs+MfOAWrxplRg8UnhattCEhRKaKprkCAVtpbDN5BzbCIrsWE1tqdxVR1?=
 =?us-ascii?Q?Fafspj7lla073z9AO/3FcIE5xVL7VZaQV2RYfV0NMdd6ZWGBuE9xxlE+zmfU?=
 =?us-ascii?Q?/3IHr+gpjnNn4t32oUZUC1RMttmZ5SinuswdS4Ik+SC8zJjBjQcuSwWObI9k?=
 =?us-ascii?Q?Drs8gNstoZ6/dZ2HNRpAtX8peTPwm/ve4kzL6ltD4JkVG6Ajlpg1VscSBT/q?=
 =?us-ascii?Q?64CdrX/OVZKRqvD0JZqNBhMGhRh8+FKvy79xiJ1J8k7ZX96HtDU0tkXMc+2S?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3dC2BDAO3w1rHtp8CvdBABU8aWEE+B8lgfJJt4ZeQbeRLkIogVacWOKNA8Nxxg/UnhViFpQFuJJLJvFoHawV1EM+O10OXq9bQXiLlc9+pNCqqomCHcGNnnR7SjIC+/yejMRsF3tbcwK/sSj2vj36HYND5YCvYWDNQVCNiYyuU6QuLJ4VVXoGOhoPnG6AuO3iFey3HOJ97dxwJYI88Qz33Ptn7VuV5SV60CjR3qxxHIEPoV7SWv8MbLzaJ3E19oWQCBi1NbicLU3bNrYXQO4f2I+eeJNcTZ6N1kf/RkZKt09zz1wZu0ChNjJ6QGHyyM+ti0zY4krs6uzN3JqR83Ukw5vI8SXI/hIgDVYa+QPruUw+OZiqA9yq5Kw6COTqfydO9ZkCuB/TIgqgxyDtMY3ATX9VaWnwsSm76H6D+Yut5VkDwLFYkkdSanswPXjb3k75g/NVW8vH31UFgc4hgtg3pTwdOHGqKBgkTEHq4UmdOKqRtVSwOPBx8+A/xy9N7gW5s4pJfR9RUrQ0ayjRijE9gzt6JgogF+oCYRfyS6rUhyykxavMwshZwXYonBv9LKuj7kmpfTmf4gI2DUS4gk2jVJT99D/vGOX6p9uQlT1krJM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681e16a5-3796-4bd6-bd2b-08dc6a6f55df
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 06:15:59.4928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0Lu7e5fMqSNv+DwbXZYXE4OS5++7zGZ3BqN4R3hhqAzEY5QxvleCKO+gclGoBQXLS9DvXyJN7+mtVxFkIVghQsrdyl0W/ovu2v8sFS3gIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4953
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-05-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405020034
X-Proofpoint-GUID: BRDDxzq2yusEAWSTmeagkEdBsNCbdGlP
X-Proofpoint-ORIG-GUID: BRDDxzq2yusEAWSTmeagkEdBsNCbdGlP

On Thu, May 02, 2024 at 01:55:58AM -0400, Kris Van Hees wrote:
> From: Nick Alcock <nick.alcock@oracle.com>
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/Build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 473b4d5a58da0..b0e372f9a948a 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -295,7 +295,7 @@ install::
>  	$(if $(NATIVE_BITNESS_ONLY),,install -m 644 $(DRTI32_OBJ) $(INSTLIBDIR)/dtrace/drti)
>  	$(call describe-install-target,$(INSTLIBDIR)/dtrace/drti,drti-vers)
>  	install -m 644 $(objdir)/dlibs/drti/drti-vers $(INSTLIBDIR)/dtrace/drti
> -	for kernel in $(SHORTKERNELS); do \
> +	for kernel in $$(cd $(objdir)/dlibs; echo [0-9]*); do \
>  		$(call describe-expanded-install-target,$(INSTLIBDIR)/dtrace/$$kernel,$(WORKING_DLIBS)) \
>  		mkdir -p $(INSTLIBDIR)/dtrace/$$kernel && \
>  		cd $(objdir)/dlibs/$$kernel && install -m 644 $(WORKING_DLIBS) $(INSTLIBDIR)/dtrace/$$kernel; \
> 
> base-commit: 6c5f67cc8ea1d694da8043c8f5aeb2f97b69997a
> -- 
> 2.44.0.273.ge0bd14271f
