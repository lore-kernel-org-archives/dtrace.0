Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556F27F4D4
	for <dtrace@lists.linux.dev>; Thu,  2 Oct 2025 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759432195; cv=fail; b=CFifd0w03AeXAK/tpKOM2LTeOqdVugT9VWr+kB0AwSCvmKufZBEeUrAvjJrTL/AJ9oR9MF56624XzJg0s9Y/5IpNy3TZHDWNVQlhvbDTp9plEJao3WFJOP0Ij/6IsCJPf6BSEW3VF0bngMU1yFm4y+ac0YuVOys44OG5GEIrdTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759432195; c=relaxed/simple;
	bh=zvzY7AXmI6Jfs8EFHOvtrUEFHF41xg0prtRXNM6SUho=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Uk47cVLQRIyPknZaLvBQ8NrqlI9PD2dJDMP9Lu9IkfRmpqEn7SxT2Ger34wS+QnVAc9yUiTRPlOmIuEZm3ZijerIlJWbcCFK50WmRe6CGhYkHGtwq3mSK8UpXanXHBHC0KcdhvMDN8hGNa/kMUV7OmE8Ld+rwbdZ5aiFbssSgWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fMxWmMXY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zXkdvXQf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fMxWmMXY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zXkdvXQf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1rkv003062
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 19:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=3xn7nqbPmFpELRiwzMZb7aRiQQUjcZL99MqDq+ly8m8=; b=
	fMxWmMXYF0cdWp+TKhu2agtPGgyGeNp3m2Qh4ck7O40EBlly375G12rn2C2NSTnf
	zW0gZ3omFwybROvlp9X6s3+URpxdSPEU27bWx+V8sNHrUg5HXrq164+Pwf2G3XKm
	SVBhQLuAExamPymXsU/WD2HnlcIzZkVxJmY+DOPRlfFXGDrJBOzoMGm4KMlr6biu
	gvrunElcgFsi2YW6DEV1UraSkv3KMAYrmXQisSwi6XctQD8Wq1LbgHwQLjHojgX9
	4x5zkDGn5GBhLT8T3AOyR9uUseD19aiyOwygnfnjDWISgaiAWcvy6QGGUfYbmS0H
	w6riXxeAr7qFeMuBKLq0CQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1ux6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 19:09:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592Iedn0003793
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 19:09:48 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw18591n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 19:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+8+2pc48ol3fpgiuTsu1Tlcc3bIBDfw5VVDilQ/DKT/iDlQ1ayfluT5W5mHYKB1pznN8TlND3+Vz02U9/3pd8rO1uDeTo4v3ZuB6arKKM7Hrrn5V/sQLmFkG+McfwLQrImhsHCMVGRwWOc7CUdBWnxosSXqZkT3P6NtR76dbMZdWhqSJg1qrc76Ccs2ZkrYAY4wx1rfmtiNhyR8iu1rNZyaGUUKKRaKlUkGKYzl4AN3/KsahwNa4wTgRSFIIREpThpKlPewTfRgR5DZZax2/9vF7gBy4RfGM0Pp6aDG4FDTY2zkcGVKQuEjzPPeuOtLGQWT6s02vjBKG08ffzSZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xn7nqbPmFpELRiwzMZb7aRiQQUjcZL99MqDq+ly8m8=;
 b=d822Eb86HXo3ACpp3UghbVA28CfDdGPfcwsIZOk9v70tt3fNkL4RT0MR9ezd1o6aQhP9npD6VEy1Pg4Uv4wf33MNmyX/Q0blAemsdB5TfA2PYi3lZyHR/ERDu+Gp2uU6xVcfaQHHtb5EtotIp1CH4TeBnEzKLfQn5NBIvPrfQe0HIRWAtquoQfcdxFni3k9/djNEHlpHCO2jqSISkuv4ZCLIVzgrNCITG04ecnxAQAIaMlb7FJxTFCnnrF85WoV0vB4J8rIzgABwDiZv75du7HF/R0jcPyhCfdbC7yDNJf6DTGurqcKTmPgbQDJNoYYe/t/lvF6k86NKtj56KL3DQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xn7nqbPmFpELRiwzMZb7aRiQQUjcZL99MqDq+ly8m8=;
 b=zXkdvXQfwLN2F+QG9vXOGJb6zAGTEX+UpZ3whhLZbIJ7V0+dCx8PGwjeCR0VWNDo3yPZwkhSF267VUV6JA9oR1LNhsPDuMCrHGuXGWS8X0m71BE08HNWzQrP4MN2Wec/Ku5dwdfHKb2TAQRjVJhgQa7jfJwOSxtVUx+qaz/Cack=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW5PR10MB5665.namprd10.prod.outlook.com (2603:10b6:303:19a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 19:09:38 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 19:09:38 +0000
Date: Thu, 02 Oct 2025 15:09:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] options: check *frames option values against system limit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672250D1857696476BB9C3FC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW5PR10MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9a1986-f42c-4b67-0ec6-08de01e73b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mWXn0YyqHmTwZHvGZguDrz3EDwfFpVItWpE0X+fwT6iOJCKcsDYUr9c8rdsH?=
 =?us-ascii?Q?sVre0gNt3e4VBcjPnBltXC0iqHhtUbxH1173mZjWXATJ7NsjXrQSjpLPeVhh?=
 =?us-ascii?Q?NU4hKHqUXOFSLpBca0DN12huImX/fziJw9Q/rwfzV7hgMFLb6dvN8nK+hH4G?=
 =?us-ascii?Q?SLcEIizQqFVeNTyekx4L6xrHvF5m7XcQGtjs738Cu4Uf+FZUFrFDRG8fOr+J?=
 =?us-ascii?Q?QfqlZAuSOSYvaF+TzAjYBVRJOyTCzubpSZ4MWGigwCCiOul0lRO0SwTdqcgc?=
 =?us-ascii?Q?oWFLyKdhUNfdIppA2AZfDngnlW66DWdMbI/Wv9dvvVqTQvzuRuG5C7j47mbj?=
 =?us-ascii?Q?yLGRJNhMeQCQWIK64+Ytjf0k3HSsxOeQavPc7K9istDHwUXlWtk04QgAZ3vL?=
 =?us-ascii?Q?TWO4HWSzD4tKBZofzqyYj9AS/ZpLlPLIW3O/N9PbYlASAiZxb8d71N62RK19?=
 =?us-ascii?Q?0POMlI1ABKogu6SVKC0GAJhHvw6b40dsVLf3G8iFIJoXOMECrkGVElMymbaB?=
 =?us-ascii?Q?5cEFyImdXZQeG858bQHZwyi5anPY4dEulqXdvtQ5/PXxl5hh8e6JD/CG0pj1?=
 =?us-ascii?Q?cRR/8BB0ShYZLZs7VAoYx6v/u1ScnzhFnV9xVIZ6pUZFbjJuY9znuK8hwepb?=
 =?us-ascii?Q?/yDaeg54htqnIya5ixbMmYo8OxxydbK4vDFbDigRuSc508cN13wZJS8tddqW?=
 =?us-ascii?Q?z6uYqUQ1fkADFMxNpMqVonBsRwfRFWkhd2r84vbj45nQNT3g5fD8TRO9nGDI?=
 =?us-ascii?Q?Sjr9iY8uQiiXd81BVglt8TulVuEcik15oKk0bO7dZHUQK6HGd07DjmAMaib2?=
 =?us-ascii?Q?pyIlbgMcmR5NZNzh/3BbzdUMaib4EbgVuXC2FWLfbtGPqeMTfYXr/vNw62OQ?=
 =?us-ascii?Q?usrquEmqAnPlPX8lu5WGbcHJTTVZrk/J+qf+2s+ZEdwo7wLRwfIY5GMwXwha?=
 =?us-ascii?Q?ggXfns9CrZu90wsjC4gurMZE0ujEFJiyturgtrn0VMCuHuIP7snf+KM/ru0K?=
 =?us-ascii?Q?msBc73CVzHgf6cp5RVGEPvSgsNrVVCq/9QgA5XycFoFYkmgMuK0r0BTF1ZbL?=
 =?us-ascii?Q?ny/UEsxDjc21TJ4SwvNEgzNZGZXTdJYzP84iGG/T672YJBeVCU1fZ1o5Nkl6?=
 =?us-ascii?Q?QyQUbpR6RZXkh3kSTddILlA6eMSYpVZ7VObRzOGzs6N4R3Z8OGUqNDuWu3DL?=
 =?us-ascii?Q?RXLM7BgpBo6900p519zxbivyF0+bXxndyFrNvQUCRc7cKg75VeOL+gh6X+/x?=
 =?us-ascii?Q?8TjzhI2p9H/n/dWS56AUJiHHrkgCaEYbXzeTN/+AwXZG4fKcA0LaJDV4H9kB?=
 =?us-ascii?Q?Wg2Li0rLd0cJNl/k3CbG0HvJwm0mca9B9HhBtibzhGtFIcfdNEkDrDl5Phdy?=
 =?us-ascii?Q?uBj1lOlp6Qn9zRo7AM6krabzrmojpMQYGiXmRe0012qzOPTheSfoiZkpRGht?=
 =?us-ascii?Q?dl9gTNP0IC+TjEz2v17DcBEFv2Tuqtzb9HzyL0HDXLrCEkXoSpiBhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cpC4SQSnkSJ3pqlG53N70nuxfACM2N/74mBQvnuDMyarlHn/16MywIXwPXBO?=
 =?us-ascii?Q?tCDqZMikF7LEHeZifbOTiMpbrZilOWAMMpPQhRxcj3zt9S5+Gd9WQKdeEwrE?=
 =?us-ascii?Q?F9CuzqzvkOWo+hZFD3HWA92fz/Zds2Za9sqOxv+YVmY65tajdCzUW9230gUL?=
 =?us-ascii?Q?Hrb5ItdouBIB2OgwimYDfiAU68MnlmjKWJsogia3TdtCo9ooGCaBLsQPHCWI?=
 =?us-ascii?Q?wWr6LbTbIx/7g135E/ZJRxnGPm/5ztqIk1AeOwvUpyBUbzr5VwPysLwCseTd?=
 =?us-ascii?Q?iDaP9oYjbUVS7ax82Hv5w5Cw/4xFMh2nif3zNo9ZHMScPo07h8jZgzUqZBs4?=
 =?us-ascii?Q?prGYF2FVj2JIwS5Wfe54qiEVgS05SFuDsJ+uX6QyJhCho/xBMVEL51VnhAcq?=
 =?us-ascii?Q?6eh+2EYt6EqkZ1a/ULDc4ibgN00dBFUzDLEmD3V37MvsJ/80LpGsgfORhDgv?=
 =?us-ascii?Q?LyGMf7nmRgYyQMCV+g941jLVwRfqsKGnjAUCkOgkBslH8visggwE/z68r5vc?=
 =?us-ascii?Q?cAdej92os7ypMK1/fTFRV0Ju0fBMHKrbuENHeFVyIzNOEfk+NycQVXKMLjr/?=
 =?us-ascii?Q?6o6L9fJfJ1EyblfOI5TF9YCt16BY+Lz/WcR2phLJRDKNTG7GprqSdub1yMRu?=
 =?us-ascii?Q?9pxrt42k6L34F0ymcqJbJckicN05vHvMDbUovmA+FyV6y0vXAEbwWjczo/25?=
 =?us-ascii?Q?X3MmSd2ftHJte2pb7Lahc9NRKFIz+zWjbaPApJBbQRDGzK9Vqb65Fa5ae/SB?=
 =?us-ascii?Q?R/apARFqCkUhp4iON3TnzVq/fi6PHVHounhh1nGBsMP9rn1RT7hTHzALyOV7?=
 =?us-ascii?Q?zZDuaaqMvMNiPHHitONcy7YJT15AelG5hl473ws0MsiFJx/dFEVClsz88UbX?=
 =?us-ascii?Q?d4iiS04mfROJKBfiIqcINL0UhPzZV1HX3jTAoy9730NR3lwsiEmtcpwvBemg?=
 =?us-ascii?Q?Jol+6wNeN6fDO6Z/nJDdstqXv1KN7xoTqJTH9/EWqwULDarYGiRURTno4FLQ?=
 =?us-ascii?Q?4L6LDGZ0v2e2FzcvQ2Uc+d236CMMoyqioR0IRtEFus9BU3vaF+doGSIOWODF?=
 =?us-ascii?Q?ZcwPNnSFYiZ+6vGHwxmBlM83NZPmJuvAw9fL8gid3Prm2ug+MkVdn+TXYiU0?=
 =?us-ascii?Q?IiEHZ5qmTY8U1Qh7oGd6LVbmdd9s7AFY4SXztUN9sCO9jAcq1aVs1AFwAwXI?=
 =?us-ascii?Q?XDANLKRN5BqwyETqTmfrmLGAwPje4326+MOIpz5Zt/6uHcWgRzIa/l+oNz0t?=
 =?us-ascii?Q?/ta1czhFw42Nm+NhNZYGUtiJbxzfxEBOrmmg4mRqQEUKF7TO0kzbNeN9aa5M?=
 =?us-ascii?Q?s/KxnzqzAKLWlQs1s9i4s4PKBVOY7OFKkBmKmPsGMtfQV22e8vW79rJA42Y2?=
 =?us-ascii?Q?N5aSrWkQfFbvMsqKbBDjwXzSyQMwl9J1h25AHFmIJu5Wk5hzCHIum/tvy2HV?=
 =?us-ascii?Q?SNvisTuLHp1zljf0M8OHYCNm8Et0+xnRgO2LFenRul9/mYbBDlP9ooj/jBqn?=
 =?us-ascii?Q?SHu1oG+hAJ1pGM9BM5fLsVBscINrGhLTLVgmP9bB91zqjMQKs/Uc8mYGK454?=
 =?us-ascii?Q?AZ4MiOrx6OrSP2rx2twYxajXb5GOE+6/uO9QTxByVwlQYNt6ZT5jBL7xfXCX?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hNMqY0nd2JD8WiGcqJFkxqoHKEX1mk84E3an5cTUBeZ+rdOefrfWmNgmpygUfSTthJBDydZ5u3vC707T6cntDqJEvnktSFTnvjB/q1Qgy2GL0BbM76jKB+Uhw0umc4HSuKxBX0iqNN89FpJ/0IjyCOQPYAPh2jAvMBQhVXYyok4/r0DmljS8ymrgZWDAe7xUdVl7Pdl9nAyoXbhzu4V6hcduQFBay/3MWurF4eGCK8tXVAy1hGwom19L4R6wXzzgW/5UNu8rwe2TpXl/e1ZmQkzyUveWM92oX+WYC0PUd4T98lfrYHmgpk/H634govyr7EWPB70ZBQFndziT4EqZ45VZzUv+6Q9AP6aYln8OgT91auZO9fDWLZ/17CKoG2WcBGiqs+eM9ockiM9ujduI8mptFTXRLjT3jpoXHSf7d7dM3xBmWPTyqtgvQL55374AeDZiYeWL8lTe4PDeb3oBIWe5Y2IS6X693pj70OU6UU/AO1p3OjGU6EYa/OLZrcx/CQnmdBeDnYT0KqQlDV0oaKWkT6ISQkIiQTUH03Yq/cItUbiTZ4axRfUgHxaIw3qzxEoNMZ+8ZjZrQiSaQGESXb9RWsKCGI3aCCUQxlKFngE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9a1986-f42c-4b67-0ec6-08de01e73b76
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 19:09:38.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Way1rJb/0i39CV8Xg0a4SwW2aulBINcD5zFzY6ESgUVv5miBS8DHhKBIFOCiV/Jduj1etJhQ8kODHufQmHT6pQcwkUYMN9HMlYSoeij9q24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510020166
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfXzO2G6Ya0xr+5
 5Vp3oMdcJore0XzW0i86F6YR5htCnrSCF54QfN6KOAlXrr1yCnig+lBREPYO/ZZemnn7mTmbcJ7
 54NXs7koiHZGrV+SPJ5HEx7EBMkjtgdsz5fu5FvEBLFkxm+DKODVw1NLAJocvrX7mrQSv1pzDuX
 WMNTglY59NYxKfhItZtpDAey3WRxvzdZxe4dz/Be4PzjbCGkZyuV6Fgm5uiEKzaIWGk2WF9n/4I
 hzTjj5t0TEZxaycMCUStAS6vGCcdlxpbTBfTQ3MTm3FKpfTa4I74VrNl/Sz/4jtpaUxsiWEcmz0
 SO3VtqPZ/kDK6LBk8ETKdNcNmcv2fsfv7YD6neiepsoKsTaGK/p73dThRofnvucR/6xszx3+Mw+
 KTsOMJ6EmcmiPnbuumPaUtrVtirDSg==
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68decdfd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=o3_BI0SPW4EuL0nJPdEA:9
X-Proofpoint-GUID: r8ZEpi8jDqqVsgx7E5mMHNEfXeBe5Clw
X-Proofpoint-ORIG-GUID: r8ZEpi8jDqqVsgx7E5mMHNEfXeBe5Clw

Commit 81e99397d ("Add support for the stack() action") added code to
retrieve the system limit for stack traces and used that value to set
the 'maxframes' option.

However, a user can set the 'maxframes' option from the command line,
which would allow setting the option to value beyond the system limit.

We now record the system limit in dtrace_hdl_t as well as setting the
'maxframes' option to this value as a default.  Options processing now
ensures that *frames options cannot be set beyond the system limit.

Note: If 'stackframes', 'ustackframes', or 'jstackframes' are set
before 'maxframes' they could be given a value that exceeds 'maxframes'.
The existing immplementation in the code generator already lowers their
value to 'maxframes' as needed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_impl.h                           |  1 +
 libdtrace/dt_open.c                           |  7 +++-
 libdtrace/dt_options.c                        | 38 +++++--------------
 .../options/err.jstackframes-negative.d       | 24 ++++++++++++
 .../options/err.jstackframes-too-high.sh      | 25 ++++++++++++
 .../unittest/options/err.maxframes-negative.d | 24 ++++++++++++
 .../options/err.maxframes-too-high.sh         | 25 ++++++++++++
 .../options/err.stackframes-negative.d        | 24 ++++++++++++
 .../options/err.stackframes-too-high.sh       | 25 ++++++++++++
 .../options/err.ustackframes-negative.d       | 24 ++++++++++++
 .../options/err.ustackframes-too-high.sh      | 25 ++++++++++++
 11 files changed, 211 insertions(+), 31 deletions(-)
 create mode 100644 test/unittest/options/err.jstackframes-negative.d
 create mode 100755 test/unittest/options/err.jstackframes-too-high.sh
 create mode 100644 test/unittest/options/err.maxframes-negative.d
 create mode 100755 test/unittest/options/err.maxframes-too-high.sh
 create mode 100644 test/unittest/options/err.stackframes-negative.d
 create mode 100755 test/unittest/options/err.stackframes-too-high.sh
 create mode 100644 test/unittest/options/err.ustackframes-negative.d
 create mode 100755 test/unittest/options/err.ustackframes-too-high.sh

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 4dc4c9a7..723aac8b 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -310,6 +310,7 @@ struct dtrace_hdl {
 	uint_t dt_maxtuplesize;	/* largest tuple across programs */
 	uint_t dt_maxlvaralloc;	/* largest lvar alloc across pcbs */
 	uint_t dt_maxaggdsize;	/* largest aggregation data size */
+	uint64_t dt_maxframes;	/* system limit on stack traces */
 	dt_tstring_t *dt_tstrings; /* temporary string slots */
 	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
 	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index ed0b14a1..ba5463a0 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -764,13 +764,16 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_options[DTRACEOPT_SCRATCHSIZE] = sizeof(uint64_t) + _dtrace_scratchsize;
 
 	/*
-	 * Set the default value of maxframes.
+	 * Set the default value of maxframes.  This is the maximum of stack
+	 * frames that can be requested from the kernel.  The *frames options
+	 * cannot be set to a value that exceeds this limit.
 	 */
 	fd = fopen("/proc/sys/kernel/perf_event_max_stack", "r");
 	assert(fd);
-	if (fscanf(fd, "%lu", &dtp->dt_options[DTRACEOPT_MAXFRAMES]) != 1)
+	if (fscanf(fd, "%lu", &dtp->dt_maxframes) != 1)
 		return set_open_errno(dtp, errp, EDT_READMAXSTACK);
 	fclose(fd);
+	dtp->dt_options[DTRACEOPT_MAXFRAMES] = dtp->dt_maxframes;
 
 	/*
 	 * Set the default pcap capture size.
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 7508f044..97516517 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -913,40 +913,20 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 }
 
 /*
- * When setting the maxframes option, set the option in the dt_options array
- * using dt_opt_runtime() as usual, and then update the definition of the CTF
- * type for "_stack" to be an array of the corresponding size.
- * If any errors occur, reset dt_options[option] to its previous value.
+ * Set a *frames option, ensuring that its value is within the system
+ * constaints.
  */
 static int
-dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
+dt_opt_frames(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
 	dtrace_optval_t val = dtp->dt_options[option];
-	ctf_file_t *fp = DT_STACK_CTFP(dtp);
-	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
-	ctf_arinfo_t r;
 
 	if (dt_opt_runtime(dtp, arg, option) != 0)
 		return -1; /* dt_errno is set for us */
 
-	if (dtp->dt_options[option] > UINT_MAX) {
-		dtp->dt_options[option] = val;
-		return dt_set_errno(dtp, EOVERFLOW);
-	}
-
-	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
-		dtp->dt_options[option] = val;
-		dtp->dt_ctferr = ctf_errno(fp);
-		return dt_set_errno(dtp, EDT_CTF);
-	}
-
-	r.ctr_nelems = (uint_t)dtp->dt_options[option];
-
-	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
-	    ctf_update(fp) == CTF_ERR) {
+	if (dtp->dt_options[option] > dtp->dt_maxframes) {
 		dtp->dt_options[option] = val;
-		dtp->dt_ctferr = ctf_errno(fp);
-		return dt_set_errno(dtp, EDT_CTF);
+		return dt_set_errno(dtp, EDT_BADOPTVAL);
 	}
 
 	return 0;
@@ -1194,19 +1174,19 @@ static const dt_option_t _dtrace_rtoptions[] = {
 	{ "destructive", dt_opt_runtime, DTRACEOPT_DESTRUCTIVE },
 	{ "dynvarsize", dt_opt_size, DTRACEOPT_DYNVARSIZE },
 	{ "grabanon", dt_opt_runtime, DTRACEOPT_GRABANON },
-	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
+	{ "jstackframes", dt_opt_frames, DTRACEOPT_JSTACKFRAMES },
 	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
 	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
-	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
+	{ "maxframes", dt_opt_frames, DTRACEOPT_MAXFRAMES },
 	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
 	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
 	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
 	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
 	{ "specsize", dt_opt_size, DTRACEOPT_SPECSIZE },
-	{ "stackframes", dt_opt_runtime, DTRACEOPT_STACKFRAMES },
+	{ "stackframes", dt_opt_frames, DTRACEOPT_STACKFRAMES },
 	{ "statusrate", dt_opt_rate, DTRACEOPT_STATUSRATE },
 	{ "strsize", dt_opt_strsize, DTRACEOPT_STRSIZE },
-	{ "ustackframes", dt_opt_runtime, DTRACEOPT_USTACKFRAMES },
+	{ "ustackframes", dt_opt_frames, DTRACEOPT_USTACKFRAMES },
 	{ "noresolve", dt_opt_runtime, DTRACEOPT_NORESOLVE },
 	{ NULL }
 };
diff --git a/test/unittest/options/err.jstackframes-negative.d b/test/unittest/options/err.jstackframes-negative.d
new file mode 100644
index 00000000..0fdcbb58
--- /dev/null
+++ b/test/unittest/options/err.jstackframes-negative.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xjstackframes option requires a non-negative value
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+/* @@runtest-opts: -xjstackframes=-1 */
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
diff --git a/test/unittest/options/err.jstackframes-too-high.sh b/test/unittest/options/err.jstackframes-too-high.sh
new file mode 100755
index 00000000..869a3d1f
--- /dev/null
+++ b/test/unittest/options/err.jstackframes-too-high.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+#
+# ASSERTION: The -xjstackframes option value must be within the system limit.
+#
+# SECTION: Options and Tunables/Consumer Options
+#
+maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
+
+$dtrace $dt_flags -xjstackframes=$maxframes -qn '
+BEGIN, ERROR
+{
+	trace("ERROR: DTrace should fail to start.");
+	exit(0);
+}'
+
+exit $?
diff --git a/test/unittest/options/err.maxframes-negative.d b/test/unittest/options/err.maxframes-negative.d
new file mode 100644
index 00000000..62e4d21f
--- /dev/null
+++ b/test/unittest/options/err.maxframes-negative.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xmaxframes option requires a non-negative value
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+/* @@runtest-opts: -xmaxframes=-1 */
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
diff --git a/test/unittest/options/err.maxframes-too-high.sh b/test/unittest/options/err.maxframes-too-high.sh
new file mode 100755
index 00000000..3b2674cf
--- /dev/null
+++ b/test/unittest/options/err.maxframes-too-high.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+#
+# ASSERTION: The -xmaxframes option value must be within the system limit.
+#
+# SECTION: Options and Tunables/Consumer Options
+#
+maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
+
+$dtrace $dt_flags -xmaxframes=$maxframes -qn '
+BEGIN, ERROR
+{
+	trace("ERROR: DTrace should fail to start.");
+	exit(0);
+}'
+
+exit $?
diff --git a/test/unittest/options/err.stackframes-negative.d b/test/unittest/options/err.stackframes-negative.d
new file mode 100644
index 00000000..e6c276d7
--- /dev/null
+++ b/test/unittest/options/err.stackframes-negative.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xstackframes option requires a non-negative value
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+/* @@runtest-opts: -xstackframes=-1 */
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
diff --git a/test/unittest/options/err.stackframes-too-high.sh b/test/unittest/options/err.stackframes-too-high.sh
new file mode 100755
index 00000000..0123f92b
--- /dev/null
+++ b/test/unittest/options/err.stackframes-too-high.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+#
+# ASSERTION: The -xstackframes option value must be within the system limit.
+#
+# SECTION: Options and Tunables/Consumer Options
+#
+maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
+
+$dtrace $dt_flags -xstackframes=$maxframes -qn '
+BEGIN, ERROR
+{
+	trace("ERROR: DTrace should fail to start.");
+	exit(0);
+}'
+
+exit $?
diff --git a/test/unittest/options/err.ustackframes-negative.d b/test/unittest/options/err.ustackframes-negative.d
new file mode 100644
index 00000000..ede20425
--- /dev/null
+++ b/test/unittest/options/err.ustackframes-negative.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The -xustackframes option requires a non-negative value
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+
+/* @@runtest-opts: -xustackframes=-1 */
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
diff --git a/test/unittest/options/err.ustackframes-too-high.sh b/test/unittest/options/err.ustackframes-too-high.sh
new file mode 100755
index 00000000..fc362fff
--- /dev/null
+++ b/test/unittest/options/err.ustackframes-too-high.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+#
+# ASSERTION: The -xustackframes option value must be within the system limit.
+#
+# SECTION: Options and Tunables/Consumer Options
+#
+maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
+
+$dtrace $dt_flags -xustackframes=$maxframes -qn '
+BEGIN, ERROR
+{
+	trace("ERROR: DTrace should fail to start.");
+	exit(0);
+}'
+
+exit $?
-- 
2.43.5

