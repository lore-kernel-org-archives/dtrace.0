Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5530F4FB
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576772; cv=fail; b=czP0cuPqH51RX0KWwEwivBPJkGvOYNgTRQtsATBjEht518zjQAj1OouQH2lMQbkbIyFD943PTeeZiPU/ivk37gX/AX+m1VQV0diNa5+VyckcbN48JDgZcUJsW/xGkLsNWii+DqLV9p6sjsZ9ujdkRxdO1ifusqSTAuzM6Yx/GQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576772; c=relaxed/simple;
	bh=xRZ7aeDGeJ+lQsWzHGFbipnyAr8V18gD+gf4LZY2EUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uWWWBJL1a8nmnhgBulOWdAEPOeB4gL3c3hnPwU1moPv+lrknzPcFR32POYVt7Ecx29A2WQg5+PMClYdsQqCzHWYCJ8IvlujN9TtllZCkJHYC9JUinS36nVa7DYHqo5T9jIeYHAH/8/MNwjheq9IlQ+MF9uwleLf6Ukq77q48KaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U33+Cwfs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dh3fdJB9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U33+Cwfs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dh3fdJB9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723g3n6014791
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=lfOLXs/pJWLuyXo
	i7HT2/EVBeOzYj5w0WX+gockQ3jA=; b=U33+CwfswXwHtO04vNZpohA8UbgsbJn
	4yUo7jF6fRlNA4OHalDv0zUBMWQtwz80O7bBimiInq4PW92eqSjDwoOF77sxoiEJ
	yZkCqZPJ3ozqFMt8uOKU5/WPskPkNkEmaPLKE358PBjuuzlowtl+qE/NdelUrwNs
	3ZfFnxm3weZaIY8syo3mKvpajd4EHBIl194EScyIt6+SpX8Og8pcqg3OwtGrnYoa
	X6MnIBtgtSORLlbeqE5pw2E0vdP4QrA1PZJNWzNYENInh6WA78hM4NP0TMqshCaV
	4Z7DDXvLuYZ3F85zPs2wFg06tiT23jA+ksRjpAWmJppoktsbUCzzbcQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdy0e69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:32:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723i0IR029064
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:32:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmptxakt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqykF+4UFfFxBXrkKSEgiF1w2Qdw/aq9rCGnWmAwaaOq53JcYmXpIAMVGdg0J5HOkOXOulAcgicJ9mISc9y6fuvv/qQwMoEd/xgFxYw5PbfMaMRRJmwaAIVVEgiD3hn0JcjNzLdDIt7YpzKA8x8os9sMNg/EZANQkMfjbvEkkFZAFnJC/YC9qlJmvrYiU4OGQ1lAI/F7XiQmivosvw540AQZIjch1uABL5kQkKVSDGHFvnajaipA8V4aaI5ip5nX8AQPh4JXu71791poX5CMRh45OxMJ7Mel77TwEwdulE3bRyNHuh1hIXvQU4ZqzWEuG55eyfIcdFZzAvKiAFBK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfOLXs/pJWLuyXoi7HT2/EVBeOzYj5w0WX+gockQ3jA=;
 b=gRTci/fK7At9Xr1TWNlNLPuR27s5/T2UYzNvl3ypjmXO8q12o5t27qrk2kh+0JGDAO6jXQyer3+BNetslKgU4hUTzU6y6OY6fWnxE6l1+D0bAHpWsnrN/NkxF7uGcaKF7MznrjzcvV7WzVhNXrzI+vK8Mc4REBSMRDS8Ens9hM1Xn6hMG1TenrtiijE2t2Q9X337c4DTEIiPzuLfJM/sVZS8AFox8oPp3iLaq8QmONXfTFEDSsUzlp6VQgf7Y96MSRB0gvofk1w/tD49hYYHOknsLjmCInv5eDikAhRKpJR3R882M0vnteTYpiVEwGge8p95VaGQBIczHi4fH4Mf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfOLXs/pJWLuyXoi7HT2/EVBeOzYj5w0WX+gockQ3jA=;
 b=dh3fdJB9feJ0smjDM/Xc3axD6n51jPH5EYRNro/DwMCClsQZIbJXi0vB7OOgsWbGJW6uKr7x6ihSKFi/b9Ys6MmEfaccFy3xzUOCVOnOgvYDACg6ImmUz8phguWnSR2StGtFPUQ8VFboSLy5pYG8LhfEmq9LmbkLgwe8OCXeVns=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7326.namprd10.prod.outlook.com (2603:10b6:208:40d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 05:32:46 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:32:46 +0000
Date: Fri, 2 Aug 2024 01:32:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 9/9] test: work when relocated
Message-ID: <ZqxvfAn3RDFiOU/c@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-10-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-10-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR01CA0002.prod.exchangelabs.com (2603:10b6:208:10c::15)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5b98e2-1b84-438b-8215-08dcb2b48a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ho72fohVg1nW74zB+9yZIFXJuc9jzPYVY6LfDoFbc6mycbSU/aToLJuLk8mx?=
 =?us-ascii?Q?FUWZl6yyC7Amiy2BVCsiMzh2z+avA3gCTIr9CpUCipsrM9ybgpRu4dISn2sK?=
 =?us-ascii?Q?Ron79VEXJcce4h5k7+XahUyM3phlAC5aDyzOIZ1yu+9IvhqTf0Nv/Nys4DAQ?=
 =?us-ascii?Q?XL45WZMNVOqsNzKkikkaRibWerBdUZJ6IBJ9JqJi3GSAacRnPu80uiUebUfG?=
 =?us-ascii?Q?dNDqpFBApZD4zSqjlPse3ZCt1pSXz1n1y3qC3tYqD0XztIT3fCkeB7MNrPpd?=
 =?us-ascii?Q?CR5TWuK1TbzwAAAInTw/idfy2zWXpt91+Pv3/eRdtv3AMwr7Y3hC13zK6g9N?=
 =?us-ascii?Q?Cc5Wt9utr3BZIqwmhLr9KEcBi+D/5gS86bD+KLT1RqtIjZ7nGuCtlGuOkG11?=
 =?us-ascii?Q?ymND0zjGRkV25QkAexiNByx6vi6o4qSqa3eu9DawwUnQ8LS9vlz52gMbwM2Q?=
 =?us-ascii?Q?wgC64rPiJrI7QbFXygPqP+JZumxDHT0TBNczyalDLR230SwdLg+K081REHjB?=
 =?us-ascii?Q?7NNcmzLAf0AfixMF69p2Kv4bljeD69f5zfiwJsEeAe1jW7Fwx+hzNOzL1BAZ?=
 =?us-ascii?Q?a9uYl/7FINLPGSEKzCfx/j9nqnrjoQHA+g2oPf21cpTIRtBlQvQmyShuQjBU?=
 =?us-ascii?Q?sA5ujWrCHXzS2snj7ySaN+sCtdxVVTF6m6eIpsHmoEzXAqHHFq2rwlSLmKLu?=
 =?us-ascii?Q?6x9x2pBDob5oX9eA6q27eWxRnEdNHOV+XwIZhHblWqz4VWUvsBePS83OTD1m?=
 =?us-ascii?Q?74isKaQir3tKJhoG/CT7+06Yp9E/Z5S5YcCBLkMYUHQhGtUsipWpL62UmFC/?=
 =?us-ascii?Q?OvAn7HcgspqGv9vTOsfUuGQ434Yh2ZlDmNTb7JgTd3Hj7FfgoDxw1Oa/Wb2U?=
 =?us-ascii?Q?vu/V75RfbC8Q2L9CCBBF+zSjKDLVAeqtOuvVf8yyaMbgwwK9p9tVB9eIDdO3?=
 =?us-ascii?Q?ZwokQJWmcoV6zHSGHl2mBJTVKPb88K5VNgBx+JZQ0zwzEI5Ol5DAnkSB/wE8?=
 =?us-ascii?Q?tcIwq5VapJgSNZmQI/c5iRAm4Nj9fIBBNFy8P4L8nm8LFyz+Qh4VCMUqKrTF?=
 =?us-ascii?Q?um/9QpnokiX4WTG4ah3K/tmln8gLNmbECJnfpbLAMu6WK3wVfsNE46wjUeLf?=
 =?us-ascii?Q?aanUB2h11IVqiB37kpnIHBpVHuPp6IV/CXjCerLNlSTuhs3jNDv0DdQT+t4J?=
 =?us-ascii?Q?rVWIwdbv5CmPvLzHvyetPWfkOVKrr0HfV9g5D32iP0EiWWtBOHodLMBCz7RX?=
 =?us-ascii?Q?xNZQGwJCoVI2nf0fGx6pTkOOAVlETyhgb08qT5NfjtrOnV52NpLn41YqPlgU?=
 =?us-ascii?Q?Mtla5e2HmVryiXy42hUbPKBCSFGpLKuwetGdzDwOx5oyXg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2HIYmO+FLNY0iecqGSue4sgYzeEDveMMtE+gW7YbynznAvwAy9k82HWNLL+q?=
 =?us-ascii?Q?2WSxb+fzQTi0klu29zj5ZmbtxzpaHlLa/hbf8oPiRF1C1bJC++LEFqZKiLcS?=
 =?us-ascii?Q?/O2uKmvF+mKUIFGT+djpOegBYxR9kRcwh1amNJrrR+eYhq8qiEtOYFipFBRl?=
 =?us-ascii?Q?cp2z8ar802A28aaUmo9K/vdNIqJNOpR0lnSGNHnvBLN+LmuMVe3l8H3MXsSW?=
 =?us-ascii?Q?6rKIsQKv+UnGZXILfQBWCrepA6QRYSekuZuWM+5GPi8aXDoDg6RfmgL4W7jg?=
 =?us-ascii?Q?Cfs7ve0iP/t+yYLSBioJ3iPbj3sD0qQYernr98hK85iTMHUuxxhk/IpTeE7K?=
 =?us-ascii?Q?Pp8AlxUQMH/EkBXJMQ1lITmRRazGjsUMvD7wVCphZNs2NrKJ2rhxctaoxvz0?=
 =?us-ascii?Q?ew6aDd4IOpfnlBSHur7kCuXNSQa+P8w2zgQuM5E1d2/af7djPEj+f0UEW4n3?=
 =?us-ascii?Q?qr5nnNnqz0+PhsN7gmqksX9Kfe9MBknUrcBc2IN3YHg9mHs8raUBHZqsURu6?=
 =?us-ascii?Q?4uroMnwy4g/J3a5FpbBBDX4A0JS/wRppC0VmoAXl+jTs2lEr3xsiaFNi/uTF?=
 =?us-ascii?Q?K2NkQHjbkY/uSN4NFPAgGe+9zCSI5AStemSfUKcPka0Dy3gnQEg0p4VxNtB+?=
 =?us-ascii?Q?p68F9vhFvbsTcysei9xW+v5Zx19fsp7euP6RHkyFaDqnsGnMuvsQh701G0Md?=
 =?us-ascii?Q?bjGSOU+vuH1xMEOSCcnelixrl9na+hdcFhsO/npMojpBcgYaGwQjZbuZE+GN?=
 =?us-ascii?Q?5uR26KJBjjf/kqjdIr04/aAa6Mz+IBAQqTtDy+aR/7uBjGhAC2Dj7JcF014h?=
 =?us-ascii?Q?nbiaBdomuHppLD6BSFZa/DpCRdp60FRm52+EtfDR9EMRVXDgkmOGgCDwDa3Z?=
 =?us-ascii?Q?TCzxgYc1K4k6n1aBVnv1FzXXpqePFcvp+6y40tCFSS+7vIzXWdKDTYjkwNyf?=
 =?us-ascii?Q?6ZS7k8Pr4PPgnA6fn4CWN2ameBgXJ85S/Tz8ZKjrGo7K3wg3QDrLPUdBWsLl?=
 =?us-ascii?Q?Hzz4GcOH+lBGyXoI35SbUrhRWXZAv8EfraG39r+SKBYFBnuPbFI1ooGIJIv9?=
 =?us-ascii?Q?io/Y2DLAo81MbiEROgXeSA0+9AC/3LisPi8PYLBMGQuJ+iGG+7SWLad5uulU?=
 =?us-ascii?Q?ObGcaIvFMinjgP+hWaoCqMVPwpamCsUEZaT3018fRZojZCOZcR70v5sLDf56?=
 =?us-ascii?Q?t3fS3VJ8vArJ4AMkO/lq7F62iJoB9mJrw4JT3Ecd3EZp5EWrsUvpYH70rgC+?=
 =?us-ascii?Q?vEQi1sIO9I5Wj3QErg600O2Q6qurayM1jTA2fcBYbzyiACbhUT0EVHOH5mt8?=
 =?us-ascii?Q?qmGjgDTqs+p/VnnnEZaas0fgUvlTSWAXKtLmA09A6HBALXJc+4HJxLe8mkSH?=
 =?us-ascii?Q?hJ0iiOb3Bj1yVbi3x6Lvyn4Cxva2PQkmyN7TA7vswnNOpenwJCoih3bv3L4q?=
 =?us-ascii?Q?eAQkkDtPOd/AiPsCU6KWrq3dB/rkhmid0qbbJsyuefTy7FoE0ikvIhutWbGy?=
 =?us-ascii?Q?0to8G4aB/ObKvcQeoz+UAwNesRV0hZFUwRr7iUaLy4dqtuoBFRiwR6UNNSmt?=
 =?us-ascii?Q?jVOB5Od3/NHbJbfDEyLdfpgA/dt6yDD1dDMCASNizB8+77dNV00p6/L72rLn?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n0RWsMJGV1Hb+w3WrqdPKilQ66ph8BxFmTGCEsYAHBYmQD0zreqXeM/8qOai2kSsIVTGGw1Boqe2HBnoRBVSxAlkE/FSKTWhCv/3vRjr2SNvGE2mA4i9I8+u8prdjTEd2Tg1/kby1CfU+HbDMn3AolmWh2JSXIauxAZrs+2/b2Qi48OGwBk85Wds7qXJlaq3w3ZNKkAoYRhpH/w8d2gfWYMSTUO/DiSlMWvY1e2cjmXmHihAMGHfrfPOyELu0qMaxmx1cOos47ut1eOjovPJqmjl9vwF+pPIQFOdYuY/rqUGjZgWYSnwVwRntGuxEhOsIfrUVMYZwO2MvXarjRv9LrGS7e0YfZDCB8bG7pL7QIqPElOiuP8OdzkwImFlzguO5tecq3srS1u7Zbj6/yrkFemTFwECZhrJJQa/Yvi5MGReCAGASFdbMvHJytMU96i6e+42hp6BXmf6D27tai5juyF09aLggoypS5Mvgn/7g+lPqJUgt7XLfL2N5XjuAWK1omLbj8+7WVvWIjparGRnBG14ZqIHf5g1lXh8y+7rCHdgU3kvje9Ud6JbH9D1qZppjxDRUrZzsYKXu4Y1i12dH3vnkkoOf23ZVm/BLNUBuUo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5b98e2-1b84-438b-8215-08dcb2b48a65
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:32:46.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXPC3T2zjRmmt6DNPLz7uY7+LWnmlG/fE+Y4lQR9SbV3fyT65UPVfYRCKMCF+R9JybxO9hHGCPfROy3pJI9uop2e7G9MUIvEVgNkFy7PbR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7326
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020036
X-Proofpoint-ORIG-GUID: ZoG8yKhMKBK7BYhRd_Ra-wUdVPpRm4vC
X-Proofpoint-GUID: ZoG8yKhMKBK7BYhRd_Ra-wUdVPpRm4vC

On Thu, Aug 01, 2024 at 02:21:56PM +0100, Nick Alcock wrote:
> We do this by adding a variable to the pkg-config files that points at
> the dtrace binary, then using that.  To make this work when the prefix
> is changed, runtest.sh sets its own PKG_CONFIG_PATH to a directory
> relative to the testsuite.  This will fail if the pkg-config install
> path is also changed, but in that case presumably the person installing
> it has arranged for pkg-config to find the pkg-config files in the
> installed location.  Fix a couple of tests that are assuming the
> location of the dtrace binary can be used to determine whether the
> installed testsuite is in use.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  runtest.sh                           | 13 +++++++++++--
>  test/unittest/usdt/tst.manyprocs.sh  |  2 +-
>  test/unittest/usdt/tst.multitrace.sh |  2 +-
>  uts/Build                            |  3 ++-
>  uts/dtrace.pc.in                     |  1 +
>  uts/dtrace_sdt.pc.in                 |  1 +
>  6 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/runtest.sh b/runtest.sh
> index 16a1a77bd394..792b2f4f25c7 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -18,6 +18,7 @@ shopt -s nullglob extglob
>  unset CDPATH
>  unset POSIXLY_CORRECT  # Interferes with 'wait'
>  export LC_COLLATE="C"
> +export dtrace="/usr/sbin/dtrace"
>  
>  arch="$(uname -m)"
>  
> @@ -574,7 +575,15 @@ if [[ -z $USE_INSTALLED ]]; then
>      export dtprobed_pid=$!
>      ZAPTHESE+=($dtprobed_pid)
>  else
> -    dtrace="/usr/sbin/dtrace"
> +    # If we don't have a pkg-config path, try to point at a plausible
> +    # one given DTrace's default install paths.  This will fail if
> +    # the pkg-config path is changed as well: in that case, presumably
> +    # the person changing that path has pointed pkg-config at it anyway.
> +    if [[ -z $PKG_CONFIG_PATH ]]; then
> +        export PKG_CONFIG_PATH="$(pwd)/../../../share/pkgconfig"
> +    fi
> +
> +    dtrace="$(pkg-config --variable=dtrace dtrace)"
>      test_libdir="installed"
>      test_ldflags=""
>      test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt) $(pkg-config --cflags dtrace)"
> @@ -584,8 +593,8 @@ else
>          exit 1
>      fi
>  fi
> -export dtrace
>  export test_cppflags
> +export test_libdir
>  
>  # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
>  # does, add a bunch of options designed to make GCC output look like it used
> diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
> index a899470dfa0e..f820ed231c38 100755
> --- a/test/unittest/usdt/tst.manyprocs.sh
> +++ b/test/unittest/usdt/tst.manyprocs.sh
> @@ -82,7 +82,7 @@ done
>  # should contain at most five or so DOFs, even though 512
>  # processes left stale DOF around.  (Allow up to ten in
>  # case the most recent cleanup is still underway.)
> -if [[ $dtrace != "/usr/sbin/dtrace" ]] && [[ -n $DTRACE_OPT_DOFSTASHPATH ]]; then
> +if [[ $test_libdir != "installed" ]] && [[ -n $DTRACE_OPT_DOFSTASHPATH ]]; then
>      NUMDOFS="$(find $DTRACE_OPT_DOFSTASHPATH/stash/dof -type f | wc -l)"
>      if [[ $NUMDOFS -gt 10 ]]; then
>  	echo "DOF stash contains too many old DOFs: $NUMDOFS" >&2
> diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
> index 84cf1e8caa54..dcabde620c03 100755
> --- a/test/unittest/usdt/tst.multitrace.sh
> +++ b/test/unittest/usdt/tst.multitrace.sh
> @@ -123,7 +123,7 @@ ONE=$!
>  # if re-executed with a newer version of dtprobed with incompatible
>  # parse state.  Overwrite the parsed DOF with crap first, to force
>  # a failure if it simply doesn't reparse at all.
> -if [[ $dtrace != "/usr/sbin/dtrace" ]] && [[ -n $dtprobed_pid ]]; then
> +if [[ $test_libdir != "installed" ]] && [[ -n $dtprobed_pid ]]; then
>      sleep 1
>      for parsed in $DTRACE_OPT_DOFSTASHPATH/stash/dof-pid/*/*/parsed/*; do
>  	echo 'a' > $parsed
> diff --git a/uts/Build b/uts/Build
> index 7948e9f2d084..181819410624 100644
> --- a/uts/Build
> +++ b/uts/Build
> @@ -37,6 +37,7 @@ install::
>  		(cd $(uts_DIR) && \
>  		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
>  			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
> -			-e 's,@VERSION@,$(VERSION),g' < \
> +			-e 's,@VERSION@,$(VERSION),g;' \
> +			-e 's,@DTRACE@,$(SBINDIR)/dtrace,g' < \
>  			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
>  	done
> diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
> index 58aa46fc75c9..9977082c5a7c 100644
> --- a/uts/dtrace.pc.in
> +++ b/uts/dtrace.pc.in
> @@ -1,5 +1,6 @@
>  includedir = @INCLUDEDIR@
>  libdir = @LIBDIR@
> +dtrace = @DTRACE@
>  
>  Name: DTrace
>  Description: DTrace consumer headers
> diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
> index c5506f9355d9..32474bc3f75d 100644
> --- a/uts/dtrace_sdt.pc.in
> +++ b/uts/dtrace_sdt.pc.in
> @@ -1,4 +1,5 @@
>  sdtincludedir = @SDTINCLUDEDIR@
> +dtrace = @DTRACE@
>  
>  Name: DTrace SDT
>  Description: DTrace raw SDT headers
> -- 
> 2.46.0.277.ge12b8151ed
