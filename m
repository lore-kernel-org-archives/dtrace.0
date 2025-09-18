Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198B3C465
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758221772; cv=fail; b=nlCbBYMSKHryhn6JsuDEcdyD8dZRbWQM5iW0J7R65NbDh5wBbRwXs682KgGbZSaQSaZbEXCrtf3fJDLDy49UxCTlrUBW3QFZobKuZpQj4NLIAkZLZhpOoecTV6epnG4JBQuqed1ICw6vqYl6PCLoAJrpuynx2rn4ki3I8TH6IUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758221772; c=relaxed/simple;
	bh=MOLG8KRp4z0+Jsq+IGkhb9S1JQwMa+rSqaaGRWPIe7g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KsrGAFSafzjywlAQs+9Tlt2JC5sbnIOIM//IO7p9aTV4FJ6vx11UpaLIYMPInUkzyDg4KgnekePs+xN3X4vnd+Y5gSwaCmV+KhPDzcgNjjT4KGaefGmlbSGYRcVDuG+3bTq6AUAfcTx1QgsBbI7/5fyUxNfarm2XVTXRiALZZ7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MvGRkFIX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EOwh1/gh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MvGRkFIX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EOwh1/gh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IG0pxn007032
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=kfzhgj3/adDWAtwM
	UAShYG3ju6KjB2Y79r3LuFjusas=; b=MvGRkFIXbchdM2CjH8VGJklE97GLVTh7
	gX5LhnNlfkiUAEaiKRMoC4KQHcfVSaBuQqHzqDEP4pG52/rHQSXr8hfvFnHbbn8Z
	WHAV2LcOOMkIB3LpJcifGg8q8frkwnx6sq6zlHExoVnL+3eMA/pho3OzHevGL7Rs
	sQKBqxjnxvlDiT69/3J538gYf/esQPnTeOb5MoS+gG5rKhqkOrGi1rMUgMhRpDfD
	k4D+PodU8Bf7BmLLOyTlBebcs6/u+PE8zR7aperu56+n5f2nQSCbMS2CBqQieJoE
	QeqLBvVHV1F7U6qQRIX7SLrVyypYJunHNdFJBHH2jI4wIVm1BRSRWw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497g0kc7y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:56:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IItQQ8001573
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:56:09 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fseur-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXyr9Mh1kHf9kAJdFqU6097sBrzf5JliJLysshYpjolnr7xLwxUzhqtNirouJMhNWMePAPwD2qqKJe3WWVpLtOlwxEaAkfbnPRqN4oCwruIf3zgp6X66Ugl9zj0WgaXbUWxRVSvgOWa4NmcmrMQngZlTAwoICFtubrk/UTjRXWI8mSQp+gtdF9iFS+Bm9pB2W68JnyqJ2lOeKtKEWMRH70GrwEvoQwpQya+nKx251IQtBMJMw+RHC5MQf3fjYxmMKhk5/5tZOvmBlkyTWtBQ1n0twC9/w+lPrgV46fag2ulFHnSOqpvXfanp0hu1PsDrzbcmgF2i6SR3mO+cOXWduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfzhgj3/adDWAtwMUAShYG3ju6KjB2Y79r3LuFjusas=;
 b=f57/oN4VDbFcDXV9WlFpJkzHWOD4kZkpaMeS50lJKlsSQiAPH/QEZfMCNPpI3BSvDxppmqpEfMKZWV4iFlLZFp1mb2wlGIWRsQM65JpTI6qfruZH3htyXoPvwZtkaPGXt44H3rjR2qZIOWtncbMFttjnWIRRI5MMTalqcqfk8BplAaBVQItmth+jKy1HYielfLASMJjLqfrIp1JUXi3qFEtcB8ajo7IyDW7rxoGnQNTeeDsgsJBWgcNUgm1TeFdvZElfDlWcYSbF9aGttJRPztqFAQupNGOrQnUfk8ha4VtkRqnK+f9moZx82FJ5BeJA45T6AJln7FgyQw8mkYgPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfzhgj3/adDWAtwMUAShYG3ju6KjB2Y79r3LuFjusas=;
 b=EOwh1/ghkp+BYT9BfahTnA08uxxc6eW7R9oinIeR3s06oGvyPx/NFqW8aKhnnapr7joJ2O0sGuW2FxiANVcdK5RUinpdvTAJDI2D7Kjn5BVbMTLmY5TcOcdUOShwhf7C5XnklwTy1sN5230uqZJzfirq5cdaW0mGcsbywfYLPZw=
Received: from CH0PR10MB5081.namprd10.prod.outlook.com (2603:10b6:610:c2::13)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 18:56:06 +0000
Received: from CH0PR10MB5081.namprd10.prod.outlook.com
 ([fe80::9314:fd97:7f80:e07c]) by CH0PR10MB5081.namprd10.prod.outlook.com
 ([fe80::9314:fd97:7f80:e07c%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 18:56:06 +0000
From: Elena Zannoni <elena.zannoni@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH] Add examples directory to installed doc directory
Date: Thu, 18 Sep 2025 12:54:53 -0600
Message-ID: <20250918185554.1754957-1-elena.zannoni@oracle.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR18CA0037.namprd18.prod.outlook.com
 (2603:10b6:930:13::20) To CH0PR10MB5081.namprd10.prod.outlook.com
 (2603:10b6:610:c2::13)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5081:EE_|SA1PR10MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: a4dd33a8-b5c3-4b98-f08c-08ddf6e505c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?01QWowWzuVBfoMQuvUVmYJ9Zts5/8SXQ4KlgOjkSJHEiY0BxgRhkSuPUKURt?=
 =?us-ascii?Q?0p57wocAOdfQusqHz5vkNGJ7G2EsREbP7voqglSP4aFOp38CUbAt6L8BC4q0?=
 =?us-ascii?Q?BrlrHw6qdMUqVqM8dOgJWZ7/8jGux86DcE+e8EuZWVWsszL80YqO+N7+f0FQ?=
 =?us-ascii?Q?yK4+bo06FEsDqG2VK7ZIfoYXfjE+Y35twEgLmozTueo4JjBgpzxoAGfbfHZ+?=
 =?us-ascii?Q?bvW0B0T9PGxmYc3rNCdCobGNwzlbXZeCmptp8OhIQ+CsJWipr0DgRMskE1Z6?=
 =?us-ascii?Q?DX3+PZODtMmiE0434jR4ayV3sGb/hPYgmM/XKOYAKA2oOfb7iaJot3JhVAQC?=
 =?us-ascii?Q?Lhcbx/Ql8cu6z1uP+wf6dIVaidR0abBSE4fwdefI/Fi8bnCLXqSDQGJwkd9k?=
 =?us-ascii?Q?PyqbZU1CMoeQgqnRut1JQ6OiLTLrhYh2N3LwF2te7KktA9H7QTV1WanME627?=
 =?us-ascii?Q?U7Xw/OGnnAr/eiuTPp6QeCOulovTHmOfAQ0f/Lnf26r7QQkwz716fejBaDAR?=
 =?us-ascii?Q?DDFOxe+pMKFmXuwLl5WOSodtxihYhLB5wTp28fOjkd+0Hjp8YBByUGTcKRin?=
 =?us-ascii?Q?0B/jmwQAY2fQg5DfHNqU/fDG5CxesW+eu1zRZ4MdUf7EczqN+jBI6HLIw159?=
 =?us-ascii?Q?TY5Rw7y+PUgSfgQnnYxxJsdm2xprQcaGJ5MC+u3Gjn88CW+pI1sIZIJ75ncx?=
 =?us-ascii?Q?YyrKalGVBNfcnoGA+CvZPIJlbV4BS231Bumi4Ggbmeq8jqjYWlUfFi0XA2T4?=
 =?us-ascii?Q?elY/0RKFLxlR5WpT9i/doinCaCRFIdjdTVleaIhLo+Y1QcpIhHkQfQthlDFi?=
 =?us-ascii?Q?GExxPx4np/plhOIz1nRmr1tOk6qzXP6oefFBpI4a0ifFql3wZH+mMs+HqVPV?=
 =?us-ascii?Q?2s3hGsJ+JqrSX0dcb66eFjy9jQzfzaz67wLY2FNIqZx0saK+LU85lhQQzdxg?=
 =?us-ascii?Q?u6L07mYOolb57oO39RbrP10jbfRLucqSGZPyG5cQ5WxTkXka8CIvV+d4NQTv?=
 =?us-ascii?Q?YIwfdY1+dgImTkZB2uvAfDfXMP7f4luKLD/B4PuCanaFTCZp0G61Z7aIkNax?=
 =?us-ascii?Q?ZPlOow6HChKEH9Cptd5XYGT06FAomdnxtc6ZBHjzEHjacZ7ZeWVBtiRhN9rv?=
 =?us-ascii?Q?GFw7fzW/Q2XCn0AnNLUSzWfwhnZzGrA3MNLFpC0mH+Q9p9vu3HIedXnsubP6?=
 =?us-ascii?Q?qv8DHiEyMHbFfZ21JvTq03K8xqnCaXx6YxJIp/9kCogHwOii3A3lwTdkk3jX?=
 =?us-ascii?Q?i79ZCf9hFxDozxytqV0nIsC1O3w3dy7RBT+greUPqJRwYCEl6Ou4X8Zm55OW?=
 =?us-ascii?Q?LQsV6c3amw8CmfewFn46jL/vPLhsYqcnPlInvWqep8UI5ppAA7s03hKC5wKF?=
 =?us-ascii?Q?VUODCV/nBqiBOf3oblUfGJxJq84D13nrNPOiXW2veEWsa9g/i2DeBIqS0omo?=
 =?us-ascii?Q?na65W1NUXLs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5081.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b1RF7R8FUNDUI3EJiaPOe9OYLOo09/l6IN32XajPkDF/uraVv5j2G4/1QtFq?=
 =?us-ascii?Q?cEk1Nnl9Z+dOiA7+HCIrcX22hqwb4/bD101RmkseuAtLa9QehzVsoF4BrV0y?=
 =?us-ascii?Q?izRT/hYksY9vKoqrPALZs6eT0itBH884/te3bQxrgxOrn3900+S2oaKJc6+v?=
 =?us-ascii?Q?ULmU9BBDgsTZzMvNlsaYWXx6cimSTPIm6QP6uh2Jh8hWZu/X0T4dQ2ZM8har?=
 =?us-ascii?Q?foa0u5Z9cacP3xsy5XadXugWPWJ3r9vIa49V5nnDTep3TnhAgpIhVaypptbZ?=
 =?us-ascii?Q?njXLIrFZt9TTDXSMignbEqUhLPnep3Vlc9Ez+rdLkmnUHGl1jGB7zN0ehq3D?=
 =?us-ascii?Q?Zv+nmbhAvJeQntFZyzr+xPE0en+akWpIjHQ1wXA+u9bHdGfl8g2I8nxox8ik?=
 =?us-ascii?Q?+iz/slK7dx0a88WDLgj9+F7dWztf7bLpAbApgdHatjQShDLx6a7qstJdZD81?=
 =?us-ascii?Q?7xibKKJGzzDjKlxcaatZsx77sB6kYnLC2j2aooK/jwwKya3RFFSOvk4GrRSR?=
 =?us-ascii?Q?RQpvn8q+b7pTVUkhTmQt4KLzZ7KpdAEvkmSV0/RBh8FC/BbtLs8d0K+qCNDH?=
 =?us-ascii?Q?Ag0xN8yc6p/YcyCFe+Ie6iCJHAvU01L91jgYnbWAmoWz5CD3GIpRNj2H3iWH?=
 =?us-ascii?Q?2P0r/oY+d63yEGekUGMELkwoAVZly8L/NC3duEa44UVoKJhheNDU6rfFzxo9?=
 =?us-ascii?Q?93SQ5Aj49tNmmqxg11+48LMeANzADwRE9gWbXGnITHQWGwGdbDKhcQjq+uQa?=
 =?us-ascii?Q?2hZBvUKShhvAOQ7iTrRlliHFgaW0zDs9tlQ10NxoPr+8P3A5KZiwFKk8ecTl?=
 =?us-ascii?Q?nGQsOi78nZGAOzV5chZrAHBzuAOhUmn8OtrdqRaZczfRo5n+rICiNF3Bkn+4?=
 =?us-ascii?Q?rl3SP8t8K9YbBj9zyfkpV36ttQOOlIibckprFU+fYhNqmpfr3FQg52Wj4cL8?=
 =?us-ascii?Q?kH0HsiQy04lv1+t2Oa1bg6dyr+2+iu9K9Tb8/jCNdzAuIEYA7q3+VRrBqYni?=
 =?us-ascii?Q?LdmfUNzc/XMLzV5J1BB5HgsT60d05V+l6FkiT+6V8he4a3gA2Y/iPfjTKbkv?=
 =?us-ascii?Q?m1PIQkr8Lu7Z6SpPYBbnHgpnPTxlqcYOLrnt7Byab+AsiySLa8gWUz5eHkFa?=
 =?us-ascii?Q?rR9IjX1qmkcdNwlBxknigPjnramiU/zk09wo4dfcxk2G8Wp/SGDuwodG2piQ?=
 =?us-ascii?Q?YERlvpt4SIRHSJr2aEdwkKfPvNl4gyoxsDUzAQSz7pE244kiO4DrJfTNqPqY?=
 =?us-ascii?Q?Ajjcwt+ZL6WrQApEf4p/EAOEGT8C8sFjDk/toZG56NDT8P2BLxX2c7OpNBOH?=
 =?us-ascii?Q?V5bGeZIwfolQH2oPTyYAMgdqG2oFlfBikiZQguPRf1Bw0TMJjshugSWchmD1?=
 =?us-ascii?Q?LfQQuXtDhfbvPj4LpjmucPm28N5VD6gx32UemqaBjyhfxlL9ZFLrbC4Mn/4n?=
 =?us-ascii?Q?mE+iceUkbDSLQEhEHXYeDfSFLgkeZItgPIoOg9DtLInyzNubDlXwRwMAyXXz?=
 =?us-ascii?Q?2IrDvH19nOtduUTNLr7U/rtEXjYPxjXRgCD+X263yfH7x0mf5EUWMOQzD8Dv?=
 =?us-ascii?Q?J/esuZkdBwKnOHvMVJkVZNx4WF2tYdMwjOFuHYuIWabKhkq4XN1Gcejn6apC?=
 =?us-ascii?Q?Sk2dsRyuH3gM32KWYjmnT84=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lpVgEljLyyPoTrdVkVAb9gGXayVkCSrb96+T0jcbKfdBt1nkWsfwRSQgj49Pc2oPQzf/fXIg6JfNgTocMgF4XQEgMMCCSaO/tAeYww3r3F/4ZC+YlrMsdOaS4BbcqQkajzeubvus7dmCRkTX5i6YChAVUpr8Kjh8rE16vAR7GwCIrSKqMFoZNKCgAWwnB9WMWbDjVEeCmxCvgyxTfIJBhemLyyzegSdnDZ/mGh8tnXvoUi2D5VtvjF+UBn7dSyIjkyyisIyAWg3OLZEchtykPN2nZivDrFOunmKzP9K4WDtykzLUc83n8+hseri9nZEwgHdoPJHEjHaT+wnIVg0/r/ku/Ls+eiQFPcKLNQF8l+JFPN8PM+1XZ8eeDSOi3iJQlw9Hg5vjRuR2jRYdmrcqVCmpG/nk709is2tW7D/icu/940BMXv1SbCD4QBK233LAZMl+iAdqZ/ScB99F/7SI/xp9LHuPsSIY4T2whUlBF9rwQfEFDnJ3DlmA8DXVlwV0a9uahymoFH6Awmo7MVzX/ioWl/zdajYTCNoQf9iFar61oLkWZk88hvNo+llqRHr39udROoPlRe9cFadBnj8hdIpxE5aLJFuT/ByCmmeEMuw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dd33a8-b5c3-4b98-f08c-08ddf6e505c0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5081.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:56:06.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfcfJQHtb9TY+AMtXIE71oXcw4xjEF6/4hlepMe8fYsxdyxPecQAq21GVwVf39Z3NAJORL7dJLJ7CrRU8bx6Qvndo34MVy1VH0Hesukr96E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509180168
X-Authority-Analysis: v=2.4 cv=b9Oy4sGx c=1 sm=1 tr=0 ts=68cc55ca cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=yFOwIMqeGAYUmF_L03wA:9
X-Proofpoint-GUID: E1NVilZ5Sc1ZWA9i7JAqcwZWdhND4v8V
X-Proofpoint-ORIG-GUID: E1NVilZ5Sc1ZWA9i7JAqcwZWdhND4v8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMyBTYWx0ZWRfX/gUMfwdbU8C8
 mh1m6DqRDERfT8vD7hZf+k/mvJ40nkrsSDAyM8Avz6UawXoKuLvP9C37N1IC+F7yWFlwOQauWm3
 1/MWt7jizqKU2YQQ+5thCkyHc85cK/dBv0caX7moR2nq4jrmn+mnvuBtWiYwJKDWsWcO143NpZV
 I9fz2TddDRQzrD53/s88Ilh0C4Czey0AWmeTlPSDwZjLbr4+kWo1vMAAnByn3jDT8S08bRZSm19
 M758pKXIHUT4P+IyoMySxaZZMAxHnfiRm5xotjaucKcoCBzh32eAlQ8lYhV6AR6BNOemy53+WKx
 mbPvHsr98j7Cq57iMX3RPn9jNsAE7NN+tT9gupVbfd2NA6/Rs98DKx3hPth/96hIkV+cj8AqNrB
 4YgqrtaG

Make sure that the examples directory gets installed. 
It will be installed under /usr/share/doc/dtrace/examples.


Signed-off-by: Elena Zannoni <elena.zannoni@oracle.com>
---
 Build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Build b/Build
index 1a66a824..220c9784 100644
--- a/Build
+++ b/Build
@@ -7,12 +7,18 @@ install::
 	mkdir -p $(INSTDOCDIR)/userguide/explanation
 	mkdir -p $(INSTDOCDIR)/userguide/how-to
 	mkdir -p $(INSTDOCDIR)/userguide/reference
-	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS doc/userguide)
+	mkdir -p $(INSTDOCDIR)/examples/
+	mkdir -p $(INSTDOCDIR)/examples/language_features
+	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS userguide examples)
 	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
 	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
 	install -m 644 doc/userguide/explanation/* $(INSTDOCDIR)/userguide/explanation
 	install -m 644 doc/userguide/how-to/* $(INSTDOCDIR)/userguide/how-to
 	install -m 644 doc/userguide/reference/* $(INSTDOCDIR)/userguide/reference
+	install -m 755 examples/*.d $(INSTDOCDIR)/examples
+	install -m 644 examples/README.md $(INSTDOCDIR)/examples
+	install -m 755 examples/language_features/* $(INSTDOCDIR)/examples/language_features
+
 
 install-test::
 	mkdir -p $(INSTTESTDIR)
-- 
2.51.0

