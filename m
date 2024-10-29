Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56651F80D6
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730226481; cv=fail; b=n4rr/EujYxQO05UhQ9ZFbd/DPTVQ2A2TY6zSa7Dj7X+EV6IpFxoiXxAZMth8OVGBUyGSG1+w+I+aQ2kQ2DNWgvX5L9pcd8EatydHWssaTVuDV7TkgJk8u5W0wLCmpnPD3foGEbyt+uyswKY+jUjNX6/ZkKWwWi1blff5AhJRAyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730226481; c=relaxed/simple;
	bh=hC+Ufz4spdqgQgGrH5L85MSvMrIR8AuUhDQ7ynXtTqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sx6G0aF8WlCQOW/u9XS8et9fRsc0ZG+eD/tCqDx6HwheHFas3+PUTgPtBE0R0xpEoAyFQ7qM6PR7kpbyJqYy6g2HyvR7oZ437GrNiqMs32DpgEx70l82V4buR7TuXfn3/XaKVwGJdudf5mmuHWwOvnFNqESwqI1pjjWy7Gmh8LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XMh9lIml; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LQDyc+9a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XMh9lIml";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LQDyc+9a"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfYc7028562;
	Tue, 29 Oct 2024 18:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=jMgSR38YEOoVcxMMKy
	HStAkLzHYsZoE+RsoMt4RJcTo=; b=XMh9lImlKt4BT9Syl8Yww+IE4RY2lgDxoE
	i0ttjEZsTt7Hc7G+qBbcyOkjwC+Nfb+Wh6aLmXbtG5MSp4mWNt0uKWYKEBnCUde9
	WmcgQpYK4pOmF34AHLEnIcoDHWtINIsdD5yVI6bE9t8s0uO4IoSIXl3fVITvTCJV
	qALnCKKL7Qj1Wkl0fE3zztUaKNrzwp3omT9O27IbhG2QO9ZkUCmFuyy62+SyGH0U
	aBGvLDGRxJsmirIVkQFUd2NxXJuzs0dBzOvHtMWeEZ2Z7McT6PGimyZ+4SfBnKkK
	dpNKFEDDPktWvkqM9xWBZBaP9fzYRucUmbakVg35jqpV23fmtMqQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqe73f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 18:27:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TIO3Pc004745;
	Tue, 29 Oct 2024 18:27:48 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2up23y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 18:27:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8o5aKu91RQtYqVkdrMbmvzKnCzdHmr1ONYw7Xko3LVxYtc2etC8KkOB26HpdwOILUMJY49tZEsBorZx4S3zWf6FJeJODGbib1a3V/Qqx8ViUgEiAmlrQkh+mkEjCSjI16UG1m1th66Lr1GCwIFQ5/UhueWikvqyBXKIaSvbSVfM9REjZ7GYjRWZnqIUFstCm/bZhQ9YFXf39b2XrZH1lqoYTtH82QR2gjG4aCVGKEG+fIjP46va1kBMs/0mPijgV0UwV0DfgFFk1D0QFw+UtjP7rCjb2vRj1fI64cUYtASd4DO+nj6e9+jLlQg0zruRBueQ9jQBlpaA14VY7kynxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMgSR38YEOoVcxMMKyHStAkLzHYsZoE+RsoMt4RJcTo=;
 b=iViVPaoO7ztD5vDx8uzLKP5ZC+BdVfwXfnkT2Y+HU1npKEZaGAJ1uZ4a6CEadmgTVRnUbFxQIkMvElHys2o4hXeWgRFcNwGnHtZCIpDreMrmC5TiLLZoeARtyd44syKEF4mSw2lftrTxPumJmy5HH7KVQmyVlBdZq6QNRfSmIg6/d4t+skcyhcR2Io3oreard6Lfas+5UPFQPD3lzks9SdMKycBIS6leqZ9zShmUVycgGu+R/VjIgXvlkFxICeZMPgydzbMooXK/+lbvyo0XXZcuQTtdEzvCJ14Np6S0KIwjnVcHdYKsCkemElSqpLyLolT3zIdJdTDAaenQnKZfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMgSR38YEOoVcxMMKyHStAkLzHYsZoE+RsoMt4RJcTo=;
 b=LQDyc+9a00zdou+iHjlQrl1gX9z5cOa6qTxd2ZKOLUAidDlmeogQJERQnegv9ow+9Ycv7iTlyRLbiCNI1/Bb+SgIVJ6Xl3eSTM8fB3b2h3i8gshBELgq1A6mCYiyisKVXfO2wp2DesCzjhMW0CnWp5aICVTYlSF83TMuvEHJiW4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MN6PR10MB7441.namprd10.prod.outlook.com (2603:10b6:208:474::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Tue, 29 Oct
 2024 18:27:44 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 18:27:44 +0000
Date: Tue, 29 Oct 2024 14:27:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH v2 01/14] No longer depend on libsystemd
Message-ID: <ZyEpHYo6ZeuBaa4W@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
 <20241028211803.458685-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028211803.458685-2-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR01CA0050.prod.exchangelabs.com (2603:10b6:208:23f::19)
 To CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MN6PR10MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 278d9d04-e17e-4167-30da-08dcf84761ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eeZL7v6PGqHoPfGdOl4JwihQt1dRqHabWnzgApjQ1wSeNUekY5K5gvWhhpMB?=
 =?us-ascii?Q?R53/iBlMTBEOcmVy0nm6SLBpzel4YZWhNalZxImAZO5mO+mG6ugO5VhxCWG8?=
 =?us-ascii?Q?k6vnebAQN5qgDCxZ5Ysc7ZoMusOOO5YL/wEve/+ToK79mBEj0a440fFUJn0L?=
 =?us-ascii?Q?v9ht+P9GoZ0fEmCoeOBG2gwEuuuN1YPSuFMUTH4gOQm5P9l/WAKhnapC31uD?=
 =?us-ascii?Q?Hz0QMOT9TW+buHQvBil4tL1FgPXgoSTSXZOiELX6TzI1g0ejC8GKCnvFK92r?=
 =?us-ascii?Q?c0U0Xp6XOlfiSQxkzG+0ZIznQc3S9qhYO2CZsc1Q/YDrExUnEI0IeZqCwN7f?=
 =?us-ascii?Q?ZUZBEyniBrhSy278eONUg8OYaZGzKaD00la+aUPs6u82xvheG0EXPAt5ylS2?=
 =?us-ascii?Q?seAE3qTl9jCKCpN9XGFxO8zyRlCeBrHqUNhI2IYq0N3SxmnC6aVlyTBcB/UM?=
 =?us-ascii?Q?ixR/1f7aZCUKyPo9eTXE6cTuc0CHeywWL2AJ/8cb1f6csjCcg/HlMLFw2ddi?=
 =?us-ascii?Q?iPJPn6/Up2dJjtmys+ZH7Y0xOo1mXGQA2+1DBf8EEK4A3fhfrDYmkxBroOiE?=
 =?us-ascii?Q?B4vN1a7Z9AcThREkiwfQWmVIqw+uHrQeR9per9NCVBcAepCL8i3nCvncMcro?=
 =?us-ascii?Q?FpdzVhviPK9tsWtXGFHFNHkInHb5XPEJ2+o6aHr8PJkgFjRSWaliZ322FFvR?=
 =?us-ascii?Q?hWL5zGOIemkeMd2ixwbxGe8KpClQm2If7dq8lgelRrut8FTLcJjMCEuCPGC9?=
 =?us-ascii?Q?9Jb0hL+9xNqhFx7uf96T8AWLkoHGXYz7exRg+MnCH/psWhx9arMMAjmQKF0U?=
 =?us-ascii?Q?c4kncBUEaWjfZCLbxS9z3guk1AaUyNn9c9U4qqJU0wjebUaqiZKFXi8Kwfvv?=
 =?us-ascii?Q?ncyKXi14fHzflyF+0BqSUF0AZ9WZJVClaJWkjAPktE2XWSx6mer5Z1HKBHap?=
 =?us-ascii?Q?sbwKRbWN74//H/wNhrxn4Eyx2sFV20qSFscZfKuAbGojAOa5+WMK21/FG9oN?=
 =?us-ascii?Q?fIFIaXq8qKNzcD/PhKrVB3ORd8iMqPDqe9MipnOfFtU+EbWr9Hp39IZO1Q5B?=
 =?us-ascii?Q?je9jcoqlDFq7+Dyc7VTJ7873f0sHr9TRer9PWyxQnibWW2dGCX3QwFDwjFHH?=
 =?us-ascii?Q?zQeKTZH0njaKSNwp3XWzkCS38CuEi2xNY2CWxCLYczfcQDkZNyNAIClRUjMu?=
 =?us-ascii?Q?81c18IZtIqIhPwWCOLXjQVywUyWq9dLVkFTvEHi4Xq0c0s/VcmI/whSZ8cHI?=
 =?us-ascii?Q?S+pFHUrjop2Emv3vaT1kkEP+PtCn361/m4Dzxg9JIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QBg1HvAT9QqQQ9SzJvxeItC1OZhiLQ72J8dUpV19mUZ30eH/wyC/RAAHIIE8?=
 =?us-ascii?Q?5vGyoKDOIu1rpI4emeDO/zsMNbxRmhqq0/g9Ahjh2dsaVgswOXs5BfUIAjVz?=
 =?us-ascii?Q?FA7DuG5pkjkr9azWiwX3irqbpKhUWJBspICH0bwzwK8Xj751ItDynmmUBZw3?=
 =?us-ascii?Q?+uih8C+m5zxjMeGY1f8AgOW/JvjuGSJdPTcwAfiAJCjL/9ESicuOQPsuVofx?=
 =?us-ascii?Q?epNYDJkZrTc5K+2ZEQ/hJFfl5zwl4jj1KQBHh8WjiOIrzaWXGNncxxfxZbC3?=
 =?us-ascii?Q?rI4yu/QVeXjKjN7wUNpvTRiS9BMlvz2+K+FRsAZoOxwMUMYJlKyHTDTXSbDN?=
 =?us-ascii?Q?cTidadDZZKOYI4Qs0K+2gKSj3NuGi7pQOdIzLQ6NXFAvq6qyceBNgXDdFmnn?=
 =?us-ascii?Q?aeYaS9AhQMD0JIT8IiOPBJG0HdtNy6cLPcT1z5M9XMxbXQjNNJxaGvJg620b?=
 =?us-ascii?Q?VFlRIW4ZgkeTafvZbUGU3hr+7nxew5OlzLWUUYoIvhuYPNO7MDZMerr7Dc8A?=
 =?us-ascii?Q?JVUxF+S73s/SxiXoJM0MXl2rhSTvuNJxC+Ode41ErMVDm7cqdFSV3M5nl+DX?=
 =?us-ascii?Q?UxiI/zhFzr4RpMgWHbieMIIxT63rB1PSb8+ESWy/KFUZEgm/++OUu/eACz1P?=
 =?us-ascii?Q?fqZGzXsz2V4gJJTG4xExfNtRkiXlbDjqlAhYuE3SO7hyFH2ORSF5qYns629k?=
 =?us-ascii?Q?v8B4H9IIbUiYnDdkELjGs7MhAarrGgGYfyQrTZ/VE3+5z0kBpME8sjrVaFIO?=
 =?us-ascii?Q?u2YJGMLN3xjP0u0uRlfbebTfhrk7iKJH6A4uRwqOaHnwoFAGO2wHOxrMHHec?=
 =?us-ascii?Q?cxrPmZ0qrGxKNCJ0V9aH/UgmEDC6T4Oic8yjjQrXgoQZtzaBJNojYdXe2iAg?=
 =?us-ascii?Q?pNr5rfPl1sw13JW8V5q8X2syJITx4HM3oIsvjB5DzosDR0atXN8gEVQgBwjL?=
 =?us-ascii?Q?1NRDlA4jXlUBnDyqNL3LJCLeZHvMl0/ZpJ+ueIhEYgXmObnr8P4z43FPNX30?=
 =?us-ascii?Q?awCcmniUKyZA86WAv0TKKvpv3VJ0BktUu+OoQYAIsq3WJkD5PRxmP1y/Nu6o?=
 =?us-ascii?Q?XS7W8dlyUQpKGuLEQfqRfvRJ2rQCcFZJEepEfGE68ktk1j/NoUB3jjs4Sius?=
 =?us-ascii?Q?cOCoH2wEC+GYx7LtlBHp/KqJ5078TMUmIUxziQtUyaFnfq8zxREm+126Z+Cf?=
 =?us-ascii?Q?IMWZN2tqvDosJ/NFPyPHJ4YSwLqPMFffnD9HKyQI69lXU6LMa//d1TA2ZFQ4?=
 =?us-ascii?Q?uKCTHNE6jKBsL+X/1oJ6P4hh7EcfconeZFDEU2aHi6O65CtYypTWRlgeoo3r?=
 =?us-ascii?Q?YS25a3c+yrkrPYkpEO6wJbHB/zmjebBWlntfw+ZnMSJAcqxxFZdCRT2uTQe3?=
 =?us-ascii?Q?n5ZJDwG8rijAPlDvhmn5OFKQDG01IXn5xGTAsZ94DBQl9Kva4ppjwZaYRa06?=
 =?us-ascii?Q?oxUPJdPVg4PVOy9pdsHS9xp4oGMPztLLz40FhD+uaOGyduEux+v8tyzu0R5A?=
 =?us-ascii?Q?EeXkS46jOZcZy7uf9ZrUVXWiHedJKu6DfTHZ1UnHo0gQV8uUo489gI2MK5QC?=
 =?us-ascii?Q?OlU3JnpanWjea1LW21Z5XlWiaar4KcvIzaZRgjdU8tWotRw3ltxsYhZ7FBgc?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uMQVhJqcYiOnkI72GfyKNF1wNOtB6ECtieUVD8XroJyiFjEwbOky/406dXkfenueP4WJRpzCHDLA+yZJqt111OBW36L1T6RHTZaHMiYiELOmAPWAe2AxkbbF6cp9lKw9recw0WaBvYAsUrseB83oBRbJwW1lPOA+B4Q9gEtz9kyN+kL5nDTCKOyJxwqvbQdYOQ1FJOdOLqjWInheENv0/TZaearTdBJitd67HGw08Gc+Q15E6j0V+cjBOtiqqqs/1gfDQFYUb/Dd6aX5ZsBsB4tclRkwBZvg6gmtkGQMDTCGfNteWxh/rL3KaFwZ9E+Zv1SyRHqFYSxVRsGErnRupKYLLgwSJf5ucSb4Un2ev6ePSZ7BPNk6PexfHq0b+c7IErkgHj5s0fpgnMqwQvZQelfX4lCMYrnudeAXuvzupP/vsqrs3TcID9UFNkLf3Ni9Lv+QXgt/MyOA+nINZadrOw2xBQcjrjTOy6YA0T6HYewK+vSsX/blF4BvzmeDv7bDWSFMSCWy69pgLubPvG38hFmlYCZ8a+xm1iPSH+843/yqtTCji4I05Zq1AtE0eL+/6E/ydaZOkq6HV1xhgmsfRlapX9iZXo+8yQGra8xQbPI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278d9d04-e17e-4167-30da-08dcf84761ae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 18:27:44.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+sNldvaoJXWIjC6F3oPZ39CDD68VtuS2zIPG1U2oGXygY9z1DJd+8NCsJ8BIlyCXrLwtR5LwXwAGIitVftHRwaX0R+vbAlTfh7Z1HSkdO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_13,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290138
X-Proofpoint-GUID: Hp1pyTGnYsbj-2OE-1VwIuhdZsM87tVA
X-Proofpoint-ORIG-GUID: Hp1pyTGnYsbj-2OE-1VwIuhdZsM87tVA

You are your own enemy :)  Since you chose to use all spaces for indentation
in your configure script, you now introduced inconsistency by adding lines
with tabs!  See below...

On Mon, Oct 28, 2024 at 09:17:50PM +0000, Nick Alcock wrote:
> We only need this for the systemd notification protocol, and that's so
> simple there is MIT-0-licensed reusable code in the sd_notify manpage
> showing you how to use it.  That code looks pretty much OK, so I modified it
> lightly and pulled it into libport, with one tweak to remove the use of
> __attribute__((cleanup)) (it could be replaced by one line of perfectly
> trivial standard C code, saving five or six lines in all).
> 
> With libsystemd linkage gone, we need another way for the user to indicate
> that systemd is not in use and the systemd unit files are not wanted: so
> introduce a new --without-systemd (and corresponding --with-systemd=no,
> etc) in configure.  (Someone directly running make can just pass
> WITH_SYSTEMD= to make.)
> 
> We lose one feature of libsystemd's sd_notify: we no longer remove the
> NOTIFY_SOCKET env var from the environment, so our children could in theory
> pretend to be us and notify systemd on our behalf.  Since our only child
> is in a seccomped jail and is part of dtprobed anyway, this loss of
> functionality is purely theoretical.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/92
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  GNUmakefile              |  1 +
>  Makeconfig               |  1 -
>  configure                |  8 +++--
>  dtprobed/Build           |  7 +---
>  dtprobed/dtprobed.c      |  8 +----
>  include/port.h           |  1 +
>  libport/Build            |  4 +--
>  libport/systemd_notify.c | 70 ++++++++++++++++++++++++++++++++++++++++
>  8 files changed, 82 insertions(+), 18 deletions(-)
>  create mode 100644 libport/systemd_notify.c
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index e7657d466df5..cbf27b6be111 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
> +WITH_SYSTEMD = y
>  TARGETS =
>  
>  DTRACE ?= $(objdir)/dtrace
> diff --git a/Makeconfig b/Makeconfig
> index f3d47c086f4a..346078598624 100644
> --- a/Makeconfig
> +++ b/Makeconfig
> @@ -218,7 +218,6 @@ $(eval $(call check-symbol-rule,ELF_GETSHDRSTRNDX,elf_getshdrstrndx,elf))
>  $(eval $(call check-symbol-rule,LIBCTF,ctf_open,ctf,t))
>  $(eval $(call check-symbol-rule,STRRSTR,strrstr,c))
>  $(eval $(call check-symbol-rule,PTHREAD_ATFORK,pthread_atfork,c))
> -$(eval $(call check-symbol-rule,LIBSYSTEMD,sd_notify,systemd,t))
>  ifndef WANTS_LIBFUSE2
>  $(eval $(call check-symbol-rule,FUSE_LOG,fuse_set_log_func,fuse3))
>  $(eval $(call check-symbol-rule,LIBFUSE3,fuse_session_receive_buf,fuse3,t))
> diff --git a/configure b/configure
> index 4026a3eafcd3..72eb734a8380 100755
> --- a/configure
> +++ b/configure
> @@ -93,9 +93,13 @@ built locally, none of these should be needed):
>  
>  EOF
>  	make help-overrides-header help-overrides-option
> +	cat >&2 <<'EOF'

Leading tab whereas all other lines use spaces.

> +--with-systemd=[yes/no]		Install the systemd unit files (default: yes)
> +EOF
>          echo >&2
>          make help-overrides
>  	cat >&2 <<'EOF'
> +
>  Options controlling the compiler (pass on the command line):
>  
>  CC				C compiler (may be a cross-compiler)
> @@ -153,12 +157,12 @@ for option in "$@"; do
>          --kernel-obj-dir=*) write_make_var KERNELOBJDIR "$option";;
>          --kernel-src-suffix=*) write_make_var KERNELSRCNAME "$option";;
>          --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
> +        --with-systemd|--with-systemd=y*) write_make_var WITH_SYSTEMD "y";;
> +        --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
>          HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
>          --with-libctf=*) write_config_var LIBCTF "$option";;
>          HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
>          HAVE_STRRSTR=*) write_config_var STRRSTR "$option";;
> -        --with-libsystemd=*) write_config_var LIBSYSTEMD "$option";;
> -        HAVE_LIBSYSTEMD=*) write_config_var LIBSYSTEMD "$option";;
>          HAVE_FUSE_LOG=*) write_config_var FUSE_LOG "$option";;
>          --with-libfuse3=*) write_config_var LIBFUSE3 "$option";;
>          HAVE_LIBFUSE3=*) write_config_var LIBFUSE3 "$option";;
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 9132c3e31c8a..346cd6aee190 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -29,11 +29,6 @@ dtprobed_DEPS := libproc.a libcommon.a libport.a
>  dtprobed_SOURCES := dtprobed.c dof_stash.c seccomp-assistance.c
>  dtprobed_LIBSOURCES := libproc libcommon
>  
> -ifdef HAVE_LIBSYSTEMD
> -dtprobed_CFLAGS += $(shell pkg-config --cflags libsystemd)
> -dtprobed_LIBS += $(shell pkg-config --libs libsystemd)
> -endif
> -
>  ifndef HAVE_FUSE_LOG
>  dtprobed_SOURCES += rpl_fuse_log.c
>  endif
> @@ -43,7 +38,7 @@ seccomp-assistance.c_CFLAGS := -fno-lto
>  endif
>  
>  install-dtprobed-autostart::
> -ifdef HAVE_LIBSYSTEMD
> +ifneq ($(WITH_SYSTEMD),)
>  	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
>  	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
>  	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index fdcdee14f851..c83f0adb56c4 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -61,10 +61,6 @@
>  
>  #include <dtrace/ioctl.h>
>  
> -#ifdef HAVE_LIBSYSTEMD
> -#include <systemd/sd-daemon.h>
> -#endif
> -
>  #include <dt_list.h>
>  #include "dof_parser.h"
>  #include "dof_stash.h"
> @@ -1073,9 +1069,7 @@ main(int argc, char *argv[])
>  		sync_fd = -1;
>  	}
>  
> -#ifdef HAVE_LIBSYSTEMD
> -	sd_notify(1, "READY=1");
> -#endif
> +	systemd_notify("READY=1");
>  
>  	ret = loop();
>  
> diff --git a/include/port.h b/include/port.h
> index 427129000b4f..6ce8611e9025 100644
> --- a/include/port.h
> +++ b/include/port.h
> @@ -29,6 +29,7 @@ int p_online(int cpun);
>  #define MUTEX_HELD(x)	((x)->__data.__count == 0)
>  
>  int daemonize(int close_fds);
> +int systemd_notify(const char *message);
>  
>  _dt_noreturn_ void daemon_perr(int fd, const char *err, int err_no);
>  _dt_printflike_(2, 3) void daemon_log(int fd, const char *fmt, ...);
> diff --git a/libport/Build b/libport/Build
> index 48ed99e2b017..822049f5e547 100644
> --- a/libport/Build
> +++ b/libport/Build
> @@ -1,5 +1,5 @@
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -8,7 +8,7 @@ LIBS += libport
>  
>  libport_TARGET = libport
>  libport_DIR := $(current-dir)
> -libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c
> +libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c systemd_notify.c
>  ifndef HAVE_CLOSE_RANGE
>  libport_SOURCES += close_range.c
>  endif
> diff --git a/libport/systemd_notify.c b/libport/systemd_notify.c
> new file mode 100644
> index 000000000000..f78bca6e14c5
> --- /dev/null
> +++ b/libport/systemd_notify.c
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: MIT-0 */
> +/* Lightly modified from the sd_notify manpage.  */
> +
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <stddef.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +int
> +systemd_notify(const char *message)
> +{
> +	union sockaddr_union {
> +		struct sockaddr sa;
> +		struct sockaddr_un sun;
> +	} socket_addr = {
> +		.sun.sun_family = AF_UNIX,
> +	};
> +
> +	size_t path_length, message_length;
> +	int fd = -1;
> +	const char *socket_path;
> +
> +	/* Verify the argument first */
> +	if (!message)
> +		return -EINVAL;
> +
> +	message_length = strlen(message);
> +	if (message_length == 0)
> +		return -EINVAL;
> +
> +	/* If the variable is not set, the protocol is a noop */
> +	socket_path = getenv("NOTIFY_SOCKET");
> +	if (!socket_path)
> +		return 0; /* Not set? Nothing to do */
> +
> +	/* Only AF_UNIX is supported, with path or abstract sockets */
> +	if (socket_path[0] != '/' && socket_path[0] != '@')
> +		return -EAFNOSUPPORT;
> +
> +	path_length = strlen(socket_path);
> +	/* Ensure there is room for NUL byte */
> +	if (path_length >= sizeof(socket_addr.sun.sun_path))
> +		return -E2BIG;
> +
> +	memcpy(socket_addr.sun.sun_path, socket_path, path_length);
> +
> +	/* Support for abstract socket */
> +	if (socket_addr.sun.sun_path[0] == '@')
> +		socket_addr.sun.sun_path[0] = 0;
> +
> +	fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
> +	if (fd < 0)
> +		return -errno;
> +
> +	if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0) {
> +		close(fd);
> +		return -errno;
> +	}
> +
> +	ssize_t written = write(fd, message, message_length);
> +	if (written != (ssize_t) message_length) {
> +		close(fd);
> +		return written < 0 ? -errno : -EPROTO;
> +	}
> +
> +	return 1; /* Notified! */
> +}
> -- 
> 2.46.0.278.g36e3a12567
> 
