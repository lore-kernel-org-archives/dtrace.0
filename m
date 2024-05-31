Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124BB78C80
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717184827; cv=fail; b=bJBCZuSoAcIUOjjqAMqwvZXLpp4N44pAKfA0LHvINm2A2i2yck0fTy1q3bQLnj4Mxm7pvQQ8rnMM7/DUuPiXf2mtO5I0rVm1XUUd1vrZNkNdlTmAF1pa5pUqyWnGHLBp+KE99Qx4xU5lstAIWBNM4qKjeNfXFtyKoiKCfLl/kuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717184827; c=relaxed/simple;
	bh=BA/Kqp/EapXMM7laJT0EzpmyOH8AlO3TN1acIjT9z4Y=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=RtyjQOLsZmRkqsS3VpLpcflner9A5eG9FjacYN+ZsWXxqT8ZkB4/AxEkOOJu5AKIYFYY7ktdG+nRw0GWs1zwCZeL/pR3pgP1MgApO3KRhPpIbCPJaQjUGyae5XtPbNzWZ27Kxiuz6MFuh/FviTbdBjV+fxj7hKBo0ewY+qrzzoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VITZNt005540
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:47:05 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3Dfe/R7hcg7mL4QGK?=
 =?UTF-8?Q?OQ/fC/0OAJHQseyhw3PYPp6UpNAs=3D;_b=3Dlfw6T2+ub9xnhsaLPr5IMzPRad?=
 =?UTF-8?Q?AkLhCZBMzH1tniKMDYQclsDx1lE1bklLQ3BF09azVZ_2wJDpf6AkV0aG5Dp0IbF?=
 =?UTF-8?Q?91+c4+1FZKJPgXVOpjPfnSw8AtjnDOy8MTN8m1j5he1JdFew_6nDtAm3frlpgrx?=
 =?UTF-8?Q?jG2FELS518aJSH1Uji03daqMm9GRuFo3ohmyoSExu6D8wuNLcLlzyk_9sF57lNr?=
 =?UTF-8?Q?j78fKBv0k87LENFI2nqo06o514ylD/96LhtM2kSNPA4U2SVPhsx7HIoRMxCl_XD?=
 =?UTF-8?Q?V4ta0VeI4lZE1QH3kFnTCiuUTJ4UI3aHI6NlGD7EW3vTQp3qSW79KJrnvCSq3de?=
 =?UTF-8?Q?Waz_EA=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8g4bwtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:47:04 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VHtiqL006215
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:47:04 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yd7c8tah1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOYzPiSF4qyCva+sgK5x6IlM5b5Eugv4QxgCFO/fnYuLxwfsB43dd7sFIBYMpmj1bhSGX1QU/UshOkgg4xdMCb1G8qQ+JWMSvuG54H1JMb5l763LjxSoTrRW/OPYbHc/sjyHwIGC3zPLzw3+qzWNjnx80/fO3g6sjSFkq6rGw0n8506tQ/MEnvX4tWb8VI8rgGEmysIeO/YA0RwqC0NEZv2tsw/LBzIByfJkAtly42z1UIDk+ydiTp4SvKS8giZUayXXIpmOi/f1j0weFldmxs+BgFQ+un6o8k87EppuVmvbviIt+Iah+Opl9z3tmMc8oi8rQ9zWdlYE2LnebJUBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe/R7hcg7mL4QGKOQ/fC/0OAJHQseyhw3PYPp6UpNAs=;
 b=Fc1npBmk7LLCPosXiyxQJTSMwnaYuCbjYECl+Ysh0t0WTOPcpt+DzUTgBTKXH6Qt02QZd9CG7BZT2RLfF47eRCpoVl/roukRm2fVDvi/8QtdYDLxDiDG9tUSe9yLixvtA4Pw1JkLbQGs6Lp34s7yravwzXAR2NY7srhG8mWlWB3oleY/lkA7AvSCjtCHF7g9ME5VJbn13gx9h8KmiWbS2//BS/ylSKNnrCg20yxdzZftHvl96T4GeYvRXIpOsErHYyT/9RBRTh0siYcTiBOiEThcPMgO4UddIJPQ1MZKZUQWtMyVz/oRVx3sLe6qu+JJnlm4w469smQmX4w/+6c/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe/R7hcg7mL4QGKOQ/fC/0OAJHQseyhw3PYPp6UpNAs=;
 b=pejvyjCsAvAvYMgLF5EHFSsbRiAE6YdjMKK2tD5uyGx76fmSYIHlWo2+DCnaK7fMwhcOHnEP+oxWmGVn/GEcU3pZJEo1PYRbg5MJh4LfrGr97fssHGsuytKu8W4lTwKnnCZLWHnB6b5kKBOyFBpnT4oHdAn+SapQO6HMYfXWdlo=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by IA1PR10MB5924.namprd10.prod.outlook.com (2603:10b6:208:3d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 19:47:01 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 19:47:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 8/9] build: make dtrace and dtprobed
 relocatable
References: <20240531185928.363245-1-nick.alcock@oracle.com>
	<20240531185928.363245-9-nick.alcock@oracle.com>
Emacs: a learning curve that you can use as a plumb line.
Date: Fri, 31 May 2024 20:46:53 +0100
In-Reply-To: <20240531185928.363245-9-nick.alcock@oracle.com> (Nick Alcock via
	DTrace-devel's message of "Fri, 31 May 2024 19:59:27 +0100")
Message-ID: <87plt1hihe.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::7) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|IA1PR10MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d295ab-da26-406a-ddcd-08dc81aa70a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qijKYnOZ9Iqec7FbtZZtscU2DsZhCHABQITAqRNZi1y56wB6JUYUmhAAKIsJ?=
 =?us-ascii?Q?SM6V6HoH8zjj9jbRX6xIgaHpylG1bjxa13WSihV+a/fvoCS4a6nk20XD4WnJ?=
 =?us-ascii?Q?/KziPXXvnVGRbTKH7cmCYwpa1R7ljJlyOFDcV9IKt8nlWF7yKP7bbBe+H7G6?=
 =?us-ascii?Q?VjvRFX0dzzNQUz6iS3PuoSGoN0waU18aPV8AsAB28xmKhGpEUrAZVGBuR9M2?=
 =?us-ascii?Q?VfulOsOFaEkAphdn9WtATXm1O+ImD4KsU5NQh+yCs5pmbMxwa6h6e4U4UkZZ?=
 =?us-ascii?Q?uTEaIC0CPE59yYD5hcTEyb2OyFzQL7y/dCVBZFIorXwctgBN/LpPOnF00uME?=
 =?us-ascii?Q?Ubzhc/AguII8ctr3V0Fjn8oz+bMapemqig7Xs0QmsS5EQTDpCDq6lRMvsAbG?=
 =?us-ascii?Q?i5RmTMmlSkbE2Y9i1D77ANc+uOApoMMakeiE0tplm/+VwUQsRNzpVMmJskp4?=
 =?us-ascii?Q?YSpVfxHj0l3r0M1MtdgNy8XnGpH/BQdT4b8fOMs/QwO/2oRl4c7WRmPhzhtU?=
 =?us-ascii?Q?u0ztfHm+0ZhpSCkKKJwleb5FRkM9Ej8L855owrEa6GRKLsM+N7w/l9CBG8Xh?=
 =?us-ascii?Q?EV++RwFVwsCC+X7VXMtNQ7JIFqeiTiJc0HbUNbNuS1HKMCAj+Rb0/NdIJkGm?=
 =?us-ascii?Q?AXrvmkhFbycP77Y4YAfe/BgmxYq6c5EpaN7N+yJn2nuxFl65PfDn+1fv3SXu?=
 =?us-ascii?Q?u58o3CXfiyR/l3d6d/CWD2jmCChcBoJrP9kgnhKdXa8hkmH63TZJaNa6Bed5?=
 =?us-ascii?Q?dFO65fDJBiFYMZack2OmAovrXG83szE8yOm4vpZ1FKcheM+atQpGPW7S5PHg?=
 =?us-ascii?Q?F6ZutSRnuZEy5Vn3T1UEx0KAqx188x2HxHbLJaWy+PV0a22ojCv1c6nkboe3?=
 =?us-ascii?Q?i2vzsGPszahJGsF0uhZ232jlxqahAlwgSyQxXxKgWfTrUJ4mxeUlGxVyjlby?=
 =?us-ascii?Q?gSsSDx34jv/83CiokohwnKPMDv5zTS758MIolH64x9FMhjkTov4YBQN6A8gY?=
 =?us-ascii?Q?7Ec6zlLrCbNu9t39jYtB6yuhfH0NDu2S7cPIoVD+BbEyD4PR0vsF80aBjPxw?=
 =?us-ascii?Q?AoZYWqFrG4hnYijGMvGZgWA1vDV+P4aPHfe4aG4T3wgb+YAFsx+4pY/XH4Z7?=
 =?us-ascii?Q?ScLFXFBpg37LzH5DlR6g+EwMSl4Enp5bJMN64CQ00kIbJn1hcaJTO4mUo/nX?=
 =?us-ascii?Q?WCcc9A6ydR3kcNqnYDXWAWM3PIe3mQ4ezuJ9j4tyNrmipKAM9w+1j7taI4NO?=
 =?us-ascii?Q?wddnosALqLDhxfaqtC/Umny0jQkL16feRcDMiLmkKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XXLmFRDcZKei+rfsj1WDmrimYfiPKBXqPgNgf7Rh4bb5wQ9jsJnhmpTtoyxO?=
 =?us-ascii?Q?PnKdisyPCcLemD70/sO/ilOMlFbTDX0dhYz8YhWPab1z4GUHEASCoZ68LdwM?=
 =?us-ascii?Q?jz3GE/eMurRpHbfVo/h7zi1Wo7sw+RmERiHwALf1eTyZR1kza+4QIwFEXW8e?=
 =?us-ascii?Q?sprZNj+iD0WbeVbDFRZi4zBJwNdHFgn1+DzVQ/otbmbMMW8m/ZYA+q/e5hy5?=
 =?us-ascii?Q?fR0WWLRt+30iS64GQiwtao6MXEaITmqTwbO61T9VkOXVDcy38Tsyj7H4MWAO?=
 =?us-ascii?Q?cQ726Hzn+sk53UnfI5lu/jOVAZEIAGhbjcDYkLOBkc8F+yMnYacxRpnZSaG+?=
 =?us-ascii?Q?0t2q3N0gRccdl20m/eJDPd0Q6eu/5iFVfDthZOmeulsbVK1R7m/NakAr0jKm?=
 =?us-ascii?Q?8HJIaQq5IfA7ZLxvQVuSJTTehikNLtwd8Htv6fKdCRG2Me2rhmiPqQ1WoMZe?=
 =?us-ascii?Q?I5CpvZ59aNpGqh4y4LZa8O+MFaEHpUxJGT4g6KunSv6N/QCD04FBKDwc64ds?=
 =?us-ascii?Q?GOPjqD/9SM/3VGThT+IMZtaUdn8wJ6ZiSOv6ZNHMTaV9tFFq26Rp1yhawlJp?=
 =?us-ascii?Q?laj6XNbZxJTPtbLILatfKVbDOGVDt0JfbpFIi2Fl6g6BRQqzMMKMB7Jy5Z3+?=
 =?us-ascii?Q?FxmANVxK8yKPwVip45r2ibDcjT+WocaA8hn9TD0xpBVG6x4ehnChZThXoQwb?=
 =?us-ascii?Q?lLH5xnxzc3kkDmdVBxvHhMsDVX0/vgzr1+Tci54hJ3sEC/RMXwo48XCWX+43?=
 =?us-ascii?Q?R/+BNF7NCLa81YQ9ZwhdntEDF7pyaWakWb0jNgErTmYekvPMWW/KRdCJjRVa?=
 =?us-ascii?Q?U3s3k0rnrbg/OVHearbyU64Xm8hKf2rusTHIENWJwDmaOETzs1jnw2rWWc0R?=
 =?us-ascii?Q?s4yAQgoK3Tie5YBq1Bsz11mClisSg01elYnxPGHn9N9ULfruKghvy4KbcdV3?=
 =?us-ascii?Q?PpjP/+hHBEDm/jS5VZIAVWWtAK+MuQOAqs3jhnX7NIDZoH50Ews6vM7fGVCk?=
 =?us-ascii?Q?0Aw0EnYERqGBjnRFNNmrWhiofavdvkyOekEDyDx6QRw499IiJ8bRbOSBo4ao?=
 =?us-ascii?Q?c8P2+pNXevx8fXgOrisxWCFnXU6JfOF7oyt1I/cqXhXjYrRVmkdDjsHpwThQ?=
 =?us-ascii?Q?Es+iSguiJPGpgetTcjtYi6HpZ2flf0bPIzeSVbZ7nPlgAZR4g62QcsPM2VVv?=
 =?us-ascii?Q?RYjUXLwGTiUDqEpjcnXyTXtCEfWN7MkWoOPEkHWOCLkux8W3M1+HQc176QMU?=
 =?us-ascii?Q?3+tQZeuUFVc2O2CmfoxV4pWrXcYxPtWYmB0rgos7KRB3JMt+yc087Vx4h+bP?=
 =?us-ascii?Q?7Xfro+rQMWXxSgIMffI3KtzpVIsXjBpiBVXxHhm1s3DXJ4vpSK2DLGCcFX1M?=
 =?us-ascii?Q?zy1wuWx6j0VQrditANWLSaKqNgdN98kxR/BQVZOL8LjeW8oY0DUVaPgeWpG5?=
 =?us-ascii?Q?+lAM74I6Wy43A+YW0A+B14uQH/et0mitB1UPovajSTovtR5nr9kyFumCEegn?=
 =?us-ascii?Q?zXzmr1LIxyYktrIQYw/y3jdjrn9DdzMjaeBpZ2Oaaq15XJd8evGXTQfrKQOL?=
 =?us-ascii?Q?rDiHFA66b1wsErvSmWCtPwH+uhlOKKlVsqebVGRebUeHd3CC0SkDbSNCCvpI?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AsZ7u+XGgWYMJRVOFNzUvQSZpo667uu7KJuxAuz7Qb+H9JYiOPp+1QQl8igYDbGGcnLlp/miHVhOeZ7ACACnkHV9dkp2WOlRRQePswMfq/2XbKC2jswmEQYijlwaWolyHDIIbEhF3BBZZXLh3f42f/R2/0bTSdEALQRasGJkORZUQVf2Z0vzt0HU600FLxjSFi89L/GcT+9qD1ctd50f8VJxG3QHQqlIkB4nxN7Gx4/+ehPKW1Vq2hic7ZL6M07gw/TjitlbNe4DVFg/XOBDg0g/h1nJjyZeluqSGe6pB9gGS7CAYRhwWNyNfLp70y42ogPO3BUg6SxffVoXUJnoA/CervfvhKKvKUI3bllC/MIz2PQor9Q3ml+EUOIRJKXzoMvK5+o1K3Ew/QQBx+FVdwecorQFreW+0Sd0YgWo2zUYdX5pmzexqlGX4sfnvH9s6ReM8m9/m7oe8qpfdSa92cU6NBQ2JdfaqjQa5LNUWtoc3OxW0r6afQY1kZqeChrlF5Ag2cn+5aKtuy0inPXhCLhErPUY3DdMPHnRmEivPXaJJvypfhnurCAcZ/k8XH6qUWhQ3K3tezqvh72OxX4ujOeazPhnCsDkY+8N0G21sKg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d295ab-da26-406a-ddcd-08dc81aa70a1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 19:47:01.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9cDO/8zWw6P+iOmnqIIZD3rWQrxVgljAedSCQnZuIfckbGfj3ylnWm4lsd8UUcoatv02z4Kjdbpygh3A1yLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5924
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_13,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310150
X-Proofpoint-GUID: RvYLVn-k6bF1Hm-2EQFk9rYg_sMdQ7CO
X-Proofpoint-ORIG-GUID: RvYLVn-k6bF1Hm-2EQFk9rYg_sMdQ7CO

On 31 May 2024, Nick Alcock via DTrace-devel outgrape:

> +install::
> +	mkdir -p $(INSTSBINDIR)
> +	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
> +	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
> +	mkdir -p $(INSTUDEVDIR)
> +	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
> +	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
> +	if [[ "$(SYSTEMDUNITDIR)" = /usr/lib/systemd/system ]] || \
> +           [[ "$(SYSTEMDUNITDIR)" = /usr/local/lib/systemd/system ]] || \
> +           [[ -n "$(filter SYSTEMDUNITDIR,$(CONFIGURED_VARS))" ]] ; then \
> +		$(MAKE) install-dtprobed-autostart; \

Ugh, this is tabdamaged, and even though this doesn't matter inside a
\'ed recipe, I've pushed a fixed version to nix/relocatable.

Sorry about that.

-- 
NULL && (void)
