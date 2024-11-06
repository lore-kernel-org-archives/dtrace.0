Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702051D14EF
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892612; cv=fail; b=k2+ysV0bVNnJYxDGVHsVWkWqEYrjpt6cmjWoZZLjLzhUwXqEq8apMnGqBZNsdOn3qHSvVMWQB7SC91vNkEeN0dxo5oHktdY4r/q7Apu9uXgbWEki2qtpsYhFb9t13Z6uCnQfQ8BwUiC8tUjAmHTTAaaHp3/rGCq766tGRhkzYpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892612; c=relaxed/simple;
	bh=1W9vgrLUubUZg0kFeTNeSVeG0LGT75s2hUDI0VJuC0g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C3AcpYRUd9mq5wflWyAjJ4gSdFrhOHuL4iBS5hty73OKBi+ibm2tm3FUgqWGKAoRHin/1+0CoZxuZ33irG1++3QTvMHOdHz4LYV/tNCmRJE9Afv5LkOFKiW+lpSuGVD0y/EKHhSaptOGrVanBa7wMPJ48qWl9HV/McSCptT5/5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XvDYxKIl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xJov5bzX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XvDYxKIl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xJov5bzX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69CLJ2018233
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=uJ+gLFVWL6avx3tR12It5HlHTePZDUgRhYIC/u1PgX4=; b=
	XvDYxKIl7sZfJ7HQLQ6ab8lX+lQtJ7ImKzxO7OjX14UibrnIzmcDgayb+UZ9B4+q
	+f6fi0aUzOHXfT2oph1mFUGWjkdm+UL8+Te55oJzQ/4PWp23MkETRcwhJbKT+MRW
	+rtzpJp77DWx17GQwOQmfQyCABQ7YRW8wGflNQTnEO6v746UyI0T/AaBRVRMkPLg
	al+uPvAhUGWyhBxWcmLbxrK6hSPInDi+szsNVYBrcejWSqOr51j/Z4v2uLW4jOpU
	i14aATrhI2Kid150wpGjt4KI/ueYeDjG4fhjcJrgY6Dn0hn+Mapvx/4AxwPLkssZ
	xkGZAnbIs2udGiiBzkfxLQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ncmt7hnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6BKeC1031416
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah855jy-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEuOGzxsMrLF/JdAuCVrcPm9buzhvRj2wPrZF7kMB4FEnc/sM0Q7cUz230Shw0J8XUnpGO0Xyh4mwTL1zR3Qm3MzGZqGDE9QEZEYwPNVmy+IrOi+s1GZ+K46U3ChJ609oaHEVY77OCnq+mxeFdLSQ57RNtuXRaHsER9VgtoUDXyvMd0xYwcABX2VBM/s/WEpAjJz7hFPnGevVowfaaPoQ9orTKTu+/BxOM+nJYOHSmKgkR/q3+dXCLNv0fqEErqrQlovGqLOUmfrkT9UjtpnqdIzO2ccVU/ja5Bz+4c37c01NVQOhHGlfrHjmA9mY3IqRyZ3B76QqoqrZHqJv5I5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ+gLFVWL6avx3tR12It5HlHTePZDUgRhYIC/u1PgX4=;
 b=Ibxhjr60mCeiD1aliSr29TZkzwW5Qd9w5+e4yOq8DPV2TaNoqQ+6owGuZ3OIl9HlFcAUvp5SuPhmUqXfxDSIQUFVw0dV7WVitiCWEm2jzbmB9tNdW4TP/9iSoLuVUwrRfed1J8EQ+a6MCaxrdzyOrQkFZ+AtUTOBIU/BdyWApJQKLew5ldsIY7x/o8uY532hCeuIO4QOutUvquttgmEd+jyOevQua0rlzgu5UnnXP34xp5+ZxxyPGYsknwEzJ/SNocTfkM7LVauUlwiuxGHihjMIzMjnbO35yIH6IPZyvQrVIygyqvGFU44a+IcjEfwQ6H9q3MgbK6MqDVLSN2nEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ+gLFVWL6avx3tR12It5HlHTePZDUgRhYIC/u1PgX4=;
 b=xJov5bzXwi1oLaQ9/nfM2sm6QXeOEHgp53BR8VgIn+i7GhC2Nsbxa1LfZyM9xKYoFv8ujVwD3L16mnSFSdgpZCLijbTy3rU5Nbh8bpDoRlrzekYWb7mNWYf8kCLkgXaqREUefOwMFee1yVYxXa01QGA151//K2Dj6EmF7bG5AcM=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:04 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:30:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v7 3/6] cg: add argument mapping in the trampoline
Date: Wed,  6 Nov 2024 11:29:39 +0000
Message-ID: <20241106112942.264351-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241106112942.264351-1-nick.alcock@oracle.com>
References: <20241106112942.264351-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::8) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fe96dc-66e3-4b3b-7605-08dcfe565bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hXHgc5srdDpcortZmTR0kDt19ChnVzYy3MOGBqltM84NawSqo+1IdZBdkwbF?=
 =?us-ascii?Q?jO240NzZ36mBzBuAv8F8V78SU+rlFOkqYQ8tySRjkN9XLHqvuhE9Gu9hN3Gy?=
 =?us-ascii?Q?ufx04oUC4DYq7KcVVGiKS5SQLJ+JdkL3Cskhr5QGLEWhJMr5EcTzo9A8b3sA?=
 =?us-ascii?Q?vpVhei0tsuxKJ1wXP583T1CudMG5RttVJ6z9JWLuqcv9jLGUvQ3yVe9qtq+p?=
 =?us-ascii?Q?gjMvvvJVlwhg19n4/fWs4WDoiZR5RM7Fu1LU3K8dtGp8yH9JXu7WtvjvtkjQ?=
 =?us-ascii?Q?DX1jSmV5A13wsPaUrJGRq7RAaNaWo+VcxA+e3tNmGs8M/g/o2NJUl2T78sbg?=
 =?us-ascii?Q?sXLVkNPiB5SJE+F9A2tAtQexOdqaQs52yF0xDgi88OnSnxg7LeUtIgs265t6?=
 =?us-ascii?Q?kghNSKTuNycnGuo4lH6TwLrpzw3hiEjPZytuU6FePZxez+cT93ih7xyz7y03?=
 =?us-ascii?Q?DYitU86TcFyuvZG24WvMjpI+gZ+e51djrRsfzJxBBLCSiAJm9QuMfjkA8aZj?=
 =?us-ascii?Q?+4CLYKUZIBLnx37CX6ufdT02EmYmCVIS3vy0Y/X5TBStcePn0Dgm5a1kT9+/?=
 =?us-ascii?Q?VF6ROWEJYvxLtySIEuRk+4MO+jLbtf+MRFtlszH5H4/BYFjlOZLFjHvlof0g?=
 =?us-ascii?Q?eYY8//cMowN84WQPRlJ8w589uk3fqBTcZFmxtWLTUTlAhWV/okte0ekpWioL?=
 =?us-ascii?Q?zjKq1Mde3eteaGz8QPawi8otCtyaBeH1uzdOd0L+q9netcphqF7SAarNF6Tr?=
 =?us-ascii?Q?uYCAkktgkiYB9ihBvAyyi3/P6Zc3X5rc7li2xB+UQyTlKvZ9cp2OBkJ0Abzq?=
 =?us-ascii?Q?KgO/BBopu9asa7+PLi/1mTGnyxGQN7pTreOMAqQux/q4w6BDKO1q2JLA838j?=
 =?us-ascii?Q?RCgOhsT2ToBS5wC5UblLKlTP1Fm5cHRCY+2AktmE5jvtjKYnZPClVD6+qMA0?=
 =?us-ascii?Q?4r0RGeBh7f01zVyUL7aKQgIB2eWtngzv31jdIpZlcsxnSy+/TKtuUbOoibve?=
 =?us-ascii?Q?wMfU9uyJ0Z/jHhFWsqHgtn+BMvj8vQ7DhtQIqD9uWm42TY1quGfK6HU+WDUx?=
 =?us-ascii?Q?9FTxk3PU1VNDPjF0RuccM18MXieDf78IiV58H9M5ZDU6za/ERUujRtVMp4wQ?=
 =?us-ascii?Q?vQ4DHQUCKx8xKum166W/9CGtTS8rCUPdCO2IPuzOItAW/Zjkj052Vg/5uQi4?=
 =?us-ascii?Q?1l1FeKllJmKyGLDITpimPiJqh+wPd5ihGaXdlQ9CRA26pvQAthu8JuKdA9Uu?=
 =?us-ascii?Q?XHyAbgOyzCAHM2J7ViZPEaUv6HB86CnGdnbQtRTBb7Xa3DPBq9/WP3Uk5hpj?=
 =?us-ascii?Q?7VL/KtVPbVOBri/iepjzcpM5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H8vhSuruwiGtVCsB86Lv1Tbp0OTR73GBNpafMbIqJtRyKhzxbW+wNDGIrSep?=
 =?us-ascii?Q?WS6gvuZql0ClAQWY/EvfPkSKA3ul/5asnfWMMGbwZ6D3AoWntoFWkWyLJZd4?=
 =?us-ascii?Q?jOxITX8a/0ZvqxqIhPaJt+x3//2vhGy/61fhbE9lP0y0+Yn4Eqxb1Ki9daeb?=
 =?us-ascii?Q?VTawzLPLlLff6wh1brn7w3tq4IAV0L8f11GxBVB365NZBSGMQtyFXbYroOY2?=
 =?us-ascii?Q?RMqnhO1wWUni+GhY78bG8fzPQy08x5kXuncAQg34Up1Ey21PM6C0b8UwYNTg?=
 =?us-ascii?Q?bJuhDeSvToU5ff55nb80k+O9ORm3cpmGLoa2H/2jQtbVGQFy9IMgvI/QX5xc?=
 =?us-ascii?Q?il0CzhOju7nR1NwPe9LwDBRl9OLNqfheJssG2Epcgsv2eCAoK0DN4mnoO5TE?=
 =?us-ascii?Q?WmUJd4kX6PPQ732tgBsDQzTfN+fWYMhc8eEDIJm2XB/JOhlhmwwQopqLKAkk?=
 =?us-ascii?Q?yrCzMO57rQwPMtmrLKIe0o0Wmaoc+A4fsYq0ynu1on8OvoozlgBGRNRVqQ61?=
 =?us-ascii?Q?/WwFA+V0ndX3PLfXqjeZp3dTKYYWVih2ddczCpcpJY2Ws4AOF7b/c/T+wa37?=
 =?us-ascii?Q?+hHW8rnT3FL0qMQw7VkzVPIM6ArPBcodRDdvFGO1Q5zlv0OUyT4T/V1qQHhQ?=
 =?us-ascii?Q?I9itPjWogLtnk4rKnXNiRnC+n3MQPie3n9Mlu/1yJkYB6NLKJlxDebaFPlP4?=
 =?us-ascii?Q?lBQLRXnReq4626PK+/dGe9YceNpPRM6aUm0xR8UvqZ0Uj1KElr7rp2nsnQuO?=
 =?us-ascii?Q?JbwZlydDUyCf94gJwy5s/2P59M2u9lDXVN81ueuSJYXKYfGXw+1QGbc0sFZw?=
 =?us-ascii?Q?8D41MmErbVQqNz1PNuDpeQS2QLtmkEjPuFR1gDRAAvCqvnJpAkcqbGNXLOvc?=
 =?us-ascii?Q?8TnfaraVmGTgs8T5GaJMIgXWLay6Ep6qa/TQFhlo4M/nHhFs7nlGRd2SV+iN?=
 =?us-ascii?Q?IfeuZZlbm1qHddDf7iCAqdbbybx4eldLdQITuJHH58YNflVmqpeNoWwO01Nl?=
 =?us-ascii?Q?Kmub+SrcKEj0K4oeXXzpxZGrx5aOim83O/DOXR+ZJ/KBUtHjWNe7L8aoxGg0?=
 =?us-ascii?Q?tZeIBLuUhGAh4WZcJ0Ns7FRrFRYCzfF4JMMsi/4ZPVvS9jS8GOCLZd8lZELN?=
 =?us-ascii?Q?N8ee1+2oO/S0LMMx/tslM6hWQ05ZOQ3X+vXQbDfPQbVvjKN+vh/o9bAMiJKh?=
 =?us-ascii?Q?+I5CIsi8GvJctD0CaqkLGjA9970eLr4veShmwrtFF2ynZBLOndo1JolHIa6E?=
 =?us-ascii?Q?ZBTTvvf5gMzDTz3b1oTVPYynTwt149HNDttfv1l9gahjHoCei1PFDBHcnV2C?=
 =?us-ascii?Q?LShYnKO30xeJ/piBlnqR27oliIUWBETXNdoSafcVibvMU1TPoo/SsrNdwVEX?=
 =?us-ascii?Q?r9ZnFioKcqGMwLzmZw9vewUNjdYg1wdIed9advPgYxZ+twvAw9gM2l10AI/M?=
 =?us-ascii?Q?u50MQO2AS7GFZgayLFLnF2//VKSf9VY6DftNTl4dhln069k/yQEcpu6DC85u?=
 =?us-ascii?Q?c1qJBSD4oi84Gf2TsNGaIka3rQSLTiBBsk9Qf9jSqgV6GqH8h4+UzvCE0jFg?=
 =?us-ascii?Q?2R6pMJFTTllf2vAP/rlhjJslSKDV10wrvU2FICsrGoF1u11ZNVpt6DbRf6Dr?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w62+DJPaJEQ5rcfUZX6xmWcTCkhsqhtjfRYYe5m58/ICsVA6YheNVdoroQhaVZe09VE88Aqpvh5XiL6Ahj9FTPazACxV5fikYFhiFfHmKvoE/M3OP22w7fw+AXwo1bK+OdqUL/OG9MSj29FMXzwoUq/NJidHlci8JXyTlS7Zbyk4WbN3yViMK4X9q2inFwQ6hgAM/WUBb9DOVr2NfpZJp5/x3ouxsVRds4Y+guDEZu9zRMt7hfeU3pabJaio2E79lDorci/OGDoXUdU9j16M4yZ8pzQNEpem40ZIqddaKFmiMKjN8K7YW5q69GBjAf/FLWBeFN3SElFlSC7tg5lkWEw6CYWh1Gtt++w9aCaQOslXFwwHxfpkleVn9gL9zarknUf4d8DvPGP55lc1lfjaxywiYPIWZgvaIgqtdzinKR1XjzQ4Gtxc//Ie+cTy/NwyaD4VikEtvm+BkFHo6UtU7A0lwNoh246uD/1XQ5aLQHwJnP6N1ObbGCo5p6ped0vFc9ZB/O24G67TC/IQ6OJ/3+xeZDNBAPa/WEguOn9jnpF2J219lRC7SaYj3fvZblX8ElcEWuVIRSZUpblT9Wui1THWz7ZgRQPWx8v5lvlJspE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fe96dc-66e3-4b3b-7605-08dcfe565bfc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:04.5084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG6EHTdEC7paMuuv7hYb/vleS6lwKH1+iX89rkMLHnLHrzio45bAewlKqvI9rvpSD9ttvl6kMbUtX2PUTZozOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-GUID: S2Lm84yc2hmBPIZ6jYtIUgkQ_JwHytJu
X-Proofpoint-ORIG-GUID: S2Lm84yc2hmBPIZ6jYtIUgkQ_JwHytJu

Before now, argument mapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that arg mapping is also applied to
argN for USDT, even though this is inconsistent with SDT and arguably less
flexible than having argN be the unmapped arguments in all cases.  Add a new
function dt_cg_tramp_map_args(), which can be called from trampolines to
apply mappings (destructively, but it keeps a copy of the old args in the
save area so you can unapply them if you need to).  No existing providers do
any mapping, so this is not yet called, but it's about to be.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 25 +++++++++++++++++++++++++
 libdtrace/dt_cg.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..aa230dcbae36 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,29 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Populate the probe arguments based on the provided dt_argdesc_t array.  The
+ * caller must save the arguments because argument mapping copies values from
+ * the saved arguments to the current arguments.  After this function returns,
+ * the caller should adjust the mapping to reflect that shuffling has been done.
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	for (i = 0; i < nargs; i++) {
+		if (args[i].mapping != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(args[i].mapping)));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5061,6 +5084,8 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
 	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..fb26c125adbc 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

