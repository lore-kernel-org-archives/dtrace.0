Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF813CAA5
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 19:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257021; cv=fail; b=WZ+61fDBCaXeS/bnOrMquBMs6k6TBKMrjUzbX2MU0+xLxL+oa8aN1FBFYBaK6Om2VbPr7lCW29QCGIb+wmXYdI7lMT7vCfhTm4cbBvoK3LVNFTpw7enDJXLO4RBGA6YijYoNVQnIz7DRYkWY0/9mNgRBkfz9AvCVzlk7GNkEEMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257021; c=relaxed/simple;
	bh=x7ngIkT6dqxTkCmX9o/DFB+v+Y5gXF0Tt3iMQFvEB4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IfMAGPuTe623znu+s+J6fupPmizkHBYw/Ku579BQjzE58DZDsdfPaotGgoT7+RIlXVpdv5e6TeWMmnWvtzqlgpQox2g1f0I89ALe+ddya9O+mmpW7c76TJX5ieHhgFHEUuLRo1J4YoVwRWPAcAQc6ivAwLKQ8HYVnKE0bUlf3Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Uia4noms; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fN5tyebI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Uia4noms";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fN5tyebI"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DJ0UIS005307
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 19:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=9DASWzkB5JJoJnv
	0RVeZOh9zmgTxd2MJUIx3PiY0QdY=; b=Uia4nomsqTJ3+M3+GaWfPMrQWU+BhvB
	LxY1iAZRDbK6oYLJNdCkso1xhpJNPNinftf1KurpSIfQhYT0/AfBexNhfcvaOuV1
	THXPbKssMJfH1W6wmSHAVR8E44duHI9765RJ4QaiS3DvDp3n0bwNKCIN+ZIwX7Mt
	ARwEa7YCDoTf2MRZM/0w+BWHFPTbCxUKjTtzfyz0sZQlgzWT/zSqw3g0LRRRx5Mb
	iN5qXLqce8D2ZFOdo+yh1tPDnFN1Qxk+aINHLx2tAy9BunRP9lMPc4axnkErnbfB
	G+EezA1oIXFf/Nlh01YetHAHad1SQggZ9O8u/hmRIo69CXoIoMVjnAQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gevcxk31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 19:50:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48DJmDDP032386
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 19:50:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9kdqad-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 19:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2yYqUvAo5GVAle8E+E08pIcjdIdkhBEZYaWxoLL6MCOwTEG297fwiuJ5n1t7AthmpcIOT++j02hAZ05/7bGjeFRxwlIfNBmf3U7CUn5RY5dixJACMH2ruMH7q1cz4QtwYXpDKjOkUyy2cfh6mNRh/BPUic+YdHESDSODAByk5AldPyQ2gO60j/TKsGeJweVwyMppMNoS/FCHeyOW6zGUE1f0HwTuImb8I6gE1UrJDsLsbR8mRwg9VE2xP9dZsWmxG4BjyfLmIW6FFqfZlOZUHbVKIBbo7pM0eYATRP9JDu75utGVYP7KQPebl1lJFd9LaqPskZLM1j4qdDeSZWxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DASWzkB5JJoJnv0RVeZOh9zmgTxd2MJUIx3PiY0QdY=;
 b=zTePba0X/dqAjnRU4fzfvmvk2YFQpMPEa7dATOBSxUXCrpIaMvszPR3Qz9WWYea7/iiAJogqZkZZOWUzZkBC81JbE1H7AvoWmVKpl5qB4SWc9UPiQ6Nn4DBPI3HQuslO5m4edsv6SFuv3gyAV1Xloybkk5Co//M5wOjGnl3UFGMgJafggQojpf6YCUYUnC9AvudnPvCI1zh8jXyqIm8/ngd9f71Pc1P5wXXhTPqyesK13K/3lZnGiHmMPIH+w91wbNVJbwYYRaJvFcVUM9d0fa4UPzEr7iVh8tEwvWBjkenkd0vFRTj/7rz9gZVouNWeRheXBF4C/oTmkjnuEYCbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DASWzkB5JJoJnv0RVeZOh9zmgTxd2MJUIx3PiY0QdY=;
 b=fN5tyebI/UeVooru+Q+kYzT4oTseWG+oWUDIWHYV32F1bv2lD2isQi01b0/6ilq3BSCkAC9TMwoPF4+ucL1+tRisYRwGZVdH26DOqXQyYS9fqR6XNczV5CjGbt4rU7QtBK3KBZOr0mOt0hHepSq52aF1xLX+31ijGFUXwlDHxV8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4495.namprd10.prod.outlook.com (2603:10b6:a03:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 19:50:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Fri, 13 Sep 2024
 19:50:13 +0000
Date: Fri, 13 Sep 2024 15:50:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 05/22] Set the ERROR PRID in BPF code
Message-ID: <ZuSXcRs7UMsl3EW7@oracle.com>
References: <20240913171535.18630-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913171535.18630-1-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P265CA0160.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd0696f-97cb-4c23-1333-08dcd42d4865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+HP4+C9YeQzb6MKZjWY+LwOPtk2W4GQn6BXD4Ea+/O85mj8maSZT8S7qP051?=
 =?us-ascii?Q?KrT4/HjSj1Y2MHp/jM8Z9VBznIQAagWu+F+mronltBMcs7XGlHVT60wRsglR?=
 =?us-ascii?Q?peOLWoYB+ILi/ut0X14s3A0sf4Vpc4vbsCIQN4bl4GQT0VLp99r4Dnj2PnKf?=
 =?us-ascii?Q?hJhEDBK7u5Bo90W/pFZavURsst6gERnLAdLmCplBmXtlc+f7p473k5kqVrCK?=
 =?us-ascii?Q?77agtXF6YCXRi2bntH9+PdSkI/mk7j/J2kcdRfnI8xu7aD+xrS+I8j3ZiVe1?=
 =?us-ascii?Q?0xL4lzgKFwtHImvloJ98YUoAaesN02+mdDDtmE0gzJaVS6ZSx9u6F8FTJ+38?=
 =?us-ascii?Q?ha5b7SXPtn7fZzaJSxU2GPN4Ce4cWjsYSclpBYIAYXavUnMsCVWCA5IUdK6y?=
 =?us-ascii?Q?7PCWCGFgZBSYTniXlR80YGMa+/4wTy5KyZf3lJeBsw7KK9oFWCj7WOxjfI/e?=
 =?us-ascii?Q?bv7GI1vM25fK64anfivV3A/nbNZQgYDbvEqgAJpX6FMTBOnwxxVQGSDw5ky6?=
 =?us-ascii?Q?slCQRJQElLV/dsWhJKI8H/vVSaom0FiSeqGXZcCxGplyBYW5IlG4gQ55JXBF?=
 =?us-ascii?Q?didwFMl3bQ8GedXGbyXsvvqWlpk8mEpXPbHznp3q+zn8h8+IWtnPN0MR4Ra8?=
 =?us-ascii?Q?TDTgJWVIhNGlIIaMMxkxac2ck2jyOEXvjL1q6Vd5za1++G6IA4x+6iUlnWeL?=
 =?us-ascii?Q?mygPfwxZeC1wSREk8TFSdWMoYh1f1Uiyldt+zPxYcAqx1YCRjc1Ba2FFzCgp?=
 =?us-ascii?Q?HFL90h27KFThkRdKG0U9X4jC7I1vbRBB1Yuio6WlRTMb7276yLOaCb0jwCGh?=
 =?us-ascii?Q?FdJrrqoR/3X5umTwDniDCeO+Z6xN1iQ8vA+vwUULuvJi1MEkfQTXF2HrlAFl?=
 =?us-ascii?Q?6Fj0zlv+aKfAo0+U3pfYcMlpR3MpHJiDRQtQv8z2IMItNWcLj5VoTgmkliMX?=
 =?us-ascii?Q?GHzrB42LCFJefHvGRv/VfIKfaH5mCExP7p7cVybqo1qLev0SJ7V+LxvU9AWK?=
 =?us-ascii?Q?Woys6O6OYB9phKDdXy4hz+Th4RDpCVlGjx4iEBccLgc6kG9BPq/gaHxc6c/B?=
 =?us-ascii?Q?gvgJyxUQBjbRfmETH2RuWFvu0oCIK9fCMA+vfS7iTnC3r8ui1dL6R0P0wgGw?=
 =?us-ascii?Q?tieohXYTGPn6aGlUxyN58LmVwcM43pznmAzkibRqgh3+ZeXCuTCvotK7EJDg?=
 =?us-ascii?Q?PTJ3lyncGkdxzqvMoBAhonOJOPuBomij/J7DImHI0FZQQE9jUm/miwjWzw6M?=
 =?us-ascii?Q?zqx/tbDyFg8RFLKe5R0xMgJ029+YZhz4wmLFVbxBxwJsXe8cl9Xk8XxyqHt/?=
 =?us-ascii?Q?uWZCtY5sMbtagxeamJP8GTbZtmOqyhIQoEGCp4mJVFAfeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qNH8tSIY7GuhKKu3FegQ2JgLy2qgLdFGxguhIxxlrmyZGtY/D8chmgwjLTV2?=
 =?us-ascii?Q?pa3T9sXv+Ih8QtI/a3bg81vIOg2FreCfrnAPibRxjZhNpUIR3aaa3HXuMb99?=
 =?us-ascii?Q?jdlUul9kUepdhLeErmPThRMNQsPrKuRTgdV0OOk++oUfi0Wpbr1QqzhouMba?=
 =?us-ascii?Q?njAMss1KR2exh/D7j54GWro9As9/FhisbDtxg0U1iOjwZImFF8OX1VVdKUKJ?=
 =?us-ascii?Q?UMa0C3wok8ZKUrQC/92TD2HYEb1/qocM9m9xzNu6mDTYAJBYI8z3lEEf/6Wy?=
 =?us-ascii?Q?n5yGp8pNGh+Df254UtWlpKQmOHLkiuivsIXXZDmMBM3rEh4t0Z3wcd/liXUN?=
 =?us-ascii?Q?/0Cs8kl4r4Ir1OTaB6vcxGO/kV2JJXNQpMnuoK8FpokA3Mruqluor0qXthiE?=
 =?us-ascii?Q?R2aEVvxglOVyHy4ckIkudaBUJ1ublyL219p6BYKc2ktvcJsdM+yTXtMbyWcm?=
 =?us-ascii?Q?OVniVE7yIiSI7zIqTy6ZTWpZc9zhB9FAd+h+DfxTldJJZiYUvTDzObaFa+m+?=
 =?us-ascii?Q?Gtw+USdk9tx9jHRX7D3iMXqphOZqfvla1ZbAE0YHfZYIFL6rRHy9ReJfQxo2?=
 =?us-ascii?Q?blMEpqavhiM9nUUMyzmIhqXV8+U/aq/DlBeu5SBBMkI7bVshMHWTaiJAQ+aq?=
 =?us-ascii?Q?MhGzBuxt7AOcaUwTYJ9CxD9y9L86g1olMR0tbwFKtX5ffj3t+ruR2kx0w6pM?=
 =?us-ascii?Q?BeAnOTf9EY0o0XpqAX/odiuMrkbn/pBl4wEYYXdjfiXrzpoeBPX/m338U0aH?=
 =?us-ascii?Q?XLt4B0Hq5FYRxl0tRLkm+HL1xtISzVTYPzlm2Kf6woDuDtNE2rC648o2pXNT?=
 =?us-ascii?Q?6Aml6aALZgJ9lNpb4XUiUwOyrCoil6AIw2x8LGlfUictx9JEWBi97113KV28?=
 =?us-ascii?Q?kw+sIoYQWGJ94QJOc4Rn2KY/N36Cfd9KhUovXwQ3BmoBanAX3xN9i2e/23BR?=
 =?us-ascii?Q?GfcfhghZkrrRlars3xRSNbnDjmowsZsV//G+3qYaoVwBGtI+g43PKk7Zrf3m?=
 =?us-ascii?Q?4ZHEUIgEPyFUqwpQFns6bQZuIVZah5j+/TyJp/NHM3ao5kb3x92pnAzX6f9C?=
 =?us-ascii?Q?WSoQETmLJxHZGKeuXjjS6m4W+ZjZ3DtHspUARiEEgn2w2ueRAC0zVaNk6Wuu?=
 =?us-ascii?Q?2qnEgULmQvsPxH66bqON48pYniR0/F6v9ezIqZRQFoD7tq+AjgSATkMKID9R?=
 =?us-ascii?Q?U6FhwxJothNMJ1mTXwWQTA/itmtybEgLG0BLIRVmYq0sMa37pGEBY4D4NGlS?=
 =?us-ascii?Q?OoOaRA4uh5yvgNobephJXWqH1L7Jvfb0idyGqQZ3ZBTkG78awfkHKyj7sI/U?=
 =?us-ascii?Q?qWamKR+lYzzZft+3EvIj725KlfyDXFssMu2fsSbiLV4cMYUm0lp/BbA4G9mw?=
 =?us-ascii?Q?TLYsR7iI5XZQxVPhcm1AU9eykwadGtYdY78/5mHHekB+DHsenbFZM2wdcZ4k?=
 =?us-ascii?Q?pP+3s4d23cV6SLPMmeappzK+xU/cGy3KxfZrDjwZNrARyoBpJFV9Je9MlAfw?=
 =?us-ascii?Q?UqPLz8j6ofggDRusNJC2UkXoY2UoPJqYk8UGXyTciW/PQqAmiCBRWil/i822?=
 =?us-ascii?Q?JHlwPGxZjY/dGshlo7l5McEzT6yac21LMvyyOYYnf1JU2AyOwVBcn1nGkyXw?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aEuOfOc0kNDp9IxAxs2MOpYCdX70PbjJ5u70q9mBivondl1Wlm8LOPzi9wzfK1NR99lgoGtZHJ8DpekGH26qRj/y+KEvT9kVVvdmQEqZ1HZ1HJUCiX2olVurYeEBzzuu6UNSkhEnWy5x9gHiMZl1+V9ah+sszLjs3mjxwByiTFQlpMx8oswcuG3nCeDFWm3/wIuVjO3VQ0STNXe6LL4Eza+YLbW6kRSTRd7HKxnB4veTZXypdaHIVhj+J3B4/Z4AFMFl8WdDpdIZa8XUB/Gj/Km964VabZHxr4RMk0KrvpLXRwzxaV47haNWcHbhTb5O8xycjUs/yl3qo0O6yEVdXyCZewYBL0KuQeDNt3UZhrZsdwWwwxs5KTj0BDGvPOYZGYt9+EkGhwcw6q3a9ALPy8y/NI9NB5vNdlwFdduH67n26zcadlOz0Q4N3aP0sppYH4a9cXx7zNNnsC5B4kEPcNjK8JA5znb4xaHygyLjQtkps+dcnaAZx/zcziXejglGqSC/lbBBW04KTVSrnKjwBiN/NYKYS+m+/Uo3P8ByvCcbDS6orKED0D6NnXhTH49SP/bCjnJ04TCTnYo4vqlgwCwqQrUMbk1hG+fkxYa8s7A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd0696f-97cb-4c23-1333-08dcd42d4865
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 19:50:13.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k/nFdm9+RMjkNz69xsUREOli9KTLLBE+oMy7Y/hk4LxAzXxUvkXA7mEpvgXTyPJWMG3D/5vHb0ob9XaiY/PDM+tE6TRA/j33eZWhCnT154=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4495
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_11,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409130140
X-Proofpoint-ORIG-GUID: CFJH1dFsNxW5rI64TVRBspZSp_iU-phF
X-Proofpoint-GUID: CFJH1dFsNxW5rI64TVRBspZSp_iU-phF

On Fri, Sep 13, 2024 at 01:15:35PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There are multiple options for how to set this value.  One is to
> hardwire it to 3, its expected value.  Another is to set the value
> during relocation.  Here, we choose a middle ground:  we define
> the value symbolically (to 3) and also check that value.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  bpf/probe_error.c                        |  3 ++
>  libdtrace/dt_dctx.h                      |  7 ++++
>  libdtrace/dt_prov_dtrace.c               |  3 ++
>  test/unittest/builtinvar/tst.id_ERROR.r  |  1 +
>  test/unittest/builtinvar/tst.id_ERROR.sh | 52 ++++++++++++++++++++++++
>  5 files changed, 66 insertions(+)
>  create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
>  create mode 100755 test/unittest/builtinvar/tst.id_ERROR.sh
> 
> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> index cad161fd7..1081ee71d 100644
> --- a/bpf/probe_error.c
> +++ b/bpf/probe_error.c
> @@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  			     uint64_t illval)
>  {
>  	dt_mstate_t	*mst = dctx->mst;
> +	int		oldprid = mst->prid;
>  
>  	__builtin_memcpy(mst->saved_argv, mst->argv, sizeof(mst->saved_argv));
>  	mst->argv[0] = 0;
> @@ -35,7 +36,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  	mst->argv[4] = fault;
>  	mst->argv[5] = illval;
>  
> +	mst->prid = DTRACE_ERROR_ID;
>  	dt_error(dctx);
> +	mst->prid = oldprid;
>  
>  	__builtin_memcpy(mst->argv, mst->saved_argv, sizeof(mst->saved_argv));
>  	mst->fault = fault;
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index 633c529f3..d8232868d 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -14,6 +14,13 @@
>  #include <dt_pt_regs.h>
>  #include <dt_state.h>
>  
> +/*
> + * Static probe IDs for the dtrace provider.
> + */
> +#define DTRACE_BEGIN_ID		1
> +#define DTRACE_END_ID		2
> +#define DTRACE_ERROR_ID		3
> +
>  /*
>   * The DTrace machine state.
>   */
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index bf87cb054..9f0d72b78 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -45,18 +45,21 @@ static int populate(dtrace_hdl_t *dtp)
>  
>  	prp = dt_tp_probe_insert(dtp, prv, prvname, modname, funname, "BEGIN");
>  	if (prp) {
> +		assert(prp->desc->id == DTRACE_BEGIN_ID);
>  		n++;
>  		dt_probe_enable(dtp, prp);
>  	}
>  
>  	prp = dt_tp_probe_insert(dtp, prv, prvname, modname, funname, "END");
>  	if (prp) {
> +		assert(prp->desc->id == DTRACE_END_ID);
>  		n++;
>  		dt_probe_enable(dtp, prp);
>  	}
>  
>  	prp = dt_tp_probe_insert(dtp, prv, prvname, modname, funname, "ERROR");
>  	if (prp) {
> +		assert(prp->desc->id == DTRACE_ERROR_ID);
>  		n++;
>  		dt_probe_enable(dtp, prp);
>  		dtp->dt_error = prp;
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.id_ERROR.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.sh b/test/unittest/builtinvar/tst.id_ERROR.sh
> new file mode 100755
> index 000000000..082ebd0c4
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.id_ERROR.sh
> @@ -0,0 +1,52 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/builtinvar-id_ERROR.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Have a D script report the probe ID within an ERROR probe.
> +
> +$dtrace $dt_flags -qn '
> +BEGIN { *((int*)0) }
> +BEGIN { exit(1) }
> +ERROR { printf("ERROR probe id is %d\n", id); exit(0); }
> +' -o D.out 2> D.err
> +if [ $? -ne 0 ]; then
> +    echo DTrace failed
> +    echo ==== D.out
> +    cat D.out
> +    echo ==== D.err
> +    cat D.err
> +    exit 1
> +fi
> +
> +# Get the ERROR probe ID from "dtrace -l" output.
> +
> +id=`$dtrace $dt_flags -ln dtrace:::ERROR |& awk '/^ *[0-9]* *dtrace *ERROR *$/ { print $1 }'`
> +
> +# Construct expected output.
> +
> +echo "ERROR probe id is $id" > D.out.chk
> +echo >> D.out.chk
> +
> +# Check output.
> +
> +if ! diff -q D.out D.out.chk; then
> +    echo output mismatches
> +    echo ==== D.out
> +    cat D.out
> +    echo ==== D.out.chk
> +    cat D.out.chk
> +    exit 1
> +fi
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
