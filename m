Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D927711
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721925980; cv=fail; b=TV7G+ew1CuRQkPqC22y5/BtvKS4WiGIkkYQ/YxQ876CbK8thJNyEeXVtYmg95RSm92bAA6eKN5rMNj7pl4hXg/4Ukmtxvg0P1WUPIZzAsgcf93XwkkNOBhaqJEytshzd/iwrPtrBjBs9fqaYpQbDt9DSmrfxSPFYmkLLeMZWAjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721925980; c=relaxed/simple;
	bh=5KecXFTA1yQlrwvuKg6vchoa7Sauted3o3PbLPKDEVo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=kB73exdNHCFK/dVHklIOH/lbX/M7RnZkKLqLmrU58/WTszhnYVlvl026NF7rp+jJm6V5huXkUoFyjRkGWb7g98jfsh4L2JrNFSlDeHO/bUl8JM05jbbx105S1l27V5OhP3ehiEp5buE9YMZed5LtLGyrLvAzBJDYIivhTVkDkZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sbc7Fsb7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bWkZ2iRQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sbc7Fsb7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bWkZ2iRQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PG6ABx009075
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=gVil768re8GFrqcVrW1N9ahTjwQI3emOGUOQPEtFslI=; b=
	Sbc7Fsb7wdjyVB0yz76OszazNzZjAnDidpMbngFSCpGV0f0CYyj2O8pe/XBSHyqR
	wzZqzGXm0oCqf/qQECAxV7eoI/2Q8pas3YqU02eX1FJyO+WUEX2GexRNNGGXZb7k
	OE1rfYlHrMd18lKIS1OXdK7FyoLIa29CzteG2b9XgH/97EISCQd/0Slz4CUP7WpR
	D/uQnmJon3rO+xmxUP6Bn+2DVZxQlrNNoPL/krQvS/B3rv6gMP9WaORTfG4Bn70q
	Mo5AI7dtpzwGUL+Ti33GLQQ7hPWByqFdU514UhuA1tDtI016+uiPtf9E/3kFfqrA
	irjfEiHwDy6tPOrE/BZB9Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxpm4cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:46:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46PG7k9T038970
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:46:16 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29ubfn5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyujZBo/sUfuJfxJzuemlwr7WeK93cDgHTnheq6n5Z1+qMeRnWpO3bl3MHzm7jJmxp5rgVoT/EoCZp62AJVO5YAI7dXBvwOKXmvU5WLMevUijKcIn7H2/ENb2UI0nIRfTumOr+4gCas8Fc/IZ4BiBZBMGLLl4zJQ3TChSHhYaO1f9NCzF2FndX6dC2bnrTE065OChlqKEISIdWUjQkv+LHd+ot4C9WWaw9MT4O5d/KZKgFPR63ITA0W9BZ+/hp4ALL3ok4EX3Y+WrZp0s2GU3/KFBVBApaii4fqQrZPhM6ya6WAhENPwBXLX0npSjkiJkcp/NhfHcttqqmUiOS7DIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVil768re8GFrqcVrW1N9ahTjwQI3emOGUOQPEtFslI=;
 b=CnaiDxqXm+p4FJ2MGmv+DoCg+hYpTLlVJTxbD73EXeyoN8isJHeVCOwRRYNr+lbpVUPgMmrSV1TVs3T/jXZHMCdWcKqGfJaX3aG0mYVzo/mhkhFneXhwbtI73+6EutLMs92pW0QG2kJd8nZI2NQxTelZ1Ph3XfcwpokEWGhHmwfqQJA3obzkJih+LWjfs9NBdUnsQXpMj6mGs8hJFX0EAgLB7SSCbO6jPFgQST8YnMRr1aj36xb0KnkDiSUjMO7OcT/+cmFS1diMk5aaJYjAv+IyryZAIfLxCXEorS21tO2DnO21a8ZbLPoOwwagkZV3OdQ5CXWsx7tk1AvsS5QuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVil768re8GFrqcVrW1N9ahTjwQI3emOGUOQPEtFslI=;
 b=bWkZ2iRQzvBKJ4g3nG/Ij3pR9dMjiyfDG/R2EaI+MsyuRblR9syozw3vkMIrJwuUN40VkLjEwROPnGEFabUeLmVrSJUjKA3b55WDRq1bwD3SLz0G4PdxK5kIMaTTsB3dcBWycKAZlPMmqU31i6HyYk/woWjhQxDSqvAigp8hcDM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6311.namprd10.prod.outlook.com (2603:10b6:510:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 25 Jul
 2024 16:46:14 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 25 Jul 2024
 16:46:14 +0000
Date: Thu, 25 Jul 2024 12:46:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] btf: ensure BTF-to-CTF conversion works for modules
Content-Type: text/plain
X-ClientProxiedBy: BN9P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287376EE986A6419F9E73D5C2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e0bcbf-5285-4ff4-aad3-08dcacc94baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jGKoto4IBF4rb7mHhETxFSHZIV/DgxPHWS+3J8PBvJApWbXFPOs45KSfY/9F?=
 =?us-ascii?Q?VFXlQ1nDpyzOyo/p2eqFVIx21ar8FMo7opPK06Ei7b1j/USrVOp2dhHV53Iq?=
 =?us-ascii?Q?BaZEPQsyJMjMBU4mqcbdogTSCjTqfdlys1Zy3x+2rJl9Z8GRA17+zakj8IP4?=
 =?us-ascii?Q?2Udg+6P5jZETs17dUbMQHZj6+Eld1SC3a95ajS9QRWz0HDlHSiGRPdQhcpGf?=
 =?us-ascii?Q?g4RrmeIIx5Duj6ECPNGdM/azz+X4pCvA3j4TZMVgKFh8C8HRMbo9BOJu4jdv?=
 =?us-ascii?Q?VvUelPh7mAVM3e21+aLFgZ5kG071SOcu+iwdlp2Keo8BaJwPvU99iaCtRHZi?=
 =?us-ascii?Q?d4+ONET5NQmP7Do0min5DhDCDAF1iGfP5Ic86MxZPSt4no8Vxky7M+5D54EL?=
 =?us-ascii?Q?V8NxcJ5DY02zMpTbcptiZDtsqFyi7F85NUt2T8Tgc+jFM1cemneT5tbgvwCw?=
 =?us-ascii?Q?XOz+CH4MM5L+dmxJuTxcJZGbmqHr6X8sBxXmCb6CxKJpGFAi6mS8WYeEKbNz?=
 =?us-ascii?Q?MLQtL+9LwPxhcmirn9xDIfVk3OLoEIlMsFXXUoQXBDJMKSUoL3JJL6ruW12w?=
 =?us-ascii?Q?ahP5lJ5ysShN5+F2lQ6lm6mCHWRMiljsE4AOGAq44pCM9PiJDV5m1+27TIkF?=
 =?us-ascii?Q?gBA1xiNnizEdz8IcbgCixlKPxf1wYjgHEn+bl+5ZDMUe1AJKtn9Go3a4boXV?=
 =?us-ascii?Q?SfUjmmgr60WvQu8RYL74+pHCuB4wP5KEFsBpi1DRr47x7t96YxJjk9U1+Llk?=
 =?us-ascii?Q?JpMjhOZBLpm2TGRAMu8AVQUNRVE2+2NNY1k4LGyTkITKqiUhkAzPg4fxvvKZ?=
 =?us-ascii?Q?xiy99JtAVXhIJ323krdgH0g1o9KVCF5WHWbUOL4qMG1wVRM2uusZGykpBe4F?=
 =?us-ascii?Q?4SG5dikevZ90zXChrkw3JdAwqzFRNjChhDBHIwu9PhhnzMisATD08ub3qGXM?=
 =?us-ascii?Q?Fmc6bxhWuT85QFsdH6FcuyXGde862htED9D+koq+pgJd/dKCTyjduhN+hjWY?=
 =?us-ascii?Q?Wt2BijfJYJK77D7oRrqJNXM9dVVN0iRy3W7QKbFacBv7hAcejees/sbmwJto?=
 =?us-ascii?Q?14o/aZNU7wa2oS/PyI+iGLLZN9rZ+T5HbxgXXkQ41z06svk4p/pWOqm6h+oZ?=
 =?us-ascii?Q?X8JVVPiLm2IQbhKcvmfsVXAUWzptbzctwYbOVvCcPYB7/LcysPE4QjjjooqN?=
 =?us-ascii?Q?98ASywfOyIdeUgssBRuk6G80xiLbwMKCONkmwY0rNF9HpSUycFoyIV1vLOs/?=
 =?us-ascii?Q?w/VEy7ptlJSlEBcMGYR+5wNRVaYMUGQZh1xqRr1PUYOTVFjuFSsmr9JPeJ2Q?=
 =?us-ascii?Q?XoChCJ/diXvXoUWyD/G+aJCqMgyd3O1qH+xBX6oiOl4dSw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RlFs5i07b3rgy0rGW/3edIYFYp8Nkk9cBpdDyrp0KSWAeACgGNj8iSSfZ5eM?=
 =?us-ascii?Q?nrDPX5JEH7H6xzhO4/ksn4KoBV8HQZYNhwdK43U9/Iflm0b1aXkFWwcT/0HN?=
 =?us-ascii?Q?6smeQ1yDrNpwM6cUNQ5nYIouZRkV9pf3KUit+1qcBVAxVBfy5H4vlLeve7GO?=
 =?us-ascii?Q?MiIN/incLG/WhnX5cabCTttQIgqp8ho/Urh32onlhtnPPq6WCnrgmphWigXA?=
 =?us-ascii?Q?SdOhZ+2Wxufyql5r7mQI3XogisLJl9+qsHHfH1iIfP9vgGd2v4JybizbGwC2?=
 =?us-ascii?Q?ExePQpcOK155GuA8xdC+3YjnDzgiR+UQGTgcqQH8wzleQdTofZtP+XtpCEwj?=
 =?us-ascii?Q?DJTFmsXR+maPrdBVN1e7/O4C3gf4c2vBXAQ5fzjZQma3RhDBxQzFJ9a9SLG/?=
 =?us-ascii?Q?FtT1sS9CEVOIFtPAkg/1wyfFsZb4luEdyryLzxHOJ/oHoNE7YYv5ImqA1z+Q?=
 =?us-ascii?Q?K0M0Gf4ymFpawsgS86PcbKHqc+ju4SIClDDfDzQyhBg4BqBJJKDEq24Y6vJC?=
 =?us-ascii?Q?dkqXltiYZKFoN5kqjPcp/Js3Em98XwAVEhe5On4o/usqljDFwQNiO7h4NUNv?=
 =?us-ascii?Q?q8V7HfcpY0hS3HngeANZb5qR9/sKjkcfvve4+4ilIfB/vNbiQLCILWPwt2rf?=
 =?us-ascii?Q?t3sYYoiERXdQdEiNtQnZ32vZJB8PMRt/mGwK6iDQaJRGK38OGUmKlcIyNgbb?=
 =?us-ascii?Q?M4RNq2G5JBKjuZFnxhklBtXQq8W4z816TEAfqJoMkChMufOOP7YGXFwJHQ8o?=
 =?us-ascii?Q?3ZyMDXSV++wvKEVSgBJTlDGsqPOCoeMw4pHRBDowq/UYU7xnQm2hH9oXo1gF?=
 =?us-ascii?Q?ubZEtmJFmz6uWwWsKlF25s+doQKv6O38OobfT2NWSugKqCqY387PDdTK1tT4?=
 =?us-ascii?Q?LV7XdvkVWgmzR2aqLCEwEwPsaE9722HJnbVkQSoMWoBHbLZPQa0HTNihGYoo?=
 =?us-ascii?Q?Z2n1oGpsOmHR4/rNTxpgjYIm51lQSwMJU5+C7yUOyWcUmxIr2txr8mdr8cyl?=
 =?us-ascii?Q?i9cPm908yeHM6G6SfVsijRg9mDByn7sCfcj1DgQKfT51yNFJyg6zuiQdJCO6?=
 =?us-ascii?Q?igwN3y6rFTEs36K8yMALO3ZZeLc++P+QbglCa8V/6kEfrTecAcM7wgcn3Uga?=
 =?us-ascii?Q?Aoakr8sVBhRkmZRdqizN2pxYKjDmNWACsE15BwdaRrIkLoLpVd0w3zuSnueL?=
 =?us-ascii?Q?AcxIL3Oto1tkvVr6ZISxAKbrR6jA2rjWWc4liMgM2Cuw7LeEIA0IdfpQaiEG?=
 =?us-ascii?Q?E2NGRwvLNfOGy+zHQFmab1DveMsMKpO09ISLdzks1lIik8kK6K8Tp2a0Y5yX?=
 =?us-ascii?Q?0XE4Knh6uQGcG670ArICGbgBqGlnniGNyHH/TkRzwKXIvyP6YRufyGZxFAQ9?=
 =?us-ascii?Q?ErflYuA881p2gT3ySd+aG5MB0kVec2/NefUJifVdR3o/AihN20X6ED4a5b+Z?=
 =?us-ascii?Q?2Q+hqUvdP3n+W8CAknpI9GY98BTEQjJ9iXsnp1+/RdwbLarEa3EdPjo+NX0f?=
 =?us-ascii?Q?LFNzRuAHbqMUMVAiINVzddpgLG0RSVUsHKiohemMb2WSO/wDmRCIAkA8SM83?=
 =?us-ascii?Q?fb6ajK99B69MHLHFVPhiRBOb4+M3teFjx1qwROCT/J8Ew8AJjqPuBQPppJcB?=
 =?us-ascii?Q?oVc7KkiHIAGw/LENtKIVYok=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wxDmWMW0b/1MYJ9odxqt4hrmwoWOIrZfJDU78DNb47r11GbAjBMA1ZN9JUc1JO1McNga5i3vrQTDlJV/b1kogu5BNqKLIsBOCq95Tf3009his1kTfQw4w8wh2bugid9N7Hu56viyZ4v3PEk6CTtxnyVp/n4NdE30L6g59W4hmqkrxv60ruaxeuW+xegRsyqh4uRvGWapZ1QPK192g09qe4FE0lD3d8f/C15scXW0ALThoB7eye240E1MohnDw++w9a3rBkLVAhtQsETHAMBRKkenzOII1/rsOPYAXDhMiD0e2vdvGoziIuCDIUx9Ijx7D+2S2d9CEGTCoDMpArTdKj9S9FnGcGGjtI0rAuYHPb/b7ObgQfF9rMA4K0UdCPqhzdYR3ecwZ/AIS4n6PLP+KmNOyXPNq7lM4Qw7AJRjlHLM0IR6Rr8EvbdhSzSJSo4qqcLOpoZZy2lCQRoGMmlT4a4CBnbRG84JE3wnyttN735xKVKVoXFqhUWSWc380es2AbyjPGBCROeNn2ks5qTjAfz0CJ9wU6WdSH7720wwW2sNa12qp6yofh8UnjkZBIwCgzMTrVRvPTzAWZ5kSIf126X5YMWCCBk3ieBr9xg29PM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e0bcbf-5285-4ff4-aad3-08dcacc94baf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:46:13.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mA+7VoRfdYXKXFldtbXYVyp1mv157lv/uwJQqndggd/scXfi/Jw8pksUOw+vpSZIXh+lF7AFzD88QQVv8hlphfpe3WDnq7QF/JE2yz3eHFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_15,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=735 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250115
X-Proofpoint-GUID: Kd3-L9E9mVmjiMflkBrsRI2zx4dp8C_i
X-Proofpoint-ORIG-GUID: Kd3-L9E9mVmjiMflkBrsRI2zx4dp8C_i

The recent introduction of code to always load BTF data for modules
broke the BTF-to-CTF conversion for modules.  This patch ensures that
the BTF-to-CTF convertor code is called from any module that does not
contain CTF data.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 5e608446..dc00aa88 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -963,7 +963,6 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 				   "looking for in-module CTF instead.\n",
 				   ctfa_name, ctf_errmsg(dtp->dt_ctferr));
 #endif
-			return;
 		}
 
 		if (dtp->dt_ctfa_path == NULL)
@@ -1018,6 +1017,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 
 		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
 		ctf_setspecific(dmp->dm_ctfp, dmp);
+#ifdef HAVE_LIBCTF
+	} else {
+		/* Generate CTF from BTF for the module. */
+		dt_kern_module_ctf_from_btf(dtp, dmp);
+#endif
 	}
 
 	/*
-- 
2.42.0

