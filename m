Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15610E3
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 05:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760592564; cv=fail; b=IILctyEZvmN/mc8kNBFw3zmtK8G+j+VWoEuuWbWNExpo1UdD+3l4qC1UDhJhyiBp00oBf+21XZ9zEZQEbFI9PXNvnHwPxVQET9a3gH4Gh7Hkc5InDkq7AWrPiP+8wGR+d++wO1TW3IMX2NaD8K52HhQfs7sQbhFNPG7eW+mS2WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760592564; c=relaxed/simple;
	bh=PVGalKVRv06LEU8Vhdbc5K4bsPQtvT9JGvK2EdmdJW0=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ma1LmQSx0muq9CLuvhtImA2OBH1iKRfzQ1tkKISbMQ4BUqk6I+fOgmafNeL/bG2etZOtHnxwU4tzsa8FGTR/VHl/cMKA1CrYgShrLhonkv8UriW2Do2ZB0Fbj4Z2RvW0anuctXN0FIT6J8hSa6goUFgPQLNLpLvzYhau8RO7xpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dtW6F4kw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vm3s7mgt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dtW6F4kw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vm3s7mgt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJxJaJ032493
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 05:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VkwY3tjxhBnC/D9PcNgOzJTZGgFV9VcP45/m5zCTgEE=; b=
	dtW6F4kwSlMphqpj1Uwu8xxvWNw9jpDbp133uriJLwdhSDmqhEtEsE9byS7Z+Oit
	+XZJL8WBlc/dDR4wLh9cjzm1NyWSgeTwZc6NOtlRtd4gont4fRGxtM1QL+vBPWIc
	Sm0uHhQdetS6E1rcPFvq/4vINJgiISodzM32E3qRFR1J/9yK+OPM0yocvKPZMUuW
	bj23x5OXIkne9WtDNYJnzK0BznwBeK6jKbZKo/deBtkNUdzuXdEksHuOrzhsGgDF
	31MKrwo4DEpAwxU1GBi48Pe9GQt43Pr6x1THM1ZHm/QjI5emD65KTIMeSpWjU3Bd
	hvQ/BXa2MCJQGTZt4bqGNg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf9c06n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 05:29:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59G51TKr026157
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 05:29:18 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpb00xx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 05:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5TLx/Nu7oLXV3Lyn/fuj45Piw0TqpVqXKud8GYrmQ9AYYQNhsTF02zy4iGqzIWsXwg2AmLBkkczf8TAdi5q6ga4Far0d5p2ZTgyZzpkKDDEPLLIiRGAPTf82d+elxR1oU4iWsWYHtJEA+ueGjDuBdfhBhL2SvCal1laO6Tfr3M80acr7XK/QwG7S6lE0rxM0p/yH5ivDIf1p2a55ta/tFpagPQSWEPNsvhoGKmNOgVArKhQKXWTxgdqgzcJPFfGbyqhfhuZt7xMZNsFadnXVtTsUMwiUNfoCjSx6HF3dsAMbBl7vxGE9AGTCizTu2QBaBxcyIRigGs27gavj0XODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkwY3tjxhBnC/D9PcNgOzJTZGgFV9VcP45/m5zCTgEE=;
 b=VfJBb4a+B9ha652TmfTo9r8lcPB2EsTpJLv5uKCQMy8nTdCnXMqlJNmva+XL5CzY2P+VWfEXxFAh9JfMYixfh6rlhGuY7INtF9EqoCP/ETF8zf0myfBnVXRrBCpbTDcmfIigYYBToEEUJDNcq4XqCNfALKWMiQubIYZyoaxzygclc7Bzqehko47GlHTYHiy5qHlQebzFsddHJVC3hx6rTExefazyxAGRSEwFJFppHeGuz/XT6Tv+TjLwh/PEMxO8dBYDpizMqyeBUzEWpeBHNOPxNutFOr2X+byGcUy6Gi9tNqETFWneUbhQfCCAOQM3R5oHBxnbwnmWQP7lH7By/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkwY3tjxhBnC/D9PcNgOzJTZGgFV9VcP45/m5zCTgEE=;
 b=Vm3s7mgtnlIgyvO8eXMmbzfNVBCdc3/F/6d6rJmBLwHWe0EDIZQhsZtosWZzYvHe/rlMfAE/zcl5KurJ1EVeDRmJcbeYbnog2ejzcnGdKE+m8ubETwid7eCv9WBlTb0UFLi4d3lRftrn9rOdUf6CIOKje3qMPsmlOmF7vSrfiEQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN4PR10MB5543.namprd10.prod.outlook.com (2603:10b6:806:1ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 05:29:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 05:29:13 +0000
Message-ID: <c7e19477-f615-4ff3-2924-815407aa3746@oracle.com>
Date: Thu, 16 Oct 2025 01:29:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] examples: add a new set of scripts
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251016013153.2872-1-eugene.loh@oracle.com>
In-Reply-To: <20251016013153.2872-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::46) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN4PR10MB5543:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1d86c5-0f52-4ee9-d66d-08de0c74f0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3BIWEs2NHd0TldUUHdiWjUreFpuKzZCSHdQdjRrQWZqOUNIeUxBc3hobWc2?=
 =?utf-8?B?Ny9GVHFlVkp0UC9kMGcvV2hpWWc4Tjh5bElZU1lwckxRUk44YWZzWEJNdG9Q?=
 =?utf-8?B?MFBIT2VFUGZDcDFhOEgwdmRLb2EzTVdBcUFHQjJoZ1lnZ2h1cXVMS0FoTUZ6?=
 =?utf-8?B?cU5SOUZPTjBDYlhPNzJNWW5icnJkTUthTTdhcGJWVEhPMEtQajdSM3VubDZu?=
 =?utf-8?B?QlJzRStobU9FQ0VRL3pSSzc1NGkyVlJuR2JHMWozeUprWjlDUTFHbG53UTgx?=
 =?utf-8?B?NUR2SjVpTExTRDRxRC9HRkF4ajhhbnMvTlpNS1VMRlJqTVpPcFl5TktwY010?=
 =?utf-8?B?YURNZ3lua3ZIZmZGQ3hxeE9Rc08yZUJkaGM1V3VXQ0cya29VblRraHlWTGJ1?=
 =?utf-8?B?TmgyU0lQa1VRV3dXZkMvV2VzdlpHL3N5cGZVQzNYYzJDWTJ6VTd2Q3U0bktG?=
 =?utf-8?B?MHNWcVRWaG4xMCttaUoyanZFZVFOMURRV1g3MWNQeXNJYkVYeVE0dStUQS9q?=
 =?utf-8?B?V1VJVUsxQ29YRXpJQTV5cWt3aElRdjB1VkRMbTRVRmR4bzRqNFJJRGxva2Jp?=
 =?utf-8?B?eFNiMldCc2UrL0NyY3ZYUGpNVGdSbkZ1MkFLYjR4VlRITjQxZWlJZnhPTmts?=
 =?utf-8?B?R1VnTEtVUi9BdURWaENIemFSOVR3UEhURjZjZzR1TlR5NFFFM0JiZ3F2RTEx?=
 =?utf-8?B?OWljUzNTOFFLZVNUTVlobklNeWlmVW1aZ2w3MDREcmxlRGtJRlFiTjF5Vysx?=
 =?utf-8?B?Zk9PR2xPSVdmYVhmMFQ2cVI0U2VOZFRWa1dxTG54VWFycVNTV3ZDYVhsbWdz?=
 =?utf-8?B?VStGNDhvVUNITkcycFJudW9jblJmeHNYRytRU1RvalNtalZvTVBPWVMwRTdL?=
 =?utf-8?B?cjVhWXRneUt6b1l3VS8rdWY2NnRxT2JUTjhrUnhXN0tLa1E5aG4xSUN2ak9G?=
 =?utf-8?B?K0E5L3F6WFc3YkR1MGNxelRPSGJWSlk3OUs1TWEzYi9zQWVIN1dyUXljRnUr?=
 =?utf-8?B?WmVva2FVdzVWYnpEdmdJUkoxZk4xeXM0WDBQSkFQRElCWnA2TnBuNDAwVEJB?=
 =?utf-8?B?ZFZKbjM2N29DRkNLMDVQM0NaN2p2TFlZd3NrbWlvSk0ycXE0WVpOSWF3Mmp0?=
 =?utf-8?B?SjY0Nm54ZDB4REFmdnAwQ3pVQnZPSDJQbzBjdThPd3cwTzEyZjFHYlB3YXZz?=
 =?utf-8?B?ZzNxK3hBL3dWZVJZZ3hUNzcxT2orVnM3ZktPOXVIeW1IMnpodk1PNVQwS2R1?=
 =?utf-8?B?UXRMMDBraXdZM295clQ2aFJTbnhWdXVoUUZ6N2wyaDVKUmJLZjgvY3d3eThz?=
 =?utf-8?B?TVRURWpsSWJqTlBCNnc0c0hrTUhMV0tHK3hsaFExeCs1dUdSZGNzNFk4QXlQ?=
 =?utf-8?B?bjlMNEs1bnZqN1hkM0JnWTVFeldMVkFsNGoyRW53QmpkdnpHdXJVUnZhRDZk?=
 =?utf-8?B?L2F6Z3A4WFVOWXZwQTcrdFpkRnVTYndpK1VlMjArYllvaHB4WFViK0FjM01Y?=
 =?utf-8?B?QnVKVEhYbTZNL25aYi9TT2hiekZIV3lYVTNUUFZhR2xJVTBMWDMrMkxwU0dL?=
 =?utf-8?B?OURtU0Z5QWttdm03cTI2TWc4M0FoTmt0NXJqV3U3T0dvTTJFUG13YmJadi8z?=
 =?utf-8?B?R0JJU0RqNXBQaEVzSUtROU9jZTc4bHRvRDRRMm9YbVhmb3JTVzNWMVZ6MStS?=
 =?utf-8?B?aHVMcEZ1Q1JnS2xQckJFenppQ3FDeDhtZVhLS0pLZnVYcDhzOGJHMFArZWl5?=
 =?utf-8?B?UmV0YWphUEk4eEFBblY3SU5URzdqOHNieC9oWS9QUVJTL3VmblM5a3ZpSFJ4?=
 =?utf-8?B?V1B3bEJVRG9mQXJEOUQvK0xEU3hWUHZoNnI2bDNMTC9QTTljajRRYWhHQ2pJ?=
 =?utf-8?B?ZExmcUhKYmEvRVp6Wk8yRkVYVHBBUytTZVRBQUs0K2RKTlpEcGxINHo4UERo?=
 =?utf-8?B?S0VWei9JczcwNmlkbnZ1UHlGNmlxRzdHKy9NTmtDVnQ2b3hiT1JtOGlHQzRz?=
 =?utf-8?B?SEp2QmJUQ05BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEN1SHY0bGFnNTlzQ3ZTN21pZ0RKNHRhR2ZOaHRpRWZLSVhYdi81VHVPSFRK?=
 =?utf-8?B?Y1M5cklBcGRpMFVhZXVTREV6YXc0bFIyZ1JOY04xUVlrNmhTanBPeGNQM2Vi?=
 =?utf-8?B?NnZTTWZ5Ykc0MVVmalgvRENnS1VQQlRWeWlRNnBydjNUZVlZL3QvWXptTlZU?=
 =?utf-8?B?c1p1dEEwWmhCRG5MVk12T0ZzRXd3V2JSUkc1Q3EyREl1SnR5UDZKZWw0N2RH?=
 =?utf-8?B?RnhVVkpOZFhiUVZETVY3RTgybUtickN5Z25yeHVGeExJNkErQTlVcjRDaTh4?=
 =?utf-8?B?Vm5JOG1rWjIzZFVKc2hwOFRrbjN4Z1YvcndVOS8zOFV4Mk4zTm8vRFZaMnZy?=
 =?utf-8?B?a2w0ZFRYMENmWjg1dUg0RmR2aUhaVU42bk1kbWRKek9FTWliSDJRcjN2UUhj?=
 =?utf-8?B?U211cEJrRVpDcXd5VmhLMU1VeFRWYVRNMWNrUkk5d2NNZ3hQZUlWOGd2SUVl?=
 =?utf-8?B?YkEwVWJWYXpldXlXYXdhcExnazIveUt4N2w5d1pLL0Q3Q1I1SUhBNXV0bjFv?=
 =?utf-8?B?M1FBZmNNMVRySHRpb3BiNmkvL1U5VTNBV20rQUs5NnNabFFPVEJncmI3YVI1?=
 =?utf-8?B?N0JjVDBrcWZSWGF3WmFJMHJMUUpFRkgyNndGcTVyRGZxZTJFSHBEQ1lPL0V3?=
 =?utf-8?B?WEFJTjFseDJhM0dKeEs0a3A3VzFiSWlpcXJ0VTNuK0NQK1AvQW1vUEN5ZitO?=
 =?utf-8?B?bllMSmZ3TzVxYjhzMXBldXY0a3FRTFJSbFQrNkgwZTNPcVE3Smw2OTFNRnBr?=
 =?utf-8?B?MjNLYWozaE1jUEVPNzFnV01ncVdYY1R1ejJMS1M1SmdRWDFiL2Y4bDI0V1p6?=
 =?utf-8?B?V1VFMkJXN3A3Y0srd1VwbmNTcVpYVWQ4anNDZTNJR0xJMDR5ZUdhVHhTQ2kz?=
 =?utf-8?B?d1F2bjU2N016MWlzZDJkTjJrMlpvaVJBd3hnanNBbkVOQnlkYTZJZHc2NWFW?=
 =?utf-8?B?bWRQSjJ4TndRVFlnMXNoOUdxMGdScTRyVFJHK0Y0WXBYREtGTlVDQzJ2aEU1?=
 =?utf-8?B?b2lYWlNRUWRIOVJXT3BoajJBWjJvOUVLdEhqaVoyZWpKa3RwOEF1Tko0QS93?=
 =?utf-8?B?TjdFU2VTUjF5aUJ3Y1Q4TDdvZDV6UFJkQ2RUbzFLOG1ZdjJqQUI1WENDOVBZ?=
 =?utf-8?B?cDhUNlA5clZLckNNTzd6RDJ0RDFURklPSXZ6ZGVMVHlUb1pmRnpiYys3ajUw?=
 =?utf-8?B?V2ZEa0Y2aTIzL2JTbjRXL1MwaGQrSWF1QThsekZ6YkdvbklIbkRGdFJOQ2h5?=
 =?utf-8?B?SVFmb2RtQmV3bWV1WGd1eUtxaTg2cUdGczFrc1pEOG8wS0JEb0RneUlqT1RI?=
 =?utf-8?B?R3pMaWZhSEUwbS9CSERxc1BEYmhiSmxlclBTUXJpT3JMaHBVdWVoUXo3aGRa?=
 =?utf-8?B?dVAvQm1VZ2tWT2xRRmtjSXpOdVJnYVhGVHZGVHlhRGxQTURMMjJkS21laWNL?=
 =?utf-8?B?Ukhkd2lkWVFHVVcvUStHSi9RZDg3M1VkajU3Q3VZTGlQbGRNWHY0YlVJMW5E?=
 =?utf-8?B?S2ZBL2JBU1NtRlR3dGxDZkVJblhDQ3pRZkFIK2k1WXd2alhHTkk3TFNqRE1X?=
 =?utf-8?B?MlZlQ2RFU1pSWElHMmZ0NXNuRjdQcGhYQ1BtZFcxNGFIYmdVU1pvamFXOWEy?=
 =?utf-8?B?dm90cU9KZEFuMkJLM2x5QlJ2bU9CUC9CcVZEZXFDazkzL29idGxwOU13bHQy?=
 =?utf-8?B?Q05CQWxLSTZMRFIxRk14QmJTN3RlWmsyT1MyT3phbHBsM0JoZ3YySEtndGQ1?=
 =?utf-8?B?SDNBSWdaNVZ6enZXZHo4QW1JWnVpclVmWFRhU3F3REJ1MGV2MGJML1Z5am1u?=
 =?utf-8?B?M2c3anJsd09zYUpKZEVVcCtsTXF1M3ZRU3dYckdlTi9PZGN3MUIvZjFZS2w2?=
 =?utf-8?B?cllibjVaUkNNSWljNXdQdUpzZE1XQ2t2SlIyTnBPaFc2b0xQUk5YcTVRM1pZ?=
 =?utf-8?B?dEl5dlRCNFJwaitHQzNiTTdIbUFxQ0NJMUc4UWVJNkFGV04xWlladWtkYnF1?=
 =?utf-8?B?MmpMK1QybUZGaUJzZVRGSVhaWExLRFRabWQ1dTJCcWtCYUtQcy9mWkRlYlI2?=
 =?utf-8?B?cUlibUMyTk1uMTByNjN1enJ3QU1sVGtBQ210N0NKOE4wMUEzeWFmZkkzU2dJ?=
 =?utf-8?Q?YZpOv/8hKhlKtt7jYpcmAUnjT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TtGtcOGO61BhlhqEVx0AfMxNpaOQmWP4NMhGCTxOSOieFA7SaXE40Y5PJiT2ltjNeClvBimuwCOE9HJter3IGKV6eY54ThY2k2i22RgbkEgRKVHqIWnkMXilpzymRlEwuEJKfDw9sMksfi+uud7+1IGlhTen9BeGjbxu2TTr45bbhLd2oZD0rj+QXiUjhSj39GEXGQKHmba7gf+3ePClj4BTiw1MK4Q7zbgzWhADD5Z+MwmUTLBTH6kOGsfXhDZTV896GnuuDShBQIDXE4aeEYeKc24t+SHHCYZ+0bxrYM4BMsH5JrUU+roZqYviz330tSZrrH5TqQhl4CZ2AJM2+W6Q0JMu/aU/K0XnOoiXbLzKefaiGKRFsynHdeXHbz8BYccSNnbDiy+OKC/SMzJ5e5+UtNBCjdOw6DSS+g4sqJ9mPIsid4Q7mB8hWeoec9mb+qH6ymtwcmJFX1K9ucPM7VQ7f4CMiYB7N0xYTmm2t8SONlkU1jyI7cs3kMWq+W6dZVxWOVr2LrrSoC/MzUJWnmwL1HosRNt+AwJ2Fm9/G1qK4+GkvX3SQyEPW7y6O/DJn6OLEnjcMjeH/3n0BY82c2cQhdKvjpADd/b9068a2SM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d86c5-0f52-4ee9-d66d-08de0c74f0d4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 05:29:13.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+mAGEl32euhzc/Sz/lQadVXKlTBNFNSyX8ji7Lx+r5kgKn10CrUj1tPHOj7Il05lj2wjZ5rBZPOG+nCV/wtXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510160040
X-Proofpoint-GUID: 3eEDba3po4JNaFHX7ionysVyOo9SNTox
X-Proofpoint-ORIG-GUID: 3eEDba3po4JNaFHX7ionysVyOo9SNTox
X-Authority-Analysis: v=2.4 cv=QfNrf8bv c=1 sm=1 tr=0 ts=68f082af b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=4E2lKzahQQKPetkxEG8A:9 a=o2aLyrrg7mbx9-oy:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXy0tZIm3VS0l+
 UBLscuJ3mxKdJq5xqdUI6uUHfAtNY+ZrvdUskvo6bqrIN8fmhSxBMM+MPgEpKaGfRnJt0y3BgE/
 +TIHyyV9dRR/qhm+YyYsw5kWXgMD2cUtV9eLtifkmjVVeZ3Tb2GYxJsozf3ugvGjhIDVV63nzoh
 nbysGF4t29HwPjJy4J6Q4meHl+/o0x/PxN0m5CVr3eUh0rT7wxfZN3P2Q7x3Cd4eLQdAw2JZrz9
 YxnRjeXwKyceBJX+R6arjHGdQ6IiMOCSP/vqn7OdvmHBIoN5+Dz2fs/JXPYXHGpJgvQPnJ7odpy
 hCtRiTRBMY8yZteqeQXIqtWoU8h3bp5mnYItCUOqyha2kLaDW4e3sTurdzICB6uwo7N84CZ7Rzc
 JquXBlhrUL7L8X5ng8lyAda73Hj2rpVZRFrdnmTL+btsLu0kxuk=

Maybe these files should have copyright notices?  Did they use to have 
any?  How about this for D files:

/*
  * Oracle Linux DTrace.
  * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */

This for the .sh file:

# Oracle Linux DTrace.
# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at
# http://oss.oracle.com/licenses/upl.

I was thinking it might be nice to explain the printa("%@") format 
stuff, but it appears in too many places.  So... meh, forget about it.

Anyhow, a few corrections below but mostly just minor comments for you 
to consider.

On 10/15/25 21:31, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> This is a set of new example scripts.  These are basic programs to
> demonstrate specific functionality.  For example to get an overview
> of system calls executed, processes running, I/O statistics, etc.
> There is also an example of a D script embedded in a shell script.
>
> Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
>
> diff --git a/examples/getting-started/activity.d b/examples/getting-started/activity.d

There are a few examples of foo.d and foo1.d examples.  How about 
diff'ing them and squeezing out as many gratuitous differences as 
possible, so that if a user tries a "diff foo.d foo1.d" it is blatantly 
obvious what the differences are between the two nearly identical files.

> new file mode 100755
> index 000000000..8a5b687aa
> --- /dev/null
> +++ b/examples/getting-started/activity.d
> @@ -0,0 +1,110 @@
> +/*
> + *  NAME
> + *    activity.d - report on process create, exec and exit
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s activity.d
> + *
> + *  DESCRIPTION
> + *    Show the processes that are created, executed and exited
> + *    while the script is running.
> + *
> + *  NOTES
> + *    - This script uses the proc provider to trace the following process
> + *    activities: create, exec, and exit.
> + *
> + *    - This script is guaranteed to produce results if you start one or
> + *    more commands while the script is running.  There are two ways to do
> + *    this:
> + *    o Execute this script in the background, and type in the command(s).
> + *    o Alternatively, run the script in the foreground and type the
> + *    command(s) in a separate terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Associative arrays are used to store the information from the
> + *    proc provider.

Memory leak?  Where is their memory freed?

> + *    - The DTrace User Guide documents the proc provider probe
> + *    arguments like args[0] and also structures like psinfo_t.  It is
> + *    strongly recommended to check the documentation for this info.
> + */
> +
> +/*
> + *  Fires when a process (or process thread) is created using fork() or
> + *  vfork(), which both invoke clone().  The psinfo_t corresponding to
> + *  the new child process is pointed to by args[0].
> + */
> +proc:::create
> +{
> +/*
> + *  Store the PID of both the parent and child process from the psinfo_t
> + *  structure pointed to by args[0].  Use 3 associative arrays to store the
> + *  various items of interest.
> + */
> +  childpid  = args[0]->pr_pid;
> +  parentpid = args[0]->pr_ppid;
> +
> +/*
> + *  Store the parent PID of the new child process.
> + */
> +  p_pid[childpid] = parentpid;
> +
> +/*
> + *  Parent command name.
> + */
> +  p_name[childpid] = execname;
> +
> +/*
> + *  Child has not yet been exec'ed.
> + */
> +  p_exec[childpid] = "";
> +}
> +
> +/*
> + *  The process starts.  In case proc:::create has fired, store the
> + *  absolute time and the full name of the child process.
> + */
> +proc:::exec
> +/ p_pid[pid] != 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +}
> +
> +/*
> + *  The process starts, but in this case, proc:::create has not fired.
> + *  In addition to storing the name of the child process, store the
> + *  various other items of interest.
> + */
> +proc:::exec
> +/ p_pid[pid] == 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +  p_pid[pid]  = ppid;
> +  p_name[pid] = execname;
> +}
> +
> +/*
> + *  The process exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] != ""/
> +{
> +  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
> +}
> +
> +/*
> + *  The process has forked itself and exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] == ""/
> +{
> +  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
> +}
> diff --git a/examples/getting-started/activity1.d b/examples/getting-started/activity1.d
> new file mode 100755
> index 000000000..692e8c343
> --- /dev/null
> +++ b/examples/getting-started/activity1.d
> @@ -0,0 +1,126 @@
> +/*
> + *  NAME
> + *    activity1.d - report on process create, exec and exit
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s activity1.d '"bash"'
> + *
> + *  DESCRIPTION
> + *    Show the processes that are created, executed and exited
> + *    in the bash shell while the script is running.
> + *
> + *  NOTES
> + *    - This script uses the proc provider to trace the following process
> + *    activities: create, exec, and exit.
> + *
> + *    - A predicate is used to ensure that only those processes executed
> + *    by bash are traced.  While this could be hard coded, here the name
> + *    is passed in as an argument.
> + *
> + *    - This script is guaranteed to produce results if you execute
> + *    one or more commands while the script is running.  There are two
> + *    ways to do this:
> + *    o Execute this script in the background, and type in the command(s).
> + *    o Alternatively, run the script in the foreground and type the
> + *    command(s) in a separate terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Associative arrays are used to store the information from the
> + *    proc provider.

Again, memory leaks?  Free memory when done?

> + *
> + *    - There is on important subtlety to pay attention to.  Since
> + *    bash (and other shells) optimize for performance, it may happen
> + *    that proc:::create does not fire, because there is no call to
> + *    fork(), clone(), etc.  This is why two different probes for
> + *    proc:::exec are defined.
> + *
> + *    - The DTrace User Guide documents the proc provider probe
> + *    arguments like args[0] and also structures like psinfo_t.  It is
> + *    strongly recommended to check the documentation for this info.
> + */
> +
> +/*
> + *  Fires when a process (or process thread) is created using fork() or
> + *  vfork(), which both invoke clone().  The psinfo_t corresponding to
> + *  the new child process is pointed to by args[0].
> + *
> + *  Use a predicate to only execute the clause if the condition is met.
> + *  In this case that means that only processes executed in the bash
> + *  shell are traced.
> + */
> +proc:::create
> +/ execname == $1 /
> +{
> +/*
> + *  Store the PID of both the parent and child process from the psinfo_t
> + *  structure pointed to by args[0].  Use 3 associative arrays to store the
> + *  various items of interest.
> + */
> +  childpid  = args[0]->pr_pid;
> +  parentpid = args[0]->pr_ppid;
> +
> +/*
> + *  Store the parent PID of the new child process.
> + */
> +  p_pid[childpid] = parentpid;
> +
> +/*
> + *  Parent command name.
> + */
> +  p_name[childpid] = execname;
> +
> +/*
> + *  Child has not yet been exec'ed.
> + */
> +  p_exec[childpid] = "";
> +}
> +
> +/*
> + *  The process starts.  In case proc:::create has fired, store the
> + *  absolute time and the full name of the child process.
> + */
> +
> +proc:::exec
> +/ execname == $1 && p_pid[pid] != 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +}
> +
> +/*
> + *  The process starts, but in this case, proc:::create has not fired.
> + *  In addition to storing the name of the child process, store the
> + *  various other items of interest.
> + */
> +proc:::exec
> +/ execname == $1 && p_pid[pid] == 0 /
> +{
> +  time[pid]   = timestamp;
> +  p_exec[pid] = args[0];
> +  p_pid[pid]  = ppid;
> +  p_name[pid] = execname;
> +}
> +
> +/*
> + *  The process exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] != ""/
> +{
> +  printf("%-16s (%d) executed %s (%d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], p_exec[pid], pid, (timestamp - time[pid])/1000);
> +}
> +
> +/*
> + *  The process has forked itself and exits.  Print the information.
> + */
> +proc:::exit
> +/p_pid[pid] != 0 && p_exec[pid] == ""/
> +{
> +  printf("%-16s (%d) forked itself (as %d) for %d microseconds\n",
> +    p_name[pid], p_pid[pid], pid, (timestamp - time[pid])/1000);
> +}
> diff --git a/examples/getting-started/calltrace.d b/examples/getting-started/calltrace.d
> new file mode 100755
> index 000000000..a0ff14c15
> --- /dev/null
> +++ b/examples/getting-started/calltrace.d
> @@ -0,0 +1,88 @@
> +/*
> + *  NAME
> + *    calltrace.d - time all system calls for the cp command
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s calltrace.d
> + *
> + *  DESCRIPTION
> + *    List and time all the system calls that are executed while
> + *    a file is copied with the cp command.

Well, actually, when any "cp" is run.  No specific file... and possibly 
even something else named "cp".

> + *
> + *  NOTES
> + *    - This script traces all system calls that are executed when
> + *    the cp command is used to copy a file.

s/ to copy a file//

> + *
> + *    This means that you need to execute the cp command while the
> + *    script is running.  There are two ways to do this:
> + *    o Execute this script in the background, and type in the cp command.
> + *    o Alternatively, run the script in the foreground and type
> + *    the cp command in a separate terminal window on the same system.
> + *
> + *    - You can use any file to copy, but you can also generate a file
> + *    and then copy it.  This is an example how to create a 500 MB file,
> + *    copy it with the cp command and remove both files again:
> + *    $ dd if=/dev/zero of=tmp_file bs=100M seek=5 count=0
> + *    $ cp tmp_file tmp_file2
> + *    $ rm tmp_file tmp_file2
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  Set the base value of the timer.  This is used as an offset in the
> + *  return probe to calculate the time spent in a system call.
> + *
> + *  A predicate is used to select the cp command.  All other commands
> + *  skip executing the clause and do not set ts_base.
> + */
> +syscall:::entry
> +/ execname == "cp" /
> +{
> +  self->ts_base = timestamp;
> +}
> +
> +/*
> + *  The predicate ensures that the base timing has been set.
> + *  Since this is only done for the cp command, no information
> + *  is collected for the other processes.
> + */
> +syscall:::return
> +/self->ts_base != 0/
> +{
> +/*
> + *  Compute the time passed since the entry probe fired and
> + *  convert the nanosecond value to microseconds.
> + *
> + *  Update the aggregation called totals with this time.  The
> + *  execname (which is cp here) and the system call that caused
> + *  the probe to fire, are the fields in the key.
> + */
> +  this->time_call = (timestamp - self->ts_base)/1000;
> +  @totals[execname,probefunc] = sum(this->time_call);
> +
> +/*
> + *  Free the storage for ts_base.
> + */
> +  self->ts_base = 0;
> +}
> +
> +/*
> + *  Print the results.  Use printf() to print a description of
> + *  the contents of the aggregation.  The format string in printa()
> + *  is used to create a table lay-out.
> + */
> +END
> +{
> +  printf("System calls executed and their duration:\n");
> +  printa("%15s executed %18s - this took a total of %@8d microseconds\n",
> +         @totals);
> +}
> diff --git a/examples/getting-started/countcalls.d b/examples/getting-started/countcalls.d
> new file mode 100755
> index 000000000..fb22b2aba
> --- /dev/null
> +++ b/examples/getting-started/countcalls.d
> @@ -0,0 +1,38 @@
> +/*
> + *  NAME
> + *    countcalls.d - count the open(), read(), and write() calls for 5 seconds
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s countcalls.d
> + *
> + *  DESCRIPTION
> + *    List and count the calls to write(), read(), and open() executed, while
> + *    the script is running.  The script automatically stops after 5 seconds.
> + *
> + *  NOTES
> + *    - This script uses the profile provider to stop the tracing after a
> + *    certain amount of time.  This time can easily be adjusted by changing.
> + *    the number and unit.
> + *
> + *    - An anonymous aggregation is used to store the results.  Like a named
> + *    aggregation, it is automatically printed when the tracing terminates.
> + */
> +
> +/*
> + *  Fires every 5 seconds.  Since exit() is called, the tracing terminates
> + *  the first time this probe fires and the clause is executed.
> + */
> +profile:::tick-5sec
> +{
> +  exit(0);
> +}
> +
> +/*
> + *  Create the key by concatenating the function name and a string.  An
> + *  alternative is to only use probefunc as a key and print the string as
> + *  part of a printa() in the END probe: printa("%s () calls\n",@);

Or just drop the "() calls" text... what's it good for anyhow?

> + */
> +syscall::write:entry, syscall::read:entry, syscall::open:entry
> +{
> +  @[strjoin(probefunc,"() calls")] = count();
> +}
> diff --git a/examples/getting-started/countprogs.d b/examples/getting-started/countprogs.d
> new file mode 100755
> index 000000000..14d791b24
> --- /dev/null
> +++ b/examples/getting-started/countprogs.d
> @@ -0,0 +1,37 @@
> +/*
> + *  NAME
> + *    countprogs.d - count processes invoked by a specific user
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s countprogs.d

Synopsis is missing the uid on the command line.

> + *
> + *  DESCRIPTION
> + *    List and count every processes that is started by the user, while
> + *    this script runs.  The user id is passed in as an argument to the
> + *    script.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - To ensure a process is started while the script is running,
> + *    either execute this script in the background, and type in one
> + *    or more commands, or run it in the foreground and type in the
> + *    command(s) in a separate terminal window on the same system.
> + *
> + *    - The results of an aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  Fires on every process that starts execution.  An aggregation called
> + *  proc_name uses the executable name as a key and counts the number of
> + *  times this executable, or process, is started.
> + */
> +proc:::exec
> +/uid == $1/
> +{
> +  @proc_name[execname] = count();
> +}
> diff --git a/examples/getting-started/countsyscalls.d b/examples/getting-started/countsyscalls.d
> new file mode 100755
> index 000000000..31fa750e2
> --- /dev/null
> +++ b/examples/getting-started/countsyscalls.d
> @@ -0,0 +1,31 @@
> +/*
> + *  NAME
> + *    countsyscalls.d - count system calls invoked by a specific user
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s countsyscalls.d

Synopsis is missing the uid on the command line.

> + *
> + *  DESCRIPTION
> + *    List and count all the system calls executed by the specified user id.
> + *    The user id is passed in as an argument to the script.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results of the aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  Fires on every system call executed.  An aggregation called syscalls
> + *  uses the function name as a key and counts the number of calls to this
> + *  function.
> + */
> +syscall:::entry
> +/pid == $1/
> +{
> +  @syscalls[probefunc] = count();
> +}
> diff --git a/examples/getting-started/cswpercpu.d b/examples/getting-started/cswpercpu.d
> new file mode 100755
> index 000000000..e2cac6d9c
> --- /dev/null
> +++ b/examples/getting-started/cswpercpu.d
> @@ -0,0 +1,81 @@
> +/*
> + *  NAME
> + *    cswpercpu.d - print the number of context switches per CPU per second
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s cswpercpu.d
> + *
> + *  DESCRIPTION
> + *    Every second, print the CPU id, the number of context switches each
> + *    CPU performed, plus the total number of context switches executed
> + *    across all the CPUs.  For each info block, include a time stamp.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results are stored in an aggregation called cswpersec.
> + *    Every second, the results are printed with printa() and the
> + *    aggregation is cleared.
> + *
> + *    - In addition to using the CPU ID as a key in the cswpersec
> + *    aggregation, also the string "total" is used.  This entry
> + *    is always printed last, because by default, printa() prints
> + *    the results sorted by the value.  The total count for any of
> + *    the CPU Ids is always equal or less than "total".
> + */
> +
> +/*
> + *  To avoid that the carefully crafted output is mixed with the
> + *  default output by the dtrace command, enable quiet mode.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  Print the header.
> + */
> +BEGIN
> +{
> +  printf("%-20s %5s %15s", "Timestamp", "CPU", "#csw");
> +}
> +
> +/*
> + *  Fires when a process is scheduled to run on a CPU.
> + */
> +sched:::on-cpu
> +{
> +/*
> + *  Convert the CPU ID to a string.  This needs to be done because
> + *  key "total" is a string.
> + */
> +  cpustr = lltostr(cpu);

Dangerous place to use a global variable.  Use this->.

> +/*
> + *  Update the count.
> + */
> +  @cswpersec[cpustr]  = count();
> +  @cswpersec["total"] = count();
> +}
> +
> +/*
> + *  Fires every second.
> + */
> +profile:::tick-1sec
> +{
> +/*
> + *  Print the date and time first
> + */
> +  printf("\n%-20Y ", walltimestamp);
> +
> +/*
> + *  Print the aggregated counts for each CPU and the total for all CPUs.
> + *  Use some formatting magic to get a special table lay-out.
> + */
> +  printa("%5s %@15d\n                     ", @cswpersec);
> +
> +/*
> + *  Reset the aggregation.
> + */
> +  clear(@cswpersec);
> +}
> diff --git a/examples/getting-started/daterun.d b/examples/getting-started/daterun.d
> new file mode 100755
> index 000000000..f77dc736e
> --- /dev/null
> +++ b/examples/getting-started/daterun.d
> @@ -0,0 +1,35 @@
> +/*
> + *  NAME
> + *    daterun.d - display arguments to write() for the date command
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s daterun.d
> + *
> + *  DESCRIPTION
> + *    Trace the calls to write(), but only when executed by the date
> + *    command.  For such calls, print the file descriptor, the output
> + *    string, and the number of bytes printed.
> + *
> + *  NOTES
> + *    - Execute this script in the background, and type in "date", or
> + *    run it in the foreground and type in "date" in a separate window.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The output string is stored in arg1 and contains a newline (\n)
> + *    character.  This is why the byte count is printed on a separate line.
> + */
> +
> +syscall::write:entry
> +/execname == "date"/
> +{
> +/*
> + *  Use copyinstr() to copy the string from the user address into a

I guess, but it might be more helpful to say that we're copying from 
user space into a DTrace buffer in kernel space.

> + *  DTrace buffer.  This function returns a pointer to the buffer.
> + */
> +  printf("%s (fd=%d output=%s bytes=%d)\n",probefunc, arg0,
> +                                           copyinstr(arg1), arg2);
> +}
> diff --git a/examples/getting-started/diskact.d b/examples/getting-started/diskact.d
> new file mode 100755
> index 000000000..77920035b
> --- /dev/null
> +++ b/examples/getting-started/diskact.d
> @@ -0,0 +1,99 @@
> +/*
> + *  NAME
> + *    diskact.d - for block devices show the distribution of I/O throughput
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s diskact.d
> + *
> + *  DESCRIPTION
> + *    The io provider is used to gather the I/O throughput for the block
> + *    devices on the system.  A histogram of the results is printed.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *   - The bufinfo_t structure is the abstraction that describes an I/O
> + *   request.  The buffer that corresponds to an I/O request is pointed
> + *   to by args[0] in the start, done, wait-start, and wait-done probes
> + *   available through the io provider.
> + *
> + *   - Detailed information about this data structure can be found in
> + *   the DTrace User Guide.  For more details, you can also check
> + *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
> + *   DTrace version number(s) in /usr/lib64/dtrace.

It's a kernel version number.

> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  To avoid that the carefully crafted output is mixed with the
> + *  default output by the dtrace command, enable quiet mode.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  The pointer to bufinfo_t is in args[0].  Here it is used to get
> + *  b_edev (the extended device) and b_blkno (the expanded block
> + *  number on the device).  These two fields are used in the key for
> + *  associative array io_start.
> + */
> +io:::start
> +{
> +  io_start[args[0]->b_edev, args[0]->b_blkno] = timestamp;
> +}
> +
> +io:::done
> +/ io_start[args[0]->b_edev, args[0]->b_blkno] /
> +{
> +/*
> + *  We would like to show the throughput to a device in KB/sec, but
> + *  the values that are measured are in bytes and nanoseconds.
> + *  You want to calculate the following:
> + *
> + *  bytes / 1024
> + *  ------------------------
> + *  nanoseconds / 1000000000
> + *
> + *  As DTrace uses integer arithmetic and the denominator is usually
> + *  between 0 and 1 for most I/O, the calculation as shown will lose
> + *  precision.  So, restate the fraction as:
> + *
> + *  bytes         1000000000      bytes * 976562
> + *  ----------- * ------------- = --------------
> + *  nanoseconds   1024            nanoseconds
> + *
> + *  This is easy to calculate using integer arithmetic.
> + */
> +
> +  this->elapsed = timestamp -  io_start[args[0]->b_edev, args[0]->b_blkno];
> +
> +/*
> + *  The pointer to structure devinfo_t is in args[1].  Use this to get the
> + *  name (+ instance/minor) and the pathname of the device.
> + *
> + *  Use the formula above to compute the throughput.  The number of bytes
> + *  transferred is in bufinfo_t->b_bcount
> + */
> +  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
> +                 strjoin("path = ",args[1]->dev_pathname)] =
> +                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
> +
> +/*
> + *  Free the storage for the entry in the associative array.
> + */
> +  io_start[args[0]->b_edev, args[0]->b_blkno] = 0;
> +}
> +
> +/*
> + *  Use a format string to print the aggregation.
> + */
> +END
> +{
> +  printa(" %s (%s)\n%@d\n", @io_throughput);
> +}
> diff --git a/examples/getting-started/errno.d b/examples/getting-started/errno.d
> new file mode 100755
> index 000000000..b22f4b577
> --- /dev/null
> +++ b/examples/getting-started/errno.d
> @@ -0,0 +1,48 @@
> +/*
> + *  NAME
> + *    errno.d - list and count the system calls with a non-zero errno value
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s errno.d
> + *
> + *  DESCRIPTION
> + *    Trace every system call that returns a non-zero value in errno.
> + *    Show the name of the function, the value of errno and how often
> + *    this function returned a non-zero value for errno.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The value of errno is available upon the return from the system call.
> + *
> + *    - To present the results in a compact form, we use an aggregation
> + *    called syscalls.  Otherwise we may get several screens with the
> + *    information.  Plus that we then can't easily count the functions.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  Use the predicate to only allow non-zero errno values that are
> + *  within the range for errno.
> + */
> +syscall:::return
> +/ errno > 0 && errno <= ERANGE /
> +{
> +  @syscalls[probefunc,errno] = count();
> +}
> +
> +/*
> + *  The printf() line prints the header of the table to follow.
> + */
> +END
> +{
> +  printf("%20s %5s %5s\n\n","syscall","errno","count");
> +  printa("%20s %5d %@5d\n",@syscalls);
> +}
> diff --git a/examples/getting-started/errno1.d b/examples/getting-started/errno1.d
> new file mode 100755
> index 000000000..01f3a229b
> --- /dev/null
> +++ b/examples/getting-started/errno1.d
> @@ -0,0 +1,136 @@
> +/*
> + *  NAME
> + *    errno1.d - list and count the system calls with a non-zero errno value
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s errno1.d
> + *
> + *  DESCRIPTION
> + *    Trace every system call that returns a non-zero value in errno.
> + *    Show the process name, the name of the function it executes, the
> + *    user id, the name of the error that corresponds to the value of
> + *    errno, a descriptive message for the error, and how often this
> + *    combination occurred.

In my opinion, the documentation is less illuminating than the code!  
Listing here in prose what will later be clear from code makes the 
script less readable.

> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The value of errno is available upon the return from the system call.
> + *
> + *    - To present the results in a compact form, we use an aggregation
> + *    called syscalls.  Otherwise we may get several screens with the
> + *    information.  Plus that we then can't easily count the functions.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +BEGIN
> +{
> +/*
> + *  Define an associative array called errno_code that maps a value of errno
> + *  to a string with the name of the error.  This information can be found
> + *  in file /usr/include/asm-generic/errno-base.h.

In a way.  Maybe it'd be more precise to say that one is mapping from 
the errno to the enum name.

> + *
> + *  File /usr/include/asm-generic/errno.h has the codes for calling a system
> + *  call that does not exist.  This has not been used here though.
> + */
> +  errno_code[EPERM]   = "EPERM";    /* Operation not permitted */
> +  errno_code[ENOENT]  = "ENOENT";   /* No such file or directory */
> +  errno_code[ESRCH]   = "ESRCH";    /* No such process */
> +  errno_code[EINTR]   = "EINTR";    /* Interrupted system call */
> +  errno_code[EIO]     = "EIO";      /* I/O error */
> +  errno_code[ENXIO]   = "ENXIO";    /* No such device or address */
> +  errno_code[E2BIG]   = "E2BIG";    /* Argument list too long */
> +  errno_code[ENOEXEC] = "ENOEXEC";  /* Exec format error */
> +  errno_code[EBADF]   = "EBADF";    /* Bad file number */
> +  errno_code[ECHILD]  = "ECHILD";   /* No child processes */
> +  errno_code[EAGAIN]  = "EAGAIN";   /* Try again or operation would block */
> +  errno_code[ENOMEM]  = "ENOMEM";   /* Out of memory */
> +  errno_code[EACCES]  = "EACCES";   /* Permission denied */
> +  errno_code[EFAULT]  = "EFAULT";   /* Bad address */
> +  errno_code[ENOTBLK] = "ENOTBLK";  /* Block device required */
> +  errno_code[EBUSY]   = "EBUSY";    /* Device or resource busy */
> +  errno_code[EEXIST]  = "EEXIST";   /* File exists */
> +  errno_code[EXDEV]   = "EXDEV";    /* Cross-device link */
> +  errno_code[ENODEV]  = "ENODEV";   /* No such device */
> +  errno_code[ENOTDIR] = "ENOTDIR";  /* Not a directory */
> +  errno_code[EISDIR]  = "EISDIR";   /* Is a directory */
> +  errno_code[EINVAL]  = "EINVAL";   /* Invalid argument */
> +  errno_code[ENFILE]  = "ENFILE";   /* File table overflow */
> +  errno_code[EMFILE]  = "EMFILE";   /* Too many open files */
> +  errno_code[ENOTTY]  = "ENOTTY";   /* Not a typewriter */
> +  errno_code[ETXTBSY] = "ETXTBSY";  /* Text file busy */
> +  errno_code[EFBIG]   = "EFBIG";    /* File too large */
> +  errno_code[ENOSPC]  = "ENOSPC";   /* No space left on device */
> +  errno_code[ESPIPE]  = "ESPIPE";   /* Illegal seek */
> +  errno_code[EROFS]   = "EROFS";    /* Read-only file system */
> +  errno_code[EMLINK]  = "EMLINK";   /* Too many links */
> +  errno_code[EPIPE]   = "EPIPE";    /* Broken pipe */
> +  errno_code[EDOM]    = "EDOM";     /* Math argument out of domain of func */
> +  errno_code[ERANGE]  = "ERANGE";   /* Math result not representable */
> +
> +/*
> + *  This associative array called errno_msg has a brief description of the
> + *  error for each non-zero value of errno.
> + */

I think it would make more sense to make this a function of errno rather 
than of errno_code[errno].  Less overhead (by dealing with ints rather 
than with strings) and one less conversion (instead of int -> string -> 
msg, just do int -> msg).

> +  errno_msg["EPERM"]   = "Operation not permitted";
> +  errno_msg["ENOENT"]  = "No such file or directory";
> +  errno_msg["ESRCH"]   = "No such process";
> +  errno_msg["EINTR"]   = "Interrupted system call";
> +  errno_msg["EIO"]     = "I/O error";
> +  errno_msg["ENXIO"]   = "No such device or address";
> +  errno_msg["E2BIG"]   = "Argument list too long";
> +  errno_msg["ENOEXEC"] = "Exec format error";
> +  errno_msg["EBADF"]   = "Bad file number";
> +  errno_msg["ECHILD"]  = "No child processes";
> +  errno_msg["EAGAIN"]  = "Try again or operation would block";
> +  errno_msg["ENOMEM"]  = "Out of memory";
> +  errno_msg["EACCES"]  = "Permission denied";
> +  errno_msg["EFAULT"]  = "Bad address";
> +  errno_msg["ENOTBLK"] = "Block device required";
> +  errno_msg["EBUSY"]   = "Device or resource busy";
> +  errno_msg["EEXIST"]  = "File exists";
> +  errno_msg["EXDEV"]   = "Cross-device link";
> +  errno_msg["ENODEV"]  = "No such device";
> +  errno_msg["ENOTDIR"] = "Not a directory";
> +  errno_msg["EISDIR"]  = "Is a directory";
> +  errno_msg["EINVAL"]  = "Invalid argument";
> +  errno_msg["ENFILE"]  = "File table overflow";
> +  errno_msg["EMFILE"]  = "Too many open files";
> +  errno_msg["ENOTTY"]  = "Not a typewriter";
> +  errno_msg["ETXTBSY"] = "Text file busy";
> +  errno_msg["EFBIG"]   = "File too large";
> +  errno_msg["ENOSPC"]  = "No space left on device";
> +  errno_msg["ESPIPE"]  = "Illegal seek";
> +  errno_msg["EROFS"]   = "Read-only file system";
> +  errno_msg["EMLINK"]  = "Too many links";
> +  errno_msg["EPIPE"]   = "Broken pipe";
> +  errno_msg["EDOM"]    = "Math argument out of domain of func";
> +  errno_msg["ERANGE"]  = "Math result not representable";
> +}
> +
> +/*
> + *  Store the information in an aggregation called syscalls.
> + */
> +syscall:::return
> +/ errno > 0 && errno <= ERANGE /
> +{
> +  @syscalls[execname,probefunc,uid,errno_code[errno],
> +            errno_msg[errno_code[errno]]] = count();
> +}
> +
> +/*
> + *  The printf() line prints the header of the table to follow.
> + */
> +END
> +{
> +  printf("%-20s %-16s %-6s %-7s %-35s %5s\n\n","PROCESS","SYSCALL","UID",
> +         "ERROR","DESCRIPTION","COUNT");
> +  printa("%-20s %-16s %-6d %-7s %-35s %@5d\n",@syscalls);
> +}
> diff --git a/examples/getting-started/execcalls.d b/examples/getting-started/execcalls.d
> new file mode 100755
> index 000000000..f12753cbf
> --- /dev/null
> +++ b/examples/getting-started/execcalls.d
> @@ -0,0 +1,44 @@
> +/*
> + *  NAME
> + *    execcalls.d - show all processes that start executing
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s execcals.d

Missing an el:  execcalls.

> + *
> + *  DESCRIPTION
> + *    The probe in this script traces the exec() system call.  It
> + *    fires whenever a process loads a new process image.
> + *
> + *  NOTES
> + *    - This script traces the processes that start executing while
> + *    the script is running.  If no process is started during the
> + *    time that the script runs, no output is produced.
> + *
> + *    If that is the case, you can always execute a command yourself
> + *    while this script is running.  One such command is "date" that
> + *    causes the probe to fire.
> + *
> + *    - If you'd like to execute command(s) while the script is running,
> + *    execute this script in the background, and type in one or more
> + *    commands.  If you started the script in the foreground, type in
> + *    the command(s) in a separate terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + */
> +
> +proc:::exec
> +/ args[0] != NULL /
> +{
> +/*
> + *  This information is from the DTrace user guide.  The proc:::exec
> + *  probe makes a pointer to a char available in args[0].  This has
> + *  the path to the new process image.
> + *
> + *  The strjoin() function is used to add a newline (\n) to the
> + *  string that is to be printed.
> + */
> +  trace(strjoin(stringof(args[0]),"\n"));

Easier to write trace(stringof(args[0])); trace("\n"); maybe?

> +}
> diff --git a/examples/getting-started/fsact.sh b/examples/getting-started/fsact.sh
> new file mode 100755
> index 000000000..1919460db
> --- /dev/null
> +++ b/examples/getting-started/fsact.sh
> @@ -0,0 +1,109 @@
> +#!/bin/bash
> +#
> +#------------------------------------------------------------------------------
> +# This example embeds a DTrace script in a bash script.  The bash script
> +# is used to set the variables needed in the D script.
> +#
> +# fsact -- Display cumulative read and write activity across a file
> +#          system device
> +#
> +#          Usage: fsact [<filesystem>]
> +#------------------------------------------------------------------------------
> +
> +#------------------------------------------------------------------------------
> +# If no file system is specified, assume /
> +#------------------------------------------------------------------------------
> +[ $# -eq 1 ] && FSNAME=$1 || FSNAME="/"
> +[ ! -e $FSNAME ] && echo "$FSNAME not found" && exit 1
> +
> +#------------------------------------------------------------------------------
> +# Determine the mountpoint, major and minor numbers, and file system size.
> +#------------------------------------------------------------------------------
> +MNTPNT=$(df $FSNAME | gawk '{ getline; print $1; exit }')
> +MAJOR=$(printf "%d\n" 0x$(stat -Lc "%t" $MNTPNT))
> +MINOR=$(printf "%d\n" 0x$(stat -Lc "%T" $MNTPNT))
> +FSSIZE=$(stat -fc "%b" $FSNAME)
> +
> +#------------------------------------------------------------------------------
> +# Run the embedded D script.
> +#------------------------------------------------------------------------------
> +sudo dtrace -qs /dev/stdin << EOF
> +/*
> + *  DESCRIPTION
> + *    The io:::done probe from the io provider is used to get read and write
> + *    statistics.  In particular, the id of the block that is accessed for
> + *    the read or write operation.
> + */
> +
> +BEGIN
> +{
> +  printf("Show how often blocks are accessed in read and write operations\n");
> +  printf("The statistics are updated every 5 seconds\n");
> +  printf("The block IDs are normalized to a scale from 0 to 10\n");
> +  printf("The file system is %s\n","$FSNAME");
> +  printf("The mount point is %s\n","$MNTPNT");
> +  printf("The file system size is %s bytes\n","$FSSIZE");
> +}
> +
> +/*
> + *  This probe fires after an I/O request has been fulfilled. The
> + *  done probe fires after the I/O completes, but before completion
> + *  processing has been performed on the buffer.
> + *
> + *  A pointer to structure devinfo_t is in args[1].  This is used
> + *  to get the major and minor number of the device.
> + *
> + *  A pointer to structure bufinfo_t is in args[0].  This is used
> + *  to get the flags and the block number.
> + */
> +io:::done
> +/ args[1]->dev_major == $MAJOR && args[1]->dev_minor == $MINOR /
> +{
> +/*
> + *  Check if B_READ has been set and assign a string to io_type
> + *  based on the outcome of the check.  This string is used as
> + *  the key in aggregation io_stats.
> + */
> +  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
> +
> +/*
> + *  Structure member b_lblkno identifies which logical block on the
> + *  device is to be accessed.  Normalize thise block number as an
> + *  integer in the range 0 to 10.
> + */
> +  blkno = (args[0]->b_blkno)*10/$FSSIZE;
> +
> +/*
> + *  Aggregate blkno linearly over the range 0 to 10 in steps of 1.
> + */
> +  @io_stats[io_type] = lquantize(blkno,0,10,1)
> +}
> +
> +/*
> + *  Fires every 5 seconds.
> + */
> +profile:::tick-5s
> +{
> +  printf("%Y\n",walltimestamp);
> +
> +/*
> + *  Display the contents of the aggregation.
> + */
> +  printa("%s\n%@d\n",@io_stats);
> +
> +/*
> + *  Reset the aggregation every time this probe fires
> + */
> +  clear(@io_stats);
> +}
> +
> +/*
> + *  Fires every 21 seconds.  Since exit() is called, the tracing terminates
> + *  the first time this probe fires and the clause is executed.
> + */
> +profile:::tick-21s
> +{
> +  printf("Tracing is terminated now\n");
> +  exit(0);
> +}
> +EOF
> diff --git a/examples/getting-started/goodbye.d b/examples/getting-started/goodbye.d
> new file mode 100755
> index 000000000..01330d97e
> --- /dev/null
> +++ b/examples/getting-started/goodbye.d
> @@ -0,0 +1,29 @@
> +/*
> + *  NAME
> + *    goodbye.d - demonstrate the END probe
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s goodbye.d
> + *
> + *  DESCRIPTION
> + *    Demonstrates the use of the END probe.  Function trace() is
> + *    used to print a string.
> + *
> + *  NOTES
> + *    - The advantage of trace() is that it is simple and does not
> + *    require a format string.  If more control over the output is
> + *    needed, printf() is a good alternative.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + */
> +
> +/*
> + *  The END probe fires once when the tracing has terminated.
> + */
> +END
> +{
> +  trace("Goodbye");
> +}
> diff --git a/examples/getting-started/hello.d b/examples/getting-started/hello.d
> new file mode 100755
> index 000000000..cb53039c0
> --- /dev/null
> +++ b/examples/getting-started/hello.d
> @@ -0,0 +1,21 @@
> +/*
> + *  NAME
> + *    hello.d - demonstrate the BEGIN probe
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s hello.d
> + *
> + *  DESCRIPTION
> + *    Demonstrate the use of the BEGIN probe.  Function trace() is
> + *    used to print a string.  The exit() function terminates the
> + *    tracing.
> + */
> +
> +/*
> + *  The BEGIN probe fires once when tracing starts.

Since this is such an introductory example, the reader might wonder when 
tracing starts.  E.g., there is an END probe that clearly fires at the 
end, but when is that?  Maybe say the BEGIN probe fires when the D 
script starts up?  There is nothing external it's waiting on.

> + */
> +BEGIN
> +{
> +  trace("Hello, world");
> +  exit(0);
> +}
> diff --git a/examples/getting-started/readsizes.d b/examples/getting-started/readsizes.d
> new file mode 100755
> index 000000000..222c63513
> --- /dev/null
> +++ b/examples/getting-started/readsizes.d
> @@ -0,0 +1,39 @@
> +/*
> + *  NAME
> + *    readsizes.d - show the distribution of bytes read when running find
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s readsizes.d
> + *
> + *  DESCRIPTION
> + *    Trace the calls to read() and use a predicate to only select those
> + *    calls executed as part of executing the find command.  For such
> + *    calls, show the distribution of the sizes.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results are stored in an aggregation called dist with
> + *    the string "find" as the key.
> + *
> + *    - The results of an aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  A predicate is used to guarantee that the clause for the read:entry
> + *  probe is only executed in case the call to read() was issued by the
> + *  find command.
> + *
> + *  The quantize() function is used to show the distribution of the sizes
> + *  read, or attempted to be read, by the read() call.  This value is
> + *  stored in arg2.

I suppose it's "stored" but that doesn't feel right to me.  The value is 
"passed" (to the syscall:::entry function and thereby to the probe) via 
arg2.

> + */
> +syscall::read:entry
> +/execname == "find"/
> +{
> +  @dist["find"] = quantize(arg2);
> +}
> diff --git a/examples/getting-started/readtrace.d b/examples/getting-started/readtrace.d
> new file mode 100755
> index 000000000..63d3c0608
> --- /dev/null
> +++ b/examples/getting-started/readtrace.d
> @@ -0,0 +1,65 @@
> +/*
> + *  NAME
> + *    readtrace.d - show the time spent in the read() system call
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s readtrace.d
> + *
> + *  DESCRIPTION
> + *    For each combination of a process and its id, show the total

But what is a process other than its id?  How about "For each 
combination of executable name and process id, show..."

> + *    time in microseconds that is spent in the read() system call(s).
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - An aggregation is used to accumulate the timings.  An alternative
> + *    is to print the results in the read:return probe and if required,
> + *    process the output when the script has completed.

How about "post process" to emphasize that this is a different phase 
than running the D script.

> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, the results
> + *    are printed in the END probe.  The format string is optional,
> + *    but is used to produce a table lay-out.
> + */
> +
> +/*
> + *  Set the base value of the timer.  This is used as an offset in the
> + *  read:return probe to calculate the time spent.
> + */
> +syscall::read:entry
> +{
> +  self->ts_base = timestamp;
> +}
> +
> +/*
> + *  The predicate ensures that the base timing has been set.
> + */
> +syscall::read:return
> +/self->ts_base != 0/
> +{
> +/*
> + *  Clause-local variable time_read is used to store the time passed
> + *  since the read:entry probe fired.  This time is converted from
> + *  nanoseconds to microseconds.
> + *
> + */
> +  this->time_read = (timestamp - self->ts_base)/1000;
> +  @totals[execname,pid] = sum(this->time_read);
> +
> +/*
> + *  Free the storage for ts_base.
> + */
> +  self->ts_base = 0;
> +}
> +
> +/*
> + *  Print the results.
> + */
> +END
> +{
> +  printa("%15s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
> +         @totals);
> +}
> diff --git a/examples/getting-started/readtrace1.d b/examples/getting-started/readtrace1.d
> new file mode 100755
> index 000000000..984dd3cc6
> --- /dev/null
> +++ b/examples/getting-started/readtrace1.d
> @@ -0,0 +1,71 @@
> +/*
> + *  NAME
> + *    readtrace.d - show the time spent in the read() system call
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s readtrace.d
> + *
> + *  DESCRIPTION
> + *    For each combination of a process and its id, show the total

Same thing about exec name and proc id.

> + *    time in microseconds that is spent in the read() system call(s)
> + *    executed by the df command.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - An aggregation is used to accumulate the timings.  An alternative
> + *    is to print the results in the read:return probe and if required,
> + *    process the output when the script has completed.

Same thing about post process.

> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, the results
> + *    are printed in the END probe.  The format string is optional,
> + *    but is used to produce a table lay-out.
> + */
> +
> +/*
> + *  Set the base value of the timer.  This is used as an offset in the
> + *  read:return probe to calculate the time spent.
> + *
> + *  A predicate is used to select the df command.  All other commands
> + *  skip the clause and do not set ts_base.
> + */
> +syscall::read:entry
> +/ execname == "df" /
> +{
> +  self->ts_base = timestamp;
> +}
> +
> +/*
> + *  The predicate ensures that the base timing has been set.  Since this
> + *  is only done for the df command, no information is collected for the
> + *  other processes.
> + */
> +syscall::read:return
> +/self->ts_base != 0/
> +{
> +/*
> + *  Clause-local variable time_read is used to store the time passed
> + *  since the read:entry probe fired.  This time is converted from
> + *  nanoseconds to microseconds.
> + */
> +  this->time_read = (timestamp - self->ts_base)/1000;
> +  @totals[execname,pid] = sum(this->time_read);
> +
> +/*
> + *  Free the storage for ts_base.
> + */
> +  self->ts_base = 0;
> +}
> +
> +/*
> + *  Print the results.  The format is tailored to the df command.
> + */
> +END
> +{
> +  printa("%-3s (pid=%-7d) spent a total of %5@d microseconds in read()\n",
> +         @totals);
> +}
> diff --git a/examples/getting-started/rwdiskact.d b/examples/getting-started/rwdiskact.d
> new file mode 100755
> index 000000000..a60a52430
> --- /dev/null
> +++ b/examples/getting-started/rwdiskact.d
> @@ -0,0 +1,110 @@
> +/*
> + *  NAME
> + *    rwdiskact.d - for block devices show the read() and write() performance
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s rwdiskact.d
> + *
> + *  DESCRIPTION
> + *    The io provider is used to display the throughput of the read()
> + *    and write calls() for the block devices on the system.  The
> + *    tracing automatically stops after 10 seconds.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the

Nope.

> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *   - The bufinfo_t structure is the abstraction that describes an I/O
> + *   request.  The buffer that corresponds to an I/O request is pointed
> + *   to by args[0] in the start, done, wait-start, and wait-done probes
> + *   available through the io provider.
> + *
> + *   - Detailed information about this data structure can be found in
> + *   the DTrace User Guide.  For more details, you can also check
> + *   /usr/lib64/dtrace/<version>/io.d, where <version> denotes the
> + *   DTrace version number(s) in /usr/lib64/dtrace.

Kernel version.

> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed using printa() in the END probe
> + */
> +
> +/*
> + *  To avoid that the carefully crafted output is mixed with the
> + *  default output by the dtrace command, enable quiet mode.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  Fires every 10 seconds.  Since exit() is called, the tracing terminates
> + *  the first time this probe fires and the clause is executed.
> + */
> +profile:::tick-10sec
> +{
> +  exit(0);
> +}
> +
> +/*
> + *  The pointer to bufinfo_t is in args[0].  Here it is used to get
> + *  b_flags (the flags), b_edev (the extended device) and b_blkno (the
> + *  expanded block number on the device).  These three fields are used
> + *  in the key for associative array io_start.
> + */
> +io:::start
> +{
> +  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
> +  io_start[args[0]->b_edev, args[0]->b_blkno, io_type] = timestamp;
> +}
> +
> +io:::done
> +{
> +/*
> + *  We would like to show the throughput to a device in KB/sec, but
> + *  the values that are measured are in bytes and nanoseconds.
> + *  You want to calculate the following:
> + *
> + *  bytes / 1024
> + *  ------------------------
> + *  nanoseconds / 1000000000
> + *
> + *  As DTrace uses integer arithmetic and the denominator is usually
> + *  between 0 and 1 for most I/O, the calculation as shown will lose
> + *  precision.  So, restate the fraction as:
> + *
> + *  bytes         1000000000      bytes * 976562
> + *  ----------- * ------------- = --------------
> + *  nanoseconds   1024            nanoseconds
> + *
> + *  This is easy to calculate using integer arithmetic.
> + */
> +  io_type = args[0]->b_flags & B_READ ? "READ" : "WRITE";
> +  this->elapsed = timestamp -
> +                  io_start[args[0]->b_edev,args[0]->b_blkno,io_type];
> +
> +/*
> + *  The pointer to structure devinfo_t is in args[1].  Use this to get the
> + *  name (+ instance/minor) and the pathname of the device.
> + *
> + *  Use the formula above to compute the throughput.  The number of bytes
> + *  transferred is in bufinfo_t->b_bcount
> + */
> +  @io_throughput[strjoin("device name = ",args[1]->dev_statname),
> +                 strjoin("path = ",args[1]->dev_pathname),
> +                io_type] =
> +                   quantize((args[0]->b_bcount * 976562) / this->elapsed);
> +
> +/*
> + *  Free the storage for the entry in the associative array.
> + */
> +  io_start[args[0]->b_edev, args[0]->b_blkno,io_type] = 0;}
> +
> +/*
> + *  Use a format string to print the aggregation.
> + */
> +END
> +{
> +  printa(" %s (%s) %s \n%@d\n", @io_throughput);
> +}
> diff --git a/examples/getting-started/syscalls.d b/examples/getting-started/syscalls.d
> new file mode 100755
> index 000000000..d01134fb4
> --- /dev/null
> +++ b/examples/getting-started/syscalls.d
> @@ -0,0 +1,44 @@
> +/*
> + *  NAME
> + *    syscalls.d - show the read() system calls executed
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s syscalls.d
> + *
> + *  DESCRIPTION
> + *    Show the read() system calls that are executed while the script
> + *    is running.  Since this potentially produces a lot of output,
> + *    an aggregation called totals is used to count the calls.  The

Combine the first two sentences?  It sounds like you're saying something 
in the first sentence and then changing your mind in the second.

> + *    key has two fields: the name of the process and the file
> + *    descriptor used in the read operation.
> + *
> + *  NOTES
> + *    - This script traces the running processes and the probe fires
> + *    if there are calls to read().  If there are no such calls, no
> + *    output is produced.
> + *
> + *    If that is the case, you can always execute a command that
> + *    executes calls to read().  One such command is "date".  It causes
> + *    the probe to fire, but any other command that issues calls to
> + *    read() will do.
> + *
> + *    - Execute this script in the background, and type in the command,
> + *    or run it in the foreground and type in the command in a separate
> + *    terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - The results of the aggregation are automatically printed when
> + *    the tracing terminates.
> + */
> +
> +/*
> + *  The file descriptor used in the read() call is stored in arg0.

Again, I'd prefer "passed" over "stored" for syscall:::entry arg.

> + */
> +syscall::read:entry
> +{
> +  @totals[execname,arg0] = count();
> +}
> diff --git a/examples/getting-started/syscalls1.d b/examples/getting-started/syscalls1.d
> new file mode 100755
> index 000000000..3d405ed8c
> --- /dev/null
> +++ b/examples/getting-started/syscalls1.d
> @@ -0,0 +1,53 @@
> +/*
> + *  NAME
> + *    syscalls1.d - show the read() system calls executed
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s syscalls1.d
> + *
> + *  DESCRIPTION
> + *    Show the read() system calls that are executed while the script
> + *    is running.  Since this potentially produces a lot of output,
> + *    an aggregation called totals is used to count the calls.  The
> + *    key has four fields: the process id, the user id, the name of
> + *    the process and the file descriptor used in the read operation.
> + *
> + *  NOTES
> + *    - This script traces the running processes and the probe fires
> + *    if there are calls to read().  If there are no such calls, no
> + *    output is produced.
> + *
> + *    If that is the case, you can always execute a command that
> + *    executes calls to read().  One such command is "date".  It causes
> + *    the probe to fire, but any other command that issues calls to
> + *    read() will do.
> + *
> + *    - Execute this script in the background, and type in the command,
> + *    or run it in the foreground and type in the command in a separate
> + *    terminal window on the same system.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Although the results of an aggregation are automatically
> + *    printed when the tracing terminates, in this case, we want to
> + *    control the format of the output.  This is why the results are
> + *    printed in the END probe
> + */
> +

Include the comment block from syscalls.d:

/*
  *  The file descriptor used in the read() call is stored in arg0.
  */

albeit with the same suggestion about s/stored/passed/.  Replicating 
that comment here will exploit the symmetry between the two scripts...  
and it's a useful comment.

> +syscall::read:entry
> +{
> +  @totals[pid,uid,execname,arg0] = count();
> +}
> +
> +/*
> + *  The printf() statement prints a header.  The format string in the
> + *  printa() call is optional.  Here it is used to produce a table lay-out.

layout one word

> + */
> +END
> +{
> +  printf("%8s %6s %20s %3s %5s\n","PID","UID","EXECNAME","FD","COUNT");
> +  printa("%8d %6d %20s %3d %5@d\n",@totals);
> +}
> diff --git a/examples/getting-started/tick.d b/examples/getting-started/tick.d
> new file mode 100755
> index 000000000..b452009bc
> --- /dev/null
> +++ b/examples/getting-started/tick.d
> @@ -0,0 +1,48 @@
> +/*
> + *  NAME
> + *    tick.d - perform an action at regular intervals
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s tick.d
> + *
> + *  DESCRIPTION
> + *    Use the tick probe from the profile provider to execute a block of code
> + *    at regular intervals.  In this case, this is the update of a variable
> + *    called "i", but the clause can contain any valid D statements.  The
> + *    final value of "i" is printed in the END probe.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Instead of printf(), trace() can be used and vice-versa.  The
> + *    difference is that trace() does not support a format string.
> + */
> +
> +/*
> + *  Initialize variable "i" to zero.  This is a global variable that
> + *  can be read and written by any probe.
> + */
> +BEGIN
> +{
> +  i = 0;
> +}
> +
> +/*
> + *  This probe fires every 10 milliseconds.  When it fires, it updates

s/10/100/

> + *  variable "i" and prints the result.
> + */
> +profile:::tick-100msec
> +{
> +  printf("i = %d\n",++i);
> +}
> +
> +/*
> + *  Print the final result.
> + */
> +END
> +{
> +  trace(i);
> +}
> diff --git a/examples/getting-started/tick1.d b/examples/getting-started/tick1.d
> new file mode 100644
> index 000000000..b2bdf59f5
> --- /dev/null
> +++ b/examples/getting-started/tick1.d
> @@ -0,0 +1,49 @@
> +/*
> + *  NAME
> + *    tick1.d - perform an action at regular intervals
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s tick1.d
> + *
> + *  DESCRIPTION
> + *    Use the tick probe from the profile provider to execute a block of code
> + *    at regular intervals.  In this case, this is the update of a variable
> + *    called "i", but the clause can contain any valid D statements.  The
> + *    final value of "i" is printed in the END probe.  The printf() function
> + *    is used to format the output.
> + *
> + *  NOTES
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - Instead of printf(), trace() can be used and vice-versa.  The
> + *    difference is that trace() does not support a format string.
> + */
> +
> +/*
> + *  Initialize variable "i" to zero.  This is a global variable that
> + *  can be read and written by any probe.
> + */
> +BEGIN
> +{
> +  i = 0;
> +}
> +
> +/*
> + *  This probe fires every 10 milliseconds.  When it fires, it updates

s/10/100/.

> + *  variable "i" and prints the result.
> + */
> +profile:::tick-100msec
> +{
> +  printf("i = %d\n",++i);
> +}
> +
> +/*
> + *  Print the final result.  Use printf() to format the output.
> + */
> +END
> +{
> +  printf("\nFinal value of i = %d\n",i);
> +}
> diff --git a/examples/getting-started/wrun.d b/examples/getting-started/wrun.d
> new file mode 100755
> index 000000000..370c6a87b
> --- /dev/null
> +++ b/examples/getting-started/wrun.d
> @@ -0,0 +1,48 @@
> +/*
> + *  NAME
> + *    wrun.d - display arguments to write() for the w command
> + *
> + *  SYNOPSIS
> + *    sudo dtrace -s wrun.d
> + *
> + *  DESCRIPTION
> + *    Trace the calls to write(), but only when executed by the w
> + *    command.  For such calls, print the file descriptor, the
> + *    output string, and the number of bytes printed.
> + *
> + *  NOTES
> + *    - Execute this script in the background, and type in "w", or
> + *    run it in the foreground and type in "w" in a separate window.
> + *
> + *    - The script needs to be terminated with ctrl-C.  In case the
> + *    script is running in the background, get it to run in the
> + *    foreground first by using the fg command and then use ctrl-C
> + *    to terminate the process.  Otherwise, typing in ctrl-C will do.
> + *
> + *    - DTrace has a default limit of 256 bytes for strings.  In this
> + *    example, the output string may be longer than this.  If so,
> + *    either use the "-x strsize=<new-length>" command line option,
> + *    or a "#pragma D option strsize=<new-length>" pragma in the
> + *    script to increase the size.  The latter is shown below.
> + */
> +
> +#pragma D option strsize=512
> +
> +/*
> + *  Use a predicate to only execute the clause in case the date

date?  or w?

> + *  command causes the probe to fire.
> + */
> +syscall::write:entry
> +/execname == "w"/
> +{
> +/*
> + *  Use copyinstr() to copy the string from the user address into a

Well, from user space to a D buffer in kernel space.

> + *  DTrace buffer.  This function returns a pointer to the buffer.
> + *  The string it points to, is null terminated.
> + *  The third argument in the call to write() is the number of bytes
> + *  to be printed.  This is used as the second argument in copyinstr()

You only use one arg in copyinstr().

> + *  so that only this many bytes are copied.
> + */
> +  printf("%s(fd=%d\noutput=\n%s\nbytes=%d)\n",probefunc, arg0,
> +                                              copyinstr(arg1), arg2);
> +}
