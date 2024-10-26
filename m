Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0588488
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729905398; cv=fail; b=uYC9FYOiVQtvWVkCmMemZZH42xIiOvgiW/VHqCETt3q01zjWKMA5ZBQR14rmKAgSdkg8kPxBjVqVVJXnd9PzMr/COaPHii0J1bQ89+zJzndihL6Ztiy0kWtRye0cvZSjEcIsqSmk5s5ZTvZtfZ4PzA2z/Yp7pf7/x3i9S8r00nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729905398; c=relaxed/simple;
	bh=6+PjgzQxzkZ1DpB/kRUdBjhhc9SDcVWlfJkrrxuDjBQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GBiobjOjCgl5ja2XHJ0ymtPb0xNuixo6maa/ZolPxeo7OwtehUJj7a2VN46GbBc3vkvmyD+iR4qhqLCV0za+EDEh7W1kDj74B4x9HYlqpbKykRzzT3hfqCQg9VbZraXgzvG9mWtzCxBE5hX5/fmBaNSEXdMvmm+LTY1QGO16pBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=He3U8EM4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u8raZ+kT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="He3U8EM4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u8raZ+kT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdRcO021847
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=YztK/WmPF96peD3EylHjLnF7SMLMO7tkYWBH3pca1Zc=; b=
	He3U8EM4bAbPoIdzmlM3Ay3q2qyi11KAiTXgoBtDfpxjeB3Fn5U9HSLkLX8LhLSA
	5HvMAD4jAqq3BCVxxiZHG/EnbsuKWOQOKlCrpRppFsChykefToIXjBLKBQaT4OLR
	myVVyOLeXEhkenUtfLguW03iBjbscpEtaW7WBc4q9EASF/imTH/XarBFZ0s7ojxa
	iipEBcZqWoo3hpU6piNzSGVARNF4LPf+qew5Es0KapOT2m5eXCtNZ7Gtxwxfht75
	4ghZdDT9A8hYm1xLLXLn/zyuDqeMc6XtpRmBIE9RyjL3yJO6UVrCMGRitvaTkMX2
	a4Z7j7rF5Mb5CroJzTBDZA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c57qp4ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:16:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PM0UCA021045
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:16:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhp1svf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RasHaN3q235Ldt7XmEz1LsEf//8Lt4DfYny60Ffjc/56orTH4DOLJGKGSbPEa/BAFuPCVe+zKkXhqUMGYAoOE78XfktAv1uRCCrToxqDaAXJSLGrbi/0WnpsmXEaRNKrG6oMZkWddVS0DfC16zbDtRsewzhbdYlC6pWMayUKCOgdNIMFSrp7ufONeQCXzNQwJ5tiNNUTFLSvgq/ghLzWV4LcoDX4Kl0j5Ki3VWzlv+zau9ZuOMxMmWVQqcC/D8QfcWLlKePXfvcGprn67e6qzhCZP08hTQ1VHHQlrlkP4xHqEWK5r3h+hHRr7jjfYvgEe3rg1U0hZaIJu7wCnV950A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YztK/WmPF96peD3EylHjLnF7SMLMO7tkYWBH3pca1Zc=;
 b=bO1AyK9/h3TYC9ffivc40oolzzwia64vIiqDcpmb6jhDm1pBS9uQJKaCM3GAZQAWIbDn9kywkY9y/cZ996uhwnPLYWfsAd7GTcx5ycykdHKnSn1H5kxUQmFGK/YZkgNaugx/N2mYGr/rrHi+2yKbfYO2WQqFsILW9WmLPStZ5qN31HRoqy3wUpWF8mR0ssXKq/iRjmKBIiX6PszHYBY8mUPUUEm0TawxmnbtR9UVGrofmSludjLd/A989k7DXP3BGPnRqMkNAE/az70MflZm9PP06i2IE01KFl9NZiul7nDpCduPs5cORib0Z9cVF6couq+ojH16j25vP547rqwKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YztK/WmPF96peD3EylHjLnF7SMLMO7tkYWBH3pca1Zc=;
 b=u8raZ+kTWQyuh1ayLMGQuunjqwE5GywSetOB7lGDY6iJ7RvJMGxKMlsH3jpfvPFl8t8g/UZGWSbiPXB6qYjPJMUU6ODjA9hVBu4QDFFD3nldNe4HjWtn3bt4Y+QV1ZNRJdf0+S+SeZ2i5M00t3ed22oQ2K8wizeORR4LMvyw4ik=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Sat, 26 Oct
 2024 01:16:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.021; Sat, 26 Oct 2024
 01:16:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 10/19] Remove the is-enabled provider
Date: Fri, 25 Oct 2024 21:16:19 -0400
Message-Id: <20241026011619.28560-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:408:ec::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 4441fc4e-b8c0-4ce3-c9b8-08dcf55bce72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X2VhptOdfmwPcxhDkK3IdwkivjHH5Ak/NeCFFX6zcwvjsduVFJ8uh/GekwnW?=
 =?us-ascii?Q?OQqLQu8IH95r7uw6bs3AaxeUlBPqG1C+ibWbrDU50mFss905+FycP3M3lumz?=
 =?us-ascii?Q?0bYvtPEjqn4J5/oXfl0ZX9ju/B4kPrnLsl564X5+65b3R1zz28PlIjNmYo5s?=
 =?us-ascii?Q?TaLPJzAn+mHLPZHoR1DlBA1rWj236F6OytLLLVaATbPQ7A0XeNdKW3ZYsFNe?=
 =?us-ascii?Q?GJZOSh0HTVT2fKvrFaiezyR7pih8GmtuI1NnXS+okucfH76J/cpP9Ba49u1l?=
 =?us-ascii?Q?Scrl8qPtcsh96sEu4ckCK32ivya66+NCWs0MjshBMdVw8fcbGW6zk/0YpGQ+?=
 =?us-ascii?Q?X36cDbqcSn14c5xW7yAF9mgNP+MrScJTnG2+BWAR80cTefHUAt6NGWEjX5is?=
 =?us-ascii?Q?VAx47YarZhKFQtUwRppk4SaOaAScvlD36qjkT2USAoruCC/nG9MoCjclqA//?=
 =?us-ascii?Q?G/r2CqLZKIGhLZgPCQJS6VvtWD7IEk91F8DnMG8XG6wcHdbAhACx2wajFa0v?=
 =?us-ascii?Q?FqR3uStX/qNBCQhKYw/HBvYAl4xc8O04HH0q7B/6iNMHHGlLjJODTESU8lQo?=
 =?us-ascii?Q?s/2/c0W6teVt3acTsuC6q6KmlqzWzAYpf+UOg+OOPSKk3bsq7egGGgtYzOzU?=
 =?us-ascii?Q?v/J52A5xhGw/aqfmTGZqFo9EYK5MqnQge+o7+/UMHeaomgn+xiZSc4AIsHM4?=
 =?us-ascii?Q?RlzvMxhaP0mVyUliNLwvQ9eGjd9QMH1JN8G2xppoRHGXxoAZK8oFKjGoSB5n?=
 =?us-ascii?Q?7VcZMEd6xWEi9f6xJVD2ADMAP2bYz1pbqs/gLnvUwUz0mEqlRmE1iN2Ve9HV?=
 =?us-ascii?Q?Ce48uIqVjYLGVULObQlxpKuhFSgIGOY66QhyOqs5PfUsBd4jQTGe23fcUAAG?=
 =?us-ascii?Q?YcMjm143z/u6rFpjL9tyjzebdoSgtJWH3qnRSw/MA3o+M1z1Hrw/nH3F8A4h?=
 =?us-ascii?Q?Yymvb7BRMq6wbKK5d22+CRBYUFKsFTHtSb9OQCHpt6FSONTuYiQR/aS6t6Bw?=
 =?us-ascii?Q?TSuSpd7sWWxXpKUdrILhLA2t3gimXKV/ytWMBAhtQAXvtemIYbOZ+spZ/ZM0?=
 =?us-ascii?Q?Evv44jbJfQvV6TanZiAqNQB+qkDTeQ9lvL39RPt/SDDYJR+LkY2Pw38JSSUP?=
 =?us-ascii?Q?mgFaAbwJUmBBYfZfmLFRVgqte6WBGkrwhEp12PXe1ARWYmyfJE/TPzaiR23W?=
 =?us-ascii?Q?XTWgwlcz5tkX+vj2S/WznPacvu6aLKxWqybfj9DTJXkrhuOwEdbXLzZm2Grj?=
 =?us-ascii?Q?w9qgFZPqlBV+K2ieRTjSPRFzouzGnn9no7ZwIDTa8QvSl0u2T5LLY45aXhwi?=
 =?us-ascii?Q?s0FogVJQiJHKdeWlDydOpWLN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ch6GZS6YiEr2mmRmHJ3rMXoLUdMuK8BgS4hPFw45IjvaVRe5r+CFugK9mPQ/?=
 =?us-ascii?Q?0VSVpTdAI1zKh39XwgzTf4CqAeJqN4JSbEEE+HymMgpy9XHxcK2y64Zjcd8h?=
 =?us-ascii?Q?b/NsV2g+pUamtGrxzTaMS6risljZJ4dyn6OlHjINsQMAkCqlciI8RjKWPMM/?=
 =?us-ascii?Q?+zxDI5UEqCGkfSni4CwWp9MEeZT9BDeUobLrupHtM4UYEgNVdCKoWQKVemlI?=
 =?us-ascii?Q?APnSaFgMjFoJut4u/+bf8C7oTkDgV72lZOGQJLTblkD9yyPVkF+hWEMy9gAc?=
 =?us-ascii?Q?rig3D7tqWsvyMX1A9I5PEu2OfWCUsBF6WNv44fhnQg/66rjFq8YamXh59Sux?=
 =?us-ascii?Q?CTKwVdIvkaw76PjA13ONkqxim1n99YFRkUwkq+/nbwtjRldu4DU11ub/IkBj?=
 =?us-ascii?Q?Xhku3yxqCO+BAYlY6bCoiU4kOndTxGLcujQEZCf1lSDlbiSrLLynLqam++bp?=
 =?us-ascii?Q?QaUi7HXDmZvuZJM8EZnfDPmuEMMKoMs11iVLlW/6kCmzlB16bzkPIaJJLjDN?=
 =?us-ascii?Q?pShAPdPGJZxbWa0PdZi39QZ4DBeDByALBdjrluimJAY2hM5X0k2axFtTDR5A?=
 =?us-ascii?Q?31Ec30yDCZl+v/FUFgDLhAz8n/eYRnkengZfOi1t2uXvhvbd3aC03MDFzSqQ?=
 =?us-ascii?Q?e75Q9ZMhqCQ9lchL54X236GEyGKKmxyZsn5JAwO1oQzRuMRWWk8XNEuhOKL5?=
 =?us-ascii?Q?VUZjES/JyIcw9T+wXlmmyMl64JLZgoH6FR6ck+WA332S5ovN+HR8+K9l1HhU?=
 =?us-ascii?Q?LSDRk1d62MY4Yiw/DWJzUAPCMCAvdChMeccaCtp8YrOtfW5g8+jJy5zvB2Er?=
 =?us-ascii?Q?hB4co3vKodT1kvtKDQuOxgObD6DKnKsZZF+Yd9BqmWeCJyx7EFIFw3GfMiOb?=
 =?us-ascii?Q?Ik8Qn6TpctXzsc4OD+T/94/wRrBHvT6QfICQWg6x/7J5ToCSidfVYDh3BeL+?=
 =?us-ascii?Q?2XclHUcy4R5VKec6NvN6lAI1vss2IoboTwQIlf+NZZ2lhQ0n9cd1qfleh/V5?=
 =?us-ascii?Q?uFsHuTseJq2QWJo5O8md+q8Eg/hwBoAZH31ldzHoJE2VTW9Rkcwhv7fVvPfL?=
 =?us-ascii?Q?EKaFnGPr7OMrg6m7FTjYeyK1kJfKT3PyzBWm4ZrUINpZjmJyBWrogGEKwr0A?=
 =?us-ascii?Q?QceRbu/dCqMec9sXRIgpvGJV6006aLNgXGA31LJtjdELOMLS4QBG/ssuwMXs?=
 =?us-ascii?Q?pf9VzpncxgEhjP6UFGN2DPOpska7VKO6EsPxEM7/cXW+3qpGa9Yottyhxt+q?=
 =?us-ascii?Q?+HUxus9H/1appwzsQbluOeBvDVUmbyXFSXXSEar7bSOsdQ332BloWwf6Mm80?=
 =?us-ascii?Q?B7Yn+NHsAgLA3iZKkJt8bXKpkrTPQsH4y9BHUwflctVvIabFTdJS55gJ+G2U?=
 =?us-ascii?Q?5xjs9DQYioSkBpHWZrKRtE0DLR50sbJNEkOOndT2rtnGfAr7aYY5az/OhD5O?=
 =?us-ascii?Q?/xl6z+2XAHrLP63jX0zmHckjZulo9gwAU47t9bVQjMTOK+IusTxl5bqqgE2o?=
 =?us-ascii?Q?dWUsfXaBH5Ss6ujS3ZUftm6+Fp6q1Lh7DGnX9R9Mt2N2jvjOghL5Q1P+x4Hm?=
 =?us-ascii?Q?n+j5Ksww/oLLq6+SZCQyaEh20BjWtzWcFXZq+HWD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aYQmxy3xb6SKsSS3sJ/soGQ/Azaq5wwrf7FlkQ0welE/hzJ+ojpUogv/sc/m8PtC0Qx3PoAC66wV3pOi3TOvSkZETO0eZGRffgJlwVjvBMwoTTkXI3YwkCF9d9Mru4Lgr6a5mXz2svjEAuBZZxLvN+dyZS+pDSDB5YBLz+ioGgkNBKHpzmgbv9AbvuyK4pHsizHwHDGds21zYNSAcvJ1D7u0w79pw2y1da61cZb3rJ/bOyjHJaD4typme2/Oz9lmsxxc+fszmPFkElAzwFLOdyxyi5HOMVm6H81vu98Db/QzfrqO9hGsJvkEzy48iIeVO1Mk/QjKHcjOjkmwm+JNQzp9aDKQRXlGfKRne1GBmXz9Ja6L9pob1OeW4DL4Ghf/eW65s8//xlXEgpHM6GbBlacxZp3EeGbiGscLFS3wCi9BIRS+AssHD+oVRzdtusXdCox3ZwY8xPej7sAIqmMPTkLl4DTbdpkjFZ4QEbV5wy6HtgTbbzt6OffQzH5cjwHFE4cN0xs5SYMJ9ylHW06NyUANyRZg+tCSZaX6vVUKEY/B+P9LYms+DU44R+1qdsFp1imLDqxDzAWaG7RRHHlbYkNooB/VQzZjmyGfLdOv3V4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4441fc4e-b8c0-4ce3-c9b8-08dcf55bce72
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 01:16:23.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5gEu3R7+WXbsMRTSZLx/tNOe3oRv2bc29bkXbPQUkm7vF9k9ahkmlLh4GjbIzEnUt/7mKNXlCb8WG/2B3xsbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410260009
X-Proofpoint-ORIG-GUID: 1qoH2owf8IJ_hTnOsm4DUN5bvPNisyhU
X-Proofpoint-GUID: 1qoH2owf8IJ_hTnOsm4DUN5bvPNisyhU

From: Eugene Loh <eugene.loh@oracle.com>

The trampoline for the is-enabled provider is unnecessarily complicated.
We do not need dt_cg_tramp_copy_regs() since the copied values will not
be used.  Nor do we need the (second) copy of regs[arg0] to mst->arg[0].
We can inline copyout_val().

Actually, we can simply consolidate the USDT and is-enabled providers.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c            | 165 ++++-------------------
 test/unittest/usdt/tst.enable_pid.r   |  45 +++++++
 test/unittest/usdt/tst.enable_pid.r.p |   7 +
 test/unittest/usdt/tst.enable_pid.sh  | 183 ++++++++++++++++++++++++++
 4 files changed, 261 insertions(+), 139 deletions(-)
 create mode 100644 test/unittest/usdt/tst.enable_pid.r
 create mode 100755 test/unittest/usdt/tst.enable_pid.r.p
 create mode 100755 test/unittest/usdt/tst.enable_pid.sh

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 54e115f51..dcec76956 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -43,7 +43,6 @@
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
-static const char	prvname_is_enabled[] = "uprobe__is_enabled";
 
 #define PP_IS_RETURN	1
 #define PP_IS_FUNCALL	2
@@ -77,7 +76,6 @@ static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
 };
 
-dt_provimpl_t	dt_uprobe_is_enabled;
 dt_provimpl_t	dt_pid;
 dt_provimpl_t	dt_usdt;
 
@@ -85,8 +83,6 @@ static int populate(dtrace_hdl_t *dtp)
 {
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
-	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
-			       &dt_uprobe_is_enabled, &pattr, NULL) == NULL ||
 	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
 			       NULL) == NULL)
 		return -1;			/* errno already set */
@@ -464,7 +460,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
 	dt_uprobe_t		*upp;
-	int			is_enabled = 0;
 
 	/*
 	 * The underlying probes (uprobes) represent the tracepoints that pid
@@ -487,8 +482,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		strcpy(prb, "return");
 		break;
 	case DTPPT_IS_ENABLED:
-		is_enabled = 1;
-		/* Fallthrough. */
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
@@ -499,7 +492,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	}
 
 	pd.id = DTRACE_IDNONE;
-	pd.prv = is_enabled ? prvname_is_enabled : prvname;
+	pd.prv = prvname;
 	pd.mod = mod;
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
@@ -691,21 +684,6 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
 		dt_probe_enable(dtp, uprp);
 	}
 
-	/*
-	 * If necessary, we need to enable is-enabled probes too (if they
-	 * exist).
-	 */
-	if (is_usdt) {
-		dtrace_probedesc_t pd;
-		dt_probe_t *iep;
-
-		memcpy(&pd, &prp->desc, sizeof(pd));
-		pd.prv = prvname_is_enabled;
-		iep = dt_probe_lookup(dtp, &pd);
-		if (iep != NULL)
-			dt_probe_enable(dtp, iep);
-	}
-
 	/*
 	 * Finally, ensure we're in the list of enablings as well.
 	 * (This ensures that, among other things, the probes map
@@ -850,6 +828,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
 
+	if (upp->flags & PP_IS_ENABLED) {
+		/*
+		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
+		 * prototype looks like:
+		 *
+		 *	int is_enabled(int *arg)
+		 *
+		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
+		 */
+		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
+		emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+		emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
+		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
+
+		goto out;
+	}
+
+	/*
+	 * Continue with normal USDT probes.
+	 */
+
 	/* Read the PRID from the table lookup and store to mst->prid. */
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
@@ -906,110 +907,11 @@ out:
 	return 0;
 }
 
-/*
- * Copy the given immediate value into the address given by the specified probe
- * argument.
- */
-static void
-copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
-{
-	dt_regset_t	*drp = pcb->pcb_regs;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
-	emitl(dlp, lbl, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0),
-		val));
-
-	if (dt_regset_xalloc_args(drp) == -1)
-		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(arg)));
-	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
-	dt_regset_xalloc(drp, BPF_REG_0);
-	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
-
-	/* XXX any point error-checking here? What can we possibly do? */
-	dt_regset_free(drp, BPF_REG_0);
-	dt_regset_free_args(drp);
-}
-
-/*
- * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
- * prototype looks like:
- *
- *	int is_enabled(int *arg)
- *
- * The trampoline dereferences the passed-in arg and writes 1 into it if this is
- * one of the processes for which the probe is enabled.
- */
-static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
-{
-	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	const dt_probe_t	*uprp = pcb->pcb_probe;
-	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
-
-	assert(usdt_prids != NULL);
-
-	dt_cg_tramp_prologue(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * Copy in the first function argument, a pointer value to which
-	 * the is-enabled state of the probe will be written (necessarily
-	 * 1 if this probe is running at all).
-	 */
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_ARG0));
-	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-
-	/*
-	 * Retrieve the PID of the process that caused the probe to fire.
-	 */
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-
-	/*
-	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
-	 * will be used on the BPF stack:
-	 *
-	 *     offset                                       value
-	 *
-	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
-	 *
-	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
-	 *     ==
-	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
-	 */
-	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
-	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
-	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
-	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
-
-	/*
-	 * If we succeeded, then we use copyout_val() above to assign:
-	 *	    *arg0 = 1;
-	 */
-	copyout_val(pcb, DT_LBL_NONE, 1, 0);
-
-	dt_cg_tramp_return(pcb);
-
-	return 0;
-}
-
 static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
 {
 	char	*name;
 
-	if (asprintf(&name, "dt_pid%s/%c_%llx_%llx_%lx",
-		     flags & PP_IS_ENABLED ? "_is_enabled" : "",
+	if (asprintf(&name, "dt_pid/%c_%llx_%llx_%lx",
 		     flags & PP_IS_RETURN ? 'r' : 'p', (unsigned long long)dev,
 		     (unsigned long long)ino, (unsigned long)addr) < 0)
 		return NULL;
@@ -1019,7 +921,7 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
 
 /*
  * Create a uprobe for a given dev/ino, mapping filename, and address: the
- * uprobe may be a uretprobe or an is-enabled probe.  Return the probe's name as
+ * uprobe may be a uretprobe.  Return the probe's name as
  * a new dynamically-allocated string, or NULL on error.
  */
 static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
@@ -1181,21 +1083,6 @@ dt_provimpl_t	dt_uprobe = {
 	.add_probe	= &add_probe_uprobe,
 };
 
-/*
- * Used for underlying is-enabled uprobes.
- */
-dt_provimpl_t	dt_uprobe_is_enabled = {
-	.name		= prvname_is_enabled,
-	.prog_type	= BPF_PROG_TYPE_KPROBE,
-	.populate	= &populate,
-	.load_prog	= &dt_bpf_prog_load,
-	.trampoline	= &trampoline_is_enabled,
-	.attach		= &attach,
-	.probe_info	= &probe_info,
-	.detach		= &detach,
-	.probe_destroy	= &probe_destroy_underlying,
-};
-
 /*
  * Used for pid probes.
  */
diff --git a/test/unittest/usdt/tst.enable_pid.r b/test/unittest/usdt/tst.enable_pid.r
new file mode 100644
index 000000000..675fcdd6f
--- /dev/null
+++ b/test/unittest/usdt/tst.enable_pid.r
@@ -0,0 +1,45 @@
+                   FUNCTION:NAME
+                        :tick-1s 
+
+                   FUNCTION:NAME
+                        :tick-1s 
+
+                   FUNCTION:NAME
+                        :tick-1s 
+
+                   FUNCTION:NAME
+                        :tick-1s 
+
+done
+========== out 1
+is not enabled
+=== epoch ===
+is not enabled
+is enabled
+is not enabled
+=== epoch ===
+is not enabled
+=== epoch ===
+is not enabled
+is enabled
+is not enabled
+=== epoch ===
+========== out 2
+is not enabled
+=== epoch ===
+is not enabled
+=== epoch ===
+is not enabled
+is enabled
+is not enabled
+=== epoch ===
+is not enabled
+is enabled
+is not enabled
+=== epoch ===
+success
+-- @@stderr --
+dtrace: description 'test_provNNN:::go ' matched 1 probe
+dtrace: description 'test_provNNN:::go ' matched 2 probes
+dtrace: description 'test_provNNN:::go ' matched 2 probes
+dtrace: description 'test_prov*:::go ' matched 3 probes
diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
new file mode 100755
index 000000000..baf9d2a90
--- /dev/null
+++ b/test/unittest/usdt/tst.enable_pid.r.p
@@ -0,0 +1,7 @@
+#!/usr/bin/awk -f
+{
+	# ignore the specific process ID
+	gsub(/test_prov[0-9]+/, "test_provNNN");
+
+	print;
+}
diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
new file mode 100755
index 000000000..91923014d
--- /dev/null
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -0,0 +1,183 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# @@timeout: 80
+
+PATH=/usr/bin:/usr/sbin:$PATH
+
+#
+# In this test, we check that is-enabled probes depend correctly on pid.
+#
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/usdt-enable_pid.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+#
+# Set up the source files.
+#
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go();
+};
+EOF
+
+cat > main.c <<EOF
+#include <signal.h>
+#include <stdio.h>
+#include "prov.h"
+
+/* We check if the is-enabled probe is or is not enabled (or unknown). */
+#define ENABLED_IS	1
+#define ENABLED_NOT	2
+#define ENABLED_UNK	3
+
+/* Start with the previous probe "unknown". */
+int prv = ENABLED_UNK;
+long long num = 0;
+
+/* Report how many times the previous case was encountered. */
+static void report() {
+
+	/* Skip if there is nothing to report. */
+	if (num == 0)
+		return;
+
+	switch (prv) {
+	case ENABLED_IS:
+		printf("is enabled\n");
+		break;
+	case ENABLED_NOT:
+		printf("is not enabled\n");
+		break;
+	}
+	fflush(stdout);
+
+	/* Reset. */
+	prv = ENABLED_UNK;
+	num = 0;
+}
+
+/* When USR1 is received, mark an "epoch" in the output. */
+static void mark_epoch(int sig) {
+	report();
+	printf("=== epoch ===\n");
+	fflush(stdout);
+}
+
+int
+main(int argc, char **argv)
+{
+	struct sigaction act;
+
+	/* Set USR1 to mark epochs. */
+	act.sa_flags = 0;
+	act.sa_handler = mark_epoch;
+	if (sigaction(SIGUSR1, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+
+	/* Just keep looping, counting consecutive cases. */
+	while (1) {
+		int now;
+
+		/* Check the is-enabled probe. */
+		if (TEST_PROV_GO_ENABLED()) {
+			now = ENABLED_IS;
+		} else {
+			now = ENABLED_NOT;
+		}
+
+		/* Compare to the previous case. */
+		if (now == prv) {
+			num++;
+		} else {
+			report();  /* resets num */
+			prv = now;
+		}
+	}
+
+	return 0;
+}
+EOF
+
+#
+# Build the test program.
+#
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	exit 1
+fi
+cc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	exit 1
+fi
+$dtrace -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+cc $test_cppflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+#
+# Start two copies.
+#
+
+./main >& out.1 &
+pid1=$!
+./main >& out.2 &
+pid2=$!
+
+#
+# Run DTrace with different pid probes, each case is its own "epoch":
+#                   pid1?      pid2?
+#   - 1              no         no
+#   - $pid1          YES        no
+#   - $pid2          no         YES
+#   - *              YES        YES
+#
+
+for pid in 1 $pid1 $pid2 '*'; do
+	sleep 1
+	$dtrace $dt_flags -Zn 'test_prov'$pid':::go { trace("hi"); }
+                               tick-1s { exit(0) }'
+	if [ $? -ne 0 ]; then
+		echo ERROR: dtrace
+		kill -TERM $pid1
+		kill -TERM $pid2
+		exit 1
+	fi
+	sleep 1
+
+        # Use USR1 to mark epochs in the output.
+	kill -USR1 $pid1
+	kill -USR1 $pid2
+done
+
+echo done
+echo "========== out 1"; cat out.1
+echo "========== out 2"; cat out.2
+
+echo success
+
+kill -TERM $pid1
+kill -TERM $pid2
+
+exit 0
-- 
2.43.5

