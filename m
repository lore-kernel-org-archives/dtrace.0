Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924B3A1C4
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017052; cv=fail; b=XXT6m3H98iPleeWrqq3Pd89/up/4UKzVvi5rHPJIYSx3OvkpeLEVBbd4NxnUzktOv4hYLHlls7Yvc30zDAYzppquLPP+p4pu9r67ihgXAzejAoT4Yho6OTNxV9BWMlsVLhpCuqmpkGyPUQqm7sOBPGb1DUDVuOYHDSKpyDJiraM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017052; c=relaxed/simple;
	bh=qoQkDV79PoAjX8nCICdMR4A6eXbCBs3OVBg2AaUpC/Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pagrumyg3Ca0mMlNSWKPD4uoC6N8RgcqDvqCzJ1gfHuutp8qH9macHH8ekKiVTzIPxSmA7cAYyISm1C5NZatmY/EJF2keikB9ujN8VsD/0vekuyktWOcuVP1irtQbepa1/Mu6p/EZXWP60pi2U6wW0dU1X0JgxuUhoZnOdBuQMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e/zygRmT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sak2EDfs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e/zygRmT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sak2EDfs"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tcKv027166
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=ksBNf7otLAnR2R
	dZFB+ZmHIur8N/u81ZsoHhS6K7RmM=; b=e/zygRmTR0eZb2ab7tDB/UKBvS/YNc
	FwYXBcGHVSicJYPXcyfxgLrHw64QOlG4xZinDtiSPgPAcsxsRmN2Zn+HiJPha11Z
	dFlbmwEicW3/2Dfuq6Y0hjiHUBl9hOg35jrNOInUQW0mD1tKqpEmmlUa7PiiCLTt
	2UT37MQtTEjIQTkKSvvXQTTCjxYKarTifuqBj2nvBD8UrXFPfH8af+JwdU1/1xy4
	zviQ7GLxcLf2zgbQ9iGStlYXL7PB++MriSXWXEAligWDD66AaE/wPmbtzv7LJ6lG
	42gikvu6etdhKF05Gt2RuV72uVnPOHZQ0pbi5P6JXhl9T+OPdzGmMc3g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204grspv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4943RtNC005808
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42205617n2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bROQAiSzcaRda4fGYIFJOUozDRX9CUT8dGRQYAbwnCm7yxHEPQz3yvEpgM2+TM3Ct4CJ5xeHkeWLpLADQ2A33/8gEnKAytp06tA2D7sQ/fy8v3yngVmYnGGq4ZxqLxHKvF0XEzySDIBdpfCT5ZLRkV3JvAw6rFr50mk4ca9XHX0+r+kGzhMuctp3k3XMvx80NDA1VYFCqe9uo4cdVsukULJkWFGn2Qd2qvhvTLoaoiaeDcd10+9H8d8OZs5YoFRzY89MNYFw3md1aaUXw9CW2CsrQvrht9D3N7tQ7zgxcCLEk7T21f0gtDk8tVFB3wlntTXrVl75oqxetu00wHsxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksBNf7otLAnR2RdZFB+ZmHIur8N/u81ZsoHhS6K7RmM=;
 b=JLtAyuf8RjxRwmyAtahruisMzPqQN+Axj64UjIL/2UL70pTzZTHI5y6k0iehrsPddcDzlHo+sMEno5JNpO28+7pCTI68abOEGgrWH4wis7AYoNtHCLag95uTz4RLrrALYpFmJl4v+qqp6BUpHofloWQarMtS0UgjHlBNRHFhYL7U17GsqkScEIFeyzHM/6brI5N5/BmRwNhNQfolOp6tzJVOEmZKu5RpRBpIMe3RFCE4tEIm+hrNw5w3Lje5UsGWz1sTXA7UxOITq947dmRLuC48/jzJ9bX3JFzSj+9dwLRITPXSXCpOt2sBIGmOBSw9+30vODmGRMjfCznhgHVtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksBNf7otLAnR2RdZFB+ZmHIur8N/u81ZsoHhS6K7RmM=;
 b=sak2EDfsKUvSj7p421+GHZa5HIvEiD83iu4droab9SGfp+WUvOchT21ctldoStQYHX4rQfj9fbawnPKQyCchodg3uy4Yf6OqgyZ9/T8AxlNPJh47EBZFZa/Y6t2h20SI1B5kF9fzS3gKksz8CYLpqJdA8GPfusA18ntpXAyehkI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN0PR10MB5909.namprd10.prod.outlook.com (2603:10b6:208:3cf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 04:44:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:44:06 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] test: Do not depend on ext4
Date: Fri,  4 Oct 2024 00:43:55 -0400
Message-Id: <20241004044355.25870-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241004044355.25870-1-eugene.loh@oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:208:d4::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN0PR10MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: a9eec447-de28-485e-7711-08dce42f2dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRBcULCW8JpVjwNTQ2h4pAAsRuX/xi2n32vV31QDM59EL05P7l7cBwCbv2PT?=
 =?us-ascii?Q?V8eUuJ59fAoKy3pKQWo3m7fc67Z7xh2K0wbQZMvi88IAMCbFClogUnNiViob?=
 =?us-ascii?Q?+5oPIFfpjnujXcsbtUmxWRSEshzMQP4IHoHlLs0nuYzl36UWNyRoxBmPVh+P?=
 =?us-ascii?Q?lOkU7fpNl4dCOEEz+q5MAfRcMmDI5RaAxzxT8d3Uooy75eNWB6+nVEoS9pw8?=
 =?us-ascii?Q?m16m5knmZQotMTyy3ydgpt85bcihHO1sTu0QwbqFzSGWf6BmK/i75k1QPkSJ?=
 =?us-ascii?Q?WaVioCtmYOk3pjwuCejOsWcrRwZQB4dxnf1H4UnK9oaOuaUtrUbb4yDpOLEw?=
 =?us-ascii?Q?O3YmDKDXCcqy4dDWraxA+WMrDIL3PRinfMFFS/o4gc0/WRpTjyoU4/bJxLQl?=
 =?us-ascii?Q?NRWmBiS1pbQoH6vC3HKD3ITcLA39fBgkIXW85Kk4N3uvBADE+s3gYAnz4DkI?=
 =?us-ascii?Q?LrGFp+215tudC1cGyn/ZswUHnanQDMPt/8aps3jZDMzzFzYn1Nc8aANquWiB?=
 =?us-ascii?Q?9uG9V+cK1r3jKbeb+hcP1HVcLihePMcy6V7kWjnxNldArCmiTt4Q4GCI48B+?=
 =?us-ascii?Q?NmbZi52nBz+OAtWFpyevqsv4uVJIFZcKD1UUCWUUu8+s6+oEjS0iI0g7z+w4?=
 =?us-ascii?Q?ld/il4dImSuNN9nqrwn8ZyKhCYdO3s/fiPYW9oNSr5kNmoAJG+1iglXkreTd?=
 =?us-ascii?Q?sadWIvWkmS/2770HytVzjXhb+WroNrG0RJejuZVopla5+tTBVmKTePBdnM/k?=
 =?us-ascii?Q?tYWsgp56LBDzSbvn5fNWzQ8vIuLqAmd1XPZJ9aklZiRxYmosDs3F48RaeZ5X?=
 =?us-ascii?Q?1Rl5MIXNRVf6ll5Mr1931vHAGow9DMGDwfRJW2Fsj2BjbYZd5jrM85EViYf9?=
 =?us-ascii?Q?fDBXAiNXwQNsLH/fmBq4eKpAohv6bDurE+ja+/9PEk5KkEt2ZSb/uVyY1O+/?=
 =?us-ascii?Q?HsotET5KZI5coiOpBSB0lO5/DilYaeCwS6YVl8xrnjoAPyfIOEyG4c9xO+8T?=
 =?us-ascii?Q?n68cMYX06cLniPJNAmHwWQkKHkYYuDMD0otYZmduUJUYwlnmPdpxbKYfB5zH?=
 =?us-ascii?Q?26c42osHlydZ4O3sOvEUDL4m0sSYhMJQbpRCsmgGAqs/dHYwETYPqH2xfHj7?=
 =?us-ascii?Q?F6sQNxG3b6pm9e7v7y4Fko7zP5PLl//a0qi6M8DP6yVNLHgi3elWICjPDiOP?=
 =?us-ascii?Q?NWik2GbacY+ZgfN6E2VWqi1VnI1lClYu37GzHQPcQuxa3AdG5X0ptGYeE0hC?=
 =?us-ascii?Q?c8RrxNiD5iml95kEAAn8CblsJGIhQ1gwtWnUMiD1IA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+tRODF70U/qCi07QfEmFxZsm5Z73ss74fDlRq/Z0O+fE8KAuuZeT1pjx+q6n?=
 =?us-ascii?Q?mqATV6GmlwD7KmjFuPArtU+GeLpdGLGm72QCdtpsDzs03UHH078yYvbesvrx?=
 =?us-ascii?Q?xQieUazIzd12rHURDpMdLv8C5sOCJ04AGR7KOAUMGjQnOzAq+2nc1Rluo6Ab?=
 =?us-ascii?Q?aGfnetYDeoKOvVv+3PnZ8FI7IV9MkDD9//6vtzIH7kruZ2DK8wR5KqBBm3jX?=
 =?us-ascii?Q?n0313sOlaxT3PjJ7Y4krsZwqhmu0JYCzD+eu0rJYeMZBk4zTb6s7ZRE63Rlm?=
 =?us-ascii?Q?Nc+I5hxNwvXvwXmxDjAX8CnVXo/6soO5SlW+GQY0+es6LKY9091Un1FqkW4x?=
 =?us-ascii?Q?9U7ZhB+VJ2BCkeRKBrdBKtU8yV51cL3HJqRbLEf8lhBlB7i2TL2wgv41VoG+?=
 =?us-ascii?Q?iYFnxSexEBD44qRggfr9PbgWs/tzhH7azrRTqwks5qMhtf+DcbpX5kjCc25B?=
 =?us-ascii?Q?OyhmP+tvUPHBcgJC+vg8TFPvfFoiEHM1k6pjPI8et2ijjroDE2Uytzl7OM9c?=
 =?us-ascii?Q?LiTBY/CzWqIncDIkfmGmQXhSZ/mTiqS55Bt1UZ1YKaXkINYELz+fLJt+MWWD?=
 =?us-ascii?Q?jggEDoclEuP3msRKWNt+QssKAjNSHaw+kH8wx89RXB3LNLW5Gk/Z5cfmooEr?=
 =?us-ascii?Q?rKlgjiuQHqbWkdTOfF5eBQMYqtD6QbhVfw9OmrveI4hJ2snMu4Xk/J4WYNzf?=
 =?us-ascii?Q?vceO1Zr/6dZ94GzhiGXwILWvqHOGE22Q7vwK4Vo4eTYTBoB2k3ckoPpbaTkK?=
 =?us-ascii?Q?3Q3yDru1NxYe1aSXtLM6cFe1lWyNekDurPSfxy47VIsdMQlCkP+yrwIk4jXw?=
 =?us-ascii?Q?DQIn50exKHL/N61ITaVt35Lfqw9ZyBNxGO5NToDaE8HkgiWkm3eZHSSmOQ7s?=
 =?us-ascii?Q?QZqjmB7Q5vrKydAK+DHNxuP8TmIeDRuPTsVk+acLo4wLIjpa3h2/cpEYEYpu?=
 =?us-ascii?Q?KkW7xsjEmvFHCCRyYA/JhfB8H0oKdfV4U1gIr74EI5fDSuvhYOiKbAyU8zdV?=
 =?us-ascii?Q?qL3R4vevcUXLtY7+vlvDjVM97LYGIZjSp/bCDD2Zm+We5PRB7MOYmbnvH7oA?=
 =?us-ascii?Q?wxQ6tM1sHDiOxP7THwiVe19yNxqjrLKIoYNSOWQU+gqTqTIBhECr1uEfWRlw?=
 =?us-ascii?Q?7VzOD5LwNe0aXzGZ3ISn90vUMHTWWFI1DStdN2A2JAGN99RdJBrLJA/Gft4s?=
 =?us-ascii?Q?GtAqHouSiGEgzWfCvGVYXreQuO4c7Qa1Nwym1ueUngvCCEXY4Dy+3qA/JCNM?=
 =?us-ascii?Q?AGSuW8iStT+uhi0jaK/Gp+r9Ltw03omZUw3OoJ00mwTyhwEyOeDnRUHikosI?=
 =?us-ascii?Q?l7NAQx+/vZ2ogcGMuU1nf2KXWi3LQKy93BJ8yxqG8pFsgFrey+7WFe5lnf5d?=
 =?us-ascii?Q?S54SLi5K7cPy1FND5HHTWm+5rP2Pr8db4b1sPog/P6rMe6OScSemqo7cmZsQ?=
 =?us-ascii?Q?1ytQS6T/FYdUJLCvM9sNinTwdqEADu/n54Baa8mcMH3PTuxJcJ0l1GJ4gHWF?=
 =?us-ascii?Q?089flWdxfFFrzUbeTnPUokvx9pdLbdleuGVrHZBj7fo/9utjt+p4NfNV8qGw?=
 =?us-ascii?Q?bqaWz0Ho4KxUM4EmHZO3mNqS4fe6DkIQXCswiSUn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lrMoQNkt/0DpXjRAC3qrj1IYUSdBwrD89Md2Vi3r/JbVlxa7v8vZlbISkrBviV1HL8ikyeJrA6C8WO3vMQXPld4vaut6Osi+b5qMqxs1r4R8+E6Mlegjs5FPlwmb4vqI+OBC42A9Byi3dFGl62kUETEkKpcMh94wOAux3cRun8uVBFtY8yPsfwmhl5g2r/UpnW1qxzUPm5RXKfrGnHyu9lpY1ZfuoTqQiZ10s8cXfmZxt41mn6f/NVteS17f8tpgopreMOOV126Un5tYTd7IwbjB09YlSn2hN55Ew8LZMIamauB4Tfd3jqtqG7zoL5rv6JHuGL0KvdHgM7O7ZEjhwPaYlTZf01+rKF32qz9tpwmPnzxplkVMbrfnjnM5u65QDeJ9frwQF1+S0vQRbzVZfLtUm6H4S7Pt/XMgPOhaaLBQ7wEhj46e0kXe79gsuRk53jX/LRzMfReegZhCvZMAe9RsBA+iMKInnWXpDNxKuWrJQp1SaZHRxVTDIg8YG2Og8pWyYQuUOjxfZpIXzEipD9pUgbFu2N+7wk/Ds7c6T1/lsteNnr3Ej+d0Yw8qQF3MSSsp2wUQkNLlbBMG/V5DzNVlCWu43ugijEnLLqG3S7w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eec447-de28-485e-7711-08dce42f2dd5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:44:06.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqprXtB76mx10/h0dB9t8J5LR7gI4EpwL1QFs3uDM7VyEe6ucaKksqDGOq83xj+sKWTq0OcUoeymcMSb8OBsQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040031
X-Proofpoint-GUID: oniXLF4QoLYULsI91i31x61uYxEbnkl5
X-Proofpoint-ORIG-GUID: oniXLF4QoLYULsI91i31x61uYxEbnkl5

From: Eugene Loh <eugene.loh@oracle.com>

It is possible that there is no ext4 module, whether built-in or otherwise,
even if its symbols are present.  E.g.,
    # grep ext4_dir_operations /proc/kallmodsyms
    ffffc45a59d9ee88 100 D ext4_dir_operations
    # grep -w ext4 /proc/kallmodsyms
    #

Meanwhile, in
    ab883bae "tests, io, scalars: use kallsyms instead of kallmodsyms where possible"
we read:
    scalars/tst.misc.x needs adjusting to check for the presence of the actual
    symbols we are looking up, since the modules might well be built-in, and
    thus not show up in /proc/kallsyms.

With that patch, in test/unittest/scalars/tst.misc.x, we check:
   -if ! $(grep -qw ext4 /proc/kallmodsyms); then
   +if ! grep -qw ext4_dir_operations /proc/kallsyms; then
        exit 1
    fi

So it is possible for us to find
        `ext4_dir_operations
but not
    ext4`ext4_dir_operations

Change the .d script to look simply for `ext4_dir_operations.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/scalars/tst.misc.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/scalars/tst.misc.d b/test/unittest/scalars/tst.misc.d
index 60edab45e..6a5f4ae2e 100644
--- a/test/unittest/scalars/tst.misc.d
+++ b/test/unittest/scalars/tst.misc.d
@@ -20,7 +20,7 @@
 BEGIN
 {
 	printf("\nr_cpu_ids = 0x%x\n", `nr_cpu_ids);
-	printf("ext4`ext4_dir_operations = %p\n", &ext4`ext4_dir_operations);
+	printf("ext4`ext4_dir_operations = %p\n", &`ext4_dir_operations);
 	printf("isofs`isofs_dir_operations = %p\n", &isofs`isofs_dir_operations);
 	printf("vmlinux`major_names = %p\n", &vmlinux`major_names);
 	x = 123;
-- 
2.43.5

