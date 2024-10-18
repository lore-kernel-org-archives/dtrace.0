Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841A16EB4C
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281513; cv=fail; b=uoRbbqZdIYxKVxeAWrebOwnf8FbtEvPp8BFkboQlKh6itvnAZlXE1uarKQpaxborJYmoSTNi2f30WwM5eHdY2SL4SxdLY075NmX2jrbDzfhGzqhkqJHmF4dm9mVLvqZ5KBvz+2yhi0HIgbKPS7kdIEDM61YjKwzNuWjJ51uCG00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281513; c=relaxed/simple;
	bh=t12wd1a47xtqrVpa64hgypMkGmQxvUjZU6NrtjM7bIc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OTdeVjD50sWsGe4s57Pz5MwG/5SUa9QjqV/PVumT8dwYWN738sa+K4Ndc+1ROj6QkYpowATKIvBBeDh27V117Acu1p74FomDdyh5f1YoCx/gW8jAEYUXgyNlxnIYyyJ4U9iKUxzBfODUtnmScpkLdCy6bHdYl2+HKeRbhLys7+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q9Eztkz4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KLrYnX/t; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q9Eztkz4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KLrYnX/t"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfmOc012644
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=TQWzL+46J3Hfg2NQzwQ1GOxIJrZWwBxx1+JtyTStNgA=; b=
	Q9Eztkz4krMFLjS6YMYkyM7MFKGb8Ul6bp7bUVWgEL1/MrjzNFV+yTQ/rXYwMnd0
	DLc7A6NkZNk1Jv8pKYh2Vs1Jb33zK6bRoVwO8fW2CKY3eL4WBOWd615MuDoDdnuy
	dy5EPgZOxv39FpHMnEortzovPRIJpRRDyetZDTuA3vm3DjPZugeSohfN9fUYcyNS
	3X7hz2qCXT4wXeRHqeg5DW0GyF5DUKqac9ZvfgQrB9UBjB6wJCuz5YXZpoguE9OH
	tFgQhpKl2oywfUFSIhlyJPl0mkMCKJaMKpas6zvWOk/QOxlRfd6tAh8NSXCpYAvI
	qrYD9bZyp9B2mt5Z8haK2w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427hnthmck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IJMeiE026416
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fjc130k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNHcWphUvc25LEsg4Efqgj8JtvvWU8wm+/bykHDScPD8j911OIeEmihm3y6lr+s5nfHyqkSbq+rl9cCNbprih9HjbiCR73x11izALXSEWpC/KtLyjIpBae+u2F/0VKFO6GS7vlGzq7fQv5Aq2yrtGwQN9osC2OUV7fzApj/72QYgrAV0g6rML/GcoxtjQN+UITlKDrTl+xK8OYlNlY1uTr33Fkqdd5uV2Je6quewKAFFannINnclc9mwnkber0ZHfowWPgRDEfzVdimVXes62HAKihsyXiP0dn2xyqB70xT5UZ9fd0nu/NgA6AxYyo71UtCRvaZTpnjO7O9S7/TVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQWzL+46J3Hfg2NQzwQ1GOxIJrZWwBxx1+JtyTStNgA=;
 b=UpOwHVhQnxyQAKf6ytZ2hGNtBKHs2G0Yl6YDPO1D6OjZmVLfWC1qhaeEttJwmt8ulaxCAtYi24W+UBumWUSKHinbskGY+aTHbFd872KFX8wjNB6ON5KX1WYfBszWOJQn/HpAUtPhXID1GJ7ohONvcFxJu51TU6N2MwaAW+p+AjCYPv/D9Yawm2WRWjbTE0qC6V8dC18WgmSu+N3SXn2QCwAlH56r4OPUHqMPpH8KGT+/hze1HNyszmV8wnco4zm4LZ9gmhYlUAD31vleTDMLbp/uRswOFRFfvp0sSP3HBWpshuYkR4gMX/OGgKeAU4a1uppZf+0LXaUBqhWBAwVrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQWzL+46J3Hfg2NQzwQ1GOxIJrZWwBxx1+JtyTStNgA=;
 b=KLrYnX/tF/WjYLk4TvVhmRnfbPxIdnY2GXSWdjWBrFRHMnz8kPRGWMM4rz+nvw6LQXIj7KkmWuvAvQtG9+0abKdjfMwBqXqNDY6jd8/vKEZbyXu4uhe0n8Ga+di+EAJPn9iOGbLdUV2hROsuIprwR6j+o1W3ZE2EvP7DU8Bq2Tg=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:26 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:26 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] usdt: get arg types and xlations into DTrace from the DOF
Date: Fri, 18 Oct 2024 20:58:04 +0100
Message-ID: <20241018195808.270688-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241018195808.270688-1-nick.alcock@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0152.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::13) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f0c9a4-045d-4f30-0d6c-08dcefaf3acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WWYEEFhR0J19dr8ENJ8eJhTF4w4Wynlb/MVgl5Yi0BkqI45bD75YZeF3gixK?=
 =?us-ascii?Q?c4gU/ATfby8N5nxjF0wy7cKV8GWiN7jTrx360TZ3bWKzBhT9dsUTrdlevEiJ?=
 =?us-ascii?Q?XSJd84SRYRuBaZIyo5kZxxTVq8+1pv4YKX1QWdLZqsQu3wV9b398dzHiVS1Y?=
 =?us-ascii?Q?Sl77pRoJA8VB83A77SC0KadTjZIMI7LF+xuCMX4fm3kyua8gpP9lEhNZlrw1?=
 =?us-ascii?Q?qAxE2Ve1YjBIe3Mn0CpL4vI5CkyS7kXM0Iyifuut1GVK2AkrAiZgr8EC7ly2?=
 =?us-ascii?Q?dusG+Au1+sDKlWX8T8v3UT8+qG3GpSXBSCh4Sb2Rb0DwX7pTdUQorsT/KGjS?=
 =?us-ascii?Q?zi1Th/9rnBOZ4YULLahsjOAi4KZwxqvK4VUc7WN4TM9yg9RN7dXejuHAApPg?=
 =?us-ascii?Q?eaPuKt61jYGH7pmhwh0i0/umZ6NE+btyTVbsYiwOh55WBQ+5UmoK4UOm7/Pl?=
 =?us-ascii?Q?KrEapH/PSyFzclolcCyWCPtk2FxmKKzwGBcCdNQWDlAdrzoKx0ddGBLFbw+h?=
 =?us-ascii?Q?Equ1PYfM0w/uILVPngmeCNnS4xZetROZqp2/Hk2djgcuFf3qn4PBQFOSc0SL?=
 =?us-ascii?Q?w9uDpmftAGJFgSC644iYHyaNTn/DYEo7VCjDtq2E37tIA3laAWO6M28hFdjh?=
 =?us-ascii?Q?0P0UuEM0hDSe569ZY6vB+RFagUJO4ymzaIYZMs8dTKgXhdPESaAphzA7GSWB?=
 =?us-ascii?Q?Zl7he9U+iKliz2IT6pCq9uwhEAXFzKUL5CuS72bkamSVo+X066U8Yz2B/qeb?=
 =?us-ascii?Q?eq11jnBvi+iVH4PxK0tENTgGx8kfvsRoviK9auOl0hHUm7/pCxQi/bD9PiYL?=
 =?us-ascii?Q?CxqVt9oVI1q3WNromnOodt4JXTxtZPhz+pIpyPfxeR+j0zPZijUx5vo30sgv?=
 =?us-ascii?Q?HTHD2DQG1zgelJAY0C3mQoDjKRd0vi3f57zCiHMsm/M6+XaI48MT2KzJa5ED?=
 =?us-ascii?Q?j9KsXEM4RtPE3sFLpewiI2MLgBP7ym0tP9HgRGpHTFMwytlFDg160frMlSRT?=
 =?us-ascii?Q?8Td3e/BRpG9ugkhbON/f3Z7O1JcTJ7yj9RloXDhZCk2jNwiGt52wLSkOo5O+?=
 =?us-ascii?Q?LXrvQxEQvVfCMAfFTIa8/7HMZSVsFYi2XyIEQ6L3ZYFF+ziiP+XaL1MjJgel?=
 =?us-ascii?Q?QUkA8yRb+LF+9Xf9QwvloY8Dd4DWHJm9MuEA4ErcfA0kJcWknRSai6Gbnxn5?=
 =?us-ascii?Q?cWcfN8KY9PJkVVSkr9D8tslACq/9vyHsnr4DhnBaZwd6tU0/ps++SSVTWGsC?=
 =?us-ascii?Q?5i6QIpv3OESNIsus24GexFgO6E3K7Ke78aj37szgrrsUGWvibfR5z6gyHGPO?=
 =?us-ascii?Q?O4yjTEQgS7DBAnCvjhArxlEe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fofnYiGSAKJwyTeFyZf+bUctWjyl+Tz/L+PzMa7I9KG5/lce3+H78MBs8reo?=
 =?us-ascii?Q?6uGrvDqCdjpBxIzYM3cnbVTXU3LvpiNnAuJx2oMA6t666HYldoMdz4MTq/SR?=
 =?us-ascii?Q?44Fv/brbzbuhUkApBUTlYvH81fOwJbENnGnlMpXfhvN7mtncZrlAtmgkeLIM?=
 =?us-ascii?Q?mimz+D9GM9jxNf5IRxzY1Ff+L+csxyG0+ssm0IudMLNpLQU/60G3yr1lPglm?=
 =?us-ascii?Q?F1oD+yWUwpVCurZmX3NKMYLrox5iisxoNHtlVVA3rG93pz99vQyLQl4qQMhf?=
 =?us-ascii?Q?1+SE/xrSNsRYGcMexNhZDX7jjaxK07k1vpM1QOn/et4vhVKjg/cm58YiXILm?=
 =?us-ascii?Q?2YZxzLi76FzolvQLTPgnKb3zjKBnMs7ZDDVzJy7+XXRAhrDZAlMwKiorMr/b?=
 =?us-ascii?Q?jLoMLoeeUoKfMt/WEJnRtYlO6Vh+OK/1IcOyH3dZXXo6U8B2VoOMOJwEnHpn?=
 =?us-ascii?Q?oawNIxvQEE4SD8VsPObDi8jGlCbnBoBcxbfyBrnvZOizfTXr+SlhEpe0rkvR?=
 =?us-ascii?Q?Hos34tr62vaRP7PCbHhltm8tn/XAwxL5A7xbMZm4onI5Gf6GsnUHMV4mkB49?=
 =?us-ascii?Q?BIX3BqD+5mJJL8X73NQ36dhliUm/vcCsdu9bIhW+/hDH0J/vqCs7x9aOwRIh?=
 =?us-ascii?Q?toDs6WuURloa0GvJNG5PNQN4mO5flZjEFpmHXtkOgZi6nbCMSBfdknp2LRew?=
 =?us-ascii?Q?E4+pukpKHdmmX9gFR5JeeS2NoN+8vhHtM9piRjZGvz4aAcwbvGI7fFrM8MHF?=
 =?us-ascii?Q?Zy4mXscq9cOQO53JIGdVMbXDSRpHrZP2hu1c+bdLfPoEGk5IzvY+qeHWYCQG?=
 =?us-ascii?Q?fzWVozexDHnLfuVmqTsYVVzS5SIdo9U8UqEuz0zZdimMBf9fV6Iq3pmk3jat?=
 =?us-ascii?Q?F9IbKlkiazQNEn+BI4YU7d7eep3KBk7Yb4aYdjVNbx9xP+byxDO+5b8rxT1i?=
 =?us-ascii?Q?svI8MN96KqIPllXuwmpQm7rcF7/vhtssEQX045p+sJ8Nucm0Fkb7zGHDKYqh?=
 =?us-ascii?Q?Il79IsbLK+K6sHyeDceV9IWdMdHOEf3H/+WE8ZTUSK5q5ghF6elDYpNOyHLD?=
 =?us-ascii?Q?x68DSgPKG+uvZRGyx+47xDtE+MC2GyZqYIMoTcgO+Mc3+a5evQ0qvaYKL/7G?=
 =?us-ascii?Q?zThteAKJhCKSqONCcLW0JuLD/leQEXytkD65ovDnkttfnZKSIbb0rZ4Gy88H?=
 =?us-ascii?Q?3ns4G4KmIkua0Mfnl61GOHyfbOM9pKJJKYuE7aLT+JdL6Cn0KXBcflmmjQUP?=
 =?us-ascii?Q?T7dLl90N+XybwEgwU5GPsyHC2Segs6iL9vei+dCfhXueFm9ogo5soHoGIHkZ?=
 =?us-ascii?Q?6UH/SlNQiri4ziepka0VrlrtKAp8cz4M5KPHWMMeGCIBYqQhiZGpuDyOwTOu?=
 =?us-ascii?Q?GA/2+bHWvyZjbiUiUA9CElQvtbOa0rLm/XktJ2r1DJOCMHZoxCgOvNHOWaPq?=
 =?us-ascii?Q?i5Iu1JDtJGh5+ZxTiXpR28Ta2TqAX0wJFOjbs1PRaHeUJ250rcmf6f5UvOfa?=
 =?us-ascii?Q?fFGE0VMkwCGZ1Aux68B7ERKFE7F+qnSN8O/8UvUZnvYxpZic28HllPfTqgsU?=
 =?us-ascii?Q?cM9j17OFxhCTUnpujg6Of0D29xhD7wBFYm0P4hpmUqqQEwkm7Qku7y9M+Qxh?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mx3UUiCbPnn+dZMTeMSDFFMZcsXpNgQ2dnXPBEX1adA4GC+sSTup+s4Et0NwuSFCwPNMYW07K4JjJveyp4DT04Lw2I/Pjp1Pf9mee5AKRfr8LpDWOBHNX+6akP1x8GBBZxjQvy3K5/CeJ/gvkxOPCF3IwkU8iUPl0XmyGlLDsjFt4KobPGRCOXvuqxzxz5dzUNHcCyfhz1Na6fvUpM9HswFnr7N9GsrrDr4gwf09cIFgP3pkJiYFB+g9/P+yMVT9LcB0QqozbIFrY1+NnPz521uyuZ62as6/Aa/L9MDlVRVO6jc8VjMzu9Z4F9PSOKofFtJePp41SUx9VoLZiyIr2GKYpor/hJcI+JNj5ZQhi2lsyR9T9JdzRng92hA8bdLCkI7DhgwRF9fBZwy6+VscCA9Jg72sJJoo5IsgXjTZAYKU4oFoaM20E4lrqKESIkAg0ldN7wsiqRSEaAQEZeKEihPqAXj5eUW+kOn10p4aIAN5KdoYKdQk+62alDAdPdzDBQ+WjfdpERNnXlGhW5luBpq+D5LQp/8/9+sdKPHxeQPxnPZRqeggy9sA9gT9vhvvjUnY8czBVscHeQMqt+TZ8QeBq45nbMzD7kDkIdufFAk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f0c9a4-045d-4f30-0d6c-08dcefaf3acc
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:26.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjZ8amRqdMkRBKxgs/WrSap7vpNOyGH1ScQwUw+khc+DI07nzQprmM6WdhRegiafpbgXYAkSL4jZcUv9SqiC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180127
X-Proofpoint-ORIG-GUID: 1zmW3MoD_vYq1arL7Fe8jJzQVhJiJ85r
X-Proofpoint-GUID: 1zmW3MoD_vYq1arL7Fe8jJzQVhJiJ85r

This change propagates native and xlated arg types and remapping info all
the way from the DOF, through the parser and dtprobed and the DOF stash,
into DTrace, where they end up in the pid_probespec_t for USDT probes.
We don't do anything with them once they get there in this commit: no
user-visible impacts expected.

We bump the DOF_PARSED_VERSION since we add three new types of record to the
dof_parser_t, all optional, covering native and xlated args and arg
remapping tables; to make life easier for consumers we emit them in a
defined order (documennted in dof_parser.h), and add a flags word to the
DIT_PROBE record that precedes them indicating which will be present.  This
means we retain the property that you can always tell which records within a
provider are coming next purely from records you already have: there's no
need to make decisions once the records turn up.  The DOF stash hardly
changes: all that happens is that the parsed data written to each per-probe
file gains some extra types of record (it can have DIT_NATIVE_ARGS,
DIT_XLAT_ARGS and DIT_REMAP_ARGS entries following the DIT_PROBE record
now).

As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
refuse to read probes added by dtprobeds that are on the other side of it.
(Restarting dtprobed will reparse all the probes in the stash to match the
new layout, and newly-started DTraces will pick that up -- so this only
affects running DTraces picking up new probes, which DTrace cannot do yet:
so no visible effects are expected.)

The code is a bit repetitive, with nargs, xargs and remapping all handled
separately even though the code is very similar.  In future maybe we could
unify them (but my attempts led to code that was much harder to read than
the original).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c   |  14 +++-
 dtprobed/dtprobed.c    |  12 ++-
 include/dtrace/pid.h   |   9 +++
 libcommon/dof_parser.c | 167 ++++++++++++++++++++++++++++++++---------
 libcommon/dof_parser.h |  80 ++++++++++++++++++--
 libdtrace/dt_pid.c     |  71 ++++++++++++++++++
 6 files changed, 302 insertions(+), 51 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 0e639076f655..d9731844066c 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -59,8 +59,9 @@
  *    startup if the dof_parsed_t structure changed.  The file consists of a
  *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
  *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
- *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
- *    the DIT_PROBE record specifies.
+ *    DIT_PROBE, then optionally some DIT_*ARGS records if the probe's flags
+ *    word calls for them, then as many struct dof_parsed_t's of type
+ *    DIT_TRACEPOINT as the DIT_PROBE record specifies.
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
@@ -640,9 +641,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			break;
 		}
 
-		/* Tracepoint: add to already-open file.  */
+		/* Args info or tracepoint: add to already-open file.  */
+		case DIT_NATIVE_ARGS:
+		case DIT_XLAT_ARGS:
+		case DIT_REMAP_ARGS:
 		case DIT_TRACEPOINT:
-			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
+			assert(state == DIT_PROBE || state == DIT_NATIVE_ARGS ||
+			       state == DIT_XLAT_ARGS || state == DIT_REMAP_ARGS ||
+			       state == DIT_TRACEPOINT);
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index fdcdee14f851..ecf27216ff80 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -795,16 +795,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, probe) < 0)
 			goto oom;
 
-		for (j = 0; j < probe->probe.ntp; j++) {
+		j = 0;
+		do {
 			dof_parsed_t *tp = dof_read(pid, in);
 
-			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type != DIT_TRACEPOINT)
+                        errmsg = "no tracepoints in a probe, or parse state corrupt";
+			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
 				goto err;
 
 			if (dof_stash_push_parsed(&accum, tp) < 0)
 				goto oom;
-		}
+
+                        if (tp->type == DIT_TRACEPOINT)
+				j++;
+		} while (j < probe->probe.ntp);
 	}
 
 	if (!reparsing)
diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 0129674adf0c..d9a5a40484a5 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,15 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated args */
+	int pps_remapargc;			/* number of remapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_remapargs;			/* remapped arg indexes */
+	size_t pps_remapargslen;		/* (high estimate of) length of array */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..4a45ac41a64d 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -879,13 +879,31 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	return 0;
 }
 
+static size_t
+strings_len(const char *strtab, size_t count)
+{
+	size_t len = 0;
+
+	for (; count > 0; count--) {
+		size_t this_len = strlen(strtab) + 1;
+
+                len += this_len;
+		strtab += this_len;
+	}
+	return len;
+}
+
 static void
 emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 {
 	int		i;
-	dof_parsed_t	*probe_msg;
-	size_t		probe_msg_size;
+	dof_parsed_t	*msg;
+	size_t		msg_size;
+	size_t		nargs_size;
+	size_t		xargs_size;
+	size_t		remap_size = 0;
 	char		*ptr;
+	int		remap_args = 0;
 
 	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
 	    dhpb->dthpb_mod, dhpb->dthpb_func, dhpb->dthpb_name);
@@ -893,37 +911,124 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	if (validate_probe(out, dhpb) != 0)
 		return;
 
-	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
-	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
-	    strlen(dhpb->dthpb_name) + 1;
-
-	probe_msg = malloc(probe_msg_size);
-	if (!probe_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
-		return;
+	/*
+	 * Figure out if the arguments are shuffled around (in which case we
+	 * need to emit the argument remapping table).
+	 */
+	for (i = 0; i < dhpb->dthpb_xargc; i++) {
+		if (dhpb->dthpb_args[i] != i) {
+			remap_args = 1;
+			break;
+		}
 	}
 
-	memset(probe_msg, 0, probe_msg_size);
+	/*
+	 * Compute the size of all the optional elements first, to fill out the
+	 * flags.
+	 */
 
-	probe_msg->size = probe_msg_size;
-	probe_msg->type = DIT_PROBE;
-	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
-	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
+	msg_size = offsetof(dof_parsed_t, probe.name) +
+		   strlen(dhpb->dthpb_mod) + 1 +
+		   strlen(dhpb->dthpb_func) + 1 +
+		   strlen(dhpb->dthpb_name) + 1;
+
+        nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
+	xargs_size = strings_len(dhpb->dthpb_xtypes, dhpb->dthpb_xargc);
+	if (remap_args)
+		remap_size = dhpb->dthpb_xargc * sizeof(uint8_t);
+
+	msg = malloc(msg_size);
+	if (!msg)
+		goto oom;
+
+	memset(msg, 0, msg_size);
+
+	msg->size = msg_size;
+	msg->type = DIT_PROBE;
+	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
+
+	if (nargs_size)
+		msg->probe.flags |= DIT_HAS_NATIVE_ARGS;
+	if (xargs_size)
+		msg->probe.flags |= DIT_HAS_XLAT_ARGS;
+	if (remap_size)
+		msg->probe.flags |= DIT_HAS_REMAP_ARGS;
+
+	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
 	ptr++;
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, probe_msg, probe_msg_size);
+        dof_parser_write_one(out, msg, msg_size);
 
-	free(probe_msg);
-
-	/* XXX TODO translated args
-	   pp->ftp_nargs = dhpb->dthpb_xargc;
-	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
-	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
-	*/
+	free(msg);
 
 	/*
+	 * Emit info on all native and translated args in turn.
+	 *
+	 * FIXME: this code is a bit repetitious.
+	 *
+	 * First native args (if any).
+	 */
+
+	if (nargs_size > 0) {
+		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_NATIVE_ARGS;
+		msg->nargs.nargc = dhpb->dthpb_nargc;
+		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+	}
+
+	/* Then translated args. */
+
+        if (xargs_size > 0) {
+		msg_size = offsetof(dof_parsed_t, xargs.args) + xargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_XLAT_ARGS;
+		msg->xargs.nargc = dhpb->dthpb_xargc;
+		memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+	}
+
+	/* Then the remapping table. */
+
+	if (remap_size > 0) {
+		msg_size = offsetof(dof_parsed_t, argremap.remapargs) + remap_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_REMAP_ARGS;
+		msg->argremap.nremapargs = dhpb->dthpb_xargc;
+		memcpy(msg->argremap.remapargs, dhpb->dthpb_args, remap_size);
+		dof_parser_write_one(out, msg, msg_size);
+		free(msg);
+	}
+
+        /*
 	 * Emit info on each tracepoint in turn.
 	 */
 	for (i = 0; i < dhpb->dthpb_noffs; i++)
@@ -938,18 +1043,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
 		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
 
-	/*
-	 * XXX later:
-	 * If the arguments are shuffled around we set the argument remapping
-	 * table. Later, when the probe fires, we only remap the arguments
-	 * if the table is non-NULL.
-	 *
-	for (i = 0; i < dhpb->dthpb_xargc; i++) {
-		if (dhpb->dthpb_args[i] != i) {
-			pp->ftp_argmap = dhpb->dthpb_args;
-			break;
-		}
-	} */
+        return;
+ oom:
+	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		  msg_size);
 }
 
 static void
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index d3a6836f15fd..bfcac2c52de4 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -15,10 +15,19 @@
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  We receive a provider info structure, followed
- * by N probe info structures each of which is followed by possibly many
- * tracepoint info structures, all tagged.  Things not yet used for probe
- * creation (like args, translated types, etc) are not returned.
+ * Result of DOF probe parsing.  The order of elements in the parsed stream
+ * is:
+ *
+ * DIT_PROVIDER (at least 1, which contains...)
+ *   DIT_PROBE (at least 1, each of which has...)
+ *     DIT_NATIVE_ARGS (1, optional)
+ *     DIT_XLAT_ARGS (1, optional)
+ *     DIT_REMAP_ARGS (1, optional)
+ *     DIT_TRACEPOINT (any number >= 1)
+ *
+ * The dof_parsed.provider.flags word indicates the presence of the
+ * various optional args records in the following stream (you can rely on
+ * them if it simplifies things, but you don't have to).
  *
  * On error, a DIT_ERR structure is returned with an error message.
  */
@@ -27,9 +36,19 @@ typedef enum dof_parsed_info {
 	DIT_PROVIDER = 0,
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
-	DIT_ERR = 3
+	DIT_ERR = 3,
+	DIT_NATIVE_ARGS = 4,
+	DIT_XLAT_ARGS = 5,
+	DIT_REMAP_ARGS = 6,
 } dof_parsed_info_t;
 
+/*
+ * Record-presence flags for dof_parsed.provider.flags.
+ */
+#define DIT_HAS_NATIVE_ARGS	0x1
+#define DIT_HAS_XLAT_ARGS	0x2
+#define DIT_HAS_REMAP_ARGS	0x4
+
 /*
  * Bump this whenever dof_parsed changes.
  *
@@ -37,7 +56,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 1
+#define DOF_PARSED_VERSION 2
 
 typedef struct dof_parsed {
 	/*
@@ -59,17 +78,62 @@ typedef struct dof_parsed {
 			 */
 			char name[1];
 		} provider;
-		struct dpi_probe_info {
+
+                struct dpi_probe_info {
 			/*
 			 * Number of tracepoints that follow.
 			 */
 			size_t ntp;
 
+			/*
+			 * Flags indicating the presence of DIT_*_ARGS.
+			 */
+			int flags;
+
 			/*
 			 * Probe module, function, and name (\0-separated).
 			 */
 			char name[1];
-		} probe;
+                } probe;
+
+		/* V2+ only.  */
+		struct dpi_probe_native_args {
+			/*
+			 * Number of native args.
+			 */
+			uint8_t nargc;
+			/*
+			 * Array of native args.
+			 */
+			char args[1];
+		} nargs;
+
+		/* V2+ only.  */
+		struct dpi_probe_xlat_args {
+			/*
+			 * Number of translated args.
+			 */
+			uint8_t nargc;
+			/*
+			 * Array of translated args.
+			 */
+			char args[1];
+		} xargs;
+
+		/*
+		 * V2+ only.  If provided, the given args have been shuffled.
+		 */
+		struct dpi_probe_remap_args {
+			/*
+			 * Number of remapped arguments.
+			 */
+			uint8_t nremapargs;
+
+			/*
+			 * Mapping from native arg index to xlated arg index.
+			 */
+			uint8_t remapargs[1];
+		} argremap;
 
 		struct dpi_tracepoint_info {
 			/*
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 62060b5921b6..356b671c8385 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -866,6 +866,10 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
+		int nargc = 0, xargc = 0, remapargc = 0;
+		ssize_t nargvlen = 0, xargvlen = 0, remapargslen = 0;
+		char *nargv = NULL, *xargv = NULL;
+		int8_t *remapargs = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -917,6 +921,55 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		p += probe->size;
 		seen_size += probe->size;
 
+		/*
+		 * Assume the order given in dof_parser.h, for simplicity.
+		 */
+                if (probe->probe.flags & DIT_HAS_NATIVE_ARGS) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+                        if (!validate_dof_record(path, args, DIT_NATIVE_ARGS,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			nargc = args->nargs.nargc;
+			nargv = args->nargs.args;
+			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			assert(nargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.flags & DIT_HAS_XLAT_ARGS) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+                        if (!validate_dof_record(path, args, DIT_XLAT_ARGS,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			xargc = args->xargs.nargc;
+			xargv = args->xargs.args;
+			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			assert(xargvlen >= 0);
+
+                        p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.flags & DIT_HAS_REMAP_ARGS) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+                        if (!validate_dof_record(path, args, DIT_REMAP_ARGS,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			remapargc = args->argremap.nremapargs;
+			remapargs = args->argremap.remapargs;
+			remapargslen = args->size - offsetof(dof_parsed_t, argremap.remapargs);
+			assert(remapargslen >= 0);
+
+                        p += args->size;
+			seen_size += args->size;
+		}
+
 		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
@@ -967,6 +1020,24 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
 
+			if (nargv) {
+				psp.pps_nargc = nargc;
+				psp.pps_nargvlen = nargvlen;
+				psp.pps_nargv = nargv;
+			}
+
+                        if (xargv) {
+				psp.pps_xargc = xargc;
+				psp.pps_xargvlen = xargvlen;
+				psp.pps_xargv = xargv;
+			}
+
+                        if (remapargs) {
+				psp.pps_remapargc = remapargc;
+				psp.pps_remapargslen = remapargslen;
+				psp.pps_remapargs = remapargs;
+			}
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-- 
2.46.0.278.g36e3a12567

