Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A31474B9
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714592418; cv=fail; b=q6Sxhi1LJ7K4+fIs9AO5gLkv8gvc29sW/64wdilI9l66bWNFirRWOVpgbOkF1P54/UrgrK8uxjEpZ6Jw5RynJwulcmscQlcWk/t3sp+tYBRl5MUGPRqlSjKcYpJQ7siX8n9XGNnPLLhYvAvWAKOLkeWHDPnjmrT8Rbzm1hXClcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714592418; c=relaxed/simple;
	bh=pakOGQDQymc3u3vuUBeB4VYatNNS+pejfkFfB6Fb2Qg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=evcqDjwwnjW9nOikmeW1erwfpMDB/R65i4ReKdSG3UuJJLrWD1B25La+RH4E952xJQprhVY74tQgIGBoHTyyZipwyxPJSuh6ih8FOqhAX7K2ud+plJ/bRo4NAKdZHvXTAITz7yXZ1Bqa4DOnfAveZhoNbM3ZbENhn5KVyvLD1q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cL4UW+cz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MrSngEJd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cL4UW+cz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MrSngEJd"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441ASNOn022925
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 19:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=G0d5Us/0p4aiRZ9zT0UBGnaKi7q2ktuhpKSX/NraOsA=;
 b=cL4UW+czOtwdL922ei4C2ZUDYnuHdS8OgMbKDKsD46yHSb+Ma86jsENzzwbeBOFeq4fR
 NLd7/bNkGZ3CIvuSpU71PwGr13V2zECujOAV11Atul+a+npFjdek6/fMUvtstgQZK2RL
 EtG0qjOqZRnloWCKC1M1M5Rf7MYYQltUkxdIqkCZtP13b4h+lqr+/t5VqUX1OmdNPOC5
 Lvgz6eqw3Tkfrv7D04isz7eEZQRlwXKGIxWcwZ87h6fEmWEnMjvTsnvBTOhTZ9/wp2n/
 C25114Qu8Ft1vk2iRjz+5gbda23w2Z5gDkpgDOU8ZGr1bN30omB9PIT7xrb7/o85SFMY eg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv7wv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 19:40:14 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441Ia1Kl034620
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 19:40:14 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xu4c1111b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 19:40:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXnkG/q5npyECrzilFp/93C4r17FrG3mnZZjtOOF3Ke8UvpEei+4b/LeXOI5k9/TRVlNNMeY9ts3qn/NWZslLco++3lSZuz5Fxrw1WsvBcBDuTeLZanK8OH9cUhh+yF3MS1x89BKSw2fT5dBB7IMmkJrILrvXgEjkdkuMDFCCGv+I83e1oKPe4Nt/aUas0HH4Km4ZHUXN4UuiN4/V/uyJtKdtLHEA6Nl12ZasgZxIFQSBOOOTD+E9SVAEKPL9XL5UcLlLZQAAXkts8h6ffYyAMnlXrGuFmiCbb4U329Yw7Qom9FxS8Csd2fw8B5utqSZtOk+4mFFck5tIINHa5aR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0d5Us/0p4aiRZ9zT0UBGnaKi7q2ktuhpKSX/NraOsA=;
 b=PkAl1AIa087b8iEGyF6cIQM1NV2DMm9NeVhDY+Nd1azdRjSZ/tLUfP6u030n384+UUB1NSCRQ6OU4Z8Hsh5Z/g6VTfj4tNjt4PcQcI5aGThaunC4+qwHyAWMK5CXGkiF0piEOHgwOCUfIop9xVyafuIE9wKx6Ng2rr7KkA8GBJSZC27xpZt8WQwSZvEFTe0jXRXtavshDAGWs8DlRbcMaxAq8Ogm+iOMzA9OyvWXbvpG9biAvKVSA6w3HmgknlAY3MzrP3JzOOiL0IyJeKBPGMnlWT6PZfC1dYfJULQP/wy4+Qwq/HNrPH9/7rUeYJfoathI3co77BcmeZfPIfGf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0d5Us/0p4aiRZ9zT0UBGnaKi7q2ktuhpKSX/NraOsA=;
 b=MrSngEJd3JS7Gg/EWdsX8IWAn4yRAZVN/g5s27kKclyZrPtrSzzwerdW5gylnp86Xnm+m+db/EsU9x9ubhmLA/JXf0tzHu56dODW4YPsF6bCMWn4w1cIERM38LY2CGzZRHwB/ZImdc3298rxJ5Of0rr50pD4URW4SD6v6PLC9BM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5601.namprd10.prod.outlook.com (2603:10b6:303:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Wed, 1 May
 2024 19:40:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 19:40:12 +0000
Message-ID: <8cbbd931-e46a-6ce9-931c-19f238d70abc@oracle.com>
Date: Wed, 1 May 2024 15:40:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] cg: allow providers to specify a skip count for stack
 retrieval
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287B127ACB48BA73B9CB46CC2192@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287B127ACB48BA73B9CB46CC2192@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0033.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::46) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe820fb-efd5-421a-9a12-08dc6a168450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmtONjVnUG9VWW1rVnRaUUkyNk1VVmw2NkJWVENVeFMzWkFyZjd3dk9TWUVV?=
 =?utf-8?B?azk4T1lmRlN3aDFGdmxVcnJJa1c5KzlCTzk4VFZqanhrcEdER3VVVTRxNVJO?=
 =?utf-8?B?Slh1YjMwNEV4WisyUkd0SEZjVmFsTW1KU01ITzB6cHFjVkN5enBIK1lXUEdn?=
 =?utf-8?B?T0xlaGZmVVdNeFBNQmZwNFJwODc2b0ZBODJEUFhBbkRobWtPQjZTNUcwcHEz?=
 =?utf-8?B?QWNIU05HY1lzQU5RYjNIRExGR2lWaDNHdUNBUnRaN3piZDdnSUNqZ3g3N2Y1?=
 =?utf-8?B?MUVIL3dFU01jRXF5WXdKbzBTK1E5WWdvUG9remUrM01MTmNlSG1hS2N0cWxP?=
 =?utf-8?B?c2JCcU1zK0p6aWl4dGc1bnZIMkNkRDVGMHE1dUo3S1YyRHpRV0lYWFM3Wm9v?=
 =?utf-8?B?Zy80RXZzUlFESUlKUjBSZzBCem5hcGp5NmxDQ0tLa2VsQjdScVRCTWJwTHE5?=
 =?utf-8?B?ck9hcWNuVU1UK1RiTjBsbVVKRXVWS1c5M0pLME9lQUlBUEdmWGJMclZEY0ph?=
 =?utf-8?B?SFlvQ0FUV2EwTk4xT2tENm4yVU9RcGxBb2k5ZlJWQzRzK0hXQXVNaGliK2E2?=
 =?utf-8?B?OFJQQmxvVEJlRFR3a1hvUzRQWHk1ZFdodGd6WDc4eU00UVV6RnFtNmtxdkFT?=
 =?utf-8?B?RHRJbFRTRzVTVVZtRkJTVVR0SG9WK2x2M01GNVNTWjVnMlY0NTkvdDBKMlV3?=
 =?utf-8?B?UEFJUWRKZ2t5cVRyVFBPZWlLZzAzOTJ1MDQ0aWY2RDFyZVBBUnp6U09Ed3Zy?=
 =?utf-8?B?cUxiMXFjUmd0Snh1WGdRZWo4a3h6Vk95U2U2RUhmZnNrL3hGdEpWS25YRXB2?=
 =?utf-8?B?V1JDVXdNZzFTRHVGS0tMaUMxVEZRVDIxY2pHQnUvNEtBS3AwNHgrQTFGL0wy?=
 =?utf-8?B?dnMrNWNxckE2QUlkV3drQnBlbEF6aHp3TDJaaFlaeUF4YnNVbTlWbnNOL3hw?=
 =?utf-8?B?M0dsOTBNWFk1dWxPSHdLbVRhbVBSTVBBL3B2SFpweENodlo0N2tlYlRqRTlN?=
 =?utf-8?B?UWlCaENZWThnUURvZVh0VEFBdFk0M3hsWFlmU09sbFFqaFdvL1FiUkJvL3lq?=
 =?utf-8?B?VVhSTHVqV3pWeFJGWi9uaUxvaEc5UGNqSjVRcC9ML3lmQ05qUjdENmhQTXBJ?=
 =?utf-8?B?NmpDYXp1ejVQTVNkYW5oWEtTMGZOU1crRmYrNElRc3ExYXo1cThFTWZOeWxD?=
 =?utf-8?B?aldDaGRIL1RFT1IxREd5ZDRNVlpIVWpyN3ZuK2NMRy9SN0tPVGdzREFNcnB1?=
 =?utf-8?B?VUVzanFGSlFITDFzK1VnTFBnQzR1VmxMb1F6QVlyOExlZHVjNVhWWlFXdGkw?=
 =?utf-8?B?UVRPdEFCbHRXOURqOGprU3Y1cTdYblR2YUZBYnp4WWtGOUczYXl5alJtOWZN?=
 =?utf-8?B?VllkUnF0bkhiZ2tlSXRPT1Y4NGxRS2Q5d3BveWF6SmNjSkpTSnd0OVVuNGxT?=
 =?utf-8?B?SFVCSWxNRzhSOVM0dng4blkvZDlleC9YbmEraG5SR0NETUNXc2lVc0hiSTh0?=
 =?utf-8?B?bW1NMk01aVhUaWtUaWp3TllJb2g5TzdRMUtqTlNidlQ5RHpKZHFFQkQwTlFt?=
 =?utf-8?B?emtDUlBqSWhyMHhTR1JZbENrUEhVcUJwSVJRbzVQUitGdCszb1BMalI0Q1Ji?=
 =?utf-8?B?dTlEWVhEU0ZqN0JNZHNGMGxFcjJaWXpDbzk3V0w5RHZkbWovMm5aUjlLaXll?=
 =?utf-8?B?TUdNSDBObDRmbGp6VnNlN29ib3M4MytKUWk4MEpkaXN3dy9FUWo4WHZnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXFuSG1BYUtCTTZjMklrTkozbWpZWi96MUtkMXZVL21Hd0xGUTYvTWw2L2ZV?=
 =?utf-8?B?Z1g2TzlYcGhzNWtVcGVIQWN1UXNGb3NTbEFlSHczOGQ2a214MnpBTFlFOHZE?=
 =?utf-8?B?Uml1YzBNdFQyQmVvNDVjdnRXK093S3grS3NmdHgyOE9ld1BoTkRZRTBQS0hB?=
 =?utf-8?B?a3ZONWtJV2VFbDZjVjFFNVhZSmNUV2NkR1dwODRQSnhkbWF0SzEzbHhSeTU2?=
 =?utf-8?B?TlNlMTZOb1BRSjE5dldMcUhZOXQ4K1daY3BaTnFEZVlvRy9xUjI2MmhmY1Q0?=
 =?utf-8?B?RmRPNXQ5RHVrWVNiUUQwbVl1RlRDbkZhVDAweTk1Unl3NlU1dnAzMXpsdnhn?=
 =?utf-8?B?NTNmbEYrVmJwcTdVR00veWpUcWpkQ1J4TEFQTGl5VVZVWEtIUU9rUjRvUWl5?=
 =?utf-8?B?YUtpOFlRbUNLdGdXaTFPUjJzZ3ZKVXVzZ1g5U3pOODRnQnpzSnNhM3V0L0Nz?=
 =?utf-8?B?WDByMXlkRTQ1YTcxL1hCemdPSU5ESGFnRktNVklFRnVOSS9ITy9RUHZsRTND?=
 =?utf-8?B?OHFuNnFSTHJhNEY1akJZY29hdWZCSkI4R0UzN3dBNjVBS3pQRzNuUmU5RE5z?=
 =?utf-8?B?UEs4WmVadFlMSTUwU09RYmxpeDA4Vk1MZlUzc2JqSmpzdEYwZHFXblJJTkRG?=
 =?utf-8?B?MmVwY3hKemswY2VMS3ZXWncrY1RpWFAxN1NwOFdvOUZZSkpSMFkydkgzdnl4?=
 =?utf-8?B?RU1qZFBIRFZ3VFh3S2RWb0YzZDhNV3dwSjExNjFuL0lla0NoOUFTSlFMcXNM?=
 =?utf-8?B?cDg1N0xvMmlITDh5eC9YSVlBZHVuYS8yV1ZlSm14cW5kL2I4bEozQUtqeXFM?=
 =?utf-8?B?TDk1dzNUaTVrSkNaeUdrVlJ4cFlieUkrWVN1anlTNStSRkJVT0E0YU9vM2ow?=
 =?utf-8?B?RjFsMjNGcXV4NXN2NGJkYWZlby83aVBNOXU4S1lMWFA3WXA1T3FkVXFua09s?=
 =?utf-8?B?eGp4Q3RvYVJ2cTdvbkRSNzcwSDNMOTU2OWdyOVVRWlZaWWdOY0dTNzRjRkF2?=
 =?utf-8?B?emZRcmxJc2tkSzhVTFZESXVVcjFaUjl1TFByT0orVnJlRTJESG5ZT0NtLzAz?=
 =?utf-8?B?V2hXU1JpVjNnRXlPKzQ5Z0hVTEg4bXJ4U1ZibFZXQjg1cWY2a2o1VG1lc3lI?=
 =?utf-8?B?REFKWm1RU2NJYXpMYVZ0MnVBUjFwWWFpMkthYmVxYVA0WDFmakk1bU5WcFBs?=
 =?utf-8?B?Q3c0dk5WNzQyNHpETXAzWHMzZGNjUTF2TFZEWXRpVlM5WHkxL2M0QThET1Rr?=
 =?utf-8?B?K3VYQmhzbjBzT0h2YnJQdmVPdDFmVlF4VkZRcUhWeG5rMnFLbTVibmVsY1Qv?=
 =?utf-8?B?a05wRGtRcUd3VVJrREZoRUplMGhUVEF1cWlCZFNrSGQzL0RWUzNXL0dGWWRQ?=
 =?utf-8?B?Q04wUStYUUpWd3Q4VDBIdi8wZ0VqRnlzYm0vbkRBT2FoOHA3bnpqMFJZMXBQ?=
 =?utf-8?B?Y3BKUnZyV2QxT01waEg1VlQzdDN1dW1GNER3eUJJZlhGMHdJWVEyTGNabkh2?=
 =?utf-8?B?SUlZK3N1UUJaVlpSSXNPMFV4djl5dkdkRTV2b1hKR1ZVME52MkNYQ1dKNW1S?=
 =?utf-8?B?d2piUm9mL2IyUGJxbnd2S1U2Y3ljZU5kWk4wY0Q1K2FLSEh6Qm9vUmlHT0pr?=
 =?utf-8?B?d01yVFBNU3h4ZnNKWWo5V1UvMi9XWkZKRVNHUWhvRW56MnVzN1RRRVBDWThQ?=
 =?utf-8?B?TTVzSWpjeW51RWUyVUQ2TThnUWZKZDRQb1J6MG93VUhBblp2WHlLUy8zTkp1?=
 =?utf-8?B?K1FESjk0VHlhM21jSnVtV21uZlR1a041OWNWRUZ3dnJWMHlFRnhrazZ1MllH?=
 =?utf-8?B?OWJZd1ZpUU1PVUo1MkhGdWNKUENJbEdyeE9sRXl5dDBMYzZMN1loZGxCZ0p0?=
 =?utf-8?B?L0ZSaUlLZ3crWUZLZWdBWldydkYxcXUzakZ0Ry9wN3pPc2VQdFc5WWZlU0Rx?=
 =?utf-8?B?Wm9oVWE3dG1ZcTBJK2pHVTcyUVA3T0g4b1lJaU9GUUUzZ29vWXFwcHlnNW9m?=
 =?utf-8?B?VE1INldySWMwVERDNW96WnVBL0FEUDhxa2srTENaTXdiYTFDcVdPSEJaQWdk?=
 =?utf-8?B?cXY3cFFKMDBUSlRMOFJ3UU9CdDYvaTM4aHhLRUNqcy9IUFJ6UEVvL2ViblBP?=
 =?utf-8?Q?fA4cED1EZfgMAvytjsGcdJNm4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YpHBX+TyXs46z6uUr1bAaIMot1e3yxAXriyaS/vXAfmXEOwXaRgQjTz9AB1YQhlPyTbG+AgE4JL1XRTwQ6YUTAxcpE6CwoKZ8+BYBvKqUXUXFTrJqSJMdmwt8nOiZB0Tv7/3tM8Id9478159AZ9uDi2loL8LDBSg9rQJjbczUAHuJpSImTqrJPngDlPYxNDKvK12TdUHbA++sykd6KXJ2dUGHo5zcN+P0cjalls9VaCu4lRoVLmwTGvv2cHt0yM94GV7DEDFEe8BHW9zCXM+llFBplt9bqF1hjt/nZMhA67/qgmgbQAiFdqv9zLWASOc3P2jCzRa2i3Tc5G974EjfG+MbyDLwdesEioFG8pKk3F6XKm4XEMAfeWIeKjy5Bqw8/Lmcr/5trhQvULAFXDS5LnTedh8zKuMjpoIUCKRj2L98BL6ncLJk5JsbJ5A/D9ICj9GrgmDEPr+kXgPg+k7H0JTDaNQcAt3YYDB85XxIGXBHCSUmLDs2gZzLGOEDiAqzf8pyeENmtRrwoEObA/9bUj3LJRcGKhgLZjuqw6sjChh/xnXAOFXfRVGDfwCICOrne9Egit4Wku33SeesnJVklJZt1E3/otmk28V/CF8pSY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe820fb-efd5-421a-9a12-08dc6a168450
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 19:40:12.2968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZlTCEexNmEbnBHwLvB7c+ceT5YM+sJDJLGwL6V7I10lzyXaxpmssLPrTvdA3X9vK5fuJYZ74t2uwNye3B+8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5601
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010139
X-Proofpoint-GUID: bwKvg0SCRnaUA_uGhDZsK_eUvoMD1SIR
X-Proofpoint-ORIG-GUID: bwKvg0SCRnaUA_uGhDZsK_eUvoMD1SIR

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I haven't played much with stack/fentry/fexit, so I hope this is right 
(e.g., stable number of skip frames).  Are our tests robust enough to 
assure us?

BUT!  What about stackdepth in bpf/get_bvar.c?

On 5/1/24 14:22, Kris Van Hees wrote:
> Some probes cause extra frames to be reported with bpf_get_stack() that
> need to be skipped to ensure we report the correct stack trace to the
> consumer.  FBT probes based on fentry/fexit probes need this.
>
> Signed-off-by: Kris Van Hees<kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c       | 6 ++++--
>   libdtrace/dt_prov_fbt.c | 1 +
>   libdtrace/dt_provider.h | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 27246a40..36975406 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2595,7 +2595,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
>   	dt_regset_t	*drp = pcb->pcb_regs;
>   	uint64_t	arg;
> -	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
> +	int		nframes, stacksize, prefsz, skip;
> +	int		align = sizeof(uint64_t);
>   	uint_t		lbl_valid = dt_irlist_label(dlp);
>   
>   	/* Get sizing information from dnp->dn_arg. */
> @@ -2603,6 +2604,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
>   	nframes = DTRACE_USTACK_NFRAMES(arg);
>   	stacksize = nframes * sizeof(uint64_t);
> +	skip = yypcb->pcb_probe->prov->impl->skip_frames;
>   
>   	/* Handle alignment and reserve space in the output buffer. */
>   	if (reg >= 0) {
> @@ -2644,7 +2646,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
>   	}
>   	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> -	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (0 & BPF_F_SKIP_FIELD_MASK)
> +	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (skip & BPF_F_SKIP_FIELD_MASK)
>   					  | (kind == DTRACEACT_USTACK ? BPF_F_USER_STACK : 0)));
>   	dt_regset_xalloc(drp, BPF_REG_0);
>   	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_stack));
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 0ddffa20..dfeecfd1 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -431,6 +431,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>   dt_provimpl_t	dt_fbt_fprobe = {
>   	.name		= prvname,
>   	.prog_type	= BPF_PROG_TYPE_TRACING,
> +	.skip_frames	= 4,
>   	.populate	= &populate,
>   	.load_prog	= &fprobe_prog_load,
>   	.trampoline	= &fprobe_trampoline,
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index a24b1d00..bf3af0be 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -44,6 +44,7 @@ typedef struct dt_argdesc {
>   typedef struct dt_provimpl {
>   	const char *name;			/* provider generic name */
>   	int prog_type;				/* BPF program type */
> +	uint32_t skip_frames;			/* # of stack frames to skip */
>   	int (*populate)(dtrace_hdl_t *dtp);	/* register probes */
>   	int (*provide)(dtrace_hdl_t *dtp,	/* provide probes */
>   		       const dtrace_probedesc_t *pdp);
> -- 2.42.0
