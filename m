Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF9412F5A5
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738045908; cv=fail; b=bqvWtISj5UppOQrkPf6LEVVU0aYRDtDieMum53XaAbknmlY2ajRigKuU1ZVKmyiicH8wtxD5W+x+QLcvpYY1B7UVqlEqIgTjIOYSIlNfPe/JOShs78HzptjT4kRWsQfU9uOxVjpoW4UQTAQYZ2UelMkwEB6AsOcdtuXUOW3uVAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738045908; c=relaxed/simple;
	bh=6YLfgUdTwnDgip3ErPv8cfzX9UiFZwgA5fcMoswnr5c=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=a+rLLYPL068MjS1eFKbZD1d+DMfhoinNwR/5iSj0OS1Cf9+jj/KQ0MR0GdJ+jROzufLFBURi917wjMs6/FVvn7blSmJNVxb9lhipvlXyf4jd22oFk8zsn642NO8P/qbTjSKkCSsoh6WGyEMI5SN8DJiNi/tyLw0lO7ZW57/Oeh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Se5Vk8IU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oqgnXaFQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Se5Vk8IU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oqgnXaFQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6SX1b005722
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=sMI+ZcsCjpPCXl4B/RwTabvSa6ZEFtm6cmwH29EEokk=; b=
	Se5Vk8IUoPrq36FYEwU5Zu5NifQjWfo7q2dxUPRiS2WDTZO/kqDXZ1xOHaMvzfix
	BxQWh6kouMzsumLRBeYUuPdzPgjQOGBR4MsxT9zT0lIuDF4meVjVH+e+I/o7YUAX
	THDYXuBtp6NXDqw/VUhI7DqytbDwFwKLwRQgNlrP+LRRT3T4WeT5ubAOg5vhhN17
	hb8nerqYtCLAHRpNXZFvD9ntTVrshaE9F1K3FCU9kEstG+7Hk3RMo26nOMGijtIM
	fPO/OGQJsQ6vQdKtsPsY7uAG+iesZJ7Pf0T7mYWFyn2vgkBr/Q+SpMDMu2/Topt5
	Zl+MvqQh4FZr8P16gQ74oQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44esypr055-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5sLfW034166
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd7yagr-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlCZ2neDfRzn7fiVrNjKn139QJZbce00wNBcrCqgMzzAKyojwA59Lx4qxAvAZvwuwGz5AnYyp1Eiitfgfo9YRsOnzLxJGkHXq3R/rgCtwCcLAkXj9vW0omk8ynTP8iBef9EeA0nFMJPmc29gtdc8CajQiMVUpIKeU4UxBglsrZa4nNN4z4utRlEm45+nXt7F2D4GMa2ds4g+hEUNSa5C2zfymPY4Aw5gSZCnTEeaUNmRCBB0FYyfXrreITbz9OhX5F+VZycbFmFxYdhXnN2QiBn7N5XGT+ZJ8gULUSVBLL8ZxgBRfrNsQ2qR7UlwDKqpp09p/pWqxRXkP9y+KODWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMI+ZcsCjpPCXl4B/RwTabvSa6ZEFtm6cmwH29EEokk=;
 b=m+n70NMT2X8nojvCznxfUMclIG8c3IXDkz/jYewEefy9mn8CuOvuAN0Pl5LzWx67UqU4Ibf035mfChlSWso6OhuevCaeSAU7bUBLPvZF8LIKdiaeKJ98ApazlPfqX0ksdoIRGpuTPrhNQiqnEeNgPRcY+kbAUnPJtIUc4FrK/5lnyecaJr1rqCq5TyHxPkTpJrcp3n7CQp3upv2eYDrXLDqVFyHEnjRAdppcPXcEKDbHk4RK8xvkENh0S3LsxDpbkGdRZ0CBWDycGzJksW3irRuu1UPbbzGwwKR11XHrzlVTy8lqa/cB3BI0Njm9JlG0wRfK7spXpYpRyy3SEy+95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMI+ZcsCjpPCXl4B/RwTabvSa6ZEFtm6cmwH29EEokk=;
 b=oqgnXaFQgXLlsN1BjJ5EPXC/NwgskykgYkWka4wer+LEUcBUAAbmxf4GFyhiP7COLWkl3fprbUg7H8oLnFlspV/Tfe+L+7OYo3zSs5YC+0FOf3k6j89XSINdpUSixi47WfcxKGJgfkjEl2hrAU9qWu6AfQeyMm/fRAWZpHZTepA=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:31:43 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:31:43 +0000
Date: Tue, 28 Jan 2025 01:31:42 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] include: remove unnecessary include of universal.h
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB633743494EB68A4F22CD0473C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1cefec-a472-4ad0-80d3-08dd3f656e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QA/E2w2AHOKow/hoxOv1Hwq77vQe7rA8mf/j7MDxEV2i94cUz3KjVXwm1CnI?=
 =?us-ascii?Q?PtwObHEkpSbIbf63cgwjIwecaPuQdJy4HdA0KtjIaW9SPZcMSaXs6nIhmoWC?=
 =?us-ascii?Q?1IXDW1TIoneiLPoLcgyn4cwC3uGaqnMbPSQBVyx4Cyo6i+9scX/D8G8BF6Rm?=
 =?us-ascii?Q?x8T8vwAHSSGCGHpBOZhUnKP5mzlJyih1YIlj8auufh1/KFSg5HpkHOLl4Vdn?=
 =?us-ascii?Q?a8tMrLm6/FZFF2FF+u5DIEM7uiaJM3X7ZhT0K4Th7NfzQ1td8xjM/p5od0gP?=
 =?us-ascii?Q?MsNjrLCfnFgPZs9cippA+6kHwUvUNbW/CFu066XYwo7keWM+CdABzHYJ8JPJ?=
 =?us-ascii?Q?zWttm3JHFKqINskj1okzLrxCf8ayKfkRZ4s6ng1ycKHFJo9gWflk5pW7Z+KQ?=
 =?us-ascii?Q?/7KaBjTovoc2rdLNeU7rIxVBRELn6wztLVfsKRL/xrOXxGUhk4MALR4o5zaW?=
 =?us-ascii?Q?mKetq/yE6Xvq13qWyTiR878qozwn6/4vXe5FCXoPqNUm1G/bKa6lSqvrsiBo?=
 =?us-ascii?Q?h1uoxM6VFGPEweIo7NM41fCBZWOQeXk+bCMdm5lumnbcU3Q1EoS92Cnsn1hP?=
 =?us-ascii?Q?8FXDI8jKQf2fNPrae0Zjb1l6DByau6lDHkSK/A4AtECGxsHXx4IPc/0lego9?=
 =?us-ascii?Q?/XxS1ONVeBt/amOuwLUzIFBWcCSDWd3QXDgTs/budMFRHMewB2AcI/lfnY+Z?=
 =?us-ascii?Q?JQsOusfTnOVtv2vpcNF11d3Ao3WtT/ZuhhmivoyaXDVTxA32kNanj+Br0rHV?=
 =?us-ascii?Q?3AsjM0euBSOp8Wyjr2C2Nu0HLZFl36n8Y8SfYCEhNnpUxoR4//6fMxQbswPz?=
 =?us-ascii?Q?dhJAF6I4pzwm5qZ629fbfibWefYl4w/X+3QOEePQ8cEJZ0RFbuNOW3WajSkV?=
 =?us-ascii?Q?huS3DwTwwNDaTxBgkDidMoGP0TNvUDhkVZQtJeBhi7VhqDdGmcLXdG6iabER?=
 =?us-ascii?Q?V0I+UALHcUeHs2F2qwK1pDvO3ssdMeGoLWy3lsB3H5+Wj/b3vLC2LN5s72sV?=
 =?us-ascii?Q?YzRd4d78E+A4o6qq7yLl/klxxBKjrrAotT0tdSaZr/9A/fCd6eqcIN1QzBIO?=
 =?us-ascii?Q?GvRip9yOYZj2R+li8DAicg0SIxAslodd2+5FEI/lSRDytVNtrJ3AHlRsIllU?=
 =?us-ascii?Q?SA6m9U9jZ/XPg/zuPpFpU33TZ5hoSMBYCMi/pEcPPg9jhzQ+pRDzle0kKxlE?=
 =?us-ascii?Q?tBw9BA+NW6PWzzcZOviKfMd8n68T2B4BvoUyPMM6Y3uNZYoaRzESm861FwxF?=
 =?us-ascii?Q?P4D4+CVqB5ecWWrWALlYfSFCPyDU4d+VzcyVMf637unCCoaQvZgKrUulZmLs?=
 =?us-ascii?Q?ceac7B6xShb14PZKauhMq/DM8RFzgw5hvfcdDWhaqi3BNNdImK5IOltyOvNK?=
 =?us-ascii?Q?m7emKNTVLANebWCQVagH8rxVvHbb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vV7vXGsdrsI/TdV2JAaf3Lm05f9n0kdi0Xext/m2az8vPmEuEd9qC98Tqh7z?=
 =?us-ascii?Q?MuAiGnjAbvF+e3EQWn6+fuUZynikCrqRy0qQBvu+AiYjgZp+p3pdZ9b422aQ?=
 =?us-ascii?Q?ApzDZ7xNdfF6hc2/1iYInVpVYEaSR3ZAYvjDCOSJ74yAWomm3o+kFqTEYuDq?=
 =?us-ascii?Q?awYN7AfBf9EEOQY1FVJE1bNN5TZ4GvpIGqXvlP8p7FcsqYvzrg3pYTeIKEMC?=
 =?us-ascii?Q?niLgVINbLmYdi6YcW9A+IBBK8yZb7yz0MXYNp/iytpA3pLNUZyXWWu/T3bcU?=
 =?us-ascii?Q?l+LcutF7m0AdxdAe7dMuGOFGYTYQ/83S+bVaXRtZrWzNHauCezqS/+nHpIT/?=
 =?us-ascii?Q?uGLpQzi4juX9haigu8FdKMCX91a9ZDGa/+40AaOx1OJ+UAbA2EGFWG29KtsU?=
 =?us-ascii?Q?pdPfNcgrxCPimHqgZmhrTz/wP/W6HzMp4wJw2zUS/HEcI0BRrGxWNQ/8ZBYU?=
 =?us-ascii?Q?1IZ0YVxers8rU9N+kgTJMDDWmurrAlxJzt13QWH9s6zwSBzQmyKbV6a6uMJh?=
 =?us-ascii?Q?y0y9/4a1iC3mDWKclFSl6RLcXFvJtZvG6Ofh0JSPSMzTyOJA2GRtepF7NSbv?=
 =?us-ascii?Q?i8bQEB9DyEd3YeFM6X0n0DzNd0Xj3xm9X/ZltNPHW5VIbEIysRAkm5DEODc1?=
 =?us-ascii?Q?zpGRTOkMhiCkk/60Cs+WiMsFyqO5RabHUc8AO55qG9NjOKk4y9uS73VyGnMn?=
 =?us-ascii?Q?uCCrfscqeVg5nT1n/fbAbIiPPwJX2CbB9QwRe6a+/9ud0guUXee9eFFjV2/U?=
 =?us-ascii?Q?Xj4MPyA6TvklaHhhf0xw53MXGi/Icr3KVFizYEuKduS61HoZStaOkkaDl2jV?=
 =?us-ascii?Q?4dSOLdWFZQgdQpP6b0Z4qiDdWYT6WoZo0EGDrq2pUxU8Geha04/rsqKA+P1P?=
 =?us-ascii?Q?pyvXEM4vMFliSQuNjleCSN0klz+XGD7Vbhv3t4dHT/DmKwz/3b9KvAFmRoXG?=
 =?us-ascii?Q?eJecG4pLpwAXtH6qdaH6lFaNb6b2JBG48fzCYyxe+UDjtnRhJFoyIQCicb9o?=
 =?us-ascii?Q?MzBMVxS40tx225ly6OEyHmsjE1QH4QTY1SvpZ4xgwYCeF1VO8jbM3xI1O9lv?=
 =?us-ascii?Q?uucCJ4vg42Knl9PuH97NcadnTee8oTrDmsrJjF81Gs7mt8de0EyJilBI6n6t?=
 =?us-ascii?Q?wsB1DjRU6YUkCrAk7o5nrmey2xEBV4lHCjTsPq6wekscqHWzF4lx5HARUNf1?=
 =?us-ascii?Q?uQZnssM+uUa38QQHkJHOonkJ5nHk5I3tVPTnu11LeOXD7YN203OXMp+tMat5?=
 =?us-ascii?Q?FTCltm6XLIMIa5ja0P8NVk4FXJHnia8FZYyFLSI/G2Y1VMpFCZPnRYSyb8vu?=
 =?us-ascii?Q?Ax5oB1C4kTkRVeK1hND4qRnYAhtlJpixKNV5sm4VaQGSDGcUgwhG8fVkxYHs?=
 =?us-ascii?Q?uQMIC3N5ueT37nqSUb3r5f9AAbk5WVI7PFkx3vFCTla4ds7RwBFx4ZE1yzYc?=
 =?us-ascii?Q?RTZXPf4S0k4bXxBIvEDKy7QCHLeYuZWzguA+QnWIulnPTcFChHqTVcay4j15?=
 =?us-ascii?Q?6GS0X/p7glxRA/y/hnVugjPSvsg21CVY1Kg/79+YKkO5EssJKEWfqfs49146?=
 =?us-ascii?Q?kx6Mdi5CI4NwcL3qh9a+OZllnJgWT3T1A2K37XCJNkFAO22pyEJ3Nk5mOa+S?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d1+xQlwTYVQwNPol82Q0joqehNDC07L1+AvPbIbylDa3P89XkyIaLhb6XjMRtM8YGgYVJya2xfrLzwTHQ/1o0+enUQtsMFyeA5FWL7MPwY/+zX2yVq+xGxUdAXvIiQVtiFyotxf/cvbJUoMHW9CS1MZxFsBXUgnVt1hDdJLAGAiJ3osDgvbQJPsH2dvVznfeq+d8ZuWXNwaOya+YPkgt18MH32wFnfquTVo+EsiwIE2drTd2u9dRNdPAsXNg2AFyNz7+syaud37AtKZwU12nfAIHBLaOUq+03fFvC/bRMsxeCgECnJJq5WXg7KvuhlsciKoCz7mGF610N9rz4coeIv4gL3xCbsZIQMd3hAdtZJKcVZ90I7sLIxz4OqVR13gMcX/pOKF5j7/TckRPgsjOE0mc8NDE76JawYLe/Sq6THLjFUScfwnRdpyju4CzFUpaxSYW5wbRsAnRJTsul59X0RVjX1B9klFGSI5ee2ktC86hK6SloQFxeK8st53BrvyO083JYWE1jm1BtzwBLiwaniF3mxjsdfXW6PyJaovhGocGF66ReeJj/86sCxbyS6/26LNwElF1htOFDjkGXFXH/KdM0kvyDgo6+X9OuT4qOSg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1cefec-a472-4ad0-80d3-08dd3f656e82
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:31:43.5628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjPqE094+rl4HJS2lwfw9o7RSuH4bqSXpOjIAPGVWCf1Mk+AxdBlkjvvVi/cCLswMtLk2wyEVD803FkiapVPedSw6/5030LRt5aICYHJILY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=877 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280048
X-Proofpoint-GUID: R0mpUK_zIi-c2vazJYukDfYbJb8Riev5
X-Proofpoint-ORIG-GUID: R0mpUK_zIi-c2vazJYukDfYbJb8Riev5

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/faults_defines.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dtrace/faults_defines.h b/include/dtrace/faults_defines.h
index d50477c7..73aee543 100644
--- a/include/dtrace/faults_defines.h
+++ b/include/dtrace/faults_defines.h
@@ -13,8 +13,6 @@
 #ifndef _DTRACE_FAULTS_DEFINES_H
 #define _DTRACE_FAULTS_DEFINES_H
 
-#include <dtrace/universal.h>
-
 /*
  * The constants below DTRACEFLT_LIBRARY indicate probe processing faults;
  * constants at or above DTRACEFLT_LIBRARY indicate faults in probe
-- 
2.45.2

