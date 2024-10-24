Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964D6CDBA
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769896; cv=fail; b=gQiZ7IoC1rG9m7FMfPt9O47kWWAP8jlYWDLNlqe2rKFEWptEO8b6zGLwZmAzgLvzi0f9AhEf+T+iQSHPncV7D+9SPHheEbUWVK8OjJSoix+4mKUE0PO2ypGaQf+mMhUghBO8Y1YQl1kyg/rqzPJ7RdzZtzjW3BCguvj/2pF3QpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769896; c=relaxed/simple;
	bh=y+fhSwtZkS8hizu3dWHufMB7SoQ9Dl5BTe2f7h/90bs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Q0kvOSu84WfqFjWGAeFWDqN0/3Jg3OQrWe68GDHRHsZvaZQ8NCaeuU7pzwYVNDa7twRK55wnFiH46mvo+a3If3HqlTeONi8cLGY22fYlcVUTFO8XeaaoT9q2xt9m9QHBKhFhxYaQuQ4qHK2Tyhglt7YeLplbvM1pc216UWO5zi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=np657ci/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B/9Z2ScX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="np657ci/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B/9Z2ScX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fadp007216;
	Thu, 24 Oct 2024 11:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=XevsZ7dur//CFonN
	F4HWOtcTj+hjfg6ItS3yFbuiQLo=; b=np657ci/V37vcTSvJgBYV9HdlLE2zOxe
	DKkX6lZMGEJpCd2LYiVJPENA7rq6Bod2c4C81p+LbV4hbRmXsMN4IZJQZ5HR1YTV
	FMEYZnIXRZTqbpGWhQ1IIo06OvQCX5Dq/1dR17dbxhTrRJmWzD40/SYy1FidYt89
	XTkNIkqX6bCSprDQFdd+3i7TiOhJOixDGinY6n8LDhw2g5rwUTw8d3THsFZgAY1c
	hmcsrdAr4WAuSvRAYara0CTRRGhASiNIuKR5dLP4KP3Eiczgp02a5kfHguByqXiH
	ovUukza2Q4NgJ0ntRhO22ND9CpDqXCy7cQH9fTInEII9wRi+huD3Uw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c57qjcux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAuppU039487;
	Thu, 24 Oct 2024 11:38:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhcbqfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig2dYuQuiZCjEjQSZIDKaVN70IVlWnn3xl4/IWG3leNGi1FiYuOObYn2wijNKLueHOAlxihID5JgFRMeSzzr8Cww2JHJQqYmB/splLrXlPOhpBtjatHOTeWvcg0u6M2BAGYwbj3WYARkbCUI0lY1aXvTc4VUDvXClAIdeQHxhMULuBB22+j98qjrK2HdsP4btU+ZfkApaOS63EkBKzyvhkciWHPgovxJ8J+U+UovHSdRQrFLV5JZ8D3iEKZ5iBW9GrzhG8P/Q1EY4YtjQOs+7WTgxKBKfC5Nv2LcF0AJqC8XSgsQUh3R63sD+6crfAEQfcgYxRBKTet10hFqEsSxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XevsZ7dur//CFonNF4HWOtcTj+hjfg6ItS3yFbuiQLo=;
 b=Idqlv58V31yvNDa38bGSyoYYVbldJ5V+T/qtonDr8Ug/n/1Fb89V1NydxPK2BAvXO+MjtN8m8lobzZEFxjHcCSz9Pi15ZKKtbSAWPwGUyx5f0bnQ5BfetDBaPFnKrVPJ/LiMBA72Z/3TTOeTuP+SaTM01m3lYey24lHInMMvVX+LrsDCG5npUs775t0fY4p3TvgsuqIidKISHfBlam8XcA/wFgBn7N5+z/60XGuU8FqilIxilLgfILRObUD1WecctCzKY1N23u/dpCZ8iRBy8LeAx66LmdsDv9+Pz2ovcFTI+wHn6rambRSFACTc7/WkFGGsmYWcyQ1gW4qekyMLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XevsZ7dur//CFonNF4HWOtcTj+hjfg6ItS3yFbuiQLo=;
 b=B/9Z2ScXfJwEDOuhkF81i5U5vFe18B0HBzrU7BCcBhlBP2cftZwyTfHfY6edpPaJ3okRFniUofFRA/8LcYdu0Pv65i4jGYyzT9TZ1Paf77NyXpr9iU4pOS784RDDhsDaGADWJDZ4iJVI5mlr1++JCv4hMjxRJQqC+2fDGmgY9Rk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:01 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 00/14] gentoo, manpage, and assorted other small fixes
Date: Thu, 24 Oct 2024 12:37:44 +0100
Message-ID: <20241024113758.182050-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0514.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::21) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d94a71-da2a-4968-60e1-08dcf42050d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rgwe3iJ9Sm2H/6NtzweSswdkiLKALhl0FsWqnqVdSwm9YldcaqWxHmMr6nPf?=
 =?us-ascii?Q?7mVecA/NC4XWf2KrJQ29wxVjDWEHsrvElVPCJ9Bu2CJvOJqtYCSuXHo63Xdt?=
 =?us-ascii?Q?JLOlD27uf3pqmNc4UIbjQS29gAz9a4Yjr1pj8EJK9TurA0GsnEdf66wXTKg4?=
 =?us-ascii?Q?JMt+UHoFcDMl1TR+2eJ+JmCMhGjVjWgBvMijz1VDCq/UIU5MJR2kPhRg/qB0?=
 =?us-ascii?Q?0BqCHbCkgMdr3X6syyOQuzMHWyF22hgllV5Z6DUuyc96GqK6TE2EYg84nbT3?=
 =?us-ascii?Q?MZVQiVeLiyKkX4VgceAkcGVuDLlEdB17/dhMRHIssQYZy7SdE0N/UD4ur8+8?=
 =?us-ascii?Q?vYa9mltf1Pm/pQyhCRw/OMltK4y54cv9GsMJK47UBBk7boJr4cvFPsHMhkFt?=
 =?us-ascii?Q?stshxRYO3ozpTUTKYIhXn3+dlKQ8lOtdsI3YEFn+UIfjTLUbc1ucAe5YJm0s?=
 =?us-ascii?Q?kFsQluwl8ZOzmfGJWWQLf88UCmzWPWgjerGF1bqwXpcORYU10hLAIZOmD30S?=
 =?us-ascii?Q?4DuP9RnbX+OSOPiYE3KSVuoxkshMIanZJLgjdX0RpWPoDBgcIK0hY6HefyHS?=
 =?us-ascii?Q?Min4k2+W+gJSMDyT8lJTDPdbJNaIJyiIS2Mo9JEAV5mjliIU7361nRiY+0ap?=
 =?us-ascii?Q?TWtesBNgEthL4B+uXBSLhCGXx6VR+bWUahPglVUbvpA9SaWbcpVeQRSwkUFn?=
 =?us-ascii?Q?H3yUPZhlNDla9gJMz10vMxW7ykB4BJN0M9BYLWMtxZ9ASfDfnDz6WzcPfM+q?=
 =?us-ascii?Q?qP2Ll9+CHPhzQfcSm89kL2N7lY1TDrhc26JoNMHpSoEdPiww68aiJqWKn2K/?=
 =?us-ascii?Q?mF2rHHPyM/Bfmvqj5jvErIWi3pTCQLIptoh6eIKn3/HZ0qaGj8QqY8EQkXKb?=
 =?us-ascii?Q?8p2GYYvg7o5P1OFsnYM3SogDpcZpBF/8zUypWunfjIqpCaXw2v/Vhr9EMYI6?=
 =?us-ascii?Q?jscEKQrBcusqnpkjiW5Jd7MERgJ2RXszeltv1l+M/C/erQ2IcKYbKYwuLihU?=
 =?us-ascii?Q?um3P/mRVtBNGwNBFPJ2FITrfDryOxncdOGJAKD67xvmX9kJzKhF2znTCxGZv?=
 =?us-ascii?Q?+TjKZE1G19ENXlNBBYOXgVK2AqEHr+l9NYmZT95GUdI4iJzKbxUD5PAGeUWf?=
 =?us-ascii?Q?/0t4SLF28oEUh4rfAHGCT5oyU3CcHevFaMMbwFCDYts7N6cQnyi5IDdVInZ+?=
 =?us-ascii?Q?QJD6dKLcpPUOxKbLKidrSxhu3O/lXaDRKLwYj4PWHlNStwjikPFsNddlfzxs?=
 =?us-ascii?Q?ZEZ5kj2PmUJNu6VzZZVX5YN+1O1C47AeO2765TBS/6gCwhXgcrOVoU1HVglG?=
 =?us-ascii?Q?ByhJsKYOYJsDZZDZpz7uzdXB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y/h2GTNrRuX45Ru83BE6aOBEvSP5coHP720uRKTXZl1NwnNspnBuijm2j/nz?=
 =?us-ascii?Q?vVd5LnNucYQZ0o5M3XDB0EC6q8WqdKqjdNhAWC6LfvawJImh0p6ib5H/e23B?=
 =?us-ascii?Q?v9f7TA5IUve07LgJS3q/6demUGtf+5deQ7Pw8FNJqBrmeeOLvLJuqJR8xuGw?=
 =?us-ascii?Q?8wfj2/4qwHFfGyq5XP064N/6822Srd0rsPEeOYOD5BFPAtR8b2HEm7/woixW?=
 =?us-ascii?Q?4KHQaUb1e8iPMonbc6w1475/MlzmtRMxGmkFxiti0coZVpilAWOymauRFo1x?=
 =?us-ascii?Q?JY8unH8rOplx4EX2vFbl2GBNKZNHBhu0F8o4BHOwH60Ied1wb585/qe38lRj?=
 =?us-ascii?Q?939odU39MtzVqJRxfodOE3O9U6kxYLVgr+G69uX+aP8RROZ1aAwgpCxehjY/?=
 =?us-ascii?Q?iIklgIn3p8f2y77qmsbPbgJcQwK6qP0mPGmRHyCnwdrOA/raF3L74buG2eYd?=
 =?us-ascii?Q?/14MjLS/+CR0JVqf777CeanQ0W/OSR9rwW+XCY9u2y+cc2X4iaHHGjh4b2/g?=
 =?us-ascii?Q?Vleqj1FJtUPyi3l0Ej+jdtGj371LPdGI95n7ddkb+mEr6zlUG+cBfuNHoqSh?=
 =?us-ascii?Q?TLy2ZCHN4vQot1Aj5XOY+xcs0lCxEIK6ZjGK4yS+0m1QO58fboeLKDZ07hSK?=
 =?us-ascii?Q?3FJtpihek0aVC/NtWaG81mDriBvXbr+ymfJJ+wGfyx9d8g6vEdklRnjO94LC?=
 =?us-ascii?Q?0D76hiziZ+EqTBVLw+ohVRf6QMPHCcSs8x7f4M5qoKh2KZD8/KIcKewLsZuA?=
 =?us-ascii?Q?ksfMRXo23LI++pReZEdsW1vfKZq8PolB7YkMOhMm/lng9m/LZ3tcgMM+4Pjn?=
 =?us-ascii?Q?2vBL6BDfSjmNJ9fgU9r/u67TmyIS73uNQdmtyHTVNzp3+wP1OK03cRei5qGv?=
 =?us-ascii?Q?6f6NkE3XHku3iS0UkRyDj5As/ys/o2dwDEs6j9I1wcD1Mc9KBqvZhaYf9A2g?=
 =?us-ascii?Q?zEY9oAE8OzU0rp0/IdOyWjYsS0LWJRKINhr+a8tgTbeZQcLIt5nbkUpB4jTU?=
 =?us-ascii?Q?kdnp88nItT3L2IeuKT8+w5wNG8VsWGfkHBqWurSELeaSPL75QtuoIjnt0K0r?=
 =?us-ascii?Q?VHLlyX/VFYw1Uov1us0LemT3ghMQnm2K+NLJk1g/AmtFa/WethHb4awdmtN5?=
 =?us-ascii?Q?u76IpCmBCWvN8GfNDwz3PByv8JboeLu6h4bclYriB1n8WbZwZ/+b9lu+v2Dl?=
 =?us-ascii?Q?Ko0260eH5t9cV9+a2MxyQv0W3XeQE8RGQiu8anVszP0TJqAmGBOxq90emwy0?=
 =?us-ascii?Q?iVcTCbiPI25eXIQrsgloYv8dF/COWsW8NxY+2hJwcsrTwyjLVhpwhGGiiYum?=
 =?us-ascii?Q?Zi5u4KZANJIc3l4f1bys41eBWUhR/uBkyKsLGhin3hLXzEC0MoNHMqrVubq7?=
 =?us-ascii?Q?HB1PtDpOQ6K/yvfaTzHMAlTyXxRLOz1ho5lLK/2cIp1MFG3LCOq2K2c5cIa9?=
 =?us-ascii?Q?/XsyBqlhG8vUx8R4kv2m/e3ZWMHI9jdfRj30YRZkZic8Kc78mB1rm5PdWntf?=
 =?us-ascii?Q?UUoClXu9EMlKnhLqFpYycQYjPBKIgTZ9aCE+BJjCSu6eVAwVkXdYUsHjFMTB?=
 =?us-ascii?Q?hI9Nav5tplKL+1LQCZLlgDP38+96AuA0HVmBoRK35Z+5ZAGDbImQSFC/jd/n?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VA+Alq/8c4H2cExCH5l4NofjJ3oL8q1Jzs0mCUGcyxziL0CZx0x3sL3PjH4LaW997bK8id41owyF+01PYnZD+IlOrCEz6fVEoavN7piFaIZF3gKca2RZi4ffsWEEIVdvoWUtz1Jkle14rAwrX50qNAuqOR6/6CxwJC1uzlsmKR88zmPk5rBrCF2hoUcNA1yQJLOVTRIjhEWKA0MlDGFha0p+3TrLhDZ+xo4Zut2Pky28LSZiR0WOS1HJU63TZtsm+5pZvsDL9Jw8x6LK2b2TdvMcM+gUKCOPzyTBf8QQocnXm4pkPkbiSs06+4qLi8760mS8kKWygO27vnpXpk3GG4ZzwROCAIYOnE/y2YQV/YXG2sRPvB0Wwb4YdaQ6fDSTP2NJ2Axf1DqY53T+ohar5U0dEHWDPrPAs1DmaJAmAOcI/ljKJRKMPsVRYfyjJIRomQuWtPZcUXxR4nbjHmR2b0t1D+cXEUHbyEC9mFkf61UbGWUYlVUPIvdS4xASZAF2TurYF0Vk4BkfJ0cEUe4NXofG5LKUTjoMIZlrNHIcZgcqj70lc7Me5umnL5o2HLjeH161rxGb0r8/abVzSZxdGJ8RHV7Cu8BrSRkgrSSP5b4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d94a71-da2a-4968-60e1-08dcf42050d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:01.4586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiSplpidYB99ybZYy4uoLEiz5yzXaXr3x7d8qxIrmGZ433AZMHA77crHyPHblHlZxCn9uPeeoMCQSOVQ/wNBxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240094
X-Proofpoint-ORIG-GUID: sQD9mB-3JDZjVQwctvxIaNhE_rNUL7o6
X-Proofpoint-GUID: sQD9mB-3JDZjVQwctvxIaNhE_rNUL7o6

Most of these are bugs reported by Gentoo, but their request for a
dtprobed(8) manpage triggered a sweep of the dtrace manpage too, plus
a fix to a rather unfortunate millisecs-versus-sedcs bug which caused
us to wait for an hour and a half for a dtprobed parser child timeout
rather than the intended five seconds.

The only potentially contentious ones are libsystemd (quite a lot of
code, and not ours, but it's BSD-0-licensed and I took out the most
ridiculously overkill parts), and the last two, which drop apparently
redundant markup from the manpages whose purpose I'm not clear on but
which seems to be ancient and is probably working around bugs in old
Solaris troff or something. We can probably assume groff by this point,
it's been the only maintained troff for decades.

Nick Alcock (14):
  No longer depend on libsystemd
  pkgconfig: drop spaces in variable decls
  configure, build: make valgrind optional
  build: substitute LIBDIR in pkg-config files
  probe: get the size of the hash-lookup key right
  configure: fix dreadful behaviour of MANDIR / --mandir
  man: the synopsis is ended with .YS, not .SY
  man: use \- for option dashes, not -
  man: drop blank lines
  man: fix blank line in environment variables list
  dtprobed: fix parser child timeout
  man: add manpage for dtprobed(8)
  man: drop double-\fB at the start of every option line
  man: \fP-ize

 GNUmakefile              |   3 +-
 Makeconfig               |  37 +++++++++-
 cmd/Build                |   2 +-
 cmd/dtrace.8             | 151 ++++++++++++++++++++-------------------
 configure                |  11 ++-
 dtprobed/Build           |   9 +--
 dtprobed/dtprobed.8      |  66 +++++++++++++++++
 dtprobed/dtprobed.c      |  10 +--
 include/port.h           |   1 +
 libdtrace/dt_probe.c     |   6 +-
 libdtrace/dt_work.c      |  18 ++++-
 libport/Build            |   4 +-
 libport/systemd_notify.c |  70 ++++++++++++++++++
 uts/Build                |   1 +
 uts/dtrace.pc.in         |   6 +-
 uts/dtrace_sdt.pc.in     |   4 +-
 16 files changed, 291 insertions(+), 108 deletions(-)
 create mode 100644 dtprobed/dtprobed.8
 create mode 100644 libport/systemd_notify.c


base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
-- 
2.46.0.278.g36e3a12567

