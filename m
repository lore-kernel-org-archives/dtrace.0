Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066061;
	b=kMS7ZdCsbGv4YrTgMILScXEj5y9za6a9Fui406w2kNdiRa2OAtN/o/L9H+QRHEtN0iTS
	 9tYKsGwL9yXP6N8A7sLNPND/KtfzWkxQeo/ybqjM6JQOVC+vcAjLsbDdzjcef4+TnDBDS
	 IuoY8zR02EON+BqGIG/ta+THAv3pLAtZoRxmfR3dQzeCcv4JTDqlW3L0mhdGmMe9cQnnW
	 hAh/Cl0Nejl+kWLgTmtz6fzjsloQGLKb+JsqxbPMRYQZOm5yNIxlH9yRcmG8/g/1IeikJ
	 9xtAfdRT2brLTFk9PLpY2iVUFgqY0ho11W0v0aAkQLeRzQ8MXaVuzMGoOWPRpWP7m4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info;
	bh=aEZzKiIbwOSDEdHjUCh4gEICiGDW137uvQhlyOlvAfE=;
	b=4j55cM6kEd3GZ/tCuV8dDQKd+Z8G1YBayksTkrr4oszwWvUmhN8VatT8yhjGDDku8fML
	 9jPbVfhiRHPvEx28Oizg3AAWoeiJFLiDbAnWsQoSpyq0tq3g72Y5mdI1Vb0KZmW/gPiUa
	 DxCnGcanvuY9lMSxK5UpA7lhUJWPgypGrGZ95QzawNvW0jVZscupEb8qtzwD3EeR6P2ri
	 QSj9FotLTLloS2mjM9EH3X2cK1oFb405Pyr6rAQc3lZGEKgVFMMrJKPTVz+rsYGgFhrfu
	 TIP3LSEEdbrttqWXL6heqyviATfCDpZdGBVWCeZ5yJt9vHbZKbggv7Y178v+1XcipiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=fgxnOj5T;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=frE39qe8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B58606A32D
	for <dtrace@lists.linux.dev>; Sat,  7 Nov 2026 15:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B58606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=fgxnOj5T;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=frE39qe8
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7FeKo2739506;
	Sat, 7 Nov 2026 15:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aEZzKiIbwOSDEdHjUC
	h4gEICiGDW137uvQhlyOlvAfE=; b=fgxnOj5T8Cu4FL+QPRix+Wc8WAUTF6sL8U
	lENZSCK2cBfh9DpkgPVuRyNLcpgaM+zzHzNN3vOQcmFMCsAgC6+VVC+Sqp1AgDYz
	+xZlIS5L1DPKFtyaycEmNcd+FdmK/C5EsIjl//1j+ksvBDvB3Xfg9kOFrtui3OIm
	m7GRuUXuWGHP05Os1Spr2nf74O9n+NtI/QBcDLSSTOaRiVxHP64W3+Y6gEOuXoDQ
	xqIDTz21TPDYPCnV06l7vP9yZn/QyG4HruNlq4+kFuDGXKgX109/XQH/jjaPW6Pu
	LbKLfCqhWofWTgDqhlvoQmOykcukuWQ/u/Syq4XUYdjhClqzNjhg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hsv1b8bc5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2026 15:40:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7F0IFr1345175;
	Sat, 7 Nov 2026 15:40:54 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ht4h9ay1e-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2026 15:40:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4Q6sVyIXJdn2mKHeLWDtoP+GbG2fKddAejYdGPjwyNkQm08tze+3Nce9K1Gk0f1tLlMsWq+6EDS4/H7zCPoqMfLtTsv2ggD3MpCW1EFmqyQmuBapLU1qkzs8VNzypSo2ahL+a7QtJgKOSzKpOqbQvA+6PrGphyJO/Wn8QS5WKz3d50NhUjZAxtjTgdlv4MywNtkddLEtvEjDpRC/5Gwd9G6kv0He/5vywik8DG21AKkRSq+27HupgMByblAIOi0cv1jCvScFFH2OkYA9cIQjkOW5BUyv5ibrhJtGPTeeEPwOIYHJnzK32JVx/oX3TO6qgxLjs7rGnKeksd1d3dXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEZzKiIbwOSDEdHjUCh4gEICiGDW137uvQhlyOlvAfE=;
 b=D3kI+a37u2Qa/QkMKBxhtYfyncIGyN5jQm/E2AkBghM3lwKX/5xD/KVKS6AZ4i8hZOtX49GW9lSbY56AGrAMQefJZ+N1yDSSOECWqHRvQW+W1hJQPAsWBDEyYh4Edcig+GPgptPeJQjpJxU+sgNoxpMpQirXYcQKQF0ouhSEDS47FFmXl0pXDWPhT7nGFhjzPaMKYZgyHnowmfFLfuF8H+i5TUn0bXryEOU6DgfVwdLFH3QnIFVh2WNLXGNFML7ZQAdoMIqBPd69H1OSPZmvot/OpeldjIdgt3eha+FpVNVqPWZjclOTvyt7c1wKieMxvLgxR8Nikiu5+xVLxq0gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEZzKiIbwOSDEdHjUCh4gEICiGDW137uvQhlyOlvAfE=;
 b=frE39qe8I8fneBPiYxo6vsPBrsH8Ut8/S21kr2OfPM5u6ZSzdoHDCpun6q5HjZlJKhW9ZFX2D4e4O1i6OllwQOa7ckK+o8VjRz0xLKt+ubMf8XLnRTq5IAN21zVGoHLzH76qvMiHIciRHS41I6/OJC/5nuN3kDYChev4tDVOjls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6030.namprd10.prod.outlook.com (2603:10b6:8:ce::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Sat, 7 Nov 2026 15:40:50 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 15:40:50 +0000
Date: Sat, 7 Nov 2026 15:39:08 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 04/20] btf: deprecate dt_shared_btf and introduce
 btf->parent instead
Message-ID: <au9GHLiocuIxRTZ6@kvh-deb-bpf>
References: <031b190cb7679c63673baf89f0389b9a@oracle.com>
 <87zevmt9g0.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zevmt9g0.fsf@esperi.org.uk>
X-ClientProxiedBy: PH8PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::15) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b78877-a180-4eac-8cfc-08df3ce57ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|4143699003|261022075727099003|261021135927099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y/I4IkZ8uXf6fzu/WcaVcvkLZ5Q47uve3EKVKPbfY93WR4YfbKjGe8yhQ+RWKRG552vzs0jiLtNfFe7mefhECVLAiAZbHJWPUsQIFFveoAvp93b35jZfZsldUnXAGLeZVso29NSnUyG14LQnq8hW2GHBdixdTbZ9MZkeDAbYSZ2Hkcio8mhYzDSCoF+su7UfEW5JrmMySRDPhA98xlMScPjCRb/y6UPkSZCTUnXDBzo5zyEgDEzDvYIOClxo4/1ebaK8E0RYdZpkDTa4j/06l9wPzya31J6KowOrUudVeMO/M/H3hzWX5zTlyd/ks78gxT1llwvh/7mcM98eTk/RavnaXsJpKzDnhfXn2WxL3VLm35P8r2ypvPZxAoyvXXwq3hEDeX421Kl+3qWO430VKhSFQexDiwHErn88jh9Mcq+9z0mAI6xvyHTrR/cFVRq4VPAj3YZngJyPbUPM56xMmHvCn+jezluzeg5A1unZMRBezi76XyMmbibgOLR+nAfnfdmS91lmR6FyIahfe8B6Kg1MZxfyAGXZ3K1RCMj5vxS4wN0Tcws5Ui1Z9OCPZCL7w5x6T8jx3gQIPXP/1pnWp4XslfKWelpOXtpdNBTsqrcmD48SenKW1SPH3YqIR66M2wF56Hp4Dmp/TWsL1zu0yCtYqmuNinp+KwbjHaFvY6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(4143699003)(261022075727099003)(261021135927099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P3dTahyjTkhWEASCvP4KMSOWWVmooiD5Inl+V6SNDe5a7WhScR4BI0Qlq2PA?=
 =?us-ascii?Q?0wW4vBi/pYg9AzpXUC1EmXUviGdtqJ9WJ4JYqoTcSrDU76QGzydtDVbakwNU?=
 =?us-ascii?Q?8pwsaCx8rCmxX0vK1zzEri9VSdkjDXy5fr8YveNaJMGPd36prFQosKBECRQM?=
 =?us-ascii?Q?gYhzAAdSzrupLA8AIPabYTV5JFGKAFUFFVyAvsOnYPBUAboM6X7I11ZvQeV1?=
 =?us-ascii?Q?cDpSTVOC0tWt/vwUSI/KvTYUDxz13MjfonAPWNbR2eUK3X5U73Tuj0JjaJ0/?=
 =?us-ascii?Q?6X+EmiK/DMTwhsMtl52PUrxPei+eJsalLKGjC/3xhq96tyuIyCurIesclQM5?=
 =?us-ascii?Q?JvznzV7IzOugkiJkBwu0IeaNDXZ/rMyHGFlNGQJzcJNkPJZjBtANYIhdCejr?=
 =?us-ascii?Q?YopKV48lge4czUuX7f3+lG/eGjy+8HpTsJJOU3+v+O+ZpnsaGoPnyBDO7LJg?=
 =?us-ascii?Q?7KdFc4qQoLbp7tPOCcOlrs/QE84DHyHLi4zT6ixH2sVVEvcZ+hmgJk6l0Mrv?=
 =?us-ascii?Q?nfY7GJT59rvOJFeqyhyLlkVIccoVtiGmXYg7ZXCEf80PGWi6XwILmRzQW8rr?=
 =?us-ascii?Q?nVMx2gvw4jQGCwtdE9EDMkLmjdC7O6LO3+lsxXHQg9ISQEj/8/ctYCmt+eU8?=
 =?us-ascii?Q?jXNfijBqCuxCkkBXeIoYK9z1J/oRoPb2VOB0lsFBkNIYt3FD+dNiP2L1eLHr?=
 =?us-ascii?Q?A9OnEI1sM/rm5C6oqGiAxVUxcrgoy4kRgxNPhDfe+7HsYHzp9eRqjk222Vex?=
 =?us-ascii?Q?NpUhHupE0zMirLp0N6vcpaqcGNUdQmd86Uarc2hEdrXLM8STnabc5h4dsGuZ?=
 =?us-ascii?Q?vE/dwoQn3HG1gXw+v5B5f5Fv6iMedtnyHglVXFia9RpfTqv7dJjUYRRaleI3?=
 =?us-ascii?Q?wyinzGl8ooAdYIy20e+LWP16TRouA9msqQFplfmhZ5uP2z5JGruhcbwJ5SKO?=
 =?us-ascii?Q?Qca/QGw846YK9uT4FPKMwwLdrD6stZbIEGL2BdWlm7FBgkNX9wmyAK36braH?=
 =?us-ascii?Q?7DkzOeCj49j7uQucQCyS1U/rMb/uaNWXrI0A1D77BOn8OL4GZzLcvJMWV6aC?=
 =?us-ascii?Q?Fnp3u1ayJIPraeyMVGhMdVbcMyylw+itXb/mevae2iFu7ifJq5ICg3J9OeS8?=
 =?us-ascii?Q?oNHw8OfT7MuL/ktUE5dDVPdxfX7kVYOQNILddtFah6rLd5Kr3SEAtwdRV67H?=
 =?us-ascii?Q?oOI5L70amO9lrdebQmhSDFTulc+fO1FmGMmU+N0kPOGWw7Y0l4vPyhB9EfBu?=
 =?us-ascii?Q?h+vmksPvqvgJJ6mCjCarkBlBgK4HtzDlnuHOzXb1fGDPMkOqGu8D/oaxPy2k?=
 =?us-ascii?Q?QY5g3enw1W/rLsiu68klOuFJNjwSWLWgl44eir7eLS2urS6B+MipDaYmz5N+?=
 =?us-ascii?Q?vJvp9HONz2Lb0IyCrfhMGunme+17GdHwU0o28DtNw8jeD6Hi9cTLaMfA20Jh?=
 =?us-ascii?Q?Uy4MYSANK/n2DaSnt2G3bZhSkgKpegtmwW2YLL3ZGdyFCWXpOvbYYRmgal0u?=
 =?us-ascii?Q?0eYLvKIqCB7fX3eGRp3Sm5/VtoPn+nvVJMZPlRAOS3IKTqm0sNO/lZSjrCSO?=
 =?us-ascii?Q?lLW7wVqgByfkC36GuBsM6gMS2KDzBcly5RbcX0a+EmxPT/Oc57IXSdfLRv2o?=
 =?us-ascii?Q?tTv9cofKFRKX+FJ5O9wbZiPxKUIhEmbLghCZ63xMHmEbJEZN77jI94jXsg7U?=
 =?us-ascii?Q?MZvEvbK6d0WGo46hevTv+nj+QS7rdMC8bVeItQX/uIzdS4I72BQeBLzLIFoC?=
 =?us-ascii?Q?khc45/wJBSNu0T+RfozcUWlTIvtSf7Q=3D?=
X-Exchange-RoutingPolicyChecked:
	3mkkhGSJADkR55dd7tkllk+lTy4nUzc3ANeUZo3ZczMaOagHRRdOZ/CQ5mFwkEt7oMwh/jVonXQEVeuTLnhn5ZLTd6rWZxrnLGBAFeie/KqgAD3OyUVhHbAS+WZs9PISiA74hneHEyAh4qT9T27jIHwxaFKB1fYKlMqzEej1Vne5Z8QwnZPjHvLXUaIclOCocAnyW5yPN400InW0KCWTGfEuhHkxbFjxBT4SyNKIOnomMFUsJvadWQEAzh38acwvYcIeBTh6D582z+Yq0WmXLxNjCNHAzhW4/UMlauwR33BU2hbQWx7e/yd3KBVKyCm3UXff56G3WpdNYW69nLy97A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+nyJGYr/CgravPhr5Puor8sPU+FSCFYWxkQWwgdMkMrI9fGhmQ/qbQVur2fNW66Jl2+vQig9hTKAsFoFn3FCNasdBYmf330V2dwEidRO/M3YLpBR475DXEbhE5N3yPV/IDawvBPdWL7HcmWLcvlTZGBSiH8BZzWTU7kO9I4AWvmXh3zaiRXiyBiVgd96cVb/eBf769SodmDodtJ3iUpHatzwLQrwBNmVAItLTZ+GIXUd0YK5h65O+uw0qBe7uDjrrbDnJM1HQ/x1ciXC+K/T5GVaQhJO5KybmnwHgKf0twcWu9GDNmBt/GOVoAPARs05xomcvtVlX1OQ/ZALRsfzShUwJ2WdVHfGxyZLjFbsNtDAEcnyDTeV4Dh8qCMJKsNjqBatx5BP84X+xOrnesGcQu0RZHHXo1LFs19VDDqvLzuxkdZM03M0CDjmJRmdzak+UpfbYd9EPF/XdDstfSePDHenzwJ1oQbF87Gb7i8wM8litgooL8C3UEPFKqDajw0zcq7ScPrDj0kD+ZyTfpGrJG4niRiMrWhXJt5ngf2xg897HcaP7dq4YxUD5tMTseSbzjmxGNePQAKoAC4XeeY9Dos4jBsiO2xUr4eECTjR1q0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b78877-a180-4eac-8cfc-08df3ce57ff9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:40:50.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSpvKQ9JemPNmGpO4gaPeqBFgeEqQiWoOBK9F84D+JCCrVqtE/mgioEbLqG22FkeEyIwE2AkR5qYFrpRLz8Z6iyeGmBY5wl8muPKdqo9SrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6030
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=938
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611070062
X-Proofpoint-GUID: wUyyLllyfTgHhX06EPFeJXy8jz0hQliW
X-Authority-Analysis: v=2.4 cv=Y8NtIReN c=1 sm=1 tr=0 ts=6aef4688 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=VLrh9oybGYccJIXdZdEA:9
 a=CjuIK1q_8ugA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA2MiBTYWx0ZWRfX+WJl1tGZfNJL
 scuuuMAMItbW28DjJxA5x722jv3T/6Wp5WE4hphqbHyWelwmsp0OUODU7G4/tnWrfn3IUIocD7M
 t6h0MyAAy3KYQ5O6qcl3ntwE+23KRttRt7jSi5OqKC/YZlROTUsUcn3QoYVf5IvQiBx3ewzAIVT
 rDZrgHeA5wTV/2uBY2OJQLHSYrUWagxDEXf7cssVbyhyt0ZU95cG60Xl/SWRSJDgdKGhS796uiP
 orTr4jYO/T2oAJt/L3wSVNcLNu2YPno5J23UtzEbBkWYEK6dxF26lLSbEC6Vw4J168xW2GMFQ+j
 S0HQGmXVir0ZkDEmglRQsAjVy09oI+M9oxrCoVkINJNUyiUj5Mnkm/9rYn8W+fNZVhw1ti8J8Dh
 tn5ID3T08aBQSNm3ydc0WuhHugeZ0Q5TNbOgU7uXVlGbteRqP015ymHX/axL/5vq0Tnb0XPlTnL
 +A5Qbm8acqkjNi4M/CQ==
X-Proofpoint-ORIG-GUID: wUyyLllyfTgHhX06EPFeJXy8jz0hQliW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA2MiBTYWx0ZWRfX4os5E7YEDEIE
 7xffeixaaKMphfbWo9FbsY3e5eYQcMI3BTZZSJHSSaeUNXqgtW1bqMe8VsNif9g+Jq8iBbIvSGx
 vqdk36+hTdLXH9FZA9M4t31fEz6j/9JB6Wh/hpPLI3pVVj926fUd

On Fri, Nov 06, 2026 at 12:45:35PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees uttered the following:
<...>
> > +	/*
> > +	 * If we were not able to read the BTF data, and we are constructing
> > +	 * 'shared_ctf', we need space for the default 'void' type.
> > +	 */
> 
> Isn't shared_ctf already gone by this point?

This is referring to the "shared_ctf" pseudo-module.
