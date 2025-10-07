Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E802D3EDF
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759859498; cv=fail; b=QjnPrJvoC51BN6Uf0ncQIzn29TULiZ8xhnLLCJ4qcmFpv/cJiGoRWX+IrfvIe05S+K9FWkEz4BnxbnxfCJ9ECGCYa1AUBFZ3Lt5iNu3y6p7Y49PX/ABeyrZjZpSE3x9J9hhT/A3dbMwGpRIksHk+8pJfNTmoKXlGAz8LYYGCIB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759859498; c=relaxed/simple;
	bh=M4+i96trLmswzBR0DM/bdlGzClIfYIi3HwFP5ybfX44=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Syvs8BkXS1ifsMBjX9oxk1JqTlomyaMQuoVlYc5BG52P6+4KytKEZGiWYHgBPWNC3X0uwrcwQmxcMm61x7iAvQICMNOtRomkVaacd6vPdg7XF3XIm1a181D7aRvrdTCY5j5gDXirZZm6//GAvQ9pQlRZLH7HSWiuvS/M/3VIoFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lXgsZUh7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pe8yO4ah; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lXgsZUh7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pe8yO4ah"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597G4mNo014509
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 17:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+/Mm+vItBJdzIYtO1BWH2qrNFDWy+D6z2hd3qTNhTrM=; b=
	lXgsZUh7NEJ/3Iz/ek/RJvN796TFDlHr2ErGofwRuoi9gclEQAyFhrvwX40/or2m
	i8vzRGMQGM1ok1OpRvBBGAlQjkgUZS55D0WgGDn7hFCEJ0lH3Y/av9L4KeUNUEYg
	GyoT/Wm3+dgAF7JUShqaKBVCt3/AOcfSsSR2atJ17xRU2Rhna9jUzL2mc5ipN0L8
	xEsIWE0VBB8YpvWmwQyedEIDe5aN70pbM10ojZMyGGu0DpmmCzInVqhimtpbWe84
	BjaildYPhily1D5UNTDwwg8rYWYhHerBmjiQm9nxMgJT832paQuXU66nnbLRG+rH
	majvNFalLyMbCsw03OOYnA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n5md0asg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 17:51:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597GZoai040945
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 17:44:44 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18scdf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 17:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXXNKG/G7EVkFtOs5eiU6QG/Y/pi7YMSxTfYQ59ytcrKhBFCfB+WmLpF9hA09ZFEpVjbqRYRIIQt27/NC+ZkQ3oImtpV/BYcCOEIUCTw/VRHlgMH5weWm1LmST9cID1p8hwOryAnRHmvm59JFHQAs8gb8qc62m0DYIKpkwsZyuAJtYFlxZO+CEl1xWv+yhjdkzphZLXlpyA2FPpDOA79VagvR1tpzQ+kPf6CeIgau0Lx2t1G6TJB2k0EOHCMONhwcEcuZeaVOVEsOhpY4SK+6PzXVvCivlCIsXMIdogndPFaqwAUfKWoRtKrgr7PG1PkYwAhPGrD4c/qUwIQJur1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/Mm+vItBJdzIYtO1BWH2qrNFDWy+D6z2hd3qTNhTrM=;
 b=cD1KSaPO6tyALCXMzPrzFvmvS1evHLA5w5rUbP73+BTjDcwRcmWUbyrxjmyxRDVTyCdwVp4mUv1OWXYCx6z3XOUFUXBTyyvL9iVvJ5A6C2C535rY3N9jQhJS6HuQvYAyfoXcx29GVj4FEARllDQGILvql1UZxznEGv95XIPLUqbUTvFto0YOaDpajMcd+TEKYFjKte8Byjgbgnhb51Ehn42zbkFRfzvyAMvb9OYjL0cskzmkqxqxDWZ9gfoEwdPoZfWJ5carrn/bq/YVWmPDjeZGvlofntrLUmFynDsRGYQw7lV0x7ZjvyYAaE2De07m64KkuSQBU2GUkw8UjUPDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/Mm+vItBJdzIYtO1BWH2qrNFDWy+D6z2hd3qTNhTrM=;
 b=pe8yO4ahHQ5b07mqqMBjLDjkz58r7Px42UQSF2yReDJ4uT+T6/2KuJdB0JXDr/Gy2//JyhiQL+17J/qKW76y/j4YwyOp5HdMkSh/bifCxJuiZEOt6yWE009EzVgRtNd85xMsU6Kgnp/jHzNHo9PIg9wqXH6mtFfTfBawsgzC2og=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4360.namprd10.prod.outlook.com (2603:10b6:610:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:44:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:44:36 +0000
Message-ID: <7e589850-10d1-fe56-19ca-3587169caa43@oracle.com>
Date: Tue, 7 Oct 2025 13:44:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/4] test: Use syscall in case of no
 execveat() wrapper
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251006215726.8893-1-eugene.loh@oracle.com>
 <20251006215726.8893-2-eugene.loh@oracle.com> <aOU0DIiPaRiTpG5D@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aOU0DIiPaRiTpG5D@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR14CA0012.namprd14.prod.outlook.com
 (2603:10b6:208:23e::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c60550-a4d2-442d-d5e7-08de05c92e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWh3cFRJRWY2VjVaQ3NUUy9pTTBNS1Z5MzFadVpoKzJqZENDN25mcmNTcG1B?=
 =?utf-8?B?c3dxdkgxMlBOZnRKTFF0OENCMUEzV0RUc2tBWmJ5MGlibzRvd1FkSmFkOEZI?=
 =?utf-8?B?QkE5eTJncEVOWHQ5SEE1ZHUwczFwY3hoTnhhTzhwaVh5bXJFV3p1MXFmU3Mr?=
 =?utf-8?B?czVNTWVXcVI0YnhZRzRoRTk5QVl6aGZlVVZIRnNoMm0zcUFwYTlES3lTMG1H?=
 =?utf-8?B?M0RlZjErTkNLTlc1aGYrRmIxWTl2NzdENXBYSXVBL21NU0xNTVRjM2dYSUFt?=
 =?utf-8?B?YVhhaTlNR1daMlZrbGFGRWNHRkEwMDNqSHFWQ2RiMmozUlN0b01UL0F0R0ZU?=
 =?utf-8?B?WEplMlZoeTBYOGpnR3FvZ1dXelVRV3VVei8zYnloWDVwNG1BeXBmcElram4y?=
 =?utf-8?B?ZnVOcjUyUUx4K3NiMjVtV21laFhPTjVTSVdIN3NvZ29YUTkvcndHTjRYVXlq?=
 =?utf-8?B?WlBhQ3hGSXM5TjZGUlhqSHVMV3MyRENGTFpUTUVmbnJyVGVSWDlTaDNLa29S?=
 =?utf-8?B?dUFNRVBHQjFSYW85bW5FQzFPTnhEREc0a0dWQVkwbHlXQ0lqaytTMWppbjRm?=
 =?utf-8?B?MUsvYkVqZ3pWQWVZWDVnNVdzZEd1MDJGRFQrTzY2bk4zNUs4cThZb3lpSTlr?=
 =?utf-8?B?dVNFWk96d2FBUHNtNTZvU3hJeHgxdDgyTzBWeWdhVTh5eEQ2bkdYMDRLSEkv?=
 =?utf-8?B?eDArNHVPM1dieDhSZy9FbEswdlZFKy81QjFlMkhHUzN1ZmdnN1FlN2tJa2g5?=
 =?utf-8?B?Qkp2a3cwQzREVnVZZWpVTmZ2MTJwT2FaaElmdlQzaTRaUWw5VWNxV3VjeE9P?=
 =?utf-8?B?bktaVDdrWkFQQ0YzQm56VHF4dWR5c0F0R0MrS0ZnMUM0V1g0ZGRSQ042cDVt?=
 =?utf-8?B?VEIzZVhkbW5BT1RCeW5wSFpQeWFpMHlxTjArU2tad0NSeUVlZDhoVzZXV1No?=
 =?utf-8?B?VDJMcW5BTmJvWnluZXl2SWNLMFpEYStzREpwcmtHSmdKL2JiNHk4bkx4Q0o0?=
 =?utf-8?B?VnFjR1dJOFEvZnZKbEVyRTM2bDJmbFlvNWdxVjZOcis0SXZ6aHh0Tmh6ZnBy?=
 =?utf-8?B?aE1vKzIxZnJHVVJiREJUZktMY1pOTThrVHc3dEpGKy9CQjN0Q2FqMDVMdkUv?=
 =?utf-8?B?N2l0ZlRwRVZ0T2E5bGpNYVYzQjNwOU9GbisweW8vZ2FsQmpBbnN2OW84NGQ5?=
 =?utf-8?B?T3lQVjVsSHYvajFrT0R0TnRKTThrc2tkNmVINE95dHUwcjFzcW91ZE9LZGhr?=
 =?utf-8?B?VVdVbkovZU4rcVlrZVEyMXZoRGNKMlJEdXZBeHdDMDVWa1dUb205L3ZQOWpo?=
 =?utf-8?B?OEQ0VDVJb0NCT09SWmRVNWlSUlk4YzFReU0vclRKcVVybEJKTUVUMnlEY2Vi?=
 =?utf-8?B?K2YvVW9pSFlxbm5xVHorV0hkcHh4aFNGZDh1WlJBOEo3ZW54WFdlamlTdjBD?=
 =?utf-8?B?Z1ZGQ05EQnZCd2JqS1RKUGlKMGcweHlEYngrek55amkxOHBrcEdsVXphSEs1?=
 =?utf-8?B?Uk5tYTJwbVNtRStubGZhaUxGRG1OM2d1NEdUUkc3ZVlvNi96SGhxdnJhVm9m?=
 =?utf-8?B?b1NNc2JJSzNDRlBVY0VzSVpQWU43eWF1THNsMnhrcVlJbUZCNHpWbmNvVFNB?=
 =?utf-8?B?ajFZRi9nQ2xOckwzOFB4eTFwQ3BHRjA0dDdwTmpJbng1UmY5VkpXRjNGeWc0?=
 =?utf-8?B?K1E1Q3gwT1hNTWFZRUliRFJvbzkrUWkyKzZMdlFyZnc4ZDhrRWdOM2Q2SUhI?=
 =?utf-8?B?cEJNemdSWmpUTXVlMUcrVDlqUWJCQXBCZlVoZi9qY3RPZG90enJuSGJGVkxj?=
 =?utf-8?B?RWpVZ2lwcDZrVE5GcEtXTSs1NUZqOFZudzNtNm1QcHZvc2FXVk9RWGtRY2pV?=
 =?utf-8?B?Uy9BNy8rRVN3eUVHamthU0hrVVlJSDdIL3dkRm1rcUdEMUljd3hsRGFCTTEz?=
 =?utf-8?Q?3XtHncfQeGLi06pWMTj5B5QgmMqD34RG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHZNeW5TMHIvSnp3MHF5L3JRVkJxM2RRQTl3TXNOcFpnYUExWTczRGhMT0Vs?=
 =?utf-8?B?bmZYblZwd1U0cjZ3dDlIUnpuMGNZd3ppUVNBZVNneURlMU04UlJlbFMrRWpE?=
 =?utf-8?B?YnFPV0NFd0RtT3NRT2RoV0ZWemJaTzFDQkNHdkpxbU5QUWFMUEVYOWdwYVFV?=
 =?utf-8?B?ZkFVQXF1S1d3QXZPbk1zNEgwY0dCUjZtcjZBUER3SWlaMXRRMC9Cd1FGbTNF?=
 =?utf-8?B?Vk14TUp0REI1SW5NbEYwZ2I4OTNQK1VNeDBsNEtZZlo1UElId2IrazVvcFNR?=
 =?utf-8?B?YnRBNitnVitFLzBESTR3VE1qUnBNbXZncisramtMWWVvMGZMYU5ncXVpMmZ1?=
 =?utf-8?B?bnh4NDFNNUR4RDd6Vk5QbHJmMmRFMEUrdjJXL1lqSnkwZUwrTzkzZkR3RGo5?=
 =?utf-8?B?OHNxRm1QYXV3aWtIdGY1YytBdCtFSWp4anRzVnBMYUppTTh6OUN4Z1J5WC9x?=
 =?utf-8?B?OXdhM084QkZOS0wvdVBXRkVxVEgxalJvYUhrSHBXOUlzeDFZWjVrVXkyZWlj?=
 =?utf-8?B?SXNRQk1GU2pvanpEY2FnemFLQ1FYM2E1UjVDYnBqbXlXTXQrM1ljVS9rSGxW?=
 =?utf-8?B?Z2p4OGhLZTdiak1xUExnRlk1WmhacllldWFsaE9iZU5sQ0NiSDFvNHdvcUdJ?=
 =?utf-8?B?SEgxa1l3UmFDOVBTamRoaXVLa0gwOENOR3dNUGh3SzZEb1lSdHpyUm5Zcmdu?=
 =?utf-8?B?d2gyRElxRG1SZTl6eTN1eWFkTTl0WUUzdUhOTGoxbGFUUjh6SXRvRU12VEMx?=
 =?utf-8?B?a3IrakFIdUxDMVNmV0pzVFdRdjE5emRhRnM5WkNmbFVuaC9pL29NTTJKckU3?=
 =?utf-8?B?akhJSGJrSHRXWG5wRmFXOGhLK1k2ZFg0UGM4YXZ2SkhwcWlnck9XdkVxSnFm?=
 =?utf-8?B?cm4rdVFtd3VadTN3QzNKdXZsVHVia2NnQkNPa3U2VDF6cUJidFJIbVVJSFIw?=
 =?utf-8?B?UHpLZ3NVNmZJYndua3k5b0hrcGVncm9DY2lXNkpVWWo2d05PMW10UUgrSncz?=
 =?utf-8?B?QWxJVVpDakVMRXljYVM4WUhIR2FoWk9OSlplOUxUK0J4RGJkYUVzcFFpUm1l?=
 =?utf-8?B?azZHTldtOXM3ZDhwYjV1TmVlRmtmNFpPZVZDblFEYmRiRXdDU0lwZkxwc3BR?=
 =?utf-8?B?QUFHeUw1NlAzUWpHSWc1QXpiK1ozNWJDRU9LNHZBaHRQd21DZ1l0dTR5aURJ?=
 =?utf-8?B?Zk1oRXNraUxET3hsZTRBcUZiWGx5S2tiSExrREJUb1Z4T0Q3WWIwV1IySWI3?=
 =?utf-8?B?eTNLQXZhcDVML00veU1mZEpxb1Z3RXdzUkFKZkMrMGNrdFI5ZEhvVFV2SkRL?=
 =?utf-8?B?NnpESkxKdjk1Q1hjNVI1VjRrU3prN21hUHFCRDBQbFhDb1JuNHdDN3pEMlRv?=
 =?utf-8?B?UG0ybFRaaWo3Q2xtOElnNFJNZ3ZteG5TSTdoZUpNUG43Ykg2N3czTUhpTWVs?=
 =?utf-8?B?VkQ2OEpibWZ4MFdhclJ4QXlkaGsvQVFNR3QzMktFczc3N25ZQXk2cEw1eXgz?=
 =?utf-8?B?c0kvWVdMRm95RTBlaVFqUkJKR1VIZXdZT2FuYjhORVIvdVI5cGtHdGF0aU1W?=
 =?utf-8?B?ODYrcFVhS3N6YXl3MHFJY0V3R2xGVFYxNHBxejRGOWowajh2NTJ0YmZXcjlX?=
 =?utf-8?B?ODMxNDdPTzlKNjYzNC8zL1NFOGdXRGpsbkdKa0NTVGZNd2tVK3FzeDVWcFhi?=
 =?utf-8?B?UmJqSHpXMFpFdnk3NVBGL3BpNytWeUUwSnJrTTJDVUdGOWgvZjM2YXMzdTYv?=
 =?utf-8?B?VUN5a1lQSmU1N0JqdUo4aHZ2blNYdFoxTkRQYnFzUzBlWkJjQUFOaE1ObkdS?=
 =?utf-8?B?dHdNQ0JFTTlZUmU2ZXVldHJ2NHBtVjZ6ZmdFekRYbWFuVWZpS01nTzJram1l?=
 =?utf-8?B?bFExVmpsVE00U2lma3liZ0NQeHAwMUFneWlRcWdKb3d6R1EzdUVuMWtvbTFw?=
 =?utf-8?B?b002SXZsSGVrWGl2N3dEVjlpaFFTMFBEck9nUCsyUDVvbVZrVmJSMEZadHlm?=
 =?utf-8?B?bFU0R1k2VzhPUmpQeld4SFF2Q2lZdzJnNkZrUFVZMUdZbEM2bnhKaWtzVklo?=
 =?utf-8?B?aUhnWjYzOVo3eGFPZWFhQ3o2cGNoQnd1Sjk1T1BOVVErbHFiaCtta1hJYmRy?=
 =?utf-8?Q?bw3OvwpHm9l4BQX8d1MSukVr+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lHeVf+Nd+RK9Kbgof9sXWmHvsqmSMS8uN9CcSGXExDJIUjI1tciBm4fuVh4cYoCOgWodqjDStfoxOP8hhzqgOwAp0QPbNqNQy9kFxfjW+m+ivsMw8hsvBzuYX9ltjD1uycfA5zs/Sr/BMAOnVJAb9LuRh9Qkr1GVYWgeXwwOXhOCM2PBYGuDXpzlCbVI562O1c7y4B0+Trt2j24QYexzyiDGrC3o1gueIzADLzbbZeVHWskuK+TvPHvOCrau6jseJz61Z9GyXLb0RjPpGbzSD0ipwbiSRBQKZqzYSUeUfAS2v76yXWE1ogk8jwayPF1GcsYLwWfYa8RPWX7HvhNiHfIDhsE+2wLZ9pJdKRP73LrbD+j+gQjvRIR6jLQ8V6/f6S5gu/oIvVLUQ3tVEsujUI1L+TUzKKYadi1y4jWGM1YZNHIyLplsCskBFOS1zS2vipiubB9fkzOXUKxZga6sNtTw8FADzktgUwhh4lRWlGrNvCD4qp94pSSsrbAyvuku0f1kzmuxhwk1bHRb17A+Wp8VBM/AMuDtXTirJMXcvvDL0wgZT0D4hQcJAmYjRRe9XVOdveBScbYyb29b5aW5fhJJiGeQIYxOS03NEAblscs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c60550-a4d2-442d-d5e7-08de05c92e6f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:44:36.1534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0ETJpREz+3q0DLuFZM+aqkPABM1ERHC1INYDWZkksTNNvnXBsWdNXOSQln00EZFdNIQ1RMWCRVzs/AEpHLA0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4360
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDEyMyBTYWx0ZWRfX1dFErYIgut6z
 ZP9gbgxgmk3ARavrEDxefvCjBeH44ub9jYWui/8YSPnhpCHx+hr2vNsRFx5XXJwCVIrq/3sxQ7Y
 ON4jh2voqQae4seQbTPJBoFUSX+rDmQ/MF0Ah4d0WZoTtAyDUusUeQa2P1i2Lfz+y8+gs58Qvcp
 amfpOf51eRonR3QLvXcd0YecXEQpDH2UHjTh6zI6qctmB4SEgXMoZIWOscPJbf2UMiCE4nHPvpP
 oRxHt1OzpAlM8mbED318sXd71OjCviBAiloHHaOutQF1rwsC5KaPmihYpFQ12mnn0PZOZiMZaeR
 bKn+QN2UUy48n7gET8aW3wRhauvAfhj2tuSUSXlccsZGC+2zHkZTabfBmrrzc+Cjacy8UpEslb+
 Sz625d9tCrnCkP0mUVdah41BlpGppQ==
X-Proofpoint-ORIG-GUID: manMRAHB25uaBTvWMp2RTjen2XtldlM8
X-Authority-Analysis: v=2.4 cv=acJsXBot c=1 sm=1 tr=0 ts=68e55327 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HxPfDUOU6KQ648iPU-IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: manMRAHB25uaBTvWMp2RTjen2XtldlM8

On 10/7/25 11:38, Kris Van Hees wrote:

> On Mon, Oct 06, 2025 at 05:57:24PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> While execveat() appeared in kernel 3.19, GNU C library support
>> came later.  We are still testing on some systems with older libc.
> Wow, we do?

Yeah, I know.

> I am curious where...

E.g., I just launched a fresh OCI OL8 instance.

$ uname -r
5.15.0-312.187.5.1.el8uek.x86_64
$ ls -l /usr/lib64/libc.so*
-rw-r--r--. 1 root root 253 Aug  5 17:05 /usr/lib64/libc.so
lrwxrwxrwx. 1 root root  12 Aug  5 17:06 /usr/lib64/libc.so.6 -> 
libc-2.28.so
$ nm /usr/lib64/libc.so.6 |& grep execve
00000000000388d0 t __execve
00000000000388d0 W execve
0000000000108500 T fexecve
00000000000388d0 t __GI___execve
00000000000388d0 t __GI_execve

On an OL9 instance I get:

$ ls -l /usr/lib64/libc.*
-rw-r--r--. 1 root root 7000662 Aug  5 08:18 /usr/lib64/libc.a
-rw-r--r--. 1 root root     253 Aug  5 08:15 /usr/lib64/libc.so
-rwxr-xr-x. 1 root root 2544448 Aug  5 08:18 /usr/lib64/libc.so.6
$ nm /usr/lib64/libc.so.6 | grep execve
00000000000d9eb0 t __execve
00000000000d9eb0 W execve
00000000000fd300 T execveat
00000000000d9ee0 T fexecve
00000000000d9eb0 t __GI___execve
00000000000d9eb0 t __GI_execve
$ ldd --version
ldd (GNU libc) 2.34

>> Do not assume libc has an execveat() wrapper:  use syscall().
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Thanks.
