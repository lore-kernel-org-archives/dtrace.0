Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30417A2EB
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742241450; cv=fail; b=bH/ghMufoXG1LOsN0Ij0CoAk7KcbTqIwYmLMYMiPJRtaD41H05I7ibBVyod5knZ4TLJtBHJEeEk1jkg+okKWdvH2CP0xo11vUuHsLuKXKt5+F6iFlQs8iq0qBWn2ssZne41RRm103385Vm/Ier0f+hBRDrJLBefUdONOeVkjBlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742241450; c=relaxed/simple;
	bh=EE9Dc+4MrnpqEjaE6YqiAIYtZCzNhc5kf31+qJKAaCo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uX2xp6RG5lzv0Tb9BYw0rIg0p8YUvCyAGrnarDTP16H87ASlXNwf6T1r7blGDcOUu/vj4ai+WNAxORavDBHwDBW5NGg5RBykaX2GAYzZp9TBtLq0YJFdM4H3SmMCPA0KWx49CTej6rRGkXtsAR+7OP7bL/XUpQ882+N19lFGIiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N3zaJy0C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gNoBYAkN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N3zaJy0C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gNoBYAkN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJfu2r004441
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 19:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qKVr/ahht3WVOL8dNBTckyu1x0HV6VHyf8vL80I/GNA=; b=
	N3zaJy0CWVf6XFucXVt6owZNGwCBVSqOtWPdY2iggH+vkD8CBYf0MekmRhUGQx1k
	Xi9+r/7DPTIcijTnCAPImymgk91i1SgGKYEfCZ77M6s+GJ3Uk/B9JR7Kr2Lm9ltI
	0ZkTzARlAKOrtz8mJOp7JAUwtyywu84HXAA6ZS0kGkuozRF5h5U60rxLhctKj7Ui
	1GweYC2C6YKOAwXtd7XGlHq2vArfnYKQAFvxbLyGmTBFvfM9nWmKqCToD6bi3GpK
	YXD0bZlhHvHI2fdJJjUWHxKGldPYfch3aD06PK2w8sYDnPLnvBF+DMB1xtNI7poe
	6YXAfIKvMETGClBaMA+Sfg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1n8bs3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 19:57:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJ8vJ7027944
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 19:57:26 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdce03f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 19:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUCtMKxO6IG4rK5wbKINLlWHlA7gjvAXFR7qiC8GEcACq6cuBfVowaLMsuyAHNjN3dwvfnmYHP3TUfeAJoiFNWaFzON7Pw6wAgN5KueN1g/94ClycBreaN8rCnPyd4sae6cy5MXmUoe9L/T8ziJ1pSv6qdZFH+p2wkkqI7NgBO93z/k2T7LIJV4u75D//DPjPjen5ikzzynPireHaGiK0Qq4rufdkVr4I3/bmkU/VPJ5byYdZYOcbcnkuAyX60pSYGCEkx1LBbTxrHLAjz3PxRRSwPw+rLzO1pSsg9N/sD/djcHebI7j566piZfHljxRciFo32cveGM5yswKINICqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKVr/ahht3WVOL8dNBTckyu1x0HV6VHyf8vL80I/GNA=;
 b=Yw+JCsu7eUurTSklFD4ZIicU+CAC+3RrpiWSqpZrZ/Qo08mutlqdl5cQwYH5nFhj0O8K4w5/flPl3m9TMMESX66zYAFkL3TeVS8HOIc7jjW+sMJvI0W+/v9qH7S4qiLUmrh5bnMzLJsfMG/RnCaVnqjm868ik277kII5SMFYZ3aQtxVOOi6mi6TXn79PyM8s3x6vrMwSBgJtAvEGY0q48q+fYkGhBDLUkp913pnTfoudOdtsr3vMH512XmDRqtElKU9HiC9yzqHJgbrGGwxaND7dSraeays9r6Ah18Hh53lL8NQE+48Oc0OyASwJRCTWVbmj/qyg0Sjj6cM6QqlUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKVr/ahht3WVOL8dNBTckyu1x0HV6VHyf8vL80I/GNA=;
 b=gNoBYAkN68tFesePbhDZzcCVCzPjOve6ZIL82J+VgPnq0NwNv+dgpNAz8mHi4f9d0IlZ7xaAj1ZoRvDU7Pr/QAKWexXBEeKEq8L6rUb7JoR7np39aC1Pa/XmfCcljiLZF9opgni/mnMSfi6DT0n4ve8Xas9zpUQ9JfdaAtEpemM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6110.namprd10.prod.outlook.com (2603:10b6:8:8b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:57:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 19:57:24 +0000
Message-ID: <da946028-f3b4-89ef-92a8-9d46cac246f3@oracle.com>
Date: Mon, 17 Mar 2025 15:57:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] error: report probe name on failed enabling error
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <e05e25319eb103bba488fab000c3c21b.kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <e05e25319eb103bba488fab000c3c21b.kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR15CA0030.namprd15.prod.outlook.com
 (2603:10b6:408:c0::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d3c8d7-fd75-4664-feff-08dd658def61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnFyRzdHOGFFQUw0SHR1ejRKODJWQnVkVzJOUTFPQ0pib0lIR1FCMTVzbmJ6?=
 =?utf-8?B?OERvS2VXM2VPOVRoTlFEVnVaeGpocDFxL0cwM2JuSlM3dlpqT0ltZTB1b0xp?=
 =?utf-8?B?VHdSbVJka2NyMUlUS0RXZmdhSnJwTzQrVmdTMGhud0p5Qmc5QzNBeXh4enRl?=
 =?utf-8?B?R2VlUFpFV3dZRllmUWMwazdMMlhkZmwvWnZ4aXUva0NHaVhZTkM4MlY0eFYx?=
 =?utf-8?B?Wm5vWlM1Q0JVVFRQb2diaFlIcDhWcStCY0JneWc2aXk3bmRQWXU5RWRTZ0Jm?=
 =?utf-8?B?M2VhUS8rNmh5TUFhaEhicXljamZBaERJKzRUUUs2TVl3eWNwS3dJdEhveGpr?=
 =?utf-8?B?aTJUSmlqZWpSM1V0b2liZmRzeGI1QnR3eXRrSk45a2syVXJKbEtqc2dheGJl?=
 =?utf-8?B?eWRvVmNkRGhRWG1jR28vandpL2RMcHZINGc4eU9ETUtMelVEaXA1OHZzVzZN?=
 =?utf-8?B?U3NkZ1MxeThpUTluV3lyWlNYb1FBUXgwTjBuelNPd0diMnE3b2xQaFVMVFhD?=
 =?utf-8?B?UWVSZG5ucXZLdVlRbnN1NUVIZU1Gd0lWZTFObnpoRlV1dE9mYis3blMzSE5O?=
 =?utf-8?B?d3VmTUtEcWx4T1JJRVBOc1dWcVZhdGxkcnpjQmcvNkxmZHJZZzlBbUplQ0Z1?=
 =?utf-8?B?Zks4OG9QWnU5SUMzQ1llcGxnTFQ5d1QwYmJ0OFNJcFRDTVpjZFI0TW0xbkxT?=
 =?utf-8?B?VUpIdGJKdHNZeVNXQlh0TmprcjhyWlF1TVROeXRDRG1QYkE3cFhDK2lGVFc1?=
 =?utf-8?B?cmVqNTFCODF3TUFiZEZZVkZmUGZ1cnNwMjArR2JqcVV3RVNCaUlOT3grRUNB?=
 =?utf-8?B?Y0hSUkJWTUVqd2o1YURFZnFjSnhVdm8yaytQdTMwRDZ4OEhzdW41RFhxTDVn?=
 =?utf-8?B?Qms2bmVrVG5qZXF1YUU5Q0h5ZG5iQUFlMXBuVEUzNHJLa2hHSi9SVENUMjkz?=
 =?utf-8?B?QXVjZEhsTHdLa1BGa3VCZUtDbzgyZHZhS0p5WmxwRWY2OGdkTTFBbjA4Q3Vn?=
 =?utf-8?B?azduRDlnRlorNXV0bmFFNms2SktPbDFLWmNZY3NkSXJDaWg5VERtbnZxaHUy?=
 =?utf-8?B?L1N5RzJXVGlsT3NtWEJxdVdtVzA1NWhreXJ4aXJhTzB5UFpOaHUxYVhNU1RJ?=
 =?utf-8?B?UEFjUHRUK0Z4UldGcnNIOGpTektnSnhzZ1p6TzNUK2xDSUJwdktxQ0dhNitp?=
 =?utf-8?B?TVBlYWMxaEcrZGpqSXN1eGwrM1liRGV0WFRUb1ZQYjVFdGN1RTM2TDcxTkx5?=
 =?utf-8?B?YzUwOEl3Z0U5ZWYzM052SlZscEVDb3BndmJrQmk0UWF0ZFd2WnFUWHZwWXJT?=
 =?utf-8?B?aDAzU2cwd0RWRUZqT1FTTHZ5YVhwT3M5Nm41QStHQlFEZGt5QStFdEEycVVI?=
 =?utf-8?B?WnFvSitVSnAxL2lpRUxqRUttSVJ4MnprRHNySFY0NWxxSm5pR2h4OXVQajZL?=
 =?utf-8?B?Y0JuOGovMnRWeERwL1RGb04rcytYWFM5U1ZyTkR5Tnc3eGU3d1ZNT24wUDd6?=
 =?utf-8?B?Q2g0aGtncGtRVWpleW1wRnU1RDJlU084OE5nMFNtOE9RTFdMWEdzRmtpTk1Z?=
 =?utf-8?B?eFVhMTUzbkJDZXBwUHNTQWk4SWU2QkdYU2QwWExSTStHdHJCYUhQbHBURWdw?=
 =?utf-8?B?R3ZPM0E1UUF3MzhDd05BemJUUUVZS05kWDVQWXJMbENCYVBOYlNiS3djWWh5?=
 =?utf-8?B?d0RBMUxCRkp6Qjk4M1dTSWRPckRmS3ovZWo0dE5GdnZsbFpJd0ZmWGZrVjVr?=
 =?utf-8?B?bkNkSnNCbGZEVDkvMFRWQTN2SkdqWDZrM2luci9Zc2c5WVVDTHZMWmJPZ1BL?=
 =?utf-8?B?TEt3Zi80bVdoTjYxVXFmTjlTeFpMMzQ5NDd3RjgrTjF6dTlLNmpxZ0YrcGdt?=
 =?utf-8?Q?Ye1OnhO2skmfL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVJOMStPMDhnMHRrRTRoeXIrMnRDMWV6b2VMOXNuSEk5M3cxUEhGY08vUFFt?=
 =?utf-8?B?cnF0Y1JWZk45Z0JtTnJ0RnNRcDFRSXUwQzAyN2RPUThnblRUbHU2bHZLTFRH?=
 =?utf-8?B?cjBkcHZJdS9VTzdueXhWMW4vajJzTnlVZG9PMjVHMXV4dDhtdzdGWFZTWEdl?=
 =?utf-8?B?Q1lpSjltZ1krbXlmWE00MUozSGtmL1NhaTl6K2ZVZGFNcDdNVTBZcm13Tmdy?=
 =?utf-8?B?dTRlU3FsZlBLakRWTXIrTC9peEhsNjdpaEtybkF6UHNodzJ0YmhIQnk4RjhJ?=
 =?utf-8?B?WjB6QVZDU0hBYW1iUGhCcC9ZeG5ZNWp1eHJNV3UvTTdPSUJJQzU0UTB3aFNv?=
 =?utf-8?B?VXYvSndoa3ByUUJ6SUxPTzBGbjZ2N0p5by91dDE0b2p0djUzakxtdXB3L2tV?=
 =?utf-8?B?cTNHenAxMzZ5OFFiQ012SFZuY2JjZmtKdWIzQjYzN25UcldxSE1WcmYzbWJM?=
 =?utf-8?B?dk1Fb0lPU0RUUDV3dXRjcHptOHZjNG9NMndSVzlaTndZR0pveGJDWHU1TFFW?=
 =?utf-8?B?NnV5bjlLellqc2tWVVhjbXYvMnUzSjJvYWYrUUZFUk4zcjZ0U1p3ZkQ2OUdV?=
 =?utf-8?B?ZCtvaGozbHI3R0ptcjFkQSt5OGdsSmhXZWZrejQzR25jV0dJK2k5eWd3end2?=
 =?utf-8?B?WUdBeFFBUlpSVHN1aVo4UlNWWUpTVktkME0wdVFWcmdJNWhIaUtSU1c4VGdN?=
 =?utf-8?B?UnNlZnc3eWNMampOS2hsQzVDeHVsWXFydmE4TzcrRUVEWmdQckpLdXpoY3R0?=
 =?utf-8?B?WTZ6bnNZTW10UjVIdTNXMmNzbzBudFQwVUwwZUREMXc0N0grLy9HVjU1QWNP?=
 =?utf-8?B?QmdFZmQzdks1ckNPNlhKMElYYnRBVGV6Q252ZDJ6c1phM1BwSHoxNlF2T0ky?=
 =?utf-8?B?SGpuQkVveEZ6YkgxNlY4Q1NwQlBSY3BjTEl6Y1FIQXZKMklDTHA5c2tLYkNX?=
 =?utf-8?B?T20rL2xsRGgyd1h0Z1RrWmEzcDI5c2dGWUpENjU0Q0p0VWg1YUt3c0VjNGpL?=
 =?utf-8?B?dmhBODJJYnFzbVJ0LzZpOHJLU3VRYXMvcDMvZXc0Z1hxRWFmZzNOU1AvU3F5?=
 =?utf-8?B?MHR1SkhEUWlUa1BkeitTUFhaSlI5S0hZOFVVclFnazRnaHZqMTd5QU52UnJl?=
 =?utf-8?B?ZU14b3YwN0dJczlrZWpjNEZLRlVqM2s3ODRvRDV4a0JkL0o5R1VBbFFCMXBN?=
 =?utf-8?B?WmR0aklUN2Q1YUF4ZC90dzBxQ2kyVmtvRmtpRXJFNUJmMFVXNmFPS0ZPZS8v?=
 =?utf-8?B?WTI0dG1PakhCVTkxc3p1Zitta3JuWDNVZzY4cGJicUV0dnU4KzJwSndMbXBy?=
 =?utf-8?B?ajl6QXh5UXpGTFJ1WG43dmN5bm92VmppWkpDdHlWZDJ1VnZLbGNhUi9DNyt1?=
 =?utf-8?B?TFg5cUs3VTVrdS9kVFNKelN3cHo0UWJDSGphRWFSSW1rTWpDb25BVWlJa3Rv?=
 =?utf-8?B?KzlJV3NVeHYrc2hFUEtGV2lMWUZZK1hqajBuV3Zmb0hkT0plZHkwRjdvSU8w?=
 =?utf-8?B?alpsSnFsdkdSK1dkb0FWYmJPTHNvVWZqa3dXZy9jZ2EwV0M0NFNTM0VBTXhM?=
 =?utf-8?B?czRBN1BrRUZoaEc3YkpSaHRYVWkwelBWMDBnb3Y5NjFoOVhUWisvN3ZZSkNS?=
 =?utf-8?B?Wktvb0dxWkhSWW1tSy9qV0ZMUmZGb0FpczR5cFBNS013VWZTK0tUWHRzUUJZ?=
 =?utf-8?B?TXR0VytUVHVvMUY0SVNiWmNxeUlLNkd5NE9meUN4dDN6M3grZ3hQVDdxKzJG?=
 =?utf-8?B?Y3E4K21KZHowTFN0b1BCYXlMN3ZVWldDbXJESHdqYVBUbXZqNXVjWXEyOWFY?=
 =?utf-8?B?Ym1pWk5jVlpLZVU3N1VyYU1iaGUyWThSTWVZeUJ0SzEyWkdtSDRITVFyYm9a?=
 =?utf-8?B?TEV4OGJ1bkpWbXY4VTRSTHNOLzRtL1M5N1lLNUNjdjl2NDZIZXBKQkY4ek5C?=
 =?utf-8?B?ZnhJTXZnQW9UUUZOanZ4VlR6SzNoS2hyK2FmSndFbUlxMlQrc0hYa2tYbkw3?=
 =?utf-8?B?UmZZRi9RakxWckJTZC9KdGRzV1o1ZldpdS9nSUFrU1dVVVVnK0l1RnFjMFpq?=
 =?utf-8?B?OGhFZlluM1hFczdpaHExMXBlS2tabjlLcHhXSGxOejZPbnRGcjEvUHJaWTlP?=
 =?utf-8?Q?vSYFbUm9IP7VqVx5EGik2K8p+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cQJpFiUJpcUOfzDsjhKC191saTp90quOc8scvogNh1BqoHvIFqSnC5T4EKwcfmt03cr1/ILDe5wO4G2Moyau4xh+wNDcSDEFSLK8qMY6qQn+PW8OFpe5+huKJV7t8I5Mmzkgod4sKvCAifnYvUhUHSI8W5z7zDcq7SyVMhLDFSvGWwdwsvRbFp1RrBnE3+dinPOdZq1qoYFd0GaebBgr4rUR+iOKwstRJt1UiotFI79usVVKkDOzdOQx6Rq8ga4MpdSmB3fFzYnVaW/8SwjTm2qnYz6w8ulwX/2BClx+zl5uNyFN7HuksJWUt9Bfyh3y9z88xoqUk08mM3br7x1HSvlMYJsMqHYaTFhOYdj2nZgkmaAgI8DrOFj60IHbyShFS9UnCFGuqqFVcHIZVNbvguREobdxIK4pN9nPwiDei9/AO8RREcWbwbYXWs53J/hVY85UFxZKRG77eZ4XjE5covk1XVGYCog6BXKjYif3SpWduxgR7r3jexbO0HRVQDC5JfxTk6AaLj9fCTbjPLLWhbt0qU9foNcXwXgS+EAP7sAXvuX/Y2w92ZuXWe745kBZx5vJcoOZUgK2anmViK8Z+K+FLeDg5LPsUQ9R7c4vTnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d3c8d7-fd75-4664-feff-08dd658def61
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 19:57:23.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFxxYrqqIxwOANDn1oNuPFYYvW4cQCZxxN9U9xfDkJHqXD4w8dD4TrLNQyl+RFAT8HOHo+onKO2jcBMTcwzm4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6110
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503170144
X-Proofpoint-ORIG-GUID: OyqiQiEy4gIMiyUXz9jG-4bNb-LYZiyD
X-Proofpoint-GUID: OyqiQiEy4gIMiyUXz9jG-4bNb-LYZiyD

I don't 100% get our error reporting, but
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

A few things...

The various files need updated copyright years.

On 2/24/25 13:43, Kris Van Hees wrote:

I don't know if anyone else sees this, but this is the second patch in a 
few days that has gotten buried in my inbox due to a stale date.  (On 
Friday, I got one dated 1/24.)  Anyhow, I suppose I now know to look for 
such emails.

> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> +int
> +dt_attach_error(dtrace_hdl_t *dtp, int rc, ...)
> +{
> +	va_list	ap, apc;
> +	char	*fmt;

If you asprintf(&fmt), do you want a matching free() to prevent a memory 
leak?  (Clearly not a big deal, but...)
and finally...

> diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> @@ -111,6 +111,8 @@ dtrace_errmsg(dtrace_hdl_t *dtp, int error)
>   
>   	if (error == EDT_COMPILER && dtp != NULL && dtp->dt_errmsg[0] != '\0')
>   		str = dtp->dt_errmsg;
> +	if (error == EDT_ENABLING_ERR && dtp != NULL && dtp->dt_errmsg[0] != '\0')
> +		str = dtp->dt_errmsg;
>   	else if (error == EDT_BPF && dtp != NULL && dtp->dt_errmsg[0] != '\0')
>   		str = dtp->dt_errmsg;
>   	else if (error == EDT_CTF && dtp != NULL && dtp->dt_ctferr != 0)

Should that be "else if"?  Otherwise, if error==EDT_COMPILER, you 
trigger both that clause and the later "else" clause.
