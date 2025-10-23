Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597DE26FDB2
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247710; cv=fail; b=GFyJTWnwy3dUr2s6UthUtSucR6k1FEPCkJ24SCgjve5vltEtzsHG+L6f9td5LLIMnObPexQfdqIL2q5iLNS30eSa1KXpW/bmvzCqECSMyxdsc3t0+31vvNn+8L2o/tSegrYQoi8D3Y998qrGy18UO1V3NO+KqYUhOujTuHD19QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247710; c=relaxed/simple;
	bh=lTRoPK+u1RbsBzGDinwn5aAW4PWshkQLD62XEcfFSXc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TACyj/Rn5u2wLRhToZGdfAUGsNbTyCgGU1Nprr7bJU341ShQ3wPLT52zTSpotrLFOHE6pcJbEEVbZO9rZZyYGaoh27BKmPRRVh2y6DLmUoiDbLXp8Xrudk6ve6jpvS4QFDDUIOrzoUZe7MKbqVn5lC5A7LaQok4yv6rfzFOim8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rR/bZbtv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SG0uXQzg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rR/bZbtv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SG0uXQzg"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIC2dc019785
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+THhy75KFJ5OJ21YPWf7kLP+T4GErGdaB/ivad05CsE=; b=
	rR/bZbtviNhnfARoLLd81aj9PJLk3asEzcA5ngfzgR7pf8BNAFSdu3fQNjOYePpj
	r3CXMZDG5ViCoSpi+9T6CnJZhuT6Gyb888tzDmEDSRizIJUqm/PCBdCzoT8DPEdw
	OoSfPyPkiVn4B9tR6ykTQsi4JOI7JkVXf/97WBJkB6Yv31GcoezfrdJvP4TaqSyc
	GY+ZsGjL3TdwAo6nNtDoBxWwjBrdBO9JglzpZ0lYSzecch7P6fyu0OpVAaXHVH5X
	OFdGuoNbewe4rR2CKbdQ+kO7Ehq5VBkE6pwwDaHHrw3etiCSiO2PvgmdezolwTNo
	qC5xPBHHXBWJamLbwaNlUw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvd0u9qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBib3012018
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:26 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf7yws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:28:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFgxWSTC1zIWwMmn4M4uUv9w/lvOHYM7yJSeDGHjU0c2H3kDFsJlIF0Z5NotCrm5enD/QdjMI3Ii5GMDmAhXVSATDApF1uO6oubLr5eOJ31GjP5nKcwPv/7S7aFpv5Eftz5d/Adb81gpKuZvvW3JuFdBW3M43jL0+K1cmGwADXqsdPJMAZdliDs5zct/TeZhlCu8ZTkVKgIbp7z+6uqWZoMb/yWdB1NEI7Cr7rmDVSi1oLvEvA9a8sotCkTQnjBPcebNbH4c1zUbUJ2kQsvn4tsE1fVdM8A0kE+DYBlaijOF6/eIlw9Cq3t+5LZURJ7ZMrYcAFcgBtnNgnp1LMiCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+THhy75KFJ5OJ21YPWf7kLP+T4GErGdaB/ivad05CsE=;
 b=yr2XOmD+HUe+AddBEIuEoumVaPS/mPnrDq7q7IU6vy1sEvP/EGiTLZGtJUQmPaN8Cnw+7Z4z2ogwFol5QKizN/YFaGg28SaP5066MhpevQSwOx+vL756u2qTf7Ujq8RQKDU1MbdC8exEgEyi7Y6Kx4TN67klW76CktvunLmU4bLi4Y/N4iV7Slm8afbPrmQpbRmRX4LV2lEhvwi9EP9XThKj4+2zlKt9PVYxwDhLHYriuJ4hcEGijrgVBumdC1QKzgQI5HUgv0mjkhJUIiZLe+ma/Uzze7S/kQoyzkVXOXbUXj4GqJYU2ebnm60Qtj5Cf/Js1SYhfcgynbTjYxn0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+THhy75KFJ5OJ21YPWf7kLP+T4GErGdaB/ivad05CsE=;
 b=SG0uXQzg/eWN6Q3VBYql1HBWzTcMwdponwLeLPJgGB2irBNFdzqgeJBYsFcNJljOddjJXZrKChE6cpAqckQpg1XWYOT4RTjZP5BxbTNvGBFpWho04kg1IfsPjGtRtMP1zgHAof2nlQOpdcPr09RP/q4eKhABDSjwazeSv8ZJZt4=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB5700.namprd10.prod.outlook.com (2603:10b6:510:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:28:20 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:28:20 +0000
Message-ID: <60b45cca-f584-44f1-ac55-3ca18b3d3668@oracle.com>
Date: Thu, 23 Oct 2025 13:28:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v2 11/20] doc: Fix anchor links for how-to/
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-6-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR19CA0099.namprd19.prod.outlook.com
 (2603:10b6:930:83::26) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e00cd4-c96b-4f34-9b5e-08de126a52bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnBJOVJPUTR3TW1CUVBQdFI3a1pVcmNFM0Iwa2c4YTBrSW9QN2EwK1Z2anFZ?=
 =?utf-8?B?aEUxcStkUWlRRUx5WkMzM0dyQ3RwVXJ4YUt6RUl3NWVlMWVTdVRzMXRmaUp6?=
 =?utf-8?B?YkVGYXJzUHZ5R1VTK0wwK2ViekdiRHFLM1I1SDVoS2pPaTU5cW1ZT3VHaDZl?=
 =?utf-8?B?ejhHbVdSVkorR09WbVd5b1Y0N3lmN3Y1Y1FOaDBuWnlWYzZLYzZjN1RuaFhR?=
 =?utf-8?B?Y1o0dHAwZktyb2dQaHdkZFhETlFvY3Y4REhjdG5vRWloQlVaVnN1NW53VU01?=
 =?utf-8?B?eDVwZ0diN09mQUZ2YTZmVkpML3N1a0JuWjlpMlQyRDZDcXFIcW54RjlzT3NZ?=
 =?utf-8?B?QTMwWWZYcmN1UWUrL1ZqZldVOEU1amRBbXpGQzF1UHJzVmVBS1E1OGpqK0tq?=
 =?utf-8?B?UTdHOE5sUkltdkllUy9JOUJoOHVnSmVpZzVCcG4xMlFaWC81MGs1Q1dHYkFJ?=
 =?utf-8?B?QXhVRjBpdTBZcVN0Zlp1YXFNczRJT3hrM04rMXBHWkFVcyt6b2htdWNXeFF2?=
 =?utf-8?B?V3ZaMjJnTzZXeWJIUzIrbk1sRmFkc0c5c2tWNEh1OG5GVC93cmx5YVdCQkhz?=
 =?utf-8?B?YS82UUhTcmtBWjBTN0p4YmVWb29SZE9iVzFVazlmSTJUR1p3eW1nRy9wbGdH?=
 =?utf-8?B?MFBUUXJOVWVHZUNDQ25VZ0VDd1JFZ1dDNkxPMkwxeXo2OGRBZ1hJQ3hyNTYr?=
 =?utf-8?B?RFB1cFJuWWFubVpqNEprQ0NsUmFQaTVnTHgrQldGR2hwdCtwdi9jZ2JYenhs?=
 =?utf-8?B?d0hSVjl4NFVqWWozTXRuL3Y0RWNDd0NadENNZGtoazRxNlRPSnpGZzl6VjB0?=
 =?utf-8?B?OEl1M0dBcjdRSXU4YXNOU211RTFjWkplYlQ5K2xwQmFrSUVrWHBOL0dQUVNT?=
 =?utf-8?B?UjNtbTE1MjRxUWRwUXhiOTdQSUJEUDlSckJrMFQ1UnB2NVNvWWlaWWp1MG1E?=
 =?utf-8?B?TGUrcUliaEYvajZ1UU9QNWRQNHVyT09YNHNRVmdoSGxpNVp6UkkzS0R3WitI?=
 =?utf-8?B?NzJqRlM1RDhRQzdBSzFoVU1hV1BhMUJVQzRkTXpuUTdpVy9NWHdoT01CR2Z4?=
 =?utf-8?B?VUlMQmdJWk8xRExFblhVS2tjZmtvVE1yS1YrMDNHcWlzY1dHS2QrMWdoWmIr?=
 =?utf-8?B?RkxOSzJmZGY2djlVb1NlSFoxR1pzMm9nZSs3TmVhVWVma3J6b2FoYStCU0RM?=
 =?utf-8?B?dzBNUDdDbFBtdGp5MEpGWUorc0ExNTk1aTFaMlBoTkZEdkhROVVmYy8zYkFs?=
 =?utf-8?B?UThVSFYzYUIvV2JheVFiQS9lMEpCRzBSRUZxbVlyZDBpOHVrVVhBYmNtbk9k?=
 =?utf-8?B?UERVTGQ4eEhTYmZhQ1FmMmQ2RExLanZ6cXBmcUZidTVFend5OXdtc3c5eTRV?=
 =?utf-8?B?Q0NKVVpWaFpJcDRUL0dIUXdicXNySXVHbU9JZXpTQmEvemRvV3BYbGpTWUFQ?=
 =?utf-8?B?ZjJiVEdIYnZvbGdIalhtTm5nV2dmSWd6MWUvMmJBd2V4YTBiT0kzREtzRmM1?=
 =?utf-8?B?bXdtN1AvSXN1dWZ0UmN4VTlKZ2xvTTVtemlNRFNYb3pZRTJiNzh4UVR3dGRS?=
 =?utf-8?B?a2JaMTFXQkVoMktncnpXTGFOOHRBNlpiTWdGRCtvWDFrRE1kdkFtcVkrUWZ6?=
 =?utf-8?B?dEx6blo4aE4wc0FUR2lJcjJla2JKOXlVQ0ZDb2YvdnZmUUs5WDRHOUZBVGpR?=
 =?utf-8?B?UVJjRHlIQ01tQkNxeUFLd3VuclFNODVmbjBKdGYzOXpXdlFJdDg1YkZ0b0Fl?=
 =?utf-8?B?MUorOEdMUmRvVk0wUkd0NXg0Nzd2clVkT1YwZ1VwNzBOZ3ZTWHNRVi9MakRI?=
 =?utf-8?B?eW5LMk0wRGVKa1YxNTgvZEIvSTQ2ZDd5NlNQcHB4Vk9lRFlFeTdFL1BzMSt2?=
 =?utf-8?B?OSt3eER6bGlZNnVmYU5sN2NFWEVBd1paRFkzenh4MjVZa0kvNDNSaFdsajlP?=
 =?utf-8?Q?HLzOlPP/pnIQ+KcRapH0+KxHuyFgsLx2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJycTlmNzIvZHd0YzduOTgvM3hTN3poZHdLeUtnOWNYR1VNaGcxem0yWjdI?=
 =?utf-8?B?Q3QyUGF3SVVDZkhOL25xSTR2ajNjMGwweGg3amdNRXdFTG1GM2tmc3hOTTZM?=
 =?utf-8?B?dVA3a0NvSkJXcTRocU4wV3RQRkdCMmNrWm02cUJTNWhoaFJVQVZJZVZtdkRr?=
 =?utf-8?B?MEN2RFdqbGI5SXlCazcwU1lmMFFjNEg5NnI1UUNIREpobG16UVJva2FBOWFL?=
 =?utf-8?B?UW1ZRm95dmlRTCtBWGZjNW1zbnZNUzR2NEhxbmp1T2kzZkh3dnVlMW1iNWdk?=
 =?utf-8?B?NVVvdDhzQW9QSkIyU3pZTUlnU05tMW13UklyZk1KTnAvRThOci9Xd012NVlw?=
 =?utf-8?B?c1F0MFY2NG5rb3BXWmorR2RybytieEpIZ241Sk9HcXlyYkQ3V3dEZHhMeDg2?=
 =?utf-8?B?NzNIZnVpc21hSDVVb0t6UHAxOXR2L0FLM2pyT3g1Qm9GaEJUNmFmeTdES010?=
 =?utf-8?B?bDUxY01ENnNZTmh1eTZnbDlpRktrOFJlT2lWdk9aUWJYVE41MTVGcm5Vbko5?=
 =?utf-8?B?VzBHZ01ueC80RVErZUFSaVVmbzg1MXNhaFN3UW5UVVFPTlFUVkFycWZOUVdk?=
 =?utf-8?B?dEtzciswWVhLSWlFQUd6anFmMmh2elZwa1lJRzd4Vm1ZakN6REdZczY0Si92?=
 =?utf-8?B?L1RhTUU3eHlOMW90b25lSTF2dWN6K0k2eEpwTXEvUzdEVGx2TURnZ2M2TUtU?=
 =?utf-8?B?UEdYQXliY3pBbDhhVW5wMFcxKzZlQitPOTFXTURlanloU0lwUkFlMTdHakdN?=
 =?utf-8?B?VVJJV2JRUk1wUmpVWUJCYTY5a05lc0VBUUpZRTU2cFpZR3V1M09zZndXYndr?=
 =?utf-8?B?NllabE9kMmxVSmxMbTdXaUNIN0EyMS9kTzhvYVFvZXYvSS9NYmpVQ0pRR3Ux?=
 =?utf-8?B?OGZRT1ozQjBudmUrMmpURFlaRWtMNHRLNVFIK3M4VSs0S0diN1ovSk1qY0hv?=
 =?utf-8?B?RlZWMkRYSWI2d0Z5V09abG5ZM2tjc2U4ZW5Dd3NmNTloUjhGV0pZd3dQN2xy?=
 =?utf-8?B?OVFKRnFHbENnZEhUdTc1dk1HaEZ0d2JIck82eUZpUGZiTWFVSWt6ay9WUjQ5?=
 =?utf-8?B?SHBxL1dkSWVSYlYxZi9iRkdIZTVmM0FCNUlLVXlNNUhpUUEzSXUwNm5TRHVi?=
 =?utf-8?B?MFZUZVBnT1FHQnM2NXpicEJZYkdBcFNpaVNiajZ3NXZOUEtQYUYyY0xHQVQy?=
 =?utf-8?B?dmIyR0NJTFJCb3VHWkVCOE9xbGtYTGVCYUZ0YUJGNTl4blkzbFRKN3ZaQnFn?=
 =?utf-8?B?aGlXUEVuaCtiNnE5WGlNemNtT2NTbW4yWUxnMkh2SEowT1dQeGxRMnlWUUZ5?=
 =?utf-8?B?N2lsMFFGamtYTVRLeC9MUmpMTnJEbi9qS2N3UVFCYXd1bGlaa3I0TmtaL3Ni?=
 =?utf-8?B?MkdzSDNvanBqN2NHeEpvT2tRbDRodlIxVzBMcXR1amExeE50djZUY0RxZEZk?=
 =?utf-8?B?OTNuVmFUY2U4SWRlT1lYeUtGdUY3b3BEY01qblNHRkcwY1cyZFltbjV6azRH?=
 =?utf-8?B?RUV4SHlmRE5rLys3SHVBR3dvSkVnaGd6VjRERVMrS0s2dVFmMEFLNlA1QmVy?=
 =?utf-8?B?RmJCUUt0clV3NnFkaE4yTVNpYUk0QS9IVEVqK0thSEFhZ20wREV2MkQ5YTB2?=
 =?utf-8?B?aTJRenB2dm1NVjIvK1QvWnYweXVNSG44dUQ0VGxHbmdlQlZyRnovWGVvZEZJ?=
 =?utf-8?B?RFRBT0FMc2x5R3FwS01YYVJZeGpCdmcxbi9odHNrRVNXeGdsSXcySjVFbXBp?=
 =?utf-8?B?a3BPZ0kxdTZ6UnkzT0dxWVpRVUxwQTlnWUFVbnZkRGJIeTlnSGJGSVowamxS?=
 =?utf-8?B?VVdrVUNQSkpMamwyM0NkdlZrRmhPaGR3c2pYRWhhYWxhVUJmYnhvOWN6cWtq?=
 =?utf-8?B?L2N3L1Q2VG55Snkxem1kczFFejZMQUJYaCtyazlXUTRmSzF6STcyNzBteXpG?=
 =?utf-8?B?YzFYZ2ZYdGo2R2J1V3ZXZWFVQ3AzRHhSSXh1MlpybVpCZnVULzVXR1V6bUJ0?=
 =?utf-8?B?UTlLazBUZTBjdHRreElrNFhvejVBeWZwRjZaN2h2WjUxOG92anI1OTh5bFE4?=
 =?utf-8?B?cXhhZlVEQlh6Ri9oNm10Ui9qcFJJUUhkZXA2bmdadjdsOVJVYmJIRm9CTUVy?=
 =?utf-8?B?Qm02d29GYkxXVHEzb29YOW5sTC95QkRYa2svNlFNQ3RBdCt0MmdSaThpZ0lK?=
 =?utf-8?Q?M+a5JGZkRtdVEoN+NV5UsqU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vAeOIc2TpYKKA7Y/IuxY+TYtsJL1TPIcmdPszyah1to2vlThm7VlanYmQCbxwCQUHTjWiLhEppk7DlE5h+acTmnnwymRNuJ0INLX7tMpUqoVlRCKCi/vv4gf5wDR9AxMTgYSWyclN146jZBTCWUIchuJuHTaqhax+EYonMGhFur8pUeAjyYrcydRyo6Xi83LfUBKhjHu6WIz/iwC1foVkB/zcvY20cMFX+ed4kEY40ep5v73DnVWKrBqbRYJuSqHBzEkzR4UNUesHw527wStZxBMsiBbKdbCxemqJOnL7RrdE2/pA0cY3Q9WlqkaQ+ehckO5SkltUvkViYLxNkg9CLS73K4q+8IgYUh+drkrMYOurxdHGDvpi5SVsEjHlvscLmd1VPBvAKIBhPHwVvkAdhoE+WdaS9RUhh6fH3bB7/A4GqCu7Yu6we7cCBm/iqoiVxClG/Q+c4KYJfHH2b5vV/vS1Q88bIOG3lzylsaian4rCvjiaOUaq4vh8HZRFEj3L2je88xwy65NUqVZi9Zh5XXFyM6f7IIp2Yn3l3gjv+QNoWQSsVhxtYaEiOdlI0yrJOJiTAyDqWZ00tsr5M7mtmSet71buIKJC9aQhjDiumg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e00cd4-c96b-4f34-9b5e-08de126a52bf
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:28:20.0692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOBlfh3cZ09SUgnigtIbMzWgJ+368QVhOI6VzNlDNyfi6uQu5EZiHQrG0XrKvMxYa90iQHw93omwpnX6pKEjZ2NXyJ8KJrbt0aQr930sR6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230178
X-Proofpoint-ORIG-GUID: NmAPYG0hLQSaqsvuHXB63yZD384C68qQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX4qFyfO0BS7O9
 nd8PpjYUpJ1oBifxjeXHbFCM7yRM/dhUB7NgEFY+M4CxCfOmGp/eZnzQ/6kiuS54DvaNKrCeDJM
 DqECQfBG8LoKlfW7dGfqwBx2ILeck89lLo17I2HDkJfshCabAvEERHkpAdqnBii809KME074gpn
 SmJc6vUSkt5rQSoOk3FaDgi1Ixt+Epy0idQEO9yQwjl/UJXgPudLI3bqPvZZUsPQdsZiexdzITo
 v6Wup/oFod39hx8mw9Bpvh7E9hVJ2A9CbB4rnk5QD6P8DAkpl889HgZRCnYBrUTM2cWZqLyQVOK
 RJg3/iB67iiwVztekgmvA+FeZVajMuy4qKVzFgrDtNai0S93/Aq/It18C086O0wU28exs8tH6mj
 GM7kOlhKBsB2tlWcnfPysIY8+StaiA==
X-Proofpoint-GUID: NmAPYG0hLQSaqsvuHXB63yZD384C68qQ
X-Authority-Analysis: v=2.4 cv=D9RK6/Rj c=1 sm=1 tr=0 ts=68fa81db cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=MLTVYJVNqLCrdeX34mEA:9 a=QEXdDO2ut3YA:10


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../how-to/dtrace-howto-create-a-dtrace-script.md |  2 +-
>  .../how-to/dtrace-howto-install-dtrace.md         | 15 ++++++++-------
>  .../how-to/dtrace-howto-list-and-enable-probes.md |  2 +-
>  .../how-to/dtrace-howto-use-predicates.md         |  2 +-
>  4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> index 199649a9f..949ade0bf 100644
> --- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> +++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> @@ -1,5 +1,5 @@
>  
> -# Create a DTrace Script {#dt_create_script}
> +# Create a DTrace Script <a id="dt_create_script">
>  
>  Learn how to create a DTrace script to develop understanding of the D Programming language.
>  
> diff --git a/doc/userguide/how-to/dtrace-howto-install-dtrace.md b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
> index 45da88fd8..3bc29e14e 100644
> --- a/doc/userguide/how-to/dtrace-howto-install-dtrace.md
> +++ b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
> @@ -1,10 +1,11 @@
> -# Install DTrace{#install_dtrace}
> +
> +# Install DTrace <a id="install_dtrace">
>  
>  The following instructions provide steps to install DTrace on different Linux distributions and to verify that the installation was successful.
>  
>  **Parent topic:**[Get Started With DTrace](../how-to/dtrace-guide.md)
>  
> -## Build and Install DTrace on Gentoo Linux {#build_install_dtrace_gentoo_linux}
> +## Build and Install DTrace on Gentoo Linux <a id="build_install_dtrace_gentoo_linux">
>  
>    ```
>    emerge dev-debug/dtrace
> @@ -15,7 +16,7 @@ The following instructions provide steps to install DTrace on different Linux di
>  ## Install DTrace on Oracle Linux
>  
>  
> -### Install DTrace on Oracle Linux 10 {#install_dtrace_oracle_linux_10}
> +### Install DTrace on Oracle Linux 10 <a id="install_dtrace_oracle_linux_10">
>  
>  1.  Enable the yum repository.
>  
> @@ -38,7 +39,7 @@ The following instructions provide steps to install DTrace on different Linux di
>      ```
>  
>  
> -### Install DTrace on Oracle Linux 9 {#install_dtrace_oracle_linux_9}
> +### Install DTrace on Oracle Linux 9 <a id="install_dtrace_oracle_linux_9">
>  
>  1.  Enable the yum repository.
>  
> @@ -61,7 +62,7 @@ The following instructions provide steps to install DTrace on different Linux di
>      ```
>  
>  
> -### Install DTrace on Oracle Linux 8 {#install_dtrace_oracle_linux_8}
> +### Install DTrace on Oracle Linux 8 <a id="install_dtrace_oracle_linux_8">
>  
>  1.  Enable the yum repository.
>  
> @@ -86,7 +87,7 @@ The following instructions provide steps to install DTrace on different Linux di
>      ```
>  
>  
> -### Install DTrace on Oracle Linux 7 {#install_dtrace_oracle_linux_7}
> +### Install DTrace on Oracle Linux 7 <a id="install_dtrace_oracle_linux_7">
>  
>  **Warning:**
>  
> @@ -111,7 +112,7 @@ Migrate applications and data to Oracle Linux 8, Oracle Linux 9, or Oracle Linux
>      ```
>  
>  
> -## Verify the DTrace Installation {#verify_install}
> +## Verify the DTrace Installation <a id="verify_install">
>  
>  Check that DTrace is installed to the correct location and verify the DTrace version.
>  
> diff --git a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> index ad9c3a4d3..9325c6f1d 100644
> --- a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> +++ b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> @@ -1,5 +1,5 @@
>  
> -# List and Enable Probes {#list_enable_probes}
> +# List and Enable Probes <a id="list_enable_probes">
>  
>  DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
>  
> diff --git a/doc/userguide/how-to/dtrace-howto-use-predicates.md b/doc/userguide/how-to/dtrace-howto-use-predicates.md
> index c32f3050f..d00d31a01 100644
> --- a/doc/userguide/how-to/dtrace-howto-use-predicates.md
> +++ b/doc/userguide/how-to/dtrace-howto-use-predicates.md
> @@ -1,5 +1,5 @@
>  
> -# Use Predicates For Control Flow {#dt_preds_dlang}
> +# Use Predicates For Control Flow <a id="dt_preds_dlang">
>  
>  For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
>  

