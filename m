Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C91A316E
	for <dtrace@lists.linux.dev>; Thu,  4 Dec 2025 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829130; cv=fail; b=jut9BaRfA6YglFYZDd5p1jB6Xu9tyNX3Ye7vWFBmFHnXfV0F2+kmck4iRmID8wCtXH0qmeVQzZOdnfUWFnQxXNpxVWGeZZqoMbRAN8hqpO+DlAZXOQ6SrV4AP+g7U122Oh2OdezH6fPi4d+Sb1aE/9nsFgeKoZ+id20j1y4/uyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829130; c=relaxed/simple;
	bh=M7WK4nlJ9348zNicp0jINLVb4JhBj6/UbyTiE0wI+Qw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PKdAbauYeOu/RR5aPPFSX0mYFBQWF3kK3zQLkATspHYMxLFLIQFJG3SupJngzAe1lsrU3ujQ/7lRLKSzISyvEyjNixbSgvjYCzCS2VFFHAJ5hgS43pCbLZ1CDPtEJErYQuGaoyuc/JYqk3nU2hAxWtGMdYIXAYcfzuXTJ8pD8iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dEqUMZbm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZDh+qUdW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dEqUMZbm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZDh+qUdW"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B40udXQ3959836
	for <dtrace@lists.linux.dev>; Thu, 4 Dec 2025 06:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Vq/sKrO79FiKRISI5bKRGkgS9E1X03jBscyG46zUloM=; b=
	dEqUMZbmHrZTHMuRAjdTInX5rWdlugHgv3X9HuWDIxCUWJztAPaqafv0uDrUJV4+
	AHw+/KduhAPj5KGhCZmDlLZEa/aZ1PtpL6TazcLZAR89x++BQIxOdsm1PrlKlfYq
	j1EMiXCwL+CQzXjGmEGJ6M+Gr9AUZk5ZgNY83aJJvzl9rOSzJjD4u2VhABvy8qac
	u/VqB+QltLtjYyygjiM2WwXCD/EQ1Nn0+BliVvIyuk0rjDW/P/0s1CoxoQZaH15w
	GEoxkqqGIcb7Yg94dCJnf8gYtGPSJeBWiwc55zD0qYd+XuGNCCkVOXKd4GgtZ91x
	gWMro0PWijP72h2IJQbliA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as7u7xtj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Dec 2025 06:18:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B45eEGU023368
	for <dtrace@lists.linux.dev>; Thu, 4 Dec 2025 06:18:47 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9f6g6w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Dec 2025 06:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7377pNVly6ivj5XbJej2qO0vVg3n3iWPZQCRaM+NjgKLgxGdkPgyUt9FdS1aBwOyI/qNLaDPOs+c8d/xPsiihQmJT1ydQ03OWIKBSATpcBxOwwFsNzp+7ZdcQZ1b+DSNyvjOq5KrHk3zDLOaOpG+VACYzWSDgw+bH733r4rYhg339MbibHzQCnU2R77ngBaJUjiDGlm832Ixm0pE/r1HTQYOAEGqfCUKpFW5HUI8AQ74ArpgvpuCaRwGtP2LKOA2+H0eNvvDPR32VdE3PesH/tnMwFTTBBGBga2/l12JMrHtGh+FZNI6DAKBaw6GvO4FrxyIEWysLdH+s7SQTSpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vq/sKrO79FiKRISI5bKRGkgS9E1X03jBscyG46zUloM=;
 b=N/b6k6/eXkmdoAvHmKIneDh0Ubdhl+HTJ5UTHxHuJXp/nuylxC+MHg9tM7k0R23yCmNr3C8uWEezUewX4GKE20xOG1WJKxLix5A43T9otoWI/B82VG7jWTKvKW3BOK+Tw1FyzlBaYmSVqs14pY8suG1qn4lrf8YY0Rnwfq7jdU0YCejCyimqebJt86s4oyTVSy1kyjrhaTnSy73XrWn5jrtbpnUAsINRIIpjOl+017lhikuZ+ka6kA1XF06CXThw7Dgku4iXOpj0ONqFuCyH9p3jaBPAck+mj40c26TrL/eAGrNMKTuMlyb2ah8SxPxelnRcbGXha9V99e2muixcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq/sKrO79FiKRISI5bKRGkgS9E1X03jBscyG46zUloM=;
 b=ZDh+qUdWza7/0JOXwFub4hD3YIBatQJ5+2rlDOq+tis8Evm4M9UPD67NmMRUl6VDiSdbPUOk1vBZ9G38rgaLIX3K7gtlkLrcVCrbFCISq7ilD3RTY8cI5b5lpjUeQEX4FJqvKobaOi8izkk4QSkF+6cLtvfIFG6ppRPMy5uKD4U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA3PR10MB7093.namprd10.prod.outlook.com (2603:10b6:806:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 06:18:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 06:18:44 +0000
Message-ID: <5800da63-825b-1f6b-2f79-06fda2e6f658@oracle.com>
Date: Thu, 4 Dec 2025 01:18:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dtprobed: use /proc/$pid/map_files, not the filename of
 the mapping
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
References: <20251202230453.124306-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20251202230453.124306-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA3PR10MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cf2279-78aa-4803-667b-08de32fcfa53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zk43TkNkYW1PS2I0My9oZ09kUm9oeDRNU2ViVVdlSnBxUTkwSHcrdlFQbllj?=
 =?utf-8?B?aHdiTzZOamxST2RWUDBOT2JwSmhaRjhPL3h6TE9NbTlrNkpVUGE4V0t4YVI2?=
 =?utf-8?B?K0hIbTR6YjZ2L3cyRTlzby9nRlFWVnBqNDVzTHM0NTQ4S3N1WkkzNndEb2ly?=
 =?utf-8?B?K3BaTHJJczVPelo3dUZMRVpvbkREUmo2UVhCQWZ4L3NUV01KakNxMjdMby8x?=
 =?utf-8?B?anZxT3V6SnRqZ3A3STdDTi9HenBHSmtkalIyNVpYbkVDK2RVZlR6VlhKeTZU?=
 =?utf-8?B?dHdRNHpreCtBbmFNRWxWa2N4c1kxQTArbk5BVndpR0ZKeXpjUlR1S3p3RjMr?=
 =?utf-8?B?R0JhaWF6ZXFsNkhVMDh3aE13dTR4NTdUUExidW1FZExSRUZvRDZDSkgwNmEy?=
 =?utf-8?B?RXhzME5HbEp2Z09leDE1dTN1V2tsODlDSzdqc2JEOGYwd1FRL3h0blhkTW5k?=
 =?utf-8?B?NWlobjIxY1NhZjFIK0EwSHpEazQra2Q0UElNbzJKWDVwTGIreitFQ09Ddk5j?=
 =?utf-8?B?eDdIQnRCelNadTl1aFh4bExHSExyQ3R5dVNnM3hwU0tMMC83V2JHZkNNTC9H?=
 =?utf-8?B?MUY4Qm13QXh5ZUhkOHArZCtodmVvVWMvTmI1YkNqckVodWZlZi9FOUtrM3lE?=
 =?utf-8?B?UG1lbnBFMDk5ZUd4dm9iRXVEaDFXZFM4K2tqQzdlN3crSFZia05EdzJJM3A0?=
 =?utf-8?B?YThEVmhlSnovQmJhUkFQL0l2bUlYYWNtMVBxSGozaHQvQmdrUEFTWG1vVkVu?=
 =?utf-8?B?UjBud3pQQUVZYS8rd0JuLy9TaFc1UkNOWFpCMEd3SnJlTTlnZlRTREx1SDg4?=
 =?utf-8?B?aVRZcDh2UExYYWpJNjQvL1YyOVBybkRyeEhiL2J2MzNITk40Y0xpWTN5aFRL?=
 =?utf-8?B?dXJZQndCU2k2OWFOYUhTOER4dTFWU0pPVU5RYXhEQU5VRmpBRWtKS3lYNGF1?=
 =?utf-8?B?cEtCdldvQnltUkM1ZXpaWnlmT2dJd2p0R29MMWRTK3M1anFEbEJhZEFQRkg1?=
 =?utf-8?B?TVZoeDVzTURvMVJDWDd6MVltY0pXdElCaitMZkZzTGk1N3Z2cWJzZGV0aFBa?=
 =?utf-8?B?c1Vlb01QMkV4ZFY2dnJkNHhCcVcrMzRiaUJuWTc2SXJsdjRCdHNSUStxcnll?=
 =?utf-8?B?cGtYZm5qbUc5UjZhQzE5WUpWNjZzZGxpc1RqTEtJcThnUngveVcvZzlaeVhm?=
 =?utf-8?B?TjNacWc0NjhQRzFPUXI2S1hkSW45U0NmZ0ZHbGR2NzRvbWtYMitHNFFZZ2tE?=
 =?utf-8?B?T2w2aEVoMUg1anJIZmFaVDZyVmJ5bE5LeFNVVlk3VEUyUzNrVkxmTFY0VDlJ?=
 =?utf-8?B?cS9xN1g0cGMyVmJ3QUlsVjBMRE0rMGVoWWtZbS93djl1UTFHZjJha1Z6YWhq?=
 =?utf-8?B?VytIOXNaYTFzakdQMXozOGM5R3BacDJHdTlack5wdlE1NlFQTGxBcktWZEtO?=
 =?utf-8?B?MGM4aldLUFZVbGJ5elFiaTNjVXlTSjNZdnFzTkEyMFYzQ0Z1b3E5QjBtUjZ2?=
 =?utf-8?B?YU0yQTJQQW1VQkNRVWxXaHIxQjJsUUhDazd6Kyt5NXQ2OXF1eWNZSitPZksz?=
 =?utf-8?B?VE9ZZVB1QWpwS3dpcUZZeXh2UXpUWi90Vm1qUFVoU0VOZWxjb3BGWUJ0VXNs?=
 =?utf-8?B?VTRFSEZVdjRmeDNwQnZJY1hrMHM2Wmp0akpwRGorVjRqdmFhMFUweGJrQkJ6?=
 =?utf-8?B?b08ydHhhUSsvNUpRV2dvK1pLQmNyNkwyeExyMnZOeHpHYWVnRzg0VUlMbUt5?=
 =?utf-8?B?VmVZYzBXSmlzajRzTFB0ZXE1M3FXLy83Q0N1ckZNN1g4cngzbklSMU5FWFh4?=
 =?utf-8?B?UksrY3dOdTBNUXNKQU94ejFPUTBTd1VNVGlZY3JYVVdHWGs4L1I3ZVpiSDJQ?=
 =?utf-8?B?U2tGRHFhSm8yN2tKcDBWUjJ6VE9jLyswblB5aFQwNFVGOC9pMG01aHovSlhJ?=
 =?utf-8?Q?4uAJv28w3uxKUUojGdZBAEXI2JWnTpzt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2V0TWMxNndJb1A2VUVYQWpBTnk5ZHNMWEVXNHhXL1pvcTM4V0drNzhsVFJG?=
 =?utf-8?B?bnA0TW85RXFNcGMvWXRFbk1EMUNkWFZ2RUdYbG85dHZWbHh3T1ovM1dTNmow?=
 =?utf-8?B?NlY1djBzZ3pPWllPUytDeFllMjhGWllNa3FUNU12cXpvU3pubDk3dGZhNlNK?=
 =?utf-8?B?ZkRFeTZpdWFYZVlxK1A4MitzT0dEUUQzbUI4UmVMeDF3SUkwbHpwZ2N2WTFv?=
 =?utf-8?B?MWpHWjl0cGtZZDNEWHhWMDlLemtKL2phYjdhMndROUlWelBkSWpXZmtGOUh4?=
 =?utf-8?B?SmZHNVBEUXc4aGZ3cFZMUmM3aW5OOE96dlg3MUxzdUNROGF1RmJ4dC9jRC9W?=
 =?utf-8?B?REFHUmZCaFBrbTd3dlp4a1d6eXB3Q0FLWnhXQ3ZDWGh6RzRxa3ZqMUV6VXNB?=
 =?utf-8?B?Nk1qd1BaaFVNZUlBRWx6MjZiaWl1Um5GSTNhVkVVdzI2RmszYlNnM0haR1JY?=
 =?utf-8?B?UHFyUXRQUGdtZGhITk0vbm5pQ1hkLytSOE44OE01MmRUVytyOTlRS2R2ZkN0?=
 =?utf-8?B?QWl2MzhJYlZHVm5QUE4weUJkVUUwMCtMTmI2QWxnRmRDOXhoN0dWU0UvMDZI?=
 =?utf-8?B?WkhzS0RUMkJiL1VJSjFpc3Z3NHNHdUZhM21iSlppMUVpaGFmcW5tSmY0SHVn?=
 =?utf-8?B?U05TdllCTkFpbWZIK1UySlBJMm8xQjAxaEd1S0haeHRlbVdUY3lOMUw3QWFF?=
 =?utf-8?B?dFpsbUwvSEpKc09LUzU1M2t3U3VhNXVYN3RXemovenNIbVVXVnMzKzBHSGl0?=
 =?utf-8?B?MU5kM2psOWtMbzJxM0ZSWk02TndjSms3RFZha0xwem9YYTNDVTN3YVVpSHRu?=
 =?utf-8?B?eHU3cS92YVNUeURPcU5VaUxwLy9UN2daRkZ3SmxEbEFRTVBUMS9hT2pTdVU3?=
 =?utf-8?B?ZmlGYkdrcUlkTGFtSEtDUnI2cXhKa1ZkUnZRUDZyeVdNTFJRc0dtVytOdFdH?=
 =?utf-8?B?WngvR0ZEU3lmL0pzZVNxa0VQUWdYMXlOdk1zK1RJYnhOV3pDSHRzcTdFUkU2?=
 =?utf-8?B?Y3AxaFI0Ri9Jb2ltTStsNEJ2UW0xQ0ZwUkk1anBpVjRKY0JxcitKRlBVYkpt?=
 =?utf-8?B?TjRSdm80OG1zZ2pnK1p0cHRkeERRK0Z1aUNHL2NVMVByV3cvbE9oNU9GaGNq?=
 =?utf-8?B?SElMUnAwYmJYZFFiUEtUc0piQ2ppVjlMSUdqeHVXUE1CMWNrYzYrbXJIcXZ5?=
 =?utf-8?B?ZHVNNmxNYStPRU15dHhTcjFwNVM2SVNPOG9xYU5zdDlCQjM2b1FGdllSdm9B?=
 =?utf-8?B?TmdRNHFodUhDUitRWDM4WFNIeldRMmFwQ3hlelVuMEF4bVlCNXlWYXU1WVNQ?=
 =?utf-8?B?WG9CMVF0aXV5eTZmTWh5Um9RbnFONDFtZWE1N0ZJZWRKMmd0TnBOaUlic1dX?=
 =?utf-8?B?d2FCNFhMOWVlMm1iODk2cmtlT0V3ZUdPNmd1eHpvKzZnVUkwdW5PeGt3M3RK?=
 =?utf-8?B?aGFTSUU5TmYvMWZnRzlZZDNNYzhYWmt5WWVmWWRVOThTdnB1dm9QNXJKNSs5?=
 =?utf-8?B?amVLSDZRRXZEOFMrMlh4OVdCaFFhNTYra3VyRXBEcG1waTQ4U0xpdEU5Y0V2?=
 =?utf-8?B?WFR5aC9iS0FXWTdHb08xNnA4aGxVcmNWeHFPVHZjODlVdEphUGF2RDFjTzJO?=
 =?utf-8?B?L3NSTjRtc0thTld6SW9IcGZ1ZUpvRm43dVdldEltNlBiZWxJeENJbnVZWDBt?=
 =?utf-8?B?K1R1V2VRNWQ0bmlTVXJiVWpBUUlhNjVBZGNwNXlIbVpkZXNCSW5xR2JudCtL?=
 =?utf-8?B?STVWZEJRQU9QRnRLUHBSTFBnMHYwVUpOT3RGU1djVUttQUZiVVMvWUt5blJm?=
 =?utf-8?B?Tlhkd09ranUxL0E3QjlBZVVUOHF4ak4zc0lFL1M5emVQbXBnSXNXWU1GaVdX?=
 =?utf-8?B?cElSVXVSYnRxUG1oNmkrTUxmSFc4L1N3dGdxKyttdW5hRlRxVDYraVpWM2hI?=
 =?utf-8?B?eWE1T01GTCtXYWtueTQ1WEtwckkwdVlwbElFSVBhSVA2ZkpjR09MWVVNcHg2?=
 =?utf-8?B?dDhWMkI1SXY3RTVRZFhid09NOUM5RElqcTM1UjNiMUh3TG9JVkpsZHBqZmdQ?=
 =?utf-8?B?Q3BMQkpFQUo3S05Kb1p2NWFKVFFkbkRlRExkTElkNVdwOUZFU3hieEdvcXN2?=
 =?utf-8?Q?Mrev0mrZEaLlf2iKtrYz+XRFw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2VM/3x4oBLZ2F6glplw+7leH2TIYs8CyF7lZX7EjLJx+PzrcyYkkSK8J2+MW+Gk8EtMLA++vyss6ryxTLiqNIi3jWS0djF1kSQs+TZ8GeX3Y9IzZNnrpFjGs90cEPrRir5X8Qez2L8gqS8E7QeqG/23W4/ZPgCMZQqh+31NwHMfTbIlvpmBil5/0vszKGUBgGlW1YxaedHYceTOPi5vJWf6z+ChFKc75cNEblrFuVSLzyL4cks8UsE4GhGMBdtYxCD+q152/WOVp7A+boP/AxvzPpYqosI6TRaOHCX6llEfTBqoy0AwEaMURFkxaZD8JaHN668IhpJZA8qFtyAnhqqOOKuvWDLrUO8A7I2tOu1LvT8ax0H0ingGmWU8lsOKyNfRU/bZx3Ysm/DAhYW94CGc+p2Z7p/Ko1C2tngBl4dQ9HJjHF5F1kk1frWT54lxOzljLpLP0t4JpUALlDoVYvximQzXqKMRwqjos31LvvHA2px72JG2ojtAupeCrWfdkzXAl03+9GlEKA9hjYACBX9x/TAecLEi0JqTasYhpRzqqTHSKD7tuXY03K2nO1Wm1Y85sIbm3gBI2EJF5Zft6UK8wNLqRcPgRrRJBlSGou8E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cf2279-78aa-4803-667b-08de32fcfa53
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 06:18:44.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfUqnbUB6Aaqk84g/5TXJH0mB5hCy0Um4ObnsfWbKRmonD5oc91GyEybDJxYAI0bcUtEF7PJaGStoLkny6K2fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512040049
X-Authority-Analysis: v=2.4 cv=Rfqdyltv c=1 sm=1 tr=0 ts=693127c7 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=sXdEEOMJZd-IZFlGcyMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12098
X-Proofpoint-GUID: vLCTwdTEyduFuLDrpJSJfylk4D6lOMNk
X-Proofpoint-ORIG-GUID: vLCTwdTEyduFuLDrpJSJfylk4D6lOMNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA0OSBTYWx0ZWRfX0O/gq8RWDXda
 10TMi9Xb5f3nehWIqCeg8ppqEQiNlZbtgQtNrnNNCz9c8eVEnOeMoI/vlxLvA8mFCYSvQxxtuhQ
 +tFY4CtYpGPsMP6ZKaoQ5zWt2miECuF3lsOQIYy5LGMpTB0OrzN6mFFz/TcjJ5nlsrIPJJrO7j/
 w8Ua0IaJKTLsEfuIU48eCJrpO4FgwTMdFTqFmveFku5qF+BTar0tX/gxF4CqCjnGlzF8CpTsddY
 qsgjKPd42IhwHJtyT1gclxmjdK/JegMbWJsBLELnTdGj7MIeMt3SVEwcXqsv235AeSCPx9mv/49
 3uxub9JEVjXNZaO83UGyyIxtmDA7HaKWFx6PKaw1R+REHe4kHEKoJ39GjCnJ+Zso4xS/RmjcjZy
 uw+yPa3csXbtAmo7TilmJ1c6uQPpkBS/Nbz5Bc8H9zHm2ihMEDY=

I tested on a variety of platforms, and yes this seems to do the job.

The commit message struck me as wordy and hard to follow.  I asked an AI 
bot for its suggestion and (with a slight tweak by me) came up with:

         Instead of using prf->prf_mapname (which resolves to the
         mapped file's target), use Pmap_mapfile_name() to get the
         actual /proc/$pid/map_files/* path.  These special entries
         can be opened even when the apparent symlink looks broken
         or points across filesystem namespaces, ensuring we can
         read the mapping contents reliably.  This matches how DTrace
         handles USDT probe lookup.

         Fixes issues with probes in paths like /home when dtprobed
         is sandboxed by systemd.

which I like better.  (But maybe some other tweak would help better, and 
maybe I've just been staring at this long enough to finally get it.  So, 
I'm not saying this version is the last word on the subject.)

I would like some comment on testing in the commit message.  At this 
point, perhaps it would be a stretch to ask for a test in the test 
suite, given that the issues (systemd, /tmp) are so tied into the test 
suite, but there should be at least a description of how -- and even 
just what! -- to test manually.  How would a reader know what the 
problem is or how to confirm this patch fixes it?

On 12/2/25 18:04, Nick Alcock wrote:
> When hunting down a text mapping, prf->prf_mapname is equivalent to
> looking at the symlink target of the /proc/$pid/map_files/* file, so
> opening that opens (say) /usr/bin/blah. If we use Pmap_mapfile_name()
> instead, we get the name of the actual /proc/$pid/map_files file
> itself. This looks like a symlink, but it's actually magic: it points to
> the target of the mapping even if that target is in a different
> filesystem namespace, and you can dereference and open it to get the
> contents of the mapping even if the symlink is apparently "broken".
> DTrace already uses this elsewhere in USDT probe lookup, so we can
> surely use it here as well.
>
> Fixes e.g. running programs with probes out of /home (which is jailed
> away from dtprobed by dtprobed's systemd service file).
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   dtprobed/dtprobed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index a808586559d96..9a6928055cd13 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -487,7 +487,7 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
>   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>   			 pid);
>   		goto out;
> -	} else if ((fn = prf->prf_mapname) == NULL) {
> +	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>   			 pid);
>   		goto out;
>
> base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
