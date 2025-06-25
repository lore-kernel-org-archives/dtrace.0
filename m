Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4167307490
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825287; cv=fail; b=g3J1+oGA/Ul0kePONs/j3WwJUWwHYA2ATjK2oTGSfF8tmO7ts2E4WmVijZnJoBJtsM6gNr6PImba9R33zxfrgvoT5DVY4HQx2kX3b03CvUUiALFdK7WDYUniz2xQpO6nENT4+PGxVc18Jo8BTfzyiER0JtmRzieLTPJIXWk/AXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825287; c=relaxed/simple;
	bh=JVtPY2cjz0/H+uVdu0UEPJ2EeAjzNLRtbLgcRYh4/yA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bfSiAakdB6+NtLHAISySyH1BY4u337qCgs1KZjJ/+EtCU3oKIgOa9pxw0kgcwVdIvVuWhLv3XV1KWGbAQrP1JhtmaDTUofH9rT1M8RixRDtrcB71qC1AkShit3dSrqcAqUdh92CvFwuF4RzEyfrG7ve6Uo405lQmW2Ar8SVocl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MWUVe6a4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BQ1NF1OG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MWUVe6a4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BQ1NF1OG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMiewk026976
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pvaomvXNaLu06L1taf
	QV75SOnekMPnumXjO500JrgZk=; b=MWUVe6a433r1/S180nDVF0Ll8M8L+JnilQ
	uQLKSuC3AYU3o0BSQX+m+II+1og/9lyYPl229PS4hyVK3nbS4AwpdnBYmLHllZgE
	5AlGfzSxWnvkb+sibOI/M1YtVdvDtC3tYnb4j3/YN0Nd4PYsW5hU18seJZAhfCgv
	QXnk01oiBBpWPj7o7ijpM2VSD5SKwbyIi4fHUY/nGYDHNzyzhBTzw3l90FgbNBpv
	l8i0U4fvA24IiZnkDehGM/XsiakEj09w0idOA67zJA3vGVw1L7BWLxt5UqqpZTjW
	U5gBmRM7swvnfueKNZX0JhpxLwe7iMewiF51BOyFADWYd429SavQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1dbu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P21keH040359
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5h0h2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ihi1mURk/sfxmkfmqEao+Jzo9e+PVSCbwVXWrZdLQkXPULAFw34waOE6m3CSxmAjKr1MlwymHZQZYHwC1aSRJwDjZDU5uD7zSn48zIikIjc9lVdY2Hiepdzg9i2314wHBTJnD7QqpSCWsJOo83vv4JvtZQJIZiZvhpiyKfJAWr3ShY2iWAOLOcV3f9d0oRFYG03sRom7CRykz/8ibT4Q0R4eZbMMkPDdG/ett4Gnz6nBfijRwhCEGUbtZZya2g047/afn4a6OAn4Gvd6J7+z9fnrG5Fsli2K5XJvgk2Qd7Xcbg4an0JHzbWAl0oVBS3lLTiOIca+VSg9ESFkAL4xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvaomvXNaLu06L1tafQV75SOnekMPnumXjO500JrgZk=;
 b=LjcDnvgaUGQHceA9ljCYgObQTqfYaleuO+h9Ovk3/fZ9fHUKXvcjWHTuWxGwuOcPlHER/UqSG/fQcRl9sYVdO/fCuw3q+utEWR3E1uR+KCNaNWk7HmRP/y08BjaCItLNxO0HiQjBOml/fW3FLf1pl6olOEkJ4ulL8nlNRCI8F+GMmaBCq+gbd/zZesdUXZdiB0U/YKB0YqIiJnGihROYpE6PABkSViBy02ehfhDV6P6lMFHU06CsUxA7J3JPBrFBxk2G1YkIrceiUYV3qZz11cKqlAmbUgkC5lax1ud8TYbpNNqJSQLoklSI0ywx0hWNoYvwzhwRx2DgH/c5go8Q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvaomvXNaLu06L1tafQV75SOnekMPnumXjO500JrgZk=;
 b=BQ1NF1OGCYfQlL+5ChtFk6AfHUzERztlCmMusTj5xGlxa1l+LM7z8CP3HysOhWGd7SUnTe6nHlAv1tE85pDd/ElypBLdgbR8haiGe8VrWDCat3VpKHoPeQ0L2/1Tqbm/o/74sO2RpXB+9942XXMNbw8IcBtHPacFFBRV3QN3RK0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:21 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 08/14] test: caller and stackdepth tests for ip provider
Date: Wed, 25 Jun 2025 00:21:01 -0400
Message-Id: <20250625042107.13571-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca1c7af-561f-4330-f961-08ddb39fbd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dOIsjbPBV9o31aA5DBA82+Q3mRJewAV0qCATGzznwkPREixUcoXqNkP+pgkB?=
 =?us-ascii?Q?MIc1TcJfOrTRFs7h69uSf72rkZtOQiwpK2C1yIK5c5W2RAjaTcGE9th/fFnP?=
 =?us-ascii?Q?RHq4S4xfWCckz8utsT3TJJG6X+leI2Izo8rL0ADXtF2oJE2DGEwnuWVNyITs?=
 =?us-ascii?Q?jvonqUwrvRkMY8C6pNtMdxjVtxkqT3Cjbvm1CMC/Qksl57KXmOymesLIYp3m?=
 =?us-ascii?Q?b4ij014CGoOSs0Yp1YgmkE42rKF65FZW+OqJhtOCgoRthcgV4rAv6TtiZrXg?=
 =?us-ascii?Q?WGurQLG8LUWfGNy5ZE99lIPS4Y1ZEPp7MW1PnfsdVM2lMOMozzbQq5s5Ih7Q?=
 =?us-ascii?Q?ChL1wGwL/1iEVh6zQxPbB5KKAovy//OcYWuJmAcbymTHWJyGdW/wqPK1sUXF?=
 =?us-ascii?Q?BYxLTE23wl6sA1f4y9iHEbKP4ONGWypUxJNND8X+5m3IdZl4KoUiLDoGYPcx?=
 =?us-ascii?Q?ngtxbHPqO9cNk8+mgD7mqGiIchlxhYmcxL2Hk6INgHNlt+gn93KD6eyVkZxA?=
 =?us-ascii?Q?6Z7jUCmc537+s2UCw6i/EZkOXcBeF26YCOaEKweqQq8cTuIk5ZrkNytTATEJ?=
 =?us-ascii?Q?Ta+Gl/aPEGQLaTuQvWSNVjpT7ZFlcbwXNPPe43aSm+XzisECQWekTTWuWOh6?=
 =?us-ascii?Q?UBPJ6w271JCwuA3GT3iTm57rzc/CAb50l36IA9JQoc6n/lnpf/TsAD9mqSNH?=
 =?us-ascii?Q?JK0X4q66KN0RLR+Zh7KEwVfpK/Vo69pIKIf5/rQHwcC1+9mIsBBbcvwyll+3?=
 =?us-ascii?Q?To4mVzg4+B5nw4hcZ5Refl2a3vzdYSnHEfM3xgct8pC7OSZT3XM7iRdjPv11?=
 =?us-ascii?Q?N+q/TZXJDOrxwTuHiv0o879+M+6vQG+hnPeRGnHjPrVtZkTv8JqDC2E4kcbA?=
 =?us-ascii?Q?jbL2JPnPNFAS1IXk1AcU7ot23mNXGsbk9VRx+ncLTgMxpJneRCNkib2hA+n6?=
 =?us-ascii?Q?s63fkeF9VTjK3P+s3eF8MC5u6H36NMNBWJPoke5pg6wsTD6q3y7Mva+LToWE?=
 =?us-ascii?Q?wN14E0DyY/WbZvV7OlMF1MZle7JNql3xwnKik+d2MffGU7LA9JJxXk+/5bd0?=
 =?us-ascii?Q?TD3nBPETb4RxO8M2iUksdYChQRwF8Y3tslh2Mi5rJahZ03rmxCciTSvN7MWC?=
 =?us-ascii?Q?aJuGPZKx1Y1VpD2oGgiXDNihtMfMETL94Jv1Yvh8jkgX6CET3JrfXaYezN/p?=
 =?us-ascii?Q?LEmALvLhPFCS5+8vZM906g+MLlhOT7tR2f8M0LBrH5gXT1T8Rp8YnRd7PNml?=
 =?us-ascii?Q?toLKziKsPq2XK252dAolAEluO1r1gYO4QpYh9cp1Ju1Vvowc47Jf1SwoFSwH?=
 =?us-ascii?Q?uj9JnzxmAjv8FecLHOzcDWsqxxsaoUT+uzpE+wJTXm2edKrtK5j6QrsXHesu?=
 =?us-ascii?Q?G8swNOi7EFo/oxc+Bd2Shu/KlAxyqfmcZjh3iOkPcR5NWUpOSvREXfyCHwMJ?=
 =?us-ascii?Q?L96VNetolCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xVsngwh3lhaPDf4bojPkl3QnljlrbB/Mid/xYKvzqFAeEF1lgmAZjL0IKv4c?=
 =?us-ascii?Q?DFyHSfxxQJ9fHwPwnYHyI1zuE+9j8cZ+2N1m815PLAmQyf1XhmDSkb9JqA1C?=
 =?us-ascii?Q?cxAF0xf3TStO+atzGE0pMzqfMhbsM6GUBwCFBP1QisMUUCqDQM1IJfWDCdM6?=
 =?us-ascii?Q?JziZYmeNq9U3WhrJ2qPBM9o9oDmXL05voLerO3uCQNGaKDuq79sEZ7w/khy0?=
 =?us-ascii?Q?kEhX7tEx1DqCJa3nEh/s+vyhIq4KpuRznqXqSavuSmcSH+f8gCsGtxMcdUZO?=
 =?us-ascii?Q?iZ034msyB9LgEGZwI1hZSRAoxtEsGHtK3BLIoG0Ox8Vgv93YWpKQrk6UrgTq?=
 =?us-ascii?Q?JcOcZHRovXjnFRcZUMDD0lRtVyhEITkiRbQGR3FWJMYILP/lTNa5HstjyhIZ?=
 =?us-ascii?Q?bQsaLfbmZnUz3sJCLKsB79W+z2zqjz3bpT2EAa0kUejiV8w0H5vTUikga3Rf?=
 =?us-ascii?Q?1fMGWJMuD97Hiz+oNkQNFegL36gvn4rDk+BBvB0cex0Z9NR7Zd4BFZhExnNN?=
 =?us-ascii?Q?JnvciJMmcXjTjHxdYpc0BmuRLjN7a7fVHy8+FS2lFy4B+y48LpWVtHchLNgM?=
 =?us-ascii?Q?xiXsHU0erhAUF2ZGdDcSlvIZmUKO7zjNyW6GtsnjVahLTXY6Mo1HUUX0/Gdt?=
 =?us-ascii?Q?5wDxKT40GOZtxpK4WCICNoynP1EvLm4yzHrAPf5Gq5eQSfGkCkgVMwolixna?=
 =?us-ascii?Q?A1iVQFMNCXJHppp2Q2WiDqQ0lPCGdMpv0kbF3zP/I4J36IHQww9/XRpy02FW?=
 =?us-ascii?Q?niEc6wkvjdtn9sENQ61u2aDJfmC5id/LiTJoux+askOLx2wj9A4nZ0uvk9IO?=
 =?us-ascii?Q?qBBVq9J6IM5U+sXdarr41ZxZyuFsj4sqWo8D9S9wcxC0SqqqeAi9+XPyc9bg?=
 =?us-ascii?Q?vMBBR7ItBNLus6AKHT6pJ9o+4IvAPU4gN/Wyzt5J4Ix/T6hJVWQFObM8+Dqr?=
 =?us-ascii?Q?YoTaLVuCuSyLw7HkbfLQi8R7sVKh6frXx07KYF+eqAUcmOXSubJZWDLx09g3?=
 =?us-ascii?Q?sUpV/QJwAMM13Uqa/HPkxzkS3QmaMRnRsfeTDtFfl0j5QkXj3KLiPIlrRxWM?=
 =?us-ascii?Q?W3yAeAzZ9juqABvgr4qm1/9eCd2GiDypVHlKJpm2llhIe+JkNhN5PZNpoDL6?=
 =?us-ascii?Q?dHvPpO/Kl8Z7SudqdAxLT+1PoJlb0GQSDiBeD/U1nUDT5q2Sl0PnHUoRpPiV?=
 =?us-ascii?Q?WoqWSPVBsA2jZowqzmxCNyUlzy9/juanm7c7CLLWDW8EAohbGmGg3AH0Ywl+?=
 =?us-ascii?Q?R0QUrLx9qBQK1WQXbg9HqsV9W2nMBpnR+Bg85DO6WkYZjQgwB+MiafxyoMZJ?=
 =?us-ascii?Q?PButVehrxlAaZ6wQ4OOCpCd/v6e8ApRS+cQhioPSGVcjtD4x7A62oPz4D2Ad?=
 =?us-ascii?Q?Y68eUT8O4wjqvNi0qswkIsnTTKa0aRayXvTlEHhP2r4BpymVeoznogTs0be0?=
 =?us-ascii?Q?OJG+ifQ0x9ldr29GyNgnHZ9GZgqQPl7Qcr4imDJ3fgZ8TPHHfPK74RtR38SB?=
 =?us-ascii?Q?nrZ0NKiQlFRJX9OqEV+Wd4/yrZph2DLyMhVFZAb8hoTArYSxH3ulfK891Tc+?=
 =?us-ascii?Q?9XaUQUAVydfmnG2HwK5+BJSXDw7TqKRDTDSPUMLn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m8J1JI/M0DIX411LSXJxuLUlINLafqpeW4Obggk8bfE0OwE3GU7vC8d6qAHKuAN86Lq7KIXDHuh+ebOk1C2xoLa9IA8H0Z+iBKjFGgMe0RNxo/Y3jV5PZSatFg6mdL3uHyYKlMTnDPprmhZo9VjLzmh34lxbTK/AWdzmH5omPLgzEun9aEavSRN2st3YFFvLJ0/2hMxYaG/PavvAUpU0Xx4OoJBCyHt139/8JwKIbp2R1zwlZbkf96xjRsjFgElNoev+1nsDlaYKGSl+Pm6zfFO1Cqi57qU+6zcE2zKKEzeEC9AO/ShqZW94SZzyue53ZdW+JMWd0rxJ3wsnvTLFca/Pik+DGn6wlNw0fpZyfhU9yfqNi9kjOvq8YzrzYDG4iD6Ke8AezzvwrLH0MIlEQTmGGjwVbhVW2jZsMKfaMWpVwywSqCXOKr0LgWEfA0AoGDoHVckmEmgSNu8rk4Qq6YbFRArNUjzJb5FEHW/3gzcQNCRd0Idx63HpWLk3f+PCz39VfKh4kKgK8MX0U5BjH4dY/h1Q/WTEAvG5GNvKHDo41/UgiUZtM534FrHYSew8vDU9fCoi61j5bmOCCzUJyvOQEbpsrnT3KCBztGDD+Uc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca1c7af-561f-4330-f961-08ddb39fbd34
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:21.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oc69QUm8qdMUQ1AyuHY2E8zMxpAvshmol2jd8tOk+EeOE6d+5usuYqFNKoXbv90lcMv1j4YvGu6vCmglwJOsNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250030
X-Proofpoint-GUID: qpYOpA838m7rJqHpBgSAoCsQQJBHQpSX
X-Proofpoint-ORIG-GUID: qpYOpA838m7rJqHpBgSAoCsQQJBHQpSX
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685b7944 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=aO7t9tu8N0B-gyY8JbgA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMCBTYWx0ZWRfX83MVeL8eIBWP SqMD85QMYlTNgp6ySn8gdbErd4XXnviQnGUi/hpGji6+2cvOQsMo8sy1Cc1zdWqudkHAlvlSswF +Ccd+S2bpoii0tEp26tELyiB7x/NA03ERKKeG3OR5UBS3+NNKzkRX0zxtDJUxYI831m0VLPP48l
 2NRZdRcPpHFJ41BguBq3//z2kR2VawZLG8zRcwokY0X5K/XmpHbkaxmeSj8ocHpNy1OPF6jnFRw zxGwgtBe1tSWb7G6FNs2nz5hc3ppE8LZiB5/oUGFN/JJ1oCsjJXyTS3QfYrLmvBCz7yVl/Pd0K9 sccHwz3or6BU6wW3ssUiR/CpF7Qwp83Xwr5bZNkoW+ufb2U1C1qQYlSkfX5NzqYIRJU5e6oxx3/
 iJRzh8mDxcLqN5k6gf4eD29A3lp7jrC1Hzh4/nou/R1GnRKHWMFM+k3cQCvIaJCfExDk8QNN

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/variables/bvar/tst.caller-ip.d  | 22 ++++++++++++++++
 test/unittest/variables/bvar/tst.caller-ip.r  |  1 +
 .../unittest/variables/bvar/tst.caller-ip.r.p |  1 +
 test/unittest/variables/bvar/tst.caller-ip.t  |  6 +++++
 .../variables/bvar/tst.stackdepth-ip.d        | 25 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-ip.r        |  1 +
 .../variables/bvar/tst.stackdepth-ip.r.p      |  1 +
 .../variables/bvar/tst.stackdepth-ip.t        |  6 +++++
 8 files changed, 63 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-ip.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-ip.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-ip.r.p
 create mode 100755 test/unittest/variables/bvar/tst.caller-ip.t
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-ip.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-ip.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-ip.r.p
 create mode 100755 test/unittest/variables/bvar/tst.stackdepth-ip.t

diff --git a/test/unittest/variables/bvar/tst.caller-ip.d b/test/unittest/variables/bvar/tst.caller-ip.d
new file mode 100644
index 000000000..05ca5c671
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+ip:::
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-ip.r b/test/unittest/variables/bvar/tst.caller-ip.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-ip.r.p b/test/unittest/variables/bvar/tst.caller-ip.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-ip.t b/test/unittest/variables/bvar/tst.caller-ip.t
new file mode 100755
index 000000000..1ce076b86
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.t
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+testdir="$(dirname $_test)"
+local=127.0.0.1
+
+$testdir/../../ip/perlping.pl icmp $local
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.d b/test/unittest/variables/bvar/tst.stackdepth-ip.d
new file mode 100644
index 000000000..a35d1e517
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+ip:::
+/stackdepth > 0/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.r b/test/unittest/variables/bvar/tst.stackdepth-ip.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.r.p b/test/unittest/variables/bvar/tst.stackdepth-ip.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.t b/test/unittest/variables/bvar/tst.stackdepth-ip.t
new file mode 100755
index 000000000..1ce076b86
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.t
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+testdir="$(dirname $_test)"
+local=127.0.0.1
+
+$testdir/../../ip/perlping.pl icmp $local
-- 
2.43.5

