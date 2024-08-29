Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799D145FE5
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908999; cv=fail; b=OvGjJvdqCXZURficmKIPiNr/cCe0WNzC266F/TGmJxN2fjR71CUe9pDwlQZy+4cfKu6G46370JedliOtC2uWarOeZ6a3LZbP3bzwU51t4fvU6A/Y2FxNqSu6TPSmiEjHktKuqjCAtspYav2xc/vcESxgNFCMjJ53tonqGR22guc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908999; c=relaxed/simple;
	bh=7/8KmB36vyVyMGoT+n03jAP4du7NwYsKA3nxK/1LK6E=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AuTkKhirjBPtra4NZeiNrxmmqUOQmyxsnmvxwYWUnK74pdQHlHxsW6C60PLetOBj7q19Fr6VNwjEfieVpuZpsBJGc/GZz4vUHdFOjS7QD0NzFYzzh0v9tZ2sUzD2TsI5r04T+/+c7AT9AuXAOvz+laUTwwbC3fmn+CcFgAm7E4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UZO4iuiU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fd75sY/C; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UZO4iuiU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fd75sY/C"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fn1D012388
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=2unN2842bFeeYv
	pRfbBJdUG4sHPuEh/Rp4M+chbe3bM=; b=UZO4iuiUqdco8wgzzNHtzYp8Mtlcor
	aisrGGGUS14DggIKXJG8eG9J0xFJO5PsPcoMbaGiQCJV+yvM+HuzbMaGYe2yBFsI
	d9KYA4qdbG2AInzO6YG4B8vS0pfxELlU1tiSdX2Wup2heKdqAdUXvRa8iKEtUwwo
	15YKNOd0Fw3fQGpePy1quzTdkkUqzlDnEkBgWaQ2WAGTg+RRhsqYkqbCslKCF+rn
	j29NadhblnkzvUizH1/05vhIHfFRoiHVstiCCkhAtOP3YkcSnkL5LmzBeBUl0N0v
	vMZtkzyBy0jA6l3Lb9SRqpKTET4GvHtoO62EinBTwe4eNKNVEzYKLi1g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukk70k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T42U4m016697
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5ungne-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNJnc5TjyAZfXmPjzh3QJj0Lemvyo0x6VDufZCBDsBJPgDDDlf95byIBwT2cpvmmyZiq8w7IscC8XyMs6tRX74C6gJ5KR1djw4LYCeSSnW7X+eKXMneRj46V8uWilHhjvL7W4eGZxGsaiB9Ql+rZJnBoXpkXiyTauAw9UfbhiCdGMvqonHL2rnchZJzdbGmSKS+CO1ho2M3VygYy6i5YzMDu09ALI7QFdw02nIB7IqEAHxE6X1R+9YBLGoh+YFsR5ZkRmOI6EyVaJpj76dC7OgHXHgjDNv56AenQIgT4VSOupNTOnjn0gjHaIJ5Aaea/odTplLzCl/pRc+9mIHickw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2unN2842bFeeYvpRfbBJdUG4sHPuEh/Rp4M+chbe3bM=;
 b=qvhAJtv8E1djVBLS7YIry2HexxzoWM12VwTwXhXfhTe0tjfv3XO6rpSZAoDrArQlMPvA1aaK/eO50Fxpx/pSUu/rqHuyb3hKR/COwTtMxCHl+jGGVRaLw1JNNbvWz6IubvS3qj4QUq4LPxQfMyIFC2ksmZnQAhgl+vY+iQ9EX/NEGEM8y9KbUtZMGCq9qoWywvBy5EBoKN2u9ugH+KUxzFCD5k9AKFSHpFbgVYXLwNhkDDLfwIG93QRfGjr0REu+qOgYBCd/PRnKC+3iPN4e1ADRg9kTxx7pZIlAmDwUPyha6yjZdbQ2tqnUfXLutCO9GfSr0cNIFXL2RYavxLWP2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2unN2842bFeeYvpRfbBJdUG4sHPuEh/Rp4M+chbe3bM=;
 b=Fd75sY/CBaNA2t2dZe2b2t2XxQ5RmB7hwKF8ux/2w8yjea+Q8Kzj99L7NTNKbUWP+IyoZ+99PyvfXmJEs3MrxFUb5JPAYj3ZenVJkIhuHbqXpcwzlCizcvI2uvxbwM7QXOUpC5CyoOeHoIsjijyrDCFJQTLVJ/Goyu3nE7PRde0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:23:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:23:12 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 21/22] test: Fix DIRNAME
Date: Thu, 29 Aug 2024 01:22:18 -0400
Message-Id: <20240829052219.3234-21-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0030.namprd22.prod.outlook.com
 (2603:10b6:208:238::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: e41240b3-0141-4830-a43d-08dcc7eaad85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?THKqv/Q2i0Y9dtOnNoQU1QOIZKtpiq8dUTAc6w+jUKltDcxE/c+DKeWNfwkg?=
 =?us-ascii?Q?dPthSuLpir7ue7EDzAs0tlusmZRW3XL2oJOqgTSc9QolYbJaGyVkrBpVYMN1?=
 =?us-ascii?Q?0lyYa9UGQ2QmOj1RR40brmCldFbopywtEzgy+33tiTK7tt7XeurP93QGxMlm?=
 =?us-ascii?Q?RzNARA1T5sN4EDve4Z95ML+iALCBEXrw6gE61eibXIUOgOpuk96Bmctk4woh?=
 =?us-ascii?Q?yNhaGsBQ1HfG216TZ5+PD8cgKk7nI1VHHialMZGIRahjl0+R5SD+wl+ncSDe?=
 =?us-ascii?Q?B+CLOIT5WrvCoa+ckILbWwKFSzmblLH2ehUa10YTm/vg3rsrWtujb0hU6ugu?=
 =?us-ascii?Q?0PBpZemQ5aA2aSdRjwKtbGSTvcmwpHcFhdah+JI/p2kM6SqirSfBOfjIMspg?=
 =?us-ascii?Q?o1jgyuAe+VXdXzOE/xvErbi7tXZXLK3cpmAId4wTEUHZWnhtnFULNkkGpgkH?=
 =?us-ascii?Q?rguoaEb4cfeBgyji6yCdzC9Rr9P3xPwEjDDawVYbBv+PbAPnNYTbYXbACVIv?=
 =?us-ascii?Q?R1dKYfczWJ0/qox/OWRsSoRGAUjbdsfTOJXSE9rI+mR17BiAIfvE4VaajVGH?=
 =?us-ascii?Q?8S8jQ/ovfI21J8k/J3Mo1PZDa2XA2S/Av5FK90wDYCxOh7rYrD24ZUy1qb+c?=
 =?us-ascii?Q?0uNfiTr2d0wy0aGJL2qk7XTiy1lRCiR+hP/jG7q65fB2dcJ125rAbj10iTDP?=
 =?us-ascii?Q?FXj64mFvo820FzJMlpILHQP+P5GFFRVF+8bokIk9qPLd+itZX2Vy7I4GqGPu?=
 =?us-ascii?Q?oww+w7ThY7ft5ddwof+Yx+BDQ7tidXvp10LZZHpzMElcsWm79Pcrab+RFKx+?=
 =?us-ascii?Q?V+apsWAY468bV5PSqCmFH3wWYWXxM6szh8vUXPlQanqaGFEn/YW1TCZZeTDW?=
 =?us-ascii?Q?qKbc0UvmjBn1bvpdbdIUi07zGwZHG2L0y/4aAmXPxdkfPqfaTwOAH8dFa9xD?=
 =?us-ascii?Q?Qqw0kNEP5KDOAAqflS02jfig9b/QhbMTmmFm/Qrjegf1VtRbpqMARdxWyE13?=
 =?us-ascii?Q?As/JRIZ+DyhC7TJN+2X3kp46wsSvbE8ziorQP6M/a2kIhs5Ji5vl5XkzeY/+?=
 =?us-ascii?Q?CGg7sZa9YmmtrIg8IEo57ABAuAkXiVV/JfGTvG6OfFRvhNiwL/AGXX8tDqO4?=
 =?us-ascii?Q?PMP7FZI6cAQkR1p2W92nUaxG+nQEc/X1im3/PnmPa9YB9ZUqJKMaunCfuTng?=
 =?us-ascii?Q?QNbP5k9goVSo/xozLGWOAwPz0uUw9r7IMOC8I13eZLuTMYmT39DCTlKmZJwK?=
 =?us-ascii?Q?zJ+M2UH4iSe6UDzysD++pvKnQwXc2exfuLRbSG9z6Zkhgt9QuJPG6kknwtLP?=
 =?us-ascii?Q?ASJRcf+0HNvArJrMa4Byb1lWWkjPLgorzFCvx7VmiEfY+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bRh+ORdg5qyEml6ThFqChp2w4FywSlbkS91VUOu2tnVoKFVfxfmXP4SRJY38?=
 =?us-ascii?Q?GN+WEVlu8alQ8CRqvjy4dRKyYCa4bw5AWnBdBqv7++TWaMYByQi3nW0mh+j8?=
 =?us-ascii?Q?NUuCiEMggKHxh9pQ2bkNUcq+2sSIYY9SoIGESYMVolBQCkDFZgdm6Y0MEIEH?=
 =?us-ascii?Q?49nu9AgLl0vBR2n7htED3U4ddekP52yW2W3GGyJ66qPcxcYMgXQ97CPKKTz4?=
 =?us-ascii?Q?5FY0qWoDJU4vFr7bjh4l73L8/ANwTsfQNScznYCx4vfDwGd2Zp/g+gZxcQW6?=
 =?us-ascii?Q?y+Nm3wuNuupoZtlHrzgJdX2Q90sWtXt9M2aG+WiRogTqQMT6b5ZiltuI+0WL?=
 =?us-ascii?Q?vEJ5qd5resyT/V5lQNclouWaYdJ9sb/rYK2jBt1TVSxN2v9pmefk+hcc/fs3?=
 =?us-ascii?Q?peKeVsYlxIqEoc72n+4OzpeE0D3N37HnmHgA6sWzuOvoA2kYm0xg2ZXiA/XW?=
 =?us-ascii?Q?4k8xjqFt5bBHKDJ2OWFxC5xTPDzFLM9PXVk9j7SpEBcPzRCR44ONxTx0KUUh?=
 =?us-ascii?Q?OVZYIFeASIyBg/dbALmGEcTEhx+WbXVJgBoPnMW3kjBDKbFnNTRDPsvB/GBq?=
 =?us-ascii?Q?cCQNm3E3xEXZnvEhhIEIem8qfXcUTobwx6UwLKGUSc3ehpXvxmFc5Hrh3Tem?=
 =?us-ascii?Q?xpwNzfaR0KGWKEIMT8+zvpVHS+juB8LZ5ymetONsUq3AB59mXMaRL5HrRT7X?=
 =?us-ascii?Q?aQDi/am6wwwIPncSgSL7F8XdSgnZN2VqNqfgOga75LA+EgNS2ifKjBsrjB0G?=
 =?us-ascii?Q?AJrohfQSSbalYfXCQZ+YAM0jS4eFAMYXLhlTzENkAFZZu8lVjZLJdaDDu+lK?=
 =?us-ascii?Q?EMmpIPkHgzMftn59uSwWsqvs7i3/eehrXXMYlJwmdZ8jljrG7j9Vg/9c8MlL?=
 =?us-ascii?Q?nJ3OLLnjntM3AQR6zjWgLruTu8FxhumoYtlb7DZ+2J+vVC7TiFcLwRMi1ZtE?=
 =?us-ascii?Q?P7lvUlDnuynFG9Z0W8eLLnmyXki4jJ0UigQwHpat5BckvnkclKijxOOriOmH?=
 =?us-ascii?Q?JaQb2rrmrX0axamu4lqF3G560PL/8wgpsCFSTc4tIFqQDmxM9ivqjXh9EO1+?=
 =?us-ascii?Q?GM/eVDJ2ezxrB9JP6Ua3ouuI/EMsvAWMAsSIdHTxWmDvcsY3VkquBNdo0Der?=
 =?us-ascii?Q?ts3/54jaGHBFYxoBdKksG0oRyczA6+SLGUg9C7AGexUL/fYSdZXAYH5r1I7W?=
 =?us-ascii?Q?RWFzc7BYZrhMntBkXeBdl/pxZayTXWfxEMg0nrmri4EIbG0GfaVM3n2Cd395?=
 =?us-ascii?Q?CtntlWEsXGKO97YN/bfO0DtKQ91uitq8n+LhK4SeEN4eGVBszsxPdv0fLAZ+?=
 =?us-ascii?Q?qDrd9t88vjLgjQ3azfdRSJ4TsluhEv7NzgpyxhrFVhGZcOkNFuvAz0OYpQkk?=
 =?us-ascii?Q?hQplJ1dbOqOOMrfOjdhv14mF3fHCmuv8W3xX14XI6Y3UxwcTZ5WyVOLzSMYv?=
 =?us-ascii?Q?AIr8WwSh6uJCl5W5E/WUhZqAsD6R+ZfPoCfpysDp7pIWTLUdswrJ9oT/W/+B?=
 =?us-ascii?Q?tip2FfJwdaqJtR2N/0mWHcCJolvUT8rA6crD3LR136oRlRA0lXMIw9ospU6B?=
 =?us-ascii?Q?W83dHao819bYdVzfuyo+UZMf/xoJ3vijS0SalA1W?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rCJNoERzQjHjstyzrDi5yW2i26T5T13I6yHol0rAxvmAnHnG8z6O6ylzNYQFECYPRyzwBv+KywCoJnNIWLAp43FNtLxa8B88VPIT9nF8d7iaLGyPggu7n67oI8Bih+tDgwEBdg4582+J3OdJGGuXL28CUbfB4yexiMhYwV5kF5+od+QT20mepcUHBdDyHMqYbHk6eMcGplXscz2f1LYl6hcmV52Sl7M7wmw96Fr3tRUaCSuKNJutQdAU/HYFMzUw33qR1gbdYTO1XJEUzMz7jy5q+Z1AJmuri85hzll+/wq89vet8OetOvHPBjRP8A9VMQVQ8XNfJikCFJUwEfymSlE+p8iLz2kqFCeJ78GIbTBb1o8xijLnDHEH82pBk4O8Qz+OGXHbc/g6oJLgnK3bsrwwyvPAo3RE5/QNtEc4Gy0kF3G4bjycxqD+SEsRrdMmjkrMT3iPFV3IM7GKhHto+2lWOdSb9G7Vk9z3EeNDQ8m0oOuij7U7QGNyubc5xRk/2KrIDrv8r5MS0ES4ha8mwUYZWeifqU9bWeBspnzkUF+SqA+98LB96piNlLo3Ww8AGjMzAHLwinskDMcnYmtsMWNqiU3D/8D8s7ThkP80NS4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41240b3-0141-4830-a43d-08dcc7eaad85
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:23:12.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBGSfyKfdHHa9lRYZnAoOdJnX8O691WXD6DHqq2LrgX0PFlxBhrm/MbCnj2SGay6KrLfLoMfC66ZtRaBUgHZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: iDiMazWRI-B7iqc0WKykngbE5G-Y99_6
X-Proofpoint-ORIG-GUID: iDiMazWRI-B7iqc0WKykngbE5G-Y99_6

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index c5dfc72b..f9b1d8bf 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -26,7 +26,7 @@ dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS=
 
-DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
+DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
 mkdir -p $DIRNAME
 cd $DIRNAME
 
-- 
2.43.5

