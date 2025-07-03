Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71B29CB4A
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574242; cv=fail; b=VdEUD5ystAoI8T5caZEGX7n8jCR818kh5O5gIX7lupyVRoFZbHallO9rSap/tVFvVDbq22coQidSWHzMRogdX1Tvf4Tq9lKFO/d3iVkCIAqI+LdaA0OuudDVXGpfCfW4+uSHBFmF9mZmWIy7kOme1E7Y0xRk+yfuMLLw9Wp+8Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574242; c=relaxed/simple;
	bh=TQjBC3tb3RPnl7gZLf/zTSyV11JVj/7coq1OTouR0lE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=csu894AiC+rP0BE1d5eNmDdbppZIogtJos/P2xEYjZ1+p03hHo37rcUVPh0RkrIAdvMCE/YuyxuWI0MDouEd7muEJ8ejtZptWIHqO27V1HhOjd27Ud5DUgUSQ1LH/+2bd4c4mq74fAIvNBtlXDFY1RcGQxc75V64EmMQNL3KOq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T98HV7ms; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xwxhn+G3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T98HV7ms";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xwxhn+G3"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ4F1003621
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 20:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=W/uCqOLK0Rry3z0QgQsT6BJ1xrqAZrFQg7eT1ujaG5Q=; b=
	T98HV7ms32EAk+dXXy5Ea+4cQkU/y8A5Ft97H29lGlpBxorJa5R2ZJt7gYrwosJN
	Sg5GjUf9AYnN6e6BgcQXpy/RbStsrYNiRACBlSY3+TCU/M1NTfVjZYBSYsKt/aWU
	YeftN7/uGxe/kt/2g8/Vgeq21RfmMp1jpv+DB/amN+dPr0X5SVkBJOtSLFdHfsDp
	wMuVDKiOIYedilE8xE7aWnJla7+XlWXY7audIwuNcpRsiIKzMcRXLtYlvdZtNuGQ
	NIBNoe2PnBm41JUnb1RKsOgQxrIT2wfvFpSJ2F359gayH8V0xrw6nveKOHHC94OE
	6YOtebwBhU2UO8Ah+A0ZwA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum810mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 20:23:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563Igfo8015139
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 20:23:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucujax-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 20:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL/KVgSlMGsPzti95WY7FkQDuCk0LbGb9xp7qw0HtIpg9gJON8VcCgTrvXoueIg+5zuD6p2OToOnr2EqBtK7pKhMJ4Cy2h7Xtut+rVPfNiqpXBYbEkkBLlynYMHcVkm/IE+SQw0QYHi/1B5m11ztxBa31sJvQbW5Ogd8MLCrLxq7J8Mh1W5lNV4mqIGpb1YMBkD/ZxRCFnnX23OD1VR/qXu7FH//x104SxeQYBSTVySSplLi+TA1jf3ygZr/9LUG+AspMJ/Z8Y5xBgNq6CLc0WEI2FpMA8wvqrqllGctlHOx3H+a9GI9ByqsnfUiHfPMYptN5Qi5jVfh5tR0Uk8rUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/uCqOLK0Rry3z0QgQsT6BJ1xrqAZrFQg7eT1ujaG5Q=;
 b=L4c8oDviwIx1SOdbmp4jrx7QnpriPH01R0dayv9zmv44P9uFeYWaGgPDLOUHaHuU1A/VgCaHx4jjg0ZXUin4AQvmgle3FQxmu1u/2e8C3PjEibuNKL3ubBL+rWkAq0ynd2LTkyzEieyf6c7rvJJtIsw0P6dE8yHnGlxvKHOYr7iHv97sTVaCGK6BjUMgv/vDkw/rrFgaFeGYfYhiRDSdzCCmfBOAImn1zFGSXUzD3pPxb9Zi0I/KQsRCJx4YT/eerpGnQXN1et0f8qGLW9l8Bg+uU62v52NcTyDlymnKPLmmKkFZRkNfYCEO9lZq7zIIB0hIyzKYeq6rGrhHGh14uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/uCqOLK0Rry3z0QgQsT6BJ1xrqAZrFQg7eT1ujaG5Q=;
 b=xwxhn+G3vkT4/ool9wWUP7/PWGF7ow2mYnfjqrDeCAUehTnDKBqjM6YeH0VbojRj6EYBRjocIPHlQeRF8uY2zABosAr+7qhY6j/jk3CuIl9ErqF27oAIkUYgoIkdBbIDSFmcgSYA9x/LeFvqptPUvc0CxsrDBrBeNCWhftjoLps=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS4PPF94A902B17.namprd10.prod.outlook.com (2603:10b6:f:fc00::d34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 3 Jul
 2025 20:23:56 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 20:23:56 +0000
Message-ID: <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
Date: Thu, 3 Jul 2025 21:23:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGbT+p0DjRTFl7Oc@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::10) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS4PPF94A902B17:EE_
X-MS-Office365-Filtering-Correlation-Id: 97692305-18a3-4899-72c4-08ddba6f8901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGI5cjJLaXZvR3FJcGpuY3Mra3hyRGlBMzQxUVRLbUdwdmpPODlJeHVTK1po?=
 =?utf-8?B?ak9FSDQ0aW8vMmZJejVNd3o4aTQweFZ3NS80Uy9YQ1o1T3hBTXlsRlMwWkJT?=
 =?utf-8?B?TFJyK1NnNzRTZVZyc0w1ZHpTRm02Y3hWeU4yQkJ4U2pGZnl5c2VtOXJsSThR?=
 =?utf-8?B?cENNa25SQ214SUZ1bWF0RDIrRXFwVXo5RHhoMmFBaHhxMzloOVZsZnoxNm9N?=
 =?utf-8?B?K2pIQkE1ekptSDVuU0NSVWRtd1o1YVhmSHJPOFQ2SU1DOHJRMExSOVZKNnVW?=
 =?utf-8?B?ZDJpNVhpbll6THpzWjBLOVNTY044K2Z6UFpOMnNlbHk2TnhRUllUYlRzOFUv?=
 =?utf-8?B?b2VnTGJ3TExKTTNjdm5uSzViVGVDSlRLdFBVMHR6eGJGR3FuWm0xZ1kwRld6?=
 =?utf-8?B?REVlT2xRdTA1OWRSM2Noc0VkVUZPVE1TWUhvVFYzTUVKRXd4K0U3MUVsWFBp?=
 =?utf-8?B?cm1kRTU5YWlUampmRUZrdGlTKzJTazVhc09JSGFhZ0RCbWxhVFdaU3dPM3dj?=
 =?utf-8?B?eWJpdUlLU0FpbXFZL2hxUWg1TC83dVlFRzY3Uk93NExwTEJScS92S1RzRlpm?=
 =?utf-8?B?dHVBemdZNmlIeDFuS05tRFQwbWU0ZUVHMnIvOU9YSGtnZXFOS0tLOVpxVG9I?=
 =?utf-8?B?Q2d1cDI4a0NFRCtFL09ySk8vdjMza1Q2U3h3TEFxN3hiSUowUXU0YTJ5Ny94?=
 =?utf-8?B?TFZLMHl3cit2djFtZFJoQzZyZTJKc2c4bklvOTdxTGs5YVM1YVZ0ZWY4dnF4?=
 =?utf-8?B?WlkrT2VsOUtIOEpxa3A4bFNHZllhK0ljaU5ZMEFiYWh6aTZMdnhjRmg5K040?=
 =?utf-8?B?K2NSc1p3d09wT1hEZEdlTTJyT3RPek51b1FtZWNrSElMRFQvR2lzWUViZkZP?=
 =?utf-8?B?WU1XZUx0VU9od1BoZjRKcmNhLzRsSXluMUsxS3dUSWQrMHJnd2twQWlSekFO?=
 =?utf-8?B?UE9CY0lldFZNbk5DemdSNVlIdHhqZkVXUnZpc3FkZFJUY0EwT1MwRzRkTmpp?=
 =?utf-8?B?bTROWkFuNjRYbnB0VjBPUmU5Q2s4bTI0ZmV4SG53UUNHbUt4azBFdTIwcFg0?=
 =?utf-8?B?OHBXdFBqU3ZkdEkveGhCNnE4c28vK2lnWmMwYlVydXd5bWJ1UjVwWWkweVB5?=
 =?utf-8?B?aG1ybEVUUzBtZDdhT3hDaGtFV0Yva205NWkwVStJTGVZem5hdlZGRVRDSVpn?=
 =?utf-8?B?TVFxSWhvdytGZkRPcmdwdTQ2d1lWNE9UVkNHSzN6ZTdOd3YrS2gzd3BtUmlE?=
 =?utf-8?B?T1YzeFlXM3FKT2VtU0hHUURUdzJSMHNqQU5lTW9BbEg5TXJOZ09YQ2dqcDRk?=
 =?utf-8?B?K01FZGZjSVB1czdBZ0VsYnE3WGF4NmkyWHpPY0hCVGdHeFpFUi9IQTlOZTFU?=
 =?utf-8?B?WUdBWnFoLzI3dHM3aU9DZ3NLSVJnL2EyZXlST29hRjVXWURWMjhsNjl5Nnl4?=
 =?utf-8?B?eVdLVTNqYldBdzRtSGdaMG1LTWZIaVV3N01ka3RZcjBDUnoxN2M2YXQ3NmNM?=
 =?utf-8?B?TnVFVFBoa21LQjJnQ1BpQkY0MW5NWHl0VkVWN1gzeXZTNWVSem9TeStjTllU?=
 =?utf-8?B?WSt5ckNRaWxtdkNwUklic2ttcVN1TnFVU21CdTRzSlpnaEUydHlaOTQydXR6?=
 =?utf-8?B?bmZxd3FxM0dOdVB5TjJnUGtkZVo4dzNiQnNRMXJZTy9IT2Q2TDdWR1A5eFBN?=
 =?utf-8?B?MkpxVEwxSFBnMUcvQlJ4b1k1QnRQTkdSaWxsanAxMmk3VnhRak8rTVNIYTJn?=
 =?utf-8?B?eE9qc2dTUDJMVFFiRzQ2TkRiL0JNMWR6UGtBYzA1OFM1aEVSeTlndGFFQnBw?=
 =?utf-8?B?TldOSmFQdkJ1UlpsZkJkdGlJeW1ZZ3lEb3hHSFUyK0VuaDNvN1AvYjJzWWlt?=
 =?utf-8?B?VlRtZ2VHMm1ST2F1S3o4SU5MaXUyUHVpTjJhY2JLL3V0ZUI2ei9VWnpxaWll?=
 =?utf-8?Q?QIQcsKEtWnw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9wcDhIWjdYc01pMUhkbXU3UEJQQ29uSjBZWEJveWdYa3FRR2dpdTdYZk5j?=
 =?utf-8?B?d3B3Ymw3ZGJmNy9ZeGlhSVkwdFZqOU5sdnd2V2Z4M0JTbE1PUlc1Q3VqYk95?=
 =?utf-8?B?bTVWZGZ3V1VZZGR1aGsyL1Nma1NXZDRsUlo4VjlhaFhLLy9CdHJ2Qk8yeVZ1?=
 =?utf-8?B?Qkd6QU00T01BZ21UeUV2TCt2ck44OHRaN0FIelQvcjlZRkFNRlgwV0FHUENQ?=
 =?utf-8?B?RE43dVY4Ni9SZ3lYalJBNkZrajBmQWlwS1FiVVZBTFA0QnlHcTJnWnVua3dN?=
 =?utf-8?B?UVZ4cUdJb2ovZCswZGVnWFhRVG5LbFQ3ZFMwZlZTRThpaVNZMGw2aWZSdFQx?=
 =?utf-8?B?cGdWRmtkekxFQ3JveXFrZTNzTUsyYUdXS3dkZ1FWRGoxRjlRMGNGN2dNaFYv?=
 =?utf-8?B?dHk1dDdzeFhSaDA5UDVnYkNGTWJ1MFAvaEhSczNnZ2xYRW9zMVlkQWk4UVBB?=
 =?utf-8?B?Ym11MEpTTHB6Mm1yWlZIcE9HdWJSV3lIYzM3VVlBa0VXaWNWS2JSTWRWbm4v?=
 =?utf-8?B?WjBOb3d5V0hFSndWWHU2MG5jYm5YbXA4K2szcmR2bWlOYndxdHBJdkdMbjR3?=
 =?utf-8?B?NEllQkFpYTBHVGFEMU9DMFRnK3BGalBwNkJ2Yjk5Qk5uUXFXa0s1R21kejJZ?=
 =?utf-8?B?MXhJVFA4R0JaK29Hb1lnVFE3TVhUb08zUHFDMmlDaTlUR254ZFB2OVo0ZU1l?=
 =?utf-8?B?M1NTanlyVEhObVZNb3FLTUtEdEdBM3lLbWk4Q1NWU1dSY3JzZ2tHMktmYzhO?=
 =?utf-8?B?RzhqendjMGN4YzVjUWx3NlQ1MVJDa2N5Q0s2cDNoVytnaW9vdE8xL2U1VDF5?=
 =?utf-8?B?QmU1ZUhBMUVvRGVaME1lUVZGOVdyclhYN3B4MkJBQWxDcm9aUDlOSVRaVFZi?=
 =?utf-8?B?WFBocklKU0VlUkd4eXBqVmpDTTlHbjVtaEl3Zms4bUIvWjE2ek83MTZMdW4v?=
 =?utf-8?B?VFdtdUdnK3FyR041dXhaUSswakVDa3lCNWV1bkkzZzBaalF1aHRzcEowWkFp?=
 =?utf-8?B?bGpldFlEZkNoUmh0RVNQdTJJYmh2MStDa2VSbjFydVNJclhET0tPeExiaGxZ?=
 =?utf-8?B?RTF1OG1xU2JCQVh4ZmFLMHMxL25JRzgwK2padkxaY2hmQlU5TlJPT2prN2Fu?=
 =?utf-8?B?R3hScE1wa1VrSmM2ZGhWQ0RuSC9PQzF4ZG10SmlYYlJQeDNrYndYUHBjQ1BZ?=
 =?utf-8?B?eGtUSjJLL1k2b28xZWJqU1hDYXFXQnRFT0lCSnU2SEN1ZmVHVTJmODFDNWk0?=
 =?utf-8?B?TVM4ZzdCTUdqUDdqdUJiU1ZzSjNpeiswaFRWampLRTNFMG1nUE1YcXhBQ0xT?=
 =?utf-8?B?b3hoYmVoVjVCRUdWdS9XZEUxNlI2WUdvdTFPVTFCSHBpRnVLY3pLWis3YjVk?=
 =?utf-8?B?Q0Q3N3Vac0lDZk5MV2pNUjhlUGNxTHlsZjBjWjdIbUVVdnVyN0ZLQXJkTjVG?=
 =?utf-8?B?Q1J2Y0dYandYbnhVZkk4TW5wbUF6Wk9zN2VYWjFlNk5BVmtSVGhtL0pQckNt?=
 =?utf-8?B?UGVLd24xaHZCOWM0OTY1TGhYTGl6TitoVGt5QzNoSG9YTEVPREhJbzRwNXpI?=
 =?utf-8?B?WmFlTEUwM1Z1Um91L0Jrb0kzTWFMVUlMZ3kwd0RxOWNtRXdJTU5jRmpvd0tj?=
 =?utf-8?B?T0V5WFlOdWdYWGlqQTgyL0NoaDJEdFpVVUVpaFZ2Y1g2MmNYQ3RXK1VueC84?=
 =?utf-8?B?azJXbUc3eWJnSExYMjY5K3djSExybGJPYXcyY1lhNllaVEVhelVZRitZZXRy?=
 =?utf-8?B?VnZiSHl5WXJDWlZGV2RXRDgrbUZOOFpqZW41Si9hb3ZONFlFZXVzQ0lHcC9h?=
 =?utf-8?B?cmlIaFZxbFBqVGFqbWEzVjdEZk9LRCtDU0tsTWhidHlFRGE4V1lrV1l2OVdy?=
 =?utf-8?B?UVFndlB5QzIvUEl1TDJQelorbXJWWFlCMXFCZG1PdmN2S01FMnpsbUgwVGtq?=
 =?utf-8?B?S0VFR2hYNFE1RjZ1dmVEaE9JbVhrcFRIYkNScElqTVBJQmptZHA5QkczL3di?=
 =?utf-8?B?RU56bEhqRDZnSTVJS1I2Q0czUGZ2U3MyTWdpbUJLbnlFTUdsaGFRQmxnL1M2?=
 =?utf-8?B?TXJBdUt0Z0cvMTNyaW50QkNDVUZpTElqTE5BVWFqRVNYYy96VHJvb2RTRDc2?=
 =?utf-8?B?MkxzaWpDdkRZbGJONWxVWGdRSXVkM3RqcExZbDgwUzhQd2I5aDFJZ3l6NEMz?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	loa1iZW/zrMwcnaruZ/WSkG+bbd19JHZMhUwVoHvJg34naLULxqXcto4lRyp5mX4ZKZQ+CXMnyHtxir8YbW2TsVvDPfKiQwK0WkZXsnLe+WBiNF5YCcVyoN36T6ItdIMIEk4gkPwpRzFQcMX/LhtoYTQ2j5+B4+MMNC1JLf9p6SxDy7yGlqGvHeipy/16azjlhaxg82KxpCmeFuzpydTNXXCVaosgF8LwjJA0IJ+crpqNAwgtNkrffDQm2LqN35TCJ/UYxCzmgCsTjUhP8cSQdelcdZKiOOi7KbuIWZlGm5oUGzjeXivbscdwJTlo+kNTwBJ2QsexGZSY3cD1H7eSG5KJMnGGaJQWAI3tzoOMHrKcneUUpzZWm6dEz8rQei5MXo3OpF7SWsaFDp5HPJXybxiCA541c0axHAfdKFYJwFfsnHHYgvpCV6dtC797svZYUqIHxFEnLYYnpOePlOJ7eEYYwXmbESGADh4bcVkSRkRR7zU9odEkHpIvguWIzN5gwqrA0QzAhjD9bwF7UeUYCZD+DYxl2wqeqGzFAVkcSzaKOndiYRDY9RtcN0tGoj9Q/u/+LIZelDDLbP93hF62QIGRaUqXoBi7Me7nSe2qio=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97692305-18a3-4899-72c4-08ddba6f8901
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 20:23:56.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsnSX6UYKTRugzfmUCfyz8EEN5jmE0ifwiqAN01+EDZGuXauiHJ54v2CHqqA9rTpXNpDdbcSS13n8eNwHqam2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF94A902B17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2NyBTYWx0ZWRfX8WZNJlgQ0ImI xvX0DqY4MfwqbveceRA08o4AxJm8jf9U/PeFo/0ljCYkLNPOrGz72OYAZb0X6WcxQ1gNwgb4n+Y ym1o8EzifvJYRcyzPhNUjm3UA+i9WPR92aTTk6EXZC14Hfb8YMeP/xVxErZqS0jcbMRiVQvhvMU
 wlkL/8proeTAkxxJzhaSCOueKtFXjslugi0YZrU4R4KTRpM4L2oay5MA6+HNViUqE3VMXvpzKCZ 5lpERfFWClstjnOKbhaz4xoBZy83za1Os9btHvp0OjYgWSCNZQj773TPPvg0zjZdb0CaMi0VDnL pc+8NhD5Fbb7xX3yTQcVNGDjjp+M9iSNGi4UWk3QwAZ7lJv/Ooe9YYhG3ejiS6dQBemZXqPFjQT
 YimN5VykXDxTCnYS/olA3Sg0uhmDAFX42Mj64cDGkgeGa8I8EXaV5MiANtmcaVbWmeOLsciz
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6866e6e0 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=GYFbNHKVlOiAWfhGkJIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SLHqJ5wd_5ZPb4b24aMyisIg_dcmEB1f
X-Proofpoint-GUID: SLHqJ5wd_5ZPb4b24aMyisIg_dcmEB1f

On 03/07/2025 20:03, Kris Van Hees wrote:
> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
>> On 03/07/2025 19:26, Kris Van Hees wrote:
>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>>>> On 03/07/2025 18:06, Eugene Loh wrote:
>>>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>>>
>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>>>
>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>>>> patch 3/4 feedback).
>>>>>>>
>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>>>> send probes?
>>>>>
>>>>>     dtrace: failed to compile script /dev/stdin:
>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>>>> inet_ntoa arg#1 (ipaddr_t *):
>>>>>     Unknown type name
>>>>>
>>>>
>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>>>> need to add it to the core set of typedefs and add a type for a pointer
>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
>>>
>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
>>> this I believe?
>>>
>>
>> Unfortunately the #pragma include doesn't do enough; it just defines a
>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
>> typedef to net.d and doing the pointer lookup/addition but that doesn't
>> work either. Seems we need the core typedef + pointer addition or we hit
>> this failure.
> 
> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> you should be set.  That is what I did in my priliminary tcp provider impl.
> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> translators and that works with that typedef in the file, so this really ought
> to work.
> 

Yep, I tried that in the v2 patch series; Eugene hit the undefined error
in one test and I now hit it consistently for all tcp/ip tests
unfortunately with "typedef __be32 ipaddr_t;" in net.d.

My assumption (probably wrong) is that the include of the library does
happen but nothing triggers the pointer type generation for "ipaddr *"
in the CTF dict. If there was a way to force that type generation at the
.d file level that would be great, not sure I see a way currently tho.

Alan

>>> I'd really rather not add a type like this to the core set of typedefs we
>>> can avoid it, because it really isn't a core type.
>>>
>>
>> I can't see another way round this currently unfortunately.
>>
>> Alan

