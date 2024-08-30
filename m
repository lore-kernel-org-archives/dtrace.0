Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35071EEB7
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724995730; cv=fail; b=B+ZKsXGsx+3Z3Uy7a0r1FNlR97oUuKsqL7E79eQdZKnui8JfwEDtKNSHItBbc2Omb12UTZXmwinjtp51KnqOdMJ7ayfZ0Xd0RuxibEv46tH6UV8sC3Uue0Xa3bHdVQxJyGjTXHov/3NCJNRRQq6YJkq6hshsnEUlC0EcFdHQRLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724995730; c=relaxed/simple;
	bh=y9U6lw9qJvKXvq22pl0RfhwNbTnQ5aDpdXV2wv2Os98=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KlvP83k7u8JRejiP9O8YrCjndtHQ6F84lgLG7vpo7gliNs363gMGrziQvPtwXfY5KQOYRS42onnF99fMUCBTtDtyNi2FqtVwKZ+JhZASENjn5IpZm47rIM6/WnHuiv2H5GdA0FA4uNPZ0IskwX5Wb2DCPhkwS+AyQZDgYRM0k+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=immqUSi+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kyyESpFK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="immqUSi+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kyyESpFK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U2g3MQ001200
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=QodLbt8hOzyHZnhbbsh+0Wsxt20lJEh2DDuLZtCT6hE=; b=
	immqUSi+BfIaClE64Jcn6ozlSz+ZvE7f3HY09+jsgR4x9XgG78sPllgRvZOIaZn1
	Y3DKmTxnk+J3Zng5YZ9wfJWfpoQqHRNr0DxNtO7pbaxALqXr0x9mwnWwSgkAq1bU
	kiMLIz+NsqePHXFgE0Wqz7CNhSdvJRLZWUI3UTqz4FuXRuUlrpAVUJ4yzCte/y0P
	4PDSCb4eB6xi/gQVAu10qz048YPiXMSqPQ9+nE4gH6rHCgBAPYXqYUepqfw091vR
	EJJskVRlDSoERltNsmmBLqXPOyDW3g72qDqqur3wHnKpeKTkY9D+mhgqxOOx3jvk
	g0mjP9q2k/ouEeLnzZxbKw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41ax0grv2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:28:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U36mlF010223
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:28:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894rm77c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 05:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVZWCzW+pMF4Dr6RhJzpE2zIbm2q4ZrXoSZeHaM1T0OfTm94bkEdFZP+Pz+kWEVEbYNFI9Ff5u+ZeakYhHwLhPRvQZB9mavHl4iL4P7kisROyzePs/elI05cMiVWdutGES9SVCWwnPTEBPiBQ0pBrj7tFrhC9T2aWq55o3s+ZOrTUmpSAExORfXsdi+8TZV85GrpxoDEAFSg3HRPfEOzX/pyHIsDaWQnY3m9tZ3qvI17RqRynNne538di58KGR1aIxcXYgGaPbeAwTXtTfGgcoUdjqsUP9C6Q52TdhA9AjCJZ/xdpTqF8h6OeDgaPEWhDUS5Irfj+bU/2NhUJbTewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QodLbt8hOzyHZnhbbsh+0Wsxt20lJEh2DDuLZtCT6hE=;
 b=KJyZYD3NM4mykTZwwOECRuPL+Ov251SxOuAYnx4jQHec7KsTMDhDO2AS/UJjuLMFtiun5h4uws27JESHW43eNykuTWKjfkbAZwZKtf9AopQog7oRWu/XsUQaYr5v1PisI66coU8WzZUoEvyRU0kNi7ywMrvVlVBosojRHM96Vd08OeXkMKHZBYEc9vLWcYTYn0mrD2XaLGqb9e+o1K0WcjLHyU7rpl5yM5HF1kkfk7lITbEEMBOwoC8VC5IilBZ3LG9xJ/NsCf7Y/oQH4XQWF2Lfgo2mx7Ky5Vpv3d7wYH1tGVOSwkXpkQBmlISK1bXELazP8Kha9l39qPT908NQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QodLbt8hOzyHZnhbbsh+0Wsxt20lJEh2DDuLZtCT6hE=;
 b=kyyESpFKnHZnPOgwwt2wXvVVz5EsgNvdCHO+In5gGhiB2kjksZ08xaxpUay+bV1AjeCbfIBrjSG817ladvK/keQIEMUeXgdFER9+GpZ+GmcXLSvmKt9y8U70aFaqauYZwL4NX+yJoRBPGd2KRbNGeDE1wtQLj3AZ/XBS2faa7r4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB6984.namprd10.prod.outlook.com (2603:10b6:510:288::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.17; Fri, 30 Aug
 2024 05:28:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 05:28:41 +0000
Message-ID: <90a6753b-12b0-27d1-4895-35a959b4c5a6@oracle.com>
Date: Fri, 30 Aug 2024 01:28:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 01/22] test: Handle dtrace:::ERROR arg3 specially
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829221819.10237-1-eugene.loh@oracle.com>
 <ZtE7hV2L86TaG6M1@oracle.com> <ZtE93QS+vPcbeq7W@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZtE93QS+vPcbeq7W@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN7PR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:408:34::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d62b2e-2183-434f-09d7-08dcc8b49b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2wrN1hqeXhmV0s1K2ZHVUJqTDFRMUtjdjRNQi84K1BQU1dTOHIwVkNSMHh1?=
 =?utf-8?B?aFB0U1NXVmliMW10ZVBJYnRNeDZGcStkT2hhdTBYZWRyc3FIQ1JjRkd6RWR6?=
 =?utf-8?B?TGtlNlJGUkF2YXhiZGhmQWVsOTlOMlFINDBHSVFoMGJISThkckJ6elFMM090?=
 =?utf-8?B?YkQwRXRZQWR0cnRxK1dnS2VXQmswZGs3L09CR09jQ2xPbWZFLzBvSDlNMVhY?=
 =?utf-8?B?SDNEK2ZndkcxNHloZkI3clNSeWR4Q2hrUEdvVmVRWFptczNLOGpwcVZCaGpo?=
 =?utf-8?B?V1Ztdm43OG5jT0JDRHFyaW81NFlmenVCVC9FM2pVMDVJcHhDeXd3dytDRVE1?=
 =?utf-8?B?djk4Wm14QVptck1OZVYzTUJMZm9PRzNZNzdYb0V5L3dzeHpEWG4wY3BYbTFn?=
 =?utf-8?B?R2MvRkJMMXA2S1QwNDJyTFNoZXpTT3B1eFpMZlQ4a28rdUQyT2h0a2c0a2c3?=
 =?utf-8?B?aTZJWnFpV2MxeFJCaENyWlJreTVvTk9CNDRtd0h4bi91Z1RsUmNzWXdSZXE4?=
 =?utf-8?B?OUJoa1hoZWhPNm1jcUdQb2txbmx5b1dia3pLTmZzejlObmR3RWRjOWxlcWpQ?=
 =?utf-8?B?YWdCRXFheFRUbFllS3dSQ0V0Y0xHNk5mbEs3VHhtYUtxUWh4QlNZcUZmdW12?=
 =?utf-8?B?ak9LWnNsYmxOVDVJT0RoN3JuY1NXbm5QWnhLTGN0MWxaTGlKMkZPRi9oemk1?=
 =?utf-8?B?M0p5eG4yUDNMOVI4TDIyZmQ3R0MyQjlEVVJIVW1IUmJUNFM2T2c5c1oyYXl5?=
 =?utf-8?B?N0txTSt1K0UyR0xqRW5RZzVGeDZuVzBhVGZteEJwMktwZ2U0YXRTSEdORjFJ?=
 =?utf-8?B?NUJoRXl5NkVRWCtZQk9Yc2NRZGo5MmVhMnBIWGVtZ2ZSc0JGZDN3V3V5UTdK?=
 =?utf-8?B?RE5pa3NXeXlmVEZkTk84WkF5cDJGRUdXWWJkM29wb1NES1JHQlVTNkloYVpw?=
 =?utf-8?B?NnZNQ2lhbHRLU2lRa2VkNW93bWQ5ZkFRS0dGY2hqSm9ja1lMRWVIRUZZQW9P?=
 =?utf-8?B?aGk0WWo0bGJLSEtBSUdybHdqM1B0MU1jOUppK1dpTlBoOHYyN3hVQTFWckVa?=
 =?utf-8?B?L0lMbGRvOXV0QmwxNkVyWWhWUEV6SEY0KzlmeHZjSjFMdnBRQS8yS1pBdTZX?=
 =?utf-8?B?c1VPRFp1SW0rVnlFRjJOWXN3SDhNb2psZTJncWdJb1NTS1pvRTcxbWcyZGFJ?=
 =?utf-8?B?NVk2MXpmR09DT0dxc2tSZTBNMmxBYzQzWU5lWTZIbGpnZXdPTldTdUttMmFL?=
 =?utf-8?B?a3BnaVM5dVd2V1FqdnBLb2QyVll6VWU1WEZzd2tRVDJWTjYzbmFpdTJHdjdn?=
 =?utf-8?B?WWI5V3lZYjNDaDA1MnZKVytsbkMrREl6amg2UzZ5VFJ5RXVqM3Y1dEZZaElp?=
 =?utf-8?B?ZjF1UmJmVExoK3RSQVZZNC96cHNpcGdLY3dlUzZpb2FLazA1ZS84OVNiZk1V?=
 =?utf-8?B?aUo0N3I4VFhPOUI3NnFYTllpYjJselhwUTd0cHdSbFVObmUwZWRwdGsxZkFD?=
 =?utf-8?B?REhtQ0JUU0NyblZsWWRzVWI5QW80WDBOb25ubVB3ak1HdHJ4SjFMSHVDSURR?=
 =?utf-8?B?Tmsvd1BrRGI4aHNzZkhpYnFyY2oxUGpJU25SZm1PV3RPTW55Ui9sWjVtdXZ5?=
 =?utf-8?B?ekY1WEVKK3pGYWlycGFzRGVsdnF6Znlaa2VXaS85bi90QURvOWdNTHdsVnVL?=
 =?utf-8?B?MVFUTk1kdGRqck9YMXB6UEVzOE1aeDIwN2YrME5TaEhQOS9tRFFmL09CbXgv?=
 =?utf-8?Q?BfIECFiVI2CjhzYxno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnQxWU5XS2ZwT3RBSCtVU0pqTDN1TTI5NmR6dlhaeUxVVjFOQW51U1dWWUF4?=
 =?utf-8?B?VllVZVRFUS9XTVFiWlY4UWFMQXYzekFOR1pza0xOaEYxRnRtWXg3emh0VzF1?=
 =?utf-8?B?ZGFvVHpNRDVoQ1BpWnVyUm9xdjZIbVRsTUpncjc1TytaTm5DK0tsZjdTdVNH?=
 =?utf-8?B?dlY1OFlZczNEaHVFOFd2blI0TkUzb1NSamJsd1pIMVFSdUxhbyt3d09KVlFp?=
 =?utf-8?B?TzA1Uk5vL1dzTitjb3NGL216VnpjR3ZLOTZVb0RjeDVLTXNQRytRZDhxMjkr?=
 =?utf-8?B?OGlrUXJVdDRVeEtRTFNieGpxSU5TVjBzNEpiVTFrS0hBVWZtQVRmMVFzL29l?=
 =?utf-8?B?T1QrZ1ZTdElQNUJmVTBPd0E4bFluRG5xOGJ6eE9uK2lHV1RTQ1pRekErNjFp?=
 =?utf-8?B?b1hiWXlYeWdpVW9zNmNKTmErcEZwV3ByMVFrSStBSUhHTEVxdHp3V0hmZTB0?=
 =?utf-8?B?bHVXOHZXZHI2Z25ndEtTSU1pZkdnUDRZMmhQSmxZV0lod3E3R1c5a0RXdTVZ?=
 =?utf-8?B?YTNzcFNJVy9NSXl1NStjMTV5QlZVckJZRkJhQTJIQVZzeXpEWU9Kd05qdk5Y?=
 =?utf-8?B?RkUwTUxBV0JCdERJN3JnNnZaVnJ5R0dyNjZTQkxGOVFqU3EycWNYY2t0eWw1?=
 =?utf-8?B?d2g5cDZPNHF0QUxVSXArY3p0SFhaSktQU2VpeTJrZ3BkR20xWUpvMFh1QWF1?=
 =?utf-8?B?VWVIQ2JiZDBFa3NRU1JKYjFlZ1lDUTJpZEYzZ3JIb1NiVW93QXkwc3JlTFRx?=
 =?utf-8?B?RjF6WGE4MTlQWG14bGVIK0hmMU9yYVZrY2IxNTc0cWtueTZYMmViQjZTbE1x?=
 =?utf-8?B?bzNNRWQ4U3lzNzdSb0d2Yys4bWdoSFY4aXZxN3ZQeFc4NVBaYnNndTN0S3JO?=
 =?utf-8?B?eHNjbC9ZUXhmQVpHVktiSWQ4VktpaXo5STc1SmQwTy9vL0xiMUN1SzJRQ2xB?=
 =?utf-8?B?aHlmazNoUUZzbXF3N3BPU3gvVkZ6TWpEN1JpVWJNQit0RXdtQ2U4Z1oyRnlY?=
 =?utf-8?B?RXQ0U215VDh6ek81MXhCd2NvRGp4d3Rjakd6VUozMFY0eVBxYmFOZ3ljR01W?=
 =?utf-8?B?VmZtem9sMTBZQUtsZ2VnRlo0R3FCL3dndmNvZ29BRHhNMEx4NEZTTzVFMXN3?=
 =?utf-8?B?ZDlVSG9tMUtNY3FTNVJReDlONFJVdlRLK0w1M3Ryc0Y2QnlhZjEycU5Ga3U4?=
 =?utf-8?B?WXFrZlJVQUNBOC82b1BCV2grWVZQV2RvUVNHdnZha0JtUjVzRGlBMkRyRFUy?=
 =?utf-8?B?d2llTS9TNlVhRnlMdjMyOHA0cXhQdGIrUHpubUwzOGZYN2JVb2w2YlpGSlVI?=
 =?utf-8?B?YUxUdGova1F1QnJMWHJpZjhMSk1tS0NjRDhXUjJxWnVkTFBDSVczcnlxVzQx?=
 =?utf-8?B?WGZSSUN0SW54clJmV082MldTM0lDTTd6L1NVZUdmY25mbnd0dzYzaUthaDds?=
 =?utf-8?B?aUJsZUt0WnZBT2FNNlo4V1h1R3BKQkFZNXFUVVM0dlNteFdqaW1CajA3Uy9X?=
 =?utf-8?B?OC9lZVhSUXNxRWNDUzJrVnNvOS9tMloybVlrSmpEc2hVSWVFa20vdU1rWmh3?=
 =?utf-8?B?K21qeE42L1ZoRVkwaUdFR0hyUXRtOGZROS9FeXNMYk5UZHZLWFowNTJMYjQw?=
 =?utf-8?B?bWF6R1FadmVKa05GeHVRNnRReTZEZUFVRlIrRTk5ZDhzSjA5WDU2YmljRVhs?=
 =?utf-8?B?aFZMQ3Y5NElVQ0c5RW56Ty9iS3gwcC9MeWo2dWJBaUZVNUZHVGMyRU94enNi?=
 =?utf-8?B?R1pCeUZPQ3plRlV3azhaWkpPeUg5ZktCMGtvTHozYWo4Sng1VlVZdUZueDNN?=
 =?utf-8?B?c0lFbmU5UUZhMWNxODNqekxRSG1yUXBna200b3llSjBwYXhXenR4ZUJxTGZR?=
 =?utf-8?B?TGFMd3JWd2xSdWlLV2ZnWDl1eWpvQ0krWGsyakFLakRpeUF3L1o2ZjBCTjZi?=
 =?utf-8?B?NVRNMjlzNklaWWdxcnc5aUFqWEZ2bG1PV0w1K1Rtdmd0QTMva0tDbFMrZ1FZ?=
 =?utf-8?B?L2g2RW5DS0dHYkpKZVg2b1RBZlhHcFVtNGFES3FzNjlWYjRYTVQ2NExldS9q?=
 =?utf-8?B?N0w0VTJFc2V2ODJocVN6UExCTTVreXpHbEpITjZrSTh5T1pHZ1Y3dXhldGcv?=
 =?utf-8?Q?IAmWqw6/maEb9BsxIjgzYzpbU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aDFt5QvnQRdFPNihpdVyUcQzRxK1FN8zBCT4OdM7l2+oGOv6R9617UJfpGRt1CoxvHmU7UgP7U6d28Tq+evnSZ0qGIO5JfCuTSAYqLwU1MQ88PS/g4wyqbYcqoG+YzCvmNE2NZrFzfYlHtIN6ZvFBQVco7T0QkengH7j5GULBpOeJe34Pk1jQEMPzggDj6eWFcd3zqVq4DL4tBbcpSkUtKX7o/r10sYNhTNri44H1YsFILnvDMDwQviCdinoVNHKJayqa6cWVuTJQG9keno+YmoRNi5b2Mwk2PtbYMaDftUMSlXhaBrP5sBkNOr7o9Ku2d5OCXKRM1YFQUIVbKoEzdnoibIutHQxw4fyOeuOtH0qY78RvnXeljxZX3WGFdkTcHQr/OSE90cLKe2CR+bKO+hH4l2AWmm8wAukKsCdJt2IFk1mkyvgyA3fplbqUUpXQFsEUBVY7CU8N1S4GbdiCLWd0lDIYJMN1pwnClq1tFCSNLZKPv+2F81EUL0aYqXq2uUng9XMsDxhf0U7Gmoz0ln14eSBk/n8aiA0rUYSkEtQBUVvsTKXR6pCHV15uZ4780pRzfyd1OwNjokvQ61KyGe0JvdoIeZH4whivxwzCiU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d62b2e-2183-434f-09d7-08dcc8b49b68
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 05:28:41.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8y8GNaZvrO5daDSMqJm8E5BFghWhOYuOlegsD3iud7ZLk971rj6cKjQUtIKSTsjuniIRdNv3sE5DkwdQqAiyZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6984
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300038
X-Proofpoint-GUID: HSEbNktUfzhrMdpvDMaDyTp31niv_bWx
X-Proofpoint-ORIG-GUID: HSEbNktUfzhrMdpvDMaDyTp31niv_bWx

I don't get it.  The patch was supposed to be about testing ERROR arg3.  
The "ASSERTION" in the test still claims this, and the name of the test 
does too.  But the test doesn't have an ERROR probe nor does it access 
arg3.  So...?

Also, the test checks fewer things than does the version in the patch.  
You say that's sufficient.  Maybe it is and maybe it isn't.  I'd vote 
for the more stringent test.  Tests can check for bugs that we 
anticipate, but I think better testing improves our chances of catching 
bugs we do not anticipate.  Certainly checking that a PC matches at 
least one of the dt_probe_error() sites is a better sanity check than 
what was in the v1 of this patch, but it's not checking that the arg3 
value is correct.  Given that we now (with v2) have a test that checks 
correctness, I don't see why we'd switch to a test that checks less.

I'm not sure how "ready" or final the code is supposed to be, but it 
also has some small variations from the bulk of the test suite.  Not 
necessarily anything monumental, but I think it's nice to keep 
boilerplate stuff as uniform as possible.  The "rm $DIRNAME" and the 
missing blank "#" line after "licenses" seem to be uncommon practices in 
our test suite.  Again, not a big deal, but seems like stuff that should 
be boringly regular from one test to the next.

Anyhow, my vote is for a test that checks ERROR and arg3 and correctness.

On 8/29/24 23:34, Kris Van Hees wrote:
> Attachment did not work apparently...  Inlining...
>
> #!/bin/bash
> #
> # Oracle Linux DTrace.
> # Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> # Licensed under the Universal Permissive License v 1.0 as shown at
> # http://oss.oracle.com/licenses/upl.
>
> ##
> # ASSERTION: The ERROR arg3 value reports the correct PC value.
> #
> # SECTION: Variables/Built-in Variables/arg3
> ##
>
> dtrace=$1
>
> DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> mkdir -p $DIRNAME
> cd $DIRNAME
>
> $dtrace $dt_flags -xdisasm=8 -Sqs /dev/stdin << EOT &> D.out
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 1st ERROR */
> }
>
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 2nd ERROR */
> }
>
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 3rd ERROR */
> }
>
> BEGIN
> {
> 	x = (int *)64;
> 	y = *x;                       /* 4th ERROR */
> }
>
> BEGIN
> {
> 	exit(0);
> }
> EOT
>
> awk '/call dt_probe_error/ {
> 	sites[int($1)] = 1;
> 	next;
>       }
>
>       /error on enabled probe/ {
> 	if (!($NF in sites)) {
> 	    print;
> 	    print "  No call to dt_probe_error found at PC " $NF;
> 	} else
> 	    ok++;
>       }
>
>       END {
> 	if (ok != 4) {
> 	    print "\nFound " ok " valid calls to dt_probe_error, expected 4";
> 	    exit 1;
> 	}
>
> 	print "OK";
> 	exit 0;
>       }' D.out
>
> rc=$?
>
> [ $rc -ne 0 ] && cat D.out
>
> rm -rf $DIRNAME
>
> exit $rc
>
> On Thu, Aug 29, 2024 at 11:24:53PM -0400, Kris Van Hees wrote:
>> How about something a bit simpler like the attached?  We don't really need to
>> get too specific because as long as the reported PC in the ERROR reporting
>> matches a dt_probe_error call site, we know that the reported PC is valid.
>>
>> I think that would be sufficient as a test for the arg3 value.
>>
>> On Thu, Aug 29, 2024 at 06:18:19PM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> The ERROR probe's arg3 reports the culprit PC, whose value can vary
>>> with minor implementation changes.  On the one hand, we do not want
>>> tests to be overly sensitive to this value.  On the other hand, we
>>> do want to check the value is correct.
>>>
>>> Therefore:
>>>
>>> *)  Change tests that dump ERROR's args to omit arg3.
>>>
>>> *)  Add a new test that checks that ERROR's arg3 is correct.
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>   test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
>>>   test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
>>>   .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
>>>   .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
>>>   .../unittest/variables/bvar/tst.arg3-ERROR.sh | 172 ++++++++++++++++++
>>>   5 files changed, 181 insertions(+), 9 deletions(-)
>>>   create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh
>>>
>>> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
>>> index 001903ff..bfc77bf5 100644
>>> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
>>> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
>>> @@ -1,6 +1,6 @@
>>>   /*
>>>    * Oracle Linux DTrace.
>>> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
>>> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>>    * http://oss.oracle.com/licenses/upl.
>>>    */
>>> @@ -19,8 +19,8 @@
>>>   
>>>   ERROR
>>>   {
>>> -	printf("The arguments are %u %u %u %u %u\n",
>>> -		arg1, arg2, arg3, arg4, arg5);
>>> +	printf("The arguments are %u %u PC %u %u\n",
>>> +		arg1, arg2, arg4, arg5);
>>>   	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
>>>   	exit(0);
>>>   }
>>> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>>> index b11f6c99..3e7caac4 100644
>>> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>>> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>>> @@ -1,4 +1,4 @@
>>> -The arguments are 2 2 4 1 64
>>> +The arguments are 2 2 PC 1 64
>>>   The value of arg4 = 0
>>>   
>>>   -- @@stderr --
>>> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
>>> index c23f9503..ec519f4f 100644
>>> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
>>> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
>>> @@ -1,10 +1,10 @@
>>>   /*
>>>    * Oracle Linux DTrace.
>>> - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
>>> + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
>>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>>    * http://oss.oracle.com/licenses/upl.
>>>    */
>>> -/* @@xfail: dtv2 */
>>> +/* @@xfail: dtv2 d_path */
>>>   
>>>   /*
>>>    * ASSERTION:
>>> @@ -18,8 +18,7 @@
>>>   
>>>   ERROR
>>>   {
>>> -	printf("The arguments are %u %u %u %u %u\n",
>>> -		arg1, arg2, arg3, arg4, arg5);
>>> +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
>>>   	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
>>>   	printf("The value of arg5 should be %u\n", 0x18);
>>>   	exit(0);
>>> @@ -29,4 +28,5 @@ BEGIN
>>>   {
>>>   	d = d_path((struct path *)0x18);
>>>   	trace(d);
>>> +	exit(1);
>>>   }
>>> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
>>> index 8c601a43..be1f6d5b 100644
>>> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
>>> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
>>> @@ -1,4 +1,4 @@
>>> -The arguments are 2 1 28 1 24
>>> +The arguments are 2 1 PC 1 24
>>>   The value of arg4 should be 1
>>>   The value of arg5 should be 24
>>>   
>>> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
>>> new file mode 100755
>>> index 00000000..4b139be2
>>> --- /dev/null
>>> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
>>> @@ -0,0 +1,172 @@
>>> +#!/bin/bash
>>> +#
>>> +# Oracle Linux DTrace.
>>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>> +# http://oss.oracle.com/licenses/upl.
>>> +#
>>> +
>>> +##
>>> +# ASSERTION: The 'arg3' variable in the ERROR probe is correct.
>>> +#
>>> +# SECTION: Variables/Built-in Variables/arg3
>>> +##
>>> +
>>> +dtrace=$1
>>> +
>>> +DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
>>> +mkdir -p $DIRNAME
>>> +cd $DIRNAME
>>> +
>>> +function dump_files {
>>> +	for x in $*; do
>>> +		echo ==== $x
>>> +		cat $x
>>> +	done
>>> +}
>>> +
>>> +# Run DTrace, also collecting disassembly.
>>> +
>>> +$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
>>> +BEGIN				/* dt_clause_0 */
>>> +{
>>> +	nerrs = 0;
>>> +}
>>> +
>>> +BEGIN				/* dt_clause_1 */
>>> +{
>>> +	x = (int *)64;
>>> +	y = *x;
>>> +	trace(y);
>>> +}
>>> +
>>> +BEGIN				/* dt_clause_2 */
>>> +{
>>> +	x = (int *)64;
>>> +	y = *x;
>>> +	trace(y);
>>> +}
>>> +
>>> +BEGIN				/* dt_clause_3 */
>>> +{
>>> +	x = (int *)64;
>>> +	y = *x;
>>> +	trace(y);
>>> +}
>>> +
>>> +BEGIN				/* dt_clause_4 */
>>> +{
>>> +	x = (int *)64;
>>> +	y = *x;
>>> +	trace(y);
>>> +}
>>> +
>>> +BEGIN				/* dt_clause_5 */
>>> +{
>>> +	exit(0);
>>> +}
>>> +
>>> +ERROR
>>> +{
>>> +	/* Report the problematic PC and continue execution. */
>>> +	printf("Error %d at %x\n", ++nerrs, arg3);
>>> +}
>>> +' >& disasm.out
>>> +if [ $? -ne 0 ]; then
>>> +	echo DTrace failure
>>> +	dump_files disasm.out
>>> +	exit 1
>>> +fi
>>> +
>>> +# Parse the disassembly for start PCs for the dt_clause_n.
>>> +
>>> +awk '
>>> +BEGIN { phase = 0 }
>>> +
>>> +# Look for disassembly of dtrace:::BEGIN.
>>> +phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
>>> +phase == 0 { next }
>>> +
>>> +# Look for a blank line, denoting the start of the variable table.
>>> +phase == 1 && NF == 0 { phase = 2; next }
>>> +phase == 1 { next }
>>> +
>>> +# Look for a blank line, denoting the start of the BPF relocations.
>>> +phase == 2 && NF == 0 { phase = 3; next }
>>> +phase == 2 { next }
>>> +
>>> +# Report PC for each "dt_clause_n" (or a blank line to finish).
>>> +phase == 3 && /dt_clause_/ { print $3, $4; next }
>>> +phase == 3 && NF == 0 { exit(0) }
>>> +phase == 3 { next }
>>> +' disasm.out > dt_clause_start_pcs.txt
>>> +if [ $? -ne 0 ]; then
>>> +	echo ERROR: awk
>>> +	dump_files disasm.out dt_clause_start_pcs.txt
>>> +	exit 1
>>> +fi
>>> +
>>> +# Confirm that we found expected clauses 0-5.
>>> +
>>> +for n in 0 1 2 3 4 5; do
>>> +	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
>>> +done
>>> +if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
>>> +	echo ERROR: did not find expected dt_clause_n
>>> +	dump_files disasm.out dt_clause_start_pcs.txt
>>> +fi
>>> +
>>> +# Dump the error PCs to a file.
>>> +#
>>> +# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
>>> +# we are looking for: "y = *x".  Each time, we check if address x is 0,
>>> +# calling dt_probe_error() if necessary.  Then we try to dereference x,
>>> +# again calling dt_probe_error() if necessary.  Since x==64, the second
>>> +# dt_probe_error() is the problematic one.  We look for those calls.
>>> +for n in 1 2 3 4; do
>>> +	# For dt_clause_$n, find the starting PC.
>>> +	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
>>> +
>>> +	# Look for the starting PC and then the second dt_probe_error().
>>> +	awk '
>>> +	BEGIN { phase = 0 }
>>> +
>>> +	# Look for disassembly of dtrace:::BEGIN.
>>> +	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
>>> +	phase == 0 { next }
>>> +
>>> +	# Look for the start PC of dt_clause_n.
>>> +	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
>>> +	phase == 1 { next }
>>> +
>>> +	# Look for the first dt_probe_error() call.
>>> +	phase == 2 && /dt_probe_error/ { phase = 3; next }
>>> +	phase == 2 { next }
>>> +
>>> +	# Look for the second dt_probe_error() call, reporting the PC and quitting.
>>> +	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
>>> +	phase == 3 { next }
>>> +	' disasm.out >> err_pcs.txt
>>> +done
>>> +
>>> +# Do a sanity check on DTrace's error output.
>>> +
>>> +awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
>>> +  disasm.out > err_pcs.txt.chk1
>>> +if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
>>> +	echo ERROR: problem with DTrace error output
>>> +	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
>>> +	exit 1
>>> +fi
>>> +
>>> +# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
>>> +
>>> +if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
>>> +	echo ERROR: D script output looks wrong
>>> +	dump_files D.out err_pcs.txt
>>> +	exit 1
>>> +fi
>>> +
>>> +echo success
>>> +
>>> +exit 0
>>> -- 
>>> 2.43.5
>>>
