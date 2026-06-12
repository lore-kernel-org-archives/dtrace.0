Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4781368D48
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281824; cv=fail; b=QPuWv1supvO8JoTDXQr5GXbQKVioeunJG+vKqMttjeF/7mW3giOlY/49xxOE10sD9fy1mbhf4t2EjOehajvOgmtG8mhi4B+9KwubHyQ8CP7OFQQTp1K2BUsbLyswPeUlv8xFV9o+fytQOfSOxnoxfa4xK+eh8PCd/Wn27BbiWdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281824; c=relaxed/simple;
	bh=QgVIYXf0EwhD/2ZVyoPlWTBCxk+pAek7Zo23Y3/OQ/Y=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=FYYK+Hvxp6MxlCtykh8S1uyxWDWJrCyEpzohlhJODKvGPb+5+yE0MWJPRMIa4P7Z3KUrmKhKJJqFgW2Hr+Y2ly1j2/ieLpnwlJ9aARQRbANtFXKQM8YWfBXCddI55Sh15Vt4DEmbmBIwWQv280E5A7Fk2bKaIcN0jUaGeYiNywg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bUTWSyH5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i0Q3TgXv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bUTWSyH5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i0Q3TgXv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7NZRu1679227
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0XOm6rovWgxY0B2FKxJbz3w0v+V/lcdkH+Qw6+3I2gI=; b=
	bUTWSyH56oYalnKgZJK4vfuzW9pLBtAt6WJMrr6DNU8M90ENS3MS9g36XyRro6Yd
	jWCDE9Z7KZlYwhZqtp/7uRAf0fT/Ga3TobVb9Im4UaJHCBUhfGEsX7juOqTZJaJ/
	D95yw69CXijhm71G+sFXznAcSZqAXoEjPnJklMoOVUPnRZrqsNaLgULbDkM6+ya/
	T8S3qgIsvVJqqG1OMzLofQn/JYZBS5VAduDlpJDj/0xdAO3175i7CoDonrObPo7F
	4lVRDaRl3k1ITlXWvAYwLRjhnI/mZTUMeqUZKhpPyO52BVbuuB4WRFhfqp3yXy+a
	TjxLszBszGJirSMFC2VrRQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe6wk91u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:30:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGU6of019687
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:30:13 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4erhrgh8gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:30:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+HROgjfTYvCTwhI/K2BYvA7Z3WAyebiLQi5o6t4G4ayVVDa+sk5uhifMNqbF7ZsEwFK/+aPd8/KhGkieN0S0AWEM+qen/gu5l6gSRtPfC1xpgwwuY23AhFuv/YTZhlvlM7NiNaCUtpXQdkzEYy7CdurGu5O3Irb89iRU7x9DTLRI4q8KfZmZh1Vjqj1YfDv65OVSKw/j30TMPZe5gIzQ9oCA5PIVU4QCbddXDOHk9a2h8Fqh++Xtijh42qAqZ2iiq6du2mhwtF+2b3WzQbeivi/BSzILIJ3oafyN83nILO2zt6VFGVhquxDyYIBlRm+qaxDorC3ecmutq8mmROdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XOm6rovWgxY0B2FKxJbz3w0v+V/lcdkH+Qw6+3I2gI=;
 b=maOnGzOhmsvOSdigkP08Acvv0MfKmX/Ma7Kk59qB7f4nTYoRpmKm5LymI04DpjfuxHORGrek6M4zyvsZcDAhq9CAxtnuUlcwJ+labRM0ULqyeJAZPCiuS0CPNp3dTwv15IEoKf9iq3axGwCf/bCyLo2Hik5VDRnXN4Vs+qMAmn3RmjkvMdF/U0wTIg5w+oA39qrQymQbKz+xqxv1HVLW0vTJXAtRltLgUVbue7YQnB8rCAIb9F/1FVDPCFsuW41vwxKVObAU6Aj51T2a3LV1Q5BkKzI6kV4RqMovTHWKyQJOEKqcCpO9xITGdclkXL7dzwmTFEy2cXCNiEUXCd9iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XOm6rovWgxY0B2FKxJbz3w0v+V/lcdkH+Qw6+3I2gI=;
 b=i0Q3TgXvZC3d9QSdk2V6MpAEpMxI0ADK1oE6wXWohjKs+5R83ufg84k0fBUSVNRt7LVBsps7/JoNrCg+k5Ey9rhRszLGWh9TTlzxoOmhHssHjqykG1+RgS2wVmEg3gN7szwm4786Af4kZrmEWS+kfXX3mMc2CujNSTmjDqlRy7I=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by CH4PR10MB8122.namprd10.prod.outlook.com (2603:10b6:610:246::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 16:28:22 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:28:22 +0000
Date: Fri, 12 Jun 2026 16:28:19 +0000
Message-ID: <19caf5ddca62d2ba3aebf16142daa29f@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] parser: validate scoped external names
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::27) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|CH4PR10MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: e19a1e06-d5a1-4643-fbdb-08dec89f9edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|13003099007|6133799003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	XUrQGMWg/PLRpGfEG8PQGy6q/xCLtnqtLyp0P+CF8aDuyQEGfsr7qGZ/x+3kmjippvRkEFo05BDE70r15vmMuzrvJOkjQ5tkl2YIR9GjSai8yGPFq0DMIq6UgM+4/yloe2jDRDdMt4RmhBKYipOami3o8AuJ/j8Ooj9xYdlZTGLtWD6fiCt8oDKek/LzfnnSLsW4Bf2Nr4ySmlUjaB6W5whDvkaZG9VWXboTlJGEC6UejVbl40ZiJpov4QyU32iaQx1QSZLCPqK8+OFwdVBR9+zFL3anzDK9zJCxzcJaTN3A+KH6habP7kJC9eOBrBC3vAhSqHGHgjlWq3YM4tXG0Iuw5Drwm0G6Kicy4z4LKE+6+tj/icso3MLq4Khp0hylvIGXmRYV7sSkevwWPQknt3H6vs2sG3lcluLj2iEfxVTzpt411Kh3GMbErT2yx5XdubRumVqUzw8BcFUkr1NXHof48tWz6emUFie9r2+w4ng8nfeUA/Syt2XUdn5QtgvyfIUzBGsLuUobVOAO4ddNmRjsmCG1Pe2YY1LHCNWf9QOVLye1RDnKzpTKJttGZV/rQczGsQz9cqJjm6DzH7D0el/Mv5JVg5Q3FId/haCoNxembG+Uy+jZwhdh/8kCHSz/d66nTx8j+ManrLIVq9WFPhr6u5oGPylsYOyAMVIpTsSUp5vwrqn4tSmQ3jwMrJ5L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(13003099007)(6133799003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JMbH1bB+vfrrH0ZG/+MYiEhU0siwRW4w0/GvmoepOqL/XQAbYUVkvbsvggI1?=
 =?us-ascii?Q?olbReQBQ+LOLpIHpnL6B4SjfQy6Bola8QlKpzKr1kN16lO3fL2qsRTuIgmsZ?=
 =?us-ascii?Q?1OHiAHUxs9c8hZbdsLRsU0AfI11u+8hqLY9ILpPK+ilM2eG7aL3hD2IRZRsH?=
 =?us-ascii?Q?01rmJ5yG9oebagA4oZnfMYEAz5LfRcIv3vmGssag/+MFJSfrRnGOEVCvF+At?=
 =?us-ascii?Q?FpwXw//40olOezYMOZd3rBshNdUc9yqKmrR7V5VKcbwzUw8J7AfZoVO/DkE6?=
 =?us-ascii?Q?LXiG5vVLHUqBBUv73SB0C3q99PDXsWzi4M0W2B0natkHl/obS1Topmad8zab?=
 =?us-ascii?Q?Mk8Nxz+ijZy8wRjqJMQiSnYEuB2QYu0XfsMyTZyi9pDarkTAB662NziWEErF?=
 =?us-ascii?Q?yZEBcoPuSCGI3Rpwrp5yTrSYxrM8CU283KCxzgCy8vDC2GCC/D3FKVx5gEYy?=
 =?us-ascii?Q?2oUmt5Og6jHjwXrRZPbWI4wrvXiFLN3hcxZbsIOrauDYo9T6dEOViabagiGK?=
 =?us-ascii?Q?w2TNiPyENcTumwxi1CrhAknXSsbJi6ei6btlslYtGUpA0gkbJEdQNSelaOoB?=
 =?us-ascii?Q?XFBi4BMzisjve81byVogb2i4gPSZjaKk+kjnnIjmDaYnCbwcQLXzBu8sPqFI?=
 =?us-ascii?Q?nQwWSd7TRZcpJdZSESlUV2OR8+f1D6IdZTvL0s+zbohLJH21gnIFS+NtuWKY?=
 =?us-ascii?Q?dxbYq5VJru1C/hAEBa1pTcaOlhlZaxIk8iQ7AVi+7STVeW01nQRLqAshXKNP?=
 =?us-ascii?Q?y6+QSzNu8LVol6mm27jr+rf3j1MBKbd44H1Eyw3VE+yCg5wXQBeQAoibj1JK?=
 =?us-ascii?Q?b1j+6GFUeUErlYbXMT4BDSQkC7ubVYrfbvLXYCzqmwyIap70GivGn3+yS0QF?=
 =?us-ascii?Q?cAjPc8psWFZq0cutxfuVGq5+Ald87pgXIcImayJnS7D9Ln+gRmzPDEN6uM1U?=
 =?us-ascii?Q?z60/UfytUjbS8b7VJq9keCcjgRclEDwesdczqHSo7Fp+cFRPD20JdUaRlJWO?=
 =?us-ascii?Q?093kKItKxjuNikj90xAURTSNEDywwaA1fGny0VvjQ8RRnOH9LsWonb2kbFJM?=
 =?us-ascii?Q?7iaLTHrUu3XwsTzKdcFchRQv/JxE6t1V4lsTrStYQm+/eWfKThw9Iz9TadNe?=
 =?us-ascii?Q?EMNLsyx7qQZjYZOR+3xp/6aCl1rhBoCUSb2Fu2NWVlHfCwWDzV2hzYbn6msS?=
 =?us-ascii?Q?mKsx58wG/gWLfmFUNExm1qHmWOSJxJikyRrhxc/fkoi898Liwm0gKKCyS56G?=
 =?us-ascii?Q?sx9I0/kQacVYHZuqMpskHza+lVuKfwaBJiqNKc5q1vZVRIPw6aSYSt+RjYQs?=
 =?us-ascii?Q?AYPM6/YCBEwfYjrtz4Q+m7XUgLaev7lXiTj20NDPtsi0ZitC2HUWQ4JXi2Au?=
 =?us-ascii?Q?znxIEDDvEQ8N3zvPBbh9XXe+jHTYguCxqCZJddhYtBUvP2MqVsWOMq3U0nXC?=
 =?us-ascii?Q?3v4tAc23kMa5pueSMnUZ6irD7jMdvN2md4lc6TiAEiV1SNLkkvCAcXSkYLw9?=
 =?us-ascii?Q?YkDloAcL3z0C6ehOriQLYkZ9Ng76UQyG9Zaqw4nkC4jNDmToWPzvPjTdoCpc?=
 =?us-ascii?Q?g748NyW5MiTipJZ538+m3oV9OZBafw+yii6XUxmlGzGxUlqk8YL1ty4rIg0G?=
 =?us-ascii?Q?Ik1NOwhPvuksyOnvDE1bQ278zDvYUEW74WT+Bv5TO8bB2QWf/g7uON66gpGV?=
 =?us-ascii?Q?g8W3c1g3Aco2SQGu7njKC0+EIOovVwMATlW4dELHZfhr5b+t8j7xClb2NEwZ?=
 =?us-ascii?Q?bF5YbQXO1fI553KaXR+qBPFqmaBhn8g=3D?=
X-Exchange-RoutingPolicyChecked:
	fhEC3bPmQnB4XsNkvFGC8Ru5AsejsEscBYj7E+DqRHZ+2ma3XetJf5cOfnMBWg5Lr1/bFY0EA+ljTCtASJtrVbVwzaD3jadH8DPq4lFrW+bxLNtoBu2nrKYb5be/FDEpWcRGdPU8+oLRlLEa0vqCyW0VcHJmfpsomATfKm5239VLmLROOWTDTfQo/+nAbZXAZsyxbC0boGmkSaRQR+JLDQQ190wMaxLV1bCO+dc/CJbdILHp8Xnx9awJFrJlhUqapH1UCV600UazXtFbWSuz2k1oA6VTyztUn6ZJ9anvSYPbYy5Uc3JE1Xau/R0SynLY73xMUad8fWXHAERX5wUVLw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hjhoHcrqYfiNViVzp4YhZa1rmjY30VG7zuDm7SDSn7sVXIWiB0bwws9xJ4fQg+l2ZRMovHM72JwoMuASGi3bSO91OaZ9+lg5O5d/fU3esvMgkOSWa/bti/7LxR+n6aFYZd70p07aRka8Xr5cQO9gSOP8vbcmyDhU5IqRDaY+Ycz2oAExEEdBdO8verYwozlZJt8zfLzTIQLyR/9WcB46JzulMoYM9x8TtRXFh0Xm1fH9D1WSW16V1b6EesQkwNQ/AYPDj1UvaMcRvt7CGnkxLgnsxaCP2ucp4dkUZRtBUm2e2/3hOfW1ECOKGwp3I5q0WNQno4zlL+xgufxk04yPlIxX8BRLesVs1ERN7WBwwojZ/bp9AwSQY+2mFA5P3X2iJA3rg20iNnlcjRgj9Cln2+h7R8b6NrXKcrhIH2r1jGP/v5E277Q1+I8hQOLE5YhOj1TBep+oxHSkEWSTaqqR/6PN0tdY3tjJsgjF1U+EGr7z4A6IyKHiBGX8Gl5RjHJVMJaPx6YmgZhJ2EqvbhJdUoszVmHiEaLkn/+unQ7ie3DX51bcDsk560HdbEV/UDp65KTjnwVTdolXSt4cSWTOmPegmwoZGIoFFekr8lS9JQc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19a1e06-d5a1-4643-fbdb-08dec89f9edc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:28:22.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61jhLh7aDjpLUvZP7buBlU6r8w0wyyxF9BlYWXHhmzG1xiixTEMP1kkWJDk7rpai7p2v8FaPXW3Ai8UFi4k4YCBXcPIVljUXgTD8QXwPBtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8122
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120153
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MyBTYWx0ZWRfX6TxuEO/mBVLA
 DqyXLRK074rvHYcTw7A9/sbMWpu58irjR8pZ3wTXZ0eWXcti/mf02cUP9D41ecbSzcn50fpqt37
 Pg+93QegNtas6yB6tfIdgLCcE132awDNQO2KMNSV2cMWyWCf69Irag5H3fmEL3HWNGZDSCr/2tG
 KccMMLKNymutpJnwGnELSd+hEaAL2oCpWH8VjeF1vr/Ldv5Ipw+TfTkMz4HnOGVKa2KXDoi8/W0
 V7HpcKNH9ahsSOmlXWrweInKncytAqnWG8alxoK7aCcOAVVTvMU9PsyMtLQlW0d6h4FprhQZeXd
 taqTD3xXERGV9Z53KKhkwevYxKAa7b1eeyEiSc4echa55Lxn9T2Gplpxg1eQQ2rpmI/l++eSHWz
 drkqYF+Ldu3H1GGD3wZYgfdi1kkyjEk5igUenCCVOnJfTpDfFjauJrMb+zWblR4yDD+7wHgjdgz
 LlzEGTgmqYNr191Rswdncmyd+pB1L+5TKhU3lwm4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MyBTYWx0ZWRfX8pn/UgGE4u0N
 J5IA0efwTriAw57wSzAcb0QLpCf05CBV+hBzJ/I8DOiomXUOIZCI3abGioCGx9oqIPw6tAb9tgE
 x5bu8bVQSESbaXVfYBHxwU7GsLe4l+aKT9j3iY1T+rClk+EdxsG1
X-Proofpoint-GUID: 7gjFhWduveBKYUZZkeNSxZwr53AjzeSK
X-Authority-Analysis: v=2.4 cv=V6JNF+ni c=1 sm=1 tr=0 ts=6a2c3417 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=9mEO5RoUb7z95IiDqTMA:9
 a=rEqNaWj0-quomjz8:21 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12312
X-Proofpoint-ORIG-GUID: 7gjFhWduveBKYUZZkeNSxZwr53AjzeSK

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

