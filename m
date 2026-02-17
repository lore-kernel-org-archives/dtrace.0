Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FD1684B0
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356991; cv=fail; b=Sx6ZZNWTYoV4Ld1luo2VmQc8Uh0IHhXbln3/NNk2kI27zWxFHKP3AocpWRLVG97KatLoijv8yswHbJja3Sbot07c2QEBntWwVe9uMyRtWPpyJBLv3g+R7kh3s68f2LsFGu/SwrnIjtQR+5MF6Vr5vgwhNg64AOn45xNhpKgDkX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356991; c=relaxed/simple;
	bh=6Fg115+8QAabxfQCA656CxCYyuXIe+rMF6o06lTSkK8=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cq4PEBUmO3xwLA2OCjcfCUWTNvTkkqzLO8E8VVM4oo6bBvd3VQNE8DI5fsCxVH7ljekZgIjZlsa5Ry9cM/98PTOEiKiQHss6SzLKSn5yE04FaO63xuohhNFUYi/o+3Oy/7Z4o1l9a4cOyLm9p07GMwoFExBpK0JJlB+u0Bz1Wuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OFdMbxgY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JA5OpFjb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OFdMbxgY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JA5OpFjb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNMJU3675560
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KVHfaomPBprWY1R42CasSpGlXobwOJV7cW1Dz18Z68A=; b=
	OFdMbxgYcCw5g3vOd53rndaSgKVAJ6MoYEmQnJzWt5MzZo9Yca1IvuFZgKHtGWI0
	KTwXf+OUrcJwWZ65V05Hu/xT8b3albZg8s4Lr6pJ+ErygEInzLmriOqcVsm3AMXN
	D43qEUdmGtnxyyy/AoiW3N6lOUX+ULEIok1W4DMRhNHGJIiQONJEBNsUeOn5pW97
	Cwpbwe68IntKgBj56HqmSPnYRkagAJziY9h8edfR3XjTVSKAUFFzh2NdMtIjiwPr
	e2aCGPD5oKBrJUna18rcv4ZkakqvZ400DR0rcZFXFKNUtKjopFpwT9ati00IT+XJ
	+NIXXmhWT7+u0NF0Z3NUSg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0avaqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:36:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HI8hAK010013
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:36:27 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013057.outbound.protection.outlook.com [40.107.201.57])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb295aaa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyUJlmJGUYyXKdQxhc708pwL1akpyAfExmUtz+u3iNX1Yb4MjHKP0M/pYui3kZLMqdJA9lbEpkcBplkLcM/xhbY+skj4fkO7RaV/KvWt7dfa6VX3G1yKtkJpGCclNkJXBCnerltqzyTG7cZRzEGO8REcF5z4bPcGoCx4Vz5FSAw0PvqrRg6z5a2PF6zuwGc9ZfboeY6Q9tM24ZGc4sWVlr684fCT3D7rgIQt8SQhrsbkw0vBTSNEkufu178Dg7gEcZuHLNgbGVTmpXf16UtOBgHy3OwsGM7FQQXh1Ip/YdrIYRTOOwkSZBPWbaamawpjbsEJpG7TTjWeDLYeSBY4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVHfaomPBprWY1R42CasSpGlXobwOJV7cW1Dz18Z68A=;
 b=wT8gEAbtMxDEGzXLItQLMl4e/Fw24UjseFrs43ex73lkc2iVv3YK6Wg6qfGBqT89QKqZWZc3TcEI8zyI/Zy4uz+asuLkjVNmy+DJYRmPXQWqP9TwrHufvHXLwox86TTv5cSBUtMcpWC10LvRUtWMpAS+53bszPi+C1ChYgWMY3toofZ8V247Fk/Q+Ihg7j/BeoZdgAqtTuZphffPwuUhldGn52Uzi7SEQeucC4pjRZraq95YPGSorSvBp42e5SY1SJwo6jDVMNrQ93zt6j59dnMfawa1b3iCXrRtzqkgmjFz8PJTkgvwFcb9yHPcQIEoGQsGVq7EVLsUExkCvhzeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVHfaomPBprWY1R42CasSpGlXobwOJV7cW1Dz18Z68A=;
 b=JA5OpFjb9j1zlPAQP1+QSWCa1WUXcnWdZ9DFErBAk1bBAJ7ww4x7BlARyYk432sTaaS4zXefVRM759u0OGidcBmjP+rQtXbpwDo9Fac7AJgGvg3+8xkCBaxb0PYTo0PLYHibhdiYh+XEx/yjhzpxVA6kXcGxqxqjC0N+JiDH6n0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6111.namprd10.prod.outlook.com (2603:10b6:8:bf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Tue, 17 Feb 2026 19:36:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 19:36:25 +0000
Message-ID: <0ab52c29-191b-10d7-8fe8-21ba28f807ff@oracle.com>
Date: Tue, 17 Feb 2026 14:36:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] usdt: enforce provider name size limit
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522C161F2C7C0F342DE99BAC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <a756f0fe-2496-6964-6d16-97fd707e0c1c@oracle.com>
In-Reply-To: <a756f0fe-2496-6964-6d16-97fd707e0c1c@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c4ea6a-6f1d-495c-5c1a-08de6e5bd64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0todVB5UFRwcHFaLzlhQTZRQUxwVTBDNU0yV016SUx4RXZ2d1BDMlhEMXc0?=
 =?utf-8?B?UzhDMW5uekY2cVF3MDlLd3BZMXlRaDdCSUtyS2t1d3NsdHJGNng0MXoxdk1H?=
 =?utf-8?B?V1JhZkJEMDhEMUVXWFhEaHlOZG9FMjhjdEFMM1VhRTZxdlNxMEVSNTh5TE1y?=
 =?utf-8?B?TVZCdnJFNERSdEdXcWdKS3hwdCsvNVNMQmVuKy85UGNYc0hzbnQ1UWRwdHQ5?=
 =?utf-8?B?c2oveEdNdks1K2Q1cG5WMXFYOEl3MUQwVmlPZHRBR0tUTzVZUlpaa1RYcXUv?=
 =?utf-8?B?K1owaXhodjlhUjNTYjcwSzdjRjRkN3ZYZ3ZCazUvUXhYN0kycCtCdHJrWVRX?=
 =?utf-8?B?VDYwZUFPcDBBZXVUS0hSRmtPOTE3c1JKclVyeDdDMEgrd2NORkZOOWpia0Rv?=
 =?utf-8?B?OFg4SnJiSFBJdUpVL01JYStDOWJzSkRYb2lOZVZUSkk3cVhrTHZIYkJBZ0xh?=
 =?utf-8?B?VGdNV2pFK2JIVGpuUG4ySjdtNWlHYmhHUHpydXFxRUdLVzczbjVGaFNDT3E2?=
 =?utf-8?B?MFh3aGdXMWhHcGxDZVA4THVtT24vRFd0NnBtZmpwZ29kNk9NaERjV29VdDA4?=
 =?utf-8?B?R3FxMHZuTjJYdmhwS1ZtTzZpUGFmc2xrZk1ObnhsWU5ZeVRSbkV1MDZJNTRn?=
 =?utf-8?B?b1FaNFJDZGdqZUZmY2xkc3JrMFBUaGJhcG1vSW9nYVE2ZHJ1WCt5emJqNHZ4?=
 =?utf-8?B?TGd5QUVjcXpJNGo0L3ZlbVAraEtWd3NRRTdKQ3pRR3dhTlNpWDV1ZVZ4UUtY?=
 =?utf-8?B?Z24zYld4RWVSWlBacTl1U3JZeXhuUE9udVBCeVhRY2JDUm9VQ3JHQWlaZVhn?=
 =?utf-8?B?MUlybHpZRWpiMzN5L3hTdUxDYjZ6THVpaHgwcUNUVWZXUUYrR3lPOW52ZGFV?=
 =?utf-8?B?cmYzSFc2R0RWdmFQa3JHVnVncFNRbWxKSkVDd1c0aVBlT21MSmZSSkxZdWx2?=
 =?utf-8?B?UzRGQjZOYm1YYS9ZYS96YjdiaWk1RjZFRTRyUzJsNmtaQUJKVUVXOGtLek1H?=
 =?utf-8?B?NEdJSVdPd0FqTXVyRGdiYXN3UEptb0d2c1lHa1F2MTh6cDRXeW1HT2xsV3pK?=
 =?utf-8?B?VTVScTB0SXhtenZBNW5yNXkwcEpoMGlJRnFrdUl0eXhHOXRQSFZCd3ZDQlI1?=
 =?utf-8?B?eFlzSWMwNTQwR0JCeDJubDJrc0tSYXpWWnpxQmR5SDRqZFFQWGt1eld3N0Js?=
 =?utf-8?B?Tk5RVmt2dEM1SWNrajhNeGlBejJBa2RwSDFvMi9rNU84RjZUVm5JT1JHeTNv?=
 =?utf-8?B?WSt0c1lNU09FY3NIR0ZiNnZsT3FWVkFlUTdtL1g1a1JqaGZYdFF4d3p2VnR0?=
 =?utf-8?B?MXgzNnZRbEtXTUF1U1NpR3RaN3F4c2EvYkhSZTBETVJhcnloM2pPOVNDek80?=
 =?utf-8?B?M2pEVS9vU0ZNY2NmdmZNOUR4eEI0ZXZVbGZBdHI5Ynl0TGd0RHFxNmpHUEcr?=
 =?utf-8?B?T2RNYUswTXdwdDhXcUsvNDNRbitOU1l5K0V1dml0L3BrNVNCYUorR1FDb2dK?=
 =?utf-8?B?R2FYeTgwNEQ2d2Vlek1NR25xVEdraWJvZnZPWjdwcmV4OUg0akV0KzFYcVdK?=
 =?utf-8?B?UDJlMjFlYnY4Zm51TXF4b2tOOWVVZDU0SHhBZHd5aWl0eDZoeko3dVZYUjFZ?=
 =?utf-8?B?eElEcXF4Q3Q4Nkl5Q1BQVzdLd0dDWEdxRkw0b0pPSnlHZkIxdThFMWIvUUVl?=
 =?utf-8?B?MTdST1NyN3J0eURYSXBtMndGM0RZa25mTkRIb05CZHMwR1M5bTU0RTZ1Qjhy?=
 =?utf-8?B?UkM5MFUzRXJSdDIxV2RyUFNQa3p2UkVZR3J0ZnN5KzFIZVM0U3pEbmZ5eU0z?=
 =?utf-8?B?Y2R6RG5kMWVmMEMzczJLSW1lV3cyY0FKN3BPVlRKSU9taEhqNFFlM29zd05U?=
 =?utf-8?B?bzNDTVUyRkxqRC9ja0tvYVdlYjFMOVRGTFpxVithejQ1K1NXZTB2ZmV3aDdt?=
 =?utf-8?B?TjljNUNpaGZ2MjE1VncxbnYxZWh4UE91eDRFOEpOYXA1ek1zNXpGekVVbk91?=
 =?utf-8?B?bVY5b3RYK0tKSW9EdjJDSlo2cWoyK01idlVpOUh1NU9vYVZVaGFha3FKWWFB?=
 =?utf-8?B?aUkxRXRRdWFXajJDTXdaTmtWMkU4L21mbmFFUXRpRUsybEV5Q0NjYkhkUWN4?=
 =?utf-8?Q?qRrM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2N1REhTUmptL1RjSHM2eXBzQ1JhclpwNDVwdlh4RTJyN1FPZ0Jub2ZVbXpZ?=
 =?utf-8?B?dU4xRWNwWklxQ3ZtK242ZDRyaE94dlNOT2JVckdIVkxwYmZxcFJUaUJQSFBE?=
 =?utf-8?B?dVNDY2hNdGNtNmhMbEVNZ3o0OUVPa3dpMU5CampxdCt3cGx5S253REJ1eEpr?=
 =?utf-8?B?NkUvTjFPT1NReHdXK2pNemJpaFBCc2lCeUZvOWI5YzBUalFzMXRMQVpvOFlH?=
 =?utf-8?B?Ny90T2hYSFdHdDVxSW8wbFNTU1F2VVpFVk93UnhTYVRFTDQydGo5N3pWTmI0?=
 =?utf-8?B?SWJ2aGJUSDZ6QXIxVkN6UVJ1MitnR2UwdHYvQ3dQWERvcFNhTjUwS2hHZDBS?=
 =?utf-8?B?RVY5endUSDBWempLU2dBMEp3b3M2UGZYL0VBM0xSVEp4R3c0VHJ5aEMxeEsw?=
 =?utf-8?B?Rjk0MDBGbnAveCtac1Njb2xlQlVjUVFYTjY5aHlScFJBSUpGNEUvVUM5OTFs?=
 =?utf-8?B?NGZDcWc3MWVzSGZWR0NZTENmWitjRnpLaEFjVDZHZjZrMm8yWngxYnJRYWRC?=
 =?utf-8?B?U2pVYXBOWkc3QkVOS3BubGZDOFVpazNNTEttQ2NacWZxd1F4czI2MURRNmtw?=
 =?utf-8?B?UnhYendVTEhBcGVKenR3RlhYdkMwUGhkbmVteDdUZTcvdkZ3YkVmeG5IeFhj?=
 =?utf-8?B?TERwMWJySW0wSmZpMkZGMTdDSERWaklDaC9HMk5nVHBDbW5UeENqWUpuczRt?=
 =?utf-8?B?WGorUmp3V3Y4Q1B4WWNoZ2ZUeTRqUjd2RE5pWGdJWjJpcFA3WU54YldnK2Jl?=
 =?utf-8?B?Tm5ub0pjM2N5YUNZNCtIMERTbisrY2xMT1hpZXRBbFpuaXNuYWpiRFZNVVpx?=
 =?utf-8?B?Ri9kV1VldStNa0hWSjNsY2dtZWFpS09xdjZOamNlRGFqbmNnUlhmMHdYUlZj?=
 =?utf-8?B?dm54RXNCa3A5bFpWTGVERi84TVE4UFQydGsySEZUSW5BeTlaZ0xPb2NDOERB?=
 =?utf-8?B?L2ZlS2tmM2xFUE5zdzVKd0EraVNnY2VUWTRoYWZPVmRoVkVua0txM3d2WlN2?=
 =?utf-8?B?aTI0Tms1MG4vZ3kyVXR4UDlrMXU1ays5QmZ6b0tsb2JMM2ltVUFFUGJ1OUY0?=
 =?utf-8?B?cmFOZjBFT3JnMlBFWmxyZzREajRZRHg2SWpaS2s4ekJnVnd6MitYaXhTdG5z?=
 =?utf-8?B?QUt5Z0k5QlVKbUZTWG1jOUU4Mlhwajd6NzJpNkhIVXNGdzdwYlc0ZWUyMHUw?=
 =?utf-8?B?L08vMzkzYlMyTGR5WnR1TlJkOXgzSm5YTlNubkwvSmQ5VFRucXE2ODBsaEEx?=
 =?utf-8?B?Mk1FS0R2NGNhb1kwUEtHazJQWkFtUGxiMVl0VTk0cHB0QnA1V0RJZ1oybFN1?=
 =?utf-8?B?bGxpSTdFQWNuVElRdFAxMFpFdjFCYzllSnlzYTZCQm1ERE54TXVjNUNKajdS?=
 =?utf-8?B?YnZnOHVva1lyaEpSS2cwN1hBc2E5ZkFvYWI2SEF3VDNJMll4cVNBcFRUeTFB?=
 =?utf-8?B?YnB4QWZRd0xyeW1TcFVvZ3VJQmhDVDRaSzJIVnJ0SXBwVWFOL2pCTUdWbHlk?=
 =?utf-8?B?NnBielRxRW5YenN5c2ptWVlpTmxyQU16WnVkWU5BYWMzUTVsNWRhMTRyMDFY?=
 =?utf-8?B?SExKSnEveTBZZytEN3VWMjIxS0p2b3d0Z2lFY3R2dHNaMXNvWGxsVFdXTTNU?=
 =?utf-8?B?S0EwaExIZU85emZhRWVaM0VEV1V5NlJ6MkxhcVdNMVBJMjNsQmRCWkNpc3hI?=
 =?utf-8?B?VzFkQjNwWWkrdXY3OFFSalU4bTVmb1VXejZSdmxRUzlZcUVKSnF2ZERmd2xR?=
 =?utf-8?B?bWZzMnhENStDamhiQm9WZlIxY1VSbTVrTnZ1azYrZ2xVZlE3WTFubGJzd0RK?=
 =?utf-8?B?dEtCSXR1S3A1L0hEYTJ4NUxsRjBWay9GeU1LTFZaSFZMUW8yTWllaFYwRkNk?=
 =?utf-8?B?bzB6QlNpLzAydFBHVEZJOERhekxzbzhpY1VLVk5uTk9VbktWNDNMeXptd2E0?=
 =?utf-8?B?ZkM4bWlsR1NlZi80bG10aU81cHVlSFBRTitRa0JKOWdVcE9mM3BIeFREeUFQ?=
 =?utf-8?B?NjJsLzdHdG5YVmNDTUNta3ZNL0ZSanR1Qmpsd2JleEpSUm1Wc2kvbVZvMXNW?=
 =?utf-8?B?RWxXWVQwdkxxU3ZjbVR1VjNvUEdOYk9GWFIwNW9lYkRZektjYnUvVmJaRHFR?=
 =?utf-8?B?QTdFUmtYUkhXTnF5TVFwMTR5OU43UHlJOHpPT2R2L2d6a0hQbnJhTjBxTEJw?=
 =?utf-8?B?MDlMU1BTNTB4Wk5QYWlNWTFHVXpLZ21nSjlEbWdnYXg1bElkWE5JUXpPd0tV?=
 =?utf-8?B?NVpicEpMaUEydU8yS0RBbHRyQVBKajh0cmtRZDlobkVxbVphRjVZODZGVUV6?=
 =?utf-8?B?OHhMWmJOZ2M5aEZJOVM2YXRPVXNNcDhTSUpoUlRJQTNHVXhOeWtRZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	crnkV4HrM6GnjrwOPYNRVeMTXUqWa4+sYldVnfEUVxgpFDYBjbhwIRNp35bbg46bIJt3js++rqTqGm1IWar1aUjLwzCYxBXK7mJAUfNYxtr1RadquBJeRF8SE3qCwJyurGyV1x5fjS8oob6eeWXKqIVT1mFO5KwOMAtd0Rfw7JC6F5jQC67P2DuIFt+ozPPAqJ/pyyFeaLk4W+FWFieUgfca8K82MKlzChNPeRYpLmHg+r0ktaWjfIxLg1ziLcHmSaeGeoMyuNdwVYaeD6nIKItCSOrc29Nm/QP0fNA0THFZdBP3W30fyL8a2PMJ1skKW8ArghWcNktZaH8ZTqcL9qDHNA+m7Y/9KooQSKa3jEdra55VuGUqp4GdQBVeUe9SMqIkKO3Hgp60Dm6AnMgylx9/upstlq2yiyCUUzh/8Amm7VkG1aHHmP/ePMl1by5HuBmLEhlHnQySZyXoRM9CgWgDj+Qa3o2+K98sL3Iorgk6Ez88dWbu7Cofs8BDCugs21Sr3lxsO/7V8rVj8iF7NJx15mnK/VvMV4e4jpU5fkLcIrGPwC+qIfHBc2NVMkkXybuy4i69i8a74LejiGSfUcmGKDeFMXCJKipj20vDINQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c4ea6a-6f1d-495c-5c1a-08de6e5bd64e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 19:36:25.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1j5Qf5VySU+W61i2G0PzH58zIBL6/sRrrfd0ki52Tboo/bxbxw9dKjuiV3K9SI8K9R5UFMwd1OiQs9SJeoABHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170160
X-Proofpoint-GUID: p65LKnk_YDqMQdn1K2MxyNjB8ft5Ejnc
X-Proofpoint-ORIG-GUID: p65LKnk_YDqMQdn1K2MxyNjB8ft5Ejnc
X-Authority-Analysis: v=2.4 cv=UsVu9uwB c=1 sm=1 tr=0 ts=6994c33c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=1Wy3KRD6Wr806Ui-8ZIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13801
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE2MCBTYWx0ZWRfXyDbpV3Tp5ECC
 mLe50fqwM5bRkT8afCpebJddDxF2wjHnRMMWisrDk8gXt60rHJCQ9nugTyy16ePn9HOwF80xYzy
 uZcRMSF/bttYP3NIDeQgLMTMOA+McJ2YFXjnRtqV5GsBjimSyNnNTiy7WbDfzAkMQ+bfOwlCHyx
 kPzKWewmtKzcL0v56Rhs3rwT34Pi05dRWG4S8IHX+gPoMsdJE73hhtdxTipT10bFb2THBZe+b8y
 QvghYXGlwnswNJirKF/qIX6OiBgcQqOarBJ1ZtoU+pKtmm8rrQZBpRGspUsUaw4kxZxD4nKUg8n
 m3greZIyOWzaGlva6bt+JeYoJMMSnwHVVZ2v0eK8vG0b0UnDxEIxVynaY6+BuMwzHfXvZ3MLHxt
 zhXoo4T1R2I/mwBJC2HQB++kSrYkbrQ3mGOHSAN0V3uokoG8Pqo8f8vftiuuC5VEYXe2DNTY2dj
 XrtDylszSYi1qgXkQK/n/B7qnfXnRnCX0NaYi/hw=

Just going through the rest of the patch:

*)  Stylistically, in note_add_provider(), instead of having "- 10 - 1" 
in one place and "-11" in another, how about sitting to one form.

*)  In the commit message, maybe add:  "Also, add error handling for 
note_add_version() and note_add_utsname() while we are at it."  Or 
something like that.  Just a head nod to the fact that some of the 
changes are incidental to the patch.

On 2/17/26 14:21, Eugene Loh wrote:
> I'd like to understand this patch better.  In particular, in what 
> sense can a PID take up to 10 chars?  What if it isn't that wide? If 
> by coincidence all my PIDs just happen to be narrower, why must my 
> provider name make space for a PID I'll never see.  IIUC, a PID will 
> "typically" (whatever that means) not exceed 32768, well, or maybe 
> 4194304.  So I might even be guaranteed that my PIDs will be shorter 
> than 10 chars.
>
> On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:
>> Since USDT provider names have a PID appended to them, the base provider
>> name cannot be longer than 53 characters (PID can take up to 10 chars).
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   libdtrace/dt_link.c                     | 24 ++++++++++++---
>>   test/unittest/usdt/err.prov-too-long.r  |  3 ++
>>   test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
>>   3 files changed, 63 insertions(+), 5 deletions(-)
>>   create mode 100644 test/unittest/usdt/err.prov-too-long.r
>>   create mode 100755 test/unittest/usdt/err.prov-too-long.sh
>>
>> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
>> index ffa16d9a..e77f06f7 100644
>> --- a/libdtrace/dt_link.c
>> +++ b/libdtrace/dt_link.c
>> @@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt, 
>> dt_provider_t *pvp)
>>       usdt->base = ALIGN(usdt->base + usdt->size, 4);
>>       usdt->size = 0;
>>   +    /* Ensure there is enough space in the provider name for the 
>> PID. */
>>       len = strlen(pvp->desc.dtvd_name);
>> +    if (len > DTRACE_PROVNAMELEN - 10 - 1)
>> +        return dt_link_error(usdt->dtp, NULL, -1,
>> +                     "USDT provider name may not exceed %d "
>> +                     "characters: %s\n",
>> +                     DTRACE_PROVNAMELEN - 11,
>> +                     pvp->desc.dtvd_name);
>> +
>>       sz = PROV_NOTE_HEADSZ +
>>            ALIGN(len + 1, 4) +    /* provider name */
>>            6 * sizeof(uint32_t);    /* stability attributes */
>> @@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t 
>> *pgp, int fd, uint_t flags)
>>       shdr->sh_addralign = sizeof(char);
>>         /* Add the provider definitions. */
>> -    while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
>> -        note_add_provider(usdt, pvp);
>> +    while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
>> +        if (note_add_provider(usdt, pvp) == -1)
>> +            goto fail;
>> +    }
>>         if (!(flags & DTRACE_D_STRIP)) {
>> -        note_add_version(usdt);
>> -        note_add_utsname(usdt);
>> +        if (note_add_version(usdt) == -1)
>> +            goto fail;
>> +        if (note_add_utsname(usdt) == -1)
>> +            goto fail;
>>       }
>>         dt_free(dtp, usdt);
>> @@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp, 
>> dtrace_prog_t *pgp, uint_t dflags,
>>       if (!dtp->dt_lazyload)
>>           unlink(file);
>>   -    create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
>> +    ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
>> +    if (ret == -1)
>> +        goto done;
>>         if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
>>           return dt_link_error(dtp, NULL, -1,
>> diff --git a/test/unittest/usdt/err.prov-too-long.r 
>> b/test/unittest/usdt/err.prov-too-long.r
>> new file mode 100644
>> index 00000000..1305f434
>> --- /dev/null
>> +++ b/test/unittest/usdt/err.prov-too-long.r
>> @@ -0,0 +1,3 @@
>> +-- @@stderr --
>> +dtrace: failed to link script prov: USDT provider name may not 
>> exceed 53 characters: 
>> test_12345678901234567890123456789012345678901234_prov
>> +failed to create DOF
>> diff --git a/test/unittest/usdt/err.prov-too-long.sh 
>> b/test/unittest/usdt/err.prov-too-long.sh
>> new file mode 100755
>> index 00000000..599e461e
>> --- /dev/null
>> +++ b/test/unittest/usdt/err.prov-too-long.sh
>> @@ -0,0 +1,41 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights 
>> reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +
>> +# Ensure that provider names longer than 53 chars are rejected at 
>> link time.
>> +
>> +if [ $# != 1 ]; then
>> +    echo expected one argument: '<'dtrace-path'>'
>> +    exit 2
>> +fi
>> +
>> +
>> +dtrace=$1
>> +
>> +DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +cat > prov.d <<EOF
>> +/* Provider name is 53 chars long */
>> +provider test_1234567890123456789012345678901234567890123_prov {
>> +    probe go();
>> +};
>> +/* Provider name is 54 chars long */
>> +provider test_12345678901234567890123456789012345678901234_prov {
>> +    probe go();
>> +};
>> +EOF
>> +
>> +$dtrace $dt_flags -G -s prov.d
>> +if [ $? -ne 0 ]; then
>> +    echo "failed to create DOF" >& 2
>> +    exit 1
>> +fi
>> +
>> +echo "DOF creation should have failed" >& 2
>> +exit 0
