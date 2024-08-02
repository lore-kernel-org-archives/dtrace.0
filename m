Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914EA1AE02E
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722620757; cv=fail; b=ccE4x9qpc1ypTkTJPpQeAQrrIkM58bTeaBLaT/qUoE7WUUao9eoQ8IFl9Rr3ee8Pi/6BdRv+fRNJEJMSdYCC+nrMlth1Ekm8tu4FrcFhT5dUnG42nkyb/OBfIHh0xK+DdaCzK+aZxfp8IJZYA6r1ZRlS+UJNlkuj59F5zWA8HBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722620757; c=relaxed/simple;
	bh=x1urDW8LXO3mpqqDxZgh2bazK7kP+E3mcBQbkKoSnCA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ke8EPQAzVt3C9IApkqQzoER6u6UKXdiiVvEzA6zgxz91Y6cWNeVM6WrOkAcEV7m09W74CraI//mS68BvMkcS8iV6nhTzTxHNmnTO6MLweONvY0qBbVKODSOqShUS4sqMnJuADz/0hgvxCUH79xpVf0bno0xkk0RZgdHLMXJ/58Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CIO6H00w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fgAchLX0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CIO6H00w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fgAchLX0"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtYKT022338
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=rBJ67+Uqkpu9fet0QE3DfXGjDU02iwTYRcMFOrW4EVc=; b=
	CIO6H00w2JlSHMObTAbkgmn+7/FWE7KvUoYxczL0fhi2+l5noEOGC4kfNI+fUBg9
	dD4gloGdG0HLL5LDWij+EVzpCY8fjJ1TVw6EpJHYjed8iICB9/TBSNflkw0IGvhz
	b+5rEJE0EVEwFgU6gG6v6/X7NdTS1y/kZKD8EhtME4CmkUnHuPcn+SWL5/qxVbNA
	pTgqMj1YtNqFOd6niN0kCiVkWIbEIWhxSQ13UomejcwK2P+X247bQYMCkkWZ76e3
	fAnkj78u+VVlIsiME/xtglExaK/AJcT5cds2GB2Znn8cGafIOAA2VyS3VKeB9CKb
	4fyvcD9v8bfe+UJlOuxLLw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdwhsjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:45:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472HQ3gw035438
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 17:45:53 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm87kre6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 17:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSo8qGaDzy2U/4X6s9aD1Dwe91TG6vJFfZM2UTVMCfkT/WIkL3tWdXRV8P2kzNzw1J34tFkX8B1JhgIXhBF7xdxNM6Uuy2hi3bipv69cTMUX4Mat8RMrc56fXyZXYG4O9+zzpboHOZTprfglCwfkUt0j/0oOOU8KAwSivDN5a8NNs6/f8sx8VbvH8PgbhPAXwsMTgTfeubNpreSM1n28dNwzyFTibiH5zWg59pwhE09lY/J0B6wzfyB5wqYGLrT77cePTo7l1EIobJ4+9iCCH3ZHf3T1MUZ3iOhfFlC7V1MxPnqjtoVfuaVg2ODn+xZ7udo+v9eDtjvv5jo2fn5VCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBJ67+Uqkpu9fet0QE3DfXGjDU02iwTYRcMFOrW4EVc=;
 b=sHdbt4gLFqKblCeHHHd3Ib0oMRexYf0rOXCC9lfpLf5DE8cLUqwhGeFSzVM4xGZWk2ZTlOC6YXS4WzV4cVleJo1t1sveSkhw699xOdjTSyZeFLoi6q20norXFVHhb0c0imsYeZnVE+fTF5xKKaVkZXInbp00wCyVH7H8qm62Wq4QqM3TbOq5lLeyVsBRA3n9j3YiambbRBGN7VbZBabzpzxyQqbzBEOAbUE2meRroyydQFdhZ+DN1C6KqnnRL45qf80Y1zjOerQzn3Yh7uPljK8HR7Iphf8rY8YwzBvtGShAfAR1GhhBpTtog1CodIyi9QJoWM9QhODlmoFWWpPHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBJ67+Uqkpu9fet0QE3DfXGjDU02iwTYRcMFOrW4EVc=;
 b=fgAchLX0Am4a3XTl5rasqw0UsgchOzmF/ZB1Wj6Il5YGFxvfSSOy2XKr57qI/IYmaYxRnBUR1jBLIOfnShEBfE/ofpGQ2d/JAMO5Gwj7NSKtqBPh1h2LhZirPOuOkF2AIDWL2o+lWO0G/wm0mUigSBz4fs9dErJgYz9Vpodp2g8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 17:45:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 17:45:50 +0000
Message-ID: <4b35d162-6850-1c2c-66c6-3066a6e058e0@oracle.com>
Date: Fri, 2 Aug 2024 13:45:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] bpf, fbt: do not try to get a return value for void
 function return pronbes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB629267A7B790147418169E8DC2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB629267A7B790147418169E8DC2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:208:530::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ffeb6f-6598-4739-262a-08dcb31af285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zkx5OHZMcVZtbGFZQ0paUTcyeUtBL210U3Y2SFlkQXhXdnVFa2R1WHFNT2dx?=
 =?utf-8?B?WjZyczEybGNtUUJWMzltbTM4cnIvNEZVRVV6UDN2M2tUeitNK1lGczdIMStu?=
 =?utf-8?B?Mm1SZ2tqT3dGY2hyaitMV1Flcmx0QVRoTFZLc3NtRWVyL25pNytaTkMxMFhT?=
 =?utf-8?B?aTlFVFVKY3BUVnZsZWEvOXZaVmhOdXowa3VsSkRyV3JZMHAycGlnUWwrTUJo?=
 =?utf-8?B?R1RmSVdNb2I4Q254MFdDOG04VUM4MUpHUkU0Z3JLY2F3NVZ0RGh5SnhhWWFR?=
 =?utf-8?B?akc3ODlaWGlaZUpsUUliaEJyc1RRdUNEQ1JGOE8waEFJWFVCYytJOTJLZlhM?=
 =?utf-8?B?WEJpQTdLMk5FOHFKUWF5TVExQVQ0bk1uMGFXeHVLRmYwNUQ1WXBGdlJiaWhI?=
 =?utf-8?B?aVkvZHovUzlLYnVkb2YxWnlXZXpUYlMyUGhmNFVwR1BaRFMvS3hEclY5d05B?=
 =?utf-8?B?Y21RVU4weU9haHFLa0JkczQzK0RYZmtpdHNJR0E0aDN6MHA2N0MyckRmRE94?=
 =?utf-8?B?U042MUpYdlc5T21mNTVtNzE0UnQwQnN4UlE0OHFzeC9QdFdxbEdQckV2emtQ?=
 =?utf-8?B?Y2xwYjRBRzB6dG9TYnhpUXhhU1lMUlBsYS94RkdaSHVHZk8zY3BZRmE4c04v?=
 =?utf-8?B?d3B2bVU3T0JUVmdXVWZEKzFNNFMwdDFQemFRV1pVeTczSmxGYUprZG5FNDdt?=
 =?utf-8?B?UVNVUXJPZ1AvRXhvZHBDK2tYbWRGNGM0UGQ5d3ZwUnNJYjdMNWZvVzhrejhR?=
 =?utf-8?B?QXd6ZVRDVXhoWGRMWFlRYzZYeHpPdDN2NW9tZDZ6Q2J0NVJ4WU1IZWRxK1ds?=
 =?utf-8?B?cUZsV1BaeHZsMGtkT3dQU2pjTm9Lc1dkOUg2dWJYMkZLOGx6QUpLWjdodjl6?=
 =?utf-8?B?UERTNlpPOHYxRjhMeFR0T29aZHhhd1lrM1JKUjB5a0tYTVppL1Y0QW9mOU9W?=
 =?utf-8?B?VEJWU0k0KytKakZPMnlMVzIrTHJQWXQ0T0RWV1lzMWFYRHpmRUlnQm9JM3F4?=
 =?utf-8?B?NG0yT09zTWJSNzFKdUhRaUtDVmFWeFpGUW93dld1TTNleG9kbHg4ZXBBTnBQ?=
 =?utf-8?B?M1RsekliMHRYL0RDQ2lIYTB0OFBwQXhIZjVqUHVaMWs2L04xQjl2UG10Nmpv?=
 =?utf-8?B?dHFoOG92Z2xwdUREOFJNUTgrZ0liMUpJTERldUxHMnlTYXVZaWdVMjVBc3Jq?=
 =?utf-8?B?YllEQjRDYTZjNU5Ic1NUTUI5Q3JDUDZ2STBLeThYeksxUndNZWJsRXhDNFJK?=
 =?utf-8?B?aFhHdHVYSkphTTR3QmZVQ1JHaUpOekVERFNKVGxJV0E4QVR0TjFJNk02UXRM?=
 =?utf-8?B?Yzg4REN4dGoxcHhLc2ZmMkN5MXBHMUpweEVzRmR1endoZUw5OStQSjd1N0dz?=
 =?utf-8?B?UE9xem94NXZ3Z0NvRUNIOVRJUm1CUlVkKzgwcVJhQjd4cm9NYUYwSDI3R0c5?=
 =?utf-8?B?S2VHZitKejFDbkg5OEZDUHVrUTVzMGtkTERMWm9YN0FrcDY5Q3gxQmdZYkxr?=
 =?utf-8?B?Q05Pd3htT0ZUMytqN0duTDJpRUY2eVlITktNOWJGb0ZtYVhOT3RabjQ0MVk1?=
 =?utf-8?B?ekRyTWxiZk0vNHQ5Szd0Z20rWlhibU1EUnpia0ZWSWZ6cFo2V2lKK3NIdHRU?=
 =?utf-8?B?cXR0V2ZiWVhTNkJDTi9PMyt0UjJEbTlSMENMTEpSc0FzaFRBYVJneXh0MVcx?=
 =?utf-8?B?MUhyaEVQU3Z3c1pNc1NTMVh5VXk3eXR5UkpFT2hJSzAxdFZXYmlUUTkxNE9F?=
 =?utf-8?B?eEI1bGM1VDloc2FRVFZUVVQ5MUFISFpGVlNsNERzVGdBVC9YRWF1WmR3Wi9M?=
 =?utf-8?Q?G1T8Er4bRJoLXLAW+AOK+O2FCam+8CqY8R7fA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZ5c3lsZkVEc3pybitOUXpFay9SUlhJY1lKUTV5Z2IxanJ2dDh4TzkzYldr?=
 =?utf-8?B?bytlRWFtVlF5VTRGSWZDRFY0d09mTVRYMVRkMU9Nd0ZHVTJ6SDJ1RjRNdFIv?=
 =?utf-8?B?RUxZMmF3N0YxVjkvVDg5MmUzY0Mzbk9uZHcvRGJ1L1JwOTJJUUp2bjhlalZr?=
 =?utf-8?B?K0NNd3U0QXhmUFJNTlR5M1FZWTAvMm1XY3dlQ0hiSUpWWmN6QmxNV2tnSDBu?=
 =?utf-8?B?RldKdzA1WHI4NW16Z0FuY2NGZDhTcG9pUld5dVBYRjlTQ0hQUm54ZlhWQWlJ?=
 =?utf-8?B?cVhTM1JoL3NrQ3lKd0pFNHlLSlZEWURVVjBGdDJGd2JjaUQxbHZ5cnNmYW5v?=
 =?utf-8?B?UytpcDFzWWZnMzhEM3NFUWJrSHkyeGxPR1JpSmpPUGlIR2M3L3NGL3hXazJ0?=
 =?utf-8?B?SzNnNW1CaXlzK05MNzMwSklJS2k5aFJkU09HbXY0TGdCQTArR2EzR1BQazhl?=
 =?utf-8?B?MjdKcGpSQWNFbTlpdmJWcHZUK2lRTEY5dE90K3V5TEh4ZEVRNGFFNXA0WCtv?=
 =?utf-8?B?d3lXbGV6ODhPVEQxSjhjcVRxSFZaS2xJUjNlaDd4WnJLdGtTK3ZHK0JadGZN?=
 =?utf-8?B?Uk03YWg0RWw3Vk1wUlBobWVNakNtWjNmVnF3Y3lQRnExWkU5a2pwdDFMY0dx?=
 =?utf-8?B?Y1hjVXVib0hOclVFSTV2SXltYkVKVmVOWHIwUExNQUx0WncwZk9DUzlLUE1U?=
 =?utf-8?B?ME91T3BxZThOVzBxTnBtWmk1Mk5CdUtEb1JxeG1saE9TcE83MFJHS1BTeWJm?=
 =?utf-8?B?akFhYlJmUlRGdXM2WDI5Q3g4S2diQ29TMVlXWFVYUUY1cmVYeHJVS0g5bHpq?=
 =?utf-8?B?YmVZc1VxMHI3ZlNCZHBEeTU2Q0JyQ1dUY0VpRnhsRjl6VG9HL0tGdHJlK1JJ?=
 =?utf-8?B?SWQyclZucUxMWWFpV05ybEhIRUdzajZYNEczZlRUbU9UNjgyM1VaVmlJRTBn?=
 =?utf-8?B?cXNCZnJwUm5ZbGVScWI3Qzh3M0IzWE9UTXZhSUUwSkY4aDdLcnk2SE0wdTBJ?=
 =?utf-8?B?dnFoM3dRU1BzemI2bTgraCt3K213NWlKUWlrTlhLdkc4dXA0NC9wdUExZUpL?=
 =?utf-8?B?WFBvTFhhZGRKV1pnUVNDKzJYcE82dit6NWVLZlZjYlZwQVpFa0M3TmpTLzZL?=
 =?utf-8?B?OFllNHJ1VkxERCtZOVhvUDBUTlJ3ZzZXQ0FrTGNQa0ZlYk5scUJmT2FUQWJh?=
 =?utf-8?B?MmlJWlJCU1hXNlZnR0ZOYThnM1pQRXhGbTR1TmJ4cFRPcGcvMlFKcTJpcTEz?=
 =?utf-8?B?U3kzZTlOSVQxakNyNW5GakFuVlkrS3EvWFRUeGFienRtZnpkTU5obWxRSzZU?=
 =?utf-8?B?VnJEekhuVUgxZjJwaDVoUnpCRlA5bnN2Vzdzc0UxbVlmZDhsSGNISEZvK1l0?=
 =?utf-8?B?Z0dRRGlsQ3Y0VldUUHVpTTBJTm9mcnpqK2FRM3FkdC9DMXR2QlRwL1pGZkFC?=
 =?utf-8?B?eXZ0cnZOYWZ2NysxdXVBU3Z3VlgxY0d5WkduT00xN21mWjA1NkZhSmdQZnp6?=
 =?utf-8?B?VDVWZFRNWE1BMkZBSXVKdGxqNElKK0RvdXZhdVppQ2krd21oVWYvS0ZlVE9H?=
 =?utf-8?B?eklNaXVsL2kwUXRJcXNhZDZ1b3pPd2EzWDJjblFQR0lZR1NFUU9YdCtoNWxS?=
 =?utf-8?B?SVlxOU4wNURabTYzQi9SNDMvelUrV0M1QXRQUXpFbXlxVHpUTU5Ea3hNZGpE?=
 =?utf-8?B?d0Q5SWRoN0ZnUWhSL3p3cUtMZ204dUxPZ3pqOWZ1L1puTi9WVUZQbWhiWmVY?=
 =?utf-8?B?cnhMaGNmZG9HSjJXN3ZBSHFxRzZ5aXE2L2lsMWdiSDJ5M2hoSjNveTNXRXI0?=
 =?utf-8?B?WDVFSEs0NWhLcVJ4eHFKbGhCc21KcTFibm9TdE9MMUN0Zkp0ZDJCSVVQR3lT?=
 =?utf-8?B?RTBjVnVWK3p0Z2N6elhVcVVlUFNCWE1RQVVBODRWdWdydkdxMnBuWWV6V3BC?=
 =?utf-8?B?WWdhemlydGc2QmhxdmhIaEx0Ri9sWUwxVExEV2c0dW1ON1FXaCtFc2lUWjVp?=
 =?utf-8?B?UjdPblRycE9IYWFwZndNM0tkY0JiRUpMdDJTTVFsYnpPNnowM1Q4YnA4UWhR?=
 =?utf-8?B?TzN0cDEzeVRYZlhiU3pzMjZZeUJGWXhjMEFZVnF5ekRTQzd1NHNDUzBhaGg5?=
 =?utf-8?Q?IYMDj5zp7Hw3xuXE2OVzCLjvo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bbGqnlgS/gLpExpxNFeFNFn0eiix4DZ0q+zxupsjBSYdx6AFoZKC3OKXegYqiiP4G2qgf874oljo8EnJxbq66RDgBHRS1o2h0NQIlk/+5ii2hF5YVzj1pwhClNeCkyAGpXfHB5ZS1te0KssmkAULlHbGWbxysfR6pb1mtvuTTM7Kcr1X57PUkhdBgyPrTZmcT/lTvgM06Xo5OC862ha2I6j6fMgYzMjkviEMpzotD4FmFVBwexotGkksdBkXLw9FFaat8akMqLYz3JbEaUIfPwncvNLJc2uAwGzgqiCFzx0icaFIma3VIt9PvSkHsdgLhXh8aNrDYeiZjoiyYnwEFdtFbKZl0wZgFVJj+NMZAr9sKiFKxMNtXbNrs/NdSjYkV2bLuu3GHjb29fuY/MHSOp31G3h08xmNncxa4YavVtAh9em+L0Z5kaTiX16Zuezdj4ZMCJTows9oOZywm2d6RaobRwkaThwhir2tq3f1rBXYokQAW0utxaW3IIdF6q4XMgKQg4dc+qsSaFdU3hEuJuoeQhnNDyKF6hw/TYbzPqMnFiGAvdX9VlCDSmGDNb3swkmrTbgR2kHNTsrGIA8R6rmJFD1w/Nmh+BHOy/8kzJ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ffeb6f-6598-4739-262a-08dcb31af285
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 17:45:50.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC/CcVe2Sxx4H/KGlH4WtZTTOl9Q9cJVhx6N7q5jx9OKBUyVzo4YOkhVNNbwVjt/Bqwu/+EZlj4HgJ8VIa9RsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_13,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020122
X-Proofpoint-ORIG-GUID: SuacG_D3iCiOEHDlYDqQ1RN-BbAZY1Vi
X-Proofpoint-GUID: SuacG_D3iCiOEHDlYDqQ1RN-BbAZY1Vi

Not a real careful review, since I'm not that familiar with the BTF 
stuff, but:
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I assume the new tests already pass on kprobes even without the new fixes.

Might the tests be (theoretically) a little more stringent with .r files?

On 8/2/24 12:35, Kris Van Hees wrote:

> We were trying to access a return value for void functions, causing BPF
> verifier failures.  We can determine the return type when getting the
> probe info, and set the return probe argc value accordingly.  This then
> drives the code generation in the trampoline.
>
> Reported-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_btf.c                            | 16 +++++++++++++
>   libdtrace/dt_btf.h                            |  2 ++
>   libdtrace/dt_prov_fbt.c                       | 21 +++++++++-------
>   .../fbtprovider/err.D_ARGS_IDX.void-void.d    | 24 +++++++++++++++++++
>   .../fbtprovider/err.D_ARGS_IDX.void.d         | 24 +++++++++++++++++++
>   5 files changed, 78 insertions(+), 9 deletions(-)
>   create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
>   create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
>
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 77366df6..e905580f 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
>   
>   	return -1;
>   }
> +
> +int
> +dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> +{
> +	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
> +
> +	/* For functions, move on to the function prototype. */
> +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
> +		type = dt_btf_type_by_id(dtp, btf, type->type);
> +
> +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
> +	    type->type == 0)
> +		return 1;
> +
> +	return 0;
> +}
> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index a7cee464..e05b30d0 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
>   				       const char *, uint32_t);
>   extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
>   			    uint32_t id);
> +extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> +			       uint32_t id);
>   extern int dt_btf_get_module_ids(dtrace_hdl_t *);
>   extern int dt_btf_module_fd(const dt_module_t *);
>   
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 461d5e35..80c3db20 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>   
>   		/*
> +		 * Only try to retrieve a return value if we know we can.
> +		 *
>   		 * The return value is provided by the fexit probe as an
>   		 * argument slot past the last function argument.  We can get
>   		 * the number of function arguments using the BTF id that has
>   		 * been stored as the tracepoint event id.
>   		 */
>   		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
> -		if (dmp != NULL) {
> +		if (dmp && prp->argc == 2) {
>   			int32_t	btf_id = dt_tp_get_event_id(prp);
>   			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
>   
> @@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	dt_tp_set_event_id(prp, btf_id);
>   
>   	if (strcmp(desc->prb, "return") == 0) {
> -		argc = 2;
> +		/* Void function return probes only provide 1 argument. */
> +		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
> +
>   		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
>   		if (argv == NULL)
>   			return dt_set_errno(dtp, EDT_NOMEM);
> @@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   		argv[0].native = strdup("uint64_t");
>   		argv[0].xlate = NULL;
>   
> -		/*
> -		 * The return type is a generic uint64_t.  For void functions
> -		 * the value of arg1 and argv[1] is undefined.
> -		 */
> -		argv[1].mapping = 1;
> -		argv[1].native = strdup("uint64_t");
> -		argv[1].xlate = NULL;
> +		if (argc == 2) {
> +			/* The return type is a generic uint64_t. */
> +			argv[1].mapping = 1;
> +			argv[1].native = strdup("uint64_t");
> +			argv[1].xlate = NULL;
> +		}
>   
>   		goto done;
>   	}
> diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
> new file mode 100644
> index 00000000..4bdf36cb
> --- /dev/null
> +++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +#pragma D option quiet
> +
> +/*
> + * This should fail compilation due to accessing args[1] (not args[0]) for a
> + * void function without any arguuments.
> + */
> +fbt:vmlinux:oops_enter:return
> +{
> +	trace(args[0]);
> +	trace(args[1]);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
> new file mode 100644
> index 00000000..516d733a
> --- /dev/null
> +++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +#pragma D option quiet
> +
> +/*
> + * This should fail compilation due to accessing args[1] (not args[0]) for a
> + * void function with arguments.
> + */
> +fbt:vmlinux:exit_creds:return
> +{
> +	trace(args[0]);
> +	trace(args[1]);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
