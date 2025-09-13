Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E0C2EC571
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757778990; cv=fail; b=aWI5s4t4oPTfYDV4knFlxdNJcBDiCmuNBoJFsOU9Lx1+oOK0fPTO64YDn/BkBTYC9Gd0Q/nib2nMSdNrhQv5MxAbd5oHCwS0Ua1v7fxdPg1pzsj9QvVpfmXAkA5lx+6HQyEgxh0gFtE2IWK6yxrDHrg8RMoOTnTbI5lXyPCfR38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757778990; c=relaxed/simple;
	bh=hKxv1pZja+uUBws0miJAmGaYN7kgtT8F9VhRqlohdAI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kDkmowJ371hnoCaL/N6mEASqPw0UYEjTPBiB6qc2IUaQWDKM07mqidWOLDPah3BC2StCGmghoeOQbgmNZY25sF0L05e8Y0dGmRoVbAGYRTWZHb7Oa0v+g0jHjMjV0qPUHJbLtjCiPhTXlJkecCcDOQjrK7ETpOR9ojoD2cYzzc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T0O+BEE4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LVh/U9LG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T0O+BEE4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LVh/U9LG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58DAG6iZ011852
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=p2PVXr0Kwq5o1NWNCA
	40p+kDbPF0cSv4Hkl6M3Uldqo=; b=T0O+BEE4Qq+GQcvm+VfiwKF48dEacUYuNK
	5HgBgU0uPMx6r5vjfHXX90HxU1LCXSt2xPfEh3BWIOzGZXVtCH49CTMCpNL03WC2
	GH//8wj2zoB6yysYpQcmBhR9F9COKyPzX9WA9UgdgpXCc+3jqUdXOhWiTsLXEgrW
	swi9BZ7VLHj1SH8BfZhMOJ3qxn9aroU19N/AvSFV5Efp0nr0hs/LqC7I4vuWE4pQ
	oBILLVh4PEIKYIWPhqbBsxiZmy+VYA4HMZYac7QUG/rudrwV5qb14V6L4+Crij0B
	nzYcRApN8SqouSrDqyaDDpYOP4918NIrcJyg0pz7788dDq4w1xnQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y72rcv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58DB0kKT037401
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:26 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fvew5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 13 Sep 2025 15:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCNKyXBN0LftcRIrmRxBx/rLQFsPS+Twsor93JzhSJubHLJMa7dXrYqdxPfSYV7n7jXmEMWYjsYGrkPydYWSu8o6okzl1ypHYAEDuaT/ciMl/KAcPVAUwFcOydC3wZDU9BCGZsqc9aixXeiK7Sb8igYY+QtwziC7WCyEiDOYl50di0DtbLedDY4ZmqzJhvTUnFt2CV7YgtOqvPzHztQuhNnM0cYJENKtVLIyXwjkPaWGC0ed9lEdwcGDW5Ja7KiwljffEa0sv6uZmgOZpKQELxuTtxUSXSE+6AIPMHtq0JHt3/BEGkOMGy+LiLJMK1wBAR7/Lk2LZSfAxnwaQyrdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2PVXr0Kwq5o1NWNCA40p+kDbPF0cSv4Hkl6M3Uldqo=;
 b=RbxP9fDQfIjYlUXtNhhnOUp/E9R4quzHBx0j1CtBFOTfK3IB8shRu//Rx8dgMIxTcP6Yve8yr6tLnGIOeg1t85DG5qe33D4PpB7TLLssfem0NZYQckmcTMLqZnQqdf3pzRXIgB+ECSvqj38ikPknX7V85k2vwhmrqtYfaOZa3NvMWdGNGWX77eI2FKTBat6zdilbFIQVkOnQ9xDdXQT4Ky6XQ5vZxM3mUR6zbiqemjbHRuNR9exJMOB8HmCUW6KknozOv1/JuAgpLXf2ka1He0oQND0u076Kf2ArPw7ZUGpMBm8eghmyrjnarkIGLDBv46mhKdJiKP0r79cOgcHtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2PVXr0Kwq5o1NWNCA40p+kDbPF0cSv4Hkl6M3Uldqo=;
 b=LVh/U9LGzHX3ul/n6Nd8dacuhNXR/0rG7zXCu/QpO4jbNdCH3xlmwyIu221DagEXYZV8JLD8ihCzOua22M9sjq1Fbmg6UOKFln2Sn1TxpyUYQnPpD8stEtCBZjW82bO/+SGzXuVQftYdfvyBDhcgYnw8/9qtbBlEA0jhZ3UHJEY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPFA7D84DD83.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 15:56:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 15:56:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] Defer stripping out "__data_loc" until we know that is useful
Date: Sat, 13 Sep 2025 11:56:18 -0400
Message-Id: <20250913155619.22299-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250913155619.22299-1-eugene.loh@oracle.com>
References: <20250913155619.22299-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:510:323::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPFA7D84DD83:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c5aa6a-85ba-4d24-7b7c-08ddf2de16ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zQBWBTIzIJw53oD+4CQYx85Z2UcgLCJbODIiuzutR1ws0fKDUHH8UZBIT2/D?=
 =?us-ascii?Q?fZz7MtbUWRu+pe0SV0s9j6czmqfWzEu25D/YTJG5PHAG/pIuNxC8qfDYrnTX?=
 =?us-ascii?Q?G0ZFagwc4efgvQgT+YjknxFxDn8dIR2pI7tpXnnPBP+PZJqvtIPViSbhxEYC?=
 =?us-ascii?Q?Y2vwlWclxmFaTxlzWyNeRRG9FYaprBW8xxIWxQBBbnYQRy+GvtiAo7/qu2On?=
 =?us-ascii?Q?WaM6f1Ir84VEBAjWbNV4AFcpC97XTftSxu7bpY3ZZDK7lIYMsVrr3yvuhbSk?=
 =?us-ascii?Q?y29PgFeJ89JY0N4SbEYJoNUIq33Ajy/mTU7WFLKgbVixdze+v98iOj2e5Wii?=
 =?us-ascii?Q?gHvwMxypU1xjOsWdwvujXL74LGs9HHJu9L3rZ9WTuR1Ha1RGPOT++M9IALMu?=
 =?us-ascii?Q?6aS/209zuy0E/WZGNLiAVa1wfs3tqnSBY2gWRXQAcf57UtXf3NXaY9a0NvQF?=
 =?us-ascii?Q?fHqXim4p48b1jKG6rDbJtFclscHruTk3owoGexxG0oL8GTeJVatg+LCFcLtT?=
 =?us-ascii?Q?0h5GT8I/McYp/XNXImn3higE8OHknc2AG9GTzr3JuBPFfO4jw1hUm+6WNMen?=
 =?us-ascii?Q?QxeCI+SjNfkyM+aI+o4jwXkd523EHCr805T9brYBNMgiIQrxCBvs5RwbRoXN?=
 =?us-ascii?Q?syLVMZAmdCUOCz2s0mx1RG6kou3qHyBjmQA4zy034OnHumvzS8i8C9FdYq1c?=
 =?us-ascii?Q?X9oCjB8zMntiHoTTJeUj4VSv9R7Col6Bv68EVLm8tjdVmIOkOQ3H+q0hCzJd?=
 =?us-ascii?Q?fIIddCwnC3PwJbLDOLiip83ueyxiqB2UDd3Hv8cuvH3M2EQxFBy5DLqpx7Q5?=
 =?us-ascii?Q?IPxWg57QP84G9MmbEkkUmEvRFbVGmKghUE042MG8+Dj9wMw4hUaNgJP2X4e3?=
 =?us-ascii?Q?HnJ7H9bH0/PAMTnEfNQifMAoUam+jJCTWCIxSiqf6FGHmhwXZFQA8uycpI6T?=
 =?us-ascii?Q?4lssHls+ksGB9FGNw4/Vc3BCSzfi9ph8yCTJm2WochEDij6eNvluOfdW4E4Y?=
 =?us-ascii?Q?GRsp5HVfqKoY4nuCdwD6wNBt+rOLeE7p9xe0DgNxVLQ1c/40vo/ezbfbkunO?=
 =?us-ascii?Q?AARrR6F8E6DaGdjAKY+ObDKlzuYO8124TgJyiQRTG4cduvmpsjiE3F6ssGCB?=
 =?us-ascii?Q?XW9OGvcaoR00siwnzsysD4NjAXiu58WLQ/0wLuqOfv/YIitR2MJFOJpHqdqc?=
 =?us-ascii?Q?xOf6dZ+zlEnJvZN6A4M2ID7u+NEUsupU+5BB9ia7aMkVdhGrrSrp+JfAfCAx?=
 =?us-ascii?Q?0b6A32k5RYpuiwzKobRk/qZIEvXLgAJjS0HCmIZPFJ2OPFRU9gUAHNKpw/fn?=
 =?us-ascii?Q?mIrz7VhIhHkpckc7uIpcXn0TDWJ81yK2bzR4vIxoB8YBikV/NOyp3HkcwQah?=
 =?us-ascii?Q?MWxrbpqE2X0F2Yo3SxAiGS8Aiwtl0MWrkiWVMnx4GeVsiALWi8o84eF9bqEe?=
 =?us-ascii?Q?B7TqVyRueng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MM8ckBPdJT85Ak3QvWLFZU23747Ih+xcQurzK1PfIMNQ5A7dZv4eHFpSQH+X?=
 =?us-ascii?Q?08bT9cZPD+kl+9n0dUhJbSJxHsg+tJjVfmWBc0W0LJirAv0moCjp4o3lCEY6?=
 =?us-ascii?Q?s+xl3Jq53Xjn6kf3bAeMrZxJlA9zpr9ujbjk/e/2T4wY/2p21qBxYVUVT7ut?=
 =?us-ascii?Q?rTrrh4JsOnqoVX/SmduCh40Qlj072Yd+9hvwMi5pjzvpXEBcgLv0/6DWznrV?=
 =?us-ascii?Q?WjDlWkjL3BZn2eXn6hOUv+nsmYej5Dw5zea/0Llu11WGPnsVsK8wRRPk7L3L?=
 =?us-ascii?Q?g/5D4aZfAv8GwfOLv0ECYTHMmPm0EdnaX7VLKiDs8dRR0izCMC9E06iCnj9b?=
 =?us-ascii?Q?yMVRJLO0pys9CWEvFwfDIDrRf9fVIO+HRvk5Wxxm8avyy0PNlq8Ac0ORvRTz?=
 =?us-ascii?Q?xDJDv73ssZ4ZR7uulPYcaP/zJ7HgYzm3iBBv7yQ1nWGENmvRK9uKK/CCNa/u?=
 =?us-ascii?Q?oYwSW8WMlEx/oALFhPE/yOd/Ukwb0TKJ5sDgz/fRjAnsDG0id5bJ8HXkU0v0?=
 =?us-ascii?Q?rPflSl8BfC2qUDuLU+hnw64oEoSyYIhgtpVTTcubfq2tgc0J/lZxnoBxsrDs?=
 =?us-ascii?Q?J4gspgr3pjjO7esNkHse1DssPvB7DfhdRSfhpFO4U/vnVwKEA1INyu75LTza?=
 =?us-ascii?Q?LWk5r7CTEjOT+0uAJhWQgZbd4xDDplgapnmEaC0UJX3Wj11Wa7ZjaY/hXjGr?=
 =?us-ascii?Q?mBwrVrPEMupaKJ0jirnN/92QvKUvebcUlY0+0x+5Mg1w/m5mhj539OFOMH+2?=
 =?us-ascii?Q?QVOwP08BTNjxR1VEAV4eBB1b3i1UnwoVc5g7hGQfW00uJce7ut3h5LZrVHtf?=
 =?us-ascii?Q?ykiGOAaVMygtEzOWt7UNOdcd3GJj+7BeblTKaGf1NZeNJfzEMNPNWUjzHuOz?=
 =?us-ascii?Q?rKZE1aa1p1dPty/MVw3SEpyix5VGRIm5Nn1DgWnUlDfM0DoyBi3Ts8PqtNrW?=
 =?us-ascii?Q?JSjhxfRSVdD4RfKYTBLBhUYFNE0Cjhy3R6cqJfqAIUrYI3qzuNk/6s2sqidw?=
 =?us-ascii?Q?rk7G70sPXzTybEnTDbssmALTJIAmps24BH2kTul74GTmM3efPqhkY52Z5Zx8?=
 =?us-ascii?Q?BdGlTV4b8u8Hm2tk6v7GcReL71v7RAObhsLaqmlMcW+VYf9a4yJ+sDHVokIW?=
 =?us-ascii?Q?PY7vKbke/R6VRoL0jpotrIrdKqckvKYiQdnCPjViFLZ+UkL0ApRK2TJmLRWY?=
 =?us-ascii?Q?siB4ZBwNwbYg6Yx4nNtRIEF/JimM+czEVXG4KNompChnuzcwW1Zx3UoyR25d?=
 =?us-ascii?Q?cngvmc3LTm67FNYKi04lZVuy0nZO3GI+qwMT+u6WT1iE5+Kc2Klb3Z4Yua7U?=
 =?us-ascii?Q?Ocuoo/ffFkV0d5ilGaNcnYYeUtd9yKRDXZbkEeP/9rrCMlapCq/1uJ3gmk8A?=
 =?us-ascii?Q?t2inIVews2sDKUuj5SVHhZInmQCSerOoA/LnNPa7l4kezZrqUcGa9JAvQGQk?=
 =?us-ascii?Q?mfZuxPfrGJWt1mfPUnNnuyMCn7orDpESPqa0ztnmVUnoehJU34tRtzQA5aUO?=
 =?us-ascii?Q?e3zQT9si9cTu+PkAkIwaqS/2nBYg/U5G7lcxNXV9ynJK+zIyrZkmrX6H0ok8?=
 =?us-ascii?Q?T4kVWjsufYEX/pl1FN58ham4nYqvsI1geK2dU9qh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5DTWCiOz7AI+W4x75zRN72z5bQ6EaqEe8MjL2F2ZSHpd+neqtNowOrAqqv4sx3QmFMfC9rclVXBFHL/0T/5q+awyS2aivrElA/YxOmFSDDsnx057F6KrB1zC+tdEkW4c/eIC+LfgzYN8qbSXf7h1p2vgAAmiaN9jOQBiDlbVxy5cdKlZdgFvfMt7onyqFvA/Pj+Z2cwW4zb3msliQK+D0JlBbSlbUIog4ku0lzSY7olr4FComjbjy4ZA7oToSFy/AL4CoWqeTEq0AhCAvoL0Gl7Ytk8DNthVvUP115gdS+KqF86eYlBYh3oxNKU24uVfsG71FX5r/isZksAVqij7dtfna8EGLOGD3XjxF2e1tnq+lFSGAZ4WnvjzATqMLy2MGNI/peJV4ykmCHSIVZ6XalC+OwD19mFqG+zuy0dqw9kiv+1mO6ZcAikVgjtIRI6yZm0rwmGkkVyFHmXpqk9kpOjUE1W0u5A+DZXqJ1UPYizbzWf5xDTxseQ7Y0xM56yWLFMI576IhytGuxDOmcFMZCOcPTHSwYrx1jIXcjcsKM4+FuptzTxrf53nw894a6IHIRo6hk/zJmui/+JhG0bmABSEhilUVaP6Pb6dN1lRi2s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c5aa6a-85ba-4d24-7b7c-08ddf2de16ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 15:56:23.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d64ZB35aeQBEyGgEyjKdC/BZYdA7zVgWWUMbxo8bJX6TEjucy5z6Vc19krEO+sEHeUzCG3hR/wjDr6q/Rpm/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA7D84DD83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509130152
X-Authority-Analysis: v=2.4 cv=F9lXdrhN c=1 sm=1 tr=0 ts=68c5942b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=c-qzHqtHtD59BblUTqoA:9 cc=ntf
 awl=host:12083
X-Proofpoint-ORIG-GUID: kjk9UxoEqTN2RrEaJ9W4b8sd_T-FzVBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMyBTYWx0ZWRfXwMT1dxvWJQVU
 hGJZE9s8AF8olm/hAssB81k5qjNLpvKJmlaoUoN0qVvc79KYilyT+P+Md3FSHT0+1X7Q05XyUKC
 PAyr1qYHC4HoprhR6keA1yWr90E17FH/QRje8PIZnEKS0gx/JA+ROwCg6zvldGRck/6POQZCdW1
 5nLDtLJiNLWC721QrT864fSilgcoE6K1CBAvP1Uc52k5AscyJX7c0U8g230yrtFvlNTmLbCohTM
 dSvIk0MrDt9RnuBZyEnbyVY7i1xFoN6e2D4r9tnt4i73/LUF0E31oUPqarhkKIMW3z6NvoIYgAv
 JtkIVBkKsizXrK77d7QF7V9C/4TIKdtU9GEN792EmQ5tm2XDS9potQxSpJOqYV4IQ1Lo4CPhJ2x
 kH+rYjf/HWRwscO/BeYb6cUuNNzlZg==
X-Proofpoint-GUID: kjk9UxoEqTN2RrEaJ9W4b8sd_T-FzVBp

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider_tp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 33821f2c7..a6f978e3f 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -208,12 +208,13 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 		p = buf;
 		if (sscanf(buf, " field:%[^;]", p) <= 0)
 			continue;
-		sscanf(p, "__data_loc %[^;]", p);
 
 		/* We found a field: description - see if we should skip it. */
 		if (argc < 0)
 			goto skip;
 
+		sscanf(p, "__data_loc %[^;]", p);
+
 		/*
 		 * If the last character is not ']', the last token must be the
 		 * identifier name.  Get rid of it.
-- 
2.47.3

