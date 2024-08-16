Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723B80045
	for <dtrace@lists.linux.dev>; Fri, 16 Aug 2024 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723836790; cv=fail; b=STqkE6QPfdnqi1vgQCO2rF48bUCMhO84bPCTO0oSqiP7DyXCQ3jEED98Vfr1lsFgwOdun6i02iHsryk/4HdQwi7rVvwvgCecgPBdaZ+CJin6ASwa5K9eRgh6UrON6hWmKoSC6BrCmPmtl0C0JsYC0ga3omFQ5nx5Ufl58Y570e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723836790; c=relaxed/simple;
	bh=+RuR06MnXuFnejnKjl9NhCarq/UUlc88gwWZ/PMBPsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LlLByD7bObpDW1wDkrbu596QDjnpnAIN5A9rKVOWXSZGsqCecXV+y+wL73RnGCDmnyVkLn83uBLPAv46rpEN+F5JVdNwv+fjJIs0mSmdNMAaf0q2zWqYI8En2uQqfV+lHOIy7PXFLcT/TXTXvl1J4HHA6jPycYzNiLKyKzip6TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T3+LhPsu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wyqss5kR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T3+LhPsu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wyqss5kR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GJTYUi012569
	for <dtrace@lists.linux.dev>; Fri, 16 Aug 2024 19:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=THv53bGeFsxVSSQ
	7ccS56wf7h3iAOFrlL5lqxbxU0Ks=; b=T3+LhPsukpB7nlh6q927TJ6KNIxw0qR
	1QUR5oPCB7G0xqTgBEbhVDb0eScHRBDwXK5NpK1/4XpS2DHMtdQzPs0rvtK9GEpZ
	7M7Uwu0ogyDu71mxYTgceZ36w6PP04Thm5qYHd9nUIECYcu29uhv+sP2Ucj9YzDj
	JfWi7Oa1ePM7l5cTZ1iLPEwKPHqYm462twwG/dCjmA+/WotlX4qhiAjEx/Uf8NGC
	t7FbwJfYDqIrzoQEjg9Uk0A9S/PIRBH8HLVmGjGc9Kyov9U3asM0yUNsPYnj8Umr
	C/doKftmkpCFaHr+5LAwa3FBNQdPXIBO/AB9+mQBdLUolp0Vs7yMHdg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x0rtw81b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Aug 2024 19:33:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47GJLe3f004360
	for <dtrace@lists.linux.dev>; Fri, 16 Aug 2024 19:33:05 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnds4an-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Aug 2024 19:33:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2zZ3Rf6DOKMhdJpsMMH64ggqzGNcx9QFeSeXJt8Z2VgEdtHP8mZXP3h3nMa/lV0S5ubZh1mBXU9P8Irn+qleH/lD2+LgcQPwjlnq3ayAlv3mY3tvmWp3F6mt5b107FUn5WqesuVaoK4GXRtqvgaaubWtwqjsoEK0BTfKDU/ozD5MWc6e7ENFCeXV7smIDPJ6k4kdmNFdAmjQBzJqNizdztSsnjWArvNmW6siBA+2Zb9a45TuIDfo3ziOyEJDIlOh63ioQztolpXeM8ffT6wHll25u+HDxD9MDulo9LPidsZGxs1XLo9ZCgI4YMFeoOtcC8l1kIqXPfi0GIYGssTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THv53bGeFsxVSSQ7ccS56wf7h3iAOFrlL5lqxbxU0Ks=;
 b=XAcmw1rkF59YN7kaxM/jy999abq4A0viRqZoqiAhxQt25PlylhLvkr4dY690LQHxfBlnJdb/p5TkAXHOkaZbrguOn35T5zvij87qCneSBZ/j6r6sMsoDxSZmPu9AcOL3lGYibmjno2ABfeaKx/hnYCC3PhEc+7aNDcXc1SKbaJ5TMiII8im0phD8UYyVk/+jcTQznuWPZOUlremZYinrZ0cWzXQPdcKnoqjJPzJJgjyYen275dsh1lxMsjSF84pzkC/pqUQYN1skSy0QzeXV5UahupEYMm35+qBcfoJA/UGOcRplmorJ2qqD7K+1bntzr0GeaCq7ZaPbyWwvLSeHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THv53bGeFsxVSSQ7ccS56wf7h3iAOFrlL5lqxbxU0Ks=;
 b=wyqss5kRl00d5WJkII1M7gRbMqGzfU4A3OQHACxC7v/XZCHY5d+HnNfF0kf9t3ALqPY4TY7EiDoum4u3uI1E+gnoV+lGmgjGzeKril1kGxr0FKWZQtHSyqsL4qNi/+TLWEDmOtzM29uy6+Q6FUDsZJJ+6i0HpSOw0wxS7IaVvIE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB5728.namprd10.prod.outlook.com (2603:10b6:303:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Fri, 16 Aug
 2024 19:33:03 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Fri, 16 Aug 2024
 19:33:03 +0000
Date: Fri, 16 Aug 2024 15:33:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
Message-ID: <Zr+pbCfu2apcbDAd@oracle.com>
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
 <20240628171634.2801954-2-alan.maguire@oracle.com>
 <Zq1Rhz25fVX5eb8h@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq1Rhz25fVX5eb8h@oracle.com>
X-ClientProxiedBy: MN2PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:208:234::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 033a362b-e5d5-4366-5f28-08dcbe2a3eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IvJygluEy6NaNVDH25GKWYKr54Lo6RMBscZIeQmcKjGk5/uuSL/a5EhVlyhi?=
 =?us-ascii?Q?DxIZdNUktD/xcgeenhUd4RDoTbjgnegVpxdBEVS2nulJbSs/uq7N2f7L21mB?=
 =?us-ascii?Q?3teUM/ISc+qg3wE+oGf1Vmj/oPqJcuboDk6NVT+sysLLZc4fvPgMf+7PwpJH?=
 =?us-ascii?Q?ZBwyi3wDjLisQfm1RrRL3fFxpPWuGysL/+s7D1BWbBXjq1poXhgHY7HHXfQS?=
 =?us-ascii?Q?KdPvlSC0InSQfVMK5p/gX1tlGjFLhmsrx+yaca5Uo/pyqzFF3h7V4ofInzDY?=
 =?us-ascii?Q?LGN6dD9wv+dPeIAlypkbDsAQgSlnCKOMFSbAT8jR/hWwCxxdbX2aPJfLi79z?=
 =?us-ascii?Q?KHZaS7IDYSRzB7QYR2R+FiZo/Oxc79quPzKPbkHX8bjtGcRy3rNZuPvcxrWW?=
 =?us-ascii?Q?Xbgwu5NkKGrSsnMRuWFTwEFVp6ErIColidejjq6vTLz88fFWIc8Qf7Y7dUxz?=
 =?us-ascii?Q?BWiy/H5W6jfqBFaWUhLMr2qte8VvJuG3gvMrcxbgugEJ59o3JdLGk6S9d89E?=
 =?us-ascii?Q?5FuckL7rV6fXWHIu2wtvLgpTNit3AvuZkGWInl58Sq5GyCilqi1M+JYCT3y7?=
 =?us-ascii?Q?MsJ/VyH6ZYS9B7LePjc3Hm591wd3oYrtfnJPnZhm0mESf3o3slNdvz3kFCNf?=
 =?us-ascii?Q?AdwqMTWJhki+8IROuQID3jNU9nE8JlTGaBwSPgcRaK8rvQEBijDajyIMOse5?=
 =?us-ascii?Q?718bPAUgsV/zYyfLZxVjnC2kgKGap7wcsZihYlqoi/exAuWqT6Lkaa0a9grx?=
 =?us-ascii?Q?+JC7TZErYjkacusOgmYfcQBoVD5V2BvF2YdaKEtR2SVbRH9JM/YlM/9vXr0t?=
 =?us-ascii?Q?P191ogRWQ77lW+ni5MBVYDHV5NwkKQ+gc0nsf+s38HeU+SHlB7DiReTb/5i2?=
 =?us-ascii?Q?T0SHcKDOe90pp0WKjL97YZ0mK3pgvuVrxuI7aSTvM6GTBA2Bkeocy3OKWvEx?=
 =?us-ascii?Q?iPhTHESshKvmnBsvgX14HaEWa1VzKWPoXJPDsIB2qdVROxFDD4PaXU4oVrpQ?=
 =?us-ascii?Q?GrdL2vFXbXUlCvEp1lA/OgYlO5yrwcdcY7cHj3tpsDdYNaLnD/tt9GwMiVOK?=
 =?us-ascii?Q?VcKBIX4lk8i6oQdC+Q/YIO17BPHNvXja9R1F6jhHYbytMcyc3A6vUbSKvy4F?=
 =?us-ascii?Q?P9WoCwNL8HIJgHC7CsvJfeKnd6UKmgovK4qA3hotigbwnwyVNTBS5S86EkPY?=
 =?us-ascii?Q?dJ1ZgChhDvOO1uMt30Z20PbjriycgWWrlx85nz/hf/6V/Z6dVqM1Yz2PFM6R?=
 =?us-ascii?Q?coZhBmz4iQeVGEYJX15aMKOlSTZRvzIBERTqWK6yCdyNA/SSDhKTklL4VUUv?=
 =?us-ascii?Q?fvc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FmK27/14thhTXhztWQ5K5d1caYFvEbFHUg5vNFTfIrp3EV2yl6wvyGD/4k7f?=
 =?us-ascii?Q?Bl4uUeYQmOdMc16DCR6KD2U20KOu5E9FyCY9Se4CDegdEz+RLUtS7jhbSjs3?=
 =?us-ascii?Q?8GsjuEUa518LZVcu+WVOxpNmEOvO8yg7ezzA4rYx1dIK8se4LH10yE/U1Oov?=
 =?us-ascii?Q?aYjuXwDxfxjVIr+sdA7QOTynhKi4aRposY7mbqbKjDcvshrWOR9E8Wuu2Z1Y?=
 =?us-ascii?Q?qWk9gNfW7Vcc3ak62gmUZux31jxzNrqMlls2FSwcBqNTTBG0HO5rwbC2Up0v?=
 =?us-ascii?Q?dXEP3+ZtJZoFc3G5M90Z9cBl/V6EINhR234YentiY26aBe3/9KBoeXm08cXp?=
 =?us-ascii?Q?P3Ztxg8txojTIjkbyjE7O64yCGNqoAw/dJLlYMUsg8JKtgpo0qMfigwPYUh4?=
 =?us-ascii?Q?sBv2GHyPqP8Q4fb8V+S/QzBjLgk817/UY7JbsirtZN9QX6lXCz48c1G8wxut?=
 =?us-ascii?Q?2wAVtgZK9+7ytvKCATpICbm332U167nI6OAF7H4KtcPqcBc+QPPt9IpKM9w0?=
 =?us-ascii?Q?bjqq9fqauAjPX6NPj/ITqQi8OuIPZz7JEZ97LauVD+Cd4Z1OijKwJx/4KLqc?=
 =?us-ascii?Q?1R1GqGXYkrEbv0Rmx04yJ49IIjKtUFG450HAODdeUNg6qNRFw0n7ZepiM+fK?=
 =?us-ascii?Q?zkiRcN0ftyAKKB8/LMlkh+iRLYRdQfv3bNwJkayvMKY42fDSHBgoY4pxADLE?=
 =?us-ascii?Q?2nVCbYWAIvsY6ODjv85ZN2KqT+S1ncnsXZGaqSR4/CNEMsTjgruW5rZKBLqH?=
 =?us-ascii?Q?cDFHvVddZnP7XtmXVT+66Kvo3OqgXciYDs/Gcm818s3xHxpsNzeZxbZxguC2?=
 =?us-ascii?Q?YNFi9tuU80xa1Ez7xI8VU8XGaEnMJIn2kXFzxXGMJywzbrlu+Pg1o8ytbDzZ?=
 =?us-ascii?Q?1awUkm/Ev/t+mIPPWcDVlYQUxP1DPWLfDnOfT57U1d91Avx6OUamEubMpiZS?=
 =?us-ascii?Q?p5q/X2QEw1OUl7BTQ5tqq7Igo9yrQPLsZRFC4nNHiX/AokKe2O4zaIktXcNT?=
 =?us-ascii?Q?WciQvgr5mTNOhbluMLNIPMlLZp8bVqEfhGBEDDC/vgGDepOBLCSN5nW+M7jH?=
 =?us-ascii?Q?qC9dfBmE/A/xpX4xOjiHmlVtl5ay+VSlyaZOKBrswAegeMqZL7HB6AhSeYnU?=
 =?us-ascii?Q?l0GcSZ5S5qiaFevr5i2AR+dPcjn1teYjyho+8NvWoTTsPJ31yM2MiMu5FvwH?=
 =?us-ascii?Q?wk2pib7ElSmPqzJre7OVq6c9i7CyyiKBScRqovX6BhgjTYABlLcGecEAJAye?=
 =?us-ascii?Q?nLpFiCJszrKdp+pxBbB6AdG0eshgyNeDfVKlhI7bRAJrV9tFhirAIdUXZWKh?=
 =?us-ascii?Q?dvAxkLmz3Id9Yzdn9hT1oYYKX8bxzmRtczMnBNZBd8u9xJB9vxIhHJ33SoXE?=
 =?us-ascii?Q?KOIbOSi091pY5owlnt93hOTpKj16la7DHp+Lr+fEV3IjhleSTwJ6yhLRcsu6?=
 =?us-ascii?Q?Vn0wyVXvUGd6Rx11xBx5J5gns4yqEiyF39lvvazknjVXW7msxA+CvPuiFuGy?=
 =?us-ascii?Q?6vLYLL8ZSZYeYm3EmI0SbFluVN3Lti4D7C3SueZqhYR6SMpLOps/bVRmmQWh?=
 =?us-ascii?Q?lUfLV9BnvEI6Mx5GzLixdZDYUjrlfYgXvnBgOTePRYH+iiiLUiMxKDsEa1Rz?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w9qH3Wg24sbkomV/ImMRfC94jNpQfYNd7ngMGfP1z/bjnsDVBnuyIurGuBJtGxOFd0HJCpGE0bg5GY0XvagGD/HJSzb6LyXOs9JYccfNmCdp80AMXZN4+WQKykagz080fYxmy3xfQDU7Hut9/ml4aEkj+B4lcyopZt96Uad9r4+GavjhqkuELChDMtDC0zk603gKD2ns3Ho3KbeQUoQb3AUJdWfgZ+4f4pS16QsAAS8i5jscwcgWYU7RZ0cCadJvzrozEYwuVhrWkp5r7MQUaf/tpi2kQhUA2HfAXPdvzjgxhjSaxjMJmc1LnLIEFbUSmwJld40WXHuX2KcrYi0M16K/WDrzkotxq+oClVs/4TWzD9AsjwJYREqtoq46leEhRU5zV/petrKDLe6uATt9TfjLVadHsyTuYvwYBGWVLDKhVQjEtZLW4AjelqQFd/cqpsFGlMmmwUsYL3jMFKgnGoSye7UTYT7mA/lRO+qPYcw9EuoUlxfeJOOlk5gAWO/y48foNts+86WKaudNXGBN0e/UlVk30c717X3lyaCQKErgnvFp/tcajBmJXSXNeMSsaVPjSrCH/BRrQB2shxucHEELbms6cLoCHPchGybvnHs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033a362b-e5d5-4366-5f28-08dcbe2a3eb0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 19:33:03.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhfMvsiwd6mA1qP/YkJPUClNzA9zu1ZEQXI5R6OKJqdYOUVdUl7TiWUo1+R40sYhyBxDnTrsm1p8pbA9n9poronQf6B+xh9RYjguiDfbRYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5728
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_14,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408160137
X-Proofpoint-ORIG-GUID: X0Ncruq-5xSQFB9sbAX2GnRAx0OiyF4L
X-Proofpoint-GUID: X0Ncruq-5xSQFB9sbAX2GnRAx0OiyF4L

Running a full testsuite run (and then also individual test) I found this
test to fail on my OL9 VM with 5.15.0-205.149.5.1.el9uek.x86_64 kernel
while it works on my Debian VM with a 6.5.0 kernel.

On Fri, Aug 02, 2024 at 05:37:11PM -0400, Kris Van Hees wrote:
> On Fri, Jun 28, 2024 at 06:16:34PM +0100, Alan Maguire wrote:
> > ...since tst.oncpu.d test passes now.
> > 
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> > ---
> >  test/unittest/sched/tst.oncpu.d | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
> > index d2c2ce57..7a33bab4 100644
> > --- a/test/unittest/sched/tst.oncpu.d
> > +++ b/test/unittest/sched/tst.oncpu.d
> > @@ -1,11 +1,10 @@
> >  /*
> >   * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> >   * Licensed under the Universal Permissive License v 1.0 as shown at
> >   * http://oss.oracle.com/licenses/upl.
> >   */
> >  
> > -/* @@xfail: dtv2 */
> >  /* @@timeout: 15 */
> >  
> >  #pragma D option switchrate=100hz
> > -- 
> > 2.43.5
> > 
