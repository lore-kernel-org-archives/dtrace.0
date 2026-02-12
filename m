Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D126FA50
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770920031; cv=fail; b=p5mxjhP9VfGvXKD5YQh6Wd8iJc35mq7hi2Liw2BaUQdRZI+tXpUemWVVOUbVgddMNMDmHHGNHDTcsUhySz9UsNNfp+tXlaPXNHnq/wNpuPwOjtDLohtNhAZsTIphd92YNiA2OLMegfE9y9INJ/BP0pTJ0hjth6D8ycfOHk/aqG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770920031; c=relaxed/simple;
	bh=eIJdyxBP9Q+n8wqV+7vZ148LDJ2XBgdvdbJYpF0VIS0=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HbUSAqXhNWda/yE3/NbOpAdDx0RfZG125zUHNNn2LOOQwUNJ2I/mxnbEUqA/86TG8QBEQ6+M8A6RvLrh/rpzldT5VwoJyunjL+Wugkm7xpztyNvVH248Es2c2+T1EdNInwI3lGlTBdv9C3oXOs0zDcV/sjpuAd9Fb5X/mxBNz1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g9ZF0+Ue; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NNno7pQg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g9ZF0+Ue";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NNno7pQg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNaUc484875
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PBcVOKOh86Cf2SrpbYT71L4sx6xJVOMQwm/fO21ALf4=; b=
	g9ZF0+Uehfx2AsLdVHFL5fmmfmOBrq+dam0Mf9eY437H/z5OGfSVAW+7jQf3Fisw
	JONfXWR4K2sB3x7tv96wLKP0DhbodnwpPZubOM/WriMl1uWIZgBOG/cDlQmusqpZ
	WPH+NBcpYUfpfnELRCFYMow7CFKqLUdhzLpwBW5t1XQyJHGOTemG1hSLdPqjYUWK
	WC7byqiHDvKphSqDvrKVhN+7TAdLUCuWYopQaDcUMC/XQUG3Bt5PUCe4Qj4lLgUd
	erwotpOmLylynIDEyTxc07+4PfKhnl95zup7//DwB2u01LD0zvObovEkWniQzOab
	ZATboAJcEWFyA+v5P8TiMA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88fv3xew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:13:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CH5e6h030276
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:13:48 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c822b974q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmm4lQO19CQw8XMOI/muv3slW+2W0YRgIAQNE4aTRDVDabKGHQ3g2zjR/0ZMWCEpuPUy0AK6rdrc6MF5bzS93oY3BoiYWmbvpXjITNI4mJ/YwYRCdqlAq/Zx/yNlbewpuDOQH6CYauFOtMmYx1wPjddrr1MQXF8sJiUYbExnEsfxL8/LPrGE5+4jVoiCNhVkg42DRYoE0OkanguEU/h71suvaiM11Y+7MWkW06xcLtdkOz3ObwV2j7bCfCxRaEYz7bMGO1qD7RF1lSZDORHvjfp3OtMYHThLbPHs1EIgRKghTxzejWWW99dR4b83/YmWaIrRo/ZmbZxpcvU6rGOCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBcVOKOh86Cf2SrpbYT71L4sx6xJVOMQwm/fO21ALf4=;
 b=P2QAeAdlXwUM0ZGVGWsW2V/JrluaWmNuW0wbQAM3fcPm2P8oAGKawok3kK54tHgpJ4wjIWzZiSkpIg0fib79sMef42YYJg44T8IUaUR/mj9+tU97kM6JTtl0hdx/hIzWFs+nNhRNYfgOtSB29g+uNMTq5iSYO4ouvVtOzxk8Fz6X547wBc6uRpYtQxEsAaMSpUhRMb/K1sIDsqKtZYJigESolJWH6VM8DLUvJXSAWJf2gX7XIf8R49/XGRo2Z4oDUdCBLwKPeyj6d1kl0kpwGbxTIGhRGy5+U/WHLLGfr6pGH0R6nHsosk05pbfohbQb6dC97JJ+4xyVJzJ2qZRFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBcVOKOh86Cf2SrpbYT71L4sx6xJVOMQwm/fO21ALf4=;
 b=NNno7pQg/xwOZbpnDtodRdj9yfymz7Lh0v+mkylvgzXY0agxD2mAkQTnbn2A1Q55lAbiV1BiQ3wfFBtTvBoqRiJnW0b2q1tAKmGwkiKlhRw0TIf1IHnAJeyUezAE4KnOpF7s+mKxmtOwAezq0I2PpB3LynJayo+GMG8Af32x+lc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB7541.namprd10.prod.outlook.com (2603:10b6:208:46e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:13:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:13:44 +0000
Message-ID: <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
Date: Thu, 12 Feb 2026 13:13:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files, not
 the filename of the mapping
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
 <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
In-Reply-To: <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:510:e::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 51cf9404-559f-40db-9b15-08de6a62753f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2k1L2NheHRlOFJjdUJ4YzBsdTIzK3ZYcGZ6bWs1UG5iSisvMjd5Y3ZheG93?=
 =?utf-8?B?dHFUUXFXamFVQ3N4ajA3UWZNYnN3cnlNNk1QR2VOU2crelVnemFzRVlTM2Ir?=
 =?utf-8?B?bWhIY3hFM2ROUWd4V2dxMzVPZEUxaTBsQlhTV25HSE1sUW51a2N2a0dTS1VY?=
 =?utf-8?B?K2RXaUNDZTl1Z28xZkIrOVVLdFVGYkhJdiszZ3duT0luakhyTzVQM2dUUWdY?=
 =?utf-8?B?Skk1V0MrdnptMER6SHcxdmZtTGM3SDIzSkRyWEJMQWlkZnN1aGFCUkFYMEh4?=
 =?utf-8?B?MW9NRUxmUzhjVk5JNVQ5R0UydVd1NDdBOTRheUU2Uk5zZzNlY0dpWVl1Qnk1?=
 =?utf-8?B?OVpaTG0yMndRU1dyMDhGNTZISjZBVUZwNWIwT2l4akJ6SlVDeFh5SDdTTDd2?=
 =?utf-8?B?SzRIU1FBNTJDUi9OQ2dSczl5aVE2NEY2aGYxV2taTEFGYU51cmdOSG1DVVRw?=
 =?utf-8?B?TjM1TnR4R3VRWlVMaTVubTNmb2pjNk5VeHA5WFJ6eVdaUVFWNjMzNjNDR0hz?=
 =?utf-8?B?SGRvalU4a3BJbkt1enl2OWJKS1NoOWk0NnRXc0taU3czdHIwMk0vL3p1Y0kr?=
 =?utf-8?B?MTNSQko1RzFNdVk1ZHJhb3pKa01hSWJIN3kyUVgwMmk0a20vMWJIb2JzWTA2?=
 =?utf-8?B?SXJFc1QxZWtzQ1hPZEt1TlVMbGdOZWRwZ3ZJNlBjSUlCS0d2VmJmWFNib1di?=
 =?utf-8?B?TzgyWHZRV2dYaG9qYkVOdXVDdnZoSlBvWVQxOTFFUTNMVEhjYjNIMnRYVEVV?=
 =?utf-8?B?NUF1WnNaTjRlakZXSEl3Mi9BYU9oeDRyRGYxTUhOOXpqVjlxNGtnTTdVaDBy?=
 =?utf-8?B?WEJmaU83VHE0ZWVrNlZnSHI3WEhybWJqWGZLNStHWUhMd282VnJZdWYwVDVs?=
 =?utf-8?B?L0Q1TzljaGg1RjlXNGxRbEJ6aFcrbGFPSmpwbVMrekdGeTBUQ05MaktEaW0x?=
 =?utf-8?B?d2NUaFhUWUFTdjVxYml1dTRVbGZOaHZuSFIyUUVJRnBka05IeDFzMitSYjlK?=
 =?utf-8?B?d2x4MHpOajVxUUV2NjRyWnBYSmd3S01sMEdIWDh6cnp1bzdjS3RVajU2MGpt?=
 =?utf-8?B?ajEvaHpuZFkxV3dwcUMyWEdvME1XdTBpQUtoWkpvV2JUMnM3UTJJaXJwWFlU?=
 =?utf-8?B?eXpDeWQvT2RDU1ZMQXl1MGViMXB6eXlyWC83Y0xuNlc5SkNHUlpYYTgyc2dO?=
 =?utf-8?B?V2lzRVFQQ1Z5TzFSU25SenF3bVV4Slo0U3ZFOGhVdXpCTkNWRDFvWnV4MDJq?=
 =?utf-8?B?WmVhZHJ2aTZtdFNGNWlWVmZoeHdjbmJtYmNvM2ozcVhRd2RMS2VLa25HVmFp?=
 =?utf-8?B?WVRXK1p1MnFjN3NkaCs0NEo0MFI2cDJJeVJUY2VqSFFEYXB2bU1MeXN3RnA2?=
 =?utf-8?B?NVZwUFEyTlVCL2YyTC80MlJRTEdWdmlXdXJCMlA5bVhJL0NUME55dWNpeGNj?=
 =?utf-8?B?cHJLa1MzRFRpamV0RTJFZW1yRHNyOUdrTVR0OHF5am5KMEJ3dHpBR2xzZXFk?=
 =?utf-8?B?d0VwQWd1RWhubjBidjlwaFc3c0JVdHQzRXpZRVhydWNZR2hLMlRqV1VIZTBQ?=
 =?utf-8?B?ZGtSZExPcFMzR1VBYldWMHVpYTU1aXlONEdhZFdybG5RYkgrYktlOC9iZXlX?=
 =?utf-8?B?ZE5vR1NIR2lqN3RvYVVKSVo2c0hjSjNBYy9tYmVUY01DSmdhNHdOdHRETlVI?=
 =?utf-8?B?bG50dnlKZlJyc0RSSFVFcTAxcWUwbEdnMXFKOEZGQkxpOFloT3FYTWd3QmJk?=
 =?utf-8?B?SFZBYm5CSDBiRXlRb0tGRFZKazNVMG5ZUjNuRm5DUzA0c1hWSlAwYkFlYmYy?=
 =?utf-8?B?cVNVUndkM2krRGQzbkJmNHJYNHFZOWE5RGRiZHgyN0toZG13M3BRMW9ZK0xO?=
 =?utf-8?B?RWNrTFVPblg5RHloLzlrelZCcGJQR3BKU2VPVzFKMmY5anZhUnVqckt5Z2JP?=
 =?utf-8?B?OUNlNWlzZkpPNTdBWmpwTE5NdnBjSWsyWkF3VENmTDNBamtFc2JacE1wZElu?=
 =?utf-8?B?dEZSR1RNVkpnM1lmQXBXM1U1WTNZWE0yRUl4MWhQWjhKUkFsUUNXdDlKYzFj?=
 =?utf-8?B?OXQvWjBsUXdvaHdQK0YzZVFBL3AzcC9aYm1EY25jaVU5RmhEQ3dLWlhGbXdM?=
 =?utf-8?Q?Yozg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmhPYXJVb2N3aW9HN1BoTXo4c2JXbVlaZHR2VkkrWlY0UVNScWZKR3lndFFQ?=
 =?utf-8?B?bXdNblZYZXJZcU5Za25TRWF1cDVZSWNtNlVVNzA3Ny92S2RBeHFjZWhjdG9J?=
 =?utf-8?B?SmdYaG43VGlnb0RqMG45ZVhJOXdlUVlTU25kU3BibklUS05ISExzVERObWhE?=
 =?utf-8?B?bkFNL2YwNitnTzM3RE50OUtMVDl0TVYvcWd3alZwVCswa0FDdDdxbm1yVS9L?=
 =?utf-8?B?bnB3Z3V5RmQ1Zkw3akZNbWZsR1lMT000djA4UmtkUmZYYjM3cThaeTFCcmFM?=
 =?utf-8?B?bEN1Q0NrVzlncjlNU0pjazYxWlpZOE00TTJTTW1YV0pvRmxmN1RVbGhTS3lz?=
 =?utf-8?B?UzFKVXlZQXk2aFowa0VMMmY4RTN0M3pCUFAwaDJIWW1pMG5SMlRiVGxWSEYv?=
 =?utf-8?B?bmZ3ZmxsUXdkVXFLNzYwTzRWaEppTmkySWpTMHhIZ1J1TlFyMldobWp3eHRk?=
 =?utf-8?B?ZlRFVjQwRGxHUkV5VGk5Nm9KUVJkeDBoTm1FWTFOQjRtb3V0Ky9Pd0ROb3JW?=
 =?utf-8?B?bDFmYm1GRlJlQmUyTXFpRk0xL2ZNWmlaZ0NvM09UR000K1RSQWZhN3dmSy9n?=
 =?utf-8?B?V2QvUVZrNk5OQzVnUCtibzIrZ01hdFQ0bksvRjZJS0Z6VlNwZDc3V2xubjdT?=
 =?utf-8?B?ZkFIeW13Sm53TXhOOE52anduMkZDdWtIc2VyZmxNVElVSk8wN1BDZlVUQWJ0?=
 =?utf-8?B?Tk9uNG5yK0dGT2NNU2NiUldFUjY5K09iOVRmcHBiNWVqZmVtMTN4eGtRTFY0?=
 =?utf-8?B?RUh5dGcvVGt2eGhvVnR6SmFCMjd6anNIZ3ZEYldoSkgrU05QMWZjamM1NTVh?=
 =?utf-8?B?VzFGN3AybE0xZnJyRjVNOHNGNEhJdXorYzJqTnd6THRiUVpqTHJvRTA0U1ky?=
 =?utf-8?B?UXozam5uNlBMNk1NV0g0SE5DRkZZWXlhL0lTNS9mR1N0M1J4QVphUFExemda?=
 =?utf-8?B?cVdMSExmUHg2eW8rV1c4dlF2cEE0Y1RTdVl1STlpcjlOMnFjYVVveGhHd3Jx?=
 =?utf-8?B?ZHVvd01FbzRrRVRUSVpoSFlXQ2wzUXB3ZzJsZDBpMFM2dzJzUmtubEE4UEhR?=
 =?utf-8?B?M3hadjVYbzhZY2xCRllCVFQrS3J0czVkQXgyYXRUQ0grN1pjajlqZnN6NEJt?=
 =?utf-8?B?QWdLVU0wL1N2R3FRaDhhbGw0eEZabUlZQlQyNzI3ZnJ1aWdXcVlXMjFVZ3lO?=
 =?utf-8?B?KzFWS25jcHpadlZMVkptdndIbmE3eEV0RUdKVWpnR2NUeVRub2FyRHE5Z0VL?=
 =?utf-8?B?eDdEOWw4YnEzSnVXeWxpOGZ2L0pmZmVlak1EOU1iTUozNk5QcFpLTFVJTWlC?=
 =?utf-8?B?N1Jrb3NrNHRPZ2IxRzV4RksvSGF0d3pWZkVCM3d6Nk9LS0laU1lPUmxtQjdV?=
 =?utf-8?B?QUVUOHJQa0lhdGhjZlJMckRrQkdPUXlFVEp1RHNPdUQ1Ynp3SDZWS1N4N251?=
 =?utf-8?B?NzQybXdTbnozdXZGQldmdU16M3U0TllIZEFYRnd4NFNjdzE5R3VlemZrNy8v?=
 =?utf-8?B?MG1LdVR4R2JxdVJmaUo4c0w4cFBENzM1MFlWSVVLTlZsWjAvUW9LajJRcE5a?=
 =?utf-8?B?dmlGLzBuY0dnUVYyZWZ5QUY4Y1J5VUpMc2k1WnFEc0NQSWUvdXU5dEZVekU1?=
 =?utf-8?B?bkZWVzM0SzBGQ3c4R2w0RmZDUVkvN2ExVnN6dkVKL1FOQXNmVjZKUlIrZnRP?=
 =?utf-8?B?ZjdVZDB3dlpHY05xN0V0VkRhRXhrZVpzUEo4QkR6TkF3YTlrMGZWTlA2Z3dl?=
 =?utf-8?B?dmF1SU9RU2NoMlJjeEVZN2c0eno0OTJQNXFNU05jTHZxVnQ3c2NVMFRsYURN?=
 =?utf-8?B?czAyeWJwZjQ4TG5uczBqVE5JUjFJVVFBcnFxMC9SL1Q1RC9BSGRaQUtRT1JI?=
 =?utf-8?B?ZGR2TytKK1QyNjhkYXlRVm90TXM3VnU2cHFWWDM4RDRqTndhcEV5Skh3T1E0?=
 =?utf-8?B?R0dQaGh2QlZDdkwwSllrSHE2NjlMZVlBM1pRUVRMRERwdVBVanBGSzc0ZUVQ?=
 =?utf-8?B?MzZYVUNyaGRUYVN1TitHSnVDclg2TUF6K3JxVG0rQXlla1BwMWVaQzRWMVZH?=
 =?utf-8?B?cEcrN1FyQW9iblFXQkZZS2svNnM3ei9CV3FoUU42K1lIazRPREk2clp3cC8r?=
 =?utf-8?B?MytjVzI0YjVzVFJkL1MyeWxrZnRWWnk4SE5iekNmZC9jREZKaVV4cEMvWjdW?=
 =?utf-8?B?WXZOZHlKMUdmZklVcDBRNXl1L1NmNjRROGc5WnpZYk91cXBXenRTUVUyME9L?=
 =?utf-8?B?WURrZVM3Sm50ZUdObFhCQ2pSZ2thZjl3b0VXcGUwSitsVUNzWkxPN0k2QUtR?=
 =?utf-8?B?ejZTQUpBS2g0aXhzYlZCUzJmWmJMQnVVWXp1NzdDZTQwR0NyQlN4UT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hXLo9OeVzlQUaenuGVp/OYj/Ol7GuuBj20CbebWtVRb8T3eaSD58oJb1FzLbQhgPSeUx/Vfp2V6zWDtdIMKtVWWYm6v/vG/zNxU3t6AodZFZ7ujapYZ3U+HbObWLvCBi7CiPdprUHakjvozmRMQ9nBqV3uBCeB3FK36EIIdKAJqHLM9+4bnOVQZLNkC7NDztBAxJY87XjRpPx9sMfsxjuMtoTaznKEQ1wwf53l5qrP8YU7PR5kIzp/bziULn1tff933puf2lrDiZZfQamecPvZv0kUzhxsTgvT43qOvaQHZeAtg9DqylwJy74hHBiSU/poV/FMLc9jYe79cKEvbxMfJ3bavOOcxxr3t13FNDJ1rrAJBRXxvsqGFvAwwAoBaNrs+GsCAKKd1qP0Ab5NCkaOeD1x9yOm7Ya4Bvd4elbRxH9bj4iNtN7YH3LtCpVjatz8TIaYYqfRasFlN8IFAykN+hOjRFbqveK2Bng54zuuxuLo9ZTdCM4BXlWqFwnSVuFVWtQmA8DqtW9yUQmkzuPnptvBhrtXFkNOua2oaKCThFKztqcY6h1UKioqp/tv+6Frs8It6rp6tOtFmMIRUBjjj8zauGZYNYFoGT7d7DUV8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cf9404-559f-40db-9b15-08de6a62753f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:13:44.2046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b+d/jCoC5JveTlL2EcvwTNsHDw1EsZKSNX9BE6sxJ/xVUumcdUxx1xDdRl6Kzfl2TbbO0vcNblU9BqP2VMgAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7541
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120141
X-Proofpoint-ORIG-GUID: CIzoH3dJjUGGK7nOvq6R3jAJyyxgx2Su
X-Authority-Analysis: v=2.4 cv=Qchrf8bv c=1 sm=1 tr=0 ts=698e185d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=YwoupALPPf56snUnq1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CIzoH3dJjUGGK7nOvq6R3jAJyyxgx2Su
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfXxR5sV8Uzg+lz
 7ptqIv+4Fe0M7jA/cHINVXVv17qxPXxL0Gwt7HMPL/LWiflHOjP/dp3d5i0VrMqI5n65qyC481M
 p2xGS1rAAfoFoCou5fpGcezBLL2vAfND51N6gKu2x9gwcjFOkZKRwjpW3JPiQS/1YCAVh4Jds1X
 PzPp7mEOQ+dOYgu8jPDFREdS9uis7UTmnJWvDu6rMuXF1aVytyZN60x/2vCtPmgfBOg1nCSUm7u
 LSJQxcj7gq2M764pdULqbzRDg67R+bjFAOhXNuqfvr9skpfIw8VVPv4RKjWukEj/cZaQSgo14Fi
 3ObSH3m0YRULXVPyFjCqS43BdFPqGwBC4j/2mVs50Gs4+VLVfGWBXd+hIB2LVOyC41/vF7vg0wa
 H3au0xSx0oGc9uaYiZzMxxIz/HalpkIVzBWBGrVAZyXONF3Tc2FCsCpIPqtO33ZeOHw1y/nB5Fo
 GCY0C6lqt13CU46tKtA==

I do not know what went wrong here.  I would have bet big money that I 
tested this, but here is what I find now with this patch:

test/unittest/usdt/tst.enabled.sh: Running timeout --signal=TERM 41 
test/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
FAIL: expected results differ.
400000-401000:main:go

Diff against expected:
--- test/unittest/usdt/tst.enabled.r    2026-02-12 05:31:24.000000000 +0000
+++ /tmp/runtest.6196/test.out  2026-02-12 18:09:58.980466976 +0000
@@ -1,2 +1,2 @@
-test:main:go
+400000-401000:main:go

That is, on several systems I'm getting widespread failure on USDT tests.

On 1/20/26 14:24, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>
> On 1/20/26 11:20, Nick Alcock via DTrace-devel wrote:
>> Instead of using prf->prf_mapname (which resolves to the mapped file's
>> target), use Pmap_mapfile_name() to get the actual
>> /proc/$pid/map_files/* path.  These magic symlinks can be opened even
>> when their corresponding files are deleted or in an inaccessible
>> filesystem namespace, ensuring we can read the mapping contents
>> reliably.  DTrace already does this to read mappings during USDT probe
>> lookup.
>>
>> Fixes issues with probes in paths like /home when dtprobed
>> is sandboxed by systemd.
>>
>> Tested on both systemd and non-systemd (non-jailed) systems, with USDT
>> programs running out of /tmp, /usr/local and /home.
>>
>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> ---
>>   dtprobed/dtprobed.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
>> index a808586559d96..9a6928055cd13 100644
>> --- a/dtprobed/dtprobed.c
>> +++ b/dtprobed/dtprobed.c
>> @@ -487,7 +487,7 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
>>           fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up 
>> mapping (process dead?)\n",
>>                pid);
>>           goto out;
>> -    } else if ((fn = prf->prf_mapname) == NULL) {
>> +    } else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>>           fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up 
>> mapname (process dead?)\n",
>>                pid);
>>           goto out;
>>
>> base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
