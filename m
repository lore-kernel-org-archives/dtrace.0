Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149233E373
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738703; cv=fail; b=sWL0ZjOKzOZbsUP2NTW5NT/tnlwjRKuqLVJ2UK9biJ5XSt5WBhF76AhLuTJoH1h3de1+dnggxbfaehBUStIZobum4IMV7YOLgxug32RnHvIaIr/d28tMA7kj10rsQZhnPWk1eRiriUFekD+5Dqfoi7nOjcNoYmrrU6GEG1ExCS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738703; c=relaxed/simple;
	bh=ZjVXZ7UhGbzUCIWMJLEjptS8tWn4YqRk+iJRb+JWuLk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=N0aLIUsB84HeskqIShjUZqf3Fs30a5BcWab3wOMhFYNnrGApJmnoUGIkfNDaOGHudOiqP0lxmI3PQPrt7sW0rkYRiZ82k0lIUOYXjAlVpQDeeEFJCG7GAuka6KZ9D9Af8k8zT3yHEdVAd31dNA+romsllvk47sAJfNq6RswecO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hcu55bPi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pKA2TDtj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hcu55bPi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pKA2TDtj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9vJdp3543398
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sPsMo41jMoYXoktWqRk79aRJtROqqQJBfJr2lCURqa8=; b=
	hcu55bPi9yrWUrpp9IZzCJk77CzyUYw3M5ZyQJ5mFtNbGulyWaqEwBueK01HC7Js
	KOUcFsQ2rEj99kN6Nv5QfIZ+vrTrmanshdHbv3yg0ul+KskTe+LOCaPcaoZ2PU/l
	0ogOKOBZgGA76rjYCVmKasdFh4eixr8pXg8mb/WLttTaj3zRfpFi82IYvoT732Mm
	HvGON2uGx8ZXPIUP80pBNCPeMFlg+sLJefZz0TiALv+D78p7D9In19+JwW2pvmhW
	Xt2wg6Wabni8hofb8u0HZPUrvlP6MZQAc9DzghVXSCUIG/kMkjcNAvCI+sb4QcGt
	pfoWHOKx+NRk4MbvEVNefg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xhuc92t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:51:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AEKxuT013030
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:51:34 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c826y650h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 15:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc4JdVIOyJQ1bxQ+PQ+MIR9TW+XnViyCwf47bS4b/CA6Q64UpWeMgp7AM3GQvowdmJlRppgBNDwGJ7KF9d0dHhPA96Z2MVek/lQoSfNSOcGJrup0hoz5/eykp25meCf8u4xkS36/56AKqhODkRgJX0Sqlgcu19HJNONeevR1tQUOkfXWDIxm5TPM2XeKJF3rulF95XeYWa3G/qP3opqlJlwMhD5MquCNy7Dz1mK/duhsl/bO6kYvFxC4PbKdL4dlVdhdIF7WPZZ5OUJHkDzAF7/OOT2TcEr9U0FfUY6o2iWgMuRZmD/vBVCdkDRMSFlEsmF569uieZETtr7w5SW1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPsMo41jMoYXoktWqRk79aRJtROqqQJBfJr2lCURqa8=;
 b=wrimXxBmvSP/R9UqEY9vF9s4htgLyHoxz4P84D3yAFpt5y0966hegYTkDYIXevjk4FLnDTt+LKOKCtSxIaQaiqHwvCJw3BFxBfjy5J4NjzgNO26ZWATsBVwpolUwdJyv7DfvYCAwTQj2d4to447aGZNfIePzXlpp+FM+lr7Ko71sZh1nAVi4nCsgkblRPxc9aKB2At2M5ejG+3+CZzVgvxRzLQoR8kEQYAsbbyDNs/V3zbxMdXGOq5x1cW22x1M+yn2ROjjFbSiMSfq25N2N3kT7pf74qfB9lJAFQSuCr/Tq1CYULZEBby1TMTse2JCcI0dBr226rkjpJ5y8p0nT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPsMo41jMoYXoktWqRk79aRJtROqqQJBfJr2lCURqa8=;
 b=pKA2TDtj+RaB6AEdjxbZIDhyVZ4KiRTvU/miqSGOVfjOJ72SEkB6PDVFcNlIo9BPJQRMPwRdwMq6Sca0ZzLKZO24aNv8BNaIEETKEn4rXFyTbyP2Bze5oxwV+vd5BFA6bnf5fzptTCFBIh3UxdZLzumwGyt/0nJ5hEpHe1Kcmt4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BN0PR10MB5013.namprd10.prod.outlook.com (2603:10b6:408:120::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 15:51:31 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:51:29 +0000
Date: Tue, 10 Feb 2026 10:51:27 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] pid: ensure pid offset probes perform lookup with
 adjusted address
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752237BAE43AEA9E3A1EC780C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BN0PR10MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe1725f-f989-4943-4da2-08de68bc4124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PksKyeDbKFWG5VpTenQRLKCNEaeZa9IEXT6WRTfUfBaw59yGIPBbjLVH1L8Y?=
 =?us-ascii?Q?l2Tavj+/y3ORVJh5tM9W9ZBThrqwOElEWnsK5ovcQe6mvc6wGFTZLwaMRIzW?=
 =?us-ascii?Q?xpjWmkSRRUBvOrkUfddNF1RwXzA70KZNgcUNkYJdVyUBo3mpKyuLy8F7N/9p?=
 =?us-ascii?Q?+lcaG6OYULGDMnWBgJ9nN2bs7XxqgzxmIhxTUU7YjhJ7AF8G1ZqYZcZYH6dy?=
 =?us-ascii?Q?FqmSxD8mPhD/0lyeJ0zQL7HKZjRDjG9B08rwwYM/KG2xDHIAdLmtd84tLn6c?=
 =?us-ascii?Q?ZxNqdpYsrSOuQ3Y2B9XRyu7peAVVuahPdFMpUhPPG+SjoFlD75lNL1NwrOYB?=
 =?us-ascii?Q?I5lK2bHO1yRQQORAgdEGIAoEpB/x9k1/QYF7gt74XlC9JWxRUrPt1n+T289s?=
 =?us-ascii?Q?+3Uch4Dtxa9P+aZDf2Af755Cl+ronAJGYYLgdz1Daj2HjarQT2CVi0dEf7cb?=
 =?us-ascii?Q?73FkxKCavmocMMRAwMtOb94zZWuE/XrFdEVPtWpsj5Fx3x2eHD453SMjaYD4?=
 =?us-ascii?Q?I2ivvHU7cAdqHMW/wGknhSFauYRPUIBZZyIEDLyFWCRFkuTZ+MrWupr14JUb?=
 =?us-ascii?Q?UmaYr7tCrueSR1KxzLzGLrAvEWkzgoZnttywtdVNbYz03OqJyGYMkTHMKppE?=
 =?us-ascii?Q?2/PeT7PTUMGM0rWYndAdFADiPHDyc5JCUp0euNoEi9RBFgRQyYf8USuejXjt?=
 =?us-ascii?Q?fQ347ZpS7hcz5/2zAefJUsKY5S7cjdvDsCvnJtGS4QNG4lhXvKc9g67lNGGl?=
 =?us-ascii?Q?yZKG4Pg4id8NxqvLmQp4YPReNR+Y6MKFt29FBJD2n2EYKyuZPoCwZRPxZEVX?=
 =?us-ascii?Q?GJn/5wSLEpxo7mFw7KXNKW8UcK4+qnwzW87LL/2EMx1syno+AqCTzijGyPHr?=
 =?us-ascii?Q?0uawVOQHciHtgpQR7+nMs9LvbB6QCYb//sxM2MZ60N+Iil+5F9w6hF3fsAlF?=
 =?us-ascii?Q?VQxgruUbZFrUloATky86U+QXvawzGPhTsLktSE+Niw6MMNbSDZwvYBR2APNX?=
 =?us-ascii?Q?eAfEaFB6ok0gWuomDoXBzMAi5qy1mk4gq/mVPsg6qng172EWbzbHcvR+DeiA?=
 =?us-ascii?Q?UG58gKylZ4oAVpW4JIdkaHIM+CPqNPYcFLHYpemsf6Dhns036g2x7w79vAwH?=
 =?us-ascii?Q?6+Ov4BGrwtySg1klkpbgWr4lsyGOq/fYRKXH6MtbPQIZhMIkBnGydxKQxGls?=
 =?us-ascii?Q?/nPYjTiRALaQk2prSd2uMa/EVlrfhk/ndMmxstujjGCtPk8Di88qr84BTIZl?=
 =?us-ascii?Q?rhE30/+ayUNCTXA/5wTiDYePOGUuEBeTe4wYSqd9uryYBHZKs5ttSwueuO31?=
 =?us-ascii?Q?ewRLrXbkuJhRQoyZD5fRs5ZEdwEEM5YK5CyflUEfO6ZJ/HbLWnM4mNf/SAJq?=
 =?us-ascii?Q?BnV5FNK9W8R8H47FmoTxmCo5AArcOjWto0Ur7vOCD9mnnLz+aR5zADkwy+Kr?=
 =?us-ascii?Q?nk1HeTOSenxdzZYu/PxSU89s29nnc07vB3M1YqlGElz/rjPdXpyAoCMN/Hqb?=
 =?us-ascii?Q?HnnJEfl9ndyg5ndHcYH+lKwu9TUEmJgHtbckGQmQos2JcVkB8wsAj2YLfcI/?=
 =?us-ascii?Q?jmpOXh++7jId7itJTJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wHWWK0R8FTllfRKOcg5sDNXJZr+l1Hj3t8T5Y2BTC2kAivxVqN+J5fF6LTum?=
 =?us-ascii?Q?XkE6cn96EKff7iFYG62Q+fCoggFE6kXp7rccdlfQaZ5lpYjSThASXcxdEnhr?=
 =?us-ascii?Q?mBaWp5Eb9zjrP3tT82iOUd7oI0XMIaHQQmTG0V8fx1YOIrRh36/C9IdmYbpw?=
 =?us-ascii?Q?rXIFffR1SlZ1vfEL6cy/LyG8AbsXRRe1bYuRay2dmTRkjfaSTkM/k1VBG4Co?=
 =?us-ascii?Q?vxXbEeiWKZoiJMnymUXqY81QlnLRFu5Kc2KetBSHXP5TyvG8DmaGqRZhQ72S?=
 =?us-ascii?Q?ZbaDg7vBDpzsEY2FY4wdVzLtYbyofXl2C4adFDc25HjDFe3jgbeZ2kK/eJwE?=
 =?us-ascii?Q?vBrhrnaoXl1FJNW32+pvDxoD1dOmnrQKnhT8IMTlgxg9gdtzL4YOMryNz4Kk?=
 =?us-ascii?Q?rU6KOPGKRIrCeaJpPFnfLgC1fFA8ZX9hAwq+sYjUDxawL6M5zl7M20jV/KAg?=
 =?us-ascii?Q?L5MgvqDrMGrCHKkdlAtaCNM9z5hyKl/vy2MnIWUCg862JYo9n/NZC+pVPlQV?=
 =?us-ascii?Q?/SoT5VtFocd6dynUSVlfWpMq6ysAX4JMcm1TQJsxESRVu9cG+/0URKSurSk0?=
 =?us-ascii?Q?tN05VXZ8fK9EWWRwoUiVX1gFDxdehDeduvWbwZJvyVR0gZ1X9ZWPeiGMvw+w?=
 =?us-ascii?Q?WzyIXh9NnmRrnrgLd/s2WKFe8A4PBH7k26q+EzRpduOham+g4l4tIPOHdx8I?=
 =?us-ascii?Q?5RCUO1gWfykZi/IcCAcri7gfcQxMLW8sabrVR0s98QTsEhNxyi/NGlbh2D9L?=
 =?us-ascii?Q?u9ho9gONJuKF+wAxFSRs+/1Yh+d68X7OIZuD7P1oXMCC6x4A0YO2UmVikOzo?=
 =?us-ascii?Q?5rOnJaJydssJHUtJ6FbnXFzp6EA4BXPuNmddOwusPTT48oOITcGrU1R9lP/p?=
 =?us-ascii?Q?lv2hZmrAYV1vvHWjXJSfTEGmaLMUK3m+ZxYjb7m/0hiO/nOhYH/1Hc/XqPjN?=
 =?us-ascii?Q?kmgg8iiEgWat6cHCnyLdoXDNvwRs2JG9DMaT5nmHpuMaEjtV/7Ozc3PROp2i?=
 =?us-ascii?Q?cc+iBhWCQFvgC+WKUl020js9LDMpT06Czwzq3eSUa8/10/VHW24opXfcvyJf?=
 =?us-ascii?Q?sMwFmIJSd4zL8KmQ0xTs2yhF11fyq9avtlqqfeqjzNIYhH17wxFJPYx5s6El?=
 =?us-ascii?Q?PQsbxFr3z7wsM3WRywm23MROXMP85mh6phHMtueIHPPHNv3d/0KByMbOazWj?=
 =?us-ascii?Q?ycuPjHT/w2eLQu/big7uTPOxhFpYHwEArVSZkQj/wyfEt5n3LitNEs8+7GJy?=
 =?us-ascii?Q?u3Jl5k4wYZ/CjL5b3Ql2wKU76/N3J1gtrw5AMYf+nAtqXP9S9uVePWzXhRJZ?=
 =?us-ascii?Q?IWKMvmLQMqMktd0KUl6dOKp/PNUuppv8HIFnRO8w7hboxuXQeTb2/vkcoVV1?=
 =?us-ascii?Q?1evJ+OLu1Hv692y8cWER7Clml0qnSAvNlivT0yhBwGQ9fPV5bpFo6fAUzY5g?=
 =?us-ascii?Q?I4v0dhRh7kELvI/ka2JFKb6157kYyESWMLpikhPOJQ1Q10Q4Gn+RCXM8zjiF?=
 =?us-ascii?Q?14OIx9R/XbqSErdUvbmx6GucOODW5R4upnoZp6gAEDb60O7at5R5HCN9tW00?=
 =?us-ascii?Q?GP3lFXCAlqmZZ81QnrXkFCCZNl0hvJWvqkdzMy+7NnNDaOho1r1oiflMdU1I?=
 =?us-ascii?Q?ILsKvEjwH1E8qwbIXhuSqIOe8xV72Hyp9PSWzAMpv8PDUtusX2J9Uh0MBXYt?=
 =?us-ascii?Q?cy7lzZmM1G+UqfALUYyhMXbdNs2EfCOMjgJYYf8/5B0K//Ja9oERO074+pHR?=
 =?us-ascii?Q?nPTUl1zfjLrwjj+r+onINt6r+0th5U4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3o26UoMeldhnbBeqTvYjT4tTPOGke+xoWP9Z2eSDGhso7p0DrlWVgo2f4qhpuPRM0bYZFaCTyg+xAF0u9q5pkx2fghqOmp0YEHyZy4ApycN9tVq8jPyk7Op9JVQzfHY4wHX6MiPfED3u+rz/Yc7bIXZP4ZrxhmCDENp2Lr3KZl2xcx5riVyCnrkfoNXCmDr2IJJ1qg8YCcViAqroM+zWJ1PUnZ1OA66DRdotzxAl7lLEyjCo4M+rZzgjZqmwcrRFmeYo0fGqrjh6pgPArFTQuIrQNG47qCkClAuulwL6EuV8nb4WFIMpL5CpTYcOB+LHdJUlr+2gMatWvUXUurEuRaDxoMYVS4g9cAGf11hJyXzRczrSyS8pwJZKEkiR7gN0p1Z7rvF2Bx8C3I1fg6XZK6cj/dztqIZUig/8k0VPHArqK6gsAItB+u2irQOEC7hFaTYnk1yji4NVCIbl0nbP1scigyGxAq0XPX/ZKsucKvO/U3WJpwU8RMEiInGDu2LKEmudxUU9O+CBCm6lhZEZDoYcWLX6DyKYPLIN6EiQfiHjzfs59IOfpO5BBYz656g6oG4CtT4WmhDK+iVjghKKN5sv7TJ8b/4neMLT7gQVkBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe1725f-f989-4943-4da2-08de68bc4124
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:51:29.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JwYF0ALpwa/+OoLDRGvgUCy9Pj+BTZpTAEb2vVsi1qj+NLB4uzLSee4FCwRPXrAQkWtvVLDjr+eC0zNjNcxpd16se0fawcn7A+NySpgsAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5013
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100132
X-Proofpoint-GUID: 1U2L3X1Xo8Bo7Qf7Sqqjaw1g8b_1gz6d
X-Authority-Analysis: v=2.4 cv=FIsWBuos c=1 sm=1 tr=0 ts=698b5407 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=EV9rZ6DVu8w-yJ9kQI0A:9 cc=ntf
 awl=host:13697
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEzMiBTYWx0ZWRfX07YI32SFWc9D
 VoogYDc1NLtN4mfGznBFeghoU1Rr3z702CyOXevYt+/PSk569DAC2WxBOksx1HrmRZ999GoBM4Y
 BCNszNiISNXxIXNYqtpzRarERpZaqF4ggeSF3/sMuw40ZR1SJnVmugrFX98QXJLK3h7m2YD1tHg
 KiVQWrc3iPSOSjNQNqREIlHivH/24FM0W1UsZtKYzcZwmVlXYxHl8sEXIXTDFchPVZ0p23SbzUU
 qzO/VKqP4i/Xhy+7kZftCdS0nFweVhd3DAWkprIhPfezjtB9Drt36FryQjT30dBb4DkDS/dc7P5
 Kf26FwWGpn2n4TznPMiQlEjLWaFJcjR0kj9jaqCvqxWbE+bgGY8bKCwIKCp81t5AsZEHctviobG
 4WKAU94BCNQE8p+5xWO07s+6ADrSre1rW73SaehFFSnoPtE1171inHFWxLNA7pAuOP7VRG9oydM
 QKygGVMSWYUJe/vkWDcTTC8fhwGzeTDs64/0OlpI=
X-Proofpoint-ORIG-GUID: 1U2L3X1Xo8Bo7Qf7Sqqjaw1g8b_1gz6d

For PIE executables and libraries, pid offset probes need to have the
address adjusted based on the actual segment load address.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/sys/sol_procfs.h | 3 ++-
 libdtrace/dt_pid.c       | 3 +++
 libproc/Psymtab.c        | 7 +++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sys/sol_procfs.h b/include/sys/sol_procfs.h
index d195a108..950ab31a 100644
--- a/include/sys/sol_procfs.h
+++ b/include/sys/sol_procfs.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -50,6 +50,7 @@ typedef struct prmap {
 
 
 /* Protection and attribute flags */
+#define	MA_PIC		0x08	/* position independent code */
 #define	MA_READ		0x04	/* readable by the traced process */
 #define	MA_WRITE	0x02	/* writable by the traced process */
 #define	MA_EXEC		0x01	/* executable by the traced process */
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index ed329b9d..5c62548b 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -55,6 +55,7 @@ typedef struct dt_pid_probe {
 	dev_t dpp_dev;
 	ino_t dpp_inum;
 	const char *dpp_fname;
+	uintptr_t dpp_base;
 	uintptr_t dpp_vaddr;
 	Lmid_t dpp_lmid;
 	uint_t dpp_nmatches;
@@ -202,6 +203,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		}
 
 		psp->pps_nameoff = off;
+		off += pp->dpp_base;
 
 		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
 			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
@@ -470,6 +472,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	pp->dpp_dev = pmp->pr_dev;
 	pp->dpp_inum = pmp->pr_inum;
 	pp->dpp_vaddr = pmp->pr_file->first_segment->pr_vaddr;
+	pp->dpp_base = (pmp->pr_mflags & MA_PIC) ? pp->dpp_vaddr : 0;
 
 	/*
 	 * Note: if an execve() happens in the victim after this point, the
diff --git a/libproc/Psymtab.c b/libproc/Psymtab.c
index 40543511..e7197b38 100644
--- a/libproc/Psymtab.c
+++ b/libproc/Psymtab.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2009, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -742,8 +742,11 @@ Pupdate_maps(struct ps_prochandle *P)
 
 			if (mptr->map_file &&
 			    mptr->map_file->file_map == -1 &&
-			    mptr->map_pmap->pr_file->prf_text_map == mptr->map_pmap)
+			    mptr->map_pmap->pr_file->prf_text_map == mptr->map_pmap) {
 				mptr->map_file->file_map = P->num_mappings;
+				if (mptr->map_file->file_etype == ET_DYN)
+					mptr->map_pmap->pr_mflags |= MA_PIC;
+			}
 		}
 
 		_dprintf("Added mapping for %s: %lx:%lx %lx(%lx)\n",
-- 
2.51.0

