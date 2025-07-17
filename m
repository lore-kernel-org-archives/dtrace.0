Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAA2556E
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 04:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752728355; cv=fail; b=GXAGj/aum24IHPp3xQp9nRae0gxhd5YWPEIuueJ+aDmhwxsm+3VEzMWDv81EDuyRLQa7nF4f4H14cxyyDlypFlAlZA1INkF+lrnVlWD8+rBpD7wf9lULqx6G0XBz025nfN5dhOA6j+6yFEY202uJXteqk8oAW1wQOXHwa9VuOFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752728355; c=relaxed/simple;
	bh=mjCkztrP86TkkR9AYYS8Nbb3RZfnheZWTPhPbRHmEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lrewou4GVJrbpIidrwI8nGWG8Vy6+MySbwGs6bOiMI3veqAoIu8+zlbbkXFGTss4/CmNq7XOWiVe9EBmP7h7hByeEc3S/Y6BahhDqowPCVlQ8QxlbsSfreNUZRHDDjjVhjo31/AMn1RrVLDAbt1zrbIUCxCrpLF+stC/Ay4Djw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lW7ZEBXA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GZIpH1tQ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lW7ZEBXA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GZIpH1tQ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GLhkJT006637
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 04:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2svRP9JbS+tpy9KXUE4pHy62Od4hWVyGlaprpSxHb1M=; b=
	lW7ZEBXAWarOIwQmUbvbyOa98fristGqE+CLZLsOgJladdw5VdWlZCnNL7M9kDgc
	ZnGZ+TBlPsTgATV9qN/s346VJguQjzdRgCvCNg7YsVzU7G4pyP+fKDffsGt0mbdI
	Aff5I8VwAf3hKPM+v4Y56VQWQJm3I66GOBb3+L2AHaahsqRlwQ4Sf3+o7asIwBT+
	ZjFNw6Tom1ETHP2PexmYtU/Jt5DlOB1W+7YOhFDo7zv8TvevEwZ0s6LcYbvQbYNP
	UAn9feaX8pm1gjsyV21hbBhp2TJb1R8a8orGPvhtysYqDDVIB3OqqG1UEt9OpSAd
	EDYcsG51TgGYtIvZfEtsJg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujr1246q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 04:59:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56H42lZG013035
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 04:59:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bqkv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 04:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSfekC4YxDme6Wu+fUdfbrwpkle+oatAioK2Nha06FR3R4yC9yWlkEmY/xUGt0jEy8H51iEVTaDGPVcAx0IwgpHCq+dffLsTYIVDwKZAGIXm3SfirFiUj9OHFcTag3B2aT10O4EpKTClpsr09Y90kT7mBqsf436yAHXeADEzJPkjI/2i9Dr+QpY84diQGDRDz+MU9KtbtVjgDfZqpcRijHpUuEnT3BZ3B2KW5+LEZtkVRnNwK5cH6SGQoeHb+DKdz6fx0kJ9al3TBDdXM7rdh1YlsErDNjILI5/GlaaxmMcif1tnJi+DaJ8FciPBm+1nRIkadJpG+lwUDk0uQSoFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCXtnx/s8dvgq52JqT7N9OPX0+HDrsPBSm8ZAvaIlRc=;
 b=I4ll6AKK8QZM3ahJYwT+TvUtBf435J2/PSvAHNXbvu8zlhu4OwY3u+naQuPrWWHRqWq4f1WRqgG6NIj1BOCLNwZHnGpHUfue+FunDJ+Rz/Ta0A/hjT4XkgVLVy9Ci71rAAsnRnwF0Lt3xJaGR70LSBM7H6PmCeDXvfjxxuqpyMTvqOrjULssEOSeuzs80iIVhiLPf5S14FGUSDCpQCF3FtQN1JSQA+hDsiU9/GnMCx9eqZrmPCPkOyJ0qKQausXftWx1usZKATmL3pU5Xzl/bGHyY9tGRSbFHkxDjGLwrY7+LMntY05cx88Rf3sK1QEzZBhHxTT9D/qIescoJvR3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCXtnx/s8dvgq52JqT7N9OPX0+HDrsPBSm8ZAvaIlRc=;
 b=GZIpH1tQ7oIiI8irmCEXveNReKra58dxRqE8XhAXhGAntULp5vj7FK24wTn7TcTQTPvBPjhbeJDgcpdw8q3XrBJkQs702cdL0Qx3AqrWPzjwhrJzODrbXR8fs0EqJiEquJU0leJo6CGBPON4tvyw1RjpxB40Vug9KtnQFTjchB8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB5183.namprd10.prod.outlook.com (2603:10b6:5:3a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 04:59:08 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 04:59:08 +0000
Date: Thu, 17 Jul 2025 00:59:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] cg: validate tstring alloc/free
Message-ID: <aHiDGZJuyo/aKr2T@oracle.com>
References: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
 <529c8de5-2eaa-6bbd-1dfb-392ab4d4a4d0@oracle.com>
 <aHhCUiaKDLU9CHEk@oracle.com>
 <9fe85ab0-3a7d-626c-b382-0392c55e7502@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fe85ab0-3a7d-626c-b382-0392c55e7502@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fcb2c3-49f2-46ca-8c8d-08ddc4eea962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?U64N2Lltr1L4l2xL6EVoo99rHG9668jkuCzMAkF6TZZ4rhurozPqAr1TJL?=
 =?iso-8859-1?Q?ywbWcZ5NRX98MzTfBi4kShiTxNts4H/I/VTFFc3Bli9QvC0zLZJnQ+PYQu?=
 =?iso-8859-1?Q?qdfagGV9llvZiTQgkZzchWlUpAFYGy0FN3VIQKdjQNU7kdT6LRvLiy13WJ?=
 =?iso-8859-1?Q?juRYLo8CjUnJeIAsODeCfamvsCYvrbjSgOfk4LyNHt7AOjSIjAbrLM+jp6?=
 =?iso-8859-1?Q?tIdJMQyh5k3Ket8r2boyBmUl1wq/7UKCV0Dqb6p7c+WBUIeo/4gFaTqCR3?=
 =?iso-8859-1?Q?UF/fedeM5Sylr7AJVnhkUot6Mee6N24EnC+BJORvbn97MiTKIOOyo40eyI?=
 =?iso-8859-1?Q?X5Y8EX/+K1pZVsOPq7qyZxJJVzHcvho9nqdlC0AZSkTMNekmWA2kp0ALtb?=
 =?iso-8859-1?Q?LgsWV/Cbp4VbYS6qWJ/7y/4dpLgKgetCkO8Hl4gHS/zzwuQx+YEj1eQDIp?=
 =?iso-8859-1?Q?A//HexKzvB5pdrCwEN8GR5e14DMyLqP2YXaMV5IzNexRmNtNVVvriGvVdh?=
 =?iso-8859-1?Q?Sqk5FXThEw/e3KRgvll/A2MhgXbeT3W45iIeEseZOJixvdsx10nJED5tMI?=
 =?iso-8859-1?Q?5uGWyrbNjqV+9BgVUN9W71bD6G3XwuPG6riUHDegLi8q04Qv8/18tqc887?=
 =?iso-8859-1?Q?XBY5/PAy2jx2jnV+Kh0OdzWFaIi06CMAkXBNMOZVShuVTeSOi6bSOc+WA2?=
 =?iso-8859-1?Q?o7HTXiUZuweKcsQGW96vPfJCztiLz3GDID0ViplXIoecjZ/bwMgoY+usi+?=
 =?iso-8859-1?Q?Dl+0pAkMUGsbFaUVkWd9a5vm/1/ktMTa5LQaGOyeEVrcpJFxdvU8wviOXN?=
 =?iso-8859-1?Q?ucJ5Mo9pxeQIGyToSUWnbgfqa3UtfiKNWJ4P9TraEJpB3Q98NnVUtlrN9i?=
 =?iso-8859-1?Q?tJ3owYU9JMLU3SaYSZY8UKOaL9UrswNI7OsR46TEy1FYlGfTeSrnunkDfY?=
 =?iso-8859-1?Q?HD3wEUO0lGEbwvkNmDojEEdh5lhqIEAdH45+MdCcZ4hBwpcpvaDVKP88Wk?=
 =?iso-8859-1?Q?0I7XGo7davessWij+uVfwc7eJ4eoQQwO3tx2HlTt+YsciWJytzJRFiX4Bg?=
 =?iso-8859-1?Q?yk26IuYZP1xq+IiwPbexg3Fs1jnBfCQtzXKxnt6fKPGjwbJX8mzLQsjwzf?=
 =?iso-8859-1?Q?253YXkmgLagu8k6vBfa1yC+5rUjM7K8Yz27VPi/bKUpp/klEFSXw6e6qDC?=
 =?iso-8859-1?Q?rHNYdUIOzy4YAJ6/uRul/adiyCLLCtQB55iC0z10FrW8/lqK/sNkwtOGU2?=
 =?iso-8859-1?Q?yWesO7z+l5gv3fbM+kdDF5ssEGTyFlaWeXm3siF3bPb4c1S46ebfq1UPgg?=
 =?iso-8859-1?Q?dT5H8bC91JFasBem6tT1yXdKfr21vzULzBuUgw9iff9b6Ub2LucF5367Kz?=
 =?iso-8859-1?Q?oLlGUqvmCROAOP0sbRB8ADDQlMMLLL3Bf0Vua8KaiAsK9ZDad5u04TdI7I?=
 =?iso-8859-1?Q?Gvjp8fUtc6iO1av9566lyFFOHitCUV/6woY6PgGmHLdA9OcoQ/uDHQnnRS?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?d46nN8gIBXByFjjCaamf+2GH2vSdSp6V7fF9R3SstdT9Ji3k53pH65nZNn?=
 =?iso-8859-1?Q?++Jfdkp5KCtkb++Hgbze/tui3HBZKAYDwEUO7349xiaJGfVTHWAZyge324?=
 =?iso-8859-1?Q?7h2j2j93Gx/Aywns/hqbsPCCJDh2Ptn9UwbV60PiPZmvogJz3uuNsIX5lw?=
 =?iso-8859-1?Q?ClmZrnvTOaDA76Y6iNc8bMfBhFn80hAF0IHmdohkNBn3rAkarsf5a55RVg?=
 =?iso-8859-1?Q?9yD/qjnOd82hzWYVr9rB6T3xKGA/FtKoiqKCTTfv48MKBWLgMywG8+kCXA?=
 =?iso-8859-1?Q?omQJVLfW8HaKSAOkw2Mjlrb6Xh/rWIF3sd7sGb9QbUlGFLGFB7skXBya/F?=
 =?iso-8859-1?Q?Qm3SFhJbjYMDeMJF+YvNrq5UCaozqtX+JRIaJu/s/ntV9iFxHIxrHc/8T2?=
 =?iso-8859-1?Q?yUTt4uapHtrQgcX4hWY1ssChX53XHFbJrsWh+OM1bOJjKQv/zKWttc4zbz?=
 =?iso-8859-1?Q?SJjQ7S7LTFT/NtoupdLSRoQO1KyuQwt5zB9cs1rt4/99LmVWPSrL2dDDl+?=
 =?iso-8859-1?Q?uYeRrJToJwjHi/+qVSKuyheOHJ/cAEhgwZVbwhuVXsc4mx+wBhp59bp11U?=
 =?iso-8859-1?Q?yDGE5ByS1rfc02o2C2JgFursxRBxJSC/rVPdm3oua5vnIfm9VIT1/bamfb?=
 =?iso-8859-1?Q?qmdcMualFQjIe6G1XSmYYg72+xrpDdZ0OzGhmQHc+MSf2Waf/EpnQMIjL0?=
 =?iso-8859-1?Q?LADpY4mueQH9UjHYQp6s1LUo/2s7IoREhdbW5Gd9Y4gwCRytS/JrtzPV7T?=
 =?iso-8859-1?Q?Z2Wz7AbYXDDgQdDBbIEpJlto8vcgGYUC1rlIqCESphCvZGy7RsrlVx7yF8?=
 =?iso-8859-1?Q?QrEiA/f/ZAF5UxZQnQxw6c4rGfY8gq6TmilSANGKsIi0+QOm9XJHB6VdyI?=
 =?iso-8859-1?Q?u5alF57wVKg3CHx7msYGqvK4/hkOFdtSEdjBkX+fK+1elFYT6gThTTpyJ5?=
 =?iso-8859-1?Q?gdQzRWTOhKTvVPQ6MyttPl4ClVyvdnnNcmLplG3iYt44bkxfFAwb3L1kKl?=
 =?iso-8859-1?Q?1iuIsO/FY03PxUj/GzYzhPsjq0UCntP/aBhDwD+ueJqbbWVTTBlp0u4wOa?=
 =?iso-8859-1?Q?Lu1E42namuc+Uu7Yqzj/3qSJ4wbd3EZa6jN8FgL96t78iK2f5Pbmiw/yaF?=
 =?iso-8859-1?Q?8RtfITGo95z1haMbm+wkTl+mou8jFR8i2ydbKLppT9pTx4V2d9Ru2M2xB1?=
 =?iso-8859-1?Q?Lo4rcb+gHV13/xt0grq0oOnAZnyWeHxuCECjSOr5j5hxhrI3KI+buOlFTv?=
 =?iso-8859-1?Q?m8aYP2OMFSCcGj6DsOnrKhKQbeDDATdpsuoFH4X4A8hiuafXdl7nDL/3pm?=
 =?iso-8859-1?Q?pnl81OM+/DRcfSFIhsCTdhs9b2GrTZ8ILYcKkoz82CYrvsjuOwGRvoNYrC?=
 =?iso-8859-1?Q?gT8uakNQAIWRcyQ5T/Qx4odOlu57Rlu9fBlTXGUDc2kczIBh9FNZ2MovoQ?=
 =?iso-8859-1?Q?GUYI5XQUZWm6Y4Km7UJ5OpOI4yz2rkAPSBx2i6Hf9W1+OyNF01vWsKXqde?=
 =?iso-8859-1?Q?2lj9kum5/vzLq8jCLEIPFFm46KgrjYcSJ9ueseBwnxwME7sUO5wMyCK3Ca?=
 =?iso-8859-1?Q?u2VXfybbNh3vrsWmeDYatfQOe9lzrgCP38sfeA9xzbW+wp/wR1gLr8neSb?=
 =?iso-8859-1?Q?yLfho4AysXP2tZucSVLbTm/y6PKwUIxVJ9m5jUrwZdZUhqzipTxc8dQQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	blX1ufZxqANCaenR7u+hQZ/kQIZ2QgMsvH9P6yrb/aLiEOKLdPrHFk07Lk1SEt7RnMFDOW5yIfggNDAz5ANvBv/LsfH1RzokLM0UshcYybLyTOFg66ztaTIvvT74mjc3nDRRzY22Ed3l6msvs7sqKrgUJ6UZJaGbPIm+3yO8aULCbcXHbvJVjWyZFwXn3nJT/rOiAH8GBsEgTR/nPkD43fTM7hM8DZne9qFd84YLykyehyV7LsAX1fG1StHsxuoREebF7mnpdRfPHiDC7Sq17XGB/V+MT76JlS3qQVAkF38F4Dy9g0L1MH/+DZX4DMfeyL4G0jI3iocDoPUKkMKUBISr/h8n4gDHnOvmbyuiaCeKqnmIA7P6aA956BhxDs0IEDBkTM1731NeR+4iTKQ+3Bkjkb5FxbOrVPFcm7WIoNn06kjkssHfJB8h8/KgE4j1atB/wxg0hsAFX3PF3IQan8ad8l0fCh5rnB5hulbu8HAArNL0Xz8isc6TE877DOpo4LHQaS1PUVVmnuiwqB5iXe6JLoXEU1PRniBInJ6EYOY7mroMFnWDCwNTuvPv+iUGDjqM0m0yOYOdDSIH65cvMtNH1ZJc2hvpV16UtILWA5M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fcb2c3-49f2-46ca-8c8d-08ddc4eea962
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 04:59:08.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5LAqnF0F0wLbrmrDPPa0WArj4Z+dVIY1IQjyTe6l6Dr80XLzwMxgtsPDxkSMiH2cpgvlc4LaS/OgPdHdONmLkS0bGedyKVQAuxaxTiEKuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5183
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507170041
X-Authority-Analysis: v=2.4 cv=d9T1yQjE c=1 sm=1 tr=0 ts=6878831f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=eSwu8nQObvILW4e7I0IA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: u0weL0l4ugAgYMgUhJQA8_eliJ-dKX5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA0MSBTYWx0ZWRfXwKx1q2CeaWJb 8x5GuUm8qNOMan98zCncdAmHkK277i/lDTk7zACaa3fmYzfs92JYTMfQqk6rZc1gf470nuhMA5P pZxGMHbG5rQ8zOwIXqIKVdlDcSIgJrjXpp7TSVczj/uoG38QWZ4UiTNo7Ydg+7BbnvDBiVHOxb3
 QoNzrSyq2sUIoXTJPdvHUqE7atbGfcw3k/HhfRbSBZ714cWzBqGnwwHyD2dbV4+PfXqw7dI++Zh Ty3LfSdOM6JsS8SqMffUtLKUlpOIxrXVBG8YGYOvITVEq6HgCqV3/yfvC6McL5GKctpPZCFE5Af EgUPceDyKaS7m5V9M68D11osusDcZa7/rmc4odyaUTMSEqHSAb/k7aACQQX+vd/2WHEwRBstob3
 Hv9Ci2eIHUofLzYgcWTwbqmny6/JXv5vcBkWlPLo9rJRqTEJEtdhm6p6/r6sULs1FhbuWged
X-Proofpoint-GUID: u0weL0l4ugAgYMgUhJQA8_eliJ-dKX5q

On Wed, Jul 16, 2025 at 08:45:19PM -0400, Eugene Loh wrote:
> On 7/16/25 20:22, Kris Van Hees wrote:
> 
> > On Wed, Jul 16, 2025 at 07:07:59PM -0400, Eugene Loh wrote:
> > > I was a little concerned about this patch, but also wanted to expedite
> > > review.  FWIW, testing shows
> > > 
> > > test/unittest/builtinvar/tst.psinfo-bug21974606.d:
> > > test/unittest/builtinvar/tst.psinfo-bug22561297.d:
> > > test/unittest/builtinvar/tst.psinfo.d:
> > > test/unittest/builtinvar/tst.psinfo1.d:
> > > test/unittest/fbtprovider/tst.entryargs2.sh:
> > > test/unittest/funcs/copyinstr/tst.copyinstr-high-maxsize.d:
> > > test/unittest/funcs/copyinstr/tst.copyinstr-low-maxsize.d:
> > > test/unittest/funcs/copyinstr/tst.copyinstr-no-maxsize.d:
> > > test/unittest/funcs/copyinstr/tst.copyinstr.d:
> > > test/unittest/proc/tst.exec.sh:
> > > test/unittest/proc/tst.execfail.ENOENT.sh:
> > > test/unittest/proc/tst.execfail.sh:
> > > test/unittest/proc/tst.pr_psargs.d:
> > > test/unittest/proc/tst.pr_psargs_other_task.d:
> > > test/unittest/usdt/tst.argmap-typed-partial.d:
> > > test/unittest/usdt/tst.argmap-typed.d:
> > > test/unittest/variables/bvar/tst.execargs.d:
> > > test/demo/spec/specopen.d:
> > > 
> > > test/unittest/dif/bcopy.d:
> > > 
> > > failing on every VM.  (Well, bcopy is listed separately since we skip it on
> > > ARM.)  I'll try to put together a patch, but let me know if you already knew
> > > about this and have a fix.
> > I am looking into it as well.  Clearly, this patch is catching issues as
> > expected.
> 
> I guess, but those issues should be fixed before the patch is applied?  I'll
> move onto something else unless you think it's a good idea for two of us to
> be looking at this at once.  I do not understand, though, why we check if
> dnp->dn_kind is DT_NODE_FUNC or DT_NODE_OP1 or DT_NODE_OP2 or DT_NODE_OP3 or
> DT_NODE_DEXPR.

They are being fixed before it is applied.  In fact, all but 1 are now fixed.
Patch comes tomorrow sometim after I am not overheating anymore.
