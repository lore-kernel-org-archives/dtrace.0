Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AB23645D
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765566977; cv=fail; b=PDwtX8YB3ME4Ceg4ZvnFqcA044wASb0zCDJBESti1/Y6//sdVuXyH2obyJoQjD8ZV3R1IqF3ACiR9yV3BsIMQ7xDApelb/+eSboQcGT8BNTU0SnA+kh8bcl014C2eoyhacJ1g5EbOrYK+Z2iGyoLm6G4/6wqpY891QemRm0vfaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765566977; c=relaxed/simple;
	bh=2IA7UWN8y3eX3idEzb7BY9bsUmKgP7QWKB0SMi+DUgg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jltJD9ubQ5MqdUHuN2ROr8h7vrFoc7Z8lkUJGAAdgvdaBgYQ5qYJIykRQOR1uhIV9T7vbDwEM003y6JgZmMhgbUik8ZOGEB+rMAFEty+p6o9CK64FMsuBut5ey+5CbuiEPLbWDOHJrMQ0lgapQbr/yY0TBjIuRvA0WEVBNys2q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WHXKUThk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xDJpFrdw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WHXKUThk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xDJpFrdw"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BCIhGuV139875
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 19:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=k6OJVSAQUbwY9OTzuhky0HmGLLVeEJI7hsG0aPf5wgs=; b=
	WHXKUThkSn5SZoluvpUOA4XTkm8bVXBCEy796MElfW/1J2F49wMXKGvSp2qoGnlC
	v3HsQ/pN6nfdTVCYTejUhf3Pa++w4kaHXCvSkDbnK5tiG88BYmh6a/Sa6ljL2z3l
	0oRye305CLIaSLfjPWGZ6FGrZszyRvnD/N05zmd3kV0+/WN3oY97iy+GrJ5lio38
	e/CdGZakDhjDZ5Wcvmbyvz4MY7COI+d7lQIyYlRbqHVUlpQ3UzA8ezWN7/b4zgOk
	+MIMyWTFrqdvEkc9XW67cEWlfCoRmqjDCaFJvrEvMe/V4ijFLQsWGLCrUFvbiF5A
	2jc+CGNya7up4MdYtXi+0g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aycne3v1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 19:16:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BCIiCQc020349
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 19:16:10 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxdcjr1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 19:16:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3ofP6IjQ4WphIGt1wgJuK13ZmDsnULyVJdFETbGayY6HMk+OhwC9qY3zKadDsiLAZRP/e3DxG0EC1BIVXxetaOwrA9gH/UtRE+dXMZeF6aZ/ifSlHT6//c3GU0cT9a8vMWpmsQG+iYYDYW3rZ2bTq96kvWVOauJHhjc6MiMY2LQ0ePFy0d67EbxiffSUOHZchXlcYIuVGoK5RSZL5QgN9ILOTie5aGdzu8im53A3NdL8CQX9izgJ0WTah4HTQLOr+i9XlSb6R2j54NyApLR+lddvvQmy0jAEIZCk/YY21pkS6/1p6lZxDEnAOEFExcFsqoNG6C/fB8k2KZk5eweuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6OJVSAQUbwY9OTzuhky0HmGLLVeEJI7hsG0aPf5wgs=;
 b=tSwkPCzS3NGpmjcIsJqjt3VNw5DW4wdzyEfyKpjG13p2zQKDzVg5r0Zo+o7tqikN6ZLuaR1e0yM5QYLFkCqrdALqCuB05168QtaJ/87Uq/9/NyGHXRjn3MPFV4Cy33TChV5EBEIfCuKIw4y8skWayyOcnZvOvbFsRuNZ9dOuSkbDxcC5HZynoQ9GLhv3iY8xINy2wagPhPEiCxTyS+k28nXqwhdNRhOgb/vPwr3i1siaV3xiVxCfg/gT1j8uncQOw3BG8t/90Jyz7szRLwsanIwRW1lfuXoO1BvCCoGLGdZxsNadTfGHWEiwSBc3ZrBS6fevaNjYFCJnlNjd6OU6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6OJVSAQUbwY9OTzuhky0HmGLLVeEJI7hsG0aPf5wgs=;
 b=xDJpFrdwhjEX9mAEAuBddNTX7wyldX0QHZSuWxzLOh6uslsTMEBCTTCud+aGu+0GSbRnWT+crw6IBN25QMIENt32BJVwpg2kXfP7o+hb9u+ppOZLkTVYqsN0pn7Zxne+dU31Iw2brh8wsolKF2Q2j4qzrrhUTzEPrCO4/SCoYTQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.12; Fri, 12 Dec 2025 19:16:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 19:16:07 +0000
Message-ID: <79ffaee2-6f7f-4c08-74b6-866fec007c99@oracle.com>
Date: Fri, 12 Dec 2025 14:16:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] bpf: allocate the buffers BPF map to fit
 highest CPU id
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <31311402-ac1d-3c3e-4e2b-5e0ae861deb1@oracle.com>
 <aTubzAk0Ls/rv9vk@oracle.com>
 <0d4939ad-ad66-4b84-753a-288b2096d212@oracle.com>
 <aTupZ395993j8Wu4@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aTupZ395993j8Wu4@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f96127-e88b-4d7a-3cf0-08de39b2e6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmFHVVc5NUMvQURhM3R3SERSY2V6c3ZBWU96eSt5Y1A5cjVYUnZxdldKaGpx?=
 =?utf-8?B?WlljenRRQkRKOENpa1Rybk5wS3M4SXByTTZGZWIvbVM5TDAzV2VGRmpmcW8w?=
 =?utf-8?B?cGZCaFNmL0lsUVkyQmxwNWV4ZmRka2YyVWFyY1g4VGt0M3dkV2NxSmhRNWlL?=
 =?utf-8?B?SEsrQVY2TkdsS1g1d2JTQVdMeVBOQkEvM1ZjbE5RaDhReVdvOUUycWlDQXlV?=
 =?utf-8?B?WXBsTzhQK0RzS3AwWmZZN2YrYlNEeXVYOG13anpIaS9ZM3Q0VDl4aGhEWTRR?=
 =?utf-8?B?aTFFZnljYTNxUUpYTFIzR1JkSytFRHFBa2s1cHhDaEptWDlCb3NNZ3VrWThO?=
 =?utf-8?B?WWxuMHRkcSttNWlPZ1dsU2MwUGdHaHdyNDBBL2hpUy90ajlyVVdTVk5xWkgr?=
 =?utf-8?B?QnEzWHJVNzcrZ3BReHJUbU9jMnIvbUF2Qkx2R0tiK01LTk05bG16a3dRU2Nv?=
 =?utf-8?B?R0hMZk13ckJwMWR6N2JyY3F0SWc1NFdIVGtUbVcyRXBYR012SXpiWHUwQWEv?=
 =?utf-8?B?ajNVM1VhcXlOYWVxY29zYlh5a1RVTjBxRENYRTd2azIzYlk2N2txRkcxMHdz?=
 =?utf-8?B?VzlXMUpkbUp1RVUzeVFVYjk0ckEzQnk1citDQXpENWFWQ3NlNTFJUTRuNG40?=
 =?utf-8?B?UGRRWTduZ3BCd3FmaXRRRzZsemd0ZS8wZ0NWbzRNMDYram5naGZDNGYzbkZL?=
 =?utf-8?B?L0I0MEwvZ1dsYWpTWiszeUZVQzNJNFpvdFJGR0ZNSWIySzl5YTNob0RZdi9j?=
 =?utf-8?B?ZmhpdEYyYzFqQ0J2Ym95T05HR1dvVkZ1SUlUM0lENmpDWUpyUkN5THQvaENx?=
 =?utf-8?B?SVJrTksvZHBoVy80bkozaytnZ09aQ0hmOUxsaTNHNkxGZFIzSjIycllVQW5V?=
 =?utf-8?B?aXRFZGVJS0krWXVDU1NRUHdoOGFQM1lZRExnRnBwY3hmUVk5TTJqOXZFNC9B?=
 =?utf-8?B?VmY5UE9pK0RJWVlsWkp4WTlxN0xMckpTVUhCVlNYME42dFY3U2VvalVSLzFO?=
 =?utf-8?B?cEJ0d1dlYlh2S0ozSlh6MXlwNnczMHJPQWgzV1FtMHJsWGNTR3hSL3RTVkZn?=
 =?utf-8?B?R1lJNXJqMlM0YjZDTkYzaGo2SHEyVHltbWVZQTBsT3hEdTg0ZFRWenUxYXBj?=
 =?utf-8?B?NThVYmJTWklMNHZOamQwaVJGeDRaa2VkNTAyYk1BYmV6WC9NYndEMC91SjE5?=
 =?utf-8?B?RlpFT3dyekpIZHdic3BiaEg4Q2N4c3ZHUmxmUktpTWtPV3pmV0J2bGh4dzJu?=
 =?utf-8?B?N1puTngwZ2lTTGkzQmVqaTFZVU55MExmWnhzQjBSMTZya2ZkaUllVTRjeC9i?=
 =?utf-8?B?MmlyaUhhQ2IyU01CNmhEOWJPWlhWWnE0L2FrNi9iMXFpMlhybzlmNzFKdFpR?=
 =?utf-8?B?cWo1UHJ1VDd0ZWY2b3cwVHZubHJJR0ttOUNleHp5TnlEaHhKdVlHN1hka2sr?=
 =?utf-8?B?WExaKzVqTTNmL2pwS21zekQ0aUNNVURBWjFJV2ZJaVg2SjhQSFd3VFRyS1pR?=
 =?utf-8?B?OHo5UkhxMmNYaDhzN29QbXlRbHVEM1RSemRBNUdieXNJRncrcFNWdzRKSXRw?=
 =?utf-8?B?U0U1S3NzbW5DcTlxczVJMkNabnZJb0kyV0xNOFN3OEpFbFQxaSt5c0NUUkJq?=
 =?utf-8?B?SXJrejc4UjBsR1A1ZkpCcHF3Yk1WSENWVi9oN0hjWE13ek1Cd0E3VTM0anRL?=
 =?utf-8?B?TEZ2blZCaUgzREZPR2FlKzFJNVNDcVFPUzkrb3RZOGovdjZUL3BQOGtIb1hP?=
 =?utf-8?B?R0kyNEhheUMwU1pKQVFENldGNm1LemdMSGxnSzlod0VpMDJBclRQdytTeCtS?=
 =?utf-8?B?R2Q1Qy9sak1uMzQyWDN0QlVMQ0tlTytzRUwzcE40SktHcDV0YkhIT05CaFZP?=
 =?utf-8?B?YlBXcnQyREU4dCtER0ZBZkV1RjAzNHVVL1pmL2xyRjJJSDhiRUhzZHR4V3FC?=
 =?utf-8?Q?0ZFnkwbzQID2l42KOujFUy9TrrDyymXx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUVIdWUrZlBTTWhUYTZzUmRtamFvRnA2V0YrQUVSYmFjRDU0bWZnRzVNdFVV?=
 =?utf-8?B?VFVmV2NMNmM0UTdXM2lDN2NMK2J2YklmOTQ4TVJtSGxRbnRjSnVLbmI5OEIr?=
 =?utf-8?B?ODh0N2s2dDY1L3VlS1VsbExtMVQxdEpLeWw3VW9sYnFFakhoS294MlZjaUFH?=
 =?utf-8?B?aVBLNTg5TkJnL3ZobndKZzNsa3kwZmhHMEVNVjBCU0xOMlVUL2gwSm9SQThJ?=
 =?utf-8?B?WklQQUFjeUlUTzdZZVd0QU81QzdGMzllNXNWTk5tZjVma2NoM09FbVBEUGlP?=
 =?utf-8?B?S1pjZ1lKOXp4cWNaOG9xSUFkNDducnVZTXQrc1QyN1ppS0VpWDk2d09PaFRv?=
 =?utf-8?B?Q2hrclBhRThheGdnU2dMODk2QVRIQXUwWk93TVJFUEd4UzkyZ0NBdG9TZko4?=
 =?utf-8?B?cEdCOVlhTzFyVHFWRnE4bk0yRnQ5S3hNKzNKa3pxbXAvMzVhbWZ5VTFNSE4v?=
 =?utf-8?B?K0NUckovMkhxaUZwcnI5SE95RC9LMldnclpVYVU5cnVDaHJQSHpEM0RlUmk4?=
 =?utf-8?B?WUNjU1lmZEdKUmNXWGVYTzVtdGJScDRNdlRjZXZTY3M4QWhqbk9iZkV0V3R5?=
 =?utf-8?B?MXVqRFY5VVVnV2xsYm5oZE1yNzE1SjVKbFRZMXJaZzNrTmVIMWFOWUZJa3dH?=
 =?utf-8?B?dUhQbGIxbElvbDVicC96RUlRc0t5SHlVa1ZvTk5kOWZ6TXNJTVFDZzlQTWQy?=
 =?utf-8?B?alY5eERRejRvMWJHakpVUjZjdGVOQXMyZERPbUZpWklVM1BHU1hoUUZ1WWVG?=
 =?utf-8?B?V2J6cFkwT25qdG5GcXE3Rlh2Y3gzTW5sMFM4OHljaVJYMXFkT3l5MWIrby9U?=
 =?utf-8?B?TnBLRlV1VFBNZ2Q0UXpYRlc4RU9vYWJtZ2Yrdm1SUTlwR0RaUlMxMUNrMzAz?=
 =?utf-8?B?Y0hzSVJ0RkdNNGIzMmxGMEZlZjV0Qm5wR25aQzhoTkovdEg4MmxBTG04Y1pl?=
 =?utf-8?B?RlpoNXc4cEludU45NVBBdnRCU2xkRSt2MzdhYjhpVmFRNGM2bUwrc21qTE5L?=
 =?utf-8?B?cjNRL2VLcGRxeTUvd2VITnRWTFhBV3NzRmpjUldVWFltNExIaUpFb2x3SEF3?=
 =?utf-8?B?c2hHR2xhMDVLTGpiS2svMDVnOStiRUhnQUVkU2F3UVNKVzlDNDRucEZVSjF4?=
 =?utf-8?B?ZHdVNmhjTStWNmVqWGhHRkc0SkF6ZnQ2TEJ1eVY5dysxOXJzVkpvMHhvaGNW?=
 =?utf-8?B?TkU1TDl1KytDWThUaXA0ZnU5UENPZ3hVM1ZhZTgyV3N2WkhkcDJFdDVvUEhW?=
 =?utf-8?B?by80ZG41Q1pTSVkxRmxWdk9qY0NDZ3dtQjR2WHQzSTJXZGhLQi9Sb3pPSUJY?=
 =?utf-8?B?TTMwYWNLMGZlVjRmeVZDNHVoVEh2Z2xUaThuWDRMOHZZaHNzekVnbGxOQWs3?=
 =?utf-8?B?bENMMkNVUjFId3FuK3plMVBROHRYTFVma0U1TE1DMXFuSGRvK054WDZIVmhC?=
 =?utf-8?B?TWtLVUlaUEVTVmpUdkR6ZS9BMzRVYkE5ZTA0b2dyeUVJbkk2QWlaNHdtNU14?=
 =?utf-8?B?ZXk4ZU1qcGpqWENmUmRRME1zTmpmclFnRTJiWmlJNmMxcEE1TXhFT3Rva0Ny?=
 =?utf-8?B?ejFUNDFFTmk3NGpUTGdUTkhZNjM2bUVDOFFFTmZvbEtiQmFwRTdlaW9oYy9r?=
 =?utf-8?B?andEbXNqRkJhT3d6U1F0RDBmWHd2ZFJaV01XTWlpUEtaVzRCVWpEejNnTXc2?=
 =?utf-8?B?Yi91VGRTS1BmZiszTVg3b0dRS1hUVERIeGVTMVpZRDFHYTFYQldhcmVDcDlV?=
 =?utf-8?B?UTdIMWRURVFPRmt0ZGRoTWNsYTErUzZQWkloeGxYck5UL2FTaWZyN3p5cVZS?=
 =?utf-8?B?aDlJS3lBT0NKY0R1S3ZUemNQRU9Ua1RWdFdRblNsdm1RRktwUUxCQWdPUEMr?=
 =?utf-8?B?VC95OFo0ZWw5STJhK05ZQ2locHdaYktrbXJITEwvTGdReDlPeitSdjU3a1Vu?=
 =?utf-8?B?VmtXcU9CS0p4TitkVnY5UnZhTEVMcmp3VDZvMUFmVVRMZ0F6d2xma1dvOU02?=
 =?utf-8?B?RGJORGNUZVlpckxGOUE2WkQxZ1FDQkJwSzJPOHdqRmlMR2kxcnp0c01YejFG?=
 =?utf-8?B?NEZuSGdyTEIrRy95NWowQkk5ZGZvcVVONGR6VUs4ZEpGN21JaU5vMEt0Yk1l?=
 =?utf-8?Q?vV3AMN1E/1dzAeYn6UW23ynxc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I6ajrTRAlP+ALecO8/MpWl1C6RVf3ocykGUZw57gPNWFKlWt6cLt2dJmnoljdQP/XZbSCDhry/fjUtmwQZ/eh50+t0pJ1gTQxidwSvBMWzOREtcUH5DXwptdTYro5n9JBC+A6ERIk9oIa+DwxL8FeGsLXZ9eawQUvyRGbQCyyePMJCoeJRwuavdW9zHJOvZvz0T2XK4Xzcw47zwFeDfD6tqgzdZe5O7r5Wtj6weS6SxM5SwZSBic5yBZv01NEgzbTPP5zUg//Jvbyo90bZtcvMej+9r0gqvVzXM0ltpGo9YvfiqcTEuzXnVZMNkC5r2xXEGVLpMRDW4hew4NX911agjHMbUzB7Q2lwiEhfexOvdHdIZhOzQzZzdQRBiFTM2QnH7bcsCHHESuPOWayz3vvYy7RB9DHNMg0Th8YTfbtQsEVK860eDRiNL4TRGFCb5SjkKvwBYfhP4rkSznPSw5QhD4S+iFS6qUxIZTSlSh4e+flSf96xgN7c2976unT0g2ntGnR/bpGYJFgsVl22XqkH9p69IUFgybvKy36zV0ekVWsV4wuBrXH82Tchjq8zQO4K9+eQJ+55hIxYdiDbFfX/2NABvxU0k3NmQyaJWTCE0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f96127-e88b-4d7a-3cf0-08de39b2e6c0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:16:07.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZD+PkC14jp887kfg3BO/0aDQGXsJ2e6GlVHGBWectbrSXSQwICuQ2d5zY2B6Y0F7z6ZWjjS/+KYWpZ13B8n2Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2512120154
X-Authority-Analysis: v=2.4 cv=F65at6hN c=1 sm=1 tr=0 ts=693c69fc cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QKVzQPCnYwQaGkJlhHYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pgF9uELzje9qgp1boaLAEMI9ilH1JhIK
X-Proofpoint-ORIG-GUID: pgF9uELzje9qgp1boaLAEMI9ilH1JhIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NCBTYWx0ZWRfXy/zzFeO9wiE7
 FXJb6fyhjYWcxJDAsTWlkOnMbpSh5Mnxp1YrdrPkvtQtuZI7F3HsbIgID/KA15BUzTCW23le8Kh
 cWOV87s8eDd6EJZ5hvfObKI4RkMy4FykyDtlMB52XqFPwqauxZrOQFMFn8/RktsqTPDlUnVcUL+
 7yYs/5Y5/OtbJZw2s7lzruZwJnHqG7+HJQXbtbNlApx1gEfzx7WxxJK68QtOnOY8XQyVTF1glQD
 EIqHt8QGIYEkBPrtJNQ04Y0giWZq1WQPfuFEieMb3fYzCoNxqFlykiY/6wH3G4gVOjc9tM+zLnZ
 syBGZIaCPJpgbEHfcNvucvL3pK5adFtNlWLFXlhRR+hMGloP4/UzZNnTko8uf1B7e+dJdjEyGOw
 Ov/2rkyN2D7E1g1eXMOGnj9tkYfQcQ==

This patch is clearly a step in the right direction (fixes a bug), and I 
do not want perfection to be the enemy of good here. So, if you're 
willing to add some remarks to the commit message that describe some of 
the issues we're discussing here -- and, quite frankly, even if you're 
not -- I'm good with this patch.

And...

On 12/12/25 00:34, Kris Van Hees wrote:

> On Fri, Dec 12, 2025 at 12:14:20AM -0500, Eugene Loh wrote:
>> On 12/11/25 23:36, Kris Van Hees wrote:
>>> I am not entirely sure we *can* test this properly specialized configs.  The
>>> problem came to light on a configuration that conveniently demonstrated the
>>> problem because of a large gap of unavailable CPUs (0-127 possible, but only
>>> 0-7,100-127 were online).  Because in that situation, it is quite likely that
>>> the CPU on which the events we are interested in occur falls beyond the end
>>> of the buffers BPF map.
>> I think at some level we agree that it is possible to test but that it can
>> be hard to do so (automated, regular, etc.).
> Yes, but quite difficult and very specialized.

Difficult?  It's outside of our normal routine, but we can get access to 
such systems and we could devise tests.  The problem is not that such 
testing is more challenging than other things we have to do, but only 
that we have too many other things to do.

Specialized?  The distinction between on-line and possible CPUs shows up 
in a number of places in the code.

Anyhow, yeah, let's try our best *and* not beat ourselves up on this one.

And, of course, thanks for fixing this problem.
