Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A8199924
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742325522; cv=fail; b=Oy8sQo6fVc1JZDjFFlCtic9XNI5MmTpx9xtYjHClzaUGnXgGF3mpc1FhFHX8nGgBE+PwDE6Xv5G5CAO6HCKG58EWOp+YxCP/CTv7ZrMtI6hOgRWnEmRyrpQpSqxAwVAHHJI1pCFs7sZBctjztkdL7jzS6R0DbvRGi+XNLrM8Hf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742325522; c=relaxed/simple;
	bh=p6/2FeTJ3e0g4aAssCZ/H7SHGpFLoscyNolstW7LavQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DM0SSfw9wV6SbNacD+xCsv45wAELm3q8MS8FuYLv0oO0wrz0AKEWaV6rrdTpsPVUjcfhPATNw0A6lzLqzDDT2F+cTCeBlLIo8+aA32pZrceFLUG6MsVLG286WoI2SHJA+Me7wm+VNsyUEKooycOqiOJ0RGBmVhfGdrDRLG6cZPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TTjplq2I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QXh2buKD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TTjplq2I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QXh2buKD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJGnVQ030908
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=lWiL7gk9b8lbP7ngzvU0T5Hny1qVQIokLDLykRjKZB4=; b=
	TTjplq2IlnNOC8TgtpRZRm/itRm6AK6lbr/t0AsK+Bl2RqqjDgzjnmpk6fH0CTys
	OnB7dLR0QF5BuVBNxTVyfJpx1Sydckbe1LcCDYcQ5ugFgNXW9AumEy50OcWjsYH3
	5WkxxMupWBJzs7rKpHlTiVs6bWmH4vzNAMGIPnkLzctpaH/SVHNKUsyWIDE6JX+l
	eKxOgOwy7WEvGoByDwkBO+2XFDm18qiLTIO+twNCnxwS3qa/j2bgLy+bTdm3CpDV
	TMDssKf3/s8+2fr1cj07NoyKIvKqzhCZB0mt7YYO0Ja3bXrMjLg/ZgBXgieDV1E3
	wpa8VX/t/IRNYjV8mB14fw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d23rwy7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:18:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52II8g8x027987
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:18:38 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxddv6s4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 19:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxlQ5R8bxlHcngp2+pb/jSqjcUQVHlth94PPIl7rGmNZUWJArsLNpkYrfa/7iPBF/XsOarDVXqssKEciSK/LVBnn375exXWUMRD4CqHySKfBu80MDhkD2WR3GsK0OXA6wC97R+WCBTkUX6AsUBnOF1giGpB8paV5EruQ79frWGiWGgIqHRKpoA/RE4IPaFqFk7VFKCBTOjzpNDAHjleGDAPFl2jkcAhL0sGIGyCY8zbLY2qFlx8s+3FrV/emFRHqDHdVmZGsWVmRLfKSXlBUqdZUJa6bElZTLxo4Yz9SPxklfgHWRXo7Uty68aT3eHXevTqx2X6rDYL9PiYnvvLuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWiL7gk9b8lbP7ngzvU0T5Hny1qVQIokLDLykRjKZB4=;
 b=JNq6w7FH5CJwOkmySJC05y0jmHlyDAJcspZMNAjYS/gSby4QzQ3slPDqzSw+BdTjL3A4lxt/JYZ8MovddjRAahm2F4xnQz69lffhO260vFs53R38qQLGpxLHkOZqKn0Ld4dmsOV0mP+IezXmIRRe2Dzi5Pw2nPXNQHuahdG8nDpBUE2QuqTMdHUFK82bI5AYi0caJwwUuQA5ZwFK/WxGNRdM/4nQZLk0C5hQtkH4dva4/FB3Ex9Z6uR4FKnz2uQ7/35LhdBU3/mBJuFepUjEbRaBsCH7dKy0V2E3yqqtguuejnJlqWUk8MVECFcwPw4Q8zDL4LOw85qLqtCofLlQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWiL7gk9b8lbP7ngzvU0T5Hny1qVQIokLDLykRjKZB4=;
 b=QXh2buKDoWpq8QEXGAQ9JKz6y3yjDBXUEjDx2OjCxQSa4UDUDar0TjCY0ISKoq9XMBxR/3XmlFFsU5fxmMvcKhQFyWha/VYnIlvd2z/9EH/WE3PGiLlM7W6u49fHyko51T03R2rjOVwnAbMrrHWhZNL2ydcol9adVt4hyN9vXkk=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA1PR10MB6898.namprd10.prod.outlook.com (2603:10b6:208:422::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 19:18:34 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 19:18:32 +0000
Date: Tue, 18 Mar 2025 15:18:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] test: Add test for predefined preprocessor
 definitions
Message-ID: <Z9nHA1dtjHeo2dy5@kvh-deb-bpf.us.oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
 <20250208190622.23484-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250208190622.23484-4-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA1PR10MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d3a106-f2b7-43fd-d4b2-08dd6651ac21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEF0ZXZsczYxZEloQWtPSm9lUDlTcENrSGFuMHA4ajE1WEpTRisyZk8xMTRi?=
 =?utf-8?B?bkdDZUNsSEF6cHY5ZVlzdlBTeUMvTXpUVDErVzlKb1B1R3lLR3NhclVab2dl?=
 =?utf-8?B?MnBkMFhSQkp3QUJiMVZua2Rka0gxbnpRaFJ5L25wOVdSYjlkSTJIb1FMZUt1?=
 =?utf-8?B?dklOODhudXQxM3pmT1RPeDduMHpsbG5GaW12ZkxEUy9jMkNLclRDbnNVdGlq?=
 =?utf-8?B?YXZNK2luZ3hzdGc0dzNEbWNTVFdTUWJLU2xuU1NqMFVIQStFVXlmSDE1WTVR?=
 =?utf-8?B?UW1zamRUaEZFWTk5YytleXR4SitGbzZGYXN3STdJVEVVQlNsRW1VUXNCQndO?=
 =?utf-8?B?bk5GM3dNaHIwTXY4Y3FsazU0b1M2Vy8xVTJ0azhFb0RsUzBCYnZvbGw0eGJV?=
 =?utf-8?B?T0xMeG9Za0J3T2pEWW1PL1hnemhzSzVmN1RkNE91aGlxaGc3UE5aYlR6WlBI?=
 =?utf-8?B?YXJOa0tGbEJPV042Y25qU0p2aCs2OGdiRHljeXI1R3R5TElZanUwdUNFOVhE?=
 =?utf-8?B?Skl1Sy9GNVRRTUFBcU1CRzBqQ3drWHFjVFR1SjhLakRwSGVlWW5acTEwMUM2?=
 =?utf-8?B?ZkFvYURGVjZlZmpkMEFyblNocFN4TDY0RktmUXd1N2thY1prRVQzeGdjTC9u?=
 =?utf-8?B?aEZuRnArMVlqSVl6cmxBZ2d6eS9HVE96UiswZnZMN1hQWjQ1RHZCYlVaa3Vh?=
 =?utf-8?B?RGZlc0s0ZVlRQys2Rks5K01RVFJ0NSthc3JkcG9oeXZaUGxQYlFvQnRDcjdP?=
 =?utf-8?B?Tkl4S3JTejR0QWVCcmdzc0tKUU03YzZsVDZBNUx5aTgyRzE3NWY1VFcydTFK?=
 =?utf-8?B?RWpvRXVQQitIc25rL2hROTAzbUFoMEZRNlFyRWpGT1NGdHRxaUlzTEo1UitL?=
 =?utf-8?B?M0UvSUF3dzJlNmhwV2FMdzY4MEVQcmtybmRQRU8wQUNMcUZYRWEvZlFGbXdF?=
 =?utf-8?B?aEswcjFOazJlSVFZMlFKVnVxQXFuZzlGNCtsRldpK01lc09DMVRNKyszYVJI?=
 =?utf-8?B?SWdsSUduOFh0VUJzRE9zcyt6U2V1alB5K3dSTGdrL2pTU2ErRW5IVzNlZGE1?=
 =?utf-8?B?QUdyS2lDN3g1MHFHenlWSWVJWGJ2SytraGVqYyt5anFCdTN3eWg2bG83dGxk?=
 =?utf-8?B?N3Z4NkdzVm5Fd3c0b3VZYVVUc0NZU3dGL0pVdi9EVW92LzNwb24rOFhWS0hF?=
 =?utf-8?B?c3E0K0twNzRQTzhObHFWUlZxbUk2S2NDejBvZFI4bzl0QysvbStZb3ppY2Nq?=
 =?utf-8?B?SURKbThncEhGdFNrLzQ0dVlVWmcxUUVaQzlRNWlsZXY0MWRtYzRQODFyMlhH?=
 =?utf-8?B?cjZUUTRVT0F6R3pmQktxcktCM0J4NzdHa3VEbDk0UEgrZ3Z1RHd4Zm16ZE9Y?=
 =?utf-8?B?Uk9TWjFEUG55VW9EV3lNc1RKb3ZFSmhkM21FTlNhVTJMK3lWQm8xbmp0RFVD?=
 =?utf-8?B?L2szVU00Nkk2Mit6SmIwR0IrNCtPT0hQTmFNVy9maVI5SHlMb0R5akVxbFoy?=
 =?utf-8?B?TWFJRUUvWHd1dkVpWkFrY1FvVGd3SzAwWG9wR1FYMU42R1B6WVpqYmwxdjVR?=
 =?utf-8?B?QkJTanh5MHdZcVp4dFowckxQMjRTYUthYUFMd3BYdnBHU1p4dkp4MlhZUHh2?=
 =?utf-8?B?dXZFQVl6eGhDb0tMTVBSQzZQVTBDK3RGUnRFUlRlZXZDKzRsNTZ5ZXVDSXNt?=
 =?utf-8?B?UnFnWnVPcjVncmw1Q3JoS29kOWdwMTUrb1NNZ0RmcjViSjR5c2RWZk1ZTUdV?=
 =?utf-8?B?U0swL0FOWnQxdTZrOTA1OTZNUE56bDVFcVpaTHQ0UElCUEJkL3FaQ1NWL2xI?=
 =?utf-8?B?RDkrZkh4Y1E1d3pTaXdWckJsMGpwQ2MrWHIzVWVSOFkwb1BOb2s2UXRGOG9J?=
 =?utf-8?Q?Cnhv8zuiqPkXe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWI1ZVU1ZnNhcWRDcUhOUUh0ZGhyTCtaVUlpY2k4UmkweHhqSGpYeEJTdHJG?=
 =?utf-8?B?U0Y1TDhURSttbzZrOUpwdmRhN1lONEtmcm11aE8xNnpLNFpBUWtkbkRRQlRZ?=
 =?utf-8?B?SDQzKzNZRVhpdm9ULzBDeTlwaHdyVzhDdzlCTWJvT093UmIxdis2TmFWU1hN?=
 =?utf-8?B?K2E0N05jeHlzWm1ocnZPbHhzRFFoOUFkdVhUSE41c2dhY3M4L3RiNHNXcGZ1?=
 =?utf-8?B?cUhtTGRsVHplbGt0ZjY2Z2J3Y1ZabHZHMjI5MWtZaE9QeGNjVXVaZ2IvSnkw?=
 =?utf-8?B?b2FGNGt5cWpEZWtyVGhGWU9leUs4WG5HNDBGd3RvWXFpWW1pS0dITEZkZjJ3?=
 =?utf-8?B?amFmRG9WbmcrZkFMVFB6cU5yL2c0ZlBJcWlvZzNLalBuNmJsRWJodFN4UVp0?=
 =?utf-8?B?dXFhMXhFVEhTV20yVjBQN3k1TnQxWEJ0dFZTeDJwaVVVUFF4VTJkdGRld0xM?=
 =?utf-8?B?eTJUWFpCOEwxN0VYSW5vN1VJZU5qYWJ3ay9McmE3QmJYTHJ5ZS9LbkdNb3oz?=
 =?utf-8?B?QVAwam9aaGVITXU2azI4Z3JScUMxYzJmKzg5NGM4ZEZaaytraWs3ckIrRHlu?=
 =?utf-8?B?cDVGTy9xNXhRSUt0U3ZzbHJGclFTZ281UDdzQVBCbTI0WnoyU2YxK0l2N1dw?=
 =?utf-8?B?Skhpc29jQW5sSVBPWmRISUd0K1VHV0wyTDF6MFl4RUlBRUxPU21jZGV5SHRy?=
 =?utf-8?B?SEFVbHNJZ2tYQndGMnNORWlVdXovNFJSZ0J0b2xHckJZMmxmSEVOMW5CT3Az?=
 =?utf-8?B?TUJ2cWdpeExRTWF6TFBLanc3eVVSdGxHbHB4ck5sYzhCbXliZWM3RlZjc21z?=
 =?utf-8?B?cWxOcU9uaDI5MmdxYzZaRC9BbUJBOTlhcjFJbkhLYVc4dFVnN250UHlYTWgy?=
 =?utf-8?B?NUtzNXRGQ1ZWV2JoUDlPeDVLZkZHWkRaNGxIWFZ3YVFPT1QrK0dQWlBxczFX?=
 =?utf-8?B?Q3NqZDlmSjlaWFg5OWx0QkYxK2F0cktFcTJGVGp4WVZMYUFZR2k2V09ZeEUz?=
 =?utf-8?B?SHJLQkdocEU1VFpQdEgrK2RHMXFLdUJ6N3ZJaHVtZ2ZzVXltd0FQbVpGS2Q4?=
 =?utf-8?B?SXM0bWJIWFh1T3ZIQ0YwdG9VYWdsUmdtMlZWS3lpd1VMRXk4SXViKy9hNm5N?=
 =?utf-8?B?QjZtVkM2alhmYjg4dVdqNFdTRTZpRTdyT0lENWd2YnZFTFQ5N1lDQWVFdXBV?=
 =?utf-8?B?bmxyOXI1eHJlcVNPb2RJOFhTL0VwZTdORjNHOUt6cGgwME1FYU03VzhUbGRx?=
 =?utf-8?B?clFHa3pCNkVxOWFvVlVaampWYThoNVVubU1mS0xvMTRPaElPcmNoWC8rQnZt?=
 =?utf-8?B?dm44MFZxSGYyeGRRbE9VUXpYblZHVW5Yakhha0IxMUViM2NXWFR5VjIreGJG?=
 =?utf-8?B?Ri9uelFWOStFYmZVNTBhai9haVkxMFhzU1orSk92SXZSWU41YUhadVNZZUZ3?=
 =?utf-8?B?ZmRFTkdEeFhWbEVGMFdoaXlMMkxFQ1JyNCsxZnB3QzB2MWFaUm9ibjV6Y1FO?=
 =?utf-8?B?RzQ2dkRtUXlJbUR0SVcwMDJ2SXFaZU5RbjdEMFRxd08rTm5PdG9PVUM4NS9F?=
 =?utf-8?B?c1AyZGlLVHJpeFdrL0JiQ1FXOXN1T1RhcXl0MHU5SnFtTVVQb0NRMTd4VnNO?=
 =?utf-8?B?ZHNIbm9yMFdlZTJuUE45aUc3OUZCVWw2Q0NYWWxFNVRPTU15SU90STNGZDJK?=
 =?utf-8?B?dUVDaUM3aWZ2V3FmdUZya3VKMDdOdExvU1gxVVY4SWlNUE5uYWs0WWtza2lm?=
 =?utf-8?B?TkFKemRJczRwektXVzBGTWZ3UDU3WGk1NlhGbGlvOGR6OTJnbTN0eEM2RHBC?=
 =?utf-8?B?MlJHVVdyeStZSmJzVXJ1Y3pmaFg5SUcrTlJ1QkpqYlRLSDF5eitXUFBITjhh?=
 =?utf-8?B?RzR0WmoxRWJodmFoemwyaGFyVmJNYkU3NnVDZTJmVHR0T0dyaXUrMTQzSEJl?=
 =?utf-8?B?K1JRd1NxcG9vclpMNXNVY0RYU1pUY2U2dXZsZCtzaUl1algvTE9RNW1KYzJN?=
 =?utf-8?B?UXFoeHpBSW8vdjYrR0JJck1CZEhOcFlDcXdtdFpLeENHMUlMWUVLd1p0ejJr?=
 =?utf-8?B?Z0hoaEhFRVFHVUFRbCtYR3ZMSEdqMzdxL1BNY1YxYkVQelN5L0VGWFhxMXFY?=
 =?utf-8?B?QlhVMGpiRkZmNFBsSytneUhST3RvMzVMUWZTWGN1bmo1SFY1UW93UUw3blZk?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YwVRbWlF3S3m4f7ngAr7v1DPhimv8jJQUqS2tL30x+AycV45cN3+ckrrnZVc2X+VUbunEJdm/ZfxRgGWzwFLOfKOOAe1ninRslY5e2zw/1Ckqbvaigm+BRgyV+FcXWbeh0/g9eCRSyOKpK6smQzGaQdd+nkcb84X6hn/D1CWzA0Ix2NtW7ngSB8pJcRpC9hRrExFIrSylusLOEHzg05DmtLo9WaeU2QbbcUEJQqElhcWGQcmduqtW32j9KXFJRw81lYAeMOGxpKKz2qlnT7PReKzTM8gh3QdoME5fAzIRGZO5kV22G1D8HpzIQY4ihy5lPDmx9x47RYci8BTQYXFfdahnF4b0I+Rsl3iyaejKntmDIDFQnFihPiFIsPKNn7bT0d1fCsZ0AE9LySFi4MpU/oKBoLUFlCUdietyRiwZ5nhIg66nbXLHYVgfANzwocZS9ewxYsRmMEXbVrXk0CxoxULc+xUBHlZoeiXg5BMogM5aWTcSyTW4cLS+O50nbqWnc3tK23PwXCT9M511YXWLklvsy8c35f+KtFNx4UEKu7AarGr1byrjTL1G5HOgZtFU9T0fHUr4qHuCum9HIejYUAUNHg1JDJm0FE7HM2J7Xs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d3a106-f2b7-43fd-d4b2-08dd6651ac21
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 19:18:32.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nw2cCpEMdUoYMmy02IOiqhGBBs7nO27J4qsi3RkhRdq48BG03jAHDHGDP7zAjbFwruarpGN3WwqLn49dmT/f9+6STA2W9zfMmzeqi+yN/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6898
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180139
X-Proofpoint-GUID: zHLApVNusLL2LV6igCLBBcJtkbx6c0Aw
X-Proofpoint-ORIG-GUID: zHLApVNusLL2LV6igCLBBcJtkbx6c0Aw

On Sat, Feb 08, 2025 at 02:06:22PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Orabug: 28763074
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and incidentally, should we add defines with ORCL instead of SUNW
    (but keep SUNW variants for backwards compatibility)?  Or some other
    forms that do not include SUNW.  Things like __DTRACE?

> ---
>  COMMANDLINE-OPTIONS                          |  10 +-
>  test/unittest/preprocessor/tst.predefined.r  |   1 +
>  test/unittest/preprocessor/tst.predefined.sh | 119 +++++++++++++++++++
>  3 files changed, 125 insertions(+), 5 deletions(-)
>  create mode 100644 test/unittest/preprocessor/tst.predefined.r
>  create mode 100755 test/unittest/preprocessor/tst.predefined.sh
> 
> diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
> index 40561af91..73be89b1f 100644
> --- a/COMMANDLINE-OPTIONS
> +++ b/COMMANDLINE-OPTIONS
> @@ -321,12 +321,12 @@ definitions are always specified and valid in all modes:
>      * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
>      * __i386 (on x86 systems only when 32–bit programs are compiled)
>      * __amd64 (on x86 systems only when 64–bit programs are compiled)
> -    * _`uname -s` (for example, __Linux)
> +    * __`uname -s` (for example, __Linux)
>      * __SUNW_D=1
> -    * _SUNW_D_VERSION=0x_MMmmmuuu (where MM is the Major release value
> -      in hexadecimal, mmm is the Minor release value in hexadecimal,
> -      and uuu is the Micro release value in hexadecimal; see Chapter
> -      41, Versioning for more information about DTrace versioning)
> +    * _SUNW_D_VERSION=(MM << 24 | mmm << 12 | uuu), where
> +      MM is the Major release value
> +      mmm is the Minor release value
> +      uuu is the Micro release value
>  
>  -Z
>  Permit probe descriptions that match zero probes. If the -Z option is
> diff --git a/test/unittest/preprocessor/tst.predefined.r b/test/unittest/preprocessor/tst.predefined.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/preprocessor/tst.predefined.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/preprocessor/tst.predefined.sh b/test/unittest/preprocessor/tst.predefined.sh
> new file mode 100755
> index 000000000..79caf17ac
> --- /dev/null
> +++ b/test/unittest/preprocessor/tst.predefined.sh
> @@ -0,0 +1,119 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# Confirm preprocessor pre-definitions.
> +
> +dtrace=$1
> +
> +DIRNAME=$tmpdir/predefined.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Arg 1 is macro that we check is defined.
> +
> +function check_defined() {
> +	# Add to script: #ifdef is okay, else is ERROR.
> +	echo '#ifdef' $1                         >> D.d
> +	echo 'printf("'$1' okay\n");'            >> D.d
> +	echo '#else'                             >> D.d
> +	echo 'printf("ERROR!  missing '$1'\n");' >> D.d
> +	echo '#endif'                            >> D.d
> +
> +	# Add to check file: expect "okay" message.
> +	echo $1 okay                             >> chk.txt
> +}
> +
> +# Arg 1 is macro whose value we check to be arg 2.
> +
> +function check_value() {
> +	# Add to script: print value.
> +	echo 'printf("'$1'=%x\n", '$1');'        >> D.d
> +
> +	# Add to check file: expected value.
> +	echo $1=$2                               >> chk.txt
> +}
> +
> +# Arg 1 is macro that we check is not defined.
> +
> +function check_undef() {
> +	# Add to script: #ifdef is ERROR, else is okay.
> +	echo '#ifdef' $1                         >> D.d
> +	echo 'printf("ERROR!  found '$1'\n");'   >> D.d
> +	echo '#else'                             >> D.d
> +	echo 'printf("missing '$1' is okay\n");' >> D.d
> +	echo '#endif'                            >> D.d
> +
> +	# Add to check file: expect "okay" message.
> +	echo missing $1 is okay                  >> chk.txt
> +}
> +
> +# Construct version string (major, minor, micro).
> +
> +read MM mmm uuu <<< `dtrace -vV | awk '/^This is DTrace / { gsub("\\\.", " "); print $(NF-2), $(NF-1), $NF }'`
> +vers=`printf "%x" $(($MM << 24 | $mmm << 12 | $uuu))`
> +
> +# Start setting up the D script.
> +
> +echo 'BEGIN {' > D.d
> +
> +# Check for the preprocessor definitions of COMMANDLINE-OPTIONS.
> +
> +check_defined __linux
> +check_defined __unix
> +check_defined __SVR4
> +if [ `uname -m` == x86_64 ]; then
> +check_defined __amd64
> +else
> +check_undef   __amd64
> +fi
> +check_defined __`uname -s`
> +check_value   __SUNW_D 1
> +check_value   __SUNW_D_VERSION $vers
> +
> +# Confirm other preprocessor definitions.
> +
> +check_defined __SUNW_D_64
> +
> +# Confirm that __GNUC__ is not present.
> +
> +check_undef __GNUC__
> +
> +# Finish setting up the D script.
> +
> +echo 'exit(0); }' >> D.d
> +echo              >> chk.txt
> +
> +# Run the D script.
> +
> +$dtrace $dt_flags -qCs D.d -o out.txt
> +if [ $? -ne 0 ]; then
> +	echo ERROR: DTrace failed
> +	echo "==== D.d"
> +	cat        D.d
> +	echo "==== out.txt"
> +	cat        out.txt
> +	exit 1
> +fi
> +
> +# Check.
> +
> +if ! diff -q chk.txt out.txt; then
> +	echo ERROR output disagrees
> +	echo === expect ===
> +	cat chk.txt
> +	echo === actual ===
> +	cat out.txt
> +	echo === diff ===
> +	diff chk.txt out.txt
> +	exit 1
> +fi
> +
> +# Indicate success.
> +
> +echo success
> +
> +exit 0
> -- 
> 2.43.5
> 
