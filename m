Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9BA29CB3A
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757968912; cv=fail; b=t9xyxeNAF+CNgQuc9xFzUxUtHDol8Pc8Hept8jwosoN7aimXulg/4A5bcBgkLNCMbk+cMy+KG6upiYLrYOHvQOzEJIx952lUVAayzB0OHNENBCCx0u+ckjdgi6qZBiM81cfb81/40ANKKZ+XRXGKMDll/HBl1M9LPxMsOCr4IZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757968912; c=relaxed/simple;
	bh=HT79ALj7WBf+wiHkcat9flb0ffC9tcghfvhFSujI+MQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fF2HT8BK08VTpNDtQ9zbsXhZTomAeYKto+mpR+YF7Hsdq8+/pBRDFAUE9KQkhrsH/L5dL8sxHP8BYSD75YIdBvslGAbN3Bj8op3aalSaPbNncT64SvWQFUlWzhsMryVJtONJgroK0j9T1RHDDkrC23g/QwRpIms+4zwSL31O9ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QZu33vPI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sih3CeFJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QZu33vPI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sih3CeFJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FK7aPr028302
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fRpPH3D69V17atO1Q2fS4Oxfsk27+UgGgMMx7BoX4nI=; b=
	QZu33vPILlOYaP2slV57fBgnO3kwZcGBknTqmIR4AY2ZPJ5x3xjxLzXjkre+Sqv6
	rkEyPoP3aGfPse8kvllj6GLs2R1nSaykMlDWeVvEDDINHaU67eWhKXjbkfajxmyy
	dYspnYJIvmwoySre4THdxwfsbCvQTQprfrmNU8XzXXwjbDy4GANesqVzraEmwvZd
	hTfnOz7MpXwroK8gPHKvxsTn3L/upfHJVk2IYn+2BBQKjdEyIUMVbbInkL+2VxN3
	lQTLBFUmno6QaKRlyTD72ax7pxZJ/GO618k3yRp2hjAn6V/1ReZSoCA/lKm3Kt5m
	vg4MJwaWRCGa8oIMEx9LBQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y72uaxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:41:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58FK3e2L037281
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:41:48 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2hsvw4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GksYYXb8nNbxfoSNffzYc309ftvfpfKbXOFY43rMyx3/VFIN39OkCD6UucX+58sz/wzlB4M+XNINpz4QID/ekIQQ+LoryuyuKttbThvliAjMbEKph84ZIFZQadsJrGErbIUje9E9GN3mfWuofw95QDRumdJ5jEDtyqYfw117DL3XRw0gD3PUZS5NsQlic16l+BfuEBu/f2nQWRfb/P2vzoP1a8+IWapZvTz7OIl2nFojzwG4UztEoTwUZktR4efb6OwvexhyJEAcOHhOg0DJ2HM17Xr74SXoFIyYrYGwNxmZPYl7enw+P41YKVcimAv0lHesU3bq9IBk2WV/raH07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRpPH3D69V17atO1Q2fS4Oxfsk27+UgGgMMx7BoX4nI=;
 b=tNjehl8P5uQPXLuVebfg9j3y+tv0JXPM5FJ79DWLMQM0tXZ7KlyL0QdKB/jE/vSbrQhM09N6l2Qej/07Y77iVgBbBSosPH/8b42mxJZmZrrX1SHPxH7fRm+yxPeM32jv8LxKg8wxL+s4suG2jUUXjwHrt9V8ULBcr7lFDgwr+tLHq5ZI+scbq1aNLUkS+sJ6X0TkenkX6rndMpzNho4Q1ykqfQi4hNYTELW5Ix0Q6pk6VODt0G8UEkXkUlXIapJqJJPzcn28FY/PYHjMq7wvvMLXnO44M+9FnplZfNoieZZmOV2QbS3XNmlzGPD0W1jelxaE4drNzEatfMPpcoeJng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRpPH3D69V17atO1Q2fS4Oxfsk27+UgGgMMx7BoX4nI=;
 b=Sih3CeFJ4Ucb7L7RLUeERtcnATves3WYoU9cl1tgpLDSd5GK5mIj37QJqiIMlTJJSUqCzmS8nzcZI1zO143Pwt9v5w7GtXplQ/aHtqfQrtDti93v2gj5FafA3NS4iq0/cAsMi871MR22B4EJlK6/rt/NRjysTatCpRSKU4QRF3g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB5173.namprd10.prod.outlook.com (2603:10b6:408:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 20:41:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 20:41:45 +0000
Message-ID: <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
Date: Mon, 15 Sep 2025 16:41:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:510:5::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: 692e45b8-349d-4ba1-98e4-08ddf49848dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzMwazZPS1ArczR4NHlIUFNGcnRldy9QcGZiZFl2VzZEbFFKdkt4SjFZUzI4?=
 =?utf-8?B?OUdJRGI3YjZvMTA0Tm9rSjZyT3k3aFZsTW05NktrWWFONkZmaXRuOThESXZz?=
 =?utf-8?B?Uzk2akJqU203MExrOVJvMlR0OEZXTSt4TEJEN29oWmNISGxBWTc3SVIyM3Mw?=
 =?utf-8?B?dkV3UTZ1RzNJWDFvQVBFZmZmYVVPay8zaGMybFFyYUJvdXNJZWNsU0U0Nysv?=
 =?utf-8?B?Qlk3VEUwaUNsMFBBaHJiOUtMekExK2V6dWdlakFCNU9yM3FScjJ6eUJyVTFp?=
 =?utf-8?B?RGVJOFlvZk9MUlA2bWpRRXJGcHRpTHpTQ2hyT0o1WHV5L3RrcTd5dWEzTWZJ?=
 =?utf-8?B?clJ6VGUwM2tCVUR5V2E5Y1AzVThJcFNHeHlTWTA5aXJLdHZ6eWhDcEpMcFYw?=
 =?utf-8?B?Nm5SUFI5TEd3UDc2SE54NWQxRmxmeFFDTzlhUndNaCs3SmREMWMyTGg5N1Q1?=
 =?utf-8?B?TjUrR2Nvc3phWTdnTTNvUlhaYU5IQ1oyTXFlVXZBQnhkV3RJdnpWb2pYTzlT?=
 =?utf-8?B?QkdzOGJuNkoraTVMTjdKbzhoeFpERG9pU21pMVUzM0dkNXJKb3BUMkhoYUpC?=
 =?utf-8?B?WVY3cnJCM0dETXNoZDZwak5jK2cyMUNZdUJQZ3E3T1RlaFBxc2xNdFRTTDZu?=
 =?utf-8?B?YXA3cVZhR3AxWU9QRFNaV1FqRE9rRERGdUtUdm5yNEduckhrRnMwOW9EaVZD?=
 =?utf-8?B?ME9yWk01SHpEb25nUktGZ3NQdUttcFJibHVUd1ZCdDBoR3A3b0hLMHpoTWpY?=
 =?utf-8?B?ZUpHcUhIT0pLcTFKRklnZmxEMHNsNHdxeFliL0tmbFM3RVpLckY1NFZTaVV1?=
 =?utf-8?B?eWd6aHZlbjJTbExYU3JJOVJDY2VJZEwzZkhZVWxWUDFMS0F4WnVld2tGWGNu?=
 =?utf-8?B?UVJVNEs2c0hvam00YjZZVnZuK2NGUTVTKzllS0MwdXNWeS9TeTZ6TkE5NW9w?=
 =?utf-8?B?MXlLcFIyYlU5WlNrYkVLdzU4VlZQUFFGaDM1ZXpXRnQwTlJJa05kdzlyMXRy?=
 =?utf-8?B?cUxWSHhpZGl5eGNmazdweWdrbmh6aUdzNUFIWUo2NTFDV1pHUklldjlsTG94?=
 =?utf-8?B?cmtydEprTUM0U1lzVFVPcE91Z1BQLzg0aitpc0lvb3ZxemxFdHNjRFpRY3px?=
 =?utf-8?B?elljZnRWZ0RWTExyeXgvVTlCd1RuYk1WOE5WNDFCTW5NSzhEQk1MTStibzdE?=
 =?utf-8?B?M2xFZE5xUloxaU9aZUs5Q1JmcHhGR3FFZHBwbU5JZDRNL09DZ0dzcUdKWkpT?=
 =?utf-8?B?dHJ5Q1lwclg2U2plTXZSam8xRjRSak8zVXpZV0VHaHVWbFgwUjRHUzdKNVJE?=
 =?utf-8?B?NmlMM2lGYjAzaFlRS0kvSzRIY0VqQnZrTmRtV3UzdHdJeGREU2FiS0h4dXE5?=
 =?utf-8?B?VmFwajhXV29SaEt4UkFBMmdPTkg1MDFCcitCdWVMQmhtT1lIaDA4OVp5Z0d4?=
 =?utf-8?B?VGNFTkNobkN1V0cxUWpsYWd3QTZjLzduZ2NhTmRzQjRiK21NRlFMY1l3S1RI?=
 =?utf-8?B?VVpiOEpsSkVwQmlpMm82eVVhenQ1TEh5endLdnhYVEppSm9jWCtlSEJSSEFM?=
 =?utf-8?B?bUtBOGVDV1l4djZ5cFVVeFV0UTlBRHFadmNXUGNVQXFCT3RncStrZGhVYStn?=
 =?utf-8?B?WGtGY1dBVWJMYWZVcWM5WmlBVVR6YXhTRlZ3Q3BqT1dVR3B6akdEb2gvajdV?=
 =?utf-8?B?VVdPaDZNYlYxVGozMlJEcTltZVZtcTFETGw1YUhVM1hhdGw2WFdmQWM5TlhR?=
 =?utf-8?B?ODlmb0NjM2pEY05Cdy9TZWVDN1Z5bkZaVU8yVlV2Rnd3MFdJOG15QThFR21X?=
 =?utf-8?B?QW1oREtaWXh2Yjc1b0ovZUwwNWJNRUgyL05YR0h1djFlU0hqL1FTREFxVGNn?=
 =?utf-8?B?QnBpODcxWEhMZ2g2TUtWZEpEVlBxUDgrS1hiUWkwUmViQ2taR1NhZ25mNDNk?=
 =?utf-8?Q?rduVGXcr+Ic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWdoWitXOU5jMWhMNURpY200OHJ3VTRheVNXQWgvL3FyY0twWVNiaS92U0Ja?=
 =?utf-8?B?V1Y4VlpmSWdibkhGTmFKWDYzRHl1YjU4MU9oVkRQR1ZzV0dCM3dmcm5kUXY2?=
 =?utf-8?B?UERpWVMzdkxONWRmSlpwbnRUVnpPSXRPRVhUR3ZsU3ZIeEVDSURjc3NteVpK?=
 =?utf-8?B?d0tkTC85VVFmTlZUSGRlbUtoQVNLbDBFcytWeHVnSVdMZmVvU1RNZWRZTlYv?=
 =?utf-8?B?ZkNBYXkrUHpwTGMzMGU0MEFoaGZTOXRHa21SZFg3bW8vME13TzNhRmF5Rk9W?=
 =?utf-8?B?SVNGVGJXUHRaSCtjTUdOUGlZSVpmd2FtOHIvUGtPSlcvTXlUMk05TnVjbmVL?=
 =?utf-8?B?amVlVm1RTVZtZHljU1lERkd6RVFLMWxCa1NZR2pjMlpPU1dna3R3QnlIamtK?=
 =?utf-8?B?MnhmRktVNkR0TjBMbnJyNHl4REhTYnhUaVJSdjJMa0lyT3lVZjZ0Y1V3elF6?=
 =?utf-8?B?d3V1RjBuQ0pCaVlSTDZITHVJbUx4YmxCRTZaMEhQVEVwa2NEb3o3TEFNSDV6?=
 =?utf-8?B?SXZPV3lMcVRKNjQrZjRTS1VITVd2bEZDRHV1UlRmbHZNSFhHSE01ZFp0UW9j?=
 =?utf-8?B?VzQ0TC9Sd2tmVUpiWkZTWG5oVElxaE1ldkM3aWtoTnFVRGtrRHRoRE1XbmZt?=
 =?utf-8?B?SmZ6WGpwTDVaUnF4VFhWdWt4bW1EWk02dm5FL3lJMkgxVFpmQUxqNlUwTnRm?=
 =?utf-8?B?aEMxWE1qaXdKK0w5NE5Ja3BrQnlhUWg1K2xxYUwyWWZ1WDNRTnI5ZEFQQ1ZJ?=
 =?utf-8?B?N2hkMGVueFNycU8wNHFYRUVPZ2dkbnVtV1lNUzVJMkQxOEVTTFNjR1I2Z0p1?=
 =?utf-8?B?TEVYeVNhTC9XYkIvMloxQW9TTENZc2lCVjloODJLWjNhaVlsYVlkbTgycXo0?=
 =?utf-8?B?eVc2VGhza1Fhd3ltUS90eG10YWFsZGU3WSt1Tk5LM3NTT2dDZDQrODkwUjVP?=
 =?utf-8?B?dUY0Yi9TU09oNUY1Wlkzd3N3Z1Z1RXQ0NUpiVXlsQ0Y1SWYrQ01wQlRvUWx5?=
 =?utf-8?B?MDBMWHM0SXVNR3ZnYUk3bVRORFVxSngzZ2JEaGVmL3RDV1hhUnJCRGhpcllQ?=
 =?utf-8?B?SFNuUEI0VE9lWi9jU2FlaHY1dit5Yk94UkZIY1gvb1RjeE44aDdwaTVKUVlx?=
 =?utf-8?B?bjY2WkpTQkRIYnJONGEzamVqbER3MkVpMG1RZjlmZlVmWjgxMXlLVjIwaHUx?=
 =?utf-8?B?N3lJSWJUWk41OHhHSXc5N0RNVkluM0pjc1FSeS9iL2xTSHo3N1JqcDVZUXFD?=
 =?utf-8?B?c2VTMlhIRndJb2JEZXphMEl5YmxzUkpRUzBEbDNQOU5RdFJQQmx1NEJrNlJ4?=
 =?utf-8?B?YlJsb3p5b0VuVm5HQjhiVFM5QTdXaVRvYmJjN3RKcmo2VHA4OS9kRjlXYjdQ?=
 =?utf-8?B?ZnlpOTdnQU1NT3lacFZ5WFFoZ29NeDdCMFVBOFA1TlIwUW1NMFdnK0xFUHZE?=
 =?utf-8?B?KzVqcVU5WVNUTExJaDhXS0s2L0FCV21RU3FGckZ1TzMwbEs1QkQ0UFRXM3BO?=
 =?utf-8?B?ZTNMTjZFQk51bFJFVGRzT1BLdUR3WXhvNGUzSjFkcmRlTDNaMVQvbjk4d3Zh?=
 =?utf-8?B?U011c2Rxc3JiR0dTYXVTWE15am9wbWs1bFJwZVIvZmhXWXNZZ2wyZkpzNnhF?=
 =?utf-8?B?TkRaVTFCQk5hWVVSNzNjM3BmMTR5dHdKUTB6Y2pXMEpwcWxDZlppaGZzckRz?=
 =?utf-8?B?c1hwSHEvZWhYdDROeEdCN3NxWE9vS2NyQmNaRnRlMkhqb0pWSldOSVF5WVd4?=
 =?utf-8?B?WUFFaDhRSStxTzdUd0RMeGVEbXpwY1RGYlEyWlZGeHZuTmEreHUwMmovZjVu?=
 =?utf-8?B?OGhzUTczcG5qRVBzMGZuV3cwWlg4RTVya3ZLMnZHZDJDcE5qRnJPNHBxNmdM?=
 =?utf-8?B?SzM2NlFoYzRvRExHTm5CbWxnT2t0VlVGMzhQaS9tNTJxb3ptaittc1Zjd1pN?=
 =?utf-8?B?WU40WkR5bkI1VVhEeW5JWXJFT2lLK0RORXQzb2g4WlYrUUJ2UFFuM1IzUzRV?=
 =?utf-8?B?Y2Q4SEJQdFFqOXl6Rjl2OTBqcGh5VmUxRjZzRUJxcnUyWS9vb1FOWlpnNDh0?=
 =?utf-8?B?VWNFejNEQXJxWHZBSWdOQTJQdG5SY3JFcWl6RktTRGo5bGVnbEt0SkxJNGhv?=
 =?utf-8?Q?EokjrG9Yj9O1OAVhxe8vk3rpE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6HjfJRKyjrxvGhPBNn90F/cQk16MiWNI9t/+rJTHIbY9tQjX9nlmH2FsehYWWAnT9wRwCurNYwL09IGZkUCNnEbmw5hbfu7z6RVKaGxCC9LSji9AEiR54FROJydWAGtSahCuN2jNQI/qfl3EyLWuvSeei8KYEllbDDirZYzQF8T+qlA6/U8Th45TNQdCZK+tdDPce9aJqnn1i9HBKkYOJO2vltPpdReUrSZR1oVO6RqBQ/yWr6NiAtjrao9Hg5OnX8tCTZcHrEG+xQdzgZgxb3Yb3eI/JH34ZPA/dZOQHGDvrNeaUUNye3/bAD3hZHKNT4DAXLRpbd0Vvyh5K2G3T0xS59Fd2/T6EQbvyAWBRORJbhW/STriCUFll5aJqIkmvdEkiewZBqBbxNRKdDiLR2AnZSsCliYKsw0AHcMKmRJb9RjU+i3W6skc/kzPJ1ITso7RkYOkY/CPtpGlj/0jv/cHitmzY1+7NiQRVH0INfNpP1QYFmJo9LSxqTG+c3SxXFi26LVK9xuz9FcRKNwF24idcYVxNHZrkddwCXIYglQfaEZeMMGB/q4+fvWF1XACQSyZjh52iRnk+lXQyPkrbIu626NKzNYJortdRA0GdUM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692e45b8-349d-4ba1-98e4-08ddf49848dc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:41:45.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biP098y/zeDlud7ll2l4hAwkkwZuKG9L9AqAG33zsHfr2vS+DqKBF43qDzvYywl1sL8UKSti2bs+G1+PRQzSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509150194
X-Authority-Analysis: v=2.4 cv=F9lXdrhN c=1 sm=1 tr=0 ts=68c87a0e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=z1lyUl8hYMswzpPES_0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12083
X-Proofpoint-ORIG-GUID: aFGUvmNJFSEWWkwCoIGW1NNVbkmGAu89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMyBTYWx0ZWRfX7IpBkQNkgiQl
 tEEol5bATYcjuv75BdU4P4QfOkRcT/GaR4w8vR90fByeYnYInADTsXAfn9QM1c6dCwyeQzQOFtw
 96GWYhSvPtE5Jye0oK268sjdS7C+Ghq07XLUChqisb0Xn534JnRMZ+H04vBxVVIdWuaoEJVYLrB
 BCUsVjzaqbiauhKdPwkVlcV5dDkXgkoWjuh71suWy1HqRE51HCvNDs4xdXoT3r/7IPfv1aFrteZ
 6IANMLtocrJhH+/NGhwGVuJbvD/9v9Muy5RyAJJKb2XloLqPJ71RtKQjLbn6Txx+w3oEtmWWpDd
 PI/U/SRKSpbWQKOe0bNKztqDvCnTfQXPYbz0/KczmZJcQ5VBZhcJvjPVQRo435DzViQrQTjsCr9
 v2En7sqICF81oB6cT0Yq2M8cO5C1XQ==
X-Proofpoint-GUID: aFGUvmNJFSEWWkwCoIGW1NNVbkmGAu89

Largely similar comments to previous versions of this patch:

On 9/15/25 13:36, Kris Van Hees via DTrace-devel wrote:
> Because alloca pointers are stored internally as ofssets into the

The same as for v1 and v2:  s/ofssets/offsets/.

> scratchmem area, they were printed as small integers.  They are
> now printed as actual pointer values into kernel space.

And, again, the patch performs poorly against testing.

The new test gives me:
     -OK 1 OK 333 OK 55555
     +OK 1059965305 OK 1059965637 OK 1060020859
which is to say that the dereferenced values are wrong.  (They are all 
the correct values plus some offset.)

And with this patch, these pre-existing tests fail:
     test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
     test/unittest/funcs/alloca/tst.alloca-bcopy-top.d: FAIL: expected 
results differ.
     test/unittest/funcs/bcopy/tst.bcopy_arg_order.d: FAIL: expected 
results differ.
     test/unittest/funcs/copyinto/tst.copyinto_arg_order.d: FAIL: 
expected results differ.

btw...

> diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> new file mode 100755
> @@ -0,0 +1,11 @@
> +#!/usr/bin/gawk -f
> +
> +{
> +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> +}
> +
> +{
> +	print;
> +}

Why are these split over two awk clauses?  Can't they co-exist in the 
same clause?
