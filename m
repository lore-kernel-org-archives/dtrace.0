Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4887E110
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503691; cv=fail; b=qjM4fcElRrgd94KaDHEYUwFgQYyRpBZDLNLNYGm/wv1zudFd+Ck5EKN9VlhblTYRLoSAWvpirMes9XuiEMN5TuopdYo5RhbOxO6wEGMgXsL/8aXDJpkGRXeIg4tut+04RNr0PE3nwkIKAok6Ph+WXS6olQ71TvWmBtteS3slUOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503691; c=relaxed/simple;
	bh=Sp1yMlK6CDwB/e+CKkUFQJ0QNQBwIWECZ/S01rNflIE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hm8kvj9pY4pG3cQ1dnNAdW1SgiIQT/pDmGA/jQ7RYa8NcDtbvwZt6bJg2kf1Zvo0CQv2DtQKsJQkXgdqRkpzamyVa6fpELe23tWy7O6rmF66ZXF2bIpIgfahCk34rha4jZCgMZF6kbHG5pH7k7dZ3q9S3Ni7P1a7ab9ZR24fIxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZBoSHJOe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pb6t4Ma4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZBoSHJOe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pb6t4Ma4"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F1vn1M031424
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 04:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=M4wKqXemViqqEsdTb0s70g/ZEmJ3wwS7SQxZWw9Ya4M=; b=
	ZBoSHJOeH4+vTUb7uENdwguZQg/X+9K4e7EIczILkX0ynjj03bJIw7Q2oeM9xACA
	arEOAOPvtD76D4jxQdW1H0C18rVyweFy0jgJjkSNFgIjMnfctCxaOt2J2dlf+mNO
	zod8z56YmD+oa6kWwKAvtGccL2kL5DaWta1j2/tF/UkZIGQMB5Pzf3hjtXd2Uobk
	vc3kZltKurhPL377e7YSUpjvjCz955mGSaUC88zGXYwx156B+iCbPWTlKfhcYVB7
	TCEEUqEL5V3aCSaL1GfUmTo2KImUd0juQE59ApHP7kiMnltVxUUn3GTzwae454j/
	WZAQqQL9MID8+gf4xgM80g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdnc5qtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 04:48:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2CqUI037869
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 04:48:07 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpfuy9k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 04:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0RQMNqckrnfK6p6cX/4P+jzJP5vuxIGywuoEY7lFQNL236k/ZQm0P3ixF/HFAFshroG64Cufj5KwOKya4IfaCkmHDBJ69Z+jUunFdQY5XchgGk0lxCmxzLtdRmDRO+IDRAHhQJEUsqTQj/xZT0G4X+IB4E1y3SWPMFnum7D5KYX7TISyUGzLuY+uucTgtRiqRYTRw60n8kzDWJ4011bElXeNwhj8cnvkUnuUZw2LoOrAw1A0oIYRCS5dRaXLJSm83OAyOjcgs/ls5ZdSSCICovZUA05k6wydTMbqy6S52Dx6d4Cd0L57hSBLW2y6j++zAssl65vRrio5OqRf9Ny5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4wKqXemViqqEsdTb0s70g/ZEmJ3wwS7SQxZWw9Ya4M=;
 b=bhSeE3GwYq4GTgylJqH/Bs//gQlouJmX5WGtZ4WR77dl6GPzYoOh1L+HlpSRPong2uu9EnytKHlOVYDc3mz+55NsKs3Zb0JP8TmaSNO4Q1dq7u3197V6dDysXLa7tAMH87ski6qIVb5ddjupNgV5ssCfQFsrnIiUCi8dzHI+pF+F2GfH8pDmW5gX9NweLcZRfDcnro/eNOFZWrCllf8oOPAzvwCO3sS29Z7j61Wf4j56SK2QPAR1OirdPevz1oDbJPo/hv/GxQWv+qy74mUZfI/o/oi4Shu5yfdYP3KCl4hhC8U3NlVS2x/Z8gW6+xL7vOtSJ2T8QQhlr0nVLV8kSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4wKqXemViqqEsdTb0s70g/ZEmJ3wwS7SQxZWw9Ya4M=;
 b=pb6t4Ma4SYwUXKdhhxrd8cD2pnT7uh1efVtxGBlXI8Zm2JiI7/p+5Ubg46I4HiVQkaBPPWOwchxNUf6wTufjWR/YmPUNy9aMCqx+INUY9wUZqC4ggj6fP1VOxb/WGo6+CxUgDxZhWs2+evKlJ43Vrq8+5lz3kRm2PH41+NjQs4s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4479.namprd10.prod.outlook.com (2603:10b6:a03:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 04:47:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 04:47:54 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Set lockmem limit before checking BPF helper functions
Date: Wed, 15 Oct 2025 00:47:52 -0400
Message-Id: <20251015044752.3919-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bef948f-017f-4625-f362-08de0ba60120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WRZp5va2XvRPuawtyCthcVKRns34MKm82smJWEGb0sVKLS2ovx4q+4duKrm4?=
 =?us-ascii?Q?yo9wfHwf54kTvHIb5DmDDhCf5sivKLycjpuLggGy9E1/WTYd5auq3OIvMkCN?=
 =?us-ascii?Q?djeTP+4QZEcj72PXpLkfPe5N9KrhFfX7Q0RX5V97s+TpyLqOV0O8jEl9trY9?=
 =?us-ascii?Q?sem9crUeZVzdpKnS1mOrl4QUv4zF0s8WTaHH4TMmNDXtJl5ay484O7NZ+T/e?=
 =?us-ascii?Q?6KDMmzvBweW9Hur4u/wQaje2GqiHXycpd8vL2DblNpf4R7LbER4mIuetw70W?=
 =?us-ascii?Q?mssAAdRyeche4Vy1gaRz8vX27SMLDfXahf0kleEMW1jm8rdThARhDL/QP5qk?=
 =?us-ascii?Q?cRwQM56MmRNtWGvX9DKtKG2doi/P/xD5ACbKU4H4a4ezxsg5I990di024szL?=
 =?us-ascii?Q?3fcQcN4e721UmVXgoEuZ9XCjAq6jRqTDPWSxC9dUE4mB9jCaT6EvzAhMebZ3?=
 =?us-ascii?Q?72XAxNZcTAQj/6KNtWOoR0pOzEZqR0sXwRh/PfpeHCv6lRRUuC8AG3X3PJ6r?=
 =?us-ascii?Q?P+E40wWA53YhDsofAaqqg1f09WUYFC3yACuc0zASIlmDYfDmdHVrB8DCYUT7?=
 =?us-ascii?Q?k4Zy+2jl18aAPhxa3ZUAwj6KZKMAbhJXDfuf3mOYpz8kZW6kvSkrflo7SGAt?=
 =?us-ascii?Q?Yk4hpUGicYMraBez9++btvWzCdjylpy/OwaNrWnMaVyUSxTJv9aelLZEcpDg?=
 =?us-ascii?Q?DLbPAxDI4r2BW+A0q3RHnoTgPJ9GK2zIZvaNtW19dQbWLTdSixNKY1oeEtn2?=
 =?us-ascii?Q?rwDeaFibt9h5AiSLBp805Cv5UNpow49xdUEaz70XI76r9owtGNdfB91XCOz2?=
 =?us-ascii?Q?hi/xYHH85CGjP7JB1mv+cOWZ4BX8q/epgr2/rMDALApICQHFhwbfSJjYUUtV?=
 =?us-ascii?Q?E4XnAcXnywx0jxS/RCz08zQ4WAw75iKmLcEUc4WvwPeA2LvcDe9x77TCzMyD?=
 =?us-ascii?Q?5xB4fOImNUr43+JDZozns2SW1yl04i/ajTvYt0kchTKZRpcrj4uFYcwFQKYn?=
 =?us-ascii?Q?eWT/d0xUGH727/PkJB64b2d4rmmjF2I8yz5Ub3O3DLRt8hnRN12aqPI6OfYg?=
 =?us-ascii?Q?WOTBE5y/JiXKBR8YWGyHroM5BC0BllLhn1nXDro+psSQIvM1wwjaYs5xISlR?=
 =?us-ascii?Q?f4UciqSeG8sHCPIPrb1eniZTiBA47Ak2BcXwq598JCTihUndWpgu/KIChb81?=
 =?us-ascii?Q?rv5nM8ZB/WooMCZzrqusqZuazKQCYK6qDTAIXCcmhLKrm6tNGYK5V6ThR2MN?=
 =?us-ascii?Q?lnRpPSD8jokDQA+zEBB1QuO9cM30vqtU4zqk0NxQS5M19qndxulfinHMmM3V?=
 =?us-ascii?Q?zrEjSvXPMr73mhhNoy/M0QMGVcpid8tnaugFypLyxyoGNM9BGjZAs9KOp7m3?=
 =?us-ascii?Q?Z2VWa74Rg/m7berfquy3r4M/9/64ngCCrFS/pYrhNHD01z0p8YkzYFd0FaTA?=
 =?us-ascii?Q?228uXGyGom7QViD5/2tWbZbNOGj/SDs60LEEv6okKNJK2fT/nwGF7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOHjUoWp0f3DAVbHCm7ZofT7T1sruIkd7GZwWtdUfnbFvRHO/vVaJNPRi5u2?=
 =?us-ascii?Q?74C5cj9n/6CdThHszqoWZl1ZiM2dnkyh5OWjPOb0H7SiX+T6LKYqaQzmQZgh?=
 =?us-ascii?Q?Jwh0euRwaIADq1Xj+x1zOIo2jC0LTC02rblbx+kDLkG3aXEtlHuiTK1n+ovS?=
 =?us-ascii?Q?4UYtqrawef8DUZizFQyQODzB1PP5bpgAK+W8ES8lVyrzQDJ+UBF+DXY72Lnz?=
 =?us-ascii?Q?VlJ3HnDvTaR6AtUZWoQM4HDBTS3SXm9sQS9CoeSfnW7DVz6DVWOsCtTLWekK?=
 =?us-ascii?Q?Nt9sN/poZVzZkfnX8Y47TY2Urnqn7lY2tTKl0mfm6aHrDBXoTks3S3Foor14?=
 =?us-ascii?Q?xHQbCD4f6ehkOw2KZUc2eQkOtxhlxuVXKGD8oVzaz42l1Wc1RRK+7AQ4LNAE?=
 =?us-ascii?Q?i2qESB7qiST2yvPR30NMxdYR8211xBuO/QlMHj5qwIB5hMlXN8FPEpNa61eS?=
 =?us-ascii?Q?c28zYmDvi+iadvfPHKSGE+xbk1vwSyXD4/toHAWVBrbP9j+IFdcz3LuMWCYD?=
 =?us-ascii?Q?9Xhv1QlBaxiHrQRCZ/SFDJX1J64iYz55SKfaISh0vorKkjYy3I/1V3Xd+xsl?=
 =?us-ascii?Q?Yu+rtadCUeFhN+3OJt/9E7UcdY0wBwYUKmDYzK7f9YphP+9qpBKup1YCrk51?=
 =?us-ascii?Q?u+Gn5Zmdul1CVyM1zofzitA5gOV1T6J6jzFLtm248yUfwco4t7KZIZLgq45T?=
 =?us-ascii?Q?g/TdtdzLSIGCTUYMJoxplpbFjpG5tQEZEyB90f5yyDRCLM2RVPETiuQGvx3E?=
 =?us-ascii?Q?/jy4xQHgIIZlZCStHxJKlxGQBlRmYI2mqmdt+ryylSosXSIPQBMcnj4HuSTF?=
 =?us-ascii?Q?YUCLfWOfLoiI3akUrF4lJXEiIJgGt/97KKz3Pcz4hHHSlc3GdFTNIXAyDHKW?=
 =?us-ascii?Q?HGpg1w+IjnqcEZxmmXV0f4TvqUJ3Opan7tZR1y+PvB2+5HLBZVRQFDWlyEbp?=
 =?us-ascii?Q?1buOVjCiXxC0yhw9bwhnYg5xRYXh0szqDtBd5JQCKKVK9vbzZhfZgHHeRTIk?=
 =?us-ascii?Q?OxIAD8Wd85rcArXsYre6DlN/xgHujpAvnXcrUatrS0lqLOrWwjUhDqqS6iEd?=
 =?us-ascii?Q?DBDc6Dm4RBqDU3DFMCVBRpek41AhaWTOO0tdkGcq2DDwNHzn+ZfBAOzzVhOY?=
 =?us-ascii?Q?hJ730A6RNlRsybCg8VEWFDw84hLlmYIyGCfLyhW7wNyH6gocjH+meQ40fFII?=
 =?us-ascii?Q?1RY+cr269HYu+1JLmfyORWS9QrTe568Ne4IcAgkmmfpSbOSI1SwWmzxVG+3+?=
 =?us-ascii?Q?SpO5Y1Iu6z4bs9dsN3dLklmeLtDg0FdyQ+3QzhN2n33gp3CVwbHU+VQAhlBt?=
 =?us-ascii?Q?+5G/R1HXEbo+3iO/yQ5Qphn96uQssbL4ozmUXdzOHHv11kprK3RR90c1eJhg?=
 =?us-ascii?Q?KODFfIjD0GrTGuJZzC7jx6QXAl9mdmoDVCsO1h+yla0CTpk4zyupOzmyuyZV?=
 =?us-ascii?Q?7bTd7cUNSGa5Xd/L4HSp50c8wpXSanbD/noclNKc/4uftBu2AiADvYYyEAgl?=
 =?us-ascii?Q?K2ulb4GegrLiFKqofqUmqeT/ZXEwFARBcqX85TkbzswRQl1htRJDUCM3y0p2?=
 =?us-ascii?Q?iVca84lr2BrCu1RtSER1LJ76dJp4GqgzIiDuPm6p?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CO8PFLAe7xkQ/SFusJvWjUHpu8tpFf8U7oMiKmbLGvvYF/2kUTYAXe1t2OpOvULUVIVTUlOZV/41fqE+BxEZjZxs+QPBnhJ0gEYL8Cm6qV1+bS01lSWSg+zVgqigruzOD/UF6K/XTM8BnarUA5W0fC7+VfQ9wzByoutQoG7fTeQA64kTeZEhUNMkxtj5WANDVoe9iIyFnBD/lxunQG7ztUY+nQk1NqX7Yhre+5HXHMDEWrHs+E7PwJBYcr8FYpIQgITMJvhjYijpquLcX44BV91u8C+APZtaLpuhAntg21OU2UYxAoERWivR9DgPuPco5PpE1vxHOmlVqX4/49Zei4qYqDpnDwaXPc+qMYP/VLmUEoRk/lac7Yok43018xPdaKSkNNQSQh2cibYNuEfXPz9J8m5xseWJYC2l1r0pgT/FjRwb/rEx+iQxhv4YPrkl05suX0o4cpOR6MqaraJmJOMoWUYRQjtDJrXrajHcGv3fbGXxSyKis8Xsd3yKI4FsK4FQDxdov3zKVKFklV9PtEx6cqnx+b01RHgz2Txx2eDKFq7k32ms+Q2jugsCi59GgSWsAxZa2OTI521x1SFjQObMh8BmKLMhwLJjVeQFYaQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bef948f-017f-4625-f362-08de0ba60120
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 04:47:54.6747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIdupaJFXEkfzbfj7ysKi03VLbN2b1sN/tfiYspBsFIoSXku3BrZdNB0KbbtV5Ya1rK/nGrKPO4kogG1HQsYAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4479
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510150033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX1yDHR0uACmzn
 ccW1GctZ/hk7XM5RDKyfEyswwUX9VZgfb3EeKg6/uv9v9ytowlMz4sXQyhHAj704d8AiSbJ+Q+c
 mg35Y3Dudg6AUlO+xQNCbRYXwUIIWY0ueybm/R2fSwEjM36E9Jm9iskKwpbsRsa7F+51W/9j5Qb
 c4EYueZR6/RwmkN0c9mqOJYnxiEuo9GdlKMMTIuDKSTaSfATH6NgEMgbH1UtR4Ov5qlK4JjpH1a
 GFblik9TSQSuQA3gaZKcSlewtOEvMa0XTruQ2zamjVVC4+5wDFPOosyTGdhxD+v9g6oemWUA4CH
 ouORKF7YyphtDXVK0zYUf+MHmI87LTnC3tdLNp9IVfdP5XyFLnTYfc6Np+siQuElEMKNHmK3/IH
 02K+QnP4aYoDs22LdjJzGWNkHcgnGoN88BLqUf8pTTdi3zEsOk4=
X-Proofpoint-GUID: jW-IZ7JFzA04c5GEOFftIvOItTIlC__-
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68ef2787 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Bm-0wr0AoY-egHAR4P4A:9 cc=ntf awl=host:12091
X-Proofpoint-ORIG-GUID: jW-IZ7JFzA04c5GEOFftIvOItTIlC__-

From: Eugene Loh <eugene.loh@oracle.com>

In dtrace_init(), we set the locked-memory limit, either to the
user-specified value (if any) or to unlimited (by default).  We also check
to make sure that certain BPF helper functions are available, falling
over to alternatives or indicating they are not available in case of
problems.

It is possible, however, that the limit is too low when dtrace starts,
causing problems with the helper-function tests before dtrace_init()
even has a chance to reset the limit.

Switch the order to set the limit before checking the helper functions.

A test is added.  The underlying problem, however, depends on kernel
version, how locked memory is handled, the behavior of fallback
functions, and so on.  So the test could easily pass on some systems
even if the fix is not employed.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_open.c                    | 14 +++++++-------
 test/unittest/misc/tst.lockmem-init.r  |  3 +++
 test/unittest/misc/tst.lockmem-init.sh | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 7 deletions(-)
 create mode 100644 test/unittest/misc/tst.lockmem-init.r
 create mode 100755 test/unittest/misc/tst.lockmem-init.sh

diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 17dfbf9a6..54adec02a 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1213,13 +1213,6 @@ dtrace_init(dtrace_hdl_t *dtp)
 		return dt_set_errno(dtp, EDT_CTF);
 	}
 
-	/*
-	 * Initialize the BPF library handling.
-	 */
-	dt_bpf_init(dtp);
-	dt_btf_get_module_ids(dtp);
-	dt_dlib_init(dtp);
-
 	/*
 	 * Set the locked-memory limit.
 	 */
@@ -1228,6 +1221,13 @@ dtrace_init(dtrace_hdl_t *dtp)
 	rl.rlim_cur = rl.rlim_max = lockmem;
 	setrlimit(RLIMIT_MEMLOCK, &rl);
 
+	/*
+	 * Initialize the BPF library handling.
+	 */
+	dt_bpf_init(dtp);
+	dt_btf_get_module_ids(dtp);
+	dt_dlib_init(dtp);
+
 	/*
 	 * Initialize consume handling.
 	 */
diff --git a/test/unittest/misc/tst.lockmem-init.r b/test/unittest/misc/tst.lockmem-init.r
new file mode 100644
index 000000000..da8b2a5f9
--- /dev/null
+++ b/test/unittest/misc/tst.lockmem-init.r
@@ -0,0 +1,3 @@
+|Delay in ns needed in delay env|
+-- @@stderr --
+Delay in ns needed in delay env var.
diff --git a/test/unittest/misc/tst.lockmem-init.sh b/test/unittest/misc/tst.lockmem-init.sh
new file mode 100755
index 000000000..1b4dcdeea
--- /dev/null
+++ b/test/unittest/misc/tst.lockmem-init.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+
+# Check that dtrace runs by default even if ulimit -l is very low.
+ulimit -l 1
+
+$dtrace $dt_flags -c test/triggers/delaydie -qn '
+syscall::write:entry
+/pid == $target/
+{
+	printf("|%s|", copyinstr(arg1, 32));
+}'
+
+exit $?
-- 
2.47.3

