Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E641A2567
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742245250; cv=fail; b=pIzYnHmbdNjS18RpIvjg3OIIgvgj+/ndO2DXvjs3JUlH2lv3qN2eQcywavE7LtOc9XfQ2ytvyBDVKuprEmNC44JLXg7DcrbCT9Pl8iN26tzeoe19/0CwiLH6DxHaXtYPdeWx2sR+aVoUV6k4tOFJ0aAhvDYXljdYfApKiIz2guQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742245250; c=relaxed/simple;
	bh=ISZNwPVUkHNVrPzN0hqh1zURHl1to2yMGrhV8mfAgUA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hukEn9TbudixrXYB12W5ZEht2E/t/fqLIYF4aIMMdrKdjdwyWj2QXG1Nc/S91I9jm3hGHHkGcTtbprDiAyTyC/Zjoy6wjRymtvX6zF+5L4Lhwby5HV8DE0+iA3DKFoFD/Gf9GH6bfgvnFADMFF+RsBIezTXwPIRNFqSNAYs/fOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iI1HS9QJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FtXkwY53; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iI1HS9QJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FtXkwY53"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKxWJA030366
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=COXUDsLUw+7QqXQTxoof6nOWZqY6pbdH0L9FguIDNQU=; b=
	iI1HS9QJnFhDrApV06M27FtwRbEXCeucdKLOjDI2bzx7IJ9RkvcYdotzFdbbX7jt
	S4S0+/S2PJVrvz8Lr76H4gzfhx8Kv96RikOP6ggGO8T+d8L6nfPDlz0J/h9/PASu
	oAQ47VUW1izgspEQnWXNviL1nq94kHqzcC/hfq15ShdsSODB1kOUWzhMcL20tgPe
	WNMQHvhrPUUlfT5or1eT///iy6mrSuiKPhrSgf1tNKDDPxHocjJT+K4Ky+iXQWYT
	sUrAFMJATfWRO628ndnbhK+t9UXrUOkzmfuw8HBMT0KYeJ8Eres+2XT1no0zuESq
	mdVqpcMsnNqBCnv6rYL6cg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hfux1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:00:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJAIVZ018459
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:00:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdj701x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 21:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd12hRg7leeAsgHN+yI/ubQIr9JQpmF2t0tUNE+9n2gdPb8OYaxdAOMpYtVov1tpE3cBn78/yQM47VpqXXwsQrzgiD/Ym+o7CXvRABbNtd+rOdxmtW8EYkrzFSQy6qdwghZOV9wPaMvAcx4gWOqSKNn3julnspeqrR4HK1QmRpqN+H3DW2EHINW5fAJvDSIiiXhNQlrv5b3hwDyADcd3QkAyWA/TRxlgXliE9XK7Dn2MmN+hpBLWpkakAxVsE6XhBjszdjHBO0Mc9qh/ghrO7E79T3Y+ynJZDRfmaQXivYSomnJHzq8yhbjLm3XJMJDLzUJaSPyieT5RBKWhECvEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COXUDsLUw+7QqXQTxoof6nOWZqY6pbdH0L9FguIDNQU=;
 b=ugvGiqekGJrcx5O6zVl+bYk1/QRYLtiBGmqwlnvg5+e4VzrDVD4grZLbe6RjaGQzaWOc0SAOcMbpN5Aea9kbSRYReW/78qL402IIozIB6ZBCMnvfXkoIE12Uyclov/OyU568Jmd7DT4R/4UwcL1FGtwZM89fVLcE6fVRnQMfFhw3RMf2sF3f+ahIBjafkqlAN23SfRjnOj+MNk0rSoPEpnp9b6cvdy++AjaKazi6l2cd7lJONmRUL2XmJk/z+YntdFEakFKpXM8TXnC9ibbHJgc2EH8+gmbbvNYrUIMx6Bnx2Wxu4jaCw0/ZMFtpfArYkCZFXwVpOlResC7exD9p0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COXUDsLUw+7QqXQTxoof6nOWZqY6pbdH0L9FguIDNQU=;
 b=FtXkwY53cTeHE0PaSq6fjOtjRCAabn3lW/iGSdGyzREcXpTH7EFw9uhKfAaZ2VWRUvKUc8RvBhafj4uchlJGd8LuKpjZasBg27jbhvS510YJBMEYhesLcv3yasOp6hjdlcHA6i/JGb4rex6yegT7+s8PvemBDLq6+NeAL5WvJpQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPF831D4660D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 21:00:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 21:00:43 +0000
Message-ID: <a919bbe3-db2b-5109-a6cb-e7a2745e41b5@oracle.com>
Date: Mon, 17 Mar 2025 17:00:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/8] fbt: performance improvements
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-5-kris.van.hees@oracle.com>
 <a7159b93-884b-9911-b736-f500b3b8a6de@oracle.com>
 <Z9EcukBSIMGcxe8Q@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z9EcukBSIMGcxe8Q@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPF831D4660D:EE_
X-MS-Office365-Filtering-Correlation-Id: a081231e-333a-43e2-8387-08dd6596c844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE1oK3lYdTRpRWhNbTREZXBFVFhkeWpMZ1pTa29ERkpiRzd4c0VOTFFpb1pR?=
 =?utf-8?B?SFd6djRIRXp2U0ZSVWdNbmhlTmprdmdCd1QrYkxpdmYydkVwZUxZQkNrTTNQ?=
 =?utf-8?B?eWFJWDBUVFNQd1dabGRQMzNkSlRvcXlITGo4TWYxencwY0NtaFMxU0VraU1y?=
 =?utf-8?B?eVF3ais2dUx3UUxJeXFWaXdGNG43YmRtV2hlOW15bExIdXoyZ0o0cmpvNVJi?=
 =?utf-8?B?cWdxakRpZG05UEFnRWdSa0Jmd3lJRXVrVXgva3g1OXlGK0FaTHlnV0VyNlox?=
 =?utf-8?B?TkNVbGhmMDZaOHVkZGJrM2toNVFmQzl5OWR5WTVmWFVBdE1TL0R4S2s2RENs?=
 =?utf-8?B?NWhKZUtkcFhkQU5ZVFZOV1FoYm55TVcxd2drMUJmWFphcUJSZVRpNlJRZkhY?=
 =?utf-8?B?TTM3VGhkbWUzMmIyWFV6OWZUelJadzZKOU9ISU1YNHc5UHhHeEJqbm5NZHlN?=
 =?utf-8?B?NUZnbDRWd1RlNExjSTRjaE5qdm1KeVF3QXp3SEQycnBjVVlhRUFBc0M4cHQ5?=
 =?utf-8?B?TDIvYzRNTkxYR3NpSUZKL3BtYUo3emRRTUFnVktuVDJSMmdDZzZYR1IwcGJh?=
 =?utf-8?B?N09qK2ZhWmZ3cGNtODFnQjhoLzh1a3VIaFErdHBHditNUUJ5WE81MUFlSWpY?=
 =?utf-8?B?YmovVUFHdGhVVjEvMWhFU2lQTTdwTWMrNmtILzBKeGpqRGc2aEgwY25UbEVa?=
 =?utf-8?B?YUFpdUxOemRtYTdRUFNKZnh6VVpBNENwc2ljSmtISTVoOXQ5ZHZURUJwWncx?=
 =?utf-8?B?VFFKaTViME1mM0d1QVYzbnoxeWVheVpjVmZTT25XaFVpdGR4VDlOT3lXREsx?=
 =?utf-8?B?UVREMHZNZ3R1cFh4UHhBZ291cWszU1NQU2RQL1hOVFdCZ2NlOXpYRGNtNXZj?=
 =?utf-8?B?RkJKTjZjeWcvaUw5VC9WUkJTb3cxYWlIaUdEK21GQ2NNMzQ4eEV6NWJSVk5o?=
 =?utf-8?B?OUJRdW9jTU5yNUVXQVlhNGMyc282d2thNEE5cklmL3Y2cXpyZHNic1A1RkJk?=
 =?utf-8?B?WUZxM2psZUJTYmwyWEhHSzZmckU4SS90V2RGUHlEemZoeUhaeWZhVnlLbTdC?=
 =?utf-8?B?Sk5Ub2FTdlhPcnA0YmVKbHhCaUFCUnd4OWRXMDEvdTVTamNBWHZRckdwZk5G?=
 =?utf-8?B?YzJsVXRYVld6bXUwZFR3WEFJL0FlbXR0MUdYYStVV3Z0dkVNM0VwZ2w4alIv?=
 =?utf-8?B?c00ybll5TnlLaGZnSHR1Zk5tWHc2MG9Ydk16WlhIOGxOejVIalpFN2s0VGIx?=
 =?utf-8?B?ZHR6VWVtYjhnc2JDeVp4UzI2cnM4SDhGNk9HZXpuMHB5eTZjZjBJNkNUK0Z1?=
 =?utf-8?B?N0N4aWhXSHVSaUN2WEYvT0ZvUndqT1dQRklXU2lFWTh1MS9RL3Z1Zzd2Rjcz?=
 =?utf-8?B?eXZSUnhiYjU3d3JaNmFUTXZ5dFQrQS94N21RYlVCVkhraCtUZGlrSjdZT1pp?=
 =?utf-8?B?WGJjbFdEQ0pFWHZHWlo4UGRtZ0h4eTRMeWl0VmVSYTVmS21uVzdpNzB3S1Nq?=
 =?utf-8?B?K05tdU9scVFDSW9EWFFsYXBrUHpjYUMvK0VWZFJyOXFNYUlRS0xxM3E1OVZm?=
 =?utf-8?B?cGNYWUpxM3NQSU44RFFFOFBlNFpyZElLMzFjMFNpZjQ0aEhqbW1Oa1ZTbnpJ?=
 =?utf-8?B?ZUt0QXArN1FiRm93MmdrNDBJeXJaMnlPdkRzYjlSQjh2dlhtYTRWaEg0NVNh?=
 =?utf-8?B?SmlabzA1TE04K05rZGxJQ3I0WlNrS0Q5WGlZeVVNczNPcEJFcll3VDUzVXpy?=
 =?utf-8?B?NFdFOXpocEVzSW5CdlQzam9IOWpEUE1YYk4zdmtJTWJNUkRHaVhCQTFPMnBq?=
 =?utf-8?B?T2NIdjRNQnRKTGhNeExrWDEzenNyRTB6cmF5QmszOVkwYXFqNDNSbWppOXMr?=
 =?utf-8?Q?Tihqd03ZY/GBp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVpnV2JqdHNVTFpDN1BXMHhqV09LdXpmRGd0UWNkMEF5WEVsNUx4MCtsZEJH?=
 =?utf-8?B?ZU5Ha2doT0lZZkMwbWZqRlZyMzR6MXFBYzUzK2EwYllXVTh4N0RMZFBRdVVD?=
 =?utf-8?B?Y1RNS3FDY0JoNXNSa25DdnBvbjZTOE9iMEhTb2JVWE9GcDFSSXNDQ0UyRU00?=
 =?utf-8?B?R05xRzB0VXZZRWJzUlRscTVPeURCUSt4M0ZFM0gvZWp5aExLMXJabjNLQ0hZ?=
 =?utf-8?B?TzNmbi8yc1VUMWU5MkpaMHFwd3FYWmttRDkrTldGY2w5VXhPZGYvdndzT3py?=
 =?utf-8?B?RlZGVW5aVDZPdy9BWm9PRjBrSVJOLzBQM3NON2pnc3hwSWE1OHBCckVVaTdV?=
 =?utf-8?B?WjhlYjgrNHVtWFlla0NFTXdtM3FxN0lzK2ZyRVcxVERZdWluZTVMLzU1eFFn?=
 =?utf-8?B?MkNpTm9XaFdINytnVmhqbWtDK0JaaU51b1NCaTZWdlF0VEdIZ05ZN3dYMlNW?=
 =?utf-8?B?ajdjY2NGT01tZTBOelphOUdNc2tvbmRMNUNRUkFFcjJMblplZGtjZ0E3VFFv?=
 =?utf-8?B?TXl1aGw2V3VSTmJLdFhkeU1ncU5QWUN4aTlDODVZZlhONHliTmJLR2RzbXAx?=
 =?utf-8?B?QlZmNjlHLzZpTHBqMzNmSDFiM0k0b0dzWGNhQjJCQ0dOR2N2VGRPZCtFc2NB?=
 =?utf-8?B?Vmw4Mk1obCswME9BY1J4NGxEYWxsOXFndWtnYXB1L3ZaVTNqTnNUZHVWdVZK?=
 =?utf-8?B?d0p3WXBPL3MxZjc5Rzk5dk1IYTVHdC9yKzBQQzFsYWVDQlRTWVBHOGE4Rm5C?=
 =?utf-8?B?K0tiYVlvVFdPNWg1cWtqYXgxcVo4Y2ZDM2l2VlJiUkVVSDM5SkROZHoweTJM?=
 =?utf-8?B?Y0FFRzFDeWs0NGxGK3ArTHFmSnU4bElEbHA4enoveXFYZ0l2alhxOXBIQ0pD?=
 =?utf-8?B?L0pJeVlMVXQvMmp1emt6TjQyQnNWaFhCcVdFa0NsSmx1Sm1ZNGorTE5IUHNH?=
 =?utf-8?B?RURDR1hBTElJdks4MmtmcFV0Z3RtNjV5WGliYjk0cXhNeDkwZkswN3J6NVo3?=
 =?utf-8?B?RzRmdHEwbVBYNEZrc1JaRE16TUFUanhiSFlVUEdJZERXZFJWZ0RrSXJFd0lz?=
 =?utf-8?B?TmVOVXZST09iek1EeVJhRGQwTDlVVmJWODFPY2tMY1BoTThRS0hGbVRVakND?=
 =?utf-8?B?NWl2bTJsWDRpenM0T2NjUngzTDJzS0JSMmR3RnRsTHdUNFgzdW5PVi83RDA0?=
 =?utf-8?B?Q0IwUHZJVGFYTGd1ZVFyOVBCaElIMXJDNHBnQkhtRkZPQWd1S1NJMVZKU3VC?=
 =?utf-8?B?WGNTQnZKVGpmMEloTjZjdFczcHJvZU44OFhHM255Vm96eEJweHRJUUtzMnJC?=
 =?utf-8?B?S0N0WHh3eFRwOEJmZ1ZObTlYQm9qbzJYYThHcDN5b3BLbDZEM0wybGtwNzdQ?=
 =?utf-8?B?ZXZnUjlzSU5KeUNWcUR1bW9nK3dXWlBDcDJ5NlNaMmRSdHVFZmt4NVZSK1VU?=
 =?utf-8?B?Y2QvTFlSSm15dU8wWTJQelpLeEQzZ3RZNVB0WUZFZVdreVdaRE85SUVpaWto?=
 =?utf-8?B?V2pKT0tHQXZ4L0ZwZXc2UGhZU3N2c3dIa0ZTSkpqd3drS0FRTjR5WU1GSXRi?=
 =?utf-8?B?UFhDVWdTQmVRR0JaSDdLZ3lnbXFEU3NIcTU2MHdkdGdKNWE0TzNDV04wMWk3?=
 =?utf-8?B?eGljbm9FYXBrZitKNUpkTTEyOGdkZjdrb0N6V0tQc0tjbFRWVFE4MDdkSy9r?=
 =?utf-8?B?NEdJWkZRdEhCSk1mOVFKREFhRnZnU1lDTXFNd0xoczZJREtpTHJGSDRCWmln?=
 =?utf-8?B?T2dRMmpRMzVFZWlzUUFNeVlQT0hpVTJEVWp6WWw2TG80YzVVeG9nU3N4NzNR?=
 =?utf-8?B?WjU3RHVsMFBqOGRHelBDSmxhUFpMQkpINU16bE1uSjhWTGRYS1hlUXNCTFI4?=
 =?utf-8?B?THdMT2pMeWhJNU0vKzVkQnlWaGdhRGRuWkt1bnhndFFBa0g1dndPU0JSN1BT?=
 =?utf-8?B?bWhxMEUrdGxPa2ZIRkRubjdTY084dzRkdDlmcXIrNStMcE9TZURYZmk3eWw2?=
 =?utf-8?B?QnZDeWZVd09uK0tta2YranVHY2JEajgvbGxvaURrVlZjRFN2bGxJZjhQZEw0?=
 =?utf-8?B?dXBGMWdsbmQwdDRkTU5nUlNmODR5R1FXZkIza3kvbGRaeHdPKzNhdCtRenZI?=
 =?utf-8?Q?xp4aAi+8F8Z9w9Lcyd7hwNTr6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jyPv1VLy/YGDQIfWAhR0KL+Cz3opNu+c5iAlClihp4/BuP7KKC3QtmuCXTMNTklwbq8mcWAnvWXb4k/ogG4Zpl2vF8fPFuMSbDlPLTEWWyu3aY42xBND3TlItR/7m4SEBIKjsZov+IowV6nW+i12Kh11/tPWO7XQ8vi/Hjm+yjCmVeCsuwRdWWhyVVh9W/5n7W2PfijnxHYFTWzYzf8E3Qu+fNU9mXydS1+dWNT8G/xyMz+YSb0Nk9hlT4G4ZIl1l3Jj65a0avrXzbArTBOLhYUH5bZcLWkkAwQUeS800X+JRVRtSnNncPRKcuKa2BOBZBMUvZjbtCslqCprr9btJv0Pu5UyPDCgv/WuTsRmhXitiNig1pIkOG1PIdg4XDzOBHkp+POrVYzgFLrbqKCxo5AUYqsHmnexzs6SyviMLhHPfM+m08UzbfzhAg142JYv38QCJkt572or5oDDKT1pSf4co6mXwV5HoVD7pzJ4JTMRRWxh4enHPlJHnYis7QRVF39ziVTS/NP64dGeFTIICL5kZJcZOOCdNAq0xMy239XQRPLB0bNBg7bCOtqikPokscBxwXwhW80HN01tzcm9EMmk8l27ivLeKNBIE9UkCWI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a081231e-333a-43e2-8387-08dd6596c844
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 21:00:43.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0SfKSZ9cKRmiEdgAe7jRBlq/bXUW9CTQEkfULf4WQGV1UpoefXriaDm+31cTB7qzG/506VpYOnmkjjBJ+VALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF831D4660D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=961 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503170151
X-Proofpoint-GUID: nlPf_45BWc-SW7ssq5cS5lDbf_vlGV4d
X-Proofpoint-ORIG-GUID: nlPf_45BWc-SW7ssq5cS5lDbf_vlGV4d

On 3/12/25 01:33, Kris Van Hees wrote:

> No change should be needed to the lockstat provider.  You uncovered a bug
> in my patch - I'll fix it.

Just curious why lockstat even used "_*" rather than "_slowpath".

> Incidentally, I also just noticed that dt_modsym_mark_traceable(dtp); is being
> done too early.  We only really need that to be done once we get to looking at
> function symbols.  I'll move it - that way we avoid marking function traceable
> for probes that cannot be FBT probes because of probe name or module name.
>
> I'll send out a v2 tomorrow with that fix.

Okay, I think I see v2.  Just checking:  does it indeed have 
dt_modsym_mark_traceable() moved?
