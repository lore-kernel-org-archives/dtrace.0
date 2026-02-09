Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81F2DCC08
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 19:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664937; cv=fail; b=cBTqVVxh/8QAwDSizTwF+5F8/JPn3Z+jrUyYMUOrraj7xwqxz4hkJtOV0ZGC/G0/rxyDsVlvR1MlLAKdaknBAi95J+PxTDY5Feer2gAVyPIQOm5fRdVxThhE4KD6tH2rvh1ytG/s6/3QbKHwc4pcicCEm7Gu03tJu5+SwYGbUmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664937; c=relaxed/simple;
	bh=hypzJSc27+ZjMk5SbhEJt3ETCa313humDkNpB/DUAbs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SReEQQPxvCEhtJt+/d9QdJwHIdlXQDPwm7Qr3xhe9+gr3WI758/rHSuxSpGVUpXMJ4R2/rcOLOd15A/aXSO93tZEK9hg8UOyK7/wODF3Y+iXnjPAtBRvdVScLFZDa8ZCu3rYdHPYyd20/YFwvea/RSL9flo82DaqSqH0Vlg7Pdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GZq3xD94; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bvBcwDAD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GZq3xD94";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bvBcwDAD"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619EDTJg1230029
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Fn8DdlNlDGjwPiPwjXPeF7ChV79cgbpjLbNzIFQWtCo=; b=
	GZq3xD94M0HXltsMPieQe6IHW+oO1J1UJtkZwUzrO88bdEBp+KhZ2f5cDI+30H41
	D8NxGmhf4JW6q0nRz3Odl/BJ7oVRbB44DXEBM1V0NKrmIAp6XYaEGl2sk4KTBbsb
	Psq6wH+hF2XCxDfmEt4pkI5oMPkOPueZZ9dwFgKT0CnJGG+7nHU5nSNj8NbqFywy
	XLWbB/ycj2zUaqfhhqcAiNpzy2uiGMFwM6NjM/81aMTxmHemt3MqtEt6Xc0YeZcd
	BHlukZOcx9W2sjWX3/rf3YHmjeHZnyxY+p1CV7pTBY/oZ7ZZVMVUw2DL2gTdJrLw
	5Riz0LRmLl9C8FwoTZdTxg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xes2m56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:22:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619Iu2s0040759
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:22:15 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uukdwct-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:22:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+wSAQteud3FhuL9K2PzrcZna5JsjqBfbPnR9PTpQaqbPWqyEMk3xRxpPM6TNggczznkLLLNiiRGqoNLxhhpcgiUSonir+vwMnRW1elHDazc1fB1irAK+HHUxCdEoFzXdKrvPR/YgxXt5sTmcVfaz1dB2gjpEcByDYNNDTYMdHsiU4a3iUXY7p+FwlpPLiVSCYKaFyPTQ4/Aup8rBOYZNilf/4AhBWVrjj3KJgUcNPeWC6RGfdWaCJ1pSc7wsVgdBlRqbbJEtkBVtpFkb/nxiXWdwgmekqbV89xmKWeNd0aZTlXItOggjKpUZFK0vxb8HEI6kHkrq2Pbh7a9A/821w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn8DdlNlDGjwPiPwjXPeF7ChV79cgbpjLbNzIFQWtCo=;
 b=hY0WjnqCJnf8MN/DRBoHx5K7h66LAXRD6oJV0JF0RrAf2H4KlIApgt6qR8ZQd2j7eTe400snj4F1ktNsCXE8F3csRE4ywCTI9ZkBgVnhtJPyB2dSAn/b29LasDBKTRvjZ4VHQIjt6tVScAnNbfKbfYtJrcCU/8NlAM9CBSbVwnvbxZOS2XdhqE6QOJ0krIo/rLXlAEfvWhhMySKMfyFouE0meeRwO3oGdAJWaauFrcEMrbwDRWhDyzRrCbsGwkUFxdryDwolsrHKgQmZ729ni161hIFbn3Tzsysp4aWooHIxwRvO0bdMl4did6tLkCbWfPsRr+LrdIXpSDMIJXqcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn8DdlNlDGjwPiPwjXPeF7ChV79cgbpjLbNzIFQWtCo=;
 b=bvBcwDAD2ebfjPkxj31bgOAnrYLuEqHhJa8DCzG5rthERbHG0lTG7Nmu4aSTM8U92/lASMy4gdcFSilMsV4hs4BCj4piF93ESY4PPGJ1y2Quyc8l+uTgsPgTUVaIYXYzWbsefw99BiS8GI8ieWyz0VendVYhG4RjOCA/NZOoCe0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4349.namprd10.prod.outlook.com (2603:10b6:208:1d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:22:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:22:12 +0000
Message-ID: <a1051394-2811-d0e7-ecc4-f421396b2bf4@oracle.com>
Date: Mon, 9 Feb 2026 14:22:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] pid: USDT probes cannot have "-" as
 function name
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522231ADA11F5C6C606FC8EC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522231ADA11F5C6C606FC8EC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 99698eaa-bf3b-46a3-f566-08de681086ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmpTV3JjYVlEMnl1emVWNnVqZFNNTWZWR3YrOVQyS3JFOGhUM0FYOTN5cG5B?=
 =?utf-8?B?V2NEd1o2K3ZQSG9ZakpBazZSZS9jN1V2cHRoTkJMRlUzTHMzVG5xcXpmQTdT?=
 =?utf-8?B?L2U2U0RucjduVVZ5eVp6NUF3Tk1wcDdLL1E4VERYR2ZHS2FjSnRyL1NlQ3ZO?=
 =?utf-8?B?aXZUVDlNUTJGdm1WY1V0RENuRjdsSi9ubFNSU0dNNUtqTmhTYlRBa2Z2THBX?=
 =?utf-8?B?N1M5TU1GYk0zSXRTVEJwb2F0dUJmUndIRDBCbDMvZnlqV3pySTErSEQ3Ry85?=
 =?utf-8?B?ZkNHZXBiRjZuUmYxanJRYmczZUg1NFVhMWpieFZiRHdCTUI3UzR5alkvMGhE?=
 =?utf-8?B?anprd2RxbExhUHo5UTdQS1BLY1JXL2gvZUR3VDBkWEc3R2N6NkFGdktWU2o3?=
 =?utf-8?B?TUpNZDRLeGlCTVE0NjFHNElYQzk4bFlkMDdsRWxaa05kZG5Ldlk4NjEyYklJ?=
 =?utf-8?B?V2wzcTdUeVMxcCt0YitDMTdtT2JnSWZPQlpIOEhyTloxdFA1N1pnODYyNHJH?=
 =?utf-8?B?eFhERlgwZys1Tzk5NUhCYTlGRUFrZkV1dE1FMVZ1M3M4NmZMSXdFNWF2ODg0?=
 =?utf-8?B?QjlmL1hOY2t5elZac3crdHFBQVIzeXdDbHBPNEZUL0JQVHRWMmlBQng5dHVD?=
 =?utf-8?B?UUZnbmpKOFhlRnYxUDJoMlZFSjBCVTV4aDBSVVRDZjE4SHMzUE9kRVZyK0Fv?=
 =?utf-8?B?MEIxOVlETEU4SHhIc01taGxQN1Z0Z21LV2xGS2l6QSthcG10bTdRbEZwSTZz?=
 =?utf-8?B?b2dSTnJVa1NIR25PMk9kUlNMRXlQaUttb3NkK1pGNS95N0syQkg1emh0cDZH?=
 =?utf-8?B?a0xyNC9Fc1RFRUhER1JEd2I2eGh0QWVDVU1vOUJZeGlEVXQ2RnRIeUF4UmRw?=
 =?utf-8?B?aFRKZGdLQUJCcGIzQkhJakFiL3JiNWdYVUhCV1VDWCsxTmpYRXJNWWRJcys1?=
 =?utf-8?B?NFFaU2FZd3RJNUtXOExMbGhuTDI1Wkowb2ltelNxZ1oxY3dQaDR5YWl3eUNo?=
 =?utf-8?B?bkQwd2JMWk12Q0tmSzdaYUdiNWVob2hUeVpTTlNXUHU4SksvUnZiRG50bSt1?=
 =?utf-8?B?RGMvSCtzTmNVZ20vRFpwdVR5cVNHaGVOVXRoR0M5NXRkVXNNUGlYZUZXMzVy?=
 =?utf-8?B?cDBINFdTSWhOTytDWFhNSk5ocTR1dEljeXVkZC9IUEhnNVZBUkhqUk1IY2Y3?=
 =?utf-8?B?K0lnb2lJazkrZjQ5YmN0Y0xST1MvbDVLNEFtOTdod2N5c2Z2QkZRU0dGM1ZH?=
 =?utf-8?B?WTNBOWE0M2M5cVdPMWtPM2NXMDczNnJvQ28rbTlKeUpwVlV1TkhoZURnejVF?=
 =?utf-8?B?VEVlcDRWN2ZBc3VZVkFxdTNtOWZ1VnloLzgxV3YzSGZOOWl1QmMzVENZZ3NM?=
 =?utf-8?B?ZkxqWkM4Y2tYYkl4QjdGMmZzNWcrUEZ3MFNveGMxQWVaTVBvdWlkODJWZHh3?=
 =?utf-8?B?MmI1R0h2YXlZL1FLcUVaaDkyejNqV1pjTkl1NUYwMWYxM2hFdVRWaHdNUzNn?=
 =?utf-8?B?V1FUNGhQZzBXTVhSa04xUG56ZUI2TmxoZmhHMUcxL1hKWGlTTHhJZG1DalND?=
 =?utf-8?B?TExHNmJMT3BMQTk1bWdYWkJ5amtjSUxuTmkwbklZaGR5WER4ZFZYWTF3Sld5?=
 =?utf-8?B?NVBvaEtSU1R4NGorckdqSGRFNTlHSGlhd3ppcmVYRjdOdjEyLzVYYXBkeTlI?=
 =?utf-8?B?WHVDdUJRblBNOFY2RjkveVBsOUgwTDBUMU1oeWlMaHAveWhiZDlkUk9laHNs?=
 =?utf-8?B?KzQ2QWJLcmtDS1BJUm91d2NFSlBXcW4veEJiMFUxczNtZnkzY1VXeXFkTVh2?=
 =?utf-8?B?cUF5c2dEM0oxOUR4T1BLRys0UStFeUUvNmZMRWhqZ0MrZ2ZUaUIxN0FjV2hp?=
 =?utf-8?B?RVJHVFMwaTY0R0dGeUxpWVVqdGNUMzdFSlBzWlFkbWxyUjJYZXd1c0lKdFRo?=
 =?utf-8?B?R2ZmU1UwempJZytpK1dRMmd5WXB1WFJINlBPV1A5dlN3b3lvUFlmVlRGYklJ?=
 =?utf-8?B?R3doMzNSZVg2NEN3MCt0a0U4TVpNNVpENDkwMW83Q3E3VVhramduUS82NE5q?=
 =?utf-8?B?MmpXS0FvM0oxd3FZVERQZTlJVkVMN2JpbjAwK0ZhYU9Db25KU1lMNWE1THNn?=
 =?utf-8?Q?FQyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhMeHN6MnZVcExYWUNqWERwdndDalVrVVVCWFdCMUJsRWdSRVhmY3ZwcGFC?=
 =?utf-8?B?ckR1RzJMWktoWUdvSmxzYno3bVhFaWJCL1ZLNVp4WVlKdytHM0N1MnFGZGNG?=
 =?utf-8?B?VXpRRm1hWnU5L1Nwc2RrcDRkSEhKSFpRWVUvN0dWdE1LQjZpSmloYzZ2dkNp?=
 =?utf-8?B?eTdqTFYyZVNaa0h2MlhNU2xjRy9ZWWpqZ2l0aUR2Y0pVaWRMOEFtaGdPeWZm?=
 =?utf-8?B?YUZMN2NBbTM0c1lnQVRvSGJTaTlnUXU3UGlUVWY5cm80c3lYRWF5UWhndGdX?=
 =?utf-8?B?MVc3U3liUSs3SHNMMG1rY3VreUt4WS82cVQ5SUsvOTNLRldhcUJ3SGhSUU5q?=
 =?utf-8?B?RGwrcDQybG15TUp3OTl1S0NOSHBURWNCMGlkUXBod0NBeCtoYWZ6SmZsd3Qy?=
 =?utf-8?B?a2RDL2lndEwyWGVUeStNZDByL1JXYjk2N3BXWDNXaHJKU09wUjJmWWxpTk5n?=
 =?utf-8?B?V3k2Yk9aWXR6dEF2ZzA5UURrcUxWL3dzRjBHRzNlbXBtWlJONzBLMHIybGxS?=
 =?utf-8?B?blpnZ1JiUnp6R0ZxLzdPMGszVVNROUFlcFh3WXRUbGJTejVpOXJHamRYa2FV?=
 =?utf-8?B?Z1hXRkpDbDRPcCt5bG9OblRsSGE3SVJWcWNWQldibTJ5YjhodldHcGYyMWZJ?=
 =?utf-8?B?RTBZSEpZRnBnUDQvVTFtd2VqR3gvUEhCZ29aOGdxVmk3VExFRFloV2FZUnBK?=
 =?utf-8?B?NzdxQkQ5VUtpUy84N3h1MWlWZWZZeVNPc2xZRVVBT0xlSTVTUXM0RlFWL1lU?=
 =?utf-8?B?VFM5ZXdwam5vQlpwQUl1QzQrYjE4dE1LZkw0MW1kWFpwa0NDVTVZSVZkaDhM?=
 =?utf-8?B?ZWtWcDI4TUhrbCtpUnlOZFoxNWJKKzIrYW1NaThqUUM4QmVnb25pTkN3Mk5h?=
 =?utf-8?B?RHJpMlJOVVBCOE9rQWRueGxoYTBwampqeTV2QURDZ3lHMFNuUm9LWno2anR5?=
 =?utf-8?B?MU83SHlIbGN5THZDVytjUDcrUVF2WFZTc1RFK0g4emRmRFlJQVFTUzVxQzJn?=
 =?utf-8?B?dlVhcG5mcFZ0eEVqWm1NK1dXUGlvelZuYXJiaFlyUzlER0orS1ZsRlZwTVBS?=
 =?utf-8?B?WHBkMWdwaE1WMGpqY3Zhb3FDS0ZwREd0ZWFSdFJDUVMwMTBrckVGODVNRlQ0?=
 =?utf-8?B?dlNOWXVLalRGZ1pLWUNnVFBmQm5tdGlHS2pIRGl1V0puTFpFRU90SDBTbkhl?=
 =?utf-8?B?VDNKVEk3MTg0SzRmRzZGcjNTMk5JdDI2aTJ6MmJ4WDBSd0xYVzBrSGpqMEFH?=
 =?utf-8?B?bHp5V1ZpZFZHT2VYV2FzUWVIWityYnBMd2V3bVE0U1ZpZmtiNmgxWDZ2bklK?=
 =?utf-8?B?dWNIZXY0dDVYNHJuOHg2S1ZVMFFpaTdTNmFaZDhDWEJMT0M5RTJ4RktzRG1t?=
 =?utf-8?B?YXRwVGJ4aE15OUhCOWNKeWtzamRUc0VRa1FKeXhjeWs0WlhjMlNqa1BJaDI5?=
 =?utf-8?B?N20wRHpmc1B0THp3TUlpSEhYeTN5MVZ3bFVXdXBhZlVhOWlveWRPQS9idVBo?=
 =?utf-8?B?eHhjM0pMeTBpbThBejV3bFNSaG9Tb1hCSkVqNUFsbkl1VUxtMVF0RGRvaEc3?=
 =?utf-8?B?NGhiZFk4NXEwZ21nOHhYMmRJVG4ySENONm9saGZIZ3BMek01dWpRN3BJZjRl?=
 =?utf-8?B?UFNzbWtuekwramhyaW9FbnVjcG84NzZVRFRuWGRoZFF4T0lFK0RvS3VQdWJ2?=
 =?utf-8?B?bHJ3bVpLR1Z3VWFoRTM3QWY5MFFPeDhXanJiSDJwMmQrbXh3blNBR0JZWFhy?=
 =?utf-8?B?MTVkL2ZrKzNBK1BQWXJlSmUyZFdMZE5NRjl6VzA0WXh5RkpHbzdBd0hhZmxH?=
 =?utf-8?B?dVVyOTNyUDFQdmUrRzNkOGU3bFJaOXZSOWx2VUJHTmQxREdKdEkydlpnNTZQ?=
 =?utf-8?B?ZzFQWjlnVTdkdDQyQ1YxWnhhQUcrd3RoM0dBend0Y2V3ZXd6TnhiQjFGdnpH?=
 =?utf-8?B?R013Z3hzMHlsVEdsTHpCVGpsc1ZYbXNSUUFlNnFkVXZuOVpUWU5zRlYxSWtI?=
 =?utf-8?B?U3N4RXNEQjVORUc3VElpdnByUjRBQWZnWEZPWGgwalUxd2JDOEgyUEpvamR3?=
 =?utf-8?B?M1V6WUtsUnlNVEFieEl5anlqUmxBNm56S051OTBNVVQrZHBaazVza2pMQ0tI?=
 =?utf-8?B?UDBOaWpRZnpoRmVTc1dWeGN5V0p0NC80aEp4Sm9PYlUvVWQ2K2pORWpYVnFC?=
 =?utf-8?B?a1hvcjBpT3B5T0kxNFRzNmRvQlJNRUVsK2hrQzBRa3BnNEhiOWJYcWVURGJk?=
 =?utf-8?B?LzFkaUN2dm9uNDFtbDdFMDloaktCVElIQ01JRm94VVFWOGc3enAzbmxGUytR?=
 =?utf-8?B?a3RmNzkxRTNBcGdyMVRSU21kb3ZrUW53VkYzcS9LTmFKL3BPM3Rqdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0z8upJqCvZYBGjRsH9ifVIG/XnMBjI6PJDE6ikXpCGFEvrVtQxzyFBIjh8m8sZCY80ioZm3Phr518n889LThskpFRCP03hOM+/FvyUhe2spgazKQIu760I/3U1aZGl4szbYjrNHp2cbuFy/InVV4cR3vVrZSUgl3uT1xXtzdZH0eK2gJyzUgcXjadPFvq0zstiUHM3bzLMTYd7ZNMTWre4FFLYBkWBZzo9esi2DinRcU7zNJU3lkj1jI6mmcbEBfW758eMvMdaCKCiwMQEsl3rQj8Axdg48vR1TMn2ScDq25voU9uBcAqSiltUCEvydYgpbIBUFYRGM0/h6dZrNF5/HxrZHjR05rt5n1pX1oksq99Um7oVT3jykB22QyNNzWD2+zkhcp0cT/gXyTzT7mFzgNwZN/l03fd38nyIptCtmOVVeR4NN+6hhFidKD8cjbRtS2VUUWmYieqWvsoNTLqL2Soxeh3B+dz5jQdnQPTnPkkohkABfnq9JU8d0bbZHdlbz0mSxPRsYL4AzEnH3dJIpb9OtluMT02qXvWq/Hq/WhevFdK0uuVVZxuJMQ0G+1uPmM7hlzINF1nguA2v/9cSLa8HCET8QvPGmRF3nTIFk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99698eaa-bf3b-46a3-f566-08de681086ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:22:12.8188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOVEYAVaOmDjfUCFJYMhkG6yMda/k4Rc3nQ1ZC0wxrTwho9Rv3evMJh/zdih4NNPhLsqVkrY/h3Q88WFjKGDCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090163
X-Authority-Analysis: v=2.4 cv=KaTfcAYD c=1 sm=1 tr=0 ts=698a33e8 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=dr9r7GPzrPmKyZdTxWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12149
X-Proofpoint-GUID: dj4JjJc1V9j5o8CVUdO-lxvwuOkvqGBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2MyBTYWx0ZWRfX5tGLBHTPUHU9
 KRN8R48vM3FpKCmHd5hnY/5nIZTN2B6v6y4/8LnYD6hssveJT12kND25O8skTn607THWuhT7LIu
 JGSwfnFIOmDXWVAN7RhJzz4Nmf7yt9GfofMQjV175mcGqZikrQDIerv3fNDOU0MpD3vCPiqv/NO
 kFLGQYlTYl6ud4Lfpj7XCYWgnp1keIhosAMb2L6Zyv8N1megLX/7uSIU/n4vvFRMl4f+UK981G6
 spemOOiaagzzRLfuGUmwA5nen2XzHaIreZVrlJJ5Y2OTx/heegW08+TwHQTkADwWVCa6VJj4KVN
 MqScoBkDMizDWNlVUJ/6hOICuFEztCNSHIcjlhhWzIWCzDTTrd9d2fOliCyeKURRW+A9aKsh2ln
 DOxCI5sVcDZ5eeJ2uAN1omTs6NoWAGqr/zTa52xOA4Okfdnk/46bop79HaojL8gDDb6Ehy2aNke
 QfxJ9/7q2h+vCLuj9lLbPx5HALH5ap+SIZWiXq1c=
X-Proofpoint-ORIG-GUID: dj4JjJc1V9j5o8CVUdO-lxvwuOkvqGBq

Could we have a little more explanation here?  Like, what is wrong with 
the current behavior (which is... to complain that the probe is not 
found?)?  And should any test check the behavior?

On 2/9/26 13:35, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_pid.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 517b9265..ef97c8d9 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1568,6 +1568,10 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
>   	char *globpat = NULL;
>   	int err = 0, i, nmatches = 0;
>   
> +	/* If the function name is "-", we're done. */
> +	if (pdp->fun[0] == '-' && pdp->fun[1] == '\0')
> +		return 0;
> +
>   	/* If it cannot end with a pid, we're done. */
>   	if (pdp->prv[0] != '\0') {
>   		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
