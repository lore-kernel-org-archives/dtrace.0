Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6541B86F7
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730474580; cv=fail; b=kr2JBkB78xXwFmYcReAUHqTjSkY0MJlScDtiYOvskMDQCe486/Q1GYc3a9ZumzoeAq8XQFQ0JXVFqSdilskiz3IFMzHwVxpVjovF3wG7Az8j0IipJ7q9O0HkV1h62dU1BVGTkkoO7eHOQz7zqvxXYvugpCM9oojbcalabrYWI1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730474580; c=relaxed/simple;
	bh=Pir7hY8ibfOAboCUg4BYkU1NfM7kIjwDiFg/Uexjxrc=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=A5A2qRGJlNavgG7XLSwbwlcPL93kxmHUckanmCZ1Ti+wMrl3suRtP1diDiXpiP1A0QN+4KGLRmaiHlxikajZbJk66IJibzBdxPQ7g9HcQjAi/fI6gf/naSH9U+YqtRu86+VttRXH940mChP8t4BRhm41GNqxFxwXhAgFxhZpoS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UonzHXjC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=brQ7nFlA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UonzHXjC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="brQ7nFlA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EtxgY012858
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=8BLM0/uNKanG7kjr8KkJL8zZ9AdQhxIJfrqZexetCLo=; b=
	UonzHXjC5Wk22cl54fY7ydh9HYUkZbj7EF481djVJN2mqMmgP0r71zP79iDBkgSX
	KAMqf2jQbGZu+AMSZm6qqNoEoJ3Fxb8dZNMqf4L2cmORp8ICDB6VMkd9isGjYxzh
	nInDW8wOeHNuFGvCRcNx+itwWNhT/9i9Hyrad/BmrBsg4cf4FObEve9yVzzszz9x
	YEbB4+D9DAE/M4y+UtWpt9gYK3nbiBbLurpb+kw2RnTefOo7T0fefFBvPSt1vkbv
	Q0nyKawLzELuMYrUYnQsPobD/0qSrzVfY/MjbtY8DFRu11782iwpKPfBMgQdxX2M
	+Jq1r5FsCfu4DGLSdNKyYQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc94g58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:22:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1FEnjI040216
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:22:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnat1xrk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H66bZlOBS5hLUy1AYgW/UV4vnzj7ZaelMotFb7fkn2Pn2zPYQiwxVEK7DTc3tndWzPboZw6ZsgJCusMO8POpoFhmnmgO9iUmefDJCHJYwgbZlG/TZaJ4FG5aZGYxLUgjoGOnJMI+0RmZnn5VctAgZEqm8gqSDamOwgPUQUNrFdF9Sl0dAUd+oDtr8zrIif5dHdQFflBlW28kB7fl/MUCnOB9LxKWhEFevX1YdCy5g++8FVYzk3LgKZlkP941PoNbx1TNmPGk42SeBW+JUeHmKFNhYHaWNDspDhJOLeQhGzyTVV/9Qote8kPc4TlY+vsZAdC9+nX5887mjnAyU2yAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BLM0/uNKanG7kjr8KkJL8zZ9AdQhxIJfrqZexetCLo=;
 b=va7N1Vwc6RlphCPyWaYB0foJE9gLiG00K1unq0vvMy0IM3vME5Xr/KWtuB51Y+RCcfOWNybmuhF00LS4cyjXnNJfBgL4xIU5eqAmSvb91+n5wIL4pizEp7IJsqA8XedVqj2evIjuc45gwpHzpcRK6Uul8qC4P4ZTrbfM0lI5qnuf0Aju51WQlaEzaJk8cioNAenAru7H6R53Zg/ZDIKbw3+EzJf3qw/3tL48HzvEMc1WDasSU8/FqvnQ87n9k+Il6pVpUwKUAM/7CikFHSAQUm6gfm3a4zHjE8+8q/9tFlAA3+rP7oyNQ2+qYkzBSoDF+KCKTezikhTejcMJC2mKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BLM0/uNKanG7kjr8KkJL8zZ9AdQhxIJfrqZexetCLo=;
 b=brQ7nFlAfjcchhOWB+NurOCruzFDtPZjronX6MVD9dRtbshf1yNaFk1mf+Sx4MhLX02ttcM5KJuAyFYwxC23SZ4VGfcOfWCUQwe8+SpLyHYTWGVYYxsPjI/GZhTDoMID5zEBGb1jqJf3vpEU6AMjDN4AF3xT6Up0czUFxg467+s=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6775.namprd10.prod.outlook.com (2603:10b6:8:13f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 15:22:47 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 15:22:46 +0000
Date: Fri, 1 Nov 2024 11:22:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] utils: add args output to showUSDT.c
Message-ID: <ZyTyQuIOTB_zRDtC@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BN9PR03CA0693.namprd03.prod.outlook.com
 (2603:10b6:408:ef::8) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e881e1-d44f-4f9d-f865-08dcfa890a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yfwHvQ2zT0N/Rv3TtL0rbs/RdZzTEGj7MnxossJOqhsvwb4ugqhqkC/D08mb?=
 =?us-ascii?Q?sTuDdhYHrtitW6HR+K/N0n7mXdO3kmi8+ycZjU5QEWj4twjo9zCAy8D8KDo2?=
 =?us-ascii?Q?91FaBYjLH7JFcYHanRVmdchRI6Im5OLwjCdwee0/yHx5pjvRjLaH4nlQcntY?=
 =?us-ascii?Q?8rX7rWxuWK6lolCRX3Rt1SKsBveIUfegYm635FXclitxWpZKJO2zL99YB3Sa?=
 =?us-ascii?Q?sr6b16SzHhg5dgxHY/75uJbMjKLYnslftfCrjZ7HDjX773dTIEZ+M2x8/nGE?=
 =?us-ascii?Q?ufBfZ3k3mv0gUTHfWq0btWw1RuBd3Z3d5DDA0MuS74VV2KeciVUZzY5byhT8?=
 =?us-ascii?Q?sVqn+kN27toLNaGJvKui7jumWp0zEOw4hzCJ2j3B8rTOlqRklZ/6JRLQ0/J/?=
 =?us-ascii?Q?1glzw2xtZ2CkXl2GVEitMbztzTvF7493fArmevBMDAxaLSH4MDsT4NsnfQHx?=
 =?us-ascii?Q?QYbNxjZzVFiS15+jzapeVIdIjQ4fb+RJuuWPI6SzRXgWVacR9/deh5IlvVbu?=
 =?us-ascii?Q?+of9CoDro7sXj9OOmN9sdlAH+mUp5ByYeJHC2dirjMPMAiR5xCGG2VgX0091?=
 =?us-ascii?Q?p//W+HpyzVERwCx2LpMu8Q+HPQhV07WAqa7EgGyUzWGWCLDrzPPVhr0fipMe?=
 =?us-ascii?Q?NcT0W24zhV457ieUtwWQMRAdnHYXdM/yNDFVbqmfzvfGSsOfhhZv4ydlEW0c?=
 =?us-ascii?Q?xx2t4GPqb3UVwEw71RJIGiDfTrz8vGy0S/s7bqh2Dl+2hF+tvUrT3t47R3aF?=
 =?us-ascii?Q?cWKGRKbWpLLEZFgZ2zk4r+k4yp7aYeYZaM1SWGUlaSSJIRlb0JkYC2a716bX?=
 =?us-ascii?Q?7c/34nAyeWCJAla/f0B2H4k1jbDqSh1gaY2EalGN8UQ4J85aYJ/g7+MwjkEh?=
 =?us-ascii?Q?Bszj4OKQaJGbjh77jQqSBTiOSvYJsfDZHY4A5xI9X82L0IyVWRqQYqUKeTQq?=
 =?us-ascii?Q?HeLo3AEYBNPpaYjZOyQhZiRSgccFUDrtWKEEFRZ7+zYVX6tz2tOv4RbVz4/Z?=
 =?us-ascii?Q?QrzyxIKkYN0AAd6JDxpEUKxWBD56P8KL3e2XpdW3XUnk8m2QYeIAbQyJfrNw?=
 =?us-ascii?Q?tniOC9TFB7jH5HCgIUPWtd4iNFUswf3rxY99TXosyIsbyzgWNBkmEUdrUFwm?=
 =?us-ascii?Q?KPU5jvv2cDuuorDwCKEkGZA1omT/Qd1oMyTLGnCKwlrPu/zK4lCUJmv9Ziqo?=
 =?us-ascii?Q?V2tL5CC+vjwWDK00l84qREens+LjpHv0PiHdRQqYsRnxYLODPCzSJqaI2zpS?=
 =?us-ascii?Q?4Kw3oZHzPzLGVJ/IyFEc+iKM8tK/w/f2E5cRGpi64H4COuxEvdVlq1mQ8gsP?=
 =?us-ascii?Q?EKupWBEZdGInHIVO8JrRrzTl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MZ8P9zMDE3mZRSzCNbfEB5wVRLuEMIrSjBooRJ2Vi/xBnLtcd/DxSonCEtN?=
 =?us-ascii?Q?0pNxQEqBpRU63z5WUjjSWEuaeYhblkNt9xsYvtL+SVOS4ERmqNLsd695hKls?=
 =?us-ascii?Q?ERowzXLKV2X8gshFmMYwIhjPTLjIs38GlSaagRyDK8e+eXEr9P0m/Jdw/wd0?=
 =?us-ascii?Q?jzFccJDhn0a31YSsQ5H7I9lmdlqJRATdkR2Xu9wIlKQGIM0Szs+qkgz/U5Zt?=
 =?us-ascii?Q?b97h1fwFZsEn1NCVjIpZVRNMO+p2WQYFNphantRAhcWEhkRNy+lDcrZoNpjG?=
 =?us-ascii?Q?f5H0z/0aaENvPuVwGUmbGBUKTxcezVp7euCcmmO4wx/oPEykYnoNp7H37ttQ?=
 =?us-ascii?Q?ULpfX6WBnuTH9MlL23qX9CDHVymnS/In9CZPOHOfl3vHqrLKaH7PfQkOcifp?=
 =?us-ascii?Q?PyewKgmJ7mq8penPgAWe2T/5AkQVHGjTqP4un8VuMULdLFM+VEZj0hd02ndL?=
 =?us-ascii?Q?4LtN/mKKo1cK7pXcoAh7s0EnHFdVF4CyocVs6FOveLNEDihdldxrDQdclJD8?=
 =?us-ascii?Q?+KpDxYPLctgg74OgEMV/liYXGb1RycxRYohnfvgYxLOmXh735kWDYfuo4aEX?=
 =?us-ascii?Q?QnRyN2exmMvtVXAcPxDKotq47YpkDvOaD5IlFUX1lh/f8Ky73CTFr7zkKkMy?=
 =?us-ascii?Q?6oVs0eBdlMKHlUXLnVh+/0D0jaMXCcsqSz9OJDZTHHRlZ8C9qxvMP17/CYsw?=
 =?us-ascii?Q?b+0ZxmpIiE64z+jd70Qgu5R3VbRdk8hn8nbLqViHiwIKgV9UK7iPawZveB9d?=
 =?us-ascii?Q?7MmFvNoCxvlvvw+/J8bQfwFizRhonpbuwI7cO2pzE9HdPnYQpbpcdZE+MRJo?=
 =?us-ascii?Q?XcO6bz2ZLZcIxvV2Xm1v8elYbC+2teGK59joQld105W5Agu8783QAA+toyye?=
 =?us-ascii?Q?VEBY6n9txJspDbQrbBVFty40pkVDbh1xfyJP7H/qI1H/PmCvVmMEbmsWAPf1?=
 =?us-ascii?Q?+JqrEeZNgJ6N3GP6d3PKWQxFIoGeZzlKhvZaVvWIt5Pr6mqWzYOsdj5rJJ9M?=
 =?us-ascii?Q?99VBkWvsRsC8yw5jHffniS9hkg/ZoDCjzSuXg7AUN99hJw7mQq3fYHbO56I2?=
 =?us-ascii?Q?4qzvU7htbXum373Qztk83HNDUOixwZ+lMH5UCJW7RwuPKhMyaGYgU6nf/9R+?=
 =?us-ascii?Q?WEp8nsiOSRo+jKqTjLaRPM4qZym8jW2nCJolAnFPUzhb6irpGQiDNcsHp1CI?=
 =?us-ascii?Q?4WKtJ2VA5J7rUhz6LzPjvxHEyjhcS98MC1MreQ0cedvWtV2bB1qBIht0Ch1p?=
 =?us-ascii?Q?r5Jsf1u1ev+u19jfHIoNQoJCAulW62wkrScWPzRzHPrhaqAFgRukM1dnPCJo?=
 =?us-ascii?Q?EokvJ6RKlH8rlohYRvbxG9WThK01GqWc6qeL6X01yBmzE6FE+nUG/ewYLhYQ?=
 =?us-ascii?Q?S7elJHmjBXs54tisuWEbj3U83jfJyV52frmOwUuN5doW86OhQxuLB6uFQViS?=
 =?us-ascii?Q?sntnRkE/6eC58PL4BFNdUBV6GPW/O9L+dzeK1qyFMFFL7TM7xK04d5inf90t?=
 =?us-ascii?Q?J4MfwLLmWMMY51jPvVxnaL74Q3E/CpMiVQzpa9QRA1lwxfnTuOJfclhwPamy?=
 =?us-ascii?Q?PA6zuAxXAaE6ZY5Nr0g56agttnRW2PEI+o/NMSCtneJxX0qCMm25Q6K6x+Ig?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6LogW3wmVm9G+ZZfB1a47pXrQD6+jQg7bgXXf+bu0dZn/B07YpH6BoiP3ckhR6okBZjL1c1Ah3JjHo5oqjsadoIER/4RXZVeg7KlsQJpEWoV9CZ1bQg6t4bwZxWc7TxZDOetDpfUdaESobDRExHNfhOUtClQwr3mukfiIyAbcCjf9gL9usoLS2abY5x1EAPbUZEKiQ/fEMzmCFMYvunZjmOzw8KwLru2adIaauOfsJ3M7t+GXf3Ls51sHdvfq61EYdkYTUR4VVKl3zPMDxTxDnfJiizsi+dxsVLdevRREhWCGAZfmLrCuqUoJTzA/hz3DxToQbjXzzt88AhRSqK/5F3cCdeFjBdzDZaDJ42Dcwm+P7HKuJ/R+0oUV/CIObj8oai7DBdmEu6XvJAWs3tjT8fvhrxYxUxgaXcDJPj6RN0q+MTc9QzdMy3QtBiJwBLMc6ZqAcStGLSa1Ua8rIdBf5VmFdgPxmBavfQCpuVXv69A5UiVTZeTWH0VtTC23aEm+T5gYn8tcdyveE0Poz9Sa3MmtqSy34Y3PJzSslelIK+hJ7lRcoQfC4vLwVcBfvK1GmEMijCSuhb2p99IqYiUZ3d1HIxKI/PKXVHXzv7nsOo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e881e1-d44f-4f9d-f865-08dcfa890a25
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:22:46.8804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdUkCEafLSMErpy3/YOYaMx+sILhl9gn9xn9KI3s+ZrHrtjrZplIwmgcwDco6JOolRzCgcdlU713vFCLntSuQFNaVO5pMFWczh/71xFbOw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6775
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010111
X-Proofpoint-GUID: M_1KcCUqA-bzyZzx_eHAs_dkgXI4_TT8
X-Proofpoint-ORIG-GUID: M_1KcCUqA-bzyZzx_eHAs_dkgXI4_TT8

The showUSDT utility now reports argument type (native and translated)
and mapping data for probes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/utils/showUSDT.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/test/utils/showUSDT.c b/test/utils/showUSDT.c
index f42aaa21..a1116bbf 100644
--- a/test/utils/showUSDT.c
+++ b/test/utils/showUSDT.c
@@ -104,15 +104,32 @@ static void processECB(dof_hdr_t *dof, int size) {
 
 static void processProbe(int id, dof_probe_t *probe, const char *name,
 			 const char *strtab, unsigned int *offtab,
-			 unsigned int *enotab, unsigned char *argtab) {
+			 unsigned int *enotab, const unsigned char *argtab) {
     int			i;
+    const char		*str;
     unsigned int	*offs;
+    const unsigned char	*map;
 
     printf("      Probe %d: %s:%s:%s:%s\n",
 	   id, name, "",
 	   strtab + probe->dofpr_func, strtab + probe->dofpr_name);
     printf("        argc %d noffs %d nenoffs %d\n",
-	   probe->dofpr_nargc, probe->dofpr_noffs, probe->dofpr_nenoffs);
+	   probe->dofpr_xargc, probe->dofpr_noffs, probe->dofpr_nenoffs);
+
+    str = strtab + probe->dofpr_nargv;
+    for (i = 0; i < probe->dofpr_nargc; i++) {
+	printf("          (native) argv[%d]: %s\n",
+	       i, str);
+	str += strlen(str) + 1;
+    }
+
+    str = strtab + probe->dofpr_xargv;
+    map = argtab + probe->dofpr_argidx;
+    for (i = 0; i < probe->dofpr_xargc; i++) {
+	printf("          (translated) argv[%d] (from native argv[%hhd]): %s\n",
+	       i, map[i], str);
+	str += strlen(str) + 1;
+    }
 
     offs = &offtab[probe->dofpr_offidx];
     for (i = 0; i < probe->dofpr_noffs; i++)
-- 
2.45.2

