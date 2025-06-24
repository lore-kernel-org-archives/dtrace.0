Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021E2D8DD6
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776594; cv=fail; b=VHfKC4XaPrNqBX57daTVjheosdvkq1L/n9pIGP6oqv+3jHlNv/s1hUYGXVGfCpVt57SyRgMEnOmbYkOyfbiiC70qNm19eQDAwc+EFu6Vhx2B0DxKBx75LzhwQ27soBpSVYRXMfCIaNXB0tNpY+PQGcPQ2EMscqiEYcWNo8X4L/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776594; c=relaxed/simple;
	bh=2mQkeqQ62vrW6wnwHQH/Z8NssYtk1zC0hri/YMKwDDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l85BGHr8hFm+FWIy9QsPhLsV2L09e5hGUPXpKGdGUgIIkXimPTJLEcBTjTmYLhi2RtL5Nn0KwO+NdvUYk3MbSXo1po580ykWfgbxn5HhhYoGB5a6tNIfUetRfKk/+xBLNwGAhq8eFqqV7vn5vMvjXa0o4nvoNEK+QcPNMwOIrek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AnPpiCsB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aGE7yB84; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AnPpiCsB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aGE7yB84"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCiNTo013397
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8Hom+shHSlNHQXSYZH
	Fyuu0D+r/VsGlHOlVjkAU+BZw=; b=AnPpiCsBOqfiYicBt/lKgktgaucOZua0K+
	pIKFJ9QIXrZNYATC2yivjUkMu1TDEb+8Yw/L/OyaRZPgowQaEd6HAgP6ptgYeBr/
	4c65zqtk2Tafu5dZXRpEd5UA1BwfAwXTlNyqWDzd/vM6vmLzPVDlQ/xYYqE6ewrL
	PywrwuliEl2Rqvzu/4kxcOqmaiviVjBnbDT9dQNfH9+kvJE1cZvFvTTL/Q7Ilsba
	5lSWh6Ji/cjoAq4/nsL2qdOLf2gyG8pgBHIB3LYiP7iZtgTSerezfOD8dcRXkQej
	c5hChw/+s/lCZ2nYHKQVHZ9nu5YcFK+x7VeWbYh6JqmJgHY8SLUQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumm8tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:49:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OES25b002062
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:49:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpd7ujx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:49:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeMFJ0iVjHprAOTDIL1KMVNsM81d9xlTWM2opx99tLHBzhN6BK9Kv2+m4GFbjPabrGHqPf7F945usy9unHPsZUMjuN/BPmwNZXxdCqXawHjL4NQE22EsJ/U0GFWgUJpPv6G9VnZPZ7TvXuqk66qKCQHRGdRIHFT9/Mno2HYlXjA9jCH872zHxOFZ6GyF58krXTQb5um2gUAjfhJ6epqtPor6qS3M9HAg950yI7oxcuKGIDq2N+96N3tDhyVWxbDN50xeW1ErZzuSfQcn854BEu5lSX9525uJJpyt/sCMnHu/bsRRwi6nt1+58MZ1aoaN3f3bt5+tE1/69szNCGtL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Hom+shHSlNHQXSYZHFyuu0D+r/VsGlHOlVjkAU+BZw=;
 b=ButdYPyFoGQFEC7c+szQ6xAle1SoiUNJejwZ4+41Q0R0QNSs1KcGYzJgzLJIjyX+StskcMeWJAtANKVll4J920GxdD9OndorD8SMj5zM8NXsToVWx7LdRITtW9PO2RNOlGPcH0tSzNu5EYx6Y1FRZC1xaMhrC7BB4j2EpRgiE6yWMRLmQjdjOmUCtvM76/T3TqCet8jc+iG8XEchLBTfOp9TEcwtMr1/JQROPBjY5fo6C5JIMlBz/xKh9w6eK7Nq5mS9Ird8aZXHrUwvzt23kN+0jfqUerrV0GW8W2YnR5UWj8pBEIPJHoO4W+MNWgK/5uRmzAH5+2MycnAI2I4yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Hom+shHSlNHQXSYZHFyuu0D+r/VsGlHOlVjkAU+BZw=;
 b=aGE7yB8474eilsvMzNVL0xQvfmi5bvFR+ELVm9cOpUobTdhc6Ta7B91oPjAiR3hy38DqD3mCioNm0aHeNE6Fr59LnhD72qzokpAYwEnu/2kKLSUFxtPgfg7DULhgoFhegQQfdmXOyfOWEauQ3nGgKW+nzu0enaOGjaBjc8OBh60=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB6982.namprd10.prod.outlook.com (2603:10b6:510:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 14:49:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 14:49:46 +0000
Date: Tue, 24 Jun 2025 10:49:43 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 3/3] dlibs: report missing CTF and BTF
 data for vmlinux
Message-ID: <aFq7B7evUkbsxJ2W@oracle.com>
References: <SJ0PR10MB5672A28ED52DBF398B01EBF8C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87wm91p6ig.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm91p6ig.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad99ee9-74d4-4b1c-06d2-08ddb32e5ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W4kPwefW44ZX3VycCADAsvbdwP0kKBoPtNEPkU4fF4mwlEV80GkUnxGwC0Sg?=
 =?us-ascii?Q?wda+zL+fRlVJ4kY65cYnqir9Ck5juA+wZDI5L05Hlra7UPYLMMIHhJHQBlRA?=
 =?us-ascii?Q?UaDLoi3FRvsFX8Sv7HUQN65lk6NHbOUCrzaZcc1BaHmDx7GwyVh8jOF6AHPL?=
 =?us-ascii?Q?1C3m9CPo+73/evdxNADn9TNOosaId6qLJ60DSgqwu8r3WPjjTIgZZA9Rr9TW?=
 =?us-ascii?Q?I1+TaMo0Lg0218KuudBPLFObhlonBidnf1gceeDfcyoK2qGNwNZ/B8jtiOES?=
 =?us-ascii?Q?bMnMoBbJpTMIuDTsLLJnuiyQWDnIxenccWYpDRoGlkmu4ShvxDSQ3ZfAQD/N?=
 =?us-ascii?Q?/AxAHyhLgHK1PNid80jBv+Ws9g45ZW1bm+E3MxwzatQoTa+NAPutlVb6AW/W?=
 =?us-ascii?Q?G9yzFsymIxBsdslH1AN7ATITwSsFdzHnxsfyUO3BG+VTrbOqfK0O15ycL7AR?=
 =?us-ascii?Q?yrb5BEj9Ru2KadROh/mFtF+7LCxwGnoYFqSDRy28GQ3dzjVQ6nuywUVlJb7w?=
 =?us-ascii?Q?RkkrR9iqu9ZGLOayvXLfr+8C54PUbmPbQuYfq7dqUfY9fMowaPi2BtUOpoWQ?=
 =?us-ascii?Q?VqF31Iys/K3YP9T/cMyeACBRtGEdO2sVxxwpr9+nCdoMZlKoVXmKABZvyxaP?=
 =?us-ascii?Q?LzMUTJofW5bDEBuicI2bymKkN3KtC0h7yMmoBTUBU2ge/0dqt9sPSZwbs5Dv?=
 =?us-ascii?Q?aUfIFFk/dAe5GYDNnGE5v0SeKWL/KIcpm+64ZYxG2iHm3cAPXQ/gJaO9uRz6?=
 =?us-ascii?Q?Iz3ItMtwUvE9rwcGvbQyvaq7z8lJrJhMjEjb9nga+7uUW28u/W+4zpB6w6JS?=
 =?us-ascii?Q?XD0FZ91kcYWzu8ZqoFhwya0K2NYmRpZcfbvPIQAnE1J3+fRmTYpmxHANZTVm?=
 =?us-ascii?Q?0sabzxKHg80S8NZdq7J7mZOVQt/nrbpdD2syZuOb4Fk4jkwzxAY4HksmGJNB?=
 =?us-ascii?Q?XO3GyzYczEVT3beNi1+8BvB1NNbRnCd6zrLRTU3aR2Hk8UVJlteTK4W6sk1h?=
 =?us-ascii?Q?WtzjOfZXKOMHW1u8NBAiScJr/qb0H1gfNCenUOgZFSK54Y3oyoDRkfIKESC7?=
 =?us-ascii?Q?ZN1G/Qm8vqPAkfwGY1n7gU0ZTloRjLo/OVDJcd/wrKzj+V8+DJZcUU08N6VO?=
 =?us-ascii?Q?ZLtL6BLHqWcn/zvHwJiTA2po9+R20WlqRxMfAiihx6/HLtP8/hXgwpXTAfXi?=
 =?us-ascii?Q?zMGzT9/yZsxBmF6Y3vc76K3+TF65rSln1EqLi1Jfsqt0zy8BoBOK++6UukiW?=
 =?us-ascii?Q?de6Ap17VL8d291nyU8JMIJj0gWHGARV/Ey9+4hs5yaaj0MHa7qMrPXCfZqYQ?=
 =?us-ascii?Q?gZHMIXmrJUX0MiDsAmzj/WvHGrhSbwKp0/amWMtQFo5oLawDG7Rsd6NeKwA3?=
 =?us-ascii?Q?paRUN1s6rGxwQU0gAgHI6l2oZy6V8bIlJU+3IVG4RlCjjWmxXPxsmnG7tRFY?=
 =?us-ascii?Q?Kjk/RuxKDlc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/GGEzXm8nEMKRpUK40B0fFFiVMx93XrgnJ6AipIK9qKFmIixJnvRGN35Y7Kw?=
 =?us-ascii?Q?Fjt4oCUFHRF4pGg83H5oI1X//+eJet+EVcTxi8ZWuaiP0YCVZuPZyGItlSyJ?=
 =?us-ascii?Q?lWtpmRfA6Q4bV/+oJnnhESBJf2yD0Vt3mC77oT+UFn9NVwNTBYWOJftStffh?=
 =?us-ascii?Q?BI53Xt+onD9qGerUZtKbaA9el3043MjVSQh4gwNvjBHmHpylyOHRdOIYwcX8?=
 =?us-ascii?Q?u0DdO9v1wrL928T3mGw/u/yCyfF5Zs9bOutekFTNqf3lcts0vedYTtj62dJR?=
 =?us-ascii?Q?Xm/9xitdEg/y3MeXWhUUApNe8c2h+qlIZHZ41s1HS4wApQnrjuCVfgkKVG6C?=
 =?us-ascii?Q?lblsz7WGALSCJ2RL5bRh9qFsW4NWSv/H4+8pY78JOQHahCqIki3xuLl5UpP4?=
 =?us-ascii?Q?Msznb8p1ISPOQgLWITbbFat6ehL9LG0PyWn9U/1pmimw8JGQ4BnvToYsrzmC?=
 =?us-ascii?Q?WxHy7HZ8YqfiD/ga2EHJ622/RbhceoK70rq5Eg4O+eA19Fitvdmh1g4l0Ka+?=
 =?us-ascii?Q?jzPKFGW3ZKy+RlPjeQTdHAB9xBV+flQgdXjYkBJd4uBPzqo3Czx9SlbC/eXC?=
 =?us-ascii?Q?s2B1nBDBiJnR5iroKQivwdXPHcvLAdsCgZVf+dBuZvJBSjn040CuvyoRXv3M?=
 =?us-ascii?Q?5ySZiC4T3Xfm5mahuyKbJiiZreSYN1/unpafP4f+FyieIasOiSOEBqEO65ic?=
 =?us-ascii?Q?IF3K3T4qBDTh5MbhXTeDYGd03gPKQVDM4GUto5cpAsx9P36yopv1Ut+QXWJd?=
 =?us-ascii?Q?IdY7b8Kx3r6mRlk118WZeZI4FeDahPJ3Liv0NF+zITMnwqolzGdeB2gV4ruT?=
 =?us-ascii?Q?ZIMxeHMsEyxdy7KH5vCpHPnJs2k2UaNVVNlNtitCyZXUfZFsRK1nvKQ2Z4Ey?=
 =?us-ascii?Q?BedDeXv5QP7+iuH5DZ0mo9ZikBdY5o9L8DXwkvMLVEYzVt0v/C3QXqlSLool?=
 =?us-ascii?Q?kAWSNODFK0trIsNSHSbb0xtQAnu3/2UDDIFyA9hWEiZ3o2z8WZHijYDwmxSY?=
 =?us-ascii?Q?1a+gvapwfXcjPIrU+MeKf0K4rU12PMS0yymojBECIWAS1F3Tc7w7dH6N7Q9O?=
 =?us-ascii?Q?d3X03iX7Is6UZ3PU+j6mfmp1Re56AhhnXuExmFU3bKrNsA5vLt5H8r/tcX8Q?=
 =?us-ascii?Q?iyrx7Vsta/l3D2DwvunjgFC4B5KsWpSg2Fouc40qTWcs7qTCAGCm5B2m3/Ap?=
 =?us-ascii?Q?HeMKvccgycK8UlCEV6jhOsERRGODStUNd5CBeWaVJ9042fDZqBeg2pMcAeQ5?=
 =?us-ascii?Q?2idX3hIC/a7NYLKUkdkln/HIZWNZjhtBnqLkdfFnn9xblm2RPYwa113quECA?=
 =?us-ascii?Q?/dTEsmMGSO/GJ2H+8VtykCeYGrbxJK7WyG7Ng2+s+nws2RuJLS9VeBNOEuM1?=
 =?us-ascii?Q?sdaaUsVwcUQW+sJ4cJdeICruYboOwIsAUtQ/TTqEa6ALWveJdfy44mURV3Uo?=
 =?us-ascii?Q?6fv0AqdkUT/qtJNVpqjl9nWOLOs/4l/wKSfGFyYX7kGrkbJX8vmOWA4uJd9l?=
 =?us-ascii?Q?fAAOP0kqWicA+VIC/SyXrW7/4QXiMOrIQlicT/g2QUMkGGdXglxAZCePJfD0?=
 =?us-ascii?Q?aHoeq3ZTp9p6eSwvxCHdrHAdTDHnIo1uDrDNjQOUYeqgXahrS4oA66n4/DZi?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OtGfGS/GLDKGh2E5Z8ov5HknTciuX2EFBAjz7TqOr3MDIVfQ4m2caORhUpCX8JrIwlRbAuQ2EkNsz4gZP0pwjqkIXjkukcF7gYnfBRmJsjQlqoDN1aSkqUohaQ18859fQXyrYpRU25ah8IMyrNdr2u0Z115Qfqdhfj4ttH9gXza1TvchYUJ4Gy6D+duU4ai9URIfObHNdtxXl4JR0OJWo7mWj7Us/J2um4/T++M8+m8Wy2SSShkqa1SzcJB5xgQk+B6Eers7izb+NCikvm1gXKRvLMuTFFc2NszeQynTuJfSKu0w04VeI2pj1CYq9ng7JtwoZjgW7SCLhK+bMfme+Zjv2SH8SQcEzYYRCW+snunhSCn+7cg8Z0B04jG5KWnK9wWOoNmdaEIPujCGDSO/z4jjfhZtNjTJ4Nc6z3YS5fPwtyRWS0SYDBH20NETams3vHH+voVj/9BCH44vjzYSHIFjw2IL9PmD989GHOB4UjgojiN1+4Pj29OKRQTYqA3+CRRkEdImY9fpjOu5L9WHjRzazpXutdINEwwyhGAJF+Yw6itJ2fj6EIAZPsFT97JG+ec2u3gikoE5r1Z4FqLCcmqEYybm6VA4nyRXF41z4n4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad99ee9-74d4-4b1c-06d2-08ddb32e5ce2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:49:46.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12m4x0ZSkp7YXSk32UeSR6v0NGobY3O5Kcj9pvfaY22zUwLdCIB8RE2jGIOOPHOJpTB7sZkdautXdcPmfuReGrr1MYuFzDAqwr3mXXeNqMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6982
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240124
X-Proofpoint-ORIG-GUID: ZowCCxB644KqzQrMsjhHsEh8kiX76Gjw
X-Proofpoint-GUID: ZowCCxB644KqzQrMsjhHsEh8kiX76Gjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyNCBTYWx0ZWRfX/P8AJ0KySpNy QwGTMdr2ZCBNKq54yer+Wu0pFXZhurnW5nshGWjjYASHrZ2ymfpq9pc0S+Oua2AgyjQcIM5ofZZ w9zu0rGW4KuiiQBpT4IGhrQWUt3lBLDsFtwnhZkgusVY8aTh28Iq7ATXS6bUTYUa0NNYJT2f/k7
 PYLq5xL7BSoI7xaNsP6QUG/3xdJkdgfxUgoep8/I4w3vkkyq/KXJPFQGgkiogWSTfIcSNAMWXzn 64eA7ANtdF5rtfX1Zu4Rh6gANmh95WLnKznwHj2gUDSTF/esihrkh+CgtItD4cMs0xmSJJze/1H p4lyFP47Mf5RuDsTkQjC72OUQFWx+5oZ2g4CPx4p3rlbwWk3Z+wFaYbuxSVQF6SHjbhMN8iqIZo
 ItOtv1SCYc3vDmp5qN8W9eHbcxMY9/9/7PwXiH0e6JrHeisGfEtJxRHYIuMj3S+yWx0SGMpQ
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685abb0e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jSUJMxb8MzdQil7SIdEA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 24, 2025 at 03:18:47PM +0100, Nick Alcock wrote:
> On 24 Jun 2025, Kris Van Hees via DTrace-devel spake thusly:
> 
> > If the kernel is not compiled with CTF and/or BTF enabled, DTrace will
> > not work.  This used to result in an assert, which is rather harsh and
> > not user friendly.  We now report a nice error.
> >
> > Doing this in the pragma 'depends on' handling may seem odd but that is
> > where the initial type data load is triggered.  If for some strange
> > reason no dlibs exist (and thus no 'depends on' are encountered), the
> > compiler will complain about missing type information anyway.
> 
> I'm honestly wondering if we should do a type lookup for something
> trivial that will always be present in a hardwired fashion, so we don't
> have to depend on a side effect this delicate (which will fail the first
> time a .d is introduced which sorts lexicographically before any
> existing one, depends on any types other than the built-in ones -- which
> is why errno.d doesn't trigger a type lookup -- and does not start with
> 
> #pragma D depends_on module vmlinux
> 
> like io.d happens to.)

That is why I wrote that 2nd paragraph, right?  If a .d file depends on any
other module, it will still report an error:

	No type data (CTF or BTF) found for <module-name>

And if there are no dependencies (or e.g. the extreme case of no dlibs), you
still get a nice error, e.g. if you use curthread and there is no type data
and no dlibs to trigger the error report this patch adds:

	failed to resolve type vmlinux`struct task_struct * for identifier curthread: Cannot read object file or modules.dep

That is because of patch 2/3 ensuring that we do not bail with an assert, but
instead let error reporting do its work.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> even if I think this feels wrong, it does work...
