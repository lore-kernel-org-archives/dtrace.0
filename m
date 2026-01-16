Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506613594F
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768540745; cv=fail; b=QkhgovppZyGnsRpsOIrnxnHvBHdUmVViIcgX7h+WCnQHmCH1OcMfx1C5bG/6OlKEA7CY4DaVLI9J2Oq/lv0aSeh3CIAc7CTovOnKK+ZiBM2HrS9kX3cJAJXDFukuXNCz53dwkTSLySgcgN1uDfSFf6MkQ6iEFpsV60AD5i7rdZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768540745; c=relaxed/simple;
	bh=nhwivWQ1TMtbvEcNfB4A+VRbS25OospsDdVDWsZkBzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b2b5Ok3ocGaN7F4NveR+tf1apq0cg2yhJ9X5xrlX0rF0UYBJnTB+9OaO1EV0t4AbEWYUp6IOrIkSI6etzV0zLnk2c65K+8i1H5e786jBYkjYVCwLXcf03ZRhj9NbWjxIrtbAwsBLtm+ShmuQ4uSkX6T9rpPLmLUaGSZ5CHxAJKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TKPem/FL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WEU4mjPl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TKPem/FL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WEU4mjPl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FNNnKa1430848
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 05:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+vfTVLDeyT/T+A4Ej7YImG9Y9Yej1kkZerv16HWak3I=; b=
	TKPem/FLsHoHJdl28btrkgvSWcAjQ4gdezRVra8l91EU7SOjy1Ar03QCTeBPza2T
	b3GClT6C7OTBjBCkdhEZ/qtVJ5ZYX8A7PZWha5CmL3H0JEVwKjiCxgrGuLYUmv0L
	z5L4nI+LUXV9RLpxASCug4Y4QjKV0dnj6hMc1R/JQFO5xvg+KyTJdT00eNhdSbhy
	yy6Qu6Dg1TdIsR9j2q88MUfskvQXHBvQWxtQXkZE9pmqvgJM1+2HlLNvzI/BvLD4
	a7Gu/irnphgsX+9fi/H9v+A2oFf+9b91IKAKdxMnxxUzX6QrAauNlQqxTrZps3Go
	tcfCEa1IsIa7Ru5i8Ai5BQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkre41es0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 05:19:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60G5ExY0006236
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 05:19:01 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7c2kr4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 05:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3hbhZF9S0G6H3jAKWZIp08Am3R9l4MuO0NCIH7hR6TTNP0hChhHXrkbCsH+3rbpVbGqWCH5AIVRMj/xrWy47RnPwDHycaEULkfCwjs052Nuh+4oBrpkv5Jpv5dICBpjvb1VJOBwI4fzZUAQj3omSY2Neavd9zxql1vJI3HCv2ZX2nHShu7DKVVGa94G7fMSZqqSvdDlfxHpbxTjDpqiDiRleAjihkMgGgd3GB4iQvQCIITiWZjWvv+RlUQ7FXwgpHwEH4LUmO7XET1wUFr1E/4TTNBJFGdMhY+hgk8banoPdDYLl/u/1ubrxAZQXBBbWvWicgjlQFjPRKN1bBi8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vfTVLDeyT/T+A4Ej7YImG9Y9Yej1kkZerv16HWak3I=;
 b=xdPi2aO1Jjc3tAsr4HpNtH+5QeMSKM4+G2x/owxM474EUbhjYqUEAq4gYoVYmM/LnltbKoZiDg4b7QuDq0vg6JOBsGx4Sfs7uO7248BwrkuYue51sTSBH4Iti4zGCbP8gwnHLqgiwu01oy/1uq5Lt4gJfSNBzPoAachTO1GMPoZ5XFsFDEjHWlmu0wLVjDhp7WVMKfVOxAkfve5C8oPepKUK8a+E+1fNVxhKp23B36ducMKaYQI3Vw2cj17BEhSXmdKKs/9mv8E4EqN7194fcp1qinpvNMFWMA2YV5RymH6MSBxqbEg08vQY7XXlkYViHwlAWz+1BLgXbH629MLqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vfTVLDeyT/T+A4Ej7YImG9Y9Yej1kkZerv16HWak3I=;
 b=WEU4mjPlE6iwCo187y6K3keGiA1zmDMrEowCC4yZjJ6JYRPjovoNvQyNtzoxs2a94QCObRYfQjDlVYprlCJgUWOIvrhvGtm9W9OnTcxUwBGlK5P+v4KiLuxeq13tksO7PZDs8khkhHBZX+OjHbO61dUvlL/XVMNEHFKrZocDjeo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 05:18:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 05:18:53 +0000
Message-ID: <cfc4a3c2-b2b3-b912-f53b-1a995388db11@oracle.com>
Date: Fri, 16 Jan 2026 00:18:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] rawfbt: prvname is not properly set
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260113214205.9159-1-eugene.loh@oracle.com>
 <20260113214205.9159-2-eugene.loh@oracle.com> <aWlnowR5WC8zzdd+@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aWlnowR5WC8zzdd+@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0075.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a13feb-33f2-4bae-783a-08de54bebd4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW5QWTk2MS8zWnpYdUdmcjhkQVgvL1N3cjA5c2dTVHl0RWh5NVI1VjBFSmZt?=
 =?utf-8?B?eWVGck9obzZCSHFmVm04NWowN05Za1ZNdmt5bVpYYVIrZTdGVjFvRngyL1VF?=
 =?utf-8?B?VzZMRmgwRW5nNTNpU0pVcWVHV29FS3pQSUVQQnJ2Q1F1WEJtQ1BTVGhCcGtn?=
 =?utf-8?B?ZTU3ZEFpTUkrS2poOFRLNzcrejErTHhMQkZpVE1nR3p6V2lZQVR1bUpSanVl?=
 =?utf-8?B?c1hLbDRQdnR1Z3J3MEh0eWpJMXByaStqYVUvaWI2akM0RzhVVTdGcDlqUWkx?=
 =?utf-8?B?YUV5RmJYVEFYZVR4cXFJaTVRdXV2UnZRNHNld1llbzN6RnFUUUpXdVRxa0Iv?=
 =?utf-8?B?K0M0a2p1ejhGSzUxbXlRVkRhNmx0R0VjUVZUWDVoc0laSW4rODFURXJocm1J?=
 =?utf-8?B?OVpDV2M4Q3FCeTIwZkg0ZGlWMUJRanFWWHRBVklrZTYwM29XMTdXTUJDakY4?=
 =?utf-8?B?UnhZalB6UG1MTmtEUjVLb3Z5V2lNSGJVWHRnc1Q3OEtydjNjbHo4WXhlY1Zv?=
 =?utf-8?B?ZVl5QmhvdWJCTzNzUXZsbTRRS3QyaFFBMHhINWRWTE5rNXBQVzhnTnFzekxG?=
 =?utf-8?B?SDErZGxqRE9xdkExOFE5ZGYwMVAwS0FqM0t4NlgvS092RE5HSWtCV3ZsSDAr?=
 =?utf-8?B?bkJXaHR3NnV2NG90ZmFSQVRmbVpuazRGQVovL0pudmRXa2VydEZVcXRWS2M0?=
 =?utf-8?B?eHRRZlExYS9xSVdBWU91Y0dyb2JvemdScnRPNUNCS1kwMFdYK2J3dmIzMS8z?=
 =?utf-8?B?ZVdjWE95V2lCa3o4LzVGRDBJaXIwNSt1emhIL0cyNlRneDR4RHVLRmFaOWZL?=
 =?utf-8?B?ejZpNWF2cHpTcjFkcjVhZXROcS9RRUhPcTJCU0krcXcrSmpWRDI3b2VVNFJi?=
 =?utf-8?B?WkVxUUNnbmFhaVRVckhpTGw2NUFQTDliY1pGUHhOVVJKNldGdmZHdXJFWG1L?=
 =?utf-8?B?Umt2aEZkNlUycHJHeU5IZnNaZlR0ckpzM2N1eno2dU1xaDVvc3Y4d014dWhU?=
 =?utf-8?B?Zk1uR0JLbENObEJ2K2RoTjhnWDdLbFVuMGVqOU40U25iN0ludi9pTXZBNmgr?=
 =?utf-8?B?emhRUXZTTjQ5ejFNeE1HRlplZU5WRXJxMFhnS1FqSENrZDJmT3JUaVE0Vnph?=
 =?utf-8?B?R21DSVNHSldWKzRRVzQxa2t5Nnlwd25OakJCSEtHeE9RNDE1aFArRnltSkkr?=
 =?utf-8?B?QlBENlZYM2VPbUd1VHE5eGI3TUpSZ1pVOWhrM3RTQjd0SmNZOTlFNTdVMXQv?=
 =?utf-8?B?RzZtYkFCSzY2dTZXYXBwbFFvVElkd2pCbzR1MkY4eGRXNGRWa1ZhTCtOZEZw?=
 =?utf-8?B?Y0d2QUU0MWQ0MWVsc2loSmw4Z092RHdQMTlqbzFhRkxFY3BjaWhRaHhoM043?=
 =?utf-8?B?VGdOaExxSFVMRWp0TURWZU1XWStTL0s5V010MXl5RWtNYlNGTmZ0ODhlZnhh?=
 =?utf-8?B?N3hkOHZKYW1qWUNxbExRY2lTcjlWT20yUitwaHFweUNRR0dzSTNYMVBDeFFP?=
 =?utf-8?B?TWt6MTFQTVM2bjVmL3YvWG1YM2VsaUV1VEx1MURkeDkwSitSeTdrRW1jQUhP?=
 =?utf-8?B?UjJRczVTU09TQlFSV2czTCtBeDUzVDkzMlAyN21oQ2h2bFdGRDkyekhlMHow?=
 =?utf-8?B?QkJmTmhPR0Ftb1BpUVdrdXkrUjJMcGpZM21MVTVsWWFGVng3bi9MZmNjdy9I?=
 =?utf-8?B?SWw5TTV0eU1JS2c5Q3pLU0YzWmhoUFp5K3ZXa1FuVm9JRmd4TE5HQ3M0VE42?=
 =?utf-8?B?c1VkcWhhb1gzUTNOK3R5RXRoTFBSRTYyOE1SKzEwMUJKMzdsMDdVend0c040?=
 =?utf-8?B?RTBDek41TFljRDREcU00NnhkREFwNWl3dmxKVitpSEZVaFBHOStTdE1OSWNs?=
 =?utf-8?B?ZDdlL2J2ekdKakQyQ09ReXVWZ1grYUNCdkR5ZldHejcxQkhxRERvT0Mwbnhx?=
 =?utf-8?B?KzczRGl1aUllN1dNcmgxajloOFVaSU10R1JuOWJsMlBZdUZYd1p6dFJJQVpY?=
 =?utf-8?B?cEtpOE5NdDl5ODEwZ1dOa05zdjVKNVRTZUNmVE1NQTROVUN6c04zS3oyRjhU?=
 =?utf-8?B?Y29EUnRSaTY2RXB3UksxcDc1YXBmWE9Da1lpRjVJOG5aWXB4MUZHejFpdXhP?=
 =?utf-8?Q?YcAgJbA8BMS/Gm1SgU2doN1DR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1dRYThGaUExZDBJU0U1aFJnRnRodFNESkVLOFBlVzhUM0VBbk02RVBCRXdD?=
 =?utf-8?B?eWJHM2U1bWtTVEpPVHE3SXBzWnl5aTNNZTZzd0Nob1V5UEI4ZjZlQWp3cG1u?=
 =?utf-8?B?K0ZmNFluVGFCNzEzVTE1MERNbUplbWJsWmVRN1duekJjQVk3YjF3ckY1RWN1?=
 =?utf-8?B?d3FRRW5CZ2RaUnVJN3pwK1VDbkY4TnliVEpHZ25UUUhkYmRUbUhPMjRoUURC?=
 =?utf-8?B?dmZROWFta082eVRSMVdGc3FKVTV5aVBZS0NnRmJ5TWJTeUVjU29CTkl6QlRK?=
 =?utf-8?B?VjlHQndUSGVuQ0toK1VCWjlRUUZ0UTVteWVKcUxPKzYycEMzc3laOHFlUmJl?=
 =?utf-8?B?NVVYL281QTQyV0ZNVDFaVjl4NEpPR2hEZkJVekdXdTlNVHV0cklxZEZxaGxY?=
 =?utf-8?B?WkFIK043TWtTVHNBVmMvV0t3MFZNb1o0WWZsRnBEOFhYZldLWGZmc25JcVox?=
 =?utf-8?B?R0IwTzhzQnRZbS9BWXF0b3I5QkR3NC9BRlJ2Y3ZsVVdGN1ZMWSt6djVIemxS?=
 =?utf-8?B?SUNxVFZlZGl0YUhKbjZRbFBQUGtRTnN4aDkxemNhWjFvNU8zbEZQcEsvTkFk?=
 =?utf-8?B?STZRQjE3SE00ZHJ5b1VJeDlmbXpXaTdmKzhQOHJWNkV5VkR6NFhVQmxDMHVO?=
 =?utf-8?B?WDdDeFU4RC9OWmhYL090VHVtUTMzc3ZkNjltbkh5VFZGVG1KQ2YxeG9xTHRn?=
 =?utf-8?B?bW4zWE40VDdBUThDWTd0bWJxSTFEMWk3SUdjRURVOWlGdC9sakNVdmpUQjlm?=
 =?utf-8?B?ckNDS0trWW5WMUk1U1BPZjFzWUZsaTZtNFcrZlRyVGQxZGxLZHR0cnBTUkth?=
 =?utf-8?B?MVdnVTRnL2xDVGJzNGRoMmRDSWxrVTdJUTR3aGtEZE12Q3d0R1BLNUFYUzlo?=
 =?utf-8?B?eXkzbE9Da2Z1UjVlZzhtQXJtbVExeEl0bmpBMk8yaTZPSjc4OG9SbUtYemQx?=
 =?utf-8?B?QW1jNDNxaWpIWTBUbTRPbERJem56MTRZNldLR2V4YklES25EaUE5T0dOeUNM?=
 =?utf-8?B?b1drQmxMNkcyaUZudGpnT1JhdGN0QTRGYkRpTjhLWUkvWUVyWXIrc2ZDRzVv?=
 =?utf-8?B?QzAydW9TcThOemI4R3ptMWVuS0lIdlE4STYvQUJ3eTBHTnBIZjhBSThiSE9i?=
 =?utf-8?B?RThLNFdWZGRxU2tYSUpySjVVNm03a2RWTzB1N0lGSW94V3hkTW52bDAvVkFy?=
 =?utf-8?B?ZEpzUThyREhCMEpTb3F3aXVxZTFaQU9zMjBLWFdXWThWQStueCtyNENPalpq?=
 =?utf-8?B?ZXNnV1QxdVN6LzYrYWpKZXhJWTZNa25CeWhPY0NHbmJidGwxYjg1dUxRNWc1?=
 =?utf-8?B?UjlIVTB2djkrUU1mYTlzTzN6UnJUKzNGUXlBZGRJcTgyVGpxSmt5Q1ZybzNN?=
 =?utf-8?B?dnQrYWxaUVlXK3h1OWE1UXcyaXdYQ01XeTZ2eURwUVlrV3doQlU5cHo5Vllw?=
 =?utf-8?B?M2xBdXNpdnJYcDR6TjFUMnA2dGUyTlRYdFFER0RreGZYQlJndEdTaVFjbEMv?=
 =?utf-8?B?c3phbGhPd0JZY3NJamhZRk9GQW83QjRjbHQ1Q294NE00YzV0UVIvREhCb0Mw?=
 =?utf-8?B?cHF4bENBb05WT0xkWXZjR20wOXN4U0dNZFFocWxmYmFPSzh4UFR0dmV3ZFQ3?=
 =?utf-8?B?ZmROMGhBYzFLYXlqblpPTGhGWW83NUgySjdjQU9DYTI2dnlNeUQ2SE1jR3RC?=
 =?utf-8?B?N3JNZmQwUUxHdENIajJib29yVEVuRzV6Q0Y4OWZZT1ZqZUVIK0RKR3RKVENG?=
 =?utf-8?B?Y1FjcW1nNVg3K3g2K3Z6NGs5d3kxa09qMVdEYVAxQUtwb1BUTmhLTEtzNUpF?=
 =?utf-8?B?eDFBVkY5YU5NMUNnY3dOT3RJU0ozYjNHOGhDOVhNNUQxdkFHT003VjAxOWdt?=
 =?utf-8?B?alRHUkJTdG5rek13OWRRVTVLVDZSZE9oeE4wZWZHKzRQd0hwWGpiclFSKzda?=
 =?utf-8?B?Y2gzTTNYeEtreE5YbmVnY1Z2aXpJcDVFRnpsWW40NDNIWDdBYVQ1Z0xrY1Nk?=
 =?utf-8?B?cVZ4Ni9BT28xUzl0T2xzR0hwejNGV21OWGE2dldmZ2FxU2V4SkVlMXhhRDFT?=
 =?utf-8?B?K1NGeTM0RFNlQXN3UVMvaXBQaWlyeWtaSWRRQW1xRXNDL09Sc1JvOGU1eHg3?=
 =?utf-8?B?UWhpbUF2WGJZempnbzZwSUdxWG5tbmQvZ2J4Z3Uvc3JWOTNsRWE1aWlDT283?=
 =?utf-8?B?T1ovV2Z4T2JNZVNpYm0zSGZ5RXFMdnFEdzRPM3lrZE9oazVhbTZWeEdvZWN0?=
 =?utf-8?B?c0s0eldjYis4bm5haytIdjBFSDRtOXFJb1MyY1E4L3J3ektPU2ptdTdCd3VU?=
 =?utf-8?B?ZERPZUgrMVJYSnVtQklvWUtiTE5iTCtmVElyYmFMRDNhaWxoK3Fwdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jt8V6QD3W6rODxSvGtPn8jiCQeRxo1xl/7FFoQO1c9zqhw7jRFtvc1zgs5SX2KVHj2phNceqjyw2m+78wkQkhPbI4Dkuu0eQ+RlKzu/7q7WucwEhpJEZHA+B0QeJilxuLceYvQvoHNbY8WFzucdxMgrKqSJgbtwUfThGc+Kb+gl05KJWpVuain4UOd0tAdgyMqOvgz8uzvQpBQ98s7sgpF9kaBUDtE6HWM2TOhtRZmGuH9U6cO+ex/KR93EV3fu4974MNXa0DQLKoPy7kBW+wYLNbKmAtmEAmhY32dDzmQRyWf9VAfJcYjKDY26G6jDXGtxuEzDC91/gJqhEyumSfhbcEhYElODI2Zi6qTdO16KIz1xnBFcI1UN7F/jO55V4Lput71B+g47Lm/gkJme6PMDjxiE3pS9OqjUQLz2t82a825hZqCcZT1mPwZWlFLiGJXy3tsU6MPrZP1AX97NJvc3u+J7szP2fXs3o163MOCgI9/Esoh47ket4TBHyWX/Va0s5Lq/U3iTInjPj0dDtEJ8Tl+tR649SayDkeDAuypooq2DmzC2LAMSk5cGsctZTjoX+H1blstqEvNCYSNyRbJj+IalwWRpWpsnu5m90C3I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a13feb-33f2-4bae-783a-08de54bebd4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:18:53.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmwaBl8ULDhsYER5Uc0ixRIh7M9aUjkIiF6MIz6pvpBVaI0v7hP0IgPp2HMgF72h5H/BIvbu2QrE9e42Z7gfdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160041
X-Proofpoint-ORIG-GUID: -qwXNnRIuQHoUb8Kift4xZR9fc1Pd3Js
X-Authority-Analysis: v=2.4 cv=YKOSCBGx c=1 sm=1 tr=0 ts=6969ca46 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=549CepK1Ao5t7TUToacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0MCBTYWx0ZWRfXyTSWpBEySMEV
 0of7T9B3Ziwl2MfRy/RGBb89kE7acQtduQUg6XJ5YAkrT0t5fffsQRmP9epg1hYsVnFEb205ffb
 71JglNDPM9MTabGeY99DqRr5H8s+CteRBuFE95v2FzUNs+ILrDdp3tdWqGjknGvZTN83LWxTdHJ
 XBPqViE4+wxEd8iGWDvynIfNqyzEbaRnmj6XOih0t+etznrMiQpSvFfNfuGsaXBeQ8nyn7l8M/5
 0Vo0FkouzGQzdhc1HrqSliMa3mAmCBeHBT2f61PX+HVGbTJs3sPoAS9YjvNKvgX/ghu0rPJc5R8
 2ZBEISc3jrLWmlQ0hODHPpSqsJct9sYI2ew+XRymKE8SOnGZX7ojVBBHISxJiz8ZL084uI6c4Zc
 3Z9udKeb1a99dUIzIobSISQOGpZAMVEWZbwmLtjOFqOn7Z2c7h9AbMV0KMI+28Nkt7gWwCq8QpB
 SqfIzXMIGCbzuDeWFdw==
X-Proofpoint-GUID: -qwXNnRIuQHoUb8Kift4xZR9fc1Pd3Js

On 1/15/26 17:18, Kris Van Hees wrote:

> On Tue, Jan 13, 2026 at 04:42:05PM -0500, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The char array prvname[] is set for each provider.  It is used in the
>> file that implements the provider.  It might also be passed to
>> dt_sdt_populate() via a function argument.
>>
>> However, dt_provider_tp.h also defines the macro GROUP_DATA in terms of
>> prvname.  In turn, GROUP_DATA is used not only in dt_prov_dtrace.c but
>> then again in dt_prov_fbt.c to define FBT_GROUP_DATA.
>>
>> In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
>> the fbt and rawfbt providers are combined into a single file.  Thus, two
>> uses of prvname collide.  The in-file collisions get resolved, but the
>> cascade of macro definitions does not:  FBT_GROUP_DATA ends up using
>> "fbt" for both fbt and rawfbt providers.  As a result, it is possible
>> for rawfbt probes not to be seen.
>>
>> Notice that GROUP_DATA is always paired with prp->desc->prb.  Therefore,
>> simply replace:
>>      -#define GROUP_DATA     getpid(), prvname
>>      +#define PROBE_DATA     getpid(), prp->desc->prv, prp->desc->prb
>> This makes the code more compact and relieves the macro definitions from
>> needing prvname.  It also makes the FBT_GROUP_DATA macro unnecessary.
>>
>> The format (FMT) macro is similarly renamed and redefined to include the
>> probe info.
>>
>> Add a test to check that a rawfbt probe can be found behind an fbt probe
>> when the probe description has a wildcard provider.
>>
>> Orabug: 38842114
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_prov_dtrace.c                    | 14 ++++++-------
>>   libdtrace/dt_prov_fbt.c                       | 13 ++++++------
>>   libdtrace/dt_prov_rawtp.c                     |  4 ++--
>>   libdtrace/dt_prov_sdt.c                       |  4 ++--
>>   libdtrace/dt_provider_tp.h                    | 12 +++++------
>>   .../providers/rawfbt/tst.wildcard-provider.d  | 20 +++++++++++++++++++
>>   .../providers/rawfbt/tst.wildcard-provider.r  |  2 ++
>>   7 files changed, 45 insertions(+), 24 deletions(-)
>>   create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.d
>>   create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.r
>>
>> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
>> index 34b5d8e24..102afd84e 100644
>> --- a/libdtrace/dt_prov_dtrace.c
>> +++ b/libdtrace/dt_prov_dtrace.c
>> @@ -243,8 +243,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>   		/* add a uprobe */
>>   		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
>>   		if (fd != -1) {
>> -			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
>> -				     GROUP_DATA, prp->desc->prb, spec);
>> +			rc = dprintf(fd, "p:" PROBE_FMT " %s\n",
>> +				     PROBE_DATA, spec);
>>   			close(fd);
>>   		}
>>   		free(spec);
>> @@ -252,14 +252,14 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>   			return -ENOENT;
>>   
>>   		/* open format file */
>> -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
>> -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
>> +		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
>> +			       EVENTSFS, PROBE_DATA) + 1;
>>   		fn = dt_alloc(dtp, len);
>>   		if (fn == NULL)
>>   			return -ENOENT;
>>   
>> -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
>> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
>> +		snprintf(fn, len, "%s" PROBE_FMT "/format",
>> +			 EVENTSFS, PROBE_DATA);
> How about also changing this to use asprintf() rather than doing the douoble
> snprintf (one to get the langth, the alloc, and then actually populate).

Sure, sounds good.  On the other hand, this is in dt_prov_dtrace, while 
the main point of the patch is an fbt problem.  Yeah, I know, not a big 
deal.  But since we've been chasing these asprintf() sites 
opportunistically over a couple of patches and there are several (4?) 
more sites to go, how about I do all these asprintf() conversions in a 
separate patch?

>>   		f = fopen(fn, "r");
>>   		dt_free(dtp, fn);
>>   		if (f == NULL)
>> @@ -300,7 +300,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>>   	if (fd == -1)
>>   		return;
>>   
>> -	dprintf(fd, "-:" GROUP_FMT "/%s\n", GROUP_DATA, prp->desc->prb);
>> +	dprintf(fd, "-:" PROBE_FMT "\n", PROBE_DATA);
>>   	close(fd);
>>   }
>>   
>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>> index 3feac56ea..8dbf9740a 100644
>> --- a/libdtrace/dt_prov_fbt.c
>> +++ b/libdtrace/dt_prov_fbt.c
>> @@ -53,8 +53,7 @@ static const char		prvname[] = "fbt";
>>   
>>   #define KPROBE_EVENTS		TRACEFS "kprobe_events"
>>   
>> -#define FBT_GROUP_FMT		GROUP_FMT "_%s"
>> -#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
>> +#define FBT_PROBE_FMT		"dt_%d_%s_%s"
>>   
>>   static const dtrace_pattr_t	pattr = {
>>   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
>> @@ -508,16 +507,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>   		if (fd == -1)
>>   			goto out;
>>   
>> -		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
>> +		rc = dprintf(fd, "%c:" FBT_PROBE_FMT "/%s %s\n",
>>   			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
>> -			     FBT_GROUP_DATA, tpn, fun);
>> +			     PROBE_DATA, tpn, fun);
>>   		close(fd);
>>   		if (rc == -1)
>>   			goto out;
>>   
>>   		/* create format file name */
>> -		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
>> -			     FBT_GROUP_DATA, tpn) == -1)
>> +		if (asprintf(&fn, "%s" FBT_PROBE_FMT "/%s/format", EVENTSFS,
>> +			     PROBE_DATA, tpn) == -1)
>>   			goto out;
>>   
>>   		/* open format file */
>> @@ -583,7 +582,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>>   		}
>>   	}
>>   
>> -	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
>> +	dprintf(fd, "-:" FBT_PROBE_FMT "/%s\n", PROBE_DATA, tpn);
>>   	close(fd);
>>   
>>   	if (tpn != prp->desc->fun)
>> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
>> index 709f7040f..e3269f4b3 100644
>> --- a/libdtrace/dt_prov_rawtp.c
>> +++ b/libdtrace/dt_prov_rawtp.c
>> @@ -56,7 +56,7 @@ static const dtrace_pattr_t	pattr = {
>>   /*
>>    * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
>>    * We need to ignore these groups:
>> - *   - GROUP_FMT (created by DTrace processes)
>> + *   - PROBE_SFMT
>>    *   - kprobes and uprobes
>>    *   - syscalls (handled by a different provider)
>>    *   - pid and usdt probes (ditto)
>> @@ -89,7 +89,7 @@ static int populate(dtrace_hdl_t *dtp)
>>   
>>   			*p++ = '\0';
>>   
>> -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
>> +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
>>   				free(str);
>>   				continue;
>>   			}
>> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
>> index 74555f5be..ee2cc3c27 100644
>> --- a/libdtrace/dt_prov_sdt.c
>> +++ b/libdtrace/dt_prov_sdt.c
>> @@ -54,7 +54,7 @@ static const dtrace_pattr_t	pattr = {
>>   /*
>>    * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
>>    * We need to ignore these groups:
>> - *   - GROUP_FMT (created by DTrace processes)
>> + *   - PROBE_SFMT
>>    *   - kprobes and uprobes
>>    *   - syscalls (handled by a different provider)
>>    *   - pid and usdt probes (ditto)
>> @@ -87,7 +87,7 @@ static int populate(dtrace_hdl_t *dtp)
>>   
>>   			*p++ = '\0';
>>   
>> -			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
>> +			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
>>   				free(str);
>>   				continue;
>>   			}
>> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
>> index f131b1e02..406609d1b 100644
>> --- a/libdtrace/dt_provider_tp.h
>> +++ b/libdtrace/dt_provider_tp.h
>> @@ -18,13 +18,13 @@ extern "C" {
>>    * Tracepoint group naming format for DTrace providers.  Providers may append
>>    * to this format string as needed.
>>    *
>> - * GROUP_DATA provides the necessary data items to populate the format string
>> - * (PID of the dtrace process and the provider name).  GROUP_SFMT is like
>> - * GROUP_FMT, but for sscanf().
>> + * PROBE_DATA provides the necessary data items to populate the format string.
>> + * PROBE_FMT formats that data.
>> + * PROBE_SFMT is a format string for recognizing PROBE_FMT data in sscanf().
>>    */
>> -#define GROUP_FMT	"dt_%d_%s"
>> -#define GROUP_SFMT	"dt_%d_%ms"
>> -#define GROUP_DATA	getpid(), prvname
>> +#define PROBE_DATA	getpid(), prp->desc->prv, prp->desc->prb
>> +#define PROBE_FMT	"dt_%d_%s/%s"
>> +#define PROBE_SFMT	"dt_%d_%ms"
>>   
>>   typedef struct tp_probe tp_probe_t;
>>   
>> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
>> new file mode 100644
>> index 000000000..ad9f4c779
>> --- /dev/null
>> +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
>> @@ -0,0 +1,20 @@
>> +/*
>> + * Oracle Linux DTrace.
>> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
>> + * Licensed under the Universal Permissive License v 1.0 as shown at
>> + * http://oss.oracle.com/licenses/upl.
>> + */
>> +
>> +/*
>> + * ASSERTION: rawfbt probes can be found even when a wildcard provider
>> + * description also allows fbt probes.
>> + */
>> +
>> +#pragma D option quiet
>> +
>> +BEGIN,
>> +*fbt:vmlinux:do_sys_open*:entry
>> +{
>> +	printf("success\n");
>> +	exit(0);
>> +}
> I am confused how this test accomplishes verification of the assertion.  If
> a regular FBT probe satisfies the probe description, wouldn't this pass also?
> Wouldn't a -l based test be better here, where you can test that the output
> does indeed report both the fbt probe and the rawfbt probe that match?

It appears that -l is not an issue;  a -l test does not show the 
problem.  The test in the patch is derived from the user bug report that 
motivated this patch.

The whole prvname problem is that the bad prvname value makes GROUP_DATA 
bad, which makes FBT_GROUP_DATA bad, which is an issue only in 
kprobe_attach (and detach).  So, we need kprobe_attach() to see the problem.

>> diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.r b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
>> new file mode 100644
>> index 000000000..b34a52d2f
>> --- /dev/null
>> +++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
>> @@ -0,0 +1,2 @@
>> +success
>> +
>> -- 
>> 2.47.3
>>
