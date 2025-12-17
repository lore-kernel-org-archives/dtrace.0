Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31B1BEF8A
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765948208; cv=fail; b=jKsUOInQIlYGR0PbfL6kaTsTGK8I/pFoG1TVQXYfZVTcubVO4kWNUFIhAwKFVA4KpeLECbGtnfQSToXnyC57KrRnaLcPBUJQLg80+uusn1Wp5MOox8+nLwRNqwkE0emIPp2EJwHUfwDwmZ/s+ngbBBZ84YVMjzCC3NKg9c0Mz7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765948208; c=relaxed/simple;
	bh=LseET11ujOZEYWmUNwRYxMerp++Cn56GFOemBxJpTQ4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=GciU2+ui0vtMojBTfNa2twv/9eYIkJa/P6sxLhz/TiuXJY0wNldKbjkUdmZ7h8AxMv4aDAR3zlLxE5OlfkVfU4VCyKyKQSVA5vp56PvgskZNrerUk0u4i+eVeGNXswiXQVWtQSaLPvOL8Op/LHPorx67SMKeCk3qVVWeFWzXQJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rcaHU52B; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xm85HfS0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rcaHU52B";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xm85HfS0"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH0uULe1620450
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8z7IKzwyJQGmwKLRqf3WhgFatU//+nXHuKip/BxKPk8=; b=
	rcaHU52BjUyO4I8yZL2dtKZOwLx5vJXnqCNq3BhgTvPI1SVJbL5amjJswKv1FOLi
	76jw4dOuIPVNQ7fTsgFmQBUGl3AR95APgORiDliBAgSPgmfbJ8tH6ghzFl3PHVPG
	HBbwHc1awo6RnUCj2WE94FLUG60qsGfOTd21IhjdEHqgSWLmAUaKm+ZoUQNWZxp3
	EnIk9a6ApVBXs7DMCP4wXqZ/BDxKUu54N8XR3CkWWb+xM6/IfXgfo4rA++LRpzrS
	PqKGGkfCOy0epzBjOK1CYH1t1ojVwAhmdYGxOW30u+5f/DFJZZApxLuxwmeE2IAO
	FjoeT0A67nN4C1Uu+krWOQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0y28d940-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH4ZTbm022508
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:04 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkm4cxf-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ll6Jh+6xbHlfg0Rn5baQNnL2p1Ih26n8+yNiO50UKSZ/tR6Zwa44rcDk6VtFtU+bncgJGtaiipVJO5oxeUMFOykMRFjDJg/KN8L1CSpww3yjhBJE2A+7aHmT+swkLDMN2+U3kcZ0kWkoeDnRRj43+bHHwr6Pp/jYVxqZkTRI+i2L+0ZFkqhP2l3pC7QJ09coRBNG38QUf3jwdbtErE5ndxx+XZojzfv7d6oEUQPzQQa2yhbJoxMsX1Fqs2tKAreeRwwumAG7h8EzSZGCXchyGgnj1XKwdCg83QMckDT5J8c/fIXHBS3Jph/53YiL8WESy0oXCqZYbivRUXgjOL/lYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8z7IKzwyJQGmwKLRqf3WhgFatU//+nXHuKip/BxKPk8=;
 b=bxMCAzftXl21zEJ9fxO3sOmbbz+ykzq/vxRWlmSTtUL+w87N56hMFN0d8TUI7XmeZSMJoNCM7L1H2cA1dYVM7eucvOOYMSmNTC0QwGaRfo9Top5l6VJjt2eV+jaBOCBFXRq9so7VG9RmkqidR5fzuoN2dQH93TS/vHb9bgsVQEdF324P1raNfjh9U6+Qmy0gjZGTfQZfr9o7PPnyIfcpQl/HAwRZJB9oj6KoKHYFY+Nk+5VzKU4EmsSdntWqIJh2nMsHc3OMEpx8kOY3C6oAdc869Mx448I2KcvEsPKIHmzIVW+Pz0lys/JjF7fJjeMFKN9GSt+nq9IzQq1emW6Jmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8z7IKzwyJQGmwKLRqf3WhgFatU//+nXHuKip/BxKPk8=;
 b=xm85HfS0PY7n24cC6Xbo+qy0ayHCLb/v13lmtacuoWRDyVHI138E8k6mKGFDAcNxd+9GhTgxOfjUKPCzGIaofU5zOzvrRo1zaj5pRlzVpXgEfV0uc2RH849K64J6Kgxw8OyhAdBFLzU2KQwVO4IVfp07BERhcgfkkkUZ1vb9jHY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH3PPF61A2638A8.namprd10.prod.outlook.com (2603:10b6:518:1::7a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 05:10:02 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 05:10:01 +0000
Date: Wed, 17 Dec 2025 00:10:01 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/4] bpf: allocate the buffers BPF map to fit highest CPU id
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522FFA1904E3A7555E4BE15C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH3PPF61A2638A8:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2375b9-c540-413c-d1b0-08de3d2a884f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?742+bJzaxl4Y5Ylxtm2ciBawb1B/07bJR1gG09izkmQ8e/e1mpS4w3DLK8ZP?=
 =?us-ascii?Q?doauI8MMbh+v9daozsn3BaVUxR8Xr8wZGPc+Xukt0abenMUToNZlYUtPpf78?=
 =?us-ascii?Q?w0ANQmffDbEiM/sVfvwd2TWHbQFMTrZrvBLCX7rD/V8P6+KAxXlvmaoTV8Kz?=
 =?us-ascii?Q?3B2Rmh7IJCJisJiMY1LNYRVf1kH+GsW68wGZ0vIQFskdfHE642eORMsbgs04?=
 =?us-ascii?Q?5nGAfI0oezXOqcWeTH3BYr547SAFmkFdIbYLn4kuHcI3BPoFBia9vMW6jRQt?=
 =?us-ascii?Q?BFQyUeiyW4spVx/4RxjkCgQHBif3VAsUvMtJ/CNjb9DkPMWLDwyaP6FCx5kQ?=
 =?us-ascii?Q?KnobkXF1pmZCTt6uiYjuGGkKvlvF9LLW04lD+i0MOI6jur28AGqzqe37p1rc?=
 =?us-ascii?Q?a+qBJB6eTPOOgD/INYzVBp+Rl3NPoQY0KUhNIR2EDn3WeE93Wk1ftcp2r3us?=
 =?us-ascii?Q?et7EXWDbMPtPrumkv44DHS33jhKRWF7JeejKRYQQWRXVLHCy/BRBLDG2NWe0?=
 =?us-ascii?Q?sxn6HUyUw7jpbxJb4u+T6ViUDhPvh3f78HauoYb6Mo+SJGBcfelr1RgRPh/E?=
 =?us-ascii?Q?OlY3Gq0QLEOh5ifwtGoIwLv8hMxAwlhHbRGLleZ77Ax5yVan2VLEXvc2uJ3F?=
 =?us-ascii?Q?aEBaVdgYlql604SM1o7rGL2XkpC9KuShLdILdHe3LGXI0kQV6XOrud6r0814?=
 =?us-ascii?Q?hSETpY8rIUC8dN43vHp0DxghIaT5GUbDZnaSmM1RPCn4/NcDNgEgHO6Um8Yk?=
 =?us-ascii?Q?l+3mL1ROlEXWaJq7BHr9H83nmgp30EskxDPsZizOOHloqMXQhs4LGcCtlaxO?=
 =?us-ascii?Q?YeKFCDNo/sNYrenlU7HcoA94zyBVGeYQidi5OJX1dZq4NIfRwBKTswhhXo2j?=
 =?us-ascii?Q?6S0zBdGFoyykIfHJDBP0WWH6uehT0HOWqXS/KhvkUROOVLM7Qjtc38/vjmCy?=
 =?us-ascii?Q?TjhcDMDkQDBfceHpL/nvVsG1d33e1DSLI2aQC0g4Q6othNvJ2NHcj2YH3xHY?=
 =?us-ascii?Q?JKSKE0CFZJ8KNNEiRvLTb7VOYKa0BNLDYRoL8r0woXB3XRQQBjug3sXdiI0k?=
 =?us-ascii?Q?zXarzDtVEF+qtRGJzO9WFGRt4xJNYbeBskrUQer4Z5YNsg9mXnJ7AykuvvnQ?=
 =?us-ascii?Q?SjbAldVQspSi5/RggMFRsLEoqqpZVaCoeotaW7uCCC/74QwnnAdKMRRPwrdN?=
 =?us-ascii?Q?9lsvldXwA04yubdxD9eMYua7wrRchO2KmdPsEy14KE+/VPJYFYGmYFGCuc6P?=
 =?us-ascii?Q?mUw4gPa28fGWeX6hDzEmwNClmUhLgSceEzBsFCq9/m0/hL5I3QsqWuKLD068?=
 =?us-ascii?Q?t2JZB7FpN/i4uGLd2Gc6ymBFw+yZp1/xcf6Tq9a9cF7ijBzrsDhynRHUP3Wu?=
 =?us-ascii?Q?rF7WI1Ci0RWJXoilfe7AsvSpGTqtwhRFx78WMZMITv8XPnYAfoyA1FS94/ON?=
 =?us-ascii?Q?B+t82rl+Ysp3nRntxFiHXWqKA2aD4wNs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gAC6sc/UrXXR5DTYd04E9D4G5EFJc+5qjHUh34ioXb/qvEMS3WFvOx3s1PDK?=
 =?us-ascii?Q?MTMvKuFp0JujGffvA21BTLEpa2c3plRHePdeYE++drcOI8uPdpfyjgeBn/KV?=
 =?us-ascii?Q?aczZeo1Q+Ubn2AYs3eiDLfPK+gD3BdDeYmRJtWslKbooltqPlrsOoJezK4xc?=
 =?us-ascii?Q?K8y8UVg+cC1gsi4joByECCwlD0hZo7E3xHyW2R0QdD4Guwfn5Y04DbFQ/F93?=
 =?us-ascii?Q?D5ar0SYDDHWgMc14l/0rMF/Dc0lGfVYbIP7mhdriSijoe6IF+Ev+kTkXMM3+?=
 =?us-ascii?Q?4jJFjkVs0BIMaTMVLuSsiODpEOWd9AVla2a7yXuDeMpeMwRH7NZBcY3v1C5+?=
 =?us-ascii?Q?2bsiUN78HOtJ+/wTa6K/jShI1g13rfHKoXQ6MazzSof8Ags41vXgDmLXuq1k?=
 =?us-ascii?Q?4wJb7SSqwbPQIsKYL9Chrc5va5ILiLRiMZwRZQWcQEKSa6ZIJEFaUzdXxfiJ?=
 =?us-ascii?Q?NsVALvep1d3yiSTC87LP7mdraeq+nqNuB5rdu6Rdhk/5aqrWM6cb3YQhK7ez?=
 =?us-ascii?Q?OdxtQpLJImyxzwap/vZ9VZVJQxyabQa/b9nMQnkBjdJTxuUYIo92ncwSkQhO?=
 =?us-ascii?Q?4VhnUsu12SNZU59fDYcwJq1tveajZ7iHQ5dP8Tl6hOiUQ65aSSfwz63Hzdju?=
 =?us-ascii?Q?FuZuqrHFcxQGIrU6rWI7zOh3wd++ryAgdI8QvWF1ViaNQfCBx8oQrGcVNrkQ?=
 =?us-ascii?Q?MMu7ut9U8cpvi3jrLTA5ypGaP5H8tF0MhHQ44aoUZhSI6lZZrnoY7cSvkGVl?=
 =?us-ascii?Q?iY+mnglV1Br+IBZT5W4Y3FKFd7ZWJnYJt5EH/WutF0gmvPT4eDAHA1RavDgg?=
 =?us-ascii?Q?hNc/N/FXxV+7OmKrxQV6bEOE3fY4WaqyWariMUwCDw0aYIXpUdCTNT7oWdaO?=
 =?us-ascii?Q?EgoCWjl4Cr8OqquYuLq4HDeX8EyYaOCRAV/vaeywxSN4YOe2/UrfnwCrCRwm?=
 =?us-ascii?Q?ZZwafboA4Gr/bvoU4UZUA1QqGnD1XAzzRzjjTe/oCNoY9Tk1HjGyaN+eT8w+?=
 =?us-ascii?Q?3vH/+Uz9TfGSQUaxbKPs3SvOoZApfK2kIZQl5BB/lzo0ATklhGWaoVvOLRQI?=
 =?us-ascii?Q?pp0CrAxDiTkyTY2s4PlpdA1zR0imRbKQPQltbnyCrmWVovERH/CUHtY1KSJz?=
 =?us-ascii?Q?e7budDu4bmCiE120ZvkrhMKHtzm4Qtf7wno0k2mdZpaRFMUy5kZJrd2OckyG?=
 =?us-ascii?Q?VTvJJaMfyBifEJEzZclUTIRiSYYoIc41I689fXPoAsWU5QbTRrWVhY1Efw+L?=
 =?us-ascii?Q?kzQTYWvMwsKwsFC3ODNazUt+01+uZLiUc2984U/cFJKalRGanO+Qjvv8ukTA?=
 =?us-ascii?Q?EgnUqrtUwrK+OilcSHvLPmYRVb8Seh2AD3OaiiR8u+29xFuTFmnAAoxWWIw+?=
 =?us-ascii?Q?cPIuhXGtiu7pTPJ9kK5vyKpuKBm3NtJIQSEg79A87APw6eRprpOznlQM4Ve5?=
 =?us-ascii?Q?8youlT05CMO9aldKIbMOyVae9B/+N7QLrHQNk6WUmnvEfZwCRtStReJhuBGc?=
 =?us-ascii?Q?riLGtKYeahFMtId+FT7xk5IHkFNksBmDoryFfqGRwiPVLLdNNBmdzZvK+EsM?=
 =?us-ascii?Q?5G65wy54VLx+Pb4jbl7/ihrc5mTp24dhhZIp5N/DYtSwn54HBB46/jc0PG8n?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NJ3tV1cZhMKhuuKWn/yf8IfxCWZa9rJ7ya76BAOlcHPhsAu6rCa6LaVsPT26Q0YrlLfGSy2Bf04forwFq0IgjezDp78w+Gx92RiKUuO3h2HL0Z9MnPGUD/pkm4lpILubaRH34c8VUtAWlcuqcObQTZKBgtfMpfljt+7hfeOwg2CTomjh3tI2pa2tsRMFc2OY4kz01odDtl+TwfITLcGHkmB4sIHil0yr/YV+jFrP1coF8APjvkrItZJe7RCpeLS9OOOMU9qkLx1ihj38VR4y/1X/zx84IA+0UdUYx6CtuuPt0MeMwLP5h5ocDuyEUQMCI/Dz/2Mh3kyo1vLcYwumm/aNEcVj7vne3mnT7hZxbU/MJzR+BWtnN8GZ8TZAKxb+06uh8BUwMZ2oH00aq3C2ci3kafkb9i0E/BL4XnfxCs02tL2qN34kL9gN3aO/LBUKcxdtZaGgAN9qW9mx+3ZAYOk/+R6UldklCYHvyv9lWv3pC0g3qM8XmjcsDzxsQrFCzJGZwcVkLrufHTi2FG/0id8XCsifYI4sCTP3hXCVG/8uxAGFI7RJwbDhnVlIv2jambJyrIQPT7UTillhS97Vvt6M+3UCgVKMGpYfb8KbDrQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2375b9-c540-413c-d1b0-08de3d2a884f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 05:10:01.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+5hb/+urTDZ6eCkh+wqUXje76jT+M/7CC4mRAhIRv73bmRQXSOvqoTqXRPFl45wBd2y8CnHtM3qB1WshEZs6TU9TJkM7dbgdpZIGwLU11s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF61A2638A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512170039
X-Proofpoint-GUID: VRXvS9ufAahGJONTqpspPIm9L11c1ls0
X-Proofpoint-ORIG-GUID: VRXvS9ufAahGJONTqpspPIm9L11c1ls0
X-Authority-Analysis: v=2.4 cv=fOQ0HJae c=1 sm=1 tr=0 ts=69423b2e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=PmazFW86tNDmMQNNL_cA:9 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAzOCBTYWx0ZWRfX71RaAsAihIJA
 F2UrtIkcho2BWfxNwbFCtOp7SboLkFUj289NeTHIB9qc14zEimKEovm2EEMBMcQElumy5VRjTh1
 6QK2e2IrKUkzNCAsnkiSkVrQyVVyxXXU3kwSMlYjWp7vfVApFabS6yNdYj9ZzuYhvMw58NcqhWX
 HbnQ5+BhdGiAPiu51lGvrra+/pj69/Fm3R/118rh//PvV+oxroOlbc3vDV/KsbVwCJDZgiW2Cw1
 sWhviRT9LHSYR9I9Kwvd3TwM5QDsUeyZLkn++uv7MROrVC/AQ4kT7S8uEE8FOfdQ2YIF5bks5B9
 mkEEXna0FofWcTY+pqaOxOIrilhG0p/+JP3hxDBq4ZlBZtJGFYKNGj83iPDqaBk8MPupZBIAm3r
 7Mtv85blOtP9SwU0vS5FwVDORTpYcfCc/1yRNA2f4rCpWd7maMk=

Even when less than the possible number of CPUs are online, the 'buffers'
BPF map should be allocated based on the highest possible CPU id because
probe data is written to the bufer that corresponds to a given CPU id,
which could be part of non-sequential CPU id configurations.

The observed problem was on a system with 128 possible CPUs (0-127), but
only CPUs 0-7,100-107 were online.  The 'buffers' BPF map was created with
space to hold 16 trace data buffers (one for each online CPU), and since it
is an array map, this caused the trace buffers for CPUs 100-107 to fail to
allocate buffers, which in turn caused any trace data generated for those
CPUs never to get reported.  Since 'buffers' is an array map accessed by
CPU id, enough space must be allocated to accomodate the highest online
CPU id.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 0a57b7d2..6568a572 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
 {
 	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
 			   sizeof(uint32_t), sizeof(uint32_t),
-			   dtp->dt_conf.num_online_cpus);
+			   dtp->dt_conf.max_cpuid);
 }
 
 /*
-- 
2.51.0

