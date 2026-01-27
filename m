Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650B352C24
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532947; cv=fail; b=EYugA3BI70DSumymwE99akBAQUTP5YoWfulEl3IU+CCo5U2MESHUYtqa5UResqoG93ygeLGHv3qMVrkxQVP5W+y/AbOtOLrqk+FNGDGMP7Ak2sN07OUI7AS9UpbPxom0zhEY6tyeKpCruD3Xhdqc2mMRu5ZJfU32KFQncRuLwXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532947; c=relaxed/simple;
	bh=1p53PZw06x9AKidmqH43PwvHJMrAgzaEsJsObQBkLJ0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=bv09yVxbi6XsdPV4smRyaE55o9lVEy+YOxzeoFAWyXV/98EvMh609jjiQexiPKqPtm+fmK6Wf7bpq65jBL+zU/7yTAla7f3MWFfZqY6GnsgQkabhXFXA4xu6MjpjF2X02VV9t4/GYLd8stUFNBWVZmdcbmkphSCBNwoqTJpWk9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tck14jh/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ieXCo/Y3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tck14jh/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ieXCo/Y3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEH4T454905
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1p53PZw06x9AKidmqH
	43PwvHJMrAgzaEsJsObQBkLJ0=; b=Tck14jh/E5GFAFRAWjC1PcmLlAEuOHS03E
	LFkcob3Z/8p7G9vEg+L5qAYu9sjp6+FcE6VH0Gis1vSCWVxXgXYqrnuypdBVS30w
	XnPSswwNWOLqC2cpA8sdCaMgQ4U26XxfqiQN834Kuu8IfsaTBFdTUxc5OUByP/id
	5SeWmHTBNlMIq6yux6DETeTjz0jFoodzEP4Hny9VQOP+NGelw4fd5w2E+gEFsFS8
	gxKc747KjmxizgTNtKpGj66waE9w0RPx9xScxPtz6jZCZkNVHw/+ZXf99MRmbQI1
	RYsBGnxP880+YzP9yUT0wJAGO/y9VekSsmpEGyXgFY0PfSPyTkZg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvp4bve7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:55:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RFVYGd001741
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:55:43 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhe7mnt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7luglaWoafLbq54ciUdaefhRXHec/WvxsrwJOevoEHGdxBe4O8PH76YfMNmoF4MH7zwFhns4xPPHq1kqPQISaOxpLZgWsLX4BbEWTGejcUa2p7u9ASaNzjfQQnme9VTy6dmG1hPMnfMJ4KREDX624DIorLVbsiDmSSZPBG8wWN+29pW+CvCo7lLquH57XNmmnI1B8sBcpchH+yoFN6njvsQhO5+MOMjtXoKZs2cwU86TSMUfoGaGtP7L6B0swACeNplXMDCHH0LX8SK5r5wYCbvO/f583wdUjFNTv5J6iAjJVNwNDN1FRxJELUBPj0+B3LaXLhgluGR3aNsw/YUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p53PZw06x9AKidmqH43PwvHJMrAgzaEsJsObQBkLJ0=;
 b=N21v0GLwjuH4gy3ecILIpCC9MYvxA7X6msrcwdhWo73oCklV1ewj1Kxooy8ewnUwJG1akNrPJy8zy0wcil/dAKRB+OrUj6t8z8ggspsYp1VZMNzBHBaHwQCbmTTMFxJDput4GoAoIjQ6flKNQ7qGyM6igPwUEdsWcWCms/JJmXu12DmFiwXK4f1iARjEA2Yjp1SlavzabnkiX9lHUMqcxfuCFqxMIUWrve/mojhjlD9Iwh+TdoJe2pmeVBFk85G2HcNwAzESAbkFFVX+i/5YRe6MlUebQ+o7fRNIKnlKB8VpdYDxH9xLqwLZ/FUxUAE7nPZtm28Y7UKyOfoGkMLQ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p53PZw06x9AKidmqH43PwvHJMrAgzaEsJsObQBkLJ0=;
 b=ieXCo/Y3BJrDVrzVHDgHXheS8SQUWazD6S10ceezA1K/RIADQ1bTTJfkj0M1CUTsclZLfUqP41lv0m0Mr4S1tFLfJX93wuUjlslGMFkEX4TbhNENzCCMrKULmH6gpDD0vR7V9Byk6VGS25AryUDgW5ADFF6uhwCxB2mbxf06ADs=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DS7PR10MB5197.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Tue, 27 Jan
 2026 16:55:40 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 16:55:40 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 1/2] Revert "Support deeper version
 numbers (e.g. 2.0.4.x)"
References: <DS0PR10MB75229AC7BDFA45F9DC19A2C3C290A@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Tue, 27 Jan 2026 16:55:37 +0000
In-Reply-To: <DS0PR10MB75229AC7BDFA45F9DC19A2C3C290A@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 27 Jan 2026
	11:49:54 -0500")
Message-ID: <87sebr0zcm.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c64785a-4323-4f02-41ca-08de5dc4e70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uauuVyWwGFMsOS6qEDmtLnfFLBMDOZehMTkUJkEWRlx105BhFOrOW00G9XVc?=
 =?us-ascii?Q?P+/1Hmw0B/q+KsAWHleqLiYvcL0R0uVJO0NLNqV/Bb6rGOCVfDfLnREif9vx?=
 =?us-ascii?Q?Z14e6DZhGUkHY58vVzDmt5R9AHW/JVizfrCiFnooPWZZ7CpQYjeyavTSGraT?=
 =?us-ascii?Q?ZmB6ipHGQc3cXW1+1XxKYWq3RM1iJ0KynpRE+HppQIezqklzjVsJrHHRoQwY?=
 =?us-ascii?Q?DA58sOAlNx407wzaeye9Y3SiQNfLFcPxyRIwRvS+/LmgfERlgbg6AY8GFBWf?=
 =?us-ascii?Q?XPl65HvZOOgOYvCZNXEqZtn58ecmiNq+P+KXAazdVHzN+mWOS2u38NuclGLK?=
 =?us-ascii?Q?Xvii9JowPYxFViz43FBd5xdXx3VOdLlygYYJ6LMIc8bOzV+ANPKYOl/Teox7?=
 =?us-ascii?Q?ZizRgayqh1BLx0M3b15yrq3Q4g7wOq+wpNpB1g74IGubHJSArAVzCBAAqsSV?=
 =?us-ascii?Q?/lD4vDLR0DlPeSrukNNknf820H5RfvI5qNPMYdHwp4U4GQ8XSIg5Eiw3BhVC?=
 =?us-ascii?Q?nIs0/V3V+vxbV0Vtr9BrzsVxqPt9YOR7GHF81v/BG8moWYOxe7IUdK2nD1m9?=
 =?us-ascii?Q?JiqZzAuq0Sh/JPrnVBY9GbPNtUDDmeBP3quLGO/J828QXtAKL5COclXyxXJA?=
 =?us-ascii?Q?mdBtb4IoB3XPc239YojR0oNYRy6sAKCKBoLgZzr40rFrIZgV1nikhY0QyMK6?=
 =?us-ascii?Q?l7GJJq0d7smcGjEyCK+wUd6oK3sUIfL66NexIxxA3v/fobgJ+PyWorMBh/EQ?=
 =?us-ascii?Q?ZqNeICXWTOm+iGar5tA2tQYFc8TCwPmMlqzmqkIev2FQNeGXa3nMVyEJVVRw?=
 =?us-ascii?Q?pq9EIWrl2uCbfpLh+vjVsXAhx893i0oawN8j3b6/LTazSulwr/R9T6/tCdVV?=
 =?us-ascii?Q?/k4s6QR45IH6LZVGYQi8K1CDEq+VoGTP0l0GfGQ0sz1FJX4cZwRN1UngCUw5?=
 =?us-ascii?Q?qg5WkkGHPiMtSxOeaJb7ECmLm6fn+2Y93U0gHEj7IffD2Ph4D9C8toqf7c87?=
 =?us-ascii?Q?QCvqjzA7cHvog5CgAopQKhGrXlsT6r/ZYD/C2qR0WEUZlZ9b9gD17YWSuofH?=
 =?us-ascii?Q?Mrnr5x/oTYlYZewUadkJDFddQfljJtHqNasbVJvLbCr/2VZRAW3BHDgJUJeM?=
 =?us-ascii?Q?Kc0baoooB9YI3O5Zzt8oftqfATDkiKY9PVnYPYDsGYyTn3EjG2gr77HyOUhP?=
 =?us-ascii?Q?rzz8T26au4OfWAvroYvxSi7tJ1diVydK9i8YCeIBihN1fkWejxKS8iHUADqx?=
 =?us-ascii?Q?phiXku+j9ISa+nF8vpnZLpH+Ts4Ko/ELIvNvoC0ypFwmkYTRgP4E+lYGN0L8?=
 =?us-ascii?Q?+sjRLOMxJvKmkpCHkqmPLwNWIc9WB0HHa5gyQUaxyLRMOuRcJMT4e9F0wvOT?=
 =?us-ascii?Q?Lol67gENriKAqfFSGOvxYbKt6P6c2wr2CRipDYIgnNHos9SjkPMu18wyxvfZ?=
 =?us-ascii?Q?tvpGQJ57f6BphFjEWiUDa7Xq5QB22XMfjala4SmMTBAJ0KKAbMcYN3/2QH+g?=
 =?us-ascii?Q?ZxmP6jq+XvF+XXDB1BFrTA/p6PXaYEJTcVXvJC40Bap6Strwyk5ToaaNxTl9?=
 =?us-ascii?Q?+xU4dxIbRNhWw01a+i8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g1s9I0RlA8OemC1S8qmGrNtYCQ/HJ0eyuN7hoZLRGGNpxrJlyIVQETGFiG4E?=
 =?us-ascii?Q?qIE3YmXZxLCw1Q+HksqZ/X4BAzH2iQCNRPShfOPazgKhzLBQWz5KmxhFuZzE?=
 =?us-ascii?Q?fYABVUGAy5O+LPMLEA4iGRI0wILjOHEtVvzFLGwDyNyCo5zV8s1gWY1MqtMl?=
 =?us-ascii?Q?fJAOs66xknFWmuNRfIrt7pFHZsVy7Gd469JcnBbYjfj0OpL6+7NWx3WXmg4k?=
 =?us-ascii?Q?bOdqfPiCME6VDcQbwlc62hl4pbKb1eFC/sJdIrRd7MUs8VtOeCmtmOEWCg1t?=
 =?us-ascii?Q?JhMuaO5sVLTdVDxWNR/55BAdsq39WX+Dey1g7P5pA3oUrT0GzDs2DB8jHZW+?=
 =?us-ascii?Q?GA0Uz3vqZhoJE7eWrJpuBuwZ/hjZofd9v5IEOVF6S3AVntar+WtLpCAxIc3G?=
 =?us-ascii?Q?0WE2hSQh6Idg/yrpZH1oeXfryhFNrCaZke/13fwvYFHDkxrQlGz4VJ6LNxi0?=
 =?us-ascii?Q?Au+OKr9ejNaelt8qfkz07KgFKLaEVGedWWpPVYHidVdmqMq/AN3gsrfH9Pl0?=
 =?us-ascii?Q?NvRGU+WwmmBMlUANZgH7INClaXTs3fSZ1hoCxHcyvJIwhw0Qcqe7ygEGFAkx?=
 =?us-ascii?Q?aPxnKDy0d05r/ckrctZSk41vey0tsTPaKhkD+r+Pm93nzNh7yTPXcDmmwHDi?=
 =?us-ascii?Q?yu6skGmLbR7XUhl/MJShVO8FVppK7np5NUY9F8ptSwehtgVTBBtnRWEZvUMj?=
 =?us-ascii?Q?RfVTmb3WCvktymLn3i76DgEQUhkaRHTgUr6LVD2m7vN3UkAchMv5wIosBEI/?=
 =?us-ascii?Q?wJyO2tNwf4/4b6JjFE6WBOsLxBeTHGknZZ6bh+eocPrDclDnY+6yr14NWkv5?=
 =?us-ascii?Q?WmSYLV1iLM0+E+qFTW+hKRbzFJ1En8nkZCaWx+jkcklsTyF7Zii0xR5fZqaU?=
 =?us-ascii?Q?0hid0al/zOOCuOJoggqz/c0aKoBtmOvVLiemgxYlWDk96As1fP7tB8YcEux0?=
 =?us-ascii?Q?q20b/o7rILKlUB8f3PbQ5buPfRAhOaNoZVOFTaZN5nkcjFJSpNQxT7vVkKaO?=
 =?us-ascii?Q?YwCe4smxkeriaav5UrkS2kAGbQ6NAU+Wasv3ggxPyToDzvQN5vS/ffhZmSOz?=
 =?us-ascii?Q?pWpXfzclng4AIUFYVSq+2+Pf09Z+ZAGBnTdgJ4dCUb5jdmZA0WZO8DOaiPza?=
 =?us-ascii?Q?PFZrDD+mwDYKGH0RP6W56LMSmqo4uWDY11LxPfjFYfzGYr6hwcsYfHL0mHlt?=
 =?us-ascii?Q?GlUKIuEol6f5XbZ+J2hHdbUDgBESW9S+zh9HzrQiRj5Kx6InGChO1vGgOKo0?=
 =?us-ascii?Q?+0mt0pc7pOcFJSPjaZuSxbooHZ02Ta8A+kXqT1/ab+y0MQGipiaERIRl4hgg?=
 =?us-ascii?Q?N12t8ll52JuzeHavkU6wh3woOW1jvgQXGrFxp72a2MYwzZhdJ+VYkcUqym8B?=
 =?us-ascii?Q?89SLCwkDPVuZrRqlNykuqbo8hCA3Ve9msf7KeLNXpaBMxJmuXmVOYO9m7HXf?=
 =?us-ascii?Q?JBLxUr5AcviG8ABRivM+pR8Dk8FMoR6wTY7OK8ZhpG5rO5uc6mtdIAyt6Nca?=
 =?us-ascii?Q?wWjWpFd92/ISRYvJfRGC3aZonOSV6nf1glph8+Plbkt0YMSyM+vWChbsUsqv?=
 =?us-ascii?Q?EiColRhmwYVwWq/aI8K3LLsG3FHqqoHnhPiCfcWbyFTgSqhGQVx7NrXeY6CJ?=
 =?us-ascii?Q?L3MAmec5ymTtiPSaecmu4v92cyQkaBvlBwTLwMuUSnhbPf7/f1WVze4cQtFi?=
 =?us-ascii?Q?hTXP/KPOTEdPWsbET1lX9cKISayMWPDAjsvIgz/ifVYD/fXjdpUYDxUVgq6I?=
 =?us-ascii?Q?yJuR0ph7GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	joeoJAvGcZu6t+Qky8juODrAxF3a6CoKya5BoMeESP4qhzzI8Foj+FkGaOn+zW91gKp2HpOQfaxy4TOHNLCV5X41eIWuZhlVqnCA/jvv+/7EPbagjTEW4fE3UwJtLThWhu8CBKqIWO+Z2b2BJQz/DtJSgCYniabUNz5SzRv48fo3ksUN468oRF9c7AUt+sDbXQHlBGt9gdjGurrttVD1DwBj2XuaGVGQPGAZZ5tf8c3cfG6FuydD/sehXbsQwlIMNc8WyoCeingfjWvTB5Z/7d2nm8verMDrCWAtsBcJQZmzlne3i+OzT6dKSPQrlkEX9hXQXdQEaijAIzDLzfmexOAF98a3M3NnJ3rJ9OMyPIjOE0kBy8l3yvfhwCYpVGGKGKwtWn/M2+u51nTVGnEolk4K+W2XFW89gu56R/JPklsWor0OaKuhtU6D8aUvaI4iPmWpXM0m9shGl7+AUukgPhPkv9bxa8/WTUFK02Lumj7tAx7qTsfkqog0y1rOX4XXEf2dYoksIrZ5Zt9/9HC6tWCMrzfzRB+OA7HAe1xLDwcw5RbVEh7IZkpln87mzGu7tJPyy31mW32kGkjM2y66xBMyNwrEFwGV7xJWknBZRtI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c64785a-4323-4f02-41ca-08de5dc4e70c
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:55:40.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3n9klPeXzFOZxCnfMFf6l9olc4WrhLoxdAsGzZg6qg9kMVvZLYu60LzkAy2btx8wbKIJ1H0TZP/TP68dY769A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270138
X-Proofpoint-ORIG-GUID: 9tXze7sGB_psbA2u6LF6F3rEFvAgCzrN
X-Authority-Analysis: v=2.4 cv=StidKfO0 c=1 sm=1 tr=0 ts=6978ee10 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=nKxdqwvj7oplpC-e1e4A:9 cc=ntf awl=host:13644
X-Proofpoint-GUID: 9tXze7sGB_psbA2u6LF6F3rEFvAgCzrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzOCBTYWx0ZWRfXzeUVyIh06GW3
 Er0BJ7SU0IrCoXJr2K5CXO+sl2XNDjrYKis6UxN/JJadrFoLt/H0M30erOkY3CR/cd9pdFBRlVU
 06K+4zaljTRTqF1HAZzZisyJMjMeRMIvUJu5KtvJeFXcdJdFwjC3NGWAtvTZXgWlfzgKxDNnL0k
 oh0R9u6p1Sh0FFYtY6mxNex5CsnULSsq5QgTIoQYLGDGre9Mpb5nsWsfx58ozkPnfIgzyhh5Wx8
 z6/REb4JD9znWwqTJ06ozWC8mkGR1BgkdGXlC0y0ZePwpd6Oh1ND9emF5q6hIR40fbzpYdbOqNr
 eR7P2POf8vZS2gx2w0/nnJQnVT6+BowuHD5e7cXShKEHQys4QAgyatu/r8StdE3KpstdPhQyLsq
 d9+obKtVO8EHnjYFrWL0DJ2J+eCjG2lKFoXKuqcCb3IHFuXZb7sS1i7Wr+NnUq3rrRa20igHP/D
 MA3vAdnQfnieQiJEhJ9g2gTNr3/KTQZx+3Awhqxc=

On 27 Jan 2026, Kris Van Hees via DTrace-devel said:

> This reverts commit 1898d098a582488c9de485a9b672f6b2929335ba.
>
> The DTrace version numbering scheme only supports up to 3 digits in the
> version number, and expanding this to 4 digits would require quite a lot
> more changes.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
