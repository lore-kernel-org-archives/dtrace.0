Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19638DD8
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595041; cv=fail; b=f7SnBZZWpkLJbOa/bqIXvZnYsoSsfSPQ7jKO1txIO3IuARAMPTh8yBK9BUgaa+AKXY6gLq6IKY7FgPUO6nhqT/+G2uUniSjk6CGwCAqGO/rsJBNJ3bs3zcwSYntWJJ0EDpd1gKEnR55tykMhPJ1HQPydccTmqoN4gsk/VYyU5DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595041; c=relaxed/simple;
	bh=L20i1V2aJdTPk1bSuXzMmIpsO/v8Yniql1WwVgEkNWU=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=cylvpkfvVtMMXhEvKHOL0N4p1CP89T4oL/aoAeX2Nup8pmaPcf+FxDC/pad2x1EJ0s21aJ+zrzCnUpBU5UXs5iLSZxpp8uayuP6R9NfK5i3zUxna2Q0hTCOc6T1KOY7jtjNNQbMmwHwFOYhjeb4/G5lwFVz/heS6VE0sscCOM+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l5qJWYZ/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oZBdKU9g; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l5qJWYZ/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oZBdKU9g"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OJCfI0015107
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=6f2h7n5WniS4VePnnBlCro1iC5WEHz/STLWDbqGfy8g=;
 b=l5qJWYZ/h5lfKuO9hXXqvLRbWDFCuuDdh79dXPXJVg2Ir9HHnjq/GdELDbFxMKAdjdH8
 u7QRIaLr+t1PyPZiTJPZJ22kWbRZ7RYoYKaSdmqYww9ZhNNBXbwA+/vSB+nVgNYYbOg7
 XNk5jbJwZYyE2jz9yOw9ueVZH/i9FRfn7VPwd3rjlT/D7FPw8z/KQ8NuZpI/nXhfSRLQ
 oNLfp/pZMRzSm3bbA2i3LkBO2LPkkwxEo5wcIXvfOUp/QrHY2T6b8Q9IG4+j2TfxvcDW
 pnxzvjcY/hhAlgOKJYm25m/HwfBIpoSjJS5pF95ZEk+mzTUhMy4X6dehyg9uFomHGoQD aA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mvvdew3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:16 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44ONoPt7013722
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsbw076-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRrvvLTwmi/cWji4yfeauPfjIHLBO8iKSU1VoTCT232smkJj8zMQLjBW98uayFicjwA8w34yTCyYnC0gkt83KD74v9RxQSVFrGdVyNKWeUZxoagTvTxfaNcOIal/fCbr3pFjVdjX8H6bVjOldlpPkCA5EuKHAIR3hZWRkjBcALZv4u7o3bJg5xzaRbv3Cks1cWmHcosac6yA9LObMa05f918osuOUBex92YHBy85Q36TkZUaKOCCYvUVbPQPbgFQwgIrOQDIiAqYhOT/Q7AnlHeajj3DjMRlz6RZ16dMU6+WBf0fdBtoFW4Gw+BP5cHxZ8li3YEa4ByZnwIG15THlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f2h7n5WniS4VePnnBlCro1iC5WEHz/STLWDbqGfy8g=;
 b=Ogmq2nEk7at8qzBd5sMf/M/oYHBnLpIS1IdOIT5fuK548FpX5b3FopO/SeknzcF/UQrqyAJaXUpIa+JUtFg42eKtLaHiuWzy4yUC/7XjWzJfl6Tzq5IDfAQVblmnDFJTS3n4Eey4jNBypu8A8QFDtHGdatQ2pUru4KfhL5sJcEkkIcSs3TZaspRNr3PWpOxbtgucYhKBkOtAOGfGwLeW89gWMO3OH588OUAL3zgVHRAKyQ8sQnQKewVlppH8RXbWLn+6vWG/dBpsNEEStJE53NBjL5ZMLJHIhDjAZkI1RTXMZTfOacvnNf1SyFlJuFDDlqkgtm7u2bsFlw/OFiIePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f2h7n5WniS4VePnnBlCro1iC5WEHz/STLWDbqGfy8g=;
 b=oZBdKU9gYaaANl02+od656MC8WMzgq4G59qLza2ulynGOeyPzXxzwH+ZqM2t7IU4zgwNHVCdp5ci7CPpE5wMAdCR/kMEfquGSA5nLPoTR2BGKHxFNXv/jShEI1eXvwYDwkRm3WoMkYTN+a2L9HWoTZVt4KMYJHSetXbdQiGsHf0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 23:57:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 23:57:13 +0000
Date: Fri, 24 May 2024 19:57:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] config: surpress output from check-bpfc-option-rule
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Message-ID: 
 <PH8PR10MB629210A71B9B0171DA698F97C2F52@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1596b2-eaf7-418d-8c54-08dc7c4d3b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N6+Hnkb4LDJ+bAhTQQKYq1eUDjaV2iDXfWXdFxgdl6eJ86MguEF04eOvOWlJ?=
 =?us-ascii?Q?RMNXpW6UsG8rF4J9f+jNogoL2MhP0zNnceDz9G1kp1BXFtgUedoV8URNZwdk?=
 =?us-ascii?Q?jXQ/3vgawn9q/X71LxVUCK57fJLOcaPqcLn3wIz9ltspI2rzBTCNHlx+TCBV?=
 =?us-ascii?Q?oeoQFnTPMnODM+Ap3EmkW5+PGz/uPaXQ2Hi+dLzam0aVgRkeSWkfCilzVVJT?=
 =?us-ascii?Q?jiqEibA1WSozXd8A+M6LViYVGUS8IXwAjCI1cUlB9/HOrsENv+0h95AyGIPz?=
 =?us-ascii?Q?QdgrNsil90l1w6YlSVeN7NL5l9HJE9JBsX+OjT0texi9l/T935aC4WiTDV3y?=
 =?us-ascii?Q?Yd7F/Byj2bxyDXg/IeMA0NF0Fhj3JeToTS7vp6Sl69iA8SB7U8KLL6IdjhRG?=
 =?us-ascii?Q?y1HgEGVXzHZw0PfsHMEizXz+C/DFQH1ZnGlp4S65QixL2G7pGtLxDUMKER62?=
 =?us-ascii?Q?sXMMuoR6V1SG/2pjwxwa/hpsvEME+pFKLe3bk2INbxbUqS3jpV4T+n6hrAdk?=
 =?us-ascii?Q?QKwT9IxvEa5l2b81iso9R3dJWL0URzgofwhkeEih83a3xfxTXZ382SLmLOXZ?=
 =?us-ascii?Q?H6QYcbdCPFhkBjkFNZCMfQFH2K2eqdcpFnsGS0JAsFnUXrqtWV2eVNZLGgNJ?=
 =?us-ascii?Q?wA037vQwUDGt7HIgHaDXJ50nj9FfuRYkZ02C4hG+VRM198nxQjwMDOrzSFhn?=
 =?us-ascii?Q?sEvBuMDqPfRd7/S8VudmwCt6fadc9G2xO/II8QQFAVJ0ubyecU2pSwJqxW0/?=
 =?us-ascii?Q?8xa0+mpuOJebV3LRvs6Cuh/Kl7ydMqDmT9dCYrIZC65BVRczfq160VLN1A66?=
 =?us-ascii?Q?LUo1GZIMq78tC9jfaOxqkmGOel5KtxZA6XAQGzct7r1GUGS/RP1UmHjbHBqe?=
 =?us-ascii?Q?Jh/tKx02jt/34AaIZ3XfMbbww4IzzhzEBYqCVBVlhWDMu1hgm/XwsQ3DHnJg?=
 =?us-ascii?Q?rwSPzHJh8LlZ2tJ21tNLbpfo8QHBgD2pIxXxA+q957ttTd088A9NxyC3KvqC?=
 =?us-ascii?Q?9+f5/djrVQbFIS8TgiZBxGX5ws0DdfTz/TzAhk6092hsMa3g8TRNVJFeuVz5?=
 =?us-ascii?Q?+ZJv3NqA9OCjU4iClkcIqIrhWcVNdJQkQ0EgbO1ukR8OHUcGEPQCCQX16zez?=
 =?us-ascii?Q?XjC/eSHTnxXSKGtM0Do1fOm+DJQFLL6j9ekkP3ZhrTeIY3UApcO9RLLHFHFu?=
 =?us-ascii?Q?st2epo8sxImmSZqHHWqGl1p1lm7OFZkH35L2PoYMnS2rVojKQ+yWXRqw8Nvx?=
 =?us-ascii?Q?rRZdUFencvZrMcZIPQweHjqwkARE68mCcwnIaBu3Hw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4amsWm1i0ARD1baJ6gEqoMd7ww66f6QgR+jFmxdmAX+pIm1McNIRIbAYzNVc?=
 =?us-ascii?Q?CJehRw/mqjRVemgFqCGrJHYNvUrnptCopsUT2MgsJ/G1108agyZwzRsdlGnK?=
 =?us-ascii?Q?VsBKoDctatHWdgG7rcJ+bnFU5kOxOEaxBrhSqch3akF+0JNFyVdSdKqDesta?=
 =?us-ascii?Q?eNDgv6Bisk5/Mn1ANsdJMSKo4CGPahF4CktRjUzvaV5pCwuQYj/ZSTCevfO2?=
 =?us-ascii?Q?g2FqAjQvbO6bNkx+XSuQgqlZL1W8mwni3MN+xVvsZOa32YbaXHBoXXiLr2b1?=
 =?us-ascii?Q?2as+/iakViTVlQoYGi4Nj4E4VGIm06W00Z4rLx9i+fdj7m56I6RiIUEb8GLJ?=
 =?us-ascii?Q?I2utpzpC+JHJw/xfMGOo4bDXCdMfrfHhjAWq8LoSroUWlIE/EKzoVPSxWgN6?=
 =?us-ascii?Q?xRAHMbB8QR57NHOLf8smm7uy0vTm3ISBBBcNcyokQDtCkrqKqgjoS5nqwQLy?=
 =?us-ascii?Q?dcWpmi07WFgVKZT6qedK15LXqlCUuOk01ullprpmryCh9Uy63Vq6Upl7Q2N8?=
 =?us-ascii?Q?MAPTXJb3gYLdgcrrX+5qrrVW8YkvFmTcX8JNA8bvIpdExdsyTR3CDCVmsGf5?=
 =?us-ascii?Q?Kb8kYI7+s47oyR+jHLQQgOgOlSQ0aM7tYbxUGp4yoxFRo1JYsiyV1mzlI4vm?=
 =?us-ascii?Q?sUOK1CWDkq/er5lLBD1iGeJm4Rd4LBWALJIw9JVzpLctiDJxsp7SbgJ27uW8?=
 =?us-ascii?Q?VzW1OaV1v0N8tKLBmYgQXXBy4G/pqtAuaiQCGx1ydNx13KWswUEMpFmvRRed?=
 =?us-ascii?Q?edfn4HZPy7ib1cbCy9nd32vu2vYP+lWmaS6OO7jHnzoT0mCH83rYUnucsZUZ?=
 =?us-ascii?Q?etJj1B2JIM1/4hEhxx5wF1SgbvXPeWcT1yNov0DMXQ6oZTWubmXO47AtxKIx?=
 =?us-ascii?Q?7annYygvRkZDJiQpcSCyZ2xsU4AeOETRXGyZKhS/sbq7X3sbyNwA6PNP+fQi?=
 =?us-ascii?Q?jbNtH/KbXwjMj4lcW3Te1A59FiXfhO2JqasGvpQPLWTJhTmZgm9L+a7yibXy?=
 =?us-ascii?Q?yL40yppi19sjz2tijIXaNVrco8S2rICCvVJDcYA83vkGb8+AeT1HlRLqxviL?=
 =?us-ascii?Q?I38WNGnUQfCrB7zdT2aOA4R+UVJB1p1eRPBAzvxeI8zUJBRhlNlHrF+o81T5?=
 =?us-ascii?Q?zR7y1FQYrjYowOT1DXfCw6nP6Rx41kI7x1fyA7YK796Fo2UGD7qxxLmFBCWn?=
 =?us-ascii?Q?5bIIoXKXx1YxxAylAwmbr9kWf3tb8MlZdq/epTRme4TXem0XzYYFZA4jossa?=
 =?us-ascii?Q?Nmra6yljiFvirxdKbdNfW+GNw3q6jISn8QdXisFfvYpjmQW0kAa4S8CBpyC0?=
 =?us-ascii?Q?1GHOijC0JqeLz+Gpfim5HJX4zGsl9KqGadQHntIDM8iBazL/kwQcMN8EpTz3?=
 =?us-ascii?Q?dgnREnPpmkZM7Xm2M8+EiO1RlBjwStSotyJhnitt/17LO+qNtKB0hwaIcQfe?=
 =?us-ascii?Q?Ao1j9k84+6LpLtAAm4g/+jyC2nGRvCtSt4rdhAov27GIGkQXY2tX2pl8Fsdz?=
 =?us-ascii?Q?KEsIgzNUcPpGgxGdEYOVbIz1g5yQHDiuz7oXk6JPBbV9/e/4RurnnKCuew+J?=
 =?us-ascii?Q?omGNW68/obmj/vpQltWHuPjBCNjMqHCvvg1FUaZ4fTxp6GEGjEw/xNRawpzH?=
 =?us-ascii?Q?SlUQz8zJlZbbIOEscV2Exc0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zir1A6Pmk3BoClVBI1DMvJM2qHfFOkybw35ygiF+J9YqsVDrMHY6v7M3/LkNYWa7bdXVb8NQxWGEX+/V/eldumM8NMDS9r1Ic12OaFV1l8A4WMXlG6CvXH8Z6qzmhENBjZn+KGYqc6+VRlLWexDys86pTM/Z2XHzJUEWGaQWgi2cwyTFYRy1/zpzpCMdbpHKgZx4oCBpAqcog9aUumB48yYt0VuB7iTLh7pXTlCjfVlJdXurg8YVsrrgBVWcjR2Y7S+L7WjADs93ORs+eaPzWynlSIszAlOD0TzUhFezyUpM446ByKe+4LpdPaPwvIW8Qsmy9aBDCF/D6avIidUxX6qfYz/szVRq3d1FngnZLbXgd96pb3ZqumCSn6xWHayHLX8+v0AZgCVE8nsWan40VVkIzOrxGNXimRv2AIRSFjDOqIMkj9EpumfE/ghsRcbzyWRg53jwQwefCpagBSNrwi06dnRgiwLoZ7tDngn7moHK5bqHQp9Qk4DBQ79AXK/9ymZ3G9ve5eusfDCY/hPeKzZSG3lvUMhrgszOMlmQtNwBICfhlcBXBsnZDQomBMsYMJ/SPa6M1F66Hhl3x5Hrii/kb9YCEO9MdDxRzytSPsk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1596b2-eaf7-418d-8c54-08dc7c4d3b5c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 23:57:13.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IINN3qW+coxvWCh7Wrcsj++59cQ+HTnGC2DFqKkzN38Fb0T/AsgeXSZkrjsFz1Fbv5vhVb3CL8gWtnN5oeVy7AFFshnbC1zNjCDJcpwd8jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405240173
X-Proofpoint-ORIG-GUID: fge9pOEqWbEsTBwig7_OyfSp2e6TyYh0
X-Proofpoint-GUID: fge9pOEqWbEsTBwig7_OyfSp2e6TyYh0

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 Makeconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makeconfig b/Makeconfig
index 7249125e..87a601c8 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -177,7 +177,7 @@ $(objdir)/.config/config.$(1).h $(objdir)/.config/config.$(1).mk: $(objdir)/.con
 	     echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk;; \
 	xno) echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
 	     echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk;; \
-	*) if $(BPFC) --help $(2) 2>&1 >/dev/null | grep error; then \
+	*) if $(BPFC) --help $(2) 2>&1 >/dev/null | grep -q error; then \
 	       echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
 	       echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk; \
 	   else \
-- 
2.42.0

