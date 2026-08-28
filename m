Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50783769E7
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938895; cv=fail; b=FbkCLi8kX3OYekoq1Orf50uwzJRh+BCbrZkHgTU+jHueU0NEAC4XDnAwKahEMDmFZbfPIC/K8VP5Tb114admohbLPU83MkQCRqrCPuu15Qh82qZo/mtvhgOCuw5xOKndtiZ3n4OtasEixGW/oawP/aQgcwLCQEIpjZmiYy99a+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938895; c=relaxed/simple;
	bh=8aODi81vhFeXrkQL4qitF3frttqn4KGIhAwT0cnDH1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A52pPQt21pi3LygN2MrNsoe8l2sKclenz79hKPCCovD/ruY4gPUDmMGT+inCKTtiBV8n5FP8bwfmQ/ew8trd5lTtOjOwIE4+5Sc6GV7lHDiZsUemX5Bk52gu3/KeBXQm0bi1VkhND7vCHA436DvLOdPrMUBNaRKt9Xw1K8faFns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gIgok00X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k4R/4cpz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gIgok00X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k4R/4cpz"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJgdW3515639;
	Fri, 28 Aug 2026 17:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dnP0T+juHrv7DXxojI
	8VygYLryv2RV2AstkyofyfnjQ=; b=gIgok00X0m94jJFBxNo3PTv3WY6MHoRqco
	GcJfEPPb47f3MFhLAP6rYsjG3Ew+gQTTLbXjzgsDDRnr89ZLzBhqskdV+8QIMFew
	xRcYqw8mLbijqfQ/hW6BfYVx7HpS+LXMOw/kL+/BEt4qL8ZSHsKNgqQG0Vbr78gd
	rvnUaagHs86PpbN6Dl1AZpgn22arGl1ITzVVhSWHqw7tcME3emRNld1MuCdM3ObN
	S+hJR1GVyu/vebSUE+ddFtA0gV6nihhwucQzJEf43HHewMBjLlTi62xHwk04s+tb
	jZ11Ufbm8auWH0Jb7vnvVAHyNvMDHKp2XRxQinD+cbuWnOJy5RuA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73n7j8uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Aug 2026 17:41:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SHeJvf010593;
	Fri, 28 Aug 2026 17:41:30 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846hcdws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Aug 2026 17:41:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ujq4MBsH7u31b6v6udNN/uQhggJwZt1jbJuQ7Mzofkmkv7l+RNhcw+ZsPv+BPtNYyFRJf/SnKoDGJbtdykGwInc3np8MasxZRKugO2eVa8EfsCBLSpvaFFGqJQneBeZPxu32uBRgFoTQOJOXw1B16frFxtR0aKm/x8cGUlG8DK1qE9Cvuwlq63oCKEt98yjJIcselM425OUv5RsVo5/eibSTubeTEpQ0zmcgjsuhVGwKSPdzlOZb9T9zDcr7NMFcjA0KwTnDEwtKee4+Xjf5Cuy6hf7ZdAaHGOwB3eN8WzwvVExTYoA8ha/ew/G75PjUEBjeYWin6qK5EbjrSJlvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnP0T+juHrv7DXxojI8VygYLryv2RV2AstkyofyfnjQ=;
 b=vRJ0ZWANk5t5cb8Bynrp1sxSi+2jVHxXk/iOcDyfy59wG9e4+7qs/7BW5ww7bOs1E4xG790EfQNK6K6LAU9xrNoQeJBjbYkwIGez7o0ClcfWcIXNiwz8bHpHe+DhQRTzC+H2/LOBXwg0tCXSJEk6WW4+vKGkcWGxqJX8l1Aby2+ww6fFS/MGTIeSMe0xvkGnuL93zTsD0Yls4pDyGsGQBNVNA5c66/3/K9x6YIlXZyjdCs6VfpUWrEWI2/wmdVX6gouX3y7XAQmFN+SZIkAbD9JcRGvwRWQHZOkzbSt755LryWDGMJ6PH09HgIREz2lWK+YpcPB25VbqFnQ7ouHfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnP0T+juHrv7DXxojI8VygYLryv2RV2AstkyofyfnjQ=;
 b=k4R/4cpzbk5eYXJttGhZmPK8vHryM/tZdiEAKwkVLqnQIYNhxM7lrcu/J6cnDw7g79S4vVfkW3NJ16+ZGMS4VBH+Df+Dl9FdnjHwlOYz5d7kkvJ+xiRraJSyiJ8AmNTGp1VXNGs22VkuSfZ1QjQxNff/sVNXt0wT00+BKHCKUGk=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 CH0PR10MB7536.namprd10.prod.outlook.com (2603:10b6:610:184::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 17:40:52 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 17:40:52 +0000
Date: Fri, 28 Aug 2026 17:39:56 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Greg Marsden <greg.marsden@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com, zhanxusheng@xiaomi.com
Subject: Re: [PATCH] llm: fix newline escape in the SKILL.md script skeleton
Message-ID: <apHH7EKhUDMzGPwo@kvh-deb-bpf>
References: <20260807023349.1133517-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807023349.1133517-1-zhanxusheng@xiaomi.com>
X-ClientProxiedBy: CH2PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:610:54::36) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|CH0PR10MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5683b804-ec9d-4388-641d-08df052b8141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IXajXYoCxgTslaXijSOqrDxnljX6YqLRa4aup9oHOruBeOBFC3+lbzmPLaxVItA+Fv01CqHsPQ/Z8Nqze+oc9MA8wfCKn9oBv72HzuVhGjzVV31w9f92WOxnYDHGoyaTy9nXAntZIk7Y04csp1vAEf8B5ly2a2zfn9wyHPTTI0jaEPNX44GxF9SdGL9MnpZ/rUdgyxXN8Xv6+KmmNTzgZf2ZJxvOawgaanq8gCGNIVn5rm7hnDuD7XOdOhDF8d8vhZ3YUTiHHyQVpytMvdEuz9nsByLpDEUdXgP/HFCYt/kPpzH3214uttgOQiiAP2k+GwwmE2RspKIbxi08Mk5NwHKhWoA7ab7NPNZSiRUnE9fI/3TnD2SZcn1AO2BhvMGzpRtyqQgg5KLCikP2hyIk6AdxPCGS1eHKYsamGQqWDo7PYWZLyc96X1xoIEXNjAHpdGp5oihVCNTQWA/5RyWOrMFxKbxICYdPcNFj1DNkfw14c56TfaUzNs3RsYtnCP4DCQYhw9avFeh0O/HNGI8qV+NqFKjT5QtbLEebp7ohlDPrrWeQH9HTBl3lVgxC08vEl5fX9qHfEX6AUFtDkM6dh2+SnxZyYc6h0iG4VKC2WdQbZsrK+fYLn4O3U1jwVA09R7xL8pLzxXT/q9QqZYjYTz1gkhFf3oYWa8/rk8uFeBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eIThDFVbJfBryKrHmNSTrlTtTzN+PK4C0+e7qTDAdbEY40ShwJ2aVxkfHBD/?=
 =?us-ascii?Q?Zd4WzO95fThTpbujHhceXFwY3GoFl+UxyOyfpYI462VIidcKaCZ1lPK+dBxJ?=
 =?us-ascii?Q?du+/HzZ+Eczn7GnPRAGssgYNnRQ++aFFBOpI4HEX3HL43sx+OGcO7N1NqvL3?=
 =?us-ascii?Q?F95Pqjt78762swwvVxAdpT0sjibPq7s3zjeYUj7+Az1O+yDbD3LaE7RMpEyI?=
 =?us-ascii?Q?ezNUGhYDdvFnPq6hRsl/jLFGK67HP0w4sOC3BRI0UCxOx3KzUdTKAOWP1u4D?=
 =?us-ascii?Q?AK/V1M3C+CQk93gZ9fLoSH2fKQb5UvqeYO1SkgT48Gt6Q5CJi+2nd+ixeJ+J?=
 =?us-ascii?Q?rX5NRVULSvyFYO241+9eWS3j80F+J+KWk2XsxSTF3xXrKNSeyFOalxP8SxQV?=
 =?us-ascii?Q?FMuWfCmd8nBUrqph+inkuOnEoSl961x7KuFOmrTGrTfAme2GQMWwem8OKgkX?=
 =?us-ascii?Q?V719pi2BcNE+Q4GIXEvOXIWsX53ovaWZOQPPLIQwmZ8pIw7YLMAQazG2FxIk?=
 =?us-ascii?Q?w2q+cdz+hD9qcdhle9H5vMyliB+3Ew1oAQvt/EWbipoZUMOVjLc6FK+Gu6H7?=
 =?us-ascii?Q?uoh8agQEfFyyUMKJCTtVuW1hLg0TT1BpR9onYZjTd/Q6qhEjOxeLWwA2H9Ey?=
 =?us-ascii?Q?bskDL2pk2+avpynZ4j2tsSsnvVjdlty5nmagcP4bHiH/vgZ37Zo194w56aKd?=
 =?us-ascii?Q?bHLfoFabA4xFYfOoN+RyKlMZAOV3jacIp822qWN174Gkij+Oicil8QvXFbe7?=
 =?us-ascii?Q?dfCUDkLfwnzEocEyTp10UGWjxfWySt2cyXr6oPvX6ctLvaVjCPAIyHxzb1TB?=
 =?us-ascii?Q?uFnbV0dwsAJbQfxgJiygiFAJJ4RKRLWcpJEu5EGyWT9b7KtXit3EPt3U3/4o?=
 =?us-ascii?Q?skigVDUqj0mKZr9I59AAH6gywQNS+I6rAVzR7Lkhbg25M/87FE3Vj318mbrI?=
 =?us-ascii?Q?44eTLlrMIYmHWL0/3YYYlbvv2gG9loWdFX/Sf8J0L6P6IS0qlUmu/rmhLPjz?=
 =?us-ascii?Q?NU5GeVAxiTRWBazCT8QbBs8cnRgdnaZkposXHaFhPUCaCZsmHhICUygtmIA1?=
 =?us-ascii?Q?Z4UWQSrT90z1zfZAzoLw4oN2MYrocM/Ra8kBrYivEdZbzRtv4pLVZRD6eqvL?=
 =?us-ascii?Q?ZRTYnCJrVrTlxnpYMOwtG+PtjSus91ynihCyRb4xmVZs8DWxBYPkc12w6J/7?=
 =?us-ascii?Q?GExHw1pQ7MIk7if9ewYBaSW67aX9g5wAEDqFGq7CqNV/8X3GtgNTqPCADBtu?=
 =?us-ascii?Q?YV1ZSk//473eHsqDJd1uZcvBJRV88zLOlgkI97jNgFLGA5tDfjAzr17S0dow?=
 =?us-ascii?Q?IAAXNq8uL6oixQIoOtM4QFCk31JeBIWYrPwIAB8cGKxmKKQZeTZFJ9FjB/8N?=
 =?us-ascii?Q?4IpBqkpeqHq7y06DBpIZal4DlHGNY6eX5GlVX+TXMM8DOmB/yV08NrcAo6hS?=
 =?us-ascii?Q?c9Lylsn3QWmhtBc+VKZDMQXCXtWFPteCkFfx4btTuN3T8pMuP14d9on1Jh3Q?=
 =?us-ascii?Q?0btUe/+IengHKmC16t//5PKlsSBRumXxk2IJF5MpBxEszuamvMwK+I3BQyox?=
 =?us-ascii?Q?PqyIZpGrtV3aCKZQoiXrgXiQyHE4bDwLC4m8c3UZzE/FrJWyinfYBXjdROEj?=
 =?us-ascii?Q?jMdzBVNED4bu9FmufVueGm4GhxKbnoj7bC6YQFRYpA85dLhnzsxd0AWg8i4S?=
 =?us-ascii?Q?zEco1eDuzU7wDslFT58X8nQeyWw3AHsPguNyTOM3l8L0PaQsgMTJfV75y2dv?=
 =?us-ascii?Q?COGYuL/0IrBSN/4+mJMwouL1wsQq9a0=3D?=
X-Exchange-RoutingPolicyChecked:
	wWj/x3gx2SgdMB7GHs5YWaGvQZxRs+gN5q3aLn67s+hNewR0KO09SqucOvRykruqvKmfilvRm7N3tISl8+lGAkko2hlk/YE7mFAA7WzGBXaiJogDAnWBasiuOEJfkGtF5ixR8l0nTBEg9OQmJ+TOjNecVkqUP2JRiwvqQE8+xBBIRrcoPUsKXQrErvgVUQ4hSSZkvBQOLj5N/pyqYicWelGpVzRuyWjpmdAFkUn1jvJm0RUstKkezXSGTwR/FI/5cYJU8Wer4a27quibjkaN7m3Wian7nv6aa5qH6JIb6R7O9CuA8rB6ldsuzD4ZJ/x/3hyHVrBt0Wv+pBpPu5vByA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IOMjIJIJDpawlfcafWBHAYw9oWRyVw7i0EsH+xDFQs1iiYSsQ0HBbSoiOQWjzhYmMVYtqUOID4WnNLXSqD74DTwNkc7DIzig+8kmHFmvqGfUhY9klw9/vQ3iLzVf9F081E8C/96sNp+YTjeZJSxwlX+UaxXPuE9RFqoZ9wyQo2JaGWxDvpESNVIsX+0tmo8euXttHw5eRK/DVoen4O0Rz0r7N0Exy6rbWNTg7Bcs2Ha4QO7vEQ810AmH70sH9nrwub1nhmmhtAcHnAlfAtrMrlUDfy2r1I9KFtPGCuL/Q5thmDiS8H86XV+ekVsVOqrjw2lTIzwENxRCq+pYCzLs2x/zGuUzN23E+jJ1mqnl7QUIMUx5gVA406tRQbbrDw1uTWtcdyD/CY+4v761tRUGynjf0HYyOmb/YBRwdEIa1iBF3XYIaOhOHtaL/q/3y9RW7JW6M4PkGUMlZEgzTSyuO6WfbbXKlNkfeJ/iDohG8dAajdoxnC32jnJ0+dCOsfxNbtjR6pWx2Fhecv9djG0hk/i2hVmvBAGmWcQ4ax8pyJkPZq7XCHoQgKYvh5iveCn4c7YVXwcRi9cfKLUEPd21a1CD2vme96yAEoJvEcK0pJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5683b804-ec9d-4388-641d-08df052b8141
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 17:40:52.1566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2j4YAGTgYeQ6QpoYGMhqvkCt2BNNuPUg/PTvf51nCl82cdvZRs24cWUINnovH1A0UhVHT6SN2MGDyh2OZRuR6fXW9dsJF5cfaq799e8aW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608280154
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1MyBTYWx0ZWRfX62hVQvZIX6yR
 VbSFSVCdw6T50bYhVZ2aAs7wC1tVp90BgU35TfroquUztQUIFhjRHDD1ykZp+Xhc5xexC0+LjDE
 Hx5PY0Ny3t0Fe5wyXXE9MtL6Lp9Fs6NeaCekqCkICRBWmSbTWVnxppSK9X3kbywxeMrQoJ6GB17
 CnUe5peyVd+Q/aS1Cie2U7/68vP6PGr8o24gFjLfBRYVvIspUrsaJUEwgnj/8ePJHL2Q3mO55hK
 RLlka2Jqc12BOptVF7iBZvEeelpB+XfX0j2s/v+51uCoKH/Geb1Vk/sQk/nDqu88DDoSp+f4xbA
 AraS9mDleSJaldSybM+PJndY6FC+jsNzfBbyB8F8G7JHu59rHd4n1svGqLs77CTdp3F6jRrcvL3
 vgkmys3lvDbAVjEuERAYhNgLAYX3kIHkPybqHnokLhwG0XjDG4DZZbv+4rm4YNF+iMrlSAh3y0D
 rhwAyOvvViewP3M23Ug==
X-Proofpoint-ORIG-GUID: 8kr9UiykBKAJQyFS9Thkhy-kHsZ_IOQe
X-Authority-Analysis: v=2.4 cv=Os9/DS/t c=1 sm=1 tr=0 ts=6a91c84b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=IeNN-m2dAAAA:8 a=gwUGBOpULEMxMbTVbrUA:9 a=CjuIK1q_8ugA:10
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1MyBTYWx0ZWRfXxo/y0r7svmQf
 rZlfAwjASJf6lMOJbGmgBFMgAECLyamhapXEUSf5v8+xQVbU4rFyIWzdTkVfYEDzrFzNNfrJHJf
 gQGEq3n3aGih1tlzsIP7HP5j8t+5SNfgOpEPk/+P4Cvfg/ISb+Yv
X-Proofpoint-GUID: 8kr9UiykBKAJQyFS9Thkhy-kHsZ_IOQe

Thanks!

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Fri, Aug 07, 2026 at 10:33:49AM +0800, Zhan Xusheng wrote:
> The skeleton's BEGIN and ERROR clauses use "\\n" where "\n" is meant.
> In a D string literal that is an escaped backslash followed by 'n', so
> printf() emits a stray backslash instead of a newline.
> 
> Agents copy the skeleton verbatim, and "\\n" is a valid literal, so the
> 'dtrace -e' check prescribed in the same file does not catch it.
> 
> Every other D snippet in the tree uses a single backslash.
> 
> Assisted-by: Kiro:claude-opus-4.8
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> Not tested under DTrace; this is purely a string-literal escape.
> Applies to devel (30c9c22).
> 
> One thing I left alone: the skeleton's ERROR clause prints probeprov/
> probemod/probefunc/probename, but those describe the probe that is
> currently firing, which inside an ERROR clause is dtrace:::ERROR itself
> rather than the probe that faulted.
> doc/userguide/reference/dtrace_providers_dtrace.md gives the culprit as
> arg1 (its EPID) and the fault type as arg4, and
> examples/language_features/001intro-ERROR-probe.d sidesteps this by
> printing a static message.  Should the skeleton use arg1/arg4?
> 
> Also minor: the "Target one process" pattern needs -p PID or -c CMD,
> which the suggested "sudo dtrace -s script.d" does not provide.
> 
>  llm/SKILL.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/llm/SKILL.md b/llm/SKILL.md
> index e5e2f3e..a6ff502 100644
> --- a/llm/SKILL.md
> +++ b/llm/SKILL.md
> @@ -66,7 +66,7 @@ probe-descriptions
>  
>  dtrace:::BEGIN
>  {
> -    printf("Tracing started...\\n");
> +    printf("Tracing started...\n");
>  }
>  
>  /* tracing clauses */
> @@ -78,7 +78,7 @@ dtrace:::END
>  
>  dtrace:::ERROR
>  {
> -    printf("DTrace error at %s:%s:%s:%s\\n", probeprov, probemod, probefunc, probename);
> +    printf("DTrace error at %s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
>  }
>  ```
>  
> -- 
> 2.43.0
> 
