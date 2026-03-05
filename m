Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43F3803F9
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723649; cv=fail; b=VpjY72YlXOSHFtMe7gg4bFReaFFXXdIsWhYQaJjHq+rcSkTYJVNAdA5Bj5bd45IBvfmZgY+rjr7ttsfVeRgTDEBl5sadD3Mftr0rm/LdEOBkvJQYlpZRPIGZErkQrty9EGVQWSNzokDzjRmHSPK8RdqDnhQ9lsBR4mhbyRZS+P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723649; c=relaxed/simple;
	bh=yFAYCjILJPP0o2pcl5ZaE4GtvZ76XSsoA9KGecP9PQs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=n+W94LNuatkuIFftr1r7nyp2v3/lAg/abNVOnIh7vx9AVFO7WVrpOBCjwg6D/iKkHG6n68DGoSxsv1CBOsvRoiZcPGQ+4d+1qa1uKHQLBi9SJ18nXPnsG8U0r8gKlVe7BLd1yeRcuNg4LPPobOajiK7TQQrU5OTfZlaZkA8gdBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Evdp+Fsx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fkoPFviq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Evdp+Fsx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fkoPFviq"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625F1Pfw2523750
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 15:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xBTYq9ppS67dcshw56
	Y3mlNJfQK0kEUE/twdS+CKK+E=; b=Evdp+Fsxy81woLPKeFzobrwSic77DNvd4B
	GJdneQrPHtuQBp4SNHSdHWMEPpYbjTszoFo3xE07z8Ldlixadd2I8lMTWaHw8zyZ
	6JZvzgLzpsC+B0v64zD+aNGPXRiBKpDJl84no70koYAEq4H/p8cGgp+0WMvBCRSl
	7NFi11CQFE9I59VauF4rLDjBk2SgqN2Qo+GuW9mt6XtCbuHoRu+kNZqLzIh0bAyE
	X2/p47igE2ivNP/xevOFjm8OFy4/A2CgLWaYwrCWEgcZh5qFC94e230XnKDMnXeU
	XwrlFPA0/D8qOGbGnUlA0F5lWuK7Y+G9HvmP/jJCDcuQZEJAs1mQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqc40g0ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 15:14:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 625D3etW027327
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 15:14:01 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptd4qt3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 15:14:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgZqw2P31yuqHEMcliR0EvtV48aP8DGwk2dMKB3wR/mIIAzRmS65NbAhLTj5G2rzbkX0Wwk/6RFcpp78cwEEhdXMyci4FT/DuHS5m8cxNrO5zEvSu93zdad1PrKqKeR0ntEe1cBwmj1VeMeYJ3m/DhPuejm63wzUWuTQiL1Au8XGaeW1nSsYn9MnfxlLBloIK6wNIvVKoJep/cCmQojADbtKpY1+sslzg9XIB55QbEyevR6au9EaaXxrrf8YI8Q9xTy0uFxpFFwLvACr//HzJjk8W9pLg9mOAZ2XKev77bbxNSjnssRrT1eLIQBP2Q+AVY0GOlkMA1Qh4DSTgRNpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBTYq9ppS67dcshw56Y3mlNJfQK0kEUE/twdS+CKK+E=;
 b=d2z92df31VT3pVZSnqO0coVs6sCkqEfFcMVkZjpdsUim3laI2Ela2xmrssmxLUGp0TOpTOqoeZZ9nuOqX7yWhP+3thV0AsMFaBaV4nTB5qbGnXU5ocQzpolqRi2ZIB097+a5mx3knu36kCsLNfGt3MA8Hfp+iwBf72yz2Kipci0pdWTRkMkTqPSt6z7MdmCVAtudx20UBj3VrSJtq+LxJHONoCVEnDcQYdsa6WLfAd0aPODUQRdzj+Jx7la//g/YanvoItZPlQaQuei7IS5KmHP9h/k74LcY9pMtvq/aCP26Zq+qYBUMi0zzsUKszqlLhEfZeBv8Yj6iUKyAxv+NZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBTYq9ppS67dcshw56Y3mlNJfQK0kEUE/twdS+CKK+E=;
 b=fkoPFviqVUw2/IYZ352vecC9OThDPcjmu3AoNMLjWzapwy6z+HdTwRb1hxFrpFkvjUgt6fJn+p3Q+GRp92riEBlYOfM/zpygvpLiEhIG99NpPQoNEtWqo1GMsDbuYI1KHukJ980fvyi7oErMU4/GQ3oUUXPpCwOUZI1ML17XXEs=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CY5PR10MB6094.namprd10.prod.outlook.com
 (2603:10b6:930:39::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:13:58 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9632.010; Thu, 5 Mar 2026
 15:13:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] configure: accept standard installation directory
 options
References: <DS0PR10MB752207E7760FDCC141576F8FC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: ballast for RAM.
Date: Thu, 05 Mar 2026 15:13:51 +0000
In-Reply-To: <DS0PR10MB752207E7760FDCC141576F8FC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Thu, 05 Mar 2026 00:01:19 -0500")
Message-ID: <87tsuu5mxc.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0697.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::12) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CY5PR10MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab94344-692a-4a44-c2c6-08de7ac9d31e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	PP1DVkTxbHnBAnlfAhTEtomeKZeN2xguJyNt5HLnCKw6WQMxPWUZ514JQhFjKsx+GSWLulM/EPFDoAm4Ic132xj8qpOm/fGi/u3E9m8n71WMEXahyVEI8bfkrL9tVXV5Yfj1rs4IxxMJDxzV/91xDNwEFwgoW6S6a69rzZawStlXSdTu4X6dIID3Rn9fuFq0tJOYlpd86j2mVyJsXbpzI6zCNs3uRf/OWF7Mx51ocNSOpXDTbM+5CYRA3iwLjGzNf2PaAkW7F97ffG837rP1GCt5ogvvZk8UfTwPQdzQOTr2Jjq+cLnKGtljU5EQlrxgfceP0o3IRlj2KXxKljJDn36IjfvZG3V6GPEfGs8GNlLdX7OLnvuH0rZl7E/qgAECIfxKWHeopnZts2V2XNNSDPav7dL7fZcPKMDBoDU4v+BWG+NXkgFHSkcYwXobj16k9i8dPudCVFdq6EQFxKyayke4ZX7QL2MNhF3EizjaZlwwKwK0dkZoM4vhEqwXRI9Aakhpx/WS1fA5f/702//VwpZTXNJKMhAiGrsyIE8HKiW2LtwWGk6CnSua+fDicmYghNyiVK0Gn/6YsupYolcr9Kvtaff/BVnOTXhwzBpM9/gtW8PtaZDMXwNtmJgE6+mFp1s8Utg+6j2yV/GO3GQ0ZcShWy6TdLvSwZw1KqD4Xxdh8mxkV83kVocYfCrSqjmBwxrSpFhwUpPIOzlafkj9H+8RdbVE/qMmd+eFBz3Zm2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ADsdfqIT53dDMkZJ5lGp/dYdNsW3za8cGl+QrNUA/wA6bpQOxjhqkIffoMsI?=
 =?us-ascii?Q?+mfrU/LIg4UcW0FMdFB/yk5JSBojr+CNpYXqyYWnvkt/VzOC/2MUYdWBxb6+?=
 =?us-ascii?Q?PQhHM8bYo9FT+NUafFJPAmjKacvZiGtBYBkrblyrdh9N/cpaMFlWx9waofbM?=
 =?us-ascii?Q?X9oNWkIeNvgubJQ1J0lUHmAKS4lmITWjuN5oymH5j+zSkmzJL8onGL/oFaUY?=
 =?us-ascii?Q?uTPuydDztLHhNtnatSd29v/8pt944eNsAcHrESGDUwHmvK18ILDS/VTkQTo4?=
 =?us-ascii?Q?PggkrrEwaKqMuoNH92cKwE06HNA/oKc1dNQrtjzP/kqSGIVptaK2UARQx13A?=
 =?us-ascii?Q?IuTE9x1Ok46pulX8Ndh1v6hIzNVmXyZ5T0k2wHbcoBfA8CO9OKI1v4fQohye?=
 =?us-ascii?Q?Sw+Y0HeZkGNCaP8gFna17R6tJ76AeXTNgPnf5nzLKftKcaTwyfLC90OwBakV?=
 =?us-ascii?Q?91r8nSNPkViQfZXod4p+/7df72HMYNgTjrlDlAVnMg7+Ums7gVUXl6Pbn86J?=
 =?us-ascii?Q?C/uCX6wQLHmMjEggXHa/FpACa6q9BXDZutUcVCSgwzZcYH5OA0+Xv75mKXpA?=
 =?us-ascii?Q?PbAiGcq1ZRnziiDfBggZ0XNAFHUqiJYEQgsGBnuL+WfQH+ELgzAhWvYYoIsy?=
 =?us-ascii?Q?hOjWBG17vvo6daVywKb8KZWB+QLwjM4xlAkmOk23fH5Rr/DNHNDrsALH1N1A?=
 =?us-ascii?Q?CZkWzNgIaWbkY2fDPwjfrJZc2Y6j7yoN8uWjEPQTND6R7yP6qPeVLm2MwtP2?=
 =?us-ascii?Q?vlR9MggRNgT1pAEgejbEyf2j8hkC08p9WDKUK5Xj7wWdvBYNPdE5ccYHBW70?=
 =?us-ascii?Q?/rNVW7GT5uC13u0XWLBmTpngWV/mpdPZd5yiubAhmpbfOic05G5P7sCjYdF2?=
 =?us-ascii?Q?hV91GTjvc9M6Q6n7hEc2fRWL5FTqynn/9sZxJHD/iJno/H4V4t6R7KucKiCz?=
 =?us-ascii?Q?ET3l93Vp3W5QzyWr4U7svihcZ01BstI9zXDJ1sGXz+Ww5TawGL+QU3L3NXED?=
 =?us-ascii?Q?cGsVWDTzG/UqksmAc0w+ArCP09w7jkqHxo7NdkeBW36hFWUU9WlLOsydOabS?=
 =?us-ascii?Q?uCLWhGZ3blXJ4HKpFjK2wMaon7CJmE0sq5iImM+kE0atH/2S+13zkQnxY4Tb?=
 =?us-ascii?Q?VnhG/9JyvYcPsbh8r9SZg9JWTMUGz3HCNXV2lb7NaU6hvWrqb31b+20WUpOo?=
 =?us-ascii?Q?oJ+qiWxQogb9RpAsIixwn6mcAnjPH7pTZv3KSfoobnAGR0U5IcZ0RkUYcoHg?=
 =?us-ascii?Q?l+gdugioP4vbdJNmdNQYU0Rea6Gn+AMlRoB/hc+C9J+DOW9hbnZ2RRukkLXw?=
 =?us-ascii?Q?hTTpaDPGJfFfpoHtmKvJh0A4AoPj4veFYiFsE0DfrgNYpQLf2Iq9CxKqCEaD?=
 =?us-ascii?Q?aMRDwhGdBW4hCuzjvgAUWi9YS7TisZs5iCfdaECq5qDCrx9E+jKQTXcebDAf?=
 =?us-ascii?Q?7ybY8RGkAHrYs7MiVLhfNNazWg+pY+7iWiefaPIjA+HfBUl1INO8mujYr5E+?=
 =?us-ascii?Q?Z25rr7fstExuw4t/4nY/oObGyN9H5GYBH5y7gBwTf3iGSdrNWIk5k1F9ljcw?=
 =?us-ascii?Q?TGL0ALwLURsY1jrzF63jMRq81cNDZB+9s2qAUpOAqSB6cTxA8LEZSbybeR9A?=
 =?us-ascii?Q?JmCgSbaO0v7h+A4k0E8Led/O975/GK6Wxts5q/786Qs/YKG0z0HPeR8qa8fo?=
 =?us-ascii?Q?sm40XvlzH/MWXila/9gp6d5ha0ZYLAr+uUpOMcPoyEQTr70610WY3Mk13i9d?=
 =?us-ascii?Q?LXEUpAg3Hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a651yslJQohh/2bEcSeDbejbRp7Xf7H/YU/h2tCOxUwyIlSNcfHsVQfqnYq+QyqR/UbtcbqRcCkpjHaxMQtWUasRtaGdTYa/9gryvKmIfzkq9H7GY4xiKaqR0FtnR/jQrlfkSPRCPTlHbxRQDs3eMJMdNK3dJgqhzxawB+zaxb0monuM9+C/CVvivNemZR47fxc4eOD1rX49nYTlBAOhncultS7Rm56vbIuFfANAkQleuVUDwLFAP4+8bGvv+ue9dIsgid/YUgCScNCAS/neq0W+kJztYCLaVvGR1ghmx/8206FUFLIU7IJZiTb9QabMgGlDUZTuUK3TZStqVlxUVbiDXyaKfagGr6/s1kfrCkFVADfr3x8RhO7Cpun/qLgDsy6iS8nUx1mzVPI9ml9tfO2lCbcF0U6fyKZdPrM73e/VKgvsp9JWbih77dD6ssJhpNH1IWvxjTeMxx0Hvy5IiItLKepqXyfeM/u39N99x5ivaYp4ipKV0jpUanvBNlDLw5RjLbSL5aVXDVagwQU5cODOJ7YEjt5Dt3LmgQEUlXvbZpRv4mmm0SwJoyFJ2tZhC++YUmXrtv7CnPOG4hqI2PLAvZnyy4cV4Uk/IDBGH10=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab94344-692a-4a44-c2c6-08de7ac9d31e
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:13:58.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrP0BK2vyXSHGEabeI025tNDF79OjhNLoXnhic3Ppf7anMyJsec9atXi4+Gf+GPGyDzpJiryfpE0H3Td3Nb5CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6094
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050122
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69a99dba cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=11Cz2c1798bsH6gzNeYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyMSBTYWx0ZWRfX5lnd/A2tAum1
 fSVmWJKfUkIepDiaiCBSWtWdcV6j7M63sqEL57L/Zg6UjJKIWAvdrM16Dl+qTiAyYqI4/fGQAIe
 oELZ4m9lupBBYtCS7WjhD16wxbzkEz1Xjt25RwEU55MkNh1g0Jsy2w8ZHlu2avziEpGWbDVAV3O
 ytP2xtFvDXKBVywLArZ83E1yDHP5ff8WUNtFB8dog3eT/HRYY2WK5kJSg+QSvT6exkfQjrzJy9o
 htFSaw9UO9VfGVd+RmmTeDXnNjT99QubDpQsI3lbwOSSK7JXqWS4rlyMoyu/wwZsOEuQkhuOLDt
 5MSMqNH5q+4TI+M3ltqyHJlL5sqeaq29Jku6zeFPygoRXwLuvl/Q8TsKGkTB31H8u4asWNmXELv
 jsMnWxcSo+2edXzysRemWNgu2RYwoQi5qAEzNYx0CtVuMW9q2THqZNezZOjn5QXNfvtayw4eV1z
 w4w7JzM0+lxSjs9l9jw==
X-Proofpoint-ORIG-GUID: KqedJAL9-GM73ZMhesllhWz2uBzordX1
X-Proofpoint-GUID: KqedJAL9-GM73ZMhesllhWz2uBzordX1

On 5 Mar 2026, Kris Van Hees spake thusly:

> Even though we do not use them, the GNU Coding Standards expect configure
> to accept the following installation directory options as well:
>
> 	--libexecdir=PREFIX/libexec	Program executables directory
> 	--sysconfdir=PREFIX/etc		System configuration directory
> 	--sharedstatedir=PREFIX/com	Arch-independent data directory
> 	--localstatedir=PREFIX/var	Runtime system data directory
> 	--runstatedir=PREFIX/var/run	Per-process data directory
> 	--oldincludedir=PREFIX/include	#include directory (non-gcc)
> 	--infodir=DATADIR/info		Info documentation directory
> 	--localedir=DATADIR/locale	locale specific data directory
> 	--htmldir=DOCDIR		Html documentation directory
> 	--pdfdir=DOCDIR			PDF documentation directory
> 	--psdir=DOCDIR			PS documentation directory
>
> This patch also redefines some of the make variables in terms of one
> another now that a larger set is supported.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> ---
>  GNUmakefile | 13 ++++++++-----
>  configure   | 47 +++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 47 insertions(+), 13 deletions(-)
>
> diff --git a/GNUmakefile b/GNUmakefile
> index 38ae5423..835bc9b5 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -90,15 +90,18 @@ SBINDIR = $(prefix)/sbin
>  INSTSBINDIR = $(DESTDIR)$(SBINDIR)
>  UDEVDIR = $(prefix)/lib/udev/rules.d
>  INSTUDEVDIR = $(DESTDIR)$(UDEVDIR)
> -SYSTEMDPRESETDIR = $(prefix)/lib/systemd/system-preset
> -SYSTEMDUNITDIR = $(prefix)/lib/systemd/system
> +SYSTEMDDIR = $(prefix)/lib/systemd
> +SYSTEMDPRESETDIR = $(SYSTEMDDIR)/system-preset
> +SYSTEMDUNITDIR = $(SYSTEMDDIR)/system
>  INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
>  INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
> -DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
> +DATAROOTDIR = $(prefix)/share
> +DATADIR = $(DATAROOTDIR)
> +DOCDIR = $(DATADIR)/doc/dtrace-$(VERSION)
>  INSTDOCDIR = $(DESTDIR)$(DOCDIR)
> -MANDIR = $(prefix)/share/man
> +MANDIR = $(DATADIR)/man
>  INSTMANDIR = $(DESTDIR)$(MANDIR)
> -PKGCONFIGDIR = $(prefix)/share/pkgconfig
> +PKGCONFIGDIR = $(DATADIR)/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
> diff --git a/configure b/configure
> index cb2f585a..403b1a09 100755
> --- a/configure
> +++ b/configure
> @@ -53,20 +53,37 @@ help()
>  Installation paths:
>  
>  --prefix=/usr					Prefix of all installed paths
> +--exec-prefix=PREFIX				Prefix of arch-dependent paths
>  --objdir=build					Build directory
>  --libdir=PREFIX/lib64				Library directory
>  --bindir=PREFIX/sbin				Binary directory
>  --sbindir=PREFIX/sbin				Alias for --bindir
>  --includedir=PREFIX/include			#include directory
> ---mandir=PREFIX/share/man			Manpage directory
> ---pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
> ---udevdir=PREFIX/lib/udev/rules.d		udev rules directory
> ---systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
> ---docdir=PREFIX/share/doc/dtrace		Documentation directory
> +--udevdir=PREFIX/lib/udev/rules.d		Udev rules directory
> +--systemd-dir=PREFIX/lib/systemd		Systemd config directory
> +--datarootdir=PREFIX/share			Arch-independent data root
> +--datadir=DATAROOTDIR				Arch-independent data directory
> +--pkg-config-dir=DATADIR/pkgconfig		Pkg-config directory
> +--mandir=DATADIR/man				Manpage documentation directory
> +--docdir=DATADIR/doc/dtrace			Documentation root directory
>  --testdir=LIBDIR/dtrace/testsuite		Testsuite install directory
>  
> +Unused installation paths (provided for compatibility):
> +
> +--libexecdir=PREFIX/libexec			Program executables directory
> +--sysconfdir=PREFIX/etc				System configuration directory
> +--sharedstatedir=PREFIX/com			Arch-independent data directory
> +--localstatedir=PREFIX/var			Runtime system data directory
> +--runstatedir=PREFIX/var/run			Per-process data directory
> +--oldincludedir=PREFIX/include			#include directory (non-gcc)
> +--infodir=DATADIR/info				Info documentation directory
> +--localedir=DATADIR/locale			locale specific data directory
> +--htmldir=DOCDIR				Html documentation directory
> +--pdfdir=DOCDIR					PDF documentation directory
> +--psdir=DOCDIR					PS documentation directory

Nice!!! (I presume the tabs are actually aligned, but thrown off by
diff and quoting prefixes.)

-- 
NULL && (void)
