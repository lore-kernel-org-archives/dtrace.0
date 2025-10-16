Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA82E03FB
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653751; cv=fail; b=cHyNDGexKrYYspLSL0VbQndMnfxY6YIWjWQ6xDIVHUa98x5Hx0UO/F7eNhHmVxRVQZ8qT3EcBw4VDFaaP1WS16Uy2W+GXNMAoHjQYa2Vq8Rg3TAS2n+cbQdtKcvxRL6nTTnthtXzSZxem9QzILNeyYrDJWkHMjSC/aySf+gbpKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653751; c=relaxed/simple;
	bh=SXScyFyucwg9t5G82LdY7VeIryNkYHHtkws5uXTyP3k=;
	h=Date:From:To:Cc:Subject:References:Content-Type:
	 Content-Disposition:In-Reply-To:Message-ID:MIME-Version; b=Y+YJ55xNqI3M9El50pfp8YumgcUkjL7XoW8lKHhSFDO+LoVxQ3XXKkEAC7VPlzJgqWhWWw/oKLfAYxix2PnQ+LDaJQtEyfbsJV9nmSseDt5iIteK0yzxj3QauqkWsMAxtSLv1Bh7u96FL2wLXDfZAzjCK96tmp8i3xsFZd3LChU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NqFMy9Jq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yJ2dDvlI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NqFMy9Jq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yJ2dDvlI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLu7gu008207
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SvfjaSp2CHJ6FyoUoRweOcIvwHQAV/TdeiLyAA/Q8Qk=; b=
	NqFMy9JqcTiYYG0KRZRtbibYJLMAFfhoRK91DzrMwWCF4vEtqvpDVV2cu/RDfXq3
	W1Zeef/29rOrRbeY26fbLi8rzOioNaDQZci0ZIgEiLZtqThNe1Ij7W9ekzqGUIkV
	Xq/Fan/949foMpbO0ovmninCU59RdQAmhjMgBCJtrGC8LnujZr/KAkNqm65jAswI
	s2bnQH646zXU1V3SE4qb/QfPjGL8yldZXyA10IzpF26bDnVFKtgkhvJmsFUY1Tqd
	MKfpjgGhgp2C5Q8nR1g6x0CVgy2c+Lv74L/TIDbA23k6IftNKwasBZC9kAYSlLnK
	tP207/3qKC9IhNpARcW9NQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdnc9uuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:29:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLgmjW024760
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:28:55 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpca5bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:28:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLlWMhLQI4BRMaUq1vzBmACAng3MwCd+E28Zs+oZujaVqPSge8oY+C8h0/7EcasyYBdSlwtJsLegFu1Sl2ghp+aPfCxs8FdIxA3zI2LFiZNB/XERLi32YrvL5hLZ2ng8ij+rqOw3fgbaoHMs0z4YiUYcuj83oRY3ALbynWdACYWznEAyQBsx7pERW5oq4V1q275bIW6KY7TahM0ON9PZ5h2bT57ALiRJQYGBeLxjlLM37PaGNUoFN32Ngc6P91kCZokzTFi2KSlQQzHF8mEZnEpNh9lU7+vQH7wiO8yJO1B1b3syjP5UulMRRcHQ3Bksbo8tcZI5gKRv4nPEupL6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvfjaSp2CHJ6FyoUoRweOcIvwHQAV/TdeiLyAA/Q8Qk=;
 b=dHZ+ltUjhbVgi4frtCJlczR10TQH7fBwPzLMF0Jn36B3YpygStjnmVZhVWD6a4XqPVbp89vb4aAoDZGh2ABI+onQ+2egvalTvbvQPut9EOCmQh4wPCHA020sUYZJ2Np6/pNcVjwz2oiUsQ09u8SnvZw1Vc5fqV2xcL/yQfRZ5bvUrIsZCnhaqkFwBbE5NPVMmOGLz0i26EtZJcwLnUEuQzv4e/caYwbbCwWhJkgRWizRi7ebxg02Wa7HDeQ8ydLBMoZBKGVq/i1QTUiBwmqgpaLZbJB8jS9Gc9ZTRPyZalKegKacBWTXHmh+cs9sHp1tAoq4T9+XMtxI/4B381fZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvfjaSp2CHJ6FyoUoRweOcIvwHQAV/TdeiLyAA/Q8Qk=;
 b=yJ2dDvlI9d8UcEtFn5QMNcEG6OJRqNhAGJduNnfNbYJQzVYCSIS4lqSXNdCiZE60YPe4qSpqCDOr4fpfF2wyHBuc3BiX1fEoAs9ySCCirVY6H5ahU8dSGJVv3tW/RAA0dHU/4GaDgPFdt7/5YsRJXU4lvTgwy+mwUkPjQGMZjfU=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 22:28:52 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Thu, 16 Oct 2025
 22:28:51 +0000
Date: Thu, 16 Oct 2025 18:25:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Bruce McCulloch <bruce.mcculloch@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH] Update llms-txt and add README
References: <20251016205330.4055747-1-bruce.mcculloch@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016205330.4055747-1-bruce.mcculloch@oracle.com>
X-Mutt-References: <20251016205330.4055747-1-bruce.mcculloch@oracle.com>
X-Mutt-Fcc: ~/sent
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB39879FA7FD793F7F152D2677C2E9A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: f843209d-e96c-4335-3c24-08de0d036208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REZWaU1xSU5VMjlIeFFRY0xOSk96SE4vL0ZQVFNMSFdodWVkYU1abDIxa2R6?=
 =?utf-8?B?eUxzNEoycDkvclhCNWhoWkEycXgrV1hnR09Hc1l2NFcvRWZFb01BK3l0WUds?=
 =?utf-8?B?YzE0YmR0amNOQmJkd0pLZE91Z2ZTbWE0Y1h4UG1Meit6dFd5emVVTHkzWEZL?=
 =?utf-8?B?WFYwblowZlA4eUZobzhreE9TYVZYWE1HOFFsOXRQTkxaYmtQYVAyelo1TG1l?=
 =?utf-8?B?WWhkazBHUEdSNExVa3QvSCtoWmJEa2cwejlzOWE5eER6d1cwVzczN1UrNW4r?=
 =?utf-8?B?OWFaVUhLeXE5UHMvTkVLZjJ4bFp0b0I1dmtiWExzMDVSVjRiU1NqQXN3VSsv?=
 =?utf-8?B?UzNzbkt5OEEzRDVkNCtRQ3NZbUVRcDgrSU5mSitxQzRpb0dLWEZ4Y2VYelY5?=
 =?utf-8?B?T0F1R3d3eHR0b3hlZW5lSDJITmJlVS8yeXZPSm9pVXppSTBqc1AyaFc0OUFD?=
 =?utf-8?B?aW5ZbytlU24rdWtQZjBJdGtTMFJiV3pxeEY1N1QweTVPcHpFZVc1Ykl6OVly?=
 =?utf-8?B?K1B6cU8xdCtrb3ZhUVZJdVptazJWbUlHNE9USVNXZER5M3lCWlB0ako2VUU0?=
 =?utf-8?B?TzJNUUt0SmN5Ym9aSFZqYUtXMWZRL0k0VzdNWUhoVjQwNno5RG0xWnVUKzk0?=
 =?utf-8?B?N3hkelVOZmljUmt3OGZTOFA2VWxwOEJ0cmpqVXBTU2FtWm95cHdveHFYUkhI?=
 =?utf-8?B?K05mUG9oT0JLL1BTZXUxUjlrbzNSSW1pdW5mNHZVQ2RxbW9UWFlFNW5TVU9M?=
 =?utf-8?B?Tm5Rdk9QL2EzNTV0WHk5VDloRGh0MW50U2s3RlBvelFVRmFPWGZaanY3STB4?=
 =?utf-8?B?dEVtWmIxSXBVeFdBcHcrVVBub3dxdld3WUhNcGd0cEtMQ0FOdk4rM2xYNG15?=
 =?utf-8?B?NC9HWkMzaTNxcjkzYXdWdkRPdGhZNWxndENJUFd3SENnTDRnNEJKVENFZHZh?=
 =?utf-8?B?L2dRck40SWxGOWhQZXdPM1lZdUUxeG1XcUJRaTcza1RHKzN4U3JpQnRyOXBX?=
 =?utf-8?B?SUE1OXZPVFkxUHFLVHMyUUJOVWhqV09BcmpFeHhIdVRBVFNlWmhab0FINzU0?=
 =?utf-8?B?RXVrNTd5VU4wM0MxTzRMWHdHbTBMM09Sa3IwTWxXdStlYlppV0wwMVpZRlVX?=
 =?utf-8?B?ajFNTGpDS0JNajk2NTRoS0VMRTdVZ3lMTDlvS09nRTduUEtmSDBQekVLOW9o?=
 =?utf-8?B?Ynd1bjBaZ3dMeVQ2dTJpM1ZRTnl5eW1FQWVYU2lnKzlxVkZETUwrTDBySVZ4?=
 =?utf-8?B?bHV6R280REt0cldUd1ZxMXZWUHg2UDZ2V1piTHg2dklRWlVqRUw5QkE0eEFk?=
 =?utf-8?B?SVBCU0lWSUFJUFRydkZOU1QwTE5VMnMzMlJWSFRhMEdva3Y1ZG1icVZHTnUz?=
 =?utf-8?B?Z24yWVZXVGNjZms5TVM1ZnlRSDJhV3JvMHpKdUdGaXJ1ZWFvZnkwRnFOT0lP?=
 =?utf-8?B?ekgzRFNQQ3lrNkpJMWRHVm5iMzU5cHlqSjc1dmhjUDE1QzFMWExHcnBDK1Nv?=
 =?utf-8?B?M1hIdTc5NFRVanoweDZiVXZZcVBxWG4wa2s5aVJtVmhFS2R6YXRVMFF6eXV2?=
 =?utf-8?B?bDdwM3l3NU5lNlEvQnFkcTVzUDgzaS94NmJlOFk0cmlYbDFtUVJ2TG9NUUtp?=
 =?utf-8?B?eUR1dkN6cUMyNkZuOWk4dXNqWkNybE5SdmlhallDWVFaN0Vud0cxQmRrZk03?=
 =?utf-8?B?SnIwQUwzY200UkE0U3dtQXErS3l0VGJkTkxuRHNpQnFwdEQzeTV4UUh0bk4y?=
 =?utf-8?B?OW91WFU4bE1nSlZMLzFnNm1yK1M2REpQQWRXSVBhUVRJYnFzQm1xL2FnNE5t?=
 =?utf-8?B?US9mS2hPOHN1eUliSkdXWU1kK0hYSHpnckN1YlpubStwKzVSMzlUcFRGdjNj?=
 =?utf-8?B?aHF6djRTVkh3N3pidGFSd3c3UGJuL1BZSmN0SlUwa1p4cGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1Y4ZTJHOVFrSHVkZnFaZHpGN0hEUGRSbHVDa0UvVm56MG9YTklVVXV2WDdY?=
 =?utf-8?B?VEVtQXBpME5uVXZaWWNJOUNHWGZlNWF3SGpzLzBtMjVUcDZMZGFzcEREdjB3?=
 =?utf-8?B?aWFjTXVyb016ZGVtaWZldWt5QkFKMWsrem5SbUErVjRSMFZFWFZ4REJzdlAx?=
 =?utf-8?B?TzhocDdrNHFOWUExMU9sVkFnNjBtMHNib0I5OVVBVERncFg1b0pKaG5YeC9u?=
 =?utf-8?B?LzNMQUY1WG4vNnVZMkR4MnpnWFMvMW85aUhaL0s2cEp0bHo4NVVxN1orY283?=
 =?utf-8?B?dEtib2FicVpmYUlzOHVkTlZQUjFLeUVnYzlOWGtwT2FiM2RuQmRCZy92eVVk?=
 =?utf-8?B?SnRvZnlpLytOeGhlYXl0MTBVWjBheTNxWHFaSThyUHMxL2M1MVZYakorT0Rt?=
 =?utf-8?B?aU5YTFVzdDdWakRhbzVFcXRGSzV0R1ZNbFFIeUx4d1h5MERERkZsMkRlV3JV?=
 =?utf-8?B?K0xnMGpSYVNqaXM4K1p6SUYzb21jNlUxZGxRa0Evc1NnZDU5QWp3RElTWmpj?=
 =?utf-8?B?MFd5anQ1VmFKbm9pWVFqVFhiMnNJbXFLUk1qcm1LY3krTVJST2dvb1g4aTZz?=
 =?utf-8?B?VXFiQ3pCS2l0LytiOTBBNE94RGdzS2lUZW9OeSthNFZtalNZZ2Mvbm90aklr?=
 =?utf-8?B?R3J2d2N0Vkh1bW9hanRLMVkraFpTMjNSY240ZUIrcTJKV2dVejYyTFA2SCsw?=
 =?utf-8?B?aXgrNm4ramwyYUt1cmJxK3BpWEJ0bTJtVjdYcUpGUnR1SnhNQXZzOEdvajFY?=
 =?utf-8?B?OU1QL2w0NnRhQ0FPV3h5UkVKRVZlWGsxUXdqOHczTyszY293OGxrcHd3T0dq?=
 =?utf-8?B?VldrNmtjUmc1UjRVVDhxK2p3YW1XSzJPMUlMaUVSS3JIaCt0M2xmL1F6N0dT?=
 =?utf-8?B?M25CL2c0eFdvYkFGNXllditWV083RkptZmFVVnBCeWVqT2UwOGhlTCtNMXJ6?=
 =?utf-8?B?Q0FuZmYwdW10eXUrTnI3bkhjRHltVjBnTGVHUi9mb1NxWmhGMGhuZjMwSzc1?=
 =?utf-8?B?bTQ5MXNodDlGN25FZmx6TFRHeFFPZVJRM0hiNkx1Qm9vRkkreEc4SjZZRGpN?=
 =?utf-8?B?UzIxWlhvc096OGlDLzZTWmlFbmRIUjhHd3pUMXdXMkJxUGlzbWw1bk9oQnZK?=
 =?utf-8?B?VTZsSG5MRTMxT3dINFNzZEM1OStybVovRS9WRE1nUUl5N3pXaDZrWTg0QlFI?=
 =?utf-8?B?bmZRQ1FZOVpiR0YyOU83T3pqVFRndVpuekY2Qi9FdnpsalVQNkNBT2hYN1Fv?=
 =?utf-8?B?dE1reG4zSWxmZk1PVytTdW04elpKM0dQOTlWNEJmdDRCRnA4Vy9GTkdXN3E4?=
 =?utf-8?B?ZktsUSsrTGxpeHZOSWtUcEo4K05iRTkzazQxMDNxQm5CZCs2N0EwdWlvUDYw?=
 =?utf-8?B?NCtRaE9EeWJWMFRlTkV6Nng0VlNLWDRJMi9IUXNyV3FmVWg5am1SajVMYkVF?=
 =?utf-8?B?cW9RaWNPK0tqSTFtdFJ6ak84dTJST0lnOG5HVUtzeTlzZEl3Mjl1Vi9hanhk?=
 =?utf-8?B?T0FPanJZcmNGczViSEJvaDUrdTRuekhHSVRWcHd1Vjd2dVQvb1JPRk5jalFD?=
 =?utf-8?B?c3JxMnVNMnZLbHc1WWJWbTZuNzFyVEN0UDB3ZlZ2ZHo2Ny9mQ2ZmUGxPN1FT?=
 =?utf-8?B?cU52R29VUWlPRTJoY091cWQ1VTR0VXRlbU5EVkwvTStZR3V6cFkyQlMyN2Rt?=
 =?utf-8?B?UFMyWkNISEJmK1ljZ21OWVJacjB3bGpNWVZYb2U1eGdwS3dGQXpOQUoycDZR?=
 =?utf-8?B?ODRROG1kVUR0NDRwdGhEaDZnSW9oSDlDcWd0L2ZpNDljMldQZk5ndGE4RUFp?=
 =?utf-8?B?VitDb2FJNWdKUk81RkZuYVVYQlVRcFhORDh5VHZ5RFFPdytzZXg3MGsyM2kv?=
 =?utf-8?B?S3hJRGNvTUpIeCtlMVhhZVhhZ2hEaDFGdWpQWTdIMk9QRDN3V0lzUmNGazJo?=
 =?utf-8?B?QzJiaUM4V1ExcXpDeU9zOTZSbGtocUdJRGtNeXVKb3E0cms0NXAydmk1Y25K?=
 =?utf-8?B?T1RyOEVxZzNGTnlZcCtxb1B6T2lwdlVwL0tsNncxc3BXZHIrYXZpNEtQRTd5?=
 =?utf-8?B?QS9lYzhyTWYzdzh2T3NUeWhpT0lwMG9IYXkzemVKU3pRNnFRcCtOR2YyY0VC?=
 =?utf-8?B?SFlJWEtRR3FxeFZGWjBuM3lTOGJxMDhtd3ZSZXNzTktlTUkyc1J5QzJSN1FG?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IRsL6uvGy0nY35T8s//wqvCEqWqVFEMk2d8b0e1WB5TsyJkbzLSLbdsec1zNvJcu4uQjMOoVmmfAY/FOglcbwDYXo/kHqNBDd1yvwXVnHiDZUgZvSqQH7ZwadbuDyj0CC0WB+uNUD5SJ/sIB4JU0pnwDPTwlFXCUkkw2Y/+WKa4s4u108yk+7HnwV+X8FykKaIVDbGmyY7YbG8BVPs83t7YyQCKxTzakD1jNSHvwSyOK8w4XVzLJ//6gjWi7p2h6EUpOq/x+w7Xj4QLHK4t4hG6PVvPmGA7QN0TQ1eMlm++GDV9qvBMBl89B2CxaAvLAtiH1/s1DwsXYIogJqaCFZZUPLP7SY2NN5PkdansNnSW48SEQrsQ7GmycjY9Q0JGfmRIzASisv2wK+zAnJlojtT8s0yfV86iwL4ik+jr2CNk3/OJfj6MJdFTtWto9mnm+4bjI1C2AaKZH35P4dY9pv7+ab6qWjt2kKtgqalD6y6EGtS8gsHBFJ/T+R1eUzctL+Jwp82x19EwgUmw2UPijwgT0RIku7F9kVOMOayIuAOY8qIjFIcApdRuCkp4DJ0Jwd4bK02OUhhFhOcmYQEYxlbrz4CsME6/s0DNtoMFDV5E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f843209d-e96c-4335-3c24-08de0d036208
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:28:51.6144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ey3tLksIgyf4xMETl6uxxcb1xMIvPXYzmGiL01RXMx6skRXelf84v2/fj4wWNSbLo47I0UFhZ4Gz2ZWkpGgCPBaF6u1LE0Yv9iCl9R796sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510160169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX6m0cEjbOVWBR
 UdTan5mZ/dT6nBiwV/6Lfg7nZO1np7Utgh0muQ1uEF7QvX1k5kYzGqnu20sd8kiYflYGMNb+gtQ
 yJvcfnXOXpG62UR+fU0PLVGYoqUUtyBoYQBDybo4a0gBxmZpD0+T7nWsWTXw8svueyqFHrS5q2E
 FMjAzBRQx0HbEo8sWAsKbS7n2XlpCaFtKx7bCmILVE2nJTKpv9ko+0n/bRkNdcepXenYpAKyBM4
 VnBALEPaZT/o4EcmCBrzWDwJ4QXlao7eBMLyIdwGOG4KIAK9wXM2dom9rdPPvU6xHz5dNS+gTnF
 sDFy4YyIVQKCkVjhgPETbgDiMxcXwIG2Krymcu/8H31aDlHu/tBtEJVufXCiifmuoh5Co9KXNxn
 2S3xOKg5XgO7npdb9draA58U8PAuSA==
X-Proofpoint-GUID: D0uKOdnHdf6ikD2ji_DKNKdYdPgjZf0P
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68f171ac b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=_GqYuCC1AAAA:8 a=yPCof4ZbAAAA:8
 a=uH5r_W6JY0JBcEd-IyUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cOvdV3qn_NoA:10 a=i7nz0AWFu9MA:10 a=aViEl8YYgB_fEZN5ws7z:22
 a=l88fBjAlytNcJc7CwxVV:22
X-Proofpoint-ORIG-GUID: D0uKOdnHdf6ikD2ji_DKNKdYdPgjZf0P

Comments below...

On Thu, Oct 16, 2025 at 01:53:29PM -0700, Bruce McCulloch wrote:
> Signed-off-by: Bruce McCulloch <bruce.mcculloch@oracle.com>
> ---
>  llm/README.md                | 133 ++++++++
>  llm/llms-dtrace-complete.txt |   2 +
>  llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
>  3 files changed, 746 insertions(+)
>  create mode 100644 llm/README.md
>  create mode 100644 llm/llms-dtrace-short.txt
> 
> diff --git a/llm/README.md b/llm/README.md
> new file mode 100644
> index 00000000..346bde94
> --- /dev/null
> +++ b/llm/README.md
> @@ -0,0 +1,133 @@
> +# DTrace LLM Context Files
> +
> +## Overview
> +These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.  
> +They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
> +
> +The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
> +
> +> The context files describe probe syntax, predicates, statements, variables, built-ins, functions, and safe tracing idioms for core providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, etc.).
> +
> +---
> +
> +## Files
> +| File | Description |
> +|------|--------------|
> +| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs for DTrace knowledge. |
> +| `llms-dtrace-complete.txt` | Full expanded reference (available from the [DTrace-utils repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |
> +| `dtrace-llms.html` | Blog-style introduction explaining how to use these context files with LLMs and why DTrace is well-suited for machine-generated tracing. |

This file is not included in the patch.  I would expect it to be included since
it is referenced here.

> +
> +---
> +
> +## How to Use
> +
> +1. **Install DTrace**
> +
> +   ```bash
> +   sudo dnf install dtrace
> +
> +```
> +
> +Make sure you are using the DTrace binary from the `dtrace-utils` package, _not_ the SystemTap compatibility binary:
> +
> +```bash
> +which dtrace
> +sudo /usr/sbin/dtrace -V
> +
> +```
> +
> +2.  **Load the context file into your LLM session**
> +    
> +    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
> +        
> +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.

The context files are not currently included in the DTrace RPM, so installing
DTrace would not make them available.  If they are to be included in the RPM,
we need to determine where they should be installed and then these instructions
should reference that location explicitly.

> +3.  **Start asking questions in natural language**
> +    
> +    You can now prompt the model to produce valid D scripts:
> +    
> +    ```
> +    write a dtrace script that shows all read() syscalls made while the script is running
> +    
> +    ```
> +    
> +    or
> +    
> +    ```
> +    count how many processes start on the system within 5 seconds
> +    
> +    ```
> +    
> +4.  **Run the generated script**
> +    
> +    Save the model’s output (e.g. `trace.d`), then execute:
> +    
> +    ```bash
> +    sudo dtrace -s trace.d
> +    
> +    ```
> +    
> +
> +----------
> +
> +## Example Prompts
> +
> +Here are a few good starting points:
> +
> +>“Write a DTrace script that prints the PID of every process that accesses memory.”
> +
> +Teaches process-level tracing and probe filters.
> +
> +>“Provide a DTrace script to count how many processes are started over 5 seconds.”
> +
> +Demonstrates use of timed aggregations.
> +
> +>“Show all `read()` syscalls and count how many occur per process.”
> +
> +Basic syscall entry/return tracing.
> +
> +>“Track which executables call `open()` and print errors.”
> +
> +Uses speculation and error guards.
> +
> +----------
> +
> +## Safety and Trust
> +
> +DTrace runs in **nondestructive mode by default**.  
> +Even if an LLM suggests unsafe actions, the runtime will prevent writes, signals, or other destructive operations unless explicitly enabled with `-w`.
> +
> +This makes LLM-generated scripts safe to test and explore on production or staging systems — they can observe but not modify the kernel state.
> +
> +----------
> +
> +## Notes and Troubleshooting
> +
> +-   If you see:
> +    
> +    ```
> +    dtrace: could not enable tracing: Destructive actions not allowed
> +    
> +    ```
> +    
> +    either remove `system()` calls or rerun with `sudo dtrace -w -s script.d`.
> +    
> +-   If `dtrace` behaves unexpectedly, ensure you are not invoking a SystemTap binary:
> +    
> +    ```bash
> +    sudo /usr/sbin/dtrace
> +    
> +    ```
> +    
> +
> +----------
> +
> +## Additional Resources
> +
> +-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
> +    
> +-   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
> +    
> +-   [Brendan Gregg’s DTrace Toolkit](https://www.brendangregg.com/dtrace.html)
> +    
> +-   [Oracle Linux Blog: DTrace for the Application Developer](https://blogs.oracle.com/linux/post/dtrace-for-the-application-developer-counting-function-calls)
> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
> index 2264fc40..8a4a535c 100644
> --- a/llm/llms-dtrace-complete.txt
> +++ b/llm/llms-dtrace-complete.txt
> @@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise in writing DTrace programs
>  
>  You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>  
> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
> +
>  Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
>  
>  After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
> new file mode 100644
> index 00000000..a514abbf
> --- /dev/null
> +++ b/llm/llms-dtrace-short.txt
> @@ -0,0 +1,611 @@
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +
> +You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
> +
> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
> +
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
> +
> +## GOAL
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +
> +## PROGRAM STRUCTURE
> +A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> +Syntax skeleton:
> +```
> +probe descriptions
> +/ optional predicate /
> +{
> +    statements
> +}
> +```
> +- Multiple clauses allowed; run in program order.
> +- Empty `{}` triggers the default action (trace EPID).
> +- Scripts may be invoked via `dtrace` (shebang/interpreter line).
> +- Scripts can include pragma options.
> +
> +## PROBE DESCRIPTIONS
> +Canonical form: `provider:module:function:name`
> +Fields:
> +- provider — DTrace provider name
> +- module — kernel object / library / program, if location-specific
> +- function — program function, if location-specific
> +- name — semantic probe name (e.g., BEGIN, END)
> +
> +Shorthand precedence when fields are omitted:
> +- name
> +- function:name
> +- module:function:name
> +
> +Avoid numeric probe IDs (unstable).  
> +Wildcards & patterns supported (shell-style globbing). Empty fields match any value.
> +
> +### Pattern tokens
> +- `*` — any string (incl. empty)
> +- `?` — any single character
> +- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
> +- `\` — escape next char
> +- Empty field ⇒ wildcard match
> +- All four fields must match (with patterns) for a probe to enable
> +
> +### Multiple Probes
> +Several probes can be listed, comma-separated; same predicate and statements apply.
> +
> +### Examples
> +- All syscall entries: `syscall:::entry`
> +- BEGIN without module/function: `dtrace:::BEGIN`
> +- List available probes: `dtrace -l`
> +
> +## PREDICATES
> +- Optional boolean expression between slashes: `/ expr /`
> +- Evaluated at probe fire to decide whether to execute statements
> +- Any D expression of integer/pointer type; nonzero ⇒ true
> +- Can reference variables, built-ins, and operators
> +
> +Examples:
> +- Match only "date" process: `/execname == "date"/`
> +- Targeted PID: `/pid == $target/`
> +
> +## STATEMENTS (CLAUSES)
> +- Semicolon-separated expressions/functions inside `{ ... }`
> +- Default action when `{}` empty: report probe activation (EPID)
> +- Clauses can use aggregations, variables, built-ins, and functions
> +
> +### Minimal idioms
> +Count events by function:
> +```
> +syscall:::entry
> +{
> +    @counts[probefunc] = count();
> +}
> +```
> +
> +Predicate filter by execname:
> +```
> +syscall:::entry
> +/execname == "date"/
> +{
> +    @reads[probefunc] = count();
> +}
> +```
> +
> +## NOTES & STABILITY
> +- Probe IDs are not stable; prefer full descriptions
> +- Providers, modules, functions, names may have differing stability attributes
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 2: TYPES, OPERATORS, EXPRESSIONS
> +
> +## IDENTIFIERS & KEYWORDS
> +- Identifiers: letters, digits, underscore; must start with letter/_
> +- Reserved keywords (subset relevant to D):  
> +  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
> +- Avoid names starting with `_` (reserved for system)
> +
> +## DATA TYPES
> +### Integer Types
> +- char (1 byte), short (2), int (4), long (8), long long (8)
> +- signed by default; add `unsigned` qualifier for unsigned
> +
> +### Integer Aliases
> +- int8_t, int16_t, int32_t, int64_t
> +- uint8_t, uint16_t, uint32_t, uint64_t
> +- intptr_t, uintptr_t
> +
> +### Floating Point
> +- float (4 bytes), double (8), long double (16)
> +- Floating-point arithmetic not permitted; can trace/printf values
> +
> +### Strings
> +- `string` type represents ASCII strings
> +- Special handling for tracing, comparison, functions
> +
> +### Pointers
> +- Declared as `type *`
> +- Example: `int *p;`
> +- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
> +
> +### Structs & Unions
> +- ANSI C-like definition
> +- Access via `.` and `->`
> +
> +### Arrays
> +- Scalar arrays: fixed-length `[n]`
> +- Associative arrays: `name[key]`
> +- Multidimensional arrays supported
> +
> +### Enumerations
> +- `enum colors { RED, GREEN, BLUE }`
> +- Values assigned sequentially unless overridden
> +
> +### Typedef
> +- `typedef existing-type alias;`
> +
> +### Inlines
> +- Named constants: `inline type name = expression;`
> +
> +### Namespaces
> +- Backtick (`) to access kernel/module types: `struct vmlinux\`task_struct`
> +
> +## CONSTANTS
> +- Integer: decimal (123), octal (012), hex (0x123)
> +- Floating: decimal with dot or exponent
> +- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
> +- String: `"hello"`, stored as null-terminated
> +
> +## OPERATORS
> +
> +### Arithmetic
> +- `+` add, `-` sub, `*` mul, `/` div, `%` mod
> +- Integer and pointer arithmetic only
> +- Division by zero ⇒ ERROR probe
> +
> +### Relational
> +- `<`, `<=`, `>`, `>=`, `==`, `!=`
> +- Applied to int, ptr, string
> +- Strings compare lexically
> +
> +### Logical
> +- `&&` AND, `||` OR, `^^` XOR, `!` NOT
> +- Short-circuit for `&&` and `||`
> +
> +### Bitwise
> +- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
> +
> +### Assignment
> +- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
> +
> +### Increment / Decrement
> +- `++`, `--` (prefix/postfix)
> +- Works on int and ptr types
> +
> +### Conditional
> +- Ternary `?:` operator
> +- Example: `x = i == 0 ? "zero" : "nonzero";`
> +
> +### Type Conversion
> +- Implicit: usual arithmetic conversions (C-like)
> +- Explicit cast: `(int)x`
> +
> +## OPERATOR PRECEDENCE (highest → lowest)
> +- `() [] -> .`
> +- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
> +- `* / %`
> +- `+ -`
> +- `<< >>`
> +- `< <= > >=`
> +- `== !=`
> +- `&`
> +- `^`
> +- `|`
> +- `&&`
> +- `^^`
> +- `||`
> +- `?:`
> +- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
> +- `,` (evaluate left→right, return rightmost)
> +
> +### Misc Operators
> +- `sizeof(expr)` — size in bytes
> +- `offsetof(type, member)` — offset of struct member
> +- `stringof(expr)` — convert to string
> +- `xlate(expr)` — translate type
> +- Unary `&` — address of object
> +- Unary `*` — dereference pointer
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 3: VARIABLES
> +
> +## VARIABLE CLASSES
> +- Scalar variables: single data objects (int, ptr, string, struct, etc.)
> +- Associative arrays: dynamic, keyed collections
> +- Scalar arrays: fixed-length, indexed by int
> +- Multidimensional arrays: ANSI C-compatible, rarely used
> +- Variables created implicitly on first assignment
> +
> +## VARIABLE SCOPE
> +- Global: `varname`  
> +- Thread-local: `self->varname`  
> +- Clause-local: `this->varname`  
> +- External (kernel symbols): `` `symbol ``
> +
> +### Table: Scope summary
> +- Global: shared by all threads, not MP-safe
> +- Thread-local: per-thread storage, MP-safe
> +- Clause-local: per-probe-firing storage, MP-safe
> +- External: access kernel variables, read-only
> +
> +## GLOBAL VARIABLES
> +- Declared implicitly on assignment or explicitly outside clauses
> +- Examples:
> +```
> +x = 123;            /* int */
> +s = "hello";        /* string */
> +a[123, 'a'] = 456;  /* associative array */
> +```
> +- Explicit declaration (no init value allowed):
> +```
> +int x;
> +int arr[unsigned long long, char];
> +```
> +
> +Initialization can be done in `BEGIN` clause.
> +
> +## THREAD-LOCAL VARIABLES
> +- Scoped to each OS thread
> +- Syntax: `self->name`
> +- Examples:
> +```
> +syscall::read:entry
> +{
> +    self->read = 1;
> +}
> +```
> +- Created implicitly; type = RHS of first assignment
> +- Can also declare explicitly: `self int x;`
> +
> +## CLAUSE-LOCAL VARIABLES
> +- Scoped to single probe firing, persist across clauses for same probe
> +- Syntax: `this->name`
> +- Example:
> +```
> +BEGIN
> +{
> +    this->secs = timestamp / 1000000000;
> +}
> +```
> +- Explicit declaration: `this int x;`
> +- Faster than associative arrays, use for temporary calculations
> +
> +## EXTERNAL VARIABLES
> +- Access OS/kernel variables and symbols
> +- Syntax: `` module`symbol ``
> +- Examples:
> +``
> +trace(`max_pfn);
> +trace(&`max_pfn);
> +``
> +- Names kept in separate namespace from D identifiers
> +- Read-only for safety
> +
> +## ARRAYS
> +### Associative Arrays
> +- Dynamic, unlimited elements
> +- Syntax: `name[key] = value;`
> +- Key can be any type (int, string, tuple)
> +- Delete element: assign 0 → `arr[key] = 0;`
> +
> +### Scalar Arrays
> +- Fixed length, declared with `[n]`
> +- Example: `int arr[5];`
> +- Bounds checked at compile-time
> +
> +### Multidimensional Scalar Arrays
> +- ANSI C-compatible: `int m[12][34];`
> +- Access: `m[0][1]`
> +
> +Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple key)
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
> +
> +## BUILT-IN VARIABLES
> +Automatically available within all D programs.
> +
> +### Process & Thread
> +- `pid` — process ID
> +- `ppid` — parent process ID
> +- `tid` — thread ID
> +- `execname` — current process name
> +
> +### Probe Metadata
> +- `probeprov` — provider
> +- `probemod` — module
> +- `probefunc` — function
> +- `probename` — name
> +
> +### Time
> +- `timestamp` — nanosecond, monotonic
> +- `vtimestamp` — per-thread virtualized timestamp
> +
> +### Call Stack & Location
> +- `caller` — kernel PC of calling function
> +- `ucaller` — user-level PC of calling function
> +
> +### Syscall & Error
> +- `errno` — last thread error number
> +
> +### Arguments
> +- `arg0` … `arg9` — probe arguments (64-bit)
> +- `args[]` — typed argument array
> +
> +## MACRO VARIABLES
> +Expanded at compile time, not runtime.
> +
> +### Process & User Info
> +- `$pid`, `$ppid` — current / parent process ID
> +- `$uid`, `$gid` — user / group ID
> +- `$target` — target process specified via `-p` option
> +- `$1`, `$2`, … — script arguments
> +
> +### Notes
> +- Macro variables allow parameterization of scripts
> +- Expansion occurs at compile-time, before execution
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 5: FUNCTIONS
> +
> +## DATA RECORDING FUNCTIONS
> +- `trace(expr)` — store expr in trace buffer
> +- `printf(fmt, ...)` — formatted print
> +- `printa(fmt, @aggr)` — print aggregation(s)
> +- `exit(code)` — terminate tracing, run END
> +
> +## AGGREGATION FUNCTIONS
> +- `count()` — number of probe firings
> +- `sum(x)` — sum of values
> +- `avg(x)` — average of values
> +- `min(x)` — minimum
> +- `max(x)` — maximum
> +- `stddev(x)` — standard deviation
> +- `quantize(x)` — power-of-two histogram
> +- `lquantize(x, from, to, step)` — linear histogram
> +- `llquantize(x, factor, low, high)` — log-linear histogram
> +
> +## SPECULATION FUNCTIONS
> +- `speculation()` — allocate speculative buffer, return ID
> +- `speculate(ID)` — record subsequent actions to speculation buffer
> +- `commit(ID)` — commit speculative buffer to main trace
> +- `discard(ID)` — discard speculative buffer
> +
> +## MEMORY COPYING FUNCTIONS
> +- `copyin(addr, size)` — copy from user space
> +- `copyinstr(addr[, size])` — copy NUL-terminated string from user
> +- `copyinto(addr, size, dest)` — copy into DTrace memory
> +- `copyout(src, addr, size)` — write to user space (destructive)
> +- `copyoutstr(str, addr, size)` — write string to user (destructive)
> +
> +## STRING FUNCTIONS
> +- `strlen(s)` — string length
> +- `strjoin(a, b)` — concatenate
> +- `substr(s, i[, len])` — substring
> +- `index(str, sub[, start])` — first occurrence of sub
> +- `rindex(str, sub[, start])` — last occurrence of sub
> +- `strchr(str, c)` — first char occurrence
> +- `strrchr(str, c)` — last char occurrence
> +- `strstr(str, sub)` — substring search
> +- `strtok(str, delim)` — tokenize
> +
> +## STACK & EXECUTION FUNCTIONS
> +- `stack([nframes])` — kernel stack trace
> +- `ustack([nframes, strsize])` — user stack trace
> +- `system(cmd)` — execute shell command (destructive)
> +- `raise(sig)` — send signal to process (destructive)
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 6: PROVIDERS & COMMON PROBES
> +
> +## PROVIDERS OVERVIEW
> +Providers group related probes. Each probe is identified by `provider:module:function:name`.
> +
> +### Core Providers
> +- `dtrace`  
> +  - BEGIN — fires at start of tracing
> +  - END — fires at end of tracing
> +  - ERROR — fires on D program error
> +
> +- `syscall`  
> +  - Entry/return of all system calls
> +  - Examples: `syscall::open:entry`, `syscall::write:return`
> +
> +- `proc`  
> +  - Process lifecycle events
> +  - create, exec, exit, signal
> +
> +- `sched`  
> +  - Scheduler events
> +  - on-cpu, off-cpu, enqueue, dequeue, wakeup
> +
> +- `io`  
> +  - Device I/O events
> +  - start, done
> +
> +- `profile`  
> +  - Time-based sampling
> +  - `profile-N` — kernel stack sample every N Hz
> +  - `tick-N` — fires every N seconds
> +
> +- `lockstat`  
> +  - Kernel lock contention statistics
> +  - spin, adaptive, rw lock events
> +
> +- `fbt` (function boundary tracing)  
> +  - Kernel function entry/return probes
> +  - Powerful but potentially unsafe (debug/dev only)
> +
> +- `pid`  
> +  - User-level function boundary tracing for a process
> +
> +- `usdt` (user-level statically defined tracing)  
> +  - Static tracepoints in user programs
> +
> +- `cpc`  
> +  - CPU performance counter probes
> +
> +## EXAMPLE USES
> +
> +### System Calls
> +```
> +syscall:::entry
> +{
> +    @calls[execname] = count();
> +}
> +```
> +
> +### Process Creation
> +```
> +proc:::exec-success
> +{
> +    printf("%s exec %s", execname, copyinstr(arg0));
> +}
> +```
> +
> +### Scheduler Events
> +```
> +sched:::on-cpu
> +{
> +    @oncpu[execname] = count();
> +}
> +```
> +
> +### Profile Sampling
> +```
> +profile-1000
> +{
> +    @[ustack()] = count();
> +}
> +```
> +
> +### I/O Operations
> +```
> +io:::start
> +{
> +    @io[execname] = count();
> +}
> +```
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 7: COMMON PATTERNS
> +
> +## COUNT SYSCALLS BY PROCESS
> +```
> +syscall:::entry
> +/execname != ""/
> +{
> +    @syscalls[execname] = count();
> +}
> +END
> +{
> +    printa(@syscalls);
> +}
> +```
> +
> +## TIME A SPECIFIC SYSCALL
> +```
> +syscall::write:entry
> +{
> +    self->ts = timestamp;
> +}
> +syscall::write:return
> +/self->ts/
> +{
> +    @delta[execname] = quantize(timestamp - self->ts);
> +    self->ts = 0;
> +}
> +```
> +
> +## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
> +```
> +syscall::open:entry
> +{
> +    self->spec = speculation();
> +    speculate(self->spec);
> +    printf("open: %s", copyinstr(arg0));
> +}
> +syscall::open:return/self->spec/
> +{
> +    speculate(self->spec);
> +    trace(errno);
> +}
> +syscall::open:return/self->spec && errno != 0/
> +{
> +    commit(self->spec);
> +    self->spec = 0;
> +}
> +syscall::open:return/self->spec && errno == 0/
> +{
> +    discard(self->spec);
> +    self->spec = 0;
> +}
> +```
> +
> +## PROFILE USER STACKS (SAMPLING)
> +```
> +profile-1000
> +{
> +    @[ustack()] = count();
> +}
> +```
> +
> +## TRACK PROCESS EXECUTIONS
> +```
> +proc:::exec-success
> +{
> +    printf("%s -> %s", execname, copyinstr(arg0));
> +}
> +```
> +
> +## COUNT SCHEDULER ON-CPU EVENTS
> +```
> +sched:::on-cpu
> +{
> +    @oncpu[execname] = count();
> +}
> +```
> +
> +## I/O ACTIVITY BY PROCESS
> +```
> +io:::start
> +{
> +    @io[execname] = count();
> +}
> +```
> +
> +## TRACK ERRORS
> +```
> +ERROR
> +{
> +    printf("DTrace error: %s", probename);
> +}
> +```
> +
> +## TRACE ARGUMENTS OF FUNCTION
> +```
> +syscall::open:entry
> +{
> +    printf("open(%s)", copyinstr(arg0));
> +}
> +```
> +
> +## LIMIT TRACE TO TARGET PID
> +```
> +syscall:::entry
> +/pid == $target/
> +{
> +    @syscalls[probefunc] = count();
> +}
> +```
> -- 
> 2.47.3
> 

