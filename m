Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847838DEE
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722022742; cv=fail; b=Ksw6h3qlLcneCqeTgH+KK2WGq9fj4COeEjPgpvsWi01j0eTG6mGM5n+isau42WaeZXw78CrlbBluEFTfhqvOKw9GWlH00/95zwmiH/hj/MvrJ/WHdJWO1cRLUs8eFBfqvFQStjhOFJP9PRizA0zRHkar1WJPpQdk4GCSlLdN6tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722022742; c=relaxed/simple;
	bh=Tlcn8mUd7XtqKaBZol7oapfwGBKQciHn/SRTM0a8DEg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Ilk+nkSNG4m0kWXe73YaL0F4XFigvsxPEFnLPQaT4T730LOi7Yxjcz1P6+vxT3up2lC8fgvg9xNe7Ruj5ZUFjn+qbAlsbbRw/DeK6XF93EqC6cIUGmKsABI5vJP2/88ma4fabyVltbYbCvurbfelaRfvYZT9a0buRBWzP0QBMGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fD5LWnd9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aqpML4wv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fD5LWnd9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aqpML4wv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QIAEQp022678
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=ycw9ncrGdB2KW0i6D6yi5pFNP9w7e1ygBS+cm4g8v7M=; b=
	fD5LWnd9vSlX1w5sw/OnZHlT3lm/AXimODCN6h+ObgKIDRsmozI88xdbYEbpbakq
	CZBrktLW72gGWSSBwsyIAVKe/PqGmd09PkKM25SdNBnGVrMsWBh7aQTG4GLfHN9Q
	Wmr4+zfg/k78MgCcW+mItDlUDs8na6UejvyHkCulqvlu0HduZmGMUqsQuC6GcdZI
	puMa4JXl3DgU5mNGKVbzE/PuUpoj/7JUxMPHCpfXiwYPXdUZZnZJL09Am9jK+NCF
	9Md5/++jEEu8tvewDhw9WDn8belWJ/JXYHCTwuZLR1ZP5nKQCHEQX6Xxqp/4k8cy
	SvSvMHfffckX3Hpsz0u07Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hgcrpauu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:38:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QJ7OZt038904
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:35:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h26s2x80-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:35:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bND3PHNsU88YDko0zkE+O/kTczarto9zfvxmCd6SqW2PnsgxgZCrr6gpbvVON46yW7KisloRSj9NzCT1FigY98SF2jU/eiC/WQWYi4Az/wAR8RSuHZNEnt8Rv+OdjpeTE4K3QayzN/jBLZGzYaqjNcWC2VZxc32t/AZdagy6PRxYEe//XrolH4inrzl8oNEn41WvtXf5hYK2E1GM1/HfDogLHUMRkhj0VTEW8ue9jhCV+wj4Lts8PQogfiXlmS4WkxpHtcUz7qiJpU/hRokX1QeEgpT/UiqkuOz+GOQOAnTt49dHAVIh2hVflhUjmWwE+zzGWWRNLSiIJHUXblNSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycw9ncrGdB2KW0i6D6yi5pFNP9w7e1ygBS+cm4g8v7M=;
 b=O3JlR8dCTXCsonna07ySvv5WJ9blqhnphSp8L47Jmt8WsCADpTGt9M9jaPvfhyo9oqBCKGVIh+ZiO1BDr+fQg10FVTM46npXM779HgAsSENIDpstA2kcnXB9+Q8Imj7dBKRaqNtvkYNBLL42n7RWE3Z/ZVyLM0JezX5V4Ni5CeLk+90vZMfW3gksZKYCCFEpm8EDw8qWfQZX4bAQnuAu3bD/B+cKdh9raS45iI2RACwY8E9T+8HrYe6+CsnVcd6ROyRERc83/bMnBcyWMyXvWm+xPupf41EPc2P2IDl2DIMs57gZO+7Cjw0Z3CN4nbCA4JJVCxKn8bR7zBEs886E+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycw9ncrGdB2KW0i6D6yi5pFNP9w7e1ygBS+cm4g8v7M=;
 b=aqpML4wvgGmAoUuYMJWjbpoe+Ug4Xv+MykYTX+t8l1S47SPujepL5sKsY2Da59PSU+8qGXeze8viPQw21Fc1524noVDU6fOflVhLuxJk9J9epTuGO35aCUhMpxADA4Ge8hk1MSXU1Yhl+PIiL7ontq7lqtX0JIuE6b59H5fb7q8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN4PR10MB5639.namprd10.prod.outlook.com (2603:10b6:806:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 19:35:54 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 19:35:54 +0000
Date: Fri, 26 Jul 2024 15:35:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] dlibs: fix access to `major_names data
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287FF4B1172CD80B733E84BC2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN4PR10MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3860fc-3635-4630-6272-08dcadaa2a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dqLTO8SpCqqzhUY582tYg368rSADvfDNvM4u6kmDV/i1jiAGRYE0uscdLHsY?=
 =?us-ascii?Q?tFIIu3wLnxAvtJ59iobYLxeXp3AduF/kFBv6hfA32WMsol3xxJ8GbFEi5ZUQ?=
 =?us-ascii?Q?aXn9gR0WYApvHdXofaALDVEBJ6vAYPzPylrrtgerBJccmyYjwyOVZ/LJRU+N?=
 =?us-ascii?Q?xSGMEx7IOMCD8j3ZZEO7VB65NEqyBSBy5W3DnPyj/RUZ4sUHaogdFuCV9Oex?=
 =?us-ascii?Q?nQKGL3HgLzao20y/koh9ybGIMNVZ5MDMKQF2Qc2iBbzx2cQ5W8zKCHHkXouy?=
 =?us-ascii?Q?kDueem/l6Fi+3TGFIttkASgQYVu3KfhB7HrmZ1PfMPkQshMy1ELVWKGt8Al/?=
 =?us-ascii?Q?/Xll+m1Yc4rurYua3T46N/LSWyNbCIoVFHTWK3XjOQlBqqqbg8tZuK3o6t9r?=
 =?us-ascii?Q?Zsen6WxiWfZUwhe3nfhLzxWgdsE2freci5EcjZZrwy6ijL2j/EbNZKRK2C8T?=
 =?us-ascii?Q?0un9fx65rmISEr7+eO7Z1hwltXtv4fCjZ/VirXeJM7Lx46qe5xFgCbfa8047?=
 =?us-ascii?Q?28UtkQWOEN58VYadRtzf1tCstqs6WVzz/RBn9Lm6rZ+Oy1kmPLX4Xkxbc0SK?=
 =?us-ascii?Q?4iQ+QaPXuNrfvpnm3BolvUYB4U18OxpG21cSnYYEJKu983e1eTyV6jOLpT6T?=
 =?us-ascii?Q?KF4odlEy/7FwN7+w5tvIQaGQIyIr326b3X3i4q4547q6btyJcSj+srdz9jI2?=
 =?us-ascii?Q?f7zGiWQANJa0nFECDdneXsWTvAlnvWweIy1XmFsW9DgPh7slrXaQmwzZAlzC?=
 =?us-ascii?Q?JafueBIJBaoq9Rf8hxHY5Equwm6HVqk1oT0hVggjoPa50+FXWxVrQIEtWjpy?=
 =?us-ascii?Q?/cpnvAZ7GNYs/K3VoqSoxIX/dfHQq8c80qMuT8R7R5doKOishe+CtONfUq2o?=
 =?us-ascii?Q?EX/QuhBPTfbPR3/HqTuK8hCgMMn7kawuL4GagUnCv7QDxw4ufgKg5PRfoaVo?=
 =?us-ascii?Q?ciCiiIXib5dEGxXBrpjtKstdxWzbtUj7tiyfOHmVTKAczOtaaBo6xZhu2Jn3?=
 =?us-ascii?Q?de9rUOwBU7LMdzzHsKvgbpcrAdrKzKcYXqDVdx46DlR/UD4XeyxTiiCKYTS7?=
 =?us-ascii?Q?byrur9fndTF3jz/57wBnQF16muoMcUwxotDE68Zy+gTCInm6NM++auHfKhEt?=
 =?us-ascii?Q?qN70nonY4akVztzYTI2pR2+6IlRFVaOCQHTe/gtncKKQO0eI+3+EhyX4yqb0?=
 =?us-ascii?Q?0rfmya8bQheoaghiUKdlYKhQ6pxPQXCx+8z0Xgg1a39DiztFxdMkHaOvODNq?=
 =?us-ascii?Q?V9zWnjoQQ8D9Zz0acKeZ9vHNtS1FYBMnA+0uKlDFd65aYiRndhZiXZ5O7o2K?=
 =?us-ascii?Q?8v7df3atoPIHmjkFNEMIo1h4cSmFWv8SsPNyah3cZZ+YsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ER9sJfdr+zN28hXbiodSyQwE5rdDxYVpF/b0MSZc+HNEygDa1oI/Y6FGWlf7?=
 =?us-ascii?Q?V8WNXXYGR8QBCuD30OqDfHru8TiNS904kXJ9wAwMWaD7S9yP9IKYONskbEFo?=
 =?us-ascii?Q?4lI5iozAVaPyV8IxQzFl5KUzbDNiFzjHAKEzLO+8CWuCozJy7h4DDGAhWpE0?=
 =?us-ascii?Q?TF0yo+W5unZOPneCLWU6VURF3Gf0gqFEl73ILutLyzu5qafVcp7uRIvU8HOG?=
 =?us-ascii?Q?17C9Igv7I1Agu/yOgEtL/W5P9BqHT5s/qDipKsKzo01jG8HimZ+eDl3e5SSl?=
 =?us-ascii?Q?i9i8YtRKuEbxPXt8OhoHQ5osHh5HMXO/4CdR/Ah3WaPEEIaHnPwYm71DiORd?=
 =?us-ascii?Q?UpZbF1QISNfnXo7xdSKgRZ/SrJ+0pQbJ5PaL4I0c9ZkNGovE6kBn8a/Q0H7E?=
 =?us-ascii?Q?0UCI07DX4zTN4kM5ekDjpjHQloBbzfFh/CyFy5sb9dBsT6FnmlZrqEt+ukgh?=
 =?us-ascii?Q?3dQrWwp4fo7TeogE1e8sHX1VOk65pALPXCH93vJ1pQX6hLdTFNScxpm5G7ag?=
 =?us-ascii?Q?9G6+6Q9fVYiFGze1UeRj+TH5T/KB6M/E1/ddiwgNi6CcXWk1c6LkQ4PANIZT?=
 =?us-ascii?Q?dEVVGdQ2WxzyPXSSAuC4UDFjA3atacd3W9gyJTcHc3TaGPcZ6QK/CgIb25aU?=
 =?us-ascii?Q?r6w5/FyzF2+xZGmWX+IqIo2WEJk7eEqLmeJL0dLp9S8C5zCAAHV0LUDkwAkH?=
 =?us-ascii?Q?8KVpnA/k3RAW0aopvghU0GXVbnjl+BXEJE9aEOseDKWSvuEGaYefqA4Y1xvL?=
 =?us-ascii?Q?qNVnpSs0NhihbC71HD/+Y8EBtWNY5Ql2vlzq2mZUEc37Qh403F/Yq2bWWI6c?=
 =?us-ascii?Q?dOOGI05hldFwDvz9P9R7WyCYkR+oMKKtdcWjJW0qBZE7ppg1lCLcdu62JoZN?=
 =?us-ascii?Q?fRbYArjCVKQWm+nT7P07oAvGKZWHzMmtWLdzCOvco9xmLnILHJ6Zq4FmSU3M?=
 =?us-ascii?Q?j4frRZ6HhZYEiQl/HDMMKsOrPhHrRvA9r1frmbyS3WvLojfGgyNcuYFnw4Rg?=
 =?us-ascii?Q?HqAC2xTCN+F+1R75myuFN5F/1iz43A5Tz2+0DB34PCYUI9CuF9/RmNrKvmNd?=
 =?us-ascii?Q?zC7zaRSrbsQGfw/fVgAHRNXcFisjjtGzfHrzkB37aEdrmKkjTYhqNWy9DvzP?=
 =?us-ascii?Q?dxRLm2lEMkwYO5P9aXwlOAiRK6cUCFN34R9Iw37yqEQeIJb+UVaTPow57gxX?=
 =?us-ascii?Q?qej43rykV7OAt2ejL4KdLJsJCjn+1E6u8j3u7C5yOpG9WB45dA0Q7FO81jGI?=
 =?us-ascii?Q?JPrY1fCY1hxbkMJKx6liVSmOHCDun6MFGu2FqogHtzQoMvnsAZq63oxKWmLs?=
 =?us-ascii?Q?3DlsSDPH+gF3yTh6f+7jURBfHSSeSiHTXLJg9Rn8uqqDImd9RxTmabFCT0tW?=
 =?us-ascii?Q?p051dMRaOG2jDKMQkOcTu+2qG9g6NS2yNUzKX3QJuxPJpIFH+nQ0vD+JEgky?=
 =?us-ascii?Q?oPoM7ps9bzEiJH18f1omL3xknvWn+aS8jXqhK1gWU3ZzPs2IODAapTgMvWKP?=
 =?us-ascii?Q?YnVuepCXyrYaRl5NjNVVWlxvqaoZkdLKM1WKnrWsg2jWUZpYHbayQFpYRY28?=
 =?us-ascii?Q?cOT3d2ezALUDgj7lqznqsAS4ovidnL0Q0vrfn1o+DL1qPFN8zQauTVSwEYaa?=
 =?us-ascii?Q?OzGG/SLjGZ/J5vtAkYCjeNU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Uqxf4KSJFRTo2AHP1SCePWFSZl+3BzZBfIuyfh85smIXUSTSdcpCl8z4o901LHYjLM+NJj43U/LTq4qluHIuZN+GdDS9m3jInfuBjY37Fe+mUpEvLcjvBN19GkR9MGb7p2g6sNvczOLWSJdpDKaSsLucUrrhKcrbmNQBdWhqNKRWfm74mm4oIEW2DxRnrUmYJpUnFR0JrDwXbeR20y8PEuuRR/pEFT8QCiXvUi6UEjHMIHNeQukx097ca4Oeguap8jeTiVGNYjq05sAsDS8bxVrS19zhAhtCFchbObJx3kjTPEOY7TIWKlycIjegSq414Pyup2yi1YQ5p95dGp3sjRVKFqrnIzXxpfAROOT7QaxZ6NdKDyzWupjg8TNK/LPPdXAkWIy+3HrMCxPI3qTm4ToWw2UW087hlug4N7XNnKKa6YiHyjaCBeY8sxq6C3iyL3Pw28vMDivva23y2WcAAN/fn4Fz44ByxKRFFTddlrRuq01vSE3IvIiWEXetCZKSwXxdWjCSx+ac7W3i/jFWGpxEOBSLvkrxlDxzUG1gyg8nPX8VO7WeXAqmL8EEHCENd0r2i5iGQSJ51lIJuq+WlLE0PBrxqiDgOQp2hmUIfhc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3860fc-3635-4630-6272-08dcadaa2a12
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 19:35:54.3603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmaxEkeKpNH/wTiC3A5ke5r3xcH556JgrVyTKiVQ3pPtaflcOivcQiHHuItcD0eCUjqG08+E4pr7Djia675+qYKRu2LP/CUnVoKKYPcbksc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407260133
X-Proofpoint-GUID: mf6EBbJ6nZqcio8bpZYWorjOtUnmCyFr
X-Proofpoint-ORIG-GUID: mf6EBbJ6nZqcio8bpZYWorjOtUnmCyFr

On systems that lack CTF data, all kernel variable have a default type of
uintptr_t.  That means that an explicit &-operator needs to be applied
is the kernel variable is e.g. the address of an array because it will not
be recognized as a ref-type.

Fix this for `major_names access in the io translators.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dlibs/aarch64/5.11/io.d | 2 +-
 dlibs/aarch64/5.12/io.d | 2 +-
 dlibs/aarch64/5.14/io.d | 2 +-
 dlibs/aarch64/5.16/io.d | 2 +-
 dlibs/aarch64/5.2/io.d  | 2 +-
 dlibs/aarch64/5.6/io.d  | 2 +-
 dlibs/aarch64/6.1/io.d  | 2 +-
 dlibs/aarch64/6.10/io.d | 2 +-
 dlibs/x86_64/5.11/io.d  | 2 +-
 dlibs/x86_64/5.12/io.d  | 2 +-
 dlibs/x86_64/5.14/io.d  | 2 +-
 dlibs/x86_64/5.16/io.d  | 2 +-
 dlibs/x86_64/5.2/io.d   | 2 +-
 dlibs/x86_64/5.6/io.d   | 2 +-
 dlibs/x86_64/6.1/io.d   | 2 +-
 dlibs/x86_64/6.10/io.d  | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/dlibs/aarch64/5.11/io.d b/dlibs/aarch64/5.11/io.d
index b1958418..c153d5a2 100644
--- a/dlibs/aarch64/5.11/io.d
+++ b/dlibs/aarch64/5.11/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.12/io.d b/dlibs/aarch64/5.12/io.d
index 8c2830cd..09968d5a 100644
--- a/dlibs/aarch64/5.12/io.d
+++ b/dlibs/aarch64/5.12/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.14/io.d b/dlibs/aarch64/5.14/io.d
index 8c2830cd..09968d5a 100644
--- a/dlibs/aarch64/5.14/io.d
+++ b/dlibs/aarch64/5.14/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.16/io.d b/dlibs/aarch64/5.16/io.d
index 8c2830cd..09968d5a 100644
--- a/dlibs/aarch64/5.16/io.d
+++ b/dlibs/aarch64/5.16/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.2/io.d b/dlibs/aarch64/5.2/io.d
index 972917fb..5111df28 100644
--- a/dlibs/aarch64/5.2/io.d
+++ b/dlibs/aarch64/5.2/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/aarch64/5.6/io.d b/dlibs/aarch64/5.6/io.d
index 972917fb..5111df28 100644
--- a/dlibs/aarch64/5.6/io.d
+++ b/dlibs/aarch64/5.6/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/aarch64/6.1/io.d b/dlibs/aarch64/6.1/io.d
index 8c2830cd..09968d5a 100644
--- a/dlibs/aarch64/6.1/io.d
+++ b/dlibs/aarch64/6.1/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/aarch64/6.10/io.d b/dlibs/aarch64/6.10/io.d
index ffccf5b3..d6cb0c83 100644
--- a/dlibs/aarch64/6.10/io.d
+++ b/dlibs/aarch64/6.10/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.11/io.d b/dlibs/x86_64/5.11/io.d
index a9f718dd..ae4b62c3 100644
--- a/dlibs/x86_64/5.11/io.d
+++ b/dlibs/x86_64/5.11/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.12/io.d b/dlibs/x86_64/5.12/io.d
index 3101a4ec..0432b02c 100644
--- a/dlibs/x86_64/5.12/io.d
+++ b/dlibs/x86_64/5.12/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.14/io.d b/dlibs/x86_64/5.14/io.d
index 3101a4ec..0432b02c 100644
--- a/dlibs/x86_64/5.14/io.d
+++ b/dlibs/x86_64/5.14/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.16/io.d b/dlibs/x86_64/5.16/io.d
index 3101a4ec..0432b02c 100644
--- a/dlibs/x86_64/5.16/io.d
+++ b/dlibs/x86_64/5.16/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.2/io.d b/dlibs/x86_64/5.2/io.d
index 20b6c3a9..415bbb4c 100644
--- a/dlibs/x86_64/5.2/io.d
+++ b/dlibs/x86_64/5.2/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/x86_64/5.6/io.d b/dlibs/x86_64/5.6/io.d
index 20b6c3a9..415bbb4c 100644
--- a/dlibs/x86_64/5.6/io.d
+++ b/dlibs/x86_64/5.6/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_disk == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
 				   ]->name);
 	dev_statname = B->bi_disk == NULL ? "nfs" :
diff --git a/dlibs/x86_64/6.1/io.d b/dlibs/x86_64/6.1/io.d
index 3101a4ec..0432b02c 100644
--- a/dlibs/x86_64/6.1/io.d
+++ b/dlibs/x86_64/6.1/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
diff --git a/dlibs/x86_64/6.10/io.d b/dlibs/x86_64/6.10/io.d
index de693c18..d67181b4 100644
--- a/dlibs/x86_64/6.10/io.d
+++ b/dlibs/x86_64/6.10/io.d
@@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
 	dev_instance = 0;
 	dev_name = B->bi_bdev == NULL
 			? "nfs"
-			: stringof(((struct blk_major_name **)`major_names)[
+			: stringof(((struct blk_major_name **)&`major_names)[
 					getmajor(B->bi_bdev->bd_dev) % 255
 				   ]->name);
 	dev_statname = B->bi_bdev == NULL ? "nfs" :
-- 
2.45.2

