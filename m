Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52157186A
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 00:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759449681; cv=fail; b=YGT0+PrPmQApeKwTY2B0sh0tooy/aWjeGO3YxCWYOlNmvWEeNA1nBAQpu3AWEOnzx2hxX6fWDD92ymlcfKzmPy3rpWlXPma6N0miZ8j113je5UfsA79R+M5TCc1vRE7UtNiGgMlqNZXcNVgOtZT3HCrzkKlb/xlgW6ch1yaqx5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759449681; c=relaxed/simple;
	bh=IWi5XRkPr63EpkfijVPHdOWjR25xiNXwvtgtC5E9Nhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eCR924JE59sJ8ZK8HbGjT+LCya+kVDPEhNCZt8TDUhkpftP5fNcEbsnq08mpzEjC5hh+R2wD5k3o+xV5A7XRUXU62t0xFFAoeaDj7Lis1JvMFqqfbEuY8yMQotsmxjF+9aLy5i5smTgwR2VExJhO66mUY65UoQF8/kOHj5xojs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UskOLY4P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kDOLJAIC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UskOLY4P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kDOLJAIC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592NuWEA028201
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ybFBjJfh/GWlOsNihp
	xYsOmiyiVou1e87+YFebnB1BM=; b=UskOLY4P2k1FthgZ4tFh2JQ1eBK4tJ0sHr
	lB1e4Pd9JtBwWm5mMq+sMTneIJc/IeccvLSd7kCv4Of9F2C0nS2WNV8sFzPy33uL
	QAYMVZ1PwESHrNflugnQpeNKTmDyYK9k3vSp4qw56HYu5RpnaKyF8glRpowoHNCG
	Ca9oxDV82GlVt5l5qdSWFvTFny1w1vndie6fZ9EWbpQxO4Rsf3iyz1KpgHVQpJ3S
	QjHtpzByap+KnCwNDR+brgwAINLc37F5Im612u0o6buZoUFm+aURjp5U43gTauyz
	bgzewjKlk39D8sKNNaKL5RXP27qesfKSATz1LXSbQOaDv3nLjB0Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmacvaxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:01:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NEJDO029705
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:01:17 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw1ewehh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:01:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjaXDL3C+6DJUD6uIwDyHXcHGDQUxWfej3B1L1SPrKm9HEWNw+NK7WDkGvTngK/ALsicOSqaDYj83r6cqMH0G4sgyzRkeR3RiM+ClObSuoXEIBH6suKur9YKsvz5++M1gCX+4dWT5sKMQ/rUnNCnyLJ12+i4djc583sA6lw0HPVNIEruMX5ALwNpRwk2fx5F7fvNXI+WUXMTwskEuPQpzJcBN1kR50GfA9ZrsGFsTeSgQqBAD1dfh6FlIfS5HNG5JyR99704Xr4ltCgijiB8x3azIS+uoB0C/JWN+utWQZZXr7UiBkfcfe2HChyO9k9ScsTyqDWnha7YWeh5/H72zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybFBjJfh/GWlOsNihpxYsOmiyiVou1e87+YFebnB1BM=;
 b=M1g/WOCAgDXlhjaT4jXTUOGzJpK0uKasnJDV9rSsKyvawzhzC6Oo5Sul99QFpf7CFyTW6q3C0NivEpxQwwEX3D0ODufy0Ho6R0ho87QTmP52KICaU59mDHQZEr965kX/ZtU3hwMvOjIcfI5p2Q3jDX/AzcmqJ6y8rEMWvexJ5YO228/VUYZW4CIxCGOcTNURqAK5gxwQW6R5p6ooNf84yqjz3UxwkRzl+LUVuvlojgFPbEYmMIsDy0muoIZeBVO3Hcq0cENXos5iNveVKRI3Z2Wa85Vhpb+QiggBEJVojYgjzonKdlxWMhs8dcjg0vTmTcu6uk58iYAsvnu60CE5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybFBjJfh/GWlOsNihpxYsOmiyiVou1e87+YFebnB1BM=;
 b=kDOLJAICzfIbBnld4uIVtQSrMwF/M2qLsMyxJ/N+AM8EgbQUnVnYbuFTsLB+Q13qx4vYiW7xS9n2tWsFCxbacnp7LTD19Z5vwU55fEbYLRqovwzYaHPPPwSliprUBt92lVG/C/m3mcuxIvNoDlkrpcDtVrjesVrZf9MAhqDenc0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB6754.namprd10.prod.outlook.com (2603:10b6:930:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 00:01:10 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:01:10 +0000
Date: Thu, 2 Oct 2025 20:01:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/4] test: fix test failure when no
 /usr/sbin/dtrace exists
Message-ID: <aN8SQ3Xwr2chQhdF@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
 <20250918180338.197827-4-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918180338.197827-4-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: d41cf28d-bd0e-4c26-75e2-08de020ff581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PWSeTrpMPdjjEZ3QZ6xXK8+S16+CewhlnvaY9YR5yDRbu0HP0ahgUhDB4Ydk?=
 =?us-ascii?Q?cyYfc82oAaJ5TUldq2wAyr7nGl7rPCUy1bmBsRrfhPqnFhD1DoyOKytgLKd6?=
 =?us-ascii?Q?LUWSARIeCp6NM3gQstW+1Uc0RNFbO3nXo7vNn8za0D8NS5MK+VMO44VoHNbB?=
 =?us-ascii?Q?RFXaAlPeCOuYPvGFwR+rc/Y+YfnY7/edynFpw4FtaxPyFqefwmysHpeChxpb?=
 =?us-ascii?Q?WVo3aKyEfvoym6CX9UJxb4JY42qtVEpQcQz5rMNGuWZ7wo5Wk0pDL5VBlBTK?=
 =?us-ascii?Q?LBsgto6NyF6oOj4HKiUvOtFl0f6c+1g5gKsnSXP8GhBX0MQVAAcHVybpiLEq?=
 =?us-ascii?Q?Ux47qBPSG3Np0p2uVlu4PIfy5oxAd1UIwTdQQa6HGHnWcLxwlfxA4WpbJUpj?=
 =?us-ascii?Q?tUtgW6udSdT3ZCLsdCI2Pv23xdzS7QNBY7N8b9WRcBvDhPBf2S/+eGk58FB+?=
 =?us-ascii?Q?XlPe7IbHRllWpmqg6lrSxIo7eBOaJa3jPLzegnMe7lEc2ajqG9u6b7wdWw9n?=
 =?us-ascii?Q?OzvUeDX0dGB6JL08C+iXQF2IZN5PYBcgfg3z1ZSf9fHhU88xprC+jmrM9Y+V?=
 =?us-ascii?Q?3vbEOIlSFLp4xzQ99Wz6xm1gsxChVELnUlLV5OZZ2Uk6KEnTAhW5qkQ2nLb4?=
 =?us-ascii?Q?d0VCP0j3gOWy1K4I5zjxo9YdVMHftChgyQaofdsaPcKX0wDdzmALbG4ife5F?=
 =?us-ascii?Q?qEBI9TjCfiqEFCxdqsu5CTz/gWusGEDP46uVZjvsthpTGwSycsbB6icCF1UF?=
 =?us-ascii?Q?XiqYeDfAAd9635P9Io9Pxk+pe2u67tlE50QPIJrhdqjuylgiiA9woLgJMKe+?=
 =?us-ascii?Q?SjCA9J5E+5mHPWPj7WIOv3NWFCYmg3dbVuIPevTLd1dMDGz7VTnnL+d1byXt?=
 =?us-ascii?Q?hqmoJnjs8sOVeI6KKm67CSFkBN6aTVZ/Jcb4fxt18+4TO6AJYVyTh3+buAq6?=
 =?us-ascii?Q?f14t6ESP0+NmdX1I8k6I54jb1F+LGA+IHrvbd5YqBsdi9RTLRf9/B2HD0oD6?=
 =?us-ascii?Q?H0XoV/7SjkGmZnIPcVhofLIpeBJAEr9cAgMHp+UVdOaLl9FEswQVNe+PbWke?=
 =?us-ascii?Q?SC8BRFH+zRt4l473OgFXuubB+xt15fngijibqx6BvxiwMAgG5INL6Ggw3w48?=
 =?us-ascii?Q?hyKVuCTr3lOxolzwB5Z3qXMCfBGp7VJWz4kBi4eAI9t9IB5FYo9m0HUx9orl?=
 =?us-ascii?Q?uXVdAraBDKXiHhoQkB9bLAIiZ6yS7nTrJOEE4ki7zB97jc9wxK3ScqBOFtky?=
 =?us-ascii?Q?NRhJ9vln7Djn9F7YVhph93xlxHinbrqZ4YDgPzASbSARRNC5BSC+0Bt1ZDPk?=
 =?us-ascii?Q?Xs9F5qg994feC7TkQHo/VUnRwvQommwQFBZdlBwAO3/tHv/+Ev15zqU/ktdj?=
 =?us-ascii?Q?lQd/Dn/WA6eac2bJD5aopowsjIyZnS4rA7RtRUPz2Yl8d616j0FxxLjGVGl/?=
 =?us-ascii?Q?PezCdOQg32E+3oJ3VEMQyRpH9FwvyfqUP+/Y5Qn+9YZZ5SxWtdqleA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5EPtbhV+36J9dX9HS4MfijA916J5dw0++xi8MHL6sjvCOMe8aZyryKeVq/WR?=
 =?us-ascii?Q?qPv5GZdgpxrfzrGMBxU72TWHv3T+a1tG1pIAypmDStK+03HswOkNp8MR0X3R?=
 =?us-ascii?Q?w6w8eu4gF44SzbfFI40sqnk+HVxpncvZrGRbZsOj1rmRlu73sCBS9uZmoq4e?=
 =?us-ascii?Q?0JYEl/i8FYrb/zJ/PMP0adl2pMtaIpLBZrUFRiBsqZBKv0Gt5lVeiUERnElB?=
 =?us-ascii?Q?DJIRspwL4zvWrW+Um5WxCCmCbs2mJa9KlCDhLDRaTbiNE5sJ/3uibjExCdg3?=
 =?us-ascii?Q?G2ZvFO0zvVvlPJt/GaJTEobfkBbs1QzQBxQX98furZMgOq3CK9wx1vI3z1La?=
 =?us-ascii?Q?5Cfc8fD7Cf19dNRFCXTNWw/XRhD3kTQWv1zzqYqs63KgOf8D6t1xYp1P1Dr4?=
 =?us-ascii?Q?Pp41fTn7SFijf4XjjalLE6++Lkbgyf7K8qvNDorMpdEjAMvryUAqRgywKyFa?=
 =?us-ascii?Q?3gLp1ktKsNe1J7hDTRSW/VtUiCqQWVPSVJIdMKwH0WDVC4qvi8KyHXytTPl3?=
 =?us-ascii?Q?h4Sl+c2ILDPa9dyldMf6TKat1xVZzisXSf9o0f3YyMLdE9eVOjEopX8vv6UV?=
 =?us-ascii?Q?6Ukwn5Y5oLdEewO4DQmYcKSABO8K03eoy5GL1g6w34+/07u2o8AxmWetIiFE?=
 =?us-ascii?Q?kI6jfEppi59TDqa1AG1f5kXVZibN9D5+wU+UUXoHRxQTPSTHp+RAymU08BVo?=
 =?us-ascii?Q?wJJldB95RAflFxNC4HGB8IYZ+zrmWMfxtjejGpdAKQc9SEAXynIYKM1i/bG+?=
 =?us-ascii?Q?PC/tcxPgqCKL3ZYKW14KvayzJhYV6OUoR1DwQD5ULIVkEnKbCuo1Q924gpPV?=
 =?us-ascii?Q?2EFSpOK7oVhF6/+bEpZ3RDdJnbp26cNXTCcd9uRwlVSxWTxiTwjDiWe+alAr?=
 =?us-ascii?Q?vUR9w/l5qTGii7T1D8v0Hv7APC3tpHjmaHW40JtYeYfm+cWT6usNhw6j9mls?=
 =?us-ascii?Q?CPGhUHQzrHSaKfFRyqSMGD/GvozR/L7UT1pHUQXmap4o03KkTq8AwhzAldVH?=
 =?us-ascii?Q?uBEWhyYl57fwLap4wbRx/SAz74g8u2VU+lXvddgJ0SNen0x5WwuiR0eaEyls?=
 =?us-ascii?Q?1Q5rnqRHPaMFgAlqtaM8rxMjA0RGmKH3NqOdnJljFrPvOl4EFwXByOoKnrsG?=
 =?us-ascii?Q?vj4Jas8BAODYKO7iJVql0Quptf14Z4CGZJ2fTObnN8uf33QTsYPgVF/f/zCu?=
 =?us-ascii?Q?rYiI6juik8UFXo+KwWdCBNdaVKr/cPTMUs9axX0y7haN96hbUgqWGBCQslv4?=
 =?us-ascii?Q?scONX2rF1gK83KjGvJLzUty5KWyaevPFrqzfPTdYFhJ/xedSjxzyGpdzXhAQ?=
 =?us-ascii?Q?wv38tx5ZyO2EyeIw3b9yRxS2n3tnAgioE4ju5Mp8eIMhDtEbUb11v0DOKodv?=
 =?us-ascii?Q?B0fIXfgCcIjhE9UGSDyKj98aMvFviPD4TMdK+BgRnATp94wiFLoe/QM/HfI/?=
 =?us-ascii?Q?DWDu2MC2nZZwa1r9b500RyX3NQbRkveMYrHLCc6vSD2f+E/iEMraHcd51AKz?=
 =?us-ascii?Q?t5XMlNih83OBoHKXipPXWD/2ZGmV1QSrZPhzUt8EKLpVzkWFRa1Avh2VufeT?=
 =?us-ascii?Q?sHXXjYjMCmfIZRLnZ6pAaHuyUGNMxSmryrRq1jIKOjDJPjFoTLP/W4Cv3Zn6?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+3ezS/+xgrajGkShkXbVAtH1y6xnhFH/TyCSEs2FqAiRp9v9njud7yRes3Da0mTXMrfDOJf2ocgpWbsAri/PClOUncV8l+HbnkhOh59QgAr4Nih3gzVVVianvrJiSlnkdUzh9D48mGfSZ62NBLw4txhUrmV8DqdeWdqlaAx+Q/WrPCFdd4YV9YbAiO2wym4JqSWVT2Ji6ol53o/Y8/UcPRsGaFe7ef/JXXWwn4+ctY2fxP83rl82BZWWu6eYpc2x/ni8qry/FGhI5Dycewjc7/jMlLx6KJ0/CsFDyrJbII8Ea4796LnOgD6JGWuVCTew5+qzHlYvEZqN21GChT3V+yvsfFrqTCxitsyb7iM/QwPDG/FUXKozpt9iOR7MFb+Gg88V27J/x/2R3848wIdIrbD2yPpv5Ib2XSPU2QNX6aQH3siW0P/qRzNAlgtRVwFKHpdGXEcZopY2Zv2gVx081OijvJkaLycb1DpsvWTZ12X4F76ouAewCQgne+ekErw6U1R9+MdrTB2OlhCwdng/JBM5C9LF1ty4Jn0JQMKl0J7m0F5TMHDm6c7zUlbv94XECYaPNwVCZJhLWR9wO/DFaX5ph2LHJD8r/F/sDxiRTGQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41cf28d-bd0e-4c26-75e2-08de020ff581
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:01:10.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh76awi5nJ0Ncaxbsbqm5Y8d6dCchAx8XwrnqD4DNpWSiai11fdAdEp3qPkJ7h41qLiyLsDRAvtLFuMGpLKJ3hyh86EujWTuxQacwht+MQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510020210
X-Authority-Analysis: v=2.4 cv=P5I3RyAu c=1 sm=1 tr=0 ts=68df124e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bi7MQfGeQkd8CXNm778A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13622
X-Proofpoint-ORIG-GUID: lzSRz4To-PLGVRUQ_i9PYgAiYLRSRlo5
X-Proofpoint-GUID: lzSRz4To-PLGVRUQ_i9PYgAiYLRSRlo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX/HBRX4DSVo94
 RWldgejuhC0f+WaMNyJSXpLCvvgsbXzVccO4xiQxtH1pkUykciLIrPBTCUzoKH7EHddfmjtRjXf
 6BrupgNLzj+IeQlgGU2+/TlGJJFwbCLXiW4WhO2FQHdsaA4F7NhfLyW9OOkD0WzFuR2z30qJtFa
 3lmZTjCocssG9Y494zCW4qnyeO37Vrhalv4j9ATeULKAZH4zV6S4uLJBC/+iz1ECHLqV6bFsGpm
 7TgK8eAaCNWTT4TzFFTnAwFKv3QAodmc2xT8ck6Gvok1XyRtKKaEdy6N/vv7fRCWJ6ag77QqGDW
 XDsVb75vdn9eyN/m1gaSIdh3Ca1nxh4k0tFcE+Hj/fLMyMObHWy2EigrjJc/s1K8p1v8PaVll7G
 pc48M6KY7JulTAZgRTYVT0sqQlgo62EML0Fv4phQZBv8q3vHuBQ=

On Thu, Sep 18, 2025 at 07:03:38PM +0100, Nick Alcock via DTrace-devel wrote:
> A missing $ led to this test spuriously failing in this case.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.exec-dof-replacement.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
> index b7ec5f2dc5e92..81833cc8b77f8 100755
> --- a/test/unittest/usdt/tst.exec-dof-replacement.sh
> +++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
> @@ -33,7 +33,7 @@ provider test_prov {
>  };
>  EOF
>  
> -if ! { $dtrace $dt_flags -h -s prov1.d && dtrace -h -s prov2.d; } then
> +if ! { $dtrace $dt_flags -h -s prov1.d && $dtrace -h -s prov2.d; } then
>  	echo "failed to generate header files" >&2
>  	exit 1
>  fi
> -- 
> 2.48.1.283.g18c60a128c
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
