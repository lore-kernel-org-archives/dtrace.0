Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4D19F475
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518590; cv=fail; b=YgTnWAVCSXh6/OEVd1ALRBXRlL1doJgXYo0RUWtqQfbuo5DcHMkIkWNbx0MnHNPxuVutXW4ZhbWFXuEq2y/aRIpqiNHU+sf+c9I80aD/i+GHcQo0Ib+MldciOrT7GwGRWlH1i4RtYgEDm6cPr4YyLlaoE5OVBdVXZyruaOwb9Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518590; c=relaxed/simple;
	bh=mOKOWGELv1TtFrUA4ZoNDYknSujLqbHRUBPYcDtBYRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ah9AwATZGTbqIUnmIxHcbUd9n4mO3G1rlBfwZMUrFTIiOcw7YDPq1fhnOufbA6FGcPbW3GPOVc3UKXYNyAZLiKhwI3R2xUZexQzqVIarK898DBbzbysm8OkzuNm9N57wqyzkpGkXAkbhz2kioRXK0/oQ7DpgPoFca+rBiZ0RrRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YkXiSQm8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wTF6hqMA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YkXiSQm8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wTF6hqMA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tYRP024306
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=t/BElYK5GPz0l5Rnaq98lDIyhrpkzx0Q8P2VpMtR+L4=; b=
	YkXiSQm8u0USLyV4+szjJtzcGPpoviZPCFwsrluTKo159N4GyoslFgLsr8lyqQVk
	7wx1R9upPa0vOinZ7jR6A6F9WUlb1cDnpgXykrKI8Qv7pzE7Y3RFIwl/PT0qO7YE
	6u24Gh9MXX2cI8xtH4RKmGCThrnI5kwMM1LXkpw/l6tIZY97gnFw4rD0tlM0uTgO
	ki7h62wj+haSag81REnKp3cCfoj30uRfJHIUk32qQXfqZijlB1JQkwqESy+wWebx
	F4OovjVajAcvZNTpA1pseQG7ng/LglvGgWrdjanFUqDILX5y42u5h87bxQ+CrUlD
	KiUpRFhiixuZBT8ygKVCbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqacsr58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:23:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471C97GW037273
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:23:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp06gjk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZDVOVAWHeCf4OErrpeGSxIye5uJQZUZ2Co176vZuLwZc36MkYfhQWVl4ekBc0gYMEHL/pYsS2yfMlX0HQfNmOBkhF1QDEcOnxTOf5hhoDQAK+ZWx1UMf8VagHSVYL9QU35A5laZnmCMsQWIROFqhsiaMzxE9l6Friie0fObyrPuWt2netYzOBWLAryE0Yw8P/0mwuqVXWzgovC0RBpz9nB48xCDRDUjSrUCeRlT4Ud45K7mXUJkY1rukeFV9EWJdFZSE6s2ipcYKNvt+wOhjXjwKEGmUyoRvYELelcdDxWLOfYio7bDmFKAi1LT0wndd2uAVlsbfK1jMj3KBhm4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/BElYK5GPz0l5Rnaq98lDIyhrpkzx0Q8P2VpMtR+L4=;
 b=D6XGZVUUII53LhKENFwYYS6EfSmouBUeQ59pjrNWCJno2iSUuGuRYhccmCpLwYO48Nh11Y5UjEKkkv284U2gAwGuaoGZ3Vgjq2VBNzSg5lP/3v7NkGkOeZxUAVn9UCzMXfxfxQ0fs6c0dns4+2LPZMlUA+OKb3e1wexaRPP0xB0Csh6jt++AUcGMvpA2KeLZRbUKqQdg7bcth2lhfVFaw6+p/A4wxcBI5WKj6swhEzqIMlULmQjprxnfnjAJOZeC7B+yv5Uox6hwd88Owr5paxJ8ELk2XG7fmYBIvTYiQwc0ABL2NdGgFv5egNeVgyOhIdTlxs2TB5Of0QuYIyQbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/BElYK5GPz0l5Rnaq98lDIyhrpkzx0Q8P2VpMtR+L4=;
 b=wTF6hqMAeGLZPpAWQkDt+JCtIm6rc/yoxktRKpDG1Qhkdr9rGee1vJmSdawvU09dlHhno3jE3EFAMZPrKc+esxR+MvBwLicH88hT+OLymhRU4uzYvoaJVyggM9t2PVA6SRGTPcQWX+2bx0Ftzvfn+uefgUuSbg0Ew7jOsFHg980=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:23:03 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:23:03 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 8/9] build: make dtrace and dtprobed relocatable
Date: Thu,  1 Aug 2024 14:21:55 +0100
Message-ID: <20240801132156.286780-9-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c1a451-5dbf-4bfd-5605-08dcb22d1288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/SbKQAaNiGCQ6gMtPbsHUPVxlxr0XKcbgDfyJS11GYdQa8rQm0nHR61ar371?=
 =?us-ascii?Q?M5ZtSBb7tp9hZ6mB2k3Jlr84rtdPBooaoFbwSdMfHpracvtsSYO0puFMIHCz?=
 =?us-ascii?Q?5NEesnn47Q9XvSEqCP5QUbMRfU+yqGKGwiQkia+OivAXmvzC1V0Ulahkr38E?=
 =?us-ascii?Q?z/zY8q9Uu9MN0eTdi4QIw2jvS4XcBTwZhgSKloHxFRHfrikeQxnbC8V/QozE?=
 =?us-ascii?Q?glMX7XeVlsxJ67tD9Qjl5YbhusQHgdyiQH/uozjSosH81pv1YqhLUIDmqwfQ?=
 =?us-ascii?Q?emsb01FekxHJ8oyuB90m40vu7JR2oX3BnFgw9+hXQprhF71sLtJiaJuWJjVA?=
 =?us-ascii?Q?Xzg2Iu2xfsP0QZYMcMMfzl7yZ86VBNzNKEdKXVEZuqSCEma/+4eBf4GRSGg2?=
 =?us-ascii?Q?ACn1Ij6xsWqidl+JYVEiZNlXWFNgBoI6cFqViagwbI3C6qG+0xU7CsPVtfh/?=
 =?us-ascii?Q?g3GiULS3zotDb8mO82Ei0m9SoTvfIO2sdSe+OPa5yv60rXYqVzIVV56T6sIn?=
 =?us-ascii?Q?L3XZ4FDsYFbSGe+Xdh90T49cfS78QIj510ngaJkWJLeL8FJwTlxTPDWATif3?=
 =?us-ascii?Q?kF6+mdBMpCe4qe68PMVaJidnSyGUn6nPjNfB3VDQUpHFDJvRtNgxjM/IqTRn?=
 =?us-ascii?Q?xbetvNJ59Hpap0t8VJtT86cww2jghZnNrAu9yo5HfDT+XPuSXGSd4NXac9Kx?=
 =?us-ascii?Q?wef3KNabnvVRAKEgC0za/LzrKJe46fm742WxSzpp1TR5gpurUuD4xtz2XVMg?=
 =?us-ascii?Q?AFv3t+rgecn8CbLiX5WuprDtLZ2vf4cbkkR6tp7cf/+wL2iwsQ7Ehie1soH7?=
 =?us-ascii?Q?ujQ4UnbvmhJ2Mt20h5E8mDuGFkPuhXOTyyIBfa1LPbuFDC/19lvQNgzqD1vJ?=
 =?us-ascii?Q?sUKhIvtfDnq4XDpAY11cYb2PvIIQ6I+5AeMORr0iC2KEe6jVPNiUNe08vL0D?=
 =?us-ascii?Q?rVx9YK67t0SnXMFT3oCJVKo9kpantGPDzul5F9kzyq9X4jJPbFTkpT11nr+m?=
 =?us-ascii?Q?4W2taomzOqGwPccRtx6Zk2ZEx6FPo9Bpla7/yRnOAnFEPJELRatmSqsf0D/I?=
 =?us-ascii?Q?n+Jnqyapdj0UYqCSGU7mxYa5EAalj/4fae8VEz2MAf+8R2mRhHdkViUWSk4P?=
 =?us-ascii?Q?bNMa376d5jAv5etNMn+f4EN9eGHNOaBloP5IqckzJF1+ucNnLd0q+d4BoOCV?=
 =?us-ascii?Q?C0M6d9o9zanRKOOcE8ierBZ1GwgMkgeYKWnN7fQ6acytqqwNLyIBeQ1n5VSL?=
 =?us-ascii?Q?5CuD1ullc0UJJhAxXnbgfXEyqclZFzTlteVQ861YVcivmcvEdiy2uNj0kWiz?=
 =?us-ascii?Q?DsV3fjUf0Z/snCb8E3m7vE7KdxTaf9tcA6WGnOHF3eFI67UTCkFMgE5fJsW5?=
 =?us-ascii?Q?5UZ3h9U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/LcemieBhsasicAIlVnhaCv9fthkKXWzVhc8tOEvOX5nyvjvPsu5vl2yKw3?=
 =?us-ascii?Q?y+o+esfVOQWllvpvHF84Tsqxwu9kOTPLkAv+lhvZdGJ5myCGH/Jypz77oi8y?=
 =?us-ascii?Q?HZAc6TwRD6rfBtx+2Egbk5DXXuaqUcIN8yr+O1na8MRGwCCccERMx8Kk6lF/?=
 =?us-ascii?Q?/r2VTUFg/qsdgJHTKaOwxtFM4187FDx6fGdNHutHmFdfz7DjcU1UUqz82DLz?=
 =?us-ascii?Q?tVlY4CBPFMdTX0Noq0hxOf5pHXFp4pUnDN4xGx8BS9Z3owHxR0yLCYRGOWKK?=
 =?us-ascii?Q?vqJOtAShNZ7f18xJui56be9guJ48VlD15OQg66CwBMaaA8zLJCsCkqxz2QQ2?=
 =?us-ascii?Q?aTi8FBIQjltn+kJRWI2EaWZEe4mZLSey9+S5rCEDPoQQcGgxoIbgH5TBvQR5?=
 =?us-ascii?Q?BsDSfjapwTkDBlmL/f9YjQjoEXHhvWxdoern3JOTYV/Ho3RoLj8XSxSXNe1m?=
 =?us-ascii?Q?ctDK1+XNDDuvio4uWJ5r9bll0b1FRIgcQoc8nz3d7nuybYSX2vnqQ9EalN0r?=
 =?us-ascii?Q?Wg+ni/bGZuZ1Iho3vt4nYvB/KWrsosbW5z/DBn1K0nahjsOr0oKNgChyZMtY?=
 =?us-ascii?Q?Isv75O9diLTjbHq9y+XY/W0c6xxNJ5kR7xvLVLCHgzQ0MU19106X+5885Kga?=
 =?us-ascii?Q?UvGQvE2QHwwC4jZkVk5+3QeT1yMAnJ6uNaSMSR9KEMetUgqyqnJ30SKYGLBa?=
 =?us-ascii?Q?wjK9vMVgEFtC70Gp3duWZGepvUwvVDXmLFl97ypgUXZ7+3r/e54PFfHIzQK+?=
 =?us-ascii?Q?EHDgswYNzObMe6TP8nz89sf1TkpzyIw/bzueK7v8/MJ+pTM+F35MhbuVREE+?=
 =?us-ascii?Q?9yFrgRbuIUanpQ6wm2pWv4wdUBrTBh31ERjJe0NdG25fXE7RX95rNygXQfmN?=
 =?us-ascii?Q?cXHlbDENCwzTnxIw99/5KYO5B5WFi3RY23DbM/r7OxwDdZKdIYwNPjSrz2LZ?=
 =?us-ascii?Q?mgU1Rfj/SVKF23hqqJTIZdDlAuvtxANh7ESxzjIK93oE+T5YlRnSlJdwROTK?=
 =?us-ascii?Q?pmKHtyOG1Xb09fGsJ6cOlCfbREd9CD5tJXtSgt6pswy13iHYAUpF3QXAeIUR?=
 =?us-ascii?Q?NnG8LpPmo6SWNh/vuRHfWJSyYP+FJtEW06gEHNHkshFrW3KpP5J9tZkpAm8h?=
 =?us-ascii?Q?H2BQAQVJ1TrBUAE5CFCA5ESVnAeQMH3APuqv4UFQg8tvn4bC7nKA6nEgawVN?=
 =?us-ascii?Q?NAr9GwUhSL8tmNQzWxwy+NHYeZmlu+mL+2n+peOUAAoHkbHKxU50kC0NqbKf?=
 =?us-ascii?Q?35pD/3w/Ynfkf9KrzJ98b6k7HzGszeNGA0CmlfSvPiIoqlTAedx52mmu5dkl?=
 =?us-ascii?Q?RBa2/baikeB8TX/sq59Z5JlTGLseQl6Sg6JIOK6bIhP9w8PawoSVH1PAqYrq?=
 =?us-ascii?Q?J8svXBb1GuQyitgRVWtn6pb6muCrMMz1w0e4Kewz41IUHfj5nlMC8uTy5lIy?=
 =?us-ascii?Q?hx5LxTMFCpnyzROcU1uFy3CLiVDq+QhujfFShceyafXcAw9YjmfBVHz2Cndv?=
 =?us-ascii?Q?/RlU6Ox14sGEgdA0HzCxz+RZNWeNTa1G2L9QMUQXPDf9HBbp/nCzHm1V7Wr4?=
 =?us-ascii?Q?Z9kDsG19FZ1ZN2BGJOWwOIusUmCLDHVxEFxWq3wVVdk7Kky33KNnPiPQlCEg?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tz0TU9JkQBfjKTrPsn8H1ae+26u19qP8PfggcoDLpql7R/hy5rliSZF24lEUiuJAhsipM+uX/qqxBjUe2k9mbe4Rh5/MpkA5V+Kt79Yxrn0gjb7eWX/zBkqxtvUsLnYIPGv+mnIAiMYO8GIrs7nEdPxwayYCiskVhQageUFnR5cx84j05xJ44T+urKYzd8N9Sgq8Rs8wTrDdtOOFfvFZ91619RyJtxZ13scd7W0TU0g1tfoOGhmcX+VtM3IqYiCSOqvuufzb9h8JQGbrteW5C7dL3OFpl/uNVo6y++Ud7SftIJYza+rkeF1EjfIAaCaRIPYJwb3jiZvBR+0fp8cyeU5zEcaGntu+ufPHtXc9NKNonz6A4OW9xuibs35U1cKqKnbDGtmXm0NEyWsKVLvoT9NDJbkQxzj5WKmxknIMAlWC+90L6B+VVMjRZ41y0FGK9h/BdF+wLvQti2lh/fjUKdJ+SaIvx2iyA0OlexixwofBZJfutDaO+1rEsasT+O3/8fj8c+47I0/wZTeEX8wG0QYNOKlZlW+kEkgXkgpOxgKWDaT0+eRhZ/PlBk1sl+yGjO983U8nGN10wM6gL2uKF2BjyD+wXOJcrQ5WMjlo3IQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c1a451-5dbf-4bfd-5605-08dcb22d1288
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:23:03.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMBo7cy8op84m3Cu5kj24IzZa4MweopQ+BEW24YOrNEGFuxBh+3zoK7d3rFen2/sflDo9CUeXvxJ1E4/7OpdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: kErnb5-tMuSvzmC9xf-ARrfzOqh4oN9o
X-Proofpoint-GUID: kErnb5-tMuSvzmC9xf-ARrfzOqh4oN9o

The majority of the complexity here involves figuring out what to
do about the systemd service file.  We presume that if the user
is installing such that the service file lands inone of the two fixed
locations systemd knows how to find persistent service files in, or
if the user has explicitly passed --systemd-unit-dir to configure,
it makes sense to install the systemd service file (because systemd
will find it): otherwise, we avoid installing it and print a
warning that the user must do so if dtprobed is to be properly
started.

Provide a new installation target, install-dtprobed-autostart, to do
so.

(Regardless, the service file is changed to substitute in the real
installed path of dtprobed.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 Maketargets                                   |  3 ++
 cmd/Build                                     |  4 +--
 dtprobed/Build                                | 36 ++++++++++++++-----
 .../{dtprobed.service => dtprobed.service.in} |  2 +-
 4 files changed, 34 insertions(+), 11 deletions(-)
 rename dtprobed/{dtprobed.service => dtprobed.service.in} (95%)

diff --git a/Maketargets b/Maketargets
index 11ad9fed4dcf..5b4906a86d26 100644
--- a/Maketargets
+++ b/Maketargets
@@ -14,6 +14,9 @@ help::
 	@printf "dlibs                          Build translator files\n" >&2
 	@printf "install                        Install (DESTDIR supported)\n" >&2
 	@printf "install-test                   Install testsuite (DESTDIR supported)\n" >&2
+	@printf "install-dtprobed-autostart     Install udev / systemd rules to start dtprobed" >&2
+	@printf "                               (done by make install unless prefix or sbindir" >&2
+	@printf "                                are changed)" >&2
 	@printf "clean / realclean              Clean up build tree\n" >&2
 	@printf "TAGS / tags / gtags            Make tags files\n" >&2
 	@printf "\n" >&2
diff --git a/cmd/Build b/cmd/Build
index 55c622c19dc0..68800fbeb5fc 100644
--- a/cmd/Build
+++ b/cmd/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -36,7 +36,7 @@ if [[ -z \$$_DTRACE_CHECK_INSTALLED ]]; then\n\
     export LD_LIBRARY_PATH=$(objdir)\n\
     dtrace_cmd=$(objdir)/dtrace\n\
 else\n\
-    dtrace_cmd=/usr/sbin/dtrace\n\
+    dtrace_cmd=$(SBINDIR)/dtrace\n\
 fi\n\
 \n\
 if [[ -n \$$DTRACE_GDB ]]; then\n\
diff --git a/dtprobed/Build b/dtprobed/Build
index 0f5d1c08aee8..9132c3e31c8a 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -42,17 +42,13 @@ dtprobed.c_CFLAGS := -Wno-pedantic
 seccomp-assistance.c_CFLAGS := -fno-lto
 endif
 
-install::
-	mkdir -p $(INSTSBINDIR)
-	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
-	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
-	mkdir -p $(INSTUDEVDIR)
-	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
-	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
+install-dtprobed-autostart::
 ifdef HAVE_LIBSYSTEMD
 	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
-	install -m 644 $(dtprobed_DIR)dtprobed.service $(INSTSYSTEMDUNITDIR)
+	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
+        chown root:root $(INSTSYSTEMDUNITDIR)/dtprobed.service
+	chmod 0644 $(INSTSYSTEMDUNITDIR)/dtprobed.service
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtrace-usdt.target)
 	install -m 644 $(dtprobed_DIR)dtrace-usdt.target $(INSTSYSTEMDUNITDIR)
 	$(call describe-install-target,$(INSTSYSTEMDPRESETDIR),50-dtprobed.preset)
@@ -61,3 +57,27 @@ ifdef HAVE_LIBSYSTEMD
 		systemctl enable dtprobed.service dtrace-usdt.target; \
 	fi
 endif
+
+install::
+	mkdir -p $(INSTSBINDIR)
+	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
+	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
+	mkdir -p $(INSTUDEVDIR)
+	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
+	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
+	if [[ "$(SYSTEMDUNITDIR)" = /usr/lib/systemd/system ]] || \
+	   [[ "$(SYSTEMDUNITDIR)" = /usr/local/lib/systemd/system ]] || \
+	   [[ -n "$(filter SYSTEMDUNITDIR,$(CONFIGURED_VARS))" ]] ; then \
+		$(MAKE) install-dtprobed-autostart; \
+	else \
+		echo " === WARNING WARNING WARNING === " >&2; \
+		echo "systemd service files for dtprobed not installed." >&2; \
+		echo "USDT probes (and the testsuite) will not work unless this is" >&2; \
+		echo "done.  Try make install-dtprobed-autostart, but this may not" >&2; \
+		echo "be enough: you may need to manually move the systemd service" >&2; \
+		echo "files somewhere udev and systemd will find them." >&2; \
+		echo "If there is already a running dtprobed, it may or may not work" >&2; \
+		echo "in conjunction with this DTrace." >&2; \
+		echo "Configure with --systemd-unit-dir to override this decision." >&2; \
+		echo " === WARNING WARNING WARNING === " >&2; \
+	fi
diff --git a/dtprobed/dtprobed.service b/dtprobed/dtprobed.service.in
similarity index 95%
rename from dtprobed/dtprobed.service
rename to dtprobed/dtprobed.service.in
index 8e491fe28ad1..2e590701d03e 100644
--- a/dtprobed/dtprobed.service
+++ b/dtprobed/dtprobed.service.in
@@ -12,7 +12,7 @@ Before=basic.target
 
 [Service]
 Type=notify
-ExecStart=/usr/sbin/dtprobed -F
+ExecStart=@SBINDIR@/dtprobed -F
 Restart=on-failure
 RestartPreventExitStatus=1
 ProtectSystem=strict
-- 
2.46.0.277.ge12b8151ed

