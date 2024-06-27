Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E6B1A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466771; cv=fail; b=fKHOxERvhWJC5J1mxDR5FmaQmuGc/k9d7vMRrAWSavG8yMRkw8a/VRNac55Gh0ZHyE9p3o9F2WupYXQXORz//GhCS3rLwNeTm0p58/HRGdc/5T49DHmsHcX3wqyk4msU6zGt3YVfohomKhodZcXwdF8gryzIHAmxm3x+NsGmk5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466771; c=relaxed/simple;
	bh=6QgSGE9yIbxC6FlQtyCP32MzDNFs5fwvYAkqRX5y0ho=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iiWnTaDTeSz+g/Z0ki/engOkT6lfr30v6XgR5mtuuAjq8zMhLx9FC9jXlT1vbudzl0y3B3rdXvG1khf2lpk9pX6uSOeSnYUpPR3IBKcVkkUA5SqCmNsIEMVv1AN+wgnTLCubpKB3+8Ib7guYEtlOXOGRAWqRwh8QooEH6+TbRZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vj+UmJcg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZBmKygTi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vj+UmJcg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZBmKygTi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMb5a011107
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Jkm3ODfbzU7eQO
	ucmz+tPOajCRpm38u863HNdvUSoo4=; b=Vj+UmJcgrR7vUJ3Jubo8Ao46ibaLKc
	caVMLnrvmMfwQh6tPa9T7UUdBdI+dIG4cbQ0cUerkatBmkJ1PFqnfF1JHf3jW1R5
	c1I401fH/CpWNZPU4mv4jmg8/WfADQ5odF0Bvhr59/MgyUMkpzw9lVyzdHEpUbH2
	MYX04e81Pxjp2kC+gj98Gzv68GLG89CRWkao3gADnjlK6RdwzMAzAkWnaD5ZnmcE
	s9Om4C/6E8twEBkpW9j6cIEiGAogJb5X33IbCjqZAPb5GJ/XPHAUk7VDtndN7amk
	SClD6ifSeoj0EkBz5hHf/DP0mZmC5NPwrcSIcCzoS2V8CqMksqYi4u8g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywq5t52wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3FDXo037265
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afhd8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yz2raBZ+G3Z39kq0UE50kuEmPw81o/dyCNDPjfz2yZgEuPTZXMmvJk5mgjrFr9yrlGi3AKEAjbfNfRFQuzRw2SYVIC7/jnTy4UyDrIo4b70RVjTsxV/tHcH6k+SJIDWcx4FGwwEMreayXo6NqAJjlv1oXWJPGs5pMm5At6LXD//jKKuCyFngohg2B9wUczFJgKUsVRzvyekypWM14GDTaYmfOmPqmmiXqGCe0DPnKicds1d0FismJ9kJFicLVj8BnDhudx+ZVpgxk8JUszgvcMwLzPjj3jKEljqsvKYAairy/JfJriGdkhoF8q6Wm3VmuteHyvmic3kv4ffgZZQLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jkm3ODfbzU7eQOucmz+tPOajCRpm38u863HNdvUSoo4=;
 b=iQpM7pQvgpjxPSfnLF3rYEX5gMvuEgH2ugsTM97g4k2wQ7U6+1Te9IhQEqjbkqjUAhb1ePP8Um6Tw5JW2vwdSvD1m5PNqfXoUI/q/URcZLSEnKWZ7dJV2K5K0oeO3RPgfuvFCY0PqGmeSSaM2TC5lP3+Y2ekSvtne2T32GqZAFTQn8BigsIX1qhP8yegD3MOULNR7FMS08V8fyz34BPBGHRTPjv2c9EEaaa2EDyAQ5pj3TYBxIiXxxdzH8G3LZ6h9Gadhg1Jyh38XzQUs6jX9PS+j0hUtFkUpTl5S8ypEqOonJkdpZhsnOHnNmeVpfw5N/U7scDhz9vmqXfZwJqXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jkm3ODfbzU7eQOucmz+tPOajCRpm38u863HNdvUSoo4=;
 b=ZBmKygTiIXxrwurAw8u+f1EhNFIXndsIVYvCpgjBDA/aJQC4lw7glpQxVs/blwMaM6MBacY2uCaFi9IcAxdCQnfmiC+EHUwYc16an5pEuAC0wRxReAVoSrwsNMwitZrJPcWPK3K+qeBL4XGHz6/RowHTCGKBv6pjlKNhySOT51A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 27/38] test: Fix the speculative tests that checked bufsize
Date: Thu, 27 Jun 2024 01:38:53 -0400
Message-Id: <20240627053904.21996-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: c6661a87-9b4b-4b17-8363-08dc966b7fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0tPFwBdpfzgTp9zhlnFUtK1TFS5x89gOY53T/49UEijetFNQNoMy7HgQQztB?=
 =?us-ascii?Q?7KpsSbCcM4iA+rMpDCHNsf4jUxvETk/B3L6g+ZWl41vnthxchsSQ5ldxhJL9?=
 =?us-ascii?Q?T5KDpgqpnFVa+4J3rgdFpcgmSXtxgbP9AiEVm90darJBqgyiIQy4pIx8B0mE?=
 =?us-ascii?Q?mLZt8K98jnCsiUNPt1+ykvLcD+0ADKozEMFf9rs33BXkP1HjbAO4ue1WDBqK?=
 =?us-ascii?Q?msiX+nVqjVCrXNQQUBsUuq7AH6g2MXMZESHnkKrUd6VsiC+FUpaWoX+jms+h?=
 =?us-ascii?Q?eU0lMZ4qdopGRkKn/UYkgZYXb7QDgl8z0GdnBJiK2uASvf+d4FnZMTrO0Ne2?=
 =?us-ascii?Q?vjSsDGP45HKG/K1G9o3Js/i+RW6ZOC+YXc4ky0hfII36Zzw6NHOnJ73weHgI?=
 =?us-ascii?Q?s681EP8/d2cgdPiLm+VMSFd8kT7FgFh4ru9oIMJwK545A8SDDQFWF4opdyeW?=
 =?us-ascii?Q?n9yhgtU6Xytqs2gTuCicUH0EkyRQhCcfJoE8GIAxhMwFe6zlWG5DrVdHgjQ9?=
 =?us-ascii?Q?VlbALiOD9GaL1h/1dvjd3nnRFu9ESk4tn+POF9NA5Dosnp+EdEnQ1hPX7kuT?=
 =?us-ascii?Q?K5Y/Mr4erT0+HtUsOrTPCJJc1psSzGO0tm6Gk06D+AQub+1wgsGeY9cgWAEb?=
 =?us-ascii?Q?ff6fUbPLHQTsPM+aqvl+9V46DxdtVqBOpg6ljgOKU00M3MzIFO3P7bFKxSWx?=
 =?us-ascii?Q?IC4XFgA1LL9bwkfTUrpDBNBCMr6nNeL80Nux5n14W48usyz/ewfc/p7dF28g?=
 =?us-ascii?Q?0oO1tFtITMQGx1MSr78OlY3AxqZ5rkPp/V7vGMFfNts5MUtCmIhH5TDmme9j?=
 =?us-ascii?Q?i9N3aKnwAC4zJnyXuIfCSlnZf6HU0BUUNxbQSejYK0Alui6Oq1IVJNl9r+s8?=
 =?us-ascii?Q?uz0ujXU6BnpvgzdODEUnyOpcO7BF1ech+A0OcOxTa/z0Wp2aeruK2s7ihn8d?=
 =?us-ascii?Q?HHnhNDWhT95+dYVVUgSZP0b1MaeS2SHEL22wQdPwd2DakJmB5teAzfSrTBPQ?=
 =?us-ascii?Q?+C3KQ5TWPLfs8PF/jWtsbs2pjB97OqvVn2fr7OTmFjIOdNmA9/XPtq/wOvy4?=
 =?us-ascii?Q?Yq3iAma79lT3kKODsDWx8OehuhEabA9tAP75G5RgopqYK7Q5X9GL0K1avVOb?=
 =?us-ascii?Q?RFUSD7qN/OQmig46ZhErbAsRF6OO+6Um9IMUY4Vd79COg1GK4u+Minbaj8M2?=
 =?us-ascii?Q?hHRNg7fFb7yvYjq29iZYKYv0vz8AOj+4y95Icf51QTlTVVKldiEupH4SS7bQ?=
 =?us-ascii?Q?pe6DotHyXlfoE0XFVWgzOK4jHeg6YzfW57MQ7t4L3m/vrm0p5LrbPGT8Fi/z?=
 =?us-ascii?Q?Oo5Hdb1VzJtXyNcOOi/TUtoCRO79NJix2y3db7Qj/lIPdWm/8fAu4y0upN70?=
 =?us-ascii?Q?ZN04JHw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8TF035TndCW8DZ6ftpaI7KQ9UHw6Nnhj1mizJFyqHGRnpXw8DLxvbBB5mOwl?=
 =?us-ascii?Q?d+vekQxegqVTuIdz7huchSK7MnUhqgpG2WOzpEnIiI8d1i6kCMVcPaBjIY8x?=
 =?us-ascii?Q?LhMMAf2DNlTSzYcAjJokDWlvPck8lqnvGHQhiQ8A+Cx9z6tfzZUO92oQdaQU?=
 =?us-ascii?Q?WrbMmXBfQys6gIl752azZYH8R9uJDfwQ3bJLbyPwTCgxTkC/DyuRgveA/hLd?=
 =?us-ascii?Q?OKBf0Jbp8rjZNa3bbRDckQ7JGSL+qv6msxOU+UN9ulBX/mGYtxpIdI+2RPBG?=
 =?us-ascii?Q?/IfdgzPSrEdoOdMSTO7SvJggUkD1NKgwerkYOoyj0CAovHfoLmDNOaeceTnJ?=
 =?us-ascii?Q?YZWAvrysGGhZ1MiIMfczDLdet+skjKl2JYV3f5edopbvK5Dz10dEy/COPAgy?=
 =?us-ascii?Q?ug1ypnWl4BEZoeMSwqlPTol78xFSVYd936oOUk5S31may/GS3Dj3iHXextWy?=
 =?us-ascii?Q?7gP4ZRIOV/bdkkBrCnK1mRofeKJz5eQNqCZLWYXy3kBsIncibwG+aD2CzQb0?=
 =?us-ascii?Q?hYOLCMQxuIzZQ30X2ll4B8JfDNcrovis6y78wjEbVWv5TfYrYBs2UVQYTvta?=
 =?us-ascii?Q?3qB7qhMZ/CM9EWa7+cQJLeAHHYZx9y3IajO6m2IiY1tlovN8FGdfGgFvnAiA?=
 =?us-ascii?Q?U5bWem0PIesL6f1SsdAjdDfEDjnYPknCh7/HHgc4IG3G70Q/zDwKrga1tuVn?=
 =?us-ascii?Q?nH3tEDgHicIrItnT7yCTwMeForOXZPJfHOnXsVE+kXht7UzWkCjZJNgwO7+D?=
 =?us-ascii?Q?nDObN4TJxg+S+S3t1TgAJyA5BFxf2LU9T8QbZiCoADy5xjWtjjzAfqiwBEKi?=
 =?us-ascii?Q?W4xTTLGRG/zwXgcoOlRuU8/nFX7T3kHJDSxDr96mpDSmyDL8nRSQHI/VSaZm?=
 =?us-ascii?Q?8gtZoIbay+4Ax7dwHCBhZQHiQ6yYofyK06FpxWqYcGP2+scVzK9G08tcw+do?=
 =?us-ascii?Q?mDdkQRVT7/ZhXGiJQyKsKhsKhPQyygEclKXoBn1fvTmwQrEeaO4o/K/wbLYx?=
 =?us-ascii?Q?h0GjrM8C9Tb/RGHEQldlJM8WU+ut1aY+uS4e9TCquVLJ3VIR6sncHBi4fmjK?=
 =?us-ascii?Q?8eeKE4JWjTnfcSrTLs+W65Tqd58UZ2gsBT2hXxS1nOepxJ8WQl5VnLE+ztQm?=
 =?us-ascii?Q?y81115bFEeXW/O128Uq1EaYXclvzZUAHgZkrKSifhD1qfx455cdFKfmFOXOW?=
 =?us-ascii?Q?/FV6YO9aIjoq2qhIWyjDHZSIBw/SlsS07Jd2/j0H22DyzdAIr4tzYih+xfMg?=
 =?us-ascii?Q?k9mYaHDH7yaeThgVobqakBkgSLul/Q3TZD+Ysn+ALvUM77ATmNWdlLkkNLXU?=
 =?us-ascii?Q?vhwAsXMTDtl2OjBHio0rzUvKAhB0qgveJtQZQPgjC0+U21fpFhydwtU7HiwK?=
 =?us-ascii?Q?c1tRcYj+9fSSqtLhEyPC/YQvub3FnrYtP5KaYh3Mhr7Iq9Wvb0iJy+rfT7Ca?=
 =?us-ascii?Q?xkEhf8LEAQMuh9kkkKVCez3/MEDHBxypiw1jpl6g4jHix3QBF07ZWOefjH+1?=
 =?us-ascii?Q?8/4d+qIbf3XTnR66uX9J3VUUtzenw+UCJkRJlBy2JNHuyc5XZFkCwQsYBSxm?=
 =?us-ascii?Q?rvMMt1jVkWR5nthyKmgxYaEDLPfV8HZoPb/mGvkc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RiDOIhsJuiVUkVe3ptRLc+VuNS4crKWImRK9wfIB9EqVjM5dB5ZZLTf4YmiljmklUcPywyTWsdXMxIeWRqkI4u89mZTTKBS15oOnP9s/HWtOdVSBarGdrwL3wVawKgkYkXwTrI3n+I6TY9sKlTmPz4yZruDoLA1Imx1R7q0zTWuzjqwA7LSfyOpTR3mdMI1ST5ILKBmevtVE3EPuOnnksWwNhF61K3AiF1YCRoBuHpXqnNNeNoVaz52dhOb85kGGVulfhaSeRwkC9t3Jt2A0maYDOTqXbRPLaLbZEqfVNjGJJcRWbtMRyyik/KrHrL/b8Uf1ALdNi72DVOjZ+6bHgI/qsvi6m6yho2IVriE6w3SRvCawfX9tc4Wr6Jy2faxSfbIUconY9ral/JZrv4e8H3J9gZqmdg7mz2HLFbxSNIdi24yPtggxmGdGh5RFjvGhu1kqM8jUwVg99KQGPvID5fcGP9tl4c7OBz0S14uYeLh2fTU96oSu4NH74xXwi7k9ozOXvMhtx2ncPQObwnGZ/yRMNbW89CpM6RKAprjWpuG+aSMxbFZ5DkSXF6MZHIMXwBQrQOgRIS2ilsdAuUm66G3cbow67HgY2p1KvIhBWJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6661a87-9b4b-4b17-8363-08dc966b7fe5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:23.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKxvN9IlFYTo2j/CGv/4FcuCS+XB9FHaQ5YIBeTHujnqyXB5SmVbjer6u73UigzqOqg4VtPcm5oZ/Gminu+gvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: WNlvhJT320i8dLMLq_gd1IHZV95XaP0n
X-Proofpoint-ORIG-GUID: WNlvhJT320i8dLMLq_gd1IHZV95XaP0n

From: Eugene Loh <eugene.loh@oracle.com>

Ever since speculations were reimplemented, these tests simply were
not testing what they claimed to test.  Among other things:

1)  There is a simple dependence on bufsize that is independent of
speculations.  So speculations have no special role in bufsize tests.

2)  The messages in the print statements were not taxing bufsize.
(A single default string would be enough to exhaust 60 bytes, but
the producer wasn't passing the consumer these strings at all.
The bufsize is being set by the implicit ERROR probe.)

3)  The various size ranges described in the comments do not exist
and were not being tested anyhow.

So remove these tests, and just rely on the other bufsize tests.

To be fair, there seemed to have been no other "negative bufsize"
test, but add a more straightforward such test and add it to where
the other bufsize tests are.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/options/err.bufsize-negative.d  | 24 +++++++
 test/unittest/options/err.bufsize-negative.r  |  2 +
 .../speculation/err.BufSizeVariations1.d      | 67 -------------------
 .../speculation/err.BufSizeVariations2.d      | 67 -------------------
 .../speculation/err.NegativeBufSize.d         | 67 -------------------
 .../speculation/err.NegativeBufSize.r         |  2 -
 6 files changed, 26 insertions(+), 203 deletions(-)
 create mode 100644 test/unittest/options/err.bufsize-negative.d
 create mode 100644 test/unittest/options/err.bufsize-negative.r
 delete mode 100644 test/unittest/speculation/err.BufSizeVariations1.d
 delete mode 100644 test/unittest/speculation/err.BufSizeVariations2.d
 delete mode 100644 test/unittest/speculation/err.NegativeBufSize.d
 delete mode 100644 test/unittest/speculation/err.NegativeBufSize.r

diff --git a/test/unittest/options/err.bufsize-negative.d b/test/unittest/options/err.bufsize-negative.d
new file mode 100644
index 00000000..ac194dc8
--- /dev/null
+++ b/test/unittest/options/err.bufsize-negative.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xbufsize option sets the trace buffer size.
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+/* @@runtest-opts: -xbufsize=-1 */
+
+BEGIN
+{
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/options/err.bufsize-negative.r b/test/unittest/options/err.bufsize-negative.r
new file mode 100644
index 00000000..ea3089e9
--- /dev/null
+++ b/test/unittest/options/err.bufsize-negative.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to set -x bufsize: Invalid value for specified option
diff --git a/test/unittest/speculation/err.BufSizeVariations1.d b/test/unittest/speculation/err.BufSizeVariations1.d
deleted file mode 100644
index c6e29b78..00000000
--- a/test/unittest/speculation/err.BufSizeVariations1.d
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of variations in bufsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/bufsize
- *
- * NOTES: This test behaves differently depending on the values
- * assigned to bufsize.
- * 1. 0 > bufsize.
- * 2. 0 == bufsize.
- * 3. 0 < bufsize <= 7
- * 4. 8 <= bufsize <= 31
- * 5. 32 <= bufsize <= 47
- * 6. 48 <= bufsize <= 71
- * 7. 72 <= bufsize
- */
-
-#pragma D option quiet
-#pragma D option bufsize=41
-
-BEGIN
-{
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("Lots of data\n");
-	printf("Has to be crammed into this buffer\n");
-	printf("Until it overflows\n");
-	printf("And causes flops\n");
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/err.BufSizeVariations2.d b/test/unittest/speculation/err.BufSizeVariations2.d
deleted file mode 100644
index 8094cd0b..00000000
--- a/test/unittest/speculation/err.BufSizeVariations2.d
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of variations in bufsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	    Options and Tunables/bufsize
- *
- * NOTES: This test behaves differently depending on the values
- * assigned to bufsize.
- * 1. 0 > bufsize.
- * 2. 0 == bufsize.
- * 3. 0 < bufsize <= 7
- * 4. 8 <= bufsize <= 31
- * 5. 32 <= bufsize <= 47
- * 6. 48 <= bufsize <= 71
- * 7. 72 <= bufsize
- */
-
-#pragma D option quiet
-#pragma D option bufsize=4
-
-BEGIN
-{
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("Lots of data\n");
-	printf("Has to be crammed into this buffer\n");
-	printf("Until it overflows\n");
-	printf("And causes flops\n");
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/err.NegativeBufSize.d b/test/unittest/speculation/err.NegativeBufSize.d
deleted file mode 100644
index a0154ccb..00000000
--- a/test/unittest/speculation/err.NegativeBufSize.d
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION:
- * Verify the behavior of variations in bufsize.
- *
- * SECTION: Speculative Tracing/Options and Tuning;
- *	Options and Tunables/bufsize
- *
- * NOTES: This test behaves differently depending on the values
- * assigned to bufsize.
- * 1. 0 > bufsize.
- * 2. 0 == bufsize.
- * 3. 0 < bufsize <= 7
- * 4. 8 <= bufsize <= 31
- * 5. 32 <= bufsize <= 47
- * 6. 48 <= bufsize <= 71
- * 7. 72 <= bufsize
- */
-
-#pragma D option quiet
-#pragma D option bufsize=-72
-
-BEGIN
-{
-	self->speculateFlag = 0;
-	self->commitFlag = 0;
-	self->spec = speculation();
-	printf("Speculative buffer ID: %d\n", self->spec);
-}
-
-BEGIN
-{
-	speculate(self->spec);
-	printf("Lots of data\n");
-	printf("Has to be crammed into this buffer\n");
-	printf("Until it overflows\n");
-	printf("And causes flops\n");
-	self->speculateFlag++;
-
-}
-
-BEGIN
-/1 <= self->speculateFlag/
-{
-	commit(self->spec);
-	self->commitFlag++;
-}
-
-BEGIN
-/1 <= self->commitFlag/
-{
-	printf("Statement was executed\n");
-	exit(0);
-}
-
-BEGIN
-/1 > self->commitFlag/
-{
-	printf("Statement wasn't executed\n");
-	exit(1);
-}
diff --git a/test/unittest/speculation/err.NegativeBufSize.r b/test/unittest/speculation/err.NegativeBufSize.r
deleted file mode 100644
index 9d7be6c0..00000000
--- a/test/unittest/speculation/err.NegativeBufSize.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.NegativeBufSize.d: line 27: failed to set option 'bufsize' to '-72': Invalid value for specified option
-- 
2.18.4

