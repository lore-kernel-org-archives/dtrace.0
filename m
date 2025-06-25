Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50F14F9D6
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831395; cv=fail; b=pZ5mytXWyM/CXxYaodF8cwi0XmdA17a8EN4HDTZmzk9wztW+cnxnXZBKCgGjArHtwn5acMI37tLvWIt/yqhtwQr/yeVN+Xi6Z/VrhBeBttD3Yg48MyHCt5g8d0LEJEX1ILxV2rDeMwtJRItj5io3z3mXoj3IfMDXoyjXvQXo1ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831395; c=relaxed/simple;
	bh=WyjUjhVX9TD5sRwC7znQnnMZNw44bnPGMuWYfVEe91g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X+3J76Y1Iml8ObNBoFziAx7pw4FY7y96g4IAEdfNIJPil4We5p5DCEUSmGiTnr+8uLqjqGokNJP4IHA0Y4gOaDNNrTWDeV0fqaUqlKwICm38Z/uMWnaNrEFKn9t7kX7VzHnT8Hu3hoDCEduZBilRzzK800c9pdAYD0h3HxVgfHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gx5JieWl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wmgqCRtg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gx5JieWl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wmgqCRtg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMigh9030672
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cLh2Rr5iQfchBUZZzo
	DNPWYhjBWUmk1ZHUT8XXqbBgI=; b=Gx5JieWl8McBzkHTpiYUNfYcllX6mjrtCz
	mzBmPYHclE6cLpa9NsTZMavCVvipggoVj6XRmoheM9Cepa4CVVhsQwP7bboqCCAD
	WzkhuDX/PrrC2Pkbdfi4Da1er54iPvNmunFKofDWODRC2Yy0vIgdyqE6g0std5JJ
	HuSBEeMMzbydBkmyj2XDNHaPgExEg7Q8+/56/pzQkofRF8iMEEvCOllbjHv/soUg
	Y7F2W4glF9CenpAvAyjAswY91iEnKQJ6t26njHK5YrO0Ef5/4turcMCZrlqzBSc6
	Mr30P84fiyz5QBXegV5PmBw7IOvW9KVpX23Yw8Zk19jzDDiMNM/A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxj68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3iWqH038894
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:10 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5kns7-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuV+vRrzs38ETTZ964nwDgRQHxrv1ngLvlEVTcL6Lvz/XfpZ7ukVX5H4oo201vUZ+mHWEWUxVQGQabThU04mUkaU62cRO9CqLAzHRGh+T+++Poh+02RMErKUBnVCF1kVMkH/ATSm1GAqouLd8TWtRyTm11fNgr1RKbBRLyhj8E3ziT7SqWhv2yRLT2b4kT7pzwZhV+0R8ZIakW0PI3O/qs3DsqhJSKdrMxT93sIO54F6JYkJkQ63jWQ8vOoievk5uT9q7VuL5Ms6ZX/YifSI4h3+VyyvtRgLHXqq4UzcE4MugULOySoZC8RKEAaBcQvPACN7FJknrmbxSOcjXgdE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLh2Rr5iQfchBUZZzoDNPWYhjBWUmk1ZHUT8XXqbBgI=;
 b=bF8Gaxb8qQYIA09t6Ksns+ENWE1frutC5VBxUx4OHANP0oWnnQAqJzap2nHxbDwgeP0ftCAzLK72gsmG3fTJGiquPQ5WVrAcEosLy0w32fAnHZZQov1U0571b+vXJFupr4Ie/DHHMUohpLPvEjZG+ihqGTdRlPIRUPVpxUffUlrgkNADQJFZund4Mpq+nXQKbowBimaHnkL3e/1UUojAXh3aDMZ0CyRyTO/oexlUxU1v+qhW+DcKH6gn/8ypPzxxHtiE0R7SdSRKSyRahPr4mbWdjXrbnRzTCLA8n/XRS96gBzQz6mzDoSg+xgh8KODoum9CMEa5JjOE0CwFjAb+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLh2Rr5iQfchBUZZzoDNPWYhjBWUmk1ZHUT8XXqbBgI=;
 b=wmgqCRtgr2K9U3VyQzhxwvmfVxwkjUZ6e0gPgWqn2SWJGtZvzsiyJbeyKgpTEH70ayYYlGlsy7DhrNAK6Vo/ZEhq/1PinHEKRyHtfw28tFQfntpeazuShGZfcGgYny4Z+AdNHTmN0ltO7syfY4nyGeL/vWF9qh3gcXTcPVtPlMY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 06:03:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:03:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/4] Sync up the version numbers
Date: Wed, 25 Jun 2025 02:03:02 -0400
Message-Id: <20250625060305.15707-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625060305.15707-1-eugene.loh@oracle.com>
References: <20250625060305.15707-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f3f12c-9a5e-47ef-6a60-08ddb3adf56b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qjI0z5eF2nB7RM/FymzZj87zEc+Ngb0Pnp2Oa2lVWcdVwLoZ4Y3FktTr86My?=
 =?us-ascii?Q?QR8upjuBzoDORttDsApxRaAt66Xvw2krZB63lAo+EmjgyS+ZhOZNA7KnpWvG?=
 =?us-ascii?Q?n5GoV/hBBwR1ymukuQfjsZvcn0eG3lmYS6ssPOCWz3vErCXTwYKoT0rxiIzH?=
 =?us-ascii?Q?ok771XAfqq0mOrIAtKcPWMRsUx45pGYz+RLUoq0RcEtMyfAMo8XPawY01EGp?=
 =?us-ascii?Q?PyH4udfX23h6+xKZJfY64GpjxAhhdx+q4QRuxYoxl3zXtD+pp/EP7vj7JjrD?=
 =?us-ascii?Q?mrX6wDFSi/dnzWuOULsNCier9NjXA0ar6QZ7ztXn0/p4rSx2Zp7zAn9Ilx4W?=
 =?us-ascii?Q?YqifhLpUkhoqgylfSAwh1hu/fFq2hldt2XfmmqC2YESB03K5J/rUat9lUCJY?=
 =?us-ascii?Q?tImdj7W5tDWEhzYTL67LIfP2I0wB0aUxW7Or9t486pDU6ROKHQPvjJfCSdOW?=
 =?us-ascii?Q?+St8CC4oBKoq5sHnSotxNx1+JPLYigulwQRg1NdtAd5E9UXRD3l+eTVS2NNA?=
 =?us-ascii?Q?fbqRnh9gT5DmWFovLecZClITD+DYfHxRA83d84N8gyAm2a9nus5o12Ke5MQc?=
 =?us-ascii?Q?bUX4edas+PlZLf+bwiGY4a+u5LEqfMe/luQzjtKpa6hB30GHOEpNTBx8Rm5V?=
 =?us-ascii?Q?qInHSZoeAFZEnvSfSupnDLqrIXzKJ5X0zYN9AlVAsNF1W3LPWS1GCmdtWNVb?=
 =?us-ascii?Q?QA4DPSEaCcQ957vIJTcUNEK8yar9u6zNG5dHq8wsB2Cn79jdaS117Nd/ozRt?=
 =?us-ascii?Q?xALFdnc2CJUucehJrHlqhQ1SZEoGMkFgPlUvxrFD47IH7S9IIZwn330RpnN2?=
 =?us-ascii?Q?Xvy6Dbwwl2bNYkNFptJFoTloh9m2/68KSWgbWWylBKS5/3cY0OnECxS5q0RY?=
 =?us-ascii?Q?AHVQG2C2YhIMxdENPoyDASvD6b1yTS27QAcgf6NBiXo09LTyvhSZEc5ukrLk?=
 =?us-ascii?Q?w/KvZFlA+k/ZdOyZQi+11q4cGxuiwqQ6SqDdCd/kdES2rEYrHtEkOMPVzsdt?=
 =?us-ascii?Q?a8NSw1ej4jIkzQ3/EUug3pPcSGBRX47YkLTZaTyzkzNrYRXbG5/NDYAvnv2h?=
 =?us-ascii?Q?wbjs/pSUy45AEvcrd86Ix1MGa3OuEN0Uk1oa7HrpGRBRbZPHHfzTxWZGQTVw?=
 =?us-ascii?Q?dE9md4L60UKbg27PCnKc/EQQJP7rfUxrlQSGXWZ7H+JHXtxE4m40c8NGeoE4?=
 =?us-ascii?Q?gD6Wu/9Qwh9irZNBVOIVU+/0vk9jNM8m8d0Oz6ZoIFbo2XPe0nXw6WOpi9+J?=
 =?us-ascii?Q?gD+1UVUl6MexF4axhHCBABGZhZ+AVZo6Iq/33nMOT8XQqxcJQoPImxEO2S3E?=
 =?us-ascii?Q?5nJ0WmhPMQimBszMVezHbhe5YJ/Emdjb90xOG4nJgg7P+uf1l2IbVIq2UM5F?=
 =?us-ascii?Q?/Pd8ypaMmSihaYu8EGdqfZIKf9Jl7iXVFkv3i4jIuQHAZG0Ih31f3Xs1vGZA?=
 =?us-ascii?Q?nkf/3aaqT+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MmLCuxDzm5u9MsLmaweHxmJtBstyKGOueHVhUPkvSgjs0FCoUPDo0GdrT6yV?=
 =?us-ascii?Q?QuFqCgrq2YrSJyNqqRyTx5INPNfg3nd2n3oRS/i2u5IjCA+Fso5fRbRWhaSX?=
 =?us-ascii?Q?TgdNgqbx9RXFNqrqMBJ/6Qfrqdk3kRyGW4gjo2c+f+WdTsbg7DgJEFvMi4zy?=
 =?us-ascii?Q?3592lZ7bwng1IOARQiq0OYnvAfqd4GLtXZHOJCeHUB21dSpey/sE/0x9NeoU?=
 =?us-ascii?Q?tCmH1ZAn03IolrKtdk2JdvXMoDzIWZv/GVqoYyqDB9/S0v44G120NkYvzIDD?=
 =?us-ascii?Q?WX7al7GsH9fcdHh7LeyPrOBVl6b/gpYHSNgpXcaJVIQRSYkY/N0A57zf7xTB?=
 =?us-ascii?Q?UeMDfldO0+gBnfb21moAZUgLnahsjXetTL2OmYErR/PUAM6QiL1/RjUwMGYC?=
 =?us-ascii?Q?Mx53+kAturYcdDcp+fbvdG8f2vy2PIScJLuDiSBRIFwxEz6b9Y4n08WPgPWA?=
 =?us-ascii?Q?EvyyuhBJMK+P3dGxhg7AY5K+RyHrnJU6Y2WWO8Li6+8j0RT31FjWVhCRz5dV?=
 =?us-ascii?Q?U4VT5ciN+vcHHaIxwC9Ndc8WcXKka1GUWePIENNrt3O3etoNBPJO8FcKwVQl?=
 =?us-ascii?Q?wZ570Vu6WIQSF0TN4n7KqTjX1x+ArnLL3iVMHeZHEDUaom02JqVRQ7yCCv42?=
 =?us-ascii?Q?C2/0WkiwpUVlAW5yMObDrRb8pNZqCHJ7tP0es6wJXEwzB3mnB01B8ZDP/HFF?=
 =?us-ascii?Q?wSGYW5jtVwxF9516yftx45hpX/5WFx7P5XcZi7nkZm0Mxz2gb6ud682VtoDG?=
 =?us-ascii?Q?51pPrYi2qhg9ZZSO1krI8G/umnE6qZkAOlZY0f7pMDGDhGS4e8jBNureIFL6?=
 =?us-ascii?Q?CmLHieuVVHc/gz857D4oZrXREVAco5WTDHVz5inE5406zFWWyFiMS9UEFeM7?=
 =?us-ascii?Q?5tuUYMxCoEvtUpDI5+LnZhQEM8qR8BGIxuCCr7RwVK0wWuuWQ7C3uAiJZQoi?=
 =?us-ascii?Q?f14JhLe4jWFy+D+ZFiGrCAvpSgLoDbAhQP3mEPFSe1UhvkHgrQ6fe6iJ+gEp?=
 =?us-ascii?Q?+aH0HUzrPNOBHPu5JlGa3bBfirya1x+SJq3p8Tw+v3NJyFplQnsTM2aN3A7j?=
 =?us-ascii?Q?CEFXYzN7oD8M9PyKBUNAM72Tu9EZAvvli78ZGpOMD8PR8WymERVYek7NZlLN?=
 =?us-ascii?Q?tAKzCjIju3GmToPnnWsD55uSkMmufBDS4WEPl5KLRVbcOjrDvwF+1UmOxr5U?=
 =?us-ascii?Q?QZTgOvtvALIzT0G2Uyy9NmFXNrsOH7tD+MOfHPWqtQITUpyB5rwKF6mxOenc?=
 =?us-ascii?Q?AfmS5eip5KII+6dlX3YWqNlmiX/qQWLutTYSh2Bp7+5Gvb8IDnxDC8Xb5xu5?=
 =?us-ascii?Q?6DvqRCvfmeKno3yp3gUFatdQp1VisqY9ukWesy2l3uPhyDiQJnsu3uajWMJv?=
 =?us-ascii?Q?dR+zQB1pmGZQ2dYvOGNIx/g45tVpfUWYIC3nB11Oauo412GmjA5f70/c+liQ?=
 =?us-ascii?Q?g5SV5PI/fHFbSKyud20hWb+TaqvosS2K2vwU+Pree1V12Wa416FckCYp7aPX?=
 =?us-ascii?Q?4Psq66/yZ3vch1D4yuzur6LQFRKk0BecRsooxxljbnoumx/xLUDYpm4QfPPC?=
 =?us-ascii?Q?Pu4+J5YcwNmXRydXcP6mL/9mri6PCoJ5lq9MF54K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iBxY+iTF/7qt/1dDrA5hobVm/ldQXw/GbPEZP0Bdpu9zlKdpB4hIlYjIjfeGh/pcuSqh4+wv4pLosDkEbicKuz8NE3whbl6n78Xh0vOu+Zus2Czn9J6pXYj39OxewsREu75Jy+XyL5RtUHRGDPeMVICWh+MMW5231ZwfJQ48+GIej+78WDErxtCkRaE2RrH712eq0LnQHemxwnY8JwhWK//1jt3VW7Nal3YePj3iPJfBzHv9zY+xs5tRhEoArDGoDMCI9yQDxgZfUctI7MMYleBT5MEGLyKFQ6oSeMcnL1KPKnwekea9cuend3pm+AVGP8Fqi4Zh5QjMoyfCweSjP5haX1hQc2U7QDaILRp1gH3sGMxMJFJGqApJrCOxe7kk2lHRAwrT/+9bTxJykAnphShId2b/k8yzzFd7Zo2Z+M+CjaLE26Sd6iqB4XyqSIRgUoEWMprS/6DPXlF51mAHsTRQEcbwclOyeevw7diSdi++JrDenk+67BWiIoj6OglRpwytKfgmQfkf/8K1haeh+uqtRxPeqwA0OzWmA5y3FGSeeAUV20anSTf/VqofjQXQFVr3uQN5FhBLsiqFE9zr0ezRRz+Pfn6ZkvFa23332nQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f3f12c-9a5e-47ef-6a60-08ddb3adf56b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:03:08.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Etm3KX85+hv2L981fsKhMsjwo6HPIjUgbkTzRgWAl4EOq8eMyYLRm58pcZf6QidGniOiI+fEel/ncjwfWrj9Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250044
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685b9120 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_qhEo7PTaNv8MlEDs1QA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: YqDPbJs5IIm8qKvafqhKA5cAiBFV0u4t
X-Proofpoint-GUID: YqDPbJs5IIm8qKvafqhKA5cAiBFV0u4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfXwGtnedkOtxzs xUS62fC20GPIkNHyDW65o7KrwmMG31OzBVEluITdTTp5PZ6ZdfHIsymSSUSssMdvzqfEaEfXHtY i1iwgwyijW4qnHkqrKQSh9u75HL7CY1+v0wM3WW7DLTMfmGkjjFcXu2bAZp6bDnZZU+8Fz/9xul
 Gz8uMmdjmKQiDSpCtgHy/zpxBZblGHN6B+gw3fz0mz4cbcWWWfvNmPV/6dDaGGR9m6bOd2rzTY7 asOlqzQO3JIFq0opDa0GtMbqEIgaePzJUOk4zje9GNCa/fH3hrWlAKVDP9klxJosHAZ04yAanf1 onjFndLBm2RpoQJEoBnp3qLLFHBudaEMRCkN8TzsrxAqNC79s2lvO8Gtfpxe/slInpnQGfkk/RP
 fbn7vgP/dtRYpEjcEMxcvHLWVdzuPmOZO8X/dMgvd8rREYRCtjlAHjIKx6JAfWhOP3SVWGgz

From: Eugene Loh <eugene.loh@oracle.com>

DTrace has many version numbers -- e.g., for the release, packaging,
and API.

In reality, the variations in numbering have become nearly meaningless:

- Packaging numbers -- like the Version in the dtrace*spec RPM spec
  file and the VERSION in GNUmakefile -- have basically been tracking
  the DTrace release since 2.0 anyway.

- Stability attributes for idents are haphazard.  Generally, they
  are 1.0 (or sometimes other 1.x), and all the BPFs are 2.0.  While
  this is generally accurate, it is not exactly robust, and idents
  are sometimes introduced or modified without careful regard to
  the version number.  Further, the stability of user D scripts is
  likely to depend more on kernel variations -- e.g., the contents of
  available_filter_functions -- than on D changes.

- Version number updates are susceptible to mistakes, and so there
  have been version mismatches.

Bring the version numbers into sync for 2.0.3.  Clean up the descriptions
in dt_version.h.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 GNUmakefile                                  |  5 +-
 dtrace.spec                                  |  1 +
 libdtrace/dt_open.c                          |  4 ++
 libdtrace/dt_version.h                       | 54 ++++++++++++--------
 test/unittest/dtrace-util/tst.APIVersion.r   |  2 +-
 test/unittest/dtrace-util/tst.APIVersion.r.p |  6 +++
 test/unittest/options/tst.version.r          |  2 +-
 test/unittest/options/tst.version.sh         |  4 +-
 8 files changed, 52 insertions(+), 26 deletions(-)
 create mode 100755 test/unittest/dtrace-util/tst.APIVersion.r.p

diff --git a/GNUmakefile b/GNUmakefile
index d1e18bb1b..00269785b 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -3,7 +3,7 @@
 # Build files in subdirectories are included by this file.
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -14,7 +14,8 @@
 SHELL = /bin/bash
 
 PROJECT := dtrace
-VERSION := 2.0.1
+# When updating version, see comments in dt_version.h.
+VERSION := 2.0.3
 
 # Verify supported hardware.
 
diff --git a/dtrace.spec b/dtrace.spec
index 6bb792acb..dd44a5b67 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -72,6 +72,7 @@ Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
 Summary:      DTrace user interface.
+# When updating version, see comments in dt_version.h.
 Version:      2.0.3
 Release:      1%{?dist}
 Source:       dtrace-%{version}.tar.bz2
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 7d47cab34..6cb797df6 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -60,6 +60,10 @@ const dt_version_t _dtrace_versions[] = {
 	DT_VERS_1_6_3,	/* D API 1.6.3 */
 	DT_VERS_1_6_4,	/* D API 1.6.4 */
 	DT_VERS_2_0,	/* D API 2.0 */
+	DT_VERS_2_0_1,	/* D API 2.0.1 */
+	DT_VERS_2_0_2,	/* D API 2.0.2 */
+	DT_VERS_2_0_3,	/* D API 2.0.3 */
+	/* When updating version, see comments in dt_version.h. */
 	0
 };
 
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 0f47ea70d..5cfcab69a 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -37,32 +37,28 @@ extern "C" {
  *
  * These #defines are used in identifier tables to fill in the version fields
  * associated with each identifier.  The DT_VERS_* macros declare the encoded
- * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
- * string that contains the latest version within it along with any suffixes
- * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
- * and then add the new version to the _dtrace_versions[] array declared in
- * dt_open.c.
+ * integer values of all versions used so far.
  *
- * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
- * explanation of these DTrace features and their values.
+ * The major number should be incremented when a fundamental change has been
+ * made that would affect all consumers, and would reflect sweeping changes
+ * to DTrace or the D language.
+ *
+ * The minor number should be incremented when a change is introduced that
+ * could break scripts that had previously worked;  for example, adding a
+ * new built-in variable could break a script which was already using that
+ * identifier.
+ *
+ * The micro number should be changed when introducing functionality changes
+ * or major bug fixes that do not affect backward compatibility -- this is
+ * merely to make capabilities easily determined from the version number.
+ *
+ * Minor bugs do not require any modification to the version number.
  *
  * NOTE: Although the DTrace versioning scheme supports the labeling and
  *       introduction of incompatible changes (e.g. dropping an interface in a
  *       major release), the libdtrace code does not currently support this.
  *       All versions are assumed to strictly inherit from one another.  If
  *       we ever need to provide divergent interfaces, this will need work.
- *
- * The version number should be increased for every customer visible release
- * of Solaris. The major number should be incremented when a fundamental
- * change has been made that would affect all consumers, and would reflect
- * sweeping changes to DTrace or the D language. The minor number should be
- * incremented when a change is introduced that could break scripts that had
- * previously worked; for example, adding a new built-in variable could break
- * a script which was already using that identifier. The micro number should
- * be changed when introducing functionality changes or major bug fixes that
- * do not affect backward compatibility -- this is merely to make capabilities
- * easily determined from the version number. Minor bugs do not require any
- * modification to the version number.
  */
 #define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
 #define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
@@ -80,8 +76,26 @@ extern "C" {
 #define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
 #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
 #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
+#define	DT_VERS_2_0_2	DT_VERSION_NUMBER(2, 0, 2)
+#define	DT_VERS_2_0_3	DT_VERSION_NUMBER(2, 0, 3)
+
+/*
+ * When the version number is updated, the following must be kept in sync:
+ *
+ *   libdtrace/dt_version.h    DT_VERS_STRING, an ASCII string that contains
+ *                             the latest version within it along with any
+ *                             suffixes (e.g. Beta)
+ *
+ *   libdtrace/dt_open.c       _dtrace_versions[]
+ *
+ *   dtrace.spec               Version
+ *
+ *   libdtrace/Build           libdtrace_VERSION
+ *
+ *   GNUmakefile               VERSION
+ */
 
-#define	DT_VERS_STRING	"Oracle D 2.0"
+#define	DT_VERS_STRING	"Oracle D 2.0.3"
 
 #ifdef  __cplusplus
 }
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
index 6bc7b9d72..02bf03150 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.r
+++ b/test/unittest/dtrace-util/tst.APIVersion.r
@@ -1 +1 @@
-dtrace: Oracle D 2.0
+dtrace: Oracle D 2.0.x
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r.p b/test/unittest/dtrace-util/tst.APIVersion.r.p
new file mode 100755
index 000000000..32ec94df4
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.APIVersion.r.p
@@ -0,0 +1,6 @@
+#!/usr/bin/gawk -f
+
+# The test allows the version string to vary in micro number as well as
+# other suffixes (like "Beta").  The .r.p and .r files still need to be
+# updated for each minor number change.
+{ sub("^dtrace: Oracle D 2\\.0\\..*$", "dtrace: Oracle D 2.0.x"); print }
diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
index 15010b3db..882e208ed 100644
--- a/test/unittest/options/tst.version.r
+++ b/test/unittest/options/tst.version.r
@@ -1,2 +1,2 @@
-version is 2.0
+version is 2.0.x
 
diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
index ffffcdd8b..684120af8 100755
--- a/test/unittest/options/tst.version.sh
+++ b/test/unittest/options/tst.version.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -9,7 +9,7 @@
 dtrace=$1
 
 myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
-echo version is $myversion
+echo version is $myversion | sed 's:2.0.[0-9]:2.0.x:'
 
 $dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
 exit $?
-- 
2.43.5

