Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092D8315D3B
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292077; cv=fail; b=J4/y2VmGPg9vpDMZOCefZMwEA7WOUaHSEM8hZ7Bz39iTlxTK3MRwARRUPA7ZRp3wxMRQyZKl/dxYLIUZiaGflE5oFFcWNsVyHKnGe01VaZOCuf5xKzBP2Fo4kB2pdWTP3ePaIwX3DIbCq3oUku+85A4P6FDQ7shmVgMPat/q20E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292077; c=relaxed/simple;
	bh=QgVIYXf0EwhD/2ZVyoPlWTBCxk+pAek7Zo23Y3/OQ/Y=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=DBHjxIVYUIsHke8auXb9j2hqnL/t71PorJFz4wCTBaMoK2b77p2/h4ve/CNF77Y0bukSWnNWPR8V5oGFQY1thP3haOfc/TmZwJHz6bZg+RAuu31Ma53j3gudlBeG+LYwQoAOT7aeHlX+rWnsoUDM61Q6yjsvcZ3CKPhsUVb1h/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CsW5Nqgh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ch98gfEf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CsW5Nqgh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ch98gfEf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7O6qC113374
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0XOm6rovWgxY0B2FKxJbz3w0v+V/lcdkH+Qw6+3I2gI=; b=
	CsW5NqghfJUO0dwQAECHY5EobTYtxKV13g93yq+J3JlmhpajvJbecWU11ZRUs4xr
	887j9xyUWcuLcWEPvtykhlV6MBBsDlB9ckjRtqHcE7D8chBMBu/gIM+RSbStKGFS
	kR1LuYTjXlQMWMNWPjaIO/LI5nIHtn6I5B5XzOISOoNc2mNrKpi65XhQj0rL6C5N
	OjOgvBfdEXSf7BBdsgdW4JIDfMZY6Ofv0TNYopWL3a03l0j2bKx+VfvFi7lsH6Em
	Fo+mdo68wsnc4vr8ms3r9VlU2GKzICNB1yTORCx+38WzVVqQ4HO7yeXYujFPeZh5
	+ahzGpNtr+jrUDMCpR3aGA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe74k8pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:17:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGD7JQ014518
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:17:40 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erh0u2j7p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:17:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4IhmDz+AwONsrwe0LBzSJCMyvir0UFVklEY6nRgNSEeMLoSUYJFXUd2S71PWwymF5vUb+bBHbCWepTvTQIi89MPPl/+IWQ5UGiIQ2RGcwiL79b9wRHHEUA/zkWLFv8XMA1AmMkqLa92pZgQthqsWeVB0kIZ9uLOlo1M1fboUShWBs1MgQkcifiVq83amNIiH/U1b9JiQaABQKU0wY8uwErnF/85r7M7atjQJn6xD3GwNUwgyjJzZ9T16qQIOEshqSNoBJOKefGu0XmsItTG4OnUJtuUvNZfWRpTnJ73oX+9hwixStaD01ZIBRzaIGcZywz4R2dh9F/F9pMO1uJ1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XOm6rovWgxY0B2FKxJbz3w0v+V/lcdkH+Qw6+3I2gI=;
 b=DmafFpqlqGCdw6umedwVS3P3wEADuggt7q963V4qzxtXk3Tn6iAkBybVb1HroMSNMDxtjwNm7Mn6OCVGBa29rBa9CLSt9O9vLzSIohWPXnM0nFzkDVcMSSkDpFBkgwSJ71XCZFLwz5nvOf0yIOdsaIv1Uqvl0Y7qOtBRminC5i1aRuNP4PHvbu/MtzUHGmYJsCo+X3ElfVmPr1ZRgMGUnf1WBVig/TF8CbITGz9Sj2NAuQWWoZTacY7igN8o+vDM0/LoPmqUKMYhVHhhGulGOAG7ITnnhS5Bw0YcCwFE0TjAKsjncXYWgsbq7f0ZfASmy802kFmsfwc/Qq7LiPPdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XOm6rovWgxY0B2FKxJbz3w0v+V/lcdkH+Qw6+3I2gI=;
 b=ch98gfEfIU63Qcq3NvO9VlkHBZH59pxhDYCBsQY3PzroG2pX0tzgXwg6+kq3jSA5diqXBTb12bJrJ4l2+Fx1brSPtNxjw4lNUNhvFOEKuybz1dceklnSLYsiiLwYP5bA5c+LuI+LlFnt/xI1wh1ROJxfsijTmq2JnPbQLRBnSJc=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:17:32 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:17:31 +0000
Date: Fri, 12 Jun 2026 16:17:28 +0000
Message-ID: <223110216617c37c5d24d454d122ff8d@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] parser: validate scoped external names
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:510:33d::12) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f09c05-ce7b-450b-436f-08dec89e1b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|3023799007|56012099006|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	jnAwxv7R0qy6pcytHzfMrSMmraajl8uC7zntuzpH30SpGQbRNBvvqaasx/Yk49WVON3ZafSNxSoaNlHcrP/yVwI4dgFUA++JBy0xiqrcyujuXG8Z4BVy9LPAc6hkPMNP5t/C8Go5v9kPbGzbqsEoLoa62KDOVVO1OfmNkN+J+D4f4stQ4f8L4vJAjixzSVYtwxaD1CQZXY2W6ID5uTHjins6WxOkKZ7WIwncmhlZS/lSw9hRa9NV8aW/gW+kppdChvj4so2DQHtgV9KxH5H32uImkgZlnnmgbb3eKiHhsbytKar0PaT8ObxQshzug+LQ06ZXxEQowmyctcU4SMmGByk3NCgWwJgfn7bOtrRP7paVkyTatnleM0Ht/6dmADL679GIcIPAJChTTmnddRK+mHQCHCtgLefKwE/UQGnEiLcuWeKMk4x78MzvnXgp6vuP7eQct5aewXVcEHi+kzaNooMx6r7kkgsXQmOJlUEihmDwzLyRj3g/xS78yXbJIgkOz4le3P/AMB9xraAQ4ZxbOoyAWzfC4mRGULUmuo473hf5EDNL9/WENv9QJPuhrQGH7L0tupuPKzUXcED/umBJ2WhG6EEUKVH9In38juCq2GifWeUkDJ4Bd24BkTR8W052vyM+TnCKMPNDa6zb6XbGVY82Z/gdySSDZAxBsaECtUKo2o63zQ66Chrtzl2hfdAtQlNIO7D4X6/zioYFuO6OqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(56012099006)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uKKNL8K/ZR1WCR9gH+laFAF1OTuvQ1PGBhN2DVEdX3/szSBSyvMvxauMUAPP?=
 =?us-ascii?Q?Fy2EU1ocYAtGOyD467N4g2Ea7r3XokggCtAR5QccwuVuwg7SWHOqJqV5HQsS?=
 =?us-ascii?Q?27ygVdfdFoZ31QwNgAvjKawdgv7swjgBZWJ2AfOEFo0gA/VRIZrGPwkYB0lX?=
 =?us-ascii?Q?J1UdZ16/fnfP22USI2Jtbp8DxLR+XeYJTkscpkJ1hYMSBNyKmxzWzfxXvymo?=
 =?us-ascii?Q?pX1kIgLRlEwvP+QqmMs2pLqCcQojAxfOWKY4TylXYpu+qFp4qotm54HEf0bS?=
 =?us-ascii?Q?nmr/RHNOLfyL0/rhMlGlug+jjPdbF/HsDit+/Bev58udxW44Y/9c0Oonw038?=
 =?us-ascii?Q?0E4rzSTeLYNKS0o0ONigZfAgS9DQATN4ExwKcLXuffKKo2/Sj1VqjGYQVa5/?=
 =?us-ascii?Q?iWIB604dL2lw2+y+AhqpTZQdkuG8cWirhxp59gPxIb4bcjsDXEji1tGOmYPp?=
 =?us-ascii?Q?KQX261SJsKrVgcB0HW/6+YWaDHDXhEjEY79PVh571nT+0UGgidQ+gZeA0MZ+?=
 =?us-ascii?Q?0XyPHdoXJ/uwTHafncjzbrdq+B9ch4fcolDiWq4hCKKO0rlTEkcZbQPPjVON?=
 =?us-ascii?Q?A+VJnAOP/T1QIVNGRC9YY6jM3D+D7/Lq2o3McJORyyJttoFtgFX38YcbGaY+?=
 =?us-ascii?Q?jrZmCPxaVt+5NAGScbQIIx4rF3MnNz3oMijvP2G5E1lbzUOMDGAUNEidD5hD?=
 =?us-ascii?Q?3Gk95AcycOqqukUP/Wh4HhGiO0zQsDx5qXep5MVk0wER4P691pDPp3aRXZJZ?=
 =?us-ascii?Q?lk5h7PJbKblo2xrkLoYY4c2ONjPK1hzcBsFaCUiWObLvcJJBGNuDZKQvXF5Z?=
 =?us-ascii?Q?76/rq7Wez2dqT1XNY0OW4iyNZdIMFlnvThp0QseRbL1FKFmIr6aLSO5T5zDP?=
 =?us-ascii?Q?dEz/FaWL+9Nx/RCRXR/Cgz0g/kPtMJA2ML51vpoKmmptFMcGRwWmClRp43aN?=
 =?us-ascii?Q?zVRL9jN+iGbqldqKI+Jqn804hk0lNQGoIiaqFhjZTwcGwl2kKBfTVQx2TBKn?=
 =?us-ascii?Q?3RbDlEXfaLMUnrr30RI9zPpje0Wjvtb0HsU/X/OYnHSUVeKFGZA+YTuGl4qp?=
 =?us-ascii?Q?NLxFxN28T8zvUSFfAaikEnhV0kNKfGpiLerop3UiLqTpuipNg2eQx31mxlR3?=
 =?us-ascii?Q?wFflbEAQrJrllrgsp8WuBirH3/hBGZ1tJVN5Aau9TLGpJ8JuFhYXbv4wSOsz?=
 =?us-ascii?Q?s58+TDR59gNyxGZ/pt9ve9lY3ocFQHUFFpKih3547Wo8zxMnUsWARM4cMZma?=
 =?us-ascii?Q?2rStZ5uNkWhBjZ4UWofmuOrWfFAZKR5kRW91rtMW6buseurAlW1gdxu/T4PA?=
 =?us-ascii?Q?gJUgbBdN6dF/TucBl4CjW2f68IXwOovjl5WYHmyRxVQ4ICpiSy4hHuiCdLu1?=
 =?us-ascii?Q?ZKHoYKjC4Rp2GOZM1b5UUY9+elAnBIrG6LHI/fOZTr3CsXWxu1bNmuYyXr3O?=
 =?us-ascii?Q?J1MTcPS8sl0gS5Xx/NxATOgZNjIGsbUq79Ld1CGQl6xyhi4vky5Ihr16CPgJ?=
 =?us-ascii?Q?I9+mjYzaKlxNatH9xwgKJdy9aB9rpLGWtMagdqWhLcdsWNrPQIv5jmF8B8wB?=
 =?us-ascii?Q?b6N2teQyUm0EnY8pnI1/pqRVq/IV5LezVPhNjbYZTG34WHtz+HRM5jWgg3Z4?=
 =?us-ascii?Q?9fvJ4WTkPIxN4Evte8cf1BnzG3g5yL/UrBI0ovcbHTYiaALyalwSIKBp6la1?=
 =?us-ascii?Q?TioVH7E2S0znVvgDBTudaBNBU87WgmfpW6gJVunSy6ksjOJYonDn0K2iqzyu?=
 =?us-ascii?Q?hQuuQpvgIKpqIyLyuHZ6Cfv8yVtRrrc=3D?=
X-Exchange-RoutingPolicyChecked:
	ddXweUdSnTzsxJ6MB6Grc81cfJrAHdkEnsfOppZQ1PHd4I35Q7nQM4/EZVqA3PGQB1BxghQgPY9DNUsBmKr8y1Vl5nueBxJV6aHO0dz8Xx8GAHFo6P229xw46htfhFfZ+KxnDjMrXBcS6oiUIUjpmCpzz3lN8vJXGsn+KGe+K/ibf9mJEqzDMk8+QPQgDyo/3kai6fqa+rIPgouom2Hv8NYqfgVc/hSrdGDRwNea78Ku3v0oxQzTUBh5dVYElDeJuJ4j6nUZE1IGVsbAsaHwDRHU2EhNaEkRnbWv+KfY6vShGHBvYGkZIaaQOPBM50Qrzlaygazj7nPdN/vjS2UREg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QZOkzIY8WGzvDRcrdfWJCYOTtKAT99rYbfbyjp+knZP14Ne5Cw8g/jXJxaqMLi8kkE2PvHRVFWuMqBI/EYfFOl/EN2cuCsk+5dME3gpfwdo3kTRpfdga2z6lvPTZR5k76OMwq3/8+j6D2RZwlqav+ePbA5EgYRe8C4ustzEQ8dgnGlDvulzxivHdF9+dCjiPa2UxyxtffRVistGaw4Qqsj8I5imvuY0rvsrBs2b5/GslkZtvn8ad6LzkDHdtBqidQ6nxLZvyv/qYGD+IYfJDjNyDgPdfzQwzRDB+5ah2NoL//eZIGruuW1WY76SJ1gGNN3o/ye50+HeC+BqwJMnTv1DSHtOiK1J7a5RtOzqHavUJzEwG44bnUmxSD0FEFxJ+DG61NPAmrIqfRQ3QEAFiSM+AAahAlFgx3ngV6Tft60U/gHLlORJybNVkjZ1ADA6hZ4pYqN73IUp7WQnOv37I4nw97FlnszHJOTRdzXcmJVXBhuZnL9tcAKnZDB+1bqRkHAe9XJ4ZUjgR9ItdBDHmps+65M8JpGGhgWReiMNdra+fFIL9MIp/8RdG9hsQRIJQHTkeT3IDZaRntGEKky3Io+jqfObjapSLviSSpfZZnzc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f09c05-ce7b-450b-436f-08dec89e1b0c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:17:31.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfjcqFbudOuFboXwL4yGrisBoyCOhsTaDyNGsNx7bJlQOYgXrFUg4IcIR4+CwXZou/LzefCU8fDzd1K3T8h/1Y6IDmsH/SLnRc/4Ph9O3ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MCBTYWx0ZWRfXxDr8/Lvi0gzA
 nMwBXGYzEjsRiGp770+LD9AxIWxePBJNyCPxvgBzHuqHDjaKbDTzd8BaiNkmZcprF6GXOgH3Knm
 wRh6Q/Z1fDQA+rSl6Gi0g+5u/x7LMFQyjidlL7sCSRF5Q2xdSkOAK1wI/HZMZfzBPO9IJuqeJgk
 hUOGdcThCLycHc0fc/lKMBdaWFhYwSc6iDGPinoEG2g1v0mRv2oaPgGSToHCOq+IP15yPH5+o0e
 VD6x26yMQzbgRE1QPlBBPbnBBRTa6Tgq/veA+Xfb0rvOxhIX7syelsFclcj1KSDfDHOGvriWnSG
 nnwEurMB+zouv6xFI4p6wNug7Xcili4u7ssAsPCmgKblDhtLw7aBP9zwgMQgBRQgdZxDZV18Ma+
 ZPZaUJAduI4SXh75fW7UsrKIFP+76k9kb312FEjxhlO5fF3YfgQXg4oPj3FU4Acuc4+gaLZzlEA
 lLAMd/+AeQUoDBubzNw==
X-Proofpoint-GUID: 227FVWEmLOatSgHg2JX9-Y0vXTYtnQGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MCBTYWx0ZWRfXxZf8e4Zzy1ru
 NZBB3PqkHiYrXgeq4vO42674dIQJEv+h5mbRJUtqyyLhkaN2xcleuD9F0H4OzZ4p0uu0Y7Jz2Qx
 cyKiU2v0gmRJfE/SdXJkE4wVz2g5+MhaYRj62xT/yLp+Gz8Auy8v
X-Authority-Analysis: v=2.4 cv=Bd/oFLt2 c=1 sm=1 tr=0 ts=6a2c3124 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=9mEO5RoUb7z95IiDqTMA:9
 a=rEqNaWj0-quomjz8:21
X-Proofpoint-ORIG-GUID: 227FVWEmLOatSgHg2JX9-Y0vXTYtnQGv

Centralize parsing of D scoping markers used by external type and symbol references.  The helper now returns the resolved scope and identifier pieces, supports kernel and userspace markers for both type and symbol lookup, and rejects empty operands, runs longer than two backticks, and repeated scoping markers as D_SYNTAX instead of falling through to lookup failures.

Recognize dotted scoped identifiers as a single lexer token so module names like foo.bar resolve as one external symbol reference.

Add lexer and type regression tests for malformed scoped identifiers, dotted scopes, empty scope operands, scope-kind mismatches, and scoping operators in declarations.  Update the sizeof unknown-symbol test to use a non-empty symbol name.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_decl.c                           |   6 +-
 libdtrace/dt_lex.l                            |   5 +
 libdtrace/dt_parser.c                         | 140 ++++++++++++------
 libdtrace/dt_parser.h                         |   1 +
 .../err.D_IDENT_UNDEF.scope-dot-kernel.d      |  19 +++
 .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |   2 +
 .../lexer/err.D_IDENT_UNDEF.scope-dot.d       |  19 +++
 .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |   2 +
 .../err.D_SYM_BADREF.scope-kernel-as-user.d   |  18 +++
 .../err.D_SYM_BADREF.scope-kernel-as-user.r   |   2 +
 .../err.D_SYM_BADREF.scope-user-as-kernel.d   |  20 +++
 .../err.D_SYM_BADREF.scope-user-as-kernel.r   |   2 +
 .../err.D_SYNTAX.scope-empty-bare-user.d      |  19 +++
 .../err.D_SYNTAX.scope-empty-bare-user.r      |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-bare.d     |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-bare.r     |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-dot-user.d |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-dot-user.r |   2 +
 .../lexer/err.D_SYNTAX.scope-empty-user.d     |  19 +++
 .../lexer/err.D_SYNTAX.scope-empty-user.r     |   2 +
 .../unittest/lexer/err.D_SYNTAX.scope-empty.d |  18 +++
 .../unittest/lexer/err.D_SYNTAX.scope-empty.r |   2 +
 .../lexer/err.D_SYNTAX.scope-multiple.d       |  19 +++
 .../lexer/err.D_SYNTAX.scope-multiple.r       |   2 +
 .../lexer/err.D_SYNTAX.scope-triple.d         |  19 +++
 .../lexer/err.D_SYNTAX.scope-triple.r         |   2 +
 test/unittest/lexer/tst.scope-user-explicit.d |  22 +++
 .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d  |   2 +-
 .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r  |   2 +-
 .../err.D_DECL_SCOPE.scopeop-enumerator.d     |  16 ++
 .../err.D_DECL_SCOPE.scopeop-enumerator.r     |   2 +
 .../types/err.D_DECL_SCOPE.scopeop-ident.d    |  19 +++
 .../types/err.D_DECL_SCOPE.scopeop-ident.r    |   2 +
 .../types/err.D_DECL_SCOPE.scopeop-member.d   |  16 ++
 .../types/err.D_DECL_SCOPE.scopeop-member.r   |   2 +
 35 files changed, 414 insertions(+), 51 deletions(-)
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
 create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
 create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.d
 create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.r
 create mode 100644 test/unittest/lexer/tst.scope-user-explicit.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r

diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
index 1f4936dd..68999422 100644
--- a/libdtrace/dt_decl.c
+++ b/libdtrace/dt_decl.c
@@ -233,10 +233,8 @@ dt_decl_spec(ushort_t kind, char *name)
 	ddp->dd_kind = kind;
 	ddp->dd_name = name;
 
-	if (name != NULL && strchr(name, '`') != NULL) {
-		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
-		    "in a type name\n");
-	}
+	if (name != NULL && dt_scope_parse(name, NULL, NULL) < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", name);
 
 	return dt_decl_check(ddp);
 }
diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index fd70aa0a..bf133676 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -50,6 +50,7 @@ static size_t dt_input(char *buf, size_t max_size);
 RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
 RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
 RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
+RGX_SCOPE_IDENT	[0-9a-zA-Z_][0-9a-zA-Z_]*(\.[0-9a-zA-Z_]+)+``?[0-9a-zA-Z_]+
 RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
 RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
 RGX_WS		[\f\n\r\t\v ]
@@ -299,6 +300,7 @@ if (yypcb->pcb_token != 0) {
 			return DT_TOK_INT;
 		}
 
+<S0>{RGX_SCOPE_IDENT} |
 <S0,SIDENT>{RGX_IDENT}	{
 			return id_or_type(yytext);
 		}
@@ -728,6 +730,9 @@ id_or_type(const char *s)
 	int c0, c1;
 	dt_ident_t *idp;
 
+	if (dt_scope_parse(s, NULL, NULL) < 0)
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", s);
+
 	if ((s = yylval.l_str = strdup(s)) == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index e71c0985..1fd0f5b4 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -168,45 +168,96 @@ opstr(int op)
 	}
 }
 
+/*
+ * Parse the D scoping mark used in external type and symbol names.  A scoped
+ * name can contain one mark only: ` for kernel scope, or `` for user scope.
+ * Longer runs and repeated marks are malformed.  Return the scope kind as 0
+ * for no scope, 1 for kernel scope, or 2 for user scope.
+ */
 int
-dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
+dt_scope_parse(const char *s, const char **scopep, const char **identp)
 {
-	static const char delimiters[] = " \t\n\r\v\f*`";
-	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
-	const char *p, *q, *end, *obj;
+	static const char delimiters[] = " \t\n\r\v\f*";
+	const char *mark = strchr(s, '`');
+	const char *scope;
+	size_t marklen = 1;
+
+	if (mark == NULL) {
+		if (scopep != NULL)
+			*scopep = DTRACE_OBJ_EXEC;
+		if (identp != NULL)
+			*identp = s;
+		return 0;
+	}
 
-	for (p = s, end = s + strlen(s); *p != '\0'; p = q) {
-		while (isspace(*p))
-			p++;	/* skip leading whitespace prior to token */
+	if (mark[1] == '`') {
+		marklen = 2;
+		if (mark[2] == '`')
+			return -1;
+	}
 
-		if (p == end || (q = strpbrk(p + 1, delimiters)) == NULL)
-			break;	/* empty string or single token remaining */
+	if (mark[marklen] == '\0')
+		return -1;
 
-		if (*q == '`') {
-			char *object = alloca((size_t)(q - p) + 1);
-			char *type = alloca((size_t)(end - s) + 1);
+	if (strchr(mark + marklen, '`') != NULL)
+		return -1;
 
-			/*
-			 * Copy from the start of the token (p) to the location
-			 * backquote (q) to extract the nul-terminated object.
-			 */
-			memcpy(object, p, (size_t)(q - p));
-			object[(size_t)(q - p)] = '\0';
+	for (scope = mark;
+	    scope > s && strchr(delimiters, scope[-1]) == NULL; )
+		scope--;
 
-			/*
-			 * Copy the original string up to the start of this
-			 * token (p) into type, and then concatenate everything
-			 * after q.  This is the type name without the object.
-			 */
-			memcpy(type, s, (size_t)(p - s));
-			memcpy(type + (size_t)(p - s), q + 1,
-			    strlen(q + 1) + 1);
+	if (scope == mark)
+		scope = marklen == 2 ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
+
+	if (scopep != NULL)
+		*scopep = scope;
+	if (identp != NULL)
+		*identp = mark + marklen;
+
+	return marklen;
+}
+
+int
+dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
+{
+	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
+	const char *scope, *ident, *start, *obj;
+	int scopekind;
+
+	scopekind = dt_scope_parse(s, &scope, &ident);
+	if (scopekind < 0)
+		return dt_set_errno(dtp, EDT_BADSCOPE);
 
-			if (strchr(q + 1, '`') != NULL)
-				return dt_set_errno(dtp, EDT_BADSCOPE);
+	if (scopekind > 0) {
+		char *type;
+
+		/*
+		 * If there is no explicit object before the mark, search all
+		 * kernel or user objects depending on the mark width.
+		 */
+		if (scope == DTRACE_OBJ_KMODS || scope == DTRACE_OBJ_UMODS) {
+			start = ident - scopekind;
+			obj = scope;
+		} else {
+			size_t objlen = (size_t)(ident - scope) - scopekind;
+			char *object = alloca(objlen + 1);
 
-			return dtrace_lookup_by_type(dtp, object, type, tip);
+			memcpy(object, scope, objlen);
+			object[objlen] = '\0';
+			start = scope;
+			obj = object;
 		}
+
+		/*
+		 * Copy the original string up to the start of this token
+		 * into type, and then concatenate everything after the scoping
+		 * mark.  This is the type name without the object and mark.
+		 */
+		type = alloca((size_t)(start - s) + strlen(ident) + 1);
+		memcpy(type, s, (size_t)(start - s));
+		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
+
+		return dtrace_lookup_by_type(dtp, obj, type, tip);
 	}
 
 	if (yypcb->pcb_idepth != 0)
@@ -2767,9 +2818,10 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	dtrace_syminfo_t dts;
 	GElf_Sym sym;
 
-	const char *scope, *mark;
+	const char *scope, *ident, *markstr;
 	uchar_t dnkind;
 	char *name;
+	int scopekind;
 
 	/*
 	 * Look for scoping marks in the identifier.  If one is found, set our
@@ -2779,18 +2831,16 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * Otherwise we set scope to DTRACE_OBJ_EXEC, indicating that normal
 	 * scope is desired and we should search the specified idhash.
 	 */
-	if ((name = strrchr(dnp->dn_string, '`')) != NULL) {
-		if (name > dnp->dn_string && name[-1] == '`') {
-			uref++;
-			name[-1] = '\0';
-		}
-
-		if (name == dnp->dn_string + uref)
-			scope = uref ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
-		else
-			scope = dnp->dn_string;
+	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
+	if (scopekind < 0) {
+		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
+		    dnp->dn_string);
+	}
 
-		*name++ = '\0'; /* leave name pointing after scoping mark */
+	if (scopekind > 0) {
+		uref = scopekind == 2;
+		name = (char *)ident;
+		*(char *)(ident - scopekind) = '\0';
 		dnkind = DT_NODE_VAR;
 
 	} else if (idkind == DT_IDENT_AGG) {
@@ -2810,7 +2860,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 	 * errno appropriately and that error will be reported instead.
 	 */
 	dt_set_errno(dtp, EDT_NOVAR);
-	mark = uref ? "``" : "`";
+	markstr = uref ? "``" : "`";
 
 	if (scope == DTRACE_OBJ_EXEC && (
 	    (dhp != dtp->dt_globals &&
@@ -2902,13 +2952,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 				xyerror(D_SYM_MODEL, "cannot use %s symbol "
 					"%s%s%s in a %s D program\n",
 					dt_module_modelname(mp), dts.object,
-					mark, dts.name,
+					markstr, dts.name,
 					dt_module_modelname(dtp->dt_ddefs));
 			}
 
 			xyerror(D_SYM_NOTYPES, "no symbolic type information "
 				"is available for %s%s%s: %s\n",
-				dts.object, mark, dts.name,
+				dts.object, markstr, dts.name,
 				dtrace_errmsg(dtp, dtrace_errno(dtp)));
 		}
 
@@ -3014,7 +3064,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
 
 	} else if (scope != DTRACE_OBJ_EXEC) {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
-		    dnp->dn_string, mark, name,
+		    dnp->dn_string, markstr, name,
 		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
 	} else {
 		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
index d74d658a..b9149220 100644
--- a/libdtrace/dt_parser.h
+++ b/libdtrace/dt_parser.h
@@ -211,6 +211,7 @@ extern dt_node_t *dt_node_tstring(dt_node_t *, uintmax_t);
 extern dt_node_t *dt_node_link(dt_node_t *, dt_node_t *);
 extern dt_node_t *dt_node_cook(dt_node_t *, uint_t);
 extern void dt_cook_taint_alloca(dt_node_t *, dt_ident_t *, dt_node_t *);
+extern int dt_scope_parse(const char *, const char **, const char **);
 
 extern dt_node_t *dt_node_xalloc(dtrace_hdl_t *, int);
 extern void dt_node_free(dt_node_t *);
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
new file mode 100644
index 00000000..2a267567
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dotted kernel module scopes lex as a single external symbol
+ * reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar`baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
new file mode 100644
index 00000000..89a9f9c5
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
new file mode 100644
index 00000000..6b3dcfda
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dotted userspace module scopes lex as a single external symbol
+ * reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar``baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
new file mode 100644
index 00000000..7734e29f
--- /dev/null
+++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
new file mode 100644
index 00000000..d332191b
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Kernel symbols cannot be referenced using userspace scoping.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(vmlinux``major_names);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
new file mode 100644
index 00000000..718b2b31
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
new file mode 100644
index 00000000..bc7e8b9f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+
+/*
+ * ASSERTION: Userspace symbols cannot be referenced using kernel scoping.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(&testprobe`main);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
new file mode 100644
index 00000000..87169597
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
new file mode 100644
index 00000000..d7cff89f
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A bare userspace D scoping operator with an empty identifier is a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
new file mode 100644
index 00000000..8e9cd1ff
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d: [D_SYNTAX] line 17: syntax error near "``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
new file mode 100644
index 00000000..44b4f60e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A bare D scoping operator with an empty identifier is a syntax
+ * error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(`);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
new file mode 100644
index 00000000..bbba5fe8
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d: [D_SYNTAX] line 17: syntax error near "`"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
new file mode 100644
index 00000000..5ead7b3e
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A dotted userspace D scoping operator with an empty identifier is
+ * a syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo.bar``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
new file mode 100644
index 00000000..b07c07b1
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
new file mode 100644
index 00000000..d3a927d7
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A userspace D scoping operator with an empty identifier is a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(bar``);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
new file mode 100644
index 00000000..dbf319ea
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
new file mode 100644
index 00000000..e32b3812
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
@@ -0,0 +1,18 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A D scoping operator with an empty identifier is a syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo`);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
new file mode 100644
index 00000000..d78728b2
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty.d: [D_SYNTAX] line 16: syntax error near "foo`"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
new file mode 100644
index 00000000..5e236c45
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Multiple D scoping operators in one identifier are a syntax
+ * error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo``bar``baz);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
new file mode 100644
index 00000000..cefc56ad
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-multiple.d: [D_SYNTAX] line 17: syntax error near "foo``bar``baz"
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.d b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
new file mode 100644
index 00000000..41f7391c
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: More than two consecutive D scoping operator characters are a
+ * syntax error.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(foo```bar);
+	exit(0);
+}
diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.r b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
new file mode 100644
index 00000000..4474c502
--- /dev/null
+++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-triple.d: [D_SYNTAX] line 17: syntax error near "foo```bar"
diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
new file mode 100644
index 00000000..2d649f6f
--- /dev/null
+++ b/test/unittest/lexer/tst.scope-user-explicit.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: testprobe */
+/* @@runtest-opts: -e */
+
+/*
+ * ASSERTION: Explicit userspace module scoping resolves as a userspace
+ * external symbol reference.
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	trace(&testprobe``main);
+	exit(0);
+}
diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
index 56c93d43..4de9322d 100644
--- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
+++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
@@ -16,6 +16,6 @@
 
 BEGIN
 {
-	printf("sizeof(`): %d\n", sizeof(`));
+	printf("sizeof(`unknown_symbol): %d\n", sizeof(`unknown_symbol));
 	exit(0);
 }
diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
index 462469b7..0f46ad1e 100644
--- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
+++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `: Unknown symbol name
+dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `unknown_symbol: Unknown symbol name
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
new file mode 100644
index 00000000..51068c20
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in enumerator names.
+ */
+
+#pragma D option quiet
+
+enum scopeop_enum {
+	foo`bar
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
new file mode 100644
index 00000000..06ef912b
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
new file mode 100644
index 00000000..6042e208
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in declaration names.
+ */
+
+#pragma D option quiet
+
+int foo`bar;
+
+BEGIN
+{
+	exit(1);
+}
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
new file mode 100644
index 00000000..7b2e6797
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a declaration name (foo`bar)
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
new file mode 100644
index 00000000..5fe36a00
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
@@ -0,0 +1,16 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: D scoping operators are not permitted in struct member names.
+ */
+
+#pragma D option quiet
+
+struct scopeop_struct {
+	int foo`bar;
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
new file mode 100644
index 00000000..978ef79d
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in a member name (foo`bar)
-- 
2.47.3

