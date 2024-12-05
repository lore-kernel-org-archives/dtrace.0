Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1518C034
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424804; cv=fail; b=QgaNoTJqSNvuZLg61EgcKBPtIvtz5tZcQ+P2GPymqO0K1CwdjsG6DDWkQJIF46/X9Iq5GRcNLE4rj9johbMVOcH6ba29Y2CEGI2v85Kj37TR8LaC3/lrdW6Zxu+We2D/qTys4M+9C2u402lfehBHscanAE6D5WJ3eISefQA+K+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424804; c=relaxed/simple;
	bh=TYne6vWr1I7I90XjRxy1Cj+M8Z2aqqtVmL7uvsJSKzs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=b7jCRxxU3ui0wxmoAB8bxnRjRx1sdkkSk13omrOTrZsCL1KISQFyTQ7D6MLxUMtLAuQkFLoTiAO7l9J9tyegzkhO6znuJYkf3NLK/SO+oja4cucONc0LVyGareMxFK7gS3VT5BT2I6bZ7SYDCNePDqAXIGHYcMpvvzDdIURTuDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jG/9JLnD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RLIpIRmu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jG/9JLnD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RLIpIRmu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5DftrJ002938
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=dQtAMFB3lB5x+tImFVmL9We+qkxa0bLlv6pIHwwM6Xw=; b=
	jG/9JLnDMtTHGwU9LqN3Sn63FIvr+M13qBw8hESxZwEEdBq4WWTDG7hLvUAK5lW2
	Z084sUaUV6e8Aa+/HDQXAaNPcROPTv/ter7bCLhumDkgP9WU9Ca9gke+/ZI2ZdEN
	c1NMske8pyNH2/L606HiAG9Az+MvCokA/YURSDsY/4Wowy27H9aJNuMJOGV2D/C2
	fmwLnlhr6PXqyuGQ+9zNs4pvD3/lmGP4SL8454nYod+CcRCuPcKEZ4v/rZQLT0I8
	3F0siRfSlFOGVXrFa6P4xt+VtRezQ3yCaha/rib86+b/kCvleCTGooyZEtPvU11f
	Jw2P90DIKKR5vY3Ma08uBQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tasbqf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HqRXr011643
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:14 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s5ba76q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yio3uI8PhM5AUjk0VRR5shzvNyQIJtMK9FE/hwPYmp+PCdo6pP3IFZzodLkSxjDWegPlZoYUfXVWe5+Mi762BBllwseCTA8Rlulq9sEul6Vgi1PY9AykcKcTppKRND/FgQ8xX9Px6OidAdVAPVsX8LhAlr72Me3z/hYJe6nyQAFuy8Mus2PW49qze628+x158C/OznbSN+Bpghlsl4zJXKVGtmrP9cgcOHq7E1wefmDRyzcJjKcMQm3mpbfXZ+NtatJThYV7cADIMkFLlk799tN4omKjJR44fHotSR2fPI92Y+NHBq+Fn2KPgKw5hKWK3fl82mrcIpXNohdSJxGiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQtAMFB3lB5x+tImFVmL9We+qkxa0bLlv6pIHwwM6Xw=;
 b=cUSM871vu1UiWm8/9ovvwOYTcky50mI6beCjewqPyuqZx3BfGkjUnKA7IPvoX+YtUB5CAuMo3AH5B5zQkLO6GihmziJxUhRjayiNxEEeTP3IUY7KV1BuEJZtytE8yoR14yPKOWIzjl+jlBEw08OFiAt6SWM4OUAj95Y/VvBfdo8qmrA1in9Z1nnPfQmpNgYHWr3kd7pey1xt1hQZP2J38zEpEY+wWBUROT+B2FUW+NSD9D4BwEomrKPeU/yd3Yu6FZaHGpfGjauGz893UPqe98luhXTVwFkPZHRvND2NsqhlIo7TSq7RHGiy+5CBlxHmbEXcWte+GhBJ6s7NHvUfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQtAMFB3lB5x+tImFVmL9We+qkxa0bLlv6pIHwwM6Xw=;
 b=RLIpIRmuUfLch2k8mVUuM61A+qAaIAvzZEoz4MflWgSX/3vVroovpzVJT5efBLd1a7aB0pu2S0g9MKkLx/R2WCXONAiF1n8d/mJF1OgnbOrw5kYHtFiN8o3JFd2Hp8fiQyzEAUKcOe7wUDv7pxbOYyD1fkETof6Fd9UCuaF6wqE=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by CH3PR10MB7282.namprd10.prod.outlook.com (2603:10b6:610:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:53:06 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:53:06 +0000
Date: Thu, 05 Dec 2024 13:53:05 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] rawfbt: new provider
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB003775EE85F6A6F45ACEF720C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|CH3PR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d699962-27da-40c9-4861-08dd155e0e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jy/WXaAWKCl/DKOjSMaH4BSY6zJcwWTNzevYBP0aqCwWMBs+265grE/a9dgY?=
 =?us-ascii?Q?TXcc88rERVp4j9006KSBtZ5/j8aIIl32W/tG9EjBeqRvcu+xzmPxIREEWlK/?=
 =?us-ascii?Q?sCoCCXU+u4EFuhdzLzJDDVizu4gDK9iuChJPuD0AOzE+J/KzzfDpv+y0ldX+?=
 =?us-ascii?Q?WkVE0z1Y2gYy10taRby0HeT//ncSC9q2DpPau2+ngcE+c5/qG37MJQ/pvgBQ?=
 =?us-ascii?Q?bgly761r1dhlw/3DpdUTu4vxGBmyCCTlenXb64a+lCSjx3l96ph1DJ2vgBW9?=
 =?us-ascii?Q?AFgMbNsHDbMlyM54rOGQRn3zIQrGw1u/6BKE1+4gc++d7pUarqdH/HC+/M2O?=
 =?us-ascii?Q?GgMTKego0Pz4jQgGBbOMLQm5USxTsypaGUw4FzRHy6tMH1fC1XBbtLx6wZOP?=
 =?us-ascii?Q?U1jH2oyrEJMZhWLJJY4y12KIvne7r2qFyFY1i1XlUiyw2pRQob/Wqivc27Ki?=
 =?us-ascii?Q?V6aHc0dXsUOXiAOZkAQ8Od7ZMOrPS+OQ7+gx/4OO5CxcejATkGWhi+qw0vCx?=
 =?us-ascii?Q?P3pRiqe85BM2Bk8j/xQDBO1ZYlm8yG7yDozKLrvAkj6CjZcJOBCN4Y8mMs9W?=
 =?us-ascii?Q?BjyM+9jKMcAiY4aBTj6GOww/2FT2W2XxEhYYSgBx8XeJkIEFhP+lrQ+UDMSR?=
 =?us-ascii?Q?mALe/jPFZ6sa8SovLdzllwbRPjAK//aUso8O0dEM4sklV+KALFpCYJmA0x5s?=
 =?us-ascii?Q?LZiG+sFmo6pqZ2/hy5TI5rHTfBFVItWxiFxF8PzCIxgIbM4q1BgbWOkxnwJb?=
 =?us-ascii?Q?np4S4R6MJ2yMpgkrOZKFr/DDvfQsvRt3qj9m8p7QNRNYBacv+2b7YwGGRXnT?=
 =?us-ascii?Q?Yd4/CmAfYjZmX22CXLVtpCNf+gJ+6IoqW8W+1YHpHRjeTQbn8IimJszK1cDg?=
 =?us-ascii?Q?xmAy9dRBqQhWJecoElMqw84/+HQkX8Q7ffnVbjBXX1zVP/P+aMiVvKSena+H?=
 =?us-ascii?Q?4Jw+RA7tGD68slUC2hxbevCNdKLtfeI56sheVOl9su68szo0t1fWL3Ha8mQ/?=
 =?us-ascii?Q?YgAsr5eE9Xvxf31CCWlQESzjUAnexGfykJ9f3udI2iZh0frYrM1Da0gDrBE2?=
 =?us-ascii?Q?MMdBBapTpPaet0tFUbhUkxB5CHsVYd9dxQHI3l5B+I+f1HUekOtiHzS4XeBK?=
 =?us-ascii?Q?Y6XjhOlbyPqLrPDzhJwrBK0BpNfIk0DDy8jzB7pIFEWiLrpcMsgnFZNpllcH?=
 =?us-ascii?Q?Ex4NLL3N3wkWMLdKXsvQgvwfDnDYUravR6s8tVtybR5ES3NNcicw2Oihi4A3?=
 =?us-ascii?Q?8A8PX5FaMhqbt9qlpJ1Ktx78HBkpawDTKlAOXgZhhBGzHiIDyy48VnHdRc63?=
 =?us-ascii?Q?reCOoEMW+d/fwUV3VP7+aeSrWVxgnSbyuaVjmrzHo9Ib+RKBwjKiEWJmFWgG?=
 =?us-ascii?Q?gCq40F0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qsz8yzLN8BXRFIdygurPFNbavHwuhrrsTjqR81tIWK3UbxtEbFTjWC0Vckbn?=
 =?us-ascii?Q?zouoP+I2ZqQCbZ5OBi1KNBqE74SH9Oycg5av7BkI73N0c97nv6OCCKTz4TNP?=
 =?us-ascii?Q?VhUOsHAK2FIn304WQN6SeDGl+J2k+pjo1qJJIMdpUsew7xxA2/jOpQ4Qa3KA?=
 =?us-ascii?Q?LKUWtamCAtDodCixq6mYAK+8IpIK5e2oDG5k+J3BZ4SaVBOmr+BMAqelpbyx?=
 =?us-ascii?Q?2vPyGE1QUFLZHxIHXYfMsK9pdZHQNcpxxnR/3oy0SROdfafn4SO8PjT6Fj4l?=
 =?us-ascii?Q?7Bb2DRYw2N2KgWZnC4JOXDfFPOy3HwvRXQ1CvCndpc2M0CWdFJB9dCFxcohO?=
 =?us-ascii?Q?T4i9LdLzYGcYB0u1WZHnuwCuSZ3fMm6EalEupc6LjXR9dyEkIvkTwQCW4Ir3?=
 =?us-ascii?Q?67HELBClRGqZlZDSdXafAfnZXpBa39KxfAmMMhFJm2n42WoT3pc3LyHEP1A4?=
 =?us-ascii?Q?N4isuwR6Md7WTvM6xmzB2Q5jPaGlDcMDvb5+ROaaO2qebGzXiLEXncgXXzQY?=
 =?us-ascii?Q?M0htcPfOodAlKBXuhSPsTuQWs8/URaop6s0F0b+8IPdbThPLkVbApiZOU14N?=
 =?us-ascii?Q?FbRmySPfLDspedGfmhNbj9OKqFKHRoOyI56FmpxoeQfAx6FJ1L88ezZx7eTR?=
 =?us-ascii?Q?xgSvieDKwri7Jh7G/z3rXgvrW/mBHewtpoXC9QY+43qzqNCczQe/zDtxGm2W?=
 =?us-ascii?Q?wifMd/rct5IoQFkSok9Aq5714HTKkNuKwaTYqM1lYx1nq0jLMtgiAWpx/V+B?=
 =?us-ascii?Q?9ziX9+DBQZu2HJV8u9VwQxPylsjlkM0WPmO3gAK9/gi5uFjxFPNpTS2PNU/c?=
 =?us-ascii?Q?ptx3XCO/2Mbvr113zzkXKy2ckgVX9PAO4ZpdkNA2LuXmucRkp9oigpDqXSpr?=
 =?us-ascii?Q?0eQ3kGkfUiTgFKLDr953268ZYZjG9hv1EfwbxonrKGuyD1m170xOvTUhBz14?=
 =?us-ascii?Q?DYOK1V+hdjGzGu52HIgKH8Ka34kBBohBl262M3Cgdj8hnp5/33E2HG0bRV3W?=
 =?us-ascii?Q?QmQaIC/uChSO8uhT0TH3ByGm5KVYNQ0AE6M+61KYTNDaStM956E/Bhc4W9Jl?=
 =?us-ascii?Q?ePwUW2Rh9j4QiXxpqxIu2UrQnhbbXk+louJpLtEGXQ3OYogp1a/IVWbRJMvq?=
 =?us-ascii?Q?hXWdbzuVezvePsxiO0du+GefGNgrxOGuR5AJYeB0nEh2itleISetC43j/ukc?=
 =?us-ascii?Q?IKqHjlAVJpqF1Uht56RFey/Pf3CsXqWsCU6V+KnufVdaa0t+PlNLQXXaCuhL?=
 =?us-ascii?Q?dRTzrlaJyBOV2v0e4DbrLfgG8sekeolvuk3rn57lencPk5YhbbqwyE4cV3zU?=
 =?us-ascii?Q?xbcggWHjqdx2r2xHozUn+0aYccQi2kbGoStjfaC6Oax2oZyddJ8nBFT67CR4?=
 =?us-ascii?Q?8/Tp7AzLpMIMNFaqBzwDPsuN61ROKjSqMVR5rSNwEO12H6TwDeHD+oudTCe8?=
 =?us-ascii?Q?GBDdMHk78Ybltb6egimJ3Jo+FLjjHYEuBii/9maZxMAiXYiES8nEKGHYgCTv?=
 =?us-ascii?Q?3G71rmPwcNKPsw40wqUYKtBKRR0k/dz3tubm6OWEkl9k8QI/3CHWZZuGLzdP?=
 =?us-ascii?Q?Y53noaF9C8aXxvVaHb2OGCpfvEsgHgrdC6gSlei4fOsQZsSpGmppiJbXhxxp?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pCuKma51bJ0i4nVgK+cF6fat6gu+zVSwq1P/0pFOTtr3g68c6uGRaADV9O3QlnEdzJ9KZMl42pyNbxLw0tLOW3lTVpKbg/1+eq/lKgHjckAq2u5Nxf3wV04DHCfS+hpWo6nUxdIJqP4wwdQ2EVwAJcwjGD6KjZAegG9PFeRdbeK31PEMrE/rsDddU7zsldopsfF4zafQMOfCN+9JQNjmRzkXTF7PTGPN8DaRS7bmL3fH2E36dsGb5/hOwspAN71mKwRQ2sW0tVaNMv4B+JcN4Bzq3ZlI97Uu4xd3pk2bCZwKBlwsQi+FgicsFegDvd3KmFrqk2DG+ejj82u/l8FueIXujqa/tMmU4X5wdxtX+4AAvNUSDDuWN0GEMLSPfvwmOdYcTI4qAubO11tnhgaMUuTMFZa40bXM1uEt7oVeFOZozNLXFsimRo/VFN99b1iTt/M1yorHww8m6uNW8gOMuSzbl75e2had38KIxRw80tywkjX440h2A9ZMkACWyKvGK4TOK60bYMX/Ak+l1+dYY5G7KLoJXyt2ZJvcUEFU3BAxk1UoG4kKrBWsBWul8fJ2W6PmSO71ab9FvTgPFegXiKDKK3pbWkY5Lp1j4rz1Kgs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d699962-27da-40c9-4861-08dd155e0e17
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:53:06.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffYypj1S/UnX+BKOnJ0hAZ7qxJWkScYPoImiTmtbFEtYrgC27pJVkNEUYTa/A/nNt/qLXYIGI0njC51liHSPuxtAiO9egrObyEU2/Qxhnxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050139
X-Proofpoint-GUID: RiuJ2wT8ceg3XmkJy5MgjLrrV1mxK6rb
X-Proofpoint-ORIG-GUID: RiuJ2wT8ceg3XmkJy5MgjLrrV1mxK6rb

This provider provides access to all kprobe-based probes that are
available on the system.  This includes any compiler-generated
optimized variants of functions, named <func>.<suffix>.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build            |   2 +
 libdtrace/dt_prov_rawfbt.c | 330 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c    |   1 +
 libdtrace/dt_provider.h    |   1 +
 4 files changed, 334 insertions(+)
 create mode 100644 libdtrace/dt_prov_rawfbt.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 8d398221..72235159 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -55,6 +55,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_lockstat.c \
 			  dt_prov_proc.c \
 			  dt_prov_profile.c \
+			  dt_prov_rawfbt.c \
 			  dt_prov_rawtp.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
@@ -112,6 +113,7 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
 dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
 dt_prov_proc.c_CFLAGS := -Wno-pedantic
 dt_prov_profile.c_CFLAGS := -Wno-pedantic
+dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
 dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
new file mode 100644
index 00000000..edfd36b4
--- /dev/null
+++ b/libdtrace/dt_prov_rawfbt.c
@@ -0,0 +1,330 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ *
+ * The Raw Function Boundary Tracing provider for DTrace.
+ *
+ * The kernel provides kprobes to trace specific symbols.  They are listed in
+ * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
+ * a symbol in the core kernel or with a symbol in a specific kernel module.
+ * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
+ * provider also provides access to synthetic symbols, i.e. symbols created by
+ * compiler optimizations.
+ *
+ * Mapping from event name to DTrace probe name:
+ *
+ *	<name>					rawfbt:vmlinux:<name>:entry
+ *						rawfbt:vmlinux:<name>:return
+ *   or
+ *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
+ *						rawfbt:<modname>:<name>:return
+ */
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <linux/bpf.h>
+#include <linux/btf.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+
+#include <bpf_asm.h>
+
+#include "dt_btf.h"
+#include "dt_dctx.h"
+#include "dt_cg.h"
+#include "dt_module.h"
+#include "dt_provider_tp.h"
+#include "dt_probe.h"
+#include "dt_pt_regs.h"
+
+static const char		prvname[] = "rawfbt";
+static const char		modname[] = "vmlinux";
+
+#define KPROBE_EVENTS		TRACEFS "kprobe_events"
+#define PROBE_LIST		TRACEFS "available_filter_functions"
+
+#define FBT_GROUP_FMT		GROUP_FMT "_%s"
+#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
+
+static const dtrace_pattr_t	pattr = {
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
+};
+
+/*
+ * Scan the PROBE_LIST file and add entry and return probes for every function
+ * that is listed.
+ */
+static int populate(dtrace_hdl_t *dtp)
+{
+	dt_provider_t		*prv;
+	FILE			*f;
+	char			*buf = NULL;
+	size_t			len  = 0;
+	size_t			n = 0;
+	dtrace_syminfo_t	sip;
+	dtrace_probedesc_t	pd;
+
+	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
+	if (prv == NULL)
+		return -1;			/* errno already set */
+
+	f = fopen(PROBE_LIST, "r");
+	if (f == NULL)
+		return 0;
+
+	while (getline(&buf, &len, f) >= 0) {
+		char		*p, *q;
+		const char	*mod = modname;
+		dt_probe_t	*prp;
+
+		/*
+		 * Here buf is either "funcname\n" or "funcname [modname]\n".
+		 * The last line may not have a linefeed.
+		 */
+		p = strchr(buf, '\n');
+		if (p) {
+			*p = '\0';
+			if (p > buf && *(--p) == ']')
+				*p = '\0';
+		}
+
+		/*
+		 * Now buf is either "funcname" or "funcname [modname".  If
+		 * there is no module name provided, we will use the default.
+		 */
+		p = strchr(buf, ' ');
+		if (p) {
+			*p++ = '\0';
+			if (*p == '[')
+				p++;
+		}
+
+#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
+		/* Weed out __ftrace_invalid_address___* entries. */
+		if (strstarts(buf, "__ftrace_invalid_address__") ||
+		    strstarts(buf, "__probestub_") ||
+		    strstarts(buf, "__traceiter_"))
+			continue;
+#undef strstarts
+
+		/*
+		 * If we did not see a module name, perform a symbol lookup to
+		 * try to determine the module name.
+		 */
+		if (!p) {
+			/*
+			 * For synthetic symbol names (those containing '.'),
+			 * we need to use the base name (before the '.') for
+			 * module name lookup, because the synthetic forms are
+			 * not recorded in kallsyms information.
+			 *
+			 * We replace the first '.' with a 0 to terminate the
+			 * string, and after the lookup, we put it back.
+			 */
+			q = strchr(buf, '.');
+			if (q != NULL)
+				*q = '\0';
+
+			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
+						  NULL, &sip) == 0)
+				mod = sip.object;
+
+			if (q != NULL)
+				*q = '.';
+		} else
+			mod = p;
+
+		/*
+		 * Due to the lack of module names in
+		 * TRACEFS/available_filter_functions, there are some duplicate
+		 * function names.  The kernel does not let us trace functions
+		 * that have duplicates, so we need to remove the existing one.
+		 */
+		pd.id = DTRACE_IDNONE;
+		pd.prv = prvname;
+		pd.mod = mod;
+		pd.fun = buf;
+		pd.prb = "entry";
+		prp = dt_probe_lookup(dtp, &pd);
+		if (prp != NULL) {
+			dt_probe_destroy(prp);
+			continue;
+		}
+
+		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
+			n++;
+		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
+			n++;
+	}
+
+	free(buf);
+	fclose(f);
+
+	return n;
+}
+
+/*
+ * Generate a BPF trampoline for a FBT probe.
+ *
+ * The trampoline function is called when a FBT probe triggers, and it must
+ * satisfy the following prototype:
+ *
+ *	int dt_fbt(dt_pt_regs *regs)
+ *
+ * The trampoline will populate a dt_dctx_t struct and then call the function
+ * that implements the compiled D clause.  It returns 0 to the caller.
+ */
+static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
+{
+	dt_cg_tramp_prologue(pcb);
+
+	/*
+	 * After the dt_cg_tramp_prologue() call, we have:
+	 *				//     (%r7 = dctx->mst)
+	 *				//     (%r8 = dctx->ctx)
+	 */
+	dt_cg_tramp_copy_regs(pcb);
+	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
+		dt_irlist_t	*dlp = &pcb->pcb_ir;
+
+		dt_cg_tramp_copy_rval_from_regs(pcb);
+
+		/*
+		 * fbt:::return arg0 should be the function offset for
+		 * return instruction.  Since we use kretprobes, however,
+		 * which do not fire until the function has returned to
+		 * its caller, information about the returning instruction
+		 * in the callee has been lost.
+		 *
+		 * Set arg0=-1 to indicate that we do not know the value.
+		 */
+		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
+		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+	} else
+		dt_cg_tramp_copy_args_from_regs(pcb, 1);
+	dt_cg_tramp_epilogue(pcb);
+
+	return 0;
+}
+
+static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
+{
+	if (!dt_tp_probe_has_info(prp)) {
+		char	*fn, *prb, *p;
+		FILE	*f;
+		size_t	len;
+		int	fd, rc = -1;
+
+		/*
+		 * The tracepoint event we will be creating needs to have a
+		 * valid name.  We use a copy of the probe name, with . -> _
+		 * conversion.
+		 */
+		prb = strdup(prp->desc->fun);
+		for (p = prb; *p; p++) {
+			if (*p == '.')
+				*p = '_';
+		}
+
+		/*
+		 * Register the kprobe with the tracing subsystem.  This will
+		 * create a tracepoint event.
+		 */
+		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+		if (fd == -1)
+			return -ENOENT;
+
+		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
+			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
+			     FBT_GROUP_DATA, prb, prp->desc->fun);
+		close(fd);
+		if (rc == -1)
+			return -ENOENT;
+
+		/* create format file name */
+		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
+			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
+		fn = dt_alloc(dtp, len);
+		if (fn == NULL)
+			return -ENOENT;
+
+		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
+			 FBT_GROUP_DATA, prb);
+
+		/* open format file */
+		f = fopen(fn, "r");
+		dt_free(dtp, fn);
+		if (f == NULL)
+			return -ENOENT;
+
+		/* read event id from format file */
+		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		fclose(f);
+
+		if (rc < 0)
+			return -ENOENT;
+	}
+
+	/* attach BPF program to the probe */
+	return dt_tp_probe_attach(dtp, prp, bpf_fd);
+}
+
+static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
+		      dt_argdesc_t **argvp)
+{
+	*argcp = 0;			/* no arguments by default */
+	*argvp = NULL;
+
+	return 0;
+}
+
+/*
+ * Try to clean up system resources that may have been allocated for this
+ * probe.
+ *
+ * If there is an event FD, we close it.
+ *
+ * We also try to remove any kprobe that may have been created for the probe.
+ * This is harmless for probes that didn't get created.  If the removal fails
+ * for some reason we are out of luck - fortunately it is not harmful to the
+ * system as a whole.
+ */
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	int	fd;
+
+	if (!dt_tp_probe_has_info(prp))
+		return;
+
+	dt_tp_probe_detach(dtp, prp);
+
+	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+	if (fd == -1)
+		return;
+
+	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
+		prp->desc->fun);
+	close(fd);
+}
+
+dt_provimpl_t	dt_rawfbt = {
+	.name		= "rawfbt",
+	.prog_type	= BPF_PROG_TYPE_KPROBE,
+	.populate	= &populate,
+	.load_prog	= &dt_bpf_prog_load,
+	.trampoline	= &trampoline,
+	.attach		= &attach,
+	.probe_info	= &probe_info,
+	.detach		= &detach,
+	.probe_destroy	= &dt_tp_probe_destroy,
+};
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 1e2e844e..0c621197 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_lockstat,
 	&dt_proc,
 	&dt_profile,
+	&dt_rawfbt,
 	&dt_rawtp,
 	&dt_sched,
 	&dt_sdt,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index f62137de..59a8d62e 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
 extern dt_provimpl_t dt_lockstat;
 extern dt_provimpl_t dt_proc;
 extern dt_provimpl_t dt_profile;
+extern dt_provimpl_t dt_rawfbt;
 extern dt_provimpl_t dt_rawtp;
 extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
-- 
2.45.2

