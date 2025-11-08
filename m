Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB2F23AB9D
	for <dtrace@lists.linux.dev>; Sat,  8 Nov 2025 00:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762563040; cv=fail; b=KKHoonTDDFNcz1duMYh0LrsbRCts6/f18nR3/ZNrCDpY79cdn0o8j30+eCl8gxO2POhvR+NTwhEuA65tfLU4n6ZtLqn0SZiThNct1CUwwXmvAOUI3s74DKxXTB/x1TEBoSSA8mQPGuHiNcTSgVR2UiaRccaElivyB/4k2BNkL4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762563040; c=relaxed/simple;
	bh=T0/2pPpvLWGhRD0UZbWJC9t83z/+NLyql9s4dAkha4Q=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=pwg0cBZ6JFbDmgMK/K9qcKBmB0yjX8d9LPcTUAPbjSoF63az2caq8Kc4W7TZyI7ZB7hkbnuwAeVmLdcuihw1OE/BLAI2V5QkTwcfN2yPwCH9ABnodwo/dBDF+i48/UFEK2YB1dD0OCnMtozmQ518z9Oq44HbNq/TdvnTr6wewsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jEKhLLXW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eyGx39J+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jEKhLLXW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eyGx39J+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A80Ytr9022357
	for <dtrace@lists.linux.dev>; Sat, 8 Nov 2025 00:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=TaiGb58d0AmzVZ1G
	Qnce87xotmmNXOgePRgkx9xYSNA=; b=jEKhLLXW9yjnZp7x9FmzBP75WTLFaMvy
	wUyp4+MJPCbXLt6++SkCoTD7KXSRm7NAl6KIOvbVEhOl4Ttz4Z+qpC1kbr5i18Oj
	hJ95zw4sHzMV5y61fzlaAz1fUpaSHLdhQjLzoMlsh/axCRjgV1VzeufOW+1JPMHQ
	HGFGYTDd3FFhbGGoYL2lLpAe4yu7XqeYorxr7Jju2XLXshAztiLtJJ/QQS/R+w2o
	7/FOBf2TSVqXpcokzufjTZPX7RPzPIVjqklwbTrtMdFhONy67VaQw4Av0wER0wTb
	wKzPFzkCb9Pih5YQb9DIXhdBP0/sZz9H+mqIg0f9CfjdCw3SwSaxcA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a9u7g00xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Nov 2025 00:50:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7Nlu4x014931
	for <dtrace@lists.linux.dev>; Sat, 8 Nov 2025 00:50:36 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a58ne7gn9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Nov 2025 00:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMMAQdT3onF+9z8pubCTkYcpX87egK/xojEGx5k2Eci/s0K4vDZ9Sqf4Ov1UBQ9ZI77VYGxU9jyoJjI/7iClNGAkYFGt73UfMnV5XGA/60Aqd3wNDNt1RvcOtP0gSg9UkSw4HO8aTngOLGB3Z24+HCn0RDla+z6aZh+5fsJq+aCjdXfseSazHYu6IPul4KwBDb8TvSRyss75R6BeIvzX0FAYF2pm3XeFOEVrqn19opkjQgZzvJvlwjb8jHr00ui6KuMSK4epES3EcirhLGPU65TtamxEnzYkTapTzFmiFPVEj2iSZhv1Su/dANVlLcBChXfva615tIwsKWnOuTCXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaiGb58d0AmzVZ1GQnce87xotmmNXOgePRgkx9xYSNA=;
 b=Zy/PRKu+77m7pSdQYoigbRHVoV362wnmuUTtbOTV/DQ231WIAsM30cPKJByrX3koM6Rh8CQNWY7enyFVYsfXb+/y2X6ptLtAkmSHLZLU2cw90qTOZBdaGY3Urv/6RsrlUJ5V7fzFd4IeREgffuNdAk78O53fVyIuPC1OlkTzjjV1ODcSIpskpzyxfw60+ad6CWdJsF7KV3MWM9GlGgzzjLi4UcWrOLE4/Y6p/bGEpJzqIBLq4tKZHfJO9fW5H4tQrMcYuBrsqwXtnXOj7TE1BM4kKDTw7nKOBkh5D5h9tjbNJdwCJYcSU3EHgpdFYpAEmCwGErbAHVeklx2D5RxLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaiGb58d0AmzVZ1GQnce87xotmmNXOgePRgkx9xYSNA=;
 b=eyGx39J+48DI+QRpeKWCZ/ELTwUUoBB4JxPk//kdUvO1ogC8ewOSLRByoZyWbuzmL6DtD515S1l6hUg01jX0qK1eM5FO0xdJsoDHuydNJdngWldKkFWVdG7gM8bv4O/kjIzRUeVF20ps15e0LUHwctruW4W+okYvewiybHcambU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4274.namprd10.prod.outlook.com (2603:10b6:a03:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 00:50:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 00:50:34 +0000
Message-ID: <12f29051-8504-4955-f248-d08cfb63a182@oracle.com>
Date: Fri, 7 Nov 2025 19:50:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
From: Eugene Loh <eugene.loh@oracle.com>
Subject: [RELEASE] DTrace 2.0.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0172.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cee84e6-531d-4a69-a772-08de1e60d315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WENUUVdtZE53ZFNyVzZybXE0TzFRMHp0N3piT2hVeTVTL3NoaXVxMk90S0Ur?=
 =?utf-8?B?WVlWY0YrTUp1KzMrellsUTRMTnBGd2FwUUdXc3gwaXV6d1Q2ME8rRlJrSUU4?=
 =?utf-8?B?NFAwVTN4bVJnNWhQSlFqWTFSdjVKTWMzblBqbUgyOEZHMlRQY3FiVVNaY2xq?=
 =?utf-8?B?Q3czRUlyVmdwZVp2bFliSEhYb3lXcTBFMUNSOVl4RWV3QkRVbEVkaDREV1Nu?=
 =?utf-8?B?VlNrd0syd2VGYytXVUZ3c3B1a2JBZjdHZUE2cU1LeWhqandVMjI3QmJtc3RG?=
 =?utf-8?B?ajkra0p5bkIzOTFuUzdLWDQvWUVtcXVlZDNZQm5PWThHMEp5VXZuaTZueW94?=
 =?utf-8?B?TmNrYzZ6ZURWdXg0UWlpOFJHZzNHTlUybGRVNXVUYTg2SmUvY1ZiUTc1U09X?=
 =?utf-8?B?bFh5dStyVk5SUW5vd1BpVzlneVNSeFRnWkFzVm5OWUIvNEN6ZXBDaTBsamFH?=
 =?utf-8?B?WTNlbDJyOHp6bzMxcnJUL2FEMWJMdjd4cGhTbHZIVzdMeGIxNEdaNzdtQlhI?=
 =?utf-8?B?cVhmQUlQQytKa1VFL00zMFNhZXltQXQ4azFzRzE0WEJxckFaSGM1QW85N2RP?=
 =?utf-8?B?RnJSa01TWkNxWmJkbFMzbWpGbWxqenFiVmh6ZjlDSExqY0xqV2lrVTZYQ05Y?=
 =?utf-8?B?MlQ4bkw2VUg4N2xVcEQwN2E3dENxclVIRVA5RnVyUEQveFpPM0R2bHFYSUd6?=
 =?utf-8?B?NHFxVjlva0lSVWhKT1IvZEtuOHJNWnFQa09LWUhiSjRvKzAyWUNteVV4cTQr?=
 =?utf-8?B?T1EvRHVZbkFISi94ejVTR0dMOWpZN3liN3JMN2NDRFhrVUNXU3VwQTVhUzNO?=
 =?utf-8?B?WENvMFZlRyswUE5pQzBSZm5YZnhIUTNNOWh6OW16ZWtmQVpkcTZTOTJ0SzIy?=
 =?utf-8?B?eko4VW5oSmsyS3pib2h3TC9Va3lYV1ZXREVTWjNsMExrWjdaaklqUTcwSEY4?=
 =?utf-8?B?eEoyT1Q4NGpEQ2NOMU5HYnZQYnh2S1lUV2hCcXRvcm43bE9TNzB1TUMwMDU5?=
 =?utf-8?B?Um1iaThJS1VBL2toRXB2amtxcm5zd01BR05MbGlqS2pYQ3hWNkJKdmd0dG8z?=
 =?utf-8?B?Ti9oVTI3b2htdENBNE40Mzk2L0RBbEFlK2ltOUVNT0Nkc2NGaFZIbVM2RWVl?=
 =?utf-8?B?UjN0MS91TzdGOGJNY2twSkxSQUJack5KaGhYRXNZV1pBdmRnQjllSHhXbEFj?=
 =?utf-8?B?MWVuTmdWMm1lRiszZXhJN3VLYzNSd0M5MkhZd0hVSkhjb0FjVFpUZnhzWSts?=
 =?utf-8?B?VzN4RVk4c0M4bVV1UllJRDUxcHdJU2h0UHZqazFiMEMyZTNTL0NwKzhRd2cy?=
 =?utf-8?B?TTIxbGo0dXFFOVM2Vm9Rd2wxQmlsQmJmZjhiU1p5cGRvVTgvSWdyM3VleDV1?=
 =?utf-8?B?Qmgvb3ZJbWF4QWJjYjJpdnhhNDdMbVdPYjdBMG8wZFZmK1dDZjlOZ05nM0c0?=
 =?utf-8?B?ZlNLNXJGV2FYSFBCcldrMW5IdjEzaGpPSlpEamtad1hyVXU3OFFSV2gyRmdE?=
 =?utf-8?B?TjlHenNoRzdaNnVjMk5xWS8rVUoxd0lyOVNHeDlQb0JmM3VzS0Zydnc0Qis2?=
 =?utf-8?B?ZDlHRUdKamtTSnlvUHdaNjJCSUJPUjdQTlo1cUI4MDRIMUs2SXhNeUVVOG02?=
 =?utf-8?B?ZzVUM093WmJjNDlKVDMyVlp1MmdyeWZtV2h5UGIycHI2aC9QYzl2THZHeFpB?=
 =?utf-8?B?VWhhWDJ4WldPQmlOY0dueXRZejNORXM1dzlmd2k3WU5QbzhRNGUvcXJnc3Zs?=
 =?utf-8?B?RkMrYWhlT29LUkw5b1NFOTVxYmkwSkgzcUgwSTdGb1FENHJZNWhHdnFJQm9Q?=
 =?utf-8?B?VE5GdGdWNjNHL2ZVN21xcENpcHJ2UkhDamtYVUdjWHBOdGRaNDFraVdGd2RN?=
 =?utf-8?B?SkdqRjJiU1Rwa2EwS0FkdmU4NURXb1FGMlhMRkdseDdGS21kbXZLUXEyK051?=
 =?utf-8?B?dXppbkh3UWVFbS9IdElTeE9vRjJEcFc0OE5hN2dGbTJKaUppYVNFd3hyLzBn?=
 =?utf-8?B?ZFh0NnhiU0RBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTgrdGdHRGxqdG5BalRtbTBpUy9wTGE5K0pFVzdBTHRaSnkyUWxHWUgyQ0VG?=
 =?utf-8?B?MkpERnRCaGRzOTRQTHJuaWtGNVAxTGo5MnoyTldZcm1kUmsvc0FhT2JteVZw?=
 =?utf-8?B?RWdKYm1ZcEd5T0loUHJFZ1Y1U2ViZlA1VUQ5S1dDQk5NOVI3aWVYN0I3N1R0?=
 =?utf-8?B?cTVRUDlJdGVxL0JsMU5LaXI1V0laRFhjem5iY0grVk9SanJya2dhcFI3aXA4?=
 =?utf-8?B?TEhxTDU3THM1WGJ5QW9HT0dFVnBKZXRHbHBtZmN6Tmc0azN3VVp6NEM3MzFu?=
 =?utf-8?B?Sy9JcURtOGRjNkNVbTlwVFh2dzcvZ004dXU5Y2U2VldoR0pId0NpK3JQaTdx?=
 =?utf-8?B?dkFtdW1SZUhYQUhJb2JtMXJUTnRicmF0cXltMW1mb0Q1V3BFZWVHVmlhcmFI?=
 =?utf-8?B?ZSs1dkRBczFYd0tlL3ViRncxTWhTL0lCQmllOWx0VVJyemJNeEJBNjZxUG5M?=
 =?utf-8?B?aDA4aFNxdk1BTTdLR0x6M0c0eUxUOWlDL0JIOWIvTU84ekg4OXNXM1M4bmsx?=
 =?utf-8?B?V0hsTzVNWDU3NEJRdU5rS2lxRXpHazhDZDh3Y1M4UyttdmNWL1MyN1FnbFlh?=
 =?utf-8?B?MUpxSDRXMDlMSlhqWFpZQ3kzQlZHQVIya3FlMUFzTkt2SGx4dks5elcrQjMx?=
 =?utf-8?B?ZXFRcjB6ejJBS09xenhCQ1FxRmVDOEZlZXlOczJGTFJHbDFjeWxnditIYXA1?=
 =?utf-8?B?ZGtvVnB0dXlHaCtpMW5hZWJHeko2SGVNaG9qMkVTVFNhWE5WZUtOKzBjVWxS?=
 =?utf-8?B?dEtoUTZiOXJmNEFKQmRJa29UdDNTNEpsZUl4aUFVeCs3cWg1bWNSanhBaEsz?=
 =?utf-8?B?LzdwcGNaODVqY1hJbXVUQ3lNcFFmVUF2TmpKSGcwNHNqcWg2TVAwcUtmd0N6?=
 =?utf-8?B?RFpRcHU4NjROYlh3M2s0ak5nQ1JKVnRsVm9NQUs5SUM3blBDcE9qdFZOdmJ5?=
 =?utf-8?B?Z2NiRXYyRTFCemJCcXZ5eHJ0MmFhbmhvY3ZUWmlaN3JTd1hSRmduaGZwNVJh?=
 =?utf-8?B?Z2x3K2JWS0N1blk1WkI5UGNVeUk4ZmpXTlFZM3NXWUhSZnpQM1Y0SmhEanJp?=
 =?utf-8?B?MUY0N3NqekF4V21UYWtQVXM4cjAzWEk5b3QrNEpBZEVnem00YzNWZWJNQldz?=
 =?utf-8?B?dzlaNVhCcUF2VU1tZURKeVNpV2c4QzJvUEFHOTcyMi9MTFFoSTRiTXV2M0ZB?=
 =?utf-8?B?cjk5bHA5TkJHdGxXSTBuY3pXNU1qdnJIdldkYjI2YkYxSEpIT3ZtdWw2aUp4?=
 =?utf-8?B?RzRmQzc0ZCtPellZRUcvcDVacTFGOENzdmk4ODZwSHlsNTJJYzZUS1VBMkdo?=
 =?utf-8?B?SzdoSWlqSFNpNTdPTkZ0V0RJczRPaFg0d2tIdE1ydG41THlFR2hNUDdJcDhJ?=
 =?utf-8?B?bGV5ODZBN3cvaWlYWTV4K2laYjZtaEhHTTVSK0pLMm9jNEhCeFFyTUVhZ2Fs?=
 =?utf-8?B?aUoyeDU3NDVybXFYYTltSE8yV2x5MGZKdC84ekFQY0pKa3dqU1NFL0x3SElV?=
 =?utf-8?B?bXZRazQ1Y1lkZ1ZxQ0ZrZjR1dWNrK1pqakZhWjJSMDY1YW5WTE9TUHBDUE4v?=
 =?utf-8?B?UDlEUzBoVmNSbzlCMGNaMXBJMjVRcEU5ekY2RGFxWU54WlNBU0pZemd6cUlQ?=
 =?utf-8?B?YnJEY09MamU2cXVUcGNmRS91UUljWTVsa3pHTFo3VVRsVWsrMXdWSnhjbzQx?=
 =?utf-8?B?MGVZL1VrUFlTbG54a3RVdzB3Q1NJVTJtQmg1cFFGN1hGeXZSYU5mdDNBL1JL?=
 =?utf-8?B?VFg2aXZWeFczZElFRFlTaFdmM2ZIS1lKZS80cno2cmo2ZDhwTUFuYVV3YmhH?=
 =?utf-8?B?SDZHaXNabkpHMktPMW0vWXVXTktPTGxJaXZVZWl1ZmFZck14R2NYL2QzVXhN?=
 =?utf-8?B?bzQ4Zm9BVnE2TzRGenovQ1pidlJWRk8yYmJyUHVCSDd3eUxDYm1XVVZuaXpV?=
 =?utf-8?B?dW5kTUN5TFl1R3o2aEJON0s0WGRNSU83aTI2OFB4a2FjUlU0dEJuM3hucnBW?=
 =?utf-8?B?eTcyc0p6K1JVSDRpWHVxYllUcWtkNzFnUFFKSlZMTEpLdS9sbXNYTlI5WVZD?=
 =?utf-8?B?WG1OWFpFMHRvRWxBQU5uTjQwQm5KQjYwcnFhQWtHNnoxNENrekVrd2RTS0lu?=
 =?utf-8?Q?Vw1R1jha2Mq3tYqJFRyei6YHS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yjeVbR7hX3u1+L2MYUdj8ipviPME+Twqg0j1BfQlOs4tp3P1j3B0QZS7ZG0wYh2cWN2EgJ41arlMTx06nMOoeDmD+haTzJImJvhzGDM/qADaf0MygBPz0qPDe70v6BfphZL8vjKHt17nCBE/zL1n3bTdEZHTpPulRYDY1yAFJXrK+hM2ZTHGcyrd7kWRmSc7Un1FHG36u+W6bCztwCpyLudFrsWI7MLBjB/amZbBduPeRSjwb7581vPelMnyzDo9CZpN7I1E50iSdguAIwW1whluAORRZI2Le31NTZuBZ7bzOzpxkXhp4Hvwnsj0v3uAr6CabfnNC67MR/6eKjnE9N1TgDSrM8STCUxmy1bhcGhaAW/Iv5j48OSjyKDpBaXhsiENyJgg1qZ0kM4D3IPbHQzDssG5dMq+tfzkZbF2F0QBaiUGippR/Ik2K6xrF0CtC0LeX8iNENyGBwmLYrc+hP/AXCXNi5+mbYngRpZKklv7mbWPxIy/ZcUb3JllCu5khaV9xoBh7I7AaYyNk+HOGTHNC99lSZnCItwlPt486Xx0fx3YTF37REPjajsZj1Ye6tPuMtUuytAVlRda880KQjIaDFXu8FlzKPTep/R533c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cee84e6-531d-4a69-a772-08de1e60d315
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 00:50:34.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0NR64h02y73+wp9KUCqupQR+0F1Hb2Fr3MjbLrgd6bqFHCG6Qojn3nyd6m/rSyZAFm7ztWfKNCwZhH9BQNhSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4274
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511080005
X-Proofpoint-ORIG-GUID: QPYkBhEcGuCoFoTYAwqWcDL9eb9hoWDT
X-Proofpoint-GUID: QPYkBhEcGuCoFoTYAwqWcDL9eb9hoWDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAwMCBTYWx0ZWRfX4lxtykkbBC/i
 gBQK37mVcUVPWHJXp8edB5ZF4ZI4vd4mHkGzflYnAccejF+cXvnniXqlI4sNyHcXjn51gWvOw61
 VgiZ5boxwZp03witjZM9lRd50zZif1ACnS37BzRA889K+LIiWhu1jWnLFSLMFXxO6suCsG1XTZ5
 fspuBt4Z9TqXlJ6E0i5mDJJ80yOV7HNMsrPMls1iPZvccA1C1CxSpHvK08kgkQnG3eRw+N+1+7x
 RbnIu1y3fTxw4dcHOS9xxtZpEsnQ8l5t9IY1BJRKm+s5B+qlPfjdgz3aUtrxxeeQx5i+GGz8wNE
 NiAbRS0fqQiasmQAdF2dzHXp3M5mAKlUxjzsr+UujgTBFH52jk29CAA7xiRxeSWhwXXnfNmCp16
 j7Ph0lyKQ6OoUgvQrgf3Nk3dskvB2Q==
X-Authority-Analysis: v=2.4 cv=X9Rf6WTe c=1 sm=1 tr=0 ts=690e93dd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=3YnJ_1qNXy3FEqhECH8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

We are happy to announce the availability of DTrace for Linux 2.0.4!

DTrace for Linux is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for 
tracing
on any Linux kernel that provides BPF based tracing and BTF type data, 
although
(as mentioned below) improved functionality benefits from an (optional) 
kernel
patch.

The functionality is close to being feature-complete in comparison with the
kernel-module-based version of DTrace for Linux (version 1.2.1-1). 
Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

     https://github.com/oracle/dtrace-utils/tree/stable

The main development branch for DTrace for Linux is at:

     https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.4.

NEW

       + stapsdt: New provider to support probes defined via stapsdt ELF
                  notes and probes created dynamically via libstapsdt
       + tcp: New provider making tcp probes available
       + udp: New provider making udp probes available

       + The User's Guide is included in Markdown form and part of an 
install.
       + Example scripts are installed under /usr/share/doc/dtrace/examples.
       + A context file, explaining DTrace, can be used with LLMs (AI).

       + [u]stack() is now a "struct dt_stack" (dt_stack_t) subroutine
         that can be used in expressions.  Its singular use as an action
         (putting the stack in the output buffer) is still supported for
         backwards compatiblity.

       + The return() action allows error injection by forcing a given
         return value for kernel functions that allow it.

       + Support for C-style // comments.

       + Aggregations are now snapshot "just in time" for better
         performance and for more consistent reporting.

       + Precompiled BPF code is more granular to reduce BPF program size
         in generated tracing programs.

FEATURES

   - Providers:
       + cpc: CPU Performance Counter probes
       + dtrace: BEGIN, END, and ERROR probes
       + fbt: Function Boundary Tracing (FBT) probes
              (Using fentry/fexit probes where available)
       + lockstat: Locking related probes
       + pid: Userspace function boundary tracing and offset-based 
instruction
              probes
       + proc: Process lifecycle related probes
       + profile: Timer-based profile-* and tick-* probes
       + rawfbt: Function Boundary Tracing style provider that always
                 uses kprobes - it can be used to trace <func>.<suffix> 
symbols
                 that are generated by compiler optimizations
       + rawtp: SDT-style probes for kernel tracepoints with access to raw
                (untranslated) tracepoint arguments
       + sched: CPU scheduling probes [partial implementation]
       + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
       + sycall: System call entry and exit probes
       + usdt: Userspace Statically Defined Tracing (USDT) probes

   - Aggregations:
       + Regular and indexed aggregations
       + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                                quantize, stddev, and sum.
       + Aggregation actions: clear, normalize, normalize, printa

   - Speculative tracing:
       + Functions: speculation, speculate, commit, and discard

   - Variables:
       + Global variables
       + Thread-Local Storage (TLS) variables
       + Clause-local variables
       + Associative arrays for global and TLS variables
       + Full support for NULL-strings
       + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, 
errno,
         execname, gid, id, pid, ppid, probefunc, probemod, probename,
         probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
         ustackdepth, walltimestamp
       + Inline variables (e.g., cwd, root, ...)

   - Actions:
       + exit, freopen, ftruncate, mod, print, printa, printf, raise, 
setopt,
         stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

   - Subroutines:
       + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
         copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
         htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
         mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, 
ntohl,
         ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
         rw_write_held, strchr, strjoin, strlen, strrchr, strstr, 
strtok, substr

   - Runtime features:
       + Reporting of drop-counters for trace data that could not be 
recorded
         for the principal buffer, aggregation buffers, and speculation 
buffers.
       + Pre-generated translator files to support kernels from 5.2 to 
current.

   - BPF support:
       + Direct compilation of D source code into BPF programs.
       + Efficient use of pre-compiled BPF functions for library functions.
       + A bpflog option to request the BPF verifier log for loaded 
programs.
       + BPF program linking of dynamically generated code and pre-compiled
         code to facilitate code sharing and code re-use.
       + Improved integrated disassembler for generated BPF code at the 
clause
         and program level (-S in combination with the new -xdisasm=# 
option).
       + Improved trace data buffer handling based on memory mapped perf 
event
         ring-buffers.
       + BTF type data support.

   - Development and debugging:
       + Support to run dtrace under valgrind.
       + Configure script based building is supported.
       + Improved support for building and using DTrace on upstream kernels.
       + Installation paths for all components are configurable.
       + Header files for USDT (sdt.h, etc) have been moved to avoid 
conflicts
         with projects that supply files with the same name.

DEPENDENCIES

DTrace for Linux makes use of BPF library functions that are compiled at
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from an optional kernel feature that is not 
commonly
available in Linux kernels:  CTF data generation at compile time. This
provides important datatype information for kernel and kernel module 
symbols.
DTrace for Linux can be used for tracing without this patch, albeit with 
some
limitations.  This additional support feature for tracing is available at:

     https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.10

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

     Enjoy!

