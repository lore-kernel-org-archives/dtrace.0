Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DD1EE03D
	for <dtrace@lists.linux.dev>; Mon,  7 Jul 2025 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751912087; cv=fail; b=kJQZidyn5egTHNfdi5o0/2ZvUzu1BAjp5qygFzX0FGRY/3tnRPr64ixonSKK4dp6c+Cl+GCxONfWwQix5d1RIjBBtB191GXZbg/WpQrcZN6suPDde07tSGYQwCT7bV3XeYry3IPI/Pak67smpVQ3rPveMvCzwKGhbfsO7sLaXAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751912087; c=relaxed/simple;
	bh=apFMnFkat3DWe2kBCwmG6TZzR1kMNk3x3YbdR+9dYY8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mdIVfjd22YXa5GFJx6lyqXaNWgLqD3v3S1EWGnb5gNka/WGPOq2gn8koI4BzyFja/jjyRG6+/hi7jOzb0b1lQHQrn23uB4KisoNxeSs96CcbMgS/JQgtYSluKS4wXC8Rpz4YL57LU38ALa09JacqjK7CnE6A6b6WApQzmvOlnt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OsySdR3J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wPMkkKke; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OsySdR3J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wPMkkKke"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567GbUrN025269
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 18:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=s0MvHKuo7L6c4XnTpgXwGcQXSEspK6A9gpMwtaYMupY=; b=
	OsySdR3J0M1tzX/BVVT/C61wn/93u6uUKkpJ66AHYE3d8FW1TOrcywFcjmydXxmH
	6t5VYTDyd7zV76oD7v/DH5u4TnMoVpw9iBWQfgUdJbNOZXjInWLkkF6GWq9mpeWR
	yKKeVnMVMU5bvsjqYMmkNUh+MTYVACPTQs8Y7jjaq1NNZ+gsS93GBEaJL/iTsPmD
	7h7EBwvBi6BPZDZ+tVnQsUzFHZpz5vm01QXIdbsmhtBCId5irZt5bh2So77/MZhh
	h3bjIwniHyA1PK0mgMX2896esgXxL3r8bnIz1FBNqfNUnSX/fAnK1GUfLX7/5OyH
	hjMkpD9BpIa8eDzYJA+hUA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rhwmg6tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 18:14:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567I66UD040481
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 18:14:43 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8tyu5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 18:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cdp08d2c5RfUMMixIdYQZisC1qXQGwrKqo1ooGOQMKgu6vvlkZbNGwNPE1E6a8okSV0UJbLAecLIC5d3iNOu8gV4/D+4hqOzKUlvJJs44f1fSkq55YVjGkoLYVOrLHwCZgn9VdJg7cqKH6Kts731BamHqEO3hjwGsKQu+lTKUAwRMILaAueVdGjb4Wv+rBmgarCwlZnZUultXzjpsOKWjqMQFx3oGLsdVaJy4zhLeFu8Z1uudo0o2NFr6WWgaSt+GaMB7VtQ7gEzr9x9/czaB6oT6IylxpcPxu3mWaDxcfg/uU2GmaPYWK+Uij70IClizUZIrOOqVIS81kZO2fAXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0MvHKuo7L6c4XnTpgXwGcQXSEspK6A9gpMwtaYMupY=;
 b=XHD7wvrgK8wARIsiRYQO865axlWqWljinhXF3zRYCRfoSt/uOwPouTb8nFzFXRf81Pb7xjb+rTZjzxdz6HOldWKAnpmRgqGV+3WPiD/p9icHBoPV0wluGjvxZgo4wAwTt3iVdEn/ei0rv/edQIJOwXXYDamBoamwC5MKe5OPERy9o8mnQIzWr08V2h9qkwGpxrX5ab0Dhlk8zz/K6hX6CVJx3ac5M3m8wFR1XuzBTEb9yOZfOEscO7Pk94ukBQDTc1EI66j6oQnIh0pntsX6GF8/CS5tXTJ1fIKRKhwaYWDllKGty8zCgphm/Me9B2HVqQK9cCCj6eAms4nFV1JgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0MvHKuo7L6c4XnTpgXwGcQXSEspK6A9gpMwtaYMupY=;
 b=wPMkkKkeGsffyg8IWLNWCbcg4Cu8NLPIvii2mltACCP2ovTyNzZvUXxIx/pF+yVE5rycYOdLrWlWhtnxEZe8LD/JiCb9RR6s5kWZJKwXKQGwvQpH8IwYtlP2G67kbk29mjTEuC09J70zd+WGZ05JSD8R06MpNhm6hXQK4A4VMPE=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CY5PR10MB6238.namprd10.prod.outlook.com (2603:10b6:930:42::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.23; Mon, 7 Jul 2025 18:14:40 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 18:14:40 +0000
Message-ID: <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
Date: Mon, 7 Jul 2025 19:14:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com> <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGv7kQqlPZt6Kmw6@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::36) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CY5PR10MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 960caa44-4db0-46f5-8fd9-08ddbd8223d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWg1bDZKTS90VDNUS2JlTmg5VVZsMEl6N0ZCWmRmdVJiSEwxQkVUVkN1QTQy?=
 =?utf-8?B?QlhFWndGUlRsYmxHMjFXNU04NmdhMGxnTTE2THRidDc0bWY4akp4a2FPMmJ4?=
 =?utf-8?B?SE5oSWVJYnhBOVJjWEZRaXVFMnMvamdrQWFLUkk0OG5iNlBwZzI3cGV6UVVQ?=
 =?utf-8?B?QTlSdi9LR0VNdTBveHBtSWVuWm50TzFiaFJnY0xYZzN4NzdGS2kySHZwOUsw?=
 =?utf-8?B?TGltWHZBMUhmWkNnWlphSXpLYkNiN2RaYTVDSCtqaDdMaDN1aGNxelRNR3c3?=
 =?utf-8?B?Vk4rSmZKZnBzSFZrTE5VUzZab29FYTJBUjJZd1RkK09UZVZGRkFsOXcvRkp0?=
 =?utf-8?B?MnBlS20zTnBmY2dmOEhMMWhCL0hZdVBEeVRVTEtjUnU0OW9oMW8rVEdGdTRT?=
 =?utf-8?B?cXFlNEM5R082bGJNTEdWY0JPa05Sa1ZQMXpHNHR4Y3NIZ3JrVVFjRDlsR2pV?=
 =?utf-8?B?cGtTVXFaNklzUGtBWkY2UGdoeHNZdkVLa2VaS25CbTZFUEpDbU5yS1dXaExn?=
 =?utf-8?B?WERnSGh3OHFUZW5QRUFJaUtadUJDc2Q1Y1NUNW1WOFZsZEl3SEwrZ3VJNDQ3?=
 =?utf-8?B?VjBJdmlTbUJiMHd2eEdOVGRodk91SmlheXFpMDhEKzBrLzFMYjliVXZNaTRX?=
 =?utf-8?B?VUxuVms5VUZsM2VEaSt3K1BTT0UyRGtUMEU4U2M4Skd0VEZDbXl6NlJnclox?=
 =?utf-8?B?TkY5dHdqSHhHeThjNTl6SmFPVzNqbXVnNEw2Um5MdjJhZ1AwOHlud1ErdjR1?=
 =?utf-8?B?elFGMzZnN3oxUW9XcEZib1Q4bzdGTHdmTmdNUktOUmN5YzN6dzZCdk9kUCt0?=
 =?utf-8?B?M3JXalk4Yy9aRkVIb2laWE9WU3phY1IrZXBoVlJxbUZGV3A2aU5aT3Q4dWhF?=
 =?utf-8?B?SkFJMTVrbEJqeDkzSnV4cThhOXl2YTZhRi9OVVM5UjZtOUlEbEkrZzlDVXNx?=
 =?utf-8?B?VkRqMXduSUx3NFdwMFFJM2Q5dDNjTU1RMzU3cmdWdTNpRXp6YmljRnVVUVVo?=
 =?utf-8?B?di91UmhZcWh6T3lGNkdOaE1DOG84S0hwRE1jS0J6eGUvaDdQK1lwQnptUDFW?=
 =?utf-8?B?WHc1Q2dNdWdoNlNMSHpiUTBEYnFsYlByaExVS2lZWlNjUkVGSGhQOE1ZeE02?=
 =?utf-8?B?K2d3WE9UUFFzSzhORzJXam5PQjdKRXltd0F2b1dLZlQ3VkNhSE1YcXZTVzl2?=
 =?utf-8?B?Q1JoUG4zZ1pDYjhqMXFvbEMvbHpNN1Q2OXVyNmFjVXpUeWJYaE1ac0lCTXhB?=
 =?utf-8?B?YnNNMG9JZnpCWXk1bVdQVUZHc08yRjJUb2lFVkk2TFF6djdHVjBaMzlKc0NK?=
 =?utf-8?B?MUhBbEN2d0hVNDJKZVVrK3A3NWVNdHBuZTl1ZWRENXpwdmRRdFhxeE1XZlV1?=
 =?utf-8?B?VDZYRWNiT1Q1RjY2SWpacFFuMmFsaURTc1pUbHRtU041Qy9qaXl1Y3dSL1RY?=
 =?utf-8?B?dVpJQlpXaG5nSTVIOE9kTzJQcklld1VtSkhIbVNvT2d5SWYxcFl2Y0xMMUto?=
 =?utf-8?B?THpweGRrU1MwWE9TNDZlK29ZZ01KSm9HMno5UGd0NFk1RTRLMFJhTGFEYU9M?=
 =?utf-8?B?UHlrQitDZFhUYWh0RXN1Tk1IMWcyam5TQ0lmaEVCRndnRVZWMDZIczZaakhG?=
 =?utf-8?B?WFA3aURNWTR5SnlQRlRKSVZkR0pucU9YMFpsakxWQzNXc00zMUhNRkR6YnJZ?=
 =?utf-8?B?K3dTamFrYmMrdTY0SE0rVHZyUVg4cldEMWVzR3NobXY3UTVENlQ0TjFtaFkw?=
 =?utf-8?B?eDZaaDhIS1p5b2NPeFMxdzB5TzFtb1Q4Qk1SSzlBTjBmS1hsSUMzUml1U3RG?=
 =?utf-8?B?ZmFkU2tSdXp6SjBaUDJkTVhPVW9zeExiTm14WStCVW9FSnNBbndETUd3R0hx?=
 =?utf-8?B?Mldhc3RTdkFielpPSXJpakprSzE0Rjcrbm95WjBOTlFmVWdwSlZ0YnJSNzlo?=
 =?utf-8?Q?RJIRIbFmt+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGJKZC9paVlQN3ZIUFVJZnVSME5mQWZvRjdpVmtPbXpXLzFONzltYk55SjBG?=
 =?utf-8?B?MEZNelBiMklyVXd5T285WVYvSzhnQTRvc2dHOFdlRjJQZnY1YnZwajNmK25T?=
 =?utf-8?B?dW9td0FLV3UvQ0RuTHJVbHpzcWlwcWthVnE5QnBQZHJhWDRScHIvR3JUT2dv?=
 =?utf-8?B?MzVXREhFRDNpalVFaUU4UFYvaTlKSHpOOGduako3eFlUVUNNdXBWM1JLb3BX?=
 =?utf-8?B?a3FLWVV4UUJoTXZlejl5V2IrNDJtRks0TUljb2dxM1Vzc0xtQWQxckZGV0pQ?=
 =?utf-8?B?U1hZc0preExoUlFteHYrZ0c0WVpmVTZoa2hKVzVvaldYRE9jTzdSSlNJc1Rl?=
 =?utf-8?B?U0s2b0JLOXZXTUtwd0FETGkwMFQxeFVmMGlsRnlOUGhZNlFWWkVlVjlXVnlh?=
 =?utf-8?B?MG5PSXdRbWlsQStjZ3ROOHVaYitqVFpveW50TndZbzZhZVZYWmZTS2d6Zkhz?=
 =?utf-8?B?MWNQSGtPTE5ySjRKK0wwU2Ftays3SkIxQTF5WW5NbVJjTXRtRER0VUovM3I3?=
 =?utf-8?B?TE5EMjVBMTRLbHR1VUs0Ym5FclN6UC93ZHk1Rm05cXM0c0ZBUG85bW9sWFgx?=
 =?utf-8?B?L0tzY3lOTitpTjBTM01UOWtuR0VkUWZlTllBUnlEanloMkp5WmhOTCt6VFYw?=
 =?utf-8?B?VUR5eFV6VmJEQzJpajdpWGVhSS9jdzdBa3FYTVRpY2s5WjhiYzNmbWJzUDVm?=
 =?utf-8?B?RkVEeFJrMFF2cXlUdzVrbjJTZ1h5dlBKYkpydDg0clBBZVl3OWhscEUwVEti?=
 =?utf-8?B?Y1MyS0toaVgvOGFrWEZIVmZWNnBLRzBJeHI1MHVVby9IV3NPcWNmYVdWTUd4?=
 =?utf-8?B?dFlBL3dndnZFNVRnSmFkTDg0YVNyZjZpbTRYN1NUYXowSzlBeU9KVHE5aDJV?=
 =?utf-8?B?M2xEeGU2UmhXUVNxQmZIQk9HOXR3ZHRtbUdLQzNFVlM1d1BMa3RBNFFSQkJU?=
 =?utf-8?B?QVJGOTJ5dEJkVk8vNFNHcDM3TXpEWlo4TjZodmk4c09UWXRsVHNiSHdZV3Bq?=
 =?utf-8?B?QTR4M2NJNFZJRjF2TGdIU1FTQWRrNnNoUXhKTTlZaEFoRHNkVkk4RU8rakRy?=
 =?utf-8?B?WTlhTTVLZlJnRFlWMzRtbTI4YWx1a1RHTnhuV3EwMEtPT0Fxb256L2doOHVX?=
 =?utf-8?B?d3lIN2E2ZFBoNTBpdWErWEZRdHZxMitwVmdLc1B4Mm5Ed0xsR1JPT3ZCWXVU?=
 =?utf-8?B?MlBSQUc5RzFRUER5dEs4UXdqYXczaE1VRGJDRGlsVlY1UHNLUFNpMWM0T081?=
 =?utf-8?B?MEFBaDhIR2V0Vm5aNEpRNXJhVVB4ckJxWnZDUlNTMTZ4TDIwQTRmRnpSU0py?=
 =?utf-8?B?a0svdjBGZ0ZDcE1QK2lGM1NadFdNSVNobmRSb1hDUnJOTDlwNTF4TlFENEpQ?=
 =?utf-8?B?R2FuMC96OXhFeDErN0RSMHRrYUIzSktiNitPdTd2RVlPMHJUZlhEaGRadW1R?=
 =?utf-8?B?RDMwNzlkV3ZEODJCU0d0SGtUYlJLYjFwZDBoRGtEU2w0NHJqMEpFV1g1ZTB6?=
 =?utf-8?B?YXB4VmlvWGZOR3FLTlBNZzE5QjZVWHRmMU5tNWd3dlB0WW9iTVNJbVFsbmlN?=
 =?utf-8?B?bWtjMTdTVUJ2bjZmS1dvS2VXei9NMFg4SllPZFI0ZmNxYjEvYkZud1V0dHVK?=
 =?utf-8?B?UVV0aWdISWMyZHNKSnFpRms2SG1pV09EUHBmdVNDd29xbGVKUS9jWFl0M2p3?=
 =?utf-8?B?dTRIVjRzeTAwTzFzT3d1STBTVk9pUmZzbzE3L1lrODhLb2NRa3FMZm1FSFhr?=
 =?utf-8?B?SjBaeVpWR28rMkcwRzNMZVBMQXZLZHQ2V2pFcnRwM25YQ0JVa0Mrb0UxVnNW?=
 =?utf-8?B?NDRGY1QxeHZLWndZL2F4QnVsM2hDMkF1RUE5OFZWUjBEZ1l4eFZNdnYyOWR5?=
 =?utf-8?B?a3g3bndpWXdEZVJkcXJKSjZwZFZIUmo2eEJ4cmp2VUFXVktRL0prYTRUVUpj?=
 =?utf-8?B?Z3N1QXlPd2Z2cHNzNzRKVjVEdWR0dVhzbFFzaGNZWkVjOVYvb2ZwWDdmbXh2?=
 =?utf-8?B?aVBsd1A1MHgzb0x1WDVKdUtFdldWYVdQTFpkQjlFdll5ajJ2Uit2Vy9WbFY5?=
 =?utf-8?B?RUJBSzNWQmx6UlZyc0ovRWw5VVpIeUt1Y0M1Q0lhakNEek1LbjRGanhnTEZv?=
 =?utf-8?B?eEFpQkRxTkkyNXRSY1VGSmFZbWVpT08ycHNPcW5aZ1NmaW1VbEVyUU82U3RY?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	txqOSwL2OMlOnq9U03TmJeDfZYgDvF2fkLIuNcDZkU2f4dPlgmi0/h80UGID5Qh/zwb5kFw8icWKqq/Qcit+QlNZNbREjme893arCr+lFAcRtx72fr3SFOJvEG+dgCanDcr195vsauPlmpePJNwk0p32uZ4BZ2o2ruaFKIceM7+bJ7QdZj8N3GskJmhMOmlq+xQpNSxi58AG0dbi5yfKooQ/kHD/bncN+ZtsS+2riWb4bdm6Zdvj6zxklg1GfNBq/9Q0nmG7gRLyX5kFG3rjkPBtDRl1yhCRzhPShXR79TXl8g2i1g1vSVrANAIaGZ8ZcW69pp0Rlkd363aIt5iUERbeAYiJZKzMVnhugg0jLSFUQaKSf4WtiHBu5DP3LFirfK0+LqrJt3p0q1VCWEoc1VQI4h40NE4Ju8DqgGInZTaVtT35TgJ6ieYReyipDTeaC8nM2TE0fl25V6LtByJR4xQl83CtOAyXqVEnrawwsISTp72X1UpkFaIuDLJZZMLtr/f7brNliraDhOOJ5o095u/30saD7c5QGGwBtci9gos4qhzasmphdLiEoMH//mxzkJWhl1UF9ku35ZDBk50qXPLtk9k6CG+2nCKzreMnodo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960caa44-4db0-46f5-8fd9-08ddbd8223d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 18:14:40.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/yTVH0o6Q0aT6u/0hCGvTxrdI4AHoUxcvEOgj2KM98FWra/wHHuxboXkbFjfX9ulef5dKfUz7kWyAXq/KvpuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6238
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070118
X-Proofpoint-GUID: Coi1Yv72fp1M_2SZs1k_Dn5xN07CFmfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDExOCBTYWx0ZWRfXxnr0O87tFBaw t2jC4na6LKvs2e1Aw8Rqg+EKtUVwYEoujtlGqwpPcAb9Bx4pPEQSbYcYl2VakLqSyL78qlvV3ZU x+R05PTJa2Kt2b3NVYJaTC9ga1sF1BHcdX8WZrYG482iMcb4q3YcPl4Jvj56gBY+bCpGpLq0/j3
 fb60aMgGY5PSRIlr8iNOyW3SgzF+vaGIkDKUNksYc40bYiVd0xnxre/mLCEMTDRR9k+MkmsTnE6 KCgDsKTDccQTpR3pMmDnQqkNlMKBXSMbACr0jUAYN8QrM0K4WFra7IkgHBZoY8HT9/TxQtUSwpJ LMA0CCLfA3GY3l8GLFkxfyEQM+tgiAxL1KJ01bfpO4Z0flWfm9ldJqNKRtBsQNfXesQVCL/JBNM
 mwnL9HlfBe9LwIhZgyOpjS/VkPxxW0j9Me3cX/PoA+c3AgqaQjggIJppZemrGhQMd4og4U2q
X-Proofpoint-ORIG-GUID: Coi1Yv72fp1M_2SZs1k_Dn5xN07CFmfX
X-Authority-Analysis: v=2.4 cv=Pv+TbxM3 c=1 sm=1 tr=0 ts=686c0e94 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yxsa2UIEm7d1Y9cdxgwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 07/07/2025 17:53, Kris Van Hees wrote:
> On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
>> On 03/07/2025 23:36, Kris Van Hees wrote:
>>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
>>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
>>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
>>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
>>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
>>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
>>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>>>>>>>>
>>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>>>>>>>>
>>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>>>>>>>>> patch 3/4 feedback).
>>>>>>>>>>>>
>>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>>>>>>>>> send probes?
>>>>>>>>>>
>>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
>>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
>>>>>>>>>>     Unknown type name
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
>>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
>>>>>>>>
>>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
>>>>>>>> this I believe?
>>>>>>>>
>>>>>>>
>>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
>>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
>>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
>>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
>>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
>>>>>>> this failure.
>>>>>>
>>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
>>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
>>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
>>>>>> translators and that works with that typedef in the file, so this really ought
>>>>>> to work.
>>>>
>>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
>>>>> in one test and I now hit it consistently for all tcp/ip tests
>>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
>>>>>
>>>>> My assumption (probably wrong) is that the include of the library does
>>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
>>>>> in the CTF dict. If there was a way to force that type generation at the
>>>>> .d file level that would be great, not sure I see a way currently tho.
>>>>
>>>> Well, like I said, it does work for ip.d so I don't see why this would be
>>>> any different.  I'll have a look and see if I can figure something out.
>>>
>>> Looking into this more, I think the problem is simply that you did not sync
>>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
>>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
>>> your change, it will fail.
>>>
>>
>> No, don't think that's it; the .d files that matched the kernel I tested
>> on (6.10) were synced; the use of the 6.10 .d files was visible in the
>> error message. The problem appears to be around the fact that tcp.d uses
>> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
>> translated types) it does not have any other mention of ipaddr_t.
>> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
>> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
>> type list.
> 
> Can you reproduce this at will?  Can you give me specifics on OL version,
> kernel version, etc?  I'd like to be able to reproduce what you see, because
> so far, all I tried actually works once the ipaddr_t typedef is in net.d.
>

Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
+ OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
environment. The extra casts for the inet_ntoa() parameters that I
mention above are needed in tcp.d to get things to work properly for me.

I pushed a branch to

https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken

that illustrates the failure.

Relative to devel, it consists of 6 commits

1: the v2 of the remote IP address change (ensuring the remote address
tests won't fail);
2-4: a few prep patches for the tcp provider; and
5: the tcp provider patch (in a v3 work-in-progress form); and finally
6: the top-level commit then removes the casts I added to tcp.d in the
previous "tcp: new provider" commit. With that change in place on my
system, the previously-passing IP tests start failing.

If I "git reset --hard HEAD~1" on that branch (reestablishing those
ipaddr_t * casts) and rebuild, the failures go away for me.

>> Further debug logging shows that the actual type addition happens in an
>> order which can cause potentially cause problems in some cases; for
>> example with the above changes I see:
>>
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/errno.d
>> sorted (1/2)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/io.d sorted (3/4)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/ip.d sorted (5/6)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/lockstat.d
>> sorted (7/8)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/tcp.d sorted
>> (10/11)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/udp.d sorted
>> (12/13)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/net.d sorted
>> (9/14)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/pcap.d sorted
>> (15/16)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/procfs.d
>> sorted (17/18)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/regs.d sorted
>> (19/20)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/sched.d
>> sorted (21/22)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/signal.d
>> sorted (23/24)
>> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/unistd.d
>> sorted (25/26)
>> libdtrace DEBUG 1751904270: typedef processorid_t added as id 2147483677
>> libdtrace DEBUG 1751904270: typedef psetid_t added as id 2147483678
>> libdtrace DEBUG 1751904270: typedef chipid_t added as id 2147483679
>> libdtrace DEBUG 1751904270: typedef lgrp_id_t added as id 2147483680
>> libdtrace DEBUG 1751904270: typedef cpuinfo_t added as id 2147483682
>> libdtrace DEBUG 1751904270: typedef cpuinfo_t_p added as id 2147483684
>> libdtrace DEBUG 1751904270: typedef time_t added as id 2147483688
>> libdtrace DEBUG 1751904270: typedef timestruc_t added as id 2147483690
>> libdtrace DEBUG 1751904270: typedef lwpsinfo_t added as id 2147483695
>> libdtrace DEBUG 1751904270: typedef taskid_t added as id 2147483696
>> libdtrace DEBUG 1751904270: typedef dprojid_t added as id 2147483697
>> libdtrace DEBUG 1751904270: typedef poolid_t added as id 2147483698
>> libdtrace DEBUG 1751904270: typedef zoneid_t added as id 2147483699
>> libdtrace DEBUG 1751904270: typedef psinfo_t added as id 2147490324
>>
>> [edit: following typedefs come from net.d:]
>>
>> libdtrace DEBUG 1751904270: typedef conninfo_t added as id 2147490329
>> libdtrace DEBUG 1751904270: typedef netstackid_t added as id 2147490330
>> libdtrace DEBUG 1751904270: typedef ipaddr_t added as id 2147490331
>> libdtrace DEBUG 1751904270: typedef in6_addr_t added as id 2147490332
>> libdtrace DEBUG 1751904270: typedef pktinfo_t added as id 2147490334
>> libdtrace DEBUG 1751904270: typedef csinfo_t added as id 2147490336
>> libdtrace DEBUG 1751904270: skipping library
>> /usr/lib64/dtrace/6.10/udp.d: "/usr/lib64/dtrace/6.10/udp.d", line 10:
>> program requires provider udp
>>
>> [edit: followig typedefs come from tcp.d:]
>>
>> libdtrace DEBUG 1751904270: typedef tcpinfo_t added as id 2147490338
>> libdtrace DEBUG 1751904270: typedef tcpsinfo_t added as id 2147490340
>> libdtrace DEBUG 1751904270: typedef tcplsinfo_t added as id 2147490342
>>
>> [edit: following typedefs come from ip.d;]
>>
>> libdtrace DEBUG 1751904270: typedef ipinfo_t added as id 2147490350
>> libdtrace DEBUG 1751904270: typedef ifinfo_t added as id 2147490352
>> libdtrace DEBUG 1751904270: typedef ipv4info_t added as id 2147490361
>> libdtrace DEBUG 1751904270: typedef ipv6info_t added as id 2147490369
>> libdtrace DEBUG 1751904270: typedef void_ip_t added as id 2147490370
>> libdtrace DEBUG 1751904270: typedef __dtrace_tcp_void_ip_t added as id
>> 2147490371
>> libdtrace DEBUG 1751904270: typedef caddr_t added as id 2147490380
>> libdtrace DEBUG 1751904270: typedef bufinfo_t added as id 2147490382
>> libdtrace DEBUG 1751904270: typedef devinfo_t added as id 2147490385
>>
>>
>> Notice that the ip.d typedefs are added after the tcp ones, despite
>> tcp.d having a "#pragma D depends_on provider ip.d . So it seems like
>> the "depends_on library net.d" was honoured above, but not the
>> "depends_on provider ip.d". Moving the core net-generic definitions to
> 
> Ah, but depends_on provider is different from depends_on library.  The
> dependency on the provider means that DTrace will not load the .d file if
> the provider is not available.  The dependency on a library file affects
> the sorting, because it indicates that the given library file needs to be
> loaded before the one that specifies the depends_on.
>

okay, good to know, thanks!

>> net.d alone was not enough however; including the explicit casts to the
>> argument to inet_ntoa() (to ipaddr_t *) in tcp.d was needed also.
>>  > Also, I do not understand why you removed the pragma
>>> 	#pragma D depends_on provider tcp	
>>> from tcp.d.
>>
>> Yeah, not sure why that got removed; I'll add it again for v3.
>>
>> Alan

