Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5634DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909190; cv=fail; b=EqKADnl9oe5aoU2HlPJI/fy1LgvAFjWQNvud6FScTSQ2XSzc/JAKcRdYsz3bOxdZR4BSLgEjP08AqIl8DspH3dhAix2hBLIUOrPZSgoPaBxxZ+Ht2JHO7WMmsYNwQrJslwYmWNhlCOXX43Y7aL8zhv+HlAQehQvw0P3C9k31L0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909190; c=relaxed/simple;
	bh=34k239fQitCOFTt40lAuXDW3Zb5E0RX3D0ynnTGHRQY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ft9gD+RIbaSAhL8C5oWUdpyeu4fqC5OKDQ9Uw5vspZ7qEHW+/0Szm20jX8X8cd1uibdjUz5Ry+lmNsqEr5ZPQAvGe4fb2TVO+ngy9xP5Fw1ikqKdUQ6ZUIXLVYrZ/1oNDY7ja/g5rilY24SykVknMZYFfKwtLbBBDaRIGUhDjhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rtd43GFH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MhFSkk8H; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rtd43GFH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MhFSkk8H"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fUKW013611
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Cq12nH8i8dgNLA
	QRgt1Rc2nRHLL4fEXX7ohV2c20ags=; b=Rtd43GFHUzu87eRy0NGPRhSdzEeeZJ
	lMHkkWWJg5+VZ93EOij1wWEdkClLPvUKd94SMpozRJ9I2iYbUBuVh8uHfKE59uQT
	ZQKnGsORKsI/2i8nsWhaikALQ7Tz1sQmH8884xePN92GaTOV8oVVmbZ+tPvjyKq6
	Fpf3CjtI1HXty/Nu2K7FXMmysuk4dX5gydy4m4RJGI7Y8cqjMQF+2yIFmfYWKdxq
	pQ3WMOQeivWbcZHw9J1m3g1kIxUvrMx+RG+63nyeY1iZ2GR9rc2NAUeX4v6Rt+ZX
	hsBqiCQUlKRfZtYslKxq2NlhPw2G+Z2Kme7bHfvYkIbGBynIFjoyDLgQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus39m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4Bsjw034954
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp66-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TM9bhHueAG5jUG6WB3K3prB67/ZgWeKi/+HFIgXDi70cPJvM7JvH92QVA91NLYeGXDuUFVmZ+gY5IPtZg7eZrs6DtdgBtttk7yA4Oy07UDg2/GlHODSTYM5zz9KyaShJ16ZvCdNc8LB19Ef5JgsVOKHJ9xGdY6CtcNcz8sUZFuriApXjSW6xSki3DSnaypdFubm6Rr/1tbgEZsSTe0G+lptXfpmGUBH+5SsWNd8qJSsV2+z1epexzGoC1q+nRH63g9cLxi2xcSA8GbedgQgLHRwF/Pnfzuk5x88nhZjSmzeap2ugxRtIr4099y7f2+wY6khLZcxpOwuXYPcZE1LuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq12nH8i8dgNLAQRgt1Rc2nRHLL4fEXX7ohV2c20ags=;
 b=wxU73+0TFViILf4Lg/iT7hdwyDJTg3X74gAH4DQGZ7aHYkThyOb7pWN/xiLksh7177BfHoSLeJZY7yrrKahFai90W4kJvxxMbw6MMyFQ16Cuwy1s2LnN+6UdS+2wj5bjY8x4BzKx1zZFKhSBH+jpkwOaQFJiJfNlWhdc7sZyyWKoCn1QqJOqlNR3a7C/3StcdOX8u87StY9kqVXNZP7GVAiA1KrPEQ4axiqWtSYGHmnR/+Z7akEEMcdxibzZBBQnHkItDxsGlCQfADww4BPNHuXCEG5PfqIVulciirMBH2t3ePgOLRmUOqtZ7yKxm7ZtlAZN5TRizBlMDhch3QHHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq12nH8i8dgNLAQRgt1Rc2nRHLL4fEXX7ohV2c20ags=;
 b=MhFSkk8HLpAq5ikKzTBHbsMsfB+5+isdvsiYWt+IVZGEdskG/a1kprgwknB3rGqWS0bunECV99XYZ6uzgKvHBsPAj01mP6tX1yK7VH4UDih9jaurdnlZgxPDYgYyk3cw5zWfaafI2cr9UaO3XYNrXtomIHRgMWkHx7hG3Y2IJsg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/19] Use usdt_prids map to call clauses conditionally for USDT probes
Date: Thu, 29 Aug 2024 01:25:48 -0400
Message-Id: <20240829052558.3525-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: a36cc5e9-b51d-4560-c015-08dcc7eb1f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6suQLRB4PBeXOCtpthuxaJ8tdDcze347ZbKy2EbiJfAhH1cJmB7uN/1DodrN?=
 =?us-ascii?Q?67Ap2BVRnFlQIYm9p/sy1qqzJT+1DrQb86JtaY+lqNY7RuhF9q3DUR/mOuFD?=
 =?us-ascii?Q?cZnj5dRBUvUVLtFosJyqUeqyJ9iDmNDhGAokwAuBGThxtNfV64Bnl5LuWLW0?=
 =?us-ascii?Q?9P8APimLku06xfyaYAdkDpbxHMvzdmSFPw4X1Gh2kqo5MTW29jQqRarZzgpp?=
 =?us-ascii?Q?iocLUHmgf69q3JfYbnOeWqsTzcC43XEoo7El+MQLeBMP4MF8zatrWqIkA7kL?=
 =?us-ascii?Q?s/l4iM764pQlx/7En/zA4lIqSlQc0Qti468216E2WNv1lAVc8Pvkcrqhe0+i?=
 =?us-ascii?Q?ZMZyidKPZsHEm0U5iWrDXYBmYDbPAdnMKWBW8wiPY/MSXiJaXT4tcY+YeXc1?=
 =?us-ascii?Q?yyNrMgAmKcMRZ6pxDgqSh/TPgNvUMUcxFu2EzM6n8yPNNX1zQ9SG3pQmRIxJ?=
 =?us-ascii?Q?PTgzQbAVDSCguqHIZA5epzP8dmF/WKATUWh8jD3ilzdw1SQ5y2UL94TSQuz7?=
 =?us-ascii?Q?inf69eNgWvaMUZhxHzNJpKCm45wcS+E2nEkVRAQage1QzWYJQA1pCJuSnFje?=
 =?us-ascii?Q?GbuHndX9682APKDCRkn7X5j8vaKgeCNMjjJnNmIEJU/lyt8PL2azMgUfAspg?=
 =?us-ascii?Q?SzooQRcE3Rtq7PPCLbZzWkQgVvtJj+2RVtp+A3Ief2oxfHsz8xorwnmWAP7Q?=
 =?us-ascii?Q?MTU3zwr9KL0zZWpBQm4sTPJiTQYyb7NAlBMAOCXAjzGOuNuKmyOswIeBT1xp?=
 =?us-ascii?Q?6xatH/QEOupyw7oyKCiDKTIhwsQnw/o+GFz1gBGjABet4lO44Gs3wswKzCLR?=
 =?us-ascii?Q?icKbduyFp7+wDBG/0u2SU7AL53iGap7M2BkZ8iFkJER5Ccv4eIwdmUOGg/nh?=
 =?us-ascii?Q?cy4FZDnwBbDU8vSjzKKsKylzhyUZGRh65QQDuYT8T0CeuPP/caxTvBZzqcDx?=
 =?us-ascii?Q?9vzurH7TSsqBcduiCHyFqtzQpyH1ewTVN0lLiV92LJkgy1DAGh7gOMu+Bvl3?=
 =?us-ascii?Q?vAyCHHQ2kjhzHs60kcx0guCKzlqWMKGHT9ARMS9pmAEY6txsa6YdhrlGoVc3?=
 =?us-ascii?Q?Ofns6yrWoj9t6WmQdgIn0+GnioNnwqeWZUELjL/oeFTKFFn5w4ov1LXGc5s8?=
 =?us-ascii?Q?UmHaiIwpQFb0NE7zd+gw4yOg3bwrGoJz+0F16+tk8BkRprd5Gab4q8TsEzjm?=
 =?us-ascii?Q?z5FSTb+OMV46tu5orqBu13d4SDBqsZ2vijveWWXcBbrXpASrLx17t4qaQCXQ?=
 =?us-ascii?Q?5hogppjQuyR80CbfSUmwe+dQX89Q1FqrrcZo064Cx8OCTHgt9Lx0IqzNEWDP?=
 =?us-ascii?Q?oLiTEooIgrnpFXcw+gPPIHaWhSeLRvNYfnPmyYolFPOaig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCwm2WvCZB+55+RuymWBuW1pL7vyg3ouDz+BXyr4TuD3EGj40MS3Y6wdquFE?=
 =?us-ascii?Q?ozh+pOBdDB0JUm6aCcGDq+RvGNS2+Dy96KOsC4Sidcem0hSYOqwz9anfHPm4?=
 =?us-ascii?Q?o1UMycRhrRZ+5PyIsqSwIRlOSH9IsAvN2WAbzBnW5hJXLeK6RGXEG7mTi+VT?=
 =?us-ascii?Q?16C+orA5GM4TiMEWj3ZY8BQ7rHijStTjTneu2XP9JBKLQ4pFLmFTRYCd9wF/?=
 =?us-ascii?Q?0LJF5sYtGuwVse67HzvmuQ90Rg/QOa8DrhCt+ljcjTrLQ0qENoDhatYDkdW0?=
 =?us-ascii?Q?MGDma2CPqfXO/e/Ea68vRtc4m3lRxk5Fjf40LBXCvRY8cOavgk3Swj1lGHa/?=
 =?us-ascii?Q?FsryskfiG9IpcGJ+TYAFN7ViC0ziOh2OuTHfj4JFJ3ehwafqa4fSCSpFEN6K?=
 =?us-ascii?Q?03digSz1iKgIdD3SpejeKLfUY2TjjjbOU+M5TxL4+gU0U1U+v4SR1k5OgOiy?=
 =?us-ascii?Q?XFlFIcd6iE9kjyWAFwWytSLUqhmEb9xMerYv6uXx9YbQi+oVJPvlpBHyGWUk?=
 =?us-ascii?Q?273VUp3JKvPAF68Zz8aTBF2Er/aUsKfZljlEKyKZBbv6/AuqQsyY+T+/tfNr?=
 =?us-ascii?Q?wsaieRWABtxhZdU4xn9JmPNTuOQViWrbHk9DJYXQkoSpDAsIxgIWq1MLXdqq?=
 =?us-ascii?Q?UC1bOuaFdJZ/8Cw++9N6b3xDBmJxxmthrjxiNDnPJwFB6hK2oMQDP6RMLT90?=
 =?us-ascii?Q?goQpupifMftaI0hRYF6rTtb/WsukBYdJvYGKmW8nLdrGO7l7sMjBRb0DLC+p?=
 =?us-ascii?Q?DtLcMrs1k9GIgHozQgtYzTCnWQW1N7XTRVmsxg/8zysTEV3NqlfN65/GTVcZ?=
 =?us-ascii?Q?2dliDPljr5Q09Qquo+frz5VfV3YhCkkr+rpTXzKeZGTMUEpxbFxsdG2OrHz6?=
 =?us-ascii?Q?5RIlh+Sx2XoJjgve77c+QpyHyxKpx+goaU6izb3cMatBIeRbOb5mkxzlz+RB?=
 =?us-ascii?Q?Ad1KVHAfNMF5M7Yq+UEy+3oiKl0VVrn1pZjeTIz04vGr6P7f5DwdQk+erW9J?=
 =?us-ascii?Q?IRJ9KNubhN4OyxDyXYm1HaOSOYi9K8rHedoWnBVVI+bb9ze2f+9FGlEFh3By?=
 =?us-ascii?Q?7yNgX+XkHjoGZc91D0tz+mDGrcbXnzXX3RXvaA59Hkoi0hThb5mWCSepP13B?=
 =?us-ascii?Q?JzuSvX/C+UzZ8SnDALpeuOYqiFDpM9QTv6XcDryATEhKFvn7quHSD7yzFMII?=
 =?us-ascii?Q?knMq9YCu9WMtw9wAEAPwpWFg0K9XOeBwGXrWT8T1G5Wzxo1/uMBgoEKTe0Iu?=
 =?us-ascii?Q?8UYW6wsXHwzf7F1p9mTtVM81X/PHAojT2R2XMBLA3YiJ2MFwvO9uh/jvcrW4?=
 =?us-ascii?Q?LvwBjJRhZTXFuhlmHv4mzhdSjsBqk8x5KnNQbSykKkbT6Ze+JfyYWtzfmNtj?=
 =?us-ascii?Q?+ow+HFwI9vWXl9iIYpzQBGBInxyu3zGnJAkvo176m8KKWtxICviIVQ+fRAlY?=
 =?us-ascii?Q?JeU3ztxlrAJYBrFkRNu1CMHH9NHKzmViOvqx17Ct/18ccmg7cxASpPYxzt+K?=
 =?us-ascii?Q?q+4iCOvo2x4SeVn5day+1eqbo16kakk8+OLa+VlU0VJKHGBTYLIzpUiwrvyu?=
 =?us-ascii?Q?gC0ohQ0i3o7EuuHrw0Fu8O/ZML+l6llq4gK1vg14?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UsvTNZZlE2iaqmWT2YCDm4jfWB4viCkW3lK4poEx+nwnJ0by/czLo7svEVsbasRBbAdcl2Br+K1h+BbVBHQG/xY8CEv9fbAxLXzN6s3hkY/kBUP5n4wqjofgj+f790Qd8HQVYNSoU0tglG7T2L0Rtz1C4jo4+amQLCjBeddJuF/kiPaOlGIEGfr7K8Cs50143RKpE50oR97CAcxGVXh9OrFuRQwSXlO4cNhjU+OpvFZstHx1kgjzyZHDLuh4hPM3XpE3EUvz9+2q+zZW3lYdCECFxrfddkApDR81V1YpQmAVI15cCtNxUmRL7ohGv/KwF3Zg69gGFpqEWJkQJ/UXOvVXLep9hZzCnsrg1NJaJgqwFAmzMBsGM9YVe1dXn7Ut0v2G3pD1NKqwXTjkA+VynhxxUDowffH0wK2CLQ1ihVTRVXn8YoPgvAAsVkY4ic0jrgTz5G1rhmUHYf7RUU4lQHAkCijiquDL+Hp8WSSnR8jn1ScgxlXqi3QKeKWTdLFKrWuVcWPS2kBUHvmAKlYOIo8tilVyTAAcHumHA56+8U6F2znsnFuVTeMYxOciPi/zN2upZC+pUSaeeM+q+K8l6MkLnTQWPIwSN+RdATeyjlc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36cc5e9-b51d-4560-c015-08dcc7eb1f05
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:23.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/mO7oIgz6CGl5Ea5PYqNujWlVm3BXhcWDdrWDiJxbfOsD45LqEpy0g3NAq/mVLEpqzOZ78JXDdU75pcN3Z2Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: lj9GFOQ5yl7mTTysGOZLv1t10DcWVLzt
X-Proofpoint-ORIG-GUID: lj9GFOQ5yl7mTTysGOZLv1t10DcWVLzt

From: Eugene Loh <eugene.loh@oracle.com>

This version supports only up to 64 clauses for an underlying
probe, but it can be extended to more clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 159 +++++++++++++++++++++++++++----------
 1 file changed, 116 insertions(+), 43 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bc5545fb..6403842f 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -681,11 +681,16 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
+	int			n;
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
 
@@ -697,14 +702,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
 
 	/*
-	 * Loop over overlying probes, calling clauses for those that match:
+	 * pid probes.
+	 *
+	 * Loop over overlying pid probes, calling clauses for those that match:
 	 *
-	 *	for overlying probes (that match except possibly for pid)
+	 *	for overlying pid probes (that match except possibly for pid)
 	 *		if (pid matches) {
 	 *			dctx->mst->prid = PRID1;
 	 *			< any number of clause calls >
 	 *		}
 	 */
+
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
 		const dt_probe_t	*prp = pop->probe;
@@ -712,6 +720,9 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		pid_t			pid;
 		dt_ident_t		*idp;
 
+		if (prp->prov->impl != &dt_pid)
+			continue;
+
 		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
@@ -743,6 +754,86 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			   BPF_NOP());
 	}
 
+	/*
+	 * USDT
+	 */
+
+	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
+	if (upp->flags & PP_IS_RETURN)
+		goto out;
+
+	dt_cg_tramp_copy_args_from_regs(pcb, 0);
+
+	/*
+	 * Retrieve the PID of the process that caused the probe to fire.
+	 */
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+
+	/*
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
+	 *
+	 *     offset                                       value
+	 *
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
+	 *
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
+	 */
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
+
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
+
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+
+	/*
+	 * Hold the bit mask in %r6 between clause calls.
+	 */
+	for (n = 0; n < dtp->dt_clause_nextid; n++) {
+		dt_ident_t	*idp = dtp->dt_stmts[n]->dtsd_clause;
+		uint_t		lbl_next = dt_irlist_label(dlp);
+
+		/* If the lowest %r6 bit is 0, skip over this clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
+
+		/*
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
+		 */
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
+		emitl(dlp, lbl_next,
+			   BPF_NOP());
+
+		/* Right-shift %r6. */
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+	}
+
+out:
 	dt_cg_tramp_return(pcb);
 
 	return 0;
@@ -788,10 +879,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
-	uint_t			lbl_assign = dt_irlist_label(dlp);
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
+
+	assert(usdt_prids != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -800,7 +890,6 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 
 	/*
@@ -818,46 +907,30 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause, as above, except that rather
-	 * than emitting call_clauses, we emit copyouts instead, using
-	 * copyout_val() above:
+	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
+	 * will be used on the BPF stack:
 	 *
-	 *	if (pid == PID1) {
-	 *		goto assign;
-	 *	} else if (pid == PID2) {
-	 *		goto assign;
-	 *	} else if (pid == ...) {
-	 *		goto assign;
-	 *	}
-	 *	goto exit;
-	 *	assign:
-	 *	    *arg0 = 1;
-	 *	goto exit;
+	 *     offset                                       value
+	 *
+	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		pid_t			pid;
-		dt_ident_t		*idp;
-
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
-
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and copy out a 1 into arg 0 if so.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
-	}
-	emit(dlp,  BPF_JUMP(lbl_exit));
-	copyout_val(pcb, lbl_assign, 1, 0);
+	/*
+	 * If we succeeded, then we use copyout_val() above to assign:
+	 *	    *arg0 = 1;
+	 */
+	copyout_val(pcb, DT_LBL_NONE, 1, 0);
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.43.5

