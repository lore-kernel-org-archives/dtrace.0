Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F1D38DE1
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757911832; cv=fail; b=rhyNYOdgIYnrte+vEg9wC74P22SIt/ag8Pg7r2unwkqtqeyzkMFfIlvkNZHt25FxQDT5NcWxO4P9PiKMjNxbuU/RCd9GfkAjLzsI8Y32OxTUyKJ9S4DlDv0O34ECPzOf8ziiWOzB5FGdzcSmdkIvAh3xMuzj+PiPa6iK42yjaBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757911832; c=relaxed/simple;
	bh=t1zbUxInVLmc3GTnndvsYIMA3kYFYJSzM8M9OhIjFP4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=svdWxnk9wlGuwkVWyr+1eWGjZeXg9ufH5z6USJrOvntUnHTXET5URrUyhDMs4RmCJmgzd6S6N53J7WRaB1Ue4FpzxdRrQAYhbGLHAwuEvnjNBtK/TfYal3BLOCXgC6Z2zPhgMojh9lxHVIVSyJbGV6y2kYhtGkPbFSZ5BoBR8gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FSzv3IdQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ORHI8VP2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FSzv3IdQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ORHI8VP2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELZEOf016399
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KHxebNasVLY6r3egvEMMNSLtCwvi9zUErc0k7LQYIbM=; b=
	FSzv3IdQHaCh3oAH8cO8lMLwr+/p3AdJNR0bSsEfVs0VqzRJVppl6MF567HJqWl1
	T3fMUtERYV4N7ofmUcL99P2PGc7errAbI5Ky/vwzr7umgv5kOe8Sv8yh8XA6C6yU
	vozTvTsXddgztq9XWl21i+bFW1Cak77W0njUyIm7uClR2FljmDLphyDjrFkmevNH
	4XLhOOlwbk9jz62ICTqVFUPKwYurwhnzkUx/2TllyRn36v6EcVI95wMJy79+O3ZB
	dKPzmsek3T6HUowXJ+j2tlOlz8hH9B6R1LjeZOLyAhOsKDdZUIAQ7WJKXoBIhyuA
	ZQRrp/AaPJUzzMobAzPIqw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yd8hgnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:50:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58F22ClH015644
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:50:28 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2ahn0y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie1H7CSbeqvj4MO+PPlXIVCG22abM9ikudFkf89k1Fx+1OhLV5HuwIlwIxrjtf9IU9neI8WbDrsoAPgySUak2Zg6xr9C5hcEuwksvacnAkGvrUTi+I6faXUWh7u8A6le+se6K3EQvQHYjyJQ9p4Oe80Ge87+OwTQ5DnQS+o7PxdXqredZUxmiFlVvemLhpUaNXR0Pb5VjAyGcHoWhsUX69gXwYUx6oKD+76LpT6irqZgzLwLI6Mk8MntxfPK3d4o92jfNxHC1cg+0ZgErCaq17BLHiynVM/9K0t95L0wkS2GOyJPRYPxN8Zv5Uymh4SHW+SzofUcMx3UfZOI/rlkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHxebNasVLY6r3egvEMMNSLtCwvi9zUErc0k7LQYIbM=;
 b=YnHmUJfZ7lRn40xou4zGLZnuLRmwKY3mRREZ7bOB6EZEsPbThcCMm0mu4zhYBBSWAUwuF9NyLvpOouiOHUaCS9XQ5xWjCokNkNp5brXQOoxWEdxBeNsNJM/BhxbKW5ubLEWHJiSy7ohzuvHwni3LpFk6rdM9H2/w3BS89iJe4puAibBcemnFxC1C8uDAQ/DZM9RWeuEMdjVBwXfiw8inMacOjTmi2crbhAFIFPLBykVF+pGW9XiZ9jFN82bQC5p2R0w/1CvUir0TY7f3zMig+MFmC5DYdRrV7LS3EKvoNj2cKVQBKjru9RHcgYCGTGN+oVBji9pjqB58whmNqa2MeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHxebNasVLY6r3egvEMMNSLtCwvi9zUErc0k7LQYIbM=;
 b=ORHI8VP2svekMdd46RCdTSx8SwbVeHHMDgQtm6lQObykvzlVZDPFHGtQaSkE7ImiyrgSF2j3g2eAXgfv3o94FTyBYIqjqf0RG3GvdeOBomjAvbgv/rf4ZIkod8FqNeLBn1BS3fwTccN4xhffrAbw8b14Qx2WGnHvBmmDF/vofvE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4356.namprd10.prod.outlook.com (2603:10b6:a03:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 04:50:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 04:50:25 +0000
Message-ID: <c895a7a5-009a-7ea7-cdb4-4c22a3257de3@oracle.com>
Date: Mon, 15 Sep 2025 00:50:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] Defer stripping out "__data_loc" until we know that
 is useful
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250913155619.22299-1-eugene.loh@oracle.com>
 <20250913155619.22299-2-eugene.loh@oracle.com> <87jz21w4uu.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87jz21w4uu.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:510:174::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: eec0e545-b948-4d2a-645a-08ddf4136252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnhTVDVQM05RcTJMZlRPNVZMdHlYQjZKR1JOekdOQXhPNnRIS252M0dYUWhl?=
 =?utf-8?B?dlR0RHVVeC9yNHJwTGpsOWdKOXAzVWxkVTNmUUpIZ1REbUVjSXFCSllkNHdo?=
 =?utf-8?B?S05aWENWNjNwVEJQeVlmTjMvZHpqeWJ6MUp4UGIwVjR5b3pGMjVlTitGaFUr?=
 =?utf-8?B?ckRZdjYxM04wWXlzdmFrUlhoQ05Zem1vTWN4ODk5aVd1RU9RS1kreCtVWm9s?=
 =?utf-8?B?RlRPVTdobmViQ0d0Q3JpTWZNRitpaDkrU1FEZXYxMWFHa25vMzdJWmxmcUNl?=
 =?utf-8?B?Nk1IdlBGSE0wdGFNSUxyK2hZZ2ZCeFUvV3AwYk5Fb1hkQ1hORDZoWVdGb3BQ?=
 =?utf-8?B?UjlLVkhnMkdBVnlVZEN5KzNWTitXdDFzblRCSCtDbTJKT1RQR1BrWWEvVDdC?=
 =?utf-8?B?YjdXVjFYOVN4aTk5NmRRclVEZWVkdDVGa0k0ODJuVFIyOUpFRzc0RGJkbUMz?=
 =?utf-8?B?YTRveDQ5eXFESEJWTkdtcTFsQUxaYTRVemJHd21jdFZTbTJjbzgzcmxqSXY2?=
 =?utf-8?B?QjJ3L3QyTmRVY0xrbWRqeFhoMitXbUpReUJxVXJMallya1F2Ymk1YXJXVVli?=
 =?utf-8?B?ay93YnJHSHJ1V01ma2YrcEg2dmJVNjFjTmNaUlRwd2wvemVpbWlqaC9OdXB1?=
 =?utf-8?B?ZUdJdE1xazM4dXdYSjZmOTNTZlNDeEVTQzB0akR6TW5WUFZ3WDNiZ3JTRzcz?=
 =?utf-8?B?RXdkVi9INXdXVnBsUGlQNmxiL1ZTd1JTbC9ZMFFOVEZxTHRIVDcrcjNUdVQ0?=
 =?utf-8?B?YlVUbjRNd0lSNXJlRFlVVEJIZWNvcThKNTEzbThRZnJKeitBNXRzcHAzR1U0?=
 =?utf-8?B?V1FtSlh0c21CU3AzY1dYMjVmV2JzaDhGejVvNmd3dDk4RFI0enZwTE9jOGQ5?=
 =?utf-8?B?Z3JLVDByRU9Zc0lMYlU0UFpmUXYvSUtHQ2FWRVNTQ0FRc2hscnJrOHZiaDZj?=
 =?utf-8?B?Y3VReDJZbXlhOFcyU05NY0picFpnU08zS3gwRmJEb0hBTGdHMlhTWHhCcGp2?=
 =?utf-8?B?d0srVUh0VWxmYTh5OGczTTVzRmVrenlpZnFxTndjMlpUMHgwY2V4R0U0L1Mr?=
 =?utf-8?B?VmhmM2h3QnBnbWJacWVQNW1XcXRoNjkvOW9wWFpPMFhJcjZWUFdHcURNL1o4?=
 =?utf-8?B?RVF4YnpOSGYwdTFUYmVKQUNSRWVPajlaUzJrenpsbG5vcllaWDVpRHFqbVhP?=
 =?utf-8?B?dmx4bnk1ck0zV0l6d1l5RUFXekhXR05ZbUdUdlFSRlg4SkdZWk5hT1FBY3Bn?=
 =?utf-8?B?R3BvV3hMQVBtT295aGVjb1EzYmIxZG9VT0FuVVNudWZ4eW5tZGx2ejdybFFJ?=
 =?utf-8?B?UlJ6TDh6N29XWVRERTNxVCtyelRDcEwyZHBZMWtCV3A4MUZnRVBhNkNFRWoy?=
 =?utf-8?B?bVFPL25jSndOZlF0S3VuaDZqY3hFa244WFZBNjkvVTAxa3hpUkpsQkFJNHV4?=
 =?utf-8?B?dDUvY1Y5dWVqcURkblduMWY0eGJFUTYwV0Z3dDNwbWoyK0ZHeDUwcm4yRnVi?=
 =?utf-8?B?ck9yUEhhMGtXZ3hQVUtYRVR3VWx0eUxTaElDSjJ3VEptSWVSbnhCS3ZlY29B?=
 =?utf-8?B?ckxjVmMvN0dPOC85NkRhTElacGlJV0FRaHFIdnJ1RjQ4Y0puQlRRZjNsSHhl?=
 =?utf-8?B?M1YwOUpWZit3S0NyVDlPWiswcUpobS9HN1JWY3FlSHpSeUZkVVRwc2YyanZa?=
 =?utf-8?B?cHJFZmJaRVExQU1xZ09qOUxwajRwZ0lxSjRKRVBvS2hnSGFQOUs4K3VTQjlx?=
 =?utf-8?B?Z0FkR0JGZ0R1MUF4MzkxTUhtemxGdlh6WGRzOVcyenRLbWY2Q2kzK0dHV1d3?=
 =?utf-8?B?dVRkRVpUNVV3MmVaUmZtMFFkVWltYVRBSTloUEdGRkdBRU8yRnNoaFZCUmRn?=
 =?utf-8?B?WFRpdDlFa04xSmhqY1hjbUpIVHorc3EwRVpyc2k1ZlFjc0gzSHMyTXJzRjJW?=
 =?utf-8?Q?JGERru5Z+jk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE5icUxWVkorR0F0Q3JuWG9LUkxVK0VnSGVCVVB5WTUrTk9pT1NrYjN2M0Ux?=
 =?utf-8?B?RGhKQ1JiUEZFM1ZlakRVMlc3SnREQUdnN3BSeHJnc1IrQ0FXcjBvWjNONjYz?=
 =?utf-8?B?UUZDNTZ6NlpTV2xYR3pZTy83VlY0UGFsMUhoOE1jenpXQzBhRzJXelp6V3lk?=
 =?utf-8?B?V3VKY3dVcC9LWU5jRUI3WFZIL3NKMjFyd2N2NFBuNzBTMXo0a1RGUHhkSUFl?=
 =?utf-8?B?Uk0vekVLTmxMWmt6bnMrVmVvMm52VFRwYnJUZDgzUVNCaW9IMTZ5RWNQa2gw?=
 =?utf-8?B?d2FXaml1SVlkRE55RkVmWStVKzBWNTI2RjNGMlhzUjFsNy9uRG5WK2xIWWlK?=
 =?utf-8?B?MGdQY20wcEFZaHBwVWJ0RHhNbnQzelFjWDZmaFA0VHJJNTVFZEhlRnFBRStT?=
 =?utf-8?B?ZUt5UmxkdllCd2FZbXV3Z1ZFYzc3Wm1mM2prVWVUZWdMZk8rVWhjMjFYNG02?=
 =?utf-8?B?WERBZkN1RlJWMC9XaUMxWFA1Y3J0bm1ickZjMTZPT09mV0VMT1VPRVZseTF3?=
 =?utf-8?B?SGU1dDZ5WVZNNnVRVWJaaTZhUEdaKzVocFNwbFgrU1RaTzN1R0RDMTNlOHZ4?=
 =?utf-8?B?eUFNVGwwZjlSUUJ5MFlMeE1YY2V1ZU1teU1UZnRiNTd2L0w3YnV6R0tBTTI5?=
 =?utf-8?B?Wit1UVhyazM3UWRJek5oS1pQMGVMMHVMRW9HS0pMd252SnRybEp5RVZZTDhC?=
 =?utf-8?B?MTA2eFpveUdPWDIvUzBlZkQyN0IyT3VEclVjczZQQko2dGp0UHhpNlgxZVhr?=
 =?utf-8?B?QU50ZWUzNkE4VTBwMmtTY3MrM0ZHckZKeXNJM0FDaTY0N1BXWlhpL2YrSjZP?=
 =?utf-8?B?dWZZV3daTnpsTmhOMFVONmJKakxiemJ6eHZjZEI5YUpwUHJOTldYTnVOanVm?=
 =?utf-8?B?WGxWRTQwVWRYelZjcmJzT3RGZHdBWFZOSWc0REcvSG5IWFhkSmg1aVowWjRz?=
 =?utf-8?B?V3Z4akhqV1JBN3dBSFROV2tzN3pua3JRNUo3OGUxbWVRUG9HcTQyZzJ0aSsy?=
 =?utf-8?B?dnBmQy91a004dXFwWTNoeHppbEZyNDBodnpSa1BSbmlVMU81L1VuWVlRV25J?=
 =?utf-8?B?Rm9DYlZMVkxsdUNqWkhORHZkYUNMemZUV1VMSzEzaGRLclJYSVlla2JqdmFy?=
 =?utf-8?B?L1NJMW9lSnFZb1VQUzZUcVZGaktDOXRhTU1CNG1jYUlKaUtWdzRpNjVHa0dy?=
 =?utf-8?B?RXZaMm5Yc1RPUkRRc0h0amx1NThrWUp5RjdRVzZYVzEyZjZQN2RWTWE5VC85?=
 =?utf-8?B?NnVXdG0yd2JMbUJReFZKeFBzWmJtclBMd3JSNjE1cE1ZbTEwQWxERUE3Sy9R?=
 =?utf-8?B?Kzh5am04SmJONmZkTklBUGM1eFBFUzZ5QStUQzdjdWhDbmZmQmlCNDV5UjRN?=
 =?utf-8?B?anZJSUx1a3lJWCttSlVzclNlUEM3TWovSUVPUUJRd2MzL2dmOHhMSlFIL09V?=
 =?utf-8?B?WE1JenNGMHVOZjlBcTFEcHV1K2xaUk9TSWplbHI1K1AxRXR6Z200MTUvK1c3?=
 =?utf-8?B?Y25UY0tXam5pU3RwTTBvbVk5VW5iM2Nkc1UyMUV5V2F3TXllUFJZbzNvSGJE?=
 =?utf-8?B?VXhkUEJWZUhrVXM3K0JGSHY1Qi9wbTZuODJ4THpLc3VoMzRkWEpBWG5URmpT?=
 =?utf-8?B?c0I1OVdTMnBkUnkyejVLeWFnSjcxSUhUUHFWbDhvNEZ0U3NleVNSMnppa21P?=
 =?utf-8?B?Q0o5bmhkb2xGRHQrbTZiSWl3T1J6Z1d1bC9vTG94Rm5TdVd4azNZRE85d0dD?=
 =?utf-8?B?MXdPLzU3MVBMNFZRQlppS2M4WTdva1Z2dXZQQTllTzYzNnJhb2txQU96WGJr?=
 =?utf-8?B?bTllYklKUUE2VUlMeTBZSFBXTTF6TEYzTDBJU3NVeGxkblMyN1V4ZjFlczVM?=
 =?utf-8?B?aDVsL0lxWnAxZFI3ZE5ERnRhdERnVjRsQ2ZXazVYZURTS1BnU09YOU5GVUNz?=
 =?utf-8?B?ZWhLa1V5aC9YU2dNclpodlFWRWI0QVpJMk9kcDJoQXdXTTEzVUtZQTZ2VU5s?=
 =?utf-8?B?ZFhvSC9aVDdTaWlJMGlmUUc3NTh4WXV3YjlnTVBCMFBlVzlpaGdDb0tHazJz?=
 =?utf-8?B?dG9vaE12T05vTmtSSHFOSWJyS0ZvbTROd3NWR1dPMXZkY3EyVTdoR2d4N256?=
 =?utf-8?Q?kc3OZ/ycQMq908CHtPWUrFFiQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q7T26lxENewtyFhziHKdwjPLsA6XxkVNHp7WlooOr9gzwJsq+KYDpTxAFJCMm8A3TaDzJ+kin43f0M+aEmgajI5WiTK/G+cDslkuU6HTz5UkUzrxFpduTcJ0Ca3AkeaKsnq72YJfn+c6yKyBWHxhK0ISB7omnxh+LxO2YjSLCxyXuoIXKoSa7xOuKwm8IMBFI1kA8slhnOb92xOQZuooTpLPClOBOlJ9WC6k9OuyUuctDYlLKLK3hYLYbyCDM8Ywd4HLkIm926UDWUPrkfa+VCVdYDLk2YKNfWMmaEOYAwxg9xwZ6OxjXlueG+9moq2vbmeZLcq1abXJqIo6vnJq/bUos6s9J4UmKQ6eSMjZfDakJjCIQzXKUzh8XiTsb1m4NsDoXZU6yS0457sB2WvELVfdfs27iJqKr1XPnGyCC7fVRZs5/wHUjDsNjGS13koHioLbZa4CbVXt9g8ZXR6rJvYfDHN4vPrfVeaddM0Cg+j3FP+M5v4R+Hgdlc/mglm5XfoQ3Q49A7DFQfKLq6k4ezN8pPC4+xjaIpPKAunIqiUK0onXe02apE1NBzePd3Ri5T705q9PGMegJRDqhiW9dNhdfBNwMQub+r58uMSfJJ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec0e545-b948-4d2a-645a-08ddf4136252
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 04:50:24.9899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zi2ssAwlbsChg1t1W4ceS+uI7c9ALbIBEHoY7xArvNmFigxJc14UOPILkcLTD6spH537KQgSkFx524yHLFOsTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509150042
X-Proofpoint-GUID: Fha4vLinllYstWC_4P0Rlf1_NIMoDxEi
X-Authority-Analysis: v=2.4 cv=M5RNKzws c=1 sm=1 tr=0 ts=68c79b15 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9Eudi-OTTZDVqNmeqTIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12084
X-Proofpoint-ORIG-GUID: Fha4vLinllYstWC_4P0Rlf1_NIMoDxEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNiBTYWx0ZWRfXyJrhwK+Bw5Xp
 5jzRHTHoeHca9Auacr/Gg5Yiu96EQKzXU3BeciMr479rTGkOGiHjY+YVm8y5frig9ocdUfSzDDA
 4e3sQH3Bg9w2mmzHIWeAE635+ksTX/UWiO6PQusXC2K/dyU6xhwzFfiZfsZ9C+kAvQleyVqVFAI
 TONp96q+hxcDOXSSQhqZTDIlufR20SVKPGrn5F5pdFMAtGRwCJBugUnsiaW8xCAsMDpmukv71h/
 dcbkar+L+gsBW7d3BPGxkzbGtV/XO7CDWJX73/1Rwen2I67KgfDuNsazV9H+Ja7tT8bejFYqK0I
 adnvmYdVoIEzTgQG9kJmb0MyaoFaqz7RNqFUPJsYJw45IsnJBVeRPjSJkqtzcYlYwTGSsjbnHPK
 PAE7QTMBAFm/QL/hkGC6ierKuwX60Q==

On 9/14/25 09:17, Nick Alcock wrote:

> On 13 Sep 2025, eugene loh uttered the following:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Great, thanks.

> with the tiny caveat below.
>
>> ---
>>   libdtrace/dt_provider_tp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
>> index 33821f2c7..a6f978e3f 100644
>> --- a/libdtrace/dt_provider_tp.c
>> +++ b/libdtrace/dt_provider_tp.c
>> @@ -208,12 +208,13 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>>   		p = buf;
>>   		if (sscanf(buf, " field:%[^;]", p) <= 0)
>>   			continue;
>> -		sscanf(p, "__data_loc %[^;]", p);
>>   
>>   		/* We found a field: description - see if we should skip it. */
>>   		if (argc < 0)
>>   			goto skip;
>>   
>> +		sscanf(p, "__data_loc %[^;]", p);
>> +
> ... why not defer the sscanf above it too?

Because it's watching for "field:" lines.  We're not counting lines;  
we're counting lines with "field:" in them.

> The manipulation of argc at
> this point looks like this:
>
>          argc = -skip;
>
> (in getline loop)
>
>                  /* We found a field: description - see if we should skip it. */
>                  if (argc < 0)
>                          goto skip;
> (at loop end)
> 	skip:
>                  argc++;
>          }
>
>
> So if argc is < 0, it's going to *stay* like that until a given number
> of getlines have happened. Doing more work than just skipping and
> getlining is pointless.

Again, we're counting lines that have "field:" in them.

Now, I suppose we could count lines, period, whether they have "field:" 
in them or not (e.g., the ID: line), but I'm okay with forgoing that 
change until some future patch.  I get that this "__data_loc" change is 
no more relevant than what you propose.  But, if folks are okay with it, 
I wouldn't mind just pushing ahead with the patch as it is.

But, yeah, you make a reasonable suggestion.  Thanks.

> (This affects the next patch as much as this
> one. More generally, it might be clearer to move skipping to a separate
> getline loop entirely, above this one that also does all the other work.)
