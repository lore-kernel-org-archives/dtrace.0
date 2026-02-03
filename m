Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432061D61B7
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148710; cv=fail; b=YcyL7ARDRcbsRcYODmPkrQWpPhg6U6qlekmiXGMAyVkeT05RgyBoLt3YdWZKgdiQN5TT3os9NeLKY6/x6QGYVwNB7jaei8zFzr38C2cxi1/BdxIxFHoJwg7QWF1IefjMn68KSX/oMajn+DhgmymqR+mW35q823pMfHMEOc/Ew5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148710; c=relaxed/simple;
	bh=v3DmAd0tA+FLxwBZshV7q3Nk3/K+O/itue8YOvO5A8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mdPe3SsxlZ1jSuclPmlFoR4SJ8cCgUJc4AvwINSu22oT93NjenO38wEHxy/ZUcleIN24yruJr6tL80SKYYc62oDJIAYKQWSdvYAGRRX0Lt8tIrsC548dVZB6wSsOGBIW2M3KwCBA21WVDAThjFlD3FPvSbpaN+3nPLprb3P4PvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NIKhxQPA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jcOqZdLT reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NIKhxQPA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jcOqZdLT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuMOn468059
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 19:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=EHNUFmWsK18rR8z8UWQrwQAoDZpRGNNtLUKD24DDiZo=; b=
	NIKhxQPAs1MKS4I4myNkSbS+yWVxEMQHmawBXd9kA7o28Ogj8d2G3VTDsL6Hj/R5
	ynOS96h0npE5YOu2HAmWv/Bq2W2o3lb+PABPSSwwZHHVizRDWdXkWkx94zkC2Tsr
	y/3mPDdduMmGiofAYrO+QbLRZGA7IbbA0DsiHgMaC9KBWG80Y5GFY3zfn2UOxKVl
	QUj7EAAK0hIuH9WJRwEhQi8IHoLLucsYlgMuS+Tx9c9E+zbNp8mkaEbeIOyqDGyk
	Sc7TovNv1Vo5RMgArQvYMYr0drXJ/BxZgaTbD48ZM4hJv41CmlyYKBu/lCwOgm3q
	gKmBoLP5unLQqMgR8Bfoyg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jm4rnsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 19:58:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613IwLgc001253
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 19:58:25 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186ab60e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 19:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXZQjTYFCJiwvqyzxG/Ha/qK6VqEhbWg7QRmYN4e61ZgOoaCLpdnnlUR0sVbopnDkjql+T4uxFNLYh8+lvFxu6dCtfm+iEDkH5/yRB47gVIqe6VCSVRh/rgButcfA6eGEk+8bQ36H8ZEPdaxxa64uuFqPZHWnxmp9YbHWPv0hZF2Po7in77oge9o/QZJom9fPDOHjMKeIsPRgCUfTOMh1jRLTnH5IQKVDCpnPb9Of34QIe1z8StabrDmiNJSyK0dS7Klab7qbbm7jlVEBB6wTYTnIDNAqqhqMOhVzHi9sUTOBgKxYmnSA11zv4Bo5dwbooLvGSq79rSQMDHyKZf+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISv2aFEeUJeZUL7HDSvjv1txYP+BUpbbpLf79LJ+/5Q=;
 b=kEDDs2xDMw8ZQITDS2JPWQIVNWOZW8Vbp5gupyUFBFV+8t70J8KU6ajz9OEwyVhm2QunwrtWYxkcfIES5UnAV7mMueRSH5z+nY/tujHUz00niS+Va7fOJRxwjxZviUk1AUpb8eM3tCB1w37wz2VW79XGNPulLEqFDaXYYKDX8h78RxMqtx/JdowUt96UCnbixkOSWAZEZfbjKWkABoHug5Oxs8tDdqNzYWeJ1E2VhFaZqIgVJ2gQ4PRGi68Ncf1Rocp91EYDq8S4R08hlNg3/xvly7m4E6JRqUb6RwloBy6/y0PnWrp2aYnhI/AQEeRNNmTxA1d6FlbqDWpSAzGGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISv2aFEeUJeZUL7HDSvjv1txYP+BUpbbpLf79LJ+/5Q=;
 b=jcOqZdLT+hYicqNc8St6tonaZnj5NP1NWo8NvyYMcHwcnjeRaJee5NS4T4kLEAiGu4YVltlVBkj5nwPEjFj+anSYGvvO0WnRPmu6rFWMpD8CPge45zr1RUsCv2Cu2RlCVGQexWchcaH8KOfizmIrJ/SMzRAHoydoO5haSu7uz90=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB6302.namprd10.prod.outlook.com (2603:10b6:a03:44e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 19:58:22 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 19:58:22 +0000
Date: Tue, 3 Feb 2026 14:58:19 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] spec: fix missing attribution of patches
Message-ID: <aYJTW5t5SSApd39O@kvh-deb-bpf.us.oracle.com>
References: <DS0PR10MB75227F1175EC886B4603D47FC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <5f445b9c-ffe9-37df-9e86-a6df962c00a3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f445b9c-ffe9-37df-9e86-a6df962c00a3@oracle.com>
X-ClientProxiedBy: BY5PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:180::44) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: d26686b9-aa8c-49d2-1e32-08de635e95d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?D2FsZjOnKvpZZjGljSPPURGDrtSz3sQo+wtXeBV964y1OpOSVeKjq2tumB?=
 =?iso-8859-1?Q?gnvRpYw4WDs646CrrHZHkcYmuUo4iEKRvLQ7ZOexU7XqMSiEjY6P+xe/zR?=
 =?iso-8859-1?Q?4M//LeSMOu82flinTp8HhbDckw2bGZ9FEBEvwbig9EHFCUgGXdSnLHDVYc?=
 =?iso-8859-1?Q?zAx1w3SY2gqWiLbALcZS+9uNWDslQxa/8JUI9sfn/HY+a8D8OfrP+OKe48?=
 =?iso-8859-1?Q?xDooFOap6eLlyzwjF2XzlKVu4jEh1UhNMGC/J509Sax6rWafrShkZiicyO?=
 =?iso-8859-1?Q?mXoUuAnY5Agc68bkOmde4czpqT8S3Zw5pjChb9wkugG99haaKLB/tBxqyC?=
 =?iso-8859-1?Q?AHFR5iI8xo/ET87iHMpjVnLRuU5UH4TYwKWUUDv29RW0CoKDPrI0B3UFd3?=
 =?iso-8859-1?Q?Zlv6rWrxcUjUnCaZYxUJNrmZmWqSv90dI1jaJSG0WhgN7A4ZhqWssGvuyk?=
 =?iso-8859-1?Q?bTZnmF6k+qrriVg2jrKe5oEJv0WBaUYKjPYm1NeCRvlW2g+/jdRZLN6rMN?=
 =?iso-8859-1?Q?c5s7qaZpcg6GbjU71GQWLniEIUU/+b9lDVXzH/KE0CJkv7DGQlfZEAsS5s?=
 =?iso-8859-1?Q?Ao8D2I7XSvTyxjJV93PkHyaNtaVBe39e74NfwsSIqVoCToDFYIDTh/7+ze?=
 =?iso-8859-1?Q?Jl6JEleqHFeo6bnjpW+QU2qS2DHPIXysohdvreOUXYhA7h/GV9WX9QdLR/?=
 =?iso-8859-1?Q?qtSn6u2UC+kBJq1ntq1889Ixs5EWXeDWaEuey1k/M1mJu/6p8sq0IUe1De?=
 =?iso-8859-1?Q?hDII+jmYD+tX8bfTe4ssTFzqv5AjGSXN3CqIKZOhXbZ+MkBFGy4pC0c/l3?=
 =?iso-8859-1?Q?7lkTQOJ6WsGMhX0qwgSr9doZ8dV6jEcBsE9cmowVnC6U/zO+mDWoltwxGK?=
 =?iso-8859-1?Q?hiFbSqmpoMZkL5fpRxm7XdDx33dnLxZt+/n8L7wRzX3DQ2pfZQeA1RX7qy?=
 =?iso-8859-1?Q?T0kAnNlfqCKT/CjBN8lRY6dbD4nCCGWaHrMIVVVfn4EfWSH1eArA5w4Nvr?=
 =?iso-8859-1?Q?PdKOmxHhbBzNktDexzJFmYNc/rQbXXi4yOyemtfKhdSvas4CJ3fVfUvPoT?=
 =?iso-8859-1?Q?h+tAcFljCD4crPNCUswium9ouWhzN6zL1UIM/7tze1BjIMFoAO/sv2R8Zk?=
 =?iso-8859-1?Q?zZWqLhkvHtNTMJSPu7mK76FrS1TVcU1NwMq+71er1nTsISzMdjOMquR2J/?=
 =?iso-8859-1?Q?+BtiXKunMQQfifZqCPwhtPxp5x8kyKdTmT9dZRxvWn5MKcZTenWm3S/nUa?=
 =?iso-8859-1?Q?dU2R75XGVjOILq1Bg08OMaZdJLueFmxMclzh8cCg2cGod5d8pb8A9PSCxT?=
 =?iso-8859-1?Q?XmmOTyDO602oM0TtHuZa5aUtAG+ktlL/WnWmTNwv02QiS+RcQgiDhtvtR5?=
 =?iso-8859-1?Q?Q7glni3Q70AKjKaYkw8cXiseWrv8SvcYIe/y/yFq+kUJ1abR/+18sLAjqp?=
 =?iso-8859-1?Q?UZCNZors8eGfo0oejPbg0j6YHbj0Emac0l06J9qdHAYKDG6zYZKu/M4z9U?=
 =?iso-8859-1?Q?QkuJo0AznXAmFg1AcHBbRhayFEx10X+kbsfuiRAjmLLIPiswJlDto+TEca?=
 =?iso-8859-1?Q?jNZ2uOreN9maV6/Lp9pAMvOknLO+cPRHixcb6GypBJUl4WvHKbPfMj+Z2n?=
 =?iso-8859-1?Q?rp5ga2X51x9yM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?tCarxWpuFOD0XDmO1wwRJtRDpuiq2mQ3f92UV5/nfpLUl1rGSNyALM1obi?=
 =?iso-8859-1?Q?9RyXGQjJ4GaYH2WGP7tBkdJc4+lh8kiWGSL48FDChudYQ/KJbfceOWqgHj?=
 =?iso-8859-1?Q?Fj3oKl59+9B28z31k5h3U84Dj6TkZyAQ+7OFZmBsC9WGPYzMEB8rWbQWhK?=
 =?iso-8859-1?Q?1HcyxHRmq696c0eveojhpuite35MohhFnk4MAfQxUUIKS1QmD8zO8/JwxA?=
 =?iso-8859-1?Q?dbVjnNzL+zt/oVykkBOISFtYiZFVY2SXvJ4YLhQJHS91Zv13s4z/l6NwuW?=
 =?iso-8859-1?Q?DRYPKITdsXGIkeFK8EH+pUQIKgxlMjm70e4Y9M8/6ViDDy9B0TxT5qBI7t?=
 =?iso-8859-1?Q?7vNl++QdbDtP2nVYd4d+LdHcpjQRTv/UD8t3vOKIJ+95f4bsvjYkBhvSFI?=
 =?iso-8859-1?Q?wn5PzbxM7w7bcfq012wATERypGFa8ksBeVR0TkZlCGMn21CPoGPcKrFkPK?=
 =?iso-8859-1?Q?BqHFf19ebpb/SPL5Js5Pp3U/srsqUlX8SvQidv6nHExC/YeFSJT4yjQYM9?=
 =?iso-8859-1?Q?apb0viHbA5G7zEOMyLv8AAO+sQYEoqfvgJipxIYwv8enT+l/ARJCwmEVzq?=
 =?iso-8859-1?Q?qmcfVJlflKeU4mGJyTU6NklGF1KE/31bpqHB4bwrOlkL7XhwFRT5M4gHuq?=
 =?iso-8859-1?Q?RJc6FXTlM/OW5mB33h1fBEy+Ni0WEDhXU43rwKrAZldtV2YGMapHEwe5qG?=
 =?iso-8859-1?Q?I7Q3IkjQsJ0VR6n0yPvUi9EopNGduQ8XLs28tusY509Uy/GLHWNPwgZOKH?=
 =?iso-8859-1?Q?jyMhzXE5ceOGSLZo08r1w7L3qNhrnctiSB+S5auvtM2LEL4gwy+fI0pWXz?=
 =?iso-8859-1?Q?rcY5ICLM1HdWu/iM7/mv9ARdyhGHk4zQCSW5rz89fVMLYNYFfWmgW+hv08?=
 =?iso-8859-1?Q?4rNGUpeO+AclaSB4QmPWafLJGfDpzm28UCurs33P5nkdrEshpQR59pQeA2?=
 =?iso-8859-1?Q?qurh/KNraBd6am7U/oMpe2EfJVZnSYbjG+1N1bcsshI7BqdgBeI7Hy2b+7?=
 =?iso-8859-1?Q?TH3MB/jSkd6vG08AHDa47JqV3LgKA7hyQAR/ARbt70Ze06sBcIjzWjB8zU?=
 =?iso-8859-1?Q?f5mAxLWPSh1vHaxWKlGYBpUnz61E0Q/c+9TzGirWyeWmamMUyVnA1jo6MY?=
 =?iso-8859-1?Q?dYO6su1TALCDvy/6zApqgUhPUKEBhBO/c+QG7nSDHA7wBtgddP4A0GV70m?=
 =?iso-8859-1?Q?oZX7IUY7KyYGiJ4ySFRJTlJMY3MtTobQiZyZ9dcbLBR8d4oFmGaa2SEewS?=
 =?iso-8859-1?Q?jyUrXbjXfe+r1Dj2X65Cin4yENEUyRKDLdDeq+jTSMu3ZOx4CmoNoHkRXU?=
 =?iso-8859-1?Q?qavOwbhmR2pzvC38+M60O+xw4MJLr+KxI70CtQXrWSQ9HFqiy1xZtOtMRm?=
 =?iso-8859-1?Q?P1Z/5JqSFWPiPBp83eX38mcf5m/hb/O+cbtGDhZOOftShFouBZbt0ckJkv?=
 =?iso-8859-1?Q?XvD3/CMmq5AzimFWOc3V9PH30xH1NPhHagV9Iy5HaAljS8p/kaRVBLFEda?=
 =?iso-8859-1?Q?bS0ydLz4AcTZfsMY2ZfEwE/HY2xABmmBfReS5pEJ/xXTYHRhrrCxvlTZZ8?=
 =?iso-8859-1?Q?2Wx7JXFor5od/G44/OIEEVbcMOL2DbRZN0TGWpRlP4PJ6krb9UvL8xbKMe?=
 =?iso-8859-1?Q?cLoKAOF370I0xf6OtpcZnj1twRu3gPV/7DpZAwR6hSprjRbgDUpDPuWTHd?=
 =?iso-8859-1?Q?oPknDkgMFVZkz30n2x6oiqPd2HF9mn2C6Aobfb8+JY3GZuriAD4SDGS/aQ?=
 =?iso-8859-1?Q?rh0mSdI6Cslx2KK4J20cz8uN2RDgd10KQ+RyC8EWidPhuHLu42vXZTAZut?=
 =?iso-8859-1?Q?K4XNgAoHljTBFfVQ1PZaWouDqc1UpNk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	72rXXglN4X+pR5SybEHIUPvt0Q038FUTlHN2aahhojq9ZRzvF69D6W/MZ+A/b5aHhsVqgtWSLt0qrWBq6tCm9s1I3mV78z6DFKxDUrF+xLgmWUHQiZw2j7qXmv4A+mtKMqVjy8PA9LFEkKGJrRM5pYKeQqjx08FoLKYFq/UyowjttxIYFL0TVrVkCGRncvODPRuqS2jvXVmQJcIJ6I3Q3yirkUkWkcnOr8RMaiB/ixJZfPxs7KKAxPO1hTB7vOc14MNX42TT/BD4qGdqwjrDT1jz4+jpeOLB751tjerdySP4rTMBdWoLagfEw3CKEIO1o6xEaWJRnzkl+qugwnV60Rc59PEMfkmPfZEQCbcHxLyx3KrN9854d7mx539J3c0k/YBD0gayA0sgpdg9UKnUfB/RJp4XTmcMpOBRmvAjDQ2wb3QQjinZWRZT8U3rBgIgWj56maYDbyjHQiQGLEWNW46WizCoLPmOQ+1bJG1FFXn20eT4wSaVEZ3dc6rT3pe/hB13JIBa6D691rAmfp7h3JZB1Q4y9Hyu27sG5s325GJceGchnqwRDigRqdljmQm87/nFF3U0I1eDzlPB0ElpEGH9LgEmktnBTTdcN+GldYI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26686b9-aa8c-49d2-1e32-08de635e95d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:58:22.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oE+RIv44O+/HjFQ4m7AZCLnXEIW9vOJhn3muaNaZeOJzbbCXlN8zRM/zXKEDV9KqGrdUfxaIUwhj6xOFJtvzNJqw45EgKrKnvCuLpdDGGo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6302
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030158
X-Authority-Analysis: v=2.4 cv=OuJCCi/t c=1 sm=1 tr=0 ts=69825362 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=dr08fNQRCmx6TqrmH78A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE1OCBTYWx0ZWRfX0oYdW1tNmXJS
 ODa8qrhDuMJlDf3UQFRjOcQkr5facfsTZpAFNoVadCEztS6owCDCRwFxJBceNKJbfGLxoM+nu03
 9mZ3UmH/sPZ9rXhN4QD/jNnt7PT23hsRreD3uGZKIIUCOVi0Qor1HbdDuTuWEhaCKCSREp44K8K
 Gyb8iTQzNPht5m582YleQ+tNjuTJZevikhPDBqpzKMc15StoU8T3+BX3M3j8iKpx2x+zfqLsM2+
 As/O+Oskie+pv53mpXv815f7lGmtkTjkjMqqdWmHmp28ZKoOszY0B+SD9FjFTqL2ijGijUv1uIf
 8UFnZVFPzAyAkKPc8UrbUbdQ/PDt+asTVSGy8UtHwo5k85CIaCn+tz73MAaopL+/ZgH4hHnAqJz
 B+bXa+MEfgRtTtSJj5r0yhC1swtW4EQukkUvkzZiN4KIvjkg+qq82GDNgefqvE33h8A0JIFZrN2
 s9FUhXFNia7X4FxH7XA==
X-Proofpoint-GUID: -E1BvesR0GEiKEeAbr4145FIs5SNSxVz
X-Proofpoint-ORIG-GUID: -E1BvesR0GEiKEeAbr4145FIs5SNSxVz

On Tue, Feb 03, 2026 at 01:38:38PM -0500, Eugene Loh wrote:
> Oops, my fault.  Thanks (and sorry).
 
The convention has been that the entries for anyone other than the person
writing the changelog get an attribution.  So, those who do not have any
attribution, are owned by the person writing the changelog.

> But why are only three items fixed?  Presumably, the other items should be:
> 
> - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
>   (Eugene Loh) [Orabug: 38776929]
> - Fix prvname so that both rawfbt and fbt probes are seen.
>   (Eugene Loh) [Orabug: 38842114]
> - Do not convert "__" to "-" for stapsdt provider names. (Eugene Loh)
> - Fix printf formatting with non-monetary grouping chars.
>   (Eugene Loh) [Orabug: 30430270]
> - Add the DTrace Tutorial to the git repo and install package. (Eugene Loh)
> - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
>   (Eugene Loh)
> - Update LLM context files to forbid "if" statements. (Eugene Loh)
> - Test suite weakly pulls in kernel-uek-tools to get perf.
>   (Nick Alcock) [Orabug: 38064413]
> 
> On 2/3/26 11:23, Kris Van Hees via DTrace-devel wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   dtrace.spec | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/dtrace.spec b/dtrace.spec
> > index 6f0b0135..4d470cf9 100644
> > --- a/dtrace.spec
> > +++ b/dtrace.spec
> > @@ -231,8 +231,8 @@ systemctl start dtprobed || :
> >   %changelog
> >   * Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
> > -- Implement PID-specific uprobes.
> > -- Allocate the buffers BPF map to fit highest CPU id.
> > +- Implement PID-specific uprobes.  (Kris Van Hees)
> > +- Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
> >   - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
> >     [Orabug: 38776929]
> >   - Fix prvname so that both rawfbt and fbt probes are seen.
> > @@ -240,7 +240,7 @@ systemctl start dtprobed || :
> >   - Do not convert "__" to "-" for stapsdt provider names.
> >   - Fix printf formatting with non-monetary grouping chars.
> >     [Orabug: 30430270]
> > -- Discontinue -xversion=V as an option.  [Orabug: 38615307]
> > +- Discontinue -xversion=V as an option.  (Kris Van Hees) [Orabug: 38615307]
> >   - Add the DTrace Tutorial to the git repo and install package.
> >   - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
> >   - Update LLM context files to forbid "if" statements.
