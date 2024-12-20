Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367311A3BAD
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733517; cv=fail; b=fRXF5n9dt3/7AhY6+X7UeqZRBXt/aa5Lc6aTkyMdvXUoAmlOQNT27V1IFIMK+hUVj35eDVlL8YtMyNtqrQBRkL1LCNBh2QOjL5WNON75BO9NtcpS71B8gH3WD62Iw53zvrk2gWWSnMJXpqdCVB+ffc9avlK6j5n6QHZdPRfrVTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733517; c=relaxed/simple;
	bh=gc5uyFToih1vJGINR62NRVmyYAHqQ/IO7rnIsmO01k0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pnPcYr8V2oS0g0VaYYO3zm/G2isBuwJ9niHHMDr/CKMvrCCnrLuOCHbchkjGDgbxgnDdb0nxTa+5AqwnhqRlFOSkiFrDdA6BtM5xedRAszcgq6rAuK3p9XEctGeL9qPLPCjrJ+cmO7sQrilHTEz+U9hWIF/VvlAvZiaKoA+8Uvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dvfEktgf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FKQNgCCg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dvfEktgf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FKQNgCCg"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNrYC032571
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=F9mpOsmN4i4BrXdNtxPX/2RWVeeCj0E0DrO2BZMKg74=; b=
	dvfEktgfuKlNTkw/cqg3ces7U1qLKX291usBOxzqPBzVmH+lfYNqX6ad/T3JPNTB
	zpQ61bZMxzUm3ev2ZSXuMojeDo/Dwazxi0AIEuo8mTIL47gkvDDqCs0ksmm0mg6C
	fYBcVyEAwQiMqxGcS2r1uqn88p8QhaITvRh+vvg+s+zAG2cmLu0NQCH36EuOBt17
	/y31SIvVYkuJG62UUjlCuI+n5pPNF4nWoA3xwqLZ7eUZPjHQN0IEytph8xn4tSYJ
	d/ZGOk+mRbsvGyhmGzcTAHCdCjYevUGyhEFKGaH2El8J9msnVraDVnyjHeh0UJl+
	vWQgDR6aRHwQGl9VDBByYQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h22cx45b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLTs5V000786
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:06 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fd2cre-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfFExvKdOdnJQKGfRAblLua/nrROOlp6zvVnERnDwU+Jupy0ia1Gg3nc5SIYgH/Qjy0lr1iJ/BqnEupELBgpbhzUxS5US4LitQHgY8txFv2g1vS6xL8uGiaNZiMWhQ1UTpPCJqeenxh8QLMFYdATJQAcyH8FprsELyids0/g55VX8w1S2hGAL0yisF2DJxdpGzLw/WsbJ/dOXn96m0BhfTzhu1CQB5sEBbcF5sQMFg7gwsDT2OFCdNZH6kMjulqzcjk3EPvBVJK+NhY2JLrudCosWZGwyrm8xQAMjhLy/6IoDb8h9sPBBw9y0oo/5rcCwkzqS1vw0l5EVNf2NC0WYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9mpOsmN4i4BrXdNtxPX/2RWVeeCj0E0DrO2BZMKg74=;
 b=th22eccuREqa1ZMbsZA/buq3Cxj6H/fallZ/VOFX5MSQt3B4kgVQAU/cqlLQK8uJkDdenKwX41ydSViJq+psVpCvM7EGJMRlKplox/rWaQ0OVQ1o/1/ByFvYQJ57XlrJKMzZf+IVuwMf7qkecQzWH+97E0HsyjVll7jRfAbGXM11sbEiP7dUPxZW2MCHXm7/fSOkc5FDPVw58eRcH5O/A7MiF6M9F3U3hY4P9wtkaq0NrSNHJrj3j+UrZX5/3738U6E4YkCo361fgEVDPx/PY6C4pP6Kxw145MAYjtlZpJeu0QG6eWSjabxf7+O+OUHj0vIS+pYrBdsXb7yZwC22Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9mpOsmN4i4BrXdNtxPX/2RWVeeCj0E0DrO2BZMKg74=;
 b=FKQNgCCgrJwYFmAyqWmOIAUHUKV8OUkqn0tltImUPbVpkUZv8sr067Xrja8nE4JIEU1CsDE/uJms68SmqlW85dl6mKMgshjpfL6RT31ElyGp92USG1fWEBUiaDmjn0npziW9tDKGDegMq0xKw200+NQ6qGkANFk9bXzJwzdWIq8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB7412.namprd10.prod.outlook.com (2603:10b6:610:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 22:24:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:24:59 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/5] test: Remove unneeded skip for trigger
Date: Fri, 20 Dec 2024 17:24:51 -0500
Message-Id: <20241220222455.18351-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0051.namprd02.prod.outlook.com
 (2603:10b6:408:e5::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8c7ebe-0741-4915-a7e6-08dd214523a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y8JEv6FRT/y5iknNVljrFeEiZiSw2dol6XGNJ4QmUGbektOjYLD1m0nn2ldS?=
 =?us-ascii?Q?Umz+3nVjmj9Hjr1sp4gcL+oPWbOZkYqXjAmWg6YOkwBf7l4WKWMQyxclZJ+1?=
 =?us-ascii?Q?yIuCemrYt/wsWOpd8yUlV17tHp9yZbeL0eqG0JV0MJGyKIyfJIc26vj60CRW?=
 =?us-ascii?Q?nLenatdruBBdF4nUlCTnyTPQ0YFE0RK2RBXajfUMdptlst03Gl8wBlz/nNQk?=
 =?us-ascii?Q?fCZxzzM/ybrTmGM+qyoqErjzpcU/ycOSKIfyko+Uc1sQuI1OhWGWZPVrT1T4?=
 =?us-ascii?Q?uGhxBqGmrfclm87dJmyvYaQ00UxxikkLGP70pQamraTQDtIPdk9aRTwL6b37?=
 =?us-ascii?Q?wXjiSImbuPUruFCLD4f7736OXHYm/EvD13sClxcrDXOFnmCijVOAfRRSbnLK?=
 =?us-ascii?Q?dCWxIXvd8E2elWE0owdybpjXI02GCbFY0fonVb2PSLLuvJfbUsy8qDrKmTVn?=
 =?us-ascii?Q?LeMzVnmEablBkbrIRdEUegW69TaOVU1Hb3WDDXzkSdQsf/hV+Y5vo0WMYoYM?=
 =?us-ascii?Q?6gBR7RcSfT/F73YYYKkpw+og9NBkm9dzDaxIKaTjOTcKOzLlkfYvbEGDl13T?=
 =?us-ascii?Q?vU3S3Uc6drPTwus5gmUrFIPlZdTXD9/hCpeW1uPcCsv6eugh9ObFYPehx1bC?=
 =?us-ascii?Q?doVm6aEvOBjUdBi3VdgsRzmObvElN240Hmw19g0mfiY/EGdnpyWQcbFhJykZ?=
 =?us-ascii?Q?kxWb1Ry574o2J3nTGH8aoHv+EChnHqfJ7NrVjUKzH452cYn/WfCTV8hsF4oH?=
 =?us-ascii?Q?0G/Pi9Q6lvtUhWAV7eZxXT7LGN9FI4n9BJrtxCt3Ka31x9/Ih/QS8uEJa5J2?=
 =?us-ascii?Q?M4ybq9/DAGWkuU1B4nsMifEtju2xs3u5L7iIX3muQOlvYGCra8IZxdJfvUjn?=
 =?us-ascii?Q?irBewIMyYCgok6P5nT25pIWdoS3mHHWXUPav1BIR6B0Md8TYSLeGUJo+lufD?=
 =?us-ascii?Q?TIScl6h+k4TGKEmLI7B+4QQ33DQ/WgucPARN4KnU3FYKBM3L7CrjLbEjkHKv?=
 =?us-ascii?Q?PzOuWnMYw17vjucMBrN9RerFBdXD4mq783yErVP9xJLnlSSdnLp69xzXOXmF?=
 =?us-ascii?Q?a+of/AiBCRf3TBYuQ0tzP5weOz/r1yc/8NTCcRrZntJp3vvivmvmrkhztt8u?=
 =?us-ascii?Q?1VRXIySNMOdztW/CifoPh+LO7FZZVqWxv/bfcxsFbaW5lid2dET2NVYVzkLF?=
 =?us-ascii?Q?+gTFMBqXKTWEsElu/DExNvUZDJ+l+ZERuE4jzKMGgyFeyZIEb8PWnv0LDiCS?=
 =?us-ascii?Q?6cHvrxQJX+rSSRjnIsrhBswfMmbDbEztJF/boGsRfJPyugxD/MzsgDln5OzD?=
 =?us-ascii?Q?ogs/yj/z4v96UrLoRuZfclxwPxq4TmwNkPgP+Hgw2kNyv5GlSSpCD9vXo8vW?=
 =?us-ascii?Q?SgYa1yEwGuk/bQIyNPKIvh4fJ2SM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9PnElUlFhw+f3DK3YSJlBAvc1UMBUulv/uERN/3+jY+quL2ttKdJTOnyFniS?=
 =?us-ascii?Q?ZCkCSuHVXCdXoA1RW5KSB6dp2z5Xo+nYCJaUqU736blJM4Fy4wxKj0XwHipZ?=
 =?us-ascii?Q?lOfhW1H28VnyKeLkEOKppYVOTTBdcwodESy3ei3joPuuPGu4vmJyFG69+MI7?=
 =?us-ascii?Q?vnuwCXit8tRp4miAd6Jd3G9+zomvfJ85YvgOdoTCxkomnzWBQbGnqfThxHtU?=
 =?us-ascii?Q?xJfqfTi/fS4bqfxgU7xpihTMXEJ8Q0VMSDvnlaaTXmYQwQ+uIYgIRaZh4NxB?=
 =?us-ascii?Q?2ugLIIVssl9LuwoDykarHuevJEhDoLeO81VOkDwhEth0gjuvsPBRAZ6tbaoM?=
 =?us-ascii?Q?Vu3zQyj0lWbRSzQo/0zT6VoqczMKQwqlBmkvobR71Q7u+Ipc/LJXWE+s0Q0b?=
 =?us-ascii?Q?Y8aU6obmLPq1V7ZN7hrLo7ecCMLoUDx1Y3UUG2iQDPM566f82qFbyyGgWl1c?=
 =?us-ascii?Q?REc7gEVLYq/nh97QPcLiLHE3wtUZgvbHwxQjwR99Q1R7smgxgTbs5XEARfyb?=
 =?us-ascii?Q?GdtitZSPHUL9fkyK4E8MGmOyX1+HD18CCVEJ0KaFBLwO9Om9+r2XF7fBD5dM?=
 =?us-ascii?Q?1e/oU6ksirTPuW0gA2KPtaXtCAdDa+jdcYHarBgwn48BCwcCuTHn8mCWJMoF?=
 =?us-ascii?Q?1tBCqcXUZ4rOTEHdilCjjcP5O/ot1MOxVAgxPwyOA4E3x8if6gqo0LXBCbZU?=
 =?us-ascii?Q?H1Bvjhu/V8RG+tzdbS2KJmxHSFbEupAag3reOHB5LbrPsM7NwvFvRcRAIMhM?=
 =?us-ascii?Q?bwuL3B2Qhyv+/wfNowMgYDoMASOs7C5OBd/NMZLKll3/16ywhQLZDamlrk0l?=
 =?us-ascii?Q?k1hmy+DwpOIsexXZILp649qh4U6dv6PJQswKOq8XAuYcIJ+or59j7YXy1YoR?=
 =?us-ascii?Q?ynlNZzBE+6c3979u7kC8R3BBrZkRtPe4jWemyaZ813+mHmqSvF/VKaPAgTTz?=
 =?us-ascii?Q?jJgzTx29nRnVul5ytu6ktgzkZNT85uuZND2Hi0zjwKd545pHQnzJtja4Okmf?=
 =?us-ascii?Q?QKjmV2pdpEcEOTwAWl0T2/kzwAPq+cjjEl4Dlzzk4by4H78JrifznqmCnMN/?=
 =?us-ascii?Q?uF5MLmqyt4ik9wl13OfTUAX++Hyhh/bdd/udv8SnyYTg3+0kBU77wh+qnvur?=
 =?us-ascii?Q?LFFQd+F+kpKjoCjc594YFmUWswgToPUN4tccQovl0Y0TYHqhyHCaF9ZYrcyQ?=
 =?us-ascii?Q?jJgSB+0n7bcUn4ztjMa+qUCaprxqixrbiGs+V4Y+GECFcgL9k3UGWWr7FiWD?=
 =?us-ascii?Q?nXffDwuBAiIdksRSm3ExYQulRhk2XYbfJ7es/awFFQ8eetCS9DvgUFo4v+05?=
 =?us-ascii?Q?eRSx8CsP73mrrctr9fPnNtvQFoGEjHl+XW8O+PSQ3d3eo/mjnqlXmyN9eG/z?=
 =?us-ascii?Q?KbzFiXxY6BzS63OMlsZn3XOyRWLefApgHaYJ5Efqcz4H1D3ScXJYMmmQybl+?=
 =?us-ascii?Q?xFEmqSBKvW0cLMcWSbHUn7Sv6NWEHvya5Ot4UKcKXimLS/4LCdXqa076Rhd2?=
 =?us-ascii?Q?quSSJiiyZKbgcJtJoxfDNOTp+vNoQWvVjMVIavZZeHWOc3AwaDrO0s16Yyoi?=
 =?us-ascii?Q?TJAWEbRYcOt2NZqEhHTWqjRCelijT8oBXTm6ikm4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ik6DVIIWNhAPGshUS6fBuYiTXqHsdCg/4xP/Rsm1US/my/HKrIfIoY7P5L3p2MIDCkLtDa+r0P3KSNGWsXRLZzRUEczHO57neovzNR+5MYz785nfjkd+yFmAPr1ERGfsq+DYRhFRgc0LpsBzniMNPyszrwwv9EI40/KjXq1s9CHhhEh+9Seg0w0fJkQXmDtF3ur+Fr7LMxIp/hYGU+iWvmtF/GqTKH1/m/JcqUOmxYIjRb3yMjkjV7dzphYK9y/Z0QeMvgnD2fDKCeoH2HWyT9Sx3UinwG4nEpAmLpOsOJbYot/Jsx9EEcDjj5g8Cge13q6S9/laTp+Lt/h/1SgOZcWChFTPB1Gp04OCCPX7dRPRO8VJ3pZWCbq/fOmIKOmb8ZV9k8qTdskGk9e6qJKsgKa3N2T6LN1rx1vi6yRDU+EnQfdifr/RGxN/lXmZ+NA0Mki3sciGE99ucqWZ8sE3ZaCXRDeIIp2DVEEU6/PEMNr+EFk5QD0eW5k6eQHGVEa21rnz/3563L2KmcdOqJEXPcUAZ0UGzn4uhoc/T1WBxRstzXyGEmYK4e9lpqymZ9EsOH70xJsjEqAJub5wNs1tJyy/citsBmaLJqMwXTRwhF0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8c7ebe-0741-4915-a7e6-08dd214523a9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:24:59.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yksc9iGcAiMa0cZTAm34rBaqtiJWJ/sMeshIkJMrdv6qxTIaP+dFML1hWa9+Wq50WNCnBoHLhZ7nvOhvz7kH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: M7T3hj4tL5B_OCVZrlzk2en8HydMLdWZ
X-Proofpoint-ORIG-GUID: M7T3hj4tL5B_OCVZrlzk2en8HydMLdWZ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/usdt-tst-multiprovider-prov.d | 2 --
 1 file changed, 2 deletions(-)

diff --git a/test/triggers/usdt-tst-multiprovider-prov.d b/test/triggers/usdt-tst-multiprovider-prov.d
index 530693ea7..aba458042 100644
--- a/test/triggers/usdt-tst-multiprovider-prov.d
+++ b/test/triggers/usdt-tst-multiprovider-prov.d
@@ -5,8 +5,6 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@skip: provider declaration - not a test */
-
 provider prova { probe entrya(); };
 provider provb { probe entryb(); probe entryc(int a, char *b) : (char * b, int a); };
 provider provc { probe entryd(); };
-- 
2.43.5

