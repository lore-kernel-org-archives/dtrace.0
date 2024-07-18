Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C764A98
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721329468; cv=fail; b=RxCmD57fvGfJK6pkrMzTz/47EC4O/i0r/Ju1P/EkGYUGVaOY8WO6KcZ8EaPM1NwdSqrC25RdM7ghOX5wca/Ouu1mNIa/it5ehuaQJ3JmJrcNJwAtG5Jn7UvCoSnlWmnlpZmQTZ/Nk2JvJRXFoT2wcFsxlkHFIc1hObaf3JScdRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721329468; c=relaxed/simple;
	bh=F/bOyiL5NMQd152mzvIZwGZ6gfGmyEreZgRi7nh7XjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hksSTODiBdiqUvfoTAcOEfm3pQ5eMU4LHTuxT76VUBQAYsKupX248l06ItUmg9mWo5Iu00DbOPX9MPTGqYJboqH0sXmGhAMyiR1B3CcXkQMQRXJr2i9pciigpqHuM89iut6sgNvD8i+llo5FLdGoccckf6pUMcgTkC6Ug1gggrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ApYbW/4H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AeS7H7uw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ApYbW/4H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AeS7H7uw"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IIth12014639
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=IGRaSRFANysNTjz
	1SCfh3rXqw9ZDooEgO/4OxksCJz4=; b=ApYbW/4HF7qrCDeRtjhB5OgPVgbmPlE
	+I4sn/5voV7ioXEIj7kT/jCXb7lf/DqNpKj37Ho8lFmEcUzn/ZqUZJgxmjaZ+h6Q
	qGF+1A/Te6nWzOBb7A9g+IIEq/C6uq8V779vC6a1Sw9ToFN8cRffSSXYYmpbLcBo
	qatn8pdfrdqESPI++5tHNssGm/ue0bdPaH55hL9NVgBTCxt2DkmmN01fwC50NPZE
	dxPhVK6NOJHEZz0Fg5OVhzmzacT0MsyolNIgHodph+JiaGJEjLxoQ0G0Atz/DfqJ
	IuxOhgRMHAbg1KsA2jxciYvmVg4QA+s3g/0m51mTxdIsL5xzG6ESC5Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f8rm00pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:04:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJ0ND7039541
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:04:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwews4s7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:04:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3Qlt5inEic9VEJL+ZGyaXCzPJ6J9X6Rkpt5vFMgY72Nhag90aa+tQDfz0htusEiC/ILF6uYQyPGKuD4xjBn5bmg0haZE8g6uIs2SzfviGk4s8pT2tXqjV5fZiTsPO1TNDws2uZQnIMHwPVDv8GUjzSXxslIB1zyLdVe1ng8Cb9ZyMYewJ2B1aKQsofX8KBWrMYuUS4z7gyazJxXZ5qB+ou145683mfjXNgEIUCI48lpmMfM3KIPxE5DjQXP427yhBfeO18XyWHPH5W4J9i8ECzrT59ONFBAetIsvqoAjJm7Fk3KXLruuklJ94qTBMeia05Fl6jCJQOisULAHzphEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGRaSRFANysNTjz1SCfh3rXqw9ZDooEgO/4OxksCJz4=;
 b=xIYzK5z+Png6I03RCgeLORa9CucNnbY6NStbifcxV+J3IW9ZQIBZCfW2LIIFG4wrDsI3+o/dvfPkPh3wKUpvFf2eVRWfEENzDE9HxAb/IwUvCmeo42N6GkHlQPWqZ8N8zNfR0xTO7rC4brhjhuT9cZYXBdFLsLfok84J5eZ8YpdZYuQfNBS/fwRgC0DTU3S2Y6ggFRNhgD+uf+N9Vf4UNDEAworuzL9fz+DUaB1OtYda8szm+nVmf5Wx1vpzaIrbd5LqRhKwJgIhVWYTmMQ15lBlHxo/8aOY3ScZkxZXDwsAZv2JBuNnPJ5WOwQybSEe6V+GXPaRZBRm/At+XgWJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGRaSRFANysNTjz1SCfh3rXqw9ZDooEgO/4OxksCJz4=;
 b=AeS7H7uwnqyKhHnRO6gpP66cpPvU4ZOjOThSMFx3umwMsMAG9Yx6aLebxDqK+5fcTEG8ohhR+ZypsPKHRBhZb9aCK4ERPBul1XfMpC53CnCVALcEaova+TtqfAXLiBuJjxdOXjWl81N6h+V+KcWOL2i89w73tuVwZYJM6KEjfv0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH3PR10MB7806.namprd10.prod.outlook.com (2603:10b6:610:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 19:04:22 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 19:04:22 +0000
Date: Thu, 18 Jul 2024 15:04:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 09/38] Fix comments that hardwire DBUF_ offsets
Message-ID: <ZplnMoAhnEJjrLGX@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-10-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-10-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH3PR10MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 9807da71-da06-485c-00f2-08dca75c6ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yfdFbxHXt3c5bzbkRXnqUi+K5TYPJFc+wyhAaEJYXbBZGQXR8DkJsJHklr8R?=
 =?us-ascii?Q?yjkl0GeIXey4tk3Yen67FlbC16fl7gvqYweoLCYOpcENrhyUlbrktYGH5LpT?=
 =?us-ascii?Q?Qasew2fluqU1PBBlozFFICkSywsRE3hWERLuJo367ysCdBZMNZY3bFT/nZ5Z?=
 =?us-ascii?Q?FxtTKs2ndFSTJnM3XJEQ9JqQM2Ot9yblpv+mTMm4qnlyc6xvj+Z0KjavrhKp?=
 =?us-ascii?Q?yLyWdegUXc3JphzQN5xtxxuVQ3ENJadYvtFnAwlO0qTte6o0i/lI5XoE8hoZ?=
 =?us-ascii?Q?jBOsGoFs0qhJYGm1qyYvDA2tU8L5tqqWGoO1iqck1yGqK8FhTajLZtvc0U8K?=
 =?us-ascii?Q?P1xKpWJL/b0nM93rAvw57Z79pCz+9kLkcvaApZS40Eb0DWKOVegnWtqZddg2?=
 =?us-ascii?Q?wYL3X5oey2Ft4K4z4vrUSTGyf7PWRi+klQWKRmCPKQWYeXBtu+QmZGmXsSkO?=
 =?us-ascii?Q?bH6rCkXLU6PQtDxNa29Q1tf39eA2ZY1YbA4Cge0u0D58RNbBGXAZW+EW94xq?=
 =?us-ascii?Q?Mldp9Bynt1aKmWCqFB4yy91oB/RTLSr+SYJ0Shb9CL8DsqaRxBlzjfYBHED+?=
 =?us-ascii?Q?VkXEyvC/8Gd5BseAknb6xzp0qjfZWakYBsUi9XqHFDlcLYuNUv9ZOBe9U5ms?=
 =?us-ascii?Q?D7HPa43Ws1qkLsHPUSt2Nti8bu6IYrXobkICpOTj2z6nm3+LJtZY5rSo8tXy?=
 =?us-ascii?Q?9cXHL3Yr0E4UuGprCf0DJ50RbFPzZcsxgHJ9QawzEoj5UHgDhX/0U/RFBSKK?=
 =?us-ascii?Q?w1NcgYKlmQAJeKVeAZCDZxQSv9Ge+Q26b1QWKfLTFpe8e98S+phEA846ep9G?=
 =?us-ascii?Q?Qnh2jtu7yvc1zakKnoDM4kH7svoRh9CYcnwrJ6WlnWy8GJqWS87I6t2cv/JE?=
 =?us-ascii?Q?y5xHDJ4sbLBEwazjvLkXpfEeHwtU5Oc4KAux5oANZoXru8ItMSDGJ8OO3792?=
 =?us-ascii?Q?lCdL799SxF2uyWzT+aa4DdFNrCC+P29XPx7VSwEGuk2jNTWe69vhixLpwpuC?=
 =?us-ascii?Q?QjWhPhP51+vLTybPOIB0FWLkylaUt0li7NI2iSdSGwjxd1Z0FtGQB6CPj1IK?=
 =?us-ascii?Q?MCls1OyQDRDe11i8QoxFpKp+T6VwLQyjTp+CMB07RhZvgxFYPp7nAJ7et4Su?=
 =?us-ascii?Q?6VlpKhHECQMgb1ks3jiClIBZwedrnO6LftkAYg3Ubl8gljZ5TzTqkDcVP3+E?=
 =?us-ascii?Q?0B4nGSO4W9zQCdOaIAQIeova67/Ex696M7EQ6dhWnx6Hsr63SmNn+2RBVG/e?=
 =?us-ascii?Q?il1vPxCpgJQQRh5KcOzZvfjG1gtJaeaIR4Wqa/EjgQry2jAJ3ZE8GHksLRyK?=
 =?us-ascii?Q?KTVZ7gtvch7SqQu9PDcblOW9pXo9GUmaA4EeSAciawqhpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hAhvTl0Y2G5Q+YdwWQDgT4Vh9eeyLW3N5Q1s3yqLQoiCWw7LIIZ6Cz7ixvzJ?=
 =?us-ascii?Q?EJeKuVsbruCxigxpn5IltlIuijXkL3r9lKBYJHxGLUURqbscC5QN65v7Gdri?=
 =?us-ascii?Q?AIGZ7zBsrf2oyOWBLxASBGQyekcaYUHXGKXFdDcDVR2xmWv9qVfxdWI/7oAk?=
 =?us-ascii?Q?M9VXaKMixXffEHDxECP4jsKNUd7N7Rn69PbjZMQy8A2/+BSaO9+S+MAEphqN?=
 =?us-ascii?Q?KWRypP5/kRFcfnvxJQXhvKHN3EEw7mfa8nwmtTNFWoQhXpA6a4i51lCHYkwW?=
 =?us-ascii?Q?tXt75bXTxtiz0PQBpmJHzSyyGGZOMZqKL55UoFW9b4PAOxnEJoiXskdQMe52?=
 =?us-ascii?Q?ZB7iKjHRGWLMqrvLRuNv9sLZGEjMwnorW8y6hPBNlkJNoiYEktoFDnhit8lH?=
 =?us-ascii?Q?vLf4cSmzGNuyg1avHu0Vpsiv/WkXD3XLPclZ+THU3CEZitllBf21GZBwIwzT?=
 =?us-ascii?Q?e6ocW6uGADRNMIf2WYals2OVeX3BnUlyL3iJv9bdiE6BYQNjv+BSXMydREJQ?=
 =?us-ascii?Q?+Ra1Eqg08h7rrUpkE22kbIY+1kplpkGO3sAG1A1uEfmTGaWD76I4pIxHyPKN?=
 =?us-ascii?Q?1HwK//VVshh5jgfP/02pdO+cwZtglekiNlpz6ouUYT+6OQRmLXAu+rInEUu7?=
 =?us-ascii?Q?CH1gnd1Citc9M7DkzA2cGce+8wV7zjAejPkvCM6q5NpC27UptK8UUMiDK+X3?=
 =?us-ascii?Q?up0NsR8hwkgAY9S4NY+RRaSIPAzy2/LTCDcH94d2eQDBJrhzH6FgmcaiQ7bQ?=
 =?us-ascii?Q?w7FbS446zTlB0q479BDykiIEZGnjlL9wJifBYfFzJOg4mGjh1bPG3zzvKe+F?=
 =?us-ascii?Q?fug7looSjs0yG1lJcKlfmcG55Ib7XRXIMiwmVKzRP+rhT19ut3e5yQ8BvNWL?=
 =?us-ascii?Q?8mISElBKfvorP8WB3GA6UbtOLzXIna9VX6JeXCGOE/+fQkHpcefkvwKUwhaq?=
 =?us-ascii?Q?Fmwn5D2O1Ul5qudeVo3j0+UMMsdSMiYQ75ht9mfcp3xt0nkTle9QNj/U3TFM?=
 =?us-ascii?Q?wOuQQDmB7tFZ97kwH12u3gTGvicwIgO3Lzf8IwMX6B8YlDI2NMTFoCcr8rYs?=
 =?us-ascii?Q?J5I6lRPejgs8Z+rWhOBhBTHUFkeNP/Ez0ITTN87s5tfrjgYd6tJjGE4ntWUP?=
 =?us-ascii?Q?g57dVHXO9UAnJREMpCjPZ0ZM+BmS1LhxZAVfZ2C/aJoWtFwNpldScKVMHNAk?=
 =?us-ascii?Q?3J8bYlno124tigFC7suUWNj+NZsYpgdHtaS+8jji+8qO4mwIJztEVTZP9rFa?=
 =?us-ascii?Q?IIdJ0EXryOJ3NWWuiWP2XvWPC2Mmvytc8duLp5iOW63tHgS1CXrjY0jZxzF6?=
 =?us-ascii?Q?fjrdV97i/ycqxWR8/2pK09IiCs0F9owVkfdA6clgvBqlQOEFyRhHp+m+8EEj?=
 =?us-ascii?Q?jrlVQV7rRlQq5M8dyRyZyVkKDI+t8BoIgsShQpLPHlvOQp3pu3ioklNr0spX?=
 =?us-ascii?Q?9s1nAE7qB6Jyzz2gKrHbjetc8hRQrJm//BGMyNBSJ44H5LD3XWu9rngpxoDH?=
 =?us-ascii?Q?3JEdqZv4ggkpKuEdgYHtWSRdSOxDUXr39kxVMH90U7Uw13eSmIrcQRpq6jZR?=
 =?us-ascii?Q?6JiSMsJzmO0SD1HyU0oYrVk26qli+ZSq7X1YzKVVeVZWnBLUQO0RtBqegB0j?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	CUQLEHee+baOfuzmjfUnLg3ryYSBSEOSIJl+BgaFT2qs+hJSZNU9+qZGZt3MzJUe+hTDaogTv9OZRaQEbuRGrabMasKn23c+tVXEhiVvr1ZAUVwKGlBs8mMw5Tx3S3tKaZrRP/ES41a8kmS3g4MgTZiwaQJutk/AvHzHlbWsGK7YVnIPlcEfGrOM/Eg5PkF01P9ggS65dE1HSCWmp1G1azrkpzxa8ZyGOBaiY5T0j4Ffn7M3xSnuPF3Y7Z3mqRiWjyrcrLzFYrtloRzM8pJrIpsY4GdjXo07VIu8UNVGShIx/h5wSG+AUUa7N2n/YXu9V6rwSK7OUnSxnNL7L+9hcyNBLtmz9a3Y1w/MXosNZYR/7ZXRVjOvAc39DkkMpuql3j33bdsdU0+YybNxJmbhef5++UhUZAaXJe1DlPXAcWOu+8RzFuvkFUgz0Tq3gEUinB/cGettH1NXUtLNXmAdy2kE/mRE5D8364PoRdEKX24rSKt/IMBkkSuOP5Xz5K16DSTgABGApIv+TiH+zo2ZYq76u40VZfBrtTlrJOE9VRoewkL5tM29IqofIOb0hV86DdocSLHkXSK8pAtLskfjV/k6WuiqcfAP0DQkOHZBni4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9807da71-da06-485c-00f2-08dca75c6ee0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:04:22.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgfjDa2DLSxQdyNbubZ2sEdmzCJu48KrJPjQO1TbjDH1Dta6cjEAF6yJDj8zBzy+t8TPWTBnhiXN9XtWYTzyy9ZwKsYJAqltfP/WxMBSXPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7806
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180126
X-Proofpoint-ORIG-GUID: njuhy3uq1zeKimaL1B1h4Vr9W1wtytoB
X-Proofpoint-GUID: njuhy3uq1zeKimaL1B1h4Vr9W1wtytoB

On Thu, Jun 27, 2024 at 01:34:26AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index e166d2d8..0977406a 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1057,8 +1057,8 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
>   *
>   *	1. Store the base pointer to the output data buffer in %r9.
>   *	2. Initialize the machine state (dctx->mst).
> - *	3. Store the epid at [%r9 + 0].
> - *	4. Store 0 to indicate no active speculation at [%r9 + 4].
> + *	3. Store the epid at [%r9 + DBUF_EPID].
> + *	4. Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].
>   *	5. Evaluate the predicate expression and return if false.
>   *
>   * The dt_program() function will always return 0.
> -- 
> 2.18.4
> 
