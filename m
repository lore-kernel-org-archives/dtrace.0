Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E6C16D9DF
	for <dtrace@lists.linux.dev>; Wed,  4 Dec 2024 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295123; cv=fail; b=AJPbDAX48zRdZVLvOw6WicpdpFv+cExKs1rFETgot4MHpE+lxR4RDbIJCWlXb0h1Z/Wpv3qxH1xQLHZS+7KOjGIDKXGpcPvyz50jFMv5NRLPi230qtdhvkGYvwCRGokPCWiX63I5MMfIJ6iNdpgHK3j5wHzPgHE8n2fVb9p0oQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295123; c=relaxed/simple;
	bh=ghikCDaVKte+LyV2M4DtoSGFueNwrGNXCcpkYQSMR74=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=N+A9YDEqmpg6Ml7uaNDNEMsnM1FyD3c2yCkQ/qJrHuJKowkwhqKP4PURj7o4X5KQwAhXXMt0cvMs7hzYNKWhOe7Su4fVvlZb+PaXPtuxdSU2hitHBFJsRxhdyriVnKea4dJ4emQw+zS6LrRKAmM9YF8UubrLm85aBZ9HFuDjWAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iSa93Itb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MfTMKBy0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iSa93Itb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MfTMKBy0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B41tm9w008168
	for <dtrace@lists.linux.dev>; Wed, 4 Dec 2024 06:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=2HLS3JqXDAzlg5SJ3aDGsrYtRAtWFuG0Gc2SMmqzl2c=; b=
	iSa93Itbu/KAXxFWnxE9mBzFQZKs7QxaNi3bfpiZjG7dSCVzvPrzizJwmWtUZWlc
	w/XlSE4y0S95+sZjIPQunFoGniPg+TigeMDNsOD/AsOTchAZmfd7wD51vee5wL15
	02G8kevFIo4lgfoNNj+6fm+21lQEz6gf6b2+8AEtBVPY9/nqzNx9VKoDOodDo1mS
	uyFnmQC8k3IyY5BiyjuykOmI3XkgXGCXsY9Tlv4TAoYgO+orRfVLNUb5IWLFuiLw
	Se/QTtPKEttC6pyOb8wqNz5PD2/sVzpRPsNzY6ZK8T7Kp6Ze4RXNokmQtkq1CYKD
	oqAdlb0nGEjo3ktfVIQr0w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbqu08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Dec 2024 06:52:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B469pqn031288
	for <dtrace@lists.linux.dev>; Wed, 4 Dec 2024 06:51:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836v15bu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Dec 2024 06:51:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x43J8Nw7GlTdQrkn91Rd4nES/IFwPb0PGWshaotWh/v6M5sXXIqPt7k8MN9cUSjEr+mNNKSQ9j5lTrsLQPcvk1TEeE8aHzbWlqusgFR+w+bRPRGnCqBhi8tIUwH/WF+0OljOSRAApkk04RdVv+IQlwaelEpvfFoPGB7rEnVSg6Nj1hQROvCgpjbrVjKkYKy/5NCkTTibLZRnRdqxxhbsvUNHmQj6GoOiISHi0YDsVa+bKLDGuMh0+ZjXvzSKy1+gMjeCtNvXMIW7zYO7DlLmQ1RGDurBoCOI71ID8FTJE/PgmXE7IgSWKeNmrupw17F1mRm1V7BYa3pvsQUhAVqqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HLS3JqXDAzlg5SJ3aDGsrYtRAtWFuG0Gc2SMmqzl2c=;
 b=D2b4q6ASq0BTA50H3WgyafNlqzaQ/UGM7df658+cMcvKLUGbuItiiQOPkyv3p1B7bDfv7fdGhIV77W3R+jxnWrgAebz+a168MG+wu4PryIM0UmmFiC8kb7e8ch9bp4mmCBBdFmI5UvNofe2rjtI0aLS4wEAgPk8wch8rROB1AqPenjLrZKXecymhfTSraHaOZQyWwh6CTZ8PLp99WUtgu7A1nG4c7KK8MMqmLM3Bx0dpvHj6CzKtiKCzo8EsvbmnHEIrk//5MLckA/VIKVgOG6Wa9gVm+NeeoT908+0lD/d6b/tQ6W1KmDUyaahRRE48tKcrIbf0RPLKgC0gdJy//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HLS3JqXDAzlg5SJ3aDGsrYtRAtWFuG0Gc2SMmqzl2c=;
 b=MfTMKBy0WqdZctZGlD+/wUhdtz9xW8UMsELHpAqvDhLJpdYZtgZ30DRO4ocLwLmJKd8GlL7H9y/BZWNaI9/pCCkEaEL80BIGIXWuVLdaEj8N33i6ciJsrlcU3oq7YsFt739IXZi6NBUdl5OXSmko7TEH5Z+nwdTewjRQ8//3kTs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5828.namprd10.prod.outlook.com (2603:10b6:303:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 06:51:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 06:51:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Clean up tst.errno2.d
Date: Wed,  4 Dec 2024 01:51:52 -0500
Message-Id: <20241204065152.2899-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6cb5c5-2c87-47ba-26df-08dd14302443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tsKAL/Ie80nIFVZBWQoWevkGRxG7I8YMYvDoXJ1fu23bgr8Z5TF6g6kiyALI?=
 =?us-ascii?Q?EBjVQ+koCWeN80eV9rM+QsNb7cUXnmz6w7XifMXM/oEyFL35QVRSNVIDPk7d?=
 =?us-ascii?Q?j1HT1ayo420ELlrICDCnqxvW/zB7jF6k+hE4ZCxpJNQIpyqmVqYJG5SoHh7k?=
 =?us-ascii?Q?eG6Dv9LLsgUogkHx3auJdX35xKAuDet9Mfv7EuoDQAOXM/XH/mdyUAkWfsQY?=
 =?us-ascii?Q?iRXMQTKRACGba+R4N4vudEwCOqDMMaUnFNH0LfN0g11gbllZnDttal6T4K2f?=
 =?us-ascii?Q?LNFlhGHUhWGGI8WSiloB58fRV6BzIQnmNEJWWSYhtQINaQ8+w77Do6ihF74W?=
 =?us-ascii?Q?ngHBf2tx6XyNRdq4R1w1U0fGyileTSyHT4MiDg78gwD9aboofp7N7ccqHuK2?=
 =?us-ascii?Q?AvVNJcukksxL4uhX6qdxjruLJupVyOv3tN/BrFvM0HbXrt0O6BpHl5hXBo0F?=
 =?us-ascii?Q?FW+e4TjL9uQTIGafz6BHlwI2xIGBkuz+sq6FYZSy/EYIAczC/fHz7YdK1HpK?=
 =?us-ascii?Q?7BWsbdgOBAXRbDiycKXpgLEcW6iIEpS8Oh0ewFySeeoQE4/p9Eds8fCYgG9R?=
 =?us-ascii?Q?dpq7xgUyaa2gBzWn5wQqQgNUikS+0HfaJ7Bx177y9NrpK68dYREssOMXwLtl?=
 =?us-ascii?Q?l26eDMkpzpeRdeaA+qbsWU1C5zZf9QS6Cah2ZNBdDmAZxJcd6Q/cmgX3SfKA?=
 =?us-ascii?Q?X7lV9B8ojUbuRznd1VB0Sp40Fp1e12a8EpX1qv8lPKbPEsHeBJGufxayYPim?=
 =?us-ascii?Q?uV5PT9mrQijkU2wAWaggBLQm53zJP0Ez92rSE2fnamD/zZ/FLHrDT4WhpMuD?=
 =?us-ascii?Q?l1O9nvPDtjwcjHKcJ4UGpmoc5kRF5s/wBVT5dJWmqYeNm4A4v14Q8UBnpXy8?=
 =?us-ascii?Q?g9CULEEN9ZgcN4gEX9diNPlOlX/pSlcIlSDDjhgB3cMcmrTQTS4HzceGwExe?=
 =?us-ascii?Q?2q0TKv8+CA9nfSf5AW2FrnU56LHvkLE85FHo870IZk05RL5+6tGU1nbLS3y3?=
 =?us-ascii?Q?6kNJxmHpJBYp2XG5QeFFzLKqNwRIuJniMIbYsGpczYDZJclOWTT7640qZAUW?=
 =?us-ascii?Q?JPTXmcOEjRYsrcMitMZepiQGNAReL9zHOVwfHGQOpJuY4iIxAm/Ei10izbn0?=
 =?us-ascii?Q?882N/AVN9DyGLGZ9Rx0W2FOjiRDAms0AH/ELtUqejwG3zt1EWC/A9YcmguW3?=
 =?us-ascii?Q?Ix2k7JB2v38W7wNhCoIvCUUpkjSmFt6absE64Sen0xJUan771sGqqXt6DmBm?=
 =?us-ascii?Q?ZlTd7olBDE2H/qbxcAWq9ZdqpiVhxZNchFZPY+xqIBd2r/HillkuBOVg7cHs?=
 =?us-ascii?Q?15i0uwYeSsi+IWi4l2l4WHKUjwyQPITLzUIZMn0OSjLeLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MnFrQ0CZZDkFVvjz1PJs+v1KcthiXftDbZtfegKYC0pem0uTO6FwgdKCjSRb?=
 =?us-ascii?Q?AuqaPHU2Shi05CQ5dR5RcY+UV4GAEITbDsuvhX49fDuB0GVMdOjlpUD7gFa2?=
 =?us-ascii?Q?QwkO8Bb55n+fvXCm8jOH0UQ5TnDZx20iJnHw/14V+6NZwpV7P1o5wIzppnhW?=
 =?us-ascii?Q?W+2YIG+UC5buEBb2/m6Mjd68e1EakfJ3N/Cj+OFb1Q9vTo6+TlatKaypEA/Z?=
 =?us-ascii?Q?eU11WNsDsL+1J8Qef6pvQV7OfZUedVED+bQglO4RpCE/zbhQzKwShPMlVoli?=
 =?us-ascii?Q?iGm+MNN4Nq1vZIOG8CGEL3Li6kVUdnplAzdJE/jnDCvF720tmgRDlo4awsAl?=
 =?us-ascii?Q?7ERxTYK9w/RxEpw4Z25yijZMtrIXEE0uEr3DoCa1UobP+To9Ry/XsSjq4ZMH?=
 =?us-ascii?Q?rXhxixygG5Hc4wc4Mty8uzhGTFphyLkKiMBXPzubv4RGi6OToC54cLgoG8bh?=
 =?us-ascii?Q?aBdJTXDtyx5Kx2pUIJh/Gnsb3/Nma0zZtNSCtRZs2Yox+ab7d3DK0LC6b7Gv?=
 =?us-ascii?Q?jfklAx6poKtMTe/qzPKM9RG8BwMkykAnwDtv00dC6GbSdf9CUvDaCoTpJSZ3?=
 =?us-ascii?Q?l4X9GtO+MzQlKZmo8UdcJ6cOrM1M+Ysw50RmRQDgtIHpbU4jOoGRXsvIjNN7?=
 =?us-ascii?Q?AdpnLlR5z+L+6F+QWbIbdf5G+7Z/zDGHzbYVFhcy/sP4utTSvukid/HksVq0?=
 =?us-ascii?Q?YMpRZ98BPw+00bmIf513o+KuRirCjKA+VyKM8FPy5nzT5UA4vJm6m9lQXlMC?=
 =?us-ascii?Q?6HIkyzPkPznsrWgZASG1LpNvBqW6oLd0nGRx7ukI52lB7H/XKRUP4ln9TKKh?=
 =?us-ascii?Q?eYSAb8paf0pG5h6gGY17q2OPB+sHCbwWrlbTgfihizq8uCjUYlaOSp9ri4Sh?=
 =?us-ascii?Q?1Ks4uxcdi5XAfFX6r7DvCU9+O+I6KQrTwI7p/Q4ffy/0KQ0aTEoma9dmlQb0?=
 =?us-ascii?Q?k57iXYkVRcM+ain0CFiwYFLr5BDrHJ5EizxzQP/e3P7GF/gHMum/imUuSAHk?=
 =?us-ascii?Q?SWT5GHSNX9oPr+SgQ/LqimSr7uZ/MpxrIx9c+Wh338n4GeH3NFkeExCws8gT?=
 =?us-ascii?Q?xU7ona5y5+uvd9Hxi3CeM9cr848mP8jFAolp/mQWq5hM0DS3Ua/VnVWEj6uG?=
 =?us-ascii?Q?H/e3yWjKOLFIWPqiYn+ogabDKajbb8/vNLiZATZ7wqhHumJWVNmqUhRWu/jT?=
 =?us-ascii?Q?YolUntMCpuuRx7wWxpDfW9zbK9gkG7JDCOHTNJPHlF4zhhHwSAKRABmJsuOW?=
 =?us-ascii?Q?ZcR6wcNVIqRocj8fAf+M/mOznLnZQlqLPewMWIb5KxFzExyIPX6cTAGs0kbo?=
 =?us-ascii?Q?NNMUwdESFpN+U5pBJzOu2GwBwuMM0SFsTBlEAzgWtHaXR5j4i97BWTSQeoGg?=
 =?us-ascii?Q?SgIF/xLgb4Ybr+MPbjWAo1xqEa8aC8+50VLFrwkcPXVnzqYyf42F01Oaowg3?=
 =?us-ascii?Q?b8u3/xEOexDKsSHteF/aCPvezG0x8xwH5cmcqaiikdHnGB0K2/xuLRDhUyw8?=
 =?us-ascii?Q?WSfQbjlc8ZUDpMpXxAH0q8SGTJLIxjLbuBe151kJTlYt+x2BsPQ0fr1zFlbI?=
 =?us-ascii?Q?Twb0SiBAbVikloaz+HaVzr/8mr+yKjVMLhdnGhiN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S+vnBrTZYXc26nX/WOAWbznVzMQFFCqEI0x5YTgEZtDQmC2jRlc06F+C6hOcV8vKOvwQ3TJJMdRzROgKaUgixIGT0S2jTo4PXZAPq791itMnvv6bR8OuLPGDsS5RnWQ0Fzzrn1jVB8FafkJh3mJi9KDH2ySnqoD2fLGhk0Cyx2O0sfKNhh+d0wfsFYN6NqQ7Bv+39a3fNeoddCyluR1FrDjqvO6OJWz4kyrIZ4it3wS4qBINwvB9j3jK4iZ0GMgq8mZ5uZ+Ng+VkUaK73JUbxBqM8QCQwTVip/eD9fX4emytHLYuOlJL68SEyX2COoGOQMAiArh6NOMAyeduSQu+GD9Bf42xv36GgYdJRuvySKeezlvT0fW/1csXpANPZv6xS6nWc5UQEIa4FFdZ6fMxExX2H/UO+t3yuP+6qd8YBA+82+HCfF1vDMqKUr3t09sL+cW+pkDi1tVbToJNyraUmYmCFWMw6AYojQH+yb9KvYccoeVkTnibGt1x6+J9uPjDgumpmhRr9wrRbfm5SLs9PjxMGEFO0ZVrMa5vGaWItTUAkB2vZDB+XYJKL4wVRMDcerW32KiP0U8lpFYomWMqst79bCCdGfFteMrmO6G7YoE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6cb5c5-2c87-47ba-26df-08dd14302443
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 06:51:55.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OafcAJec/T/cKSkqSV4wqWCgMrlLToSvr4vz55UB/6SQPVJUyQrICialixMNUkK/xmIkmWvT6HSBPPFd8Rfqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5828
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_04,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412040053
X-Proofpoint-GUID: Fi4wlYmeaJy4QHEKgjJnmlYaMNA77OT0
X-Proofpoint-ORIG-GUID: Fi4wlYmeaJy4QHEKgjJnmlYaMNA77OT0

From: Eugene Loh <eugene.loh@oracle.com>

Check only on the process of interest -- that is, /progenyof(parent)/.

Check that self->fn has been set before applying copyinstr() to it.

Add option zdefs in case open() is deprecated, so that the test will
run on aarch64.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/builtinvar/tst.errno2.aarch64.x | 2 --
 test/unittest/builtinvar/tst.errno2.d         | 6 +++++-
 2 files changed, 5 insertions(+), 3 deletions(-)
 delete mode 100755 test/unittest/builtinvar/tst.errno2.aarch64.x

diff --git a/test/unittest/builtinvar/tst.errno2.aarch64.x b/test/unittest/builtinvar/tst.errno2.aarch64.x
deleted file mode 100755
index 5c66540d1..000000000
--- a/test/unittest/builtinvar/tst.errno2.aarch64.x
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/bin/sh
-exit 2
diff --git a/test/unittest/builtinvar/tst.errno2.d b/test/unittest/builtinvar/tst.errno2.d
index 22fe8b4a2..939f4c7d7 100644
--- a/test/unittest/builtinvar/tst.errno2.d
+++ b/test/unittest/builtinvar/tst.errno2.d
@@ -15,6 +15,7 @@
 
 #pragma D option quiet
 #pragma D option destructive
+#pragma D option zdefs
 
 BEGIN
 {
@@ -27,19 +28,22 @@ BEGIN
  * Record file name pointer arg1 for the 'openat' function and arg0 for 'open'.
  */
 syscall::open:entry
+/progenyof(parent)/
 {
 	self->fn = arg0;  /* 'open' arg0 holds a pointer to the file name */
 }
 
 syscall::openat:entry
+/progenyof(parent)/
 {
 	self->fn = arg1;  /* 'openat' arg1 holds a pointer to the file name */
 }
 
 syscall::open*:return
-/copyinstr(self->fn) == "/non/existant/file" && errno != 0/
+/self->fn && copyinstr(self->fn) == "/non/existant/file" && errno != 0/
 {
 	printf("OPEN FAILED with errno %d\n", errno);
+	self->fn = 0;
 }
 
 proc:::exit
-- 
2.43.5

