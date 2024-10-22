Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC512B93
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622798; cv=fail; b=LnGPeq59d75irufu1qCxSDzNaVW3ME9GmrXXGnxaSM3z0EJIN7tW9x6w742V4nbJh+TwyDC1uGgw4/AzJd+GD7FtIkY7YowNFEygSi0cHfVpekfAlIl9ypqevGCN9gFpyvMv3uABZnWGkHfmFyhZPclQE0POU9eYDlVUTguyUco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622798; c=relaxed/simple;
	bh=+z7e6//sxCipM+Go/QJuEbt5edf7HYUScI2J5FbFWDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=anqOdfs43/nCM0zZIQGtdFVxgxnSg92byZDtYtAWVxcEQGaO/8pwN2UWa7jzPuyx3ZjL2TS/I8ter+0le56z6ULojMZHlLJ/J0Ygi/VWXNhNVbBFMcFbuV/XrtSPhuYkacKPwL/yVAR9+rymJeLVWVqU/Z0J+LINb31ADnUYjRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dlm5AElb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W0gVYfTB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dlm5AElb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W0gVYfTB"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MIBbsT026994
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=uA+K7/k/ttfXG6NPnr
	aughSjT1jvRQPLlY0zw0vjeos=; b=Dlm5AElb1tmp6lkHqR0l2SG1F6jDmaLX3H
	w5vUfJs4J49S6GtJbFojNozxJdM/FrwjtKJ2SOo8/UAtLJAob233wW5IxrXVaqLC
	6bvddgfBj8COlV3XKhwKQ1cCLAduTDvyWun94h7rdZb4/cbl7ltrtOvb9fOCJPjm
	Er2thQZBxZXIPptdR3ESIgwl58PIu8Ns5lkgTIG07IgAPCZupVZu5QYEes46GcHj
	xUSTRnnntx80oAXKMlcbr5w1Ec7eBITIAIgbiOJArKJXBUy+VqIhRWIQo51OwfZb
	yqKSM4jm0uMceR0Nt4k46uCyg6/MvIf0vckpy0osOvMqxa0SDI8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5456fu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:46:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MIVETO020292
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:46:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42c37eauds-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 18:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4JAs3SP0QKitYavZVpo0epyejh3HSYQdoz5PrKnBGJhTQc8SYUmU2+HiF3yUki8g+BVoripHzaEUiyQNKzsU34tn210SWg8B6QfTom7VLHf3tLfiLa+I9yR8cqMyNQnRJVKpd8RNHkDq1Y6e5cIo9Nr8jp5FagREtHJYCHLdxyRh8ptAMfG6s7KRmgXrVfDYY1gaODIt/4KLKJZnDl3P84SSWBfidO3IrLxwzQTAIPhj8meXFlmzAtNShAuiEjr0z26AqCuuuzb18VtsZWetdpN6oEn38BDN9AsNuegOc4FFZSP3UmqJdysmn09toxdaZWWj/o+CfWNjcEwALiPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA+K7/k/ttfXG6NPnraughSjT1jvRQPLlY0zw0vjeos=;
 b=q8gH1/CdOV3lSG93c9qIKHVXLaRLN1XUddhB1W8YTh4ZU668kSlAxmhAoMiByjaegc4imxt/LwLo4J86Me3nXt275zePMoAgnzzNgIXKLSRj1GNhQn+EW4X5Ow4GQeSCO2cGFKqd3GHgQ058CIjnYPYrwzwikYUR3bA3f0caVLBvnCdd0IthtepZ3viEIb+vVSn3EsUoLTyFYYXuXng+DfwoZ7ewr8xogeqD6nf37+OYDL3CvRvhL38AZmBlDet2lYaJKo5jCqpQ9iMfbQW90Ee94jQfbKd41Y0Co7Aw40CYT+nyyBljCA4v22tR6Rj2FHhwYRvzUEFRBJwBKthgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA+K7/k/ttfXG6NPnraughSjT1jvRQPLlY0zw0vjeos=;
 b=W0gVYfTBtRc4Kn/RspVfMTuro9CdnYb2KX8mI8/swBYzHlUNI2y7fGA9QdSLGme4VZq+JOv4/Z2U0PzeofFfZm7MgGtZj88NyzpkGsQmTWoOMyZu7mFV0H5itxemo1UZAgwZfgYNGgD9LZv+cFGevtmpSbs77oFomLHoJgJUpJ0=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7348.namprd10.prod.outlook.com (2603:10b6:8:eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 18:46:26 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 18:46:26 +0000
Date: Tue, 22 Oct 2024 14:46:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 6/6] usdt: fix create_underlying error path
Message-ID: <Zxfy/zPfBTF0c0PB@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
 <20241018195808.270688-7-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018195808.270688-7-nick.alcock@oracle.com>
X-ClientProxiedBy: LV3P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::21) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: e2028555-79fb-48a0-326e-08dcf2c9d560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?znYZn+6O6qzd90MZPbsJoNmZCESbbmLWLqAgWr35bL0Sn0Ibtf7vhEMzus5x?=
 =?us-ascii?Q?MqAhuXw+Q++sQogfX0ffT85y/xCl4NYxYLisQLFau5mBw4Psyy8kJgCaS7iw?=
 =?us-ascii?Q?JUy7lUKX/48Xdj9DNSLDEW5eECOhHW/R1UqOeIHfMo/Wk6NRx6zfb+hGDKTt?=
 =?us-ascii?Q?JeQSXrk7r7uzqBXXYWkEeKktbueZEodxPAhlL3wLiO5ztV1+Vh/DkZLMQnC4?=
 =?us-ascii?Q?K/iSJQZvB4KDOuWXRxypV6XO0KtW4cozmXD5cs5YbV1u3u0ZkTwBqLDtU7s0?=
 =?us-ascii?Q?tz1T8IS9Y80Uoa3ASG9Dm8uCBbcbUjzeVWN6T4JwQmTz2yR43qyRmejEgNWQ?=
 =?us-ascii?Q?yfqsxrOMMeMB551dJbXoS1CJ3H/9fB3KMQNwwAd8gubccc07E4aQHzrzvhXz?=
 =?us-ascii?Q?+BSF+sFzl0puhySs2+0JPlUdlSoFZzth5a5G/8LHjnnRoWjb8McApWRjxWZ7?=
 =?us-ascii?Q?i+NhUwH7T1pPk9RsWHGEnoBPh3N8xefYx8YOle2H+n2pT9LxDzJaQ+ZIN3Va?=
 =?us-ascii?Q?/oGqCw6uW9WUqMmrLEzarNLHj1SXe+hBJvG+Tl0XPW1TjIDEofuLruFKkOoP?=
 =?us-ascii?Q?z5oKuKaZITqMEnGzkFD/Oa4s51lVaGPkVlxg4k50Ff90873rhxvTN/tvUUbJ?=
 =?us-ascii?Q?TiSX4V+ymzgiFbzIioQtKFSwaRj835+RGK7EivdEHOFyPuP8bGxlNyECCqpd?=
 =?us-ascii?Q?JiFudBqCCEZbGBr1fR7nrKKMdV+7OkclL/xP2hBqIorGwvvahaY1p1EemFg8?=
 =?us-ascii?Q?VdmwzxhDKzFv1bSnwjywXCFajWXM6T1XRt/9ATWXv6qqoiLkX3W3j0y27ph2?=
 =?us-ascii?Q?6+wIT3WM0F+Thd5WJLPNgoc5oxoUbuf81BxcAv1LApQCwbH1LHjnhZMnquNX?=
 =?us-ascii?Q?cRA/XnDutYCIwRvZPlidj78RCbZbeo/iVbFg9nM7a5g6IMg5HfGKVg70h/KK?=
 =?us-ascii?Q?I5wtL5cabp1M3r119qI14GWl2o5g7qriqglLddSvDR5dn/SoCWkZgrnEiWNQ?=
 =?us-ascii?Q?cWcCLnfnZjH6txcJGnL1VmmZLsNKZwG1YljVFqk0YfO77Vi6Q8whQPmUoiw+?=
 =?us-ascii?Q?pJFeIhR65r7cPOF5Ym4Xa8lHafkIkr7OtbxNVw2RQBoD+3B+kUmrsfG+QzYn?=
 =?us-ascii?Q?JA2iypE+1nSCW1n9/vfInLJJ15mTGwWUsVjfVcsmm8U+EY1W3/+JhxE+d4Xl?=
 =?us-ascii?Q?MDHfsaCFDnpQiaFR1Q2nHu8ErT+hfP58BiIvefHCbcks8Qn8Cf4JwREZU++F?=
 =?us-ascii?Q?P5N3sNijDIa1JhmYoB2cYK21Qv2tLGD19J2MgXm97u2OJadXqVJ9ODSHc1pW?=
 =?us-ascii?Q?dnY7OxfVkFc4CkAN/r7sF5pJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bfroxSh2wpbFILRN7nuynshmv8CqR0PE6yjhMU9GXtrBL8QStJ5Qjy9sATiP?=
 =?us-ascii?Q?iTkzp2N6o7txYe1yQLVeMldYpYXL+96Y0iFuiL9ZcsYt9TKEoNJS58qnNEut?=
 =?us-ascii?Q?hCmzlfhVojCmqT/kjLJ8zQuAJBxwO3AcR+iSxkKaiUbkkHTWIJzggkhtJzd0?=
 =?us-ascii?Q?2geIys/vwnSloOYToWddrKSMyDjAomcht6tlVGDhUYpmeaZeyfYY0SbFoKuO?=
 =?us-ascii?Q?3TOdHDruhXcLi31ydN1kI/y/yOhu/SVMRl2WQwfYipvuX8lUnbD4h+HjBFDy?=
 =?us-ascii?Q?ZAysEc5X/LA+OtTbEgkopJAHPB5sBbIvIzJ8W3754HTSC7AUpivB0zeFYk8r?=
 =?us-ascii?Q?zcuZZf23qrY1IxB2r52DS5RJR+N0CgmTYZp5nNS6R2ruGEUkh+aI8Vz4Hqpc?=
 =?us-ascii?Q?PyNmuMntD6DPPrl0TKR09lU8pB6UirFFThO840g6iGhbj9sFbNjcl+Breo1b?=
 =?us-ascii?Q?suGwgFsJwIQ0r/WMcqM0eP0TM3IcAlTcNcBcsrSC8SmfRuKcObQOFTlNQP2l?=
 =?us-ascii?Q?GQihVLezmhMBvyNit/NRbiz5DHfCkFGk0skWThtYvJZorEf/M+ZqmO3lRhEz?=
 =?us-ascii?Q?G3Rgc58XA7PRnj5hw8HKgvhCEAeyVEkkW0s3cvkdviwa7oKoQ3T5/yfFbcxR?=
 =?us-ascii?Q?jdQr1liVkWoWboRVuciNIfZCrM0b0OaOIUDGM/TrDkmQuHCwm8UCYgUHfrkO?=
 =?us-ascii?Q?CgEzTJwhWdOIkTPhSFZAw88pzbzxtNHdDZxtGCy5xxi8w8drsLfO/D8r+D9W?=
 =?us-ascii?Q?cLAdeoyRaVNVei82kyiZjwhFHlN3K2kLYXpBPG/jqQhZRj7xPl36aA9z9Oun?=
 =?us-ascii?Q?Qz4mPV6qst73lpLEubXApIpIkdsEGelHd2L06E/ZOf2i7xMzhvKLZ+hNMcU/?=
 =?us-ascii?Q?qgLCqFkyfgDcq5QS8cGcqi0omoU4y2ZQBk0JUzOCNqro/x/aK6uR8YiwgGgU?=
 =?us-ascii?Q?d4Iu6gVNSl8MpKdS/gcolonITwMwlTxjA1n/0hPT/jDgBazTF4SilbxLDscs?=
 =?us-ascii?Q?zeIr1O/sQa3kZ6knYpgF1RS5xrzRxKW2vLgAftabH4uARv8+5U3qqaueBaqc?=
 =?us-ascii?Q?DQakAht/YIMUXzqVxNgHCYRfupLm+u2pL2YesjjW8rKOJBY5F4/gVnnhXjDP?=
 =?us-ascii?Q?MtWwDi+ysFivFYZKzlJlzXCOs59T3zbnQJ+Yhnl6sdLJjG69p6uVOeyjfX0V?=
 =?us-ascii?Q?0vhOdDMCpveHGgzJGsAQ3VD6a6FohmxfUqTWIkdz/cyeY8hdZWMxvfN17R8v?=
 =?us-ascii?Q?m3kTpCehlh/1oOR/seJcbAamkivlqQD78b/wtvFT6QaTc7w7CehMc7nehULV?=
 =?us-ascii?Q?MH4Q1qH2Gla0On2bZUxZzFS4OVDkZUbC3ztKmjn8Elf5wBhUTVO4Lq8qqL0l?=
 =?us-ascii?Q?p3TSDNVGUnzK22ob1CQ3lN8v3i9WfPH6/02ujW9HLldsEy/cgVKCSjb/mnRb?=
 =?us-ascii?Q?EjnXONs3ucVVNPpbXkdkr+ORbdNUbaMauz2KaN2p1VjiXW42GURZqlpWfi+4?=
 =?us-ascii?Q?8gYcCxtUU7lMp6yxBNaD/FIN2ph942RpUCVMAEnTWXsyN4Jn9lwLukZw2RbG?=
 =?us-ascii?Q?R+ILymZSW6lCZ4xs64x62cwbxYQ+9y3vdN3t5TYc7oZI2eRmH1Mfndw2K/Lo?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+BBCGrqTfLP59wZk8hkBjUQzSjzJWAyTqxYULlFobI6DB/sb9QBxknoc5+lbuKgDJUOk6R45XxToye2u3zWsaNiS4Kk7NGUGBc6C55vy4WItQwhEGXlfkfFkIRRbtCtrjrhBL2e8ZwfCNytRjhUy7gQsBBlCriVaFJzGCzhJDgL1WomSB8mls81V8qAwvOO9pIVWuFrZXUI4Aei2xJSAjQ01+cOHjkSZFau/+AzQEzoGryj+l2jc1tcLqCJhnjxaUydhhQ8/5gb0eLq+SF8MpHv9pd/Xzg/JgN4LKwgSwjp4h4AEdqC/vKUfZSTzVeIyDWwOn10Uv9Um3104BO3LBJIxLZoMMu7Ob9jUylnn8/ESLeRDSdwg7WN1CtvZrRSa2fyIiHL1YF8jPdPVVz7Fsq9eiI6B1QW5RloPnrjY78ru0UYOyV/f7aal9ojf+1F88VkS93M6b36TTdBeFxiFXCmg8su4EuHjyKeiqKL6r3J+9wB9JhMcDikzHWCYV+RL1ZFXIKgZcs6MH6g8NGIvbs/8nGBhaTJlivBKw6pRdppv5sPE5K1EcXjx6zu/h2vlAzOpsPVJxjqEAumRLqjqnru81zrsgOVnzLVnFNJERgI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2028555-79fb-48a0-326e-08dcf2c9d560
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 18:46:26.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgnvkcDWTptZ+XdoqpGEsCT9Xw83/rrnl8CuPJIC9xWVDg9vLa+k/Uh5oqdRIV0qMZ9b4XuaQvV6/gt+jKPGs3Cp+QDHC7h4dXWSjamtB98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7348
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_19,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220121
X-Proofpoint-ORIG-GUID: lkkKt7uRTd67iyLc82SPt_b8kVP0VZYa
X-Proofpoint-GUID: lkkKt7uRTd67iyLc82SPt_b8kVP0VZYa

On Fri, Oct 18, 2024 at 08:58:08PM +0100, Nick Alcock wrote:
> On error, we were destroying the underlying probe using the wrong call,
> as if it were an overlying probe.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 767d9a80b5e1..83d6f65a5207 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -274,7 +274,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	return uprp;
>  
>  fail:
> -	probe_destroy(dtp, upp);
> +	probe_destroy_underlying(dtp, upp);
>  	return NULL;
>  }
>  
> -- 
> 2.46.0.278.g36e3a12567
> 
