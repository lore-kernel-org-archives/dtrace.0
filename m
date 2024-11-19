Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829312CDAE
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029724; cv=fail; b=hqXP26DAek1Lwk7Z2KMj69KnW1U7z0m60338hgG9GHKRKwp+4sUfok1Xs3bcd0Z0qKJrt1Ib+kODfsDLqgRijJcU8lwWGdG71BYC26KEzAEoJ4w6IgJ/NNuXP0/RAoQicbm4rTp/YyMhbocFzfeI+5TcYA5y9n8KKyzT8asx8GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029724; c=relaxed/simple;
	bh=+uo/hsb+/LzMsV66iqMzT5CmFaZB8vR2B72NgXw2vFI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=X1b475aLHT8QMSh2Y9M/hFA2ETRwnxX/HQPYzTm12bLCRvk5Og9y5LhgqgiPHtNruvETryEUQSPshCz/xkpP5nzUbMaMTVfu/0trpfKIwTdpJThaK2xticm4rsRGy2PUxWGLprSthN2mGExN7PcOUR+uPnmufcvLDLfYS9F+XRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hZGbHeit; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KofoXzOK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hZGbHeit";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KofoXzOK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJDhQ5u009301
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 15:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=DD9mDRKO8nbiR2euGgs4s83vGH7y++IqV1w19eAOMp0=; b=
	hZGbHeitxcIrpCJdZ1eJ0cnZhUfkLqm8qpBpTswCTNkUhFRQHnyUf5TeyLqYJ3aB
	ZFUhmlTZr6tucq1YcvydVWRLuUgZ71suSxFGGqnhcv3A4cn15w5Gx1vPwyUreyOY
	oPU5B6eaNvPite16pogS2IZSSMoa3FLQb6QoUXpmPkKfd+w46x04pi1ozwJfno+S
	+Y99KGU+qQUydXR2x5wzoTIKY73GNOnEFudq1w8WAuLX8mLqQCtqFaDwjSTJ1TDK
	M0VYJY75xTma+CKZgH8AJQ+kf70gckdqkB2OIm7oiPJtA4LAKKvShaRi3NAWCtAa
	ADBG7ZVFCaV35KM7h7WAGA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xk98n3ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 15:22:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJEZpoH037426
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 15:22:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42xhu8vaym-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 15:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUie4cApVT/aLe7OmAU08w3IrcL2tRpYvnRA1T3x3mY4p3W1bNL07P6wlL3Eso8jHW2t0U94wg/fTDYiHbr3dzb9fP/k1X5BvqMG+C7vIE9AQDdQQ/ts+UNu2Ri0rEnCPr3QCQFIafv3E0dWP1PM1EUEpwm5+4eirI9R/5ZW4ckl2nhfWu6s1iJr+RZwHjaUlvuWIkA5jkiVhwV2qKMMX3q8l2xmTnt2nRBAH7mKloRndSChBnlIYZi0lG/mskTn7B64auJUpWdyw35VpD6vmHuP+zx/PltxDuqVfgM1/Oe1pIcpaDku8gc4RkE2eJCSEw/nKZL40H0zLSNDbBq0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD9mDRKO8nbiR2euGgs4s83vGH7y++IqV1w19eAOMp0=;
 b=vXVPcAM7GiyzlKD4Ig3RfKlOOzTpGYzaJRa/t455YP3tySyukz0Xe+Y0tfTWZ4FOuh3DpoltaRANKDSuvzusKAfBsX8pV6MkH6uQNkWpdF7rXCUxJjHF38DhLYdtrA5PQKd2dlOGSBPgJ1qH3760xWtljNxsOXoNdfP0bK9AsrhediePr9gGdnPCst2IvG5/pt2df4TGkxgwQa28yD6c8A9/GwqI9wAzO8RJEswDRaepcT6ALeIH/9CfbfcAytHPiyumQhgLl57PBEbSS5OKGBpARIjnWGRBZHmbkXoQ3AksuDJImiwWYxn/Zy9792ag2C/+1SnJGv6eHTGVrZuWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DD9mDRKO8nbiR2euGgs4s83vGH7y++IqV1w19eAOMp0=;
 b=KofoXzOKjalpASBKUR6JPGqfboJ/XKERmhvelgI47cr4VTcOzpT+z4Yrz0T0vmORSVQxuU4JMw0L1Sf39E7LWMKVo2uKzFW5x9JboP59JHF6iau2OeRu+nogDTxe43eGtPYu7DvCTODyk+ZL5qHwnLE2z4fx9dFfti8BQ0mSaV8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 15:21:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 15:21:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Number refers to nonexistent line
Date: Tue, 19 Nov 2024 10:21:52 -0500
Message-Id: <20241119152152.15077-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe20bf4-d847-4640-7071-08dd08ade800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DkpM81XuowHhjlv4fvBgXAU3jVGArv3D/IHg22uB0lX2ZxMNrPTXOtz4ToVA?=
 =?us-ascii?Q?a4tsb5docONWCkZbV5qZIEOw3457qJjyruNTHXnsCcZNddG5GvYOiHo8dJ40?=
 =?us-ascii?Q?OFeNrkMPGvoVQmdg+EFVjlR+Mlb8Bw1oBrIb5Rr+afozKkQMjN5vgzQFRkZd?=
 =?us-ascii?Q?1Cp4ltKB6yD9Cb7UBgxrHtcJPBF1xV8Uj4j/seXNajNrsiRXFY14WkMwHYkM?=
 =?us-ascii?Q?sC7DmwuFu0NvrN3NWJYNeHqaZgyIS4w3skyBv+2tW+4a4Yxx7uZnuibO6zsR?=
 =?us-ascii?Q?JFN4ullOCGUV6wBhukqgwVUHJSEVpEHx3nec0DWmgNbHVStgtPOa79oz1/Ss?=
 =?us-ascii?Q?7kAKJFMkk6Ee5f52j/AvmtrsPY2C9Cerlcth4P5ZmCuGkgcRY9W4mU5/I4BC?=
 =?us-ascii?Q?pJ0jB7gt9H29wB/qtUlgBrcphSMC4X3xL76TH8zVs273O3hlUCflfQwJmrBF?=
 =?us-ascii?Q?vOubjn06fAPERA8VqCLSaFPdETNBCSI6gz5okcxR2hQ4BcNxT/c+fO6JyC4G?=
 =?us-ascii?Q?pMq7L19tqmudEBKUGmOJSDaO3FBjhOj9hIxtsvYXk6WmJwnAeqQpu5WAtlBp?=
 =?us-ascii?Q?X4JOEFsVCsIpIH7p8eEPVf7ZNrQMTq4F/xXqYSAVCXEHqkI56kjIGSkYxQE6?=
 =?us-ascii?Q?46QUUoyqQHXPRC/tNY5arHK51UvWu7fYi2lpXqjBVWVN6KAWrsNmpHCql0B1?=
 =?us-ascii?Q?Zx/KAWNF8WQ0ZmDV95HMnQ0/kA0wnuZsJ+TXwwxU7a0W7JCor2+EurTQMFly?=
 =?us-ascii?Q?YP276PNxNl2qtETbYXZiqzAEDMafYBOfqluZ/Rpx4oidscE2reVjbwTUl2Wy?=
 =?us-ascii?Q?zo0jH9VDzR7Gq94Rf+3nVTz8I9UNOlY3rhux6z7O5gY//jWKuTuMb546hblt?=
 =?us-ascii?Q?6WfLEO1byKPoOS9QpN1FWT5ISB/pBYerUOGEO87ShsohiWsXt2dcljz1jUEg?=
 =?us-ascii?Q?5/RhvdXG846kTbHNqvk0BuzvpbAIBaxn7qduraKO3BaPbcx94TKsCm7CwCmj?=
 =?us-ascii?Q?isC/IkeomNg3VFpJryP9q+cdk2NzG6ohaabcVzinopR0Qiaa9A/14XLjJJXF?=
 =?us-ascii?Q?/WyYwyMYnyo3PaA8WDS6eA/RGUy+yuFa55cRw3WKOIJ5sjeHoYGhCMWj22lr?=
 =?us-ascii?Q?Y47oR8Rw2VATyzh7kG94yawNNfj2P48xdYIWG0+aHwHsheXmtVeStVBWwDVn?=
 =?us-ascii?Q?MihHTHS+/3Uc9inH4qPVI5eScyZwhXLbFmGJ+MEOp65FzkkkZLmhunr8dBBe?=
 =?us-ascii?Q?QJNRkmLIrRqwjmznE+F521xIE32NnIRFrTRZEIMzD63DVe1bjetOEzl0tVSK?=
 =?us-ascii?Q?K1Zgl8ChB/4lrnwfPqCsa85n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7O+rh0R/JpiAD42ozaB6vhvUaLytZVVwfT0VTZxrAAGRQGsZidsYiTwOAnwC?=
 =?us-ascii?Q?azPb9VSm1O42zKPFfLiBsHXD6JA1Ca2v1sk16lwpFtT6ICVRUHz5jqtzdEd3?=
 =?us-ascii?Q?by/yUC/XjEbWuGx3yHG3Z798Bsk2LLnyF+AZXRnaywuG2ooVa7LbkgRnOQa4?=
 =?us-ascii?Q?+9zdG+sa/W+ONVK2Fv0V1lj9ztkSJo2NSX2UD5nsC3PcYFec48mNrfulXEEo?=
 =?us-ascii?Q?dWPlm8WWmzji0J8oe1KeRq9M76bj2wCCEm5JbSoEuVPj28kdqZ8gj5iLKQld?=
 =?us-ascii?Q?Xh8vqvfc7c11YVoVFrDFL+iwCNvkG7eEfIvPhkNnTcfXuWkSpBBgeHNU0iPB?=
 =?us-ascii?Q?PKkc6Pby4kexxYubmZiE6ZbcgpOKfBiBpJQPjGAwZs8XWlYl4uKgtE2PvTeG?=
 =?us-ascii?Q?5tB8xWGbs23UQrdRG3Q7hzce3S3VrGhXEG/1ZTEOv521sWzX02TKUZU/BYYS?=
 =?us-ascii?Q?FnHk3PJv6QZHIRJfp1eT51Bx5BT2+sHLBj2X4LRFlDMB2rjfHDDvFdVT4Az8?=
 =?us-ascii?Q?FicpuWEsYFaUuDVu0Kl6TZQGmIepoenIqcnFvlGe444/H7qWFkqZs+eXz/wl?=
 =?us-ascii?Q?TkERURCZ4A0RgO+3huM3s6dlc7JYHQRPl3GxASKleVrspttDxfV99gQSj4kE?=
 =?us-ascii?Q?dllaAu5qMtDHenalt6fZZcAOPzboT8in3L9qf/vKruWDw11VueCO1XnA1NKX?=
 =?us-ascii?Q?bPTqemgOBWpAYQG2BbSibIEZYylGqyQ9nLNEkKDtfR4HKDFrhqr4gO9MxjLQ?=
 =?us-ascii?Q?PgjLbjODcuQwscYbbUYiOTVucWJnZOVRGNp4e8vo7RtT6arAU5TqP4dXimn7?=
 =?us-ascii?Q?MeFvVDpAoL61OFlhbVpcnwaD0YE/O/fBa8d3dvpVMsB0F3VjHN+cmRKl2IE7?=
 =?us-ascii?Q?DUiFQo5KoPrKbzVQz1iornSGKHTxQKF3mdmtSDdhDkVuVoLf80XQv2Uv1OT9?=
 =?us-ascii?Q?tYp/rxuFJExKnEe73ieAU2aWbfKJx/K2l/5EQo06Ttr4ci9FsYFHzyDdHimS?=
 =?us-ascii?Q?eClZYneS/DHJcH3F/JIYheOvOEQdgjvnH148tR59Xto8Gk6iAqu8VyIABdyn?=
 =?us-ascii?Q?e19dnh0fIePHdAL8U5gRCYoKqJ/hZH6oNhGQoi2JMNUuzx70GWmACMqcpFfa?=
 =?us-ascii?Q?SSTj4OqMl1lUPdiopGRHF+Go8ruAe3mUUsDbVDXwwbPSpcqkTG18MY/bbh9r?=
 =?us-ascii?Q?V1kPlNaoklI4BnRImOeZBRPSgibwR2FTbIfWkcttxT+Nz/QK6VQjal8F5O6n?=
 =?us-ascii?Q?jwA7xFA64fB7kHtQxz4Set+o6zCJa2lwizVd8GQ/4d0oDZkYdUkjWtYF321N?=
 =?us-ascii?Q?B62XFemoLgrdLVC7jWNxCSd7bIBoQnJGvrjRmLKn8Gl7CjOlcZUNLrOYQ3ma?=
 =?us-ascii?Q?D1YVoXU9kQnmWvMTFLJysunPMg25mglSKCMkEqebxRNguqPG1SChZMAy7P1e?=
 =?us-ascii?Q?8qZovWmPjIgSgRdzFU8hawDvogeRGnUv/c9qLXyaojJNaOkb2BGPyDze8u6T?=
 =?us-ascii?Q?Yi3sAEvwrLrQv1OBxXSD8U6/ihfrl/9YfFod9TTvF/zydEPZZ5x6KqFyVRWn?=
 =?us-ascii?Q?MLAzt9P2b0imFG92jgoMo6Y8jY4Lp5/BXq+fNgkY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PpJGKwb0lolkJHs3EsEGKw735cE++jst9joZlpj9TzUkhmVJYUvZRk90SjNeSjqqCjVtS1nriVgJQRnsBda8TiAEFqB1ooxFEPu6+Lz18FQnXoXgDJTkvzbjzV3amkZpXofYsIQJJsAVYDldB7QcmR+5e/JS2A2UCqONBBHheao6Ih4cfkqSln5dks9GX+gvubXsgtE7eREYj1dDKkZ35gyEkPbFGpwz/X7CdpxZTgThtp1PYW2IGJe11MGmMlQxxTcjjSRA/csbFGGpM5QK1pErn6qE2/A7pY0/FCk7738ibcVCM7GoKcLmmielPLLBk+4TwG+P3XWRfwVaW2bjA4kGzOQc62TGJysqIE95dDIXwxjpa4zWBkYU92s+YIycgmRtujjsFfrkRb3vjvjfmPRNO6/NB0S4XqIMZDAMTw8W1kW1ieAUKHkK1fTcp+1079QJIj/UqDEXwhLGzaIzZ4LrIheXcEj3wsSwjiywV+wRN4G3UAkI/MGTsAxguMHKmPwBrptvggtFoLwzrLHoGNkVoeMEZDhQA28NyrFAm6s317Zy3KTdpcdWhxwGlUu3U4zdQwbGtBF0B2kMsK0DDBPKH1SZ6NPfy+w68kp03Bc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe20bf4-d847-4640-7071-08dd08ade800
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 15:21:57.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9DH7+iB5Xc6yuG9WKgFFWLVPuCmf6UZJFExn+W7SemJ2tI0otjpAaY8Gxe5+S911Ava6ZTYymyI0JE9CCNGwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-19_06,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411190113
X-Proofpoint-ORIG-GUID: SCZHZmrY6jLZAj4qHal2-XwNbnzGmovI
X-Proofpoint-GUID: SCZHZmrY6jLZAj4qHal2-XwNbnzGmovI

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/misc/err.bad-prov.r | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/misc/err.bad-prov.r b/test/unittest/misc/err.bad-prov.r
index 3d1bf3010..6811d3415 100644
--- a/test/unittest/misc/err.bad-prov.r
+++ b/test/unittest/misc/err.bad-prov.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/misc/err.bad-prov.d: line 20: syntax error near "}"
+dtrace: failed to compile script test/unittest/misc/err.bad-prov.d: line 16: syntax error near "}"
-- 
2.43.5

