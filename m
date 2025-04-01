Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717791EDA2F
	for <dtrace@lists.linux.dev>; Tue,  1 Apr 2025 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743548083; cv=fail; b=ej4LgvYGGcOceBCzKZA8c06Vn9yAJyW7wiQOGMz45LlSIvq2JSvbs3nrSa3cIINm7OM4zZTQVksxYH9RYcRcj4hvLTBMiEya9k+wXNvoWhW2SfRHTN7flu3z0ZjQRL85uNFUPisSQH9EztVd0mn5WzW9dbnDbtFsKBydTMTDMVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743548083; c=relaxed/simple;
	bh=0Ct+cTgVFdMJ1ExPqscKAN0JZovYhsqncix2Bui4cAY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cKm6WjYIcuBTZl5iyiOsaqyCBVoCYlOFsb9Vp0jCUSQJTODbxvFN60QYUdHaKAThzm0ilFdlhWo2Z8lydfvmgkb+fHNF69sy6IGG0X4NIup/2ejnY0AdvYrPQ5ZWt9NQB8HFS/1XPVpe6S7Jvr08VVx8Pr+60T4MmzoKKk/aWSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qh97vJcw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0CogaV6h; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qh97vJcw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0CogaV6h"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531L28XG032356
	for <dtrace@lists.linux.dev>; Tue, 1 Apr 2025 22:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=zIIX2BmdHsfesFKyjcufNhX6j54h13RAYWjQf7RaOCs=; b=
	Qh97vJcwL9CrlRTb9F1gjY8Zd+ifDnoHZRvdAizbMmdDg0OpIvyDxf0qlI9WZ6bz
	cDaqri3Slob+Xdzj3Y5QJWiM+19au6YKDKXfoj+NuwBif4jsQrGNBk2RmM8CfPEh
	ggIg+12xWyd/oHPfEYjEK9Vnx6vIEqy7hMiCv1wZiHLPzCoc+GPZb9JSHtNTcrV3
	JrYQNchVUvHYm7L7SvP8orodkJ5aRk1n9+guOKOL0LFijkyPzJDLnlOvonWquvX4
	GyxzxPITgeClBXYxuDBqugwowdFrDQH+uvfIU2bAG3n/qfl4JKJ+knaRzqNTuqQp
	lrO1VNV0EXTyDDo2SpAJkQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0h9bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Apr 2025 22:54:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531MVmXC010835
	for <dtrace@lists.linux.dev>; Tue, 1 Apr 2025 22:54:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ag3psh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Apr 2025 22:54:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/t1qMRR4z81MJ3As0rjUbs7OLiHH2wbZ5Ne6vyAvk3vO1s629/5eutdktEpLldlvr7504Hq0gPSow0D+Esh7OncZCRz4zM+d1EhylQ45XkzapC1FmhyO7n7vac2EfT/LNRnnIDyBiJv9nfoQ8EWEUcRLrSAw+IxUNzmd+hZvoCI1uWlCxiEK3vpuz0wgXsNKVz0A5wGhwcqfN7J28025JjO0UHpJoIMu7kYYp2REi92DChUic1yn2WDpdMR8M0dJDOkvCQNzWsz3v8y6PMYKm8NofV/1FOFmvh0ZqyaWcObZ7TECqRKqVqGBbHbMmB9X/a541E5yIMapZVtqiHG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIIX2BmdHsfesFKyjcufNhX6j54h13RAYWjQf7RaOCs=;
 b=pIMN2cg5B8wNw2gBt0UELY4kioFWgoeitdDGEi0+YA+fEz+yIICPKOKPmgOCfxSZ+FZo3N3q6aitMWatw/aRHMs7EwjDwMYfpLLGDxhfsD4qfpxyKfWOQeYBgx4vEC6g3G0su+mizN9AViBDxgx3XVV8hiUW33czx4wytQo83JIxczO8Y/HKqmP46dC03+FznRcOAHI9e9lUUByC0Qrnfv25MNtUJGkB+WyXPKEMSgIynl39qjzaZ5qX/CuIJy9AOP8OwG8ZPkg6jZxAc/8ytq1Nk7BnvibXphvIGeUHp2Nm1qM7DImRoVr5+Qsu/NirAS3ITSfYxZM+3oy8FZCyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIIX2BmdHsfesFKyjcufNhX6j54h13RAYWjQf7RaOCs=;
 b=0CogaV6hdmoZ143KhV8sn7fYJ6Re2gmtc4yQwm1F+S67C5mNsvs+7LtqNSl7+u+wD2qWSDNfNGDk53BJR/9fmMCnsdU/SinKqWQUvJt6RrN8v/1m4fAv40ONwlKfA1MeUGOppvZTqC2li4tch/6v8a6O2pl7Cenf+hwNwF/521E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6036.namprd10.prod.outlook.com (2603:10b6:510:1fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Tue, 1 Apr
 2025 22:54:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 22:54:35 +0000
Message-ID: <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
Date: Tue, 1 Apr 2025 18:54:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/2] Add a cpuinfos BPF map
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250331214501.24126-1-eugene.loh@oracle.com>
 <Z+t7UAN7i+Dkpc5e@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z+t7UAN7i+Dkpc5e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:c0::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4556a6-c654-4e21-b305-08dd71702c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnkzS0FMWGlEaXBqdWlnSGxGdWp6R1Fmd3cxdTFvQnJ5dllETWVxMnB5b2VK?=
 =?utf-8?B?WERNeVNjWnZTdGRiMEF0Q3dvUTFWdVA3bUpNRTNsSnNzenY2dERpVzdvSWht?=
 =?utf-8?B?bkRydXVUVHZwaU5yMi9Ra0o3dmkzYU4yL0JmR0RwVEt4clRJNno1M05MRE1q?=
 =?utf-8?B?bHZZRnlxalZYYnlzc3NCelBWV3h1aCtLVmpKTWx6MlhGdGRabkFweW8zQkpl?=
 =?utf-8?B?bVhxYVVWZ0VQVWRHZ0ZLS2JIbmMvMjBGZU94RWx2M2tjaE5vZ2pQSzc5QThC?=
 =?utf-8?B?bTZsaFdjNWZTeFkrSHFvN2p3VTJQL091b0Y2cjZXSzF6Vmt0Z1MxdnoxVURY?=
 =?utf-8?B?R1d1MWVRWGlPWGF1NHFuM1VDRm1JSXc4dDZvMC94TURZWDRYclQyZkFJNVFT?=
 =?utf-8?B?RXV0ZWZqTHQzdG5BRDg3cUc2ZDY2T0QvdGpoOG5QREhkVkQrRVoxNW9XOCsx?=
 =?utf-8?B?QnN4eVkvOFFlZXZmczc0UGZQdkttQS9NV2hBNngrV1MxOUE1TllGY0xjYzd3?=
 =?utf-8?B?YUtRNDU0VTNzMVNpZXZyMjZJbWNBSm5QNGM3SGdkZHhyMEFOaStTZllZaGQv?=
 =?utf-8?B?ZkhuZmhUQkhaWkgyWWlpVFB1VXlKVkxRVHlTNUFPY01NbFJha3NLbHlFa2R6?=
 =?utf-8?B?YmpoTEZDWkNzTHNIcXhXb0RVNnFEV2MzdCtDTG1FU1JvbGd0L2hqV3pWZ1Ev?=
 =?utf-8?B?SVVDOXp6NHJPdEJZUEZYWW5rVVlKUTVCS0NyeW9wekthVHNLcWhnek10VzdI?=
 =?utf-8?B?eFJVWElXa3hqM3B1RE5qbTFVcGJ5Qk1XdXR4dlZFVldPMFdzZ0NVNFkzaEFi?=
 =?utf-8?B?MXIyR1cwTmtpblVDMUtQVDdNV2UrYm1qNG1pbU41YldRb2lYZHp2aXJ1T3Ns?=
 =?utf-8?B?V1pzMGpNRlFrTVJJT2pZTHdjdjIwTVlwVXhxOW5LcTBFQ1NqZ3k4QU5ZbnhQ?=
 =?utf-8?B?RnpBZG80ejVPRlVIVWhJa0RETVFxZnBHUW8wUUVHR1FwWjdqK1VVQkVRcFNt?=
 =?utf-8?B?cmNMMlFtS0pUN2x4bHBBYzVXVjhiazh2b0dnSy83LzBibVhTMG5jOFRCYUhx?=
 =?utf-8?B?QTNZRkZLQzBsa1NiNGRBRXZiQkpTYmhQSjZ2VENtVU8zTlUzR1cwUWNqQkN6?=
 =?utf-8?B?bzVjYWhEei81VFZQamsvSVhWWDJpMXBuYlZxdm8yVlJXVEtyV3Y1Q3pJdlVm?=
 =?utf-8?B?ZFlCak8zQ0lmUXpUbURBT2hITUdUTklRTUJvV0wzUmt1T242TVJ6M1JJaHdY?=
 =?utf-8?B?MFZDeEFrTTdRSmlXdzBDb0VZMVJrSWhLdTFTdFBWVmdzaDdMcW51UHFxWlZs?=
 =?utf-8?B?czV5SGNiS3Y1cVhFWGEvbytKRWgyeThVQU4rVlNrOGxrSEk1WDdDOXRMKzRh?=
 =?utf-8?B?VVVMWjRXMDNxcWE4Ti9sUUtnRjBsdEF6dmdSVWNjR2w1alRadE1SYWhDbFNj?=
 =?utf-8?B?Z2NqTHhSU1dqUzAwZ3ZqWnpqeTVIclQ5QXdiTnRqdFJHNU1VS2pJVEkyUUx0?=
 =?utf-8?B?UnpCbXlreEd6QlRVSTZoZm84MDBJc09RcUUxSTU2Y09CcHA1NnIxdXNMYWpX?=
 =?utf-8?B?b3Q0Q3hDWDcxM3licHkxcEtLMVIyUi9uL29jdFkvK3EvVFNSckR2MndCU25H?=
 =?utf-8?B?M0o0U3d3THkyNEFhUXJMd0dQZEl4UlhpcUVGWk1tb3duM2RZMDJUSzg0OC9Y?=
 =?utf-8?B?RVBpUzBtZ3N0L2pWUWFZeS9MYzFtSUU1UmNFcWNZbnR2VzR4RDNNclFBL1dQ?=
 =?utf-8?B?RXErc0xPTWkvU3dabjRiVzByWXBUY3dnOG1uNFp3ajR6VG1PZ1B3MlNYSGVs?=
 =?utf-8?B?eTZjSnc0d3NsMEdVTVdmS0hiQit2WG9WRWlSamhTMWNERHVmRWxqK1lzZ2dX?=
 =?utf-8?Q?yDk6cstWszX/p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFloNXM5Z3FocW9qTDIxSzVzR3ZHTXNPakhiSGJKcTRQL0hCaXJ5NkhKYWww?=
 =?utf-8?B?bkQ0VkZzeXNIZm1ielhha3ZKWnVLc2FUazlUQXMrbkFNZjhHQ2N5MFVXN0p4?=
 =?utf-8?B?d1ZWVkdUK1pOcTlITkI3cWlUNDh0TDgzb1lTTWZsZEJKay9ETzJPSStFWm93?=
 =?utf-8?B?K1djYlBYZUxsRTNNMVN5VWUvZzZ1ZzgxS0o2ckNJMjhSekZaMUdDY2Q3OXZK?=
 =?utf-8?B?M1VkTXNKZ0U3WjJ0NERRN3E1L2NNRG55TWdFNE9ZT1dZeEZpdTd0Q1FXVFhj?=
 =?utf-8?B?Z0U3TkloTmJnUWd5RzBkOFdTYm93ZXpNZmJndGZ2cVdUVk1ZSmJPSWlvK0pN?=
 =?utf-8?B?VFVvOG1YYXMrU2pUbVRxSHVHTFJaNDRCbm8yTEdmMTBvVzRmWm14UG1RNWNR?=
 =?utf-8?B?MExyaG5vYXdxWmlOVFFhRXBWWVhTZi9vT2xiTGNoZnZLbzdHQkRqTlA3b1pT?=
 =?utf-8?B?SnRSMXlBRVF5amxtYm91UnJGanVqaWpvb1owYXRBSFJEdTNLSGVrM3VKdnRz?=
 =?utf-8?B?TEx6SENaTGZPQit4dllaakpiWFk1d1czNTNmK0lEc1B0SWplOGNTTUVmZ2V3?=
 =?utf-8?B?a0xiaks0TlJDMHlIZis3Rm5BcDhLMmFwU1ZFakE2VWtncDZOUGVUQjFiSjNq?=
 =?utf-8?B?L3k5VmhJdzB5TXQybDdwTnQ0N0lyL0VqRmxrYkNCTzVPR1MwSVRiUXpLeEt3?=
 =?utf-8?B?WXE0RGlaajNCb2NyTGxoNm8vYlVSUVhXSmZOZytlWmNEV2JadUJPSmNVdHNQ?=
 =?utf-8?B?Q09hUVNxSWxNTFpEbFJ1QzVpUUNyeXBTclFDOWVRY01LTlFlU2RsYU1IMlNJ?=
 =?utf-8?B?ejc3K24wVm9jVVR0NXBRUVI1NXpQbllOcjN2ak5sNGN1aEpyTmpOdE4yS3Ir?=
 =?utf-8?B?WFJHSjZWMXBmS3N2WEdZeWVUbWxGZTRXcVdIR05WSGp0WFBjcnVqaStQV2ZX?=
 =?utf-8?B?WU45TFlaTW9BNDVwTkdoM0JqT3BVOWNCUzh1dHptYnp2QnI3ZGRwaXYyY0oy?=
 =?utf-8?B?OFRuanZjaE83YU1yK1VqT0RWMWt5UVhsYXZsQitJR2pySTV6QlllWEtPVXBi?=
 =?utf-8?B?djZHaWxKN1RIRmZWd3g5YUZDeUtmTVBZMXVBcGtpT0IwL0pDN2NGTVBRYTl0?=
 =?utf-8?B?RFNQYWhDV2ZCM21QaTB6Z1d2L1Z0ZFhNL01Qa0ZQUFdDUnZpT1MxbUZ1RmhM?=
 =?utf-8?B?d054WDNVZE40ZW1wOWpVaUJWL1VyWjJkNlZ3OGEyWWxqU1Mwc3lLSlNubUFw?=
 =?utf-8?B?bWJNZVFMZ05mYVZ6NXU0dkNkUGR0am5YMXNLWUdiZUlTVFcrWjZ4YjRIRWE5?=
 =?utf-8?B?cVAvTCswa214MVo4bnZzSVc3U1o3dVI5bXhDVjF2M2NuVGZmQmlPQlVFVU9t?=
 =?utf-8?B?VnBGOTcyWnVYSmhHNWJXTlc3R3RwVXZPWUIxaEdSMm1iQVJpYUwzWEJRVmho?=
 =?utf-8?B?MDZZUFhnVEptYVR5bmRjU1FwVkljanJMSTdTR3RXMHd5YmhMR29kNDMyb1dm?=
 =?utf-8?B?ai91dHYzUGpabG42cTZrR2ZhYmkyRGIzUnVWOWNrQWh3STZtYmhFcWxsSlRs?=
 =?utf-8?B?QmNINis0QXAxbEdhSXZabVJicENPY3ltTWFsWmtZU3NMZzB1ekNSOXJoSk1k?=
 =?utf-8?B?eFdzV2VDdHVQa0R3VnJBMnozTFNtUHNINWlPMUFnZi9zV3dBMDYrWHFPT21i?=
 =?utf-8?B?VXJOL251K3VQZHlrQkVOZTVOeVNvdGY2cFFlYmRVcWtiNXBCbzFETjI2a1RY?=
 =?utf-8?B?RUFVMmMvUStBek9vZmViUnFDR0s5U2Vsam5ORzNwbkdWWG5NZzZsekkvK0pJ?=
 =?utf-8?B?UVVwcWlFL0FaRFFaRkFVRWNMY0MwcjZsS2tLeG5Pc3IyOUNCSzAzcU1XV0Rp?=
 =?utf-8?B?aVRWVnZYc2k5YVUybXZrbmhNVzVEcklKOWpMaWVDbzlmMUxLelc3WnhuSFFq?=
 =?utf-8?B?MTVtb0R5ZW9EUnlIa0o4Q25LQ2kyMndiZWFsUVFRTzFvOUNQWGxpU3lYckFX?=
 =?utf-8?B?RWdlbFFubkoxVWdvTEd5cHZGbzY1OVNDbVlhK1pFR2Mvc0NHNEdvbUlqRTht?=
 =?utf-8?B?bHFMUE1NZmJGb0dMaGpWL3czM2FZdVA5K3dwT0NGQVBaUXRSSjNDa3hoNytK?=
 =?utf-8?Q?ZydwAFZM1vqKWMYnpQAylQZfq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/mSCwbDx6ZnkY2LHTbYIfaAjVWjI7CZhuttDBN5FcLGunKGen5vowhFcvddhC4M3jGGNjTBH7HujaQrFeA+WxeiQ/EXSOHDLnGq0+Gp1Ih0dl6huc/hqgUo+R7MNAo2HnwTi9cFufTBQLrNT5jdyuo6VuWEXfMiFadrEP/o15cuk1fE6bJhOTrqiXNZFj8+HH33Kj8J+IxSmJdk5IfxqpjhGAQ64BZ+e/DiAxg/CvzFjyEu3JuHknEFPG7nUBHARRSJlyAO5DeQ7s1GZqYshl36TunR3x8F/Mpj/8OZRQL/8VlcsEPXBw4D1bJ1yLSZ4C1dX/8tG9QogztBYOpwTCJEHOkr07n5dxxmmR9vLapR2xYmhn/LqOm5erAbq1PtG6VWQ+weXArTMdfubuIlnHwkrdgMvIJAIEDtxZksWRINj002riCZwNyLvZvl0zO3zdAUsCDDY+LnmUpiimIrq+6avnJuacONnHOJQszYn0PBQwFPZoHWQGdgO5yANrXb4WZJjVRCqm+adDMThW8jYcaDvp+fOv+2a4f84mnIo77fKCRyPihf3ObZpAavpZhSRzLwrpzTNNnMXpXsrzHB3zWL0urYRSMaYqCjE/oTjtHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4556a6-c654-4e21-b305-08dd71702c64
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 22:54:35.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t54H2vyCCDQsWaqdS/D/mPVHd3Knwl9L8GE5US7L3B/i9mCPM7Txuuj65bih84VjhraQ/cLTPqRWffttirKYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_09,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010141
X-Proofpoint-ORIG-GUID: jUV7pc2SsKy9MmvHDAjvIgE-7vMzgx5I
X-Proofpoint-GUID: jUV7pc2SsKy9MmvHDAjvIgE-7vMzgx5I

Here is a proposal.  First, two observations:

1.  (As Alan pointed out to me in a facepalm moment), one can write a 
simple D script to check enqueue_task_*()'s rq->cpu against the current 
CPU.  He and I both find that the two CPUs are generally -- but not 
always -- the same.  So, the strictly correct thing to do is use the 
rq->cpu value, even though you can just use the current CPU and be 
correct "99%" of the time.

2.  A BPF program can access per-cpu-array values on other CPUs. Well, I 
guess you need commit 0734311 ("bpf: add bpf_map_lookup_percpu_elem for 
percpu map").  That's in 5.18. That is, UEK9.

So my proposal is to leave the per-cpu cpuinfo BPF map alone. Perform a 
runtime test whether bpf_map_lookup_percpu_elem() is available.  If so, 
do that cross-CPU lookup -- the 2/2 patch I posted -- but using the new 
helper function.  If not, use a simpler on-CPU lookup, which should be 
right "99%" of the time. (I have a simple patch that uses the current 
CPU.  Pretty simple.)

On 4/1/25 01:36, Kris Van Hees wrote:

> This is not the way to go about this.  If, in order to implement the cpuinfo_t
> argument to sched probes, a regular BPF array map is needed so that cpuinfo
> data can be accessed for any given CPU id, then the existing map should be
> replaced with the new one, and its use updated to access the new one.  That
> way you can also keep the name of the map, etc...
>
> Introducing this new map with exactly the same data, and then hoping to
> deprecate the old one later is making things more messy.
>
> On Mon, Mar 31, 2025 at 05:45:00PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The cpuinfo BPF map is a per-CPU map that has CPU information
>> on each CPU for that CPU.
>>
>> Add a cpuinfos BPF map that allows any CPU to access information
>> for any other CPU.
>>
>> For now, we retain the older per-CPU map.  If desired, a future
>> patch can migrate existing uses of the per-CPU map to the new
>> map, decommissioning the old one.  This would include map set up:
>>
>> *)  libdtrace/dt_dlibs.c:   DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
>>
>> *)  libdtrace/dt_impl.h:    int dt_cpumap_fd;
>>
>> *)  libdtrace/dt_bpf.c:     dtp->dt_cpumap_fd = ...
>>      libdtrace/dt_bpf.c:     CREATE_MAP(cpuinfo)
>>
>> and map use:
>>
>> *)  bpf/get_agg.c
>> *)  bpf/get_bvar.c
>> *)  libdtrace/dt_cg.c
>> *)  libdtrace/dt_prov_lockstat.c
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_bpf.c   | 13 +++++++++++++
>>   libdtrace/dt_dlibs.c |  1 +
>>   libdtrace/dt_impl.h  |  1 +
>>   3 files changed, 15 insertions(+)
>>
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 6d42a96c7..8da51d6b9 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -786,7 +786,20 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>>   	if (dtp->dt_cpumap_fd == -1)
>>   		return -1;
>>   
>> +	dtp->dt_cpusmap_fd = create_gmap(dtp, "cpuinfos",
>> +					BPF_MAP_TYPE_HASH,
>> +					sizeof(uint32_t),
>> +					sizeof(dt_bpf_cpuinfo_t), ncpus);
>> +	if (dtp->dt_cpusmap_fd == -1)
>> +		return -1;
>> +
>>   	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
>> +
>> +	for (i = 0, ci = &conf->cpus[0]; i < ncpus && rc != -1; i++, ci++) {
>> +		key = ci->cpu_id;
>> +		rc = dt_bpf_map_update(dtp->dt_cpusmap_fd, &key, &data[ci->cpu_id]);
>> +	}
>> +
>>   	dt_free(dtp, data);
>>   	if (rc == -1)
>>   		return dt_bpf_error(dtp,
>> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
>> index 21df22a8a..0f19f3566 100644
>> --- a/libdtrace/dt_dlibs.c
>> +++ b/libdtrace/dt_dlibs.c
>> @@ -61,6 +61,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>>   	DT_BPF_SYMBOL(agggen, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(buffers, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
>> +	DT_BPF_SYMBOL(cpuinfos, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(dvars, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(gvars, DT_IDENT_PTR),
>>   	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 68fb8ec53..a5e42801c 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -390,6 +390,7 @@ struct dtrace_hdl {
>>   	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>>   	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>>   	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
>> +	int dt_cpusmap_fd;	/* file descriptor for the 'cpuinfos' BPF map */
>>   	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
>>   	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
>>   	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
