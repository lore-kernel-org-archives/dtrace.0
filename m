Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA1166F0D
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614194; cv=fail; b=GOAAnuCUxnRcrDdI0HLgDsuFm4fsG6pUQG5c91DWk5i8qRQU4ZaFzpULpXrC2jfWnMO0QR4AI5K729bNGWtgddhWyyjxQ2gyX/+tvbCacPn5L8fEGt/KZDVEmpK9fnLhPiU8FNOpfAO4BuxrM7AKKMNjsjGedFSdNWA9bLXuz60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614194; c=relaxed/simple;
	bh=lNqmqA57XcS8y+rD/P2P5Troz1R6Kid9WrBQbIUX7RE=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=BN18COaZH5X4N5n190NQ9OJ3XzeS6UIaKUN5GVLzBbZ/b+pR3QZFrirvcrQg+AGQTiqM5r3mYSCRt6w2giJRJ/q34mP7eP0rYlzNA6BZ80dNWgEhwV39JIzdlYkqs+8LuROIzIpDLaFMySUYPWrPk6Y/LGJy0mcD4vgfO/0WIxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PkZH3fK/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=THLQT+dR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PkZH3fK/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="THLQT+dR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472DGRXf005469
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 15:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=zQLy11aud0POCLLtWqa4mKxQdSkXiZ3JtGTeOosJ7Pk=; b=
	PkZH3fK/BE3blGrHyVUavMiIgMaiuQg4Z6oilJkxBpP1CqO6JcEStNuK27vht6Sd
	Nom0+8tR0sfq1GDIz0T5EUzMwejIE8tWnQq1+ShkID8ofk1F22Yicl2bavohh9Xw
	HbO+9wLhqZzgStYubcAOgdnwi2UUGB+SBQWDxKGkv3lqBfWmRAy09Lp/tr3+i4wb
	vYTSDCy/h/N+S2V+mqva2dv5pSbJx/IEdBA1ICl1/LSOigaJ9fYjgNjrquzEkpKK
	NwfjV47zo4yQhW2U5OL/zDkYs8iFT0fXrWZj3L45Y43RGug6JByPw6+bWAithSHI
	pBHxYit4xeTYg1CsTyvS5A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdy1g0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 15:56:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472EBEA0002504
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 15:56:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c4c1f2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 15:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiQcjW1aNWDLfGjvH4/VPiKaR6UKsjaLXUfn1zt8mQw6O8GM7xklTJh8KeRJq/H3CLFlf2s9rXIfymsaaleSdhq46xU62xHoviw+pgLOxZdGBzfM/SIGR3/tIoSxsXTGYye0QsKk/H5feOQhnrHerrUSsubb5FFroHW6oiOXUXTocUNuowUk+JezDp+FvO23G+jVAK//yOostHSh1GpsjlvblLAbbWi85fT0NsPWr7B7FkaoBXnQcWM7g9KJSw+bDaJWN5UQQmRSssHxwaNhVO4hJqyQ2VRoiEJBXD3Zr7sU3tGJ05YB8QYBpjFKyE/HZz2Ur5y3YzAlqvjU4WiQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQLy11aud0POCLLtWqa4mKxQdSkXiZ3JtGTeOosJ7Pk=;
 b=ihWWZlql8BUax7a78mPQtKvc/Af86q4QfQjrK9atXJJbKpFGAc+t13U2Je9cF+87O+YLbiWSmNDu+7qaMXmDFK51BsM2lO0QKFLrXbpxGojNjQrX7NkZjyHrAKO5Y2LopTAVXV7OdLpyzBsop+gQg0HxuvQnZD/y0vSYrZZryjjDo1yzXHNMrgOvXofGeFPVe7Sz2n8PUYLjd6D/71x0/HUar5Eu3SSmUJDabnpMc95oBX3IbGwOMZgnDQ1Hpq+BqJH4gw5tnXjtm7Ow8cC87MScYKOLMuzrycZnESlUORqE8pV+J+ASB5U43Vgecxx9MbnflgvQdVdm6VgUF2tzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQLy11aud0POCLLtWqa4mKxQdSkXiZ3JtGTeOosJ7Pk=;
 b=THLQT+dRwdcA3m/g1FxRbaCq1V0ZhZW2WiXyO5uK1LIvwF9kwKe3G0Jbz0FKkO1ZUADH51dcZ6L6WtIvqc/3zEZHkZYl+BfhCLLEQlRBBYwULWU7rlPP9JgK1B2Fo0aCkQixFlWI5M5lPiWLJchZxiW+DahjPYZC6DsonjRLlCU=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by LV3PR10MB8034.namprd10.prod.outlook.com (2603:10b6:408:28e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 15:56:27 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 15:56:26 +0000
Date: Fri, 02 Aug 2024 11:56:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: fix another use of a kernel variable
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:208:32f::12) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Message-ID:
 <PH8PR10MB62929228334CB595A1B855B6C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|LV3PR10MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd52d10-3474-477d-1597-08dcb30baa59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aoGHdn5OEu5Y9jPufbzp9fvBehbZ3wWIks7jNk92ePwdzdtPLRyT5RF3Bc32?=
 =?us-ascii?Q?cFalBu6SdMSAUcgtKeDlWYVfSJU4Z6E38L6wCfiwCNzBXHcNpMtlEQ+HTKWf?=
 =?us-ascii?Q?PmQLZGiLmE1/juoupfBQqNFXEd5H1P3eId+3nYXey4+SYuBix22qvCdZgViK?=
 =?us-ascii?Q?MVoGt/f8sJpPErcK5yPddBaXreoANOoMn+qP+YyIsQL7VE5oyHk0a3jGmqXw?=
 =?us-ascii?Q?CmhYap7/GTrh8EtZJ90tse6HzmBrI4uVCZ/NqPqBkCtUznHFEbGeHh/Hx58o?=
 =?us-ascii?Q?0tJjsi5Za3+5toCzyBKGo/Ste9xLfY6UX6cCSD+QvAHpqkUvFI8fuKufdhyt?=
 =?us-ascii?Q?xchCFrbc5NK5m9ky51uz2D6wUnMazIWxIo7yyzN0NjcOFmHE0IhuUDqndvW/?=
 =?us-ascii?Q?KICJPlNwhMmRf5yEmfMGQfGA56Kbs1n8JbDNXOMyO0HCh9uduZOIJXOtwGQo?=
 =?us-ascii?Q?m7LHlu9OGKX1q9jn2mPMPXipMjtKjpKINRJ3BpJnFxauo0YD3hxl57clDKn/?=
 =?us-ascii?Q?M7aaMLi5hYijGtkq5Lk2d/7yyZmhnu6NsV/sBt1nzDMI5Sf85MlXW9WxAtDE?=
 =?us-ascii?Q?lMFo9ovx4RI7uSNoaTcJpmbsQAFbGe3Ch00wPfyGrPh1tVnO5VexVowQGWWn?=
 =?us-ascii?Q?p7mq5/M5GwlN6g5BwnFh1Czj3hO5bk7ZBUFk17IZ3pQVfMBNhZKKy+Eheyr0?=
 =?us-ascii?Q?6KhAMiXYBOwAhA9L9bO4Jd4aq2EXRNVe1IBX4NldH0kCqVdxRKRZErmIUAxG?=
 =?us-ascii?Q?aLvVs8ybaC3N5H0ghnoVOXgYsuIL4hTxlRhzWtqLXHS6rBErw0+/WJWuiYH3?=
 =?us-ascii?Q?32BCuZ1UC6cyn0y6Q5SK43AS6C/M7f89Zro2d0ohdBSOXovLnHS6BZ1YYR3A?=
 =?us-ascii?Q?79UVqjVeBAyYVhFtCwtX7Kdf/nmtmT2/qNuxhSZcn2EEO9zbqvQH0aY/RnV9?=
 =?us-ascii?Q?iCHL5IL5A1WmMM3kIBP6lsdW0TLihF5duT00Pg1XrFYooCqGeUd6/vwPl+Tf?=
 =?us-ascii?Q?60s+qpPmFOgcHQjn7PTw5aIPorhR5pX7Y4qoAYP+1mDxMaGw0D5GEzqLGSU/?=
 =?us-ascii?Q?L0J2H7pJhDIkj8RdppaB4B5ReESgDJthv8Vdprh97GV7UPVVZsGYnLwDZBcD?=
 =?us-ascii?Q?HddXvMar+tfAOk1CrN2dww6AqJ46DeFTld24wunxKFVmnGfvIsbqHZwrOPMm?=
 =?us-ascii?Q?YfTs8f9mWbaWB1aryX4x7vUQbgpS9RQ/TV39bT2emFh9XFcmad7cKnq48t4H?=
 =?us-ascii?Q?+szlXOoLhoklXYK9VeV8odB0rCt5YZHoF5W7vbKydoZ1czVMv+ap0l7DgRGh?=
 =?us-ascii?Q?YAOp5xb1ZDYOIwE9YmCjZDGzRO/q6SgRzXVt4D3ZKCCYrZ1P28f8S5XVMxQp?=
 =?us-ascii?Q?2Y3i3Rg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JRKuwkZN04iSFU2zeEannVk5EoHVcjbwzcRdgQ2SRsMQzQC4EGW2aNVN1kaE?=
 =?us-ascii?Q?8xrpFVbsPARCUwI66jtrJtoGVvHWfI3jQpWpHnE9IHVvOf1d5oF1CyX25Hcp?=
 =?us-ascii?Q?jy51QIB5MtgxEDzjgyedPHPk2OnRKo4ijPFdt5lJrlRppKN/IFtz+Cs9vzbp?=
 =?us-ascii?Q?gvngjbjsFqYTHjtn6h70l/nlXe77vDQKXeVcx3KbtbzCT9fO9ah6NqUAaz8Z?=
 =?us-ascii?Q?ks+QHKvco6OSpJ4XOljmeWOmkQjVbjZRGkTxevJDSGHGaHBqBy5+dlUz314e?=
 =?us-ascii?Q?jv/9i8fRQ3Lm9FKZfS45Hh6MWdSsjPMnF+YiC5ErO/UO0u74gx6A8wEkz/3O?=
 =?us-ascii?Q?niwkgKycqFqqqcOY+I6EiLBKkKRc8citKCyfzOJq23w1FWVsc8h7ULV7S6/o?=
 =?us-ascii?Q?QxfH0mJQYE4PHBkrGgT2E/XVvjmvu9i1yDbWY0KBIE6Tam+eJLjTlkM6XpE6?=
 =?us-ascii?Q?DO3BgkLYP+hgZPCVqGM3YVGdPvKCTBeIoCxQD5djpp4o2CXjTH1mRsqBmrRx?=
 =?us-ascii?Q?63gaA1WhVNFJIUP8v/SJ0wEJ3DqryNS5zuVoYFEwRKBMWo82LJcXT46EnLNs?=
 =?us-ascii?Q?6851zL6ks+crK77QOq/h30h0f2eSPBGfDXok3RQKcw1UZ5lV5Cgtv39c5DYr?=
 =?us-ascii?Q?0DM80WSNbdz+P/8dVny3CAm9Ch3jPnDh9nYSyvcTSjQcLEoLKZ43Zr4jAznd?=
 =?us-ascii?Q?qlwl+WYHLZLnMYRYTxDdL43kYTuwdVuJzdgxuQDw0gVmlbERIX64Ii+0g2sU?=
 =?us-ascii?Q?QP/uoYdWs8D3ppqK+w54NQSVHHlkTeey3tGEpwrwYb20YIZP2b05Q6vvYIVM?=
 =?us-ascii?Q?0FTKmMvB0T9wFCDYBmmKO1UJsHTQSXWAdMF5jM9F4mSQrfg2kiu5lQlzEiA5?=
 =?us-ascii?Q?nvirern/3fsdzPl2v2vKL/N3a838r5Ak1FvyOhOjRQYjmiwsnRjFltnDPiBC?=
 =?us-ascii?Q?BnbbTBZ0lY99GyRxnSBa/i/3LIC9Yjd3I8aaGgcG39R2npcdJJkO9OtgS149?=
 =?us-ascii?Q?GeGZcQaa5cICpCuUkavulYwJM0275MN6gqS4pQtoMxp73gWKipMVY5f0TZll?=
 =?us-ascii?Q?lt0G0Kpivy/tzKjX/Dvuyn2aJ/2ACXssDfnkcbScTw5AMXGTjJ8yHXNVa38j?=
 =?us-ascii?Q?sQq2Tr5bT3juSYJtLJA68SdoCP3NQLS9SeF1F3h5qdmnONifmGAiudL9FDC8?=
 =?us-ascii?Q?YrkcQAs2t0sjzlAFj/eDPlCarE039gu8XRlDm7CPkPiDHelcjE8Jj34Lrdn7?=
 =?us-ascii?Q?Py9CruTVgS2lKlQfwP6UCIwNRNV5ceu0eLlwyM9AUHKtU6JeBcCH3bgwsKdu?=
 =?us-ascii?Q?xUcHTl6DjI+NW+ynTjKV/rNNX+qWUDhb7Sh57LVryAilksYQqICdkbU+fDHY?=
 =?us-ascii?Q?f7GT7o8HoRcIsShL9iEwVrHqJMjwszEGk7BljTFhXFAUXPUJ67OdyHAYG3AB?=
 =?us-ascii?Q?nfzUhZNKvXpJj8CVKVfhlft9se4Pd5Ypfq3PWkKp3q9gAkw/P2Sv1EDC//gD?=
 =?us-ascii?Q?Q0zZ4b57OMj+Qt9xnMYUBNAt7qqkasTg73xUFhIbxKgrj3F/QqOONEiIMH7h?=
 =?us-ascii?Q?VUkHozLA67CZpoYCz5Em8fZA7IGVWtCKhQlOiMxZ04T9liGbasWugR8N80lB?=
 =?us-ascii?Q?6ebDybyxm7M4grJjdcR4Wq0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s73ZsWoHmzg5kTyUYzSmWh9+c2xW6kO3u+AtX+Oerlg6UzE5tk7rB6mA9mUkzWCjgIunyenU+L6i9RNIAMi+lkzxVAnVAV30LtDyAT0pc2sSDuhsGbE/ex1s0lyqEfEZVAvkSEvyPSEijkGeqL60p2iwoFAYU/Kpzv1mtmFpcvjc6Hu8zyMOqiNL1Q6fhdf1zJFxo55f6KeIvZm36wEu0j54fMGFPjLflwAhtIy4s1Xjf9FQLJws6ggmCA7GkiQSmKTgAHcApAmVztk1hsIBWA6+NHf+lXmp6wpdZj/6bsoafOhGvU5oIYWj7Y5eGetS20J09nsU7SQbsu46sH/+7MZBog8OkqcdgahQiHR2U+aTsKSWGzlafoRKjQDvdfrLHxnRBM58VIvwqnJptWJYAXjh2jn8XPLeLWmtTw3XKrVkXnSxFTSWTptcrWiC7RLz/l2uqDpmQ6uY4WqNCKdbmSY1d6ag+15u/1NSafEbbMYIX7q5nP0Hl+6lHmqlMhwKlVFvAt415ilMuwNQS3kxBWo+D3gPDmYkyP9U0MN9H6ovwQGXDeD5kwBscHlewFRbp6ozl1LDUJMnsVfH0TegW8xjLahTCN8T5DCEiLlm7DM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd52d10-3474-477d-1597-08dcb30baa59
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:56:26.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vClYl4oaGQWBD39FqxvI4pA5ar1ZGx/BWM/6UGNWYyOTO6td6T1Jj/bQz0y70nOMxz3fNez9ED/wEPAgO+DExhGsE6MFXasyDnEV43Z0pYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8034
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_11,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020110
X-Proofpoint-ORIG-GUID: _dfp2y5fRRTy8DhfibKB-N1aQTMzXMBs
X-Proofpoint-GUID: _dfp2y5fRRTy8DhfibKB-N1aQTMzXMBs

Yet another case where lack datatype information for kernel variable
(i.e. lack of CTF, and BTF does not provide it) requires an explicit
use of the &-operator.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/options/tst.linkmode.r  | 2 +-
 test/unittest/options/tst.linkmode.sh | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/options/tst.linkmode.r b/test/unittest/options/tst.linkmode.r
index 4b453f56..acbf8025 100644
--- a/test/unittest/options/tst.linkmode.r
+++ b/test/unittest/options/tst.linkmode.r
@@ -14,4 +14,4 @@ Linux version
 
 -- @@stderr --
 dtrace: failed to set -x linkmode: Invalid value for specified option
-dtrace: invalid probe specifier BEGIN { trace((string)`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
+dtrace: invalid probe specifier BEGIN { trace((string)&`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
diff --git a/test/unittest/options/tst.linkmode.sh b/test/unittest/options/tst.linkmode.sh
index 4e28f8bd..07045fd5 100755
--- a/test/unittest/options/tst.linkmode.sh
+++ b/test/unittest/options/tst.linkmode.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ dtrace=$1
 
 function mytest() {
 	echo try $1
-	$dtrace $1 -qn 'BEGIN { trace((string)`linux_banner); exit(0); }' | cut -c-14
+	$dtrace $1 -qn 'BEGIN { trace((string)&`linux_banner); exit(0); }' | cut -c-14
 }
 
 # Test different link modes.
-- 
2.45.2

