Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C72E36FE
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754497136; cv=fail; b=dTf7hh9WfnqOcBvO8BuX903Cu08tDhinq7gyFUoelzXg3eQdRsTcxKJchpOkvkJkofEDRrjLrm5X7leJeSEfFl2VVCr4URppz3UBSv3/iyZmQF8g+DTdTYTrBJxtdPHDA/QkkH6F/7lonB4KS39XuKVRU4UtUB9zXCXSeBAHCYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754497136; c=relaxed/simple;
	bh=aChCnkNRBLg+nyZi0AaT1QfmYB3BwlOD1nluu2J4h0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lxbqP/ckZ59ON8cW0kI2WDcgCbHr3+o7BUjS4PtJwEou4VNOBCqqw6XjILxK/N8KQE1FP2uvVi89rK5EEEFMq7fyKcfJi8CsLOBJjRBNfmRbaZ6C//JfvyuqrOlkFLYV74ZjjMVjMArliMtQYBQRZa8hZJ3TPIqScda3T4Rx+R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sd1kJWLy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FjQZY8du; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sd1kJWLy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FjQZY8du"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CReJZ031378
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bz9ZmKEvjlJweUwKR7
	obS7alJjk4jcIhcvEA6eY11Zo=; b=Sd1kJWLywyeRsGY/Xcdma4Wcog8U4kEAkj
	5LgaVGOuqz3vX6MisQqrVczz484PVmSdN8ZQ+Z1DHw80W6W3hQ83n5uHyHs2GVrb
	ZX3v2/rGfrKh48p9fOwx8uTCBhRsvoT3cp41xDFZ8WEws8O0tFrcHlgCHxS1q9Cy
	FMbVg3GoNi+a6jDFuz+SnbgbKHRiXmiSO4OLaKfaVwOc3IFpnvkdGGZ3wbes3XJr
	0eUOlPvvAhUb3/RP68ki57ppgVS+JM1K/yV7+o8kXfYNJPGvllz2I0hFzy7rGYES
	nVKs+nUVhevpPDGjkKE2u/kBIXpjKdBnZxRnh8Ev3P02bFB0DonA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf240e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:18:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576EjwQo032060
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:18:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqrmk3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8255tm3x6s2typ1dTSNbiNwmDjGV6fRJyuSLd2M+yTyy/w9jT2tCrGpVKJysX91edukatVqtmVYMNKf3s5V+qnvkgEuAsSAgWiljEEwYFV5CrHh9O+/ZU5Z9x3hSfeOB22SAPoKmUzYreWp1RlURJSCfZcnCaFEsQDlbOXqbzdze+5YaEBv9zhp0jak/Tf3g/GtCMUunf0/28r1wB12QPJHZm3x52IsKMlNvd5GQGnn7ZBUyzcMzn4kf51VvmdYNDRrcnragBhZn0myj0ZI+T9EfeDP40iEig4XOYvumBswFjiGjZv/pKdXCvAz6y3JK+/Zy9wszARFgviGz5Z3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz9ZmKEvjlJweUwKR7obS7alJjk4jcIhcvEA6eY11Zo=;
 b=lsG8hvy/P6bQH+ptcY8ZNsKs+BMl9EVhNisbxCKwpQFeNKJReqdRBIYJfI9vy/k2mhOKeM4wFEQzq7HWhNxvlKeVbH7nTMQlTD+cCgm1404BhtWUmBdl/4w86NJQMG+5raqEdnLyBNnU8NV14KaVH0Xf7k+Ogh3Spcs+uqRsSlGgk/w4CM7RhKClgiHs8Hn0YeVvVGc9Gha/26uwMUgcyY79ghh7sflAdskupxm2VUsoc/f3oQAKPWeXwuoTtUN0RAZfRIlMh8rjQaIso9Md6zvGnJGOxMxdKPBRHGhUDbCtjiTzmrEhNaxkRP0MTTFNs/VRTv10PLkK+27c+bwWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz9ZmKEvjlJweUwKR7obS7alJjk4jcIhcvEA6eY11Zo=;
 b=FjQZY8duueWQ3lYHWnhk0UXwUsU2cLforOrQGGph0V3qXnfYLk6KNCZNQ65qyWJAO2ZXDKRd8i+IbhugvCPiJj/CwbFISM/LJKt1ZvurU4aJgpHZuAWGLU4qfynPN7p5dazVyB3FWHGoeezcKtC0AFjDq88EnYXhZDS4gzQrmeA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB5872.namprd10.prod.outlook.com (2603:10b6:510:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 16:18:48 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 16:18:48 +0000
Date: Wed, 6 Aug 2025 12:18:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix various memory leaks related to stapsdt and usdt
 probes
Message-ID: <aJOAZWhbDX0WD+Bk@oracle.com>
References: <SJ0PR10MB5672DC48BED654643C7F8912C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <c6457db8-f144-4232-b802-b8eba00bbb6b@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6457db8-f144-4232-b802-b8eba00bbb6b@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f493b6b-61d1-4232-17dc-08ddd504ecb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q5j5CQs9uM7BRdnupLoePSfiGmzMAZlDWSEp/tRuuoSerbHC1+NsP33IFzuF?=
 =?us-ascii?Q?OP7nO1sztz4MWihriv1rBO3kWaUvJGWdGVDZlMkDUs7u2SXq7gkIVUUb9KtM?=
 =?us-ascii?Q?T4VFVCITnmcfJHurO+qCE/JkBuXHHWyknB3U/7mmoPGT2rHXVwJWepiaAlSI?=
 =?us-ascii?Q?7zEMf9WdeqoSs7luYKTUq6uUP2+Nj7Pq0BGPYHj/mWBwBA+s2CtNx/plk1W3?=
 =?us-ascii?Q?1W2M5CiQnfcEzoUiFKrt1smBpdNktrhSp/JdRF1M26RkicWsi6019mkcTtKD?=
 =?us-ascii?Q?DKSsZpAv2hROOra/oroVJsGJu5on7hBvfolOe1BcsaxBiTBZi/ZOJD8PVd8k?=
 =?us-ascii?Q?HFe9YcHg/YanCJfB7rYSW0w1S1ILKPGaiXqLqByXWzres601f5wumX+WvEK1?=
 =?us-ascii?Q?7sSZPehDF6qLH8uY8Bb3zq28UcACX6UyWAJcGsN0m2eZxTXwEyUBrepM6S3J?=
 =?us-ascii?Q?jKsx9N+Bmn46sLNM6rbVQSPllDaJ7JO4opU8jQsRA/sIzHlnNbJpX8MJeueO?=
 =?us-ascii?Q?DqDmMKgpHbxNPvaEYS/SKpYg/1Ll78V0oWvXyN1fayf0w47RK9rNdoSe+uFN?=
 =?us-ascii?Q?WPwQ9uIx/dJaCOlw6s2eTuN8ZvvB3U7nREHsUyA2sbHD+DCda1XagbnL28aP?=
 =?us-ascii?Q?X0wyMAKq0rjG71No1UIDh47X02HBPkEQ6HLH7ov6K04qGe7B9r+P0qb18Z6S?=
 =?us-ascii?Q?B3MTxq4QU4nQ9ZQLn0SFH6WhrmceAd1ixke6G+DXl9HpL7jZp/7c2txyI44k?=
 =?us-ascii?Q?BpMx4YcWqdjzrk9Z43/XYXFBOPMU2MUEQz1T07zPBg9daxNXpUI7X0j9J4u8?=
 =?us-ascii?Q?iKRdcyXWV3jTvSGgZ/qrg0tGaRRqslI17HxzzNhD6YZJkBS5rjzckdGKfXKM?=
 =?us-ascii?Q?QfGJLt+TLAD5MuGpk8o39ZyTznwmyLyrTbzjdxDWjjq6sGOUmskZyQ2Ra9Ie?=
 =?us-ascii?Q?duoknESZkO7jVdOBqHsuupoWgqTDLWhjJ7bbwNmJRmTG6w2fm1NCdX9pjHTI?=
 =?us-ascii?Q?XtuQsq/s3Im4h5yT3mge0TnfrdfANMYW8upM+Ji2F1oEgf458NBLkp+KkEVO?=
 =?us-ascii?Q?+tg/r740wjHPVbkEoUP7qXAwhoW+dz9i27DG57xrXjo53XoKugcasTqh8IGL?=
 =?us-ascii?Q?mGOos/lYOpS35ajXwyp1hQPITWfjROqkhXLxrMGRQNUwfkRAobAEgqK19nL1?=
 =?us-ascii?Q?L0xkTHn36lLp6o5Lt5f9/dfP9N7uyDLUVcDRUldJtXGdOpunbprnaCYIfroZ?=
 =?us-ascii?Q?frBMb5LDqbwJhUHQzVKeWqfyBQ1DUUG/Pu/UlU2LyP1cqRcuYOyY04tSu6xc?=
 =?us-ascii?Q?aXEAtst0lpXlM7ZRJM0DRuFuARtFBxCTqFaS73P1knHwnEmDvuOFSs3eno5J?=
 =?us-ascii?Q?H1XQunrJDHxgD5cHDCVOyQbu3jv0pWuwJ65sCHsI3mgRI70u2rDmU/pMoXRt?=
 =?us-ascii?Q?AAJIQKlXBhw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f0QrbBzQAEaeHYCuYqdI0QqAEd3smoQp15K1iPTaFen5fXBrIOkn7KSLjQVY?=
 =?us-ascii?Q?CCoaWunZSKs8my7HDeypVN41XWm2TjS/pqi59sfqj0fji14euCcFTDrY3yFs?=
 =?us-ascii?Q?m3S6T6mMPOtGiAxFDk2/n7iIQ6pbmFvDNkU2NKbz4kQCb05kb5xSHTdJocs0?=
 =?us-ascii?Q?3RuL451EmqB6IqF6T0TpDv+CWXvUTKu4ggIXQPuKMh02k7a/uDLV3RIahvTb?=
 =?us-ascii?Q?n+cS7gH/VkLMozTC6ORsLWBRKJurMJas3E2JsclavPnTrNEXi/q+VoBHYJJ0?=
 =?us-ascii?Q?O2B5d+8I+ejIg2pBMzmdhaDeARB+VUsF6ic9n5ZLORMd1CJxawJpoia3T6wq?=
 =?us-ascii?Q?VfNnpxfGoWdnbEGzWy9Ed3eGpkRO2VnpBRV0V7GhshaL3Gj3yODBtBaYxvhw?=
 =?us-ascii?Q?0OVM8QZh3ffdUxLJ1KUogs1/+PcWF29MjmghWeNiyBHIVDpPGJIWCSKpIYF9?=
 =?us-ascii?Q?w9tiEdOxrd8XcOAV33JLFx77SzQlG0Bjwj5nqtUzAQHrFOyKo/P5ZZLt+EgY?=
 =?us-ascii?Q?VqFXRd7JfIIbEDmLBr2H6h9eSB09km7InQ0or1b+NAsc0b9SE4IELPrBmtiD?=
 =?us-ascii?Q?fpfGXfq+wGPMsbXNVIj7fgxZap3cziJJDDkV2p0ei3Dc+VUaaA/NGgymjKT5?=
 =?us-ascii?Q?Kvjxd8ydYjayn5lV/xXAw3dKRpVR/mKv7JnxkgW8Thz2ADnwDUVqbt9RwN5m?=
 =?us-ascii?Q?0kDFK/1Ep+Cnek5oEenJmotQfzyEmlBhkQA8V8E5d0ZcIT3xgYK2ChiFNtgK?=
 =?us-ascii?Q?YBsQ3vlN+8J9FU54aJUFAkR42kdV9P7AQZjnhM1BzucJmyQc+FGJN/8pMZlj?=
 =?us-ascii?Q?rJQPFjGtQv3T78p2TBYM2kTyw4DflJvtJndJCf1Tfsmzs4YwoWZJWYRD9DCC?=
 =?us-ascii?Q?CcRS3EFKROGg17JIRM1QhVwV1dAiKbNLgHzOB3zQ8+zdKpwIEyGntPUFhMJW?=
 =?us-ascii?Q?HkgLcVxFNrHOex51gCQUAyGYQNlC674YyR18qyZUJX45JXaGyqwKGfJ+xWMm?=
 =?us-ascii?Q?iI0JyuatRNEaC5nQoA1+bDs/JYF8llQhokINoJR8ZS8wR0pVbRw/MaRW1ZW0?=
 =?us-ascii?Q?+3/bbozsdNCcsvS0eQ88D28S/gK0qvnTzpr0RJMkQChx8VXIz87JEpN1Uekj?=
 =?us-ascii?Q?SRgAZKRrz7gbscBXwW8RdudBdbZ8Ltse7CMQ4JLFzRmshKm5i3kR+G/sqMM+?=
 =?us-ascii?Q?HT1paRcFkhR/WN3vLjFt9E9m4ukz9mwksMqF2f4fUrHLZ2dmKA92cOeVcYBG?=
 =?us-ascii?Q?4HkHtngySqOtrwNyezX3mhzLqIto6XuUp71LfqXhSDQtagLRTnbzri/a5WCf?=
 =?us-ascii?Q?1qGtX9uYOoWMfrzbYr9UXZhaDIphCGFGf5kQtb898/japXclrkkzCJTj9gsd?=
 =?us-ascii?Q?+OcQGNPyyNpoxDoio55dtumCBKvWg1XMUJffiiC9A2DQGENjvkMRckgh3b5H?=
 =?us-ascii?Q?wsWAH7a+fnlQEPZhS1plEsBuHNuBlJA1V2yo0BCMoLT5jnRGhW5LHQUFqBMH?=
 =?us-ascii?Q?r4v31ZF6Ehe/GCgwd7UYE1rn7r3Q/jrWDAl/9Jw6HH5kDDmXGYtZhua+hqDE?=
 =?us-ascii?Q?NsHVXA7EoV/uBudjFFJB2Tr2spmVE2ts+ugJjAC2to4tkGJlRaW/CtkF4QxR?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z58D9STAkUnvXcMBjWKACu1MX31EekWybYA8MuqjLtBT/JghHTthBrwPhw+tiA3PiPi3F5EopgxP+dDSI8H0RMs6aT+YNTRDrdaYYCF4ft2ftO3ORKuMuBaOxvZPGg9zqErHslxmKzukHa29Rwv4WxTHVcU1qmO/f1kobw2HYMvVyg/e/9Bxl7DFbvCw78ElcYPgIg+6EsLwo40/gQbC0IqP/goPIK6QEOjw7mVJBFTYzGpnb5kVAXIcVvUtq5YfV5sZWRmonrJS+0zX66PmwYSXJHnZbv/6Vb/x4g+qm4m98d+VNo/4mZXKXcwRSLvaQck/52YNJkHyQQ9dp7B57Sq9/25oMn3ztu5hrBrhi+tBwSo/l4j+zyjROaVk2rvuoSgEECcgTQcEcn/e/C8GwIJSlVOIyl5xEWGOkJ1/OnEDjmr7Vqd7Bxghj3YRZK4cLKJWeL8hrmhSs/YYAcDSuFQkNk9ljyQV7dEGmW3Wp7yl7PFs/WEjZVLfx6Z/DSAg02UCCpQ0QLRyHd3HhUuNKSNC8a87ov5Zc2fQCbUfbYM8PwK9+hkiS2BA0BNyIKoGlmjmynR9PW/7e+cG2H6uMpLlPHSbW17qZnZH/NsII/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f493b6b-61d1-4232-17dc-08ddd504ecb5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:18:48.6635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV/nMsnAVPG0CWBa1hjcRZ7L1+6xyveFUVCVx+P3naWisfiVctWIQ02kkwYn/WwVXI2lMAzzFOlsNwrre3zXhAAPpnoiWgLFb0KQcSwC4Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwMyBTYWx0ZWRfX6NYEY9LoL8p4
 hd/RnaKUewFv/GWX9+5NF+nrE541AXon6PWr1prRAEfiEm9WmLfO2Zvm7yv8ygvbSfguiJ8GrQA
 nNTbxI3YuqErOUgNSjSvvP0+Uz8ZlPnXQsge+F8b87XdyybRaTRrDJ4cnzsu26QL3EGn3gUbUYT
 08epuZoIVYkYOguPLyRUs63TwpvvBuoOXIO14jld9DBpXSrCt2wiVRKvtYnudlO8mvPfTrEc25V
 c6l7BwiYDT+3fUhdieIsBA/RUw/mOHvm0wCGFUuWYEH3bmganBocyJWJmp1hp45FUxS1W8rHtEw
 2E9DRdUEb8dyZCKzGr5cy9hBnTgPNAgMTj1hSH8Av+4r2DmU53F3nFO+uaOEHBqZQERitC7+sQ4
 sSDtdaiaypvBH8H73fOTUb+iKUVW70uVBtJi7zhxRCwTA2kc2JmGM4i4SV6uofW43TBH43O8
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=6893806c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=SIfPi69tsJlqEj1sRJ8A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: ZRdtJ-w_pIjqx7G6kfblpULW9pxla5gV
X-Proofpoint-GUID: ZRdtJ-w_pIjqx7G6kfblpULW9pxla5gV

On Wed, Aug 06, 2025 at 05:02:44PM +0100, Alan Maguire wrote:
> On 06/08/2025 14:58, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> Tested-by: Alan Maguire <alan.maguire@oracle.com>
> 
> All stapsdt, expected USDT tests pass for me. One question at the end..
> 
> > ---
> >  libdtrace/dt_pid.c         | 14 ++++++++++----
> >  libdtrace/dt_prov_uprobe.c | 13 +++++++++++++
> >  2 files changed, 23 insertions(+), 4 deletions(-)
> > 
> > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > index 42f667fe1..4af9141aa 100644
> > --- a/libdtrace/dt_pid.c
> > +++ b/libdtrace/dt_pid.c
> > @@ -1282,6 +1282,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> >  	int i, err = 0;
> >  	int fd = -1;
> >  	char *mod;
> > +	char *no_fun = "";
> >  
> >  	fd = open(path, O_RDONLY);
> >  	if (fd < 0) {
> > @@ -1415,7 +1416,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> >  				       &fun, &sym) == 0)
> >  			psp.pps_fun = (char *)fun;
> >  		else
> > -			psp.pps_fun = "";
> > +			psp.pps_fun = no_fun;
> >  		psp.pps_dev = pmp->pr_dev;
> >  		psp.pps_inum = pmp->pr_inum;
> >  		psp.pps_pid = dpr->dpr_pid;
> > @@ -1430,6 +1431,9 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> >  		}
> >  		if (err == -1)
> >  			break;
> > +
> > +		if (psp.pps_fun != no_fun)
> > +			free(psp.pps_fun);
> >  	}
> >  
> >  out:
> > @@ -1513,7 +1517,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
> >  	const dt_provider_t *pvp;
> >  	dt_proc_t *dpr = NULL;
> >  	const char *pidstr;
> > -	char *path = NULL;
> >  	pid_t pid;
> >  
> >  	assert(pcb != NULL);
> > @@ -1525,8 +1528,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
> >  	if (strlen(pidstr) == 0)
> >  		return 0;
> >  
> > -	asprintf(&path, "/proc/%s/maps", pidstr);
> > -
> >  	pvp = dt_provider_lookup(dtp, "stapsdt");
> >  	assert(pvp != NULL);
> >  
> > @@ -1542,8 +1543,13 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
> >  	}
> >  	dpr = dt_proc_lookup(dtp, pid);
> >  	if (dpr) {
> > +		char *path = NULL;
> > +
> > +		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1)
> > +			longjmp(pcb->pcb_jmpbuf, EDT_NOMEM);
> >  		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
> >  						  pvp, dpr, path);
> > +		free(path);
> >  		dt_proc_release_unlock(dtp, pid);
> >  	}
> >  
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index 8c8dcae0c..986ac0ead 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -795,6 +795,10 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
> >  	char	*nptr = NULL, *xptr = NULL;
> >  	size_t	i;
> >  
> > +	/* Nothing to do if we already populated the arguments. */
> > +	if (upp->argc >= 0)
> > +		return 0;
> > +
> >  	upp->argc = psp->pps_xargc;
> >  
> >  	/* Copy argument value source string data (if any). */
> > @@ -941,6 +945,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
> >  		upp->refcntr_off = psp->pps_refcntr_off;
> >  		upp->fn = strdup(psp->pps_fn);
> >  		upp->func = NULL;
> > +		upp->argc = -1;			/* no argument data yet */
> >  		upp->tp = dt_tp_alloc(dtp);
> >  		if (upp->tp == NULL)
> >  			goto fail;
> > @@ -1716,6 +1721,7 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> >  	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
> >  
> >  out:
> > +	free(spec);
> >  	if (fd != -1)
> >  		close(fd);
> >  	if (rc < 0) {
> > @@ -1975,6 +1981,12 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
> >  	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
> >  }
> >  vi l
> > +/* Clean up the private provider data. */
> > +static void destroy(dtrace_hdl_t *dtp, void *arg)
> > +{
> > +	dt_htab_destroy((dt_htab_t *)arg);
> > +}
> > +
> >  /*
> >   * Used for underlying probes (uprobes).
> >   */
> > @@ -2014,6 +2026,7 @@ dt_provimpl_t	dt_usdt = {
> >  	.probe_destroy	= &probe_destroy,
> >  	.discover	= &discover,
> >  	.add_probe	= &add_probe_usdt,
> > +	.destroy	= &destroy,
> >  };
> >  
> 
> Do we need destroy for dt_stapsdt too, since the htab is used by the
> trampoline via copy_args() there too?

Tne hashtable is stored as part of the USDT provider, and used by stapsdt
provider probes as well.  The copy_args() function explicitly performs a
lookup for the USDT provider to get access to its private data (the htab).
