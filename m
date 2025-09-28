Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807028C874
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759038619; cv=fail; b=sWfGd3RbsRydYy/rd14NecGcXS3hbIPAzhNJj3jkf/F5U90xg9QWNqYBd4ZSJT6iZ2okfrDEUvZ/wVkBoL6XhwGLkOL732t//9mrKrvHTMu7TzwUZ6/rzP4cHMfBFgBBQrTXhU0VNONER9YCMyfz0lONZvhxWC2CX9aSUFDKLF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759038619; c=relaxed/simple;
	bh=KPYcz5b1LNgk/FDLknaguwRgFBC1Ts/8xrXqVzwGirw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=us9Z/HZCAYUyjWml5SIpZEVxvIjOpOl3103qGYmcF/V8YZ2oAgwvCSv1RP0XTqUEk59aQMfIOMFDPCYvq5MmgLOidU7W7bl6njmeq41NNfp83+Y8m4bKSh+RDxAtYexJv1dFcX93nQw8sz70V+Krio0ttB/4M8diu0AgsjgPSQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jMkss5Gb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hiCOWo73; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jMkss5Gb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hiCOWo73"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5OWkm014744
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 05:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LdJWlqEgPL3mjrqJ+d+dMnnIXMXKkhXLqUeuzRFnEWs=; b=
	jMkss5Gb+v//fG5crKycQQcti9nsTM5wda9Yi5AtCUk9Adejd/NbY+WEwbOTE0Qr
	3QyXqFUa/OYQYcgFY0Rwhcnod/cePbfE9q/lHWVPaw+BpbdYdYeex8u0E3QykqQ+
	2ANdrsAwbZWwsQxArj/hq8bU+z8Mfvk3lxXFIILoDA3j4RXzwMHX9VGyE2r8OQVv
	8y3bLqdf/arrnaXlvtskDxrlSBCUDyPsZqx8ij3k+K8387Z94wy8F+k46Fvgcu6C
	243QtOfvWEP+GoeSlaJ16im+05w11GMX0qy4Pt58Rc/wiGMYjb2fzwRPsglLCuBp
	Dxq+xvYOESWUMXx4WVE0QA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49exudg0nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 05:50:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4wZPQ040766
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 05:50:09 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c5941g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 05:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8mrxrhQnaVYYKrv2NoD/8Eu34ZuqGpH4tqh8wZKjdZDIDw5AWrqDmwtHp8tCoxgO1wN+VC9Af8+wGCqSpba7wxL9NK+Ks9b7s14fSk4Os2SMEwxZ7mujW/AXDRFRamK4TKNjHfTtZ9G8wQHfpjrUp0j0coUcmVaZdYYtUEKijkyx+7mD5cXfxZzWhF0kHJlFR26A+WGmG71Qdmr9AVDfDMpmHW3sIwRkykFVk0mpoiCPhZJKG/nhyyZvD3VrM9kPyToBhaCVOldPz8qudQ1EC2sNPLNzyDz2JIRlc3xaOFuF4ZFIy2XdtYl2xzVvfX8ix4FvlQbgoqCshXj3Jf7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdJWlqEgPL3mjrqJ+d+dMnnIXMXKkhXLqUeuzRFnEWs=;
 b=BV/J+Q/EUvT2SQFx53s+GTpvzT5x/5Em/S8tgYAzWiio15P+KH7I1KbdYabhXYH2URKcHFEKSW3cvMi/LIAQSoF8A4xLB2BdBquwtIfCZsQe8rguLmQK4nWdf1AT81sDQbTvDdqIyOJQOIdw9jemLcrwW+Srb/bVDHRDkDxVzfuYwFzI+fEQdDOqAPAqwGUc9nBqiwkR7ePAwJMX924eSyL02FtROSb4sxppBrabGNcmK+oR8SWmw7+towrx6A4YNLdF/C983/p/zbpDeyEY6tEYXmy/OcpjhlFZ7KMqI3qcjDAAYsvzvFEBYwO/KuoxQ+KASK9ShrACmtFiROpS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdJWlqEgPL3mjrqJ+d+dMnnIXMXKkhXLqUeuzRFnEWs=;
 b=hiCOWo73pRDwCNqEwIdYCJZHfvseCLlEk0KD2PauUF1Rz3924JgUddMIam24J1h2MRE9LNVRJXHZvY6VLIH2JUss6+J1KeRcCoh+Q/6PvSnocENFN7Plk0KMMzvCDWh1xjb/BWGsQz5c8bYv91z4lI9rl4OyxDxgDPFFNHNb9no=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6880.namprd10.prod.outlook.com (2603:10b6:208:420::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Sun, 28 Sep
 2025 05:50:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.014; Sun, 28 Sep 2025
 05:50:05 +0000
Message-ID: <dd3f36f9-af02-7cd2-7d05-39c9250fd89a@oracle.com>
Date: Sun, 28 Sep 2025 01:50:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] Unify the handling of stack traces in the consumer
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672DF8DE55F2405F015D86BC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672DF8DE55F2405F015D86BC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0014.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 795dbe02-52d9-4ac8-c1a9-08ddfe52df7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVhFZC9LRjIwZi9kM1pUaFVhbDkxcTd2aU9lYmxUc2Uxb215eTV5SHlEN0FK?=
 =?utf-8?B?RmF0Y29EU0VhcnQ4Y0pJVlpQWlFKZXdTdmhDcmtFVU80Ymw3aGdLMVc0QWh2?=
 =?utf-8?B?eDhhWHF5aTN5Z3ZVclJITnJMRUFEMVpERXdFZmRMS2FnV3YxSEJDQnVBc3VL?=
 =?utf-8?B?WDV1YjVZZ0t0ZDFOdkorcEdvNVhXZFcwY2JsdTVydDNMUC9zVFJLTmlqRTlC?=
 =?utf-8?B?RHJPd2lFL2krWXkzMjNEdG85akNaZ2VUNFRueXBlYUV3aVgzNjRQbU0yanR1?=
 =?utf-8?B?UlNFbW9ncm5DY2l4aXNYWnJCWlJhcWo4RmRsczlzVFRuNjRNZGdjamVvOGFv?=
 =?utf-8?B?eisxV0JuL2Fab0dNc3hRQTNOY21NQnBBQTloM1FGeE41RmluNEptVkh1UlI1?=
 =?utf-8?B?RlFpZmNHSDJiOW5WSTRWcW4vTmdrMXpvTzVHckdsaHFLRDZoM1VlaFRSdlBx?=
 =?utf-8?B?RDZHUURnN2VUdjc0d3R1UVRhejF0MC9CT25tN1JOOC9MTUYvcm1ubXFkdlYy?=
 =?utf-8?B?M2E0aHRnMmVDemhtR1lYOCtFNXFhakIvSTlVOUVCY1NmeE1xZSt0VXRmUnVt?=
 =?utf-8?B?Y2UxRFZYNzRTMUxDQWwwajdjK0hKeVd2STdYK3RWVFM5aFdITERiRkFNRUtm?=
 =?utf-8?B?MmNEUFBsRlZIVUxES3hnemxhcCtBcm56YmlKRVZINVNJK1JqV24vYzY0VDJw?=
 =?utf-8?B?WkZvVGNYRGZCeVc1L0oyRW9ad0RWbXAzVURxdlk0RVo2UENIRHFKM0YyejlK?=
 =?utf-8?B?bFp4bkZwdUVTTTRnU3NkZlZLbnBjYUpndWlZTGtvTDlQMUFXQXM2aDA2QUxs?=
 =?utf-8?B?emxvcnZ5cTVkY250d3FBQk44MFRGYVllMGRQOTMvdnVqNzJtckJBUDgrbk9B?=
 =?utf-8?B?d0J4UE1PQ0ZlR2lHRUtGNXkybnF1OEg2eko4U3I0MlMyc2xJVnhTQjl6RGVR?=
 =?utf-8?B?eVA5eG52SDZ2U3ptS3p2bW5Fd3Nna3BZMEZlbDdTVnNBLzZ4TTl2OVdPZC9U?=
 =?utf-8?B?QzJvYStsRm9FQXhvK1Zxai8yVkVFWHZYREdkWDdrVkwvNTNsTzlHWHhYYUZG?=
 =?utf-8?B?UTc0WGFLQk9pVlFYVWQ0c25TUk5TSnc2SytwYjQzSkpGZHJVMC9xdnQyMnk1?=
 =?utf-8?B?ZHpucGxkclJhR2lrNk1wRVRBRElMbmRUMDVQYnp6TjZLWWtEckpVODlFbXJi?=
 =?utf-8?B?L0dXazdmVVdLS09KMG5FVmNJZDZHaGdSRDd0NjV5R0tvQis0M0R5RkplYXU5?=
 =?utf-8?B?TGNsSnI5TzBnZjFCL0U1SUIwVHhjMHRKQ0tBcGFQWTlPdlJ5MmtSaFZ6N0FP?=
 =?utf-8?B?c0hNd2JROHRQTmZKT2pWMGxnUHp4ZHcrZitGeTRjd1pqMzBObCtUdUJVSGRj?=
 =?utf-8?B?VlZYazY0amVpWXhOYmVEa0JndHc0d2tPSGlCMWJNWWtjOE5mTEJldCsycUhl?=
 =?utf-8?B?VEZSVnEybGV1R0NrYy9OLzRYRjZnaWN6M2xIT1QrZHB1KzJSTUdLMHYxOUEx?=
 =?utf-8?B?dmNmVldMNU1HR0pFb0NJR3Q2ZFVkY3BORmwvNml3dlpGNXZLMjhYSUIrMUFB?=
 =?utf-8?B?cE5zZUZTZS9FRGJGVUNvdzFzVGlsdjd1cVI3a2pVN2wwUkRZaTZEUWczbmxo?=
 =?utf-8?B?Z3JwNXhxSkprYjhWN2FvTGtTSlR3RE03elVJV3NtNUwwVG9VTHBZTHdTSGdm?=
 =?utf-8?B?SHI2RWxtQ0NNVTM0a1pEd255cnVWbHVLSUpvaFNtU3RJQ3pKMS9FVGhlL3BK?=
 =?utf-8?B?clMxeTQwaUxuQjJhbzZ6VVNWVkRSQlM1bFFHOHdCZ0JENERnMVEwRThCSm9S?=
 =?utf-8?B?SVVRSVJjbzA3UjB6c0EyVHBBSGVjSmNObHNOS2VDWkxodTJkMlFmQS9RcXRa?=
 =?utf-8?B?MUFmL0d2VDBjUllNZHhlQ280QXAvRWZXZ0FiaXRMcE85VlNzNzdhVFNzRHZ1?=
 =?utf-8?Q?aSNRPuzkrlh3CwZNOuxEuKEJVFl5Po2f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NllKaHlvVDl5QXJlZWdnVTlyY1QzOEV4Q01NQ1ppdkxFVXlOalVVZDZBdjZa?=
 =?utf-8?B?MHd3K0FyV2k1YmVORHhtMHRXTnc0ZU5IbWlUTGNmUGt6NVRiaXNQcG5idnZu?=
 =?utf-8?B?SkJMeU03dm5rT04rU3A2UGYxN3dkUys5YnV3YmphTHdFRGJvTVJiOVFDRFYw?=
 =?utf-8?B?RHEzU3BkbzU5M3BpNU5SZ0lVY0NYN0RBM2RUV21INU8wYm1iWTcrczRSdUUv?=
 =?utf-8?B?WXpyQlpIZmI0OWh3UC9DRHA1NHZTa2lpRnVJSlp6cGpMSE5vc0dUbUFtbzIv?=
 =?utf-8?B?TndGbGFFVk1FaFRjbHg0Sk0xR0w2Z2hLOFZPeGkycGoxSlFBdXhPSUVzL2Qv?=
 =?utf-8?B?cGNCay85Y3dwTTRCSUlPSnQwU01pc0RZMFlzK3gvSlFwU0kyR0VCblI2ZFcw?=
 =?utf-8?B?U1BRMEhWblhsUmZLY2sveC8weVh3dUVUVG1EN2NjU0ljbmpPVVNydDlnUGFo?=
 =?utf-8?B?M3pDTjNuVHMxREFTZ3V2d0RNZ3NuRGVjcTlMeVBhMFk2U2Ivdm1hYVllYndG?=
 =?utf-8?B?czBMZGxpVW5IQUd6dUhlemFmUTBzSXdLK3E3eEFOTWVaVXY1K3RDVkJEdEtD?=
 =?utf-8?B?T3dsb2pKTlR2c0p3aVduc29LMEdUaTBqaHlmZnhmanFKeDZGalo1YXBVZmZw?=
 =?utf-8?B?Q3hvRWFDSVhzc1k4Y21ReFdoVkdlN2FwYno2V2tmTXBNYXRrN3lmNE9Vejlr?=
 =?utf-8?B?Znk4WmhPL0hXNUJOV3FjcVVPZFZDV0V0RmFvSTRBYWdXRVZLWWJlYStaSlJs?=
 =?utf-8?B?ckZOc0psSE1NR3JxbnJUUWxSbmhVRTlOdnlURXZVd2Vwc05KK0RXa3E5RkZH?=
 =?utf-8?B?bjZaV1A3T1V2Q2I3TkFJL2JIYUcxQlJ3SHEyNndsRmVxL2JMNmpQNHFQRHNZ?=
 =?utf-8?B?ZlFobGMyM3dHWkNXelNtN0FuOUJjbXhaQUV0czJsM2lsa3RHOHlCTHZTcmsw?=
 =?utf-8?B?ZXQxZXhvdCtvNTNscGZPWG1tUWtHWGV3QmhJMG1hV0w5bUFjVVZlcDRSZThp?=
 =?utf-8?B?dlZTV2d4Mmd4djNlZHVpRWJkcGlaeWZVZ2p1M0h2TWxwdEZHRGlQNmM1R0N0?=
 =?utf-8?B?Ymw5Z0wzVktmSFErRlJlWCt0akRFdThodWZIcDg0MGNaTTZVNjNzZ0RjOWQ4?=
 =?utf-8?B?QUlVQ0pOMHNyUFNPb2VoOWN0TVVtYXQ0R2ROTExNWEh0bXQyUXI2TmMzcndR?=
 =?utf-8?B?Umpya3J4dmM2U3V2eHQxUTl0RnJKREJPTFhJbzY1VGlKNytpK0t1b2tRZ2dD?=
 =?utf-8?B?ZUVuVUVWVUlGTm5RVW01SkhmNVlCQmx1MUg4R1h0RTR1cG1lVXcvc2VJbzF3?=
 =?utf-8?B?SzFrTHBiOHdFSVdCUitzWXNkT0N3d3l1Mmp0K250UHhTdW0zeUVTbFNxM0pE?=
 =?utf-8?B?ZkFvS3lhMlRRQllRMitLZ05jcXdFSS9rUnQvYVMyOVBQNFJKcllKMkdSS25o?=
 =?utf-8?B?Q1ZGU01iSEVqdFhPczVzalVTblpoemdyamVzM1NzSzFPOXpydzNuekhNSTVl?=
 =?utf-8?B?MVNVbmFHV282Qk12L3RMREV2c3d3Vm13VGo4cEkvZnZlOWFuTmp6cXdsSmR1?=
 =?utf-8?B?NmRtd01RcGQ4NWtXMWlGV1Bna3VEMlVZeGxZY0NFeTdaTWlOWFU5bE12SDFh?=
 =?utf-8?B?TUJVb09yQUhqY3BJUzFINVJVVDdQWVBBdWp6Z2lvaDY3dzhqL25qNTQ5NjBu?=
 =?utf-8?B?WFdnZlYyb2FsaXNsa2RqS2owZFdJWjdsM3JFcEFldmVaejhLUStIVy9DSzBi?=
 =?utf-8?B?NDQrOEsxWVpmTWdaUWdENHh1b3Y4OERDU0NyUnlBdjRmWkFmRHU4RnVLd0Zx?=
 =?utf-8?B?ZjdMa2RSQmJ3QkJlTE1kVlhrdWR2T3Y4UjJIS3EwZjArRVhFZUFXdWhnaW5r?=
 =?utf-8?B?QmV4RmJTaGxpWTI0c053aWpSMTNWaFhaWlJhQng3endSUmZ2RlY2SXRSdDlC?=
 =?utf-8?B?azlzRlNXSytFZ0xSL1NEL0dQblY0Y041b3dZUnpUK3hXVEV4Skl1YmQ2VGNC?=
 =?utf-8?B?UzZBdmE1cWJhdC9sWWtxM2VHczZEM1doVSszMHh5S3BUK3hSZXErdWwzc2d1?=
 =?utf-8?B?VU90U2t5OStIMnpxUUIzU04vNjZkVkFxRUM0OHRBT1A2czN2NnJIMW4ybWNK?=
 =?utf-8?Q?GorqLXkXFVpqiebVu4Xk/THfg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HtnNyBFtE00k22HBiiOxWDlJ+kUVHm4WXPAAxvUTnlSUrw5hk7JpubPhVsKDChfe2EHf0ZwTEy39v7A3s7d785Agh46WSpDLcNSZLXo0MCRxjqUzCLZF6VPsa6xRjh0OrWcVGmyg0HznWhmzzoiPqx7O3sycJuW6CqZURL2OeKTEkAXO3mLKeXoNF654Zmc1mGjRbBLhFrh6yjzpkXg2CN1AvWwcFH9PZTdR/NAI/9bGpVg996qETx/5NDiOcTdLvm46qY/kdQUhhSD+I9d9Opi5Egh0m8fW8iELpLfzkf7r53tx/oX2t2OE5rUAJE0XCups49yn6+tZOKIkwloR5hOIjNrV7CwC4qIXdzkp1FveQ+v73ZPHQ5/1isJapHC9t2/jHOuh2zP/EvfhBzjfRpN5p7zf8s9IT6r1YoFZRhFuUospeckinOtzfnZM4OvGhU22Hwj5rryYWck9RrBER5ztN06FDY9u1n6wcLcE81tlIr/zVRiHWuHCVkpQvU7aAUufnOGX477l00MdgRHNJWf9cJMJWQmpWOrWat1aV3sJwTIZClv/Whv2tAcFXZC/51itkqcXFlfRVgYFxJcPQFkFBLtmCCBUS93IWhXaabE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795dbe02-52d9-4ac8-c1a9-08ddfe52df7c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 05:50:04.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC+3HMlwSdDixJSXu8ev28hfwqJObE+SqXGpfyc/OVgDGb3Vld4/PifLKrK9P+oJvGrb0oQt4v4MMJfWguaRWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6880
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509280053
X-Proofpoint-GUID: YYLeGHw5k-pbG5FQzJpGF7cOrDqjr3k6
X-Authority-Analysis: v=2.4 cv=GN0F0+NK c=1 sm=1 tr=0 ts=68d8cc92 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ARoBx2oGVJrzHcecNVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI4MDA0OSBTYWx0ZWRfX0E5AiMjOT5go
 VM2JJjmO2uk4ec2v9HHZQ4K1gJPLMEMs9sO1E1vb0lQoJtDvuE3dsFKLXunSjyI2y47sW4yV+xB
 +wnHsxnQTQoAMg7EFXblpdhiWRfhfnoHU9WH96TyKk/lomy4nc+gNatbObuihHdGxZ5S6cY2jkC
 Qk8BjcFa2t/E6FBpuNFJoK9TsCotmn5WKPx67/Ecn9xmIYKLtf0qh+fjCM7qgbJCbpn3AnIKhat
 Vu8vuL3lsZP1PzTQBU2Jsw3oaUbYJFvEt3Y/doLvsHGkdaKGy161ykP9vcHRYJP14uXzgflStHs
 8AwYLuc8bBIdVaceoxRp0s6LaZZnJ7w9DmNPQZrTjpJtBRc49MRfpv2FjtwD89gqN+zOIOUskuq
 zgB1FrSkTRyoshRZRFM1xRWDY6qmgOxTGzWKaI0BFHRHL+ItRhg=
X-Proofpoint-ORIG-GUID: YYLeGHw5k-pbG5FQzJpGF7cOrDqjr3k6

I guess my only meaningful comment (admittedly not huge) is that in the 
(new) dt_print_stack_user(), indent is passed in but then it is 
calculated inside the function.  I'm guessing the computation of ident 
inside the function is vestigial code that should be eliminated.

The "That is far from ideal." sentence in the commit message is pretty 
vague.  Not a big deal, I guess.

For kernel stacks, I guess size is always 8.  Could mention that? Also 
not a big deal.

On 9/23/25 12:01, Kris Van Hees wrote:

> Distinguishing between kernel stacks and userspace stacks was done
> based on the action id, even when used outside of action context
> (i.e. in aggregation keys).  That is far from ideal.
>
> Encode the stack type along with the nframes and strsize values in
> the data record description argument for stack() and ustack()
> records.
>
> The macros for managing that argument are moved to dt_impl.h since
> they are internal to the DTrace implementation.
>
> All printing of stack traces is now consolidated in dt_printf.c as
> well.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/actions_defines.h |   5 -
>   libdtrace/dt_cg.c                |   6 +-
>   libdtrace/dt_consume.c           | 256 ++---------------------------
>   libdtrace/dt_impl.h              |  13 ++
>   libdtrace/dt_printf.c            | 266 ++++++++++++++++++++++++++++---
>   libdtrace/dt_printf.h            |  12 +-
>   6 files changed, 275 insertions(+), 283 deletions(-)
>
> diff --git a/include/dtrace/actions_defines.h b/include/dtrace/actions_defines.h
> index 1a9c1a81..7c2f7dda 100644
> --- a/include/dtrace/actions_defines.h
> +++ b/include/dtrace/actions_defines.h
> @@ -156,11 +156,6 @@
>   		(uint16_t)(((x) & DTRACE_LLQUANTIZE_FACTORMASK) >> \
>   			DTRACE_LLQUANTIZE_FACTORSHIFT)
>   
> -#define DTRACE_USTACK_NFRAMES(x)	(uint32_t)((x) & UINT32_MAX)
> -#define DTRACE_USTACK_STRSIZE(x)	(uint32_t)((x) >> 32)
> -#define DTRACE_USTACK_ARG(x, y)		\
> -		((((uint64_t)(y)) << 32) | ((x) & UINT32_MAX))
> -
>   #ifndef _LP64
>   # ifndef _LITTLE_ENDIAN
>   #  define DTRACE_PTR(type, name)	uint32_t name##pad; type *name
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 1f120e1d..2b81f2e0 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2701,7 +2701,7 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
>   		strsize = arg1->dn_value;
>   	}
>   
> -	return DTRACE_USTACK_ARG(nframes, strsize);
> +	return DTRACE_STACK_ARG(kind == DTRACEACT_USTACK, nframes, strsize);
>   }
>   
>   /*
> @@ -2738,7 +2738,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	/* Get sizing information from dnp->dn_arg. */
>   	arg = dt_cg_stack_arg(dtp, dnp, kind);
>   	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
> -	nframes = DTRACE_USTACK_NFRAMES(arg);
> +	nframes = DTRACE_STACK_NFRAMES(arg);
>   	stacksize = nframes * sizeof(uint64_t);
>   
>   	/* Handle alignment and reserve space in the output buffer. */
> @@ -8698,7 +8698,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   				case DT_ACT_USTACK:
>   					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
>   					kind = DTRACEACT_USTACK;
> -					size = 8 + 8 * DTRACE_USTACK_NFRAMES(arg);
> +					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
>   					break;
>   				case DT_ACT_JSTACK:
>   					kind = DTRACEACT_JSTACK;
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 280ed42a..eca2139f 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1079,232 +1079,6 @@ dt_print_tracemem(dtrace_hdl_t *dtp, FILE *fp, const dtrace_recdesc_t *rec,
>   	return nconsumed;
>   }
>   
> -int
> -dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> -    caddr_t addr, int depth, int size)
> -{
> -	dtrace_syminfo_t dts;
> -	GElf_Sym sym;
> -	int i, indent;
> -	char c[PATH_MAX * 2];
> -	uint64_t pc;
> -
> -	if (dt_printf(dtp, fp, "\n") < 0)
> -		return -1;
> -
> -	if (format == NULL)
> -		format = "%s";
> -
> -	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> -		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> -	else
> -		indent = _dtrace_stkindent;
> -
> -	for (i = 0; i < depth; i++) {
> -		switch (size) {
> -		case sizeof(uint32_t):
> -			/* LINTED - alignment */
> -			pc = *((uint32_t *)addr);
> -			break;
> -
> -		case sizeof(uint64_t):
> -			/* LINTED - alignment */
> -			pc = *((uint64_t *)addr);
> -			break;
> -
> -		default:
> -			return dt_set_errno(dtp, EDT_BADSTACKPC);
> -		}
> -
> -		if (pc == 0)
> -			break;
> -
> -		addr += size;
> -
> -		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
> -			return -1;
> -
> -		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
> -			if (pc > sym.st_value)
> -				snprintf(c, sizeof(c), "%s`%s+0x%llx",
> -					 dts.object, dts.name,
> -					 (long long unsigned)pc - sym.st_value);
> -			else
> -				snprintf(c, sizeof(c), "%s`%s",
> -					 dts.object, dts.name);
> -		} else {
> -			/*
> -			 * We'll repeat the lookup, but this time we'll specify
> -			 * a NULL GElf_Sym -- indicating that we're only
> -			 * interested in the containing module.
> -			 */
> -			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
> -				snprintf(c, sizeof(c), "%s`0x%llx",
> -					 dts.object, (long long unsigned)pc);
> -			else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (long long unsigned)pc);
> -		}
> -
> -		if (dt_printf(dtp, fp, format, c) < 0)
> -			return -1;
> -
> -		if (dt_printf(dtp, fp, "\n") < 0)
> -			return -1;
> -	}
> -
> -	return 0;
> -}
> -
> -int
> -dt_print_ustack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> -    caddr_t addr, uint64_t arg)
> -{
> -	/* LINTED - alignment */
> -	uint64_t *pc = ((uint64_t *)addr);
> -	uint32_t depth = DTRACE_USTACK_NFRAMES(arg);
> -	uint32_t strsize = DTRACE_USTACK_STRSIZE(arg);
> -	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
> -	const char *str = strsize ? strbase : NULL;
> -	int err = 0;
> -
> -	const char *name;
> -	char objname[PATH_MAX], c[PATH_MAX * 2];
> -	GElf_Sym sym;
> -	int i, indent;
> -	pid_t pid = -1, tgid;
> -
> -	if (depth == 0)
> -		return 0;
> -
> -	tgid = (pid_t)*pc++;
> -
> -	if (dt_printf(dtp, fp, "\n") < 0)
> -		return -1;
> -
> -	if (format == NULL)
> -		format = "%s";
> -
> -	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> -		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> -	else
> -		indent = _dtrace_stkindent;
> -
> -	/*
> -	 * Ultimately, we need to add an entry point in the library vector for
> -	 * determining <symbol, offset> from <tgid, address>.  For now, if
> -	 * this is a vector open, we just print the raw address or string.
> -	 */
> -	if (dtp->dt_vector == NULL)
> -		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
> -		    DTRACE_PROC_SHORTLIVED);
> -
> -	for (i = 0; i < depth && pc[i] != 0; i++) {
> -		const prmap_t *map;
> -
> -		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> -			break;
> -		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
> -		    && pid >= 0) {
> -			if (dt_Pobjname(dtp, pid, pc[i], objname,
> -			    sizeof(objname)) != NULL) {
> -				const prmap_t *pmap = NULL;
> -				uint64_t offset = pc[i];
> -
> -				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
> -
> -				if (pmap)
> -					offset = pc[i] - pmap->pr_vaddr;
> -
> -				snprintf(c, sizeof(c), "%s:0x%llx",
> -				    dt_basename(objname), (unsigned long long)offset);
> -
> -			} else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (unsigned long long)pc[i]);
> -
> -		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
> -							  &name, &sym) == 0) {
> -			if (dt_Pobjname(dtp, pid, pc[i], objname,
> -					sizeof(objname)) != NULL) {
> -				if (pc[i] > sym.st_value)
> -					snprintf(c, sizeof(c), "%s`%s+0x%llx",
> -						 dt_basename(objname), name,
> -						 (unsigned long long)(pc[i] - sym.st_value));
> -				else
> -					snprintf(c, sizeof(c), "%s`%s",
> -						 dt_basename(objname), name);
> -			} else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (unsigned long long)pc[i]);
> -			/* Allocated by Plookup_by_addr. */
> -			free((char *)name);
> -		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
> -		    (pid >= 0 &&
> -			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
> -			    (map->pr_mflags & MA_WRITE)))) {
> -			/*
> -			 * If the current string pointer in the string table
> -			 * does not point to an empty string _and_ the program
> -			 * counter falls in a writable region, we'll use the
> -			 * string from the string table instead of the raw
> -			 * address.  This last condition is necessary because
> -			 * some (broken) ustack helpers will return a string
> -			 * even for a program counter that they can't
> -			 * identify.  If we have a string for a program
> -			 * counter that falls in a segment that isn't
> -			 * writable, we assume that we have fallen into this
> -			 * case and we refuse to use the string.
> -			 */
> -			snprintf(c, sizeof(c), "%s", str);
> -		} else {
> -			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
> -			    sizeof(objname)) != NULL)
> -				snprintf(c, sizeof(c), "%s`0x%llx",
> -				    dt_basename(objname), (unsigned long long)pc[i]);
> -			else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (unsigned long long)pc[i]);
> -		}
> -
> -		if ((err = dt_printf(dtp, fp, format, c)) < 0)
> -			break;
> -
> -		if ((err = dt_printf(dtp, fp, "\n")) < 0)
> -			break;
> -
> -		if (str != NULL && str[0] == '@') {
> -			/*
> -			 * If the first character of the string is an "at" sign,
> -			 * then the string is inferred to be an annotation --
> -			 * and it is printed out beneath the frame and offset
> -			 * with brackets.
> -			 */
> -			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> -				break;
> -
> -			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
> -
> -			if ((err = dt_printf(dtp, fp, format, c)) < 0)
> -				break;
> -
> -			if ((err = dt_printf(dtp, fp, "\n")) < 0)
> -				break;
> -		}
> -
> -		if (str != NULL) {
> -			str += strlen(str) + 1;
> -			if (str - strbase >= strsize)
> -				str = NULL;
> -		}
> -	}
> -
> -	if (pid >= 0)
> -		dt_proc_release_unlock(dtp, pid);
> -
> -	return err;
> -}
> -
>   static int
>   dt_print_usym(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr, dtrace_actkind_t act)
>   {
> @@ -1355,7 +1129,7 @@ dt_print_umod(dtrace_hdl_t *dtp, FILE *fp, const char *format, caddr_t addr)
>   		format = "  %-50s";
>   
>   	/*
> -	 * See the comment in dt_print_ustack() for the rationale for
> +	 * See the comment in dt_print_stack_user() for the rationale for
>   	 * printing raw addresses in the vectored case.
>   	 */
>   	if (dtp->dt_vector == NULL)
> @@ -1660,12 +1434,15 @@ dt_print_datum(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>   
>   	switch (act) {
>   	case DTRACEACT_STACK:
> -		return dt_print_stack(dtp, fp, NULL, addr, rec->dtrd_arg,
> -				      rec->dtrd_size / rec->dtrd_arg);
> +	case DTRACEACT_USTACK: {
> +		dtrace_probedata_t	pdat;
>   
> -	case DTRACEACT_USTACK:
> -	case DTRACEACT_JSTACK:
> -		return dt_print_ustack(dtp, fp, NULL, addr, rec->dtrd_arg);
> +		/* dt_print_stack() uses dtpda_data only */
> +		memset(&pdat, 0, sizeof(pdat));
> +		pdat.dtpda_data = addr;
> +
> +		return dt_print_stack(dtp, fp, NULL, &pdat, rec, 1, NULL, 0);
> +	}
>   
>   	case DTRACEACT_USYM:
>   	case DTRACEACT_UADDR:
> @@ -2467,14 +2244,6 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   			return dt_set_errno(dtp, EDT_BADRVAL);
>   
>   		switch (act) {
> -		case DTRACEACT_STACK: {
> -			int depth = rec->dtrd_arg;
> -
> -			if (dt_print_stack(dtp, fp, NULL, recdata,
> -					   depth, rec->dtrd_size / depth) < 0)
> -				return -1;
> -			continue;
> -		}
>   		case DTRACEACT_SYM:
>   			if (dt_print_sym(dtp, fp, NULL, recdata) < 0)
>   				return -1;
> @@ -2483,11 +2252,10 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   			if (dt_print_mod(dtp, fp, NULL, recdata) < 0)
>   				return -1;
>   			continue;
> +		case DTRACEACT_STACK:
>   		case DTRACEACT_USTACK:
> -			if (dt_print_ustack(dtp, fp, NULL,
> -					    recdata, rec->dtrd_arg) < 0)
> -				return -1;
> -			continue;
> +			func = dt_print_stack;
> +			break;
>   		case DTRACEACT_USYM:
>   		case DTRACEACT_UADDR:
>   			if (dt_print_usym(dtp, fp, recdata, act) < 0)
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 7d8e4432..4dc4c9a7 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -236,6 +236,19 @@ typedef struct dt_tstring {
>   	int		in_use;			/* In use (1) or not (0) */
>   } dt_tstring_t;
>   
> +/*
> + * The stack()/ustack() data record argument encodes:
> + *  - the stack type (kernel or userspace)
> + *  - the number of frames in the stack trace
> + *  - the size of the optional string area for ustack()
> + */
> +#define DTRACE_STACK_IS_USER(x)		((x) & (1 << 31))
> +#define DTRACE_STACK_NFRAMES(x)		(uint32_t)((x) & INT32_MAX)
> +#define DTRACE_STACK_STRSIZE(x)		(uint32_t)((x) >> 32)
> +#define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
> +					 ((t) ? (1UL << 31) : 0) | \
> +					 ((x) & INT32_MAX))
> +
>   typedef struct dt_dirpath {
>   	dt_list_t dir_list;		/* linked-list forward/back pointers */
>   	char *dir_path;			/* directory pathname */
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 1e01d468..4c276c26 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -374,6 +374,205 @@ pfprint_uaddr(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	return dt_printf(dtp, fp, format, s);
>   }
>   
> +static int
> +dt_print_stack_kernel(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> +		      caddr_t addr, int indent, uint32_t depth)
> +{
> +	dtrace_syminfo_t dts;
> +	GElf_Sym sym;
> +	int i;
> +	char c[PATH_MAX * 2];
> +	uint64_t pc;
> +
> +	if (format == NULL)
> +		format = "%s";
> +
> +	for (i = 0; i < depth; i++) {
> +		pc = *((uint64_t *)addr);
> +		if (pc == 0)
> +			break;
> +
> +		addr += sizeof(pc);
> +
> +		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
> +			return -1;
> +
> +		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
> +			if (pc > sym.st_value)
> +				snprintf(c, sizeof(c), "%s`%s+0x%llx",
> +					 dts.object, dts.name,
> +					 (long long unsigned)pc - sym.st_value);
> +			else
> +				snprintf(c, sizeof(c), "%s`%s",
> +					 dts.object, dts.name);
> +		} else {
> +			/*
> +			 * We'll repeat the lookup, but this time we'll specify
> +			 * a NULL GElf_Sym -- indicating that we're only
> +			 * interested in the containing module.
> +			 */
> +			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
> +				snprintf(c, sizeof(c), "%s`0x%llx",
> +					 dts.object, (long long unsigned)pc);
> +			else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (long long unsigned)pc);
> +		}
> +
> +		if (dt_printf(dtp, fp, format, c) < 0)
> +			return -1;
> +
> +		if (dt_printf(dtp, fp, "\n") < 0)
> +			return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> +		    caddr_t addr, int indent, uint32_t depth, uint32_t strsize)
> +{
> +	/* LINTED - alignment */
> +	uint64_t *pc = ((uint64_t *)addr);
> +	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
> +	const char *str = strsize ? strbase : NULL;
> +	int err = 0;
> +
> +	const char *name;
> +	char objname[PATH_MAX], c[PATH_MAX * 2];
> +	GElf_Sym sym;
> +	int i;
> +	pid_t pid = -1, tgid;
> +
> +	if (depth == 0)
> +		return 0;
> +
> +	tgid = (pid_t)*pc++;
> +
> +	if (format == NULL)
> +		format = "%s";
> +
> +	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> +		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> +	else
> +		indent = _dtrace_stkindent;
> +
> +	/*
> +	 * Ultimately, we need to add an entry point in the library vector for
> +	 * determining <symbol, offset> from <tgid, address>.  For now, if
> +	 * this is a vector open, we just print the raw address or string.
> +	 */
> +	if (dtp->dt_vector == NULL)
> +		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
> +		    DTRACE_PROC_SHORTLIVED);
> +
> +	for (i = 0; i < depth && pc[i] != 0; i++) {
> +		const prmap_t *map;
> +
> +		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> +			break;
> +		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
> +		    && pid >= 0) {
> +			if (dt_Pobjname(dtp, pid, pc[i], objname,
> +			    sizeof(objname)) != NULL) {
> +				const prmap_t *pmap = NULL;
> +				uint64_t offset = pc[i];
> +
> +				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
> +
> +				if (pmap)
> +					offset = pc[i] - pmap->pr_vaddr;
> +
> +				snprintf(c, sizeof(c), "%s:0x%llx",
> +				    dt_basename(objname), (unsigned long long)offset);
> +
> +			} else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (unsigned long long)pc[i]);
> +
> +		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
> +							  &name, &sym) == 0) {
> +			if (dt_Pobjname(dtp, pid, pc[i], objname,
> +					sizeof(objname)) != NULL) {
> +				if (pc[i] > sym.st_value)
> +					snprintf(c, sizeof(c), "%s`%s+0x%llx",
> +						 dt_basename(objname), name,
> +						 (unsigned long long)(pc[i] - sym.st_value));
> +				else
> +					snprintf(c, sizeof(c), "%s`%s",
> +						 dt_basename(objname), name);
> +			} else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (unsigned long long)pc[i]);
> +			/* Allocated by Plookup_by_addr. */
> +			free((char *)name);
> +		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
> +		    (pid >= 0 &&
> +			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
> +			    (map->pr_mflags & MA_WRITE)))) {
> +			/*
> +			 * If the current string pointer in the string table
> +			 * does not point to an empty string _and_ the program
> +			 * counter falls in a writable region, we'll use the
> +			 * string from the string table instead of the raw
> +			 * address.  This last condition is necessary because
> +			 * some (broken) ustack helpers will return a string
> +			 * even for a program counter that they can't
> +			 * identify.  If we have a string for a program
> +			 * counter that falls in a segment that isn't
> +			 * writable, we assume that we have fallen into this
> +			 * case and we refuse to use the string.
> +			 */
> +			snprintf(c, sizeof(c), "%s", str);
> +		} else {
> +			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
> +			    sizeof(objname)) != NULL)
> +				snprintf(c, sizeof(c), "%s`0x%llx",
> +				    dt_basename(objname), (unsigned long long)pc[i]);
> +			else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (unsigned long long)pc[i]);
> +		}
> +
> +		if ((err = dt_printf(dtp, fp, format, c)) < 0)
> +			break;
> +
> +		if ((err = dt_printf(dtp, fp, "\n")) < 0)
> +			break;
> +
> +		if (str != NULL && str[0] == '@') {
> +			/*
> +			 * If the first character of the string is an "at" sign,
> +			 * then the string is inferred to be an annotation --
> +			 * and it is printed out beneath the frame and offset
> +			 * with brackets.
> +			 */
> +			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> +				break;
> +
> +			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
> +
> +			if ((err = dt_printf(dtp, fp, format, c)) < 0)
> +				break;
> +
> +			if ((err = dt_printf(dtp, fp, "\n")) < 0)
> +				break;
> +		}
> +
> +		if (str != NULL) {
> +			str += strlen(str) + 1;
> +			if (str - strbase >= strsize)
> +				str = NULL;
> +		}
> +	}
> +
> +	if (pid >= 0)
> +		dt_proc_release_unlock(dtp, pid);
> +
> +	return err;
> +}
> +
>   /*ARGSUSED*/
>   static int
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> @@ -381,19 +580,20 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	      uint64_t normal, uint64_t sig)
>   {
>   	int width;
> -	dtrace_optval_t saved = dtp->dt_options[DTRACEOPT_STACKINDENT];
>   	const dtrace_recdesc_t *rec = pfd->pfd_rec;
>   	caddr_t addr = (caddr_t)vaddr;
> +	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
>   	int err = 0;
>   
> +	if (depth == 0)
> +		return 0;
> +
>   	/*
> -	 * We have stashed the value of the STACKINDENT option, and we will
> -	 * now override it for the purposes of formatting the stack.  If the
> -	 * field has been specified as left-aligned (i.e. (%-#), we set the
> -	 * indentation to be the width.  This is a slightly odd semantic, but
> -	 * it's useful functionality -- and it's slightly odd to begin with to
> -	 * be using a single format specifier to be formatting multiple lines
> -	 * of text...
> +	 * If the field has been specified as left-aligned (i.e. (%-#), we use
> +	 * the field width as indentation.  This is a slightly odd semantic
> +	 * but it's useful functionality -- and it's slightly odd to begin with
> +	 * to be using a single format specifier to be formatting multiple
> +	 * lines of text...
>   	 */
>   	if (pfd->pfd_dynwidth < 0) {
>   		assert(pfd->pfd_flags & DT_PFCONV_DYNWIDTH);
> @@ -404,24 +604,14 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   		width = 0;
>   	}
>   
> -	dtp->dt_options[DTRACEOPT_STACKINDENT] = width;
> -
> -	switch (rec->dtrd_action) {
> -	case DTRACEACT_USTACK:
> -	case DTRACEACT_JSTACK:
> -		err = dt_print_ustack(dtp, fp, format, addr, rec->dtrd_arg);
> -		break;
> -
> -	case DTRACEACT_STACK:
> -		err = dt_print_stack(dtp, fp, format, addr, rec->dtrd_arg,
> -		    rec->dtrd_size / rec->dtrd_arg);
> -		break;
> -
> -	default:
> -		assert(0);
> -	}
> +	if (dt_printf(dtp, fp, "\n") < 0)
> +		return -1;
>   
> -	dtp->dt_options[DTRACEOPT_STACKINDENT] = saved;
> +	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
> +		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
> +					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
> +	else
> +		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
>   
>   	return err;
>   }
> @@ -2287,3 +2477,29 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>   
>   	return 2;
>   }
> +
> +int
> +dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +	       const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
> +	        uint_t nrecs, const void *buf, size_t len)
> +{
> +	const char	*format;
> +	dt_pfargd_t	pfd;
> +
> +	if (fmtdata == NULL)
> +		format = "%s";
> +	else
> +		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
> +
> +	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
> +	memset(&pfd, 0, sizeof(pfd));
> +	pfd.pfd_rec = recs;
> +	pfd.pfd_flags = DT_PFCONV_LEFT;
> +
> +	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> +		pfd.pfd_width = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> +	else
> +		pfd.pfd_width = _dtrace_stkindent;
> +
> +	return pfprint_stack(dtp, fp, format, &pfd, data->dtpda_data, 0, 0, 0);
> +}
> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> index f08e48eb..7a1d0dda 100644
> --- a/libdtrace/dt_printf.h
> +++ b/libdtrace/dt_printf.h
> @@ -102,16 +102,16 @@ extern void dt_printf_validate(dt_pfargv_t *, uint_t,
>   
>   extern void dt_printa_validate(struct dt_node *, struct dt_node *);
>   
> -extern int dt_print_stack(dtrace_hdl_t *, FILE *,
> -    const char *, caddr_t, int, int);
> -extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
> -    const char *, caddr_t, uint64_t);
>   extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>   extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>   extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>   			 const dtrace_probedata_t *data,
> -			 const dtrace_recdesc_t *recs,
> -			 uint_t nrecs, const void *buf, size_t len);
> +			 const dtrace_recdesc_t *recs, uint_t nrecs,
> +			 const void *buf, size_t len);
> +extern int dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +			  const dtrace_probedata_t *data,
> +			  const dtrace_recdesc_t *recs, uint_t nrecs,
> +			  const void *buf, size_t len);
>   
>   #ifdef	__cplusplus
>   }
