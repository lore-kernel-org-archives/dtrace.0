Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EEE1F19A
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759811087; cv=fail; b=V0vK8y2/aKd2H6o6KrUQbkqXSRkQy1ezhnY/ot8HuefPTPCv/MjuZM5pvw3jGmiY25tyNXVk/dKltVGTFh6PymqzifKRwwZA52+4hbJyeglXAsS9Q1fETKvltWll+5ppsqFStrsk49BSOwiAeqnBW/VXLblClPEX8D7wUYnVDM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759811087; c=relaxed/simple;
	bh=hG9QEvrW8Uy7XQB3HEbqLvgHFVg08HDmsTbApxoR/WY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iHA5s6w1k8MsP+hcbb+zrjk5I9Px8AKPMLLe7KwmveSZUluB3N2YUlLlBMMTPxt8FmmF4RFhtLU0XR5lknpmRPhYDhqKvLepc8aOqYGjgKAUeuYa8PsEGFbvmLS+F7vfGD0qy+IszVbxrbv9sDXyBcuZTTKNyCkw0ZyC1tKPCS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YI2ufxnO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=szyd39ak; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YI2ufxnO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="szyd39ak"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5974Mh8D008532
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 04:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AzncjPPiIMtcDxoJIoLfnvBAPaR+6ieVUf1uqGlxy68=; b=
	YI2ufxnOpH28kHSd5gAaRvFLZoPVbfN96E8MOW5ZnOofbOGXBGhoZfzBC/emTEEv
	Bpms/6EJOKua9kfJS0v9+o1LCQS0O6P2ILFvbjGAXRXBO18cjSIPjtxkNPoIdAzE
	iHkd3BpPV/SJArT//PnSb+OcEp6LbMceu0ALWduaoPDKtYsPJWl726y8Mo2xNtE9
	ahwDsrlzo6AkqQnyZo1t8Hqcs8GWEJxCo4Ba+rallpjlwenoPxIXL59MPe5PLKHC
	lygjl/6ASPhoW1v0pdXYP0ziXHppydDa8dltCl21DfK3MMxvhRMqnNHPiUpQyJHc
	610D/mO1Mp3ZtURihuGTzA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mu0h817m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 04:24:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5973dHCq004333
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 04:24:38 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17wkhk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 04:24:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSnNgqgBTpHfQ1bA2A17cJUBmOa1vZZUZXySrBBVqjzMtMHWKHb117mXAh5B+U7IB4T6iuNPkQ78yEPcosCI53kZK2sMIaWylCu2Di5f/Sw7fg4eCiR3EwAcP3vWECJl6FNF2fbfYXWb041N7X3AIu/GRcwHbP2vnfTz9wSu/8wcDGBuU9k/aWHAYB4Pp9rUOrnRdUV7NnXpzi/DLGSwWmFHuws4LGUBjxa4ovTtEz6GffwSD4quO1IlXBF9bICNJdcnxR0lCnZHmF4JwEnmClraJ6+BeHHya9OPEdSMW0bafrP36f6kjfTxZDGRngU2MmlokIOEtku7AUAyrz9tLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzncjPPiIMtcDxoJIoLfnvBAPaR+6ieVUf1uqGlxy68=;
 b=p4eVSAoEDoZKFV7aC96a8g+vtVBIe3BkBXe6VdWuM68jdR84McUkPbBd9Wmnmvis4h06RKFxUcELxc9F0ye7PGvUisJcINTViliURpxKAE/11xsKUTD0XsCGwVvR3hRqfe3MD9meAjHdHGP9A4e3VnJ1lOicayU5z7RA+xuyStVo+gxDSqgFKUIeAnCgxO0t77UqnRZ3FHeQZG6l0lX+IYCCs8dXYUkMZEoc7fIxEDJU5jO/EWp1G1Nzcd6otYdouOiBchc+wnIn8v5U/YB0bm8Z+QnG/xUupg1m9Tc5JHjEBNidZZIMPu5334wlhTkUPdZ0l3UWl9MSl/TDXJ42Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzncjPPiIMtcDxoJIoLfnvBAPaR+6ieVUf1uqGlxy68=;
 b=szyd39ak9ypiH1mlPnLP958abKdry0CxzK+CjapVvRYn2iRhAL07QV/HlMwwA0UViaqDjmoVqnt8XFLgeIYBzyW4tFOL+a2SFm6JZ6XpRY6fHW4Ruy3E1DOdgp0oOx0CAsDknflmyLGO6yxOHwm7Ov6EwAFQ3Y5iO5qeyMfeo0A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 04:24:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 04:24:30 +0000
Message-ID: <d026d804-3599-cfe4-0045-71d935f213f6@oracle.com>
Date: Tue, 7 Oct 2025 00:24:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] cg, printf: allow storing [u]stack() into vars and
 printf using %k
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567299E6DEDC0CBB101841DCC2E3A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <49de3429-e44b-a0a6-8370-76596b165934@oracle.com>
 <aOSEoKnaf7uPKZOS@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aOSEoKnaf7uPKZOS@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 40eb27a6-1863-4441-4858-08de055968f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0RyMWlPWVBackNBZTBrdDZ2bm1Ncno2YzN5d2JpMGlmREdoVFBNai9GR1hY?=
 =?utf-8?B?Q3ZSVjVNN3FoS1E4MVBPaVdvTXFmZ1E5blVjZFZOdVlOb3VJWDlqZjQ5Y2FK?=
 =?utf-8?B?QzdNc1p0cUZQSFBCYUVKOHJpTGlweE5CWWtmalZDY3JkQlh5eXFNdWcwV2Uy?=
 =?utf-8?B?cU1mSmhyQ1BCWlJlcitlUkYxeHBYTDJyK204eTlLdXArK2o5K3Y2Q3NEL2Z3?=
 =?utf-8?B?S3F0dk90Qm54WEVjem1neDQzUC9VZXhPRU0zWTU0eXhEbmQ0STZtZGkrTC9u?=
 =?utf-8?B?VlU4Q21IbXplN3NsbDUzWXI2bkh4NWtYZzh5SnZyaTh4b2RURDNiOXNZRHNo?=
 =?utf-8?B?ME5VeG8rRWtHUDY1aFBoempGMkdYMDJUdVBHMU5QcEwvYTVRVU1Udkg4YVJs?=
 =?utf-8?B?MFcwMFUrczBLN3ovZmpWTU4yWDY0Y0NmblA4M0F4QjBOOWlXc3VSSTc1bWZS?=
 =?utf-8?B?ZEdQQzRvaUdMODNPQ2tBeGtLTTBYV1RsV2VoZDhyamFPR2VFWVhHNnlhbFE0?=
 =?utf-8?B?VnNMTGV0TzNScHBwS0dwdzFBMFRTTFRlM3RxejlmTWN0dU5DZExYMTh0QlVP?=
 =?utf-8?B?RkhETys1UU8vS0FMU0tORkFBaXcxL0F6Sm5SeHYwVHlKUmkwNWlBT1kvMkY1?=
 =?utf-8?B?a2RDSVZyY2R3cy91QitTRVdKQmd4aHdzYTNVR1JUejNVNWNQQlJGR2tGR3NO?=
 =?utf-8?B?cGdLV2lDOG5QSTh1dFZyc253M2VlRUErK0pRandrMXNiYjB0cmJETnFZSGRh?=
 =?utf-8?B?UTZHL0JYQ1lSTTJGTmtyamkvcTVoK2ZaZjlJd0ZoNGM2elpuWTJpWFF5T1pT?=
 =?utf-8?B?SE1YWG91a21UejRSWTlOeTJHOXcxcUFabGNLRHprSWhDWkE1ZzlsUkxEMmNk?=
 =?utf-8?B?SkdIV1Mwd28wN3ZBUU8zZndNMU4yd3BoVXd4TjNIM0UrTXFzQ0lEWnBqWnBS?=
 =?utf-8?B?TnZ2YWxDTEVYdEtVbk5BaDgyTG9uNE9mY0txcjgwb01PT01ua2NYeXlIQVJH?=
 =?utf-8?B?UFYvVEVFODFKNDFyeGZ6UkVpMkRnM1A1bzJRQW12TTZUWUxFMDRCUEhleVBs?=
 =?utf-8?B?cllSYTIyTmsweFZ4SmhTVk1nMFI4VmNuUk9yOTZTckdrNnY0UERnR2hQSmlj?=
 =?utf-8?B?UDB3UEhiTUx1anMxelZXa2FTanhSUnpsd0RRZ1FnbmpTMDBzZm1lMTJqVGZY?=
 =?utf-8?B?TThSOHVoend2bm54UW5NUVhoOXJxbmxMRXZMaXhsUDBjZUo2dE12S3VUZmwv?=
 =?utf-8?B?azBxL3pPcUZvdXB3NG9nU2lxaGorb2lSWW5DQzc0akxpMjlBdWgvVFpMT1Mz?=
 =?utf-8?B?ZERCanNBTm1DMGFrR3IzcCtPNE9xS3VlZjdMdlpqeGNaUE5idnpUYy9rN3Ni?=
 =?utf-8?B?Znk5aTBHOUJuR1RFZi8zUFZaRVpGRUcxSDY1V3lEQUY5SzVpRVJRQ1RHSm5J?=
 =?utf-8?B?Q2ZHWGV5eFMwQVJTZmdrazFUMW9EaEdHMmN5Nmc3MGs2REhkSlJzeDllVUdN?=
 =?utf-8?B?b2FsUHE4NnRIVjV2SE5vMC9qdFU0WDUyQVZQeDBZOXRlMTBJTlJIcjlPbGYw?=
 =?utf-8?B?Sk5tME9hcDgwM2lCaU1ZVUltNFhlWHJuZzJYZEpVY3VSZGhvaEJsb3VWcExq?=
 =?utf-8?B?b1d6UXh6RDJodjQxbThucFA1T2c5UGlqLy94UUw0bnZVRStvTm5uRmN0cEtW?=
 =?utf-8?B?Sm5EK1R6OGZBY0twMFFOTHZlVlYyc1hUQ1pTN0hibzhzMkxZRDFZazBUV09h?=
 =?utf-8?B?dTRaTXU2U2I5ZnZEY3Fxdkd6RlBIR0xwUHhpaHlrazVZUXpnbk9BeFgzbWRV?=
 =?utf-8?B?c3hsdzBVTG9HK0tsaVBhNlV2UDlZdXNCekVoT21BOXNCR0ZmZ2g4WFdRZ2Ir?=
 =?utf-8?B?REsyNlIxQ3FMQlRjaVJpR0VzL1JSWXNMSWdSSk9Sc0NXWDFzdEJZaU1VaERw?=
 =?utf-8?Q?gB4i2GmSfm4qnLe/gy1uvHyH5PVhfkz2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEYxamZ3RmFBTE1BTjg1UXhndVJ2U0x4Z2x0WC9hbzh4ZE5FVU9xNHI0Unky?=
 =?utf-8?B?MjdZaVJpR3laU1p2TFFsYmlIYnViVExEVWFPT2JwZXFRQlVwWlk5eTl6WDBt?=
 =?utf-8?B?Y3I4Vmg2ck5weXZJNXMzc2lNR1ZSMVdzOUwwZFpzTUkwZkhCNnJzbG9LbTlO?=
 =?utf-8?B?R2NIU0cwYUdlK0ZqM1N2ZzRZNElxQVJNbnJPNHNvOUg3aHZwTnhkMmllQWFh?=
 =?utf-8?B?NUd5a0FLald2cXh5MENzSVFpNlRQN3ZLR0RiRTRDSldjb2FMSHZLaU1Kcy9H?=
 =?utf-8?B?WlA3bE9QYVdwdGg2bDcvWHdtMklFTjBNWUFxU0JSVEplTnQya2dyQlBERXVi?=
 =?utf-8?B?RnB5cDIxTnZaUTdUTko5ZWdnb3Q4RFMxbTZ1eUxXTE4wUWN6WVFYRldpZmNx?=
 =?utf-8?B?cnU1azNCMy9yY1JFUFdxQTBoVFdkd2tIYlUxdHZyYUNkZG4xLy83c1FzV1Nj?=
 =?utf-8?B?L01vUEVYTGZpRC9IL3pjbjhQTGxZdnY4dzFFazVvMzdmd2kxVzNwYVZRTytV?=
 =?utf-8?B?TVlaUCsvMjVqTHFHMTE5a0FVbmU0WGdlSWYvUDVuUjh1M3paQm1zRWFVbndB?=
 =?utf-8?B?UzFFNDBTYWUweVh1S3BSTkhML0Z1RVNEenJJNG1GbFVrYUdsU1FsczFUTi9H?=
 =?utf-8?B?MmY3SkV1UjdETFpLQWhWVnVjbUdPd2FyRVZoV2RXNDBZSWtSd1hGMENoby9y?=
 =?utf-8?B?TWZrbFZVdFRwVFBYeDdsQ3FuUldPNEZJMDd6V3luYzJYTTBCbW5lUXkxb29h?=
 =?utf-8?B?dGdRd0VGSzh5VDdZRnFmUkdORVJ0elhqWS8yQjk4TXlGd2Q5Q0pMN0dTSzVi?=
 =?utf-8?B?dDVtcVcvWkpzSGwxZzVLRWFmTVRCWVg3K29GL1FHYXJmbGpqQTVXN2U5OVhy?=
 =?utf-8?B?eFJyZk1scythSGhya1RzY2NRR1hoQWltcGRqcHBhU0JBOGVuRFpEUTdEdzdM?=
 =?utf-8?B?RlViZy83TnV1UE4raWtqSlJMS2VKYzdVeUVZV0lRS3U5bUxQN3p0ZUcyNzU4?=
 =?utf-8?B?aHozTERIeTA4MGRZUXg0enN6SWExbnRHWTl3Rks1Z0h4L05mVWdSSUFoNVVU?=
 =?utf-8?B?TTNrWHo3VFJzREVHRzAxblcxU3Q2UjE1RFlxV3dMZDNBZ3pkbjIvVjVNV2xh?=
 =?utf-8?B?VlBEcGZHOXZra3hJVFM4b2dnNWY1dC9ibWZvNm9xSVdXVXZPanREb3RYUnYr?=
 =?utf-8?B?Z3ROWmsyeTFrbXQ0dXpKOHd6RlhNcjBOczlrRHlTUE9GNjUzRU45TFNRM3ox?=
 =?utf-8?B?U1dkUnVZRG9wN1NKRXRCSVkvSXZ0UXZCZWpIalliVnQ1MWM5RTdVeGc3Ky9p?=
 =?utf-8?B?ZWVaT1VPUVlWdnJVVldib0xwaVdVVTNhZUcvenhFdWFWdHI4OVFiN0JlbndI?=
 =?utf-8?B?NWtsVUpSMis5ejE0alM3QWpxdVpOZ0NSeWVsOSttWkhMc1NjcDRIOEcxSEZ1?=
 =?utf-8?B?QWlhbWtsR2dQeDN3cHlwQ2dhNzVxaFh6b29uUnVzMWNHNVhRelY4SFhCVVRu?=
 =?utf-8?B?emxJaXdJY0JnU1JVZkt6akw5MmlOb2hMU20zcDlDeFVaZFZRN2NTc0R5RWRw?=
 =?utf-8?B?QUF0aCtmTDc0QzlEaUhCOW9Qbzd4K3VYRHhCTWhaOXpRczYzTDlVUzZDU1A2?=
 =?utf-8?B?WUhUZDNMTmdsRHZNYWFsMUlleFR2TitleFBaU0ZOWWtvdkFjdzBJNndmN2g4?=
 =?utf-8?B?ZDNkUlpzSmJLeGJKbUZQZ2F2UnlUUW5xVFdka1ZRWHN0aUs3dXJhRWtLVGdz?=
 =?utf-8?B?eTlDVzJudkRSK1V2Vjd5TEZTMk1reUZmcC84NzJpUUNuZEZ2MkMxNTAvUHJr?=
 =?utf-8?B?RjFyZURxM2VrYXVpNW9FL3dtY0JqNGM3N3MyWnBDTWZ3aWZYLzk5YnpoTXNm?=
 =?utf-8?B?YXd0bGJhb3IzL1FEdC84dEdNNlpJdWk3WkR3QmgvS3l4ZFg0Vzk0WkxaZkNN?=
 =?utf-8?B?M3o4ekZVOVFqbmNaTjZwa3BYQ2NnQlFRWW1DZE9MWDZ0dGtrOEt4STE3VkJI?=
 =?utf-8?B?WXlDMXVrc3hoNGpMeTdnTEd2czBuVTBRZWg2S2pjYjJnUmFJRms5bWNaaFFY?=
 =?utf-8?B?YUtmOGx2K2F5SGh6RzJGVDI0Z1FuazFwc1RXVW1rZG9nbm1yOEd0SzI2cGtS?=
 =?utf-8?Q?FZP5zK6ACaffuXG/RutvE5O9m?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bZFQ9WRZGbQG2qE9u9LHHLnqeoHMf7hXWCvt+LrD6YBRN8AZNLfw7ERQYUNwvEhfB5Yc4o5cZidDMS6sehiFdZmPhPCctMxVcjSGwM4f1+eAmJAqMs9jhkpmj2psaPKIxx4bHoO6s4nxU0kdbxNiAr7kSSDnXzWKalkf/9V5x7h8sDCT+vWnGbOfn+WKUnGGg94ICYQGUVyxFPyHUnH6iGSAH8wpAWkmF9e1rS9G4wJOLlsd2by47ArMKD+hyyLdnWkt7c0qIgoGn0WXt9qkg42xLYzFOmP6LKIdg/9NEqzP5quJTettTT1TDHRN/GH3i8jP3XFFBfB2FipzadVEOflEpnHvemKz5Nf8cERIgqEvoo3+/lHL4c3u8EmIFXKiIrmYK+SUwgoZlh3s6cl66Vpmmm8/h/yXur0jEqki/Yu82HcYu+R3hjlYFH/ypjH4eLrDHoHnzeJNCFz+ukEDSgP6vc7tb35dh4bwFKOCWtxiPy5qcJbUN3Pj5H+vDrF3vWUcBWnC2zbQLj1Aq9iJSH7ozbr70seggiZo1WXY1QIaRRP3u4adTvgC6rJfrefV2afQIT+NDqzA1otw72Du0SoJRbdEumLiFxUc5FW4v64=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40eb27a6-1863-4441-4858-08de055968f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 04:24:30.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCYlK0eFD/ROZN/HYSMTg8o3RFJV6mmsiZCvHEqccpo6sA4gkmivfHarNnQFAKztiyqkt9eIA9WXQ6LrT1pQ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070032
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDAyNiBTYWx0ZWRfX9lVhEmeNwneV
 0RZHp+vVvt8TufMPjvWGPKL63XZm83z10dpE9hibOfXBBNDFa9X67FbhK+DrO8p4GGbWFNxh/Kq
 z+w3DPJBfYQrusHLi/PzKC+ZSnnb9vjuH37iivEphLDtdj3xGbQQsP9ODQd9JNkwgtKFXTCA2Xy
 NVnmW1J+aUBQ8CSp02RqwkFhaicVDMq4BEoMUfZqQ5+J3ufTMUqDbs/pyhQlS9dKZOJ26GR971K
 dmmjDz2qZZtBrcMudKtGMbt6zDPoO9MF903tCzlOWfRflMgi3U+jiPYmBj2atFTXiAZJm3QftVn
 x3/hFeWms3Rnyjiwl2Iut3RlnRPAxyj2cjFfgBggqB4S4lT0u4rkRdc9NZQu9/rmHgIvLP7dA8G
 FDDqrR3kieSlCQkXLaNnJ20VAoSheg==
X-Proofpoint-GUID: d-zEskZmncGhElQDPOxE4MIeg_TgvlUn
X-Authority-Analysis: v=2.4 cv=EfrFgfmC c=1 sm=1 tr=0 ts=68e49607 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=_gqo_vZEWi2PZ24M9jsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: d-zEskZmncGhElQDPOxE4MIeg_TgvlUn

Sounds great, looking forward to v4, but one thing... you mention an 
earlier email.  I don't think I saw it, and I cannot find it right now 
in the archive.  Could you send it again, please. Mainly just for my 
records.  Or maybe just...

On 10/6/25 23:10, Kris Van Hees wrote:
> On Mon, Oct 06, 2025 at 11:05:26PM -0400, Eugene Loh wrote:
>> On 10/6/25 15:55, Kris Van Hees wrote:
>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>> +static uint_t
>> Again, I would think that "size" should become uint  in dt_cg_agg() as well.
> I believe I amswered that in my previous email already.
I'm mildly curious about this.  Not a big deal.
