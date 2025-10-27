Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC92E1F08
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761586723; cv=fail; b=k7WvBq8m3DO9EAzZYF5JRmlxJZX252VzJ2brmnxg6S3kLQTLFsUNMCexeb/pFEahnq+BkXtI+tyqoSACkakpTTs+PdEPTstQD9HTIamtOeYTecMYXrGtRd014/sbmgfi8peuMGET2PIc2lhTqEIeCFXeGhaUeT0kDiB5TwXVcgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761586723; c=relaxed/simple;
	bh=RltRcG2EE3G+7eb/HWZ1jAKDaxM6n9GrP371dx1Z6xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZUW1gFNpXgaPz5Y7P4xcoFxqOcsefk/Wh6t1SyK49hgcpeI+8hArcGA3urWBk8NrpDbxxqBoChIeVVPLpAtKSQhchApvp94/5sMRzSIYR4m0JoB2AUGFby8Dzw3sHkTvM+7Rs3mfXNaRfnhSUUmyMqedZIAJhN9Gf0ag2HEojvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nhJ3ovAU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tB9iMkkL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nhJ3ovAU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tB9iMkkL"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDYBPx022150
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 17:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SEr9eVU+4CQT45oW8K
	kuZLoq2Z+IqO9RQgfLg8HX8Xo=; b=nhJ3ovAUswJ+zJySeKb99Zzg2FR6EQxC85
	Fu0T8gK/YtJjjdoNG5S6I/EkUl6rnuAbP+fFx+yX07eqitZUNAtgtCmzm5w1uozX
	BN7yXMqRL1nIk8E+Mb9H+IEM2TbQZvHBc/i+Tyer2KWeszWCHmWyOEmIxFxzI6GY
	MI+v1iIAnU8yovnPHuLj8d+QRXDqhxdXwY05nsaong1UR6tnvgHpmbD7OqtoDnQy
	L4PsY594QhcwwJ8G8bm6V2E5lAvaOZGokPp4kWInc4dfOvKGiZqzKCQAP66MYaAf
	d1IvSmMFemtromVEAnC5VMx9znw0QKGtx4pn2WuN5+KNnz2/vLGw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a22x6sgry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 17:38:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RGfKKK015348
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 17:38:39 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n073db3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 17:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYySi1QKPQT3+oDu9wlE6g2wNBK8KY01rclfhrbblQcnRVTX3KOYceNZ5CWDDuWCKb59PLnB1Tbw1C5kMkjKWv38K4qwNKTEW3UyQg33xVZA+tEw61hDsHUTG8sjHFiRhbmf1GasLaAWl7XFHjmLvN70lv6Rbj79Wb/EF9MjU4t5XBqZXUnAIMb0rRbYtMYsveL5Lg6uobhhq5+/HrZ+oBHpj+Mjte7OU2KzPVAYmjjwUrStQlIHJQKbmm16cH/6Z/9nWlyhic4Z5PwUKubUbgBXV9s9GVS1TIep1T8DXcRxSz5quF6dqK7BvH+9SRnt9PRmFfGJOwgUlPtPk1ClUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEr9eVU+4CQT45oW8KkuZLoq2Z+IqO9RQgfLg8HX8Xo=;
 b=BVj5hRr9dmHNC98h9gMNlYOqHi+k1yfoGnl54/w0nEdRGxD6nWyVEchs1db3Jt6mWaBKydu6B8geoAY76W0mTA6InZY8m2staY9oTyNEsn+SKuOXkzWCF8xiG3izJ2Ef16ac5tvmf6KZ5gek6qbc5w865XFM/rR20Z76lwo3rvkTDNM0MgnSFV1BAybU15srBR8aDNG6MBpNnyp0ITFynMdfMGU/n3LNFaNA8f3nixggrFeJFmboOZHPZDGAfxNGYP3sJb+eu4BZL/WVl/RU7FcedcWS32zp4pwwO7FO/i1x45lpn6KcCEliaZnhAVeLQVkcuBrAdzXiVarpimEVIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEr9eVU+4CQT45oW8KkuZLoq2Z+IqO9RQgfLg8HX8Xo=;
 b=tB9iMkkLts6N+Upz0TA7MxdXiqVDbbE83BF9OE+ZtH6d6XHpV1+ZdImZgP799zeuOhoh4FoQhc4aj/PhBmDI6kp7lAIg+5muY3OkPGHqg4Rtwz6mhTzKHj+Kihx7wrqwgLQWj4hdlCmnIqQOcz5SSZIlhb0/L7zufDoQi09Ffs0=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA6PR10MB8181.namprd10.prod.outlook.com (2603:10b6:806:43b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:38:36 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 17:38:36 +0000
Date: Mon, 27 Oct 2025 13:38:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Add more Orabugs to dtrace.spec
Message-ID: <aP+uGR+uKdotn+wp@oracle.com>
References: <20251025191751.32158-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025191751.32158-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA6PR10MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c18eba-68dc-427a-55be-08de157fa854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PDC96bYN5tRQR7WdZNHlM555rRkgUi4trUEONhZdcVLfePN229QPauRf6Qzt?=
 =?us-ascii?Q?fGDKbzFlrpqvkejaERdQCYCdp2y6jPO/C60mnpZtX5kYucbxn8o21izpS6+2?=
 =?us-ascii?Q?7SW1VCfHtCVhj3zEcprcqWEvuJJ3X6OHYDRobYpz7Jab2X9BzOtFQZZIGizH?=
 =?us-ascii?Q?lC/Ev0GOzwngwALLji9mEJkdOSRxsa4dP5Dvwso5I3fl1nkkO83yUIerliHb?=
 =?us-ascii?Q?fghfjQGO0IWGmHzJO8hQfWr0tvKcU2g59TSFlX33j9AsQphvbM367WH6es+n?=
 =?us-ascii?Q?bsE9KmcGlqR2YwF3kQBTbq1xpivDqJZBXifj59OkyFvXmBy7MD2fsLrmtv1d?=
 =?us-ascii?Q?CWj86SgrviEqCYnRzMLJb2KeLCk32Px8qbQaYGY9RHfDuJnoBaSNxTUiyImV?=
 =?us-ascii?Q?LyLSA5sHVzyRtT6DGJBQ76A7i8vEdV5lhVvoaObEj8LIdu9P3icPk3+74dQj?=
 =?us-ascii?Q?20Tmn9pnWOtFkFhHLiu4bfghIBTOScqd5adrWqEK/N4e4z5bOJT7ttBm14UJ?=
 =?us-ascii?Q?vw1gAUAR0t7QDr2HcI2G9ui9hLMkPvcXoV5ulH8Na5GiR1pcJhBOrjrHsOvr?=
 =?us-ascii?Q?/0A5rIabQY/ZlBi1iOm8xQMaFyyR4XDN005k21vpG6NkEkbmDA69FOJo3Bpz?=
 =?us-ascii?Q?zJvEDmFL3bSCmjCkHtRqh4fOQndKbIiTP+hbnrNsQXYXmZGZaDRNfs1ZNblw?=
 =?us-ascii?Q?1aXYJD5pnrQDelnQbAWFl5fCdQTNhr1SNRQAhex6ReIl5n9h5dumyzjchIeC?=
 =?us-ascii?Q?lcehrzuHUbGxznAatWxmUOeNQF293yA4Had4SLbY7JV3p7ZxcGeNENfDQ0VD?=
 =?us-ascii?Q?OfXF8b30o584ZUm4DFPyfSIzNvksoMEWbpfCpT8PwjkENwzo800BMnwF+VOX?=
 =?us-ascii?Q?B6iPCgQ6TfQeLrlKG3JkwYp1eK2hASFbpXVRJOTqaiiTctPuN7sDf5CwBHr3?=
 =?us-ascii?Q?XnVhEoI2zYZ8aislylK/F9AOClVt9jNOd3Ykz7dlNSEiPYUk8L5cH9GfigMD?=
 =?us-ascii?Q?NjA04nKRe3gYYr6UvH22TiB5/lzPQ2XoMerPFwQIPSusUCwGyvpR2TYQnHaw?=
 =?us-ascii?Q?OtWCmnlopisQ8nL5hrqAMjKnTc6t8JNUz4dPeYTa60V23Hsf5eiI+9skGrPk?=
 =?us-ascii?Q?mY1e3fO7kmVOj5fDako/f/hzaydpj1Csk2H70Xe4K0VDE9bPzmnjoW4dVs0R?=
 =?us-ascii?Q?k9KZiNQicat6wNj6Qkbyn5+bwDPvJPbMORdLUDVnQjq91p0tv6RvCXbtGoOs?=
 =?us-ascii?Q?dehILcYGlw7D9h02+jl2ME3bqX8oF8RgHKkidMRiTQVNXto5hDSDzss+DDjw?=
 =?us-ascii?Q?RhOymRkfwaVfX6USe0vwiLAxJpLwT9S4BV1/jODYJs46uz+kA5flmf6MFxdv?=
 =?us-ascii?Q?rjMku8/Gs9t7mMGGn4xRCtud7ipLO8E9fBbyEDMVyF2z5UTFv/ueDUP3H8IZ?=
 =?us-ascii?Q?+C+S4iAD5uUu4vLQpw5cU4c6osDHRw4e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jvx0JRoDVsZffNMH14mHhBW0zKtA+lid5YrJD5UrrXXx+7ddMrRJZcQig1rh?=
 =?us-ascii?Q?1Bn2o1PSSfB95VkJZ8W2GXJHcTa24B83qpYwko8DjcoFLx9oXVsxNxKv8ogS?=
 =?us-ascii?Q?FkxQogxnvqdX6Qi8rz2bW223VddNchx7swtpxu9wB6ZVyiiQsbtq7zpS+Pi9?=
 =?us-ascii?Q?k7J8/MocwgSZUO9Mf+WIo15sNmMJvqTztMhYb+aFd2sLRbcXIU40DzI1U/gL?=
 =?us-ascii?Q?VIOgvfPmSCu0uWg2lDIxFq6C4Kb+fscnCIYAygGqorl3wikZmC93+mVhis3v?=
 =?us-ascii?Q?t2AFZTjVGs/3RSvKnxgfe4ETF2tc6NB3JVXhSOT5J3WsTV8URYVfGSHF0AgO?=
 =?us-ascii?Q?pK3qkb/Pa5Wp2eOzmW5Q0G5k0939IUoM7elyJBQZGzQUaftmbvzJ5/0OIZIu?=
 =?us-ascii?Q?eIgR1ZLwAPW5vP+nMq5voNdMIiOR21YOQZDWtOMZWhI2bt5GeIwcwtvJJf7i?=
 =?us-ascii?Q?bmR21n2z4V5uPrJ+J80FjRPy+Bs51kKg8qkfSssC83cjZypqKXBpvhs2qmEH?=
 =?us-ascii?Q?TraoYCwV3JNSgb8pQTA0uk3enVCfWImUV1Yo9RDCwcFjM1659KcHvur9mRv0?=
 =?us-ascii?Q?UwP5XhO6Zc5b1D+i0ZIijIZxYq9cHY+FDrhhZ1KCGLUKEz2HUpOEYSkTpfcF?=
 =?us-ascii?Q?LqLQ59PH+bkYPXUjh9/X71emCM9SBFRQkSUo8LqKcDAadkrbMAvalxEgp3Zn?=
 =?us-ascii?Q?NYsnZO840qWiTL4jGOx5bo0i+CFrvzPjzohWhrSiaK749axC9MhXFxy9qqlw?=
 =?us-ascii?Q?IzwFA7T0NZKWEfmFAcQi9/wIE7L94nMNMJ6XOXSfAsbhnHXHIBHfr5DuOYtQ?=
 =?us-ascii?Q?iuEdxwcfLQb5YCa+LRJtlEI3Aad6W0Pk0hyQnz3CbR9xdpLqoTwoi5v8VSSk?=
 =?us-ascii?Q?if26ZZDJ6vRK1evGnnfHnQ2SifAdszhvucms+FKv2g0dlodrZH1pe2A9IUSy?=
 =?us-ascii?Q?QHUvUATxZtEkB9FE7+X6Fzyu2+ojYNdmrF5EHfvRTSK/HZudLD1uTUGdhQ1x?=
 =?us-ascii?Q?aFDi0MFD3JpFCgDDA7U4WolC/lypcpNNa7rV29ZfsBXW9pDiJ8/+9qtejf7r?=
 =?us-ascii?Q?fynuNW7KPXty4rLWyHsmH8XsryCk54tYnHa5mro4LvU1GzwAKEQt4sT/eXRQ?=
 =?us-ascii?Q?Y/OXnuiQhUPvJUHrV6D3D6ZZJr3Q3J/RX5U9/tlomjZ1XpTzU3DvKDXWa6oC?=
 =?us-ascii?Q?bo8sVVSsorKOp4/nBycbj18nIJzkrGirQjiS7MZbs9Q9gx8pFBRLl4FVIzM0?=
 =?us-ascii?Q?2LMrULtIu1zNlnYnYRc+B6srkO2J8dU7kt0cSZn8/qyh66Wb5Prnv6hhrx54?=
 =?us-ascii?Q?xowfH4XoKFUgPcDUH5TQlBzdrBfVUjFwDdD7NCf7ahJJfGTzKGrQUwSrLoSA?=
 =?us-ascii?Q?GnLYR1UYyPVKVwi5YCfuG50QBx9mvWKz7BKQV+3bostocWzDItBAZk4JFKwy?=
 =?us-ascii?Q?cEzAPt3+tQ6U4G/BtLdlXKaFjrb2Gt4kvpNQE2knrAjJvM8mR+ekUauQXvzR?=
 =?us-ascii?Q?zs2wPyL4u/6qmBC8FiAnDfP/iMO2mg8wuIVOpAo1BpDSBzcVPdtVG/sJijeD?=
 =?us-ascii?Q?0Sh6oF0LHhxal5R0aA0AcJyjzHtJZRGZO6fzOYT60s7R1HYk5KD7UCQK2P5z?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ToNdBV1GKlixrD4uGc+X1JyQybeJIXChqEueYPRqBrTvRbvU0LhZKNLEjmujrbNum9QF9Z1CgqkMyJWIXoPvwaw3C/he0UzHEaQG2/tmOK5GwpIVriNWiXO2SbIzgo2M97QSAPLdFQHtToujNGfkHq7Uy6SwA6bLgG5JEG6IgYalUFAR+elje1ESlZsl8flm7Sh9il+BiU2ofUMGPlTU8mdfSFVAWFZyxzfKSEjs3w5qNmYC9sxWOgjMHhcbkVZi8j71KeICHSYAEzPPzRkNEXdslXe7lZC4L0VL6BJ7qrXWtxuEjpTh87DwmARNdAcpXZlLHYUkpu6EldX9AI9LPyrmyX4Dev9DRNqFujpsZoBzTTp3RHF6ushVAS2PKQDvAj375zrv+LRI0m0pagnGAmIikdoBVzgBh8UwgEnlCgvNSYi+U5WCuZbdQY2BSZYyU/EFJ6/Kz6AU3LeEHcRI4Bf7ZBnVd5B7nwX7upx8c/XRK4E7mjmn43XWCAAQox/lejZlIRWOfR3FsmZmkmEnMg8H7PeUDsnhTZZJuXheiq0Tyu02qq9NK1RIHTxhQknh+m1cUygYEtU0PumMKcWpEh7W/K3a6PRNqeby6wopqLM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c18eba-68dc-427a-55be-08de157fa854
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:38:36.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lf4bJZAYgrhPKjPhj6yU/reSehi1OStBrc+1lwCCM+uy3AcO6ucAzEjiQnVOg+skujRcW4iyIOn9G/M/iQWGnhD4cKMc1cYUk4pcNv2pygc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8181
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510270163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1MiBTYWx0ZWRfX8eLzL1fsKJXL
 +FhoRfSY4dd2bKeyaRFeq7UBBB59SdHZlMnhjD02xVHc0W5ypf2SsTreoTq8zXnPe/fYcIi906M
 BeH+VzxEbwgXBrXGSe5SRbwo24PWvvkRxR0cJ6aIAyW/qVnRZnRT39Jg4RVXUlA35Joth2k+1ir
 dmqGhYwRZca/pf+iahU28DPKfBYZ1LHThZqCdL4SeW1paIr1PsEEecHzFqER5ZrnaQvA4xbAjNF
 AtAZH4v3tmUAF4qLZ++Ec1AhF5vEWuxdOe1GwzVHGeYsL5HvsYaWhhA4ry2yWfHtwUB3FwYTzO9
 F1o2nL8V70VwgLEDPHFic6osRPz961JxSSesK6Kicw6A08zcEvtbqle90/Uh9IDfYuhMevW0Sgn
 ZdA4RrPpGhYr5ID+a/iYB5ABp+zUPg==
X-Proofpoint-GUID: gT7StSCjr3IK4V8gWn3in2Cj2lrERZok
X-Proofpoint-ORIG-GUID: gT7StSCjr3IK4V8gWn3in2Cj2lrERZok
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=68ffae20 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=1rXSE5xgFzKGdEhJYOsA:9 a=CjuIK1q_8ugA:10

On Sat, Oct 25, 2025 at 03:17:51PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  dtrace.spec | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index c0183cb5f..a4f3ed774 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -242,8 +242,10 @@ systemctl start dtprobed || :
>  - Error injection via return() action.  (Kris Van Hees)
>  - Improved string handling.  (Kris Van Hees)
>  - Various bug fixes.  (Eugene Loh, Kris Van Hees)
> +  [Orabug: 37994729, 38249511]
>  - Various testsuite fixes and improvements.
>    (Nick Alcock, Eugene Loh, Alan Maguire, Kris Van Hees)
> +  [Orabug: 28763074, 37459289]

It would be preferred if the Orabug numbers are associated with a changelog
entry that refers to the issue the bug fix resolves, in a generic fashion (i.e.
limited to the issue in the codebase).  The Orabug mentioned with Various
bug fixes and Various testsuite fixes usually is a placeholder Orabug that
captures the entirety of the release.

>  * Tue Jun 10 2025 Kris Van Hees <kris.van.hees@oracle.com> - 2.0.3-1
>  - This is only released on OL10.
> @@ -334,7 +336,7 @@ systemctl start dtprobed || :
>  - Fix dtprobed to support DOF that exceeds 64KiB. (Nick Alcock)
>    [Orabug: 35411920]
>  - Do not modify input files with dtrace -G if unchanged. (Steven Sistare)
> -  [Orbug: 35417184]
> +  [Orabug: 35417184]

Good catch.

>  - Various testsuite fixes and improvements.
>    (Nick Alcock, Eugene Loh, Kris Van Hees) [Orabug: 35435195]
>  - Various code improvements.  (Nick Alcock, Eugene Loh, Kris Van Hees)
> -- 
> 2.47.3
> 
