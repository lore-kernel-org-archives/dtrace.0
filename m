Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30F33F3
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937413; cv=fail; b=DeoWk6/juwFtjNT69EI/ePb25HgWmniV10waE+WbFiv3bGBehbQyWjM3S0Yl681wAId65CpV7yFF3lr8+DvG7NcGDFrYMBXirJa4M8O5HR/iyFcZ9GSRaw/9zpSvr6Ig40L5Q4PDffZ+UKspeuhl1e2s+EtRRqyl+Ie3GHC39uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937413; c=relaxed/simple;
	bh=rP+GTaLTbexj3Z8uV3Wr/olVNerfV2Umo3dLEIEfb4Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rKlTJkO7gEweCuZdh+HaKcYV9wGmtvsCkmLRfmnH2e5nl+rp4TIa1z5azqswX8R2ZRw3+9IFsJwYdRns1egAb2GID2dg+7a7icLg1YE7F1BGDDSm9fY3afBJeOf4Wfvk3xXXx0ccF472wmsZ1tNlcxI4cJw18lwcyYRxsNfT6q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rWJqNk2m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VLi5fwzH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rWJqNk2m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VLi5fwzH"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI75sI019688
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/81rBAxxSWbp407pW7
	+C4++5LdZD0DNfQIvmeINaKqE=; b=rWJqNk2mxrY0xAM2n5/RvXNSX4ha7PTkY9
	zojwRH3ci84wlt2frt4lBM7N6UWw/6Vy05rniQORvN2ZkBni3wjwTegUq4p0CF5/
	irsnrJU35HvEiWrtdZ1W2k1fKEiRatFA13FqWiA4LuhESUnCb0FvRIouE/6qsj9A
	PkFpjLICg/wdwmPgaWC5S4mfkJAQ5VeCf+/9bbl5TGb63VvCij+QpJDMh1VvwQeJ
	nJ/pTp2EXcKlyxPgk9SQl06IQTjmQETKPMC8jo9JyRJXe2+cIOf+7wJS4YZS/eC3
	oO6GBDXWDJhMdl1tKAOPnpcyoGFEXYnzqcBMOlgpPvSycBDe4OBg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t8x0006u-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHYwgo033586
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rweq0eyp-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIgscvFfPQ1Mpvomu7jjW5QdQYStXcrfPip8gZmnBVgIIm5U7vDa8Tx8UUCBzNsCWIZUuW5JazapPBNI3IvnvYjHsHtK6fFISnnpvj4bKjAirKl2a6GnNcw9eiP1s5bEIeCjZcP1FdazypG5T3tUtZ77YXk3yjInYrSfG1M1dpmPuVWOq5Dkmof6xxdlkX5EVet5Q8ARVWfLvZKb6JjVozx182rwQLirUvU1GQobq3+/sD3SamjU+KTg3aqWt4/TOTd/967GoaveYGfXzxY8qpNlkSwUXgrMFoQ0t+CCFM4kkKYRTPTl5hk5IHDmrkqLh9PtUOz7L15jGVwlUAmkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/81rBAxxSWbp407pW7+C4++5LdZD0DNfQIvmeINaKqE=;
 b=IG5N4SG60eXMgGPEGUabt/AcIgHuTKaK8oyC6KM6xi6wdzFL8aifbQmAgCNgIzr4aE/pZzsZ8WLdcmYMtzfFhwVNpduqMhhsZJwI/BhUhbXriTefwtknXJXrtgy0MWPT/agDGSSqt5VxpVQk6Ke2yyz1c81BM/T/t8/bBs6EMGFxkndd1+zPCszFcpE1SH3/95Ux9NN3gDtybr2S2Sys6/c1Q2NY2UtY6K+gYUnV8k4DjbxapxeD5Y5AAFSH+phXiPUetXNDvSK3iBUT3BSQKW/BdFrMZjna6nxM+1nQ4Nb1Os/V6n3cWv3ACixKLMX5sFkFSrLKTFyj43W5RV3Ajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/81rBAxxSWbp407pW7+C4++5LdZD0DNfQIvmeINaKqE=;
 b=VLi5fwzH56TPFw74Z59i8K4KnboYiLs4hiUga9bNKhdTv6nbTzKmyp7nS5olNqKNoM5UP8U1dML7TrDcF3oTy93OdUb5mgKjPUEQTDLVsu+ElS71CF9NIEiRzzpBtdcEyaJh36PlL8VP2m71uq7woN6KhhCqrY+I738Fhx6/IEk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 18:02:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:02:00 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/14] Test: caller and stackdepth tests for lockstat provider
Date: Thu, 22 May 2025 14:01:18 -0400
Message-Id: <20250522180118.27343-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebabb5a-6d1d-4acb-bfc2-08dd995abfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nWXxBwNjAIs6y0tFvOVLLj/edE6In9vM0vIh/slnKI5LoVEf6wcyMRaiD/cv?=
 =?us-ascii?Q?QOXLbV0b53sAPtoQ2ulnDOpXu77ODkFpAyotdhuMlaaLyhK0IaQjmeBlAvsz?=
 =?us-ascii?Q?urj4K7FEM38QruDLb3hMoKUDT2TuyoCq8R3s6cF3R2ZQN6aapKplMpLkvXEb?=
 =?us-ascii?Q?P5V2f9U64HgweKtMGdyibyZdYEKAi6/YGW93F0+qZoQCgRQLS3TEHDxPlzh3?=
 =?us-ascii?Q?wdq8wmoJnGRbLL3FMxI4jvCs839P6BeA/mdaCzhO65BYOTtoYCbxE+svwzfX?=
 =?us-ascii?Q?l60kDB5rkV0Uc60CeiyyFqq5s9LVDWKdaLuAiPkq8loDLULdRwB76N93Ynd6?=
 =?us-ascii?Q?GPSZnnIFhvFwO/MbkfjJmevuMILyQ5z4yGxIPOCVSTR8OwJDF5s34VjDGov/?=
 =?us-ascii?Q?ReHRftbV82lTpTSLYLFyXRzzruMunQ+9V/jRlG/sraLnlLonQt5TDhBzLExR?=
 =?us-ascii?Q?O4Ldgzo8JxBKX/vpXbYff+RY606l82p7mm0PnwRJt1s5Kh+h8FaL4oa5ilDU?=
 =?us-ascii?Q?/4suqXGBq+rcNhkQ7OtgeocjiHU5Yc/Cm5Tq/wR150lQPjnhu22BzVaXu3Zi?=
 =?us-ascii?Q?2IIN8axt4XMHL0uPiR/bA5RrENLsiu61bdTqlgWsAK37n99vedP4UQMvWDAg?=
 =?us-ascii?Q?l5x3bJuLy+BhrjO+Flln5IyqRhFW8jj/YbcM4hYty9xYQ+3bm3f0O1y9gmFN?=
 =?us-ascii?Q?f2aoS+jC2aC7+h8Exsi7qjMd2fZJeHjXOfsTIka+sQUHBuaOQGjjImo7+3E4?=
 =?us-ascii?Q?3L/OWh41xa8s4eHfdcdMAai7xf/xsQPDdA/zLSfs5L0GHs/GS0n3OizqZVY7?=
 =?us-ascii?Q?ZbSg/h/X3AUerkCw2cANQ3QV2tThqO/GzzPJPQE80w3NFFW4Hj045/ltt0wW?=
 =?us-ascii?Q?LyOCFylu117pLWWmH5kPOPqkeli3rZNHQcx9xKEhjKwhi4PjihbHuN1Qm9BL?=
 =?us-ascii?Q?IMqIFX/04xbg1FFiKVfaulnUMvUYRl13I6yk2OZSuzT0d/Lki4PlopWasXFX?=
 =?us-ascii?Q?O4F1zs6NwQY9CTp+jU1QlUl4mB6dh0PPS4lspkbR7h9vct22+FuDMLFMg4bQ?=
 =?us-ascii?Q?hSC5qDtG+5NePTGTYkMeBi9VTqYPB+CF+BSetr65EUGkl3k1B3s48RrK3ZYC?=
 =?us-ascii?Q?JCeKCwYwn3K3wgBY8k7h2+8908VSyuP9LJuqUJzhSXabxBQ7cXHOEwl/XBwO?=
 =?us-ascii?Q?S1f+YBBAnYlTtXh/TOoUoMJWLdUqRvSgtop/IcsTlYW/PVbHjnFQ7JqSiwcF?=
 =?us-ascii?Q?pwDDozoDM02CDDMsZZiUwKAVlKBMKzyNGMW1pNWC69Bq/MgvyagBBAMV+49c?=
 =?us-ascii?Q?sxWBCJwApweTmFMvmS03tsJ4MgKjNIGPqD6wWcuc1mgo6V5+Y6QwKMzhGvJG?=
 =?us-ascii?Q?lLc2Vb/Wo5fGPAzJUVJLNzFfgc4F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sNcUcmPAgtcbVA8INlNXSN2G9f5hTNet4O9LSTdwhe9PX8U5UT++jFIiaWHP?=
 =?us-ascii?Q?TZFP0Z+q8UoEPaq0vAaVbPfs5794UKa3xtC7/kOL5pSDC6g9mldj60buDEui?=
 =?us-ascii?Q?F0fP3EIJmkLtAfctqsKDPGXhJP4vYaPJCY76y4Lwo+TA66Fw1z+kdCo1tsLx?=
 =?us-ascii?Q?IbmzF2kh/qaMwFjJVfkY4hPKgAlXP5LckiqrVjZztJKjnZxsrxMo/ElMyF7D?=
 =?us-ascii?Q?aLOpZfLvz4aWzCZ43WiClOiMKuy30Rws1NC8ugkyPCxdae6Zv6MDFMQUa5nJ?=
 =?us-ascii?Q?4oD7LI2XZtMD1xPOy2jxMlNZEUbEtUHysfNtMgbtLGB58IKiJqp7b+vu4bD3?=
 =?us-ascii?Q?ksV/Qw7nGiS+M1KX15ZBCvwG6z2LLG8PHfmsS+B4wlZ5GUL5gkcqBTI/jo+f?=
 =?us-ascii?Q?wpFvxlOe0QlRXkONNdinWlfBvFar1ZUGXATDlfTqwTJ+DJR0Ff+OrFO0DUfR?=
 =?us-ascii?Q?yG+IM+FKfK5BM5CvCk+dL79uUGJ9S7IQz0964nKACIQnrgC7W3zDlHuJDzg1?=
 =?us-ascii?Q?0HWEQQY7r27+drGc+ALmz5ZDx9cynADdKKgrE1I/3e66b9nacW35AMN5TIWR?=
 =?us-ascii?Q?5BG+93rk77eIkm8E+tkLYAnGX5hCyvOeMoIrhIo6arAUN/utGGXwOV300Mzx?=
 =?us-ascii?Q?xc3hM6JHp2NaiBlU3T498YXPub0ygO2D1SKFTbiqXTbphSWlGJnisP9kR2EI?=
 =?us-ascii?Q?4FzaphIKLeM46fr70iEt6ihDI/MpZxHp1oOKh0wkam8iiWMJ+JSuMNd2c1BF?=
 =?us-ascii?Q?m8m4YwQ8nTNRz7UBfJAuNI7Dxd9JDIePlELJFvhKunoOh9C+xhTf65SReH/K?=
 =?us-ascii?Q?+KmidvyPhH1xylIjkvPOrpVWRBysghIcwFEzP0oC87BuPbkcm/qZ4UH7s+ON?=
 =?us-ascii?Q?10Vh/BBK+TQZ9YpvfkBUKOlaQDlAukeddeo/lYsEslMSNPN10+kD5H1eWbDN?=
 =?us-ascii?Q?U579VKiELc4zwF7kssK9KeMRe6bKaZgHsIosUyB46Wymmao/fEoS8DmehaKc?=
 =?us-ascii?Q?2tmgyMaD8AcIsN/ld0Nel73SkVJUvTYOqVDNOPXxgAj8qwe5Ggkgk+nHRV5D?=
 =?us-ascii?Q?n0OeUoIPzA0pUED3P8pHvSX/r7JquJ6O9JDtWSgRua3ImYwJDy03w3RnvxC9?=
 =?us-ascii?Q?tf4JpFiasrrF/jDEhX9jTzeOKdHqM2IFgEWgeqT+AfPH7KsxPJ4viY2ncLF2?=
 =?us-ascii?Q?kyWZyzeV8MS1xJWjT0QyAx+dyOrhRci6aVQGqsJ593XOrTP/O8Lu/I7mnebf?=
 =?us-ascii?Q?C/YypSZ5o4o+0CrqlW3D/LMzmgDV5kBdLtjs+013Wa997TtOsPuGE8Yd5r1+?=
 =?us-ascii?Q?3ocbvs6oocK5u8JuB4Fkkr+imCUz/hfyfUYIjVmVp4C7EI/0as9z7PYpHvb+?=
 =?us-ascii?Q?FbdgkKZAxIx7qW36sgRprna9Opmo6n6iT6o/355kEjYbYRZLCRg3KlZcsNIa?=
 =?us-ascii?Q?0B534MdLhs7P1zNOp1Y1Mj1/gRjrtawevhnIv7WuDG9SBDv8Q6JBc8XOpix6?=
 =?us-ascii?Q?LPvk3qZWyHisRcuujxBCBAcnID73AbglE0s3kWzq2uAFt/2MrhDkJRIVqmPj?=
 =?us-ascii?Q?TzVKQ03manxKuxl36wkgOqrL196Pld2+AVPLlA87?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1xlf8SJbdxU3lEimu8SbDNscboMwKej9acJr6vA4n8HLhjzZm8HVAdLBtm6mYl3SkZgrnBaA/mMjcc9rEm/+RoARdhbR1CCazLsUlRHILdQaUWZRofoS3KdPE8FgNM1a8E2PsrORTMxwcKkUAnCNQICFqwZi86SsA+idIJT5tnSTWNxnTymnUh2XXWkbTJ8ndlF/bKrv6F8ljfQOIi688SvR8dhq6XuahUmCVqSelygZBwhqHhD9Cz6vjzPp/ETeS84l2cuTfGlf1hF1RCMKd/VbTmuaIxezSeqnN2UsjTI4d4GB8n7dcqp+W0TOP5DVl/CU/9S4TkhbfkyBqDHCQSxMZjxGVflB/ROUdpNH+jt4ZOLVIPPArqqNc3oIEL9lw6oqkFZEugF3B8oOBzsZb6jgkcwXItYNLzej+EmYGP0yxS3opo4GAMh1ME1au8u0Ltnzw/EwB/Got4kWCdKEcwt6oIqTjAt8I65+wSAQMBLfKD3VYjUXLodxQ1Xtd/u0G+nTVLN+pe+CTixjc3AfbKfsvXdenYycp+QJHvVe6N5RubiaW645g2J4ANKUDi9c6c+tVxGLEG+pgVPzpQQ+LfLjPVVmNRglVkzSUkTWFcA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebabb5a-6d1d-4acb-bfc2-08dd995abfce
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:02:00.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uGnIDx5jWEo29ws2/9MiswbVq0Jr0KhDnGYc5TUC9r7azRvxKiqVqD4aiVaNSqIDzFCYEs2C4JxMoP402cd3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX8TNrJeWoUaE2 jMKspo982jL1j/P4Bt5t1Sh6awSRvvmMDKFrwl1YvCYzjy11aqJl51iN0lGnLKDrtkzC93Fejtc r/LFDEy0tUgZON7t0ob2i5PC5LJ3U1EjFh9rMsuKExruHs7AC/4QDvULlhgwSXkHpTFYJM56VJi
 3Tp5pAblJxkU6d6oiumdPQYFux8Zn/uycSDkWtbdTGUpPRpsg2cmDzMOIb0eCCMV+F6SSKsacu1 2ZK+SpbV67FplsoaIM084XwhntnVj/eMqAwRpbbDU7UMR5gf90PwgmVHCvH8BVqMvEbQhn8FDU4 QSrpGW5eT3DznTgoARP5Xu/UDwVG4R2aS9WGHQuToGI+5mBI4g5jvpISr7kc+54VNLPQjTWna/6
 mqxAIgpzMVA9pzS//Ztnz99emlVyrtSnJOy//+jsBpoKwSlx7M9L5QB9RtBFPTV7ubbzbhTy
X-Proofpoint-ORIG-GUID: UV9oClhV1ZouZjagRFtotZJEiSWZohhu
X-Proofpoint-GUID: UV9oClhV1ZouZjagRFtotZJEiSWZohhu
X-Authority-Analysis: v=2.4 cv=TZKWtQQh c=1 sm=1 tr=0 ts=682f6883 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Ba2wNDKcsvNixC5bMqsA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/skip_lockstat_5.10.x       | 13 ++++++++++
 .../variables/bvar/tst.caller-lockstat.d      | 22 +++++++++++++++++
 .../variables/bvar/tst.caller-lockstat.r      |  1 +
 .../variables/bvar/tst.caller-lockstat.r.p    |  1 +
 .../variables/bvar/tst.caller-lockstat.t      |  3 +++
 .../variables/bvar/tst.caller-lockstat.x      |  1 +
 .../variables/bvar/tst.stackdepth-lockstat.d  | 24 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-lockstat.r  |  1 +
 .../bvar/tst.stackdepth-lockstat.r.p          |  1 +
 .../variables/bvar/tst.stackdepth-lockstat.t  |  3 +++
 .../variables/bvar/tst.stackdepth-lockstat.x  |  1 +
 11 files changed, 71 insertions(+)
 create mode 100755 test/unittest/variables/bvar/skip_lockstat_5.10.x
 create mode 100644 test/unittest/variables/bvar/tst.caller-lockstat.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-lockstat.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-lockstat.r.p
 create mode 100755 test/unittest/variables/bvar/tst.caller-lockstat.t
 create mode 120000 test/unittest/variables/bvar/tst.caller-lockstat.x
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-lockstat.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-lockstat.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p
 create mode 100755 test/unittest/variables/bvar/tst.stackdepth-lockstat.t
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-lockstat.x

diff --git a/test/unittest/variables/bvar/skip_lockstat_5.10.x b/test/unittest/variables/bvar/skip_lockstat_5.10.x
new file mode 100755
index 000000000..146443fd2
--- /dev/null
+++ b/test/unittest/variables/bvar/skip_lockstat_5.10.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -gt 5 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+	exit 0
+fi
+
+echo "lockstat disabled prior to 5.10"
+exit 1
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.d b/test/unittest/variables/bvar/tst.caller-lockstat.d
new file mode 100644
index 000000000..95eb08578
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+lockstat:::*acquire
+/pid == $target/
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
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.r b/test/unittest/variables/bvar/tst.caller-lockstat.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.r.p b/test/unittest/variables/bvar/tst.caller-lockstat.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.t b/test/unittest/variables/bvar/tst.caller-lockstat.t
new file mode 100755
index 000000000..fec0d2715
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.t
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+sleep 10s
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.x b/test/unittest/variables/bvar/tst.caller-lockstat.x
new file mode 120000
index 000000000..539f14255
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.x
@@ -0,0 +1 @@
+skip_lockstat_5.10.x
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.d b/test/unittest/variables/bvar/tst.stackdepth-lockstat.d
new file mode 100644
index 000000000..46f937067
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+lockstat:::*acquire
+/pid == $target/
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
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.r b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.t b/test/unittest/variables/bvar/tst.stackdepth-lockstat.t
new file mode 100755
index 000000000..fec0d2715
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.t
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+sleep 10s
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.x b/test/unittest/variables/bvar/tst.stackdepth-lockstat.x
new file mode 120000
index 000000000..539f14255
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.x
@@ -0,0 +1 @@
+skip_lockstat_5.10.x
\ No newline at end of file
-- 
2.43.5

