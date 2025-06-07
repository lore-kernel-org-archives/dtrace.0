Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631AC1F9F7A
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276904; cv=fail; b=WHb1yR6AUkLNb0UnUDteYuxU3LGYP875xZZOhnKzdHWA2/Q5bKOaG8ZII7VGWwBR0lKxJticKv6JVqyHkhJLUD1Od/unBaVInw3SAchQxMdzvAqZYYy/+yC87L/wcJhMPhfFGZSoH9jq/KSfF+JDH/PvttnKWWszy4lgu/AoECs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276904; c=relaxed/simple;
	bh=z6LPfJeEd4tU9QTXVC/iCAk0Zr0M/sh0eM5gakOlQFs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=r1qG/zA5W+lKaiYsjL2wnALpo6ZyzGzk1gbSULGDGTDe0XS58EHVpZgj7odJxj4HiR1tM8p30r6zqi8qyqNlSO3X1x2/FSr9zmZ/rXZNyyRM5rDA3mdTkQ40jJYtDjEKIu1/0i4Dj7JsU9toVYdO89C6VSEMXF1M/2e4lLPyOS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C+OHBbEG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NFRzdf3/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C+OHBbEG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NFRzdf3/"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575wmhd015316
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=WJlEc5VSdUIOnjsYx1TNBDoNBsqdxGjsLznYnEn4bCw=; b=
	C+OHBbEGiliP13cwk0KYp+PAkhgFyW89bhyJO3pUoAA+GS0ntXovzhT23Xh91vUy
	p7wYHguEs6KkQoBjX/BMzVDxv9VyFOYQ8xiI+jxwKS7xyZl5vaUNYsuL6dl4mqWN
	O0XYQfL8oz3v/9rWCkXGRUV5kQad3pYxyXoybC/DLXnEf32zynA/rHlgIrGMJkwr
	c1jHDk3Rp4QqZodUoSAV9j7w+2/EwYzZCFmqm4fRNPVsvTmdVYtdYWvFVbHr0vIe
	FfAfMNjFRlK6Nib/t0JwpwgDEHZ5bQyigyxpTOUZsZh2T4scqN+nBYXj8jpAMdd4
	Q0B29GOAeIf7ExShhdPKtQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad0259-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571Y5p6020395
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:00 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc404e-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyXpU5S+yvJ10GLZlqHW1KfDy4hFiTXBdAyISqF7MwL1tHy/k/RV5Iu138XAFBYiLoDB0HWiHaDPp285Jyj/PPg7YtRjBcQ9haRtIEIRBKRCWEAnURx6vgC7dAiakvjg+4n1N/DyzjSrCggEufISjGzL/CR3rNZwyvVKeIgbgECR9lg4iCwD1sca5xRo5+G8SKLsgDk/e36skgUZtIIKfVvzpPJBwbqYoOw0BUsWnJnCxrUIuUR0UUFdcwo9Pyb6HLD19ioucZaZiKEPDtOCEDc7dtlp5fjjbMNtTCXep6r5PPahctZclzdMKJ/Wg3YrcFBl8VqyDgDBnUvU7k5tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJlEc5VSdUIOnjsYx1TNBDoNBsqdxGjsLznYnEn4bCw=;
 b=YNKQsimHgn8REPW1haYZ82QTWaAIESy9HY6k9NpHC9aG1RDgt9z3xnATmTL7T5oxOAji04z3ksIhVADvmLQWhyKWrxWNb8RQS+ZnCfom08B3Z+Umf42F0g4uPit3Vx0ocmqvXjExAbspTyzu/ps0R2uyhfHxEOYnsyWNfZygLxJKMRu8wSI3Aa4CnhvxN2Cng5F0RzAd5aFT7NX2Y/iEdNd9EammTZjxSGF7/NwLbbGA02n9pxH0/exv0SrJAB0t7Rgnz2RdVVFNIKEENfePuyV2NswH3LgA8u779Chzfr+trekgrAweQRrMvkUOFAnZ8kQUKyBOj6Pq9PdSHsK5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJlEc5VSdUIOnjsYx1TNBDoNBsqdxGjsLznYnEn4bCw=;
 b=NFRzdf3/Acb+1DNFMlpbfHJaCYlmTLauU9nM60J4+cU0tnkRetWlPcCioTb9Ww4tn4nAHK6j9Zg1bS0TpNztLAXCRfduyGoOrrqQnArgdMtaz8jCCFYzWw3JEsjMWKLMSsDXoFvUWBqbezadue76Y6UG+oJjdvocbeg/WGCkILk=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:14:57 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:14:57 +0000
Date: Sat, 07 Jun 2025 02:14:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/17] provider: fix registering fbt and rawfbt twice
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB837414FB80C9067023827F72C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: b799dee6-52c7-4097-1939-08dda58aa072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4/cqTXC3r7tt3et9O4R63h4dibSsE2XAitYT7Evh3lb67fWAMLECkAyUu978?=
 =?us-ascii?Q?VRxPbsAqwro3ieJP3u+kfLC+fqbJHxgoSbrMi4hx+SbfWslM039EkxzV0txQ?=
 =?us-ascii?Q?xjP8s7gkyyQiN+wWhy53QM79AYizCHWTaIvL4Haka0zFoKvfPre6SJMCWzGw?=
 =?us-ascii?Q?OV93MCm+Vsfrrk5uyJTPZtdkLlP8o0eOAwdob0ZKJnAT6SRoyxsnfe9UAy9i?=
 =?us-ascii?Q?rr6JwClJUsnibX0gGhep4odkS5V55nyt5/ABirX4tV5w/dCXO0He6NwNtGKc?=
 =?us-ascii?Q?Q+FGrOnnYUrLGFvbNNGaOCQxffzlww0KBn4H3FDon5mo5yYXebjEiCQ7QSYR?=
 =?us-ascii?Q?wb3F0NAuyVUFUoZdqp+/5iBL2FcKxtSJKyFBXhfMLtBR1W6pO1sojUdGD2ZV?=
 =?us-ascii?Q?5UfTXgcPtbLwmCTZFdo44wG1s7K/7xlpGgiRS3BrRp0wYELFpFbSmSV5wO6T?=
 =?us-ascii?Q?Zk4CTdXPKyeXbV6lGWGCopTPAMKaZ8ufdPHhST+OHr5BIkcgpo3Yvm9DVtT1?=
 =?us-ascii?Q?+DMVwCGeZK+3ukMnpzgI8ePfwtXRZYs5OqyJUs5mZBrqlo1ZEruAmcRKvmHK?=
 =?us-ascii?Q?tga11QPQQbb2osG8a15BMcVUS9t2HaWqmRtv5RPDmv1bAyO+eBAMRwgcLbP0?=
 =?us-ascii?Q?PUa+PifzfMtbYbVNITF96aYJAWHvWnQCcjWvReK8wVB2n9BGsp/8amvHt3OV?=
 =?us-ascii?Q?XR174uuEs5o6zw9ZUOTUXOA5oJemhsAzKkRofx8OSdIHPvcuMt0dA1dEPcbf?=
 =?us-ascii?Q?ElsbEyzDwpmybW2xdrwJtIOXilJnh20vUa9xOvRj4vuqP8XFGki554bzTT1o?=
 =?us-ascii?Q?fspAnrFQJeFo2Y/JJDwjLm3fNqHXT7Zy0ys9rfzAzt9M65Kvlfq0zyv6x0eq?=
 =?us-ascii?Q?nVmbek4e0QPL8BVzNzc249XS0dfRl8G7FZFU2GVdWfRohUjhT0uRg7y0wxm0?=
 =?us-ascii?Q?vUXix8xX17lbFRcxNZLKB1LhCkkZSEHDvdk9fl2AWTAwDXqc0a2zwnOdax16?=
 =?us-ascii?Q?58R/HAeZoBOf1yHBRCq9Legu3ekiF17zWsK2eTEcLmz/K1fZt67c52fuHhLU?=
 =?us-ascii?Q?N1TX3/MskY5kqoiSuma6ixUJRhm5amwTr7tSpT7dJmaR50GlrHkxht+dL3gk?=
 =?us-ascii?Q?Pt2b/6mOClTjvJz0w0eM4GjFX+suG520oJ5ZBu2WoJ2W9KWDULKx9nJMYbPY?=
 =?us-ascii?Q?2kvHC+VakXJk3OX8S8d6U88F7ImJ8YDVcR2GZY24nafKx3TxQP74Kcn80N/j?=
 =?us-ascii?Q?BziWSM43SaiDkYIEor0skMIbdE/nNf2Ak/SbWmmzQFwjoOcc/z4pc/AEAZSb?=
 =?us-ascii?Q?gJNmq0QwalH9flnM9vR1asQ9T4KTY8TMBspDLVAsIyZNzY8EsX+irhI+FPP+?=
 =?us-ascii?Q?KJ29ave+KhIkV4D8+n0/T9LwLiI095rtO1rjNBAQoMl8gbMLAmL0wBzxyK5A?=
 =?us-ascii?Q?09bwI8sm9sU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gQrw9AdrQuQtLmXZxBCUucbuTCwfLB3PIW+ASbKqRJnjP6mdm4iz/297HkHz?=
 =?us-ascii?Q?e6JxYooMff/VKKE3aPIKxTjscZtlP3zqwLkwXiMw/E4fhD/B6w9h224V+XBe?=
 =?us-ascii?Q?qpQ7ppGgp6YSOip1fBbzgX/fipXcTXbhaYsyxrGZpwoOm9sqYRryUeXF0BzP?=
 =?us-ascii?Q?9IPNTEX+8IbAV5PIwE99WS6SgyqbrZo06bDKj8XKfkyvKKRtBJnr5cupu6lZ?=
 =?us-ascii?Q?kKL+XGu+Aa8aWOWP+w+hA+y0YWrOvxNmIcDnpssfVff8z6J9GXkD0+KruG8o?=
 =?us-ascii?Q?zZ/cjlNUGsy2TvbQACwFxOil1/SMWjkBNCa2BdYjbHZoLmBn4MW9ZXazaD4q?=
 =?us-ascii?Q?lNigzbQdbCx7UsrSylb9311C98jOIBF4mRXWtbFAnUpCQZv4lTegsU2sBSzq?=
 =?us-ascii?Q?DlJ+Nw7Uf6YIaslxNhh4bBOgcCxEdfzEKHSOW6gaTt73TACOcU7zOwCoE8Gf?=
 =?us-ascii?Q?paQL9+qTuXq0Ew4QNu359wokoPz12kA7oOg1MitunxDpoOhXlymC0e238xzs?=
 =?us-ascii?Q?te++ZkCVZv881eICjmYZzsvvIXC0kLdRlc785PljhwWbapgaekIOOjxBAzPN?=
 =?us-ascii?Q?K5S1Yx2XlqR/bcwoUxfPCG2kCos7JO8aZ3nofXBj6TmylNpzBRfjAte3ujw6?=
 =?us-ascii?Q?WzJopXuQ7RfYwk0ePlkFfg/Ltky4zaN46CVFxj6NJNpsb0SZXhhsMf6odlfZ?=
 =?us-ascii?Q?SrlE5pWxubVT6gIPPpiPo+efYRf99RsTLEfA7JnSKpVvtELMwiFzSV1u76vy?=
 =?us-ascii?Q?3ONfyFHsNtUesVnK21QD684s0hmPQVjwE+euF6ZFIFcJMnQOy4F0vQqluCin?=
 =?us-ascii?Q?ZPkfhnBst12qoG7i+9aRB7CW38YofMnCKXWDPAGjaKHA9KapaSphfwk0xXMQ?=
 =?us-ascii?Q?lisvi/OMwvzJ5DtpdQdcMVX41qRIg3EiIXWLlZVtkUSNRFizLv9CXBH++B4p?=
 =?us-ascii?Q?wQBKbOLG8qNN40LGGDR2tDf8rmcYwcwr+f+biV4GMLOfJYVVHrv1/W7ew1Xa?=
 =?us-ascii?Q?y8yYvL222fW/0rSbJ1Myl1cp+xRlcPC7/53X9HTvq8ckEUr5mSJZjFE+p8Nl?=
 =?us-ascii?Q?iKdHhwYF4XnIQWH1G8ft8hyVxWDLOU99WkCcxWYfiwOZmYyCHlg7UoTuusTe?=
 =?us-ascii?Q?fYXpww/hY3fXnyXKaqLJo7egO4t3ruQjV8xYFmEsQ0ynB7QhJmrtwyIriJZh?=
 =?us-ascii?Q?vR6mRcwLYSL9uPizhGPWTO7iYkmGdDtn19qxa2/fLZxvSLhkQKAijqjQd61g?=
 =?us-ascii?Q?W7sPQiseeKb0n9vTBPVEj7aWMj4Z3nqEVBoXJDxJAeZq85UkDDxYKoYCCW6/?=
 =?us-ascii?Q?oeB0SX9qOHnfI02/0iYi9+cck36zLVo4MEq91Zr5Xmnk9Ml60mTdcUq0agqq?=
 =?us-ascii?Q?aT1wEEGnD/e9+8z6mrfuKSwmbkRw69iYsKr33uMYnvUfgAhHkLpDcJ6GCotv?=
 =?us-ascii?Q?630ZY5myr/55E00ScdfXhyoC6EeokkaU2t5U+jxJxCwBxy27nfQk1YbtLpmB?=
 =?us-ascii?Q?g1UCG2TwI5uDS3xc0yzek2EwPzWzP5y7sbMJRATijI5W7k+rnRpGkuey15Ig?=
 =?us-ascii?Q?0zgd9Iei15tbuSSWgnw09/XoZ7wGEwiKTYoCh9Rjj+1/fZFOqgzhQ7ixjm80?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mRlaP5sTp35fkc/lkLMWLUCLAhU6DDNrfw8noQZuwJS/h+7N1/dQaPxUShX6SOxfc4p209CdD+65j47i3x6A67XGPwghCHYeZ0p3nOM/iy1deDJlp6iGQUwKO3QxWQhSZ/WmEwFdAp/cp8nm43JoyBrm3EB5CuzpUeZKCTmYzFPdNvFq7D9Lsz92t+PAdNeEYDAjaXGMDx7QBWtYNmd7xavTDokW9Zl3CADYZ0IVPfpDVVKTxda5moKEYsyAEMav5HTGudOVKgDsFYolfLeEI838LfoMDD8nzHuq6k4grop6tXcxhf5bZM7BztETOqisztclbxGJ0L9NuEiVql9i6GGAoMNoRon2GE+sV4AiSKXpsN0zR+d+quskqIEa3uZEYWcYcgPaC/Yk6NPvZNQFKf+VctgOMlQWUz3qcJ4l7fDyexGC768IYyhGRpI9rRHGVgWS3vhBUjy53YkFpJcUt/nOU75C5KxGFh34wXaEiKGSpRkXyS8CiR4F8c2FOKYpMiiGo6JoQi6UbZNSJw1D8jXyGt2P6Nx0vMPMFtKYA8lnc1TcOmZmQGCyL5UPmB8IERCbbS28lc7fY8DYzJhc0f/8QVSmq+qr5ckng/pvH7Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b799dee6-52c7-4097-1939-08dda58aa072
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:14:57.3169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VAXn/aye9cBQIaGH8zDjZzpxkmVdJ3nUWSXQuCc4JcCjUXxqzDvYlE9laYcKZVdN+rLu7GzQzI7UPoLLZ09LjJT2en6lNvlTflNQvjMV7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-ORIG-GUID: okhwcynC5Fo6hGrX0eHPQtz1R0bcG2MD
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843d8e5 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=hMMMfiD2b1cN7yV8nEIA:9 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX1Werm4Vw4TgT lRk3BKptNDupL/d65KdJchah0IsTgnru0T4PNOZdOGxfyDmKizTyTnNZP+BnCEtMobghJxzzsV+ +WtKaTuZH6JQGD/F02xetzcs9Z1HZ95QGBCCK+HRvXoEbPW2X66oHwf/1OBbqfTEwzFQm5eUQ8c
 NoaYUbleboWaahLM0+2mmAT6q73a1DU/ENY4jDCCNwNYQ9sTb6+kgStDjTpg8AHiFURvZWDox++ MHvl0hg7y88/q1TlCE9E3faapDYkGiL8jcqQzAYNc69RoXqrHtiCValFw0LtHwT47Pf+Qs1jcv7 8ulcMuLqxXsuLpqj/JLpsdm+q5nxDWAEthzoyHBY3eiC7yRO58Lba967ht1ef6Jo2Q8npNAjIFC
 0Roajd/OeV3kKL0fSfWiTBJiaWgOdWv2Zc+Y7oJOiL7Zu9ysR4Dlb1oJ8q9QxukNZ+UitIdu
X-Proofpoint-GUID: okhwcynC5Fo6hGrX0eHPQtz1R0bcG2MD

Now that rawfbt has been integrated into the fbt provider, it no longer
needs to be in the list of providers to call populate() in.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.c | 1 -
 libdtrace/dt_provider.h | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 0c621197..1e2e844e 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -36,7 +36,6 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_lockstat,
 	&dt_proc,
 	&dt_profile,
-	&dt_rawfbt,
 	&dt_rawtp,
 	&dt_sched,
 	&dt_sdt,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 59a8d62e..2a3bba80 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -82,7 +82,6 @@ extern dt_provimpl_t dt_ip;
 extern dt_provimpl_t dt_lockstat;
 extern dt_provimpl_t dt_proc;
 extern dt_provimpl_t dt_profile;
-extern dt_provimpl_t dt_rawfbt;
 extern dt_provimpl_t dt_rawtp;
 extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
-- 
2.45.2

