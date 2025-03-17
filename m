Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B0143748
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742237472; cv=fail; b=MLMlJw5b5iqsIWr1DJe6kHGS2X8UJjIE6Zb47YjSWGnUly6G9qOlCtNYjqQQqXkm4aL59OaLLrMJExJcePaplL06EJ9lgtIq6pPYMqGkLQQ06cBizcIWmhTG4XyWCjLkJdejNEa7fbI5TB/rHjF3T9/a/2xBB5cnJaReMc8RLSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742237472; c=relaxed/simple;
	bh=PrwwPF32T/qumFbQ/hpu+H0qUHCquqMZQ4hAmV1hKLk=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=qdwseneV7ajki4XSEgqusttPYZ4PqRg/3fNrKRZXc0w1tfcleMzYESQDK8gjCOOWsj1Cx6FhRC0WGFlVC0OKsoY4DtT5MXWRiT9+q9Eah0vQrHNZtwY1LgGnMknyjNQMb8XVdB7DaLJxbz/7OLQbJX5Yf1kLepVLfjVbbUld+/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C3xZGDZA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yGQ3FBNv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C3xZGDZA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yGQ3FBNv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HIMoTF002608
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=p3rM2X22nIFdcM3zCm0VTvN3n/Ymi+j6VpahQzCNl6k=; b=
	C3xZGDZA9cMrLOSd17Rho08c/zbb/vdMZbShq24G/kkAm5sV0e9ZZR0S93Z1JvM3
	On1WA/zRI4bfIbUH8hD4LqvX/2t0HMPfmQR3CSqPFMskMerUjKz45F+hVJJILjKN
	D2n+WFrbNyOluGugIYfKOpwWnRNwNSz9UsbPxOltw6Cw87yOilePYqxAkKdpvs8L
	yUGoUSB6JWycGmw0urRbZ1Q2P/+camkefTqN0y8nWPbmgoHrMk8QZKMmqlx5L03M
	cqDSASD4R4tTK617a6rc50PFvrIO+QseHfEdIIfrp4MkYXpAj/ITOChk+KWS9ckY
	FNZ6QPVEg8B7FDRuvLgcyA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kb3qwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:51:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HI9Y8v019469
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:51:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdj2nfw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPMQiq9TF2af0rk5OtWY4gWhJstamk0jictwu6V6bbffyvpYQqAsf1gm85GmVQt1B5gs+P1wunI7bVSD5knzi1tj790CDOCEJ3+d7fWs1OpFZiAFSkAgNdC7vkq8MXI74y9Ze7bvqwPYwQh8FVzXqT2UV3eUPF+wsJZbj3pAr2/LTpldpzOj6mfaZVi81ZvjyZyr9tN2YoHdcC6pabBSzoIsedZOrfCVYfSuu2K4+ihQa9jw33XWm66Yhl6OrIRCGJnVeL0wzwUnbgcL5s8hyKVQbfmxTcjQs32+f886nQeC+nf2SSySPEBQooj0JrK8zgd2tdl/PBxxasL8RfCgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3rM2X22nIFdcM3zCm0VTvN3n/Ymi+j6VpahQzCNl6k=;
 b=OH/u4KEUGpvp72UpATTEPvVp9P8xW1KEOSoj51I8QzhWBtsYouwWbhrl2a7PjosWjDiNk1sHluyD6mM/Vh1KKUQaQy7WiCcMyHATduDpJ/mn270XWLrRzY4kZ0x+3yAa2EbKsXipgL/Fj6e9L9iNubKU0CYQRhOO/DGjIeuYnvOEw/zeE22WcgulYtGh3mTTzttOnCKH7z8JLF7Vp0keaJQjfadGwNhHNQGMnwRAG01Ppo3CCytpKcOoMTrSP++YEe7TWfDU65Z1e2o2AopfJHthc7avsDVuWGqQjV7qyNvxryKWanrqVTSsvP+tomFU4A6YABZFFqCEaB/Xq8EiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3rM2X22nIFdcM3zCm0VTvN3n/Ymi+j6VpahQzCNl6k=;
 b=yGQ3FBNvY44WTZZwuFPF8atjKcRzaZ6EbRXpPAQFuhnqI60NukjLP7cU7xZY4znjKubJmC9ZmYisrxvuEAz2ccyBEs7gH4F/7CuIq/PiHuiVs0EfPSfxAhbzODKkBW/c+Q0FZ9VCUELGdm6F/mMR71y++quOZ+Qt8wzY8zPISEw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 18:51:04 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 18:51:04 +0000
Message-ID: <34f1beb7ed7b330dcc9031f23483f546.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Mon, 17 Mar 2025 14:41:27 -0400
Subject: [PATCH 2/2] bpf: fix have_attach_type() detection
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:408:f7::9) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH0PR10MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: da2e2889-3e22-4f89-f8c5-08dd6584ab77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rjdYS5LfixXdFzVs2HaGPgtZJBfTjuqhi6FXgyNm6cHexOeboR2uAz8Gu+0X?=
 =?us-ascii?Q?GPAISqaQv9+vVUVgnOm/HNDDVhOO3VX5O5Bz9u7easzlP8av89A+HVIAnK6e?=
 =?us-ascii?Q?JSGIvyBoRMxy6WEHxICbwbNvAQI+BCZypAKZzI5EB3GwNbQXwA2LMxFLRK+p?=
 =?us-ascii?Q?7rVrhobWkpxToA0qJS01k7PKhfoGAlVzExWMWYsDN8xtj/p1Eg3Jb7b1Iflk?=
 =?us-ascii?Q?maHfGWiHDFYxM0NTgpMk+2bCTf/jSvN4hXvvWK4hzMZ3lHdxzxE1zpspm5LY?=
 =?us-ascii?Q?X/AmPPx9N0v6OQcQ3A7jCVC5XUNpowoazVrf+aPicRR4XE0gg37/Z8hGETrt?=
 =?us-ascii?Q?8Ys+ZCpq3J+GF4bLvIC/ybcoRbcCLL5lLOOCW4g+jltwxwGKpLNEABaKFHv4?=
 =?us-ascii?Q?IkF/irNTZ/+cMvPstqDhrIuENi285hRI1o5mOV8ZqtutERBQ4GXs2Gfh6WpZ?=
 =?us-ascii?Q?Tyb2aC6IbRz0J61aFLRiM8AqyfPVBTYgb7N4G2yJXmHc+XNc19YVBhfzc1R7?=
 =?us-ascii?Q?a95McoioegKFUQzk9ZBuyJNgUPzS7Rn0iNiWOXcv/0KCM5UbtYY3qZGS0swW?=
 =?us-ascii?Q?PfzfHT0cHtY8dE7qOkBmQm+s9skRlYjPfoWYGQIH+nucAEZcVe6ZK5Toq9ZE?=
 =?us-ascii?Q?wkZ9ja5NpC5ri9/3Ej9fioc1+n+ToZmKD4n445JYVGZeP0MkNMLLxQ3PZx2Z?=
 =?us-ascii?Q?NFe8FTYrcyiuImfBSswmvuR8u9/hmwYe3X77v7TRA9cQrRgPdZJQOw0P0XCe?=
 =?us-ascii?Q?lm9AHNmxJICbiUqcJ6aUq+iWpfcpJYj61I41dXWTFX5V2gBM8p+Y3X8tgYtP?=
 =?us-ascii?Q?BIeVhHt4maChMe3pcVyivTFoTXcY/G8Kgg1KJzdClJ85d2OW1CO/Z8/XVBrU?=
 =?us-ascii?Q?Bj8n9vqnoxTPOnU8yEBxwqdXHQlRnLf2/PCESkBAHUvalbbpb6AD1ucmjXju?=
 =?us-ascii?Q?WblpE7CcMfPkx61YseXKhU2bx6kgESjqBjMXX1zXbuzQErOTPA7FESmOAOBQ?=
 =?us-ascii?Q?alD1JlC2zg9GUE+gcDv8ZPmeM/bOT3w/da7NMIf663Tc95aCZjNzIr2pZM92?=
 =?us-ascii?Q?/+bh2RajGrPZkwbpXACorkisaaOXPpH1D+eKzyn6QzCfsjcebzTQ/OpoR9W9?=
 =?us-ascii?Q?iJ40FSJokvPb8e5hgD6jb1+I1A9Bi5RGTbaHN+YOlO3tU0yL6iMOME2gXf1S?=
 =?us-ascii?Q?ogMs6I+PBsglzLtBjUt8e9+eNsoHJsBVhAckBvhv+wSeeh2TZ928tfTubonv?=
 =?us-ascii?Q?5xgQsw0Rx0gWxjWR+t8CVY4ZhMK3CdQx61QsJ1RFqKzC78QHD4sL6st/4/hd?=
 =?us-ascii?Q?P6AfI51oulAXBcDnDNOZjobaJHHn3dYU81swxOZgBYJiRmBOLHvDMKdZfhUa?=
 =?us-ascii?Q?AfWilkWC60HGLeIYFKbAwN2mndqW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xpAhQnfXDjduDuHW5klOjvDfACv9Gn8vUt0KpcquKailZkOxwbJuo0RGWQFe?=
 =?us-ascii?Q?aqAB2Quh0vo7pCxjTAgfk9TjNMSGobq2bJJmhqJnVCHnV4lTj7lJ2IKu+OtS?=
 =?us-ascii?Q?k5UuM7KVPRRHs6pxWnSEHcO+YAV3tS5+pKyTCcGEM2YRwVFnxyjghzOBX7GE?=
 =?us-ascii?Q?OPoJHym7uhRf0Gqc8Gf0GcatZfyH6XLwzXTe2jk44b8q3xWtPIenbW0v0jI6?=
 =?us-ascii?Q?QkBv6fkmpgvq5qHiwoINPguKux9UXU0Dj7kvHHGk0U6k3Z53/w5wjz7LKKUq?=
 =?us-ascii?Q?hkUk0rFPoGD7afuByfa4kVa6AerwmzOALZMFvMHUb7SSC9CGW6Gvnl65kBQz?=
 =?us-ascii?Q?s21zEmaToWCiRDXHct9tAbDAmUXR9eZMv2hTHvTz0mSyH2QlnzlVVMEkXwGF?=
 =?us-ascii?Q?1YxuNRGlYarfafm5gDrlKOdXmdy4bJ4KXJk1RinCVU8cDIEZYKI1IZQpAahV?=
 =?us-ascii?Q?cJLplSPBr7lbmWR4bWETnb6Kh4uu6oOmkidMO/jSJjnLvtbA/GotjTH8Himq?=
 =?us-ascii?Q?ok70U8B3rR0tvWdbuELhTqwYT0lVuqG8j/Fo+L4ldt97hLELwoYa3VwE9FZy?=
 =?us-ascii?Q?36Z129KX9slfzqr6ttPA5vsvO6/cbnFp6I2j28vedEgEJp+a9AL9mxy5cTb6?=
 =?us-ascii?Q?w4NEsKWkZm3y+XwRrR2TQ0UkTGVbb/lOQFTVgtIgnQVbObwLcwnk1Pt/vpo+?=
 =?us-ascii?Q?RDZgZkZut4CBVt8jVxqk3cHnLLHKIw5GtD6zooFyQqmXd6YCROtBs5qejOIs?=
 =?us-ascii?Q?B37JqiGMcNUtRxImtWhlUL9j9kwiHBW4FsZcVeoEp0Dy4uErXiNa+kjQ23zG?=
 =?us-ascii?Q?t47/ZQYsNUdmZMYqr207s3EG3dxiKzMMet7QjxytuFe1h/SyfV0ElG9/vDTi?=
 =?us-ascii?Q?jtAwvQy41DM7y1ASMN5nFp0rInSSie3Jl1uTLE1gEeFVDg2NTvJAtJWhr9DP?=
 =?us-ascii?Q?O+6wXaCgauJsa2Atxj7y5ob/k+hSIF+89JNKeyJHCvm0lCV04ZW5GnK3832g?=
 =?us-ascii?Q?TV7RmEuOzuoYR8B7wAkCplAqy4Pwl9vlWJWzNAqA8o26UXC0wn9g6yaL4pbG?=
 =?us-ascii?Q?dxin6VABzXqLk+fJ8I0QrXSLManrNrNzqjPBV+twao4v+QXsEugHS1BaOcQQ?=
 =?us-ascii?Q?yK7CucW8HxUYECFrciGvOR9HDLHXjxTvQDoM5nCUjZAyxCRfb3ODlbFLwZu/?=
 =?us-ascii?Q?v3Cs6YiItC9U+HCknnafArY8KkX1YC9BUWkC+1KaM2PKz9bSJYdcxGzACH7r?=
 =?us-ascii?Q?5h7WiNVmP8/AFNZFeCYkaTcgdTqAN8kVLLiDcl1lvM1Ve7dS64eB7SH2g5IR?=
 =?us-ascii?Q?3GL/i9E2Ei5YSIs6I0M+T9GOrhNXLZ2GfNCdqDUi31v2BIqzBUY1xjZpYNii?=
 =?us-ascii?Q?MnrA0XF3pXCCh0Ol3DCE87WvKKYUYEATAgkLmuwgRwo1YY22frRFRb3fDL+5?=
 =?us-ascii?Q?A8axg/YEAoJ/VcmPgUCQulxDs1/gcPY0MHV/5Ia4sy78IDwfrbxsC4176K/j?=
 =?us-ascii?Q?ITZA1mTBMVfNYs4ZcZNUJ1uMrHeF3Rrp+uzd6gsXoLQ07Xae86DEp7C9IfW9?=
 =?us-ascii?Q?ySozWNh4Vn1z9iRnh0w7Bz609jfvGNnbFnCfNO2MiKFHq4HE1+q7TNqjXGxX?=
 =?us-ascii?Q?8jclBnLn//NZfKvxz97OCEQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F7VL++hVwfhKCbeJDkTaAKsdWYfaivcHA1Mxmbdb8AF+tEmbohvn74sX6Zv2P7PZ8KfoHF6BI50tlTo9F2h989mm9y78lT8aeUR4cWSuc+1iV5kFIJ4z/WLhjtcPgI6U7TYkW8WiB2xLS6bcRYoxRcdmfBuUPakc65BGjDd6ZqeDMdgP9CCJJRCI1eD3XugPGQ+QkTJ1D2KPTVImprbIpF5AZCXFM5Os4mA9W8npkvMQzLr5W3s9hLTg9oq56ZMWOe59dS2CrplrDzxzODqYP50PLiE88eDHyQ3fVEfX07YEPu3kCsc9jLm9OglmZhttDaMLGGyKyMylkOgubb7fFIkG0fkLSlR6j6sRyT6A8+FVkuXfUozbkk71ckuCh7KdyWOL9LNYhXkFz+xtU4+ixraHxplcAXC25aX02BPlGVDArMFo+QN5B4X85lLLb6GXCuHUNt8uy5WLh9M8IxfaZkcRSqvy4JqNziyaNxxvtTkpRTQJEGStMX/mVsFmRwLNrv1ZNoeUS8mQ02ajANNycfrq+5Ck3ZjaoIAPnpUImqmJXkXKdCqj6SuMnalugHmrOe+tMZCTLwRL38DODrrutWrKFsrMFxeYSwsGY+vFXMs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2e2889-3e22-4f89-f8c5-08dd6584ab77
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 18:51:04.4467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80mpE5b3xdsQo66sOXzFZfqKH9/V6fEgs6YihWtjfziINaAiK6W2a9LJx7/AXyNNo56Vix63IAeYUkmQlElctOVw8hFGVxxL6NZzq9sUPA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5706
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503170136
X-Proofpoint-GUID: fDu-EBkRtW16Jw2CAcnEqZLgTvJsS2SE
X-Proofpoint-ORIG-GUID: fDu-EBkRtW16Jw2CAcnEqZLgTvJsS2SE

There are kernel versions that support the BPF_TRACE_FENTRY attach type
at program load, but do not support opening the attachment point (a
kernel symbol by BTF id) as a raw tracepoint.  The cause is that the
support for fentry as a raw tracepoint was initially only implemented
on x86_64.

We now test both program load *and* opening the raw tracepoint to know
if BPF_TRACE_FENTRY as attach type is supported.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c      | 29 ++++++++++++++++++++++-------
 libdtrace/dt_prov_fbt.c |  2 ++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index e50bb536..9ee32e8b 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -486,19 +486,34 @@ have_attach_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
 				BPF_RETURN()
 			};
 	dtrace_difo_t	dp;
-	int		fd;
+	int		pfd, tfd = -1;
 
 	dp.dtdo_buf = insns;
 	dp.dtdo_len = ARRAY_SIZE(insns);
 
-	fd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
-	/* If the program loads, we can use the attach type. */
-	if (fd > 0) {
-		close(fd);
-		return 1;
-	}
+	pfd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
+	/* If the program load fails, we cannot iuse the attach type. */
+	if (pfd < 0)
+		goto fail;
 
+	/*
+	 * If the program loads, we still need to verify that probe can be
+	 * opened as a raw tracepoint.  Some kernels allow the program load
+	 * but return -ENOTSUPP when you try to open the raw tracepoint.
+	 */
+	tfd = dt_bpf_raw_tracepoint_open(NULL, pfd);
+	if (tfd < 0)
+		goto fail;
+
+	close(tfd);
+	close(pfd);
+	return 1;
+
+fail:
 	/* Failed -> attach type not available to us */
+	if (pfd >= 0)
+		close(pfd);
+
 	return 0;
 }
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 1489275a..00f9174c 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -74,6 +74,8 @@ dt_provimpl_t			dt_rawfbt;
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
+	dt_dprintf("fbt: Using %s implementation\n",
+		   BPF_HAS(dtp, BPF_FEAT_FENTRY) ? "fentry/fexit" : "kprobe");
 
 	if (dt_provider_create(dtp, dt_fbt.name, &dt_fbt, &pattr,
 			       NULL) == NULL ||
-- 
2.43.5

