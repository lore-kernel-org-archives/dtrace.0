Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF471509A2
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724280485; cv=fail; b=A4XS+BXLEOCArzdwdlzyU2mH8aAfgqP7nV8sOE9IOHgeu+8iuhn8XLp57PGVwsZlgriFjTlLPuQJUcs24T+mAwNpyF4KrKHYH2Wk/npMx0E//qbjgvtZ60ZCFQCut6OYzH0DhBGGLhDVtfKc8yjM6PUJkzIEr7fdcwvt1wA9Ito=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724280485; c=relaxed/simple;
	bh=eheElqJuS0A4xUuGZtn86jPrFhAELeULsXsKrrHUswo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Oraq4B8TTghZibUrLw0NpFCHnMjts3m3oYi63776kt0rWbUCW/QfFQK+rXC4uOd4LSVDqotQUMsR6Q6y+2i8qWo/wM95Y/lg3Htjb49MzFteOF1Lxij68216qGUZuzbQrFJOlMWTDu2weL1TqUsCADnj7Jg3Q20wXOHUfJT2hPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bBX+h7jo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pBbYzMXP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bBX+h7jo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pBbYzMXP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKtccK005911
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=M2L3WVI7AHFIE4Dv6vCtcqtPfbwmaPrIQOeFdroTC8Q=; b=
	bBX+h7jo3D1+qDthItxsrnPadiDm9tW5hU0apGPwSS3qSZZlhzFJr6UHadNcFkwT
	aV5+h34DIqWhkbugKfj2w5iZjm2Bjl+rtEMWskVZBSbINqq9YuRDnGUu261jbGh6
	238bTobMvjWSQWTZ/fqcBAeWNlJwV3rWNTBZ0vih46jlVVvJ0pWruLZ/OxZCtdVI
	yrSDw4pnAhv27svm9PusWiQmXQzPatnqjL//hHXMZOFKESdJsofYFcdvQTAEOpaI
	CGt5yWdORWgwaQgWdqXsOCNcbkFRE5iQWE83FQK3d8UFe8o2zVECdn6/1+6ED4WT
	oftzjonBFktt4dMcuiIp3Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m67gn67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:48:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LMJ2mO024721
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:48:00 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 415rx40snv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:48:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B14TsRvqEDj9YJOlxgqIOV+ZswRIBRgYWhtvhZElepyMtA2Pl3bbXlvDZp9xprCA7BM3lffQMFQhxDq5+wbztfizIIYV/xPUjhlPS2QyVtyBf3qgBGYEsZJwBtIRIiwrFBD40JSVdz1xUsgrkK72koS5bXGwMJifw9VQdX3TMqX/VLnoQ8VqNf2LMQfSwsvpOrD4jANWb2aYomqiBPnxEw6x/f/rtSGmSqd0aqRAu07XVbjvNnsHVbk9i30E29EgKWqUXb1MtQsJT2+t0E8/iKLQP7P6nV2N72wR2mVdBulFp4eeUi/qpBwLoU0mI1Ho8S3Ysi6vRJsbRUagX4sQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2L3WVI7AHFIE4Dv6vCtcqtPfbwmaPrIQOeFdroTC8Q=;
 b=CJIED/CgtVrStEf14bnMhn8a57w6aw5mDc1CO+3E3Vl3SzxLuuUGyfOBPsa6xnrheUHZVRy28d6HzV4+V6a8UOwICVRMW/GEQmHjhAxU3PFkFHhPxg3e++i8wcSesPK26K5hnT8cHJLNvNPObWpQ1mcao5psD+yPauCfFithfp+3L4q5nTDMbLPrX4NDYrCYa/VOTfYqdmljKF+dgU56AFa+oHrzwMNQKuch7BwIgaoXWB0P25hu9P0Gfc4YNKpVSBvM8hUcAFTv/4zEUKBc4zq+NywB7xV6oinf9VOwqqBlKWiE2ARlYbAhqbTjR9BPeVUIH8ncFVbZUFWMR5Bmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2L3WVI7AHFIE4Dv6vCtcqtPfbwmaPrIQOeFdroTC8Q=;
 b=pBbYzMXPS2mvIIDfVjTbarS4PECPFs00TkbDisRcO/39rjrvxZVxDGDlWWgC3Bf094CrWZg8P7lRG2OqAVfuetV5z/rz8ML2vten+kqzDJq/bjb1TT1Q8yLJrw62Pnh8O+R+9fEY/EI/37o6bhNlRUN9DPP9r/QqFSuHSp9pM8s=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY5PR10MB6237.namprd10.prod.outlook.com (2603:10b6:930:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Wed, 21 Aug
 2024 22:47:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 22:47:23 +0000
Date: Wed, 21 Aug 2024 18:47:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] ioctl: remove obsolete ioctl definitions and dead code
 that used them
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0021.namprd11.prod.outlook.com
 (2603:10b6:208:23b::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB628717A48FCC1BBB3B96F465C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY5PR10MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0959b9d8-3e1d-4ed1-083c-08dcc2333919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iA0gNfBma2Cbr6C4X9mwgwqtBCgul93dWpl2EP62evbHAV+yVawcnWYr60gw?=
 =?us-ascii?Q?GZl3zfaF987YN4GHHOOwIvSrzFglap05xInIt6D4VN1e3cJgbxWvzbOebYkb?=
 =?us-ascii?Q?24aeoRLQAJzFPRPah3NT+t6cJC2z2R7U1rs0WK6OaB00Ag9kn5Z42pQ0seCa?=
 =?us-ascii?Q?G6BggniVO3SqnXnQRHkQvTwMEe7MHmxoQE5wkIDgp23/47G4bpmdixaJYTGO?=
 =?us-ascii?Q?u7eLK4qDHeDeeK95doU3i7QN23r1U5xclQQP2tdWtccIH3vxD/+6wm9C8feD?=
 =?us-ascii?Q?b2Xx1/WXycSGgIRq6Vd5GUrIXShnrMAyIr51sO5kyxDu4cFC3cvzZmRONusf?=
 =?us-ascii?Q?LYuMCgPgF5U2ge/8LI1191L28fF2WjWiB4KhVXlObv9hHF5Gm40COYymQrMi?=
 =?us-ascii?Q?AUQzf5yczyfarsnsGcSn6mzu+r2UZ9UHM/li6JtTGnzhCcCDD6QzYvlmKE2T?=
 =?us-ascii?Q?tDyNFCQIyq/NB6nEAwtt0RTglNAMwnmZrYc/BzWDnBzNMqnce7EFXkFz2HbW?=
 =?us-ascii?Q?nvMeHXDPU0LolWWnV5QNpEK6cwdiQU4ItR5eerLStqYV6T0a3in6Q6KuRcMA?=
 =?us-ascii?Q?0uza+TukVfCjkMGp6zCBD3dkoernB0zuqN3bgP4DqyRTGO5FeQoGWAT2qbKl?=
 =?us-ascii?Q?7bY3Q0phlIm7f+JOgfBDjyk4ARO1aY8eBwoMTw0STOqYsgwxCF44BuuRazJv?=
 =?us-ascii?Q?8y5ZTlGcyW0Gv+CicP0ePSum6uVRw3Dc17YrSBPNpbTbzapnl58+E2HGEH0S?=
 =?us-ascii?Q?RQosESPYwQbwnA0yan6QsaSmObRYo3aubir4O17gfQaJwqpbscDMMgh2/N4u?=
 =?us-ascii?Q?oE+YbBb8ppxPGX/B7UhchVHuyL0XrFTZJga9gaUfxd1+vTpSSIMUgHhqqlZU?=
 =?us-ascii?Q?GXtTWHWCNthwNgR0Vwjwy/rFsKCLhDMu0yuFdDtUJXx0JyXfGSBn0rDiV1dA?=
 =?us-ascii?Q?jw8LcDDXhORQre8RKnCwWikxLxQzwbS3QAIWQvsz0QMI9KxDeOecm08gN7Su?=
 =?us-ascii?Q?YCoYLqvYzMd1VzQptibx3I+jdduHltLn0Ej4pY77QU55M6Zdv8yCNlqI5iDb?=
 =?us-ascii?Q?Az/qd5URD5cVD37MgbA1ubzJsSX2Jv4TwNRSRPd0cd7P8s+7W6Gk3s9XKwwi?=
 =?us-ascii?Q?rgDQp7Ok1a0XBuYTxucYusT4IIS9WZwFujNVdKNc91Vv8m0vTPr2S0D064ei?=
 =?us-ascii?Q?FCDyo4JDTatcby4OOj8qXvLny2tSjqjJUCGBmNMTeuYce2wDX5Xa8hDcf352?=
 =?us-ascii?Q?TWuVKc38nqjktZ1ORI3JRCaK88DIgyy+FbBbGhZoTpwl8YxVOiBURZr0NKiY?=
 =?us-ascii?Q?iN4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ggHX/SaxStl+BMWc6e2CeWHE7H8HFrf97meLHSam+mF1X4fxV27whXFBsWX?=
 =?us-ascii?Q?r8/hhuiRe5UySrSUNxG7Tjm8PTDAeXX8hZ55BNWDLqyLfrFiaCZxeYOGfmWr?=
 =?us-ascii?Q?Nbc0BxFCxof0CxUddIkK9o2Yr7LuaxeCmk6ZIHFGT+uouXdFDLrxJRv7/7cq?=
 =?us-ascii?Q?t0+KtPJvoCWwly44zQmiQsdBixn7szPP+SXgTMlzptw0M6v78HwcL/YGpZV8?=
 =?us-ascii?Q?WGzAXtNRX+YqqsharpORMRtE6I7nlWQMPa9oWHFWB9g+oLIC4iEdudPm2Tm+?=
 =?us-ascii?Q?6iWXHs2oElWoG+GUMtZ7L3CVRVpHrzh/COV9CjRLLoHHmS7VNMVTHIPLlXae?=
 =?us-ascii?Q?HuPZg9L/hVaf2ExpOH0P1i5RxoIF7FtKyAwNCTg4jtFhVuFB2Q8DVd4+b/ul?=
 =?us-ascii?Q?PsodGh/+z/7nBULWHyWfyEzwqojC1GPmnmog7n2chm/qdXFrWQ2O1rAMbYfn?=
 =?us-ascii?Q?2t328NYPzUF6DH0oxYer4hbL0vwM9vrD/+3XkCYusOxT4ARNLkCZqPLooUH6?=
 =?us-ascii?Q?hvuRJoQxAuUJjyzKhkUSOvjo2ED6PQo/IZ9ETm6o890ZUl7ngkZYUqoLvyQt?=
 =?us-ascii?Q?6g7uhe9vdl/jq5Wpt3lZMNcrj9ql0OPHshZiDKjCCatEJmVjo4S708Q1Z+VD?=
 =?us-ascii?Q?m2x49yjLCf90CTwCIma2sA8pMh9jFyllXdOyCwAnU7Z1jXTBJh8pMA5GAulD?=
 =?us-ascii?Q?WUaatFNUV3+RBZ5svV70imh/XRxyuXY25EapZQ5NCiGGfxysg/BKZgnhe6tg?=
 =?us-ascii?Q?MRAbbVcrUOQzplGfVTr6ueGAZNInD9w5zusPDZmWdZQxv9j9G9fpGVgglAID?=
 =?us-ascii?Q?bUJ0JrGyAVy4JnSlvfV+zg7hlPAP/dEO8tkbyvbfc65GmKkosweL+7D6jz3T?=
 =?us-ascii?Q?Wb8se7HQpI9E/E/4G8GBfz+63iT2XYx0W0ki6DI+iAr4pPL608wvuShcvIE9?=
 =?us-ascii?Q?W74oqeCKB+czlwAcvpXjZxGdqsQQ+cppDieeYA68KT84/+DzuhYQhJYdsKct?=
 =?us-ascii?Q?jy37a+lEvgo82Rh7NfedjNOm2rSMAaIox+qMe2J7CrUvbvWddoyYSfYqgFr9?=
 =?us-ascii?Q?zz/bvd32NIvwskyZXjBxf1ZOi2+INJgefeTbJjChEhg7uMOyTHZ76bROynp0?=
 =?us-ascii?Q?DvFGxLwBkrAMKDLdd9qlOaaWg+bBws2v0P1ua1uPM94rGTagCHc5dEfDav42?=
 =?us-ascii?Q?0UFKGu4hxDAcjRNLovYGbf45ja+6N2C3kM5SISxxvnH+PYbhH0ilr58APkYs?=
 =?us-ascii?Q?wHQvuw5Ox3IEJuRAt9j/Xgyh9PUWQ/saUpTe35z6A4mBrum8/mRi6qQrvOjQ?=
 =?us-ascii?Q?kD0SvOd7pFvN6K1evNkuuw+PrFh0DRwYSnCJ1t6B9DXcLkSWaXyaaegqgnTg?=
 =?us-ascii?Q?RnFf0aaDNXlAv0JNty0o4Ia4fRKBUq3FvmsYwUg+n8ydI4cQyEUywETrbWhT?=
 =?us-ascii?Q?feRKAELq2P1eCDudTRfDqpK4OLpNrFGcOglsRMzKV+yh1NgHesvymRcyqrjF?=
 =?us-ascii?Q?UA3EjFWfzR2h7rmj2dhwQ9yooaYMPlrxgs/W8s2FboKiKFi9iALEZCDkicEz?=
 =?us-ascii?Q?Xb/dStQaiYGsedA9x0wqMoTzWmETDKLI+BakYQdw3WOn/CpPiDJSr9IwCCGU?=
 =?us-ascii?Q?XzWWvxVO4DkGljB/8LuoA+0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QHbjfdSvwj1u9B42m39dgiCqB6GWze59ykjmOVlHg9pqgFZrzp/uOL91XR8fxviDwHAC47Ja5dgll4q8+Ti2d15/t0RRZMy6K/v3Sj30vr4bgWdg141mOysZ8qg2TTM21r3IiqN2VyUAJJ7T3Heh9UgrtcuvMoY0Bfpok7qRisEesEiveRzt6BDR11bALa0T36yT4zPrSw2kkLA3MsIh90eJdcJr4A1+bTZGupD260PoLbhH5DW+hZTTXbUSWpKbyFQqDbt0p+LfHINBVOGBFIX4YVafOTJbLecm9K5lKe1ICwpexZIecQKSjEBx934yEH8hyMVKm8uAwLb9Y/LM24Me28/JicKc8RGF5K6nBhqq0a9yYcxSKEGe7axjSoK3Y5MVt/dck3y5u1C+ir/jOmZRrb9fTTZaeilZ0+JfEDQ9qSB2fpMYL4MOW2ruzI8D793s4QVmlxUbWQIERq8EYITfEXNybjk9l69aAlNZtOFrHkZYtsiSZICWOR2v/1P8EutrIOrsIQ+/SPNgOSz3NR1KaMG0/Z4YpiS1aSFfL7KkgMIOEakP7ub4zMljr/x8XU66Q4KZ1FedfQHBV2pacMvcByYaG5Kyh+uDp4dvpwU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0959b9d8-3e1d-4ed1-083c-08dcc2333919
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 22:47:23.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xanHrjFOo5eKf5FBKKVYhPylWkaUTthvLmFI8O1+ZeUu9wDuTHZyBFRhD23FTbgExjBsKGzoNRLXuch8giDkTA+svJ00KvbxnhoA/hWBdSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6237
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_15,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408210166
X-Proofpoint-ORIG-GUID: NRhyHlYeJuaNSxVsSFE8-NT-ir9dga2b
X-Proofpoint-GUID: NRhyHlYeJuaNSxVsSFE8-NT-ir9dga2b

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/dif.h         |   5 +-
 include/dtrace/dif_defines.h |   5 +-
 include/dtrace/ioctl.h       |  23 -----
 libdtrace/dt_options.c       |  61 -----------
 libdtrace/dt_probe.c         | 132 ------------------------
 libdtrace/dt_work.c          |   5 -
 runtest.sh                   |  61 ++---------
 test/utils/.gitignore        |   2 -
 test/utils/Build             |   2 +-
 test/utils/baddof.c          | 191 -----------------------------------
 test/utils/badioctl.c        | 129 -----------------------
 11 files changed, 13 insertions(+), 603 deletions(-)
 delete mode 100644 test/utils/baddof.c
 delete mode 100644 test/utils/badioctl.c

diff --git a/include/dtrace/dif.h b/include/dtrace/dif.h
index 191aa73c..576bda2c 100644
--- a/include/dtrace/dif.h
+++ b/include/dtrace/dif.h
@@ -19,10 +19,7 @@
 /*
  * The following definitions describe the DTrace Intermediate Format (DIF), a a
  * RISC-like instruction set and program encoding used to represent predicates
- * and actions that can be bound to DTrace probes.  The constants below defining
- * the number of available registers are suggested minimums; the compiler should
- * use DTRACEIOC_CONF to dynamically obtain the number of registers provided by
- * the current DTrace implementation.
+ * and actions that can be bound to DTrace probes.
  */
 
 /*
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index d88b3b2e..c8c1d961 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -19,9 +19,8 @@
  * The following definitions describe the DTrace Intermediate Format (DIF), a a
  * RISC-like instruction set and program encoding used to represent predicates
  * and actions that can be bound to DTrace probes.  The constants below defining
- * the number of available registers are suggested minimums; the compiler should
- * use DTRACEIOC_CONF to dynamically obtain the number of registers provided by
- * the current DTrace implementation.
+ * the number of available registers are dependent on the underlying BPF
+ * implementation.
  */
 
 #define DIF_VERSION_1	1
diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
index a2a3a93b..2273453a 100644
--- a/include/dtrace/ioctl.h
+++ b/include/dtrace/ioctl.h
@@ -9,30 +9,7 @@
 #define _DTRACE_IOCTL_H_
 
 #include <linux/ioctl.h>
-#include <dtrace/arg.h>
-#include <dtrace/conf.h>
-#include <dtrace/dof.h>
-#include <dtrace/enabling.h>
 #include <dtrace/helpers.h>
-#include <dtrace/metadesc.h>
-#include <dtrace/stability.h>
-#include <dtrace/status.h>
-
-#define DTRACEIOC		0xd4
-#define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
-#define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
-#define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
-#define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
-#define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
-#define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
-#define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
-#define DTRACEIOC_STATUS	_IOR(DTRACEIOC, 11, dtrace_status_t)
-#define DTRACEIOC_GO		_IOW(DTRACEIOC, 12, processorid_t)
-#define DTRACEIOC_STOP		_IOW(DTRACEIOC, 13, processorid_t)
-#define DTRACEIOC_AGGDESC	_IOR(DTRACEIOC, 15, dtrace_aggdesc_t)
-#define DTRACEIOC_FORMAT	_IOR(DTRACEIOC, 16, dtrace_fmtdesc_t)
-#define DTRACEIOC_DOFGET	_IOR(DTRACEIOC, 17, dof_hdr_t)
-#define DTRACEIOC_REPLICATE	_IOR(DTRACEIOC, 18, void *)
 
 #define DTRACEHIOC		0xd8
 #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 2f7917a0..ec53358b 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -1030,67 +1030,6 @@ dt_opt_bufresize(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 	return 0;
 }
 
-int
-dt_options_load(dtrace_hdl_t *dtp)
-{
-#ifdef FIXME
-	dof_hdr_t hdr, *dof;
-	dof_sec_t *sec = NULL;  /* gcc -Wmaybe-uninitialized */
-	size_t offs;
-	int i;
-
-	/*
-	 * To load the option values, we need to ask the kernel to provide its
-	 * DOF, which we'll sift through to look for OPTDESC sections.
-	 */
-	memset(&hdr, 0, sizeof(dof_hdr_t));
-	hdr.dofh_loadsz = sizeof(dof_hdr_t);
-
-	if (dt_ioctl(dtp, DTRACEIOC_DOFGET, &hdr) == -1)
-		return dt_set_errno(dtp, errno);
-
-	if (hdr.dofh_loadsz < sizeof(dof_hdr_t))
-		return dt_set_errno(dtp, EINVAL);
-
-	dof = alloca(hdr.dofh_loadsz);
-	memset(dof, 0, sizeof(dof_hdr_t));
-	dof->dofh_loadsz = hdr.dofh_loadsz;
-
-	for (i = 0; i < DTRACEOPT_MAX; i++)
-		dtp->dt_options[i] = DTRACEOPT_UNSET;
-
-	if (dt_ioctl(dtp, DTRACEIOC_DOFGET, dof) == -1)
-		return dt_set_errno(dtp, errno);
-
-	/* FIXME: can we get a zero-section DOF back? */
-
-	for (i = 0; i < dof->dofh_secnum; i++) {
-		sec = (dof_sec_t *)(uintptr_t)((uintptr_t)dof +
-		    dof->dofh_secoff + i * dof->dofh_secsize);
-
-		if (sec->dofs_type != DOF_SECT_OPTDESC)
-			continue;
-
-		break;
-	}
-
-	for (offs = 0; offs < sec->dofs_size; offs += sec->dofs_entsize) {
-		dof_optdesc_t *opt = (dof_optdesc_t *)(uintptr_t)
-		    ((uintptr_t)dof + sec->dofs_offset + offs);
-
-		if (opt->dofo_strtab != DOF_SECIDX_NONE)
-			continue;
-
-		if (opt->dofo_option >= DTRACEOPT_MAX)
-			continue;
-
-		dtp->dt_options[opt->dofo_option] = opt->dofo_value;
-	}
-#endif
-
-	return 0;
-}
-
 /*ARGSUSED*/
 static int
 dt_opt_preallocate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 0b53121a..14ea134f 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -186,131 +186,6 @@ dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
 	return s;
 }
 
-/*
- * If a probe was discovered from the kernel, ask dtrace(7D) for a description
- * of each of its arguments, including native and translated types.
- */
-static dt_probe_t *
-dt_probe_discover(dt_provider_t *pvp, const dtrace_probedesc_t *pdp)
-{
-#ifdef FIXME
-	dtrace_hdl_t *dtp = pvp->pv_hdl;
-	char *name = dt_probe_key(pdp, alloca(dt_probe_keylen(pdp)));
-
-	dt_node_t *xargs, *nargs;
-	dt_ident_t *idp;
-	dt_probe_t *prp;
-
-	dtrace_typeinfo_t dtt;
-	int i, nc, xc;
-
-	int adc = _dtrace_argmax;
-	dt_argdesc_t *adv = alloca(sizeof(dt_argdesc_t) * adc);
-	dt_argdesc_t *adp = adv;
-
-	assert(strcmp(pvp->desc.dtvd_name, pdp->prv) == 0);
-	assert(pdp->id != DTRACE_IDNONE);
-
-	dt_dprintf("discovering probe %s:%s id=%d\n",
-		   pvp->desc.dtvd_name, name, pdp->id);
-
-	for (nc = -1, i = 0; i < adc; i++, adp++) {
-		memset(adp, 0, sizeof(dt_argdesc_t));
-		adp->ndx = i;
-		adp->id = pdp->id;
-
-		if (dt_ioctl(dtp, DTRACEIOC_PROBEARG, adp) != 0) {
-			dt_set_errno(dtp, errno);
-			return NULL;
-		}
-
-		if (adp->ndx == DTRACE_ARGNONE)
-			break; /* all argument descs have been retrieved */
-
-		nc = MAX(nc, adp->mapping);
-	}
-
-	xc = i;
-	nc++;
-
-	/*
-	 * Now that we have discovered the number of native and translated
-	 * arguments from the argument descriptions, allocate a new probe ident
-	 * and corresponding dt_probe_t and hash it into the provider.
-	 */
-	xargs = dt_probe_alloc_args(pvp, xc);
-	nargs = dt_probe_alloc_args(pvp, nc);
-
-	if ((xc != 0 && xargs == NULL) || (nc != 0 && nargs == NULL))
-		return NULL; /* dt_errno is set for us */
-
-	idp = dt_ident_create(name, DT_IDENT_PROBE, DT_IDFLG_ORPHAN, pdp->id,
-			      _dtrace_defattr, 0, &dt_idops_probe, NULL,
-			      dtp->dt_gen);
-
-	if (idp == NULL) {
-		dt_set_errno(dtp, EDT_NOMEM);
-		return NULL;
-	}
-
-	prp = dt_probe_create(dtp, idp, 2, nargs, nc, xargs, xc);
-	if (prp == NULL) {
-		dt_ident_destroy(idp);
-		return NULL;
-	}
-
-	dt_probe_declare(pvp, prp);
-
-	/*
-	 * Once our new dt_probe_t is fully constructed, iterate over the
-	 * cached argument descriptions and assign types to prp->nargv[]
-	 * and prp->xargv[] and assign mappings to prp->mapping[].
-	 */
-	for (adp = adv, i = 0; i < xc; i++, adp++) {
-		if (dtrace_type_strcompile(dtp,
-		    adp->native, &dtt) != 0) {
-			dt_dprintf("failed to resolve input type %s "
-			    "for %s:%s arg #%d: %s\n", adp->native,
-			    pvp->desc.dtvd_name, name, i + 1,
-			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-
-			dtt.dtt_object = NULL;
-			dtt.dtt_ctfp = NULL;
-			dtt.dtt_type = CTF_ERR;
-		} else {
-			dt_node_type_assign(prp->nargv[adp->mapping],
-			    dtt.dtt_ctfp, dtt.dtt_type);
-		}
-
-		if (dtt.dtt_type != CTF_ERR && (adp->xlate[0] == '\0' ||
-		    strcmp(adp->native, adp->xlate) == 0)) {
-			dt_node_type_propagate(prp->nargv[
-			    adp->mapping], prp->xargv[i]);
-		} else if (dtrace_type_strcompile(dtp,
-		    adp->xlate, &dtt) != 0) {
-			dt_dprintf("failed to resolve output type %s "
-			    "for %s:%s arg #%d: %s\n", adp->xlate,
-			    pvp->desc.dtvd_name, name, i + 1,
-			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-
-			dtt.dtt_object = NULL;
-			dtt.dtt_ctfp = NULL;
-			dtt.dtt_type = CTF_ERR;
-		} else {
-			dt_node_type_assign(prp->xargv[i],
-			    dtt.dtt_ctfp, dtt.dtt_type);
-		}
-
-		prp->mapping[i] = adp->mapping;
-		prp->argv[i] = dtt;
-	}
-
-	return prp;
-#else
-	return NULL;
-#endif
-}
-
 /*
  * Lookup a probe declaration based on a known provider and full or partially
  * specified module, function, and name.  If the probe is not known to us yet,
@@ -339,13 +214,6 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
 	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
 		return idp->di_data;
 
-	/*
-	 * If the probe isn't known, use the probe description computed above
-	 * to ask dtrace(7D) to find the first matching probe.
-	 */
-	if (dt_ioctl(dtp, DTRACEIOC_PROBEMATCH, &pd) == 0)
-		return dt_probe_discover(pvp, &pd);
-
 	if (errno == ESRCH || errno == EBADF)
 		dt_set_errno(dtp, EDT_NOPROBE);
 	else
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 13483301..c98bbfb9 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -319,11 +319,6 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
 	if (dt_state_get_activity(dtp) == DT_ACTIVITY_STOPPED)
 		dt_state_set_activity(dtp, DT_ACTIVITY_DRAINING);
 
-#if 0
-	if (dt_options_load(dtp) == -1)
-		return dt_set_errno(dtp, errno);
-#endif
-
 	return 0;
 }
 
diff --git a/runtest.sh b/runtest.sh
index 0fe98a99..c720a8c9 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -247,7 +247,6 @@ Options:
                           or with a timeout, but have no expected results,
                           as the expected results.  (Only useful if
                           --no-comparison is not specified.)
- --[no-]baddof: Run corrupt-DOF tests.
  --[no-]use-installed: Use an installed dtrace rather than a copy in the
                        source tree.
  --quiet: Only show unexpected output (FAILs and XPASSes).
@@ -267,7 +266,6 @@ exit 0
 CAPTURE_EXPECTED=${DTRACE_TEST_CAPTURE_EXPECTED:+t}
 OVERWRITE_RESULTS=
 NOEXEC=${DTRACE_TEST_NO_EXECUTE:+t}
-NOBADDOF=${DTRACE_TEST_BADDOF:-t}
 USE_INSTALLED=${DTRACE_TEST_USE_INSTALLED:+t}
 VALGRIND=${DTRACE_TEST_VALGRIND:+t}
 COMPARISON=t
@@ -303,8 +301,6 @@ while [[ $# -gt 0 ]]; do
         --no-comparison) COMPARISON=;;
         --valgrind) VALGRIND=t;;
         --no-valgrind) VALGRIND=;;
-        --baddof) NOBADDOF=;;
-        --no-baddof) NOBADDOF=t;;
         --use-installed) USE_INSTALLED=t;;
         --no-use-installed) USE_INSTALLED=;;
         --timeout=*) TIMEOUT="$(printf -- $1 | cut -d= -f2-)";;
@@ -641,56 +637,17 @@ done
 
 # Initialize test coverage.
 
-if [[ -n $NOBADDOF ]]; then
-    for name in build*; do
-        if [[ -n "$(echo $name/*.gcno)" ]]; then
-            rm -rf $logdir/coverage
-            mkdir -p $logdir/coverage
-            lcov --zerocounters --directory $name --quiet
-            lcov --capture --base-directory . --directory $name --initial \
-                 --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
-        fi
-    done
-fi
-
-load_modules
-
-if [[ -z $NOBADDOF ]]; then
-    # Run DOF-corruption tests instead.
-
-    test/utils/badioctl > /dev/null 2> $tmpdir/badioctl.err &
-    declare ioctlpid=$!
-
-    ZAPTHESE+=($ioctlpid)
-    for _test in $(if [[ $ONLY_TESTS ]]; then
-                      echo $TESTS | sed 's,\.r$,\.d,g; s,\.r ,.d ,g'
-                   else
-                      for name in $TESTSUITES; do
-                          find test/$name -name "*.d" | sort -u
-                      done
-                   fi); do
-
-        if ! run_with_timeout $TIMEOUT test/utils/baddof $_test > /dev/null 2> $tmpdir/baddof.err; then
-            out "$_test: FAIL (bad DOF)"
-        fi
-        if [[ -s $tmpdir/baddof.err ]]; then
-            sum "baddof stderr:"
-            tee -a < $tmpdir/baddof.err $LOGFILE >> $SUMFILE
-        fi
-    done
-
-    if [[ "$(ps -p $ioctlpid -o ppid=)" -eq $BASHPID ]]; then
-        kill -$TIMEOUTSIG -- $ioctlpid >/dev/null 2>&1
-    fi
-    if [[ -s $tmpdir/badioctl.err ]]; then
-        sum "badioctl stderr:"
-        tee -a < $tmpdir/badioctl.err $LOGFILE >> $SUMFILE
+for name in build*; do
+    if [[ -n "$(echo $name/*.gcno)" ]]; then
+        rm -rf $logdir/coverage
+        mkdir -p $logdir/coverage
+        lcov --zerocounters --directory $name --quiet
+        lcov --capture --base-directory . --directory $name --initial \
+             --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
     fi
-    # equivalent of unset "ZAPTHESE[-1]" on bash < 4.3
-    unset "ZAPTHESE[$((${#ZAPTHESE[@]}-1))]"
-    exit 0
-fi
+done
 
+load_modules
 
 # Export some variables so triggers and .sh scripts can get at them.
 export _test _pid dt_flags
diff --git a/test/utils/.gitignore b/test/utils/.gitignore
index 7c25cb18..4d52db48 100644
--- a/test/utils/.gitignore
+++ b/test/utils/.gitignore
@@ -1,6 +1,4 @@
 # In-place built executables
-baddof
-badioctl
 workload_kernel
 workload_user
 print-stack-layout
diff --git a/test/utils/Build b/test/utils/Build
index 1398822b..10f4e726 100644
--- a/test/utils/Build
+++ b/test/utils/Build
@@ -3,7 +3,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-TEST_UTILS = baddof badioctl workload_kernel workload_user showUSDT print-stack-layout
+TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
 TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
 
 define test-util-template
diff --git a/test/utils/baddof.c b/test/utils/baddof.c
deleted file mode 100644
index 5f844625..00000000
--- a/test/utils/baddof.c
+++ /dev/null
@@ -1,191 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <stdarg.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <math.h>
-#include <string.h>
-#include <dtrace.h>
-
-void
-fatal(char *fmt, ...)
-{
-	va_list ap;
-
-	va_start(ap, fmt);
-
-	fprintf(stderr, "%s: ", "baddof");
-	vfprintf(stderr, fmt, ap);
-
-	if (fmt[strlen(fmt) - 1] != '\n')
-		fprintf(stderr, ": %s\n", strerror(errno));
-
-	exit(1);
-}
-
-#define	LEAP_DISTANCE		20
-
-void
-corrupt(int fd, unsigned char *buf, int len)
-{
-	static int ttl, valid;
-	int bit, i;
-	unsigned char saved;
-	int val[LEAP_DISTANCE], pos[LEAP_DISTANCE];
-	int new, rv;
-
-again:
-	printf("valid DOF #%d\n", valid++);
-
-	/*
-	 * We are going iterate through, flipping one bit and attempting
-	 * to enable.
-	 */
-	for (bit = 0; bit < len * 8; bit++) {
-		saved = buf[bit / 8];
-		buf[bit / 8] ^= (1 << (bit % 8));
-
-		if ((bit % 100) == 0)
-			printf("%d\n", bit);
-
-		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) == -1) {
-			/*
-			 * That failed -- restore the bit and drive on.
-			 */
-			buf[bit / 8] = saved;
-			continue;
-		}
-
-		/*
-		 * That worked -- and it may have enabled probes.  To keep
-		 * enabled probes down to a reasonable level, we'll close
-		 * and reopen pseudodevice if we have more than 10,000
-		 * probes enabled.
-		 */
-		ttl += rv;
-
-		if (ttl < 10000) {
-			buf[bit / 8] = saved;
-			continue;
-		}
-
-		printf("enabled %d probes; resetting device.\n", ttl);
-		close(fd);
-
-		new = open("/dev/dtrace/dtrace", O_RDWR);
-
-		if (new == -1)
-			fatal("couldn't open DTrace pseudo device");
-
-		if (new != fd) {
-			dup2(new, fd);
-			close(new);
-		}
-
-		ttl = 0;
-		buf[bit / 8] = saved;
-	}
-
-	for (;;) {
-		/*
-		 * Now we want to get as many bits away as possible.  We flip
-		 * bits randomly -- getting as far away as we can until we don't
-		 * seem to be making any progress.
-		 */
-		for (i = 0; i < LEAP_DISTANCE; i++) {
-			/*
-			 * Pick a random bit and corrupt it.
-			 */
-			bit = lrand48() % (len * 8);
-
-			val[i] = buf[bit / 8];
-			pos[i] = bit / 8;
-			buf[bit / 8] ^= (1 << (bit % 8));
-		}
-
-		/*
-		 * Let's see if that managed to get us valid DOF...
-		 */
-		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) > 0) {
-			/*
-			 * Success!  This will be our new base for valid DOF.
-			 */
-			ttl += rv;
-			goto again;
-		}
-
-		/*
-		 * No luck -- we'll restore those bits and try flipping a
-		 * different set.  Note that this must be done in reverse
-		 * order...
-		 */
-		for (i = LEAP_DISTANCE - 1; i >= 0; i--)
-			buf[pos[i]] = val[i];
-	}
-}
-
-int
-main(int argc, char **argv)
-{
-	char *filename = argv[1];
-	dtrace_hdl_t *dtp;
-	dtrace_prog_t *pgp;
-	int err, fd, len;
-	FILE *fp;
-	unsigned char *dof, *copy;
-
-	if (argc < 1)
-		fatal("expected D script as argument\n");
-
-	if ((fp = fopen(filename, "r")) == NULL)
-		fatal("couldn't open %s", filename);
-
-	/*
-	 * First, we need to compile our provided D into DOF.
-	 */
-	if ((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) == NULL) {
-		fatal("cannot open dtrace library: %s\n",
-		    dtrace_errmsg(NULL, err));
-	}
-
-	pgp = dtrace_program_fcompile(dtp, fp, 0, 0, NULL);
-	fclose(fp);
-
-	if (pgp == NULL) {
-		fatal("failed to compile script %s: %s\n", filename,
-		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
-	}
-
-	dof = dtrace_dof_create(dtp, pgp, 0);
-	len = ((dof_hdr_t *)dof)->dofh_loadsz;
-
-	if ((copy = malloc(len)) == NULL)
-		fatal("could not allocate copy of %d bytes", len);
-
-	for (;;) {
-		memcpy(copy, dof, len);
-		/*
-		 * Open another instance of the dtrace device.
-		 */
-		fd = open("/dev/dtrace/dtrace", O_RDWR);
-
-		if (fd == -1)
-			fatal("couldn't open DTrace pseudo device");
-
-		corrupt(fd, copy, len);
-		close(fd);
-	}
-
-	/* NOTREACHED */
-	return 0;
-}
diff --git a/test/utils/badioctl.c b/test/utils/badioctl.c
deleted file mode 100644
index 8a5c286c..00000000
--- a/test/utils/badioctl.c
+++ /dev/null
@@ -1,129 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <sys/mman.h>
-#include <sys/wait.h>
-#include <sys/time.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <fcntl.h>
-#include <stdarg.h>
-#include <string.h>
-#include <errno.h>
-#include <unistd.h>
-
-#define	DTRACEIOC	(('d' << 24) | ('t' << 16) | ('r' << 8))
-#define	DTRACEIOC_MAX	17
-
-void
-fatal(char *fmt, ...)
-{
-	va_list ap;
-
-	va_start(ap, fmt);
-
-	fprintf(stderr, "%s: ", "badioctl");
-	vfprintf(stderr, fmt, ap);
-
-	if (fmt[strlen(fmt) - 1] != '\n')
-		fprintf(stderr, ": %s\n", strerror(errno));
-
-	exit(1);
-}
-
-void
-badioctl(pid_t parent)
-{
-	int fd = -1, random, ps = sysconf(_SC_PAGESIZE);
-	int i = 0;
-	caddr_t addr;
-	struct timeval now, last = {0};
-
-	if ((random = open("/dev/urandom", O_RDONLY)) == -1)
-		fatal("couldn't open /dev/urandom");
-
-	if ((addr = mmap(0, ps, PROT_READ | PROT_WRITE,
-	    MAP_ANON | MAP_PRIVATE, -1, 0)) == (caddr_t)-1)
-		fatal("mmap");
-
-	for (;;) {
-		unsigned int ioc;
-
-		gettimeofday(&now, NULL);
-		if (now.tv_sec > last.tv_sec) {
-			if (kill(parent, 0) == -1 && errno == ESRCH) {
-				/*
-				 * Our parent died.  We will kill ourselves in
-				 * sympathy.
-				 */
-				exit(0);
-			}
-
-			/*
-			 * Once a second, we'll reopen the device.
-			 */
-			if (fd != -1)
-				close(fd);
-
-			fd = open("/dev/dtrace/dtrace", O_RDONLY);
-
-			if (fd == -1)
-				fatal("couldn't open DTrace pseudo device");
-
-			last = now;
-		}
-
-
-		if ((i++ % 1000) == 0) {
-			/*
-			 * Every thousand iterations, change our random gunk.
-			 */
-			read(random, addr, ps);
-		}
-
-		read(random, &ioc, sizeof(ioc));
-		ioc %= DTRACEIOC_MAX;
-		ioc++;
-		ioctl(fd, DTRACEIOC | ioc, addr);
-	}
-}
-
-int
-main()
-{
-	pid_t child, parent = getpid();
-	int status;
-
-	for (;;) {
-		if ((child = fork()) == 0)
-			badioctl(parent);
-
-		while (waitpid(child, &status, WEXITED) != child)
-			continue;
-
-		if (WIFEXITED(status)) {
-			/*
-			 * Our child exited by design -- we'll exit with
-			 * the same status code.
-			 */
-			exit(WEXITSTATUS(status));
-		}
-
-		/*
-		 * Our child died on a signal.  Respawn it.
-		 */
-		printf("badioctl: child died on signal %d; respawning.\n",
-		    WTERMSIG(status));
-		fflush(stdout);
-	}
-
-	/* NOTREACHED */
-	return 0;
-}
-- 
2.45.2

