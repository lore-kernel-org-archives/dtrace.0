Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BAB1D174B
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726333710; cv=fail; b=K1dT0RjK2f7F1Anh1GmmjtugdUpSrXaYGGuRKRUOv8bfuulpV+r90LrHJoi02Pcz7GL3mDQGHEu4ZDDX/BrFPAOlqdHOiQwp5m7YrNZWwZ5ffbqkpPsS1GGSpN9c1Uuqp0AD+KtGiuMUzhY5zAN/c4DE7h95i9CzVWS1sD8XAjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726333710; c=relaxed/simple;
	bh=BIgvVvhCuPVcbYuk+l53jhiW8whyhq/CxLfOkEYqFi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hp12EVy5plS5WtpklGlWrebkndvx82AVwfN97wP+eU14cYdGmUDb8n05OAwgKHtiW3BtwAQsFc97AB8Xshc0NV1QKOEikBpmoyZiQ7oDMMqurKSZWkSNnAlUrPWgmjl3+/BNpl05Z4J39wAPiOYdzAJwDVNyGYyNZDTwF2C3gxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Alb7Uhs+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UhFKFxuc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Alb7Uhs+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UhFKFxuc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABcff030865
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=rOokWPrvkg7Ny9w
	M050Of1h0O5ipKXU+o+0a7eR4m1g=; b=Alb7Uhs+xu7gRA4NWvaSSicFGnslxhQ
	W4/9wK2rXgXjNcqb9TdRzVBAKdHEmbr7qg8L7vyFpHsuMYm63Zw4BMM6wGqIxwjk
	XdfkWDJeCkYOREEl89/+BFGzt1KJlLoB6wVtfQ+d/BNvii4RhUQftPVKZyoiZQ9c
	rY6b/8G9ZuXMhEYCvSgaCN4jFDGdBNc90gN/n2rjwfLMz4h/8mhYVy1DuvpTArwh
	W2v6Ql+CEaLbb+EQdHSj0mL6j2t9Kt0ZitdPXRks4qiUYBNwKYjzwv0i4diP35bl
	31Cdk5XS31ZwTnSqp2dSUXjRBpgeYIa/Y/fgQic0KVsccKDBXUZrQyA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfgmbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:08:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEqI8D012936
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:08:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6myhe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:08:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOZWskDcg8HwYOhLdQ1oxs65guE83NfwSX7qCh2zvY3Wx6GmvvJRx6h9hptcGoriPzJKOGfh8tQkOuFUh3iMSd+Vw9r5CVbEMiFlOAhbOLPELSNsG5obu6fSCUz9828ucb2jL4/7mgFm56/3MaVeofYUuR5XiWG7ZYzyyvIRjLnVqXmBYW+AyzQ27y9SfD9iL8jnte8AMf9EgOJc8MzFlQWPu5HgxvwMfA/Y+7VQjBhV1ZxSeIsNtgjy6MVhXwPVU2K4NpiSXFZAk3rqXqwNSdUek+eBU7B2ThM7yC86BGf5Eem98gP+hilc8sOywETHo8KNqAz0Bq8aXiztF/fzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOokWPrvkg7Ny9wM050Of1h0O5ipKXU+o+0a7eR4m1g=;
 b=GB4g5VPgK0+wmaOoNjOnnXdTg6fIuJB6FfZaLZCso2AyDVQIH840pH8ti0l/1j2ceKvyU+Zi9F0Nx02a29vtMlSirEq3tpJmd4lWCPtksNAcNeYPAIoZNJJ+E04SjmeRbXJiHsBjAWpw1muwRjkDxVxngBFJzlW+13YsCkmnEDgQkFyBVA8nA7YYIaPPDrX+KnrfLc9Vwhw8RVg+Tg46jWLGSDRGgWjWssYn7dXVrFqbUYXDRmiSAfiDnAwHOZUqt6PtR9pkolmpQTfJDLbMVpVXiDR33J/DiU9mJufZnjbwHj4fFQMIkNFTuTsUUyHtFA9ZMIigS5FFctxVEo40/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOokWPrvkg7Ny9wM050Of1h0O5ipKXU+o+0a7eR4m1g=;
 b=UhFKFxucmVsKaInqm6sXzxF42D4pp8jT0KjKX4Cy5yDL9M4WKtGPtxDi1xPvuFMPFpieijFFOFTBewdb4j5Erzz/5Tl2xjR13j0D60T18YaSBfxyQHVJc7LRHJwnVyJ98i2pnLwZzY3sA6qNhIzVxaeguVWQcnWfHzrHIzG5dpw=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by BN0PR10MB5158.namprd10.prod.outlook.com (2603:10b6:408:120::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 17:08:23 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%3]) with mapi id 15.20.7982.008; Sat, 14 Sep 2024
 17:08:23 +0000
Date: Sat, 14 Sep 2024 13:08:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/22] Both dted_uarg and dofe_uarg are unused
Message-ID: <ZuXC/sZIL+hL8EnB@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-14-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-14-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0792.namprd03.prod.outlook.com
 (2603:10b6:408:13f::17) To MW4PR10MB6298.namprd10.prod.outlook.com
 (2603:10b6:303:1e3::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|BN0PR10MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae9d262-ea10-40ff-6c82-08dcd4dfd68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M0Aphs2wQ3qd/QNe93lsoVrKLFW2aMdtslD6T8GOWmvizzW13n7JNbwgBglm?=
 =?us-ascii?Q?rGyApn1YJU0Eq0Nwlx/9peewoQQhOCctc5FpGCFZqXhzPekIKh8e820AgMaN?=
 =?us-ascii?Q?prCXrlFOZb4F1vu+s3rFKP74QrnzT4Dp/PBDIophSHctifsIm1TXMIz9Glwd?=
 =?us-ascii?Q?ZlyZ9v3XrbB93uwvdJISNYH/VPh/hl+JbVXHKs3EI2sCOG3HchIIijnfi+JX?=
 =?us-ascii?Q?CHwkbC5sJlCWyMUajnUYqfODSI3W2aeqHrgNm8ELaCDM6KD3A1R5ehWtXzRU?=
 =?us-ascii?Q?+xOMXy/1pFq/7254svkJqJbPPhOaDkVI27jGEa3o6WX1x94oZgocuZf32w2p?=
 =?us-ascii?Q?mogzS8d76zym7AjfHtACOkbqe3YLZVaqZjZPvSBSVHPxT5q5LrYpxVC+gZ8i?=
 =?us-ascii?Q?3vEQ2aKVFFki2M2pIHo4g0OwlJEXVp1E8QrNY26M/eXl4Jo4sqvxFuC6du92?=
 =?us-ascii?Q?qRpp18GKirgSLCXx+8YC01RVOapzm+xiuc12alYRO2k4KX0DjJvaDsV+Pccx?=
 =?us-ascii?Q?0CC0XSdLWIRCtPf2e883oKSr3s3Hy9s14exD7g7HDnwci8BWFbw3PZ/qlSeR?=
 =?us-ascii?Q?mL03s//u0gYaudza+NBnvRcjtuvrQe5VczDO0GlWPa3D0xOrlzkku4z22AET?=
 =?us-ascii?Q?lyzGqssttqK3aLvD48zKrdoyblagPlz7NPjUeevlDibbDy57ut0LWI+NgzOx?=
 =?us-ascii?Q?FxuV+bRzROG2gyy039nW6Nf3UgRIOgOzwTORXLmLtD3NqsxWT0iQznG+tswT?=
 =?us-ascii?Q?MS89LNFetfAwvXAhDZ+QH0ITueErZnc0JReT3PQzQY9NczVADCPgnrKB6b0g?=
 =?us-ascii?Q?ssfZ/w0+Mvj+f+Q1yej4stn/Exyl0VUCC9bsejogj9kA5roryp/Kl+ViaT7Y?=
 =?us-ascii?Q?o8G87O61v00psvgm9PcSb2Azvce09a+9pN+c1rS0erauZdKcJJQbMUXz22m3?=
 =?us-ascii?Q?t7Eh5lFn2Sz6sF1/Wzh4DYW027VEHRsnnPo+QfBgmpQHgxC4WLitGhZSEIfO?=
 =?us-ascii?Q?gX63BkERMUOhx1aWIJ+WuHCVG+JvzBSJA2YrEFWvK5Ji4/EgWoiDaZSaSPb+?=
 =?us-ascii?Q?9GEyqnToZJMo+gPjtVTaEsK90Mv7e7pcuAkrRh3/bMj81lrp7txcVgJGXkJs?=
 =?us-ascii?Q?d3Loy/5W8DAVxrgo42rqwXFBSP4qZJNxIMPvN0G2qBHGJ6cvqsEwLT96n4GH?=
 =?us-ascii?Q?ogqKrViSJBANyQdcEFzlBQGLMqvKyGAxYv8nBezL6YBbA6iFzQXex9orhb+u?=
 =?us-ascii?Q?rawr62rhqg43+61nK9vIZOv149W5LTPYAhJWx1FMb+Z7QFNJE6t9/ulNRH/a?=
 =?us-ascii?Q?h6dmeYswXkgkIE4YoGqkd9vOM73uUZMvmx39IYBZVptXAg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+aphdN5c7le65t9eOjHaw4u5ECne988fMZgLEGPBTiS19D2NKgiM7OsKQP7h?=
 =?us-ascii?Q?u1ou7/DJRh4nHJdgewX3XwN63mMhiOYIvUhoR+ic4JgCBJUlHWByFzsjR/H3?=
 =?us-ascii?Q?k949NrBtc+oO0Oef2hepll84pfotIESpz1hZ6ljKM7xLLG/rKIs4SEF1iIO8?=
 =?us-ascii?Q?7q28uW6USB7SJnMeMdPbwaspapEoilKYn4WlDCe3HP/qjxwMfCi3q9Mj7O4c?=
 =?us-ascii?Q?rqvI9urNkJT+Hvd3MLxchwqjxuIMd4UOvg0fFH2wASiPCxhxBE6N7ApmD4Y0?=
 =?us-ascii?Q?aYFEEWEyrUmSE6GJrUyyt+5lJ4kA23qbApk9lDcvGnZpBVAJYFoUT/ByseLW?=
 =?us-ascii?Q?JaTWE5TYaWn5rwJGfDUq+/Om1TSquEoU0PGOvPHFqsyYLSC4zOsolGonwbZ/?=
 =?us-ascii?Q?jRDTYIwZnCTe13UKAy1lYxfP8FO5LApV36b6W2jdaBHP9LW/OdeGFxlTP+y0?=
 =?us-ascii?Q?yJ08Ns5rYPsdeN8lBNckAwyUk5AZX3CdIZpMaloaVWhqvwScY4iWizgO9WzM?=
 =?us-ascii?Q?uDyUcPqDGjmgIvj/csB9JZ5C3yjo+PX+DWhh9oqze+l12LoomHpuVPv7aATY?=
 =?us-ascii?Q?jRqRrABGMbCA+tTSC9Dm2FNSxbQQ17lbEFWHOvMCDi72xfEsLJHjhonHJyQ0?=
 =?us-ascii?Q?XECU9Grnxlc8C2Ea21XLkeGthraoKgLEQM16OskfnXuurtsYN5ZAbrLJjZMl?=
 =?us-ascii?Q?xbdwrbO1RrzKxKndWAOJQZseZeCZ1kgopCI1656MP4CXzZ+m9Bl7nPJgFtuO?=
 =?us-ascii?Q?ZDJ11k86ehMZBu5Xi9JEjPX7cxXFHa7RCi1GOS3i4FClv7ixhvYpIebqR/ke?=
 =?us-ascii?Q?4VO1A7o0e8Bu4lqoZpALpvMSD82m7nAaepHxb5slFd2iTDT0yzllwnApdddn?=
 =?us-ascii?Q?NxoWvz3wdlCAlXaOZHSLIOvv+BN1ODr/vM8SHEMh75s7P/Sd4x3MJ1PMfpxY?=
 =?us-ascii?Q?z9NntxYlChNxV0tjQ5BrweHr+WdQBCBuuCDMDHTo07l+xGSEN/Uj4mw12di5?=
 =?us-ascii?Q?e8X8HHEvx5mzxVaBBSTMIzpBBQWCvTNTdumHEvaEVLmLo9ETDgs99fX2Fjbr?=
 =?us-ascii?Q?Gh7pccVfTsiHOFFgU1e6usqAJHSISsJczxuaOnXjfrZ7PfdU1TFaWVt8YR3J?=
 =?us-ascii?Q?qCgKWAyvRCWnnQUTxtBy1H//lEFP1Q0ySK8698V8ujnNhNzbEeheXRJbQDax?=
 =?us-ascii?Q?hjoQZqqd9pML4ZfZeNf2A2GSAsSwcbCclWkqmv4fNd0T4F/3bmJEY6v1BAHf?=
 =?us-ascii?Q?OaOordC5korE90dZ0vMN7JweTS/wPGGtN5Hc/cf/2CugD3IQneA/DYSbUlxD?=
 =?us-ascii?Q?+MuwzwuEOLILQb/6fbFZMojtXIqo12Jw0NKtAueAamCbMo+IHA11hM7StZxL?=
 =?us-ascii?Q?gE3k0mneKFSCXIsboIPbpPYt8fFh/6ulC/FnxfQrhO+Vgm2upUTzqJbDxCtz?=
 =?us-ascii?Q?gp0q3B4H7k8Fxk4oc2DdFaJAVNbPv02XRbvBzb3X35VuTYxxrIvgvYlBV56x?=
 =?us-ascii?Q?AC0E38y3wyyvrfSTl8oi+ySF9R4PZjyDBUMEwCPbKjrm+JSMsvNLgx5Oo2sg?=
 =?us-ascii?Q?uE18KNXoXs51+Wc2nq2WbMDup8F/YxlgyrZ4LPTnoxmK5OTGpLFI9qgX0haQ?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6mCbWuIUM/0zhxpFg4lJzpGYeG+cZlTH+VpymXQBO1dZh66BfIAguoMu9X8IyiUr7YYe7CnEYcMqgmyzI3TkuNukX9lhcxCA4ApErUwj3OmnYbb3YnbHZbhepaUYLCU/PYrs+4onkdOqBZN9v2d5vLVIeXvgCJdn2aimT0SnozQtwGo060ZOZc8w2cPohEHBlVFDRfdyKT03vGyhPjQuVjTU0HYvQz0wdfCLJMgOjc29KFTqrxBFstk6bdtPUvWhtS4nM3smiHLQ7p18R9jCFV6hkg7J7i4B2QsxiPIRg4YUz2QG7Oa6Frr8Kso6MAH80xae00NK8yeK4O3VkU+5omY/W9tB0xhrJP2rbcAmJIVxLrvzjy38qfAJDl4zre1U5YXDYbKFlBFEcDYnUql4OQFBkxdvDoIC531Ja2tzvg7UMXlLfY3GKG/MrADb6jhQlmeTIh/bTILOsHFKn/MUtltvpZWeDp0vzivsH9RpolxQqiWJwXlrQJfGOVcnz+wQyB97z1VIUliqxh19Mm1qqH/HK3feLRoHQO2A629qh2zZeSLevWvrkdr0dBnHx9RfeajTHHEyd/gOckIaYG+e7qaErviPEz9MIdO7xEVVuYk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae9d262-ea10-40ff-6c82-08dcd4dfd68f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6298.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 17:08:23.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6m5avAhkEJE+a8GBzvLsKeChn7Oz/yVUtkbZ8CtKByCrRKJmKtsRAGj1P4bDS/C+h490oH+7SWrYRzB1DGx2JWTSERgAv6kOq/mhimsQT34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140120
X-Proofpoint-GUID: yz6NShAHsqiJrCVt-aTO40N0q05zdogw
X-Proofpoint-ORIG-GUID: yz6NShAHsqiJrCVt-aTO40N0q05zdogw

On Thu, Aug 29, 2024 at 01:22:11AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> I confirmed in a run of the test suite that they are unused.
> 
> But I do not understand how any of the dof_ecbdesc_t fields are
> used: dofe_probes, dofe_actions, or dofe_pad.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/dof.h      | 1 -
>  include/dtrace/enabling.h | 1 -
>  libdtrace/dt_dof.c        | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/include/dtrace/dof.h b/include/dtrace/dof.h
> index f5655fe2..f9b66e10 100644
> --- a/include/dtrace/dof.h
> +++ b/include/dtrace/dof.h
> @@ -94,7 +94,6 @@ typedef struct dof_ecbdesc {
>  	dof_secidx_t dofe_probes;	/* link to DOF_SECT_PROBEDESC */
>  	dof_secidx_t dofe_actions;	/* link to DOF_SECT_ACTDESC */
>  	uint32_t dofe_pad;		/* reserved for future use */
> -	uint64_t dofe_uarg;		/* user-supplied library argument */
>  } dof_ecbdesc_t;
>  
>  typedef struct dof_probedesc {
> diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
> index f1ec444c..55f67c03 100644
> --- a/include/dtrace/enabling.h
> +++ b/include/dtrace/enabling.h
> @@ -53,7 +53,6 @@ typedef struct dtrace_actdesc {
>  
>  typedef struct dtrace_ecbdesc {
>  	dtrace_probedesc_t dted_probe;		/* probe description */
> -	uint64_t dted_uarg;			/* library argument */
>  	int dted_refcnt;			/* reference count */
>  } dtrace_ecbdesc_t;
>  
> diff --git a/libdtrace/dt_dof.c b/libdtrace/dt_dof.c
> index be29f045..c89ad830 100644
> --- a/libdtrace/dt_dof.c
> +++ b/libdtrace/dt_dof.c
> @@ -738,7 +738,6 @@ dtrace_dof_create(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t flags)
>  		dofe.dofe_probes = probesec;
>  		dofe.dofe_actions = actsec;
>  		dofe.dofe_pad = 0;
> -		dofe.dofe_uarg = edp->dted_uarg;
>  
>  		dof_add_lsect(ddo, &dofe, DOF_SECT_ECBDESC,
>  		    sizeof(uint64_t), 0, 0, sizeof(dof_ecbdesc_t));
> -- 
> 2.43.5
> 
