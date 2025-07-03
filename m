Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F514229B2E
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562383; cv=fail; b=jDFFbUa6+HQYMz4hC1r8UapU4wHOID8cvw9Cr0qlMwECbFJuJTQWpLXavboPWMLbls5fIWy66ie+GwsZV8fc6G5XnaFgwhv5sKkjIRFtoj1chqC4ruqdB4rUUJGTWnzfyHNVQuq+ZtWIC/kM2Iz60P88wcjHvVun2JPvWyzPZyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562383; c=relaxed/simple;
	bh=Qr5ZPLjq4J8clUA0+o+RrXHTNen4WNDe6ZP1rQA0pXM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CCVJfUKq4IwK/lWNsYioeMx1U9ybXNH81KesV7aUgf0Q7GMbhYYR7nG+kXTFOM1WyE5j718CQ2YDVLzph3/w5UVytS+LUhJkOxOg9lQmmIkN0u824sCBKhRRdjSEfWX3piXZTmzPp1c3LmsBAx47f8KCuRIFIf+9ILtqNrUcaFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ggpikFNL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v9ywxqMj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ggpikFNL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v9ywxqMj"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ6XC002411
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 17:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=6YRbQfsH7Bk2ySHs9nqgJzWNO6YYCBSMXElInPxa5FA=; b=
	ggpikFNLR6yYjnBvr81j5796vgrKEl7L6C36TeFSHfmZgcBoruSC6KSGwYKxk7j7
	Kbvw+KDXDoZGAKr1Y+WhmFdfbEIEsz8YH1Yy5vvLXB3A5xDUYT9x6qZLc3oQU6PP
	7FP+21CHyqBzZePzK3TPyudvVeWws4MrJsPifPuqgUnBv2nwan9D169AwKUhR2Xl
	CHbRleUg+Wqb8yaM9K05M69P4yseSEdTLgD9ScFEwxmNz2FzlC47PAh9m6XA/9tY
	3OuUVKmT6Cqrw0gor46Jjf/URlqaSXtCpAyz4+LT78FlbbggUZrR62hGktpdXBDh
	iMOhHSCbiWWW4VydDftC7Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum80pbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 17:06:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FJ6Xk015278
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 17:06:20 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011022.outbound.protection.outlook.com [40.93.199.22])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucmywk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 17:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGw7MU6v48ZPZLjxzScwS/90LMJDVbo3M6M1VveQMf5XSXfmEyUHfQ1GU04yRQMGg72bjxZosSwZ7oH9dps6Dc3O8GK8+cWiHbTdti5imiugxY4cueRgM3VQiXCmRGGcezh60pXoDFKNUpyghKsF16aei3sYuMEtWe6DtTTLtwSUvUH5GDvKIUY+SxRxLqDJVjOvRBhFQM2k4XC6LtviaZBsNmuOOaGaBgHz6H/eOvLG1GtsyoDV7NE8tFD62Ed5qkt6gz3VHn0XOjjnVR2CzHDTi2+/5xaeQwDFFh9osPFBz08/MPNzBxAc1m2fw0LCgxslAaCgfkZL86JAUAJCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YRbQfsH7Bk2ySHs9nqgJzWNO6YYCBSMXElInPxa5FA=;
 b=O2oXm2KUSZQCrPT00uTArY7N9a+YZu9lU1mT92oUr0q25uc+e/uP03Zjz6+iWyYN/aq6v1mEaK9kywbo3lhqNkeXNDwfYMiRtZqt6QG1jl44z8++rn46/usP5HdUEVbFZ/+As3LStAScUdRSCj23M3sMxo4CmQaq2Ffy8JwafOP+QDiSAqriOO+ukG8ahCcKHbtlQqf1AkTUZV8WwdwrvwJ0G/Tw4fxcF/xAl/MgIMwd7KUVPg5/fNb3UaN+3B0FD7OAaVPdIjvoMZCLNMO8uR5IGB0wQZ34q+no0uJEjuEQuSi1xPQlVHvYE3hqsbk3ZROFokXKyNB44DzBY/kgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YRbQfsH7Bk2ySHs9nqgJzWNO6YYCBSMXElInPxa5FA=;
 b=v9ywxqMjOBSndgSvKsvX1WPohtLCCLfxiBne1ryB2iCbwK9KPRVBbiTwEPAtv6kf1Y1WLQh8SmIEi/0CyrL4YTkUU2RLnlGCxZneGiGhkxY2fOBujG2k/Q5PR//BquopUszdxSatH6y+D1icIA1XFKBKI0msdoAAvD89kqm+0Us=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7936.namprd10.prod.outlook.com (2603:10b6:8:1b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 17:06:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 17:06:18 +0000
Message-ID: <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
Date: Thu, 3 Jul 2025 13:06:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 852757ad-6939-4ffd-d2bd-08ddba53ed2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SElSck9zRG1IMkgyUjBZTHZ3YjBVelkwa205VkdpNkg1ck5kVWlIWlFFekRN?=
 =?utf-8?B?NXZiM1lpNjRSRC9obXpEbFliTGF3TzRNS1lGUlpkV210NXExbCtzRDN6SjVj?=
 =?utf-8?B?M0c5OUhIcEpKUjBkYmY0SUo3V0N2bVBFSG1ScEEvQTZNMCtEWEdkMWNNdVp0?=
 =?utf-8?B?ZFFSMzJxNzU4eDhlTDhxWEtTTENSK2puaWZ6NWl4N1hLeUgvNTJIVWQ2MW5C?=
 =?utf-8?B?TGNTVmh1STJMalZhVHBaUHBmTTIwYzg0a3BUTUNZcTFPbERSaWZmRlBkcU5R?=
 =?utf-8?B?d240TVIveXQwbFljNmprZVMxVm4rK0FiYXdHb2o0R2Z5bHRXbE5uckUyV3N5?=
 =?utf-8?B?dHlFc1RmcTMzMkEyTDNPc0pTZXFUbXEzcU9hQ0EwNXozdHdrdXRCRi90RFdZ?=
 =?utf-8?B?Y3FWMWRwcVRXMncxcEh6OWt0ZmhTNXdvYkFqWWNFZVhwOFdIQmdqUmpvRnpJ?=
 =?utf-8?B?aE0zWFBNclEzbk5KazJvajNhc3dRdXUrc1pxaGg2T1R0Y2RueUxZeUxCYjdD?=
 =?utf-8?B?SnRSQ1hERE5uSm9lL0t4ZDJIbmI1aWgvYzQ0cnhVU2V0L1U1TnZDZjNpcnkz?=
 =?utf-8?B?ZXBxK3RMMjZDYnk0ZEdVYytxY016U21qR0lENmJSb2U2c3BlMjcxeDh4UDJm?=
 =?utf-8?B?YmRmbWVtMnlaa2s1ZWpCZEwyR1V5NTZhQ2pUSkR6QXlIbEVDNDBZeW94djAr?=
 =?utf-8?B?eHplVVdMUG9FSjNxK2MyUDRMaEdnVFB4aUlFdmU3d3JIQ255Q2REWXdHSitH?=
 =?utf-8?B?bnFmK1RkOU5sckNCMW96UTVpK29uN2RxNmJJWTVydytGL1I0bXdqNlFmK2JE?=
 =?utf-8?B?NC9UT0M0dzQ0Y1JxL0xUaXVibUo0TWhSQ3hhK3ZwK3hvWllJSktWaStRN21V?=
 =?utf-8?B?VEEvMXJCTUttNHZZMWVKZkN6a0xDWHVkN2R3UE1jenAvRWtvRVJWcWtSUVJz?=
 =?utf-8?B?ZDBYZFpVTzZDNXFMT2xXWitoYXFyN05CZ21ZbDUxbE1Cdkd2LzBGWXJCeFkr?=
 =?utf-8?B?VU1OYVMyaXB2VFduMSs0RHhpVHhmQlYvRUQ0L0x4d2VsM09nd2RvR3ExVXE4?=
 =?utf-8?B?MFBPNHVMUDdERUNJaEIrWGQ5QmwzRUU2cFhQdmFxMDl6UmpwZlV4azNOanlM?=
 =?utf-8?B?UjM3cmgzNzFmaU0zbTF1cXAyVWZpR2R3ZWhaVlhuaFM2L01hN2owL2tBMGUx?=
 =?utf-8?B?d1UxMlphTEpvQzA2TnNaRDRWTnJBS1kxWG1FTnpJNnh5WFpFUS9lYmdLTzBC?=
 =?utf-8?B?RUdscUM3OTJVdTNjalNCM3dDeGFuZlE3eGhRUEJJa3dYb3g3b0xTbUduUzlP?=
 =?utf-8?B?MC95N3BOQnd5eldlTDdKaGU5SHJVYW5OaUk3eGhnTkEvbXplb0g5UnlKYUxU?=
 =?utf-8?B?dnd4SDA3b1ZQUk02ckJKMktKT1lMTWR0RmpBVnNTd05NSmhQMW5GSEgrcTZB?=
 =?utf-8?B?MlV2UGFCSHJ1T01qUHBlZmNkQnZPSnpjLzdqQkZXWGZ2TDcxU3NyYlV0QXFy?=
 =?utf-8?B?K2hWSXkxaEk1eWdUWk1MWmFFaWlWaDZ0eVFhWkJnYy9jWnpUQ1o4Mjl4c0Ft?=
 =?utf-8?B?RVBRYXM4a2lKb3ltcG4rN0d6RCs1SmIyYzY0OXlQRkVPK1ZDN2FQbUoyUnZX?=
 =?utf-8?B?RzdqeTA2bXp0cVNrbTFHQVdxRlY5MFBwRDEwdGxra0ZnVHdydERCR2hkZXhy?=
 =?utf-8?B?OS9oUFZxcDhyZmpWem9rcmNpTTVRNUVHUXVSWFFkUWxFTk1VZXlHZ1dQTXFl?=
 =?utf-8?B?TjUyRU0wY25UMjF6SXFtQkFTdG53ZXlFY28ydGVEVE9oU2x5RUFGNDZ0SGc2?=
 =?utf-8?B?dURMMng1WXlEUVNXckw4Z2pzdEVCN3JoOHVodDdLSFpqSHZ1QTJ4RkRGYnFG?=
 =?utf-8?B?RUtvam1kY2tDSVZ6ckdjZ1o1ME1YVFhSM1VpWHIrUkl1dDZZNk1EcFhlUjBn?=
 =?utf-8?Q?G1h8Tlo6aBc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0cxTmhDUWtQSEdzKzFuUzRpeWZDZTMyRzVKU0pVZk15N1VOQ010VEpFdkdJ?=
 =?utf-8?B?V0ovZnlyQlQzWkNacnJqLzRJa1hnV0w5Nm9zRVlJS3lLRjJuUmR6cXZwZTJR?=
 =?utf-8?B?QzJFbE1jTDdnazdiRE95elFwcWY4U25RTEVRNDl5SHNNak5OKzFVeW9hQmdw?=
 =?utf-8?B?MFRMMityZFBmTU4xclduL2RubW5mN0pIRm8vYkxQbkg4eFZsSS9zUUlXT0pH?=
 =?utf-8?B?MHZVV3R2N0VtNDlKYWFocFQzSkZTQXRLbWlZRlI5RnRVcmF3ZDBYakxrYTd0?=
 =?utf-8?B?ZnVUZWtWaVJZRURESlErbXhCaXBhQjNNNDduNlZadEt4R1g3NGJSbUpxelZa?=
 =?utf-8?B?Z2Z0c1RqdXJxcnB0S0gvZXYwZDE5dEQwSDlTdVZGN1NOVDJLNUl5VWx3MFNB?=
 =?utf-8?B?SWNDdHdnV2Z0YWJpcVZwdWxERmlnUjQ2Um5SRktKdFoxbWE3Z3g2ejZETE9C?=
 =?utf-8?B?QnRSUW9lNHBuUncwb1RuQmtuR1lPYkt0U0txMUlCZWdaZkhPdUtCODlTOVcy?=
 =?utf-8?B?M0JRVVZqYTdBT3FyeXRCL080VEpESGZUQXEvUFJOYm43TFNBUU43RnZTVGU0?=
 =?utf-8?B?RHdQaGhhY2pDVHF2cFJ1R01xaXdla3RhR3BMNXV1WXhEMURtU0JYL3ZGMXhm?=
 =?utf-8?B?QmpmeWdBbVk4VVQ1NmhHT3JLOG5neno2ME42VUFBTmVWcjlzSnJoT0R0R1Uw?=
 =?utf-8?B?OFRtOTM2eDFlZUNSSjdLbWdabnNBSlArbU5xL0ZzRXVTSHZvU2hQRG9icDNV?=
 =?utf-8?B?eTVtbTkwdGUvWUxHMTZlV2ZxNVZDa0svd3dMU1prNkQvbHZwaUNDVk04eDZY?=
 =?utf-8?B?ZktPL0ozczR4SVJYTVFqRURqOWxjWlhuUFZZdEU4Y3J0TWtFRTV2UnJ5WWhn?=
 =?utf-8?B?VnBEWGRzbkh2Z05lMmg1U1VVbVJsa1FKVWJabEhUNVd5aFZKQ1NiVWRVbm9G?=
 =?utf-8?B?VWQ1SlU0ZmZwOFVHbWljSmNSYXRkeEMwbFpVcHRvS1hqRnliK25Gc1NFMENr?=
 =?utf-8?B?anVqQ3VkU3pUdmlhemhaTzFqSCszTk1pTG5wb1F0ZkJUa3doYzYzOFg5ajJq?=
 =?utf-8?B?dTFYVFpKZ1Fpbnk0SXE1MEZzcnpEcjhKSHFGckNWYXBwOW55a2xFKzF4ZVBZ?=
 =?utf-8?B?THkzQzl2MGE3Umdxdm9YZjVzTS83TEVsV3pOTFN1cVVJaDBUdnhPRXM4a2dl?=
 =?utf-8?B?enZJNG9MS2JzcFhLM3BCSkJMWlU0dXdONFEwMWl0RU53ZmdnVmM3T0FIM2kr?=
 =?utf-8?B?aUtkcC8xN0c1Z1RiQ1hPd1NtQWtUVHV3bTNKVmRqNUVuS08xTmFVUXRsaXA3?=
 =?utf-8?B?Q1VLdWRncW1QTUlJZHpSbkFRdWRGSmI5N1k0VkwyYVRlWlFOWVR5SjI4NVY2?=
 =?utf-8?B?bzBOZzV1TTlxYlZkQnFCckloK0VYK0pHRnkxSFhvU3g3bGtYK2haV0ZaZCtX?=
 =?utf-8?B?R2xxNHhrV2Qyc1AzVi9KWHovSm9RTmtJRndSQmw2WWpybDJPbEYvMkJiRDFJ?=
 =?utf-8?B?YzcrQVp5V09ldXluK0NRVS96dnp6UEdiTjFwVm1SdnFkK3ROMDZCZmhZdkMw?=
 =?utf-8?B?QUV2OS84TGNMdnhYdk02c2JqWEFNWm5NbDRuOWxOZ2hlQUVHQkpSWWJnaGFh?=
 =?utf-8?B?ZThNYkV1YzhRL05YVzRZZFIrNm9NMk9vdXVFSWlhKzUrU3JYMko2dkplMmds?=
 =?utf-8?B?UmExUW9KUUZWQWVSb3pJWGhDajZteG1FcytDU3NVYzduaEZoa2dNaFlYWXVL?=
 =?utf-8?B?dWlkTlpxR09FMUNibktzL1YxU3FuZm5vODBZVFBRaStmaUtkMElMWFZVY1hz?=
 =?utf-8?B?ODRjK3dnNFZsenNMNmg1TVFvL0lCazdTMzZRSjNWcWw5TENidlFlWml2dzBj?=
 =?utf-8?B?U2VYYWVDV00xb04vY2JxcHozU2NydHdZNW56T2pKRkhJYzB0Zm5VNitNdStw?=
 =?utf-8?B?eDBBWTZGQ1BmNVNwd2VBK3czNGhobGdURlRVNXRJTWZEWDZsa04ydStaMDc4?=
 =?utf-8?B?d2N4N2pxUnhtMW01K1dZNU1FWjhTQXRCc0tRdUtoMlJnSWEwRWQxZTM5ZStO?=
 =?utf-8?B?YWNIY0xNYitwcGVxM295TGtPdW0xNTgwVFlwYVZKUXlxQVkyWkJoWkpiSU4x?=
 =?utf-8?Q?jNM3/0m8Bif1nXZNQVcG/uMBy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BnILc3y06Mok8a/lAHo1Pdu6INo3lM0XPIn6pRrbr9NMWC5VMTOAbEAnlo7mx+jd2zQp+ypXX/jZW9xys8qt08kATF9VvQRUjcU8/BClFmYk69Y4fNDT2QFI0CBtyIsrl+wdkDfEt833KvDcRse2fR8Cq3Y/iXYqEPuL21rNOwJYzZBEus80PCG9zy3hSE63bpiVd0f6mF38e8GyZT+4s7KpSQxHevCSTGI/4j8In3Sn2hfWZA8XdcfJ5AREoj9IDmckScHGLbsOrNlSWgFUJFP0HJZCWqOnshZQWN3kwlD2OUIdrfiKXr0p7xBJOMT3k+N/TwgJR9F3NL9YVDjqGkfuyU1C5gQykSTxwT+djRnTlcW9xP03tW5Z8UkTtco6KbR3Y4BmCCYrccQZhkhAuWAn8e3cLhr/WuctIxlD29SH9Iz+ortm8JXTH1dxDricJC+/kSi8m+NzXdSyhoNFu4HIvVECfl76jwpAY1ESrJtG/zlwku59+fMI8t8pc1t+muEKBTREiwDN+rSQ8tk7YCT/XKNQ4g86t06xjxYTOq5pFBiEttuO15/JZT5CDQ2s+gpCRAckVPd3qyDbWezDm0XRezVQLa4bi9ImLgCZJH4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852757ad-6939-4ffd-d2bd-08ddba53ed2a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 17:06:18.1707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rw7ehoBcLtLEcNN2meDLdFfzniuIsRQXVeSgnAE9QVeqG/JjkVTcHwS80xko6FpzCwC63fSuHxhVRf2k54+CIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7936
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0MiBTYWx0ZWRfX5W3YiEE7ryj8 Wk9x1TkAm52aXFUIFsX9pLquZBLGM21ouL785WaWebgJVR2TcT5E+vPejNZDr+OE+O2McZBNxEd 0xGM3mJ4kmNdwyFZxrOa2Raf/vO2cj7r9QQALFwaVgCtV0SM8yeBddvVU2kHGAApWhqeQZ9vzXP
 KTmgh33pu+87/J2yG5VvOUoBSB11tUeU6B6maEapC9IVF7uaYOTjOpUIpMlH6O+6t6obEIn0oFm ZhznF1BQ5BqCtisp9VTPLaSRu/71Z3bLLd5YN0/BGeVy+5m0NcXqWF/6qEf9+gRUCjJtOBIwV0r 7KCCffS4z/jTFhmMcUa3UeQjrcvgzfq1hKX0xyDhPBeSlajd42eeogbKtSaZLebtahZCC+VTX6c
 DOard7cFM3k4uek99aCzv6kdU7wSImVk72IK2eZTgg3eJJCDkUxEPTXBLxGeaUufBD8uWQ1y
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6866b88d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=a8AE8Ql2dKYgKNMualMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: p6_BShhXLBfGgWig6IDIFSyp7Eb6USOy
X-Proofpoint-GUID: p6_BShhXLBfGgWig6IDIFSyp7Eb6USOy

On 7/3/25 12:59, Alan Maguire wrote:

> On 03/07/2025 17:43, Eugene Loh wrote:
>
>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>> patch 3/4 feedback).
>>
> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> send probes?

     dtrace: failed to compile script /dev/stdin:
     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of 
inet_ntoa arg#1 (ipaddr_t *):
     Unknown type name

>> On 7/3/25 07:33, Alan Maguire via DTrace-devel wrote:
>>
>>> The current approach of looking for remote addresses
>>> is brittle and fails in many environments; it checks the
>>> default route gateway and looks for open ports in the TCP
>>> case.
>>>
>>> We can however achieve the same goal reliably by creating
>>> a network namespace on the system and configuring either
>>> IPv4 or IPv6 addresses on the namespaced and local veth
>>> interfaces that support communication between namespaces.
>>> If a tcp port is required start sshd to listen on that port.
>> Maybe a comma after "required"?
>>
> yep, will fix.
>
>>> Teardown is managed in runtest.sh as signal handling for
>>> timeouts within the test scripts is not working; a trap
>>> function does not trigger for TERM.
>> I'm having trouble parsing the text before the semicolon.  I think I
>> understand it, but cannot seem to figure out the grammar.
> I'll try and rephrase; basically I tried adding a
>
> trap cleanup TERM
>
> to the test script to catch a SIGTERM when the test timed out;
> unfortunately this didn't trigger when tests timed out so we were left
> with network namespaces hanging around.
>
> How about
>
> Teardown of network namespaces is managed in the toplevel runtest.sh to
> ensure that network namespaces are removed after test completion for all
> cases; success, failure and timeout.

Great.  Or how about a colon instead of semicolon?
