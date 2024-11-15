Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D21DA23
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704283; cv=fail; b=p2YiK1ujXULcRSQWMGgy4btADYUhMhbuOc5BY3oaLfOBCVQo07usDvJcR5R0Y1Zy6wHgKFCX1dbFJF1XolUrNVa4+wBMnR5NL5zM9wcZOYn7eIAMEcnfxaHOZV2mK4x7vnfYdial1t4Iq64SJSPThkmOP7bOqgXUQW+D8b1omEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704283; c=relaxed/simple;
	bh=VYkfvPrXZEDhAoqt48RYVpiFEBm6inPVmLRBSLrOVS4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KjXaeTCwbyH0nJa5Ao3w74/oa6yuo4eJKYS4AWfGj1tEbBLHOukK8fsOU65e/e8GUaH84nICbWNkPvBdzK/gw5AjsPDDROnIeX4sdN62slrejyWYEz/cFgsZKFwbLTH0zdSIUuAogfFGHkl8GwhgMH5ULtjtZbnw1w98EGrs8Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=emDeBx0u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fT4jLoUe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="emDeBx0u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fT4jLoUe"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKMfVB011534
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qxPblZBsXclhd25pXX
	T9nJbY2aUVdFotIMM+MqeS15g=; b=emDeBx0uHSzVLANtR0dOfuchjdxzpoe6t0
	1T0QZM7RFG11G4XecDmHQABYXFzfMF8WibEQ/zh5Grw4DvqZ9XA2gdDOMwr9N17E
	I7u4WnLjo8zcFnhm6Z+kizcNrvHFR2KOO8HpqvcTQBIJb1WrKjempYCXYqtsEqRJ
	DZ8UYEU53O8qCb9ZFtG8geyP3IIfMBUXQCmvvwQJvL0Q2xKYXLfxBx0YDQvjFjX8
	KX1xLGezUzJsmOqXCflbzvy18b64BeD+dKg9EDRMAj0EC0mBjkzlprXXcdpoedLN
	64NAOcqRFniTpmaDDSdfpBlluHzgiD2pdFzUfu1+VC9ZQs3Z5X/w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42vsp4ny6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:58:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFJACVF001193
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:58:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6d2m90-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMBJBc53nLIWjx+6xDIw5+49Ck6p3lXhEyJQ/5CgkfXWgAzMnbgayyVZgKX+mG6Azjaa9r/oaiKg4MR4eomPYvZa7o48TbwgTHsABfO4xWCm8XTjq0uYo44wnaH6FVq6GphV9weIrh7su1jF9iFU1EQHfFG6FhpFuSMzLEKvZLaZpKgbU9etr8Q5Tip8jE05P4UfQUvy2TDX33F/S18+OwrPhUmVuvixeO2STYyL9EzM1DFuH7tXh8hzvI1uWyW8LjNtHP8eY4TcDO4+9qKmCqHs5yS+tPWp9pfc5yxQoX6QBDBJuX/WOScfNVfMzAMweglhBUHOzNe11zFvwiwKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxPblZBsXclhd25pXXT9nJbY2aUVdFotIMM+MqeS15g=;
 b=K/jS7vTA40wLjQat3qwVcdPGEbi6F0dDlwlg3OChfci0MNCk0N3EOssuE3VKVaagaWQvPgLWrLm+87Aur45U/GddCCINZg3X8cKtLR0kA2c2IPdnEU9JXXewoNYbPB12FrOA/HV18BNn8XWgAZ8Ss/EFFCKSk6pRj3c+2Bl/1689vCSNWbS30VB3mfQM5CSZRlt1Sz4BwFiuFj85HMOgd3PohMcAG+693mWlwsC/gYYV3BVj3MP0jLVLYIB1AgCIJE1wD3HPIs+k76lFWBXblUdyDpqMHc4DUQeaI76B9Vv3Izte4eOO8TjySEei/3TTV9vnUI0O2qSKOlpfMcBzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxPblZBsXclhd25pXXT9nJbY2aUVdFotIMM+MqeS15g=;
 b=fT4jLoUe8NRo38FMFAO+TgKHHigvi9MnOJuPNMbCDZVq3lHnPF7KD3ZnbWPfvbyuO2/D6xPdSBeZie2MbSAH8bPwq91cDgTqtCo4fuIZp7uYTg6Pt7/vr8a172QRv/IvWRpzsusN2X0pFhnii3Y+7JWFsXyf9Bqv3O9FOQoqpM8=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB7447.namprd10.prod.outlook.com (2603:10b6:208:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Fri, 15 Nov
 2024 20:57:57 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:57:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH v2 4/4] probe: make it possible to destroy probes in
 more cases
References: <20241114220108.95647-1-nick.alcock@oracle.com>
	<20241114220108.95647-4-nick.alcock@oracle.com>
	<ZzbUalCqoBgmUzPr@oracle.com>
Emacs: indefensible, reprehensible, and fully extensible.
Date: Fri, 15 Nov 2024 20:57:55 +0000
In-Reply-To: <ZzbUalCqoBgmUzPr@oracle.com> (Kris Van Hees's message of "Thu,
	14 Nov 2024 23:56:10 -0500")
Message-ID: <87ttc8rz8s.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1ab8c9-b89a-48ac-0e79-08dd05b82ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B4nREASLGdOoBUIJ3T+jvljTdrtGa0KRSDg4KLTLWokPsbLuoBZW9lE2619N?=
 =?us-ascii?Q?Ta8kEwrBxUT+z2JMJhc/IcN+nwJ8B4BK279K9yssrTNSwa5dqdBIgFIJXFHT?=
 =?us-ascii?Q?yL54HNN1E92T2ioG/Ri01Z0zKHFugpadhotnFoPm29p16O5jIzMhET7+KVH/?=
 =?us-ascii?Q?+/hxe3fuuANF0crGt3WfX/mSc0iK5nTiLwac8JB1Rd+07BSJ8lmXbBpAqPJT?=
 =?us-ascii?Q?c1MNVOMJew3nMie5Pgetj/mittRKW73VfJ11/mvh0P6IMgUitCCn/7vYFvD3?=
 =?us-ascii?Q?g/Fgm4K8o7rKHMCYYh1xxpxgJFe2R9VHbvYFuRMYUT2rRLaeStm8w7oaTmUb?=
 =?us-ascii?Q?LQdq1XrVgRjU1mxKW+L99QqEiOSczi8uutOozE9eEy0UKtRCFu0lfGIgmqoy?=
 =?us-ascii?Q?+peSZez0sYReaEJ1ZbXF8nxyC7+1s1wPxxMP3x0IAfRViaxNWpjMGQuor1zb?=
 =?us-ascii?Q?v3Hy6MKND/5Y65ZUhHgfIDpv+NDETfZBkkWrfB5R4agcm76v8CaLyiBS8mCx?=
 =?us-ascii?Q?g8tZuSeoFd+m76vZvvhNRql5406SVdD0yAPYsw6A6R7jFV3Ee4NTZTV1lpyN?=
 =?us-ascii?Q?bx4c5F/deSMArG4aV6Ofa2NjUWPJsGzvXojPT8LSpfqv8sQ1T7Twool7uQIT?=
 =?us-ascii?Q?t9lkxd5SJcY75FQ0bYfSEJ/hUDb2u5QYQ7+EmrKxQuU34P/nwsb4xBWVg7jS?=
 =?us-ascii?Q?Q9s2FkB3b4wGRNL+itOS6KyUnHbm+wct82r/Sqbyecr875VH5PTKTuv0XNLr?=
 =?us-ascii?Q?p6/g5jgicIy7fqiGamx9tU/2fToNMTtbe2N5QSoM2wzL57aDDh+t+JcIj/xW?=
 =?us-ascii?Q?4Ul96KIUI0TR174/JwbJvH61u6R+Uc8GZz/4hQLB0Orx1RrpeyJ+siGMqa9Y?=
 =?us-ascii?Q?rjDR8Zdo2MCuTbkb40/qX12LGzZF94OAN8wxbXGPwC6bKyzC17vmoRwgzqko?=
 =?us-ascii?Q?TzAY/KVa1cMTMS7Q1e/kVhw6XhMFO507/FTcoj3qdId0RMTWOFGOhZnLjl/A?=
 =?us-ascii?Q?z3RN9Fam+K5mvqLSRNMomTrIgRckCR9buiTlNrzCh9aGhN5TWf2ZNeBjopXq?=
 =?us-ascii?Q?DG0uH/DTgNhd0UtrvpYZPi7FjcFm+Lx38N/Cur+UKrHT6X6CSgZefaUf0Jwn?=
 =?us-ascii?Q?j+tR/UaijzoE0vROrM8PJ7IWQq30DaEXUmsMwf1wK9VNZSntus4s5gxHzYoU?=
 =?us-ascii?Q?KVEP4Y7mRkXEaKb6eZZn8SFmkuG5zZoXw966IXsNbaBSEZFuHiKOLGuf2fWv?=
 =?us-ascii?Q?HiOiUygpr17WHMufGshw8L20yPbGf4tni3NFeAkDWN7qjDZUJE2tWtyI8hHn?=
 =?us-ascii?Q?g7RQ7w+WOsPcvFz57z8xoBuM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dq91Gtjq5tAZ3JU9ci7clUIt/zXJf8Hj7F1mIn/sSvTwnguj1bkXFoYQNtsO?=
 =?us-ascii?Q?Gc1+2JP68GsAOEZjEZXiw7RVnlNCstynHhRa9hoEjNxr9KFBKII1/f3GLjmB?=
 =?us-ascii?Q?OqkOkoXtfaFgYL8cFnu6QkywtgMuj3imjawi/BDbHFPbF/sKvHghk9G4R7p6?=
 =?us-ascii?Q?3fDn9wayhHz6f1SXDyyjshiT9PAvJGTlPQXHSlONZFWSOlH0XdoVLjWJn9nK?=
 =?us-ascii?Q?RZY6iL30FpzWPCHkAkJWUECuic6JemxQx71TYNiN5Wv6SGWEcn9kD8txATTf?=
 =?us-ascii?Q?SNg4yFcfKPuJEIkWO8qlK06iTjrYwI0KD+cEZL5DpQWCGE4NZJVfoJjbEIcZ?=
 =?us-ascii?Q?LBFZ0EEMP74OEcG/EsWkTXkOkYDB1SO/3xhPvdb2DCZmzrH0O2WV1WRGNMdm?=
 =?us-ascii?Q?NZukbBGUcWsuwyIZOOAbMYyPA2gQhYzb75VxMGhtMAJijWcKOp2BogxZnsse?=
 =?us-ascii?Q?Ua2niFtTCuOheXVSNlM96KyuXeTB2YyUyGuDpHLRN2wq+Kfmfzhm8QD02CJu?=
 =?us-ascii?Q?20BA1FVETSorb63kvJfGJMo9CkyKxMPlZV9/GmSFHGShqkXjAeK4qrbqPd8F?=
 =?us-ascii?Q?kEgipnBVbxjKPVCeqB/oWL1+vMqEHz7B0ieyElxWcBKCnpsyEg1xi7TNYmDB?=
 =?us-ascii?Q?f5y/nROVx8UPKznBdt0BMEeVbyLr/N8qO96YsdGD+FIkRBwuJid3GShI7s97?=
 =?us-ascii?Q?GMObBuq0E6NnN4DWXKwpS0wbNvyJmeVZc7s/UOmVczv/fVKJzdyJmeNPScBU?=
 =?us-ascii?Q?PThFAtmPcmv30EzVerD0o5X5eqAUyJmBWxhGnLK5fZJvQcPseFp0Hgg9Vgzo?=
 =?us-ascii?Q?QniZwf2jGW+F14+tCr3W9pY1SgQSBATBvyByOEeR20hJLPQ5YWJCQ1LoFhkV?=
 =?us-ascii?Q?GPaYRdyaxSnVQHVBtlPORXmnkNaktlrScDVGqv4xn5BzsLr4RBWl5pK/KDku?=
 =?us-ascii?Q?UCCsCXxvOYEi9+YykKEIRinhjiLnK1L6A+sUV8w0uQ5l+z4txjARgaMcCljb?=
 =?us-ascii?Q?PGk/iIMFcp9BP6hqcX0Iai+a22W/XZUwbdBOsTMfw4GWh5gVq+aq1cRpW3BG?=
 =?us-ascii?Q?W/4b5KBr4Me4kToB/B55k+4R3sgIpH0d89DU95qC6QULGho2i7QC0i8Waz64?=
 =?us-ascii?Q?zzmiMUUQMjYHiVKc2/Ec0ZvK0XHEOIr4398JBxmssMpJclYfCNnmq78q6j4Z?=
 =?us-ascii?Q?dgcvcQ4vYit2vCRhrBJqKkvt4gG7zq+Wts6X/aB0c1KYHlLJ6LBlsQfZBQdl?=
 =?us-ascii?Q?vgQji844mDC26L7FH2OSUaG7LNmHRvSGeD/9f71iIBYAszueryIcd3ue9eIc?=
 =?us-ascii?Q?wFYJ77AU/NkB+GfdezbmSEVCmR0+y7NA/MFfcOGBQL5WHUz1aYeZYG8ISI0b?=
 =?us-ascii?Q?QWdIsvwJ3gvcpA0ouJAZVPO0b/ycW+ZMvjPLABwqV9SPivvIhasdu7dus0gw?=
 =?us-ascii?Q?ja2bKXMJvAImkr9FZfZxsMaEldsQdWtoIOHmmp0TMJIWyLVK9VTdwXKOvaLQ?=
 =?us-ascii?Q?Wfpei/s4jqSe0Op3mhblfCHrDMlTljOBGoBI/kS1mbz+g808rmVAV7snFz7S?=
 =?us-ascii?Q?AbPaAS1WVW1twI8DzLyXCcoR6yQsNYmUnFFa3Wr4zOTQX+N4qQAv836yWdkO?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/nulfcuwZ+6rH+qfsoqZpyZE07JGWBv3SThEVdVjWOAa03lFBEos/4OM/8/nFui4APSh9nsUisSOWbeGlOTRfIdQob7S0HIqXTpRQijWMFvbPzxkVLhBMEgPZfEejGgHry1mTnE12Rl2WH1BuDzQ7Th/Nj7kccOCfpzhp+mxQrL1p8ZPSTllp2J25bt/zi83XBQg1sL/q+OHzw5diG47Q8TcK92dl2hZLF9a7wsJImjhj95oc4fPw85nlehAHwAUXyduzuSBAqWb+Ym/cgD8Y1hj/bQa+jgUuNa4pBDkyUjCGcjoSQ47YuVwl16mnvnMbYGJQAsSgvqEm4qixR2KiWso9HpaeY5V0I9qRnvMLmEjtfA+dga/6LRHV1WjWuja/6XxGTujcB6/VzJXnuYUb8zu1huFwDBzj0R3BiujLP974870IbroPrOjNcPzuGdDdzK6TlZdP20C8KcV6BqTJzo6UkhW8WST6T4yAaGQsolZ+eNI9d0/w4LaFtw5VT9VIm1Z2voptQlZqCfwMuTpXosZxqZh9JUkqVag8Uen0lTPdQJUYp7CRfjMfGLidknjkxRf/2zUN6/cyzZIyBljpcsJ0cngpB+FwNdTMSL7M9w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1ab8c9-b89a-48ac-0e79-08dd05b82ead
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:57:57.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGZTZcfsujSZlePozhILDILdt4ahVWW2A0WjjaTReFJ5sgzzR1W4dp0hcX3y6MCcJPzOYfW5CqyT3yOj9+iY2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_08,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=937 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411150175
X-Proofpoint-ORIG-GUID: x9aZfcU7PMOr79Aa74l9rzzSyP-GPD8p
X-Proofpoint-GUID: x9aZfcU7PMOr79Aa74l9rzzSyP-GPD8p

On 15 Nov 2024, Kris Van Hees said:

> This patch is not needed.  I do not see any failures related to the changes
> in this patch and the test case passes even without these code changes as
> far as I can see.

It didn't when I ran it. Try under valgrind.

> The test case has been added to the 3/4 patch, and has been converted to a 
> simple .d file (and .r for test verification).  No need to use a shell script
> in this case.

True enough.

-- 
NULL && (void)
