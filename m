Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7DE32C8E
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731298253; cv=fail; b=rFC5tO7mLsAFbHNrVVPNtfpLgkGiAOaioUE9sBYRebdWCtjRDZXm0xHdR7Yq+wU8tJPauq7xwj17FyXvtfqFFpdcOwScfUGE+xumhXu6P5RcTozIRF/L7LM4g8T7o5SS5hlpeaxMDnXn0M650CEeiAt1SESYE+IZNSF2lANPyPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731298253; c=relaxed/simple;
	bh=jnTqeUdtI0z6RTQJY+oaIstIzkRhn86Y4lbdCpf4z54=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=IKTWdkwKYNuw3DUDWdzVhxBgBV4Sl85uw/LFzpxPbbenyTDkZ+ss6R/p2oXTe/ZS5LkUD55W5M+lZ3TnTjHgUeiKfb5JZ0wdL6rnAAv+SZBX4hbjEV/S7DY1BTLWCqJGg2QwtJzwO/k/H6DNZq8MucupVxD4BzxbqieRKVnD48c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gyd1sHQb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HtyylerJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gyd1sHQb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HtyylerJ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AALVuOp030932
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=bE5wFnqcEbHb4A2+lRaCzq0sYmUnUtCnovoC1AyzhOc=; b=
	gyd1sHQbudyACrvUulImhaBWy1WPeZ0YoTz1YeC+6E0085XPXTJW4AlmFlbvWrmG
	h7ITHkm3ZAa7M08+bFGBQdSTpy5+FSHtHxoiafmAUS43GgDGlNNvL4NOLNfqyAwU
	m6lrcSltgROdPi/aMsE2pdmhFRG1rFKXHV4Al6JoSgR4FyrjypFu6XdyyfW4G4Es
	WdZqmArTQJEdq7oFNavilqRKvfFXS/yhw4T6y5v/cF2vKrFFOzQrodGTQhjezpC9
	8TgG5xXUc7+CWrB7GD4lgcpwC8qOC1AIe3lFpmiku81NHdecTkCsEb2NaaoXkWl0
	V7/mP2ls4B2xxaGFvvyrJg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0n4sn2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB0USOV022488
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66b420-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icCUZFQLD4UpO6mJL+BFqo7C/+ZM8Gsjjyk9DU7Erqc4nPxR6mGAbilJHS7urvLz4JbsqHQIA5HYEcJpeSLZe+C35Ldml1vZo+J6PPSdgpdbeRsfosVs1KYtarrVMYyrI7quV5/APawLdNrUJUnltWyC3n3wmsCgLKVGjv9GgneAAXyhjhyfFNHfXjfjTOfe6i3mNBe7Nn2oU5En6iqJHzEgf2NeR6GhSosino5qJM9EwfWWxNoK+wH/+VHnVww7hWrUmr2h/JMW9jm8wAIH2RQiF/YZgZzo3QwfwJu+7RUF0r3nwgEZcMh19FquI9MSQUpEImyXZOAayMT6qM0grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bE5wFnqcEbHb4A2+lRaCzq0sYmUnUtCnovoC1AyzhOc=;
 b=kFfum3v9lsATqr5ycbbZfkc0DVMrf0E8hG9MfzKnS4dJgdI9dNnmzFeGVgwb3NM5fMcJ2ucxiFmodMBi/UPIRkSIC8ygiqN9+lPhT681z0llOQYE4lNfedti2TwbS0pAM4u9pLqtW9O7d+S0rWKqDO5iVGtdpknGhJA1QyrLmYnVwEqbItyTPT358e/l/7Kavf/hrfW2l97wTgcw8CeHaDtADz0KNaB/MxQcRtfplb8pPpQ075p7vrv27EKc1o2eOvPqu7XvU8l77KPteQ+B0dZ7A7upI0JGkw7OvSR3KWjgDil7NfhQLDqnmkH/HP+bSYtJA6d89nXCf3NTkVktnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bE5wFnqcEbHb4A2+lRaCzq0sYmUnUtCnovoC1AyzhOc=;
 b=HtyylerJjebWTXZ6VZN84uI8S+Tp5h/c14JM7sKaVgIJccHESczFgytiXS1E3ZCxTTrOEg3CHAKtbEi1W8gkFDMhuQALsX5ac6A8BEIvmbWOQO6av4RT6miE8lO0fDPjP7WSW4J4tiXl2vEo27b4Zbk+9SbZ+/gm7WR/Iuq2L9w=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6029.namprd10.prod.outlook.com (2603:10b6:8:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 04:10:47 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 04:10:47 +0000
Date: Sun, 10 Nov 2024 23:10:46 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] dtprobed: fix install of dtprobed.service
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0431.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::16) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Message-ID:
 <CO1PR10MB4769FA3D0ACFD6EFAE35F37EC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: ff28ae58-22f5-4983-cc96-08dd0206d24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E630430oq1+9kopodDfRngeikCMCYNELxc9TM9V18csyamX0W+YeFankIWwq?=
 =?us-ascii?Q?hIITi1oa+bgj/9EFv2IIYmE7nEaHohwuS6mOIhgIsufPA8Y7hb2VPaJ5w9PK?=
 =?us-ascii?Q?zg2r0Ts0DASu+gaRIc0l1p7uhXydl7vqTkazNkPwBgo4isoa/9tj3wB/nsvI?=
 =?us-ascii?Q?uER2uVvrLHta7C2O/r/K1eo/CoQU3TiM2toQVLKv/TW8Pe270Ghm0cyYP3vY?=
 =?us-ascii?Q?zg0DVs624Y06lFdp1qPbmxrc4qBq8fD/leGgvGrfrYtpAWzzcJasdUliipns?=
 =?us-ascii?Q?08l+9iSWiesfVNm0/cU17u84S2BVAETzaOhxXyqTRKOxSknDbhJb+I0nYpxq?=
 =?us-ascii?Q?AIuu4guB0WXfFzo3F2PR3tLPzQixJs4rWg27c6q5M2p+cWqEGDC8QnfHhe1Q?=
 =?us-ascii?Q?B38jHBupv/uXcfhXsOaEQP162i2Ls6Q3N5776d5TZhB6OsBKxJXDkTj238nl?=
 =?us-ascii?Q?hQMxozxOWMnrkFWKg9tP4ajsEjl7DFU/1jJDMWmK8baZRtmNMhUOLEodIEr8?=
 =?us-ascii?Q?tEizbvngnqXoSbiflEQ+vJGqILKHvf1S1gT4ai5Hob8vgnEJ2dCyrKX9fuDz?=
 =?us-ascii?Q?aF/3C8ilRnBZyWTwMijezSGUEQbAj0eiBV49aoDpr1QYIv5sBKWXyNbHo4hp?=
 =?us-ascii?Q?PYUkv80xjUKHqvKGamY+JoIBDz4DRyLnpv4AUab0C1ihrR+gMPSb8GCY5Tjs?=
 =?us-ascii?Q?Q1x2F18zt3dKq/gA1oVw14VRHJOGkt79GpsMJ+ovto+HyaERwgTxvdfrgqzV?=
 =?us-ascii?Q?dCMyMXac/4OVAVN/J5GROFA91oodaYp99HC58qz1mt1/+93iF1XTjmjCBYr7?=
 =?us-ascii?Q?czEA/9JbD1fLlj3LQjNHinrMnrO6e7J/wdXGv23rm88xql+e76MMUmD5iNce?=
 =?us-ascii?Q?W5KDZnqR7uQCAH4XXZStawigT2O8tt3V8XuFBLJBvUuxgdHp9jNmhIWrCghr?=
 =?us-ascii?Q?GWLapgEY+BiKuGSKTMTxO8Kf9KfVWt1qwTq2V3zuB6QooWpyq3RFrgGMgcq4?=
 =?us-ascii?Q?HSQJoTsK8vT2YUeBMQHXoywZ9kJHYp55nur6GozXtEvISZkRceA2BmtfH2iO?=
 =?us-ascii?Q?YnU9h1poR6JptbdFE49BJye11IuOW9jA8kvzQOJN1ggYGF/nXA5F6ThOL30W?=
 =?us-ascii?Q?P72T/TtQJ/UyGH0PkgbuALh+QTpstUfK4oOJ/ghArT+465kZgZkDlKJ5r6mQ?=
 =?us-ascii?Q?PWnbLdutdrw3kYHbz7ZoZfe1jbE8cQ5OL2Io8NC4rsTHJ3tMRjDDQLzqsiv0?=
 =?us-ascii?Q?JYtYDi4X5hGrLpgEtri7sekWkgMtsXIkpSxfY1ENjZWncBf4vxTlH8DHO+oK?=
 =?us-ascii?Q?4Ife3cqbRTgOpmQYakrfVdXo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rrZry5ld2J96JGngIpCzeFloieaTL8Tfc0S4VpalJuXe7l+YPoDKX/Stbgsv?=
 =?us-ascii?Q?JGsbzz0JozulW5qKCtUw93WeTvNBjbyVZsoStpqIUlFmtvNG9xgvGH/Rjl9r?=
 =?us-ascii?Q?Fhe8mzdhRj1kQdWvRQAdCv1sfh6nAToQvCeq5EpIpV/Jd6amOJOILPebrjeE?=
 =?us-ascii?Q?hT9S/xos3AQEFUV7icIy4Eo69PjkObGGhKUwv6U4dGKnrmg+eRm7G/CaScCN?=
 =?us-ascii?Q?dhMEqKd/Re4a19SiDJNaeEhe2IwfxkXAI2HkGLBuYyMPCTHT5jEELgipDcIj?=
 =?us-ascii?Q?PZ1J3FzYeIQa8OLLObYlLQ3ynFSOSVAOT0Sd0sOjKtcV1sYNCswVt0Nv93HH?=
 =?us-ascii?Q?mt54RV8KEkKE45LSZ0NhBl93h2uZTnSl26x7EueuxHUydkDdVBdM/MBKjldt?=
 =?us-ascii?Q?aNeZRJ0+Aae8PPSh+95hDKPZnNLiX+XttvdZuKtZ1mk5B+90tNoNsbFDMKfb?=
 =?us-ascii?Q?VdrjRYMFNzZDrfORZsQh4HxjeobsINRVqR+dQv5pvE+Lt6jcoYS+FVuH7UXn?=
 =?us-ascii?Q?qVvf4Noch3xFGEWmMzFw3mYxDaksFCkG2cXgB7ESM7zSo/nt3vjYq9W3aCXu?=
 =?us-ascii?Q?MfgIUH157F2rigNAmPt5GxKdDAbvuiTHUZhpF6t6nI6DzCuDmUpibolsCjBj?=
 =?us-ascii?Q?12+1MqAiX3M9AOldRJFeC5ryYrWkmekaxx+ZI3+SSAffe7Pwv0S7iWt/roNJ?=
 =?us-ascii?Q?jj9me/CSFiDvT5j6UgExVeoZ0dMZy+XLgp3BbDDeDUcjm57SNRruSG9RoCaN?=
 =?us-ascii?Q?jxZgLo4P9mgoT3GxUd2zGb70F47p5RDJyfbMAsmdrTY3W3fT1COfhTlmLC7s?=
 =?us-ascii?Q?KXem9D6Y5PKNwB3eelFJCJgZfPABgcpaBjLy39++kboyPze9jSDSniTX535S?=
 =?us-ascii?Q?QJhtTnGizbP9D/FQqmedcQv30hjK3bTMJGn4hFl5KeWJcX1Lqx3dSdi7NR/T?=
 =?us-ascii?Q?M48S7pTKTZWTAuGuY/INTTeNUrgoRQCEbPqTd/kPw9k9zr17XILGtgELal7a?=
 =?us-ascii?Q?18vx4y3TCr9bTAFY7p2ER1LwXDl6x3ehdwHkxO2RwhA+a0Sp2FuMG81K6jml?=
 =?us-ascii?Q?6sZiPTcXlaJO/XWLXa+8e8WcHv3IXOrT60BzLg2kh/EjGCuqQ0DP9Ko/woHg?=
 =?us-ascii?Q?IC09VuwR/3TlIKAy9gTtDLKneQeLWSlZsMBuP38AN/qyrsYvuXRBKdDexzsB?=
 =?us-ascii?Q?vY30bqZhWdjLVbo1YHiIH9Bst2yHmtLsGb2Rc9S6vgIape5CoDH4VMLMCM3S?=
 =?us-ascii?Q?kadX6hTlgMlj/aAVcPkR/jiW31EdtoH6HHDCJNdzqIwqyVl6hRKvvLcaaSPq?=
 =?us-ascii?Q?Y5Svgtd73yKCjH9+nn0VxHjldKXo+mdDh/wVltDFbxyVbX5/PD29DWMYkZKm?=
 =?us-ascii?Q?L6PhQX8FAuki3afLkXXaXCfSxTPTPdIQM+DHibHvZtR7d8D8Re8UU5xVpC5b?=
 =?us-ascii?Q?16xtK9LIBnjP4GokQyJEajEAbJuSbfPcC1biuPueoqAF72/+JLdqGdS1N1NC?=
 =?us-ascii?Q?NRMwZymSEBc23ypMCK+XAoIKn4/uVw8tBd/gDdTsox861TA3ugFbnVUMN5yc?=
 =?us-ascii?Q?YR/0qusux1Yw7SZykqV6dvMTZb5TK1uuk8DK9A+r9KIazUZHSUB4dcW9Ww9E?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AW8JRws8pBBx+OGf9YmQkwC5DqCSZTVKzcgTvJp1q15Wo77dAsJuN4I9iyRKzao4xoRrmxgsZVap8z+TE6EvkkaWWdOSeOlTuzO5ubm7lbaDRswjqZWEvjgAzehul+kr1Czi62k8Gm+4lcWR7OWxKTHK/q0EQh1n4NB2tdc/7aticWCMK4+TLJLDPz9o2gNlFIyUsnubmzz38WlkbFP7zxnbBP4mxKHd1IsKAnR9tDOxVAvsTpXsQ5dDyDkcCSlRURemlASQa2Fz7/VsSW01qvAJK2GytF+IWyD7pcP2dCFVANodR8Y6s5KiSUII5GqHKMK/n0OmDql75O6XJYVh2GcgWlQ+E3LLOwHVS9PqC1WM0N34GwKTAUdArv7IxKP30pMr6pxeulfsGCD/JN2bJapVYsZ8aaqv9zXFReUaKnfXk3qkTt6uriKVXG8aXPs+ehP90/Qb/sw1TVuz3aEJU8Gtvc/Sdd2mnu0MPael91TiXgPjUnP32pHMQXZHQUUeZosR2OnVJ0j0EcxYKZTdBvVxMoC8P54vXAvsebpk9Ol++ZgY8bwRtDYcjWldst4xYyCvPMLgDjQavFespZvVlucA0QO1JbeGlqYm8uVgi6Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff28ae58-22f5-4983-cc96-08dd0206d24b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 04:10:47.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/7n427nJTi8P7BHAV2xy1qquMMmrbYyas+jdzFwVLKw3R1nMRTVULdgwX+XTIVqQ9XkmcNu8Syw/lbqxMBDbysd5TZea3LIozoT2ZdckHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_03,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110033
X-Proofpoint-ORIG-GUID: 3UtlrhtWqjeM6KUpl0KU-4cBp1ZZO-nA
X-Proofpoint-GUID: 3UtlrhtWqjeM6KUpl0KU-4cBp1ZZO-nA

Commit 4d4ba4997 "build: make dtrace and dtprobed relocatable" added
makefile instructions to install dtprobed.service that could fail due
to permission problems.  Instead of using sed to write to the install
location, and then applying chown/chmod, use the install command.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/Build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/dtprobed/Build b/dtprobed/Build
index c43b6277..8619a5b5 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -41,9 +41,8 @@ install-dtprobed-autostart::
 ifneq ($(WITH_SYSTEMD),)
 	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
-	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
-        chown root:root $(INSTSYSTEMDUNITDIR)/dtprobed.service
-	chmod 0644 $(INSTSYSTEMDUNITDIR)/dtprobed.service
+	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(objdir)/dtprobed.service
+	install -m 644 $(objdir)/dtprobed.service $(INSTSYSTEMDUNITDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtrace-usdt.target)
 	install -m 644 $(dtprobed_DIR)dtrace-usdt.target $(INSTSYSTEMDUNITDIR)
 	$(call describe-install-target,$(INSTSYSTEMDPRESETDIR),50-dtprobed.preset)
-- 
2.42.0

