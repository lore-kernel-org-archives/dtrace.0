Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC22652A2
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770150979; cv=fail; b=b2fxvUp9UoauD5SO1GWuZMnQkQ9twJPpp/6PZdlaAD77y0dBLZkYZD3JYvG8X7SSIrRq4cii9YIbq+9FvoQiySXnkYlOH0E+QkjwuSzU/ZP8CEByOPSQwpQ3AIbgVRgiym0/UYyFpI3la/I/S5RgK6o9HGwT/mCMWJJnpV8jd50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770150979; c=relaxed/simple;
	bh=sCrzP9EhoLwenNt5ufs5OrfcTbIZkkXDfLvCROrTbxo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bJ9HXMeV+b3dx1BNsiSlg1SkDOQBdFXWSerODKRGJbCmrmVtBS8wwoasGdinxGS1iC6veSaKXWvKRGv6SROcspJ/lBa8hkbkQc8+SOa3v/T2LpOw+RIfX8CzMOPredflNrvi7ExtaIfHZw3xu1UO9Kv7xL+6MBJ6eJoBKFkOHrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YMcy3vtl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZRAQx/yb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YMcy3vtl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZRAQx/yb"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuIZv157420
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 20:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Dzb6DBaQdPMIStLocoowM6jWWNEiLqcjXlozJcWQU4M=; b=
	YMcy3vtlGHCAClQyhoFlKTSwKqXT7GiTH2/pX9Is/nfIpy9du/C1ZkukDi8BcHz4
	B0YfdFGejIO1ZH4+H6mtDCO8S9jIugz/9qqyfvIW2GR4AG7SvlBYxEOW8vsHHMWL
	o74JB9uj6XeX8/QBopmXKI71z+kmYBTcEU7g/DH/qlu8Nwqq3TtSYOusxg3JuEZ5
	fIZPtcI87aDVItlOvjH/QdaN5Dbo1Szn83EY+pmcGaYLIGPKztft/qsZk1m0/jRj
	b9caARBNl2dcL6aP7xPOfB9xcX1bASyDVsvcQT40a9VgJ5huNwnTT6FcdZD+hmBB
	KnhRHLbQ4v0KCA7Mz0rR1Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c1arkvuj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 20:36:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613JD6kD018649
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 20:36:16 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186mwk2h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 20:36:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzQjmX8HYyPZNRs+4ax56ADDStMH+HkQ9cEt77QZY/he0HFBQlajMjQ4aC0wM+dWdYcXHSewvIMPveQ0qqrpZtrSP62DmGXi77K8F9pZ8XfXADzPG0RaSpy3JOWvW4km4XIEYz2vopUjPF0OT8mnx4B6wPwfRI5RkbwN6KwlrYcGBEIhPgcyReGaflwtyWphsbNSR3y+9aKP7LqZ+JUBXX4Spm8Sz7nir+/8vlPttRg0usKCcISCNa803TjEW1P7SAEYmIoM1jaK1wPiL0sgiNuV/Wgg291B/Mg4d27lKpbyQn4sT72KursgIuLtb1NiRM1/y/+Vd35k3RAZFTlplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dzb6DBaQdPMIStLocoowM6jWWNEiLqcjXlozJcWQU4M=;
 b=oRrEpVbLH8TdXB+8n83EtdGlm6U9RjAzP9gHQpqlg2Gt1AuM+/bB7gvN5zh7f5zkdAdyjS5kj+j3E3j/tGiYjV/jm5Yk7rfR8G/aG2YoJN0yRUCv7oCUq+EZ8QaiP7zVJ6Uqc9jnQ6l+4kuCpE0JB65A7ZiOMcDnXGQnLOfK0XV7DdOQDeBiFBAFYSl6WueKZCVkFAQzwAsBwBQSp9yrKb2VX8DWIGu4brxKZ7NnPopbWnojKZNFaTVA+/JKf/zFA4cHF1GwOq+dOQDA8ADfmaqPL1YgvoaN+hd1q1YxNNhbOqnR0yXGY0r1xFxHx/LNosTBlFGYWiuPnFHASjobwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dzb6DBaQdPMIStLocoowM6jWWNEiLqcjXlozJcWQU4M=;
 b=ZRAQx/ybS3TUUefYXtOLHSyniaZ3j4Gl+xbB6VcHscDXW1XnB+LBI2nWFV3uPwcbLm8cVfMxLkgxicvx3QXZpguj5TrlsBlxD/gAjhl3EAk8M1L//izVQYsGsr+taRCjkLYuFtlZznthnkMza0qaFwjvI94YUQTKoTwju9gZWGU=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BL3PR10MB6260.namprd10.prod.outlook.com (2603:10b6:208:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 20:36:12 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97%5]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 20:36:12 +0000
Message-ID: <1956b996-6eef-0fe4-7140-c656c65e73e9@oracle.com>
Date: Tue, 3 Feb 2026 15:36:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] spec: fix missing attribution of patches
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB75227F1175EC886B4603D47FC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <5f445b9c-ffe9-37df-9e86-a6df962c00a3@oracle.com>
 <aYJTW5t5SSApd39O@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aYJTW5t5SSApd39O@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:510:f::25) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BL3PR10MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c4e196-5c7f-425c-d7bf-08de6363de99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm1uaWo0eWV6QnI4VkJJdlBaUmphdjNYYW5OYU9YWHJNc0RXbExZanJLU3FE?=
 =?utf-8?B?NU1MT2txM1B2NFhwZm5ZQTlQejBOTVprVCtuWjRWOXFJSE9DQ2FaSnlVQ01O?=
 =?utf-8?B?OFdLZURLb2JtNVF3MENzZ2JLSG1tNVhQalBYaWVaMEUvWmlYbkd3SHI3ODAr?=
 =?utf-8?B?cktQZWsxSFpTT3RRVnRqZkdnbW9IMXJTOSt3U1BXNmo1YjhEV3U0clovUmk3?=
 =?utf-8?B?b0hUT29Gdk4vN2FydmlUbHUwcFN2Ykxhem1zaEdPTHdRWTA5SlY4SitydElm?=
 =?utf-8?B?ZU00MnZ4Yys0WWFESUdJQzVlakdKZ2NocnZJMklXVnpqYkhWWk9xZmpMSFEz?=
 =?utf-8?B?Rk9XdDF6aFlJeFhEYytSd01uR0sxcm43d1k5cHkvT1p0YnFkditZUE9sL3VY?=
 =?utf-8?B?Rm1zeTNNdDBvclhqTHFDNFV4dG5iTkxMMThIb1VpczAxTisrM0Rva0NRdVUx?=
 =?utf-8?B?Q05UME1qMHJIU2tXRC85TDdyaG1LL3JCT0g1TS9wSWdzd3dEdUN4dkFheEtK?=
 =?utf-8?B?WHd1T1J0eVFGY0tNZ1FyNzVBVXl3Z2ZhQWwwdFdwa25WZjM3QXR3bXNkN1Ix?=
 =?utf-8?B?dkJRbUoyWS92UUlHSzRsZkFhSFpjRDd1MVFXY3lERUdYUjVmTGdZeHc2dVV4?=
 =?utf-8?B?SzQvWURXa3Zoaml0U1BmYkFnMCtDZWQyeFlnWitmeWlmM2FBdWU5NmI1dEMx?=
 =?utf-8?B?ZWFGWnk4Z3FvbDduaGpvUURDMmZnZXdMVFV5aER1SDdnK2p6TG03MTFCdi9a?=
 =?utf-8?B?VXdpY2l6UTJvbWhlTHJwZjFlajFxbVNwV09vc0I1RS80SnQ1WTNaaFJVdmpP?=
 =?utf-8?B?d0tYS3NqTjMvMWtwYjV6UXArT3NMMnFTeUJLMUZYV0ZIVGsxck9NY01sd0pN?=
 =?utf-8?B?V25xeUg5SlRic0cvOHc1SW5lblZtcFBzZ0FqZDFadzN0YkxETWxJZVhEbWc2?=
 =?utf-8?B?WEFmbXorVENkT3p0YzZWcjhnRmxxc2IrVWNkbWloZUJlSml1bzVuSmdiRkNz?=
 =?utf-8?B?UnFaQkhiaFM1a2pveVk4cHMzVmNCODhucXRVbUkyRG0vOVJ5dFhxU1dTMnlL?=
 =?utf-8?B?OUR6ays1dzNOaGk4RVUxZHBtNERmT0ZqNXZJVEp5UEZaWEE5SENoZUhqT2dL?=
 =?utf-8?B?YllFRTRwaUx5aGQ2cnVTTGppTVVZOTRtSi9NV2lDak5HNTRiWkNNZ1RsQTlF?=
 =?utf-8?B?RmVXQWl0ZUxPMmdzYlVyRUlFRHh0YUxQbzN6VDZQTTRFcldoRnJSOHBJeVB3?=
 =?utf-8?B?cWF1MURqZGJUWjRvWndTRm9ranQwdW9WcTAxTWFucjBqZjcvU0lJVFA0WWg4?=
 =?utf-8?B?MDhsQzN4ZVdyTHIxKzV5MUpxU2hUeGl6L2w5ZWtuMzg0N3kwcld0WG9sd2hz?=
 =?utf-8?B?SFBTMTJBd0JKT1J0cXpMRDNOSFBPQXdHRmlsU0VpZHFadkpmWHBkMU51L3dJ?=
 =?utf-8?B?WDRRZkxhbHUrM21zOGRSa2JOcVFueDdYQzFaaVN6b2dKWXQvVm1vU1ZrSXB2?=
 =?utf-8?B?ZExLblY0Qjl6T1I5MlVRRlJYdUtLb1FKZ1RuMkJtWm1SSGd3ckdjMVA2STVV?=
 =?utf-8?B?OTU1TUdMZ1oyaXBmMkRBamd5d2RNVE9sMDJmbm51SVNXUEJ6SEZDZ0tySzhM?=
 =?utf-8?B?L25tME0zUkJFdEFyTlJMMUhZYTA3VTVmdnVUeWxKa2kyVVE0bGRXNXgwYXlL?=
 =?utf-8?B?VUE0WGtsQ3Q4WGRsbFpma0VXMUtBeUk3L1FPUlFVSmVFcy9qdnNrMUdZRkZq?=
 =?utf-8?B?Nm9vVWxhRHNwWi9LSFB2aUFZSUNaREZUOW9XV0VyUVo3V05RMHZTMWdSb2M3?=
 =?utf-8?B?Yi9yeHFyV2JyNFRWNUVkdzhOQ0JqYkxlWFV1Um15VzI4TVB5SWxPSzRsSGdh?=
 =?utf-8?B?NElUb21aMVZkbW03UlovRXhSWVNEdWZkOVhzc05QNFR1WU15YkExUitVNUkx?=
 =?utf-8?B?R25FWnlvdnl5VStURGRHUk9GbzRnSitWeUx3aktaWURlZ3dqZWJNeDZuY2F2?=
 =?utf-8?B?dVdmaG92ZGpWcDJJM05xRTdNSHZpZTZzL1ZXdndZQktuVG00NTg2UUw4TmJK?=
 =?utf-8?B?OXRUd0xSSDZEdWh2UXY1djcrVWtNOTJlTWdOVnFaYkI5UTlmcXlxRXQrTzNL?=
 =?utf-8?Q?P2lE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1R5Q2VEL0k5UUZ3YVhhQ0tmOVNwVFJKQ1R5bFRiMksza3BwQ1FVV1dkOXZy?=
 =?utf-8?B?VGFsSTgvVHlkT1Rkdjhhc1RDVW42d0FxR1Z1VmcySENQR2d6RHlpdENTUG1L?=
 =?utf-8?B?eFI2Tnk3a1VMdnR6dFZTL0tKUEdGeHExbFN5UGd1TkFsRkRZUEhxNm42Z2VB?=
 =?utf-8?B?VE9JUlA3Y0Y2K21BUGZmdVlSSWk1ajlQNjB2RTRpT2pVRURxb0V6bTVId3Rm?=
 =?utf-8?B?aTQvVlJGcmdPYWk1anFBcnVpY0FLaGJqdkpCK3hRaTFtaXhJZU1VUjVNSU1H?=
 =?utf-8?B?SXlsMWEyZVIrc0JjaWZ1SDBWRGNPVkdZeWhZcUtEL29GMmtqTGtUY29FRUlN?=
 =?utf-8?B?dmRaVThWVnVUdUNxV1ozcm5uUFJJVXYvTmw2R0oyVk5PemFSVlovbmk5V3Bs?=
 =?utf-8?B?RC9TTWN3WER2bXI1YXhWclRxcEZzMGM1WDJnWSt1bXQ3MG8ra0V3djdhWnFI?=
 =?utf-8?B?KzFhUC85RjJ0VE1jQTFtUFF4QmM3NS9pMXhzd3hpSk1JY1lHU1BqVTg2RGx4?=
 =?utf-8?B?Z3ovNEF4NEpPczlSSWRkQUZUSFE5RndIVDA5enlUS0h6bUpBVWNVY3JaUFVU?=
 =?utf-8?B?QndnalgrWUwrcnIyS01idHcrOFpqdjJrUjBkakl6cjVxWWJsQld0dTEyWkh3?=
 =?utf-8?B?Sk0xTTN4VVhNNXFHTUVpUHVaVzI3bStlSlNra3E3K0syLzkzNDkzUllRcnl4?=
 =?utf-8?B?Y3NJb2hyM055UTUxbFlPTlNBRGxGTTRKN280OTZPWXZrYm0rQ01BOFVmaUxS?=
 =?utf-8?B?YlV3dzVWTGdCSDVzSDVXajcwZUxtRXJqM2dVejNhVEhNUEllMHo4cU1vVjE2?=
 =?utf-8?B?akpVdkhtaWUrcGhoY3RlbGhPMTNpR2krYjZjdlVaYm5zd1QrWXAyN3d4c3ZX?=
 =?utf-8?B?TzNON0hnKzJIRXY4Z2NPUmVER295UEtxSW0reEh3V0FCVUMyL0FTT3pLZkxn?=
 =?utf-8?B?RjlwSjhWblY0Vzl0eFlYd25rSExTcG90UDlweXVoRnBRdkEvdS9CN2NvZXFh?=
 =?utf-8?B?UGdvN3pNK2RWeFMvNXBpY3BlSFArL0JONEFYR29ENDdVR3I4UzhzNld1N1hu?=
 =?utf-8?B?anh4KzJmdHd0bzRCbS8zbW9VMHIvNXNmRmVmeWpmUEI2UnBxRG5LVnBnUGZT?=
 =?utf-8?B?bVdBRFdvVWRwQVoyaWhYZ3RPWTlEcnZ6Q0NvcXVqUTlLUS9rQ0ZmWUJSaVcv?=
 =?utf-8?B?V1N0M2wyUFY3d3hodG5WZENrWUVXUHFGc2tiMUhoaFlqS3FzbXV0MXlid2FV?=
 =?utf-8?B?ZzhueS9MMC9acjFBeVhQNmZha2t3MVR2Sk1FcjYvc1VYUjJLcG00YVEybG51?=
 =?utf-8?B?R2NOekIrV3pwUDVYYXhvQis1bGcyL3M3S0FzNlRWQ0l3UDBBaG0zVzNobmNl?=
 =?utf-8?B?VWswb2xFaTNGS3o3WitwbHhheVBPUkd6RTJVdDJNRnd5UFp0ZkNqNGdNODI5?=
 =?utf-8?B?bjlLdE51NHhJZEpNUFhYZWFub1FRUEh0RGtqSktBbEliR1QraFZoNStaSkR1?=
 =?utf-8?B?eVhxanUveXdFU2d0QkdJVFNIZlAvNmNTVWZxOWllSG5PQ3RqTSttZmVVSXY2?=
 =?utf-8?B?VWl2aVFKUGxCYmRDVkR0QlczQXNQam94cVNtMjdhR2hKK1pGdlJ6bGhXb3BH?=
 =?utf-8?B?cXpJek9tSklSOHJkS2NxSmx6anp3aUFOM05GMEV5VHhaazlUdlFlTlBwTGw5?=
 =?utf-8?B?bS9WOTAyLzdqR3gxMnpPeWJBL0NJZ21RSktpSHFRd2NaWW1UNWVpZXNPSUhB?=
 =?utf-8?B?RFFPOVh0RVhpMTdlRDFOSXlVdGFnN3BZZkNZa1g4dVpBbnpHOCs4WERMRlVZ?=
 =?utf-8?B?Umhxb0I1a1BHMDVNb2lCNlpPbmNycjZoWXVhN1BTUjc0RVZwaDVONmtyaWlK?=
 =?utf-8?B?M3ZodmhYMGdqQ2JNcTFnY1R4NGtELzB4cHdleHhEbGFzYWc2Q3ErTkNPUmtZ?=
 =?utf-8?B?MjllVUpDYVY5cDlIVXpNWkpjYWtrQUIxVy9qaFR0endwOG96cE5sejBaMFA0?=
 =?utf-8?B?ZC8yT2lrWC9kVlNiYXVTVmZUV2RYcmFGbE9KNzAxVW9ITFoyWnBncjc0WWMx?=
 =?utf-8?B?RE5wMmVFNDZmUmFOdnVXVDhtMzcraFR1TDA4T1NhNkppcmJEY3hLa3VmV3Zu?=
 =?utf-8?B?alRFSCszaVY3U0NuRXprbjBOTW1PUHNVd1BOZEpSbW1EWGl6SVhTbVhEYUh3?=
 =?utf-8?B?RHNxRW40S3NXZFVSbFRTWWtpbXoxdVVFaTNCYWZOVEF0eUxCVlBqR2xKaGZS?=
 =?utf-8?B?MG1sZ0htK0ZmNzVQQkhIM0NkKzlrS3pWSGN0aFV3THVEV2RoYlU5Vm0wTHlz?=
 =?utf-8?B?THFmVDh6Z0dkZmlxRFBtUzhVVVMxd3h6SFo0YW9vMmhxelJxaDM0dz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uymEK4Qai5J6N4/s6zzJxS1UkPSpHaNCvLnBKqmsjm3QRelSq85gF7nonq9Ci7szc1Vv0wKR4PQ9eziCKC9WSNatxBbdr10ZVc2rlhZAdPHHm/jOzavFJmaLhgVDzY4970hD0H+xymacQ2eeHx6kPdcXlbi8LGYfyODQwg+8w5bI8WHGo2b76bo5k2twluutmIqvjslx1eVBoxBTB1DzZdsXYClHATGWf3XSx8iNqiulFII3RFT5tjy2Zn8OF4YUI1mXk7Uox0thm2uORE7WhO9TTN/HZ0GcPkHSW0WBPbn8YSPEEPy/GA5jJW5BEpTtTSQQS4dzjV4DZwH8QBIqphS1sILEGW//39sjSASY44wTcI/FRrfyQQEK6iPFQqvcxI620StV17s2ohuUZbYppL+TIRGcB7PpdJRdIcQ2lfbHy27E7iq3gRw22ZgnibYbRY0/YeXUz0GMHDzwSse8AfyZmMdMESN6bOtTz+1qwc4/oLOVuT8mwaT4d5QswBbDFZnQZpf6ycc2+/0Y3GLyzk/PN/ROJdibuJ0PJUz2t8iACmisEW9rU7CjEwMF4ZnTfOHtgjt+H9SjWJOO2/4RO9202UTQcZB+3Y+xEUqY7Sg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c4e196-5c7f-425c-d7bf-08de6363de99
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:36:12.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yjPGydqdvWYmtTo8JjhXk/RN0HSd+udL8kLce2J3+0E+ek4NIx+3nnxj/hFRdhMzcSTf/eeo28sgGukfN8zaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6260
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602030163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2MyBTYWx0ZWRfXyLlCBudkcBad
 /OY6HCUMLZhCDJkUgiLbj6IxPnRlfyd/s4ccKqT4V+1MkYR7xn9X+68vqvr58Gp+tgRY5V8p1B/
 FBTzWzgOfrCqyJxAjmARl/VvW6BDJu4NtX8lyIR4iC7S9XIK8fw9saAvfy8jRdLgeRz5tcz2Zea
 VYwoN9Hb11Gmi6rnL0j6SBHGRHv4Uk9W0JsnWKPb6f07ijhwoBEhooyOZk9TbiiLF2lUJAGzSqJ
 US8wuV5FG3jymRNpmXcxzeZhn5xXmWY38+BQ07+D+Ou/ASmW1ivJbTwq3bY58pNU4XYDMMfsFxB
 1Ydd00dSiQy0sI5ggr3hIiqvBKCxZ7DO07JKVJVpW/gIsURmdKh15R+RVo3rSInHglREyjnfvO2
 gRO5MRTyNQv1XB5ShLGYxi1YNOklpzegYPeDIzDNWe4TmDSnS8IwZ/vb1j+VGoaM+RsHAoZfXCZ
 t/swG1cGeVbg2j2zmEcvraYWoHh31qDkQarNt5DE=
X-Proofpoint-ORIG-GUID: rUFyjdEaeubHX08ftAHg7BmFLbpOtahD
X-Proofpoint-GUID: rUFyjdEaeubHX08ftAHg7BmFLbpOtahD
X-Authority-Analysis: v=2.4 cv=VfL6/Vp9 c=1 sm=1 tr=0 ts=69825c41 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XIseQdkzD9C8fd1sNDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12103

On 2/3/26 14:58, Kris Van Hees wrote:

> On Tue, Feb 03, 2026 at 01:38:38PM -0500, Eugene Loh wrote:
>> Oops, my fault.  Thanks (and sorry).
>   
> The convention has been that the entries for anyone other than the person
> writing the changelog get an attribution.  So, those who do not have any
> attribution, are owned by the person writing the changelog.

Interesting.  Okay.  How about adding this one:

>> But why are only three items fixed?  Presumably, the other items should be:
>>
>> - Test suite weakly pulls in kernel-uek-tools to get perf.
>>    (Nick Alcock) [Orabug: 38064413]
