Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088434DB50
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249170; cv=fail; b=pVYm2uBK8ZGLCeg9qAfF8KYuTMrK/jGBp7WKaxO0tvZ4cultGvbsHbABzh37qNb3hWjkTnZOANVt4eYDGw/NpfcnpDtQefMBJWLZC3IuZWWXauZegkv3463cs5EV9RibqZ/ADavbhLVEVxuUu2wThGq8hzMeUrCHUJR5QZ/MBZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249170; c=relaxed/simple;
	bh=y+TTLgTTafi3j1BIhXVPf3MgX/H4OEL8ywcKkIm8TXs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nd8xwVLhnfQtTAF5+xDz7T/B67gId4tuvXnBHp31lrQ3dqVGUpGgWiIT+1hZUtp0PyMvmWePMZbcXP1ngUC45atCyED6DzH8ZBqDcbF0xIIi+TlcQ5rmrJeLjM58E4GYpi+aXcEW0/nR0izv5FTUT4cE6gpEwbD8PCOCrO3cyNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sN89mfxi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wxCqoQpn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sN89mfxi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wxCqoQpn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBwhl019642
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0BBP2z65Dd8DgLZMTsDcYi21zgxdEr/LCSVR2KzObhw=; b=
	sN89mfxidSkyIurre7H8apnc0fiPxsACxSX2im/tglDh+/ikRvG7tYnr1iFRkf/+
	5vaapvBRzc1hEebMmxPOwImqvN+udRy+cC0lnNwMv98ztvBsd3VKeS7oN6TQdzC5
	LvwVCpkRxW7Lr3iwN3oC4vsFhWu2r/Rai7P+c71AbSMXzOM3e+7EurbiXN7icZqJ
	lK1LZoWZ6PsYfdfPixzSCwrFIQXwSlVplolWeptaWLX0q679NcH7Vbla2Z9ua0O0
	5T9fbMdLidOyPC7ZPV2h0Gi2NnOh292JNUBtBPg2FbNB+k68lLB5stweyuhDMvsh
	qWZNxtu8U2bODqDeMsJCFg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvd0uay3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:52:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIRZ4A005613
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:52:46 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf1atn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0GuT5NOLXnB7cpjREzsok5LODDgj8AxYynHROVWAWxpSPbf+mFTXHfweyJ/e2aurL+DAEc0Xa65taaa+Pewp51weat7G+Pn0qsBu+kFIKN6Mdxs2lAcnf1d5r/GlVJatf/qpCzotadvnYTrrvHtyPzajkVEcpBiiDcc62RatxvFgTpfq5NgLtS84JHDz5oyJs90S7DjuYWP1Bfyc7ZC1M0vItziQJzNHWIQDD4mAkmm3/60RWADO0ivuv4o6uxpaVkIN504l+mdZeowb8ej2P+F/fRfTDwhN9VowtvEfM02t5S6q6/WWFhfxfNevEXig5LTUAgdCcZ8AUa/0OSBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BBP2z65Dd8DgLZMTsDcYi21zgxdEr/LCSVR2KzObhw=;
 b=PJPMy4fCugCl2tp9P5q8TD+lbhgXRzSXP4DJsdWFC2tn8Ae2CUegXAsM8F3dZdwHifdOVvexytylqfaOsNqG3A1/5VPyK6WO6ibyMS5zeG0YtwOiqNLQhtjfcv3XFMO9ajZk9DTrsW/nYFNXxjis6PFSaTz59f+N8gRVficZeSPqUozSFRCRCNvgRCzRgFAP3wjzb3DamK9zNwa+KQ+avOI6EX9peSY2QYNQADcsxnX3BVWQNHFtKK33vgYZjTlpnJ0h6INvqpE6fGH2VUiJmNpMX5tu1tTmIf/0cGa57eCty/da8SH+ySffJAjCgHmNi9Ab71ws5/DpcXUgNOVMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BBP2z65Dd8DgLZMTsDcYi21zgxdEr/LCSVR2KzObhw=;
 b=wxCqoQpnTwcwv7iY3hZFy9SXh8EF25K8DwxMWD4uNCPLQAf0RCRp3Vpx6zj36LfAv6M/gf2zkMQYxAlkiLYGUUoLVPbXW9NBZG/AKRCvnknZHvTuHNqep7WJ5/nrioJAzF85uQqv8vBk3Jf8tfQ1q/AxLwVckTftTbj46qHTSj8=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH3PPF077CE0592.namprd10.prod.outlook.com (2603:10b6:518:1::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 19:52:42 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:52:39 +0000
Message-ID: <854ef7cf-b5a8-44c9-8d59-9ea9bfcce485@oracle.com>
Date: Thu, 23 Oct 2025 13:52:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 04/20] doc: Convert stability attribute
 tables to Markdown for readability
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-4-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20250926190557.8485-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR14CA0027.namprd14.prod.outlook.com
 (2603:10b6:930:a0::17) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH3PPF077CE0592:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fccaa7-f324-4f2e-eea4-08de126db8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjZ1ZDVoY053bFFPQUM5TVUxa052SXN6Nk5tVGd5N1hpRXpMejZhdTJPWXRn?=
 =?utf-8?B?VzNOV1IzYVNFMW40bXBiQnZHNEh0RzFub21CY3VuVGlyaTJsQjRLZlRMVTBT?=
 =?utf-8?B?V3ZTZklsWEs2RWtRNmVQbDVVOTQ4M3R0c01iQVp2R21iTXdHQjRhRC9jZTZu?=
 =?utf-8?B?Y3NlWmE5UEx3ZS90b2d6V3g0eVJmcXE3eFdRUGx5V3J2cEMydHVXMjg1MFlL?=
 =?utf-8?B?VklhVDhrZmZGNTEwUVk5S0o1c201bWU1b2U3VXRRblhWdm9EUkdIVUNZcXFE?=
 =?utf-8?B?R0FUd1prVitpVHhrZmlneUhoNVRhMVpMUU5QMmNrNUhjcnpVSFdRbjdmU2tn?=
 =?utf-8?B?a2JpdHdOeEpXc1pwUVVZdUdiSFNjWVF1SzVsUGcrMEF4YjVsT0FqTkJQcmpk?=
 =?utf-8?B?ZW05VmR4Q1VEVmpxeXB3emhwb3NPeXgzUVF2RWlxS0hMeVNmN3B2QkpEcmt4?=
 =?utf-8?B?MndYTVdGWWpUZms4MVEyZm1mVURrSmZCSTYvTFBHdnB3RE5vejlhR0svQ2pi?=
 =?utf-8?B?Lzh1dndIKzhlSWU2cHlheTZ4MG5obkhULzBYQzcyenpqNDZydVh4TGZVNHRu?=
 =?utf-8?B?TUpyRVRYdmpPek9CMnJEK1RPWlJEVW1uNFIwZnUwaE9PTWxFcXlQamFxU25p?=
 =?utf-8?B?aHhFZFdLbk1XVDR2VW04MFJISElyVXBSbUNJSEhTajBQZVNSeWZtVXJmQUhq?=
 =?utf-8?B?R01LdjBCaTgyMmNaQUJVblhwQWlOcXg5ZW80TUJDc2RRNDFpOWVsTzV0UWlO?=
 =?utf-8?B?a2JwVVNRSHZtRVI5eU10VUtrV25yVzhvdHhtVjB4OUZDZTNCcUQ4RWR0VUlr?=
 =?utf-8?B?ZC9RSFhzREtkZEdIc3NxQzdXVnQxOGpqclZucGx5QjVEcUVIcGU5SzZicytF?=
 =?utf-8?B?b3hzd0E4Q2s2NG1uRFZBUmxWUmJqeDkxUHQvV21VUmdDOXh0aERJajhzdlBz?=
 =?utf-8?B?K3JhbzRjVjVRekFKVkV1Q2RFUzVUOHprWWh2NDZ0MWloN3JnZ0VObWgzZHNy?=
 =?utf-8?B?ZkJ1UkpFUkowWmpUbk9kTmt3VU1nc2oxNUFnckpaT0toVlQxOXVHSFZVQWlx?=
 =?utf-8?B?dTI4aXhCMFdtMDdGSGlLcy9sL1Z1Z2ViNWl1QnVwNGlJSFNoQ21ZQS9yNDBv?=
 =?utf-8?B?aXVMQXc1Q1ZCWVZuaTRtQVlxOStkUGdxZkJvZy9UN1NjelNxR1NGN29BYXVv?=
 =?utf-8?B?cDhrNUxkOUJXWnBvSTQrcGt2U0lYOFhUaW9UWVJYVEUyZS9RMnFmSmY3V29t?=
 =?utf-8?B?anR2MmZWSFRXMERwV05tN09SamVUTVhGZm9Va21xcXFEVGhoOTBPUzdmTlIy?=
 =?utf-8?B?SnQ0NVdpTXg1MW9Fek01Z2JZRjJvMHJZOVB0RU5XdVlrQUFRZ0IxQkxKMXhB?=
 =?utf-8?B?M0RQS01OOGI2Y1IxUHQ4Q2I1QW5LUHI5M2x0aUpwYzBlYVhYYjBlQXpIRmZv?=
 =?utf-8?B?bDJLb3NoU2Y5RlEwNTMxRVFDeGFnaTZKQTN3V3RBQkptcDlWcnNjWTJXUjFa?=
 =?utf-8?B?T0lLdVdWN29GbU85YkVMRDRTTHV6a1Zwb3VUTEpueHhRTWY5NjliT0g5bUtY?=
 =?utf-8?B?T29BclFsZGkxWTNUQ0Njc3NlcFVrTHVwQXBoc1hOdkcxRWFkcSt6UUhOb0c3?=
 =?utf-8?B?bVBmS1kzbFJDMWVxTkxrYnBvMkVIMjBGWU5WUEMzYjRPTzRBVXF0NUh6bjd1?=
 =?utf-8?B?aHpyNkx4d2FDRHIyeGZRQzkwR2I0NGI5bnV0cEt0eDZhR1VhR2E2U00wamw2?=
 =?utf-8?B?V29xdTNYWXNIMTJLdzJvQmtwRDIyOWFFOVVyYUh0Tm9lQjJyV0Vyc3dma3U1?=
 =?utf-8?B?VjZrcUZ1SFkyeVExNm5SaitsT2ZJQVQrUngvK2NqQnQ3cytDSmgzWXk3L01a?=
 =?utf-8?B?S25LLzhkVXRLQlRrRGtxaDU0eTBzbUxqL084SFZ3bU5vVnlQd1o4aHVkQmxu?=
 =?utf-8?Q?LsPRu3I8vCeCyPCv6yRkAV2Nj8Jevq5U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S24yWUdPczFWRG9acExpWUZLTE4wLytteDBaYlN1MUUyY1FydXlVU2xzRDFh?=
 =?utf-8?B?b1R4OWkvektCT2RsQzdGRFNVZU1Ud3Rab0o3SnFxK29sUE5CNmVyRGdDeHo3?=
 =?utf-8?B?VVJySVRuNDFqU2p6OERPL2R2eFZ4MEIvbVlPbFl5dWV4YUZkR1k3V3E3Z0Za?=
 =?utf-8?B?TkVuYjcrT0tLaEtRTUFDNWJDTWZxY013K1hrK3FOMTc5YUQyL1M5SUdkdVBM?=
 =?utf-8?B?YUxsRWxwU0VhY25UMFVRNWtWSGhNU2JrU3pRM3ZSNGttR3FTWDJ1Mk5hMmQ4?=
 =?utf-8?B?MmlyMThhaVJIZW13Vyt2YW5RV3NicmdRVEhmWFFLN0htcFRES2FVZjJlbEZP?=
 =?utf-8?B?S0UrcE4xa29OWGNGZk9PWElsRDFFUjZFTFFHZ0s2ei8zTkdsYm02ZU40ZHh6?=
 =?utf-8?B?cVVIclo5WjQ4cjZBSTJDTTVKT1k0VTNWUnpUZWZqVFhXOFI5WjNxZW95U1dt?=
 =?utf-8?B?L1BLODVRVGZLZllXRDZCeUZyREx2RFBmeHp5NWhxeFNtcGRmNEo1UVhDY2RW?=
 =?utf-8?B?cEZFYU1YVTNiSVpXb3E2ZnBxR1pwNVdhR2RVQmpZeUI5bHk2L214dWl6Qzdh?=
 =?utf-8?B?NHpNYnpzUW02NXhzN1J1ZS93dDZobDNxK1BNbm1hWlEyNzB6bThZTjhJMkZw?=
 =?utf-8?B?dnQ4YXpLT2NKZW1QQXlPWGVYWkJvcjAvRmpJdlR3aTVWTkIrbGU3aGxjd2dq?=
 =?utf-8?B?c1pEeHEraDJZU0RJaTgzYVg5RURoVVBwUUhTaVA2TkZlZ2Z4MUhpcGdRMEF1?=
 =?utf-8?B?WTltUzE2bDgxSC9PVHl2L1BTRjF0SlMzanBQUjMwNGJwb2I0bmVodUROOVBX?=
 =?utf-8?B?V1M1Q2hXbGVjRWlDTTFoRFRsYUR6WFA3eVZGdndCZ3RuNmlqdDdTbXk4L0dK?=
 =?utf-8?B?WWxmbE8yaGJUUm16RjBpbXRvSzFkWnYrNXQvVStxQ2lXK21yRlg5YWNWa0VP?=
 =?utf-8?B?N1Q1RFY2M1FsUU9QVkplTG82OVRFTDJ4RXo4RzB4eEgzVEcxMjMxeDBWSzFX?=
 =?utf-8?B?SXBxaXZEemp5Q2s1LzNqcVpRYnV5UUE2R2N1ZFZCdjN0WWE5bDlJcE9XUlFj?=
 =?utf-8?B?bHNhOE9KZkRLN3F1RDhXNUxuejZBQzlVRnhwNmpMd1pKbjR1Ynlxa0NjMUhi?=
 =?utf-8?B?TTlIck5wUlk1cGpKK3ZteGJSVTFaYmw4MDdiUGU1QzYvc2xYSmJnRFJMZTdr?=
 =?utf-8?B?YyszcENvSWlCeWhiZnJKWkFsSGFpWk9jV2xQa1NLSGJUZFR6c09CdWU0SGov?=
 =?utf-8?B?M1JNeU5GKzUyekdEdXVxUjZpSzRIU3l2WDFQVGhoSE5QSlhnVExWeHZzOXVn?=
 =?utf-8?B?QVpYRER4NW90bEZ0andpcTQ4TU1KZU9XQjZscW8rNWpCVEpZcUJ6SmpWU0xk?=
 =?utf-8?B?SjlKczdWRHUxQW8zQVJiL3Z1aDdGUzdOakFqVExUb2NEOEJVSExYSTF5S0Zm?=
 =?utf-8?B?MDV2UmhXTGlUR0tQeFR2Qm5VSGVHbXZwRHFrTkljWlJCTFZjQ3kxdWdHaEJi?=
 =?utf-8?B?QkJESlhjN1JXdXdOdVFuU2JuQmZWQTJjWjFuLzBZZjBjay9SSXdqTThjSGNo?=
 =?utf-8?B?dkZMLzNNUW9QVEc3MENGMExMVnk3TWt0eUowL1ZSWDUxcVoyZFg2dXpHMTVI?=
 =?utf-8?B?MHVkdXJIc29mOTNuSGl0Zk1kOFRNREhPMmgrZVROS2pwREtHNTZ0a2tlbzVt?=
 =?utf-8?B?MEtZZnRIVmxwNXJySXNab09FWXpFY3dPQjlRWnlXNURXcXRRZ3Ivai9ub3Nm?=
 =?utf-8?B?ZWJ4RTQ1TDhiVGVpNTVRQ3kvUzZuUVBiaWJ6NDN2SnJrbnpEeTNGSnJWeDhk?=
 =?utf-8?B?eXJYQmdDT3ZPcWVYanJlc0hTWlpqSGJuUW1TelpZa2d3b2VrUko5bHhyazAx?=
 =?utf-8?B?MEQvOTl4VTRpanZNNEdRWk1KRHJoaTZKdnh6Vks2ME9NM2ZpS3hoQWdMaFk0?=
 =?utf-8?B?SFlweVVBR2xxVTkvL0tEdWl5dDhxSGd1ckhsQU1IZDhZdG1nOWtMWGtENnI1?=
 =?utf-8?B?T2cyZTgxbkk0bnFoL2phQ0cwT01RYUhtbmR0MnpIWHRxcXdSTExWemJLWnhZ?=
 =?utf-8?B?MWhaOVRMMkVMRHBQUWxJWUFSOGNMR3dIUHV4M1JyR3YxNElVVXI1ZXlGS29k?=
 =?utf-8?B?YkJMazM1RW1qdXREVi93azZPRjIxaS9oczhTUTNpV0hqbFFmQndnZjlaLzV0?=
 =?utf-8?Q?LWwZDM6HHbEAfovVV5YJQRs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dxICdelGskBQsAJbbGMV/wX7jOZSjgqmu8eh7O6JQJsnFy8Eh5HEnOP3c2PBgtXCT151CzJMm0xqtFVjN18mzOYsIFlPFrQmVVf/vLPAvgRoEtdPMoog5k0WH7Dk9XsFsDX2dasM+ZO/UqgHRPsh+Up0tFDvbt1NTpMMQ5tqwxcmLhk6YQt4IdJJMRDeUr/Rx8YU2ulhWz3ey+2ujxlJyoHMaLrckFMGOao0pxmnM3giVlG7rnzVcd9ShKuzY2z2xCHlFDS7GHtyL2WTcPu/edd0M8bCHlKO5qufMEq/trdz3ZiKsKLkDMmZjOIBAVwwfWdshbaJg3WVP1XMvcETn6tFRY5GEdwMrzTo/GvgYmLKfPQViZBW+7QR83qS84zU+Wj0J42krPaXpbSOcbDQOL7gV4BbSSi2yRkxtC10AE0muQB/RWD5Se2SBf6EwzURUWzvSTIAAQ6wPLk//EIadXwIPy+WTBldep2kFO5jFfLHatuVa+r0wJK9h4h1R/Camx0af0RNSt6UGSX0V4PMq5p4CKDOFiAzISlhB1pc2LNKCbbMPgr+5kVF9e3bNaA+YD2OpdoW7gANFAMn/ct03CC+EcCVmCI7j8ucbEeJcU8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fccaa7-f324-4f2e-eea4-08de126db8a0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:52:39.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tH8YBKHm5hqTXDqzP3Lzl/xeWqvjTKdq6E1yoYdYnFbT0gMFnUGAJ5eubmHqjV+WQfq4Tikoi/paaL9beuk5A9pyGbVK89nD4rZIn8kHKYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF077CE0592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230181
X-Proofpoint-ORIG-GUID: CA8OTJv2AE6ok2ypXS8FEP1986J6TQSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX6DXktokP8eY7
 3lgC3LIhtnCfN2/Iq49sUqoY8euPEgx1OuY0sFJV6rc/lbsWO4cCeuI381ld7kyg+/Cfbq2qp4V
 QO1BrEbgwXQMTA0bjc8lyZhCL93lmirvcU+wPcji/YU+lt0Cx0yVJVW+M+NzM8C+6uPFWjbAEEJ
 VDGDV5ZDVDl78rgKCaSjt+x6p/FRxdK75i9WkkMysRMbYo6nM2HWuaRz0iE9GkEtgalUc0XGS5N
 e6BCK5d2LvQFIAI6mljVAdq3Gp4/8v5QRua+X+w3tShtaMPDNO0O5WoR4Qt3BzFT78XkD9KjNdk
 RDlpiy/YBY2vjUX0O89dtNcU+jxAjLgqVcATmHkYRBWhielm+tTnAKkKl3Br4brv0ZSPaMW7ePN
 9GizaVEa7SF6Z0z5dZP0KQDYdu65Jg==
X-Proofpoint-GUID: CA8OTJv2AE6ok2ypXS8FEP1986J6TQSQ
X-Authority-Analysis: v=2.4 cv=D9RK6/Rj c=1 sm=1 tr=0 ts=68fa878f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=CnENqBCox7jM_zMRg9QA:9 a=BQThsPIMUTkxSCMj:21
 a=QEXdDO2ut3YA:10


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 9/26/25 1:05 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../reference/dtrace_providers_cpc.md         | 104 ++----------------
>  .../reference/dtrace_providers_dtrace.md      | 104 ++----------------
>  .../reference/dtrace_providers_fbt.md         | 104 ++----------------
>  .../reference/dtrace_providers_io.md          | 104 ++----------------
>  .../reference/dtrace_providers_lockstat.md    | 104 ++----------------
>  .../reference/dtrace_providers_pid.md         | 104 ++----------------
>  .../reference/dtrace_providers_proc.md        | 104 ++----------------
>  .../reference/dtrace_providers_profile.md     | 104 ++----------------
>  .../reference/dtrace_providers_rawtp.md       | 104 ++----------------
>  .../reference/dtrace_providers_sched.md       | 104 ++----------------
>  .../reference/dtrace_providers_sdt.md         | 104 ++----------------
>  .../reference/dtrace_providers_syscall.md     | 104 ++----------------
>  12 files changed, 84 insertions(+), 1164 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
> index 5128d8e8b..39b2ca6f5 100644
> --- a/doc/userguide/reference/dtrace_providers_cpc.md
> +++ b/doc/userguide/reference/dtrace_providers_cpc.md
> @@ -60,100 +60,10 @@ cpc:::cycles-all-50000000
>  
>  The `cpc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -CPU
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | Common           |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | CPU              |
> +| Arguments | Evolving       | Evolving       | Common           |
> diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
> index 1680c2a72..ef62c5040 100644
> --- a/doc/userguide/reference/dtrace_providers_dtrace.md
> +++ b/doc/userguide/reference/dtrace_providers_dtrace.md
> @@ -315,100 +315,10 @@ If the actions that are taken in the `ERROR` probe cause an error, that error is
>  
>  The `dtrace` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Stable
> -
> -</td><td>
> -
> -Stable
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Stable
> -
> -</td><td>
> -
> -Stable
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Stable
> -
> -</td><td>
> -
> -Stable
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Stable         | Stable         | Common           |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Stable         | Stable         | Common           |
> +| Arguments | Stable         | Stable         | Common           |
> diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
> index 727614434..885d59230 100644
> --- a/doc/userguide/reference/dtrace_providers_fbt.md
> +++ b/doc/userguide/reference/dtrace_providers_fbt.md
> @@ -78,100 +78,10 @@ The output shows the internal kernel functions that are making calls to the `kme
>  
>  The `fbt` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | Common           |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | ISA              |
> +| Name      | Evolving       | Evolving       | Common           |
> +| Arguments | Private        | Private        | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
> index ff1d12887..a458ab284 100644
> --- a/doc/userguide/reference/dtrace_providers_io.md
> +++ b/doc/userguide/reference/dtrace_providers_io.md
> @@ -521,100 +521,10 @@ The previous output shows that the USB drive \(`sdc1`\) is clearly the limiting
>  
>  The `io` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
> index 1cf06a5db..98affd838 100644
> --- a/doc/userguide/reference/dtrace_providers_lockstat.md
> +++ b/doc/userguide/reference/dtrace_providers_lockstat.md
> @@ -275,100 +275,10 @@ It might be surprising that so many locks are acquired with the `date` command.
>  
>  The `lockstat` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
> index e403d6c94..c0c7bbb9a 100644
> --- a/doc/userguide/reference/dtrace_providers_pid.md
> +++ b/doc/userguide/reference/dtrace_providers_pid.md
> @@ -177,100 +177,10 @@ We probe on the chosen instruction, using both a relative offset `foo:4`, and an
>  
>  The `pid` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Private        | Private        | Unknown          |
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index 24b18fc78..40903775d 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -695,100 +695,10 @@ Running this script results in output similar to the following:
>  
>  The `proc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
> index 2fcc13213..bcc8c64d2 100644
> --- a/doc/userguide/reference/dtrace_providers_profile.md
> +++ b/doc/userguide/reference/dtrace_providers_profile.md
> @@ -156,100 +156,10 @@ A time interval that's too short causes the machine to continuously field time-b
>  
>  The `profile` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Unstable
> -
> -</td><td>
> -
> -Unstable
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | Common           |
> +| Module    | Unstable       | Unstable       | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | Common           |
> +| Arguments | Evolving       | Evolving       | Common           |
> diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
> index 39f4f00f5..d85dd45a8 100644
> --- a/doc/userguide/reference/dtrace_providers_rawtp.md
> +++ b/doc/userguide/reference/dtrace_providers_rawtp.md
> @@ -21,100 +21,10 @@ sudo dtrace -lvP rawtp
>  
>  The `rawtp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Private        | Private        | ISA              |
> +| Arguments | Private        | Private        | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
> index d4cd546ce..68bcdf715 100644
> --- a/doc/userguide/reference/dtrace_providers_sched.md
> +++ b/doc/userguide/reference/dtrace_providers_sched.md
> @@ -814,100 +814,10 @@ The output histogram named `tick` shows that the clock tick is firing at a 1 mil
>  
>  The `sched` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
> index 212d3f886..442911fc7 100644
> --- a/doc/userguide/reference/dtrace_providers_sdt.md
> +++ b/doc/userguide/reference/dtrace_providers_sdt.md
> @@ -42,100 +42,10 @@ The arguments for each `sdt` probe are the arguments that are specified in the k
>  
>  The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Private        | Private        | ISA              |
> +| Arguments | Private        | Private        | ISA              |
> diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
> index 3eaac4897..880b7de69 100644
> --- a/doc/userguide/reference/dtrace_providers_syscall.md
> +++ b/doc/userguide/reference/dtrace_providers_syscall.md
> @@ -21,100 +21,10 @@ For `entry` probes, the arguments, `arg0` ... `arg*n*`, are arguments to the sys
>  
>  The `syscall` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> -<table><thead><tr><th>
> -
> -Element
> -
> -</th><th>
> -
> -Name Stability
> -
> -</th><th>
> -
> -Data Stability
> -
> -</th><th>
> -
> -Dependency Class
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -Provider
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Module
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Unknown
> -
> -</td></tr><tr><td>
> -
> -Function
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Instruction set architecture \(ISA\)
> -
> -</td></tr><tr><td>
> -
> -Name
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Evolving
> -
> -</td><td>
> -
> -Common
> -
> -</td></tr><tr><td>
> -
> -Arguments
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -Private
> -
> -</td><td>
> -
> -ISA
> -
> -</td></tr><tbody></table>
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | Common           |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | ISA              |
> +| Name      | Evolving       | Evolving       | Common           |
> +| Arguments | Private        | Private        | ISA              |

