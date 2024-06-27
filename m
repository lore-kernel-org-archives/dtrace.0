Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F31A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466525; cv=fail; b=iKCG3Pfbt0eJexcGn1NW/LyNxMJe1ON0kEHl5owjfTyky7ZAFEzv7w43Fdh2DW1JwLo9Kzv7XKdoj6PLiklX4YdAHLQvPnUcgkQ28NFQD1WVZxSpZ0dVjOOMSDjVhjkhoqXEREhIL4/qUZ0woBg1UWFxiIJnsB3nc9txkvJsVI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466525; c=relaxed/simple;
	bh=BCOVN2nrQejSjzjtN8r2rES4g/GuhMTc2lDeNDaIJiI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JvXI7+cWsMdeuBIEFQOVtSTnOBo46QT1EZzbqMbJIj6ETTj6Dj459cik05/7Nvm4Txe12FQVVxvEodP5whaYlhGanwvj2P33FpruUYTuWf785v/Y8xIHWXdrFcNVWqr2xgp49Nx5c55uFkAl1/5idL76XQHftrf4zPJDGU8lWLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E1NblQKq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jaY0h5Yn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E1NblQKq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jaY0h5Yn"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMUHO013901
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=kjFtEvl7EC6/rR
	JS3pS2IJnjCEfbYcMZvVMZRe1St5g=; b=E1NblQKqOp0OYm9n4wu0rly4A3Gbh5
	+Qb0bQqw8pdhgrBo6XxjFPTwE0BiMwxmOmIOc4fjWKRQBMgqg3TC1uoptmDkcA9E
	KW0o35U1iV7B1KqQH51lln0sK6zHJStimnJ5rJQkoQVwDLjsq1i/nHIUTGjXG5qc
	UP4TEnUzJiB1qS7TVyrrImgJsW8QNZjr/7IfTeajQdHentqQhyHwuUEA8Nv438DT
	II72LZRFjPSjyVW0DFercO0z26YfK5Gtn4X/HlIsC5l3nGKoy7V+pTq5LcMg+/PH
	05NwngrF1eTXRHcUw8kMqsxoMBENxD4h9x97CAzVpAP2NqYbIcWDFpsg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2n0sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3feF4001307
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amx09-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pof0iJLHE7ko2XqCLJ3WrShhRagXzYIlI6FDqw75MR4WW/dK/xHIgnJo23evuJqDl0Z8f4OhYycQqC35z0aGC9+y1I8oP/icjmMkvMRl8ptDOfqib1v1D/YfMEDKRu8CkZlq8aNqKlyqixG6Lk1f6I1gt/nMUZxEfkdnZ0Oc0eAYxd3hI2eWYNhjPv/UpRVidVKoeBVz6snksAnUwclrJDbuIsqy0lcsO/H2Ih/KB8USYKzKFeyLsOROE4wtcL3NfyMJ5xkGQ9r7FFSHA3lrP8c5kx6x+5fqtLtz9EFd8QADfskOdQjm/Z79F8tK3VSyaDh3bomVhrHXgJ1bCMi6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjFtEvl7EC6/rRJS3pS2IJnjCEfbYcMZvVMZRe1St5g=;
 b=cs7amwFQpT3gGa8WsgB/FRWlhjbHrzs+D2ubj0NFrEHgX+v7Cgc+jYJxarr2RQorMg1uBVcDCeCA9zPcq+WUYn6kPa2D7L82XptTPj9j13ZsT9lEqGD95EdyMKy2xdaG3yXqli6PqU0BUaGCYKJYz863MZaAOxQeZapqK2m7sy3JxL+ZPNscpMUiPcKJZ3n+3vIdzFi4y0c5Ep2KJYnKVwJiLUbS3hMIHnHXqOV1V1P16p/GMv9Z3duwOno0fo98qQRe0I0kbcdcE2OvbwimH7C1PSBhKXtCCG+uBrg6p4eIWSszMxuiy2vuJMMZTg16SO0lJpdtvN2oYOTAFQO/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjFtEvl7EC6/rRJS3pS2IJnjCEfbYcMZvVMZRe1St5g=;
 b=jaY0h5Yn4kopezz1/PX68EBdUk87uO4J0PEtK5x5HVpoDGzwEE30MVg+Bky5twpoC67Ntpee5nr1h5SjQqsDoBphyjSsXXN1e9hNkxLnnc+vqeJx9fSbgJkD3Mg1n+TZ645CPcqpIP28HnNXyr44XB3NkJb5q9dAPpWO7wdfbtg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/38] Get rid of unused dtrace_repldesc_t
Date: Thu, 27 Jun 2024 01:34:23 -0400
Message-Id: <20240627053455.21567-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 93514a82-735e-48b7-81ec-08dc966aedd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?utsfIHnfpxbHiubsWnyPsOb35gUo05kq2DM0328e5Mz/ylX5WJWqk8VMN65R?=
 =?us-ascii?Q?IHHDNshQ5ylLyXwqVcwQnMYT0g3NEwIPIVbeeJwMQ2y2uZ9eesVRj18556ta?=
 =?us-ascii?Q?boJZpTBWgPGLpRDLJ1PxiWzYEIN7MqHsR2dBcFi8wFbMX+EVh51FRa6WF1Ks?=
 =?us-ascii?Q?HJ4ZqgookN1xq7PtrzfCexdwwccKrcv1iVqOwadadcf9P6efZWTADHbIuKJO?=
 =?us-ascii?Q?rK9b19CD8pTmNpKgj3OuFInjuqLwHi/5AUh32m9CJSnc/HLXz7YK0tMzwhMz?=
 =?us-ascii?Q?S3471dAeoItRkjAY0BZYtRRit3APCX1YqVHAckbvJ60NwEMUa/xybLeTy7pu?=
 =?us-ascii?Q?c6uODJOjS+rOS8AfffwpP3yjhSmJM5sZ4hzizS9HR5iB4R3Pe/dcCOTUTHae?=
 =?us-ascii?Q?7awWPsxnA/lCk6YfQ5aLMrOe/e4fkyLACghbCQEfarffGpQnw/wR7GVpuvvl?=
 =?us-ascii?Q?Dh9TS9rtWvioeJjAl07/Q6wHkcUOynDylkX2EIOL5aXr5x75PHd5IN2R1yAt?=
 =?us-ascii?Q?sicosDbJE83nvKDmGpyFuNkfnxNgggAxcDmPnHDdzEP9AiYHy9Bbw764Yj4D?=
 =?us-ascii?Q?mhmk4mTmCgmKc3CUSDPmMxtuEb6LAD5ToXpujOFyHV1RMb0VoWn/mlJZccMf?=
 =?us-ascii?Q?aB96QvfS+1rQJruAiAjXnCrTdaNTaYNhNIPR7piQ144pffBcRlYkWg9cRWWN?=
 =?us-ascii?Q?FJDTlCdDdd+DrvH31Do2pxPUM3TboyOHKwkVasfSlyTD1n07oIzqg6CpV6AE?=
 =?us-ascii?Q?WRbhJSfD2yd0El9+QvpUGEIo/G1hAmh+sN+0DywcTTeNYoKjr16GXHLpbfdB?=
 =?us-ascii?Q?jxxCfLQ4yaSbsDW3RLUbL7iyGkSVSGGH4iZWELoP4Fnw9dOXFb46WE7kloIq?=
 =?us-ascii?Q?F8qQBjjdIwu3WwdvX/Yt5TLf7Bo/OL8luMcq4q6QzdbJhVAvIj4qV22xoXjF?=
 =?us-ascii?Q?7VdLsoYi+h8q1Qo+bdriUftsxSVspEdPHrSUakEbpQ6qvNn02s1zdrDx7T6/?=
 =?us-ascii?Q?dj3o6J1LhGc5vItnQInVgxDlptDmlZeAmw9KXiSYSFNyagjd9XXDENeOZGvS?=
 =?us-ascii?Q?zrpPD/Zp0FeZGTZ2BpABaydsROswevZk1lrByUI+F8w3VnpDyOD2aISDK4zj?=
 =?us-ascii?Q?mLvFNYT5DoAOuqOIM2OyR4aAXLdGyNnjfoq48qTiFXzpT+n3kcHmc8txuuRu?=
 =?us-ascii?Q?DCFlfKkYTY6ygBa/ZY1YcTo4hi5DvUu5LuL5ishy4A7c7z42PdSCMLfySESf?=
 =?us-ascii?Q?5+WijdI51z2vsfOyEKCS4kj46fWDVpgHouVDq8m1mAf/9RTe2dy19I3Sd7CF?=
 =?us-ascii?Q?ieS+on48ivgsGLjyfl2O9mxQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c0Ptp5/kOdKD+RJzOu9A8woKu0NtpEq0DwyQdZM/RGIlFMdIhInvs3DWPjJW?=
 =?us-ascii?Q?rYCSIlG7A853eQQJwOlB8sBsUlFNmN6+u8gNX202tQIuCk8E5caDIaYnQlrn?=
 =?us-ascii?Q?2abF8VOBjRxg+Pp9XUFymfNq1Sc/4s8bSHZbRR8ioqXiuVZTxxvunPsuTTBX?=
 =?us-ascii?Q?3398tDuKTSdJoF/Zjhv6j2RvgjnkRFLp17MGgs3sQhhLljNRqqChFoQsRIY1?=
 =?us-ascii?Q?yZftC4Ery5V7lf2+LFpBFcWW97nDik6N+M7xX2y1U/OfR/+eILMC6kzdll4s?=
 =?us-ascii?Q?agq5koDuFcinzCaylXHkCZARdbE3dha4hbk2Rqx0zKDMaDt6faRlUwX7CJ/c?=
 =?us-ascii?Q?k5daSjLIMO8jUEw+NFL7O52tZSZBksdAA3DufzrYdzrK46HuEzfVNtwZ2UsM?=
 =?us-ascii?Q?BLM0hE0SrOJ4R0EPeG8LYVsoJn3hKNcDwevRO86PUbDuiMoNYZTimIq1xqAq?=
 =?us-ascii?Q?81fB1NMQC9jjx+PjadrCR70ci3g6WoXkzlLqcYzTqKI6GANWrJDGyzhCvfpw?=
 =?us-ascii?Q?ttw8Y55382auSd3Nezo2Ty2nwNIDFVy0KNmTU2ndE26YqftBt0oGrNtuJ7wv?=
 =?us-ascii?Q?UYpeonSQZeU7KBrbAs/bjsbYEkpLZ2JpmMcEn7QDEjs5rfEyZBrZcHGM90V4?=
 =?us-ascii?Q?cfKNb2966zl2I8RIBYfQGkLJRveWcGgxC48Innvx1xRMvgzYByDMC2Ooqfyi?=
 =?us-ascii?Q?SYw6YyEB/CkhX3TZGP9EPoLUCY2AvxZIaarK79Dq0zMuIhsgNqc7YUrM+bO3?=
 =?us-ascii?Q?PvGf5e8ce3YXBoyeeQ74J4L1wKqGfQjCNWfwA1typJgAJY2qz8PNM36tzkeI?=
 =?us-ascii?Q?Y5Tv0ctg1hoEn3+XnusxiryL7ecatW1uY+3u0Lu5voCWp2LxU3WgpZWVItS5?=
 =?us-ascii?Q?RT/xTETKjScRo482sfCh4sjJBvjQzHB8Ri1766bWLaP6qu/9WlwvE+piSb/X?=
 =?us-ascii?Q?O8bq7bQqtvg58XvbNhEzOuruL+v7eWF5V5OR2QvhnVr3vLcQJfz1UywMJSsW?=
 =?us-ascii?Q?yPj1pno8GImItqLFMvE4dA9uysQZ3SPwzlHdGpb+KAqBbq2Eby/qqOTKT5XC?=
 =?us-ascii?Q?RDcudjQMyEbTvM1+5tg2AZ6sq0ugWoTVaTf3w3Kz7NRFhlaGA6CWIceIzUUN?=
 =?us-ascii?Q?2xt7rOVKwXd9qbrUl8sW0w3/SqopQRUrt40pAdIPVBoHkbsAkPrb/zcu9jlf?=
 =?us-ascii?Q?BVaB+7/WjdhmBbfYckIBdLX6tGIIlxkBtrqVG7jp+sVReAm8SkKIkaz3+Qq8?=
 =?us-ascii?Q?k9ciszsyO4+HLPfoHRMTunXVtzpFWvb4Li8VSTvFCM4/ZHpJMRKcXOl1JsuJ?=
 =?us-ascii?Q?W7DTlIzrJLC9CygAmkMmjpvFkCNsl9UpirUseQS64zK/mbn00Jn+RPAmy340?=
 =?us-ascii?Q?adhQs+lzNxxgO5+uaeIW9ltAPoMPxkmg2sawvDHxYpZhLDIL7am5+6AOdWcS?=
 =?us-ascii?Q?SVK6IK+1e6gy168I54FH/Lf0yD1SI2NPnZXvzizcYSrrHDJql7e2E4tyrDxE?=
 =?us-ascii?Q?Xohj92Cc+pp97cEyEK0ELMihU60mBgIq6ZP7Dt7EBjJDVROyqM+ueOaxTp5I?=
 =?us-ascii?Q?KX/Zlu3YhWAGA/r3AOtaYji7E1aY2e7K09t3sHLs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gpDhE9gaV75dPnnulyeuqYAUgZS0udHhCUE+sycWFATf9QIeXnNOHM2slftSZ5lhfMjmTQJAkTCSQVxTunqpXn8p6Z/w7xD6Epgm1yLTibtRbfmwgyS4GqRn1g+gtkeGyxiMvnnrVjfOYfwkzqgwUW94vdryX627K3Sxc6XpP9fGJJ2F/QXnje47wmo02/UdM8d6Uxw4vHCIqCS+1wKCQ/fW6uvrAlzgZsOplzbkfY7ZsVLWW8rL6264Ha68DXH/7j0V2APbe1X/bBccfD9RvfkvutHaVqqJdGMOeMnOssjCgaKV6OaxW6FqaP1aXNjMrWFollxoUUMc+C5imtzAWrFvdUBd1Fblzvhhgt3YjWQYO1u2S5QZ0R9PpK8Bg5F7GtTKcmtcM/f7023kv9MY70KQRR2Qbnx8nXq6EKLr/6Rjkkl3v2rgIiGYygVwSm6jnb+Iy/kq9RmIjuK+6Q04HcHC0DJU/6c5kgORRwOlm5i3Pkd64IqJkvAT2QHXFRxfByO19GfB/hIPL/pL7y63IIvHK0S8WFU7Ch3f0UqqybGoFypMyYZtbXaj0rHRcd9p+VuWlsWlkEt3y4452IZH9z7GiIk5MPz0OWvKjTFICWY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93514a82-735e-48b7-81ec-08dc966aedd9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:18.2115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnAu/0mWhe+JDOiBsXW9bNVIFuzRdRI6f8Q+t4vsMsyo6USAxYh8/oymOSS2Vzs5zwf+wwYZRy4ntbqpZbKqvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-ORIG-GUID: B5GUijDv91B2B3gDvgjxiiA1IMbu8oJL
X-Proofpoint-GUID: B5GUijDv91B2B3gDvgjxiiA1IMbu8oJL

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/enabling.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
index d36a73df..f1ec444c 100644
--- a/include/dtrace/enabling.h
+++ b/include/dtrace/enabling.h
@@ -43,11 +43,6 @@ typedef struct dtrace_probedesc {
 	const char	*prb;			/* probe name */
 } dtrace_probedesc_t;
 
-typedef struct dtrace_repldesc {
-	dtrace_probedesc_t dtrpd_match;		/* probe descr. to match */
-	dtrace_probedesc_t dtrpd_create;	/* probe descr. to create */
-} dtrace_repldesc_t;
-
 typedef struct dtrace_actdesc {
 	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
 	dtrace_actkind_t dtad_kind;		/* kind of action */
-- 
2.18.4

