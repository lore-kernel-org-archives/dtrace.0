Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383AE1B87E9
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831396; cv=fail; b=ujPfd5H8dbrz78wnC1uJ1bEdci6IIdj6BFlEWoxnIUy2YKgZg48AY7mDmFubmcMAOmNlDvtQbLQFno3FkHnVWQlXndUg8XCEzOkys/0AZ87yn64/rxVMPCqknk/H0pVEyJ79aE9xJA3lM3vB5oMorSWXbWlF/h0ez2ZopygPsSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831396; c=relaxed/simple;
	bh=Gs95ZHt5J6O/mGUg5hf8VZdsp/nroFGkmc/s1Xx5oLY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBrW/TZij4vcLOPhW+2ORC3fj4RgnQLkIbe3a98um+eof+P4ZUeGnXgLJ/D/apTE6AoJyevmCtbmT+TdoXPlOkUk49pYT43HBxlK9+0CGEb5aPA/b/QIybPc5VW80oveDK/FZMzShQfy6x3xBZ8F9MWfwOVxUmUsrU18ddTRO7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f985Dcvd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WLRkaN1J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f985Dcvd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WLRkaN1J"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifCZ002684
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BnSBpLjrPUZbFZjprLYYOsBIuJfxrvegInRC0wKkAeA=; b=
	f985Dcvdh8a44mWWdoNAnfX8sXVwvMwYJq8Q0O2/s+YbhoJsXm8umpkHQL29e96p
	kWomlbjSIhAZzZ+SBdXSJfE67l/GDmEldCwo7UTme4QM+oASw6/mHk6Fx6pDL2DG
	2+dfHzILepqVOsPaYDliQRCkdGcJh34Ne965ks/tohHTg70dsW8yJa3HEOIA7NY3
	13SFHFQ1q4wzK/5sXjXDiljOXfDXNl7XexV8uZ6uz7gXS6Xj/LfPmWaJQWCuPz5m
	ZxCNXraBe4eplrdLoOjZBtB1H+wbMLJhDpSlapc/U4BBCdnglcrRG+fd3LOQoatg
	JtgvJc1TLy61e7XTQgFfkg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87xn4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5oNpA002092
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:12 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpe3rvj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl1LFEqQFw0M/Zcriv7NfLduduOo3izUXN95MaNCLLWIrndmu2l62/5axht5Ylpu2NQu13BqXsl148fWObWf0keAT8H6ZfBPKpyvM6gEVIhly3+UWwyhFftnEDQRafh19FvoaFlvI026vQpQ6ZVPze4D9BDr6bpFh9ORxwAi+e+cPU/mGIAJVFaMQCfNDVkvaLuv6mNS30s52LRxUhrfWRrqkcGFvZ6mzmUHfI8riNHF29NzgHkJn0Zhvtjib+HJHOvJkzQHIg/Vr0luJQGPclerdFzg51XWgtmaBg3WixLeoeIvaxoKmid0X3fFdRWmuBe1vkj2lSDobfBVM7mjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnSBpLjrPUZbFZjprLYYOsBIuJfxrvegInRC0wKkAeA=;
 b=cIVOrADKHHAFQ/OTMQVlrOU57RXzqMhuWjHsDGkAZ7b3TgQlsgN6fm6nVrfVLS+9nJNpndbzDV7Kea6GFWL95Oe3e3gfEmWh78F270X3jg8OCKuNG+KOSc5S5xKa8mM4bX+DBKMR5yeMv8qpJT2qVvw8u/7q/NjC1jGPvj17PS2xtFCXWG0U8P7+DzbUqLxWb0HMQgtkxtJGqeQRAxMiE12aDN+BGrtUHJiRLsjD00R2tFIeorIMyWuavx8gt3JzZkxeCRhXOlso+uYWNuJzvyrFhfeAKIOsglNUsNFQBQWE5nmEqGVGuBEwOelDxebUvYHnnlKiULftNVv0lnLp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnSBpLjrPUZbFZjprLYYOsBIuJfxrvegInRC0wKkAeA=;
 b=WLRkaN1JpWIIzAYGGJFB+ftS/lMfemRMMa8xsBGAtQvIHwLxvMr3hCfp3jqfP3SWgnW1a1mMGBXou9lLxrEPmU66sl90HbY/dIq8v22qu2XBnvKnQLUEQ+GUkT5yEkqVk84fdhOh0dbknHfRHgPk9bKfW2pFpxcCaKzObT1z7B4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 06:03:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:03:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/4] test: Add test for predefined preprocessor definitions
Date: Wed, 25 Jun 2025 02:03:03 -0400
Message-Id: <20250625060305.15707-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625060305.15707-1-eugene.loh@oracle.com>
References: <20250625060305.15707-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 0affae04-6011-4f02-3866-08ddb3adf65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0IxTlhFR1Mzc2c0WEU1elZlMnZaQXFpVXZQWVlJdmdITWMzS1VIM1k5VmhS?=
 =?utf-8?B?K2djdWdYZDd3VnFBNVZocklwTHlFWUZHTXBLeUY2YXRYRXVOOEg5NDJCdW04?=
 =?utf-8?B?YzJRaTB1QlNLTFZxdU5pc3RxUm51NGkvR3Q5bzB4RnhiNjJLbnRTNGNSMk9T?=
 =?utf-8?B?dWhkZjFld3Y2SFRhRjl3TkU3OTg1b3V3d0E4cXU0bml6MmtLL3R4UVozbTI5?=
 =?utf-8?B?NGF5Y3cwSm5SY2pUSzhTLzc2RzhPUnhwdjFnTyt6ZVVSRDU3TlZsUTNmcVFQ?=
 =?utf-8?B?OWZPZExhdzdac20rZnJPTjJ4T1Q4YUdwQk5nTVFuUnBnQVU2ZTZEK0ZaUlVP?=
 =?utf-8?B?RzdEYWZ0RE9lU1R1VEt4SzkwcFFFb3B6QTlML1VRNTJ2bmYyRDdqZmk2Rk1o?=
 =?utf-8?B?ZUpYOFVvekZQcFRuemZEdjlFTURvQUQ4VHQ4TkZpUWtza3B2NVkwUDhRbU5Q?=
 =?utf-8?B?VFBZSmdTbHlZcGgvN0orQzBIY1UyMlRObHlvWWZpcjRBRWR1VmtKaUNQR3Uw?=
 =?utf-8?B?K0Q3SGJwb2x2SmJKNTRudVd2MU5GYjRhdWNKdVIxaTR6eEF1WG95cWp1ZUFQ?=
 =?utf-8?B?eURuZklsblZJQmQ2aUcvZ2o3SXVYZ2dIcnE4U1VKSkg4SFlqMTZTUVI3NTZU?=
 =?utf-8?B?VmlrMDFmbjlWTE91SXZLR2NudVBvTWV2Y2NtZ0lSZU96MGEwTUZMR2RFenl2?=
 =?utf-8?B?eWRWQStGY1VUQzdpR3IwWE5iaUp0Qm1zSXo3UERlVlNJMlBzN3NaWXl6RDhV?=
 =?utf-8?B?RFNNQ0ZESmw1Y21ib3JLeWhwL2FUY2N5OFRPWGJSVlNtZ0s4cmFycHNlU2R2?=
 =?utf-8?B?SWgxOW54UDBpVUF0dUZjeDM2MW1TTTFpNGFERnZTTFhTTHJ5dU04SzQ1UEhm?=
 =?utf-8?B?YkZEZ0NLdG40bE5VazVCbnEzUFhLc1hXbzE1L2hSL0svVkRjSTk3NDV3QmtP?=
 =?utf-8?B?TXpyNHBNNHpvS2tnamQwY2JoSnNQY2VHODk4alFKRkVqSWRRZVpyamY3ekpk?=
 =?utf-8?B?blV0NUFvaEVoTHJzN0R5dlVlQ2ZWZ1VVVDNIa3FrbmlnVUJhSlQydThZRnhp?=
 =?utf-8?B?ZUx1RjFhbUg1THpVU3BXVWFLVW81bE9lRWRQVWJWWmhzQUNDL0NVTlN3a2lW?=
 =?utf-8?B?dkNDUFozZjlQOWNBTjg0Uy82QjBxVUxZVU52akFHVzEzZlorUkw2UjBzVC9t?=
 =?utf-8?B?OEdkY01HMktZOGlPMkJ5SE5rVjR5aDZpV0UvQmZjR0ozSWN2TjZKYmp5ZFJT?=
 =?utf-8?B?V0p5TDBuU0NPckk2K0VONHhqcUE0TXFUNDNXVGsxUi9SNVRBbmV0YWIyLzBM?=
 =?utf-8?B?eE1oRE4raVZucHo1QlRJUGpWa21SbmtpUEJKQWZXSkRIeHZxdldJWGlsVTU4?=
 =?utf-8?B?SHRnWWVnQ0JqdkxSN3JwM2RRNkhIWXArTVZUQW04b1NOcFBHRWNRWnhXWFZp?=
 =?utf-8?B?KzFXNzZqdDBXYlkwY0g1b2lJWXVUK3U0dGw0YzdKZWVBNFBVY0FyNFFMZmUv?=
 =?utf-8?B?OVVPMFEwRXhrUmlYbnpGdUZLWlk2YVl5R203Y2l5UlpLV3NOaXg3TGYwb0VU?=
 =?utf-8?B?RVZXOWx4bW5aaEUrS2dZSkl6emw2bUxpcWhTNjB4YTJnV2ZETmxYcHhReXFw?=
 =?utf-8?B?TU5EdEt5L1lCY2hzTElIOGNBMmVwc0M1VDdpeGI0eXBOdlMvdE9MQWdtWmxm?=
 =?utf-8?B?dHVFeW1LMmRuSGtDNllzdWhyNC9NMFplekZjakE3cG13ZUtnSkhlVEhjT3dJ?=
 =?utf-8?B?eGJvZ0lmYmJacnh6ckJKZVdhWGVVRlRPUllhYlBtNXpkejN2N3F1RzczV0Rk?=
 =?utf-8?B?eVdFOEk3WTlXdTNodkJDTHNiTUJOM050VTEvNDJtYkRNbURMUCt4N0FXTVpJ?=
 =?utf-8?B?NjdTTUdabmZvR09lUk15ZC96N3dxbDFrUHJjTlF4N09DdTFiOW5KaUUrVGZX?=
 =?utf-8?Q?a8GmwkGFpkw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anpxbnNPSXQ3TnhLVXpIaEdoZ3h0SG5XZHNGVk9xakZ0YWpTQTlwT09QMGRY?=
 =?utf-8?B?bDFJL2ZLbXRjaWxGMERQS2wwZW82dHFlbWJXck9WRzJVVVBEUVFWUzFaRzVU?=
 =?utf-8?B?elMxb1dyaEFVbnYyb25qajZHNkw4aS8yU2ZrdzBEODVuWGE0S2JhT1JHM1dt?=
 =?utf-8?B?cjF4Ky9ETm5iYnhaQWN6R09RWlA1azg2L29FY3NtTW1GL2syaDFjWk9Oc1VF?=
 =?utf-8?B?SkNlbDlEc1BUQzhGaXBLejhVOWRQUCthM0JBMEtWUmMxck1DVlZjVnpsVEZ1?=
 =?utf-8?B?S3AxcmNpQm5hNXgxb29VeVNVVGpiNlUyVFVpclhmZ2hwcUZ1M0NOOWt0UjJu?=
 =?utf-8?B?akJYbFNrY29BSjRFRzZsekJuYW5iczhhbU9rNWs0REp1WFNRa256MG5uYWw3?=
 =?utf-8?B?cWsrb0hhcnZaRG5sNGdCeGl3eDdnK2txdHZxejJpVlpkMmhLME1kS2FCajIw?=
 =?utf-8?B?Qy9uNnFVeCsvbFMwdXdFN21GYzhWeEhPOG1CNjh4Snl6TEtuSjE2WXRYVm9i?=
 =?utf-8?B?eWUzcVNoa200emFFK1ArdnJNelIrVTFlVXQwYmMwRU9LWUhDTmpOTHAvWHMr?=
 =?utf-8?B?Zlc5S2N6ZU5MZDRBQ2taOUZZc2MxVmduSzdSWk5JdjlrNndQeUluUWdLbXU1?=
 =?utf-8?B?UjVvRXE3aDZKVGFPRnpCeUJQNVJFMG1uSnc0c0FEam9QdUtxR0JXckxJaTdT?=
 =?utf-8?B?UjB2dWdFYTVjK1QyY24yMGRLeFphRVIySWtGQUROK2VMc1B5V3crdm8yMDFr?=
 =?utf-8?B?MTFGbUZqYnRzbCtiZXNOVEgwaExsckYvdi9IdHpCRFBEaG41YjZhblM4SG9F?=
 =?utf-8?B?YXV2Qnl4Rys2M1RLK0NEYnhndEpTR25RdERFY1VvWWY2SVJvRVhsL0ZXRFBZ?=
 =?utf-8?B?b1lCT25JYmRPeFBiUGRNRmZLVG9ibVNPSFdoYnpoSUp3Und2L05oSDhlMjNp?=
 =?utf-8?B?NHNCMUFGdTFId0NhTXJYUXdZRFM2cjBKcTFId001cGFJQ0tTVk5jK1NJM25s?=
 =?utf-8?B?ZXBJVXRqUnVOYTM4dnBwbXRJT2FQUnZ1UW1PZjNORWdFUzZVcTZhMHlYRC9S?=
 =?utf-8?B?T2VzVG1Qdm9IYTRZaHpwaWh3RnVXV1hkTU5uZ1R2UDVHeFFsZUJEQitBOW0y?=
 =?utf-8?B?eUEyYWFzNktRcy95NWNRMm5TYjIrdm1td1JSVThKWFkrb3l0Yytia1p1MXdN?=
 =?utf-8?B?UjAvWWtVbFhJb3ZOb0FRUE13cmVjTmRqMFV5RjkrcVZGbWFKYW9qZTFwWlM2?=
 =?utf-8?B?VG0yV2Q2ZzdOSUo5b1lyZ2hJM0hKamRjd01HZDRTSkgwNURWczhNcjJ1bXdE?=
 =?utf-8?B?d3llUTJPenpVRGNJWGJXZkMrdk5UUHYwU1NPc0wxYktZZjgwM2VjbzlzdjAw?=
 =?utf-8?B?N0tjeXpRQldJc0x2N1pzWmkvdUc4VWhJenZrRWNJK0JwbzBQQlV2aE5FVlgy?=
 =?utf-8?B?U0tTYkt4OWt4N0VQWFZaL20vczBHekx4TXFwME52MVkrR0ZxQjl1bG50d2Qz?=
 =?utf-8?B?bzFnYmg0akRGRURNRlRBOStUQytkbXUrajNRYmtoY1BLQWNsTkR3SnhmZFBs?=
 =?utf-8?B?ejZJUE45TXZ6RE9NVnYvMC9CcmtHOE10WFpQWGR3TytBZURTUWo5QkV2YUI0?=
 =?utf-8?B?N3RXQXMrSWxqVmxndnVZOXJGdFpPa2poNERNZTFhSUJ5TFBYaTd3WHYzZ2Q2?=
 =?utf-8?B?ZXkveGlzY1N4YjlWYlRvOGFkOUREYU9mWVI4WkNVMUdEVTd6RWNCdDlUTURF?=
 =?utf-8?B?SFRFZXJBOXdNbVZzaWtvRkl1aFl5M1doTHU4UGpRaHFLeW9HYU5oaGZKbjJI?=
 =?utf-8?B?RDVCU1kya1ZOSDhUMWlXZnY3NDFMYXpUS0pSVERqbDd1TzBaWHFTTC9kZ3Yr?=
 =?utf-8?B?Ulo2OUZpd0xGWFpKay9MTE50VTl5NEpKRFFLbHU4bWJ3TTcrVW0rd1luTjhZ?=
 =?utf-8?B?Q1lPYWhTNEVkMm94dTcvWUtoZFJ6WnpHMzZ6QnpxMFN1cnViT3hkS1RzWHQ1?=
 =?utf-8?B?RkJJQlpoUXNSckN3UmVoUHdkcExjWjNSN1IvZHRNS0tkWVZ2YTh0SjhrQ1Z2?=
 =?utf-8?B?OWU5dWNkYitsWGc1dWkvSVBqR0MvMnhvSTFObUNZT3hGeHJkOUtMa1BLdXJJ?=
 =?utf-8?Q?Gg4JP+1cdHpGKlAV6lLBS+En/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gm13qU8VGqjCvc+OQ/tU0g7NfivT2f3/6hZMgnvhbh+KGRP2FZKpVmf1TCfLPc96vBOPCgHP2h5wfDkVnFqGcp129sNRZODG83UhBB+x57oa1PEpZS5TdQSs9/+MHu8Gkp4qagW4Mcl4SWiSFITXt/QVKOqOHYLfZ8kmYfBUerSC36niUHgbpBUuPbgtz2UNYkMm0MxEooB5ITYktPirKg0wKYPKVOjIrFBwDhADATiny3h3U3UlF381w3x2GzcKzcR8K2K6qm+P0szz95sWRUD5UlIFj2mbcrpdX/zOZbrN8jElw9YXS5gup0Jxdkq5xZmTAtUGAFT1w9qj7BUlVFi8IlBCglmd5b7h7Adn19eLqlcOrcPILanUAaDUF7JDgqko69Ct/9t+u8DA1UcFwtriVF2cJi8GtdbRuFYM9SpBUFIDhzm8Y+M1q0ZsmzFrBdVLeAL0+THl81IJAh0Mp5i6cWaVXBgS+06aWbqgx6ytCzdX4ntUOoQUqCmLM2nP3+9y0OW3rXyo5QFvrV9Ak18sojHZXKadXL8vF5QexdEAd6HU5vwvshYoHSHqGxSvVv8FYkTMoDdTzg6+DF2qLRIQlcC9Q+atOnQzpkm1+z4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0affae04-6011-4f02-3866-08ddb3adf65f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:03:10.2024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgVSQ8codb93CDTjbdLR/FFg5NWxwvoZfvvrczIRhntzZJ4jNfe8KCKoySaamxf/xp3i0KEDXsDI2LjYgA+n7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250044
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685b9121 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=mEvIlW4IRetd-9wO6aEA:9 a=UyJwmPUJozw58VCsoXQsA4RukbM=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfX1up2guqkbgQH lrpZufy3N+BODinen44hc4X1yjLd8JbPWDucMnM7vf4mcw7nguHzgpwiZGWtcfRWuSGMtmr27hO GizPtow2ofcScnjYHmnHk/mbQBCDQ74yDDn4+SUCw0vhnePkUW9PjPqxzP62YLif9MFNeTWWGKc
 IFtPt2p0OJAoJRvVt3jOhOCUJ4DpVvVlXY4a26XqIvSrW+a3gN75rrl+Zg0yPfPfaiPbdjrWGnx 2v5H7CL6hOQwDqLxV9/fvxWFidn8S/4RgGi2h9v+kTijouiZY6Cjtsrfz+2erfnTn4PbTjfTP7n EmlxjDlraqciEigf1cPSEyC9gbYzVIcXGX+YqnkYF8TkEmYZKERDniSTuPtqSFHyRyg1CfhbwTz
 O4ZCV3hi/ghUK4ELFCm0VU2a2fgc4jbOz/+1VyvahYm2oIJlwkWwCpzRHhqKRWdKM8KQepUB
X-Proofpoint-GUID: bgEFcNfz-UDbGuuKKqaI271Hoty5UxHE
X-Proofpoint-ORIG-GUID: bgEFcNfz-UDbGuuKKqaI271Hoty5UxHE

From: Eugene Loh <eugene.loh@oracle.com>

Orabug: 28763074
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 COMMANDLINE-OPTIONS                          |  10 +-
 test/unittest/preprocessor/tst.predefined.r  |   1 +
 test/unittest/preprocessor/tst.predefined.sh | 119 +++++++++++++++++++
 3 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 test/unittest/preprocessor/tst.predefined.r
 create mode 100755 test/unittest/preprocessor/tst.predefined.sh

diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
index 40561af91..73be89b1f 100644
--- a/COMMANDLINE-OPTIONS
+++ b/COMMANDLINE-OPTIONS
@@ -321,12 +321,12 @@ definitions are always specified and valid in all modes:
     * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
     * __i386 (on x86 systems only when 32–bit programs are compiled)
     * __amd64 (on x86 systems only when 64–bit programs are compiled)
-    * _`uname -s` (for example, __Linux)
+    * __`uname -s` (for example, __Linux)
     * __SUNW_D=1
-    * _SUNW_D_VERSION=0x_MMmmmuuu (where MM is the Major release value
-      in hexadecimal, mmm is the Minor release value in hexadecimal,
-      and uuu is the Micro release value in hexadecimal; see Chapter
-      41, Versioning for more information about DTrace versioning)
+    * _SUNW_D_VERSION=(MM << 24 | mmm << 12 | uuu), where
+      MM is the Major release value
+      mmm is the Minor release value
+      uuu is the Micro release value
 
 -Z
 Permit probe descriptions that match zero probes. If the -Z option is
diff --git a/test/unittest/preprocessor/tst.predefined.r b/test/unittest/preprocessor/tst.predefined.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/preprocessor/tst.predefined.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/preprocessor/tst.predefined.sh b/test/unittest/preprocessor/tst.predefined.sh
new file mode 100755
index 000000000..47e35d9c6
--- /dev/null
+++ b/test/unittest/preprocessor/tst.predefined.sh
@@ -0,0 +1,119 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Confirm preprocessor pre-definitions.
+
+dtrace=$1
+
+DIRNAME=$tmpdir/predefined.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Arg 1 is macro that we check is defined.
+
+function check_defined() {
+	# Add to script: #ifdef is okay, else is ERROR.
+	echo '#ifdef' $1                         >> D.d
+	echo 'printf("'$1' okay\n");'            >> D.d
+	echo '#else'                             >> D.d
+	echo 'printf("ERROR!  missing '$1'\n");' >> D.d
+	echo '#endif'                            >> D.d
+
+	# Add to check file: expect "okay" message.
+	echo $1 okay                             >> chk.txt
+}
+
+# Arg 1 is macro whose value we check to be arg 2.
+
+function check_value() {
+	# Add to script: print value.
+	echo 'printf("'$1'=%x\n", '$1');'        >> D.d
+
+	# Add to check file: expected value.
+	echo $1=$2                               >> chk.txt
+}
+
+# Arg 1 is macro that we check is not defined.
+
+function check_undef() {
+	# Add to script: #ifdef is ERROR, else is okay.
+	echo '#ifdef' $1                         >> D.d
+	echo 'printf("ERROR!  found '$1'\n");'   >> D.d
+	echo '#else'                             >> D.d
+	echo 'printf("missing '$1' is okay\n");' >> D.d
+	echo '#endif'                            >> D.d
+
+	# Add to check file: expect "okay" message.
+	echo missing $1 is okay                  >> chk.txt
+}
+
+# Construct version string (major, minor, micro).
+
+read MM mmm uuu <<< `$dtrace -vV | awk '/^This is DTrace / { gsub("\\\.", " "); print $(NF-2), $(NF-1), $NF }'`
+vers=`printf "%x" $(($MM << 24 | $mmm << 12 | $uuu))`
+
+# Start setting up the D script.
+
+echo 'BEGIN {' > D.d
+
+# Check for the preprocessor definitions of COMMANDLINE-OPTIONS.
+
+check_defined __linux
+check_defined __unix
+check_defined __SVR4
+if [ `uname -m` == x86_64 ]; then
+check_defined __amd64
+else
+check_undef   __amd64
+fi
+check_defined __`uname -s`
+check_value   __SUNW_D 1
+check_value   __SUNW_D_VERSION $vers
+
+# Confirm other preprocessor definitions.
+
+check_defined __SUNW_D_64
+
+# Confirm that __GNUC__ is not present.
+
+check_undef __GNUC__
+
+# Finish setting up the D script.
+
+echo 'exit(0); }' >> D.d
+echo              >> chk.txt
+
+# Run the D script.
+
+$dtrace $dt_flags -qCs D.d -o out.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: DTrace failed
+	echo "==== D.d"
+	cat        D.d
+	echo "==== out.txt"
+	cat        out.txt
+	exit 1
+fi
+
+# Check.
+
+if ! diff -q chk.txt out.txt; then
+	echo ERROR output disagrees
+	echo === expect ===
+	cat chk.txt
+	echo === actual ===
+	cat out.txt
+	echo === diff ===
+	diff chk.txt out.txt
+	exit 1
+fi
+
+# Indicate success.
+
+echo success
+
+exit 0
-- 
2.43.5

