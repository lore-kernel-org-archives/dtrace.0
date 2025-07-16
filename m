Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE5264618
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 20:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752696335; cv=fail; b=TbkXnuUXfDzDT0odJKaosiWntisKKpQ8vM66YRXbBqbWFTma/ZJCTN7JAyCdiJacrWYpNUHSalSyCY63nYuQ47ViUJMRa2TZRKg3NktjgF2oWIY96RzVrO+oSK33ro7YGgbewKe7azO3ZfCv9MfuKjPoyH2rZoQulVQs8ldzWI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752696335; c=relaxed/simple;
	bh=P3lAW8rSRhXuQ15BAY2fdKNMv1lPr4rCM7ofMeu8wqs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fm9vRLam3i3zyFEnKDy0wgPRd9z8ISe//P1+xOJ/pZXnz0qHTyDtadHxIbUqI5QaMmSNm/2Hmzg9WVlJ9s+G0cVoLWR6NanN5y9Y6dxkdgXBPMDYwL5Y+zOZq8gWeI2en4SpbSuPEOAcsSBldgMr8JBjxDyK8wUASWkgTwSCeok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VvKVYG55; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vfs+0wZC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VvKVYG55";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vfs+0wZC"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GJvEx1015189
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 20:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sElzb3DSsbpRoirGMffcsZb9//CPQqoPU3m0OaVNrug=; b=
	VvKVYG55Y4ku18SR8MQAD3NEt0xxyM+fqFhr1tYu16Pgs7SVLWUhZePEoj7XwKw/
	Gb6Rf0NYKJ3nXJTzXoehqbvarcF1VhHx0n8uRSwXYAnqcpgr37LitkPKtxOgRq+r
	vjlTkxUP57F0+8fI/YBxZU5m0qzuxTp9MCS/lthzy9IU01iZG0lr5g2b3Rmbnip9
	tb91dAmDpzkkIsGOFOxnR+Ps826GL7Gx/Fw8dygPpLPtNvvzlaofklnL8Pa6hnZY
	NRbAyi5vNilNIdbLy2MJKs4bHsfISfhUqT8irZy8Dltb+Qy7wRpzc9v2CayKrwi1
	sBhd+8F0Z3P87kgsL3zfDQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujr11kfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 20:05:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GJFZQ9011670
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 20:05:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bu636-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 20:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0/JcafciWPQ9hssRgtTNUNSxGAW5k2jf0ekIHa9TUZMWkMD42OpmDNQUjZTUs6VCbo7K6Ryov6Ac+7Lm55yKb33FcMkSoQEKdbXNQ0wSqLiNJdUBVh9ADuP01Qyup3nlAdwiqXgg5x4Mrxq6mllF41grt6lA8DPiCLL9KC5h9a5a3nXJz7INtON4gepeKZO+8W48m/ioJd3EmP24YyNja6zyF1YE0oNygxEELD/+eEaQG+eC9Q2vEbjT62wT0IMspBgYqUFdb72B6JkesBsEaEgUPAMxxVEPwainquIb2pn36yV/4Hx/SMimKOOqLadFX9/OBxnQzCEf5uwfjIa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sElzb3DSsbpRoirGMffcsZb9//CPQqoPU3m0OaVNrug=;
 b=lrtj4YP4sdd/45wn9RVnBvFfcUC2BMu1vT0DfVIzlmLEh57oiLGwcN8EiJxCz1Cp4tZQHvp8v+ppgfIn8E+edATxOyo7LlDQ5VrPCY4kVSstpD47QQePDeONxj6M5Cn29XDmasrCEFBfSEviXjDtf8BXcMrNyHYYdpyqLgPDIaCjBKYriM+ZHaAGKcpAaiKkqw7NDh9PUSfmb9KW3WtfE+MlurPnug5H0iKL2WqCt95gseiWh5sV1y5qwJ0diD/o6W11cElK0quUrlLQuIhELFjfET1q3qAdhsX/fvCJOx0fQ2cC2nPze9KmfzE5j4Ym8J7CiX5okLkypSNw/K5k8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sElzb3DSsbpRoirGMffcsZb9//CPQqoPU3m0OaVNrug=;
 b=Vfs+0wZCgYQYbLDHVBur3poBJ0YkV5CxX0xaf1Ji6trDDYmVANbLtNrjZoNIEzE6hnqk4cCi4ZW71L0M0Z954BI5gAlMVYU/MbmASCxYeUSQsFky1xHZeLYrvZaYvrnJTVMtJYdnodYNALRz3yU+N1DPnPXswJLdVIy6x1V1Py4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB4874.namprd10.prod.outlook.com (2603:10b6:610:c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 20:05:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 20:05:29 +0000
Message-ID: <f9431bd5-1054-9686-1046-d3e460f542c3@oracle.com>
Date: Wed, 16 Jul 2025 16:05:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/3] Cache per-CPU agg map IDs
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250501182252.27772-1-eugene.loh@oracle.com>
 <aHf5CFrpkCFYlz3F@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aHf5CFrpkCFYlz3F@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: ef20febf-abde-4b40-530d-08ddc4a41c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnQ5ZDVHN3lFM2E0eEdkSzI2enBQaU0ycnZiMHlBbzRFSjFDQzZYZGlJRm9J?=
 =?utf-8?B?Z3NGWnYyeDJERzJJcXVBOVd5eVlCMDBFRXhibEgrR3NyR2R1MTFJZ3JCTFpq?=
 =?utf-8?B?dnErTzNINTFEMXo3OXJoOGR4amN6VW9TeTBVRkc4d0tWZlhKVFNwZEoyOGFi?=
 =?utf-8?B?eFkyUnMzVkNOaXN2TEdlQ01sK2FKc2k3WWRuK1FSa1BNWWZyaGdvdzYxZVg5?=
 =?utf-8?B?MTZuSHJSbkFQazBQaW84RnBVdUhndHhidFRCNFJidDM1TW5rV0x2Szd3UFJz?=
 =?utf-8?B?c3Fsdm03OEpoOHlYcWdWRFNhWmNFa29CTGFsWEtrVmh2WGRUT2NwOHIxbU9i?=
 =?utf-8?B?UXFjVE40VmxWaVRmOXY1SVhDK1lRL2ozZEdFYXVRczZsMWJ6WnVmTStadUpp?=
 =?utf-8?B?aVBJZUw4SUhXTVZnMFBud3hreHNtYjI0OVVLNkZtMDF6MUVsbDRLUjZrNjJx?=
 =?utf-8?B?dzF6SjNLai9sZ3lQU1BEb0MwSTlOMVV5UjBVcFA4ODlvWFF1cWQwTExJM0Nt?=
 =?utf-8?B?NFBjclgwWk5zeHJOeDRhNkNvZXVueFNrRGJFNlFsNXBSTWUzaVRpTldQTW9D?=
 =?utf-8?B?QXZsQm9VaUdFUXRDNUp1TnRLMkZaYTdiVEIvY3k0L3Z4cURtSGxnOWs4eWV5?=
 =?utf-8?B?THJHUVpieWNuT2MrcjU1aXUveDJxNFo3VUtxMUV0bzBXWnZKU3VCalBDaGVG?=
 =?utf-8?B?MzFuRWMyUWV0WVNIY2NmcVFBT2pUWmVnaUlhTU5SeThKcjBCV2dSL2R4THVI?=
 =?utf-8?B?U09RdldVS1FvVjMwMFcwUlhYQmQ1YTVzeEdHakFsQkxYRll5MDA4dEFNQWxU?=
 =?utf-8?B?a2RvOURQQmRsQ3orR0UvS0RXUnJuazZOOFJRZHFQZkxJb2dlTzFPeXZEUFFz?=
 =?utf-8?B?b0ErajFxcjZCUWxod2w5eVVod0JldC9GQlo4dzJHNWlpUUtmR0dFcU9rMXJM?=
 =?utf-8?B?MU5SbGlWalZ3U1VSdzZNNVp1ZnNyQ1lNcDVJOGp0Smx6b1pscC8rVnBoVXdF?=
 =?utf-8?B?N0hrdExwS25UdzhUVm1BM3RrYlE5ZWdZa21Nb29wTkxZSitXT2Nybm9wbEdF?=
 =?utf-8?B?Ti85cS83M3lURlU4WGhmWTRwN0tCc2NYVWlTdjY4M3Z5ZEUzU0QrTUNtYS9X?=
 =?utf-8?B?R3JjWVB4dWwvSzVzemVvT0liTzR4UmlNclc0L0JESnJLUFh6c2V4UmJLUVV1?=
 =?utf-8?B?Q1U0ZkV1bnBMRXpacWJBMitrelByOEgwTXZ3dDNBc1FvTDFheXBqRzFsOFhR?=
 =?utf-8?B?VlF4L3prdk5hekx4bU93YzVsQTEzMWM2MHlabVpZZllabXp4YytSMVhLbEhL?=
 =?utf-8?B?dEdCNGxnTkRlcHRsOXplY3JpVUJIUkdUdG53ZG1xWGFPRjBBbW1yU2JaNno0?=
 =?utf-8?B?SW5ZbUNiYjlPaVVnQm01dXNLa0VNbGo5RUlPaTIzanNqNWczQW1xejFCRUpr?=
 =?utf-8?B?dW85TDkwVWN3MW0yWE5Nelo0QUdMZThKRUJ5UGZQaEoydmt1SVFhSXpETFQz?=
 =?utf-8?B?UUVrMGM0MTVIWFdtVFl1cDF4bXdMOFA3SG9hOTFNb0RhU2xuTng4eHBLUmkw?=
 =?utf-8?B?am9Zc2E4MEhjNnZIaFUvZU11dVVaeVBGalhlM3c3eUw0UVI2QU5KeTNZRmdr?=
 =?utf-8?B?ZU5DTmNEYW95b2d3aFBZcVIvdjVtNmxqNFJIY3BFc2szbGNaWTJ6K0ZjOVBG?=
 =?utf-8?B?a2lrQ3o0Rk9ud1dwMWRwaGY2b2NmTE84VXhybzlMSFYyV09ZMWQ0ajlHVi9M?=
 =?utf-8?B?SHh6eUs2MVhnb1JpekVKQlpSck1pWEFrOUY3am15ZEloM1hQK3NxZzc2MDhQ?=
 =?utf-8?B?TXJralJycERWb3VSVHViZFVLaWd3WUZ5bllPdlo5MGN4S0ZNZEw4QnlYRzBH?=
 =?utf-8?B?alJKUCtwaGU0MkVNZHBjRWFPRGJaSm94Y3hlMmoxdnFkY3Znc0Rya1FpRG9G?=
 =?utf-8?Q?4PXrKt8qDBo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azh1aUpocmN3ZHFrRUF4bERoYnZYKzVoVXJqRWE0dzExMitYS0lnYTZ2RTYv?=
 =?utf-8?B?NC9vREFIZHFaOVozbU1MZnpjNitLa0VPME4xSmNRYm1NUDJYcG1Lay84SnRM?=
 =?utf-8?B?S1lmREdEUUhhZXNDVGhzMUZpTms3NkRkS1V6cmxrdnZrdUoxZkQ3V25IUGt4?=
 =?utf-8?B?SzNxbzdQb1ZOaUdJN09KQmJkMUYza1BzTFAwTzk2Umc2WjBNVDJ6ZFI4d0Rt?=
 =?utf-8?B?dkpLaGFpb0UzZ0REa0R4ZTEvalRpZzl4UTl0VWJ0QnBXRzNFdThSWW1zSGdQ?=
 =?utf-8?B?ZGdDWlhaWWt1UDR5c3NSazF0L3FmbHRXdk1tOElEb3NJRXdjY1YxaXJxOGov?=
 =?utf-8?B?VWhzOVlNc2pHbU1CSnVXbWxid0xTVjFCQ1JMZE5nVG03VUdiLzhnQ082bVZH?=
 =?utf-8?B?cW9oaGFHMktsYnlaMmVCS1FlWW5NS0lSMFFPYTducy96UmlPRkpLNERrbVFr?=
 =?utf-8?B?VkFMQmQ3cUp6SFRCSEpPTDNUU1o5NWhzM3pSQTNGcXo1amxwamgwblZpLzA5?=
 =?utf-8?B?Q1ZCb1c0a0RubHg2Y21mM1l6WFlWVVdJZ3ZtQXFtckZIWmx4NU9WaDJ5M0FZ?=
 =?utf-8?B?ZHhwRkNhdGZ3cWlKZW5GbVhtazNua3R4d3NNbkFIbWduWEJpZUdZNlFnVitN?=
 =?utf-8?B?TTFoWDcvbDhXeGFNaGVQc0ZFRFIwYjZvY0xMRGxmR05oWnYyL3VTVE1ORm1V?=
 =?utf-8?B?N2xpWVBpaDQyaGJ0K2lTbVpPTU45cDE1T2pLdGF2Y2lIWlRtTktJYjBEaWtP?=
 =?utf-8?B?QnFiUGpSNllSZmVKUktXNXF4VWNSbUE5ZUhHNEl6azVjbGZnSjVvZDI1cW1p?=
 =?utf-8?B?djdJZjM1R2VKdGdxNng3NlJzbEhtcm9MZmxNVGJ4bDVQcUJHaVphNld5aWdt?=
 =?utf-8?B?YitEQkxjS2o2VW1IV3FyRFRwU0hhMGFmZlRTUXZWbGZFc1ZUOWNQUEVOYTYz?=
 =?utf-8?B?cG1Lc1o1MXhXdUwxR3BUUXhRd2tkeXJmbks3S3VtbGhHN1A1WWJ6NVhtaHVE?=
 =?utf-8?B?bGFVb0pjSHZ5V1VRVnluS0VDN2FScER2dEx5dHpJUEFIYUsvTTFjTHNqbVc0?=
 =?utf-8?B?MXRud2NxQU5DdWd2MVIwM3ZiNlgrSSs1aDdzcWhSS0tmbG95UkY4OE5CRTVJ?=
 =?utf-8?B?MEpTTXlKekVBU3VLQXNqOFhEQnhsZjBUM1B0UWhDbU80R3VQM0tZUmNxdXpI?=
 =?utf-8?B?VDNoZWRZZWI3ejhoWmJtdjQwbkNCWWZtVWl6V0tpcjdQT2Jhc0NqSHY2RHVO?=
 =?utf-8?B?S3FSRU1UaGpsWVprbnFFM2lxc1lkNDhmSmZaM3VGQkNLVVU2NGQwaVNLbkc0?=
 =?utf-8?B?cS9lSkNsNE0xVHlIRURZM1laWjM5V28yZUx3LzNucEdHc1hrUVlGV1VySEto?=
 =?utf-8?B?RmNyMDlGNjVLNEZEWmFta1RVZVI4dmNnR0xNNDVvN1JxNVJBMitDZyt4WGdB?=
 =?utf-8?B?WGZZMnoxazM5Zm9va05EOEJhRUVUcmVFTm1Sem5Vd3IyQjl0djd6OE03YmtG?=
 =?utf-8?B?dDVvejEvbEZtU2MzclNBSkNPTWVWTjdRWGtldXA0eXhlMUI0QkttOTJ1T0M4?=
 =?utf-8?B?NXVnNXNSSHlnTUczanNxMU0zY0ZYWDN1UXkza25mNm5kM3E0WjdNUHM0ejR3?=
 =?utf-8?B?dklJUnN3TG9mbUJWeEp0NFRuZ3dZOUtFWHdUOTlvcmFvK3R2N083WXJCdnBl?=
 =?utf-8?B?VnViWDFtazROVE9NV2NFYmhrcWVXNm1oakF5c2NvbytxSUswTE1xQzh1UVpu?=
 =?utf-8?B?cWpvSWw1ekZaNUJjRW5EWjN0ME5hbmJ1Y1JVajlRd1dIaFdJdDFBbDdwZE53?=
 =?utf-8?B?bnpMVWF2Qm1kRS91Q3RoYm9VVDJSNkxtVDc5YXVWWUlmSlp6QnFNZnRZOFRP?=
 =?utf-8?B?eE1MZzMrbnRCb1hOTWl5d0FzMm9TMGFUZ3RBOGpPTnpHSmFOOTRwVDFhRC9w?=
 =?utf-8?B?YWZGSGh2Y1BzWFNNbzE4WmkrSS8rOXNkVWtqWFdwVyttbjdCMll4NkE3VVFi?=
 =?utf-8?B?VE9DNXJMODlOR3ZmK2thLzlMckU1bE5KL2pKNkhCL2pxNHdqNmg5NnZNMWxS?=
 =?utf-8?B?ZlBKYVNzbGpmWTlqTUZvdjVOc0tidnR2bmNYK3lPMlluUUpMZlZ6cFdiR2pW?=
 =?utf-8?Q?iaHUEudk426z80ZjNLJWo9YL7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dl91Zg3aTENl1HYcRjDK9outIeHnXDxMw+8nlWYr3nOOB/nNNNPknDLMkwAUzjKIJ638KaZY7TPxUvRMDEgmv8TQkeZ4ZUfw41bncvC/kxZqcFpOHYtWCWjiU8NC9u0sgJzuGvp1iduF3WgnEzlGh8z9c5qZLcBt596JD26GevIBqgkrJQ6eDXPByk1JtxMPP/xBPg/3S2oIwyDa000M7ZyGArwxUhiXPc46KlpciRodPNniH3rueoGIKb9gF0Jkpb3G/EgPxI1up953iBTnKQkffSYHotiZsKLaWaPSwXm3Gz8YL8ItyWTa+n9OChlWFbKlTSi8CHYyhffj5F5+UKgVerDJUChskd2YBfRbiQj2aF1O3z+h9v+NExSxSwZ3E2wy2nB01tKmvthjqlIfVDcJlxkgm/ryMBcr1jZW150yapqRB3sLhoov4eSq5SIG7juvFjlqvkqk9bgkIdIEXuMmGeSXMHoBVi1d3epTutY5joskvgfdhJa7pohD5xuI6ICGoghmvuf8AXWY10zIxQ/eEA1ayLweHTmd/80Fkz2779+idy1dQn6S31Bc8Ci5xeGlhN3jlqj7f28Fafm9N1MWQjXzYBqukgZGDH7yUaU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef20febf-abde-4b40-530d-08ddc4a41c9a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:05:29.1894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFYUBGQHIE0kMaNjR/gh8rFwj93N/H4R2nVuaJ6HXa2m3cqLAPDBu++R5Z0lRP7RINenVGEkPJbGkpG+qa/MzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4874
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_03,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160181
X-Authority-Analysis: v=2.4 cv=d9T1yQjE c=1 sm=1 tr=0 ts=6878060c b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MvkQCpAiVcbYVu26CLgA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: 5wLPElujPC7buPmIyy39K2CXFkDxxjhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE4MCBTYWx0ZWRfX7yRks7Yww818 Js5EE8s0INxbxw3N30G/Jw26XMFkK1aQDQBBg56tjVVkIKNfqmuor/UUjHg8yFVwZOFNofxK6lH KTXjJYx1tzGecgfMAbJH+CG8SPX0JyfLN3UvTTMZoJcXcUm9VEcItRows6rtI0dH2sdC5qdEYAh
 9nOtONOKqbKfVCQM1JMJ9I2uCP4hxyvI9tlIenMLs0+rLZFW5l+uQRLNv/WO7PQmxUVpmYHfhuU Cu5lsgilmy5+8zZGQcRiNRshihunfzLVZRjg0AgZ/BVDuVztHfoHKFrN3b/Crk+7GRSM7ewOsVB +z+5fjSCj3ohw2mUjshMtMNLdg73RpJhcEDU+APA+saxfwUav37ccwnrgHURtbHy/UYylXB3YYN
 w+phYEDYiyF0wC3PYzsq9/Ls+XPDWS5ndW8XEnDSm04eikX/NwttWWoGFsqbs920EdMlLo9T
X-Proofpoint-GUID: 5wLPElujPC7buPmIyy39K2CXFkDxxjhf

On 7/16/25 15:10, Kris Van Hees wrote:

> On Thu, May 01, 2025 at 02:22:50PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu) call that is used to
>> snap or truncate aggregations takes a few milliseconds, which seems all
>> right.  For large systems (e.g., 100 CPUs) and many truncations (e.g.,
>> tst.trunc.d, etc.), however, a trunc() might end up costing a minute on
>> the consumer side, which is unreasonable and causes such tests to time
>> out.  The run time is due almost exclusively to looking up the per-CPU
>> agg map ID.
> Of course, we only go from 2 bpf() syscalls per call to 1 bpf() syscall per
> call.  Have you collected timings for the two kinds of bpf calls we use?

I'm rusty on this, but as I remember I collected timings on the BPF 
calls and it was clear who the culprit was.

> I would actually expect that the larger cost lies with the
> bpf_map_get_fd_by_id() one rather than the bpf_map_lookup() since the
> fd_by_id needs to allocate an fd and link it with a map.
>
> In all, how bad would it be if we were to just keep the fds open for the
> per-CPU aggregation data, and not having to do these bpf syscalls at all.
>
> But we could end up with 100s of fds open of course...

Yeah, I think I decided against that approach for that reason (iirc).

I'm happy with Nick's R-b, but let me know if you want more 
investigation on this patch.

>> Cache the per-CPU agg map IDs.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_aggregate.c | 5 ++---
>>   libdtrace/dt_bpf.c       | 6 ++++++
>>   libdtrace/dt_impl.h      | 1 +
>>   libdtrace/dt_open.c      | 1 +
>>   4 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
>> index 9e47fcab7..86f9d4d5b 100644
>> --- a/libdtrace/dt_aggregate.c
>> +++ b/libdtrace/dt_aggregate.c
>> @@ -800,7 +800,7 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
>>   
>>   	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
>>   		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
>> -		int	fd = dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu);
>> +		int	fd = dt_bpf_map_get_fd_by_id(dtp->dt_aggmap_ids[i]);
>>   
>>   		if (fd < 0)
>>   			return DTRACE_WORKSTATUS_ERROR;
>> @@ -1232,8 +1232,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
>>   	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
>>   
>>   	for (i = 0; i < ncpus; i++) {
>> -		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
>> -		int	fd = dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu);
>> +		int	fd = dt_bpf_map_get_fd_by_id(dtp->dt_aggmap_ids[i]);
>>   
>>   		if (fd < 0)
>>   			return DTRACE_WORKSTATUS_ERROR;
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index d6722cbd1..635780738 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -689,6 +689,10 @@ gmap_create_aggs(dtrace_hdl_t *dtp)
>>   	if (dtp->dt_aggmap_fd == -1)
>>   		return -1;
>>   
>> +	dtp->dt_aggmap_ids = dt_calloc(dtp, dtp->dt_conf.num_online_cpus, sizeof(int));
>> +	if (dtp->dt_aggmap_ids == NULL)
>> +		return dt_set_errno(dtp, EDT_NOMEM);
>> +
>>   	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
>>   		int	cpu = dtp->dt_conf.cpus[i].cpu_id;
>>   		char	name[16];
>> @@ -702,6 +706,8 @@ gmap_create_aggs(dtrace_hdl_t *dtp)
>>   			return map_create_error(dtp, name, errno);
>>   
>>   		dt_bpf_map_update(dtp->dt_aggmap_fd, &cpu, &fd);
>> +		if (dt_bpf_map_lookup(dtp->dt_aggmap_fd, &cpu, &dtp->dt_aggmap_ids[i]) < 0)
>> +			return -1;
>>   	}
>>   
>>   	/* Create the agg generation value array. */
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 68fb8ec53..1033154d9 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -388,6 +388,7 @@ struct dtrace_hdl {
>>   	int dt_proc_fd;		/* file descriptor for proc eventfd */
>>   	int dt_stmap_fd;	/* file descriptor for the 'state' BPF map */
>>   	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>> +	int *dt_aggmap_ids;	/* ids for the 'aggN' BPF maps */
>>   	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>>   	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
>>   	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
>> index 71ee21467..7da4c82cc 100644
>> --- a/libdtrace/dt_open.c
>> +++ b/libdtrace/dt_open.c
>> @@ -1233,6 +1233,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>>   	dt_probe_detach_all(dtp);
>>   
>>   	dt_free(dtp, dtp->dt_conf.cpus);
>> +	dt_free(dtp, dtp->dt_aggmap_ids);
>>   
>>   	if (dtp->dt_procs != NULL)
>>   		dt_proc_hash_destroy(dtp);
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
