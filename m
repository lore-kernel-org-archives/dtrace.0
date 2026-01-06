Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D6629B200
	for <dtrace@lists.linux.dev>; Tue,  6 Jan 2026 04:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767675065; cv=fail; b=aoNd+/3qOFIlS6/pbfXLrLj6TYNCb0JXcqs+9GsiqD8250mCq7yNZnXOYxwNAMu1P2BhGaPlku0aoYw+uih3+1DGFlX+EfuHC+xOMThAJOL6gjIC9Oh7bnpLqCTVFDfKrah8DXbexNZsXoo9cAHZgZkm4Hw2NhVnm0P4X//qxRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767675065; c=relaxed/simple;
	bh=COdiHwext1fQg1BJBFMZWaCvduTLAVOCfpS5JfvNgsY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=djPatvhee6KLwfYSK6qqR71F90T7wNKhEqLFLVv7q50QKpg3Voun+U4Tq7y6qDa3hXvkwYuxi1pRIbaCIabMXf6VMRlt0Zh0+r/iReRLhXBQrEyVNaz701uBuq2KBevrUWbTNh4B5TsBriEAI+7EkS40pxP1kjSyDqILwrFGGgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iP08TXyz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PqOWznpw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iP08TXyz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PqOWznpw"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6064p0iW3542510
	for <dtrace@lists.linux.dev>; Tue, 6 Jan 2026 04:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0Mwcor/anhuglQbLils7CdLkFEIY555CeYbHhUXaDYU=; b=
	iP08TXyzfsJViodlKXhcusjseltu51JM+MlWFSby+M0D/yuWU0CM7BwI96WCdZlg
	ye0yldvpg88WRrqg8/cc9PVXRxP2Y2plmOBOVvCQefSoKQNa+24PdMVJ8bs6H+NI
	xXpDtu87vQrr9Qzwip4O3ya8UA+ZPRfHPWlnvhxWymU4v09mUkypa3CMFw5dqXMv
	tYyYgf1quW75Q8pVknCO6gBodrOEdheOw3MdbcedlSMtYg6IN7XIJJBjJyAydalq
	2dajqcu3H3dIQDmBdbta2tZO05FyOrMsxcLhTrqvitsqRg4K7rigUbtnEaDejAyU
	nL01vE2kaHaFKyklFtM7Hg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bguqf8005-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 06 Jan 2026 04:50:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6061RRdM020452
	for <dtrace@lists.linux.dev>; Tue, 6 Jan 2026 04:50:59 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjj5s4k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 06 Jan 2026 04:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOf4b20/x5Gq3yTV5wn14+NncnwcQl5jduI80taUQqXwA8RjFPEdAM6XM0wkqqT0XmH0D498WtTWdDos9Y9JOZs7nTIAuhHZ/+VcroZC5wrJ/gg7UqLGoNgmBJHFZ01WivZ7FUeybhYQ1djhCGdPy8O+GLayZujT0hNj2MIE9AVqb2UbORmj/amMgmMKGEZkmGFV2Y8/lGUtBBcmnT5avJx2xd/xEZT6niXJhOCnqH8LnNimCCJkfL+u9Yqas6OVBjjVfpNGxjUDcNMFVerDEnMHhheGxWBM1sSmJS6eJMPKcAUkz7yJnsrya9YIydZan6qUnu76KZBzbo9CvwmsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Mwcor/anhuglQbLils7CdLkFEIY555CeYbHhUXaDYU=;
 b=DAalCwFu89f1LVE6qY4BU7b5LsyCeOsRqVhJHwDZ6H+pLRwD1LY1WsRP3gbMt0yiNaHI+Fj8sZtx/VL8YotloPfQxIWAwjAxw4Fqpl/NzKApI2tWKvWbJ4mMGJK4mrLXhxv6xn1yN/bgAlvwfwlP51GjcW2X7iozDMdqqjyOF6+hSiQQFjqITGp45vBsPz3XKElsoOrgomsXEY6zzn/ASbJXHLZlA6DKd+VaL9vEOgEdfEMAnITSCd4WbDOD772HjBqL1X6JaOjhrBX+Cr7utGJDRHJqK9PKrLhma8s2ebnL7AGkCD/MKLPgj3P4X5bg7OJ+PM0RkYmLeD45EudKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Mwcor/anhuglQbLils7CdLkFEIY555CeYbHhUXaDYU=;
 b=PqOWznpwGgacY7NtZA9XgnSv4Msh4htz1/O+k+S6ivqJy73OF5QCpjH+6NqMU2XKdClms2U9tl/i+62qnZVEelVc0DUt9DP4gzjlwaWkoR0ZefCi9PQJAJW71SndU1oaSLSHmvUPTERWlW1t86aEXeqxGPr3kXSwGdmwCf6zUHg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB5946.namprd10.prod.outlook.com (2603:10b6:208:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 04:50:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 04:50:55 +0000
Message-ID: <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
Date: Mon, 5 Jan 2026 23:50:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH3PEPF000040A9.namprd05.prod.outlook.com
 (2603:10b6:518:1::4b) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 064e6093-624d-45f0-3111-08de4cdf2cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDdDQThRZ0V1RHczSEp0dFIzeG9LYnZiNUN4L0Q2cGprV0dIcTFMNVhrUVA4?=
 =?utf-8?B?ZDhHL3drV1R1em4rNithTFFJY09DZkdMMFNObFFwREIxdWp6cnk4M3JxRmM5?=
 =?utf-8?B?cDkvaytKeWlEMFNDSGVZWVQ0dDBSbDl1aEkybE1JN284TFBmb0V1SnhGQ0tT?=
 =?utf-8?B?L2UrVXlhOXRvZVlnUHQ1M0xSY1A2a1hMVXR4aEtUSG8wM2RWY1kxZWRuSXVU?=
 =?utf-8?B?SUpBcnUwOEFEeHBBc1h2MWROWnhEdUJCams3a1hvWFpLYTBQeUZuM0FsMWIy?=
 =?utf-8?B?Y1FDcHo4RkZ3T1puTVlyZk0xTm9TQXc3WjFlcysySjVJbmg0Y21WeWFQNzND?=
 =?utf-8?B?a3JtN0UwUVRrQlByeFErcWFvRDdLWW9IM0JUWTJNd0Nqb0xPcUdsRm5lV0d4?=
 =?utf-8?B?RG9pbm1CTkpWV2VVN2xhY3dFQmg0V3EvaHFZZ2NjY3pOSkc0MWR3NjdibEQy?=
 =?utf-8?B?L1lJQTRYN2x5VVBEZHQ0SUZWeUF5Q3ExTVpRUWdmWGoxYXRhcUxIenZtYjc4?=
 =?utf-8?B?c3AwaCtydjV4Q3ZnblFJOEZDS0xoQlpidEdaU0ZNbFVnclRHamZwMTZwVHRZ?=
 =?utf-8?B?S2ozbnpsbTc0R2g5SXpnaDBKVnhGaU15Um1tZ2lDaWp6UnlOVXV4N1l5VE1r?=
 =?utf-8?B?V01IYWdiSjJHQyt6SmcvU0lpTXZuMklSOEY3WU0rVWpuL1BoWExwMGFpQStm?=
 =?utf-8?B?YnNTZ2NaSERpWUx1Z1VzRVM0SkdKNElqQk1seHNRbUVXU3c3UmVLRWlsZE1L?=
 =?utf-8?B?SWxCR3FjaVo0TFpydkdtbmJaajduNlUrVXR6MDZtMGhKRFJJTW1KNW5XWndu?=
 =?utf-8?B?bDFzZmhwNjQzWlJIdDNOa3d4UElySy9PN1Bid2NFeWFENXhEUUh1NE9lQnJF?=
 =?utf-8?B?Q0xySnM4UzI4TGRIZjVGaWc2OHFxMzRFQytNcXh0aEhaTmdHcHE2VDB4Q250?=
 =?utf-8?B?ekJRSlc1SFZOUnpiYU1XOFhId0JTNHlVMTZGSXY0bzVEM0JTNFFRV3hRRkM4?=
 =?utf-8?B?UWNVYzJhcTI5eGV2ZHRnZzRvb0duUmM1dUtJTFdXRjN3VnZocjlZbm9peUk2?=
 =?utf-8?B?aXkxcm96M2lFWk81R0pKbU1DMDVXTWFiVUsxQ01aU3R0Q3BLanN6ZFBpOFlH?=
 =?utf-8?B?anQycENlOU1FcmV6MXNlQUhyMG9xVGIxR1dyVGVSQU55MTdnenlNdVY1cEda?=
 =?utf-8?B?WDErMVF6VEVidVVnZ2VXMHVyMzBEVWR2NjNUN0RMWnQ1eTFGSEg3L1ovRENq?=
 =?utf-8?B?d1R5OHZ3MmxXakN1b0NDUVdiVElvYkZRVHBLODZBek9rN1VFeVRvY2tURW5s?=
 =?utf-8?B?S1FUSjJBVlhVTGp2cmZyMHM0MUZvb3NObmN5V3JGOWp3dVE1WUQxbC9mZ3hx?=
 =?utf-8?B?UFNQOWVVRXkrWXh3dUlUU0U2dXRPanJyRWV2NTdVUFdjRjByMDIrYjJiZVUr?=
 =?utf-8?B?M2FWVGpHTTVlSkFaTnlrS1ZWRG9NQ0pKQ2ZvY3hwZC80NmJaTWUySjRWTENB?=
 =?utf-8?B?c1NmaHJWWkJVTDRpbWZFT3Y4aHhSR0ZFYzlzYlI3OXY4bEg5dEtlR2oxNDQ4?=
 =?utf-8?B?YjRKYlZmZmJhZ2ZnVnBSdmg3QkR0d0huZ095SFpFRkVHQ3R4U2xNNjlFWWVm?=
 =?utf-8?B?QWxjQlpOVmZmdEpQOS9DTTYyZEc2NjA2SUdjNmtEM3c2UVNNbENGQnNSQmR2?=
 =?utf-8?B?UzNlTFptb0pyQmNhVnRRM1dzOGpRUTI4c2ROdWlpMkh5eXJlb0liVzJnWThl?=
 =?utf-8?B?S1Y3dm90cDdseTU1aGhFRTJ5K2gva1JrNGxMcmx6bEwxOXVnbUJ6YWZOKzZs?=
 =?utf-8?B?dTVDM3FxVmNLTVAzdHhHQmt4MFZ3TDk1YnZNbVpDMGttNnpGdWptdlBoUVY4?=
 =?utf-8?B?VW1iSGN2UUtTaDJSUHVKbS81QzlvMEczZnJIdm9yTHcxS3ZvZWdUYmJwdjNO?=
 =?utf-8?B?eW5pOEgyMXg5N05FdmczSXpRampyOG54WTFVUG9IaFI4YTJXNkdlWUQzZi9q?=
 =?utf-8?B?UE9LT3FCa0V3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWplOGsxZDlSUFNtbDdTOHdyczBIQW1iVlRXVXhNZ0E3NVc4cTN4UE9LWkVp?=
 =?utf-8?B?ZTdPZThMc2YrcjVMWGZvMDN2OSt6S09KS0NQb3ZncXN2bmJSaHhCV3M2bjhr?=
 =?utf-8?B?OVRGRVZuTTU4eFpQTnU5YlpmNWtJVkhTRXpNckFOQXBYZ0xYNnRXRDdncU5O?=
 =?utf-8?B?Sy9jaEMrSFhmWkZLZ0c3dytsZmJXcStvQm0vS2wrOTVzY0Y4QTBESHI3Qkt1?=
 =?utf-8?B?SGNVZmtRRGdyREx1dUI4ZmQydW9BdUhtb1puM2dHNFVYMmRBMHpPMWNsTHJK?=
 =?utf-8?B?MzY1ZFM0MktTQjZrTXFXVVVaTzVOTnJVRDBFZVRiWXVES205UjlYV1MwdXI4?=
 =?utf-8?B?Tmw0Y0I2U0w2bUl6VHdvM25mWjNKeSsvSm1hUTJkY2U2emVubDh0WThoSlN6?=
 =?utf-8?B?bEhCRytGQnY1dEVEYXBCd2ZqZnJXdERQUWFGWDNOblBJTnFxQkhIR3dJTFY4?=
 =?utf-8?B?SzE4U1Z5b2d6Z0RQcS9oWGUybmlHQW10VDA5Z05BcVhZaGlDK2FRVkxNSVJL?=
 =?utf-8?B?YXFYMGNjSXZkTzVGNThsZHc2dTdLUlBkK1Y4TkxKQzZocHZlallMYXBJcmxm?=
 =?utf-8?B?dTUxcDBWSnlIaWJvaUo2OFpSOUFuaUpNWHBNT3l0WHNKb2lVbDZ2VlNIejdG?=
 =?utf-8?B?Z280S1ExbE1obTIvN2o0T1FjWXM1STk4ZURtODZsV09qQmdIaXl3ZkVBWVpa?=
 =?utf-8?B?Zk5PUGRyZG9ENkM1Q1BBOWpiWDN4d1ErSDlJckwzZ0ZXU3lWY2xMeWpHL094?=
 =?utf-8?B?U1VTMkthdjR4ckdtWlZhTGVrZFErRDNwT1FQamVEQ1ZXUVkzSitHVjJTVWlS?=
 =?utf-8?B?eUcyQW1WbWFwM0hSekk4eUw2bXZkQ09DdGR5U0pSZyt3ZnZTUWcwdVZOVk5x?=
 =?utf-8?B?Y0xYeFpudGlzTVFWMEpOcStSNzFnQ1owZURpVVNOeHFPTWhjRkxqaWhmRzlX?=
 =?utf-8?B?ZUMzR3dWdXVTSVpFckltY0hxWUl2Y21HbFh0SEpWQzN2NnZ1RndLTjFnc0Mr?=
 =?utf-8?B?ZHorYWRaRXVJYmw4SThQUUV1ZWdyYWNLMEZaRWFWeklvTjdKVm1vUlJCUU5r?=
 =?utf-8?B?WUdBUHVldHpOZEUvUSs0TEhMbHBLNGRRRHRLRTYxVS9hajJrVEliZDhqQlZ2?=
 =?utf-8?B?cndxd3hoc29SWCsra0dOV1NaU29LYXFpQkZWV09la2pUUXpUK3cvdGZ6RXBy?=
 =?utf-8?B?cjRGOE9hdzdTblZKaEhlM3lBajRtMzN2N3dka0dmazVOdnZmZzdmVUF0Q3c1?=
 =?utf-8?B?TVcwOUpUSTlBcUxodEIyRUJJSXVWZktUOC9Xa1N4UkV1SUlJL2NuQlgxTVBL?=
 =?utf-8?B?SGlINjRBNW9CazdSdCtIazRxZktodDkzbm56WGIvVGdYZ2RySEhqWmhiUHVW?=
 =?utf-8?B?RUpPdzdIYzdsaTh6Vy8vOVA3eE5oV3B6aVlqYnA5TFBVYXNsbXNWbWZWUURB?=
 =?utf-8?B?em1lVzRjVUdmWHFMY0hGd0R1WVFYSUpMZzRFYURLQkV5Zkh6V1l3b1p3NzdM?=
 =?utf-8?B?ckZFM01BRktGSEUvMG93d05lYmhhQ1dtTDJ2QXFOeVBaNGFTdUgxSTVjT1Q3?=
 =?utf-8?B?SzVPWVZPWHc5a3FuMlB5UkliUEdpdFpwSi95aWpvaW5ubFZvL0M4MU9ZTzJF?=
 =?utf-8?B?K0tHbUFic1JraExTaW1EaklEZDRramtkbmZLNU00aG1lcWtaY0xVYVJLS3M3?=
 =?utf-8?B?SHVSUXdtMEF5alYya0d6ejNBUnIvV0tFZ0pGSnBFZ0pscFdUOEtQd0I4aXY3?=
 =?utf-8?B?WUtjbk40dlpJQWMxb2NtSFRHelhLVmcwdU5lcEpMVThSaFBqRS9RK1B0QTUz?=
 =?utf-8?B?OHNHRTNRamlLWWF3QzVrb2JvQ2dYSG0vT3lHdDFGcDdZREdMQWRTK09peVJS?=
 =?utf-8?B?RmZ2N1dKSGEvb3QyemI2ZWE0V0trcS9kRUZ0WEo2NWZpeTNyTzllMUJQaHF4?=
 =?utf-8?B?Uk4zZjNmenJnRjR6bkY3NWd6K3lEMFdmUVgreitvdWROYXhwNjFuN2FNbk03?=
 =?utf-8?B?Rnk1eDdTdDNEUUI1QnFQN1Z5endzVm5CRjNsbnBVTHp1bXVqNWVwMi9QRUdi?=
 =?utf-8?B?cXYzRHBldDRoemJnZFNmUjNQMnE2Y29FR1JmUmpVNGQvNDN2Z0toUXozR1pt?=
 =?utf-8?B?dGRlWWQrNnNxS0JQalJLS1ZqNk50bmtBNkxjTEtKREk0b1lDR29qYkE2L0px?=
 =?utf-8?B?WlE2a0tTK2JUOXJaa2xYb0lxUEZ4RWIydjlUTXB2WHBMN0lpKzNXK2xNa2JR?=
 =?utf-8?B?c2E1Mk9vczlINzJoNlRGR0E5dUp5R2VML0lIRFZYVHZweFgwREtUWDgwN3kz?=
 =?utf-8?B?dUt2T3JlTngyb3FscHB0WVB0NEx0QmhVcWpGRHFDa2w1eFJDOXVkdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fb8iSx2ZMEIWXbi85OYDLU5P2lKk3eLuof46YPKH1gQywyC00KsTG4c3oktC4MfXqeic/zazTQRZHaNBj5yTYTCUeVDjXFedepXT97+/xvLG7y7W/V3e+fowprVpEoLPR4XNJt2AWIEI8rDkUjXEYoYyXbW0ys3EDsWzMVHksXDuFqpKX+Lpxn6YBc3i1mI5wKtirirFrbUiFiSMFojks8j+5IJkGpgwhVWi+bqTaCdpnTkdBhpqhOJ8bWfwOwgJvRtWYJlNMyKeNHR04xnQVNjxW5uaJPk2stxT6vdv0//pTcS9s/6B/KSz63ZUkZWuE9pygJMmdWCKVVHweUZLcwCkfEU4efp/E5zfIp31QIFNFxntC3elfvupjKiHxen5fer9k3/dFOCETuKF7udKuJplgQE+M6Y00xn2piapcTAxqP/gO/90qkOANR+q0UIHyS2S+rbpJZTWO6DwlaggOZwcEaKHY/FcSq5hVWCutJkXrrorseBn/dir7zApwmsjlqup6wwwQnKdwUCtbjif7/hGoEO3tXPFc/xlUqo6irgnpp42NeZEB4G1yNgTjnW4msirdEVR8GJjNxuT31fiumBVrTY4Vg+Nkse53Oy6Tgg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064e6093-624d-45f0-3111-08de4cdf2cfc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 04:50:55.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rO0LqC6YWUGA6eNBTFP1HE2OS+D5cmKqQ/5M1YVtxwNMqDcDmSkUiSoro/156hXOU7sAy4oeE7P9qsy+Viy5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5946
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601060038
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzOCBTYWx0ZWRfX2hS5jqe3988r
 xQXAoljUbyMC6o2lpb5DyOeXoPCFq0HR5o2tzo6QjkBegWIp5Qajq1ViaBDtOzVGOergdM979mh
 8jUP/0OT9NYf4ydoWyuJ8DLTYio12YGot8Dn5oiDKWDvGvfdGgYaBf3bL6Q0aePcetH2xPDh9XZ
 /E7juhLfqsH22je6a/Y2zT4166fKmLSxmk41RZmE34HwrukdD7zsuIsSh4FlO00//8/jNSMwTq6
 PiU7U6PthuSicMe/n1Wl19p5ej8/MDkMfZY/IqbFensqe4sw6prcRexnNvbr5g7S2tVOcWfUktA
 sKDVbASLSIa3dgOey7PHs6KSROIg2jZZMINYD7XFkS/6HdutrJCjH4Y3g5Y5DsqB86jUQ9lPkuM
 9ULy1OCwznX0x85XT0RY+8HZdLP7IYzliF0TOQjNlB5ZdlJvG0DKgiv9FlWA35C3Q1qMiGzre7Q
 w3uE/SgSo/rdtmNfD73ml/DX1+4B9fc/U5hKNRp0=
X-Proofpoint-GUID: zmNV1j4IdAlESmcvfTcvPkxC97PlezxK
X-Proofpoint-ORIG-GUID: zmNV1j4IdAlESmcvfTcvPkxC97PlezxK
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=695c94b3 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=TNmvV0fQjTElBJHd33UA:9 a=8dWqxmioDO-P4xBt:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12109

On 12/18/25 19:51, Kris Van Hees via DTrace-devel wrote:

> Various tests had a #!-invocation while still being expected to be used
> as scripts fed to dtrace.  Removed the #!-lines and marked the files
> non-executable.
>
> Various tests that were meant to be invoked as standaline scripts had a
> runtet.sh expects standalone D scripts to use '#!dtrace' so that the

After "... had a...", is some text missing or garbled?

runtet.sh should be runtest.sh

Some copyright updates were missing.  (Also, the changes to 2025 should 
maybe be to 2026 at this point?  I don't know.)

Is it worth mentioning that some static checkers were demanding these 
changes?

The patch otherwise reads right to me.  The tests, however, are not 
happy.  The following tests fail intermittently:

     test/demo/script/interp.d
     test/demo/script/tracewrite.d
     test/unittest/lockstat/tst.lockstat-summary.d
     test/unittest/scripting/tst.arg0.d
     test/unittest/scripting/tst.basic.d
     test/unittest/scripting/tst.trace.d

These tests fail consistently:
     test/unittest/scripting/tst.assign.d
     test/unittest/scripting/tst.pgid.d
     test/unittest/scripting/tst.pid.d
The problem for these tests is
     -#!/usr/sbin/dtrace -qs
     +#!dtrace -qs
Since these files used to be invoked as scripts, the -q was ignored.  
The .r files relied on that.  So the interpreter files should drop the 
-q.  That does not fix them entirely;  it simply makes their failures 
intermittent.

I'll look more at the intermittent failures, but there may be more than 
one thing going on there.  (lockstat-summary looks different)

> correct path to the dtrace executable being tested can be inserted.
> Corrected the tests, and ensured they are executable.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/demo/script/interp.d                                   | 2 +-
>   test/demo/script/tracewrite.d                               | 4 ++--
>   test/demo/spec/specopen.d                                   | 6 +++---
>   test/stress/fbtsafety/tst.vahole.d                          | 2 +-
>   test/unittest/lockstat/tst.lockstat-summary.d               | 0
>   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 2 +-
>   test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 2 +-
>   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 2 +-
>   test/unittest/scripting/err.D_SYNTAX.concat.d               | 2 +-
>   test/unittest/scripting/err.D_SYNTAX.desc.d                 | 2 +-
>   test/unittest/scripting/err.D_SYNTAX.inval.d                | 2 +-
>   test/unittest/scripting/err.D_SYNTAX.pid.d                  | 2 +-
>   test/unittest/scripting/tst.arg0.d                          | 2 +-
>   test/unittest/scripting/tst.assign.d                        | 2 +-
>   test/unittest/scripting/tst.basic.d                         | 2 +-
>   test/unittest/scripting/tst.pgid.d                          | 2 +-
>   test/unittest/scripting/tst.pid.d                           | 2 +-
>   test/unittest/scripting/tst.quiet.d                         | 0
>   test/unittest/scripting/tst.sid.d                           | 2 +-
>   test/unittest/scripting/tst.trace.d                         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
>   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
>   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
>   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
>   34 files changed, 42 insertions(+), 49 deletions(-)
>   mode change 100644 => 100755 test/demo/script/interp.d
>   mode change 100644 => 100755 test/demo/script/tracewrite.d
>   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
>   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
>   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
>   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
>
> diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> old mode 100644
> new mode 100755
> index be690b56..f4718a41
> --- a/test/demo/script/interp.d
> +++ b/test/demo/script/interp.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> old mode 100644
> new mode 100755
> index 0c139ead..482f272b
> --- a/test/demo/script/tracewrite.d
> +++ b/test/demo/script/tracewrite.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> @@ -7,7 +7,7 @@
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> -/* @@trigger: readwholedir */
> +/* @@runtest-opts: -c test/triggers/readwholedir */
>   
>   syscall::write:entry
>   /pid == $target/
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> index e7dbc3b2..6d3d79af 100644
> --- a/test/demo/spec/specopen.d
> +++ b/test/demo/spec/specopen.d
> @@ -1,12 +1,12 @@
> -#!/usr/sbin/dtrace -Fs
> -
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> +#pragma D option flowindent
> +
>   syscall::openat:entry
>   {
>   	/*
> diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> old mode 100644
> new mode 100755
> index b918e663..d7d6cc88
> --- a/test/stress/fbtsafety/tst.vahole.d
> +++ b/test/stress/fbtsafety/tst.vahole.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -Cs
> +#!dtrace -Cs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> old mode 100755
> new mode 100644
> diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> old mode 100644
> new mode 100755
> index 45c37efe..b54ba982
> --- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> +++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> old mode 100644
> new mode 100755
> index b51e1160..93ddbd2a
> --- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> +++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> old mode 100644
> new mode 100755
> index a4880cca..fe6fe34a
> --- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> +++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> old mode 100644
> new mode 100755
> index 8f7b210f..23caa113
> --- a/test/unittest/scripting/err.D_SYNTAX.concat.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> old mode 100644
> new mode 100755
> index 34ae864c..baeb2901
> --- a/test/unittest/scripting/err.D_SYNTAX.desc.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> old mode 100644
> new mode 100755
> index d3338cfd..bec28942
> --- a/test/unittest/scripting/err.D_SYNTAX.inval.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> old mode 100644
> new mode 100755
> index 01044d6e..72d9dfc0
> --- a/test/unittest/scripting/err.D_SYNTAX.pid.d
> +++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> old mode 100644
> new mode 100755
> index 905fefb6..af7e8ded
> --- a/test/unittest/scripting/tst.arg0.d
> +++ b/test/unittest/scripting/tst.arg0.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> old mode 100644
> new mode 100755
> index 9bbd8e49..527f3242
> --- a/test/unittest/scripting/tst.assign.d
> +++ b/test/unittest/scripting/tst.assign.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> old mode 100644
> new mode 100755
> index cd7b716a..57b75639
> --- a/test/unittest/scripting/tst.basic.d
> +++ b/test/unittest/scripting/tst.basic.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> old mode 100644
> new mode 100755
> index 8d82f2bd..99ec11bf
> --- a/test/unittest/scripting/tst.pgid.d
> +++ b/test/unittest/scripting/tst.pgid.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> old mode 100644
> new mode 100755
> index 2d0499d7..dc3e3182
> --- a/test/unittest/scripting/tst.pid.d
> +++ b/test/unittest/scripting/tst.pid.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -qs
> +#!dtrace -qs
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
> old mode 100644
> new mode 100755
> diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> old mode 100644
> new mode 100755
> index e4f1395c..48f45f57
> --- a/test/unittest/scripting/tst.sid.d
> +++ b/test/unittest/scripting/tst.sid.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> old mode 100644
> new mode 100755
> index 148e5c60..bcc4b445
> --- a/test/unittest/scripting/tst.trace.d
> +++ b/test/unittest/scripting/tst.trace.d
> @@ -1,4 +1,4 @@
> -#!/usr/sbin/dtrace -s
> +#!dtrace -s
>   
>   /*
>    * Oracle Linux DTrace.
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> index 50bbf177..97c0cb6d 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> index 1590807c..206641c0 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> index 47e248d2..38a92e60 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace (1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> index d01ab558..ab7c6ed9 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> index 14cc1d5c..da6e17db 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   char a[2];
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> index 89592786..f57aba47 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> index 43a41440..704b3b27 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   string str;
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> index 3bc21b18..da4038aa 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> index 80a3204d..d0ccfead 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> index 3c120a03..7c15314d 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> index a8c1c4d4..7e98885b 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> index 136f5cde..6e85370a 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> index a0bca73d..2518cd04 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> @@ -1,7 +1,6 @@
> -#!/usr/sbin/dtrace -ws
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -10,8 +9,8 @@
>    * ASSERTION: Destructive actions may never be speculative.
>    *
>    * SECTION: Speculative Tracing/Using a Speculation
> - * SECTION: dtrace(1M) Utility/ -w option
>    */
> +#pragma D option destructive
>   #pragma D option quiet
>   
>   BEGIN
> diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> index 8cdc6ba1..98725509 100644
> --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
