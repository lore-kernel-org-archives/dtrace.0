Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48A204F78
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733259977; cv=fail; b=e505EfOKYsexLSmNZ4v/gNTJtlOtatQwmmLDT5d1EJNrCAS066OudEYjdGbbkdIR4oxhL5ecWsSWMolBuJfQZqkditnzDT5A3FR7AD8mUD0RaRqOs47m8BIxqOSf5rqsoN359a8T6o/XoOclKcbG3N7NQBA1TQmdqSZ2N2g7opk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733259977; c=relaxed/simple;
	bh=gSHwXmkUH705227tgnI6t5syouoHZ4biK88SkvpO/+8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cey+rMmvBA5RU+TE+URObqoGxksC11QwYYarsMFcncl6FPXRrzkR/b+DUxvBT++jm4cwxsrpev5o68R6LKRPyfoG1negMoRiZSAgAvSznRZwSGojbLs8kPcNzG8GlFIWePbA+hiYjBRdeZcox//DF244HlZyOhgbm3jlOKrkYik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UwqjST8f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qFMBjROe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UwqjST8f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qFMBjROe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3KfppE001040
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 21:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=efUeQqaQGLAI90kPK4wxAdGbHen19Yrp1RE7m9I1v2A=; b=
	UwqjST8fLYajGZSA8cGLzGGhIsJrGX1RommLPaNJFscxlOTUdDj8JdJMtSEwhJ+B
	DZmXvlfVZrPtZ5FWH96X67ZDoEEGf63YnSckJ7S0dSLQjkcCydHDag5my6aHnmnu
	8oTq7aeVUXlZWcIU2bY7tfuuFQSAZhjtUKXT66xSMX6jdYXWNMnXxUHZrtMtXEYm
	0OsavixoPq0L6FazZoF3b5cDiwOFN0UFbE6Y1gnk+Z7X2g4lAuvsYQNnfm+jhb+w
	8XsyI4zujFual3e8o6aShGHVLkisP5asYQKO7DFwb9hKK0fdbMNKBMYTp3M5bd8i
	2dSBACr3m/4p0P7EWWyKyw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg271sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 21:06:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3Kkv6h030354
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 21:06:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437wjd1xxa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 21:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thHiwNlW0G4oQ9+gkpJ+pQOeopmprApKUW9mS1aWw5iU2wfU79tuWD+nTeMlVNYZCjz469cEK8T5GjIPXFvA8uWJMtyfVybcXzEqVkeAX0dibHDsrzSd3lCTS+etW0G/KzJJ+L6Ubi7BvjKpTIy2r4v3blb5jcw+wyG9JjseMXWex9QuJApsJU4+vJndFbZdfnQfti3oiYtUlBnFX1xFb3SyfIHMwRr+SNIqL3QbGm5rQezDO8pJWMs7kT0+jUjwcNlGQ4Uhfs45+nDwVz9xie3AexbJPY+nbGgTtM7i+vcOxzPRUx8GtZbTteYFm/NM4p8jLGtp7GFubwL9TjDGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efUeQqaQGLAI90kPK4wxAdGbHen19Yrp1RE7m9I1v2A=;
 b=LsUbbqjBtIwvm7Yf55NVNUghJuM5SAOchEkldByTomuQfY4b1+T3hC8rhgXucWIjpGyC+l2ltjgpl4GOea5tup4+xWIaPG5JWSrG1GVEsum5m8J6p+Srwshefj/HX5NB3eJxjufkj7OT3dyzqRKN4Xq7bAiIfbZ6VRLu8U4hJON1TWnkzW7QBSjdiwVAS/LVaWYSGzlIYHAMyD2xUJvnFx8oCSYSmnV73JL7yX2HZr/Bk2obpHvNNY8yyWj+6ZEausVhhCoBunu5c13LvhFA9Nl//25D7r5izviOVHDNTgzvHSNbcnUz/tYIWxOqXEC29J/2hpsYHlBmEmQZnm/ocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efUeQqaQGLAI90kPK4wxAdGbHen19Yrp1RE7m9I1v2A=;
 b=qFMBjROe9xIZ1Lzcq4aTDTPzr2ZN6598qU63U2h4klGWAfBgRs75vK6xrmleT5fjbkNDIzQcj6MDzQvWgwFU0zYiawMPkMFSLRetgKkgXbfQQCH2Azvy0frCI3YSdfJP1gDPPJtZ0TViblnkwfnps9oEEF+8p4dC4gqVQ3FBo0U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PR10MB7948.namprd10.prod.outlook.com (2603:10b6:8:1af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 21:06:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 21:06:11 +0000
Message-ID: <1517ff3b-34e8-3654-a249-ec7164b66cce@oracle.com>
Date: Tue, 3 Dec 2024 16:06:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test: Retry umount if necessary
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241203201601.28787-1-eugene.loh@oracle.com>
 <87frn4y0dd.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87frn4y0dd.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0436.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PR10MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 979cc997-de2a-46a3-d14e-08dd13de505f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZitLY3NTbWxzRXp2bVpHMEpwdGdpbHBOTUpJVXhCNnR0clFHSnZySGxiMDlq?=
 =?utf-8?B?WUphM0xXTy9MSk8zY1ErcS9McGpFZS9FYytBM241dmxyclFXMWZSWTdqTFRE?=
 =?utf-8?B?OFFEU0UzRVI2cFJEWEJ4cFBtNEZhY3E5TUxTelNNbnRjaWtzWWJ6NE4rUzBL?=
 =?utf-8?B?Z3djOUVIYm9aNnVyZ3RqR2twL0NsallXeVNZcVV4L3ZqeFdqWjl5S3o5NVpi?=
 =?utf-8?B?SnBHbXF4c1oyZmJ2TXZuM0g1b2Q0V2doR3BDUXVkbFFacElSZmxsdE44OHlo?=
 =?utf-8?B?MWN2d3o3aGdDU1FCTkJUSnNVZXBnTEsvaldQRE01cmJlcHhVTFNSR1B3SVlF?=
 =?utf-8?B?bW02d05hbkdYTFI3eUxUUHJoVFZZMEI0NjU4SGFPdmpxeHZLUmVIZmtWQ0Vp?=
 =?utf-8?B?OFRCUGxWR3gvQlpVWnFVQ2ljYUNYVVFPNU1jcEpCWFl0T0tXYlg4L1U4RnRB?=
 =?utf-8?B?VUQyQ0lsNjBuYkFuZS9GdExRT1J6SGd3WElQaTVGd0U3NHpTd1FXUHI4cVhr?=
 =?utf-8?B?eU1ZRXJPUXRDYWZLaVU2dTYzbkJjZ1dPQlpTTm5lenlEOExubmlhWUVQT2Vs?=
 =?utf-8?B?cG0ySHEwVVJ2TElPWUVHYnVMOXlJSjVQakIyV2JUemxxWEJ6cDA3VzlIQ1Qw?=
 =?utf-8?B?NDFZSUF6TGFYcThPVjJNK3BiaXAzR3hadmtMRVZKYldVWlRiUllDVmFxRlF4?=
 =?utf-8?B?NjdkUkZyMXBjMlFjZUErLzlOYU9vM3pYZCt2eWxHS0o4ZGZzWjRqcnhuU3l0?=
 =?utf-8?B?TlhqY3VlalJyOUpaMmlhRVk3YkZLbWdRSlgxMlNTYU9zbWZEK3ZPdTQyMy8x?=
 =?utf-8?B?T1AyRWNmRUVMK3RwMDd6TVQrLzFDaWlFb3FOUEs4YkQxZXcwamUzNXI1S3BW?=
 =?utf-8?B?VmNxTmx6WldPQ0Vkek9LWmdrTVYvUmdsNlJ3RHNZYnloV3lKQ1lPYlJQR3N0?=
 =?utf-8?B?UUxKa0xEU0orWS9aejRzWlhYTFJPSytOdXozTHdMeWxsTnB2SEdJbzF4L0JM?=
 =?utf-8?B?UG5TWWRva01uOEFSUFFSM1dZOFp4S0p3SHRuMW1jRVplWXZhOXFhM2VvTzA1?=
 =?utf-8?B?Y0c0UTJleHpPcW9lRmYrd0lGMDVTamNndHcwaUQ4UUI0TTZoTGV6QUFrazFl?=
 =?utf-8?B?dkE1MGRwaS9UaGJERTBVaE5LN2N4c0R4bHJjc3FWb2tSdzRONG1nOFd4TFBr?=
 =?utf-8?B?YXNOZW0yTDZWbng1U1gzeFo1NVBmM0c5YnlxWit6Mk1XSWtYRE0wQVd0a2VU?=
 =?utf-8?B?c2M4K1ZEMzk4TTZobWVqa1YxeGdpUVZBZzNUam95NU1jaEU3YkN2OHgxZEZG?=
 =?utf-8?B?QTkwVkUvc2tjRStPS0oxTy93cjVnOGNWMWtTNlpCQzhiVGhoY3ZIWk5Denpx?=
 =?utf-8?B?OFdmSDJHY0V0U0gyY0w3N1hHWXdqTzFmR1dRc0NlMmt2UXk2eVNYVlhwT09Q?=
 =?utf-8?B?aDZhQXZOUWtMYmZ4TXkvbEZqLzR3MFlrK09uME9FdGh4OUtVTm5MZktKVW1N?=
 =?utf-8?B?Vkorb2JiMlpWTkFicUR0a1QxV0U1c1lrYXI5K3ZsVVhDR1hrQUpkaG9CN1E4?=
 =?utf-8?B?ZGV6RUxhZjVSd2hlZ1FxVy8zMG9SbzYvdUVXWGQxVy9weVhOZlovUjNUSmE2?=
 =?utf-8?B?UEpCYWxSdnQzWE1wZFMrVnpIV0liQjEwd1kzWHpXQjhDWU9mN01EQ1BsOWl4?=
 =?utf-8?B?VGNoQWdCRVplUmlEL0ttQzVIaStKWmg0MUtzL0pXRzhySGdaUXA2MjJPWXBt?=
 =?utf-8?B?bDJnL0c5NTc2ckVxZnNZQ09DaEtyeGRJaFdtQjIrODdGYzc3dTdUUURFSUlI?=
 =?utf-8?B?eGMzTmV5VGtOdE1YZnljdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ZUeHpHWU9GSGRoMzV0S0UyVDFxRDdjcERNeHd0QkpvM05lUTNYcFltV3NQ?=
 =?utf-8?B?SkdDL3prc2h6NDRGd1FHWW4wdzBvUnJHTFpWSkQzZWFOUEpPWFdqblRZQWNx?=
 =?utf-8?B?TmREL2YyL1lGQjZlcmIyMUxOaGdCN3lVZFQwa09IT2phMHBZSHdLcHo2MXdD?=
 =?utf-8?B?MGdQK0VxaVdrdmJxZ2tsNHF5WW9aSlFwaldzR1RSL2c5TDNWQ3FsVlRKZzg0?=
 =?utf-8?B?dU1BVjFxTEhwTjJBZTJJYlRKdWJLQWw3YWhFRXVUL2tSdWlzd2JINTBtaXFx?=
 =?utf-8?B?ZDVWMkFsYjNBMXpUVFZESWZaTXY1STQ2dlp6S0VDTWJYQ0hTK0k4TVQ4OXFy?=
 =?utf-8?B?YmJ3ekFUTm5VWkdIWU5uS1VCNlpMdWprVFR6d2ZtWFJkQVFldVVic0pzMXZQ?=
 =?utf-8?B?cnlNMjZiNXpPeWdKakd1QmYrc2JPLzFuZEVRY09xSFFhY3E4Y0hCdW9sUERO?=
 =?utf-8?B?Tlh2RWhNRjBvRnd0d0lMbXZjdTJDdDlsUXZCWDVSRERVaWxhZXg2RU9GSUJy?=
 =?utf-8?B?WUhBMVNOaGw3NFhoV0J3UE9VSGtjemdFcTJha1M3QkZucHlaTUl1S2FabEJ4?=
 =?utf-8?B?cUZhVlFuTHhQSGR4UzJiRkZuN0xLeWx1R1pYd3VZWnlmWU16WVFCT2k2alZT?=
 =?utf-8?B?U1FJQVZKa1M3SDRVbmMrUHgzVDVkejhzcDhVM0UwdVhSb2xDYk41dGFRUi9N?=
 =?utf-8?B?ZVpLeDhWVmhxeDAyZ0Q5ait4aDJDWDZTOXM4RDJGL2E4T2RBbFNaRDZuZ2pF?=
 =?utf-8?B?RDgrREZVWE9YRlJPNE9iNUdyWEUzM00xYm1hZXluZHM2WDdXKzFFcUlXM2dT?=
 =?utf-8?B?c1EvS2FqL2ZMRmdmRFZUd05uNGtqemRYQ3ZhWSttVWUvTHhhRlJqSzV3QmxM?=
 =?utf-8?B?b0ZqVnVTQmtYOHZpZllKWm1EZEpCK05Od2xHN0FHa0V3dGdSa0pwK1J0NDlx?=
 =?utf-8?B?RUtwdzhFa2NGd0VoWlBCVDJVZzNVNURjeVBBZ3ZEZVVOT1UrM3FNZkFTM3Ni?=
 =?utf-8?B?ZlE4QzQ0MDBvcG5FNTMrS3JhbVVDMHE3NXFyTU5oYzRCVlFySm5VUU16cjZ3?=
 =?utf-8?B?UUFKbGovSE1iOHBhTG4xaUlBR2hCdGg5Vko0ZnFxSEhEZVVGSFRaWFVSVjJK?=
 =?utf-8?B?SUlXTmZ2U28xTTVFT05YK1E4UnNNMTRHYkhSZUROSnk2Z2tjZGFwZCt1MlQ2?=
 =?utf-8?B?RDFKRFRhYzl3L29JREFJWVhIa1FPTjZuZ0dFanNtbCsvRzA1bDF3WjF2NnNE?=
 =?utf-8?B?LzJsVnpXVnJqNG9uL1J0d0ZIZXkxYUxwRmg5OEtsNXdZaHhTQkc4aUw3dGV0?=
 =?utf-8?B?R2R4MHdRMXNuMHp5MjNSakZLZlRpMTVCelJRSnU2M2RHeDFaZTVzWU9JS1h4?=
 =?utf-8?B?T2k4eFJaclIxME5JS0tIVjRnakZlRWMxVXl2dXpwRVNRcHEzT2JaaFo5OHEy?=
 =?utf-8?B?YzY3b0ZDQk84Rjg2V1RZaHd5WDRXK0xrT0llcnNIMTBCUzJHcGQrWUNOcEZj?=
 =?utf-8?B?UTdYamlhbnZ5cDVvMFViNU5mZ3Z4NDFUZjhQTndwQ0RqVkhsWkgzYU9KcjdP?=
 =?utf-8?B?ZEVZZldTZkhjQkdvWFpaQnhVOHpQS0VGT1I3WGU1SnQwTkN2dllUMkdSM1VU?=
 =?utf-8?B?cll1ZndaSXFPVkJ4WFB4dGlNMjFFUytPNm1NMmp5L0w4S1dpeGhqQ3lKWTBJ?=
 =?utf-8?B?Q2Q5SFpRQ2o5eGJaTWd1VTMzWUI2VC9RVXlXSE5ockx4WGhGZGlHdUszcEhz?=
 =?utf-8?B?UzJFMVFmUTFIUVVPUnFzSUszTUZNUmNuMkZwOFJqU0hsc1AvdzFHZEFGMW9F?=
 =?utf-8?B?UGhTVWx4YlhYQ05xNmxiL2lYTlRUYzlZUjlodkhqYjBxaCszTXFyU0VVVVkw?=
 =?utf-8?B?eWxway8rMzdhdHhMVlptbFpDKys1bEdmQ2V5ZW5TS3VlMUhJR3BPbGs4VWc2?=
 =?utf-8?B?Z3kyQlM3SFJKS1JxR1U4T2NZcWNpUWRTOTVnVTVkbWFjQ2Q4YUJmaVAxaENn?=
 =?utf-8?B?S1RxL2kxd2xaUVRtaG5NeEdrSEFmRFFJM1NhY01DSEJGZXJjelhTVUVXQThj?=
 =?utf-8?B?ekQwblZLZENEYm0rQjNSek8xUi9YeWFmYWIzWENxR3VLT3E4R2lMaXVGQncx?=
 =?utf-8?Q?DG4P0yE56WrltrnywihlUnD03?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OwD87WRSMBKFoOqXCjHiAhgu54VlCOLSVPGps9nH89uGhoKNOnzWEsJZ1PbVvFExZEkbgyLyKMFAohZ8pG222Z4DvhLgdWo43rxa6EWIhDNkD00T57fSpCSRtT5OdDFl33wC04X8nKAQG51+mZWevufuteyCsp9nyA18JUAHcXfhrivKh7ygvMIp7957xOjQkFlCsvZ7RDKD8aJTMCCJJedUhOLhcke0k1iKwGFQ0Zg6tve51BZrru33BnhJ9WKp7hKUHKfDLMcUYVCb8xOWMn0IMWJ1K3BbftTzIAGBEzEjNyNEtTjzyvR2fDUSP3L/OF8c5gX4TscxlfmkeMAtVM9dN//+590Hprr2H7J/EOi5+AlzLlHQPQcc0Tq7TTPDBWgOc2gmGgO9J9L2lX2b9hgNqVZGPSFE9l2hO+vgwEy8pEtVVGF89PmpiLrHubTrNomUhZkglj04yHeXmnHrxCbr09jKxlZm0+i1qqUNCLYtySmbkNSbJuMMleod9sW3ProhOep5Jiha7XwvRVuV8xUSKhCalRNnOwnt03gRFifwWVMJPAua8/nPeZTogHY2Hw4BunEN9m4NGZ5s4aHwiCgMJURbeyO7ztAm2b9ZK1k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979cc997-de2a-46a3-d14e-08dd13de505f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 21:06:11.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPOwxW7SeDQ4L+OQ6etsY2b6Yw3nQSTRg8JVgQDM5yQXpB0uYH5C5YLxvXxinrpi2yS2TTUH+glgEt7ujz91Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_09,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030174
X-Proofpoint-ORIG-GUID: -JdjHDWv94gCs07nSVJV5skm6ncad0_N
X-Proofpoint-GUID: -JdjHDWv94gCs07nSVJV5skm6ncad0_N

On 12/3/24 15:31, Nick Alcock wrote:

> On 3 Dec 2024, eugene loh said:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The io tests tst.local.sh and tst.wait.sh fail with some frequency,
>> with error messages like "umount: $iodir: target is busy."
> Can you just do a umount -l, then? The only caveat is that while this
> will disconnect the mount from the mount tree immediately, the *actual
> umount* might happen arbitrarily later -- is that a problem?

Maybe?  In test/triggers/doio.sh, you can see what's going on.  In 
essence, we want to flush operations out.  A lazy umount might not do 
that?  I'm not sure.
