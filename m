Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2651184
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728656642; cv=fail; b=GxioPIzicJ33W8JrJ4sxBCeOfQkGMXXA4dzAR0tgMTpC51yb/syJDROEVYwmDsJFns6wfOW13LPrTeX8jsHIPr+uVmPjYe4NPn8hv3cineIfzPFR+evwfyT89RfRFIAtaHgoQO3LPCmZ6hZQcj4C7YVv7Ueqk2oo+Xt7PQmOJQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728656642; c=relaxed/simple;
	bh=JfR743m9hOijQJJyJyjUSs4PFq7j3wT+6Wfv/bBWL3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s5WCnLK//FfG5lB51t0HCPOHYVYRt2l2pxUUg1N5TOBy53QbqSTAlZpI9cdx5y3EEzWjMQhkA9oTKNSJpNrJk8uxWwVWhdBrQ0Sp1kWsPysLfe7NjHbc7BA4qrgAW/1o0weO5pVMnxA96IEwtlkIxMAki2JMbR8HufaLNEb8Iwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DBjoFvBM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HUUqO0hb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DBjoFvBM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HUUqO0hb"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCpYZ8025422
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 14:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8u2v+q1OH/dfWCN9tF
	eq6BXz0+Q7H7FekqImDQoOhS4=; b=DBjoFvBMtSffpEkSFvHgBZPXOJpQGdLkM9
	2XglQXxLGazAklEyBqojdDK42oSX3LMoYR1AWEP7BOaouF2I9jhezvGwxBP0gZ09
	+TM0ib4fYUn8CCpOIcmHEhyl2uB04MRfJf9xqjSKm40hIKEzv6/GG+gBFMLL89XF
	dIWzD2Duh7yuP90w8NbY3d1K/BNMzSW9RmQY6QbLDqRL16PM4DXrgCCPpAVF2m8u
	uCMO59DBsSQa2rmLinESPwt2RIx5MiwPe9n4myW+2kvb3694YDGOoDjcSQfWtBeP
	1wjEaj42Dcc0e8Wb5UDBU6iZIOC6RHzUGIhaEzSJMhYW7ThFWK2w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42302pms7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 14:23:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BDuw31020641
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 14:23:58 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwbeqvx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 14:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWjFlWvTzIL/gyR1NYjdh+VXDPlEUdWaWq2GVFqOssVq8wZTss1EA2kggrT0dVbiNdL7QFowYu+r5wwHb9YYfjbqq2btPwIHv2znnQUX6PWNGlur1InKPe7mgLSEBxOZfMf5CdB9JVq2czaGIWzm21xNF1cj6UGxUM/0PAIvf+u7QJ8pfd0AizGDa6PyzHVM7B9A3QMgXgfc7OMHm94ghwzOB/NPXO6GvrzcdG3gRRsdi1mEQRHU5aRiHE2CjgrvUEM2coQsyDVKGFSZQQHWnYjyRSNCeDErww97+0NNmqHkW05kvEu+yKNuCpkFTiQWIreqV1kXr6C3f83kVEuSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u2v+q1OH/dfWCN9tFeq6BXz0+Q7H7FekqImDQoOhS4=;
 b=ENR4gjd6dfpTZGuUGdCJInNmwBouZnuypjpHZ7SvRLjRBw+rGHFkBtOsYyLYIwdiLvmjnDb02u5PPZKNP1eSAiJLOx4I+qACs28ZlieFx84cnwJ+Bh7Q/LFsMlGFJHMq3pOmpckm4c/dSXQqHYplR1h1/zqgmA48ejh73AA69yw3uxcLyeTMdVWWCaOeqZZTiNiLZlqo6KiL8yqLyUtc9RIU5t9JzMxkN9wC6XLLd4kSIvgcnVyLKsZCB+OW1OqklUe1z2jJj5KZlCFvdwkaIU/Srm2erYOaGXSp2d/pJSYc8ch26XbKTAqlZdwC9o05QJf2UwjSJpPXXAaLpfxkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u2v+q1OH/dfWCN9tFeq6BXz0+Q7H7FekqImDQoOhS4=;
 b=HUUqO0hblNHuzlPHn4Q6fG+nUmmJqX+C5vf1IcQa0DV7t4q1QATmyRamDjVvzhCTMPvSjWW0PxdxIlu1Tv8kE/IL9d3stk0wPDhocQ3vyjByLPNZ4hYB7FCh0F7aJjVSe1TwitTIykzLiun2boO5h83dxhYAB+vZDeDteBpbkvk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB7243.namprd10.prod.outlook.com (2603:10b6:930:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19; Fri, 11 Oct
 2024 14:23:55 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 14:23:55 +0000
Date: Fri, 11 Oct 2024 10:23:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 dtrace 2/3] fbt: revert to kprobe impl if we cannot
 find BTF for fprobe function
Message-ID: <Zwk09yMWMxiwkrO0@kvh-deb-bpf.us.oracle.com>
References: <20241011102810.989562-1-alan.maguire@oracle.com>
 <20241011102810.989562-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011102810.989562-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAP220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f096b95-f32d-46d6-279e-08dcea0056ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xavDoEU4SjmzSdhIjy0tReJASel9UveHGfPShqrzf8lJN9BBM2k8LRQODRPm?=
 =?us-ascii?Q?maYRse2zTQMmKtUgNeTzE32fj9QnpTtM3Xcqe6yD2aePRWSeVouBm5w+KFQT?=
 =?us-ascii?Q?Gk/36B526CS7YezMuwn6OcJ2jIH6CwfurdHIUxCGUyUlTn5mEQ1iKxc+eSBW?=
 =?us-ascii?Q?A6UKgBVeApxBlHF/IP4b2uw5zg3MHWzcJz2PKTiKJ09y1S9sihR+Lgp/ei7y?=
 =?us-ascii?Q?qyyHcl6W7EtuH7hQBqp61DT/lnQyb6x/MeyDvqNlkGSyhipNdbZdU1xWTABk?=
 =?us-ascii?Q?QMLFijF1/ucVfxX9IuhOrXDH4ZmaYIYJgfEzVqLNHbv3a28QTul6RCNFpy+d?=
 =?us-ascii?Q?10FkeTF3LpyY7E+20O2G0KZupRBWnTUhJW5e7rhlIEYonplcHg2ZPGS3ObaD?=
 =?us-ascii?Q?3eeUrrgpQNYPGcA2341AYHJKOIUXRrx2RzaUATBmizc5UZfaMgVL1vKlMFeU?=
 =?us-ascii?Q?5Yfxy0SNBwhZK8P8HAHCUqpLGoSHE0DBHJ5zF8SlEWxSzJJOh3pPtCy7M/+4?=
 =?us-ascii?Q?rEKUq/Z6Mybc8wocCtkiTKpKGzgbojDSMAh7nZiTzUTFR+Jcbfvb0ResmxCQ?=
 =?us-ascii?Q?5+8cYJSB+Ktft+QOrqdaLiw2HR8MzbPAN8yciZfA5KPjJX1RY1j5ROIzmqQ4?=
 =?us-ascii?Q?Rdcx9Kk5nUbV2Z0/oEigAzT9iSuVPCN8Wrza/WSbImeYD8x+Q+2yQB2LaiuY?=
 =?us-ascii?Q?Aaq/ijRoTGire+4sXNpMOjchIRg0cmhCQZQ4jng2h8Q1Rq1dKGRT/V+IDu8T?=
 =?us-ascii?Q?8DlqQbuCMXHQ7kPg5jAu7T2rFi3O2gVX1iiN/4h07nj05opDrgFaGUJmB7i+?=
 =?us-ascii?Q?gNnAnP1pry5Wys7VazQ3kLye3e/fzVQmyeADlbvwabpgP92joKKy86qdLB8T?=
 =?us-ascii?Q?IOM4dPln9/LjL/ARpYGxfrQQcSWFhDYac+bQRM7xLguJKKmCJAV4O9yGbZHp?=
 =?us-ascii?Q?IwpJxvsNIJs3Ha3M6vLWXdmUfW8GstkbgDHJrI5ZL2fm+zP4fJu7GqMZIc0L?=
 =?us-ascii?Q?ZdUviWgbofwpDHuvh9TxwOaUS2FvEkVx5C07NiGkV2Fzob+aS/CiPc9E77Fs?=
 =?us-ascii?Q?3FGZ8+bdo9Yvuy2WRH8uCycaPRkZwM2qCgLuibzSyWCUIYPOfqjsfNTmSLhp?=
 =?us-ascii?Q?ltRRlNUBtmVllivIVVLLAcp4UpjG5rCEXDAK9ywKlVolsXI5MrMzv4cf6r7P?=
 =?us-ascii?Q?+BiuFbhygIecMeSIX5SmeSeK0AzVep0TtnzAUw/mSwNNZ34erZIHWtJfPiaO?=
 =?us-ascii?Q?ANF5naKoDQPBaP2K0h5xcG2i4zPuMjqoY9Tyk7egVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M+8gPpIhZybDFArwG95+0sJ97NhxU39DhPCtlb6fHek5tqANmtXoLtEto1NW?=
 =?us-ascii?Q?v8q9cHAPLn/TctL0yDKXH3ymodrCk0LibfsHHUidz2wFBGaKxwhgMDSgjzXI?=
 =?us-ascii?Q?zQHCMkYBipvqC+etaNpLTN4x2PKemZ8tfrBQw9nqglZM/XzEBdVA2xbH570A?=
 =?us-ascii?Q?H2qlEcBGVsdXWdBCHPHxpNQhAFGveAqf7V7gvfpOJ/xcOVu26QlBwPU9beJM?=
 =?us-ascii?Q?Q5YtF2FeTg8xEIMUU/hBmRUNagLDaiXgEoebIDtWkrg2qAG3Pz0yRZTH618Q?=
 =?us-ascii?Q?oK29DsjxWkvTJmLKmIp/M/RnFVnBB+wmOMFnOZj7afc2DP2h7Sg+J3TFbWYu?=
 =?us-ascii?Q?pXovqlav8xrChjDaTL75CxbReCcYWj05V2f7ldBRqxKRrgYHuheNt/nsCzUv?=
 =?us-ascii?Q?me8xZGHdjDljb91zd/Pbw9MNJPtUakhXVPS6u+7pxiVJbRIgLn+pMB5aQBK0?=
 =?us-ascii?Q?ZYJPVkrsL4gdljydqErBzYGLYaNyEeUrd82g+52XH34FTAF+juST9j1IS2H4?=
 =?us-ascii?Q?nJshqQEyGNUVIX909lBRg9UyUMT/hWL+/55umDjvZDFYKufgCf8OYKX4CzHf?=
 =?us-ascii?Q?tX6harsTks12f7aC2G3Bxj5+q+mYZml7ZtiEQ2f2ujyYkoSbIy/WhPPSLsrf?=
 =?us-ascii?Q?LwVKVvCK9WHZyeZ9TufY/gmRKZh4P7ujbII2s/XjDT+Rq7+sZtrDxmbsx5yV?=
 =?us-ascii?Q?lWD5Sks1No3Tk7JqJ33x3aDjptJlAAf6h2vI3KjwyZKb/93WJiYTTEMYZzJA?=
 =?us-ascii?Q?tI4n3WHtS6+Db4c2sSaczZrmChBihR5X5KG5TPykL7tBHrT4RBKeKsEQcgpv?=
 =?us-ascii?Q?UZGAQh4f1A7YREslre7+k2VKQT1xiH+vIg50DUGsHJmxLaacEoRy9y9mq4gl?=
 =?us-ascii?Q?yYkFgn7nTOOp5aMzuSDJQlS6FXwQCHKAha8VKh/2R/lJazF3npxrjuXGJD/T?=
 =?us-ascii?Q?RBOYkbEVhyl4i3y01tKbjPJNFT4WGxVxcDhBjXn9OtmUexwEPjLcFfkI/266?=
 =?us-ascii?Q?FMFl9PyZbKe2usHI+WhY7WnRYu5l+5YG6O0FujWmeP8I00bIf7bqzeXTpjM5?=
 =?us-ascii?Q?7faiyiTNX8HJdU/TEyPXzUZVGbu4vZw5vgJuNjvJL/OVEUcPCex7XYmgNecL?=
 =?us-ascii?Q?tJfP2o6YLetKz4ztpdZSF/OjI68cEwtrnJUOwQd2P2nDJhx08WjSCraMbg4g?=
 =?us-ascii?Q?m2OA49SeA0zuGdEkxEojY3gn05iXVPr3qqnHOPtBGgRSpCEQjA/TE3JKQwN7?=
 =?us-ascii?Q?NXiDfEwEimqRl2+yvcc9JJRn3Ygzz47ZAdEswzN48ORXC7tSssA95ZZQ0fyA?=
 =?us-ascii?Q?yWZNuOC/kc3OxZoItquDhT29zNsg0HIdMspKFyIeElNJzv8XnFxslapc128t?=
 =?us-ascii?Q?6eieUHFPusJDD3EovjF6QUbtUo5g2azBAK7J2m0cD/OnJtxIgYQOdA2QuXaS?=
 =?us-ascii?Q?5suBtiwijpkrltr0FBvrILr0vKY5aJfu86rKeVsxpwIx2famHI0S9SNBs39n?=
 =?us-ascii?Q?ogYb4KrWaENKJqYqlIMhq8FZDmj98ZdEXBG0BlMNdwCuooAlMZN5KvX9yZxz?=
 =?us-ascii?Q?x9Xrjg4Inh/pBmeXIZcogxpzUZV6vwfij0KjANA1NasPQ1Z6Asmpy8/mZ9RD?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KJH6gVhOYbX05w9ByRK7cyxyRRxTv5vu0/NiNnoX1pNe4yVe+15JSvk7A/xWIdkMS7j3eWKIrwMPyyNzQfzSPUYxGDl9ymO91DGbGddLjwtocsaMFpuLBaQpsufuc1PQH9XfHUTiBFABUgl2HLC+EPS/IsbjlRmHQFwOl10aPRgwWjm3jdpUdc2Z6XO3aagecdM0NBR+xW9xrC7lxFDXP6VZ3Di044s0IUSXWl8yhxj+gwwAnuSOqWiqiECLWne5S1Ds6IsNJH0KLn5hMSQ4SDJea9oJhtZPYIUf4DcooUGBCtqYzsbEvhWbHLZ8jzjJcfECeRSTW1jyZPv0Cg6gonWx+fBt89NVwZeeI5VaTmg3NTFa6/PeuX/IngpbSXptmYBTZ0LaZ0BDg0zBQjtMxZfV0en/8lr7qNJpGC3qnZKy4yE8PoBhKFL6Alm5xCuaoCdath5UY6LU+jLmfOnH3LCLkgOcwCyoIj3oIhU8uC53v9luFUYaU1XJt1FgYQVYSbyLXBezySCnQL8/wwiKukw+ejYbnJqdvQZXEw50a4vFXoaQdZvEAOAT+9LVR5WBzwRqixmzKv2Plw0PUf2Swlix/SRiZPuy6KdbssKHjWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f096b95-f32d-46d6-279e-08dcea0056ce
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 14:23:55.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOQeaCb0EkxmFHejKH+oaETgUdthJJYjpc0lBpCatHsI5ipxl9nIeoGmKjPuZTbWC3yiOd1TJ7KGhEq7IiW2c17kjnjRHB/XmEfBqIpWqx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7243
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_12,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410110100
X-Proofpoint-ORIG-GUID: 6r2MKUst1aCdp98rhtiNmFKF3Fd9MSnD
X-Proofpoint-GUID: 6r2MKUst1aCdp98rhtiNmFKF3Fd9MSnD

On Fri, Oct 11, 2024 at 11:28:09AM +0100, Alan Maguire wrote:
> When using fprobes, it is possible the to-be-probed function does not
> have a BTF representation.  If this occurs, revert to using the kprobe
> implementation.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_bpf.h      | 5 +++++
>  libdtrace/dt_prov_fbt.c | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 5716d232..dc4eb64d 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -32,6 +32,11 @@ extern "C" {
>  					(dtp)->dt_bpffeatures |= (feat); \
>  				} while (0)
>  
> +#define BPF_UNSET_FEATURE(dtp, feat) \
> +				do { \
> +					(dtp)->dt_bpffeatures ^= (feat); \
> +				} while (0)
> +
>  #define DT_CONST_PRID			1
>  #define DT_CONST_ARGC			2
>  #define DT_CONST_STBSZ			3
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 0ba0fb71..15ffa137 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -232,8 +232,14 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  
>  	btf_id = dt_btf_lookup_name_kind(dtp, dmp->dm_btf, desc->fun,
>  					 BTF_KIND_FUNC);
> -	if (btf_id <= 0)
> +	if (btf_id <= 0) {
> +		if (btf_id == -ENOENT) {
> +			dt_dprintf("fbt: cannot use fprobes, reverting to kprobes\n");
> +			BPF_UNSET_FEATURE(dtp, BPF_FEAT_FENTRY);
> +			prp->prov->impl = &dt_fbt_kprobe;
> +		}

This will indicate that fprobes are not supported at all, which is not what we
want because some of the FBT probes being used moght best be served (or need to
be served) using fprobes.  We will need to be a bit more specific than this.

Let me think about this for a little (with code digging)...  I think that we
can do this but the granularity needs to be at the probe level.  I.e. in the
above code, you replace the implementation of *all* FBT probes and that won't
be ideal at all.  It might be the way we need to go (worst case scenario) if
there are some probes that require kprobe instead of fprobe, but I hope we can
avoid that.

>  		goto done;
> +	}
>  
>  	dt_tp_set_event_id(prp, btf_id);
>  
> -- 
> 2.43.5
> 
