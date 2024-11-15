Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB9513AD11
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646252; cv=fail; b=CXeg0eUupjO7RrstILsrIjL7ZqqkE/+crcXCjmTfb1+Jm5xYgQIZ3I9D4cf5yY4+Ll3VovL3S+sfOFSgv+2r3cUWPbc9StXWT+7j8qGPANvCSi6v84r3ORzt35ffk5428Es0xZ1a1IiSyTV+G24SV7gpRr87AFCh+bBI6/t2DzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646252; c=relaxed/simple;
	bh=n8gBS3ebWWOcDSR3umgJMGVzHTxkHFWca02o5Wib8BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kPvl7dTjoEYAdlylA62vJ4weYmpX2I/i28U6mYGr+pNwmGc2cM1xfshXLpXjTZUNnamVMcwKL9M1K+8QFBPK397Pyj72QB2cymAw6zCqutLTwNpxcGJsdJ7LOsRFIZ3ufAEYtNeZttoJ5R4QpBJJkNUPwfYL5FFsNnXcBfK22qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hmdp8Y3D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QUq/68sQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hmdp8Y3D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QUq/68sQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF4Bw5U000347
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=3iUucBXPxN/KE+KMln
	8GYVZ+/OZlYWS2sS2HPCX+/3I=; b=hmdp8Y3DjPV0WppZQb4VrOJ7yqNSYU1IW7
	e2xT2iXaXaTmuvt/9LLU1RecapNeJ37e8vZsznnZ6t/4VbknECtPPaGCHH8Cl201
	aVKGKPUkvYAxnVkq7bwI+20TfrARx/O4o8D6Spy7fCp3/0Ydj9Hg5N7t0BPNGTPa
	MN29+WKH6zyU4iKzq2MGSs+eSa0ab8s106Z7gLf9LZ1AuTgeMqf5rEZLG2qLfDHw
	MNaZIAdLEo52NFiuOlifEkuMmZoaZPUW4MEJf7zDhKV4CRUb5aOTToNbvOhdAFFL
	HPmP5IyKtamyVQeJS7ptETElbeDNPC44LjPtEy/buMPM23PmvP+w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0n52p11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:50:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF40ghG035901
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:50:48 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6br6fr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGCMeFWHW5OofbhV9mQ5zlU8alFNqHUl1MGTPimnsUEW6HoL1dyb9J8hoRgLkFqNLFlOOK946kjmwK699c8cu4v0j++Jak83lE9fmRAUMo4WpBOn+0IKIMSuKvKjtDqWXaYn/LyXvQil/6160nMPTEyw2Gl2WDpVEApFKXohdtNeBby2XDQ0+VD1uBHW9+81hzoBJyG/rvQKR+PW/+ox2l320Yp4GmS+99sSppV+aYcq1LmwhczFGT1//2oI/hCldWRsPQbcTAQV7znrappPtIwPRFvC6gap0BlsHtc8wcKQAI5HNuwiRapYaxUi7/BRtUz40MKRUC1XcCynw61/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iUucBXPxN/KE+KMln8GYVZ+/OZlYWS2sS2HPCX+/3I=;
 b=mnF9lpKyDozew2UnXLiTatxqgmh3FTw5yex+9YGAl7yqnEIS6hLlHCDIDY8rDKPOLDHuna2hm8NJFZzOpj3yqXRnUmT8q7drcVDCLSMtLj6zc4Ps++dqYt2EGPGQfV1yaoIVL5+NDnKaLcFGHzbSjVnLxmaW9X7OKpvynHfjoaKOsGi1PHy0N9ZNZi0orECyMLJ7hCEBV+26WdQ9o5UB86u/vaMIeFukh5GSysPtRpNmBs1CoX9Lkb0mLs67Eo7/thDXWm1/TcCrDFZbZFT2FSDAnULySUam8ymUuGKUV3G+A0KkdgpCZtsO6TKkxlDBifxcXsOlPj9C9Toh7tr0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iUucBXPxN/KE+KMln8GYVZ+/OZlYWS2sS2HPCX+/3I=;
 b=QUq/68sQxp2mjJud+KSgwG2WtiTqOhEKKFdNAGoWC4mIBKNyq+PWE41+m+878ZAItuEEMAokGJBnmQI7jCuPctJmHk2CM+Qqib12FNFK1ILcGM/0cSAJnwLc4aIA1hljpQ9TrhG4YN7VmF/+dJLDENL4PXZe9soLm1juuGdzIgA=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 15 Nov
 2024 04:50:45 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 04:50:45 +0000
Date: Thu, 14 Nov 2024 23:50:42 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, eugene.loh@oracle.com
Subject: Re: [PATCH v2 1/4] dtprobed: handle multiple providers in a single
 piece of DOF
Message-ID: <ZzbTIi2NEhCEVgy2@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114220108.95647-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0435.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::20) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|SJ0PR10MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a30063-82e8-4908-1ca6-08dd053110cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wfqryit/XAHI0mnCFJez2u0YRm/o/z+lnSvljVolYA3vRHHa7f/SdMmxDkw8?=
 =?us-ascii?Q?48LTfw0PIzOeI7dSzY16d/NfuOsYS6JfE1P7CEvtfkFtyTzIPBTxuCQ19WVW?=
 =?us-ascii?Q?g8DQ7AwLGs12CL8b3jRFh7nocutHpgV1n1pt8A6ALrbZW04gPj++bVtQ+eA3?=
 =?us-ascii?Q?GZo2jyo/uwhCBp49t/yj1TSxYncJtjGnD7g2yfDtNAT6p5FauBf3WcKEaRze?=
 =?us-ascii?Q?5OjrYJw6wntwa8l0k7TMD67YC1oK4kzeg7SmAzrHeEvlRzc8L4XeFqVyNDcs?=
 =?us-ascii?Q?tM8ajDIMsK0k4goD5zqBXHAh7ycPKquAiDSQiHIQlI+XK+HGRakhnhqENGQ1?=
 =?us-ascii?Q?4Og6RF15ghZa7Z14q5v6Qe++5jfvkenJcpiNdmVbsF82FQmUOn3xMzZS9gBq?=
 =?us-ascii?Q?oWUET3sOg/EkeCLXmOcqbZOuM2dYzea5cnCCCrKl/mFuXFfRxdWRowvP7RLK?=
 =?us-ascii?Q?M7/FyUUsA7ElMfbJJHqn3uTyReoytMAEZZ1BuTuUB9SpncPqGfAiCKKkaxew?=
 =?us-ascii?Q?qD2AcHtTCoGfObRNyRtmKiumHtBhAgqjBjdWG04J3X2wvvJSCqYPZPhBmeJu?=
 =?us-ascii?Q?oPnxzGmIcVSPSF0SjOduqf97wPG5GwHl9dFzzC2qmrTbgxeOoR3OBiULTUCO?=
 =?us-ascii?Q?HF7sMFXCKmqjCVER19XDjdrFVIGLemSNeFhstlvxxhZ8UydyxCzgt3dn+Z7X?=
 =?us-ascii?Q?YKh2Dtnv+WfPBpuHSi5m1HKH28WjPw/Y8jeIMdI+ZIbjh2Za52qQbRdo3cZ1?=
 =?us-ascii?Q?D+kyJwz5lRg7qQpxK8NFw5RN3p5X2auqQLwZVoRQWcQAewMZJd3e74Zzf393?=
 =?us-ascii?Q?8sWmhgdqkzjNiPpotbMKlfYqopDZz0qnLORah76ItYQq2Z85N0QkvqY3LK1a?=
 =?us-ascii?Q?mDptAoTjHwmO23k/+q55KXRwv80aOUWJWiC/kgV76z9upSIMrD3aQDiV5E/1?=
 =?us-ascii?Q?IwSRa/z2smzdOZcea9QDrvYFjwgzv+WEcpVrGnDTBKRJHB5YpcYSbrzxJOzV?=
 =?us-ascii?Q?uSEkt6gLkcM3YbjrE3uA3e4+7eC/hs1uHErt2vOZcsROgNEyz4ktywpRp8ti?=
 =?us-ascii?Q?OxcCsUYkTgJ2KUB95gl0U1NX7vVWfMKR7x2o0xtPlP6gbW8hrYl0hVHr1+4/?=
 =?us-ascii?Q?YVRhkfLASr/qQMwVHwaZZAGMfvjX6Ivmx8yt7JQ8MYfuatib+/FqYN2zViGr?=
 =?us-ascii?Q?xgf9KiU/yv2dfpeO3E2xklXRI/dRKrv/GwmBdK7Iw5Ycsn1bUnDVwCfREFlo?=
 =?us-ascii?Q?FgbuPxPZ9OlztRo1Labb0MEMyzUdGiAJU6b5P4h0oslD5N6JHOqMFrOQ3ZDp?=
 =?us-ascii?Q?MAKv8DosBE4TM804WzZBNG5f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dirSCpFTSsZol8lpj3PVTXr46IMyi4G2ul8qJXHk3hl9Xfukd0ffLbl63gvV?=
 =?us-ascii?Q?atFtZWS7nTCD5lwI6oMswupVJvXGAFUD8/LJgYINevF4FTE0Kn228g2A5FJ/?=
 =?us-ascii?Q?2t/n/O++CkMjOlx7u1wKQWmYE+ebiUimdhjU3LP2DlwayJexv26ijm8rtCr3?=
 =?us-ascii?Q?11Ykx8iIXC6NYlVHDn4ZyqszEOT2Yco7UhV155ETF63j/1sLELe/KdwZABu9?=
 =?us-ascii?Q?I7U+xNP07sskg1xjLaWAkQOm177A3KZTiYclB9OmNFsvhwQDTHDYwI/frYKd?=
 =?us-ascii?Q?UjUNkGHD3ILKHRKi6g1I5oXvGxFS1AejY0BKLz1sR3EVlyynxI0GI0tEheSx?=
 =?us-ascii?Q?u8N/c10clPfP/6wgx0sFukCHZLp/c5wmfX+2IoqwhTQq5PDcNrXfgfTiytEv?=
 =?us-ascii?Q?SQAMnnex4+yMi5vuZM8LDIDbkGRsTjFzDoTKUY3ZTATFCRlQGb7CSk3aAoZs?=
 =?us-ascii?Q?cSQcDASdjnhEWoPvn/fjSx3KoIMLTi2qtaBiCk9LT4N6KFsXnaHpyVwpVa94?=
 =?us-ascii?Q?dtDd9cIE3jyyCy6GS3uIse6bw0gQi/ylWyze7JDRSlXeiChmyhK8iTWt2JfX?=
 =?us-ascii?Q?SM0RQXOHxOcRSkPnZtEweGMv4jNkxjazKJ0Lm7gDDrDOrr3ZNTGhLSaW1KGI?=
 =?us-ascii?Q?RW6pR9EdYo9bG+xlaGpr0y7blx8xjc1cEaFjpAXDP1PIoowqZ6E0jwTx7CS7?=
 =?us-ascii?Q?nATXrrKi2K5+nQc/uMtPdPzAwQMVEp4h+Ko21zpebBjxBQp7MEfInWfUGRdP?=
 =?us-ascii?Q?y6PfEoynYtUgnGiBD0avy5Iw1GpWY6sQyL6So5I5lGg1Z2gZiBVV1JMP2L5V?=
 =?us-ascii?Q?le115lr3u6SbU6t7+LDYFTEtyEolBU04yXMI+5sJ0oYSm6FUT3jTRbZwbeJX?=
 =?us-ascii?Q?nvuw1/FbgcAeCcSxWNdIYRZj/W6r1i3cAMEQi99ZKpVCsvMdl0XjZ+opw0eB?=
 =?us-ascii?Q?tshr3WtKZGf9rOtpLPx4H4ep6VIQ/QHSuFiCtkOzFjCdjsMEHq/9bzEX6qx7?=
 =?us-ascii?Q?8CjYxuhuWUH+Xo71DjNhsZMCh/basJN83KtFMKsslriRkacVVNL7q781r0mV?=
 =?us-ascii?Q?86ytqkHd/D5O9saTiO850SmhZyvIjHzadbzm+BB24zwHmHdIcVoJ0yKOmaQo?=
 =?us-ascii?Q?ZHCq+IY1hzZgQ51AETNpEdjsY0lvKcLbs+gFPHRlLIy2Ufh9VhFqfHz3iRmg?=
 =?us-ascii?Q?W1ICxinzVg4uqiXQ2SsrvEB8FhRpWkzqFvCCM/By4AhjTtesPUUUlLXOJjQd?=
 =?us-ascii?Q?cicRMb8GlWvBtw2A+A0DSKtG6AuCzp7UKW/klRUEQJqKK1GmggIoSOYNGFYl?=
 =?us-ascii?Q?shnrYsYg8wpQgMVDxkh8f8Ff+1zWpxbxa66lahIHs290+KIbPnuZNbZjIAkX?=
 =?us-ascii?Q?abvIUaF0FrTCYFg2z6fbbm4CpETSdZcDisOE0EX62Bj6l39uj+HUlxsfEh5s?=
 =?us-ascii?Q?f8SaJ9MFgeRSQVvU7Nqf1fuXaGG4mNwP9esE0MvLu+PXnfY1UG2bpmgg23Rj?=
 =?us-ascii?Q?4Kb8feoo75lV7yvSTnCFOqsHDDdeAztHWqBqCvUxcc+gnGOP40XtOlq1zGIr?=
 =?us-ascii?Q?XVU98JetVDhv0wqSVjKiLpsA7p4DwOxKJGppd91vEB9ceSm0kIOa53o4LW+z?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9+kzpa4/VsPCI5PydssySBUCsJZoqeguG9bg1RBzs5EgBeA8sYPqnFQmSGBbMQDPArJ5dteSdAlOfnLWp0H5riZ5qqTx4j3/eFtgd62C3JhonkMFXOmT58kjspd43T/Ice2BA2uTa5GHY6yavleywYuZ2UitxyGlcnouohr0+59ftuh+rJdJoUT5+KaIBNE51FVrY+pyvIwHepUNSDchD/AuQJ4E+dH6PM9KljhN81oBB22kdYiCUBk4aZfyHE3rhATw8qAAI43sKfU4ucsAkuNHM7bASdCmtuN/MrxUHVzd7qiacOM7FXv6m6aXy+Hwr1qmB5C/WNCv0mtygpGnr996+G8asPPC4U1s1T4iB3LYqMyCUjrj4C6vmQh4f18NPrGVUD0zkSv3DUwiR08+jWJ6cEMXVKTWUfpI+OXAhU3Mul7b1vfzXdDxJ2XZF1RROEJ52oqK0W5kMNTTLHC4x3hIgz+dL4NMjxvgYJ7aFgerzIJYfrPyXHR//Md2KsbZp9utB08tv8UypjVWj/OdNp6PmXLUrANGpOYWYYPFTBelHEYrHLLOyyMftiOPHUry/YhPyMUNDRacRaqW9ZwxgzFxBTizX8UZkyDaARDEDJE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a30063-82e8-4908-1ca6-08dd053110cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 04:50:45.0980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQiP9zx6BQcjQd56OR/XmwjfhDKBOuHOqnlWw6djfZIPbsWr0B1yy6sIQyRXuwCnuTtt9RsmBN8LTCVOa2RoIbQ5djs7jTBR66j7Nmq5jCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150038
X-Proofpoint-ORIG-GUID: k-Pmw9RYEPx3onrq7ktsSWlUQqtR0oCv
X-Proofpoint-GUID: k-Pmw9RYEPx3onrq7ktsSWlUQqtR0oCv

On Thu, Nov 14, 2024 at 10:01:05PM +0000, Nick Alcock wrote:
> A given ELF object can of course contain as many providers as you like.  The
> DOF stash format, DOF stash management code and DTrace itself are all set up
> fine to handle DOF with multiple providers in: but, alas, the code that
> reads the DOF from the parser child in response to an ioctl() assumes that
> one provider is all it will ever see.
> 
> This is not ideal, but rejigging it introduces an interesting problem: when
> do you *stop* reading providers from the parser stream?  Right now,
> dof_parser.c loops over all of its providers and emits them until all are
> done, then just stops: there is no indication of how many providers there
> are or that this is the last provider or anything (though if there are none,
> it does try to send an empty provider to avoid the caller blocking waiting
> for a reply that will never come).
> 
> It's a bit annoying to try to figure out how many providers there are in
> advance, so instead of that, take a route that's easier both to emit and
> parse, drop the empty provider stuff, and simply add a DIT_EOF record which
> indicates "no more providers expected", which is always sent last.  (We
> stuff this in before DIT_ARGS_* in the enum because it makes more conceptual
> sense right after DIT_ERR, and DIT_ARGS_* hasn't released anywhere yet.)
> 
> With that in place it's a simple matter to loop adding parsed DOF to the
> stash's accumulator until we hit an EOF record.  Memory management is
> complicated a little, because a single parsed buffer (reply from dof_parser)
> is now owned by multiple accumulator records in the stash: but every one of
> those is terminated by a DIT_EOF, which appears nowhere else, so we can just
> not free a parsed buffer unless it's of type DIT_EOF.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dof_stash.c                        | 12 +++-
>  dtprobed/dtprobed.c                         | 63 ++++++++++++++-------
>  libcommon/dof_parser.c                      | 23 +++-----
>  libcommon/dof_parser.h                      |  8 ++-
>  test/triggers/Build                         |  6 +-
>  test/triggers/usdt-tst-multiprovider-prov.d | 12 ++++
>  test/triggers/usdt-tst-multiprovider.c      | 23 ++++++++
>  test/unittest/usdt/tst.multiprovider.r      |  4 ++
>  test/unittest/usdt/tst.multiprovider.r.p    |  2 +
>  test/unittest/usdt/tst.multiprovider.sh     | 15 +++++
>  10 files changed, 126 insertions(+), 42 deletions(-)
>  create mode 100644 test/triggers/usdt-tst-multiprovider-prov.d
>  create mode 100644 test/triggers/usdt-tst-multiprovider.c
>  create mode 100644 test/unittest/usdt/tst.multiprovider.r
>  create mode 100755 test/unittest/usdt/tst.multiprovider.r.p
>  create mode 100755 test/unittest/usdt/tst.multiprovider.sh
> 
> Changes since v1: test multiple probes.
> 
> This had fallout -- see later commits in this series!
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 82fdd3174759d..296987ad41e93 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -360,7 +360,13 @@ dof_stash_free(dt_list_t *accum)
>  	for (accump = dt_list_next(accum); accump != NULL;
>  	     accump = dt_list_next(accump)) {
>  		dt_list_delete(accum, accump);
> -		free(accump->parsed);
> +
> +		/*
> +		 * All parsed memory regions are terminated by an EOF, so once
> +		 * we encounter the EOF, this region can safely be freed.
> +		 */
> +		if (accump->parsed->type == DIT_EOF)
> +			free(accump->parsed);
>  		free(last_accump);
>  		last_accump = accump;
>  	}
> @@ -656,6 +662,10 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			fuse_log(FUSE_LOG_ERR, "dtprobed: parser error: %s\n",
>  				 accump->parsed->err.err);
>  			goto err_provider_close;
> +		/* EOF: nothing to do.  No need to record this parser-stream
> +		 * implementation detail into the parsed representation.  */
> +		case DIT_EOF:
> +			break;
>  
>  		default:
>  			/*
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 2ca39b26f88a9..86865eb467b67 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -772,41 +772,60 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  			dof_parser_tidy(1);
>  			continue;
>  		}
> -		if (provider->type != DIT_PROVIDER)
> +		if (provider->type != DIT_PROVIDER && provider->type != DIT_EOF)
>  			goto err;
>  		break;
>  	} while (!provider);
>  
> -	if (dof_stash_push_parsed(&accum, provider) < 0)
> -		goto oom;
> -
> -	for (i = 0; i < provider->provider.nprobes; i++) {
> -		dof_parsed_t *probe = dof_read(pid, in);
> -		size_t j;
> -
> -		errmsg = "no probes in this provider, or parse state corrupt";
> -		if (!probe || probe->type != DIT_PROBE)
> -			goto err;
> -
> -		if (dof_stash_push_parsed(&accum, probe) < 0)
> +	while (provider->type != DIT_EOF) {
> +		if (dof_stash_push_parsed(&accum, provider) < 0)
>  			goto oom;
>  
> -		j = 0;
> -		do {
> -			dof_parsed_t *tp = dof_read(pid, in);
> +		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %i probes\n",
> +			 provider->provider.name, provider->provider.nprobes);
>  
> -			errmsg = "no tracepoints in a probe, or parse state corrupt";
> -			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
> +		for (i = 0; i < provider->provider.nprobes; i++) {
> +			dof_parsed_t *probe = dof_read(pid, in);
> +			size_t j;
> +
> +			errmsg = "no probes in this provider, or parse state corrupt";
> +			if (!probe || probe->type != DIT_PROBE)
>  				goto err;
>  
> -			if (dof_stash_push_parsed(&accum, tp) < 0)
> +			if (dof_stash_push_parsed(&accum, probe) < 0)
>  				goto oom;
>  
> -			if (tp->type == DIT_TRACEPOINT)
> -				j++;
> -		} while (j < probe->probe.ntp);
> +			j = 0;
> +			do {
> +				dof_parsed_t *tp = dof_read(pid, in);
> +
> +				errmsg = "no tracepoints in a probe, or parse state corrupt";
> +				if (!tp || tp->type == DIT_PROVIDER ||
> +				    tp->type == DIT_PROBE || tp->type == DIT_EOF)
> +					goto err;
> +
> +				fuse_log(FUSE_LOG_DEBUG, "Parser read: adding %s:%s to stash\n",
> +					 provider->provider.name, probe->probe.name);
> +
> +				if (dof_stash_push_parsed(&accum, tp) < 0)
> +					goto oom;
> +
> +				if (tp->type == DIT_TRACEPOINT)
> +					j++;
> +			} while (j < probe->probe.ntp);
> +		}
> +
> +		errmsg = "subsequent provider read failed, or stream not properly terminated";
> +		provider = dof_read(pid, in);
> +		if (!provider)
> +			goto err;
>  	}
>  
> +	/* Push the EOF on.  */
> +
> +	if (dof_stash_push_parsed(&accum, provider) < 0)
> +		goto oom;
> +
>  	if (!reparsing)
>  		if ((gen = dof_stash_add(pid, dev, inum, exec_dev, exec_inum, dh,
>  					 in_buf, in_bufsz)) < 0)
> diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> index 1792a8bfcc849..ae5abe5220929 100644
> --- a/libcommon/dof_parser.c
> +++ b/libcommon/dof_parser.c
> @@ -1145,7 +1145,7 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
>  {
>  	int			i, rv;
>  	uintptr_t		daddr = (uintptr_t)dof;
> -	int			count = 0;
> +	dof_parsed_t		eof;
>  
>  	dt_dbg_dof("DOF 0x%p from helper {'%s', %p, %p}...\n",
>  		   dof, dhp ? dhp->dofhp_mod : "<none>", dhp, dof);
> @@ -1157,8 +1157,7 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
>  	}
>  
>  	/*
> -	 * Look for helper providers, validate their descriptions, and
> -	 * parse them.
> +	 * Look for providers, validate their descriptions, and parse them.
>  	 */
>  	if (dhp != NULL) {
>  		dt_dbg_dof("  DOF 0x%p Validating and parsing providers...\n", dof);
> @@ -1177,25 +1176,19 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
>  				dof_destroy(dhp, dof);
>  				return;
>  			}
> -			count++;
>  			emit_provider(out, dhp, dof, sec);
>  		}
>  	}
>  
>  	/*
> -	 * If nothing was written, emit an empty result to wake up
> -	 * the caller.
> +	 * Always emit an EOF, to wake up the caller if nothing else, but also
> +	 * to notify the caller that there are no more providers to read.
>  	 */
> -	if (count == 0) {
> -		dof_parsed_t empty;
> +	memset(&eof, 0, sizeof(dof_parsed_t));
>  
> -		memset(&empty, 0, sizeof(dof_parsed_t));
> -
> -		empty.size = offsetof(dof_parsed_t, provider.name);
> -		empty.type = DIT_PROVIDER;
> -		empty.provider.nprobes = 0;
> -		dof_parser_write_one(out, &empty, empty.size);
> -	}
> +	eof.size = offsetof(dof_parsed_t, provider.nprobes);
> +	eof.type = DIT_EOF;
> +	dof_parser_write_one(out, &eof, eof.size);
>  
>  	dof_destroy(dhp, dof);
>  }
> diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> index 8f42d00551e3f..75aa3082161b7 100644
> --- a/libcommon/dof_parser.h
> +++ b/libcommon/dof_parser.h
> @@ -24,6 +24,7 @@
>   *     DIT_ARGS_XLAT (1, optional)
>   *     DIT_ARGS_MAP (1, optional)
>   *     DIT_TRACEPOINT (any number >= 1)
> + * DIT_EOF (no more providers, last record)
>   *
>   * The dof_parsed.provider.flags word indicates the presence of the
>   * various optional args records in the following stream (you can rely on
> @@ -37,9 +38,10 @@ typedef enum dof_parsed_info {
>  	DIT_PROBE = 1,
>  	DIT_TRACEPOINT = 2,
>  	DIT_ERR = 3,
> -	DIT_ARGS_NATIVE = 4,
> -	DIT_ARGS_XLAT = 5,
> -	DIT_ARGS_MAP = 6,
> +	DIT_EOF = 4,
> +	DIT_ARGS_NATIVE = 5,
> +	DIT_ARGS_XLAT = 6,
> +	DIT_ARGS_MAP = 7,
>  } dof_parsed_info_t;
>  
>  /*
> diff --git a/test/triggers/Build b/test/triggers/Build
> index 107b3b4d1f2e8..c50c265ccec7d 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -13,7 +13,8 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
>      ustack-tst-spin ustack-tst-mtspin \
>      visible-constructor visible-constructor-static visible-constructor-static-unstripped
>  
> -EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer usdt-tst-special
> +EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer \
> +    usdt-tst-multiprovider usdt-tst-special
>  EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
>  
>  EXTERNAL_32BIT_TRIGGERS := visible-constructor-32
> @@ -206,6 +207,9 @@ usdt-tst-forker_PROV := usdt-tst-forker-prov.d
>  # usdt-tst-defer calls USDT probes based on dtrace -h
>  usdt-tst-defer_PROV := usdt-tst-defer-prov.d
>  
> +# usdt-tst-multiprovider calls USDT probes based on dtrace -h
> +usdt-tst-multiprovider_PROV := usdt-tst-multiprovider-prov.d
> +
>  # usdt-tst-special calls USDT probes based on dtrace -h
>  usdt-tst-special_CFLAGS := -fno-inline -O2
>  usdt-tst-special_PROV := usdt-tst-special-prov.d
> diff --git a/test/triggers/usdt-tst-multiprovider-prov.d b/test/triggers/usdt-tst-multiprovider-prov.d
> new file mode 100644
> index 0000000000000..530693ea71fe7
> --- /dev/null
> +++ b/test/triggers/usdt-tst-multiprovider-prov.d
> @@ -0,0 +1,12 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@skip: provider declaration - not a test */
> +
> +provider prova { probe entrya(); };
> +provider provb { probe entryb(); probe entryc(int a, char *b) : (char * b, int a); };
> +provider provc { probe entryd(); };
> diff --git a/test/triggers/usdt-tst-multiprovider.c b/test/triggers/usdt-tst-multiprovider.c
> new file mode 100644
> index 0000000000000..a954111379d9f
> --- /dev/null
> +++ b/test/triggers/usdt-tst-multiprovider.c
> @@ -0,0 +1,23 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * A trigger with multiple providers in it.
> + */
> +#include <stdio.h>
> +#include <unistd.h>
> +#include "usdt-tst-multiprovider-prov.h"
> +
> +int main(int argc, char **argv)
> +{
> +	PROVA_ENTRYA();
> +	PROVB_ENTRYB();
> +	PROVB_ENTRYC(666, "foo");
> +	PROVC_ENTRYD();
> +	usleep(5 * 1000 * 1000);
> +	return 0;
> +}
> diff --git a/test/unittest/usdt/tst.multiprovider.r b/test/unittest/usdt/tst.multiprovider.r
> new file mode 100644
> index 0000000000000..60a15c01eeee3
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.r
> @@ -0,0 +1,4 @@
> +ID provaPID usdt-tst-multiprovider main entrya
> +ID provbPID usdt-tst-multiprovider main entryb
> +ID provbPID usdt-tst-multiprovider main entryc
> +ID provcPID usdt-tst-multiprovider main entryd
> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
> new file mode 100755
> index 0000000000000..ae8493e3d5be4
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.r.p
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
> diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usdt/tst.multiprovider.sh
> new file mode 100755
> index 0000000000000..d5b72c2be77ec
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.sh
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +
> +exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider
> 
> base-commit: 68d14f30b5ffaaea405354a2edf44279127d209a
> -- 
> 2.46.0.278.g36e3a12567
> 
