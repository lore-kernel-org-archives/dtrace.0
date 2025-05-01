Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C32B9BF
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112105; cv=fail; b=PcD4ybwgmazDIn9y/Cf0dwT77qP+SUlk7QQAJlrvC1ytXYigfVRrxsoXXtNnA1r5uqtFkqAYX9ki4lCJrzd5WwDwTWl7FpoR5cBTaSd8lRjyxZsddWwYCj5LZlwBDOAIV0R97EtNHliEoa4QFH86XwT75m7u2U+9UrJ1mh/VHG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112105; c=relaxed/simple;
	bh=BniT+IoLa71DLa6m7kHUm4G4kry/MnPmiLAuv6w3qtE=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=aqcLsxk0nAx6+7xXAah/cESM1MyKXTELUPHGNaWQHAOHErwWiq5uneEW82nVdCOx1VmfnRKB8vq8lOw6YA7O53YJZddewDBZM+0plhsQkMWAtO83BBUJWqsrZMgVyCSuh8BpkKrGVoRzIsO4a87nJtiSUAHIjLnsnCtdwNPTgaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YH8986Lo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R72BIC8d; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YH8986Lo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R72BIC8d"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Eu8il013761
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=unbVSa+56lmG0eQiDvKdS2srKsS724WN9DL2qDol/+Y=; b=
	YH8986LouMVgdLcKEmi9JtaC0KKl5Jnkha0d8VTVbPeOxvbkY5h928EpnTnX6q+k
	W6PhOoKMcTz/7OMoaXbkwzJkcWNeYTNOw7rgnscnQ6iCa2rkuzctBAkaWVRY3UTh
	PlnhoF1dsLux3yxSOxVXaTNoWrKJBasaqC+0uqyM6rzb+qzvX47UjUhNw4RUc+3B
	8du03YYln7UTdpQwecb1tsg7IsKxFtlWo9iAyHefzBFm1Myig1XupRjis2m1+TRs
	b/1FOB9IppMC9fzAr0c4/MNOhSbRhnVSqg/dP0xgbFyRnVIWH5VJTUb91KL+JohH
	LgwDD7T17HjfnLCoHz8h5A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usk6wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541DFX2e001354
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:08:21 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013074.outbound.protection.outlook.com [40.93.6.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcmarp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL6ImA2FFSp/u4WtnhmEX3apEVxH3V65geXUVPiAWJCKEKRpxqy+zgYnKhg02GxqkT5aK6UgDoEg3BFVa6LBi8U2e7GWDzhzy7vgMEOOSX1Quj/l7XOLfxtAJio8jlAJVm6oSpi/EGVq+oR9Rd7Z7xjbWOEBPbidrMZEAgqHUzGinzc8xK/mxDKpGkEh+Z1mcmwZb93Qkp0eeBHFi7ng2qdL1sl8Gc9sMGW6jCU+WEINgjt/MOcWmvVqwEs1/NuNgTaxQedknE+LmB89fGGtBRXAV3yQW9xMUd1AiLzHoPfgSHEnMzMkBsAJ1E+K8fnE03rf94/TF6azR6Gq/7rQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unbVSa+56lmG0eQiDvKdS2srKsS724WN9DL2qDol/+Y=;
 b=AC0QG4/x3dP130/1KK/sfmY6Z6WgDC9F4oAm09DtAnoLNkFqbC/zl3a20hvhs35hTd2jCI8YsvIFQ/wsKOMq8HWI2XD0O1w7TcFZTXxb+B5Dyo9onquC4msWEytqFLnAGI01yKHz34p2KxqTktDpYVJ3z1TYcDwVNtyRdkr8LAJ7pOlc6JYU5pVvhMYXlNF7MoW9WV1Y5ixHHY+klDa6GMv2n+v2o12EzmHFe2nI2v7gWs1ovA2PMHceSVETUNeKSDqD2kYVKPX3ryRsEWe0MmC/YdX0wWDLdBa10kGiE+S5bTfGq7wO3z1LmA2l0Sw6tW5jUoFVPc5ECfhD+P75Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unbVSa+56lmG0eQiDvKdS2srKsS724WN9DL2qDol/+Y=;
 b=R72BIC8dx/mzcDilCUfL2TKYHD4efFBeijVTcD8xinmUpVGEeEr6c1qiguno7BLM7Qkfb4HNFBvZdrxQfv6n+lne8xI7+smzyL0/vSIs2W4zTKdiifyyLQ3/uJ2BlnsQJ7AoAhnweKO+85mVQCeuSkIQxqKl74XNTbXFuQjFM3Y=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by CYXPR10MB7922.namprd10.prod.outlook.com
 (2603:10b6:930:de::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 15:08:18 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:08:17 +0000
Date: Thu, 01 May 2025 11:08:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] provider: fix registering fbt and rawfbt twice
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Message-ID:
 <SJ5PPF7F7BBD994367C836098EA4820FC73C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|CYXPR10MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9b466c-79c7-4913-12c3-08dd88c200ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5n5cVk51my+Rb7SIAQm9taNWcDXTJi4QxM276tjst58fFnPI+GhiJ/ShmeEH?=
 =?us-ascii?Q?2DlU3iMhVHxRE2Xk8Tb8W/FSoFFg/e9vM09skg6uuTzeAjdI8Xspol78rbYx?=
 =?us-ascii?Q?6qbNWBX0XzuL3U0uFcdoXEfkqYFiDsLMyOcKaXy5YIWfNGlDm8qF9mtiO6iw?=
 =?us-ascii?Q?LlxxYtYXkjOOE8QnIHDpdGQ0PcD4f/2AwSp9C3wI6nxFtQAwdr9Mm0SgNPq+?=
 =?us-ascii?Q?lsv7SV0zd3DSpmtvpukb4noyVdafslRaBN/MfZvXJpIo0L8wGdJ+nXzWytjS?=
 =?us-ascii?Q?Ud7D6+vTvqA2SfaZGQ2fDfDcHg0xhMxnyFl5s11a+MRQtuty11WbjC8u/yif?=
 =?us-ascii?Q?tv0pl3hn2ANCVnVdXnGhfntB4KMfN4V/K5Xx92A+UEiLV/knPdiiQ2t9Z2/y?=
 =?us-ascii?Q?BbuG5pBj+apigL/O7fuobbxGgdwnIExxRgWN8D/5u05LYGY9jLFXWNovBe19?=
 =?us-ascii?Q?ELLz1V6bXosnQlS1G4g/6NpshkCyAtmuCUaj1iN7MIzTbeaJhaoLcbZPBlDZ?=
 =?us-ascii?Q?GpBZSr35LGexeY+lTkm4Nr/2WlW2eZb6Eh/0z3YVm8TKo/NC0T5CqGGniPPl?=
 =?us-ascii?Q?YUFYTZnFGEzYSi/2mLJ6k+5+pHIxlDb/A5J/Ges0sG4k4DRV+nkJ3g5Cy4tG?=
 =?us-ascii?Q?glTobYjnXY5aUABHeIJ/Pg5XOgFheEcn99hqSH4pTAkQDMqa1BrlUXDLw/2J?=
 =?us-ascii?Q?KRedyCmsghLOhQJAOB8aYQTWc97uaN2r6M/XOjJHoTtX15eTVRgShvw/BoWQ?=
 =?us-ascii?Q?dSWbqio8God+XS2O+3QFLjaCDkR/fvC+mUWXCCWcNdjib0teFaCayWpeN0bx?=
 =?us-ascii?Q?c7/iEoWG479OJRt0g0vKYDIGrGL4L2bNA57hnC51jwiDLoic5nuu70G2zCY5?=
 =?us-ascii?Q?HjuqxQaXN+vs8bnzkE4IeTA2AWd8izTh8Qv7n6zHjBdInKdeu9oLY2dLnogN?=
 =?us-ascii?Q?raQRkeZ5kh2/n+1VN2UzOjktYUAxL9xKIQJNXVhw0JPgj+jMkgXDACCfaHrP?=
 =?us-ascii?Q?TFow/sr8O/zX6HGEet59KIiFiCi/i4YG6S/URI6yD2ED4qfgHRIksHZNABZs?=
 =?us-ascii?Q?urbw9qOYWc4iXnc4fnaY3e+XxCwDu4YPe4y2Xc7NrKAchkSEMRLUE97upqxW?=
 =?us-ascii?Q?maBV+sU6TwrdkuzBeb9Fd/TFeF41fVg9uwpGyoJKO0TXUi4Anykn/xkui6ow?=
 =?us-ascii?Q?vdbYgromlginrNiJyLG74Bmb6h8DdNl/K55VHmM+sm4YPiey8SAZiwUM4Nst?=
 =?us-ascii?Q?gOkDKuI/GTOjmq/vSnwABgLbUW8D2BrcQYKQyp/UpRZ1QRl7JI2a5e9BxGYx?=
 =?us-ascii?Q?cohe/Ds0CrcIyfZ/oPsDgbENjPK1KSChIDZqisx8qRYOVUL5E5VCiaNVBC/C?=
 =?us-ascii?Q?8dUsP5i21tQNx7+Klc6z7uyfxAEoxrbYC4STu8+92DCbZS/9E2muNyA0Nwyz?=
 =?us-ascii?Q?+O+7NHK13Q4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R6xVBEESxCeE8oYW9cZRGuJV5o351Mpo7Tpw9cbOxGDF60namE10TOtZtfFR?=
 =?us-ascii?Q?BBXW3iZil688toXmuvsLT3UAKwKPjp+f+apFTvGr+3wpGpvlgJ1Bjr6glKvu?=
 =?us-ascii?Q?KMMAi+5cbFw3yAoKdrgKVsRtCysIOlESG4nVFp8sQJgWS8ZfiAhlah+pJqGe?=
 =?us-ascii?Q?V/cAWhn+34DGapzSIWh71tvtXc0pvD+oajBKkWm6il2eeHJOIjAaPlZDJPOH?=
 =?us-ascii?Q?Yn758B7cn7Q1grhDG4tmToJCL/Lu5ZQhhagYvrKSXFqtjtwbAHdUBkY/FCOz?=
 =?us-ascii?Q?GDZi79TnTm6MxkvZ7VBRw+AY4KNYFrjjKu61YPlFaHEVZNXyBRuDcyXRQUBT?=
 =?us-ascii?Q?xwSL5mB1p4zT7fOxVkuAUuwhxctjnD2T5kK+k8ByvnmDi5D1l6c8TjlTqDPH?=
 =?us-ascii?Q?fiHeHicb5WPbytVWrqnhgG2mNvwBtsdsgKk/+bA+4WntJdEVkGwNE8ZWUhV6?=
 =?us-ascii?Q?J7MAvRhpSJd4yl5AOe0f7EV9DHMACtrwea5gnYtNs1TlcMevlNOTbZPfnI6J?=
 =?us-ascii?Q?0nQDnY7mgeiPdUqKIjZU8dIehhzQ19pDGEq4a/zb2Jc6ONjT0PBe4IfmAXO4?=
 =?us-ascii?Q?SNWMXyI0sBMauMyxuL1hzdODD6QiH1VgVWc/KAyMqLB/ysWuAyBeFdK5PAH+?=
 =?us-ascii?Q?xqBzV6dhnjfghPOqxAp3Gaz/G3UuBAtzVh+FTI3cDS63P89QuB72Lo28feaU?=
 =?us-ascii?Q?xru1INsfesadaAbvwQBHfitVrb+ob+o285QIkZghe1pGrY7Wpm1LW0uxeYB5?=
 =?us-ascii?Q?lgMD28cpvn+11GwdfZk9fDPrFmuXmL8QFdt5+FQiVtTiQ5rnv24CWEgxUBER?=
 =?us-ascii?Q?wnkP+BK+BxpXaIU+Jkhv33eKiEtcS4QEcOCz5gKIQwJlWHKqgRvkG/BWXNiN?=
 =?us-ascii?Q?QdWLuWGKsYSRN8jri/mVICdV1WNr038Oc4zFQOJFhwLFxR+M9f+piakE2e/t?=
 =?us-ascii?Q?NbW+B9cNSQWkme4ZG0XZphdGrzQ6e68GEZ2DQrz0foenuhEDHmlnOY/NzgwU?=
 =?us-ascii?Q?Gk5UrVa30VID//FLtya+VIgTujElz04GxUYCnIuLm3eK6Z6C+zPIXgs3dQJC?=
 =?us-ascii?Q?Cld0Sz8P7gUSIWsfAwZCcpa8dLzjGNma7ijBiNKjXrmYA+tJ74Be86NwLlry?=
 =?us-ascii?Q?xJ5MEdMvM4OFCIBsHb+nRoU74u6ht1KcTT3lTXOyBB2DhK+tMGk5kw7eBF3a?=
 =?us-ascii?Q?l7qV3540PNKwU5RfZU2IwB+vLUf7XEKr0zRNSZpQzhq7iTMK0gbUGB5YDVXB?=
 =?us-ascii?Q?cs+HGTtyMrUk2zSVreeH2muRk7Hm77GPN36ExPMwJFMT6u+7i5E+ZGcW+6i6?=
 =?us-ascii?Q?4KbnXEaA418V5noPWWjwY/fuVbR7qcIYGcMkDV6KYewNLH2S2xS482fGBf6G?=
 =?us-ascii?Q?B20yKy7WFK83fyc8iOg0Rn9HUPL7iz/WW+D4+i/xHLdxyOd5cFWNBRT/7cdy?=
 =?us-ascii?Q?COuaC9pzozcoedpfFFx0TR+RreRTEiE1VXosRUHFpBt0TEPxiWCPR3pcIAP2?=
 =?us-ascii?Q?yNrxle1/mbUBucOrXTi9BITFxYZp40gfKt51C9k0ab9L5rgOKQ/hl7vK0gC4?=
 =?us-ascii?Q?IREoSJW/GVoGmzhv+gW2IMdNyI/RhLZ14N1/+JTV3rc9vvOQVI+ouL/aYhjv?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	08yENHfnCHXjGc+FakXeNRH+nqhursI3F/A8ZiSuTlfjbIlDLrV9OPVJ+yOQEJcbfC1gGwjeA4Sle12nhJiSB/AqOlPdbWnybheaDNBKohv2LhS+69RCM3GaDLMSxJf8kPfpTQkHTNj2XDZTe8PDK1i+SLtwDglP+qZBxIjFFnbgLkW4xY9/hVkdgzYA2A/mmMghuQ5gAG8qzJMN8NmN7Azz/tlg9joJ4StwAfAXlu29HwY3XGCOY3RgO4tKC105x0WHCdQQtYtuNEgEEb+p3xE7DLweKFTPr0cl8KCJEZyCX7HeVU4LWHAgN6J6ifvSPh3ZHkH2mI74iDLVpWIgbt0SAal7M6H8JtX6munnBEZ6TSelhOwlMfN9kIA4g0g/YCzT32zj09gSYFwsS4eB7mQRXzcln951g9/947rrPzqTvnRwMtpCWvZ8fEI0/f0fMMx1xJgfY+kaYKXuUMqXvi2DWMxtwfIJrSwiipm0itsVzXkUmGbN1RE/hkh9xTcQnponGELBAjIPLqPYlCFbVhumUI7ZE/wyxEhh0b6oDNaGa+cX+uTdLFj+rktaRo7ULElwglhqXciVBMahLcgMAxhSdtidiGrXF1avWTGd16c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9b466c-79c7-4913-12c3-08dd88c200ca
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:08:17.6639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5rHL+EwUmBY+DWN+Hdlbm7eewrqc+W4YaXcDVw/Z//VEGtMS2fJCrS2tJgLcOFb4PH/qjkv2i4HLxnubBniTtKO2OZZTtlmb6m7iJsOwpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7922
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010114
X-Proofpoint-ORIG-GUID: E0NBfBvI_r4oILOE3tQNB_xJk1okFuU0
X-Proofpoint-GUID: E0NBfBvI_r4oILOE3tQNB_xJk1okFuU0
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=68138e66 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zDgssQhmzceeYGd1mG8A:9 cc=ntf awl=host:13129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExNCBTYWx0ZWRfXzjCbzCqVS8wM pXDGQMu0L3k5VsDRk/+ZryLhOayv0mWwiGzzP5Sk1p9K1oLGuWRrEaHCBaQXA8piaA+4Zh27bqV Qp7XrbhpCJ/yUjZyMy56/ZnRaOB330lJYlq0cUa+WsZwJTcc2s8FDeR27pzqrfM+EBEuUf+p8s2
 5sBQ3Sd/yUo/IG4NmKBVzBZaiqa3Jc+91YHOsVO/0NPzYkcjMCVZolVj2WSpT7nRslAucIuTySq S8aAx5PtVlH4fYxs3wVKrdFR2abnLjzVE+NFbJvdYpTZkzv7rsCV83MIc2Yb0qyWhhB3n9yyVw4 1SZBH5DCMxr50jin/xWnLoQ1AhXyGIMQR1T8trR8K0LWKitSYrmPHC6u4/LTdN7AVoQv1H3aOpS
 GuUA/7R6qqbLbtCfk8WYss6fNddCNp5XIrebMKczI2NdSiJ44YBQ1T93DmoLpG9VXB14sU7R

Now that rawfbt has been integrated into the fbt provider, it no longer
needs to be in the list of providers to call populate() in.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_provider.c | 1 -
 1 file changed, 1 deletion(-)

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
-- 
2.42.0

