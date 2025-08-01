Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3307078F26
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754072133; cv=fail; b=j6m0H/ujYGh9mFJX1cQcJUII8hSF8PzOZaBgQ8OmQaDXCf55X0ajCsjB0os5ILQJvSrsy7xEaAC8Xh45htkmyOgvZoZH6ttgIBJtstny4red05D/1lTu+ZnV3G4xq62i12NH1aa5+SJhM9LNSUFu1ybDV7yq09YVQC0xI3nUoCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754072133; c=relaxed/simple;
	bh=Pn7+u2aYo7KzMfR0hsNoV4GrICET2eIYNwT71mp0o88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YW9NMffUApiz+73G/bSCGhSg7hPCgJBwq9mNkyTYGceadvP+HrQmTqvzNcpzahHhi/HzZdD2qiDB5Wtwtk/+Y9+7y/AsNAUI1UZRAv6Jrtkz4I8z5J1EpeRn1vFRjRF4IQrDfKARvrXr9JKgo5EHumvKoFicmoaqQO3gW454vCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BiqOz1cT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U2SJ5bdU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BiqOz1cT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U2SJ5bdU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Hu00f009493
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cwzGq7LCS4OuD3Nuhk0PXTvdhCtNErmgn1GT4TSEvis=; b=
	BiqOz1cTQ+AK83e4WJ16dRaSyofK7rKxeQyWIVHFiqe/dEQGpXxdxyDX6RHcfgdW
	yuYUclgfdtSsKFOlE/qk48TRY72Rmn+OmJIy7hfeMhIalTDAs9emiMLo/tSg/3lR
	7mipiU0DjYJVWnKTK6rnbGhjrVrQs7ZZ6DAlOwwRRm5FXaDJTtoudNkiyJRnZk7+
	OCGfxzVMUQ7x7/JkFELSzElVc7qLmX4M1vBvyFpGGTMsttsloJsCvaEhA1jhqmKs
	vuAvdqfmaQad0J94oqbSNMQGbF1vcM4yIeRuHLaKa33MDST7EMLhrL7v2KrlkogT
	Qq2xLiTO45oV+cSQ3EYs8A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5x6kte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:15:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571GV9iv038592
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:15:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfduv34-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZTpbFVV82djvDI7HKeRl39IJ2XLga3hLz4CUSy2gxuFojh6ilKz/GY49ciQBoy540IAZnOfRQOwCdUu5hoaOB59WJjTN7rOJTBZo32MeNwtwKmJtT804CvClCQC6rS4D8u01DUQlesS113+3y7UM632Kxwagq/pcRSo3mTb3tk4FqkgnwgVIFuRmJve3Ye0bw3PyI8wD7vetR5McWAJFCvqvZf5qNw0RvBX9KcvCv4G2bHHkAQnoYMaMTXtUAHw+9dFoREK35UhGuGascKrVpPH6NMhnKXU2/lU3hS/tGxCYg8+m6pPbG25NsV47YMIxso1IToAxgTMdKh1diEAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwzGq7LCS4OuD3Nuhk0PXTvdhCtNErmgn1GT4TSEvis=;
 b=UvnWSwis593XUQHqrgho3/+UAvAYOxMN47QhmLSwjQh4/CjOPdO9rXhn2jgJ9nZqw154opGWbZNnDQyKF2RFD0i1i+MdR36Bz4Tu060mzeDxWflfBDYv/ThNADA7z54N1fCsYJIyf72Ev6qOpJYy1y8F2rll3BZjFTzN1R7n0EKxHI0L5p/E1iTzLZHGo8usXFclRxDZka2FdEJlQeXQTvcAWwdIvLh7c1N3GfaoxYWqhWwqOQ9ZCIYzsu5zGtiOGCCndC3pTqn2miwxP/Z5paMwInSDTx8tdiPg0fEIof5G1J9u0KbRUsc8HNdqG16mMoQOF4Mx7cENNfyg5QEMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwzGq7LCS4OuD3Nuhk0PXTvdhCtNErmgn1GT4TSEvis=;
 b=U2SJ5bdU3RpHJ/J2a6GSgI9rKV0HyJjkuJIeC4fuBut6R8sU8hktlNPDm3qItxgOBPaPbOOpLk+xsCyfKgMu/G2BLaWMkq9DKMTNEfqfPcwaNy/gBrB5DRoqU2YWYVF64SVx1elHqeNRrwXJGf8HROMfgYFRdRBinfmg91PEiJE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA4PR10MB8302.namprd10.prod.outlook.com (2603:10b6:208:55c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 1 Aug
 2025 18:15:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 18:15:25 +0000
Message-ID: <65fbbdeb-54af-ff2a-cef3-ebf019f6393d@oracle.com>
Date: Fri, 1 Aug 2025 14:15:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250711044024.1587-1-eugene.loh@oracle.com>
 <aIze8ZQ2iBFSf0J5@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIze8ZQ2iBFSf0J5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:408:4c::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA4PR10MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: a9abbb23-c724-4449-1ebd-08ddd12762c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVRaZ2FyU1UwRHNZaUNWVlpZOURjYUF6SDI1R0RDeHRaUm82NGl3MHdpano1?=
 =?utf-8?B?dDhTMnZseU84a2ZGT1dNLzBrbVh6dllGZGx4M2J4RmVLWm14bERITjBtSWsv?=
 =?utf-8?B?VEorRmFQT1A0dFNUSGp0VUtoajR0R2sreEdoZW9yS2duTXRvRFlnZzdURDNG?=
 =?utf-8?B?YWZxSFRxSUh3cE1TS3VhR2NpVGxSRENraWpHa2xEQzRHdnFqNTUrVFlSYmpK?=
 =?utf-8?B?dS9SVXpaMDFVUmVnRExKY1V6NWtFR0kwV3RZTU1VU0d2WEFXL04xQWUvWXRS?=
 =?utf-8?B?Ymh2YVpMcXpkNVN5cHNlVG1TU1ZLQUZwb2IxL0pkR0hnV2ZUSmViK3VhQlA5?=
 =?utf-8?B?c3lpV1I2R0gvb2NuaUErRkt6NzNjczZHOWNkS3lJaUlacFd5R09JRWIvRUlQ?=
 =?utf-8?B?TGNXUzFMMU5rQ1ZvbW5tUEdxVE5LZDhma3V1cnA0cjN4Vm5pRjJFdU9pb0Nv?=
 =?utf-8?B?ZzFzbWtYQ2tlSjJ5d2NKOTkwbk1kTkhyQUdWZWRaQm5BQVBaUXlSdFFZazZ2?=
 =?utf-8?B?WjYrR29WcnRuNjhXTVYxaU10WjNKb0doWWVGRTBQTE5ab2lMNHZndEM5U1l2?=
 =?utf-8?B?Myt3UjVWWENwazZwbzczNkhDazUxTm8zTEtMVFJaWkdyaGpoNmFwYVhQOWxF?=
 =?utf-8?B?L2VNbmhtcnAzTGhlNzFEM0JzQVd2TWZ0MHQyay81ZU9JeWcra1h2L080M214?=
 =?utf-8?B?VkpBMGxNeWlEb0IxcGkwL3BEUUN5dnowR3FQVWpIVWl6eVVWcjVBYWlhUHcr?=
 =?utf-8?B?S3ZzOWsreE91QjkrMFp3Z1hSQjlqc3pNSktQZk56QWtLVDlBRFpLVVZLQnZs?=
 =?utf-8?B?RkptSTh2VGRVYnE0czJrN0szWS94N01aR3dWYnlBVW04OGJ5WmllSzBEZUFN?=
 =?utf-8?B?eEhabDVYbmtYbEFpYVZ3MXl6a1IvQmlDbml2eUtDMDFsVW5FMFhKRzJsSWRF?=
 =?utf-8?B?a0I4VDduYk8wUTFQTThBSmdJYTBQbUhjK2FNNkhhazhXc2JOUXJrZFd2ZTNG?=
 =?utf-8?B?MEI0TGpBV2JFTVZ4RVF3OVhNc2E5N1BvNkhJOXlTN3ZudXlLTkpaRlM1UnpG?=
 =?utf-8?B?V2hUcUIvemJndW1JSTJHRzZvUmpjR1I5TU1TcytaWkdTd2xtWWxkeG1DUWZo?=
 =?utf-8?B?ZEJWL3J6NWR1WGJiRmZhdThXK1JZejdHY2JVMURkbnJucnVaZW93L2cvb1ds?=
 =?utf-8?B?U2hkM3J5N0ozcTN4ZDVqOHdwTXV5OUpncXF0NXJRL2dTdlRCZEU4WWllMlQy?=
 =?utf-8?B?WXNmaE5sQXNrWCtpUnlUMy95YXgrWnVwalBVRHBGU0NjK3lZK1dnVHFjaGRD?=
 =?utf-8?B?WFB0TElvOHFJaTNzSnAyOTBWRUJRNUR4c2ppYjVLZW1DeFRBY1lKR0pEL3NL?=
 =?utf-8?B?MVAxSjA1TSt2OS9pTkVjTktHOThDN0VYQ2Eyd1ZNaklCRHI1dnIwMFBkQVdT?=
 =?utf-8?B?Sk9PSm5SdlFXUWxoQUNTMWRyN3Z6bGwwV1pReEJLekMxRkcwRmNmZ0g0U3RT?=
 =?utf-8?B?c1pBUXVTdEJYNkJldlFYQkRHNElzajM0MG1aWVBrODZTbWRVQXoyT0ZhbmZJ?=
 =?utf-8?B?OXpBVTdyUzc2UzFnWDZXQ1JMTDNwcjU1R2o3cnl6MU1nZEsvQ2FHd05IY2dJ?=
 =?utf-8?B?QVVyeWxzZ1hLcWQvd0g3NjNkUlNkUVVGaFZ6aHVhVkZ5dkJLeTVlN2Z2OHk2?=
 =?utf-8?B?M0xpWEM0UkNjeVlvc20yVGdUcm5vSlZ1eW9MWmdNcmUvb0loSzBNa2RKejQz?=
 =?utf-8?B?MXJvaXFyTUdlcGRIWHpBbnNHaE9FbDBUc0N4cE92YStCYjhrbGJUVW1DSS82?=
 =?utf-8?B?SjhsN1V4K2UraFdDL3B2MkRCNDQxWDRWdmVRTHp2bEswMkRwRUl6MHBFdThD?=
 =?utf-8?B?RmgzV0cwRVRRMExjMEpaRGpjVGttdFRjOXRvSk5kaUhlQ3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXMrZTdDV0VjUVY4UHhkWVJtdmxDNVBGMHNxcW0yRlRCWDhUKzRqeXFJK3lM?=
 =?utf-8?B?ZmJ4REtuRll5MGFYa1l6cUx1T1hHd1VlOTVjUnRIQXdIY0FLR2U1UVdLOXBq?=
 =?utf-8?B?ck8yeU9udGNIUHUyUlVrbzdjbWNCUTZsWlo0bUZpQTcwL1JldGhlUEY4NTQz?=
 =?utf-8?B?d0J3a1d0QldzMHltNmtLL1JMQnRQelp5YldPMUlMRm9Cbitmd0JvUVFkeHly?=
 =?utf-8?B?YW53OWdsSXB6aURIaDRXMVA0S0J1YkQ1RFhaSU5yay9TcXFzNVY0d3lRMHho?=
 =?utf-8?B?WTBWUXVRS0t5VURjdndoVlk5OHFQd3I3b1Jpc3hNSnQ0cTlIMFQ0VFpOM3Az?=
 =?utf-8?B?QnpLUE5SRjUzN0ZyLzBoR2tEZTVmV0xMZ1BHaGVneVVQTFdmZ3Z6ZnlOWVJ0?=
 =?utf-8?B?OWZuNTgwS09tR293OFZBMDBhb3cxbDBaVzd0djdxSmdKU25QZ2lhSVh2b2JI?=
 =?utf-8?B?a2dYU2xzeDExMzcxeW0zckVpNnU5eCsxNERXb0lvMEQ5SUpra29NWm5JanNB?=
 =?utf-8?B?aEVUeEVQeHJGUUlwZVJaR0JHOE9uR2dQY285bkRGMHBkU1h6SHFDM2JST05L?=
 =?utf-8?B?TEx2U0NZeS9zTlZuWkhpRDJlcFhzOTErR04xeEMrSTRlQ250N04rOTIvZjBG?=
 =?utf-8?B?alZDSHVJZlJuWURwRjZkc1MzeXJ2NkN3RXFYTjBZTitva1hTdEFxUlpJMllM?=
 =?utf-8?B?SnU1Y1Q2Y3Q2R2NWM0xSdlZHd0dXSmljYXRzemF3VXBMWjdpbmdhd0c2VTll?=
 =?utf-8?B?NG0wQjRVSTQxVmUwZ3ZVbTZEZ0dZV09KcUYzV3hYY2cxRUd1WHA0dTB6UXFX?=
 =?utf-8?B?N3BwN3JnYkhEVjlKQk90K0xDemxzbXR1L1lhOC9aRFh5WjBIRy9zMXNWaWdQ?=
 =?utf-8?B?MjVJcktEem1ubVBhVzhUY2FXblJwMHhOMWUxa0hkWUtOSU4raE42NmpOVFVX?=
 =?utf-8?B?VGhYMDJpWWYrQkZkaGllQUV6eE8veG1TMVpZSVh5c2ZqWDRwQVhteXYwN3hi?=
 =?utf-8?B?L2lueGxhdTdjbmthd0tnM2U3R1J0TURISG82azhQb2FoNjZPSitvakw4VG5J?=
 =?utf-8?B?M01adnlZc2NrYjNSeWRITUZSOVJIcjFaeXBaR0Q4clFKcTJhQndLK3FUTXRZ?=
 =?utf-8?B?YjZuTzlyM0F0UTRTL2hJMk9BREZTUjVQTEtNelhmRkwvMUoxRTljOWtvZlJ5?=
 =?utf-8?B?WmNpbEJ1VUgyeTUwNEYxUGNGWTBWQkJpU1F4RzkvWG9qMnRsVE5nRTdaOStP?=
 =?utf-8?B?bkQ0Y2VqS2dsZW5OVHZ5Sk5ya0RaVU5BYS9BVS83WU5mYmpQZnJYU1pRZWYw?=
 =?utf-8?B?UENVZjhUMXNSRytxenh2YkpDbk9aM3ZmbThLc3lYMURmT25qYTd2SEl0RTZH?=
 =?utf-8?B?RkMwWFhSd3dTZG1NejlYRmROMEF6N2NPTlJOelp0NFJId1p2RTVaQS9XaUtC?=
 =?utf-8?B?alZOWnNuekJhbDQ2TGpaSnZlb2VVM0I4SVdqdHJoclFRWWJrZkltRFdDRzVp?=
 =?utf-8?B?MWlSYmEzWFJjUGhnd0EvRDQ5TTRaSisvMjFJWkhzS0tIVHpRQ01sYWN6VFdm?=
 =?utf-8?B?cUUrWHpYN01RakNXaFNkdlZIaW9ia1R2ZkRFOUI2cEV1RzJMYkh1Um1SSVhI?=
 =?utf-8?B?a0Noanl4TjBxZk1YZnJjLzk2NXVOc2JGeGxoNmdiQUxiQzkzaGI4dGNickdh?=
 =?utf-8?B?b2VQZ2pRL0ZxdWY4SDRSWHArRVpVSmxlcktYSnBUQVJ0ZGtWc1kvejhyYXQ0?=
 =?utf-8?B?ZEVaUndXVWxmaG8ycWRORi9BYTh5eUkrVWdGcERjc1U1K1ZuN3pxNkdJV2ZE?=
 =?utf-8?B?TjZZNHVIRENXQlF0a0k3Q3RMV0hWZ25TTk94L2RxUnl0MWwyc0IxaWdKQWJk?=
 =?utf-8?B?NmpKWEUzSWFYcEpyTFBoVzl2U3l6b2cyVWdScHJXdHgxcVhNQ1NTUmlnMmFw?=
 =?utf-8?B?UWRyY3RwL05qUm5sTkd5cEY3R3NmUlRXaDM4R2FqQ3VCTGtOWDZrejVaQW5s?=
 =?utf-8?B?RkZMRUYyeFJtVWUzNHRpOG1yZlBYMkZkeENXWGN4czZBcC85SnBadHF4ekRN?=
 =?utf-8?B?bWlsQkFWcjI5NnQ0dkpzbFNacVFMTGVodDR1MDVVY0tsdExqRnpzYUFjT0Uw?=
 =?utf-8?Q?87PO1YcT+KaZQO+wxVnus2SEB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k8WBPqo2bCJFXQX6OlXujw7ufpH+gVj709hbitnKmx8QOnMcheekiMgncURQliVcLrEZqJ3TRwXmjTVUIbAgJVRqx/SZwz4LGRQYTw1uVUC+tL1WfJOmgS8N9HR2971aguHfOz+h8T16oRXhKCTJQQr9l9zhC8OCsBlj3mgRR4il/nRAkDUs7u8fPsdvHfVVCHmaNex1WOT6M5SSyPC65E/+DLanQ0rKfbHvpnWYHRR6+y4myDGm23+sy9UNhbFVcDiKXSNZG5ibl9zxUmdJ+++o2PBZO1BiUTS3Gv1LiiyMQVcHUTQhyiZW1qm2R4bgrLY5WaxCj27UmBSh2rF+4waOvh4yQ+honpnOp6oo1f3kMk8wAk2zHEJYpEnV4ebABB++2AjTb1PDnLXww7C7kGLHXSwr3Q018EYptDWAx5iTbgcd8akvAdaspP1kT0YkNnNnCxEI4J99hjjijznElOXh36kEDbbd/oJgG4cyzkaDCbaSkbEgPKTAAxHSTsGg+VZiVLZkoa8HAEK3ikA7x3Sm4Kxz9iONGvbTWL4XT1r88P6QATLl2MdGkcBcGL5K5Ns44pdigExzpWEqS5wn2iQUoclXIFiZKorFMBgMaZE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9abbb23-c724-4449-1ebd-08ddd12762c6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 18:15:25.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCt74fZKN3ypaqfWIbncZn/8/iKNXie2LTYH3V34twzsvqOB9H5dAvRZrGpeBMQibkmHlC/dWolPqWNHkune9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8302
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508010143
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688d0443 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=2DVUaF0dqXPR0QiyCNUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zB6C-bkvPFDC7uhWQCEcBYdaGICLU1_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MiBTYWx0ZWRfX3VekF6LcqSDA
 RzfIEc53FF/tWQUnmWCMfe2nsub0kvFAvlaO6CPR10tlhwqTG777Xwdf7CdZ16MZZO77F2p2Mi3
 pfsCOHmex/w9Ex6wR3tApP1NJrt2ZEO4cxrkE80IuHnaMc89v2G9EINfucbgJBEWPRO3Wep7Wl/
 QTbI0Uyg09RlWL/itbISWiponFOx6lxNgMrkP9e7zrB+t2ZWjZUbJd02f37TNo2srwTuL5BuYQg
 6HNIR9a/fl7mWHH51VFYOESKWsDyt604VdUY8iu96SdFslg/p1C6c9fHvsGdaU8QVXwNnHXHjIa
 nVSbj6UBhrmATUwHRoUpY2WaqgP+70Pl+Dp+gE49ijsE++lpjluxF/v+Bk0Ave92BNERuRfrluG
 wm5+Wl6TQgexTpeyqw2ppYVw4JGkW4Wzb5GEwMXZ+TfK/tZ+cNd4On3weEUsZK56xgqGXXoK
X-Proofpoint-ORIG-GUID: zB6C-bkvPFDC7uhWQCEcBYdaGICLU1_p

On 8/1/25 11:36, Kris Van Hees wrote:

> On Fri, Jul 11, 2025 at 12:40:24AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> If a clause includes a destructive action but -w is not used, dtrace
>> should not start up, even if the clause is ignored (due to -Z).
>> Solaris treated this as a runtime error.  We should do the same.
>>
>> diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
>> new file mode 100644
>> @@ -0,0 +1,25 @@
>> +/*
>> + * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
>> + *            even if a clause will be ignored since it does not exist and
>> + *            -Z was specified.
> This could do with some rewriting.

Sorry, what does "this" refer to?  The comment, the test, or the patch?

> The issue is that DTrace used to always
> load all tracing programs, and the kernel would activate them as needed.  We
> now only load programs for enabled probes (and with -Z active, we may load
> some programs later).
>
> What we need to be testing here is that if any clauses of a tracing script
> contain destructive actions, and we are using the script for probing, then
> an error should be reported unless we are allowing destructive actions (-w
> or -xdestructive).

I think we have such a test?

The case being tested here is where a destructive action is specified, 
no -w is specified, but the clause will not be exercised since the probe 
does not exist and -Z allows us to ignore it.  In this case, should the 
script be accepted or rejected?  The patch says the script should be 
rejected, which was the legacy behavior. (People familiar with the 
legacy implementation may understand why the legacy behavior was what it 
was, but the question now is whether that behavior should be changed.)

>> +/* @@runtest-opts: -Z */
>> +
>> +bogus:bogus:bogus:bogus
>> +{
>> +	system("echo ok");
>> +}
