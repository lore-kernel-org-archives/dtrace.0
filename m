Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F8316EB76
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562002; cv=fail; b=EYrDT3PNV44KGk0si/VqfvvxRWfptU9TwB1lBQP2dp+PI0XtonPylGYuvhDUrrujOEXv8WQatNtq2z6mwJ0oeTAcbj1oFM1jbjHPKzIb938cShwyQJh9+9QmjUl97JwXcqy0tlRylGe1MDeJ7Aspk/DS5vTlP8TBTArtpjzRmoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562002; c=relaxed/simple;
	bh=tZpWBOICkPznA3nyRQjz6UPGqdbBgZ9nAFCcB+Tkk50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FpOAH77Z6wMkclRmNeWy7AEbWsacS+YZeR45fD6+LdSq14fbYTsoiZOkK7A9lYNpupuTo+5npmwKYgjZDtnIiuGwZGceZZijVyrLUxpSOhQgyuDriAU7tNA9i4qjtwK5UQhO+9LWT7kSriAvRBeEK/Z9gdubBzB84OOlIr2wkEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M0SMev/N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oZq5CAzs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M0SMev/N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oZq5CAzs"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1gRbR025082
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=op+P/jw0uYNDZ9s03a
	d4THQaTh5+EayBNibH5Lle/b4=; b=M0SMev/NIXCYJnw0nlsJS2e+wf6rdc4q0f
	FpeFB4nfwzUdIJnrFxfLOvc6onYE3OFV2hwbFkHLRvfvet4ZqBvkzGTPfhGqIle5
	9OJLW+C8VwfCZLsa5TJSpil5qqRSwP6zflpai3zu+Si0elVk6VdXwp9GMguzjWme
	TTx2QMHtbLdtZvjQBj2YEH38i5OV/KBVueVnFh17wgG+VkC/RY+Dlp85mB/ZD7Oo
	HbGdccNUQEODVygTFVJsN1Ebx//ij8Fez/rE/zLt1ng9tog1zL+gDEBVO4/VwU95
	lFMNmX8XlDXqvfHn4EAk7oEWnRuO2M+f2Da9tRTBCuhavSTgQ5bw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0heras6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 05:26:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE3ZQaW025878
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 05:26:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6aatmv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 05:26:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X70sZY1w5tErK0bhXci31M+urJnTT4wSG8gt8thyrX4zB5cSL7EH9nER/XNunPFZOlKgTq+GXZFOwHNxOO40bGiqcxSALzQW1+CxkHVnuTZq0GxMQnfcBjw50qGoacLWGo4sp8wCqVH6Wc3XLxoUqAnE6EbWtb1EtDF0w1HVhs3/HelR3zQQGzvwucsOy1htBye2zdycUwgp24UhoX8Ru1yUOVL+rjG45WA+gN2s32etgYsCsa2TioIhJHClYTonDkHqSih1JyAeyhe18ah4Vj3sAHoM/DXuon8li9iEq1ggaBqunWH/1BfoxpJFN0XyRHqTsbssm8c7pm/JkBGU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op+P/jw0uYNDZ9s03ad4THQaTh5+EayBNibH5Lle/b4=;
 b=vjrOej2sa+kmovyj7Tli0XFeqq56bUdgvAhag+IPl+DQlsNvOPLrG0nX7j/7zcuzD0whmojs4Tz7hmTTJLQlhQyK2RHH6qpAOPztc1DUveYpm4RqsGtnbtlT54f/as53Dfs18/ITi086nit2UmCglRf9rrLjMxJzAV/6vwNWUoH7lqPGtnR7SMy5mMw4yJx/ftzV4SZNpOdduSFhZ/ZKBQVnTpyfj4YJukyi11z7jDWvrEzNz5A0Lqy0eTdHRDEW329PT46CFTZvdK04eIsMxSHdRhWlF/Vr+Ux94a8/VaWqNbTiyPoX9goavUrZ+s0qQmYgAFX5YMmXO0bjkla26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op+P/jw0uYNDZ9s03ad4THQaTh5+EayBNibH5Lle/b4=;
 b=oZq5CAzs7wlgp0Gjo1UgEZnAGINkbcegVDqXJKleleU3CzlZBA1H7zU2R1V92DGP526rHUu++fQnrbuA+8mx/+pAU3p3OV6niMPgqiae1vmmoR7/B1juqOLoObEaF9CXzzqbEJF3gSw/RgZ4bm7FAGbGqo1/Ym/LvksP8BkTPRM=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by MW4PR10MB6418.namprd10.prod.outlook.com (2603:10b6:303:1e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Thu, 14 Nov
 2024 05:26:35 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 05:26:35 +0000
Date: Thu, 14 Nov 2024 00:26:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3 dtrace 1/4] dt_provider_tp: add
 optional event data, freed on tp free
Message-ID: <ZzWKCN0qYvtBhx8D@oracle.com>
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
 <20241016155409.4038017-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016155409.4038017-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BL1PR13CA0450.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::35) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|MW4PR10MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: f046ea54-80fa-4bc5-e73f-08dd046ce805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TrTxwuKSO+0Rw7noNV28ETSuH9HZKDvIggxtnGP4+3hmnu/5C8/ORKTXiN52?=
 =?us-ascii?Q?3uPlFa0hGnuLIlRyGKshVq82QITF/JCkFL74h/z2T63eLhgNqygzUBNm8sCF?=
 =?us-ascii?Q?BWzZTrbBJrXCHs7sjm/sHdBBouaxOeZLbniD4wRjiDTav7uqfPfvqa9xanOr?=
 =?us-ascii?Q?d90MrXycznZxbhOK0EtBsILDkwS1Im+rjzjmVsDRd0wMLIhytq0bj0uHGkFh?=
 =?us-ascii?Q?NjE05hS6gVa9RvjyJlvXB9nNepbaeITSzKxbCiHyA371M3Dxc0qZ1xTBBWI8?=
 =?us-ascii?Q?NhgxgknCHtIOOa92KC5mKKTIGMESHqRQMGEXSUw3Smi2KQjuxhtbDc3VRDdN?=
 =?us-ascii?Q?KnOqGmSHDcubcC+fuWGr3dTxYWWi4FFHU5rr7ZaE+N9vYYmAoaTMxayGBLGp?=
 =?us-ascii?Q?XW+lGkrKxNlwMxvPLvIDX6gY1FYgKsSgLokIlPYWFcSqfqfWtIPXtvscFcC6?=
 =?us-ascii?Q?xl5Rakwag1dzF97VLYNppoZaGGZ0S9mqQ8z5kvFowbiIrC1bjezpHOffHp6C?=
 =?us-ascii?Q?JZ7p/AvJhBbHt9Gz+RDN1qTqGMwi0D1hu6N8T+1Rr7ICBTIFtGjtSfcAOlx1?=
 =?us-ascii?Q?NU9jf5Yz9dj1VmT8eMy7jEedkpoM+BsN3E/fZFmEdrsKEMumJqjqM7r+v427?=
 =?us-ascii?Q?gi87A6CFYEDTDHYlk4b6an+8bO/auziVErULXZi0yvAlhTM3ZWiyPofkVwkh?=
 =?us-ascii?Q?RNASZOFcZIrxxYb9ek50q25KoP0xBARQG41irBR7KM1UoJFk4REwSXcqLrs1?=
 =?us-ascii?Q?erF0bt7XR3KyGuarrK2sNfISm35c0YyKpAlMN+V/2y93glbamwAragi1zGJK?=
 =?us-ascii?Q?NYEx18tSQCNdrvINZgQDUsapuzCVCfS4b/KQjXr7r2ql+iV7NcJpbHddFs0z?=
 =?us-ascii?Q?j1JVGwbeuCMFg9ayY2ULTjptDNdBsi8jWq3jgBSt88yJY2TZme3Gc6xW0Utp?=
 =?us-ascii?Q?lKjgnCxevK2HDAxN9tQ0c12tNVU+7TKBBHoV3l3tgnm+9iFZ8cFdpJGbDEEr?=
 =?us-ascii?Q?8T+3tNOM5ml/YOt3jEqCAxtuN8+cSmb4Y3HVmspIf9o3jhMjwrRmO8L+VOyA?=
 =?us-ascii?Q?3EjrCEaEcicnNGkcQDNoVvf2mp/wxMgb6r37QFmA4+TTG8uoi7fUxW83N0uK?=
 =?us-ascii?Q?8ABenixuZa0Rda1Yz3CsPvKJ2C3pqftLVy7GYc7n1R7m5G+pmb7ocblyqdka?=
 =?us-ascii?Q?A8SYNqxdjD2adj4Pa5ivLvoS+mNh9Sw7DQ7nq+2voCeMP4gzzbFTuvoe9fPU?=
 =?us-ascii?Q?gpEKaWJYRHbRKG38Nv0SVWVfaUnPO2DUov+j/sNOWqRPhqEpFKeGWqbEcAVm?=
 =?us-ascii?Q?gt2cu2BMj1CxFBiwUd/+0Kfd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hjDmB98ILyn1/wPT3xQu9KuIVX144aHRQ4bY5Q461FWiz+ndDTrGG+ReqqLj?=
 =?us-ascii?Q?bMyatt3hYBTpUUo8MGvMxQR9FhJ2oGYMj63+L5nt1N1kdhnhUPcK2HPA+sj2?=
 =?us-ascii?Q?nYgZGNxk3ytX/jq1wddHjrKZnLmnzgyh6xwJWtWddVfXI/SfY4N5SobsALty?=
 =?us-ascii?Q?Ceq8STTwEiCynOCcDZ0OZ8utF8DKgmA5olSu00sN5yUgpBpEbrK0rZqXm4FP?=
 =?us-ascii?Q?PNDJBPAEbbDQH4Vjxf1ia7REZuS4ifayN1G8fR0jVRetKYbSljx03AypltcZ?=
 =?us-ascii?Q?0eLU9/LbF080a9TGpZNnVr+zBwbJ9q9anGDEzn7vCKy0JE72vtSqG9QXb7Ah?=
 =?us-ascii?Q?A8QVjG32hOex3BWhvTKSjn4jN772Ue9/SZ70B7afHaCKYd82jKHdjHDYTlMq?=
 =?us-ascii?Q?vwzb5J+lAlKJdc+mLPEGcNS3jtQD/HA4J9Mpgznzsaz2e2q7SQ0zDpI1ZRSQ?=
 =?us-ascii?Q?biR7tzpVo1JdAjS6LnWXxF2qnSx6MmraLik5lLGELSTnp48L5QaElIaaH9Y7?=
 =?us-ascii?Q?wOvhjyxkK8IsVZTzNqzD2Fs/lk6BJYIA3uGPDsEErG+nheniL2c5njLTkiQf?=
 =?us-ascii?Q?7CyTWeuZNVPwppZEItXKCIW/MOVY8a3BLmccg3fiSlcVURHJFjvHdGu1l68H?=
 =?us-ascii?Q?XQXKtil3x3y1wijkEk8jFGsXR45hI+EKW9JsnJNp0TDb/jpbKv7h0PWhQIJu?=
 =?us-ascii?Q?NSEp5e1l4AakseE8draBpxT6xUUscmgCu7x0Ce+vE5SqnbZvY5RSfucKX5DN?=
 =?us-ascii?Q?pPu3q0ojk9qdajBNN6mdBnM5m0b++cOv71T1/zPLidOp5jCnhjdxVW4i8Kn2?=
 =?us-ascii?Q?ElGtIZ8Usrpv/6d2DCa/NQhvGoLpJGIzFzyD5WalH4eE185FSrhLGGCbPGJm?=
 =?us-ascii?Q?tQOy7L/pjWr3P/tAMScxnHZC2ioj4PNvkP7cwpUQ6Nd2HuYPLmofQFtJ4A27?=
 =?us-ascii?Q?lpCmyWwy/LTyw5r/8BmmyzPbswpQuEZYojuYRMrwlnMa9hqkxCdGnWtuBp+b?=
 =?us-ascii?Q?RtaMdq37/SQlp1oRt1xbC0xJo9io3Fe3wFmlqZw86CQ4mnlujFr0IEMHIP/A?=
 =?us-ascii?Q?WyL9183RzEmrOzmv22UU+YnL1J6XlSfQ9iiQEXmyVMJJvvUHVpsHFAViMT6T?=
 =?us-ascii?Q?gGLLFVQAq2CxF4qc/dobcvuDb+7ilERxO4x0OLaF9hdMtyIY54OGTYhyQO9s?=
 =?us-ascii?Q?isYYB9pZr6Qq1mlM1y7sbDlp+KyQgNc4reRp7y8P7ACwNyO1B1k3PsbWL/Za?=
 =?us-ascii?Q?qMPv0uI0HZC2cISD5SM2sy+bcWQErFQ/Zm+WCQUx1b54zf8B/NN4IZpWJV81?=
 =?us-ascii?Q?WujOqwDf0dyZQZTpfTFRDrQ5aEVcgBJff0pqwHiKf39CKvUSp+2QRJZM8Ndm?=
 =?us-ascii?Q?rMiTSrddLa0l2lckdUF3lL35qHUQVMRhfYvzFWb86NizH1o9ZuA11wid1bdm?=
 =?us-ascii?Q?/S+6wq7OT4pRkzQLd+pqNrEORgwR8Tk0MhXMJzqxv9elqcEm+sw/VnUIF/FX?=
 =?us-ascii?Q?XYk1itlCUqHT2BzJlUVeom9hZ33VGATkKX3Df1UkctrN+maSfN11G/yxDjeX?=
 =?us-ascii?Q?SWUXWrCnYUU5azFSX/Tva8nbHzI+/wQm86TA6DTjS+ZekjsK0YKr2KzgSo6z?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jeQwVbXfEW83MIR8nC2VfHCAnFEP0WRrhc5G2yx2YC/eAaHBAtHSFzYW0E36LzqlneqEr26Q0fltbyCdmeu+jaeJ4vGhbu0xlNlSogolJgpE/7BPKFPbHMORDEZYBpwAY9Dze1zdBzTZUUZ+AZVewE7L2sB61Utbw/wjVNNFGQEORLLvSTMpfG6a42Y+ipLWXub8yXZkWdsct4qkV4W5YqNbPOHCiAFv4GTpbAQj60TeFrX3fYAcluPMHlqsPqnTgrtryUeKMYZWqz6K8DB5jApM601Hl11zcMswoAaxsC5BuzHdynvlTKmJf5wiFcq603nwr2knKr/sxPlwkCIrN5PkVG83OW+BqzMQLSUamHN3uWXCFxAws8kb/Cd8D9EWutUZqfksMPDhMJqZW/uy2coPJcAgZHKJpn9ABm+BWTsyEX7VEfDDgALB3diDKWx0kuhD8rVU1z9X/ZF7bbJ1V/+YOeY+fTiosVnNJJbbqH5N5SeDAJrjRoyqtWnlxEnHOiBx6fqL7k/2Fka5l0ERBqtcL5Lf2jyUY72wnAZzkhXb0woYQDoE6xY3bXTx4x7+xm+C/DaRLvyfcTcFGd+LJ7eSDYAGUuJQZxAp7v0CAQ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f046ea54-80fa-4bc5-e73f-08dd046ce805
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 05:26:35.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5/BA6afCf/Vo4R93jlhdSieer73QZMgXmKcn/K0eTfhR1eF4TWyTXP4evOhk50XvZy/zxq+B4b9fKZ6VGGOSJAROe3bGsy9d8Q1Qxc8Z4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6418
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_01,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411140040
X-Proofpoint-ORIG-GUID: eyXJPy5m35i-XWA1yyZSvXTL3l_TUhQ6
X-Proofpoint-GUID: eyXJPy5m35i-XWA1yyZSvXTL3l_TUhQ6

I don't think this is the right approach.  At least, with other code (uprobe
provider) we went the route of having the provider declare its own custom
struct to store provider-specific probe info along with a pointer to the
tp_probe_t (tracepoint probe info).  I think we should do the same here.

I'm preparing a modified patch for this as part of a small series to fix a
few design issues with function naming in dt_provider_tp, to show what I mean.

I'll continue reviewing the rest of this series based on that upcomming change.

E.g. here we can use:
struct fbt_probe {
	char		*tp_name;
	tp_probe_t	*tp;
} fbt_probe_t;

and an fbt_probe_t instance will be passed to dt_probe_insert( and thus will
be available as prp->prv_data.  Whenevef this provider needs to do anything
with an FBT probe's underlying tracepoint, it can be done by calling the
appropriate dt_tp_* function and passing in ((fbt_probe_t *prp->prv_data)->tp.

Anyway, series coming (hopefully) tomorrow.

On Wed, Oct 16, 2024 at 04:54:06PM +0100, Alan Maguire via DTrace-devel wrote:
> It will be used to store suffixed function name for kprobe attach to
> "foo.isra.0"-style functions.  Such functions use the unsuffixed form
> as probe name, so we need to store the full function name to support
> attach.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_provider_tp.c | 27 +++++++++++++++++++++++++++
>  libdtrace/dt_provider_tp.h |  8 ++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 50df2328..fc3c216a 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -33,6 +33,7 @@
>  struct tp_probe {
>  	uint32_t	event_id;	/* tracepoint event id or BTF id */
>  	int		event_fd;	/* tracepoint perf event fd */
> +	void		*event_data;	/* optional data */
>  };
>  
>  /*
> @@ -313,6 +314,8 @@ dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp)
>  void
>  dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp)
>  {
> +	if (tpp && tpp->event_data)
> +		free(tpp->event_data);
>  	dt_free(dtp, tpp);
>  }
>  
> @@ -334,6 +337,30 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>  	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
>  }
>  
> +dt_probe_t *
> +dt_tp_probe_insert_data(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
> +			const char *mod, const char *fun, const char *prb,
> +			void *data)
> +{
> +	tp_probe_t	*tpp;
> +
> +	dt_probe_t *prp = dt_tp_probe_insert(dtp, prov, prv, mod, fun, prb);
> +
> +	if (prp) {
> +		tpp = prp->prv_data;
> +		tpp->event_data = data;
> +	}
> +	return prp;
> +}
> +
> +void *
> +dt_tp_get_event_data(const dt_probe_t *prp)
> +{
> +	tp_probe_t	*tpp = prp->prv_data;
> +
> +	return tpp->event_data;
> +}
> +
>  uint32_t
>  dt_tp_get_event_id(const dt_probe_t *prp)
>  {
> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> index e7d52876..66a9bd80 100644
> --- a/libdtrace/dt_provider_tp.h
> +++ b/libdtrace/dt_provider_tp.h
> @@ -41,6 +41,14 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
>  					   dt_provider_t *prov,
>  					   const char *prv, const char *mod,
>  					   const char *fun, const char *prb);
> +extern struct dt_probe *dt_tp_probe_insert_data(dtrace_hdl_t *dtp,
> +						dt_provider_t *prov,
> +						const char *prv,
> +						const char *mod,
> +						const char *fun,
> +						const char *prb,
> +						void *data);
> +extern void *dt_tp_get_event_data(const struct dt_probe *prp);
>  extern uint32_t dt_tp_get_event_id(const struct dt_probe *prp);
>  extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
>  extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
