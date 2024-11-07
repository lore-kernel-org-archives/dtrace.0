Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A5322E
	for <dtrace@lists.linux.dev>; Thu,  7 Nov 2024 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012854; cv=fail; b=JBPQcLtyPHbLMrhlxZLeADfPbIsACWBvmjkc2aBZNh/odqmIBpE7UqQVdUjaYOkDYmG9FiDKo6BcWq/tiWcvuiyErnHKvSYZCo2vnge+FdnZusCwUQ5Pm/XLfpIAyb0V9DdfIZtq/jj9b9u8hnjfGtmGxiyGTg9M9yOmoTRhYG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012854; c=relaxed/simple;
	bh=Ml7x6JrAMsCYC+MR7IDlQjqIQP/KJIymNgB6xTZzFlQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DsF2osh0H/L8gUCe5OQQBxcCyeNpcgUgo6wGoqeuVz1z8CGdXx3UOUxEsEGscBQabbt/JIMZ6TQQ4giZ0g/5q7c8mZAyQrXJVMv1ZlbkIcDD4rn2Fxz11Gs1/cj2gN3VFvRZZmjib5uh854i5clbF2bD+B+iVwkIhMS4UUeqmWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dym4mLeN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RbRt85Pi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dym4mLeN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RbRt85Pi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7KffbZ015605
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 20:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2yeCV4WiXz/chSOH23RkesVCRehK9clNnacnX01B2vw=; b=
	Dym4mLeNnnQa3fPZsSVXhD7Zi5pQBBJFPzHsHJ6fpAuIQ2bfpQV8wwSzy8h2Htwa
	T1MoUAQouFgCGqnU++RCP3FXAydMc018EaT9+TOJmQv3HiVt3ypNv9HKPjtcZ9du
	8BKRUegaicLzf+d8LM29xTm4HYyc3B0onxDoMN12UZDYifZIQN9YaSML6sLn9klT
	v2i6f9suWhYGrYcDIcPr0IwLVeg146/8PnsrHpwPcuCdlTPBwuiHBv70XSQHhiZH
	FpcantJWOM6aO7QM4cpDdqAFFIei3etm3os+7bSO1dEyi5oI8OJEERQxPiZvAIR+
	CcpCfSgksI+dB/Ys5JvfXg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagcbjtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 20:54:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7KQrVb009089
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 20:54:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahgx93r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 20:54:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+yRU4Qycn33+tOa4JPZIvdB/Q14B4UuhNvdNV9A/Ry3MYOW/BNeKUVJv/WnLPycU6D8J8CBusXjB1uLmklGci4gWZpDVt3anlJUzGl1lgKDaHIDh86GuyjTLSzqVdMXbFdN0Cxj2+ttQbTb3E98ZkjjO3QH0ps40hhWWxj8twEBQeAM0AgID0H16GIV4YtwTtFphRcJ+lTnMEbjstKzMCvhm6sVwzmcbm3R/1TUpDYoA1XHiOfqiprascFBYRfMmudSa2PVEXYSZrTV8RTBdNoPP8ULmNpvEt0xdocDhdiNaAHx64KzW6D2siGkxzMzjfE3WJowfiqmOZdWH6NTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yeCV4WiXz/chSOH23RkesVCRehK9clNnacnX01B2vw=;
 b=mBeuM7KV8qs/c8mylLfhUvk8zkwhesPQ6sc6BGMDqrkK0qnI1Z377MsICk06s6SVXFAwYDCbkVqBuWuaNBb+ehRNM6BASNvums+xgmxY6jUZCfdETtBUTZwT+b6GANS9vkbeSEiLl6s2olNTcvQFIaDye7EeiD2lVRsEbd5hk//+1YQni47a62We4lVtCnos8fxvWRIp1bbxG9OY2cdAhZ5cVmU7/qQY6oIJNlovR0ACyo2BzAYpH0m+YikMc68S4FIQ5IHLmbFVQzhLwhpu8XTe5o/wo3Q/Yia6nH+teKhdT6CnWE92aviwk+kXL5DEUR1uhBCsGATkoKwHVFFv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yeCV4WiXz/chSOH23RkesVCRehK9clNnacnX01B2vw=;
 b=RbRt85Pi4GadA7CADSuBoeZweqNKspFSsW/uAhhI7TmOmUlE6AIYOx4QRICrALo0ecZn8e41ftI+IGihi7Q9VcaIsyQ02vbY9Bf8AutWl3d1v9CtdsQtLWQyrNst/AnL2wMCcOYPIOx3+DnLrSU/HgjU3SW0/m7IgSF7AOl4/Nk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4438.namprd10.prod.outlook.com (2603:10b6:510:36::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 20:54:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 20:54:07 +0000
Message-ID: <c7e23550-b87c-9750-e17f-20b7b060854c@oracle.com>
Date: Thu, 7 Nov 2024 15:54:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 5/6] usdt: new tests for USDT arg sanity with
 overlapping pid probes
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20241106112942.264351-1-nick.alcock@oracle.com>
 <20241106112942.264351-6-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20241106112942.264351-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:408:4c::40) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 316b8c9e-7c9a-44ac-455a-08dcff6e5258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDdpdkM1SmprQTJNekFFaitETGJrcFUyU1JFL09xODV4Q200SnJtYTBhck84?=
 =?utf-8?B?R1c2d3ZGdG9ZQXFTU2s2eWZBTGg0MEhPdGc1L3RVbW8za21DaGhHQzdWd3FW?=
 =?utf-8?B?c3FWeVBuMlhLeTMxMlVSN01zOGtVdHZkREhZc0J2d3FJVFVMempxQlFLMkNU?=
 =?utf-8?B?enhBYnBUbmFIVTdwUjB0OHBvVEM5UURIK0cxZEVtOXBlQmE5UVZ1NnVFeUdN?=
 =?utf-8?B?WnZTa0dLMWtWZEN4cjlmT2JFNmVZcE0yZEJxNmQyUWU3QWcveGxKZnViZlI1?=
 =?utf-8?B?c01pWGl1SjdUVVNVc2M2RDBsMWVUTTh2SFlmb2pVRG1XZURvaWk1QTBvekIz?=
 =?utf-8?B?clJwcDR2VlN0b2FqYXV2bzRDZHZTeTRoQnJCL21UcjV0WGlFckF1MVR0cnI1?=
 =?utf-8?B?eGFkb2lCdWp1MGxYb2VKcDFtOWszYmhJSXpqRkhMd0xxT2tkTXZnZUVMNVBz?=
 =?utf-8?B?S05kaEplNk0wUzBST25Tc2dTVGpKWVdqd2owU0pxMmtMWkFJRWFMV0h2azQx?=
 =?utf-8?B?cHZzQ1RGZ0pRVXRuRWRwQkVsdlVFQWVHbDBFc2FNRVNlK1l5VjFaYVRvZUJn?=
 =?utf-8?B?aHJ2b0Njb3VMdm1LZVlnUmpva0JCbm1wUyswVnBNQTQxU0tab29xUmRxMU1J?=
 =?utf-8?B?ZnVETlYxOWVjZjJMVnhMbzFZT3FmUVBxN1hQNUZUSkROQXlXWEMvL0tVRzJH?=
 =?utf-8?B?U2tLYzRlK093ZGNFaDZWQkVJOWF6akhMNUpibVV5NGp5RXh0WXZvL01zUDBk?=
 =?utf-8?B?ZGd3bUpNcUYyeC8ycjViSXJMYmcwSElMMGFNVlQraldacWZ1MlJsanZTemd3?=
 =?utf-8?B?RDFBcXg2VXRXMlBmRG4xU2dUeldUS2ordGYvdTNycmtTNFd1NnRKNThkMWxi?=
 =?utf-8?B?UC9zVHM1bU9LZ2lvaktFM29IUTJNYUg4UzU1QmpGMVBQczlNbHRLSzdSQWo1?=
 =?utf-8?B?K0pmNmxubzFFRGdkZUxMc3NPLzY4V1BXTFR5cVRsUDRTR1JtOElYZm1HNThm?=
 =?utf-8?B?Q21pcDM5OCtwN0Q0cjMrTldKSnlBTE9hakRoVE5SbWkyK2FZVjQwNkhXb2pl?=
 =?utf-8?B?ZUFGeU1STnBJUWZTNGw3M2F5amtpZ1poRnZXUDI4WWVOMkxsN294bE1EeFdn?=
 =?utf-8?B?WTY1U0NzaWxNUTRObjBWeWVIVDNPZjBSVkdETnJMdzZRVWJ2dFFNL0dyM2F0?=
 =?utf-8?B?aDY5c2hHZENFc3BiQXI4OHNvcDBrRmxLN3NIQXNxTncwTnI4UjVHelZPYnl6?=
 =?utf-8?B?RHBmcndiMkRqbDlLbW1mbWZIWC9zQ1VVMFZlK3Y3TnBneXZDUEFhWTZGS1dv?=
 =?utf-8?B?ekkyVSszd2NFRFFkNzk3SFpmcVh2Y1lHODNQQWR1V0NpcmRSUHRmdmRNZVRj?=
 =?utf-8?B?bUtGQ3Bvd2crQlAzcGFpckFic3pxeWpKWTVDMEh4RlZ6a1Q1TkNlUWVDTmxS?=
 =?utf-8?B?TVBVL1dPUUdUdjh1YW9yajYvcEUvMjFMNnVjMDR2K3dZaGowdWRFSmxXTVpr?=
 =?utf-8?B?WDYvTmlKWE1yMmtoQ2tPMFNudyt2RGpuQlpDWE13elMra0k1eVIxZWZseVlj?=
 =?utf-8?B?Y05POG4zMi9hckRIRitlOENqVFJzNnFuR1FhczE4SnVkYmx0NjBKZDRDVXlW?=
 =?utf-8?B?clg5RkFKbm5tMVo5MUNnTDRBNnFWZ2I4Y0VyN3htTHc2UTVzalVIQkdZL0xh?=
 =?utf-8?B?OEhBZUlYWXoyUHovMkVrNmJ4SmZKTTdEL0lpUTZaV29jQitBeDRKQzNucFdy?=
 =?utf-8?Q?YcIYZdgjU2c96PlsjPGgloJ9O5qSsSDKpMvxO0S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxoSjZBaDB0UDg0VlRtSkpWY0t4QnRmeW5wRENDOHFBVDVYNGRFWUtlMklN?=
 =?utf-8?B?dTgxMmxsdmJOTE54eGhORjdyM3k2N3dyLy9kMUNUdXBmVm8wa25rcldDZGJP?=
 =?utf-8?B?dFIxWGdzSk1wWXhFOFlabHhTaVhVbWxyb01OZlBmR2JtRGR5b1JpLytCQ1Y0?=
 =?utf-8?B?WnU1UHBxZkhsdE1BOXNrQWdWSHlaWnBoNEtQWnAyOXBydzA1cVFmcnljZEI3?=
 =?utf-8?B?SzhhMFRyaTBwYnBXWnhEWWc4UEh4Z1JRRmp0UzdWakJ6OFg4ZEYvcXcwUkdH?=
 =?utf-8?B?ZjRBZE9BL0QySDFTSllxdnRia0xNajJVZDdYWGxFeE1mNDZjOUNhdDFnM3VQ?=
 =?utf-8?B?VE1sbFFIeEZZbXlDUG1ybHRRMlpISzk4OUpiTHdoaXJ6UHZpcFpEMWRUL2V1?=
 =?utf-8?B?SmpqNkNWeXpPd1Q2U1RBZVI3MFBMR243b01rdFJJaU9MZ2hkcnpNSlV5MmxX?=
 =?utf-8?B?L2lUY0N0bFlyVXJFckEyeWNGeWR4c1Y2TG43MHhCa0lOYWJxZkpIMVhhYWtH?=
 =?utf-8?B?M0ZCc0ZqZU00Zy9EeWJ0VHo0M09TRG1YQllEb0x5QklnZjM2S3hYWWZOeVlt?=
 =?utf-8?B?K2ZvU0VERSt6aFhTM1RSbkN4R0Z4cDBRcVJmbHZpVStYRmM1L3cwQXhMN0lE?=
 =?utf-8?B?TzJzdXlHejA4SXd1RnJTYUJNUGpJTVFUZ1RuQzgzMy9Tc3NJQSt4dUlxOGgz?=
 =?utf-8?B?V1JnbWdwVzF4dy9zM2tKY3NyN2R0VGlUNDBDaVM0dnVrT3FaWGNXbzlpY1p2?=
 =?utf-8?B?VTVGVGNGbHlBYU9NVW5tOXVSODd1ZUJnc0E0UmNPSTFNY1JxNW45clBGQzU1?=
 =?utf-8?B?VmNRZGRsNWdNNVdHRHdNcU5OQkJoeUpZblJkaGwrczdRNFdGSzJjLzNnajFq?=
 =?utf-8?B?Yi9oakdwU3JXMkZXb3VDam9FRzdMWFNCZnY3SGh0aVl5YjM2SjNlay93WUtC?=
 =?utf-8?B?Z2FVOXNPaW5ya0lvNVJQZGZuc2gxb0pobzdVUCtPNEowVi93Q0hIK2h1K3Fk?=
 =?utf-8?B?dS9VSEdKM2piVFZMeDQ3V21lbG83NjEzZGoxVitqVjNWOTNNSVo3d0VpTmVw?=
 =?utf-8?B?SmVMcGhyMVhnUVp4Q0ttSXdtQmR5MDV3bGRkdUVJVWhDR3ZlQVd0ZDZ5Z1BU?=
 =?utf-8?B?cVcwZllyNGsrUWdMMDBVeEQ1bHdsZnZMWVpXclVhTU1GRWg0WDRGbUFQNkgx?=
 =?utf-8?B?Wnk0cU5ZV3JScTRLaVB1QTVnRGQ4TzdFZEhaRit4T3ZxTlBmang4eTVrOHhP?=
 =?utf-8?B?d0tBbWZtU2p6WW1Eb1RFblhrYWJKSTU4dUp1SmRuZ0c1eHd5cXJreGxDUTMw?=
 =?utf-8?B?QVE1NGNFMno0WHFxOWdMZU1wNWRCMVlPWjNJTysvWDkwVHFQWlhVSi9NTzZh?=
 =?utf-8?B?aGt2Q3NKdEZSbmVBT1QzQjU3SXp4VU1kTm5GcWFvNitkSitOMVBmcFBES3FU?=
 =?utf-8?B?RTQxUjdQL3VjZm5yZHk3UktEQ1lOemI5RHM3a2QrLzVac0huVEpQSDc4UXJl?=
 =?utf-8?B?aldMQmdyd0Njb3BOS3pGWlNPZ0hnR1hzQUhSejRBU1dDQnBJZXh3ZzBYYVNr?=
 =?utf-8?B?T0g4Y0Y0WXpMT3JxbDlyS2hUa3l5VDZoNDBHcGkwcUVvTDZGVnZHaFp6S0U0?=
 =?utf-8?B?Qy94RlZWd1c0Y2taYjM5VFBPM3hrMk1GU3ZJbU9zUjdyRE1DU3VKRUlETXZq?=
 =?utf-8?B?bVBaV3AvaGdhNkJtRVBzZlA1M1A5NS9IcFNoWHBvc0FXZTRPSDdvVzJ3amVn?=
 =?utf-8?B?a25IMVdudDZla0J6QWlrSE5vUzdlUXUxNm53N0I0RUlFL25raS96bE5QM3Jx?=
 =?utf-8?B?aGRSM1RWU0p5dDM4elBCYUk3TER2VndaQVNqM2tmVEZkQnNDcklyZ0tBWWZ4?=
 =?utf-8?B?c1k0YUtZQWRYWFh6WDdMTjY1L3FqbjJJWEswVEhleVQ3cFJNVERHbXFZVXhN?=
 =?utf-8?B?S3lVNFVoREQ1aXBBQTIyMVl6bHliQ1Z5Z0RvZitURmp6U0J3djcrUUQ3Ykpl?=
 =?utf-8?B?WURXWGtLYWZ4aUdRRXU5VHJWeG8reFVVZStudS82WXo4anlTV2w5ZldlWjA2?=
 =?utf-8?B?cjZkQUQ1OExuSEVZWnJpa3NKc1BtYlJBYkFBV0lCbEx2NnhTMDk3RDZSN2c3?=
 =?utf-8?Q?VpoqBwrzjGhLttF4Ldm54LfrJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WtCxMvdz5NyN9P9s4YRjf6Jg/XUDvbNpxy/aVWE2qqXJqoiV2FzJRNxJpYhf5bZ7p09P1PmkJSM9YtHYKl/8YKnUWWsieJ2umkFd+mmi3J9UonHEdQiJIxKwcmfhrJEn6ezXfCFcAEk/EPi3Uz6A6bg79iQd9CSL8/TBxIsOkcI0yzjx/UJ/qrQO1MuxBK/LHcy33myMY4b9BxDJFYy4/APkGI5CH7CK1OAn179tDDDCfvkAwTMYmdTfTdbjPvsuPrzbNLneYnSHgvPlGOwV5e1DI0LthSdpsTjuwNLHsIhDuRV42J7++oaoMVOi1uRs78Kh2EL2upzRrgQVKvXpaGxCJQZupPSngKybtYvkAuSpaViIz9vgGZYItBIghYL7B8qEWFrTNaZ7NXz56q9v80CsCt6R0ZASq+HpIOZHxnRIqjyHAvcB16HiWQ9txiCwRmFTIC6x6j0xINuXwRlFwm1yOtvVPXfjlnL6kDMGN7C4bBSyqEIkRQ/YjVb3BCcRvj0t2u+1Pc27Pr20eaWxgDsJGdGSKda5DqnXgUDhOHTGFHuPx4FaSIcMQPh/GEp86zmBOydRyZk02bRU/z/ulkTDHiI4ePGD85p9MewSNpU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316b8c9e-7c9a-44ac-455a-08dcff6e5258
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:54:07.4654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOl9ukds7sn51xXbI0urpFj1U6aTWdMghpTN1rECE1oIptwv0FEl6ho0G4pNXsuR8v6cMMJfbST7GI6naPFMig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4438
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_09,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411070164
X-Proofpoint-ORIG-GUID: JcI61GctU-Ztg1sBQe8GtieY2u9EYiAq
X-Proofpoint-GUID: JcI61GctU-Ztg1sBQe8GtieY2u9EYiAq

On 11/6/24 06:29, Nick Alcock wrote:

> This generalizes the existing tst.pidprobes.sh to check the args
> reported by the probe both with and without arg mapping in place.
>
> Everything seems to work.

That comment seems to be unnecessary.

Also, is there a "dtrace -lv" test for USDT args?  (I'm not even sure if 
that question makes sense.)

> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   .../usdt/{tst.pidprobes.sh => pidprobes.sh}   | 56 +++++++++++++++----

Why the renaming?  And, will "./runtest.sh" run pidprobes.sh without any 
command-line args?

>   test/unittest/usdt/tst.pidargmap.sh           | 11 ++++
>   test/unittest/usdt/tst.pidargs.sh             | 11 ++++
>   3 files changed, 67 insertions(+), 11 deletions(-)
>   rename test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (82%)
>   create mode 100755 test/unittest/usdt/tst.pidargmap.sh
>   create mode 100755 test/unittest/usdt/tst.pidargs.sh
>
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/pidprobes.sh
> similarity index 82%
> rename from test/unittest/usdt/tst.pidprobes.sh
> rename to test/unittest/usdt/pidprobes.sh
> index 25fee85537fc..aedc6256f195 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/pidprobes.sh
> @@ -5,9 +5,12 @@
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> -# This test verifies that USDT and pid probes can share underlying probes.
> +# This test verifies various properties of USDT and pid probes sharing
> +# underlying probes.
>   
>   dtrace=$1
> +usdt=$2

Why is there a usdt=$2?  It seems that usdt is always "t" and you'd 
expect that in test/unittest/usdt.

> +mapping=$3
>   
>   # Set up test directory.
>   
> @@ -17,13 +20,21 @@ cd $DIRNAME
>   
>   # Create test source files.
>   
> -cat > prov.d <<EOF
> +if [[ -z $mapping ]]; then
> +    cat > prov.d <<EOF
>   provider pyramid {
>   	probe entry(int, char, int, int);
>   };
>   EOF
> +else
> +    cat > prov.d <<EOF
> +provider pyramid {
> +	probe entry(int a, char b, int c, int d) : (int c, int d, int a, char b);
> +};
> +EOF
> +fi
>   
> -cat > main.c <<EOF
> +cat > main.c <<'EOF'
>   #include <stdio.h>
>   #include "prov.h"
>   
> @@ -48,7 +59,7 @@ EOF
>   
>   # Build the test program.
>   
> -$dtrace -h -s prov.d
> +$dtrace $dt_flags -h -s prov.d
>   if [ $? -ne 0 ]; then
>   	echo "failed to generate header file" >&2
>   	exit 1
> @@ -61,12 +72,12 @@ fi
>   if [[ `uname -m` = "aarch64" ]]; then
>   	objdump -d main.o > disasm_foo.txt.before
>   fi
> -$dtrace -G -64 -s prov.d main.o
> +$dtrace $dt_flags -G -64 -s prov.d main.o
>   if [ $? -ne 0 ]; then
>   	echo "failed to create DOF" >&2
>   	exit 1
>   fi
> -cc $test_cppflags -o main main.o prov.o
> +cc $test_ldflags -o main main.o prov.o
>   if [ $? -ne 0 ]; then
>   	echo "failed to link final executable" >&2
>   	exit 1
> @@ -75,7 +86,7 @@ fi
>   # Check that the program output is 0 when the USDT probe is not enabled.
>   # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
>   
> -./main > main.out
> +./main standalone > main.out

I'd vote against this change.  Introducing a command-line arg that is 
not used?  Or, add it as a comment?  But there is already a comment.

>   echo "my result: 0" > main.out.expected
>   if ! diff -q main.out main.out.expected > /dev/null; then
>   	echo '"my result"' looks wrong when not using DTrace
> @@ -88,11 +99,25 @@ fi
>   
>   # Run dtrace.
>   
> -$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
> +cat >> pidprobes.d <<'EOF'
>   p*d$target::foo:
>   {
>   	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
> -}' > main.out2
> +}
> +EOF
> +
> +if [[ -n $usdt ]]; then
> +	echo 'pyramid$target::foo: {' >> pidprobes.d
> +
> +	if [[ -n $mapping ]]; then
> +		echo 'printf("%d %s:%s:%s:%s %i %i %i %c\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
> +	else
> +		echo 'printf("%d %s:%s:%s:%s %i %c %i %i\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
> +	fi
> +	echo '}' >> pidprobes.d
> +fi
> +
> +$dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
>   if [ $? -ne 0 ]; then
>   	echo "failed to run dtrace" >&2
>   	cat main.out2
> @@ -106,7 +131,7 @@ fi
>   echo "my result: 10" > main.out2.expected
>   
>   if ! diff -q main.out2 main.out2.expected > /dev/null; then
> -	echo '"my result"' looks wrong when using DTrace
> +	echo '"my result"' looks wrong

Why?  In particular, "when using DTrace" stands in contrast to the 
earlier message 'echo '"my result"' looks wrong when not using DTrace'.

>   	echo === got ===
>   	cat main.out2
>   	echo === expected ===
> @@ -262,8 +287,17 @@ for pc in $pcs; do
>   done
>   echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
>   echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
> +if [[ -n $usdt ]]; then
> +	if [[ -z $mapping ]]; then
> +		echo "$pid pyramid$pid:main:foo:entry 2 a 16 128" >> dtrace.out.expected
> +		echo "$pid pyramid$pid:main:foo:entry 4 b 32 256" >> dtrace.out.expected
> +	else
> +		echo "$pid pyramid$pid:main:foo:entry 16 128 2 a" >> dtrace.out.expected
> +		echo "$pid pyramid$pid:main:foo:entry 32 256 4 b" >> dtrace.out.expected
> +	fi
> +fi
>   
> -# Sort and check.
> +# Sort and check (dropping any wake-up firings from deferred probing).

I guess I do not get this.  Where does any "dropping" take place?

>   
>   sort dtrace.out          > dtrace.out.sorted
>   sort dtrace.out.expected > dtrace.out.expected.sorted
> diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
> new file mode 100755
> index 000000000000..0c83f8703539
> --- /dev/null
> +++ b/test/unittest/usdt/tst.pidargmap.sh
> @@ -0,0 +1,11 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT and pid probes that share underlying probes
> +# do not apply arg mappings (incorrectly) to the pid probes.

How do we verify that mappings do not apply (incorrectly) to pid 
probes?  Is there supposed to be a check on pid probe args?

> +
> +exec $(dirname $_test)/pidprobes.sh $1 t t
> diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
> new file mode 100755
> index 000000000000..53cba7c39624
> --- /dev/null
> +++ b/test/unittest/usdt/tst.pidargs.sh
> @@ -0,0 +1,11 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that USDT and pid probes that share underlying probes
> +# get the arguments correct for the USDT probes.
> +
> +exec $(dirname $_test)/pidprobes.sh $1 t ""
