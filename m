Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950F2D7DE2
	for <dtrace@lists.linux.dev>; Mon, 20 Oct 2025 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986582; cv=fail; b=IXJqh2Wvayj4tkzILH8jB9dkPG/T1hgvd53vc9q4hlTF2VXo6az5cgACyFxIWxbIO6Ro/uiHPACKZfYo2yJ2Akvs7i+wxu6HIG8dekNH1BFTf5T3Iiz3ktXOnxjfOiyXKBAB0rfIdkcUN2M5KEpb3tz9n0qwAyy1LUstCAhDVJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986582; c=relaxed/simple;
	bh=bqsh9hJn/wVr4q0IgC3Vm0thPn1lAHsjG6IGPAYDMs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H8UCFa/+Ji+rSboxZV2MIdu21gm6nKFyRjsHnnye+T7AfLKrLHR+UwloulfGa5xhBAFfugziaGAKG4Zom6bjwd0YQsXpd37Cs3e4vCrzaGq0pgGkAQBFdDxglcHIb+rN+e1jS/rTzdZh5qafmdRc2Gn/MHcImMRITMZfIAdRmfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WkUQ6Lqq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DAy8BUiI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WkUQ6Lqq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DAy8BUiI"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KFjx7E017793
	for <dtrace@lists.linux.dev>; Mon, 20 Oct 2025 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IagnC+QMreOC/hUuNz
	VDXIQwez7O4doW/R+b2kND844=; b=WkUQ6Lqq9Ro1N+A71VxZ+qyB9SyT+VBlx5
	ul4I+nS2wmkC0JUXzWToo+KIrWtm2KrjvCLzJhPX3auM//CrJEfazVGfdLSxUsLk
	1hnfqLpoEuA9rQ/87/jGNovmfdqUoFedogDpJ3/BX/zIokqmpedzXupdfz1xj5I5
	yOqi3rz2CZTJQp+DLCj36hqXQRYns8edUcbTHYj7mmW2wvZ4b5DyeS1scINE4vN6
	DGZFVg3AGM2ro0YyTTPdNXhSKn0JZf5ymbB4TSfikmnN/hGBo/8FHHRhrdMoJcdL
	I0yTsN9GJqqNiQiZ0Sd7r8fpKPAqJISoWiZv1AqGZrmgC8fbireg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2yptxpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 20 Oct 2025 18:56:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59KHi9FD032466
	for <dtrace@lists.linux.dev>; Mon, 20 Oct 2025 18:56:18 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bc1eyg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 20 Oct 2025 18:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBc0H6tBNiFvzArOXA3ju/7W7GvEBN8ITsvWrMbHDzAdg16ksZF0YOx4L0ibxGywYRedcBpSrUjXLdIvFrbsNsV7RFegRSSf1EZ9Sxb6qxogHIn6Pw3ZDOStR0gdef5UXg0BQCyFm3+2QscyKtxz2wO6JHaoHi7hACx2nCDCacBSFXpDuHB1Oaj7GZRufUYD729U43WrOP0nlZL4wDUvRP/HGFDsCwYPItbaOmXlTP5ktFR9lS9jiUKcna+4xy0b1KX03sZKn1AEXuB7BJwkmUymmC6Z39sxfFpBljO+zVsPi41mW58aj4Cx6VMW5kcNU18QDvYPg+jklS0eEH1sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IagnC+QMreOC/hUuNzVDXIQwez7O4doW/R+b2kND844=;
 b=ABE/rUsEJBv1FaPREmK0PusAwO4hLGX1EMR3NuP/JCNn7zGlC+aA0o+t4UqtT9wTB1Fdykwjz7iaqQtFQ0tdOgKvC8iKsarbHBEU+jt2MWnU4Ndrf4gb+NxuQAZKg6FPwGE56i6vk71l9AP/Pk++ovdAPcvp6nufuHDxGinodDK21g+hbHVmrEY/XoYOKsZyyabBECGU4d3TqZGP55heuL2wt/7Mi76+GD4XY565GqDewWQSTkcYiG1vopYXcA4V36MrYL+lfjF6K7sSJNIeVaKHjDRZraekNMbVgS/rXQwKkAjK1VQqiDO/f43kTWaDKwNGT9L6Wartufe396r41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IagnC+QMreOC/hUuNzVDXIQwez7O4doW/R+b2kND844=;
 b=DAy8BUiI/+GOebcAn3kg8XQiAwcMQNeWoLNkmPdBDMY8mkIkY3G0t/Xu4rpgUpYXwfvMQhqjtDAyvWPw8B1wmlrACLQp1KfsFFhYXIwLjx+8EwVduHYAnYcPiYXaZeFBAUYD74Yi5URoN1DMg4+vUSSA8K+tTD25BB0gYGjW35Q=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA6PR10MB8207.namprd10.prod.outlook.com (2603:10b6:806:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:56:11 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9228.011; Mon, 20 Oct 2025
 18:56:11 +0000
Date: Mon, 20 Oct 2025 14:56:08 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Clean up stack_fbt test
Message-ID: <aPaFyMRL+Lwa+OGf@oracle.com>
References: <20251016205641.15446-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016205641.15446-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA6PR10MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a23d6df-e699-4717-1298-08de100a55d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NP+F3aPymLtExLG551QZ9qXRCS57dj1vC+IUqSXVzojy2DPgjTcp6NyqltJb?=
 =?us-ascii?Q?NHnsZkaAmE9dYDc+I446KxDLjH8op2o8oa5zHw66fP/k3FwGSsX7tvDcL05I?=
 =?us-ascii?Q?LfqXuNNJ16OgYS7+bex0+001fZzZqr9podqCCx17boPeQZl2FMo1gilUPenM?=
 =?us-ascii?Q?dFPGgoAWtukbZcq3GqgWOqWzv2AZN6ynUemR++wnUPmrWFUDshftC49cQpIS?=
 =?us-ascii?Q?vtngWmN2oC80NPRZ3hin7YSQeYtmzHnvd83xvwJ0O3IdsY74Oo5ghn+cPhaY?=
 =?us-ascii?Q?YMe+onNtj8XWokz6tz3aUfdvyIQB/b5BySyq2LVz++OUkbBmTD/okzFSp+Of?=
 =?us-ascii?Q?iYispvElScFVwdvFMp86+n0NjERuyV1E6C+WvdDLbQf6LlSIdoRlrP/HgLfH?=
 =?us-ascii?Q?qsdinC6ddjUirw18I1FLWGs/q65w3TADhZzJXs9eC6e/K+gGI1KIb0ws3R0s?=
 =?us-ascii?Q?HgVaLFDbdFu67uiQhIs04W2jniigbgfUPnauteSjUdJphCXffUUSx6IHioRt?=
 =?us-ascii?Q?pGCx5NbZhJJMzfQzBY9ThQYZSyWoig0MSYqAw7Td26XaLlMXGKoJ9ylF5xdO?=
 =?us-ascii?Q?OIsr85Ho49AZT09tV85Si4qNVsduVfWAMXgzedVWsjySYVkVhpUKdi7Ou871?=
 =?us-ascii?Q?flpTzU6MZdOVkW2quCZt92puM6AZBjsfD7+IcKAFFzXXfXxUUdG/XBZjyAp2?=
 =?us-ascii?Q?gUbef7rMCDQvKjUqBYyhe4pvlGjx0Nmli/MvRUTPP2vdBwvDJbgPl2AaN0v2?=
 =?us-ascii?Q?ym11bnq3iZYs+shyv1mTZS8fWaA1ryvIp1wMfsuGwLp38b58eDkjLf5bzxhH?=
 =?us-ascii?Q?qu2o8ublqEtUKFJekXhyGyFnmthqJP6bhx5PRzYtpnL4pdf9bKqly8BVlYui?=
 =?us-ascii?Q?i36ktNkqZ5dAd77FqUq9BiFKXXRpfomv+MSRgFt3loEiJNybr2CC8Xl1cmc9?=
 =?us-ascii?Q?PZGHeG7RQ3stsuRVkGUDr6LlS4aWhiH+Y2HyuAhCcKheyZ9VTTFaqDeZTI3e?=
 =?us-ascii?Q?eI8Kc2EpwCq3+bZPuoRbsfSg5WWu5fuPaIfug/NRJQHQlLzQy9eTmkJ5h7sH?=
 =?us-ascii?Q?GeSEIWb83m9FiB179D0fIhjBHiZp7oQ24mYcWANGHtfuYiY/5lNB8de3KB4L?=
 =?us-ascii?Q?NuCEXHnIbGDEbzywLpGEvq9W16FzswKbeCF4woHhTgiWxqvmsAN+d+/dF8Hs?=
 =?us-ascii?Q?Q906qJhPuehnz1/KQE0l0c7dmO2HwYwcUUQlJV/Hz8MANnWKpu3A0HAspUps?=
 =?us-ascii?Q?2YHxLIIuVxyUv5JEWNRrtkqKpQn7uZs2ZkN+02qHiEoeBKiH/NrSKp6cqgEh?=
 =?us-ascii?Q?BmjD//DA9jz/ov3kJxu0ND3acwhVc8DZiOnqSAILhxg5URsB5CAIJcn6lCxa?=
 =?us-ascii?Q?1oqetrZ6A8JoApkqpSbJQbPq9azSfGqcspLKXmdPRbh1doAxlqkBMX5zXb+7?=
 =?us-ascii?Q?so4d4pVVKgxJM8rLNvQi9LqvaxeT9f5tx0yDuoNofBtXjnJzviWx9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B4u4joBwOFT93mzxZBPWJEk1r4vjiX6I6wqDEw1wqJh0bmbIhfYklTj9EZwc?=
 =?us-ascii?Q?jR4S6o5iOML58eL/LKhsOdwPBsU4t7KWNQSOSspVrCv/ctwx40KIUyIYGnYI?=
 =?us-ascii?Q?FUkwIFVJ6dlcbKt4objReek4AGIy0xtpCkkNk8rrpFBeJR5GhGrvUUzQ2M1F?=
 =?us-ascii?Q?1uJXp6nHENTaMA3zw1+Fu0mPG3iD6cXrQPwrCzL+SC29Th2STVR9efCBjyNS?=
 =?us-ascii?Q?MPrfmmPYqAehs3Avqpu9AQYyiqBsyR/AiQ1tNZALjag3OvMNEBm99/Or0ZPh?=
 =?us-ascii?Q?e3YqSqgBycs33fsCBk7YXjftLfcga3/Scm8S5Qjg1iTrvCk9dlX3YX2f7uiM?=
 =?us-ascii?Q?aAcst0SozE9KKj+aViC301B2h756owsfVEdfCPu+ALog2xTnH7R7YIZzssKO?=
 =?us-ascii?Q?vDYX9dAeo8ZVSFV9aV2V47txnXFQ4HaE2fLOLzHTrAgMznbFQ2z9s9+JkINA?=
 =?us-ascii?Q?/LEefTvuGZnyMak1t15SdWYMTk1O2+7RJY7WvMIPMRMBFiBcVE6t/ncQ4t4c?=
 =?us-ascii?Q?D8+JlBWiyc42Z3txFi7ZtxSrlw7Bvxsqg75fhHCXPex4QM0UNmFo9HWgc8YZ?=
 =?us-ascii?Q?Kv7J7MDzKwWxizfnm0orbu77LIryZq+QsARzwPkZyHeYMB2dmfoPQfl9Xrzw?=
 =?us-ascii?Q?y1HmGCfLi+InK7VMSrNs5o77QAwv6eLSjBJ0rMyHTMFZ/Xt3XaWqYLDvQXF4?=
 =?us-ascii?Q?+2gNZl0geGPQnx7RNvfDfjOwCYT9xxVkbCQyLkvRBN/t/ZfsA5I5PGGzuaj/?=
 =?us-ascii?Q?iKjwehgi++2qJ2RHL6g62EMC1hAq5trIXwOlPLO/IeVcIs9GBBbuoKuSGoX2?=
 =?us-ascii?Q?cwTv+hZoSYb1yLIp85f6gsUlckBqYLHwe/zXAnwad6RC1+zDYg85GamVXp7R?=
 =?us-ascii?Q?A1OJFS5n0Wdk+heX13YzloDW1blCeXbPRNa/TQMfeKxWPbGwdM0jnVpKdPN4?=
 =?us-ascii?Q?x1gpCdDb7jMFv9AXHOxyi6jlZ/DEqrGkPmMKGXH9tqz16aJDQ9wOokL6sMxf?=
 =?us-ascii?Q?jHmOGYCuDVmKqjPoZrK8c24RzgNzc+oTBC0iRbUDUO6+/px68MPPCaf+urv7?=
 =?us-ascii?Q?DMtAdRM7s3I1pipCqtlFbLVG70pDSHw2GkKVnfrdeE9tDD0rYvi6+F5qu8xs?=
 =?us-ascii?Q?KShsXHHOcjj2IacBAWMnlA909qLc85s8tFKzWvED/2e4v86kmpSns8fD1EUf?=
 =?us-ascii?Q?Lh3nz9p1DG8nSA5DgA7mhpAhRDpjH5QjLMFG6/e8CR0jT4f0BwBsBBwxXSqk?=
 =?us-ascii?Q?pvPzoMCos/4bUWM+6h8iTUniirU49xd34E0wvXH6dlMPSl1oJXSTlkcUXTiX?=
 =?us-ascii?Q?mJqfJ0yLReaF2ddmVaER+bFo7t/j4PpFavrbF1bTE/W+Huc00grlkNtNMLht?=
 =?us-ascii?Q?Nv8cTEKswy/Qiox9j5BYOXkZKgvXzT+ZPAU9yJielnhpf+DgKDxB7BySe9Zj?=
 =?us-ascii?Q?pW/tYBTSMV723jbZf+kKN03qWoi235PK728KBVcU1CKlwcVGWuyON9gz9web?=
 =?us-ascii?Q?0wrR0CpCZN7PhCylpw2YeQIwr2qkXwX8ruw+P3xixOlYjhj8dDqB3EUMhDjR?=
 =?us-ascii?Q?PgcXAney73MaHDnGXlOvqtVEygxquVrknAYdZANCrARiA182Zzaj9hVMUdKN?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OdsjPtFH3vGDUetyHDpUVjn7enFcsVHWtaCaxuHIdk19SsGlHS0RiBDuh13QmM6gU5rE2wDeqeTpDsUzS3Uk1I08+Ln8dVTtDY7MrGZVixNLFX8ySn0ilWJqx90oLK1pHsUzJA02FLM9yxdece3o8LUWgEs7P5m3KXXPRTNh5xPQHFv7CGXGqpNwHskEhvxe2QAWsl1XJSL0kBv7NW7V8jKlVtKYhMV619++MDi5lWX0/RfBlipOkp3LIN589XWGf5UDwQ4ePBmD2Vn6iCW1aCzKfvfiEKR1FhYr0EBSPMNGEdTwEZoy7JOnEwbmQGDm/kfddqTpyCqim7XES+B7b3Gt+G1wwC9NUsKQhpSIlzrRwUzCZCmQqad/C6UOcsB3x/X5feC3tYNImUePAcLz3Ku4WBW4HxKJBRZdPsVEMgaxs7dxOJtkjRUAOKeqIr16YH/csqUhxS4GfxSGHx58F4Zv2m2APltKRep1QcyMOCeUhyT4xxqN2q0jJYayPX6oImwuvCwzbR+wsQhDqfa6tkqDIzN5Ab7seHkBj14pS2Jhl553zlpczcLBCXRNJvUht8wKIW3PArNqVVOXbk7jrEpObVR/191cGPAjKbP4Ifg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a23d6df-e699-4717-1298-08de100a55d8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:56:11.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOB0HpOfCukRvxISq0tRB7QlIGAWqFmhTEtWza/QGuixIKrtp0WV2mjUecM5sTXuTkhiw73nTr61baBDGgqSqrp0I7/+BMYQzXfu1nL+x9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8207
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510200157
X-Proofpoint-GUID: AU-NtGz1T28O7vJI3h4XmR83xulT1ta_
X-Proofpoint-ORIG-GUID: AU-NtGz1T28O7vJI3h4XmR83xulT1ta_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX3oqV4jR5VE8X
 XWDZPhNt6QO5jocRVJtwX2gHu4JPqUtJCSZTKGQug6+YpgvAkXChRNG+bdCTWlyTQTaiMtX2NzU
 jqoh2SL1LWDEw6zPy8sITBDq+c9vNSxhxUQiv3CCk8OWLN3e37IlrHPYxnnYuKbCcz6TrFoLrFD
 4Oa6WKxkeD1X/UBcfG+QJ5y9/dtc5QrNWV2M6K5B1EgGz8cKFYI2ut9a5rY503PMfSVKFC0Qaqv
 XgeAONxUKEGRye3b7YZKekLDJtYrTDRXG8FzI+PanivsP44+zXzQODVpwD6SpavarvLsEURLCsH
 mkl9ci+T14LNG19qpQL9KCymWslS/RYZa3vUGintiwwrwYO0VEWWwVIKIVDXBOcbVFGIt/H8edw
 XyYMEtGjF/Z5KgCToRxMb5bofTFVwXztU4Lj8jmIuCj3RCjzTII=
X-Authority-Analysis: v=2.4 cv=Nu7cssdJ c=1 sm=1 tr=0 ts=68f685d2 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=7J1e_QatcAailVVuQB0A:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13624

On Thu, Oct 16, 2025 at 04:56:41PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The idea behind the test is to check the stack() output for some fbt
> probe for specific expected frames.  An attempt was made to specify the
> exact stack that was expected, but there are too many variations among
> kernel versions and so maintaining the test was difficult.  Loosen the
> test to check for only a few expected frames.
> 
> The test was also checking that stack()'s first 3 frames matched
> stack(3), but such a test is already provided by, for example,
>     test/unittest/printf/tst.stack.d
>     test/unittest/stack/tst.stack.d
> So, drop the stack(3) stuff.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... with caveat that we really ought to take a look at some of these tests
    that need more frequent updating due to kernel details changing underneath
    us.

> ---
>  test/unittest/stack/tst.stack_fbt.r  |  1 +
>  test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
>  2 files changed, 23 insertions(+), 67 deletions(-)
>  create mode 100644 test/unittest/stack/tst.stack_fbt.r
> 
> diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/stack/tst.stack_fbt.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> index 15b85be13..f3d321e7f 100755
> --- a/test/unittest/stack/tst.stack_fbt.sh
> +++ b/test/unittest/stack/tst.stack_fbt.sh
> @@ -5,7 +5,7 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# Test the stack action with default stack depth and depth 3.
> +# Check the stack action for expected frames.
>  
>  dtrace=$1
>  
> @@ -26,8 +26,6 @@ BEGIN
>  fbt::vfs_write:entry
>  {
>  	stack();
> -	printf("first 3 frames\n");
> -	stack(3);
>  	exit(0);
>  }' >& dtrace.out
>  
> @@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
>  	exit 1
>  fi
>  
> -# Strip out
> -# - blank lines
> -# - "constprop"
> -# - "isra"
> +# Ignore blank lines and strip out
> +# - ".constprop.[0-9]"
>  # - "_after_hwframe"    (x86 starting with UEK8)
> -# - pointer values
> +# - "+0x[0-9a-f]*$"
> +# - leading spaces
>  
>  awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
> -               sub("\\.isra\\.[0-9]", "");
>                 sub("_after_hwframe\\+", "+");
> -               sub(/+0x[0-9a-f]*$/, "+{ptr}");
> +               sub(/+0x[0-9a-f]*$/, "");
> +               sub(/^ */, "");
>                 print }' dtrace.out > dtrace.post
>  if [ $? -ne 0 ]; then
>  	echo ERROR: awk failed
> @@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
>  	exit 1
>  fi
>  
> -# Figure out what stack to expect.
> +# Identify, in order, a few frames we expect to see.
>  
> -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> -
> -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> -	# up to 5.8
> -	KERVER="A"
> -else
> -	# starting at 5.8
> -	KERVER="B"
> -fi
> -
> -if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write+{ptr}
> -              vmlinux\`__x64_sys_write+{ptr}
> -              vmlinux\`x64_sys_call+{ptr}
> -              vmlinux\`do_syscall_64+{ptr}
> -              vmlinux\`entry_SYSCALL_64+{ptr}
> -EOF
> -elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write
> -              vmlinux\`__arm64_sys_write+{ptr}
> -              vmlinux\`el0_svc_common+{ptr}
> -              vmlinux\`el0_svc_handler+{ptr}
> -              vmlinux\`el0_svc+{ptr}
> -EOF
> -elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write+{ptr}
> -              vmlinux\`ksys_write+{ptr}
> -              vmlinux\`do_syscall_64+{ptr}
> -              vmlinux\`entry_SYSCALL_64+{ptr}
> -EOF
> -elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
> -cat << EOF > dtrace.cmp
> -              vmlinux\`vfs_write
> -              vmlinux\`__arm64_sys_write+{ptr}
> -              vmlinux\`invoke_syscall+{ptr}
> -              vmlinux\`el0_svc_common+{ptr}
> -              vmlinux\`do_el0_svc+{ptr}
> -              vmlinux\`el0_svc+{ptr}
> -              vmlinux\`el0t_64_sync_handler+{ptr}
> -              vmlinux\`el0t_64_sync+{ptr}
> -EOF
> +if [ $(uname -m) == "x86_64" ]; then
> +	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
> +elif [ $(uname -m) == "aarch64" ]; then
> +	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
>  else
>  	echo ERROR: unrecognized platform
>  	uname -r
>  	uname -m
>  	exit 1
>  fi
> -
> -# Add the first 3 frames a second time.
> -
> -head -3 dtrace.cmp > dtrace.tmp
> -echo first 3 frames >> dtrace.cmp
> -cat dtrace.tmp >> dtrace.cmp
> +for frame in $frames; do
> +	echo 'vmlinux`'$frame >> dtrace.cmp
> +done
>  
>  # Compare results.
>  
> -if ! diff -q dtrace.cmp dtrace.post; then
> -	echo ERROR: results do not match
> -	diff dtrace.cmp dtrace.post
> -	echo "==== expect"
> +diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
> +if [ `cat missing.frames | wc -l` -ne 0 ]; then
> +	echo ERROR: missing some expected frames
> +	echo === expected frames include:
>  	cat dtrace.cmp
> -	echo "==== actual"
> +	echo === actual frames are:
>  	cat dtrace.out
> +	echo === missing expected frames:
> +	cat missing.frames
>  	exit 1
>  fi
>  
>  echo success
> -
>  exit 0
> -- 
> 2.47.3
> 
