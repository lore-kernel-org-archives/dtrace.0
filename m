Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0B2AD0F
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753127985; cv=fail; b=kgG+aVV9MlFCP3Kn3PQyomohspiPplt8MC6EM5OGcUDCRB7Fp6B6UXyKcpsLAFwdCewcOoA4scyUmmku9xfI+t4UwHk5OV5qZpGBk83EHz0os6Bd3cZYKdrHMfknSESAQjJv/7QtZL/DzJmlO5A0Il26FEVWwL8EPePIYGtEt0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753127985; c=relaxed/simple;
	bh=vB4mF1y7Yhzki07rIZpaaVXt0v4gIn3M8lJ30X5KULw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eZzJmHO+VbaTIazu7IW2JSFisCadA1SqHFKHz25eqN6vF9OiCjuzw5CTkRfwU+8z2xNWD1n+CxQGh80wAX9nmUUiRP0rRS1GN6bHk3qQ+DyJRhBU/4jZI+/bUPM+HpsFcK8KM+9OTYovMTLe1CHH9awECTBBKxMjl7l8hDZevK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NwwBu4KB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k8UZ0Or8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NwwBu4KB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k8UZ0Or8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LHfpEn028880
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 19:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Lmy9cGOjnkvbuXzRP3
	QcjRJaFb3+uL9ckiceseE9S9E=; b=NwwBu4KBbdCiK+601OfRGFTGgTEBUnqLEr
	P7pb43qJuSkSpQIc8Y3zYsbJw7wev3Q6n7B2E/TI79LIzaNZU2Kjiv3vw4pC4pId
	u5pE5Zss7kpfDjcWrQ4YL7jXsHRvfNLof8lgFgJXaYENJaYFEe4N3oDfmb+2RY+E
	OPq036aMjZ/VanGQxO3BfRiesQklW8qim342gv0Wtn+qPfz3TLwW9PzpjHCgpMFk
	TLfw4m/2gjJ819k0n+piAt44Yb14ENrJ9ju0Goxl7T/Vy/Jy38yGMzArUb4qYqO1
	LAnGuFH+bbOWWLfunr9SdCB77wtMzbQ2JwxuEcS3DPhV8+AAEQ/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx3ny1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 19:59:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIBU8d010797
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 19:59:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8f24r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 19:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNt5kIUUwRX/apvLD+6tCyAntmhEtCgnW8B6jO3yK5JDcsg4DvVJ3LF4087eOPV7CBieXjYXjVodnst+gat/V1EFvRLvEWM+CTsP6bVJ3lbZjkTH52sCYc7pNG+1w2Lx3rFYSolcCVTZ66z4ZUf3BtbzjuewG2YSOV2jKaUT9tSt9Pk2TtdnX2PPgsUc1pxccprGJFOvSqt4FXOBDwL2Ufotp+q9wjP0OqNVDAUQM3LZHozS9SXMsDN14l2bGYJioRVF8YVJyni9hxJMTAh/lUUIWLcRfqJNO8EWn+QIkufto3kDjMWN0MXJubuYAwwySY0J6aRKXHC69PxMZ77Uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lmy9cGOjnkvbuXzRP3QcjRJaFb3+uL9ckiceseE9S9E=;
 b=I3/gNk3KOP66RSMdgoMGLnO9X4MSfP09TuHpawKf5cg8HdzJzjwad7BuUIrutYpYdee+ETEx1kV8y8p5pCIozGo7FIXJyyITtPyKwu6RDJgY2fztyUXc6G7tIEbm1BsKp2bPITOq8efXZ3XtZjYni2kFIDtM4moIJHwbX+tCBd1MB1tQdHsxOc3Q1F23qRpFtd6LtlCnWA1Moz42wwfwwi3Lo0FIeMT2wWILn68Di6SUBf1eFuR8PxyiHfE+N/jsC8pnxkKkWOPiyVXA7ZRaRUmTLoN/vICqLKv0dfx5p2H9w1jCSOKBzJMhdfyOQkqsifzlsn78bu6aQdUrugvVOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lmy9cGOjnkvbuXzRP3QcjRJaFb3+uL9ckiceseE9S9E=;
 b=k8UZ0Or8UGswUbLQw0NHPSldOPc8zq4ts2Wp6E8eIpmKm5hoE/FbTrmmGYZnZ0G6LKT8MEnHFlD6QLW4UMV7LysA1qE3nKEp15yugYUPZ7BJ3tA8rREe2x8dvnwkGYhWq86a2K/YVSGy/gXe/ynC7OtF9yB55oxeXGX0Au9w3D0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 19:59:38 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 19:59:32 +0000
Date: Mon, 21 Jul 2025 15:59:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 3/7] test/operators: extend ternary
 tests to cover inet_ntoa*()s
Message-ID: <aH6cIasiadAbfePV@oracle.com>
References: <20250709144700.20591-1-alan.maguire@oracle.com>
 <20250709144700.20591-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709144700.20591-4-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: b94499f0-9f02-4dc6-d19b-08ddc8911c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6lJTcn/Q5NNM8smJJc5KItYia2AUP6yvGgnz/ZaEbux8EXqwIEmClTsR4p/w?=
 =?us-ascii?Q?YUr9+GwXVUhZmTfuyi5SrtTxqc1HWlLTViMbNDVYcO423YJu1vGWJt+n9sMM?=
 =?us-ascii?Q?ySYW7HEogXctdcEKYqLeryaYdWcT4UN9qX/6x+cWe5+BVeMlMj+3AvxlEkCt?=
 =?us-ascii?Q?IhBSI5Iw4C7UVehjiwdOfJd+uPOZfCG4fldHhezWADBfzbkjDnzFRzi3Iop3?=
 =?us-ascii?Q?vjuLtYt1t54i35e6vooMr+cyQH78QxK7d4EXAkcBTAZrKmo5QSeX+X0WLqy8?=
 =?us-ascii?Q?VB0QdioRmeqg6DbLeO5yjwtB3hCpNYZ/z8KD20FaqFNoK6XuhRCfLGtdYE9T?=
 =?us-ascii?Q?yqslZ8RuUtMk/zrKVjnAe90yWX0BoKWNVcvG7V4iPktFKeODnEBmQW2xLvFd?=
 =?us-ascii?Q?ErjJgxC5ieFz5mMbMLCPjULYYXdblT42FK6uBD/ioIWyIvtHEQJWJNp12RaX?=
 =?us-ascii?Q?jqm701gF8P9Pz+VU38U/OWieTVOT1Fyr0xESZtWxbwkjPPV9h8oLqT5xh4Da?=
 =?us-ascii?Q?Q9aKN0jJdHfQsgf+qRHARGxQn2ht/7tbZUo/RQa/ajhxGR0Hi7/3A2Px4Jlf?=
 =?us-ascii?Q?tCouTxTuHJFC/2XbvIDmQQvMq05w2H/mwegu5JpawBoJpv1emv8KsfiZWZ5+?=
 =?us-ascii?Q?CU6tWAqcjd30xsRLdhfNPMbdaZMhU4hCXIrSjEyqX6SwgBFb239OaquTeZq9?=
 =?us-ascii?Q?5TWf/3ARoAU7/L90C8ox4FpH8elHtHvVku4TKxLGw+lznCVi4H5L2Ao+8glA?=
 =?us-ascii?Q?pmPtz0k9UYqDNxfMcIi55DsPzRl8lq+xwhbhI8ecw2W3fH2wbXiwm3MTJMXQ?=
 =?us-ascii?Q?jdTsvPOkmrhOQzQ4QfWOPujEuPyEU0pa4T0VWb3bTx8V7LHwFk0cpBTeow+I?=
 =?us-ascii?Q?0trkmIMmxFOEI7f3Rxok/rT1/cwGCL23OLxXbj/Tbux+oakRhQSjpWf21DK6?=
 =?us-ascii?Q?JG/SQmaA6pyV9IJKl8WqaMAn2bJHoMppOD+JfuJ7M8Obm9B5dwBkMznNTR/0?=
 =?us-ascii?Q?9TZXLx9xpGal4he7KKfA1v4voDcL2Ka8wGVF2uUPEkG1AhHOhGstYLvXB7TT?=
 =?us-ascii?Q?dKmk2rfbWB6RekD3f11yhuDVl2bdWWqEFc4b4GhXdzN29nsNPTAlVnTUoJv1?=
 =?us-ascii?Q?KwO+F9r3GkesDXXmXZ1c2xPK/weruoOfx4CKkesTxOxkD8GSTOZolZgR10jd?=
 =?us-ascii?Q?0ikiD98aYGnCQOK6BS8iERRqDvt5UvQbQwRi3kDKa0fpSBuhU+ryS1OO/nyZ?=
 =?us-ascii?Q?/vrEhwPFaM3NvKaxVHyQS/HXlcgSiQJfrXg9fjpMfvgJvLlTEjuVSbB/Fuky?=
 =?us-ascii?Q?R2Jwh7jmLPkOoqv9Rma2tus72QI7erzetAA2EhcPcJjeF/raKjzcyveyEvBZ?=
 =?us-ascii?Q?3wRqXOKdpXEmQIuuTle8L12ImdNjeN6OhiaSoQuvSqbIdk2KRiDV2kSXKFd4?=
 =?us-ascii?Q?rIsk6dhq+tM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AYUVycqNwAYSQrRvBMg3n9ZtDJmp76SAzma+Ckw5TESXP7YWnKfmPOtoBqWS?=
 =?us-ascii?Q?hL6umRGxrNjIUtW8p7MegmkGQaOkrZwYoLhs6qbcTjuIF69PI5Ma2r9XF5PS?=
 =?us-ascii?Q?BfasGhoNztuMUwwQ7fqoyUHROHKSAgEHWrML65qhTRPCb5u9IyZar6v0hJ1I?=
 =?us-ascii?Q?tD/yZ2nWL4z2BhJYotpvvTsC9lXI04A3aQodQTtjPrmYbIrdZvvXa9aFm48I?=
 =?us-ascii?Q?MKzHkoxG0q7xU7mxbaKuNVF0eyefBrzUEGqnq9X+QeVccVk7VgUG9TqNmn4e?=
 =?us-ascii?Q?9waVgqggZ7TuP+yhDGIN6XgL4SstaK5DthLm+epUdKEsFF/TYjNK9GrkgmKS?=
 =?us-ascii?Q?ftuinZET4YZME/xq74gxqs+qsKPaPwhkcImbfLuzLUMEL0qkt/XsZ1DbGY8z?=
 =?us-ascii?Q?Kl2LzKXIcxKhz/xzyxRI4Q+fUmUezF4UTQPMhCAP7NIP4aKEVEKyT6zWHBB1?=
 =?us-ascii?Q?Z/eOpcgLbXQH+52VxfgOIQVXx8P1rgKcDH+qDB4SNTCdvCBijWb3XqPRogFv?=
 =?us-ascii?Q?17byvTtGFH20M+6//IZlCGvhOe9cvS/TwSO3mKMQPJFgMywnzlf/SFFFBKI9?=
 =?us-ascii?Q?YFIM1tajtAf/8Krkn7A86R/mRjLKdAFYFo6awNERC/3KIBRrtGzrRtqnCLUs?=
 =?us-ascii?Q?vvVgxImkeGEdMuXJsKh61d6NatL8SvNMnIWZldcJmYApYi7N949PcsgeiAr1?=
 =?us-ascii?Q?OwBUePi9XqiqBOMxVSncVp9GW9G/BpwL7B/I3yfB1tzBWynNTPQwpQgF7o9l?=
 =?us-ascii?Q?2kkNYMWtXgB94xwskerlTdUTPu4mJy2d3ymJJY3BXaGJGnM8z9EHC7AJQz0h?=
 =?us-ascii?Q?hC3ANKIF09cToQiG0g9OWRBklsVgR+jREMOA/wqGJ7TjATzeXNpL6OIWEHBW?=
 =?us-ascii?Q?jv/5n9kwzs1m23V2wCWDpZLXUvJ5u2WP/FXol3B+OeEX6TUDif1a9F5wNx36?=
 =?us-ascii?Q?TJ2hmuD/MdTca6K7INrgLMygiX6tgzTNLiFoVhjIHzfwYPd6WbCh4e4YK3SO?=
 =?us-ascii?Q?/Me2gdB4b9i8arw/w+4ssxpaDlhvVYFYcQHBtcITP4oXLVNpgYSWG3vk1s8i?=
 =?us-ascii?Q?zGL65PaPb1LAEN0kigioz1qbHPgcSu1uSTCn0QoRhyk7mY1r2M+SWvDFFtvf?=
 =?us-ascii?Q?QfS2ay4Tmk3mVEI5lzaOrZh0M9AOm7skaTTkk/wQPWG9vAL7wH2Tn3B3kkWK?=
 =?us-ascii?Q?KbVkYRvyUEMbevrQpwPAj6CbriAMLviyIsE6TZjChiUaVDyDnxnsz5MV3I1G?=
 =?us-ascii?Q?4w5+TCBK6UJgvCYFnExpKv4pCCTbkzHTX15hpNTfwkh/pLzZnxb/kJMxkRK8?=
 =?us-ascii?Q?vJBubn4jqIBIpqtHsN9XXp18q4ES9E6E+IDcrMlmqRmZEBQsREiO+kmnRByO?=
 =?us-ascii?Q?zM+iJMuKnrzTfeADWueUulVquSHj2meKBldxfy5C0Uhjn15pMU+k9nslM+pY?=
 =?us-ascii?Q?1IMbwEOkxB7mzOQlzuA47seBUUCkAHNItpX0VtRR+IlCV5W88MnJzgB5g60l?=
 =?us-ascii?Q?mYk6x5S8jqyPJ8dWXk3YyQjg5lYg6E2hwq5Fl4peLyRUjPjHG+7Aexb9OwMf?=
 =?us-ascii?Q?maAmanO7eR7Xa4UCrgWQk8s6Qdkz/eiK6mmBN8piQtT6wjo/W6UQ6NkDB4j8?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YgFOiTSnmlcP7CRmBZ8q0JUb5HEwMb6pJohQRK594mfw1vpL70QCV6aLMWB97jvmQWrbn+H65Pf4LwSs33LNQaqkcQGPYn8/3258r51IsFuWByKaZjlgHz9O//YuZhzXY5CFllwUfx8NPRMbYUNNsZCgsNFO3djh4fSy+2ezjyBtXkmmaIeH1ZYKaL7jQHB/uetdRxiEE6NQMzXNjKBTAZIYmqGDve6ERa+NJ230N/CuuRKHhvmU4/Vq6PddllPO1kwxusdeDtgZjSvgBR7QPV9Ip97GcMlGqKN0qk1Zcoqkj/YsgtOiDG9IlvWDsMq/fieNSPgeUovGM4ekujCbPb/Jmy7GrRcH5ErVVikMDmCl/lp+aD1Hk4t2jiXVyw2aUBPJ6xLHZkKC4VHUBIC0o3kXX5wPjSsHPbbSuvmIWvTRg5Zdq6Rfuj9a6NN7eFStrUV98BVzyaKO6K5GfnU2pmgwFv6VHfi69ATqevpe1uNyvKcU2cYGnK/nclyb4Ald1CDT844rW70DZzoskqTNSdFTwsBizAiGZhlYM4Pk47x+kr8hC31nMi3NK1O8q7eMG4PtCyLUdWP9m71mHNlIWVj/k1E5JJdeVEZ7uQmNjgE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94499f0-9f02-4dc6-d19b-08ddc8911c19
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 19:59:32.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04lNRF9PT0hZ+q8+alefAKeplUztFfP9Tk+TXkGMvQnn/Jf9vpFwRI9nJSmyQHRtX3EJEyo/nfnpOUmB/tq12I3F8uNBqjI/zFaus1u+l6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507210178
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE3NyBTYWx0ZWRfX2ZZI/oWhX31h
 1DiuYgLw0e8MH+OKVk6HqV80taKeqWxGaKl9K4lyCysgNeUEUDZ8go9PyHqhAYS75ld/BLardGy
 aldjXfTm79OHOK+5hIv/j9yP9dnzqEgAI+nTw1941/QyXj0dzWyKmzpBsSN7/t+W9W8Qx28hzqc
 4At+dMxQmdnX0F5AB9OTUuF4HlsonJ2TZYILQaBL3dohhP6euqww6mmUSRQOhTSmq8pYLEWA9uo
 5p918I4DC7JN6MbxQlYq9Oa6sNCytxcPwBleYTekLxUlVdEhoLgEaLQpSZ/WwHguvNTe2sY1nJw
 L2J7MBdcbt0/KtBmEUd2elRdCBHgzIGUeatiqlV7Fin/Sf7456fSOwcJ8/SY/6QWfc90wetGG27
 okSX8OgKxKEN/wziUHvlpfHRTzaUjp2Eou4M6iVqFAA0PfprRZditIcUZ8fLepW+62q8Uhf4
X-Proofpoint-GUID: BdpjUFYlOIrrbLIbqLN2XekQvPP7fUET
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=687e9c2e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=uulGw-uVozrRnsJNSNQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: BdpjUFYlOIrrbLIbqLN2XekQvPP7fUET

On Wed, Jul 09, 2025 at 03:46:56PM +0100, Alan Maguire via DTrace-devel wrote:
> inet_ntoa*() require temporary strings and ternary operators
> need temporaries for left and right; ensure ternary ops succeed
> with inet_ntoa*()s.
> 
> Suggested-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/operators/tst.ternary.d | 20 +++++++++++++++++++-
>  test/unittest/operators/tst.ternary.r |  2 ++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/test/unittest/operators/tst.ternary.d b/test/unittest/operators/tst.ternary.d
> index 9d47fcc2..aeced7ac 100644
> --- a/test/unittest/operators/tst.ternary.d
> +++ b/test/unittest/operators/tst.ternary.d
> @@ -8,7 +8,10 @@
>  /*
>   * ASSERTION:
>   *  Test the ternary operator.  Test left-hand side true, right-hand side true,
> - *  and multiple nested instances of the ternary operator.
> + *  and multiple nested instances of the ternary operator.  Since inet_ntoa*()
> + *  relies on temporary strings, and ternary operators need both left- and
> + *  right-side temporaries, test ternary inet_ntoa*() also.
> + *
>   *
>   * SECTION:  Types, Operators, and Expressions/Conditional Expressions
>   */
> @@ -18,10 +21,25 @@
>  BEGIN
>  {
>  	x = 0;
> +	y = 1;
>  	printf("x is %s\n", x == 0 ? "zero" : "one");
>  	x = 1;
>  	printf("x is %s\n", x == 0 ? "zero" : "one");
>  	x = 2;
>  	printf("x is %s\n", x == 0 ? "zero" : x == 1 ? "one" : "two");
> +	ipaddr = (ipaddr_t *)alloca(sizeof(ipaddr_t));
> +	ipaddr2 = (in6_addr_t *)alloca(sizeof(in6_addr_t));
> +	ipaddr2->in6_u.u6_addr32[0] = 0xffffffff;
> +	ipaddr2->in6_u.u6_addr32[1] = 0xffffffff;
> +	ipaddr2->in6_u.u6_addr32[2] = 0xffffffff;
> +	ipaddr2->in6_u.u6_addr32[3] = 0xffffffff;
> +	printf("ipaddr is %s\n", x > 1 ? inet_ntoa(ipaddr) :
> +				 x > 2 ? inet_ntoa(ipaddr) :
> +				 x > 3 ? inet_ntoa(ipaddr) :
> +				 inet_ntoa(ipaddr));
> +	printf("ipaddr2 is %s\n", x > 1 ? inet_ntoa6(ipaddr2) :
> +				  x > 2 ? inet_ntoa6(ipaddr2) :
> +				  x > 3 ? inet_ntoa6(ipaddr2) :
> +				  inet_ntoa6(ipaddr2));
>  	exit(0);
>  }
> diff --git a/test/unittest/operators/tst.ternary.r b/test/unittest/operators/tst.ternary.r
> index ec30800e..72201682 100644
> --- a/test/unittest/operators/tst.ternary.r
> +++ b/test/unittest/operators/tst.ternary.r
> @@ -1,4 +1,6 @@
>  x is zero
>  x is one
>  x is two
> +ipaddr is 0.0.0.0
> +ipaddr2 is ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
>  
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
