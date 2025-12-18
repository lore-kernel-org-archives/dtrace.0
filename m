Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5F42F361E
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085131; cv=fail; b=TEDCEGUFLrQoic59+qVj/0RC5dburFdVhoq93YirO6fznBQRQIHBTXsjugNDqSow3Jv1NN25Nv9c/8rZxMEDp1ESNO+V4vASxo6fQLeQicw53lEqn0WfNMXZdpmWM6U7LbUDp5wQPFoKasNXZzTLLm2RXpCL/QFJMad3MFSViAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085131; c=relaxed/simple;
	bh=6VReOC6k/SX0SaCY6r4t4yEiSWQUcltyVdBMSZJOo9M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfTv9mRwv/LI304MIKzyleWyGBvc1aK+3bpOaMji2Fmw8rQOP3CMXjE/u13x+beu3pBG2lNZLNhQkSxfGBYqrpZhUunADWEWcGMAzLCrXAnuqe5yBJo4w0X2pLtRonrHSktDLcwcwOVzigTzGCX7vfoKpMtlNtnRhya07BjSWow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K0hu0BvY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Og2+ur54; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K0hu0BvY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Og2+ur54"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIHfvvH1985525
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=x7rpCgyEOtpzWmOejgr8aR4Gjd8mAm7CEjY86g+d+cU=; b=
	K0hu0BvYVpybM1V2prQ6vPMFk78ke8hrOXGnPdtklrKdMa24XLouncAZkYVZ2c+t
	8g32ocPuull76XQsZGtD57C+YyyfzC4flh/pKU59I01I5d+oRZsfSfQCvapeK9+T
	Qmk3HeuuDziogLnph2QFRam5NwQkyAnJHc7T6hGyKARpvegaSlgT+2uwMeYYOif3
	tkTbaWqTTNVqNAqXSlTiXnfwgW6ZsG9/qnmnm9cWo4YO890Ovrj4lWZhsdXha0iT
	hWLOQIF9ztxDoESyeZsp8bE4ExT7F3My1cUMjylOgozXTjY/O38bztAGk98f1G2q
	cwwfMzaxaW2Wz1Bed5aN2g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b10160b51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:12:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIIVeT3006027
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:12:07 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkgax0d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8rVl3LYMyb7Z7h2uyIvcqcongxQJNCDIQwZVCqIvG+bsil1llHWhgeuZVffvLIE8jWrSAonEoVbqCTL3uVNGEztJ5kIhVA+cfhEFYFvikfpSGBSx5AOpVvkt9Ptrz4KyiW4IzWl49fmCkfNgm4RxupISdzM90mHBaWwKW07o/GTk+l/mi/sPr7bS0JiPoWVFTOH3Xe7o/4NqNOJ6j8uD70mZHXbqSyaShlfW3sPgY+hFdc1uajkM3z2emQw7v2GGiXQll8FqbUvalG9NJr6Tb9n7TN/6oOMeHYk7e7Reu3wrc/7evucN+S1GO22R+i5rm0NspkJGsAMtP2xv8Pa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7rpCgyEOtpzWmOejgr8aR4Gjd8mAm7CEjY86g+d+cU=;
 b=Nov3L/NpagEH98Mei4uNfmBMiFGkqm2E9Isg5TWo5GTqtFEjsnBGEjyQLNDk+w3ufP5C1HF+iKUdYHAmM8afJz/JSq9ys8Q0Ul5/hi1ffL8ZXDFptsASha12t1SMbpiX8utzOoahIfdJ63YUWxDh4CmLS7hfzRA2FCqH5F8orVIhEtX3LMhmEyXSXFU5A2wY3sa18ENCVRakBA7bj4af93DWRw5YNO5qD8Ya55oS4Psn9ts2tczyuvt1s4bdf53CAw/2w6WAqJMX582Jvfsg+xMXuZGS9gh3H6uPhSDs+UNXlZ0v5sK+v2WHFxzGkOqc56dTqZSsOXVovKDAZSHxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7rpCgyEOtpzWmOejgr8aR4Gjd8mAm7CEjY86g+d+cU=;
 b=Og2+ur545VoCLUUpZQJ+/OKA5C1h/+zvXSXnWwjVyazMKggMtYpVu6Yj6Yd/1PHVYgzPlumlqJKIeB2OEjWsnWGnGrSUDXJtZOgfX/kwPWmKqIDN+Q3RQJhGzHRdTPNvnpizDEtAYeaSULHOU7oknEb4iFePqcBnuBwRNFrN1f0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7394.namprd10.prod.outlook.com (2603:10b6:610:149::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 19:12:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:12:03 +0000
Message-ID: <a601f7a6-6df3-8519-0986-3ee50934410d@oracle.com>
Date: Thu, 18 Dec 2025 14:12:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/4] cg, providers: refactor clearing probe
 arguments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752211096F0B38B398CD019CC2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752211096F0B38B398CD019CC2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:510:2da::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb1eb34-cbac-4bb9-704a-08de3e69540f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmlhT3VvSGVKamJNQ25YQmF4b09wdmFObFVIR0VtRzcrSmIyTU1aZkpmTGJm?=
 =?utf-8?B?cmovY2xPek1OTTZGdE1lWWdVZ05FaHBqcVUxMndyNTlTVDUrT0oreTUzQmsx?=
 =?utf-8?B?cmU1bGxmd1J2UG0xb1pLWHVrWVpqbnZWTThENmRSaklhNk9iS0xGYXBnNStD?=
 =?utf-8?B?N2ptanRjREpmQmpXQW5WZ2taTHBGamtaVlBzNW41OHl3Vm8zNk9yNDltUEZY?=
 =?utf-8?B?aEZhclhnS0ZMZldRZVVFVG5JSk1mRVRlZC83dmpJUDNrM0hBUG1XTnNuTnhZ?=
 =?utf-8?B?ZGxvbHFPWjFKQU9TRzg3c3l4VFRGWU1tVjI5c3NqK2NVM3FKSnlib2JpK3Zl?=
 =?utf-8?B?WTdoWG9QUmdSZU14UEY3Qkp6NUoyWjhJTk1Lc3B3aitmamc4M2REWm9KOGx1?=
 =?utf-8?B?M3BLQ1RrZ3lnc3ZYNmxaWk42WjNmOTJFTUh2eVhXc3l3clBEU3Rxb0Q3aDV1?=
 =?utf-8?B?a3A2ZVRZa2VwS0xsajk4N1ZlRlQvSmhBTVdhYXJlY0pYQ0hqSm9sclc0MzBF?=
 =?utf-8?B?c2t4OFZ1RGtaVkpjZkFHVERJeXR1M3oxNnRNOGRSbFhxaytjTWZlSGxkbEdw?=
 =?utf-8?B?a21HaHg3YVQrR2hmTkx5QVpnbm9oSUMzUUd1SStSaXlkOWZ6d3A0N2k2djgw?=
 =?utf-8?B?RVUzM2piOENFUGVwVk1aMmlWL1RidGZEclVhUVJRTklJVjBQc0xFdHlhczRX?=
 =?utf-8?B?Zy9sNFM1ekJFRCs4NjIrMGdNNi92ckdsOXNCMDVpZU55YXo2TlZzQk5EVkd4?=
 =?utf-8?B?Y0RHeDdycGtMbE9iL0RtQm85NHVvd20rVTR6anhWeGtrV0ptRk4rQ0luVTkw?=
 =?utf-8?B?Nis3d0VEVmZ4Wkp3SW1tbUNJWGpaTXM3REhrQ3huNUd6MWpnWHZPOC9wUDNu?=
 =?utf-8?B?R0JSUGZJTWZYdE82VU1oYW83Wjg3TjRVUWFCSXVxZXgvMTVXTDhOSkc1K2Z0?=
 =?utf-8?B?eVI3N2NqbEdXM3BXY2F3MGVrNm5ZNUNnV29xdmluTHFmSytzemdFYXVKVjZm?=
 =?utf-8?B?YzhEOTNVYUgyNG5aTHRwQTJER2dGSndZZkhYcmdtNlBWMEhjbFpLb0dwaVZY?=
 =?utf-8?B?cXBSZ2RVQk9LZjlOSHY1M2ZROC9HMlIrMnZFUVZtcWdZdWZ3R08yQlhnMlhy?=
 =?utf-8?B?Y05IWklCRVFhLzdIQWRSSWh6QTlIOHNKUjZLVUZYbXluZHZoK1ZFNjFmQS9t?=
 =?utf-8?B?Q0diRlREZDRFR3h2MHZUcnhQc0VwekIzdnhaa0VkKzkzV0xwU0xrVDBNL2ZN?=
 =?utf-8?B?VWpPVDlNak1TbVFqcVJJa0l1c2trdnlBaS9VZjkrWmhYMHNoQ2hkWllQaXlp?=
 =?utf-8?B?NWVqRWV6OHpWNG9KdzZEQ1FmZU16RHNtOXJiaUJTVnBZNkdYL3lwWXM0OVhp?=
 =?utf-8?B?dWh5ZklXdjdabUFiRkJwd2hrVXFUVFhlS3piNFdQL2I3ODhaVzhiTDR5Szdq?=
 =?utf-8?B?WVF4a0lIYVh3WERrbVlLbllQd3pDc1hvakk5YlJEYzhVNTBpTzQ4SS9lL3da?=
 =?utf-8?B?NUJJZk5qbHMwakhQcHZOWENpQ0dvbkdlYUEwcXRmOXBjczAvK3B3K29ZVlZj?=
 =?utf-8?B?RGVWT0FqQ2xOb3UyRlkxSTEwaDArMWxCb3hVMU1KUUkrMU5za0JWZFA0YjBK?=
 =?utf-8?B?elRpVWtkc2N3ZndmODBDQndNRDdtdGtndFBPTWxPbThZSjZLME81Sm11RUNY?=
 =?utf-8?B?R1luMkx1dU1NNWxjMXV2elVRU1c1V2p5dVlKcys5R3dZQkk1VXVBRkdoSlU4?=
 =?utf-8?B?Rmk2T0lISjN2RXE1c1FvTnQxZWdrRE1WNlNRVjFRejMxMnJ3dWVpSVFxYkdz?=
 =?utf-8?B?a0U1T21sa3BkNVhyS00zL0ljRFZYVHpoWlJBaXlFZGVzVnFGSlllUHRSNmgx?=
 =?utf-8?B?eWQ3M3U5U3dVYm5RZDUwWjZMdFdVQThHVUV2Y1Z3ZzRoUGxGUlZwbTIwUDFJ?=
 =?utf-8?Q?E1t2aDT3I/RnuDDXMGZGbdgEASwSoPg7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1rMXhlclNGUlJ1L3k2YkUzTFVQd25JSnJWSlpVTm1yYzVZcXdhdWd5Z0Ro?=
 =?utf-8?B?d1pnbHVmcEpaYktyS3gvb0JETmhvaTliZ2xsOXpJMzg0NzU0RmVXaW1iWi80?=
 =?utf-8?B?eTZvSjNBVCtldENjeU5oYVRTUEwwZERCME5xMGtlTXBMUThId1Z1SytZWmc4?=
 =?utf-8?B?ckRncHZuc0RFU1BqZEc0RlVkZy9Cd0pXZFVPbjNnSGV5cngyamwxaFh3SUlh?=
 =?utf-8?B?SDkvTlJtRHZNeVVtbE96TUd0R1NmN2l3UStiNDk0OUo4dFZ5dSs2VFE4TXFj?=
 =?utf-8?B?VDBmQXV2aU1KVEhsOUJHOEg4YjRzREN5TURwdVRCQ2VnTDRXKzB1c0UrSFdN?=
 =?utf-8?B?R3lrN29OeDlQc0pyczRVNU5TMHZxR3M2MTVVanBrRkxsVUVtWVNOdlFDaHhh?=
 =?utf-8?B?VVhzTjJLUkI2M0RJWjZINi9FYnZqYm40M2ZFeDVVeGJ0djlqZzAxcWYvN3Rh?=
 =?utf-8?B?c2dsRVB3WFRnRUJOdzZpakZvNm5pZzRhZyt1MjVWcGZPN0NkUE1jM3ZwRit2?=
 =?utf-8?B?clJGckpySkhHTmt3MTArWkl6R05YTVBSZ3Z3KzIrbWFmcFpDMHJJQzliRlRh?=
 =?utf-8?B?TjZuM21WL25lazRaUGtrNGhuQis4eWMxUm1qOUJvVkt6ZFgwVktTN3JlOVVI?=
 =?utf-8?B?WWRHaTRJaE1icE1IV0VGTEIrYzloVVBXK2M0ckZ3c29iWjRKRGFQeDB0b0hV?=
 =?utf-8?B?RWkvdlNkY0xjY1NYcmRnVGZTSmxmUzFCS0JPM1FuOGNkVERWR0tIQ09hWmRG?=
 =?utf-8?B?R3Fya1NiR016RmdHUTByTWlWbjJwbHY5K0R4V09MMDBESVVXN3RJOXBWd0tv?=
 =?utf-8?B?WG9UVks2d0s4QmZ4VGI3S0NLb2tnWWp6bzZPdU5HQy9HVTQwS3hRSFh6TlFV?=
 =?utf-8?B?RVA5eU4vaHM0SFp2VWVWQXU1TE85emJ1UVI2MzdCZXIweW5wSjMwdWpTTXl2?=
 =?utf-8?B?a1Nsc2llVTlaek5Hb2tnSUVJTmNVVGNPRnFhQW5KWEdMQlBWNGtYU0Y4akpv?=
 =?utf-8?B?SngveHE4Q3Q5cGZHUXBsZy9qMjhQQXFPdy9jbnhUVVZqWDNOWWZEbW1xQnV4?=
 =?utf-8?B?T0hmQlhUM1UrUnRSaStoRmRSOXM2U25lTi9RRzRoSVlFdTFpZG9SN0lVdHBn?=
 =?utf-8?B?aXByRFNMS1d6QnZWN3hBVjFGZ2RJdm52OEtzOGd6ZUVYS04zUlpBK0h1SWl0?=
 =?utf-8?B?bnByaCt5VEFlV1VieVd4R3NIRVFINjFYNHZtRVdjS3AzckJ2Ymw2OHRRQUEr?=
 =?utf-8?B?QXUwdDhObzMzR1A5UDVNYThJQzQ1WGlHalEzVVJOT24wb1JOUnY4Z1htamxU?=
 =?utf-8?B?ZmJrL3B6VGt5a2NNcVA1M3ROQkZFWStEbVlIcXVHa3pLakpiOUtsQTRhMVRu?=
 =?utf-8?B?ZGZCZkhTSmxMMlp0SWFIQU9IYXRhZU0yZGV5dG9NbDZsK0JQWTlsYmRVNWYz?=
 =?utf-8?B?NlBoTVd2ejl6MStSU3F6ZVJxL1FHMGtUMFdRZFRzTkxjVkVkTnB5UXNBb1lO?=
 =?utf-8?B?ZTZhemtQdUJxdVREUDF3V3A5ZFp3eXBrM252dWswYjFMelNab3ltMHdzd1Uw?=
 =?utf-8?B?RUwvbDhpZEFUL0pkQ2xGVFhUTS9xbGQ3K2dTZ1RmVUNRRU9iT2JjS1RPcFJY?=
 =?utf-8?B?b3MzTkVOVUMyaERubnFXTDdDdjhScE9wMDFmWlJaQ1hHMmhyUkcvMWczTFpD?=
 =?utf-8?B?WXp0MG82OHJrdlBPdzFtQ0UwVTBEYTJzSW5vRHhXaU5KZ1V2eC9VanIrVUFE?=
 =?utf-8?B?ekpZMFZ6VHN0QkZINXRlTFdQbmdJVURvaXJQSWswSkY2dm9XZGJUeWJGbFNj?=
 =?utf-8?B?MkFBWkVScld4cWRnd0p5NmdyQmQ4RFlkSWgxR21vRkwvT2dTSE5LMGgwdmV0?=
 =?utf-8?B?aXVNZ2tPc0pxOHZaMkpWNCtSZlNUZStZRWJidjNFYU0ydHBDOWVuOW90MVUv?=
 =?utf-8?B?Y2pCY010dDRFei92dHlLcUdDakJ2dmNBay9qQ0F6WHUvQ1pPTnlZVGRxcTdv?=
 =?utf-8?B?OEJwendZVkJQL09DOEVTTkxYRjhYUlZOKzVKeWtvek9PTUxlVHJieFZZOHNW?=
 =?utf-8?B?MXpBU1Vldk5CVGtFNXVLZFlTTVc5NThWdU43NVc1aEJCSU5mdzRmSDlqeWVE?=
 =?utf-8?Q?lnfVqVv7Fkd1y/rkz6YhKubWF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6GzcVQh7A6A8w2pTNEm/X0nphoQK8FDCg/nET4yhLzBNbh8vaijOr01cp8Nvy898nypruTkeDRES79z1JqdG1yesQXc2UvVyGeig0/CgTe8tnabK01rpuZmy4ceWo9EA/KjCqDzSSv+6ZX6rMbW4iElRTfK2kmNytRdtjK0h7BUmlU5Rcji6xl+zWnvF4JJBFaTSSKKoJJSW0E/T2eDYwElzMtzpENoad3O6LAiOHrogHdB2z7562KuDFL0ihZK9gWYKo+Oy/hQ3UxlJkmkNBkXRP3LPwOOijP7Ldb5lksRq/1AxzFO0/A2J0Yjt0CKRd9kl2S+1kucUMVnyoQJkaiZIcxPjlgJlF2DIVIxeN5Vm7JTiMVixVGLC5J+av4tPnE6uzAcM/1KDHfcD8mCUtDECyYlyqYEWhv/ARUUNT3293bvqKGIDz6+0BuDLIVmuHXKtWIC/wv9f1PpVgV4mxcZSkzYcj9aJbVi97VOiaUEH5fVxdtsLaCTa1ncpFjhXWUrtQCY2+XlSG7JsPKNV+QGO4k9knbmEB32GH9BLUJrQczKwOST4UhBdwuN8d5NtYTo+rRxfoYvPWCTtaJMfRWcIkjumH1qUMYKthUUVRQc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb1eb34-cbac-4bb9-704a-08de3e69540f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:12:03.8292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNgjfbtnaoEw6D9Bbh/gQYLbDv2eEAcSx1TscLS9bd9mzBOfYD6yyS722/rLDcwc0VHies/3FGf9fMNYYwqnNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7394
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180158
X-Proofpoint-GUID: nEGNheMwXghzd1pTjvpPfAcwdpkFpxMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1OSBTYWx0ZWRfX21Ifk1yyOuxB
 9izwE0X9wZ2xNPxjywsD1/tY314wx3CNJahrDol2XHcrPXJkJ6aq67hSlkfRrVxWrGCnp67bGPB
 PGRCdnhPpnoBYsVONtIx3mFIs6vdQfKiOUE2rzi1ECr09Mh+bATWvytvYjM5UQLWum9prSC2r6U
 yRNvOSqQTQKoTyn2e2J0kiUeOjDpOeQIAPLKD8fnS4OKgEIibTGoeCdQ4sD3mWWP5ctVUFt5nhH
 ebYfrXyaoOSH5+G1usxFHX9Ul4hD6/xuz16iAZfT5PvN8pW88ktt3OtMy2w+H1GNtp+Eb8EsrcE
 urmLi5Ajr6l3Y9zDZjQAq4bwf9nuF6j/oeP/xR3uXwaZ/YPXU/mQodtavesVhVTxBaw64jCS7D7
 /jZI54K/9k5q4JBcvhMjGK86WOD/QRVzQ4a59gU/19dcKZQKxWQ=
X-Authority-Analysis: v=2.4 cv=GbUaXAXL c=1 sm=1 tr=0 ts=69445208 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=RX4eJocsGzKnXa0c2ZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: nEGNheMwXghzd1pTjvpPfAcwdpkFpxMU

Two things...

On 12/17/25 00:09, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c           | 34 +++++++++++++++++++++++++++++++---
>   libdtrace/dt_cg.h           |  1 +
>   libdtrace/dt_prov_cpc.c     | 17 -----------------
>   libdtrace/dt_prov_dtrace.c  |  8 ++------
>   libdtrace/dt_prov_profile.c | 23 +----------------------
>   libdtrace/dt_prov_syscall.c | 10 ++--------

Is there also another clean-up site in dt_prov_sdt.c in trampoline()?

> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> @@ -454,6 +454,32 @@ dt_cg_tramp_copy_regs(dt_pcb_t *pcb)
>   	}
>   }
>   
> +/*
> + * Clear the content of the 'argv' member of the machine state, from the given
> + * index (idx).
> + *
> + * The caller must ensure that %r7 contains the value set by the
> + * dt_cg_tramp_prologue*() functions.
> + */
> +void
> +dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int idx)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	int		i, argc = ARRAY_SIZE(((dt_mstate_t *)0)->argv);
> +
> +	if (idx >= argc)
> +		return;
> +
> +	/*
> +	 *	memset(&dctx->mst->argv[idx], 0, sizeof(dt_pt_regs);
> +	 *				// stdw [%7 + DMST_ARG(idx)], 0
> +	 *				// stdw [%7 + DMST_ARG(idx + 1)], 0
> +	 *				//     (...)
> +	 */

Actually, the code is clearer and more concise than the comment. Plus, 
the comment is wrong?  What's sizeof(dt_pt_regs) doing in there?  Just 
drop the "memset" comment block.  The two lines of code speak for 
themselves.

> +	for (i = idx; i < argc; i++)
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
> +}
