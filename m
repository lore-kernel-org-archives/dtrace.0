Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674728643A
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761261314; cv=fail; b=o6vuIAlYfTqvIllxnpvEJ+RClPTQlZQRw29zGzmGlrVPd1AW0AFdmE9sMld+vDO59Gdz1HKP+ZpHx1tkbvz3/yNsqCj/oC0NHyNoLdy/jCwU/MB7LXjvVpIeG5DqAED6/O1lOW0lL3cVtY9LojWLTVeii3z5JsA3BlDm4mWSi3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761261314; c=relaxed/simple;
	bh=5nL057kLyD2UGBtsOprl/VyOsbVMr9XT4zL8EJB8eWw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KDNn1dFSadtDahRG4s6wH8crSGEhqcJAk9BRubTX+ihUGOLAY0LwlfFMmrOGMjVj6sbvwcaa+e8thGLe+pdwzOBCQMOl2oidy8ynZU+ddYeAofVLO2nyWK/pUT08aKr1BRBFz/lMeP6/GRQKfyA8th4VBJPByeo/aYfQfKqPPlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TIIRPi1z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l7YfpKtA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TIIRPi1z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l7YfpKtA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLNvx0017874
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=n8Afv3W0SQSveR+4PBrYjSxBNb9P6b5AMF1tvSVXUOc=; b=
	TIIRPi1zPBLEzgKuI8Ync7dnggu9SygvdSNa9KlAwHFIRMhsQn0zHHJaOvJwfR6C
	rKDC1lqVGMhNaYeQKXhZwPqKZfJWIczf0oixqTFHU8JxrXXZ4W9TJ5Q8JJ2q0yKx
	c3Gd9OC3dB7C27KPvjjoHb1gECKIlXRoQrb33wnpVNyudXosJlO5bl6URzfL8ftt
	ftgADoFn1uGyEWNmHjjDZujtfh2QJ8Oel8vi22zlKYKo3vDiKm2w7KMAFtkxryE5
	PcCe7H9Jox+J3Z01d9LqYbQt0Z9KKBQk5591aX8OZq8fC8ERSTmedLoYedX6POar
	mILAzK+Jc2ts+vPrV9wXYg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv3k3qct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:15:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NMXjeh022507
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:15:09 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bg86uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 23:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GysEfCrKBl7iSk0siTqFvn6KRMh9cn1Ru9jbq7EyH8VVsXysb2mHEPEvU2jXT3uosQsIfm7vTZQWGRHZhsUBXVafWuLU3BtccnNFm1uunINxycnc/sTOPRRqoAtb0jzFpj8M2S1B5Sx2HL37SD4MtS+eUl83Ncqsz6t2Q/cV5jMD0yOMQ9eg8xuEO7vKqKilbEgKH27vCF7bx6F6VQ2l44DdSNEVOJQY5DIFqWz6b6NQmcFxgFz/Rq0XPvANuhPielDczY1Llw89TSaOCsCSv6194vSSwRroT2569Eh3eCPeyN6RyJ6lYuKzIfiqBXf1BVjnBm7lzKr7Vx4g7VzrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8Afv3W0SQSveR+4PBrYjSxBNb9P6b5AMF1tvSVXUOc=;
 b=ypM0poNQf00Fi9GRZoWnlZ2c53q3X5qUfAxkAEprFs6vtm4yZatZchEo1yINjdzFYdsglEtoZeaj1GB6+LanNMFuG20EF2lpOT8GPO+nn7uiUygeC6Rgx+ugcS8o4S+44LxSIOj1YB5Xc2F0OKQ4bSkN0K55VxuR1K7PZHY3RUqdUKxd9xZoyUTRWZU3pq9Zm8EzVLGCfpiEE66pbsDDep/E3a5VQYG4l4ZR1bn9y3t6k0eYQOwqQH8gOdgiSieEAbKwY3QtNXMJtBrOGMadLNM79vJDnCXuQneQgZww22l3/QNRJvYkOwnrWSlQbf4Xuz7E98/ZG43nYx3PHsF5Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8Afv3W0SQSveR+4PBrYjSxBNb9P6b5AMF1tvSVXUOc=;
 b=l7YfpKtAuEnbkTsHCpz1EP0OlFUBw0ANjyVhzNt7NaH2XFyp1nu4nljMFUQFdTeX3LxIqVbktEX56CHrT4+q2JjB+gcc67ioyTa2AgXWsZ9n41FDvakLcvAkNqEsc2JPa3itEiKyOY7uLr67ShHuxLuvsu5RrZqrmdPiSIfg2vk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6193.namprd10.prod.outlook.com (2603:10b6:208:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 23:15:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:15:03 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] doc: Add rudimentary documentation for using [u]stack as a value
Date: Thu, 23 Oct 2025 19:15:00 -0400
Message-Id: <20251023231500.25228-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:510:e::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ddb59e-b679-4db2-a870-08de1289fecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XGFG42/kULHFmE6J9+21/B1tlujCkaYUfSo3GXVdU1rtwUtksqqGUNhjqr6z?=
 =?us-ascii?Q?9kx1mmz5A1UbCVFFlkZLXJ4dKOCOBdATK03ifJoQAD4/hFKyVUdxFPDF7662?=
 =?us-ascii?Q?kvQGPiUaE4qo7D51nD1ZB5Rf/8NchaDybXS7nfJyOZ9H/+7uYf1tC41YDYbj?=
 =?us-ascii?Q?yHUDqmxS2uFX+/Rp8CLae5IspwC7QaRKDhJCf7JErddKuXRT6w+qrUiePMmd?=
 =?us-ascii?Q?93Wi6vMhNdSzlbSKvjap7hjay4T3OPf8H+Hd9kx/RX9ZwfvGG/utyZXDSfC2?=
 =?us-ascii?Q?BJUCvQbKfPtccMucSp9fJ2w4iSQdL41AbrGjm/gbC4uk5biaMxOQscsg8XXV?=
 =?us-ascii?Q?gJXi/z920T4vQKteNXkHt9/NT40eGaijlhvcPVe/m2HxBLsHKT4XguU2t9fu?=
 =?us-ascii?Q?9GJcXOtY5yOJt+r+q3Hc+wmABgCQUmD9bD/G4m/KiX8eEOICzUkBshNpyplU?=
 =?us-ascii?Q?/LFBBplF0QETIcr3mWSH2QYcwwl14EZUSl761to/Jjju65jqUT+yJrYq1h3P?=
 =?us-ascii?Q?99m37LWuQ8kfvpSPABs4vqY4v9/pPptGQ5zPW28TzlKHB22o4UwKUlljnTto?=
 =?us-ascii?Q?aXUWq30Ri9Jz1bcgcXr+kNHXszZ7/J4mvH8Wz/eiu6j68lHCp3TQodZwvT2x?=
 =?us-ascii?Q?J1fMaxIPHsgnbvK8z28RU1jf4s17ANyGJh8sjn4F6orSyxcxq3mTwktA07by?=
 =?us-ascii?Q?/+mCgQveRJXGyMC+b2JRLGnSzESraCYmhlYrGRxuKJqY0veXp+nz92GmoGQH?=
 =?us-ascii?Q?l6GV8KohrKQbAh6He0Lep5vxEIw05EnswP0ANrV9SINC5YhLMcu7NbuKugYV?=
 =?us-ascii?Q?DTR1ls7kOYWyeuvSw8fTOz5OMzYKRRcf/Jn4sggf42tNBET0qFYAlUpLl/3Y?=
 =?us-ascii?Q?vGEUXErD17/4jAO2OYbdpCxIV15z/8qOQaap9mVLWvv8SyV4W31NZaHOKZDt?=
 =?us-ascii?Q?2SwLcTB24Bt0Ak34cO8fisABVpAHZvqxTK5T111C1xb9FCclC859PmvNBEOJ?=
 =?us-ascii?Q?ZqugSQ4TEiq9aUgww39xoDqJFXLOq1TSF+U3iepRLfsPCYMWmWxRNzB5uFzb?=
 =?us-ascii?Q?ckGm861Y5QrADfM8izY8Fv5Rqv2QXrIKOaGrrAa6Pbl4KH6ZkP2luDi89ht/?=
 =?us-ascii?Q?N2Xnj6fIGk5CQVABRp29+Mgwy944mDTg2ClxnaiLpd3Ik+S0x3xG2UxYllT4?=
 =?us-ascii?Q?yssj8C0ksak9KRXuEEcX4gyG1S5JYrnP4PxOjoFDAcy2+oDh1C17KdfHk/P7?=
 =?us-ascii?Q?gSqjbGwndj18wFkliG04hUYpYVr1h1W5J/98iT1uy8WiDID+PtF91ZONTMCh?=
 =?us-ascii?Q?N9W8Vv1496PhcoMjfHgm2TJ4NniPWd80idHB89E61PbafYDVLhfrHZugEwoG?=
 =?us-ascii?Q?VbYniWFojXz8QC67scrF7NSFDztaMAsRUVQ4NgnR/caabwBKN5lVoIwUmQQS?=
 =?us-ascii?Q?hVpW9FMPbhD3j85fAdtyy0qSr4Ed52I0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJUyHHMXl8yzNvEpnGDWx2pM7hW+mUh/Gr5DYNhUxQgSFXiJFhZae3ax87Cs?=
 =?us-ascii?Q?gOdhYyljt4h72wg3EVu8hYm3QWSvxrnn581CZ4JhVaBrDLvAbAQY5RN3PbAV?=
 =?us-ascii?Q?WG75GdsvNIR41g1Y1lzW4vh7q6qTvoh8/UKGboB+46rul32lt8yXsKD3RYHE?=
 =?us-ascii?Q?6QzdSsSlwGFWRDpFMRNXix7WJdPS75K22LG2FdkCmSdpqtLrw2CeMnrxt1ay?=
 =?us-ascii?Q?nFETnflPI9RsmJmPzMZIs360Ktux1vhSVo/EvhP8bcLtQUmncJSEwjC8merE?=
 =?us-ascii?Q?JJR2qe9SctoWUL+/AvulFrTVIzDSHxkF4lKl6dsZym9TPrGcTvIfyryt93Ez?=
 =?us-ascii?Q?7mIAJ8n40XUa4EHBcsDyx0YjBwmVAYR4nHCbPZacunKzLpX56Lt0x3sASUfc?=
 =?us-ascii?Q?Zvj5X1c9z5wEskBz+QdP/3MwlrnkI+EZyeFpOYsZq/rwHq/PbciFyQcmFBRo?=
 =?us-ascii?Q?RyT0/RjFikXPTpARHmMfqn53swvvXUQIlIn7D0md44/NeV6EIJLoPhtLmg4p?=
 =?us-ascii?Q?fM0HJhTuwm2vTRZu9py2ckwLo+1C8O9Kt4pkSE64fPa6ONtOK2idPBjhj9RP?=
 =?us-ascii?Q?AM3uaL5ciOYmhWzWvAKE+5sAlod16fduUeyjvK+hA+3NNrpb4Cl5VtVomXkg?=
 =?us-ascii?Q?18mC+hICO2AL8rqUg01SO6Fg8yIPO7fD/a/EfqUcU5clwIfxJU5ODkRtZl7r?=
 =?us-ascii?Q?VbQw6w1wTT1Sd6b78bO4xE32ifWM0QrR7hH1W82M54aNoS1fFBrX3yLhU9Wa?=
 =?us-ascii?Q?ZsrRn1l7yci6aiP9H18kdKOvVzok9a+guS2vKIMe5gRku5MBZ/7TVvjFRBit?=
 =?us-ascii?Q?DLnRY8y0WrKwfqTGrp2dbqtQJ4KC9Qx5DklTXT0mpNkmOmu+d5Dcao3bB1PM?=
 =?us-ascii?Q?OrukRv2DHAtuK51gd6mdhMCVZX2Y2fKkN9LXoKtbYqa1RQ6zjDSXWN80usqb?=
 =?us-ascii?Q?zwBUgQ7A1kuaIRi75BgOmV2yY57dNnxpOwrlfwB45QM07L4NRd1B7kjAgbCE?=
 =?us-ascii?Q?4uzRNYmF9H065pk/2VmZTsPUlDs2Pl9zfb1n2BXbMZC3Ny9+WFndWBpFD8jS?=
 =?us-ascii?Q?+y7sRRVrTxvQf7IS2zbTeVO/saad/nGXvc2XZ22sh1ICEcoQ9ypCD1w7QsjI?=
 =?us-ascii?Q?jjYJ0LtSkYZT466dm9mRTIDO88CL7s2L/l9qfKwh6e0GtpV7WwkUctPT1JBg?=
 =?us-ascii?Q?gS6lb3qetvDl65/Gh6YHBszzecD2xgzbd5aM5JbQAauazpUZpolSCSg8W5Mc?=
 =?us-ascii?Q?8KyxtmdXIlJQA3PQEwp6rlGKIpttP+V+NRlWFwa8ynMI7qbsR/7Hluuew+g6?=
 =?us-ascii?Q?MzZ0ckuQclmzaerqGRdbDqy4wyEubyt+aDWA0q/+HGNaD2yxhNEw6/s+S3bf?=
 =?us-ascii?Q?USfIKd0c5/04fWADf8c1lmE3IuAkCdf93bFJgXuuqjS5m62T1yd0/GLViVLO?=
 =?us-ascii?Q?c8H05aT5dTR381wypu5mj836MlgCZYSzdWAcwv3FuWDvEgCJdU+DvuF0Zfer?=
 =?us-ascii?Q?/GX+QgwlGF5RlzJTZOzQbEOZPbPf2ji496nDFrCSwjgn/b0C9eQ2JdEwnnUp?=
 =?us-ascii?Q?Zhp60QxbZIMavT9WvNk2RnTRL+pj6ko6OzqhNMa2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6EhbYvC4APn1FeYIvKo2MJ7PliqDdyaOc2goWL7qpLswyZO9tALR4JrVCHEcjrCGYId1MrIi9bcs8oFHrA4U5wwy+ydynvUe/JV1IFLTiTKncMJvCXusdPHkuwbRnJi9EIOSNK+bVtlJ9cM01+YGMJEIpvPnkSEdmSnLbEom9ERNaIfjsMA4vA0KXybhfz9mIQ7aktAA2GjSK84+4X8N45BKH2AoL4Y9B2JZDxmDK6tUHEXeNdb2SVaYAsex9EUqENDLO6c7MFz3+0P1xGydEam6xMmBC4TJPU7tO8EHStG1hfuGZ+VUgFA8XLUwCcgdwKWZPwYVH9UcM1UnzgxVSjWAZyXeW3kN6Lq5RJ1PRYf4kNbCjhJVKn44plN+4EDCEO60yvm9xcc5xaSMebOeb6ivOLErcfneXGs1UH60/73P61CzLBcB7jQgTSixQI5hD7yF/B8ujBtX7Tt1/mh4KA1EvSXIe2QU6jwpjythXuMKaudSPsJ0xjFH/J5ePorpPJ+jEBzuR8Lm+dx5qe19g0B5d1ZCtQ+b1HL69dw+8c8E7O+ahXvEKkgf7+AFUT+qvkT4h31zohL8qBTw1Typ79PyT5FwR69LDXpzSNtFj5o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ddb59e-b679-4db2-a870-08de1289fecf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:15:03.1183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ra7i/5a5TNRZOAorKaUadI06mOCl8WsvBUBv8qXtch2UiRNszH/e5Ig+Rro4bzwrBLJqmAY6ZwEo6mFCFa4Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6193
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230212
X-Proofpoint-GUID: wbSvNY_5vA8m1ZbAxAWVfa_xIDKqoO3h
X-Authority-Analysis: v=2.4 cv=bLgb4f+Z c=1 sm=1 tr=0 ts=68fab6fd b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=yvIBNqMXTie84SnjEfMA:9 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX8JjeB19jEgpk
 mXATMQl8bEIxBd1DKQA/in/f87YVcdHv74zgcmVg8FTE5WiXI34SSNrVssvL1Zi91QNfjxYABhJ
 OYJqEwwGIhIMOPYxOlsr3mdUJQQWnqgJR2ooLCmRNorHuyfonyOw5yEGfBgw5n+ytePn2l8qV1z
 7HbLrRUiuWHhn8/C504PSDtEfQdhbYVwISjq9HuVydSxS1jTDvKDOYuOJaS96hj1kYnD+PTqcYv
 DODMt1WZgIUjLrwpNQdrNWx6K49WvU0P8XMZOxhgaVL6lDwK8Fj6C6sPbpZgJsuB7kacEYVK/W7
 N1RWPtUxCXCIeCN2ZGVeJHJZ9/rhlM1VTu8oQoZXTOubkyirsPGmIhS1Mrxc95B+5rd3VurFWlO
 +7MSjPwwvz3PnDBwvpQU5W8RXGMc4fmase/zCiS1C9N6y4Ro/i0=
X-Proofpoint-ORIG-GUID: wbSvNY_5vA8m1ZbAxAWVfa_xIDKqoO3h

From: Eugene Loh <eugene.loh@oracle.com>

While we are at it, break up some of the super long source lines for
future maintainability of these files.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/function_stack.md  | 26 +++++++++++---
 doc/userguide/reference/function_ustack.md | 41 +++++++++++++++++-----
 2 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
index a92c61a0f..903d3f090 100644
--- a/doc/userguide/reference/function_stack.md
+++ b/doc/userguide/reference/function_stack.md
@@ -1,17 +1,33 @@
 
 # stack
 
-Records a stack trace to the buffer.
+Retrieves the kernel call stack.
 
 ```
-stack stack([uint32_t *frames*])
+dt_stack_t stack([uint32_t *frames*])
 ```
 
-The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
+Returns a `dt_stack_t` value that can be stored in a variable,
+including an associative array element,
+or used as a key to an aggregation or associative array.  
 
-The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
+When `stack();` appears alone, as a singular action,
+it records a stack trace to the output buffer.
 
-## How to use stack to obtain a kernel stack trace for a particular probe
+One can optionally specify a number of frames.
+If no value is specified, the number specified by the `stackframes` runtime option is used.
+Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
+
+## How to use stack
+
+Here `stack()` is used to assign to a variable and print later using `%k` conversion.
+
+```
+        v = stack(3);
+        printf("%k", v);
+```
+
+In this example, `stack()` is an action that prints the kernel stack.
 
 ```
 fbt::ksys_write:entry
diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
index be9436f82..2ab6afe3b 100644
--- a/doc/userguide/reference/function_ustack.md
+++ b/doc/userguide/reference/function_ustack.md
@@ -1,17 +1,44 @@
 
 # ustack
 
-Records a user stack trace to the directed buffer.
+Retrieves the call stack in user space.
 
 ```
-stack ustack([uint32_t *nframes*, uint32_t *strsize*])
+dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
 ```
 
-The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
+Returns a `dt_stack_t` value that can be stored in a variable,
+including an associative array element, 
+or used as a key to an aggregation or associative array.
 
-The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
+When `ustack();` appears alone, as a singular action,
+it records a user stack trace to the output buffer.
 
-## How to use ustack to trace a stack with no address-to-symbol translation
+One can optionally specify a number of frames.
+If no value is specified, the number specified by the `ustackframes` runtime option is used.
+Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
+
+Stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
+
+**Note**:  Historically, if *strsize* was specified and non zero,
+`ustack` would allocate the specified amount of string space and then use it to perform address-to-symbol translation directly from the kernel.
+Such direct user symbol translation was used only with stacktrace helpers that supported this usage with DTrace.
+If such frames could not be translated, the frames would appear only as hexadecimal addresses.
+Currently, *strsize* is ignored.
+
+The `ustack` symbol translation occurs after the stack data is recorded.
+Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
+If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
+
+## How to use ustack
+
+This example shows a D clause that stores the user stack to a global variable,
+then later print it with a `%k` conversion:
+
+```
+        v = ustack(3);
+        printf("%k", v);
+```
 
 The example shows how to use `ustack` to trace the stack for an `openat` system call by the `date` command.
 
@@ -19,7 +46,7 @@ The example shows how to use `ustack` to trace the stack for an `openat` system
 sudo dtrace -qn syscall::openat:entry'/pid == $target/{ustack();}' -c 'date'
 ```
 
-Generates output similar to the following:
+This generates output similar to the following:
 
 ```
 CPU     ID                    FUNCTION:NAME
@@ -35,7 +62,5 @@ Mon 20 Feb 17:38:15 GMT 2023
               0x7f6d63fc2e65
 ```
 
-
-
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
 
-- 
2.47.3

