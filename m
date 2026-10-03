Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3581E1024
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016833; cv=fail; b=ums+Vd0qsMYR8lytzW5OExJmEBVyvye7ybNgLQ/e8s24p8uMLp36cwScbBeg/Uv1SyEWdZAcuj/Zjnx9F98itI8cgD4fCuEw0ZUx75qohh0VmJB8D+QN2Ed7UT84wAuKM3TjbqsuSoRP9doSlwZVP03+o/CirrPEiFZt2sMlRtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016833; c=relaxed/simple;
	bh=8XElgrOR1v0CZa1IVv7dfPOnp7eQ/n1VSrecIgbdXIs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gWU38VMUvfbnEJVt2JbepmL44+Dttnqg6pFsL7PsrILCNkk9GWGE/2ueQrTDKPwfKFpoiPNtL6ru/okPY9z7xxsw3W/bBAq1iOF3Ug/dmBb7GUuIQNwUY87S6/FN/IzeFyWKwh1o32u+vndCdQW5Uptmu7vaVKYsldvG7rWUvzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sLPXvcp/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=opvL+1wA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sLPXvcp/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="opvL+1wA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6938Tp4U721809
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eDLfpRkF9js7Y8CmgKk7GXt7hfgbsJ/UmHcek/ZCZpM=; b=
	sLPXvcp/BYAmQ4GK0vkQ2DDCv52UIxDf/DrN0H0/5DL0wfg5/XkRnQp7x5S3YoeV
	JQthMtC1AeGcNPmWsXOSi4vhPzAmAotfy/p6Shf1RMFHhtB7Yc2wHXMoiBrMe4Lr
	VdPq3MzDFTvbUu7wvJ1WTiJ3TNQ00pO2gogjBlOKQSSw/gdh0CmgpK/ztAr+RSXj
	OWRh8JG8aH8MuFfq+0cDr9xvqTsINL+o9vfWPGnUk0nbRhxJ2KUC6shSXsu3XASH
	VgdsnWLrnT23CLdcfHJpnNtEhaoIbXxw/+2mW8aGVhY+IdcXaqZa2pU6cZk6wJZB
	z9/C2hgTU1mlaQjx7jSs4g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2t8rr3j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:40:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938K1Ca030832
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:40:29 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r5960d6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:40:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AArAN0g58CJWnGjduwa2eO5TocjplP4SNEgaG/QwRcN0X5nn1R9Msn0FT2aH9+2SNbBOeI88+bfzFQZbLrST6Y9bCLy1cq4/Y4nLxgKsYsGQ5nr99MPL7dcknsKuDRJiec/aJ2m/LspqcTI3KBG78L+bp9lKFTqQI70mEvuBfCl0H0W8jXszych3rM1dxi5dJq72LXpNiVrw2SUE23EkhlQafYUu/pqFtyXVYId4hHVOW8FTNyHPS1tbo9s54sj4MonePx3qt7SRTupzOKrGbYWqykOdtyJN9jMV4fUKz0p0jf5oTgBBU5R4oH2zAflBmx8JONSSG4HfG+2jrGsgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDLfpRkF9js7Y8CmgKk7GXt7hfgbsJ/UmHcek/ZCZpM=;
 b=XLYOC4HipeRQWlCPYduB96qKUeMxqhMls//eZZGr/CkgfxElijgvWQvHf8mEewv4ZXxdh2WPQ74b2pMgB8VA2C7zanRuVQMPeqUEckgU6IcR4lgM1W4QXdXjhMc7lQ3iU0kuMwhJ1roQ81AIxu6eGnBEMr8DbgdDE1wehTCWSVSemf6hY4d6nKkDRroU4kwW4cJTOXytHPrfFwCmC7/v5XkloczmiFQz8ydiJu8P28U+BMmRxNDq2pNzRi9GglPwA/Wb6HrKakOlk1WbTq7YlHZsiA/a+rJQ5iVHUB2Hx+9hi+JZtAsPyHvroORRZZRgadeeeJNHwrXtfyGP6EQG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDLfpRkF9js7Y8CmgKk7GXt7hfgbsJ/UmHcek/ZCZpM=;
 b=opvL+1wAOrk+D1ptoBfAYsFf90H3xHgDD6kIy01p8pCGA3Li0zsnJyEB0fSf3mmbtZXtMAF8YI87yrGf8dOiaWg+AiF3OnofOm+DPW25Fia6423HNgUf5ry5ea/FGhmsBMKAMWD+aUYeMLFygGAfeSad/D6KdUqByOTOE0E9zDk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:40:27 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:40:27 +0000
Message-ID: <21963394-b90c-4267-ae60-72eb560b6717@oracle.com>
Date: Sat, 3 Oct 2026 02:40:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 4/8] parser: reject scoped type
 declarations
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <0e6de12176cd57395d3095a31930775c@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <0e6de12176cd57395d3095a31930775c@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0104.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::9) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: c95784c3-87a9-4ce3-fc36-08df2129f964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	Sw6NSm8sfXJqkBUwC3ZLFGQRWBC/QAp67n30PC3yl/g0WGo5t0FBnf25eNtWvyPabgPq2xur+lFipB47/DiiC5IEteNbBcmkAK6QFmQtPVDSl/rYo8xyEkF958oMgukZbZ5FyoM2yiSBZxBbnjmMjtEf+B71Tv4s25fz69Wc56Gb4ZQzKC78Afl6jKde3Rwl6j0mdY3PuS90HLSwelLQ1yRecZP1fb3fRKf9nec5pl/wzx/rQpdGF938gFhWYO6svwiC7n03pzdm9YylAjq5sZ1gTOBlvjYqRbjmg5QTe815Dz9O5qGI+WVtSl1vpCv6+kRyz9a2a1yA5R+vioqS4QwAqTvZIk3hjHbXBkUye20Bl1woLaZ2eYaVaN4GX9QARFvxHVYC9IBwGd9OcLeBWuy5mIHJvrHMfJAVTSRiCHYEbg/d5zV38hTga6GnO1gunUOqM6SZ+AB/7Cw96jaVM40DgLXGQlYkKPicln4UAlwT02mwrHjV34Bdfbmkk8PzL4M1Q9OlDKHgvmvPoqQUijzmWoLBllVGYh8lbEhYc9XeI8H5S5PnPqu8nUMvwg6Bgcc2HoXbaxCl81Ld4mpT7GOsnffQ+sl3BcOQb7YJjwi4dn9Ik0WzrkQiBhmfqP36ENVsQ8zySoPZFPQ84NBMf4mABMJF5hADdTFVu9EsRjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRwNjYzUmNBR0xLYWxOc0JUS3kzSUVKQXMrNllpVXVKdVZ5Y0VLSnRJaFJo?=
 =?utf-8?B?WURVNVdiRTYzTUYxaEdBcXdYbkl6OWhDYUVPZkVKN1VIS3gxS0pMWWVJNmFG?=
 =?utf-8?B?RXVsQ1JERUdVOWdiTzM4aEc2TmVrNWRkb3J5ZEhpV3lpR0VhY1hXUTcrN1Bk?=
 =?utf-8?B?MThKcXBFdUJ2UlFOeGpiMEJJcEk4aUFNRzMzM0c0ajNPd05ualJYVW1qWmZx?=
 =?utf-8?B?emM2cUFPREU2d2lrcEMxQWh6cVBQb3V4dTNrZUIzMDBla2ZnZmtEcTUxVUZH?=
 =?utf-8?B?azBIakJIV1N0YURJRFJMMDNEWTM3bzJVczBzbmxwSVhnSDRBMERNSU9LL0V5?=
 =?utf-8?B?bE5iZnh3Q3liS1pFWVlDNEx4TjJDMGNhd1NEcHV0U3ZBVktPdlhZbHYzSEZr?=
 =?utf-8?B?dzRqY00va1g0YlYxQnBCcTNmMXJNdTYrb0s5cDhyS2ZhUk9vZml6bFhPSWo4?=
 =?utf-8?B?ZVRqeVRLUHJaQkx1TU9MZnN6N0tJSTNjcExSeFAwV0FRUDdGL3N0OStmcGp2?=
 =?utf-8?B?dmVsMk5FMXhLWXNRNjFEV2JycGxsQkJUMVl1Mk9lWTdrWmlObzBWOU5tQklT?=
 =?utf-8?B?d3VJTzNWdk5jc0szMG1tbFIzSFY1OVlCZC9BVUhxMGFJZ29vRXdnZmxkKzNX?=
 =?utf-8?B?ZXdDZGFHSjU3bHJVa0tBd1diUndzd0IydUhNNGhkdCtxbU1iYVV4YVowU1Rt?=
 =?utf-8?B?MzZRcE9raDhyd2ZlTCtpLzllejRtSEI2VGQ0YXBwT2YrRlZBMmx1SVRvd0Vj?=
 =?utf-8?B?aVJQcGZOMkVSbVpVY1g4TitCSDVNTER1MzN6MWJsejZ5QmppZitvc2JWRFB2?=
 =?utf-8?B?K3NUbXJZOE9RbzZxZ05ob1BiSitiVVM0cWg1NzhheVV0akxuYWJ2UU41SEMy?=
 =?utf-8?B?Z2dxQ3BEZkdRN29PNXFzSGFGc0NjYytzUEFFbGZBSE9Ia2J0RDQ4YjNDVE5F?=
 =?utf-8?B?SXNPQ1JpRU5FaTlyVGFOaXhFYWNpQi94U0ZST3Uxd3VFQWJxaFBHdllzL04w?=
 =?utf-8?B?alFMaEhKRktSOVVROWdNTEhPR054MFRRbFExdFdCZTZTQjdSb2dQYWhIQ2N5?=
 =?utf-8?B?YjdFYllCQitDQ1RaUHFWVk9RVFQwbDFSbG91NXFMbXFqRkx3djVORFBZcG5m?=
 =?utf-8?B?czcwZHR5OTJvbStmZjNmYTh2eUUwZGlNdUsvUmxHbG9hSVJiOXFwWVJJUWpW?=
 =?utf-8?B?WHcyUTUyRG5vU1Jib3ZnR0dIU0JqcGkzMksxdnY5U0VzeWJINzdoUWRiMWl0?=
 =?utf-8?B?bnU0L01rRkRTdGl1aTU1YnVnQnVlSHcvQUI3VmpUa0Y4ekhGeU9FSFRIRDZP?=
 =?utf-8?B?RnFtZEpGdmRoVFQwSVgrdm9CM29VMFNaWm90ZVZ0RkxDcy9DMk5sbDVRKzhN?=
 =?utf-8?B?ZG1XUmduVkhPWjNtckFNYnBMR3lPdENGWW1LMW1OSU5YbjN2NnRnM2FFV3RO?=
 =?utf-8?B?dnZycnphU2YwWGdtQzBhSlVnc0x1aHN1VnJGOFY5SkQ2aUFTTEZPTlR1bVQ5?=
 =?utf-8?B?UWdPVkxvZjQ3MWx3MkFydXhxWllWYm11K08xWDFwbTVnRWtVMCttUUx2RXhu?=
 =?utf-8?B?dHVBUkN6SjhjeHZ1akRWSUlNT2t1QWhuK0Rla0FHQ1A2VGY3R3NmRlFSOTRN?=
 =?utf-8?B?cnhmODhKVUwwVy9iU29UdXp6OXVzRnhZdkxWc0J2NGZGVmNzL1k1Tis4dVdr?=
 =?utf-8?B?WnZKNndEdEZIRzFqTm1Ta0RJaEJ6ZG1YMjhCbnZNVEhCZ2RLREsxYlVpb2pU?=
 =?utf-8?B?Y09zdnRBUkNEWVdxa1RmMDV0SFd5MVFEdENZbnlOTlFNQTBQZWdOb29LRER4?=
 =?utf-8?B?OWs5KzZ6OUoyQkE1SitxUmVQNWdLU0VmY3YrbjdtazYzWENsNURoMnFSRHpi?=
 =?utf-8?B?dzVjTytBNkgzWmpBOTZ2SzdGYUtKdlcwWnVXWW9zTFFsNTUxdXp4RU8zT0J6?=
 =?utf-8?B?aXVhdVdHT1JuQkJHN0R3NVBTazl3eWlwWW4rYmRZYlFtK2IzQVRPMEQxZDJR?=
 =?utf-8?B?Y0ZsZE1BRUIza0VicVMveG11bG1tRHBxeVhvU3lwc0ZaM2N5bTZXN2dZTTFi?=
 =?utf-8?B?VHloOGQrczYrclkycWpxL2VPSlBIMmJkK2QyRzY5UXYvUmI5REpWWGpvYXY4?=
 =?utf-8?B?dTJpa3l1SkRCS2NieTNmZDYyQ2NIR0NRcXFzOFFVZ2R2ZDROMC9hR0Y2a3RF?=
 =?utf-8?B?UzBCTFAxeTNRc1BhY0NkZWFCMGl3MkcwRDRITlhGL3RzNW5mSURlUG9pWDZV?=
 =?utf-8?B?Vzc3bXhNOWl5N3NFY0hiU3hQRnBxZm8zRkFOZ3FHZFFpeGpRazJQY2RJcDcx?=
 =?utf-8?B?SjcwOEpTNC9YbkdZdXNRR1RaaGZ1bjNFbkZiYUU0VENHRlNFSWorZzUyeFMy?=
 =?utf-8?Q?cyjCivfYPGK3AH6E=3D?=
X-Exchange-RoutingPolicyChecked:
	aAIUB9LtPXQykZDkt9HSkEw9Gquj5Pkqan68Qr/MOjLmGOQ1k0f74cJK94VN4otq1IG3lBM/4CBAvj0kT6B98zf8KnUke322yLIRNF203gjEq2dAUEiZrnAAkcZ7azARYkffIV7XiW01VLekpozecFr/3YseQUKpvZBL1NCboo/ea/X/gMHrPymQUrUbd3u10hwjrre0vRxERP14pq61zPHZlTS0LZov4Xe/W/brnsyIQUkg53DTd4czMOocyr9k1jn/vE7+qn9/87p4Kc0JD0fT+7SpvRjxY1G+VlaQxlJPbFIjxttF6LxtvsAyeRUWMVKFQW+s3cGDlaw1Lwu/9g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zgBgLipNxvKxNa7QyRToClW3f7XQQDXf4+gVHi3KjgxRtl8fPmcZWVWh9Dy4N3NbiBvUvH7+Od5l6fC6Z/ig4oNg8kVLkulDR6SGbkeBEv1i/zD8Ek8D6c9yzTFXSOh7m/4Y1Ktw8J/Iezqt5T2OAFXj7HHyaZom/W1AH7a5tGGFD3Krhd+XjUrlIFmHl5vA6oR9phGDcM8cOGQh42oDD/XF12XLYQ1sFCg1w/kZ7NrwywbJjF5fBBaYu5QVb2m6Mg7weWT8e3LuXTpviBBoUAqGD76SYI6e0w6ETT60bNylCiixvnvWAsoJcfSPs9DTnx296OF0uEybeY8h4nGcMs1jGboepzfe+r8IQYZKiKAYOV0Q4sV5PAvO7KM0T68D7acybRZy3OItVKn75d8hiiTn6Qh44q6g+3WXIgtcG45lVvSoYtqfe9uzId01wt+PZx3/Qo/vsJHawQI16TZqClA0+vcd1kWW7mmVElQjMrR4+vErBt5oB7OURoCPuGCPV5q6mdUrzAPKDrP8HZezWbTUFKf1nRbBMCox7WMJByr8mVyEkMLhmEpaZuJrB6u1ZlsQhVWRMDy1dh4BSLRguyZbHom3NKFMqeOPNHmXYWU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95784c3-87a9-4ce3-fc36-08df2129f964
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:40:27.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV1bZZ52J2DGbjYKliYPXQjuwdLPaSdYCMjw66ZEMHRLDAoL/bnDse3+fmzMTXsYLNBEW3zZt4z4IDIhFbtLfFXWocIw1sXHDLawQT68qiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030033
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX9/G2yEJzdvxq
 1vc5fZMDR7gYwfRZ4fThBGs7SmT7KnS7P+o7SBx+Y8JlpyClfkE42/tp4NfxNAvN0alYiNtFGIu
 WtRM4MP2qmIeGB7s/QG+VpxcSF6GsZj7z3iYfAC2NpFMCjMWSEMt
X-Proofpoint-ORIG-GUID: jIWbzbgFHyjk7eXz4T5RfL3R9emREX_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX3V/zDU4Tq/yC
 Xnb9UrI2uUOeyMwLctTKi/z+HP/wLhwZITko0K2XEATjvK181C7mfy4RvwBfrnDZ72MHVA45WzT
 xz0ExdWhyOW2va9yrjFikHxKcWPZXfvBMNn1Y6/4rn1W5V8sL++80y709tNdQuHMj6+rm8kYZhV
 04DQ7WjmTbECDTr4qNNjSxHO2u0huZ/OV6e+mUrFEsRDa0qv93KnMuw3BONF2tiI7wZJzyzFktL
 W/6musx5Q1MYOMARUdKGAcu6D7CXT9qDE6LlKtjyc5Vf1oAf5Y6HtEgVyCAhLFN3kv5cyi4b3xV
 xXyWhtyfZ/ZoYPEV7x5JYNk6zYT5grtlEcUR/iEObqVSXVftgN076J2Ok7Y/Zs8gtFeoFieb8o7
 e4FSgO8gxj03jsA1PgyXR3L7Couf6vYcTLcQVhW3tnr0++PUJQAZ/5xwyjHNWNRSrT8SGK8rjXa
 GfG0D2vOm6S8Dsm7Neg==
X-Authority-Analysis: v=2.4 cv=Ys2a1IYX c=1 sm=1 tr=0 ts=6ac0bf7e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=rbWi78VO5vDrALrAfV8A:9 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: jIWbzbgFHyjk7eXz4T5RfL3R9emREX_k


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:02 PM, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_decl.c                              | 10 ++++++++++
>  .../types/err.D_DECL_SCOPE.scopeop-enum-tag.d    | 16 ++++++++++++++++
>  .../types/err.D_DECL_SCOPE.scopeop-enum-tag.r    |  2 ++
>  .../types/err.D_DECL_SCOPE.scopeop-struct-tag.d  | 16 ++++++++++++++++
>  .../types/err.D_DECL_SCOPE.scopeop-struct-tag.r  |  2 ++
>  .../types/err.D_DECL_SCOPE.scopeop-union-tag.d   | 16 ++++++++++++++++
>  .../types/err.D_DECL_SCOPE.scopeop-union-tag.r   |  2 ++
>  7 files changed, 64 insertions(+)
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r
> 
> diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
> index 68999422..80ab7826 100644
> --- a/libdtrace/dt_decl.c
> +++ b/libdtrace/dt_decl.c
> @@ -440,6 +440,11 @@ dt_decl_ptr(void)
>  dt_decl_t *
>  dt_decl_sou(uint_t kind, char *name)
>  {
> +	if (name != NULL && strchr(name, '`') != NULL) {
> +		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
> +		    "in a type name\n");
> +	}
> +
>  	dt_decl_t *ddp = dt_decl_spec(kind, name);
>  	char n[DT_TYPE_NAMELEN];
>  	ctf_file_t *ctfp;
> @@ -637,6 +642,11 @@ dt_decl_hasmembers(const char *name, int value, void *private)
>  dt_decl_t *
>  dt_decl_enum(char *name)
>  {
> +	if (name != NULL && strchr(name, '`') != NULL) {
> +		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
> +		    "in a type name\n");
> +	}
> +
>  	dt_decl_t *ddp = dt_decl_spec(CTF_K_ENUM, name);
>  	char n[DT_TYPE_NAMELEN];
>  	ctf_file_t *ctfp;
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
> new file mode 100644
> index 00000000..e43e94e5
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in enum definition tags.
> + */
> +
> +#pragma D option quiet
> +
> +enum foo`bar {
> +	value
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
> new file mode 100644
> index 00000000..3e0caeb5
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enum-tag.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a type name
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
> new file mode 100644
> index 00000000..3f786e58
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in struct definition tags.
> + */
> +
> +#pragma D option quiet
> +
> +struct foo`bar {
> +	int value;
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
> new file mode 100644
> index 00000000..b071cf9c
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-struct-tag.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a type name
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
> new file mode 100644
> index 00000000..5e504cf5
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in union definition tags.
> + */
> +
> +#pragma D option quiet
> +
> +union foo`bar {
> +	int value;
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r
> new file mode 100644
> index 00000000..7f35b11c
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-union-tag.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a type name
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

