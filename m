Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86261801
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765221; cv=fail; b=cxolkM0MddzahmgYYbapuJwVkju1KGQqfHqUCwUggKbGnKzXZXdt5m6Yg6ufv2HqSt++yhpl0rAYs7x/2bYoz3+aLZeOJiAvkZP3Gm5RDCw2s+CYXboUT87ygQMbGyNt54UHI5pKbimjtYvoQYASph+DZdAL50n0ZnxtOs2rX3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765221; c=relaxed/simple;
	bh=iI1qmHSCze7htKT7Rsk/alic9H/8nDi0nhPMA48VmfQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G696eig94y05YhchUEDspvznaOV1fDzuGCeLkHwykIN9cEzyIAJQFcmqaDrIRw9jHF015zc7OJCeghPOnCg2zDrveIgrZ7ht04lOLjQCltQsbHXjn0KUg3Y/tcGF6cYyZQk0j1/kRO17kM3YmT8FwCaXR0sF0xs3vLzFqULE6xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N1Q0BlAZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GdDrkphM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N1Q0BlAZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GdDrkphM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Lh6xx006110
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=JjGA431DHUMiJFWO
	6mXmi4SALmg9wyKVI3VdA51HV/M=; b=N1Q0BlAZzp0Dj4WkHPXLNp7T6MUhr2rU
	xMWPrERe8dhYQd1f8tSIHvr3kQT2qvkRPkK8+xuhiVyM6TUvKrwreRmy7I5Z6bAy
	XDtFrIpumuI6npBfIiS8ASdlLG9gNA3bIqLoeoxPoVA9pi4cQ/j+usZcO5UG5h9Z
	7MXHjbd0aSBKABn1A5Q1lDyCLevUr4HtNtLwtHft8izG9Q9l2WVvuU8ndpuWT1Y0
	fgPQZt0lMDCV7MgO+zwrTNCTQZhnMzid/k7Q9t6h1BzSzKxoGTT1BdzsAC5/umfV
	zOG+9U1JMk9i9S2LWoRnnBPX+EEX1fZfRpQpGAR4DE+Z80awcI1vSw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpsm44q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Mn6oK009712
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahcrj4b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+ed1jexUmOORlv2R258/abCV+w3LoBYbVV2XiT/S6FD4/WzxY9vb2uMumqzy8ZyLXZLX5txm8Ky2sBo+n6JMKf5YyC+uadSoZrNyzq3afBIxs2Ms9552S+LnHOPt0n+Xs8IfZPcpA7ofBXZvarixJv4pxFst4MYh8R9IH5vkM5jgxn1Y3AfdgBe2RIvR8UJs9TJy7TOVH+Qu0syVaD7ze0fm7otcFPWuFg1wuS4ZYW0CdC110vfZRd12iqoPI9LYyotPeALRZGLfb4KMClpH5oXq2y2pW7WK5ZpApIdrRrwBFhdqIJllNNTRXDpVTK4ptX7VbCzFssSElrM8w5R4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjGA431DHUMiJFWO6mXmi4SALmg9wyKVI3VdA51HV/M=;
 b=wDt6ZAYhE+gad3jVvuWIaOIeVvsXwzYANWECkSj1+HKr1ucU3+3oxIVY5GRR0XDJP9HgkgIjhCrN2+MaSEk6cF4hdeoa7q8i89Qa0MIwDLt83HussTTBYc0W3SQYDrq7/K7OvISdMBh51eOdajJ6iAQHMOEz36PtiVL0oAoM/b38xHBJFRvxFUHjyHkvatgri+yhJsctqKTuX6ju3zoyQ/C/j2VitAHn4Mu2OcN0HA0IJMW52/8TU0tja5ZodBYYmFAHuj0dU50AuIeze6VFuuiiLqqBwNW2wpRAR3BwZ453oCYXNhqaCWULcOX3MrFoAGbO5V5Zv4fR5KC886w6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjGA431DHUMiJFWO6mXmi4SALmg9wyKVI3VdA51HV/M=;
 b=GdDrkphMbylhCAj8wcFLrSOrSvw5zi0uqKj7sFceLQGozhNQ9DEISquDnUUDDBN2yMjmEjjHyqh9jnCDPlxQFMtitTADfZsK7j3LUC+06j26uPS6xXCl1qc1pQ4QL8dGuY87RXVpuGItKdXBGK3/Isdeks0wj3xQCkAZ7MSc+30=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH4PR10MB8169.namprd10.prod.outlook.com (2603:10b6:610:23e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:50 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:50 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/1] test: testsuite $dt_flags and linker flags problems
Date: Tue,  5 Nov 2024 00:06:48 +0000
Message-ID: <20241105000648.333286-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH4PR10MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d33f28-249f-4d20-4e32-08dcfd2dbf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ntnhprz7kf4877p0dWoDhDYUIqIR6ddXxCuhsVF9VnnLZt9Kf1VrhWrCNPr2?=
 =?us-ascii?Q?65F1TL9dCFQjwdQ5+bvDO4WnEmS97tAsnlrs+kMU0tsm+AqAphH+85egIhrU?=
 =?us-ascii?Q?JTfxIR2Ka3cgvtU3wPEKnLnfl6rr0UEqQrX1nmWgJgwLqWsHaANMWn862qF1?=
 =?us-ascii?Q?z//BVDPEjX8fVPL/SOCS8lpQjPh2C3vZDPpFRfgyAt3lKZ9k3sTk/RoDxUaC?=
 =?us-ascii?Q?BsiyE5Eyh7579VctgsL5bqrD/ZNW+knp7ONvGCg/umsjXjGWtonEujmrDLYZ?=
 =?us-ascii?Q?CjG+7HlQNvMrrtwhb+7ZZ/jxlKpvvANqcs+OQzc49THE8qFIhHIbdyQBd+6U?=
 =?us-ascii?Q?C1aCvOzZiX8DBowx5iPgQeVfdmcQMU/vBoMj174Zvjmo9pevGsB6VvJIvulL?=
 =?us-ascii?Q?puB4Mb43V8nJ6zjNYqHCuj0l/GXhBCaU0DPFNSUQJxtHVemNUjOSv5p3Dm8T?=
 =?us-ascii?Q?RxqQHATwV0/dehMpGNQrUFuBGGs81SByeYdFSkPzT6iO31KgPVwIQXKPCbRt?=
 =?us-ascii?Q?8eUg6aAW2UQGb6FztZ45qfz7rnsI6sUcM7pGjThFuUbziXqySU2yok+sLdmc?=
 =?us-ascii?Q?HWVab3n4S05ZV1MZKYDYOxZcZKspa7LB0NoAVpbEw0fhBW0AlRxNjL7C439+?=
 =?us-ascii?Q?9XPKCzmVB7D7EDkxpc0XtY9lQu2+xK/c1QXctt6atHyOVvl8q4GBGGQNuIWY?=
 =?us-ascii?Q?J9Fa6SeJASTDF1ITc2k5k01K8IylFxyOvVQdJyqLsa49JqxNhVZjcxY45Mrw?=
 =?us-ascii?Q?qMGn9Rhdt9+R0bir1xA3MkGrCrzd1gfwhQHalxCHvG/fN9Fb8A3y/TSjoPKQ?=
 =?us-ascii?Q?mUNO5fghevTgdV7vwNRM7UVrKY+fo+vRR+p8oo8x1cBL60B5o9o4Oe/9/Aei?=
 =?us-ascii?Q?v1p051fpV4mQ6mNKGwpSBH/0A/uJX5G7hlURP2scRrtkQD4GtXHVpT75F8H+?=
 =?us-ascii?Q?+jBg0r0FIfHKbFnDVW30i9kpN4VDS/7te6bwLfvkh8QuR1DC1EuxDycgN1ik?=
 =?us-ascii?Q?B9qxJpPm2+eerB1wGiTAR72dG8dc4VbOJBN54C2UXe/zbE5pwdw81uNqaOSh?=
 =?us-ascii?Q?SV9201KT8lfxpjHAsDmqQi3idsZ6NB2Em9t6mH+qR6qvRlvcIE9hLuiKFA06?=
 =?us-ascii?Q?Bbk2jR2nW9CJK5dy5UxVq8C+UXZZ0zwMjaaserEAajq3Jyaq+QuCPGhLBpsI?=
 =?us-ascii?Q?PY2l92lkXN25mXCSn6uiJiZwXclKkxdmv/hAhaY9RXomYnH+3smadWHLzkpF?=
 =?us-ascii?Q?uWZiRwsbtS1FdEA6B+MN62QQScTymy4FmzQoKYWZixxQGIXR8RODbzUVqBlc?=
 =?us-ascii?Q?2RFGxZgWvv4I3pkX1G3NeaYm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAALLnu6jvNN9qiBZl+yP9wtljlNuGyN+f++ZCG/XUMdhganyyxZf29haun+?=
 =?us-ascii?Q?eJnJB0J4f9pUisepjzBmc/nyKUzPZe3AfbvBMKAqYu80nC+AlzKOG96a6+er?=
 =?us-ascii?Q?touRgbC29UjVvL+vZ8aJmfyGNGuNo3L0ablmRUoHFeprNJFlUMjw/iMNdUuE?=
 =?us-ascii?Q?OOuCZK1m+1+SyjKLx8TFsrfCrvLzCDU+oRPOixb4k53RDeV5uS3d97Oak8Sn?=
 =?us-ascii?Q?Xz81lY9IFn+k+tRnPYJUx2Jm3RXYsfbwTUaxRckVpI4+UK3HEto9JdHgoRuD?=
 =?us-ascii?Q?JtdvEMassXbz9aMpn6gjWylFkMB7qUuxr7IfYC9f52VJ47Qh7xtadDR6+3Ud?=
 =?us-ascii?Q?/I5NEQH2h4TXFz66jB13ZLD7c5OfYdRxnclmaFePF8hCJJ3bj7U2VEK0eQJW?=
 =?us-ascii?Q?Yrk+qfBtssPQrRA/jcZQPkd2jMykyIoZMsJLUBX+SueA5LcHf8UtCPDwtqoU?=
 =?us-ascii?Q?xHFQFf9hMSDajJqC60bHR+Aj21VP9GM5/o6WWAALF+Hi835T56jAKRbDfgUB?=
 =?us-ascii?Q?S296/YK8XR4eCE1Hpn9K0imJjOx/FgdRHDqDGsmaS49tIE/IYIX00mAw4Dy0?=
 =?us-ascii?Q?deL570H4jc3R8Khldd0sdNyKBuj9wUDOvgReLCz00sa+Qvf5ssXvK7f1g21I?=
 =?us-ascii?Q?zKkcon0IlG+AtyPVKHWenW4oDGVe9JsvxZilfVYRMv9YO6J70CJ7m/ppzIvH?=
 =?us-ascii?Q?uTbNqFpZOrqC7pkxPJ50C6ZGzYZzrDI7+ZZ+AQU74NeGLMlU0NlCuIrNJMoa?=
 =?us-ascii?Q?hA0K1srge/3yBKdX0rSXufwePFfipJsR4spINapZUPvuer+6O0rsAC3lxJuT?=
 =?us-ascii?Q?EmXqFETXeG68BZg2W94Wn7dZo3RXQPA6+k8kXTxqYO+vnUbCtrurajP1gspg?=
 =?us-ascii?Q?pPbhMBZOTMzvSKMjlhhGBI6e3HddOHYdrahQLt91K4Vrad60NirSzvDDwzMb?=
 =?us-ascii?Q?bdD+pHDg69Hm/8eaCT0lTALnpaOOS18A6jYqRv49MtnMm4hriMnzBfZ9ZECW?=
 =?us-ascii?Q?DBYvlgv3KMFF8yo+dWuEXGvl2WcEacLl/aRzu4YSuutnUTh86R8gV/UKnk8I?=
 =?us-ascii?Q?p52tDYmo0H3ppSp9lmH5f6UevDg8r6yNeZQ/aJvR3lKsxcAOSk+TY5aZNd3b?=
 =?us-ascii?Q?Y4Bi5fRXS/HyST3x4vN2dq2a2Iq183upWJfrNMFPupVgZtqcuP6v7/8kgaBa?=
 =?us-ascii?Q?BdBECK/HNtR3/2+8RLWjaECpNQBB0l2WAeZemMZXe0y9om3ACaC2fmDYvO06?=
 =?us-ascii?Q?7mELCNPi/mWX61k9OiWds0M24TN0iL/A7ePwT5LZsyyKj422gcLOW+ywxWiC?=
 =?us-ascii?Q?lenc3PpUF2vGJTPQ0Dhq+pjV2ZdJFkQEE1OfbSuOXKTGi+2uSwDzCj+5B2ql?=
 =?us-ascii?Q?9URzOlfc0gn2sTZWPLf4lcHjGnH7+m35fh2tjRfim/fJBWs6JQ90zC55hSt3?=
 =?us-ascii?Q?nMXf8BJQ6dq4DXrY8yUck2d2skCBdm98+J8VhILAyjBa2TNQB+DYOZVRJVap?=
 =?us-ascii?Q?Elp/zK2+r5vrt4xDb7oo5jrlkM5Huyezss/Vr0k67EdgNGnrdPCIMe4az2Ys?=
 =?us-ascii?Q?6Z6Z+pVCJ8/4NjHHn+lMn9rNrbMFWsNlQbiWpW/k2uue9E7shfrBpcfqy/dc?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aHly199WIqAQ/Ia260h0LAxhc/N/EdPW3yphsgE2Uk5TluK/PJ4A1+dnUcKDqVD8BICXynQLDoZ0K7dbWqyi5gbfqgv2wBoxao4f6tapo22oIt7Pc/SvG4+emGUcUo3uQ4FW9Gq44Gpj1vvIn+p8JE4syDy8UZbO6FAzBx54FwgG85UJZYRW0tIUPGv10Hpz3lwlFn8Y7nQpAHlrdTFUWgcgkDc+GIQy92fclA9qry+Y8EjUs9lrJY5gqC7NWPmt0mAMZ3rKKj90zi7+vrvhiibwWAj4hJgo95/VB77DwubwZ3MX/picAcsyi07U1BPRS3WCmbL7iz/zCapbeZYp8Ux48WhNGZS24SHuoXlZeYKBev3BVOovNp3Eqfq3a3APFmkm1IhtUD3yzhW6691oFFCUfwIGntsV5UNf4Im47dXokqkfutT5mGcjc8UD/TILRT2U0AkCxhWVEzaOLXfrpXYWNRNou0yuygSth0RhQb0yc0Sfw9r2ksaGx1yScHTcG3J94u66NZt/wGIKGYVJ9PfAvCVaWKbKExy91a2pPi5/xiexpn0TPyyt2M717ygrQTcXg6vJdojmgdMzSR38ncsPSfBgMgtG9UkerLeaDGY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d33f28-249f-4d20-4e32-08dcfd2dbf59
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:50.7850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7LMehtxCU/+hly7Nkgcx0CmLMsqgJzH4G4AT1tfeJSC0hCHPGFOH4rCWCA9YvZOhn42Qjf/LMj/dxBMMwtC8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8169
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040192
X-Proofpoint-ORIG-GUID: 04Zq0HAnwDFYzf3yUHM4RX9z80s77My5
X-Proofpoint-GUID: 04Zq0HAnwDFYzf3yUHM4RX9z80s77My5

The testsuite passes in a $dtrace environment variable: this must
be an ELF executable because some tests use it in hashbang lines,
so necessary flags are passed in in a $dt_flags variable which
must be passed to every dtrace invocation.  These flags are largely
path adjustments (-I etc) pointing DTrace to the in-source-tree
testsuite or the out-of-tree SDT headers and such things: as such,
it's unfortunate that a great many invocations were missed and that
those invocations were largely things like -G that actually *use* -I.

It also passes in a $test_cppflags variable which is meant to be
used for C preprocessor invocations, but many tests which should
use it don't use it, leading to the possibility (and, these days,
the likelihood) of picking up SystemTap <sys/sdt.h> instead, or
simply a compilation error if an installed testsuite is run.

This uncovers another bug: the -I flags passed in in all the
above cases are relative paths, so they are wrong for any tests
that cd, such as almost any test that does any compiles (which
all cd into directories under the $tmpdir). Make them absolute.

runtest.sh also populates a test_ldflags containing -L arguments
for libraries in the build tree, but this is never exported or
used by any tests: pass that in too, and change linker invocations
to use it instead.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.sh                                    |  3 ++-
 .../locking/tst.DestructionDoubleUnlock.sh    | 12 +++++------
 .../locking/tst.exit-process-kill-races.sh    |  4 ++--
 .../headers/tst.header-endianness.sh          |  2 +-
 test/unittest/actions/symmod/tst.symmod.sh    |  2 +-
 test/unittest/aggs/tst.aggmod_full2.sh        |  8 ++++----
 test/unittest/aggs/tst.aggpercpu.sh           |  2 +-
 test/unittest/aggs/tst.multicpus.sh           |  2 +-
 test/unittest/arrays/tst.uregsarray-check.sh  | 10 +++++-----
 test/unittest/builtinvar/tst.errno3.sh        |  2 +-
 test/unittest/cpc/err.cpcvscpustatpart1.sh    |  2 +-
 test/unittest/cpc/err.cpcvscpustatpart2.sh    |  2 +-
 test/unittest/cpc/err.cputrackfailtostart.sh  |  2 +-
 test/unittest/cpc/err.cputrackterminates.sh   |  2 +-
 test/unittest/cpc/tst.platformevent.sh        |  2 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     | 12 +++++------
 .../dtrace-util/tst.ListProbesFuncUSDT.sh     | 16 +++++++--------
 .../dtrace-util/tst.ListProbesModuleSDT.sh    |  2 +-
 .../dtrace-util/tst.ListProbesModuleUSDT.sh   | 12 +++++------
 .../dtrace-util/tst.ListProbesNameUSDT.sh     | 16 +++++++--------
 .../dtrace-util/tst.ListProbesProviderUSDT.sh | 14 ++++++-------
 test/unittest/dtrace-util/tst.ProcInvalid.sh  |  2 +-
 .../fbtprovider/err.D_ARGS_IDX.void-void.x    |  2 +-
 .../fbtprovider/err.D_ARGS_IDX.void.x         |  2 +-
 test/unittest/ip/tst.ipv4remotetcp.sh         |  2 +-
 test/unittest/misc/err.lockmem-pragma.sh      |  2 +-
 test/unittest/misc/tst.include.sh             |  4 ++--
 test/unittest/misc/tst.lockmem-cmdline.sh     |  2 +-
 test/unittest/misc/tst.lockmem-envvar.sh      |  2 +-
 test/unittest/misc/tst.lockmem-x.sh           |  2 +-
 test/unittest/misc/tst.parser1.sh             |  2 +-
 test/unittest/misc/tst.parser2.sh             |  2 +-
 test/unittest/misc/tst.parser4.sh             |  2 +-
 test/unittest/options/tst.bpflog-cmdline.sh   |  2 +-
 test/unittest/options/tst.bpflog-pragma.sh    |  2 +-
 .../unittest/options/tst.bpflogsize-pragma.sh |  2 +-
 test/unittest/options/tst.iregs.sh            |  2 +-
 test/unittest/options/tst.linktype.sh         |  6 +++---
 test/unittest/options/tst.modpath.x           |  2 +-
 test/unittest/options/tst.strip.sh            |  8 ++++----
 test/unittest/options/tst.switchrate.sh       |  2 +-
 test/unittest/options/tst.tregs.sh            |  2 +-
 test/unittest/pid/tst.offsets.sh              |  2 +-
 test/unittest/pid/tst.provregex3.sh           |  4 ++--
 test/unittest/pid/tst.provregex4.sh           |  6 +++---
 test/unittest/predicates/tst.predcache.sh     |  4 ++--
 test/unittest/printf/tst.wide-bug30404549.sh  |  2 +-
 test/unittest/printf/tst.wide.sh              |  2 +-
 .../providers/rawtp/err.lockmem-too-low.sh    |  4 ++--
 test/unittest/syscall/tst.openret.sh          |  2 +-
 test/unittest/usdt/tst.allargs.sh             |  7 ++++---
 test/unittest/usdt/tst.andpid.ksh             |  2 +-
 test/unittest/usdt/tst.badguess.sh            |  9 +++++----
 test/unittest/usdt/tst.corruptenv.sh          |  8 ++++----
 test/unittest/usdt/tst.dlclose1.sh            | 20 +++++++++----------
 test/unittest/usdt/tst.dlclose2.sh            | 18 ++++++++---------
 test/unittest/usdt/tst.dlclose3.sh            | 18 ++++++++---------
 test/unittest/usdt/tst.dlclose4.sh            | 14 ++++++-------
 test/unittest/usdt/tst.eliminate.sh           |  9 +++++----
 test/unittest/usdt/tst.enable_pid.sh          |  4 ++--
 test/unittest/usdt/tst.enabled.sh             | 11 +++++-----
 test/unittest/usdt/tst.enabled2.sh            | 11 +++++-----
 test/unittest/usdt/tst.entryreturn.sh         |  7 ++++---
 .../unittest/usdt/tst.exec-dof-replacement.sh | 11 +++++-----
 test/unittest/usdt/tst.execstack.sh           |  9 +++++----
 test/unittest/usdt/tst.fork.sh                | 11 +++++-----
 test/unittest/usdt/tst.forker.sh              |  2 +-
 test/unittest/usdt/tst.guess32.sh             | 11 +++++-----
 test/unittest/usdt/tst.guess64.sh             | 11 +++++-----
 test/unittest/usdt/tst.header.sh              |  9 +++++----
 test/unittest/usdt/tst.lingering.sh           | 11 +++++-----
 test/unittest/usdt/tst.link-idempotence.sh    | 11 +++++-----
 test/unittest/usdt/tst.linkpriv.sh            |  5 +++--
 test/unittest/usdt/tst.linkunpriv.sh          |  2 +-
 test/unittest/usdt/tst.manyprobes.sh          |  7 ++++---
 test/unittest/usdt/tst.manyprocs.sh           |  9 +++++----
 test/unittest/usdt/tst.multiple.sh            | 11 +++++-----
 test/unittest/usdt/tst.multitrace.sh          | 11 +++++-----
 test/unittest/usdt/tst.nusdtprobes.sh         |  8 ++++----
 test/unittest/usdt/tst.onlyenabled.sh         |  9 +++++----
 test/unittest/usdt/tst.pie.sh                 | 11 +++++-----
 test/unittest/usdt/tst.reeval.sh              |  7 ++++---
 test/unittest/usdt/tst.static.sh              |  7 ++++---
 test/unittest/usdt/tst.static2.sh             |  9 +++++----
 test/unittest/usdt/tst.user.sh                | 11 +++++-----
 85 files changed, 283 insertions(+), 257 deletions(-)

v2: one test dropped because it's now renamed and fixed up
    (and otherwise modified) in the usdt typed-args series.

diff --git a/runtest.sh b/runtest.sh
index 681d748deaa8..46b532d7e161 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -554,7 +554,7 @@ if [[ -z $USE_INSTALLED ]]; then
     dtrace="$(pwd)/build*/dtrace"
     test_libdir="$(pwd)/build/dlibs"
     test_ldflags="-L$(pwd)/build"
-    test_cppflags="-Iinclude -Iuts/common -Ibuild -Ilibdtrace -DARCH_$arch"
+    test_cppflags="-I$(pwd)/include -I$(pwd)/uts/common -I$(pwd)/build -I$(pwd)/libdtrace -DARCH_$arch"
     helper_device="dtrace/test-$$"
     # Pre-existing directories from earlier tests are just fine!
     # dtprobed will clean things up.
@@ -590,6 +590,7 @@ else
     fi
 fi
 export test_cppflags
+export test_ldflags
 export test_libdir
 
 # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
diff --git a/test/expensive/locking/tst.DestructionDoubleUnlock.sh b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
index 1522f4a6260d..c9b9eadcd93a 100755
--- a/test/expensive/locking/tst.DestructionDoubleUnlock.sh
+++ b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2016, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -41,7 +41,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -59,17 +59,17 @@ main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${test_ldflags} ${CFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -81,7 +81,7 @@ script()
 		./test &
 		PID=$!
 		disown %+
-		if ! $dtrace -p $PID -lP test_prov$PID; then
+		if ! $dtrace $dt_flags -p $PID -lP test_prov$PID; then
 		    kill -9 $PID
 		    return 1
 		fi
diff --git a/test/expensive/locking/tst.exit-process-kill-races.sh b/test/expensive/locking/tst.exit-process-kill-races.sh
index 53bbbf5dd795..187470ab4e46 100755
--- a/test/expensive/locking/tst.exit-process-kill-races.sh
+++ b/test/expensive/locking/tst.exit-process-kill-races.sh
@@ -89,10 +89,10 @@ while :; do
     esac
 
     if [[ $state != "POUND" ]]; then
-	result="$($dtrace -qc test/triggers/delaydie -n 'tick-1s { printf("timeout\n"); exit(0); }' -n 'syscall::exit_group:entry /pid == $target/ { printf("exit\n"); exit(0); }')"
+	result="$($dtrace $dt_flags -qc test/triggers/delaydie -n 'tick-1s { printf("timeout\n"); exit(0); }' -n 'syscall::exit_group:entry /pid == $target/ { printf("exit\n"); exit(0); }')"
     else
 	set -e
-	$dtrace -qc test/triggers/delaydie -n 'tick-1s { printf("timeout\n"); exit(0); }' -n 'syscall::exit_group:entry /pid == $target/ { printf("exit\n"); exit(0); }'
+	$dtrace $dt_flags -qc test/triggers/delaydie -n 'tick-1s { printf("timeout\n"); exit(0); }' -n 'syscall::exit_group:entry /pid == $target/ { printf("exit\n"); exit(0); }'
 	set +e
     fi
 
diff --git a/test/internals/headers/tst.header-endianness.sh b/test/internals/headers/tst.header-endianness.sh
index c5d67b284ac3..e45cc597071f 100755
--- a/test/internals/headers/tst.header-endianness.sh
+++ b/test/internals/headers/tst.header-endianness.sh
@@ -26,5 +26,5 @@ for header in ${OLDDIRNAME}/include/dtrace/*.h; do
     #error $header: needs to include <sys/dtrace_types.h>
     #endif
 EOF
-    $CC -c $CFLAGS -o /dev/null test.c
+    $CC $test_cppflags -c $CFLAGS -o /dev/null test.c
 done
diff --git a/test/unittest/actions/symmod/tst.symmod.sh b/test/unittest/actions/symmod/tst.symmod.sh
index 2950c9b7fa27..d35914212c37 100755
--- a/test/unittest/actions/symmod/tst.symmod.sh
+++ b/test/unittest/actions/symmod/tst.symmod.sh
@@ -21,7 +21,7 @@ NAM=$MOD'`'$NAM
 
 # run DTrace to test mod() and sym()
 # also test func(), but it is simply an alias for sym()
-read MYMOD MYNAM MYFUN <<< `$dtrace -qn 'BEGIN {mod(0x'$ADD'); sym(0x'$ADD'); func(0x'$ADD'); exit(0) }'`
+read MYMOD MYNAM MYFUN <<< `$dtrace $dt_flags -qn 'BEGIN {mod(0x'$ADD'); sym(0x'$ADD'); func(0x'$ADD'); exit(0) }'`
 if [ $? -ne 0 ]; then
 	exit 1
 fi
diff --git a/test/unittest/aggs/tst.aggmod_full2.sh b/test/unittest/aggs/tst.aggmod_full2.sh
index bb984af17794..66cfc002b233 100755
--- a/test/unittest/aggs/tst.aggmod_full2.sh
+++ b/test/unittest/aggs/tst.aggmod_full2.sh
@@ -124,25 +124,25 @@ EOF
 # build
 # ==================================================
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
 fi
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
 
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
 
-${CC} ${CFLAGS} prov.o test.o
+${CC} ${test_ldflags} ${CFLAGS} prov.o test.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/aggs/tst.aggpercpu.sh b/test/unittest/aggs/tst.aggpercpu.sh
index 2103546c3b90..e329097cca7f 100755
--- a/test/unittest/aggs/tst.aggpercpu.sh
+++ b/test/unittest/aggs/tst.aggpercpu.sh
@@ -17,7 +17,7 @@ cd $DIRNAME
 # forcing DTrace to aggregate results over all CPUs.
 #
 
-$dtrace -xaggpercpu -qn '
+$dtrace  $dt_flags -xaggpercpu -qn '
     profile-600ms
     {
         printf("cpu %d\n", cpu);
diff --git a/test/unittest/aggs/tst.multicpus.sh b/test/unittest/aggs/tst.multicpus.sh
index bc4366845ab0..50eeaae44f96 100755
--- a/test/unittest/aggs/tst.multicpus.sh
+++ b/test/unittest/aggs/tst.multicpus.sh
@@ -17,7 +17,7 @@ cd $DIRNAME
 # forcing DTrace to aggregate results over all CPUs.
 #
 
-$dtrace -qn '
+$dtrace $dt_flags -qn '
     profile-600ms
     {
         printf("cpu %d\n", cpu);
diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
index 99dd6980ec28..f55d36d0d97d 100755
--- a/test/unittest/arrays/tst.uregsarray-check.sh
+++ b/test/unittest/arrays/tst.uregsarray-check.sh
@@ -22,7 +22,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -46,17 +46,17 @@ int main(int c, char **v) {
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${test_ldflags} ${CFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -64,7 +64,7 @@ fi
 
 # run DTrace
 
-$dtrace -c ./test -qn '
+$dtrace $dt_flags -c ./test -qn '
 test_prov$target:::
 {
 	printf("DTrace has PC %x and SP %x\n", uregs[R_PC], uregs[R_SP]);
diff --git a/test/unittest/builtinvar/tst.errno3.sh b/test/unittest/builtinvar/tst.errno3.sh
index e88d35bab99e..7546152f6259 100755
--- a/test/unittest/builtinvar/tst.errno3.sh
+++ b/test/unittest/builtinvar/tst.errno3.sh
@@ -35,7 +35,7 @@ int main(int c, char **v) {
 }
 EOF
 
-$CC main.c
+$CC $test_cppflags main.c
 if [ $? -ne 0 ]; then
     echo compilation failed
     exit 1
diff --git a/test/unittest/cpc/err.cpcvscpustatpart1.sh b/test/unittest/cpc/err.cpcvscpustatpart1.sh
index 4d3ddd41f1c1..e82551a12025 100755
--- a/test/unittest/cpc/err.cpcvscpustatpart1.sh
+++ b/test/unittest/cpc/err.cpcvscpustatpart1.sh
@@ -17,7 +17,7 @@
 
 script()
 {
-	$dtrace -o $dtraceout -s /dev/stdin <<EOF
+	$dtrace $dt_flags -o $dtraceout -s /dev/stdin <<EOF
 	#pragma D option bufsize=128k
 
 	cpc:::PAPI_tot_ins-all-10000
diff --git a/test/unittest/cpc/err.cpcvscpustatpart2.sh b/test/unittest/cpc/err.cpcvscpustatpart2.sh
index d565465bc5d5..f55977847938 100755
--- a/test/unittest/cpc/err.cpcvscpustatpart2.sh
+++ b/test/unittest/cpc/err.cpcvscpustatpart2.sh
@@ -17,7 +17,7 @@
 
 script()
 {
-        $dtrace -s /dev/stdin <<EOF
+        $dtrace $dt_flags -s /dev/stdin <<EOF
         #pragma D option bufsize=128k
 
         BEGIN
diff --git a/test/unittest/cpc/err.cputrackfailtostart.sh b/test/unittest/cpc/err.cputrackfailtostart.sh
index 6b2b5fcae917..2170445b2f7c 100755
--- a/test/unittest/cpc/err.cputrackfailtostart.sh
+++ b/test/unittest/cpc/err.cputrackfailtostart.sh
@@ -16,7 +16,7 @@
 
 script()
 {
-        $dtrace -o $dtraceout -s /dev/stdin <<EOF
+        $dtrace $dt_flags -o $dtraceout -s /dev/stdin <<EOF
         #pragma D option bufsize=128k
 
         cpc:::PAPI_tot_ins-all-10000
diff --git a/test/unittest/cpc/err.cputrackterminates.sh b/test/unittest/cpc/err.cputrackterminates.sh
index ee644a92a618..46c1d5bd0396 100755
--- a/test/unittest/cpc/err.cputrackterminates.sh
+++ b/test/unittest/cpc/err.cputrackterminates.sh
@@ -16,7 +16,7 @@
 
 script()
 {
-	$dtrace -s /dev/stdin <<EOF
+	$dtrace $dt_flags -s /dev/stdin <<EOF
 	#pragma D option bufsize=128k
 
 	cpc:::PAPI_tot_ins-all-10000
diff --git a/test/unittest/cpc/tst.platformevent.sh b/test/unittest/cpc/tst.platformevent.sh
index d77bc60cddc5..ca029e95d6ce 100755
--- a/test/unittest/cpc/tst.platformevent.sh
+++ b/test/unittest/cpc/tst.platformevent.sh
@@ -38,7 +38,7 @@ EOF
 
 script()
 {
-        $dtrace -s /dev/stdin << EOD
+        $dtrace $dt_flags -s /dev/stdin << EOD
         #pragma D option quiet
         #pragma D option bufsize=128k
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
index ad8dc2e7c267..06095b2de517 100755
--- a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -33,7 +33,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -51,17 +51,17 @@ main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${test_ldflags} ${CFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -69,11 +69,11 @@ fi
 
 script()
 {
-	$dtrace -c ./test -lvn 'test_prov$target:::go'
+	$dtrace $dt_flags -c ./test -lvn 'test_prov$target:::go'
 	./test &
 	PID=$!
 	disown %+
-	$dtrace -p $PID -lvn 'test_prov$target:::go'
+	$dtrace $dt_flags -p $PID -lvn 'test_prov$target:::go'
 	kill -9 $PID
 }
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index 99ae995ebfcb..587b2ddfb7c0 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -35,7 +35,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -53,17 +53,17 @@ main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${test_ldflags} ${CFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -71,13 +71,13 @@ fi
 
 script()
 {
-	$dtrace -c ./test -lf main
-	$dtrace -c ./test -lf 'main*'
+	$dtrace $dt_flags -c ./test -lf main
+	$dtrace $dt_flags -c ./test -lf 'main*'
 	./test &
 	PID=$!
 	disown %+
-	$dtrace -p $PID -lf main
-	$dtrace -p $PID -lf 'main*'
+	$dtrace $dt_flags -p $PID -lf main
+	$dtrace $dt_flags -p $PID -lf 'main*'
 	kill -9 $PID
 }
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleSDT.sh
index b5d4646af71e..6fd49294dd5b 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleSDT.sh
@@ -24,7 +24,7 @@ fi
 
 dtrace=$1
 
-$dtrace -lm dt_test && $dtrace -lm 'dt_t*'
+$dtrace $dt_flags -lm dt_test && $dtrace $dt_flags -lm 'dt_t*'
 status=$?
 
 exit $status
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index 5ae087fbf76c..1c5cc986ef67 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -35,7 +35,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -58,7 +58,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
@@ -71,13 +71,13 @@ fi
 
 script()
 {
-	$dtrace -c ./test -lm test
-	$dtrace -c ./test -lm 'tes*'
+	$dtrace $dt_flags -c ./test -lm test
+	$dtrace $dt_flags -c ./test -lm 'tes*'
 	./test &
 	PID=$!
 	disown %+
-	$dtrace -p $PID -lm test
-	$dtrace -p $PID -lm 'tes*'
+	$dtrace $dt_flags -p $PID -lm test
+	$dtrace $dt_flags -p $PID -lm 'tes*'
 	kill -9 $PID
 }
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index 5c0509d89138..865e2d00eb61 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -35,7 +35,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -53,17 +53,17 @@ main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${test_ldflags} ${CFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -71,13 +71,13 @@ fi
 
 script()
 {
-	$dtrace -c ./test -ln 'test_prov*:::go'
-	$dtrace -c ./test -ln 'test_prov*:::g*'
+	$dtrace $dt_flags -c ./test -ln 'test_prov*:::go'
+	$dtrace $dt_flags -c ./test -ln 'test_prov*:::g*'
 	./test &
 	PID=$!
 	disown %+
-	$dtrace -p $PID -ln 'test_prov*:::go'
-	$dtrace -p $PID -ln 'test_prov*:::g*'
+	$dtrace $dt_flags -p $PID -ln 'test_prov*:::go'
+	$dtrace $dt_flags -p $PID -ln 'test_prov*:::g*'
 	kill -9 $PID
 }
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 6eae82ed93d7..a5e9b8b9780f 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -35,7 +35,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -53,17 +53,17 @@ main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${test_ldflags} ${CFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -71,12 +71,12 @@ fi
 
 script()
 {
-	$dtrace -c ./test -lP 'test*'
+	$dtrace $dt_flags -c ./test -lP 'test*'
 	./test &
 	PID=$!
 	disown %+
-	$dtrace -p $PID -lP test_prov$PID
-	$dtrace -p $PID -lP 'test*'
+	$dtrace $dt_flags -p $PID -lP test_prov$PID
+	$dtrace $dt_flags -p $PID -lP 'test*'
 	kill -9 $PID
 }
 
diff --git a/test/unittest/dtrace-util/tst.ProcInvalid.sh b/test/unittest/dtrace-util/tst.ProcInvalid.sh
index 54722585d0f2..770ba6028a18 100755
--- a/test/unittest/dtrace-util/tst.ProcInvalid.sh
+++ b/test/unittest/dtrace-util/tst.ProcInvalid.sh
@@ -22,4 +22,4 @@ fi
 
 dtrace=$1
 
-$dtrace -p 484837947 -n 'BEGIN { exit(0); }' || true
+$dtrace $dt_flags -p 484837947 -n 'BEGIN { exit(0); }' || true
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
index 35e10c72dc1c..ee3e214b7c40 100755
--- a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 
 # Skip test if FBT probes do not provide argument datatype info.
-types=`$dtrace -lvn fbt::oops_enter:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+types=`$dtrace $dt_flags -lvn fbt::oops_enter:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
 
 if [[ -z "$types" ]]; then
 	echo "FBT probes without args[] type info"
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
index 46cb9d0d0d24..cc2b78845fa3 100755
--- a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 
 # Skip test if FBT probes do not provide argument datatype info.
-types=`$dtrace -lvn fbt::exit_creds:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+types=`$dtrace $dt_flags -lvn fbt::exit_creds:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
 
 if [[ -z "$types" ]]; then
 	echo "FBT probes without args[] type info"
diff --git a/test/unittest/ip/tst.ipv4remotetcp.sh b/test/unittest/ip/tst.ipv4remotetcp.sh
index 99ba1161c90d..577c5668b67c 100755
--- a/test/unittest/ip/tst.ipv4remotetcp.sh
+++ b/test/unittest/ip/tst.ipv4remotetcp.sh
@@ -69,7 +69,7 @@ cat > $tmpdir/tst.ipv4remotetcp.test.pl <<-EOPERL
 	}
 EOPERL
 
-$dtrace -c "/usr/bin/perl $tmpdir/tst.ipv4remotetcp.test.pl" -qs /dev/stdin <<EODTRACE
+$dtrace $dt_flags -c "/usr/bin/perl $tmpdir/tst.ipv4remotetcp.test.pl" -qs /dev/stdin <<EODTRACE
 BEGIN
 {
 	send = receive = 0;
diff --git a/test/unittest/misc/err.lockmem-pragma.sh b/test/unittest/misc/err.lockmem-pragma.sh
index d6ffdb355b65..1893f02d7eb8 100755
--- a/test/unittest/misc/err.lockmem-pragma.sh
+++ b/test/unittest/misc/err.lockmem-pragma.sh
@@ -9,7 +9,7 @@
 
 dtrace=$1
 
-$dtrace -qs /dev/stdin << EOF
+$dtrace $dt_flags -qs /dev/stdin << EOF
 #pragma D option lockmem=1
 
 BEGIN
diff --git a/test/unittest/misc/tst.include.sh b/test/unittest/misc/tst.include.sh
index 608dc030c692..9d9989a3eee1 100755
--- a/test/unittest/misc/tst.include.sh
+++ b/test/unittest/misc/tst.include.sh
@@ -32,8 +32,8 @@ void
 main()
 {}
 EOF
-	if $CC $CFLAGS -o $cofile $cfile >/dev/null 2>&1; then
-		$dtrace -xerrtags -C -s /dev/stdin \
+	if $CC $test_cppflags $CFLAGS -o $cofile $cfile >/dev/null 2>&1; then
+		$dtrace $dt_flags -xerrtags -C -s /dev/stdin \
 		    >/dev/null 2>$errfile <<EOF
 #include <sys/$file>
 BEGIN
diff --git a/test/unittest/misc/tst.lockmem-cmdline.sh b/test/unittest/misc/tst.lockmem-cmdline.sh
index 90334baecf97..af2b7132549e 100755
--- a/test/unittest/misc/tst.lockmem-cmdline.sh
+++ b/test/unittest/misc/tst.lockmem-cmdline.sh
@@ -12,7 +12,7 @@ dtrace=$1
 for val in 1 268435456 unlimited; do
 	ulimit -l $val
 
-	$dtrace -qn 'BEGIN { @ = avg(1234); exit(0); }'
+	$dtrace $dt_flags -qn 'BEGIN { @ = avg(1234); exit(0); }'
 	echo $?
 done
 
diff --git a/test/unittest/misc/tst.lockmem-envvar.sh b/test/unittest/misc/tst.lockmem-envvar.sh
index 05dcedc3e4ed..2b0cde01db00 100755
--- a/test/unittest/misc/tst.lockmem-envvar.sh
+++ b/test/unittest/misc/tst.lockmem-envvar.sh
@@ -12,7 +12,7 @@ dtrace=$1
 ulimit -l 1
 
 for val in 16 1K 268435456K 262144M 256G unlimited; do
-	DTRACE_OPT_LOCKMEM=$val $dtrace -qn 'BEGIN { @ = avg(1234); exit(0); }'
+	DTRACE_OPT_LOCKMEM=$val $dtrace $dt_flags -qn 'BEGIN { @ = avg(1234); exit(0); }'
 	echo $?
 done
 
diff --git a/test/unittest/misc/tst.lockmem-x.sh b/test/unittest/misc/tst.lockmem-x.sh
index ea8f5f3fd334..0f75b93f9e61 100755
--- a/test/unittest/misc/tst.lockmem-x.sh
+++ b/test/unittest/misc/tst.lockmem-x.sh
@@ -12,7 +12,7 @@ dtrace=$1
 ulimit -l 1
 
 for val in 16 1K 268435456K 262144M 256G unlimited; do
-	$dtrace -xlockmem=$val -qn 'BEGIN { @ = avg(1234); exit(0); }'
+	$dtrace $dt_flags -xlockmem=$val -qn 'BEGIN { @ = avg(1234); exit(0); }'
 	echo $?
 done
 
diff --git a/test/unittest/misc/tst.parser1.sh b/test/unittest/misc/tst.parser1.sh
index aebd41e72306..75df4f8245dc 100755
--- a/test/unittest/misc/tst.parser1.sh
+++ b/test/unittest/misc/tst.parser1.sh
@@ -17,7 +17,7 @@ chkfile=$tmpfile.check
 
 # Run DTrace.
 
-$dtrace -xtree=1 -e -n '
+$dtrace $dt_flags -xtree=1 -e -n '
 BEGIN
 {
 	x = 1234;
diff --git a/test/unittest/misc/tst.parser2.sh b/test/unittest/misc/tst.parser2.sh
index 6c2616ce8e90..803af8eae971 100755
--- a/test/unittest/misc/tst.parser2.sh
+++ b/test/unittest/misc/tst.parser2.sh
@@ -17,7 +17,7 @@ chkfile=$tmpfile.check
 
 # Run DTrace.
 
-$dtrace -xtree=2 -e -n '
+$dtrace $dt_flags -xtree=2 -e -n '
 BEGIN
 {
 	x = 1234;
diff --git a/test/unittest/misc/tst.parser4.sh b/test/unittest/misc/tst.parser4.sh
index 65f441c8b0bc..8f728e15d614 100755
--- a/test/unittest/misc/tst.parser4.sh
+++ b/test/unittest/misc/tst.parser4.sh
@@ -17,7 +17,7 @@ chkfile=$tmpfile.check
 
 # Run DTrace.
 
-$dtrace -xtree=4 -e -n '
+$dtrace $dt_flags -xtree=4 -e -n '
 BEGIN
 {
 	x = 1234;
diff --git a/test/unittest/options/tst.bpflog-cmdline.sh b/test/unittest/options/tst.bpflog-cmdline.sh
index 6a1ee1e28524..dd3971c0d9a3 100755
--- a/test/unittest/options/tst.bpflog-cmdline.sh
+++ b/test/unittest/options/tst.bpflog-cmdline.sh
@@ -8,6 +8,6 @@
 
 dtrace=$1
 
-$dtrace -xbpflog -qn 'BEGIN { exit(0); }' |& grep '^BPF: ' > /dev/null
+$dtrace $dt_flags -xbpflog -qn 'BEGIN { exit(0); }' |& grep '^BPF: ' > /dev/null
 
 exit $?
diff --git a/test/unittest/options/tst.bpflog-pragma.sh b/test/unittest/options/tst.bpflog-pragma.sh
index 7e959184037f..ae7b89bff602 100755
--- a/test/unittest/options/tst.bpflog-pragma.sh
+++ b/test/unittest/options/tst.bpflog-pragma.sh
@@ -8,7 +8,7 @@
 
 dtrace=$1
 
-$dtrace -qs /dev/stdin << EOT |& grep '^BPF: ' > /dev/null
+$dtrace $dt_flags -qs /dev/stdin << EOT |& grep '^BPF: ' > /dev/null
 #pragma D option bpflog
 
 BEGIN
diff --git a/test/unittest/options/tst.bpflogsize-pragma.sh b/test/unittest/options/tst.bpflogsize-pragma.sh
index 3dea3dd46191..b9f12b6d6f4c 100755
--- a/test/unittest/options/tst.bpflogsize-pragma.sh
+++ b/test/unittest/options/tst.bpflogsize-pragma.sh
@@ -67,7 +67,7 @@ cursiz=$((16 * 1024 * 1024 - 1))     # default size from dt_bpf_load_prog()
 while [ $cursiz -lt $((1024 * 1024 * 1024)) ]; do
 
 	# dtrace should not pass
-	$dtrace -qs D.d >& tmp.out
+	$dtrace $dt_flags -qs D.d >& tmp.out
 	if [ $? -eq 0 ]; then
 		echo unexpected pass
 		dump_files
diff --git a/test/unittest/options/tst.iregs.sh b/test/unittest/options/tst.iregs.sh
index f7a2fdaeba9a..15fb1b1ee994 100755
--- a/test/unittest/options/tst.iregs.sh
+++ b/test/unittest/options/tst.iregs.sh
@@ -13,7 +13,7 @@ dtrace=$1
 # once n becomes too small, there are insufficient registers
 for n in 8 7 6 5 4 3; do
 
-    $dtrace -xiregs=$n -qn 'BEGIN {
+    $dtrace $dt_flags -xiregs=$n -qn 'BEGIN {
         a = b = c = d = e = f = g = h = i = j = k = l = 1;
         trace(a + b * (c + d * (e + f * (g + h * (i + j * (k + l))))));
         exit(0);
diff --git a/test/unittest/options/tst.linktype.sh b/test/unittest/options/tst.linktype.sh
index e1ac954501a3..564d9b0f6f18 100755
--- a/test/unittest/options/tst.linktype.sh
+++ b/test/unittest/options/tst.linktype.sh
@@ -24,7 +24,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -42,7 +42,7 @@ int main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${test_ldflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
@@ -51,7 +51,7 @@ fi
 # link with different -xlinktype values
 
 function mytest() {
-	$dtrace -G $1 -s prov.d test.o
+	$dtrace $dt_flags -G $1 -s prov.d test.o
 
 	# report whether the link succeeded
 	if [ $? -ne 0 ]; then
diff --git a/test/unittest/options/tst.modpath.x b/test/unittest/options/tst.modpath.x
index 928f00cc6786..383fc956541c 100755
--- a/test/unittest/options/tst.modpath.x
+++ b/test/unittest/options/tst.modpath.x
@@ -9,7 +9,7 @@ fi
 # Skip test if CTF info is not used for rawtp args[] types.  (If all rawtp
 # args[] types are "uint64_t", this is a symptom of our using the back-up
 # trial-and-error method.)
-types=`$dtrace -lvP rawtp | gawk '/^[ 	]*args/ { $1 = ""; print }' | sort -u`
+types=`$dtrace $dt_flags -lvP rawtp | gawk '/^[ 	]*args/ { $1 = ""; print }' | sort -u`
 if [ "$types" == " uint64_t" ]; then
 	echo "not using CTF for rawtp args types"
 	exit 2
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index 4df78ca55dff..054955fb3d90 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -22,7 +22,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -40,7 +40,7 @@ int main(int argc, char **argv)
 }
 EOF
 
-${CC} ${CFLAGS} -c test.c
+${CC} ${test_cppflags} ${test_ldflags} ${CFLAGS} -c test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
@@ -50,14 +50,14 @@ fi
 
 objdump="objdump --full-contents --section=.SUNW_dof prov.o"
 
-$dtrace -G -xstrip -s prov.d test.o
+$dtrace $dt_flags -G -xstrip -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF (stripped)" >& 2
 	exit 1
 fi
 $objdump >& out.stripped.txt
 
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
diff --git a/test/unittest/options/tst.switchrate.sh b/test/unittest/options/tst.switchrate.sh
index 0090caffe2fa..ce8065ab7b44 100755
--- a/test/unittest/options/tst.switchrate.sh
+++ b/test/unittest/options/tst.switchrate.sh
@@ -20,7 +20,7 @@ for nexpect in 1 16; do
 	# Run the "instantaneous" D script with the prescribed switchrate.
 	# Time it.  Round to the nearest number of seconds with int(t+0.5).
 	nactual=`/usr/bin/time -f "%e" \
-	    $dtrace -xswitchrate=${nexpect}sec -qn 'BEGIN { exit(0) }' \
+	    $dtrace $dt_flags -xswitchrate=${nexpect}sec -qn 'BEGIN { exit(0) }' \
 	    |& gawk 'NF != 0 {print int($1 + 0.5)}'`
 
 	# Check the actual number of seconds to the expected value.
diff --git a/test/unittest/options/tst.tregs.sh b/test/unittest/options/tst.tregs.sh
index 85ff18e4af5d..65cdb83e774e 100755
--- a/test/unittest/options/tst.tregs.sh
+++ b/test/unittest/options/tst.tregs.sh
@@ -9,6 +9,6 @@
 dtrace=$1
 
 for x in 3 5 9 11; do
-    $dtrace -xtregs=$x -qn 'BEGIN { @[1, 2, 3, 4, 5, 6, 7] = count(); exit(0) }'
+    $dtrace $dt_flags -xtregs=$x -qn 'BEGIN { @[1, 2, 3, 4, 5, 6, 7] = count(); exit(0) }'
     echo "tregs $x gives $?"
 done
diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
index a8070a5408d9..cc1a440d5152 100755
--- a/test/unittest/pid/tst.offsets.sh
+++ b/test/unittest/pid/tst.offsets.sh
@@ -65,7 +65,7 @@ fi
 # We are testing a glob in the pid$target:a.out:loopfunc: probe name.
 #
 
-$dtrace -xstrsize=16 -qn '
+$dtrace $dt_flags -xstrsize=16 -qn '
 pid$target:a.out:coldfunc:entry,
 pid$target:a.out:loopfunc:,
 pid$target:a.out:leaffunc:entry
diff --git a/test/unittest/pid/tst.provregex3.sh b/test/unittest/pid/tst.provregex3.sh
index 7ebfb28eecaa..41210ff09944 100755
--- a/test/unittest/pid/tst.provregex3.sh
+++ b/test/unittest/pid/tst.provregex3.sh
@@ -29,10 +29,10 @@ main.o: main.c prov.h
 	cc $test_cppflags -c main.c
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace $dt_flags -h -s prov.d
 
 prov.o: prov.d main.o
-	$dtrace -G -64 -s prov.d main.o
+	$dtrace $dt_flags -G -64 -s prov.d main.o
 EOF
 
 cat > $DIR/prov.d <<EOF
diff --git a/test/unittest/pid/tst.provregex4.sh b/test/unittest/pid/tst.provregex4.sh
index e4248e15a7af..5aa38fa98055 100755
--- a/test/unittest/pid/tst.provregex4.sh
+++ b/test/unittest/pid/tst.provregex4.sh
@@ -31,10 +31,10 @@ main.o: main.c prov.h
 	cc $test_cppflags -c main.c
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace $dt_flags -h -s prov.d
 
 provmain.o: prov.d main.o
-	$dtrace -G -o provmain.o -s prov.d main.o
+	$dtrace $dt_flags -G -o provmain.o -s prov.d main.o
 
 altlib.so: altlib.o provalt.o
 	cc $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
@@ -43,7 +43,7 @@ altlib.o: altlib.c prov.h
 	cc $test_cppflags -c altlib.c
 
 provalt.o: prov.d altlib.o
-	$dtrace -G -o provalt.o -s prov.d altlib.o
+	$dtrace $dt_flags -G -o provalt.o -s prov.d altlib.o
 EOF
 
 cat > $DIR/prov.d <<EOF
diff --git a/test/unittest/predicates/tst.predcache.sh b/test/unittest/predicates/tst.predcache.sh
index 1ec6927dcea9..0a294e7623a5 100755
--- a/test/unittest/predicates/tst.predcache.sh
+++ b/test/unittest/predicates/tst.predcache.sh
@@ -78,7 +78,7 @@ unload()
 
 script1()
 {
-	$dtrace -s /dev/stdin <<EOF
+	$dtrace $dt_flags -s /dev/stdin <<EOF
 	syscall:::entry
 	/pid != $ppid/
 	{
@@ -95,7 +95,7 @@ EOF
 
 script2()
 {
-	$dtrace -s /dev/stdin <<EOF
+	$dtrace $dt_flags -s /dev/stdin <<EOF
 
 	#pragma D option statusrate=1ms
 
diff --git a/test/unittest/printf/tst.wide-bug30404549.sh b/test/unittest/printf/tst.wide-bug30404549.sh
index 3c3eb6506d45..5ec0e4003091 100755
--- a/test/unittest/printf/tst.wide-bug30404549.sh
+++ b/test/unittest/printf/tst.wide-bug30404549.sh
@@ -17,7 +17,7 @@ fi
 dtrace=$1
 
 # abbreviate output to a simple statement of length.  raw output is big (29M)
-$dtrace -qs /dev/stdin << EOF | gawk '{ print length($0); }'
+$dtrace $dt_flags -qs /dev/stdin << EOF | gawk '{ print length($0); }'
 BEGIN
 {
 	printf("%10000000d\n", 1);
diff --git a/test/unittest/printf/tst.wide.sh b/test/unittest/printf/tst.wide.sh
index 479ab8d30344..5c0c98d15a67 100755
--- a/test/unittest/printf/tst.wide.sh
+++ b/test/unittest/printf/tst.wide.sh
@@ -17,7 +17,7 @@ fi
 dtrace=$1
 
 # abbreviate output, where the raw output of prints is big (29M)
-$dtrace -qs /dev/stdin << EOF | gawk '{
+$dtrace $dt_flags -qs /dev/stdin << EOF | gawk '{
   if (match($0, "  +"))
     printf("%s{%d* }%s\n", substr($0, 1, RSTART - 1),
       RLENGTH, substr($0, RSTART + RLENGTH));
diff --git a/test/unittest/providers/rawtp/err.lockmem-too-low.sh b/test/unittest/providers/rawtp/err.lockmem-too-low.sh
index 0c3d9a3c83ae..629c35ad7109 100755
--- a/test/unittest/providers/rawtp/err.lockmem-too-low.sh
+++ b/test/unittest/providers/rawtp/err.lockmem-too-low.sh
@@ -23,11 +23,11 @@ dtrace=$1
 # Determine whether the system respects setting the lockmem limit as root.
 # Some systems ignore lowering the limit, which means we cannot make it fail.
 # In that case, we report XFAIL.
-if $dtrace -xlockmem=1 -n 'BEGIN { exit(0); }' &> /dev/null; then
+if $dtrace $dt_flags -xlockmem=1 -n 'BEGIN { exit(0); }' &> /dev/null; then
     exit 67
 fi
 
-$dtrace -xlockmem=1 -lvn rawtp:::sched_process_fork |& \
+$dtrace $dt_flags -xlockmem=1 -lvn rawtp:::sched_process_fork |& \
     gawk 'BEGIN {
 	     err = 0;  # lockmem error messages
 	     CTF = 0;  # arg types indicating CTF info
diff --git a/test/unittest/syscall/tst.openret.sh b/test/unittest/syscall/tst.openret.sh
index d3b018ab6ec5..c04b1522ef30 100755
--- a/test/unittest/syscall/tst.openret.sh
+++ b/test/unittest/syscall/tst.openret.sh
@@ -6,7 +6,7 @@
 # http://oss.oracle.com/licenses/upl.
 
 script() {
-	$dtrace -c 'cat shajirosan' -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c 'cat shajirosan' -qs /dev/stdin <<EOF
 	syscall::open*:entry
 	/pid == \$target/
 	{
diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
index d233615f6aef..179552b65ece 100755
--- a/test/unittest/usdt/tst.allargs.sh
+++ b/test/unittest/usdt/tst.allargs.sh
@@ -17,6 +17,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="-std=gnu89 $test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-allargs.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -73,18 +74,18 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
 fi
 
-$dtrace -c ./test -qs /dev/stdin <<EOF
+$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 test_prov\$target:::zero
 {
 	printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.andpid.ksh b/test/unittest/usdt/tst.andpid.ksh
index b0ad1e398d53..ab7d2a74233c 100644
--- a/test/unittest/usdt/tst.andpid.ksh
+++ b/test/unittest/usdt/tst.andpid.ksh
@@ -11,7 +11,7 @@ fi
 
 dtrace=$1
 
-$dtrace -c date -s /dev/stdin <<EOF
+$dtrace $dt_flags -c date -s /dev/stdin <<EOF
 plockstat\$target::mutex_lock_impl:,
 pid\$target::mutex_lock_impl:
 {}
diff --git a/test/unittest/usdt/tst.badguess.sh b/test/unittest/usdt/tst.badguess.sh
index ae4865f6fc27..b6ff9e233828 100755
--- a/test/unittest/usdt/tst.badguess.sh
+++ b/test/unittest/usdt/tst.badguess.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-badguess.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -48,13 +49,13 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c 64-bit" >& 2
 	exit 1
 fi
-$CC $CFLAGS -m32 -c -o test32.o test.c
+$CC $LDFLAGS -m32 -c -o test32.o test.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test.c 32-bit" >& 2
 	exit 1
 fi
 
-$dtrace -G -s prov.d test32.o test64.o
+$dtrace $dt_flags -G -s prov.d test32.o test64.o
 if [ $? -eq 0 ]; then
 	echo "DOF generation failed to generate a warning" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.corruptenv.sh b/test/unittest/usdt/tst.corruptenv.sh
index 4f465c2c9db0..eac24827ba99 100755
--- a/test/unittest/usdt/tst.corruptenv.sh
+++ b/test/unittest/usdt/tst.corruptenv.sh
@@ -29,16 +29,16 @@ cat > Makefile <<EOF
 all: main
 
 main: main.o prov.o
-	\$(CC) -o main main.o prov.o
+	\$(CC) \$(test_ldflags) -o main main.o prov.o
 
 main.o: main.c prov.h
-	\$(CC) -c main.c
+	\$(CC) \$(test_cppflags) -c main.c
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace $dt_flags -h -s prov.d
 
 prov.o: prov.d main.o
-	$dtrace -G -s prov.d main.o
+	$dtrace $dt_flags -G -s prov.d main.o
 EOF
 
 cat > prov.d <<EOF
diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
index ee4d95f3bf20..bf0ffd5f2029 100755
--- a/test/unittest/usdt/tst.dlclose1.sh
+++ b/test/unittest/usdt/tst.dlclose1.sh
@@ -44,30 +44,30 @@ cat > Makefile <<EOF
 all: main livelib.so deadlib.so
 
 main: main.o prov.o
-	\$(CC) -o main main.o -ldl
+	\$(CC) \$(test_ldflags) -o main main.o -ldl
 
 main.o: main.c
-	\$(CC) -c main.c
+	\$(CC) \$(test_cppflags) -c main.c
 
 
 livelib.so: livelib.o prov.o
-	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
+	\$(CC) \$(test_ldflags) -shared -o livelib.so livelib.o prov.o -lc
 
 livelib.o: livelib.c prov.h
-	\$(CC) -c livelib.c
+	\$(CC) \$(test_cppflags) -c livelib.c
 
 prov.o: livelib.o prov.d
-	$dtrace -G -s prov.d livelib.o
+	$dtrace \$(dt_flags) -G -s prov.d livelib.o
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace \$(dt_flags) -h -s prov.d
 
 
 deadlib.so: deadlib.o
-	\$(CC) -shared -o deadlib.so deadlib.o -lc
+	\$(CC) \$(test_ldflags) -shared -o deadlib.so deadlib.o -lc
 
 deadlib.o: deadlib.c
-	\$(CC) -c deadlib.c
+	\$(CC) \$(test_cppflags) -c deadlib.c
 
 clean:
 	rm -f main.o livelib.o prov.o prov.h deadlib.o
@@ -203,11 +203,11 @@ pid=$!
 echo started pid $pid
 
 mywait 6 "started"  myfile.txt # wait for process to start
-$dtrace -lP test_prov$pid      # check USDT probes
+$dtrace $dt_flags -lP test_prov$pid      # check USDT probes
 kill -s USR1 $pid              # signal process
 
 mywait 6 "dlclosed" myfile.txt # wait for process to dlclose
-$dtrace -lP test_prov$pid      # check USDT probes
+$dtrace $dt_flags -lP test_prov$pid      # check USDT probes
 kill -s KILL $pid              # kill process
 
 exit 0
diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
index 6044cf4b191d..907685a68627 100755
--- a/test/unittest/usdt/tst.dlclose2.sh
+++ b/test/unittest/usdt/tst.dlclose2.sh
@@ -26,30 +26,30 @@ cat > Makefile <<EOF
 all: main livelib.so deadlib.so
 
 main: main.o prov.o
-	\$(CC) -o main main.o -ldl
+	\$(CC) \$(test_ldflags) -o main main.o -ldl
 
 main.o: main.c
-	\$(CC) -c main.c
+	\$(CC) \$(test_cppflags) -c main.c
 
 
 livelib.so: livelib.o prov.o
-	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
+	\$(CC) \$(test_ldflags) -shared -o livelib.so livelib.o prov.o -lc
 
 livelib.o: livelib.c prov.h
-	\$(CC) -c livelib.c
+	\$(CC) \$(test_cppflags) -c livelib.c
 
 prov.o: livelib.o prov.d
-	$dtrace -G -s prov.d livelib.o
+	$dtrace \$(dt_flags) -G -s prov.d livelib.o
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace \$(dt_flags) -h -s prov.d
 
 
 deadlib.so: deadlib.o
-	\$(CC) -shared -o deadlib.so deadlib.o -lc
+	\$(CC) \$(test_ldflags) -shared -o deadlib.so deadlib.o -lc
 
 deadlib.o: deadlib.c
-	\$(CC) -c deadlib.c
+	\$(CC) \$(test_cppflags) -c deadlib.c
 
 clean:
 	rm -f main.o livelib.o prov.o prov.h deadlib.o
@@ -128,7 +128,7 @@ if [ $? -ne 0 ]; then
 fi
 
 script() {
-	$dtrace -c ./main -Zqs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./main -Zqs /dev/stdin <<EOF
 	test_prov*:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.dlclose3.sh b/test/unittest/usdt/tst.dlclose3.sh
index 9ee91c8d23ab..0b70906fcdc6 100755
--- a/test/unittest/usdt/tst.dlclose3.sh
+++ b/test/unittest/usdt/tst.dlclose3.sh
@@ -32,28 +32,28 @@ cat > Makefile <<EOF
 all: main livelib.so deadlib.so
 
 main: main.o prov.o
-	\$(CC) -o main main.o -ldl
+	\$(CC) \$(test_ldflags) -o main main.o -ldl
 
 main.o: main.c
-	\$(CC) -c main.c
+	\$(CC) \$(test_cppflags) -c main.c
 
 livelib.so: livelib.o prov.o
-	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
+	\$(CC) \$(test_ldflags) -shared -o livelib.so livelib.o prov.o -lc
 
 livelib.o: livelib.c prov.h
-	\$(CC) -c livelib.c
+	\$(CC) \$(test_cppflags) -c livelib.c
 
 prov.o: livelib.o prov.d
-	$dtrace -G -s prov.d livelib.o
+	$dtrace \$(dt_flags) -G -s prov.d livelib.o
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace \$(dt_flags) -h -s prov.d
 
 deadlib.so: deadlib.o
-	\$(CC) -shared -o deadlib.so deadlib.o -lc
+	\$(CC) \$(test_ldflags) -shared -o deadlib.so deadlib.o -lc
 
 deadlib.o: deadlib.c
-	\$(CC) -c deadlib.c
+	\$(CC) \$(test_cppflags) -c deadlib.c
 
 clean:
 	rm -f main.o livelib.o prov.o prov.h deadlib.o
@@ -122,7 +122,7 @@ if [ $? -ne 0 ]; then
 fi
 
 script() {
-	$dtrace -c ./main -s /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./main -s /dev/stdin <<EOF
 	pid\$target:a.out:foo:entry
 	{
 		gotit = 1;
diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
index 58be453b048d..c13404caf92b 100755
--- a/test/unittest/usdt/tst.dlclose4.sh
+++ b/test/unittest/usdt/tst.dlclose4.sh
@@ -30,22 +30,22 @@ cat > Makefile <<EOF
 all: main livelib.so
 
 main: main.o prov.o
-	\$(CC) -o main main.o -ldl
+	\$(CC) \$(test_ldflags) -o main main.o -ldl
 
 main.o: main.c
-	\$(CC) -c main.c
+	\$(CC) \$(test_cppflags) -c main.c
 
 livelib.so: livelib.o prov.o
-	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
+	\$(CC) \$(test_ldflags) -shared -o livelib.so livelib.o prov.o -lc
 
 livelib.o: livelib.c prov.h
-	\$(CC) -c livelib.c
+	\$(CC) \$(test_cppflags) -c livelib.c
 
 prov.o: livelib.o prov.d
-	$dtrace -G -s prov.d livelib.o
+	$dtrace \$(dt_flags) -G -s prov.d livelib.o
 
 prov.h: prov.d
-	$dtrace -h -s prov.d
+	$dtrace \$(dt_flags) -h -s prov.d
 
 clean:
 	rm -f main.o livelib.o prov.o prov.h
@@ -141,7 +141,7 @@ fi
 #     ls /run/dtrace/stash/dof-pid/$pid/*/parsed/test_prov:livelib.so:go:go
 
 function check_USDT_probes() {
-	$dtrace -lP test_prov$pid |& awk '
+	$dtrace $dt_flags -lP test_prov$pid |& awk '
 	    /ID *PROVIDER *MODULE *FUNCTION *NAME/ { next }
 	    /test_prov'$pid' *livelib\.so *go *go/ { exit(0) }
 	    /No probe matches description/ { exit(1) }'
diff --git a/test/unittest/usdt/tst.eliminate.sh b/test/unittest/usdt/tst.eliminate.sh
index 63541ff2454f..e74896bbe619 100755
--- a/test/unittest/usdt/tst.eliminate.sh
+++ b/test/unittest/usdt/tst.eliminate.sh
@@ -17,7 +17,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-eliminate.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -29,7 +30,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -59,12 +60,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
index 91923014d8e0..cdb34e8ab6eb 100755
--- a/test/unittest/usdt/tst.enable_pid.sh
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -115,7 +115,7 @@ EOF
 # Build the test program.
 #
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
@@ -125,7 +125,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
 fi
-$dtrace -G -64 -s prov.d main.o
+$dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.enabled.sh b/test/unittest/usdt/tst.enabled.sh
index 2c0a5b405e7a..4cd1eccdb7ac 100755
--- a/test/unittest/usdt/tst.enabled.sh
+++ b/test/unittest/usdt/tst.enabled.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-enabled.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -48,12 +49,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -61,7 +62,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
index c70bef507e89..1732085e6f3b 100755
--- a/test/unittest/usdt/tst.enabled2.sh
+++ b/test/unittest/usdt/tst.enabled2.sh
@@ -16,7 +16,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-enabled2.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -28,7 +29,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -62,12 +63,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -77,7 +78,7 @@ script()
 {
 	./test
 
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 	}
diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
index d777c1acdf41..84af967234ba 100755
--- a/test/unittest/usdt/tst.entryreturn.sh
+++ b/test/unittest/usdt/tst.entryreturn.sh
@@ -15,6 +15,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-entryreturn.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -59,12 +60,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -72,7 +73,7 @@ fi
 
 script()
 {
-	$dtrace -wqZFs /dev/stdin <<EOF
+	$dtrace $dt_flags -wqZFs /dev/stdin <<EOF
 	BEGIN
 	{
 		system("$DIRNAME/test");
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index 9f30bbfcc32e..d6c5a8c0f4a4 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -15,7 +15,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-exec-dof-replacement.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -33,7 +34,7 @@ provider test_prov {
 };
 EOF
 
-if ! { $dtrace -h -s prov1.d && dtrace -h -s prov2.d; } then
+if ! { $dtrace $dt_flags -h -s prov1.d && dtrace -h -s prov2.d; } then
 	echo "failed to generate header files" >&2
 	exit 1
 fi
@@ -70,11 +71,11 @@ if ! { ${CC} ${CFLAGS} -c test1.c && ${CC} ${CFLAGS} -c test2.c; } then
 	echo "failed to compile test programs" >&2
 	exit 1
 fi
-if ! { $dtrace -G -s prov1.d test1.o && $dtrace -G -s prov2.d test2.o; } then
+if ! { $dtrace $dt_flags -G -s prov1.d test1.o && $dtrace $dt_flags -G -s prov2.d test2.o; } then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-if ! { ${CC} ${CFLAGS} -o test1 test1.o prov1.o && ${CC} ${CFLAGS} -o test2 test2.o prov2.o; } then
+if ! { ${CC} ${LDFLAGS} -o test1 test1.o prov1.o && ${CC} ${LDFLAGS} -o test2 test2.o prov2.o; } then
 	echo "failed to link final executables" >& 2
 	exit 1
 fi
@@ -89,7 +90,7 @@ PROC=$!
 while [[ -d /proc/$PROC ]] && [[ "$(readlink /proc/$PROC/exe)" =~ test1$ ]]; do
     sleep 1
 done
-$dtrace -p $PROC '-Ptest_prov$target' -l
+$dtrace $dt_flags -p $PROC '-Ptest_prov$target' -l
 status2=$?
 kill $PROC
 
diff --git a/test/unittest/usdt/tst.execstack.sh b/test/unittest/usdt/tst.execstack.sh
index 242a2ed9d9ee..e7b59105bf46 100755
--- a/test/unittest/usdt/tst.execstack.sh
+++ b/test/unittest/usdt/tst.execstack.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 OBJDUMP=/usr/bin/objdump
 READELF=/usr/bin/readelf
 
@@ -29,7 +30,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -54,7 +55,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
@@ -64,7 +65,7 @@ if [ $? -eq 0 ]; then
 	echo "EXEC flag on .note.GNU-stack" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${lDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.fork.sh b/test/unittest/usdt/tst.fork.sh
index dc30b2c5598b..9b2b372a06e8 100755
--- a/test/unittest/usdt/tst.fork.sh
+++ b/test/unittest/usdt/tst.fork.sh
@@ -13,7 +13,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-fork.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -25,7 +26,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -58,19 +59,19 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
 fi
 
 script() {
-	$dtrace -c ./test -Zqs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -Zqs /dev/stdin <<EOF
 	test_prov*:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 92513eb5de7e..aa51970420de 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -25,7 +25,7 @@ id=$!
 disown %+
 
 while kill -0 $id >/dev/null 2>&1; do
-	$dtrace -p $id -s /dev/stdin <<-EOF
+	$dtrace $dt_flags -p $id -s /dev/stdin <<-EOF
 		forker*:::fire
 		/i++ == 4/
 		{
diff --git a/test/unittest/usdt/tst.guess32.sh b/test/unittest/usdt/tst.guess32.sh
index 20ad0e7346ab..7a130e178c02 100755
--- a/test/unittest/usdt/tst.guess32.sh
+++ b/test/unittest/usdt/tst.guess32.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-guess32.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -48,12 +49,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -m32 -o test test.o prov.o
+${CC} ${LDFLAGS} -m32 -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -61,7 +62,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.guess64.sh b/test/unittest/usdt/tst.guess64.sh
index 52750baf4792..23b7a241cdcd 100755
--- a/test/unittest/usdt/tst.guess64.sh
+++ b/test/unittest/usdt/tst.guess64.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-guess64.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -48,12 +49,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -61,7 +62,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.header.sh b/test/unittest/usdt/tst.header.sh
index c96b8787c84c..c5e411be66b0 100755
--- a/test/unittest/usdt/tst.header.sh
+++ b/test/unittest/usdt/tst.header.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-header.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -27,7 +28,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -52,12 +53,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.lingering.sh b/test/unittest/usdt/tst.lingering.sh
index bee59df44da7..079acb75db2d 100755
--- a/test/unittest/usdt/tst.lingering.sh
+++ b/test/unittest/usdt/tst.lingering.sh
@@ -15,7 +15,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-lingering.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -28,7 +29,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -57,12 +58,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -74,7 +75,7 @@ TRIGPID=$!
 trap 'kill -9 $TRIGPID' ERR EXIT
 
 script() {
-	$dtrace -p $TRIGPID -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -p $TRIGPID -qs /dev/stdin <<EOF
 	test_prov\$target:::$1
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.link-idempotence.sh b/test/unittest/usdt/tst.link-idempotence.sh
index 77c2c26db5d3..643ba10ca7cd 100755
--- a/test/unittest/usdt/tst.link-idempotence.sh
+++ b/test/unittest/usdt/tst.link-idempotence.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-link-idempotence.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -48,13 +49,13 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
-$dtrace -G -s prov.d test.o
+${CC} ${LDFLAGS} -o test test.o prov.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to regenerate DOF" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
index c008e66df838..2c89f5d46345 100755
--- a/test/unittest/usdt/tst.linkpriv.sh
+++ b/test/unittest/usdt/tst.linkpriv.sh
@@ -13,6 +13,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="-std=gnu99 $test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-linkpriv.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -49,12 +50,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
index bf52bc6ad015..9ef386392b30 100755
--- a/test/unittest/usdt/tst.linkunpriv.sh
+++ b/test/unittest/usdt/tst.linkunpriv.sh
@@ -53,7 +53,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
index a3b238745acd..c0deb8df030d 100755
--- a/test/unittest/usdt/tst.manyprobes.sh
+++ b/test/unittest/usdt/tst.manyprobes.sh
@@ -13,6 +13,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
 mkdir -p $DIRNAME
 cd $DIRNAME
@@ -47,12 +48,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s manyprobes.d test.o
+$dtrace $dt_flags -G -s manyprobes.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o manyprobes.o
+${CC} ${LDFLAGS} -o test test.o manyprobes.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -60,7 +61,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	manyprobes\$target:::test1, manyprobes\$target:::test750, manyprobes\$target:::test1999
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
index f820ed231c38..585503029581 100755
--- a/test/unittest/usdt/tst.manyprocs.sh
+++ b/test/unittest/usdt/tst.manyprocs.sh
@@ -15,7 +15,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-manyprocs.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -27,7 +28,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -63,12 +64,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.multiple.sh b/test/unittest/usdt/tst.multiple.sh
index b31e8eff705d..1fd30dc6f7d8 100755
--- a/test/unittest/usdt/tst.multiple.sh
+++ b/test/unittest/usdt/tst.multiple.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-multiple.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -26,7 +27,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -58,12 +59,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -74,7 +75,7 @@ script() {
 	# rtld activity monitoring from triggering repeated
 	# probe scans (checking for problems doing one-off scans of
 	# already-running processes while probing multiple probes).
-	./test & { WAIT=$!; sleep 1; $dtrace -qs /dev/stdin $WAIT <<EOF; }
+	./test & { WAIT=$!; sleep 1; $dtrace $dt_flags -qs /dev/stdin $WAIT <<EOF; }
 	test_prov\$1:::go
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index dcabde620c03..4e53dbb99250 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -15,7 +15,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-multitrace.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -28,7 +29,7 @@ provider test_multitrace {
 };
 EOF
 
-$dtrace -h -s multitrace.d
+$dtrace $dt_flags -h -s multitrace.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -60,19 +61,19 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s multitrace.d test.o
+$dtrace $dt_flags -G -s multitrace.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o multitrace.o
+${CC} ${LDFLAGS} -o test test.o multitrace.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
 fi
 
 script() {
-	exec $dtrace -qws /dev/stdin $1 $2 $3 <<'EOF'
+	exec $dtrace $dt_flags -qws /dev/stdin $1 $2 $3 <<'EOF'
 	int fired[pid_t];
 	int exited[pid_t];
 
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index 50f18a6caedf..c7769647c0f4 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -61,22 +61,22 @@ EOF
 
 # Build the trigger.
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-cc $test_cppflags -c main.c
+gcc $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
 fi
-$dtrace -G -64 -s prov.d main.o
+$dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+gcc $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.onlyenabled.sh b/test/unittest/usdt/tst.onlyenabled.sh
index a469fac156c0..d3487834e79f 100755
--- a/test/unittest/usdt/tst.onlyenabled.sh
+++ b/test/unittest/usdt/tst.onlyenabled.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-onlyenabled.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -49,12 +50,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.pie.sh b/test/unittest/usdt/tst.pie.sh
index 854cd85b6d0a..0d62c3762ae8 100755
--- a/test/unittest/usdt/tst.pie.sh
+++ b/test/unittest/usdt/tst.pie.sh
@@ -12,7 +12,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS="-fno-inline -pie"
+CFLAGS="-fno-inline -pie $test_cppflags"
+LDFLAGS="-pie $test_ldflags"
 
 DIRNAME="$tmpdir/usdt-pie.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -24,7 +25,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -52,12 +53,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -65,7 +66,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
index 56011a4fbe52..371eee3dbc07 100755
--- a/test/unittest/usdt/tst.reeval.sh
+++ b/test/unittest/usdt/tst.reeval.sh
@@ -14,6 +14,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-reeval.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -40,12 +41,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -53,7 +54,7 @@ fi
 
 script()
 {
-	$dtrace -wZs /dev/stdin <<EOF
+	$dtrace $dt_flags -wZs /dev/stdin <<EOF
 	BEGIN
 	{
 		system("$DIRNAME/test");
diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
index bd71c2e46e1f..81b3ba0412f6 100755
--- a/test/unittest/usdt/tst.static.sh
+++ b/test/unittest/usdt/tst.static.sh
@@ -13,6 +13,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-static.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -50,12 +51,12 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -63,7 +64,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
index 29fd35979395..115a95511e11 100755
--- a/test/unittest/usdt/tst.static2.sh
+++ b/test/unittest/usdt/tst.static2.sh
@@ -17,6 +17,7 @@ fi
 dtrace=$1
 CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-static2.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -54,18 +55,18 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create initial DOF" >& 2
 	exit 1
 fi
 rm -f prov.o
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create final DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
@@ -73,7 +74,7 @@ fi
 
 script()
 {
-	$dtrace -c ./test -qs /dev/stdin <<EOF
+	$dtrace $dt_flags -c ./test -qs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
diff --git a/test/unittest/usdt/tst.user.sh b/test/unittest/usdt/tst.user.sh
index fc916f500a02..30513acca141 100755
--- a/test/unittest/usdt/tst.user.sh
+++ b/test/unittest/usdt/tst.user.sh
@@ -14,7 +14,8 @@ fi
 
 dtrace=$1
 CC=/usr/bin/gcc
-CFLAGS=
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
 
 DIRNAME="$tmpdir/usdt-user.$$.$RANDOM"
 mkdir -p $DIRNAME
@@ -26,7 +27,7 @@ provider test_prov {
 };
 EOF
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >& 2
 	exit 1
@@ -50,19 +51,19 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test.c" >& 2
 	exit 1
 fi
-$dtrace -G -s prov.d test.o
+$dtrace $dt_flags -G -s prov.d test.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >& 2
 	exit 1
 fi
-${CC} ${CFLAGS} -o test test.o prov.o
+${CC} ${LDFLAGS} -o test test.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >& 2
 	exit 1
 fi
 
 script() {
-	$dtrace -c 'ppriv -e -s A=basic ./test' -Zqs /dev/stdin <<EOF
+	$dtrace $dt_flags -c 'ppriv -e -s A=basic ./test' -Zqs /dev/stdin <<EOF
 	test_prov\$target:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
-- 
2.46.0.278.g36e3a12567

