Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2040B1BEF8A
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765948213; cv=fail; b=AC89BAJCQUHPeiG+ldn6TgsB2vDsQddt9TaEi1Ta6M8HUVP88GgS/ied64mJOeMrPsKUG14Wzb5wc2vsd9sZGpwGE/9jx929wQxUvmcE5/kPJNoac4BWQZ0a4SrSf7EowwKiO+dSRAjTfK1hUKWX7rMlavP/0/8biOJSW8Hg2d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765948213; c=relaxed/simple;
	bh=5Fa08TDbmrEeH31KN/YA1xPOZ/NWj9RzMBfMS4Tbux8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fFJWyMlImpvnyOp9LEToSA1CVU9xdKvmihZb7yiG2gtbgild8eDacsQSTHKkGccQxvveSp4Y0Zv5Sk7oh9pvgHGooUlDL3Gy4Qf7vxd9bEgoQHoi2LpFhu0vzN5Idd6jakQRSPDjKfoaZf6LcgAlebvQRbGE2SXhGHUwMi+SHmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FpLcJ8+9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YkS/mWPL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FpLcJ8+9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YkS/mWPL"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH0ubUU1821896
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=RERxmu0oCCT2JPkWCBKiWZ53geyJrjuMg+VMVu+aDWY=; b=
	FpLcJ8+9h4ngIr1yV6/GroUCGgPEl8VVXMbmyFQWekc2j3F/A0Is7OIyaYNJKiS1
	4vqJMvGTSxS0I4eS9VXqZft2mf5dPbIeEsHt8RqR/Sp+6RbGNS1PoCW9uAoW0S2d
	RlwVoA0fFs9qkg8LcUqwVJjyZ4b0q47i4HvVD1HXRrxuSw7NW86u5YAjmn4pS4+a
	5YOQuxFuwE8u7dnf5VkK7lfJAR6iAy1oa6u/UOxvGyL5Z1G0Cn2vCzkbpyfpDA63
	HdmQysATsJ64DLYkgtNpcyIZe9ixWfSo92W6bZnbLpFdka+EwSRAxSZVzQ+UiebO
	7kroReA8Hw/YmoFfIiljNw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b106cd73x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH4ZTbi022508
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:02 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkm4cxf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCBYcz+RkQgwnbzqsCxiXv+h2bwr1a0PChx7RFbtzbKGmBSKcf8NLiYAVXC1jlZOB81De4SJBptYh2dxEqIyo6Go1R5/9+ZAwO6QgysUelCYZO8BkaBxXRPpNYW9HFzUCy0YnoM5HrfJpZkZiJRDo/NR+FamQAa4Qv+KnuZPPKopkZnYVN4Dn3jWj5fBdFUXccgSZTLIBABgtTugg7CszVoRWoj3qJpKqe1zUwu7ywBGvTJgAL6t0Xzea70SPrkfoXmHu60fg1atuSBSun1ZW3zc3lja5GVPw7iarvh6xGLVPf8ORV73HrEKkWnXNjzFMJW1Cl5n+04v+FG1ZET4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RERxmu0oCCT2JPkWCBKiWZ53geyJrjuMg+VMVu+aDWY=;
 b=R1qiWamnr5ygGC+Y95/sYbhbrdeEGLkZ8swX4c4hEa94C7Q2QZNDPKg2sZuxwroj+AL3MMA77lB7HfrEZ80TAr6cD60COB/tqyCaKgzA4NMvaF9jFbKi7yZi7voVheCc9ueAvxil1nKQQhVzVt7XAJoZlSkKJBWbgiGXZ3sDKP0ZoBL+5ls7V/3uTZK04SC82b2bq4FaMlLZbIyNSNEuYnjrKrlqsc0p/K7nv/NmoRPTGBFVxKEKF92ufXbxXqdoAfpwFzSF3gdBBLnYZRzJuBLXVIxT35zqYsm12mrghTf5ymSEtRZJR/maAtQgtETF7LVjqi/mtNdZ4VGUrfN+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RERxmu0oCCT2JPkWCBKiWZ53geyJrjuMg+VMVu+aDWY=;
 b=YkS/mWPLjiKZmN/rZi0arXoOkFLSv/3JeQ19dJ0PUN0t7A9WrdmbYfZIwSKhvK8+TQ0W0Bfv3r5EkPATGxqafHc1xjy7QFxkvuUZRMVXdRxTRP0HG4COFzPIQCydQIzq1Idn7BjbLyGfCcxD398D2wpW0CmHc+coRORa6juzD2w=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH3PPF61A2638A8.namprd10.prod.outlook.com (2603:10b6:518:1::7a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 05:09:59 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 05:09:59 +0000
Date: Wed, 17 Dec 2025 00:09:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] cg, providers: refactor clearing probe arguments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752211096F0B38B398CD019CC2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH3PPF61A2638A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ec1a3b-b924-4ec9-4ff8-08de3d2a86a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dzMazOEIWrYSQH1KOt2YA1nN99fY6UUI4hSan8+Sl0uq94NvLh9USGyH6lN6?=
 =?us-ascii?Q?BVvWxwSeDlUTPlNxaWMpxzhA4IZ/6a31SDq8RnYZ1hOf4AekuGm915dTjiZC?=
 =?us-ascii?Q?4iZjhWiT3y/yf4JH53DHW/zMiCbANEzWueJLG5Mqwq9oQ3dAU8SJ0G0gKAUF?=
 =?us-ascii?Q?F8hGlyi2bvd3ajwylmx1yloQoWPGx7r2F2h++tmGd2YUw8o1nwv77Wgv0qxU?=
 =?us-ascii?Q?3uua6JT7TAfTmC2dd9rDD+giIQKNvDjcn52f9Lc8Z4BqBh57A8SvTqO9rzQg?=
 =?us-ascii?Q?7PfOQMJY7pmBvngAqQsBVyTb+ykjRrX9q6/t30YtoV2g7s8L2iYIamgkntlY?=
 =?us-ascii?Q?OX/ev070XovwADzNL6QG4lgQvlRFPy4+D/N/nL3B3Lr5diveyHpC990b46kU?=
 =?us-ascii?Q?cO9mzcImWTNcNQO7yb/3Deig0GtxEh8LHyajEcal7EJZ9y/jnCsY/xo6+80P?=
 =?us-ascii?Q?ysY9nYW5+8ibmF8R2ZXJ2WBlHbm7yf5eXkLF3tCubIMrgrbkMwBRWCzu+ngQ?=
 =?us-ascii?Q?upD5Vt0I00KbZmc/QzugnWYxI2FA87xzJSdmI/nUmvC+K43H6tv8vOlvVMeL?=
 =?us-ascii?Q?QvJfOhEHKbnDp9JgQBhmrFyyfOOMd7TpDIwq2TH2UcBUu/V2CeqbN12MjHBe?=
 =?us-ascii?Q?R8DElraOQo7x9WYSpUvue+Dsu9Vl0qxbUmJkvVqTFzMNum3Fkt0oVcQN+WBq?=
 =?us-ascii?Q?Mh4z2ORROiVfXurF9ak/VsgI8Q5AGVTGVCb5X6ECs2pVqGBlNYBs5Og7cvgT?=
 =?us-ascii?Q?i548QUIqRwyYorZB+8U7XE0FfkvEK8mMJenDoF/sZPAS5H56hoQV/euIVL7Y?=
 =?us-ascii?Q?5r2iVtpFzzEMEMJYNcNoL3eFwIkEl8OJUpcnoOJ4XAIah3lmkTGSBFz0K3Ee?=
 =?us-ascii?Q?+jUWu+HmxkLgqks7/hgmjJtqCtlOdUecnP7EBwAJKUpIx49aufuMfO+DcbDn?=
 =?us-ascii?Q?Cb05DeMHfsYZJYl3ctMz33ZQ6QOrC6J4CZDUrQ81Y1h46op4CY5ylaS7iJqs?=
 =?us-ascii?Q?QcQYYo3Pbme6ERK7h3llAliYU5J9XUupIJJVEuWbw2sVrVDBivqLAv1A4CYa?=
 =?us-ascii?Q?6+5Y15+i/HHCIK2kSVgxDey92fSfKUitkyRe798xo5rqFYBNak9a+iZGlwAR?=
 =?us-ascii?Q?p9TiT8lOz8IpxO+p3+SNGfOeKSCjVzF48ubOGFj8uOjgDaP8nEt6279vL8al?=
 =?us-ascii?Q?WLx62reyrZ82rM2WC5DiLQ3cR9/kf8BRUjspA4lKhENOY0ypfagVQHU6Y7TO?=
 =?us-ascii?Q?ER/oWIW63XZ+y7TbHROxBDMRP1KmM45a0sUkHUnYZ1TUApPuxT65PQArM08A?=
 =?us-ascii?Q?7Mc3ievFQrQs0YI062wikeUGwLNTKTChsuc2VuaKCgNB9T+siNDYUSZWsR9o?=
 =?us-ascii?Q?0gz5Nzsm2Qzu/nuNd1lfhVZUmRdnC2fKvpb0z3PxfZ0gsiaMR4HOnwfai4AO?=
 =?us-ascii?Q?yh6tRxUpEGm5eZc9wcca+erqN0lyTAA8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9meFPOfxQIzU7EBDXcFdRcA+D+GzB4qLnAqohUMYijaS2I4/Xv331u+RhduM?=
 =?us-ascii?Q?00enuxSfWGMXsfKd0hgziborFaiz6zrFlKw0BxN0jNR23BKB4ze/F7RFi0Bz?=
 =?us-ascii?Q?1MyIDLgoOj3GW7oqITBtNYwtJEJRV5cLhyg6uCKyJwoohfojtigwIhPcgNw0?=
 =?us-ascii?Q?5Az9ligp11DPg2b7HqWU7A2zXYrlUK6P7V/xx/NlnQ+qNWD1gbHNuwYJrRGO?=
 =?us-ascii?Q?wHH0N7jYpWwKyigVGtp1rGIHqwHMDnDIUJ6X3MPQXrNwzvGdY0QcjJrzihDA?=
 =?us-ascii?Q?XEdlR3jVcPR39R/gqdBOsZWR4TWAjsUIM+tXidTxn1tXDjjkdGDok/+xapGJ?=
 =?us-ascii?Q?H2FzbrtrM46zSPa8mvBT2fvkp9SqKZYMYK5vN/JiSWj8KGhJ43cPUmzrZVC7?=
 =?us-ascii?Q?bbH4cmgfAZJRlbfEw6e8XISF5IKUN+UefTtSpMcBbwWdl8NnSojFSz+qwhW+?=
 =?us-ascii?Q?jHSqO4NZys6rJea/ZicYOEDGH/1rrjaEOyu7Hl/cm7muOAB3aCmyBiiiAw9r?=
 =?us-ascii?Q?b1EbDtThB7wbxnYQ6lbrLWCDzvQqkLGf+2Fc5uyNf3U/2E+UUQFSTS+RUAXG?=
 =?us-ascii?Q?QFFOmH4sn4+HJ8PEwjGF/26HQGwSTcg0h/gsS0Zl0CNUvPou2J0q1+v8cw6o?=
 =?us-ascii?Q?bxx24Kb9aA0suubjdGEZP4BU80LOL4OzYH7fB+53+isKDu137d6OBbryqMZK?=
 =?us-ascii?Q?6dVOB4H0r+oiV9rtzk/jOakpqE099xJ3/PzlxLdajDyjQeOSSeHDiBWJQtHg?=
 =?us-ascii?Q?CQNpm9FL9Qmr/auGeMB0+UAvF9/dUJ0co+U0+Lue46qtCC3RHyGDNEZ/nffW?=
 =?us-ascii?Q?50uHlD50bb+Kk5U6za2FNy6UBbqlcb3h6MSJwLsWNseLPFE2zaWdYSR4YgL2?=
 =?us-ascii?Q?5/dgIK1tzAL2hE8PdHDG0JfNVmGPQATuiIUNfJ/WdRP+/omKt8ActF7dV3yU?=
 =?us-ascii?Q?q+JvPQEwt5PVVgzTqhL+JG7g128PRXSZ9EFO5k+3sStz8M2h49Rj2mXI2u9j?=
 =?us-ascii?Q?vUFKJsvwIe+GJ44J4eXoliTkzZTe7XL3yS0+dRoYg1m2y8XvaC2zXz24pgp7?=
 =?us-ascii?Q?pXADMJ/bU7qmVQrujGsxSuE8KU8nYukF81J21iPv7RR5kINxIiddP4GG1upz?=
 =?us-ascii?Q?J+sIN9stTW3b2a8kg9ZJAAaTeLrF0/OdLG7pIBCsYICyTBfr6FZRlZAbrF9i?=
 =?us-ascii?Q?2I1Pjb0xDZ+PepQUIZAZdHfMoucVamiRi91R2qJthiijP2on1t/ouhl+BC9w?=
 =?us-ascii?Q?5YonnyBNstXb9c3V8wNgjlxmv8mSi+REYzTK38InHGajOWd5JPKyLla+O36f?=
 =?us-ascii?Q?wYdPtF8ANuO83jvTSVIH40urHDzAXcPfvJ7ciWYTPZCUOxy/lUXTHE1LROJ/?=
 =?us-ascii?Q?Dk2z2pUeebkkVzCd7+RCk1jdVd+FSayhAigxx0bFns5AdQMzK7L5rZYx/Pxg?=
 =?us-ascii?Q?R5yYHdo7wLfguEwOUQaoxyGYubamOkiVTActPPIQW/Z/SNF9s8WaElJOfj79?=
 =?us-ascii?Q?RJkovEZOjQjop/WJ37xJ0VLvH833qWMvXmDUQWd7tZB3QuTRWh8Nh38DNzBW?=
 =?us-ascii?Q?kWPUn4AwR0oxcqJ2sh04B9xkZthbx4xhv5UQZm6EqvRA1PC7RQJVV4nDUy8p?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xp2hYu54SKZMKwubGMLYKP5aBhoDPVuuh9lGfHgC2On3KuhwizeC83buKtMbaOQlNG0+NiZj+/KUVizZSPUf8Umhoxc+23oR7ykM49RRXsZh31dyvuTKLHSBkbaiv9BlA3lLd6Zw1bXPEj/SRrDnRszJwNfdF2wHGfmRSrYac07Hw/Fk85n0MwirmL2gZzUwb/Y5/A/2Q/uOsuEet1ke4XlOS2j2knfQH3EvcOiJzOUErg6ObpnRtCurOUcN1mpEfnwKc+qF+r1hatMXJ9tW61Zn0/YRnRUbhcrPp63Hj4RR3LTF5IXDgaK6plVYGUv0acHq7nc9F6mcsT4MIIY0A1x2aCcpiVQ0wOwea5/SEzvnRBD4/p2OsQnLS8Xi7uPS5S4LbP86zyg77RGxnCNeRSyjjKuBm/hdlKmQdBsCk2lz7zBdD2MZnhyIGGNoNsb2jali9qbZ6fACibBeiKiX7FEwldJmicudAWakYh48lkCloUv2UzXbRaNDHDgIhF23rYbO16X/d8zzL+J6jke8V8yPLXWs8640v1NXrNwozFB2ca5eb1rq8nPB4tlAqt4xtrBzklQCW42NYH5KGVLzQOSMVinF8E/abgUsDwvLwa4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ec1a3b-b924-4ec9-4ff8-08de3d2a86a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 05:09:59.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTTz6Mgc0wSCmOraSsh2EF8MJhrExSbzu8Y9mKLePV3t8Fa/gc8II5usg1Nv6klGHAxNDZTm2m0/HU3vV61XnGTc3abiKev3lvAbuki9xSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF61A2638A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=956 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512170039
X-Proofpoint-ORIG-GUID: hbUj7qOntTNRlPhPAOgXHlIirxov564F
X-Proofpoint-GUID: hbUj7qOntTNRlPhPAOgXHlIirxov564F
X-Authority-Analysis: v=2.4 cv=et/SD4pX c=1 sm=1 tr=0 ts=69423b2b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=sSV-fTKZYZwYaJdNStEA:9 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAzOCBTYWx0ZWRfXwhvLqUj6CMOD
 e50Cnov3B0AGhrE1pEWx5O/rao+DQyiVG79o3wpImhxsiMdlI9azm/gnFA2LMLFWx7vJ19yqt1S
 UFLpqwxx+0an1Ply9KUntzi62C9YdAXFo5KTPabqOk/4LDK1Z/sBZBoZXSFYO3IO20V2EuzGeG6
 XCJ9p9SNK18JWbW+y3s8RUYLTwSl3wGBwf+HG2YDnckD8Z+lvDZXLYIDNivo0I8bcRsYvyUIn+Q
 n9CxgjXIfvYENIcTORCi2Jy3GkBxmxp6vSV+TNU5bN4JpLZOGoFBKcyEJ4asQoF+RyGcBQ9JC63
 3M3tSbdY70qdUoYzIsH4wdaZxDRqDlVmcWor+JKtbIQcAgE3a2CHE+dB/aPBpKNdK9Iv/mB9ct6
 7yp3U4CRb9SoZLfy1VJCKle4ixsXRxjbYr7VVys55Q3yqK9bGmo=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c           | 34 +++++++++++++++++++++++++++++++---
 libdtrace/dt_cg.h           |  1 +
 libdtrace/dt_prov_cpc.c     | 17 -----------------
 libdtrace/dt_prov_dtrace.c  |  8 ++------
 libdtrace/dt_prov_profile.c | 23 +----------------------
 libdtrace/dt_prov_syscall.c | 10 ++--------
 6 files changed, 37 insertions(+), 56 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index ec4e3123..b3084ddb 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -454,6 +454,32 @@ dt_cg_tramp_copy_regs(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Clear the content of the 'argv' member of the machine state, from the given
+ * index (idx).
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int idx)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i, argc = ARRAY_SIZE(((dt_mstate_t *)0)->argv);
+
+	if (idx >= argc)
+		return;
+
+	/*
+	 *	memset(&dctx->mst->argv[idx], 0, sizeof(dt_pt_regs);
+	 *				// stdw [%7 + DMST_ARG(idx)], 0
+	 *				// stdw [%7 + DMST_ARG(idx + 1)], 0
+	 *				//     (...)
+	 */
+	for (i = idx; i < argc; i++)
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+}
+
 /*
  * Copy arguments from a dt_pt_regs structure referenced by %r8.
  * If 'called' is nonzero, the registers are laid out as when inside the
@@ -626,6 +652,10 @@ dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb)
 	/* done */
 	emitl(dlp, Ldone,
 	      BPF_NOP());
+
+	/* clear the rest of the arguments */
+	dt_cg_tramp_clear_argv(pcb, 2);
+
 	dt_regset_free_args(drp);
 }
 
@@ -640,15 +670,13 @@ void
 dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	int		i;
 
 	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
 
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_RET));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	dt_cg_tramp_clear_argv(pcb, 2);
 }
 
 /*
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 9493edbb..401ac0e0 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -26,6 +26,7 @@ extern void dt_cg_tramp_prologue_cpu(dt_pcb_t *pcb);
 extern void dt_cg_tramp_prologue(dt_pcb_t *pcb);
 extern void dt_cg_tramp_clear_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_regs(dt_pcb_t *pcb);
+extern void dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int i);
 extern void dt_cg_tramp_copy_args_from_regs(dt_pcb_t *pcb, int called);
 extern void dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb);
diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
index 57b11b13..fd33990f 100644
--- a/libdtrace/dt_prov_cpc.c
+++ b/libdtrace/dt_prov_cpc.c
@@ -393,26 +393,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	int		i;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
 	dt_cg_tramp_prologue_cpu(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue_cpu() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * Use the PC to set arg0 and arg1, then clear the other args.
-	 */
 	dt_cg_tramp_copy_pc_from_regs(pcb);
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
 	dt_cg_tramp_epilogue(pcb);
 
 	return 0;
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e2..453d3e58 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -83,7 +83,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_activity_t	act = DT_ACTIVITY_ACTIVE;
-	uint32_t	i, key = 0;
+	uint32_t	key = 0;
 
 	/*
 	 * The ERROR probe isn't really a trace event that a BPF program is
@@ -174,11 +174,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_update_elem));
 
 	dt_cg_tramp_copy_regs(pcb);
-
-	/* zero the probe args */
-	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
+	dt_cg_tramp_clear_argv(pcb, 0);
 	dt_cg_tramp_epilogue_advance(pcb, act);
 
 	return 0;
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index e1369ca9..cb65ca43 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -216,24 +216,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	int		i;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
 	dt_cg_tramp_prologue_cpu(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue_cpu() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * dctx->mst->argv[0] = kernel PC
-	 * dctx->mst->argv[1] = userspace PC
-	 */
-        dt_cg_tramp_copy_pc_from_regs(pcb);
+	dt_cg_tramp_copy_pc_from_regs(pcb);
 
 	/*
 	 * TODO: For profile-n probes:
@@ -246,12 +231,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * and update expected+=interval.
 	 */
 
-	/*
-	 *     (we clear dctx->mst->argv[2] and on)
-	 */
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
 	dt_cg_tramp_epilogue(pcb);
 
 	return 0;
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 20843c6f..237f2728 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -159,14 +159,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 	}
 
-	/*
-	 * Zero the remaining probe args.
-	 *	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-	 *		dctx->mst->argv[i] = 0;
-	 *				// stdw [%r7 + DMST_ARG(i)], 0
-	 */
-	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	/* Zero the remaining probe args. */
+	dt_cg_tramp_clear_argv(pcb, i);
 
 	/*
 	 * For return probes, store the errno.  That is, examine arg0.
-- 
2.51.0

