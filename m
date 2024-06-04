Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AC3BB24
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524021; cv=fail; b=mdg1MxzMVlRwwqiJk45jWBmwJWBoqhdDto1qG1/rb9BCbWvpV7qAHrvUL0HQQCiG/uY/QQaIBi8kIboPxbEmoPCGu988LBxW72uZDlSV8JcRHQRmtrk3IpGs+qht8OIGyYQlCEpNj69AoV1O2wGWHWTw/nijrvBYu8C9+SdNheA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524021; c=relaxed/simple;
	bh=Nbcafup7OtsfxZKHKPcG322tQSVmzcLfHxOBb/HxpVg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJMoq7H7oKGv7z9qESNo+XwrpRjn2PY38f26zzHuxmMBsFc71b6+NvNsATckpRvuBy8FA+WWgLXPuaaoKxeV8rwmMx3m5V3On/YEBdIyiFGmpp70aOBJRnL9Rms8ZVqan/1HETYxdzxvBtg4qf5mR/xB+ts1glAaHDSeiJ8L/ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bn0DM032321
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:18 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DrBiyuiKeGeN8hDZ?=
 =?UTF-8?Q?9DK60PFinxQzMAmPP9OYJ1fzYNw8=3D;_b=3DCtIjpfXZOyoscbei8lOCM5PbCN?=
 =?UTF-8?Q?k73pI8JbF20V0VhHuYUV9XQOvxAuqYka1I0nRxhJBe_/+SofPmfsI3F8XGvpJFp?=
 =?UTF-8?Q?hTowOqEjB6+H03GLUFSU/hfdPYid1J8yEhOx7k7acdn8TiLq_rCgDowgoOVDA8E?=
 =?UTF-8?Q?oSQwDx0ZwFnnXvBr+FDmHJC418o4ijR4XtbdJs6EPyKrx5qX95btqg_lNl+CBud?=
 =?UTF-8?Q?5BvJtSz0/RSmBYSe+qqoLxD0bQ0mghhgFkMJXgRywzZQXM8OSKJwqNDR76W1_xe?=
 =?UTF-8?Q?68Ocl5lD5Zn1cNFZs50j1bGD+J0wkI2KMzggbanSWhHPbGXhzBO8j8ksTJz+15d?=
 =?UTF-8?Q?6Hh_mA=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuyu5k74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:17 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454H9wLb016171
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsafpgf-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVf4GuP06jIkJ55Qgug2+CW5G8ILkPxo4mRftTRCQErCVMfNq78zuaWaIT1KmXp4QPKoqS1D9peYcBLCfT4QATWCL4K7CehZCFXdpsVFozX/qs2USyX5buuiAgmjuzvSvnUwCcTxsfpoTDNl/09o7iYv5ukfSlajL1N+iZdZcVRtVffWuv7wRiqReQpf09kUeKCknnPZ/fISEmYs290RZgsmthC9V4zIVk+TXVOy3vlF+N7DbwTcgYDJKdluyj7vRM1wEMiBdVZsf9FoKujOb8iJRDaj+G5Sm4maeoBBG+64XQ8uUiC9HturHgZjtZFRdu5+ximSe0be9LRIM8SjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBiyuiKeGeN8hDZ9DK60PFinxQzMAmPP9OYJ1fzYNw8=;
 b=AFbCkNseaO6pdN/TK7ywiVJSZQ6WXnDlV0wm/SQbNYUEolI+cI/FPc7iL8SaRAAlM2egbNUud2NQ41afdwNZ0ji/tLg5TRs31+TgCsrsFMxNjInUgTylQ0ZeZ3GjoWM1Kh2YQTdnmuUQv1MfTPmvm54ROJ9YlmE6VeIsJP/1jUl1pQBUTFYf2N7by6r4tl67SXRpg00lm2eskZza4GLjqaREASaBgNRagFFduZMyjOsy6StLW22cvEmV8YHEE2cXW3wdNv1UQqeqFF1/XxD4+g7pcweNl5PsP1auSO3mPeSzIRUk3XLZs8JiOQ7SoNQ3lHoCElm4ZX7nOhFsva4vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBiyuiKeGeN8hDZ9DK60PFinxQzMAmPP9OYJ1fzYNw8=;
 b=e2vPWB/88cw5PUeIlpCvbfuToslUIJZFVBbCS2QE1X9kFRsKKMoiJefRaacOWJ/EOA+64zRr4Ze+5JWlHGMQ0Dnw7SFrCNYfFWq8i/ahZtXEZPaPM5/YIPtavXcoP6ern0gBwYqcUPDH7no/MAch/PIfKhBmWkUvq13EtGTz5lo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/8] test: Fix nonexistent @@sort option
Date: Tue,  4 Jun 2024 14:00:03 -0400
Message-Id: <20240604180008.11331-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: c64ed948-e8c6-4488-c675-08dc84c02f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XJ8mhBYA611SGwelLQ2tJAFJtbAyLZ22bxix4dBnn1VSsraaIGRUsh3OLO29?=
 =?us-ascii?Q?myZjAT3BB95bigGmNNaBhihxDcqx/PpiM5qFAccrnrW9Lp/Vv+3dIgMVhNXS?=
 =?us-ascii?Q?6PIRvmnNxoMFLdKsBSwV8gWrHvo0Us+Ge5JthIjKHbHyGeTcm30nGOVLp9lH?=
 =?us-ascii?Q?zyeSQxE/vjwHI/r4De6oahGofZRoMWj3xFWpFbzdQHVNAqBh29mKA01HYgyc?=
 =?us-ascii?Q?mU84oEWtvqsZi9nXB/ZKq636wu2cvEyZgyv7jYm6/L09zTfdbBvep4pYCCzp?=
 =?us-ascii?Q?WK2uyiA8r7XYqNa4d/cTTRRo34+zY+SWUo1e6DrNw/L3LfVlkYpeFxCRFPKq?=
 =?us-ascii?Q?RVIIL3aVJ7jcM02JtfvqlWrMrpno6WEAAvbXX1o9ogBurUzuCRklo1pmo6c/?=
 =?us-ascii?Q?CUbAKawlrMm19fNQ0ZFvVIcNYZpKHsQ+RWxT6CjXrDqyVcJ2/902tM8CfOXE?=
 =?us-ascii?Q?UTxJv9aCT2ZyOmLTvq2rux7VAeCEfb7NwQ7PFd64oBCPVP2b6XLVrES/UGUK?=
 =?us-ascii?Q?bM91yFvBakrcsGYkiSFlYn0uRkAQUcde5ATpsJnTcI9WE5p5CIYDSZ+Y1s62?=
 =?us-ascii?Q?uQvgn/pPJFp+abxerewhfdeAr/DHjEIvDc94pcwEfTE+a3sX+n398KB3HpdW?=
 =?us-ascii?Q?zeoC9J/MrVZjqyO+5KguLPQpqzXbEjgLsUC/rtPFoHPEXZbpJxAPL7dgeWUw?=
 =?us-ascii?Q?qWaoCG0EYlAM9vLqAWLBKFhq15yM4EvYUU5Kv2ClYRQlc99WACJOidTOF4O0?=
 =?us-ascii?Q?TOd7wuDUCZIhQbF3NcEWK5seAUuZilJCnumhGcnE1rjwyTljVtMBBbPBwviP?=
 =?us-ascii?Q?YJcFbPR/RKD6HpI+Kkc+XnmHlBCj+Kksjg0aA1RXcWBTx7+K8PD0N/XxxY/b?=
 =?us-ascii?Q?LcXVUz8a0U3A3RBtzZglz7sBBG5DV9HlVUNCzjy1Zq0EOUOBnNP5XwSREfoB?=
 =?us-ascii?Q?ULy+jZikZ40qeXCOeiHGpvD72y1AZQFI2Pq7Mo6DHZvZfCnUOArtkcBFkNki?=
 =?us-ascii?Q?BPa4FEv2EpoR5qssgMyPUM3apJ4hC38mb3SyflmfDuZ7MarvJg6MeaeAQ4Kh?=
 =?us-ascii?Q?GspsSYws4+dbND5uF7iyBeTUdwQMGi/sujx5icMOi8ep0/crL3gj5ACLledN?=
 =?us-ascii?Q?PHFiOKFPfl2buM9Wix74rvDrOn4ORbG1TIWNiAa+GfApALgc6SNoposxmqNy?=
 =?us-ascii?Q?BlzvtBFVks9tpep5A44rXPe77tiUW+brFzrl0AGDYQ35b983RaGn+/Xl4A0e?=
 =?us-ascii?Q?VvakzRSw6jYbmpkw0YuuKsZ5zd/kk73S3XKMBfijPDsuhIvdATo2AiD5jagk?=
 =?us-ascii?Q?TKzoiBPAvC+ldqqWPSHcMha8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?98OmHv+aEe/W5OeNQFNNTv6Uqc3gK0T0srhPc1kNvWUyRt3SNSuOlsvzmnzS?=
 =?us-ascii?Q?yvEGOp53fs/MQTU/UoPfZIk+++CwFDjkcozxb5E3pB/9QU+jBo3NJcdlRgss?=
 =?us-ascii?Q?v02kCtD63EqyA/ve/fA+C9KNnZKZm5W9JXl+Y0bWb71gyJmMivkL5KPY2/2c?=
 =?us-ascii?Q?2LSsFQ6TMn9PPHB5qf+wsy53MWbKZJ2WE0l3CXCLtgfNPJXsx2DH9fLW11mV?=
 =?us-ascii?Q?w6my4W0sVUcgbsWBGA3oOfCwTmViYsCnCyW4+NeP9WwwPHstgLl9PHa+A455?=
 =?us-ascii?Q?s+hTfr/n/N/QKNFaEvo5aN6/pmAa9NH+FlsN2F/vcl5XWARTNarhAvYwphGP?=
 =?us-ascii?Q?okvAGyfgAHBWCStCLwhqwR+Vzy/u5FK11sCDJTI7hIRlI3L1f5xJeuvjmEOG?=
 =?us-ascii?Q?rsYxRuEDAqYvAxNWp3RmJSbdesIIJLqMi6twoht7GgAHstiivMEzAi4v2BlS?=
 =?us-ascii?Q?aWKCgwP4xmpEa58hCRTWe9pZ+LWsVyQK526b5W+A08fQRmvXd1OZPBP2awzU?=
 =?us-ascii?Q?mgrU5uxjzHaDVifyP3OA1EjX1legt+SZYy1KNG5jQft5aELLV2HP5lwC7h8E?=
 =?us-ascii?Q?QZna+DgMAYrQdhF1fIKoA/Mze0AgCIRZJSjvqhv24OehJocWjXtAGHPbl+4n?=
 =?us-ascii?Q?aHhWbPcxPOgj/RtDozM/4QFBw99L484nEg5ve8z7DuLuojfyEJ8uU1KH1dou?=
 =?us-ascii?Q?Y2xHGYd/j+o4RBN9Lw4gAwPW6HsiYNGSqES565uAC9pbkcYVdcMQY3X9Lx/J?=
 =?us-ascii?Q?QK354IDJTcer7MZGXm71Lb+0wF+fp20R82t9jSLX7pfvZuY2kRK8rpM/uwCt?=
 =?us-ascii?Q?SsgKnOH/7HFTWb+FjFaqF+8K0dnUqa1sxDss2XRZbwNZ4fyuwihzsbtcMmAW?=
 =?us-ascii?Q?zQ/77XmbH0cyqoB9lFPSpbQ2UIDLM1wMsLptpXM8fnTzYhByDv+jr3nVLybl?=
 =?us-ascii?Q?5KKgTWyz0+5AhJasdFlb0aGh5PYbRvKfSJ3ffANXuvk6inVBxA9DlrMUW/D7?=
 =?us-ascii?Q?y4q6eBjUsAmt3xXxwDOZ3/jADZ1HPe0jE7to625cNB7SxexdjSrwoqGQW9tR?=
 =?us-ascii?Q?jUavWZPKIfpLsZRnmyIuvvigTf+4Cbh816dYEyDKwFg3wXE1cMcBF539wZ5S?=
 =?us-ascii?Q?DtVF46UuF8pNov6Xoeg9C+tujIehAWV+ap/w/pcKg54cxm/aI7al2ybR0myn?=
 =?us-ascii?Q?Tq+dC/sLAFsTp4XFUfcl95fHVkXkbUWDl61UXI6Jq5DV7hzonVurDVm0pca1?=
 =?us-ascii?Q?XK+639U/EjiOB6gi6wG+gmFFy9ku8VGZWbfecxMo+0Aq5galALHEHxY27TX2?=
 =?us-ascii?Q?u56OXdHxPpSpoCiFtmZf2EvEQNZjpjOoYlHnVnlke8M05nkILBv8SpILKtJF?=
 =?us-ascii?Q?AnE2/Yd37xZJrEbcKKFCWm3PJsWTyO1P/frTByUIAd151imGl+EJvIK/+0f6?=
 =?us-ascii?Q?yQE4akThQ0z5cy17ry0FYnyy2MVUrxbHOB3iWtGbQ+gw3YoWM9eFnHuCGNlx?=
 =?us-ascii?Q?7YmVT/5Tg3sSc2wSbfBH7PGLlRuBZ6uR/nNaJqW2lB6Cn4Ioe/4ng8Zk4Kje?=
 =?us-ascii?Q?jKdbr9/vtM70fvek09Vx32B7VAZhsdX9coPc+Tum?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/Or5Q9S665buraOoiOtqWV5EvQhvAseCfgITnkGLEhuGHC0B02AYaIu/gYQb7HLdHTrOPBII6z9LLZn6WsYVUxmje/hcEZStEaTPOSfxeksoqQr20QMAlh8Het7ijndiKgqmsj4afKdNj8IvIOhylOPU8XjV4VmPYLOuF/gBp7WUCpO5xbtBhGDwkVpR8KaqtiKIEL3IP/loYKdSh8EOPFptoyLk5bq2keU+ez0z4rr2+vnJN3R6W484GVbGymSQhAzpm3Mf1LSTji5k2Ie2m/e+/0fjrFGysZoCCbGykpvQhBPLRwnMpOM7V11R9rTtTxvE19EzWMV5Eq5n5OfXOQDkuFx4qOe1DhdnZvCAuzH59jr2JH8ruYXVO8MyYwrBVtHNo5rUyqm0WO9xbUXoAACp4PMzJrW3MWifPym4X+mZtAhrvrhE9nQSEHSkPEM2Hn2d4/rsWi4T4a6ucNVYervn5PT1Ok6RuBOsueqOOTINdEgil3vyiUpmKBko7m9oFJqdu3PK6BF287Mr5kuvxtmxqm+NR97w+oiaghuaxlYu5xt6eLnKH8P8QzxjK+1fSdnZgmW0b8JkMg+NZ6zdqjEYUbEPEIBmPDpL93yeaPM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64ed948-e8c6-4488-c675-08dc84c02f69
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:14.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+We864tdpuHx+KcsVafZzUZL9WeDJr6rfPLKrqSXQO8EUz//dsnxdp0jhmd/98t2dkYIMeTnvPyeku4mbJARw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-GUID: OH2ptT3tCprQfIWzeKSd7I71P6lVo70M
X-Proofpoint-ORIG-GUID: OH2ptT3tCprQfIWzeKSd7I71P6lVo70M

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/options/tst.aggrate-fast.d | 4 ++--
 test/unittest/options/tst.aggrate-fast.r | 2 +-
 test/unittest/options/tst.aggrate-slow.d | 4 ++--
 test/unittest/options/tst.aggrate-slow.r | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/test/unittest/options/tst.aggrate-fast.d b/test/unittest/options/tst.aggrate-fast.d
index 17fe0225..68c46a1d 100644
--- a/test/unittest/options/tst.aggrate-fast.d
+++ b/test/unittest/options/tst.aggrate-fast.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,7 +11,7 @@
  */
 
 /* @@trigger: periodic_output */
-/* @@sort */
+/* @@nosort */
 
 #pragma D option quiet
 #pragma D option switchrate=100ms
diff --git a/test/unittest/options/tst.aggrate-fast.r b/test/unittest/options/tst.aggrate-fast.r
index a32cf7df..c47c6a20 100644
--- a/test/unittest/options/tst.aggrate-fast.r
+++ b/test/unittest/options/tst.aggrate-fast.r
@@ -1,3 +1,4 @@
+
                 1
 
                 2
@@ -14,4 +15,3 @@
 
                 8
 
-
diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
index c4bac5e4..e2a0f2cb 100644
--- a/test/unittest/options/tst.aggrate-slow.d
+++ b/test/unittest/options/tst.aggrate-slow.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,7 +10,7 @@
  * actions, multiple printa() should all reflect the same stale count.
  */
 /* @@trigger: periodic_output */
-/* @@sort */
+/* @@nosort */
 
 #pragma D option quiet
 #pragma D option switchrate=100ms
diff --git a/test/unittest/options/tst.aggrate-slow.r b/test/unittest/options/tst.aggrate-slow.r
index 6cbd6c2f..ba2e979f 100644
--- a/test/unittest/options/tst.aggrate-slow.r
+++ b/test/unittest/options/tst.aggrate-slow.r
@@ -1,3 +1,4 @@
+
                 1
 
                 1
@@ -14,4 +15,3 @@
 
                 5
 
-
-- 
2.18.4

