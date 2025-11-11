Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047F277C86
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762899191; cv=fail; b=rrPGv8ZC+hbqXF4YC7LyR09H5vdal2/gEqr6Pwss1ovclRupcHU3Racf1hSSg+TbQmrwzXdgv9k4dJr+5hXEHfyz0ODbu2VIyj5z4kv5p8dLbCfMbNGe3reezfR3BrwO6MYn6j4MuMJAOyGPjHoO6a7LoFnwPzAkCXUgzHhJPKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762899191; c=relaxed/simple;
	bh=B6JHd2P1nbgdp1rSPWVqwmglFxfpP+IrDhIf1mIbT3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WbR/etGckkPibuvQB6ik7lDuKSoBivQsxWnq81Mjv7qelexbnymaDdWH5DbuaopSxYp19sKPLMT2o4fTDcHKRzaTFCqAhV6Zs3C/520y89+QOXDpWT1bvaKmtsv/p7u+cKhr8DWCQqe+f0mMgCanmL1gCrpXQUfLddYb4Iho3V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nNOcUNe9; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=heFRwxiw reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nNOcUNe9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="heFRwxiw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABLwH31026666
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=stxbu02e5fO65215QcP4ZK4m92aJNpkso3lhY7IxitA=; b=
	nNOcUNe9Inrzo+X0VY+/KexApGe7mdNGFmS9VhPwfyvbFCKgguURI58x29FsjO3E
	hL2z16whx99WrInDK1c9ugiODN81KQnKOSeQBJS8jlYMqbdJUBhVhWxBCw8nibAf
	TgfXzMPGVgvi9YgGTN8j6YbNM2Jt3LY49vfgkl7Ax7XDi+MjTcBzCNVhl/tJeFP8
	zLKvjq8gN2XlWl+5eHqniZL3/GH0bo9OQ+NNYP/z3KUbYGN9v92pN/PRNjykxCi1
	o5u5fCUIA6TBTL+JUXnigi+8OlRhsxrY103ZD022wYZpsRjYucezXT/DCrmXY7Jv
	0s+GmdZkzmc3x15PDhpLWA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acbgjr7r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:13:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABJaWFZ012621
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:13:07 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vadg3nd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:13:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBdtUAXDhSL6LdMHOpgtONvl8kT2xb4EvQX7ckxY1OIKar7i+ecR5ignMT9qg0g6eH/Tbbkjw7xWSXBEhOxxLc41njYTxjf/7aCXoILxqgSI6/ObFd2e9uTeoZlEt+WkfVq1xIiJTtRpGl7tWqnZxetdx5edkwAO6hgxLc5SkjDCUOhLOk7FhC50TqeaXpwvCNTwjcp8mdjbdKC9XtBUgn7bB7fV059Zbih5tRFyePMAm+aj/8Rux9A7fifsRp5pm/GtCVTzDIKd3ywI60zn4A2MB94PiQO/aElV7yAexSQZlh7VIEKIMF4IOXEnb31PDCOyD1CEGfuinF2ZfjRKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joM34QU6xIHYiodNVam463JXxMSFRubLFs6Gnkh2t+Y=;
 b=Mxi7ygqaFPkv/9TPsXAM/Urjj6/l6K2/X2cqM0sm9Ls0XhF431ytkY2BgkG5HL2ayssgN0Iu7AME2lkbd4XxNfeCyfkZYfbF9qXqirvTixhwQQ2Y9kNM30faq7QXyYo/zdobSrT9wXibw9x3xdI6HNe9pI62ZtHeMzxMdrZFXLCmCILWlUnFOthK92y0I4bKDvv8knsn93Pu2FvfiFnzI7qJA5giTbiKuECATeCzYDEY7EE23JhyvInPccoMjGNJe6Z7+PJ+h1eB9/iu/L8phkASsJ4f7xcJwpC6c2OWypRJPGsM/wZiu59DlsPHwqiBj8CPKkmsejHaPEcglCPq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joM34QU6xIHYiodNVam463JXxMSFRubLFs6Gnkh2t+Y=;
 b=heFRwxiwFPNTY/DUB4Mj+RFZXll51L84IpuTQEINvrQh/yY9bmEbYlHGkZ0o1CE2Lf4TveVU3cRKCV9VplBUyfLRjNgkJy+Q1P2xpnbn6O5uKdbdH4ViICTBGiRCReRmy4m39OqrAPrwm3jBIiuJvegNMg1QYA3awGMPpVPHcK4=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SN7PR10MB7101.namprd10.prod.outlook.com (2603:10b6:806:34a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 22:13:04 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 22:13:03 +0000
Date: Tue, 11 Nov 2025 17:13:00 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Message-ID: <aRO07LKhWrmbhHEM@oracle.com>
References: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
 <aRKmvyBLFPNRYOM3@oracle.com>
 <67df532b-f980-5ec0-ce0f-998d524829d8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67df532b-f980-5ec0-ce0f-998d524829d8@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SN7PR10MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 41387873-79ad-4be0-4e84-08de216f7be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?lVwBgMY8vwxWjFNAvcmMZW+9xo1BBrZc8wRESWtvqALzqx2pWeH0Z+9CPJ?=
 =?iso-8859-1?Q?um+uDo4hkCLoayLomUUiwKcaezzK5wKvHAjBnMcyEIVfnZhIn6jq1JheF+?=
 =?iso-8859-1?Q?0PMa5WhjLNk+Yk8A40acioGA6v+MCIjGT4/qGVquZ+knklPT3kJY3QnSbe?=
 =?iso-8859-1?Q?GUgVNUzUcZsh/DtmHeVoYN0oIvs7NC9NC8NXWimD5AVYltOAZ7N5zIAlAV?=
 =?iso-8859-1?Q?GjqeumNd+dzuxbdpusgSsoYir/ezZoooggd9gT1CFptQIfTp+kgVhFrGBR?=
 =?iso-8859-1?Q?gEicATEmRmkuQqi+0I/Q8IqBvGxJzO71K+jaHHWaRQ/5hhGelYtBArBBMm?=
 =?iso-8859-1?Q?JxRbf94oe2yoQQqq26lrp2OlINGpZrVoqCIn8KUPggapz0c8+MCi2b12jd?=
 =?iso-8859-1?Q?gBV1x8f2VMN8k0yZQWmkTLJ5k1ipsXKdEcc40SVJv+MzLBcJHetIiuPItC?=
 =?iso-8859-1?Q?geZMOOb1t2oDPz20UJLDc2vS9oNoWo4AcU8TE6eRHwqldT6x6XqqYsw/+X?=
 =?iso-8859-1?Q?s9sDWJdqmRvVbTeM5rcqUih3PBrbsD1577msl7lg7iUNUPjqm+olCpAPrg?=
 =?iso-8859-1?Q?ZYVq7hZlAcu/lJztZ7S8GVddSdgUqgWkxTKJ7k7olfqRhhXzhuUGj8r+gC?=
 =?iso-8859-1?Q?h5oxrVjzCit9T/MQb4N0rycsV7NIvoYdLyK5I25V0qqoyPu3npyCT5CGO2?=
 =?iso-8859-1?Q?V+u+g8o3z0s/FMelgeDVgUygKRp17xu2JM5R+Gs5CRGrsxVb1Ay6GfG0fb?=
 =?iso-8859-1?Q?S9DJZU/cgcQoTzpFD2UpifZyTzOwVU0UWXv1Ho2hsejhRul2Zj63nBC8/8?=
 =?iso-8859-1?Q?rcj9LBjapHsF6guY4Uh8gor1DlbkycxdHxUREBcfHw+79RcUMZXrz2dslI?=
 =?iso-8859-1?Q?6droCXeM4RF3H/A0SBOcxXGPqVdt1ovu7d+aXL2Rn9DPHs23Vga0vFOb9O?=
 =?iso-8859-1?Q?4rTsIu7jqNltv7J4uI2Ri1P0toXgxUjSSbUDyjcIdG2pBiFDlt+TwCumxq?=
 =?iso-8859-1?Q?eI2MokAl51W8/pMkObLjl816jj4At0Urnf79UKBq+gJ92RT3el2vxfpGbv?=
 =?iso-8859-1?Q?XghE12QolKhtTYkQr53mv9tJ8pVC7TMDv3ezoBOWsOtPTa1C8m3Ed0Ze6o?=
 =?iso-8859-1?Q?6oJv7y/AHlshjgQRtVz3nmOG36nf1bWVCdi2rnKZm+Ntx+CX3qbWaJG80z?=
 =?iso-8859-1?Q?hOat7TWFDS+ossy7h3oOEwf7qUV0iGPjDVDI8977ivMLxR1e8YpKv6hRKx?=
 =?iso-8859-1?Q?Yd/jyDfb8i9eYEkpiQMisS6tz2oNFhmOAArIIC/+FxgpclzeyDDJFnpzSx?=
 =?iso-8859-1?Q?qkLZkugtXZ3wEIZ+puqr84MzfI2zD6KsqXTMiGHpAhK8rdbSdHBGEEV2ql?=
 =?iso-8859-1?Q?OxO5CwnMvcAdlo/91gfc7WO8HtVjURXVXB8Gb4452R08ipo2sLv777SbMN?=
 =?iso-8859-1?Q?7UKY3AW/Wl6RG+jUe/IsIua8X2ZuxJEeJIUs9LEJvM3eE2Q73FXcsBxzkS?=
 =?iso-8859-1?Q?RZt51N/5i52gC0yUIdBFwR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?OR7NTLc7n4I8uhBFoBpCOO0Y3Ki0J9QaYAtyiZoBVBokmDaYfA+kysvLS5?=
 =?iso-8859-1?Q?Fz8E/JOPaMoc281Lhxci2s20M6W0ELNnS5tTEGME4HCAU7wXUwxzvCIRIi?=
 =?iso-8859-1?Q?AL6jgiF+CyQlUSU/Eo/cnflWF9Tl3gwFrklnQx+OMTD8fSCoWYy8yETVZP?=
 =?iso-8859-1?Q?JKmKa6cebe0uBYMmZFhrRgOgw1tCgH7e0qolwTSFZRgE9t/bqIraXHOdyx?=
 =?iso-8859-1?Q?MLW/glMQt3K4UM4Q3iwEunKK8b/+pIW1k9HbhDJIFo/kJDOgYOUaKsp6dm?=
 =?iso-8859-1?Q?sRjfsyxsqtveDhdeTtZTuhQmfHwlgzfBqEGewTJj3pBQ/GfkRiAWFepkMr?=
 =?iso-8859-1?Q?+szjpcbZDvwsrM5LavZ4fqWaJ+5x3We63eNtlm7KmONGvk1ULnUQ6b6BeN?=
 =?iso-8859-1?Q?nmUIkxBlT1KOJ2ra2tUso8o71pR5PxSMycvU8v5MRxQW7+p6nKcH9du+KM?=
 =?iso-8859-1?Q?+Yw73IPHka35bbxh36Caql0hmniu87SaieS5wusA0sCd2ig1W+/DHCtlfK?=
 =?iso-8859-1?Q?iEOJUSxrPrVkqkIYBhBB1Ksw45Pm+aQU8Zvw8kw+h9JgjGj4YlFG+ELr2q?=
 =?iso-8859-1?Q?2YAjmqpX+2sSDYXx/QK7M9t9AYMDG+WcR5PmgGKHSHlC5nvrL1IwVBpSwE?=
 =?iso-8859-1?Q?FEgBXHDZdPm+658BMrW7hm2E4HLzAZlPYgmMMy1qlvEuiB9OeNGyqmn6Xz?=
 =?iso-8859-1?Q?PHDTlYBXUGydzjn5xgDvGPk+7EFS/8z0QNtU3A2IeuVZP/uHEgKQR7B5z+?=
 =?iso-8859-1?Q?TGrRG0I0c1GPXtd6L5ZNaPNeCTes29ZxLejpLooJi8JhiA2foDgW6s1oO+?=
 =?iso-8859-1?Q?G/6KuRo1DJ2XLIfrF0V/lE912Jmr5FTR+uSaWXthtf9Po9ezhonjlW2AKE?=
 =?iso-8859-1?Q?jN2T890s6Zs8Q7gXw5XnEZZFUidyV6as6mOkHxxXpi+qjUucM52oroErvA?=
 =?iso-8859-1?Q?DgzxEkEuTv8yez6Q0xaJqxUgg4NM30SUCGp0/jeg2Pqji7C/IhtDT1rOkn?=
 =?iso-8859-1?Q?eZGGn4p/OjSzVAU7x/24T0aYS8UwVipS2R+Gn/iOq9OhNXIuzB6WDXMl7D?=
 =?iso-8859-1?Q?9r7pZ4R5CaKn66Yq5XIo7ADM2/sT0ULW8ym9LVhL/HSLgHyQ1WYUXEiGWG?=
 =?iso-8859-1?Q?m2xghg+0y/4YjypOxX/DbNGcAeT9lKDvqJKrWoAkxi26FqhYFkAAOTv/nr?=
 =?iso-8859-1?Q?YT1qKT87JzVJ9JN3/BhNNIMjHUkWVe0JpRFa0bQXkPzQ5QemIuvpEgFVBK?=
 =?iso-8859-1?Q?Hvac6GxKsjqJJTQgcQKD49jepyqEJrv/6uG7SbVRlEU3H4s/aUyilU7Qj8?=
 =?iso-8859-1?Q?p1oZWIqxnoksjnvj63kgE4eI8XZCEXUDTYaVCunEm63g6IAFLGz5SmmIEu?=
 =?iso-8859-1?Q?Awx8zlxs7V6Cnyp4YsmaxdCSU/XWBQOL1cfYRZh8fWqMSAd98HKPZFO8PQ?=
 =?iso-8859-1?Q?47lTNVxeN9cCnmNsMBOA8mNaGYqBwzUo2oVqQotlesSa1gapNDd2VMirJz?=
 =?iso-8859-1?Q?0PuSrtcQRcYIGbXUJey/J0Id+SnIHTwpyfOZol6FZzfjnYJT17s4/9fo/5?=
 =?iso-8859-1?Q?JXQdkiD+B0hM2mZ6LGwULvS13rzDEK24OSkAdLTrUJNRTonpvWtdJ6c9Gy?=
 =?iso-8859-1?Q?4ijoOHJKLK/74XNj0PlURoX/WDQnsmqoeU5PHQx7i9k0UC0hIUzsZeow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6evqTIW5HnXsYJzHNCziXB+fXZ1yiEQDjlMzfeqphazcOTmGIwj7E3OF82EG+9yzL5+M5gn55E+3IoxFC+axYsNGVlgzZLvZJxnxwJzauGLWZ7zWBBkWyNMN/xHwoC2kaINzWv6jmWWJgHxNKBUMBSkoK4uiC//oIzbLn+7koTmkKFRssQEbSjX3uWrXaUoOq67cGYmhsbFTtwqkZkkC9QY362eWp/s8JjGBVsHFRAG5jzc07HLRq6Vk7HcKL4G6K5I7nrB68ZWQT4rztLHfvCycodcLumbnO0tiQkO2EyOhdUrH5p4DLDl2aLr62iaN5CnfNvcxi4Xk2VW7LeDl4A9Lv+7wriI1Ne88kx8KHE6/T2SQiYm+fErP9cequ84ZBbEpSqlan9l2M5WBJxOa7d+HrkCwFMq3ATVWD3vX5+EmKkRUW3W1/vWMl6sI1cE8xTmdoP9u5oRvFQK0Z1KYMmzbvNpUnloXC4jiCwfj8acsvQDoJcXfomE/G46n6W03joYfvMsEtp/w2QaTe1b6gBBcDWm6Jk8xvR9dHesJeVnYZgHmncGDj+01sIrmWnfC3EHO0Ocw3DTKNvbHlgELENzIz6BUcc4AZu7bjfQHTAA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41387873-79ad-4be0-4e84-08de216f7be5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 22:13:03.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofcBk89nTekZVThyI5aoywIcTeKv69QNXasHII9WIVcDGHi9ajfwFCLzmYonHBdPxDlMVWQ2AUShTi8i/1a8pnM51lt2npn8dxinh6VH7rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7101
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511110181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE1OSBTYWx0ZWRfX1RPc2dRQeoUW
 NA0el2zj38t+iH0pql19ERQXJjpW2jvTJu4iceQC+ogAQObCItGFnFHOKv2Z6PPi1jTNbA6qGd9
 9kOyxrRIqErFe0YxXYkgerGwp4pKshvo0tPieLzT1wDS2cRX6rIPGh6lXxO4P8WNCRmjDSWuui2
 0DOs0XJmSxq6phCalYrEz36mi/qn84kKE9hAiHMxq9Fj+U4yyPUk8Ho2gZ7TGqWxl0bEijpAm2a
 Ts34P59yDxC9c53IrT2q7zd49Vq90oHRprIY/nJJDBOksxP1/e1Me522P/J8+w/H+VjeM1Jz811
 o/aMgNAwNtHSiMUq5BA/ZfJDYjVLjajT5qU4g3oMpZphBNzwsI90yP+dJwJHf1b+7QDh7a4Tjcq
 5AfoFEHHFYauRijIoOxv+WOFKGrxI3o9yOZctBnI90qbSEmLqAw=
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=6913b4f3 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=3fSow7lGzcX-0i--K3QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12099
X-Proofpoint-ORIG-GUID: V_T6aCECJ59Iqi0nYXfx2KTsqoQ690Nd
X-Proofpoint-GUID: V_T6aCECJ59Iqi0nYXfx2KTsqoQ690Nd

On Tue, Nov 11, 2025 at 03:50:37PM -0500, Eugene Loh wrote:
> On 11/10/25 22:00, Kris Van Hees wrote:
> 
> > On Mon, Nov 10, 2025 at 07:10:52PM -0500, Eugene Loh wrote:
> > > I'm against this patch.
> > > 
> > > The picky stuff is:
> > > - the Copyright year should be updated
> > Easy to fix - done.
> > 
> > > - the timeout probe could replace
> > >          tick-1sec /n++ == 10/
> > >    with simply
> > >          tick-10sec
> > Arguably, the two are not identical.  It depends on why one is used over the
> > other.  Here we could probably go either way, though it might be nice to have
> > the tick probe firing every second as a way to generate a bit more activity.
> > Given the frequency of the other probes, not really important though as far as
> > I can see.  Note that I didn't touch the timeout probe primarily because that
> > was not the purpose of this patch anyway.
> > 
> > > - the "delay" env var be set for delaydie???
> > Why?  We are simply using delaydie to have a trigger executable to execute.
> > This is a valid use of it (and it is used that same way in other tests also).
> > 
> > > - the ustacks for delaydie are perhaps not very interesting
> > That is not the point of the test, and for that matter, I highly doubt that
> > ustacks from date would have been any more interesting (aside from the fact
> > that you'd never know because the test didn't even work with date).
> > 
> > > A little more serious is that all this patch does is swap one failure mode
> > > for another.  What for?  It's XFAIL anyhow, and we do not check that we're
> > > getting a particular, expected failure.
> > The difference is that the pre-patch failure was due to a problem with the
> > actual test.  But since it is XFAIL that was reported as an expected failure,
> > which was entirely bogus.  After the patch, it still fails but at least it is
> > failing for valid reasons.  I.e. now we have a failure we should look into.
> > 
> > > The real problem, meanwhile, is that this patch leads to lots of test
> > > failures, at least for me.  Not every VM, but many.  Oh, and I do not mean
> > > on this test, because this test remains XFAIL anyhow.
> > > 
> > > Consider a subset of the VMs I run on.  I get these failures on the
> > > test/unittest/ustack/tst.*.d tests.  Why on these?  Because they run after
> > > tst.depth.sh.
> > > 
> > >          +------------------  arm OL8  UEK7
> > >          | +----------------  x86 OL9  UEK7
> > >          | | +--------------  arm OL9  UEK7
> > >          | | | +------------  x86 OL9  UEK8
> > >          | | | | +----------  arm OL9  UEK8
> > >          | | | | | +--------  arm OL10 UEK8
> > >          | | | | | |
> > >          v v v v v v
> > > 
> > >          x x x x x x   tst.kthread.d                 FAIL: timed out.
> > >          x   x   x x   tst.uaddr.d                   FAIL: timed out.
> > >          x   x   x x   tst.uaddr-pid0.d              FAIL: timed out.
> > >                  x x   tst.ufunc.d                   FAIL: timed out.
> > >              x   x x   tst.ufunc-pid0.d              FAIL: timed out.
> > >                  x x   tst.umod.d                    FAIL: timed out.
> > >                  x x   tst.ustack25_max95_profile.d  FAIL: timed out.
> > >                  x x   tst.ustack25_pid.d            FAIL: timed out.
> > >                  x x   tst.ustack25_profile.d        FAIL: timed out.
> > >                  x x   tst.ustack95_max25_profile.d  FAIL: timed out.
> > >                  x x   tst.ustack95_profile.d        FAIL: timed out.
> > >                  x x   tst.ustack_max25_profile.d    FAIL: timed out.
> > >                  x x   tst.ustack_profile.d          FAIL: timed out.
> > >                  x     tst.usym.d                    FAIL: timed out.
> > >                  x     tst.usym-pid0.d               FAIL: timed out.
> > > 
> > > I think the problem is that tst.depth.sh -- with this patch, in any case --
> > > turns on a huge number of probes.  That causes problems for this test, but
> > > not in the sense of it FAILing since it is marked XFAIL anyhow.  (All this
> > > patch does is change the FAIL from one problem to another, but we still do
> > > not specify what failure we expect to see nor check that that is what we
> > > get.)
> > > 
> > > So, the problem is not with this test, but that the system is left in some
> > > whacked state due to having attempted so many probes.  As a result, the
> > > process "dtrace -o $file -c delaydie" is still around well after the depth
> > > test has finished, the load average remains high, the pid0 process does not
> > > run, and many tests time out.  How long (how many seconds or how many tests)
> > > does this effect last?  It depends, as one can see above.
> > > 
> > > This raises all sorts of other questions as well, such as whether tests in
> > > our test suite should be allowed to depend on running on a somewhat idle
> > > system, whether we (dtrace or the test suite) are cleaning up well enough,
> > > etc.
> > There is of course the aspect that this patch is part of a series, and the
> > next patch in the series should resolve the impact issues of this test.  If
> > it makes you more happy, I'd happily move this patch to the end of the series.
> > I don't see how it matters, because this crazy fallout from tst.depth.sh will
> > be an issue either way until the per-PID uprohes support is applied.
> 
> I don't get it.
> 
> First of all, the crazy fallout results with the patch and it doesn't
> without the patch.  Without the patch the test was basically SKIPing
> (admittedly as a mistaken side effect of a test defect).
> 
> Second, the above results, with the crazy fallout, included the entire patch
> series.  That is, the tip of the branch looked like this:

Well, it was not clear from your email that you were testing this after you
applied the entire series.  That of course changes the situation.

Clearly, there may be more wrong with this test.  Or it might be pointing on a
potential issue where DTrace might leave things hanging in a state that takes
too long to clean up.  Either way, though, the change in this patch is needed
to make this test even remotely useful.

If the patch causes the test to trigger other tests to fail, then more work
is needed.  I would still recommend that we let this patch go through, as it
*is* a correct fix for a problem.

And then look at what the new issue is that this test brings to light, and fix
what is needed to fix that.

> 59a49ce9 (tag: 2.0.4) doc: Add blank line before bold text so it is rendered
> correctly
> 61e69762 bpf: fix file descriptor leak
> 20780963 uprobe: remove unnecessary enable_*() functions
> 170c4cf9 test: fix tst.depth.sh to use proper trigger
> cf7ae35b uprobe: Implement PID-specific uprobes
> 
> If there are other bits/patches I should try, let me know.
> 
> > > On 11/10/25 10:27, Kris Van Hees wrote:
> > > > The test used 'date' as its trigger but that caused the test to XFAIL
> > > > for the wrong reason: date does not have symbols and therefore dtrace
> > > > failed to enable probes for it.
> > > > 
> > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > ---
> > > >    test/unittest/ustack/tst.depth.sh | 8 ++++----
> > > >    1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
> > > > index dec16a3a..977d1b42 100755
> > > > --- a/test/unittest/ustack/tst.depth.sh
> > > > +++ b/test/unittest/ustack/tst.depth.sh
> > > > @@ -16,7 +16,7 @@ dtrace=$1
> > > >    rm -f $file
> > > > -$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> > > > +$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
> > > >    	#pragma D option quiet
> > > >    	#pragma D option bufsize=1M
> > > > @@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> > > >    EOF
> > > >    status=$?
> > > > -if [ "$status" -ne 0 ]; then
> > > > +if [ $status -ne 0 ]; then
> > > >    	echo $tst: dtrace failed
> > > >    	rm -f $file
> > > >    	exit $status
> > > > @@ -78,8 +78,8 @@ EOF
> > > >    status=$?
> > > > -count=`wc -l $file | cut -f1 -do`
> > > > -if [ "$count" -lt 1000 ]; then
> > > > +count=`wc -l $file | cut -f1 -d' '`
> > > > +if [ $count -lt 1000 ]; then
> > > >    	echo $tst: output was too short
> > > >    	status=1
> > > >    fi
