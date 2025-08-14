Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB92B665
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755203627; cv=fail; b=LV4Y6XW+z3FwbQt928VmtzBSlTN1tDlYwPpWlu4d4nIxvwKRzHLsV2cWPrEiTZFI6NpjdoZkSkosvNm0Ci5+THGmFei+SL8vV2jFZvJ1SwRA8/kgU+xPBPBnDY0fLX+9JymTB4iaFaWVrNQ9UoiFjdC6zCtZ6UFbbkJWk0qgihY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755203627; c=relaxed/simple;
	bh=4Q1yqiMDSHdcTFGtn3OEDr24rcgNltXAXeqkQDAbYWM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=kTvaGrNXuS3RcpuQpPHSDCxakJcQnDZVJ/+0SLwWpBnXxGBYeDrn0cYtssg9VNDyvlhrKIMxUS7rcMxY4KUDJUzn9M583qs9pABUr5uvFJCKAxdz/dPREDHjm2hqAxU8w3l8GMeGPb15BO341NGh5EufvaNYwYtsqDfvz+OUppQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FfWTNzwV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QjmTQ3iG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FfWTNzwV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QjmTQ3iG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfqcG001194
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8FGpnmRM2KNI3jk2GgLbg5z86dmHZW/37jvoi+V4UXM=; b=
	FfWTNzwVbBtxdvIeZp3db2gf/mBR90xjL6ONXSGhpuZa/jxBaJkOBAxIYKmomg7V
	gjNLJlLuli/tXedOtLd25tJv9EcHrMDqlzgYTii+zOHzZ49+Rkf+ReCnadjpcPG/
	EJFIkZc9jqbK4x8Y/t4/hwfP1pYu9GaPVlRUxCks6/jmRtgQYpyqBGTkgeOXR80g
	KvwTsuuKGPY9l5xKDOEcoyESF63nfGgW7gpCsC3kLPxnVsafsAUySoyD0S+SHWkc
	WXZdKRMITqhovgb9T4VuWSaSaLtjRMr/pZ6Lhp2DRsyHMfRATrfbpA5WAQ7BHfq3
	ruk6GsHk3E4Wp8GLfLxoqQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8ejupc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJIkee038544
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsks8v5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/Pk3UrgZJDfK6vo0n6YLo4KzoiRc6lawlTDIs8ThyBp8ECAQ2ghSsiGIiFrfdi7s3xArmrFFn309Q2Ep+UYMe3MnGKui8MEd5oAZBJmkJlki3hcRKgBayB2Dgfabu6LXvYXNjXmKNBo3wnzkmyGLGRalI2i2rMg0JIMzBPqz5mbslvY7NayTqhREWzhwxTijlU45XrJXrUKfhBnATI85fqo54v2/spBOEomPhOeOHivK4I9WBHJyeHEr+7DNXCpcgbXPiAdSkTPS1vUdrHNAUHKisEvb4OWNyZRsxcHN97BjYEgZyokjgRZupvLcRMRc/zL3D1+ZXZxtxb73IxlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FGpnmRM2KNI3jk2GgLbg5z86dmHZW/37jvoi+V4UXM=;
 b=SiobIkRO8AZIKikxXs5OcTJ1JwAiwWlYeVPPtwB5rVH8HzV82xekNQOrGYWqg5UtAImmyzW5u/phkS5qGvYAftCI1VWaJQ4gIR4mWTc//+MXuyjAtNfTo2z/j1vPW7NIQUI1QHRkZWQQ1vi93tCORdF4i066gD56qFw6cLT8nJtGYUedfCeSb+FwIsESYduKPa6OpkI8lp9IRY+38QW6b/Yj0019qqJxq2X1tXcTI2nlgOOt8rTQfTdXbIgH4ly1Ep6eU0X4rdtnGFqK604MLdeCd242Xa81kxgZLikhHuVyYjzI0Z2MfZJvf0J6KRvp83AwdnljxrcUINgTexo8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FGpnmRM2KNI3jk2GgLbg5z86dmHZW/37jvoi+V4UXM=;
 b=QjmTQ3iGwhtgsSW2TrmZgC3H7+jhJmTyHjvmUB/H64xPLONijomStlc7LzqnOJ64dsIing5vGfM5TQd2c7STkFt1nCb7I/Im5/EQOPRA2nUebT4PDKPsFCCj/+c9V6N53byFn6cHFj93+wOl/yniQbVJbOGqeSWPX0D9WuJwWBI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPFA632C0238.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 14 Aug
 2025 20:33:40 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 20:33:40 +0000
Date: Thu, 14 Aug 2025 16:33:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 6/7] bpf: force generating code that all verifiers accept
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672F6515402EC102F37A779C235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPFA632C0238:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e95c06e-9737-4c41-7383-08dddb71daa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QU2Am6rOm3+gKI/Hprk8hvwOv/joT0bhnmnXazklycRd+3C7ADQ0iCNmVHH5?=
 =?us-ascii?Q?jhOItunJ6xDyazhMd6FHP0pxBNtQA4NMtAZHvBksRLUlarBp3BKfKuTvaETh?=
 =?us-ascii?Q?zlXxHbzK/2SNH7hikKH2zDZvJUk+5l/e2+OK3BfEvA6xewwkzgejWs6DYNgp?=
 =?us-ascii?Q?yIcu+GYvYqYnSMzKuIFOxkB+eq/PnFFoDypOcZLwviTkKRcuWmenwFD8xHdc?=
 =?us-ascii?Q?XAhBtURHJ5MS60cB7XfTHlH1PrxWmJ/bSe1MHxRjbyHwR160QDlAt69RyDlQ?=
 =?us-ascii?Q?YjECOQClyagxcfuIKBZ3PnqEKno3pok42Rn5KApsQ/tqZ0xeCaRtIXoJySf3?=
 =?us-ascii?Q?g6czJsY/n8IPuIZIBMwXSk5FEdnAy2+SVCTp5HmGmNshkt6+OgLxuznsin08?=
 =?us-ascii?Q?25Ome7RkkBKB2OprGimGiUH6SVDacqv/B8e+WS5KCQmUAvosUOAE7f3St2XT?=
 =?us-ascii?Q?lwF8MDvkEdAGbad1WJlVFOASlVVyczKbRwcGf2aDZzpVzYGQMRoD/5AS6STg?=
 =?us-ascii?Q?lkKuoqHqY1Fqlq5JG3NShRrP/5ndXOI+V3xFrvD4+DWICsFDiFkjvmtki5BG?=
 =?us-ascii?Q?NjgfdoCTvCOcX4jWk8o7azsG5hoI49PFjhgWX2OejEUb+HrYh3RRFio8XS4X?=
 =?us-ascii?Q?QiXXPCCwy5QRx0S7l8rF+TIyAktKsr5gnGQu5VHFK8PzghL6qEyFpPd9EU89?=
 =?us-ascii?Q?mF6HBGYy1sm+7KWQxpvB65ptqxQAdW9sUK+CpR3MuMsc7hf3mTMHlLbkb0ZN?=
 =?us-ascii?Q?MP5VXCFh38LE+zpnI5W9mzQBvtnrJ2b39OJrR1KZhQE42JcSTcL5DByLrYmD?=
 =?us-ascii?Q?uyXBlpgbJJxLD4fvVHQcllnu5p/VPIHF4a7TXetX/92l/xBrP43bUye6GrF6?=
 =?us-ascii?Q?lf747ilQGAlgbwZpf3VNegK4p2JlKGpwzIOGUJwNT62bf7c/teiuFJSO8IZY?=
 =?us-ascii?Q?eoLFCXWZk9xTvBZ4NLCzmIcS+PpeSaGIWtUVl6QuBslLp0QzdURrPz0NMWXq?=
 =?us-ascii?Q?umYEzcPF7S3yGK3hPEsGqre00v48A6buuQkPBO7YV9qtJ4z1Dfc/ZVbPJ6pD?=
 =?us-ascii?Q?GTOomcmOx4UNSUam9prQ+QT6/k9ZLgDUcjBMsQ9m7aBUbsq184VhB7CwUMc8?=
 =?us-ascii?Q?Wfe5qrb/g7gd8Y/9iprqtXD1s5II4PUCJiasZ4ysTaA9p2IJazJLrZuE9s3S?=
 =?us-ascii?Q?1sOywW5tAMqt+wktiM6YmUZbaOn+jkOM+cjpHI3Y4vmnj8mxdXnBU6GQSXdG?=
 =?us-ascii?Q?388nS2O2L1OFfw0fk0dFZ6Aq5VmaMCGU0K4bNgBGjO20KJdWobsB4xJktlO0?=
 =?us-ascii?Q?OKsSIGd+LXgBZYUV37NPp6i1belTy/+N9q0jRvukrkUnQYijdlo5Uz2FCcYx?=
 =?us-ascii?Q?R6NtHF0VzakCtKPwALBCibKc5/GZQDwhezueXVBm519uHBzzkP/P7hmqmtWZ?=
 =?us-ascii?Q?hIH/5hVQFxw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xht+xyF8lkWTJK200H80w1ztG/BjcXtJ/0oechz9iJoikbv3A9WiL5iqtmsf?=
 =?us-ascii?Q?qa/sOwjKxcEmsbbXYCFF913+rpSBYsrmUxyvrCsgO/OO/9tpc6l0OnGydudh?=
 =?us-ascii?Q?Z6+w6uj6o5s+FcPw2DzY3pTDma5eOjz72C0JbMctTbj5dEjg1/zpkumaCkrT?=
 =?us-ascii?Q?lcfp6jMydV+V1feYug5srDiYo2f97x4LohGmOtFAdmApzXeVxSjEh7aJi75l?=
 =?us-ascii?Q?ZOk/wQQE++BffDRDEkOCITkrMWnn+TrHLfagXI/foywB3gPuDm9NqYmvumOP?=
 =?us-ascii?Q?e5W/cpykIrgnvQeeK7KVhWbQCpPDyrx7vini18Y4ACIxJ2DCBa6h2WdsNerK?=
 =?us-ascii?Q?gPy9ieXiBffQC18x9jyUynv1B7CafuW9NTD8XiZgR1affgPV0d2t8W4KZchq?=
 =?us-ascii?Q?QK474t5Xi5BzrGWKNNM5caWEwQb1E3cODABtv/EJuirbJo1JrBQWaRwLALRI?=
 =?us-ascii?Q?NOoQ5v171Gl+0IWXIrqbpO5ZY+Cgs48pRU1dJeatM2g4D/QmVFLJjBaXxDW6?=
 =?us-ascii?Q?2dNQRh7geCnPLnoHAcpuaKat9Y6HXVb+Bmm/s9rIpIGg85D6YvQtyQFYtWan?=
 =?us-ascii?Q?4yNIpeVW24/+SRNJlatnowu4z8+smSEIlSo2SA+Y6QEltljET3QZrsJhX1ES?=
 =?us-ascii?Q?tY/Db0f5w00d18qRjcTi3bMfR1oY43pnbeKVYq6DFuWaDBmOf+Z+90v7VJrM?=
 =?us-ascii?Q?HYoJDENpHLrAuO1ZowJMQww+9jwZWmvDH8L7ioJILqPTqCxlXGmulrP4epXt?=
 =?us-ascii?Q?jhq1IWBszAlEmRafaze/9lHTmPGMrHCZ5QBQmvzwrLjDS9/H0r+Do9oNngLe?=
 =?us-ascii?Q?a/0OZKKMxHsTdSdHq2lsIkMmORfXJ/xnZ/7ULLED2qNuxJsohLrgLES65nPp?=
 =?us-ascii?Q?PafIX0cV6jxZPBAX++UZ5yL2RzjGukdkou6O3hoz+jFzalXoSUyZvUgJ0x1y?=
 =?us-ascii?Q?099L6af2ksZ2OERwPgvEVaBSmmhlN62dCMufnF/Qjm5KaunFbxo8wEwT/PH2?=
 =?us-ascii?Q?Ep339mnCp0bzA2/xKLHPrEXJf3ND7afCDN2fR7rm0F4DgKoZFPKCN40v8cWy?=
 =?us-ascii?Q?3IDmJgXGXoVF50tMcP9MVNqFh9iXY2X+ndxwrOf6XHfh3g80yFk4hhvUH8yD?=
 =?us-ascii?Q?K1oL8r1U78tnzkPZEPxkW/jJUeJImCSZ8TKdaJ9vXhA5IvrqhnR3dwtEiTbo?=
 =?us-ascii?Q?fHlC9rar4R63kYaB20CVgZnsoLlFMcDCpqzhQNIfyDzSwRLSGB0CyvgOScRc?=
 =?us-ascii?Q?BMgq6jQprN99dn2SNSWqp/r3KMxpAnug0eh2PHbqSfVgzvzHcNHFAEAzXLHz?=
 =?us-ascii?Q?0WpejNW28oVmj0pLCUFsc1EciqJ5zq4pyrgK6G2ZGhG3TtbJuuac8DF4EU7B?=
 =?us-ascii?Q?NciYxbAK+VmAvHc1Y6jUXkj20skSp0AhB+LzEkCuWB541fqCDeX2YKApYBkO?=
 =?us-ascii?Q?aP2EIH5NmIgoFCSStCI+hENSvhvPtIAJF9LSkTgtzJZp00x0IZJX9W6KEpNk?=
 =?us-ascii?Q?8/lZjfpty9RRAGO8dn7Av9qP1Bg8aQwHFY1hRwSnPqx0kO+E2BdlIQUvKIls?=
 =?us-ascii?Q?qy0g77BsaKOQVQknIQxqAp2uoZhlNtf4raDuio9tKYIReCKBJ28GsqW++g+j?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f1f6iuYO+tj1+tBN2LM+xCJMQZwWN54V2qQPWfbUCREEvVnauVXKqKlJ5rWCdLFC0nX7FXG4coAqkqc6+rEWq0KQGxIAoQYHV+ZgM9nRQq6e4z/MXYXn7Jxy2EY6K0pz18dzLX7lGGXHv6ah7hoqtulqM64c/fUmXG4DCViTtKCmvsDBqbP6f6ap6HYo/8VFVs7MOSp2M6kiGVSgij84r3oDLmyyKyqBkfT5U+Knxb2nOB2q7Dt1DQ1RCkm15gi3OVL/6wOQ8GL14FyakNVq8752nih9Az0lkNNCFS2/iFjsRY4K1ysHBr4haBNf2zEMeRRQuO54Dk5DMpHGSogGkMBWOajAEATaNHculKVBUOrbSTA/KAT18pIa33L/6P20lwtHhrD16rI6+kOQP3/74F3KJpH3rej72FAu+nKrPJN4I/OYiQ+XDFoc41Rebx8O3XY4+k/ZaBBWUnFyVD6ModNBmUsDDjVjhcZC6nMwZLEbwjUcVkxJxeeZcCXXIwr4ZhTCEtF6fyxjjnrSYhQJhi2KhHaow4EIfquPmgg97khyvt1p+xNPGdCnYyf0NgIhan2SH0aYZPh271j5xuPI7dJ09D/MfZaaw/Zx04XS4dQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e95c06e-9737-4c41-7383-08dddb71daa1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:33:40.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGXtDSeOixGbnEhwHhPcS4NK5TIRMYnidWQLOkfZgztzv3c1rFFMUwX64oNOflQ2hMs8UKXDkYnezBkwj67NEsVgcyQy2pthYmsberDSoYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA632C0238
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140176
X-Proofpoint-GUID: EyJUFS4dtdA-a6JAnY7nuvesrdKYeSxl
X-Proofpoint-ORIG-GUID: EyJUFS4dtdA-a6JAnY7nuvesrdKYeSxl
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689e4829 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=T3-o6uaRItC7Zn91x9UA:9 cc=ntf
 awl=host:12070
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3NiBTYWx0ZWRfXxbKJNerNxXCG
 BOgJpCe/mCwQGdTWHmitF9+6MhHLK4L6aizh7W8jlkPj2GZh0slLCRV75Zh/atvgyBubrfv/P/y
 1cECjKVPec8kWOjhN7sP+mAN4HK4vVt95NfYOQSIh75+X9Z8zY8n99nmMM0MQrbDpK8ooqLtS1k
 z77By/zzaztkPiQ9ByeW2Wd7otZR9S/1tJ/wubbSgb37VT7AAjnSaETn927gFDhainEyImODSxz
 HWU14vfPeL+ZEATQoypA9gGQqA2Xjk3EwR1uaYbG4jeP/FKjUSID+5+oErbhXyBCTWUkEpGJ+e7
 56HvQks9QrLG/inamwRaq9l/nbHdnWWxzBGfAKSGswEdhReZ2grfoMaRXEEgYJlUFUDCrr20kTx
 +EEdVZgXkPdes4DQv5yQqOHR9nX/Ekb5Uo5F1z0DnaHGOF0Q/ng3K+vr8tUy/k7MWIV+MdCd

The compiler could optimize val = *valp in a way where the verifier on
older kernels would complain.  We use inline assembler to force the
not optimize this expression and instead to always read the value as a
scalar.

The kernel gained support for using map_value addresses read from the
stack with commit cd17d38f8b28f ("bpf: Permits pointers on stack for
helper calls") which first appeared in kernel 5.11.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_dvar.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
index 073cca57c..aa14eca58 100644
--- a/bpf/get_dvar.c
+++ b/bpf/get_dvar.c
@@ -150,7 +150,24 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
 		if (valp == 0)
 			return dt_no_dvar();
 		*valp = (uint64_t)valp;
-		val = *valp;
+		/*
+		 * We used to do:
+		 *	val = *valp;
+		 * but the compiler could use knowledge that *valp is valp from
+		 * the assignment above, and use that same value (whith is a
+		 * map_value address).  Older kernels do not allow a map_value
+		 * address to be used as map key, and a verifier failure would
+		 * be triggered by this code optimization.
+		 *
+		 * We use inline assembler to force reading the value from the
+		 * map value rather than allowing the compiler to optimize this
+		 * code.  This works for all kernels.
+		 */
+		asm ("ldxdw %0, %1" \
+			: "=r" (val) \
+			: "m" (*valp) \
+			: /* no clobber */
+		);
 	} else {
 		/*
 		 * Record the value (used as key into the dvars map), and if we
-- 
2.45.2

