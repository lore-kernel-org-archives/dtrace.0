Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7341FDA8E
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913595; cv=fail; b=UkhO7fjDx1oVDQoBhjU6dk7bfSp17FeH0FFaZVxWUF2+O3pzFqfd6pK3cm5BX/IY+m1ok+ci25MD/FZ4m+++/ZjjbvvK3mrVyELHz0EOZ/llUfwZqc54eroQ96vhKgrmvXgwmmTQMu/tZfhmkHQiTPCqT84ztIWoMTWwAK6+66M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913595; c=relaxed/simple;
	bh=oxrmLzlFhv9VO+BgRArqw9B5WPSmfOrGBggroJ5Spj8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tXMiIJrLmeKLylRedgiQEGd4RV1eHqx6QljeQW0i1soahvgxHtGP2j1nutOeOUPczh72O5WpFYPWMVSiYZGi61GHi62w8LitD8BOc6bVOv4h0ZKgD6AnlNDaa03U2dGKJZAGMG+fPyQs010rDE3Qm3LKuixhzObv84Dzz689fR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KQrP7GME; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UkonFEAk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KQrP7GME";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UkonFEAk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINBDR006423
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DcsHFrQIMM1jtbw/qM
	bfkjJkrdrF/s7ax8Fc2zP/Tiw=; b=KQrP7GMEtCDzBX//3LMDA44FF4Kf7z+W2N
	uKmF/CmwFOrac94t4gZM/iKqJ9Qk6xvRMcDx9vcoN21VJ/2ieKNIlY+hMRNnlZ4S
	LbVbYpBDd8Pkc/415FMhO9QGas85+8xzyP0GGvTp1OLrrY3Hm5gkxWKUxxdOptlR
	gbYNU0Gk8mWbpGBhHR0B2B1C3hbdvGFXCpHtp4K5f4ZHRZy6zuWhkTHxBVLW4TAL
	4oCef7Lnc92Y+Eog5IWx/k1EncpV+FVdaDtRncqGmyE0pQBLjMvIai8kyW1ck74L
	t0hPXBzOK3y3WMTIQy3HxHh/MV6YA093+iDt8s0TLzD6+rgFxeKQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dw5a8efv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIYDfL023318
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:31 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f94-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfmRWUlFTSx4y7JRQGWiLfgM790e0FmpCCvuI1/UQYs2ReErmQ8hOJc9c7RDLKzgpUtP3jRV4kvW42tM1APJ/M2yTDkWYGb6EwlO6oeElpAfxcOqzYUdP6MJu4V9crkpi3oBWIFleOgNR5Fu10LkOPtMpHVBHWjG8Z3oq6JgeeLnZA6zjOnMQ1uu0I9ld13Hd4qova/K3YFfAJkaw/X3gxG3dAd7HpjC28W+pBPxUbBmvqtH5xcwkEpUJkNJUqumeCdamdNYkPOJIu1+kZIub8U4NB5HbMkt/bElHHmtbUdehDmU7OLug3Qj5B0xDgfSFP7HsYZl6kBmJ0EPZiks3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcsHFrQIMM1jtbw/qMbfkjJkrdrF/s7ax8Fc2zP/Tiw=;
 b=Mz9Y5kwXgDiXcV4F5Vzh8rVeR+uW0uKNvahIxQ3oOUbMzqtscG25nUqPMkeD/iwaXELSRrjnzN7rD2Msq4ms9b0x7mR5QXsIBDLngq49dwbCanC5oMHtL0S4+UYAzJiPnoETnWqHc4VkOJ/EnSOqXFt8lZeB9ZGJW+aIqjsjf427rvm8GOJQaGftaRA4BWVFrNMntUtH69cYlV3gdAHjeig1bqGmqXy6cRr/yqg5i/TlvCY5G8+Q2GNiyp6IINi4YGmSgsRXsf/uWJp1lRPevfn7iCqTP7Vr8SXeNFYuvfEnKo5K7PXoDKsnNlTsvJaH2lQJoft4aONrhcbafeiOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcsHFrQIMM1jtbw/qMbfkjJkrdrF/s7ax8Fc2zP/Tiw=;
 b=UkonFEAk/fsD6J56JImO6ATFR9aTqZiEOj5kJQEHehd0jG6YWJWf6PKI5EqtYB3tauj3203JN02olrYwQ4HOKyF2pxR+cdjP08ARzCBuCmS1/jFUXqjczHlt3anRjKflZhxPJc5pL/YYN0xhuBy+TcArlpYz+YgidV4Ip0+Uw3M=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:24 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 17/20] doc: Add IP provider documentation
Date: Fri, 26 Sep 2025 15:05:54 -0400
Message-Id: <20250926190557.8485-17-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: b9bc83ed-d846-4822-c927-08ddfd2fc9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gd+gmA+7MwDnsz7LFhvvon9xOECwQMhY+uheeT8OdOEJDBQfEwzOErFPGAdQ?=
 =?us-ascii?Q?27PBnZXWIavUgNLG69UIvUqeXj6VmzSIvVJ22iQSVj60/M41xupC7m99xZaa?=
 =?us-ascii?Q?ntnM16OjqBQSm/7tEg3oHqU4zAWwImUsDjVSUogGWoezE5W7+D8lutkZ0adP?=
 =?us-ascii?Q?UctX0z4hHJWFZpqMNsrCDUZ1Jy9LqiPnrGrTub+tVIkXpcJdDKfdT0tBZtVn?=
 =?us-ascii?Q?Vfw77y0zWhPAqnVDuTHBgV33q/DAThYexkklp0Bzz0PFIw72sMz+OI5qNrXp?=
 =?us-ascii?Q?SKsoPxzts1C0OFXwCJPYyAiOL9zDog/1lK5H3NYJmnFkiNZMwwuLrq/e5mat?=
 =?us-ascii?Q?zrJ0pI+ZNh6xuN5T2wIXjyy+EmZgZrbZ8RuVnrZqlpcmsykqYXbiaKC3+6Wj?=
 =?us-ascii?Q?k6RtROBldk40A8gLzDzOxByqhas+90V72XLx/NKRtN2lBJle5htNJi3cePWG?=
 =?us-ascii?Q?BCH31jrOTZHlxi8/CpNUMH61NhcAK+GB/pCwCEeGoJ9PGdx15oSH2HZoUlLS?=
 =?us-ascii?Q?jUB3MUVG9Q6r3fjvZ1KGyLaDiWF4bx+iaxkNyU5pTt3a/KLtfM0cS6+nNvyk?=
 =?us-ascii?Q?uU7GP9p+ELpbKBQmd//gOd+j+xuP5Q8Kme5T4gZte2ScyLXVf4hSu6I6Uq0a?=
 =?us-ascii?Q?eFVK0VmC4TOAJN+v86UAfHoPm6Zt2qEtB6JU45pBclzIgi3l5EqvfgCIdLzb?=
 =?us-ascii?Q?U8dAbAEc/f91WPSkR9JQrSnq9XQG0ffQHcaQ1SoPJ85AUL0IQUnbxgL5UthI?=
 =?us-ascii?Q?69yM1L0ZyfQk9o2lGBrD+radm46671b1lFEpQepL06U8wyMxRUxkMigrnOC+?=
 =?us-ascii?Q?lWkxT1fZvuOnp+91KPTESh1RxhLKe/i6/+ZHm6GJVdLm2Qc/sxmyLr+iaIdR?=
 =?us-ascii?Q?cT4ehITdq8aqYQlxXKdGechWVyMjod5FCCPZTRedKnUZ6z9spUqQDlQSLQoW?=
 =?us-ascii?Q?IjRYRamBdYGctuskfyqEPgzwFSFsTPlqPGoV0wyNOazL2vINNcZTd/r05K81?=
 =?us-ascii?Q?SaUHiFQlnfCbNOPOdFLMu1Obyh+9B+cfSEgdoBUhu3aILOgxPVfh/FvV75PI?=
 =?us-ascii?Q?3bgD4/XtahGZssLksjXFotmQAjHme21xMHAAiY+3aNOhEIGYAgAMMvxui1k9?=
 =?us-ascii?Q?iuLTaT2mTlchXq2yrLAiNfcEQdHzWgZ2OylEWSWwA60bOnTbI5FDdRV5iT+V?=
 =?us-ascii?Q?hzIXH7spf9Uf/uurAB6dbTY7hqlUj48GlL+ifsSS/txK0zmWH4HyuuQ/2gf1?=
 =?us-ascii?Q?/mHv1eZrsSLMPVAs5gojpomsFBzUoPiRPphb91FLR2SajcloCPJ7SeuYw6jS?=
 =?us-ascii?Q?clYhPScjJ5SSUdPS7G4nEl98n6jfwtUoPAy4f8W7BAtrGCJdAthN54AW5XJ9?=
 =?us-ascii?Q?ui7X9WhtN9darv3t8WgQwquygq1vcM85XYkkSEOfvdjDKC1OvBj+fZWJB+QL?=
 =?us-ascii?Q?fvbwvNf17hM7phTYtYBSHooMtNw42qe3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l04UN1vJuNqT4SacJJM+1FNwtvYhYpcoZfo/SpoulWlRfl4fnps95JVKbXgR?=
 =?us-ascii?Q?h6or09lTwpvNg/EDO4bjXaJC+nQPPY/43s9oUk4y32Epzl6zUNnPBfViNlxp?=
 =?us-ascii?Q?XBeloXQYpPrcnTjMIEoLoFzhOQO08r7ytKADyvKRBvx3HV+3dFfRjsDJmi0y?=
 =?us-ascii?Q?66c9RRnq22U4PuRZt82FbV2lduxo/kx7fJ0PbW8MC9MNNG10AaClQCiqKBG3?=
 =?us-ascii?Q?XfA8W1JkjymPGDVPQH+/b3QOsQNeFOPiu++fO6yn/YYLyr4R3dahed8DmDUH?=
 =?us-ascii?Q?efL6YRxdYwU4CxcTtP1gx6vxzOoHhTTqCn2VAd9wXYmFshLjXhKUveoxGnli?=
 =?us-ascii?Q?g7zIuIIwDadvLVtRTyf1jyHmAEUTEPc9oV4Di8sRBvoe40rS+4CQIRWnTt/X?=
 =?us-ascii?Q?tLilQ2lN2TWut4eooZHrV2AUCTfdNAs+FJJHIWNjBn5BRjYr64GMRdK982U8?=
 =?us-ascii?Q?8vHE9pvtU/5K7eSpg0GzAizuJ0QRMebSYKvLu+l8kCIT9nGoyRqpCnrsyzB6?=
 =?us-ascii?Q?CljWfVdQ+bhzlfiF1U3DmQlxbBaw3ooFDqI3JTtEONyUZtksU40Kxx2ns41N?=
 =?us-ascii?Q?a8aBFGRSW4gItcNQib+Ey0NWLgKR83ZZg4+b1jR70O0d2gcT6WRflDQ7yafg?=
 =?us-ascii?Q?2IdREA7nadthq/PmJD4EHRCELGAokUq2N89VQkhyNuCRcBYD3FqA1B+NWpKy?=
 =?us-ascii?Q?nyV/W9qiF/vS+tVx78UVJRE99IWeRxm6ISbzIEkYqCMabSz4dcJwJrfTv74k?=
 =?us-ascii?Q?ondinyjp3LIdWt0c/Cwt0fY1E+GnOp5iwu0dvAritfjdXuK5q3dCe+hGCjEN?=
 =?us-ascii?Q?c1C44Uthuhl3lV44UQymUsZzQIIe84L3e+qVhPkilTpRw+q8Nq97vDa0kLf4?=
 =?us-ascii?Q?Ox2mskMsP2yycJKG7xCeglOwE+LVolZ8oa376By/iXOfDPaDoL62uBo9jzuX?=
 =?us-ascii?Q?7vz5Tch5/hCYmVcDtCHPdQCnKSxYnXXXdOxZcYgz3ItHAJbpUtwpjCiYBDTx?=
 =?us-ascii?Q?MQk0Jr6H0wxS4xWpVmc7UxbZd+6DkPkpQIsnT3qBElqhMoIDQIA77H949S/W?=
 =?us-ascii?Q?385mNT4xLCShNmd1D+Y9lgc9oT6/7DtGjzjVAEt4IStCobesa8kTlq2hjPKP?=
 =?us-ascii?Q?CCG9xjp7Vz473jHVnHnemgwv+ueaXQ3Whot/MqLF5KA93V1iBSW32h30ydt/?=
 =?us-ascii?Q?c/tM2zyRu+OvNfaDKFL3afXf3lMc5ppFoET8Fp0lRc9Mv774Gdwk6rmk4IxT?=
 =?us-ascii?Q?Jeag5BUfQ8ZRbq9q7MuyAUf1JhGd/7rnzBwqE9D5ze5YhezKRJGcqgJmCwPG?=
 =?us-ascii?Q?Nwe5XBmmNfy4/augivE65K2ynj5vXKAUrA2naafrL34AmP/lAeV5Pp4Rbyv7?=
 =?us-ascii?Q?7N4RbvEJmmhJhmAo/ZklcR4LKgYADlr6Wt0r6Qh9dkW/q6Dh52JSFkJzozZq?=
 =?us-ascii?Q?3MvRuocZC+ixMeVi8I88kcp9ya0H5OHaBqkdwX2QKwu95iLylTlwsCAxfQm1?=
 =?us-ascii?Q?OGT2Y/kRsfqKH3pKnWcsJH+MRsmzl6tX8menZdArI3v5py4z2m5U4Zgp6usF?=
 =?us-ascii?Q?PjjcPlmmdkxacc4YHQV8zBuATJ+A3CIkamfMFPqK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9SvyDLXW9bT9YsYPaDB6DiG7hCfmboRVDuUlR/uXv7/QMYKqNJDyvh6FPjEyCMJaAn1eEntBko3ROcHQK5JEsVavV6a/iIZeBn1zyGAXb/K9oJadRnmk/8M6TArtHE/n8CXj1EUGbIi4ppB4a8tFDTtK+BY04ramtwpv0E0V+y0VYBsja3gPlXztdg+bEHvcoKFhgtWA7Uo5vuKmmaHk89EhpIyPfWsbdU6bLHOgXFU7i3tUF+WzskSxq87vNarsBMqD5ZqKGWGijTASVbuNetMx1VyHP8lalp3htChT+d8OwFAt2bUUI+t1w/ktUrwHR/e04E8nKBLxBMMsL6BxXU1LblcoyWc6NDmaqDsiYT3Friv87G9T5oo7ARITdO65r4ARS/flzFqzfSVLqK6KPx4EBXt0JSWTPvU+Y8An6EUT11aPSmrcvzPa+EOju+AlwtfjCR2im1+eFHMRw7qUNa6TIbNDYnyUST826d2Ocf/o8e3tLxPGWKRCfcxdQHLydIhktGpjzIQE7nKJVXGeTZ7t4l9GbvoJRnsZRI2+inJ1vaVWmZWMGEL3voIAVoZKyEVayfOIfnTATadMxdNu3keBy9oWDrdHmA0QC/mh2Xc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bc83ed-d846-4822-c927-08ddfd2fc9c4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:24.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy5ZKnUW/Ff6wV2OGz18gyQMM35JB1U5tMJ0TywVvu9RZtt9PWdoX7r0mF2LjLEOJr1VzuXwsJPEbe002pV9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEzOCBTYWx0ZWRfX2wi7g6r8Njq7
 2/rUN7OhBpRsCtRop+PZFSAZbx52eEAPVdQYb8R5CT5wGpFcS2oekirkUnItGVnTJ1Ijnjyu9z/
 H82LjV/yNVfMSn6Qe579sT/aNGpTwDlD6WJKm5fksfhA/X+OgXSDoFAxaidc0v4PSye8kOogYOw
 DV5lRqB2MiVfLzU1Yey161JBrEjOEOwogHmoIoHwGHfHGUXckD5MwtSMCNQ4xoB1eC+OSrZbop2
 zEpcVOmMV/2QfS72pDqIuAMzKwIdJhzU6MUDp2On/hYUdpMsj+8Fl12fmuVbhnVPmCJB6PJ09Tb
 Bb3+dTS90fHfcljoFT58UvyrpgNM+saXqxmlWCLByfESfHIrK9i1ed1GpMbNnC586sQ0kGSoNJr
 Eg9Gu3Fpz103Ii+VoQSwpR4Ai2b6jQ==
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=68d6e438 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9C9IiEIpXZVybtazt6oA:9
X-Proofpoint-GUID: EnEY28B7wBgCdW-N7lQb9BIKP-1qMkmF
X-Proofpoint-ORIG-GUID: EnEY28B7wBgCdW-N7lQb9BIKP-1qMkmF

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
 doc/userguide/index.md                        |  10 +
 doc/userguide/reference/dtrace_providers.md   |   2 +
 .../reference/dtrace_providers_ip.md          | 174 ++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_ip.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index f3d96a4d6..18b9bcd68 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -208,6 +208,16 @@
             -   [fileinfo\_t](reference/dtrace_providers_io.md#fileinfo_t)
         -   [io Examples](reference/dtrace_providers_io.md#io-examples)
         -   [io Stability](reference/dtrace_providers_io.md#io-stability)
+    -   [IP Provider](reference/dtrace_providers_ip.md)
+        -   [ip Probes](reference/dtrace_providers_ip.md#ip-probes)
+        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#ip-probe-arguments)
+            -   [pktinfo\_t](reference/dtrace_providers_ip.md#pktinfo_t)
+            -   [csinfo\_t](reference/dtrace_providers_ip.md#csinfo_t)
+            -   [ipinfo\_t](reference/dtrace_providers_ip.md#ipinfo_t)
+            -   [ifinfo\_t](reference/dtrace_providers_ip.md#ifinfo_t)
+            -   [ipv4info\_t](reference/dtrace_providers_ip.md#ipv4info_t)
+            -   [ipv6info\_t](reference/dtrace_providers_ip.md#ipv6info_t)
+        -   [ip Stability](reference/dtrace_providers_ip.md#ip-stability)
     -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
         -   [lockstat Probes](reference/dtrace_providers_lockstat.md#lockstat-probes)
         -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#lockstat-probe-arguments)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 9f64935c6..54a018d5c 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
 -   **[IO Provider](../reference/dtrace_providers_io.md)**
 The `io` provider makes available probes that relate to data input and output.
+-   **[IP Provider](../reference/dtrace_providers_ip.md)**
+The `ip` provider provides probes that can be used to study IP traffic.
 -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
 -   **[Pid Provider](../reference/dtrace_providers_pid.md)**
diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
new file mode 100644
index 000000000..4e6c47fb2
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_ip.md
@@ -0,0 +1,174 @@
+
+# IP Provider
+
+The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## ip Probes
+
+The `ip` provider provides one probe for IP sends and another for IP receives.
+The module name is always `vmlinux` and the function name is empty.
+
+## ip Probe Arguments
+
+The following table lists the argument types for both the `send` and `receive` probes.
+
+| arg       | type            |
+| :---      | :---            |
+| `args[0]` | `pktinfo_t *`   |
+| `args[1]` | `csinfo_t *`    |
+| `args[2]` | `ipinfo_t *`    |
+| `args[3]` | `ifinfo_t *`    |
+| `args[4]` | `ipv4info_t *`  |
+| `args[5]` | `ipv6sinfo_t *` |
+
+### pktinfo\_t
+
+The `pktinfo_t` structure is an abstraction that describes a packet.
+Detailed information about this data structure can be found in
+`/usr/lib64/dtrace/*version*/ip.d` or
+`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
+The definition of `pktinfo_t` is as follows:
+
+```nocopybutton
+typedef struct pktinfo {
+        uintptr_t pkt_addr;
+} pktinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
+
+### csinfo\_t
+
+The `csinfo_t` structure is an abstraction that describes connection state.
+Detailed information about this data structure can be found in
+`/usr/lib64/dtrace/*version*/ip.d` or
+`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
+The definition of `csinfo_t` is as follows:
+
+```nocopybutton
+typedef struct csinfo {
+	uintptr_t	cs_addr;
+	uint64_t	cs_cid;
+} csinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `csinfo_t` from the `struct sock *`.
+
+### ipinfo\_t
+
+The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipinfo_t` is as follows:
+
+```nocopybutton
+typedef struct ipinfo {
+        uint8_t ip_ver;         /* IP version (4, 6) */
+        uint32_t ip_plength;    /* payload length */
+        string ip_saddr;        /* source address */
+        string ip_daddr;        /* destination address */
+} ipinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipinfo_t` from, variously,
+`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
+
+### ifinfo\_t
+
+The `ifinfo_t` structure contains network interface info.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ifinfo_t` is as follows:
+
+```nocopybutton
+typedef struct ifinfo {
+        string if_name;            /* interface name */
+        int8_t if_local;           /* is delivered locally */
+        netstackid_t if_ipstack;   /* netns pointer on Linux */
+        uintptr_t if_addr;         /* pointer to raw struct net_device */
+} ifinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
+
+### ipv4info\_t
+
+The `ipv4info_t` structure is translated version of the IPv4 header
+(with raw pointer).
+These values are NULL if the packet is not IPv4.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipv4info_t` is as follows:
+
+```nocopybutton
+typedef struct ipv4info {
+        uint8_t ipv4_ver;               /* IP version (4) */
+        uint8_t ipv4_ihl;               /* header length, bytes */
+        uint8_t ipv4_tos;               /* type of service field */
+        uint16_t ipv4_length;           /* length (header + payload) */
+        uint16_t ipv4_ident;            /* identification */
+        uint8_t ipv4_flags;             /* IP flags */
+        uint16_t ipv4_offset;           /* fragment offset */
+        uint8_t ipv4_ttl;               /* time to live */
+        uint8_t ipv4_protocol;          /* next level protocol */
+        string ipv4_protostr;           /* next level protocol, as string */
+        uint16_t ipv4_checksum;         /* header checksum */
+        ipaddr_t ipv4_src;              /* source address */
+        ipaddr_t ipv4_dst;              /* destination address */
+        string ipv4_saddr;              /* source address, string */
+        string ipv4_daddr;              /* destination address, string */
+        struct iphdr *ipv4_hdr;         /* pointer to raw header */
+} ipv4info_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
+
+### ipv6info\_t
+
+The `ipv6info_t` structure is translated version of the IPv6 header
+(with raw pointer).
+These values are NULL if the packet is not IPv6.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipv6info_t` is as follows:
+
+```nocopybutton
+typedef struct ipv6info {
+        uint8_t ipv6_ver;               /* IP version (6) */
+        uint8_t ipv6_tclass;            /* traffic class */
+        uint32_t ipv6_flow;             /* flow label */
+        uint16_t ipv6_plen;             /* payload length */
+        uint8_t ipv6_nexthdr;           /* next header protocol */
+        string ipv6_nextstr;            /* next header protocol, as string */
+        uint8_t ipv6_hlim;              /* hop limit */
+        in6_addr_t *ipv6_src;           /* source address */
+        in6_addr_t *ipv6_dst;           /* destination address */
+        string ipv6_saddr;              /* source address, string */
+        string ipv6_daddr;              /* destination address, string */
+        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
+} ipv6info_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
+
+## ip Stability
+
+The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
-- 
2.47.3

