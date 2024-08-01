Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1183A1DA
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722531792; cv=fail; b=huZnDZUpIP1WdJpHTuit7WFryk+5te+ObxCCPYPWZeuqV4xvQHaaUEryPT8IMBbUEmo5kiS143qESNXHzbfgXp4ybHPvhimV65gIyKflum2WTF0fzqydiQvdG5fjOuiwEtON+cbXz+kPT8uP4xZB3BfCdZaKKQcbktgClqdUywY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722531792; c=relaxed/simple;
	bh=q1ACvI7GFAR9GzYxFQaEnESqnh+HdHrfE540MIZmEiI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ndyxdPB9Lkx2vAHhElNcW+j68w/BCLNc/08AA5sqYVF8yPuje8FbOG816iNYP+a0SGTaEGKpS9NsMTg1No0hrzW3sOu09Iv5aJ+eBvA5dofWy/ww5QNKFqSgs9NgElF0wk5ETCWFZVM36fd8uOF54BvafgoBMhoO1Z7450auPy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hLXnPHS5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IT04nAj0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hLXnPHS5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IT04nAj0"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0bfD022391
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=TPYKPVfmhp/qry/kf9Gu0zMv38mtF88TZGKraCJrrmE=; b=
	hLXnPHS50W3l5rgiDCK8F6jJCAkoCUi0mguoU81qnAK0nAhdNY6HSaAPHblvjm8A
	ax/nJCQffsjy3graWmvv3zgqpgN8L2qSestm/v3ibvBdOQvFWo+U0RVFCUpIdM/p
	yRxrSol8AH550ncsK/HW+G29cKK3KYMlutD+2NSrXGnNPk5B+3KglToU2lL0JdpX
	zqKHCbtdzmBVTQZCgK2Avk+fE1fEWUIHtqbLljB0a0FOsm9zqmfoO1pdylqqTWQx
	zU4v9lsG5O4cNnGXgtHGNxv7yOmPv1HlI3Z880uA/w4ehz2Jaofv2IZmlqEIMz3k
	4GILmJw6sBQMK1betUmFCg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqtatbqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:03:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471GR2vK040355
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:03:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm86801t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulaXHo/OkC8fjBuxqFlpj2wZzt9WfqKGxssd1PAVW5vbrUuU6aibUuVa4TgbGEa5xrh39Z/DVm13sRwP9WDeYaYhFcuKv7M9CrIQjyhxDSZyrkaKLAVOlSIv3woHFy9wg7TTxkFFF/w7/fSg0izzRz+4mSPIWOigiY4kh205jTFbWPK5SN290MB2TMST5J8GoQ2c+b6ZNT0k+VnLZNu8XFqKewvr8liNdIPSTwUnnNuKu3OY3p5MI44t6NsbpvOnNIeukkNvxWpUmvLK0NIzZFM/HD7AvThKChyT+o04Qg9HTBF76+CUopaCu+xSm2F4MkHnW5PfruTrZhcfJ1zoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPYKPVfmhp/qry/kf9Gu0zMv38mtF88TZGKraCJrrmE=;
 b=UlTun7xz2kKVM2hXv7P1L3O1GDRDjm24TQGf7U2vsz8O8XkPjOgwYdVg+5jIKs+sPE6Ghin27od+lYJ6SZFLpwxyfw3q34L9uDcw5Ap7XJza2jPA1OsRW9TmVteOARW7hbco/XaR1oncy6vXomvG88CzVEt3si5ePpgbQQO932ZOTr5Q5YLTL1PgChO+JtWoGf9D5qfM6HdIZB1Re+LE61M4N/1ppox+Ahf4eANl7yA86VFazB+eZpC5me+InyQnXncjCSnbf2zcAB+2JtDg7RkO1lCjcrTxDXvnfXPiw9EW3dQPM14N8xaVneZxkzVHLjJx/wYJCwiEHnXdhHW7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPYKPVfmhp/qry/kf9Gu0zMv38mtF88TZGKraCJrrmE=;
 b=IT04nAj0enjk6PJ91+TQWDn71psDIX0jv6dJ4heNEHfA20R7OFTz1bvZCHKmKEJ1WwOEgsuijnn2VxUEdgs65ha36lQBm3Vbxjlzlnv+OC7FvWWRlw8Q3VhXVFjWQmtdoQKwgak/qrajB5OK0SHAJrkpV1yIR9E/AtRsLsVE+C8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB7392.namprd10.prod.outlook.com (2603:10b6:8:10c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 17:03:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 17:03:04 +0000
Date: Thu, 01 Aug 2024 12:54:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Fix access to kernel variable
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:207:3d::45) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287C0DD69CED888C1ABEB80C2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: ff867deb-5c15-489d-3883-08dcb24bcef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YjjWi7zp82d0OghMMOpkXUQ6nH55dovH8aXXg7D45LGch+PmOjoLVfMUzSZp?=
 =?us-ascii?Q?UTiTk2PKmqahUSw4fHk2hb4686hLCaenCWbEyAu9oVNkOAbfwCs7s30h30qa?=
 =?us-ascii?Q?xpyv4LGj0BcvIDFbArHkzNp34EXFkVTfSUr3N8aibVEAjvbLKtuajzEnTOsa?=
 =?us-ascii?Q?oU/I4rCPKieTMhNOVC7ptSPkhVaTe0pA9BNTFRr46saEfmsjjSk3WiqG6Y8y?=
 =?us-ascii?Q?dzLbEvK3FNqmAHFAtGaPdH6fT9nsLa0nJopxHdY9CPGjnRvMGZmB7S71whWk?=
 =?us-ascii?Q?QTBfX25GhGZjwBZVzsClpkxcWis73cjzp7chVtZFAJy4HSzuZLnUywSs6H2v?=
 =?us-ascii?Q?0Tvk00ESd3tzDPhoMzxncWSB0HAB3W+j+Ok/ZdE9Sdo0urNSigj5Ml826aYE?=
 =?us-ascii?Q?1CHiiwDobGe+BPOvbqKd+hkB8HppfnKu7OVGMJNdzRO5KfM89REtKU+7iOcn?=
 =?us-ascii?Q?tCAxhHk/5pN+evg4cDcKGsicK8d9llDi/KEQ2jqokAIN5y8l12rvlZvoONXz?=
 =?us-ascii?Q?A1sfzXxPIBbMNLvzmbDWuSP5fS6ifmqhdCK4XBfq70eU7CZc+BYLnD0hufm8?=
 =?us-ascii?Q?Kxjz4Q5lQHfQ/OXWoSpKHAZR8GYnvoFAM7S7lLIQEPN4x9oHiSRkHWwwPh+m?=
 =?us-ascii?Q?bh+ID5y6yF7wjTVtgVUEx8GYm9G2AnrXbcpKuZz+045MEGhTEquqXMKmJbZ3?=
 =?us-ascii?Q?vIQYKG/wGxc96H11BGHbX+k9482JzbMrsLuOC7AKxFKC+LJfCpUDFKpjmuG1?=
 =?us-ascii?Q?fSB3z/p+Rl+nuk2IV3ZMzh5Ik+/5q1Z3og31ZRrZv5P79jZz6JhPQPlZ8Rvj?=
 =?us-ascii?Q?REzJS3d4lDVfQRO9F3QGD7Ux1ljeNwqiN7fWNnvF/kaNlvnCwpuEIgr9pFiI?=
 =?us-ascii?Q?UOzpiUVF5MPVXrAyrOjk9kmi+KTnj56b2dyh3Fd8BcOMuIPrnvl0IVg8Tm6i?=
 =?us-ascii?Q?2D8pMlLYSbavUx+5gHsNEaOcpfNE+HhNiTG/Iu+y7skw78YEYhTiTrePYtnX?=
 =?us-ascii?Q?SS7DfZOpFFXRjxp0UraNIYR7YNkWpGkDvz2+ZkvYxyu7kahkwFTd+jbyqT2I?=
 =?us-ascii?Q?udlEf7EmnHTu7yhiw4f6Nev0lyq4xYIInT/derJfuoFd0RxQweZXJErhcETR?=
 =?us-ascii?Q?0QNHNOR/FZ273cbskmcTEGLHu56Dgw8Vxu6y1IszJYtomF4jTMjXvAIp/ESp?=
 =?us-ascii?Q?XRf6S9i/IPbMGomDA8YvFTvezgnj4p7i4CLAizXsQjC/Ksyo73L3+dDIASlI?=
 =?us-ascii?Q?YAK1ekl0hAUh+8Tdwgq3Bf45zgAlVAdsq98NHHb92qs4HBdyZq5R+46pmuuG?=
 =?us-ascii?Q?vMJxlj8N2+UAmMBRkQ4Ao16cmExc6eu5UbsXkba2+XRndg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vfzTDWTEbT+ULuv76iXRaS5NxMg3LSx6CSDfYD6CUsQIIXQBTiscBdbHUNfH?=
 =?us-ascii?Q?8bEiAKejutPsKwhhk7Vr6J3D2zgeefHgCZETHnychL84FKijZqW0y4F1BYTp?=
 =?us-ascii?Q?Chf1NvCM7mWLeygPPcv71GnxUUPf5BVSv8dD6wjg8PLwfo8xx8J1tAF0O8lS?=
 =?us-ascii?Q?kOuey+pbZI3nYKoqLuKQSh80Q7zrO5wIvqyrpjkf75WvwCSIDRU4IQ8j1J//?=
 =?us-ascii?Q?v7Bsm3tEPu2/QPG+iDMm0A7HN4hoHIymI7hjhSCR24xV8JhXH8asNJQqJGCn?=
 =?us-ascii?Q?+WVna/uZe62RV4U9m3GGULkiBwxSPs4wqNuqK7bihfaq17abC9QoJ/6MmiAd?=
 =?us-ascii?Q?khDFjiAnqVBtEY4DOVMqV59U9sKPI+dxNOOSipXb1AzlSIyzqpto7jSx1Oia?=
 =?us-ascii?Q?cG4CQ/HrIVrja8Ye71LJoPylY+xhg8EIyIS9RKo8TPOlSJQ9/6X1Tg/C+3Fq?=
 =?us-ascii?Q?0SfHbuseaHT7j0Mgro4//IK1mzEec2E5khnEf0ue4esqns7+Xp1R9c3AGfrK?=
 =?us-ascii?Q?jlHVnVRShlj0OEdb+gxX/GIvow7M1Xr5BwwT8+pRXLi06K7xurM6S9TgVhN4?=
 =?us-ascii?Q?/l3Iw05hYsR1bIeGHPfybuFtga5Zx1CqI1g6gYWfoNwVFrSKwauTnX50BaAI?=
 =?us-ascii?Q?WqjM8Ww77p4yfuyEtJ1XvWkIDYRpoDQWL0yWTY9/X089U1Nx17QtVxWwzghE?=
 =?us-ascii?Q?DFtS2YSHo6WJ1C6c6RRHxbvEdWRrChx1WzOr5+QDHZwIAU+OO8QDCafeuk6K?=
 =?us-ascii?Q?3APFq1yzMFS89BNZlFigfg/bPS0uZgxswxmIKtnVEtCnD9FG206zIZFmrKLT?=
 =?us-ascii?Q?jDfh8rfuYFwLckm0KUEVCnJxa3pBq1CBWXYlEquvUTYZWCevrvCisJeHilQr?=
 =?us-ascii?Q?pqSGkolgl3vbeLvfu8hF4wpax5HSyw7EBITBPfyCSon4t2uwNp03GdtFV779?=
 =?us-ascii?Q?lN/ABTj9H0gpPl2FoAASekAlH93AsnWb3lUOC2RPtpaZxRCHVD2LjVF7z6Op?=
 =?us-ascii?Q?/7/XoBPa+9ZHoy65AAu3se91f7doHwFwH9lYFp2XHpy8TqkiGBd0O5UCV8RS?=
 =?us-ascii?Q?rm2+eYetyRbw2jUANC1lKRikr6F86PtBVtIXW15/g+XUYJ7u7lig2YTCkfzq?=
 =?us-ascii?Q?2HTt0uJbEKhIc7fJLu9AGdXRfhkQNkPUGc5OfSqjHtMG2hb2n7rOQ6f7Fdeo?=
 =?us-ascii?Q?dbY7iQUeVBArcINnk4Z5xS9Jqc9NYDpS6Zx+VTFl3epPNCF1Y/inGDb9NzQh?=
 =?us-ascii?Q?V4P7mCjtc/509FXQcs/PGCwINj5uDYtSEUSxmMtH8aXr6MSQV+/jlzd0NXay?=
 =?us-ascii?Q?e7SWC9A0x2jJytYfSd+ie+CF9XviclmT5K6pqHUh2YSMAvyBgLOx3gj1O7HK?=
 =?us-ascii?Q?qYhi+F66Rnk8f1iD3LtYJ92r5U71iBW7F3B+todKH2u3dnBJO+GHRpELCEQc?=
 =?us-ascii?Q?3RL6+qQOiOAEwD3FDRlYAgyLBSvYEjo4SW9JPT2w8VsJ0rYn8F/ppvkS9Tk0?=
 =?us-ascii?Q?ldYxqPRBs0qVsKP0dtCWTSIQDmh0hBC2C96/a7VMccP4gwpI/BMPSpIaUJow?=
 =?us-ascii?Q?ymNo2dkWo+mzVTHEL/GDIfc3TmRIHWpdWX5/4m+Fw4qBPJKUVNSypnb6vxbF?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3cFc2JcfgsUIu22K9CyDk8bEfqZR+NfaoEUoUOoqMCX+eIja5LWPpVUB+ZVpfYGa/hPt5314UxC/RPSxWuLI0ZuZY06s8/8n4YBdhtrIf2KSb8EtIo8pdTGncxylXeSrlteIL/pguTsBh2QY3MCuS45FpADKv2Iu0V24/u9TuRREB27Q+ho2Q/7RVY060U0uOrEj2oVaLlMBJlW1NeYMp3fNivCn1dwbbtoZuSDVnul9k3Dnmw/ZH4hyMSx4ma2tBrIrTIdKTFYHqxcfriwt2/FgzYi0P8fmtQ81m3kdguAz6UKNpv/OkdkUgUeKTHMpy35LMKG+4uhvu8xRfewQa0sU+C929lyPPJl3dQQJFJG27kHNA4Fz4Pala0W/uLNPdFi5ImKrbOChoh/hcR5TQRTZbS3EuHiL5TUNiMSLZz0CZqeI3VLsSFzF8aEqyTRhvcAFjWblkuk605RZXm3FflRH7K72z8T7J39rMOHNYKbTib3Z/WEQjYF71qxDM4rZ3ZoLcjhs89Ys1j7gEzUGXsBpf1r305q5ZDEsVF+OXR6BASoEdEGtHKXtAW9nHOpujsr/WQ0c4szRTXpH8Bdih1c49QK3R4eAbI8reG4rako=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff867deb-5c15-489d-3883-08dcb24bcef7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 17:03:04.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVRMM31+zQBXU9n1jS8iZsKePeiJeU23azvqUNzK42a5jJ2N5IiHSz71dHBznOMKOetHxlXhfJVyfibJYnwJky9QqlDDqdAF/AAFAcj17EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_15,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010112
X-Proofpoint-GUID: cpWJSyiSJNyisx8dsc2IUDC218igdSzg
X-Proofpoint-ORIG-GUID: cpWJSyiSJNyisx8dsc2IUDC218igdSzg

On systems with kernels that do not provide CTF, access to some kernel
variables requires an explicit &-operator.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/funcs/tst.inet_ntoa_nonDPTR.d | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
index c2e5f59a..500c53e8 100644
--- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
+++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,7 +11,7 @@
 BEGIN
 {
 	/* "Linu" will be 76.105.110.117 */
-	printf("%s\n", inet_ntoa((ipaddr_t *)`linux_banner));
+	printf("%s\n", inet_ntoa((ipaddr_t *)&`linux_banner));
 	exit(0);
 }
 
-- 
2.45.2

