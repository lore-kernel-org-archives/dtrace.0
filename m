Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F2223716
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 20:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753390467; cv=fail; b=EezACI6DXmt1Cjs32cRpnORG2uisGn79GO2QdA7HnShpI5VnqOt9eSnI0f1F8mGTFuPhc96TIyuY5QRT8IIwZEgB3YS525BXauPr9Qti61mo6XmP/5A5b/PIxD+kCmGBZ0DXK20nbVKqTX5cQuI6Khw/TfOltBhWSOkuRA5CRLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753390467; c=relaxed/simple;
	bh=+6xh7pVHAvtwNLwLpFUjWACafFyk2hkJfdxw7+D2S0s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YBHGjTjP6HsU9knXjO5WB5bYj4WxdD6OSYRTZzyh4DMHdZXtogL+6Z+NMOGRxMqTarRu1ViuK2omlpzSNygQy+eJuIlIX69ukL0x4TAHoOcQT97oQGMqVsV8mvIK0zROEMe2NzC852kZJkGyUhrM8G5Y0aFEC2pPPVnDuop1sPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XX2w8b99; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y3pJnJc5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XX2w8b99";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y3pJnJc5"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OJfpYP012535
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 20:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Za0vu51JnZiIAvA/8d8CwO/WdeG/MoEa60H2h637W90=; b=
	XX2w8b99ekDMcsmn8CbcDlDSGoBGuAF8u1ttpadCGIqNPhmF+aMGenAJ/WK5Xff/
	/Bwb+r2gX05s37++siNlJjCWpc9f7Me5+paTK7KUNJfYJaKFMQeF3LfTBe04JfZv
	6h3TpgrQ8POm0nJPd9RYDUKH1nuNJATsQ3tjVZT05EgRPbpycIliuyNwhp6gPN3n
	0/wZM97yatawHCg/b2p7Jwiq0IfOCH3PjpaETfPQTSXKst2Whc53qwJUVo9MeoTa
	fafmCwo2X46kYLizfIrOy4VdIQPxGaJOEYFwkgDHIrstLBcKfwfmNIgyX5x+LWNf
	RPO5gA6fdD5NRorProZzHw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpjjbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 20:54:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OJXfl7037732
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 20:54:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tccf0f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 20:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNMfRGelTuKkMyxyLMAaPRU2k18Wjm9/zX2XJA4v+NyL9WrhtS8+pVsHhnnO69iztznVjUQm70+l2ODtSHvMOOfimGkCW/tSpUGPOOe+iTID5V2Cb1s9d7uVbkQ6l1j60Cm4CvG7vpSXaMm2B0w+Ii4yf0fcwpEtrTDkPnfWJ5UgAHtYPA8UuusmukCmV9xRrMA30WXRkpCFbA+Qur2goN25+7TRaqPg/9YIcmnSKcSv1Y9DOwplhOdpFyX3etoBVJ8IWYZanJZ1v5K44tXiCjAGQytiqPWys72hYfdS5x2c7deag8yNTdBltsmgTjQQlDp0Ay1VnZT7wrYNh6S6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za0vu51JnZiIAvA/8d8CwO/WdeG/MoEa60H2h637W90=;
 b=H4DRSV9IEWstQvW0ThzRhuPo9r9BRDyi8eyZh/zf86jUGTy4FXATSJPl/QLyZzB+2oHOQTKFxfhVR/dHufBznqX2qTBLt5ugRlritSGF6AScV8gTJRW3NAeK7iPJfeVRG8J/Aq3O2yssVJ6VUTXdiR7Px5vG0wb0gxUt0AgPIoSp07ZrB/yVCk2nskC50JTYyRvHuYtnQCUFtA5xDJC48+bX28wL4KeNkCBHSgRw1Sk0j6hSlAIAug5EKb2irKyve+3VV3eKvKmtSLD1dhwB2ioVcRiNYFOsElhS7fUBCE2MN3UmMBdPJ4FE0/pDv5WXoKJpTX3KntzdO8oVfRhZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za0vu51JnZiIAvA/8d8CwO/WdeG/MoEa60H2h637W90=;
 b=y3pJnJc5toTS8hER+jhg5aDqTQtRakv3wH3UP0CMXVMyUV1gYhbFZkLtOqcoVRovY9vxrukrYXYeLNwRYth4igSYQulW5idXYseUmWs2CxPenwPxscID8OGXkttq8TTiV+BxGD27e/2LTOiYOGGzgzexy+1HgxlxaMRngDtedhk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8166.namprd10.prod.outlook.com (2603:10b6:208:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 20:54:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 20:54:21 +0000
Message-ID: <d682398d-d1fe-a788-d8d4-3b9fbc4ea260@oracle.com>
Date: Thu, 24 Jul 2025 16:54:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Test that PASSes but should not
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
References: <aIJsb0P4H6S+tO0k@oracle.com>
 <a7197497-1d4a-f68b-f62e-5819e94515f3@oracle.com>
 <aIJ8mKI0nSZviJnc@oracle.com> <aIKCFoylntgaO6Gu@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIKCFoylntgaO6Gu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:510:e::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a59853-d654-4798-4f51-08ddcaf4436c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ci9aajBVU0d2UENmUUtYSk5pMjl0STROekVYVmpTNkZWZmJTNmtvMVczeGRt?=
 =?utf-8?B?ZjNlUUYzOUxwd1dYeEJ1OUFLNkNGbGQ4YVlhZkJHVnZxRzZBOGU0VzJ2bEdr?=
 =?utf-8?B?ZXd6ZVpQVjMxWkJpaVU1dlFvL2ozNm5DYXdjbUZLNDFCRll6cExoQnNBeDlZ?=
 =?utf-8?B?V1MxOXZMYmExdEh0RC9MK3RWTGJ0Q0o2emNWTFBEOWVNOERDTWs5WDZQVkJY?=
 =?utf-8?B?ajdnaXpiVnBYbTRLc3pGMjB5TittZ3NxeWtLa1huUkRlb3gwYjdLUmd4VkNw?=
 =?utf-8?B?d0EraVU5OVA3M3ZjbmVheHF1SG15cXRtRjJwVmhzMVRoUmhFRjdIaDIzZ0pJ?=
 =?utf-8?B?MTN4WTE0UVhrYzZGTXY0VzVTVTFvTjZiYVkzalNnWGtwWExBTDkxS3laT0Yv?=
 =?utf-8?B?bmxQL1V1bE52TE9PczFZNzkxNkVrNkMrdGVIOXN1Q2lCV3N3ckN1aW0yOGRP?=
 =?utf-8?B?a1EzWjVyUzFKeFg2WjBkWlZVSmJTcHBBVnk3a0JCb2tZNXZXM0NFdENFTThO?=
 =?utf-8?B?ZzBjdURnL3Z1am9pSmxHakRWN1VtNUNqU2JZN2ppbmthNjVVKzFCclJZUERP?=
 =?utf-8?B?N09wZlczcGlsUHFkU1FzNGlEbHhkeW90TW1VK29TeUxFcWkycitkZno2ZnN0?=
 =?utf-8?B?OHAxTnJmUG9oTklaamJxbjZkQnU2VUlJcVV1VnlWMUdxRkJCVEhjMm5oQWlP?=
 =?utf-8?B?RFZvUkpKOXJHbnNKMHBPaTllZzF3RDlWV3JhWWJBMHJTSEl4MDErQWtoV1hQ?=
 =?utf-8?B?UVB4UnJqZFFmNzVlREpPck0xWEdJSkNHTVprOXJhcmx1aFVEdlByU0RGeTZZ?=
 =?utf-8?B?ZEl1cmJ5OWRQaXdmaUlHTkh6eFBnMnlzem1kOGlaMGVNVTZER2RjTmx3Qjcx?=
 =?utf-8?B?QlJ6Z0hXcXlXZDN5aWJEMitBUmZHS1BPMFN5NlVFVG04QlY1eW01RmxmUmlY?=
 =?utf-8?B?OE9OVzJLbUU1d2gyR1E3TytPRW5tenRRQWV2c3NWTktsYkxLcjFNVHpmU3RG?=
 =?utf-8?B?YXdFZGYzbEFjcDlCZ3gzQ0hrazVGZUFLeTVLRWkzZHVjTXhlVWNDRzZKK2JX?=
 =?utf-8?B?U29ndWZEMFVBQnZHWWgwT3RuSko5UnNuamxOQ1pyMVp0eHZOT2lWekc2dkdN?=
 =?utf-8?B?RTN6Z2laT1dmQ3VOWGJOQXlMN1V5ejVNNW1nWDcvT09lblVSU2pSdkFoQmwv?=
 =?utf-8?B?dlJDWi9uUWZ2d1hHMEIzd3FDcVBXV09RblpDcktwYWJzMC95WHVhNFhFeHRz?=
 =?utf-8?B?Q2c2TnJuSUR6MWNKZHdWVWx1SEtIbU81dzExWWtCWkY4OUF3MkVqYTdSVnN6?=
 =?utf-8?B?ZC9wQWltNWJ4aFdUVk9DSFczUjhSWUoraEtScTJkd3M0ZWQweUJ3N3NCSVJt?=
 =?utf-8?B?TXh0NEIxWUVtdnpDSnJoYk5HZ3VLdmxJOFVhdDJhWnVreEs1ekRUUmFiZ1l0?=
 =?utf-8?B?dktNY3I5SlJBOU56U2lCTWR5TEVQV0xCeHVZTWdUdURIWHFGUjI4WmM1NG5R?=
 =?utf-8?B?Qk1uQWlUWCtqRzZoQnhCYk82NkpnNFlvZU15Z1RraTQ3L2RzZnZmZjhRNEtx?=
 =?utf-8?B?ME9zenhLT1IrR0lrWmt3Z0x0RTlneTAwZ21OdzhGb3JBT0hYNm1yWXQrUzNw?=
 =?utf-8?B?ZnloaGx2RWFJd3ZjR2pmNndrVHFIZnR4dGV1eFVSMFRxWFFQMG9PQ005UTJp?=
 =?utf-8?B?dUxWTXNCdXFSei83NlVYQWZWbnVueHRsSEV4SXhPd1pHQ2ZNSHp1WlVHaTQv?=
 =?utf-8?B?c3JtMXNHTENmb0tjQUlFaW0rdXZ2bTl1YkJMNWdMS0FadTlJOStrMHZFRXVa?=
 =?utf-8?B?cUxBaU5uc1pGeEd1eWIzRUp5VThsaHdWdkVuZW5PeVQ1aGtFcENVLytqMEoy?=
 =?utf-8?B?c2cwZm9xNjhQSUtCZzJZZXhYZlFtSDczdmxqZXBBNmNrYXJiOUsvMFBtNUMv?=
 =?utf-8?Q?DwnssxDhJWM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVBieXpmZ0xjRTVDVERVZFdlUlZVYTRPYVZEUU5Eb1ZTWlAyTFllUEZVSjAy?=
 =?utf-8?B?NUowNTFPUFBCYTRMWXQ1MDhudVN3SVJiVWs3RVNuR3pMTGQyWVBzQWFWQXR3?=
 =?utf-8?B?WXJjcm1ZWWtFZG1QK0s2TmFZVFQ3VTdhczJYMGNTQ3VKeEJvalVrLzF0aWI3?=
 =?utf-8?B?eGVSY1hMQkt5MzlGOHVKNlFEVU40cWRvemlscXI2a0QxYys4VmlraDJtdDdD?=
 =?utf-8?B?QzZ4bGExYXJLYitlZEFFWGRXK3lNRnJVdXRXSnNXKzdCei9rbzM2U1ljRFgr?=
 =?utf-8?B?NFNPZThkMUlzWmlPTGhiaUJkcVY0Q3phYnpMUkdobStkdGVJeTBURm10Q2Q0?=
 =?utf-8?B?b2wzM1pnLzFPUktlbFJUWTBUSzR1ampmMjNBbmxqVlR5cDBQUWFKQmtibFNI?=
 =?utf-8?B?WDFsbTJobEZYWDdrVjR5R2tEbTdURWJhd3hiUWM5eXpRWXBFMzlQVXM0ZGhV?=
 =?utf-8?B?NWVTWGlUdVFVNUtweGQ1cnBUdlpYNzd2bXFHSnJoVGFYQUQrUWNEczZaNERi?=
 =?utf-8?B?STIxL0R6UVBIRnBIZmtQWS9SQ01vTlB1U0tjZ0ZjSEJqaHB5YytJcXlKL1o4?=
 =?utf-8?B?ZXhpYXoxODdCQkJCa05FaDRhZUd0VDVieGpWSjFkcmhSb3NzWU5DZ1hTcG4v?=
 =?utf-8?B?YmVuQTdVL1FOYlkyMzNEWjBHaXl6U3FOd2F5SnJ4SWJLZitjUTVrMm16a2hz?=
 =?utf-8?B?aXBhWDJ3bjVtY3lyeHVQYnZqWVRoRk1DRkRrb2M0aFRFMWQxV0RxMS9KYlRr?=
 =?utf-8?B?MmtsK3huaUlSYjVHajZqNGhjRmV6VjNQampwTWtER2MwSTNVZ01wMzFkbXpN?=
 =?utf-8?B?alBFbDNsR0JVQlVIc2V5cS9FWW9TRmx5SXhaSVpaeDR3ckNSZTVnMVhrN3E3?=
 =?utf-8?B?NnVMczZJS0pRTkdqclBHclMyWUVUaXZueVQ4V01ZZVFCK1crYnFXUjhtRGNT?=
 =?utf-8?B?a2o4REdtWFJUM2wxZFdBTFRydUVndGQ3MnIra2RmYVhiNWhyT0RZbkdzcGtI?=
 =?utf-8?B?Qk90LzVwd3g0alZwVXNNK1dpU3g4akt1WEFweFhleVdOamo4Tnd5Y29sRzBm?=
 =?utf-8?B?cG0rdlZ4UzduSW9hZDBDdUMzaXpzUHZLNlFGSDh5aXBZU2VLclNKM01ESkxC?=
 =?utf-8?B?TFRBbUZkWW5reVYwYzIycFFqRDR3R3FRMzhoN2IrdExzbGtqckZsSnI2TmpH?=
 =?utf-8?B?SmJjeVQxc2tTb21IUjk2MDBvd1ByQ09Ed3lJYlE5eDNjWUNyYm82WVdIU0hn?=
 =?utf-8?B?bE9wcnphb1dpTUpuZkVKTmVoRDI4VmhMeDd1SjFrQVJ2N0VaaG9hYkNuV3pi?=
 =?utf-8?B?ZlVEVzcxY1kwOGV6VVVUc1VuSTZTTkV4c2VaaG9VZ2kwZFR0d2Zpa3pLMVhp?=
 =?utf-8?B?OHQ2bUcxUFhRZXdaRGdtVUtMbG5ITVRCeHAvMUJTdzRHS0p0MmppTnppYUFO?=
 =?utf-8?B?aFFQSnJzdVdGS0pyMC94M0lHamhRcEtIQjczZHhUQlh2T3ZTVjhEKzlFSzhY?=
 =?utf-8?B?cVhXMnRPRG4yZHU4c3QyZnUxakNZUFM0VjNEWjBEcVVadStYdFQ3MGpCSmZ0?=
 =?utf-8?B?TzVyOFIxaFFIYzBsRlQ3dUdDRi8xalBPR2pxYWMxellCZ3Bhaks4WG9JYzlB?=
 =?utf-8?B?VzQzY3M0bk1BWHRYTVkzWENRZ2x3UCtnSGZ2QjFRY1BhY2hvbDJRMkFZbGVt?=
 =?utf-8?B?MG5pUjRNSnVraDRqRWNkcjNPWWF4ZSt3Ykphbnd4cmpSWDB4c2ZqbVhYZlNl?=
 =?utf-8?B?TGJxeWdURTJja1dXa1JxRlk1L3YybG41eVMzdzlReDRWMllyVkdBaVNWbnJO?=
 =?utf-8?B?V1IrZytwa3ZNczFLU0ZYMWdMeUdUSCs1TEt4M1ZWc1d6TnJxNXhLZjlJb0xx?=
 =?utf-8?B?WTJRcnBoRkZtNWFITkU5K09wL3JCRVNZU2daNkFOWCtsMEZpMHRCWTF1UnlT?=
 =?utf-8?B?Qzh1ZGlrVXk5bFVjWHlJTXFxVlZpeEVLTU1FaEdkNE5wUENMMFBhMFV4OWZ3?=
 =?utf-8?B?eUpZeE81aC81b2ppbEJmMXlUMEJzMTQyRkxOZHd4alRBSFhhODNyWHUvL2tl?=
 =?utf-8?B?dkZ6OUdRalRlRWNWVmk1dnB3ZmtueVhwZXVDSGhzcURzNVE5NDBaMEl3Nk9D?=
 =?utf-8?Q?kgFklRB4cCNDPNDaIvHDNbAuj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mdyprht5BbnH6SFnD0zC1S/1V0a1KPFa8J01jIJ7czGC9PwtwoNpyl9UMwUxbbDQJWUHKKqkap2/syOXxWRMgQob/J0oH3l41Bdrb946WfViKRrumpnyqsQ7Mrk6LrYyXXLItYgTmQYb8zoWaDWE8iHPsMHuAOBaFqUuO4DbcfPxgNrQKl92rW61vtSJipxrDF4vmRSfwA2TA/g73BNF0jnvaL3NJ/UuoCsOfstLXfTUjufRkjc5JZhhN/9QXZOBRMFTiJ7pmd+p1U8NycagUCrOl3/6AinYepdWXBpnKClrgeLg31sOLowYF2dlBh0PnEu0/Tq3LUBj1zHueHsOwhqB2xUnMXZQTQuVb4E+ycTnS7KsMD0F/3ApWU066zbmwwgbvelqRqICbYsHhTcsDhjIVPAdK8UrRKzqbPOy9f71VMJIJwAFiYgawJtVt2E6vCf0KOvg67ecv+fvQVuxnPRpiBE1PYua2dbF0ag7RTa+Fj9D51jquYwpT6ohdfS9an1HjyEAUc0ZAeueWmlC7A/KeLjon3O4oNjFwM0sNvTH8EIZdrL43nJPQfVkoCVSyUnF73qOHvDam89Stu+Kr8VYdMRBTIAukC+XJRsDTyw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a59853-d654-4798-4f51-08ddcaf4436c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 20:54:21.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/McUB/LRuRKokbQ5kcsTM2+lNdgHYRiV0x5+/tAuH1Jn3JEsohSVlafuvBbi7a5Ni+mz3cDx8eibwlW742meQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240162
X-Proofpoint-ORIG-GUID: wufDyOK35RSlL6QuMuAoXhOZPU_b0oE-
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=68829d80 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=Ijr3e9ChWWoZXXyNWEgA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12062
X-Proofpoint-GUID: wufDyOK35RSlL6QuMuAoXhOZPU_b0oE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE2MiBTYWx0ZWRfXxpE4jjj0fIuH
 ZEyt9Q99Yxg9I5MpnNAvlSKuP8XILUPuwMab7z2yoMPWyq1ks5zxmctpfAwNTBu1zYx6PNma5OH
 0O65a1rvulD16GtK8wTHGg/jG9cOY2A67OoECEjw9Z5AK+VitLoYLZkoEiJSm16WbGBVXbztl8G
 jVxz05lJjb3JC73oS/iuqzw5zGLaAlTpTEvu0MaqBmvVn3uxLuD/YKYyzBaXtQJLjMfwUODO8QF
 KAEfCW8d+KQ0wcblg9NZr17bJRwDhjSlXrmJMGe2LSfsVMeO+XHwPfGwmLatsaw+uu3HgUcaSHw
 A5vBOAcJGKvNjU+ta6v7Wmx1YqdcVPRThhZPMwhCUGNzFApf65O2mR3D8+s+uBARGptNUJWepke
 bxauI1TsjQW40bEFdOKij2c7anHIQgXugQ63tOOCTadcehY309A7OBQWubXjsuspo87STaxk

On 7/24/25 14:57, Kris Van Hees wrote:

> On Thu, Jul 24, 2025 at 02:34:00PM -0400, Kris Van Hees wrote:
>> On Thu, Jul 24, 2025 at 02:21:36PM -0400, Eugene Loh wrote:
>>> And yet it has a .r file?
>> Yes, the problem is less with the test and more with something going wrong with
>> BTF handling causing the probe to not have a BTF ID and yet it is trying to
>> load a program for it.  Attachment should not even be tried in that case.
>>
>> Working out what is wrong and fixing.
> Patch posted.  Was an issue with the BTF ID lookup code handling modules
> whose BTF data didn't get initialized yet.

But how could it dump all that stuff and pass matching against a .r file?
