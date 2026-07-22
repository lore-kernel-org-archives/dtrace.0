Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939AE4334DD
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755307; cv=fail; b=eN4qp+IpV67/6/TfzRcSHcqJRNYCEQG2uMtCi566TRHxLLtLJj4E1NsFKSjifKfEfopq3S80zeKxTTh7NCL+F6rhOxWk4e1QYJFbBjH27YoVB6aqWRw04OPq73plewYqSSnm3Y/4leU7oVe8A2gJVw5ekXq+MSWAOre+tbRTZ+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755307; c=relaxed/simple;
	bh=5Ws9Aecm8KHYdzy56D53YE/zwFASVwVp5Flm9m5KpM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vganxy/X1KXtisGmsbidhwhtbQUP4Q1am8gmliXzYRhZfpfVubg5EU8uZBj7q1W7aotBiN0MK1xSV6ME0kaj7CiFmSoynFoXyblwSPOWc5+DJlEmgrptEyOoJ62QgdLN1odkb8Bbaof6zcPam1Nz7fdJvSeniuNNmOe5IlCmsfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qFYCC8wD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BZHfRSir; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qFYCC8wD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BZHfRSir"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MJtZPJ3360304
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=J+bJnsEN4hN93FwM3M
	lZcH+rSUFOVJOoUeSEsewrR28=; b=qFYCC8wDEtlNb3cJ164N4oB04vo99MX4a6
	464U+U+kF5FkGa+TZluW2NaEHsTq0YAt3IigmNIU9f+vHiqItbP9H8ujMDuuna/I
	FT/7m4X3l/nNULJLONbLIDJAeIvcRtnlEZfJ354TgdUmSlwfpX+E3dGYwQbVH2kx
	ITA9MlkappYErFN1R9AULHf92+FrBfnfOs0NKCAYyShAEZ9jBydK1S5KDtJwro6P
	ywaholYFMqegTPhf4VwNLH+YFg1HDucHI5Pk9hvSodM9T4gMTP3aWDOQsNdx7GZK
	OPshH6RdUvsXJy9cdlijhRFY9XYzh9UDLZO8iEDCgUrbFExtaRMg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg21q61qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:21:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66MLIX6Z010488
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:21:43 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012041.outbound.protection.outlook.com [40.107.200.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxrvw5s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:21:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwSfBHVaZfR0vJHkeRWnFfF7va3gv/EnYcUh68jdexapttSJVA5BJ1vy4N4BIt4KoVnL69qrBMthMQT28KaDDGo3ZWln8S3SA/BdG3qRXCMWlINT3MG/zivw4kLz+Z8gJbDvjUSbVfOUvVpTmKEg9qx/eGh2TpWHE/YUyD8zdtfJfomUqWQ5zLwC3aeXPHN2NsYH1R/ro+ilfF21cYOR3Ewp5xgbWumCfe3TtXJs10NA61/ngXYXs44DuTG0o4oLPONon3ANP2gX5Csl/bKYMtDh7utkMVRIf9NvGOkp1s7/W83sWMug6wnvm45ReXTi/H0T+A/E1VmhQ+zrdMu1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+bJnsEN4hN93FwM3MlZcH+rSUFOVJOoUeSEsewrR28=;
 b=K42Gnj88WlSIVPCrmYBxjLwDSJKyqK40I6bpHibk8JAc17FWIUFnjwqSNCzbGEOB3gUu7sWH4/3q2q/EY9FgG6Wyk8zeK2ppU2aT5Q5hmXA8vQoeCScpf8PUKrdIWb0/moJ+hs7VbYEzWAWR9br2j41wfUqXo6go3jESieg1xjEtFeJ0aos/t1+GAbRx1OOy7xojwCKTVUNV2//c2DOMbP6hLkUqkRk3hXL4SUMROLco30putDLZw/M5861P4I8dAIFaFUGd8Nm5Hmvobeyke2I3C0jzYeGIdxogCJk4f+4zsOjUGncPmlrTOq2kH5UXPv2qIKHpcUNnHhQrrIWzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+bJnsEN4hN93FwM3MlZcH+rSUFOVJOoUeSEsewrR28=;
 b=BZHfRSirox2l76bx3GrLrAnPiDx1MtfxhDADOTc0KZaBDhs4wpRZtoxhNR98CUp5rQkgJfeXi+sf9+bGidmSNPH/D9Mjzy6MsgSSTm57Sjk003Oq1doiPzu6KSggmmkgJ4O75MP44OmqJp5cJxl7PYNow0u1BV2qi94KCJVZjAw=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by CYYPR10MB7569.namprd10.prod.outlook.com (2603:10b6:930:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 21:21:32 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 21:21:32 +0000
Date: Wed, 22 Jul 2026 17:21:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/7] libdtrace: share vmlinux BTF/CTF globally to
 support faster startup
Message-ID: <amE0WSxviiSt9OKR@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
 <20260721152452.184842-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721152452.184842-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|CYYPR10MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1d5790-2d65-493e-f671-08dee83733ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 bqVWdUhZBUUXVxTSoSRduzmlGvvCvL9OpBCdrr0gCCqbApOKUvs4qoSEfHVpIZ5EEgDap7+uFf/Hp9TPHEQXfXBI1jBA3mkigXWEWDT92gpoao5CpBmRii8oVW+W9fakJfAnS/cJvxEVFtXrGlGhegbZ2ST1pEPRsjusGTrWRGBgSMX37H6mSBkIFDusJs9mOpR5QXplxZ1GlaaimiCDswI9TNlvc6xi3zA6eINq46ESGCZpIEDCNrjHfcMr0KHIugKUqfvHBCus+EHhtfU6jcFBkZmheSlacdMPIvcUEiZQZkQATkCgz0RzV0x9VK561xrBv5IS7R02pCHcdBdWbSNrjuX24f3Uf6b47/lreAtbEdNh4F2hV8q0vlM8rSDjZb2Bk4uEjaFjJUGyk6DvKCaUChb9s6PDhEEeqjcn7TV1vS15AIqhlLVqYsDjYyc1+waZ6G0arpiXDnSFv2oeQKW2DzqJ77c53nCvfAW6OqpejAbeM7h8HzDex82wdCNXKzF1/HmhQctZbxhPHSLmFvhxU/xM6hd7fA9Dz463h7q2mIlzqYiv5GdZFIlRNeRaC5TcvWiqfYpDj8ioO/sCZgblUvkO8AucU+K733MEil2zQ04yRWYphSMAifA/quGIaa1H+FOmhcTTAQxTWD9uek3Ilu3nS7pQy9W9D6UI+J0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Fc4P43hRbNhLm2Y40IiqVErMDefZFVy+Xv0Icqxw0N2YQpqgB3beM1ymrt3y?=
 =?us-ascii?Q?2wU5jLiibjRBN4fhn9G3GcG9H7iHN1qgiPe1yfHh5R1+b+k8+TODfcWaymxh?=
 =?us-ascii?Q?PBEvuI1u1rxt6SMk20udWjaSISwxfzxuDMGzs+roUKbNkAzv0HrZIfzCG1TL?=
 =?us-ascii?Q?YMOB1a2lwJ8DYfBwbGtepOB02uVilz7SQ4Eg4gu9YqvjiBX26T/E5+/ljyYB?=
 =?us-ascii?Q?o0O4vTv0Az3s6Dh88pnDJpGFAhrB6H2zxdJddOtPWVzZQ1607lN15hs7z/f/?=
 =?us-ascii?Q?5CB9Vo8veFOI0QdIgJCL6iweRoUjtBV0KU+Pf/QzQjTiivIlrKN4B8TJANpt?=
 =?us-ascii?Q?KRSPcoYrRcYX/+xOYEXA/DAIaAZI35CbnUCzT3utoVFZFiJXspgNs8U5siTF?=
 =?us-ascii?Q?qrAJUlfOe+sLdYiABlKZsAXD5enoazficp7oyXCfdiC5zIZm1aFN/5UPclT2?=
 =?us-ascii?Q?Ijh4qUpiUlkdgsVzoXMYylXVowL7SaLgM+YlbZj4p7vfgfpFEPqVYOWNmJsz?=
 =?us-ascii?Q?mKHsw2qI/2psm4H0Qz1tRUaOI9UwFomFBC1NnJtF3JW08XfYFuF8v61scoSt?=
 =?us-ascii?Q?pDAytTh9OY8z1YWrW/CKX28Qy0MlefwMDEb0dKhlGniOYPQ77xPuKo7ywgbV?=
 =?us-ascii?Q?gHjR74qslRdFqby9XWJ8Mg804HuGIadCPR24wtQNE5iutZKjaM6Yh0J4bkhd?=
 =?us-ascii?Q?v0lMBJFJiYnwZR1KdgSvzo7L+87WZisdER7Mgb12Rd7w/sgwXrtrgUhVYzm9?=
 =?us-ascii?Q?fBIWfRYY2uH5znmPprccAF59eNGgldAYMa2zYBY6v0OpkfF9BOZlkh+Y8wBw?=
 =?us-ascii?Q?Oj9gp7ELwELp0pPy5lfvIKyOHmnyxjxi/P+mT2jNCGwfGBCbd35eoyRih8sa?=
 =?us-ascii?Q?XyX17KJDBKNHvNRNNkjHhNILO/Ln+XD8Zonwb+6zsOiCCiHwsNkUU/aQZtMo?=
 =?us-ascii?Q?rk5TqxD1wzfzHPJ0ZbOejhvfo1RZ1YuZF/dA+BufzO20EDvuYjtHaABwa73f?=
 =?us-ascii?Q?6W8TQQ3jZ1nH4b6pWI+2rzjZTBbHHTIf/3FYTZFBApWVq9T9s5/ibbUb39Pd?=
 =?us-ascii?Q?sR9Ql0UTLV9M9lB6ZoQb43Avr2XKMjviZHiSfQBfXQIJu56Jdy5zoIyfu8Vx?=
 =?us-ascii?Q?D2o9Bg9h4sREze4ElNrkJP8jv9n985Yz7CJTK1vGQgVUmHQPH4TnFzhVps20?=
 =?us-ascii?Q?5cMUFIukqMDOHIsyqw0V6qnucCGvungj15tpFXEFDCOj0RCiWt0TQmWc/pkO?=
 =?us-ascii?Q?Ra+1+qDgNT3tDewReoQiWnEW0HyPx07/Pznci6y++Tkf7WtLx1prvBRcKbPV?=
 =?us-ascii?Q?mDa1qcW/5FzHhK9R9U56taN6gMIMHvaSp36MK2at70PEBIJWH8rHjgW1MF+x?=
 =?us-ascii?Q?B60gxFpa5s2fRSN92X9QC0ptQ3NPElTJ57mAGvOz33x4EnXYFSpdu1D1PxGg?=
 =?us-ascii?Q?suVzFXLVT4ZZsbwSGwuSOwXOIOn1vvJozzNEV2J2gKCz7AL9SI6kttIFDiws?=
 =?us-ascii?Q?/4cs9jCvKHSdz2MW1MVjsqmSFb5dyEKMZ22vUZpdQaLVc9jawwP6Q9YsUb+q?=
 =?us-ascii?Q?O/QUGwraz2cOsGh97kJ+W5aI7cjgXZXIkBAe/xEcM1TD92zpHWj4U1Tqrdq+?=
 =?us-ascii?Q?5E3H361R2iNjWzRxmiVICaPxnu0XAxsqvdzAPiZK6Lwe42CNO/dqoaCEahCL?=
 =?us-ascii?Q?Jy1B1MgAbr4DNNn6JFr7csoWCbSPjB3xWZHFZIZA/MGFPDo79FkYj7+GUsFX?=
 =?us-ascii?Q?x7wuoS+2og=3D=3D?=
X-Exchange-RoutingPolicyChecked:
 TO16FdmHEdTrmMYM8zG+z5ABHqqp6NFYqycV64RYd6OUhksesf807Kj+WJA/cL5rMVLcny1EXKMQbbe+Lt60LCp18cuAdVduFToAYuDHM2KYPOfXNOyYREZTMC3FEKq21mF2SXqwkiN0sK0G0h4ONIjvmOFvY2iR+DgcFadxkaYPXQKCngHkH5MeNhbJBP2KMufymqSjBPn3Zi5gSgP7NymnNfpZdEDU7rdVOquB1OF6GHaaky1OW2nEqsNRBxXZU92613QbaMgVBNnICNGDWID3Z4VdeD7sKbNRpgiBgJBX4R2NqL39O/LlmqhyqBMCYrRkSWwsBXrB/R1OtInA9g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 1/qBnuwwRtaeRpAgIwVAfDgOKXq5AIAX8DNPT23dqKbT9Ns9CVKfnwlNH8I5giImGw3ltVrllV04BAc55Vmc5mD91CZPRffO0AVLbntJa6YnqoHPBBM03UfmYXyrFZpl+Pa6i+cRHK7+MzsDQv0OW687hsQmrjlTaUaZ4G180jk8CYC+zshuGyjT3eWMDKb5Of54XWPIisEI0hJcPlNYYFTt21/DZ+u6Pda39udhLCzJ4AJS4gEN2UrAzf2Wg5hATkJr6zGzGn6DK6Vd4X56YyMaEr6NzHrIhIpRDXksVBFYihcw2PkIsagWjcFedUJojH1j5qNxz4ULJl9EaRPOpO4vECeOsl3y2t2Ilninj9xBzHMANH+cKzoUJ9E39r8U41yOpWeIX/WTcxl29Ns9r+3waQH3+LdOuQkU8ytbHn5NlCGJZV0pdmX041qF6FOyf8Dcee+IUg1UOYV3cihFwSNN+GatWN9STxQy6rYvXnYYklLv/wgd2+/tiFuQrroe9kg1sMgZhiczsBfgcQ7tDWGX7YijIwB3i9GbW1p+uJXyyOcQ1V0GKqJOadbAAFy5U5MtbhJt7GKBGuQsooQ1a01Z6hZ2+RYJYpOtbcv4/fE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1d5790-2d65-493e-f671-08dee83733ca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 21:21:32.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvESZXxAndgbmjSdeRvtG28rpPK7vZ3RJxR519DnxS5aLHUf1OFTHdoiEqSMHtmrUYMLCfNAUveGrTeogg86gWEN6Il7OfmyG0rqdf8fGik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7569
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2607220210
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIxMCBTYWx0ZWRfX6PKhDSKOwklM
 HBBkxcdYhrHujT2Yn5l89ITT4jfl7ANpXVaHF8D5qlDx/HQ7qgC1REfzr+xNnsiw8suMuxuG7pq
 VfmUHAQKC8/jU5u4tTPb/Vm/rkizmY8Wmb7JaoIqTjzhUPB/rNsh+N6HZ6T1DFlG8jxR9TId6Dm
 urYUby9BhWF3neLt5y7OHxjTHjGyzNESl4b4WI0Pu+ZkU9f+YeQroz0L0XySKz232FJo4khZaSz
 84VjaoWXey4vkPK1N8PPadXpM16EzNPwRUQeXOn0GsHlIY/Qk9DRKZdrCKV8r7V2AH/LroGbtY6
 iEyscTU7bIbUA9FIYFDPSCoaYYdgC5Jhmnkb/e5D9OsuHEF/RmnVp+kjS+2VF9ssQnf6Lcafn9u
 Vmw6RSHaclU1FHX5N59XZGebYBCYS+/n6Arga2Knp7qx+Wo8sUDBd2u7pG1IwXhW7RrCG4ixnT7
 cMS/Z6BqyAhkX7MB+vxyYvF1Ahao906K6SXBx5PY=
X-Proofpoint-GUID: wljTQyg4vvCdk8JgFaoPJOvKK8E2z152
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIxMCBTYWx0ZWRfX9XsczqZQ6L3V
 noY8NmpdTKo2jmHutMb6zD1o4BT9MXWrykBsunkgutH3501Pf1IxoWVYIZqFFW9t82sXHMSn7fi
 Q1CVu8JXKPsYKwW2ee7KIcU2fGDsADJW/W6rskL5dDUYJqKJPF4A
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a613468 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=78bWOZZpiNT-zJRIkdUA:9 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12115
X-Proofpoint-ORIG-GUID: wljTQyg4vvCdk8JgFaoPJOvKK8E2z152

On Tue, Jul 21, 2026 at 04:24:46PM +0100, Alan Maguire wrote:
> In a multiple DTrace session per process environment, it makes sense
> to avoid doing expensive operations like reading in vmlinux BTF and
> converting it to CTF more than once. Shared (vmlinux) BTF and CTF
> generated from it are shared and reference-counted globally here
> to cut down on cost.  With this change, we can launch ~1 DTrace
> session per second.

There are a few logic issues here that need to be address I think.  Since we
do support -xbtfpath and DTRACE_OPT_BTFPATH, hardcoding the path to vmlinux
is an issue.

Ideally, this code should allow for both shared and private type data.  I.e.
if a -xbtfpath opion is given or DTRACE_OPT_BTFPATH is set, then the instance
will use a private copy.  Otherwise, it will use a shared one that is sourced
from the system default.

More fancy would be to allow multiple shared ones, keyed by full path (and
considering that it will be very very rare to ever have more than one).

So, I would suggest going with the first option (shared and private), and the
close code can check whether dtp->dt_shared_btf == dt_shared_btf.  If so, it
is a hared one so handle it that way.  If not, clean up as a private copy.

> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_btf.c  | 61 ++++++++++++++++++++++++++++++++++++++++++---
>  libdtrace/dt_btf.h  |  1 +
>  libdtrace/dt_open.c |  5 +---
>  3 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 1f793397..e46336f9 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -693,6 +693,9 @@ dt_btf_to_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_btf_t *btf)
>         ctf_dict_t      *ctf;
>         ctf_encoding_t  enc = { CTF_INT_SIGNED, 0, 0 };
> 
> +       if (dmp == NULL && dtp->dt_shared_ctf)
> +               return dtp->dt_shared_ctf;
> +
>         ctf = ctf_create(&dtp->dt_ctferr);
>         if (ctf == NULL)
>                 return NULL;
> @@ -764,6 +767,56 @@ out:
>  }
>  #endif
> 
> +static dt_btf_t *dt_shared_btf = NULL;
> +static ctf_dict_t *dt_shared_ctf = NULL;
> +static pthread_mutex_t dt_shared_mutex = PTHREAD_MUTEX_INITIALIZER;
> +static int dt_shared_refcnt = 0;
> +
> +static int
> +dt_shared_get(dtrace_hdl_t *dtp, dt_module_t *dmp)
> +{
> +       pthread_mutex_lock(&dt_shared_mutex);
> +       if (!dt_shared_btf)
> +               dt_shared_btf = dt_btf_load_file(dtp, "/sys/kernel/btf/vmlinux");
> +       if (dt_shared_btf) {
> +               dt_shared_refcnt++;
> +               dtp->dt_shared_btf = dmp->dm_btf = dt_shared_btf;
> +#ifdef HAVE_LIBCTF
> +               if (!dt_shared_ctf) {
> +                       ctf_dict_t *ctf = dt_btf_to_ctf(dtp, NULL, dt_shared_btf);
> +
> +                       if (ctf)
> +                               dtp->dt_shared_ctf = dt_shared_ctf = dmp->dm_ctfp = ctf;
> +               } else {
> +                       dtp->dt_shared_ctf = dmp->dm_ctfp = dt_shared_ctf;
> +               }
> +#endif
> +       }
> +       pthread_mutex_unlock(&dt_shared_mutex);
> +       if (!dt_shared_btf)
> +               return -1;
> +       return 0;
> +}
> +
> +void
> +dt_shared_put(dtrace_hdl_t *dtp)
> +{
> +       pthread_mutex_lock(&dt_shared_mutex);
> +       if (dtp->dt_shared_btf && dtp->dt_shared_btf == dt_shared_btf) {
> +               if (--dt_shared_refcnt == 0) {
> +                       dt_btf_destroy(dtp, dtp->dt_shared_btf);
> +                       dtp->dt_shared_btf = dt_shared_btf = NULL;
> +               }
> +       }
> +#ifdef HAVE_LIBCTF
> +       if (dt_shared_refcnt == 0) {
> +               ctf_close(dtp->dt_shared_ctf);
> +               dtp->dt_shared_ctf = dt_shared_ctf = NULL;
> +       }
> +#endif
> +       pthread_mutex_unlock(&dt_shared_mutex);
> +}
> +
>  dt_btf_t *
>  dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  {
> @@ -774,6 +827,11 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>         if (dmp->dm_btf)
>                 return dmp->dm_btf;
> 
> +       if (strcmp(dmp->dm_name, "vmlinux") == 0) {
> +               if (dt_shared_get(dtp, dmp) == 0)
> +                       return dmp->dm_btf;
> +       }
> +
>         /*
>          * Default: /sys/kernel/btf/<module>
>          * If "none", disable BTF.
> @@ -792,9 +850,6 @@ dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
>         btf = dt_btf_load_file(dtp, fn);
>         free(fn);
> 
> -       if (btf && !dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") == 0)
> -               dtp->dt_shared_btf = btf;
> -
>         return dmp->dm_btf = btf;
>  }
> 
> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index 2c921a03..b1ed2b65 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -18,6 +18,7 @@ typedef struct dt_btf         dt_btf_t;
>  typedef struct bpf_btf_info    btf_info_t;
> 
>  extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
> +extern void dt_shared_put(dtrace_hdl_t *);
>  extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
>  extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
>  extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 30b8758d..352cec49 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1299,10 +1299,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>         dt_htab_destroy(dtp->dt_mods);
>         dt_htab_destroy(dtp->dt_kernpaths);
> 
> -       if (dtp->dt_shared_btf != NULL)
> -               dt_btf_destroy(dtp, dtp->dt_shared_btf);
> -       if (dtp->dt_shared_ctf != NULL)
> -               ctf_close(dtp->dt_shared_ctf);
> +       dt_shared_put(dtp);
>         if (dtp->dt_ctfa != NULL)
>                 ctf_arc_close(dtp->dt_ctfa);
> 
> --
> 2.43.5
> 
> 
> 
