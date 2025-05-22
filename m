Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C9333F3
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937365; cv=fail; b=rbegap3F5g0Ik8uqEVZCRsKIEUVB5P46THORg/cCWO2wO8Z6HrRW+mfF2tEfHxIrvTYBhp9yy9K/zb/ssloT7c19fgTCJlJLABzWxx4oDgk1wowp48Nj6OaBKP41SZzhFmx8wltn0feNmRX9VyWVzIFy6x2zKWOmKCB81NjtmEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937365; c=relaxed/simple;
	bh=/11+5zpm9wkMlaX1OjGXuDmi+NrKpRvUpcWF4tbMpTk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QezgduxvpLJtgIsz35q7QPZxthrra6WGQuPhuTUbLeu9YdAF3QFbJmFkcytKfqyOOg9Xd3cOZpVwasNB+Zu4XgtVWmjvANXw2ZO7pBuSHM059zF1WxWZxtTuVgIAlhlVoMDtUAD2qGf9tpm5z5LcL0doutof67rcM5ETNdGg8vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EKesiCTq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fr92a37z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EKesiCTq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fr92a37z"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0ohs014472
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=a6zX+bUwNy1V3s8pnq
	j30TbthAQ0aUEFjkzYurloiOk=; b=EKesiCTqHhFYfujVzL4i6Guj4q79qTOZTE
	mmQ+fqeoOwgcRIUjW5zPyxmjyglpGWy2m8xwNipRY3hiX+z/ccn9VNxtQ797zEX0
	I5xw2tjFvgpTweSjFx38wPoVjuTTW8CWu83oFGhOOIDhqHy4cqj/MLxJYGOnl/nW
	Gf/mNMx9uU91JHpoCbnn39TuM8M8TPXvGw1Ib5bsebYOJxPyrQFWn+Cc0gG95LKa
	SLy26u0FDVyvNCDIfOwUeq9hBSzayFeHp+jrpVw2o3tu/Vz1jCrh3y+i4psJm8cj
	5LnpqBZ0VWKKSAb/UD5tRUc9z1xOYjVt77WGt/ePMnUeQoj9DGsQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t7838bhr-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:09:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHB2r8020258
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:51 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwevghwm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdyOSHirZkdS3evU1pSdvV6bPvKP/Fhd1lD+eNMkl/hphrjneHAcUl3k0XqeuO78bkVPabzqN2qx4VwIFQfYLpXUpDKCSC/DX3D2jymjtkmMbTd+PZ2iYE/mNQ4CsN67AeSNRK2ZlPUd/p7SD0CZPh2N8UCIq3CnSI0jTHaESFty7K07TZ1bdglmRS/8uG2v6ygJaGx18FGF7evWYV7WY/b66u2MF0P1MvwoMZoYQ0mon82ouR72ffbPFZNgNs7HW92FdAryaWNYz/8iR3UWR5CS/Y2AwDS1kqTpJiP0Y0Nb33W76diKtZJJO3Dar4+Zi2Nuyor9uqRWkd9/hKj3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6zX+bUwNy1V3s8pnqj30TbthAQ0aUEFjkzYurloiOk=;
 b=vWZyqqqS7SPl9w77P4X4g3Mj/TBlg8PWrtfFRak9m6CpeoDQsG8VNyLs+Za/sjKme1oA8+iMWElm6X5tXbNL5RTtg12bxOLdOMzduEvZT7WfdM3uQrqbxwHQ23lNaP6iors06oxDOulZK53uwpPlP3XlKq5Q7jZtaqfq/3JkrK2It5SwPVAaCeiHhFIzRkJzMmpe2q7kC8UVqcxA1AHSL+F6ytRFk5CIHCr/WbTrm/K5pmDKoP+WhfiN6Ftp+u9eDBF3z5cprBMX/V5t5NhLtiuh/o028cnNGJ7aO7Ny7UunlX+OZvMJo0rnS1uCL/4MqOx0ICEurcVrMFbBwKGwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6zX+bUwNy1V3s8pnqj30TbthAQ0aUEFjkzYurloiOk=;
 b=Fr92a37zWoicS9BrbAvC5KAmTcneUJEey4QV4cBHwPkRumioBdb66ewM+cTSXw1MB68vvKyAy1BIVeFMbU2llRgS/9Y6oSgg55xAljTdvKav5xYw+A269XQ8kiQJtV8LBxBqrgKOMnejUdmpuLfq5XuL3QVQDrxpUuLWpeXy+R4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:49 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/14] Test: caller and stackdepth tests for profile provider
Date: Thu, 22 May 2025 14:01:13 -0400
Message-Id: <20250522180118.27343-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:408:f4::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: fb87f212-2cdf-4a5e-c28e-08dd995ab912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a/rp9cz/dUvW7vtmOq3lzfkX/aGBAVfB20BLTEUrqaRODKEeAwBA2eXmLvuF?=
 =?us-ascii?Q?UW6Lim8Wrw8OrnKlMpff5MfY4F8fUJCfFfUejxLRyHU60oCB2W7+Rjizct0A?=
 =?us-ascii?Q?2ldfKGnznKrasukeZhd1lDJuk+UVj3ed31Nv4AsxNG4DKWFdd54z9ZR8z16F?=
 =?us-ascii?Q?A/gjtc+cbi68QPms/NPHZ7KKCxZkrzmWCdcXH0+Q94iw+oKFTESN6AhllrxN?=
 =?us-ascii?Q?WEdtPZfCKDcJhJqzTR4rmU2GUUIKXjamf0oPrnBVwsAhCnNcguexSKaBV3CK?=
 =?us-ascii?Q?bQN1IqHcWsswtAHiPvCgCLVyWvOB8BLVCAVMzZM/oEF2TA+6lN7GJq8JAjwn?=
 =?us-ascii?Q?/ZmGjOhBQd9PTZEAK82n3MJYHRTCuFhxJGuWurEh/clsMGf+V/iKfATxSrz/?=
 =?us-ascii?Q?8Xpygdy/YCmECgrJIGjJ0zCVDC6IPKbX07AZEkGFLEatCzsNkjYx22FZbhdA?=
 =?us-ascii?Q?gSrAwrT72lTu2fluQEKam9oUjpUFqfM84VaR/fq4NJ55BTPmgkbEcePRxitp?=
 =?us-ascii?Q?bDaSb2Jbbx+hAEFZIp7VVfhXEUsF8BY3RR4hkwn9uN8HMQdcQrw12mBU+Wmh?=
 =?us-ascii?Q?py1yOGgLmaCIcrIBf7W0C2Pfzy61WgsS1MYdC4LXkkWYf4T1aeW4zBTuAvNc?=
 =?us-ascii?Q?xhCx/Acz00xfBj5cDMC/Ma/6c6tMZnMbv5LJ+mrUnXCpfImKRgHqYcQgFPEU?=
 =?us-ascii?Q?mRcZg5mij6oyNTn3u9iZtK/SIDxmTHbume50Hxc+6+Qnq9uygmNuE2SZ6EHe?=
 =?us-ascii?Q?l6H8ByUr5M8I7ZuymPOMKIGlXdLW0q/D4fU4oMdgnQ2r/kEdzHVKo23svI5C?=
 =?us-ascii?Q?TQLr7LRTcaCXQDW54uhKaU6+TTfLKErkCiilapdy6x+XbdqpI1TuaU4z8Fye?=
 =?us-ascii?Q?0fQAhIQLnFlNY9bEaS5zo/7A/xGrbcCH2UAtxLXLPwNchan5ZUYGmgkThHUz?=
 =?us-ascii?Q?ekO8pjYCBKgvpdaX/C8iUqf3jlPk2+ZKBFKr+zzC8c6OLR+1cpdjx8Tz+f3y?=
 =?us-ascii?Q?QjmL7mIES63Xb021L2Gz9/3gtSQrm9mrgZbYSH0XgpuqLjD0P/Bl4sQ+DZIG?=
 =?us-ascii?Q?TCHZkLkUAB+lp3QyRHilShmAq06vZ9mmYP/xadGvd4uG40M7NO/xbRlTDfwm?=
 =?us-ascii?Q?geRwQnekzZ1o9rLTAtiDYy0qWRZaMb/Rnuvapq9GoOrVUwb7UcaYE20pKf9m?=
 =?us-ascii?Q?khVF9dAA1uE+WO9ht5vGP1I54E5dTkNlDnLfP2WWpBWDdiynsW4jfnfMIvch?=
 =?us-ascii?Q?Q/Qd3JtmFDg1fDvU/9dU0MBmBIr3OLwBsNUF5xey8Y0yREtZw1MiPOKrxdGt?=
 =?us-ascii?Q?6grv8+caw7kgoa5HkOexmxhKWI7v4XnKEp0M2nwsahoe2O4wfb14GgICJ3EW?=
 =?us-ascii?Q?GVjiGm0yCNcz7bCjAqKteEc6PtRa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kmTd843pEbPceesxaAwYwV9HxZ3yMQmq4/LLIfdPGuJvLfeEzpakmCOgcxeC?=
 =?us-ascii?Q?vAxO9AT9GhlvcyKkdg4JvFVm7Gn+2uo3t4VRqjFMnGWNN2X8p+KQGR+ysqFb?=
 =?us-ascii?Q?jQgYpurg1piBbsz1Fj/6yFOkhGAsW5b8lrI+3uWI60SEFbhO1NO/r7/i/Lf0?=
 =?us-ascii?Q?6WuvQTcuoLWeOLz6axUfelN0bCEIP3meSEsDJQKueanYut6H1yScfJn+KFnx?=
 =?us-ascii?Q?csmOMXaMPoGMh33M2YvhiMIKbP7DU35ToaAB/i2+WWguwgYYF7K/QGwy1Svg?=
 =?us-ascii?Q?h7sLlP/40uU1aCE79V4dfRBoO6Ei5N1RKw2Pa5vwgprf4lmcVU6LRLkASlo2?=
 =?us-ascii?Q?z9hp+yYgq2WBeFhemjeR5O4oIRO1fBlsCwBLpcjI/epJ+Tu63B7PxvDa6O63?=
 =?us-ascii?Q?wey/vtcxXp2JKxHwrviwpT8JpMrzPU2KeJVETL5ygdKB7qmtnbnb1w1C0ePO?=
 =?us-ascii?Q?9CZUJlZx4FP6LNB9dDhVtuZd/rUglWtImrqSvHIlkLm1vpsxvfEk1+0UNeek?=
 =?us-ascii?Q?YEimwvbA/1ptIbutNOhU4f0lciKDq2+PZqNA30px5IQJF9YubK/t9erVizNx?=
 =?us-ascii?Q?fD0K8f0LPeSFtbnvt3XEBHpXl6IT269uRWTvarjqOpwZmJfFL5tbBqrOpYYg?=
 =?us-ascii?Q?ujQApLiJvoK1bc0nf9AxSCUd9Oa5TPa5VhtPi+GAfUJ/W6MKMv/0X/U6cobc?=
 =?us-ascii?Q?J5x1T8Yh9NIG0gCqB8vtnwWj4khOev1mTEXbDES0xrrkCz2V0WwGs1LkD19q?=
 =?us-ascii?Q?BU9pQjgiicvmPcTI8is+th6Jujw0DDAYhz3urvR1/3ywen689Jwzlmo7m8zg?=
 =?us-ascii?Q?ZFGi92COJOTSFlWQTMWfwRDMFiuaGbiUMTrmrR12ESl1AlamEamGxZMB8Qka?=
 =?us-ascii?Q?t/Z9wC8U9o0n7Ptdcp2pBrALdbFj+GPqftT5MFBIf7W5xr5uekJ8Y6cTYair?=
 =?us-ascii?Q?rmg3l3VwFF7cROzFey0VQkX/s/X4UOThtkQWYAo4BJ/azy88+w1J+sevcPp6?=
 =?us-ascii?Q?q31jDDi3iUIjSHyCGIcohkLnVRmkA6NNkAE8vQ/bS/HqScfgKnW/OfMO6/NY?=
 =?us-ascii?Q?OSqnwc+M7ZUVUln9DCskEwlB0fXQdekm7q90XHvHRlTbp3M+p+7SpsctCMMh?=
 =?us-ascii?Q?6AThAH0fzW+7c1kuQLXsPAGXOuT8VSaRCdp/lSNhqy+E5O/ntHk8x3HijbYD?=
 =?us-ascii?Q?eGvYBtg3eMJ76dv3S841whWRDcKykE8qWZW0JZm2RDIav6kP0GiHVmOgvHCS?=
 =?us-ascii?Q?VShO1DXig4ydFu9yyG7goSl08cy2EsFXsqYMxZlBe2DObt9oyUQnZTtHGaS7?=
 =?us-ascii?Q?ZGTCHXAngXJCcnyfIc+k9GD5IeYb1BWEiJdF8uVBVxcpZbQjbeeRqOYt5kr2?=
 =?us-ascii?Q?KeLw6e/Z/kYHhqyvS/d83VCurPDGc2LpFtKz05Uo+Gpt43q5zANMYCoRdRcT?=
 =?us-ascii?Q?8RRrjJAYe7ZIPBpo8SX4BSNgsxvI5001irzrZErXLDKH5794amxQTzI1zyaO?=
 =?us-ascii?Q?AJwi0EBXVqyhzyiK+xa2MtxsCC1VlZgUBE4Ls45IF3vagA3XTnG69tmugmRY?=
 =?us-ascii?Q?lG1NKXwiILnO0NCHJD6eOM4HDW3P8sgvWxEUZZBB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tAmVubm8MItDPdJpqgD2/93cYKmnbVC7yUzVa/EZ3W4xvHG3ugvBHNuJd/RDwQEGsgvETUZy4DHhcTGmA5HToFAknfJzryuHm2C18jTp6/l0mznWeSNhcQtjfKgohn+oAcXh4ONk8+yicE221cCTH/gmodD732YeZkHpu/hKlQBS8ZZtiNMEgwHd/ODWsJYDWmSD2GqyzACluR7eRIpqX7vI7kMF969AQZJzLeyZZZjRzL8tXzRvTHrM4PgpBZCChaHlM3SY1LqlL+J/lnigpE5KbTLc3YAcxsRgLRrbk2S5KvKjoMgeZOZKrn41Q5+UNxKUZqW3ln3wiUDuYFOsAllSMpl8RHFIJA/rfrdEFiOZBqRTqq4rqe/oPLy73TTgaowORzATdArn3EII5l2geULmokPGWukmT6Ii7gHlKXZwBg5nvfD6EBfhnc1mrtUDAh8PivchZAhS/s/9svOToDpHfE1fW56HU1xn6VoDGqpQ6tLsRcneL93xO256P+xHYmcDLxWvDqTGQ+3FQ8MfbdCVsYERk6Oivl9qwLSHNEC59lDD7HEG//9P1aRSzPhgl7mTp7FUIXofZolf3l1XGMHRkpT689j66q963FHNnug=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb87f212-2cdf-4a5e-c28e-08dd995ab912
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:49.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr2c6ag/vyzyPUYZKkbhQykD8LGz4XjIlJ21knmSzZ+GTC2FxCRa7WoVr5WjAuZZR3epm/QEeJCLnnHOTx8/tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX22XEroisZtEK 9yQsHW1UhCT+vmkoNpctPIM94410c5CQynVAwzabg56ldI7fV/hTcgNi9iir39WYgJgdAMXfWrS aNF2TzUwsUjr/Yed5SZv4ZzRl9ZlGVMfsn01tm8VgNKU0eaTHfSVie7IZDn8l+hS8sMmXs2TJp9
 6FdyUY2uKS2Ueib7p19HLKm0cuc0FvCoZz5f4ltUvs1fXON6ZfPONBeDIeeYV+aftrGKCaupO2E BTIzwEXiJnYDlNO/hZsB1XoFKWbiMJyHFprI/adOjQwNokjN6XRXBgGhQJOo76Ty6v5zlrx2PJI l2f3VDdhuPoSUtDpsXExeb9sViHiQ+HdMeWd8KgQIWvXB7EkcyU78z5IUnz/9rCgKzTow40xuyr
 Jz0ln+9PVpnUjt7r/VAU1LPvwV7Tx6Ssb8SAofQ3nco0xZK7QTwgz2Jh6WCZwdJAyxuya5Qf
X-Proofpoint-ORIG-GUID: 6KjWgNma2meckPYKvcpTeEwntltPStll
X-Proofpoint-GUID: 6KjWgNma2meckPYKvcpTeEwntltPStll
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f6852 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=BaVqHgSiZxxewaDosMwA:9 cc=ntf awl=host:13207

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/builtinvar/tst.caller1.d        | 29 -------------------
 .../variables/bvar/tst.caller-profile.d       | 22 ++++++++++++++
 .../variables/bvar/tst.caller-profile.r       |  1 +
 .../variables/bvar/tst.caller-profile.r.p     |  1 +
 .../variables/bvar/tst.stackdepth-profile.d   | 24 +++++++++++++++
 .../variables/bvar/tst.stackdepth-profile.r   |  1 +
 .../variables/bvar/tst.stackdepth-profile.r.p |  1 +
 7 files changed, 50 insertions(+), 29 deletions(-)
 delete mode 100644 test/unittest/builtinvar/tst.caller1.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-profile.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-profile.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-profile.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-profile.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-profile.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-profile.r.p

diff --git a/test/unittest/builtinvar/tst.caller1.d b/test/unittest/builtinvar/tst.caller1.d
deleted file mode 100644
index ca0f098f3..000000000
--- a/test/unittest/builtinvar/tst.caller1.d
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: To print caller from profile and make sure it succeeds.
- *
- * SECTION: Variables/Built-in Variables
- */
-
-#pragma D option quiet
-
-BEGIN
-{
-}
-
-tick-10ms
-{
-	printf("The caller is %u\n", caller);
-	exit (0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.caller-profile.d b/test/unittest/variables/bvar/tst.caller-profile.d
new file mode 100644
index 000000000..6e322bb70
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-profile.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+profile:::tick-50ms
+/stackdepth > 1/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-profile.r b/test/unittest/variables/bvar/tst.caller-profile.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-profile.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-profile.r.p b/test/unittest/variables/bvar/tst.caller-profile.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-profile.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-profile.d b/test/unittest/variables/bvar/tst.stackdepth-profile.d
new file mode 100644
index 000000000..8b42e9016
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-profile.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+profile:::tick-50ms
+/stackdepth > 1/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-profile.r b/test/unittest/variables/bvar/tst.stackdepth-profile.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-profile.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-profile.r.p b/test/unittest/variables/bvar/tst.stackdepth-profile.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-profile.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

