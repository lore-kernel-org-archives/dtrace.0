Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7CE1D6188
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276915; cv=fail; b=R+DBwD8MkYKHkq8Oju7i/yJEpl5PeWuTKOAFyXVl95tBRW54ZU4ORCMqJzP2TUkt48V02RqxdI8dzZX6r8kJlEdLaX6JmCn/orIGIzBKGictkL75EILSn+teW7AhkqvgopMx+DTKpx3OuJ39CMBNetnYWZK3JIfFQolGDFUKC0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276915; c=relaxed/simple;
	bh=uiksPOBn4N/XHkKCdXbHjDR5+fuTCjguHskuEm8sX5M=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=hbVYBFVGqnlyG7FQ1efHduLDLXdeINaIcR3zgCUTQc+Op1ikE3YCDjehB3G6g4RC2OXiuxoUtx0JupCCKckSrM4W3kA11Uwd0IJPmWPlVdO3Eyoz04hdJMlQimj0tknao4DSEDT4VGMq2qHLqojKICt2T6NqCjMtKmvuhnFOn6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OU6B4mzM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LHScyTvy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OU6B4mzM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LHScyTvy"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574B77f018807
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=lqOqwNE1ylrbCzRA5gjRdzdnPezObp4wR973IhZKEpc=; b=
	OU6B4mzMBOUfipC1/LNwcuM/50tACbcN72WGtexAH7wTaa7aJTqoAekX+nYWFBLc
	21+3/T0Qf+EZ2Dz7TfrNpdHHu/Cag7TWsW0Pp3ePcg7TmR4+MWjikouyEN8KRrk+
	ONozsKcseSD0DrmBccu97j4O6XaPeeJ/PJJbP7DmYZLZ7L2puDM5CaiIP6KLL8pu
	IcDTo5g4u5BP0de/8FQjfvYei4gOi1aSz1lb5tpN5VXPvFTuX1qEgc2wHX0WiWDJ
	y4iuaHSGoc6TvDeBdTiRMexWgcK7Cx+qrpqrzBIlhHwO+ZGiydWLKQQY1XbuYqfA
	61bRPSqA261m8OLUndYYDQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14838s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XYgU020720
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:09 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6kysw-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgy5lWyeLHxXzKOzUkCmlk7PQDOhJPG6gI1v4id14VHxku0qaeRDAfIdcBqvAbPRr5D1N0AZk3umgMDBlyPCiTOekaHvVmp10IeJ1bGpsPu3m47ZskH2JfWDVUeddW/Gyx/s0r8dCMNARKVpYr7l8sbEI3eumTEMZ9OCwDx+HP34zKnWfC0PSWEzx0G9JPgp+QgAr33N1Ykl6jNXnxWjVQ9Xnf2c8gQ4PpkhjOUONID5LWC2mc6/D5MOZfnd634Hz5nTRbBNzJ197fwAsys7XEyropRWEz4a8eE+HFVUtX+kBg/+N+f9UfAbkyuKwUCleP4bRHoFondRC+Tg3GV+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqOqwNE1ylrbCzRA5gjRdzdnPezObp4wR973IhZKEpc=;
 b=u9zauFpV9+HumJuFRc4E6qjzhq01pDlz4cWqcB52SMw6vkkdGf4ZQGSeKuxREobzjcaQ7RUCKkfO7+q4RmU1KAoJUJgfTYNG1KlXqhe36gQUghYP9DX6bXrfwHAFtC98RGhktgRmQQbToZzLJSzDeKERM7+ieeu4Thl0nxsR7Zb31dLVlNrrMe4H1P7K+rt4rOSV4ZMxx5Neqs9cvSqUETdVVNgLz33OGGXmrIB+UpwOGyl1qIvF3mh62dL+gaZAmQ054JRl6wpvX3A7V3y3RFA/GIP1deQI3cAoCLEu91cmPYsyOX8+hHHAo515QjCFLESYGxnDkwuLYxIl3Xltdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqOqwNE1ylrbCzRA5gjRdzdnPezObp4wR973IhZKEpc=;
 b=LHScyTvyPpYAT+PiX2ZeKCgnWwdcoi0x2VoppAjc6+6NUc/v6BeRwGMd7DRHSobYjIXEMihebn/iUeXqIr+GV0UpLw+F+iIn47CSHZFvgSDsdyCa6de0nOP7Lx3xxo0+5anIJ17g4N34GUkvCxugRpDjJaliY+DLcUynd4EEJ44=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:05 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:05 +0000
Date: Sat, 07 Jun 2025 02:15:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/17] dtprobed, usdt parser: add support for ELF notes-based
 USDT
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB8374A6881B0188B5168B375AC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3671b9-3741-404a-5db6-08dda58aa55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fSPLrmy/r3xejSVoHqHKSV81m1UXjewSKu+sm9n1yDZICyQpNZsPb+1dYLOc?=
 =?us-ascii?Q?10vxIhVKmloHCnITe0H1OBGL9xxaHiTdO0IonKafX0Bpt2gVLkSIJEwAWHH8?=
 =?us-ascii?Q?Y8s7y8IWfmpzxSO3DxkXVjHk4G2oWRT7tw/X+viqCBJcmfMrstOAtkbpNri6?=
 =?us-ascii?Q?Due7IzeKAKe3oDdzfb6mYYxt0AVR3KeJ1TfQOtspjYgK/MRosYguZOOalKG/?=
 =?us-ascii?Q?4dsPCbUVARYCB/FjzbxsS229qT5bDAnBMHgO1+iHZODixhPbF2YTrSexX5T6?=
 =?us-ascii?Q?ErAf88RhD9/LVOi9i0OAIBiRRiD2W84xDwYUSLGB3/JpZMIdofIQKpSspgWO?=
 =?us-ascii?Q?J2LP9o1KUpIbnMybl7hcQbf0doXM0JVEFSAzqpM5SzcDGUMVKDugsQlwHlOa?=
 =?us-ascii?Q?RlmvytAksIG/ck2rn4BCEoF06+o8PKWjeiEx2DtfXH9sac61IOPwefQDG60y?=
 =?us-ascii?Q?o6iJI/gueV+ORhvH785MU6sqrr+3mD4TQszNF/hyUBJVXjxfLQSxYrY9EW1V?=
 =?us-ascii?Q?DSJ6yrsrxNJ8Fd2exXFKYq6YMzTnDc/ZebriiqjsP4mJVfU2lx2c4NRe/fke?=
 =?us-ascii?Q?056A8RBDu4nszksnvM3IsMqlp1GJ2IBG/SzIbR27r0kG7ZY9nKJtNp3Z+Gg3?=
 =?us-ascii?Q?Esn+zTBJ7W1ExSFYzYhvqBas+bcNhRjG2lw98wQ77dYHUa2OlQ/MMZw9sDc7?=
 =?us-ascii?Q?2ovkf6AMLuHG4F0AEgDKn/WSYlgUsii6ClWokN/0pCNVVrJSVpMiCcMvjA7y?=
 =?us-ascii?Q?vNIuAuONrsX5HvIUZZutXHYVVO7ZQRZwcWErkSHB4UcP3KhfALluGMPDB3Hy?=
 =?us-ascii?Q?vW34FjW+k6/11TTOi1PenEfYflY9TQOGtunYqa6d7FSEpmbj4goKce069xtW?=
 =?us-ascii?Q?pGehAzwJNoNyxbLC5R/L8BDDBd7Cah95LIuflz6PlgvaqNuft0JxrV92vTuW?=
 =?us-ascii?Q?TrKOiCPZreYnkXjg7jj/ss8NWQ50XUbFaZ7obvMRLHtqf7bc0LbGzCG1eOp3?=
 =?us-ascii?Q?LMHTAJWKR79BQ1ygFbpcRYOMVBJXfwL3lsbuwpI88IzhFMT/vCV3cKRCn824?=
 =?us-ascii?Q?nDnFwpuan/2kEezTJVRsCa+3TpvdGQ1pqxsxxi1QgTqkwBZYiZb9PUAwjEh4?=
 =?us-ascii?Q?CV+l5wIo+wEogOB7eelfCUw4EXVWbIvUDmL9nE4ntG3ZZONfxFc08d/El469?=
 =?us-ascii?Q?h06t8CSMc6DEZ66U+Os4nGsdZPKV0bQ8U/sNj6qY5fWI99Dp8SKCmplidK8v?=
 =?us-ascii?Q?EsB/zFVlY9xuyUaXrAk3RPgj7WxlNDWQ32n/3DVYNnzFIya/7TUYid4GkNOL?=
 =?us-ascii?Q?+o5cO12dSYagorbtlfpLFMNGHzP75zQPXjBfiKQwbfvFKnBsjDXrvucOtJgJ?=
 =?us-ascii?Q?xD90jubkIovoH9U8VBSU2URkaz/nYvneHj3Y8cy4+ycRWlPya4W/ENJqpHDV?=
 =?us-ascii?Q?C7PojKO9bL0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?icmrYh9bYo+558jRTg6euqn57YLtVXcB5NytO/xcSNWrxDrdsggA3weWZPDu?=
 =?us-ascii?Q?7HUZcsy57Gu4QErZaCGkCH07r8yg/dhzWGk/3hbIv6areu5qCtHRv1rPBHN+?=
 =?us-ascii?Q?lxeSGBDiOWfnr56PyL7VBC5prFsW3uFGnR8FpbXufA/vxK58PEpI5+uJwGmn?=
 =?us-ascii?Q?iUW5TP8BnGzbFwETdtShvs17muOPluT5oXSxL1IUZTExdkP4ZUnweLIPObuo?=
 =?us-ascii?Q?xFo6LcyjahyVsmo4NK5krGpcYPYiFNe9Yf7YB0WEyhf6dPvY4R5VQBIXeVf+?=
 =?us-ascii?Q?1f1ScIvpU6LF9UX8qN4cgs51ENoI7OQUft6NIVIUVmJvuf0zb7x2yA08EeG3?=
 =?us-ascii?Q?JND9XbVqgV97kM/1hJ8v1mzw3NN0b6OssNITTh2ki/nNHeRTPKC07HKNIVQ/?=
 =?us-ascii?Q?pxMaozDeQM3wbVD3lrB7bmxeYHdy8TFfk4Ddwx468JiTCcWKhNNZt6GyqT63?=
 =?us-ascii?Q?1LDwzNX1OLlM3uQdMsOoBVZParVlt80cmDtwCmx6uMrVGuO2KQV3eg+yust7?=
 =?us-ascii?Q?cn0uOKgs4Tp79rpaw2cZ2ajf+AqEJPuj7e3bUcGpwzE0kQWWHaRRLb6vu1AT?=
 =?us-ascii?Q?nT8H92/Yq63jx92WZ4tgmkGIsAbn0iioVLpQxaHaWdOpxNkFzcDK6H7RxzWo?=
 =?us-ascii?Q?vZm1hoesBFSFZgiq/p0OJGnRKR3CpXDicXXQfg7mE27Ia1Wf3vob80LFA+hM?=
 =?us-ascii?Q?sUI+xn7xsekKZHIiSt/JG8dUwljvR36nLfssc4MkUI+7TWKDXqr0ZvrSm/SC?=
 =?us-ascii?Q?eTp0B4pqHlGrqYNPX4CEDKgqz9ibo7TwpSDN46qNWN6fF5aq4Y9Av+Qc6WDJ?=
 =?us-ascii?Q?beJkItP7Rxlnab92+pE0j+UxFRd6ua87cqNb9UdHQ8o8StIQgGRvPvFQrJUi?=
 =?us-ascii?Q?whY/ZVTd6SDj12j1CEnO8RuKdyC1igiMbMhlaA11T/3nxVRXbh8GxHwusaLt?=
 =?us-ascii?Q?drINCEW9EI+eHrOd+bm/eyHa9a4N1k4Sv4h99e3qby4ny3HBv3yMwy8RF16t?=
 =?us-ascii?Q?uQ42ExH7GL46EKBQxDBt1esJabsdLvoVPvyAkFogESNQHi5d8HgwHJR+ARVh?=
 =?us-ascii?Q?94oel22e1CNXMSus4NZP5PrsqkYprLlCl2195xyX6lfVa7KZdRsLGLzj5XW5?=
 =?us-ascii?Q?MPAJaOtDCrQSq48+AYue6dVjTXW3QdLyPt3aIVIVYcRpGXL0XxHUOUxOT3rk?=
 =?us-ascii?Q?+k46IBqzXNBCjXjjt4C1DNdsxWRSrC5cPX7eD4g++o4EZGPnOsVxzntGjBc1?=
 =?us-ascii?Q?3nmYyZIz9O89RKs0AIeHS0UVT3w0DDYXt4ZpZ6ZXHRbrC8OJlz99mS/AZuhh?=
 =?us-ascii?Q?JMD0DzvjYxZfygl8YHvTHXMJXWFwWkh/jmBUgZuH7BVbh1VPQdgssqeuPljg?=
 =?us-ascii?Q?nu/InZXLW9lcEPFvJt8HauE3MNfAZ+3r2xVm5NtapgPXGzVFCMpNSv00U6CK?=
 =?us-ascii?Q?SFdeT7mMZKXv5zFdYDFOYNsm5OKF5f9zHAXhArIqc5mNa7gyKaY+0r5sygRb?=
 =?us-ascii?Q?jjkE60f7f+1Xov0UgV7voxiI/27FyyVywH+AdpfO4KE2VzaXUmfthp2ejJmz?=
 =?us-ascii?Q?u3I+wzUNeDQvPRdZ+WdUS7gRBhW6CqkOCGKVb+tYLeufdfGRl/I5rKBxvaAS?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2JnNsihgm39Y8ueWLYY0VFJlT9hrUccw0jhJmI1S3LOrSAagyRI/tUoYlFVA3McV63mZCSqWty9ZaJPjopWfAIEuJQXaEPMdeFGKBII3lNNakbYmWipoQqRJeQCreSBcL2HTDSTWFiMWS6wd6mFDb9A3RzKebnnvKicXfwsWBIdFQJYd3MYeL5Q4vYmLWchMAnzDqeYYC7/qSx2whvyQj/WnpMof6K69BZuYwxGBP7zePK/IxOGoxR3Lm2TFj7Kh6A31wsESoiXIPpz0z8ke5dkNQJGuYlYo/0sQQGE2UNhBJh6q5dLB9jBXPDPfGb8xHa2/0n4emgYFUtoszfahDIGnMYY45/WGK8SB0lywL9gDE3QilNvz6Ps9wn6w6DPaN0bmHzXyoV8RNXLwLQN0lf8do/GsJtCiUZuLOari9W8n+j5DsEXyGC3AAkLzr0MS5hQGqrKq1Dlvva7b8rezGHQCaGb9+3VKocrWjZ2CmdtqGbIHW6qXwl0irdCL8/8+9Dj5QvtEbyEBROyC/iEJo2KF6/yZmn+ZSj034OtHMHSdOYBNU5ve0laqqAoNwdRZQjRkRpo5N1O7LKWh2/JoLBPhkecSTkq6veF55oAt0Lk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3671b9-3741-404a-5db6-08dda58aa55a
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:05.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Kf5w9oD5X9389yMyVJO7hWNKo+SB8Rixfiq44603R6vErBtv1Y+OSjr+1WKLyKYs8/yyyQz0qbv3VXlSv/5W0Y1+CsNiTTtM4GKdxNSYuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-GUID: P3CxOPN2jtWVl52v2N0eRFxdM1x6yCeh
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6843d8ef b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lCMoVjLRf9mCwMaGg6AA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfXwdiOAs4WFCfq U+21m2alYcClFBx7vjkvRcsISTaNp+mFHdrURQ3yVYro/OCHPdf2hfoKFcemYodpmTu7lVxlQ30 pqIjQ7mlE4f1AN0bTgej+tpeLvMx+bfVxtumaKP09l65or7LpA3LCiTcXqnn7qbH/AtcfGzovJP
 0rbodvZG7d22su5iWT0m2AClrfTkFscmdGBa7+cSXdZSS9wZYpcz7Y9U7hLjREvGK7aYjRvC/d+ b9RChTwXcfJq7bdZ57Ngh+Ac6i/nv0LRYbcMXY84SqVCVz0Qm1RX5AWyb7X9xfYAyQPLdZZztlQ JW0vyuD8HagkYAIMElqPvVs9Rp+8uZZIkMZf8IpOXb8375T0U0/d+x3LpppzWjEcWUzPFNgZOha
 qYz90937TVGeccAGirUEF/a6HiJmTLgeTl9Ce2Z2xvCJKOIGWFHdm7DA3pol0qHqbV2W0Yov
X-Proofpoint-ORIG-GUID: P3CxOPN2jtWVl52v2N0eRFxdM1x6yCeh

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c            | 456 ++++++++++++++-----
 dtprobed/dof_stash.h            |   4 +-
 dtprobed/dtprobed.c             | 183 +++++++-
 libcommon/Build                 |   3 +-
 libcommon/usdt_parser.c         |  17 +-
 libcommon/usdt_parser.h         |  21 +-
 libcommon/usdt_parser_dof.c     |   1 +
 libcommon/usdt_parser_host.c    |   7 +-
 libcommon/usdt_parser_notes.c   | 774 ++++++++++++++++++++++++++++++++
 uts/common/sys/usdt_note_defs.h |  18 +
 10 files changed, 1364 insertions(+), 120 deletions(-)
 create mode 100644 libcommon/usdt_parser_notes.c
 create mode 100644 uts/common/sys/usdt_note_defs.h

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 6a4ecb86..6f176f2e 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -14,8 +14,12 @@
  *
  * /run/dtrace/stash/: Things private to dtprobed.
  *
- *    .../dof/$dev-$ino: DOF contributed by particular mappings, in raw form
- *    (as received from some probe-containing program).
+ *    .../dof/$dev-$ino: USDT definition data contributed by particular
+ *    mappings, in raw form (as received from some probe-containing program).
+ *
+ *    .../dof/$dev-$ino-$n: Additional USDT definition data contributed by
+ *    particular mappings, in raw form (as received from some probe-containing
+ *    program).
  *
  *    .../dof-pid/$pid/$dev-$ino/: contains everything relating to DOF
  *    contributed by a particular USDT-containing ELF object within a given
@@ -34,12 +38,14 @@
  *    $dev-$ino (as in the $dev-$ino directory entries): the dev/ino of the
  *    process's primary text mapping, as given by libproc.
  *
- *    .../dof-pid/$pid/$dev-$ino/raw: hardlink to the DOF for a given DOF
- *    source.  Pruned of dead processes at startup and on occasion: entries also
- *    deleted on receipt of DTRACEHIOC_REMOVE ioctls.  A hardlink is used in
- *    order to bump the link count for the corresponding DOF in the dof/
- *    directory: when this link count falls to 1, the DOF is considered dead and
- *    the corresponding probe is removed.
+ *    .../dof-pid/$pid/$dev-$ino/raw and
+ *    .../dof-pid/$pid/$dev-$ino/raw-$n: hardlinks to the USDT definition data
+ *    for a given probe-containing program.  Pruned of dead processes at
+ *    startup and on occasion: entries also deleted on receipt of
+ *    DTRACEHIOC_REMOVE ioctls.  A hardlink is used in order to bump the link
+ *    count for the corresponding data in the dof/ directory: when this link
+ *    count falls to 1, the data is considered dead and the corresponding probe
+ *    is removed.
  *
  *    .../dof-pid/$pid/$dev-$ino/dh: Raw form of the dof_helper_t received from
  *    a given DTRACEHIOC_ADDDOF, serialized straight to disk with no changes.
@@ -394,58 +400,163 @@ write_chunk(int fd, const void *buf, size_t size)
 }
 
 /*
- * Write out a piece of raw DOF.  Returns the length of the file written,
- * or 0 if none was needed (or -1 on error).
+ * Prototype for utility function for usdt_data_apply().  Arguments are:
+ *   - Directory fd
+ *   - Base filename
+ *   - USDT data
+ *   - 'all' flag
+ *   - Secondary directory fd
+ */
+typedef int (*usdt_data_fn)(int, const char *, const usdt_data_t *, int, int);
+
+/*
+ * Call the given function for every data block in the USDT data.  Each call
+ * will be provided with the appropriate adjusted filename.
+ *
+ * If all == 0, returns the number of calls that returned true.
+ * If all == 1, returns 0 if any of the calls did not return true, and
+ * otherwise the total number of calls (that all returned true).
+ * Return -1 if the operation fails.
  */
 static int
-dof_stash_write_raw(int dirfd, const char *name, const void *buf, size_t size)
+usdt_data_apply(usdt_data_fn func, int dirfd, const char *name,
+		const usdt_data_t *data, int all, int dirfd2)
 {
-	struct stat s;
-	int fd;
-
-	/*
-	 * Sanity check: if the DOF already exists but is not the same size as
-	 * the DOF we already have, complain, and replace it.  If it does exist,
-	 * there's no need to write it out.
-	 *
-	 * If we can't even unlink it or write it out, we give up -- the stash
-	 * has failed and we won't be able to do anything it implies.
-	 *
-	 * (This is only a crude check -- obviously distinct raw DOF could be
-	 * the same size by pure chance.)
-	 */
-	if (fstatat(dirfd, name, &s, 0) == 0) {
-		if (s.st_size == size)
-			return 0;
+	int i, cnt;
+	char *fn = (char *)name;
+
+	for (i = cnt = 0; data != NULL; i++, data = data->next) {
+		if (i > 0) {
+			if (asprintf(&fn, "%s-%d", name, i) < 0) {
+				fuse_log(FUSE_LOG_ERR, "dtprobed: out of memory making part name\n");
+				return -1;
+			}
+		}
 
-		fuse_log(FUSE_LOG_ERR, "dtprobed: DOF %s already exists, "
-			 "but is %zx bytes long, not %zx: replacing\n",
-			 name, s.st_size, size);
-		if (unlinkat(dirfd, name, 0) < 0) {
-			fuse_log(FUSE_LOG_ERR, "dtprobed: cannot remove old DOF %s: %s\n",
-				 name, strerror(errno));
+		switch (func(dirfd, fn, data, i, dirfd2)) {
+		case 1:
+			cnt++;
+			break;
+		case 0:
+			break;
+		case -1:
 			return -1;
 		}
+
+		if (i > 0)
+			free(fn);
 	}
 
-	if ((fd = openat(dirfd, name, O_CREAT | O_EXCL | O_WRONLY, 0644)) < 0) {
-		fuse_log(FUSE_LOG_ERR, "dtprobed: cannot write out raw DOF: %s\n",
-			 strerror(errno));
-		return -1;
+	if (all)
+		return cnt == i ? 1 : 0;
+
+	return cnt;
+}
+
+/*
+ * Utility function used through usdt_data_apply().  This returns 1 if the file
+ * is considered identical to the data block; otherwise 0.
+ *
+ * Note: if USDT data exists and has the same size, it is deemed identical.
+ * (This is only a crude check -- distinct raw USDT data could be the same size
+ * by pure chance.)
+ */
+static int
+stale_data_file(int dirfd, const char *fn, const usdt_data_t *data, int idx,
+		int dummy)
+{
+	struct stat s;
+
+	if (fstatat(dirfd, fn, &s, 0) == 0)
+		return s.st_size == data->size ? 1 : 0;
+
+	return 0;
+}
+
+/*
+ * Utility function used through usdt_data_apply().  Writes a USDT data block
+ * as raw data to disk.  Returns 1 on success; -1 on failure.
+ */
+static int
+write_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
+	       int dummy)
+{
+	int fd;
+
+	if ((fd = openat(dirfd, fn, O_CREAT | O_TRUNC | O_WRONLY, 0644)) < 0) {
+		fuse_log(FUSE_LOG_ERR,
+			 "dtprobed: cannot open raw data %s: %s\n",
+			 fn, strerror(errno));
+		return 0;
+	}
+	if (write_chunk(fd, &data->base, sizeof(size_t)) < 0 ||
+	    write_chunk(fd, data->buf, data->size) < 0) {
+		fuse_log(FUSE_LOG_ERR,
+			 "dtprobed: cannot write out raw data %s: %s\n",
+			 fn, strerror(errno));
+		close(fd);
+		return 0;
+	}
+	if (close(fd) < 0) {
+		fuse_log(FUSE_LOG_ERR,
+			 "dtprobed: cannot close raw data %s: %s\n",
+			 fn, strerror(errno));
+		return 0;
 	}
 
-	if (write_chunk(fd, buf, size) < 0)
-		goto err;
+	return 1;
+}
 
-	if (close(fd) < 0)
-		goto err;
-	return size + sizeof(uint64_t);
+/*
+ * Utility function used through usdt_data_apply().  Removes the given file,
+ * and returns 1 (failures can be ignored - nothing we can do about them).
+ */
+static int
+remove_data_file(int dirfd, const char *fn, const usdt_data_t *data, int idx,
+		 int dummy)
+{
+	unlinkat(dirfd, fn, 0);
 
-err:
-	fuse_log(FUSE_LOG_ERR, "dtprobed: cannot write out DOF: %s\n",
-		 strerror(errno));
-	unlinkat(dirfd, name, 0);
-	close(fd);
+	return 1;
+}
+
+/*
+ * Write out a piece of raw USDT definition data.  Returns a positive integer
+ * (the number of files written) if data was written, or 0 if none was needed
+ * (or -1 on error).
+ */
+static int
+dof_stash_write_raw(int dirfd, const char *name, const usdt_data_t *data)
+{
+	int rc;
+
+	/*
+	 * Verify whether the raw USDT data already exists on disk.  The return
+	 * value will be 1 if it exists and all blocks are deemed identical to
+	 * the USDT data; otherwise 0.  (Errors result in returning -1.)
+	 */
+	rc = usdt_data_apply(stale_data_file, dirfd, name, data, 1, 0);
+	if (rc == -1)
+		return -1;
+
+	if (rc == 1)
+		return 0;
+
+	/*
+	 * Write out the USDT data blocks.
+	 *
+	 *   rc = 1: All blocks written successfully.
+	 *   rc = 0: Some blocks not written.
+	 *   rc = -1: An erorr happened (some blocks not written).
+	 *
+	 * If some blocks were not written, we try to clean up (remove all that
+	 * was written), and return -1.
+	 */
+	rc = usdt_data_apply(write_raw_data, dirfd, name, data, 1, 0);
+	if (rc != 0)
+		return rc;
+
+	usdt_data_apply(remove_data_file, dirfd, name, data, 0, 0);
 	return -1;
 }
 
@@ -887,6 +998,33 @@ err:
 	return 0;
 }
 
+/*
+ * Utility function used through usdt_data_apply().  Create a link to the given
+ * file as raw-%n and return 1; return 0 on failure.
+ */
+static int
+create_raw_link(int dirfd, const char *fn, const usdt_data_t *data, int idx,
+		int rdirfd)
+{
+	char *rn = "raw";
+	int rc;
+
+	if (idx > 0) {
+		if (asprintf(&rn, "raw-%d", idx) < 0) {
+			fuse_log(FUSE_LOG_ERR,
+				 "dtprobed: out of memory making part name\n");
+			return -1;
+		}
+	}
+
+	rc = linkat(dirfd, fn, rdirfd, rn, 0);
+
+	if (idx > 0)
+		free(rn);
+
+	return rc < 0 ? 0 : 1;
+}
+
 /*
  * Add a piece of raw DOF from a given (pid, dev, ino) triplet.  May remove
  * stale DOF in the process.
@@ -895,7 +1033,7 @@ err:
  */
 int
 dof_stash_add(pid_t pid, dev_t dev, ino_t ino, dev_t exec_dev, dev_t exec_ino,
-	      const dof_helper_t *dh, const void *dof, size_t size)
+	      const dof_helper_t *dh, const usdt_data_t *data)
 {
 	char *dof_name = make_dof_name(dev, ino);
 	char *pid_name = make_numeric_name(pid);
@@ -974,12 +1112,13 @@ dof_stash_add(pid_t pid, dev_t dev, ino_t ino, dev_t exec_dev, dev_t exec_ino,
 	 * otherwise.
 	 */
 	new_dof = 1;
-	switch (dof_stash_write_raw(dof_dir, dof_name, dof, size)) {
+	switch (dof_stash_write_raw(dof_dir, dof_name, data)) {
 	case 0: new_dof = 0; break;
 	case -1: goto err_unlink_nomsg; break;
 	}
 
-	if (linkat(dof_dir, dof_name, perpid_dof_dir, "raw", 0) < 0)
+	if (usdt_data_apply(create_raw_link, dof_dir, dof_name, data, 1,
+			    perpid_dof_dir) == 0)
 		goto err_unlink_msg;
 
 	if (dof_stash_write_file(perpid_dof_dir, "dh", dh,
@@ -1041,7 +1180,7 @@ err_unlink_msg:
 		 "DOF mapping %lx/%lx into place: %s\n", pid, dev, ino,
 		 strerror(errno));
 err_unlink_nomsg:
-	unlinkat(perpid_dof_dir, "raw", 0);
+	usdt_data_apply(remove_data_file, perpid_dof_dir, "raw", data, 0, 0);
 	unlinkat(perpid_dir, dof_name, AT_REMOVEDIR);
 
 	if (gen_name)
@@ -1052,8 +1191,10 @@ err_unlink_nomsg:
 		unlinkat(pid_dir, pid_name, AT_REMOVEDIR);
 	}
 
-	if (new_dof)
+	if (new_dof) {
+		usdt_data_apply(remove_data_file, dof_dir, dof_name, data, 0, 0);
 		unlinkat(dof_dir, dof_name, 0);
+	}
 
 	goto out_free;
 }
@@ -1132,44 +1273,64 @@ unlinkat_many(int dirfd, const char **names)
 }
 
 /*
- * Determine if a file or directory (in the DOF stash) should be deleted.
+ * Utility function used through usdt_data_apply().  Determine if a file in the
+ * stash should be deleted, and if so, do it.  Returns 1 if it got deleted;
+ * returns 0 if not needed; returns -1 on error.
  */
 static int
-refcount_cleanup_p(int dirfd, const char *name, int isdir)
+refcount_cleanup_file(int dirfd, const char *fn, const usdt_data_t *data,
+		      int idx, int dummy)
 {
 	struct stat s;
 
-	if (fstatat(dirfd, name, &s, 0) != 0) {
+	if (fstatat(dirfd, fn, &s, 0) != 0) {
+		if (errno == ENOENT) {
+			((usdt_data_t *)data)->next = NULL;
+			return 1;
+		}
+
 		fuse_log(FUSE_LOG_ERR, "Cannot stat %s for cleanup: %s\n",
-			 name, strerror(errno));
+			 fn, strerror(errno));
 		return -1;
 	}
 
-	if ((isdir && s.st_nlink != 2) || (!isdir && s.st_nlink != 1))
+	if (s.st_nlink != 1)
 		return 0;
 
+	if (unlinkat(dirfd, fn, 0) < 0) {
+		fuse_log(FUSE_LOG_ERR,
+			 "dtprobed: cannot remove old data %s: %s\n",
+			 fn, strerror(errno));
+		return -1;
+	}
+
 	return 1;
 }
 
-
 /*
- * Delete a file or directory (in the DOF stash) if it has no other links.
+ * Delete a directory (in the stash) if it has no other links.
  */
 static int
-refcount_cleanup(int dirfd, const char *name, int isdir)
+refcount_cleanup_dir(int dirfd, const char *name)
 {
-	switch (refcount_cleanup_p(dirfd, name, isdir)) {
-	case -1: return -1;
-	case 0: return 0;
-	default: break;
+	struct stat s;
+
+	if (fstatat(dirfd, name, &s, 0) != 0) {
+		fuse_log(FUSE_LOG_ERR, "Cannot stat %s for cleanup: %s\n",
+			 name, strerror(errno));
+		return -1;
 	}
 
-	if (unlinkat(dirfd, name, isdir ? AT_REMOVEDIR : 0) < 0) {
+	if (s.st_nlink != 2)
+		return 0;
+
+	if (unlinkat(dirfd, name, AT_REMOVEDIR) < 0) {
 		fuse_log(FUSE_LOG_ERR, "dtprobed: cannot remove old DOF %s: %s\n",
 			 name, strerror(errno));
 		return -1;
 	}
-	return 0;
+
+	return 1;
 }
 
 /*
@@ -1262,6 +1423,27 @@ err:
 	return -1;
 }
 
+/*
+ * Utility function used through usdt_data_apply().  Removes the given file,
+ * and returns 1 (failures can be ignored - nothing we can do about them).
+ * If a file was successfully removed, data->next to set to data to signal the
+ * iterator to move on to the next file.  If no file was found, data->next is
+ * set to NULL to indicate that we are done.
+ */
+static int
+remove_raw_file(int dirfd, const char *fn, const usdt_data_t *data, int idx,
+		  int dummy)
+{
+	usdt_data_t *dp = (usdt_data_t *)data;
+
+	if (unlinkat(dirfd, fn, 0) < 0 && errno == ENOENT)
+		dp->next = NULL;
+	else
+		dp->next = dp;
+
+	return 1;
+}
+
 /*
  * Remove a piece of DOF, identified by generation counter.  Return -1 on error.
  *
@@ -1279,6 +1461,7 @@ dof_stash_remove(pid_t pid, int gen)
 	struct stat gen_stat;
 	int err = -1;
 	const char *unlink_err = NULL;
+	usdt_data_t data;
 
 	/*
 	 * Figure out the per-PID DOF directory by following the gen-counter
@@ -1333,10 +1516,14 @@ dof_stash_remove(pid_t pid, int gen)
 	fuse_log(FUSE_LOG_DEBUG, "%i: gen_name: %s; gen_linkname: %s; perpid_dof_dir: %i\n",
 		 pid, gen_name, gen_linkname, perpid_dof_dir);
 
-	if (unlinkat(perpid_dof_dir, "raw", 0) != 0 && errno != ENOENT) {
-		fuse_log(FUSE_LOG_ERR, "dtprobed: cannot unlink per-PID raw DOF for PID %i generation %i: %s\n",
-			 pid, gen, strerror(errno));
-	}
+	/*
+	 * We use a fake USDT data structure so we can use the USDT data block
+	 * iterator to call our calllback.  It will keep iterating until the
+	 * first non-existant file is encountered (indicating we reached the
+	 * endof the data blocks).
+	 */
+	data.next = &data;
+	usdt_data_apply(remove_raw_file, perpid_dof_dir, "raw", &data, 0, 0);
 
 	if (dof_stash_remove_parsed(pid, perpid_dof_dir, gen_linkname) < 0)
 		unlink_err = "parsed probes dir entries";
@@ -1353,7 +1540,15 @@ dof_stash_remove(pid_t pid, int gen)
 	if (unlinkat(perpid_dir, gen_name, 0) < 0)
 		unlink_err = gen_name;
 
-	if (refcount_cleanup(dof_dir, gen_linkname, 0) < 0)
+	/*
+	 * We use a fake USDT data structure so we can use the USDT data block
+	 * iterator to call our calllback.  It will keep iterating until the
+	 * first non-existance file is encountered (indicating we reached the
+	 * endof the data blocks).
+	 */
+	data.next = &data;
+	if (usdt_data_apply(refcount_cleanup_file, dof_dir, gen_linkname,
+			    &data, 0, 0) < 0)
 		unlink_err = gen_linkname;
 
 	/*
@@ -1380,7 +1575,7 @@ dof_stash_remove(pid_t pid, int gen)
 				 pid, strerror(errno));
 			goto err;
 		}
-		refcount_cleanup(pid_dir, pid_name, 1);
+		refcount_cleanup_dir(pid_dir, pid_name);
 	}
 
 	if (unlink_err)
@@ -1556,6 +1751,62 @@ scan_failure:
 	goto out;
 }
 
+/*
+ * Utility function used through usdt_data_apply().  Read a USDT data block
+ * from disk.  Returns 1 on success of if the file is not found; -1 on error.
+ */
+static int
+read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
+	      int dummy)
+{
+	int fd;
+	usdt_data_t *dp;
+
+	/*
+	 * If the file does not exist, we assume that we have reached the last
+	 * file for this USDT data.  We can return 1, because we know that
+	 * data->next is NULL so the iterator will stop.
+	 */
+	if ((fd = openat(dirfd, fn, O_RDONLY | O_CLOEXEC)) < 0) {
+		if (errno == ENOENT)
+			return 1;
+
+		return -1;
+	}
+
+	/*
+	 * Allocate a new block.  We set the next pointer to the block itself
+	 * so that the iterator that called us knows that we need look for a
+	 * following block.  If none is found, the next call will assign NULL
+	 * to this next pointer and end the block chain.
+	 */
+	if ((dp = malloc(sizeof(usdt_data_t))) == NULL)
+		return -1;
+
+	dp->size = 0;
+	dp->base = 0;
+	dp->next = NULL;
+
+	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL) {
+		close(fd);
+		free(dp);
+		return -1;
+	}
+
+	/*
+	 * Raw data blocks are written as a base address (size_t) followed by
+	 * the actual data.  Set dp->base from the data just read, and adjust
+	 * the buffer pointer and size.  When the buffer is to be freed, the
+	 * pointer will need to be adjusted back.
+	 */
+	dp->base = *(size_t *)dp->buf;
+	dp->size -= sizeof(size_t);
+	dp->buf = ((char *)dp->buf) + sizeof(size_t);
+
+	((usdt_data_t *)data)->next = dp;
+	return 1;
+}
+
 /*
  * Reparse all DOF.  Mappings that cannot be reparsed are simply ignored, on the
  * grounds that most DOF, most of the time, is not used, so this will likely be
@@ -1639,10 +1890,9 @@ reparse_dof(int out, int in,
 			int fd;
 			dev_t dev;
 			ino_t ino;
-			size_t dof_size, dh_size;
-			void *dof = NULL;
+			size_t dh_size;
 			void *dh = NULL;
-			usdt_data_t data;
+			usdt_data_t data, *dp, *nxt;
 
 			if (errno != 0) {
 				fuse_log(FUSE_LOG_ERR, "reparsing DOF: cannot read per-PID DOF mappings for pid %s: %s\n",
@@ -1707,53 +1957,53 @@ reparse_dof(int out, int in,
 				continue;
 			}
 
-			if ((fd = openat(mapping_fd, "raw", O_RDONLY | O_CLOEXEC)) < 0) {
-				fuse_log(FUSE_LOG_ERR, "when reparsing DOF, cannot open raw DOF for PID %s, mapping %s: ignored: %s\n",
+			data.base = 0;
+			data.size = 0;
+			data.buf = NULL;
+			data.next = NULL;
+			if (usdt_data_apply(read_raw_data, mapping_fd, "raw",
+					    &data, 0, 0) <= 0) {
+				fuse_log(FUSE_LOG_ERR,
+					 "reparse: cannot open raw data for PID %s, mapping %s: ignored: %s\n",
 					 pid_ent->d_name, mapping_ent->d_name, strerror(errno));
-				close(mapping_fd);
-				continue;
+				goto read_err;
 			}
 
-			if ((dof = read_file(fd, -1, &dof_size)) == NULL) {
-				fuse_log(FUSE_LOG_ERR, "when reparsing DOF, cannot read raw DOF for PID %s, mapping %s: ignored: %s\n",
-					    pid_ent->d_name, mapping_ent->d_name, strerror(errno));
-				close(mapping_fd);
-				close(fd);
-				continue;
-			}
-			close(fd);
-
 			if ((fd = openat(mapping_fd, "dh", O_RDONLY | O_CLOEXEC)) < 0) {
 				fuse_log(FUSE_LOG_ERR, "when reparsing DOF, cannot open dh for PID %s, mapping %s: ignored: %s\n",
 					    pid_ent->d_name, mapping_ent->d_name, strerror(errno));
-				free(dof);
-				close(mapping_fd);
-				continue;
+				goto read_err;
 			}
 
 			if ((dh = read_file(fd, -1, &dh_size)) == NULL) {
 				fuse_log(FUSE_LOG_ERR, "when reparsing DOF, cannot read dh for PID %s, mapping %s: ignored: %s\n",
 					    pid_ent->d_name, mapping_ent->d_name, strerror(errno));
-				free(dof);
-				close(mapping_fd);
 				close(fd);
-				continue;
+				goto read_err;
 			}
 			close(fd);
 
-			fuse_log(FUSE_LOG_DEBUG, "Reparsing DOF for PID %s, mapping %s\n",
+			fuse_log(FUSE_LOG_DEBUG,
+				 "Reparsing raw data for PID %s, mapping %s\n",
 				 pid_ent->d_name, mapping_ent->d_name);
 
-			data.buf = dof;
-			data.size = dof_size;
-			data.next = NULL;
-			if (reparse(pid, out, in, dev, ino, 0, 0, dh, &data, 1) < 0)
-				fuse_log(FUSE_LOG_ERR, "when reparsing DOF, cannot parse DOF for PID %s, mapping %s: ignored\n",
-					    pid_ent->d_name, mapping_ent->d_name);
-			free(dof);
+			if (reparse(pid, out, in, dev, ino, 0, 0,
+				    dh, data.next, 1) < 0)
+				fuse_log(FUSE_LOG_ERR,
+					 "reparse: cannot parse raw data for PID %s, mapping %s: ignored\n",
+					 pid_ent->d_name, mapping_ent->d_name);
+
 			free(dh);
+
+read_err:
 			close(mapping_fd);
 
+			for (dp = data.next; dp != NULL; dp = nxt) {
+				nxt = dp->next;
+				free(((char *)dp->buf) - sizeof(size_t));
+				free(dp);
+			}
+
 			continue;
 
 		perpid_err:
diff --git a/dtprobed/dof_stash.h b/dtprobed/dof_stash.h
index 1017d2d2..32b5eb52 100644
--- a/dtprobed/dof_stash.h
+++ b/dtprobed/dof_stash.h
@@ -26,8 +26,8 @@ int dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum);
 void dof_stash_free(dt_list_t *accum);
 
 int dof_stash_add(pid_t pid, dev_t dev, ino_t ino, dev_t exec_dev,
-		  dev_t exec_ino, const dof_helper_t *dh, const void *dof,
-		  size_t size);
+		  dev_t exec_ino, const dof_helper_t *dh,
+		  const usdt_data_t *data);
 int dof_stash_remove(pid_t pid, int gen);
 int dof_stash_remove_pid(pid_t pid);
 
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index b5c015ac..a8085865 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -439,6 +439,174 @@ usdt_read(pid_t pid, int in)
 	return reply;
 }
 
+/*
+ * Retrieve and process USDT probe data from a .note.usdt section.
+ * The .rodata section is also needed because function names are stored there.
+ */
+static int
+handle_usdt_notes(pid_t pid, uintptr_t addr)
+{
+	ps_prochandle *P = NULL;
+	const prmap_t *mapp, *exec_mapp;
+	const prmap_file_t *prf;
+	dof_helper_t dh;
+	const char *fn, *mod;
+	int fd = -1;
+	Elf *elf = NULL;
+	size_t shstrndx;
+	GElf_Shdr shdr;
+	size_t nbase, dbase;
+	Elf_Scn *scn = NULL, *nscn = NULL, *dscn = NULL;;
+	GElf_Ehdr ehdr;
+	Elf_Data *elfd, *elfn;
+	usdt_data_t ndata, ddata;
+	dev_t dev, exec_dev;
+	ino_t inum, exec_inum;
+	int gen = -1, err;
+
+	/* Grab the process. */
+	if ((P = Pgrab(pid, 2, 0, NULL, &err)) == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: process grab failed: %s\n",
+			 pid, strerror(err));
+		return -1;
+	}
+
+	/* Retrieve mapping information. */
+	mapp = Paddr_to_map(P, addr);
+	if (mapp == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
+			 pid);
+		goto out;
+	}
+
+	dev = mapp->pr_dev;
+	inum = mapp->pr_inum;
+
+	prf = mapp->pr_file;
+	if (prf == NULL || (mapp = prf->first_segment) == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
+			 pid);
+		goto out;
+	} else if ((fn = prf->prf_mapname) == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
+			 pid);
+		goto out;
+	}
+	mod = strrchr(fn, '/');
+	if (mod)
+		mod++;
+	else
+		mod = fn;
+	snprintf(dh.dofhp_mod, sizeof(dh.dofhp_mod), "%s", mod);
+
+	dh.dofhp_addr = mapp->pr_vaddr;
+	dh.dofhp_dof = 0;
+
+	fuse_log(FUSE_LOG_DEBUG, "%i: DOF helper { '%s', %lx, %lx }\n",
+		 pid, dh.dofhp_mod, dh.dofhp_addr, dh.dofhp_dof);
+
+	exec_mapp = Plmid_to_map(P, LM_ID_BASE, PR_OBJ_EXEC);
+	if (exec_mapp == NULL || (prf = exec_mapp->pr_file) == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
+			 pid);
+		goto out;
+	}
+
+	exec_dev = exec_mapp->pr_dev;
+	exec_inum = exec_mapp->pr_inum;
+
+	/* Open the mapping. */
+	if ((fd = open(fn, O_RDONLY)) < 0) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot open %s: %s\n",
+			 pid, fn, strerror(errno));
+		goto out;
+	}
+
+	Prelease(P, PS_RELEASE_NORMAL);
+	Pfree(P);
+	P = NULL;
+
+	/* Retrieve the .note.usdt ELF section. */
+	elf_version(EV_CURRENT);
+	if ((elf = elf_begin(fd, ELF_C_READ_MMAP, NULL)) == NULL ||
+	     elf_kind(elf) != ELF_K_ELF)
+		goto elf_err;
+
+	elf_getshdrstrndx(elf, &shstrndx);
+	if (gelf_getehdr(elf, &ehdr) == NULL)
+		goto elf_err;
+	if (ehdr.e_type == ET_EXEC)
+		dh.dofhp_addr = 0;
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		const char *name;
+
+		if (gelf_getshdr(scn, &shdr) == NULL)
+			goto elf_err;
+
+		if (shdr.sh_type == SHT_NOTE &&
+		    (name = elf_strptr(elf, shstrndx, shdr.sh_name)) &&
+		    strcmp(name, ".note.usdt") == 0) {
+			nscn = scn;
+			nbase = shdr.sh_addr;
+		} else if (shdr.sh_type == SHT_PROGBITS &&
+		    (name = elf_strptr(elf, shstrndx, shdr.sh_name)) &&
+		    strcmp(name, ".rodata") == 0) {
+			dscn = scn;
+			dbase = shdr.sh_addr;
+		}
+	}
+
+	if (nscn == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: no %s section in %s\n",
+			 pid, ".note.usdt", dh.dofhp_mod);
+		goto out;
+	}
+	if (dscn == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: no %s section in %s\n",
+			 pid, ".rodata", dh.dofhp_mod);
+		goto out;
+	}
+
+	if ((elfn = elf_getdata(nscn, 0)) == NULL ||
+	    (elfd = elf_getdata(dscn, 0)) == NULL)
+		goto elf_err;
+
+	fuse_log(FUSE_LOG_DEBUG,
+		 "%i: %s with %s section (%lu bytes), %s section (%lu bytes)\n",
+		 pid, dh.dofhp_mod, ".note.usdt", elfn->d_size, ".rodata",
+		 elfd->d_size);
+
+	ndata.base = nbase;
+	ndata.size = elfn->d_size;
+	ndata.buf = elfn->d_buf;
+	ndata.next = &ddata;
+	ddata.base = dbase;
+	ddata.size = elfd->d_size;
+	ddata.buf = elfd->d_buf;
+	ddata.next = NULL;
+	gen = process_dof(pid, parser_out_pipe, parser_in_pipe, dev, inum,
+			  exec_dev, exec_inum, &dh, &ndata, 0);
+
+	goto out;
+
+elf_err:
+	fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot read ELF %s: %s\n",
+		 pid, dh.dofhp_mod, elf_errmsg(elf_errno()));
+
+out:
+	if (elf)
+		elf_end(elf);
+	if (fd >= 0)
+		close(fd);
+	if (P) {
+		Prelease(P, PS_RELEASE_NORMAL);
+		Pfree(P);
+	}
+
+	return gen;
+}
+
 /*
  * Get the (dev, inum) pair for the mapping the passed-in addr belongs to in the
  * given pid.  (If there are multiple, it doesn't matter which we choose as long
@@ -506,6 +674,13 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 	 */
 
 	switch (cmd) {
+	case DTRACEHIOC_HASUSDT:
+		fuse_log(FUSE_LOG_DEBUG, "DTRACEHIOC_HASUSDT from PID %i, addr %lx\n",
+			 pid, (uintptr_t) arg);
+		if ((gen = handle_usdt_notes(pid, (uintptr_t) arg)) < 0)
+			goto process_err;
+
+		goto process_done;
 	case DTRACEHIOC_ADDDOF:
 		break;
 	case DTRACEHIOC_REMOVE:
@@ -689,14 +864,16 @@ chunks_done:
 		     &exec_dev, &exec_inum)) < 0)
 		goto process_err;
 
-	data.buf = (void *)buf;
+	data.base = 0;
 	data.size = userdata->dof_hdr.dofh_loadsz;
+	data.buf = (void *)buf;
 	data.next = NULL;
 	if ((gen = process_dof(pid, parser_out_pipe, parser_in_pipe,
 			       dev, inum, exec_dev, exec_inum, &userdata->dh,
 			       &data, 0)) < 0)
 		goto process_err;
 
+process_done:
 	if (fuse_reply_ioctl(req, gen, NULL, 0) < 0)
 		goto process_err;
 
@@ -846,8 +1023,8 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		goto oom;
 
 	if (!reparsing)
-		if ((gen = dof_stash_add(pid, dev, inum, exec_dev, exec_inum, dh,
-					 data->buf, data->size)) < 0)
+		if ((gen = dof_stash_add(pid, dev, inum, exec_dev, exec_inum,
+					 dh, data)) < 0)
 			goto fileio;
 
 	if (dof_stash_write_parsed(pid, dev, inum, &accum) < 0) {
diff --git a/libcommon/Build b/libcommon/Build
index 6237351f..c0f459fe 100644
--- a/libcommon/Build
+++ b/libcommon/Build
@@ -10,7 +10,8 @@ libcommon_TARGET = libcommon
 libcommon_DIR := $(current-dir)
 libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
 libcommon_SOURCES = dt_htab.c dt_list.c \
-		    usdt_parser.c usdt_parser_dof.c usdt_parser_host.c
+		    usdt_parser.c usdt_parser_host.c \
+		    usdt_parser_dof.c usdt_parser_notes.c
 libcommon_NOCFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=1 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=2 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3
 libcommon_NOCPPFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=1 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=2 -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3
 libcommon_LIBSOURCES = libcommon
diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index f301fd56..86419809 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -122,6 +122,10 @@ usdt_copyin_block(int in, int out, int *ok)
 
 	memset(data, 0, sizeof(usdt_data_t));
 
+	/* Get the offset of the data block. */
+	if (!usdt_copyin(in, (char *)&data->base, sizeof(data->base)))
+		abort();
+
 	/* Get the size of the data block. */
 	if (!usdt_copyin(in, (char *)&data->size, sizeof(data->size)))
 		abort();
@@ -168,7 +172,7 @@ usdt_copyin_data(int in, int out, int *ok)
 	if (!usdt_copyin(in, (char *)&cnt, sizeof(cnt)))
 		abort();
 
-	if (cnt >= usdt_maxcount) {
+	if (cnt > usdt_maxcount) {
 		usdt_error(out, E2BIG, "block count %zi exceeds maximum %zi",
 			   cnt, usdt_maxcount);
 		return NULL;
@@ -207,9 +211,14 @@ usdt_destroy(dof_helper_t *dhp, usdt_data_t *data)
 void
 usdt_parse(int out, dof_helper_t *dhp, usdt_data_t *data)
 {
-	dof_parsed_t		eof;
-
-	if (usdt_parse_dof(out, dhp, data->buf) != 0)
+	dof_parsed_t	eof;
+	int 		rc = -1;
+
+	if (dhp->dofhp_dof)
+		rc = usdt_parse_dof(out, dhp, data->buf);
+	else
+		rc = usdt_parse_notes(out, dhp, data);
+	if (rc != 0)
 		goto err;
 
 	/*
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index 9dd97e28..d33370e4 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -20,9 +20,10 @@
  */
 typedef struct usdt_data	usdt_data_t;
 struct usdt_data {
-	size_t		size;
-	void		*buf;
-	usdt_data_t	*next;
+	size_t		base;			/* base address of section */
+	size_t		size;			/* data size */
+	void		*buf;			/* data content */
+	usdt_data_t	*next;			/* next buffer */
 };
 
 /*
@@ -62,7 +63,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 2
+#define DOF_PARSED_VERSION 3
 
 typedef struct dof_parsed {
 	/*
@@ -147,9 +148,11 @@ typedef struct dof_parsed {
 			 */
 			uint32_t is_enabled;
 
+			/* V3+ only.  */
 			/*
-			 * XXX Not yet implemented: name, args
+			 * Array of arg source strings.  nargc in length.
 			 */
+			char args[1];
 		} tracepoint;
 
 		struct dpi_err {
@@ -222,6 +225,14 @@ void usdt_parse(int out, dof_helper_t *dhp, usdt_data_t *data);
  */
 int usdt_parse_dof(int out, dof_helper_t *dhp, dof_hdr_t *dof);
 
+/*
+ * Parse probe info out of the passed-in dof_helper_t and ELF notes section
+ * data and emit it to OUT in the form of a stream of dof_parser_info_t.
+ *
+ * Returns 0 on success or a positive errno value on error.
+ */
+int usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data);
+
 /*
  * Shared host and parser-side.
  */
diff --git a/libcommon/usdt_parser_dof.c b/libcommon/usdt_parser_dof.c
index 6a7eb377..bc8e185a 100644
--- a/libcommon/usdt_parser_dof.c
+++ b/libcommon/usdt_parser_dof.c
@@ -662,6 +662,7 @@ emit_tp(int out, uint64_t base, uint64_t offs, int is_enabled)
 	tp.type = DIT_TRACEPOINT;
 	tp.tracepoint.addr = base + offs;
 	tp.tracepoint.is_enabled = is_enabled;
+	tp.tracepoint.args[0] = 0;
 	usdt_parser_write_one(out, &tp, tp.size);
 
 	dt_dbg_dof("        Tracepoint at 0x%lx (0x%llx + 0x%x)%s\n",
diff --git a/libcommon/usdt_parser_host.c b/libcommon/usdt_parser_host.c
index 2e824635..80dcf10f 100644
--- a/libcommon/usdt_parser_host.c
+++ b/libcommon/usdt_parser_host.c
@@ -57,7 +57,7 @@ usdt_parser_host_write(int out, const dof_helper_t *dh, const usdt_data_t *data)
 	size_t cnt = 0;
 	const usdt_data_t *blk;
 
-	/* Write dof_helper_t structure. */
+	/* Write dof_helper_ structure. */
 	if ((err = usdt_parser_write_one(out, (const char *)dh,
 					 sizeof(*dh))) < 0)
 		return err;
@@ -70,8 +70,11 @@ usdt_parser_host_write(int out, const dof_helper_t *dh, const usdt_data_t *data)
 					 sizeof(cnt))) < 0)
 		return err;
 
-	/* Write the blocks (for each, size followed by data). */
+	/* Write the blocks (for each, offset, size, and data). */
 	for (blk = data; blk != NULL; blk = blk->next) {
+		if ((err = usdt_parser_write_one(out, (const char *)&blk->base,
+						 sizeof(blk->base))) < 0)
+			return err;
 		if ((err = usdt_parser_write_one(out, (const char *)&blk->size,
 						 sizeof(blk->size))) < 0)
 			return err;
diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
new file mode 100644
index 00000000..5b7091c3
--- /dev/null
+++ b/libcommon/usdt_parser_notes.c
@@ -0,0 +1,774 @@
+/*
+ * Oracle Linux DTrace; USDT definitions parser - ELF notes.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <assert.h>
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <gelf.h>
+
+#include <dt_htab.h>
+#include <sys/usdt_note_defs.h>
+
+#include "usdt_parser.h"
+
+static void dt_dbg_usdt(const char *fmt, ...)
+{
+#ifdef USDT_DEBUG
+	va_list ap;
+
+	va_start(ap, fmt);
+	vfprintf(stderr, fmt, ap);
+	va_end(ap);
+#endif
+}
+
+#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
+#define ALIGN(x, a)		(((x) + ((a) - 1)) & ~((a) - 1))
+
+typedef struct usdt_note {
+	GElf_Nhdr	*hdr;
+	const char	*name;
+	const char	*desc;
+} usdt_note_t;
+
+static ssize_t
+get_note(int out, usdt_data_t *data, ssize_t off, usdt_note_t *note)
+{
+	size_t		sz;
+
+	assert(note != NULL);
+
+	/* Validate the offset. */
+	if (off >= data->size || sizeof(GElf_Nhdr) > data->size - off) {
+		usdt_error(out, EINVAL, "Invalid ELF note offset %zi", off);
+		return -1;
+	}
+
+	memset(note, 0, sizeof(usdt_note_t));
+
+	/* Get note header and validate its alignment. */
+	note->hdr = (GElf_Nhdr *)((char *)data->buf + off);
+	off += sizeof(GElf_Nhdr);
+	if (!IS_ALIGNED((uintptr_t)note->hdr, 4)) {
+		usdt_error(out, EINVAL, "Pointer to note header not aligned");
+		return -1;
+	}
+
+	dt_dbg_usdt("ELF note header { type %d, namesz %d, descsz %d }...\n",
+		    note->hdr->n_type, note->hdr->n_namesz,
+		    note->hdr->n_descsz);
+
+	/* Validate the name offset and size. */
+	sz = note->hdr->n_namesz;
+	if (off >= data->size || sz > data->size - off) {
+		usdt_error(out, EINVAL, "Invalid name size %d", sz);
+		return -1;
+	}
+
+	note->name = (char *)data->buf + off;
+	off += ALIGN(sz, 4);
+
+	dt_dbg_usdt("ELF note '%s' (%d bytes)\n",
+		    note->name, note->hdr->n_descsz);
+
+	/* Validate the desc offset and size. */
+	sz = note->hdr->n_descsz;
+	if (off >= data->size || sz > data->size - off) {
+		usdt_error(out, EINVAL, "Invalid desc size %d", sz);
+		return -1;
+	}
+
+	note->desc = (char *)data->buf + off;
+	off += ALIGN(sz, 4);
+
+	/*
+	 * If the offset reaches the end of the notes section, report this is
+	 * as the last note.
+	 */
+	if (off >= data->size)
+		return 0;
+
+	return off;
+}
+
+typedef struct dt_provider	dt_provider_t;
+typedef struct dt_probe		dt_probe_t;
+
+/*
+ * Defined providers are stored in a hashtable indexed on provider name.  The
+ * probes defined in the provider are stored in pmap hashtable of the provider,
+ * with a NULL function name.  These probes are used to validate tracepoints
+ * that are found in the actual code.
+ *
+ * During tracepoint validation, probes with actual fuction names will be added
+ * to the pmap hashtable.  These probes will have tracepoint data associated
+ * with them, and are the probes that will be emitted as parsed data for the
+ * provider.  Any probes that do not have tracepoints will be ignored.
+ *
+ * The dt_provider_t.probec tracks the number of probes with tracepoints.
+ */
+struct dt_provider {
+	dt_hentry_t	he;
+	const char	*name;			/* provider name */
+	uint32_t	pattr;			/* provider attributes */
+	uint32_t	mattr;			/* module attributes */
+	uint32_t	fattr;			/* function attributes */
+	uint32_t	nattr;			/* probe name attributes */
+	uint32_t	aattr;			/* argument attributes */
+	uint32_t	probec;			/* probe count */
+	dt_htab_t	*pmap;			/* probe hash */
+};
+
+struct dt_probe {
+	dt_hentry_t	he;
+	dt_probe_t	*next;			/* next probe in list */
+	const char	*prv;			/* provider name */
+	const char	*mod;			/* module name */
+	const char	*fun;			/* function name (or NULL) */
+	const char	*prb;			/* probe name */
+	uint32_t	ntp;			/* number of tracepoints */
+	uint32_t	off;			/* tracepoint offset */
+	uint8_t		is_enabled;		/* is-enabled probe (boolean) */
+	uint8_t		nargc;			/* native argument count */
+	uint8_t		xargc;			/* translated argument count */
+	uint8_t		sargc;			/* source argument count */
+	const char	*nargs;			/* native argument types */
+	size_t		nargsz;			/* size of native arg types */
+	char		*xargs;			/* translated argument types */
+	size_t		xargsz;			/* size of xlated arg types */
+	uint8_t		*xmap;			/* translated argument map */
+	const char	*sargs;			/* source argument strings */
+};
+
+static dt_htab_t	*prvmap;
+static dt_htab_t	*prbmap;
+
+extern uint32_t str2hval(const char *, uint32_t);
+
+static uint32_t prv_hval(const dt_provider_t *pvp) {
+	return str2hval(pvp->name, 0);
+}
+
+static int prv_cmp(const dt_provider_t *p, const dt_provider_t *q) {
+	return strcmp(p->name, q->name);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(prv, dt_provider_t, he)
+DEFINE_HTAB_STD_OPS(prv)
+
+static uint32_t prb_hval(const dt_probe_t *prp) {
+	uint32_t	hval;
+
+	hval = str2hval(prp->prv, prp->off);
+	hval = str2hval(prp->mod, hval);
+	hval = str2hval(prp->fun, hval);
+
+	return str2hval(prp->prb, hval);
+}
+
+static int prb_cmp(const dt_probe_t *p, const dt_probe_t *q) {
+	int	rc;
+
+	rc = strcmp(p->prv, q->prv);
+	if (rc != 0)
+		return rc;
+
+	if (p->fun != NULL) {
+		if (q->fun == NULL)
+			return 1;
+		else {
+			rc = strcmp(p->fun, q->fun);
+			if (rc != 0)
+				return rc;
+		}
+	} else if (q->fun != NULL)
+		return -1;
+
+	rc = strcmp(p->prb, q->prb);
+	if (rc != 0)
+		return rc;
+
+	/* Only compare offsets when both are not zero. */
+	if (p->off == 0 || q->off == 0)
+
+		return 0;
+	return p->off - q->off;
+}
+
+DEFINE_HE_STD_LINK_FUNCS(prb, dt_probe_t, he)
+DEFINE_HTAB_STD_OPS(prb)
+
+/*
+ * Return the cummulative string length of 'cnt' consecutive 0-terminated
+ * strings.  If skip > 0, it indicates how many extra bytes are to be skipped
+ * after the 0-byte at the end of each string.
+ * Return -1 if end is reached before 'cnt' strings were found.
+ */
+static ssize_t
+strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
+{
+	const char	*p = str;
+
+	while (cnt-- > 0) {
+		if (p >= end)
+			return -1;
+
+dt_dbg_usdt("%s: [%s] [%hhd]\n", __func__, p, *(p + strlen(p) + 1));
+		p += strlen(p) + 1 + skip;
+	}
+
+	return p - str;
+}
+
+static int
+parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
+		usdt_note_t *note)
+{
+	const char	*p = note->desc;
+	dt_provider_t	prvt, *pvp;
+	const uint32_t	*vals;
+	uint32_t	probec;
+	int		i;
+
+	prvt.name = p;
+	p += ALIGN(strlen(p) + 1, 4);
+	if (p + 6 * sizeof(uint32_t) - note->desc > note->hdr->n_descsz) {
+		usdt_error(out, EINVAL, "Incomplete note data");
+		return -1;
+	}
+
+	if ((pvp = dt_htab_lookup(prvmap, &prvt)) == NULL) {
+		if ((pvp =  malloc(sizeof(dt_provider_t))) == NULL) {
+			usdt_error(out, ENOMEM, "Failed to allocate provider");
+			return -1;
+		}
+		memset(pvp, 0, sizeof(dt_provider_t));
+		pvp->name = prvt.name;
+		dt_htab_insert(prvmap, pvp);
+		pvp->pmap = dt_htab_create(&prb_htab_ops);
+	} else {
+		usdt_error(out, EEXIST, "Duplicate provider: %s", prvt.name);
+		return -1;
+	}
+
+	vals = (uint32_t *)p;
+	pvp->pattr = *vals++;
+	pvp->mattr = *vals++;
+	pvp->fattr = *vals++;
+	pvp->nattr = *vals++;
+	pvp->aattr = *vals++;
+	probec = *vals++;
+
+	dt_dbg_usdt("[prov] %s::: with %d probe%s\n", pvp->name, probec,
+		    probec == 1 ? "" : "s");
+
+	p = (char *)vals;
+	for (i = 0; i < probec; i++) {
+		int		argc;
+		dt_probe_t	prbt, *prp;
+		ssize_t		len;
+
+		p = (const char *)ALIGN((uintptr_t)p, 4);
+		prbt.prv = pvp->name;
+		prbt.mod = dhp->dofhp_mod;
+		prbt.fun = NULL;
+		prbt.prb = p;
+		prbt.off = 0;
+		p += strlen(p) + 1;
+		if (p + 2 * sizeof(uint8_t) - note->desc > note->hdr->n_descsz) {
+			usdt_error(out, EINVAL, "Incomplete note data");
+			return -1;
+		}
+
+		if ((prp = dt_htab_lookup(pvp->pmap, &prbt)) == NULL) {
+			if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
+				usdt_error(out, ENOMEM, "Failed to allocate probe");
+				return -1;
+			}
+			memset(prp, 0, sizeof(dt_probe_t));
+			prp->prv = prbt.prv;
+			prp->mod = prbt.mod;
+			prp->prb = prbt.prb;
+			prp->off = 0;
+			dt_htab_insert(pvp->pmap, prp);
+		} else {
+			usdt_error(out, EEXIST, "Duplicate probe: %s:%s::%s",
+				   prbt.prv, prbt.mod, prbt.prb);
+			return -1;
+		}
+
+		prp->next = NULL;
+		prp->ntp = 0;
+		prp->is_enabled = 0;
+		prp->nargc = argc = *(uint8_t *)p++;
+		len = strarray_size(argc, p, note->desc + note->hdr->n_descsz,
+				    0);
+		if (len == -1) {
+			usdt_error(out, EINVAL, "Incomplete note data");
+			return -1;
+		}
+		prp->nargsz = len;
+		prp->nargs = p;
+
+		p += len;
+		if (p - note->desc > note->hdr->n_descsz) {
+			usdt_error(out, EINVAL, "Incomplete note data");
+			return -1;
+		}
+
+		prp->xargc = argc = *(uint8_t *)p++;
+		len = strarray_size(argc, p, note->desc + note->hdr->n_descsz,
+				    1);
+		if (len == -1) {
+			usdt_error(out, EINVAL, "Incomplete note data");
+			return -1;
+		} else if (len > 0) {
+			int	j;
+			char	*q;
+
+			len -= argc;
+			prp->xargsz = len;
+			prp->xargs = q = malloc(len);
+			prp->xmap = malloc(argc * sizeof(uint8_t));
+			if (prp->xargs == NULL || prp->xmap == NULL) {
+				usdt_error(out, ENOMEM, "Failed to allocate memory");
+				return -1;
+			}
+			for (j = 0; j < argc; j++) {
+				q = stpcpy(q, p);
+				q++;
+				p += strlen(p) + 1;
+				prp->xmap[j] = *p;
+				p++;
+			}
+		} else {
+			prp->xargsz = 0;
+			prp->xargs = NULL;
+		}
+
+		dt_dbg_usdt("[prov]   %s:%s::%s (nargc %d, xargc %d)\n",
+			    prp->prv, prp->mod, prp->prb, prp->nargc,
+			    prp->xargc);
+	}
+
+	return 0;
+}
+
+static int
+parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
+		usdt_note_t *note)
+{
+	const char	*p = note->desc;
+	uint64_t	off, fno;
+	dt_probe_t	prbt, *prp;
+
+	data = data->next;
+	if (data == NULL) {
+		usdt_error(out, EINVAL, "Missing .rodata data");
+		return -1;
+	}
+
+	if (p + 2 * sizeof(uint64_t) - note->desc > note->hdr->n_descsz) {
+		usdt_error(out, EINVAL, "Incomplete note data");
+		return -1;
+	}
+
+	off = *(uint64_t *)p;
+	p += sizeof(uint64_t);
+	fno = *(uint64_t *)p;
+	p += sizeof(uint64_t);
+
+	prbt.prv = p;
+	p += strlen(p) + 1;
+	if (p - note->desc > note->hdr->n_descsz) {
+		usdt_error(out, EINVAL, "Incomplete note data");
+		return -1;
+	}
+	prbt.mod = dhp->dofhp_mod;
+	if (fno < data->base || (fno -= data->base) >= data->size) {
+		usdt_error(out, EINVAL, "Invalid function name offset");
+		return -1;
+	}
+	prbt.fun = (char *)data->buf + fno;
+	prbt.prb = p;
+	p += strlen(p) + 1;
+	if (p - note->desc > note->hdr->n_descsz) {
+		usdt_error(out, EINVAL, "Incomplete note data");
+		return -1;
+	}
+	prbt.off = off;
+
+	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
+		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
+			usdt_error(out, ENOMEM, "Failed to allocate probe");
+			return -1;
+		}
+		memset(prp, 0, sizeof(dt_probe_t));
+		prp->prv = prbt.prv;
+		prp->mod = prbt.mod;
+		prp->fun = prbt.fun;
+		prp->prb = prbt.prb;
+		prp->off = prbt.off;
+		dt_htab_insert(prbmap, prp);
+	} else {
+		usdt_error(out, EEXIST, "Duplicate probe: %s:%s:%s:%s",
+			   prbt.prv, prbt.mod, prbt.fun, prbt.prb);
+		return -1;
+	}
+
+	prp->next = NULL;
+	prp->is_enabled = (note->hdr->n_type == _USDT_EN_NOTE_TYPE ? 1 : 0);
+	prp->ntp = 0;
+	prp->sargc = *p++;
+	prp->sargs = p;
+	p += strlen(p) + 1;
+	if (p - note->desc > note->hdr->n_descsz) {
+		usdt_error(out, EINVAL, "Incomplete note data");
+		return -1;
+	}
+
+	dt_dbg_usdt("[usdt]   %s:%s:%s:%s (nargc %d, offset %lx)\n",
+		    prp->prv, prp->mod, prp->fun, prp->prb, prp->nargc,
+		    prp->off);
+
+	return 0;
+}
+
+/*
+ * Allocate a dof_parsed_t message structure of the given 'type', with 'len'
+ * extra space following the structure.  The caller is responsible for calling
+ * free on the returned value.
+ * Return NULL if memory allocation failed (an error will have been emitted).
+ */
+static dof_parsed_t *
+alloc_msg(int out, dof_parsed_info_t type, size_t len)
+{
+	dof_parsed_t	*msg;
+
+	switch (type) {
+	case DIT_PROVIDER:
+		len += offsetof(dof_parsed_t, provider.name);
+		break;
+	case DIT_PROBE:
+		len += offsetof(dof_parsed_t, probe.name);
+		break;
+	case DIT_ARGS_NATIVE:
+		len += offsetof(dof_parsed_t, nargs.args);
+		break;
+	case DIT_ARGS_XLAT:
+		len += offsetof(dof_parsed_t, xargs.args);
+		break;
+	case DIT_ARGS_MAP:
+		len += offsetof(dof_parsed_t, argmap.argmap);
+		break;
+	case DIT_TRACEPOINT:
+		len += offsetof(dof_parsed_t, tracepoint.args);
+		break;
+	default:
+		usdt_error(out, EINVAL, "Unknown dof_parsed_t type: %d", type);
+		return NULL;
+	}
+
+	msg = malloc(len);
+	if (msg == NULL) {
+		usdt_error(out, ENOMEM, "Failed to allocate msg (type %d, size %ld)",
+			   type, len);
+		return NULL;
+	}
+	memset(msg, 0, len);
+
+	msg->size = len;
+	msg->type = type;
+
+	return msg;
+}
+
+static int 
+emit_tp(int out, const dof_helper_t *dhp, const dt_probe_t *prp)
+{
+	dof_parsed_t	*msg;
+
+	if ((msg = alloc_msg(out, DIT_TRACEPOINT, strlen(prp->sargs) + 1)) == NULL)
+		return -1;
+
+	msg->tracepoint.addr = prp->off + dhp->dofhp_addr;
+	msg->tracepoint.is_enabled = prp->is_enabled;
+	strcpy(msg->tracepoint.args, prp->sargs);
+
+	usdt_parser_write_one(out, msg, msg->size);
+
+	free(msg);
+
+	dt_dbg_usdt("        Tracepoint at 0x%lx (0x%llx + 0x%x)%s\n",
+		    prp->off + dhp->dofhp_addr, dhp->dofhp_addr, prp->off,
+		    prp->is_enabled ? " (is_enabled)" : "");
+
+	return 0;
+}
+
+static int
+emit_probe(int out, const dof_helper_t *dhp, const dt_probe_t *prp)
+{
+	dof_parsed_t	*msg;
+	char		*p;
+
+	if ((msg = alloc_msg(out, DIT_PROBE, strlen(prp->mod) + 1 +
+					     strlen(prp->fun) + 1 +
+					     strlen(prp->prb) + 1)) == NULL)
+		return -1;
+
+	msg->probe.ntp = prp->ntp;
+	msg->probe.nargc = prp->nargc;
+	msg->probe.xargc = prp->xargc;
+
+	p = stpcpy(msg->probe.name, prp->mod);
+	p++;
+	p = stpcpy(p, prp->fun);
+	p++;
+	strcpy(p, prp->prb);
+
+	usdt_parser_write_one(out, msg, msg->size);
+
+	free(msg);
+
+	dt_dbg_usdt("      Probe %s:%s:%s:%s (%d tracepoints)\n",
+		    prp->prv, prp->mod, prp->fun, prp->prb, prp->ntp);
+
+	/* Emit native and translated arg type data (if any). */
+	if (prp->nargc) {
+		if ((msg = alloc_msg(out, DIT_ARGS_NATIVE, prp->nargsz)) == NULL)
+			return -1;
+
+		memcpy(msg->nargs.args, prp->nargs, prp->nargsz);
+
+		usdt_parser_write_one(out, msg, msg->size);
+
+		free(msg);
+
+		if (prp->xargc) {
+			size_t	mapsz = prp->xargc * sizeof(uint8_t);
+
+			if ((msg = alloc_msg(out, DIT_ARGS_XLAT, prp->xargsz)) == NULL)
+				return -1;
+	
+			memcpy(msg->xargs.args, prp->xargs, prp->xargsz);
+	
+			usdt_parser_write_one(out, msg, msg->size);
+	
+			free(msg);
+
+			if ((msg = alloc_msg(out, DIT_ARGS_MAP, mapsz)) == NULL)
+				return -1;
+	
+			memcpy(msg->argmap.argmap, prp->xmap, mapsz);
+	
+			usdt_parser_write_one(out, msg, msg->size);
+	
+			free(msg);
+		}
+	}
+
+	while (prp != NULL) {
+		if (emit_tp(out, dhp, prp) == -1)
+			return -1;
+
+		prp = prp->next;
+	}
+
+	return 0;
+}
+
+static int
+emit_provider(int out, const dof_helper_t *dhp, const dt_provider_t *pvp)
+{
+	dof_parsed_t	*msg;
+	dt_htab_next_t	*prbit = NULL;
+	dt_probe_t	*prp;
+
+	if ((msg = alloc_msg(out, DIT_PROVIDER, strlen(pvp->name) + 1)) == NULL)
+		return -1;
+
+	strcpy(msg->provider.name, pvp->name);
+	msg->provider.nprobes = pvp->probec;
+
+	usdt_parser_write_one(out, msg, msg->size);
+
+	free(msg);
+
+	dt_dbg_usdt("    Provider %s (%d probes)\n", pvp->name, pvp->probec);
+
+	while ((prp = dt_htab_next(pvp->pmap, &prbit)) != NULL) {
+		if (prp->fun == NULL)
+			continue;
+
+		if (emit_probe(out, dhp, prp) == -1)
+			return -1;
+
+		prp = prp->next;
+	}
+
+	return 0;
+}
+
+int
+usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data)
+{
+	ssize_t		off = 0;
+	int		rc = 0;
+	usdt_note_t	note;
+	dt_probe_t	*ptp;
+	dt_htab_next_t	*prbit, *prvit;
+	dt_provider_t	*pvp;
+
+	/* Hash tables to hold provider and probe info. */
+	prvmap = dt_htab_create(&prv_htab_ops);
+	prbmap = dt_htab_create(&prb_htab_ops);
+
+	/* Process all prov and usdt notes. */
+	while ((off = get_note(out, data, off, &note)) >= 0) {
+		rc = -1;
+		if (strcmp(note.name, "prov") == 0)
+			rc = parse_prov_note(out, dhp, data, &note);
+		else if (strcmp(note.name, "usdt") == 0)
+			rc = parse_usdt_note(out, dhp, data, &note);
+		else if (strcmp(note.name, "dver") == 0 ||
+			 strcmp(note.name, "utsn") == 0)
+			rc = 0;			/* ignore */
+		else
+			usdt_error(out, EINVAL, "Unknown note: %s", note.name);
+
+		if (rc == -1)
+			goto err;		/* error emitted */
+
+		if (off == 0)
+			break;
+	}
+
+	/* Bail on error. */
+	if (off == -1)
+		goto err;
+
+	/*
+	 * Loop through all tracepoints (from usdt notes) and validate them
+	 * against the registered providers and probes (from prov notes).
+	 * Validated tracepoints are added to the provider.
+	 */
+	prbit = NULL;
+	while ((ptp = dt_htab_next(prbmap, &prbit)) != NULL) {
+		dt_provider_t	prvt, *pvp;
+		dt_probe_t	prbt, *prp;
+
+		prvt.name = ptp->prv;
+		if ((pvp = dt_htab_lookup(prvmap, &prvt)) == NULL) {
+			usdt_error(out, ENOENT, "No such provider: %s",
+				   ptp->prv);
+			goto err;
+		}
+
+		/*
+		 * First try to find a matching probe that already has one or
+		 * more tracepoints, i.e. a probe that matches the function
+		 * name as well.
+		 */
+		prbt.prv = ptp->prv;
+		prbt.mod = ptp->mod;
+		prbt.fun = ptp->fun;
+		prbt.prb = ptp->prb;
+		prbt.off = 0;
+		if ((prp = dt_htab_lookup(pvp->pmap, &prbt)) == NULL) {
+			/*
+			 * Not found - make sure there is a defined probe (with
+			 * NULL function name) that matches.
+			 */
+			prbt.fun = NULL;
+			if ((prp = dt_htab_lookup(pvp->pmap, &prbt)) == NULL) {
+				usdt_error(out, ENOENT, "No such probe: %s:::%s",
+					   ptp->prv, ptp->prb);
+				goto err;
+			}
+		}
+
+		if (ptp->sargc != prp->nargc &&
+		    (!ptp->is_enabled || ptp->sargc != 1)) {
+			usdt_error(out, EINVAL,
+				   "%s:::%s%s prototype mismatch: "
+				   "%hhd passed, %hhd expected",
+				   ptp->prv, ptp->prb,
+				   ptp->is_enabled ? " (is-enabled)" : "",
+				   ptp->sargc,
+				   ptp->is_enabled ? 1 : prp->nargc);
+			goto err;
+		}
+
+		/*
+		 * The tracepoint is valid.  Add it to the provider.
+		 * If there was a matching function-specific probe, add the
+		 * tracepoint probe to it.
+		 * If there was no matching function-specific probe, add the
+		 * tracepoint probe to the provider.
+		 * In either cases, argument data is copied.
+		 */
+		if (prp->fun != NULL) {
+			ptp->next = prp->next;
+			ptp->nargc = prp->nargc;
+			ptp->nargs = prp->nargs;
+			ptp->nargsz = prp->nargsz;
+			ptp->xargc = prp->xargc;
+			ptp->xargs = prp->xargs;
+			ptp->xargsz = prp->xargsz;
+			ptp->xmap = prp->xmap;
+			prp->next = ptp;
+			prp->ntp++;
+		} else {
+			dt_htab_delete(prbmap, ptp);
+			dt_htab_insert(pvp->pmap, ptp);
+			ptp->ntp = 1;
+			ptp->nargc = prp->nargc;
+			ptp->nargs = prp->nargs;
+			ptp->nargsz = prp->nargsz;
+			ptp->xargc = prp->xargc;
+			ptp->xargs = prp->xargs;
+			ptp->xargsz = prp->xargsz;
+			ptp->xmap = prp->xmap;
+			pvp->probec++;
+		}
+	}
+
+prvit = NULL;
+while ((pvp = dt_htab_next(prvmap, &prvit)) != NULL) {
+  dt_htab_next_t	*prbit = NULL;
+  dt_probe_t		*prp;
+
+  dt_dbg_usdt("    Provider '%s' with %d probe%s:\n", pvp->name, pvp->probec, pvp->probec == 1 ? "" : "s");
+  while ((prp = dt_htab_next(pvp->pmap, &prbit)) != NULL) {
+    dt_dbg_usdt("      Probe %s:%s:%s:%s (off %x)\n", prp->prv, prp->mod, prp->fun ? prp->fun : "", prp->prb, prp->fun ? prp->off : -1);
+    while ((prp = prp->next) != NULL)
+      dt_dbg_usdt("        Probe %s:%s:%s:%s (off %x)\n", prp->prv, prp->mod, prp->fun ? prp->fun : "", prp->prb, prp->fun ? prp->off : -1);
+  }
+}
+
+	/* Emit any provider that has tracepoints. */
+	prvit = NULL;
+	while ((pvp = dt_htab_next(prvmap, &prvit)) != NULL) {
+		if (pvp->probec > 0 && emit_provider(out, dhp, pvp) == -1)
+			goto err;
+	}
+
+	goto out;
+
+err:
+	rc = -1;
+
+out:
+	dt_htab_destroy(prvmap);
+	dt_htab_destroy(prbmap);
+
+	return rc;
+}
diff --git a/uts/common/sys/usdt_note_defs.h b/uts/common/sys/usdt_note_defs.h
new file mode 100644
index 00000000..1501383e
--- /dev/null
+++ b/uts/common/sys/usdt_note_defs.h
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef _SYS_USDT_NOTE_DEFS_H_
+#define	_SYS_USDT_NOTE_DEFS_H_
+
+#define _USDT_SECT_NAME		.note.usdt
+#define _USDT_TP_NOTE_NAME	"usdt"		/* (string constant) */
+#define _USDT_TP_NOTE_TYPE	1		/* regular probe */
+#define _USDT_EN_NOTE_TYPE	2		/* is-enabled probe */
+#define _USDT_PV_NOTE_NAME	"prov"		/* (string constant) */
+#define _USDT_PV_NOTE_TYPE	1
+
+#endif /* _SYS_USDT_NOTE_DEFS_H_ */
-- 
2.45.2

