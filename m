Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6412B82
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282419; cv=fail; b=bNE06JDZUam3YsQQGRJpEgvNsL2X/Y3i7KmcwPguMOE96uACiN+GaNHPWNT9qBr9Vcyi5xMous7lxpG49u9q3cZ0ik0PQVwafQPAJsHt4tIF6M8IhOdzr+oFEk0DylI71VJq43PK6EwtAUSMSL/ejWtcTxd40l4xPmG0aD5zZqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282419; c=relaxed/simple;
	bh=R56osA+jzEkQlpw0XT9hsxf77/KgTscGg5JDiCeaqLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Did+Z8lAx86I8KGl/huFyD9JZSUgThJ/BWu9dwZYjqozLE7nvaDSx56IDZ5K0jXTxi2Bna/u41qy7dXWFF+qaoNrnfaWoz5ZEEu2iJxjM5XVXBpwNdQD2Wmt9o0WQeXWBT8adUJG/HbwI0oOjQ2p/0k9IArvtZByqtw4nM4X//Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O59BhEmt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ePg4Zdf1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O59BhEmt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ePg4Zdf1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48E1uVXZ019857
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=HGxZIa8pDP/eXVf
	lu86qAncco9sjC0RzdvTJ4P7ENPU=; b=O59BhEmtpxTWuaUXPBHkpxNw3BXz0ej
	jU+74MoOQnbDlx1LTnHaMOLTsF6L+iW3YLCw1vMjHixmUms+seKjN8uenhqVvUKG
	eXHtVqm7lm+ZEWmPBR/d3c/mVDl1f2rxPPTaE9YKlIs5nya/CfP6bf3JjZB2XwOY
	a1slmwuXlKYagc4z7gHvjrAgY7dXQXRwK128FW5q/qZ5uSb8uUkGThHLfB68TPoJ
	QNwdrXgPm5htpqfJ7INaYhgjUdLPu37/Cgvk6mnGxFNiLRd5StFUXk7oqK2kKlw5
	leT7d+Q04mBzEI4bstnXLCbf3juxgUnUTibOhht6lRP/9Q5uEWx5J2A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n192r1c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:53:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48E1Y8UK000760
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:53:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0xc93r7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 02:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dByVwLco5c4ml1KF+Iui1OnQaVoPvtTa0BAF+WUBbLzapXs6+PwshqnfYOQ810Cf1/71sVbTzOB0rTLB/nhkBLUzXGvo3P6fqvvBj1i8xju0D/JIkQ52mNnB+HqEuAUhBSRXqdnGnkuNcrPuHcNCxetMMSDhhwvhP0PovUXCyyR4o4B1WRIT+QKJggmC9Vh8g93tGHEYAX8ocbzy9kkJt3wixeJn91P7ixSEj/93rMpsffzg+sHI2EgMBE2KWQcMcVyfxNmnrouYZV4knJXadB6UQ+GfijFm5Nz4csxQ3weKZoOMsbyegDdAmzsnCl/OYCAq6dr2xqs3+hq3FftX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGxZIa8pDP/eXVflu86qAncco9sjC0RzdvTJ4P7ENPU=;
 b=ljvMQ873zTWIeSotopP/kR343z3jcxihO+Bmu7mZVNLgf/3jWnP/zIlya/fvWbm9+3gK0pkBiMPzGAgveLNOIcZ1dZhc7930ylBWpN5vZXQoo9lDyfQvPTAOfBJvokVQUzNigWZCqqo4lpO8WX50eaXi1rr1X9R9gmA10c/gvH58SKCpTTYhOgfCOmUUFbmKSyIVlUYq2cwqap+f+/gvFHSuUAJKOLiJmuJxysmwNFPHu7CExe0jkTuGPLhizGlqLtN71lEb3BFR2+DO0/DOphel7+VGvP47GYELcf5Y2An9b8feGeiqtWswHJ1KsvD479ML8AoIT+7+KpgveZprLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGxZIa8pDP/eXVflu86qAncco9sjC0RzdvTJ4P7ENPU=;
 b=ePg4Zdf1UUbHjP3fGJyAsUJimaJFi9Cyz9QQZVhF+5SOK+2gV3geeM2yvg8FJifrxtFINRq22h+KgdewL0egFvngF1/FjrPuQ8SDxjMhMXGzW0I3K89Qqz2UhgGxofgANViSjQv15czgSAMOT/U/JnCe9B6xQ3iFI0Skj3ye7C8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CYXPR10MB7923.namprd10.prod.outlook.com (2603:10b6:930:e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Sat, 14 Sep
 2024 02:53:15 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 02:53:15 +0000
Date: Fri, 13 Sep 2024 22:53:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Relocation processing of STBSZ in ERROR's
 get_bvar() is too early
Message-ID: <ZuT6mHTMPMn2W9FH@oracle.com>
References: <20240913233604.21269-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913233604.21269-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR1501CA0035.namprd15.prod.outlook.com
 (2603:10b6:207:17::48) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CYXPR10MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3eb349-a663-4387-a2ec-08dcd46860fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Q6+5+E4FYP4cgCXy4sIWVYR3qL96DP8aKCgVg2iPQaTvY9PwEeyrgrK6QCC?=
 =?us-ascii?Q?7kZXEq2sibS0kABf40mfOfQU/WKha5LRhGAPlp1uh7l4quXpVUmbHCy38eXS?=
 =?us-ascii?Q?+LjPk8if5sz3nI47wu5hdYNEnMxubylp7ErqFOODunSvZhjKqJLtMVo0UHkR?=
 =?us-ascii?Q?MpZZmdOsWL1fvjmEWKGlCbgLIMcFkrUcPOmUMIHBAtsLrT41eaTrYa68FXcv?=
 =?us-ascii?Q?lJ0eAVlIPNmec9RxTG7hGg3xVg9NZtXKQdAKWCVwNhvtPuc5Ddoda0Rzw3U5?=
 =?us-ascii?Q?3/ySDZiOvx0ggRn6LB+/pCKTfCJJd2WFHpui74UnnGZzmS5XXWD01LdF2De5?=
 =?us-ascii?Q?GU+3UBoaMWJm7kj8aUcC5UVdE96l75zu1FZOe/KxaquRlCpLEKjQvkyATqzX?=
 =?us-ascii?Q?Ml8i8S7G8tXxozPWLofeis7oeazsPBe+bylgIg+jb/dIj7eoFjuBuXc7q0Qq?=
 =?us-ascii?Q?Ew59vMd5x79cKJ2q85uLujAE43RebAMlnLxTPLzNqjFDbNmsbdb/kYVZdV+V?=
 =?us-ascii?Q?aShyWPuDLCpaUfXM5pqpRdIdAtHB/gyuiNDwLx+N+3vlJU7DXhfuPuVyZn+5?=
 =?us-ascii?Q?XMa/oZxX/hqD68tMUGN1AN8JGbK63c1JTkvgcNGsh9HR1lWbs/A/apcIlBmY?=
 =?us-ascii?Q?2TsIbbBOXZTCkN2PcXi5Ho4XC4bvvx6iS9Tnc9xJD3GHeeat4czHpC1R3trR?=
 =?us-ascii?Q?YaTosDv+U4bf5hYth+hu28EshTUAbN3G80h373EKAoRsI8e/X+J/atD+T7v3?=
 =?us-ascii?Q?Sg9ylspBvnVvstwxr2X9iK7M5hltxTATyrMILg/VvbPCPdC+CAAPGoxNHcnL?=
 =?us-ascii?Q?UIYaCPSeHyAK12JHF4ks/HqS178b9xgekAzAKYohLCbS1TJdpOY6B0VBLtCq?=
 =?us-ascii?Q?iHlmcfK//XXFZhrr5wWFFtlDGy4nl15vYWwmMU4qXvyKpdDbl3zVAZ+shbeU?=
 =?us-ascii?Q?UN5C0nbUZW25/EESTlw2crtDnQTD4gsuXrBJnqZ3DyKYzeyG/ozSFZIvmtCV?=
 =?us-ascii?Q?nzD4+rYd4K5a7eD1My8fb4D4pGjR1+3SrHuDeqdz0+Epah8cFrKrJ2MpBnZ9?=
 =?us-ascii?Q?Wf+R9sxWUnVDNGOjM1RlvjZQX8/VDV5fgi57QtymA1IORQm4Z/eVZx4vheDx?=
 =?us-ascii?Q?U0WVoW9sHJUHyPRtWFhi+xxMn9Xq1eA+iDzzF+qt088vAJlEGv2oDB/Qv4X7?=
 =?us-ascii?Q?UjsH1tvqddCWBJWjppPzux9z719h3EZltCav+zzISFvO2btCbEXpqLpcVEOk?=
 =?us-ascii?Q?z+lhDz2c5lcakEKy/xuDxTolX6aec4Me1FAsTv09mx/Mubzi/7W+8GaEFIJ6?=
 =?us-ascii?Q?8esznAufMsTNeJPXAAmM8z0xvIBxhLgOBGsoUXFPvpfCCRySsPrAk8H9L8pB?=
 =?us-ascii?Q?HoivtEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8P/fydq2DcpDtKeLDSKHf2tDJAcerMLgGldDQhvZOOoclU1+m5tfDYRn8p28?=
 =?us-ascii?Q?FtMHHfLzmr5HhzbnU0oeCDuNaao8L1j1uj+GNplEuA7zvXuWAegDFip+8UXY?=
 =?us-ascii?Q?lvR6yBH2aTpeeVLBmVG/ypaofYy7N+0XlpE5RLxfVsPK7Qaqrpm3qDnkKW3v?=
 =?us-ascii?Q?0N0FE1LJ0HzJyYL0USQ0Au0kjOM5fkacpQWHNpipt/qGYfv/+g2KR5knovBW?=
 =?us-ascii?Q?/r6Sfu01nH6MEyD8WZHkKJd6kQ/07kOZ2dLQFCRXkdohdkmzdEQ18lhOTvFV?=
 =?us-ascii?Q?r41JXKi8MoRjVMs2fvRD1UWjJyhXG8lbtEjEv5N8xy81hyaIKeyKMI7/iFTR?=
 =?us-ascii?Q?PKdbGy77UIoUAnGS8fPvmfj/0Ndcibp6iW9qD2KFIhQw4iWA/+vFm8qVI1Kk?=
 =?us-ascii?Q?63kaEnBjKXRnIfcjFQxSRBUok5fVEEB/GtNPhhy2E23pla7RYu1XPzm1ac+1?=
 =?us-ascii?Q?lRBGT9bIo9G0udRZqSKe8SkHYUTRwaxu8kveFY6HJbEwAZpXib2dT1BQx33/?=
 =?us-ascii?Q?LutcAoI6i7x7BcvcGCTtZHSInROo87uCdOkDwro06/yA6bEzoe/cOCBGkG0F?=
 =?us-ascii?Q?XdLSViUbngrwDZU4DVW00M42c248e1PfvtkjwdFCOJt1Te5EL8jHDZ1YoucU?=
 =?us-ascii?Q?BuPpillf/MRm4psp+r/G/pYyhltgUXmMasXPvIVmdL1TzEhimW3pg6YQvgJB?=
 =?us-ascii?Q?Sv7WweM7NPTSVQVl7BpMM4mcDn5rOMf1Imz0ZWvWOPnLPcZQptPB4+W3ZE6B?=
 =?us-ascii?Q?v1zam1174/SF2NFleUvqIo3LglId7jggnJR+KLmQJn5GMUX2QX+3uxPlslwk?=
 =?us-ascii?Q?4c+L5VbKK3r2f8CvYatB+2LP1PvUxNP0Buz3k53dJIvaWOGaCvUvwuoZQibV?=
 =?us-ascii?Q?ls5y+Qux0KtfJ+46s2dz5Hqqx16VdgGoGqeqsNEz34Sn+etlaQDHE0woKO57?=
 =?us-ascii?Q?xTXBfWKDdZCbrQ8nqywLm8n0Hf367+t8dAwhLtqiy8u1kN4v10/5ARDGyUgZ?=
 =?us-ascii?Q?qTyQoOCYjCEaJTduDLAjPZGRGLAszl1wSGDFC+YNzwX1hxLmbYBnkZRmBjFN?=
 =?us-ascii?Q?C7sp24c2zWMBaStd4Q2vlnnpSeJwwT3pKHkyIHzpNhROaUMrutso1sxo3dar?=
 =?us-ascii?Q?u4mz8lR5oKfHMmsEhwKlhNWCC1eT/NuHxXEIzBQsZP3WVDtVZSRtu2tbfqMI?=
 =?us-ascii?Q?jUfrI2ZFkNONzmjEzyNbdFRowM+1bk2DaoY3p21XlWzNs0YV9SvOWHdRbsWr?=
 =?us-ascii?Q?/hbKFDgbKXVqSYP53VNQNM9mqyw8fxhmh4J0pWGMsfdlT7JloBtgxLqxLx8t?=
 =?us-ascii?Q?r3LESEEu76/e1vJtbMfQt73AGqXwjJi5WIdh6EQ7xYIcEvbNSIdF8DPXgKmS?=
 =?us-ascii?Q?ztBdige1ViMu2Z6G4sz6lozWgnI6ZmgaYjd1aQy47/freimJQ5sMbXrelVKL?=
 =?us-ascii?Q?UXrbSZ1GmRRn+Hvvk3fa+KfsDBn2pIU7CPtO6WLckL6K/ITIVrFRu6GyGW0o?=
 =?us-ascii?Q?/IcL4qckK8q3pLQ0u8C7bsCHyfStnVVwsz8ubohRX7VnODX+lFFzO61wIt4j?=
 =?us-ascii?Q?4jg7QHQT2wn/z3vnA3I6qp7VlUmpYiEoqogMCVwumPfMHFnTLvkVmZqGmD3R?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hA2jsjME76NA+W0Sbqp2+MB7MWsn2VXlkSwj6tHs9aAm9NSTCoQ700aaxebyA+e61oyUUuVPmw7FspYjrkLzkgOITzq/jb87ezgrp0OD9o52LbokIg2u5N4FyCF6y+XnoRE+Q6E9pbIH3Nwk8AW/IKiLAFNctxYIABi3bjrtc8HXlvUihQ7/DXtzzLNiIEA0BmrACSuQRvl2FeWJAcG/mX2b6P2wq5ckweYpYXcuo9gFBe2RErk2jdLWedeEe6h3GEJ8vY+kKI0kgD+kMwnEjk1MHn+UjiXadwsbA1TgfLin1HBj61g/gVxdLHkoryfYB0U/8gGxd522EkguK5qKQLAKTJKa5LEYA/d7DtiIYgaeuumWMI87difGC4TUJQrN00B/Iv3xIhxOj6/E1WQK8bt8x+4ZGLgTNhTk3xUwr8TNgNnJ/2Uoh2AxIPjRRQqmViwC8n+auKm/gAwGupUSmmCeVtc8kqLkWyZTz2IzsdIV+3YYdZHrmXO4Pg+muKcIXthOYm9r8/87WruBz1qd9DKCkI02+KSEHLfw5HMP1iiZ505aHtA4EreUt1oaocNtYaFOGykbTbGhI9xgq+LQTemVKno4pAVkNQf9XmlpIxE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3eb349-a663-4387-a2ec-08dcd46860fa
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 02:53:14.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRwirEq9rPuoTBzZ0i4EhKtcM4hvxj6/2t4nxXci6z57lgCFsdBPFJKCo3ZiQSV5jcGlWzvU0WwOT99Xeb94QcoK1Guf4tsES3SCbS7f6QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7923
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_01,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140020
X-Proofpoint-ORIG-GUID: Ina8Oz6kwabF8W04roskAoQ1uPxIyUl0
X-Proofpoint-GUID: Ina8Oz6kwabF8W04roskAoQ1uPxIyUl0

I don't thibk this is the right solution.  There are other values that are
resolved as a relocation in dt_link_construct() and that could be found in
an ERROR clause and thus get resolved before the correct value is known.

Instead, I think we need to simply move the construction of the dt_error
program into dt_bpf_load_progs().  I should have done that when I split
up program construction and loading into two distinct phases.

I'll post an alternative patch in a moment...

On Fri, Sep 13, 2024 at 07:36:04PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> When we call dtrace_go(), we do something like this:
> 
>     dt_bpf_make_progs()
>         dt_program_construct()        // just for ERROR
>             dt_link()
>                 dt_link_construct()
>     dt_bpf_gmap_create()
>     dt_bpf_load_progs()               // other
>             dt_link()
>                 dt_link_construct()
> 
> In dt_link_construct() we dive down and find dt_get_bvar().  One of the
> relocations is to supply the value of STBSZ.  The first dt_link() is for
> ERROR, while the subsequent calls in dt_bpf_load_progs() are for other
> clauses -- that is, two separate versions of dt_get_bvar() are used.
> Meanwhile, the value of STBSZ is not set until dt_bpf_gmap_create().
> This means that the ERROR copy of dt_get_bvar() does not have STBSZ set
> properly. This means that if ERROR accesses probeprov or probename,
> dt_get_bvar() returns the beginning of the string table, which is a NUL
> terminator.
> 
> Change dt_bpf_reloc_prog() -- which performs relocation processing for
> BPF maps, necessarily after dt_bpf_gmap_create()! -- to check STBSZ
> and set its value if necessary.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c                          | 17 +++++++++++
>  test/unittest/builtinvar/tst.probe_dtrace.d | 34 +++++++++++++++++++++
>  test/unittest/builtinvar/tst.probe_dtrace.r |  6 ++++
>  3 files changed, 57 insertions(+)
>  create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.d
>  create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.r
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 0df1a9b9b..5cce747fe 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1124,6 +1124,23 @@ dt_bpf_reloc_prog(dtrace_hdl_t *dtp, const dtrace_difo_t *dp)
>  				text[ioff + 1].imm = 0;
>  			} else if (rp->dofr_type == R_BPF_64_32)
>  				text[ioff].imm = val;
> +		} else if (idp->di_kind == DT_IDENT_SCALAR &&
> +			   idp->di_id == DT_CONST_STBSZ) {
> +			/*
> +			 * There is one other case.  Although STBSZ is not a map
> +			 * pointer, the string table size is set when the BPF maps
> +			 * are created.  So we may have to set its value here.
> +			 */
> +			assert(strcmp(name, "STBSZ") == 0);  // FIXME:  extra check for development
> +
> +			/*
> +			 * Worry only about the cases that have not yet
> +			 * been handled.
> +			 */
> +			if (rp->dofr_type != R_BPF_64_64 && rp->dofr_data == 0) {
> +				text[ioff].imm = dtp->dt_strmax;
> +				text[ioff + 1].imm = 0;
> +			}
>  		}
>  	}
>  }
> diff --git a/test/unittest/builtinvar/tst.probe_dtrace.d b/test/unittest/builtinvar/tst.probe_dtrace.d
> new file mode 100644
> index 000000000..d08067ad0
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.probe_dtrace.d
> @@ -0,0 +1,34 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:
> + * Built-in variables listing provider, module, function, and name
> + * are correct from dtrace-provider probes.
> + *
> + * SECTION: Variables/Built-in Variables
> + */
> +
> +#pragma D option quiet
> +
> +/* Check build-in variables from the dtrace-provider probes. */
> +BEGIN,ERROR,END
> +{
> +	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
> +}
> +
> +/* Cause the ERROR probe to fire. */
> +BEGIN
> +{
> +	*((int*)0);
> +}
> +
> +/* Cause the END probe to fire. */
> +BEGIN,ERROR
> +{
> +	exit(0);
> +}
> diff --git a/test/unittest/builtinvar/tst.probe_dtrace.r b/test/unittest/builtinvar/tst.probe_dtrace.r
> new file mode 100644
> index 000000000..e6cccc88d
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.probe_dtrace.r
> @@ -0,0 +1,6 @@
> +dtrace:::BEGIN
> +dtrace:::ERROR
> +dtrace:::END
> +
> +-- @@stderr --
> +dtrace: error in dt_clause_3 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
