Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0615E8B
	for <dtrace@lists.linux.dev>; Thu, 30 Oct 2025 00:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761783380; cv=fail; b=JrCXbdb2/N4t5eqN4PQpW8doyWevBLMCMswAbuWlTjKRJ05BJcisjh19fqrObFIPcTapR/lnxg2MVlmI/cLss6Kedo2bLogLSKwVW5PEl/2Jjqgep+fqmBeISqwJF0zY0Wck9m+r2L5xm26kyNCJ9BPjSDMku9jAHOYBNGlP5wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761783380; c=relaxed/simple;
	bh=bzwFpVXAQakKIQJiV5JSXbAUFS0Pf26tl/FSM5M/wb0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gJfKVRfuTaJMVnLtzPvilbiAD2YTxkkZYxhf5LnOVUPb4TxOBzSvmWjK9//EkILO2eNh9Pvr+cOgifNMIvtHeol0OmFMWZYSnEUebygvOABnByChrp6cRhHURl7r5Izo/4f1noYqmhgvL2vzRGtQAUZ6ar4D78lFkP/Yp3w+1ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QmK6FDXk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ArXEMaSt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QmK6FDXk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ArXEMaSt"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59TNKMw6018617
	for <dtrace@lists.linux.dev>; Thu, 30 Oct 2025 00:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lgkoqXmu2OqKEZZQ0iiQmOr20lVfos3Vv/hhwlF+1vM=; b=
	QmK6FDXkt5w4hj3RdN7wAjyv30oXQiMdRGP+jPxL+N//vyeckv+UeadD9QtQyIRP
	l8U3F5NrhKwdKaNzZyafsj6+2ANjEApbEtdp3grQl4tQNM2mDqn7tsiuKtTL9ksm
	8sQXEQO/DRaj11EZm31zMIjv3qbpAi3oqnDjioquG6L0nL8u1sDaXG8M+XVk6TxO
	FDvbtC+qgEHEfqRNlvW9O2yruTYO6N/QLgkxO+PV0o0IyGeFfN36SNo2s7AVq7nK
	UiZahbhkynP9Vr+uVJllthjM4bWfmV9ZZGurjxgoUQZq6hLO/C2nSDaOhKix1IpQ
	jymHdFCaGK4OXFVW75nv1A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a3bgkth80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Oct 2025 00:16:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59TMjccX007743
	for <dtrace@lists.linux.dev>; Thu, 30 Oct 2025 00:16:17 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a33wkwfmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Oct 2025 00:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGrquU4MyHgXt4FbKQFSUG9k7JTEs5YXEEnMst1r4a+GC0q+N5ExkWeFf7ag6YOTR6Fr3r+OzD0RswJByCCBk+N+GZ6qPMGADyERvLCoutjDoW2aqG1z2RvwhFKClBNXEt2fvp7tGUryyFvEscbzuxFEdqIcWb+kiKfudIZDs4JuOuhD8Nz7/FEfwg0QynYDAcKSJCnMGfmVYGJ0k/81XhBbAmOpdPsczsnDwRmGYofi6CZZHK4CDEFOkdGJG7llf9U9MhmEAe7vCDox3cF7+SLyxU2TDah1EPqSq38BNNd0yvT/4nSeyhGaYTPwl4OCQqCQkkja1Y1hfEArPcHjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgkoqXmu2OqKEZZQ0iiQmOr20lVfos3Vv/hhwlF+1vM=;
 b=NMum8YUEOoUGqFJl1slP1wkxQ4i/wn8DD7X42YFCjUwtvK/bBc8rIalU8OVoDDiySgG4o3H5KlCthvjlHq4gjG8TNjWOvQJYJCwKgwhPIR0Vdfa6ggqL+D6GtpRNfmZSa3N8F5w7MYoOYJ9SEk7u2MnX7tuvCvE9D+aI4iQ//zJWsJlmMImq0zD6qa5rSKIjVW2xMP4hhEFaLPJe9/+oJUwO1tK6orVNJMpUJQmX1fUSyU6cquaUGEeNT7Jo57Wukv765hXI7U9ud13i52IKjEe92tCmhLr9ySLBIjccv5nFfo4wUDjK1DaUvtk88roia99dgdaD2tAP6Duri6tspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgkoqXmu2OqKEZZQ0iiQmOr20lVfos3Vv/hhwlF+1vM=;
 b=ArXEMaStOZtImVO4exRNVoUS+pSA+38uqUrGzK/1qFUB23ZW2FHJRxgJRF8rXuzalS0jK5T4MLr7qOdLTrVI/nmAd8rbcKF2yZnjUxFMBnLxzHJb3d9BkBJqwwGJtkbDEfQBiQPQCFwKK1OcpiSXBIA9Wg1JgA+24s26p0Db9FI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4397.namprd10.prod.outlook.com (2603:10b6:208:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 00:16:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 00:16:14 +0000
Message-ID: <91a33c39-1f34-f9b1-bbd9-fed78f34835a@oracle.com>
Date: Wed, 29 Oct 2025 20:16:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] Omit an aggregation record if [u][sym|mod]
 translation fails
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250603210834.21204-1-eugene.loh@oracle.com>
 <aJtKVPrg95RybNrv@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aJtKVPrg95RybNrv@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b87322a-4019-4de3-65a8-08de17498955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDREbGV3ODZaeE1mQTZWNDFGLzVSWWl6VzRWVm00TEpkMFVsa05ZbGRNeUEz?=
 =?utf-8?B?K1Z6NERZRmhTVzZDbHp0cTgzclJ1SlF0M3ZVQ2UxM3h3WEpEejZPY0d3N2pw?=
 =?utf-8?B?dG95YWxPQkhDTm85ZUtvZjJoTFUxaDZHTlprR05hOGpaazlNWUpwUGpjcHFU?=
 =?utf-8?B?VDJERk55ME1INE5PYTE1ZUk1UXUxRzBJQmFTUlB5d2RWMk80alBCVFFoaU1y?=
 =?utf-8?B?cGJvZklGczdVY3g2YXJubUJhQy9iR1FJM0psVURHNWpxbEp2NUhsVEp4ZTVW?=
 =?utf-8?B?WjRUbTFaMDFIN2IzQnVuQ1Z4cU1XRjQ3bDN3VmF0REc4am9GMGZ1Tkd2K2hV?=
 =?utf-8?B?ZXN0bXRkVkVJWGlBSmVodHVGcE9Pa20yUlRjcnIzdVRvOEFqc1QrNitvYy9r?=
 =?utf-8?B?UEc1Lzk0NzhoRHM1ejJLWlBNbnM5eG50NmZUSWJIZU8rNm51akg4ZTQzdVpP?=
 =?utf-8?B?dzN6VHYzRnBpaE1WZ0VaM0dNUVVnWnpjK1JZTUg1RGZiTTB2NHVXM1lXRWV5?=
 =?utf-8?B?YVBvWkJRTHhWZG1pN1R4R3ozTktHek5wTmo3YllnUHZtbVI1M1hMSTJUbHJr?=
 =?utf-8?B?YjVJU1NSRGhSalE2ckJ3VHFXYk9lOFMwdUZPUWNtamIyajVYUkdRWVhqSUVj?=
 =?utf-8?B?UXhyWVY4TUhVSW9OaE1TejhTSzloVllFUWhKanZ0MklUSTVhTEdlOWhSb3RW?=
 =?utf-8?B?ZWtnN3AwSUdjSHhsOU9UNVFIczFSUWRVYmJKTStVSS9FZ28zQzFQRnh6RnBU?=
 =?utf-8?B?cUZVaGZiVEsvdUtaZEhHQnNMdlNJUUNDL1BTbkpjYUZEK0ZWOHJiakx6Y29t?=
 =?utf-8?B?TDIvUmxsRzB0MnVhS2owTGpHeFh3VG85NVA0b3Q0cUEyeXBkOG1Rck4vWnYx?=
 =?utf-8?B?aVRjLzBTck0ydGhuV3NZVjdXQk1PKzFJN2JHT0t2YlI4QzBFR0RvMUpOUERq?=
 =?utf-8?B?RVRkeXN2eWYyWlpPOGJISTVkUW9QS2t1Vkg0ZllEWEk5bXhIcVhIam9VSmRP?=
 =?utf-8?B?Nm9SbmlWbFhrUGlWaU1kbDU2enE5L2dZREQwdlFZSWcvdkw2SXhxSVRIYzFs?=
 =?utf-8?B?T0JLWmZQZG51ekVnSzk3Vmlpb0o1R24vQWVzZXFHM0tqVzBBbTM4UXhXemky?=
 =?utf-8?B?NlUxd0RGaDZaWHJsME5CaGhVWUlJZ1VGQzhaL0p5RmxlQytOK3JzRnI1SjZW?=
 =?utf-8?B?YS85RlFWSnhueG50N3BnTlh5SHo4bmhCT3ByaHgxZTNYK3FlNzVnZFZoejAx?=
 =?utf-8?B?bDBaeVNRUU5kckdwT1lkMG9wU0VZR2hDQVBkNWhYd2I1WlpGcmNSZ1JoaExW?=
 =?utf-8?B?N0hiV3g0cHZhTzVldFY3VTRvdW1FVit2VDJHcXFRdVZ3VzhkWklLbmVIQktF?=
 =?utf-8?B?VVdEdzhiNTlTRVpuTHZUSXV4Z21LNTR6Yml4dVBPdTQ5ZERXb01YYjQwYlps?=
 =?utf-8?B?OW9LdWxlR2p5a01LMktNYXhPeFRPQWF1ZDdVb2NZMDBMcmpSR3lWRWE2bWlC?=
 =?utf-8?B?OTBSQ01jSmFPakJ4ejJVUUJnZENCM3BmZlpCSEJOdTZGU1hSMWZxek15S2hm?=
 =?utf-8?B?Nnp5WmpzRmZDb2ZTSjlBaHkvdXpFOXZZZFZ5T1FoNjIrV0NvRkJPdTJIUDVS?=
 =?utf-8?B?Mm9XMEtUNC9IM3JRNlp0Rng2YkphMHJtNFFKa1VIUzZJQTdGVXlYWG54aGh3?=
 =?utf-8?B?RWNTcFVxdGJVMUhIYnFTQjQvSkdNZFhFVmVvR0tnNnY2TG5Tb3JOTzJ0MjNK?=
 =?utf-8?B?N25SdmZBSkhkeFAvZWFrbkVSNXlndHAzRkNrNnlQbVhQOEE0cnI1bDh0dWYw?=
 =?utf-8?B?bUdNWEJma3lySkY1UThLdnFZMmNNa0phUStTMUFOK1FlbjlDUmUzTGhIQjJD?=
 =?utf-8?B?Tk50c2F1Nk1qR1RldHZxK0Qrb3lxSjYvZUVCem9ZVUlZZUdLVFczT3F0YllX?=
 =?utf-8?Q?xbT7Y7lB/q6wt5A4xGkHmPL3FvdfujLa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHlla3Jod3R6S3pPUEFBYisrcHpHTlRXMm9MUTN1N2hsSGQycm1HNllZZWZj?=
 =?utf-8?B?ckJpZitVcXd0czZZRFljTGJFQW83SjNtNmI5SHk0VUVqZU1mbnJML2xHN2pi?=
 =?utf-8?B?ZVdISjF5akErVWRnN3AyS0lzTzFiZFc4QUhLb2d5NGNGMUwrdVVQRDlTeHBn?=
 =?utf-8?B?QkZJT3VEVUFrbE5SU3kzRmx2T2NlaXB6ZFZEQ09ZdFk0UHFlNUc2akRoajV2?=
 =?utf-8?B?TDJCb0VsZzcrYVB4Z0RQakRzNzVlcXRCekdzditHU3AvZDZrbmlHQVZiWGdD?=
 =?utf-8?B?aHFhcDhrU0R3LzdYQ3poclhCWk5ML3VkS0wwMVphM0QyWVpORUI5MlhXMFZz?=
 =?utf-8?B?ckJCcUJHaWVJc1BDSnkvcDB2ZEhGSG51T0hkblIvaHJJRWZqM041NUxDQTBM?=
 =?utf-8?B?dDRyejRBUXdISHVRbXIxeG1maTVmcHJqbUFmUjZGUTZQTUxtWUFSNXB3ajBW?=
 =?utf-8?B?L1Z2OE9NTm9ueS82MGM5b2ZCbWNKb0ErQnhyK2JVcnZzbU8xd0RZbTB3ajFR?=
 =?utf-8?B?YWV1emRoTFhUR0J6R256NGUzNjgvVXVmUk5qRUYzSHg2YitBN0o2bUduWmh4?=
 =?utf-8?B?STRsTmZxcDZ5M1Y5MXQ4bGorVjJBcnhqb29VL2RvYlZFSk5pTHlFYklnUXRC?=
 =?utf-8?B?T0lOWFhLVUtEWWxUdzdnQ1FMN0hFU3BSL2dTTEhJZ3VmMEM4SStMSFk4ZVg4?=
 =?utf-8?B?UjEvN1VtNzFuSmpiTS9vSEdDN1R4REM1QzdqNklOMW9GVFlZOVBORXRQLzVm?=
 =?utf-8?B?OG5LSUN2K1phRkx2Mi94RVJkZkJ2eU0yMDRTakM2c1lYZE9WT2N6TVl5S0c2?=
 =?utf-8?B?R0lXWmNvMFN1YUFVUFVkNFNVYTZHRFdVb3JJUjFXVTBLUCtJN3c3bXErdHNy?=
 =?utf-8?B?cEpXV0M5emlJZ01wMlBKbkxBSENrZTc1TmJRajdUQVpURXhQdUJuN1VxL1Nm?=
 =?utf-8?B?UXIydHFZaWlaVFpkU0ZoOTV1Nm1NYXE5TnVhSzNlaTMxTnFoMmJnUHlSalgy?=
 =?utf-8?B?TWNSd0tFaDBTZmozZWV4ajdyUVl6dzZ1eTgweWVOT05Nbk84eGhrSVB4S3dI?=
 =?utf-8?B?Q1dUNmQ1Q1ZLQ3VsZTVtaUsrTmI2bU54T3RtM3crUytoZVErR08wa3VaTzFr?=
 =?utf-8?B?cUQweDN3Z20wWnFyL2MzRENTcHZ0aGp0VlMyWmpJcUx1Ujk2VjFoWXNueGsz?=
 =?utf-8?B?eWhSNWJjRlBINVdwajM3UU9yejJlMnJ6ZHhFUkxiZ1dDVlF2UGR0UGVhanBq?=
 =?utf-8?B?eFNlQ0l2VHJ4aTdsWGJzWlROWE5mQmJNRXNsM1FVZ3dLRlcrU3dnd1FrVVhk?=
 =?utf-8?B?Rkk3MnJmb1RmYXVkSXR0aktvaEkvZ3c0REtYY1lvREJqVGwvamc1UTZZOVRo?=
 =?utf-8?B?UHIzUWZ1b2dlN0FvWTIwbmFnVDk5cGpQK0NtOUVWNkpKMnBYclFjSW4zVTlU?=
 =?utf-8?B?UHZ6bGFqeXA0NnVCeTV1UVdHTHVXVGJ2QUxGRzF6MHhKNWRPT2JsQ3hHYU9X?=
 =?utf-8?B?TFYvTEppMEhXMHpvNnRCcHd2SGpEc0ZadmdzZmJJeThwMlhCRFdQeDd1bGFN?=
 =?utf-8?B?MHNuNnpPN292bFN0N0Mxa2Niais5cStpVThNS3RtS203aHJEUVpteEE1VkZF?=
 =?utf-8?B?bXkxRkMrazFlZTZCSUxBaUZsb0IrYVNjYldneXptbmRQbm5VcHU3ZDhwUWRs?=
 =?utf-8?B?dzJ4eXdSZXd0Zk1JNEw2eHNoRkJyeThwQTBYbE9sMXJ3YWxWTGhrWTFzYXVa?=
 =?utf-8?B?b0JZVnp2YnFyWDlweENmbmVJV2RXZ1RrY0tralRYMFcwRGx6a1I1bjFqYU5u?=
 =?utf-8?B?cTVoeDdiWHFWYUxuV09naEo3andzM0ZDZ0pDZmJPNVJDK2htK3c2VmpFMklH?=
 =?utf-8?B?dklpU2NWZWtxK3AxdHduLytxMTEvQjd2MWNGSTEwcFRzdW1vSWlHWVA0RmJ1?=
 =?utf-8?B?SktldU1NdmN6aTljS3o5Qnp1d0c3bGpYMktpcWRFRnV4OGJjR2N0S3g3dnBZ?=
 =?utf-8?B?NkZUV20xRDFtU1EyRmRYTmtWTDQzOTVSK1ltRmNPZU10em0zUTIwbGRtQTdM?=
 =?utf-8?B?N3hmQVhTeHE0Z1hjdGNyVTdqbXRpSDN5YklaSXoxeHEzQ25QN0lsNytGTEFC?=
 =?utf-8?Q?yvSUaIP7ZOqCzrmj+zHay6z88?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZeXjE9M4HTKmX8y3y+U9kYGnWzj+t3uodV08MqfY5PYaopplQBPHQqBjC0QchY6+gfOyAHu42olnDtZwV9q5S7LEQURnwA0o/5MT5TdlkrIDeMfV53Ek5564jW4Kzk71znoQ70ZpQjcU8ywk0ccnkKoBw+ZvkBy1n29TKe5BwJq6PlQ0PX1AV7zTod7i2xKQpZmd5KNW65aIsNkV9f6WPmZMSpEy6FHfjlM2DY8PDTTd045fK6Fghl+Jp0yueBTotRSSVPj254f5WDULYUufqn7lbA2QQbg441BZKqgB7m+Xo1MW9MVqmTAS2XoLnM8OL6xX+2PQU4KDTt7eFJtH3/gSq/sZcyWDZPv5+Sd/6PcmrfOW+hVuY603ytfFzxjXQGzCC4YPf5bO69aZwDXxjCu3mYktWuTNG35fTAw7vP2nMq1vzcKrDm4cmjOIv4x3O6h7dE62zg/iNl+AHc87TIJDzhdIuYSNKAjEqycfgBeSYw5i3u0iiFdJR42oOT+bM65lwN6zXWuIGF7ck49VDMaTsFyUFZbrMS6pA4iJ6nfUnvjpjlRapCsdMVtvLuCpLfppArpuLxu+sVNbbxcKcpmgCNAFI8RhBJLygcat3xo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b87322a-4019-4de3-65a8-08de17498955
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:16:13.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNrTa9eEAlxzJVkqOcnpLplQCJzPTUUok0nAA9XFAwXVCNI0X095R3FS8HFuZ7wKKtmPwfyHHcSYLZCTc6jiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2510300000
X-Authority-Analysis: v=2.4 cv=Y4b1cxeN c=1 sm=1 tr=0 ts=6902ae51 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=8r1d1PFDyJ-ddFO6ndcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5O-UvUtCZUrB06X06KYjXc1ciPmRCABU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyOCBTYWx0ZWRfX+kVXe4X7cX4H
 nV3eTzh8nHUOmLCAz9noX72i/bRLLUO1zv9o3tFLBrFvPLzYUWpcQgkZw3vrP69gKo0d/wBKqR7
 u5ydEmyYguBJ+JMk1+WTg2vgxVQKSuppCD/PMNYZGbmJCVKfFWIGZ77Lw+rkfXET7drywBBKgub
 acl5xZv9Ocjt/2/7eAV1RXruPu6I8K1dgeryTc9snu8EeCqUJF8ypKcy5gHz7Y80ft+rni3w2zn
 gjs+aotR7RxE9h+IKeRiwE8blemFCw5GKa1zTkDRvrZ1mgZ7buvM2ifV2E+lY577KDEqjOUnNd6
 GJFRkLs1wsAgFtUDf3b/c2MYOSHReyoo9i2NeqJCZkx/WoPvBTpAju+QOyIVEO5QavHKwAvtrlC
 D4BfMaY3DXmIBjrZ7RPBxdgkUMvQ7Q==
X-Proofpoint-ORIG-GUID: 5O-UvUtCZUrB06X06KYjXc1ciPmRCABU

Thanks for the review.  Yes, ignoring untranslated addresses that, 
nonetheless, are interesting is a problem.  Since related patches have 
relieved the need for this solution, I'm withdrawing this patch.

On 8/12/25 10:06, Kris Van Hees wrote:
> On Tue, Jun 03, 2025 at 05:08:34PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> An aggregation key can be a sym(), mod(), usym(), or umod()
>> translation of an address.  It is passed from producer to user
>> space as an address, and the consumer must translate the address.
>> It is possible for the translation to fail.
>>
>> Omit a record if the translation fails.  This addresses failures
>> seen before OL9 in
>>      test/unittest/profile-n/tst.ufunc.sh
>>      test/unittest/profile-n/tst.usym.sh
>>
>> The problem was that the kernel's aggregation buffers are snapshot
>> multiple times.  If a translation ever fails, the raw address is
>> used instead.  Later on, when the aggregation is printed, if the
>> translation is successful, the raw key will report a count of 0.
>>
>> E.g., we snapshot an aggregation.  The translation of address
>> 0xabcedf fails and so the key remains 0xabcdef.  Later the
>> aggregation is printed and, therefore, again snapshot.  The
>> values are cleared.  This time the translation of the address
>> -- say to the function starting at 0xabcd00 -- is successful.
>> That aggregation key is successfully and correctly reported, but
>> the the raw 0xabcdef will mysteriously be reported with a count 0.
> More in detail: whenever a snapshot of the aggregation data is taken, its
> key/value pairs are stored in a hashtable.  For keys that contain address
> resolution elements like usym(), ufunc(), ... the address in the key is
> replaced with the canonical address for the resolving function (start
> address of a function for ufunc(), ...).
>
> Therefore, if the resolving does not work (no symbol, module, ... found),
> the key with the reported address is used, and a hash entry is added for
> it.
>
> If, at a later snapshot, the address *can* be resolved, the ley gets
> modified with the canonical address in place of the reported address, and
> the data gets hashed using that key.
>
> Before every snapshot is taken, all aggregation data is cleared -- but the
> hash table entries remain -- it is just their data that is cleared.  So,
> the later snapshot that managed to get the address resolved will cause the
> hash entry with the unresolved address to never get data populated, and that
> is why is remains 0 from that point forward.
>
>> It may be argued that some users would like to see addresses that
>> could not be translated, but typically those unsuccessful addresses
>> are not very meaningful.
> The problem with this approach is that you drop data.  If e.g. you were to
> collect this aggregation for a task that does not have symbolic address
> data, all addresses would remain unresolved, and you would be ignoring them
> all.  That is certainly not an acceptable approach.
>
> With the on-demand snapshot code, I expect that this problem is less likely
> to occur.  But it is certainly still a possibility - incidentally, this has
> been a problem with the DTrace implementation from the Solaris days.  It has
> the same potential problem.
>
> Two approaches come to mind:
> (1) account for aggregation values to be 0 (or MIN or MAX for their respective
>      agg funcs), and omit those entries when the aggregation data is printed
> (2) detect this situation (hash entry exists for both unresolved and resolved
>      key), and if so, remove the unresolved hash entry
>
> Both have some performance impact and/or make for more complex code.  In the
> end, perhaps we could choose not to do anything about this and allow it to be
> an artifact of address resolution issues on the system?  If anything, they
> should be easy to spot because they are always going to be entries that have
> (essentially) no value.
>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_aggregate.c | 51 ++++++++++++++++++++++++++++------------
>>   1 file changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
>> index a18de3a75..32b0faced 100644
>> --- a/libdtrace/dt_aggregate.c
>> +++ b/libdtrace/dt_aggregate.c
>> @@ -317,61 +317,76 @@ dt_aggregate_quantizedcmp(int64_t *lhs, int64_t *rhs)
>>   	return 0;
>>   }
>>   
>> -static void
>> +static int
>>   dt_aggregate_usym(dtrace_hdl_t *dtp, uint64_t *data)
>>   {
>>   	uint64_t tgid = data[0];
>>   	uint64_t *pc = &data[1];
>>   	pid_t pid;
>>   	GElf_Sym sym;
>> +	int rc = 0;
>>   
>>   	if (dtp->dt_vector != NULL)
>> -		return;
>> +		return -1;
>>   
>>   	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
>>   	    DTRACE_PROC_SHORTLIVED);
>>   	if (pid < 0)
>> -		return;
>> +		return -1;
>>   
>>   	if (dt_Plookup_by_addr(dtp, pid, *pc, NULL, &sym) == 0)
>>   		*pc = sym.st_value;
>> +	else
>> +		rc = -1;
>>   
>>   	dt_proc_release_unlock(dtp, pid);
>> +
>> +	return rc;
>>   }
>>   
>> -static void
>> +static int
>>   dt_aggregate_umod(dtrace_hdl_t *dtp, uint64_t *data)
>>   {
>>   	uint64_t tgid = data[0];
>>   	uint64_t *pc = &data[1];
>>   	pid_t pid;
>>   	const prmap_t *map;
>> +	int rc = 0;
>>   
>>   	if (dtp->dt_vector != NULL)
>> -		return;
>> +		return -1;
>>   
>>   	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
>>   	    DTRACE_PROC_SHORTLIVED);
>>   	if (pid < 0)
>> -		return;
>> +		return -1;
>>   
>>   	if ((map = dt_Paddr_to_map(dtp, pid, *pc)) != NULL)
>>   		*pc = map->pr_vaddr;
>> +	else
>> +		rc = -1;
>>   
>>   	dt_proc_release_unlock(dtp, pid);
>> +
>> +	return rc;
>>   }
>>   
>> -static void
>> +static int
>>   dt_aggregate_sym(dtrace_hdl_t *dtp, uint64_t *data)
>>   {
>>   	GElf_Sym sym;
>>   	uint64_t *pc = data;
>> +	int rc = 0;
>>   
>>   	if (dtrace_lookup_by_addr(dtp, *pc, &sym, NULL) == 0)
>>   		*pc = sym.st_value;
>> +	else
>> +		rc = -1;
>> +
>> +	return rc;
>>   }
>>   
>> -static void
>> +static int
>>   dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>>   {
>>   	dt_module_t *dmp;
>> @@ -385,7 +400,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>>   		 * appear more than once in aggregation output).  It seems
>>   		 * unlikely that anyone will ever notice or care...
>>   		 */
>> -		return;
>> +		return -1;
>>   	}
>>   
>>   	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
>> @@ -400,7 +415,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>>   			    dtrace_addr_range_cmp) != NULL) {
>>   
>>   			*addr = dmp->dm_text_addrs[0].dar_va;
>> -			return;
>> +			return 0;
>>   		}
>>   
>>   		if (dmp->dm_data_addrs != NULL &&
>> @@ -413,9 +428,11 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>>   			else
>>   				*addr = dmp->dm_data_addrs[0].dar_va;
>>   
>> -			return;
>> +			return 0;
>>   		}
>>   	}
>> +
>> +	return -1;
>>   }
>>   
>>   static dtrace_aggid_t
>> @@ -574,16 +591,20 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
>>   
>>   		switch(agg->dtagd_krecs[i].dtrd_action) {
>>   		case DTRACEACT_USYM:
>> -			dt_aggregate_usym(dtp, p);
>> +			if (dt_aggregate_usym(dtp, p) == -1)
>> +				return 0;
>>   			break;
>>   		case DTRACEACT_UMOD:
>> -			dt_aggregate_umod(dtp, p);
>> +			if (dt_aggregate_umod(dtp, p) == -1)
>> +				return 0;
>>   			break;
>>   		case DTRACEACT_SYM:
>> -			dt_aggregate_sym(dtp, p);
>> +			if (dt_aggregate_sym(dtp, p) == -1)
>> +				return 0;
>>   			break;
>>   		case DTRACEACT_MOD:
>> -			dt_aggregate_mod(dtp, p);
>> +			if (dt_aggregate_mod(dtp, p) == -1)
>> +				return 0;
>>   			break;
>>   		default:
>>   			break;
>> -- 
>> 2.43.5
>>
