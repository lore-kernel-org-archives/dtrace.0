Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769823C8D8
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738955908; cv=fail; b=srPshbSVRmIcQzZqW0Jhp0OMpvFLJwRM8XghitPfOVLnA+pwmjLvTx+p/pyULtvd3fPv95IQ2V5oqjzvEHZhzYLjugrSnigcZPofdpzQZ03ljakHXwEDq+p7IEdTNGnCwJeuzEeZSTIaAzCPa4LKhblmzUyK4OQWUQlkkqKNgV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738955908; c=relaxed/simple;
	bh=Br/QzhODs9Yfw2ZqJ1jxFJhFDkfipXMz+UyLwLTmr10=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rjsMY1TkH0sg08nYnelbxLhxo+A16FaYDEf7Y1JFUDeYVGCJHdFjl2z8u/tl2YTdZqOEtbx4vg/LOUnLIbhRQx2b5J1xSxYjXt6NHzguuirza5k24UDVreVQnAXjPhAjMKi2/8pnqsQxRkLKrkrLAFlWp8IKk8bCbafJdN3Meb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Enu09hC0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ctDQxo+A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Enu09hC0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ctDQxo+A"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517ItvSF026010
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 19:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=JyH53LqWNpeqHhF6Vimo5wUQpX6qWJFvVc6fYedVcpk=; b=
	Enu09hC0O217ab3dEqeGXUgm3gtbRO0lpavrEXnn9OQr69JF0tlY0IS7iKEVq8Gj
	o4aTlTNeBI6TLujx2FZ7igqAGAoH/MVkKyi2j3qFodFA+1BQhL9tHlP337Qdm04B
	QZBC82M5rn0I2zOYOEi5/sAD6e414KugNeZwHjLEKAPCZAJGC6olxruJ8g5Iz7pF
	MdRl32hKLGAMIpA8OTIIRq9R+cd/qR8MoPWVF5L8JMdIwopZjKipMCYpK/W3j56J
	7YaLvwRPoNnYMEcCYy3xyMG8ctiT8f0BLaW2Ef6IzdgTXz7v9+I4IKDusicMCsOt
	0X73V+/kucMTYBB9syCznQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44mqk8bddq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 19:18:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517Hminb027767
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 19:18:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p7muq8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 19:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoSaXpoCo9J1LEWvoATDNVPxZG56SyOuDsx+g7Dq1T+Yep0nBIprG07g1URcteFuN1+eDn4Q1KFcAfyLjU9d/EMMUpZn4eJz+8C1oyjGK9nYVFda5oEMmwPL/MP9mI3/3F6j/MpP0VOORpPNqt7fHFtIPLdpOZVD/SX9zKJhsGJi4BVAlPBnizGUds3mTjgf5CF7XCATz72gosIu8Io/skQcf2aR7FT3JGjOHzjOLwMeb10b3lJ3aiJXTSLklt3jTgwYAzZzTkKXI9rzHfUEjIN1xc9DHAyso+ie727Y8BPh7OTqN/HeNIHNwmScTwRGtFuahN+zVH++b2ocIGmDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyH53LqWNpeqHhF6Vimo5wUQpX6qWJFvVc6fYedVcpk=;
 b=siwtGMjGSdJaiWIL9LQPyu+IzgJe951ALwyIWcZKVlfpzS7SrNFfcB9fOlHV/Cta5HM9bNxEs92lEXiYhS33eboQKkJofifMzP/ljdSgZr4L8w8wHHkIuDeGSqTp9CpsEe8MvJAG0Pj8PtlNjWtgfMDVYKZAM/czBd1rKQXxlVmuT97pWxLSmFYkb6fBTgdfms5DGDPlqEMnRCekkmRL23qv+iMqk9l8nyCeiwWeuwN/wzGpTycT0SJ+hLhhuTaUvxCkQXeY06yzcyZE51s8jFNvv8i0IJkP9zytexeIh6gdxBcB+bj8d9sqcMszs4CEl4D45S1UclEEOKR8WMCioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyH53LqWNpeqHhF6Vimo5wUQpX6qWJFvVc6fYedVcpk=;
 b=ctDQxo+AbcdZxel5PYL6dBzr1lDVzjjVWNM+8ThHTX84ncqGfnu27mdwksjAr0QjWzxUTdya2IISzHgfJT4ABdb3Ej0CnKjlYThqhiZCEi2Ijy5sFaL8Ro4nC6/1dxde8qCODnHUbR1W6XmJZDYudN6uIsdqesl5Nhny2xnTN4Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5081.namprd10.prod.outlook.com (2603:10b6:610:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 19:17:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 19:17:59 +0000
Message-ID: <495b1606-caba-9b59-68a0-0587d0ddf094@oracle.com>
Date: Fri, 7 Feb 2025 14:17:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] cg: ensure string results in a ternary are padded to
 strsize
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <6c5f5a2593039303a8f1f46fccb7a198.kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <6c5f5a2593039303a8f1f46fccb7a198.kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 175a3b3a-840f-4047-050f-08dd47ac223c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkttWUhUenpmZ24zU0tVQmdIREplRFBMZlRZL2RZWXgrbHNIUExRK3JUekRn?=
 =?utf-8?B?NFJjaGVFNktvOG5kVy9Wc2xBSzNSVkl5cHlWbnhTYTFaVlVLRkcrMjVodXNQ?=
 =?utf-8?B?VTBPcTRUOC9NS0UzVXRFdjJpSllkREd1Q1BnN1ZJZzFVTnlEbWpvSDBzNnRl?=
 =?utf-8?B?Nmx6VTBsMzZFOVVtMUsxS01RV2thOFk3OU1xcFdFazd0VkVrUDNndUg3Zyts?=
 =?utf-8?B?bWhYTDNVeFhVUEhzeGd6STV2S1hvdTZaT3Q3anBKL1d3aDdGTmp4NS9FZG5C?=
 =?utf-8?B?NGIvZDUwcXBrK0NCaTVTaVJlcUpERGRyTkhXYVRpaDYyRVhMekdyQ21IZWwy?=
 =?utf-8?B?YlU1WERnUTF6QVpIS0lYaHBLNGJxQ2FEeDhiUU5JazR0cTY2OWNmZlBNZ0xR?=
 =?utf-8?B?RjhTVHFsOStac0JiU2pXRlNqMW11azlnUkhqTTJMQTBOUFZ1bEdnbHU5cE1q?=
 =?utf-8?B?dWJzNWFES3ZEQ1ovTjdsc2tZSFZTNVgwUEIyQVJBcTJTamhjSTdYcDl6cTRV?=
 =?utf-8?B?OERIWmQwWnpOVDJMd2dUdVJrTHNBTnpmU245MUJ3amlEMzh6SUx5U0RMaDFI?=
 =?utf-8?B?RGVscEdZSGVQUytmQnovby80YXlqWExHRlpENk9vRUNaSDd5R0pYWENseVFz?=
 =?utf-8?B?OWw4SFB3aVA3ZVVlTnRMOUR0elZ3L2M3KzZHc1VJbm02Ty80RVUzWnQ3WElv?=
 =?utf-8?B?VEEwak1sbjdzVG1TbVkyeFV1cUI4ZUpLSWZQYS9DbCtXYkJJUnArT0FpaXUy?=
 =?utf-8?B?bXZxRzk1UEJYTThydHYzOFlaWFpnazNaclNNZUR6WkRva0ZkRGlhc1JwdThS?=
 =?utf-8?B?NDhCTnlya3gxQUVYSnZzTFZXZTBjSGhJZkdhQkdmNnF2ZE1RREZMK1dUUEhs?=
 =?utf-8?B?L2lMNlFibEFIcW9ybnlIekVJVTJFYk5HVUNhelRLZkk2S0dZYlpqOVhTZ2Zl?=
 =?utf-8?B?aDZicjcreVlGQWF3OW5lK2RiL3VoRnZRcjBIMXlReHZJTG53R1FFWW9hdEZO?=
 =?utf-8?B?UlJvNndybGRNTUliUHBDNVkxUk9kbFBSeTBiTHdJVFJxcGE2Q2VpK3VxQVRN?=
 =?utf-8?B?Z05IcmoxVkpLZFVBa3FGYnJQK2NlNjYrTWFnRnVmWjl2SEh1RnNIZENnSlFu?=
 =?utf-8?B?OGRPQTBrR2VnNTVWbGc5dER6czU2TmsvZnB0RzdQRGVMNmpWYzhabld6UTlB?=
 =?utf-8?B?MmkzY2JTMEd5NDB3RVNEU1FZS3EvNFdqcnZraVh3V0NZRUNBaENpVU1SUWVn?=
 =?utf-8?B?clRLOHM5U3YrLzdLUkdtZk9adWZXUDQ4emFUdWtUdEdCdkZkN29ZTmJqdG5B?=
 =?utf-8?B?eHI4aVdiQUhvcGVjaUg3T051dmZQdDNVbzR0ZnptSThaWEJmSGVwYXFKaUc2?=
 =?utf-8?B?TnJIL3FGaWk3YVhYcUI0N1p5Ly9YRVB4bGdaREtNZDBLSiswMExETXVQZW9B?=
 =?utf-8?B?Q2p2MlhnaXJpNEJVWnovVkwvQTBwNFpQa2xrekR1QlIxM1lDWDhkaXd1SDZs?=
 =?utf-8?B?UEtLSzNWSFBJTVNmNkRhUlVCTHI4MzhNSDhXdU40Y1N2NkVqVGorSmhyRGxJ?=
 =?utf-8?B?RGFkVmp0RXFkUHJHRkpsQlNLd1AwVVRzQTVIUkR0cVEzRG4wS3pLTTBreVJB?=
 =?utf-8?B?bG1RSzJ4NGZibG4rbWw5ZDFqR1F3elZqcjZKT3NKbW5makxxV0Y1cEZ3clJZ?=
 =?utf-8?B?OXFUR3Y0eEdGbDM4TG84ODBoTjI2dWJWTDJRUjVzN0o0V0JqTWpOR1h5Skd6?=
 =?utf-8?B?eW5TZk52dnNLU2ZKNFlGTnVKSTljQWxVd0xieG92WDM2OU8yUnNkVEJhTDEx?=
 =?utf-8?B?V2R4WXY4SHBkb2x6SDFzbWIzc1JVblVUL0FDYVpTRUpWM3RjTEowMFcxY0NH?=
 =?utf-8?Q?+t++uTm1Twaf/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0I1cTlodFZzdmptZmpSSElCeFArSmV0dWJkaklvSzdwNE0rV3pPckFYem9n?=
 =?utf-8?B?dVE0ditaZU5BOVJSWlZoc3FKcU43eHBIMTdNeWFvVmJ6eDBZQWdlTWh1Zllu?=
 =?utf-8?B?MFlmQWwxaXd4ZllCTDFJVThqeHFML0lHZm5nbFNSR0d6NzhTMVhscDRvN216?=
 =?utf-8?B?bzdNWHdNeEdwS21HdDVlZ3NnSUVyK05HZWFFRXE5eVFLZlZKUU9XRk02cGo5?=
 =?utf-8?B?dG9KY2wyenFBMUxSWGg5TktWZlVqWHFwNE16U3hwQ25pSTR4bGVJRmNoc3Nt?=
 =?utf-8?B?NEhnZWRHcUxocWVwR3RMWEVCT25WY3NHRWNnY09UMkZraCtYc00wVmp2alNv?=
 =?utf-8?B?cFRJaVZDelRTN1ZmL1pnSS91alk4QlpVZG1JbHlTNDlONEZORWpYN0szRkZs?=
 =?utf-8?B?OXlBT0R3dGNkWXZVZ25ydTdUUFQzNmx2SWpkM0JNWnpGUW56cXRjYzN3K1cr?=
 =?utf-8?B?OXFUZ0UwYXZPOUE2NjhYM25FSnNLTDU3eUEwRHVlK2RPL0JqM2FTSzUvSGxL?=
 =?utf-8?B?MUMyblROZmxDSTlGQ3ZpVFJJSGNOY2xzdmJkMnJYZGlpYU1EZ2RtdFBudWEv?=
 =?utf-8?B?Y3ZBS1I4S3I5UlNYc2t3MEd1MHZJZGVNRndXdWdYZk5zWmhNRFpDdW83Y0pk?=
 =?utf-8?B?dzFNTFJyZWdCRzJVVVRIRCtvc05zNGQ1SkdLSnJHQytEKytvYkpHaEw4RHNV?=
 =?utf-8?B?VFEzTkgvd1h5ZmRRUytTc29WdUtxSVdiN0tJbGdnMEcxWHMzYUNhUGorMnoy?=
 =?utf-8?B?YVdSa2hqcDY4U3RVZmZKeFNidTRyZGh6QXZpV3dRaG9CK3RpTVAxWExqS0Fk?=
 =?utf-8?B?YU5RdG5tTzBsMHl5RTVXbzV6R2oxd1p5bFg1c2g4QzlSbG9ldklBdTBBKzAw?=
 =?utf-8?B?TlFJYmtBQU0zbHdrL00wWllmNjZiOWNkNDNyNTBrYlVneDh2cnBlNWtmRDZw?=
 =?utf-8?B?a0xnY29FK2t1T1NMMUFkQ2JDK0hvSW9mK0RMMVY0NEYxNVdBcFl2aDFtTVdW?=
 =?utf-8?B?bFc1aUJGZm80eDBVS1RaSk9XcmVwbTN3UXpnUE9mWUZIZmtISWgzZ1VTV2tH?=
 =?utf-8?B?YnppMVYzSDFxdVdocW51L1hjcFRpemIrbFhDc0VCR0RTVGxmUm9WbWRmbnRv?=
 =?utf-8?B?K0VvYllFbXY1bWxIblA5R2NkZVh6a2l0SHZGVGFqS1ZobzRGT1BJM1RleEZX?=
 =?utf-8?B?NWZBRVlWbjJTbjY2RkdjVmQwZGp0K0FjRE1wVkZwRG14c05pTmRoK1o4KzQ2?=
 =?utf-8?B?YUJjNU9EcWJvK2xJREppQU5VdDhrL091YjFpZ21ZZGFKakFkV2Q0eGcrY1BX?=
 =?utf-8?B?K09iMkZOaFRpTmE4ZWY0dGYrZTI4UnptNTNxV0FMTFpvaFd1azJmd3VBclhY?=
 =?utf-8?B?SXpHakh2cjdtejJ5ZE5LVVdPVUFoak5LVCtWeUhIT1hLWUEwaS83dnhGNXNj?=
 =?utf-8?B?NXBSTE95VDRVK05vcFh6TjhrMUJLeEVjOGN2N21VMm5OUlhzVXdVSWhYMCtJ?=
 =?utf-8?B?aGV2TjZTdVd0cmRjMEthbXNuWEdEOFVsdjlzOHJkSkRXcnVrZTRkWlhrN3ds?=
 =?utf-8?B?cmtJZ0pObktUeFhUR29jWXE4VEtkazY3QUsvV1FhWExWWmRuSlB0UDVQVmJD?=
 =?utf-8?B?Wk9XVUk0anBlSjZza1pEc2FWS212RmJsNURsVXNNYi9QL2FTSzJ3aG9VZDk0?=
 =?utf-8?B?T2gvdVgxTmZoNFQyanRrOHhIUXd2dmY4a3dBa2NCaEFtZTR4ZTNQN1BVOTJi?=
 =?utf-8?B?dHN5dlZSSlR4UFVIWVVUTU1HY0RGUmhaMDFxMTltL2VtZjBneTJvQkRYWGlw?=
 =?utf-8?B?YzIyQnFTdlhUTWp2SlBTUTBydHFOTWlXT0dudFppNSt6SmNKVFg4cjJZeE40?=
 =?utf-8?B?VXJhQlJQc08yK3ZtT3E2Wndya1M5ZStDTTNYZUlPSW5IaVp2Y1R2Yml2QVVn?=
 =?utf-8?B?Nk9FWEx6WU5vWW1USDdKQjhIYUpNU29PR3oya2ZyeHd4Ri84ZnNSakwrODBN?=
 =?utf-8?B?ZERWWG8rQUdFVW9WcWNQbW1yVlFNWUh5dHl6M3ZEWURMODBlZ3N5VXB0MFZS?=
 =?utf-8?B?U3hPZ0IxOXZvN283bHpsM0EwU05FT29MS252cE5qUThtMmVPZnpTZUJLaEpk?=
 =?utf-8?Q?4DhS8m1n32OfNFoVUnsy532Au?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	87NbZ5tgsRcRgviHzann4b3qPCArcz5L7L2yr8UM405ncUJvNTkeWdTANAa9QicP94vIGbacIilTATdFJq0s6DBH8PBE4b/jr8zs4Bq58Y/uuEEnYO9d6jXkTPAB6RhljmGyeze8fCw98mTFdU43qo11tYht7ovJ7fuxI0MVi7hqwUsY9Tk5mrTZ594qSdS7rXRnA3kPYoAFG1A+u4ET2VA4huw11sNAqybKayBWiS3hz/l5dJ6aGaWVlKPuvM7NNTjvUIyketU1CKJV3LDo9iuMbvWSflzIgz7fxPqQ+XQLFsTHHWuYmveHj5dOlQwPUxQQfL5xgx0OEyW2oBgfRdl+W+gvpJCtr8ch0ixoFvtST9mR5vh+WBxtOrNp3zw6D1dH/2ztdD+GPdJ0jwNVLJ2BChREjnAtExAEmDIyf723ZAeWbd2Yj6TRuV+a+TQEa3Uxk3edz61T21KUvcEl3sTBk27Tl+8xE0XKDek4TgmWTgLBIty+rvvySAVm/KzlyJViRRt01iSSR2g5z+lslCl1Qc+CmiXMud0m6bLY3iIDURmsHrEUgLxWDEVHHbuxo8DmJxFQN1w26h4yEzmOIZ3ApWVZR3FNkimNqnmlooI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175a3b3a-840f-4047-050f-08dd47ac223c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 19:17:59.2425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B53goJItJWRQkSn0rkjkrHxqTX6uBsIsPMHX62AIPDOgrJhg/TuE+FbSNNgU191hSsk6jchylmlzQMXcten72g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5081
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070144
X-Proofpoint-GUID: cfey4hto3OZPFpN4VNVDqbC7THvP-4C_
X-Proofpoint-ORIG-GUID: cfey4hto3OZPFpN4VNVDqbC7THvP-4C_

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

That said:

*)  Is it possible to construct a test?

*)  Has there been an audit to ferret out other instances of this 
problem?  Also, I'm confused what position we're taking here. We're 
saying that it's possible for a string (which in D has strsize) to have 
garbage after the NUL byte, but we'll deal with this situation only in 
the case that it's an argument of a ternary operation?  Why do we not 
say instead that a strsize string will not have garbage after the NUL 
byte, so that a strsize copy of a string will be safe (regardless of 
whether it's a ternary op)?

*)  What position are we taking here on BPF register pressure? E.g., 
what if dst were %r0 (okay, let's hope not) or even just %r1-%r5 (even 
just %r4 or %r5)?  One position is that we don't do a robust job of BPF 
reg management anyhow and someday we're going to have to clean that up 
and so being sloppy now is okay or even necessary.  Another position is 
that we can add a little code to improve things (even if other areas of 
dt_cg.c vary considerably in quality).  E.g., one can fill-spill regs 
between the two function calls, costing extra BPF instructions only if 
needed. (That's already a pretty common practice in dt_cg.c.)  For extra 
robustness (beyond what we currently do in dt_cg.c), one can move 
%r1=dst and %r3=src in whatever order makes sense (more complicated and 
less likely to be useful).  Anyhow, fill-spill regs between function 
calls is a pretty common practice in dt_cg.c and I would think would 
make to do here.

On 2/7/25 01:11, Kris Van Hees wrote:
> The result of a string ternary was copied from either left or right
> value using a memcpy() of strsize, but that could result in garbage
> being included in the result beyond the terminating 0-byte of the
> string value.  If the result was e.g. assigned to a char-array
> translator member, that garbage could affect consumer output.
>
> The ternary will now copy the string using dt_cg_strcpy() which ensures
> that any string < strsize will be padded with 0-bytes up to strsize.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c | 68 ++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 52 insertions(+), 16 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a5c9aa09..b48e27f0 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1371,6 +1371,19 @@ dt_cg_fill_gap(dt_pcb_t *pcb, int gap)
>   		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, off, 0));
>   }
>   
> +/*
> + * Store a pointer to the 'memory block of zeros' in reg.
> + */
> +static void
> +dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> +
> +	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> +	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> +}
> +
>   static void
>   dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
>   {
> @@ -1394,6 +1407,43 @@ dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
>   	dt_regset_free(drp, BPF_REG_0);
>   }
>   
> +/*
> + * Copy a string from the pointer stored in the src register to the pointer
> + * stored in the dst register.  At most strsize characters will be copied, and
> + * if the source string is less than strsize characters, the remainder will be
> + * filled with 0s.
> + */
> +static void
> +dt_cg_strcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +	uint_t		lbl_ok = dt_irlist_label(dlp);
> +	size_t		size = dtp->dt_options[DTRACEOPT_STRSIZE];
> +
> +	if (dt_regset_xalloc_args(drp) == -1)
> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
> +	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_3, src));
> +	dt_regset_xalloc(drp, BPF_REG_0);
> +	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel_str]));
> +
> +	emit(dlp,  BPF_BRANCH_IMM(BPF_JSGE, BPF_REG_0, 0, lbl_ok));
> +	dt_cg_probe_error(yypcb, DTRACEFLT_BADADDR, DT_ISREG, src);
> +
> +	emitl(dlp, lbl_ok,
> +		   BPF_NOP());
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
> +	emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
> +	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
> +	emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
> +	dt_cg_zerosptr(BPF_REG_3, dlp, drp);
> +	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> +	dt_regset_free(drp, BPF_REG_0);
> +	dt_regset_free_args(drp);
> +}
> +
>   static void
>   dt_cg_spill_store(int reg)
>   {
> @@ -3040,19 +3090,6 @@ dt_cg_pop_stack(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
>   	dt_regset_free(drp, treg);
>   }
>   
> -/*
> - * Store a pointer to the 'memory block of zeros' in reg.
> - */
> -static void
> -dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
> -{
> -	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> -	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
> -
> -	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
> -	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
> -}
> -
>   /*
>    * Generate code to promote signed scalars (size < 64 bits) to native register
>    * size (64 bits).
> @@ -4603,7 +4640,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	 * dn_right).
>   	 */
>   	if (dt_node_is_string(dnp)) {
> -		uint_t lbl_null = dt_irlist_label(dlp);
> +		uint_t	lbl_null = dt_irlist_label(dlp);
>   
>   		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, dnp->dn_reg, 0, lbl_null));
>   
> @@ -4619,8 +4656,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   		dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
>   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, dnp->dn_tstring->dn_value));
>   
> -		dt_cg_memcpy(dlp, drp, dnp->dn_reg, BPF_REG_0,
> -			     yypcb->pcb_hdl->dt_options[DTRACEOPT_STRSIZE]);
> +		dt_cg_strcpy(dlp, drp, dnp->dn_reg, BPF_REG_0);
>   
>   		emitl(dlp, lbl_null,
>   			   BPF_NOP());
