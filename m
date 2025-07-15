Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422F2D6632
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575737; cv=fail; b=MvEQlu1sW9SB5TfyM6R/XiYpJM/ewR26PnCKjCzOYrkaq2xDjht7by4ZECqM/XBwPVLKRJv80owONBFp16sPPInJoyOA/3YAl5cKDxqjN+ceprJ74s5oOC5Hr+7wCFi0kzQH5eppVm/B0YvdOSxq7Z4GNm4iKi9k0O6JoSarqSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575737; c=relaxed/simple;
	bh=upw5QCELG0fTIslPyEwfhXHOR1QNp0XyCrEgPQF+9/I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=bxlrduQQPLpVUQj/lNh+Hkp+kVxZ8BoOgsSO1axERaEsvZgI5nErNTTmx/jGtXLhAaMBqCEWRD7A2Pef0b1CDufjcg44DHDhOelU2kamyjXmQczsmw0n3h2sk5Dn6Aok5QckFIo0kwEyKQbmeWIFVUoeGxneSWLjTRm0zN20bI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UVCoNNyk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YDAdE1dm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UVCoNNyk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YDAdE1dm"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9YsUu030090
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ldQCmvoZYYVq3GrIht
	crn4eZy3hWoXB1s0ip3Gjb4ow=; b=UVCoNNykRtxlVCcrw3jhgOjwk4dzteCfr9
	jr1qpXpc//3Xnk9XKuXNtX1LCYkRjlohJsoS9BgjGrVCI+gWSvDmIgiuOoYs+U46
	lPiAThXQYiDoscN1Yy5o/PhRsBYnsXUcCBP1WOAg43NzxCW4B1a1hjowaCOWFCf6
	/D3Ok4b6iRoo45weDfsMhZBGqYgrA3nE3roNdJtltc/kosrDLLN9+p6enziL8ewF
	aFzQjixh8a550AFBptuArvnMU7ngdkB8XET5NENas1S1iAF864Nsvhitdr08J6UH
	wTSUd6qeTuV6+IiB5P730fUu7pwOIN4GdgPfZj+sh5uovsEOO3SA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujr0xae4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:35:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8Ro0J013788
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:35:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue599yfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhnL8u59VFXGlfsbEyctl8rTbRPgwgL4gBzVwSded0494xhBc87rcX4Vaj4OXNbfWivSxvg/OtzbqsLvGiAMdCivMMH6QYM2pLdOm/Gz3Z8VLOYuAzBgb04d7yYXqEQxVQva44iJ3cLJ4gGw2lsXFcE1lSJUZfr7AjU9AjSfdSuuTFMIE5f5h2hqKN5Q/9g7QV4Pdps+EbwcWeF82RLr1OogoxOPSfG/5oBeWfhglHSyMdIEzEbt5BVWBF/SN+FbO0uEz0fOdeB0ysBv3k1y9bgfCbeheIqO3ZkzfifcImvQarrt+1mFwBAsawVY1x2iBiJlnAXvqlJMRStCp+r3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldQCmvoZYYVq3GrIhtcrn4eZy3hWoXB1s0ip3Gjb4ow=;
 b=IltEKbWyK2kaOLEYwpQ7RAGKFD4kYUz44paqG+y3e0GNILLjGAPGB3KL7SLst3Lym95CrYk5argZLW1l7Rcdk0DGSPxnn0SH9nP0i1vp2+8sZhGNkVge0wt6kpOMIBXddNuuBN0KToVIMYFexNjva4y2t0iOFgw4sORGvgGSm2220yT+nn5Pf/GUFd99ZIsS2EAiYEiNi1mD9wArIuPTJDX8xnoXy1nd8LfjgJFC5p6v4sF1w34evkwLdHIYJyCAm8ex67Vs4sErga0u544FCg0lw7TNGPgb0zol1GuWK4kf98/2E8Q9JeUizbZ+B5iUUO6C6OfjntwAJjxVdcpt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldQCmvoZYYVq3GrIhtcrn4eZy3hWoXB1s0ip3Gjb4ow=;
 b=YDAdE1dmXu95Vp6jt6gFher+HD8F1izAWPUzQd0Ch5mFeYAdrWiPDrDARFZQtsLEK2Evld1E8iLFSvy0bOeDVmSUEottre0MB3SoXfkvA0+thCd3k9ZPIojGavQrOYVtNUdChXtUMGcYFWW9MYYCKxd+bDa2it+SzUrRHlkcK5E=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB5921.namprd10.prod.outlook.com (2603:10b6:208:3d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 10:35:25 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:35:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] provider, cg: add reject_clasue() callback
References: <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: the prosecution rests its case.
Date: Tue, 15 Jul 2025 11:35:23 +0100
In-Reply-To: <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 15 Jul 2025 01:48:10 -0400")
Message-ID: <87cya1wxlg.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0002.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: c8858fc0-6ced-4137-abd6-08ddc38b4f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NbtayCQJCIpzZoDmdeEaGrrzx5R3wBKmskPikPSZ9+AW6xjc5BA+mQeiqhTI?=
 =?us-ascii?Q?yKDYppuh+BYXryEg/FRKPTke594XRSNf3uuoiL1sb+Fy+B0Ks7fMUFEx811J?=
 =?us-ascii?Q?lIbIaahcV3GiPB5RY6tZ9fLKGxn0Y0iBtGwcvSj1oNaPRdXf31cLeTxPuZVn?=
 =?us-ascii?Q?sqquYHnQaMXcAwnXCv54kZtBqosK4+FZD09dn88ARHUPFG6qqT+TLA8EWGbM?=
 =?us-ascii?Q?C0jqNDoFAGKy8NHreg3vVSupv2mG1Ys6r3ozgKHkZB9OI9JI7nW0V9f0V0Xf?=
 =?us-ascii?Q?mJUD2YKgrymxstC6fIfX7veqomiaBmqP2IxMUjFuIk4MF+jC1uk/JG1ndE/j?=
 =?us-ascii?Q?rLzQoxSul0y/w8Cb8yZd1IUFsieNVIF5kGR6S5iaQm9MKicg/EgiUmr84Dvv?=
 =?us-ascii?Q?9zhf2OnskRYWmR8ZY6vTG03J3e0kpO035ykqyLm0jrbhjNlIbUz87Rxh+M5E?=
 =?us-ascii?Q?s3GnaP5GpPM30GULsRckIV0sIRCKRLIewDifijrhQvi6NXF8tt+/8lOBncqV?=
 =?us-ascii?Q?KYoPvQL9GuKGthin10n3X4PduHoHDSmVoUDiMEbPe4jpUA3qCB/NCITIGFGe?=
 =?us-ascii?Q?yZybx+RfFpuWIRA5C8+8ahuAJa/8H/BuEzJEadKhz9c8vbWhpMYIinSkU+od?=
 =?us-ascii?Q?2KHShQ9E69yChHYZYUHP3/JXbLcEP4P+OM5pfYYt1ylO54g+6X724D583QLz?=
 =?us-ascii?Q?HgeBDeZdWQlbtbkAulgp5BkROjQ1D7ETZju+k1G3N5BkIzy57gY5dFc6aSTw?=
 =?us-ascii?Q?Koh/zZQhazdzKULN/T380Li5BuYAAgHnBtSwtbyphKd4aJNpe29hdbOADZJl?=
 =?us-ascii?Q?kYoOG7GXfdPfIXP2+Ltp7APVyi06QwztxLsM/n1fiwsvWbI/6cjKatsOzP1Q?=
 =?us-ascii?Q?/K4nJLyooYjrY+aFQ+jLroWUiS3hzJQuBJqcIa3TBHcCDx9NiBvabi66J/TK?=
 =?us-ascii?Q?88epFhvQ5dZmtDAi3z7vwOHhEVBZt3Whl3xEghMbgBAjScO5QAhqX+dLwo4E?=
 =?us-ascii?Q?pARqMN3x7Jb/6jlbE2Gdx6spRwAcq+XGvWnT1Ol0kShIlApu9EDp9+hmGFzN?=
 =?us-ascii?Q?X1EqdoE28HvqpeuUaYMQ3uxn3ScQPFucf/2IKfJ+nNQJA+RTvYJxtivNm03u?=
 =?us-ascii?Q?G/sRikuuyVRWWQU9T23bfBfy0uJ+LUxVUzdkFNMNZ8QDVzER5zw3FGEpKYEh?=
 =?us-ascii?Q?4lHHsHNsm8FCJgCWtvmEWcHWAnucvrAUhYAvdtkrYDir8NRSWI2gryD8D7Dz?=
 =?us-ascii?Q?imBU/jwS8Xjlci1ZJNpQRhsH/+noBew77BZz/98VBC11l8U8aswv7c9hpwzp?=
 =?us-ascii?Q?8rWMPJYJGPDRKGlAZuUp6fEVQ8ZhuUUDxUqSQmLAqEYKcDhFnHvN4i/yjyMg?=
 =?us-ascii?Q?EiXaxcmBo2ApYLXToEXWHBwoCTw6fImbU2KQ7O5cScuPE9eyjBReBb7yrmvz?=
 =?us-ascii?Q?Nv2Q2Dzs0AU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?46DtK/k1kqVjLy/5C5xDhsZ1IEWKoU+OzBA8A4anEGzmJFIjcb1ciMrqagsU?=
 =?us-ascii?Q?V4xcChMwgBB8RG1JJEkkybSz7/LX4Whq04venhoVYO7h997b8ykZdLl204xK?=
 =?us-ascii?Q?lrOg51Zi/HU7usHfuBM8oB3zTYToTYeFLpI1FZaO71mQqtB9s5YN+Q7gyEJU?=
 =?us-ascii?Q?fpPdsCc/rXC3JYVW6PjXQIr8eBGWXSj9bs5mwEm2RTUKS96TnOwg4STa89Mc?=
 =?us-ascii?Q?l4W/Go6HX3g7FA6yHajRkXmLrl9DJKBEEUrp4aJbYpxPQTSL9AbOLP8H8XKB?=
 =?us-ascii?Q?Sm+OyhXyZ5xEZyvpjE1PPPVrUILo7c1H0buIY6TpU/vp8Y9gc1IvYXfTYpR0?=
 =?us-ascii?Q?hCW19Mf5TkvI8pGdZOS5Nd/fQU5HW5zpN4tBnajv2w6DxPSTdH7HTMDAJluD?=
 =?us-ascii?Q?OL1elK0koTndErJQZY1iBspmvyen02Ufvp2ihsyIf6T7mtBMeZNgd5Nbaxjc?=
 =?us-ascii?Q?VX7OUOaFPz5YxboVSI/cFuxPz0KezJiDl1HtQ0e/DZSFySWtxH4TkR+Rq7VH?=
 =?us-ascii?Q?AOIt5C4bY1POkb8oceURYQX40xc9V7KbCWV+jBhhDrCukwPsekJoVSP05e7K?=
 =?us-ascii?Q?ksxxTog51jsYOa+yHfP6t6Bm0YaNWS62r6y8bdMTwoqig26YVEBwHnPkPiYo?=
 =?us-ascii?Q?I6nw/S33cwg96vc5mcScbin3CIHTmNtkRhnhDjnwFefIDWYoKfCYARFtC5rV?=
 =?us-ascii?Q?gb8m/Qx0+cYTRzBg8OqZYG8JuECy2uvMyFiHVnk0XwPac5eG+mvXiLDZD0w1?=
 =?us-ascii?Q?CvZwaYriLk+kAAb5nr6yGjzamQFnI/gy4lBfInen8eRowLWJ0j8BHSIe+89H?=
 =?us-ascii?Q?FaCft0qusU2ERkLjlJ/8pEBx8z07+vzmR/A9lDIRtlduALCUXiW/BnOmzH9k?=
 =?us-ascii?Q?cfwYNVauqeUTt0OD3Ejebf7RK05RJ98tHVNAYBUtfxJebbzt8f5jaVDxL6b2?=
 =?us-ascii?Q?fAa3zoVSxjK6Rg4MdpL76FTHbElWdRgkMUNuTZZK2P/2gTlrFuPT4CU/xEui?=
 =?us-ascii?Q?FAidJTcGtNZSP9pEdf9IOLnKRvJCfpVlfnsYeW0fi2fpw55GP2btXbI5zMyZ?=
 =?us-ascii?Q?BlKpytUpi6TDCgSFq3a67XZjRoxXOTiOeHNfsQc3ltPb52g4yZeyo9dw2c6L?=
 =?us-ascii?Q?P+7V2kAGqrrEQhgE94UxwxrHYMJk6oQy9HyLi7/+OwyPMElsKZJXPpOweBvF?=
 =?us-ascii?Q?MFQJUcqp/vXFsCHtfasKSfMHI5BGuNC6d4F7K4rSQUL2Nde0jjDJuejSIXhx?=
 =?us-ascii?Q?2T3SJaIPzHjZtSNnUMbos3T7LRyDc4GJon+NNJm2N+ukWizfQogaxV4fuWnS?=
 =?us-ascii?Q?Kpn9u7+6VM4fqrI21cFh6h39CYvDVAwpnmZfARvPozojTi3eWyIo0Yd9l+ta?=
 =?us-ascii?Q?EUV8oWPWnkphdQ8fEmkERJzm8Yc3NqrZw3a+HZZAhstw+R1APEj90i+yBzgp?=
 =?us-ascii?Q?hmTMxWnsj1ess9O3MneRx6AUKIBlbWLOXrxp9DJtFL4C4Ig03Yf6TBqHZw7u?=
 =?us-ascii?Q?tab1zj//rbCUNegIwaNG4pIEKRZT8nyLQs52a2P8XIrYINpOzqw7LAzw55F8?=
 =?us-ascii?Q?8pjpUHPgBlJK1VIRl/xPUKL4FzFd7dmG1dQkUEDawVtty3RtcyQ87YLk6C6d?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uE8xC9dCBczOqHQAHA+WckFiWtlVa9LyrrRKhok9RZwu6EQJo1Y0+TCUsXLT1Bc3kxcvlTd2wUhreT1q69a2TqAJkqAfz1imOdsiHKTD8lEJo4wwofBZVaFVupfC3U4AaRiSGE+v8jbSkqM9CLbbupQfcg3pMet4TliQEP5lhHDz08kU8kYazKpmJiqWY3Iwts8qbT/oVdSeJt7/iH3g0tqHv5SMdZOySf9adZfWXjozZX+4Il6CRGZUP1TRW8XSzT0XnCPsCD753xCKXV7XZHTqw+sYxQ/67uGKD76Ogjt2CORqpYPw5w/RRT02f8o34WhVGi3fMUFyqmbzpuJTnOOj3ze6FhuYSIZk+e4KRKQKguJ8veS0HgnSstlFELRtQ3V8qGB63KLlHIDnmDcBJhZ5RBxbCtLMhaCSTIF9QU4aBZhk/IAGBr6KL3ZvlKOhezQoOmGdYSJnubENMROn0E/B8+YXi00lKLD3zWigzcVoc9K54W2RFgg4867Xe0l21ensRxr3RqnWNq9JjFiJX/cDa0VJ891tcVaOhrV4kK2xJKG4zuInteErdhgYdGd38lHaopIf6/qiNtsFHUM83DC6EA0y/pEwK0N/aLbY50M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8858fc0-6ced-4137-abd6-08ddc38b4f0e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:35:25.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xB35MW7hhnvexaoIvFTw5wAZQh8NQezoMZrRWlcUhafGEa57hKYvUCiTfDzeD7amJl5z9EYfcnFm3tU8aJ1A3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5921
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150096
X-Authority-Analysis: v=2.4 cv=d9T1yQjE c=1 sm=1 tr=0 ts=68762ef6 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MAkJLcnNp5H3FZjfsRkA:9 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: nCi6Xhcwbk0K7TnJYCvh6Hroz6ZBJCas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5NSBTYWx0ZWRfX/Ai4z1dZ1BOe bNMw/WwrTX7IdbrWJAEU2DBHrcjLpbi4epHtublixRxWQpiUn/jOidRSG1dzge988zGvrOZsyMY BiqfA74cICxtBdYZvSE4byMb62t73QNspVMtAuWDrxb3Z/pF4BTbxLzhCZ8mSlta0mKDvCRUZhq
 e1qfT+EMkx3VGLCZYfZ/qT88LO7rklEDL4Xy+Oi2ihu9kPVy11fb3z3GNH3Cb9AUyJcMFUAGpCP oaymb6/MfJTWwCF7PFPCBlufwrrzCvw7axAF3xW0Yau9nslp1qHIW7l7KqHYRdmIKusn//f5Z0V zSG6Z/9X4E6neoxyywjAl4KJWfxE9Jxds+6ORVQ8zV1ZPNjfn+Hl9IW/3QIKDEov0dV6vDODf/V
 9rsHerh7l7m2ePlXYmf65g6TpwSGbRQZ+U3nYlQrVHMqSkUuKXqEiDvDj7gmC0H8DRjFgoG4
X-Proofpoint-GUID: nCi6Xhcwbk0K7TnJYCvh6Hroz6ZBJCas

On 15 Jul 2025, Kris Van Hees spake thusly:

> Future providers will require functionality to determine whether a
> clause for one of its probes needs to be rejected for some reason.
> 
> Since the callback is invoked during trampoline creation, rejection
> must result in a compilation error.  The callback is responsible for
> this.  If it returns, the clause is accepted.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo the comment nit below.

> +	/*
> +	 * Ensure the clause is valid for the probe.  Call the reject_clause()
> +	 * hook if defined, otherwise apply default checks.  Rejection of the
> +	 * clause must be reported as a compilation error.
> +	 */
> +	if (prp->prov->impl->reject_clause != NULL)
> +		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);

This change applies default checks *and* the reject_clause() checks, if
any, not one or the other.

-- 
NULL && (void)
