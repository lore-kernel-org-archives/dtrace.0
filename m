Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E601E7C12
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290381; cv=fail; b=b36rwV69puNmOwZI/3OaUVej1yrvANKqSFjbTVhIubRfru+KUZHyeLjJauS6dU4fzyw2c1kW4gmJklMdvt/BJ/t/7OZIUS7iPxi/bSfcFVqs+enxbpAOmFN7UWxpU/yFRA9B2xsaW0NGZvZSmyxxn3xTq99sVo82O2sDJcDL7T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290381; c=relaxed/simple;
	bh=jP71zx3Y0gLz/YJhWfrhrSsKG/o6/uh0Rr+d1GKq7jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=boIKOECUhehttRoTF/J/NMdHtAc3kkZz3wYYBASKCPZn1KY1dXPqlkvS6Yd9UWgoJ9qWJfD+TxoQambXdu1grJjB6dn4L68L5RO+4oexdnWpEKJEE/gnL8/Yv4YuaVbXQRXt9Nqy1q/mCDgAvKN85a1imFSP0aMr12+9639DR/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EEA45r9N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DrTPnjDp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EEA45r9N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DrTPnjDp"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fdgd012559
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=lTqyTVh/3ubXM3K0iMb1goYS/fRpzg9Q53MUarWNZXo=; b=
	EEA45r9NploenrJhXi2EEcR859boM7WZap/cX6lokDxVPWtxq3x+BtCiZ9hhuj06
	lQYKZYdalSC3/na65wYRBIocwyFcOiEBCQvdQeW5UsVubWgCudYUyPzHf9c1fjLK
	X7svfqhysNgr1eM6oznYgJpGKxLwDOE00K7tvi/fsWp74Px8ZVJo2NDHmzxv7RE+
	DV8EFN6/o0i2YDMuUoR+26OF1ItxsYkauRWTC2hLPsTL93O6zT7J4QKXAYleFpL0
	dlcDp2wix8ewbvNIMvFVlWs9ocIpGIlKEldrbxUpfybGNIqBNWIOb1BNrUv3j+Tr
	X3jJOxmQuCwdGUBjznLROQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys7vcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBDdpW008624
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0mqf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpEHH9kC/n5Ta7sTUSdbhxXdeVXZVtgGRMOVXMbBIPqCDFT6ydUhFrOPmHZiaYwNSIy+MvwZ5caOrG76ReBOo69EkFBHB5ryUU+DqHiF2I06wlA2XIuciHe2wqpGWn5LzCN+OwQnTYi4l7ftdahGcaWsHZYAIlfNye2GxA9YPvWVouJ2TBO8UfeCoRfquYPPQnWGC+fB5vbTUBYLeMLfcIOrARTFYWTOONnOS7RRJlSd0oia/1eDyfWi8wJXCzHI7nefQinqmc7+gCgAjDuB++c434wVEFL38QQuNLk1OQD+5MlzJ5oMMCYx+mCZiXBwQeWpU2kv747jA+913VKzAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTqyTVh/3ubXM3K0iMb1goYS/fRpzg9Q53MUarWNZXo=;
 b=V9366/AFKgpwDr0YAFPOI2J6TXfp67Vd1lukvolHEpQlvYsXjxAV6tIuSuu9QxOpqyhbGI/RAGPMLLYFo/gSuxRLv6yipmrBGHD+EukIPYwYBZ3JowTSPWzV1ueDOcXQgpgRdqaRGzdWWdoU53YBPua3Q36v76xa2RE39kGynrA6wgh7x244hzbCBlknlaJ5k6tLH8hBsg0l3nlgUv2jC8GcJ09AEw9IQkaLZr7MLT3jNTPnzgAWqzeuQRlOIH8qiV3JoYyKzse/4WKMlzTq18O4vJtT7AzMHjIZT5A6sjzSgJYNdSyT1EHSg8+i/urzIMUX3dImNE4gJE2+rDHSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTqyTVh/3ubXM3K0iMb1goYS/fRpzg9Q53MUarWNZXo=;
 b=DrTPnjDp/j0NvKfhKa3aTX+Ro6Te3z1Jxut8kkW0U4wytBf4C2oo3WLFg+t4QYFsyICmi7M1g8Sy3VmgTYagupZTFJABhmek0q9vn7pvgGSYH0+kZIUn8X5l0o8zY66h0AGqultAPt+mzK2JLDLpNPBfBJxJPva402QS53Ztp7o=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:12:53 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:53 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 06/14] configure: fix dreadful behaviour of MANDIR / --mandir
Date: Wed, 30 Oct 2024 12:12:28 +0000
Message-ID: <20241030121236.257803-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 34fe8af7-2f0a-44a1-78a7-08dcf8dc2e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otGVniYvRo+ksNTVTbbcmnz+zJW+cLua6Ucbic2oKkaog2A1niaecNl2zSDJ?=
 =?us-ascii?Q?Rm31RFORQSSKBwl4704N83hNGiD8w6Z/6TOOZzMaeddt41iUI7BBKaNw1Gh6?=
 =?us-ascii?Q?ogxVtdEDEyMbXRDcU+VWBH7DtNAaNZsxO7t0E4NdjqyL/83QCvKmtYMu24v1?=
 =?us-ascii?Q?mSw4Cn0iyrioUVEKkBxTKj9eKDjTOUGHnAKWCn1ZgemxoFwVPsbZAvrWXPxJ?=
 =?us-ascii?Q?R3B0juEdtYubltiJheNNlmcLT2fwIjikGVw4n6st5syyXUk5cANE8FCLG3jh?=
 =?us-ascii?Q?Nt3u+qOz+yly5vw6xf2CJhxGLiH/a7W4n7kFp2TFq70oTPRer7Uwe2OaYhIp?=
 =?us-ascii?Q?yXWWuYNS7d5rMiJUwn8zaudP8q4RiBWpdbPng/BCbymGkZLNREkYHu4uGZZ5?=
 =?us-ascii?Q?Xs72Hx6xgo5gzGvJpsw6X44mbi0M+qyHL8MbbwulapR4cPQqSBeRVMCZiLre?=
 =?us-ascii?Q?+ecAALaT3Au1/BMf5zV1Sg1Je90UdfwTBD5YzL3vB+4our15WbL+30HWQf20?=
 =?us-ascii?Q?JSmxgKeCA/HguyFrDokNfL3pi86Ni2eZHXRWguXlybipV4REAiSECSUahXJn?=
 =?us-ascii?Q?QE1l3xVbC/KBNxX89Gus540oUGF1kvqWYTlxkA9HqaqH59081TqMfTkMrXsU?=
 =?us-ascii?Q?89garchfn8ek8kf6WtW7ox6qzMEgArQDL1q55wC8mREIsQ5QmdfyizBhwPDS?=
 =?us-ascii?Q?0tJAzCiTONXKqAjxuiM9Gi/7Q/9YMezsVPsXaIPbqlGEFT/RlE2/2ls5nLci?=
 =?us-ascii?Q?vlg1WnTw++GLGM4lq5JJzBerfSJDf3q9PQxDf3K/BxCXH8pbkwOud9F/BWW9?=
 =?us-ascii?Q?kIbDmkckWX6WAdf6eO6ghHDIc6twzJLJjhdEuLqpDWgsWk5fM5hMLqBQlwQI?=
 =?us-ascii?Q?ugjYpIGZx3LUb0Xt7/v0OX6PelQoS/sGUtmjjEVs6L8s+oFYJm7rcJoHbHKV?=
 =?us-ascii?Q?kagss/DJSMfGlY0+KdzNboprQv25HyacT7ilu2NQtvrfyIGTEYPAzNnOYw11?=
 =?us-ascii?Q?yszGC4cwM+GzvhBWnnfADNaaCZJh5UCbUNs+c5H46xWalx7b0rEEdbm7brK0?=
 =?us-ascii?Q?lt8gC8MvYX85T+t/NgJAyKo7gy1kcAiKgLt9lj22HY4KNtAYZVJklCV2Ee7Q?=
 =?us-ascii?Q?yCrPtkb8SvIf3WGI6eLzaPP8UQMcJ8H9OOdnPgmX2/mVX8pJKjwD1+yaMDjz?=
 =?us-ascii?Q?IUNAN1VGjcGqwhXVa3HOUOWamGEg1nNQop1hpjLy+FNKImKTYgIZ/VhFNir8?=
 =?us-ascii?Q?F728z3zpc/QPa549aE/5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?chWiQTCguGD/izuXgkH3Gk2RdYqk5+kb9UVRwrAtRrFqClj+vveCJFtJGijd?=
 =?us-ascii?Q?yrN+cV3UVQ8yhQFKe7XE8XqGvhavhhZ/KYgWMsLW1OUfgmSeI4vqACJtR2Ms?=
 =?us-ascii?Q?ggTSXhenHtj2w1CppNYDUzd3zA5vcViM8wMl8dEi5/oJnliC3tTHIHZ3eVIJ?=
 =?us-ascii?Q?e9YkPCUbfkGckzI090gfo6aRGrEaqj8W8aleJSanhq+2MvRZL7m7Q56G3sOS?=
 =?us-ascii?Q?46Wulhe5fuIoBX7Ec10LHPjIRGKLIk/YKZr3brC9l+aGEVR9EgCJ36010a7w?=
 =?us-ascii?Q?+rwmqZiH9SjJurfFdIs8nFCGaJ8xrCM+kPUdBAnaFR7SYUFS9l/HxwazLibu?=
 =?us-ascii?Q?3TAUFhzHcJ2v6LJQWiHE1fEDzCj21vv24Ftk0ZMyiAVvWSW+uqwEnEKWxZXW?=
 =?us-ascii?Q?aWCYCTWUWtYHUEFeppQezLNBF/Zn1tvw/fd7HBI4RusSxEEQlGl8GdcZd3Im?=
 =?us-ascii?Q?AzmahzIrHpXYfXjpIXC/06TnHnd2yUdkHeBCuHaj+8sCJbC//hVYQxaAuX+3?=
 =?us-ascii?Q?CMCbaULUyCDkkuBRDb2GjXiQpwt6YMkVcG7yb8oOSFq/0O5FnXmnKDKjlXQ0?=
 =?us-ascii?Q?n6pTXEFaLbSnG0WXcY8AN2YDTvtdFi8wRMBDbkCmYr1e8MB4/h/dFa0II8Se?=
 =?us-ascii?Q?TSgn/TXz0j3A92WvTQGmrsSrjWt84kKTjDn1rWNK9IQzp/hVQ3BhUweimlZv?=
 =?us-ascii?Q?U8JAnehbhnmKasXjjfvrHAHpLajmsi73YJZr5zQid2z+v/hVEJ+j/2rbXPKk?=
 =?us-ascii?Q?8+SwvBVNEDaYr6mRPOvelLk01xlxaWcA91k8ZXyO/tFS9yi4WNZ5TH75/rzG?=
 =?us-ascii?Q?dIyawsO2i3PrwCU6kK+q89T4qf1Sx2zo4vn7agL0SGyup9SSLeDqxiNfm03+?=
 =?us-ascii?Q?qe05xTVADr2rxIc4GePIj5HqEqqGcwQol2NUY4fTTaqSPd17m3oooM7BJvqM?=
 =?us-ascii?Q?YpFm9lJ2rO48zSOLfo1D4ClC3dRo5f9EJVKrwqvxk3r41qyTF9qpGDgXZdWS?=
 =?us-ascii?Q?KtbMkqTp7PxUmCI/Rm4TaMKZqDHAxGt8sqtOxxM9s4o+FZqblNrIlqTJonhS?=
 =?us-ascii?Q?q+PF0FDDmo2N/YbCgKTbk2aQIFiMTVLYLeeU+SwkAjFQjSJ9fq0YIOBPQ1n6?=
 =?us-ascii?Q?E0GkHJ0wuEz4Vh28ppn87H1hrhv7kih8Ha+29ONe6kp0HEo5RxTqODzz9w8g?=
 =?us-ascii?Q?ORX/90VdUFNdvB4ckwc5pFqkKoawRnQZklxr0X2lRjQmNNuQnezZckZbrJcg?=
 =?us-ascii?Q?TLM5DTedwSsHT6NMzOch3tpentvhwBDOKk3byAw6eJoLYZFpmEK56yvsIraC?=
 =?us-ascii?Q?x/nP/3uGorQsqbbBILOYAZrrpL7o6P3RBpcwJNrLGki2uitzNo+R7qbeUNTn?=
 =?us-ascii?Q?kzsnh5WeoHsdtetknQUzjRGf4AzHm3TQOZpO5W859rbYwzJ4KxVkWQyUFk76?=
 =?us-ascii?Q?5O5t1rcumLOYsryrx7JDF/BiRth6cc0Vei2d5Vir2YL201MhckxzrAuTz/P1?=
 =?us-ascii?Q?OXiMYkgRv6/S5ub79O0ws48+/V+bmPs+w8uuMfVTA9JJpEnhHLJOKXYF6MfE?=
 =?us-ascii?Q?R1OURJHqKjyThtmHJBAXBOUJInC9FpTavw4vOfZt30lFWNGfHzivN0POj13a?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1N7qQJ+CBZ8Ue0a30C2ZEwDhPa5iTe7rFEcVuOmfjuQGSgnjLZFq9kmtegkKa8gqTZ2dHrLv8YZ8pu3m9c4q7Is5HTjh7uu7iWjV99glaZ9TE25ENjgkFeL+BmrwTKkZJyONhVjl7b/u9jssBQ31PBRH7E1ZDx0TD2QAbnVYBDHs4XVcHwc1G+uIOE2WRYoLm+8gIiDhza+sGr8i/b2nIcKf8dcCqexhuopjGHFr23bmaC1XdshXUU0pzZDz9aOb28n9dR4C9MSy1arvmMkCLrINHftymB5bSSngGXokP5Eo7rL4gZCQtkzb2GegbO1gLIbjT4KhFygVAtG/pX8sx/DraoRTiyiD8uMMvRW9Y6Jvwj6CBv8PZtG+8Yy8L1dzH2hki8vldOHmapntvcf+Jo8jARRYcvhhe9AaC4G7zhry04iIbviGHOcI8xJMRzOhO/1Fh2fgNEvTbuJ9zWCMfDL9HQUT4VWVz7+JM+Q17S3EhwRvNm1WeR4ZBTUZ6kOIZw4F5JfLo8AmytYuFLx4BTEFHNLi5HSh9gPk0tayckeZj9194ylljlzieWQGk1YPSWaLXjG1/Rdo4w5WipOhq/Nope2spMNbQn9+aletf6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fe8af7-2f0a-44a1-78a7-08dcf8dc2e7b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:53.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYieQDL5j5nhBZgMB54Cm9IWu68Cwv301lwBaBtd5FtEDp7BXnjiLhex9NXnxR4e9wj31vn6yO1i8Wd0AzVxoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: q1_2Bm-6T24aeUKXDAYsQwK3KXlqJiMJ
X-Proofpoint-GUID: q1_2Bm-6T24aeUKXDAYsQwK3KXlqJiMJ

This should obviously refer to the top-level mandir, i.e. PREFIX/share/man,
not PREFIX/share/man/man8!  Literally no package ever does that, I don't
know what I was thinking...

Bug: https://github.com/oracle/dtrace-utils/issues/106
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 2 +-
 cmd/Build   | 2 +-
 configure   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index cbf27b6be111..d1e18bb1bbe6 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -96,7 +96,7 @@ INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
 INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
 DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
-MANDIR = $(prefix)/share/man/man8
+MANDIR = $(prefix)/share/man
 INSTMANDIR = $(DESTDIR)$(MANDIR)
 PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
diff --git a/cmd/Build b/cmd/Build
index 68800fbeb5fc..38a538c1e3c9 100644
--- a/cmd/Build
+++ b/cmd/Build
@@ -55,4 +55,4 @@ install::
 	$(call describe-install-target,$(INSTSBINDIR),dtrace)
 	install -m 755 $(objdir)/dtrace $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTMANDIR),dtrace.8)
-	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)
+	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)/man8
diff --git a/configure b/configure
index 8cb09942703b..04c2836978d0 100755
--- a/configure
+++ b/configure
@@ -58,7 +58,7 @@ Installation paths:
 --bindir=PREFIX/sbin				Binary directory
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
---mandir=PREFIX/share/man/man8			Manpage directory
+--mandir=PREFIX/share/man			Manpage directory
 --pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
-- 
2.46.0.278.g36e3a12567

