Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918325394C
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 18:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754419440; cv=fail; b=UpheV1TkzJmDF+FOuBnnkiHZJPsJpBFEit4QxWE2Uuhnj30KFXQir2ebCGQlj8rnahitCeRWYoDEvaRUIiPXS4xsNPZSbRNIrJrMsX7tA1vUNQp35gx6YdSt7SAHUKD0Zm/4AErAvptwg4dQ+cl+0u3n5bkoXVR+jd1an0GMDao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754419440; c=relaxed/simple;
	bh=yySgEdhIxVVz4t6wOgz5FnaRiTULYyeyfCwZabLLSLY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QuujMPpu40Ff9ZXtbFQVxxF/bcXOuI5x47lU5Fd4d8qZ+ENe+oex2/3BRQRbZGYHmygIP54XBx/PmQM0MMbLMvwcLNmdE+qdzfkkykdhQpbCCSfLEazgtm05n+8vMTPK6ZGImJEW5MlmBE4kkweIyeTKrda6I5paumdWdQgfExQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BSXdN4aR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rCugRbtp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BSXdN4aR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rCugRbtp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575Ig83g025939
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=2nMs+S+c6JSzSbHRYZLFOOXqy141vHfKi+RNhvfIpkY=; b=
	BSXdN4aR9jaf0g6V/OCww26e8yxBb6CDVeZeYL4nAoHnuc6SeDKhAIViA6S8CKSr
	Ln+sEQTzcIYHh2V8gGNeFrVbd/os0nM27B4ZxnEXYGZxHdpmQipG1Ej8ruDm01FL
	zrBA6OgRqkW5fxrZk3Mk/5dAVBgDL1uUmQGDQ03t1e7JyHC3L63eSjSquiYR0lFi
	/+c9I9cjoPcqyutNX1Ror0klvrGzE10+F9zj98Ugcg8C4AlxYvMDOWjz2GAX2FbW
	LNCWD5q2THd8tLnXGQlhaWZ8HGgnn3vJ8Ry0ew0FXrY5Y0nz2hQftg7GrTSeumqI
	BLHmJ/9yiJl5Zhtuje+XJg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf02ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:43:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I46vU028766
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:43:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk1d03-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct/IQGlgu0hgRa86HtjT5mDt38iEEHT57dfDeRUw+wxvtO0espRByi34+YbYoPbjRlcEXv8cjzB9ckK9qAU/rNo7CQJUERNpxq1e7Wb/GhkaQq/verrNg8QggGBnKS3TDnSf1TYtMqLxUGk4XTQ6NwQ6D41jXMGCe4bUOwrJEGFeSXUc7VWV/Vr9YbbaSXpXRYNUYH2f7UZoYdtjIOn5SYzBb0/APX4V4C8UrG8CPQcg3QDRu/Oim2EXB4q2FY+bZuRYsurqBoWFxSWV3n9Tqo9C+HvHY1pwCTmPePkpBLtbXe+dcgWfZcX2pCmQMGGWVk32GcQPGwd6ziG3Wn1eSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nMs+S+c6JSzSbHRYZLFOOXqy141vHfKi+RNhvfIpkY=;
 b=GNf3uBvSrphgyFSStgjUDMxhFKwVQtvgSnAAWqYSDX9nRjg5sta9gt0UWB+KQR97rAoLK4s1XGnPTWBRm6CxCSkm6irKKIO2+GLgqaF/uU1/3YQJKC9XI9xWHrdN4pcz1zxz/WSv+eRc+I2tDaRpdACCuoXIAz02XkZCrAKOApKa11khPYU3C1aZAbjzkeJy64O013KO6MNB5qlZqz4CBP9fjRuxFWgkgR7K6ecActRYAPiAvQ69C/xdhSsEKANBzGbsiotJheV4J2gfssyogJ3wnwJ/atyL9BKbxyfm5pfsGpBasH/UuWK5UyazsNcSUR9E6fWWEh9z8bmgw9nBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nMs+S+c6JSzSbHRYZLFOOXqy141vHfKi+RNhvfIpkY=;
 b=rCugRbtpXEv7yJpBvd5KNacPHzvn54/cU4iwDiq37RXf0GcdwpStBKpj/iOh/UEQn/tURnLAcpXDoR42Fvhq96aLFdXcCKut+UATTsbhJ8IDaGk2PvvDNHaY1mYl9XHX11kjhob0zh9q6/haEqWA3aE7Bc+skyViuOlatxrfNsM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6107.namprd10.prod.outlook.com (2603:10b6:510:1f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 18:43:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 18:43:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Fix tstring_ternary_nested .r file
Date: Tue,  5 Aug 2025 14:43:50 -0400
Message-Id: <20250805184350.18391-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: e211a88c-9940-44bd-ce06-08ddd4500688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4kmoehwyNzF5xEMsY4fwqrcDSM9N6+MiMMgjfMIWb5sVBRJ7sq0BNpmYtnkr?=
 =?us-ascii?Q?sPAjNdFO010JbrgQA3U181LIpFziymMoKtYuEI8DQONG0PF2DDzMYVWFiRn9?=
 =?us-ascii?Q?RBSUkReYUjcQPxTTLil5v0B6nCpCJSybjBczZ8KTHT9X7e+uHJ0ej7093hJp?=
 =?us-ascii?Q?2LldFUXQHDOImHO3fkz2s4A8OBp8V8gPxA9IdUL1YL6lo+/bqhiklcZMgMMk?=
 =?us-ascii?Q?xX4NtGWkZObRrsNHFLQZv66GCwd+K0NzfhjaOO2+wYMOPlO3X4mZmfbArHL0?=
 =?us-ascii?Q?/z09OODA87/W4X/n2f19tzl5CMGV4O7VH0VBfMVABpktWyZcjfsFYPT3vx3e?=
 =?us-ascii?Q?R/NAz5e41V5VV7nazlZdZK1CK3UurP9ac0l2aURBNx+DMkHGs5ZEGtXP9agb?=
 =?us-ascii?Q?mppQ9T6W8fTWuR4e2SGGkMHsXpvYHrMKhtYTlQAiFcEVTmk+L1Uxd6Sv2t25?=
 =?us-ascii?Q?hHCjX5ELCOpfeSmb5zVWachD7/cKbZGzvlbyN2k83c4OmKMLp+D/vt0NtacZ?=
 =?us-ascii?Q?ss55Dc3LszQv4jZF6mZeeP2KMMghg7yuGUS2fmC68QgxUf1TpFrE++eYWmKZ?=
 =?us-ascii?Q?kmJScXpVKkxKg4x/CG5C8yW++m2kmeQHldW3Bh0s/RyXqdmhDe8ZsIi5w2zs?=
 =?us-ascii?Q?vSzh/LIcTHPoQKRi+zCoAVjJ0q26f9J92i7tdFE7uvtk1fUHGjxvh84MXkG9?=
 =?us-ascii?Q?Hknb+hhqqJdtha10vr5Fw/+51dEY36/pXSM9QKO3tO13vRJvMVbMpt/d2HFR?=
 =?us-ascii?Q?eb3Kc5/MFgT2kPVO5KcPPcVOteMKFRLVFhucGLxk7XTM6g6SQt1ruc3kOu/v?=
 =?us-ascii?Q?o42BYw9REWDtGxmeBYEMZt+UyH0M35GMzvZ2ODXOZYR1OAwuhPcjuUVRjaZ+?=
 =?us-ascii?Q?fMbbyak7/qESqdQj5YpV45sV8SkWi77LleQ2l8RD0L6j+WJ4sBv3UchIzekY?=
 =?us-ascii?Q?VfDkTxJOIJN6cc/o/Cntg/E42glP9X4BTjHe8T3p2pPrnHyYFLbyZOjpP56n?=
 =?us-ascii?Q?1jzLSQrZKpqcOC95vp5VKvbgBwahqJ9jZvGjv7e3B7/J7U4SyLM1sfG1yntN?=
 =?us-ascii?Q?3e/DbqY5EjFHVasSlJYYltzuwfl/KW0SqygdNAUxfiA85mI53E3R6UyB4ewK?=
 =?us-ascii?Q?4Ig08EoWYYZfbrHq0Gapuy2Se1l0qQQlp10rYuguQ22FtcpU/CZy++AThhgR?=
 =?us-ascii?Q?rgZ4IH94bDRvbIvT/hy+ZSjWoZQbqn5Qj2CUElnzwK4ky38UqUP8IZA1Dqro?=
 =?us-ascii?Q?U/80iCp0KLFAJCA/lWBTXAy6+VQB8AOOdbSUyCbhAnTdsHzaxmtIneC4zUOz?=
 =?us-ascii?Q?6TI8+wUSOsPRfMVx7BQPuWECvQe0btmJyOA9QuIQd8rfb+wTJeWXdrnTaYcc?=
 =?us-ascii?Q?ambPBb437cc361hHwcBiU5viH23beC5+RmL/BeMkewNp/uYtUEYfrtKPBcZz?=
 =?us-ascii?Q?TIdjwQVX9WU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RmAxp4OOArHYXrZIjp2edDaQ1KPzv3vyG+wcvMBhVmo9wPrAsczqoNmXtyO1?=
 =?us-ascii?Q?dgOwC2zjhY5TPa1jYJfwN7OU6e3TnnkQdGtDrCgsHt4TDC2kfnxEKFc6tXBi?=
 =?us-ascii?Q?Kg0i3QGG+Qx56mq3M5vlbtR28piRLXWfog7UAE8RsF9KqU85nZ/vXNcn43yq?=
 =?us-ascii?Q?bryrh4tngol+l8RaJCn6PoBRAroQhGHyzbt+fmsePyx2BKTcQUToGR6QxgEM?=
 =?us-ascii?Q?B9NLr8LuL3iYi5/GcSsiAg/SGxXdhd3ERYFP/P20OLO7TB/M5MXj5HTT9gDN?=
 =?us-ascii?Q?vWk3MRAOeX8nlsY/k0AhpfcPhl86ggJPPqBgYrg5WUQ7pQElitBMtzTABD+E?=
 =?us-ascii?Q?3Zx9m1OjrjheC84eYGbfUiyJxU+v6YzoRRbeMKIsifGZvDiPz1FpkBg3aA7e?=
 =?us-ascii?Q?SdrOhumQhuNWAckhRfPglDSC3qJDPleHL5jFXy7XG7t0GmzcPmGPuKwchvvZ?=
 =?us-ascii?Q?tnkwnJLCd9Bid9ESulMj7e2cTSz0YdxiT1nzS2F5cMNeh4RIITD6Vj4PxTPg?=
 =?us-ascii?Q?6ev1oacW6Vhltn7Y8dUvLmRTmiTjCkkG6Qav39c98rU9SsB/EVB8Dsd9N52d?=
 =?us-ascii?Q?xRX+EUiQOQoUg3Bsios7ovFHWgQK0DUWSjUimSDQMY8EaBPga1yeLMSVlr8k?=
 =?us-ascii?Q?SY2MHa/d692bmK1Zns7SUeBRfyMO6uSRRsE4wfNRa9s7eUShIVxGAFeSVjnY?=
 =?us-ascii?Q?0q4YHkY//4A1kwb/PuNLGGrRtE/vYJrifsryrOd0Y7NSddOXDC01p9s0d9q9?=
 =?us-ascii?Q?GPm8izB0zP8d8bmwlTHQIkBpuvQVV+rMYFhG9mTrapNnw8dvjIWZqALvmfyB?=
 =?us-ascii?Q?IP7bA/UEWiyOBUwP9Hh3Ix0NUkNsA0Kf19MmZgDfrstKTQk636pJvy4UvoC6?=
 =?us-ascii?Q?wITp+3062uZrz4Ne5mVCdbyQA0/ZLSKgFqPfPj3IlOoW3Z2kJZPb+00fyw5d?=
 =?us-ascii?Q?N+OE5ax4G2CoaNtsLaZeSxGz/mDnl9cNkkjBwBr69LHeoDTKthQW/THbmrZ3?=
 =?us-ascii?Q?oP1EnEH2tZdRl1L5l4m7Enu/YlU0U6C1TAvCta/reywqWU/rfBlW7QgH2Upu?=
 =?us-ascii?Q?nkR5qY2XLp+bFbQLqkuH5WyFQkuwS5Li8NaWm+hlbWvAKx3tKag5uenDAXY6?=
 =?us-ascii?Q?06V/rodqvWBTPk/zRH4Tkx0NvaMg2A/r/bRPj7z+EzAqvyx7JyRYzAlWmUph?=
 =?us-ascii?Q?giSpnN76IqzlUapJ9RVa7Z2YUksk+abLiX3d9tbnpwof5vI5P6/Vv1xvx7db?=
 =?us-ascii?Q?b0DA0M9G05E6hn/yJIJ5m6SzJ0sHYVla9UPHliX18NdGzN0DjI3GKOSfktSq?=
 =?us-ascii?Q?w0/slJ4EqdbO3sRoPriqjU+clL4mLtDmZWkcFE67AE17MoLNZ/mF7/pJn0aS?=
 =?us-ascii?Q?fVSUFgks2UycVtAAQT1sWe371RfqkxmPtxVlKle6a6dAuNEjAoKnFbrtQ3aY?=
 =?us-ascii?Q?j8BKeFAopqD/3gTa0OJACJSjt37pkN+e7xhu1B2nnkUTWxxp4V2X1Qln4Q0u?=
 =?us-ascii?Q?BfNDgtILujgOuUudsyKHcTqJJ/0X4A4Cp36iNRqfdHQuSnLGeYEZj8Opx5Qn?=
 =?us-ascii?Q?YgkM0+RYp6ypzBovA9M/0K32jLj0e/m0PeVTx7Jn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AZ6oCVEgdqs0ge/tLJgleiJBXp6WFceD1cpZZFt+1f4t0OYkdvykylXOJbdFEuyZpekZzfe+pw/0GASDpmrkcjwOdMjJr5utaBvQQ1v6U48EyrLLCVdmjk5q0ucl/JEQ5+APEh3gFDd4L/J0uZkS3oXm14zkf2BJXjNFdRY5dSabhRxONLjq2HUzoahDFp8PI0rP7dFkotO7kaYK21p8UB1RbVLHVckAms2Cnsnosg70i8ROI3bUZXany6qQri1OXG8EoW3MSW3LqyM44ShZ9acwk29JWHh76dd5QFAYuga+/ZNwGj7Jw4UfV5+QJ8oJi+CeuqkkbVfcxrqp4KO1chtDtSixYRjZ8DrHx++fDLYJ7UA0G1p/Rwckc243mrSHyFB6uK0UXLnD14/TCzukXX0VVFCZCnezmT6iA0n8O+ukYzs9XcrR6jI0OpkumQiLrhsugTQb9105wpuPmx728nyNw6nNfauSb7MZxgl04W9bUyX0cdhhUYBdWeagfUJml/F1OGwssxcssppxzdkTDOFU8rPgqaHSP0Eq6Bg3myK6rCQB2HtSVK9lilYTSBTnBFKzIZmikWe4EztwHYpqADNr/BqUgBf5n5OxT8QYkls=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e211a88c-9940-44bd-ce06-08ddd4500688
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:43:52.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoOFhKVjn20jCnLUKXLjjSjOJYd1D9XAYm5mm/EDVCMh2/IIUZuipykFFWoeY4TnxvOfaoy4W0lfzt4roX1aDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6107
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050132
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMiBTYWx0ZWRfX7X7tb2vdnwi0
 EmWrARQd3NKe3u5ywdtYkeJq98v8xbl+uSZyRhrORyQh9PbjfqnCOl3GB14kV5w5zusxEAfuemq
 E51R33wwqve+LaOkQSmpjnckVONXa0XzVknmjN2Mw6TGoXX5L0yD0FxNpi/uDJQn0QgD8Zrs9yu
 B+cVMfFBVKp9a0rhipwCZRcgxxA+Y6u4MQOPs3FikT47fPdsG1KVHvkohjhpVo51A3b6WPIhVBu
 lv4eI+hs0tWmXbDuevhl8+Elnz+iMaL1ZAz0Xgl/Eo2rFfYygaCjm9bu7WY9vnKXLNdqnV7t73j
 IPw4vurKNDftc3eq0Q701klVL7ZtSbQHcERlXAe2hiX/X8r5tEDvl1NrJjNE2sT1/y4HKlwK277
 drrsRcQOxv/3gtbu2ZO3JQnJUAGc2wGD5VzHKJKzNOmrwjKNGrxN11W4E9xCdfTbKH0pw1UU
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=689250ed cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lg_x7hz7yPBw7kvKK7YA:9
X-Proofpoint-ORIG-GUID: zTUrMToZUjX_zzcH_xdBKFecbjDVAfku
X-Proofpoint-GUID: zTUrMToZUjX_zzcH_xdBKFecbjDVAfku

From: Eugene Loh <eugene.loh@oracle.com>

In commit 5b20226bc ("cg: optimize ternary expressions for strings"),
new tests were added.  Fix the apparent typo that is in one of them.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/codegen/tst.tstring_ternary_nested.r | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.r b/test/unittest/codegen/tst.tstring_ternary_nested.r
index 9c70ea196..1ab56ba84 100644
--- a/test/unittest/codegen/tst.tstring_ternary_nested.r
+++ b/test/unittest/codegen/tst.tstring_ternary_nested.r
@@ -1 +1 @@
-ucwxyz
+uvwxyz
-- 
2.43.5

