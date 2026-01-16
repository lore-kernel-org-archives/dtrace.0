Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B42270540
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768603416; cv=fail; b=VrSBQ0MJ4YNFMuFn9jXqqTl996UCt6VuaAlizmy/4pDcKRAMPQzkYpsnVmi4zjFlVDOmRPscAjZUG8dHtfmDw3jPwYbD176B+rU5Yp0WAGlniVHsUj5dmvKPd79HSHGiczn04Yft28sGrr8GpTEpYM8Mn65MqOwA49i+ts/hQjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768603416; c=relaxed/simple;
	bh=90IDnzSNTyygmbaAx77Mz8Nic3a1n/pQ7MhRFwASUKc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pJHqM6hk0dfL1Y5v0ffnSY7JpRELK4x73A11N45FIOicZ98CR4KrjuwmXJ6BlBxeljfgZffjMVZtsPtR4lLnEJukWIixAFGcGd5Zz/hJuQC7aVUJpkCu586oBN5ZTr8PVKX8vSRaPxr5pSqtxVwWzX37tRZMHX02AQNm48zk3Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P7v0/sQq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g7UFPYQO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P7v0/sQq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g7UFPYQO"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKWIgB3528778
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=W/R5fHGRZijQ1aSHRkj/hwbemtmod+13aV0YQL40Q2Y=; b=
	P7v0/sQq61OqUCppCVR38W7iHVI89HsXsyEPQHn1bl7PpsuASWj4uY9M/tx9XPaL
	25PZBqiqdidckH39HIOr5BxOaxoeFsDVuIFey5UFvVEt6nXw5soHa5Eh0m/n2mzb
	69U1DzYXfa4XCOm/3R04/TCVmcwnBekgsDRypK8wNb2IG1DwHFfpMMFECltnRc/l
	myINQaVDlvOxmrLPxfra8A2ECowQ+nEUghKlqIyIM7xsGx7aTWliJ/B7dvpl2zYh
	1HBBwakMUada+xVkDMZWA3nxq6yn598vk7cQ8PqWZcsHRie302cu0+mGxvihPUoP
	nZwP2h9lUnG+/kJFbp6rDA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqveqg56v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:43:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKEctO015930
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:43:33 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv6sm70e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 22:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4+XPosaejA1ZjIL0bl3/s9AFo1W4B+KCZVp9O3JBlbHrYVEyV/6+qH3VbxSMiy04dTnIga2czybgB8jNci8TK8l5Zq+R2x30dLWKhBL1L0sN0/nxoPS6tTJgyerAiBT2b3nojqLEufp2wDhZj9KaeUtUCbgIxGyaXnRHz6rEJB+E3SSG0szoxPAlatd9y79asbnuJDWxCpUjEvFf5mbUc0KsDTYbniQoUIRPp6xV2NLC3FQPS6ybwYPu57pAuvkfBKRX0FaK2+iak4HGDvEcmT8JLFzyP35+nF10ko/NbfVFjU2r4ZhGdkKS51WYcpsBss1fzuSF6ACfpIcfdeqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/R5fHGRZijQ1aSHRkj/hwbemtmod+13aV0YQL40Q2Y=;
 b=WceeAGDKYnZdeyJz7k0RbyE+dMaNGb3NjAGIfCTp/n1dcNhzd1vkjGlsKxaWyV5ttGHs9IRUfVsSDtarEkkCLxvbdzpD9r7hQ4RIb0Vn1naucCpOCduFc/dGmZ3KMxRryGd7IsK7ntEBPhWtqHUAVA890sIoRMMZyoi6utBXeAMF4CswHVRqiQfvDnm7IcZhgn0VeF3pENoLxwTkUn2W0/LnSLLbBabLbyISiMZwfoMAVwwSybInctipDIV/XYcs50wFxHn67F5dOb27629OTzHRycQ6GY1XqKZKlrTP2VKZtBavlwn3D9UrslaWfbgeFUF4ot4bpGLsTPmuS36++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/R5fHGRZijQ1aSHRkj/hwbemtmod+13aV0YQL40Q2Y=;
 b=g7UFPYQOCqGiB8tVqWcZ6R7YfLc98Fk7mr5wW85odYdg+ruFEhuv7ZGXZkocsu3VgQoEvcFxXje5g1DNCY1eVqXJcbLj7RrD/DVE68eN9sKiKhNgXH9TYV36AmzY4DYuC1Z3ydVAXATB6i8QbSgtTpcw1ckJYW6uaucS2DRqUMk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7164.namprd10.prod.outlook.com (2603:10b6:610:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 22:43:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 22:43:30 +0000
Message-ID: <7631d4ee-49f4-d757-d1b2-705fea0ba8d7@oracle.com>
Date: Fri, 16 Jan 2026 17:43:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] rawfbt: prvname is not properly set
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260113214205.9159-1-eugene.loh@oracle.com>
 <20260113214205.9159-2-eugene.loh@oracle.com> <aWlnowR5WC8zzdd+@oracle.com>
 <cfc4a3c2-b2b3-b912-f53b-1a995388db11@oracle.com>
 <aWq1YWvbTGl7nJni@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aWq1YWvbTGl7nJni@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR12CA0033.namprd12.prod.outlook.com
 (2603:10b6:208:a8::46) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e647a5a-b9f0-490b-13af-08de5550abae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEZSRjBsZUE1VE5WZEM0V0VBVGk0U3g4ZThOOVhFc09qdEovYWRRTGdzbTM0?=
 =?utf-8?B?WEwzRzd6bzhQeTJqOVo3TzZmVXVMRlB1blFLQVZmak5wb25YZEpEc3VNRm1t?=
 =?utf-8?B?SEZGQ2x3d0tJblJzZ25KNUpHUVVDZ3phU01Gc1ViVjBZaXJUdnR5QVpuTUZq?=
 =?utf-8?B?QTVmZlJKV2hjOWg1OVNjaG5ya2tmWS8vZWNMaGs0NzU5SmM0WjdDdFp1cC9l?=
 =?utf-8?B?TDJndldGenQzTUFYdVVybU9VN0xBMjVaeGlDR3RWeU9kL2dFVis0bDQ5V1hF?=
 =?utf-8?B?akJWL094ZFJucUdsWnBkeW16Mm9RV2Y2QXd5MktiaTBJRVBJL0pENEkxTmsr?=
 =?utf-8?B?VGNYU25ocHBjQndraGQvK3VtQnN0Q3l5N25lR1JrNVFNNklCc2diTVB0VmtK?=
 =?utf-8?B?alIrTi92R0xtUERJMklyTDhCOW5oc2VZNjVNRFBBQ2tCWnl6V0lQV29PTEw5?=
 =?utf-8?B?QURWMjFwS0NBb0p6YnRESXYwRUlVQ2lyaHdvc1Q2OGw2WjBJYVd1MkVtVWhH?=
 =?utf-8?B?eEhKTzQwdnYxWkhmQisxNTBySFMyVzNHdHNEcVpMVGxCaDM4Q1dVSzNxK3NO?=
 =?utf-8?B?UHloRlVpcXF2c1JSWi9ZVm1oT1E4SEFOS0dGM3U1L3JQUVlidjBtQ1ZTaGxr?=
 =?utf-8?B?ckJ5T3NCT2U1OFE3K0s2cDdSUytSRUVxSnp4Skh1bWo3cGUvKzBNbXFpM1pl?=
 =?utf-8?B?ZzV4alhWQ3pUTEhNT3Z2ejUwYTRwdDR4Q1h3SUJBTWxMMStKNy9XQ29IZzA0?=
 =?utf-8?B?U1FPYmwxNGR0VDRLa2dWa2Y5Z3lmNWhzR3NteFBpVXdpZFNPTlRDYXRtbFZT?=
 =?utf-8?B?UU9naFBCb1JQS003WkZMcnZGd1VQQlc2TVNXSEI1b1YraGpEMUwrcjFCOUNS?=
 =?utf-8?B?Z001VDN0VmJnZVBVUVZBcGVCSk5TSzRadVlKSjQzU2pidWtkTEhadzhLVkNk?=
 =?utf-8?B?NlNTdE5tN09HNEVkcXErQXZGNGY1U1dBdGZ2UFFPTGU3WGRXOWZUZUZCU3Zs?=
 =?utf-8?B?ZXRDTHgya1ZNU1pwV1h4TzF6cHMxK2lOL0JKQjYrQkdpUzFZN28yS3FudDhv?=
 =?utf-8?B?T3VnWnA3MVZNUVlYUzMrdWk4RjFpVjVBWkFOaDhrdnNHNTdJeEdQTFVMSlRC?=
 =?utf-8?B?Y1N6R1BzV3RNM1Q5ZU9vRndpMkNSUWcvc1U3VTFYUitrelNFcHRLQ1dwLy9j?=
 =?utf-8?B?dGpXL2diMEVQK3ZoemZLRHJWRUVMNzcvNjNDSW1sQU9JTjZ3WHEyVXR3bUxq?=
 =?utf-8?B?SlRqdnp0Mkx3QmppUWNlWDJNeXJRaWJ4QnBxSWwzdHB6SXVLUDFMaGxRcGJT?=
 =?utf-8?B?dzNkSmhDdzdsbmN6bHZkWHVRMGlZNEd1SjdjT3RiMlVIenRyZzZFSXIyMTIy?=
 =?utf-8?B?blA4d0J0c3IvcURaVEQrcC9jODBRYXdOQnluWkFKUFQvUVdWY3QrTE8xb0JJ?=
 =?utf-8?B?RE04Q1dqQmNuUzRQb1lIbUd4N0ZpbUJkVFJBOUx5ZktiRUdhZWNYenJ3c2FC?=
 =?utf-8?B?R1l4blBkWVRDcWZBdGxUZHZhalB2SFlaMTE3cEZnSnJrWTVSZlJLanlBK0VS?=
 =?utf-8?B?QnRoY2ludlZkU3lDTTkxZDBCSXpLeTRmaTc0OWNic1QzaDlvU0VDOWNqdTFr?=
 =?utf-8?B?blNVVW5MV2M4Zi9XL216MUEyOFJYTmF6V0lOWllqeVNkUFN0ZUMzRFZFSEpk?=
 =?utf-8?B?Mk5Td3RQU05tVXZ2TU9lQWNhN0FIbThSMHVUZG5pV09QUXZBZGJTaG5jUWtL?=
 =?utf-8?B?V004THN3b3l5OVBST1NkWDNkZmtWaGZoOW03S2J4ZFVmOG5VZ21IV3VuNnBP?=
 =?utf-8?B?M29YckxPWXdyVDZXOVZGZDNsbmlROGtraVhJeXFDNDlUSTY2MVdqSzlOVTJl?=
 =?utf-8?B?alFCTlBQRjd4eXJkbnhFQkRlTnZqK2V5U0tKalJoNWRvNnNlVWVrN0ttN000?=
 =?utf-8?B?T2MzYzdRcDhUdElveVNZcDd1THVlV2ZVQ2pWSDdINTRaKzhRalc0Mkw1VXZi?=
 =?utf-8?B?S01ZaTJ0RVk4UDJiYXRVMkp5azQ0VVZWdm16QjY5OFhKWGVQOHRtVkhoVWo3?=
 =?utf-8?B?TmVRcDRDQlQzVzdndE9OSUhlZUdONzl5dS9DQnB4UkJTVzMyckpRbjFRQllx?=
 =?utf-8?Q?qdE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmtOeTVuQ2h0UHZ0M2drVVY0ZmdMRGsvTVovRkhHWkJEWDVIaGE1dGJEQjNo?=
 =?utf-8?B?Q3NNbmpDNFlNQ3A5bkZsZ1htZ2w2YUhTTU9NMnhTRU45RFg3WlMwUzRlOEgw?=
 =?utf-8?B?REg5MGJpKzRWb0c5dUI0MDRxaUVuak9IaFlEYWx5SGl3YUZ2aVdaTGRFc0xp?=
 =?utf-8?B?c2hTcVhwUFg4aFVUd1FXS3hGWUlabUlFTXh0Q01XUEN3OWIzSG9QZ2R4RS9h?=
 =?utf-8?B?Y3N0cFZyWHZGNTJmV3doN1UybjEvYW04Z0tMbTIzLzlKN09HR0l0NjhYdWRI?=
 =?utf-8?B?V0U5d0RRS1NtUUFGMTNvOEVob29iU3pIT1BOYytaeU5FVEdwYUpGYktRS1dC?=
 =?utf-8?B?ZjZnaUF5Ui9iTHpCZG9UMTdOckdyYklEVVNBUVdpK01lUWVNTFl3OWVLd3d5?=
 =?utf-8?B?NVRGZEhDWGZpQ0xnWmhnbEdYZGpHNmh5Tng0RFJoekdOd3haR0oxSXA1SU9O?=
 =?utf-8?B?L211cmd1T2xRK2VGRG1tTTc4N1JDOFhacnNCZG8rRzFGUzBoQkRHWjJhSHNt?=
 =?utf-8?B?U2VkVWp6dzhWQVljOGFrU1lvRVl1c0t3d0xubzdLd3pkaDFzTUNOeEtqYnh0?=
 =?utf-8?B?MjkwUG9rZkMrWFU0NmFlWW4vNG5wcUtnZDJ6Sm92cUtpcUNEaDhUdmJDQ3h3?=
 =?utf-8?B?SWFtMlNCc1ZtdTJ6OUVOZnFsRkc0T1N0MVYyZE94T3loSlEwbGlzNlVCUEk2?=
 =?utf-8?B?NGJXQVhPNDBjSWhJU0U2ZmJSQ2h6YUs3MGp5TkJjKzZMRk9PWEY1OC9oTXJn?=
 =?utf-8?B?cFZDOVV3Q3JMeUxXRDhENjBVUlUwUVh4ZjIySjVSQTlCUUUyV3BoeWZGSmta?=
 =?utf-8?B?NGtWRzBpYzlBRldlaGNHTk9RQkxZemFRcTI2LytoNktoYSsvZG1NaUtBK2VP?=
 =?utf-8?B?REtINkpRaDNsMzJZSFdOblo1Um1iRzhEYnJvOUJ0T3IyMnc2U3RqMzlCNEYy?=
 =?utf-8?B?Qk5FL01rSllNdU9yUTUzRWhyVmFtY0FuTUxad05jMFo0VnZ3cUxjc1c4Q0RM?=
 =?utf-8?B?NXVkWFFRNDBBYm1uRXhiWk5jenorN0dkejVGcVR6b0hNMGxFNzg3N20yZDdJ?=
 =?utf-8?B?ZnNkeGpsblMxVktvaWU1NzJ6c1ZIRUcwM1QxUUFyZXp1NjAxZGpsTWU2ckVs?=
 =?utf-8?B?R2FIdXl2VHd0U2lXMTMxUzQ2QUZtNU52L1k0azlaTEZ2REVkZm5zd3BQY3RZ?=
 =?utf-8?B?cTUyYnYwQ3RZSjVZV1JPazMwWmFrSzQxUWlVYmFlZDVDZHk4Uk1lQW1vK2Q3?=
 =?utf-8?B?ZC9vQ2ZvM09neEtkMTdCYlJ0Qm1zRE9naTI3VUJIRWRvWGE5eTZyaHBrSWEy?=
 =?utf-8?B?ZlgxYmVsUXJvbU9IcGlOeGZYR1N0S0pOeWhxZktwVXkwNWJiVVhDTFNTeWov?=
 =?utf-8?B?L3hsVzg3ZWFUdCtuRENXdkNwaWJPdDZzYTBDdkRMSEQwaWVvbFhZTzV1N0Zx?=
 =?utf-8?B?TmFoWjQ3ejBWN2x6SVhmbTNhMUhXNlVIYjI0c0FNRnpMbTNNUnd6eXY2SWoz?=
 =?utf-8?B?eFJsWGR4cVpURGZHQzNaWHBNS2FRL1B4ajZZS0xxR0JNZVdJQkNIcXlQbEYx?=
 =?utf-8?B?K1YwZjFjaEFjZnJzS2hLU1BiQmwyTENYUWRVVkppWTZrNnhyTXVmc2YxWnhl?=
 =?utf-8?B?djdXREdUdUhqc3N3bG0xaEJqSGdMc1UyRW9tbk1neU5saDVuSmZMb3pmS3pq?=
 =?utf-8?B?ajVuNGYvbDltalRYTmRVWEFRMldyZDhjQ1dPRnpZVWlvRXhJYzdjWE9IbGlj?=
 =?utf-8?B?dEVGaUJQOTFLTy9MeGJSQTR1VkF3bkNSNHhnTkVXRkZWL2pnZnBpYi9nTXFq?=
 =?utf-8?B?cUdzS3R2THEyUGtuN3dJWVVKelJxeUUzL214UmxCdXpWTmFBV3ZvRlQ5UGVK?=
 =?utf-8?B?SStMRTlWd2oxSU1Lcm02QWJ1ZmNQY0Y1S2ZwcmpsRm1yQWp0QUw4UFk5VGRO?=
 =?utf-8?B?Q0o5NEpvUnUrMVFzNFBkZE13eWkvcExiWTRLVzl2VXVpeTlPZ1p0UkszZlhJ?=
 =?utf-8?B?cWp6eGZhcEN4ZXlWTE93UHZpNktxL2c1SDZPRm1QNTBEcUZEVi9EbUdFQjFS?=
 =?utf-8?B?aHJTaFB5aEhXYjlOaVVOWUtBelNZbTVGaWFHNGx1T29FbWNCMk4rMGo3SThp?=
 =?utf-8?B?QzdTc0VQMWtIRTNIczZMY2swWFRGOU0xSlQvWk5qUEg2cWNycG1EMDhPOU9o?=
 =?utf-8?B?TVlwaWlZSVBzdGNGV3E0T2pVL2wreHlEbXM4bHhBVkFxWEFaUXFMMHFsVXYz?=
 =?utf-8?B?L0pLT3d4N0hJa29VWFBwZUxEVjhoYVdoV09QZWprQ3hzOE00d29ad2cxRCtY?=
 =?utf-8?B?R2xZNjdGaHl1UzZ2TGNNZDdsUVZUMUVSSTB6S2VpaVRpeUQ1MDU2dz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n9aciUPmU4lJ2bj0Pu/if78QTt5XTYjwV6jvWyH9wokWcAk74TXnERn/lw78XiHIFDmpJmc2M+OXKeVFovoS9RP2ElwD/X6KyNGeAbcFrKtLtYD7lvabhb33HwGw/UO1vebejse8YO55G0ftuQHD9bDRgUZUoHBrXLRzgaz6jPDZpIwArQD0/CEj81V/UIc6JzqAxGwwp+xYnmYxpNUnmZqauYznUU1hDPJX6o+nqzsdItJkJh05RRUeTnR7tI1fUT8MusEuIbHfem9MVkiKmhmBaB0uLFzPWLrYpGYqIVaMmSGOTDo15WgQ2oKzxvq7nISEqU1Gk93WWju3nzsVe9Uv9q+ZmegZgvLQmAOCacW1Q/5SXTY5JDVtUEUhQAH1U76wL40Q38bf+ztM/DHJ9ktEXIlBtx0+9jfY3jfme+L74fBySuPKXFlpsaVscs8wGH/p1+cSm8U5AWCRavT4iHI7t/Tv9/M52zTz2KpXNu6fN2fJe865QaYJc3LUwOv0tpyxqJ/7xLbUdRzIa/rA2npkk54uOXrlY4ShUrjsV4hZm21d+n6qP2A7dP8MosYyZjI7xHfqO+oXZaYFGpuqV2HfPhP0ucFvcGR2z/bxXVM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e647a5a-b9f0-490b-13af-08de5550abae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:43:30.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Js3oxbDqZF6rqvaw2xBkTnmTq/MJvfazbMCSNctLUYNMc8lpnfvdq/HUirPUie3+jkU5MZEngvJKcXIia6BVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7164
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601160171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3MCBTYWx0ZWRfXzA6in7Az+V8V
 Xv9jOI6xesOXrGBMMqlSMqsvu/PZMS4sY2o0FTPDxQTsNA0Q/49qMl2x9EOuNVDT1rjgJLy5dqZ
 Hp5syrYhrueGP2NrE5vkciHN+UNs9Ub9fF8RpkLD00arr8c/hQqH8mLiI4PzXejviFeINkxZOcd
 3S/CdLy2YiDkkV1a5Z1oCARBHpY5M3XP6MeTJE+vTpiQbR2YqgwA0FtzbxnFwO2LfXSL30QMOWt
 6aLeSsFMyNNTDgkRVAOX/oFwSnb5THI2Au/MBwGeYhGCO3BYf7goFnXWGOh0c/x3C5+Z6XBZWs7
 lGDEDOn70hClfgFtGWbqcOiami7K2VhPnwnQ1VJIMGCV5f5M84OaKDlVzAeOnLAjOOxdDL9FyH3
 0WhndeCQV+Z9+HJK3S6qDF/sDlVXTL+E+8Y9KbH1O15t8x8lOhgQpXBzt3tii+QBXGuh06d4oN5
 jiMvUoZteQPrcJ/qOOQ==
X-Authority-Analysis: v=2.4 cv=TOJIilla c=1 sm=1 tr=0 ts=696abf16 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=a1HdgIus2ag43LqNbxQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3RIAXfQB4hpZdCyhvR5bSQvOM3hmnqFE
X-Proofpoint-GUID: 3RIAXfQB4hpZdCyhvR5bSQvOM3hmnqFE

On 1/16/26 17:02, Kris Van Hees wrote:

> On Fri, Jan 16, 2026 at 12:18:51AM -0500, Eugene Loh wrote:
>> On 1/15/26 17:18, Kris Van Hees wrote:
>>> On Tue, Jan 13, 2026 at 04:42:05PM -0500, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> [...]
>>>>
>>>> Add a test to check that a rawfbt probe can be found behind an fbt probe
>>>> when the probe description has a wildcard provider.
>>>>
>>>> Orabug: 38842114
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
>>>> new file mode 100644
>>>> @@ -0,0 +1,20 @@
>>>> +/*
>>>> + * ASSERTION: rawfbt probes can be found even when a wildcard provider
>>>> + * description also allows fbt probes.
>>>> + */
>>>> +
>>>> +#pragma D option quiet
>>>> +
>>>> +BEGIN,
>>>> +*fbt:vmlinux:do_sys_open*:entry
>>>> +{
>>>> +	printf("success\n");
>>>> +	exit(0);
>>>> +}
>>> I am confused how this test accomplishes verification of the assertion.  If
>>> a regular FBT probe satisfies the probe description, wouldn't this pass also?
>>> Wouldn't a -l based test be better here, where you can test that the output
>>> does indeed report both the fbt probe and the rawfbt probe that match?
>> It appears that -l is not an issue;  a -l test does not show the problem.
>> The test in the patch is derived from the user bug report that motivated
>> this patch.
>>
>> The whole prvname problem is that the bad prvname value makes GROUP_DATA
>> bad, which makes FBT_GROUP_DATA bad, which is an issue only in kprobe_attach
>> (and detach).  So, we need kprobe_attach() to see the problem.
> Ok, so yes, -l is not sufficient.  But still, even if the test is derived from
> the original reported problem, it still looks wrong to me.  Or rather, the test
> can pass when
>
> 	fbt:vmlinux:do_sys+open*:entry exists
> 	rawfbt:vmlinux:do_sys+open*:entry does NOT exist
>
> because as long as 1 probe matches the probe specification, compilation will
> succeed (and at runtime, the probe firing will complete the success criterium).
>
> But that is not a valid PASS result for the assertion that is posed for this
> test.  If you are specifically looking for a rawfbt probe using a wildcard, you
> might want to use r*fbt:vmlinux:do_sys+open*:entry instead perhaps?

This test is admittedly not the most stringent;  it could well pass even 
if some other bugs lurk somewhere.  The test simply reports a problem 
with the old bits and then passes with the fix.  It is a confirmation -- 
however weak -- that the fix is doing something right.

Meanwhile, I do not understand your concerns with regards to the 
assertion.  Specifically, using r*fbt would preclude any fbt probes;  so 
there would be nothing for the rawfbt probe to "hide behind."  And, 
fwiw, using r*fbt makes the test pass even without the fix.
