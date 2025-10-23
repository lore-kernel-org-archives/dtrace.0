Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C526FDB2
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247616; cv=fail; b=cPVa7wHDocEQ63ronKUBBYxNJIqSxcj2PMc/N1CaJ/XaefX0SgBWmSmvSWbsp6O9rgYAMV9gB8GKMAxctxH2rTU/Zc97cXuqYnzZMd1q6OJ9Gu9I3z1qo80OXpmckkzMOAgQugNtxawc9V0wgLdlX7AiYAwsVkbNt4Aa73IiiaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247616; c=relaxed/simple;
	bh=n/nPurs8DeoaXdi7fN1qqfIhh+Q6baOCn9eKGi8Dsu8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dhg7i+oQcDgLKq7kMijDriG5UnCxncxA8KHukgy2BKOy4H/CZ+ybcc2FwS/8PLeN2ziu8Dvp5cfmYE8lGrT3kAVQPPAS/OnHFj3lRdN1to+w0PcRP+v8PB2ZTO3ueGNi2qZAsLcZECfuLxJLfkvbeDuELfJCetjaku5zSmuYMRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hL5wqTPn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cf1kHoKq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hL5wqTPn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cf1kHoKq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBwE6017944
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5zOr5Vsaz12/MD1cOO9qOEUBDWj8tUHutO9ZNLOUM6U=; b=
	hL5wqTPnfSeIpxgMC4cN1e9pIgGyfzUJhGSOUB4Qw5t2VSimh/mRoUXQ/ujqMPV9
	sABYPylQIBFh9gLGO1P2XWG1Ny/i2/Zg/ExDRqCialiiRMS43o6OPIBs616pURh7
	tAvq0d+GU6hR8HdlWgVilo9d4eATf+CSK1NSYDGSUzk1JWp1XHNeP7R0LEA72ZNc
	iq7VGCcwx/prIcP91/mHhyatwHPYG7hMIkU16PGuR2AtjXzmp5LQeattNizrNlcf
	x1E1cz1SMIoRN8d22/VHC7K3dsInZ5Uc2Z7r94J5+/FWEjQdGNZJ9Fyf1C1oNjGY
	mq+Y4j0t4A1IST4IOsaAEw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcybaps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:26:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NHUECD035534
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:26:51 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bg1hbv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsH162xo1X84ph5l+KgqEypBYXe7utnG3w1X5XCZHObk4Rqvk2NtOlVyDDTdjCWuwNVKW5K2ADoxXYUsCmJyy4aXsQSXKbIhY90vRcxbd8LBynlZNpbgRh8jiuHq+zqiswV2XerC2OGGbt+YyIChIZQu9GQ3wdjGu+alJZN7gXGephiLBhaAesOk7MaTNzuHBaoxx+1DUk04i52K7kTyTH3T5AW+eI7yvjRrZcmkuQ+Mceg3ITYU1wJNrr/NW2SfsOHikHaebGwGi4aLCDMs0GcU4aj+bTuWC8dkPDhLQ7b+mNjzaGPkFOHNDtKxv+WWF9wGd3/5GrI4XPI73hNHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zOr5Vsaz12/MD1cOO9qOEUBDWj8tUHutO9ZNLOUM6U=;
 b=CObUQ60Ymwc0YjHtMt9N7xclx62ex/DR2uU33miaViGzfJ1/xp1ZsS5XpchliS2hjPHbIr98Al8Tpald+jileAQ9SOwouS5lCYeG8h77gtu1T64rpU3Ci5vJ+l5JrShiFVFVrEpXmmG42RgkLWrrWnNqT7mcse6TvhiPa8i/chd7rwUCpHIg4NCyWq9Y7M7vHcq0zKOAhdAcXnjz5QvKKaXaHzCDNIoYObHLNLoYL2GyfFWsHA61LqJRX9JCPRgH1T0mmyDOUCq5uEU8cuAcw1DNJW3A0Dxs+D7y4r/TdyAMIyjXXOxhdrUmaTqqF8SpebYSM7eYRqkrSif2EQ2YPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zOr5Vsaz12/MD1cOO9qOEUBDWj8tUHutO9ZNLOUM6U=;
 b=Cf1kHoKq5yRf/FlXCd0HrshzcbsP+cXAhNVS+RmazFUCzYWoU8wxgQlNmf9DJx9R9rMXf5OS7vnv96vHywWs/YzcYBXh5L+U7QfrD2+JyjjKDEmReHFcwKOaRY/Q9Nsn9hmdLr+jOtSiD9TmokXKskO9Lmp8ghZ6JtdVtIiHSkE=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB5700.namprd10.prod.outlook.com (2603:10b6:510:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:26:43 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:26:43 +0000
Message-ID: <6d09e53b-3444-4df3-b196-e48150a76d2e@oracle.com>
Date: Thu, 23 Oct 2025 13:26:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] doc: Fix anchor links for built-in variables
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-3-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:930:4a::8) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d560af-5cb6-47e0-0274-08de126a18cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkhYQnNROFJNQm45WG1SNkdRMVJBR3dyY2tKUk95alU0RmhmeW91VnpUM3B4?=
 =?utf-8?B?b3paaXF2eS9PQnlOTkc3T01zRVNjZTBRY1grSzlWZ1d6MjZnZGI4RVBaR2E2?=
 =?utf-8?B?NEkxTkx3dlNhYmNhRzVhNzRRODR4a08vQjhhRElQWU1BUW96R0dJQ0EwYTRj?=
 =?utf-8?B?d1FYZlYwcGRGYnRQMTRoaDJHOWM0NHdNRG5yeFM2U2dUaDNHUE5QZHF2N2tY?=
 =?utf-8?B?dFd0dktET0VieUJpQVVCZDNuaHpjbDFYQ3F1Y0h0SjRtL1BES0M2N1J1RlZa?=
 =?utf-8?B?b3lULzkvdDBwTTdNemdFTWtBcy9JdUQvQmc1enp6dVNYaUZ2bjkzc0NWMEN0?=
 =?utf-8?B?cUNMT3ZjUDdPeGZQaFB4UitSWlJnZCtKc1hWYTJLTENDaXlhYUJFWFhBT0Np?=
 =?utf-8?B?MWpLKzRpUlVaY0l0dTlyTEx4RUYwYmNrNXhMUTMrRS92NDREYUVIQUhZdHZp?=
 =?utf-8?B?WFVleHFRb1lwTmptbkoxQUN3SU00SjdaS1ZlS2ZKcTVpZEZlcmZKd1k3cmpj?=
 =?utf-8?B?RTRZb0pMQkJNa1EwdUxJQUJnTFV4REY2SE01cmdrNWNrTTV1OUthb0x6N0dx?=
 =?utf-8?B?cUlFOUdFT21QS1FKemdTZzhSNDV3VGx5VWR0UnR3bVZUeXRPazg0ZjdnbGgy?=
 =?utf-8?B?S2xKb2ZFam9PYzIxaTFjVzBwdlRLd0VpTjVINnlGVlVyUjViaUM3V3ZmQnJj?=
 =?utf-8?B?Z1dxN2JXUy9FUFBXWWdwQUVOMSthSXZ1TUVCWXVORUg3U0VPaDdPQUxDRHVv?=
 =?utf-8?B?T2QwSEg5dk5JQ3Q5dnhrc2NXWHhCMXRHN0J5b3l3d1oxNFBVajdtTUVDRk15?=
 =?utf-8?B?bFdJNjQvRmhNdENFbkNSc1FaeHBBaDZUNmtMaWsvcXNReTJ2NjdhSk9FUlNP?=
 =?utf-8?B?SUhJanRBNk4ycWZFbDUwUUlGT28wVS9LaHhBWDF1UnRDSisxRGhRZnRRYjR1?=
 =?utf-8?B?a0FFNk14RDRWRGlodWNWMFZpNmhpdVd0MG4xTVpZSGxKWTJRcWZ5TURVU3lP?=
 =?utf-8?B?REMvQmNlejd6Nk8yQ1N3WEZUZzR2QjBRSDQ1VGdJcVBIUjl6b2JIdUdwaG1w?=
 =?utf-8?B?Q1VlaDBjSDhVbDIwTHZOd2p5cmRXUWNwTHNCUmlkdmx4RW1iLzlCd0RYUldL?=
 =?utf-8?B?dUlMMEt5NDFjb0NYUEpNZGREQ3c0NVhLNFUzbmdWUnh6NXpDall5U05WZGN3?=
 =?utf-8?B?WW1jVytkY1RmNGYyWU9aUndwd1lHSUdHa1VZMmQ1WnlyYUUrckZVc3UraWkz?=
 =?utf-8?B?YVR0WkNXZDVLZ2hHS2RZMjY2OVg4SXd1eHJ6bXkzNE9PNytsaWNwSy9weUtt?=
 =?utf-8?B?UzNqUmpoYUhKaG9tV3orRE54bjJ4b0IrTEt6T0tWUkdRL0VwYmRHaGdsM0E4?=
 =?utf-8?B?bmRKYWFPdENCU0IvbFJkL29KakkzREhUZGI1Rlo0eEh4bzFUa3M3aGRBMlBC?=
 =?utf-8?B?dHZxN2Yzbld4WWg3UFg2STlraC9VQVR4UUVFclZ0M1hjVUJQV1BRTDc5ZWcv?=
 =?utf-8?B?c2hmdi9mclNMNmd5c2dzUjRLRisyRmYyVnJ4RjdYbnlBTExCNlpheTJRdWl4?=
 =?utf-8?B?ejNhdHJScVB5VklPa2l2MmtHMGNhaXpQSlkvVUVvNzZjWG4vK1ZXZHprdTVW?=
 =?utf-8?B?V3JoRTM0RGlVSlpDekJZNDJ3MGFsZnc5RFJKQWsyNjNaY3pEL0g1VDM0c0hS?=
 =?utf-8?B?QjVqemlvaXp1Wm1QRkJIZkt6YjUvS1VjNnBaMEpGVVQrb0xRUkJHOHBBN1lZ?=
 =?utf-8?B?cGRLOGxoQjlMQU5JZEJQUnlQYnhxcnhBZlVhdnRKVHB4U2szQWxyK3FXcmFt?=
 =?utf-8?B?cENkNGt3RlpjNkVPRGYvTTVwL1FZQ1pXZ1A3V2t6eEZyRnY5bHlwYmNvU1pt?=
 =?utf-8?B?ZmJuRnh4c2c5RklXcnhXVUdsN0FBZUdMNEJXY2FKckxSa2lqZEpRMzVwb2h1?=
 =?utf-8?Q?HyqlZCAnrdmkIo1RBeRFJ/0WxppcTv1V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWpucE5mZzdXRWUyNEJrWGUxQTlmMTk2UkdPdThzOExCd1h0WDZvd2FZaXZV?=
 =?utf-8?B?dzNXa3hrTjVzY1JIWDhPMVhHZGhIOHNsNG5kSjQxblk4SnlsejV3SXlzMC9a?=
 =?utf-8?B?OW1MRSswVEVHKzdnWWIwRUZaS0h2Qk5rVjhtc24xREFwQlo3UlNLTmoxaHlK?=
 =?utf-8?B?bXJUM3RkUVZtS1JTTDlrM3J6TUV5dmpBT0gwZnpGeXV5N0FXTzhjNCtKSGRh?=
 =?utf-8?B?L3JYUVBFazFYMFJVVFdXUHdKaE16TEovNGRFOURSTXFYUGhvM0JzRmxFVWk1?=
 =?utf-8?B?c3hBR2JRWTVpOHUyY3ordE9MMTI4Z1EyK2tBZko1UFVFRUVBbUp0VDNtd1Jt?=
 =?utf-8?B?U1FQdi8wdHIyODR4Z1UzRlR4K2I5Y0grbk9ldmdZZ3lHWTZXSGQ4ZUF4MUND?=
 =?utf-8?B?S1ZWdEJMQVozRTZaQWZJMTZyN3VWcWd1UUd5czhzTzJYbzUwZUZ2d01uTS9h?=
 =?utf-8?B?b0tJdk02MDhOMnBRTytqZ2VWRjlxaHgyWVZrd08vck5zZjMzN1J4b0RnWkF4?=
 =?utf-8?B?aDVaa2tGckJoaVJocFo4RENpcUVjTXJxLzZieW5hSER5SlhUTk00SkNoSG5V?=
 =?utf-8?B?ZjlDSEtBWWRVSkFjS21GQkNidGhQcnQ5Uzc3WmJTNjA5cUxmTHhPc2hrVTVR?=
 =?utf-8?B?WE02QzlOYStjSUx3UVNlR0lMcnhjaXN2UEs3Q0lRWWpreFkwbDlzRmNKNWRx?=
 =?utf-8?B?RFJVVmJXL2o4WmVSQUlmVUxLTDl1VzlKVE9RUmw5NXVIYnNtaHNVbHdRVVdP?=
 =?utf-8?B?ZjVIM0pLU3pMWWlpK3AwMkJDR0VPRU5tVTJCMXFlaVZvWmtQWmVPWXlrWkFT?=
 =?utf-8?B?VVh1OEIrcmtod0EzcnF1aDZjempGWTFDVGxyRmFmY3cySGpKQ2hXUHpoSXN0?=
 =?utf-8?B?MGcwaDhxdzJYV0RDcTF6SzlBVjM1QlllOEprNFFvM1VURUZlN0RLdW85SnBL?=
 =?utf-8?B?SUVOMXhTZStzRVVWZmovUnFUUjRKWStXU0J1YnpVdUNVYUhIbjRNY2RncVc3?=
 =?utf-8?B?UVl1ZmJ6Sy8vbW9TMnhmM3pqaE9QUEprSjNNT2N2V0lHbDA5bW1OSVpoc0Zk?=
 =?utf-8?B?eVAvby9SK05MUjV5NU9wc2gvQWZvTFVqcW9OSHRZTGlsRTB1N1FnZW9YTm5G?=
 =?utf-8?B?VUM3S2Y5TFhveFp3S1JEYkJUV1F2Y1c5WmdiZzBMQ3ZtaFpyaytHbVpsYUwx?=
 =?utf-8?B?MjdUdWNZdGZDOTBXSVorVHYyMnN1clQ5eURkTmhjbXRDc0NZQlZ2aDlDK1h4?=
 =?utf-8?B?Qk15bUdsOHNPZUtQbit1ZktmOTBPVFFONjZ6SEkrb1h4STlPdmhBTlRmOWVJ?=
 =?utf-8?B?RG4zaVE1WUZNVTF1SXRtRm9VNXNFbHpQWit0Mk9OZ1kzS0QvZnBTeFlKNE9K?=
 =?utf-8?B?cCtTTVI3Q1BSYjVKZWxOS3FELzVocExuOHFyejV3UXcxYTJkOWtrQ084N0V0?=
 =?utf-8?B?a0dXZUYyUzJWL3kwV1dmWWtLdUhqQWVoL0pTMjAxODA2QWZGUzNIbXpaYysx?=
 =?utf-8?B?SndWUnlUN1BleXlPRTg4Yk14VGMwNWo0dU9HRG41cTFOeVp2MU1hUVIvV0hG?=
 =?utf-8?B?Y0R0YlVEQ0tXK3NFemhTMW5pYlhEb3QrekhwSWZqczdKR04wOEhScTZnNzNG?=
 =?utf-8?B?czBOeVR0U08vSWdlV1crT241eGFxeWxrN0pBbExmd0JFWFBrTDJ6NlRvVWJT?=
 =?utf-8?B?RG1kQmxmQ2VXWEZOMjA3R0NkRlRPUThiNEEyS3ZEdVdvcHpJU1U4Q0MxTHhx?=
 =?utf-8?B?SlRtNHZDMnFOb0ZDZ0RKMGJnaFlLdG9LbDBwcC96TnhucXYrQ3BPUUJFUmlR?=
 =?utf-8?B?d2M0WVQ4ME5iaDRTRWdjMCtyQkJEZFBwbWVwVmRRYnErZWo1U3o1czNsKzFl?=
 =?utf-8?B?SFhtMm8vcVFVcWlHaFY1WDlMRmowQThidGU5WUJYSkN1NGpmNjRTa2JvNXBl?=
 =?utf-8?B?b0hzY3pEYXM0dlA0clRjYXk2VDlyTjRlMjBxRWkxOTRQV2szRFY1QVFRTkxo?=
 =?utf-8?B?ZE0wV3pYRG11Z1V3VkVuTGNvRktGRVF5N2Q3WmlpNXBPREN2NTZaRzl2MGxp?=
 =?utf-8?B?Q3Z2ajN5YkIrbUs5WGxza1VZMTE5VW8zWXMvelJLWjlMVHpFUzY5Uk43WXk3?=
 =?utf-8?B?ZjNCMzdkbE9rdVhNbWpuQ1hkSVg2OWM3ZzVRallWVlhLUFhrUk1mZ2ViS2pW?=
 =?utf-8?Q?k4yAczEyElHlgPuqzFfXUso=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hp6HuzjsM+PAurYciVXqqdaz2wm+prxAJKBUcrSNrvvLXrvkvnJr+2iUGk62J+UM++mimMDK01hOVZikPEvcq+t1WrHSyMCmdc9X4mXugsTz9N0jryw4OifVQ04uJTRhRYMptV2gkrL2flJBDQi/kSMB85PkcNsf0CIx9ipvJCWAsGCeTGGd8RSZRpdnxX25xjC69vej/naezBiB7MNJvFK/pqhma8KnBVaMwi158JsUdjSyUQFGSoWH337wXbGBbojAvLQma6AeCePnjSr2eWyo8RrTqa6Pnv6OmUtLIAeUotFm9jwQUpSerk/KDIyNxurN+wjF9INfa0PaUIQZWW6bbxwC7/RmQOCmIJVgZE7TJpFD0tj+gu/PkXDFCS9CVTb93JOWzZwupgzodCENkAL4kKW6RDgCUhKL8VDQlHIj9RO1UqKq6I7IHDqLbg2GPDFJ/+CTGXAgeB7IDM00+WS8fsteOh0EtAgEEm0r6uy+MJZRA6CNQHnkOK73tzfFqt8fRJe49iafs1scEmJ+ny85SXgco+CAInsZ4rV7o5J6ehzPEYT62Yy4DYiLpN69STts9CGByzSHZpGi1f8urUJLETuV4ahv3vpwhQYCGMU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d560af-5cb6-47e0-0274-08de126a18cb
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:26:42.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2peDntTuaiaeMoZGhqvT2LMN5uJ+szEg+wQ//82E/TBdnL2BbcwfY8CDcvx4GmDpfgv+O/Tu08bZKlWD7hrUmI9oxF3+ZwDFVvmdEivOlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230178
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fa817d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=AQq6CpvW0pPEZybV_0IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXx3U/kKcGrPnE
 Q/rVMU21Yn+/RCb3HuSLdGvKLuq4URy1f0aq9sC7VgKb4L4bsbVdWh/NV/Y0KdUrGP/UEYDxfKu
 +Y0IV/7ItUKUzB7OyYbRzxHKiAUMc4gsv2f3FQIchKOqjzgCxKtvaFV9TKGWF74ebaakv3TXrMA
 aS7FyjqnWAoXeQkz+uQJT6KXGYmYyvpqUkQq3XqtQxh/dbRh+w68h7AGODkqpPuHZ3tTcFr8vZ5
 GpRmJIxOX04ArOKb5a+RnhEEOCHRrE/ZhgquH1I/+t3qQktm/iB1s2UujrujJaGzZkl6xeWLm8l
 kwoyLTFXlpJNGuJjYK1X4kNV2RFbHrUcsuhzLYdubK1FxufH8bo6A4tQtXXiZbbL6LErKZK9ZN5
 X9wGEIDRRCB+zjK7JPGXn58DFRGre/RzfSInWme4i0JXJ7g415U=
X-Proofpoint-GUID: 7ebkww89bhO76UzelGKwd5f60OBhe1IO
X-Proofpoint-ORIG-GUID: 7ebkww89bhO76UzelGKwd5f60OBhe1IO


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Anchor links (links pointing to specific locations within files) are
> broken, at least for viewing the Markdown version of the DTrace User
> Guide on github from common browsers, in at least two respects:
> 
> *)  The arcane ID names are displayed at the anchor sites.
> 
> *)  The links do not point to the specific locations within the files.
> 
> The problem is that the {#ID} syntax is not recognized.
> 
> Replace the {#ID} tags with more universal HTML <a id="ID"> tags.
> 
> This patch addresses the documentation on built-in variables.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../dtrace_builtin_variable_reference.md      | 60 +++++++++----------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> index 28b3001ae..787137929 100644
> --- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
> +++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> @@ -1,9 +1,9 @@
>  
> -# DTrace Built-in Variable Reference {#dt_ref_builtin_vars}
> +# DTrace Built-in Variable Reference <a id="dt_ref_builtin_vars">
>  
>  DTrace includes a set of built-in scalar variables that can be used in D programs or scripts.
>  
> -## Macro Variables {#dt_macrov_scrpt}
> +## Macro Variables <a id="dt_macrov_scrpt">
>  
>  Macro variables are variables that are populated at runtime and identify information about the running `dtrace` process or the process running the compiler.
>  
> @@ -169,7 +169,7 @@ However, in probe descriptions, macro variables are expanded and concatenated wi
>  
>  Macro variables are only expanded one time within each probe description field and they can't contain probe description delimiters \(`:`\).
>  
> -### Macro Arguments {#dt_macroa_scrpt}
> +### Macro Arguments <a id="dt_macroa_scrpt">
>  
>  The D compiler also provides a set of macro variables corresponding to any more argument operands that are specified as part of the `dtrace` command invocation. These *macro arguments* are accessed by using the built-in names `$0`, for the name of the D program file or `dtrace` command, `$1`, for the first extra operand, `$2` for the second operand, and so on. If you use the `-s` option, `$0` expands to the value of the name of the input file that's used with this option. For D programs that are specified on the command line, `$0` expands to the value of `argv[0]`, which is used to run the `dtrace` command itself.
>  
> @@ -243,7 +243,7 @@ To find the number of system calls made by the `date` command, save the script i
>  sudo dtrace -s syscall.d -c date
>  ```
>  
> -## args\[\] {#dt_ref_vars_args}
> +## args\[\] <a id="dt_ref_vars_args">
>  
>  The typed and mapped arguments, if any, to the current probe. The `args[]` array is accessed using an integer index. Use `dtrace -l -v` and check `Argument Types` for the type of each argument of each probe. For example, consider the system call `prlimit()`. The prototype on its `man` page \(`man -s 2 prlimit`\) is consistent with its DTrace probe listing \(`dtrace -lvn 'syscall:vmlinux:prlimit*:entry' | grep args`\). Specifically, argument 2, if non NULL, points to a `struct rlimit` with the requested resource limit, which can be traced with:
>  
> @@ -255,7 +255,7 @@ syscall:vmlinux:prlimit*:entry
>  }
>  ```
>  
> -## arg0, …, arg9 {#dt_ref_var_arg0-9}
> +## arg0, …, arg9 <a id="dt_ref_var_arg0-9">
>  
>  ```
>  int64_t arg0, ..., arg9
> @@ -271,7 +271,7 @@ rawfbt:vmlinux:ksys_write:entry
>  }
>  ```
>  
> -## caller {#dt_ref_var_caller}
> +## caller <a id="dt_ref_var_caller">
>  
>  ```
>  uintptr_t caller
> @@ -279,7 +279,7 @@ uintptr_t caller
>  
>  The built-in variable `caller` references the program counter location of the current kernel thread at the time the probe fired.
>  
> -## curcpu {#dt_ref_var_curcpu}
> +## curcpu <a id="dt_ref_var_curcpu">
>  
>  ```
>  cpuinfo_t * curcpu
> @@ -287,7 +287,7 @@ cpuinfo_t * curcpu
>  
>  The built-in variable `curcpu` references the current physical CPU.
>  
> -## curthread {#dt_ref_var_curthread}
> +## curthread <a id="dt_ref_var_curthread">
>  
>  ```
>  vmlinux`struct task_struct * curthread
> @@ -295,7 +295,7 @@ vmlinux`struct task_struct * curthread
>  
>  The built-in variable `curthread` references a `vmlinux` data type, for which members can be found by searching for "task\_struct" on the Internet.
>  
> -## epid {#dt_ref_var_epid}
> +## epid <a id="dt_ref_var_epid">
>  
>  ```
>  uint_t epid
> @@ -306,12 +306,12 @@ The built-in variable `epid` references the enabled probe ID \(EPID\) for the cu
>  ## errno
>  
>  ```
> -int errno {#dt_ref_var_errno}
> +int errno <a id="dt_ref_var_errno">
>  ```
>  
>  The built-in variable `errno` references the error value returned by the last system call run by this thread.
>  
> -## execname {#dt_ref_var_execname}
> +## execname <a id="dt_ref_var_execname">
>  
>  ```
>  string execname
> @@ -319,7 +319,7 @@ string execname
>  
>  The built-in variable `execname` references the name that was passed to `execve()` to run the current process.
>  
> -## fds {#dt_ref_var_fds}
> +## fds <a id="dt_ref_var_fds">
>  
>  ```
>  fileinfo_t fds[]
> @@ -327,7 +327,7 @@ fileinfo_t fds[]
>  
>  The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md).
>  
> -## gid {#dt_ref_var_gid}
> +## gid <a id="dt_ref_var_gid">
>  
>  ```
>  gid_t gid
> @@ -335,7 +335,7 @@ gid_t gid
>  
>  The built-in variable `gid` references the real group ID of the current process.
>  
> -## id {#dt_ref_var_id}
> +## id <a id="dt_ref_var_id">
>  
>  ```
>  uint_t id
> @@ -343,7 +343,7 @@ uint_t id
>  
>  The built-in variable `id` references the probe ID for the current probe. This ID is the system-wide unique identifier for the probe, as published by DTrace and listed in the output of `dtrace -l`.
>  
> -## ipl {#dt_ref_var_ipl}
> +## ipl <a id="dt_ref_var_ipl">
>  
>  ```
>  uint_t ipl
> @@ -355,7 +355,7 @@ The built-in variable `ipl` references the interrupt priority level \(IPL\) on t
>  
>  This value is non-zero if interrupts are firing and zero otherwise. The non-zero value depends on whether preemption is active, and other factors, and can vary between kernel releases and kernel configurations.
>  
> -## pid {#dt_ref_var_pid}
> +## pid <a id="dt_ref_var_pid">
>  
>  ```
>  pid_t pid
> @@ -363,7 +363,7 @@ pid_t pid
>  
>  The built-in variable `pid` references the process ID of the current process.
>  
> -## ppid {#dt_ref_var_ppid}
> +## ppid <a id="dt_ref_var_ppid">
>  
>  ```
>  pid_t ppid
> @@ -371,7 +371,7 @@ pid_t ppid
>  
>  The built-in variable `ppid` references the parent process ID of the current process.
>  
> -## probefunc {#dt_ref_var_probefunc}
> +## probefunc <a id="dt_ref_var_probefunc">
>  
>  ```
>  string probefunc
> @@ -379,7 +379,7 @@ string probefunc
>  
>  The built-in variable `probefunc` references the function name part of the current probe's description.
>  
> -## probemod {#dt_ref_var_probemod}
> +## probemod <a id="dt_ref_var_probemod">
>  
>  ```
>  string probemod
> @@ -387,7 +387,7 @@ string probemod
>  
>  The built-in variable `probemod` references the module name part of the current probe's description.
>  
> -## probename {#dt_ref_var_probename}
> +## probename <a id="dt_ref_var_probename">
>  
>  ```
>  string probename
> @@ -395,7 +395,7 @@ string probename
>  
>  The built-in variable `probename` references the name part of the current probe's description.
>  
> -## probeprov {#dt_ref_var_probeprov}
> +## probeprov <a id="dt_ref_var_probeprov">
>  
>  ```
>  string probeprov
> @@ -403,7 +403,7 @@ string probeprov
>  
>  The built-in variable `probeprov` references the provider name part of the current probe's description.
>  
> -## stackdepth {#dt_ref_var_stackdepth}
> +## stackdepth <a id="dt_ref_var_stackdepth">
>  
>  ```
>  uint32_t stackdepth
> @@ -411,7 +411,7 @@ uint32_t stackdepth
>  
>  The built-in variable `stackdepth` references the current thread's stack frame depth at probe firing time.
>  
> -## tid {#dt_ref_var_tid}
> +## tid <a id="dt_ref_var_tid">
>  
>  ```
>  id_t tid
> @@ -419,7 +419,7 @@ id_t tid
>  
>  The built-in variable `tid` references the thread ID of the current thread.
>  
> -## timestamp {#dt_ref_var_timestamp}
> +## timestamp <a id="dt_ref_var_timestamp">
>  
>  ```
>  uint64_t timestamp
> @@ -427,7 +427,7 @@ uint64_t timestamp
>  
>  The built-in variable `timestamp` references the current value of a nanosecond timestamp counter. This counter increments from an arbitrary point in the past. Therefore, only use the timestamp counter for relative computations.
>  
> -## ucaller {#dt_ref_var_ucaller}
> +## ucaller <a id="dt_ref_var_ucaller">
>  
>  ```
>  uint64_t ucaller
> @@ -435,7 +435,7 @@ uint64_t ucaller
>  
>  The built-in variable `ucaller` references the program counter location of the current user thread at the time the probe fired.
>  
> -## uid {#dt_ref_var_uid}
> +## uid <a id="dt_ref_var_uid">
>  
>  ```
>  uid_t uid
> @@ -443,7 +443,7 @@ uid_t uid
>  
>  The built-in variable `uid` references the real user ID of the current process.
>  
> -## uregs {#dt_ref_var_uregs}
> +## uregs <a id="dt_ref_var_uregs">
>  
>  ```
>  uint64_t uregs[]
> @@ -451,7 +451,7 @@ uint64_t uregs[]
>  
>  The current thread's saved user-mode register values at probe firing time.
>  
> -## ustackdepth {#dt_ref_var_ustackdepth}
> +## ustackdepth <a id="dt_ref_var_ustackdepth">
>  
>  ```
>  uint32_t ustackdepth
> @@ -459,7 +459,7 @@ uint32_t ustackdepth
>  
>  The built-in variable `ustackdepth` references the user thread's stack frame depth at probe firing time.
>  
> -## vtimestamp {#dt_ref_var_vtimestamp}
> +## vtimestamp <a id="dt_ref_var_vtimestamp">
>  
>  ```
>  uint64_t vtimestamp
> @@ -467,7 +467,7 @@ uint64_t vtimestamp
>  
>  The built-in variable `vtimestamp` references the current value of a nanosecond timestamp counter that's virtualized to the amount of time that the current thread has been running on a CPU, minus the time spent in DTrace predicates and functions. This counter increments from an arbitrary point in the past. Therefore, only use the vtimestamp counter for relative time computations.
>  
> -## walltimestamp {#dt_ref_var_walltimestamp}
> +## walltimestamp <a id="dt_ref_var_walltimestamp">
>  
>  ```
>  int64_t walltimestamp

