Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E738424C
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772657878; cv=fail; b=WwULF2PvJ7lg0Ikg0s/6O2sonKffDuOR89n90mf4DzV2TG/iEhlWlyqS7vtip/49lrAkoRKHNNbqe3UmsVlcZiPDNYqMKok6IjD7lsRwNDK6WclBI4V0sks48XslBh8Q4sja1TYjaMm1L+IHReiMkRfz5Z/ASGLH/KcdNZf4XyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772657878; c=relaxed/simple;
	bh=shad5tnk4DR8LeajUJe0UBo7ccJStFefwWOIE20fNd8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QGkFJ83oMBF4grnCMFesHQ8NjomwIJ5g5+N3WBpwp8twfb1GjlJiP69FP31wT4xGLN6QabyuNZcHeFabdAaaXYySYbKRavdyktpQuo0eX7hZOu8qTuHOSX5MCMkzGbWzG5D6o8BPgrpre6E3IV710M15ihTKw1T/C24tkeFprKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MVWJ6chb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WL0VscEv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MVWJ6chb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WL0VscEv"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KcGew3631704
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZkszzES6NzqHMZu0Ax
	G0H0zKHsY3bHP9JZlpDkLUNhY=; b=MVWJ6chbkIDH58AOYy3mum1U75Wr7weudG
	J0StQAuRaVAIY4lL3Lg0PpfO2QnYlEjrUM+AEFdwB+he2ghOQGI3wTOvI3XTCD8D
	lAj+K4X9s3Kt3oRJntAwPt1bM1XFdRy0eqVyguoHJseLx46xEfeyRIiu5UMgdx57
	4VqcKvJZPuG6t1sHp9vOTRS6/FYHSRV2okn4PNu799P7XZOh2jZWieoUWsWi1W4e
	XqZNguw2MU5geCn+X8hq0XWnf/o9ij0LJZjBEmQAN11X2bsQfLEAi23Smzwe687Y
	utrC76fhITW0jMwVUro+aLNH2VnlTd1SDxx6Kp+i/7HcwTHO4LGg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpuxu00vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:57:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624Ke7tA001370
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:57:54 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptgmm31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:57:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifBtifg7OME9pZzN+bgcf2EI2WiZaWUBzrWaOVe68b6UVz2mMDWFjk7MqG+cp1ewoxDrjiTZESp/0kIk9AbdA2Lk1JwbT6cHvai7KcSLqc2uoYdQ8GNvp1VhE4d6l1RSm1mgSpFIbyV+POF9dHTpfBGMbzLaricwkEa1hnXDvE2Szafr+AdShJIkgiNheuUtt9G6SZY/OR76fLSDPA6oSQNZevUNGuX4lEEqPWkVhJmZ++460lrZba0Zz4ulQ2Js0TLfLAMfPoFAZ0zLwvF30jPYvOE2eKzdnujwfVEEuqpLXeK9KtnaAbVQhJhyTCgMHR/mq4A1eSBbwKRsEb6EYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkszzES6NzqHMZu0AxG0H0zKHsY3bHP9JZlpDkLUNhY=;
 b=N/50FYVJ0JQdKCERL3rO95G1PodcMtPnM/IZUNnp0ZHOhFBUKjM+C49XK+l+u7FhN1lqVU0EQGq7Qz3+4uMP6/aYIAy7dLXy2o1fFDnfByG2eO0sSv1QiqdCVUF/h5yphHqWD9OcsMAK+zEmXkyoPsMzLRwTFE7yqwIkMtR5Xt4R0FnYz+bGMktNkoEL/OiqGqmkOev41LiIKHV4wpPLC9A6aYRcCqZ939DEkXJk7GzFI23yymz99oXE3ePfHl3Sm7GaQBBkMuGtiPgn8dSr6mpTWQ46Z79HHZGwIfXX7ri+qoeumuv7HOJkG6e5GyH9x1XwVBcJL5hyRPrRbAPw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkszzES6NzqHMZu0AxG0H0zKHsY3bHP9JZlpDkLUNhY=;
 b=WL0VscEv54pu1Zivu4Y3ErktqaW612D/dzLWd3ueMEk9RHSWfdZ+vPsW2G0KTEhpVpPZEx/Jkh2jU15DPbkVu2XFZAdk2kLX58ftKjCrfoVkPykSm/iHHOK7ShI+thBRiL6G3QrtRHLyMNt8XhQ085f0og0WyaO2f2UevYdHezI=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH7PR10MB6506.namprd10.prod.outlook.com
 (2603:10b6:510:201::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 20:57:49 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9632.010; Wed, 4 Mar 2026
 20:57:49 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: <dtrace-devel@oss.oracle.com>, <dtrace@lists.linux.dev>
Subject: Re: [DTrace-devel] [PATCH] configure: accept standard installation
 directory options
References: <DS0PR10MB7522D6733324ACDB8A52D983C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
	<87eclz73fl.fsf@esperi.org.uk> <aaibSJGG6WDcAWHq@oracle.com>
Emacs: if it payed rent for disk space, you'd be rich.
Date: Wed, 04 Mar 2026 20:57:44 +0000
In-Reply-To: <aaibSJGG6WDcAWHq@oracle.com> (Kris Van Hees's message of "Wed, 4
	Mar 2026 15:51:20 -0500")
Message-ID: <87342f71o7.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0526.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::12) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH7PR10MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: aa14ca2c-c54a-468b-a291-08de7a30b1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	LPRdMoKf2n8MWVPRFaV4Y6KyCzVpYVDFSDYl7+zvMLS968rLwU3oy/1GxWkXu2KiOtHPVEluSS4afwuejn4Abwagukeip643R0/j87q9HvIpHU4j67YRt8KcWnGQi9KrZysRaRLtJz/u6OExaENW0ctFXMy1uUKUxIA/EkL9kkJVi85al7Me19zAi2Sakb+9344azfM8NjurWm7rCZj97Mf9xcaqP6HFwslP5UAdKqq0CxEb45ErQXQgdAnWkQ6KrGaSxpFV5ZWIHhC4AzF493J12FtAriGSpUTFG5Uia/wyFuE9+FJc3ibETwMgYhNVOQD6khM96te2nex4QNiGngMTbsFS2Lkb0LZRVXKf49E+wRQuvtnpcNrqjvDIyhL66OjqTi52jOfl9KbeMPwtfLQ2gsg+/SojuW9M6ZYjGcj/40LUtoVfCNwv41jXXSur8IyYo65VPQgHlNi6MZGxRdh6DLZvFfjPCvc8bq23v5SlSzCTi9+55LaYHZfDqCcQRtLSN5DfdrFL2Podr2lAYB+PerfqZu5kaSqOiMpgYqqV80lAIW81Ahuey+3QhNPL++jD/NtTMKPPAf3e3K3YTtuEM6lbo4YGEdRIvMZiZrYXYy5eLr/Bkkf9p5u9IThWU8xShHRzHRC7vvtmWLTD+rAuX7/utL8Ub+iR6pLHtIuQek1GLozqlI+vfxOzui0RxGOlAsQHgy96k7czh1q8jfbNxCZAGsWGU9RJSi4RrIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YNnQVBKuA3Vk1rCEQfdxui0c4ZEWJHb9sGxnQRhGip0dfG2o1Q8vk+wB61cy?=
 =?us-ascii?Q?L89esvf5c5eX6JdztNHXsO5rLCE1MN9M55mE4+JxZJFcwLPZDQdcoOtsFOMz?=
 =?us-ascii?Q?3Q2KlweRTfA/PRe8vXcb571tq9Qm3qXq26TWhubFept5m7RTOVtIBfJBoAOA?=
 =?us-ascii?Q?p/BSwWo88QIe+GZC2IHUEuuipFpmNJZi94r6emm2++7YHV23+itXFclSCpm1?=
 =?us-ascii?Q?oJKaOxFVeRtf3M+i4aYa4iEkEpQVofH01BO4NRQxwc6XH+cu2MxNBs6GLffb?=
 =?us-ascii?Q?I0PtJxV27+REzmliMC5Dcm9rW28WyDN4KdC049a5fUndZfiA2JnDnuhDtncF?=
 =?us-ascii?Q?0bi0KzczCLQK2pweTQEqFWCHiCs3GdEea/TA9Koy8O3d122rQ/K1dWykCGuR?=
 =?us-ascii?Q?guXhHV2MUXIVTQ1+4xSUeSP/FPHw8uTgpOAPxxaByW+2uTH6xdnxDT+z3Sd+?=
 =?us-ascii?Q?kQIPuqmZY1VuwYA5lMb0JMV4gRt2m2TrNV/3ai9stDUW1sw1ChP3oZWvTVjC?=
 =?us-ascii?Q?8bWCA7m0G0BNn+WFos1SyJchEdbb7x6rc1PqKTkm6lplS+YgyPZ8U6pu5hzP?=
 =?us-ascii?Q?v87Sh5hr7jJCx3DGcwdW7m5Wlnp1+qk5ZJlkdh3KhgFdB58eRp2+592t33df?=
 =?us-ascii?Q?NgVMq300OpaqvbCuyP/xIMh1E22Je5V8fwLCiJ3ZsbRo75DjoRHqVqbtkJTi?=
 =?us-ascii?Q?lCYKcNoJcMF0StGjTdOdaJD1rIl9Fgsi7NIgMAtBD6aKxrHf9M1blwU51j7N?=
 =?us-ascii?Q?8+rxvSlNE9/lrBpqIYGyjK9YRf4HuR4MBoISy1txZgGuJtVl2x1oP5EPhA7v?=
 =?us-ascii?Q?ksfkppanf05Qw4D9eFCxj6Ir9KO4Pe8tlRBzN4YwpJj/J5B2RmkO08gbzHkb?=
 =?us-ascii?Q?mzkr1KDGIxlZ3fLsHcux6bB+s4FrbroQyIt1VwwlmB8RFOuBIKLqNYEGXiwS?=
 =?us-ascii?Q?Zs6qvpdxKEw+Gb0Uk/J8odSyNrWZtw54XUwCT2SoU6V8l406sClcgKDuZcR6?=
 =?us-ascii?Q?vRx10RGEDkHx9TQ3BNXpkUIxr7nHIJUJjtHzq5fbgfHskfCmqByQXx3g+FUi?=
 =?us-ascii?Q?TCJRSUfPHDRZiooeuAvvS+MiX3qX1RkmgcdC3Dvk8FT4camNJsWMkruuI8JU?=
 =?us-ascii?Q?G0LL89RX1H56l5JzEoSINknt+3ZRxgS/21VC77Vv8CyyhGN4jQfmRaVrjNMJ?=
 =?us-ascii?Q?ywYiDcZOzNFURz83jWNqk0bfdVB0zFahgdqUOyKGaZ1cREHeJ6hInhi4j2Jj?=
 =?us-ascii?Q?IwR3ymrqc1wP3G3sESxwJt2itocSj8jXouoij8dR2evFiv/E3vLp27TWaZ4X?=
 =?us-ascii?Q?Xr3ORf/aPVY4hpxjqhsgsn3yA0ZHy2gs4p4Is01UOL/EnXn5eVm/1IkWDaLs?=
 =?us-ascii?Q?EWueztaq71RHam19xwyRnYTV+3F8w3omICWv9g9/xioLD1k51/zPBlBWahQi?=
 =?us-ascii?Q?v+Rla5VcnSDHDNBprVdHJiiCq2te62JqrHJ/KrK+KrH7LxafXdXK9U8mf8iM?=
 =?us-ascii?Q?Qzgf3VFt8muAZiP1nN3Lb3mW7PkeyrkfbNFErbI5eVrp4WDx5JFnF31pu+rp?=
 =?us-ascii?Q?ouWOVJNRwVjLiHvKe04EocwYKfeKRyLSrvOGJEAI6wqqfke7Yx9YQgwDxpnc?=
 =?us-ascii?Q?QJdR1nesKZaCFQbpAuYuuUV6/BvDOaSJniwBuvmec3xiK2Fc75o8PyS8X7xU?=
 =?us-ascii?Q?Gj48k9iR+8L7RVJRh8q8C7tM6Wr8TDcnGwmzurDciVX1MWJnw9S3H+r/8OH/?=
 =?us-ascii?Q?wQ/PFmkd7w=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	hGHxTFMHTzuWNARdlWKbidHefDnV+YQwKb6k/u13M5d+nHPudutFSqIYkbyAnlFer+6TIbjfCubAexoIaqxPtUTIiwIFLBuQQaxp71SPJa3xGWpJjkc81wD+965V+FdQ0yx6UZIjnvqh2+Mbxr5l9cr2wXsexcCzAonhap/RFS4hh7vsHOWYFwk6cjMA1FZ+8p/P56VjJC/cR72Ae55kqvla4pXSLERmKxq3Or6e1Eh+0g9BwCu/nLEUwxdsYOeGivpnBdwVoi8LC/8JbAE3YyAehqCLK7WEsC17CKpcTMwqh8bw2Vt6Pr6gBLzfpEtudrhxyLoKeuPrv1C5NHV2SA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3mMIjCQCtZ613GDGpn8n0A8HPrYUHoi7/5j0lUDRJ7QaU5ghyhJdsrQSxSzbvk9QPWHDWw1BXLMfg3MW05HPMXYN83ZIFa1F6CICQpQEHBpHQmfTMGC5wbKDyXYL/TC++0+a5km1k8iVwNd/NGYETsWZ7X7+UMXdCtPaLN2df8RINplQkx05CqestVYyNS0yFI+XCmSfIQK9D+i19MbNomACzThYPS9ux5JyyG9EQjpimj5glcK+1rgFnVZjFlQedCHEyb5T5uLqlykxDmgxNeiEhH8MdfFX0avW0qn/dGRHDXDbEfOfx8YAQCJhFujubu4H3VlTqOtRdb+oKEKZmQtoovhvJlY4BjWCdW0vUXxRapDRAj9uLTDBCnb+TzZQO7kqjS6nJkw2po4fDYX7/jGcraSRJ5rQcAM4sM6LPlVHhepKkLq0EfuIq0V3eRQJqoyqxDxlPoZh0wfR+cYYIuo/BO0cbdaR5XilESc1MxbeoFa5JEti+WlvR618C/f+qIl62V+Jij7JGyYwzQ2ZtTAry+DroxpdQIujquwR7xzcVG9UM9G/dxwZD5GhJM1sov9vpbDf0nUsGTGR6YHkp8b3MAQ/pGWDQ6KSOLdDd5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa14ca2c-c54a-468b-a291-08de7a30b1d2
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:57:49.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cvjy/nlexcSAD8QyxZxes2JVcMOQOx7FUi7IfXplVV9myQSgopTqfwD4tRgN78KQ15uDRJUtwVjkosnu+wP1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040171
X-Proofpoint-ORIG-GUID: oKPmiFBJSlmn1rjRzyOPnTb7VIVfdZT4
X-Authority-Analysis: v=2.4 cv=GptPO01C c=1 sm=1 tr=0 ts=69a89cd3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=5-hqDxBT1dU5-h9_jZQA:9 cc=ntf awl=host:13812
X-Proofpoint-GUID: oKPmiFBJSlmn1rjRzyOPnTb7VIVfdZT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE3MCBTYWx0ZWRfX7kcLVHVF3Fh6
 m7HDowfY+hTD0LqpZQWHEtwSmUqm6JZPjOHzVPj4JDkzKked44naY0sfxC/qIpVPG2c+SUyhFgf
 UMa86/Dbt+/I/5m6a4axXNZ/7PSqXwMppo4O/eUzpNBsNgv/ydat/CTu3mgLwqrEqhYbktnSu5c
 JYDbHmkUD1RdryqABQGL8JhmNDX613mDNgv6XGFMY9T/YHV1bTvZTPhxvtf9ZICcwtys7nANQ+4
 yDgsm2CKlv+n8dr9orEeCSYy4KBHnXOD/ugCHBYrKCYY8BvqrlFwCEnEYvoe126XbzJRel/6/R4
 /NDjRV99fx1E1Ab3ntnxyfkQDLXlAZIwGUmPVB6/lVyM9uEQJGCLpcfFmQYaGgI5qqdiMI/DG2Z
 NRB0oKtU1sxjwH62uW+76SvzGXhjg4oCOq00s9TzsOFp+1A3URssnC3pA9kFO29edIDcXorXk8S
 BYD+Mdxv2gioeCiPbzn8a7LrNrFnLO82tSFrjegY=

On 4 Mar 2026, Kris Van Hees verbalised:
> On Wed, Mar 04, 2026 at 08:19:42PM +0000, Nick Alcock wrote:
>> On 4 Mar 2026, Kris Van Hees via DTrace-devel verbalised:
>> > diff --git a/configure b/configure
>> > index cb2f585a..96a13137 100755
>> > --- a/configure
>> > +++ b/configure
>> > @@ -53,16 +53,30 @@ help()
>> >  Installation paths:
>> >  
>> >  --prefix=/usr					Prefix of all installed paths
>> > +--exec-prefix=PREFIX				Prefix of arch-dependent paths
>> >  --objdir=build					Build directory
>> >  --libdir=PREFIX/lib64				Library directory
>> >  --bindir=PREFIX/sbin				Binary directory
>> >  --sbindir=PREFIX/sbin				Alias for --bindir
>> > +--libexecdir=PREFIX/libexec			Program executables directory
>> > +--sysconfdir=PREFIX/etc				System configuration directory
>> > +--sharedstatedir=PREFIX/com			Arch-independent data directory
>> > +--localstatedir=PREFIX/var			Runtime system data directory
>> > +--runstatedir=PREFIX/var/run			Per-process data directory
>> >  --includedir=PREFIX/include			#include directory
>> > ---mandir=PREFIX/share/man			Manpage directory
>> > ---pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
>> > ---udevdir=PREFIX/lib/udev/rules.d		udev rules directory
>> > ---systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
>> 
>> Did you mean to entirely disappear this option? It would still have an
>> effect if it was kept.
>
> Is it actually used in any way?  From what I have been able to see, the unit
> directory is always SYSTEMDDIR/system, just like the presets always seem to
> go in SYMTEMDDIR/system-preset (for which we never had a specific option
> anyway), so it would seem that --systemd-dir is sufficient.

Well, you can set it, and it affects where the unit files are installed.
Whether this is an option worth providing is another matter -- I was
trying to ensure that every path we installed things in could be
customized, whether or not you could coerce (e.g.) systemd into actually
looking for things in those other places. (From a quick check, it looks
like systemd does not allow customization of these paths, so probably
prefix and DESTDIR support is sufficient and nobody would ever customize
--systemd-unit-dir directly except for per-user installation under $HOME
-- which nobody would ever do with DTrace because it has to run as
root.)

So, yeah, drop it :)

>> > ---docdir=PREFIX/share/doc/dtrace		Documentation directory
>> > +--oldincludedir=PREFIX/include			#include directory (non-gcc)
>> > +--udevdir=PREFIX/lib/udev/rules.d		Udev rules directory
>> > +--systemd-dir=PREFIX/lib/systemd		Systemd config directory
>> > +--datarootdir=PREFIX/share			Arch-independent data root
>> > +--datadir=DATAROOTDIR				Arch-independent data directory
>> > +--pkg-config-dir=DATADIR/pkgconfig		Pkg-config directory
>> > +--infodir=DATARIR/info				Info documentation directory
>> > +--localedir=DATADIR/locale			locale specific data directory
>> > +--mandir=DATADIR/man				Manpage documentation directory
>> > +--docdir=DATADIR/doc/dtrace			Documentation root directory
>> > +--htmldir=DOCDIR				Html documentation directory
>> > +--pdfdir=DOCDIR					PDF documentation directory
>> > +--psdir=DOCDIR					PS documentation directory
>> >  --testdir=LIBDIR/dtrace/testsuite		Testsuite install directory
>> 
>> Nice!
>> 
>> ... really the number of these is quite overwhelming now. I think we
>> need a little more structure. It might be worth indicating in the help
>> output which options have no effect, though, since some of them do have
>> an effect indirectly, like --datarootdir, but some have no effect at
>> all, like --oldincludedir. I'm honestly shocked --oldincludedir still
>> exists -- I've never seen anything at all that uses it. Maybe GCC
>> pre-2.7.x?
>> 
>> Maybe these should be moved to separate --help sections, maybe titled
>> 'Installation paths affecting other paths' and 'Unused paths accepted
>> for compatibility only'?
>
> The help already shows the way the different settings affect one another, so I
> don't see what extra thing we can do here.  Moving them to a separete section
> seems odd because that means they get separated from one another.

True.

> Also, while we could spell out unused paths that are accepted for
> compatibility, none of the packages I looked at for reference seem to do that.
> According to the coding standard it is also perfectly fine to ignore them
> (i.e. silently accept them).
>
> But if you feel strongly about this, we can definitely move them to their own
> section.

I just think the sheer number of them is getting a bit much. Moving the
compat ones out of the way at least means that it's easier to grasp the
ones that have an effect.

> In summary:
>
>  - I think that using --systemd-dir and deprecating --systemd-unit-dir is a
>    valid change, especially since we hve the inconsistency of having had that
>    specific option for the unit file directory but not for the presets.

Agreed. (Mea culpa.)

>  - I don't think it makes sense to separate out the options for paths that have
>    effects on other paths, since grouping them all together as they are in this
>    patch actually documents how they relate to one another.

Agreed.

>  - I will move the unsused options to their own sub-section in the help to show
>    they exist for compatibility only.  If we ever end up using them, we can
>    move them.

Agreed.

> DOes that sound ok?

Absolutely. We are in violent agreement :)

-- 
NULL && (void)
