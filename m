Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8F33F8DF
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760728978; cv=fail; b=aw8YzssMsAr8qDKbFCDbzCvLqM5Kf6mkFRre/OKH7DY/c2095SyrXGNWyT5EWivNy8mv+gCFwmmxK1V/+ktwfJ2eEGPW3df6G98qemzkAM1xFQDGZx6LJJft7DSfc44Iqxnce3Gqe5j+6DcdDsO4Ur7GCWDujo5TvQbuCDYBAJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760728978; c=relaxed/simple;
	bh=GPtMlnKYKGRsqquy21RkqjGNvZKXPj51Z3UTZSieBO8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kLyDKuW4Qwkf4kSZxz+MQ6H92QoKG3C12hBusFSiPakvxofh4gbXOqrc3Nl/XBURztpas18xnbNsZtAdAiYYVb45N6zecd5zNOZxFS+hiFSiJZNevXAYhGDaoP83tUsUiJ5zQzzRyVOKJPMF5Xqe+JXXuubXayHBherjcil+aiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Oji/RA11; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mbN1pE1r; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Oji/RA11";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mbN1pE1r"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCe1L2006862
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=vgPNaGtnAq9VGjrN+RzOHTt0cP6+nDhbdy5YTup9mdQ=; b=
	Oji/RA11S6MbZ7X1Otwd0XPnavl+Hrp/XqnH/ccLlJdinzEVro9qmJjGy1fgWI9F
	FEEs4oC9zn5o+njaQCNFNYwxO/CVyCjV6Godht9gVa+DGPfGBAUuCMD988x0Jjcf
	pwwwS23oiWwZSlnoGixWGUkOoKRoaw7q+VxkJeUBVr/UJ6t9Rr6RbbDFVbA/1ttD
	r2zrCJiojj8JFx3E7xA6Q5DL1U7tPePTmh5zEaB/073Qoszp0OBkcMTCi09aqNp2
	DrvRKllD24JtRMG4k1Qm1csXhUSG44b2XIf5NMiTzqbLBbl2j8BtjnRewS1Pw3u1
	Ga0FaY3h+BpYkBcQgypSZQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdtyum8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:22:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIC3Tp000647
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:22:53 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpdfugh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgVXKG7wFpjXU29rDZN2VwWbMKoD3NlBBlfrvFX3f45eUs9dKj85FnrNj3fGUAsI7HVRaFuPB0yUeMPIswHNH6ZfC33eAvMVYrTSElC1L9pL/BcpuNxNryK/SJnJYSEgJfpugm5BW4HaN4l6wPodEfOnxWK+JC+kHqWKUuOEWGXjKW3PziyL6mRWgc/yXnDQBPEtWOxkn4XVDZdEdlVSkn0R911gT3YSSQ8jS3ZeWMeFbiirOSrnejbFNwdUbqTjtW7wX2/P94tnuwnB6N3x9zEqo2aIY/M0ymf9VTA4w85lN9/KJgLZK/notcClqELoGVGguKqDtQi28zGI2VS10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgPNaGtnAq9VGjrN+RzOHTt0cP6+nDhbdy5YTup9mdQ=;
 b=Dun3R/s97YgGsVL1qE5/qs3CSmeuWFfkcMgZ0OKFIKJf+LY/RVrmf8cQNRlBm7UMN0Eo01TQUga/hJmhaC8IPl5O6PYNtzS/vIjmH4+6nHcNwlvK4gzjtqJAbydElhN1sVfejScYaaU+2fw3MwSzVEYdGRXql6z79+AoT9hwyoPB6YsN/aoeP4H+J6CKORgFzZaPcym1X1AJtlQeuOgluKgrsmk4O+z3oW5i+F8GhIY6aupSQw0iHuDhx/i8vlyJaQWyM/PsKp+qOXFdrxIzG23452cXrRPqFIC0VG7egwG4bFNwNUwP/Id4ojkp/CxI+R0ARGfjiyxW8VRAYTeVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgPNaGtnAq9VGjrN+RzOHTt0cP6+nDhbdy5YTup9mdQ=;
 b=mbN1pE1rK0AtMuGCiUJEf/Y4U6jP/ElKC6lj9qGTo7NL0GJoXjg6NQA7dF4eR+6thtNpMEJQFvwQGgzJNwNqKNWTxatjAVPis6q1bNxeUcURsCzPO/wKta6HzEtgjHcz1sYvawZKb/w6OiJrFVyiKUshX53nDi3LHUg9nTJ11OQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6162.namprd10.prod.outlook.com (2603:10b6:208:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 19:22:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 19:22:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] examples: add a new set of scripts
Date: Fri, 17 Oct 2025 15:22:44 -0400
Message-Id: <20251017192244.19164-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 928be621-9a76-42b2-d096-08de0db28da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NYLsVktsG6H/uEuMtJIcpEz7BDWSfFhdLgGqQVRn7lbx0hE6TaZ7K3VK3w0J?=
 =?us-ascii?Q?CVa13EXcbns9NY3+cG5Tj/z+LRj6e5dSaBlh/TJMcGZvIaKK4F7QNxy0NL+h?=
 =?us-ascii?Q?8qyN1Og4XCURyYPfREbDQXFoo7cDY91fGiCn009PuHENWdyG8CHazuKpyriz?=
 =?us-ascii?Q?1Qg8gFBznNKtJHJOPr8DZM9D14pPoseyydoX1MIrBoVse/G4HTeUamH7CYjV?=
 =?us-ascii?Q?swNpk+Tok73Rs8sNsVfUj9R7MdkqJpy54ieb7nV8kHqyMCrLMLBzrLlVo+C8?=
 =?us-ascii?Q?m6cFaCAOpNIMhBuGU1ff/QXNaSK+iUj9lgv+joUWRfVFpkeWp3ri8QmiW11S?=
 =?us-ascii?Q?7kVG8esvoJQgjr5v+frvvxe5+PbyaKCUIMf3wDmdnbH6hyhLNLKevRseE1Pf?=
 =?us-ascii?Q?trQ/IqhKYVQ+7rg1Dsk2s2rdBO0l3wXgcKwL9+RKmbbgWhR7h3/zWjHnMxhb?=
 =?us-ascii?Q?OVTSytU3A3IGYEVdtgCSQg7qdQtJdyrUxjqR8XyC7vtONhX0j/LVaesep/zu?=
 =?us-ascii?Q?O0mcc93WhtXrrfduHAgNg00lM1mEpTn3b/0oQS6c7x1wxkg2l9vp5v+vqHN0?=
 =?us-ascii?Q?4FaXo7maofnKqMmxaZDrnngsZXNNX7kNDPaWW8/82IE1TIx+7jx0X3/pAXhP?=
 =?us-ascii?Q?ZSj1hNUZDT0Gp+pOwBltCAi82kJz5g/YvLnC0LIW56qTV51gAehbeTmOniPK?=
 =?us-ascii?Q?i5j4+b73VBkD5mT+P1DnTkb4boNZ0sVRCcKCxdvtf2j9gEckWxl9uoO1Ct+W?=
 =?us-ascii?Q?bibZ5m3St2DOvG9ZSJHxfu2dzROXfQXuIedTzti75tyWNhzVaT9BcdJKC9Cz?=
 =?us-ascii?Q?+QeEr/JCuus01D/T60r2Zw1bgrZLIerhKeeTXP1t9qbmxlcGyVYkz2AJw+dy?=
 =?us-ascii?Q?xfAQZeA1RC1CKGZ5lH7iYvXDOqw382WB0KEITCKUoibeVa8NzVsT+hBycFKf?=
 =?us-ascii?Q?6Cwh2gr5WKqVysqMJl8Tf4qN6gJuwbPgSBA6iAmCyQnzQi3ymNji92996bnI?=
 =?us-ascii?Q?yHYcLr53UhWoH9vtBYvmz0yTxQ356frP5BQg4Fimjw8CqSbBOoln6vGDshg/?=
 =?us-ascii?Q?hmb/JP3/oK6JuvpOBzl8K8mpH17rALD94fx6tBS8RdRpTIMovGtovAP+igMK?=
 =?us-ascii?Q?95Dn7t7hICy/pbaOennwpgiiAAgIGrlBNq6l/4wuKJLSAxRMJDs51DBlf/9H?=
 =?us-ascii?Q?VkcoXuVunnTZ0nB/fI8rN9RvcStMRV1UXAFZwnGoJP5d4p7oFZiw4sDx9nuG?=
 =?us-ascii?Q?HOrY5R2kspQadSoEKrEmsruGHkuBTuUfJwEIo3aoLDpKsuDkAhs9r33s10tu?=
 =?us-ascii?Q?V1ox9G0h6Q4jUbe4edz8m0Jl2SdNYLAgAxoXOY0Gh42daXs6y2MBwff8Hacp?=
 =?us-ascii?Q?CLsW7oFuifa5b2IL+I3oo9z5QgRv47Wtti3WLgHFTjkRvBEle+3ULbeeOarg?=
 =?us-ascii?Q?5uLyeu+coqndBp22kVihJ/kDh/lLmMZVmvygCvVOKrfvI8/jhWXrjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UzG6PkiZUZ4FkwY+29HRTdr5RlasKh67zsHqgUeNr9jq+lBta418SZoqE1By?=
 =?us-ascii?Q?QtR+c7J8PEJeXE6WgT2/TaJ+4oOWWtLx55kZ3+lnlPNkefgubayo5wYZhIZT?=
 =?us-ascii?Q?XgeImtnRdh9KmSQ2sKHnz4w54pV3RRZm2J32Lc+6Oe9NcIZAznVbPAE9f90M?=
 =?us-ascii?Q?+SY/Q3pDPJxtJtQVwMdvbtouqoNH9SG40lQLgJBd4tk7l9ALYkIatvWXAdOy?=
 =?us-ascii?Q?5m7/C2Y1oZXVZPnVPQx9lTo6RGuN1ZLoPn1fWsSQ18YL43DWy1dGdlRMKba4?=
 =?us-ascii?Q?LBQrvm3GscZqDXsluHpmV/OEnUDvjfl5js2TJiQHllJ9CyfQWLosKN3Gd298?=
 =?us-ascii?Q?LdEQ8xg+MaRx2wbAQd3V39TUMf8+thQ06+fCDYSqnCULdJjhOizjBlbX+7iw?=
 =?us-ascii?Q?kRM50BtQ1c2+kvopzSCU+36kgdD7NZMe/9EcRc5crvAmGifBHdzc+2k9Enqq?=
 =?us-ascii?Q?0+E21Ho92ducWJvL4B8KQL+pnzzIiXkas4ndjHtCJRbPDBH45nIMIeWJ5avn?=
 =?us-ascii?Q?HPrCOYQeqt1nKYUsIBPLKCGvYPRuLQAKUAFByhjxQYWYyEI+EHVAVtM1p9to?=
 =?us-ascii?Q?VGwlxVuPHVlcCjchOoQbfKpogtqmF1i7AMpk6gVhuGUMF1S7kSjXvg9tXw3E?=
 =?us-ascii?Q?Lutjrtnw6kSduAWjy9aPIuIWhzYzmJpg4GkWktMfBmmyLeAkYkwqlY7ByXiU?=
 =?us-ascii?Q?UeOI2Uc6mn+utHMjiAYWTydbD92krqpKBFZCmRINt6MGO7cAiIzdTP1Qld5l?=
 =?us-ascii?Q?JqQ5dUJg7h7QrsLdvlYDeg1capquz66dJCG5+RnJfeU0CeAb5AVrbjQmy0pI?=
 =?us-ascii?Q?4NprTp+mpZsqJp2V5qxYBbSdMJgQY4HTkkEZfDBjVe+9z5bMzbZIF/yum8f5?=
 =?us-ascii?Q?CmsD8sUE6T4TNbvJ8qslA+EHN5AF7WuLfjSejTvjSZS8p8mTKjlgaP1CBkRF?=
 =?us-ascii?Q?xMnVpEXI4TPHez0boqn2DWu+dmPkqyc2WXicXxNk16+qGQSRJOuef1cjaOSy?=
 =?us-ascii?Q?GQl/JU24Dj/0Rz4QViLgDc8AIuENQefMTmWZG2OX9ksPDQiXkR1XKf+k3FwA?=
 =?us-ascii?Q?TxHyeDtAZRyOkN4gcLyXFAKcFXgIWmWAgCWH4ssNLSxuc1spkXlSC0pEPlcs?=
 =?us-ascii?Q?vwGeyZPfkL3GTBPCIRsw84deXJ0R1vWbWIXMONt4fsXLxAjsFw9nchjUxYuz?=
 =?us-ascii?Q?rqvJn6amjBPyFEydXr2qpfJ21rOMm5wBGxXYUDFffMwuax+O9+gnkYrqDD9J?=
 =?us-ascii?Q?6cf64GlmfTvhnWxeae2HMd3cXB4aUyDZ9Jee8V3DOfNbMvamZ5dJN8DmbHos?=
 =?us-ascii?Q?GlG+blOyW//B/ax+KLBn0fpgdK4bE9K9UZyF9LEz9OkhwQjhenX5AuCdplTd?=
 =?us-ascii?Q?838z03qSgJVsOSYZS9odsJT9K+djvNo5MLhsUKxSBNN8QkQSTITua2ZuEIQm?=
 =?us-ascii?Q?TzmhJH9AGCooupXv7bo3zhwY3qMdnqd81C3mOFrV7ID+C2UfSA4CPPQusId2?=
 =?us-ascii?Q?qDTxJBMolQCTznUknK/eB7SzVsg93qdY1+So4Q36LPejxPGZ0ZAX/Se6thvN?=
 =?us-ascii?Q?crkoBh+GEwf5cP5NB4qGia9vFHQCMgYByHqrjYmD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fjnw9xqCfmg1dU5OBn0XtWHHilys5SxUAoh7QqQthC7BoQWu0077XTBEZU2dk1MIF4PeOgbNkjBK1AburOE9/B4WFGg8xXV+XDCyKuJrYvvfVZWWsVGBolduf0k36yr7BDh+F56JXrxgH4OxbNGnEfGLoBcGA5vfgKi0S361bwMkPI81mko/6r1qibaf81FRR191lZIo6+VMuKX6pRcfAXLzx0fKPwHEWlSHi1Boe1f8g3So7XdE93VqxNQdaHNIOvnbH0+K1/TKWUCMzC5mMOUTqKlq//sZ0FWl3ycPF5afjibL/Spqw0h7xYItdpyem8IhIiXjJv9NKmUiNSnTWextJHkfkEFck3APxSm8mybbi6WhHDmMLluJcV5D6fZTk4A25fsvoIxEhdDKzjt0/gPKXkVn2VZ7SJL9R2TzQRbL6hGkEyA9beKigf67aLctheYbplbhc2TIZg81tUXRab/A57qAWZbCTo4XD3wGMaGITZ2z3UZe24QgwVpqeRkT2IIsVV3w2lCIJQTd2HMSEpc+nDbJhqpVScBm+WmLP7SSPezFd4uvQTO1vBVmie9eTHP0S4TIIDgDc4cTniV0xGMUCteQ10/dVdzMI0pBuCs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928be621-9a76-42b2-d096-08de0db28da6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 19:22:46.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PYTAFDVmCRZ1Jc9+vdiXHZLMwHOxUg/+7pAoIsCuk0GQHnQUHCzNdsPIHp1OnboxNC0LM2loyqOzx4ibmVjcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510170147
X-Proofpoint-GUID: HfWSY1pY0_b63Og2dzeldz2o5VsBEQ_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNyBTYWx0ZWRfX1KfUxhktfRax
 iJVsBX3aALJ/jOVvz9YMslw1WsgPDsH9BtgyuCx3065ozkBoaxbZRJnd66nIswyqGEcfZIpio0M
 YAwK3pDkQjityNDD0/pHHGZ+TQ0n5jjNeU+aJ0HqobmwGUJqKhrwsPuUjwHY/VsAewBqkyyVIk/
 Az0GW0ILqupo9bAF8VqmSU2UCDY8oEUedJEUZruqfXsQPZQMrM9Osv9irr8N0UV+eUY8OjmGjtJ
 8/nt/Zu4JObHl7M6nJC09/qrdXODzAbVfTmjblg0mxVB9rlQvasXCbhQahWr9qW/jkR7T6Ccr2D
 bQHrN7oRqrnaNEKCwxGzva5Yqs2SURr1/rMK00MDb53PoecrhibCGMHwlIEuyv9XftpA9P+B9PN
 Niye2I19yWOm4cLcKfn071+MuIWyZA==
X-Authority-Analysis: v=2.4 cv=OolCCi/t c=1 sm=1 tr=0 ts=68f2978d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ofqNeUqEMcq7wtDQGP0A:9 a=70h3ZcGAWjq4Kfsu:21
X-Proofpoint-ORIG-GUID: HfWSY1pY0_b63Og2dzeldz2o5VsBEQ_P

From: Eugene Loh <eugene.loh@oracle.com>

This is a set of new example scripts.  These are basic programs to
demonstrate specific functionality.  For example to get an overview
of system calls executed, processes running, I/O statistics, etc.
There is also an example of a D script embedded in a shell script.

Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
---
 examples/getting-started/activity.d      | 129 ++++++++++++++++++++
 examples/getting-started/activity1.d     | 144 ++++++++++++++++++++++
 examples/getting-started/calltrace.d     |  95 +++++++++++++++
 examples/getting-started/countcalls.d    |  45 +++++++
 examples/getting-started/countprogs.d    |  44 +++++++
 examples/getting-started/countsyscalls.d |  38 ++++++
 examples/getting-started/cswpercpu.d     |  88 ++++++++++++++
 examples/getting-started/daterun.d       |  42 +++++++
 examples/getting-started/diskact.d       | 106 +++++++++++++++++
 examples/getting-started/errno.d         |  56 +++++++++
 examples/getting-started/errno1.d        | 145 +++++++++++++++++++++++
 examples/getting-started/execcalls.d     |  51 ++++++++
 examples/getting-started/fsact.sh        | 114 ++++++++++++++++++
 examples/getting-started/goodbye.d       |  36 ++++++
 examples/getting-started/hello.d         |  28 +++++
 examples/getting-started/readsizes.d     |  46 +++++++
 examples/getting-started/readtrace.d     |  72 +++++++++++
 examples/getting-started/readtrace1.d    |  78 ++++++++++++
 examples/getting-started/rwdiskact.d     | 112 +++++++++++++++++
 examples/getting-started/syscalls.d      |  50 ++++++++
 examples/getting-started/syscalls1.d     |  62 ++++++++++
 examples/getting-started/tick.d          |  55 +++++++++
 examples/getting-started/tick1.d         |  56 +++++++++
 examples/getting-started/wrun.d          |  55 +++++++++
 24 files changed, 1747 insertions(+)
 create mode 100755 examples/getting-started/activity.d
 create mode 100755 examples/getting-started/activity1.d
 create mode 100755 examples/getting-started/calltrace.d
 create mode 100755 examples/getting-started/countcalls.d
 create mode 100755 examples/getting-started/countprogs.d
 create mode 100755 examples/getting-started/countsyscalls.d
 create mode 100755 examples/getting-started/cswpercpu.d
 create mode 100755 examples/getting-started/daterun.d
 create mode 100755 examples/getting-started/diskact.d
 create mode 100755 examples/getting-started/errno.d
 create mode 100755 examples/getting-started/errno1.d
 create mode 100755 examples/getting-started/execcalls.d
 create mode 100755 examples/getting-started/fsact.sh
 create mode 100755 examples/getting-started/goodbye.d
 create mode 100755 examples/getting-started/hello.d
 create mode 100755 examples/getting-started/readsizes.d
 create mode 100755 examples/getting-started/readtrace.d
 create mode 100755 examples/getting-started/readtrace1.d
 create mode 100755 examples/getting-started/rwdiskact.d
 create mode 100755 examples/getting-started/syscalls.d
 create mode 100755 examples/getting-started/syscalls1.d
 create mode 100755 examples/getting-started/tick.d
 create mode 100644 examples/getting-started/tick1.d
 create mode 100755 examples/getting-started/wrun.d

diff --git a/examples/getting-started/activity.d b/examples/getting-started/activity.d
new file mode 100755
index 000000000..30f13b6d5
--- /dev/null
+++ b/examples/getting-started/activity.d
@@ -0,0 +1,129 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    activity.d - report on process create, exec and exit
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s activity.d
+ *
+ *  DESCRIPTION
+ *    Show the processes that are created, executed and exited
+ *    while the script is running.
+ *
+ *  NOTES
+ *    - This script uses the proc provider to trace the following process
+ *    activities: create, exec, and exit.
+ *
+ *    - This script is guaranteed to produce results if you start one or
+ *    more commands while the script is running.  There are two ways
+ *    to do this:
+ *    o Execute this script in the background, and type in the command(s).
+ *    o Alternatively, run the script in the foreground and type the
+ *    command(s) in a separate terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Associative arrays are used to store the information from the
+ *    proc provider.
+ *
+ *    - The DTrace User Guide documents the proc provider probe
+ *    arguments like args[0] and also structures like psinfo_t.  It is
+ *    strongly recommended to check the documentation for this info.
+ */
+
+/*
+ *  Fires when a process (or process thread) is created using fork() or
+ *  vfork(), which both invoke clone().  The psinfo_t corresponding to
+ *  the new child process is pointed to by args[0].
+ */
+proc:::create
+{
+/*
+ *  Store the PID of both the parent and child process from the psinfo_t
+ *  structure pointed to by args[0].  Use 3 associative arrays to store the
+ *  various items of interest.
+ */
+  this->childpid  = args[0]->pr_pid;
+  this->parentpid = args[0]->pr_ppid;
+
+/*
+ *  Store the parent PID of the new child process.
+ */
+  p_pid[this->childpid] = this->parentpid;
+
+/*
+ *  Parent command name.
+ */
+  p_name[this->childpid] = execname;
+
+/*
+ *  Child has not yet been exec'ed.
+ */
+  p_exec[this->childpid] = "";
+}
+
+/*
+ *  The process starts.  In case proc:::create has fired, store the
+ *  absolute time and the full name of the child process.
+ */
+proc:::exec
+/ p_pid[pid] != 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+}
+
+/*
+ *  The process starts, but in this case, proc:::create has not fired.
+ *  In addition to storing the name of the child process, store the
+ *  various other items of interest.
+ */
+proc:::exec
+/ p_pid[pid] == 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+  p_pid[pid]  = ppid;
+  p_name[pid] = execname;
+}
+
+/*
+ *  The process exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] != ""/
+{
+  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
+}
+
+/*
+ *  The process has forked itself and exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] == ""/
+{
+  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
+}
+
+/*
+ *  Assign 0s to free memory associated with this pid.
+ */
+proc:::exit
+/p_pid[pid] != 0/
+{
+  time[pid]   = 0;
+  p_exec[pid] = NULL;
+  p_pid[pid]  = 0;
+  p_name[pid] = NULL;
+}
diff --git a/examples/getting-started/activity1.d b/examples/getting-started/activity1.d
new file mode 100755
index 000000000..c63317689
--- /dev/null
+++ b/examples/getting-started/activity1.d
@@ -0,0 +1,144 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    activity1.d - report on process create, exec and exit
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s activity1.d '"bash"'
+ *
+ *  DESCRIPTION
+ *    Show the processes that are created, executed and exited
+ *    in the bash shell while the script is running.
+ *
+ *  NOTES
+ *    - This script uses the proc provider to trace the following process
+ *    activities: create, exec, and exit.
+ *
+ *    - A predicate is used to ensure that only those processes executed
+ *    by bash are traced.  While this could be hard coded, here the name
+ *    is passed in as an argument.
+ *
+ *    - This script is guaranteed to produce results if you start one or
+ *    more bash commands while the script is running.  There are two ways
+ *    to do this:
+ *    o Execute this script in the background, and type in the command(s).
+ *    o Alternatively, run the script in the foreground and type the
+ *    command(s) in a separate terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Associative arrays are used to store the information from the
+ *    proc provider.
+ *
+ *    - There is on important subtlety to pay attention to.  Since
+ *    bash (and other shells) optimize for performance, it may happen
+ *    that proc:::create does not fire, because there is no call to
+ *    fork(), clone(), etc.  This is why two different probes for
+ *    proc:::exec are defined.
+ *
+ *    - The DTrace User Guide documents the proc provider probe
+ *    arguments like args[0] and also structures like psinfo_t.  It is
+ *    strongly recommended to check the documentation for this info.
+ */
+
+/*
+ *  Fires when a process (or process thread) is created using fork() or
+ *  vfork(), which both invoke clone().  The psinfo_t corresponding to
+ *  the new child process is pointed to by args[0].
+ *
+ *  Use a predicate to only execute the clause if the condition is met.
+ *  In this case that means that only processes executed in the bash
+ *  shell are traced.
+ */
+proc:::create
+/ execname == $1 /
+{
+/*
+ *  Store the PID of both the parent and child process from the psinfo_t
+ *  structure pointed to by args[0].  Use 3 associative arrays to store the
+ *  various items of interest.
+ */
+  this->childpid  = args[0]->pr_pid;
+  this->parentpid = args[0]->pr_ppid;
+
+/*
+ *  Store the parent PID of the new child process.
+ */
+  p_pid[this->childpid] = this->parentpid;
+
+/*
+ *  Parent command name.
+ */
+  p_name[this->childpid] = execname;
+
+/*
+ *  Child has not yet been exec'ed.
+ */
+  p_exec[this->childpid] = "";
+}
+
+/*
+ *  The process starts.  In case proc:::create has fired, store the
+ *  absolute time and the full name of the child process.
+ */
+proc:::exec
+/ execname == $1 && p_pid[pid] != 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+}
+
+/*
+ *  The process starts, but in this case, proc:::create has not fired.
+ *  In addition to storing the name of the child process, store the
+ *  various other items of interest.
+ */
+proc:::exec
+/ execname == $1 && p_pid[pid] == 0 /
+{
+  time[pid]   = timestamp;
+  p_exec[pid] = args[0];
+  p_pid[pid]  = ppid;
+  p_name[pid] = execname;
+}
+
+/*
+ *  The process exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] != ""/
+{
+  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
+}
+
+/*
+ *  The process has forked itself and exits.  Print the information.
+ */
+proc:::exit
+/p_pid[pid] != 0 && p_exec[pid] == ""/
+{
+  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
+    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
+}
+
+/*
+ *  Assign 0s to free memory associated with this pid.
+ */
+proc:::exit
+/p_pid[pid] != 0/
+{
+  time[pid]   = 0;
+  p_exec[pid] = NULL;
+  p_pid[pid]  = 0;
+  p_name[pid] = NULL;
+}
diff --git a/examples/getting-started/calltrace.d b/examples/getting-started/calltrace.d
new file mode 100755
index 000000000..5de2b0f46
--- /dev/null
+++ b/examples/getting-started/calltrace.d
@@ -0,0 +1,95 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    calltrace.d - time all system calls for the cp command
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s calltrace.d
+ *
+ *  DESCRIPTION
+ *    List and time all the system calls that are executed during
+ *    a cp command.
+ *
+ *  NOTES
+ *    - This script traces all system calls that are executed when
+ *    a cp command is run.
+ *
+ *    This means that you need to execute the cp command while the
+ *    script is running.  There are two ways to do this:
+ *    o Execute this script in the background, and type in the cp command.
+ *    o Alternatively, run the script in the foreground and type
+ *    the cp command in a separate terminal window on the same system.
+ *
+ *    - You can use any file to copy, but you can also generate a file
+ *    and then copy it.  This is an example how to create a 500 MB file,
+ *    copy it with the cp command and remove both files again:
+ *    $ dd if=/dev/zero of=tmp_file bs=100M seek=5 count=0
+ *    $ cp tmp_file tmp_file2
+ *    $ rm tmp_file tmp_file2
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  Set the base value of the timer.  This is used as an offset in the
+ *  return probe to calculate the time spent in a system call.
+ *
+ *  A predicate is used to select the cp command.  All other commands
+ *  skip executing the clause and do not set ts_base.
+ */
+syscall:::entry
+/ execname == "cp" /
+{
+  self->ts_base = timestamp;
+}
+
+/*
+ *  The predicate ensures that the base timing has been set.
+ *  Since this is only done for the cp command, no information
+ *  is collected for the other processes.
+ */
+syscall:::return
+/self->ts_base != 0/
+{
+/*
+ *  Compute the time passed since the entry probe fired and
+ *  convert the nanosecond value to microseconds.
+ *
+ *  Update the aggregation called totals with this time.  The
+ *  execname (which is cp here) and the system call that caused
+ *  the probe to fire, are the fields in the key.
+ */
+  this->time_call = (timestamp - self->ts_base)/1000;
+  @totals[execname,probefunc] = sum(this->time_call);
+
+/*
+ *  Free the storage for ts_base.
+ */
+  self->ts_base = 0;
+}
+
+/*
+ *  Print the results.  Use printf() to print a description of
+ *  the contents of the aggregation.  The format string in printa()
+ *  is used to create a table lay-out.
+ */
+END
+{
+  printf("System calls executed and their duration:\n");
+  printa("%15s executed %18s - this took a total of %@8d microseconds\n",
+         @totals);
+}
diff --git a/examples/getting-started/countcalls.d b/examples/getting-started/countcalls.d
new file mode 100755
index 000000000..1c614228b
--- /dev/null
+++ b/examples/getting-started/countcalls.d
@@ -0,0 +1,45 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    countcalls.d - count the open(), read(), and write() calls for 5 seconds
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s countcalls.d
+ *
+ *  DESCRIPTION
+ *    List and count the calls to write(), read(), and open() executed, while
+ *    the script is running.  The script automatically stops after 5 seconds.
+ *
+ *  NOTES
+ *    - This script uses the profile provider to stop the tracing after a
+ *    certain amount of time.  This time can easily be adjusted by changing.
+ *    the number and unit.
+ *
+ *    - An anonymous aggregation is used to store the results.  Like a named
+ *    aggregation, it is automatically printed when the tracing terminates.
+ */
+
+/*
+ *  Fires every 5 seconds.  Since exit() is called, the tracing terminates
+ *  the first time this probe fires and the clause is executed.
+ */
+profile:::tick-5sec
+{
+  exit(0);
+}
+
+/*
+ *  Create the key by concatenating the function name and a string.  An
+ *  alternative is to only use probefunc as a key and print the string as
+ *  part of a printa() in the END probe: printa("%s () calls\n",@);
+ */
+syscall::write:entry, syscall::read:entry, syscall::open:entry
+{
+  @[strjoin(probefunc,"() calls")] = count();
+}
diff --git a/examples/getting-started/countprogs.d b/examples/getting-started/countprogs.d
new file mode 100755
index 000000000..7674b8a24
--- /dev/null
+++ b/examples/getting-started/countprogs.d
@@ -0,0 +1,44 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    countprogs.d - count processes invoked by a specific user
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s countprogs.d <uid>
+ *
+ *  DESCRIPTION
+ *    List and count every processes that is started by the user, while
+ *    this script runs.  The user id is passed in as an argument to the
+ *    script.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - To ensure a process is started while the script is running,
+ *    either execute this script in the background, and type in one
+ *    or more commands, or run it in the foreground and type in the
+ *    command(s) in a separate terminal window on the same system.
+ *
+ *    - The results of an aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  Fires on every process that starts execution.  An aggregation called
+ *  proc_name uses the executable name as a key and counts the number of
+ *  times this executable, or process, is started.
+ */
+proc:::exec
+/uid == $1/
+{
+  @proc_name[execname] = count();
+}
diff --git a/examples/getting-started/countsyscalls.d b/examples/getting-started/countsyscalls.d
new file mode 100755
index 000000000..b77c6b2bb
--- /dev/null
+++ b/examples/getting-started/countsyscalls.d
@@ -0,0 +1,38 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    countsyscalls.d - count system calls invoked by a specific user
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s countsyscalls.d <uid>
+ *
+ *  DESCRIPTION
+ *    List and count all the system calls executed by the specified user id.
+ *    The user id is passed in as an argument to the script.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results of the aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  Fires on every system call executed.  An aggregation called syscalls
+ *  uses the function name as a key and counts the number of calls to this
+ *  function.
+ */
+syscall:::entry
+/pid == $1/
+{
+  @syscalls[probefunc] = count();
+}
diff --git a/examples/getting-started/cswpercpu.d b/examples/getting-started/cswpercpu.d
new file mode 100755
index 000000000..814f4929d
--- /dev/null
+++ b/examples/getting-started/cswpercpu.d
@@ -0,0 +1,88 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    cswpercpu.d - print the number of context switches per CPU per second
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s cswpercpu.d
+ *
+ *  DESCRIPTION
+ *    Every second, print the CPU id, the number of context switches each
+ *    CPU performed, plus the total number of context switches executed
+ *    across all the CPUs.  For each info block, include a time stamp.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results are stored in an aggregation called cswpersec.
+ *    Every second, the results are printed with printa() and the
+ *    aggregation is cleared.
+ *
+ *    - In addition to using the CPU ID as a key in the cswpersec
+ *    aggregation, also the string "total" is used.  This entry
+ *    is always printed last, because by default, printa() prints
+ *    the results sorted by the value.  The total count for any of
+ *    the CPU Ids is always equal or less than "total".
+ */
+
+/*
+ *  To avoid that the carefully crafted output is mixed with the
+ *  default output by the dtrace command, enable quiet mode.
+ */
+#pragma D option quiet
+
+/*
+ *  Print the header.
+ */
+BEGIN
+{
+  printf("%-20s %5s %15s", "Timestamp", "CPU", "#csw");
+}
+
+/*
+ *  Fires when a process is scheduled to run on a CPU.
+ */
+sched:::on-cpu
+{
+/*
+ *  Convert the CPU ID to a string.  This needs to be done because
+ *  key "total" is a string.
+ */
+  this->cpustr = lltostr(cpu);
+/*
+ *  Update the count.
+ */
+  @cswpersec[this->cpustr]  = count();
+  @cswpersec["total"] = count();
+}
+
+/*
+ *  Fires every second.
+ */
+profile:::tick-1sec
+{
+/*
+ *  Print the date and time first
+ */
+  printf("\n%-20Y ", walltimestamp);
+
+/*
+ *  Print the aggregated counts for each CPU and the total for all CPUs.
+ *  Use some formatting magic to get a special table lay-out.
+ */
+  printa("%5s %@15d\n                     ", @cswpersec);
+
+/*
+ *  Reset the aggregation.
+ */
+  clear(@cswpersec);
+}
diff --git a/examples/getting-started/daterun.d b/examples/getting-started/daterun.d
new file mode 100755
index 000000000..59081598c
--- /dev/null
+++ b/examples/getting-started/daterun.d
@@ -0,0 +1,42 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    daterun.d - display arguments to write() for the date command
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s daterun.d
+ *
+ *  DESCRIPTION
+ *    Trace the calls to write(), but only when executed by the date
+ *    command.  For such calls, print the file descriptor, the output
+ *    string, and the number of bytes printed.
+ *
+ *  NOTES
+ *    - Execute this script in the background, and type in "date", or
+ *    run it in the foreground and type in "date" in a separate window.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The output string is stored in arg1 and contains a newline (\n)
+ *    character.  This is why the byte count is printed on a separate line.
+ */
+
+syscall::write:entry
+/execname == "date"/
+{
+/*
+ *  Use copyinstr() to copy the string from user space into a DTrace
+ *  buffer in kernel space.  This function returns a pointer to the buffer.
+ */
+  printf("%s (fd=%d output=%s bytes=%d)\n",probefunc, arg0,
+                                           copyinstr(arg1), arg2);
+}
diff --git a/examples/getting-started/diskact.d b/examples/getting-started/diskact.d
new file mode 100755
index 000000000..31b5acd43
--- /dev/null
+++ b/examples/getting-started/diskact.d
@@ -0,0 +1,106 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    diskact.d - for block devices show the distribution of I/O throughput
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s diskact.d
+ *
+ *  DESCRIPTION
+ *    The io provider is used to gather the I/O throughput for the block
+ *    devices on the system.  A histogram of the results is printed.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *   - The bufinfo_t structure is the abstraction that describes an I/O
+ *   request.  The buffer that corresponds to an I/O request is pointed
+ *   to by args[0] in the start, done, wait-start, and wait-done probes
+ *   available through the io provider.
+ *
+ *   - Detailed information about this data structure can be found in
+ *   the DTrace User Guide.  For more details, you can also check
+ *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
+ *   kernel version.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  To avoid that the carefully crafted output is mixed with the
+ *  default output by the dtrace command, enable quiet mode.
+ */
+#pragma D option quiet
+
+/*
+ *  The pointer to bufinfo_t is in args[0].  Here it is used to get
+ *  b_edev (the extended device) and b_blkno (the expanded block
+ *  number on the device).  These two fields are used in the key for
+ *  associative array io_start.
+ */
+io:::start
+{
+  io_start[args[0]->b_edev, args[0]->b_blkno] = timestamp;
+}
+
+io:::done
+/ io_start[args[0]->b_edev, args[0]->b_blkno] /
+{
+/*
+ *  We would like to show the throughput to a device in KB/sec, but
+ *  the values that are measured are in bytes and nanoseconds.
+ *  You want to calculate the following:
+ *
+ *  bytes / 1024
+ *  ------------------------
+ *  nanoseconds / 1000000000
+ *
+ *  As DTrace uses integer arithmetic and the denominator is usually
+ *  between 0 and 1 for most I/O, the calculation as shown will lose
+ *  precision.  So, restate the fraction as:
+ *
+ *  bytes         1000000000      bytes * 976562
+ *  ----------- * ------------- = --------------
+ *  nanoseconds   1024            nanoseconds
+ *
+ *  This is easy to calculate using integer arithmetic.
+ */
+
+  this->elapsed = timestamp -  io_start[args[0]->b_edev, args[0]->b_blkno];
+
+/*
+ *  The pointer to structure devinfo_t is in args[1].  Use this to get the
+ *  name (+ instance/minor) and the pathname of the device.
+ *
+ *  Use the formula above to compute the throughput.  The number of bytes
+ *  transferred is in bufinfo_t->b_bcount
+ */
+  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
+                 strjoin("path = ",args[1]->dev_pathname)] =
+                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
+
+/*
+ *  Free the storage for the entry in the associative array.
+ */
+  io_start[args[0]->b_edev, args[0]->b_blkno] = 0;
+}
+
+/*
+ *  Use a format string to print the aggregation.
+ */
+END
+{
+  printa(" %s (%s)\n%@d\n", @io_throughput);
+}
diff --git a/examples/getting-started/errno.d b/examples/getting-started/errno.d
new file mode 100755
index 000000000..7c76d9678
--- /dev/null
+++ b/examples/getting-started/errno.d
@@ -0,0 +1,56 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    errno.d - list and count the system calls with a non-zero errno value
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s errno.d
+ *
+ *  DESCRIPTION
+ *    Trace every system call that returns a non-zero value in errno.
+ *    Show the name of the function, the value of errno and how often
+ *    this function returned a non-zero value for errno.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The value of errno is available upon the return from the system call.
+ *
+ *    - To present the results in a compact form, we use an aggregation
+ *    called syscalls.  Otherwise we may get several screens with the
+ *    information.  Plus that we then can't easily count the functions.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  Store the information in an aggregation called syscalls.
+ *  Use the predicate to only allow non-zero errno values that are
+ *  within the range for errno.
+ */
+syscall:::return
+/ errno > 0 && errno <= ERANGE /
+{
+  @syscalls[probefunc,errno] = count();
+}
+
+/*
+ *  The printf() line prints the header of the table to follow.
+ */
+END
+{
+  printf("%20s %5s %5s\n\n","syscall","errno","count");
+  printa("%20s %5d %@5d\n",@syscalls);
+}
diff --git a/examples/getting-started/errno1.d b/examples/getting-started/errno1.d
new file mode 100755
index 000000000..c8fbf8d44
--- /dev/null
+++ b/examples/getting-started/errno1.d
@@ -0,0 +1,145 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    errno1.d - list and count the system calls with a non-zero errno value
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s errno1.d
+ *
+ *  DESCRIPTION
+ *    Trace every system call that returns a non-zero value in errno.
+ *    Show the process name, the name of the function it executes, the
+ *    user id, the name of the error that corresponds to the value of
+ *    errno, a descriptive message for the error, and how often this
+ *    combination occurred.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The value of errno is available upon the return from the system call.
+ *
+ *    - To present the results in a compact form, we use an aggregation
+ *    called syscalls.  Otherwise we may get several screens with the
+ *    information.  Plus that we then can't easily count the functions.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+BEGIN
+{
+/*
+ *  Define an associative array called errno_code that maps a value
+ *  of errno to an enum name.  This information can be found in file
+ *  /usr/include/asm-generic/errno-base.h.
+ *
+ *  File /usr/include/asm-generic/errno.h has the codes for calling a system
+ *  call that does not exist.  This has not been used here though.
+ */
+  errno_code[EPERM]   = "EPERM";    /* Operation not permitted */
+  errno_code[ENOENT]  = "ENOENT";   /* No such file or directory */
+  errno_code[ESRCH]   = "ESRCH";    /* No such process */
+  errno_code[EINTR]   = "EINTR";    /* Interrupted system call */
+  errno_code[EIO]     = "EIO";      /* I/O error */
+  errno_code[ENXIO]   = "ENXIO";    /* No such device or address */
+  errno_code[E2BIG]   = "E2BIG";    /* Argument list too long */
+  errno_code[ENOEXEC] = "ENOEXEC";  /* Exec format error */
+  errno_code[EBADF]   = "EBADF";    /* Bad file number */
+  errno_code[ECHILD]  = "ECHILD";   /* No child processes */
+  errno_code[EAGAIN]  = "EAGAIN";   /* Try again or operation would block */
+  errno_code[ENOMEM]  = "ENOMEM";   /* Out of memory */
+  errno_code[EACCES]  = "EACCES";   /* Permission denied */
+  errno_code[EFAULT]  = "EFAULT";   /* Bad address */
+  errno_code[ENOTBLK] = "ENOTBLK";  /* Block device required */
+  errno_code[EBUSY]   = "EBUSY";    /* Device or resource busy */
+  errno_code[EEXIST]  = "EEXIST";   /* File exists */
+  errno_code[EXDEV]   = "EXDEV";    /* Cross-device link */
+  errno_code[ENODEV]  = "ENODEV";   /* No such device */
+  errno_code[ENOTDIR] = "ENOTDIR";  /* Not a directory */
+  errno_code[EISDIR]  = "EISDIR";   /* Is a directory */
+  errno_code[EINVAL]  = "EINVAL";   /* Invalid argument */
+  errno_code[ENFILE]  = "ENFILE";   /* File table overflow */
+  errno_code[EMFILE]  = "EMFILE";   /* Too many open files */
+  errno_code[ENOTTY]  = "ENOTTY";   /* Not a typewriter */
+  errno_code[ETXTBSY] = "ETXTBSY";  /* Text file busy */
+  errno_code[EFBIG]   = "EFBIG";    /* File too large */
+  errno_code[ENOSPC]  = "ENOSPC";   /* No space left on device */
+  errno_code[ESPIPE]  = "ESPIPE";   /* Illegal seek */
+  errno_code[EROFS]   = "EROFS";    /* Read-only file system */
+  errno_code[EMLINK]  = "EMLINK";   /* Too many links */
+  errno_code[EPIPE]   = "EPIPE";    /* Broken pipe */
+  errno_code[EDOM]    = "EDOM";     /* Math argument out of domain of func */
+  errno_code[ERANGE]  = "ERANGE";   /* Math result not representable */
+
+/*
+ *  This associative array called errno_msg has a brief description of the
+ *  error for each non-zero value of errno.
+ */
+  errno_msg[EPERM]   = "Operation not permitted";
+  errno_msg[ENOENT]  = "No such file or directory";
+  errno_msg[ESRCH]   = "No such process";
+  errno_msg[EINTR]   = "Interrupted system call";
+  errno_msg[EIO]     = "I/O error";
+  errno_msg[ENXIO]   = "No such device or address";
+  errno_msg[E2BIG]   = "Argument list too long";
+  errno_msg[ENOEXEC] = "Exec format error";
+  errno_msg[EBADF]   = "Bad file number";
+  errno_msg[ECHILD]  = "No child processes";
+  errno_msg[EAGAIN]  = "Try again or operation would block";
+  errno_msg[ENOMEM]  = "Out of memory";
+  errno_msg[EACCES]  = "Permission denied";
+  errno_msg[EFAULT]  = "Bad address";
+  errno_msg[ENOTBLK] = "Block device required";
+  errno_msg[EBUSY]   = "Device or resource busy";
+  errno_msg[EEXIST]  = "File exists";
+  errno_msg[EXDEV]   = "Cross-device link";
+  errno_msg[ENODEV]  = "No such device";
+  errno_msg[ENOTDIR] = "Not a directory";
+  errno_msg[EISDIR]  = "Is a directory";
+  errno_msg[EINVAL]  = "Invalid argument";
+  errno_msg[ENFILE]  = "File table overflow";
+  errno_msg[EMFILE]  = "Too many open files";
+  errno_msg[ENOTTY]  = "Not a typewriter";
+  errno_msg[ETXTBSY] = "Text file busy";
+  errno_msg[EFBIG]   = "File too large";
+  errno_msg[ENOSPC]  = "No space left on device";
+  errno_msg[ESPIPE]  = "Illegal seek";
+  errno_msg[EROFS]   = "Read-only file system";
+  errno_msg[EMLINK]  = "Too many links";
+  errno_msg[EPIPE]   = "Broken pipe";
+  errno_msg[EDOM]    = "Math argument out of domain of func";
+  errno_msg[ERANGE]  = "Math result not representable";
+}
+
+/*
+ *  Store the information in an aggregation called syscalls.
+ *  Use the predicate to only allow non-zero errno values that are
+ *  within the range for errno.
+ */
+syscall:::return
+/ errno > 0 && errno <= ERANGE /
+{
+  @syscalls[execname,probefunc,uid,errno_code[errno],
+            errno_msg[errno]] = count();
+}
+
+/*
+ *  The printf() line prints the header of the table to follow.
+ */
+END
+{
+  printf("%-20s %-16s %-6s %-7s %-35s %5s\n\n","PROCESS","SYSCALL","UID",
+         "ERROR","DESCRIPTION","COUNT");
+  printa("%-20s %-16s %-6d %-7s %-35s %@5d\n",@syscalls);
+}
diff --git a/examples/getting-started/execcalls.d b/examples/getting-started/execcalls.d
new file mode 100755
index 000000000..ba829aacd
--- /dev/null
+++ b/examples/getting-started/execcalls.d
@@ -0,0 +1,51 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    execcalls.d - show all processes that start executing
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s execcalls.d
+ *
+ *  DESCRIPTION
+ *    The probe in this script traces the exec() system call.  It
+ *    fires whenever a process loads a new process image.
+ *
+ *  NOTES
+ *    - This script traces the processes that start executing while
+ *    the script is running.  If no process is started during the
+ *    time that the script runs, no output is produced.
+ *
+ *    If that is the case, you can always execute a command yourself
+ *    while this script is running.  One such command is "date" that
+ *    causes the probe to fire.
+ *
+ *    - If you'd like to execute command(s) while the script is running,
+ *    execute this script in the background, and type in one or more
+ *    commands.  If you started the script in the foreground, type in
+ *    the command(s) in a separate terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ */
+
+proc:::exec
+/ args[0] != NULL /
+{
+/*
+ *  This information is from the DTrace user guide.  The proc:::exec
+ *  probe makes a pointer to a char available in args[0].  This has
+ *  the path to the new process image.
+ *
+ *  The strjoin() function is used to add a newline (\n) to the
+ *  string that is to be printed.
+ */
+  trace(strjoin(stringof(args[0]),"\n"));
+}
diff --git a/examples/getting-started/fsact.sh b/examples/getting-started/fsact.sh
new file mode 100755
index 000000000..48b8adc98
--- /dev/null
+++ b/examples/getting-started/fsact.sh
@@ -0,0 +1,114 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+#------------------------------------------------------------------------------
+# This example embeds a DTrace script in a bash script.  The bash script
+# is used to set the variables needed in the D script.
+#
+# fsact -- Display cumulative read and write activity across a file
+#          system device
+#
+#          Usage: fsact [<filesystem>]
+#------------------------------------------------------------------------------
+
+#------------------------------------------------------------------------------
+# If no file system is specified, assume /
+#------------------------------------------------------------------------------
+[ $# -eq 1 ] && FSNAME=$1 || FSNAME="/"
+[ ! -e $FSNAME ] && echo "$FSNAME not found" && exit 1
+
+#------------------------------------------------------------------------------
+# Determine the mountpoint, major and minor numbers, and file system size.
+#------------------------------------------------------------------------------
+MNTPNT=$(df $FSNAME | gawk '{ getline; print $1; exit }')
+MAJOR=$(printf "%d\n" 0x$(stat -Lc "%t" $MNTPNT))
+MINOR=$(printf "%d\n" 0x$(stat -Lc "%T" $MNTPNT))
+FSSIZE=$(stat -fc "%b" $FSNAME)
+
+#------------------------------------------------------------------------------
+# Run the embedded D script.
+#------------------------------------------------------------------------------
+sudo dtrace -qs /dev/stdin << EOF
+/*
+ *  DESCRIPTION
+ *    The io:::done probe from the io provider is used to get read and write
+ *    statistics.  In particular, the id of the block that is accessed for
+ *    the read or write operation.
+ */
+
+BEGIN
+{
+  printf("Show how often blocks are accessed in read and write operations\n");
+  printf("The statistics are updated every 5 seconds\n");
+  printf("The block IDs are normalized to a scale from 0 to 10\n");
+  printf("The file system is %s\n","$FSNAME");
+  printf("The mount point is %s\n","$MNTPNT");
+  printf("The file system size is %s bytes\n","$FSSIZE");
+}
+
+/*
+ *  This probe fires after an I/O request has been fulfilled. The
+ *  done probe fires after the I/O completes, but before completion
+ *  processing has been performed on the buffer.
+ *
+ *  A pointer to structure devinfo_t is in args[1].  This is used
+ *  to get the major and minor number of the device.
+ *
+ *  A pointer to structure bufinfo_t is in args[0].  This is used
+ *  to get the flags and the block number.
+ */
+io:::done
+/ args[1]->dev_major == $MAJOR && args[1]->dev_minor == $MINOR /
+{
+/*
+ *  Check if B_READ has been set and assign a string to io_type
+ *  based on the outcome of the check.  This string is used as
+ *  the key in aggregation io_stats.
+ */
+  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+
+/*
+ *  Structure member b_lblkno identifies which logical block on the
+ *  device is to be accessed.  Normalize thise block number as an
+ *  integer in the range 0 to 10.
+ */
+  blkno = (args[0]->b_blkno)*10/$FSSIZE;
+
+/*
+ *  Aggregate blkno linearly over the range 0 to 10 in steps of 1.
+ */
+  @io_stats[io_type] = lquantize(blkno,0,10,1)
+}
+
+/*
+ *  Fires every 5 seconds.
+ */
+profile:::tick-5s
+{
+  printf("%Y\n",walltimestamp);
+
+/*
+ *  Display the contents of the aggregation.
+ */
+  printa("%s\n%@d\n",@io_stats);
+
+/*
+ *  Reset the aggregation every time this probe fires
+ */
+  clear(@io_stats);
+}
+
+/*
+ *  Fires every 21 seconds.  Since exit() is called, the tracing terminates
+ *  the first time this probe fires and the clause is executed.
+ */
+profile:::tick-21s
+{
+  printf("Tracing is terminated now\n");
+  exit(0);
+}
+EOF
diff --git a/examples/getting-started/goodbye.d b/examples/getting-started/goodbye.d
new file mode 100755
index 000000000..e0a1a67e2
--- /dev/null
+++ b/examples/getting-started/goodbye.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    goodbye.d - demonstrate the END probe
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s goodbye.d
+ *
+ *  DESCRIPTION
+ *    Demonstrates the use of the END probe.  Function trace() is
+ *    used to print a string.
+ *
+ *  NOTES
+ *    - The advantage of trace() is that it is simple and does not
+ *    require a format string.  If more control over the output is
+ *    needed, printf() is a good alternative.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ */
+
+/*
+ *  The END probe fires once when the tracing has terminated.
+ */
+END
+{
+  trace("Goodbye");
+}
diff --git a/examples/getting-started/hello.d b/examples/getting-started/hello.d
new file mode 100755
index 000000000..454822762
--- /dev/null
+++ b/examples/getting-started/hello.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    hello.d - demonstrate the BEGIN probe
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s hello.d
+ *
+ *  DESCRIPTION
+ *    Demonstrate the use of the BEGIN probe.  Function trace() is
+ *    used to print a string.  The exit() function terminates the
+ *    tracing.
+ */
+
+/*
+ *  The BEGIN probe fires when the tracing script starts.
+ */
+BEGIN
+{
+  trace("Hello, world");
+  exit(0);
+}
diff --git a/examples/getting-started/readsizes.d b/examples/getting-started/readsizes.d
new file mode 100755
index 000000000..da2f43ecf
--- /dev/null
+++ b/examples/getting-started/readsizes.d
@@ -0,0 +1,46 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    readsizes.d - show the distribution of bytes read when running find
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s readsizes.d
+ *
+ *  DESCRIPTION
+ *    Trace the calls to read() and use a predicate to only select those
+ *    calls executed as part of executing the find command.  For such
+ *    calls, show the distribution of the sizes.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results are stored in an aggregation called dist with
+ *    the string "find" as the key.
+ *
+ *    - The results of an aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  A predicate is used to guarantee that the clause for the read:entry
+ *  probe is only executed in case the call to read() was issued by the
+ *  find command.
+ *
+ *  The quantize() function is used to show the distribution of the sizes
+ *  read, or attempted to be read, by the read() call.  This value is
+ *  passed to the syscall function and to the D probe in arg2.
+ */
+syscall::read:entry
+/execname == "find"/
+{
+  @dist["find"] = quantize(arg2);
+}
diff --git a/examples/getting-started/readtrace.d b/examples/getting-started/readtrace.d
new file mode 100755
index 000000000..c62da82b4
--- /dev/null
+++ b/examples/getting-started/readtrace.d
@@ -0,0 +1,72 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    readtrace.d - show the time spent in the read() system call
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s readtrace.d
+ *
+ *  DESCRIPTION
+ *    For each combination of executable name and process id, show the
+ *    total time in microseconds that is spent in the read() system call(s).
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - An aggregation is used to accumulate the timings.  An alternative
+ *    is to print the results in the read:return probe and if required,
+ *    post process the output when the script has completed.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, the results
+ *    are printed in the END probe.  The format string is optional,
+ *    but is used to produce a table lay-out.
+ */
+
+/*
+ *  Set the base value of the timer.  This is used as an offset in the
+ *  read:return probe to calculate the time spent.
+ */
+syscall::read:entry
+{
+  self->ts_base = timestamp;
+}
+
+/*
+ *  The predicate ensures that the base timing has been set.
+ */
+syscall::read:return
+/self->ts_base != 0/
+{
+/*
+ *  Clause-local variable time_read is used to store the time passed
+ *  since the read:entry probe fired.  This time is converted from
+ *  nanoseconds to microseconds.
+ *
+ */
+  this->time_read = (timestamp - self->ts_base)/1000;
+  @totals[execname,pid] = sum(this->time_read);
+
+/*
+ *  Free the storage for ts_base.
+ */
+  self->ts_base = 0;
+}
+
+/*
+ *  Print the results.
+ */
+END
+{
+  printa("%15s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
+         @totals);
+}
diff --git a/examples/getting-started/readtrace1.d b/examples/getting-started/readtrace1.d
new file mode 100755
index 000000000..6dc032854
--- /dev/null
+++ b/examples/getting-started/readtrace1.d
@@ -0,0 +1,78 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    readtrace.d - show the time spent in the read() system call
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s readtrace.d
+ *
+ *  DESCRIPTION
+ *    For each combination of executable name and process id, show the
+ *    total time in microseconds that is spent in the read() system call(s)
+ *    executed by the df command.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - An aggregation is used to accumulate the timings.  An alternative
+ *    is to print the results in the read:return probe and if required,
+ *    post process the output when the script has completed.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, the results
+ *    are printed in the END probe.  The format string is optional,
+ *    but is used to produce a table lay-out.
+ */
+
+/*
+ *  Set the base value of the timer.  This is used as an offset in the
+ *  read:return probe to calculate the time spent.
+ *
+ *  A predicate is used to select the df command.  All other commands
+ *  skip the clause and do not set ts_base.
+ */
+syscall::read:entry
+/ execname == "df" /
+{
+  self->ts_base = timestamp;
+}
+
+/*
+ *  The predicate ensures that the base timing has been set.  Since this
+ *  is only done for the df command, no information is collected for the
+ *  other processes.
+ */
+syscall::read:return
+/self->ts_base != 0/
+{
+/*
+ *  Clause-local variable time_read is used to store the time passed
+ *  since the read:entry probe fired.  This time is converted from
+ *  nanoseconds to microseconds.
+ */
+  this->time_read = (timestamp - self->ts_base)/1000;
+  @totals[execname,pid] = sum(this->time_read);
+
+/*
+ *  Free the storage for ts_base.
+ */
+  self->ts_base = 0;
+}
+
+/*
+ *  Print the results.  The format is tailored to the df command.
+ */
+END
+{
+  printa("%-3s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
+         @totals);
+}
diff --git a/examples/getting-started/rwdiskact.d b/examples/getting-started/rwdiskact.d
new file mode 100755
index 000000000..5389270a1
--- /dev/null
+++ b/examples/getting-started/rwdiskact.d
@@ -0,0 +1,112 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    rwdiskact.d - for block devices show the read() and write() performance
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s rwdiskact.d
+ *
+ *  DESCRIPTION
+ *    The io provider is used to display the throughput of the read()
+ *    and write calls() for the block devices on the system.  The
+ *    tracing automatically stops after 10 seconds.
+ *
+ *  NOTES
+ *   - The bufinfo_t structure is the abstraction that describes an I/O
+ *   request.  The buffer that corresponds to an I/O request is pointed
+ *   to by args[0] in the start, done, wait-start, and wait-done probes
+ *   available through the io provider.
+ *
+ *   - Detailed information about this data structure can be found in
+ *   the DTrace User Guide.  For more details, you can also check
+ *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
+ *   kernel version.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed using printa() in the END probe
+ */
+
+/*
+ *  To avoid that the carefully crafted output is mixed with the
+ *  default output by the dtrace command, enable quiet mode.
+ */
+#pragma D option quiet
+
+/*
+ *  Fires every 10 seconds.  Since exit() is called, the tracing terminates
+ *  the first time this probe fires and the clause is executed.
+ */
+profile:::tick-10sec
+{
+  exit(0);
+}
+
+/*
+ *  The pointer to bufinfo_t is in args[0].  Here it is used to get
+ *  b_flags (the flags), b_edev (the extended device) and b_blkno (the
+ *  expanded block number on the device).  These three fields are used
+ *  in the key for associative array io_start.
+ */
+io:::start
+{
+  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+  io_start[args[0]->b_edev, args[0]->b_blkno, io_type] = timestamp;
+}
+
+io:::done
+{
+/*
+ *  We would like to show the throughput to a device in KB/sec, but
+ *  the values that are measured are in bytes and nanoseconds.
+ *  You want to calculate the following:
+ *
+ *  bytes / 1024
+ *  ------------------------
+ *  nanoseconds / 1000000000
+ *
+ *  As DTrace uses integer arithmetic and the denominator is usually
+ *  between 0 and 1 for most I/O, the calculation as shown will lose
+ *  precision.  So, restate the fraction as:
+ *
+ *  bytes         1000000000      bytes * 976562
+ *  ----------- * ------------- = --------------
+ *  nanoseconds   1024            nanoseconds
+ *
+ *  This is easy to calculate using integer arithmetic.
+ */
+  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
+  this->elapsed = timestamp -
+                  io_start[args[0]->b_edev,args[0]->b_blkno,io_type];
+
+/*
+ *  The pointer to structure devinfo_t is in args[1].  Use this to get the
+ *  name (+ instance/minor) and the pathname of the device.
+ *
+ *  Use the formula above to compute the throughput.  The number of bytes
+ *  transferred is in bufinfo_t->b_bcount
+ */
+  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
+                 strjoin("path = ",args[1]->dev_pathname),
+                io_type] =
+                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
+
+/*
+ *  Free the storage for the entry in the associative array.
+ */
+  io_start[args[0]->b_edev, args[0]->b_blkno,io_type] = 0;}
+
+/*
+ *  Use a format string to print the aggregation.
+ */
+END
+{
+  printa(" %s (%s) %s \n%@d\n", @io_throughput);
+}
diff --git a/examples/getting-started/syscalls.d b/examples/getting-started/syscalls.d
new file mode 100755
index 000000000..365c99688
--- /dev/null
+++ b/examples/getting-started/syscalls.d
@@ -0,0 +1,50 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    syscalls.d - show the read() system calls executed
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s syscalls.d
+ *
+ *  DESCRIPTION
+ *    Count the read() system calls that are executed while the script
+ *    is running.  Count by the name of the process and the file
+ *    descriptor used in the read operation.
+ *
+ *  NOTES
+ *    - This script traces the running processes and the probe fires
+ *    if there are calls to read().  If there are no such calls, no
+ *    output is produced.
+ *
+ *    If that is the case, you can always execute a command that
+ *    executes calls to read().  One such command is "date".  It causes
+ *    the probe to fire, but any other command that issues calls to
+ *    read() will do.
+ *
+ *    - Execute this script in the background, and type in the command,
+ *    or run it in the foreground and type in the command in a separate
+ *    terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - The results of the aggregation are automatically printed when
+ *    the tracing terminates.
+ */
+
+/*
+ *  The file descriptor used in the read() call is passed to the syscall
+ *  and to the D probe in arg0.
+ */
+syscall::read:entry
+{
+  @totals[execname,arg0] = count();
+}
diff --git a/examples/getting-started/syscalls1.d b/examples/getting-started/syscalls1.d
new file mode 100755
index 000000000..9f2bbe411
--- /dev/null
+++ b/examples/getting-started/syscalls1.d
@@ -0,0 +1,62 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    syscalls1.d - show the read() system calls executed
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s syscalls1.d
+ *
+ *  DESCRIPTION
+ *    Count the read() system calls that are executed while the script
+ *    is running.  Count by the process id, the user id, the name of
+ *    the process and the file descriptor used in the read operation.
+ *
+ *  NOTES
+ *    - This script traces the running processes and the probe fires
+ *    if there are calls to read().  If there are no such calls, no
+ *    output is produced.
+ *
+ *    If that is the case, you can always execute a command that
+ *    executes calls to read().  One such command is "date".  It causes
+ *    the probe to fire, but any other command that issues calls to
+ *    read() will do.
+ *
+ *    - Execute this script in the background, and type in the command,
+ *    or run it in the foreground and type in the command in a separate
+ *    terminal window on the same system.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Although the results of an aggregation are automatically
+ *    printed when the tracing terminates, in this case, we want to
+ *    control the format of the output.  This is why the results are
+ *    printed in the END probe
+ */
+
+/*
+ *  The file descriptor used in the read() call is passed to the syscall
+ *  and to the D probe in arg0.
+ */
+syscall::read:entry
+{
+  @totals[pid,uid,execname,arg0] = count();
+}
+
+/*
+ *  The printf() statement prints a header.  The format string in the
+ *  printa() call is optional.  Here it is used to produce a table layout.
+ */
+END
+{
+  printf("%8s %6s %20s %3s %5s\n","PID","UID","EXECNAME","FD","COUNT");
+  printa("%8d %6d %20s %3d %5@d\n",@totals);
+}
diff --git a/examples/getting-started/tick.d b/examples/getting-started/tick.d
new file mode 100755
index 000000000..b1a2a9440
--- /dev/null
+++ b/examples/getting-started/tick.d
@@ -0,0 +1,55 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    tick.d - perform an action at regular intervals
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s tick.d
+ *
+ *  DESCRIPTION
+ *    Use the tick probe from the profile provider to execute a block of code
+ *    at regular intervals.  In this case, this is the update of a variable
+ *    called "i", but the clause can contain any valid D statements.  The
+ *    final value of "i" is printed in the END probe.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Instead of printf(), trace() can be used and vice-versa.  The
+ *    difference is that trace() does not support a format string.
+ */
+
+/*
+ *  Initialize variable "i" to zero.  This is a global variable that
+ *  can be read and written by any probe.
+ */
+BEGIN
+{
+  i = 0;
+}
+
+/*
+ *  This probe fires every 100 milliseconds.  When it fires, it updates
+ *  variable "i" and prints the result.
+ */
+profile:::tick-100msec
+{
+  printf("i = %d\n",++i);
+}
+
+/*
+ *  Print the final result.
+ */
+END
+{
+  trace(i);
+}
diff --git a/examples/getting-started/tick1.d b/examples/getting-started/tick1.d
new file mode 100644
index 000000000..244c79100
--- /dev/null
+++ b/examples/getting-started/tick1.d
@@ -0,0 +1,56 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    tick1.d - perform an action at regular intervals
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s tick1.d
+ *
+ *  DESCRIPTION
+ *    Use the tick probe from the profile provider to execute a block of code
+ *    at regular intervals.  In this case, this is the update of a variable
+ *    called "i", but the clause can contain any valid D statements.  The
+ *    final value of "i" is printed in the END probe.  The printf() function
+ *    is used to format the output.
+ *
+ *  NOTES
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - Instead of printf(), trace() can be used and vice-versa.  The
+ *    difference is that trace() does not support a format string.
+ */
+
+/*
+ *  Initialize variable "i" to zero.  This is a global variable that
+ *  can be read and written by any probe.
+ */
+BEGIN
+{
+  i = 0;
+}
+
+/*
+ *  This probe fires every 100 milliseconds.  When it fires, it updates
+ *  variable "i" and prints the result.
+ */
+profile:::tick-100msec
+{
+  printf("i = %d\n",++i);
+}
+
+/*
+ *  Print the final result.  Use printf() to format the output.
+ */
+END
+{
+  printf("\nFinal value of i = %d\n",i);
+}
diff --git a/examples/getting-started/wrun.d b/examples/getting-started/wrun.d
new file mode 100755
index 000000000..3e242f592
--- /dev/null
+++ b/examples/getting-started/wrun.d
@@ -0,0 +1,55 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ *  NAME
+ *    wrun.d - display arguments to write() for the w command
+ *
+ *  SYNOPSIS
+ *    sudo dtrace -s wrun.d
+ *
+ *  DESCRIPTION
+ *    Trace the calls to write(), but only when executed by the w
+ *    command.  For such calls, print the file descriptor, the
+ *    output string, and the number of bytes printed.
+ *
+ *  NOTES
+ *    - Execute this script in the background, and type in "w", or
+ *    run it in the foreground and type in "w" in a separate window.
+ *
+ *    - The script needs to be terminated with ctrl-C.  In case the
+ *    script is running in the background, get it to run in the
+ *    foreground first by using the fg command and then use ctrl-C
+ *    to terminate the process.  Otherwise, typing in ctrl-C will do.
+ *
+ *    - DTrace has a default limit of 256 bytes for strings.  In this
+ *    example, the output string may be longer than this.  If so,
+ *    either use the "-x strsize=<new-length>" command line option,
+ *    or a "#pragma D option strsize=<new-length>" pragma in the
+ *    script to increase the size.  The latter is shown below.
+ */
+
+#pragma D option strsize=512
+
+/*
+ *  Use a predicate to only execute the clause in case the w
+ *  command causes the probe to fire.
+ */
+syscall::write:entry
+/execname == "w"/
+{
+/*
+ *  Use copyinstr() to copy the string from user space into a DTrace
+ *  buffer in kernel space.  This function returns a pointer to the buffer.
+ *  The string it points to, is null terminated.
+ *  The third argument in the call to write() is the number of bytes
+ *  to be printed.  This could be used as an optional second argument
+ *  in copyinstr() so that only this many bytes are copied.
+ */
+  printf("%s(fd=%d\noutput=\n%s\nbytes=%d)\n",probefunc, arg0,
+                                              copyinstr(arg1), arg2);
+}
-- 
2.47.3

