Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B677482
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742326163; cv=fail; b=mSKozlClukIc0PrUUMVffYwoBgE5bIi0GZBgXwa5cRuudpt5gy4WUvvyUJiqtpOsbbxCErSJN8BU2Qr1fEBdZa+bYvajuJUmjnBTCTKQbAV11nDHfDCgw38nqJIwA22wD7OQMO1iT+HsZHIyEFND52ivLAn7Ij4Dpi5wMBDZpyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742326163; c=relaxed/simple;
	bh=uwUdlJvLtUo5SBx8HVJt/cjenOO/LqgX/R+cCh5a5/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EzpUQ9SKeWxxnYt/FCBX3/7l1qFkldYtdJ2TXcurqcaTRHJVX9Osr3L2tyqdKsmFtYboXx8PwCL7tC+RFLPqfe3J2j2NsTqLXCxd8w+jrg3ZQzYrzk6D246W5/Y2v5XoM6WCnkL+0V3JrXnTfXBK7KsmzXshbkqD3je90frsIKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lRSrks00; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dhaBePAP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lRSrks00";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dhaBePAP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJNfec016456
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=EciOdEQt219c3nRjqo
	vMBOi4TKL8VSS50p2uM/HE/jQ=; b=lRSrks000jn7SjDK+6ioNaKstQ0egOmpH/
	ZG5oVgNgCCXGgFfb+H/JnUTsZQLg7rAMd4NgIO9OUY79ZmlnVMC0JAjVyRkPML71
	NKcGSLnyZS3V4C4jpA1cGkxDFyKFA0NfziiG6vjrWSo0CBDkxLT8CRpuYdwZmDKm
	+ADW/nBEOH7JKXGEn3HZ8uNnCQl/Sodfhut+Hu0u8aMrVYoRqcBqVrNqPWeApoBv
	40MEL8UE1d+NYwzt8fkwocn0qPAIRXcWiu9Ock5yrVqnw/uDYw5r1JGcWkYytRTD
	qlLOCYgHPlquNRcGuxn3WXQ3MC5Q9c3Vynu7PZgJgyKjwz/t7MCg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m0wxtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:29:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHnWL1022388
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:29:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxc62hcx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:29:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epu+uqEDK09/T6MKnoxpYkjXNZFNeNQSPEXFuTX4g2+p9wHPL0IgZlppxqaPpsKg1WH91Gzcrqm8gKfFPSwG4Hp3nKFfiErsFCvfVAWchDGSS26j7FBdpvDnPYUk5mCoNTMqAQefT+UGkRj+W1azw2m05GvuRludyr9XbFuljGrIN2X7tw8XRBUBoHOA+/EKwMh17tRbVlQLwPkzM4zBwsDj8xZ/YP7oxeanttLs1+sQCAtKNHlNNFseDR6J+d6APH2A6ir32NToB06vAJYM5scRuZrbVmghOa/iZN6hbWZZ8c3cLYzIOGvjNs4u+0ZR+LwTo8k+6jeEhyTxUOZkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EciOdEQt219c3nRjqovMBOi4TKL8VSS50p2uM/HE/jQ=;
 b=cTf4Qm+NYR8KbSQn8weBl3H2bRdr/8/oIJnAqg9oraw5PE+YZz/9Jel0wmcfAn2ki9xracJeudPrZgMaFWs1ufx9mK1IM9wZZU3YJnLDMg+aPj8gkcr2ieELGjk2Fyrs7sqX/4zOcTT6+b86UBTQJW2LHXDgllRTaX9fnZNRzUuPVzzsVcur3N+AVTl/obNA3NhQ1pdMDWowIdHmqcfXXqcXZLHLTPUzH5jgWmvZJRuXaIjWSfgVaw57t4IFGW4M/gBYVD+v8QFL85OTe822O7iB7b+JdvHA52NoFIBpiuqHMBAf7SAJ3L8FPmgsQuYZSrda/9o1QedfrfvgVEM19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EciOdEQt219c3nRjqovMBOi4TKL8VSS50p2uM/HE/jQ=;
 b=dhaBePAPaYNvZ4/KBVVcvTukWiFULXEAZQnPeHhElRX8mv65EXICpXk15H8e6f0LE/g43SqSsA9hyTMjwMK6j0sitdcj4IQDiIGlNDzaP9jbcZkscv3A4+f5mc5b4HOmxLRKRrBcUVd+MpazwMxQluEElUSqO9R37YK5yKcY1EE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA1PR10MB5899.namprd10.prod.outlook.com (2603:10b6:208:3d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 19:29:16 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 19:29:15 +0000
Date: Tue, 18 Mar 2025 15:29:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/4] Rename _DTRACE_VERSION
Message-ID: <Z9nJiO0ouIOyivZB@kvh-deb-bpf.us.oracle.com>
References: <20250227190154.23241-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227190154.23241-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:32b::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA1PR10MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5709c91a-965a-4446-adc7-08dd66532b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r0k8igG5vTEdertriqBIwxwGbRl+s7mQKCLGKz5A9uX8nUFjmV67CT49ikSg?=
 =?us-ascii?Q?pjNof8MMVFNn8ZAf7yZ7pP/87z49o+KlWZttyxR0tmbzA8yv0u9Xh6iEpKXh?=
 =?us-ascii?Q?KyhT7sL1c2EJL4IpfBlJP9U1PYZrz9cBAZTKttSxkDmU9CABGdDvSFBaG0KV?=
 =?us-ascii?Q?HrUxcT0BKs3mD8RyKLbwzWaZCiV0i6qm95GAKM8Ffw+d362rQXEGejo2bpcx?=
 =?us-ascii?Q?ndrTQV3551cI49bTaZXV6vl5yMsUmibkwkXVtIRT7vYpcfTDqmHALMCihL3G?=
 =?us-ascii?Q?qqHJlVNHW3L4+/lpO5YBjZOSpsIkP+SLTJ7dcKEIWesg2OfnpGyKWUw/z1KD?=
 =?us-ascii?Q?Mz5PG6BRLLy9DrLWobB4fq0tb92eVG1Hzy83QiNmov8+NlA/dAFa8fKYQvGA?=
 =?us-ascii?Q?dwbN72aZsExE6C2zAQDNZcscEAJrRv1/3oLIYMh+Pavdsf++qSZwU3GRoLTf?=
 =?us-ascii?Q?+gZk8QALTm6uSLVuXOVmcpWZr5yfUFbSTtHHAMx7T20f/QlNe9dRw7Sl+1x4?=
 =?us-ascii?Q?+UGhsjFev1EBlDefSHyojvTVBRQ1ZE91yfBk4/28a9lF772qjyqdn+ibwZEE?=
 =?us-ascii?Q?6vfY7WwkDzv6K3CKYmtOlEfE4NujyOeceJJ5aDpUKVqqZtJoFJsAIljLAFnO?=
 =?us-ascii?Q?1au522Dr1S0ABX5yIEEVcCbfOVsOkDMun0b94dETceM4WEkW3geClS44K3Ob?=
 =?us-ascii?Q?/0KOk/3SwsbOW+Z2o6tGYmsoU0nitapiKx1YImtP7ffV2iKqxOKUuEAr/01t?=
 =?us-ascii?Q?jhV03RTVG4W0NaUUfRjgIz8IiGS82Ndq/+SllUozYU99IfgDh/Uv8OhSICRM?=
 =?us-ascii?Q?ASBptIN0DE8jVTPBIEku6j8UxbIkRimxQa0GKK29RXyqacpM3BEanlEo9Cux?=
 =?us-ascii?Q?4yIzcYUumbzsEApKgvEbwyPn3kCa8++K9kay3QsX+iXFPtfW7HSbuJVsdeuh?=
 =?us-ascii?Q?LRrFD7PYtXIORLZSYmKkomWHPUiAModQEqjqMLgE88uFiZT9N3JSiE6mdlEv?=
 =?us-ascii?Q?BIfAgLK5P7c9vI9XIphHxaXF5JISq4gyZYITeVzNXJLpk0UGbkpmg94K+Fbb?=
 =?us-ascii?Q?4/YJEATtLNV6tqSct6kW6iw/XKE3QioqcPYtzYaXY4BkWCtKJmNgTASfjE+Q?=
 =?us-ascii?Q?7U5GSo9/70rSTg97FQY36IlZpND9tmlD8gRoEw6BbLSLBlfFIXCciCo2IIuo?=
 =?us-ascii?Q?JeVRNPJNsR90CkJOfLx1gixWEYaBxTzn/NFE71ZYVoncVvXIm9CwuG6ndXzB?=
 =?us-ascii?Q?YvZcLuWhMrWY1Q1xPK8FN8FrDqpFdO4kE0MlY6zXNV2PznRDi+Vnan4Cx2MU?=
 =?us-ascii?Q?VBhpaW2XnOZ0Bhkko0sn0tRO7byw6Wtv9Tky/hB5Pjji2McaJAjsoOPFE2IK?=
 =?us-ascii?Q?h5WEqWrDnXa24D5r62OpZyLFx5X8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLM3lNkWwWQsPvzxF9Xn3I/OCjz8iFh2ZZoZsXm/56j7q7rI5lXQ9GyR4u5F?=
 =?us-ascii?Q?d2cYk5l52zXyjshgjX5z6zk8dMGwqTVG+eJDDru8n+XlTEdHK8KQxt5qJncs?=
 =?us-ascii?Q?zMrSjM81wLSxtk3oNPh95YkNOI1y6DN0SpcficfpDaqN898dlS25dVMCTqHT?=
 =?us-ascii?Q?6FLCZUtuu5TGvX6+TVegX8sT3NPf0HJX3oN67BNaL1KnF3xzwUu3RUkijUqs?=
 =?us-ascii?Q?RdvgT+AN1+FsABa1adrB2iWzYHse/MAuM85DGyGqVNm1tlWhUWZhqzg/+lRE?=
 =?us-ascii?Q?D6/BKDGLxtBZ5pVFKkDWiMefH5wQBQRj/kH8u3OE/ohqa+WwNJQa+mBcAsS5?=
 =?us-ascii?Q?V6eowfZMiAIPAv1G5ifeAfb7zVlRa3bxSmYDv5TpFUcXxZNwrwyKkh8/QtNb?=
 =?us-ascii?Q?vgItFcM+9M4Fxq3P3d7Pc8p12xfrDltk7gVQae7GyfFKN8CfwJpGlYq2p5G+?=
 =?us-ascii?Q?6mU2cyTM4oNMZp4JchrozkfKml0jVOu9z5guhE1vW7LoC+cvm9dfMC21volR?=
 =?us-ascii?Q?8gfBODUKtwl99ZIDu5Hvk2ubGd3vPqQ89lk3MAZixcGBTtYz6j7kGe/RCOZl?=
 =?us-ascii?Q?iFPa2suxyD/UHBb1AvIDo9jHE5g3t3GA/S01jK0zcKIz423Wu1xmRCoEzWUz?=
 =?us-ascii?Q?7jB88Low9KbMcQPUSelrNbV7etQ6+DbMm6EjFlcSw9za5XTmitec9Fa2yUB2?=
 =?us-ascii?Q?wBBcOsbp9jW8IcO04O5CuJLcfuIfDq7TvuzYtxSa4tZLlh7wgc8vQKgMBjJf?=
 =?us-ascii?Q?oxLcKWwVUTroGbMakuQRcL0E82nU1wNcTm8pRszqPbiuTvfoFLSFPVY/AMj+?=
 =?us-ascii?Q?w9yFeuA0aIvGBjiOUglvhAShlMNOabLViTc09RWbNphru68X1JKHrziY+aaM?=
 =?us-ascii?Q?yi6W9QZ7VF5QFvyXWm7bx1Qwt84KFj3LU7IVl/3wHvV1bZy6YCmwv0QmfQIs?=
 =?us-ascii?Q?WNWPdk36CH2pGGt2DfEqNq5JoBTI8tJQtEb8Bwzh5Ib6SCJDh14NuQnkdYO9?=
 =?us-ascii?Q?zUM2bbl4lNTNh9HkdltcTaEV8umrzUZfgEpt7keG3RzraxkWTF8pQxHYp3+J?=
 =?us-ascii?Q?pm4XkbbLBwMtkdfJ3nJGK1HFc8iA8Ph/DUbYDo26CuZNXVza2UlDLIMWU/E1?=
 =?us-ascii?Q?9iv45+dji+cQex+f9zRCeRKPS4tUTtUVgBPUG+ayreetmRKpHfo8fH1dRmBd?=
 =?us-ascii?Q?gD1UzFyP46ttG7xN+hZAgel8TbaGix1YU54cunb0/qvXDSyQNR1S4YZjKtb9?=
 =?us-ascii?Q?SmrbeIMbzldhcsmqs9cj7Y3ABLeU0D5txmULzOB/TZPPCkWbWhc2/rwlPMPu?=
 =?us-ascii?Q?flpAwfWcgZBg6vZQ76fsiki+L0l+CSNKIjyPOIDIsYH1R1xJPCb9unrcIy3H?=
 =?us-ascii?Q?sJOKkxNjFA9ie92erX1qtik2TmXRvIqLMzZPTIS8lzx3zNsdgPYv1KEHGn60?=
 =?us-ascii?Q?i9Ids7bXwpkfQHbngsx5T7HYAslMCdObODyUDO7RHvGTOgUdPCvf2W6z9AH2?=
 =?us-ascii?Q?y3ceNyZc1wGKx8IRJ0HFtQLs2Gayz39wHIFfZe9YiDf7Ne5apVDTxObAeODq?=
 =?us-ascii?Q?/Af6K8X1PKPNZOjULfaj12HO5VXAk07nNK5CHN3/aeOp+0L9hPKnOUTelpoH?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bFa6i9nVvjk9mBZ/U+98oVUO2ko7kgjGBPuknJtIUHaXEeJZHzu69EnbVjRh4l4Sf47Wf1jPeOLynC+R3qZf0X9+yZWkdWAGp8MmLqxhkj2nDyzLqRyc/X1O6EE0k2OfJZbz1HObYjsBk7ucuj78FZ01RomOfDMIMz004/0QOxcs0IKG3iBx7g7ri8BtneeArtwhNnB69gTgbFRHXT+vbhlAR7lZgNWidYzDugzRZlUDD+4O2MH3EMbHQe+qMvWSfon9pHGBLB3ck2gcD2hJLfZXPfXcNBw50MOjDQXSscfgGjvxboV4BgJguicep/+dugUE/4g/Q3GsjXtGxzTPJk8jdl2kfX4cFK7hU8B4PbyqMcDC1RWQaZgK3Crzla7o6vvANB6LLrA7KOPyyzawIlL67QpdgdwmjnrROgnaIExH+jc09UJSeV348yn4Ozwz+Ep5kXBSpHE5HspeKdtNQrKF7DGS/7TMG87/AzlAQ48JYvUnUx49X5CBkl0M6OfkfoLVMo37H8K/KQQcbeY/jiIAWiI5sGUxTswYsDs4E1T3olOHFAHBDYtbT7NREkdMtZ8GJ2kXb46TwDMYStRrpQSZ3Ikw/eZcjfJHQ+jt8Lo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5709c91a-965a-4446-adc7-08dd66532b92
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 19:29:15.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr1OsulLsMVAKI6eir5TpcE6q7zPcjeLf4RJzjGXEE0+NMCDkqLxD+D7aGYsQdZ8UmB5pvMAjLoGVi16X4+oxYRiJHKDii+5k++S4g1T3TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5899
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180140
X-Proofpoint-GUID: UuhhvB320QkL-SG8NUzBFiEcVg1arH9k
X-Proofpoint-ORIG-GUID: UuhhvB320QkL-SG8NUzBFiEcVg1arH9k

On Thu, Feb 27, 2025 at 02:01:54PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There are many DTrace version numbers (for version, API version,
> package version, etc.).  Meanwhile, _DTRACE_VERSION is not a
> version number at all.  It's a preprocessor macro in USDT .h header
> files.  Prior to commit e2fb0ecd9
> ("Ensure multiple passes through dtrace -G work."), it was perhaps
> not even set.  With that commit, it was always set to 1, with
> the rationale:
> 
>     Also add an explicit define for _DTRACE__VERSION in the generated

__ -> _ (will fix when I merge)

>     header file from 'dtrace -h' invocations.  This seems silly, but
>     it is there to give people a skeleton to work with if they want to
>     pre-generate header files and select whether to actually compile
>     on the probes at a later time.
> 
> Rename to _DTRACE_USE_USDT for better clarity.  Define it only once
> per file.  Place the definition inside an #ifndef test so that a
> developer could set the value without manually changing the file.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_program.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index 23b91fb2e..cfb7a5fc3 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -505,13 +505,12 @@ dt_header_provider(dtrace_hdl_t *dtp, dt_provider_t *pvp, FILE *out)
>  	info.dthi_pfname = alloca(strlen(pvp->desc.dtvd_name) + 1 + i);
>  	dt_header_fmt_func(info.dthi_pfname, pvp->desc.dtvd_name);
>  
> -	if (fprintf(out, "#define _DTRACE_VERSION 1\n\n"
> -			 "#if _DTRACE_VERSION\n\n") < 0)
> +	if (fprintf(out, "#if _DTRACE_USE_USDT\n\n") < 0)
>  		return dt_set_errno(dtp, errno);
>  
>  	if (dt_idhash_iter(pvp->pv_probes, dt_header_probe, &info) != 0)
>  		return -1; /* dt_errno is set for us */
> -	if (fprintf(out, "\n\n") < 0)
> +	if (fprintf(out, "\n") < 0)
>  		return dt_set_errno(dtp, errno);
>  	if (dt_idhash_iter(pvp->pv_probes, dt_header_decl, &info) != 0)
>  		return -1; /* dt_errno is set for us */
> @@ -560,6 +559,11 @@ dtrace_program_header(dtrace_hdl_t *dtp, FILE *out, const char *fname)
>  		"#endif\n\n") < 0)
>  		return -1;
>  
> +	if (fprintf(out, "#ifndef _DTRACE_USE_USDT\n"
> +			 "# define _DTRACE_USE_USDT 1\n"
> +			 "#endif\n\n") < 0)
> +		return -1;
> +
>  	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
>  		if (dt_header_provider(dtp, pvp, out) != 0) {
>  			dt_htab_next_destroy(it);
> -- 
> 2.43.5
> 
