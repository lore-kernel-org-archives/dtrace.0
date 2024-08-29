Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4518B479
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 22:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724969909; cv=fail; b=EBEdYZ5KZp2jXL+DQ93nGfMsqlg4XQpFXUSRzGyIZpbE1YuHnXQCwn1EDV50EEKgbFBdAHcg78afjJ5FwsdND/SglV/G6P7Kqb/TxmDYOba6wsHRBxA+oH6V9E7/uMtbsKleprRWsFVaBSDXy1ldI06U+Qqhc/UWxomhitZAl0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724969909; c=relaxed/simple;
	bh=fpq84hAo9FLr5sa6WT6lr6obqotkYETCf10hrCrpPW0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Jw5tG6SL4v1S/5QjtZvWZmgDCN5E6HKBqgp14SHiyZ68JLGQSezlDcDivtw1iSnF3EjSzoZLLrBH3IzQF/NeSLKFoTYsIfXORCpRySTC+/dShX5jXO+qJ3sKcC59FOEpr+Cn4ByfN5tsbvfZlzaiRhgOmYdhRsLMzACBkJw4J7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VYBdpUo9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZwmWvS+w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VYBdpUo9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZwmWvS+w"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TLtVT5012092
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 22:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=zCpLJZiPTaqPahRwWXDEmzzhAnEH8j/sdgL+IajmZxc=; b=
	VYBdpUo9a7ZWgHtE5oMSlcH5pC+UzxFV8TwPq0EFwDjhTXOgLwZnOg8Dsb1UFa/6
	XL1NaEswV+KmVD/rTxPma3khBkfWIxqJs/UQt4MplMgGIQPF/eZb0uxXTlsaKPHf
	ziYejd7yYyYK8a+ahFmkWgSsm1SLPGwTUlIHEp5k+AHiO5RU4haPI5RRazBz7f6A
	Cr7PS4pFzckORZGgKLT/b0cJfw3zfeIugNBFa20g+ubMyE7Jgma3fmLfkb4KJAXp
	3ne+LjMnWxETnUz8Ti9MztlUhWcwNX6DGCO+yC5n5UUDNqUakOCM5J3v8sZuKBSh
	ajgVXqk7QKqTbhoxbcaAYg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugwe9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 22:18:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47TKSpsE036524
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 22:18:25 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jnuqu9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 22:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWzHVq4JrtaHlz2LR9z3qnKhS3xuJhTky6x4G0PVna/RdKK980vuIpeoRp3xOGaKTKYkpRwY/3B+34bo3cYEYY1ncZO5pE5gCV/W4X1iQ8DbBQce0dGiAXUuOeaTunrXcnK7uEqesR7bRWmseTlSBt0hg9cdqToiMtti2wePJhidfjpXUCtzrl5Esli758zgubOFDsdaM50tbLqDwjvUDmpQQ+aEBqvOiw41Z927jj/8fpLEDyPmlzmJRuuFdqHEXkDdF6SAaEeL3pskbW9fBepRBymJjkIcIdMNiSRgWRn3HApw2VohTu+y5tMVNo/FV2gJl0Q4XMbMnaX2rNhxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCpLJZiPTaqPahRwWXDEmzzhAnEH8j/sdgL+IajmZxc=;
 b=o9MTqaRzoy5Pn9WlAjhNhGB+1wfnGtbx6IlosHdjyt0xNv9enOBpCsrahQivCTDp3N81Zlg1cHIgvsYQjWXcOkUa3Sf+c+8SAH7bV+VHQqlTOlBUkqur6tKpgCee+DeqAeYu2gaBWaJpuQlZJRgizxP//5o2RoYjoeRH4VQuR7HSP1vpTbYmYRGbZLs4WeTn1arEWv2bqrywj2MsXSYHiDPJiUC5TirkaYyTRRfEQBdUQ1b+gOXlfVKiWrR0TdjuP+l9YbfS/Pt8i3G/BNOHXLfrcujC2aEB1NJeLNCGgP8Xm8VXm0hgw5e5zs27ERSCJSFgp3/t80WSdLQPieKoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCpLJZiPTaqPahRwWXDEmzzhAnEH8j/sdgL+IajmZxc=;
 b=ZwmWvS+ww8D/K+6bUCmjtGBYY2qfcapbf2QGLIPQQz3VYjiFlUPWpIns3xJS2tiN6hwKdbTqKlBtF9a/+O4eBVJta4VazE+1wEa6F4e0gsdnQIYYjdpVNvCiEfPKYXNqKtZKJmZDxN3tY6ObkVAoKVJJoHKpI8t7NnTOQqYf44M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4550.namprd10.prod.outlook.com (2603:10b6:510:34::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 22:18:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 22:18:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 01/22] test: Handle dtrace:::ERROR arg3 specially
Date: Thu, 29 Aug 2024 18:18:19 -0400
Message-Id: <20240829221819.10237-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:408:e6::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ad9e19-0fa5-43da-3bf9-08dcc8787e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?klnVoLun1CT7rOdLoaOOuDYEa6qIQufE+YbrpSlPGVFL7kOwjSOFeeZdyZ6n?=
 =?us-ascii?Q?+7Lk0ZRzAPfFB1Tu/soBgLXkJ2MCMxSIthymU8YipE75ED2hdAttSJmza5oj?=
 =?us-ascii?Q?C3h1vD8nTKIdhuGrI7mJU03m7YdjITFXV0jQshiT0EBUhlCdmW17/NPAvnDK?=
 =?us-ascii?Q?UIwuAo7LJ4MIguAlr/bEO3EUVRS+GL/RL+/N9o4n8NXyzFqIp8UIm0W3kbGl?=
 =?us-ascii?Q?bl134+zXWM1UeBvIJ5QrLuLTbI6Z/XUj/RvtCP4g4BTreFWQ2JhEQvtodJTE?=
 =?us-ascii?Q?bnvkKgS142pj32tWorhjQBJCejdwDI2FpuLzmiY/hwBA/Qm1dkDod+DUvB9y?=
 =?us-ascii?Q?8K4TYHrcI20HHFM+yoddMswRMq7/ID01aJU5HtNOpsQUjEtAb3dJar5rfpQ1?=
 =?us-ascii?Q?pYX08l+RAncZsaM7wAIy37m24/78IPSYKH9YJcu29aF9FNOEicXlUT2krQQx?=
 =?us-ascii?Q?NjLBchC4uqVjoODyBYvZvtpcg3BN7vsKmCN7d1G6gQ/MtZGAQXpCa+Kfyr3J?=
 =?us-ascii?Q?C3YR8lMKFdApLtKkg+2SektiXXVVQDq1lmV6ZtLJBswvXlra0OfAq1fFmq2j?=
 =?us-ascii?Q?d+aafm83UfK0TcVCpUehPW3HndURdNuNZvOYiqjZFuyhxTEs7IshiWrAbKsK?=
 =?us-ascii?Q?tfY/LkpVToDR1zJCja2sZUZX131a6grIBIznjBiqtMPxBsjAnXujp5DY7tqK?=
 =?us-ascii?Q?IwiUjpBeo/aP5fzW8X0S5mTX3Nevio5nJAiRvbdeZncHemCvRsBq73SA638k?=
 =?us-ascii?Q?IYqr1kN474xcMK5jMe+QzPPjP7gLhMhTh0/ghEQRobnw1aLkRH2fqkm4PbpJ?=
 =?us-ascii?Q?MVya75vQaUS0NuiRktU6EyjRZrGRiR5UkF3N/NX6AYK+049fasTaWYb74N1R?=
 =?us-ascii?Q?z4FGely75revwyHerMQznbhdz2OfSbrDOkkcKuYhHOwHefeZuW/SG/0mLBRO?=
 =?us-ascii?Q?fXd3coBWr52yOdBG2uI2P5jBS2RWwJGHqG6f5Cxi66Vq3J3wm6KVB9Sh532G?=
 =?us-ascii?Q?38p3WsNYs+fLlr/TwPccPlZuGXHnmtA2eEJRkMte6RBlk+Ct61ythkwzeiXZ?=
 =?us-ascii?Q?3EH0Mgy+EylvwFIq1L2mZ+kehduVy4WYU9pCerLxJLk2HTfK26crN+Cjag9I?=
 =?us-ascii?Q?eA+Ko9yVfeWfQAvzRhNpaPCtfa5Wfc71Fdb39dGT3mLfn7woO4eMJPekBvaB?=
 =?us-ascii?Q?z8kcY1A6hmW170YwCYyYdvNigyWwqz69Pf6htjWLz8rDY5mbrNlDguXtWhmg?=
 =?us-ascii?Q?mfeWNipH6SmGTbyHWKIves/24lUz+9xSgFzDggdUGjDbD1rq6V8fE1++WVWz?=
 =?us-ascii?Q?Lrw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CxOFZLIsh1q3M4wDmv4k5LD3LImazcbAhJQwvybeNu+P8XdUDvxBjhgyZqhY?=
 =?us-ascii?Q?Lbb12W7oPwg1VR8R0eYp8+nNnvX1flPxGiEheRTmvJTzMm1P/nqELPCgVYn3?=
 =?us-ascii?Q?ERf3nJtkb4QV68aU2R9v7sLDM9I1lnkhgH7Myd8sjPSi6LGI/LS7Cno32Tjn?=
 =?us-ascii?Q?9WWXweb35lQPlW580KK9spTjyXJL0U2tQpr21ZUBT2LtG6K/VjoNnOoPgXZP?=
 =?us-ascii?Q?YohKwnTWn9Ndrw/VSX9ubOBdw8ikD2+KDXJ7u1/RK5AyeAv50RB1A1g/8KuL?=
 =?us-ascii?Q?6jh0fN4o+TLcCrHJdAd3R6hm5Coxl2Ph+QnBOFdDaJ52hIR2TPyCvRA3iEbn?=
 =?us-ascii?Q?AbfuhiX0pWjQWu1CKqTMRnnTu9q3nK1orG/TjXsVcLRGkqPgsxPbCkohccOD?=
 =?us-ascii?Q?/PjdzzbvsSkB/Eb2IKEwYLEY4sExL4/qdkZ7esRt4RtxHXFujlK1SoH1JFIo?=
 =?us-ascii?Q?7BVGXvuw7z0mbtGDFLWIP4T3KoKjmF91MKiA9hkf9hXaT7Ef8Yii6FgjqVlB?=
 =?us-ascii?Q?W1QAIvoKwTmCQFJGYWA1BOFaKn/bO0QAC5AdXY9iyJT9scCevzLJjkzmnIuh?=
 =?us-ascii?Q?hCCA1i3IjA2ZMZ01HjzWiH0mNODAH7RLwUvzZWHM1KZF0DEqLcUeW8Yh0eYq?=
 =?us-ascii?Q?K7EM52s6AA0pfw8hKRxA294MJhmEzEnmitTbhjW8Y+8uNXYlNIlnYcOGIk64?=
 =?us-ascii?Q?gbaCLeupTOjWV7/J9gXdQIJHsRNy7S5+uOvF38fR0N8biMiZSq57QcmzSqhJ?=
 =?us-ascii?Q?Il3uXUz9TckxXLCpOXtizSeLB4Ky1kGVQIva0P5Z9E2167SKGp8hN6dkBEVi?=
 =?us-ascii?Q?nnKBcGvxYQ7VKl2RETF2hp+XfIeFgQAl1rymadrowImrcBPdaEaXQYT9/dnV?=
 =?us-ascii?Q?nxXmA1Y+kvufZ2EoKJ+96lKflkUzcAlSTHJvIuGETuXHLd2IeakQJEv572mo?=
 =?us-ascii?Q?vhn84j4QP5sr9Ge6VfE0oizDOkgmJ/kTbyhiZea1LLfFxIW1zFy/mxm3uoYj?=
 =?us-ascii?Q?ZiNh+bpL4i91FJ2brnXPejkgAl0IAYurNZ2ZfU3T5KWdbJJAZB+zjXUyvV6W?=
 =?us-ascii?Q?ndMHHPRAi+Krp1fgzgLaDYSzuWUuj0Up5RLYGY4FgxPDOhcF5IlDtRbk72LZ?=
 =?us-ascii?Q?wFhOawIWghmXuHnQuEiJp9UP8PIbYAyT6dKfwHlbUYHkB0ShW9Vxn40N7d2R?=
 =?us-ascii?Q?Sd/pf3b6/BvdoWgqv+qw3Zo+ykxGFlzA/TIG0+93RKmhXDFXdAUzwLEqbahg?=
 =?us-ascii?Q?opnaRlxsoePR8xqyxkiI98LB92i4UuCMK8xNtqITgr4RP3c7Q0tzNwit7Kpv?=
 =?us-ascii?Q?3AQMMSXuFj0VholoeXvGsIqESYxGBvKTkT60+NGeXEq3cAJwEItz1qOoBUHp?=
 =?us-ascii?Q?uYzmUvIXa8f35e5ym8udAXVUxpVYFn5C1YeTv1BW4vjBa5UeMvXXl77EmDjo?=
 =?us-ascii?Q?D6f83QxpP/ZX6Um/GwNjWHN3f9Iq0JPv7N41CKBZP69yMIPy/XpNB8LvGpW6?=
 =?us-ascii?Q?Jtl+PjEt3S2b3DOMnXr8l9duUZdZ6RSUEj5qRP/lzgOfGyHhawvIKad1S9Go?=
 =?us-ascii?Q?ckWJ6l6X6L2EyFCB0dGHfv1R1M2BusKAWK8G13Xp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GhOi0+SNUgzpijYRcALJ+jH33OkzEzUBjB2Z0oX4eoMnFWjvgjo6a03lx/5dMFzQhYdy6GmlHGimsYgUXsZNsZQ7UfEKEnMF4cAy0uiHKkN5oNp3I+iU7wVH0ttYZSN8BWoOFX2mN6Rt0UrNlKUXvhiD004T9ESePL6f8UFWjMW8AtlHJVC/tmm2xm6F3Vku6lO97XMSGFUkrW9ShyOUdkGPm63RrCmqIIMdVAdlmhKWanbCKBCvbMpPjOMFCTzo6URfzJjzjnY6Wr0aSMlpZ41H+HVMKFnz1+rTCwsu0NNBgRmj9u6lAlWn/8YlU8cLgc4GmRlvKvB5rST+8Wj6KVKK0emNxDHE2gYDbp1RAzcqC+p0ERw1CgufH8rbdrVKU37zoUkXJ7ZwBAk/srrxubct6UOq3fmsSnzbvqienVZtKknw76TnIw/pIKm1XJJtaFdjAKkYS9vjNSrMsT8MskPYgVspVQCJdZJFdgTK3rwa2dGt10I3EF0j3Dxb61fSME0a1AX2W1JXyIpLpEKXKfFyzgLRYPXMXapiW80VRRaVpyjwnbEgVY/hCyEYa9qyce+sEbSpD6fJ/qAGbCKXnLpaO32Nwlm/bquhCU13jY0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ad9e19-0fa5-43da-3bf9-08dcc8787e81
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:18:22.5909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZenAqRZy00PyYRHjXOA9OiMxVmlOUGYXrjbtvBVSVfABZJxkciIbanMCG1e1yurjyZ4QxVGi3I4qk/RMtGI6+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4550
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290158
X-Proofpoint-GUID: TcN9bmf63vAdOc95F0HOV4p3hH_M-SKK
X-Proofpoint-ORIG-GUID: TcN9bmf63vAdOc95F0HOV4p3hH_M-SKK

From: Eugene Loh <eugene.loh@oracle.com>

The ERROR probe's arg3 reports the culprit PC, whose value can vary
with minor implementation changes.  On the one hand, we do not want
tests to be overly sensitive to this value.  On the other hand, we
do want to check the value is correct.

Therefore:

*)  Change tests that dump ERROR's args to omit arg3.

*)  Add a new test that checks that ERROR's arg3 is correct.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
 .../unittest/variables/bvar/tst.arg3-ERROR.sh | 172 ++++++++++++++++++
 5 files changed, 181 insertions(+), 9 deletions(-)
 create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh

diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index 001903ff..bfc77bf5 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -19,8 +19,8 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
 	exit(0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index b11f6c99..3e7caac4 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,4 +1,4 @@
-The arguments are 2 2 4 1 64
+The arguments are 2 2 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
index c23f9503..ec519f4f 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
@@ -1,10 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 d_path */
 
 /*
  * ASSERTION:
@@ -18,8 +18,7 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
 	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
 	printf("The value of arg5 should be %u\n", 0x18);
 	exit(0);
@@ -29,4 +28,5 @@ BEGIN
 {
 	d = d_path((struct path *)0x18);
 	trace(d);
+	exit(1);
 }
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index 8c601a43..be1f6d5b 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,4 +1,4 @@
-The arguments are 2 1 28 1 24
+The arguments are 2 1 PC 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
new file mode 100755
index 00000000..4b139be2
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
@@ -0,0 +1,172 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+##
+# ASSERTION: The 'arg3' variable in the ERROR probe is correct.
+#
+# SECTION: Variables/Built-in Variables/arg3
+##
+
+dtrace=$1
+
+DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+function dump_files {
+	for x in $*; do
+		echo ==== $x
+		cat $x
+	done
+}
+
+# Run DTrace, also collecting disassembly.
+
+$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
+BEGIN				/* dt_clause_0 */
+{
+	nerrs = 0;
+}
+
+BEGIN				/* dt_clause_1 */
+{
+	x = (int *)64;
+	y = *x;
+	trace(y);
+}
+
+BEGIN				/* dt_clause_2 */
+{
+	x = (int *)64;
+	y = *x;
+	trace(y);
+}
+
+BEGIN				/* dt_clause_3 */
+{
+	x = (int *)64;
+	y = *x;
+	trace(y);
+}
+
+BEGIN				/* dt_clause_4 */
+{
+	x = (int *)64;
+	y = *x;
+	trace(y);
+}
+
+BEGIN				/* dt_clause_5 */
+{
+	exit(0);
+}
+
+ERROR
+{
+	/* Report the problematic PC and continue execution. */
+	printf("Error %d at %x\n", ++nerrs, arg3);
+}
+' >& disasm.out
+if [ $? -ne 0 ]; then
+	echo DTrace failure
+	dump_files disasm.out
+	exit 1
+fi
+
+# Parse the disassembly for start PCs for the dt_clause_n.
+
+awk '
+BEGIN { phase = 0 }
+
+# Look for disassembly of dtrace:::BEGIN.
+phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
+phase == 0 { next }
+
+# Look for a blank line, denoting the start of the variable table.
+phase == 1 && NF == 0 { phase = 2; next }
+phase == 1 { next }
+
+# Look for a blank line, denoting the start of the BPF relocations.
+phase == 2 && NF == 0 { phase = 3; next }
+phase == 2 { next }
+
+# Report PC for each "dt_clause_n" (or a blank line to finish).
+phase == 3 && /dt_clause_/ { print $3, $4; next }
+phase == 3 && NF == 0 { exit(0) }
+phase == 3 { next }
+' disasm.out > dt_clause_start_pcs.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: awk
+	dump_files disasm.out dt_clause_start_pcs.txt
+	exit 1
+fi
+
+# Confirm that we found expected clauses 0-5.
+
+for n in 0 1 2 3 4 5; do
+	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
+done
+if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
+	echo ERROR: did not find expected dt_clause_n
+	dump_files disasm.out dt_clause_start_pcs.txt
+fi
+
+# Dump the error PCs to a file.
+#
+# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
+# we are looking for: "y = *x".  Each time, we check if address x is 0,
+# calling dt_probe_error() if necessary.  Then we try to dereference x,
+# again calling dt_probe_error() if necessary.  Since x==64, the second
+# dt_probe_error() is the problematic one.  We look for those calls.
+for n in 1 2 3 4; do
+	# For dt_clause_$n, find the starting PC.
+	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
+
+	# Look for the starting PC and then the second dt_probe_error().
+	awk '
+	BEGIN { phase = 0 }
+
+	# Look for disassembly of dtrace:::BEGIN.
+	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
+	phase == 0 { next }
+
+	# Look for the start PC of dt_clause_n.
+	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
+	phase == 1 { next }
+
+	# Look for the first dt_probe_error() call.
+	phase == 2 && /dt_probe_error/ { phase = 3; next }
+	phase == 2 { next }
+
+	# Look for the second dt_probe_error() call, reporting the PC and quitting.
+	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
+	phase == 3 { next }
+	' disasm.out >> err_pcs.txt
+done
+
+# Do a sanity check on DTrace's error output.
+
+awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
+  disasm.out > err_pcs.txt.chk1
+if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
+	echo ERROR: problem with DTrace error output
+	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
+	exit 1
+fi
+
+# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
+
+if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
+	echo ERROR: D script output looks wrong
+	dump_files D.out err_pcs.txt
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

