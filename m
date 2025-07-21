Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2947228469C
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117885; cv=fail; b=Qp+SP2W6xYR8gsTU/za3XI3pvkjMIHTUgK1d79gYNfzf5JzD/NjmwOaxzzR6sbAzjyNClcRsRzaZd4MlvI5z1/v/BS2bsYD/w/Cs9ywpgLKUnNilSjVWP0YkcHnimdmLMGU1THUCgbjeV2q6rqJfJ/mtVjkbLpPIqsnzERUHZ6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117885; c=relaxed/simple;
	bh=7wIe2MtI3hn2mNZozBthxzmQXLSEuEMIkdIFRS5M3l4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FJPrfZ7DhH/FrLBCnbKyW47NNt/zGo+alQPSTi+NxEwhS5+PMD2thDNzeeS+pXFXMSNW65gzWDlQ7h09Djus0+uhWesgrZjO0he5nVTdM1qa/MXo9yiC8elleG4jpuMHO2yL5NKu/HUtcZBn0N17zCwyVXfuX11ljSJrvpOEqYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W4r7Lox+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gNREEWGZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W4r7Lox+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gNREEWGZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFQeJH006883
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LoJR8noxAjoOekvkvCPin4GFGrb8dTk+6k3syUdLmZ0=; b=
	W4r7Lox+ll/RPpyJCoICo2VcB+i6ejOYwaRPqe4z6/buZZdHwljZxc5fW6inLQc/
	hYp1ZQbA7KWUq+ZPQKVCJnr5hzpyXVqGXWrX6+vedPAhPHMyQZuEAWdQD76AY35p
	nspEjYbPy1eZIrGKQlWmhyCpJXWhOgT28W6Xyut3R9WMr64Vl3qdSt4RzLVhEsrN
	4KR2k5UDNgnmYdxvIKQBVZfLj43iMDk3oeCtQm6nSgDI+vYjzDLwb74O7gSz9euT
	OYEMrQHcu07T+9i3EVmkgJqWHiUeXcVmcIsLJJCQi6c6t8eWFjlYdeQtS+Ru5qvl
	cNlsezvLhiX46RMWkj7YMw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qub0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:11:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFdLSb038366
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:11:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8ag3n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1EAaNLCcS15qtjwLGaLO+9ZPzMbAAPya6P6AAa//+FQgJFvnaV5HNojEHlzds2hYhuWzYJqdCblguMQNpt5EyQJOyXH+BLGeP+G7jwQYnVUPWnej1SGjC+OA7PJgLBfNyvU1Mf3erljwnQ+zNCJzYBvlvkf8lUYdkT7vPRkOcNHEv6lZzgIb4AEOcJugaSM0XCJRrKNMPaP8Kk8TJU11yAN/XPVIhWWsIiVkxkKTWxTn8iRBDl6YmqTsOsOeSgNP7it/7PJZ6xXW3hCH7H+csb8pK4eaT5sK2WSRprWVsVIpZRDSMIMDF7cfUJLNw+uRJB6isOQntpnqLW19Lf+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoJR8noxAjoOekvkvCPin4GFGrb8dTk+6k3syUdLmZ0=;
 b=YaN6DA3mHSq8FlAeIk/g6pK6JPIYc6cPzGw1OzLaKB0Yd/66HTUdvsBJHlUWAGrZ2H5qncZ/fLHi0X8wgQfGkiXR1kkDLJU2OKaoj2uJs2e1BK2+eVjny4P6xJsCu5g697x478No7Rd+EzKisg0eVD2tqczGk1o4SJr/Yz11A9bkmXxffd5E6gX5clT/aVIg2DOmGmc6GcvbFLh28gRYRMZQpPJyOzU5lcXsNvmMnwnMvdJUsnnmmJWcO3q2bpOOHUJZX6d19yr56u+lrHhutEt90WPaeoHYXmjJ/pDptARkx8F1h7HqQrtpJlFSX4IbVJXF2BaIQVFiwx7ogWd6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoJR8noxAjoOekvkvCPin4GFGrb8dTk+6k3syUdLmZ0=;
 b=gNREEWGZSSP2ovYLGxc9Sk/cSROHxA2llFWVkJI/ia74shAycA/PlDBqG6nKKrM09iblKAx3H/2QmpRz8Tt9gY2f5HB14Zhe3/v9TxNDxaBhwEgVoaKMOXI0Bh2TftY33G05gP+ANUlhu450YG2X2cUTBqDusxSlNvlDTFvmOGc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6401.namprd10.prod.outlook.com (2603:10b6:510:1ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 17:11:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 17:11:18 +0000
Message-ID: <e0268860-7c59-7d24-9d98-c1525793a8dc@oracle.com>
Date: Mon, 21 Jul 2025 13:11:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] test: sdt:task::task_rename takes only 4 args on
 newer kernels
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567227B9AEF147FEDE3E6D84C25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567227B9AEF147FEDE3E6D84C25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8268c932-2c78-4b9a-f3fd-08ddc8799bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXBqcnl1TENPY21Qbk4xdlFHcWZ4T25TUWdQY25YRi8xVFlRaEczdGY2Rm9m?=
 =?utf-8?B?cUt5VVU4MjVpT2Y1OXpMNzhLUk1rcEM4QmZKazB6KzRaYlNNUUo1Y2V3WjJT?=
 =?utf-8?B?RGhpNktBS0c5N1BGeVAwUWl6aEtoRi8ra1JuVGpCbG91R0dHYW9ISVNCNUxC?=
 =?utf-8?B?b2NBWmRCNUNmYlBZNnZyRkhvajFYK0hYZnZMcEJTR1E3NWhVK1NNdit5WDRV?=
 =?utf-8?B?aXVmL2wwbEtsM0xINEZzMCtpQ2hsdllHTTJuV2huSmovNUEwdnlQczNXcjRT?=
 =?utf-8?B?YVZ3bDVaWGh1a2oxUU1KeWtNc3BZT3FZTkYrVEszOVVRMEtGUmk0NFRjU0Mx?=
 =?utf-8?B?UGtOcCt1bEpyL1o5elRUd0hWMEF5eTRXUXg5Yi9VbVpNRnJGbEJ5OXNHVW04?=
 =?utf-8?B?Yi8rdjJIeCtyMkpzUDBZbWxyRDBEY1NRb1JNRmNQMHdkN3ZOenhQUXBTb2NW?=
 =?utf-8?B?NUViVXQ5dTZKeDhxdXdDUEhtZGhLdFNzS3ZMK3U0Y29Ndys0UlQ1WEM0ZTNl?=
 =?utf-8?B?UmU0WThwVmUyVm9JaXU0VzJEMnVKcU5EQnlmRndnOCthVmVnL2VVMDcxMjVj?=
 =?utf-8?B?bm5wR0xqWDNQQWFHYmY5c2dlUXYzSU9GNWlUT2E4TlNkWThNVnZSeG51TUdC?=
 =?utf-8?B?b3VJTjFzSEcvSzZFRng1dy84cFJXcm5WTlF4ZjRSUm42SS9XRTRjR1BSTUJ0?=
 =?utf-8?B?Z1dlb1RGaURyY3owUUhRWVFaaUpYYVJib2tmeitlZHA2bG1zdGhUbzlPbkRM?=
 =?utf-8?B?Tkhxdmp4NFdjUDRJemdNaFVEZ0tWRUg1NzdsblBTdkM2em1qN2F2KzZiNzlM?=
 =?utf-8?B?VUhiWFJkYTl0elZ0U1hLRWliU2pRVDZPVHJ1Y0R1YjUxbjRVdFJSdGpLd1kr?=
 =?utf-8?B?U28vT1o0cW11alIyYWVMV0JyRGh2TEhMcm82OHg1L0dJR1BCbkNaTFBJd05X?=
 =?utf-8?B?UGIrRENwMzd4dEdzSjloL2VJU0lGQmN6R2NXa3JCZFBKdVhhQXIvbWRlOE9t?=
 =?utf-8?B?OUVEVVpWRUdabllGZWV5ZkExaHFXVFhDSHEvam9Fd1ZQNXY2RXJmN1cvdlFN?=
 =?utf-8?B?KzQvdjhCS1RoUDRTSEhpak9Hb3NOSnlOMGtTQUtTbDZXNXJBSVlaOGVvVTUx?=
 =?utf-8?B?S1dwYk1ESnRvakxqWlpDb21BMnR4SnpsbXloRWZrelZJOW55d0wxWlM5bkk2?=
 =?utf-8?B?THVwV2V6MkNzb0k0cTFETjNhK0hoMjhzLzhrRWdGWVg1NXg5d1VFTnFPSHNm?=
 =?utf-8?B?L01MM1VuZm5WUVNBWTZBMjhPZzdNbGJvZ2hxVGtXSTBpRUxHK1YvTkQrRlFR?=
 =?utf-8?B?dWloWGIzeVcwYmFjYlllSWNtdElwcEVrdmgvQnhxckxsTU1rOVBnZWcrdUti?=
 =?utf-8?B?ZHNBYjZ1WkF6M0luNUV5Yi95bTdRUHJZY3VoRnFMTFdBbDhKVDJLM3JIei9D?=
 =?utf-8?B?bGU2K3FlVTVoQ0NOcm5jSUtVYzBCNTZqaHZIenVpb0VxZEtMdkV5eTRFdnFJ?=
 =?utf-8?B?a1ZubU4yUlBGeUZtN0pTWGR2b3N3RXErd1BoOEdtanBTTGhsdFE5OW5OZnY3?=
 =?utf-8?B?TC9WVno2ekg5cUdqNGhqdUNtcW56TWdUR2JNWDNSYjROOTNtU1kxYnppc1Iz?=
 =?utf-8?B?OHBRc2pWaGJNWE5zZkdGUnMycERLSy94S0lJVjhyd3AvcEFUUER2aS9kRHlQ?=
 =?utf-8?B?N20yUlF1NUZ5SVhHQWpCdjFFMUpKWTdMUXlPWkc5V2QrMGtONVNLbXhrVFAz?=
 =?utf-8?B?UVJ4Ni91cTdWTyszWW5hZ3Mrb3VUQnVrUkE0K3M0dWp6d2RyNUpPZUljbmp5?=
 =?utf-8?B?Y1g1UVhSVldhMlEvSUcrVlRZc0J3ZWgxZ2FMUkJNOXo2Wmk0cFFKS2RudjhG?=
 =?utf-8?B?U3ZVazVKZlVMWXlEWHVScUk4S3NROUVQWlFvSkRJOGlvdi80cFhlQnI5TlZM?=
 =?utf-8?Q?9jRiWEJbvVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3JZcGhUdGpwWkxrbHh1WW5KYitIQ0lEMDJ1NnRHNkJHYW5WV2RpMXUwZjhS?=
 =?utf-8?B?NDY2Y0xNWDAzOHpvaTA2SllYb1orSTNyUHl0WFYwMmZrRmxMM1Y2S3o3Y2lz?=
 =?utf-8?B?cVVnUmJpbGhmZTJ6eXp3YXRnNi9Kc2VFWGZiWHJSQVVWeW5OQnd2QldhSG5R?=
 =?utf-8?B?MlBMTmgrOFlQTnM3dEdzTHk1MDJHWm1nMlMzRzFVNWwrR294THRXcFBLdCtI?=
 =?utf-8?B?OEw1c2x3S0Fqb2U5V0RBTGlQei9td2tmN2FxdHRQNHVINDM1Qi8xWjBkL055?=
 =?utf-8?B?Mm5tUHNRT0RjQ2xvTGdrYzBPY1BXRHF4VVRFMXFYbUQrZjlpR29CODAwTytR?=
 =?utf-8?B?Qld6NFF4eHl3RTFnd0RUdjZ6M2oyYkl1ZGZRd3JiQ0VyazF5REVnOVRseGRR?=
 =?utf-8?B?K3dudEQ2TjM1TXpPTTg2UVd1Y1dKRXFMOEZ6UkMzWGZNN1pUMmJvMTNmZXNO?=
 =?utf-8?B?VHdSL2dvUW94R3lSellnd0MxL0M2VVRMa21QL0lzazJaaXNuVmpTK0lRUlVB?=
 =?utf-8?B?eTB3SEYrVDA3MExrNHZiRitvbnJqZ2wrcmg3VVF1WTBEMUZ5R2h6RkV6V1RG?=
 =?utf-8?B?SWJVOHNZZnlrajJCUmM0WVRRV3FFK1hlTzZzWmQvVmxKUytlMHBmSFEwNkpZ?=
 =?utf-8?B?SWRlbVJBaE5LTXdVNzJGZ25KS3E3amRTdHprWDNBYXJFQ0hlZHBLTUg4UjFY?=
 =?utf-8?B?dGNpSnZXL0JWWldkbVJFcHJzdkM2d0ZvK2JzTitUUnVmdjNyTXpzZloxWEps?=
 =?utf-8?B?R0pld0ZBeWc2RDNrZ2pxbExWdHNJODZhNUhhMHVXTWc5UHp5bnZhYWcrZUF0?=
 =?utf-8?B?SVRiSGlFTUFvc1l0Snh5dlQyN2lPaEMrRFM3OWJFLzBoa1kxS2E0NHE3NGV0?=
 =?utf-8?B?VjM2dGVPbnRMaUpkNWhseG5NaHNyZmk1emNtRXE5VFkyMDAyN0dqbVFoaFpR?=
 =?utf-8?B?REpMQTZDdThoNXoyczlIRk5ZSkRzVWxJSW80a0p5ekM3SE9lZ2g3Qk9HUWRz?=
 =?utf-8?B?U25mdzRHa3VpL25lTHloM2NPOW9NZkpiOVFOZk5KOEFXdlJKWlpWbURzMk9j?=
 =?utf-8?B?Q1doUEpTdE5qUnZEM2FJQVY2aUJCVTlwWGxqMVplU0tCdjZxM1psZ1MyNlNh?=
 =?utf-8?B?b2tTOWNmaTY5bjJ2dUVSQThFMVZ0TnU2MlBXQVJLQklOOWwrZ2FmaXBxcWhN?=
 =?utf-8?B?a1cySW1vSU1weHQ5ZnBzekgvRVBza1Y1L2c0NjZjbVlBQXJkaHR1UWhIU1lP?=
 =?utf-8?B?QVNaZGNUa1ZNZVZwKzdhQVA1N2JEdWYzbHBSK2phV3dMRlVlMzBXa1ZXcktC?=
 =?utf-8?B?eVRhZGcyUWhkeklMQ0kraDNpaFZnR3hCV3VYVXc1NGwxaEtybC96OHhXWlE1?=
 =?utf-8?B?TXljaUhWS0NLWU0yNHMwY0RtS0dpdEdod01MUDF5aUV6cmlBWDhYVjB1Yy8x?=
 =?utf-8?B?b04wR1QwRnoxbVBkWlRzUWxsTzYxelBzWmxDUTBRNEN6aEk1emg0b2J1Q2Nt?=
 =?utf-8?B?TlVtZC9UOW9JdXRYT3dWOGFMRFQ5eEg5Y0g2MzZXekhMNWwwYWJBQkpyNm03?=
 =?utf-8?B?VGl4cTkyb2ZtU215aVhOeEI5UzNXQ2NQZU1Bejk0cTlBQkRVQlkvSzl5VTdQ?=
 =?utf-8?B?U1k1WVpHQmRkaEJpenZ0RFUydFdkMnNLeDVhV2plMXZleGs2WDJPc0p0L2hO?=
 =?utf-8?B?ZCtiRUF1S3h6bjQ0NzBPdW5RZys2YTBlWEtoaStORjd3RVc2aXlHR3Z6cHhr?=
 =?utf-8?B?U3ZFd1pZKzYyWTlEcnppR1JDcjFQRXR3ZVllV3hYb29IOXdMaEp2NmlXMGxL?=
 =?utf-8?B?TzN2dHhFazRJOG1kSW5QdzFwZ2VRWjRDQkova0dUajlBcnFUVVcrNkVPWENH?=
 =?utf-8?B?NnlvVjd2TEgxeVZNa2dpTUdsNjk4WFFzclBWcUZCUjVLMy94STMyVzJjYlcz?=
 =?utf-8?B?VllkRVk4SEo0ZkFRRzVzNHFJdmhkWmYzTHlQakF6dU92MlM0dWN5NjRuVGVL?=
 =?utf-8?B?RTQ4eE10T3pYdUJZL2RucHJISXNqYVFMcUxpVCtrbmlOaEZNc3hDT2tsTjhE?=
 =?utf-8?B?V252aDdNZExEK1NLcjJRcEw0VFQwUFFwOVBwbWpCMlJ5a1gxclowbzNTWWRq?=
 =?utf-8?Q?y57EenZILrkwm671VQwMfM9mN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWpt7saqp4pMjHbfpWueYPm0azJSYGaAaE8AcBYvdtLoH+gzyoc4e5IaR5J7hHsA3E1J938AqrEEOiom/3oMlOLAry/KL0EHybs8rQbjN2fkEjtCoNhA7QA20mdYS8hWmJvuM1On28IcQUqsGbjCFz6LpGNubYT507CN2ajnI1HN3mRcQT4aqu8WZdVz8TB0hTgaGrWkafsGzYpyvQKpmsRo4zRszV0bdpHH1Kszg0Oir8xd/vJC27enHE8ccBhAtQmAbMmQwmQ/1nIpiI/h163idc86pEYVFlQEqwPlURgnmwVKGQ48giWR3mIb4lb8+EmQLvHFTLIrOj8xGP24sS7rHviUDdhdmCYJG/+bfTbjWkRYU3rRO/uU33hLCgCi+allVGoVX+6jHkstK6d/XMHoZUgJ3Hyfaq7tSHUtN/vTlAADC0YzkHzrXgx/Oy7NgwCDybzwbPy9Ug8efFLDqd+a/oO1fgA9xPm0JFlckZQd2mTTKkQWom/ZBbWP01VdrLw1PBGshdPgtL6GWtyeOGKa6gAgPa06xQFjI8iZ1/0Jf2l7YWeP85PYefsT17PIFOJ6AJ+xNBkAae8ygGtm0F0Vnefj38mwlFKoq7K1A3g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8268c932-2c78-4b9a-f3fd-08ddc8799bbc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 17:11:18.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox+NuKGUzcvcaqNE19jO5ZC51cVP5XTDIXUjIWR3eDzlNjZ3iSC+qWTnos/nH79PXL0pCjJv8BTBgIvd/yaYTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6401
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210152
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=687e74ba b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=YJPXWQYoHlUkz3DkmLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: cmtc_uHvDst5uMzE07exSGY1d_hQ7wQt
X-Proofpoint-GUID: cmtc_uHvDst5uMzE07exSGY1d_hQ7wQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MyBTYWx0ZWRfX6f9zA1Ge5Y3M
 DXKx8Do+tQk3MsHLv+jLGpANb9f5d3IJxEreXN1roAYzmV4tLH1lFloOHANQGEi2QgsyqBmyg11
 SJ+h2/4nBFUtnhEm+uyvfiTfADMfUgJz2FCafE0cgNj2ciHdRH724jzxAQzEANaelIbs11Wa2P3
 SuiSS0NHb+f1H5PB7k9dzbgUCwJlZmCpx5Gim25pJjuixcuPy9/8TYz/grhuXWbLnYMxthtKqWa
 mn8nAE7S2cvqyOy3wv1+DDcixMmooyqTvnrPI9Ek0fnxLkl3BVfG3gJX7zdK8yky6AY9P/paTka
 rWIsjz9yQuSF2wv4gZrpvLQ9i5cTonueP7dKE+5IDEm3WpG26jV5jgUvx8vLdjtPQOgDf+ZN0AW
 u47Z3cLX5eLSQ22P4fB49dk0U3JtxuxkiI0Dm1XuXNA902DNuDKRvZtG8kWYGoB1EmOFpsXT

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
subject to:

1)  Updated copyright year.
2)  Use this patch to fix pre-existing typo in the ASSERTION comment:
         s/should not displayed/should not be displayed/
3)  Remove the "print" in the patch.  (I'm assuming that is not supposed 
to be in the patch.  Leftover debugging?)

On 7/21/25 09:35, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/disasm/tst.vartab-bvar.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
> index ce489a24..1ce29611 100755
> --- a/test/unittest/disasm/tst.vartab-bvar.sh
> +++ b/test/unittest/disasm/tst.vartab-bvar.sh
> @@ -32,7 +32,6 @@ sdt:task::task_rename
>   	trace(args[0]);
>   	trace(args[1]);
>   	trace(args[2]);
> -	trace(args[3]);
>   	trace(caller);
>   	trace(curcpu);
>   	trace(curthread);
> @@ -60,6 +59,7 @@ sdt:task::task_rename
>   	exit(0);
>   }
>   ' 2>&1 | gawk '
> +{ print; }
>   BEGIN {
>   	rc = 1;
>   }
