Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D31D90CD
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 21:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199390; cv=fail; b=MFqiPGL0XpKiBhcZPqVVvEbn5RADu/AA7pnN10sEmhND7K+nrIk+Xpr7hrA+LcwlJSUKBP7Vt4xX20eEoius9dNpLFmX2J1Ew9XZ+spvzcx21E2DGetuL4qtvwfThoU6hLJJhGhqeFnNm1leMJk+PG/R/8x+9qrasrZoPU2PB4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199390; c=relaxed/simple;
	bh=e4k/rDnH9pQx9E8zzy2P8aB16StXtEPnaWUDp3heolc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d1BQNqHZQW/rcSVngfY78pGyICuv/2E4pxWb17yYYUI3hxmp+EXELH7rlwyIH+iON/uOzJEQkswHW3cZJU/tIM1dalYzh9aC2ZCu9yaB2dgtHmHcROYCSuvvU23pib779NeOyP1GR1FyylmO28yy8mKs6RbDr5AntqKfmJFtu4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PqHIXEOn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y0YrK5Iv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PqHIXEOn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y0YrK5Iv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506LUTXc003395
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 21:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=o/70vBVbP52Uq/waRWhZ0P7fzRXB7aUPLKzeZVbLkMY=; b=
	PqHIXEOnDFY9WKvxATgs/7fyBfqhRkZOGujttqthvt2qMFRRW9oo7+m78mO3h2PZ
	NTdG9IJwQKOOxeIvBZ8JNFK2gApGFDUxMhHdEUlvB1BfNWDi5hYVDXw4aRfXmhKa
	Q5YvXI/NqRQKKIa0v9lwrN36tTO8XJErh7QXXy2Qmeh5zwOzmYqcLsBYMouvSSAX
	HkWFgC+KHSBvMBuT8nHOoExgu+yoBBpHuNQSJ/5EtfEUTE/2Z28T6U1K0HGt5BKT
	pQGgXloULVrplStoGifze1c2w7BH2PMVHcvRg5eEv/QuEUMAcU5ml5jgr7r/KOnE
	iZ9oc9yyZF6R940Tq7jaxg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2bgm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 21:36:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506Kxgwi022708
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 21:36:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue7rup4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 21:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXeQbmTvqeGin7JHJW14ZSV4x9QqGlr2HBdFmraEzU2UYiiMb5jJYBvZ5pZS62leXi9/TgyrW2ut/2l/FjFO6PJBlHtL30FX8m0/yQnoHV47yIETkK34qKx3/mpGz2WTvVdnMhKG2y+CNKM1hUkyNIwOqGGlATImj+WZwkCWrQPDe8dnoQ4bIcSxyDqXeVwuioCCmNnxSayiM2kywZ4uvfyI2ObgJTJKJVreBQXVMiOx4qidirAKi36fOdTTNXup8DyfKbP4WHnyGY+7txZc8sX4M6qSs7V2uXZQBlclB2q5lfiTLQNqpeUhEcZJg9RJM7iLVcB4htVAbPbzGIldBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/70vBVbP52Uq/waRWhZ0P7fzRXB7aUPLKzeZVbLkMY=;
 b=jCdOKTHcgwUGZVwNaTgDTOZWITpiyiEeb2LwmWanI7vAVLKOx5wkeIv9VZqjFx1gh1reP/HtEnNCqkbhPUxb3+mQl4wT/YPEsGey+SHqgbuqJpYGaRtxIzlDIbkDQMKNADtyAm+9zacat5UiH438iqNtQ9CDYBRDfMtiGcZakJY8VsxJC4trQzxg53hb/nVuX5whqwoHu6HmZhV9MEx74TctMkGXnLINQSY/lrVRsyo8e9TEL7CSJwTBq4RYSZYGyW7NKQoaZE+2JiDTuw/yqA5L2QRf/VEjlnjcs6JZd6ycmLD90mxeZ3hguMZlXMvYILhlj4ut+5RG2uvgyCgPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/70vBVbP52Uq/waRWhZ0P7fzRXB7aUPLKzeZVbLkMY=;
 b=Y0YrK5Ivi6t2F9SaiwMiYKYsocYHdVqXKN53pUqhSviECqpDRUtSJKJtLZS4rziS63U9oHSU6P52hLH768uc7qdZHXodFzO60qNQF8Iw6eTMWvr16QdT+WyZ7Q8c5lY9wpQ6SMRy8a4x1p+Izgkd7oqen/9agMX2EkBYIIB11rQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6217.namprd10.prod.outlook.com (2603:10b6:208:3a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Mon, 6 Jan
 2025 21:36:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 21:36:15 +0000
Message-ID: <4f101016-33db-2dc7-5f2b-9ed262298b70@oracle.com>
Date: Mon, 6 Jan 2025 16:36:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Have USDT "deferred" tests wait for dtrace to start
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241210230202.16603-1-eugene.loh@oracle.com>
 <Z3xHnOxgTYpJTosG@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z3xHnOxgTYpJTosG@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0542.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 103eaca4-60f2-4cd7-347d-08dd2e9a25b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXAva1Q4YmhCZ2lJODVEc2VDYVlZSVNBMDZEQVBvOFp2QjhtNitBeHY1TjZt?=
 =?utf-8?B?MmRRcXd3anhyVzY5dzZ2NUxUdkVjTmY2dVBlUFFCSkYyU3FJa3B3bXRYMkx6?=
 =?utf-8?B?SGs5cWFYL05sVkRWa3BaaEw5eHA2Wkt3S21ZOW9hWGhBeTQvd3hTYkZwR1Zi?=
 =?utf-8?B?RmtHYlVuaTh5QnJYRENFSFViUW12eStTWEdJVkNSZ21tajh3Mm5SVzFDanBD?=
 =?utf-8?B?OHdVRDkwVEphZmR5dHVqekd3SVFEd0RoWDc3T1BTL1dDQm1LOC9XTi9lRFB1?=
 =?utf-8?B?bWZMVTRQYlR0YTVUSmlrN1pxRVBobHIwRFQxVkc5WW52enZwR0FmTU93ZC9T?=
 =?utf-8?B?NUo0MU9jMzhPenlYalNCRlAyOXdiMFZoNjFqa1BWWkNHTjRzU1NYSkNyZVJw?=
 =?utf-8?B?S0FNM0RFVFZRZDc3TmNJZng5ckx0RW9LRTNhaVN5ZFBHeXRSdkNGanp5NFFU?=
 =?utf-8?B?T1p3UGRtOUk3NVRiRi9UVmxROUNuRzQxWUtNVUhuN2xDT0lGWnd1eHFqL1pw?=
 =?utf-8?B?bEI2aG4wOXNjUjByWW9Ka0lhU0Y0cWpOVHF1R0JrbW5qOG45REJhc0sybGUr?=
 =?utf-8?B?cExXQXlPNDJGSStiVGQ4Z1lmTzVyRG56MUVhYzh4eVFqbUpoSUlzcWlVYUpn?=
 =?utf-8?B?UXVhUlR5M3kvMHpyMFVnZjk0b0VqM1F5ZU1LRjN6Q0JlTTA4UzIyZXBQTmFh?=
 =?utf-8?B?VlgvUUxPVjRZeWM4SUNYQTJoQ2JQN3c5VlVIdjhpb0pBSUNCQXBYQXlkV21x?=
 =?utf-8?B?SzFBOGdCNE9EVDFCVjBlS01BcmlsWGw5ZEYwMCtTRXU1SVpFZys3bzBaMHV4?=
 =?utf-8?B?dnZ2alFrY21aSXl1d2NuQWlqWGNRelY4WklpeG9CQVYzT3EwSll4MFNhODcr?=
 =?utf-8?B?ZDlOZ3dyd1VkMENXaUtvMjl5MlFNTzZnUVdIaWZOcThaL0hlU25YaTh0dkVX?=
 =?utf-8?B?SHlLUi9MOExScEFiWm9UQXozdDhPZ0dFMUIwVm44YVMzTVp1blFSZ0xVMnp6?=
 =?utf-8?B?MDZBdHROY21hK25WbXFCNmxvT2kwVzBNc25vM2wrZThxaEFuV0Z0UWg4ZE1s?=
 =?utf-8?B?R1loL2pURFhjM0tvd1M4dU9DR1NXWklyVXVYd2NNK2FyNmgxVHZab1cvWG1h?=
 =?utf-8?B?NUNMcXJEYW9IdnE2blI2Q1k1bTkxWGpmY1RwVHNyZ3NXWDBvOFBkUzV6blNX?=
 =?utf-8?B?TlNGQ0Zqa2RkSVNDNTVQZCs1K2R5RXZaYU9FTmgxbXJjT1kwRzI4bndaTXl0?=
 =?utf-8?B?OWc5RHFrMFgwWkdPdlFHYTRMS0hBcFRGSmRHZEJMZ2hTa0QxTWRCRHR3cXVQ?=
 =?utf-8?B?b0RzUGQxQkdvU0ZlQmY2QldPV2hMTDNjNklISTBLdy8vMXA4RmZudE03eUI3?=
 =?utf-8?B?Nm51bEhCN1hEUTdLR1FzL2JTbXJDMEtCTVk4ekswQ1c1dWszTTl4MHE1Tis4?=
 =?utf-8?B?blhFOWlURzNyTCtuMzRjdWQ4NDh5ZVpvSlJwbTNObytPTWkzVmtuNUtOTUtm?=
 =?utf-8?B?WktCZS9NUjRuUXZoVVdxNVNtNEErbDBCY2NrS2Q3elh0L1ZEenZjZ0hGc0k2?=
 =?utf-8?B?d09ySTVDZHV5NWE3cDhyeGdnN3hJK1BOTWpNTHVjNHoyWTU3WTRSYURTV3Q4?=
 =?utf-8?B?MGVzbWVFNmRPOWh3c0ZORjdiNjY4dUEyWDQ2U3ZYTWdYaVV0UkMvT3Fpd2lZ?=
 =?utf-8?B?L25DS2pkVmRsd29meTlCamNQK0RBU0ROMWZpTUlaS1U1QkpWUjJ2emNQR0tZ?=
 =?utf-8?B?S21ZeHplUlpwcllLWnFVN1RsSEdoMUtDRjdkZlRONUlGd2pMTE1SK2hiRDQx?=
 =?utf-8?B?WEFrdzZ6TTNJVkROeHFCKzI5NGErb053V0h3ZkxzYzlQeEYwdSs1M1FmTlIr?=
 =?utf-8?Q?OCY3cEOoEuew+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUdyREVOZVFCdmlnWVB0eVpOV0VGcEs3K2hOcGFjOXAxcjRuUkhqajJESDlu?=
 =?utf-8?B?cjRZRFQ3bEREbzJhbXp2dm81NDBnOC9MNnJHYXVQdzBzdDJGU1puV1U0Z0J0?=
 =?utf-8?B?Y0dGbkNITmgxcG50RHhOb3pWbmZvS2swSFNYbmdEaDJhTFFXY2V0NTJwNERU?=
 =?utf-8?B?OTlDK3ZkMjlIVWxBUGRnbG1aR0dJa2NpOEFnbDVLc1RhUzU1VGJPeDBnd1Jr?=
 =?utf-8?B?c2JhcXhob0J6QXExNEVWWWliZ2tEQzhEcEVFOEFTY01VRHBnUkt3L0hNMXdS?=
 =?utf-8?B?a0w5eU5Pd2lYNkdPemMyd3g0RmRVYWhpSGlKZUVGeTU1VFdSZXlnc0JYMllp?=
 =?utf-8?B?U3J1VGlNMFdValAzQ1JaM2N1ZkFrQXE1UVlhN3U1L1BOTDJrNWNTRFlpejhx?=
 =?utf-8?B?bkxxT3pKQ0UxeVhtMEV3dEJwdDhQdkJTT3dhUUl2bGFpbmozeE12QXRSN0hi?=
 =?utf-8?B?UzB2OHl1YzdieW1MKzN6NkVhTXA5Kzc5WkNDd1NSb0d5Y2ZEZitPRFg5Z1Zt?=
 =?utf-8?B?L3M0bGZhdThrSmdIRnhia0pRdjFySzBCbi9lSzAzY0FhZXkxTTlPK29lQVZ6?=
 =?utf-8?B?ZjBselVLaWs3cFdKTmRmTDhQd1BWbVg5dU9IYzJ6ME9tWjhQbzU5dkpLNVhJ?=
 =?utf-8?B?UEFxUGs5bnFYY21veGxiN2RSYXhJQVlEd01sUG1ZUXQwRVA2Z0ZQdnA2UlJ1?=
 =?utf-8?B?dm9qeXhRRVpncXVUWHYrM2RabmQzRVNUcGZocFVsK0drbHM3Qzl1a1BRREJW?=
 =?utf-8?B?U3NOMjhTbGtkMXJHVUZkL3V2ODBZUG1TUytwaGNMSTRBTkZiV2NtYzVBcU5Y?=
 =?utf-8?B?TVhORHBBbFZtZ3NBR0VaQXl4SDlSZXhrbTlGREpxSk5oT21KbnZjcDVjbit1?=
 =?utf-8?B?U1BibjRrbjNWUERidmNpWDdzY0xPUTRUZEdGQ05CeU5lcXRGZEpXNE8venF1?=
 =?utf-8?B?bEFsRzZUeTFSdnhVeWhydGh3bmRSR0J0TG9HYXVzbVJFMEFkbTJna0IzU28z?=
 =?utf-8?B?MkI5VWNvMlRtT3FocC9WZ0VMQTBqQVV5Z2RTV1pBS3lVazd4Q0FmUWxBb0RU?=
 =?utf-8?B?ZGlYSGxtaTV5RmZuY3ZPZXF2ekduN0FsQ05va2dSNEcxUXhEaExhemlySEVk?=
 =?utf-8?B?enozcFE0Y2NwMUFCTVY3K0JDS1RKSjRNK2JhV3M0RWdXOWVubE5ibklwb1Vr?=
 =?utf-8?B?dXNqL25IR013MmxtaXVXUGQvTHY4SDBjTzZHTUc5bThWSjdCZisxRmRLbW8w?=
 =?utf-8?B?SEthK3BPT2lnYnJvRlhjSFRVSlljTTFLdEpIUE9ySlpxNWJTRldzY1BrRm82?=
 =?utf-8?B?OElvMFp0ZkxCTVFLejVWa0IvcVUyWGx6cmd6ZjB2Z3Q5djFDK3oveCtLUTlq?=
 =?utf-8?B?dE5rbDhWSEV3cThyeVJQSFBJN3YwN1hHVnlmU2Z2UnRKSnUyckVaN0c0Vm84?=
 =?utf-8?B?TWdPSTlpSFhyeDgrdlZMcjZvUnQrOWVjTG94LzZyV1JtZ0h1d3pzMVJZSlZx?=
 =?utf-8?B?bHVIbUxjYm4rRVVFczhFakdLbVcyYjhGaXJGRjVhVmE5eVJMMmZ5S1JuZUdh?=
 =?utf-8?B?c3dMWHJzZ3BQY0hIaUxkUmpJU3ppVnpYTkFqZWNsZXNIdFZxVTF1cU8rQkZ3?=
 =?utf-8?B?bEovMG1ScVlmTXg4NjY5OUVTVlpOc05nOGdwTzN1V2Y1RTRJMkJHYTRFWXhY?=
 =?utf-8?B?U1hpWnoxM2N6U3VVa202Ujd6WDRqN3ZzWCtxQUhHcmw2UE9EUitQSjRnMDZo?=
 =?utf-8?B?bGx3ZU9CT3FBVVFZbDJ6ejdBTUc1UlB3cUs5Z3RPaDJYVEIrYXQxTzM4NHZn?=
 =?utf-8?B?N0FZckptRjZyNlZEVG0vZEY4S21DZFJGa1B3NE5KUkVEVG5hQUVHUU8wUHpo?=
 =?utf-8?B?akd4MVBCSmhTTmg2OGh5NU5uZVQ5Z0ttYTB2a3hPa0daUGlrZ3QvNVpzWmNq?=
 =?utf-8?B?c1lTMStQUHRrZjNTVnB1RUdUVzVHVTcvQzB0MFRNeVZRUGc0Lzh1SkNzMStM?=
 =?utf-8?B?NTJ3aHJoMGpXdmllYWtiS0tocWhPL0cwQzhubEdIajJOQnNOY3F3cGJXd2tS?=
 =?utf-8?B?VE9MUGMxbTYvWURmaVJrOFM2d2FiWUs4bWFKUS9sQkRtOWV0NU5XNy9GMzFu?=
 =?utf-8?Q?3InSGs6b+ffSRkj38NqDLxeUa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k5tQfojgFU9IJM6S5uT//urJ80NHLk6SEM0IivGA9Z7vhdzx9/kSifP2qPyjnDX4bvfjxiMp7SieAkJlEJgcwv10JTw9KKkbzv3ewHXBqxh0vZipjU1gCWEscJWuwIbuwhuU32oKJR4fEfIHm4m0SsOceFLenRCZfjHaq33ZpFF6dYZ8ioZdiHQJQ1tkQurtXb16LqF1JZHyCSZzFHBtsk4nsqIBrQJkUukiuYSZFy9SJf+e7HR80+f5rxJiyisbD9iTdWba579eqiqctRhTjei6CFTmVVrqxn/jg4oEqbE6nB53+L3my2zVUTE8RU70EIbLtZju35lb/t9HGzReOSs53hkfhpdxMj7wSdKaxl2FngVBDFsVBPYAzldWOGRep6ihhj8tigPPrvvUmlaPMBU0JBzBDAORDenu4MGR6SjLTJusxywRdUE4jz+P/BfyEvS2L4n5pUxqmlD2gWcNZvFQGJ7eYccaU6sMBRbmcbQ+GNPTmb3f+C8ux/MqQ8DKtBBDBR6Oj7BYuWHu3kJlKt+RLGnb9NQ6YsZM9MpCsQ933goDxy+FrMYY31aOXCxFygfQf+bcmOomnCILslbLS/54j7s9IuvlAEVqDcfk+18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103eaca4-60f2-4cd7-347d-08dd2e9a25b1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 21:36:15.1747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vW+rrhmkVpNe8XzLV22zyYIekaQCSoMdPkuvZmODJqgSgSjt5KCmnEuGh94EVNz5zAp74963alkky7mH5m8c2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060188
X-Proofpoint-ORIG-GUID: WQQmyyOqeF1MuuQ7qdyDMPbF7K9iOGm6
X-Proofpoint-GUID: WQQmyyOqeF1MuuQ7qdyDMPbF7K9iOGm6

On 1/6/25 16:14, Kris Van Hees wrote:

> On Tue, Dec 10, 2024 at 06:02:02PM -0500, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Systemwide USDT tracing includes having dtrace track USDT processes
>> that start after it does.  Associated tests start dtrace first, wait
>> a few seconds, and then start processes to be traced.
>>
>> Waiting "a few seconds" can be insufficient, especially on slower
>> systems or as more work is being performed during dtrace startup.
>>
>> Change tests to wait for dtrace to start by polling on the output file.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> ... though hopefully in the very near future we will not need this anymore,
> so we should revisit this once we have better (more timely) detection of USDT
> probes.  Otherwise these tests might result in hiding issues with the timely
> detection of the probes.

Yes, but such stricter tests already exist.  It's just that they xfail 
for now, given our current level of support.

> But for now, this is needed to ensure we have proper functional testing.
>
>> ---
>>   test/unittest/usdt/err.Z_no-w.sh      | 17 ++++++++++++++---
>>   test/unittest/usdt/tst.defer-Z.sh     | 17 ++++++++++++++---
>>   test/unittest/usdt/tst.defer.sh       | 17 ++++++++++++++---
>>   test/unittest/usdt/tst.nusdtprobes.sh | 16 +++++++++++++---
>>   4 files changed, 55 insertions(+), 12 deletions(-)
>>
>> diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
>> index 3833b4400..4f129341d 100755
>> --- a/test/unittest/usdt/err.Z_no-w.sh
>> +++ b/test/unittest/usdt/err.Z_no-w.sh
>> @@ -34,9 +34,20 @@ testprov*:::foo
>>   	raise(SIGUSR1);
>>   }' &
>>   dtpid=$!
>> -sleep 4
>> -if [[ ! -d /proc/$dtpid ]]; then
>> -	echo ERROR dtrace died prematurely
>> +
>> +# Wait up to half of the timeout period for dtrace to start up.
>> +
>> +iter=$((timeout / 2))
>> +while [ $iter -gt 0 ]; do
>> +	sleep 1
>> +	if [ -e dtrace.out ]; then
>> +		break
>> +	fi
>> +	iter=$((iter - 1))
>> +done
>> +if [[ $iter -eq 0 ]]; then
>> +	echo ERROR starting DTrace job
>> +	cat dtrace.out
>>   	exit 1
>>   fi
>>   
>> diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
>> index 52e92eb6b..ff2c5cbf1 100755
>> --- a/test/unittest/usdt/tst.defer-Z.sh
>> +++ b/test/unittest/usdt/tst.defer-Z.sh
>> @@ -45,9 +45,20 @@ testprov*4:::bar
>>   	@[pid, 3] = sum(pid % 100);
>>   }' &
>>   dtpid=$!
>> -sleep 2
>> -if [[ ! -d /proc/$dtpid ]]; then
>> -	echo ERROR dtrace died
>> +
>> +# Wait up to half of the timeout period for dtrace to start up.
>> +
>> +iter=$((timeout / 2))
>> +while [ $iter -gt 0 ]; do
>> +	sleep 1
>> +	if [ -e dtrace.out ]; then
>> +		break
>> +	fi
>> +	iter=$((iter - 1))
>> +done
>> +if [[ $iter -eq 0 ]]; then
>> +	echo ERROR starting DTrace job
>> +	cat dtrace.out
>>   	exit 1
>>   fi
>>   
>> diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
>> index 02ed1a767..073af12d5 100755
>> --- a/test/unittest/usdt/tst.defer.sh
>> +++ b/test/unittest/usdt/tst.defer.sh
>> @@ -51,9 +51,20 @@ testprov*'$lastdigit':::bar
>>   	@[pid, 3] = sum(pid % 100);
>>   }' &
>>   dtpid=$!
>> -sleep 2
>> -if [[ ! -d /proc/$dtpid ]]; then
>> -	echo ERROR dtrace died
>> +
>> +# Wait up to half of the timeout period for dtrace to start up.
>> +
>> +iter=$((timeout / 2))
>> +while [ $iter -gt 0 ]; do
>> +	sleep 1
>> +	if [ -e dtrace.out ]; then
>> +		break
>> +	fi
>> +	iter=$((iter - 1))
>> +done
>> +if [[ $iter -eq 0 ]]; then
>> +	echo ERROR starting DTrace job
>> +	cat dtrace.out
>>   	kill -USR1 ${pids[0]}
>>   	wait       ${pids[0]}
>>   	exit 1
>> diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
>> index d2d80fe8d..f275f921f 100755
>> --- a/test/unittest/usdt/tst.nusdtprobes.sh
>> +++ b/test/unittest/usdt/tst.nusdtprobes.sh
>> @@ -105,9 +105,19 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
>>   		@[probeprov, probemod, probefunc, probename] = count();
>>   	}' &
>>   	dtpid=$!
>> -	sleep 2
>> -	if [[ ! -d /proc/$dtpid ]]; then
>> -		echo ERROR dtrace died
>> +
>> +	# Wait a little for dtrace to start up.
>> +
>> +	iter=$((timeout / 4))
>> +	while [ $iter -gt 0 ]; do
>> +		sleep 1
>> +		if [ -e dtrace.out ]; then
>> +			break
>> +		fi
>> +		iter=$((iter - 1))
>> +	done
>> +	if [[ $iter -eq 0 ]]; then
>> +		echo ERROR starting DTrace job
>>   		cat dtrace.out
>>   		exit 1
>>   	fi
>> -- 
>> 2.43.5
>>
