Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE57101E2
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716500511; cv=fail; b=J74OwzpWQ9EOA3gbXalJn+F/U6iJherQKkr6Hr0OoYkU/QQMVBMQZ8JSIQdsizPI4HINawASUqURkXuY1UmcKTPZjQFaEPCp8/VlDoX3PM4WVPozkmb/CFYw7BWyce/+o1ZoqFBXPgjcNcD2nr/14Byv6hoGyiMp+tRjcva/Mgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716500511; c=relaxed/simple;
	bh=WFtVaxurLgShqsK3AH7mb52Px0cON4fCL/IAmjFUrus=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WsFrU8Vodndv6pKvD8hE304Xep0kbqlodprGsxJZdLaaI3wOGhiDIlwjT8Wo7ENyd0K1/Cu9FBEPwHLYrIb7JRw2Gx+2Q0yGRptOFBGEjwedPn6Zbi7YCA8f+efWq7iDvnzki8uWbCOHOLgkiozd3psmSwZcdVJ2CHAl6GE0A+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WdLAxGQW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eulZlKz7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WdLAxGQW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eulZlKz7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NLN4Du015648
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=IoNONVKlCeo9MlolMhX1UIamcYvU1qhbxvmorFAR/Co=;
 b=WdLAxGQWdw7LZQJIt9J82HqoBFfa5Z7UrQSSofCIKBQrsTd2xau6sH+dltDHnsk9l+mk
 ggRsEJ8tbum0GXFavD/WRMWhQ5dNAdJghxvMXwpm0OfPvpSumuLbt4hgc+iTrshtFvTB
 eRd1Dnux7Ut0cdgXAYa0rOzXhx8LKoprEFEMX+aCYsYWr3tKI0qXzKSDaLRZkI2LMEf7
 3Q0DBSh/5se23UkjYeymxqfywkiF38xE+N2fNYLILH39UALL56U9dIp9yIDFBMnoCXII
 aXcHsXbluQLuOknCVFxcczJ/cm7JfF/CZ8A8xFta12hASVg73DHAfYLjtdFXJpNnFpju pQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6m7bav6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:47 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NK01an004935
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsbhtt7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHIxzs9SVpd5NxIsgo0+gu2evvcTrGFLARjMelFE9Q+liy7QzvVn4Jm/eSFxh1rGA79CkDp5LFvUMMAdkK+yhlFAbt4HdsaQKHBq7vZtQRf3P1GqcUzGWZKdU+avA77dpbcd/Ct+GYJj8/QyCNzzVdUT6uY6KGBFafmzceZ67MrxNyQwWGam/2kPll6MGS/woXgsDgYAsLbaojzRnveaIph2N41g7G62aQXEV5FMWm+JgcSFcvoiRvoukajjGuKS6/dtDkvtQmFdqrrGbz6OPPssH2FIKKdkaBUqzIgWewv8rJfUlDep7Uoo7vzOUzv+t/XMN1eDaFwJkytvFB77qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoNONVKlCeo9MlolMhX1UIamcYvU1qhbxvmorFAR/Co=;
 b=lTsCX9PRmonJyKZb/cRnYX+F84LS0OnWGWVNN36kGCpNulxSroL5IF5R3NPWyr9CU48iHSfcVi2pvJtW4Wc4aKMV/BVtiviw2eSYpb4ISeVxCWRAQOhEiTyys/w6VXkVbzjmse7jvCK6mgmsFrr/bsr5BGziYHjjSyvFTHScCKwo0ZTzvgrn9TT+vFfQ8HLg6p0U8fCmHma/nMH/I1NRzMESgjpz1fWsjGBvVdjdFZooz7/pe4335/Cp6R0r0rQP2duNADmLAP24/R+kHvKvgSc1D9fbEV/0vEu+2m8iYmoznEOnurXHQAfw0qnrKtn+xAY9MfPAXF28s/RM/OUKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoNONVKlCeo9MlolMhX1UIamcYvU1qhbxvmorFAR/Co=;
 b=eulZlKz7T5kl/fcj6p716GHUuwG+8tKDYOQyyNCaQ42F8cElMoGfjWCpeCGw5d5CwqsBHtJOen+m5romTkBxg4GsZdVk2TwzYfWKulBQo9B97RvCZiJ5neCSfeknpmzIZ/G0eyMREhxuTNyYoQhv2ldTqAPerybWz21awBUh1ec=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by IA1PR10MB7334.namprd10.prod.outlook.com (2603:10b6:208:3fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 21:41:43 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 21:41:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/2] build: install sdt*.h in /usr/lib64/dtrace/include/sys
Date: Thu, 23 May 2024 22:41:32 +0100
Message-ID: <20240523214133.500082-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0276.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::11) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|IA1PR10MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: d44d5cc6-4ccd-4539-06e8-08dc7b71232e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?anSoz+sDwj7VZjKOk2cuGKmeWHePRDZlWwNFXryrTpcC7M/PQ75n6NzGyYiR?=
 =?us-ascii?Q?HYK9LcZOYmB5LMS/jlaxT+3A1/Nr2icgHOTHTCqSPkDlDIgdd0aSkQ7tKevU?=
 =?us-ascii?Q?Rm0tx2nE4xzcSPIS6kPLzDW9AgVHOEE2tvMDU+VRJjciKpclcqVCFGhseI5G?=
 =?us-ascii?Q?eFCcehMdoPzr8kG7EMjz1YZH934jTwIcdXuWejKzyCkAjHv7wcqLU0lcsUko?=
 =?us-ascii?Q?VsVkCdlrcFKF4t3jyCfKdja+h15fA59j91Qd1JBqhg+6ZaJGmE8L87MRMnIj?=
 =?us-ascii?Q?CouGNCXGDdRe0rZv57ALg+9ARGRhrQmr/bjkUAAkZppNHI2aFd1KrfteV2oV?=
 =?us-ascii?Q?ll5D8Wr0Zlra/qGxEa/DohF9+4e/AoK+xUdQyF9e7a0/jZFszLB8pIs/ZKAQ?=
 =?us-ascii?Q?2YRbjADBqLcwbF/m8F9o4cHvDxC3uxJcaelARKRCG3l6E6IG+7kCWwXFmOHo?=
 =?us-ascii?Q?ohSGerM+QIrLyYN/75ELwFT6vU55jjxsQLI/L1AvxTJ9+D3cB4N6eMLf0qlT?=
 =?us-ascii?Q?Q4dqt+lLetqd8MFFX0rG2r9HRnIrTtb99hwXZIvh89qJ80evBGZqPDfRQieJ?=
 =?us-ascii?Q?XaHX6X7ZAuOmjQ/eEPJch15qDexpVE+RsGkq7b+b53a61YzeT5XxOnjmtUth?=
 =?us-ascii?Q?scEoG+lwQRigCfS+ASUXs7npRrhaUvKY4878I+cFr6umyS3n80hRksnzNxz7?=
 =?us-ascii?Q?Rx81isp4ALZC97z4AvddjhA47IFgpt2sZzvaxsyTaDD4fWUkvSykxdVUsbaK?=
 =?us-ascii?Q?lFVPUOssuvr7ipXwaDB0jFwu9ooOMobgw3ZXou0UFQrh/sSXM7g6kGnF/0Yt?=
 =?us-ascii?Q?mAPzhGdZIi5G0tJLF2mygHwi0I7hgKhMiobi/Lf3hcJytUi8mgzq1EPyCk8R?=
 =?us-ascii?Q?8uboRiTvYCJxGRzhIurQICDtYyQW96WnutJQnmdFpmCtSJj44i1ypGnlXAgH?=
 =?us-ascii?Q?455gbkzRRxRb3gZPatqiNxgAS6sKX+CxiWuVVRSQKKNYd3civEK7AbZ70KFS?=
 =?us-ascii?Q?/o2lB7rrXCiIQa09FiK8oaYIplBsfcsr8wID816Of6hODY2QIcB8pYC5+Ddv?=
 =?us-ascii?Q?JcOw5Y1PHMYVRcJg4VzIoNwYaXZoWfKCRH+4PDOp56Yt7upAN5yfUSZG4CVI?=
 =?us-ascii?Q?7vhfLHIAwHVwhVCFIeuCJzsmJ3u6eOCYe1dvE8aM3yKfITX9zIDuLuagrM7A?=
 =?us-ascii?Q?F03ko0R+KR0pNi2HRvfHk0fZgIojiquS4IeT3h0Hudlp0fqSvl9hNxylcNs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xo8sd269TyLfIcpTMPBS1hOpSXB4I4LSaifdWJBhHbvuI3lUTmbQlr/DweRe?=
 =?us-ascii?Q?j5M08Xv+GomjWVs8vzTa7VgZsVAEmKSct6OmEOTcRSU8Cb+GBXDfYP6TnPbV?=
 =?us-ascii?Q?1rrE7j7eY440FZLhvv97zyvQ9cXiH/V8Ok8pcLREwviMp3KFmXgu36GTH1+B?=
 =?us-ascii?Q?sFV9xgZY8XciG0PyeqzL/XxpQ4f6JUYTL+ZSx7UqQ/tyLqkvvG0e/UUglmxL?=
 =?us-ascii?Q?Io5QhldKRSrqa8myDDku3KMYgMU7SR0qrddw/0AeTveFkT8YM9WzjuIFWEVM?=
 =?us-ascii?Q?pHEGYVrGB5CExVk5x1IDAH7FxiB/oQalCwqPZTvAbTZQ/v/IUNqu5A9h99AS?=
 =?us-ascii?Q?bD1pYwSmNqJ3pAQ0IoWfIsADr/A1JEwDPz05w9gQvMigXSDnm+JKsrsixXIT?=
 =?us-ascii?Q?GegjaL7u02MUYfDTyaacFp+KPeQTqZ636PUtfnMkc0rE4hiPEhvFtrsL9Y0D?=
 =?us-ascii?Q?Igw+Oc/EmXA5NlKGgTRzIXlEIlZg3KGYEGpLG+p/DP2pSLbU3sxzxQ2ha5ok?=
 =?us-ascii?Q?xaY18fjbxQ6Jk5e0h7Sm95SpWpSG1ZIsVwdXs8FvV/l11MptB4GpnKvZVCB8?=
 =?us-ascii?Q?Aghd4VCg2z8w8/44YCvN2Hf+ZnO+kyBomWnaVTXL6u55X7n4IaPPPrwUkKNk?=
 =?us-ascii?Q?VkNUED8jmXpCzjZVfPqvNrc5qpiO6o6nGt6LUxenGqtLToVeDjZ8n9yeZX60?=
 =?us-ascii?Q?C8LHqLPdZ16TOvqkGY1p3O6S88Tmo3vtP9bbPIiiL9MRPcSlbUrPGoiybL9D?=
 =?us-ascii?Q?+Wn7ALFnlQaX/nBLJeeferAA227kKpa9PtdEBN0oZSYtcxKp4GricNoMdbBo?=
 =?us-ascii?Q?lkwsfRtl2OFWUdXPFQoZMORkHnT+8klIbf7S5lmFMjpC4qnRM0c1olW2un+U?=
 =?us-ascii?Q?n7Ylfa+iOSS47sZN2ptc9akadL4fV7AwABUGiUrqWOTdvAbtYVlx+wr3T17y?=
 =?us-ascii?Q?AidLJEd5+m4oEOPbs4iCqEVJemCjMNdnjXiXvwiIRnXliy3vq9trl04Y37sq?=
 =?us-ascii?Q?DlaoAtQOzSofFlputnKXKqD7ud65jTehbRtDfjZ/sjQ1gfAOKrIVFhysilib?=
 =?us-ascii?Q?W9PdLVakJFeCPdYhOBc5yxvInqsT5cO9KgN0Pt7C9/DHkT0EaG4Jk0VzRAGD?=
 =?us-ascii?Q?i9bIAHJqqk2Y//vHR74EECKEexNPJoLBk9oT6oSA9lUGT5oS/jCXQr7+TWD/?=
 =?us-ascii?Q?H7WHaqD35uhmGyumwbdKDoSJ/uFb9ukvTXBeCSW3Sz0hRMVvmCtL07maIE4D?=
 =?us-ascii?Q?JXHntEO1KcqrgLBOpBPsU7OW7KAt9Cw0N4dK2IwwLYcLpGdwsmxnQc7SIm1R?=
 =?us-ascii?Q?QfMED1z3c/GghXV+gT9G0crV5CAoqPFDePqgDtuFlTn5M8E087dC/Lz/ltCE?=
 =?us-ascii?Q?kV6fmNfPzscbOZdPeUJdgKTdaVW+ZOO0uzNsVlKUPXMd2zi1pOf/iAmiGcZK?=
 =?us-ascii?Q?IsQWzj7EX7dAyBcTQ3mcKDb2f4YZE65OTJuDaSHeBHezsoz3JoX++UXsVrT+?=
 =?us-ascii?Q?EZ6J5T8cKTFgybBBOvBR4L9L3kW9Wz6CsHuxS+nAxx47/mWMKY6tcObdroTN?=
 =?us-ascii?Q?Cw6FCsIvvhUcLSTbwXF7/yyg/YpKnYtp5kiUTy8D68wIT2qwgAv+UD020y5U?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	sSJ5ciMvrQfAEZ41F+4as7UeuHp/3OQ0lxFEZJ6lrTpfX0sjw8o9q3k0sKkhdDbQ2MGhUfrRKu8rq7KEBAASG9ZZXXVMD/y1AueiIdFH4Kz7j0E/lUNHpzXRHj6mP9qQztjR1SCt6Ws2iYTkGv8akiKjESML8oO8IaKE7b2AxRWyUevEUPql/AxEtVnShmxnhvaoH8pJ/1s0HhnFvIpyYwgccNBc7CDxQgEsv0roB9kUJWbTZtqtXheQiwhI6ivAbewP+Q1P4sQrUIxZMEhYYuaPgvK+hw74A1CrlKWbSmUKgK3S4nw6De+2Cd+6S6COy5pXvG8SsCS2ln2pb8PFiQdUIjayyZeErg6YqoVQrcSVtz3Gv02/+rHrjJA6AsB8cwsNrBMbRRHZCbzowZNFawp6Y0+nORslSdmSH5GDwLPVluZm7gRD8UfMRyqSIXt6u/tir6K3VLSavKTPsOuF2XR12TklyZ6Xy2bPmVIyfoOUkQt8EmD0uD0sL6v/WPhSC0tsZo/epn9oF54fRkzCw5LCra0lpWfejMXjiCmQ0b5RAwMfmGe9tecKymqi+TDKBRc62ga91NALl12Li+KeQV6iVXrbBOEyBF7UMY8M0HM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44d5cc6-4ccd-4539-06e8-08dc7b71232e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:41:43.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K5CF4c9yPt43x3NZiDcqgs+lDIJNL4ddISVnaHEb8p5rFAI7pFEJg+r6f2yGJViSk9XDSrg2L4xwQaY6vONvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230151
X-Proofpoint-ORIG-GUID: o_ycyIvt_aeN4wk3-dRpAUkhiJlfA0y-
X-Proofpoint-GUID: o_ycyIvt_aeN4wk3-dRpAUkhiJlfA0y-

This moves it out of the way of SystemTap's rather different sdt.h, and lets
us remove the barely-working kludgery in the specfile to work around it.
Right now, the new location is nailed into every user (since sdt.h required
no special cpp flags before now), but this is hardly a good long-term
solution: a better one will be forthcoming soon.

With this change, we no longer confict with any systemtap packages!

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile                           |  2 ++
 dtrace.spec                           | 18 ------------------
 runtest.sh                            | 10 +++++-----
 test/unittest/pid/tst.provregex3.sh   |  6 +++---
 test/unittest/pid/tst.provregex4.sh   | 10 +++++-----
 test/unittest/usdt/tst.allargs.sh     |  4 ++--
 test/unittest/usdt/tst.entryreturn.sh |  4 ++--
 test/unittest/usdt/tst.linkpriv.sh    |  4 ++--
 test/unittest/usdt/tst.linkunpriv.sh  |  4 ++--
 test/unittest/usdt/tst.manyprobes.sh  |  4 ++--
 test/unittest/usdt/tst.reeval.sh      |  4 ++--
 test/unittest/usdt/tst.static.sh      |  4 ++--
 test/unittest/usdt/tst.static2.sh     |  4 ++--
 uts/Build                             | 16 ++++++++++++----
 14 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 7d1af5641f54a..30726332d762d 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -86,6 +86,8 @@ BINDIR = $(prefix)/bin
 INSTBINDIR = $(DESTDIR)$(BINDIR)
 INCLUDEDIR = $(prefix)/include
 INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
+SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
+INSTSDTINCLUDEDIR = $(DESTDIR)$(SDTINCLUDEDIR)
 SBINDIR = $(prefix)/sbin
 INSTSBINDIR = $(DESTDIR)$(SBINDIR)
 UDEVDIR = $(prefix)/lib/udev/rules.d
diff --git a/dtrace.spec b/dtrace.spec
index 42ea9bc339586..2f1e489aab7b1 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
 Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
-Conflicts:    systemtap-sdt-devel
-Provides:     systemtap-sdt-devel
 Summary:      DTrace user interface.
 Version:      2.0.1
 Release:      0%{?dist}
@@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
 %endif
 
-# Because systemtap creates a sdt.h header file we have to rename
-# ours and then shift theirs out of the way.
-mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
-   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
-
 %clean
 [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
 rm -rf $RPM_BUILD_DIR/%{name}-%{version}
@@ -222,15 +215,6 @@ if [ $1 -ge 2 ] ; then
     %systemd_postun_with_restart dtprobed.service
 fi
 
-# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
-SYSINCDIR=/usr/include/sys
-if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
-    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-elif [ ! -e $SYSINCDIR/sdt.h ]; then
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-fi
-
 %preun
 %systemd_preun dtprobed.service
 
@@ -253,8 +237,6 @@ systemctl start dtprobed || :
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
 %{_mandir}/man8/dtrace.8.gz
-%{_includedir}/sys/sdt-dtrace.h
-%{_includedir}/sys/sdt_internal.h
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
diff --git a/runtest.sh b/runtest.sh
index 35d5006978469..3bcd676ea788d 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -559,7 +559,7 @@ if [[ -z $USE_INSTALLED ]]; then
     dtrace="$(pwd)/build*/dtrace"
     test_libdir="$(pwd)/build/dlibs"
     test_ldflags="-L$(pwd)/build"
-    test_incflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
+    test_cppflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
     helper_device="dtrace/test-$$"
     # Pre-existing directories from earlier tests are just fine!
     # dtprobed will clean things up.
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_incflags="-DARCH_$arch"
+    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
@@ -587,6 +587,7 @@ else
     fi
 fi
 export dtrace
+export test_cppflags
 
 # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
 # does, add a bunch of options designed to make GCC output look like it used
@@ -594,7 +595,6 @@ export dtrace
 # Regardless, turn off display of column numbers, if possible: they vary
 # between GCC releases.
 
-test_cppflags=
 if ! /usr/bin/cpp -x c -fno-diagnostics-show-caret - /dev/null < /dev/null 2>&1 | \
 	grep -q 'unrecognized command line option'; then
     export DTRACE_OPT_CPPARGS="-fno-diagnostics-show-caret -fdiagnostics-color=never -fno-diagnostics-show-option -fno-show-column"
@@ -1129,7 +1129,7 @@ for dt in $dtrace; do
         # Default and substitute in flags.  The raw_dt_flags apply even to a
         # sh invocation.
 
-        raw_dt_flags="$test_incflags"
+        raw_dt_flags="$test_cppflags"
 
         expected_tag=
         if [[ $testonly =~ ^err\.D_ ]]; then
@@ -1204,7 +1204,7 @@ for dt in $dtrace; do
 
             CC="${CC:-gcc}"
             CCline="$CC -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
-            CCline="$CCline $test_incflags $CFLAGS $test_ldflags $LDFLAGS"
+            CCline="$CCline $test_cppflags $CFLAGS $test_ldflags $LDFLAGS"
             CCline="$CCline -o $tmpdir/$(basename $base) $_test $link"
             log "Compiling $CCline\n"
             if ! $CCline >/dev/null 2>$tmpdir/cc.err; then
diff --git a/test/unittest/pid/tst.provregex3.sh b/test/unittest/pid/tst.provregex3.sh
index 6e1afd3e493ee..7ebfb28eecaac 100755
--- a/test/unittest/pid/tst.provregex3.sh
+++ b/test/unittest/pid/tst.provregex3.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
 all: main
 
 main: main.o prov.o
-	cc -o main main.o prov.o
+	cc $test_cppflags -o main main.o prov.o
 
 main.o: main.c prov.h
-	cc -c main.c
+	cc $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace -h -s prov.d
diff --git a/test/unittest/pid/tst.provregex4.sh b/test/unittest/pid/tst.provregex4.sh
index a9ff323828372..e4248e15a7aff 100755
--- a/test/unittest/pid/tst.provregex4.sh
+++ b/test/unittest/pid/tst.provregex4.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -25,10 +25,10 @@ cat > $DIR/Makefile <<EOF
 all: main altlib.so
 
 main: main.o provmain.o
-	cc -o main main.o provmain.o -ldl
+	cc $test_cppflags -o main main.o provmain.o -ldl
 
 main.o: main.c prov.h
-	cc -c main.c
+	cc $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace -h -s prov.d
@@ -37,10 +37,10 @@ provmain.o: prov.d main.o
 	$dtrace -G -o provmain.o -s prov.d main.o
 
 altlib.so: altlib.o provalt.o
-	cc -z defs --shared -o altlib.so altlib.o provalt.o
+	cc $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
 
 altlib.o: altlib.c prov.h
-	cc -c altlib.c
+	cc $test_cppflags -c altlib.c
 
 provalt.o: prov.d altlib.o
 	$dtrace -G -o provalt.o -s prov.d altlib.o
diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
index 20f9de900b5ad..d233615f6aefc 100755
--- a/test/unittest/usdt/tst.allargs.sh
+++ b/test/unittest/usdt/tst.allargs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -16,7 +16,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-std=gnu89 -I${PWD}/uts/common"
+CFLAGS="-std=gnu89 $test_cppflags"
 
 DIRNAME="$tmpdir/usdt-allargs.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
index 6c14ece211c8c..d777c1acdf412 100755
--- a/test/unittest/usdt/tst.entryreturn.sh
+++ b/test/unittest/usdt/tst.entryreturn.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-entryreturn.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
index 1a088f8235bf4..c008e66df8381 100755
--- a/test/unittest/usdt/tst.linkpriv.sh
+++ b/test/unittest/usdt/tst.linkpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2016, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-std=gnu99 -I${PWD}/uts/common"
+CFLAGS="-std=gnu99 $test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkpriv.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
index 71d42ae417215..bf52bc6ad0150 100755
--- a/test/unittest/usdt/tst.linkunpriv.sh
+++ b/test/unittest/usdt/tst.linkunpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
index dd97250e5d8a3..a3b238745acd1 100755
--- a/test/unittest/usdt/tst.manyprobes.sh
+++ b/test/unittest/usdt/tst.manyprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
 mkdir -p $DIRNAME
 cd $DIRNAME
diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
index 3b32a280f7575..56011a4fbe527 100755
--- a/test/unittest/usdt/tst.reeval.sh
+++ b/test/unittest/usdt/tst.reeval.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-reeval.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
index a016f1c6c174a..bd71c2e46e1fb 100755
--- a/test/unittest/usdt/tst.static.sh
+++ b/test/unittest/usdt/tst.static.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-static.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
index ec6118730283d..29fd35979395f 100755
--- a/test/unittest/usdt/tst.static2.sh
+++ b/test/unittest/usdt/tst.static2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -16,7 +16,7 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-I${PWD}/uts/common"
+CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-static2.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/uts/Build b/uts/Build
index f445115d683db..864b2dfdacbf4 100644
--- a/uts/Build
+++ b/uts/Build
@@ -1,6 +1,6 @@
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2017, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -10,11 +10,19 @@ uts_DIR := $(current-dir)
 # provide the userspace versions of types defined distincty by the kernel.
 
 SYS_HEADERS_INSTALL := common/sys/dtrace.h \
-                       common/sys/dtrace_types.h \
-                       common/sys/sdt.h \
-                       common/sys/sdt_internal.h
+                       common/sys/dtrace_types.h
+
+# sdt*.h are used by programs that contain USDT probes that want to define
+# probes by hand rather than using dtrace -h.  SystemTap has another header
+# with the same name, so we install these out of the way.
+
+PROBE_HEADERS_INSTALL := common/sys/sdt.h \
+                         common/sys/sdt_internal.h
 
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
 	cd $(uts_DIR) && install -m 644 $(SYS_HEADERS_INSTALL) $(INSTINCLUDEDIR)/sys
+	mkdir -p $(INSTSDTINCLUDEDIR)/sys
+	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
+	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys

base-commit: 0f499300c150a3a8878361e31f3ba167f7d5b851
-- 
2.45.1.275.g567cb0950c

