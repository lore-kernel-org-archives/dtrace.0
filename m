Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD42EA47D
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192444; cv=fail; b=Y8AzSHOP8oeLx0o8hToEsDJmCFML1aXiPlu9GSPX/km2yQMOhvb3nS9zwhwvIfFmMp0hDy6N2ExpCwUq3kM+MNvZyQ72illKzaJ4A2rrGZctXjXkJK62aXj69Jz8iatrGL6MRdktqO58JtsumsKxRQDokWFzioB1VJ/QZZSxDlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192444; c=relaxed/simple;
	bh=oMiCPg9AmfVaJ9FvfIl+qBLcvSWU/C/OVzR/TLa1C6Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pgvJH/8ci8MYXC5Usuj/JNwE0D4/Uw6nHFa2+wNZk/qLNWUl+lYe3y3iQh8XKfBJ7QHxH+V9FdnPG6XyQ1Fjy6y9X9/RWCfCOfMP/4fKvkHUmkVtcocJd0D9MSpE6nC9BMgfSshQUTCak484TCDldXHKLq9KBvk3OJitz6vRlZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FnRxfE5/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xSjXm2t+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FnRxfE5/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xSjXm2t+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TAR9024398
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pvGKKJf0FIkDpgL9dqxuChCUVZGU16wxCd5KUkIdWKw=; b=
	FnRxfE5/aW4VB7sbduOB3TziGjdtQZBzgSiZYOswC4H/GzSQYIvgZOtWPT41mc/j
	lO9Jw1FF7X9DF2EWP2KwTUk0Bk3/D+7gXkakG6v+eyTwa4yYYd8NFgIv4Z5kupsa
	9l7BdisCPcGlvGzqahVMoIzi3NyZJzzIxPmFP2xSjhAVoI7KPkzomfxhx2DvXMZ8
	uC45AzoLs8dXOGBjVsBZmK3bZQO50umqFnjq9gbsrdrxDi0JS8hS9Ansa6EsJHQV
	WFJM+Uyg+PAZQEN1+9KI6irtMKDFilIXtl4Ryl8diTNKXr3xMfyYSLM6w4I/v4Y4
	hCC5iwbG1u6tD6Brg2Wc/Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qwbrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:54:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDT8VS010414
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:54:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9c0bj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoY8BHIPc4e12sqzbJDSmxgl1pmzq4RJG6wi2NvfXErXKcENdTGeZyJx0+fg6U0gBunvMUKHTlvA3pfSfnUIgXgtcs7aOAqLY1aLVCbYTQVPfnwFJ08zqWViNUAc/n2zdFqlgqjBHQGzfB6k8NyMN/e4PInd5CAc31bLl2gUPZtgzfck3ne1djyJRXU2byGhqyQ3VpF6hqqJ0fek8QcmCoeYeS9f2t4gH8IVlip6Q0nVtLKjkpGqAesVCHIWtFKFoxB7eZmLyUg0HecmbCpwnOgvlQ63NIbL68mzenU8KZw/4TzgjPZ/TDUqM5KhPwBfNZxzABp6FB4FkdGcGeoBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvGKKJf0FIkDpgL9dqxuChCUVZGU16wxCd5KUkIdWKw=;
 b=ssWqKYYw9gt79KLwtFBwRJx+Uf5QEWH4jyGP/bZGafmfccxItqSHeE4k8xLLFR+BKRbLBQdrHp3+KCJMxzOwwCsuvcVxHeFx0r9aG8lgLGk4acKL47cvTiERmb+Qa6qYOGGLnZSx0sp67mDIFG3vUTklBDP23i+SYGreQh2i+wOomfXTWdPkmVW5bJ2LQ4NknV+2/+BptpVudlSRcHtHdrb6upNvmR2nHsdEwESbPMfuN+zZwwqs+JcJeKYzPtAv129EoMM1U8kUvI6Sm/iGMdU/FSudMU0Sy4uM7kharOhKI6bxLqC8W2cN/lx/piYyOA6RM5b5ICWivypbwT04Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvGKKJf0FIkDpgL9dqxuChCUVZGU16wxCd5KUkIdWKw=;
 b=xSjXm2t+iP0ginrMIrjDwOePpNErEH5yXRbDpXQ2GN/FOu+UoDw84zxkYn8QoxkOnZ1cAwgC8n6NOVNV0kh199qBSpScKc4Bp9RhkNVgMlB6adQ/2ersu290bGxvCfASw1TsA1mG5Nu4honShxVtFjsvsCmlaxlIC+lUWU5RlrY=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 PH7PR10MB7801.namprd10.prod.outlook.com (2603:10b6:510:308::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 13:53:45 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 13:53:45 +0000
Message-ID: <86bf59c7-e5cb-4e10-96db-118b77d70798@oracle.com>
Date: Tue, 22 Jul 2025 14:53:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] DTrace TCP provider
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250722100749.233821-1-alan.maguire@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250722100749.233821-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|PH7PR10MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba52137-00ee-4a9b-a179-08ddc9272c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUxTL3lJUnlVL2g3djZMVWxTd3RnL0hWUSt5NEpTa0VESDJnbHVYRjIwWHMy?=
 =?utf-8?B?MTVYMEJkT3FVcmxxRW1QY0Y3UnR0NllCdmc4MHFISkwralprYUJPeWlISDdE?=
 =?utf-8?B?U09vVVRoSUcrYWw3SmhMeVlPMzNRTlNmWkFIQlNNVFY2dkxlQUlZYWxNV3N6?=
 =?utf-8?B?cjBSbjNDNER6QS9aQ2dzTmJQb2JhdVpHeGxQUXFnRFBOMkh6SXFRN2JXYTRr?=
 =?utf-8?B?a0k2R1kva1hXY2RXdEhGL2t2R1hwR3V5MGZxYU9lMFR0V0pKN3RiT1RlYlJZ?=
 =?utf-8?B?dXVGemZGSjROelZtT2tMU3ptbTdKZ2daY051VkRQQk4zUFRYaXdndUV1YWYx?=
 =?utf-8?B?UHZURHNSWnh1MjYvUjFhMVRyVVNTWVY3RHZnUktCOGFmaFN1bEY0TnNBem45?=
 =?utf-8?B?b0xkaTgvUEJBSnVraklNSVJRUVZtb2RFbmpIbnIxTjB5ZjlQTzhYTFJqTFdQ?=
 =?utf-8?B?K1BIbXJ3Mk5NdlJoUTJHcDJ2OEJkY1ZJdnJaZUJaZlF6Sm04N1pJb3JYcWYx?=
 =?utf-8?B?am1HNFB2SmFrdys4RllxNlNjY21paFZKclNyWHVVM2l3MUpXTWdYZUh4VVpJ?=
 =?utf-8?B?K0wwc1ZtYkdnTDBtRU5oRGdFcmdKRkNjQXUxV0FCNHJyT2tudkdFVUQzNUI2?=
 =?utf-8?B?MFQwanoyR2RDNnBwblRFcnp6UXJ2NzhZQ0FMS3ZwUzBXMHJ5SDArb3VsYkpZ?=
 =?utf-8?B?UjZMWXpoSWxHRVJIeVIvMURrZ3ovSWlSRHpZeTdHUkhJMytWYUdKSXlDTkd5?=
 =?utf-8?B?Z1JNZzNtamtPZXc3WDE3NUpqN05kbk5FTXdIKzkwczIxOFpmMmpqUVVib2Ji?=
 =?utf-8?B?ejhKbGFRR1NuTXAwbmp3amVETytmUU52L3JwZ2NBUXIxQmRwZHdFSWdMMi9k?=
 =?utf-8?B?cnpWWm1kR01PVlJMZjB1RENWcmxzUmJwWDIwVStYNkorc09Na2EyUFhidmlo?=
 =?utf-8?B?SWRTR2lyUUhDMno5ZEJBWFZGeUZzQmJzWmpZM2NvcFRLcnRGRURxdFBjdmRs?=
 =?utf-8?B?Q0JQczJJNlVxWEFBa0duZG1vSXhLaUYwOEY5cDh5V2R4QzFpQnQrSFN3TXRp?=
 =?utf-8?B?bG9WSXFXVjJpSjZZcll3Mkl3SWNEMlNuZWNuUWlUQ2NDaXJWRFdTWG5ZTXBi?=
 =?utf-8?B?MWw2eUV3ZjIyZ1RQVjI1N2hGTzVPQUFXaXAyVm9Gbnl3eG5oQmMvcE5TVG9G?=
 =?utf-8?B?bFZCMkZwVnlQejdiVXQzY1ZKRlhhR0FYN1VjeEVwbkpyZmxpOFYwd25VWkEy?=
 =?utf-8?B?a1JhUG9aajlWWXBQR282ZTg1VWFhZVNSRFNVSnNxN1VvR2pEbW5CY1BnZTZH?=
 =?utf-8?B?OUNDVkhZTStxdXRxeUpodzB3ZWN2VU9hVnowYVlxdUZKNEdvKzVHa3ZaMUpC?=
 =?utf-8?B?K2xIU0k2NzF0dmlBK3ptRzlTSE5ZSVMyQytIK0NqOGFSUHE5M3pLckJOUk9L?=
 =?utf-8?B?SStUaFQza09Zem1Yby8zYXQ4SWVITnE3U2F4bkJkMGZXbnN3QkNQd3ZFOFdY?=
 =?utf-8?B?RFhPMGliWnBXekEvT2xkZ2N4RmtvWkZLaGdnNExNaXRUaVZwTzB5ZkZ6UUVC?=
 =?utf-8?B?NDNhT2h5aU9Na2VFeWhZZ1M0UWo0Y0FQVTBBbnBhTmd1ZWtyTlI3YXJ3MEVW?=
 =?utf-8?B?OGc0dTlOR2lOdXgrQzFGbGxqRUpIQTJrc000VlRkS2Z3aTg2RTduMjIrODdq?=
 =?utf-8?B?WGdxN2lWajdTRFFtMkY2WG9Uc0xub0hlVjRhVG5KbWtHdE1DTnRtNklMNndT?=
 =?utf-8?B?bzFrd1AvL3BLaVFETHN1RFBCcWhUeldiYmhWL041R3lrTjBFbFNUZ01YT3Jy?=
 =?utf-8?B?MUE1S3J6U2h2RHUvakJSdWUxNXY0UVNzWXY4UVdodWFGU0FrSnl5QWpCYlpE?=
 =?utf-8?B?V3FmRHhZQlN5REUwL2F0OWdCTS96NURpRlhlcmN1UkpmaFNPT3Iyait1Qjl1?=
 =?utf-8?Q?I91GHi9CoyM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjRyVlo4TXZDd05UaVUzVFlXTjdHNkMxSytua2tFQ1ZJN0plUVZvTlR3SlFO?=
 =?utf-8?B?bHR2YklNU3BNTVFqS1VwNFpLTlVLUW9aQk5IbE5JZGM2L2hHUnVqb3VPNnlz?=
 =?utf-8?B?dVQzQzRSaFhhZnFJa3FwR3U2TmswT2J4VXRBUzNESy9JTDVLbXNHa0JPSWZt?=
 =?utf-8?B?ODBRQys4TmpSR24xN0JNTmhrZGNCaHk5Uk5idU45eXB5SXpLK3pMS3Bha1U5?=
 =?utf-8?B?UnlYdVVIU3ZyVjhuMzBmNjBadXBsK3pFak9lNGF5M3Y3OWRWY3NYTjRoQUJi?=
 =?utf-8?B?K2dtRDg2QWZrdTVwLzFFdjY1SkFlbWt5cDh0SXdwUThYUkV6aHJUNDhBNmNu?=
 =?utf-8?B?TXQzbVlQQkRtTDlqbC92UXFCYndQR1N1YVQ2WlI3VVNlbWd0bGNpTlJkeCsz?=
 =?utf-8?B?WHJSWXNNNnFjLyt6Um83OXoyQVBTczFBUXhnWUdSYk5rZHlILytWNUVTNDlT?=
 =?utf-8?B?eTRnV0ZOdkF4bFBneDcvMDdpMHRmZG1KUXJmdFVxbEE4cGVsV3dXVGpoK1VY?=
 =?utf-8?B?R1lnQTYzSWwvSjM2d3NaMVhucnp1SHE2bDVBcHRwZCswbDRKa3Juekp3VDBu?=
 =?utf-8?B?YjhEL0YvdnB3dG9Ba25KN09oYldNN2VRc3BmRjd5aGlWSFg4WVFQRGZaQWxB?=
 =?utf-8?B?WTNWVGFtTkx1TUtvUjNPdDhrbk9RU290ZisrZmgrdnk0ZFloU2pmb2hUeno3?=
 =?utf-8?B?dXI0SHlRZS9Hb0tVS1NlcnJhZDRrVCtJTStjcVdqWURxRmFpUkRUTnRGZUxW?=
 =?utf-8?B?WW5pTUhxVno1elkxNTJ2TVZEdXlRUnlCMTdTd2pRT2l1MlRvV0JLRUxSR2NR?=
 =?utf-8?B?UXFpU3I1YzR6VmprMGJONi9LSTZnTTM2aFB5VUlFUjBpa3gvamIzYnRmOWdO?=
 =?utf-8?B?WER6cTFLVThIZUxoUUpyL1dpMDJGaHZEZ0N2Q1Z4NTVmeGZKclI2SUtmR0t6?=
 =?utf-8?B?Wld5UExmWHNBOGNlOTVCTzhJZnNRaTlzS2E5eWVuQzA5UXB5aGwrZmwvNk5J?=
 =?utf-8?B?TmRscjZGb0MzMW1mM0ZsOVlqZEZyYUpac09laHhvSG9CT1lOWHUyYWJsTmpl?=
 =?utf-8?B?VHFqeVV5SnZUd3V1U1ZpcVAxdmh6b0Z6VEdBWjA2Mnlvc1Bhdm5vVHl3OE5R?=
 =?utf-8?B?aUhPQUNDbTBaRFpFRUFJWnpQK1dOeTBqek4zSTV2NU9rT05CejlFOFR2a0hm?=
 =?utf-8?B?UnBTRnNjRldiUHNNZkhJVHpkc1puMU95cDhXRTZHK0xQd2wwYzNpUW9YT05K?=
 =?utf-8?B?TklpTHBqMG9nanBaSVRQcVZUQmxDOFIxTUNVSTN3OEU3RituaUJnQ1FTNG00?=
 =?utf-8?B?N2NlS3NNOUI1R3NhNkJiOU4rQmhkSEhHbnVacStsUEIwWC92RU1TS1hxMjVm?=
 =?utf-8?B?ZmI1cC9NeW43REthd0VrVkVRZlFBaE5WNkc0dGFZVUJXeXp3ZzFFVndKakEz?=
 =?utf-8?B?N25wWk9vRldFMzB3UUxJNENSZ1RQWlVCcitaMm0wZFZOVHcvd01kajJiekJ0?=
 =?utf-8?B?VElOWnBtMFY1YnpDK1pyWmlYUVdyeGJOeDFyMVhHY0l4b1Jnc3QvZzFxZ0Ux?=
 =?utf-8?B?K01hbElsSnI1YU9mNVozdDd1OVNodnB2KytIZlM1SmFMR2ZETHBadi9NYkZ3?=
 =?utf-8?B?WmhKekp4dmJZWHN5WmMxZDF1VHZ1aWMxVTVhU1c0c3JNa2RMUWhqZnFhaXR1?=
 =?utf-8?B?b2p6aHBPdzJtT0E1d0lRN0hOUVdFajVUN3FUamtORkhqb2FON1kwUDQ1N3No?=
 =?utf-8?B?RVZHcGw1K0REc0t5dkJodjNOM3JSUEJMNTNnK0ZhWWJ2ZlpaR1l6NlZiRTZS?=
 =?utf-8?B?M3VyRkhaTU1VaHd6VFVJRXJIMlNHTjRRTUNtVWhXcmFMcWorV0NTNmV5c1g1?=
 =?utf-8?B?RHpacUlPSldBSGROM0xZcTNCdCtTNGhRV2hheHFPdVlvUnc5K0psYmdGL0tz?=
 =?utf-8?B?NWltNkZvQXlablpXQzRqV0ljS0pIZ3ArT0ZJSmpRQXZmcjMyUDZYdWlaTkVQ?=
 =?utf-8?B?YTdDVnNkcWdJM09ieVpoZURaalR2cFlIV3pXMzR2TFZreHJGbnFNNHNzWHBi?=
 =?utf-8?B?YWMyY0U1RGpSdTB0bkgwenRiTEppYVROVmFOcXNMUCtNTFZwRXRQcGU4OTVw?=
 =?utf-8?B?c2NLeXlZcFZnZERpOHVHZDNkNHdKNVQzOTdwMnFWR1VaTUxMMURCazI5V3JL?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6MSYT1VXPo+Jqya5KCUxLBwYaIsZQM0SNVNJDCHvtpwYJaVA0S12xJVfGBMOKo1eWGb/lv5Vg7idbFT2I2L/yqIYnlqt/07jkjoeJs2Mdk8a/s4CXx2bsbLzCU77ru6Q0x8MdR715JVJIBMTSmXnr54jhdyvqhQLewrsKSHyQxZprDZsEqACFiyikDskQN7fiy4gOp/fKr5MF2EzYEFcdQy0fjkr/4jGdkMXZiOAPHPnh09EKaz/Y0hqjz3chbgTEQ7QOGHXYjvUtQ10/uPI+EmE/nVxCe4lX3Hb8AUH5eB18Zm8svTmIb8TmrHgWINdDR2NVXA2aeMDhRVsUjzR876wIYnk5JyqpTD8obtMKWgG4WcSWrppmOfglB0vywkFlW6ZIgwLceV6dgV8NNIF3w2LqdOscLiQKt/4PK6o9LMC5kPwQTs6Wxsj0vQ25jtag8G3SZqLJY7ikLNEywANE16lULr/+axntF0gu3SEU5cbKPViS1Hfkg+GRvzI9F8YwRXpW7niSrXCu6p9mBnfVdu02sbydFDnDdwg4MfRoXcSzgq7kKnVzRu4co4S1Jn3td5ym5/VYUcDf/1fuFyISU5vp4STriF2+Y/Rga5Z9NQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba52137-00ee-4a9b-a179-08ddc9272c7c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:53:44.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdgVgQL2oUszwTvx+XVdOsr/oiKzV56PNUldOl147ZUAj9n85lNypg2rVOAmcOFLoO6QMnFddCl2RbLKGApy0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7801
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220114
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=687f97f9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=78y30iisCBXVmPttxnwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: h1g19mFPaWPNUfTqG-DeRrkdBvR-ZGim
X-Proofpoint-GUID: h1g19mFPaWPNUfTqG-DeRrkdBvR-ZGim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExNCBTYWx0ZWRfX9QHvrr+TVDjj
 ZOc0k+4v9hlSuRhb2jK0av+vfIMHTc0vGncq7FnBtLnkYO7z9g3aepFmawL8fyhW5BHHDZPNHrI
 nIzG5qdm7/f40Zev1lHPGLzRSp48UX1OcDMSj3EaHPTlw17/oLQVzTt/+FxBRIhSOVYf7xGmxi8
 V4hS4ank6HfvUVCsgH/Upi/iXg1hxH1NmXdXLXOVW7jTOlX3wrJQn98pG/ILiW5Z71DHzjVGyZI
 FxnwepVLrf+mcmmxxBVAdLtP53xD17NAGn3WkB3E6GG1ZOWJTsiKqZ8IqQZkQoLT+nITCYw5KS8
 SzGQEUMsvEDYrLxMiuI4IzBeHNP/mNVXQBsqbRwuCsJb8B7wUKLilcK1POrz/sonWIeN1oTJTtc
 q6wrvIBg6bm45mZWl4qUfUSJtnhkDOo+k+J6jv2taz0EPwahVMyPXzY9DoAqM7Mfsn1aMQth

looks like this crossed with the merging of v4 + cg changes, please
ignore. Thanks!

On 22/07/2025 11:07, Alan Maguire wrote:
> This series adds TCP provider support, where the probes are
> implemented via underlying fbt and sdt probes.
> 
> Due to the use of the sock/inet_sock_set_state tracepoint, intended
> for ~5.15 kernels and later.  Tried replacing this with
> 
> fbt::tcp_set_state:entry
> 
> but this misses a few state transitions, so stuck with using
> the tracepoint.
> 
> All tests under test/unittest/tcp pass unmodified on an upstream
> (6.15) kernel and 5.15 UEK7U3 kernel.  The updated remote address
> retrieval patch helps ensure tests can all be run.
> 
> It implements all documented TCP provider probes:
> 
> accept-established, accept-refused, connnect-request,
> connect-established, connect-refused, receive, send,
> state-change
> 
> Note that to function correctly this series depends on the
> cg-related patches:
> 
> parser: add dt_node_is_tstring()
> cg: validate tstring alloc/free
> cg: optimize ternary expressions for strings
> tstring: fix leaks
> 
> Changes since v4:
> 
> - updated patch 1 to rename dt_cg_get_member() to
>   dt_cg_tramp_get_member() and have it make use of
>   dt_cg_ctf_offsetof() (Kris, patch 1)
> - remove tslot update patch since it is handled elsewhere
>   (Kris)
> - added R-Bs from Kris
> 
> Changes since v3:
> 
> - fix patch 2 to really use/describe 6 tstring slots (patch 2)
> 
> Changes since v2:
> 
> - document tslots change properly, add test (Eugene, patch 2, 3)
> - move more generic type definitions to net.d
> - retain depends_on provider tcp in tcp.d (Kris, patch 5)
> - use depends_on library ip.d to ensure loading order (patch 5)
> - revert tcp flags to uint8_t (Kris, patch 5)
> - improve comments in tcp.d (Kris, Eugene, patch 5)
> - fix up handling of ip:::send for older kernels to avoid null
>   dereferences (Eugene, patch 5)
> - fix up provider arguments to match spec (Eugene, patch 5)
> 
> Changes since RFC:
> 
> - fixed issues with test failures on UEK7 due to missing
>   SYN_RCV state change
> - moved get_member() to dt_cg.c (patch 1)
> 
> Alan Maguire (6):
>   cg: refactor get_member() to use dt_cg_ctf_offsetof
>   test/operators: extend ternary tests to cover inet_ntoa*()s
>   providers: move network-generic definitions to net.d
>   tcp: new provider
>   dlibs: sync ip.d, net.d and tcp.d
>   unittest/tcp: update test.x
> 
>  dlibs/aarch64/5.11/ip.d               |  27 +-
>  dlibs/aarch64/5.11/net.d              |  31 +-
>  dlibs/aarch64/5.11/tcp.d              |  67 +++--
>  dlibs/aarch64/5.12/ip.d               |  27 +-
>  dlibs/aarch64/5.12/net.d              |  31 +-
>  dlibs/aarch64/5.12/tcp.d              |  67 +++--
>  dlibs/aarch64/5.14/ip.d               |  27 +-
>  dlibs/aarch64/5.14/net.d              |  31 +-
>  dlibs/aarch64/5.14/tcp.d              |  67 +++--
>  dlibs/aarch64/5.16/ip.d               |  27 +-
>  dlibs/aarch64/5.16/net.d              |  31 +-
>  dlibs/aarch64/5.16/tcp.d              |  67 +++--
>  dlibs/aarch64/5.2/ip.d                |  27 +-
>  dlibs/aarch64/5.2/net.d               |  31 +-
>  dlibs/aarch64/5.2/tcp.d               |  67 +++--
>  dlibs/aarch64/5.6/ip.d                |  27 +-
>  dlibs/aarch64/5.6/net.d               |  31 +-
>  dlibs/aarch64/5.6/tcp.d               |  67 +++--
>  dlibs/aarch64/6.1/ip.d                |  27 +-
>  dlibs/aarch64/6.1/net.d               |  31 +-
>  dlibs/aarch64/6.1/tcp.d               |  67 +++--
>  dlibs/aarch64/6.10/ip.d               |  27 +-
>  dlibs/aarch64/6.10/net.d              |  31 +-
>  dlibs/aarch64/6.10/tcp.d              |  67 +++--
>  dlibs/x86_64/5.11/ip.d                |  27 +-
>  dlibs/x86_64/5.11/net.d               |  31 +-
>  dlibs/x86_64/5.11/tcp.d               |  67 +++--
>  dlibs/x86_64/5.12/ip.d                |  27 +-
>  dlibs/x86_64/5.12/net.d               |  31 +-
>  dlibs/x86_64/5.12/tcp.d               |  67 +++--
>  dlibs/x86_64/5.14/ip.d                |  27 +-
>  dlibs/x86_64/5.14/net.d               |  31 +-
>  dlibs/x86_64/5.14/tcp.d               |  67 +++--
>  dlibs/x86_64/5.16/ip.d                |  27 +-
>  dlibs/x86_64/5.16/net.d               |  31 +-
>  dlibs/x86_64/5.16/tcp.d               |  67 +++--
>  dlibs/x86_64/5.2/ip.d                 |  27 +-
>  dlibs/x86_64/5.2/net.d                |  31 +-
>  dlibs/x86_64/5.2/tcp.d                |  67 +++--
>  dlibs/x86_64/5.6/ip.d                 |  27 +-
>  dlibs/x86_64/5.6/net.d                |  31 +-
>  dlibs/x86_64/5.6/tcp.d                |  67 +++--
>  dlibs/x86_64/6.1/ip.d                 |  27 +-
>  dlibs/x86_64/6.1/net.d                |  31 +-
>  dlibs/x86_64/6.1/tcp.d                |  67 +++--
>  dlibs/x86_64/6.10/ip.d                |  27 +-
>  dlibs/x86_64/6.10/net.d               |  31 +-
>  dlibs/x86_64/6.10/tcp.d               |  67 +++--
>  libdtrace/Build                       |   2 +
>  libdtrace/dt_cg.c                     |  57 +++-
>  libdtrace/dt_cg.h                     |   4 +-
>  libdtrace/dt_prov_io.c                |  84 +++---
>  libdtrace/dt_prov_ip.c                |  45 +--
>  libdtrace/dt_prov_proc.c              |   4 +-
>  libdtrace/dt_prov_sched.c             |   2 +-
>  libdtrace/dt_prov_tcp.c               | 413 ++++++++++++++++++++++++++
>  libdtrace/dt_prov_uprobe.c            |   4 +-
>  libdtrace/dt_provider.c               |   1 +
>  libdtrace/dt_provider.h               |   1 +
>  libdtrace/ip.d                        |  27 +-
>  libdtrace/net.d                       |  31 +-
>  libdtrace/tcp.d                       |  67 +++--
>  test/unittest/operators/tst.ternary.d |  20 +-
>  test/unittest/operators/tst.ternary.r |   2 +
>  test/unittest/tcp/test.x              |   8 +-
>  65 files changed, 1731 insertions(+), 1041 deletions(-)
>  create mode 100644 libdtrace/dt_prov_tcp.c
> 

