Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389098;
	b=yw1vTITzI0UfuPn7K916ABXSr1VHAWTvq79N2scYkHFIifQsdExi8l5ReaByGN+ZFINY
	 RXpPisdJHi/i1I4NnBBlQLoJSu4QpvMiCcMHgYfU1nX3h11RZWDoD9tt9fhc8pZgtTAgF
	 WjQbikhZSupgnDlb6Hmfzb+nuBwhe2kFfn7BLJFzsc4BP8O8P+wynmjjFR4Pm/qsZFf/F
	 AN7FTtfJINS3L0hXqBaysy+s5FxQCoLcIKGWwtsmoGGDTbzE0Kd4ggK5Cfypy4RUqeEMd
	 sOqXizYUlJfm/mmgoBSyg3eN1ylXBa+GDgfI4mkRbmH7kQ/xPpJTBUW0nUBNMWFupgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=q4AadjzHiUrYKRfw69cNOQWco4jowlAPyZFGT45cp0k=;
	b=G0rJDtPoQgPacdO8T73aC8Q09wysAM78LdXe8u89eYDZUB9Kv/RR+y0SM4WrLkkRH6bk
	 O2ph8CyYlUce9WCN+wOKK/PQ0yz16RFSncnpEJiDxjAIaa5EwYJqT+Swg7hjGoTfnHgZ2
	 IbRmhIJ04paA5vsHhi4KtnOku3hlRHUaQcXSogha+dkVmj3AJiwJCbfYMaHvAg3bVm2jc
	 P3beVYHlKLtFU+F3jkG8re5rAnotWF8/1tPiJ4HvEbVmY/GH90RFLWg/suN8P+bvBQ+QK
	 d2zT0G5l9pms00bXpleUkq8wQdpJttEt0J5KZh23/NU9AH6OEavscrRWp9xqqXWgrVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=mMLn5Wny;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AKm0KHen;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D3606A31C
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=mMLn5Wny;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AKm0KHen
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXrI93605863
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=q4AadjzHiUrYKRfw69cNOQWco4jowlAPyZFGT45cp0k=; b=
	mMLn5WnyPs7VlZqdQgLck37nR6dXusyQ1Oy9NngWivCVm095saPd8zuz+jK7N6Oa
	I1+jGkjm9Fq2/UFsUMw3erxzrIX+iXe/nzEqWhcenscz+si/amU4ixjjkFr1xphD
	au0KDP1j/MO45bDXwzYKMxIDnJIHFd4wU4E/Fys9rTMYpJcyrzZvmZy+OCSaz3Rx
	4h/WrF7FhSthYxLqOwqguuxbe9AOOcRmzAP93qFbXEbXZcJbhoIVFkWop0iqfWz8
	iJHgPOp9FVbgl/xWTbS2L9T6KkQeo9eGGbIuemnixJYbO9aYYW8t7Dlzgv5VUo/h
	+F3RmfIdwuOVyc6BMtT12Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5msc2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UI0btD2477302
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:15 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010032.outbound.protection.outlook.com [40.93.198.32])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hn04v2wfr-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRlTB4IPqXIMzmAUMZvUHU64YESwZxcAaIeIBSlTkFBwhkAfalCcL46uK2z0vt1RRnAYNMl060zNYyerQvmrBRNiqhc1FgFvX9jmNt8WfdnQWR30wpctwsSDQd2btY8s32VWcxrM8Nit75C6H4XOl72jsnWd8CHQUwTZPa/wWlZSILKb7OJOAki0LnBYRyK8r6U5K3Wi8tD+dY+kCvN0nQoIe1dWjajP6dscOqlNA2hI7+yIkua5FdlYYIVNxJidAkydnNbmIQ5Yr7U7HWYeYUYpIq+jL9+eER8Z5cE+27yRh5II57XYfOXnOekaGbkFQCQBMtodrF0FZtxvywyyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4AadjzHiUrYKRfw69cNOQWco4jowlAPyZFGT45cp0k=;
 b=OEDugm3YeEeIqh3zPWmVQEqP5aYiwAagMM7PBTGfrOk0SeDfuM587NO8GWKWDb1IGAnObPHV7ZtRjNzFVi2aNJR6uDhxVWAT6Lilw7esEDQ0v4Y0AwxVqDjDbxSx1LGFKsoIj0fjsHewfiSzjs72cXvGP74OuGDN+3m1X1FWleiM6D9CuU5gRQxtLJf7XWtqffm5DC0XBTwcWApQJW68zBk+ttUEhYMGtRSLV+U/tcVoPBlcG4EqtkyIiDgWpMd67z17NnLheAq/APV2iiACQ1VX0MKmDGQaNEyrkBLvGIUUEnkn8a1oKBmuhZdIsOr50MnZtJFsbKUp/IVw+zFOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4AadjzHiUrYKRfw69cNOQWco4jowlAPyZFGT45cp0k=;
 b=AKm0KHenUrUlMFk0Sm4gO86DjpmWaVekuiH36SXNfruUDgQrmY3K030gAS0C3teigrYE3YbN+FBp/Q4skziPqRbcqmhC23VlPawTo0Y4u5ZXAlFb7fAlPKSSL+9buHqr2t+R/kQzhr/VPSM4Ucw5Fax22ODcEBKCBYER+xvvUc4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SABPR10MB997917.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:12 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:12 +0000
Date: Fri, 30 Oct 2026 19:36:37 +0000
Message-ID: <155d3efad06100688e3878b86d99cdd7@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/20] btf: convert kernel types to CTF on demand
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0020.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::27) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SABPR10MB997917:EE_
X-MS-PublicTrafficType: Email
client-request-id: 35d6ff25-4c6c-4b57-b08c-05139c9d3ff3
request-id: a81a2cdd-5856-4398-d823-08df36bd5580
X-MS-Office365-Filtering-Correlation-Id: a81a2cdd-5856-4398-d823-08df36bd5580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|261009223027099003|261026140227099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261021135927099003|261021130227099003|261022075727099003|261022105027099003|261022113327099003|261022115727099003|261021133027099003|261021123027099003|261021121427099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	W+c67E0dIdMQOsHFIgCR02+F8x/K18ILXcQZbAysDOSxDRbQWR7Y1Zyof/4I1/gT4Cdww9aNE+BFHdcZWGMvtSiQLW5PorPtSeiHVCIg1qhywHwoESwqUjHEpusaF5QkgyA+C6wIS5h04gyQlF1xX+mgMaQtojX/QFwjQ3CZ83gKiirgiXC+EtCLZa1xaAZwOh/m21sbSX8n9NtYGjPfqR9VuwKrirP2dQMpARhA+NoiiWMVQlT20+1jOit3eKkNGLdH2tMf3tMQppdjz1fIQKmQibYa5S4W+i02gerAX88ZQXXLzYjbo9Q7HOp57POyBliD4RWlX0YGJoDjFM2u52XmfEnGsrQ6JUycFTL4zjRNke7ISAcs3Ihu6G7C2lskt80GzV1aiEGXagyhIVWxrsv/n7MwD45lMlm/zYM41SDlS6yKFDUc1tZ+hUwfjwGm8XL/xArCxZIwLj1aPvitF0bGLgFcpyWlfi+en6Jibm3zzty8xkLDUEeVSxoJQRyFK5FUOrLbvGVqntAM7qGwDL8ecAWyh2moidRBcgdYAesjSqte//iOz9Wh1ICU0X7xcXARVzu+98bknm2TN8xOtjlwKv1E/76iRjxwHwA9UhM2x9jPvcaGW1iGBqLyFjFiId/u/Sf1I8VM5tZVC96wCDovJUkncNhCUgB8MZZtDxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(261009223027099003)(261026140227099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261021135927099003)(261021130227099003)(261022075727099003)(261022105027099003)(261022113327099003)(261022115727099003)(261021133027099003)(261021123027099003)(261021121427099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cAGr36D/7ade6UQmD7IUSxQ3M9elPnKAxpXQvByvTjcaRGytvjdN1Q+IyFF2?=
 =?us-ascii?Q?s0xQfgl14eOcqw5dTdjqDhANtjp1DnmvUJFKnrRL/PN3oGJaOOeSUvE/GPnI?=
 =?us-ascii?Q?Tz/BsZmo/DzXWxfIA+DaFX8OA/TXc+2bZHwzqz58QbHH8oFnjWJwc9R40DfB?=
 =?us-ascii?Q?dHd9kj8vVMsvuTCTyfnKgNeLjSy/5j9yVbOLxdTZfAu6npsy87rOc1cLMagf?=
 =?us-ascii?Q?x0ZrS2pzB8CeeX8+lt1GsZ/MkYgpbFVmnhoXFsQdCZlYU+On8uS+fHHdhuVH?=
 =?us-ascii?Q?Dy5HHWjeT7T5XAqhwFmfljXXz6OTYkJQr0n38HoP/EJYKyWXc2dLijMIxIOT?=
 =?us-ascii?Q?JonHJx8hUEq/2p/hgFAqC9AlUJEK/teKpWEjyGMClFPVkrl+c37KoqTAlmsl?=
 =?us-ascii?Q?//aQ5iTALk5YuZvKXB0P0JDAcmeDHsSjXiweINrCgL0dWvDTVMRLvrg2KpT6?=
 =?us-ascii?Q?4QnU04ASJAA8BesXNPKbBIFZvhZRFEBcSFXSaKvB3D2wWWvW/XR8kHUzAB08?=
 =?us-ascii?Q?WGZs2AEuE/Pdze5rpLaPnx8OjREdXK1huNG7GOqYhb8XtPmFYT/iLuUpT9MD?=
 =?us-ascii?Q?0Q+Z+UBXYQjolkYb91t6ekA1DvCZBhAN+RiAg6rHga4Skcu+gWfjcWv2bFZz?=
 =?us-ascii?Q?nzoRzu9H2RZLLfr7N/e7TwQzJ72ifipiQxlIFkg07lkLo6XcI+yEoco9Yqj6?=
 =?us-ascii?Q?ypVtmIhChBVaZzALCSLDthbZutAKywnLuv0xwECqu79aEj5fdXAoonN/Jkgg?=
 =?us-ascii?Q?GgQrxCWH0juvCkoV9OBbemmMqNeZWtbeSgTPn8cqquZ5+H5acKc2gLxg/VRg?=
 =?us-ascii?Q?A6tZUONQ/qVxsmqnc7Mf87/Je53h/+D2E30gz+6crR7QMRgVNnf5QZpc8dRQ?=
 =?us-ascii?Q?GP9NieZ/DMmZBdNFax6t0WQYYEqeH6ugtmrvSdSueVaLw/ZA2IBw0pd7S4cc?=
 =?us-ascii?Q?yOMpRwLf2ex2RdJBJObq/bheYbDfi6ct9AQrnnuWPeuzX7STJYzUqJSS2vZ6?=
 =?us-ascii?Q?9TYYQKdLpC+Ei+JNxoZr6exN92FYtuyU+6iN7GpneVOmxQ9B/jNYv0aFgaaP?=
 =?us-ascii?Q?8UEgrfKRf391ndagq88OravWz1EG406wcZFQ57f+O3pClDYF5WkHu1KWGmg/?=
 =?us-ascii?Q?dHkUF1owp7R8NrnMyljF1A277cDl7iW97FSP/2xdkHRx1yFc0CXtR9pnIuD2?=
 =?us-ascii?Q?RujrjPhK3NTSVQmUZd6WpamFfBMaYAVpjY5gZL5di7b4H11sFKNSDzFi9DiV?=
 =?us-ascii?Q?mun4vQrJtIkco2P8ZRgcFb/CdwnlYxsDB+eukEz6Hc/si0Q1hhG46weebkFH?=
 =?us-ascii?Q?o4FjlvbfVtjdlmjr6GLCICmQKHP4I6MwTP49DDtuTEYBGumt/DXAmdJTjW0H?=
 =?us-ascii?Q?fRE3bTSDjj1SioXqFSlpF7g2A8bE+v4hmvCit6GRk7W3PCV4SD3xOFq5fdvR?=
 =?us-ascii?Q?e2F2EevnieXdTYrrLK65oKMpykwu60pCOraT/6Ih27TVa1cmx1cioO464Rc8?=
 =?us-ascii?Q?iK5GTaOB+PNm7MoGoQZNovJ1CvnOlaP3z8uqaJnfm/16qRKPcQbiTDjC8JbU?=
 =?us-ascii?Q?eUbfQU4JE9Mvh8DE7gBmjEX+ZQ9WB8sZM6q9wSGMQrKv+YQ0c8TDWV7iJKa5?=
 =?us-ascii?Q?80BfuWKErDF2OM+n8GnL2Sa3xAES/V4pSOQIoa547ukRvZxClHlgpteYnil/?=
 =?us-ascii?Q?nsd3BdvXauK+/d5u28x5cUuwkABMVA0vmeLKl+hhB1wve9D5pv7PnxjWO9pu?=
 =?us-ascii?Q?DdbQ1ZvE9AIXXa/i/aTMmvdaxrt4+yE=3D?=
X-Exchange-RoutingPolicyChecked:
	tLZmdunjZrbgjC1pYD8GUSb7biyXraU57Nup/lOc1h2zuc4CD33Naeh7MVUN+XwKAwuZIPQFJkByxQvLoyyGh3/4VXKFiPc5XKqPOomTIryIHqyE6xcytOL45e25Onh8BaBJXGIXoeXd+mrAYMCKrOe7MvMLfexuWiUyLFo6jFey9t5GNAg7Q+A6S1+wodcMTg1st/vlxc+ESCQMnb20pQoO2GRVlzHgptV+45NXsG6++RTgz3CC04CPD2/5+WoGb3wpQdzd9kqUNXOPYyjcX0Yv+ccHCKDTLxf+lOtgKxJyIyFP/fMZzxilZe80Y3gApXVsspgz8d0o2bOOA/oiCg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o/zm8AmfJTbz+1G8g5iyWchBW0yGPgPhw0TUTepMLgF7sjfL/ZHN1In1SKlRcW2bQ2B0QsBCjzxVJMuTibcoQkDf9Fepnsx3L2p1TGTIDBtZiHXSO/NJT7TqpHOZBb4CTIxTrZrSQ70t3VwiBlndlkHd6la6yxzHDb3mYVHC889Xbohz6zWmFjtC+uM/0nSDa+YTBpKl8xx48rsctQJpt0otvJavNIMt79YlSPyRLXWXcWq6G+JtF9NMduPZwgr1RAnF/FOwPtDDxqLTulVrIWPKikVoa1+MTsm7mJckaSUxz8bdfZsKjvlOtCtEwG+y+p91p5s88w3UPr3iCEk0GyghneJEqnnEeC6+Z06lHDdglX/dfaULyijp+JdRdv3aYWdnFor+e7OKMkpoezTv26YDcKHDPvG2f/HAFdpwZl9EyT4sMrQqjfg2HlAC1HwnzGMGUKLcPNQTEp7uoGtKOjirhqwghzVG8BuiqyExLopVrmrR/QrHpr4fS/C7Wt0MpN5CWlEgQJXAvimDHzIogakBJzLZrDFNgkc+SZ2AKGI+kk/cgbw6Is4acUy2kdIEC6llvgH8cwjge235oUhV6iIHRsXdMFun263G+EjSE2A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81a2cdd-5856-4398-d823-08df36bd5580
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:12.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdanEmGk1ar9vjZkdjlDxj4e9HmZpW6VLB4mBG7c3px3EoYCzkVFCX1vL9H2ScvIKeGkBUyOjoR8Dt6nH/0WGX3oqZ5kemIKAS+Oh6ktBJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXz7Z8JUDcxc7c
 e7Os71pFAoCbLrmjWqyNfEKswv+QxfQeHnIhhwqtxRqGqI651ELfF351ky5bf+HBXh8W9HblpFF
 ofJVwCg/P4UXvsTmTU56XZpBw9Jils4sR4UQFAvHei5enPswLeyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX+3qXPFm1wnKs
 1c9PX1NrPxcRglbWuJdRi2moiuqlAmJ+dt7lD8xZ7MzwrbkLJz6Dt0pr5qlvFx4x6P45XFgRcuN
 6xRbb08rn/xCwEDK2iNBwYJ6o9CJx2Yhcq9whCIaOsxdAddBjgqSCiIjGPjQ0+O5n9NfJo3IQmR
 /mFMZ1APHz/kwndkUTsgTlheupqfLCYlPWqVRjxhRyCE15rFhj/yo7nW50CERmXCUrq1ycvyz5+
 rV5Cy9XozKQ9LR6rLTDqtG998j90YAljoLsz6PxdUT6Eflp9ai6V+gc2N9fAsDWoz/34d5rNr7m
 A0GVe3ybpRg4JcE2oQZLoc5XVCezlwqcVvQ+OdHZTOOB2XQw/l0TEY8sGKYU3SS6r8tsy4243CY
 QFX7aWMeOOgRCex9Qj49VjsQEfRvDe6Nwe7on80+5zYf+AXXKWgODlmXcpaSvGjWNRPM9ujLjlD
 dk2PBmwfTr/Cud85p8Hi8BntxxZKQDcjRAU8IDSE=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ae4f228 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=c9ekP5DMDtyA2ba1nCQA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-GUID: EeVFk0PIOKk9BNpSRFSove50usrO5IIE
X-Proofpoint-ORIG-GUID: EeVFk0PIOKk9BNpSRFSove50usrO5IIE

Index BTF type names while decoding, and initialize CTF dictionaries without
converting every BTF type.  Materialize requested named types and their
reachable dependencies through a common CTF lookup helper, including direct
compiler and provider lookups of shared kernel types.

Reserve aggregate shells before converting references so recursive typedefs
and callback prototypes work regardless of the requested root.  Grow the
shared parent dictionary lazily for split BTF, and roll back newly added
CTF types and cache entries when conversion fails.  Prefer available
aggregate definitions over forward references.

Advance the BTF function parameter iterator and preserve packed member
offsets so converted prototypes and conversion retries retain their BTF
information.

Reject split conversion when archive-backed shared CTF has no matching
BTF-to-CTF parent mapping, leaving the module to the existing CTF fallback.
Keep this guard with lazy conversion so provider header generation also
works when the kernel CTF archive is present.

Add synthetic coverage for lazy conversion, recursive graphs, pointer
lookups, bitfields, forwards, split and parent-only BTF, failure recovery,
and ordinary CTF dictionaries.
---
 libdtrace/dt_btf.c                   | 538 +++++++++++++++++++++++----
 libdtrace/dt_cc.c                    |  15 +-
 libdtrace/dt_cg.c                    |   2 +-
 libdtrace/dt_decl.c                  |   2 +-
 libdtrace/dt_impl.h                  |   3 +
 libdtrace/dt_module.c                |   6 +-
 libdtrace/dt_prov_proc.c             |   2 +-
 libdtrace/dt_provider_tp.c           |   2 +-
 test/internals/btf/tst.lazy-types.sh |  15 +
 test/triggers/Build                  |  11 +-
 test/triggers/btf-lazy-types.c       | 277 ++++++++++++++
 test/triggers/shared-ctf.c           |   5 +
 12 files changed, 788 insertions(+), 90 deletions(-)
 create mode 100755 test/internals/btf/tst.lazy-types.sh
 create mode 100644 test/triggers/btf-lazy-types.c

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 039742d1..617b0128 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -7,6 +7,7 @@
 
 #include <assert.h>
 #include <byteswap.h>
+#include <ctype.h>
 #include <errno.h>
 #include <stdio.h>
 #include <sys/mman.h>
@@ -36,6 +37,18 @@ struct dt_btf {
 	uint32_t	type_cnt;		/* number of types */
 	btf_type_t	**types;		/* type table */
 	ctf_id_t	*ctfids;		/* matching CTF type ids */
+	uint32_t	*names;			/* name hash bucket heads */
+	uint32_t	*name_next;		/* name hash chains */
+	uint8_t		*ctf_state;		/* conversion state */
+	uint32_t	*ctf_pending;		/* ids visited since snapshot */
+	uint32_t	ctf_pending_cnt;
+};
+
+enum {
+	DT_BTF_CTF_IDLE,
+	DT_BTF_CTF_BUSY,
+	DT_BTF_CTF_SHELL,
+	DT_BTF_CTF_PREPARED
 };
 
 static btf_type_t	btf_void;
@@ -146,6 +159,33 @@ dt_btf_get_string(const dt_btf_t *btf, uint32_t off)
 	return NULL;
 }
 
+/* Index names by BTF kind, preserving the first matching BTF id. */
+static int
+dt_btf_index_names(dtrace_hdl_t *dtp, dt_btf_t *btf)
+{
+	uint32_t i;
+
+	btf->names = dt_calloc(dtp, btf->type_cnt, sizeof(uint32_t));
+	btf->name_next = dt_calloc(dtp, btf->type_cnt, sizeof(uint32_t));
+	if (btf->names == NULL || btf->name_next == NULL)
+		return dt_btf_set_errno(dtp, ENOMEM);
+
+	for (i = btf->type_cnt - 1; i > 0; i--) {
+		btf_type_t *type = btf->types[i];
+		const char *name = dt_btf_get_string(btf, type->name_off);
+		uint32_t slot;
+
+		if (name[0] == '\0')
+			continue;
+		slot = str2hval(name, BTF_INFO_KIND(type->info)) %
+		       btf->type_cnt;
+		btf->name_next[i] = btf->names[slot];
+		btf->names[slot] = i;
+	}
+
+	return 0;
+}
+
 static int
 dt_btf_validate_header(dtrace_hdl_t *dtp, dt_btf_t *btf)
 {
@@ -303,7 +343,7 @@ dt_btf_decode(dtrace_hdl_t *dtp, dt_btf_t *btf)
 	if (ptr != end)
 		return dt_btf_set_errno(dtp, EINVAL);
 
-	return 0;
+	return dt_btf_index_names(dtp, btf);
 }
 
 /*
@@ -459,6 +499,8 @@ dt_btf_load_file(dtrace_hdl_t *dtp, const char *fn, const dt_btf_t *parent)
 
 		dt_free(dtp, btf->data);
 		dt_free(dtp, btf->types);
+		dt_free(dtp, btf->names);
+		dt_free(dtp, btf->name_next);
 		memset(btf, 0, sizeof(*btf));
 		btf->parent = parent;
 	}
@@ -541,6 +583,10 @@ dt_btf_destroy(dtrace_hdl_t *dtp, dt_btf_t *btf)
 	dt_free(dtp, btf->data);
 	dt_free(dtp, btf->types);
 	dt_free(dtp, btf->ctfids);
+	dt_free(dtp, btf->names);
+	dt_free(dtp, btf->name_next);
+	dt_free(dtp, btf->ctf_state);
+	dt_free(dtp, btf->ctf_pending);
 	dt_free(dtp, btf);
 }
 
@@ -559,36 +605,22 @@ dt_ctf_error(dtrace_hdl_t *dtp, ctf_dict_t *ctf)
 	return dt_ctf_set_errno(dtp, ctf_errno(ctf));
 }
 
+static uint32_t dt_btf_lookup_name_kind2(const dt_btf_t *, int32_t,
+					 const char *, uint32_t);
+
+static ctf_id_t dt_btf_add_to_ctf(dtrace_hdl_t *, dt_btf_t *,
+				ctf_dict_t *, uint32_t);
+
 static ctf_id_t
-dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
-		  uint32_t type_id)
+dt_btf_add_type(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
+		uint32_t type_id)
 {
-	const dt_btf_t	*shared_btf = btf->parent;
 	btf_type_t	*type;
 	int		kind, vlen;
 	const char	*name;
 	ctf_id_t	ctfid;
 	ctf_encoding_t	enc;
 
-	/*
-	 * If we already have shared_ctf, we may be looking for a type in that
-	 * shared_ctf.
-	 */
-	if (dt_module_shared_ctf(dtp) && shared_btf != NULL) {
-		if (type_id < shared_btf->type_cnt)
-			return shared_btf->ctfids[type_id];
-
-		if (shared_btf->type_cnt > 0)
-			type_id -= shared_btf->type_cnt - 1;
-	}
-
-	assert(type_id < btf->type_cnt);
-
-	if (btf->ctfids[type_id] != CTF_ERR)
-		return btf->ctfids[type_id];
-
-	assert(type_id > 0);
-
 	type = btf->types[type_id];
 	kind = BTF_INFO_KIND(type->info);
 	vlen = BTF_INFO_VLEN(type->info);
@@ -596,7 +628,7 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 	if (name == NULL)
 		return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 
-	if (name[0]) {
+	if (name[0] && btf->ctfids[type_id] == CTF_ERR) {
 		char	n[DT_TYPE_NAMELEN];
 
 		/* Do we already have this type? */
@@ -624,7 +656,9 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 			ctfid = ctf_lookup_by_name(ctf, name);
 		}
 
-		if (ctfid != CTF_ERR) {
+		if (ctfid != CTF_ERR &&
+		    !((kind == BTF_KIND_STRUCT || kind == BTF_KIND_UNION) &&
+		      ctf_type_kind(ctf, ctfid) == CTF_K_FORWARD)) {
 			btf->ctfids[type_id] = ctfid;
 			return ctfid;
 		}
@@ -776,20 +810,14 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 		int		i;
 		btf_member_t	*item = (btf_member_t *)(type + 1);
 
-		if (kind == BTF_KIND_STRUCT)
-			ctfid = ctf_add_struct_sized(ctf, CTF_ADD_ROOT, name,
-						     type->size);
-		else
-			ctfid = ctf_add_union_sized(ctf, CTF_ADD_ROOT, name,
-						    type->size);
-
-		btf->ctfids[type_id] = ctfid;
-		if (ctfid == CTF_ERR)
-			return dt_ctf_error(dtp, ctf);
+		/* The preparation pass reserved this aggregate's type id. */
+		ctfid = btf->ctfids[type_id];
+		assert(ctfid != CTF_ERR);
 
 		for (i = 0; i < vlen; i++, item++) {
 			int		err;
 			ctf_id_t	mbid;
+			uint32_t	offset = item->offset;
 			const char	*mname;
 
 			mbid = dt_btf_add_to_ctf(dtp, btf, ctf, item->type);
@@ -803,7 +831,7 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 				enc.cte_format = 0;
 				enc.cte_offset = 0;
 				enc.cte_bits = BTF_MEMBER_BITFIELD_SIZE(item->offset);
-				item->offset = BTF_MEMBER_BIT_OFFSET(item->offset);
+				offset = BTF_MEMBER_BIT_OFFSET(item->offset);
 
 				if (enc.cte_bits > 0) {
 					int	kind;
@@ -831,7 +859,7 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 			}
 
 			err = ctf_add_member_offset(ctf, ctfid, mname, mbid,
-						    item->offset);
+						    offset);
 			if (err == CTF_ERR)
 				return dt_ctf_error(dtp, ctf);
 		}
@@ -850,7 +878,7 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 		if (ctc.ctc_return == CTF_ERR)
 			return CTF_ERR;
 
-		for (i = 0; i < vlen; i++) {
+		for (i = 0; i < vlen; i++, item++) {
 			argv[i] = dt_btf_add_to_ctf(dtp, btf, ctf, item->type);
 			if (argv[i] == CTF_ERR)
 				return CTF_ERR;
@@ -902,13 +930,186 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 	assert(0);
 }
 
+/* Resolve shared ids in the shared dictionary, which also grows lazily. */
+static ctf_id_t
+dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
+		  uint32_t type_id)
+{
+	const dt_btf_t *parent = btf->parent;
+	ctf_id_t id;
+
+	if (parent != NULL && dt_module_shared_ctf(dtp) != NULL) {
+		if (type_id < parent->type_cnt)
+			return dt_btf_add_to_ctf(dtp, (dt_btf_t *)parent,
+					       dt_module_shared_ctf(dtp), type_id);
+		if (parent->type_cnt > 0)
+			type_id -= parent->type_cnt - 1;
+	}
+
+	if (type_id >= btf->type_cnt && type_id != 0)
+		return dt_ctf_set_errno(dtp, ECTF_BADID);
+	if (btf->ctfids[type_id] != CTF_ERR)
+		return btf->ctfids[type_id];
+	if (btf->ctf_state[type_id] == DT_BTF_CTF_BUSY)
+		return dt_ctf_set_errno(dtp, ECTF_CORRUPT);
+
+	btf->ctf_state[type_id] = DT_BTF_CTF_BUSY;
+	id = dt_btf_add_type(dtp, btf, ctf, type_id);
+	btf->ctf_state[type_id] = DT_BTF_CTF_IDLE;
+	if (id != CTF_ERR)
+		btf->ctfids[type_id] = id;
+	return id;
+}
+
+/*
+ * Reserve aggregate shells before converting references.  Starting at a
+ * typedef or pointer must handle the same recursive graphs as starting at
+ * the struct itself.  The pending list also journals cache changes for
+ * rollback.  SHELL denotes an aggregate whose members still need adding;
+ * PREPARED denotes a visited non-aggregate in this preparation pass.
+ */
+static int
+dt_btf_ctf_prepare(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
+		   uint32_t type_id)
+{
+	const dt_btf_t *parent = btf->parent;
+	btf_type_t *type;
+	uint32_t kind, vlen, i;
+
+	if (parent != NULL && dt_module_shared_ctf(dtp) != NULL) {
+		if (type_id < parent->type_cnt)
+			return dt_btf_ctf_prepare(dtp, (dt_btf_t *)parent,
+						  dt_module_shared_ctf(dtp), type_id);
+		if (parent->type_cnt > 0)
+			type_id -= parent->type_cnt - 1;
+	}
+	if (type_id >= btf->type_cnt && type_id != 0)
+		return dt_ctf_set_errno(dtp, ECTF_BADID);
+	if (btf->ctfids[type_id] != CTF_ERR || btf->ctf_state[type_id])
+		return 0;
+
+	btf->ctf_pending[btf->ctf_pending_cnt++] = type_id;
+	btf->ctf_state[type_id] = DT_BTF_CTF_PREPARED;
+	type = btf->types[type_id];
+	kind = BTF_INFO_KIND(type->info);
+	vlen = BTF_INFO_VLEN(type->info);
+
+	switch (kind) {
+	case BTF_KIND_STRUCT:
+	case BTF_KIND_UNION: {
+		const char *name = dt_btf_get_string(btf, type->name_off);
+		char n[DT_TYPE_NAMELEN];
+		ctf_id_t id = CTF_ERR;
+		btf_member_t *members = (btf_member_t *)(type + 1);
+
+		if (name[0] != '\0') {
+			snprintf(n, sizeof(n), "%s %s",
+				 kind == BTF_KIND_STRUCT ? "struct" : "union",
+				 name);
+			id = ctf_lookup_by_name(ctf, n);
+		}
+		if (id != CTF_ERR && ctf_type_kind(ctf, id) != CTF_K_FORWARD) {
+			btf->ctfids[type_id] = id;
+			return 0;
+		}
+		if (kind == BTF_KIND_STRUCT)
+			id = ctf_add_struct_sized(ctf, CTF_ADD_ROOT, name,
+						  type->size);
+		else
+			id = ctf_add_union_sized(ctf, CTF_ADD_ROOT, name,
+						 type->size);
+		if (id == CTF_ERR)
+			return dt_ctf_error(dtp, ctf);
+		btf->ctfids[type_id] = id;
+		btf->ctf_state[type_id] = DT_BTF_CTF_SHELL;
+		for (i = 0; i < vlen; i++) {
+			if (dt_btf_ctf_prepare(dtp, btf, ctf,
+					       members[i].type) < 0)
+				return -1;
+		}
+		return 0;
+	}
+	case BTF_KIND_FWD: {
+		const char *name = dt_btf_get_string(btf, type->name_off);
+		uint32_t target = dt_btf_lookup_name_kind2(btf, 0, name,
+			BTF_INFO_KFLAG(type->info) ? BTF_KIND_UNION :
+						   BTF_KIND_STRUCT);
+		uint32_t base = parent != NULL && parent->type_cnt > 0 ?
+				parent->type_cnt - 1 : 0;
+
+		/* Prefer a definition before publishing a forward type. */
+		if (target != BTF_TYPE_NONE) {
+			if (dt_btf_ctf_prepare(dtp, btf, ctf,
+					       target + base) < 0)
+				return -1;
+			btf->ctfids[type_id] = btf->ctfids[target];
+		}
+		return 0;
+	}
+	case BTF_KIND_ARRAY: {
+		btf_array_t *array = (btf_array_t *)(type + 1);
+
+		if (dt_btf_ctf_prepare(dtp, btf, ctf, array->index_type) < 0)
+			return -1;
+		return dt_btf_ctf_prepare(dtp, btf, ctf, array->type);
+	}
+	case BTF_KIND_FUNC_PROTO: {
+		btf_param_t *params = (btf_param_t *)(type + 1);
+
+		for (i = 0; i < vlen; i++) {
+			if (dt_btf_ctf_prepare(dtp, btf, ctf,
+					       params[i].type) < 0)
+				return -1;
+		}
+		/* Fall through to prepare the return type. */
+	}
+	case BTF_KIND_PTR:
+	case BTF_KIND_CONST:
+	case BTF_KIND_VOLATILE:
+	case BTF_KIND_RESTRICT:
+	case BTF_KIND_TYPEDEF:
+	case BTF_KIND_TYPE_TAG:
+		return dt_btf_ctf_prepare(dtp, btf, ctf, type->type);
+	default:
+		return 0;
+	}
+}
+
+static int
+dt_btf_ctf_finish(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf)
+{
+	uint32_t i;
+
+	for (i = 0; i < btf->ctf_pending_cnt; i++) {
+		uint32_t id = btf->ctf_pending[i];
+
+		if (btf->ctf_state[id] == DT_BTF_CTF_SHELL &&
+		    dt_btf_add_type(dtp, btf, ctf, id) == CTF_ERR)
+			return -1;
+		btf->ctf_state[id] = DT_BTF_CTF_IDLE;
+	}
+	return 0;
+}
+
 static ctf_dict_t *
 dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 {
-	int		i, base = 0;
+	uint32_t	i, count;
 	ctf_dict_t	*ctf;
 	ctf_encoding_t	enc = { CTF_INT_SIGNED, 0, 0 };
 
+	/*
+	 * Split BTF requires the parent's BTF-to-CTF id mapping.  When shared
+	 * CTF comes from an archive, the parent BTF is not converted and its
+	 * ids cannot be used in that dictionary.  Leave the module to the
+	 * normal CTF fallback rather than mixing the two type sources.
+	 */
+	if (dmp != NULL && btf != NULL && btf->parent != NULL &&
+	    btf->parent->ctfids == NULL) {
+		dt_ctf_set_errno(dtp, ECTF_NOTSUP);
+		return NULL;
+	}
+
 	ctf = ctf_create(&dtp->dt_ctferr);
 	if (ctf == NULL)
 		return NULL;
@@ -926,8 +1127,7 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 		if (err == CTF_ERR ||
 		    ctf_parent_name_set(ctf, "shared_ctf") == CTF_ERR) {
 			dt_ctf_error(dtp, ctf);
-			ctf_close(ctf);
-			return NULL;
+			goto fail;
 		}
 
 		ctf_setspecific(ctf, dmp);
@@ -946,8 +1146,16 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 	if (!dmp && !btf->type_cnt)
 		btf->type_cnt = 1;
 
-	btf->ctfids = dt_calloc(dtp, btf->type_cnt, sizeof(ctf_id_t));
-	for (i = 1; i < btf->type_cnt; i++)
+	count = btf->type_cnt ? btf->type_cnt : 1;
+	btf->ctfids = dt_calloc(dtp, count, sizeof(ctf_id_t));
+	btf->ctf_state = dt_calloc(dtp, count, sizeof(uint8_t));
+	btf->ctf_pending = dt_calloc(dtp, count, sizeof(uint32_t));
+	if (btf->ctfids == NULL || btf->ctf_state == NULL ||
+	    btf->ctf_pending == NULL) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		goto fail;
+	}
+	for (i = 0; i < count; i++)
 		btf->ctfids[i] = CTF_ERR;
 
 	/*
@@ -958,39 +1166,29 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
 		btf->ctfids[0] = ctf_add_integer(ctf, CTF_ADD_ROOT, "void",
 						 &enc);
 		if (btf->ctfids[0] == CTF_ERR)
-			dt_dprintf("Could not create 'void' CTF entry.\n");
-	} else {
-		/*
-		 * Any module other than 'vmlinux' inherits the types from
-		 * 'vmlinux'.
-		 * Shared types are 1 through btf->parent->type_cnt - 1
-		 * (base).
-		 * A module's types are base through base + btf->type_cnt - 1,
-		 * but the types are stored in the BTF types array with indexes
-		 * 1 through btf->type_cnt - 1.
-		 */
-		if (btf->parent != NULL && btf->parent->type_cnt > 0)
-			base = btf->parent->type_cnt - 1;
-	}
-
-	for (i = 1; i < btf->type_cnt; i++) {
-		int	type_id = i + base;
-
-		if (dt_btf_add_to_ctf(dtp, btf, ctf, type_id) == CTF_ERR) {
-			dt_dprintf("BTF-to-CTF error: %s\n",
-				   ctf_errmsg(dtp->dt_ctferr));
-			break;
-		}
-	}
+			goto fail;
+	} else
+		btf->ctfids[0] = dtp->dt_exec->dm_btf->ctfids[0];
 
 out:
 	if (ctf_update(ctf) == CTF_ERR) {
 		dt_ctf_error(dtp, ctf);
-		ctf_close(ctf);
-		return NULL;
+		goto fail;
 	}
 
 	return ctf;
+
+fail:
+	ctf_close(ctf);
+	if (btf != NULL) {
+		dt_free(dtp, btf->ctfids);
+		dt_free(dtp, btf->ctf_state);
+		dt_free(dtp, btf->ctf_pending);
+		btf->ctfids = NULL;
+		btf->ctf_state = NULL;
+		btf->ctf_pending = NULL;
+	}
+	return NULL;
 }
 #endif
 
@@ -1025,7 +1223,7 @@ dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		shared->dm_flags |= DT_DM_LOADED;
 	}
 
-	ctf = dt_btf_to_ctf(dtp, dmp, btf);
+	ctf = dt_btf_to_ctf(dtp, dmp, dmp == dtp->dt_exec ? NULL : btf);
 
 	dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
 		   btf->type_cnt);
@@ -1040,17 +1238,17 @@ dt_btf_lookup_name_kind2(const dt_btf_t *btf, int32_t base, const char *name,
 {
 	uint32_t	i;
 
-	/* Look through the type data for a match. */
-	for (i = 1; i < btf->type_cnt; i++) {
-		const btf_type_t	*type = btf->types[i];
-		const char		*str;
+	if (btf->names == NULL || btf->type_cnt == 0)
+		return BTF_TYPE_NONE;
+
+	i = btf->names[str2hval(name, kind) % btf->type_cnt];
+	for (; i != 0; i = btf->name_next[i]) {
+		const btf_type_t *type = btf->types[i];
+		const char *str;
 
 		if (BTF_INFO_KIND(type->info) != kind)
 			continue;
-
 		str = dt_btf_get_string(btf, type->name_off);
-		if (str == NULL)
-			continue;
 		if (strcmp(name, str) == 0)
 			return i + base;
 	}
@@ -1058,6 +1256,192 @@ dt_btf_lookup_name_kind2(const dt_btf_t *btf, int32_t base, const char *name,
 	return BTF_TYPE_NONE;
 }
 
+#ifdef HAVE_LIBCTF
+/* Find a CTF-visible name without converting unrelated BTF types. */
+static uint32_t
+dt_btf_named_type(const dt_btf_t *btf, const char *name)
+{
+	uint32_t id, kind, base = 0;
+	const char *tag = name;
+
+	if (btf->parent != NULL) {
+		id = dt_btf_named_type(btf->parent, name);
+		if (id != BTF_TYPE_NONE)
+			return id;
+		if (btf->parent->type_cnt > 0)
+			base = btf->parent->type_cnt - 1;
+	}
+
+	if (strncmp(name, "struct ", 7) == 0) {
+		kind = BTF_KIND_STRUCT;
+		tag += 7;
+	} else if (strncmp(name, "union ", 6) == 0) {
+		kind = BTF_KIND_UNION;
+		tag += 6;
+	} else if (strncmp(name, "enum ", 5) == 0) {
+		kind = BTF_KIND_ENUM;
+		tag += 5;
+	} else {
+		static const uint32_t kinds[] = {
+			BTF_KIND_INT, BTF_KIND_FLOAT, BTF_KIND_TYPEDEF
+		};
+		size_t i;
+
+		for (i = 0; i < sizeof(kinds) / sizeof(kinds[0]); i++) {
+			id = dt_btf_lookup_name_kind2(btf, base, name,
+						    kinds[i]);
+			if (id != BTF_TYPE_NONE)
+				return id;
+		}
+		return BTF_TYPE_NONE;
+	}
+
+	id = dt_btf_lookup_name_kind2(btf, base, tag, kind);
+	if (id != BTF_TYPE_NONE || kind == BTF_KIND_ENUM)
+		return id;
+
+	id = dt_btf_lookup_name_kind2(btf, base, tag, BTF_KIND_FWD);
+	if (id != BTF_TYPE_NONE) {
+		const btf_type_t *type = dt_btf_type_by_id(btf, id);
+
+		if (!!BTF_INFO_KFLAG(type->info) != (kind == BTF_KIND_UNION))
+			return BTF_TYPE_NONE;
+	}
+	return id;
+}
+
+/* Discard the cache entries belonging to a failed conversion transaction. */
+static void
+dt_btf_ctf_abort(dt_btf_t *btf, ctf_dict_t *ctf, ctf_snapshot_id_t snap)
+{
+	ctf_rollback(ctf, snap);
+	while (btf->ctf_pending_cnt > 0) {
+		uint32_t id = btf->ctf_pending[--btf->ctf_pending_cnt];
+
+		btf->ctfids[id] = CTF_ERR;
+		btf->ctf_state[id] = DT_BTF_CTF_IDLE;
+	}
+}
+#endif
+
+/*
+ * All CTF name lookups that can reach kernel BTF go through this helper.
+ * Existing CTF dictionaries still use libctf's normal lookup behavior.
+ */
+ctf_id_t
+dt_ctf_lookup_by_name(dtrace_hdl_t *dtp, ctf_file_t *ctf, const char *name)
+{
+#ifdef HAVE_LIBCTF
+	dt_module_t *dmp;
+	dt_btf_t *btf = NULL, *parent;
+	ctf_snapshot_id_t snap, psnap;
+	ctf_id_t id;
+	uint32_t bid;
+	char base[DT_TYPE_NAMELEN];
+	const char *p = name;
+	size_t len = 0;
+	unsigned int pointers = 0;
+
+	/* vmlinux imports shared types; convert them in the owning parent. */
+	if (dtp->dt_exec != NULL && ctf == dtp->dt_exec->dm_ctfp &&
+	    !(dtp->dt_exec->dm_flags & DT_DM_CTF_ARCHIVED) &&
+	    ctf_parent_dict(ctf) == dt_module_shared_ctf(dtp))
+		return dt_ctf_lookup_by_name(dtp, dt_module_shared_ctf(dtp),
+					     name);
+
+	if (ctf == dt_module_shared_ctf(dtp) && dtp->dt_exec != NULL)
+		btf = dtp->dt_exec->dm_btf;
+	else if ((dmp = ctf_getspecific(ctf)) != NULL &&
+		 dmp->dm_ctfp == ctf && !(dmp->dm_flags & DT_DM_CTF_ARCHIVED))
+		btf = dmp->dm_btf;
+
+	if (btf == NULL || btf->ctfids == NULL)
+		return ctf_lookup_by_name(ctf, name);
+
+	id = ctf_lookup_by_name(ctf, name);
+	if (id != CTF_ERR && ctf_type_kind(ctf, id) != CTF_K_FORWARD)
+		return id;
+
+	/* Extract the named base of libctf's qualified/pointer type syntax. */
+	while (*p != '\0') {
+		const char *word;
+		size_t n;
+
+		if (isspace((unsigned char)*p)) {
+			p++;
+			continue;
+		}
+		if (*p == '*') {
+			pointers++;
+			p++;
+			continue;
+		}
+		word = p;
+		while (*p != '\0' && !isspace((unsigned char)*p) && *p != '*')
+			p++;
+		n = p - word;
+		if ((n == 5 && strncmp(word, "const", n) == 0) ||
+		    (n == 8 && strncmp(word, "volatile", n) == 0) ||
+		    (n == 8 && strncmp(word, "restrict", n) == 0))
+			continue;
+		if (len + n + 1 >= sizeof(base))
+			return ctf_lookup_by_name(ctf, name);
+		if (len != 0)
+			base[len++] = ' ';
+		memcpy(base + len, word, n);
+		len += n;
+	}
+	base[len] = '\0';
+
+	bid = dt_btf_named_type(btf, base);
+	if (bid == BTF_TYPE_NONE)
+		return ctf_lookup_by_name(ctf, name);
+
+	parent = (dt_btf_t *)btf->parent;
+	snap = ctf_snapshot(ctf);
+	if (parent != NULL)
+		psnap = ctf_snapshot(dt_module_shared_ctf(dtp));
+
+	if (dt_btf_ctf_prepare(dtp, btf, ctf, bid) < 0)
+		goto fail;
+	id = dt_btf_add_to_ctf(dtp, btf, ctf, bid);
+	if (id == CTF_ERR)
+		goto fail;
+
+	if (parent != NULL &&
+	    dt_btf_ctf_finish(dtp, parent, dt_module_shared_ctf(dtp)) < 0)
+		goto fail;
+	if (dt_btf_ctf_finish(dtp, btf, ctf) < 0)
+		goto fail;
+
+	/* A pointer spelling may be requested before any BTF pointer to it. */
+	while (pointers-- > 0) {
+		ctf_id_t pointer = ctf_type_pointer(ctf, id);
+
+		if (pointer == CTF_ERR)
+			pointer = ctf_add_pointer(ctf, CTF_ADD_ROOT, id);
+		id = pointer;
+		if (id == CTF_ERR) {
+			dt_ctf_error(dtp, ctf);
+			goto fail;
+		}
+	}
+
+	btf->ctf_pending_cnt = 0;
+	if (parent != NULL)
+		parent->ctf_pending_cnt = 0;
+	return ctf_lookup_by_name(ctf, name);
+
+fail:
+	dt_btf_ctf_abort(btf, ctf, snap);
+	if (parent != NULL)
+		dt_btf_ctf_abort(parent, dt_module_shared_ctf(dtp), psnap);
+	return CTF_ERR;
+#else
+	return ctf_lookup_by_name(ctf, name);
+#endif
+}
+
 uint32_t
 dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
 			uint32_t kind)
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 4b639bdd..8e235321 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1093,7 +1093,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				if (!cfp)
 					return dt_set_errno(dtp, EDT_NOCTF);
 
-				type = ctf_lookup_by_name(cfp, "struct task_struct");
+				type = dt_ctf_lookup_by_name(dtp, cfp,
+						     "struct task_struct");
 				if (type == CTF_ERR)
 					goto err_ctf;
 
@@ -1129,7 +1130,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				if (!cfp)
 					return dt_set_errno(dtp, EDT_NOCTF);
 
-				type = ctf_lookup_by_name(cfp, "struct mm_struct");
+				type = dt_ctf_lookup_by_name(dtp, cfp,
+						     "struct mm_struct");
 				if (type == CTF_ERR)
 					goto err_ctf;
 
@@ -1155,7 +1157,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				if (!cfp)
 					return dt_set_errno(dtp, EDT_NOCTF);
 
-				type = ctf_lookup_by_name(cfp, "struct mutex");
+				type = dt_ctf_lookup_by_name(dtp, cfp,
+						     "struct mutex");
 				if (type == CTF_ERR)
 					goto err_ctf;
 
@@ -1185,7 +1188,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				if (!cfp)
 					return dt_set_errno(dtp, EDT_NOCTF);
 
-				type = ctf_lookup_by_name(cfp, "rwlock_t");
+				type = dt_ctf_lookup_by_name(dtp, cfp,
+						     "rwlock_t");
 				if (type == CTF_ERR)
 					goto err_ctf;
 				rc = ctf_member_info(cfp, type, "raw_lock", &ctm);
@@ -1193,7 +1197,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 					goto err_ctf;
 				total_offset = ctm.ctm_offset / NBBY;
 
-				type = ctf_lookup_by_name(cfp, "arch_rwlock_t");
+				type = dt_ctf_lookup_by_name(dtp, cfp,
+						     "arch_rwlock_t");
 				if (type == CTF_ERR)
 					goto err_ctf;
 				rc = ctf_member_info(cfp, type, "cnts", &ctm);
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 03d114d4..ceeb119f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -5332,7 +5332,7 @@ dt_cg_uregs(unsigned int idx, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp
 			ctf_file_t *cfp = dt_module_shared_ctf(yypcb->pcb_hdl);
 			ctf_id_t type;
 
-			type = ctf_lookup_by_name(cfp, "struct pt_regs");
+			type = dt_ctf_lookup_by_name(dtp, cfp, "struct pt_regs");
 			if (type == CTF_ERR)
 				longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
 
diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
index 5f8b1694..bed65963 100644
--- a/libdtrace/dt_decl.c
+++ b/libdtrace/dt_decl.c
@@ -935,7 +935,7 @@ dt_decl_type(dt_decl_t *ddp, dtrace_typeinfo_t *tip)
 		 * to "long" for all array types that we create on-the-fly.
 		 */
 		r.ctr_contents = tip->dtt_type;
-		r.ctr_index = ctf_lookup_by_name(tip->dtt_ctfp, "long");
+		r.ctr_index = dt_ctf_lookup_by_name(dtp, tip->dtt_ctfp, "long");
 		r.ctr_nelems = ddp->dd_node ?
 		    (uint_t)ddp->dd_node->dn_value : 0;
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index cf04d0f6..fcdac855 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -808,6 +808,9 @@ extern int dt_handle_setopt(dtrace_hdl_t *, dtrace_setoptdata_t *);
 extern int dt_lib_depend_add(dtrace_hdl_t *, dt_list_t *, const char *);
 extern dt_lib_depend_t *dt_lib_depend_lookup(dt_list_t *, const char *);
 
+extern ctf_id_t dt_ctf_lookup_by_name(dtrace_hdl_t *, ctf_file_t *,
+    const char *);
+
 extern dt_pcb_t *yypcb;		/* pointer to current parser control block */
 extern char yyintprefix;	/* int token prefix for macros (+/-) */
 extern char yyintsuffix[4];	/* int token suffix ([uUlL]*) */
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 0b0023a3..bd92d126 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -2390,7 +2390,8 @@ dtrace_lookup_by_type(dtrace_hdl_t *dtp, const char *object, const char *name,
 		 * 'tip' and keep going in the hope that we will locate the
 		 * underlying structure definition.  Otherwise just return.
 		 */
-		if ((id = ctf_lookup_by_name(dmp->dm_ctfp, name)) != CTF_ERR) {
+		if ((id = dt_ctf_lookup_by_name(dtp, dmp->dm_ctfp,
+					      name)) != CTF_ERR) {
 			tip->dtt_object = dmp->dm_name;
 			tip->dtt_ctfp = dmp->dm_ctfp;
 			tip->dtt_type = id;
@@ -2479,7 +2480,8 @@ dtrace_symbol_type(dtrace_hdl_t *dtp, const GElf_Sym *symp,
 		tip->dtt_type = idp->di_type;
 	} else if (dmp->dm_flags & DT_DM_KERNEL) {
 		tip->dtt_ctfp = dmp->dm_ctfp;
-		tip->dtt_type = ctf_lookup_by_name(dmp->dm_ctfp, "uintptr_t");
+		tip->dtt_type = dt_ctf_lookup_by_name(dtp, dmp->dm_ctfp,
+						   "uintptr_t");
 
 		if (tip->dtt_type == CTF_ERR)
 			return dt_set_errno(dtp, EDT_NOSYM);
diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index af3105e4..47da04b7 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -148,7 +148,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 		if (!cfp)
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
-		type = ctf_lookup_by_name(cfp, "struct task_struct");
+		type = dt_ctf_lookup_by_name(dtp, cfp, "struct task_struct");
 		if (type == CTF_ERR) {
 			dtp->dt_ctferr = ctf_errno(cfp);
 			longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 93fa8417..24abc953 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -327,7 +327,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
 				ctf_id_t	type;
 				size_t		esize = 1;
 
-				type = ctf_lookup_by_name(ctfp, p);
+				type = dt_ctf_lookup_by_name(dtp, ctfp, p);
 				if (type != CTF_ERR)
 					esize = ctf_type_size(ctfp, type);
 				if (esize != 0)
diff --git a/test/internals/btf/tst.lazy-types.sh b/test/internals/btf/tst.lazy-types.sh
new file mode 100755
index 00000000..110358da
--- /dev/null
+++ b/test/internals/btf/tst.lazy-types.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+#
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: BTF converts only requested types and their dependencies,
+#            preserving recursive types, split BTF, and failure recovery.
+#
+
+test/triggers/btf-lazy-types
+rc=$?
+echo "Result: $rc"
+[[ $rc -eq 0 ]] || exit 1
+exit 0
diff --git a/test/triggers/Build b/test/triggers/Build
index 5480f423..607ea00b 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -25,7 +25,7 @@ EXTERNAL_TRIGGERS = $(EXTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(EX
 INTERNAL_64BIT_TRIGGERS = libproc-pldd libproc-consistency libproc-sleeper \
     libproc-sleeper-pie libproc-dlmadopen libproc-lookup-by-name \
     libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim \
-    btf-cyclic-types shared-ctf module-discovery
+    btf-cyclic-types btf-lazy-types shared-ctf module-discovery
 INTERNAL_32BIT_TRIGGERS := libproc-sleeper-32 libproc-sleeper-pie-32
 INTERNAL_TRIGGERS = $(INTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(INTERNAL_32BIT_TRIGGERS))
 
@@ -132,6 +132,12 @@ btf-cyclic-types_CFLAGS := -I. -Ilibdtrace -Ilibproc -Ilibcommon \
     -ffunction-sections -fdata-sections -Wno-pedantic
 btf-cyclic-types_LDFLAGS := -Wl,--gc-sections
 
+btf-lazy-types_CFLAGS := $(btf-cyclic-types_CFLAGS)
+btf-lazy-types_LDFLAGS := -Wl,--gc-sections
+btf-lazy-types_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
+btf-lazy-types_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
+    $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
+
 # We are using machinery from libproc directly, but libproc calls into
 # nonpublic parts of libdtrace for various shared machinery (dt_list
 # and so on).  Thus, we must link directly to the build libraries, since
@@ -263,4 +269,5 @@ module-discovery_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
 # Exercise shared dictionary ownership using libdtrace's private module APIs.
 shared-ctf_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
 shared-ctf_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
-shared-ctf_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
+shared-ctf_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
+    $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
diff --git a/test/triggers/btf-lazy-types.c b/test/triggers/btf-lazy-types.c
new file mode 100644
index 00000000..40cd5081
--- /dev/null
+++ b/test/triggers/btf-lazy-types.c
@@ -0,0 +1,277 @@
+/*
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include "libdtrace/dt_btf.c"
+
+#ifdef HAVE_LIBCTF
+#define CHECK(expr) do { \
+	if (!(expr)) { \
+		fprintf(stderr, "line %d: %s (CTF: %s)\n", __LINE__, #expr, \
+			ctf_errmsg(dtp.dt_ctferr)); \
+		return 1; \
+	} \
+} while (0)
+
+/* Build raw BTF, so the test also exercises decoding and the name index. */
+static dt_btf_t *
+fixture(dtrace_hdl_t *dtp, const uint32_t *types, size_t type_len,
+	const char *strings, size_t str_len, const dt_btf_t *parent)
+{
+	dt_btf_t *btf = dt_zalloc(dtp, sizeof(*btf));
+	btf_header_t hdr = {
+		.magic = BTF_MAGIC, .version = BTF_VERSION,
+		.hdr_len = sizeof(hdr), .type_len = type_len,
+		.str_off = type_len, .str_len = str_len
+	};
+
+	if (btf == NULL)
+		return NULL;
+	btf->size = sizeof(hdr) + type_len + str_len;
+	btf->data = dt_alloc(dtp, btf->size);
+	if (btf->data == NULL)
+		goto fail;
+	memcpy(btf->data, &hdr, sizeof(hdr));
+	memcpy((char *)btf->data + sizeof(hdr), types, type_len);
+	memcpy((char *)btf->data + sizeof(hdr) + type_len, strings, str_len);
+	btf->parent = parent;
+	if (dt_btf_decode(dtp, btf) != 0)
+		goto fail;
+	return btf;
+
+fail:
+	dt_btf_destroy(dtp, btf);
+	return NULL;
+}
+
+/* String offsets are computed, rather than coupled to literal lengths. */
+static const struct {
+	char empty[1], integer[4], leaf[5], value[6], node[5], next[5];
+	char node_t[7], unused[7], bad[4], cycle[6], callback_t[11], cb[3];
+	char bits[5], local[6], parent_leaf[12], parent_only[12], bad_slice[10];
+	char target[7], target_ptr[11], local_bad[10];
+} names = {
+	"", "int", "leaf", "value", "node", "next", "node_t", "unused",
+	"bad", "cycle", "callback_t", "cb", "bits", "local", "parent_leaf",
+	"parent_only", "bad_slice", "target", "target_ptr", "local_bad"
+};
+#define NAME(n) offsetof(__typeof__(names), n)
+#define TYPE(n, k, v, t) NAME(n), ((k) << 24) | (v), (t)
+
+int
+main(int argc, char **argv)
+{
+	dtrace_hdl_t dtp = { 0 };
+	dt_module_t kernel = { .dm_name = "vmlinux" };
+	dt_module_t *shared;
+	dt_module_t module = { .dm_name = "module" };
+	dt_btf_t *btf, *child;
+	ctf_file_t *ctf, *mctf, *ordinary;
+	ctf_id_t id, leaf, cb;
+	ctf_membinfo_t member;
+	ctf_funcinfo_t func;
+	ctf_id_t args[2];
+	uint32_t i;
+	const uint32_t types[] = {
+		/* 1: int; 2: leaf with one int member. */
+		TYPE(integer, BTF_KIND_INT, 0, 4), BTF_INT_SIGNED << 24 | 32,
+		TYPE(leaf, BTF_KIND_STRUCT, 1, 4), NAME(value), 1, 0,
+		/* 3: node; 4: node *; 5: typedef node_t. */
+		TYPE(node, BTF_KIND_STRUCT, 1, 8), NAME(next), 4, 0,
+		TYPE(empty, BTF_KIND_PTR, 0, 3),
+		TYPE(node_t, BTF_KIND_TYPEDEF, 0, 4),
+		/* 6: unused; 7: bad with an invalid member type. */
+		TYPE(unused, BTF_KIND_STRUCT, 0, 16),
+		TYPE(bad, BTF_KIND_STRUCT, 1, 8), NAME(value), 9999, 0,
+		/* 8: a cyclic typedef that should fail only when requested. */
+		TYPE(cycle, BTF_KIND_TYPEDEF, 0, 8),
+		/* 9: callback typedef; 10: pointer; 11: prototype. */
+		TYPE(callback_t, BTF_KIND_TYPEDEF, 0, 10),
+		TYPE(empty, BTF_KIND_PTR, 0, 11),
+		TYPE(empty, BTF_KIND_FUNC_PROTO, 2, 1),
+		NAME(empty), 12, NAME(empty), 1,
+		/* 12: callback argument with a member of the same typedef. */
+		TYPE(cb, BTF_KIND_STRUCT, 1, 8), NAME(value), 9, 0,
+		/* 13: a bitfield whose packed BTF offset must be preserved. */
+		TYPE(bits, BTF_KIND_STRUCT, 0x80000001U, 4),
+		NAME(value), 1, 3U << 24,
+		/* 14: a parent type first requested through split BTF. */
+		TYPE(parent_only, BTF_KIND_STRUCT, 1, 4), NAME(value), 1, 0,
+		/* 15: invalid bitfield base, detected while filling members. */
+		TYPE(bad_slice, BTF_KIND_STRUCT, 0x80000001U, 8),
+		NAME(value), 4, 3U << 24,
+		/* 16-19: a forward reference with an available definition. */
+		TYPE(target, BTF_KIND_FWD, 0, 0),
+		TYPE(empty, BTF_KIND_PTR, 0, 16),
+		TYPE(target_ptr, BTF_KIND_TYPEDEF, 0, 17),
+		TYPE(target, BTF_KIND_STRUCT, 1, 4), NAME(value), 1, 0
+	};
+	const uint32_t split[] = {
+		/* Parent string offsets precede split BTF string offsets. */
+		TYPE(local, BTF_KIND_STRUCT, 1, 4), NAME(parent_leaf), 14, 0,
+		/* Fail after creating a previously unconverted parent shell. */
+		TYPE(local_bad, BTF_KIND_STRUCT, 2, 8),
+		NAME(value), 19, 0, NAME(next), 9999, 32
+	};
+
+	dtp.dt_exec = &kernel;
+	dtp.dt_conf.dtc_ctfmodel = CTF_MODEL_LP64;
+	shared = dt_module_create(&dtp, "shared_ctf");
+	CHECK(shared != NULL);
+	btf = fixture(&dtp, types, sizeof(types), (const char *)&names,
+		      sizeof(names), NULL);
+	CHECK(btf != NULL);
+	kernel.dm_btf = btf;
+
+	/* Archive-backed shared CTF has no BTF-to-CTF parent id mapping. */
+	ctf = shared->dm_ctfp = ctf_create(&dtp.dt_ctferr);
+	CHECK(ctf != NULL);
+	id = ctf_add_struct_sized(ctf, CTF_ADD_ROOT, "archive_only", 16);
+	CHECK(id != CTF_ERR && ctf_update(ctf) == 0);
+	ctf_setspecific(ctf, shared);
+	kernel.dm_ctfp = dt_btf_module_ctf(&dtp, &kernel);
+	CHECK(kernel.dm_ctfp != NULL && kernel.dm_ctfp != ctf);
+	child = fixture(&dtp, split, sizeof(split), "", 1, btf);
+	CHECK(child != NULL);
+	module.dm_btf = child;
+	CHECK(dt_btf_module_ctf(&dtp, &module) == NULL);
+	CHECK(child->ctfids == NULL && btf->ctfids == NULL);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct archive_only") == id);
+	dt_btf_destroy(&dtp, child);
+
+	/* Missing module BTF still inherits its unconverted BTF parent. */
+	child = dt_zalloc(&dtp, sizeof(*child));
+	CHECK(child != NULL);
+	child->parent = btf;
+	module.dm_btf = child;
+	CHECK(dt_btf_module_ctf(&dtp, &module) == NULL);
+	CHECK(child->ctfids == NULL && btf->ctfids == NULL);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct archive_only") == id);
+	dt_btf_destroy(&dtp, child);
+	ctf_close(kernel.dm_ctfp);
+	ctf_close(ctf);
+	kernel.dm_ctfp = shared->dm_ctfp = NULL;
+
+	ctf = kernel.dm_ctfp = dt_btf_module_ctf(&dtp, &kernel);
+	CHECK(ctf != NULL && ctf != shared->dm_ctfp);
+	CHECK(ctf_parent_dict(ctf) == shared->dm_ctfp);
+	CHECK(dt_module_lookup_by_ctf(&dtp, shared->dm_ctfp) == shared);
+	for (i = 1; i < btf->type_cnt; i++)
+		CHECK(btf->ctfids[i] == CTF_ERR);
+
+	leaf = dt_ctf_lookup_by_name(&dtp, ctf, "struct leaf");
+	CHECK(leaf != CTF_ERR && ctf_type_size(ctf, leaf) == 4);
+	CHECK(ctf_member_info(ctf, leaf, "value", &member) == 0);
+	CHECK(member.ctm_type == btf->ctfids[1]);
+	CHECK(btf->ctfids[2] == leaf && btf->ctfids[6] == CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct leaf") == leaf);
+
+	id = dt_ctf_lookup_by_name(&dtp, ctf, "node_t");
+	CHECK(id != CTF_ERR);
+	CHECK(ctf_type_kind(ctf, ctf_type_resolve(ctf, id)) == CTF_K_POINTER);
+	CHECK(ctf_member_info(ctf, btf->ctfids[3], "next", &member) == 0);
+	CHECK(member.ctm_type == btf->ctfids[4]);
+
+	id = dt_ctf_lookup_by_name(&dtp, ctf, "callback_t");
+	CHECK(id != CTF_ERR);
+	cb = ctf_type_reference(ctf, ctf_type_resolve(ctf, id));
+	CHECK(ctf_func_type_info(ctf, cb, &func) == 0 && func.ctc_argc == 2);
+	CHECK(ctf_func_type_args(ctf, cb, 2, args) == 0);
+	CHECK(args[0] == btf->ctfids[12] && args[1] == btf->ctfids[1]);
+
+	id = dt_ctf_lookup_by_name(&dtp, ctf, "struct bits");
+	CHECK(id != CTF_ERR);
+	CHECK(ctf_member_info(ctf, id, "value", &member) == 0);
+	CHECK(member.ctm_offset == 0);
+	CHECK(((btf_member_t *)(btf->types[13] + 1))->offset ==
+	      (3U << 24));
+
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct bad") == CTF_ERR);
+	CHECK(btf->ctfids[7] == CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "cycle") == CTF_ERR);
+	CHECK(btf->ctfids[8] == CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct bad_slice") == CTF_ERR);
+	CHECK(btf->ctfids[15] == CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct unused") != CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "struct leaf") == leaf);
+
+	id = dt_ctf_lookup_by_name(&dtp, ctf, "const struct leaf **");
+	CHECK(id != CTF_ERR);
+	CHECK(ctf_type_reference(ctf, ctf_type_reference(ctf, id)) == leaf);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ctf, "const struct leaf **") == id);
+
+	child = fixture(&dtp, split, sizeof(split), "", 1, btf);
+	CHECK(child != NULL);
+	module.dm_btf = child;
+	mctf = module.dm_ctfp = dt_btf_module_ctf(&dtp, &module);
+	CHECK(mctf != NULL && child->ctfids[1] == CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, mctf, "struct local_bad") == CTF_ERR);
+	CHECK(child->ctfids[2] == CTF_ERR && btf->ctfids[19] == CTF_ERR);
+	CHECK(btf->ctfids[14] == CTF_ERR);
+	id = dt_ctf_lookup_by_name(&dtp, mctf, "struct local");
+	CHECK(id != CTF_ERR && ctf_type_size(mctf, id) == 4);
+	CHECK(ctf_member_info(mctf, id, "parent_leaf", &member) == 0);
+	CHECK(member.ctm_type == btf->ctfids[14]);
+	CHECK(btf->ctfids[14] != CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, mctf, "struct leaf") == leaf);
+
+	/* A parent-only module can request a previously unconverted type. */
+	ctf_close(mctf);
+	dt_btf_destroy(&dtp, child);
+	child = dt_zalloc(&dtp, sizeof(*child));
+	CHECK(child != NULL);
+	child->parent = btf;
+	module.dm_btf = child;
+	module.dm_ctfp = NULL;
+	mctf = module.dm_ctfp = dt_btf_module_ctf(&dtp, &module);
+	CHECK(mctf != NULL);
+	CHECK(dt_ctf_lookup_by_name(&dtp, mctf, "struct leaf") == leaf);
+
+	id = dt_ctf_lookup_by_name(&dtp, mctf, "target_ptr");
+	CHECK(id != CTF_ERR && btf->ctfids[16] == btf->ctfids[19]);
+	CHECK(ctf_type_kind(ctf, btf->ctfids[16]) == CTF_K_STRUCT);
+	CHECK(ctf_member_info(ctf, btf->ctfids[16], "value", &member) == 0);
+
+	/* An ordinary CTF dictionary remains independent of kernel BTF. */
+	ordinary = ctf_create(&dtp.dt_ctferr);
+	CHECK(ordinary != NULL);
+	id = ctf_add_struct_sized(ordinary, CTF_ADD_ROOT, "ordinary", 16);
+	CHECK(id != CTF_ERR);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ordinary, "struct ordinary") == id);
+	CHECK(dt_ctf_lookup_by_name(&dtp, ordinary, "struct leaf") == CTF_ERR);
+	ctf_close(ordinary);
+
+	ctf_close(mctf);
+	dt_btf_destroy(&dtp, child);
+	ctf_close(ctf);
+	ctf_close(shared->dm_ctfp);
+	shared->dm_ctfp = NULL;
+	dt_btf_destroy(&dtp, btf);
+
+	/* Optional real-kernel coverage and conversion counts. */
+	if (argc > 1) {
+		btf = dt_btf_load_file(&dtp, argv[1], NULL);
+		CHECK(btf != NULL);
+		kernel.dm_btf = btf;
+		kernel.dm_ctfp = shared->dm_ctfp = NULL;
+		ctf = kernel.dm_ctfp = dt_btf_module_ctf(&dtp, &kernel);
+		CHECK(ctf != NULL);
+		CHECK(dt_ctf_lookup_by_name(&dtp, ctf,
+					    "struct task_struct") != CTF_ERR);
+		for (i = 1, cb = 0; i < btf->type_cnt; i++)
+			cb += btf->ctfids[i] != CTF_ERR;
+		printf("Converted %lu of %u BTF types\n", (unsigned long)cb,
+		       btf->type_cnt - 1);
+		ctf_close(ctf);
+		ctf_close(shared->dm_ctfp);
+		shared->dm_ctfp = NULL;
+		dt_btf_destroy(&dtp, btf);
+	}
+	dt_htab_destroy(dtp.dt_mods);
+	return 0;
+}
+#else
+int main(void) { return 0; }
+#endif
diff --git a/test/triggers/shared-ctf.c b/test/triggers/shared-ctf.c
index 8d06e9da..79aeeda5 100644
--- a/test/triggers/shared-ctf.c
+++ b/test/triggers/shared-ctf.c
@@ -189,6 +189,11 @@ check_source(const char *ctfpath, const char *btfpath, int archived,
 		kernel_btf = kernel->dm_btf;
 		CHECK(dt_module_lookup_by_ctf(dtp, ti.dtt_ctfp) == kernel);
 		CHECK(ctf_parent_dict(ti.dtt_ctfp) == parent);
+		if (!archived) {
+			CHECK(dtrace_lookup_by_type(dtp, "vmlinux",
+			    "const struct shared_test **", &ti) == 0);
+			CHECK(ctf_type_kind(ti.dtt_ctfp, ti.dtt_type) == CTF_K_POINTER);
+		}
 
 		if (archived) {
 			CHECK(dtrace_lookup_by_type(dtp, "vmlinux", "module_test_int", &ti) == 0);
-- 
2.52.0

