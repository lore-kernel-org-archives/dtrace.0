Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F64683
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724996569; cv=fail; b=DLYc2uq2Updd7aHaPB/ZuCd2VfImJPb5z5T3wDnKhUUUMcf0MjyCGwoYyeoRLt+qcEj4+b9SxdL5TSYCKiw5IsJc+GfHzgFUtGiGmdumRFx7w4RRHQTKg60sTTxNVaPwBz7puVd0udG6PvhTRgnvmEhCZGKUHw57rftVaZPjmGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724996569; c=relaxed/simple;
	bh=UzJlRAMlGS4jefe2YCcL2+kMg2BRiQT9u2IZ69qSSQk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ouCXxEJalokdpT1dVZDQQ6uMRGAo6Q0m0a6iuaHtPBB0csUIXv/CbXVgnmvJN1R6bjjRlgGSGSuPp/VM6pEPXjPwj0Q3LKA19HGxVGv93nHBN6L/7ihAiFmjOEo1mYFyXAlDK27Rqq/yPZz6Cq3ULKlujiU6+liAvNBxIStnNU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZmD4TQG9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n1DZ5V7p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZmD4TQG9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n1DZ5V7p"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U2fVPU030815
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=NU2/yeUCILJHCIpWOowKKfE1gRo9RBXsNvAqwEt9AqQ=; b=
	ZmD4TQG9fR7QS1x5K2s4C48XIm0DTN166nec5vq8R4UlZlJjj9dhB1VFyFaWb5Y6
	Z3g3d7MXhsUbTVy292cnlECnGADRNAfJvUw9BdCyfhWn4nisq6T5gTT2T0S+QnGz
	3ZHJiiANO2asjp8G3rNLVoni60LKJdHYx/l1QjTcix4MvkPlf7YKrOFet3GjW52r
	cAG22BSSnaV3aI/kNWAf2EilufcgK/u8WqnE5QbBwx3fcP05jI+p67cULa9HpzCY
	dzB6c9OZF5iQR9azdwpkrWMEOzSIwPVmbcm1jHpR9nXrKva+jc3MDVI5yKb8cv9/
	sKYlHOFreV4TtAiVa3n7+w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugwv7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:42:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U598ou031816
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:42:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0xmvpf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:42:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBNcN0tSDqHDxE8J2L6Gj6nVlZe+eHhidWT7/NxClkYIq5fGsfYW3bo/txk7Pv/afkbqiMXEry3zhLQz0GLAcMU2R5vloVuHdaEkIKfr2IB/wOPvFlcf3FUoGoFoN4oNEgyBCku9FPduujkoqi0qFXi5BgEImo9/tu1aUIfYaMgwc7VkV7PhVcFK8ZsmGYXi1m+YsKlKdnAdIrvSKjaHVSrTfrKsgWgWKSPcy/oGettR+w1AtwzGx/4h7t9rF+kDI5CnBDvubmvgqonJVvCr+QQXXrEBkiv2prvKjQ/MuQFxw98jpqUIKf96W+VoRrT58h4NLxTWT3qJAfh3tVs0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU2/yeUCILJHCIpWOowKKfE1gRo9RBXsNvAqwEt9AqQ=;
 b=j2YPNF3kVKzfQ6YDjkJW1pTPC3g9UQ1mpCR6CSX6y/ePWTfISd2Z1cRJUK+P/r6SLJKtrGYv5zD73AzB2P8cbOZl/09NWwn9e5MDItTHtgh0CwkV3DYZhFLl8JjAH5pJRppzWQYnV7BMGG/OiyjNzzIjGZFgj1PHr7DI5YP7t4b6UE5nw62uEOVPcavUhhXZdvf+cCniUoFSq0TSGmGneA/5sIBHf95L1LEUor4jqzesFVdx1GeoaBg768BxhlEx0oVCPQOH9giY5CzAmHVfYQ3HbqoqenLvMSWl2oV8OpgZzvtO5qzYzQ+w+Yv+opYMDYCIzXHsm9IHirphjIqkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU2/yeUCILJHCIpWOowKKfE1gRo9RBXsNvAqwEt9AqQ=;
 b=n1DZ5V7pDW4fZnqMVdVbZfZbAbQXH+3MWK+TwvGf6RwufU/O5lFhBy5ZhoErJessrre3ThAS/xnnVHP32gHjJcYwc6ZntpBGGDhbKirQ76wnXBKqwkKXv0C3kKli/QjqEnuZI3k8+Yhsaq4ikxJWC8TB/9yRqszsB7RGi7SE+8Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4260.namprd10.prod.outlook.com (2603:10b6:a03:202::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 05:42:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 05:42:42 +0000
Message-ID: <10a8f685-b3e6-bf99-0579-c47408dd39ec@oracle.com>
Date: Fri, 30 Aug 2024 01:42:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 31/38] Fix dt_pebs_init() call
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com> <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
 <Zs+Tm8LO6naCCQz3@oracle.com>
 <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
 <ZtEtwnkc2gWT3zwD@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZtEtwnkc2gWT3zwD@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0026.namprd19.prod.outlook.com
 (2603:10b6:208:178::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 149428d6-8d7f-47ed-5142-08dcc8b690d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjFxOFRIUis0Y0ZiVzZmUUcyR0JRR1drY3lSbGdQVGxLVURrS0pjTURXU2ZM?=
 =?utf-8?B?dGhHcHlhajNRSVp5K2p6WDBMQUtlc2w0SVlpRysxSDE0L2wyb1d6d0I2enBH?=
 =?utf-8?B?RVFRUEg2dERPRXQwTk8wTGhDelo2bERubWxvM3ZHOE1kWnVIRjAzMGVxWGc4?=
 =?utf-8?B?R1N4aUUyYmhqSjJocG5BYy95ZVBHZEpaNjJrOS9lOU05bGV4a2VJZ0djeDJY?=
 =?utf-8?B?dmhTYlFhNTY0S3JBRGlXbWE5NVFOeEtWM0ZzaU9XTGx0Mkpoelc3L2VMVVZH?=
 =?utf-8?B?Y0dwR0ZHMmY4Q25Gdzg2bjBtUDR5eEMrZGxreTBaMGt2Ykt6TjV2T01weHdl?=
 =?utf-8?B?TmVqOXBnOGFRRDhPTGZoYTNxUkkxbWdtQ2VISjdIMWx3Z2FyNHpqSkwwelUw?=
 =?utf-8?B?RERHTEljMm5EZnh4RGtTdlRWQVM1MWZLb2ZaY0lNT3FHd3F1SDRYbnNzWGZH?=
 =?utf-8?B?dkEvcTRtK29vcFdkVEZiaHdMS014c0hobVRpRWpEdUlWb295M1RZSXJjemZO?=
 =?utf-8?B?aGlSN0F2c3FhNU1yNTFnb2twd0JDb1V2UndGaGFaMkIrVEh2VnA4V3E2aVlX?=
 =?utf-8?B?cjRCaFZ5Ym5MYzI0UVN1UHdqQWRTeE5yR0lwRlhoZkRvdEFwcW0zMHBFN1ZB?=
 =?utf-8?B?NTZrdE1iaWlLalcrNDBvNGpibEs0czZnNHJOSDVqRFB0KzJVRXpza1RxQ1cw?=
 =?utf-8?B?QTQ0STZyclhaRUlOS0NTQUEyZFBiZnd6OC9lM0xIbjdQd1JsWGVSRFc2dkZu?=
 =?utf-8?B?RUZmai9FY3cwN1JOYnpYRHVSd1dtclJjeHVpd0x1MjQyQ0QyVklubnE5a1Fs?=
 =?utf-8?B?bzVaeTZ2d2JCOWcxRzFwa2hxT0MrUnJybGtjdGkvNElYZmF0V1hqTmsyMDN4?=
 =?utf-8?B?bExEWWdqM0k1UFRjeHBYRkE0L2gxYi9seXEyb1FVOUFMaG41THVZVW9MSVFh?=
 =?utf-8?B?UkY2blVHZFF1d0Q3c0RSbGtYcyt2ZnBTaitpMjBVOHRlZ0pQbkhkRGJjaXht?=
 =?utf-8?B?RWRWK3ducUxIT2h4VkM3R1ZoNFk4K2FuQjNzRnVHdlM5bUJYWmN1TnFiZ3g0?=
 =?utf-8?B?dEhCcWNmWVFHL1RzTHJvTjZYT1BDL3VzZEFDNWJFN3NmYUNqL3pSaUhMbHVU?=
 =?utf-8?B?Umd0c3FubTNjS0t0b2MyUlg4SjI0SURxSVNiMmt2cDJwUFltU1ZjSDhnU1Fq?=
 =?utf-8?B?dlpSTmZ0UVY0TkZyaXQ1dC9GckhYSFRGWUloeE1WNzZpOFFEUkpGVWRjR2ND?=
 =?utf-8?B?aVFzdjVVNEl1RUhMcE14Ny8vOXBUOVlYUUV6SWh5ZEpoNXZPQ0sxVjlrY1c4?=
 =?utf-8?B?K1NZTHVEZ0hxaWZLc0dqalRma1ZwNGE2L09FdS9SOStTaXF5aERsM09aa2h3?=
 =?utf-8?B?SkNpOVhvVVJMS3dmOFU1c0QwZFdkSW16N0Y4RlVrZ3MxZlR3MDE0TzNiL3ZJ?=
 =?utf-8?B?ZmxPS2VNaFlXR1Q1K1pnYnFmcXJIWEJHUDN3QnNJbFJzSEZrRkZDNndHQ0dQ?=
 =?utf-8?B?VUdSYndUM1NuamFKc1ZkMDhBNDhYcDluLzBFamJwMDNZcllMMnFZVUN4T1ZX?=
 =?utf-8?B?UjhRa1htOXhtbEZ4RHBMa0lnanRsb3JZQVFSSlZlL0JOZHlCcGo4YnpzWUc0?=
 =?utf-8?B?RUhwWXcvNG9hZkNMNHRqeUg1VDI1SFl1S0tBRVhiRjlvdkNTWEN3R2V5M0RN?=
 =?utf-8?B?cXJRblNIUmk3ZkcrTkNSRTJaeUhqdU4wL2s2aE5oL1ZiWjFLVjFrSjcwZHNT?=
 =?utf-8?Q?cFqDYyj7ZL5z7n0tsE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWJ3Z0lFU2UzNlRITTdIZGM0YlprMHN1aHVKNHR5VXNDYnlmekIvQVRyZ0NU?=
 =?utf-8?B?UDNVUEN6dFl0dC9kTWN2ellwYUlYc3VRTTJBZm9DeERaZmxmaW5kV2pwWXFm?=
 =?utf-8?B?MU52Y0JiWFNEdmFUMkJOcXE5S0s1SkZoN2hjNWRWYWdGck5LTTFkN21nUzcz?=
 =?utf-8?B?USs4cWYyazc1NXZ6UWJoZlBJYy9MMnY5M20ybUowMHlGeUIxemNNRVJXcDlD?=
 =?utf-8?B?NUhYQlRwdUhpQWZNR3hSOXIwalZYa1Z0M2xZdUI1SGM4S1JHWUFLZWhwcy9s?=
 =?utf-8?B?bHBzLzhpYndVSFFCM1RqbDUrSXZHWk0rSFM0UWRpcWxKdWI2aUkvMU5FZjdQ?=
 =?utf-8?B?RzBvNkRVSGN1S2JvNVRDeFFmTUR1dWpUZnBadTZWWGoveEhyL21GOVR3UktM?=
 =?utf-8?B?ZFk1THYydDJiVGNHWlI1RmpBcFFudjU3Ukh6cXB1NFIxZWovOHcyK1FiQXUz?=
 =?utf-8?B?Z0VIQ0hQaSs0Y3BPMXZWbHV5eUVmcmhMZFpmY0U5MjlITTJ5ODk3RDl0enR5?=
 =?utf-8?B?YjZjby9nMERzb25QWjF2V3VqOUVUbnMwZmJDdDllaEhoM0ZEcGNZRGRaS0Ra?=
 =?utf-8?B?eW1mZXI0eE9tM3o4bUdiaGYyNXZmTUFmNjZ0MVNjSTdoK2JSK3FuN2tWTGMw?=
 =?utf-8?B?ZndKM3FjK1FTOWFwY2txRUk2ekRrN3NPYkhQYTY2T2R4RVhRbm5IT0xWemVV?=
 =?utf-8?B?cXJLakhVUk9ON0tCcmExWVB3bERHRGlKMUtndUl3RzVUY1hBWUd4eWppd0RY?=
 =?utf-8?B?VkdncTkvck5ZRFpaQkF2UmFtOHlEcWhDQmU1UW9XaElBZURJQUU4RE9Tc3VV?=
 =?utf-8?B?TGdVVER3dkx1RzVZLzcyTGowMVVoNU5CMUVtcDJ6NlpWQVVFZFFBcEFpN1FY?=
 =?utf-8?B?T2JKRFZLVlp0ZUN5THl6dktqTWNLWDRsL3pCNEtuWlorS3RqejF4YXdlejEz?=
 =?utf-8?B?Zk9RQnhVNXQxV1RQK0FKN0g0TEowR0o2UE9LcmZobjhmTlFIeVl5SXh5UDJV?=
 =?utf-8?B?ckNrcVVCV3ZnZm1VQUdLMEhTQk5Jc05qaFpjU0Zmd1lFdjMrNUl6Wkg4ZkVY?=
 =?utf-8?B?bVNSZUw0SXdReXFoMHB5azhiRzJ6RUpHTENaR1VlKzEzQ3NyMlAvcks0NmlJ?=
 =?utf-8?B?Y0Y5RTJlLzJIeHJ3UElqaXBqcDVHRFhlcW1NNjNiSEV5amZOZEZLUExCL3My?=
 =?utf-8?B?NEh6cVRlWDMvdWhmRHR5eEExTTRGaVZwR0NrQ092dThocUJSRmQ4bVpKdUtC?=
 =?utf-8?B?ZWJTSHA2N3JtNkxHRTMyRlFCRnBjZklmYnRMZ3VRRk02b056TVJ5dHoyNVpY?=
 =?utf-8?B?Nm9ZK21rbDNGTFZ4SVBZQUlKK25sdUt5SXc1bTF4SHJDemFEQ0tpd3B0RlFz?=
 =?utf-8?B?eU43ay9vQ3lGZGN0NERVZGo3eWJ5Mi91YTZUNytja0Rmd2dLN3B5SHVVMDJL?=
 =?utf-8?B?MWhTZUJJZUF0Y0lXdVFsYTVmV0kxM2xpTTNFSWpRbmNSM1JUdHZTUkxlQ1kx?=
 =?utf-8?B?bEt4N0Vqamw5cmVQOWZpczcxbzBTdVJ2V3BSWXhSTVA3Q1htU3BlOTVaeHFW?=
 =?utf-8?B?SlF0UGpWcjdjMlRwdUpYZVA1M0tDZjlZSHFBcmtCNzBDMjh2eFA0Mktxb25u?=
 =?utf-8?B?Wk1VSzNtWGUyVm5LUmpOY2lPclN5QTdmV1FXdXN2OGtsbndXSDgrV3VIWm9Y?=
 =?utf-8?B?TEZYUDVHOEpwTkZtNkpMV21rR2FBalo5T1cxQ0h5WFRTTzVuWXRBeVY4M3NT?=
 =?utf-8?B?U1ZONTZvd0lvb2x3emxvc3c4K2FFYlBrMHdZMklYUkJpYkRwNTQrVDNSc3Bh?=
 =?utf-8?B?ZVRyUkFlVm9kM3o0UjB3VmIwWU5kWTZsTnRjV3RmeURLNTh4a3dKQWJpdlQ0?=
 =?utf-8?B?Z3NUMWYrQURkdFc1ZGxYbHRqdlBMT0NrOCsycDh0R0xKQ1J6WGVLNWVBVFNZ?=
 =?utf-8?B?b20zQzBmY3VaeWwwbXBYOW9HUkVlMFN3ZkJpT2w3UUxZT2wyMGFISWJWRGcy?=
 =?utf-8?B?WjU3dTBJa0xIUklyRE0wMlRLUEZNaTBIdXhLUE56WCtnZHZ5enUzaHljUFBP?=
 =?utf-8?B?OUhwWjdsaWVvcEtnSmRXaWt4clZUcE04bE1ROGREbU1IakhDQ2pBcGVaYVdS?=
 =?utf-8?Q?HWYVS6izZoKhktNdMxzAgKO/l?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ERGYjJededDkTUsD1jZWy0j6oeUxbBPq6EHPx7np4690+GC2GGHZoA4vzKtUAeCXn5asG6P8ac6vEevZk0eYecgW1ZV5e6L8osYUOtSrYFg6YGNQHIjLvekOlNXn7Ui4YxrBkrCaCT+ZkOp595hcptnpx2VF/lMY30tkOHL4AjcJ+OZQzhO39leWefXBFjMv2HeQuaYMF9BqJlsfJ9ZbFrNEiTDywoPC5WxwkFRhQRuANSelR3ftyWOfEluuQ/uBlS+Nd5NIWVsvhSYoETxSa/3lMeRD3gCyol0sYx8lyLhIez8BDefs7JbscvJCuWFyec+CnO6ZztJnzNNq/7CZy42ETUhR5IeCSOBqm6yxHbcYXlEJqG5KzOwOMXZaLAzjR81x9W93BaB8iaPBvZOyexSUYaDTX6YOtsNE14Ukck3yLoju32SAV7LpzqSYJIR26wtyyXWss5GUSdjLAmWgsK+c5RgJ1a/eo6q7VqOC9fyVAGsxu5I3CG9ZXDEpUbBV4CitlHgm7uPzHoXohCix4S38MVBfjaUC+JwomY1kQDvKgvEcGA3Q/QcdkTzVH37p2MhKS5WxoENAuP5GQgk8vsLcdkPBTXznyYsEUUcp88=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149428d6-8d7f-47ed-5142-08dcc8b690d4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 05:42:42.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG5JmmjbAQahmxxk/t+zbadgRtzuQZNolirsOAm6KYYpupafDuwwvOUGR1xmJS0vOdxRKzBEl2ezMgV3zA/bOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4260
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300040
X-Proofpoint-GUID: U9h1fesjCmMPAzxGrgfXBN7-Qph1pY-p
X-Proofpoint-ORIG-GUID: U9h1fesjCmMPAzxGrgfXBN7-Qph1pY-p

So do you have a proposal for what the new semantics for bufsize should 
be?  (And, why not simply ignore bufsize?)

On 8/29/24 22:26, Kris Van Hees wrote:
> On Thu, Aug 29, 2024 at 08:54:46PM -0400, Eugene Loh via DTrace-devel wrote:
>> On 8/28/24 17:16, Kris Van Hees wrote:
>>> On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
>>>> On 8/26/24 12:20, Kris Van Hees wrote:
>>>>> On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
>>>>>> On 8/26/24 10:30, Kris Van Hees wrote:
>>>>>>> This patch goes against the intent of the code, as far as I can see.  The
>>>>>>> point of performing the size check prior to increasing the buffer size was
>>>>>>> to enforce the limit on the size that was explicit set by the user.  Then,
>>>>>>> if that size was sufficient, then DTrace is at liberty to increase that
>>>>>>> size to a whole multiple of the page size.
>>>>>>>
>>>>>>> But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
>>>>>>> not enough to store a single trace record, DTrace should report an error
>>>>>>> rather than increasing my bufsize setting on its own.
>>>>>> The point is that DTrace *does* increase my bufsize setting on its own.  Why
>>>>>> should DTrace complain about my setting when it's going to ignore my setting
>>>>>> anyhow?  What value does the pre-existing behavior offer to DTrace users?
>>>>>> Are you saying that DTrace should not resize?  That it should honor the
>>>>>> user's bufsize?  No more resizing (to page size or whatever it wants)?
>>>>> The main point of this code was to retain the bevhaviour that DTrace provided,
>>>> As far as adhering to legacy behavior... quite simply, we do not. We do not
>>>> set the "principal buffer size" to bufsize.  Further, any legacy resizing
>>>> behavior is, if I understand correctly, to go smaller than the user
>>>> requested;  we do the opposite.  Looking to the legacy behavior for
>>>> precedent is pointless.  The situation is that we are unlike legacy behavior
>>>> in fundamental respects, opposite in another respect (automatic resizing),
>>>> but consistent in some impractical and useless respect.  That consistency
>>>> strikes me as small consolation.
>>> You can look at this from different angles, yes.
>>>
>>>> There is no documentation to change;  the documentation is already wrong.
>>>> This patch was intended as a step to making the behavior something that was
>>>> describable.  Clearly, trying to hold on to a legacy buffering model has
>>>> produced a byzantine situation in the current port, which treats buffering
>>>> very differently.
>>> Yes, but if you want to go that route we ought to go all the way, and not some
>>> interim solution (see below).
>>>
>>>> Perhaps we simply disagree on those points, and this patch is DOA. But the
>>>> patch points out other problems as well.  E.g., the min computation wasn't
>>>> even right and error checking was wrong.
>>> Let's do this as two patches:
>>>    - one that ensures that the computation is updated to the current
>>>      implementation changes and is correct
>>>    - one that provides for increasing the bufsize to be the smallest multiple of
>>>      pagesize to fit the largest trace record needed for the tracing session
>>>
>>> I don't think that checking the rounded up bufsize against the minimum size
>>> makes any sense if you are going to increase the specified bufsize anyway.
>>> Might as well increase it to fit the minimum size altogether.
>> I'd like to understand this proposal.  Are you saying:
>>
>> *)  Determine the min size (correctly).
> Correct.
>
>> *)  Round that up per perf_event requirements (2^n + 1 pages).
> No, round up to nearest 2^n.  The extra page is allocated automatically by
> dt_peb_open().
>
>> *)  Ignore the user's bufsize setting.
> Well, no.  The bufsize setting is not ignored.  We just change the semantics
> a little (in view of the new implementation) to be a mechanism to allow the
> user to tune the buffer size, but within certain limitations.
>
>> I'm fine with that (given that we do buffering so unlike the legacy
>> implementation and will not be honoring the user's bufsize value anyhow),
>> but I just wanted to be explicit about ignoring the user's bufsize.
> We do not ignore the bufsize as such.  But the extent to which the bugsize
> can be tuned is limited by the implementation.  The bufsizw setting cannot be
> less than the minimum requirement (and you prefer to not complain about that
> and instead just increase the buffer size).  And its value must be a 2^n
> multiple of the page size, so it will be rounded up to the nearest acceptable
> value.  But that is therefore still controlled by the user's bufsize setting.
>
>>>>> which is that if a user explicitly requests a bufsize that is less than the
>>>>> minimum required for the given trace programs, an error is reported.  That is
>>>>> a mater of being consistent (even if it has no practical application that I
>>>>> can see).  Tests from the existing version failed because this was not being
>>>>> done right.
>>>>>
>>>>> As far as functionality, as long as the bufsize is large enough to hold the
>>>>> largest trace record, DTrace can (and needs to) ensure that the buffer size
>>>>> is a whole multiple of the page size because that is required by the perf
>>>>> ring buffer imlementation.
>>>>>
>>>>> So, DTrace only increases the buffer size to the required multiple of page size
>>>>> if the user supplied bufsize is at least large enough to hold the largest trace
>>>>> record (or if no bufsize was explicitly specified).
>>>>>
>>>>> We could opt to change the behaviour of the bufsize opton to always round up to
>>>>> a whole multiple of page size, but that is a deviation from the original
>>>>> implementation and thus is something that would need to be documented, etc...
>>>>>
>>>>> Aside from the computation of the minimum required size needing updating when
>>>>> patches (e.g. the USDT changes) modify the layout and size of the trace records,
>>>>> I do not think that the existing code is wrong.
>>>>>
>>>>> I am certainly open to a feature change to make bufsize always be rounded up as
>>>>> needed, but that is not a bug fix and I think that ought to be its own patch
>>>>> (along with documentation changes etc).  And it might need some more discussion
>>>>> because it brings up the question why we wouldn't just simply always increase
>>>>> bufsize to be the smallest multiple of the page size to accomodate the largest
>>>>> trace record.
>>>>>
>>>>>>> On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
>>>>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>>>>
>>>>>>>> The function had a few issues, mainly with its comments,
>>>>>>>> ranging from typos to incorrect descriptions of behavior.
>>>>>>>>
>>>>>>>> The function has only one caller.  The enforcement of a
>>>>>>>> size minimum was problematic in a number of respects:
>>>>>>>> - it was missing 4 bytes
>>>>>>>> - it was enforcing the minimum before the size was
>>>>>>>>         increased by the caller
>>>>>>>> - it was checking dt_pebs_init()==-1,
>>>>>>>>         missing errors with other negative return values
>>>>>>>>
>>>>>>>> So change the function to accept a minimum and change its
>>>>>>>> return values.
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
