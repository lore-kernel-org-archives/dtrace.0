Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4F190472
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462231; cv=fail; b=tizrGTT+hCLCxc08cuxEAWJbrmLd5abLMXaYTcxXB61+MaqtOz6S3UeuzOm3OJONpTd5tTCMa6lcwu38GKsaeh/e95k+3NiaVn46+7J1y2pewgpCM/U0rSYg3s/fGPhGWaY5BU29ccgMQJbErdoXCIqmM9QOdWEUVu7bpVv+DYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462231; c=relaxed/simple;
	bh=2cokR1ULNTdqKg0emDz1H4DXAQMi5+l0VvGjsHWaJKY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=UPA5he+jrITnX5itA7n5BAFW3TUdiT9cufsUwDItYX0bhfHaW+1yBeDrZZWAWXwQDGTdBBWU4clojvz9orh3gNCvP6PzhSbmEPxHyrOy9pRQFKJwdwlTB1iQ9oWfZ/1ws15jkgV/SjjL7e+OODctlwzMb4PzgQNsxc+GDm/T56c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yoe/DnO/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VjSx5XCO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yoe/DnO/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VjSx5XCO"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCAGX011129
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2cokR1ULNTdqKg0emD
	z1H4DXAQMi5+l0VvGjsHWaJKY=; b=Yoe/DnO/dayE7QepxTcLX9gfkZ3JCFr8En
	wsi/qNaI/8UIGeNgWrU5N2N0mzgVx+D+YfVmmvg3rCMQYYUq9qv53QMtU5uANONn
	N4wogxc1dncWRNUJbK38en3XIewsW0CD7vzy91Whr7ifnA0oVVx/qSLn2nu6igRa
	Cp6KKwqsm++icc6WgFGeEFgLHFFDYJH+v3flizrQrOPsVr5y5d4VHB+TZW7ZX7yi
	KvLKl5lTfsRKsxHQEUxfJliyYYLDuo3B9/RGpoePgr6VmdYxipUEbSltDv3mYJxr
	fLZ79MHoelsj7aSKA146IyVpH2jn3sHBEo3Hz413yHb2q9mGG07g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w3vheu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:50:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PFYoBf037748
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:50:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tdb8ja-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXbeFMBosPKg12veSDO61bSl+V+bM6nYJgJtg7ZwlVmQknMNT4ElPA6DvhHr8jdi+WogE2gJKSs6Afu1OlbiwF4v+aiAke5RF8LkbDy2oOjeaEMbL8TjlFdD31HhCJTWKndlme48h9/dyu0hsCPc7kCkX3VSHy+pxz/is+hPNNyRW3dIWoYGKwepFkQYbJhSOd2oFvdH86gJJQNuyZnJhn/M7uXyHGAcel381POQ3TrNnwGSW7AheCisl8zkpXM5vxWofyQGvJV0OR+53oyeAmPcj/rbEG7qWSQuDDcpUaRMdiLcvTpnlRuh9q6FnxwAishjsZ9CGAqRFAOS7vJsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cokR1ULNTdqKg0emDz1H4DXAQMi5+l0VvGjsHWaJKY=;
 b=u65CNfDlN7ug97PNs2fAMNvkXKoyRyk1IHi//jLnlNfNlsEqxXMXuQHX5ES2CxP9LvwBQmCEuT34pzr6eGsX66Awcak8117x1u5DIeSz80rx79GIvVxMSq2wsJ81EI8ncqCUtzmpKpzzZnRseZOyJTkct2sM+qzP2QhjloN3Eyq7WeSBLMYjPRteA0cwqUeOcvPSYg4CaKHUdGhLU/zQsxbsg0QFy1ZatH9ZLmLtuJ8dawIXnd1jmO1QeMyjSQuQ6wqi75ZQoS5rNaBfDPI3aF6zh/tZVfqV3PuxjlXaHWBYhM0wTz6WipbdlEx76VM7ducmT7h1m7TW0LH05phTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cokR1ULNTdqKg0emDz1H4DXAQMi5+l0VvGjsHWaJKY=;
 b=VjSx5XCOqmaZNcDX2QwWuU5JmOTV961B5hES0NebDtK0n88R06U29cZ9Gn3+MfTtGvZyHodmrwyaI/+G0GOj0TDRcOHVUMHnxkZd4DiR91eOd/JIq6q+Tt7CDAoWBokZRye/8T22EjDszCnNqTDCUFL58PiAyKxBFJsMTpTEkII=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by BY5PR10MB4291.namprd10.prod.outlook.com
 (2603:10b6:a03:207::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 16:50:23 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 16:50:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Update the VERSION in the GNUmakefile
In-Reply-To: <SJ0PR10MB5672401BCE9AE1D5F52583FFC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Fri, 25 Jul 2025 12:47:38 -0400")
References: <SJ0PR10MB5672401BCE9AE1D5F52583FFC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Emacs: a Lisp interpreter masquerading as ... a Lisp interpreter!
Date: Fri, 25 Jul 2025 17:50:17 +0100
Message-ID: <8734ak5i5y.fsf@esperi.org.uk>
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::24) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|BY5PR10MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: a66f65a1-cec6-40de-c9ff-08ddcb9b5949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NIuGNJqxFpNhOQVq+52OFObrHi/ng4tjTdRH+t01DjmF59lg56BMWnDWbNEa?=
 =?us-ascii?Q?6K2wYe1i7bsu/1sjIWy9ZAZMkPwNwmqW5miHA3uc3w93zmjT2I8zmy7oBQMT?=
 =?us-ascii?Q?90q8e/4/xSxYf302A3XWZFhtqdvgHNtEMGt0gXTXChtGQhMX5OdMYBl4m70H?=
 =?us-ascii?Q?MsxtXej904Ms0Mc7FikYuP0QiN+0B2KcOyEJ6+8Qb7zynGmXj+zfFcVMSTYk?=
 =?us-ascii?Q?uSTiBg3stUoO8O972rEn8Ihv9SmiGoFkCUqamnCA2RRnjQFluYGp1XAezncL?=
 =?us-ascii?Q?zdXTu73TxTC74qbw8phV6XxZEirZGx1G0b4EoiqgTpFDcQ/6DkBYZFc8mqzH?=
 =?us-ascii?Q?ayJzvLEf0QMifhC9d0zq9lMaVy3kt96YQCjKg1i/fgKriSCaC0E0qSZp7U/Q?=
 =?us-ascii?Q?uLOpxhJGzb+gncHQm5kFwlyFCvGkUzGokFPc/5K/Ll2mux01OwHqiMkKcSTF?=
 =?us-ascii?Q?82eeV68AXHsg7OfRPlZp/StmQYRx5h7ztfkRyYulArUg3dddnaz/xDLOF1v0?=
 =?us-ascii?Q?Es8toUajhwbgfKc7IIG4ComoXyYKU7l2367EdZvYt1mNnDhWtLVGfD9YrXZp?=
 =?us-ascii?Q?0AcvL87OfasGsaC5nlF32ewq45Hn/zZmFsvz3aCro+Qk1p1C//UAlIYigkZK?=
 =?us-ascii?Q?nTERoNQTk205t6X//E24TE5/SpoFN/Up0EjleJSV9MzWNb6kb04JfixQQ7qq?=
 =?us-ascii?Q?EWD8A4OC626X0gH5ZKd98RY1v5JbT1bl/jvaY+/NnAuuQOkIu8GJoxnhGleO?=
 =?us-ascii?Q?efVk/QKkVFB2vCCmmVk+IcMyQm7sJOGsj8SW+l9fignkg01bhwyK224mIw0N?=
 =?us-ascii?Q?fHZuod2qVHxZY7na+M0FpflLo06CjcOeBUWIjJasVIl1ClFnMIqulyhgFCrv?=
 =?us-ascii?Q?v1G5QkmGA50zSTXIOC0qsPScNJK1g5T7fjX2iLaLy1hR/SPZpYNqiueSKHJS?=
 =?us-ascii?Q?e5rDbb4wZcOfRGoceMXZkotW7qciDsOJPRG0cF1R4vN2dnNh525I+3Xlqtia?=
 =?us-ascii?Q?do27lHVIYEXWNdDIr07gkqlX4nO1HV9K0gzG8zzEdqY+Seyh9rI2Ajfwl4He?=
 =?us-ascii?Q?AGXUszMRpJcWTBsmozqDraix3q/eMOolac0QkcKA9tGycgvBXlni4AOZ4Fjr?=
 =?us-ascii?Q?D3CGLaf1vnokiZxjicp/MmAkYqwwaq4WyEIqlaaGFp76SnzvJ/RoshUMDmep?=
 =?us-ascii?Q?CxqpQHM2/gbGs9oAhQ5L7QN8bpenaOSXeqlSQ3VKtwgaCRzprl/k+UMzeCRR?=
 =?us-ascii?Q?riY/cV9R0qeK6P6e7uGCbgWXN16bMGXETQ1ktanr7S5Ld5n7cDobavpl1hL9?=
 =?us-ascii?Q?hYp9nx0U6yVtF5JyAeg7nWOq+W4l0HNDDZu+NfjEmn+wmHxf2nq24AI021IQ?=
 =?us-ascii?Q?wQBvvELu+wjPNC6dYRo0geo6TRp/sY7DfeIZNO/anQ8lJOJvsqLKCFDIO2dU?=
 =?us-ascii?Q?NpG3FRxHaM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?smwkjaka4rMaa8XuXB0fDQ1pvJ5xumhOfnf7vuuJN8M1qlPP1jxNNdrh7pSg?=
 =?us-ascii?Q?HYTGwacgvkT7yOM4+8qScDViw09T2y4aEayU6io3IVh/R/GciL2UHrwv+QY7?=
 =?us-ascii?Q?oiYH6G4BU8l0+Qk3p35MMs3a+J1sHIRrMQDUvNap3UiZdP4HamjycXfNoJze?=
 =?us-ascii?Q?KS172C4LTiOflpSC2bIPBoypDcBF9YApqV4Xf4i7GVzlIT8qOthSv22YHAwd?=
 =?us-ascii?Q?p5eN/WamWDG3W6I/JuDPKj9cgA8AI6Z2YFbAivA9eFNoISmjeBAdoajrLG1v?=
 =?us-ascii?Q?pRvMVdcljG/KrAO+1iwIpEZV0pXejDdG1CcxQBZ8oMGR5uWxe6isci5k4hnj?=
 =?us-ascii?Q?OIsycn5tmjtYe95C5u1p5FmWCTeLiPsZkxWtJDkjmi6B5N2yfRLIw+gOgiol?=
 =?us-ascii?Q?+NMbky4CGdfm0YKAZ7s23cfvT5kKgd51S4ocIUaN/aKvFT1KCV4c+7sLHPdY?=
 =?us-ascii?Q?5b8yAuBCBg+kSS2qnrfkxxqbua001BbtNikS8BQ/0C8Tvfa8Xf2YeKLoAFYO?=
 =?us-ascii?Q?qUHF5HvPPROMU+7gVjYKbDNm6RbMZk/VQxz/DEAkuSFhj3OyBpkmbgdK977O?=
 =?us-ascii?Q?GWsHc7jcBvg0oTnOA8zNj/hqjYtDmrf+XHaMKyyaqlAm7FkmqrYvQ2+El0dE?=
 =?us-ascii?Q?ds/x/+F37PHgA2yWnP6qimvICz+GzdLsAswhPFDwGs0eH4tXRM1WodYyvsUm?=
 =?us-ascii?Q?iFbFMT84pp0B1TU/3ZJvGXByMMcHYP+zwGZSbsoDs+KscJPeTZ9W262nxqtl?=
 =?us-ascii?Q?E6Lsqdy2QGSOGMGioTvchEeU/cmqiXQcCYFtklfApOFL6FsFvGeW9lM9Plai?=
 =?us-ascii?Q?AWFuD+SEQ+njaiar5ykt8BIHJIvi1M/pIMaNL7cwLhNPoRYSOrXlZjMRQGkQ?=
 =?us-ascii?Q?t7EA6yLh/YPr/8dLvN7a4TffiEoZSjh4ubJD0JODGS7X7GCWPpfKdp5pF7P/?=
 =?us-ascii?Q?xPWTaZQEGXxIclC7OS9rFUZnJh/OjXAT9PCWx8kAoTvSNZVWsadD5i1HNzXE?=
 =?us-ascii?Q?/nhpWSEdZuCqoxF1VVGLsspAuMWCDWymqHQpc8lx9imTfkxCTvDE2czQKyCt?=
 =?us-ascii?Q?kFeZl2Qf3OO1+6PAHS36osxRdB4hnM3rYNShbvQqUsUQkAsomVGDC5w/AmRR?=
 =?us-ascii?Q?VNkHoNlw1x+cBSdkfHv1KmmSI54cHFFCSNy1haQl00fX9MJ9DowmxAMeBGam?=
 =?us-ascii?Q?7KdQmLMDxM7dMDHrKFspvw20bnsvYXjDmNRLMqqHhGd/lrU+KP58lJ6fKD0n?=
 =?us-ascii?Q?RBjwMEzk475s8KOmsjo0THZkm5QLw9g1AZkxFRWNHwsuEpl/dqprY2m8+Ve3?=
 =?us-ascii?Q?q/eoD+GnI2+ChNKamAt04sLUQ9ACstb4AbNrnHuc6dUd3bGKSLvAvMVmQhzC?=
 =?us-ascii?Q?xd5a2lqFopAxi4VdHVdF4jtdCzDuyszm3cHp/5hORUKP7ChW+hKH5CW9RtpK?=
 =?us-ascii?Q?c6vAIVnjY6dpytbiFlYs09YXTFqRV8MxGh9av+eE4o/wmZXTbyyIUTxUcGex?=
 =?us-ascii?Q?YUOIayEioq0lqu5J8uBuLvkJitt0YslaZtHQhyuIBmIrgG7X/Z2G+7x8cDTq?=
 =?us-ascii?Q?yV6Q/GGBhC7uy3nBpmSUysPEm2NMbaEPFhgy0mGBlmF7joWMnrJV3KAiA0kZ?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wun2ez9gldsfcpB1bAIx3fpNxyfmkxRSX+edcXOgpjr7NTtvAv7h9NC4P3rEcL0AqX5l6KDzQEBrpbAmLO7fQaxyRlWUM6c+FhSHfjOOd1N2ROkQNm0LZIic1+kndU6PZ3Jr7e/vrL/f7I9DQ1eN6C79QOH5ygf8ylXW4X7Cm9BbQspaco1Vz8qhDhAobIEPHIGghHLYmVwA9g2jZS2jMb9kPY4lqNPhZQg/rk6vzJk8/MmBnILPbX4NeI7Wk680JseapzDj6yzBTOQPFEfZAoRyktdxS9VsUzwlMp4hJtGl+dU4YHbmgb0DBwA0l1JjEczGjg1viMkwfMA3tuDem+Ek/BFaFGae/BugXVn/eWOpEBNCvbquvfQFQbmFu2/c1+dMtCkKqsWFzS4HCBbP45NBSwBVaBmrEap7djl+RuX7GOnTkhK2Q0fA7LV62KE8Nlkg5MRMw1XY6543/EET+ZImxi39b2D2EMwdVoYOZ6ta6+Q1shLiLUIwgPDs5+NsGQ+u8DUKavEPpJgjFkJhZNLkEY3N/LVtb+YT/rtQRzo325USIAJx/WLrW2zmK3zbNltJm8OMpazCT6d6Vdmz0toNfqyG4bFTPYF/kGlt0Fg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66f65a1-cec6-40de-c9ff-08ddcb9b5949
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 16:50:23.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jI47E1TkK2WUXLo5Clqp6iOF74h5kVzoMlx/FA8jxATXJhqXTx8CfAjAYzFJnicrbEwdFDS32KtxMu/0TqzTyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4291
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507250144
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE0NSBTYWx0ZWRfX2nplwNZhZGWr
 Wq5fECEZJWtqA7khIX9/B+2VMlexigK5TtYSYXCJI58QeWSHERNlM92+MdqXL4jLNiwhKFliwoj
 skQZnt5OKYa/h/BXuG4Do9mP7j2ukpfby7EYOhCrw2C3iwn9Jb46oJxT2tL3u5JMP7xPvXXDcOt
 WU4f0ImKeKg3PyQkppAINkDiRX8fic2uUjY8Zj3+jU9PMt91uD1bmi+jaDZYQDH94VxnJSM5nO+
 PcvezH7DaWQtJe2v+AO1qfOKfGnIU/3QE36pcxzwnk8LDsAToAX6dc+Inn3qqMkrVNVarnie/E4
 ytpxNr1Ne2LgpcSlnIn911ecV+JU2IDuUIcN7TNm0vkv4mkZBpxLsIe5D41BPAzZt3oaNTVVwPu
 MMApZX8/+B1u2NreWaPs4Drh4PQpIqiiPX7btX0wk1o6VuidzE0+nbkVHrRE+1rzNalXmEBm
X-Authority-Analysis: v=2.4 cv=VqMjA/2n c=1 sm=1 tr=0 ts=6883b5d5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=rgbSgOcQgZKjIvJiVvoA:9 a=W8W4e29Vb2oA:10 cc=ntf awl=host:12062
X-Proofpoint-GUID: fYKguU-ER5guULxTxUV2Jaj4jSsJ5Cy6
X-Proofpoint-ORIG-GUID: fYKguU-ER5guULxTxUV2Jaj4jSsJ5Cy6

On 25 Jul 2025, Kris Van Hees said:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
