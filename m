Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615043BBF2
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540259; cv=fail; b=X2FoOtUL9SmAYuveqydgW8rptnq3tXEupRwqtNbMlsJIGRvs+QNZ8Mna5yITkVOdoidahsvwm/KS3v7WPohyoIPJjUFcOWqao8vU4lceFRlc9GygqMC+8UsgCpcXQlN/KIU9SGvKyz0Tl9IhamkCRwAj95lbntkhviLle6obnjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540259; c=relaxed/simple;
	bh=UqOaXWfpmceOiZpYMc4Hs5DkMSHEpLkEUjZcBZKVpPI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YeqpmhFRBjIEZXjKG61VlYi5S/tCZm8poRGQMZNT+x47JEKM3nOsKXzTfKeDmedwIKvbHrL79kmMx7QxIqKJ6V9qVN95UDHR+p0YeYPvPdPmkPDci8mzejqZRCtQ6gHibwYhF63m49XzbAaRT7e0aTOxwLxiVOvHEqDTFzLbxtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WplBnYbK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IGJzDnCc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WplBnYbK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IGJzDnCc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454MSuVk009023
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 22:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=mdDJ0k4cnAlyQeqEMOYOkjRMhNgiXWqcn5hyE6gn8bY=;
 b=WplBnYbK6mO1ryGweRQhCE3Z1QTjW3/7aWyGUAyWAb2j9sZlnUaz8rnyMvO58kaBigqL
 XcODXDSgI/8OYLGqeK1H+BuYDG00B4rEJ6Ufktwq63TXHqZSPbbLpM6/O++qFuGgIC84
 JwmYzbZdr0USB1yuT801lJZ0N5aOL5KL7SzxNyaUmzpLTQuTkNGpHIFwT7kGthg1CYeP
 5l4rHmk1EdoU0GoEd9FP/MAdHg5bKpb4VS94eV9jrs0Gg48cyQ5vTJSTvvkdDgDRG2Ga
 xItjBuClXeBiNJJKR5k3HvqmV/N3iCdT8puar7SZws1VtTQCyr6pKQI+0x3NCOysyxvc /A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrs801g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 22:30:55 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454LF8IE005525
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 22:30:54 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrme6nns-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 22:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTtL160Ho2wk1agEfn6mTsnxXWPcOdconlCoGWBDmw2KqKX8+YFeg5lXmB2S3B13q1kaFj3inlke3PVb6y+Fl5LXMawtGag3g/VyB1zTJ8evvUBjyQ7o4kmalMq8p7qFCZwzgrB1WLz1f0sgAnmhJ5okrJOxENC4wr3i1/RiCqUfRkR6jZ4uFVE7qu3pi2OB4eafre91GS/FytmjfebkzSQ8N86torJ12qnVpDUza0GreQ5iREalHD9s0AXEQT35dA+bJmPRSuaR7PX4KPQYSF0fpll6HwPlDaOD9g6icajd+PXuL9Mh+iGm6vU67uDYkvs99Qsq/JqdI395bipDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdDJ0k4cnAlyQeqEMOYOkjRMhNgiXWqcn5hyE6gn8bY=;
 b=PDNyxlAqIqD4LEr00VgxO8iHJ/WWR1YUnHTUXCkjaSJoTj24n9e+zhio7qYnhKJfBeETSVnFYVzlG1nymNFbXFqJ4rvRN5h/RLpU3VfILXHS5whfJrWRp7GPmYaggGr+BkarNCnutL4taXq9GvDFKkgLhKYoAcliFFjPtTaCDe7Od070OjRWeu39GSGfmphccTteNOnhy1tpC8OQvrGJjO94q9hS7UPw3iW0+NgH17qpFpr0GZ+rdRDoErQgtawFjCB1X05LDJbwNajJ4RdbSs4b5Z9o261RxYHSzT/JHw0VUopTkafXk7w+csce+0m9CgWds0MYZAzZUVFpiZ22iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdDJ0k4cnAlyQeqEMOYOkjRMhNgiXWqcn5hyE6gn8bY=;
 b=IGJzDnCc97QUXgmCq4o5JqOzkIWl4UqZgg+bh/Y7cL6aFKiv+gWN1ZQTG/WSWpSNwVVpXOJi5FoHTzGcGSHKisSIl5R/8Mtw+ySIUC5AeKfp+CCJzxQdl+TkyIevJtyFbezvluD3p56sNvA6JpIAk3e3gnYLRjJu1bc44ZgqRBQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5151.namprd10.prod.outlook.com (2603:10b6:5:3a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Tue, 4 Jun
 2024 22:30:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 22:30:52 +0000
Message-ID: <b3426a7f-c611-4758-a077-5f3aa81bd705@oracle.com>
Date: Tue, 4 Jun 2024 18:30:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 03/14] Let USDT module names contain dots
Content-Language: en-US
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-4-eugene.loh@oracle.com> <Zl98PpyXNh2aSbCL@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zl98PpyXNh2aSbCL@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:91::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 7911f52c-b586-4945-5428-08dc84e5fdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2tCaERMTFQxT1BlVTMwZk41YmtQemQwT0pjU0JvU0wzTVEzMEI2RUZibHBm?=
 =?utf-8?B?Mlk4SjAvOWJsVU1QNWFKdlMyWllLMlBDRFV3aXdRT0xxWmxkYkhCOWN4Wm96?=
 =?utf-8?B?dXZWaW5rV0VrS2pEQXR4QzBiZ01DNXA3MkFmR3lpQXNpNlJLTHJjb2ZTMzJL?=
 =?utf-8?B?SG1GTkU3Q1hrbGFYSWk5OWxKTXBHUjdNajRwMm9vS01zcXo5R1ZXZDdyN3E2?=
 =?utf-8?B?QVd0YnFHZ1c5UDhsVXcyVDhyaHBOV0NLODFJWlRQZmJCUVBubGxMeU55Z3RK?=
 =?utf-8?B?RTk1Unc5ckkvQ1VlSWU0ZW5kWXBHYUx4M1Y4d0xZS045S2ZnTmRaVjkxZG5q?=
 =?utf-8?B?R2lWQlEwdjk3N0hlY0JWUFlYYkF3ZWhWQ0lXbk93RWU2NFZTOFZ3a0RYWmcz?=
 =?utf-8?B?blZZRk1tcXdEY2RheGw2S1JvMWtrMmRBQ0JJLzRCSmxtS2E2UURnSkhXOGE2?=
 =?utf-8?B?OHc1aGpRc1BFYVdhLzI1WTZiMGkvZXRmWU9ScGcxTnY0RVZ3N3p2dlNRMXNH?=
 =?utf-8?B?N1R6Wm9hellRa09lR1pPYVdGaXlkaW5KMnZNTWJYNE5SWmhzUkhGTUplc2Jj?=
 =?utf-8?B?Tk5vZTNYNXVsb09uUjUvamthNUdiUC8zd0FKTDEzWllqRlBHZTRib1pkY3g3?=
 =?utf-8?B?UStKWnFxQmRrL2NJM0hUUDlud3R2d2ZVUHVRemVJUllUR3c5QW1XVVBkNGpX?=
 =?utf-8?B?NE9iMWljM1k0d3hzZ2tUSC9WZXpiZWh2NXFCN3FjYUJXSXVrZytWdWpSWGZh?=
 =?utf-8?B?ZSt3bmVSeG43a3crUlg4SE5YSjhKRnVrb0ExTlJOMCtNOEZLQVJZWWt6S3Rp?=
 =?utf-8?B?WmpPb01BU2htdWtiM1AyeWc4V3Y4RGtiem1JUEJRaWlDeGlFa2lBSTA5U2th?=
 =?utf-8?B?cXZLSmh2VTFDNndhU2xobVhzV21GR0xNWmNldDZtZVVqYk5DVUIycGRuQXpo?=
 =?utf-8?B?K1A3cko5bWcyNk5ZRmFaUTRmdEhrWkZWeDk2QTVxRTJmRkRta2ZqeE4yV05Y?=
 =?utf-8?B?VUZ4eE1HTXRjUzYwUGJPNkQ5N21WVGhHUWlsaDNWSDRGbWFENGNKa1VwdnFk?=
 =?utf-8?B?eXBMeG1wQ0FNcld5RnpzZldndkdTcElUN2NqVmhHTXdxZDFPd1VNSG82ZU95?=
 =?utf-8?B?cmRRNjM1d2hIRVcycVBoV0NDaFJaWXl0dlVjdEFxODlrZXlXNnhDU2lQbHd6?=
 =?utf-8?B?RTA5WFhtSnFRSTA2d1RCSDRFOE00TVcxMFZjZHMyZEZ1ZXpWUVA1QkVNMHow?=
 =?utf-8?B?MmQ3SzJYNHRMeEtZM3VzeVNCKzVINGQvd1oyK2k2bVczVWMvRXB5R2xsdHpk?=
 =?utf-8?B?YUdMR3ZMYUlzZFVQYUZxZml4eGhiK1hOMlZ6WmdFRzcxOGFGdUNPdnFIaS9o?=
 =?utf-8?B?dFZ4eWFDeTEzL3lNNmtPUXJFcjV6NkwxdnBESFhlM09HdU1YNU9yeVZSVTUr?=
 =?utf-8?B?bTByWWpTRTRPNW5IOHh0b3JoUE5BT2FTeTl0UnBlU2tEM0pMdUZGYm03VHZk?=
 =?utf-8?B?MGFreXNqK2lBb3h4Q1djcTc0M0pKNVFhRm5QVURFMk1vSDdrbWxadXlmTWk5?=
 =?utf-8?B?LzJVOHlCc3pLVDhFL28yUVFOdzNqeHZVSG5UaXVPdEZzVThweC9DTENvSGVN?=
 =?utf-8?B?VG5GWHdLWjJNekwyOTZQbWVySjRFZTgxNGZ5MFpOMFcvbGIvZ25WbkpJd1A0?=
 =?utf-8?B?b09ScVNpUVpMNWlmWm5veXZqUE4zeUcwaTUrS0hjc05KdkdDcmppNlRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUhsSUZRd0s4eXhWUlhtd25reG0vWXIzOGpGSEVSZHhKSytvenlqbnBKMUNE?=
 =?utf-8?B?SVRuU1YwOFlVYnFYNGZoa1hVRFZjMkVEMEVUdHlFbzRqZHhKZVNMNUVwMSt6?=
 =?utf-8?B?RzlmUURkR0tldkpnYThrNmVDMEhISXNDVS83RWtlZ1J2QlFYQlVCcFlhNTFp?=
 =?utf-8?B?MC9GUnFzc1RwNzV1M1JPc2NIdyt2dHVrSyt4a2xvTFVTc3hKcS9zbkRpYk1n?=
 =?utf-8?B?TlcyUjlIY1J4TkJaUklDakMvdCt5dG1qY0VzRUZEdkpTUkxkejh3YXpXVkdi?=
 =?utf-8?B?emRKb3RaWU0xTTYweXhJN09Na1JHRWdYM3FqaDRiZFBuTkpyUWk4MEkxWkh5?=
 =?utf-8?B?MFlOakU0QnVyS2wxUjRkR21mY05FKytNQzhxaFNHUVBVSmdZM0MwL0U2QU5Y?=
 =?utf-8?B?dWJtcU5neFpRRkxUQUUrZlhYU0MvZmJ0R0h3a2p4Wi9FL1R2bzBTdVZNWlhw?=
 =?utf-8?B?cjF4QmdjZWFNS2YwL2d3aHdMaDFoQzd0RWxnRVIrb09tU2ZhZHNmZXltUjVr?=
 =?utf-8?B?M215Zi9SVldRWEFyMWF4SEJqcVc2ZlU2dVArL3FmMXdqS1Mvck1HZ0tGd09U?=
 =?utf-8?B?cE9KQ0RqUVRkOXZhYjhMc3MwLy9PK3QxWnNCU2dGTDFsY2lTZHduVjFpVkFN?=
 =?utf-8?B?R0FNbWFMVU1SM3hiTDFPdFNKcnpHTWt3aklFMjY5N0pZaldMd0s4d08vdU5l?=
 =?utf-8?B?b3U4ZGJma083NFNXZEs3UUIzb0NzTFpZeDNwekpkN3dRWkYwMHpwVHF2cGJ0?=
 =?utf-8?B?YWZObWVoc2pNd3ZLeS91NitCSUw4UkpMYWFpcWdiNnJqUGlVa3ZnU0FGdTFT?=
 =?utf-8?B?bWdUdzU0REFRUnU5aTk1eFNYbE8vSG0rVVY3NllIQlF0cnRZRWhTWG8yTVpV?=
 =?utf-8?B?SUxaOHFFdmxWb0kyOGZrZUVhSCtpMm53TkRLMFhjelRGN0hOUENVM3ZvMUlj?=
 =?utf-8?B?QWE4d0lGcFZNSkhXSHBLT3lVV1F4T2hncmsrTjJ5WURORTJiM3lPZi96VnVr?=
 =?utf-8?B?Z2xlQTY5QW5mdXJrL3JyeHBqTCtFblNaOThJSW1UVHRtZGs4bDB5MHZKS1dq?=
 =?utf-8?B?SGI5bzg4SEUxZkNPRzBEc3RrdnVPMm4yVlZId1diYXFOTXNPcGRCVjVmeWcx?=
 =?utf-8?B?cDBWcFZaMGVxUHlQa0F0L05BVW1sZ3J4bmxpcWo3NGN6ZTRSZ21JWUdQWDhE?=
 =?utf-8?B?bXlHQ0NGblNWOW5TOUlLOXN4OUV6WXl5Qm9aSlc2UkFlT1J3YktCQVlLQWVj?=
 =?utf-8?B?ajRESGNvK0gxRmtJVE1Hc0sxTmJnMnJJZXBsNnVGbE5EOEx1TTk3anMwV3hp?=
 =?utf-8?B?OWtEMkhabTZhd0I0SGZvOVordHhNalovei9SZFR6RlBHWmZHN2I5S3ljWFh6?=
 =?utf-8?B?enpsa0ZhL1FlR3lqTERYMUlheGwvNUxsM3ZMUEk1NXp0ZEd6RlNDTDZqemdr?=
 =?utf-8?B?WXlSTWZZSzJrQzFpcEZjMTFOSWMweGhkVUVuaEtqOUZYVm1JMlNCMGg1WWFw?=
 =?utf-8?B?QXFYcEJkTklDekJwalljamhGZ01WcFdKeU5YMjdPbFJHbk56ckNvTnRQVFJl?=
 =?utf-8?B?OUt0U0FpS01DdFBRNUlMQlp5VS9UcUFIRTBNdFJyUzliTm1YYnViNHVIeTJB?=
 =?utf-8?B?OTlkWHRVYkEybTJ4dnNwbERGZ2wzaEFmMlZUZ0RjdHlmelJROFp5ODZ3SUYz?=
 =?utf-8?B?MHUrUGJsWHBEL1JpN2s2aHAyL1RJOEdTMWgvblc5UDJpSlpTbEpGVHY5ODVK?=
 =?utf-8?B?Q1k2K3piMUVSdjN1TVZrQmdOWUxRZXo1d3p6a3FydUI1RGtGa1p0bDc0OUc2?=
 =?utf-8?B?Y2tOY0VMNnlnUmNidC9DSnRNeGN4UkU0SXFZYVZqU2QybVlsRWRXdkJZNk5h?=
 =?utf-8?B?enFoZDdUNVV3bTRVM0drTmZMWEU4WWNHSlU4S2VwWUdONW1RQW04dmsxV29N?=
 =?utf-8?B?czNBdXV5MjU5NHM3Y0F0VnF4MHFlZFRKV1hEMWZ6d2pJZ2FQeUQ1VFRLSEZk?=
 =?utf-8?B?YS9yMUF1VXcyTDFySERZTC9YMUN3QVNoUCtTOWdzSEN1UzBGakxWQmlOZng1?=
 =?utf-8?B?RS9qV3lWOE53NUsxNGZEMjNwKzFSNlR4ZXlSTHJQcjBmVUpSbnNseHlDeGox?=
 =?utf-8?Q?xKFd4vkrt9Anyn+HJin11JndJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GbJ0yXlAO+WN7VlDNeluOz/gwjXwjItrbq1O0a4jxx49SbrOZ4XqJBV0ye0wcc7oP0p/UDph0RrQNNRxO39nGMrBmByzVSstxEEmdGQK9PaOYpbrcfDdXr7yg2ozkTNMd8rHSmfnMGUvN946rO65SEClqq+88R0fedHs+YlMZ6UGUuqK8peGKWOCyvrPTKM+TngEH/Za+pCm7fVz4NgmskaobHlQXXB0ugW6Lmc9BafQ/pIonqDIksZ4VDLhoMhknraBo9GHn1ZuuTRBJbA2ZnmB0D9PXME55ydjkxBGZdj5Tu7czg7iDehJCSjLgozd6XHP2sv+aoXDfMBvO4Y8G2sHarlWC+vq1Wm5H16rtVTQFpR8RJVkIP3arlzgCrP06VcDLTP+34sHWLTJ71QTV/aW0Iy1YmTyRv44oYN3I6WeMEF5FQzHPCz6CXGdHsoZT5pgVNpvJNfMJCN4sDrfH20KVTmlYyv8/Kklwh+hxVFBKpRQKKjSpy4eqP9yDAleXsMO8ZMLk8LyWx9KgwJjE83xgJpfZlN7YcuIIwoAIZYOb3Nt6ULK31v0C1DSZNq88uOYIVRLBLQe0eBMrLXIbfyocgUIhgDcR9jPO7zU/T0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7911f52c-b586-4945-5428-08dc84e5fdab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 22:30:51.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HGyzmxVSM5IJSND8+TAFRWZ54AEJZdPRj9mYUHimq6ZX7aOQpL1EpSkFBqRycyTRIPtwN9sBA7flAYLmgWANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5151
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040182
X-Proofpoint-ORIG-GUID: BtnHSuLYDQ6S6-lujbHlRqDGxpj53Out
X-Proofpoint-GUID: BtnHSuLYDQ6S6-lujbHlRqDGxpj53Out

On 6/4/24 16:42, Kris Van Hees wrote:

> I do not know what to do with this patch.  Either it is correct and then the
> code should not be #if 0 .. #endif, or it is not, and then the patch should
> not exist.

I was looking for feedback.  If we're good with the patch, the "#if 0 / 
#endif" stuff will be removed in the final version of the patch.

> Consider that the tst.dlclose1.sh test has output like this:
> test/unittest/usdt/tst.dlclose1.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.dlclose1.sh /home/kvanhees/dtrace-bpf-user/build/dtrace
> PASS.
> started pid 68990
>     ID   PROVIDER            MODULE                          FUNCTION NAME
> 97026 test_prov68990        livelib.so                                go go
>
> So that shows that the module component certain can contain a period (.),
> so the module component can certainly contain a period (.)

Right.

>   whereas we know
> that the function component cannot.  Likewise, provider name cannot contain
> period as far as I know, nor can the probe name.  So, only the module name
> seems to be an issue.

There are basically two distinct cases here.

In the dof_stash.c case, I note that we are checking a string of the 
form "%s:%s:%s:%s" to see if it is "." or "..".  That simply does not 
make sense.  I think the indicated code should be removed.

In the dt_pid.c case, we check whether any of the probe components has a 
".".  As you point out, probemod may certainly have one.  But why are we 
enforcing this constraint for the other elements?  E.g., if the function 
component cannot have a ".", why are we enforcing that in dt_pid.c?  I 
assume the issue is broader than pid/usdt.

In short, the eventual point of the patch is to eliminate the two 
indicated sections of code.  In retrospect, the "#if 0 / #endif" stuff 
was a dumb and confusing way of indicating that.  Sorry.

> On Tue, Jun 04, 2024 at 02:11:02PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   dtprobed/dof_stash.c | 5 +++++
>>   libdtrace/dt_pid.c   | 2 ++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
>> index 62418b66..44c67462 100644
>> --- a/dtprobed/dof_stash.c
>> +++ b/dtprobed/dof_stash.c
>> @@ -589,6 +589,10 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>>   							    mod, fun, prb)) == NULL)
>>   				goto err_provider;
>>   
>> +#if 0
>> +This does not make any sense.  We are checking parsedfn against "." and "..",
>> +but parsedfn comes from make_probespec_name(), whose output is of the form
>> +"%s:%s:%s:%s" and therefore can never be "." or "..".
>>   			/*
>>   			 * Ban "." and ".." as name components.  Obviously names
>>   			 * containing dots are commonplace (shared libraries,
>> @@ -604,6 +608,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>>   			if (strcmp(parsedfn, ".") == 0 ||
>>   			    strcmp(parsedfn, "..") == 0)
>>   				goto err_provider;
>> +#endif
>>   
>>   			op = "probe module";
>>   
>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>> index 7c7d7e30..93a7ce76 100644
>> --- a/libdtrace/dt_pid.c
>> +++ b/libdtrace/dt_pid.c
>> @@ -833,6 +833,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>>   
>>   	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
>>   
>> +#if 0
>>   	if (strchr(pdp->prv, '.') != NULL ||
>>   	    strchr(pdp->mod, '.') != NULL ||
>>   	    strchr(pdp->fun, '.') != NULL ||
>> @@ -840,6 +841,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>>   		dt_dprintf("Probe component contains dots: cannot be a USDT probe.\n");
>>   		return 0;
>>   	}
>> +#endif
>>   
>>   	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
>>   		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
>> -- 
>> 2.18.4
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
