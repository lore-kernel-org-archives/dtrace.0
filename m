Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA034D910
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403131; cv=fail; b=nF1fG4JgxGZxAHCjYXR6PQI2wKbUjVxCb/mi1ioDO33QJbSrnLYBQ2Fi5KnqeRiv2x7IM1HR3ZhXX7OaEDeA/bfyFakHMW98pz7eOqaeFGtUVknfc+CDOsmj/EJYHIdiGVfd+Wkbc4Ne94WqNLOBpZSv3+h/FfSvgVp5V6WBaT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403131; c=relaxed/simple;
	bh=bDAAtBOt8iip15OaUvNaaP/gU17SGJxXl18Lwar9NA4=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=JK58D2O0An0HtNaPHr6IM15gYyE7+9xwiHJTwEZtzfVTb/xyOqFOcEJCgcZJbnb/ZHNsTTQsf69lG1MvYSD+pnnQSegPWoR28KOOTRwjLW2yGxUkZJENA6bdcN0cDCvPBJi8tN6IIu4c7Ugp7PiiZKjcfegMHWpWLWad+HIDIbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CteDtzBj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i2dsM0Em; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CteDtzBj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i2dsM0Em"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SEoi1n752815
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=vsT20yrmgh0WoLsj7d4dF3eYVuPOlURTlRnFLf5dnHE=; b=
	CteDtzBjS5XvoTFureWk4usq+v1P/Tl0CbuzUs3goKWT3HlfUulCDBxJ8GJqf8zm
	kB4l//8n/wDdG8mg5GPKiK4i6gLIFtCL3RBEQxkTxt9/831eaPouZE1SkeLQwatU
	AD/sijrq7QotoBaj80m6QkLMUEoOiU0fezf0jBXwWWtQ01H9RKODwc1VXtH8loD9
	8jTACB1a6GffgTehGYq5XrOytlBPDOmpVnlHkqzRyj834ZOvfeQCYFoPDtH+GPrG
	CQpxe4gN3wd9wuAsT5oXzkMrggOudVa4FUx9MsGuRSf6TXmA2MLg9Ij9KIubiJo5
	5LvQ6jJRS+5iD4ZLV3Kb/g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4drnnegkdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63SJ1PXK034277
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:27 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4drm2cg05m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjF5dVHesAwqAwiWDHRSc8kxee02UQuI5LJ0O3ksh/D7aLwhVK754VXQWmRlQdGU0cqYEdlvQG7K9fL0sjKRvu4XAjJcN9ohQz+dqc4JhrFgep6+aPTFE7fsKw72frtMHDPSxTSzXmN4gKmNdIzXbvdUzJgjPS6HE42r6q3m8iTyR9rShmVZkqjricCvVV45tgwmZuiM7ywVNVKXOzPFSxW4Jiwa9JyxpCcicfpXsp5iPEOYNuFYJ1s89MWPAK80o2yiLc1N06oBgh+xkEdhC7cemvkwGNt2lttBQvqN6I0M721uJ/L9MfAWSEOhKRsjKutAHvcMcQ4RY5g3ZxnsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsT20yrmgh0WoLsj7d4dF3eYVuPOlURTlRnFLf5dnHE=;
 b=CBfay1U3exDLjBfE3LffaDtztV9OACgHoY2az9ES2vvPS4/YpFzA48XP7XNxVfGJxa/7CCGROjwqh0WTFUzWwTWZs7IjLzCoVkF7FlspRHa6TewiSTMY6nPD4yIeB8pJ/aG4rdnghY+rl/8lYreghYvo/QzwWv7odXl8epzQxzTA04DXlkCBN1VLDpdKk1wrFThHDutuj7Hl4CYX238s15QqpYoZl4P4046K+g6wyBxSGJJK3BxGdSNdZV/aa3Xizm/lOUibVQEyrVO88imN+OEQy776pOao3Ewrs2h0dKYMiCn7jTmVz4veG7otpSkUDGShWhZhGNOwVNObe+ZgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsT20yrmgh0WoLsj7d4dF3eYVuPOlURTlRnFLf5dnHE=;
 b=i2dsM0Em54rAnlUSV2n7WkFip9bj9O3yn/UKQx5rA5/L+MyBBxLq9WG8MzkkgJrMBDGDt6v3r1tADftHpgNEX5sS14En4iSuF495FccPAcVthX343clWDmlGcFvXgyApdAQXzDbYJaJplQGb9h9Y7Zws5d3dbHZuBxTNx3XMcvE=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 19:05:24 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9846.028; Tue, 28 Apr 2026
 19:05:24 +0000
Date: Tue, 28 Apr 2026 19:05:25 +0000
Message-ID: <9ac31f4ab2458999e6af2c41621ecf67@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] fbt: do not provide untraceable functions (for fprobes)
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::21) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|CH0PR10MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e378c7-fade-40dd-4db1-08dea5591a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Yy9L1EXCVCiPdT2HpHiZsBn7t9hb+tL5vNCbBsiN8ymUPk9Y7A1PHvMGV4MVN0+EYcW1q6/E2RbbIS4de3M/IWmofCbWTdgNPOVWy621dW2xHtNJDC/BWNp88CaEZGZ1syZF4avcV+L3GAdXkQYkS57toS7iSQzfX9CPR2TNxpL4miNlhNxPHajQjBaC5RjKmlVy5gX9fBk5pbq1+SL2mhZPdWNABlo/Y2vf0vAGkobSMjABOQ5JF91O18l/k7MA2tQWASZWel1MrM1OqOSc1dStsUwBqGlygGjgyrNZUvcWRpwjfT/rgeqm+LcwL6Vk+9ITo6pmTX6lTrcHcJl1yTR+xprtrueizVY/Ck4c21Mhdns78BqxGb1w7lfHmMssUtPYEoecKRNgTXtFdLHhIr06mw4RTZkSCzXNb+8Rw9EQibS5G2byTYlWb84joXrmpVIVP82zyA6/QRW9cNkzbZQzNSwgP+voNNoFUTl0Ey2wwHD/mnScZvE6tcmyTPL8xfFKvAM0w/Xfu35YkAGLebPTDeYMZsSLBUkWuC/d5sbFjU3/cX0MuVLYsMjLhlLIJhMZSPMTc1+LYbX7YwrSuUg9ZFn+Z6CGYapCL9qBedBa8lTgg9mt6js5V/X9mfTlJ5NlTSvyPlO3mf0XFWHa5SsV0BlR+ttedgAvDiZbL7TIP0HWY5wBFfsENrmqo+Xrvit5LrX0zEAx9wKwVvbzHIMcngOPSHskEH2lUse/GBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CACyvMiZuvleHsvmbOV8mDbUyNPfL/Q8qwsg1vyrP0b8STMiRtEX0ox8CJyV?=
 =?us-ascii?Q?BR/9oVH5eokHeQlKs+hSIL+W+HNdzOW1Ucw7yXW7ztIMCgge8M0oZ/blOxD7?=
 =?us-ascii?Q?YmQva7NpVJl2XcNnmuaHi/jb3GvajVY8fXRnp+KYIt1u/ZETC9lD1A+NSdou?=
 =?us-ascii?Q?0iiRLSdY7wFIp+w1vI+HG7GqWqT5hSCjR/SFsBCKWOkyU0q8SA51CtSl7T7U?=
 =?us-ascii?Q?PHPdJ/aE+a7tUEmq6tDMdZGp8c/okKvKOIvybiRvlnJPnqBJ9K5USjrITy2V?=
 =?us-ascii?Q?sDnaROiu8JQt3AvHI1ZM0JmLh+/bCBx/RclDC7F0N4ub5ncXNbmcFIgv8WeL?=
 =?us-ascii?Q?URyQtExTngn8zFFoa/9C2Amp2cVZbP0P85reZg0sSHuffAu6x9kxfeUKzBaw?=
 =?us-ascii?Q?+BTRZagBV2RRKkTdok8uznv9X4Ey/f1FyCuE8n2aMRh18N9wklcjgRuBQSGT?=
 =?us-ascii?Q?zyb6YZVT9gA7uzF7MwvmeKVImkOBpahW/XIOujSNCFNgBJyj7QYUxhW2jN0n?=
 =?us-ascii?Q?UFED9SHLXkRhORbfzLJlKWlI9zKCrcxuVp7fICkMdAAMlloKEAtO5LINtlbY?=
 =?us-ascii?Q?xaaHWOnp1p5mQSAOXZXoQtAp8PC4hpWO5gPbM9+/ws2KX4m4sTzZHD6uXbzc?=
 =?us-ascii?Q?2tCCu+p8xoAeY8h+eECjQ7dK+qJCF/WncD65cJeDHABeSUQ349w4Z5I1kon5?=
 =?us-ascii?Q?HpE03yD1qfEQ10TCwI+pHtjJT1HHteJdpR16MRGvThtv2R/wZI1yPs8qY7VD?=
 =?us-ascii?Q?0S9u5xiVd2ACL1wGXtqZxyJkQ+DJZdzJvMjzE9quRNkT5NsS68/bovFV1obs?=
 =?us-ascii?Q?qGv4g/LGN2G2u2z868OijsJkSJ7I/QiO/0MBVgBrNxc4yKolBdggctfKyPKJ?=
 =?us-ascii?Q?0j0Rax1AHAmd1xwyK/2opJKeYH3HJaHEmG5G+CBREXNT9OMjETixVlQ/oSzj?=
 =?us-ascii?Q?LNRO6KcUaPaBKRuH9xPOV5f9in+xrb2FEbMZ83kiaJguIvUGjeJkPyJTFDDk?=
 =?us-ascii?Q?kBamVLNR5NPcQomprBgbb27OWlkwaUO18Vhp60Tp3Kih51HWg77CcR62pkGH?=
 =?us-ascii?Q?XIeN0Hzg292VOF2XNI6Q2UrTo4cZna7JkqBtWU1yREd+M2SdiBIEpmY9eMci?=
 =?us-ascii?Q?tdejea+tcLG6D4SKNosdG4dmeIVGlU29UJ7JtdbQ9on5bqcvzL9Etyc5GgoK?=
 =?us-ascii?Q?EZnEPQQuPu8pokETI44Aavsa+VNTySDn6cIIQhq3DBtGivmT7gzx6MrywXSC?=
 =?us-ascii?Q?DTy0NSKYc+IPVShOd3l4s8o6gQqrLiaMIKwdtUzrjy2pRPuadkSCeYsg472v?=
 =?us-ascii?Q?YdjV356U6t6c19+koXVRjq66sGL/ta4rN98rQNFjIA063AlTWaJAUXy00rwq?=
 =?us-ascii?Q?XOr7Xbl4HXvLGvNCpJmZooUXuwUAFpSWd8gx8zqGHisugqwtnzTk4oY4q9c7?=
 =?us-ascii?Q?OJ5oz4t7j2Ihy11it1FzH5B5zh0Ix4sN6ZevDdFjxZWGk6bc7kfrnE71BwEN?=
 =?us-ascii?Q?k57dOaHIxyI1FsMXcpELDegs4lkDUKIZIgbRqDEHGpLOi6I91YUhmQScKkLY?=
 =?us-ascii?Q?avv8Fia1GzMoqJ6OC1RVgYle1WOlsrH70OUaAwNEZz4BXacpmdPBjFft10p/?=
 =?us-ascii?Q?kIEco0ipKWxRTfbBCkJtRUmWQ/kFYMjCtkctxUi3JS+lUIEzCOPKjnliyFWY?=
 =?us-ascii?Q?FIz7CLKOdNDOiEWcRuOzoq9s6I00gW44qLdAHEpunwRAcX66RuXyiHxh+Zcr?=
 =?us-ascii?Q?qzCXcYEXL75SioQ0b+Py6oGMn2b9B04=3D?=
X-Exchange-RoutingPolicyChecked:
	NC7CC8RUBic84Q97DoVT1f0GUD12uVKT+t7slI1r6u5bf+ETzC+Y+Rdb/7nejVFrX0zI1mFa50s8lDOm4zA+QD4L3ZGfkHe/Yk9KamR+dWDEtY+sdzL/r79M0i7P9qQEKI19qo4rv5a9NIqvdNQiMo63c6M88nsgUl9MbsGZ6CjRBQTN8jt2e2icvBWA+kwpJHPG75tkKYPrHcyBDdA6Qk1nbg6Tw2pF6R/ygqypOUP9gdobXPzQ2q1chNhgFGmDZvcJiP+kM4RguQh7PsK2+5lwT4P8WUhBbvZkvxB246Uw7L4Xmcw9K+hVqgOBQtRFx02k0mPv5gt9VVuu6e7ECQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nm4l0TcEOqp1meARh/DN50XLYULMCWevxjoS8dRtsdIhcKyGiOnKCepgCccPc8Rm6fB7xIGD2/s/utLQqVQEQcj+Iqkx1CG7xgOB/eCubAchiu9NFY+IVJbIHn03YcT3ToaxHXprmbC/TWkkvxaeTTOlrb7qPM1QbRWlyehms0UbO5M7t8KNIT0Cmz0Wx8QibvUiB+uS77/uihVZJqxyq9Jin1OZfglJwxhBsP+rpZjXmYjlcePAyYEjbd1NzPpu8YRS0nPG+rzKTC5lL08w1Ija9tZLqtiDwhukZWV/T8GgkTVYVYUkvQuiqU1GNP60rBQycoRsuRZb4U/ZOrU3VO7sVN34YUwKwmj049QrIHe9wNhHNX7UhLGyVKeUA3zhhL+NP/f7t5DMJv9gs1XLoITDLVngPul3AGp3hu8ugfV7FBVwGsjg+ioxmPjXpO44IpabNOUrPBVd6dJ27EERAdutKoM1RZZ27BlUR57miltjaGTxkqQxUEYbAsUJsnPv+k2aIHljaAlvf+9DDl7ms//h34DHVxEJnXNv6foaK4TKo9HSpZPrTNHiDUIVCQGrv+wVzUPQZ+u7hImAYFQvLmHoLbaTzR4jaV36do+ZHaU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e378c7-fade-40dd-4db1-08dea5591a29
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 19:05:24.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEMiVhmsatND368V4YrB4q1DLz2KVEfYqt7QnsecqPMYrqYoIfyxXihy0XD9tU+bvWJYRHISi6D+HCdI2FCQ2Ofs2q3406/dms3Pt26y/xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604200000 definitions=main-2604280185
X-Proofpoint-GUID: -YQRUcf1u9O1C2Waed8DBIRpRXEFRJet
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=69f104f8 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=ez-uVdGb03LBgEr2iaIA:9 cc=ntf
 awl=host:12310
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NSBTYWx0ZWRfXxKlUwwAQpp5G
 TM5vuhIZzRMzm5q64oXR5G8p1YMbO0MmbIqA0aaRTNe/hfRzPCctwfkEumg8dIWqZdUV1HnKivm
 RFKtLT3vkBTJPJLz11Mk+zHtZ1/qK0uczYJZMSRaswF9nSj/d8Mu14lAzTUVmIRTI44VxEgjNl0
 bxWM/tNsA0NRKdI0yPi/eQ3hXUZ5qM3Jx2fugwt1iEIefaaO89+Eld/Xuj4D1yTnpAqOH3I9jIK
 8huh4Zq3V5uXG9MBAVTBhOe4m+K0ivuY84F47pC5OCQC7xA6oFeygvY8CqcW87wdUPssQIZdzw5
 y22uNiSvr4VR94woExQPB3FiHrqtLk050jNBHLjthF5tudE67vW9B2qHEpXfqNYuzBZDYKUXqxy
 kUigK5jK2EMuiemLUdbMYUQ10eJajLMgDEEyi8fyTWMDZ50bZyjrenREzcgM+HyaKfEeKYTwFXw
 u7DggBrB4GLayq0DpGbqTFyQzOiHZ+gJ+4cPYoLM=
X-Proofpoint-ORIG-GUID: -YQRUcf1u9O1C2Waed8DBIRpRXEFRJet

Ensure that we do not provide FBT probes for functions that cannot be
probed using BPF fentry/fexit probes if fprobes are the default.

The provide_probe() function now takes a dt_module_t argument so that
dt_btf_func_is_traceable() can be called.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 59e4583b2..d6f57c67f 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -86,14 +86,31 @@ static int populate(dtrace_hdl_t *dtp)
 }
 
 /* Create a probe (if it does not exist yet). */
-static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+static int provide_probe(dtrace_hdl_t *dtp, dt_module_t *dmp,
+			 dtrace_probedesc_t *pdp)
 {
 	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
 
 	if (prv == NULL)
 		return 0;
+	pdp->mod = dmp->dm_name;
 	if (dt_probe_lookup(dtp, pdp) != NULL)
 		return 0;
+
+	/*
+	 * Do not provide fentry/fexit-based probes for functions that BPF does
+	 * not currently support (see dt_btf_func_is_traceable() for more
+	 * details).
+	 */
+	if (prv->impl->prog_type == BPF_PROG_TYPE_TRACING) {
+		int32_t	btf_id;
+
+		btf_id = dt_btf_lookup_name_kind(dtp, dmp, pdp->fun, BTF_KIND_FUNC);
+		if (btf_id <= 0 ||
+		    !dt_btf_func_is_traceable(dtp, dmp->dm_btf, btf_id))
+			return -1;
+	}
+
 	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
 		return 1;
 
@@ -173,16 +190,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 			pd.id = DTRACE_IDNONE;
 			pd.prv = pdp->prv;
-			pd.mod = dmp->dm_name;
 			pd.fun = pdp->fun;
 
 			if (prb & FBT_ENTRY) {
 				pd.prb = "entry";
-				n += provide_probe(dtp, &pd);
+				n += provide_probe(dtp, dmp, &pd);
 			}
 			if (prb & FBT_RETURN) {
 				pd.prb = "return";
-				n += provide_probe(dtp, &pd);
+				n += provide_probe(dtp, dmp, &pd);
 			}
 
 			return n;
@@ -190,22 +206,20 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 		sym = dt_symbol_by_name(dtp, pdp->fun);
 		while (sym != NULL) {
-			const char	*mod = dt_symbol_module(sym)->dm_name;
-
+			dmp = dt_symbol_module(sym);
 			if (dt_symbol_traceable(sym) &&
-			    dt_gmatch(mod, pdp->mod)) {
+			    dt_gmatch(dmp->dm_name, pdp->mod)) {
 				pd.id = DTRACE_IDNONE;
 				pd.prv = pdp->prv;
-				pd.mod = mod;
 				pd.fun = pdp->fun;
 
 				if (prb & FBT_ENTRY) {
 					pd.prb = "entry";
-					n += provide_probe(dtp, &pd);
+					n += provide_probe(dtp, dmp, &pd);
 				}
 				if (prb & FBT_RETURN) {
 					pd.prb = "return";
-					n += provide_probe(dtp, &pd);
+					n += provide_probe(dtp, dmp, &pd);
 				}
 
 			}
@@ -242,16 +256,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 
 		pd.id = DTRACE_IDNONE;
 		pd.prv = pdp->prv;
-		pd.mod = smp->dm_name;
 		pd.fun = fun;
 
 		if (prb & FBT_ENTRY) {
 			pd.prb = "entry";
-			n += provide_probe(dtp, &pd);
+			n += provide_probe(dtp, smp, &pd);
 		}
 		if (prb & FBT_RETURN) {
 			pd.prb = "return";
-			n += provide_probe(dtp, &pd);
+			n += provide_probe(dtp, smp, &pd);
 		}
 	}
 
-- 
2.53.0

