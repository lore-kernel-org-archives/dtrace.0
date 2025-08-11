Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9932D47F9
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754943972; cv=fail; b=bUPsuF72OL/eM64XmqlfANFJwvDv9ET5ETxWBtyy5HtkYQBoDnNEANfjU/xBHUCf/TP5srwPn4ROpI1k6c/2hBpUS+OU6xqX+Awh0OX66pCl7XG7aYoTg4gqoKVvLRXkut5fS2MsMnqHGobGLmuX4nkO1AoGPeUSH3G9DC7rYN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754943972; c=relaxed/simple;
	bh=8jXYYfrgPhfB+Q6ZypUyFNGIZM5EneaKA2iITTdQpHo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N94DLGh0WGKkXgdMSqKcVhjwhGKcTcsLDO0cMETsGISGSVssw+IJ87dNoYg41jXs++nW5Vv73x6IXhsHFOxFI3cvusnnK36eT8uRg4FFxs1HgsZ9HvuZJaEtGXBB5pwgzrGpMcHmJRV367ovg7H8aDQhI0+TDt6sEvgrJbnl6SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bJ6XyUgl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qcjbht8f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bJ6XyUgl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qcjbht8f"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJY5p0010811
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JVaec3e1kNR1CPiMcV9yWrhiX5rAo/bi9VUe37Iw45M=; b=
	bJ6XyUglzAjwuHjnq+wNV+SG7E+mNqfIZcTdhrezLgRjNgX2DAGKLmL/T0ku0x2W
	kL4+9aAXB3pmy2V7hJzHQsJxF2iw2z7eTChFSbhrToy26cFOTg7sd8yhVKYdeZZT
	KCfZ+me1msC3hBuySV8vkZeaoXc2pWxzhZPimEcvX0jju10V7G5JWmNLZf5eAzxS
	PGk2xQt9nePrMeiZhfhL4isE2a7+yDWuxBrHU+UrIvov69VgyZaXjkTlbQGmW3QF
	xule8Ksw+z5XSG88K7V0FGxJzFKy3LnQ9A1a7agV9CBwiLdo079mYeh0b7B6qHdq
	XrSCLzJTVUFLTYaYOX8K8A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dx7dkbyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:26:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BKFGHG009657
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:26:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsfd8fe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGxyiXDhIWk9ij8nQVlBL89EiRQ4/MPbApg2pRVpBwXCq4ZjPhpOfnzZJ1Lb8NaPSij0A4GFrWHjrd2whznl+/QZ7tfK0phdRx15g1WRyMFiiDXBEiedOQOH0u3cxHHho6VnDmXmRLWb+ek00p244K4hOMHC4ApAM9ItZXNJQ/K2EcFUKNOhHe5hWhmKDg8TPIcgrrnjh1lMe6o3Xvy1p/y0shZeq4rT89ZawLg//V6LhCRkDzhDuyVQJqTt5H0jdrBBHfoAtW4+IXSgPRxgO5iBwNAJww6iBLLdSApDuR6NRmCenojSj1A+4lH3fuKQNf3kks9nRLcJT9o/Q8ihDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVaec3e1kNR1CPiMcV9yWrhiX5rAo/bi9VUe37Iw45M=;
 b=kwpox/SJsU7/da5bKzhBJl/eeapXsYWpvXeo+Qlfoks46J6qcAfqwvn8RvuxBO4UzwcvzWBO7t8ti76fJq97KFTZVJHE3Vr2M37pFaVmqTRR2Pn5GIR5RAhigPNOnb5GSwEDMKL5GbPXzt91IrrLforrmW7jEKkoB1yvsKKaSK+4Mwx3P2SZFIxjgwfn9/FTeH5mlhS9M7x/b9xnKTSjORY89xT7xHEBnOg9guIIvDpaBW1TAERiAQ5t1GFzgKdbW7MygQMB0VVEDXzWu8mM4uqFfP7nz4UmT1XA6Scx7+vz47xr5vDHcxka6PujqKNzCKp8haGesxw5OXj5z+mjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVaec3e1kNR1CPiMcV9yWrhiX5rAo/bi9VUe37Iw45M=;
 b=Qcjbht8fHvuRTSTjNXDmdakBU986r73QFS/eRdeM35tdw85bxrxWjbiC9Er/FJ29iT30tS6/3aitGB2+bfq4qhMauUhixYz4ekqZV240iRiZt+ZkIwhHxTQjs16n568N0j2y86Qm0/esz2BeqXOFS6IGM0yYQZELxQVquV0KKvo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6153.namprd10.prod.outlook.com (2603:10b6:510:1f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 20:26:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 20:26:03 +0000
Message-ID: <6252f4a4-3813-040f-470d-ede0fd34a11a@oracle.com>
Date: Mon, 11 Aug 2025 16:26:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3] dvar: ensure dynamic variables cannot
 overwrite eachother
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567287FE5AFCB29C1950F1A6C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567287FE5AFCB29C1950F1A6C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:408:fc::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6f4bba-51ab-4bcf-5097-08ddd9154b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REtTeklTOVN6NUZ1VXM0UGJ6QVNmc2hBb215d011MUxEUk84WTJoUDhZSUJs?=
 =?utf-8?B?TFVmeERwSmtGREpiRHk4a1AxR3FpRXBnRFVIeE5IRXNmYmtoTHlJZ0FCTXlW?=
 =?utf-8?B?Si9lOGI2WmxCajRsNlpGZko1Zlh4NHppVnNlR2wyd3hCTjdOSTJveUcwSjM4?=
 =?utf-8?B?SW54ZUs2a0lBalVzVW0wRldMRXF0NjNkZGlwOFNoN3JyZGZXVDdCMmJIS29Y?=
 =?utf-8?B?VzZQZFA2K2pvRWpvNmtveGdVOC9Xa0VYYkpOYmJJbjNPazRub2tqTUtaaE0y?=
 =?utf-8?B?SWwvZmRORXdFSkJVdFBTT09kTENlMkk0K1BXOXlUTDB5dVNhYy9lWXFoWlVS?=
 =?utf-8?B?R1VVeU04ZVlBMW9pRjUzOU5YQ1BLRlpZOTdSY21INmFQQVBlWDd6R0JOQXVl?=
 =?utf-8?B?RjhHZGZCc3BqSzNhOHlhYmdoVDFjV2ZaQmM5VTFhTUdONEZ2K040c1ZXaGgr?=
 =?utf-8?B?N1hHZW55T0hsOGRQSW5qMmpTbDl1eDFGaTk5Tm1wRFVVZGRlM3hvNi8xaklx?=
 =?utf-8?B?VnlTUlVLV1RyQ3pvaTY5ckZOdTNHd1dZOVF0ZmVka3U3UzdFOWREQzBMMUpP?=
 =?utf-8?B?U3BOYVNXSXlnNnNMRDF6ekFGa2pqZTJwa3dnbS9jVzhnSVdDT2JxMk43THZ5?=
 =?utf-8?B?eVVtbktCSlJ1N0R2TFdOSDhwUWxneGJDVHI5V2lwbTd3VXdlY0RFYU1YUWxU?=
 =?utf-8?B?enhBUWkwQll4a1BXN2VxcGFxaXZnWGl4NUE2V3V5UURPUjhjY1o0bTEwSVhl?=
 =?utf-8?B?RHUrdERQbDNETFNOeVN2L0Jib3FQUHNVb0lZUGdmR2o5eGxBa1RrNWtWNjdM?=
 =?utf-8?B?Nm8valFtN1FlTUgxY1dwUGp6UEFYME0xazBuQWE5TVFwbkQyYnNXMTB0b2NP?=
 =?utf-8?B?VUZ0TVZ6N0VCNjd3cVVVdmR3TTdNRThnZ3lmSGtjOGxMamR6RTZkWFA4bWow?=
 =?utf-8?B?R0dmY3pWeUV5Zy9SWkRZemw2Q1YyeEg0c2NYeTYvSmNLaUVYdkFLUzAzeElq?=
 =?utf-8?B?UWlCSWtQckxTbnhFMGdtbmZZVitSNFVFU2ViTUtESFZzZkowZksxd1hjTzZz?=
 =?utf-8?B?RVZFMlpoODdHVGVSYmVrOGxzRjZNd1Noa0tCaG1MdENDTk5OM01LSjNNUUw4?=
 =?utf-8?B?VGFCUmM5aW5CSU11V1puc2dHamMzdWkvT1RwNmJzOUV2eXlKN3R0aDQwMkIv?=
 =?utf-8?B?N1BQcGlUYmd5TU14ZSs0UjFBa255L1V6MW9uVkFmc0pab09qTXVobVlYazJq?=
 =?utf-8?B?ZVovRksyUFZDQTVzOG1EaEx5bTBFeHo2UHdpZGJINDNPTm5RU2J1VGI1T25n?=
 =?utf-8?B?eVhtT2QxSUhpYkxaaEZ6bG5PWndFeDNaOGZCUlFKZW5TelUyaUxrZ3IvM1hF?=
 =?utf-8?B?NE5GN3JwYzJuWDc4cWQwWGtNZys5RU9SMkZ4d3pvNmo4TnlxRDBSN0QrOWRl?=
 =?utf-8?B?YVVySGVSdEFubU9GYmVxRG1neTl1dHdhU2xaT2MrVWlSWlRvbHhVTWFPOEUz?=
 =?utf-8?B?VEQwNmF5ZERiK2ZXVVNvcGVrQzRWTW1nbnp1UmJkWUZlT3c1OW9FT3hQOERS?=
 =?utf-8?B?TkNEVGs2ckZJcWg0MkZlcFdxMmpqaDV4T2ppdm9hdDNhZm5UQnZhYi9sRUpu?=
 =?utf-8?B?VU9wTWZDT3AzdVUxVCtqUmdSenhEK1h0MGVTampXekxudDNkM0s5VDg0cmVI?=
 =?utf-8?B?MmxuQW4zQVlxVFV3U0UrU09qMi80SGFhMkk4WE1Mdm9FVTdGWkM2RmJyZWdx?=
 =?utf-8?B?djF3Q1plbTVaT2FWNzVaUEVUSlkxdlBNLzNTWXVXRkVLWXBpTC96TmQvRlNm?=
 =?utf-8?B?WHF2MER0OGhTVDJBcit3Y0R0QmhWVHBBT1dBZm40Tmp2dVVocG5RalFUT2RF?=
 =?utf-8?B?aTdrYzl6WmcxaEI1RmhoV3laVVB6MzJNcENrNnA1ZWNZMk1sQXpXNTZqNm1C?=
 =?utf-8?Q?yQ7/KrC6qXA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2lNRTltUVlPUTZ5TzZuN0hmYUh4NG1QK0F5U1RnK1I2TGhiN09Bb1BnMWh5?=
 =?utf-8?B?c1JsUnhLMkxpS0RmcEVUMmlZYWR5MnE4dHFQRzRBdmhvM2F0NVVLMWdVQ0N0?=
 =?utf-8?B?YkR6UHRBanFuUHRlK0pKaWIyZUZPVk5jS24rcmEwR1JnVkFEaHA3VXc2UzhL?=
 =?utf-8?B?bmt6Q3RIRFlkdlNNeW81ZkYzb2Mzb2pkUEVtSWV0NVd0U0gwT2NOQk1LcVJp?=
 =?utf-8?B?bldqQWs5Yjh3d3BjVVVSU1lxMm05VWhNWUxWVjVRVE1YYklyZjRVRXdiWGVx?=
 =?utf-8?B?K1RpaWRqYnE3bVhIS3RRVmJsV2ZlNGtHVzBKek9zV0FpRy9ld1lQay95eHFs?=
 =?utf-8?B?OVpLUTFoMDZrRXRMT294aiswL3JmZVlyMUR5Y3F5Qmk0VXVDLzlQaXNNWmta?=
 =?utf-8?B?RzRienRmL3dmQjhxdmhDY2pzNllTMWhHOFhrZ2VPeW9hQnd0eXppaFN2KzZT?=
 =?utf-8?B?MnljQmR6TmVPRExWSWhJd0tFdmlNbFhzMTRFWm8zT2VTR3IyOHpqNWJqQnNU?=
 =?utf-8?B?bzVhc1NkNGR4MmVPWjQ5WmY3ejNOa2J1dWdiMWhCeFZ4Nk84Qkd5a0ExU3o4?=
 =?utf-8?B?a3R0MVZWRHExaHVTckJKaGZ3ZTNibEhQYzczQ3hNQzY3RFdNT2NCcUF4eHlS?=
 =?utf-8?B?ZVdYQTBtemt4VnJINlpEVksxTDVMQWw3WW40d2RpNzVxM2w4WnlQcVZsKzlr?=
 =?utf-8?B?dHMrNEtvaVAzd0FJUExld2NIRmhNSTZtRDBpU1EzcTRjLy83b2phYWlJUmlo?=
 =?utf-8?B?NDhoWHdQS3JaeWRQS2p3ZG5lUFdnQmpHSzVaR0JOTEpFTmt4K293VXRNN3RC?=
 =?utf-8?B?c0xSQnRyeEdiUnVoMHBDRWpTNXQrMDhVNVF0UWdpOXJybWYrWHdzV05WUGln?=
 =?utf-8?B?cklMY2Jua3R4V3A1ZDh4MkF6TGs5YW1ubE42SEVhSFRYTDFwVmR6UVlKVFJR?=
 =?utf-8?B?bW0wY0ZsV21GTUV1aDl2VWtXQnBWVnc3a1ZhejY1UVZSRW9RNnNmWWp5ajBs?=
 =?utf-8?B?dWtNWm9rd1FCQmNiUnpQRFVETzVPMmpGK1R1ODU2dVl6NkNWL2V6U1V3TTZu?=
 =?utf-8?B?VzUyMnpFa0JaQk92S3VLOEpsY2dKK2VGcHdKZ3NwWnVWakUwMURCNUNIV1M3?=
 =?utf-8?B?alNjVm9RNXdzV1NYUkRQWm8vY05mRlRacDBzNmJXZGJYK2JMTmhaL1ZKZDlP?=
 =?utf-8?B?NlNTa0lscThiS1NkTXdrbU5WbTZlWjJ1SUVyaTVHaWxBNFJBZmJWd3VXbnoy?=
 =?utf-8?B?SmJqY1hJMWF4dGlSMCs1RENWUTY3TTBOcDE2Y0JncTBqSmh0djlTblVPOVBk?=
 =?utf-8?B?M2Y1dlQ4OEFWMnN6anZrYTVzazNYUEgwRG9LUGJnOWgxRFgzUXlsV2NUeWxY?=
 =?utf-8?B?bHIvUFN3cHVtczA4UU5za1NFY3NJbHhRMHpFeVhXaFdEY1UzUlVlSlFlTm5Z?=
 =?utf-8?B?YkdTTTd5ZzRVbGZZcEpzVVRBNHRUQVJ2Unh1RDdUdjRwSWFXMDZTaXNnZlF6?=
 =?utf-8?B?RGk0VGlmWXplQStYa3cyTjJLYStFRXpQRHdNM1d3aU5NNUNEQzZJckdVSFVS?=
 =?utf-8?B?eG82V0F3MWgrM0YyN3V2UmQ4Y3gyZ04wRE1mY3VoVE9SWkJKM2Fxa0k3ek8z?=
 =?utf-8?B?cDdnQWM0THJUaDY5ZytSa3U5a1ROVS9Sd1JoK2ttNTU0ejZYMnBPRnBOVXR6?=
 =?utf-8?B?eE1LcEFqNkpUaVpZdTZsNWJQNGdPSzV6bFZ2blFsY083U0psMTQvSVlBV2Rr?=
 =?utf-8?B?NTdMbUI5bHBqQlFLMGEzTnZQVVdPWVVlY2pacFp0c21GblBKTGx6K3lvNUVx?=
 =?utf-8?B?RFRRR2Ywbm1RTk12V0lXRkl6RDhnRTVweFVaMWx2WUVZUkwvRXRhRmpOemxW?=
 =?utf-8?B?SVF5ems1NkJGZ0xoTXc3bHVwRmdMNWw4RWxUMUdScldVS3E4TXBmUVJsL0ZJ?=
 =?utf-8?B?eTZXbXV3VEtiS2gzak9mZzFSQVRpYzFxTXdEdTAyMTU3QU1TV21Eb1A4ZzV5?=
 =?utf-8?B?Y2NkWHMyaEdnUXJhU0tFOEN6eVBxVGI4OUZHWGdWd1pmZlpwMVYrNmVnQ3Y1?=
 =?utf-8?B?OVVKQ0FNVXpkTXN5aVlmbXZHU1FEd0VhRzRjTWdFN0M0WFoyZkh1L0tvTlhP?=
 =?utf-8?Q?ATcixm6H1u/fJMTnaoAfwsmWT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oXQ0dzBQtsoyVYa9UIZNW9tdu1z3gozytniRHBk6QNMwtoJk0GDC4kLSiLoobVAP/PCoTuMJyYIktjk9SX+3H+1HQdvAJ1N7OYBMmSAXeS7CzoixZLHaemq0ZBo5Ck5wbSA2bsUOugqWAdjnpsIhiIPxEEmGhRtVcPErFIv6j2YqG6pkMYhqNE3TdhHv9Ja9QAMqU5Hp63WKeY1sq7PIwjDI4jPeQqbk9+IyZCbDsLyjddDHAvR6DM98V4SxGN6ZurPQWvpGFWXtWp2AJ0U77nNYyM1Ma7cDNeF7qVI7wtLeugXDl9pv/EGlTy8jMeGAp6FPN61+eiGRznVT3StQKAQdAOdJJ2maD1mh3RsINlV4nttIlbH9WVSE7TMgJGUf/auY7aastgvRAgQKTEozkzA52sMi1LGL0fyXhzMRcMWz/h/KV26I+MwHdwm/2uHo711eRMVCZ7Nlk5kuurIEdrGsfYtI6G2M1yG7wJS9jMGUYIYjFSO51gBG4qGjXdIsGPY8Zd60omLOD3wan+iFkMo+68IXFYwlZ3lg3qj5ACJfuaptrTwqMw1R8tKyAWfsiGfD+J1VfO95cAZdIeLPd0RYB0mbzpJoIIC208+aWNM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6f4bba-51ab-4bcf-5097-08ddd9154b2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:26:03.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhOPONRpaNvTB44Hetc1ujSX5bux2HNeJQMt5PombI6PFwfC7kRv/NNWv/WYhth7I0Yy1muC4xW2585vMZOVRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110139
X-Proofpoint-ORIG-GUID: mCfStH1F0ysJfuLq6cNDtqITusSLrRv5
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=689a51e0 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WgaUKLa1KEh1hW3v0Y8A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-GUID: mCfStH1F0ysJfuLq6cNDtqITusSLrRv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDE0MCBTYWx0ZWRfX0+a2rfcADI1c
 PpHLh30kysp02Le6A9vszROtauaL09wepYH/gJThB7ikOpw638P45agms4cS6yK90U77Z2tDzZ/
 wgZIKRBDE6tUdL6CtzDBBvzucE0t8rz4DmjCeR2exsySEpZqyCii6gBiu8VtYHVUpUyPTXizpuu
 +5KVgXZjj8duhrMNEr39nW1IJVsVHxFGgcI8CypShVf0LSVOLa2kbFQMD4ZjP65Pm6j9gTL2MmH
 C+Tq0epcSzsU1paky7ZeAWHamVZvD+QGmqjobcX06G2hdMlsNXSGXP4TaGjyFl4cWN4pyNt4GZK
 8dOm13CsiNo30At6MbLzAoWgI9xKw1Wyktxt8p06KloW9Ap/xvUVtcuw879sO0ng48MJWje4G9I
 AA+7msBbtQzQ3xRReb0JkDM2BcFNO/v8Khtr5YwGaMp9s7V9/czucK2qtBcjoiHK0IOIewp2

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/11/25 16:22, Kris Van Hees via DTrace-devel wrote:
> As Eugene discovered, it was possible for dynamic variables (elements
> of associative arrays and TLS variables) to overwrite eachother.  The

eachother

> problem turns out to be due to the implementation of the BPF helper
> bpf_map_update_elem().  In order for the update to be seen as an atomic
> operation, it does not update the value of the map element in-place but
> instead allocates a new element and places it in front of the old one
> before it removes the old one.  The result is that the address of the
> map element changes as a result of the bpf_map_update_elem() call.
>
> Fortunately, we can just assign the address of the map element in the
> value that we obtained using bpf_map_lookup_elem() because that gives
> us a pointer to the map value, and we can assign directly into it.
>
> In other words, we do not need the 2nd bpf_map_update_elem() anyway,
> and since that was the culprit, removing it resolves the issue.
>
> Test included.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   bpf/get_dvar.c                       |  5 +----
>   test/unittest/assocs/tst.collision.d | 22 ++++++++++++++++++++++
>   2 files changed, 23 insertions(+), 4 deletions(-)
>   create mode 100644 test/unittest/assocs/tst.collision.d
>
> diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
> index 1bb5eb002..073cca57c 100644
> --- a/bpf/get_dvar.c
> +++ b/bpf/get_dvar.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
> + * Copyright (c) 2019, 2025, Oracle and/or its affiliates.
>    */
>   #include <linux/bpf.h>
>   #include <stdint.h>
> @@ -150,9 +150,6 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
>   		if (valp == 0)
>   			return dt_no_dvar();
>   		*valp = (uint64_t)valp;
> -		if (bpf_map_update_elem(&tuples, tuple, valp, BPF_ANY) < 0)
> -			return dt_no_dvar();
> -
>   		val = *valp;
>   	} else {
>   		/*
> diff --git a/test/unittest/assocs/tst.collision.d b/test/unittest/assocs/tst.collision.d
> new file mode 100644
> index 000000000..11a4363ca
> --- /dev/null
> +++ b/test/unittest/assocs/tst.collision.d
> @@ -0,0 +1,22 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Dynamic variables do not overwrite eachother.
> + */
> +
> +BEGIN
> +{
> +	assoc[0x1234] = 1;
> +	self->tls_assoc[1] = 0x1111;
> +	self->tls_assoc[1] = 0;
> +	self->tls_assoc[1] = 0x2222;
> +
> +	printf("%x / %x\n", assoc[0x1234], self->tls_assoc[1]);
> +
> +	exit(assoc[0x1234] == 1 && self->tls_assoc[1] == 0x2222 ? 0 : 1);
> +}
