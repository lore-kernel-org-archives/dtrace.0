Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007BA2BDC09
	for <dtrace@lists.linux.dev>; Wed,  8 Oct 2025 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941484; cv=fail; b=DIvELcj62nZEG36x19K/R+6e1safkRpLILyynyGYffbbc9iWmC6YIyn9KnDtWCnLgslK8qu9OzAOo001DIavBGmsceikCMCutjOV5bNCiR6fqRKmWGvC7QJfa2zZUHt/dVrBH7Z9gq21la0ziZcvT8TPTgKgpNAKRNM1RCeMHgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941484; c=relaxed/simple;
	bh=eUJ37YMeafNhEYayfUCa7U28q9OBa60ro+gUUNQHj+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o4nQ5nWS6GcQAEQ8ZI9iMfc5FsK+c/QXHKXyf/rt9d7bt9dgP3gfu7Esl2+7xuka3UzDFOKRRdny9hGh7rJldoZEaKSn4SSffQd2QC/Cl+bUwbHpeoU+gBKWiWhZyS7z2uGyq38GjSLTWBj9KYshH4jh+8otM4YyFe1Wl1bkZeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OLJu3m/C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OxCWHMbf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OLJu3m/C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OxCWHMbf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598GBq01014143
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 16:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qH82vDh1DikKdOxOj1
	wj3z6zNdwx+5rSfKUDDlM5aag=; b=OLJu3m/CD3EYrvqnF3gpCsvIzQUDNgbXBs
	HERsWASZZVpA5LZR8CnBVnRxHOYICcGMqWBWwXB4Bu8tzmJPYKOqSIJ34vNaCPO3
	GP7fcCkDVjG4Oit76geStoR72yl8B6tWKokSGTNmx4FxVGkBqhvouWML2VJCxApn
	EsQvCFtd52tCTPiTsdZDbQqIJe8NONDscJpN2JtVy2gjkeBimNgFKRcPj+Db7BQS
	TyHtYhLOC7dl0hE8OX/2q77cl0XpTMSW8+HFxYolHjkq2/qALef4Kvz+AZzAgjCb
	RKyBgqUbUWjwNUwrrFv5lb+BcI8EDV2XRkSzpuJiN5nKU6kO9Few==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nmmv0w1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 16:38:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 598FcZk8004545
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 16:38:01 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nqb2k12w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 16:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgiFymeX4g1jTy8+lfb7VSGuM9/q41cIbpJE1xxOGCm++h7ZwNiHSIBehuqBRtbFpIZdJPhYT2Ie2W/G5sBaVe5A41FE56+yHSbAPMbHFycfJo/PAZEELxtmdYWsSYzz1KE+kknqicJ5DALcPXCtQHmyNqBbmXIYuXNVrNHuCOrpI16RCV9D3x3vQ7SglKKui1Cp/sKRu8WNizlIKVIDElxDtU24x2Eg2ifcxEmPG/7RoCNARkafHGvTV1noHdPJVxXihmm5mV1bHldViOsjkZbns8wBFpP7qRSkL0uaMFhCwTSSYFng0nbbDuHp+sZCR4xJlOmW7XGA5ozhAcFywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qH82vDh1DikKdOxOj1wj3z6zNdwx+5rSfKUDDlM5aag=;
 b=cxwKjcCUBxBbps8GlzosI50qB/8LqbALNIVferyfbUKiijpZllLMfDi4CUNfthHfh42hqEyevLpDLJK8KQmyNMNVbDCxFkRyoWpgB3Wa+CM9Rx2FfbRVm28JEK5sz7QLYvBVTaqSSo7U0QONCtMf1KJkmdTYK+XyWsDaLnNEf6P/zbhtP4ndVVImJe68p9eutZE/PrZkwbG7NRKnmH56nZuuqT7cOzmnBcOlMJHp8wp1cERiE58ifmJZah+MkHDnaaPo8v3qnl19Us5T64zW2tJeqzARGx7VO9G9J5BimEt9ifk0nYpFRLl179cmLfzGBH8Ks04e6fqIkCChUtdefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qH82vDh1DikKdOxOj1wj3z6zNdwx+5rSfKUDDlM5aag=;
 b=OxCWHMbf5W8dD/mVsjbSDstjjHLkkmeD+QI8k6qSCvlJX1pL35cUsCObZj9UOmkruGkiDzbR0z2a/3mQfjMABl+ih48ZeBktKQJSDz0f6y1LD1Yi5HSRrRBtEpYPCXOiJYW3I+GBopNSpElESr26fzUKf3smX+ARNvpRjC76ZHk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7049.namprd10.prod.outlook.com (2603:10b6:8:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 16:37:58 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 16:37:57 +0000
Date: Wed, 8 Oct 2025 12:37:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Modify fbtsafety tests that use
 vtimestamp unnecessarily
Message-ID: <aOaTYrHmJky0rOAS@oracle.com>
References: <20251007225543.31749-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007225543.31749-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 271fd78b-9e4c-42b5-246c-08de06890997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VIq3BIz6iuiKHrQjVwDyrE+2aSR2qn0bTuEsxP+Zn/NWtH+n0cvaHZAnRAFa?=
 =?us-ascii?Q?aJgFk6L2xzb3KdwN21GMiLbQmb+32YF3GFzQAEI6usR8ne5MmAJepmLcsyqZ?=
 =?us-ascii?Q?lf3wHbtHD27SmcuoRcWdRU3wcJvztzRyvQkwQQbCtgNbYb3jP6RyyN7QP31b?=
 =?us-ascii?Q?31ZCyCjASePIO168SJAOVys40gZOJ05GBNf6WKgOVCubWvIcGMccbcZPaxjz?=
 =?us-ascii?Q?cXa3DI+YxSRA8A8sGl3juipCqF/AqbscuY4DWSOLGCbc9z+taJEkccPacgBb?=
 =?us-ascii?Q?r+EwmaGEt3OyfxGHPp7ctguSFpE5ocUPTBCkumRJN6mwFxNWTDd1Zby8IYYP?=
 =?us-ascii?Q?CuNCosQF187OnvquT+EEGi14PO9XgXm6Ybxu8u+mh4TUPKkUr55Yw+p3Yt32?=
 =?us-ascii?Q?UhCxSIu5zewzb2oynTsqoBRbh6tjiacvWFR7V1CJIYlPM9kxZw4zTvT5ePcH?=
 =?us-ascii?Q?tqXBq6l1rHXJTxzrUm5XK2SFEbSXF+9vUrLH1B+GUNzO85jWJKJV8TwRhQIJ?=
 =?us-ascii?Q?HUwKWddgWggKaXrLnafociiJCkcQ992IEY4BQQvTCbKoehFYO5f1WzrirXy9?=
 =?us-ascii?Q?BIU0u2Y+Wffcl5R9VuW8/Gxn9Wv8/jC7ec0IRrH/d97LXbJ2FXdUDbzpte64?=
 =?us-ascii?Q?yeYn5Pv2Gs1lSC7ZTQDsfcFy6N9vzqcZ8sDWGYoKHsK4i/fgqBiduwxV9yB4?=
 =?us-ascii?Q?7NxqQrHNR62mtd6GdEUvnMmZauiW8WDg0ySyoHgQcLtMO2koLyPAGyc6w9Zg?=
 =?us-ascii?Q?hqVkahDSlZ1l5+u8I0bNOoM4yPaEC2FQ/aRzAlflNg5FNJevPGEJokG/t0QU?=
 =?us-ascii?Q?gdBPXw5hx8rJsH/Caz2ciwXphXlSqjqRXbg4YaawST8UGBjUXMSwahNuqgSf?=
 =?us-ascii?Q?zBVE+LFpYblV5L+yjrY2GYURGzPmsh790VTQ3veR2DDQkgsMKLdkY7euXJJx?=
 =?us-ascii?Q?qG1tEhOlCI+0gvrIWT48dGnLT6p+I8a1/1gd7VdSfMTY6Zg0DHcvbgCQKEnY?=
 =?us-ascii?Q?Y5f1X3rd0PZ2Fwa6b2qPBoGvNzfBcvoDzuqqbPIdXNKpFUYWt++5inpklqc9?=
 =?us-ascii?Q?mHm8yOVJRksXSboc5NvKzUy4aVNht0IdupBRAInd/8spVCDg6+xleCBkz1mN?=
 =?us-ascii?Q?62tdSDTSwDIhUUJ6ld4TzUjl45CXQqBOC9FTPDCwu2bV1uQiiYSbg2RyCIlI?=
 =?us-ascii?Q?s4thX5LDrbbadi7kcHsCseCy5hFqTZ/2qp5msZqjpXDUXhD3GCHrLG2sxqZS?=
 =?us-ascii?Q?X81qrpVR8vDycTkItn5Jo8P21cRvAk8izNtBbtr2XfuWGS1S1ZFCNDbMyBnH?=
 =?us-ascii?Q?5oSk8bLbPTuFSE2RURS4U4vUb/wzuJZpPxFUQ0gKD836a4y5ZLgoFpkur2xT?=
 =?us-ascii?Q?xnNwjq3kT1bEDca6otrKmOoFeVQ3Mb8l8FMI7TqIU76oAStKB9CfA0VbxB1W?=
 =?us-ascii?Q?72dMR/3fGElmgJawdpzQbMCbY76H3msg8vltoc6fll7obt0YXrbTiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sV5F9073tIyH3wKFaUVdKKnkxwAJefQfuUIMr2IF98V0II/RhnhUis2nbevk?=
 =?us-ascii?Q?q4rnjSwVkGfw9O99Dre1ICvhbpy4FUSjiiM7nMGKmSRBxc9COTviCyxc2QVT?=
 =?us-ascii?Q?arrXyyCDpuXC2QPfYhMZallRyaystzlDIm3W3IGP90csebXhCc0iL0Mtjrnh?=
 =?us-ascii?Q?0AgkqSdls05ZMzaCyMWqvfEG8O5C6Nzo79nnzLREzK1TFTlZpjbDIFBO7/RF?=
 =?us-ascii?Q?4xsGF6CTkZIQYFPAgDWGxB3Vr4XoMg2UtcwPAfMo890zO0tgo2Uyuy0Xk2cj?=
 =?us-ascii?Q?RqoDUcFAcpKjoG3UAHpNReBwsD4+6DdHWpCA8+M9otQ1QW9qXAFKrg7hWTT2?=
 =?us-ascii?Q?T9YJ9NTIhbnN9eL12tYqkQZ/WIPl/6pUvITYawUXZXNl5pG0Msz1R85AE52p?=
 =?us-ascii?Q?l8KDCLbA5Xil8ISqIrR3hBvzrKYB7dWtjMOR5u2t2BgpQUTy/9q0QrdAuqA1?=
 =?us-ascii?Q?9KKeDt+Smtb1C4/BQNKTCzXxc/VmVjp+hSMaw25RObwY92O/MkO3d4Gk0Nys?=
 =?us-ascii?Q?CKd0yizN4h17jzhAF2iaNrPHh0WXU/xWgWV9Q4Ops6UFtJGlAFwB7GP7rjbF?=
 =?us-ascii?Q?wjCZmAG8UeE8QEQDrbrtn4v/I097ELYpRxgIFBLXw7QSo79qHQF2dPCWHa/Y?=
 =?us-ascii?Q?PWAGQXXP0wI6evDojaHDXRkLwgqWDWSs4WL4kYzEN9oTSjVKp6yssu9f3qrW?=
 =?us-ascii?Q?IBhd1CWWvfbzWxtIxTtNppRN0eaI14CIf2A40tDg+tBhHHh0PKtUNUaispii?=
 =?us-ascii?Q?BiyAhtDLTH+LsrZ18+0u6Vz85QcYhKVXAonZhGh8U3yk+hbUJQKIn8lDpQ2V?=
 =?us-ascii?Q?DWGSkv83uWRw0KzYUfnZH9kFvBHsV8NDQOETAVn8nOmnkZQbcq1MEFXTPxs7?=
 =?us-ascii?Q?leJOPUyzepoQxyXJipcKsrD6OFVYKQ42o0m+QprYrkxP4FXIRmTI9fO/5gGh?=
 =?us-ascii?Q?Nqxn4frCRV93JN9zezd9GunA5jJ1R0rj0FyNTcQCKvhu8p8VKcsxABQcYU+O?=
 =?us-ascii?Q?bBvIhwttSicGUiPWZOTAAicMgGn4hpB7NQp0Yatu5kqIvAiItO/suxe5taVR?=
 =?us-ascii?Q?gIp9OAmzumUBnIrsoGMMP16HzY8bMAtVS28MGjbN9NjmodtK1lVBaxGfIkou?=
 =?us-ascii?Q?UYp6xNDM5xwQmnk/hmyxE8RnOHIdeKENBl+SOlu2ua2ma4PtCFtoObwK9VKl?=
 =?us-ascii?Q?H2AXqRo6d1LAEoN/d/OaKFs2qMco3pDs1mcLxum6LKDCPMQ3uq0OyULp7fxX?=
 =?us-ascii?Q?JkDounptFKSRC+rm4DyySqrD7uquEKURn0y2RPgTe1gFan6ZhRie5kYdQy7U?=
 =?us-ascii?Q?jhUt2H8FIlTqaOEf3tMB1QtT119oNy95bC5clQWn7Qnq1K06YOxGb2LW5+Lz?=
 =?us-ascii?Q?xvupWUEVZe8tRkJ480X4ixbskv5MhydT9t5NAcNeMDZR3oZ5HbJl4OKtSJmg?=
 =?us-ascii?Q?zVeWG9mPkosRCvJvlkEto2xdAqmcKz573dmgn0Vb4N4YnQUODsLfjIBA3dwd?=
 =?us-ascii?Q?uetV+LKndG3X6e7/RA2AVnepPmI0N5+OUG90zfG62JR/0NJYtModx6rLXnsT?=
 =?us-ascii?Q?r2tKfROcicABZkFra11WGhk7haDjwiddyBm8WOVfKyExQmxltrEAbWo7CBNT?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rsBcm/9jjUdWT9mEGYlYTGdlea68WxVrqXXIlyFdT18DzAcByXzGtrwIkIAnaIYLmaafe/IhKSVPgWa/hJZaQ9I0wqpd1wwhWUSHd9YXP/nQxhIBtgYdhiqMfiG2QuTdB5WUg2buVCIPoSzKz9uajbojPHU02+tJ8+5nuuvsiHaNM7MhBosyLwkL56WqR627JO41hAv4XwU+vjjaXvnpgJQQLxO/6U23jJhsSSJWzKE3q7hqDayWJf1SVXp79Df3OrDBAzwz6RrqC8orR2K9OSmMlb2mCmIi8yJRa+al++Sw4ez5xygwN0NirDUXVkzfhi2M6xjQAWJwLE7lDIgx7IQVlnCunXDULxFbVNvu3JeVsSOw0C3UrxjWTZvPRiBQpQCRUAH4Oz2iNzcJ/w3ahd9qvxnhCm8V5Er7JDuYYIbYTW5le5xvnMwSsapPKxRfd9YjLjXNiLw3Nw1jh7Wj7EwuFMrlvARrf4VGRPBrvJ9do63tnWmb4/KMGKdXXN5mtYKrFLRVSOK4g+HazyMB2oLUo6uedtvqcDgMZjKvkNPJG74Md/JmWp52ntYGptaoOwORqrnWBkLqE7spIx497vejjDqdPZTFW7+oRAA/jc0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 271fd78b-9e4c-42b5-246c-08de06890997
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:37:57.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELdXx9aoxo7JqgaFwXTPPvp/JPsY1TWsANx7FeijqT50Hx4Vt5hdcG69P823me/hl1tETVWTvxdnPRsIyn6yT6cbex/t0k5P2XT29oQY4vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510080116
X-Proofpoint-GUID: MRMfDP7-HjAXORnDOC7hVebB7rO21nmD
X-Proofpoint-ORIG-GUID: MRMfDP7-HjAXORnDOC7hVebB7rO21nmD
X-Authority-Analysis: v=2.4 cv=GJoF0+NK c=1 sm=1 tr=0 ts=68e6936a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YX-L-h5gIbZTML5G4PQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA1NyBTYWx0ZWRfX//TBxt7SrnhY
 9WqA7uduDhlOlePoadhINeWVVi1nI32sHZ9lh6eprhymy6SpsqvVzmY5zzrbQ6tu50qk9vcUA18
 +tx2FESzyMIbT/gEjTW4KbYU8O6ZMV0JoGwDDu/8E8zULj5GP3k4x+/L0a0vxMaUFYPPwPAIphG
 AYiiDwlCJrx/u/UfXIUJ2DCkrxFkyi/xChAF/IoWBx7WSeMmyyyMCSZ9ZxsT7MhsBT/i4GQEd7+
 rTIRJddEA4XhonUXMysNJ7hYVzb0hb7rGF7pAVyeGB+eih197hs4ZKwTjQvnzcvbf7wH5Mfs4yn
 +vdszGz4JKdyjPsux6hZAwSRnseh1vMquTLVxcSn4fmIREcc12Ezj3j0aIIw/INWsX2GmjI1Sz8
 /PxBx018dZIojDahG7gaF0zdrhwRhg==

On Tue, Oct 07, 2025 at 06:55:43PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Currently, we do not implement vtimestamp.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/stress/fbtsafety/tst.index.d             | 6 +++---
>  test/stress/fbtsafety/tst.strjoin.d           | 4 ++--
>  test/stress/fbtsafety/tst.strstr.d            | 4 ++--
>  test/stress/fbtsafety/tst.strtok.d            | 4 ++--
>  test/stress/fbtsafety/tst.substr.d            | 6 +++---
>  test/unittest/variables/bvar/tst.vtimestamp.d | 2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/test/stress/fbtsafety/tst.index.d b/test/stress/fbtsafety/tst.index.d
> index e30b94c0a..930d074ab 100644
> --- a/test/stress/fbtsafety/tst.index.d
> +++ b/test/stress/fbtsafety/tst.index.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -17,13 +17,13 @@ fbt:::
>  fbt:::
>  /on/
>  {
> -	trace(index((char *)rand(), (char *)(rand() ^ vtimestamp)));
> +	trace(index((char *)rand(), (char *)(rand() ^ timestamp)));
>  }
>  
>  fbt:::
>  /on/
>  {
> -	trace(rindex((char *)rand(), (char *)(rand() ^ vtimestamp,
> +	trace(rindex((char *)rand(), (char *)(rand() ^ timestamp,
>  	    timestamp)));
>  }
>  
> diff --git a/test/stress/fbtsafety/tst.strjoin.d b/test/stress/fbtsafety/tst.strjoin.d
> index a22cc7943..1a9fbe733 100644
> --- a/test/stress/fbtsafety/tst.strjoin.d
> +++ b/test/stress/fbtsafety/tst.strjoin.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -17,7 +17,7 @@ fbt:::
>  fbt:::
>  /on/
>  {
> -	trace(strjoin((char *)rand(), (char *)(rand() ^ vtimestamp)));
> +	trace(strjoin((char *)rand(), (char *)(rand() ^ timestamp)));
>  }
>  
>  fbt:::entry
> diff --git a/test/stress/fbtsafety/tst.strstr.d b/test/stress/fbtsafety/tst.strstr.d
> index 13f4a9245..15c1e15e8 100644
> --- a/test/stress/fbtsafety/tst.strstr.d
> +++ b/test/stress/fbtsafety/tst.strstr.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -17,7 +17,7 @@ fbt:::
>  fbt:::
>  /on/
>  {
> -	trace(strstr((char *)rand(), (char *)(rand() ^ vtimestamp)));
> +	trace(strstr((char *)rand(), (char *)(rand() ^ timestamp)));
>  }
>  
>  fbt:::entry
> diff --git a/test/stress/fbtsafety/tst.strtok.d b/test/stress/fbtsafety/tst.strtok.d
> index bc0a707eb..edc2ec558 100644
> --- a/test/stress/fbtsafety/tst.strtok.d
> +++ b/test/stress/fbtsafety/tst.strtok.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -17,7 +17,7 @@ fbt:::
>  fbt:::
>  /on/
>  {
> -	trace(strtok((char *)rand(), (char *)(rand() ^ vtimestamp)));
> +	trace(strtok((char *)rand(), (char *)(rand() ^ timestamp)));
>  }
>  
>  fbt:::entry
> diff --git a/test/stress/fbtsafety/tst.substr.d b/test/stress/fbtsafety/tst.substr.d
> index 8cd021176..ac02584ee 100644
> --- a/test/stress/fbtsafety/tst.substr.d
> +++ b/test/stress/fbtsafety/tst.substr.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -17,13 +17,13 @@ fbt:::
>  fbt:::
>  /on/
>  {
> -	trace(substr((char *)rand(), rand() ^ vtimestamp));
> +	trace(substr((char *)rand(), rand() ^ timestamp));
>  }
>  
>  fbt:::
>  /on/
>  {
> -	trace(substr((char *)rand(), -rand() ^ vtimestamp));
> +	trace(substr((char *)rand(), -rand() ^ timestamp));
>  }
>  
>  tick-1sec
> diff --git a/test/unittest/variables/bvar/tst.vtimestamp.d b/test/unittest/variables/bvar/tst.vtimestamp.d
> index b72eb8a7f..7d92bf4cc 100644
> --- a/test/unittest/variables/bvar/tst.vtimestamp.d
> +++ b/test/unittest/variables/bvar/tst.vtimestamp.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 need vtimestamp support */
> +/* @@xfail: dtv2: need vtimestamp support */
>  
>  /*
>   * ASSERTION: The 'vtimestamp' variable can be accessed and is not -1.
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
