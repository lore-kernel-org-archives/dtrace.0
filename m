Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657311DA0E1
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248134; cv=fail; b=Jd2k5O8M3y5O343/AIP9w+De81E5wGzpA4eo2XUY6vKrot6ihbKs8uH5Ue5ohj26TRDzNBVHneKYHX6H244Vzy3OW6HjTPs27w6WCsGeRYeiN/5XCQ2GW/S5UZ6hdMJ+UhjIUb+M6C6hFVBdiaobQ2kXxZCHEL3fZlDIJu645Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248134; c=relaxed/simple;
	bh=4Mk2gAvSKwt/AVC+X4oJRyXxKUr0Z0j4VtsyxYHtb/o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xb3V9Ocl4rCc5LuVUDRNqX2a/qdBqRhVlWPIr8Fz7XNiTTjZccyPuTY7ysil69d8o2vuKha0uJJby2MT5zMpND8h3LmfcM7XeyQzuZuBkbYnmFaRNqRNJMezjZpB5jm/TV2xJ6RWBT6qj1rxDPuKbgpFmES//Lih9uVM1+9wWfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E8qDJ8+G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r3fCIxDo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E8qDJ8+G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r3fCIxDo"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NICB3L009778
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9FtDvKLNIK0fSyPkPwEeqGPgG/5vacWVhVLK/pwNVqc=; b=
	E8qDJ8+Gj635kA5TXH7Ah9iLAP5cICdJqqzemFADq8MW2uot4NPMB875TcSurUDG
	7qO7fwmdWh60TH2sFb0CZSwHc+QG1XVmeOSst1yPId9CPXXtQorjWt0l1vNlPeeD
	PtTeu78xp1PrX/I7pPv6u7yh+F2kpSHLjcuyy6ZXUTJHFauEozyC7eyJdP/BuKB8
	G7akIjb32PxVXiXh2A0meTrY0wv85TIz/p5nb8l7bENrcGGk38DHumsADJoYXOGZ
	b1aAa996Zeyec/Wy2QP94SjpJmbXsJeOTq7CQgOuD6GTUYiMctRa7WbPgjOCYXiD
	Ybh7d0G5odj3qc5ZuA9gqw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ykah11w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:35:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIONxj012474
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:35:30 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf0tdn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:35:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgkfSebO1eIs5TqvZ+AIn3jCPY5Mf+s/A8MCh0err801ROnTw3RScZZRQZMW8h78KvbKs4fRAooiwlXArFZvHjuNi1XrFSBjQrTMYFJU/Anks5WarzZfYsx1pbX8OorzqdwMrzJphFKAm8EyJyr7b/1wM7d+5ZQVG8NT8RPskl1gZrk7fH7hlOBQNE6FvqIZv6z9txp89q5DNtCxl72NCz+emLOT84ZwuH+FU78hnW3K+MWRZyyKTe1D6/wQb7MOnKVQmfVdoE9dssj/K1FOIb1mPM+Ysp21mqr5I4W26k5FwWHweSeR852qKGZdFfgpnDRnVpF+Yl2Zc31utYX2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FtDvKLNIK0fSyPkPwEeqGPgG/5vacWVhVLK/pwNVqc=;
 b=gImpsg1jZsWGqXT9+FeaJOw3elLiZfuvIkAcV1VVS3UGPwj0Gn6QgorTWNVrsEOKb4OWs5rMJWx1DqniTIJCDyTynvPgAXWqQBh3RVeOIcZGiT4AkHC7TfqrzINwlR5ihATl2eg9z2xK2vtuAuE/bg8dSwoToR+1VpWrItb4PlSByPY7A6xK0c6iePb1oYusnM+ilamcEIA9ZjK+xajA5HXV3/dg4wE47aS5OURbCdUvJXUqBdlj6qRpqvgW6A46B3RbzSITzsG8Bq7Rb/pNkolrugbnrdQhj8jEoLTpD0Wi5MWGp69GZkl/Tl9HloRLSqi2m9Zp5IpHY6Dgqq7Hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FtDvKLNIK0fSyPkPwEeqGPgG/5vacWVhVLK/pwNVqc=;
 b=r3fCIxDohuBye5cfH6FqfMuPBDP88cvAVISilZqo9f7ZGhDBhKGdHRdDLJAqOGSfTAN1s7Xso28Fsfx2up9pRH1NVAuSXBXBE9fojJ22keeEIWmAKwnuCfp4P/NWhxLDL3PLRkJMnql+8OVSbS7BDw9E1YdSCx82S8DZ4WAoeIQ=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by SJ0PR10MB4669.namprd10.prod.outlook.com (2603:10b6:a03:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 19:35:28 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:35:28 +0000
Message-ID: <b51aaa24-eb8f-4302-bdcd-0a1107f6ba94@oracle.com>
Date: Thu, 23 Oct 2025 13:35:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 21/20] doc: Add blank line before section
 head so it is recognized
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-16-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-16-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYXPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:930:cd::10) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|SJ0PR10MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed8b073-ae44-4192-ee59-08de126b50f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFpldStQV0JBYWd5bXFvYk5VQU5OQmp2VE9UU1hYb09BRUtVYmhDNDU5Mnky?=
 =?utf-8?B?ajdpa3o0TFcvT09vWEFIZUdld1UxcXYyNWFkWWVsbmVYSW5hdHVTQzFkMVlC?=
 =?utf-8?B?c2hGdmN0elBZdlpwWnMvbWl1aXZQN0xpYUZOMUZ1QktFOE5DWFRJQXpwdXhj?=
 =?utf-8?B?NzZOWVFBdERpejAyWmRmUzBCV2ZycFBjeWlDQzZKeVAvN2FMbXNnZG5TSHh1?=
 =?utf-8?B?bWhVZGhjSWhzc3ZxSTY3WTllWCtGbENiM0hwem82RG1WQkQwMzhrdnQxNXFR?=
 =?utf-8?B?UW13YlBBZjdVakVyRzl6c3JweW1ndXc0T2xRMWh5S1o4dHl5MHYyMjgyRzUr?=
 =?utf-8?B?UTBDS2dUa3hTK21SQ3MvOC8vRjZyTW5IdmdwbGFscTdUcmVQOTZkWDFIaVlV?=
 =?utf-8?B?VzhYdEQ1VTN6cnAwSFhqR01FMEduOE4zYzI5b2Z0bUJYaWM2MFl6RlNnYnpx?=
 =?utf-8?B?YXhMSHBIVXk0KzloTjF3S1FNTEhwMVVHMm4zalQzam1zdUN1QzFWYlpCTXNi?=
 =?utf-8?B?eVphbUM4TlloRmRiZ3loK3Rmb2tlZXhRQXRwYnNpQVduVWpNWFFxLy9qQkts?=
 =?utf-8?B?M1dPRnhVbElPcllMd2JTb2VBdEdsMjBkOUhRdDRvbmFaSlY5dk1qU2FHVmhl?=
 =?utf-8?B?dHh1ZVVUcGlScmlRdkxwOEJZL1RHa28yV1RqdHovSEp5MXZHRzR6dUt2OWw0?=
 =?utf-8?B?NC85Tmg3b200dEhqK2RqRFRoZXIxSnVPbm41U2ZNTWd0djNYYUVjMmhSajdr?=
 =?utf-8?B?eW5ESmsxa00zNEZaTHpMc3pCUHExVlMxaVBDL2Q3THNPSU0yTEhDd0dZTUNS?=
 =?utf-8?B?Q3JPbzUzU2o4ZmRidSs1dDVoTm54NWJWbC9ZSGhEenhFaEJpaEVVUmozcGhK?=
 =?utf-8?B?VXBmNHJkcDljSWxFMDJlYzRNQi9hY2p0aXNPWDAzVjM3WlBDUjdZTTJGT3Fj?=
 =?utf-8?B?bUVyVElVTGI2bTBmODhZSndnTWRVRmRud3FZSmY0SlBRQUFLQnlORU45SlVR?=
 =?utf-8?B?ZytHazNMKzBwTjlQM2JZeVlyNUFUc3dncmY1WTN0RzU5a3ZyYkxuZjMvQmlB?=
 =?utf-8?B?RFRtak5UL2NlNXNyZ3lQUzk4d1V1aFU0bUZ5Y3ZGb0diOG0wTnNzK0kxUXVm?=
 =?utf-8?B?aEdmcFZiSFN6UW5JOTdSK2tIck4wUVRETDVWa2FnVWlNa3d3VlUrRmVNbzBm?=
 =?utf-8?B?SGhpVDlrQnRUaEI5WFdLTmdFMk1sOWhvaDZEWDE5R2Uwbm4rVWhxbTlmeUR0?=
 =?utf-8?B?cnlYNmN3YkxidTZEUXFTcGtzWDExalAyLythYkpuMTQ0M3FWcldEZnc4ZVVn?=
 =?utf-8?B?RldrMWtMb2Z5c3ZZWFd0RGtLNExUTFZKOXJTUklQM0xDUDRFS0dDQUkwVE9O?=
 =?utf-8?B?NWtONVFIRFZNQ0tpRU1LSjZGVFIrcXJGVzNaUjJmSndHU2NEd2UwaldvSTFC?=
 =?utf-8?B?RG9zMS9tdjFXa25GVjhSTG96NmJZREJSamF4d2JEbnZISVlHUG05a3ZCTDJG?=
 =?utf-8?B?RHVwQTYvMDdZbVVHR08rTmtsR1NyZ1lVSHdEekRYL2pEMnpYcEpoT204dkds?=
 =?utf-8?B?Nm5sMUVDc1BkeU1NUVF0azRzM244SWIrWmlyaVB1amVDem5jTU96d3U3WG1Y?=
 =?utf-8?B?ajByblk5WDBqZ3lqZlpxY0VwbmVCN0RGYlF1dWtST0Zac0tCZ1JEck9rbFJR?=
 =?utf-8?B?UFowU3BzeUNRYk1hQWcvNE9LQVRzaytCVHdtaW91UUV6TXhGZUFxNENDL29Q?=
 =?utf-8?B?SmdDVUxBTm50S2RuZzJJNmdOV2FpSG1Gc0ZUU1p0RWJZM2t3ZkdqdjVDMk1N?=
 =?utf-8?B?Q0tlRjdhUWg1TDJZbVFjQnhJQ0VWT0xUeXQzZTJ2L21rbWdPNzBRYktzRlFO?=
 =?utf-8?B?Mnp1c0ZiVy9id0Iyb2NoQ2xjckNxS3JMZ0pTc204dUE4cGRXc1hnb2NNUHZ1?=
 =?utf-8?Q?ESgHCgRB+SjhJHoWIBtl/6uuRa50k4rb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1zWElXOFNHcUlEVjRMS2J3bXlHclZoQ3ZvRUtzamNLczRTTkdMemZXeXZw?=
 =?utf-8?B?MXBkVWU3QTBuUlZibGFlOFhLd2hQYXNtK1FYZUNXKzZkdlRLdlJHY2xQT0FI?=
 =?utf-8?B?eThhbkFxeE51VVBvRWtwQ2VHQnhlc24vZEFsY256cFJpeVo2Q3hXd1FBdyti?=
 =?utf-8?B?MTFPLzBZVitvTFhxaTFNeWw1cUJLekliY0RsYmFGeGdYdzVvUXBDZ0V2UytH?=
 =?utf-8?B?azlJSFQ4U3VtcVFiTTQ3ZzU5Q0VVMzU4ZGt4RGlBMm5uRGJVRlQrelkvcFRz?=
 =?utf-8?B?M0lLOWgrQ05GS1UvSDJKM1BFSGViR3hLeERmWnUrSWtzcVZVc0hQb2REZnh6?=
 =?utf-8?B?RXM5bkErdjhPcnJONGU4ZndhNGFKc1JmUXJESzJkTm5mbWltUWx2MzdQVUhi?=
 =?utf-8?B?SHZwcUl4OU5CVm1GTlBuSGRhRzR2WTIzZ3pvcDJTZlVySmV3czM3NDcva1Nx?=
 =?utf-8?B?Yy9XWG5aZjN6OWZqaDJJZUoyOEhhWkR0bWR4TWhlWmxXZ2N6QkhuSTdHSVQy?=
 =?utf-8?B?VWk2ZmtIK0c1RHZkZmVlU0czblMzTXh0azZGbWFQT0ZMUCtCMjlvSXZmdEg5?=
 =?utf-8?B?ZDFUK0xMcWIrcUtMK29tOUJQNWU5emY5cVphb1YyampVZzdHQi9tUmdUV3Bl?=
 =?utf-8?B?b29vdy9ucDFGVElFalBxMHE4aTZYSEwydmpSbmtKZzJCZ25idWRURml4a25i?=
 =?utf-8?B?Q2E1bG1EYUFwbnhjKy9BQmJTd0NqRDJHOEJBa2l5UzZWRzVwMTNub3Z6d2di?=
 =?utf-8?B?cnVqL0VEWXNmRHdyMGxkWmxubEVrV0tYRzRLck1WbkhFRkxEZVRENnlMNEZJ?=
 =?utf-8?B?MmttVVFVNndtTXZJSm9xczYrOGRlckRGN0tYNWV1MjAvRFRtQjBWMW9neVJr?=
 =?utf-8?B?TlJaQjBjTzNaM0d3akJ3aEVuRFdVMnVsN0t6Nko5RlVERDhwTWVXek9Lb1I3?=
 =?utf-8?B?eFlnMmFKWG9qb2I2cWREZXNDakRKR1h5eG5JQ2piK2lUN096bHNFL1F4cFo4?=
 =?utf-8?B?QXM4UHJ6WnBBalpTTGVGd2x4d3orckJsZXdyRFMwU3d0QllhVzkzVmlyY2dM?=
 =?utf-8?B?WTl0SytES0VVTHhOd0Z2bFhVaEhOVFNERnZVL3NQNlNnc0hhWTNqU0YvSFps?=
 =?utf-8?B?akpiaTB4OWRBNGdHZEtVMmFSalB6OGIrVWNUUUplYWR6SUN3MHg4Tjd2U2xP?=
 =?utf-8?B?TStMUitoUGxWVGtNMTFaR1Ivbk9XT1BYdEZLby82TzVnSE8rR2JNa0QxcnBk?=
 =?utf-8?B?RXd5MjloQ0d6TXExRnNvWHl0bFYxSG5PbnAyTFpleHVYa2dDL2VvQlJ2ZlVL?=
 =?utf-8?B?ZEpDUjdibVo5TTJwUTZqa1JJVW9wSDFTVVcydENaU0luVXI4ZXVmdEJNeE9v?=
 =?utf-8?B?S3VYMElNbytCZFg4S0QvY3UyVFpXMlRIdThHWjFPei9RbE9tRHAvSUhWNHZG?=
 =?utf-8?B?elVzcGpTa21aSnhYTDE0ZXBmdlBOQ0pQR0tvZll2OUlxelArR2RhaTQ2WVR3?=
 =?utf-8?B?cExSemRSTlhCRzVwczNvR21qc3RUdWJ1dWFmZkM5N3BWcTFYS3AydnhSWFVT?=
 =?utf-8?B?ZW5WVmI4Qlh4Q0M5MmRXOStOaytFYmR0WUsxbklZVW5pNlNIMVlWQlYwZmgv?=
 =?utf-8?B?UElXZmluMW5sY0NWaFNBS2t6S1p4a2ROMmlQQk5OTVRDK3BtZDEwY3VGbTF1?=
 =?utf-8?B?UXdJUjZtYUhqQkppZFg2TDUvdllteDBrUW0vSEE0WC92S1d5Y25abkxadlAv?=
 =?utf-8?B?bFdEejBpT1J1MU4vY3hPOWFYN3I5bW11RFk5QUMyTUlZTWZIckVOVjBmV3Fz?=
 =?utf-8?B?U3pRMDZ0MHFYL3lHQzZyalhGWW0yaEFZUUtXTHAxbG5yOWhHekdxYnFyVUw5?=
 =?utf-8?B?akV1SkxEVlo1aWlRdVExRkNzQURBMG1YVlYvdWxrK24zV2dYY0xYanhYMnNh?=
 =?utf-8?B?YVY1OE81Q2tLa3NMbnp5TFllRkF0dDhkaUk4dUw2eWtrR3BjaVlTVGQ3SVUv?=
 =?utf-8?B?TVRZR295MWIyRmk1ZlRDWGdtRXR5bnVlOFpVU1JHSS9acGM4ckN2azVyKzFM?=
 =?utf-8?B?bXVkazhYeDYyWUdIVExnemUzMU1MUmloVlVvZ3VRRk9nN1RkbGl5T3ZTalR6?=
 =?utf-8?B?aW12bVFxM2l6d1RtbWZNTjhsM1FNc2YzWk9yRGhocVpSdHZ5K2tQNXFhWGJM?=
 =?utf-8?Q?3Rv7DKTk2vreI/LT/nNqbjs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iUJO9g0U+5VVz9+YkS8r5OQrvNXNudMxKZOmqzONlVSAVDcK5s8/6/iQ1RphzTF7NKtBalozu17KjPnwNO5bCp3w3vYr3oD5vPmoJH3pQVGQ5WR6MwWnUxMEvKhC5bTaw/LDN00DwvCsb8BE8j3exD4UHx8g6tynMw3eJzAO1yeX6trVsk7AtvgGefAk931uZRBye6xag4HQgATa/bqE2+EqfnOKR2IHPBqB5EyVjZkntBp/qS5uiYhFqt/veEk6EmgC8DG+177bTC6G+UutL0hL+HHWmjxJdqGF2Z6gV6BE/EiWggQprZeRGFuQt2ZHUUZIRiiXN8suRMDWTtKzRXsb5xs0F5qxCe59LJmll9E3Oo+m382QjU2bkmFdtxkx7GpZLE45UwKGujrK3ykOT0klTgyoC0iGgQ7B0X+SIOfmMKBGZCoBuBeE+FBSKcVpC2YvS8pAVKPtmwbfLOrQYl0XMkuVbRnkSEGQAfdVSFmQAwGJPgMEuX1ZPOH1H6buaOcMVrq0T5Em6wHjLmlboMeXQgR273IjeSaFjX7EePPJ9Pjf1MHKsvxV4NIVbbTM+THItOvfCp4K+l6iRCbYS22Jsh1ubeL8tHln3TgOulA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed8b073-ae44-4192-ee59-08de126b50f6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:35:28.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqvoPcQ9+JDvo4h4wakCN0+sIPEzxHa4BVTleTItkVOg5wbLOx8McPcJyG0dwgT1OCv/EN/hS3nsCNfLoXqW5mD7xjsvvhEZfAF5SJj+2Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230179
X-Proofpoint-ORIG-GUID: pILFGoFwG7tHLj0mL3tCOKbJ1SnT3wNo
X-Authority-Analysis: v=2.4 cv=XJc9iAhE c=1 sm=1 tr=0 ts=68fa8383 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=i9BrqMKFg4cyAZuSC18A:9 a=p3RiT9KDJzbrBh1i:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMiBTYWx0ZWRfXzFjMLTf+y4+H
 cbBSB93J86dxGKzGWCukQusUmbucYI1sfnQgL3s0Vz67Bfszy8aea6jDd4ArEBZyh9oH0zyvCNc
 xqdIbgPkg/WQ4XV5zSZCzYmLga4bLynk/x4s8jOvrTbyKGe4jW7lJDs3VOBGhFsL0NOaLaYOkT4
 sx3MDIwR1nV9LcZyE/sny44obshyJhHmUw6vbZGKfB4exCFO8uhO4s8LWqSk/KI/epbV9KuJVEf
 Bn7lVWCo8CvGtuHRd4C0cVbbdIA+KOhrdYabERwDyDC9xcdfSVPJYZUdR8WykMEg5z4SB2RctIR
 bDqiyWz3JvpZEDhOFm3dMBhQFap5cBPEvbNuDYh3t8UZ+y38sFuFT4cGF6+eZMgkwQfLyy6RLbJ
 KMTObbMxrxq0vmbiW4y/KsQx7SaiMQ==
X-Proofpoint-GUID: pILFGoFwG7tHLj0mL3tCOKbJ1SnT3wNo


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../reference/dtrace-ref-TypesOperatorsandExpressions.md        | 1 +
>  doc/userguide/reference/dtrace-ref-speculation.md               | 1 +
>  doc/userguide/reference/dtrace_providers_proc.md                | 2 ++
>  doc/userguide/reference/dtrace_providers_sched.md               | 2 ++
>  doc/userguide/reference/dtrace_stability_reference.md           | 1 +
>  5 files changed, 7 insertions(+)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> index bb1c49949..ef0910b90 100644
> --- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> +++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> @@ -1151,6 +1151,7 @@ Dereferences a pointer to an object.
>  Accesses a member of a structure or union type.
>  
>  </td></tr><tbody></table>
> +
>  ## Type and Constant Definitions <a id="dt_typcondef_dlang">
>  
>  This section describes how to declare type aliases and named constants in D. It also discusses D type and namespace management for program and OS types and identifiers.
> diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
> index 30c5e6eaa..f93053275 100644
> --- a/doc/userguide/reference/dtrace-ref-speculation.md
> +++ b/doc/userguide/reference/dtrace-ref-speculation.md
> @@ -74,6 +74,7 @@ ID
>  Discards the speculative buffer that's associated with ID.
>  
>  </td></tr><tbody></table>
> +
>  ## How to use speculation
>  
>  The following example illustrates how to use speculation. All speculation functions must be used together for speculation to work correctly.
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index cf64bc28f..d799efd72 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -357,6 +357,7 @@ Probe
>  —
>  
>  </td></tr><tbody></table>
> +
>  ### lwpsinfo\_t <a id="dt_ref_lwpsinfoproc_prov">
>  
>  Several `proc` probes have arguments of type `lwpsinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. Some structure members, while still recognized for historical reasons, aren't implemented. The definition of the `lwpsinfo_t` structure is as follows:
> @@ -475,6 +476,7 @@ The thread is a zombie.
>   The equivalent Linux task state is `EXIT_ZOMBIE`, `EXIT_DEAD`, or `TASK_DEAD`.
>  
>  </td></tr><tbody></table>
> +
>  ### psinfo\_t <a id="dt_ref_procpsinfo_prov">
>  
>  Several `proc` probes have an argument of type `psinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. The definition of the `psinfo_t` structure, is as follows:
> diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
> index 42f318e77..652f2917c 100644
> --- a/doc/userguide/reference/dtrace_providers_sched.md
> +++ b/doc/userguide/reference/dtrace_providers_sched.md
> @@ -76,6 +76,7 @@ Fires as a part of clock tick-based accounting. In clock tick-based accounting,
>  Fires immediately before the current thread wakes a thread sleeping on a synchronization object. Here, `args[0]` and `args[1]` refer to the sleeping thread, as an `lwpsinfo_t *` and `psinfo_t *`, respectively. The type and address of the synchronization object are contained in the `pr_stype` and `pr_wchan` members of the `lwpsinfo_t` of the sleeping thread. The meaning of this address is a private implementation detail, but the address value might be treated as a token unique to the synchronization object.
>  
>  </td></tr><tbody></table>
> +
>  ## sched Probe Arguments <a id="dt_ref_schedargs_prov">
>  
>  Many of these probes refer to a particular thread. For these probes, the thread's `lwpsinfo_t` is pointed to by `args[0]` and the `psinfo_t` of the process containing the thread by `args[1]`. A few probes refer to a particular CPU. Its `cpuinfo_t` is pointed to by `args[2]`. Only `enqueue` has an `args[3]`, and that argument is a Boolean, as described. The `argN` values are implementation specific. Instead, use `args[]` to access the probe arguments.
> @@ -243,6 +244,7 @@ Probe
>  —
>  
>  </td></tr><tbody></table>
> +
>  ### lwpsinfo\_t and psinfo\_t <a id="dt_ref_lwpsinfo_t_psinfo_t_sched_prov">
>  
>  The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
> diff --git a/doc/userguide/reference/dtrace_stability_reference.md b/doc/userguide/reference/dtrace_stability_reference.md
> index f90b91de3..fb3238ec4 100644
> --- a/doc/userguide/reference/dtrace_stability_reference.md
> +++ b/doc/userguide/reference/dtrace_stability_reference.md
> @@ -146,6 +146,7 @@ Standard
>  The interface complies with an industry standard. The corresponding documentation for the interface describes the standard to which the interface conforms. Standards are typically controlled by a standards development organization. Changes can be made to the interface in accordance with approved changes to the standard. This stability level can also apply to interfaces that have been adopted \(without a formal standard\) by an industry convention. Availability is provided for only the specified versions of a standard; availability in later versions isn't guaranteed.
>  
>  </td></tr><tbody></table>
> +
>  ## Dependency Classes
>  
>  Dependency classes are used to describe architectural dependencies for interfaces in DTrace.

