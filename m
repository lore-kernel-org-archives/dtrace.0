Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188AF1EB36
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742241836; cv=fail; b=od0zZ+ljL6HVcfHUnsq/gCB4DNuMcpAnMkHf453zFVojwij7QkmHSK5w7FtPRF8jkV467mQBT8miAImw9jeriIILAjCzjqIQcqrWHuDCA8rm7l9wwYR4PQmJmZaHgkBbXxa+/F/EAc8ABbi1LxZ5+Vm8A9hMWNA99ZjarkevHCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742241836; c=relaxed/simple;
	bh=4PCYRFn2bC5l5VSGi6m2CCkHW2B3qZS7UPM9AYcMDAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L9cV0x0A70vRXc5Fvbzg7oWzN0nRJGRhyWtuKkWMoMrjWGnqCnpk6jFKY+kjFEWOTYYo8NDKt+KiOuemnXr8Mq42w0qMVlyv4p18NKfYfb1k8wrEj2xKZxKKHXNcXnXX0dAgIAP29O4et7kYP2JUMs6N0ejnSxqJ0ycCUTWAEtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KZkwa2SR; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iBo8j3/s reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KZkwa2SR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iBo8j3/s"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJfubK003003
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Xqr7OexVTNl1BQr4qqMux6HXg5Tta8yNdkj9K048+o8=; b=
	KZkwa2SR9Z/XaMmdHhl56JDqz0sLQ4foW1Ypt9Lc5jZ3MMVmM+n6XHUf9ogLTGGf
	G3E2TiKT0JdQYqDGJYF5aaVV1sKPPq6qFMnzQudy2ZpL9R9fjVn9aJ8uT/XV6e9U
	ombTIxV+zx1jdGHfyvUe3ooBKzgcn5v1AvOP58ew4Kbf08a1VtmpGsvs8dh0zhfJ
	T32DFdQs03Yjo1RIBmT7VhWyxdsuP0/fFlKl4AxQh+cTX2niR0ZFCh+V43A3wvgJ
	5HGB+NvFylmYAzCfl9FEU1jnxweSmA60b/UR2oGxOJfKhhYUgkB29XO/23udgdJX
	5rt8v0OiXAW9kHYduWnhEw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hfuu0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:03:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJ1sCo022416
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:03:52 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxc4nc17-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tE4rVX4tEuea01R31cjHKY00beBiGwAyzVkpu8BkjwPIEWPzuiKEpAYCRHhIhFraQxW137dzeILXH02wpCvY6EyCkVGa1VchdjXwFJBwcl99rtZ5oCz2Ia0uKEjSmjmA2/6dg7NeQ89otb0SADYh2UkzJyRUalZxqJd03sOekptEHX+aDIa8DvBmbYEsZbX8CBmNE48f1P4MxQ3+x4aEEUInayOB5y5l47RHJeVYu4+MKZVPV82OCgwG6PW50uM/kNR8Z9Kr1obW0TN4v0TGwbCtAyRpxGFZz3Xa9H7iO8YrW8AxMKbGmf0EE7MncmEwhCK4qGdKOgleamqkITosKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e2t4ZrZGNtKYWrkxirNuxXA+LJJNDR/htG1qgQDqwE=;
 b=BX0TZiu6KpsekItXejPIELwdwEySlfnwXg321GqPcFt3bymOHHHgsO6krfSWHMzKUoF4COvqQBAEEpWfPxaqHNf6hXjFxAQ5izseTuVkkLCMr2TwKIEv8CNlSC6mERyZ3qwHSFNuNgdkFZ7OkVNUlmSa5hJHf27ktI4gtSXXbA5bOgygCVweLq7Qj5Om6BL+ieYrUZjQoW/TGxHVcLbP/I1IIDZR+gH154jl9NxVNOrBg1R4/jKRK/xm3Cy/8y3WUXVL4NfWOK07bRo4mv98ORrL6dJ8dOzUSYAt5PmFLWHioMGBnULdgZ3y1APgJJRX3EVpES4bTRyuh/IG1r/9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e2t4ZrZGNtKYWrkxirNuxXA+LJJNDR/htG1qgQDqwE=;
 b=iBo8j3/svxG4iTFxHZfP/Xw2AjbI5X4O0d24zB+gJJvMo0TawO8ec2oBaU6FSBSCKhjxxhHzQLq7CyxO0Ex9NOaOuSQ+Xc72wBRepVLTpPBJf+Wlq5R54nW0Mh1KYpQ04Uhgy6ZA3AAabAcyuv72qhafe9UzwenKgPXaWXch8NA=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS7PR10MB7131.namprd10.prod.outlook.com (2603:10b6:8:e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 20:03:42 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 20:03:42 +0000
Date: Mon, 17 Mar 2025 16:03:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] error: report probe name on failed enabling error
Message-ID: <Z9iAHCiV6Sk/PrGY@oracle.com>
References: <e05e25319eb103bba488fab000c3c21b.kris.van.hees@oracle.com>
 <da946028-f3b4-89ef-92a8-9d46cac246f3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da946028-f3b4-89ef-92a8-9d46cac246f3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS7PR10MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: de73133f-4c54-44aa-fc8b-08dd658ed102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?2wZYkkk88cABUG4psL50ba5TjWE9dc5uXQt0IMeqOCIH0B2DBAg67gOW99?=
 =?iso-8859-1?Q?8hDpKeCrQerpPvB0Lc0OlQlYTaJVVkv92AICuhTVBbrnYeH0J8eudjxG9B?=
 =?iso-8859-1?Q?vXz9JhIKNolxLs13vUWhT+uTLBsrNVfwz+hAwt1fkyXmdbsHRPyYPfOqfk?=
 =?iso-8859-1?Q?5z1NfoE6lgOCRjZW0ljT3Rm5770iTt54RftRERcpYG5ruzbWEHPTwsfYO1?=
 =?iso-8859-1?Q?UtTlMURWFWBYTIFtimw8eEbAsYgwRvp9b2xxVUNo9aRzIUn3v+PdXhhhsS?=
 =?iso-8859-1?Q?u1X4mGfn0iCITArDqniPZh+bPkG+6geHuj5ywI8VXb0ExXEm9Qq2Ij1rkf?=
 =?iso-8859-1?Q?XiXq2q4PmDa1WPnd8ckHQodVhak24X6y9AQO9DOQrTiW9dS+hsblMP4EPM?=
 =?iso-8859-1?Q?q7RqGDTg+tjDMNWkQiNI8GrEtdkV0IAb9F1i0mAOxjO8zf08rUjmt0oXms?=
 =?iso-8859-1?Q?UAudCqIx81SN7ivAYmSaN6BAShuGf/JuJ76zaO9hp4kabkG+tf2Fiy2pAT?=
 =?iso-8859-1?Q?1Uu4IQls5sSytgEm96mgBEFwv4Ewn6GBCWLT7IHT16E6PMhpRwvs9M1zla?=
 =?iso-8859-1?Q?7FXgtFW3h8YIoZYL1T7pXd/zlWBEo0bONnKRfoHQHUd2WWX0PzEO679y+u?=
 =?iso-8859-1?Q?/XeSli6KSvMrYdlCFz1Na5WHyuQp04cbPxP/dTTgbEMmYR7zOMe75sVOWO?=
 =?iso-8859-1?Q?U6cVSUPPftqcgFmA8yrSr2SD0/JxL3iYaxyyQ4H47bM5UpLloi+nFd0Mue?=
 =?iso-8859-1?Q?Kvdgj6OUnryYpIaMkEdkZoH9NsYANlzgeO4FXn/226S9jUbtfI7Gn4fxMq?=
 =?iso-8859-1?Q?DJr1Ql9wTrpOkKUM4iJBqwuWm5Bms5yWXyKG12Omvds3yuvlDX95vF+Ckn?=
 =?iso-8859-1?Q?6zS98aSks3gsaC/ho7UMF9oxZbfhJV7AeP2wuLKXoVMJAhFrY0LY4EUkPe?=
 =?iso-8859-1?Q?pmdW7DcMBMiTnsPfR/+8FvJqeNtr+cj0jdBCVeXhngZNEEL6zgtmekw/JL?=
 =?iso-8859-1?Q?aD4LVqv57bHLIA0it7Odwgd0zhKcYmspGMZ8+KHOaUCiCAqx3OtefbmS6M?=
 =?iso-8859-1?Q?TT9C59YuogHxJHBaiB7XjJFFxJK2xurAknww1AynKhKoyKBJrMAcRFfp6H?=
 =?iso-8859-1?Q?8s8HFdBC6WYYzXnjECJsDpmq4sxogB1BPPW0jEtJPq1IIcubPfolJeb1Er?=
 =?iso-8859-1?Q?bDSNCXCQUaia/XQTTBW1EBEA+rH5QxK+OWtSlR8G/KD7hMiywgeSPMQO1m?=
 =?iso-8859-1?Q?8s2hBdZqHCFbBV0+ae1C0leUZ8jb7BfLAl/wwFeODX7HYY/pkspuft5PXy?=
 =?iso-8859-1?Q?ENcjcYk8YDDAI/kXS8rEMZ5oG63hqwmy8Gl4a6+1h755XB1YW6Qwcc4aJY?=
 =?iso-8859-1?Q?EHgnciUIhtHzonZVq4iThb2rxezNEGn/1G9x3mzpwMXq6ydNoiTqiU+vWo?=
 =?iso-8859-1?Q?24rrv7267WFhFwcO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?TvVtymfibzc0QKYs9DqLtL25brxhKGkWI8G7+AuRFNEdvibLCjpGbA4vKk?=
 =?iso-8859-1?Q?YjuVd2yGdzZLKEUNVlKHSdWcnOmHQJ7ex4X1qkPzrMqn8VUsCZRrgTf452?=
 =?iso-8859-1?Q?zbgrx5ZF6VBqj2TMY267eRU0NK/Xmc8ioFfhOE1PT8Gipv9YSB57zLmhHb?=
 =?iso-8859-1?Q?W/yTJfxMVWzsbjLIqbbaepCudwEwk8Kv35ScLM4h2X4wLwHPBHcD4NUuX1?=
 =?iso-8859-1?Q?a3ZkBdaQnMkh64Ffu6jKUmkP9Drh62f4sShK99KE8IE9OOBpCgDp1uAL6w?=
 =?iso-8859-1?Q?9gSiQl95fwOT/LzJBBKFwx8D7sUf7qewFoDvtBSKzOjBePcpIu1NGJHx5w?=
 =?iso-8859-1?Q?ZyN/xliOdJ5oGziHwSqGGToyFAcz7IhfeDhN2Zr7FVt2q0aFfhOGhGyceG?=
 =?iso-8859-1?Q?lslc+772ONMz5jQGgeeuotmHPnQ1QUeeoYIliDo8Geukm7pHZcl0+IFGuz?=
 =?iso-8859-1?Q?fMkbuVGVfblLdWzR2oSWEs5Zbg26+FylT/NtUwQCtzulvRQdZUX3lAAuUZ?=
 =?iso-8859-1?Q?09hRKcpp9uRDUypnLvoNVJ2OxRdSirFc+mCQaPHhDp0BWI4s4F5gBKE90v?=
 =?iso-8859-1?Q?CA31IrXzW8ctVbHdu1twVVwo7uycuiuIFxXsWTlukrCyWdOgXTT435WQI6?=
 =?iso-8859-1?Q?X+sqWWP6HazfmWM13Xh6AK6QvBo5qlKPkPl1faQ76dHEscrtUdhaK5rvzm?=
 =?iso-8859-1?Q?ST0UUxLPcVCfISR9OVmGgeD/5s5ywXKP60gApp4oHmrw3jt2GajO/SfjBq?=
 =?iso-8859-1?Q?+Ozor/6g2sywOcyXRmFZOAtuU2zIf6TsIN+0Lf6eQSYZGM7yftoiAVcGU/?=
 =?iso-8859-1?Q?QX53iMPLVAKi3m9Rrl2rk65VyXgwBE8iJp9j6OlNHshxVjEnDvYymT0epg?=
 =?iso-8859-1?Q?IFb7N+K+V1KN4evnl+cQBKgFzQNCXp6ej15bZm6eArg68aJc0Jlfdqgjiq?=
 =?iso-8859-1?Q?WK7UE5q9xuzcJDC3rZ33ATPpOiAnB1HkyZpqP61bljavxn7C26p0r3+qpK?=
 =?iso-8859-1?Q?QwKalkIry8VMkPSb/4VYwvPWvwaoEjitqHvVd96oUsC6fQILAa8OhEIWyf?=
 =?iso-8859-1?Q?8Zb0Mnx0PUOZn+N1OFE+sZZgURdrK0/cRVC8W+G/UBGxNWFPqfhiib+xSE?=
 =?iso-8859-1?Q?4nl3GNuZux2LErtBimolsMXmBsWVnk+Gqb2GZf+5lDvfRKUqmjE7wR1FtJ?=
 =?iso-8859-1?Q?HQovtsxsWCOzwj11Pnn2+/IbeOJkSXD5nr/DiEchW2XruiJKBMGAKcfyNc?=
 =?iso-8859-1?Q?CdvGtPArLiKZ+B2rt1qsAogS/RVhy70MAfxt7VdiFqGwNrVz3ZoCkpppaw?=
 =?iso-8859-1?Q?LgzT4z34fyKBx1WvlYZP5BYYfE/jG2KZNsU+yzQtzot/4Ri7m2ifD6JTeo?=
 =?iso-8859-1?Q?5efUg5q7LDMgostvtuf6ILzICbXa3+SM5Z9OeJDTDRQvccujVyVS28W1UZ?=
 =?iso-8859-1?Q?Wrem3jIlAqC/lRFg1uVyU71HMzzbRaVwGE/fidTQtNa0Tyf7eKKPbmaJpo?=
 =?iso-8859-1?Q?hpNZrlwXvHHZlk8+pBrACsQR7znQjB6P27/pfMBEclgPVViBPpj0+drw9s?=
 =?iso-8859-1?Q?OUOvVuWZ9xxguR6uzz6maCcFhywrj8o5S6vBReJJX526/YJm/QlPdTW90p?=
 =?iso-8859-1?Q?hI32axz4VeZp0ffx+F2K9Fp30B0sIVZxzRvP1hNkiA0lqrarbilAWYlw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9sB9+N5/hOdI2MG/UcL9gCejUME3ojWRnqTwHiQXSzRr0daur+BRc02HJY88xclk2mP0B6cTtQ5At7PNWwyCIutDzSoADaw1vVgSv1cXDEVBEli4z9E5PIHHVuT7EdCh+BHrBlDGUFq+TmpKnjUVMxgjwLBWXbNoydPAws6/9/TY5jtryuCTgC2X8ZNnqBBp0eWOkAekQX/YpSilSS4Z5yWzzqMyCxOWyWLz4V4Ld7zOyra9BpNKxTDhJIbaRBjZi6sSvXohiLUh3CpPGtDbPySruiXCsm+18LGjfxp7QAZ3zODijmQP6YjXpfhI3bL02DGIKO0e40pk3+eRp65QG2PITFfxkGLc65wzvsoYxJOssGQUx4KyrHjQ9mTT4Sz8sydFriOFTTIvsn/a25t7GUy5m745bzw0yOltsjIrSBAhhjtAWAvrStppcwh3qrJMJiwTrn05vL9hOPlBWmpa4NSfUl3sDiinhX8DYTtZfLKGIXOPRSOHA8cBLB09vJDPH6cj9tTd3Yhlm5JuDfuV7d3FzUzxC3k4Gc/f01Ff3d9fZb9WiQv7aONPIPy3OpweiCPBqfYKGhuj5ziw4nchRu41Ff6jYC1UR+YUYWOXTho=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de73133f-4c54-44aa-fc8b-08dd658ed102
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 20:03:42.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlpd5PjgRMs8I8Vrwl4X+RDNTl6PcCN6PHuCqYgLnJ8CYbxsJnS/m+NvvX+RJ8Zmd37r9GLyJVukfRp1OrsPmNXzK0rCbHjooipFu2JhMxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503170145
X-Proofpoint-GUID: --GdoPfKbveIHt2NSZ0aM1ySw75wSx7d
X-Proofpoint-ORIG-GUID: --GdoPfKbveIHt2NSZ0aM1ySw75wSx7d

On Mon, Mar 17, 2025 at 03:57:18PM -0400, Eugene Loh wrote:
> I don't 100% get our error reporting, but
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> A few things...
> 
> The various files need updated copyright years.

Good point.

> On 2/24/25 13:43, Kris Van Hees wrote:
> 
> I don't know if anyone else sees this, but this is the second patch in a few
> days that has gotten buried in my inbox due to a stale date.  (On Friday, I
> got one dated 1/24.)  Anyhow, I suppose I now know to look for such emails.

My fault - due to how I was sending the patches, it took the date stamp on the
actual patch and this one was written end of last month, but never sent because
I was still working on some other things and it wasn't needed yet.

Will avoid that in the future.

> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > +int
> > +dt_attach_error(dtrace_hdl_t *dtp, int rc, ...)
> > +{
> > +	va_list	ap, apc;
> > +	char	*fmt;
> 
> If you asprintf(&fmt), do you want a matching free() to prevent a memory
> leak?  (Clearly not a big deal, but...)
> and finally...

Good catch - fixed.

> > diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> > @@ -111,6 +111,8 @@ dtrace_errmsg(dtrace_hdl_t *dtp, int error)
> >   	if (error == EDT_COMPILER && dtp != NULL && dtp->dt_errmsg[0] != '\0')
> >   		str = dtp->dt_errmsg;
> > +	if (error == EDT_ENABLING_ERR && dtp != NULL && dtp->dt_errmsg[0] != '\0')
> > +		str = dtp->dt_errmsg;
> >   	else if (error == EDT_BPF && dtp != NULL && dtp->dt_errmsg[0] != '\0')
> >   		str = dtp->dt_errmsg;
> >   	else if (error == EDT_CTF && dtp != NULL && dtp->dt_ctferr != 0)
> 
> Should that be "else if"?  Otherwise, if error==EDT_COMPILER, you trigger
> both that clause and the later "else" clause.

Absolutely - fixed.
