Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D84E57D
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726508870; cv=fail; b=eG5eF69fxH0e6itE1hHL5lfFtsKrzz1BcQWXLjw6pivs5EO4LtpOT2GZczYX/Yyaw/ZY93r6odQcTpxu1o1M70GbyyeH/IZeJq0ZrLpFh7nGpzE7/Jwv31SflivhSo+28bAV2/Jsp+p/kBiFcRwFitLBp8I0Nt5LAf3dNTkKSrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726508870; c=relaxed/simple;
	bh=8f9h4QyelaZPB4PKNuRAV4vCjeV1/riCoA//ei7r3CI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NdnZ9icWLMtUvICi3mdVDVmpVNsQyh+IEkGOyxqcEdc3LTyG1nAhWps/a/tU05RIoVZqOdm7izEz9Rvzhq/mk1TxhUvio0JTF+jPPEJc9r+tMGG7Bi7+8u5/01ig0WAN5IFbYGo2BS4U2+lb7fkhsRg/iLRYZxDOM3zCDbXe+Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RdeirOmU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PQ9aSu3M; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RdeirOmU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PQ9aSu3M"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GEMXkC001448
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=rmefZMz8sedd2GXfr1+rfgt1DW26ODqYR5TQhK5+wtk=; b=
	RdeirOmUsQ6AGn2IWxue4PHR5Lq5bHb1ly4PVRfGWbX9+CLAbBQU/z2pJP5b3nT+
	Rw2uZJYnwzRXZTbWblymtOqW0WQJOw8wVdCe3osWyIugqGra774/AdIQUZPDTfls
	I0WDtF8bwPc/Vd9882cJ2dwbMuTejJimZ3kHRBjdzAZAXXy+Q6cTnF/KuU81GOvC
	bZEJbaY9IT9bd4IeFJCqvSVWuApbl5BGKJ80kMsEl9yCMMsYkIZPnkAApW4H3RoG
	0OxndSFiNi6ctO2LgPWct76vzswjiTY+VOVp7/a/HXfWl+JNftmNptWnSUIBYLb6
	4pNkeu5EWCGiL5A4mjOitw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3scv1u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:47:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48GG8I92000339
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:47:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nydu6373-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8zxITvs/qEEtFaLszGZqXNvF1yxhf8E7SntvCold+Ul9ozMJEkrizvR1c0NX1ilm+pepzlFyb51HWtvvwBO4jePhmdkwNMG2Jy18x8qEgqqjB2zSLBNZM1r6wJ5+8EsMzHu1kBwoeVqeGpTl/isHn2RYS/CMO4F8ckyVnTPDF0M/9hGn+kxZn/0dSexWRoCp7GKOboLnAD+JKUyklH8YvrHmo7HO5CrsO26Km5xRWyQeqT4Xl724jHbG6wuFVAYv2DtgvDScn1jOWEXLctDuV0IXo7itLN1eV2Sufx5BMeTgkyCbHh7lWHgCayXtsUUideazg++RFJ0WOlTSGVh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmefZMz8sedd2GXfr1+rfgt1DW26ODqYR5TQhK5+wtk=;
 b=tuGMJf9/2GAcPM0K4n6HDowIRsZx3lYP1o6mWsS6gjv1pFFoYP5NJ7A5X7ULrlwiShg37pfWx4RsKou/LxCxvXBwBqpdb4XkMq9L46WTE1MDGl5sMqs4n4+teXCv/oRzpi6ktQ68Fn0s5rocIS8041SYxTqpn56XZHybKmgenUzYVxXjGzbwq8gQ8SWqEUAVnEsybU7+/HWoLbbQcekK/h9FbWS3zrYsGRnztg0ngB9tvlGUrv/fI0AGJ4WW2D8fsUfPQvKrAwxVgCld0XpvpK5orTQSX3E1Puh+6YngncoSEJ/irXF5N6rtx+Oiu2rITW/GDSawYCmG5pWlfe+Z9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmefZMz8sedd2GXfr1+rfgt1DW26ODqYR5TQhK5+wtk=;
 b=PQ9aSu3MZSiUmLRoyuwhoPZdm+F18BmkKzym+Cj9hoRZ7IZ7QTtPNGy3BDPJQB8s92X1sU/CzaqhnuFzppY6QM1/rFyzKu3zCWXexUvyvvqqkfzAwLNNrR+WXoB4B25i5sMGswqgbU4cZij+7uEYjPuyoIac9mTfzWEvkxKBCig=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5769.namprd10.prod.outlook.com (2603:10b6:510:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.14; Mon, 16 Sep
 2024 17:47:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Mon, 16 Sep 2024
 17:47:42 +0000
Message-ID: <8126bf9e-e55e-a10b-15c6-ced94a581930@oracle.com>
Date: Mon, 16 Sep 2024 13:47:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] test: adjust filter
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB62873DD7613F62C636FA90F6C2662@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB62873DD7613F62C636FA90F6C2662@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 0539a29b-ee50-4c8f-06d0-08dcd677aa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGF2VStPQ0VxN29aenY1UTdnWHFYbzFpV05kZE5RUW1MSzliVTcxUlkzTkNF?=
 =?utf-8?B?LzFDYWJ5SEpBKzhNQ213RWNlSzNWYXVKRFU0WHRZYkJqMXlVVzdOS2hVb2Vu?=
 =?utf-8?B?NmVPeU9JcDVZQjU0Y2lHYzE4dHZYQnRQL1dmdXU2akM3aTlZVlpTWTJiM1lF?=
 =?utf-8?B?S3gwL1NGSUJIRjRtU2RwKzNBTHJBNCtud2tRQitOZDlMNVBuQVoyaWdnQ0lP?=
 =?utf-8?B?dnh4T0hFd29NUGZjUlNWaUNFUnVQYXgzaGtCV0hYVTBzZStPR2lscjY5Y0lJ?=
 =?utf-8?B?YnVsKzJCTnJiR3ljRVMwbFRMeUYydy9jb2JMWHV2Y3NFSTVJZ1JRMVY5K0RD?=
 =?utf-8?B?RWw1YXdTSXpROVA2WWM0STk3N0hCT0FwYnFmc1dwOXlScll5TEpMcFVRd1d2?=
 =?utf-8?B?V1dONHdha0lNUHQzeUxHNy9nSnhXbEN5N3d5NlNVV2ZGeG5ZNzAwZGJ4NWI5?=
 =?utf-8?B?RmlnVjBDNHZyNkgwY291ZWJYYy9MYUNOZlRWYjBPc0lNb1dRbFMzaTRHb2tZ?=
 =?utf-8?B?ZGtuaDVaUDd4M3lvUnljZjBMWEhMcnBrcjgva3FGSkZ1ZmRLcm9VY2haNjNT?=
 =?utf-8?B?NWlUUXRQY1grSnU5YjN5c2s2a1NBdll0NnVZQXZVTWp4WDBYb3A5bk1SeDh5?=
 =?utf-8?B?TEl3RitpK1NBdFF1aGpqTllwcmNuV0UyVktnaVVtNEh3QU8wQ3NSUTMwWHJ4?=
 =?utf-8?B?T3Q0WEpVMVRhYk1YclJYeHlNUHdWeWJSQVE2d3ZocU5XdXBEYWVYeFJ3K29V?=
 =?utf-8?B?OUVkR05Qcm1pSEl1ZWlaUmVncit1L2krMTNXMW8ybzBFZnBsSW9PcU80RWdQ?=
 =?utf-8?B?UUFnc1M1M2lIOVpzUyt3emlIWTFWYVpWVE1Oa2dSOGt5NHM5RFVEZG5Fclp5?=
 =?utf-8?B?NmI0Rk1ZeE5CMCtUeWh4VFI5U0Vhb25jeWVNWUp5RURjRHNtUDZOeG1XZmtp?=
 =?utf-8?B?YlFwN2UvZ1g4MWhnQkRWZHBSVjlRRUhlU3JlUVdZTnN3ajFLNFFEck5PK01L?=
 =?utf-8?B?cjVzdHVtSitRSmhCUm5lMFgycXR1bXY1WHFLaVN5SjdBVmxCT3Y1aTNEUmZP?=
 =?utf-8?B?VncyZDJSaFA3V0twbk5YK2tVOHl1czR4RzkrQnI3bVNEcUcwNUt0ZWZiVnlX?=
 =?utf-8?B?STNBRDRSSkVGK2g1QjE0ZElmbEN3czBCcWRvaXBDbDZJczdNWkhMSytuM1FF?=
 =?utf-8?B?RG4vWlg3dFZDNFg0MjE0ZWE3K29qVlA1bzlRcERsNXNLeXUwWXRXcGtyNDM1?=
 =?utf-8?B?aFZmM3ZjWXY3eGo2cmMxK3dyd3luc1pENE02RGVrTzltYXhyRnBJRVJoQ01j?=
 =?utf-8?B?dDlYMEhadE5RbitFL2tRNXBEUStHL09KcnZxb2doRFZNK2pHcnV2eU5zUjV3?=
 =?utf-8?B?T1gyMkNacXptZGlUaDZZOU1oaVhKeHBuNnhNYytqaktZUGo1Wm93WWhoMldG?=
 =?utf-8?B?UTBaQ205eUdXUUVLc1ZENXBzcUQ4VXp2eXZWWENrSGl3QUFsbGlZdWRSMzYw?=
 =?utf-8?B?K1RObW5Cd0RnK2FhRCtqUnI2Ky9DQkd6d0k5WU4yOUtvWFAxZGthMVhkYW9w?=
 =?utf-8?B?Qm44dXVjVkVwL0xnNkdWb3orb3NxNWQzekw0SVNGM013OGFvZ200K3ZkODRs?=
 =?utf-8?B?NEQwNUZkWUdWRGVTZ29SNWFlOUkyNEtVOXJQMmJxUGxpT21wN0JDY2JWMUZu?=
 =?utf-8?B?cFB5d0srcWg0Q2xpeEFsbDh5Y0ViUElCTkhkMElFWWpNUlJBT0JseXB5SnMz?=
 =?utf-8?B?cXI4eXVOY1RYVWwxKzViY2Rna3NPV29JSE9DaFRsU2Y4MVhaaUlPRU92L2FM?=
 =?utf-8?B?aHFlQjVSaVJDNEVVSk95QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S050eCsyUEloVTJxdGpPd3lyRkEydk5sdmRuSm5LV1ZzWGtNTlI3ay9lV1Ax?=
 =?utf-8?B?MlpXSTZLYlZQTkMvTHdiYVdzMzV5T1JUWTF6Q1ZLZ3N0eTJGcHFySFdpS2pW?=
 =?utf-8?B?WHYrdk03d2JJN2svdFNBOVZWejMrVzl6S2ZXQXkxOHpwcmltNEtlUHRCaHhk?=
 =?utf-8?B?RC9GZExTMXpPT3BoU0VEbWpaY3l5UW9jbktmcVZSMzhrbm42Z2UwbG5sTzNC?=
 =?utf-8?B?aHFmZ09BU3JWcnRVbWN4UnN6K3ZEVndaMXdQNTNxcDdnamtGcGxsREVhYzhy?=
 =?utf-8?B?bStwR25RbDdHMTZFZ1E2cm5lcUwvbnRtOUI0VDdPaXhEMGxyNFpZbVRGSVZn?=
 =?utf-8?B?NkVlS01pc2RUSzIxM2hsZVU1ekxFU1AvYlhnOFo1V3RLMkwzOXljdDQ3ZENv?=
 =?utf-8?B?ckliN1ZyVUNkQkk5SmVQRWNxV0FCVGdOZW02amFYdEIraDlmVndCVlF2eXFh?=
 =?utf-8?B?UDhQUHVOQ2JNMEt5d2FBV3FHbmVhT0drNDErZnN0SFl3Z2NvNUJhZTF6WkZQ?=
 =?utf-8?B?U3dmeVp2VGFsaE9iaTJNT2lMZmtUdjJCeEJFWDBMbGNlWHRQakpCYXBLZ3hQ?=
 =?utf-8?B?SC83UWt5ZHBXRTR2MG5OUStabU9UR1BRaEYwVjd5c2dxV3MxYUVML1lxZ05K?=
 =?utf-8?B?NldRT0JDMk13bG9lRHVLSk11a3BQMWZpT0VCSUNtK2xvNHVKZFF1b1FIZ3JP?=
 =?utf-8?B?VHNlSm5JMFFiRlk3dDJiRCtFNjgzQWllSkdxQWJScnYzU3I3VTkvWDJ2NTcx?=
 =?utf-8?B?MTdzTFRlY3BMSjZaRUFHdTFzc2VYNHNXUmlQb0Z4SmF3MkE4SkhSVElMRzJa?=
 =?utf-8?B?V2NyMm9OSmpVTWF6NmMxbHBzVFhOc0drYlF5QldHKzhXV1ZZTHljT0F6NFRy?=
 =?utf-8?B?ZFFPMjQ4MGYxSngxRjk1YVkxMndpcW1xeDBXTXVTTm0xVjZDcmlxalZQd3Nl?=
 =?utf-8?B?Zi9zVStzeWpLVkNkS3FENU9PMit1YW54UGdYdXU4ZzBmYkNxZ1ZKL1NjcTdP?=
 =?utf-8?B?K2pRZzR2ZzNTOXFiZ2JmZytFTWR2R2RpR2k2UC82cFNCZUtvT3lzenU0TVNJ?=
 =?utf-8?B?R1Vva2FtbjJJdGtIK2lUaGtITkw3SFZyNjRrSHJ2RnNOYnhSSkJhem9zemNr?=
 =?utf-8?B?dCtOcTFlaVk4VHRhNTM1Q0tOYUZKK3gxRFZ2S3JPZ1JRVWtwQzdkSVVxcmh6?=
 =?utf-8?B?UmVwdHdOMm5TeXM5MjdsR2F3eGpDNXBWSzdobzVGM2VGb2F1WjlwSDRoaS9Y?=
 =?utf-8?B?WnlnMHRJUi9EYWxZdUMzNWNnS0lYRTl4VTlFakJxSHpCWmJhYTVFMmtSb0sz?=
 =?utf-8?B?ZnZaRUxCS3hZbThUK0lJNWFhUmZwNm9zVFQvbTRISUJQUURCb0FkQTA1WXdt?=
 =?utf-8?B?cEZremwxclJ4dS9wSzVSb1ZWMHFpVmtNbWhvVHBtMXZKUDhRMXdiWlVhK2xC?=
 =?utf-8?B?MVY2S1BrOFhUaEpMeng2Y3RMcjc3Y2JQeWRuTUE1ckNaRVpJUUFZTWtRcTNN?=
 =?utf-8?B?cnp5dmhnL1JaN1d5UDZrUXVMNHIyUVU4dVBlV1VuU1htdTVXcGF3dnFKUWho?=
 =?utf-8?B?bFJ0V3FGRytaT2FibXlwU3ZybkFTam9nVnBjZDVrMVRvcHNDTGYxZzhZdHBh?=
 =?utf-8?B?SWpya1RUVENOZlJnQmp2N2FNWmFjeVV1SktLSGJMODlqclA3RHEzMW1INjBk?=
 =?utf-8?B?eTVEbW5vVDBvR1Y4ZnBUeTMyOXJKMjhvWlIxM2poYzVsUzdCcmwwQ1o4U0Jo?=
 =?utf-8?B?MHlsTy9MRUVyZ3dmK09HTzBDOVV3QzFvbURuNkRVMnV5VGxzTm5xRzRWeEM4?=
 =?utf-8?B?QmFhTWFHVy9lT1VRUGppem1jTDlNa0lPUkl1ZkNmSncwczA1YmxPeGkvSm9V?=
 =?utf-8?B?dUdjZkdDZXZkZnlqQ0M5RlN3bDVzSGFyUDEyZnRWTjNJb2xleWprQ1lmSDBj?=
 =?utf-8?B?VFdSWjhmaHVrM2JWU0ZiZ0doeUNYeVI5bW9BeUx1LzJIUmgvVUY2bjBFTWJX?=
 =?utf-8?B?ZmFMWkVLdUZQbUkwbGo3bzlyUGt0TGxzRTI3KzZRdWdsMVdodkJxQnBmRDNq?=
 =?utf-8?B?WHE3Wi9oZ25CdmlqcXNsVytIYnhFUEo2cTEzeEV0aWViS0RLZFdLMlF3Vmd0?=
 =?utf-8?Q?0og1KFrNNzMCRLenL7q2INdeF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T2TqqAdxffDpNqbJqpcSCXzVJctTwo4TWaJloCQSQWTUHMYCvXB+8UfttT56oVz3JVIoILoUKNcTb8P+Umn3ejgDAIrYoG2Mn09nx7nZ2cr0cGJMajwVIam7bCOJze2rzkfs68xXEfsOp5hzOMCPzlG8i6GyDqy3o/8tqfVTaRGyWC/stznQKZUL9BOUoDQh/4Cf9wurgXlkU+3X552VMLumYOIGGdEboA7qrqaWCvdNduAnF09xZFWPdkuRMp4zJ+Q8JVJ8wi2XJ81xB6qliQZXo2nIRCkWcZw5zu4QaeW0fiVuE1TY2emgR/jWXRlEG7Q3LzQyjOwytRGSfXdnVapjd0DPwuY+QQgGfSpQt69gJzcq0wBawEk8KmtJ87TVklyiGXjkeIEENO+cuKIdZHfIswZd/0ogrZt1Hxa6w75yuCfQRsvXlOT4pYVJFpaUNyh0SsduTCl1Ovr+dN3DQvlSJEaNyXIo5IIKYDLmNRC661wyX8kLJv+0zxwB3BkVeNxyo8lqf6Ejz72eVWmTzIZESasaHCduVrkHDdCITsCElE2OTiA4eTju7HjaKaFZTVH1WGcfKCjLWHil4zW1kqlfVdqutOsqUuisINCp1y0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0539a29b-ee50-4c8f-06d0-08dcd677aa2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 17:47:42.5527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4s4V+l8b0c04Ulkk9uUx3B5nj1H2aNVguUIZbHyYCX7q/df/q19qs9y8V7RrsqvUQpKJVtGauBlUBA1n8xdACw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_14,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409160118
X-Proofpoint-ORIG-GUID: MzgHZe2BuVzAlWBlEijbVyW7Bd6rw2Q0
X-Proofpoint-GUID: MzgHZe2BuVzAlWBlEijbVyW7Bd6rw2Q0

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

That's dense regex and makes my head hurt, but I guess it's right.

Incidentally, false positive/negative nomenclature is confusing to me:  
when a test is positive, does it mean the test passed or failed?  How 
about false PASS/FAIL terminology instead?

On 9/14/24 11:35, Kris Van Hees wrote:
> The unittest/profile-n/tst.ufunc.sh test could report a false negative
> due to the filter not excluding ld-linux-*.  It also did not filter out
> unresolved addresses from the bash process.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/profile-n/tst.ufunc.sh | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
> index 28b7c05b..13231539 100755
> --- a/test/unittest/profile-n/tst.ufunc.sh
> +++ b/test/unittest/profile-n/tst.ufunc.sh
> @@ -53,7 +53,8 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
>   fi
>   
>   # Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
> -if awk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> +if awk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
> +     sort | uniq -c | grep -qv " 1 "; then
>   	echo ERROR: duplicate ufunc
>   	status=1
>   fi
