Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9445061FFE
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753374396; cv=fail; b=NF9k241VxPCZk1qQ0FmaE0mB9+FQtDeH/sNazUtoRDF+QajWgOxpoCM6gX9m+FCNcpGk8xYMRRxSqYfUOBqljv/UUGSmBvv1akfs2nVpNYhGW02tiBnDMz/Me9TWYYrbVmCDgzkvW2FEBvzTSv5yJNY0lPp8rm8H+qQBE+KLcQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753374396; c=relaxed/simple;
	bh=1eyZO45/eDJOUoIpBw3ZsV7FfY0thpEsHynwYYIjA+E=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fnGQ8LEkoURlaEhKR0Yb6JxuXhli9ixDGDJHlNgqT/57pb1lE/b6FZlVgwJE0F0boaH8azBBGPG1BhJeybaDYvDfb8YZ1dZfZibTLJ3+qdzh0lhL1u8J6bgrOcXziC2MCAehcQnUxOq5rLicmRl/rVdYC0sUWiKkSX6ns3yVArk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F8YnxsGT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IStvhZam; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F8YnxsGT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IStvhZam"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ODRKdp008380
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cXQi2AWiYEKIYu/yPf6xXX3hJD2s3LjWcCSQ01aTYak=; b=
	F8YnxsGTdYUsSAfEvHCfKVupHnnwTN1DeCKyupInDeQSbLqxg7HO9lvYr5w87FeS
	ZnOhcVvgoJAXT7XGSccqNjRgQZDhHRdhBpHyXTuVlTi65nB8QjqKR6hcHhY13ijs
	zqUjmOLjPHsZE5b5O53D/IxYnY9OXwVR/3tiSOda83VhiKhze864lxfBk96wxO8b
	ZubrUYytdlFcV+tPcn5vON+8BUdyj1AEK+mPaByLhblhsHeEqKgwzuxkBdhG4US9
	mvbcdt2el9kpC3/NRPydG+YIxgftblA0atpjUnaNhcYbDWYQkQ4pxwhZ3SOB4v94
	2ZlgEmVC6pWuZ9kLDAk7+g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805txa1re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:26:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OFow6l010479
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:26:33 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc267d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYsZHrphwYtg3VFiSZ41iJb0ofeIupmNotWfz/no7auzAMT9IX+qmTTOwZV4I4qHdhHwAV0SgtBDaZz86vliNx/qVkF+B2AB+SgGl+1EndUQ9yaO8l1cvcz5d8YD14hW6hnsLKmjIPlQbxJx3uCBTq/YjlvstT5O353cyLd5/S8ZTu66/m2QeUfUtoEx1irijIi0/AiNVEPQarbLD9ZaOtIysr3hCHU+lDToXI30AB4TohHlzPUGDclh+mIcRbeo+s3uSBjoY9xUd2CLTypQP3CaqxYF9nm7/aUSjKNvoe8Hs/fywQA9BS0fNgEz8JmTKURJyA7hVGBiPvrUgCOfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXQi2AWiYEKIYu/yPf6xXX3hJD2s3LjWcCSQ01aTYak=;
 b=k18aINuEtC5DGcViNGQS0FUDxpi7WbpJitAfjFGPKxDhnSuU0W4Uo70v5A1jO72DJwk//pNDLO21+4iHlUQanVN1DbiFXnUmeuuWzplE43CXwX8KkFtRL7IcLtCrZmqL1V+P4n2YG8F1P44IroupqrH0ZgQwP0tkJ5AVlalArzuK5pqucgESRNRl6yHp3N+g/y5B2W/V/kspTCvVTb8jx3rkDcFr5uyNOj4UKMA7KBmu/MJqsNc4B+DVvitR8ee6e4y90nqSFAICqNIKkP7quBmmBbwLta8Ol3qgNocuBy4bgN0JSh5Ky79ozK79qwosIDB1t+gFW3SYF3iwr3T+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXQi2AWiYEKIYu/yPf6xXX3hJD2s3LjWcCSQ01aTYak=;
 b=IStvhZamm4j/hadens1Ul2jlebOJo0/OsUZ5LS/bFlYlO/bPpddQxx9Yx/A2xDQXDDvDUl49IG7NJ2g9azzidWFRnBP84qFEKqmxmyfRS8DyCVy9UQud5QXp7yqCG3656LjBBFAoRxBhDivQlJIugLYS8O7nJC6pK5pvsoULRzI=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by SN7PR10MB7002.namprd10.prod.outlook.com (2603:10b6:806:344::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 16:26:29 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::7d57:8572:5b03:dc09]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::7d57:8572:5b03:dc09%7]) with mapi id 15.20.8922.028; Thu, 24 Jul 2025
 16:26:29 +0000
Message-ID: <7a81ce6f-df9c-45d5-92d2-5ed554ba7004@oracle.com>
Date: Thu, 24 Jul 2025 10:26:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] demo: remove demo script depending on
 non-Linux OS features
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR22CA0021.namprd22.prod.outlook.com
 (2603:10b6:930:45::22) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|SN7PR10MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: dd2d22a1-09be-438e-4919-08ddcaced806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFI0eUdscmU2ZDYxdklhZWphSHBjNFJGaERSckJLZnZGUnR1VWhwSEFub1k5?=
 =?utf-8?B?N2V0ZG1oSGx2SFlrVG1IcU16OFZSMC9WVGNvVWxvU1B6eGQrenh3WE9aWmhv?=
 =?utf-8?B?bmFXd0w5MC9nN2lmUjhhU3BFbjN4azdUbEZVa1czc2dwN2RxWkM5YU5pWHBv?=
 =?utf-8?B?ZE5QTDlBcityeTJlNWJ4T2xyWWpLWGJIRDJOTVBaWkhMMm9BUE4yU1hpdGpF?=
 =?utf-8?B?bHpEaWhRVVM3M2tlOUdsWHU2WjVsNTdtbVlzUWVGN1RNLzVBNXczS2NUZUNx?=
 =?utf-8?B?TzQzKzA4MjEyYjRaNXE2VVBKMmZIYmFsQmcwYktQNGNFUEJtY3E4UU5Jb0Y3?=
 =?utf-8?B?SEtmQUxwSVRIMnh1Y1cxYzNqcDRxZkZsUjRsOGN3WUV3SEtzWlFBKzE0RzJM?=
 =?utf-8?B?R1BOcnpDSzNCckkyTzFFcFZQUHYreXRNaDNUQW15TFNvaitXZFYzcXozU0Vm?=
 =?utf-8?B?WlBRYVBPL0dkSGdpSWY2TGF4M1FjdmxqMm1oTjZ0YWZqQnZGM2hybklWTUYy?=
 =?utf-8?B?UW41WjFNQ0gwSUJpR25scXBWeVNZWFNSYndPcmN1MVRWL3dIa1ZzN2pydkhn?=
 =?utf-8?B?MTlWWVBFU1paTUo1aG5UNXc3ZFdBaFRHbHREdGhranl2aVNsYnUrclk3bm80?=
 =?utf-8?B?SXhYZklyallQTlM3YnZ3Y2pURGdiK29IVlJ1QXFCcHF4cXRjWlNQM0h6alZL?=
 =?utf-8?B?cTh6cFRrd3lnbHhaRDg0U1FiVFJPRkhVbUZGYlpqODhUeTFFN2ZBSWFCdlEv?=
 =?utf-8?B?aDhZd2c3dVB4TUxpNU5wa0dwN0ZnUXJNRlNaT3RpMXJZSFo5dTFBVkQvaHJm?=
 =?utf-8?B?Rk9KWk1BWUQxUGZxUzVzME9FamZlMWU5U0lkRjV5YnRIWjl3UjJIVmRnajNs?=
 =?utf-8?B?NldyZHhGbzBnQ0hwR3J5UDE5aW5hUXdBTnRZQU5rZ0IyTGF3eGpQdFBLQThY?=
 =?utf-8?B?SjVUV2lueXBJTGt3NUM1NExOQ3IyUmg2WGlLN1dWcmN1QnJrM0RPT0J2WUJZ?=
 =?utf-8?B?bWxmZWxQWFgxUFA5ZVcycVYxN1FwTlFERkxaWUV6UWdhTzlJbHVZNStRWXlQ?=
 =?utf-8?B?VDFBRXh3WDJBWGVjbVJ5WUNueFlXbGpTcnRZYU9qWFBOMUxsbU5PWDR4N2Mw?=
 =?utf-8?B?VEkwQzltMlR5UytNbDBaendUSnhVZHozd3BBZ1dPK3R3ZURMZkZKTUxlUTRD?=
 =?utf-8?B?RXFURzA0cno4ek5Yc1poWWdOV0dYWE9YU1hxeXBzcTgrdkRIMWJRaHBrV0lF?=
 =?utf-8?B?aXh6SkU3cDV5TUJmYnMxOWtjRVRjUGN6SVcxa0JhVnRONzdseUllVkcxWDA4?=
 =?utf-8?B?NW5vYzJLdkhCcUYycmFNbnUxQlZPTzM5Wis2UjNtQVRkRFpCVDlqTVM3Tm40?=
 =?utf-8?B?WUJ5N2dtTkhoa0UvNm5QLzA5blUyQnE4SVFlMWxiOWFoU0d6aUErNnhVNUxm?=
 =?utf-8?B?TnZMSnk1d2k5UjhPaDY2anZCNmhJeTR6TXhqS1JEa1Aya3NtU25JdFdFODcw?=
 =?utf-8?B?bnlyZEc2MkZDSXFYLzFScnVFd1dOUHFJaWlVR1VpSktVNktyWUcxV2psNGht?=
 =?utf-8?B?cjg4NEVqdmlYWmlyZDlpdmRLalRBUzBCODhzK1pTWW1uWWlRU0g1eHB5U2Fj?=
 =?utf-8?B?OCswVGlwakVBenFjYklGVG5yZDA1dEloUVpOeGJHT3hFSWM3UVl5MzlaSjI2?=
 =?utf-8?B?WEs5b1BUMVBZVFM2cEltbHcvOUEvRmhZZUxPem5tR1hlTGo1WHFrOXFBTFk2?=
 =?utf-8?B?RmZaOEZiMTIzMU5hdWZDOVA0ZEd2VUhXV0xOVUVWNkpCa3ROdkljRUtGbmQ1?=
 =?utf-8?B?WUpkOE50ZGRHV3BXSllMeHhzWG5ES0F0d1ZBc2w0OHFiUlZTeW0zbzlTbStK?=
 =?utf-8?B?SmlQeEd3R1Rub0ZLOTV4WXMxY3FaY2lhRHNMRTFKWW1FK2JyYWY4Tm16QXBi?=
 =?utf-8?Q?HMiMzshw9FQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3AzR3E4MWZKNElXYWNUZEVSZlZHYklVc3RyUm9TdGZyYUxKNHl6RGpEYmFY?=
 =?utf-8?B?d3NhYzBRTEFBeURJSE9HYyt6eDNRUmhKQ1ZJeVFPNXhvMFUwcGtGM0tudkRZ?=
 =?utf-8?B?UzNHQzhuVmZQZUlBbkMrcEdlV0Y2ZW95aUpuV0d5M3pub2RnVk9RUGRTemF4?=
 =?utf-8?B?T3YwMDVhNlBXNUtTR1VjUFNjeVlhQnh3VjFnMzB0TURKc2d0SHErOFNBdTI2?=
 =?utf-8?B?NmZ2dmJBR2F0U1FmcHZ3ZUVjNFgrTjdYTmloZFYvelY4QTAxdEIxUjRtMldH?=
 =?utf-8?B?SHlvU3NZVGtYMk9mdHM3eGlBUjc1QjFhMEkvVVNyMThXQmNFMHpDSHhJVmJp?=
 =?utf-8?B?cDRUNEFCOFBCN3gwaTRkRkVsZlJjUk5wZWp0VENlOG0xSkhGK3V6TzZaU0VR?=
 =?utf-8?B?dm5wZlpHQ2FIaysrckYxcHhNK0xKRE5rTWp2RVVXSUIwNDUvYjlqTUVMcmti?=
 =?utf-8?B?Sm9JTy9ObldNdHVxMTVUMGtwR1l1Rzg1MmhHZzN0SGNqVm1nSmZIK0g3UXNo?=
 =?utf-8?B?Y2hjbVoybDlTd2tINUJGRGJGcEZnMXcvKzBOa01BT0k0bWFxVWVmZlRlSzc2?=
 =?utf-8?B?K0RKYmh6eDQxRkZqSWJud3d1VEZFNzZTR0FacHo3UnJ6U3kzYTRpZHA4cGNB?=
 =?utf-8?B?WDFpcDdEODlqY1IwdzhUNnVTb1FVZUVNM2xaUmkzY1lhSFRuamxDa0RxNnlU?=
 =?utf-8?B?QjBOR0hTbDFxK0ZTOXltMk5KVDA2VDlveThJUGlLV0JJNmltQW5JVDN5WWEz?=
 =?utf-8?B?OGRhSXNlZGdJTlVwemRHaGNYWWw2SUhjekE2cXE3RW9SU2FtVVJEOTNLSFZx?=
 =?utf-8?B?bWloWkkzSFJFcy93VERZZWs3OTdtb014d29Wbll0YVJ6aDA3ZFQ4MS95ZENk?=
 =?utf-8?B?OWFzOU1tRFI4MS8rRjBNdXJ1ek91am5SWlcyOWhNOXdQNnZiQjV4dTZYc0JB?=
 =?utf-8?B?d0RlZysvMllaK3ZUaUszdHlXNXVWVlovdERrbWhmdDFDeWYxSXN3ZTlVQ0Z0?=
 =?utf-8?B?cHlneSt0VW9OdnRCT1htKzhKWlMzQzEyejRTK3YvcGcvSjJiVkM5WE9ScjUr?=
 =?utf-8?B?cXJpTG9MNnU4ZVBOczVUV1ZPQmFDSk5CUGNLaFJ2WWEyKzFRNWpNLzhLZjh3?=
 =?utf-8?B?N1BWc1hYVU1BZlBZMmNWNGlVY2NHVzhYQngyaHNLNEtwMHdsbnlxdTZrbG5x?=
 =?utf-8?B?RGU1NW5YQTdJV0t0WnhPdEZ6SjlqUGdjOXZyODFJcHVuZm0vNGVITEg5N0lX?=
 =?utf-8?B?cWh5T3pKNWpqdnlSSzMwWW1YN012QTFVUE9nT09wZ3pVSEVhTU1jakVOTEdL?=
 =?utf-8?B?OEswS3grSmkyWjdpSDh1RisyREVZdDlvYmpHeUwzNENXZmt3bXl6ZEN5RWVl?=
 =?utf-8?B?RFhLZUtRTXBBR1hJYmI1NlkyRE9hbms2YzcvTGttTEdPVy9Td2YzN0o5VDd1?=
 =?utf-8?B?cGNIbytoL0ZPN1NCdlhhTkF5RnlCK3hrTE9mNUJheTV6cmxxV0U3SGJEV0o5?=
 =?utf-8?B?MEdoSWZDZlNQUTdwaGQzVzBwVmRwZDFrWVpLRmtRK01ZUG0vTWJ6NVdSWXZy?=
 =?utf-8?B?WmpOaW8vVC81QlVqUHNSRlNXMUN2cVZEQWRCamRpUlFZYmg5UE5QMUl0ZXU1?=
 =?utf-8?B?UzVyeDV3emQ1Ukh0UGZ2NTZIczNTa3pDdVFCdHkxYTRjTERFZVh2WmJ1TWlN?=
 =?utf-8?B?TWluVmJwMVRPbjY5ZENqMlphN1VyU1EzK0J1N2VvdUl0anZrc1pHT1JDdkti?=
 =?utf-8?B?c0xla1I3RXhkVHdFQnlkMGJZLzVYV215QmZkWGN3Rjg0WjMyQWpUK29NY29Y?=
 =?utf-8?B?cHc5cW9NcWFhNk9jdXpZVmRNRXlDaVZnYkxZVUIvdzNoZlg4bklTOHMvRFM4?=
 =?utf-8?B?SDBqYlpwMHREWXRObUVSSDYzM29MdFpKSmFoc3BsOGRKWlY4WnJucUJlZVlZ?=
 =?utf-8?B?THY4Z2pkZDNIdDloSlJsMXdJRzlkVzhqQVZNVlhOZmxlT2JYYlRWdllvajIr?=
 =?utf-8?B?SGJxeFpaejhiWk5YYzZqbTR3NHo3cldJb3cwc1VMYzE1aVlJS0IwczZiVk5I?=
 =?utf-8?B?bmtxbzM5dFZHNEZ3cXhPZHlkMDg3UVJXbFBTOHBGVSswNng0QWRxZDlnUXJ6?=
 =?utf-8?B?ZkhFT0pJKzdKalJUZHBvWlBkSjFFTFRaUEFxdXBzcEhpVStnaWU4dnRyc3Q2?=
 =?utf-8?Q?ifCQ/I03/K32p3HnGT80hkc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nGaRJtH6SFOXck4fsIwYS6f/BQuBgHRmm2L5KR97Gpc5gMbxgNFO8vQomLghmG7jWahwrggo29Xmg1u1PNg5yFdMBMLA3ErWgbf9QcTUWWJivQSLnnDrJkYW35NRSUPbry8KuJ9C3YJFRVCuV1TpdPD3shtFtkBn/7si8PfxcjC13k7KN1C1efDglc8JX8ikn8XuelwgK5tY1q7l/d6BTI5rLphniq0i/KeK66JyulWpIz14xBfRg6TU1n/GjVaVWuhVMw9w+cozmvIW6HQnql6CgpmL18nwdzS6Zv4pC+Lmyg8yGqZjAAwjk0dczuIAWBjr+SZ95Z2rncBLqwBEYQuQKZ8fScYwBMxMxKwg3b8QOcZcvF687UGmOQWjL3fOgeLAwnRUZOj6mwo/48gG7vzakdo91HQhKMaLCuV9kDncT41iNczGJ6++xyz1ZTOhe6nUCkO7vbDDnwAouJuDr9vBut11uNMZrUjlJGO5ii0HWf1/W6PLh+aru7hk3HnPoInLM7tDYaDpV1viakIXccboEqXWk72YBva5mAj/5mOfYU1OgtiVRjd+O2bM4z4wD6vThiPtiOV0PUnepDBDejasUKTcXXpJeCXRnpeHshM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2d22a1-09be-438e-4919-08ddcaced806
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:26:29.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTbDrmw6n70pJKmXojHdaKGn9IdAl9sGnGlQgFm/pUwvJgUrxia4gETJM+aTVOPPFS7jLxWHOi3KR+TDewSeTItjnEQmGPVWheY6eih97ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7002
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyNSBTYWx0ZWRfX0pFepFGq7W4d
 TZ3GM9Pp1A7u6dTyjZEWLMWXoFax6dvB2itlW04uvcQxf4uhdPfFRUnXXWXVovIOaV6b7K6k+Gy
 5raFE7BuDy4R0gIk+HVIAWjuG8o+95BaG9crC78J3j2+xPeLw2DjQAQbPyMC1+lnyOGu2ncToH7
 GMBWq9mli5pl3XKyOZ7uHeMYua/IA25Qx1fqCnwHd4FeCojUwKIuuYpl38XbBdOJmr0sEfQVnoz
 Q8fj3Q3CiZx7WoFjrfmJS23Ajy23cNjqDmDldBiFFVnQkyOt6dt8lr+fUGt1Zk2Dt8mc4OgToQu
 2e81Kt/cwpasKTDOcxPRK8zWgc9mBAkjvRfMIoBfATJRiHYU67RK0QnFzSTHDx/kgN7i+V5uoOT
 POgxR0b2nZDG8s7GJUUBGN3NiCcFXYftfn+/oIlGp/2x1mJtNVSz9qIU5gd1mU671Adn0/d5
X-Proofpoint-GUID: c58S8c7qFabiWlUo0IH7RW8Ghhy6kcaJ
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=68825eb9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=oytnJzJz0jb8Mu4l56oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: c58S8c7qFabiWlUo0IH7RW8Ghhy6kcaJ


Verified that it works (gets rid of a warning at the end of the RPMbuild:
RPM build warnings:
    absolute symlink: /usr/lib64/dtrace/testsuite/test/demo/struct/kstat.t -> /usr/bin/mpstat

Reveiwed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 7/24/25 9:50 AM, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  test/demo/struct/kstat.d | 29 -----------------------------
>  test/demo/struct/kstat.t |  1 -
>  2 files changed, 30 deletions(-)
>  delete mode 100644 test/demo/struct/kstat.d
>  delete mode 120000 test/demo/struct/kstat.t
>
> diff --git a/test/demo/struct/kstat.d b/test/demo/struct/kstat.d
> deleted file mode 100644
> index 1ccc3bb4..00000000
> --- a/test/demo/struct/kstat.d
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/* @@runtest-opts: -q $_pid */
> -/* @@xfail: userspace tracing not implemented */
> -/* @@skip: solaris-specific, not yet converted */
> -
> -pid$1:libkstat:kstat_data_lookup:entry
> -{
> -	self->ksname = arg1;
> -}
> -
> -pid$1:libkstat:kstat_data_lookup:return
> -/self->ksname != NULL && arg1 != NULL/
> -{
> -	this->ksp = (kstat_named_t *)copyin(arg1, sizeof(kstat_named_t));
> -	printf("%s has ui64 value %u\n",
> -	    copyinstr(self->ksname), this->ksp->value.ui64);
> -}
> -
> -pid$1:libkstat:kstat_data_lookup:return
> -/self->ksname != NULL && arg1 == NULL/
> -{
> -	self->ksname = NULL;
> -}
> diff --git a/test/demo/struct/kstat.t b/test/demo/struct/kstat.t
> deleted file mode 120000
> index e9f7e5b7..00000000
> --- a/test/demo/struct/kstat.t
> +++ /dev/null
> @@ -1 +0,0 @@
> -/usr/bin/mpstat
> \ No newline at end of file

