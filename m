Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D651E8358
	for <dtrace@lists.linux.dev>; Wed,  2 Apr 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586681; cv=fail; b=UeXdrBf2R59v2IfBRcc2GYYi+qIVo4D14AkFzF6RTLo9fGz8iSqrExiXV0ohBZVmIs5nMLv5ORTTXyg1/rErr374HJtoOZbIM9QvGwNBUXhcWFN2UNSjOjPcPNiYnF1j8RbamRh/djWBThn+nZeY1vbNrpcY08snRP21CzA0tvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586681; c=relaxed/simple;
	bh=l/Zz/usvn24YatIOtQ/Ezm3EaPcnAjxnVcnEYntW7AQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VqONKNQVCKB0ND9ULgXxiP2LlvuArR3d4UDcBUsfeoL/QJZUaSOOTalFwHXIi+3TgpPdc2fqVockMIhBk9r8BSnmKWj7XxqFESDD6s0YBvuATQqu20oDP1+BceTt0HpAmb54xPcJxU2P7lS7XydlIh9VQJpV6EBd/PDjQYbgdRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wd25R2Ki; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v7ED7Wjh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wd25R2Ki";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v7ED7Wjh"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326fwgw019376
	for <dtrace@lists.linux.dev>; Wed, 2 Apr 2025 09:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9F0t7IplnkMSix2cI3NrwVO9DQ0AhcvSxrdjHDt+DvY=; b=
	Wd25R2KiCd7P+x+VIk9O6ceJouId8ys1hY6ibVxwfm/aQ0vDnjJKjw3rCGHTam+u
	wDt5XMjDwHHkK1pbShDWfQe+npe6tCWmPo8fhXByJkqEBG6DWLc+z5NxNFjfqSTl
	+bI8PZ9/d5CchcgoO434vLmKuLv5Ob1rXzaB0LtSV0OClvkKIZ9gLW1+gFFp4dJ6
	dfxHhNOjc8JbfraHKSfv4HxsCaJOOKXb9hmh5DQw8jl7+o4TTT9AJjFPCEMGB7Qp
	YgXNGQupJKodfLyji1lYya8AqG6rC/cpmcLNG3N5hiI1wwdYp6maL1VMzd+yRuer
	WRoUAYbK2ibV46nERPxtjg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2ac00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Apr 2025 09:37:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5329V1lD017300
	for <dtrace@lists.linux.dev>; Wed, 2 Apr 2025 09:37:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aaek6m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Apr 2025 09:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2Cop4FakhWcqiXa7onrPPGIHHB33P0P2SMXsYp3JzVYJhL6tYE1uNpSzYOVyhyqRWvWgHF1tTYk+ZEygt007zMPwhzHe0/lL73ZmJQREh24NgTyBxyiCdHHjwoZkejfqJaKNLFazwpPl7jevX24E4L1WWpB3GtwTGs51fDforprtjk85Q74FuYDXCZuUHZamPYEsHSNg1ud4vywT+7vjfXKHjTKbOH4EzIrWHCnpi8vT0s7s3CShGvA9LmroAgdIf9DkXm9iVgfQRbjAiZk1FsUl6ZERL0pEdWMabl8L3/lEa4sOrLCqY/8a77Mu+RiQTvmNhaacN+g/rsNnooELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F0t7IplnkMSix2cI3NrwVO9DQ0AhcvSxrdjHDt+DvY=;
 b=DX7Huui0m1jTLX4Pmsm0uOg/eVY879Xutb7Pcl11RATwDkaLLw2N63Nfjy1BedrjfCSnPupp/ro5NKgqDAPYGnJqdqqIrK19u3quScUN1YxFWSRJP0BsSnTFPTMJXTk5d+Ur/aVJHPPE6CP/3T5JrgCDTVi1syfKt7MdUYbo9BX6t84HRKJ4HhosEXOuEbv91BzyDI0AyRi88hKRGhw6LcpqTGTdAKnWuSF14QxpxqEFlvoWZuh9kqgrhiQIrECfhGWpMOlspqWWUr5dCtAScTCqlYgmE1N1Xf9dL1uCgrIk8/gThrybiR8G4j/AN0x6XUyMO8SRB5JmXflly6qT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9F0t7IplnkMSix2cI3NrwVO9DQ0AhcvSxrdjHDt+DvY=;
 b=v7ED7WjhDL5absluJ+ThDUng3cYwi3b1YuBWAbcrfD2mT8fNMDNOjrn7hkhquSSJ4VbvLVUlpnTqL1RxWXtbGe/mV1Vmf5taETO0Anu6+LUVasgH71geuf9g2blcO10jU6GJA+HBHREqtBPVqZl/fAzNkqKYD9fSykpKernhgVM=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by IA1PR10MB6049.namprd10.prod.outlook.com (2603:10b6:208:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Wed, 2 Apr
 2025 09:37:54 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 09:37:53 +0000
Message-ID: <d8785b9b-76f4-4c11-b47c-c4359322d876@oracle.com>
Date: Wed, 2 Apr 2025 10:37:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 1/2] Add a cpuinfos BPF map
To: Eugene Loh <eugene.loh@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250331214501.24126-1-eugene.loh@oracle.com>
 <Z+t7UAN7i+Dkpc5e@oracle.com>
 <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::11) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|IA1PR10MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: cac0254d-1b89-4ef5-e268-08dd71ca0acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkdrVmU0N3RrT3hMSlBwZlRQU0pQZXlxaTZBWjM5dFJoblo0a2xmKy93TlBz?=
 =?utf-8?B?RG15STJPSjg5T2hBNWIybjFvZmtuY0hxY3IzRzlxVTgrTmtBeTU2bGN6UUw4?=
 =?utf-8?B?ZVZ2eGJLaE9qT0NHNHVZMC9BSzZNam5hM2Y1cG5kQ05NeDU1ZEtrYlZrdU40?=
 =?utf-8?B?RzA1NEZ2L3dEU3gyUXRKN00xeWdBME5MZVRkZlpkQ1Q5K015MVg5TjBhZ3l2?=
 =?utf-8?B?dWJkRXowbnVjU2hUTkNYeGNmUjFDajQ2b084T1Z1U0lQQVNIV0VDQld2Slcy?=
 =?utf-8?B?TldhMUlVUktUOW9oRkxocVYyb1N5TW5IeWJWUEl0R0VZMkZYcDNXTENWN0s0?=
 =?utf-8?B?RkJEeUU4dk5RSkxYQi9mN2RrODRwYUFqWXZGcm5WQ0hKSUYrYW1jajNuaExo?=
 =?utf-8?B?TUhIcUt1MzhqeHFCa3FucHJuS1YvQmk2VFVROCtvV1BYV21kbEhHZDhZL0hU?=
 =?utf-8?B?cGt5ekFDSFl0OWh6NmRLblM4K0RBaW9kZUVIUEFJUTNnWW5LZ0RnejRKMGpR?=
 =?utf-8?B?bW4vZUVxa3lBNllaMlVCMUdzeGh4OGw3L3Nyd2R5NFova3lBcUlQaVF1cTJq?=
 =?utf-8?B?cUJMak13S1FoTjFvUWYxY2ZZZ3Z1TmNyWG1HTjRyUTFZRXFXa2FkeWtrWVZ1?=
 =?utf-8?B?bndqUU5RZG4zK2N2K2Y2b0NYUTNMUWJpb2xiNkZEbTRyaVBYRDhtOHp1RSto?=
 =?utf-8?B?dUhWODY3VUlpcStlY2J6ajVZTk5kWnp1bXZRT2JKVG8yMkRIdWQwMjFjd0dZ?=
 =?utf-8?B?Q0xIVGRNK1NtZGNXYXJMamhCbFcrMGRIZ1BiTTY4SnpkUE1KaDQ4bldMOVZP?=
 =?utf-8?B?djRJVzZPcC9GNFM4Q2VENFJOMmRMYjROamRjcTVybTBQMDZmUEFTTU51anlM?=
 =?utf-8?B?ZExzSENPWmM4VVpIamNQcDZLSklPMGE2YXdRdEk3WWhhNEM5RmhSWndqTFVn?=
 =?utf-8?B?Z0hiU1llNHZ6TlJyR0s1Q25lUDdwYkROVmVyYXhnNGk4ZEVXcExEOVRaYW5S?=
 =?utf-8?B?ZFEwOGNCaHc1T3R5MUZ2K1o2Unoyb3ViUTRzM0N0QVdqNjVLR2RLSXZSOWhv?=
 =?utf-8?B?UzQ4WlRmTTlxc1dkTlFLVjVjYkNUa0hUeVZtK2krSko0SSs1UzRJZVY1a0dv?=
 =?utf-8?B?SkVHZHJQOTh3TGlOZmQ5OGZxaWU2bW9xTUlsd0lmN2dPdlJGOUNzVlJpeFlY?=
 =?utf-8?B?TFJRNjQ0WDRsUEN6VFRVZW4yNkErbmQrRis2VEttM1NxL2txNUd1aksvNzdP?=
 =?utf-8?B?QTNFWXZESGNxWHFKeVRHR3dZMkl4RFJYNW9YR3d5d28rWkxObGtmQmtPSFRR?=
 =?utf-8?B?ZkpSQmpIVFM0M2ExM29odzR6dS9qWFVXeUtNbUlPYUpMZExCSDc2MnA0WUlX?=
 =?utf-8?B?WC81OTAwYVhvVmhZSlRDcm1udlNyRmE4cnZ1OEoyaGtIbnlQUktTWUJ4d0RP?=
 =?utf-8?B?YWNxaWxmWllBbE9JTGxEc0lKdkJqSXZDaldvT0Z0RVNNYVI3cUJsK2g0cDFk?=
 =?utf-8?B?S2tlRXNxZGp6TWYyNWluYnFrR0J3SW03RStpQUprcS9QN2t5d29nSjNGVG1W?=
 =?utf-8?B?YXpOVGJ4Uit4cENnR3N0eWxKNUMyaWEzOFZCNFhXR3ZKdVVFdVcxNS9KSzlw?=
 =?utf-8?B?WExueStKNDQvTkRkd2lIU1lCSExVZmx1RHdOYnN5eDNmU2U2MEtrRzh4S0lX?=
 =?utf-8?B?S09ROWtLZkJkeE04OGNCWjRBK1VYWW5OQkRKNFJMUzEveUFzenNSajEzLzZM?=
 =?utf-8?B?amV2NEFBSktDdXNRN3IrNktzOUkwdVd4T2wvcUtlaUZ5WDFqdnhxTHAyOTFn?=
 =?utf-8?B?RVNBSnlOM3ZaaC9qdndJTEkySTM2bW5kZE80MkR5V21vMFozeTRSbEZ2YnBD?=
 =?utf-8?Q?QgOLWZvcCk/jY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2VGUXVHdlNCNnhhcnlnRVNiajJ5b0JKSFhhait1ODh2Wjd1Qk1FNVBFL3l1?=
 =?utf-8?B?d3psbVNwVmhEV0cxQnp5ZkdQZ3BCUmhULzBGeHFmS3pEMmc4ODJWTm10YWwv?=
 =?utf-8?B?VlpKK3ZhQlhXd3R5RzlyZDFiVzZSaGUyMTFmd0xZckx0SlVxUHhQRWVQN3NS?=
 =?utf-8?B?azlDdm1PUlZQK2txbzRMK1h3QkFubGlRbzUrZVlnVnQxZklpc25oNkVYeElr?=
 =?utf-8?B?YVJZbG8ycnBjeWxqWVBnV3U2eG5idElMYkpldXBlZ2tpVkxPTDRSK0JyUGNp?=
 =?utf-8?B?S0svazdiOFUwZU9GNExHQzI0Zko2aCtMUHVYQkQ2TldxVkpaUEpVYXVuV3p5?=
 =?utf-8?B?ZVkvc2x1eGlUQ0lpdkFmemlQRFZ2TkM2M1phNkdWQmdXcEdQMGRUVDhOa242?=
 =?utf-8?B?RFhZbW01dVJvRmVRZjNienlTakJpV2d6VXdyRVlhVVhKWHoxNDdKMERLQnFK?=
 =?utf-8?B?R3kydlQwbGdrU3k2ZU9OeFl5d3ZDM0pSZFBhRWpwd1ZwU2pxdnVrbllWQW5Z?=
 =?utf-8?B?bEZiS1FwaDZlNm44NW1SWFoxbjVWSHBSc2pEN2tRcU9aMEFTeFJ3L1Iwa3Bi?=
 =?utf-8?B?RnJ4c0ora0JDTU9hcG1VaWhxY3VBZ2NGbEpySHpBMW5oa0pCT2ZUZVNJWXNT?=
 =?utf-8?B?MHNFMzZ4Nk54UThxRHIvWUxXM1oya2pyTUFncmVObUNrSjFaQ3E0cTFIcUtu?=
 =?utf-8?B?VGZNYjlaVzdnQ3VRUE0rWFdsM0dQeTNlcC9UYW5hYW9KVytMTjM3eEhTSUkv?=
 =?utf-8?B?ZEFIdDRuSGdJRjdkUHdzcnRIK21VZWF6V3YxdU1KeVZUdnFqWnpNZlh0MmVS?=
 =?utf-8?B?YVBSeCtqRXNkLzlDR2dLU1JjS1lwdGRjM25vbnUraWR2cTVENy9pd3c0d2FU?=
 =?utf-8?B?MURhSGhQaCtiVzVCdXBUMEVFS0M2aUdJZDNpOVpleWZIL2tVSzNpSnFpUlgz?=
 =?utf-8?B?THl4OHdyM2t4RUlKV3VaeWRRZXZhck1CRVhvZ3d6LzF2TWtxd1pSbWx1SkxF?=
 =?utf-8?B?dGdFVW5ZQkpDTkk0Szd2TzdBQ2tVK2VOZW9RK1JBQnRvdmVxLzE0aHRhMEdm?=
 =?utf-8?B?NDhDR0djT0pIeWpoSWtzODQ4OG1keGxiTkxQNGJRN3JoblQ2UXdWOVFpWXpM?=
 =?utf-8?B?cFZGY1p3NjRkQnZJTEJwQlk3QU1DaXF6cnh6N2dZeTZnbkNsV3B1ZlpYelhV?=
 =?utf-8?B?UndHaWxkRERvSHgzV2UvUFhhM2VXV1FvMnRSZ3hUVjJxc2gyNnZGTU1uWGRv?=
 =?utf-8?B?WHMyRWNZNVdHRXNoN1ZQVjRsRU52aWY5cTgvMVkzMmNreDEvbmxvVWlXMFlZ?=
 =?utf-8?B?SDJTLytlbk1xU2xQY2k5eEUxWTNqMGp4R2dOMnFMODA1cTBuSDFoazYxYjI3?=
 =?utf-8?B?czlyNWFJWlNLNXBpRUMrU0ltWTg3NU45Y09ubTBWemJoN1hBSkFNQ1RrYTRQ?=
 =?utf-8?B?Q09yWGcyaTJLcHZPeEZyek9qWUdOSjB0RmNvNnIySEhIMlJxR1M5QXpZbVhr?=
 =?utf-8?B?YzhLTFFLVzQ4aDJPazdaMFljSTIvZ2FLcjhvZEoyMVJQTkwvZkFiWUVLS2lP?=
 =?utf-8?B?NFZ5NFJUcERZc1F1MDA0a0pqWG1Wc1FFUnNFSVVUY0lwSVdSVTQ0QzdMV2tK?=
 =?utf-8?B?SVEwaWRFVkhXZWFWUmtnc3k1L1oxQTdrTWpuMStqWlFaUFZvLzI4NnFRdG5K?=
 =?utf-8?B?VWRRdjlXMU9TYlVobm8xaWs5N2YwOUU4akptclRPcGs2RGFMellVbFV5WEZv?=
 =?utf-8?B?MlA3VC9zVWNpMG5RM3ppcENzNXMyUDJ1WXNaK2FOa0FXUndkNjV3L0s5b3pH?=
 =?utf-8?B?dXRYWk4wK0NHUVkzbkZybVYwZ2E5clRNeFo3Qnd5MGhrMWlDRkVPRUlDZUhS?=
 =?utf-8?B?MFNQYUwvY0UwUnV4d0x6dS9pdTZnYnNIaHhCL3pYdEh3N1ZPUzlNb0hFd2pt?=
 =?utf-8?B?VVd6ajFVRmV5dngrdHRwZFpsWTJuS2dpaVkwK05HdHVJNHlMV1J3QmhIVG54?=
 =?utf-8?B?Rlc2eXVjci9Mc1k3SnZMaHI4Mkxob0I5Zmd6SHR1NHVYL2JVUjBYajhxL3Za?=
 =?utf-8?B?MldyMkMzUDYraVhmeHhwQjMxZExHb0s4NnVIRHZxWTdIa1pXVHNPbHB6QnZu?=
 =?utf-8?B?ZzNrWW52UU05c3ZtNkZzU1lnRUZJZnFuYmgwKzliZWt1ZmE5UWk5TFNPcHpS?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WKrJChkbpvkoyw6cD+GNXtKlRccwmbtnFkQabm1/rdIMspEWgxQj4eWfNbGLXqDVXZyiYgeMHz7R/RN6FxoHL11KdeJImV+hJZuIbtTqZsb+0Um7ynp2KFZu+5BtSiAlTbnIed5J8Ib2V5U/lguCulouq7KmRtf+y68UfW3LodziYCUZ1bLMrpPyLh3gr/g1ygaBzWpy/tNrC9kOfiuNsqpgQMjKPGbEEpmMNb6u/ct6Q+XHm9AbuSkAUPcOeYV+QYcPHwp9YDd4tKTxG8bL60WhUu2jHP8xuLqPP/v17OkE4PK4kbAu+i4Tf26v31oEmWuySZsnSRatO+79muj/Z2HVP8RfgBkDj5dScb8Q9IbSO7KIdz/JzMuN4Zs+UO4kZ6TzpflS8h3O9BQudSPAibrM7KLxJ94YhSOXVXw4ibPpROvJ7NGNQ5+PRGGzB+VpaxazVOQftjbt+9NtT2P6NbvMomg3QS9K6uqb67XgoRDOesU0fwPrOIQEksJ8GtcRU3BPDIrucckb/56VO0gbQje8lPWLS07Y4W1NPfxfXVI5IUqWw2Qr38JRyZMhsSSlejBpVAombkrySCIlRy12SfflrYW3b/cmnB6eBU1WJPM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac0254d-1b89-4ef5-e268-08dd71ca0acf
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 09:37:53.7234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bg04L5ZNNEH7NyOHu1qZfKndI9o3zdUWPivA2KWlJ8RqyOPubHqXSTYjvgh+jWNT+x5Qv9+TW/oTOWrz3P8dDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020060
X-Proofpoint-ORIG-GUID: iwDfZafgl_JKuF4_VOkr3W55WleeeahQ
X-Proofpoint-GUID: iwDfZafgl_JKuF4_VOkr3W55WleeeahQ

On 01/04/2025 23:54, Eugene Loh wrote:
> Here is a proposal.  First, two observations:
> 
> 1.  (As Alan pointed out to me in a facepalm moment), one can write a
> simple D script to check enqueue_task_*()'s rq->cpu against the current
> CPU.  He and I both find that the two CPUs are generally -- but not
> always -- the same.  So, the strictly correct thing to do is use the rq-
>>cpu value, even though you can just use the current CPU and be correct
> "99%" of the time.
> 
> 2.  A BPF program can access per-cpu-array values on other CPUs. Well, I
> guess you need commit 0734311 ("bpf: add bpf_map_lookup_percpu_elem for
> percpu map").  That's in 5.18. That is, UEK9.
> 

Nice find; this commit looks relatively standalone so you could file a
bug to request backport to UEK7U3 if it'd help. No guarantees of course
but it's not too distant from 5.15 and we've backported helpers before
and managed to deal with kABI issues.

> So my proposal is to leave the per-cpu cpuinfo BPF map alone. Perform a
> runtime test whether bpf_map_lookup_percpu_elem() is available.  If so,
> do that cross-CPU lookup -- the 2/2 patch I posted -- but using the new
> helper function.  If not, use a simpler on-CPU lookup, which should be
> right "99%" of the time. (I have a simple patch that uses the current
> CPU.  Pretty simple.)

For what it's worth, I think it'd probably be more valuable to preserve
an accurate CPU id and worry less about the other fields in the
cpuinfo_t; i.e. when tracing, I mostly care about accurate cpu id info
and never look at the other data in a cpuinfo_t. So if it wasn't
possible to retrieve accurate cpuinfo_t info via a cross-cpu lookup via
the 5.19 helper, it might be better to fake up a cpuinfo_t with a
correct cpu id and other fields unset. I'm probably missing it, but I
don't see where those fields are populated currently; tried this a few
times and they look to be unset for me aside from cpu id:

# dtrace -n 'BEGIN { print((cpuinfo_t *)curcpu); } '
dtrace: description 'BEGIN ' matched 1 probe
CPU     ID                    FUNCTION:NAME
  5      1                           :BEGIN 0xffffe05e7fb61b00 = *
                                            (cpuinfo_t) {
                                             .cpu_id = (processorid_t)5,
                                            }

^C

# dtrace -n 'BEGIN { print((cpuinfo_t *)curcpu); } '
dtrace: description 'BEGIN ' matched 1 probe
CPU     ID                    FUNCTION:NAME
  7      1                           :BEGIN 0xffffe05e7fbe1b00 = *
                                            (cpuinfo_t) {
                                             .cpu_id = (processorid_t)7,
                                            }

^C

If those other fields are unset, maybe there would be a way to invoke a
translator to create a cpuinfo_t from just the cpu id? Not sure about
the mechanics here, but my worry would be that it could be exactly the
times where we are on cpu x and enqueueing on cpu y we might be
interested in, and if that info wasn't preserved we might miss something
valuable about how the system was behaving. Anyway thanks for fixing up
the sched provider, it's really useful!

Alan
