Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5822129B
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 21:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461884; cv=fail; b=Anf6+iQKMLDcGWlZDfbg4nHbQ5uk6drnDG7uNKumtpYdmEbqwp9Qk0v9mKH3MTLXtyyI8lXaKYPovCRxEzX5U8Xq6vWzXTvFhcdBr9nlo+/pzZQGa6Cf9p/ilYWo70llz53xN46xsp0iaESebXZYoiqm8tv7wfvHB+Qk+0VB6pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461884; c=relaxed/simple;
	bh=dDx39rN9RPOd5iSGztD5aOzbhUwkeXChk/8ibcXMLIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WuRfuBP8vLocaZtZ3bc1+h8KItg7qNodYBv74IpbkuE6Mayi++CfwcCF6yL4PnS8z6+s17IhrrCUKzbYPzpOiMQkb8QiRYyL65Rh8mhPACE1NuRtb61+VVgzUYo4fTIejKMjEO7jTQM6aMmJS9DmyF87JQJBcZYsoSdPmYog8Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NQRzBeKs; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d7r/qdHP reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NQRzBeKs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d7r/qdHP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QH7xK2399623
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 21:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=x10p898LiePzPmRwZ4YpDNkBOYi5FSrPHRubbR9ssbg=; b=
	NQRzBeKs/t4E1o3NndSPu2V3EaRQUkOgDBhmyHmH+nP1UlkFLDz00y5WudTqfT4N
	9qcgzhLaWv7HQYPQ+S33kQnR7lQ1dMGJnVgH8DfaEv8RhxCoRpyY3leGFWf58Q8R
	Tv+1gAwxw2SUbDm6MiU1mPRl7u1J9gSJYGyRedtbOdhGfuLxPMezmQRR0tR3hj5h
	61PwL6T9oq+Q/gX++lsoytWw+xOWAu7AVmQwd8eTxOUY2SBMGcDMhLj9xE7Wyl5J
	fM3IVTjE4KZiHWPj+zi7CnUkM6atW9JFXW2k2sFNDOszxNK9uEw1Nifg60cuiiiP
	0JNP+dA2JDrdm4/JkGi3CQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvny6tvur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 21:11:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QJT4Ee019842
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 21:11:14 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhds8v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 21:11:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COQkrizI9BnGmIHQzYY6BQDQGSmpKzNzzlqmUU+ueF2faa/R0KBj11G46kRgBGY5rQ75KwC7Zq9WY/7dFHc5qu5qs5xArEzmivhThRRftS0QSK/xFNLwf9RyuRrkeGXTdNN1rGMzCRYBAKeQopsAP5zBZUHwVrkTEn/zuf6KKB4VdQU3FQRfnSLZcYxwfCNPmsHpuxZ240nOhSlYbaPuAtCBJD+MvBfgRAxbMDv/iZ7Gp57UOi9hC4wkagRGKC4prC2Wlf3WFPZi8mPZ/qvEI2/fWFwo1zn0PI2UuNxUPK1iJCovCBNUr/VYg2VgZDqZ36+0cYqzR1grWJ23izY+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBbfShAkIyYDOO+PhaIYxhrfVwLsNB2rwDYkatojqFk=;
 b=goWY/ZW3yJD0G3aN4GSjFnItAWEyTqtHgw7fK/SF4Uu1DzAkxayk3KUAV3u7xpHALKT62sPkGUiINnB4IT8tNyLBJJ9fVrEXTHQzOKp5hELfcpjh2PTUpQe+2eKCk+aNnR+Qw3F7xokj0ys1wSlFPgRbVafo+jPBXSKL1nmmmJ65UrZ+aOXtnPkKf6g574OYHFp2D3kHNGtjAOhuCt3cgMWAbOIFOYvPhLYNe3a9bxClvaddfcI97eVRKv6o5Q/A4sEMM1CQ3fz3fVBlE+irgo45BPSzTNGZbJLYUjszLQ/tgEkFVh7+mwW2HK0epKO/aS6FADg0tGIKXB2xNdcdTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBbfShAkIyYDOO+PhaIYxhrfVwLsNB2rwDYkatojqFk=;
 b=d7r/qdHPA2PnMQLSF3OzvW9Ix24ARgD/TitCbwkGmLuZ83ATAZ2s79UTgBxi0XUrc5FugL9MC+8wMHafWbt9ZkBWKeXFoOg87Ml4BLBn2fXswZ5UKwkbnygi4hxiT2aqW7L4gfdVnhv5KE7G4CTbK3g0upopkB92OCLX5VOWtgg=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH5PR10MB997740.namprd10.prod.outlook.com (2603:10b6:610:2f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 21:11:09 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 21:11:09 +0000
Date: Mon, 26 Jan 2026 16:11:07 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] rawfbt: prvname is not properly set
Message-ID: <aXfYa0QXY7fHX3l9@oracle.com>
References: <20260113214205.9159-1-eugene.loh@oracle.com>
 <20260113214205.9159-2-eugene.loh@oracle.com>
 <aWlnowR5WC8zzdd+@oracle.com>
 <cfc4a3c2-b2b3-b912-f53b-1a995388db11@oracle.com>
 <aWq1YWvbTGl7nJni@kvh-deb-bpf.us.oracle.com>
 <7631d4ee-49f4-d757-d1b2-705fea0ba8d7@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7631d4ee-49f4-d757-d1b2-705fea0ba8d7@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH5PR10MB997740:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7ebb9b-041d-41d1-252e-08de5d1f6d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?/XyYVb3TaWywKLThHL0vzoiA2A/4N5bLbA/8SHcXxQHMNFCrNdP99DSkj8?=
 =?iso-8859-1?Q?PyXnzShVrtJ1BpE6+jfEoLsXUXufrf0qhnp3G6WCqjiDGzJjbydo3HzbHG?=
 =?iso-8859-1?Q?9Jn0/GmghNRpKW/XueUY2yABxr+OdPiNuoTChcaHl3JtZO1IKPsdaSEBv2?=
 =?iso-8859-1?Q?XL+DTG0JYDwRBDoVwOvYWmIgazYASbmOCvam9F2gm79+7kJopxl0o1c0Pf?=
 =?iso-8859-1?Q?02js41+zm7ZZw0hqEY15AacFqQ2pcvpRFHgsLGirshaCrITV9h9w79ZVEj?=
 =?iso-8859-1?Q?ITrOojzVjTwUk+uFyIYMVNkLzi/JaMPSDG1/pL+vw5QB9rmpC2wE6xWJq8?=
 =?iso-8859-1?Q?pB+qzf+fqVMScaAw9uZ3/reMfXQJJ2ngyB5Grw4g27aVkAdb3K3er3YI+7?=
 =?iso-8859-1?Q?1eHvFWFEpqUBNNq1Y0Qsn7mH+pKrTqfV46rezI/h5LbYUQdZ7u26dc7iCA?=
 =?iso-8859-1?Q?nFQfe5CT93+QMe5kvA+Z3Mq+CYCaC1WFw5V3pcituBYi6FPrcqkNRSRaet?=
 =?iso-8859-1?Q?JTPQVDBnzpWYfzYoHaLdVhyi6Lp89KkQAhXxyWVYQeRcbZ82NfLA1Ie6Qi?=
 =?iso-8859-1?Q?9FFx4CbSNVxkPAbWSeAqOAmg06CMPG4G/gmGmgBSwSEdjdv37KGbBC408d?=
 =?iso-8859-1?Q?3c8SP41VnVy3T4Husk24EsTRmxKJ3LRwDdqANHwRPGvZa2iFRid9WjX/fm?=
 =?iso-8859-1?Q?fawtR7Ck3RFkadvWTJRL8oy8yiwbK0cBw/VDOuk66ubHjep4NIbQFvQAWu?=
 =?iso-8859-1?Q?ZKJxadzJiGZWrFWaQVr68e9nfuEAQSKccqy6RUfLl5KXTRMF2SDtxYGlbM?=
 =?iso-8859-1?Q?ZyLaE7fbidneEhLrQ+XnjqezoFUBAAE6jEcrWv44sW4ErIXSkz4xasV+yA?=
 =?iso-8859-1?Q?Fp3gMmxVO7riscYr8FOolYD2aYfGFGsvXLOL920RoPhkjMWLXcjyDEDArx?=
 =?iso-8859-1?Q?7jAJ2bEhydUb2+Gp82u2v08GaB4ulvQs4LQUAcWzPwcAuh846glQUXpJDh?=
 =?iso-8859-1?Q?aGLgR3CAr8Nq6IPkOCqSBzV1kLXAzyNtvVdkPEoWLU3G3ormkvZzt3rQkc?=
 =?iso-8859-1?Q?8apo4Ii7edXYjfoUEE/aaaBt5/kkOrvJNmOb+e3Rh7rjEWgzNQ3t+eHJ6i?=
 =?iso-8859-1?Q?XMm+UtkNd6aPcRWDPn4UXlWqsAFKFsM/SnorCOullpCRfi7HBy1y/QJN4N?=
 =?iso-8859-1?Q?vkTEo/1cv8RS7Gm3ULC2E2DXA603oWSR4X23pC9k84czcZhCEzVYYu2ZJG?=
 =?iso-8859-1?Q?wGokh7V6y4eZWcLmcppZixqaASHOxAVsLA/R+DtLNU1rE6soOvqnLRxSBA?=
 =?iso-8859-1?Q?yglTukiu7lV+oo+s2eUS5w3qeEtnL2oZDKbo9+UZbYNX78gFT4p5G+Wk6q?=
 =?iso-8859-1?Q?cUn1bPpCQghlzllKdFB4SBDmZmrocbAKNMAfJPXW+1bpCLIbikC0M9V2W3?=
 =?iso-8859-1?Q?r0p5ffcC5+PF+kl2b1IRn3xKtayvjcCTWpKGFVKKdbOi7m1ZH+elyjdH/c?=
 =?iso-8859-1?Q?46fFeEMBWTBU5jKkbjZmK8kqfK4bdDcDS1PAT7agbm5JWMrfqlrRxXKk2I?=
 =?iso-8859-1?Q?A915vn6V4bl6LIz76qjtvdycx9hI1hdVL6R7W2SwKI0jAzy/Mg9WJWPrTs?=
 =?iso-8859-1?Q?Up5So0N2KzVKY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?v9DbYYRtLPZIXIQfSaVoJlYlFdP316gvDmfk3Rc/voSsd5FZYdmOpXIcV6?=
 =?iso-8859-1?Q?6SUQECtwhqm8UKsrvuDHPeGTTyqReneiUew2zZpxR2xFP7RIMCj1w5z6rt?=
 =?iso-8859-1?Q?YpKngIrKKg2nSG9V1fUcQLJ59OPRZKmQHFmwvoA7crXY9hYC8hngZO+uuD?=
 =?iso-8859-1?Q?53IhxVlzk4oqoPmFYbCu6U/k4rXpevSxvtdzb+IHzHF4rHy37jMiBo57zW?=
 =?iso-8859-1?Q?SkwLLDPHSGedklmBEcbwsaPmTzFyzs6B60F6HeQwz9NAmnngurEEfXhHeo?=
 =?iso-8859-1?Q?AWdz58LICe1Sl84duiTCC6MmmAQC4Tt5uHs6UHBi+G2WICta4bxvCr9Z7K?=
 =?iso-8859-1?Q?N2g2wd4d/a5tzEDeC1t0Ju1IYMf7yq1yAWtAv9isg2jFCcZIfGdMBB3uCI?=
 =?iso-8859-1?Q?YrPMW6OGUWeUGmb+1BXF0w9+b8oT+LEBoPpYghjTvbRrUHn6CEBxFIsyeu?=
 =?iso-8859-1?Q?RoAfEwto2VzVAJEmRH+dAXemwY5DDqhzxDU4T2S1C1tLeGxeTdhkWcx3w+?=
 =?iso-8859-1?Q?BecEnCl927QeAslxRtGTZKDbTABnr6Di5bMq7O0z0qXmNTYgp15M0hOp5/?=
 =?iso-8859-1?Q?lHO98kisWAUsdFfYfyKJZrufHSGdu2j8MLHievS2e7ccwn8IOtsr3ajbTS?=
 =?iso-8859-1?Q?I7f72dhJEoZcQHQJSc9eEaJkdJjJM6EA8SmMoX+dXTBjmRDmkCSIrRWm7L?=
 =?iso-8859-1?Q?heCC4nuxDKMRLLw9abPDhtlTbkqov4dAZwE3zAfB3vPgMOtL0cbcZ150SC?=
 =?iso-8859-1?Q?m0/8VIXs3vAvd4K6cjVOsBTZ9eoavRw3K3U3yGdvzzsyeEk/EdJn9EfRVD?=
 =?iso-8859-1?Q?zIMOeVcVv9P3gj/KrcAGIwLgYenp3lMIMh2AxoTwcylgmn0YzYgRnxaYZi?=
 =?iso-8859-1?Q?eBYRgrGEB8f3PhQ0bBiLdffgvjrHF7hcUVYRURW/pOk8KDHEi4lH3hjUgf?=
 =?iso-8859-1?Q?dfOywpra4dScciHkTEm7DcdK26V27Vvz/XlZkK/xEZ0uVoMtoZ5Cg0KF5N?=
 =?iso-8859-1?Q?zRHS4yKpf5bEJeXnfVOlP7qKSCbmS+FHPulc8dXxrJ3nzudv92ko2offAa?=
 =?iso-8859-1?Q?WeeU54AwpheeQuX5pSC2smm0tX5w7xqP3Y+qhIkeJ9QotCcIGiNmqNUXiB?=
 =?iso-8859-1?Q?La4l0ECNUHYL2g7rc7FLciP5/oFqfMWeZjovBtYqQZHK4gcRQcG/ZGy4XL?=
 =?iso-8859-1?Q?vOVK2V1F9WcPeWywqosjEUPIiTKpm8cImxAytiwzE0MASp+uwoZqFUr4Kb?=
 =?iso-8859-1?Q?vRSGX0WsjB25YOghViB9X8TjlYwEtYmH0F0EX9mL5djoLH26TsyILitBgv?=
 =?iso-8859-1?Q?BPdZNjEe8CUhi5qhcobO9ZPLfBdFrilpH2ovFvMYO5tafwukmsRywaYaJd?=
 =?iso-8859-1?Q?p5PEr4WoxP+8/ogxCOho6MxYM+Vwm71MmCbGGEFFYuG+Nl9V5mhiSPKqSW?=
 =?iso-8859-1?Q?J+tbUJk9yZto2d361QJg9ZpNkY9vx8z0WRBrEVtp8/jfUqpDd4cO7OJGGr?=
 =?iso-8859-1?Q?yua50LfNnm3lrDjqQzvXYMJAejw3r5Y2k+7GlndVqwtjGEveICUQTUxVhF?=
 =?iso-8859-1?Q?ywnFl+d1zLe58+ttdtn2bJLWQHrB2FuRsP+/dA5Tyyow7IJtRhgOUuhYRD?=
 =?iso-8859-1?Q?tO/sC5XUFqo2kPCv1BKYG0TTLJvdKy88ZPvAJTexAfWR2w7wAF0XEHvv2t?=
 =?iso-8859-1?Q?x5NiYGTCQoh+SLA4mhCRRFNK6wgBt/zX3AUmJiTP6+2dJ01iLrrS8ZG66C?=
 =?iso-8859-1?Q?VCB3f72zghD0ND3LMHuLAQunPNmnCYqMjMlpzhZnVLfgp6wy0lomn3mhFQ?=
 =?iso-8859-1?Q?xVYGyWtDdA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tRYlhEcPksA6uA/LvRLmB7LgigqliXUyP3duIvOMGDhC/h5RcGEb4CWGgQLicEhH17xwZaSb1wCleu8jkG5GDZ+2YnwRVKdWCC4WYvLwu2V72/j39CcRDQByHLnyd6eUONBwL5/AjEoa/Cjo86cBi9Bc+jZe9JrPLsB7opAJf4N3DXpDHOyZwe+wV/BykNXVLsMOwKcEyHPZrreXrLjMagdwRbQM2YMZ40Nk5Vb4a72ucEeTCYQA0Q5kR2cKHXG7iqZr7dIvt1aADAwsmjkatkWNUo37guRgiAR1+lFYgY88xlyRWi/ih2MimVtaLPnhBFJ/cpIDNC3FT1KZl3Gf14Jo8XiBH8XFgr/Pw9xbHFXF2uBxwE36xSXwoSWqag+XZQIIwdVUgLQlf0i51dVNpfhvi/mTUfDH+6nLE2f55ChwB5wosJWnx85MSIbRkedtIwEaE+uJPRv3TXqBzDSdbnoWSKhJ0VOpJBA4Qg0evoocqWGvdmJb6pfgHESFDq6FmMCqY/7Ala2lt/2n3HzjLa/O6/ysiC2Po8ALxtscCOUUSMt56yCpTVcN1UViaxHxF3M+0+wsbEk0TqtDfKeaP2cbBidVSxDh/9l6//N14j0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7ebb9b-041d-41d1-252e-08de5d1f6d68
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 21:11:09.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXMtRpmScPZ++wBymhaclCSOBNNO5qCpZTsor+P0NiF7afE35k6CGC1XcVRGEd9MpBPe9evYQMCohlraMOzqImGiqKQ8DC+fKKZb66Wth+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997740
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601260181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE4MSBTYWx0ZWRfX4yEuiYgJ4hb+
 VELFoUoOyrtt3o/Tvnl+T0IJW9GTZlf3uwst1nZN+KI1O3/goGMXs2OY+VdFdhTiyxAi6a60G06
 rw8nQiZIGZuJmcA+4Cd84Jkjv8jIQQiSeveN0FXOPCs1LWep1hvWvC53N6sX9C9ojgLWF3a2vKq
 a1IkrO7Ciirq7TBWEQAXz5fG7tvOwjjyQECWPZZSoPwKaMqRn2DwlV3OJtcZyJxBA1C8H8ncltc
 Gg8tgVw2tQ3J11OhX4z6U7vGFNat7T9w/xbPSoW0gQxhpCyGorBA/g1aWiWVgAKWr9PPRnzITFw
 FWjkrgYxJQE9W+dX0xvyqDVV/P6TlotEUGKI1uPunY+scAWsth3WFG7zd7CLRbwQyBWgZRIb/xm
 GC+KkpGZjFVBZN0Y+mvQF3gqEnEHJxtvvbiL1dgOyjzbfg4aMtaU1rLhWkIIdDIzOrsLIpnt54p
 d0Nsb+bBWx7YVSX5aPZcPuSEvwxgJA8Mx8S65FME=
X-Authority-Analysis: v=2.4 cv=C+XkCAP+ c=1 sm=1 tr=0 ts=6977d873 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=vSLf8ZmTXUZ9D5U1o8cA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12103
X-Proofpoint-GUID: ci4rMudAbcBtosVa2MPT9geBWBO6IV4c
X-Proofpoint-ORIG-GUID: ci4rMudAbcBtosVa2MPT9geBWBO6IV4c

On Fri, Jan 16, 2026 at 05:43:24PM -0500, Eugene Loh wrote:
> On 1/16/26 17:02, Kris Van Hees wrote:
> 
> > On Fri, Jan 16, 2026 at 12:18:51AM -0500, Eugene Loh wrote:
> > > On 1/15/26 17:18, Kris Van Hees wrote:
> > > > On Tue, Jan 13, 2026 at 04:42:05PM -0500, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > [...]
> > > > > 
> > > > > Add a test to check that a rawfbt probe can be found behind an fbt probe
> > > > > when the probe description has a wildcard provider.
> > > > > 
> > > > > Orabug: 38842114
> > > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
> > > > > new file mode 100644
> > > > > @@ -0,0 +1,20 @@
> > > > > +/*
> > > > > + * ASSERTION: rawfbt probes can be found even when a wildcard provider
> > > > > + * description also allows fbt probes.
> > > > > + */
> > > > > +
> > > > > +#pragma D option quiet
> > > > > +
> > > > > +BEGIN,
> > > > > +*fbt:vmlinux:do_sys_open*:entry
> > > > > +{
> > > > > +	printf("success\n");
> > > > > +	exit(0);
> > > > > +}
> > > > I am confused how this test accomplishes verification of the assertion.  If
> > > > a regular FBT probe satisfies the probe description, wouldn't this pass also?
> > > > Wouldn't a -l based test be better here, where you can test that the output
> > > > does indeed report both the fbt probe and the rawfbt probe that match?
> > > It appears that -l is not an issue;  a -l test does not show the problem.
> > > The test in the patch is derived from the user bug report that motivated
> > > this patch.
> > > 
> > > The whole prvname problem is that the bad prvname value makes GROUP_DATA
> > > bad, which makes FBT_GROUP_DATA bad, which is an issue only in kprobe_attach
> > > (and detach).  So, we need kprobe_attach() to see the problem.
> > Ok, so yes, -l is not sufficient.  But still, even if the test is derived from
> > the original reported problem, it still looks wrong to me.  Or rather, the test
> > can pass when
> > 
> > 	fbt:vmlinux:do_sys+open*:entry exists
> > 	rawfbt:vmlinux:do_sys+open*:entry does NOT exist
> > 
> > because as long as 1 probe matches the probe specification, compilation will
> > succeed (and at runtime, the probe firing will complete the success criterium).
> > 
> > But that is not a valid PASS result for the assertion that is posed for this
> > test.  If you are specifically looking for a rawfbt probe using a wildcard, you
> > might want to use r*fbt:vmlinux:do_sys+open*:entry instead perhaps?
> 
> This test is admittedly not the most stringent;  it could well pass even if
> some other bugs lurk somewhere.  The test simply reports a problem with the
> old bits and then passes with the fix.  It is a confirmation -- however weak
> -- that the fix is doing something right.
> 
> Meanwhile, I do not understand your concerns with regards to the assertion. 
> Specifically, using r*fbt would preclude any fbt probes;  so there would be
> nothing for the rawfbt probe to "hide behind."  And, fwiw, using r*fbt makes
> the test pass even without the fix.

Well, if we have a test it should validate the problem that is being fixed,
and I do not see that happening here.  If the problem occurs with the actual
attach and it requires both fbt and rawfbt to match, then you should perhaps
remove the quiet option, and make the expected output also show the number of
probes that match the probe spec.  And add a comment in the test that the
problem validation is a combination of (1) validating that both the FBT and
rawfbt probes are found to match, and (2) validating that the script executes
which means that dtrace was able to attach to the matched probes.  That seems
like it would satisfy the assertion in a way that cannot happen if either of
the *fbt probes is missing.
