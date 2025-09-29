Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F93237163
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759179034; cv=fail; b=rYL0cKe6bZ5C7Ep19oZ/UESv9dA8WltahraGOaJD8PTpGzRDg7ojx5Wr/X+gqnV1h2Xi3tRLMxPUJR11nELJmtbK+pdvQILEXZnobibBMLDpdeomUMxsoa/aJPpgb0xCxwvNYIJHdP5yjPI5F4yUUFZ784aUY0yKCeJZ+3MaBEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759179034; c=relaxed/simple;
	bh=vsCsNtLgIjx7vltA7+TTmhPrvrkIcGhBiaYyOTMvEoU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VNtIYC1qsYu8aHBTsDEe7XVWwWrySMQgvzuLsHivwBnPZ4IiHC8d2wSc9otqKHZBcUttrruAoACYarJ2loTy/ybD+wtuZDbx3RsBzLxURXJEWdCG1jbDZXREj7MIqDwTN8yZ6ap9NheWt3A3gDgdIvAWzAsc2efxDwBrYET784M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=knuHH/9t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pJfCzycB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="knuHH/9t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pJfCzycB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TI4bO1006170
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=j1bl4psyMrbrUS5h0v8LGNlJtv5fUXfqSODcpzPgSV8=; b=
	knuHH/9tNfDpFN7j4J1HeYRg53M3h32qAHZFgEAziHRGdxy7ENP0+xnk/PS81AuE
	y0dY++JnobF80iTpMiMGtXrS6DujMU1VxCC6kV66sfQBNrRbWty677x9uZE+9a1E
	7eDWx4YTrzzuyIU/aW+wt8SjJpbCdp9K+aGhKd5cz0Lva6xVxj6A6/4iJOkVw8Zy
	yFbeowMOV4LH6q4EeNwzO3b9PMCDvzJj+iffHtiFMcwDkY/Hi7TXs5Njr72I9VWP
	xwYMSeWEVfbj/+wOtsBMJlFXJmtc/jyGhw2k0Fx0LCBU7DUrLeVCZO2L4x+LfRiG
	iKygnmGhCSmGQKPs+drJ/A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fy2p8ap3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:50:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58TK7XEa002031
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:50:29 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6cdfg4w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXWaKg/MlBliGvsCcTnaoCx3cee7AGlZv/4yQymyVl5StNhmW25uV/trrZ5WMyTXOxZFp4H/WMOA8z0xqvDqOIy/0jccWFjHDTTwslBhrPqTt9k1De3oXM+OU+j+WAeXkx5eTKwEfnzl89tIUcRA1m8xQVU9tcHM5ggOXlkG/l34wEWHhMxTuZktD/nG6/hYgWlPYEuXaLESLzsK/d7cCtCAKm36IrU5bc2H6n9Vks8mJKJuSdxySMaxKsFWf72nLECCwJIOxKhj3XS2+aCK+ywBfEWuIdWeJzdS/1RNsf5bFbHkqeV8v8wqwfKd3dBQFdrmsUenxlEK6Jja4ny4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1bl4psyMrbrUS5h0v8LGNlJtv5fUXfqSODcpzPgSV8=;
 b=Iv5aOvcwl5w6CBBmx4dhlnz+Lh4kmyXMUGsEkW2W/qx3M3o35pbfVfF69v+I9PGCQnl/tJBQTyODDfRjVatZQEqF+x3mKb147N8GAP0j0ZZ5VXWx+HNw0iESpjjmdy0A+5sxYRKewrGal9f7KLWDlGZGObcUTcSM5Xc1o86HukLF8g/6MTRGEdfbK3VaGwTkkBficTeyfNlpPljo4rOKm5cI4OdgLC7xtVexuMsTjRDA2VnIogbg6fAOHK0zz6o9OJoYEZNkm+9NKjXaLqD35glHTFdCC+83vBCXFz3cG9vGF+IcfrUV418+JgZJoVBI/lafNDbpIRQH7p+QIZ6BUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1bl4psyMrbrUS5h0v8LGNlJtv5fUXfqSODcpzPgSV8=;
 b=pJfCzycBrrXn9GED/j1dV49u/VctzyMdxSYJwCKJklthE8jYX/WdnaftQHsN5sk9pA59PdSwFMLtTpTzqyoz455VShvyfC/OBX6IGaxIWyebB/7lWXdsg9TyZmxtsJmRFUH8QL5N8g7KXPBeZt7oE1HRDRA+5HuwlccfsmG2Y6w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7495.namprd10.prod.outlook.com (2603:10b6:610:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 20:50:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 20:50:25 +0000
Message-ID: <2b22d027-e4aa-0228-9157-2ead047e1f99@oracle.com>
Date: Mon, 29 Sep 2025 16:50:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] cg: transition [u]stack() from action to
 subroutine
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672351690BDFC2E13664F13C21BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672351690BDFC2E13664F13C21BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 394936b1-add7-4ab7-ad83-08ddff99d09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkRMNVlBUGhLcmRXeVFpclk4KzZUQXJnK3g5cElmdXJqQTVXS3piQjUwMGJF?=
 =?utf-8?B?UWlPS1hlOUNSbkNTSUhlVkpjOFVORHZVU0kwdkU5SGZSVnc2MEtOR0E2ZUZV?=
 =?utf-8?B?YkxxRDgyb0ZWdTZDNGQyS0Q1S0poYm0rMUV5MXVMcjJNYmlzYURKZzEwZU5r?=
 =?utf-8?B?MlRkUW1wbUN2Y21VQWlzNzJJSEZ6S2ZqVWwxb1k5d3BoV1NjVHhmdWQ1ZjBx?=
 =?utf-8?B?YlFxRFYraE14dm5iV3JvbmtDc1g4UW51c0dKU3dQRlRnbDhCRTNmRTNUb2po?=
 =?utf-8?B?VGJlTnRZQXVVYnBoZ2NWYVBFZnF6V29peW1wTHRDQlRwdXRZMFdNdmRoazQx?=
 =?utf-8?B?cmFGeXU4S2dBQ3JKY0ZBUkIrakZxY2xOeGVUYkRvL044cUxESlZ1KzV6czFz?=
 =?utf-8?B?U1VVTVd1N1ZVUFpack1vR3NPaWNINHUvb1M2ZnpaT2pYZmRBRjZsRlpWZUpV?=
 =?utf-8?B?SUtKalJJZjBtdHkrTnZONHU5MTBEMGRJeUV1ZTlBdTEvSVFrM1ZCREFqYVJJ?=
 =?utf-8?B?eTNsamhueWpMRjBQblg3YzJXakJyWTJPUUxaZk5UWnExakRwd3N0KzkwMjRV?=
 =?utf-8?B?cHlVSTZOS2F3emxOY0pNTGFTcEUyd0xJVkRLcExFR2dMZ3I3WUduSFhrUHJp?=
 =?utf-8?B?NnJzcTFrUkVMSVZsMnZ2NDBZRmQvaUJMdGJsRHlLbmFsVkp6Vmxyc0Jzakx4?=
 =?utf-8?B?NUI4QVgxRjh5VmZ6RGo4b2tZdkxVYkQzK2g5ZHNheHEvSVcxVENWZWlKSlBG?=
 =?utf-8?B?cUlrd2VuWWJUK2YrQmphNndTbVltSlVQQ2pUV2RMcy9IQTVFYzNnT2V6S2lL?=
 =?utf-8?B?L3BzRndsQmNMRUVCODA1d0pHRU4wV1MwYkNhUXlmekl3WjZ1ZGR0M0JxVEJr?=
 =?utf-8?B?L1E5TUFGL3BVeG95NVdRL2RSd1VSU0JqdU8va0VhNG16RUVLRkJlZDZMMnps?=
 =?utf-8?B?ZHZUaVF5N20xN2lrMUNkYUcrcGtiRGowRUhWV3I4NGFsOUlubFE1dUlvNmM4?=
 =?utf-8?B?bVFXMUJQbGNSMjlCYVVkd3REYXcxOTlMc3krbE5sZ3dSNTE4TG5hYjc3N2Ni?=
 =?utf-8?B?U2tWMjJTL2pZdG40ZzJES1Z3dElic0VMQ29NVnRiL3kxeS83ZmQyR0ZEUlRE?=
 =?utf-8?B?bUsyZTIyTm9rWVFxK2xQbUxldkMyS0tyYkVESXZ3Q1c0d1BPMXpSVzlzcENV?=
 =?utf-8?B?RE12UW80ai9TZ09CRDlLVngrREkrZzFVMGFNVWM0amlkaVBseGFNL0ljYUNF?=
 =?utf-8?B?WFU4Y3JOTk1iYVBUK3ZJeCtnWUlyNGpyc2xGVzlKenUvL21Tazh5T3RUQzJW?=
 =?utf-8?B?cGJFdjZPSTFpeElxcWt2NzM4dFVXTkpVTXNnSlR5WndzU0Yrb1piakN5RjFr?=
 =?utf-8?B?S0FFYWFOWTduZDZtRkg0UXUyY0gvK1llaFJ6OGFxaWJYK1lMeUZvZUZLaUZT?=
 =?utf-8?B?RDhEbVJwNzZCVnVtTElhRFFoTW9LY0UzR2RralE2SFZ5Q3NZU0lwWWRRbTZw?=
 =?utf-8?B?RDhGQnFxcE1OTWR3alBUU3hxYXVpcWxQV2U4UmxTTEk3VktxSm5EZVprOGFk?=
 =?utf-8?B?QmluWGJYdXJ6YzNGS0NKZTk1aG53MC9TL295dTF5cHo2OFIyRmdDZXZ5U2hT?=
 =?utf-8?B?WHBNd1k0Z1VyR1BwWXRwd0ZnZGx3NnJoRFg1ZzcvcXQxMld2VXJIbUZsNktn?=
 =?utf-8?B?ODNFRmxtVng5WHV4NHFXTEJSR3MyWWFDVmJhMVp6VHl2TFdQcHNFSksvSWxW?=
 =?utf-8?B?bU1aMW5KeWJ5UVZkenZCaVg3QkI2Uk1yVmprZnN6RUhGWHllbDZzbW5TYytW?=
 =?utf-8?B?T1h3L2dGeEtlSTFscHBDOE52SENhenFta3RPTGl0MkZOTjh1VGROd3R6N3dr?=
 =?utf-8?B?ZEhQTXFueURLc280UXlQUFZYUzR6bzJRWTdNMkx5bDhYZXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm50azZIMGtSYXd6UGJTbGVmWmJVcXpydDV6ZjF4NVVUdER1dWRnTzQrMkp3?=
 =?utf-8?B?NzF1TS96YnJhTmdZeG1GUG9jNHVkeEJ5cEluc3JzWXNjTXRCVGd1Wmd4d2kx?=
 =?utf-8?B?c210ckZQUFZPb2F6dlpSR3VHMlltNVFoTWtsZGdlS1VsZHpjNGZ4ZE1kV3M2?=
 =?utf-8?B?Q0MydWJjNStzMzlNa0FXR2g2MmV4WUR4WHpvNnFSaFNzdlozQUVqM0R3TDdD?=
 =?utf-8?B?eXJKbjNCU0ZtakZrTy80WUJtcEdVT0hqYm53VXNYaVlad29lUFFOWFIyQU1W?=
 =?utf-8?B?bWIwS05rdzFuVFJFMUVLUW8rWFRxNGU1OFZCcFRUQndsVWlxSFArckp5aHZU?=
 =?utf-8?B?R2hySkdLd21oa0F5eDgrWndrYURIRFpDcm5weWI5ZWRxNUsrTVVNV3dQY05w?=
 =?utf-8?B?ZUg2dmJPR3VkM2JzTDlCTXVNb2lZNUdBZll2ZDJYNG54ZjJGZkMvTFNubDUx?=
 =?utf-8?B?OHMzaEMvaGlWWVZoRWhMOWFZc2Q1cTA1eU1BR0xkS1hkZXdWZTZiL3E2dWd3?=
 =?utf-8?B?aWR5VGJYZXZ4dzFtTmp2b05yYUFxTllRSUYzRW03NFhuQXNJa0lNYjFBMlFL?=
 =?utf-8?B?cEpQSEpJT0VzamxjQmo1M1MzSldCVm5Zb05xU3dldGxncitRa0lCZDlzZ05N?=
 =?utf-8?B?OW5hb2liaStkZ2F1SzhjaktoQnpYZkQzM2xsOW5ZOFJWWXAydXdWYVRpV3dj?=
 =?utf-8?B?ZmRQTTB2VjM2Mi9qRkNKRXkweWRtVmdUTU4ycHc2V1ZKak40UTJqY2VLMnFn?=
 =?utf-8?B?a2RLamg5YzZlMXd4cXdYTis1emFTOVpEVGFqVFExQWdObmwyUU1KcXBUSGZJ?=
 =?utf-8?B?bTNJRWRjM2psMjZzV0p0bXNhajY5RnJ1RzZ4YkdnTVNORFhJRVgzb1gxcGxD?=
 =?utf-8?B?Z29IZkt6QzZOWDBiQW5CdEUzVTJHMldpZytGT2dhWkNkZXJlQ2Vzd2U4SytN?=
 =?utf-8?B?V3JIQ2c0Z3FNUjhxZkdmSkZDWjk5UGpnbUpVWkw3anAvdzkvZlp0aUFVU0xy?=
 =?utf-8?B?NThKaUhNREVySGJEcjVEOXhkN0xzWGdVcFV4bHFMcnpTdXA0R2l0ektna2lN?=
 =?utf-8?B?NlQzUFNWWkNjaVJoOWg5aVk3R2M5RjZRQ1Q4c0Y3Zm9kbjJ0NHpXMEdJbWhG?=
 =?utf-8?B?UzhxU2Uwa0lnQUxzVTZ6cmVrSE5DcENCWTM2cFRmNEJWdUlMVGl5MzhqOVEx?=
 =?utf-8?B?U084cG56MnlYYXFUUVdpUGxOdjdRNVhNeGtPV3RNaytsN1YxWW5iOEU2TFlK?=
 =?utf-8?B?ZzhEbVFJTE1WUkt1RzhxUm55TE43V0loTU1XVFFqN1FHRVNKZ0JqMTFVd2Uy?=
 =?utf-8?B?cVJlWkIyNHh2RjlpVFovaklPL3p5cVlVWkpJcm9TR21WNitybjVqMzhEc2FO?=
 =?utf-8?B?WmZhU1d0NmpQZ1NZMkdFNno5bC96cEkzdHRKTEtlWllpNjJUNHV5bVBHRUhJ?=
 =?utf-8?B?SitOQjZJVDBlaUxjMmdWOW9WVkNmN2Z0ZkNvUFZKZGtCUnY5U0NnMFRUTUIr?=
 =?utf-8?B?TDlwVHU2MXNVMXprSVg5aTRmUlBUNXpSSElaSjdTb1lLTG4zSHJGU0h3Ritm?=
 =?utf-8?B?QW92d2tzYzZYLzZpb3h3aGRlK0JBUnh5ZENoc1phS1Fac3FqNDJpM2xMRE5o?=
 =?utf-8?B?OUFJRldZb3R4bnpKWTJOaElvWnY5b1lrcUZFS2lzeWJsVHlUSWxLWDIyOWd6?=
 =?utf-8?B?ZlhTSmM2Z3BGSDFLUHNyOEZ6OVp0K0w3NDhDS1puSDhvZUgvVzFJdWV6QnVO?=
 =?utf-8?B?c1V2VUNYQlRNWTF0b0x3S1NhOU8xVGx6SFpHUzFVZ2ZUMGluVi80cURPYjQx?=
 =?utf-8?B?YXJXcGhLNHBSekg0UW5FNUpEdll6ZnlGdDAySFFXZXVBNFdrVktlRjZjSHdn?=
 =?utf-8?B?YktPZVJTM3p4NzdqcnR2NmZ5MXNWL2h0NUxpQWdVRkN1eG54SkhXdlRLRk4z?=
 =?utf-8?B?dm5MTnplbzlveVN6WkdrVXBCbDhSUkNoMi9xVmdzL0ZQOUxQZ0J3aFBlN3NC?=
 =?utf-8?B?bHp3akkzM1JCTUs3VXIrOEVxaktjYmV2YzZFU3NIbHUwRi9pbkhldXAwVU80?=
 =?utf-8?B?b0ZpSmxJemd5TG9YclYxWXZkdENGVVh4RDFXc2w3OVBFeHJBRkVLNldaQUs4?=
 =?utf-8?Q?ut0vRX48mUJXVAj31ga7qH/jk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YGjeklvQdYPsMr4p3krqTfxCWMveKhSwlHj0UCH/VSvqS4cguzunLk3Pzm6CH5iRrJ3QF9UIKw79k3vuEo7J9eeal77mII0prWmIAhcAK2JnbNCmQZY8/7369O7UgD9eAx2ETHe7djzWc/Sx+YrDqeVV3IuTlQVo0dqbn4Zjt2T2jQXkcAP4TPVlK3MOJlArXL31tzJeGExICC2b4BvEO8ccWVjmorsbziHAjdgIrevoEmhz0inP+MvYi746+Lrsnc1Fpo3txLHz4dbFqukg6Q8yUPW3epcsQmM4DsIZdlbB/Rqz1qQss+gkKlFxELKWiCg3UwrRsgrgbfVASX8FO0UXjR1liEehsF1AsZ8C6ll46RV7siY0OQhsttn7t8V9CpfMSsQztp+wyodUJGR5M9Cw4Y2ZuzY5WljTmJe3gNvN2wY3ILXJq4xpWptQ6Y0a3bxSRs6iIR299RbXl6HXZNLQsiflz1SClUsndTP22cqLgxSE1zZ1UvePxZ8ke6lqafPBkgKz1HSpUO8wgEela3joNJqnxghUi6bws12hYb1d2BxUeHKHYQ6MycV1q6uh7rycOjzdDX/NF34HEjKsJPHWRwlQ9cc6obL511nBIV8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394936b1-add7-4ab7-ad83-08ddff99d09e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 20:50:25.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9oNloLyn/UsfbEFZg47OokB3Xv2+ZHulJkzsB4QTkoqXKCkm5Iq69QSnRVpzz87YtKPYnGIzDSlCBWN9XZuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7495
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290193
X-Proofpoint-GUID: Iq7lcJr1LWXIG_y6M2AtqA44w9Nb2wns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE2OCBTYWx0ZWRfX0gM32d/qf4K/
 ciw+wR1PdAxsjXLsKCtydbU/pgaIMNyS1OYTbCkW5ZOiqOqa0hVg3mPZAI0Lj5R2ufKsD7UTF0r
 MRidVVIyf+1ECKuLW9J7KxCyuDwlNkBcfKJoJNipK+R9NNsADjEVk9I7iVYTgx9F0d8xrH99ZZl
 Kduc92oUC6fb+6brUa1NvrEOABXOOeUGzf3yB3NXri96UcsMsybn3pS75opilyr4SDRKq4LvfLa
 RIgli+nTE5fHqmKTOyfBqf8HDNhN9JwXLjywG+1gcO7l4dQlpbAZLSJOHMrTqVIZEXTYbNtQEZB
 fCiWBq+KtkYijW3x8fYoYMtZAP3QpctM1+fuR8DT0Fc2hc7+Z0GASwJwXhtSrt29mWirgqy9ysk
 covrzcd/nD379uxTe8amCBOtddpvcaI73h3bjNXC3+XA2ePhAF0=
X-Authority-Analysis: v=2.4 cv=Z+Ph3XRA c=1 sm=1 tr=0 ts=68daf117 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=XFRmap13kSe4JC4BhIgA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12089
X-Proofpoint-ORIG-GUID: Iq7lcJr1LWXIG_y6M2AtqA44w9Nb2wns

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 9/29/25 15:47, Kris Van Hees wrote:
> In order to allow [u]stack() to be used in expressions, they must be
> subroutines.  An exception is added to allow them to retain their
> original behaviour as data recording actions as well.
>
> The implementation change requires a new internal type to be defined
> (dt_stack) to hold stack trace data.
>
> This patch does not allow [u]stack() to be used in assignments to
> variables just yet, but it supports all previous uses of [u]stack().
> Additional functionality will be added on top of this.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/dif_defines.h                  |   6 +-
>   libdtrace/dt_cg.c                             | 350 +++++++++++-------
>   libdtrace/dt_dctx.h                           |   4 +-
>   libdtrace/dt_open.c                           |  21 +-
>   libdtrace/dt_options.c                        |  44 ++-
>   libdtrace/dt_printf.c                         |   3 +-
>   test/unittest/funcs/tst.subr.d                |  13 +-
>   .../printa/err.D_PRINTF_ARG_TYPE.stack.r      |   2 +-
>   .../printa/err.D_PRINTF_ARG_TYPE.ustack.r     |   2 +-
>   9 files changed, 289 insertions(+), 156 deletions(-)
>
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index 9f6e3b55..a18614d2 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -2,7 +2,7 @@
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    *
> - * Copyright (c) 2009, 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
>    */
>   
>   /*
> @@ -210,8 +210,10 @@
>   #define DIF_SUBR_INET_NTOA6		43
>   #define DIF_SUBR_D_PATH			44
>   #define DIF_SUBR_LINK_NTOP		45
> +#define DIF_SUBR_STACK			46
> +#define DIF_SUBR_USTACK			47
>   
> -#define DIF_SUBR_MAX			45
> +#define DIF_SUBR_MAX			47
>   
>   typedef uint32_t	dif_instr_t;
>   
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 51473667..0299ccb1 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2723,7 +2723,8 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
>    * The "kind" argument is either DTRACEACT_STACK or DTRACEACT_USTACK.
>    */
>   static int
> -dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actkind_t kind)
> +dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
> +		    dtrace_actkind_t kind)
>   {
>   	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
> @@ -2743,12 +2744,9 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   
>   	/* Handle alignment and reserve space in the output buffer. */
>   	if (reg >= 0) {
> -		uint_t	nextoff;
> -		nextoff = (off + (align - 1)) & ~(align - 1);
> -		if (off < nextoff)
> -			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, reg, nextoff - off));
> -		off = nextoff + prefsz + stacksize;
> +		off = ALIGN(off, align);
>   	} else {
> +		reg = BPF_REG_9;
>   		off = dt_rec_add(dtp, dt_cg_fill_gap, kind,
>   				 prefsz + stacksize, align, NULL, arg);
>   	}
> @@ -2762,11 +2760,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   		dt_regset_free_args(drp);
>   		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
>   		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
> -
> -		if (reg >= 0)
> -			emit(dlp,  BPF_STORE(BPF_DW, reg, 0, BPF_REG_0));
> -		else
> -			emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, off, BPF_REG_0));
> +		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
>   	}
>   
> @@ -2774,14 +2768,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	if (dt_regset_xalloc_args(drp) == -1)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
> -	if (reg >= 0) {
> -		emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
> -		if (prefsz)
> -			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, prefsz));
> -	} else {
> -		emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> -		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
> -	}
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
>   	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
>   	if (kind == DTRACEACT_USTACK)
>   		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
> @@ -2798,11 +2786,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	emitl(dlp, lbl_valid,
>   		   BPF_NOP());
>   
> -	/* Finish. */
> -	if (reg >= 0)
> -		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, reg, prefsz + stacksize));
> -
> -	return off;
> +	return prefsz + stacksize;
>   }
>   
>   static void
> @@ -3909,33 +3893,42 @@ dt_cg_arglist(dt_ident_t *idp, dt_node_t *args, dt_irlist_t *dlp,
>   			longjmp(yypcb->pcb_jmpbuf, EDT_NOTUPREG);
>   
>   		/*
> -		 * Handle actions that can be used as agg keys.
> -		 * If we are not an aggregation, dt_cg_node(dnp, ...)
> -		 * will alert us there is a problem.
> +		 * Some function calls (actions or subroutines) need special
> +		 * handling.
>   		 */
> -		if (idp->di_kind == DT_IDENT_AGG &&
> -		    dnp->dn_kind == DT_NODE_FUNC &&
> -		    dnp->dn_ident != NULL)
> -			switch (dnp->dn_ident->di_id) {
> -			case DT_ACT_STACK:
> -			case DT_ACT_USTACK:
> -				/* If this is a stack()-like function, we can handle it later. */
> -				dt_cg_push_stack(BPF_REG_FP, dlp, drp);
> -				continue;
> -			case DT_ACT_JSTACK:
> -				dnerror(dnp, D_UNKNOWN, "jstack() is not implemented (yet)\n");
> -				/* FIXME: Needs implementation */
> -			case DT_ACT_SYM:
> -			case DT_ACT_MOD:
> -			case DT_ACT_UADDR:
> -			case DT_ACT_UMOD:
> -			case DT_ACT_USYM:
> -				/* Otherwise, use the action's arg, not its "return value". */
> -				dt_cg_node(dnp->dn_args, dlp, drp);
> -				dt_cg_push_stack(dnp->dn_args->dn_reg, dlp, drp);
> -				dt_regset_free(drp, dnp->dn_args->dn_reg);
> -				continue;
> +		if (dnp->dn_kind == DT_NODE_FUNC) {
> +			dt_ident_t	*fidp = dnp->dn_ident;
> +
> +			assert(fidp != NULL);
> +
> +			/*
> +			 * For subroutines, stack() and ustack() don't need to
> +			 * be evaluated until we fill in the data of the tuple.
> +			 */
> +			if (fidp->di_kind == DT_IDENT_FUNC) {
> +				if (fidp->di_id == DIF_SUBR_STACK ||
> +				    fidp->di_id == DIF_SUBR_USTACK) {
> +					dt_cg_push_stack(BPF_REG_FP, dlp, drp);
> +					continue;
> +				}
> +			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
> +				switch (fidp->di_id) {
> +				case DT_ACT_JSTACK:
> +					dnerror(dnp, D_UNKNOWN, "jstack() is not implemented (yet)\n");
> +					/* FIXME: Needs implementation */
> +				case DT_ACT_SYM:
> +				case DT_ACT_MOD:
> +				case DT_ACT_UADDR:
> +				case DT_ACT_UMOD:
> +				case DT_ACT_USYM:
> +					/* Otherwise, use the action's arg, not its "return value". */
> +					dt_cg_node(dnp->dn_args, dlp, drp);
> +					dt_cg_push_stack(dnp->dn_args->dn_reg, dlp, drp);
> +					dt_regset_free(drp, dnp->dn_args->dn_reg);
> +					continue;
> +				}
>   			}
> +		}
>   
>   		/* Push the component (pointer or value) onto the tuple stack. */
>   		dt_cg_node(dnp, dlp, drp);
> @@ -3972,7 +3965,6 @@ empty_args:
>   	dt_regset_free(drp, BPF_REG_0);
>   
>   	/* Reserve space for a uint32_t value at the beginning of the tuple. */
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, treg, sizeof(uint32_t)));
>   	tuplesize = sizeof(uint32_t);
>   
>   	if ((areg = dt_regset_alloc(drp)) == -1)
> @@ -3986,53 +3978,62 @@ empty_args:
>   	for (dnp = args, i = 0; dnp != NULL; dnp = dnp->dn_list, i++) {
>   		dtrace_diftype_t	t;
>   		size_t			size;
> -		uint_t			nextoff;
>   		int			is_symmod = 0;
>   
> -		if (dnp->dn_kind == DT_NODE_FUNC &&
> -		    dnp->dn_ident != NULL)
> -			switch (dnp->dn_ident->di_id) {
> -			case DT_ACT_STACK:
> -				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_STACK);
> -				continue;
> -			case DT_ACT_USTACK:
> -				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_USTACK);
> -				continue;
> -			case DT_ACT_UADDR:
> -			case DT_ACT_USYM:
> -			case DT_ACT_UMOD:
> -				nextoff = (tuplesize + (8 - 1)) & ~(8 - 1);
> -				if (tuplesize < nextoff)
> -					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
> -
> -				/* Preface the value with the user process pid. */
> -				if (dt_regset_xalloc_args(drp) == -1)
> -					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> -				dt_regset_xalloc(drp, BPF_REG_0);
> -				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -				dt_regset_free_args(drp);
> -				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> -				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
> -				dt_regset_free(drp, BPF_REG_0);
> -
> -				/* Then store the value. */
> -				dt_regset_xalloc(drp, BPF_REG_0);
> -				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> -				emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
> -				dt_regset_free(drp, BPF_REG_0);
> -
> -				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
> -				tuplesize = nextoff + 16;
> -
> -				continue;
> -			case DT_ACT_SYM:
> -			case DT_ACT_MOD:
> -				is_symmod = 1;
> -				size = 8;
> -				dt_regset_xalloc(drp, BPF_REG_0);
> -				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> -				break;
> +		if (dnp->dn_kind == DT_NODE_FUNC) {
> +			dt_ident_t	*fidp = dnp->dn_ident;
> +
> +			if (fidp->di_kind == DT_IDENT_FUNC) {
> +				switch (fidp->di_id) {
> +				case DIF_SUBR_STACK:
> +					tuplesize += dt_cg_act_stack_sub(
> +							yypcb, dnp, treg,
> +							tuplesize,
> +							DTRACEACT_STACK);
> +					continue;
> +				case DIF_SUBR_USTACK:
> +					tuplesize += dt_cg_act_stack_sub(
> +							yypcb, dnp, treg,
> +							tuplesize,
> +							DTRACEACT_USTACK);
> +					continue;
> +				}
> +			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
> +				switch (fidp->di_id) {
> +				case DT_ACT_UADDR:
> +				case DT_ACT_USYM:
> +				case DT_ACT_UMOD:
> +					tuplesize = ALIGN(tuplesize, 8);
> +
> +					/* Preface the value with the user process pid. */
> +					if (dt_regset_xalloc_args(drp) == -1)
> +						longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +					dt_regset_xalloc(drp, BPF_REG_0);
> +					emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> +					dt_regset_free_args(drp);
> +					emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +					emit(dlp, BPF_STORE(BPF_DW, treg, tuplesize, BPF_REG_0));
> +					dt_regset_free(drp, BPF_REG_0);
> +
> +					/* Then store the value. */
> +					dt_regset_xalloc(drp, BPF_REG_0);
> +					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> +					emit(dlp,  BPF_STORE(BPF_DW, treg, tuplesize + 8, BPF_REG_0));
> +					dt_regset_free(drp, BPF_REG_0);
> +
> +					tuplesize += 16;
> +
> +					continue;
> +				case DT_ACT_SYM:
> +				case DT_ACT_MOD:
> +					is_symmod = 1;
> +					size = 8;
> +					dt_regset_xalloc(drp, BPF_REG_0);
> +					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> +					break;
> +				}
>   			}
> +		}
>   
>   		if (!is_symmod) {
>   			dt_node_diftype(dtp, dnp, &t);
> @@ -4052,15 +4053,12 @@ empty_args:
>   		}
>   
>   		if (dt_node_is_scalar(dnp) || dt_node_is_float(dnp) || is_symmod) {
> -			nextoff = (tuplesize + (size - 1)) & ~(size - 1);
> -			if (tuplesize < nextoff)
> -				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
> +			tuplesize = ALIGN(tuplesize, size);
>   
> -			emit(dlp,  BPF_STOREX(size, treg, 0, BPF_REG_0));
> +			emit(dlp,  BPF_STOREX(size, treg, tuplesize, BPF_REG_0));
>   			dt_regset_free(drp, BPF_REG_0);
>   
> -			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, size));
> -			tuplesize = nextoff + size;
> +			tuplesize += size;
>   		} else if (dt_node_is_string(dnp)) {
>   			uint_t	lbl_valid = dt_irlist_label(dlp);
>   
> @@ -4068,6 +4066,7 @@ empty_args:
>   				longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   
>   			emit(dlp,  BPF_MOV_REG(BPF_REG_1, treg));
> +			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, tuplesize));
>   			emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size + 1));
>   			emit(dlp,  BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
>   			dt_cg_tstring_free(yypcb, dnp);
> @@ -4081,7 +4080,7 @@ empty_args:
>   					  DT_ISIMM, 128 + i);
>   
>   			emitl(dlp, lbl_valid,
> -				   BPF_ALU64_IMM(BPF_ADD, treg, size + 1));
> +				   BPF_NOP());
>   			tuplesize += size + 1;
>   		} else if (t.dtdt_flags & DIF_TF_BYREF) {
>   			uint_t	lbl_valid = dt_irlist_label(dlp);
> @@ -4090,6 +4089,7 @@ empty_args:
>   				longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   
>   			emit(dlp,  BPF_MOV_REG(BPF_REG_1, treg));
> +			emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, tuplesize));
>   			emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
>   			emit(dlp,  BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
>   			dt_regset_free(drp, BPF_REG_0);
> @@ -4102,7 +4102,7 @@ empty_args:
>   					  DT_ISIMM, 0);
>   
>   			emitl(dlp, lbl_valid,
> -				   BPF_ALU64_IMM(BPF_ADD, treg, size));
> +				   BPF_NOP());
>   			tuplesize += size;
>   		} else
>   			assert(0);	/* We shouldn't be able to get here. */
> @@ -4128,10 +4128,10 @@ empty_args:
>   		dt_regset_xalloc(drp, BPF_REG_0);
>   		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
>   		dt_regset_free_args(drp);
> -		emit(dlp,  BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
> +		emit(dlp,  BPF_STORE(BPF_DW, treg, tuplesize, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
>   	} else
> -		emit(dlp,  BPF_STORE_IMM(BPF_DW, treg, 0, 0));
> +		emit(dlp,  BPF_STORE_IMM(BPF_DW, treg, tuplesize, 0));
>   
>   	/* Account for the optional TLS key (or 0). */
>   	tuplesize += sizeof(uint64_t);
> @@ -6324,6 +6324,42 @@ dt_cg_subr_strchr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	TRACE_REGSET("    subr-strchr:End  ");
>   }
>   
> +static void
> +dt_cg_subr_stack_common(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
> +			dtrace_actkind_t kind)
> +{
> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> +
> +	if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +
> +	/*
> +	 * Collect the stack in the static buffer (because it is an invariant
> +	 * for a probe firing), and return a pointer to it.
> +	 */
> +	dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, DMEM_STACK(dtp)));
> +
> +	/* Call the stack helper function to collect the stack. */
> +	dt_cg_act_stack_sub(yypcb, dnp, dnp->dn_reg, 0, kind);
> +}
> +
> +static void
> +dt_cg_subr_stack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	TRACE_REGSET("    subr-stack:Begin");
> +	dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_STACK);
> +	TRACE_REGSET("    subr-stack:End  ");
> +}
> +
> +static void
> +dt_cg_subr_ustack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	TRACE_REGSET("    subr-ustack:Begin");
> +	dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_USTACK);
> +	TRACE_REGSET("    subr-ustack:End  ");
> +}
> +
>   static void
>   dt_cg_subr_strrchr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   {
> @@ -6953,6 +6989,8 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>   	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
>   	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
>   	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
> +	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
> +	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
>   };
>   
>   static void
> @@ -8692,43 +8730,50 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   			uint64_t arg = 0;
>   			dt_ident_t *idp = knp->dn_ident;
>   
> -			if (knp->dn_kind == DT_NODE_FUNC && idp != NULL &&
> -			    idp->di_kind == DT_IDENT_ACTFUNC) {
> -				size = 16;
> +			if (knp->dn_kind == DT_NODE_FUNC && idp != NULL) {
>   				alignment = 8;
> -				switch (idp->di_id) {
> -				case DT_ACT_USTACK:
> -					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
> -					kind = DTRACEACT_USTACK;
> -					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
> -					break;
> -				case DT_ACT_JSTACK:
> -					kind = DTRACEACT_JSTACK;
> -					break;
> -				case DT_ACT_USYM:
> -					kind = DTRACEACT_USYM;
> -					break;
> -				case DT_ACT_UMOD:
> -					kind = DTRACEACT_UMOD;
> -					break;
> -				case DT_ACT_UADDR:
> -					kind = DTRACEACT_UADDR;
> -					break;
> -				case DT_ACT_STACK:
> -					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
> -					kind = DTRACEACT_STACK;
> -					size = 8 * arg;
> -					break;
> -				case DT_ACT_SYM:
> -					kind = DTRACEACT_SYM;
> -					size = 8;
> -					break;
> -				case DT_ACT_MOD:
> -					kind = DTRACEACT_MOD;
> -					size = 8;
> -					break;
> +
> +				if (idp->di_kind == DT_IDENT_FUNC) {
> +					switch (idp->di_id) {
> +					case DIF_SUBR_USTACK:
> +						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
> +						kind = DTRACEACT_USTACK;
> +						size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
> +						goto add_rec;
> +					case DIF_SUBR_STACK:
> +						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
> +						kind = DTRACEACT_STACK;
> +						size = 8 * arg;
> +						goto add_rec;
> +					}
> +				} else if (idp->di_kind == DT_IDENT_ACTFUNC) {
> +					size = 16;
> +					switch (idp->di_id) {
> +					case DT_ACT_JSTACK:
> +						kind = DTRACEACT_JSTACK;
> +						goto add_rec;
> +					case DT_ACT_USYM:
> +						kind = DTRACEACT_USYM;
> +						goto add_rec;
> +					case DT_ACT_UMOD:
> +						kind = DTRACEACT_UMOD;
> +						goto add_rec;
> +					case DT_ACT_UADDR:
> +						kind = DTRACEACT_UADDR;
> +						goto add_rec;
> +					case DT_ACT_SYM:
> +						kind = DTRACEACT_SYM;
> +						size = 8;
> +						goto add_rec;
> +					case DT_ACT_MOD:
> +						kind = DTRACEACT_MOD;
> +						size = 8;
> +						goto add_rec;
> +					}
>   				}
> -			} else if (dt_node_is_string(knp)) {
> +			}
> +
> +			if (dt_node_is_string(knp)) {
>   				size = dtp->dt_options[DTRACEOPT_STRSIZE] + 1;
>   				alignment = 1;
>   			} else {
> @@ -8739,6 +8784,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   				alignment = size;
>   			}
>   
> +add_rec:
>   			dt_aggid_rec_add(dtp, aid->di_id, kind, size, alignment, arg);
>   		}
>   	}
> @@ -8822,10 +8868,34 @@ dt_cg(dt_pcb_t *pcb, dt_node_t *dnp)
>   				if (enp->dn_kind == DT_NODE_AGG)
>   					dt_cg_agg(pcb, enp, &pcb->pcb_ir,
>   						  pcb->pcb_regs);
> -				else
> +				else {
> +					/*
> +					 * Special case: [u]stack() in statement
> +					 * context is treated as data generating
> +					 * action.
> +					 */
> +					if (enp->dn_kind == DT_NODE_FUNC) {
> +						uint_t	id;
> +
> +						id = enp->dn_ident->di_id;
> +						if (id == DIF_SUBR_STACK)
> +							id = DTRACEACT_STACK;
> +						else if (id == DIF_SUBR_USTACK)
> +							id = DTRACEACT_USTACK;
> +						else
> +							id = 0;
> +
> +						if (id) {
> +							dt_cg_act_stack(pcb, enp, id);
> +							pcb->pcb_stmt->dtsd_clauseflags |= DT_CLSFLAG_DATAREC;
> +							goto done;
> +						}
> +					}
>   					dt_cg_node(enp, &pcb->pcb_ir,
>   						   pcb->pcb_regs);
> +				}
>   
> +done:
>   				if (enp->dn_reg != -1) {
>   					dt_regset_free(pcb->pcb_regs,
>   						       enp->dn_reg);
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index 9ff6cca5..b50a1395 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2020, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -128,7 +128,7 @@ typedef struct dt_dctx {
>    *	    completed.
>    */
>   #define DMEM_STACK_SZ(dtp) \
> -		(sizeof(uint64_t) * (dtp)->dt_options[DTRACEOPT_MAXFRAMES])
> +		(sizeof(uint64_t) * (dtp)->dt_options[DTRACEOPT_MAXFRAMES] + 1)
>   #define DMEM_TSTR_SZ(dtp) \
>   		(DT_TSTRING_SLOTS * DT_TSTRING_SIZE(dtp))
>   #define DMEM_STRTOK_SZ(dtp) \
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 509f263d..ed0b14a1 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
>   { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_type, "uint_t" },
>   { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
> -	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
> +	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
>   { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
>   	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
>   { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
> @@ -273,8 +273,8 @@ static const dt_ident_t _dtrace_globals[] = {
>   { "speculation", DT_IDENT_FUNC, 0, DIF_SUBR_SPECULATION,
>   	DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_func, "int()" },
> -{ "stack", DT_IDENT_ACTFUNC, 0, DT_ACT_STACK, DT_ATTR_STABCMN, DT_VERS_1_0,
> -	&dt_idops_func, "stack([uint32_t])" },
> +{ "stack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_STACK, DT_ATTR_STABCMN,
> +	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t])" },
>   { "stackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_STACKDEPTH,
>   	DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_type, "uint32_t" },
> @@ -328,8 +328,8 @@ static const dt_ident_t _dtrace_globals[] = {
>   	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
>   { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_regs, NULL },
> -{ "ustack", DT_IDENT_ACTFUNC, 0, DT_ACT_USTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
> -	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
> +{ "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
> +	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
>   { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
>   	DT_ATTR_STABCMN, DT_VERS_1_2,
>   	&dt_idops_type, "uint32_t" },
> @@ -1054,8 +1054,17 @@ dt_vopen(int version, int flags, int *errp,
>   	dtp->dt_type_dyn = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
>   	    "<DYN>", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
>   
> +	/*
> +	 * The stack type is added as a typedef of uint64_t[MAXFRAMES].  The
> +	 * final value of MAXFRAMES may be adjusted with the "stackframes"
> +	 * option.
> +	 */
> +	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
> +	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
> +	ctr.ctr_nelems = _dtrace_stackframes;
> +
>   	dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
> -	    "stack", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
> +		"dt_stack", ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
>   
>   	dtp->dt_type_symaddr = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
>   	    "_symaddr", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 25e79979..7508f044 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -912,6 +912,46 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   	return 0;
>   }
>   
> +/*
> + * When setting the maxframes option, set the option in the dt_options array
> + * using dt_opt_runtime() as usual, and then update the definition of the CTF
> + * type for "_stack" to be an array of the corresponding size.
> + * If any errors occur, reset dt_options[option] to its previous value.
> + */
> +static int
> +dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> +{
> +	dtrace_optval_t val = dtp->dt_options[option];
> +	ctf_file_t *fp = DT_STACK_CTFP(dtp);
> +	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
> +	ctf_arinfo_t r;
> +
> +	if (dt_opt_runtime(dtp, arg, option) != 0)
> +		return -1; /* dt_errno is set for us */
> +
> +	if (dtp->dt_options[option] > UINT_MAX) {
> +		dtp->dt_options[option] = val;
> +		return dt_set_errno(dtp, EOVERFLOW);
> +	}
> +
> +	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
> +		dtp->dt_options[option] = val;
> +		dtp->dt_ctferr = ctf_errno(fp);
> +		return dt_set_errno(dtp, EDT_CTF);
> +	}
> +
> +	r.ctr_nelems = (uint_t)dtp->dt_options[option];
> +
> +	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
> +	    ctf_update(fp) == CTF_ERR) {
> +		dtp->dt_options[option] = val;
> +		dtp->dt_ctferr = ctf_errno(fp);
> +		return dt_set_errno(dtp, EDT_CTF);
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * When setting the strsize option, set the option in the dt_options array
>    * using dt_opt_size() as usual, and then update the definition of the CTF
> @@ -1157,7 +1197,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
>   	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
>   	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
>   	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
> -	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
> +	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
>   	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
>   	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
>   	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 0d7c0bb4..a3e15397 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -24,7 +24,8 @@
>   static int
>   pfcheck_addr(dt_pfargv_t *pfv, dt_pfargd_t *pfd, dt_node_t *dnp)
>   {
> -	return dt_node_is_pointer(dnp) || dt_node_is_integer(dnp);
> +	return (dt_node_is_pointer(dnp) && !dt_node_is_stack(dnp)) ||
> +	       dt_node_is_integer(dnp);
>   }
>   
>   /*ARGSUSED*/
> diff --git a/test/unittest/funcs/tst.subr.d b/test/unittest/funcs/tst.subr.d
> index 9f7203c0..d97a0780 100644
> --- a/test/unittest/funcs/tst.subr.d
> +++ b/test/unittest/funcs/tst.subr.d
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -36,6 +36,15 @@
>   	/*DSTYLED*/			\
>   	}
>   
> +#define STKFUNC(x)			\
> +	BEGIN				\
> +	/*DSTYLED*/			\
> +	{				\
> +		subr++;			\
> +		@stk[x] = sum(1);	\
> +	/*DSTYLED*/			\
> +	}
> +
>   #define NUM_UNIMPLEMENTED 7
>   
>   INTFUNC(rand())
> @@ -89,6 +98,8 @@ STRFUNC(inet_ntoa6((in6_addr_t *)alloca(sizeof(in6_addr_t))))
>   /* Not implemented yet.
>      STRFUNC(d_path(&(curthread->fs->root)))
>      STRFUNC(link_ntop(ARPHRD_ETHER, (void *)alloca(sizeof(ipaddr_t)))) */
> +STKFUNC(stack(5))
> +STKFUNC(ustack(5))
>   
>   BEGIN
>   /subr == DIF_SUBR_MAX + 1 - NUM_UNIMPLEMENTED/
> diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
> index 50e884a0..95ac80da 100644
> --- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
> +++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
> @@ -2,4 +2,4 @@
>   dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
>   	conversion: %p
>   	 prototype: pointer or integer
> -	  argument: stack
> +	  argument: dt_stack
> diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
> index fc9e1512..5df10376 100644
> --- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
> +++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
> @@ -2,4 +2,4 @@
>   dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
>   	conversion: %p
>   	 prototype: pointer or integer
> -	  argument: stack
> +	  argument: dt_stack
