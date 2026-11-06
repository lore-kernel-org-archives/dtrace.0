Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794000558;
	b=E2H+rN7wvrj8Nz3XAzh47jRCWk5xxrMHX7wHzcxEswMKsCEwK9Kb5mcPzLTwutxwUMCj
	 l7fWoNVbZo3xzDsX3IXGnyMuzVefSVyDRJPWzvKE3MtNwUAb1XkRs5ftGl41qAoZFoGLN
	 LeI9zkt7O1/WSGuoFtlQ6ncJ0fjQSkpsjDkEvxy2cD6KiM365EMu/Qnp/zqqoGfY5dME6
	 hlicXvHmYTHIxsH0ErkEMZCpuZIptUYUh+AaDFDhUi98uZ+He/WenZsLR8Usm3FLkXRc6
	 66hzPB2w7sqDGmZrad+bHpyu4R2xXv/zzhSe+336/Ca8N9GWR+IILlKq+yEhn0C8VSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc;
	bh=ZpeWsiPomIK8rGbRgXD4JHxEOi1dhx4Q3sTq61T/Ymk=;
	b=A8NDKETveXr+swxlx0tlXF1NyjKXqLH+O69RYa462Vek0g4hp74cYY1cNTCM9cYsdYVP
	 MRQu5486JSGr6+CrrcD7Sd0Iq0qhRu0LRLYAW1UHlRnh+6VPheDEP926hSTV7FTlM1JLi
	 09hgOUGM3REfiQVYBjlcJCQ/E7ME2WrjOHKehVciBq9wYiDFhnZUR2fn4+Bumgdid9Rie
	 DjgHZeWy9YaqbqhxSOFPpcZvcB41fdK8/iqWGVQOKKQlnadW7iKADTaRYd6reKne4ydHY
	 wznB/vSBTCN23D9sJ0CNlmisAlF3Sc31vP6DiA+Rqf0ksqv2gEqmVdsJomaYkxf2coQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=pifiD2DR;
	dkim=fail reason="signature verification failed" header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Ee82Fkga;
	arc=fail smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A8606A326
	for <dtrace@lists.linux.dev>; Fri,  6 Nov 2026 21:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818A8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=pifiD2DR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Ee82Fkga
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6FStLA3731775;
	Fri, 6 Nov 2026 21:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ZpeWsiPomIK8rGbRgXD4JHxEOi1dhx4Q3sTq61T/Ymk=; b=
	pifiD2DRSpJraPkwUeSbcJolU7aLvFJC/wTCobtd2jkkMO8xQQ18ZqUQM0DnVHeW
	ZmC9cQ0jVzBp16reKMYj7a2g2p6dpUoK03Op5SIZL6bGthJWbnOt4proa4XRH1rg
	tlxofpgLYypqXq/cFOm+L9YYQekDEnFQ9LRO37T6L5v75kpbD1kU0w+0dsQ17KnW
	DoODImk7+YQHvOGn99AFzzjhNXWZ1/Rla/4mnnKqBgJR87S1h3yojlG7GOdnogI8
	XEr2Cdq8ZTUKdOuX4v495hoArYHWXnhS8d1cZggkMmyHwYVJ3ieich9ASryIM03O
	pWFMXX4u7mO9jCoUinQ5jQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hs3qk9ftb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 06 Nov 2026 21:29:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6LF3TC1646487;
	Fri, 6 Nov 2026 21:29:12 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hspn40cf9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Fri, 06 Nov 2026 21:29:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbSG0iE2v0lmLNOss00dqUHsSv/5Xi4s91QMmbxIZeDjCIKZhcosv+Ed4FaPDWGkn1R91/kJWslNOm9zQYuujYbZ9eXkgnmChVI6OlaUU5HT+DQyvIoC5Ink+xb74sM37vfTpNYyIJ6ayspZBNpd1koemkQRLtUXIUNNlWftfuZcCTT7nerry1f1ozPXssrP/z50XZwa9qplaHpyWinEdb6x5VT/FWw42S5yQNqni1S4FaPWWKoixhdFL2qwSsB2XuozglNAL8/fJp+Y4DpLORdRpAI0HZPAd4QLN611iDG/zYqa0T4+1QKA4y+C4v9iUbdGejs0XRUenw9qEhV2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y2zCnPADmUWUyvB2Bw9yaqTLpqsneWIG/Ve879mris=;
 b=ZoXjgkRBif2bCyO30IQIroPICGfEe+oxlWH9aHZ6Hs2fGjlVscRnzknDdXkK0Fx0LXwom469cCPo4ceJsUPJosWO+hPb6xikNeR1NQXDLOSO4eZY3NpyjWJpM4PMzH9mdL5ii6RfCVJzDWKkL1MiBCrHNZuLZrvAZUAShNFbtLpvFVNMfDaa2XceAC2pPpSWCF6KcpUsHKxFLezSmhtH74lN2PIQsax4fKFq7usmJMbpUfDk7oem6AZNwc5Zk/u+/wXE37+/cisTZB2DO0RqWH3HhpCp71CGDEZWI/YZJ3uihGPtR/DLvFFb14apPIkrSQfs41MCYn0RndUF3LCiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y2zCnPADmUWUyvB2Bw9yaqTLpqsneWIG/Ve879mris=;
 b=Ee82FkgaYo9TTgB280v25b+SdbWKsE5qSKO9n6JCWIHE/LavGv6b0Kz/yfvrPYhdrEniTBUrDIlHNW6avfy/QW/hkg6DHEq0HHTV1n5aBBp/zsx6DbS5BjBCIfV/8hSlFStqGCViu6im0d62xnu/qfkIKIChhDriutXw/ahOHlE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6993.namprd10.prod.outlook.com (2603:10b6:8:153::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 21:29:09 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 21:29:09 +0000
Date: Fri, 6 Nov 2026 16:29:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
Message-ID: <au5Gojt8RguVHIzM@oracle.com>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
 <87ik2artkr.fsf@esperi.org.uk>
 <877biqrtg7.fsf@esperi.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877biqrtg7.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eec8028-356e-4ab8-e299-08df3c4cfe6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|10067099003|261102123227099003|18002099003|261028144727099003|4143699003|261022105027099003|261026140227099003|261026121527099003|261021135927099003|261022075727099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kvRcxWS9n912Ety/g2nywj20oopsAn54coG3FNskBe3moqiAGuJo74H6fmi51I96J+EdQVOO6e0ujrCu2f2tdZ6JD79Grjwl6MxIcjVJr/+AQo1/id7JU6Epv2PDl2RSCVgRpaUbQcQ4633bRzK57CGIvmGhmfFmEIPRA/Xtqt81qmbMCemzkJcELikC69s9KdPAc/RPhx1016ymhkzVYfxF3Vb4GeUZsEJ3IMEyMd1UTe899Z2gPRdsdfAxCNFo8/d5TA1Uq/FEuHLey03gzVLlsNJb60l6sgmz1YB1tVNxlaELjJO0ctrcCj6J5cBr5F5TgpSdtwsBbfp9MHj/iCYXCsdclBrpRYbNZlQAWe9cwEyKKXUhoDVi+ndjKpHqwi07U1d1Rvj94nFZu2olurKZiBKuBaXK6SpnQvjktZwWm0Ao+BU8EkepO8U+7UQ39cLeTR6ufABJdp53P8mw46u8BomQt6uSP0MbYADPM/5ikhGOfqDSh3WaXV8hewJUmA7KuUCKCuJj+CrXtyNyBtQJqG6mBTv9NvLlifoNTR/mgw5l+SaFeLBYyU0h+NM7c9Psyhj7EUFhMa12nnMEF0iTihdwFbWZjQWpv42bkb6MY9GK1wlUbGDD97WMW2fFsaLMwWThVeyHfGN9yKkJrSOuGCVmonSk67/WqdQLR0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(10067099003)(261102123227099003)(18002099003)(261028144727099003)(4143699003)(261022105027099003)(261026140227099003)(261026121527099003)(261021135927099003)(261022075727099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?YgICkdmAcsA8/sPmfH1ABCvErNe0Mppgr7CGHwqu3RGkB70Y1Ga8rR+60B?=
 =?iso-8859-1?Q?So1tgepvan0FqgFf3MiVPkcNN0+8OIvHYmbZtok6KBoGSNAFBVWuPKxpRO?=
 =?iso-8859-1?Q?E0ulrQKqar+W7zB55n+mU+0f+N6Y/hLaSuCKbHX84urPc51ipgkEKRnzxa?=
 =?iso-8859-1?Q?WLygOgft99L9/j+NKw8LExAyodBftuQivRnLfqynqcuoYGuzraFrGmbOsP?=
 =?iso-8859-1?Q?xY1lnVN3JqMVuNZfmaav4Fy+CyUDHj6gqionFtRyLEuAuFh4jF/88n2HaG?=
 =?iso-8859-1?Q?ARHz61NlO/hMziNfodk3OpU5RVXB7RQgzgM0kuUUHKwxDitf0VfgvC3W3f?=
 =?iso-8859-1?Q?cqS0b6r4dZ3yaw+QiBzGOLIhYIhxD9Xd4Nzsbc08WUfsP8MEGcOi/xiZfY?=
 =?iso-8859-1?Q?vK5IEk4ttQ/P18/uXn7aq447tJM3tW1expXd3PjNCyMsPPY79+d277vkVl?=
 =?iso-8859-1?Q?q7XWexpj4MaeVjYcycA5Vy9S6hUcmy36Jl93quzhvsE1+rxgUEDr/ylka4?=
 =?iso-8859-1?Q?PdQTaYH15y/xMkUDlQ+u22Nk7vy5ndG8vMkzxm6o5xMY2JgAfnBWqwjLdJ?=
 =?iso-8859-1?Q?QCJpof4N+pdXSlvYrc4ypRY06J5u2Tl7NHVoPWHZhtoXzHiiejumV9T6EG?=
 =?iso-8859-1?Q?V2od74hlzcws0+fVbQ3G64kI93h6I4s/UChA1u3O2mmmZS6SQbyEjJ2cSk?=
 =?iso-8859-1?Q?r/h4zKNbWLJicsc075/A+PO2QmcEHxkl8CUCMwrj8qsbI9m+F9wvGnihh3?=
 =?iso-8859-1?Q?i9Fwb+1C/v/PjYdhMh6+kYp5PABOz/4GpF/eSGvkFouZSjng59bGr2yeuk?=
 =?iso-8859-1?Q?gD6K+ovUsxeuJ8Do+hjfJ5oWpqQPhB1zIg7RLslh3e0b7JV5+KTrwKD9B7?=
 =?iso-8859-1?Q?J1/u31lWQS0HhrCODPez7gGxr8tA6t1Ev5SKhc9jcSIp3j5EofXfzAsFgT?=
 =?iso-8859-1?Q?vU3reXvlG1PKO/kPKMx1PvxHmeaOFL02RiT1/PmueKqDtQ3mShmMS5iQyN?=
 =?iso-8859-1?Q?S2Vjh6BEZGRaQ8n8hy0/x4i9YO7HhbZSdCXj1VZbLBJ3nBupxiNz+EQNQ5?=
 =?iso-8859-1?Q?Z8Hh545AtGbzIeq7F+//x72TkcXmFCGI3RHSCnsR1TU4TpANP4MAOz02qE?=
 =?iso-8859-1?Q?hx7AZvMDDNXDYgRf2YxDRKIkXeTQgNDbvwHmESErZyrCq09ICvhyQrZeU/?=
 =?iso-8859-1?Q?dtjzxe18ydTalFOnaDp1sWntGoldkRQSHHFYiXEGMoZ3Ys/Jii8/3sHKAk?=
 =?iso-8859-1?Q?4o0bJjsyM3YgFWT78FlB/5R3koFNH+hzwX4Bqa1OsqwdH49Aw1N2MoULyl?=
 =?iso-8859-1?Q?BOHREz4Emg9xnexX8t0CFDQq7xqYa9eGqP8Kb91syJH2jA5xUHkVs1T847?=
 =?iso-8859-1?Q?fMR9/1OuFBFBDiCH/sGIbMUM/dBBzueORRWUSbzzxONmWt3xiMx3P4c3GM?=
 =?iso-8859-1?Q?ZYORyoXvbtpfNQo0EpKTQhcUGHrz5qCdxZ9D+EbQBbm6TcNrKLwJrDUdON?=
 =?iso-8859-1?Q?Bz2DZV2XCBV3UGO8ywAov3XpP0qq04WjidPvf5+jKgf1GMSkzkAjTgFAdv?=
 =?iso-8859-1?Q?ptRJVDYgJY/HVX2tj91kMh9oP4TUBt6Xfes40x6W4PJbhcFxDk9DTeJaO6?=
 =?iso-8859-1?Q?6l4Pp5I5Zv28ozURSZcED0ixKvs6RzgQNaAqxYbbAGHD2gHT1jzZiFxoff?=
 =?iso-8859-1?Q?/cCDSRP0yZVJZ+IorGFbPZ4rbYOxwbKDa8rlOA/HYCbd+AfbqLFuq62GdD?=
 =?iso-8859-1?Q?IptzJmOT98dmKyt9e07+QPgGtj+VfAl8yUybvDDlvKOypYkKYZLY03iq/H?=
 =?iso-8859-1?Q?TSTbPMcmvQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	R0DxMpeSBj8ul+OPpW3fY1DuctmZPtDdUjljRuV48SBvniSQ5sS2woMqpO+t97cRRKXGnSRtU1m3QbTJyuk0qU4XIYeLjjUz9Dzmh35zGQb5Dg6+xvlRt6uKLJKjmHKNSB8xQ4cLgpp8EEkj9SnXhvmAuk2oPBcelyC8VUVRYsKE3Ii5lQgOgf5BBUlIox8SE6rYRNb4fTWhSSva/YOqJGx14AFlRjXWHQi+KXmBvoCYYs8quKXurXz9w4+d3MQkK4Uzt4TVz4Ye5NLsb2Ovo0iPzVMqFwo76OTrp3AqJvdLRvZzSiq/PFX7TWidE/BRU8kk1fn6BQK43ublDZ0/wA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CmzYjHJmSk9CQ6oy80/z6jca6fhoh0p9a68c9kYjH8dpvtc2N3uZVrYROeW5LhxNJpJSq76cRAyU5Nrp2NkJZyEP27un403lvu11epvtIRvLgvqRrbWgoIvo/fviGAaPnDhYX5Xke6x1xMm2jDLMhnEVQC0T2UmKbsPQ09SmeEPMhEbFTN8X0qlow7AUHwqe+h0NEH1xK+WwTXfRXInWuc7FTMAskH1I42Pqv3Kog/3CPfMpthzTP+GQuq03a1zB1uHCj8uwUTS8dUEcXlSuUqcQMHE5mDMu1PfKJBfar0a0CA3o6pT+hxBsHkqlaTYQtsRcq71iCwLdjW8paAiMx1LDNH5Th2tmgIL35oZ8AnnQU/jnUCFeDwyfeei0uWuzRGrK6ioRgWPAStlQcAvKXyi6SubL98nvyKYKTP2dgWAG2U6vEr/2TneDGkftUbzb58LOGh031wmkvqJ4qFmI3JpCaZC3qVqQXL3oFqapcNlgNHbqFMJbNObfJCrDEVAlr26ND2voO7sTPMsEBL6Fg+h3qOU0BMs2I2XPCQl0UQfEHPFJj3aBeeB/+yNJpWGFmu5EC6mFXz7ZKOEX4qtc4EAqxxzHOnXHxNZ2dsmV+40=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eec8028-356e-4ab8-e299-08df3c4cfe6d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 21:29:09.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7HybsUqoMDf74TllABGgOBPS+1P6lUolg7csgWzQX8bhZ9JgX2wsxm+16Mk7XwjcZwyq1dI9q+lFMD11hYfwTjDVKaSzJ+1nwg2ilJps20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6993
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxlogscore=754 bulkscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060085
X-Proofpoint-ORIG-GUID: PZe58Dhq80bOBBG3iVGViHNaYi1a-S7P
X-Proofpoint-GUID: PZe58Dhq80bOBBG3iVGViHNaYi1a-S7P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfX307X0kFF7Ior
 +EVJWN3+syBdduj3leOQOyerveZc1KeaGMi1BqMo69tQ9R4+l8mchIg411Fd9B9P5uTGdEYqL2I
 PSBWb0KeaC7RzQhsi2GWEBrLQDaadVPkV021xX6DjGQH/ISeQCN/
X-Authority-Analysis: v=2.4 cv=Yqma1IYX c=1 sm=1 tr=0 ts=6aee46a8 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=UxJOZ6T-jAWmXP9Sf3UA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NSBTYWx0ZWRfXx3/m5NL82W0v
 PCFk+yRdHxfJKV9/O53HGX5bYAjQ3t1u1Do7XLXSBcVg3E8vRQXXzXjqso9U3Y8kqgZZLQe1Utp
 c1rZX1DUzedmrHbhZhRArgax1GAFfzcNUesUK1uspqh/7r2uIfVXHNoIrZTwIthGVe0IuSRN5yx
 YGK9qYuRroo5J/qaaz5SV5Q54BgD7SwaCiHQ4/KdoSA9uyVccMcrUtwqGagsbF16jo2Mdri7Wfi
 iMfbh+gXFr3fPYdR0a4spOTAsNiSSDkove/01IaIa5ccjAzk16/K65lT6FNYiW4vQQcNHgfkMOs
 0hWaqo3XcliRB/XYr0dQUzGjDw1Qe68b2ju0DmEsuLnIBOO9uhGuBZ10/w6bFmqIs2sJyP3IOBp
 yi5OmlpKl7a0aggqU0DnvqTvuzGRI348Fp3RCiOWghW1Y5ZvwdQqO16IHmhvE/rkdjavfDatkXy
 RVOp2A5v31+2PmZzUUlab7VpoLtgLCmRZ0vYv/K0=

On Fri, Nov 06, 2026 at 01:16:24PM +0000, Nick Alcock wrote:
> On 6 Nov 2026, Nick Alcock said:
> 
> > On 30 Oct 2026, Kris Van Hees said:
> >
> >> Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYNSYM,
> >> loading strings through each tableâ?Ts sh_link. Search .symtab before .dynsym
> >> and include dynamic-only names in module symbol iteration.
> >
> > Yet noather place where one or the other strtab was overlooked. These
> > mistakes all date right back to Solaris...
> >
> >> Preserve .symtab indices for CTF, place dynamic and external symbols in
> >> separate ID ranges, and use .dynsym for CTF when .symtab is absent. Allow
> >
> > Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
> > dict flag), .dynsym should be searched unconditionally for CTF.
> > Preferring the symtab is wrong. (I suspect this code is basically never
> > run, since it's all symtypetab stuff, and the symtypetab isn't emitted
> > for kernel CTF.)
> 
> ... oh wait, this is for uprobes. The symtab in use for that follows the
> above rules then (and libctf does the symtypetab lookup for you, if
> uprobes is using that. Don't implement it yourself simply because CTFv4
> redoes this completely while retaining almost the same user-visible API,
> and you don't want to change everything twice! v4 always uses the
> dynsymtab, unconditionally.)

But I do not have CTFv4 righr now, so we need this.
