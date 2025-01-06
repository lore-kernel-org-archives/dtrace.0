Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E21DF993
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197478; cv=fail; b=WJX0ggmHwxyMU5QIwZvr1qgkQMe8hMu0UPPaFdBKY4emQBWJ6fihmlgAJHxvgRSb9FEIVl5wfLCpwB9/Pfec1OGYN/Y+VBoTZVQALFnCyo46fxuWuJJ4Nz9kqujwCahcuuiT4le8s2XdnD9YEvxzfxrqr/O/g6v3JQCLoEgrMlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197478; c=relaxed/simple;
	bh=mpYM4iHEZFU7O+Lp94sarLTFx/kS/X9UdBc7quqWASk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sVeMP/5x/7N5qa6KgexfH5NOqVEzl2RV8Tfb9Y1NtRYjNjh1ddBehzb5J3Pe8pkDJdzC2nU73wWYxM4/bFeQejlT9xuSpJBfgqG53kLZYQNuKjuTdYTxpSXT81qA9SW/pJvvVOvJaHqpmiyVToMmas6Hjnt6tJ+kK7B0vwWJQiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F2pLUQk6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tUaW62CT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F2pLUQk6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tUaW62CT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Htj3T024536
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 21:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=i+r7NBTfxQ8NW55h96
	4V2DWPYwakw1al+4bCjpAOh+U=; b=F2pLUQk6OxhOp4oTzqhyqd4UzH58CrISoh
	i60E1V6iwhVaf3rTSPB2GIOxt3p0Bpvnb5IUwxIywPemkQ2WbJSC57BgKWKySn/P
	43Gy4RENdObUFx4vboGFiqGztJMfcUYgvFkn0qhC9ITppnblgUx3TD9sNUJ3ho+E
	fbv/zTFRV3E2cqRS1Bqen+PgKG3//IHzPKt7OGOXRy8337jc5G7RbUg+NpWnJBUb
	Kop78WisNIg6j72Hf0yHrEtIkkc6H74/I2+5p924xR25p4kdTWOJMy8VTb/ufcBg
	UbK3L7qhgKvd4pZOHqK1lnIABTofZwqqOwIq7urb1bV442hRwZdg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xwhsk5hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 21:04:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506KFNSn020207
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 21:04:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuee14w6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 21:04:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vy6JAtXGhGAcP7dr6ZbfXeFojPEn/O8hlnDne5HCXj28PW8bBBcbSfgWMH6Jdi86YCjydI0vD62Kz9vKOGNKJ4FKrLRRUvU2IkHXITjd79Jm2uixxyF0yzjLpKcR12PfGzUeMp1gFrzsmei6vhn3w1PDzCKd4ZjI6ShpJxEgeIlnKql2iTQ/JL5kxxbOzMWiQvCaCD7LVTGE/Nrmt/RiQTBcY1Ho1Am7UeF//q6ekewCdN48IJcyo7g50XSSyzqzhP8OYCYdFxfCl879Rl0q8tdwB1dptS7ZhfwEZPxOCr/Sr6yribIkmBPs/2D6fBpnte98mGXwQ7qn+XSj2DziKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+r7NBTfxQ8NW55h964V2DWPYwakw1al+4bCjpAOh+U=;
 b=cewvNJ3GAUud5V1TPsfsP5vVdsaaF8P/0y6+NkXxqUrpdAI0BB8SFtVIWZnPLQDKr1qpBIC9OHqq7cgxKhcfd/EuPEe0KeqVir/7ZAi7aqoYe6Vu3tZLIea/cdh2/yXYnj60BcJ2KL8dRQK+hh4Jo7GYK911UduKhk4vw7o5C5tURy63ZqpuwyI34d+d/z7S4ZtAgzyXrj5Ot6oxCIQ2J+pnuzdvFJD0IYkFhi74E++b1m6GHeJmn02fOV9ZQckc6e+iSSbwlGx03l3TU9YM68rawG5oIAvtbB0rkH0NJq0lvv4yjiEpqfU/mgL9was2fxIq9fDYlB0hWLd6l8Ai6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+r7NBTfxQ8NW55h964V2DWPYwakw1al+4bCjpAOh+U=;
 b=tUaW62CTuzXLvWLfa4/WnnqBezNgr9TXwwyJzgxFc690lIKpjDR6H2ilr0IDKeK5h54nhTD0e50PKQlikC8fL8i7uoL+IRY6bw53zuJ8sNG7Ce2Rjb9tsGrw/OoAkpYEhiWSxcEwdX4yRZ3nNBMQF3KR5iDQKlnDmy0KTy04cyI=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 21:04:28 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 21:04:28 +0000
Date: Mon, 6 Jan 2025 16:04:25 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Allow duplicate usym/umod/uaddr if for different
 pids
Message-ID: <Z3xFWS+WEviQKMtl@oracle.com>
References: <20241205191318.18587-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205191318.18587-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BN0PR10MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6869f3-3083-4ecd-ef77-08dd2e95b53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wsxRVttkPjyDjlqmpk/x0lm2V0Z0Vugd/AXcvIEhWtlLsPRGZoN0/+UQmb/C?=
 =?us-ascii?Q?B/Ye9UhWzGfuPJgudvwe1w/tFZl2YuuFN+tUEjgvL5GR5dJFGH6QCafqRroM?=
 =?us-ascii?Q?7HgiEl2BXlnAI5f6E1NJqreUa7niwnPnXS2fN7HeUN1CSezRDfiXyYf8I3Lz?=
 =?us-ascii?Q?Kk+aIFhtHkzir0rZqpFD4hFIk1xsmtTVHMdRR/LLpZqQfpaIkDdKhohgbbA0?=
 =?us-ascii?Q?g40K4JrO4glL+UrPsVjd6bokxrKCMAZiLvDqHFCGiOsRes/W8QjA4VIiXDBA?=
 =?us-ascii?Q?h0JSvcZQB1D+njtztsK0xafsh0NV0VMPIb0pRXIJLQRT+OLVNMPAU+MYbz//?=
 =?us-ascii?Q?7SQXSRtP+cus/dbhYHUpizfGaT8AtQIfmlaOVcRSyS6h0CsAZ4YZ7xLbn0nz?=
 =?us-ascii?Q?NcbyaeTGmfu44SnsnsVeah5f9Yqr4RCfAGpqJDh93hNRYm+nQqoT9y3zsLYx?=
 =?us-ascii?Q?DWlfu/w1DRqDUzF6JhxFwRRrEFl9qLtg0tQndvLrWvg497daP6osQlFgYkcr?=
 =?us-ascii?Q?RPY0cfz/kq8ACYK1RrTda/PrIJaMBkqs/G6q6/Zm2NRlkfdr3hVJQnZU8dES?=
 =?us-ascii?Q?VKyS6nzS92dkTP2P8PeAFdwziZOeJk8XAhf2ovToUi9EsaLDQRYEMZXPdPx6?=
 =?us-ascii?Q?HeR2PF5an0WXfx4WA3hvott8EjLz5k5EX+uOWhCHn5UOEzOHksWNN7n7uxF3?=
 =?us-ascii?Q?lARz5jhN6mcoOgCQCtgD6ddwBGBIJLXDlJP/ozX6Pb7q5Y0YnvSPdEVVU7a7?=
 =?us-ascii?Q?5leMh1k2mL+9sB3dlkQDcXVZyKk38+xxktCRWPRj5lh1HbfLu2kaNf0AW6VS?=
 =?us-ascii?Q?9NSwQyXTgXXdKVbLKNnuZlP1xKtQcfu5+8Iu+s037SrNHqEzdxvm+gbNah58?=
 =?us-ascii?Q?avPvAgr6vO7w+xq0SnxDBeE86rQbOJb2QQuRFRdiwqYTkzN/D/KEsbpAu7kh?=
 =?us-ascii?Q?oHH+ni3UwUmlD67m2mYdUz+2owNNxNXtl8eVaL9V5nInyew+Iy+YlMuONz7m?=
 =?us-ascii?Q?r+VoYbVBbsExqv8hyuf2gnDd9SyYdvFu2fE3sviOnkW8PaFWnamCIoF1RKaT?=
 =?us-ascii?Q?LXYe5bf+nYhni8f+LteK4xkjQ53pqOTfo69/0/ctdkUUbtB50djuYPCUcZhY?=
 =?us-ascii?Q?Jq+bLqRlrPHLOEKczfyCm8XM21kE1iOiMKfsvewzWDS+E0kiG0naE1JLcGdx?=
 =?us-ascii?Q?PdrD9ydUj+sYyAeCHg/SjPIYyvJu1xu96gVC+0aWJeut3e+CqL+zdTlgqFx/?=
 =?us-ascii?Q?loX71+ysJfyvuQXdXfE/AQU0zqB8J65L28ctfzwGrsD4nvKpmUqAiZMbBgTJ?=
 =?us-ascii?Q?hYyOtyXRDrRkHmFInMlHgXXIP4DEL98ZvKjRbjumB6igkS3lGGZ6CSwBFrza?=
 =?us-ascii?Q?/BtUV4lb2MEnHFTRB+DXUP/qgCKg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jZU3F6Ym8S8iP06Kw0KRtdRsHEq1TQSU9Wg2CoyeJJW0yKIoC3vIMzmfQs7i?=
 =?us-ascii?Q?q9ZMCfZ/hNKFmpIhfOu8BaB1YBL2Op3JLJ0/93BWd6nKpqMhlDuo3PR7jA09?=
 =?us-ascii?Q?4rBFfoTrUpClbWR/OHKz60dXdqbk1+QCmjssYW0i661+j99iRj06+Kbt/e8J?=
 =?us-ascii?Q?HTSkjSbeQBMb59B1MJh1fA6AKjJd+aT8Go8Y1Z3Kp+hB77vY+54yriN1x+1q?=
 =?us-ascii?Q?NZQLqZ7WL/CDI59wkdFtS9wqN6Tg5X805WS5hMF30R10UoJQ2o1ajTHA5NfP?=
 =?us-ascii?Q?NRXjVb74aFO4rlCwpItAW06F8e1pXowPOdByTvvmnCWfDSwBRffcmBg8aHtc?=
 =?us-ascii?Q?jKQ+b5S5YwSUQBdY+/C61d0FH7qmskgt37kj3ZEbWdFIMBNMFn8h7ZTm/oZt?=
 =?us-ascii?Q?GzkN/+FhbNLy/BLtljhFFLPrSJs3IJfY9edWKcXLkI7W+pN6+WRmGs7Rm+5B?=
 =?us-ascii?Q?4mo9CbXueDVupLX7w3UnLHrBBMMyutzFSaaMcJ7g6xPxDcHJTq9lQ2BNFXF8?=
 =?us-ascii?Q?tk01utRLX1b7QHoADSQ0APgDfRFFD3wtFvAQ9BXEIXEpcoYPcyp53AWCOidx?=
 =?us-ascii?Q?+fSV9q5OmZo7ptRYSHE11KHdwYGdbzR+anVg13SNKw/LayFSmzAVZHSy4cSS?=
 =?us-ascii?Q?qIRtLIqWgarXmeWzvshh0glDpZhwKGuzR+fFs6q/2PT27sGqSkqtUG4fA2hj?=
 =?us-ascii?Q?jC/oIwqsFPqYsobGxVpG+lOAJL0UtlUL0EmoCp7cx9NVn7nc3/HFIPzT9WM0?=
 =?us-ascii?Q?ph33vrEnqtFp+qtYT2ytOLOxvuUFZ/wnAnV2skZfOgQ7JvAuCocOl5mUPf4b?=
 =?us-ascii?Q?eYOJF7Xn1MrWdtjjV98nUFQxXvJjOwxpKTbetAYQXHXqyuq+YwiREXZ8bmdL?=
 =?us-ascii?Q?XxbPovdTgAzVax5DCxebQPS00R1Ejeg5zOSjavCnqF3WD0AcfKpQHGWJQhuW?=
 =?us-ascii?Q?7vqmeEbhFNqFyOachQ1ZhTqPPKXuPtQijjd1/TBMofnpVlMNslcyGwRdLi3z?=
 =?us-ascii?Q?5bGlqBAS4QBnDoHe4Y/T66EhGJAPTpnl9nu5eQZGOJPL+FiPjgoXoeFzLbFg?=
 =?us-ascii?Q?Ekg92boN6sdWkHZShr5liKCQauV07W76xgZi95qD+tFcZLrvLqgQ+8LVYDru?=
 =?us-ascii?Q?FQCqKFVOYCdt7e2f4WQr3kmsNpOtDWsxFvnJJGeGfY5o+aBMHbxf0dupEgBx?=
 =?us-ascii?Q?9w+wiu4YhI0m7TaTDjQ3QMUjTcFSwPLRx+GmIvYavvnu4Dtj+w+SpBg9kGPS?=
 =?us-ascii?Q?uqNgXZz6AIWq2hDElJgj+DytG6lBX6wJcIoXZ2T5m3KAhYelWwvzLsNyNOYp?=
 =?us-ascii?Q?Ex7v6QkV4EXHKx4b6lyTf/V88hvdZkXWQ0//gideW5yMOLaWr0HQgHHdHBjw?=
 =?us-ascii?Q?7k6DMk+ZTINlQxGlfqUBEVTdqL8UIRMUhI16MMOf4siy5zPV/rbAzdGFQC7D?=
 =?us-ascii?Q?SntPo+nCfif47HpJsILqmZ2Mfykz2QF2mVQ08mE4EXTx4eojUvQCbDhcYWrS?=
 =?us-ascii?Q?KxdJ7HUM/ho9VtrFHbI/z0vqEQc/MhHx7B4P76Q/MSFbJhYVus/D16zEcmnf?=
 =?us-ascii?Q?haY72Ksu/+W7fXsbPPOKNtf+yENuOQcbBGrSv6bz5m+9XbJ4qnzFTFzmoKM5?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QEl5+J1i7c6DenOkaisvC1lrXkxpo18IQXzpR1VUj3N/Imh6X/9J2dOdHWxEMudnPeoh7i9KOLhg7NgqkTxqqHA0ekDbW6q8jSQSYH7Dx074Qh79C2t4fjC5zx26uA9FnKRcuN5v9fh5Ubfslv9O8NwscoQnMsG4uhnjKTtNArFHzqdzSmptsbMsXSs4r8EuMAhV1fq50rknrWVze16EtCRXq4eiHpoWrpHUe2b1YJlwTzzn4knooeHQpLBzcNCZ5B7uypFJFVVkt/KVjX9FKN1KC2sDyais7Ms2ZirnlQgi3jo7Fr/WJnHqNuonPpMD1CCG3ljH9CxHWa9tGtoOxD//bFIWHk6XxMjuFssTSmE7DILo3SOKNnxMaTpRNCrF46mUSBJ9+WE3uB+SMl6EHPKuofKdBXoLFR3VzN5pKZVY/k3lWlI2opgo+OGrng2fM1eA4Dr5e17YdzIgNB7WrnQfRWtwS+ziU3FAOhDtCvgsRNLDYha5nz2HGrQFXtnTnHMFmBfXWpp+7exC8u56eTysbRZIqHGLWRdisr/KJWo+9sQXUGn51YW192gxI1p3bBlQI/EfwZxVuqlY6X+WX/1eTMNaH9NxtH+YYlz7ho0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6869f3-3083-4ecd-ef77-08dd2e95b53c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 21:04:28.4110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FfLebNUQqOTwLSsD8NSfkAJNMYg8yTWwsmszH2BomsuftqhUiCKw7I15HM7YdiKJhPwXUjMcy98aPkpVPJftG1P5VY/4lFDhydCjNwDO1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060183
X-Proofpoint-GUID: GeRPIso3bKGZH7xHTq1Mnl32GTleUU16
X-Proofpoint-ORIG-GUID: GeRPIso3bKGZH7xHTq1Mnl32GTleUU16

On Thu, Dec 05, 2024 at 02:13:18PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In 83da884cbdc5 ("Preface usym/umod/uaddr with pid"), a bug was fixed
> in which addresses in the same module (or function) might be mapped to
> multiple agg entries.  This fix helped the associated tests run much
> more successfully.  Nonetheless, tests would sometimes still fail.
> 
> Another problem is that the tests themselves were overly narrow.  It
> is fine for a module (or function) to appear multiple times in the
> aggregation output... if those entries correspond to different pids.
> 
> Further, odd behaviors can result for some of the processes running on
> a system.
> 
> Change the tests to add a "pid" agg key.  Filter on only a few, select
> pids.  Distinguish agg entries by pid.
> 
> There are still occasional time outs observed with these tests,
> presumably because the tick-2s probe is not firing (when profile-1234hz
> is running).
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/profile-n/tst.ufunc.sh | 12 ++++++++----
>  test/unittest/profile-n/tst.umod.sh  | 11 ++++++++---
>  test/unittest/profile-n/tst.usym.sh  | 11 ++++++++---
>  3 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
> index 243822407..f5174a1e2 100755
> --- a/test/unittest/profile-n/tst.ufunc.sh
> +++ b/test/unittest/profile-n/tst.ufunc.sh
> @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_ufunc.$$
>  script()
>  {
>  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> +	BEGIN
> +	{
> +		printf("dtrace is %d\n", \$pid);
> +	}
>  	profile-1234hz
>  	/arg1 != 0/
>  	{
> -		@[ufunc(arg1)] = count();
> +		@[ufunc(arg1), pid] = count();
>  	}
>  
>  	tick-2s
> @@ -52,9 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
>  	status=1
>  fi
>  
> -# Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
> -if gawk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
> -     sort | uniq -c | grep -qv " 1 "; then
> +# Check that functions are unique for each pid that interests us.
> +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>  	echo ERROR: duplicate ufunc
>  	status=1
>  fi
> diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
> index 45d2b1e9b..7cfe2a073 100755
> --- a/test/unittest/profile-n/tst.umod.sh
> +++ b/test/unittest/profile-n/tst.umod.sh
> @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_umod.$$
>  script()
>  {
>  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> +	BEGIN
> +	{
> +		printf("dtrace is %d\n", \$pid);
> +	}
>  	profile-1234hz
>  	/arg1 != 0/
>  	{
> -		@[umod(arg1)] = count();
> +		@[umod(arg1), pid] = count();
>  	}
>  
>  	tick-2s
> @@ -52,8 +56,9 @@ if ! grep -wq 'bash' $tmpfile; then
>  	status=1
>  fi
>  
> -# Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
> -if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> +# Check that modules are unique for each pid that interests us.
> +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>  	echo ERROR: duplicate umod
>  	status=1
>  fi
> diff --git a/test/unittest/profile-n/tst.usym.sh b/test/unittest/profile-n/tst.usym.sh
> index 634e633b3..8e373b976 100755
> --- a/test/unittest/profile-n/tst.usym.sh
> +++ b/test/unittest/profile-n/tst.usym.sh
> @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_usym.$$
>  script()
>  {
>  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> +	BEGIN
> +	{
> +		printf("dtrace is %d\n", \$pid);
> +	}
>  	profile-1234hz
>  	/arg1 != 0/
>  	{
> -		@[usym(arg1)] = count();
> +		@[usym(arg1), pid] = count();
>  	}
>  
>  	tick-2s
> @@ -52,8 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
>  	status=1
>  fi
>  
> -# Check that symbols are unique.  (Exclude shared libraries and unresolved addresses.)
> -if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> +# Check that symbols are unique for each pid that interests us.
> +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
>  	echo ERROR: duplicate usym
>  	status=1
>  fi
> -- 
> 2.43.5
> 
