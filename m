Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780051CF289
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 05:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730266571; cv=fail; b=WFUt1xLP2QM2/5iQ1/mkv4Naj/YXOqpQqh6y3phX9OOMqi+DU6bUsJqK2l9OKF/dh66LcZFQBDn46c4yfXptYEUodo3vC/WxDwsnbDu0yl9u+10vcPsyI8GDneeEXSgBx/HeYrRCWj7lT5NLIpE8LLBe6k3YVp62Vr2j4hjFxs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730266571; c=relaxed/simple;
	bh=JP2lBmyHUFw+mxRMUT3HtVqdPBM6nddlck04HPuw1as=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i/OooyQFsE0f+t6/iiw2+l5Lfc6FX7/xVkosoMxfBqa4rNnH5f43Ap+l0CKoWl0Q1lCYaqFR31nSuz6DRsZw+lz+NswWIZUdeMe2LPSgf+GsY32+f6vyq2hhAcG5JhiHaqQ+9y6w2cQYGiFKQZOQD3X6M0BFVZfiM3h6263XkRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AWJyKda9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JTCPRLvu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AWJyKda9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JTCPRLvu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1iLfK026271
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 05:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=Pym8dfj/BacpgUFcjivKPK5ZwW8+4Xt1EvjCoZfx484=; b=
	AWJyKda9dpyZClIKp/xRyT0OeV1uvJn7vBTLkkaLVQl8wBx7I+tbi+1Q33LHMtlp
	7rSW69YkSmFwLA2Jqpa/1+6PTqVw0geAZb/8lpMM0aLzoIRC3Aul+k8++DVsOaDE
	TFFYu9MafNjIqnE7SxECUU12oFBA+QcyajQqTKc8gaJHNJ8Xu90Ri49X6XrFkVb3
	FBvm5f7dbqtJFLUxpWQQTBCSdNojlybw2rcmAnin7agpbCmGwTxXGQPFlnFHO3qP
	pzwJttoaDOqwFN9CqnrbY9q1qD9s5AAR0GxMkj6MQc+fy08DzEWKTdM3SY1jXzDe
	+AJIjzE8SyefN03f/JHLDg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqf2d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 05:36:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49U3kbss004210
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 05:36:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2v8ber-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 05:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0vlwzbHb7qSOun7QAjHTXCwMHqGPJTJTz9gIh+yag3ZOEET3MJgLqpJdJxXCVUrbXeswDaSg8lhbpUmaVtgf7UPjN2x7bq1RCjA1GbRArnQn2n82tFGM7d1HSFApv5sLetUlJrfED9XxczXPBuRkp19NLeK5C6n8lMaYN6Qi2UDFx9j2u9uiIGv+RtNOlX8P1g4uGvTzniRV8W5UUk/IGNxO8oTYdEwJtLS4BuDkgePdf7GErtohA3Vrrl1iXNvM47PCMiS02wiV6PUUX9d5nkq9j1n6KQSJqdaBgMHhqky1gSeYiurhYOsN/L3H5+dKae2Cuw1tKwtMOd8zeBVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pym8dfj/BacpgUFcjivKPK5ZwW8+4Xt1EvjCoZfx484=;
 b=DWMFVVqsZ2rgsXL6gWEVe4LuuE+cqOFj0A//O1pHKHonUbfeELyFifNjipwv0DwqWs0jkIO/wjciWQHxawLmy6zkUFRcc9oLOCkX+o7JyeLE2UkzSRyC+h2XRzzBJPlJRbaSIkSfS4BVoRP8uS9PBH0JHOEkWWwVQCbRIS1UowLTwDV13512Gx9NyuxHbQG+TS4wriKi5YhVXpdk7CM3T3/FRGBur7jyNESmTauHKtyGHlOpIlp42pJUz51V9lPVFR8XOV7M462k+365LAUv8ujELlsFNFepziDRSb7Mm4RwSsEVClYrZUGuh16oQJ1ZDjP98WGor8LPRO7V33WJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pym8dfj/BacpgUFcjivKPK5ZwW8+4Xt1EvjCoZfx484=;
 b=JTCPRLvuIJQes68d6oLRsefzAjMlgw+Z9MwDradzGBrJ97qSouSjKBpUUnpa6Dk8vyAogtG8f3DgIVOHGLtQ90vA6567lgK8c5ErbWZp6XrkckYjuqWT6KH5ovr+JXN+pHESVW3vppRXkEKtyPbyZjCiyT4eKV63cdp7bUJwRg8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7634.namprd10.prod.outlook.com (2603:10b6:806:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 05:35:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 05:35:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Disown child pid for cleaner stderr
Date: Wed, 30 Oct 2024 01:35:50 -0400
Message-Id: <20241030053550.5900-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:256::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: c5393f1e-08a0-4ac1-0924-08dcf8a4b876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1+9PPdd1eH7l9p25umb7roSfyAScu0FViMYX3Mtq2qwR1molMp4uYxY0Vq5n?=
 =?us-ascii?Q?OI3B9tEI2tAIaGG7zgu06zOt/s6V0NKviDm3n/sHPfL4s7YrzlkP20q8p/gb?=
 =?us-ascii?Q?yzwd0cSjlPntVWbA1u33LdO/9DD0P1J7Xyobj94eYqT25VNkr8pWbDyWYbto?=
 =?us-ascii?Q?ryHWrKNibFoQnbRUrdaWFIhktiG1UAOBg/XKd5gxA1h5uQ0sJsyUfgKuBrH8?=
 =?us-ascii?Q?9Q+OpHbA6idONMxSaEXV8EdmgydVcv/UXxoRWrDk9qU2T7FsL+KnxOQaJap4?=
 =?us-ascii?Q?hpSAzCdNyo3pHVHhG1/Hd2ICRQABiAOYfKpCCSgIBuFPYiBezp/3r+myxYct?=
 =?us-ascii?Q?yJoDU+9aqjeB0yiXKc9z9dkUG6vdAeWE0Ou2jh2K72RlxK0pXnBK+r/G5KWE?=
 =?us-ascii?Q?H681Cbt5sne4RF0qwYog04/EEhhC5PQqzAOnCUE6pWd++OSnrrIvjZAkVqkr?=
 =?us-ascii?Q?fNmBcguftfDzWfy0I1KoyPRltaGH1bOxcdHRamCtnCOwQd5bo5h3Vr/0bpuF?=
 =?us-ascii?Q?hlTDM/xOf0wvf1aXu0pO1umEkiN0Sv7MzstrrzGKcQ16xOpVNswwMlO9091X?=
 =?us-ascii?Q?Xo+kjMlkCAbKXqrbrURE0hM3KHYXRdcY2S2pJXASlkL4qQ6IwCOY88aXWdiD?=
 =?us-ascii?Q?Fo/uKokASCFnRK/YLFeMo+owv3ZIKB6GCGajdWtp1nie8fD1XGXzuSFAcPBv?=
 =?us-ascii?Q?1hXOa0GeyT+7Tp3dmBB/D7JIQnvv6vMaF2tljuXzAI4DxCLzmXZ3sfUOJzT7?=
 =?us-ascii?Q?Qi/0iILrnO+v2q8GfKFP4GnjhU+zTdqKlavi6eMyJ/X7XLeqPhuzJCCtP6w8?=
 =?us-ascii?Q?6J4p9CFpyXTdVEm0sqPaVSPzmbSoslaMTYDGaWg9hNF2SQ3L+Zz5jgBUEd63?=
 =?us-ascii?Q?Ulid2YetLaFpo7CsxSKASyaV147H3d5hQ7BpINhS82pSMum6cOc51SYVIcg+?=
 =?us-ascii?Q?p+4GfYtP+95VSoSBA0Ik2fkNyYh7PO/f0EuyRei9IFGSMQtA+PRpZpUYMi7Q?=
 =?us-ascii?Q?etMD2gYp+5DgKXtpun0E7Wz6bquREzY/suJA4r1Ia326G73PRzyr3qP9xVku?=
 =?us-ascii?Q?QEcvUp+T9Tt2moHUl2Z0La3dHvN+UbShPFYZofmam+4s2hbAJmwU7Xn7aQFF?=
 =?us-ascii?Q?bjseA2wlAfLbwVSROLiupoXELWg5NZsVcRxzIXAK66V4nybMdCG58h+bCk6S?=
 =?us-ascii?Q?vNzdmk0wHwzQKm8hIdEmHF0uL1RXl/cfWqeSBDwZHBvK/hmLcotUhj/gr+u6?=
 =?us-ascii?Q?9FavkMfZ2aB2cLwenwvZLnmuHZxswvzchWNmOmu/DVSnVNcW4jJt94pGKbZ7?=
 =?us-ascii?Q?E0nua+xpggyZbBPTf+OeOjWF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AGOj2yhfh6ka9mk/uGG/zIDOBq8TlTFXRSlnc/AjvoJloruV09gRd4rU1ct?=
 =?us-ascii?Q?9dTcmM8WYML3IlSxnrQWXb/4bEPctUpbDzyl8E2g+0mqqMp3fqw4YO8/zW08?=
 =?us-ascii?Q?5gBAVe++6RzhYvFGNv2jr160Fr9ASl+o1Pa5IXuHovdeNi9FqtLVbsP8qJ4v?=
 =?us-ascii?Q?c5Qbiah4rwfTy2k28af+N/VNicOmXoZNaiLrgyziEzV7q3ipAfu1DKihaL09?=
 =?us-ascii?Q?odKCKNtSAmHixuK9QwspRJWlyvDsbLPCnNajuXRZsEqBKa3FJuOBQMIR0xcB?=
 =?us-ascii?Q?s514kHyDHDcqtn46DUurJvf1yOJcyFAVbY/8eLbbSwOYsMWXibG464/JySIz?=
 =?us-ascii?Q?c/BLYBc4UKmtFvV2NES2iQCiV2eq3WB6MVf3jnw8sc39QswBj9SLDVSUUVEQ?=
 =?us-ascii?Q?WDdn2FA5FBsHMNVb+vktP+6OSMLV6YaMHDj/YwQO20w9DYa+Ok2XarP1oMhf?=
 =?us-ascii?Q?d0aXj9PDXouXfK8eP8W/7O1dhuYesW0DiIftgviyKSL0lFa7tLc4lSlkoYWz?=
 =?us-ascii?Q?Oh+pV5H/osP46gYyV9x7oRcHsVilvQl7RM0ZJQLMKgMe6rU1Jh+2fY+UVeRR?=
 =?us-ascii?Q?Pr/zPK7w7bIUAIraSC89W5HkxU4om3z5Yr4fYEluwua9gJrUX9HHgUW7L/nd?=
 =?us-ascii?Q?cQbNpl8INSdddQvK/hQVh/CKVwrBZkq+r7j8PhOoVC79/r/k3v53XUiCOfB0?=
 =?us-ascii?Q?9tCw3FPDlPotzaZEJyaG927fKOwgf09li7ZyNfoPAVR7QaAP/BC2+/fYdVHw?=
 =?us-ascii?Q?FmoIvjpoxhWFT1do7oL+NSKrdG1iJTaAKUtYjsZcSHlvRtzkdF0LjI7WH8UF?=
 =?us-ascii?Q?GQ0WHBq1hfIx7Zm5ETGpq7K10ANvggBDY9w9ucr53sLc6dd8Acwn3tJ/5ib0?=
 =?us-ascii?Q?elna8xcoZmhIw9vwBbzCKp+m3oJunLz7mHWHL1hNU0YhelBv7GXrMn2UqA1G?=
 =?us-ascii?Q?UwCRUJBWdWSw9wk2o95luGlX0NhRMrMNn8pzX0TYKlbhW1gBZtG4TgVV4o65?=
 =?us-ascii?Q?P15PfVTgeZawOSoOv4XUdffvBgrN+Vdn5RJgmL+qRCOwxwu30SZ0pVU3Fc6z?=
 =?us-ascii?Q?1cLvBHYgW3wL0jx1lw45+HnPEPYKZgguFozwC5sO4c7sywGzmpvEel4sx7OW?=
 =?us-ascii?Q?ayU9tKSs8zs/75s3GntDa3nslUsjsAw+bkEvNCZgVmvzdhHJPEh8FJNYXJUg?=
 =?us-ascii?Q?/+5sQsU1a/TA5FsGHB9pgx7eNDdmUAHly2DqQxJ4vCzMVGSmqTlzloztsqrg?=
 =?us-ascii?Q?UBPhS3QuiLd9boZxH+wzJLMfEQm4pPoJTR48RF609HAwVZevU5kRBkdW3NyE?=
 =?us-ascii?Q?63Uiy1vLf8M0sY0tmTrYrI74zKZFIdZcFz43xeiJHT3nU4fBlk9Ob5xo4rf5?=
 =?us-ascii?Q?Gnc8I/veb3HTERiFI0s8Ri55cAQfYgx9kKR9dj1yEJ56Q+qACvi0vT4Pvs2Z?=
 =?us-ascii?Q?/+vNNw8vl0mC4xma2vMwgRCLvY+L4MGWEkcvW1yP0ArD6YYH8O2NkOBf5cUx?=
 =?us-ascii?Q?h55R/DQt3DTIxSuKATxlqEOLU+k8+lmYe/wUlx0lKryC0giF3Lck71DEvtV6?=
 =?us-ascii?Q?LJLk4dwZ/Z49BqHvYQ3ssGTDEpqcjNbgaTYeKCWT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iwymR18al7z8IQNKWPHx4xtnp6N+s8gzgY16FvlhF2Li2kESu2Cb97dVzp7poEnNSgy3HhUn+j/Lab5+xg9hE4rpyiNkKBzmdIeTbuMDhE8/AMZzoj5DGq3VcPrtKEurBgxwXVOaAPGgkMVhvVJArWhTbTvZh02NpRMHc+86Kwr8InPcL4XUBIpk6e0e3wkmF5DfJ/aW2/N7jNXhEx8nZbSBriqrEHo1i1ryieVxP9nWmuDyV6W3eIk52LMFx9UseaxXcaCbUBAzEAa1JXwdkGMKo2FmKDqvMk1MUVys513gnUdr6YIBgpUD4Y6VP4uXEuBTgr61Lj075BuIwW3gIiyLOAsbT69goudpH/lqnFmem4sQF5+tVWJjVTEhOFUE7KU8MLye5juE032jxrCvI3ZQ6GecCW/pmH2TOJ/lZ3SOK0Y/aIs/99vBtku/NF4B3KsUpDTr95MrzG1iFEU19qjbzno+NNEGiHiL4BAXvYElv39iB60XYNm0/AdR5en+ZpuKEWGxya1Pn0dKY7g1ju2hb1bTDyb6N9ehm2IgqoqPGHd0u5ULRbRRowPllsMP5lzwMMhK+YFgbnjYI+rtQ+Uw8jhiPz8ISL3GW62Cc1c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5393f1e-08a0-4ac1-0924-08dcf8a4b876
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 05:35:53.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8uUNy3P0LybMtEtTHWj7W5WHSW37e4yJzK+IPudGJJRZkzTGX3TmEnCVTBuaRi69W+FwGHz2RqEycFIco9m+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_02,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300041
X-Proofpoint-GUID: H6-UlDDrZ6KWWEmj1iZCa7bfP7ztnzWR
X-Proofpoint-ORIG-GUID: H6-UlDDrZ6KWWEmj1iZCa7bfP7ztnzWR

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.nusdtprobes.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index 50f18a6ca..4b5050ff9 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -121,6 +121,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
 		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
 			./main &
 			pids[$immbr]=$!
+			disown %+
 			for j in `seq 0 9`; do
 				echo testprov${pids[$immbr]} main main foo$j >> check.txt
 			done
-- 
2.43.5

