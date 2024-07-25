Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9211711
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721926264; cv=fail; b=fgoEj0gSb8sRDhfRsH5763CiOSGtbzmxVJ4+W5K5h3xDojoUpoT2Kan8hb98bjRb5gbQdR61MrXH0BVJ7X8BRtFFAt0TD4pv0NJQJBEafyeiBE5BD06Fsa7PYBFwkAcem6fO4yjO3qkHzJI6WBIlvuf6F/nwkSTn8gckBYx7SKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721926264; c=relaxed/simple;
	bh=K43nolaRoWBu2PeYmkOWxIcnQxNsBCH4ARO1waX+nzM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=HT72Obd4cejpJPjEiOq2v4dRh+iKxXv/5Gmw2b7zNlxxo2tAf6F6BwLq9VuzDHbkt4TMGMrBhCxSUVFSkbThQieVvkirlBTDsHCRFfcpEvSMiw6+K9jkCRluhiA4IvJTI+lpwnt0JiH2cBRgX1CXkLxfrgp49GfrSi31radwkBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fuKedb8C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ylEyuIwU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fuKedb8C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ylEyuIwU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PG6IXF008116
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=WLOSrAn6gTc68d
	d2+f9qu8hTLBlBZbc30T6VA0LRtpM=; b=fuKedb8C/vIyZd7rNbOVOLWpM3bVcU
	A6ro43bfmJM5P5IcAPRGQUdAZVwlAEZhZ8kAw86rwiamwMFj9sOz68w1ukdfSbZT
	0bMJY8gyASvSRLoDdFc9Rl0XZYFW9ecsLPr3jiPtrfjZFM7r0FF/IeOClq6Ydksz
	9l8MVPl4XPWU88GHQE4LW5z+HaPKGNDmHnByS0cCAUldJkpr0rj3/MQDrwJ9NO4/
	VK4cdq9TTJHiagUWTJJJlrtkDNXdbwIocF5G9CbhjZfERv2AH/deT2MsCia6mgv3
	J5isoRukdLJ7QmMbqGJcFJSY3q6L/ssxnRu8dX51T1Rq7k1O52tIorOg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hft0kvrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:51:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46PFRNoq039099
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:50:59 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29ubnat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixSarFb2L4Mpy2PP9Ml/jrzKoF4UzYcYd/X1xbrLV7A5XmwP4IHfag5JpB5t1WoIoWxryqsLlT765SLT6fwbOByp3fyji08qxPqhTPNkqg7maIdf0LpiDfL96IqwM4THAH8X5xO/N1mbdMia1TJ4npY39uxcd7ZapTGPp4EMvxR55RdPd3fKRRJa6HxFTIVcXZ0SX+A2G5j7O9c/Cw9aA2qX0N5lQr/TEXIRk/VVVMD7lH/KibDSEp64nhDH1hmSH8fYWp32gNvOw315n8ZU7VZzbfyHN/ntmm239WsJbDyONkxlm0gkfTWQYV24mtlNeJDmGjMhmLQHsNUDNU7BhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLOSrAn6gTc68dd2+f9qu8hTLBlBZbc30T6VA0LRtpM=;
 b=DLZbLFoHXsm7ElyoZjkvnivJkixPf7TdaX5Lrfe/EF/dF/Z7GLkvdDqTFnG4hOBSF+C9gvOqxEUcLao69kPzR8jIRqxIXSsgUY0KdjsQL+VQLk8SLIMDfhXxrfAOSxAyYc1R9k4C1xFbAe0NqD8dzphyRLv0XYceNxsDt3p4gBG+3Ytgwq5LUOjIZstbZV1iu4+L+T2AJOzeIdDYiMvNeSITRJs2iBdSt26I6+OrivFU+m3kUtAZvx5Cb9iEzfMETuTFtklU3MK7kbe32H5XMP/kwVhl3v1q49A4OoAM3aOPugQ29VMbwsLFEnCb87QBKCIx51X3YISzXAHuvUcDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLOSrAn6gTc68dd2+f9qu8hTLBlBZbc30T6VA0LRtpM=;
 b=ylEyuIwUOyUJJB3ax5764Co44Cp4sUgC9z6n8C51rB0U85T0gyJE7+iGgAB0mKW9ecKA1Sflsou6yW8XHylDMPwTVl04RyjjYExUIEaNZdFG6nWqMrGkJzIYGGUqoA0Kcn8YX9Mtf50WRKFNG26Ify5APfjNWcfcQVaUJ+eWC/o=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by PH7PR10MB7695.namprd10.prod.outlook.com (2603:10b6:510:2e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 16:50:57 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 16:50:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2] btf: ensure BTF-to-CTF conversion
 works for modules
References: <SN7PR10MB6287376EE986A6419F9E73D5C2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
Emacs: a learning curve that you can use as a plumb line.
Date: Thu, 25 Jul 2024 17:50:52 +0100
In-Reply-To: <SN7PR10MB6287376EE986A6419F9E73D5C2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Thu, 25 Jul 2024
	12:46:12 -0400")
Message-ID: <87ed7hxvo3.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|PH7PR10MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 9091384a-7903-4c3a-2334-08dcacc9f4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xA9FtpMuH9F5XhtYO1/pu7Spl5xK+8VxCuro/WDsw90TrgMiKl+XHAQRQCUt?=
 =?us-ascii?Q?S0jig6A0Trb2qrZ5dEdfHET+tx9NEEuULqHRXgzttAKFYHSiBTXymWlQcrHl?=
 =?us-ascii?Q?66zInLWEo/65KFF0y52m7sjwkyfLvRftpe0cfeFxIifH7AcooAwADyNm9gc2?=
 =?us-ascii?Q?AqVxfIeWGa4RYeyq00CGLJ4zhUw7/xzMPF9W6/RqNkS6zZ28GJykj/T4VuJ3?=
 =?us-ascii?Q?bEfNWV4oR6SI5rIT2o4B9upo4/WKxZkQVDNHV4w7sIv4HNxcnmGUzWjnvXzp?=
 =?us-ascii?Q?q3pBosxydHD3YpsX0K0+5o9Kw6AZFdq3OiJGIbW7+aA+e8qWcOVky6FbUio2?=
 =?us-ascii?Q?WTKqo7PPA2i5d3X6Cc3RKHSffxjnajXKfGvAynT07hy2wToWBYvTcaoqvYYs?=
 =?us-ascii?Q?yHJIS018QfGp2T/qLF9Wc659bBO9Qxf/gyY/H0fKNeC0u66VmESu1FuphW7n?=
 =?us-ascii?Q?4LoWRI7Fa7/qapIGXWN1OU/3u7c5eEk0Z4ugI+vqnrZvbgmTnkwQXP+YzBUY?=
 =?us-ascii?Q?pHT2/Uvhsgxnbq3L5hGyK545tO+XeWmGbt6/HO6TJKXv9bBQWxeqDWztdy//?=
 =?us-ascii?Q?14M0aIf1N4+zAsK9V92+Mk62joYNjqENvAgKDjQtVPdtfepBnvNtR35XYfye?=
 =?us-ascii?Q?oDZVc0frUhvw3BXlBMkAZf6b18IXUVNAbokuVAnzCjCs3dUfUu3XtoNjkHPs?=
 =?us-ascii?Q?6h+Oq23rwBa+TP+d/98oNG0XrBheFw5KmWUO6pLLncPaPvEfb3R8L4PSFc3r?=
 =?us-ascii?Q?UhZqyeg6uCyNckMiLllONJyyQzJolxD/1lEq9x2lKBwgTVw7EdpCd/gtses1?=
 =?us-ascii?Q?Tlu65yzONjw9JJB6oKstPF+5bEoUasqZc0xn+DspKWX09q3M8uv0e/uJloo2?=
 =?us-ascii?Q?WXwzIVkeWHQvHbaZX8yd1s0sf4+H6d+LexfPB8u0HG7TzS6zFJTUmqZe/9Hc?=
 =?us-ascii?Q?+fzaQJ3fnd/P/FBd3cwjw+55GXn/T51BLdQXzfwiC4UuZM6skZP3SWpCr8jB?=
 =?us-ascii?Q?cUVRPo8XWr8QPaQHMdlHH+6gd/EzaMvUjChXr0CstG1FAG5C10OB9nB5Xm7W?=
 =?us-ascii?Q?U79/RoWz6uKq5fiKOfPtWTEaW6Hma5nXWlUeOiZ/+kzD9DFmWbjkT7458u55?=
 =?us-ascii?Q?KSkJWUpRk9eD5OZyLHPvEF5fmpE03My7N6arHMUYDIXZm+tmZLrQoWAReS1H?=
 =?us-ascii?Q?CoJRwkhvtVEK0UuGTEHTjT08ZqFmrMewGx9VKutKHyymtLovLmaSMLVhqZbI?=
 =?us-ascii?Q?1X6nfpVO9+rInnK/kfe6K+IajLEqSR2ZdXS7Ad7hQMM6qKeWbYmIhq8V8Uff?=
 =?us-ascii?Q?V4Nx+9uTfoG3T217AAqTMtF+dHktP7s6dsg3nHjcoPaRIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DeqPoWYAUgb4EuTQn1Ygf/arnUgLSZmPR39MTRid74ke82sK3JQdIz3pzRRQ?=
 =?us-ascii?Q?JlueQR7QB57gaTftJSgkcDtVIyQ4dcH05ymaHhg1Mg/hdGoYZ5omV4Qhup+4?=
 =?us-ascii?Q?FmkwrN8knK3Q3byXNrrHb453VmUpF6cbp98s6eYHPl6pN53QnAK9tAfi+dtr?=
 =?us-ascii?Q?olP5ZCsvfWWQwEpfG2FqIIWX/JpGextfhjYzUsxKsVcc261RI3XTrXJj93cW?=
 =?us-ascii?Q?XOzPHZWCXTdzpZ18i1k6wiWvGHjxmfvAdMs3Sd4CKuNQRNzhhSTtdeH6hWe6?=
 =?us-ascii?Q?nq22G5uE5pUSeDnHv1UO1xhHsZHHqVkt9obDIMV8Vp2qpytZLEXFIUbgotd0?=
 =?us-ascii?Q?wZSsLvqfMmFqgnl3CcBuDVwXBkTwAg6I2itcM0WPjQ5BWso1Ptf6s12uWxqC?=
 =?us-ascii?Q?T5Z2gOWihMRxtizXqaiQTsw1QMwznGy2BrnaXkH853czPPoJSoBe5Ig0qeGG?=
 =?us-ascii?Q?MIUWLsxYmxYolsvaj95T7r0jtwXSmARdMAUV0pENu+ACTrQ6atuG6fhc/tsB?=
 =?us-ascii?Q?QrJz015dXrLmxQIKXXVM0TqlmI/JCKB/o6q/u1WZ7LELFcBjMq1kGS5mkpgR?=
 =?us-ascii?Q?O+Uw/jbn93ETsarwBLnyT+oPcitVAnJmMZxx0kyJrPO2k3lh8OeILD8gdDpL?=
 =?us-ascii?Q?GyTUu3Shn2RQUVJvPeKB0EneVpqN4B6OsphLAhXf5fqSmVKUR7eBjBSEY7ZN?=
 =?us-ascii?Q?LgU42VhdHf5cRU9B6rHEIb/NxmS8RBc/Jp/6ULgsFqhk54jNoGldafkUkyGo?=
 =?us-ascii?Q?mI8uC0g1zNgiNlp/iAR/pBtX66CfHNzUtnKtPck7iEsV/DSigwMeWLbuBm5J?=
 =?us-ascii?Q?/uPELWTItd20KoWvW1UWkUpWcgO+nyqF5NFYfqmQ2emI8FN0g34+f4LOPhWN?=
 =?us-ascii?Q?cpR7tEMeyE1a5NoiLrbx5jIRkj8foiAPQfgIu4X3rTiFJOlhBDaEzz2Dtge9?=
 =?us-ascii?Q?W4M8N5Yd+SW79zUqYnehRch8RituQoj9R+EQUsA0/6QgnT+X3mUI9RCUw3AT?=
 =?us-ascii?Q?dsASemZVgFtxb0LogQOG/V9YquS28Myu86PwI5gD7Kf3QU4llGVPFidiOZPw?=
 =?us-ascii?Q?5ZVqxgdRnbf8pLWxhHLj8WwzxcY903QtP5bek655cde3ztixsD289AwD3CkW?=
 =?us-ascii?Q?7ehJDCJypRuKtE6a3dp4Yrw16luKlU+irbEwy/g3VHoNn0Ac9g+cgv0jLHb2?=
 =?us-ascii?Q?9vizydKNvVdtZPeZU924i4R9lJoZiWDQ0NuUTRCYIQQK5S6+rvkb8FViIAp0?=
 =?us-ascii?Q?FDVbPSwMMPAdfIMVZbv7LMkVjeMoahwMl0yrkZpeQJnLoopBjiUia1fh0E7v?=
 =?us-ascii?Q?lb+rKZwmxnEmflgCUZVq1HkgCmTCozbi0yCNWwRMMRKuXn0rby+dAWsKtWQJ?=
 =?us-ascii?Q?JnEqAW/irnaiDowzGI6nMOCLcFv8GjvXBrlSVQrj9Yn+DBHAyHcUAhHVaHMu?=
 =?us-ascii?Q?tPBliJ3VEpiR2S5DVyfzhxW0hPN5h3+ltXf/F5aA0LPORJgUc46JAs/LaD/8?=
 =?us-ascii?Q?DT4LY8Iv15I525yrFB/oidPOtK00St21nICxJ8Uk8qHa98XciWGQJYzXZVFT?=
 =?us-ascii?Q?LvTIDFPkcm0H3Wnh5TxBpGflW2UIH4Vo9VT+axaTVNjYW4JRwvSvOD1h6uGw?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nEB7K429VjfAilwlumsvji93NCfX0vFdwXXspJgY+CAUX7q7HW7ui4Uv4DP/9O5d6qQ6s/LwNW2aIFLV9C4NJ5l1I38jDZ3Epk8IahJofocAvHYrcJn4uz8IeAddMw/+U+0AYu2FD8UVuA4jKI71mofBhpKZrv4yyVM17Td+APku2h+Hw5HD15LH+ITMAwaqqlUkCSicwiYA7OqZ2SZ/affPIf9MaB3NfXSsYCwJ3eJb1BN5v8nRZ8Z4JZzuxLPzkWWyH1wZVaP8UMIP36zHYjXw0EqbopDIee7trDMK61XEzAB1TzLKf1jI+ooi6KypvHbZwxvPfkUbw1nLzPGCaBD1j3S4V/fefc0zwIF/Ewm/LVHg8EShuFhjmcNzEeze66APe7l6UXrT6NvLz0OLNaGa4BBOThAMcjr61BVtkhdKTpTos45VOjeQBs2a+MfDBD4fa7zS0gW3MjcFI2oqueLUayATviW+ynHKG4pwuRXHWep+F8odcvyo38a1CEzzoU7MfSKAwoHaz9im8wXIUKQuMAz5Te/1oGD+BZgzUfArEs0+rtC2dfy371BZBFRPP+n89DdjVOrNDAFsIzNwemSaYon9FMNRw9mEI/zdHQM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9091384a-7903-4c3a-2334-08dcacc9f4aa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:50:57.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYtCYWQz020XMHBqv7Mevm5v0zjr8evh+1X1ZMgKHX6sOj7dXtn5t+nsT6+ttV8xdJFwGPwLu1Eb90ALbekASw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7695
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_15,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250115
X-Proofpoint-GUID: sf120AZf3M427ZxTskljWcUnrYG_IOup
X-Proofpoint-ORIG-GUID: sf120AZf3M427ZxTskljWcUnrYG_IOup

On 25 Jul 2024, Kris Van Hees via DTrace-devel stated:

> The recent introduction of code to always load BTF data for modules
> broke the BTF-to-CTF conversion for modules.  This patch ensures that
> the BTF-to-CTF convertor code is called from any module that does not
> contain CTF data.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(I've added testing against my standard victim tiny out-of-tree module
to the tests I'll run at the next release, just to be sure...)

(btw, converter is spelled, uh, converter.)

-- 
NULL && (void)
