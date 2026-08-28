Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55FF1E1A3D
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950042; cv=fail; b=HC+2OttEa9ScGdI8ZPyJyQqO0jajcUA41eSv+SDedCHKUIDTrc9SWGkWXNmWrfWNoVgg34AlNCKbYujwKcNohra1Az5b8UN8JDHx5UPslLVrbqV36WSl5fWEwues7T+tYH8YEm5WzNRMn+pUQViAVI/9yRBnlkh+Vg0Ek4ESddE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950042; c=relaxed/simple;
	bh=SAIpMef3G11I7K1H6sRrJEe3iyAQTSM3idWxtl+Hrjk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WQ5SkPiID+E0nDXdgYqMroITmg1X5AylFWbGFPGMCBux/dPYRxdZcSoTeB2jZbY/jheL94ryKASa/SQVuV+R1Cx37rnKoE/zwJyYNMF6+PfAfe3X59taNiFg4pIByomlvd8yDwy0zFmmMRVDlKGhF+n4o0bcQLxzjUojyYQ9Yus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kYzXYE/F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l5snXM7H; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kYzXYE/F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l5snXM7H"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK2Ga3147478
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wMz0LC3NkmgnEN6L6jyTAQ7Oe6tIaJu5mLt3dwjDhrQ=; b=
	kYzXYE/FLGu2GtSnJXeYWVRz0xmOqh0I10XeuA8DMqbWkcAIhdx6nfIxLTBaqNF1
	28yrfxEy6TsraP2ySKKm8lVjgd+3oQnAhZ2iX/0jXzCMC8I7gVU7VXs1V+cpENx5
	QkHCXtzADtTa2h28PENGlxPgkYS23TyJbO+KO199/RUrAUEKOeqXJatQ9l0IpwgR
	pAM+KWw2cnlGk5GYm49u0dc8QRCGwqoJOooX/P9+2qfPlF30bBTMbet9cQR+d/dv
	YazYTz5fE9CUp4aahUmhdB6b2bNx/oDDh19RmpDV/BAQ+18snDE3h1rz3nTtmdFw
	ILrLPYSAbuU0jnzGznONGQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72byaka6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:47:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SKdt2b002624
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:47:19 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g851019nv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:47:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDXWIrqd2g+nV8EP8DXy1ErFs/++ienjXyAhTIviIXDbP9urEBqcM/jhSU4vypik5kZoxKfYMSuXs4+mwUOD46tud+C2M1kCQjJJGI4yCto/ADWq4/YpXvhjG0m1muVi/PqZlLhb2DxIzBxdyM4GXoKUpx87uc+UD6GLiHCwN2YdUEhUlbDeJxHBPGqt+Aeg9PH1vekj9EDiX9/bw06aYJIV/4F3VtvA7aL88+M4qEV3RhEXKqTqXOjIX47TIHethKPZe0k0FkekRkJW0ibKWK0usR71dQpXLtSgjquAaukmLeZxfy8VUtVMtBrhLMVzzi8muSwCfecGdn9Ngkbedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMz0LC3NkmgnEN6L6jyTAQ7Oe6tIaJu5mLt3dwjDhrQ=;
 b=jb8nTQbFyR/ciLnbiRGsU3FKNI3iwtHyLzR4owYVMPudTEiGH3JhgSltd4s/GpSTV153UL5U9uZSS3G8I2bKtDlTzVJArYG+8A7pyBbvrgJaiK+AK98GodQcDt27Nf6+3pAaBXCoUpx/kaF0SotReZGQMiqwQH/FXtZTQnFwcEwIP7F2bSl98/AwQP5cGNwg0TkVmKH6F7zasyelCWJ9v7tugT5iEpna/pKkyN7A2gCCSBCN1v746Dufh6wf+pJB0G167cGx8+MM5jMnputXqJNpngyEMXcS6ClaQid4XrVGSvRbYNNccMAJSM1dLX7k4q9J9w5SpnssEC2061QMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMz0LC3NkmgnEN6L6jyTAQ7Oe6tIaJu5mLt3dwjDhrQ=;
 b=l5snXM7HWgIner5yFeyAgoNEqlig4HnubPvWWfJGJOIsMr5OOJkZjA0DbxQR5/RotVf8b6QxX5+tNcTWTusz44rd1gCRXh3kUohLxvrLEEYrcT/Lo4ndIHEruWRNmIOZhJ+CabysMeFyLTJn/szZiT5B/eWCSgPmiyvat1uXLk4=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by IA0PR10MB7301.namprd10.prod.outlook.com (2603:10b6:208:404::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.5; Fri, 28 Aug
 2026 20:47:13 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 20:47:13 +0000
Message-ID: <6527d7d3-e458-468e-808f-bab4f87aefd1@oracle.com>
Date: Fri, 28 Aug 2026 14:47:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] Fix typo in conditional
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <95468f6ec03c34a81288f9106e28ec9f@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <95468f6ec03c34a81288f9106e28ec9f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:930:1c::21) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|IA0PR10MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebbfd2f-e129-4e66-a5b2-08df05458987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Mfrky22jsqlWCgI6RPVzHiIgMYqQw+7XaWwES5U82kK7FXT4zrNLVD4fi3GFvfve+E4Pu6W+puLy178m6XwqAAf9hVOgmG5k9w/x6ZdyeQluPjh90Jfhceg0Ylhr68dk3CcLf3sMD/5nP+Daccv00Y737wFV/u73XOVR4cdMC7w+NVGozQ/ZkTsoALieUUBENS3J8NPzH1PUk1LsurGz84R9FucbZ6BBO0lrrc+bNGjFQYrmMga0Rz8V8dsIZUp9ibeS+WfCqIuR+UEIuzlqFotrYutpSlgQkWEY3gpxvi543g+GIso6zTFmEPOacDemJmNM2AdU8r45CvBHKaEQUxaWIK9+gbfF6Kfa/kQEqonqMGAMuhdk69ij5qpor63ufRmMLCmNlNjk3vYtzlmrUS2Cnzsdz3E7aBG+2XpoAInFcBeH7wc/KYljyIYdzmZ5JkWXzI9pQ3odrAfEcLa2De05reHo1qNIGDkFdpxDyAAUZDcwcmF3tFUVTtczebmTUeeTOuRaGnyTJNyMCe5QzynIoBoAbsc/BuiCy8s/o6H4i1CHyl01GfOKKF61u6OQIPYmls/zhngjNEdX9y1Nrq/p8tjOPi6J68m8I6S5Ra1MpTZXdemYZFPmKeii+EosmOFHtwsm5coRt1SzuuC67fK3sQ307UgZ65nqLvd5I50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVlselNZYVlqaU9XOHIxNHpidzdaQ0xPYTA2bVhCUndWWk9SWG1tOG84R0Q3?=
 =?utf-8?B?RmVZM2w0c0NzaW42LzRZR0hOV0RZajV2VG9vUU40ckVBUlorN2RvdFNoQkhv?=
 =?utf-8?B?Z2N0czNvajZvZHI4eXVDaHJ4cnVRVUhsRG5UWnkyRVdLbEo5ZzB1WWIyb2Jo?=
 =?utf-8?B?a3RMdDBBdUdUb0E5c2wrTW0weTcvbHRhY3BKQUs5WXRuUjNDTEpmaXhqU3Zw?=
 =?utf-8?B?MmtqUitzQlYxN1BDLzVMOWR3YlhNaHR2RWFGaG5SNnc3M09CM0hMcjg0L3lZ?=
 =?utf-8?B?RW12UnZmRXI2Um9mMllWZlg0eDI3bUE0aSsvUVByczRlYnVPdkFUK3ZvQkQ0?=
 =?utf-8?B?U0lURzZ5cllJSzU1Q092UEVhQis5NUduYkd2c2lzNXVUV01zbnU2QkY2MVFn?=
 =?utf-8?B?dnFXcHdZK3BQY2tUbXlOeXBPaldHeHhPcnRSR1JTRnF4dFkxNUgyQVJDRlB2?=
 =?utf-8?B?bDcwQnBZVEw1N3JaRVhKTzlhTEQzV1hzVzdtK1lxbmhURjJCemZaOEtYb0tJ?=
 =?utf-8?B?NTViQ1pQU3d5VDFKV0RoOVNsYmtLL3hzV1Q0N0hTWXRsRFdDb2xjMERWRGpR?=
 =?utf-8?B?QlBWZTNvQ05zM3QreU0rNEpLZWhyYmZMV2JHSHBJVU5GOEQ0MmY5UVJaYkRt?=
 =?utf-8?B?T1gxZXBRQmI4aUViNDRCc2MxaEd3eUJvSEtsV1pJbFAwVHZUREVHTDVhaWVB?=
 =?utf-8?B?cUpvbDVvSnhhaFRWWnZkcEc0TzRMZGNTSjh2cGJPYW1jK0Vncm5VSlYvMjlz?=
 =?utf-8?B?OUVMYWJQd2tnQ2ptdVFKU0Y0elBFWnNaZVRxdFpRM1NoMDJtcFBqOHFORUQ4?=
 =?utf-8?B?VFJPS01hOFBpa3RjWnFBVGlXenArc3Vjc2prU3NyTFZoaHdMTGpKUWd1ZW1H?=
 =?utf-8?B?amN6Z1VCV0VwYlBwV1BpZHlRZ3pQTDFiN1R3aGo2b28rYVdEOUFtaGR5WkRn?=
 =?utf-8?B?RFliSEFMeTdXTjU3bm01YzEvdEFXNWR2RUIwZ2szWjZCeFVMVDZFR2laVXFp?=
 =?utf-8?B?WEZiWmN5K0VqQkc3ck1sRDJFaFV5a3oyWkkxaEFzaTEzbkJmWmlzTFZZY0VW?=
 =?utf-8?B?T1oxWktGZXpENVJpRFdzN3VFY0NpNjd1ZEZtVThRL2RRYS9wRjcwWjFqQnRP?=
 =?utf-8?B?NDRSWGp6V21FMURhTWd4RndSUnBtTElBN2Qxb3dyOGowZnVPUDhWak9Gbkly?=
 =?utf-8?B?dHQydk50bTRuSVVsaWhMRXY5amF1VkU2UGNzeUE1RHJLN1g4cUs3MFFaNHlk?=
 =?utf-8?B?N0pXSGZwQ2h5OTBOaWRlbUxlSFdIK1BiS0MxU2QzdkpIRkpFZVc4RlJSWnFW?=
 =?utf-8?B?bGVteE9XMDJ0MytpVzJjZlRPcmRlczVRSnVrVmpjeUpHeGRMT1VKcmVBOTF4?=
 =?utf-8?B?dnhCUk5tNy9CaCtQNUZXNjlLNk5Cb0tLcXhKZkhlVGVmYlh1MEcrVVpBT0RI?=
 =?utf-8?B?RXpkS1gydHA5aEFXY0NzTXpNTnU1UjUrTFdPR052VnR1bHNSWnpDUHRHbnhz?=
 =?utf-8?B?RkdxUWsxYndnR0pXOVVNU3I0YVliaEdEcmdnajJJR2MzcUhKOFMrcW56QTJy?=
 =?utf-8?B?VUp2U2tNRitHMXd4YlZPejg2b0NkNmR0UHB0QnVpK2c1WUN6dUJlb08yanNM?=
 =?utf-8?B?TFZ4bmpRRVJlK3g2SEdnbWdKT2h6WjBERlozNmQzTVp5UjNPUUxnaGpTVHlt?=
 =?utf-8?B?WmRXRnZ0SjQvZmlZNXAzTExEUEZKMnhaYWJUTTBGVzNmNTl6ZGlUOHBTNmpu?=
 =?utf-8?B?amNhMldqVDZzYXh0Z2xaODYxSEVFdkdoM1ZHRVgzMmhPd1lxUTlLbjAveUFR?=
 =?utf-8?B?VE1BR3Y2eG42MVNwNTM2TTBWR2hFNVhkdWMzaFBxcHNKa1FVQXNZL043RzNh?=
 =?utf-8?B?NXhJQXRuTDNMb00wTjdtcFRPeHJhczJab3p2TEdmczBaNnc2SklrTU1FcGJC?=
 =?utf-8?B?K3c5MmRxU0VVYlZuNkxNT0UwbFpKQXV6OWs4RXppdlowaEt0d0k1bmlyanVN?=
 =?utf-8?B?N1YrbkhBeDJqa3g5R3FHYm13aGtWOEllZEo5S1ptS3A2SUxGV1g4Tyt6RzQ4?=
 =?utf-8?B?WVh3MGpRaFF2Zlo1VlpWaXU5Tk82aHptM1ROUytER0RCS2RIMGdOcTFBZHFq?=
 =?utf-8?B?UU5kOWFFQk9PM1ZUYTlZTXJFTTdZZ3lPWUE2L0VhenIzK29pVzl1K004NGln?=
 =?utf-8?B?KzhCQUlSYk82MlI5VDdNdzdRMjUvZFByVit4d2ZWMnFqM1NrMkNRRXVxVkFZ?=
 =?utf-8?B?YjdVb09wUC9Ia3NKcVo3VlB0L2NlK1B6SExCZnc0d09UZkE4aDM1TUxySENl?=
 =?utf-8?B?THhBdDNkam9HZ2FGWVNJWFRJcURINEM2MXVYUmFJbmNqdTg5aktjREZzR3lT?=
 =?utf-8?Q?TGfMyXI4O+Qf5us4=3D?=
X-Exchange-RoutingPolicyChecked:
	z2N/PeBEaQKHoq3MglT+nrW4qR/APMkwNQa+w4N/z0b8cichwtOrVB0S6FtUwwqOpzwb3Rz1rdkddNwHX2SrtAekjIYmM/ro7L3zgAK2mtS+1aqVrTKlXy8kxRnBct1xwypo3CZFzZBz/Fz84ukW+9xlWO1SJXCc8+0ZpOP/aJNXh29a2canmNFAjhr/K6LJh7F4DOaUsjIRyX9jfOJ/tYZzdrxGhwqiUNIQJcGZKaRrcITy1FtxVxdRyb78HVImoxRD0NR+WoNJaVnPDnUbZBKF/jDuhrsKd74gZoWely1I3y2Z6FNmQVYGD6+NPrA9NNheTznCuwKOKMarhhZ3gQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LitNb6tz2Z4xiAHfF5dJV7hs/m/K1tKeD7vG+gVk02uxj3S8qvAp0zNWq2osSinQvGA3v0ubv6xQHEG8ndhAjfTT1F8iS9fzepoWgAmpR33KTp4mxuUiekgcR27yl84/9HBIUVnHO8gwiipcfx/OHpoSJwJU3i4OaDkXT6YL8FKoloKbKVLBXku6ZVdWB2w5lf1L2YRm7DB0Goa35j0J+YwX6G6wXJInpvmOEkTjSLStU0io0z6xEGYAzwUCj8EPd16CtfSSeDPYE+wHiDc00fWsCxCZ8UAbO7m57oFYwDfPVtow2vw1fNueGYjNVzW7axwlVZxCCxQsUXyUq05IYoJouP4uUyT10BW+TgEHZRerd3uRwOSdMZ+Ypj2ocCI0Pfm0GRPOU5Fuizp9zqgWJ6gfJIEQxQmD46I14Aerxjz8Ba0LFoU3Hyazo0G6BfFcxWl8B+S5u7T4Wyd/uiIZMlt/Jm9hvt01rNiVv+OGk0QIbsbZYy1gEBXnBcQ9T+orjptsQyhx5j81sdZoY3mQdv6hFEpX7uYKiwc6P3MTpdpgbVVcBXXGylEHCok+xqJEBwUMlbZpqhLzFiFQEK9LBsDbBOuT788sFlwE2y+PF4M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebbfd2f-e129-4e66-a5b2-08df05458987
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 20:47:13.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yg82PfRk9lp0e2MKa2ffC0JjeBfcmjxTeXzCcgJ17tyGNW5YAVv1JjomhM07Kd1L8TqQFjUjjYqNKi9rANnUcXgmr/jdk3pU6Vp/q6GMJlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7301
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4MSBTYWx0ZWRfX30NdhfN2gIuA
 zCdOTvZebcDJRkSZlTKQU8+FA18LHIMqVMzNoWgi//jkMVqphqffnyus4LAepYv8diJgHtKM7HL
 pLBD0+2w0ZZg0EIDlHDaNI4ny1cSg1+Cfd/OXg3KXqT4ic+UjWbGLFx4oppeoy0039qMklCOj4N
 NHsx/ofwAVO7lJAP5tSBFYvVMVhrPFiy+lt/TsoHGA7LQ5oNUEX0jDB3Iz6onXCpJ4mAFh2eH0D
 4WmsHuRgoST1mmq4s4Imb9/L/bplATzXaX5SGzNRHq0Xz5iYGYp0DRXzbhWq6JE44De/IUZJEpQ
 glEsZ+UMogqB9p8IOYZTh87Tn0y7iHZ//CK9m6yIQMniXEtvAtI3Bp582n8M4+dD3uknletDzD8
 EhWlN3IrHzLDeQsuN/KhxKdC5FwtOf18ndwH+bsXkg60MbzYQ9JjpK1G9Lzb6dEl949G6ymvNbo
 RGa0sqQb1DWQfGMJdaw==
X-Proofpoint-GUID: UHjSc5JHJX_PWq8AKFHzwyT7M4NfiwQj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4MSBTYWx0ZWRfX3Ch7ZvUZYkEr
 vsQ0+65Wu5WV8dqplBKT0X4LMKHNQLbdcqd2F3CB7YA6m1dAEBJerPeIY77H5BOJdvUlm5c175A
 P/Q8mcHuplKJDqppan8KYqwHnnY2yj0e4Pba8VxeD14noUNuXmPs
X-Authority-Analysis: v=2.4 cv=fqTsol4f c=1 sm=1 tr=0 ts=6a91f3d7 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=dsLXKYi7rLjczPCFkvoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: UHjSc5JHJX_PWq8AKFHzwyT7M4NfiwQj


thanks Kris, 

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 8/28/26 12:48 PM, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 00978911..b5c8d319 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -200,7 +200,7 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  	int fd, err, bits;
>  	size_t shstrs;
>  
> -	if (!dmp->dm_file[0] == '\0') {
> +	if (dmp->dm_file[0] == '\0') {
>  		dt_dprintf("failed to open ELF file for module %s: "
>  		    "no file name known\n", dmp->dm_name);
>  		return dt_set_errno(dtp, EDT_NOTLOADED);
> -- 
> 2.52.0
>
>
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel

