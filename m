Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC692D6E63
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766078215; cv=fail; b=HS/4JkoLTKi/dNY/YzGccZxU44JflwQZTG1i9k9yo1CrT4tMJJwdud7Xzf1J1b7Fn747lefmZ46AwqhKldM4VqlrJEwcKCMWO2SGZg8iABw5PeqwWk2g8zd3ls/yCEBSsJTkFJGz4+jHoB3ff5RFIz+W/2eyTs8IjMGrniM1mUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766078215; c=relaxed/simple;
	bh=EGd6738T9fhpoQqHyKLa+gbiiuGhAJZSmtcCGqa3x8E=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NREHUn6HNE1kh0axPocmMt5bZSLOTPNdaaZBiSiJjd2JEgXOO6Pk6e7c5U2jrjf4j1AHiJolmjU5X++bnM1Vx0vXR6JvxYH3ZQgyFXTwZK/wgZvb0ilygjUraDd4j+4KxOCheIkVyrbziRLk5DT0jvK91R73/XbJDnUs5pzOoYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fnGtA2au; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CXq4ypM2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fnGtA2au";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CXq4ypM2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDCD8U1002706
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=MJ9mLQt4sOOxVxnOb7fS/flO9sympfErsD7BFXYzybg=; b=
	fnGtA2auwdcfi7MBhQNugTX7eBXCnpiEMwu3d+id6vUPqAHmVbNXcEUdpbU3WaLz
	QBVMgCAXBLOWCypN1uYr8At8pXm0VVcCfWJY8iojEDEXSwfI+9vor4uv0FX06Coa
	2T1lqZHw8qQAU8VHuPMtrB19kD1wtw1mZHSYM/xW6pqNnkhsHGCk3Kfgn+wpTK5Y
	8g+dcnltOyCR/smWxkfHxqm94f/dQDa96I6ZHgBECZFrC9a0oTDlwD0O3LMz6Rvc
	tUCaSKCmx6mInd6uJnPEDumkEd7v6ybzMfpYGXxGKdLDRTijjyJEWiqi6g8+UZh6
	8wMR8sF4YwMslBlBDO6L/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47n892s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:16:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIH0mTQ024791
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:16:50 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkd57r6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 17:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2kA4GvQZyxYfNUf39T26VfL1tLPMEnFujCUv68zazij/7QygOhyMoN5R45CIg6ZchAOP2OJuZ6dL1SI7lOWtg1TY4ROKPdOJWsPc1/6geYOfp3ihV9ai1AFd5v/7y/0k6p61e2nHDnuqoESI2T9ELuRiY8pA7MzInBiT59StQ8agRXiGQmUSIqI76OGGZeoEJ7B27cw51Z/HF3jLr0NHWfxCKcUqVLeBhsdERyKneqIBFKqft8Q1ut7PUYFOfWDUXybYmc70FjUtVcoeOLjg0Y7kJ2Y6PY6kLc25ApZ/817xTbHgJhABaRCNQC7Pwq4CbjY6PQb/ecq5w0Q69TCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ9mLQt4sOOxVxnOb7fS/flO9sympfErsD7BFXYzybg=;
 b=rz28Y0vj89nT6mUJu94OiKW/CnZWg4q/7QEpVTRafikXt3bPaA4tCwKNUptefdg541bvtKfpqHvqw63zTfXSGvOy7pQIgPEMN3nahQMX/E9T4sugbZRbjl1mMgqn+XE7pd22o5ARam8NxbXHIL26bLVx4rMzm3FKn3TUQu3pa47mud6BVAq7gYd5MMbuD9jmkcf1Vw2TImh986MIKip0cT33OBbfY8MR5ZJKq7udIq1UoyTJgq19DzrBsiwfXFADpm6l1VH1JlTvoJbOIktnFrTx37PLmQVer8D2xcgQkUZ6NQatGBFqFbWCPMktyFRyvOIvI8ArEg84zo7VlVmTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ9mLQt4sOOxVxnOb7fS/flO9sympfErsD7BFXYzybg=;
 b=CXq4ypM2Rsj85D+hOmhZGppzsnwp4ymag720C5HKDwX9Mj8aBQFM3oHO9t5DJH1ADXHktFLdckN74dOdVmZJB8hWx4L6t49X0y3AKJMDY0AOj9HTCs1UelVy+EM2CgLs99g0MX7Glxh8JQC7f0kuB4sB2BJPeBDsVkwX+evxN5w=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.7; Thu, 18 Dec 2025 17:16:45 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 17:16:45 +0000
Message-ID: <ff893add-3a3d-4acb-9770-c3ab0d9dd424@oracle.com>
Date: Thu, 18 Dec 2025 17:16:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 4/4] options: discontinue -xversion=V as a
 valid option
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752231FDE310C37F66EEEB83C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <DS0PR10MB752231FDE310C37F66EEEB83C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::12) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c43cd2-8eb3-4068-259b-08de3e59382b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGZlNDNaZ1YxVWpPbUprTUVhNUpBb0NOTDRBbEVBY3NOQUViUnBuTzRPNVUy?=
 =?utf-8?B?a0FaV3I4WWtibHhRb0szNXFMZmlTM1E3aTJzKzlTTHJCaEpqZ1BzQWpkYVJT?=
 =?utf-8?B?akdENEF2cDMxZWZhUXBuNnBuQzBTalYrMTk5ZThwRERkWUdPVFhSQm50THVF?=
 =?utf-8?B?dlU5d0lvY3paTkRZdHRIVmxxNWU1bmduZk5wcjdRSGVjZE9IamUwMVRwN2Yx?=
 =?utf-8?B?SWpFMnZwM2svdjhJanNzZmNUSDZTU1BkcEgxNUFxV051UnlqMFZOdHMxWEpo?=
 =?utf-8?B?RllJYlNUSGdQOEVLbTMzOHdONVZROFBYS0V2WHRCWTNac1d4NXJVQWNlaWVx?=
 =?utf-8?B?MFBsWkZYN1pyMmNxdDJMNXc3TEIwaHdacVBjODBVOXROdm5lRGhPeEo5QlZu?=
 =?utf-8?B?Um44TDlzN3ZlTkhkd2JUeGY3Rk9rMzZReTJhZmxGdmRUUkRHYlVHUUlRTnBJ?=
 =?utf-8?B?RlpOQWtQeW85cVg2cm5GMFlFOTdpK01zc1RyaElRcDYxdThyMm5wTGg4eHRL?=
 =?utf-8?B?R3lQelhVT2Rodi9tblh1TGFSN1I2K1RFOWJ5L0RyN1hxRklWR29WdXVZamN4?=
 =?utf-8?B?cUpwa1ZkMC8zS00xYlpWV2xHMTZjbWJmdnlYUFdzY0Fnb1RFTlo4eVBQbHdr?=
 =?utf-8?B?L3ZXUWdEai9HMy9IdWRQWE10V3Fkbk9DRm9Ob3VJd25PYys4aU95OXNad0NT?=
 =?utf-8?B?TG4xMEZzdTBURlZHQkdyOXUrR2h1N2VkL2hBemZSZm5wUHhHU2xSdFRhYmVk?=
 =?utf-8?B?bFN2WUdRMDYrb3M0cWlBTVVpSTlxSTN2K1lLOFhkU0U3R0MwYUVZRWpNeG8v?=
 =?utf-8?B?UlYxRCtFZytlcmxZTjZHaGdQV2NtdWgxUk5WN2JkM2V0VUZZZGdYTE9Ub2VJ?=
 =?utf-8?B?QXNpaUhZVkpXZGZNMndWYlZwZGdERnBtMDF3Z3ZvbXUzYmFsYzJhTm9WZnpH?=
 =?utf-8?B?STgvVWlCUGE0WWRoeURMNnhPNXV3ME9aMlJsY1FLcE9DeXFJbU5OTnpTUkUw?=
 =?utf-8?B?Rm1RejBZZUFVUktaVlJQTlgxYW1venVIUnlhKzIyR1NnYmM5MEFBUjBrRklN?=
 =?utf-8?B?MnFjY0hGSlIzVGIxTVpLaStYbmd3N1FPdlRwYjJsZThYL29YaDRQTXJkNVVQ?=
 =?utf-8?B?dXVMa0FnblVsUHpRL29NOUx1WDdzTnphTkk3STZqT2lHTTdEVTQzLzBnMkZI?=
 =?utf-8?B?M21QTE1UK0JzRjZzblI0WlUwekJGWkJQbXBleWc5bHJLdmJ1SDl2OUZYUGo4?=
 =?utf-8?B?QWtqTHl4dG16ZkxYMnhNVEh3ZGluZ3BsWEJ5akh3R1BUT3FmUGV0eVJGMXpU?=
 =?utf-8?B?U1kyQnlWMmY0cTdQa0JSWFRjcXhXUU9RV1ZXQ0Zibnh5bzlPWTZlN1hOZmJK?=
 =?utf-8?B?Tk1DdmVZdEtGdDh5SW1LL0RLNXZRNzRzTlA4bDE5QWUwTFE2ckJkUmNJNUxR?=
 =?utf-8?B?QnhKbmc2YnZiSEJzdFVpOHpPY3V5TnF3UE9FS2ZtTnIrR1J0TmM0ai9WWWZn?=
 =?utf-8?B?WVFiNTYwRVFCNm84blpYc0RDVXRHelRkalh0YzhydExxK2wyWEpsSWV2ZjlO?=
 =?utf-8?B?dUZ6djBjcjlZUVhYV2t1S2pTdEwyeXhqaS81UWo0dUZPelRJYmlIQXl3S1Nn?=
 =?utf-8?B?SVMwSEM2RUVwcWJSS1R1Y2JpS2tmNnpuUzZtNmxqVnFUNW5aTnJ6Q3hyQ29I?=
 =?utf-8?B?ZlY2M1NFYnlocDQybnMza1d3UjVxditZOFk1NlhEZmwrRXdlQ2dUOU1YVWhQ?=
 =?utf-8?B?RUpLaGxJdnlpVzNqM09ZSXFydlhqaVJEWU1FN09rdC9oV0RhTzJldWFTQzZG?=
 =?utf-8?B?M3kzOUJXVGg5MTBpZnJtcnVKSE5zQU40VTZwVVJnUmtTNWtJNk1DSThVTTJR?=
 =?utf-8?B?RDArUjBuLzNnV1dGZkN0K0x5ejhTQ1lJTmpRbFNvRGorRDVPVEEybGlwK3Zw?=
 =?utf-8?Q?EBeishzRWyaci+PdVoJCvkml3iltXdwz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDhlV0xjTWJKa0daVnkzTm14TThBU0VmRU43S1RWa1pIU2ZMMHozQnlJaW9r?=
 =?utf-8?B?S3dic1RxMnRlZUhtM29nNmRrR1l5V1BRaFdhS1cwN09mTGZiVVZFTFRadXc0?=
 =?utf-8?B?elY1YjVqRGhLVk1qOHE4a1ZHQkttRVJjbzVTRkdnUlBnUGRDTDg3aWljby9L?=
 =?utf-8?B?aSt3L2lFUzAyUWRGeDBiSzFBWHA5Z3dmTitDR3cwOVZPVVc4QjdrWDdrNnhW?=
 =?utf-8?B?K3JDZmJGSDBYTm9zY0lSekZhSlRiYjhSNGNhVDN2MXhRdDl0WmROTXRwbXRU?=
 =?utf-8?B?eVIvVkJtOTZnL0FLb3FhUHZkYWg3aFA2TjZaWnhHSVNzRUIycDZnT2ZDaHF2?=
 =?utf-8?B?Q2ZUb0tmcXY4aVVYcGp6Mk5tNUQ5bVgwMDY3ZXcwVFQrdDh2RWFsdkJaUW1L?=
 =?utf-8?B?cjlaRFhNK1B4WUttSysvNktKdW1paWxNZzVZdk9xT0IyL2YzYkhNdXI0VTNB?=
 =?utf-8?B?VDN2ODE4VzNwSXFWVkQ1SitnU3UrbWI3Zlg4aUJ4VFpqbUJVZHc0ZThjTHFD?=
 =?utf-8?B?YnVCNWd1Y3o0TWZURlNHNWwvZ0xKbVd2d2htcFppR3pYaExQT2JNN2VXNGtw?=
 =?utf-8?B?V1dnbzBWWlZDU0MrWEJkNmRRN3ZKUXNLS1Vld1lXT1hEYkRuZ3RtUlFuKzV3?=
 =?utf-8?B?eHJBMXRlWkorSUFjVjZ6TTlzaDMyMHMzQ0V6cXhQZVdDUDJCTUpUWkFsTnhW?=
 =?utf-8?B?WEhLS3JBdjdTdlAzSlJGNllUYXZSWGZkQlJDM3RjSWQzOG9BNTFWMCtvMDNp?=
 =?utf-8?B?c1MxQlU1dEtoVzJMUVQ4U0xtMWxIQ2w1REc2ZHpVcVh2NGtBcjJhRXEvOElp?=
 =?utf-8?B?QTNyT2Z1NDY2MytSQ2dYVUxvYmpQNVYybnpxd3pIUTBqeG1sRW5VU0ZHWnFX?=
 =?utf-8?B?VWNkU0dYV3dCai9TUmZ3OFlNOWJVbXQ3V1BoQjBVa29iT2djWXZoTEgyQ0tW?=
 =?utf-8?B?WHBwUExETU5tWkVQdW1uU29pWHpOaTFJLzl0WmQxcEZVaU1KN3hZVlJZMUNr?=
 =?utf-8?B?ZEFGSnk4QlJnTEMvVno0VS9LRDNWNFVoR2wzeDF1RUgwaVRXa3RBeERZdWVy?=
 =?utf-8?B?TE1SQTJIU1NkVzBXRVR2Mk1STTVOU2FrR1pwMmZ5Uk5FMVZOYVk2dGwycDRo?=
 =?utf-8?B?bUZodzVDcDJzdExlNUd4aGFOZmR3alc2TnVDejFxcjVrMkliRFNsa3FuTUN4?=
 =?utf-8?B?bldoeFVWeUo4UW8zS05xU3prbWlTa3BJa0ZRajVEdjM3T3luQzFsTnVJNHBM?=
 =?utf-8?B?bmhJSGdoZkJyQXduZWx6RmYvTEJISjQzY01GdFdPQ29xWHNRdUMzN2lFYWZ4?=
 =?utf-8?B?U0ZBZHdLSTE2NGlvMW9zcUJsVGtpRHBQcFJsamc5cm9MclZYZUZLVmNMdnVv?=
 =?utf-8?B?eVZSNU5BcFQvTTlibHpjdlpjRUhCYTNTVG5hWER3bzVFOXZBUUFqdThtSDRQ?=
 =?utf-8?B?NEIwU1hKcjRvaTZLcHB2K1Vyb3RrWTRSZGlJVEJFYVdaMnUxMDdLbFZGdUJ3?=
 =?utf-8?B?QlFscHp1YnlYQytMOE9tdjZuSVRtYktIOHhQV2lsbXFuMUtoZzFMQktuMnRm?=
 =?utf-8?B?TFZwRE84b0YyTVE2QVQxeHVhcC95b28vWk9YTDFtdlVGQ0NmVzUrRjArSjZp?=
 =?utf-8?B?Q1dDNEJHdHFIYnlibVNXWHNwaklqcVNnWENwZXpSNFVoaTRIeEw1QUl0Yi9Y?=
 =?utf-8?B?cFpKT3Jjd3pSM2tXODdlV1hRQ3Vja2RIZGJZK1Vma1l1bnNXQWEvOUN5S21X?=
 =?utf-8?B?MXFzRjdOb3VZQ2NMVnorZ0Y3dkZRMVhvbU5DV0RsNHNrR1V0TEpoUStVS0V0?=
 =?utf-8?B?NmowUjRDemNEV0tiWGhLTE1iUVpXT1Q0WTFkQXlaK0Y1azJ5dk9seHFFdnFC?=
 =?utf-8?B?eWJkZlRMbHlDWlV2UG81L0JtRkJjc2xrU3U4TWt2VWdQeGxqTWZPeWNkQVFH?=
 =?utf-8?B?TmVPaUFHUVlsTnlWOWN2YVpyT0FTRjBNNElhcUxEZlpya3JwZ2VHRG1Mb3pp?=
 =?utf-8?B?Z3ZlTm1CZlBqdnhwZWF0YnhDOGduRDBWNGhIUitDdjh5SVJDaUdWTXB2S01t?=
 =?utf-8?B?V2R3M2ZUdDJlMWtpckpkL1QzZ3JiN1A1M3BzN0U0YkRoUmNMdElEWWhqZWtN?=
 =?utf-8?B?bGcrQ0I1ZnhZMEtHQ2dENGU2VnNyTTlMMGd3Q3NUOW1XTE1GdStwbVpKUytn?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gnd2EVMbb3N9KlzsBeN01CgykWwePPnRvPDh5ktjravSiTZIszzNqK1oH++Gq0ewPvULSXOfhCklv8vBw0AC8iH8/j6yDp6JSGYzRpuE/U+OS7sDMBGPzhcokO5p7EhcBBfimESPdAmdCRUuImsWv8Ovdbp54lKefXxkklOPx6DF+vli+6edOjSGytmsgo+UQyqOP3dCSyYRokDyKXI2BHoR5zXU5ddEbmJ7rC9OKszbf9ai4E8b5iWAOZBuiwZPK9D/mISEwxfXw+b4bvgBWaKDkGQw77Ogw+j4z5Y/EnEPeWRo/APr+exsWqOCOXyltsf6RTfZDw2EScuwSHKmVMT1TOag6604InQnbpaFM+vbdsltEen5NLvmz3r169Pyqwmc9Y4B6bW8S6sV8t7T/HeWLm5CqTdgQhmxXAlrq2n7CAMzytYGY8bvqHO91m2ZBYUQ1jmueE4/Mxmdv4kqIEGnXQ3KeJq+dhD+SeMEyj9cRUwoRTQjfXzZGXbLwFTUgvdWfueCQIqnRSqq2f5rckknSSIedyVF0jugrdgMs17npxkQZ29Dp/yUa6+KXaa0uPW0PAjoA+GxtT1zTxqsM0/+T3jDyCgiscgy8gA8Mbw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c43cd2-8eb3-4068-259b-08de3e59382b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 17:16:45.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DW4Z8DK5vtzOo4oxcI0/EwnklTliv3CkTItJnkFQBBfaRmAcHuGH/d+Ue4L9GF5+H90ci6+x5D6cMER1SwauiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE0MyBTYWx0ZWRfX7MarXWM1sOI4
 qcBUcdchl55P8eQnW7w7VUcXueue9rU+3nuw3odpTipfBwo/ZL11MzYIXIWZsWKOPQxTM1vg2E1
 QVTjAcu8EmGKEwrkWCdrTsiuSVLFQ4mAcQknsGTuMS+q6Q1dFxnv0xVze7z5RiHklJRa5UM7xEC
 aJwvWmuojkfcnTn+L8A5xI6HVeoUtsiBuxEvJGBbId0Loz3nFIeY9BBbXgCGCyLfBsh0v4tgZeY
 kCsHriw6ViSMC081UatyAah1iGCV1pA8EcXTXMYwvJeEf9uT4lndcEb3tiArvCCpKKENFdUdwxS
 mYykcvJW0SO6RydU96nU/c2hHQn9DJ48Vhv+qhI0OwPfGI9SfVl9UCccWfrSHOJLO3WtfkHtBjn
 /EFCbv1X8llutG5Q1fGy9t9XhD9kuA==
X-Proofpoint-ORIG-GUID: Y3TcDHHbEsPtPlqLWb4WnvlDVtR5SMta
X-Authority-Analysis: v=2.4 cv=Vq0uwu2n c=1 sm=1 tr=0 ts=69443703 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=HIgDQite69bs0bBux6IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Y3TcDHHbEsPtPlqLWb4WnvlDVtR5SMta

On 17/12/2025 05:10, Kris Van Hees via DTrace-devel wrote:
> DTrace allowed setting a previous version to operate in compatibility
> mode.  Unfortunately, it was not fully implemented.  Translators are
> not really versioned, and if a translator uses an identifier that does
> not exist in the version specified in -xversion=V, data structures end
> up corrupted.
> 
> Since the usefulness of -xversion=V seems to be less than the effort
> needed to rectify the implementation, we are no longer supporting this
> option.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

wow, never even noticed this existed!

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

