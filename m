Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152417CA1D
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729823545; cv=fail; b=e0MT/EN58EeVdGBgLF6A3WMmvE9pPDGmQshXjeBjkxFCrs7ggoCB7wF9A+S1EV+BtMBrbkEh5rYuyKhORB7BFO5ZmdmuQJkLZoC6AEUMhRmtgacIWvRtXZCjs4s0SQE26H5fm26XJbXWBjcDs1chyoh8MypmCuMEzZWq6IjmbeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729823545; c=relaxed/simple;
	bh=GGgGisvfSM6OWrNt72YjCTxj9TebmOoCQxQJYunML1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WW2Ed4sDFfCYwtVTE3mLfcmCvLtnyGXgRnTp12+7TpdWhH8/c91zb9v+u4JqL0P3d5i6bfwLfOR5X65cBkXDfVjKtyHl6Y5zShZr5O9ABiqT4iIaSDGcbIHQh/6Rlv/99s76EyTrzpvfKR63KEIOJFlHwrEJMfezCiYeM+bZK6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QjKvQvgb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P0De1UOR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QjKvQvgb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P0De1UOR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMcDj015978;
	Fri, 25 Oct 2024 02:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=LyFS1zbU7tkief08oN
	irxfzQjihvI9dB8koOs3wTpuU=; b=QjKvQvgbwqtkbxzrKKZAbwcYLynpDVnSh1
	FFzkjkkDtcZCvMH/8T/GHdsrP9+UWk6eYnEm6PsrruGvAC3zueqiizAZCBk/8QW7
	qXDwcJBaJVEy94ahNiIVB4tad6hCzbKB8UAU8Wy4dfq7yDrn/WtQYozeL/rzns6D
	uBtmQEh1VVvls0Qfn8nYmGdEKBRP+yvFn7MAUpyGwjCbqAmnVrAeX5xm23t4vTg/
	RxWrRw3LKUBUyVVZmX/z0Edk3Kgbr8Pcy0v8CDgo2LxUnAG4RG6C8Vf2pQnyJqMH
	zmuWS9Wu26nIf7xUOW8aXVvUZ4jnUEWbjtOskpn2Vc3kDI7t0iOw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545c55a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:32:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONwaal039340;
	Fri, 25 Oct 2024 02:32:20 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhda9ue-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:32:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9sOBhDdYx27LnOYMxAR1HOPtea0XzHHkEwJ6YJ45GmxvxwqXOk6sqHBYv2FzbwpcKasUpadriokr3y+/Z7gCmiedj1Ho6Y6wki7lrP/1z91fayyU1oi3B76mN4A7deP73mk3otYhSkNR7HFF5lZ7pBPYK9VF4bpcOlZvfDJB0i8F3TbHDoa4KMjiwUrKZxoaRIU8oQSk1GD00DfbUgZEkb3o9uDl2fYPDk29fS1iW2cLtS44EdkLAOcWqqiCNPrthMwMKtk9rtr/baRlQX5FcvAG7aizKbuR3Brynvj9Mj3n6JWkuwWqd7wBI/66TQOUYNxk/SwMTFXxA6SwxiLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyFS1zbU7tkief08oNirxfzQjihvI9dB8koOs3wTpuU=;
 b=pYsUXGMsA0KJ1if7Xci2WW36DilUZ3IZCnitxS+idZyjH2g17QT/Dwz3HOPrZ/fUEm+jR4N9TDahrbXZZi3OpRYvrF3C2QBam9VXvqBTD+628kU+PmnAf5HG68xGyWfF9Ooyi5vSc0qZBtnJrkGc5J3vF80Lplvu4HEgN5QIxPNDePWdMSMin6d35WO5g1Me9aStniunrjJknxFSh7UTA1IX1NVqbUkZ4KqaSqwW4SFZr9B62frPRUNV8QjC/R4cRDtYJB5t3a2n+0KdrBK/4aCEqaQaTlWAGRSNNAfDBmPsceaLwbW18U2viYcgqA2ikcNk2EHhJ2CHXhU7l78KEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyFS1zbU7tkief08oNirxfzQjihvI9dB8koOs3wTpuU=;
 b=P0De1UORXnIvjPKRzuKaoqzszQxdfpFUSHax0Z0aHTDoxjAhfhrMA2mJlRGomVh2bYHnwCipHSwpw+VX49SQQeUCch66On59lhHNm/c0zCBpQS0iDqBcX7M5pawJ9VZ3NbhZr8up2MsfQlNtvCfQZhRTGPczuz89pMZSjIyvLMQ=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CO1PR10MB4498.namprd10.prod.outlook.com (2603:10b6:303:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 02:32:17 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:32:17 +0000
Date: Thu, 24 Oct 2024 22:32:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 04/14] build: substitute LIBDIR in pkg-config files
Message-ID: <ZxsDL3SWOo1FPXq7@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-5-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-5-nick.alcock@oracle.com>
X-ClientProxiedBy: BYAPR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::19) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CO1PR10MB4498:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d34b26a-82f1-4999-4e7d-08dcf49d3e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6boyBoatKGFGP7BlU+s/ydilYIy61+ULMTEsvY2+nfVkJ1S2vLryqe7FEJ/?=
 =?us-ascii?Q?N/dC01zkaUUw8jEhqsf8QWqvV/hoCgZ0dXKO3/LWKntqaaf7j5/4yEkF5Ku1?=
 =?us-ascii?Q?uUdTnv/awXPWOWgj84A12Fs4IzCDK/YzAdrltVO7us3M7mswIihr1CUkFYhG?=
 =?us-ascii?Q?tL9hsA9I+Y0oZtO/p34+WgW8v9fnL3/QNFPAXTDSEILE4WGiCRc4m7b89FFP?=
 =?us-ascii?Q?CgYDnS9/f6qxb8Hzq9pgZlAre3MNYBeBc20WMcy/ohO2nfq8bPhqH0xHZ9Oi?=
 =?us-ascii?Q?igMZAy3pTGMA+KQKwlxfX4qTdoDc3H+rv0ywHvIkfwSWBfynH29pPO6+I9iE?=
 =?us-ascii?Q?HDq4NIwswqyloMMta/Hw+WEI9kzd065cAsWTpcyE19n31/7odQafbRKIVk9s?=
 =?us-ascii?Q?YiGcun6/YZppwB3+xUI7KIJz79lhuAeNSe48VCXVyDRvw00xRE/GkFsGSdCD?=
 =?us-ascii?Q?3Kdbkd3Ul+ZihwO4sXgr1f4il8eAnWPzUlWS78zmvurp05vg9G6KUgVgqb7W?=
 =?us-ascii?Q?+Qf7kAGzv/ZXotjpF1m68ZodgwCMmhk1QJeyLlDSPFJ1HqEQWpd6haNUhBAe?=
 =?us-ascii?Q?QZTAujMenLB5kDYnZIu3JhUtxCDpLr0Lp3CA7YrIsaQNJhcM5+hGjlSe4RzH?=
 =?us-ascii?Q?NO26q7e039/KNaL6JVvN8Xpg93wmhUueCvXNwl2HKFAu5k6+4cFCbXu/q4kS?=
 =?us-ascii?Q?lZOqKOCTLhUD9NCZwkaWY9mnHjUo2hTz9ZY2KC483Q8ikxymd4+lMK1GyVh4?=
 =?us-ascii?Q?DJG/cPjV3ChckHU5upMtfjNryRCqXyMp9jc1R39Vo/oedqXr1uAVqO1xYbUO?=
 =?us-ascii?Q?6HYkEGjiInxiIVnMS2zYQtjyCUbIaWSMzyOYAd5+tNhFNn3KpxmLL18GtnP8?=
 =?us-ascii?Q?FnpMSNsv4g1utH74S005G3+J2OIFZy/zgmprckbSWXp0O6XFsW7xaTrjMzyJ?=
 =?us-ascii?Q?KGFxiFedSnwAShKzsHLrF9We4nJWSa74Ne/NNVjqz9mECZEa/5ShFuh2SaUI?=
 =?us-ascii?Q?TpkXtMpu9ymsy4chpMXCOs7Vei8mxeOVYG+8o1a+2s9McdC4FJnQt4ICntRy?=
 =?us-ascii?Q?Bqni8CabrlewqjEwZjaLbHocvuIGUWsBMNVhHRhov4ZzaMLUAPwHwlhpem6z?=
 =?us-ascii?Q?df6yRumViLnUEfGeWzCECOV166e/l+y+Ymr87qg88OUDAxRkZZ5iz73e84Bf?=
 =?us-ascii?Q?mywfRfoT2NzrC8BIm3E5CRpEH+Ks91DQjwZCVFPTtjlJ0P6zLFLBbeKL9eWT?=
 =?us-ascii?Q?fr4eQDoQStqvtxbIRWcx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CVWppN5tHB1IJj9BOgyC2CL8N0NieA024Y7cttdyv7jBSzWAOnw7TrUNLpyu?=
 =?us-ascii?Q?kINSwjOcsXyRDxxDwXPAbnX2es2+YqfzTu7b7XqhjeGfBtaK0ob8TdY0XMB3?=
 =?us-ascii?Q?qZfqSG9H4b/vAz8zu0nt8z8bPgBl0t7e5Fh/2Tpc3oRtIo3TNqn1ulVq3atZ?=
 =?us-ascii?Q?ncGrzEEGZCWgZ9dBoMDwy1JONy9NbJeryzv4I8AHhNEhsXwy/bGkIS9FMrcS?=
 =?us-ascii?Q?Gh6vYVRNxf7qQ2vtC16p0UqBRfuiPUIkDBTQhWjJENiLAInunpsdU4NEZ7hn?=
 =?us-ascii?Q?Xe5G9gg0UpYenWv1YcrE34+aTFzrUjPDKsp6LavQJuNPRtxlE35q7qIWtpmo?=
 =?us-ascii?Q?JZDvBiVdx63FYdvnjk3jfY2/3Gfnh7d42svBBayGNGADR56H1wRODsAtrTgq?=
 =?us-ascii?Q?ahz4B3m4vy+paNl8WCioiJKpKPHm8JhucgSs34yjH5oXK/XY8xmXnFzOwCXN?=
 =?us-ascii?Q?P1DLXsEI9j9oYGjMZZyZhV3D9wII1PMAEiO/WYyf9WcjhtPshDGislXfvJAI?=
 =?us-ascii?Q?NNLxAL0zUHQgGm8Rc+sNAnzAzbFesigdtP1yuc6VjYNXp/DypM0TMIoLrt+G?=
 =?us-ascii?Q?7h+xUg3+4uMrbIsFHhW2dkd+oHXpZMk0cuNtBBJ1sNqivnZCP73zoar19ap1?=
 =?us-ascii?Q?ckHTi4Fbnlt3egYb47LIFHL6MhI8Je6zlNtRJOHGVcN/ehX8KW6saJp7ZHHK?=
 =?us-ascii?Q?b3D9rjDlJWlb1PpTj4fycoLYaaM17hBR1mjF0hvcgtghn/ZmQdYIyw/NTG/I?=
 =?us-ascii?Q?q6HdKTUChzP09hZiCw4ES7ViEJ2et749KQWqp7KVh2hbskLNhwg+oBIvk896?=
 =?us-ascii?Q?twPMN2cu7mPvEryXr4L8oGpiZebwLlp6fSPSnoPDZUtG9lS2+OPHMhpfi3Nz?=
 =?us-ascii?Q?CnsuuGQIWtog851piKcmS4gOdrcfzH8skXdY36H7BUzFFVXt2g0K9ivivXu0?=
 =?us-ascii?Q?hiyvCr97gh/NOluemNvVFjgFmzYB0gW5kgge3tmvZrGCLyeRdbFENPtcU0rP?=
 =?us-ascii?Q?F5FthAy4CIjknl9rAnT/uMubMiyz6uazNQ7yzmEKaty2071sdh5NHNyid6b4?=
 =?us-ascii?Q?ZSQs0717XVIIpl5i5zeG8tACGfnsjzpJVwv8EHSad5WFMmkqGwx6AR0w/sU8?=
 =?us-ascii?Q?4Gu+ApU/YbnbgpIje5OK/FnaESSSA81U6lrPU3TGYqH+PdFS/WplMmWBl2ke?=
 =?us-ascii?Q?E7V/C3KjTtScjKbb0z0W4SkCwxeYRso/nLeRVOZj9TTF0V3Q3TJ52Oyo/Prw?=
 =?us-ascii?Q?jQBsw3HFz4xaPjfcQnTpwLJ0zZj+vwf5A6M22hSnaF84ztHGlr/08TtnpsMi?=
 =?us-ascii?Q?4PpulihV1Wt4VtBugqPJQTnOYW4+kxlA5zw7cxQYMeJNdMshLIRQpc4+h2sN?=
 =?us-ascii?Q?KveNQjqP9lDPRM2BtcnvUxk9hwyXKeMsZDMHgD/JC5OmkNi7CQhfl9Ixwg6C?=
 =?us-ascii?Q?F6Is1R6jMk9tysenAyqRd1SFfNq7wGZhWX2g2AXrpcKHMdwBeaBcBPvOp7ng?=
 =?us-ascii?Q?HFJDrF25/Hj08GBPRThNtn8gnd4f8sPeA/mAQPpFyDpBffk64VHiSQIeNGPt?=
 =?us-ascii?Q?XnkF6sbHwnkSGlh711ZESjLuWlcZs8dGMmDI9zHX517ns1j19dhX8Cvetz5c?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AKvHCHZJ8V85R5aD/qM2mLhxHqrykZoQytN/AnojuRwuPxNEKpSHug98Nf5lqRTvxasuo0ZXCuAbtcU3uKpZtllgye8QhAT/zyWKrRilp2SiEjVUnQ7Sv7Kd5TVCn9u3i4YiHzvt0UZwrSkrLOZ+fWLMtffY6e4zC7S9LeAn77LvDMsta5UzRFroaJ01b6DkMA139arKqcCm1FXni7aRPosUXeHJgTYLbIItzeYauHcLYOhsviVmsElwKuL8DsMqHBBUgsNVmnf5ObVJXOu0XLUOIC/Wb1kiOtXTVUemtPL7I0H9YrFyEX59DE6FqcTH78HNf3Wm8SLhj51Dbt136WwSuvYXZ/oOzFexGzaLIhDINvow+Zi5ZZDCOfQm1pOmNXI6eBFHGB/UrPohdcaIaYn3Qn5Ig/UujxWmRlHrsEG9M6UcxMPrpl7T9fG1cGPvTGSYuGt5zNTUarvacTR+/dFQIS14D23lUEXmvurvPcICuXw4T4exYrq4GKt/8qmHBcE5n3lfY6uz5gVOyOoeT7HDR0Tnk8PeJYLZyjqbFzor3WYduGMJj/UDPct9PUcaaQMyD5m1bN2U/gnNbdYNecX0CWLRt+JYwrrp2A6Zw7k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d34b26a-82f1-4999-4e7d-08dcf49d3e61
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:32:17.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/sLxCYr6eJ/4v8aNs2yCm0sfTab2IJ0ik2UxO1xD3tWTI8Q5pagAv0u7IdCt/eD7ZX5NulnZy8jhk9/vE7qRuk1FrSQ1biUJxO1p7fwDnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250017
X-Proofpoint-ORIG-GUID: 3CYgw_8B7zRYZUKTbBv98ALhJk5rggRe
X-Proofpoint-GUID: 3CYgw_8B7zRYZUKTbBv98ALhJk5rggRe

On Thu, Oct 24, 2024 at 12:37:48PM +0100, Nick Alcock wrote:
> /usr/share/pkgconfig/dtrace.pc says
> 
> libdir = @LIBDIR@
> /* ... */
> Libs: -L${libdir} -ldtrace
> 
> which is unlikely to work.
> 
> Fix by substituting LIBDIR properly.
> 
> (I looked at these pkg-config files after installation I don't know how many
> times and never once spotted this incredibly obvious problem.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Bug: https://github.com/oracle/dtrace-utils/issues/104

Bug: before Signed-of-by:.

With that...
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  uts/Build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/uts/Build b/uts/Build
> index 181819410624..65ddc39845c1 100644
> --- a/uts/Build
> +++ b/uts/Build
> @@ -37,6 +37,7 @@ install::
>  		(cd $(uts_DIR) && \
>  		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
>  			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
> +			-e 's,@LIBDIR@,$(LIBDIR),g;' \
>  			-e 's,@VERSION@,$(VERSION),g;' \
>  			-e 's,@DTRACE@,$(SBINDIR)/dtrace,g' < \
>  			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
> -- 
> 2.46.0.278.g36e3a12567
> 
