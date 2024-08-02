Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317FA1537D4
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614326; cv=fail; b=lklXZ/3dlo0LrQuYYcpLoABa9GWThFzQec1Wrlz7zM2fzFByyc8rRF0SL9VhGd1U8S0llnWYKzScfB8wD4H1uc0csQX2YL/cCxphiyktiJYRhPFx4YzZG5fAPgcTuB96e5kV/Sfo5ZeiOsxp/3jSMDuouB0ak3WCMfYTJMFrkDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614326; c=relaxed/simple;
	bh=LUpWqBnaUBcTD/inlGnC/+5kyMKULrzOal1sD/MihRI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RgdTMWHmIDaRwrV9vYSgHkP1zQoeW29PHyXr/F1Wgsq+hVbP0GMnfv+15CffcURcuZ6G8BM5b5c+BBxUCiZz8072Bnxi2LSdvZyMxJLZzsNXJMvNE92jNe1RAMAK+KVBAJ7vvCOfpAR13ZTBiob+NU0BPxTjgdFpRkOWQ/rWpuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZEA+Lr0H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=a1+9ilAr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZEA+Lr0H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="a1+9ilAr"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472DGRC0029920
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 15:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=rsNTDEjq9NqckbTy8a2r4S8v1mEFG7/jub5CSzSZZdM=; b=
	ZEA+Lr0HB8NohvZAvQEFzCkShNdzcNH9Fy3N6ODdlEKJW3AomM7SbEFvWAM/q+/0
	65RW407Kc04yh+fDUNNEumnMgn5+alhgYs6gyxG2tpUVAvsW1GnKPUgEGHluNFj2
	fp4Jn8zN7pG+1YFJdUrJif3crrRadR0OksxIDLXaeNBKuGGflEykRKy9Wv7sTELn
	u4gIWifU3swqdfH7S+N6soPhxnNgiq7RSdNCP5+XiJ/73X12x6h4XF7EYX0UHRqX
	OhKhrRgwDUm+FvqP9PF1Pq8kCi5YDehS/WjxAgwOCP69MjVQ1RK6vAQU5EnmNgaK
	tE3M80F59UY1TfvlNO+zmg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg5hha1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 15:58:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472Fp6J9001919
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 15:58:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp1sgqd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 15:58:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vB2cIwBH4zsQbmYV1QkFt4KVuOW+yI3HjOfqplkmW7xa1cAKVwkhFYje6//p8Kd5qfEINePh+BnjqvM7A4JKLkuxOEeRmrz+2iQMrDI6DXOHBtcgqEwKX8fs6IN/+WqZsZuA6nsUmY7KPdcRs8cFORq/m8CBHIx+6FjnD6VQkyxEXv77Zu6k6Q0uHPCLm0tpe6aCZ48LMhwfq3/qmkqGSDYR/IPD7ZTBUet6lt/S0obWKG4VQ8LGIVPnGVnFjeFs8nNMJ1P8UTWLoA/XKhGUAHnVpTZwQ47gU6oLFnEYjF2++OLP+NBTQB78S6kFMcCuAIJXwcBS4gXLfutR2R4QBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsNTDEjq9NqckbTy8a2r4S8v1mEFG7/jub5CSzSZZdM=;
 b=WjmSBiW9tfQAV+ivAdLtNSiM8cc3EfVVjsmgsuuknzRNT7LwYygiyaG7H1SLB8gbzpwVFBDE9kO9ntefyBTs05QqJswvSmTLLHkUp+ZSi6rqYPEyCzl4FT4okXq9pp36KKk3FPVGv/LO15yJYC/NdClihJWFpSpBCoti7BWnNE6wDoyMd9mXoBLlAztfMlcvjX6BlXo1lYpGea6KByZrxMjCQCCuO7C20Pep4ZtIw8A0TvpAN8QV4PA+OegfZk0DHM+nNIzi4esblE/Pul2ZV7eTcxUah7Na8BktKNpuXmrAWg6j4YZIiXYkyshvImMKPc1B7qezZLGmoiNP7Hnkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsNTDEjq9NqckbTy8a2r4S8v1mEFG7/jub5CSzSZZdM=;
 b=a1+9ilArain9E1lJFWRkTLGrN7UZg/YaCtxpYQTc8Mp86JfucLrIMEjnSwE3L7eNQyHHRtoi7yU8GiQ8mfjEpsgL8a5ud8vR7xNgQFI59rHUipxoLryyWSr762y3s/Fk4fAIJtnStq7NDAukAFGDc3Ll2RMWCNKRWbR5Imwhxw8=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by DM6PR10MB4220.namprd10.prod.outlook.com (2603:10b6:5:221::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 15:58:20 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 15:58:20 +0000
Date: Fri, 02 Aug 2024 11:58:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf, fbt: do not try to get a return value for void
 function return pronbes
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:208:238::18) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Message-ID:
 <PH8PR10MB629206C3D0CC853576B43FD5C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|DM6PR10MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 5818acd8-33e1-4605-2759-08dcb30bee7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xsMZjUYdnOpluXXrsxXon9Kojm3S4AWMl9CE4TnhB3OdtreJTWDpHunfssAj?=
 =?us-ascii?Q?3n2hVoNCkH2HJQcHIq3TynRqnD3cAPexzEC12JRXYXs9na1anL7ZR62u2ZmD?=
 =?us-ascii?Q?eqLbr1rxwdhwhQIZDU7MWvhAC9sfAgFbf5DoMRT6qlOVpiEqCzztDT0Fyh6k?=
 =?us-ascii?Q?KtuJA7+D/NUvKSlRTafcRwjEn9s9o9NNXgG8SK0AqIVy0/ODm+oNIPWQAdYW?=
 =?us-ascii?Q?/xYxHCczGtzZKvGYgfnnJUgLL0B3mICGpLbsQfcoTVnDiL2qdaarEeTUp4Jb?=
 =?us-ascii?Q?unxCMQpJAJGVp/LN4QDY7P3gHKH6A1XkNxLfdH9B9PE/rj6pXGZyLsd0OPSA?=
 =?us-ascii?Q?zANIJBARReiWtNlSu0lqaAEBab2ZAxE6dPpQhHn8pQBmJLhWPIo1JaxOzXth?=
 =?us-ascii?Q?3KkDjoZrfePRWIdqCQP56Kym7eoX/JohQE4O9SFXxaNt0zPyqKk0AR2gbEvI?=
 =?us-ascii?Q?ngp58XKN7/qPVvPcjrut50AHgZk02UiTg/+48ptv+M/ZLvIStSxlwtP3WTfg?=
 =?us-ascii?Q?ICNJWfaJ6bDfU8R2RLjSBckNKpLWqF/KFoOMA9BsNsBnPDcf/nxnuVH80azw?=
 =?us-ascii?Q?KTPhjQv+PohMBBQxTfQeTfvZvkFngS4zr8o7jHtAFL2DrzdP+MefCrfK6Wfe?=
 =?us-ascii?Q?DBu4oGobkvFfoz+AMLsxMUt8iW9HA6wLcWq9/XOcGxfKN0+TNilpQG+DethJ?=
 =?us-ascii?Q?vVzp9cGKaelpoSK83oJFde9w6m9AO3k1vOzdcghxJC48lqDHpllbbM5iCOGZ?=
 =?us-ascii?Q?8AvWitWhOkGcNUxlYmjeOADyNBJPbStOHMElQwodEA7WHb08+k875WF3uoGV?=
 =?us-ascii?Q?5n299HYeW4HxwJZ1AdbtM7RItrPDOHANQaRQzfLJJ9qKBs84HFy8ogneqd0o?=
 =?us-ascii?Q?7c4COVPdacFxHhwQrp39slwxTwhN3PAR7J+P6YQpFYg5CiKNz8uzRDeX4OLN?=
 =?us-ascii?Q?FxD8xx6uIh6m13miNVVIFSBN+swBqCfhnb0LNezvcpg/CCUbkWvJxtZ0dkx6?=
 =?us-ascii?Q?OEZYTFMm+VHlMTAJMQROwh8IB/MIL8yhXbu0n+RUcO8yjmCFgY03P2sPr2ce?=
 =?us-ascii?Q?8qSuL5Ir5bsPhwgOBWVvGpN3RUI9Z9J1qHSpDeUDbPye6cAU8zj2LWio3n/c?=
 =?us-ascii?Q?C2ZkKzpkjhVWYoE8a0/397ws2APifuE3LYzy81cO1Ky23ko2ePnyOW8+pkTq?=
 =?us-ascii?Q?HRggg3GXK0yikFNPui3G9+3Z0xDawYVNdGSKjItgFMXkDtqeVjeoonUHq8St?=
 =?us-ascii?Q?H0sv9q3TGjEANe6kWjT3uQgw8MtdrLJYJYLSVrNyNxd1hfMZU7E/1VduzC0m?=
 =?us-ascii?Q?TFMds1A67vTux9T7O9jGflaj23e0lQHvHK1w5yBsc6TKSA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?smFa5obqCL8CEk/HZtzlaxyCMtHF2DKVQ8WLvaYsnYL3OtpItY7V3w8Y6g6N?=
 =?us-ascii?Q?guc4p4FTiEp3syblX1oWLGLJr0j4+w92vVDWjjHvAek7ZIivVibri8KD1tzb?=
 =?us-ascii?Q?y5QxTysxZbm5uMOWAos45oU/KtSgdwaNPmNygKwKvhz8PYbF2pszxT5IJ6NE?=
 =?us-ascii?Q?rHMzvLBVz9rWppe4SmFjq7KqtKsVpI7g5onljvMb9lmLETheGDFBGxx+SCCM?=
 =?us-ascii?Q?irmx8DPAqsSdU+0BGqEIrcLCz0C6kTDW601pWXCIMPUugs/ktwKvKVjGNOta?=
 =?us-ascii?Q?l1S0CkQAAPkWrytc1D4q6XuSi9sPptf/oovhpCL4lQEPXAtwbpmM/yBI6SNm?=
 =?us-ascii?Q?xvIknkyAAYhBU0/5L8C9te8yV8vJmbF5BZaK6FrzL20wndPPV8mpty4hdjxO?=
 =?us-ascii?Q?SgOJ5j7rkoCl3P+eAUNkhazNjoFCLVwJ6Z6R66VHiFD+aJXdQg9OEWoZlgDj?=
 =?us-ascii?Q?W32tmRLuNehPZq8WgDfdB3w1KwBJOY+19h2Ec0aU0rnLBrcSC8KyRqtths8E?=
 =?us-ascii?Q?S/d/CKuNbevQZmdmBH5eE7UqosMr/FRDuc/Ky4i5Sbwg9XaX22U5XcHscxs/?=
 =?us-ascii?Q?bygfkj6ATy0XpDh0eMWKIf9yZgzNAdvgEKuIxewWi58isCgz88TPurQ3hpx8?=
 =?us-ascii?Q?T6w2dxwQY+rfVQjoa1uvfAee5pjdTBrBead/85LB7LEXY0lra/hPS3aoO6Gd?=
 =?us-ascii?Q?aRujJSoqM/hlXM6s8AkwYK3skJ7NGnAQD/RUJBZDvf0abcBgcvoGG7P79YWv?=
 =?us-ascii?Q?7gyfrMyaRDI+CYhvmkHixdAmqLlNsNy0q2K0EVflAEo9Zz9ZbQBCqqNmUIyr?=
 =?us-ascii?Q?aouj75G9gmwQlqNcJBPvzTc1qE70w/VRz1j7U726ht9TKwbgT4UlFX/jtux1?=
 =?us-ascii?Q?f475tzzbIzWQruFr54/u5vhLOLgyt/0s3sFDS1M0P3cMrcaIsMJKMA1LBN3X?=
 =?us-ascii?Q?YACqtH6jGpZtxyhN4ZmRQnP+a5mOk0YsG/KD1ZBlG4OLiQqeP6bdW8h0iRdW?=
 =?us-ascii?Q?UO1W40hu5kB0abMnY1oB78TRZwvawVKjyvezPQ9ceoS2oSLZp5aAoSRcnbIj?=
 =?us-ascii?Q?5qNsFV7XUlkwWxAMSUCbPocKqvPnNBNv1EWi/zOEkkIgbI4PAnAreWdm+c5i?=
 =?us-ascii?Q?42PjAfYv+hIK2ijteywVv9pt+OEpIZh49ND4I2vidvRqgdjOgHDYeST2KTdl?=
 =?us-ascii?Q?n3vULB5/vB518E2C+ipPYZ4ZcR6EjDx9G+VkDzERx0+L7R+N++lgZby6esYe?=
 =?us-ascii?Q?qkDot29Dex354djgPpFbuwfCVJZ5dMj1wRaLY6txZEYldDGSOlkoIaHy0HPj?=
 =?us-ascii?Q?Mgmel4OLhPl1h5j03ooGzchEeQONRYFAFhe412Sc31EDxMxWq51PIvvagS2W?=
 =?us-ascii?Q?Oar/rs11MqZjn1ztN4aaoWF5WHYzqV344/5HnnHgOLgV6eu0t9TtHL2DcOfh?=
 =?us-ascii?Q?wMthzcXrrt2Z3AXH1A3tOh+c4B0Gyw3PFBCgX7TtI5GGSxCvp+Cq5mU817TK?=
 =?us-ascii?Q?tBc1O6FZ7ETJFYIzgRwUFlh8pD5UUj/UlFQabgHKAdpDhDm5t5sx9SK24+um?=
 =?us-ascii?Q?Lcc2KPxdUtl9Ef+Z1YMK6U2xFnD9KEm/QFvLbGWxRYhbZ+1xZMdX4qFSioxy?=
 =?us-ascii?Q?vGqLGHsBPek3xAMXNwAE1uM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	og/9wN47HuiTk3oBRADmAWFuAjlWGt03VFnqPEKeVC2Xlr+z1ewBbedPA/9iOf6AOZBGgEB1lBq3t7tlzweVa5Eo1fk5npaaT+4Eg0qYzqI/OwEvh5SSB9kf2mcoFPsSFz1qL/K8GVtT33+QtjgPFmoXApDv/nVHYtgmSLlYyKDxVIiJFpvrE6V8ZfwnCOp8L9SW6GBM9S9O6EeEonCzbecyl1kxjqUAwgSPwMEulbKhp+kkLO+UBDnn4wQRcqQblQ//7Qdte/Rb2hGhFPqcofbiSNqjAwSrRHp83RyXEDVd3mSNqTG6HhG1VStJKRHzMTplrRCCQA1KJV4GuLLyvJGf4fcneUnlKUL5hlXjccr1EMa79xRr4Gt50m0wDtXrSGrd/+C1vXdcskHs9gYs29O+fjRYD0yFrtoQCnsdIGgthTDNb5BxVH4bSCeazJs2s2U8mM7heHlguBKEiEfsxaYZWFcshUWeu/wA4QmqgVGx0+w6k7QrE+n4lSG6o0HDXMiGpCHTp/gqgjT4woXb7VxP1bBtx/XuxSixg0bFNCCccCjnW387cGOvSusmA5WPCWTnvSc9CcPeyc+c3ylQTzHZIdlPB5uOA3hn8dZvQIo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5818acd8-33e1-4605-2759-08dcb30bee7c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:58:20.7895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +E3ujrRdgHERoGhx84J+xUaWvKjI6BARd5wGafOxU44FmhRoulzdvSkrskYcNzn9IdxMTd/z+5sd14WEZkBoGDqLpi5mdIIjmJZpOACTi2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4220
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_11,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408020111
X-Proofpoint-ORIG-GUID: ZHVuxmtG9Zyylb-c0_sOK3zQCekj0-M7
X-Proofpoint-GUID: ZHVuxmtG9Zyylb-c0_sOK3zQCekj0-M7

We were trying to access a return value for void functions, causing BPF
verifier failures.  We can determine the return type when getting the
probe info, and set the return probe argc value accordingly.  This then
drives the code generation in the trampoline.

Reported-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c      | 16 ++++++++++++++++
 libdtrace/dt_btf.h      |  2 ++
 libdtrace/dt_prov_fbt.c | 21 ++++++++++++---------
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 77366df6..e905580f 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 
 	return -1;
 }
+
+int
+dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+
+	/* For functions, move on to the function prototype. */
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
+		type = dt_btf_type_by_id(dtp, btf, type->type);
+
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
+	    type->type == 0)
+		return 1;
+
+	return 0;
+}
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index a7cee464..e05b30d0 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
 				       const char *, uint32_t);
 extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			    uint32_t id);
+extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
+			       uint32_t id);
 extern int dt_btf_get_module_ids(dtrace_hdl_t *);
 extern int dt_btf_module_fd(const dt_module_t *);
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 461d5e35..80c3db20 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
 		/*
+		 * Only try to retrieve a return value if we know we can.
+		 *
 		 * The return value is provided by the fexit probe as an
 		 * argument slot past the last function argument.  We can get
 		 * the number of function arguments using the BTF id that has
 		 * been stored as the tracepoint event id.
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
-		if (dmp != NULL) {
+		if (dmp && prp->argc == 2) {
 			int32_t	btf_id = dt_tp_get_event_id(prp);
 			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 
@@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	dt_tp_set_event_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
-		argc = 2;
+		/* Void function return probes only provide 1 argument. */
+		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
+
 		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
 		if (argv == NULL)
 			return dt_set_errno(dtp, EDT_NOMEM);
@@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		argv[0].native = strdup("uint64_t");
 		argv[0].xlate = NULL;
 
-		/*
-		 * The return type is a generic uint64_t.  For void functions
-		 * the value of arg1 and argv[1] is undefined.
-		 */
-		argv[1].mapping = 1;
-		argv[1].native = strdup("uint64_t");
-		argv[1].xlate = NULL;
+		if (argc == 2) {
+			/* The return type is a generic uint64_t. */
+			argv[1].mapping = 1;
+			argv[1].native = strdup("uint64_t");
+			argv[1].xlate = NULL;
+		}
 
 		goto done;
 	}
-- 
2.45.2

