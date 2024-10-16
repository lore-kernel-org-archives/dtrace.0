Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504954F95
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094510; cv=fail; b=Qe/WgetQCSxiCIH0IbZxNPsrco1AhSHlT8lzNIK1dRpJMmR4cO5FKskQsfTMSRmRK9UCJbAYHKoEurPHm4/Cu/x8CcO9CRflqlvXV78yqLNWP47jhj5c/E5tbqWbKWPX1viB89kfb3HtD8dIT9I5lE3llkhVvr67W59qv6jpcWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094510; c=relaxed/simple;
	bh=RpR3E4ihX2nbHtWXaHVVlmvX4DedjF4fpTbMxRPWnDs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gpOq+Lh2XmYCt0LuocJx3bGvzHs3Wym7pllWzlLeGegmTbnBziyQOR0dTa9r1CusSaSAtUZ4+HD02Gml9nH6C0TPNJw+xAQQCN+sUMEpBeCtlAoqga273mmst872bs77QJqp76h8D91aNm3R3zPgUXs8Jd1y3gIZ3KKvAHWc8j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AQv6WEfN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I8SHT24R; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AQv6WEfN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I8SHT24R"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfl4f022447
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=mxJk1e60vxjUEcqjlu+qBX1QsQTrfufPWRGYIpqCh+g=; b=
	AQv6WEfNUn0XL4OpUZ/DBTFMAhqDlHWuZmn4U25d+KSbuCzsOKuv43/sfCUM4Wn9
	pDn+C54V6bHf+SPJILs/N7IEFDtdoV9pSGwS/uA2LYTiP0WxKiTdtPnl0crB/3Yy
	dXqhCMv2KOQcYnhXAM7ymL+gi9dDmafKMEHKQQzRA5gdfcxjMAnuhUPU+o3n6FXH
	UTfCqQHx1rhhbp0anFIb+pew0izDYnz6IiJ7427wK5i6zsC6dO5wpYZwyJSsNvHH
	chk9TtIsyoN1OjSk7dzYWfN9U3mj5wWhA/uyNEwdHxGlVgAxof6CAWYKFuMCUagF
	KF8ikOFvPPe56Bihwey2wQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h09knn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GG1Mj4010363
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfbbj5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js+66KkG20Bn2vOND1+Ez8N5IEBR0d37KL7exj+sIwQFMgjHoQmEvxFQXifLM/y6NVOL5i4OsB82HwAVhNG+8378duCUA7t7KVn2KHKCvaZBaJa/4gmZtfroPMDoIwLD/g30MaSv74md9iC6qTvboEul6wbvHkCyUrQeIfzlx1RXSi1Tvqv6VT93Z+TJt5LEMH+CnGRrjpI5O9aa8TPt5nQX8u7AVtV4nVmlsXO1abzX6PqVAnL3ZXf8iIEQbJRA8Xzg4K6iKXQa21SGtOMH3wylNajFrcBYhobr4zfH6bkGrcY9w6FygNYK/Q4GAk+TGenDF2/Apt9DpgJ0+VQR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxJk1e60vxjUEcqjlu+qBX1QsQTrfufPWRGYIpqCh+g=;
 b=j5is+c0TCSJyhFwtPeA8PJzNzbhKqz/Fa90SWp7udZP439RrCU3HH+MY9y1mmS8b0K4hnXKSllfuVhT0fNrS4MN+0SXm5EAQslcXa/M78bKZ+4kG63Y4Q9+lw1/aDA18pytd9h3ZDBevyKDOqx5mFIX04d8n5EC/2v1gLiY81yEkOyQ8F9HG8AyA9SEs16xk0RUmi5AzamNh4liqRzjsTl7O64RsuZHvxusSoZcQ+tnEHMlvy3OwXhvSGeJoxFY5QfRpF7BgeMW67bilKVONsUr2pgA9rNt7n0WHfDT0lUvVmqOuiNYdSYw1TswyRUX/P3fZm1BeFrQxm89vcypuEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxJk1e60vxjUEcqjlu+qBX1QsQTrfufPWRGYIpqCh+g=;
 b=I8SHT24RVa4wsEYNrbsQLn4zPjh+IX1sviXMFAaIgP0UhbNM7+M9m6h7OgOe5fSdqNBR+p47J2HjcO0BlQxTHZ6a5q8IDdaUcBnxP59CCCLSISIGbl5yvA9kP9oUot0VjlCk3BKgI0j1NvcXZIy7guZD2FpoC+VlZr/RvTc2g0M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5673.namprd10.prod.outlook.com (2603:10b6:510:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 16:01:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 16:01:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 02/19] Add a dt_provider_discover() function
Date: Wed, 16 Oct 2024 12:01:36 -0400
Message-Id: <20241016160139.29589-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b04d58-1f89-4ab8-e2fe-08dcedfbd2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2RINJZNpE47Fz3Fw7OKHhcflrP4gpV5jMyW6d6Q2KzJkzkwvR6D9CLqfOQec?=
 =?us-ascii?Q?yhESjuCTTDc4W8Z5UddQo4wQIVZXdDrRdHKT/WGGgkzD65fM6AjRyXtXmvY8?=
 =?us-ascii?Q?mPH5DjtNRZsbXme9rP2J4HW+YMr756BR6ROsyD+qn4PhO3DUwn7sL62I+9ps?=
 =?us-ascii?Q?8Xb3HsHZXq8w1+rc0UHOH6ZsAVoFw1cR4kkkpmfFUoXmqdVU2pynHOej1SAN?=
 =?us-ascii?Q?aT+UyJ8THiyxyH31UcNerbIl8eVgbVdcbECDBIQwVPYpfs3AV5lML1hBDG6S?=
 =?us-ascii?Q?blRoQFBmJ/uY7FK89WQqiGkUKNVmqkTnUAO79uJf/wFPswfQ8LsphOQ4zcGf?=
 =?us-ascii?Q?GvyYkewtDS45+Ab6F2aGFZN/d2FVGttNMzGJxjyHLIio22vDO5w2hZ3Btfb8?=
 =?us-ascii?Q?Qfhu/DcEoht3EcO89o4k0TDzmkYDpeRl0QIvuCTqoD8+m7ZcfvJOiEmMY33R?=
 =?us-ascii?Q?ZsJqd7locFAgdGFpiWdWNd9DRxMzmOwQCNiH+Sa7R27R3ozI/35uf1/aWX1w?=
 =?us-ascii?Q?sfR+bZfYtocHITp+3zZp0J1oRGaiZ3cX9zxrjwyCbyKEmWz5DGcETXhovrUb?=
 =?us-ascii?Q?zZfgO598eC9zs8YXrBO05RZXWmmQCZJlYenw+q+xE03hTm24NAUf1pidTblI?=
 =?us-ascii?Q?owjYMNL5YrwzsrozYhm/wCE5S4CK8knkt25zpcYqzfTB01gBG52CQ/l30cQq?=
 =?us-ascii?Q?ru2gD+FvsrNcjRxKeQD9rGuCyHsTiBN9ZNfvDWynSeZoYZujd1dGfWdaJ/UO?=
 =?us-ascii?Q?Rvh0Q3Oq5aKyKjJXJkAtiOMO0KIgMSKsnAXKi2YdfO9Lo+FigKCjuB2WjJlD?=
 =?us-ascii?Q?BezWdV0wFb53NGZkoYZkkiQqErfywWQny8yxB/ZHveZuY8AXvzsK4u8TjkIC?=
 =?us-ascii?Q?jsvxr0CvYGlybNLHug3m8qoVNeXgDy2z+LF3foy+XsCSYN/51eFNuIkpAmB8?=
 =?us-ascii?Q?GUYlXU0fzAtN1hCUVLXMz5iZjNCUCXs/CCz68nBUSx5jpBXfnTSydbku+XIt?=
 =?us-ascii?Q?yiLK1YEYxPsBcw7pi1106FP5X9eykTpoG7GEbKH0ckB27P2Y38YtL6Zr7A9H?=
 =?us-ascii?Q?3t7t3xKdR0MNkGR4MSqP4zgLna7iyPU5QuM96oEbqreFJli6UwBjvVIpx/3q?=
 =?us-ascii?Q?blbEzrRnC/VU57qe+l7JhItfNTsBLTOR/Gdt8He6I82mxjDo3dIApAh4d+30?=
 =?us-ascii?Q?yknab0OrzWOdLlj7GSSOQ6yfsowvC5HnOS9LOCFP38kJelPHfEnddhJnDVPY?=
 =?us-ascii?Q?ZOOjb7Y3hE4uBJ54/MCWB9W5cBoVdGbzv1YrbOvvLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gd9XxTwn1OTqkCyF3c/xwkprZdvhw58ZXhCERKU+EsTV6yyx2WGUW1nWtNzE?=
 =?us-ascii?Q?vXmOS9F1LXTH3b+DcUmFR2gd76of6K2UjMIWT5ScAbS216M52BQywprJefEF?=
 =?us-ascii?Q?rJPDIpXVulQDJ2Sf/Oco24r3QoDUOMFg3bfR3FXEjQxMWZNHJzFiWPkQ6c+S?=
 =?us-ascii?Q?7mnsqB98kY3oeWnCzSCEF240GIQynYETgaEHGwSOwJCOvZCk7v7gxhMVPmrZ?=
 =?us-ascii?Q?g5hV0PfcFCylUqNxlyQR9pLlZ4xNP4mF2sM8JN13rKNg2+uAVunOfxGfEweA?=
 =?us-ascii?Q?NPuKicuPczLOquNfy4sZohpvSQGHrm/RsLrSE7jawvJA9t1ATdNb0aJhfkJu?=
 =?us-ascii?Q?/8dVExiQO8Xl4E+RBJcLmVdugsmvXHsKyY7ocaeNUaZ7uc3Z06QgGXiG7mTy?=
 =?us-ascii?Q?0Be/27JcL+Q46E0/Dgult5g3wxfseZOkRpBklMsdC9LenCkXJdMEyCfc3kEr?=
 =?us-ascii?Q?4KY3bakvBSR25WVeoFww5/7aDjjms6/vzbUww4Lzqm6pqi1bZHsO6BSDJP5e?=
 =?us-ascii?Q?BGsl2m4x7aB2xc1dRv/E2PtWtivl8R7tRK8fS5KFRZDIp4IqrQMHOgtWXmAC?=
 =?us-ascii?Q?BSbtokc3T6Qk1RuZrGWJJGR6SsC0DSKy1Dala8bgloup/DzBFnnrahlcAfVJ?=
 =?us-ascii?Q?CbSDIQ98WwGXWzRc5Xmz0LE7lCipFY6/yfvbnSQPoP+OF7/FRTXg9/nyph8J?=
 =?us-ascii?Q?v/sXIaxaXOlBlz+QaLZkJlYQZPHX7S85t3WXqYpcDdxg985zvIqxypVh474u?=
 =?us-ascii?Q?yG1NrYEh2upTKjhBFf0+phTC3PN5D8Wyo5ULrul4cN05tLq7olg3txco64q3?=
 =?us-ascii?Q?9yd2oS9sbgrnfcy3iaUphRBIAq2MaYg5ltcB6vvElC/H2X3kk7MorfCSysxN?=
 =?us-ascii?Q?Fd3P5dNcRN73XQ0LBEiLep+3gRJpH0jX6EdfJhBQ0bSQC+nFp1+rVkdt/5Qu?=
 =?us-ascii?Q?aLeNnVz/Mdh6bkxbYkNy2dCcCWvCi6NAyrcp8zC1FXwm8WDuPojVKuhx3oEt?=
 =?us-ascii?Q?EbJL8PVSEgLXW7G2Rb2fAqaSA32wmVXCriEEB82y8nKLbLOFyDp9MJpqGAdC?=
 =?us-ascii?Q?KWhbGYN/Cr+y/u+bzuop5Owc8zoc5Ep5OxYaA/iWYiuxCIjKOXDFCDgChR8f?=
 =?us-ascii?Q?cahGERpdCNa8aciwCc4W1OtaNyPHoqpJeOCwO4GwdCsL48FC5/LWWHNpvTX4?=
 =?us-ascii?Q?cOGZChd0dEFgj+Hh0kKp4m07opfpC9eLBwBsmHQzi3OSpGU8nYAA7nm1b7ef?=
 =?us-ascii?Q?xij+nbzp9LCkkJayDU7NXJFnyq3GvPJ2I7ZXTRj/SLK601iLCWLpXjVF24um?=
 =?us-ascii?Q?e26feOutJyCUUgXu2a5oWp0hN9hrhLI3NwIqgUDvMbsTlVC8KZgfakaSYlpb?=
 =?us-ascii?Q?cKlNcGW7zOkGcae6TyYXIg2K1eBkjXuDe0j9sf4YAmRWaivfiO+TwVgEc4Uq?=
 =?us-ascii?Q?CP8zbZivvaTvKLs74CbKwO5aI/IbLJDlTIcFLblUOZEaPUNb0MHRk0zUyBs1?=
 =?us-ascii?Q?YV/fPXENoRXxsU3Jpjy125QtDWC99P5+qIhE0NP8x6jkn86zzJJxdpMLyrBW?=
 =?us-ascii?Q?k9mUql7sxEnYHcCUQI0uaUiIeINL7J/olxZmdI4w?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LyT3dcC02uymFSpoMJcBqWhSn6v380knvC2Yznxr0bEM1WWlvJu6gaNzbyPzFLFVbBzfQSKpR0e3annnEtiEfx/T1m2MLSBfCn5cgTn+gqfF4+fO9TOp00Hue308svxku7rVD7Ur1Ox81qZZy16UR4WAUfWNn2lilpsPQDeJKXSOSbK6ctcQWDSuXhuwVnd7K8H9FrFNy5+cToyaHw6QKSeeaQq9GJ6YXTSxIk1DzWfmULZEL1Lzk9IdZoZqACYWhEc69CD02FTbnfaMrdnuKnezvVvkM+sFfP/Jn5GcJ9YP6o7bmIHwfbI02GfEsU4O3eNzumuYRKolGXNesea2TN60puUdQNEQ3SrsdvvBPjugBJeEWioxu2hDRVRCtPp9m/0pBrzkP09HmLMd4H5t/uRn2Pu1u22oaFiBWawRabSGi1iHNyew60CSNMg5EU1xntJ6/j8LjfqsDc6bGQC5lP4BlJRTCKvRCyj4H/Br3BZ6pHPdqBGrB9wKwxdefAjPmfTDzfYyfEfxWEABNyk4wAzq24lI2F/2KOCkUu8I+8lHay6YgazeKKjvpOqE1dS7IoAK7jMIGvau5HlhiRjxuS9xYWkd0SiOoB5qjIwWvb8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b04d58-1f89-4ab8-e2fe-08dcedfbd2fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 16:01:41.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8w9WrPkazzGtmqtRr+rN2JT7oGsePC/vZmOja3QOda1FGuNjaKeIfQ7fA3bipntvx+I7ut82ma6RhDA2q7N5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5673
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160101
X-Proofpoint-GUID: -9CDOWJcOWxg_wUjus44LxJCy8lRx6gb
X-Proofpoint-ORIG-GUID: -9CDOWJcOWxg_wUjus44LxJCy8lRx6gb

From: Eugene Loh <eugene.loh@oracle.com>

It is possible for new providers and probes to appear after dtrace_go().
Add a function that can be called for such discovery, on a per-provider
basis.  Each provider that supports such discovery needs to provide:

*)  a function discover() that performs discovery on behalf of the provider

*)  a function add_probe() that adds a particular (discovered) probe

To support looping over providers, move dt_providers[] from
dt_open.c to dt_provider.c and extern it in dt_provider.h.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c      |  6 +++++
 libdtrace/dt_open.c     | 22 +---------------
 libdtrace/dt_provider.c | 57 +++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.h |  6 +++++
 libdtrace/dt_work.c     |  3 +++
 5 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178e..7a36b6187 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1275,6 +1275,12 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		int		fd;
 		int		rc = -1;
 
+		if (prp->prov->impl->prog_type == BPF_PROG_TYPE_UNSPEC) {
+			if (prp->prov->impl->add_probe)
+				prp->prov->impl->add_probe(dtp, prp);
+			continue;
+		}
+
 		dp = prp->difo;
 		if (dp == NULL)
 			continue;
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 848141ddc..1f586fc4f 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -61,26 +61,6 @@ const dt_version_t _dtrace_versions[] = {
 	0
 };
 
-/*
- * List of provider modules that register providers and probes.  A single
- * provider module may create multiple providers.
- */
-static const dt_provimpl_t *dt_providers[] = {
-	&dt_dtrace,		/* list dt_dtrace first */
-	&dt_cpc,
-	&dt_fbt_fprobe,
-	&dt_io,
-	&dt_ip,
-	&dt_lockstat,
-	&dt_proc,
-	&dt_profile,
-	&dt_rawtp,
-	&dt_sched,
-	&dt_sdt,
-	&dt_syscall,
-	&dt_uprobe,
-};
-
 /*
  * Table of global identifiers.  This is used to populate the global identifier
  * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
@@ -1210,7 +1190,7 @@ dtrace_init(dtrace_hdl_t *dtp)
 	 * known providers.
 	 */
 	dt_probe_init(dtp);
-	for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
+	for (i = 0; dt_providers[i]; i++) {
 		int	n;
 
 		n = dt_providers[i]->populate(dtp);
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 8cfef0ba2..5f9766183 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -18,10 +18,32 @@
 #include <port.h>
 
 #include <dt_provider.h>
+#include <dt_probe.h>
 #include <dt_module.h>
 #include <dt_string.h>
 #include <dt_list.h>
 
+/*
+ * List of provider modules that register providers and probes.  A single
+ * provider module may create multiple providers.
+ */
+const dt_provimpl_t *dt_providers[] = {
+	&dt_dtrace,		/* list dt_dtrace first */
+	&dt_cpc,
+	&dt_fbt_fprobe,
+	&dt_io,
+	&dt_ip,
+	&dt_lockstat,
+	&dt_proc,
+	&dt_profile,
+	&dt_rawtp,
+	&dt_sched,
+	&dt_sdt,
+	&dt_syscall,
+	&dt_uprobe,
+	NULL
+};
+
 static uint32_t
 dt_provider_hval(const dt_provider_t *pvp)
 {
@@ -149,3 +171,38 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
 	BT_SET(pvp->pv_xrefs, id);
 	return 0;
 }
+
+int
+dt_provider_discover(dtrace_hdl_t *dtp)
+{
+	int i, prid = dtp->dt_probe_id;
+
+	/* Discover new probes. */
+	for (i = 0; dt_providers[i]; i++) {
+		int n;
+
+		if (dt_providers[i]->discover == NULL)
+			continue;
+
+		n = dt_providers[i]->discover(dtp);
+		if (n < 0)
+			return -1;        /* errno is already set */
+	}
+
+	/* Add them. */
+	for ( ; prid < dtp->dt_probe_id; prid++) {
+		dt_probe_t	*prp = dtp->dt_probes[prid];
+		int		rc;
+
+		dt_probe_enable(dtp, prp);
+
+		if (prp->prov->impl->add_probe == NULL)
+			continue;
+
+		rc = prp->prov->impl->add_probe(dtp, prp);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 17b1844cb..384d4fd33 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -62,6 +62,9 @@ typedef struct dt_provimpl {
 	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
 			  const struct dt_probe *prp,
 			  int *argcp, dt_argdesc_t **argvp);
+	int (*discover)(dtrace_hdl_t *dtp);	/* discover new probes */
+	int (*add_probe)(dtrace_hdl_t *dtp,	/* add a new probe */
+			 struct dt_probe *prp);
 	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
 		       const struct dt_probe *prb);
 	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
@@ -86,6 +89,8 @@ extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
 extern dt_provimpl_t dt_uprobe;
 
+extern const dt_provimpl_t *dt_providers[];
+
 typedef struct dt_provider {
 	dt_list_t pv_list;		/* list forward/back pointers */
 	struct dt_hentry he;		/* htab links */
@@ -110,6 +115,7 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
 					 const dt_provimpl_t *,
 					 const dtrace_pattr_t *, void *);
 extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
+extern int dt_provider_discover(dtrace_hdl_t *dtp);
 
 #ifdef	__cplusplus
 }
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a..5318cdb7e 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+	if (dt_provider_discover(dtp) < 0)
+		return DTRACE_WORKSTATUS_ERROR;
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

