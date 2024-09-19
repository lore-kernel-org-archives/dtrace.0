Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D105119B59D
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726757534; cv=fail; b=Uh6Oy22K4HABX9BT3HwMfH9o12LSIC5B5GLmAbzpDbdWGBSnIA83WNC+12E97NMDnc/87RY4mZqlADUUeXyu/iNWbBJqn+rrePmoazyfX234YBtdCsXNH6ZSVxwK4NUQC3gcU98PJDLn243ugfQQCyZyQdxn0uM5Nj7PT4kuABI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726757534; c=relaxed/simple;
	bh=Tfv6M9YEMat+lKRB/atxsmfSiSNunL791M3arw8G43w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TxJR8Sq0Cd1YgxtrFFv6KYgORP70ICi87psBBvuT629ukr59X7lyDNeP2IYXDeZa8wpMl0+hsi+2vrj/QxEkjyulntHIHbvL1awi9Kr73j2QwwW6JcVpONSWy3QQ0TjmBl6e1+WwyOAvBWCxi97lca0LsiXg6h0s7YSfgQZEhDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EWjLXliJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MGUlMpcQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EWjLXliJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MGUlMpcQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JEb4AP014325
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 14:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=iGrUT5eNqcFUYat
	n9F5FuDXToOiI9yrYBP8CMtv+BdA=; b=EWjLXliJUGSEFagD5a57XpHpPzdpgya
	eRBuBFKiCNnVJgqOj1vzNCAWWzkQ1wF+EXtyiQDDWV6Lj3to8nBzX3LKf5bZuiBS
	93ZhOoZLci33BqCjfCt2eOief3X13vxeAN4jYnBY5dVDPhO6q19FPyHVKWlA6i6d
	2UlckpoIuFAU2YH85HeogvLIw7jsl/QrP5WGZTi2+6PfXLbA3CxSdjUAAWinxmq5
	GwLK2qfFZNxpCgzkZF9VwAp6QDH+84gC/cUMYoM8RVOs+HhxCt+Sksmn0tg/g1Nl
	902a5uSP+GO9jvO5vuqlu/vxheYfs5XAHPHYkN+Nm7TJ01gxptnUD5g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n3mcbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 14:52:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JDXwIB014951
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 14:52:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyg663yj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 14:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgyCDiBDDDZE0p39Fi2ljRraM0+vI/YG2z34Qc0oEl5uQqEEI2JGhJk1aipEGkdsFKlt1VGZq1PKrb/y2YvJKl5ogkwLYT3iaa8IO0a7Vf2V1HLcC03Ij9Kb61Sim46NIIvtYP8RxQazruMeUMogz9q1ZoEZDYTbl8osoLvbPOontZ+55GDok4KFJP7K/b2j4BdfntiGzuAszP0HJim/OdeuYy5ApqLe4tI5OWRuxxWqqp7OzdvvP1fN6A713NVA2W+37ioW3HdQWyPOPXe1lm6okWvCQNADjfPisAw86OmglSJ/DmUgJ/X7BfRMpBc2CzuzbwuChdCDvKJtTo6kGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGrUT5eNqcFUYatn9F5FuDXToOiI9yrYBP8CMtv+BdA=;
 b=TVmjkfTGErCmKeIeeioplwdBYIcwWt4XZo8EHFLNS9rLrp9XzWakV8iZWzhzOzidNqW9dgFBHTlrdKAEJE0CGOpOeQlyIId34n9P5qoxI+EBG4M0wjUBpjSo3aeihUsc/UUeel2DB1PfxiRL5GjTXknSpJHZlWe+1JMLK/xyS3bkaX7NReCFwQ2ayZqTQAZlNpTJ0eniTgeVBafhJPxVyeRIfBTsuOhLMLLoRC+JHK1nd4WRBg8+qC0IuZk2q5efmogDKFMLsX+PCF+m2pcoLZmDl6VDRkJB5p/cH/PjVT6zSZYcekE8p+zxt2vgWvOuVY0keHJfAvEifoZZa8i7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGrUT5eNqcFUYatn9F5FuDXToOiI9yrYBP8CMtv+BdA=;
 b=MGUlMpcQvSWQ+PUMsW7s2xFCWeSO9L+fOx9mttW/I0Kxmk3t+AdkGiFskBb28YGnIuzc7ssPvjJnoos+Cu5YQZLDK7Y6V6W443k5EzgWdMksj7xutv3r7DzQwAHmd7ZJvPIhsNFijJxwpkEn8pcFyun9CJh/s7RJo210XIrKMwk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Thu, 19 Sep
 2024 14:51:55 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 14:51:55 +0000
Date: Thu, 19 Sep 2024 10:51:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 07/19] Create the BPF usdt_prids map
Message-ID: <Zuw6idiKGHVF8PwT@kvh-deb-bpf.us.oracle.com>
References: <20240908164016.3820-1-eugene.loh@oracle.com>
 <20240908164016.3820-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908164016.3820-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: f269ae42-ca09-4248-1e23-08dcd8ba9acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5cB12gX7typc0lXJHE2Z3JaXcstcWg2SyVem4pPfKIgq4t1+DTfOR83kw2lD?=
 =?us-ascii?Q?QlX5oxWQYClv1901wFDJ4gYq1ZTvz3vu8P4PTfv/idP9+54zzkKFDFa9zqqT?=
 =?us-ascii?Q?1LAHr0U3IeXIpHQBRTxjRI5jxp1CbnjO71GyzNJdEi8Ol4CfHzJMRUFu2jFy?=
 =?us-ascii?Q?3eGVd/yMryPz/90GQ94CkfnSN3XeFw64tM1auwtrdW3RlSBAc9g9lBQnFEcX?=
 =?us-ascii?Q?BiRcCv6qiQunsPcxb+40wG3/pED52djoBzkrCn9mcW3xjko1n+Whw45cj3k8?=
 =?us-ascii?Q?HjPXpLnPhcGHenqE9pLNdFhC21reGuvpHBSLeTlKu/HWpxzUCIfDsBPeUvAu?=
 =?us-ascii?Q?4i4FvlYXvBh43ySFmr6OOj/gxEniTKU7PsQTxxVj499mkDgKrsuICOXKvVmY?=
 =?us-ascii?Q?yeKPKXQBGSxe6u3OEKlytqRfsnO8Kb7pMgRYauxKqOoe/Vq/EjQBYOBBv/9K?=
 =?us-ascii?Q?IHXqmMWuzTSAkBHWFsRzxMk/Snx9PQvICnQtkT12pGsZvkJT6LRDDycRobyv?=
 =?us-ascii?Q?78G+zCTrefB6NmHbsqtRN/EqNWoAnTJRyG95uAqYDyUGmkkiw/D+V/q3KGj7?=
 =?us-ascii?Q?JYM4jj3Z1hpaMB6qydge3H+vRNc/OEs6aWZNhGoe8ZoMnDljY5PhHoX2W35g?=
 =?us-ascii?Q?hqCdCviQt6pwFH+e6RRAqeFJllCGWiQCHNsVNL4w3xMDiwt+0sYF0XYdC1Yx?=
 =?us-ascii?Q?1CvXLwh9iME5KAgIGcxCaChcOWD9dcOdJ/m+5WtT7vrc2YlX1CVETrX3fI3F?=
 =?us-ascii?Q?oPnvbnI2TyrxzI8dEZArjDiicDpkRzhlmZqu+vYneenxGvPYS94hR2nC5SRk?=
 =?us-ascii?Q?0YtO/vxnRPdLx/H0GZP1i6GyyorbKEbKvQ8oyvE3DywJg+Thz0l8655fOM0s?=
 =?us-ascii?Q?AdHqJYNIMstMS/NLwXLQeKnx/bRhrGcOU3tBLMPFBeGPCdflLJG4pflwLzrh?=
 =?us-ascii?Q?LwEYT4kPLhyNHNZ0x0egBySRsVVqktTvEbqLVfZGcYFOXImn3agBDe4da8V6?=
 =?us-ascii?Q?Uxq6b23tTLUNBFBKxha+mgflbcjHf+r2K5cBspU9IZd2DLZq+EbOGaBdhMNQ?=
 =?us-ascii?Q?dNEP+7Tb9NN++uW750mWKFw+Dh5lb19a2F2FbEGv3koR+Is8hXHb1ivLXxco?=
 =?us-ascii?Q?RcnT2oppPQb01QiLUqIqi3AXgzLgsVx0P4RKGWF02osXieIf/rScRUcJbNVz?=
 =?us-ascii?Q?tJh7Wo7w99OrFrRXtvQROtSQ5aqhmAHeSdwMuSluMS3Fs2AP0R/NilfP6hOo?=
 =?us-ascii?Q?4d57O41X2fC1q5/FoHF67Xs464Ph273++6INCv/DQnm/8TpmlN/83R8RPmKS?=
 =?us-ascii?Q?eLJBCN0YtR7IsidwErNS6Q4zh++tPMkKrzfo11gNgUKRPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pDNS49OwCAriBud8pU564jC2nUealwch7ZDUgBSkCoNAZpjiGid5SeGEUrWC?=
 =?us-ascii?Q?Q63dcd2NbWopO4CJLKgxdvOUrhJRRYT5RwZRDJw5+f4O6Mf9XlbBtykOuVQT?=
 =?us-ascii?Q?LbF2hLJf9HzBUSqAeZdtm2/kOOd4kayJGUvXwHuy5cALsn9jtuOwMqkPxpOI?=
 =?us-ascii?Q?GX/5Kl/k0RTENp78QaRAgNvjvrVQFDIn4co7n0LPWgq4atUULhLqRfJvKZui?=
 =?us-ascii?Q?cyJUowgzOOlNwodefogZDO9ccpsdxUpoCubqYZ14mHNQE+m0lRWT/TkHeIpU?=
 =?us-ascii?Q?9HjYg+cDcQgW8rO+M6bf74KxsTfcVlnGonTdcIkWz6Lk8WmyQBa8ubp+w77+?=
 =?us-ascii?Q?oAeyQdDsnsLu2aRXiFd4mF5tX4R3/mU3k2ENsqDR2Oc9rZ2XqLcHVpVDVObf?=
 =?us-ascii?Q?zYVLOMVF+vp8OLPA/po+oqcV1JJeRaxH3mSpiavOs/z1AUC0KBYmH4sLknhV?=
 =?us-ascii?Q?7VAaPKPgNT1uJ7tPcEXLT4PfQAnQ6lV8nSGKyMxgUoHb8Aw7vwZ0R5ZjeLIO?=
 =?us-ascii?Q?kFUMMrNJ3zMDRdtONXXYhevTFsdrG7hd9pTM016/nhkzfkr5LZB7pOopwn/V?=
 =?us-ascii?Q?96M8ITF5z0RASiClt5FRewMj5SvTu9KZ9QI5atVczyRcX9SbD393a+j1TI+U?=
 =?us-ascii?Q?8OGBE4F9+o3q0mNDyAE9t3Kv33pExNLj6xkJ2YVuhBly4DqNaFp8Ghi//pWC?=
 =?us-ascii?Q?EwOJ0rDC7ZxYas1uuBDJH5y5VZvc7A/+i+2ZsQGps11pqKwu8mQ/q4S4I+EF?=
 =?us-ascii?Q?KbWzYQKkCHYq42yeVtjj0f1ZcIzEf0xWe2Ve43ND7s8l7pKjSZ2tahZgiBBu?=
 =?us-ascii?Q?wmeiLI16SUN97rMpEWX30Rvg5j8B2mA9oIHGOPM+nkX8jT/qJmesq5+AVQ9Z?=
 =?us-ascii?Q?+waoyaFe99epm8fhoWa6liRieN/uXQqp0d3ZXii068jlWcfWy0cwLsTyKUZ9?=
 =?us-ascii?Q?BUDg4y5D9kbyPkMQ74XrLcTpJjWZYDDn3cYi0fcE8IrccA/0t9SE6JmafAbj?=
 =?us-ascii?Q?o5qy/UWgVWDBfA8kyQOlZCSlo7fz4cXKMFCQyxDJF++rP701XekXHxM55LDA?=
 =?us-ascii?Q?SN+hzydzuJEWyfe0wAlw/5C+GbfK5PT7LLXtUoK43pu/clrIjhDOAPMz5D8P?=
 =?us-ascii?Q?f/Uf8vvVaLcmhhi5tmg0nBXxyRyoXAVKlObds+TCU19OqH1ucZcyjt4OVskQ?=
 =?us-ascii?Q?qKeuc9ut0zYvfF9RSowEmhLTJZ0kNOjRJ+KgvMa7Eo7X9Thnrfvi5kW04ygz?=
 =?us-ascii?Q?XigCK/5fRVexbfAw57Rj9xb+/C0YI647s/ThNtB6a0iEy0heO0ZOgx7dKFFF?=
 =?us-ascii?Q?EKAzg1vaFICyjlYUDjEJplf5aao+8e9oWf7UQbUFY2LxulgNRgqq88DvI+W9?=
 =?us-ascii?Q?3a6nCI01QmDxYlZAN/KM6G4c8Wcbl0wY1oHa0wiG7AgF6k2bZag7hLdw1jWM?=
 =?us-ascii?Q?Ze533zEeMBWbpM8BKDOBesVBMrlvD+0esFi4fTs/MsRrDqjuhwuPNGrzdwaJ?=
 =?us-ascii?Q?1QpzmTfudtPKPONTfTdMbtvMXkIsAi41cH9x17YUrDbenvGI2uVdjLKa5Rrm?=
 =?us-ascii?Q?roNOBfJHdJHCRSzr4mHTskh3H/R7W++jK74HYHvZjugV/+E1e0QdjC4bj4bD?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JFaEEHq6UtIlR2pibO/gvE0NosqG/+U1Way2Lmz/Ow1XdiisxNBI8Xi7FWxGhB1dZuCobwCWpvfcwJukXv/Vv4qGd/gLecWHNXRiHtv6bkn515kY7gYLwjfc2dPR/qSgrzaIdikUeAbuoWvirHum5gx1O6Bq9pIhnVCdpHEIOmrm1WZafDLPauKcy6xRNaUmmWWPpAKFpIk3e2giDSPvJ0C8aNR3+ZPWTDpXiIdBL5bo9woLlMQypV3nE9czUZr/2Fl4I1hARxSD2mhNDoe6CKsExBL3VrnCKkMgt5T91KLMhOUDlkSW+G/15n9Rv5kRdstNM0q0DJh39sPnHCSIQYRzwia6+nmajpnfGaM1vEwYZHn7SsN7OFo5YcxKWVuOmj7MzgKVhglgPqfqcG21vW5iwujbm+cbz8U8OS7anN3G9zpRVIDUYRhPWgztNt3QGM4DNERhfS7mjDSnDDaSYD8NwNWmUL3Fm3IA6uPCHpL3Suc5JQWY4qp5Xmz4E4OAp7zyHMoqosEEpDI+wVxhRjjiFmD1IxVec5I4I39GbRoWX8j3bvkpCJwMXth3gwcbNR5Byr8flPLqp08Jwt+/yG2IUM91RBGho4C3vds4eVQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f269ae42-ca09-4248-1e23-08dcd8ba9acc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 14:51:55.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jt+tCOvrvz0SwMduY+8c7XkNXFGwQ/UMcoZ/GbKSTy4GrX219FqqXARt3bjQsb/9HzYGaW3NV+RJG8zOI5a5p8x2SoPUFYFRFUDd8gUVGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_10,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409190098
X-Proofpoint-GUID: ElVXmBym1qql9K2KqP2NNQBO2lR0bS4n
X-Proofpoint-ORIG-GUID: ElVXmBym1qql9K2KqP2NNQBO2lR0bS4n

Just a head's up that I am taking a look at this right now from the perspective
of whether it is safe to perform a BPF map update on a map that might be in use
at the same time. So, the updating of the strtab map is a likely dangerous
situation.

More once I figure out a few things.

On Sun, Sep 08, 2024 at 12:40:15PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> As USDT processes come and go, the overlying probes for an underlying
> probe will change.  Hence, we will move to a scheme in which an
> underlying probe will walk all possible clauses it could call,
> deciding at run time (using a bit mask for the overlying USDT probe)
> which of the clauses to call.
> 
> In this patch, we create and update the BPF "usdt_prids" map.  This
> is a hash map, where:
> 
>   *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
>         - the PID of the firing process
>         - the PRID of the underlying probe
> 
>   *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
>         - the PRID over the overlying USDT probe
>         - a bit mask indicating which clauses should be called
> 
> As processes start up, we also add new overlying USDT probes,
> requiring updates of the BPF "probes" and "strtab" maps and of
> the list of enablings.
> 
> The underlying-probes "update" function is called sporadically.
> The focus of this patch is the function.  When it is called can
> be tuned in future patches.
> 
> This patch guesses certain sizes very crudely.  These sizes should
> be handled more robustly in future patches:
> 
>   *)  The allocated size of the string table.  For example,
>       new provider names have to be added as new processes
>       start.
> 
>   *)  The number of entries in the BPF "usdt_prids" map.
>       There is a little relief here in that, as processes
>       terminate, they can be removed from the map.
> 
>   *)  The size of the bit mask -- that is, the greatest
>       number of clauses an underlying probe might call.
>       This is relatively easy to extend;  nevertheless,
>       that work is left for a future patch.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c         |  42 +++++-
>  libdtrace/dt_cc.c          |   2 +-
>  libdtrace/dt_dlibs.c       |   1 +
>  libdtrace/dt_impl.h        |   6 +
>  libdtrace/dt_prov_uprobe.c | 266 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_work.c        |   2 +
>  6 files changed, 317 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 3f9c42ea..70803e3c 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -841,7 +841,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>  	int		fd, rc, err;
>  
>  	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
> -	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
> +	dtp->dt_strmax = dtp->dt_strlen + 1000;            // FIXME pad some arbitrary amount to account for new USDT probes as new processes start
> +	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strmax, 8);
>  	dtp->dt_rosize = dt_rodata_size(dtp->dt_rodata);
>  	dtp->dt_zerooffset = P2ROUNDUP(dtp->dt_rooffset + dtp->dt_rosize, 8);
>  	dtp->dt_zerosize = 0;
> @@ -899,6 +900,7 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>  	if (rc == -1)
>  		return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n",
>  				    strerror(err));
> +	dtp->dt_strtabmap_fd = fd;
>  
>  	return 0;
>  }
> @@ -936,6 +938,43 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  				dtp, "cannot update BPF map 'probes': %s\n",
>  				strerror(errno));
>  	}
> +	dtp->dt_probesmap_fd = fd;
> +
> +	return 0;
> +}
> +
> +/*
> + * Create the 'usdt_prids' BPF map.
> + *
> + * USDT-PRID information map.  This is a global hash map for use
> + * with USDT probes.  It is indexed by (pid, underlying probe ID).
> + * The value is a probe ID for the overlying USDT probe and a bit
> + * mask indicating which clauses to execute for this pid.
> + *
> + * WIP.  Just make up some sizes for now.
> + *
> + *     How big is a probe ID?  Sometimes, it's a dtrace_id_t.
> + *     And uts/common/sys/dtrace_types.h gives us "typedef uint32_t dtrace_id_t".
> + *     Meanwhile, libdtrace/dt_impl.h has "uint32_t dt_probe_id".
> + *     So either uint32_t or dtrace_id_t is fine.
> + *
> + *     How big should our bit mask be?  Start with 8*sizeof(long long) bits.
> + *
> + *     How many entries should we allow?  Start with 1000.
> + *
> + * Note that for a given (pid, PRID) key, there can be at most one
> + * overlying USDT probe.
> + */
> +static int
> +gmap_create_usdt_prids(dtrace_hdl_t *dtp)
> +{
> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> +			 dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz, 1000);
> +	if (dtp->dt_usdt_pridsmap_fd == -1)
> +		return -1;
> +
> +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
> +	dt_uprobe.update(dtp, NULL);
>  
>  	return 0;
>  }
> @@ -1045,6 +1084,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  	CREATE_MAP(scratchmem)
>  	CREATE_MAP(strtab)
>  	CREATE_MAP(probes)
> +	CREATE_MAP(usdt_prids)
>  	CREATE_MAP(gvars)
>  	CREATE_MAP(lvars)
>  	CREATE_MAP(dvars)
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index b28388e9..e7f22206 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1046,7 +1046,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  				nrp->dofr_data = 0;	/* FIXME */
>  				continue;
>  			case DT_CONST_STBSZ:
> -				nrp->dofr_data = dtp->dt_strlen;
> +				nrp->dofr_data = dtp->dt_strmax;
>  				continue;
>  			case DT_CONST_STRSZ:
>  				nrp->dofr_data =
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index ba4d4abe..924cf11e 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -66,6 +66,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(mem, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(probes, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(scratchmem, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(specs, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index c0399a06..6704cfc7 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -287,6 +287,7 @@ struct dtrace_hdl {
>  	dt_strtab_t *dt_ccstab;	/* global string table (during compilation) */
>  	dt_rodata_t *dt_rodata;	/* global read-only data */
>  	uint_t dt_strlen;	/* global string table (runtime) size */
> +	uint_t dt_strmax;	/* global string table (runtime) size, allocated */
>  	uint_t dt_rooffset;	/* read-only data offset */
>  	uint_t dt_rosize;	/* read-only data size */
>  	uint_t dt_zerooffset;	/* zero region, offset */
> @@ -394,6 +395,11 @@ struct dtrace_hdl {
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> +	int dt_strtabmap_fd;	/* file descriptor for the 'strtab' BPF map */
> +	int dt_probesmap_fd;	/* file descriptor for the 'probes' BPF map */
> +	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> +	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
> +	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>  	void *dt_errarg;	/* error handler argument */
>  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index cbde6a48..d53a1c8d 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -37,8 +37,10 @@
>  #include "dt_list.h"
>  #include "dt_provider_tp.h"
>  #include "dt_probe.h"
> +#include "dt_program.h"
>  #include "dt_pid.h"
>  #include "dt_string.h"
> +#include "port.h"
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> @@ -63,6 +65,15 @@ typedef struct list_probe {
>  	dt_probe_t	*probe;
>  } list_probe_t;
>  
> +typedef struct usdt_prids_map_key {
> +	pid_t		pid;
> +	dtrace_id_t	uprid;
> +} usdt_prids_map_key_t;
> +typedef struct usdt_prids_map_val {
> +	dtrace_id_t	prid;
> +	long long	mask;
> +} usdt_prids_map_val_t;
> +
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
>  
>  static int populate(dtrace_hdl_t *dtp)
>  {
> +	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
> +	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
> +
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
> @@ -123,6 +137,257 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>  	free_probe_list(dtp, datap);
>  }
>  
> +/*
> + * Clean up the BPF "usdt_prids" map.
> + */
> +static int
> +purge_BPFmap(dtrace_hdl_t *dtp)
> +{
> +	int			fd = dtp->dt_usdt_pridsmap_fd;
> +	usdt_prids_map_key_t	key, nxt;
> +	usdt_prids_map_val_t	val;
> +
> +	/* Initialize key to a pid/uprid that cannot be found. */
> +	key.pid = 0;
> +	key.uprid = 0;
> +
> +	/* Loop over all entries. */
> +	while (dt_bpf_map_next_key(fd, &key, &nxt) == 0) {
> +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> +
> +		if (dt_bpf_map_lookup(fd, &key, &val) == -1)
> +			return dt_set_errno(dtp, EDT_BPF);
> +
> +		/* Check if the process is still running. */
> +		if (!Pexists(key.pid)) {
> +			dt_bpf_map_delete(fd, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
> +			continue;
> +		}
> +
> +		/*
> +		 * FIXME.  There might be another case, where the process
> +		 * is still running, but some of its USDT probes are gone?
> +		 * So maybe we have to check for the existence of one of
> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> +		 *     char *prv = ...pdp->prv minus the numerial part;
> +		 *
> +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Grow the string table map.  It includes the string table (which might
> + * grow due to new USDT probes).  It also includes the read-only data and
> + * the block of zeros, but these remain fixed.
> + *
> + * FIXME Is there a danger of the BPF map update colliding with map reads?
> + */
> +static int
> +grow_strtab(dtrace_hdl_t *dtp)
> +{
> +	size_t		sz = dtp->dt_zerooffset + dtp->dt_zerosize;
> +	char		*strtab;
> +	uint8_t		*buf, *end;
> +	size_t		strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
> +	uint32_t	key = 0;
> +	int		rc, err;
> +
> +	strtab = dt_zalloc(dtp, sz);
> +#if 0
> +	// FIXME do something
> +	if (strtab == NULL)
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +#endif
> +
> +	/* Copy the string table data. */
> +	dt_strtab_write(dtp->dt_ccstab, (dt_strtab_write_f *)dt_strtab_copystr, strtab);
> +
> +	/* Loop over the string table and truncate strings that are too long. */
> +	buf = (uint8_t *)strtab;
> +	end = buf + dtp->dt_strlen;
> +	while (buf < end) {
> +		uint_t	len = strlen((char *)buf);
> +
> +		if (len > strsize)
> +			buf[strsize] = '\0';
> +
> +		buf += len + 1;
> +	}
> +
> +	/* Copy the read-only data. */
> +	dt_rodata_write(dtp->dt_rodata, (dt_rodata_copy_f *)dt_rodata_copy, strtab + dtp->dt_rooffset);
> +
> +	rc = dt_bpf_map_update(dtp->dt_strtabmap_fd, &key, strtab);
> +	err = errno;
> +	dt_free(dtp, strtab);
> +
> +	// FIXME do something
> +	if (rc == -1) {
> +		strerror(err);
> +		return -1;
> +		// return dt_bpf_error(dtp, "cannot update BPF map 'strtab': %s\n", strerror(err));
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Update the uprobe provider.
> + */
> +static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
> +{
> +	dt_probe_t	*prp;
> +	dt_probe_t	*prp_next;
> +	int		i, prid = dtp->dt_probe_id;
> +	uint_t		old_strlen = dtp->dt_strlen;
> +	dt_pcb_t	pcb;
> +
> +	/* Clear stale pids. */
> +	purge_BPFmap(dtp);
> +
> +	/* Update dt_probes[] and dt_enablings. */
> +	/*
> +	 * pcb is only used inside of dt_pid_error() to get:
> +	 *     pcb->pcb_region
> +	 *     pcb->pcb_filetag
> +	 *     pcb->pcb_fileptr
> +	 * While pcb cannot be NULL, these other things apparently can be.
> +	 */
> +	memset(&pcb, 0, sizeof(dt_pcb_t));
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++)
> +		dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
> +
> +	while (prid < dtp->dt_probe_id) {
> +		dt_bpf_probe_t pinfo;
> +		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
> +		int fd = dtp->dt_probesmap_fd;
> +
> +		dt_probe_enable(dtp, dtp->dt_probes[prid]);
> +
> +		pinfo.prv = dt_strtab_index(dtp->dt_ccstab, pdp->prv);
> +		pinfo.mod = dt_strtab_index(dtp->dt_ccstab, pdp->mod);
> +		pinfo.fun = dt_strtab_index(dtp->dt_ccstab, pdp->fun);
> +		pinfo.prb = dt_strtab_index(dtp->dt_ccstab, pdp->prb);
> +
> +		if (dt_bpf_map_update(fd, &pdp->id, &pinfo) == -1)
> +			assert(0);   // FIXME do something here
> +
> +		prid++;
> +	}
> +
> +	/* Grow the strtab if it has gotten bigger. */
> +	dtp->dt_strlen = dt_strtab_size(dtp->dt_ccstab);
> +
> +	if (dtp->dt_strlen > dtp->dt_strmax)
> +		assert(0);               // FIXME handle this more gracefully
> +	if (dtp->dt_strlen > old_strlen)
> +		grow_strtab(dtp);
> +
> +	/* Review enablings. */
> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
> +		pid_t		pid;
> +		list_probe_t	*pup;
> +
> +		prp_next = dt_list_next(prp);
> +
> +		/* Make sure it is an overlying USDT probe. */
> +		if (prp->prov->impl != &dt_usdt)
> +			continue;
> +
> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> +		/*
> +		 * Nick writes:
> +		 * This is a general problem with running compiler-adjacent things outside
> +		 * compile time. I think we should adjust dt_pid_error() so that it works
> +		 * with NULL pcb and dpr at once, probably by using the code path for
> +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> +		 * already handle this case.)
> +		 */
> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> +
> +		if (!Pexists(pid)) {
> +			/* Remove from enablings. */
> +			dt_list_delete(&dtp->dt_enablings, prp);
> +
> +			/* Make it evident from the probe that it is not in enablings. */
> +			((dt_list_t *)prp)->dl_prev = NULL;
> +			((dt_list_t *)prp)->dl_next = NULL;
> +
> +			/* Free up its list of underlying probes. */
> +			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
> +				dt_list_delete(prp->prv_data, pup);
> +				dt_free(dtp, pup);
> +			}
> +			dt_free(dtp, prp->prv_data);
> +			prp->prv_data = NULL;
> +
> +			/* Free up BPF "probes" map entry. */
> +			dt_bpf_map_delete(dtp->dt_probesmap_fd, &prp->desc->id);
> +
> +			continue;
> +		}
> +
> +		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +			dt_probe_t		*uprp = pup->probe;
> +			long long		mask = 0, bit = 1;
> +			usdt_prids_map_key_t	key;
> +			usdt_prids_map_val_t	val, oval;
> +			dt_uprobe_t		*upp = uprp->prv_data;
> +
> +			/*
> +			 * For is-enabled probes, the bit mask does not matter.
> +			 * It is possible that we have this underlying probe due to
> +			 * an overlying pid-offset probe and that we will not know
> +			 * until later, when some new pid is created, that we also
> +			 * have an overlying USDT is-enabled probe, but missing this
> +			 * optimization opportunity is okay.
> +			 */
> +			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> +				int n;
> +
> +				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +					if (dt_gmatch(prp->desc->prv, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prv) &&
> +					    dt_gmatch(prp->desc->mod, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.mod) &&
> +					    dt_gmatch(prp->desc->fun, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.fun) &&
> +					    dt_gmatch(prp->desc->prb, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prb))
> +						mask |= bit;
> +
> +					bit <<= 1;
> +				}
> +			}
> +
> +			key.pid = pid;
> +			key.uprid = uprp->desc->id;
> +
> +			val.prid = prp->desc->id;
> +			val.mask = mask;
> +
> +			/* linux/bpf.h says error is -1, but it could be -2 */
> +			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
> +				/*
> +				 * Set the map entry.
> +				 */
> +				// FIXME Check return value, but how should errors be handled?
> +				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> +			} else if (val.prid != oval.prid || val.mask != oval.mask) {
> +				/*
> +				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
> +				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
> +				 */
> +			} else {
> +				/*
> +				 * Nothing to do, it already is in the map.
> +				 */
> +			}
> +		}
> +	}
> +}
>  
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
> @@ -782,6 +1047,7 @@ dt_provimpl_t	dt_uprobe = {
>  	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
> +	.update		= &update_uprobe,
>  };
>  
>  /*
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 599e2ae3..79da46fa 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -373,6 +373,8 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>  	dtrace_workstatus_t	rval;
>  	int			gen;
>  
> +dt_uprobe.update(dtp, NULL);
> +
>  	switch (dtrace_status(dtp)) {
>  	case DTRACE_STATUS_EXITED:
>  	case DTRACE_STATUS_STOPPED:
> -- 
> 2.43.5
> 
