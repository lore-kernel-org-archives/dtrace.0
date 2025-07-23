Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD32DEA89
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279492; cv=fail; b=CS+W2GvkIJQenvtocxGSKhHiTGtQwjGXd+OpTz9N7AxRLzsq7hZnFua9GELUmNrIBFjyV7Avb9v96W0dPDjXiE3G1oSZ6g4KwxrkdufJ2Pgru6KvJd3xIR0BFYNkmyBhwvpMfPzsHIRabf1F0e5iJ6WHhaoWxDHA6w99tgsBVPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279492; c=relaxed/simple;
	bh=mdts4h4Z6P/x/lE6SVJKN8zmhDioMOUOo/kQtemcTvA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0mwL8QlRS/erNvupM0diTU7+S0Fv3lr8B1PtuUDPJpLpCkIvypHIObE5CF66Q9Z6huD04fzHQSDmKBPxIYNM4EllfR9MvhVY8DBc2dWEyFYVf8goddSPTqrdTsVqVQY+jpHrSZ6o7OjkQ/fBOL/W6Z1JDVLUQBLenbe4aQiVrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2ok9Coh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KkpE7k0O; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2ok9Coh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KkpE7k0O"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8MrT1002567
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 14:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IwsV+tXOPTtoWutBXYcpBB7qbIbefdzDSM5gBXZ0QSU=; b=
	C2ok9Coh5KzFjQFeT+jh0D28NCg5dGmuqUhiC/pDFANGKImw0IU+7xaShL3d+seY
	acLQpRoZmrKZMQStPxDAsN3eN4RFfaY08kPDaLFRowiR1u2AR3VZfWxXeCcu4sqi
	GsVdDoGKJ6g3Ys3sPdzB32Kpw7h4eWhTSZ+6Bbl3uey22/9SDfSTUy3C0EO6/VPg
	/NCSZKZWv3Bg3xKrNx0TY+1RMa99mv9aPnQQXZeFHFnu7HCRXEfzUW5lvhHIJb1m
	sC9KjzuexHsNSDXk77YADoC9Dh0XI8DlrUvNusd/E4UsCDq3wAeMiDBWUEK12Ckg
	qP4WRQ3/YNDl0p9FeFid7g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qyrxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 14:04:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDmskK014403
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 14:04:48 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tgy4r0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 14:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ukk2ydxyTG1m6mOdvN+Vl0tZ+eNAhmiT64NunDUlYaAoMrh2QOn729Y3OawqmPHYvGa35+kfjZkwp6mYr/nAselv541xElKN7BfGd+cBfZH4d/gGTxOo4L+MWOAkIfVVT0CUqoWTTo8lbAYINTvjRRp3mYN1zFNFszvpO2RZsWFQReAIgJTFsDwFeB28AbganLHaxLz+Q7MnTsfhoDtadut2Y0ab7hIM5nG+ar9osfGgISKV+IUyhqkXJMb+PZjbrN3AzTO6i7mNjS8RFtmw11W5WKwna29fZZiT7RW9McnTcjUbXt7YrAp8bG36FOIxhvp/veJ2h5C9tXnZuDFYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwsV+tXOPTtoWutBXYcpBB7qbIbefdzDSM5gBXZ0QSU=;
 b=sUAor3TgL/6b+vLD0eWK5RgGHPRUqjr19bjfgdjcwgbwFSNAAkzkyu5/zlFJ/G7Y8mMiHk3Mjd6+eyix+ExSGcsdRQ+1tz1UML1nix0LVOT+i3kwBE03H43CqJbi/xhn+zzkNEXstsF+xPEx0+U9lXnBkZjPTVPyyteC0Dh2txxem0ZGD57NYO6V+ttaVQA2JGGSDLzyjNpuRKpcJSjfucbgQmpaGBncfigI4dS7JmMJyT6m45pHBBNv6IBdImOy/aW8+k5phc8Lm9kS7JHMgyMnwmm7Pc4xTWn3h+jZeJHWbMNvBLOYQaW9X7y+uiM6KUnaLdn4moa+c8+cQywnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwsV+tXOPTtoWutBXYcpBB7qbIbefdzDSM5gBXZ0QSU=;
 b=KkpE7k0O/Nae2aUBeNG4cYJEJBoG8pkicTszdB2NdQOX7qwmG8HCblgTZCb+bc1HJ3W6ciEoiyIus0sxJVEPRo7sUYFvpkz9g+za5ORiwROgIPJxado+ODbNwHRyU9yDOclLb0tQdJVFRp+X9Gqta86zXsV/bLxHkDCKhHm9b+4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7529.namprd10.prod.outlook.com (2603:10b6:610:154::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 14:04:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 14:04:44 +0000
Message-ID: <6f5f4984-9064-ee4d-03f6-6697ed53ae64@oracle.com>
Date: Wed, 23 Jul 2025 10:04:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] lexer: support // comments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56728D6097EC38EDA2B06306C25CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <d1113b7b-0ace-d350-40d8-58ecf4ec2ab8@oracle.com>
 <aIBTpwDzRyutOjl9@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIBTpwDzRyutOjl9@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: f05940b4-6727-491d-ac60-08ddc9f1e016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTdTM3FmZXcrSm9MZDJKTXJTekhXK3pDYVpHck1hODZIODNUTGt3WlFhOE9M?=
 =?utf-8?B?S1RKaEN0b2ZLUUlJK0JlQVZHSU9PN0Y0Z3JRbzhPek81SDJsY0Fxcmw1N0hw?=
 =?utf-8?B?dVZwKzN0L3pvQkFGTi9LdWQ0MERsWmg1L0luQ3JlenFFUGRqa1Ztck5DRFJy?=
 =?utf-8?B?TFpqOUxkTFVKSG5hV1JjeitPNmZQeFNQc2pRdFV0YkVBZVVoL2pUM0twenJJ?=
 =?utf-8?B?SkttcWZnQUVoZzcyemlNZEdJWFpKZ09aZEI2UWxhbVRock9leDhFUWd1WE54?=
 =?utf-8?B?NGVnajVxeGxlQTUrQTV4V0tNemxlZWRQenVTbWo3bm5jNlBPZlpIUUU2bW51?=
 =?utf-8?B?TE5hSUdiMWEwbmJJbittaFd2TEhtMEFhL2pRanJEZW5KYlVGanJxdDU4ZlVG?=
 =?utf-8?B?cVN2dVAzMjcxUVdnSk54OWR6Rk9HL2pmVGRlT1RoOUsweXphMGhtZkxEY1Ur?=
 =?utf-8?B?ZW1yOXFEdncwVlBYdGM0T2hwTlBubXJTYnlxNDBiTzJVNUJjSEs4NXBMcFg1?=
 =?utf-8?B?UGRmMnpZS2VSdTdETGM0YzRYRHJNM1lEbEQ2TE9GaUxCS0VjUWJjYkh2ejgy?=
 =?utf-8?B?ckZGOVdEQ3FTemZGY3FGa1hlMXU5VHJhbWFvVkxDN3l3YmNHZzY4ZDJ4cTNJ?=
 =?utf-8?B?c2tVZllBalUvSTdPTzcrMS95aElaN0VSMko5VFRuRC9IUmwrRUdiOU5UTjh3?=
 =?utf-8?B?UDk0SzhGVzFRb2lKSi90SUhyK3h1RW5SMkZPSjAzSHhkNE4rUG5XMXZjVFh4?=
 =?utf-8?B?WVR2SGtxN2NFd1AzR3dzMURGVTBTdmVOeDFocEFKeENsdXluOEVkSnZ6eXRW?=
 =?utf-8?B?NHBPUUw3YktzUmE1STFFZ2ZRK3B6cTBqdkJrWVU2RmUwWXM2T21kbW44QkpR?=
 =?utf-8?B?eEg2eVV4R1YwYkNyQjBhQmw1U1lYQ1lQQkFkbUxocEg0ZDRuMFR3UXF6QUYx?=
 =?utf-8?B?RmZPRWRWdGx6dElQOXBJclptMUNwa1hyYy9TYVRKNTFCREhMVVUzZHd4L3g5?=
 =?utf-8?B?ZW95TFlKeWVvdGlJL0dnTngvVkhVdWxGenhhdk9VM2VNNllrcDBPMFZOTWY1?=
 =?utf-8?B?a21EOHpnbkZUMkdUd1d2VkkrV0RETUNoVWdEbFJodGFyV0lZUUxtYTFvM3l2?=
 =?utf-8?B?STJhaGlJYUcwclVoRElmWEZQUHk0SFduZ0NzRzc4eWFGV1VLazBnMnNHY0F5?=
 =?utf-8?B?OTRzNDM1K0NuMHJibUtzZjRtcTR3SVI2cVlvbkRUT21zcEN6YVRFQXRJdFFI?=
 =?utf-8?B?SjgvTHg1VXhCWXovMDNlcDNPK2xTbEsrNm1XSlpUSjFzR0xBSjN4Q29QcGp1?=
 =?utf-8?B?L3cwNzJUb0JIZFg3dDBUSjRibkxCdEhyanhUNklUb2ZIUFVCdWd0WGZ1RTZ6?=
 =?utf-8?B?a1IvTmFzaldpekhVWVBWRWVCTUxRYWdsRGFHMTRHdXp5OUdtZURueVAxVk4w?=
 =?utf-8?B?dHZFNWd2NEh3dFEzWW1uNnhZM0pGYk0zdExnaU9ETkJlVDVmV0hyRTFNaHVF?=
 =?utf-8?B?Q3lVbHlvOXVGam1IeDZjNE03RUhOZXRGbFhGSjRnN2FPcWNkY0lZZW04TERW?=
 =?utf-8?B?MVV1QzZEZlJHYkN2NHNaNnlmQWxjVUpzQ2tBMDhSaitsS3Q3SUVBQnpsbXVy?=
 =?utf-8?B?clEwcTVaMDFWS3A2TENnc09tRDF2NmJTRTNzRGU5Q0VjdTJhVTVqRXU3QTNy?=
 =?utf-8?B?aVV5V0dKclJ5clJDamJ4eE9TeWdOYUdTUnM4ZDNFdk81eGtPMGM3aUtJUHRn?=
 =?utf-8?B?dnd0MGdnUXFoQUZDcm5tblkxUHd2aTAwQXNyMjNaS3BpNWUvdmJJTXRHT09V?=
 =?utf-8?B?amhmd3RZOVQra0F5ZWxJamZwMEE5b0RRRlFXTVk2RjJJT3VlR05ySXBqOWhB?=
 =?utf-8?B?alhvUVNERHMyZUludGRWNGZ2VFBweFMrNkJ6a0oyb2FyNXllSlV2MU5JMS81?=
 =?utf-8?Q?ygcv/gqkbTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTlkK3VKQjkydXo4eDZpdWZqSEtWNFdSN0kzNzZuNWdBMG0zREVPZXo5QU5F?=
 =?utf-8?B?bENsRnRDR0NPa0QyTEJXb04vSDMwREN5UFV2WVh3SlJ5UVlNUXdIcTFYM1VN?=
 =?utf-8?B?NGpadG9odXVQWEZRcVdSaGlzWHdOQW92VWJZNFJYbUlTd253cUVtcWNaY2Ez?=
 =?utf-8?B?MVYyMlFsekd3bHV1enpjdjF0REpJdnoxcjNENGVjTWhKT2NjN2ZCcE9YUmZh?=
 =?utf-8?B?Lzl1QkRBL2V4TFphS3Z2SysyREtlaU43U3NGYTdhdXNCdmVrS2gvWGpNZGYw?=
 =?utf-8?B?YXNZQmcwY1hwSlZMQmpDY1BWWk9jNnJTWko2NTFlRXR6NFZvcVZBcFkvN243?=
 =?utf-8?B?djVkUS9vREtVMk9xYXBRK0t4dzVOQnQrai9sSmFxbzRmendsdGN1SzVrT2Rs?=
 =?utf-8?B?QXlnQndHcmg5SkdBNUtpelY2T0YzVWdZdjlSdGZmbkNOSGM0c2NBUjRLb2xw?=
 =?utf-8?B?YXVSY0tJZGxsbGdSVG9ycnlYL2V5MFBUd2lxazRWVXZpUVUyemtha1g3cXZD?=
 =?utf-8?B?bG10K1BkK2dtN09rc3ZyMEdQUkhvRllCdmF6TEczOS9tYWY3Z2cwbm56YW5j?=
 =?utf-8?B?SGR1Vm5heGs5QzJRV0paZlJ3YjFBeEZhR1FPQ091bFN3YjFzeEFGeGtFQ21w?=
 =?utf-8?B?UG5uaVdsdzRUQ2xGN3ZFSG5uSTdTQUE2WmVHNTZ5VWZMZjdPV3kvNWhrbWww?=
 =?utf-8?B?SEI3aVRsaDdic3Z4WjQzaVV0ZUxDN2FGOXNtMG9VUTl5dTRGT2hXeGZHYXpx?=
 =?utf-8?B?aGpGZlNma0E3Qm9jVlNZbHpVcVd5TEEyZmFUVGMycTZLeUdqSmZObUFtS0lJ?=
 =?utf-8?B?ZVg3OUJoTXFrTlhjaWpzU09MVFlDRW1xNXJMTFJDdG11Q05nL0ZISU5TUS9u?=
 =?utf-8?B?RSt1QWprNllRdjd2N2EyTFJneGhKSktNQWtucUIvRTFOZFVrR3p1ZytQUmoy?=
 =?utf-8?B?OXJvenFhMXR5SWNGMCtBMEh6MC9ZOVJoUytpVHJHZyt0L2FtUm15eTkrS3o3?=
 =?utf-8?B?RFh6RUNZWU1GYk1MLzB1eXprSGdsY2NFd3FnWE5GYWY3akx2My9kd1ZibTJo?=
 =?utf-8?B?VnozeFhjeTk4cm5wd0QyaERSaWpTMm8vV3dsVlhrdkdHdXpYemJjY3p5WHBp?=
 =?utf-8?B?QUx2NkVYWEFEZHA2M25jenF6Z05ZTVRvK09EcUZwazNVb0xMTVh2STNtajZI?=
 =?utf-8?B?djhtMEFOSWphUGlIU0txZDhWOU83bjdFZ0o5RC84MUF3OElmR3JDUG5WSkZS?=
 =?utf-8?B?U2RKK2hVOXdmMU11WUNXdWUyaFBTeEJCWEx3MkJLUWQyYm14QzBrNHhZaDdJ?=
 =?utf-8?B?c2lDUjVrRHY2bFNhSEJFR2pkVy9oOXJ4cVM4T2xJbmROanJGZUJsL1NQNGY3?=
 =?utf-8?B?VEJLbGJwOXJJSTh4NjY4QnNVYzJtV3k3WkpjZFY3NkNkQ09FRENHRnFBVWhH?=
 =?utf-8?B?amUzZWxFRVlqR3FUaVRud1A3ejZodUpQQU1rMTNmMmZnWHVMK0txMHRNTEtx?=
 =?utf-8?B?ZTNHSU9xVlBUM0E5WURWOUpjclFubEo3WEJpdjhqd2tGRzVkbHpOTGtsdkk2?=
 =?utf-8?B?dEZZamozSnd3TXNsWnZVTEtPU1FsbjNyRlVQR1I2QTUzNmNrQXpsKytaMmcw?=
 =?utf-8?B?L3dzK0p3K3haQS9FUlQvbk1xcGxFeFB0aVBTRjNWVUJuVDZGV3VPZUwreGJz?=
 =?utf-8?B?eEdvZWEwVmIxcC95eUMwL3hwUFBzNjVBMy90anNhNU0rUnExaXk4Q3ZjUE9K?=
 =?utf-8?B?NUhxcGQ5TnpaZlM0dGovem15cVl0aGlaZjIwaklYNFFKTHZzcmMvTE5Odjd1?=
 =?utf-8?B?V29pNS9QNFQ5ZTMwTFlldTgvQVFjSlhJeldnUkhQdjFhNTVYVm4xRENBOTBQ?=
 =?utf-8?B?TEJPbkVpUFEvL015bllnNndiblJTNUh3NEhKRVJTZnBhZEE5NldBL0NOSHpN?=
 =?utf-8?B?NzIrQmFEcWttaFJCSVMzT3BoTzFjRzN1bEkyS3kybEYyWkxhVUp2MVJBTERt?=
 =?utf-8?B?RXBrMFMzR3owaU04WkpMQ2FXdTFVSjdqVUNyQlFBNWhhL0d2dUlmbURvZHFS?=
 =?utf-8?B?cTBFaVlvQU9ONUFqeHFGME9BS2ptZHVCTUg1OUVqNXc2TGh0UU5JQWs5RVoy?=
 =?utf-8?Q?stu3uvB1YdsdO7MSwDP9WZOWe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DM+8z+G3+bQWuq70f24JH0EUma/1RZCq4KBp2c2xlHNlHzzq+hn3zMmccnhfmUI2MMk+he5d/pTuS/eI4zg+gwvfYgG+Vqw6ORnX66PGjADqfvX27DTiyjkzRxiE3VSJuRnHD6Ua8tOilg18x+d94qFvfcwozXIGsgOeAmf4P+BCCN5bQVBEOL7LewFEOFFg8ZCOlbtbKav9yTtHAwnJTt56gWLgHbcaSscY8h3D8T3aL+Zak/wnfw5UsdllNdGxoB+tEwy3AZnJYZ9XCwIPCI4X/KpfSwKU0XoEoCZRGKoZe7fmGe2cKeuxWCao4vSNX79mCeUMXRkzWWdpwAhnyDebJL359OH4IFv+bE+jVM7paGgi34M9S+ftICrpGnirQLFva6V0ewWUu//lxekUzf5tnh50J6LQdcgLAZz/8P1NGTX33dbBj7LLMDxoApG9xL+kX8/tfWbrMhuEtf/b0FLxlTBcVpZiGd4HGDLt4GImdBXc5f//s8Gze/tC+FPxYl6Q/2hXkZEi6pVAM/LqziOody1YYNPNYDQZlxxCvr9oUE2S+qU4Z+grt/1i3zK0qvSQnhmmIXF4oAZ70/q/gNGMlTJY4xtmTmthCKuSBHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05940b4-6727-491d-ac60-08ddc9f1e016
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 14:04:44.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzdLKPhFvdXUldyMnpeh/LBvMv55/LFmfX2LrPIGNOtXVERvgrUBEQ3o4hqwEymn0xbpkph9QXNIquPtfvYu8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7529
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507230121
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=6880ec01 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=B75En0YVNLkkGBm9Tr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12061
X-Proofpoint-ORIG-GUID: CVKGqGJ7Npg4DDABV4mY0zmR1bpzX7kM
X-Proofpoint-GUID: CVKGqGJ7Npg4DDABV4mY0zmR1bpzX7kM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEyMSBTYWx0ZWRfX16AYlaHhRYvk
 lNfdeOIzh8yiM0duGfCHgG5YPzLGDAFY0ui5yQsgXHxl6/oisGscKzIddAKzQDPXnkj5ZhRwh87
 jUCua60DjAIJGIeWzT1H8tAEn69RBF0iAaYgVbkzGmGvzwy6t+7utYStQ8iGiiYDvlD15vJn/io
 GRhZ1buPOj9DwDlwoYr3Y27fx01wGAWS4vKwA+Vw2uvkgq+HRhZpUXyBTG7UUCaHDOlWH1TtzKQ
 JX371c4TdtVeZeYKOla0GV1dJwVXidRsxL4/JerkWLEWDMyNeEDMBhahbLVpk0uMh0YRHVfeLaF
 bK88Ly04DGD76oA4KM0uytQw7XrBJ4OTH7ayIwOSC+Aq20Mk2TMLPp/CBRNtdsNoVYn2sKDUDsC
 re3MkoefNyA6bKmeg1hAUxlZx8Uq0bThMSy6S8aPb5BJX5f7EMtXR3G0b97Zm2O//+QnXJqR

On 7/22/25 23:14, Kris Van Hees wrote:

> On Tue, Jul 22, 2025 at 09:18:16PM -0400, Eugene Loh wrote:
>> 3)  Where do all the rules in this patch (tested by err.*) come from?  E.g.,
>> C seems more lenient:
>>
>> $ cat x.c
>> // /* hello */
>> // comment /*
>> // comment //
>> int main(int c, char **v) {
>>    /*
>>     * //
>>     */
>>    return 0;
>> }
>> $ gcc x.c
>> $ echo $?
>> 0
> Yes, C is more lenient.  I based the implementation on the behaviour of other
> DTrace implementations that added //-comments.  I'd be open to making it more
> lenient as well - I hoestly didn't check out C's behaviour because the rules
> I observed for other DTrace implementations seemed to be quite consistent with
> what DTrace is doing with block comments (/* ... */).
Worth mentioning in the commit message?
