Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B775789D
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738045909; cv=fail; b=k1SJXxRCG8AKbQktcZEpuOpY5PW1mg4uSO2fZCyH/n2/4nTFASUWRBb7mSqGqOSruxqDJedeEYBMSkcFruCHlWCTtJHoIAn4W1WkTwwaLkVO88NqeYgUrvEbnrybI7uXz/qUNN2xP4mUsAb6z51I8NqMYfWaaQLB5HPml3lo7Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738045909; c=relaxed/simple;
	bh=7te7q5hiLD0NKNM0m1nthpY51f69395okfFHDlo73+0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Fp5BtserXsijSPowexVYslr5AquKLSUO78suPCSBT8G1pqVbL5m9jiRH+vSDRrOHwv6T0+5v3fVUMPeYmBeLO8WZJ3gAcIlu0szsOAdN3f53cl9D/33krahgIJTPVSXoPPm3zWUq92JCQHuLzUVTfs/bQz3JLBZ6dAnjWUkMXjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sc4VSV9O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TP0ybtML; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sc4VSV9O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TP0ybtML"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5MrYq005233
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=pLbbD+ZpYt82DSQ3CgpMpd3kaxPghmtLdahoqmXj0H8=; b=
	Sc4VSV9OfHdE+fBKh+Qa+ZPOoXVVtmI90K4PaH0IKZv2/K90MquIqBtVZqqfKxe+
	rRPQFRmKJPCJIKfbhjPBvUygBiQ7psGc4aT7zNlCiOjAvXgo3QZfFoMhh6TwfDhl
	wD7xkSFpBrP2MCusx5sXNOkKwh36gKnakby1drZYa9UsyPo0rzHsifkEV/rjT0h6
	krDWGec0mi5B10cMeIGs/y80+2+IzMQIql8QcLLeR8gDOPPOu3si6O+CZ2a3F0dc
	bsfYniqmaKftLdRKp1EjxLcogyyvAw2ki6wkFXVR/t+MLmUujKj+0LVtIgezoPDH
	1tX/+/z5+iZtWzUdSq5IwQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44es18g3u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5sLfU034166
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd7yagr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaOy4S4oLCKXWFjoP3NF8kDwVDOBW3iotU9zBVpjAFPmQtQz6kY/XvpacuafTLQRZxffSbzb7AueZTEsArY0GZAj1yam87QahFbREp+oYZ1965eZ/nyIVOkc4mXzv6I4xsW1LqKmgy01RAcxNhafORwijTVl5RrWNmVZFp5383V6CSWYb24N7IATTYr48aDYu4N1tAXjNL7iPX45FqxKPuyw9TQls2jXAloCil8TYVTsfga4QACOwr5D79vM2RMPNXPubeJ2A+jiI0GCMczZdgWmKSAQU7izi15boWa7m1stnV/FrdZpaZoPrapHj8miCVLTcbQKBQEDD5p6TdiqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLbbD+ZpYt82DSQ3CgpMpd3kaxPghmtLdahoqmXj0H8=;
 b=n9K+bqBsizJ6XBEOOgqW4Q8RvjeyVH06Q3PHIHSAkq1jTi0iS0jfOjwT8XBY/XwELx4/oUeujEauwm+XsRkhNBCpNGeenx2cEnKA+HPLRBb1M9nZSXxIQQ6ANvrqPD6id6xXWnJeZUwjFwhaa4k7Y30Wg8Id8zg0+8BH1yzzehvhb1EL2KsaJxExhnyHGNjqWHt3Fxdjj6ULK2VGfmXpGyIeNYXCblNl5NAQe1Yrg4lfJM0JO4v6lxxPLTdeviqQ7C2xWFzqHPBuV/OIdjsy2tLGU/hPXQNPzfAv29458HTbLz3V78AJf5C7vZsvuNRFf5xVkuEYqaJS6aF9S/eYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLbbD+ZpYt82DSQ3CgpMpd3kaxPghmtLdahoqmXj0H8=;
 b=TP0ybtMLUnWz/aP0ATszRPOFMYU5O9oS2vhY9bqVokmjUfMyezrzGqq/Lq0ESB5jgsM5V8PUj/TXyyEHkrJfMkpGqSgahBgYTmj1jCX/YBCAhGOH2weAyz5ilBj8yoQ8Kr9ZPZjYV+G06pAswbNy3fgEwD8vRfr0hNYkieNK7R8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:31:41 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:31:41 +0000
Date: Tue, 28 Jan 2025 01:31:40 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/6] bpf: separate bvar implementation into separate functions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB633775D451C8DC2B4847D601C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 0250a006-6121-4f75-1363-08dd3f656d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9CQMCz6mxh4YZbMU5dKP0NSfeKV1rpDAQhfYMN3jjYXkwClPhHlJrjtMSUNu?=
 =?us-ascii?Q?Ft+r5IQblKHtWxkv/QoOng8w3XsvIfzmquroeOdiyLjBVj47UtN/CNjda/qF?=
 =?us-ascii?Q?ecJNIJv99gbiX2W9hzAxDx81kOMSUkKL0xZ7Nns65NLvLYA6tOQWbZ4Z6Kmx?=
 =?us-ascii?Q?ecdRcWuYMVcSzHusd6aM7Rrrgma/rbk1s7l6ZQxRT2JHKSPmNbqq/xeUQz/j?=
 =?us-ascii?Q?dNs8KBvbDyDi2n+Y7YHVyqzq3OXyBwZgtDmOW7zWNsJDDqYSlPD1ycFZpMZj?=
 =?us-ascii?Q?e1MKsh+O0ts3njAdXrF/22BLKf5PykUl7s2j3wD3jTPLC/qHg/WQPcpKet7G?=
 =?us-ascii?Q?kbF3/4Sg2OqbnOc7H1DV7JQgU699zF8P9orPwCRF4c07439v87maoGSh+My9?=
 =?us-ascii?Q?fJQPSaM+pWX2ghKu6gVrcdvSl5A3ovMjIWs6TL981QRlUksfyuN0MZdctgHq?=
 =?us-ascii?Q?a8PYrKYB0GecrZdCNrOW3EMFIM+JPMtjaID4bNA3rxMzAd51RZaRDDh7GVIt?=
 =?us-ascii?Q?yNFrHIthtWum023CI2J/jQtHcd1VPL4gXKSW+o2wNalblEP/gasWuqLKdMO5?=
 =?us-ascii?Q?zCN/c7GPdxxqWOfwa9vbQ3Wfm5umlI9R3Z576eILD0E822AJXIMuu8aRiB+Z?=
 =?us-ascii?Q?Rp/IHG71S8WehWGQqfnYHLNJVfsaqGdRzdpZ4C70pho7CUy5Tfko3/b8AuER?=
 =?us-ascii?Q?STk0I6Oh4Ycgo1oy03Vg2KfSoa1ScJ0+zKme6UNgKTVh8dx8oJQyzfYqKNn4?=
 =?us-ascii?Q?Mkx1EitNHFNghay+e0W4BVDScvHdyTx03PHvZjjVsRHZdJOof5frtz9a1qBc?=
 =?us-ascii?Q?1up3oUV6R9ODDGmTPZnnlGQX1XXASpGGmSQDWCLEFz8yWMRNyvvbQG9mdAgm?=
 =?us-ascii?Q?ZkHVXHYIwCs4UPevukzUZMjifKVylOP7pzo61a0fAfvE0OL+3dzLCLd5fhlH?=
 =?us-ascii?Q?+gkxGYCwPpPGXv06yIdvum9Gm4ssRT9Hw0BayPQtNpUIpUZRp11PRHRLjzlt?=
 =?us-ascii?Q?QQ0YpfhFVxizU7F6WHqtA43YZ3gMfTXIwF026IEg14B+sx3PKXoyS78ulqCB?=
 =?us-ascii?Q?EzDq61DTrhajuFwOVV8mw2C3hYKtEwjm7kIkNYjELU0dbK+CoFb6kX8WlMSc?=
 =?us-ascii?Q?gunA7xK0/CAkzfbVnZFP9tPrId1GHs2i5eeddo181o2mpsEoD38aOlVVVPA6?=
 =?us-ascii?Q?A31Lvyt4Qxjq+5eoX7ZrXl/7ph2gSt72Iu6ORdwSjvEg0pbOOSBCTw9C31AS?=
 =?us-ascii?Q?UowDD12UOYDjHT2+PI6jrSbbi3RN3oyp45ZvgKpRzrLMj8+yy45MIgZqthzf?=
 =?us-ascii?Q?1Z/n6YUX8Njh3EztoEx/Nj/1HF3/Lul8C1LQ3A4q/Bp5eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cu1ldoasIvnfr3OGNq0alSxscgnmnqgfGWo/eZOv11xujwN1Quvr8cwxbWre?=
 =?us-ascii?Q?vKj34z3gJvVuYz+8SM/GGGvgNcF+rkSlbhYomC0c9SgYoHIKOYEDn9dUab7/?=
 =?us-ascii?Q?e2/AeyVpE7+/MiQp7eHTq+zVr5iF0yG3u6SI37VvUXsRhRQGdAXN32oGHTj5?=
 =?us-ascii?Q?CaoqYn7hHAy4ivhEvhSPop6BX7XJ7RDCmm9myKt9V5qiswENXn0Lqktc/0Vb?=
 =?us-ascii?Q?ex+v5JP42OwYP8aXgJEzZIX5hy7w01gedhHXNNHgiABuM2s5/zGPvWW6gB5T?=
 =?us-ascii?Q?09ddwTgvnd9Uxyc1CNFj/BymRgXJ0G4ENyIgLKVoA2oC/w7TcLX7gwpSahOt?=
 =?us-ascii?Q?E1MYYp8ExQafuLDOlZHx9N02BazDaqGrAV55YrECGV6/8GpvYMubGEhEfB1B?=
 =?us-ascii?Q?UrQ4ys32l/JdfSBQJoEU2zS9dSVAzoHe/aV7EM4dPgme4dcY5qTsQdB6wyrQ?=
 =?us-ascii?Q?r+QaCV9Xq5LxeTlhQUTy/fXxGsj0HS+0ExhCu99zzZ7aDeL174XS1978tZT9?=
 =?us-ascii?Q?PXOYpzlaQ2DvfmVz3bwcTiSHn5AClwK4FlSNXt3tSpDptWTFyUX1IUZ7O3Fw?=
 =?us-ascii?Q?uw/M1rSqR4BXr33+fxveb518qlLtea6iMUFJPw7WrsgepsrEgGTUr65/mpA2?=
 =?us-ascii?Q?tVtAUgVs4MUhK2a03KLwIHluSJbusfZFW2PmNd2D2FODe1XTX/LVNgDd94gj?=
 =?us-ascii?Q?dpyhOFju2lunjCIPNTnelxk+DyjIOf8vhDW4ghiszx0g++wXL2KeFrOiZX48?=
 =?us-ascii?Q?ESwjg7qEOUjrJIppwyjXqJqSVwxjdajN58Fw71jcr9pAQXucQHW/oPce5sc/?=
 =?us-ascii?Q?tA6xeIKpgRbFqzwuXB1a6YmAQqFBU64dxJPT8BVaul4hmwkDwHv8DgFFS2G9?=
 =?us-ascii?Q?I6x2zSNUX26mVb7P9dwTqsKHoHxxmtzGeJIr7jY7+KPN0lNwO4wThDR3ib0I?=
 =?us-ascii?Q?bo6j/k89IrsgALCJFpDIYyyrL2N8prCyPtoEhBE0Bf+vL4ax0saoODNvrhHG?=
 =?us-ascii?Q?u7osZ+x5YSzgtRdRaAIeEwtdfT8RtBMFT9lFS8lzmLxkGvxYFmVmbyefktE5?=
 =?us-ascii?Q?fKPXQvCQjKEmQqsPSYl4okeuFFGYjU6RuP7RgZRIPYinjVhmf7tSHvgtEtZt?=
 =?us-ascii?Q?QDY1WIASpkOZQ8MY8EmeYsxM0ZsoI0cN3FA/PV3UBalRQPQKs4GARlIeqn+9?=
 =?us-ascii?Q?x3weIxAJnImd4iscy6wGRDdGn3C5nEvb2nh0T7+5SCn5L84h/onNc2hjD1w4?=
 =?us-ascii?Q?6Q4/i1VCQni48knSRiFMdqqGsa5gSCITSi0zoMMIKyFbHm2lARzb8pvsbRt2?=
 =?us-ascii?Q?0AMlCYtdN0nukoymZoCktjwa/YiJyjKIt7r+29AUK5bdjmH3biWOMJ3Silcn?=
 =?us-ascii?Q?fLQSwI1TGYtSRZ4kZ8Yu2rjwSZGRVWYdw8uJmJrh2YS0xwln8waNSVsehWYx?=
 =?us-ascii?Q?EZvHm4JivnWoVc0O2TmrpzlJRh7Aq5/+7hE6kwAkqCz+C74Fe4MHuqmlKAA/?=
 =?us-ascii?Q?INsA52uUibS3AWXTxHhqXnbeVm+df5PNC2KIVP77KkKOg4V0IBCscegsaD95?=
 =?us-ascii?Q?IIOQJXCgFiUrG1UAxjQKe17Zjs07asQZadbxntJvDnDQEhHKIdh5x0/AItwD?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M6uKSDKFTwd7SXk/fUeCLtxNklXJX1j7N2G3Cn0HLLSorcjmsxW9b63mGz2U73qM33exTwPFSe/RJwGQN1+fPowzCMi9Lq4XeZkmPZnw6thAL4zJgYSeaBfiQfpPJrAgPDuCoH/Xo6iuWt4Gz119oDf6lJ+sGyVZKzkn/+HKfMsPR+yyCtNyfchev7B2TDEnFf4CCunM640sv+H/Qw/sduTVuPF53dwIg7uvV3QmS/mLm8A7wG+QGpdoA+JcdOfBOW/V2s2mkj4zihx3Uz0atuG3kTQzBhxB+l5girhANfCcKYW+U77fxRL7UaPSIiedzsGrTkehrQ0/f3agoUVqKbf45jNtZZOUGjbICVsCbtsBkwKSRBjsRDbV0k4zhjGQWkBm97zlt/H2mrVwmMY4itschOeSLB1LPtsO+xD51AKOPpyoC4+qyjf74dkkMqdmk/TQWVZ7c6rIASmermx5N0p+afynFe0pre2ZXDN+0tqOaTWbYcTley04mS0+AzBqWooZFg/QUbbM53LsJc3WXith5DtAyw/lm6FD9qpHK2OJam28KDs+ZpxKyzFNgV8Nzg8Mxf7I3jzpKTIaMzC2WD+IqQ+AcDeWJRRybwXL8a8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0250a006-6121-4f75-1363-08dd3f656d68
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:31:41.7925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bOfSodHh0xtM3/pr9Tsnuhb6o9s1LTl9eHOoqUgp+RTAXfY9ahqwlM6JcCFeDqNxgFrKsshczZlO8hmPn7Mk9g49r6Wl6Bqfxu5nRHlzFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280048
X-Proofpoint-ORIG-GUID: jLp_jnjyPTqCU-impuNCUxeJc3lWHPt3
X-Proofpoint-GUID: jLp_jnjyPTqCU-impuNCUxeJc3lWHPt3

The handling of builtin variables was done with a single big function
that therefore got linked into every single BPF program (twice if the
builtin variable might raise a fault).  Providing separate functions
for most builtin variables reduces BPF program size significantly.

This also reduces pressure on the BPF verifies.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/get_bvar.c                          | 412 +++++++++++++-----------
 libdtrace/dt_cg.c                       |  39 ++-
 libdtrace/dt_dis.c                      |  57 +++-
 test/demo/builtin/ipl.d                 |   2 +
 test/demo/builtin/vtimestamp.d          |   2 +
 test/demo/io/iocpu.d                    |   2 +
 test/unittest/buffering/tst.cputime.sh  |   1 +
 test/unittest/disasm/tst.ann-bvar.r     |  69 ++--
 test/unittest/disasm/tst.ann-bvar.sh    |   9 +-
 test/unittest/disasm/tst.vartab-bvar.r  |   2 -
 test/unittest/disasm/tst.vartab-bvar.sh |   7 +-
 11 files changed, 357 insertions(+), 245 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 1c0fa884..c760126d 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -19,18 +19,21 @@
 # define noinline	__attribute__((noinline))
 #endif
 
-extern struct bpf_map_def cpuinfo;
-extern struct bpf_map_def probes;
-extern struct bpf_map_def state;
-extern struct bpf_map_def usdt_names;
-
-extern uint64_t PC;
-extern uint64_t STBSZ;
-extern uint64_t STKSIZ;
-extern uint64_t BOOTTM;
+extern struct bpf_map_def	cpuinfo;
+extern struct bpf_map_def	probes;
+extern struct bpf_map_def	state;
+extern struct bpf_map_def	usdt_names;
+
+extern uint64_t	BOOTTM;
+extern uint64_t	NPROBES;
+extern uint64_t	PC;
+extern uint64_t	STBSZ;
+extern uint64_t	STKSIZ;
 extern uint64_t STACK_OFF;
-extern uint64_t STACK_SKIP;
-extern uint64_t NPROBES;
+extern uint64_t	STACK_SKIP;
+extern uint64_t	TASK_COMM;
+extern uint64_t	TASK_REAL_PARENT;
+extern uint64_t	TASK_TGID;
 
 #define error(dctx, fault, illval) \
 	({ \
@@ -38,198 +41,231 @@ extern uint64_t NPROBES;
 		-1; \
 	})
 
-noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
+noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
 {
 	dt_mstate_t	*mst = dctx->mst;
 
-	switch (id) {
-	case DIF_VAR_CURTHREAD:
-		return bpf_get_current_task();
-	case DIF_VAR_TIMESTAMP:
-		if (mst->tstamp == 0)
-			mst->tstamp = bpf_ktime_get_ns();
+	if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
+		return error(dctx, DTRACEFLT_ILLOP, 0);
 
-		return mst->tstamp;
-	case DIF_VAR_EPID: {
-		return (((uint64_t)mst->prid) << 32) | mst->stid;
-	}
-	case DIF_VAR_ID:
-		return mst->prid;
-	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
-	case DIF_VAR_ARG3: case DIF_VAR_ARG4: case DIF_VAR_ARG5:
-	case DIF_VAR_ARG6: case DIF_VAR_ARG7: case DIF_VAR_ARG8:
-	case DIF_VAR_ARG9:
-		return mst->argv[id - DIF_VAR_ARG0];
-	case DIF_VAR_ARGS:
-		if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
-			return error(dctx, DTRACEFLT_ILLOP, 0);
-
-		return mst->argv[idx];
-	case DIF_VAR_STACKDEPTH:
-	case DIF_VAR_USTACKDEPTH: {
-		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
-		uint64_t flags;
-		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
-		uint64_t stacksize;
-
-		if (id == DIF_VAR_USTACKDEPTH)
-			flags = BPF_F_USER_STACK;
-		else
-			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
-
-		stacksize = bpf_get_stack(dctx->ctx, buf, bufsiz, flags);
-		if (stacksize < 0)
-			return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
+	return mst->argv[idx];
+}
+
+noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
+{
+	uint64_t	buf[2] = { 0, };
 
+	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
+			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
+		return 0;
+
+	return buf[1];
+}
+
+noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
+{
+	uint32_t	key = 0;
+	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
+
+	if (val == NULL) {
 		/*
-		 * While linux/bpf.h does not describe the meaning of
-		 * bpf_get_stack()'s return value outside of its sign,
-		 * it is presumably the length of the copied stack.
-		 *
-		 * If stacksize==bufsiz, presumably the stack is larger than
-		 * what we can retrieve.  But it's also possible that the
-		 * buffer was exactly large enough.  So, leave it to the user
-		 * to interpret the result.
+		 * Typically, we would use 'return error(...);' but
+		 * that confuses the verifier because it returns -1.
+		 * So, instead, we explicitly return 0.
 		 */
-		return stacksize / sizeof(uint64_t);
-	}
-	case DIF_VAR_CALLER:
-	case DIF_VAR_UCALLER: {
-		uint64_t flags;
-		uint64_t buf[2] = { 0, };
-
-		if (id == DIF_VAR_UCALLER)
-			flags = BPF_F_USER_STACK;
-		else
-			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
-
-		if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), flags) < 0)
-			return 0;
-		return buf[1];
+		error(dctx, DTRACEFLT_ILLOP, 0);
+		return 0;
 	}
-	case DIF_VAR_PROBEPROV:
-	case DIF_VAR_PROBEMOD:
-	case DIF_VAR_PROBEFUNC:
-	case DIF_VAR_PROBENAME: {
-		uint32_t	key = mst->prid;
-
-		if (key < ((uint64_t)&NPROBES)) {
-			dt_bpf_probe_t	*pinfo;
-			uint64_t	off;
-
-			pinfo = bpf_map_lookup_elem(&probes, &key);
-			if (pinfo == NULL)
-				return (uint64_t)dctx->strtab;
-
-			switch (id) {
-			case DIF_VAR_PROBEPROV:
-				off = pinfo->prv;
-				break;
-			case DIF_VAR_PROBEMOD:
-				off = pinfo->mod;
-				break;
-			case DIF_VAR_PROBEFUNC:
-				off = pinfo->fun;
-				break;
-			case DIF_VAR_PROBENAME:
-				off = pinfo->prb;
-			}
-			if (off > (uint64_t)&STBSZ)
-				return (uint64_t)dctx->strtab;
-
-			return (uint64_t)(dctx->strtab + off);
-		} else {
-			char *s;
-
-			s = bpf_map_lookup_elem(&usdt_names, &key);
-			if (s == NULL)
-				return (uint64_t)dctx->strtab;
-
-			switch (id) {
-			case DIF_VAR_PROBENAME:
-				s += DTRACE_FUNCNAMELEN;
-			case DIF_VAR_PROBEFUNC:
-				s += DTRACE_MODNAMELEN;
-			case DIF_VAR_PROBEMOD:
-				s += DTRACE_PROVNAMELEN;
-			case DIF_VAR_PROBEPROV:
-			}
-
-			return (uint64_t)s;
-		}
-	}
-	case DIF_VAR_PID: {
-		uint64_t	val = bpf_get_current_pid_tgid();
 
-		return val >> 32;
-	}
-	case DIF_VAR_TID: {
-		uint64_t	val = bpf_get_current_pid_tgid();
+	return (uint64_t)val;
+}
 
-		return val & 0x00000000ffffffffUL;
-	}
-	case DIF_VAR_EXECNAME: {
-		uint64_t	ptr;
-		extern uint64_t	TASK_COMM;
+noinline uint64_t dt_bvar_curthread(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_task();
+}
 
-		/* &(current->comm) */
-		ptr = bpf_get_current_task();
-		if (ptr == 0)
-			return error(dctx, DTRACEFLT_BADADDR, ptr);
+noinline uint64_t dt_bvar_epid(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
 
-		return (uint64_t)ptr + (uint64_t)&TASK_COMM;
-	}
-	case DIF_VAR_WALLTIMESTAMP:
-		return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
-	case DIF_VAR_PPID: {
-		uint64_t	ptr;
-		int32_t		val = -1;
-		extern uint64_t	TASK_REAL_PARENT;
-		extern uint64_t	TASK_TGID;
-
-		/* Chase pointers val = current->real_parent->tgid. */
-		ptr = bpf_get_current_task();
-		if (ptr == 0)
-			return error(dctx, DTRACEFLT_BADADDR, ptr);
-		if (bpf_probe_read((void *)&ptr, 8,
-		    (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
-			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
-		if (bpf_probe_read((void *)&val, 4,
-		    (const void *)(ptr + (uint64_t)&TASK_TGID)))
-			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
-
-		return (uint64_t)val;
-	}
-	case DIF_VAR_UID: {
-		uint64_t	val = bpf_get_current_uid_gid();
+	return (((uint64_t)mst->prid) << 32) | mst->stid;
+}
 
-		return val & 0x00000000ffffffffUL;
-	}
-	case DIF_VAR_GID: {
-		uint64_t	val = bpf_get_current_uid_gid();
+noinline uint64_t dt_bvar_errno(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
 
-		return val >> 32;
-	}
-	case DIF_VAR_ERRNO:
-		return mst->syscall_errno;
-	case DIF_VAR_CURCPU: {
-		uint32_t	key = 0;
-		void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
-
-		if (val == NULL) {
-			/*
-			 * Typically, we would use 'return error(...);' but
-			 * that confuses the verifier because it returns -1.
-			 * So, instead, we explicitly return 0.
-			 */
-			error(dctx, DTRACEFLT_ILLOP, 0);
-			return 0;
+	return mst->syscall_errno;
+}
+
+noinline uint64_t dt_bvar_execname(const dt_dctx_t *dctx)
+{
+	uint64_t	ptr;
+
+	/* &(current->comm) */
+	ptr = bpf_get_current_task();
+	if (ptr == 0)
+		return error(dctx, DTRACEFLT_BADADDR, ptr);
+
+	return (uint64_t)ptr + (uint64_t)&TASK_COMM;
+}
+
+noinline uint64_t dt_bvar_gid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_uid_gid() >> 32;
+}
+
+noinline uint64_t dt_bvar_id(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
+
+	return mst->prid;
+}
+
+noinline uint64_t dt_bvar_pid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_pid_tgid() >> 32;
+}
+
+noinline uint64_t dt_bvar_ppid(const dt_dctx_t *dctx)
+{
+	uint64_t	ptr;
+	int32_t		val = -1;
+
+	/* Chase pointers val = current->real_parent->tgid. */
+	ptr = bpf_get_current_task();
+	if (ptr == 0)
+		return error(dctx, DTRACEFLT_BADADDR, ptr);
+	if (bpf_probe_read((void *)&ptr, 8,
+			   (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
+		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
+	if (bpf_probe_read((void *)&val, 4,
+			   (const void *)(ptr + (uint64_t)&TASK_TGID)))
+		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
+
+	return (uint64_t)val;
+}
+
+noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
+{
+	dt_mstate_t			*mst = dctx->mst;
+	uint32_t			key = mst->prid;
+
+	if (key < ((uint64_t)&NPROBES)) {
+		dt_bpf_probe_t	*pinfo;
+		uint64_t	off = 0;
+
+		pinfo = bpf_map_lookup_elem(&probes, &key);
+		if (pinfo == NULL)
+			return (uint64_t)dctx->strtab;
+
+		switch (idx) {
+		case DIF_VAR_PROBEPROV:
+			off = pinfo->prv;
+			break;
+		case DIF_VAR_PROBEMOD:
+			off = pinfo->mod;
+			break;
+		case DIF_VAR_PROBEFUNC:
+			off = pinfo->fun;
+			break;
+		case DIF_VAR_PROBENAME:
+			off = pinfo->prb;
 		}
+		if (off > (uint64_t)&STBSZ)
+			return (uint64_t)dctx->strtab;
 
-		return (uint64_t)val;
-	}
-	default:
-		/* Not implemented yet. */
-		return error(dctx, DTRACEFLT_ILLOP, 0);
+		return (uint64_t)(dctx->strtab + off);
+	} else {
+		char	*s;
+
+		s = bpf_map_lookup_elem(&usdt_names, &key);
+		if (s == NULL)
+			return (uint64_t)dctx->strtab;
+
+		switch (idx) {
+		case DIF_VAR_PROBEPROV:
+			s += DTRACE_FUNCNAMELEN;
+		case DIF_VAR_PROBEMOD:
+			s += DTRACE_MODNAMELEN;
+		case DIF_VAR_PROBEFUNC:
+			s += DTRACE_PROVNAMELEN;
+		case DIF_VAR_PROBENAME:
+		}
+
+		return (uint64_t)s;
 	}
 }
+
+noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
+{
+	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
+	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
+	uint64_t	retv;
+
+	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
+			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
+	if (retv < 0)
+		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
+
+	/*
+	 * While linux/bpf.h does not describe the meaning of bpf_get_stack()'s
+	 * return value outside of its sign, it is presumably the length of the
+	 * copied stack.
+	 *
+	 * If retv==bufsiz, presumably the stack is larger than what we
+	 * can retrieve.  But it's also possible that the buffer was exactly
+	 * large enough.  So, leave it to the user to interpret the result.
+	 */
+	return retv / sizeof(uint64_t);
+}
+
+noinline uint64_t dt_bvar_tid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_pid_tgid() & 0x00000000ffffffffUL;
+}
+
+noinline uint64_t dt_bvar_timestamp(const dt_dctx_t *dctx)
+{
+	dt_mstate_t	*mst = dctx->mst;
+
+	if (mst->tstamp == 0)
+		mst->tstamp = bpf_ktime_get_ns();
+
+	return mst->tstamp;
+}
+
+noinline uint64_t dt_bvar_ucaller(const dt_dctx_t *dctx)
+{
+	uint64_t buf[2] = { 0, };
+
+	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), BPF_F_USER_STACK) < 0)
+		return 0;
+
+	return buf[1];
+}
+
+noinline uint64_t dt_bvar_uid(const dt_dctx_t *dctx)
+{
+	return bpf_get_current_uid_gid() & 0x00000000ffffffffUL;
+}
+
+noinline uint64_t dt_bvar_ustackdepth(const dt_dctx_t *dctx)
+{
+	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
+	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
+	uint64_t	retv;
+
+	retv = bpf_get_stack(dctx->ctx, buf, bufsiz, BPF_F_USER_STACK);
+	if (retv < 0)
+		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
+
+	/* See dt_bvar_stackdepth() above. */
+	return retv / sizeof(uint64_t);
+}
+
+noinline uint64_t dt_bvar_walltimestamp(const dt_dctx_t *dctx)
+{
+	return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
+}
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index e7e3a132..6e74b4b0 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3197,6 +3197,7 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
 	dt_ident_t	*idp = dt_ident_resolve(dnp->dn_ident);
 	dt_ident_t	*fnp;
+	uint32_t	idx = UINT32_MAX;
 
 	idp->di_flags |= DT_IDFLG_DIFR;
 
@@ -3298,15 +3299,38 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		return;
 	}
 
-	/* built-in variables */
+	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
+	/* Special case for arg0 through arg9; encode as args[n] */
+	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
+		idx = idp->di_id - DIF_VAR_ARG0;
+	} else if (idp->di_id == DIF_VAR_PROBEPROV ||
+		   idp->di_id == DIF_VAR_PROBEMOD ||
+		   idp->di_id == DIF_VAR_PROBEFUNC ||
+		   idp->di_id == DIF_VAR_PROBENAME) {
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_probedesc");
+		idx = idp->di_id;
+	} else {
+		char	*fn;
+
+		if (asprintf(&fn, "dt_bvar_%s", idp->di_name) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
+
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, fn);
+		free(fn);
+	}
+
+	/* No implementing function found - report ILLOP. */
+	if (fnp == NULL)
+		xyerror(D_IDENT_UNDEF,
+			"built-in variable '%s' not implemented", idp->di_name);
+
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 
 	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
-	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_3, 0));
-	fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
-	assert(fnp != NULL);
+	if (idx != UINT32_MAX)
+		emit(dlp, BPF_MOV_IMM(BPF_REG_2, idx));
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emite(dlp, BPF_CALL_FUNC(fnp->di_id), fnp);
 	dt_regset_free_args(drp);
@@ -5065,7 +5089,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	dt_probe_t	*prp = yypcb->pcb_probe;
 	uintmax_t	saved = dnp->dn_args->dn_value;
 	dt_ident_t	*idp = dnp->dn_ident;
-	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
+	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
 	size_t		size;
 	int		n;
 	int		ustr = 0;
@@ -5135,8 +5159,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
-	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
-	emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, dnp->dn_reg));
 	dt_regset_xalloc(drp, BPF_REG_0);
 	emite(dlp, BPF_CALL_FUNC(fidp->di_id), fidp);
 	dt_regset_free_args(drp);
diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
index 9f319d70..d983c099 100644
--- a/libdtrace/dt_dis.c
+++ b/libdtrace/dt_dis.c
@@ -364,16 +364,57 @@ static char *
 dt_dis_bpf_args(const dtrace_difo_t *dp, const char *fn,
 		const struct bpf_insn *in, char *buf, size_t len, uint_t addr)
 {
-	if (strcmp(fn, "dt_get_bvar") == 0) {
+	if (strcmp(fn, "dt_bvar_args") == 0) {
 		/*
-		 * We know that the previous two instructions exist and move
-		 * the variable id to a register in the first instruction of
-		 * that sequence (because we wrote the code generator to emit
-		 * the instructions in this exact order.)
+		 * We need to support two cases:
+		 *  - access to argN:
+		 *	lddw %r1, dctx
+		 *	mov  %r2, N
+		 *	call dt_bvar_args
+		 *  - access to args[N]:
+		 *	mov  %rX, N
+		 *	lddw %r1, dctx
+		 *	mov  %r2, %rX
+		 *	call dt_bvar_args
 		 */
-		in -= 2;
-		snprintf(buf, len, "%s",
-			 dt_dis_varname_id(dp, in->imm, DIFV_SCOPE_GLOBAL, addr));
+		in--;
+		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2) {
+			if (BPF_SRC(in->code) == BPF_K) {
+				snprintf(buf, len, "arg%d", in->imm);
+				return buf;
+			}
+
+			in -= 2;
+			if (BPF_OP(in->code) == BPF_MOV &&
+			    BPF_SRC(in->code) == BPF_K &&
+			    in->dst_reg == in[2].src_reg) {
+				snprintf(buf, len, "args[%d]", in->imm);
+				return buf;
+			}
+		}
+
+		snprintf(buf, len, "args[?]");
+		return buf;
+	} else if (strcmp(fn, "dt_bvar_probedesc") == 0) {
+		/*
+		 * Access to probe(prov|mod|func|name);
+		 *	lddw %r1, dctx
+		 *	mov  %r2, N
+		 *	call dt_bvar_probedesc
+		 */
+		in--;
+		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2 &&
+		    BPF_SRC(in->code) == BPF_K) {
+			snprintf(buf, len, "%s",
+				 dt_dis_varname_id(dp, in->imm,
+						   DIFV_SCOPE_GLOBAL, addr));
+			return buf;
+		}
+
+		return NULL;
+	} else if (strncmp(fn, "dt_bvar_", 8) == 0) {
+		/* The variable name is in the function name.*/
+		snprintf(buf, len, "%s", fn + 8);
 		return buf;
 	} else if (strcmp(fn, "dt_get_agg") == 0) {
 		/*
diff --git a/test/demo/builtin/ipl.d b/test/demo/builtin/ipl.d
index ca7f3bb7..f613bb70 100644
--- a/test/demo/builtin/ipl.d
+++ b/test/demo/builtin/ipl.d
@@ -1,3 +1,5 @@
+/* @@xfail: dtv2: need ipl support */
+
 BEGIN {
 	trace(ipl);
 	exit(0);
diff --git a/test/demo/builtin/vtimestamp.d b/test/demo/builtin/vtimestamp.d
index 9f01bbf0..fcb708d0 100644
--- a/test/demo/builtin/vtimestamp.d
+++ b/test/demo/builtin/vtimestamp.d
@@ -1,3 +1,5 @@
+/* @@xfail: dtv2: need vtimestamp support */
+
 BEGIN {
 	trace(vtimestamp);
 	exit(0);
diff --git a/test/demo/io/iocpu.d b/test/demo/io/iocpu.d
index c7b847e7..1230d6f6 100644
--- a/test/demo/io/iocpu.d
+++ b/test/demo/io/iocpu.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option quiet
 
 sched:::on-cpu
diff --git a/test/unittest/buffering/tst.cputime.sh b/test/unittest/buffering/tst.cputime.sh
index 6a420e8d..c0e248a6 100755
--- a/test/unittest/buffering/tst.cputime.sh
+++ b/test/unittest/buffering/tst.cputime.sh
@@ -5,6 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
+# @@xfail: dtv2: need vtimestamp support
 # @@timeout: 12
 
 script()
diff --git a/test/unittest/disasm/tst.ann-bvar.r b/test/unittest/disasm/tst.ann-bvar.r
index b514dd99..a55fb6de 100644
--- a/test/unittest/disasm/tst.ann-bvar.r
+++ b/test/unittest/disasm/tst.ann-bvar.r
@@ -1,34 +1,35 @@
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg0
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg1
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg2
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg3
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg4
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg5
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg6
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg7
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg8
-85 0 1 0000 ffffffff    call dt_get_bvar              ! arg9
-85 0 1 0000 ffffffff    call dt_get_bvar              ! args
-85 0 1 0000 ffffffff    call dt_get_bvar              ! caller
-85 0 1 0000 ffffffff    call dt_get_bvar              ! curcpu
-85 0 1 0000 ffffffff    call dt_get_bvar              ! curthread
-85 0 1 0000 ffffffff    call dt_get_bvar              ! epid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! errno
-85 0 1 0000 ffffffff    call dt_get_bvar              ! execname
-85 0 1 0000 ffffffff    call dt_get_bvar              ! gid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! id
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ipl
-85 0 1 0000 ffffffff    call dt_get_bvar              ! pid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ppid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probefunc
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probemod
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probename
-85 0 1 0000 ffffffff    call dt_get_bvar              ! probeprov
-85 0 1 0000 ffffffff    call dt_get_bvar              ! stackdepth
-85 0 1 0000 ffffffff    call dt_get_bvar              ! tid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! timestamp
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ucaller
-85 0 1 0000 ffffffff    call dt_get_bvar              ! uid
-85 0 1 0000 ffffffff    call dt_get_bvar              ! ustackdepth
-85 0 1 0000 ffffffff    call dt_get_bvar              ! vtimestamp
-85 0 1 0000 ffffffff    call dt_get_bvar              ! walltimestamp
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg0
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg1
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg2
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg3
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg4
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg5
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg6
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg7
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg8
+85 0 1 0000 ffffffff    call dt_bvar_args             ! arg9
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[0]
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[1]
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[2]
+85 0 1 0000 ffffffff    call dt_bvar_args             ! args[3]
+85 0 1 0000 ffffffff    call dt_bvar_caller           ! caller
+85 0 1 0000 ffffffff    call dt_bvar_curcpu           ! curcpu
+85 0 1 0000 ffffffff    call dt_bvar_curthread        ! curthread
+85 0 1 0000 ffffffff    call dt_bvar_epid             ! epid
+85 0 1 0000 ffffffff    call dt_bvar_errno            ! errno
+85 0 1 0000 ffffffff    call dt_bvar_execname         ! execname
+85 0 1 0000 ffffffff    call dt_bvar_gid              ! gid
+85 0 1 0000 ffffffff    call dt_bvar_id               ! id
+85 0 1 0000 ffffffff    call dt_bvar_pid              ! pid
+85 0 1 0000 ffffffff    call dt_bvar_ppid             ! ppid
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probefunc
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probemod
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probename
+85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probeprov
+85 0 1 0000 ffffffff    call dt_bvar_stackdepth       ! stackdepth
+85 0 1 0000 ffffffff    call dt_bvar_tid              ! tid
+85 0 1 0000 ffffffff    call dt_bvar_timestamp        ! timestamp
+85 0 1 0000 ffffffff    call dt_bvar_ucaller          ! ucaller
+85 0 1 0000 ffffffff    call dt_bvar_uid              ! uid
+85 0 1 0000 ffffffff    call dt_bvar_ustackdepth      ! ustackdepth
+85 0 1 0000 ffffffff    call dt_bvar_walltimestamp    ! walltimestamp
diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
index 6dc43424..61e838d1 100755
--- a/test/unittest/disasm/tst.ann-bvar.sh
+++ b/test/unittest/disasm/tst.ann-bvar.sh
@@ -22,6 +22,9 @@ sdt:task::task_rename
 	trace(arg8);
 	trace(arg9);
 	trace(args[0]);
+	trace(args[1]);
+	trace(args[2]);
+	trace(args[3]);
 	trace(caller);
 	trace(curcpu);
 	trace(curthread);
@@ -30,7 +33,7 @@ sdt:task::task_rename
 	trace(execname);
 	trace(gid);
 	trace(id);
-	trace(ipl);
+/*	trace(ipl); */
 	trace(pid);
 	trace(ppid);
 	trace(probefunc);
@@ -43,10 +46,10 @@ sdt:task::task_rename
 	trace(ucaller);
 	trace(uid);
 	trace(ustackdepth);
-	trace(vtimestamp);
+/*	trace(vtimestamp); */
 	trace(walltimestamp);
 	exit(0);
 }
-' 2>&1 | gawk '/ call dt_get_bvar/ { sub(/^[^:]+: /, ""); print; }'
+' 2>&1 | gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }'
 
 exit $?
diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
index 53e5f618..04fa3a8d 100644
--- a/test/unittest/disasm/tst.vartab-bvar.r
+++ b/test/unittest/disasm/tst.vartab-bvar.r
@@ -2,8 +2,6 @@ NAME             OFFSET KND SCP FLAG TYPE
 args                    arr glb r    any (unknown) by ref (size 0)
 curthread               scl glb r    D type (pointer) (size 8)
 timestamp               scl glb r    D type (integer) (size 8)
-vtimestamp              scl glb r    D type (integer) (size 8)
-ipl                     scl glb r    D type (integer) (size 4)
 epid                    scl glb r    D type (integer) (size 8)
 id                      scl glb r    D type (integer) (size 4)
 arg0                    scl glb r    D type (integer) (size 8)
diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
index 098c1f45..ce489a24 100755
--- a/test/unittest/disasm/tst.vartab-bvar.sh
+++ b/test/unittest/disasm/tst.vartab-bvar.sh
@@ -30,6 +30,9 @@ sdt:task::task_rename
 	trace(arg8);
 	trace(arg9);
 	trace(args[0]);
+	trace(args[1]);
+	trace(args[2]);
+	trace(args[3]);
 	trace(caller);
 	trace(curcpu);
 	trace(curthread);
@@ -38,7 +41,7 @@ sdt:task::task_rename
 	trace(execname);
 	trace(gid);
 	trace(id);
-	trace(ipl);
+/*	trace(ipl); */
 	trace(pid);
 	trace(ppid);
 	trace(probefunc);
@@ -52,7 +55,7 @@ sdt:task::task_rename
 	trace(uid);
 	/* trace(uregs[0]); */ /* test this separately until uregs[0] works on all kernels */
 	trace(ustackdepth);
-	trace(vtimestamp);
+/*	trace(vtimestamp); */
 	trace(walltimestamp);
 	exit(0);
 }
-- 
2.45.2

