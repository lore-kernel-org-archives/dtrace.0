Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505135B128
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761257848; cv=fail; b=cJClxAuJs2dYtRhy8tnFqI3He9NgTBWgw2QriuxK33TMt1klrSHyjUYBygXSVqM8Fo4cFQBqhJPFEK9aYauM6lIZNVm4H+5NX++N3Uo5aaQ9iFpzcJ/qe8i3x+ZFKeWov8PFZFy8UVqZSNAcgIluYMtAug54ze0p49y9Ukcy0Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761257848; c=relaxed/simple;
	bh=RPIUkHxqXQ0qKYDDrkBDgyx/0Cqxc8/grGFA7hHB7LY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=llNG6MaUmsVMhFMfoYkaIliYjVjAeEgh9FqU4Rkm0uYaUNMirxaRMUv/c0tp8/I/yarLXrO37TMWymHLfrqC6JZIdqtOQ566VHT3bPSw46sjMYK+F00G+vt3cx07ydc/FQdyejCDdP/n7AjwdmA4ScYVUuTXSkEMfKg3b6tRdC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JcwqLlLF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E3lhZOiA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JcwqLlLF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E3lhZOiA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLNP0s024039
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=ek/cX8cV+2q8Dt9o
	fzEwEphClxc2bRAeqfoFAYjA29c=; b=JcwqLlLF4P2WMA8pNDUvZ6xrLhSg8R+Y
	uvahjIKs9y2lMCGgZng8v61pcp+ID47DdXQqIy39c2pnC9CVj0PvckbqfzsNbDHp
	r+U8pGPvkfOcxh1yKZA7iLycJgxsFJKOKgEkpMuFV7OGpw+A5II0hvJJmoSPXOL2
	QMfQ0AX8F6/YQ+B8tf529Gs48oJNkB6VIpD33ovyfSlIwEPpBWO5MIaMzfw+ehHR
	8hV1Ntg5TxvWTmgX3cwfE2OnwLvkqJETUtl0YP76E/hFZpf0s9+eERfWJYxyLZEN
	eIqEpmzDf/ICQ8vSvoC9f6QFL8yu/Dw9aUnFSgQq4RsoVy9Rlyehmg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvd0uk5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:17:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NLsdEX012430
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:17:24 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf5kx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 22:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/55t6mGMAaK5aPSMQCet41r2ASsEzeID4KRr8WVeE6zdNF2n7cv9Uol4PqVJuGp6Fg5bOpSbIAjyhNyBsTp9dQ5wyhKrflWKoTQoAHbCe7Q2tBMNaXxcXiHV5IBKg5wK4hRgf47cfjTT1Z5rhRmTt+COA73ArQApBVM3sUQd8y7+xihCeF98CKd4nSh2t2z88scbfqyQGBSVLmUYeqIEVqOhwayf2UnmFEPjJAiPXgvQavqva6pMt08zAWFc24XZRPTTMKY46pFHdxGNMGHHbBWD6s7kjMGcljB3eCUuvuFnOx0lPTLoBqL6DOi/aB5LI7QjSbZllXP8Y3dJTIISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek/cX8cV+2q8Dt9ofzEwEphClxc2bRAeqfoFAYjA29c=;
 b=A/x8pIHXCthDWv5hJrODmfm512PPGB3jRDtgnvytRkANfkkRgX+0Rtso0XPFlGyG72tRNL15EE8Pqd/Eg5LgX3PU8wS3wyJKA/602gpg1ojNmzNAZO1COf/ipwkF+T5wVdxm6NU4STEZBoTuKbq0AeQf/TwLAyb0ZWH7cwtOR/NjC70p+BdviZD8h05qyWO4FzlIpdvPliAi5LAqQxu71hmDBjI3HI5HDknHxjBBokR8BPMkx3MJAJGWj+zcNbEd7ulD9B/p2Vcbua5nNJTmp2cXmQTDt70DwwAn49umrKinbQef0+dSUFIjzP6xIU/lsmifCy2C+tKCZWO3HMD1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek/cX8cV+2q8Dt9ofzEwEphClxc2bRAeqfoFAYjA29c=;
 b=E3lhZOiAyAIhyTuUL7wf0zcOaNRzcAIk7GIWRzx2PLYDnYuN1c5BygKfwUfJvgLD9pAC4qO2Agqa2HRcWwCVF1SoIG1Yr/jE6JG/1pRONUX4mjM+DX8KKKOeS3tacoYFtOZyUcIb5Qx1+fb3QEQeUAy537ew3h8KU6pIJyyWTTA=
Received: from IA3PR10MB8513.namprd10.prod.outlook.com (2603:10b6:208:576::12)
 by PH0PR10MB4503.namprd10.prod.outlook.com (2603:10b6:510:3a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 22:17:22 +0000
Received: from IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823]) by IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:17:22 +0000
From: Bruce McCulloch <bruce.mcculloch@oracle.com>
To: dtrace@lists.linux.dev
Cc: Bruce McCulloch <bruce.mcculloch@oracle.com>
Subject: [PATCHv3] Update llms-txt and add README
Date: Thu, 23 Oct 2025 15:16:48 -0700
Message-ID: <20251023221648.6200-2-bruce.mcculloch@oracle.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To IA3PR10MB8513.namprd10.prod.outlook.com
 (2603:10b6:208:576::12)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR10MB8513:EE_|PH0PR10MB4503:EE_
X-MS-Office365-Filtering-Correlation-Id: 1690c3b4-38b5-4b03-08b1-08de1281efe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzFKT3ZUcnBvTWdSaEltREZLeGpRRzAzNExNcFU0aTFxd1pjVFNwSjBlc2dH?=
 =?utf-8?B?ZVczb2lsdEpvd2U2UlZIcmF2S0RobzBNTDVFWE82b2hVM0N3Wk9DSWdscUs0?=
 =?utf-8?B?NXl0Nm5mOVd2TG1McW56d2dTWEJqVE9GeTZiWFpwd2s3Skgzd0daRjJKb2RT?=
 =?utf-8?B?YWJ3cFdNTVBVL1V5N1hGWHpUTWxZd0dmQjFNQURzWEM0c2cwN3JmQk9lNzZH?=
 =?utf-8?B?VFdvV3dCZDVHeTBHRTgyV0lidlV0R0lYNlVHbHRNcHNOTytkTFBwdDJybE8v?=
 =?utf-8?B?MVJwRTA1dUVmNUFIUTVSRXlyWXFFV1VhekhlMmIyT3hSczNJTTBIQ1F4NWNr?=
 =?utf-8?B?ZUk4bW5PQ0FLNDUvOXIwYy85V25XaWZseVlWeGpOMDJvWS91dG1WbkdIYkRw?=
 =?utf-8?B?ZUZNUEhmUU1tT2kyQmVZaDYyYkJ6ajhTbDljdG5JQW53UU5USms5Z2FRcHNq?=
 =?utf-8?B?NnlMWkJTd05Xc1FybHlJdWthOEVUREhMMWNnQWFvTjdVaERUcVI0WXlhU210?=
 =?utf-8?B?V2R2UGIrakhWQ08ySk4wYjBXMG05WUhJUGhMTURwaVhGaXppN1pPTks3T2Rk?=
 =?utf-8?B?RVNMbWxWb2l4S1Q0QktPTU55ejI3bXVvWkFhUzF4SUxVWCsvdTg1QXQ5Z0xl?=
 =?utf-8?B?dUxGTGQ5cTVVYXUrQ1lkOFIyWXM1ZXRjb0ZxaFdLL05BRUtSeU1mNHBXUnlo?=
 =?utf-8?B?Qm1XOXRkV0d0a042bk5TRDJ2eFAxK2NYMWRXMm1wU1J1UEFqM0ExQmhmaFpT?=
 =?utf-8?B?WUdRYXhOa2pmQllEMzVsUzJIUDRKaGpTa0xhZ3BvVFc5eWRpWjNtdUpvWmF2?=
 =?utf-8?B?RTlKM1ROM3NJeTd3dkxYTElJZ1EvRVIxejUvd000UWFGd1lzbHlXT2o3YXJx?=
 =?utf-8?B?alozSkVKQUdxMFVaUXhMbFN5eElJeU9aMUdlQk03MVRTbVNBUW42RmNKODl5?=
 =?utf-8?B?MnFYVnJqQkk1U2liVEJGSGpQQjM1QkdhSmtrYnhxb0dGWmFpNDBoTHVzbER4?=
 =?utf-8?B?ZVFUWDRzdnllalV4NTc2RjEvT0VQMk9jQ1UweUZUcDFnVW9RTjc1K3dQaFYw?=
 =?utf-8?B?cmJOT2trZGcvM0JxdW1lRmpQcUNTVkVXanBod2svN0pIeXRaVVUxdkI1Ylc1?=
 =?utf-8?B?b21STGhQRys2SjZKNEJYZXlGUVk1RTlnSDVSckVISVBJd0VCQWhIRmVHT2ZN?=
 =?utf-8?B?WVdZdXQvVEVhY0VCNks5aXZZdUhmZDkrZWk1d3c5NFFucEp2UEFmekl0Szcy?=
 =?utf-8?B?RjR5Vnp6V1YzOE81OC9GbDY1bUE4bUZIN25kMWYvRjQ1eUxVUFg5dTA1bUR2?=
 =?utf-8?B?S2pid2NIYjVteEJ5dzRDekZVWWMxNDEzcU5SaG9xOFpMOG1DQTJIS3l6ajVr?=
 =?utf-8?B?ZU1ubTI0QU50YXpZWWpZdno2djFlcVg3VmJMMGpnU2VtYm1aZWpjajNzSzhN?=
 =?utf-8?B?dHFmdXRBMDh5SytaUVpLQVRJNTFzb1hWVTRxMnV2bkdRckNDb1djeHdQbytl?=
 =?utf-8?B?aUFBc3FWVGZJL0M5cE5OSW4wSCtaRWNiY0pUSnozUDd3dWI1MEQxMFBaMTQv?=
 =?utf-8?B?TmdwcWJEUHd6cFhtUUtESkpvbGpCRUNIY0RkM3ovV2JVNGJUN2VVbDlNcS96?=
 =?utf-8?B?S2VqZTExaktTbEJ3UHJLTW8xTVZ2LzM1SXFONnhpWksyOXNJUTh6dzdjTXlT?=
 =?utf-8?B?TUF5dlVHT3Y5N1NkUXp5VHlNRGlwbWlkd2Jwejd5M0FmRnVYSUpFb0NGT1k5?=
 =?utf-8?B?T0VMYW4zY3NmcmZBVlhuM2VwRmQ5YTV2WmZNT2pqVXBiZlJNTkNQTWwrajda?=
 =?utf-8?B?cUo5Wi9IVkhnZlp5bjZjQ3VzRmxBL2dTaFZLbjdIOTZHNGFWOUV2RW1xSVFz?=
 =?utf-8?B?dGdGREk4cnFIM3ZWVHY1UXI0Z1ZjbFR1ZlRRcHRBMkJZUVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR10MB8513.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCtqMG4vSktTak1hY3RxU2JORFFzZTRuUkd2di9uSXVoNXArZ2M0MTE2SlVS?=
 =?utf-8?B?YjhMUmdYdHBLUXV6NHRqTXRrN0xZYVQwcFdzbUJtbkVCMURoYlRFZnJDSk9h?=
 =?utf-8?B?aHVSUFFJQnlLd29lMThlcDNNc2VpZjlhYm40d1Z5bGZRUUZwTXNZd2R3c3pR?=
 =?utf-8?B?VExjcFVQQ3pOR1hmY2hYRHZCbnNwYks0VzdSMHA3dmNyUTlHN01xelBIZ0xz?=
 =?utf-8?B?QWt1OUR0emxDR0pPYnhPcjgxS090ek5VT1JSdVNyY0QreVBqalJTRE16V0dF?=
 =?utf-8?B?M3pMdU4xWk8rRkwvZElmeVZ1UVRNSVl1bDlYN3RnUkxPSXV5c2I4UnNiWXY2?=
 =?utf-8?B?S3VnS1EvbFhBWmxxZWpSMXhmSG5GdEFjMWdYM3dLcUR3S1NQc2gwZk5hWGJl?=
 =?utf-8?B?MDk4SjhmU3YrY1NNTlBwa0NtQ0xiQWk4amdKR3FLcHh5VFdKTWluU2U5blRp?=
 =?utf-8?B?ZTVzNUhBVEMwYjI2WU1mUEpvc2VQWmd5L3o0aElRTHNWOTdUenpBd0xTQTgx?=
 =?utf-8?B?RG1jYk84aktyQTVzNjIvSThrV015U3owLzhMNVRTYkR4SEphTWcydnVLekZI?=
 =?utf-8?B?ZXA2QWVCTWgrWnZoOTBxeW1YYktDekhjMXo0M3dzc2ZYVThkVnllZjVvaldT?=
 =?utf-8?B?Yk1XeW5tbjRKQ0hBb0hrRTNEZkpjSHUwZ1E2Q2l6dGxDUG1YWEZxdFJTZEVm?=
 =?utf-8?B?U2NGK3ZYREtSeVFrNXpsN2RINjJiT1dvSVRSSzh2ZEltS09ZdHoxa0htdzYz?=
 =?utf-8?B?QS9ENjZyK2MzRU1aaTgzNkZzQUk4anN2VDZNVnBrVXprNTZjcDUwN25xQXRQ?=
 =?utf-8?B?RHN3Yko4cC9QWkFDaURqMFRWMGF4cnkrb1RpSnhDZ1lwcGtJNFg2NFlwY2Vw?=
 =?utf-8?B?dy9Ka1hZQXQ2SmtVRzNpdkE1S2FVYzk1NVF6MHp2WjMwRmNxOHduV00vOEV0?=
 =?utf-8?B?SVZyUWpGZ3NxWjZPL3RzZm1YcjM5MGtBaFRvS3paV0QyQ2daUUhLSHFueHFj?=
 =?utf-8?B?SDN2ak5JT3pCVFVmZlB3UDllUGUxRmVrNHhUblhabWlBd0F5ZG0wS0FSTmJG?=
 =?utf-8?B?QXpGNVYramk1ejlhSC9vaHVxTStnNDFKN3ovd0FpY3d4dzZwcVp6ZEFrV3Z1?=
 =?utf-8?B?QXRraFN1eEVIeFVSbWZtMHRZdmJMQmVRY2RoTWl4b285YVAxaHc2VUFBVitI?=
 =?utf-8?B?M29ZUlJoWDloRXVVeVdIK1pXVXkwV29vWk4xSnFqS1dNTjRLTzFBeE1NVEtj?=
 =?utf-8?B?VjlZZ21NaVA5di9tSmFqMWtJdk1lRjZXMnMzeFQvNkh5OUtTcjJPU3h5czha?=
 =?utf-8?B?azQxZEViMWMvNWs1Q040T3dpaDNFTDN4NG02QzJIUUQwQVkwU3M5VGo5TG1Y?=
 =?utf-8?B?QTJYRGI1V2VXTTIvUDc4WlJjUkFMa0FzckFHZjlSejJNOEl5bGVGZzY5L0tT?=
 =?utf-8?B?WUNkcnlyMVdEOEZrcWlhSkd6a3d1T1FuYjVIcEN2QUovdC9vZmJrUUtGZWtF?=
 =?utf-8?B?dHRFMFc2cVhyK3lEWitWN0UyME9LL0ZQc1F4L1JpcHNkMCthczI0RWlrWkpY?=
 =?utf-8?B?YUZWNjVjaGJqVFd0eE9BdUUyQVlUQ3Ewa0xjd3FRWm93Yi96N2RRNWJUNEZL?=
 =?utf-8?B?N2pSckpRM1p1MXRqOWMwWXhGYlVPYTRkNzJVUGJoZmtHb2tQL1J5NmVySWFI?=
 =?utf-8?B?eWFrUWw1elFlR0IzanJOVktHcUhNMHQzMGREbnp2c2hWdkVFYnpxQkdKMnJJ?=
 =?utf-8?B?emY0VWNwNmpuUzduNndhRDIwampLMlNDeGNXbEcxNU4vQ0I1eGw1LzZMTVMx?=
 =?utf-8?B?ODAvUjRHcklXYnF4QmQyVmdnNHJnaHMxZjJ3STR2MGlBQVJrOS81emhhRnJi?=
 =?utf-8?B?RkJmMTRTL2FXNGRRK1hvZE1RKzJuODdQRGU2U1VtNGhaQWJ6WUdZSUIwdzBu?=
 =?utf-8?B?ZFJLdzRmbUdvRUFWb091TUplRFg0Z0F0OGpqVG01ekZic3RCSll4MGNhaVVi?=
 =?utf-8?B?WDlIeVNmcm1ZaE5qbGhuQ1R4VFRoNFlCNlhhU0ZNdTRDQ0N6VnZNc3QxTjZh?=
 =?utf-8?B?a0VVMFRJb09yQUhIcFRxQWl1ZGRFNjM1VEQ0UHNHaUlad3NiaHUvc3ZOMjBP?=
 =?utf-8?B?UGNKRkNibTE0T3I4dHVmVDRFUmF5dlJDTzQrSDVFY1U2M2JucWwwVHpFNk1Q?=
 =?utf-8?Q?xQ6JxdG2TeUwRT05gWRH/QQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kCyY4B8b/ro8IWPdvpfWDoyoYFcKcjoGQcEklx8NpV1B8QFLDZTV0dkOwyclLirty5bZ1pXng+SiFnIhXwJYMb/yjylap8LwvidOVJji93ZOKo8JkBJTLdzApgH2+HIVNcx6Q9MBwKNqEgNckfPsI1yGs1K9ELgi3pYnEuOImo24NyF4oak7kAMIH7rgMPTZfd+DbVmhfeBJSL2MZ99nQr61SREXBnvC/1bW2iTVpnVfk+FLlggucGZZMxXlvMIsAvo/jo8OPvt0hL2zdtOJpL2M+bfwWSl3dVRx0fqlVbBG9AY38DVz9DYGQMVdlZmnUbygIfoYXscZvHl5AUEqef3UfAN174Mrjp9+/DOIyntpQzDDBpzlQ5d3yfniVb6cKgmon/Imu7Slb2h/Sy/eNRu3G62WjKq95dqf1+9BOk0UrPJTZn3SMqS5XDIcIhfimk/N7ch0zTjM86T8S+8CVqIXDpbD1Rqn6vP/BLoFSP6AMjdpPfAibNzaWSpIKo4XSMkNUL7/fsWDnBBWXN36XgL4uwXx6mrLnErmHQg6RN3fTyfuVW/sy3HGU3TkyvmAtc8nTPsQifUzvLAENCvu9IUiOUtYcGv3mO34h9XhhPY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1690c3b4-38b5-4b03-08b1-08de1281efe9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR10MB8513.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 22:17:22.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0xITJeyeE0RV8deUqpiHaLOIwgGNAf3d7uvW05JEYBGLYrzXRiu+xwHkb2cA0JyoI0Ob8QXCyR6B96SU/is+ca1JyD1wexTX9KZtcK/9qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4503
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230203
X-Proofpoint-ORIG-GUID: qAWJHu8J5t7OUVTy_a42UErQyPRcbVOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXwH0VoVOZFLdt
 FuzXPh6g8tRIwmnuPY537doQTYmp9gYdL1PUNQpAbR0sEa8LH7PhjuSx1IcHY2ghPOPiXYprQ2I
 BamQo+cULb1Bu5wTc68XBUVCqrzIpFB2BuUtaMv0KqyqSrfbyzjqLuHi3kQ4QIAwt5iIYSe5/4Z
 STzzL5QLvmiYvZatRJfvJXPb4ZIpLTQrRT7tGz56/CAWiqnj8ZUwRfAlDFSGG26/SAhJrwH4Dq+
 nse9ea2yIWLI4t9zgWN9E1oDQGmhRS/cTxOBfQtPpa6w4UzDn+nTCsp4VfG4Kb96A7PhsVn+MvN
 rvGDPcPz9ir2zKyfWLMYzDMZ1iwCymPl9s3Kgbe0xUp1GnhAfQvIFrQ/ZyPiDaPMMciYQWtPhOU
 guAz3f16V0viDHjLuufEsVGWilrHaA==
X-Proofpoint-GUID: qAWJHu8J5t7OUVTy_a42UErQyPRcbVOg
X-Authority-Analysis: v=2.4 cv=D9RK6/Rj c=1 sm=1 tr=0 ts=68faa975 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=yPCof4ZbAAAA:8 a=BuYHuF0cmjX55xcjmxsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aViEl8YYgB_fEZN5ws7z:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22

Signed-off-by: Bruce McCulloch <bruce.mcculloch@oracle.com>
---
 llm/README.md                | 130 ++++++++
 llm/llms-dtrace-complete.txt |   2 +
 llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
 3 files changed, 743 insertions(+)
 create mode 100644 llm/README.md
 create mode 100644 llm/llms-dtrace-short.txt

diff --git a/llm/README.md b/llm/README.md
new file mode 100644
index 00000000..3de350de
--- /dev/null
+++ b/llm/README.md
@@ -0,0 +1,130 @@
+# DTrace LLM Context Files
+
+## Overview
+These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.  
+They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
+
+The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
+
+> The context files describe probe syntax, predicates, statements, variables, built-ins, functions, and safe tracing idioms for core providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, etc.).
+
+---
+
+## Files
+| File | Description |
+|------|--------------|
+| `llms-dtrace-short.txt` | [Compact reference](llms-dtrace-short.txt) used to bootstrap LLMs for DTrace knowledge. |
+| `llms-dtrace-complete.txt` | [Full expanded reference](llms-dtrace-complete.ext). |
+
+---
+
+## How to Use
+
+1. **Install DTrace**
+
+   ```bash
+   sudo dnf install dtrace
+
+```
+
+Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
+
+```bash
+which dtrace
+sudo /usr/sbin/dtrace -V
+
+```
+
+2.  **Load the context file into your LLM session**
+    
+    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
+        
+    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
+        
+3.  **Start asking questions in natural language**
+    
+    You can now prompt the model to produce valid D scripts:
+    
+    ```
+    write a dtrace script that shows all read() syscalls made while the script is running
+    
+    ```
+    
+    or
+    
+    ```
+    count how many processes start on the system within 5 seconds
+    
+    ```
+    
+4.  **Run the generated script**
+    
+    Save the model’s output (e.g. `trace.d`), then execute:
+    
+    ```bash
+    sudo dtrace -s trace.d
+    
+    ```
+    
+
+----------
+
+## Example Prompts
+
+Here are a few good starting points:
+
+>“Write a DTrace script that prints the PID of every process that accesses memory.”
+
+Teaches process-level tracing and probe filters.
+
+>“Provide a DTrace script to count how many processes are started over 5 seconds.”
+
+Demonstrates use of timed aggregations.
+
+>“Show all `read()` syscalls and count how many occur per process.”
+
+Basic syscall entry/return tracing.
+
+>“Track which executables call `open()` and print errors.”
+
+Uses speculation and error guards.
+
+----------
+
+## Safety and Trust
+
+DTrace runs in **nondestructive mode by default**.  
+Even if an LLM suggests unsafe actions, the runtime will prevent writes, signals, or other destructive operations unless explicitly enabled with `-w`.
+
+This makes LLM-generated scripts safe to test and explore on production or staging systems — they can observe but not modify the kernel state.
+
+----------
+
+## Notes and Troubleshooting
+
+-   If you see:
+    
+    ```
+    dtrace: could not enable tracing: Destructive actions not allowed
+    
+    ```
+    
+    either remove `system()` calls or rerun with `sudo dtrace -w -s script.d`.
+    
+-   If `dtrace` behaves unexpectedly, ensure you are not invoking a SystemTap binary:
+    
+    ```bash
+    sudo /usr/sbin/dtrace
+    
+    ```
+    
+
+----------
+
+## Additional Resources
+
+-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
+    
+-   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
+    
+-   [Oracle Linux Blog: Natural Language System Tracing with Dtrace and LLMs](https://blogs.oracle.com/linux/post/dtrace-and-llms)
diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
index 2264fc40..8a4a535c 100644
--- a/llm/llms-dtrace-complete.txt
+++ b/llm/llms-dtrace-complete.txt
@@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise in writing DTrace programs
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
+DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
+
 Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
 
 After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
new file mode 100644
index 00000000..a514abbf
--- /dev/null
+++ b/llm/llms-dtrace-short.txt
@@ -0,0 +1,611 @@
+You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+
+You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
+
+DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
+
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
+
+## GOAL
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+
+## PROGRAM STRUCTURE
+A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
+Syntax skeleton:
+```
+probe descriptions
+/ optional predicate /
+{
+    statements
+}
+```
+- Multiple clauses allowed; run in program order.
+- Empty `{}` triggers the default action (trace EPID).
+- Scripts may be invoked via `dtrace` (shebang/interpreter line).
+- Scripts can include pragma options.
+
+## PROBE DESCRIPTIONS
+Canonical form: `provider:module:function:name`
+Fields:
+- provider — DTrace provider name
+- module — kernel object / library / program, if location-specific
+- function — program function, if location-specific
+- name — semantic probe name (e.g., BEGIN, END)
+
+Shorthand precedence when fields are omitted:
+- name
+- function:name
+- module:function:name
+
+Avoid numeric probe IDs (unstable).  
+Wildcards & patterns supported (shell-style globbing). Empty fields match any value.
+
+### Pattern tokens
+- `*` — any string (incl. empty)
+- `?` — any single character
+- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
+- `\` — escape next char
+- Empty field ⇒ wildcard match
+- All four fields must match (with patterns) for a probe to enable
+
+### Multiple Probes
+Several probes can be listed, comma-separated; same predicate and statements apply.
+
+### Examples
+- All syscall entries: `syscall:::entry`
+- BEGIN without module/function: `dtrace:::BEGIN`
+- List available probes: `dtrace -l`
+
+## PREDICATES
+- Optional boolean expression between slashes: `/ expr /`
+- Evaluated at probe fire to decide whether to execute statements
+- Any D expression of integer/pointer type; nonzero ⇒ true
+- Can reference variables, built-ins, and operators
+
+Examples:
+- Match only "date" process: `/execname == "date"/`
+- Targeted PID: `/pid == $target/`
+
+## STATEMENTS (CLAUSES)
+- Semicolon-separated expressions/functions inside `{ ... }`
+- Default action when `{}` empty: report probe activation (EPID)
+- Clauses can use aggregations, variables, built-ins, and functions
+
+### Minimal idioms
+Count events by function:
+```
+syscall:::entry
+{
+    @counts[probefunc] = count();
+}
+```
+
+Predicate filter by execname:
+```
+syscall:::entry
+/execname == "date"/
+{
+    @reads[probefunc] = count();
+}
+```
+
+## NOTES & STABILITY
+- Probe IDs are not stable; prefer full descriptions
+- Providers, modules, functions, names may have differing stability attributes
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 2: TYPES, OPERATORS, EXPRESSIONS
+
+## IDENTIFIERS & KEYWORDS
+- Identifiers: letters, digits, underscore; must start with letter/_
+- Reserved keywords (subset relevant to D):  
+  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
+- Avoid names starting with `_` (reserved for system)
+
+## DATA TYPES
+### Integer Types
+- char (1 byte), short (2), int (4), long (8), long long (8)
+- signed by default; add `unsigned` qualifier for unsigned
+
+### Integer Aliases
+- int8_t, int16_t, int32_t, int64_t
+- uint8_t, uint16_t, uint32_t, uint64_t
+- intptr_t, uintptr_t
+
+### Floating Point
+- float (4 bytes), double (8), long double (16)
+- Floating-point arithmetic not permitted; can trace/printf values
+
+### Strings
+- `string` type represents ASCII strings
+- Special handling for tracing, comparison, functions
+
+### Pointers
+- Declared as `type *`
+- Example: `int *p;`
+- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
+
+### Structs & Unions
+- ANSI C-like definition
+- Access via `.` and `->`
+
+### Arrays
+- Scalar arrays: fixed-length `[n]`
+- Associative arrays: `name[key]`
+- Multidimensional arrays supported
+
+### Enumerations
+- `enum colors { RED, GREEN, BLUE }`
+- Values assigned sequentially unless overridden
+
+### Typedef
+- `typedef existing-type alias;`
+
+### Inlines
+- Named constants: `inline type name = expression;`
+
+### Namespaces
+- Backtick (`) to access kernel/module types: `struct vmlinux\`task_struct`
+
+## CONSTANTS
+- Integer: decimal (123), octal (012), hex (0x123)
+- Floating: decimal with dot or exponent
+- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
+- String: `"hello"`, stored as null-terminated
+
+## OPERATORS
+
+### Arithmetic
+- `+` add, `-` sub, `*` mul, `/` div, `%` mod
+- Integer and pointer arithmetic only
+- Division by zero ⇒ ERROR probe
+
+### Relational
+- `<`, `<=`, `>`, `>=`, `==`, `!=`
+- Applied to int, ptr, string
+- Strings compare lexically
+
+### Logical
+- `&&` AND, `||` OR, `^^` XOR, `!` NOT
+- Short-circuit for `&&` and `||`
+
+### Bitwise
+- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
+
+### Assignment
+- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
+
+### Increment / Decrement
+- `++`, `--` (prefix/postfix)
+- Works on int and ptr types
+
+### Conditional
+- Ternary `?:` operator
+- Example: `x = i == 0 ? "zero" : "nonzero";`
+
+### Type Conversion
+- Implicit: usual arithmetic conversions (C-like)
+- Explicit cast: `(int)x`
+
+## OPERATOR PRECEDENCE (highest → lowest)
+- `() [] -> .`
+- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
+- `* / %`
+- `+ -`
+- `<< >>`
+- `< <= > >=`
+- `== !=`
+- `&`
+- `^`
+- `|`
+- `&&`
+- `^^`
+- `||`
+- `?:`
+- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
+- `,` (evaluate left→right, return rightmost)
+
+### Misc Operators
+- `sizeof(expr)` — size in bytes
+- `offsetof(type, member)` — offset of struct member
+- `stringof(expr)` — convert to string
+- `xlate(expr)` — translate type
+- Unary `&` — address of object
+- Unary `*` — dereference pointer
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 3: VARIABLES
+
+## VARIABLE CLASSES
+- Scalar variables: single data objects (int, ptr, string, struct, etc.)
+- Associative arrays: dynamic, keyed collections
+- Scalar arrays: fixed-length, indexed by int
+- Multidimensional arrays: ANSI C-compatible, rarely used
+- Variables created implicitly on first assignment
+
+## VARIABLE SCOPE
+- Global: `varname`  
+- Thread-local: `self->varname`  
+- Clause-local: `this->varname`  
+- External (kernel symbols): `` `symbol ``
+
+### Table: Scope summary
+- Global: shared by all threads, not MP-safe
+- Thread-local: per-thread storage, MP-safe
+- Clause-local: per-probe-firing storage, MP-safe
+- External: access kernel variables, read-only
+
+## GLOBAL VARIABLES
+- Declared implicitly on assignment or explicitly outside clauses
+- Examples:
+```
+x = 123;            /* int */
+s = "hello";        /* string */
+a[123, 'a'] = 456;  /* associative array */
+```
+- Explicit declaration (no init value allowed):
+```
+int x;
+int arr[unsigned long long, char];
+```
+
+Initialization can be done in `BEGIN` clause.
+
+## THREAD-LOCAL VARIABLES
+- Scoped to each OS thread
+- Syntax: `self->name`
+- Examples:
+```
+syscall::read:entry
+{
+    self->read = 1;
+}
+```
+- Created implicitly; type = RHS of first assignment
+- Can also declare explicitly: `self int x;`
+
+## CLAUSE-LOCAL VARIABLES
+- Scoped to single probe firing, persist across clauses for same probe
+- Syntax: `this->name`
+- Example:
+```
+BEGIN
+{
+    this->secs = timestamp / 1000000000;
+}
+```
+- Explicit declaration: `this int x;`
+- Faster than associative arrays, use for temporary calculations
+
+## EXTERNAL VARIABLES
+- Access OS/kernel variables and symbols
+- Syntax: `` module`symbol ``
+- Examples:
+``
+trace(`max_pfn);
+trace(&`max_pfn);
+``
+- Names kept in separate namespace from D identifiers
+- Read-only for safety
+
+## ARRAYS
+### Associative Arrays
+- Dynamic, unlimited elements
+- Syntax: `name[key] = value;`
+- Key can be any type (int, string, tuple)
+- Delete element: assign 0 → `arr[key] = 0;`
+
+### Scalar Arrays
+- Fixed length, declared with `[n]`
+- Example: `int arr[5];`
+- Bounds checked at compile-time
+
+### Multidimensional Scalar Arrays
+- ANSI C-compatible: `int m[12][34];`
+- Access: `m[0][1]`
+
+Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple key)
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
+
+## BUILT-IN VARIABLES
+Automatically available within all D programs.
+
+### Process & Thread
+- `pid` — process ID
+- `ppid` — parent process ID
+- `tid` — thread ID
+- `execname` — current process name
+
+### Probe Metadata
+- `probeprov` — provider
+- `probemod` — module
+- `probefunc` — function
+- `probename` — name
+
+### Time
+- `timestamp` — nanosecond, monotonic
+- `vtimestamp` — per-thread virtualized timestamp
+
+### Call Stack & Location
+- `caller` — kernel PC of calling function
+- `ucaller` — user-level PC of calling function
+
+### Syscall & Error
+- `errno` — last thread error number
+
+### Arguments
+- `arg0` … `arg9` — probe arguments (64-bit)
+- `args[]` — typed argument array
+
+## MACRO VARIABLES
+Expanded at compile time, not runtime.
+
+### Process & User Info
+- `$pid`, `$ppid` — current / parent process ID
+- `$uid`, `$gid` — user / group ID
+- `$target` — target process specified via `-p` option
+- `$1`, `$2`, … — script arguments
+
+### Notes
+- Macro variables allow parameterization of scripts
+- Expansion occurs at compile-time, before execution
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 5: FUNCTIONS
+
+## DATA RECORDING FUNCTIONS
+- `trace(expr)` — store expr in trace buffer
+- `printf(fmt, ...)` — formatted print
+- `printa(fmt, @aggr)` — print aggregation(s)
+- `exit(code)` — terminate tracing, run END
+
+## AGGREGATION FUNCTIONS
+- `count()` — number of probe firings
+- `sum(x)` — sum of values
+- `avg(x)` — average of values
+- `min(x)` — minimum
+- `max(x)` — maximum
+- `stddev(x)` — standard deviation
+- `quantize(x)` — power-of-two histogram
+- `lquantize(x, from, to, step)` — linear histogram
+- `llquantize(x, factor, low, high)` — log-linear histogram
+
+## SPECULATION FUNCTIONS
+- `speculation()` — allocate speculative buffer, return ID
+- `speculate(ID)` — record subsequent actions to speculation buffer
+- `commit(ID)` — commit speculative buffer to main trace
+- `discard(ID)` — discard speculative buffer
+
+## MEMORY COPYING FUNCTIONS
+- `copyin(addr, size)` — copy from user space
+- `copyinstr(addr[, size])` — copy NUL-terminated string from user
+- `copyinto(addr, size, dest)` — copy into DTrace memory
+- `copyout(src, addr, size)` — write to user space (destructive)
+- `copyoutstr(str, addr, size)` — write string to user (destructive)
+
+## STRING FUNCTIONS
+- `strlen(s)` — string length
+- `strjoin(a, b)` — concatenate
+- `substr(s, i[, len])` — substring
+- `index(str, sub[, start])` — first occurrence of sub
+- `rindex(str, sub[, start])` — last occurrence of sub
+- `strchr(str, c)` — first char occurrence
+- `strrchr(str, c)` — last char occurrence
+- `strstr(str, sub)` — substring search
+- `strtok(str, delim)` — tokenize
+
+## STACK & EXECUTION FUNCTIONS
+- `stack([nframes])` — kernel stack trace
+- `ustack([nframes, strsize])` — user stack trace
+- `system(cmd)` — execute shell command (destructive)
+- `raise(sig)` — send signal to process (destructive)
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 6: PROVIDERS & COMMON PROBES
+
+## PROVIDERS OVERVIEW
+Providers group related probes. Each probe is identified by `provider:module:function:name`.
+
+### Core Providers
+- `dtrace`  
+  - BEGIN — fires at start of tracing
+  - END — fires at end of tracing
+  - ERROR — fires on D program error
+
+- `syscall`  
+  - Entry/return of all system calls
+  - Examples: `syscall::open:entry`, `syscall::write:return`
+
+- `proc`  
+  - Process lifecycle events
+  - create, exec, exit, signal
+
+- `sched`  
+  - Scheduler events
+  - on-cpu, off-cpu, enqueue, dequeue, wakeup
+
+- `io`  
+  - Device I/O events
+  - start, done
+
+- `profile`  
+  - Time-based sampling
+  - `profile-N` — kernel stack sample every N Hz
+  - `tick-N` — fires every N seconds
+
+- `lockstat`  
+  - Kernel lock contention statistics
+  - spin, adaptive, rw lock events
+
+- `fbt` (function boundary tracing)  
+  - Kernel function entry/return probes
+  - Powerful but potentially unsafe (debug/dev only)
+
+- `pid`  
+  - User-level function boundary tracing for a process
+
+- `usdt` (user-level statically defined tracing)  
+  - Static tracepoints in user programs
+
+- `cpc`  
+  - CPU performance counter probes
+
+## EXAMPLE USES
+
+### System Calls
+```
+syscall:::entry
+{
+    @calls[execname] = count();
+}
+```
+
+### Process Creation
+```
+proc:::exec-success
+{
+    printf("%s exec %s", execname, copyinstr(arg0));
+}
+```
+
+### Scheduler Events
+```
+sched:::on-cpu
+{
+    @oncpu[execname] = count();
+}
+```
+
+### Profile Sampling
+```
+profile-1000
+{
+    @[ustack()] = count();
+}
+```
+
+### I/O Operations
+```
+io:::start
+{
+    @io[execname] = count();
+}
+```
+
+DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
+PART 7: COMMON PATTERNS
+
+## COUNT SYSCALLS BY PROCESS
+```
+syscall:::entry
+/execname != ""/
+{
+    @syscalls[execname] = count();
+}
+END
+{
+    printa(@syscalls);
+}
+```
+
+## TIME A SPECIFIC SYSCALL
+```
+syscall::write:entry
+{
+    self->ts = timestamp;
+}
+syscall::write:return
+/self->ts/
+{
+    @delta[execname] = quantize(timestamp - self->ts);
+    self->ts = 0;
+}
+```
+
+## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
+```
+syscall::open:entry
+{
+    self->spec = speculation();
+    speculate(self->spec);
+    printf("open: %s", copyinstr(arg0));
+}
+syscall::open:return/self->spec/
+{
+    speculate(self->spec);
+    trace(errno);
+}
+syscall::open:return/self->spec && errno != 0/
+{
+    commit(self->spec);
+    self->spec = 0;
+}
+syscall::open:return/self->spec && errno == 0/
+{
+    discard(self->spec);
+    self->spec = 0;
+}
+```
+
+## PROFILE USER STACKS (SAMPLING)
+```
+profile-1000
+{
+    @[ustack()] = count();
+}
+```
+
+## TRACK PROCESS EXECUTIONS
+```
+proc:::exec-success
+{
+    printf("%s -> %s", execname, copyinstr(arg0));
+}
+```
+
+## COUNT SCHEDULER ON-CPU EVENTS
+```
+sched:::on-cpu
+{
+    @oncpu[execname] = count();
+}
+```
+
+## I/O ACTIVITY BY PROCESS
+```
+io:::start
+{
+    @io[execname] = count();
+}
+```
+
+## TRACK ERRORS
+```
+ERROR
+{
+    printf("DTrace error: %s", probename);
+}
+```
+
+## TRACE ARGUMENTS OF FUNCTION
+```
+syscall::open:entry
+{
+    printf("open(%s)", copyinstr(arg0));
+}
+```
+
+## LIMIT TRACE TO TARGET PID
+```
+syscall:::entry
+/pid == $target/
+{
+    @syscalls[probefunc] = count();
+}
+```
-- 
2.47.3

