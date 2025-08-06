Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2AB17A2F6
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754504320; cv=fail; b=eUvh8Psibl2UaqFgMBEH8IJ6zNL0VauH37rjkTfyiVxYA4kKJN1ZlbnD1xj76zNiB+a9NgJkVcgy1WHb2tjX3Uhs/2ljQ91Ee8is+KE1JAfqkj97uhlFzH/KWJ8cTn6uFXSoq74zI3k1WueDZz0IFwS1r4SAbZ0HCfvThDIbZH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754504320; c=relaxed/simple;
	bh=JjmqNd+QoIFw/32OlVQnS5qGCvUs4Zu0Uvn4GNPECq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z8W0TWZYe7ObuaIw01h9j4J5I63nI2pY/jhePMcXKfUCpGzXv6ku9idOo8lNEzGU9pgLE1gO11JkyLjTfTAvN5kGJW6MUwdyIhxQRBcwK540RZcFSudTpfwNx4uzs63wDhYVj2mQowDMSLUPm2VbgIEa8N12wZnZvfguBgZOOjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DukjlFlK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JAC5f/yE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DukjlFlK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JAC5f/yE"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRmMg020506
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BLjPmCi5fvw5pDtzJe
	DNljKd34COyejXtDtIlXPWSb8=; b=DukjlFlKvDFrx6Zm9Eh1NbpkVt6AzBZvUf
	5NIdCqRxKA38yAwA4L/zgSVDs9LSSUELdHHwy8WSWnmShI/Gd2ooRxvVeurdQvDj
	+5Hb7SOslGorERtkdFPC1P+lig7frcdnnS9Cfu204xKb0KCJJjDQZw/l1N+ja0fe
	0Nuc8ws0BMBYFbx4dmB6iPxV5aEpR07xIqAQ7iSIHrQA+RUL00TiSXqo+ue4QV97
	Rjy8L36crYLckgQ7bPvHUKRlw8kMgurE2xlR1n1RN6rs9saXbunhYKMaVBRToA3/
	xr0rgsSctKw76V6vDYM3IcrQ+eCsw8nFUlDbHtNCOI78Njeo22xg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf2b7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:18:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576Ge8Cg018431
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:18:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwrcxb5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km6gki+Mug5+UqorReha4NgNnG3ARf6mgXyFKtiAAGcOaY27VPabzX8Ob9K+Q6V3kVnrUzSf+JYHfJu0Z4+LpgjTUaE0+FqeH/KwcedgVa00yANxBYcXy2zqck7q/2IC6GG38Gp+8wGO1tLB2neJnJXeBJCLEE0OZyzKEVBvc0CorfgXPkFG6VYzXH1Ow9X9uumpMm0R9GevTz04MZu3AKk/py8EI5uarK48BER7J5hyzmVPlbuMF+eRRrD+E0z361OtmvUTKyNGD2RQG4xelt0ypbUGtWlDqR0F11vpFOqBMQR7Y7JlnhXvPzdyvNeW/d/EdOWtdQh07Hecfpk3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLjPmCi5fvw5pDtzJeDNljKd34COyejXtDtIlXPWSb8=;
 b=WHTAshteHW+pQ7b0Hzk2UE25qkSo5RJtl1sbRSmdGWqiwYMtJigbeFJJI9sTTAMxPzi1YEWvwvR8+OFky8hnYgfY5PeFcJQnkZtsgUIXFc7Hj+KO4Kjybmhp8FCIzaLPlX8f2G4PwuWf5aLNSGr2oOKE/H7289lX9PlyIOcOQwbo8BVZf95QfC4UhLco0GFwafTQNlsq12lyJzydb4d5nJTQtpwf+uUuU76NVHWekPoOqXBdRJvLAOCAIpdrnEknRbrkbt2+eWeJm4jv7hsRFCOUy64uK8lOQsep0cfBggHrUlqfKO2wqua6wx1kU2PUfEnpl8Y1EAq+pBZd+lKS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLjPmCi5fvw5pDtzJeDNljKd34COyejXtDtIlXPWSb8=;
 b=JAC5f/yE2mCvhb+XnBa4YBx3u/dWThVX63NGWDZNdIuctfjfbPRZ1KZxN58k5BQkFkogmLsNfUhG7E5AdzsOgKb7I1QPuHcZVfbn/kQuNVPYZ32JXfdRs+CFATcSIr9kyC2QZsDM+xDa3kugXnn5SWDbHcJevVGBbABswzdjUk0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH2PR10MB4390.namprd10.prod.outlook.com (2603:10b6:610:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 18:18:33 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 18:18:33 +0000
Date: Wed, 6 Aug 2025 14:18:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Fix post processing of return-action override-pid
 tests
Message-ID: <aJOcds9zM5BgejTI@oracle.com>
References: <20250805181221.17770-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805181221.17770-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH2PR10MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 235a96b2-b750-412c-e257-08ddd515a6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PxARAvKr1eqZJ29BK8MaI3B5Oqz/A3Ib7X6u98uFudEkm9JvNHU1Zxn7T1mZ?=
 =?us-ascii?Q?QL/EiyzPYEvmm3OUyFbVZaBOdv4Ujrw7gxaFlJ/jjlLl5IhUaJCOFojRpgJi?=
 =?us-ascii?Q?yMn6uXHuAX5FhWxmf+gGF/ZNH+GHLgLXg7cJsPUwOt1heSKTe8/GBAzCNcy3?=
 =?us-ascii?Q?S2Pw7XQReuylju9sVLctcvPnC5mWnRvYRczAO+1ruCP7AGRWBTU5R524/Kwh?=
 =?us-ascii?Q?cMYkxW85kEV2Bfk5xKSYM71JHkpkk4Uxxo23cbUp55JXU9mHBoLKtTccU8JC?=
 =?us-ascii?Q?euOK5UXkVJA3jUYaZcEqTLG8WV5n99cGQTfpITNtGQiwd+6yXUjyIMzzM4/H?=
 =?us-ascii?Q?9xIzOy6M+mJYB2OwTBDpt9U9wS2iHBSPniJhGvCjCGZEaUWMVxINT73IyV2P?=
 =?us-ascii?Q?UvIV76HnGsuVfF7noRFdJH7aDbOJG5WXp+xRJKPI8APRf1fQiG7lpdp7/m+J?=
 =?us-ascii?Q?9VkE3WAUKdB3Weq3q0yboJyW/LtjC1s3JucFYAiFjHe4kHg0Yp+/zH4NV9ps?=
 =?us-ascii?Q?/ZX3DcWRDHHcFW4Tmh6wS7Gw+vJFQDhUxBjngUK27/1LOlXTyHxTfZxUTPMF?=
 =?us-ascii?Q?5SyidysAZTHnaBsVBXqF3OyvvDznSb9XzFYeqlAnO4CPsThrF8tYToRq4O+6?=
 =?us-ascii?Q?x2r81il5KkGTvroxYYGLPWErrw7Ad8Bw6aJyycg3Yg4LTaYHgA1khxnX4/Cf?=
 =?us-ascii?Q?GsguCVktufooL1ghsOM/q54UY2giAn4Lkv0rABTUW6EotzrzTIXDZwZ4t3ts?=
 =?us-ascii?Q?dZYIf/ugDlu5GJz3IY6TOAEE5xc6Nytg1pKbdttHZQYR/ulBe0Hxrim8p9sG?=
 =?us-ascii?Q?4kYD/kZQGBZ19K0SOxPi30xXlb+wfCbnW2/MPJQ7E89E8nDGPXCFS0DSBXUY?=
 =?us-ascii?Q?iMo9V6AWLKoatN3rm3Mb7Onzn92izV7dM4QgOy7ZDgJCd4x5W/7AXoSr021O?=
 =?us-ascii?Q?hr/cxs3eW6wLNzfFfxEH+cQuMnKapRcvUN5N5RIGFKeQTN66XohX4ZIBwDCB?=
 =?us-ascii?Q?eJEDmAjq8pVHWQeQysEumkY/LxhWgKmb/oueG2uwFVVL4zK3gz2nahDVoIQU?=
 =?us-ascii?Q?zPAktiXY+XrFqMULxcnRJmm8sLBz8Sns9Ucb9rbjiB2VYEGc9RkfXD775ouF?=
 =?us-ascii?Q?zaSEJL4cu56xK7HSYFbdFnx/qiHi6ErIpel7gqr5mN+fXIDSKI2AW+K70fa5?=
 =?us-ascii?Q?UEZkvvXBA+YOkDaBwF9j9pDfYnD9jiBEZPIwrwKD/iJrekZlCSKIgyErciz1?=
 =?us-ascii?Q?NCoLH95deJPoI51TYk0cydTf4a4MLW43HowSv6R5w7jsVgh/EgUyYGOfIlVI?=
 =?us-ascii?Q?xdiHY/NKikfLNF82Dg4bn2g6r36Ct2tfvU/VvxOWY4juSiVmTlEtwqEVMhR7?=
 =?us-ascii?Q?ifX50YLW0BX3+ytWvzA2fKwRcsdOMYlPRiqXD/cnyEJ1RN7xzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nCZFYcbjqH/evamawhL3gKboiE0clALE1UQw+wqBWgb7oUqlXuEAj3gE5WZ9?=
 =?us-ascii?Q?IxEuRcOtGK/Z58S6nTvvTJG9by4TrLpaj6mwVn856PY5DzsQXkX8EUtku1CW?=
 =?us-ascii?Q?bOYKL1/cvhmK0Ua2ZF9yng7CQT4CDa/G/+ykV5xA8N3a18Tq6HwTtqGxgSwi?=
 =?us-ascii?Q?YIx8YJA5gQzwbw27YHuxr/TxNRo691A2cfAcGDSe/8H4jzyYXSd8IBrXqENA?=
 =?us-ascii?Q?bHDzPb0DqvPhTVcvYcbCSXwS4shBEka2/QuAPq7+4ObGWHMupWUTdQGKTA87?=
 =?us-ascii?Q?CFXFiSHZoINt4zFqKV3mEpEMF8M+pNEvvmmWLTdSReybJPYQhpgXRmWFD9Lc?=
 =?us-ascii?Q?PDXI5rclRsT1XEYD4gP+XNvLKnMCAyp4ly4i1sO9/swcVSvj+T1vk4fTr9JG?=
 =?us-ascii?Q?HIn9gorhn66D1sdEPdygzG9hrNiJoB2ngsxNfnN1LER+bpOn+1h5QygrTeV1?=
 =?us-ascii?Q?bWXDEsKuoJhKE8ZFbvEHXm4GdrQXqqLf1J86DMiqRy9x4welgNiJzK25wsdV?=
 =?us-ascii?Q?1Tp+5j1nDIWCzuYay9ZpbtxvrQwrSs4s3Ehs6n0obLvaJxFjhO04B5G/meMZ?=
 =?us-ascii?Q?edkXr8y7Vazk7gxa1S3gYEpqmp3cVJiK9/1HkqbW18aC6MWfEeWfTYiwC9QY?=
 =?us-ascii?Q?mLp6HI0v3+gODkGmpeCow1GtZ1RwmOZku1/12kczZpwbMUs0Rblo2I5geFFs?=
 =?us-ascii?Q?JLRU3SLt+aQlO/0+akleqjz8Ko5uI4HNDEnkLg9heZuQlChFlnG4D8H9m4um?=
 =?us-ascii?Q?eBZLovtKnTEIDYPBVuYvg77gXncZqoKw1wYjinkATy+zGzu/vHQx3okM36EK?=
 =?us-ascii?Q?jkvMoOPYofQSa4GT5jsGLA0vcspTBFTIh1v4v6tIuomTjORSHShPg1Hc15HN?=
 =?us-ascii?Q?zxR7MpUf7CkuXWDUe9+padRvSjuvHjM8QzAcb0TwJd8Sc/I05S+ICYR2oETH?=
 =?us-ascii?Q?KMUDR0iHRSidQ5mQ/dArKQR4EkgjRWjSUQrynTV8tQfUvUKsInWR/YWjkMB8?=
 =?us-ascii?Q?RsH5BbOyxlNLaOI9f93Jb9iMJxF+duO+9xioZmXRbaTCdIsTHgvEq4KC7Mi3?=
 =?us-ascii?Q?Zx2F6LjyVCSZcPNYmc3L9f5LbV1ObKglvu8DDAgOHmpPkEzwT7fbkbmKkmFG?=
 =?us-ascii?Q?Q1GLcizOOzKOsUOxjrMHWvF3X8rNr9C6P/4PT2ov6N1EVzHR+Ue2/nvOm6hb?=
 =?us-ascii?Q?ddvOMpJyMQTJSAGMPg6V1ZoZEkZHe1526rE94i9lxeYvWKZ2edwQHJTL6Kpz?=
 =?us-ascii?Q?b/Y6Kgp+8BMaQTmkas+D6aTi9/+DqYm/EtpJvjiKrnhSQK0z97ejh1NwdGNK?=
 =?us-ascii?Q?aqwEJCE5IfLNGHBrMShVuydOsW2pxebDnuDok5bIR9pp+OG/QZJB3QjyImuD?=
 =?us-ascii?Q?mP1i42pxRNmqBQZXK2xZVE5szZY0ptz+9PN740lwYeu1r6295QtONl52zcml?=
 =?us-ascii?Q?VN+N94xMuXf2MY1zfsV4WgabBdnS67R12DdMMEV+rdpiVsk5F/1AdLuTiRT/?=
 =?us-ascii?Q?SA8/fXOGwH6ucrAkSqaANXjW7bDakopq9hYecF3GcdBczKYQ/7zYnNmOMP7D?=
 =?us-ascii?Q?0ijGBhCZCOaoCzh1Bv8pZPQWtrAnAEAYvENevS4jVCQ2MFi6jFFKTqG94FBf?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U6NiJKRQjxoW8i083MRCpQlKxTdptE7SGdoD2AFTmVs8zeWYGIyAPhj47qq11KBj7+wt36GTL6FYS9zRDhMWwGhI0lu3xKx8M31G8kiIOUS4VUbamw526iZzg9frY9OXEXmC4D48r2hlwcluwLb+UMK3R3ezUcdf+w7w95k3Y4PdbsnVa5H9GSax5w3S9zOt3D0RLpQdZLqWUiC0BX0vt52taGzkvYdR/o3yhOAGZjtqhJfpjFLyeQ9tZDsyPhkrSu7LDuxPlwG1Ef0IC0wJjP+1A44qI4Ma6QaHaFkw0ocywm7Oqt3Y9pLViMwIA09VnCOcLtu5qmI6nfADDv/PR/Qrwh942ceFWKzBYFDssui75m+wdNxZEEhh/kpZ1ZW1Nyt4ibqjAtd97XAeTlegrPrgGFmAOSVIHLroLNrnMw7ECYI7hY9KhJd04cXBn48ylCTd4MeFmDBoT1+Yg+2fMfkNLTxTo+sy+9sBxbwp7FtGbHJLp0ph3w5+zdC7EYc6cOk8Gm/CBKv2tvtzFPOK3HnpujQwMVzOONd/LQZG2wC2rOCHofcGNiBRNVsUFeNAPja2i4fJbOesvkiIqbhgQxmNH9JhRE1/oZY5+rx10Q8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235a96b2-b750-412c-e257-08ddd515a6f0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:18:33.0236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJnt7D4U8XkYm8qxHFnsTc9vsrk17VpBEswecjl4qecxc3WmHndtyy6aYoEBcrZpeOq0t9nabLnwwTzkqHaEyz0RaJ6YbjME4+w+JjE0eIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4390
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEyMCBTYWx0ZWRfX3ZNyTlTKqVqM
 tsvJLeNb3Fv2NYHyAe3YZ5oAGVUP+lajwnaKAPAFYBftwkAQ4cCPa4DhbEzloB3wZQ6LMpS/gXr
 8O+PJTEVmAfycmBiex56gI1wGJz7ogv2yC5qEQ9sTJBQbf2qEMQB5mLaxablOnpU2ChYrLbhdvs
 wLpA3j2HNjvccGT5Rf9clmACoAnfsYsWflx5/1cV/00oBfYx1IShV87jye3kLNUrEj1qsvOrA3+
 SXwpGfiAijp7IR7B/UbVRqPwfiXbxRsZRT1SvkHSs1+C0h+Uw2F8Kmj4Q9NgltOLTzcE65wGlhb
 v3TQNifmyOvvGK22YDecLMMjMsWraMy12AX9WxszWm/kSjnrJouSpvmXtqk7mLtn6t3UNOYjmPW
 GdZZWADA0JC4JSd8IUeqOGjYdtQtONBVrXH+zCwwPNmkoMpaHFCTCxWFLKccq0j9e3JaO7kM
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68939c7d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3DgdZUfvUep6-0stJlkA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: 53KnaNX3ib0pzK_I4k-kEb2nVopbuEl2
X-Proofpoint-GUID: 53KnaNX3ib0pzK_I4k-kEb2nVopbuEl2

On Tue, Aug 05, 2025 at 02:12:21PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit ee8c066e8 ("rawfbt: selectively allow return() in clauses"),
> tests were introduced to check that return values are overwritten.  A
> pid check value is output and used to facilitate comparisons to a .r
> results file.
> 
> The post processing logic was flawed in two respects:
> 
> 1 The check value was being pulled from the "01" entry.  Therefore,
>   the "00" entry, typically appearing first, would not be converted.
> 
> 2 Values were not sorted.  Sometimes this means the disorder just
>   described would be avoided and the test would pass.  Mostly,
>   it means that behavior can be erratic.
> 
> Sort results and use the "00" pid value for converting test results.
> Add $dt_flags to the $dtrace line while we're at it.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Not sure what happened - other than that I must have forgotten to add the
corrected .r.p files because I did notice this issue and thought I had
committed the fix for it.  Oh well...

> ---
>  test/unittest/actions/return/tst.override-getpid-entry.r.p  | 2 +-
>  test/unittest/actions/return/tst.override-getpid-entry.sh   | 4 ++--
>  test/unittest/actions/return/tst.override-getpid-return.r.p | 2 +-
>  test/unittest/actions/return/tst.override-getpid-return.sh  | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/test/unittest/actions/return/tst.override-getpid-entry.r.p b/test/unittest/actions/return/tst.override-getpid-entry.r.p
> index c838391a4..1a9b7b1bf 100755
> --- a/test/unittest/actions/return/tst.override-getpid-entry.r.p
> +++ b/test/unittest/actions/return/tst.override-getpid-entry.r.p
> @@ -4,7 +4,7 @@ BEGIN {
>          mypid = -1
>  }
>  
> -/^01 [1-9][0-9]*$/ {
> +/^00 pid is [1-9][0-9]*$/ {
>          mypid = $NF;
>  }
>  
> diff --git a/test/unittest/actions/return/tst.override-getpid-entry.sh b/test/unittest/actions/return/tst.override-getpid-entry.sh
> index 2282305e7..d9436a532 100755
> --- a/test/unittest/actions/return/tst.override-getpid-entry.sh
> +++ b/test/unittest/actions/return/tst.override-getpid-entry.sh
> @@ -38,7 +38,7 @@ fi
>  
>  # Trace the trigger.  On the 2nd and 5th getpid() calls, modify the result.
>  
> -$dtrace -c ./a.out -w -q -n '
> +$dtrace $dt_flags -c ./a.out -w -q -n '
>  BEGIN {
>  	printf("00 pid is %d\n", $target);
>  	n = 0;
> @@ -58,6 +58,6 @@ rawfbt:vmlinux:__*_sys_getpid:entry
>  {
>  	return(55555);
>  }
> -'
> +' | sort
>  
>  exit $?
> diff --git a/test/unittest/actions/return/tst.override-getpid-return.r.p b/test/unittest/actions/return/tst.override-getpid-return.r.p
> index c838391a4..1a9b7b1bf 100755
> --- a/test/unittest/actions/return/tst.override-getpid-return.r.p
> +++ b/test/unittest/actions/return/tst.override-getpid-return.r.p
> @@ -4,7 +4,7 @@ BEGIN {
>          mypid = -1
>  }
>  
> -/^01 [1-9][0-9]*$/ {
> +/^00 pid is [1-9][0-9]*$/ {
>          mypid = $NF;
>  }
>  
> diff --git a/test/unittest/actions/return/tst.override-getpid-return.sh b/test/unittest/actions/return/tst.override-getpid-return.sh
> index 078d68a4a..835e443dd 100755
> --- a/test/unittest/actions/return/tst.override-getpid-return.sh
> +++ b/test/unittest/actions/return/tst.override-getpid-return.sh
> @@ -38,7 +38,7 @@ fi
>  
>  # Trace the trigger.  On the 2nd and 5th getpid() calls, modify the result.
>  
> -$dtrace -c ./a.out -w -q -n '
> +$dtrace $dt_flags -c ./a.out -w -q -n '
>  BEGIN {
>  	printf("00 pid is %d\n", $target);
>  	n = 0;
> @@ -58,6 +58,6 @@ rawfbt:vmlinux:__*_sys_getpid:return
>  {
>  	return(55555);
>  }
> -'
> +' | sort
>  
>  exit $?
> -- 
> 2.43.5
> 
