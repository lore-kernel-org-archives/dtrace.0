Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98FD2E9730
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662068; cv=fail; b=lqb7osMukJ0sqHCuImNn9raYPWQS2xnGlxl/biwi3wzfkykHBFyME4vo31d5BWzi12tABzTsJbbmkYlzITgUaG7295c0ys+sXlpYvZtX4+ldqBtlkwTnzaogIrp9fWQsgUPykgaeCnAk7AW29Wyxrec5b6LNQzVvnUHDVryvIck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662068; c=relaxed/simple;
	bh=C1VOlJYWLinVkK11/xNxQuZ43mycxZ9jSTt6uU+3BQ0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=gCbjBgHZgjqUpkq2EPEV4630wK/SMun67XUGr5Bhji4UKNCIEbtmjt2MHYylH2BDLxC4cRGlXd0tmLrvM6K5R8mB0DObK1TZiloLjtH89hEi9b9MxmWs7KzElQNjAuJu9whnrqz7Y2Am59j/fiiKcjEmhWRDaK5NHR32Pp/0gZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K/957b3i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VL+sNM6P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K/957b3i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VL+sNM6P"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECX9M1945047
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sT1K25WijdPyA4Ov+2IxSoKHv/RWwlA6Egvzk98w6mI=; b=
	K/957b3is3Tb8oAGyOJ26z8ntANEsGNHnbGwWlXekPI0jaAuYth4itHQJdIDvG5T
	Ow3q7vIMFe2x/JJE0TAJ1anAoDFvHCwQZRxujzapnVnVZpitd1CXIWCG61xeD/CA
	6fv7sS59G33tvlbBXff0yOD3hEjbmgx0fjPfluHnh3OjYy7+8UGFEJfNHkTB45Kd
	I1RT1Hfr74y80BEz0GQk0Enw24SAxthJM+VZp4w/dgeNFGG3EnIYUy/FcRj8avN5
	lNHGuif7mDGl1QvR5apoGVpQ5hmCOkBEtLwSzeVkjBtqybNkTA2+q9SDhIgFN0sw
	FcisrwCbIZ/GwpSOZtoLeg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xj4jfth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:34:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619H0BQ6030947
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 18:34:26 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uukvedm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 18:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYBjU+zuWRp1SxkDpEVMs+fgBijCg+l9fMy4w/FOf347N38ufbLaQTPEUhGCUqIodAHd5+JYTHfLI0G5BcYysi71UPqv1iD7xpFIueho0OL7jut4K04s0TlCL33zarxgJjaw4DAuBYWt2DCdcCupk/T4PKgk2t478TIQEsYTskyWKBO8YHB+LPc3nwLegljhyXHdhg4iVTTb22XGVK0/oIfX/muvUdK7EnpAsbzZFJVHQAjR1ockxzTI77/SUL1QD9ij6E26v4jlgK+lAaqGPADYP7FHIxZX2d9r94l8ThpnEnQwGXtG7AqxeQOtMulQtPWJbTHMV2oq2BNHY1c5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT1K25WijdPyA4Ov+2IxSoKHv/RWwlA6Egvzk98w6mI=;
 b=hJkthKKzppzGAMcerpx1W4GVhN82dZyHJSzj+wpmeI/zniCOl5n0O2LritkEpq+8v2/hXNqjlZv3aPuibhgj51l40j8sPOXeAijNkqbiZUnzl1FhAH+V/GdT/mxcwKC0Z6FsOs5uUayxFWgfWLWnZ3MzWKSf/0yQ1t7Euf8QrDqeyUu05RonLIjAsItA2mNc5gvpzAs3PegKdcSEsg1Ot03O8DshPg2P5fbD45cRb0OV7GTvRWiFkMAulzXJPAikSy+HQ415vT6BEGYkMt/d6Lth1DkHb6476VcuPnJt+Wc+EpjMqbHPLWaQIjIGHdiD/nZaHMDA4h+a6O5QTfRZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT1K25WijdPyA4Ov+2IxSoKHv/RWwlA6Egvzk98w6mI=;
 b=VL+sNM6P9HYzECJZXUBIGyYt3iXzx6QUXpKMYyahIyuVCOz6XHzdyGLxHX3lZcynZk+HeyMP1Z6WIsj+lgcdU7pzfapVT+IgJsNDoBhoBTja5kO+9ql8UZQ2p+pzy8X2OOdQXyCjM+9Ab2vJIWzYtKDHstKjnS4NUHCfEOe8JQw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CO1PR10MB4451.namprd10.prod.outlook.com (2603:10b6:303:96::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:34:23 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 18:34:23 +0000
Date: Mon, 09 Feb 2026 13:34:22 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: skip when /proc/kallmodsyms is not present
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75223D0A585D1EFA33B7C033C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CO1PR10MB4451:EE_
X-MS-Office365-Filtering-Correlation-Id: 206147ee-c40b-4db6-b898-08de6809d8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DNH0dKwLRs1NoZkGjBP/d713Zxk6s5F1iEa+e+9Wdh3N5abJI3vsY89Z5bvb?=
 =?us-ascii?Q?ieZx+Hs3ZtlouUKnBWZ5mzb2IdrVS0NLwQBG7ZjKdBvnNDeYmX9QN4KX6sA1?=
 =?us-ascii?Q?gPhadpynvzpTrceb4Y4FRXaMnPRWwxusa+OcttzOHrPTWRLj2lROq0/W+cas?=
 =?us-ascii?Q?4EkaymXkK7T6eaoz/57kJR3UjflKkk2xMOxLDlDvF7bK6kOAE5S9H5hoeuGF?=
 =?us-ascii?Q?TR4L/a/QsCNBUrt6kjzhIDY98ri7bBXws9UwXe8RsXnNwi1iFgKPKsf59qvp?=
 =?us-ascii?Q?8Gr1GczYFyRPl6rTeRze5e1+nrfWStN1cxKv9dMAmrEKTu9KXSa8S+1IQbfz?=
 =?us-ascii?Q?VT0TT29ycLONDoUG+oLK+TIvPNWjCmMi+e5BmzHPnxxoDUKyInJFs65EcJ0A?=
 =?us-ascii?Q?u0IsgFTmTUKTErMoT68JjVh74Veuzw9zZ7PJLx/ytr11U7FNhoJ8Xkb7g4Xx?=
 =?us-ascii?Q?8cyPIdDPwwzT4zAFR7f5bkOIaRU9DwauusfYbXtx52NhWO2wfXgZi/Xg0fYv?=
 =?us-ascii?Q?tUMQdMWyOmR6B4is8icbjudtrCmwSbkItM4KYT/irGKFcVUyAjqxl+OHoRo8?=
 =?us-ascii?Q?OaOseEYcKArzLysmYHp9ReA2SzKLRdrigX5C7ujG9BDbnqHsOe7+SF6jzwtr?=
 =?us-ascii?Q?T3Q7mBwwqevfbQ0FTKnebDYVTkW381ByUPgwqX47qLc9WomZop+KLymR4yWa?=
 =?us-ascii?Q?9huc45U3M6/yzI8glOuQEO9mkBimS5ViC+9AYjvnDD0PIyKJXOC8nuQT/HrL?=
 =?us-ascii?Q?w8KxLm5ootT3mSgnzG+FgjaNHtYwP1KSL1435niIwf56vS+mGeI3y8JGy6KO?=
 =?us-ascii?Q?1hNNi8VlEVIX5+iw2kZ5KYX3Bleyjqv8YWXALkfVqieyKGgzXBlySjFOZGkV?=
 =?us-ascii?Q?Ta3ek8TDICuQssDSZKerMOCYxUD0aqN+KxH5rl+XXn2HUJvaIsHlx9XcUzKp?=
 =?us-ascii?Q?QyWz5QOwh3arvIlWyoqMMrpCXygEq0lMbv869lvB9bPUAEhyX93wvlMU360v?=
 =?us-ascii?Q?WDQUC1xaJd/gjm9i1EfdwOD80SDOq17lN1omyh0QsZn/a5bB/x/hnmxAE2rw?=
 =?us-ascii?Q?Df/QcDl/1plDdMPCPltsTUCkVQWFy9Gl2njpbvuXcLo6BdAppr/xQEm6JJXB?=
 =?us-ascii?Q?6uQSp99IjwjlPWA19BwSrvJDva1i9cNCSkpvgmqGmjWY+QTWlqHf//C8/ntx?=
 =?us-ascii?Q?tyiT2U1yOevvUPiUuEJ09RTS0BO33cuwSMAHNAY6StQYqrDZ5BdkvAn027+C?=
 =?us-ascii?Q?5gJwYWqIFbeQOJKcD6FDDCQVCjw+2rfeoX+neZQLmMY/SCKMj/nA/CG5h3xZ?=
 =?us-ascii?Q?DlMTjc4lLxtJeHXFSvg3aCVR/Zt2yQyH7Bj6k6mxEq3AfA2kenyuZohHjCS8?=
 =?us-ascii?Q?JV7nCA4Uma+2BjFZCiugSWHAihs3LcYZx/Fa2bz/LAYp8cCp6jjWogvFkw1e?=
 =?us-ascii?Q?MlFzfs3PSwH5Asu9spBbJ09bxbDBQcxmtEee21dkcyqYO6kBBcNPoWWCfIp7?=
 =?us-ascii?Q?Osvdb4AVvA74WgQxAXliio+nGKZQTF04+LyJRNjM+2r8GLIFbJ6YtSeroirX?=
 =?us-ascii?Q?sc7XlRlh9ENPleG2b5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+nuNEqkkkbqpLlHC8bdh7UAejeozUP82ATZuG0t3qqTSaGzx8SokseQijk5e?=
 =?us-ascii?Q?YwMK4UJwTTZZRv8YhFYYw7wx/sYeMjbfpWm0AcyErfgolZIrpyRDPg7p2kip?=
 =?us-ascii?Q?5Z9/ZEW/FwV6GDotbZbqV6i7iEBj7msIQ5jQDlQcJD7rSwJbQn+yUhiIb/XP?=
 =?us-ascii?Q?vuEfaarzPyTITsHF9ZcOq/ryGIz0q9sSzkNbsJ8LI6vgqg1WJzrGDSsptO4D?=
 =?us-ascii?Q?7Cl/TElEKzdTVyeVWl8n6XMppDAfd21yXiVZxPgwOmvE5kB+yq8cCZ2aigOM?=
 =?us-ascii?Q?5YaGSaU6uhI0/I8EeMWH+hAupX12NQaZrXfqbL2YN1EzOk9S8eN4h7G+b+Pw?=
 =?us-ascii?Q?FJYsd1XbpHuEQ8p8O+LJlRwXEDTWV63tVj0dkOoJSN+qMJSn5mJ9d+SWrcGR?=
 =?us-ascii?Q?2WIdFwTCusaAFtYqrv5KzEkkxexPU85YG8sz+VW+aGqMWx9JqQGbNiU8tIoF?=
 =?us-ascii?Q?n8w5jtAX09iKVi7veY2oyo6L+Peo8341HQGIzgNW8IeU3gQDxabcmySJiIBW?=
 =?us-ascii?Q?BS3qZSNlleGGiTec97W+7dIDPkkAlXBQhROHpljrCM5bKbvmwVzruLjy3r7Z?=
 =?us-ascii?Q?J/Jf5kIfNNsmFnsqXbfP2bJvyOhbsMZLrK+jOM1oH5hUyxF0VpGThfmmj5hH?=
 =?us-ascii?Q?NOMzn+IVkzSUPecoSJBGVw2CkLbQMzNkVMEweZRNW7kmnP7FDVP1y14ANwIB?=
 =?us-ascii?Q?WV0rcK4dC91U4lB6JSFZp7pvweFfqVBh6T4XT/PXK8+yxxL45/Fg6eQ2kh1I?=
 =?us-ascii?Q?P1CfhnBRV9nKfclOO/A3i2gJbbd9JAma+fhZPbMcv/1Dz/LCX/gsUbaMmheQ?=
 =?us-ascii?Q?qnZwzX2Lb5J5FxEH7k0aRq7VhYII3Lhrr8RCtMceGn+bCHhzGuIvEOAgRJyb?=
 =?us-ascii?Q?EWTmHJhwaHkkMOBCGsuKD0hrAUbjY3dTMoCFmT29KmV3bwi7ngcDLvM7NG5H?=
 =?us-ascii?Q?K0wm63hs6gOUB455JDafpadJ4R1zGJsiRjShm1ooKQUZVVUBa/eM7W0n973E?=
 =?us-ascii?Q?GcJQfn1vbJkbK0YOT2IGCp/QOLQ5iBunCA8P1JLgEqVgtR1aV+BG00sacOSQ?=
 =?us-ascii?Q?vL0L6WosrQcyhpkezBuwYncWHznxr0TkYaQ+P9RO3tOKld9PbrH+r+cBP5yh?=
 =?us-ascii?Q?nRofgpFuzRB8TKVKP1jWTefxYH/wOPWpNP+Mia0eyfrEN5fQ1JzivJDfic4o?=
 =?us-ascii?Q?B26ZRXckeP2o35g7vP0ZffNpkyI+U+UwLC/V2+pTvfjPmfYdzHGTaWxqz6Yp?=
 =?us-ascii?Q?Sha9B5JMOHkL93KR1/MRkW6TY9QM2TrEQX6NNZcWDYYGIfqH4tWOt0JTcVRU?=
 =?us-ascii?Q?pVBStMvLD8Yq97AmVrlTXpjMT0YFScIwG33vOKEfDqcyXl8P9I/iczAx8Co0?=
 =?us-ascii?Q?46xAIlL93k/zTIZGJgeSVO0c/o+VOj8ffUDVjxnB3W9jtQqAeRtZh+ebrrTD?=
 =?us-ascii?Q?ZHOLiFM5rrYmG1nV0b1MbeHkObec5HIaJ4DtMMtKIBaabEKeU4gk9ctCiwOF?=
 =?us-ascii?Q?wJvtvudJ2JdtJymerGxqbFNzr9jLYLho26dIwCZH//S0FPi9mFVLdtKi3oBN?=
 =?us-ascii?Q?V8zVcRupqqZV+eF0LaPB2RW/ExQLSNRFqsGi/Y9N6O6/lwA2HEKKDZxfVTXY?=
 =?us-ascii?Q?NeOrabQZEHG2g9F23gQvqSXf8qRZXQ4uE3aLwdYZBlfw6eRZQRooQ+mZlPL0?=
 =?us-ascii?Q?qNAKRhmNGD/G4u/v3lK9CVr985qqhtpGn/6ISdE6zoQEn/EBWyO0zK9CYeJy?=
 =?us-ascii?Q?MfA/GdwJdQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Axz7S/ry+cXQ0hw4lbcikXJD4rcjLT+DG0tIBY463oUQFMTmDe9cmYr5MM8fcnYbymQiQRMybkBDc/QYnHOxtmyjDPFk/pBHYCwhi7ihCBiyvzAnSUfTMmCuN0k8jfnloTsAgmqYCboIJaxn6HRqfbnyb2QywdpnkT4MxawofPgqyQI47iI0s3q3aaf1xz58KgUMDd6vtZHuDV+tHpqtXzm3QtVOcf9vWDITzE2FWbXV/Csn+NaC60/YNw5vbVAVGR8fphYoWSUhZ5QQCyGheP0Aa/OeVee30N8g9GOOynJRTSPlb8R3txVKTJTojNqLFceTvD9NlzijZoMcT+AF1Wa4F9LNJmqt1Raj421pLy9asE0CdRm4FktOOcTaVhPpmhO0Qy5Z8ot72Ujg+4ofNJDwjei9bRCQB7+cO4RZVa/X2LKpy4HbJJu22wEoTTsGBRSKBp2pwO2VPEHjXbxWPLhd9Azdn0euew8yrGoqRhopGThTKe5GEg6k6rzIeqhB/WKhIqXIjSp1y8VR3YiUy9qbSEIxuwCcIih5e/O4QvWaqOon4TcIju4/3cE3pqw7DsdSRsMII0ggZlvAhZtCoHqC7MDLCWMhE0sEQTF1N3I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206147ee-c40b-4db6-b898-08de6809d8d9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:34:23.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAOkW/kwjJrwNZ4n22cCEOncAo6B0pniy8DowlAxTl36LbBJ8ze+YcWRvetgDdIrSiKftifCejJJ/7YVm22a/4mPA+Czs7BagIHLQSxJOYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4451
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090156
X-Authority-Analysis: v=2.4 cv=Adi83nXG c=1 sm=1 tr=0 ts=698a28b3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=5va2qiOruUmPp-h3SRQA:9 cc=ntf
 awl=host:13697
X-Proofpoint-ORIG-GUID: NFYtGiAWPj2AXRP_TYKlwdcKO8oAmkmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE1NyBTYWx0ZWRfX0OxfXp17eYSF
 WX8MIEeWXbsuF///CTdRUCY2iClLMaR3BW8rXY9Eds+nL/eCPvlUFvU+eDkiuPPMh5n7jF+pZ5j
 mreWUIg+Ts/i9DtW82Id3dgMhkmj1bkd9W178iOcoTUHTKuHudOecIb6k72uMH/hNxzagBREwxh
 pxqxizJt0/bg0LL1bWGxZrpkYNzc+zyITnc5PgaI3MfThzrgUyvjw5B93tGeYcT0zsuYy63JnEE
 G26q88odnVwVYhxQEj0ymBfazkvnWhcSaI4dHKbtydiFGzIeIuEaIGALI3fyHTRcj95maad6RmL
 T3vLjaarJXwzRC/IW5Rt/RcEm/XJBWXI4+QWuqGf4uhNxQf6uKnzG/d6M77SNvIR5EAFpn7D/i2
 PC7B3fKiMEwNPdPOl3lv1j9OqZ3DHEENf1JUXuPyWCPe//rxGv7ZrYJHt7xYiImFF4bLK/Edror
 GBJlIutajVoWxTHq1/TviAgv8v7yLxy3oQeVKY38=
X-Proofpoint-GUID: NFYtGiAWPj2AXRP_TYKlwdcKO8oAmkmI

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/consumer/tst.merge_ranges_bug25767469.x | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/test/unittest/consumer/tst.merge_ranges_bug25767469.x b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
index 7e265f2f..a92690ad 100755
--- a/test/unittest/consumer/tst.merge_ranges_bug25767469.x
+++ b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
@@ -1,10 +1,14 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
+# If /proc/kallmodsyms does not exist, there is nothing to test.
+
+[[ -r /proc/kallmodsyms ]] || exit 2
+
 # The test depends on a kernel fix to report kernel (and built-in-module)
 # symbol sizes correctly in /proc/kallmodsyms.  An easy check is to count
 # how many kernel and built-in-module symbols (that is, symbols that appear
-- 
2.51.0

