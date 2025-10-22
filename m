Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720FC268C42
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103407; cv=fail; b=Vbxl53YVT704+udnrE0zyWEg1iFEaGN2H1M+rwhft5ybeWFGnvzWHcu9CVL3UFgOMRxtAOMPiYbb7AGPHAzIAcG9tPYu3kn1NCClcvpSpvrRSvWM5ezydSF6WibMpHR9ohSBE7Q5x58FLzzXclqRr+Rrw+zwHBnXYWIdwaHHJZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103407; c=relaxed/simple;
	bh=fSyL8f8FXxuN9GLNNpOiPm8CAir4qwxmDpq6q2GYAGY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AvWTgjvcFWb4D42sfry2K0ERGGxYq/jEUduhQHkNQXKyMmSuhL4czN62wACFfG2cDoSbB5X4QwEgVKhievBxuXxykE0qJIaNRnmALoictN6uVG+y574/nnzoS8wy8XME0D+zO5SZa1scDdKhs50bhMEcfkx21iZx2jtzjmmNJI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MNWmwWbi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v1tqCJle; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MNWmwWbi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v1tqCJle"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NOoI023937
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rovWSEgX4mBOxgOMvhDTXHOLbfyTOuDTUn5EP/yVLXc=; b=
	MNWmwWbiZj/5fqJ/LnySxQi/Nr984EoWcraA+6jgXQ8PHlII0uzTw6fSBFJLFIcH
	Z5jO6OfZY+FP2rVPaSjzUwKNDthWAGoy0QzuNRZo9lGstw8KPLGhPrPZC1u3minf
	OrSLEx+HKT8M3SYU5A1R9FZEJhE8MX2cz0WGKVRme0uP6ie5YCzow5nzWiyQfS3y
	FCT4SCQTa0pkVfPorstfQ58AteH0LJc77VsNgkmpcHalirDlRDubbrkNlNihxV0E
	qLlSs0I47yEoA12h2NLxNBzuPFHnKC4MYyXl2cnYPgQc3n4nP3FMaJrX9qgtucnG
	1YshGCs2F1PiN9zjg6E7FA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2ypy070-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBg025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:23 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMFZTt8L9uEYw2UiLL8g+reRbJzRzJwiNV2qLwrP57NMz/P/numRCdx9XNRhCGVbfaZYb149mSRN3RIZjFKAzM+nsuDgMSCLxFr+Dbr+B259+Bfs9h6hmHZWKsQ/q4pfNjyMrjyMjObCV44HU9Gg4Cn9tJHJsPoBWQlI+CpNfPAIkl5hOHdcYs6W7vRJ4Dz8XE2ORMHZk/XxYivyTdxK0Fnyyf8b9EeIwjCwY1ia0MiYz6B9N4mSpS/24yEn2/GxGyhMw2Hdte30DuEa7FJGzLDgBAX70RCYCiDfRnAzA8nR8I0avwvRBArlrKea7aNRxyamgogCXuWg5pocA0d2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rovWSEgX4mBOxgOMvhDTXHOLbfyTOuDTUn5EP/yVLXc=;
 b=JWpfrOyqvKess2TTOKYGvjNCKovZD2+01tUxWh1fAcdakjCBF96r3SOCmSjLs/jxLlkWLUblke1M365sVYCXomCbuAWC5Addv7vCu197/ArdsThjUjcTys1EqrQgVlbXqYAfLRAeVMdi3VsOyNZ5NZEeWsHfH2XGbWJ262v7o7xE7gZXWENBrVWf6Yo+fR5TxyEmqxEsnD8KA2XXe8kweARj26cgLSxRzOiuVTSMwz5nhyys04xmFb60iNyYbC/Ls0EexVIf7301BCky6iLPH2cZTcWguqy6nJGCTl9lAbHVofhWf/FTEKPpXCIVvM4pzeUKvijOh2DdozqBMhb+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rovWSEgX4mBOxgOMvhDTXHOLbfyTOuDTUn5EP/yVLXc=;
 b=v1tqCJleorG5dsP0clYg+tNrV0Y0tleUOfHD4XV3xBjJdThh6+RN/FbMTXUGjC9BpvCffl1fGbhccZmo/W+U1G6z8vjfXy2tvfFOpoge1mLxObxfjOu2xNm5YhHhFdinjK7JFBmZ5g65rcDf/0Os8dlwvevbCV/mnzbDSY0eLrA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:22:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:22:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 05/20] doc: Replace duplicate id
Date: Tue, 21 Oct 2025 23:22:36 -0400
Message-Id: <20251022032251.2010-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f5d266-16a7-4171-e0a9-08de111a49a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XvcmGZ59AsnUUFG5sEbnuCf1UOAqbdEhe/7qmUdgiBboy3FcHbEuNsgrGTOV?=
 =?us-ascii?Q?nxdYO3u74xhl0NuFvCxge2V4SVFs63gbf9TeVK+4zen5jg85r2jh3Um8AC3r?=
 =?us-ascii?Q?XYaQHLQ+gRfrK0Og38KeYKgHmD5Y72t6Wi156wPyU3HZw3aGhKDklS/jYW9u?=
 =?us-ascii?Q?+yR9vlQO/on5P/bnaXAhHHAotmsX4stre74RN2VpTAgUj/E0US1YyL+NNwSI?=
 =?us-ascii?Q?AYza1eemXSe7uSogWDJDvBDnbH9YwIh0NLe9RiiIvUffWCr28mj5A+J5V9AI?=
 =?us-ascii?Q?6gj2ADl+e4jEkaOE3go7kxa2watlw/0JRdfY4/eHkAu5/E8BdyplJveH0sfH?=
 =?us-ascii?Q?pYCN05RqFVxXLyFG23cx1Jv8CVGYN2qQ4r4+8MWKgDtakFUMkB8pRZqAX9sr?=
 =?us-ascii?Q?jbX5cM5W4cRGIszeiWn/Hz8Yb4kPMPyaHnzdc7zIN76yT5Kec63FGR+SPLeM?=
 =?us-ascii?Q?YchyhUNKaZPZYOi98wZwCWFRPvRV1FzW3+1hTwZoWZmxfpWgJbHKMADfSgt4?=
 =?us-ascii?Q?Zd3zLmrSMLCRwXo0XAI9kxiAV68n6iLwR5SAOzG/08DDMWCA1Nrdzl1wPeFm?=
 =?us-ascii?Q?outJHc3NeOGRa+gOc0RatKKcYXmp29XhT+71hzn99F5TMwy3pyWEehJkyUOW?=
 =?us-ascii?Q?tuJdpeAiBL7ETX5G2+HSdqCc6Ll7IWMJ07YFa8iwphygUZyeDlPl4B3xedrl?=
 =?us-ascii?Q?nZagT9km5pkGXLnMNE4Y9qWcA74JXimz4MG+wYMWMY9InT/sU86GxwOdbJUg?=
 =?us-ascii?Q?jOM9JEuFo5B3jbENdbl2f+Aiks8wKoa75QHVYuMJtZXckQNQgJVa29FOMQsr?=
 =?us-ascii?Q?4CJnUQmhlHtGC6NwhmGxeSNXRPJjAHDkpFI51oGADrr3Y98s0ki4n/hDYW9x?=
 =?us-ascii?Q?gW6zhpzE1DOA+gFO86CTn++LLTH2jhWfTauO+D/GtBFVr6m2FrLSaBudSQzm?=
 =?us-ascii?Q?J9hQ+HEHG3pIgunqfBsvsYu7UMHxeArQCs8cZlNSueE6MCGetXezeZsNTq3y?=
 =?us-ascii?Q?qFDHW7HtzjAdw1mKK6WjdfykeGhpdNthrGKb0M4Iwkt+1dzamd8u/MKGFQiI?=
 =?us-ascii?Q?6Div4QKRnQVogOXzqpyG/GS9Ge5SVMxaqnBumf521bLLs21zbSla3MDhLTze?=
 =?us-ascii?Q?i2VeL4QPev+HSvjbKj4qOiuR9LRFapvkXtUfmOILZN+lVPRpaaMq1cilhqYZ?=
 =?us-ascii?Q?fB8OoFIARM5D7rhk4JnZ7t2Zuc2rN+FENai4WrnqzDTr2VoJDMwSYnQhubnU?=
 =?us-ascii?Q?a3JA63xBVTVq0ZjMFjyvWue0N8brqDw0BPlNX3GBf/gi8jhQkYTn+0LDIHNf?=
 =?us-ascii?Q?qertoIkunNug+fs57vXQNGgX562Ll3rhTWg2ZquHPbBW5YhTXUjb54xpu2sM?=
 =?us-ascii?Q?fcdu0h4GQjJWeLCnQch+q5FGauup9yFLeGogt5G9jDGlDeJI8jDh5EJHiyAS?=
 =?us-ascii?Q?S97vfQ0o/1B8wEu1ksO56DzkFiSmrQ8O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wcvSJ47nhLCF7EAwHnqO+DrqO1Nh/euvWWWCMa62PveBrE6jwaGFZVfRctGu?=
 =?us-ascii?Q?N5yX6UecGz/cM5jJGjGx+PMix+p+N1fB/nk2I+4bYD1E4CIAkNh6MVcLK9vr?=
 =?us-ascii?Q?sSayjEZOFVJnXp6pM8kzdH3HNqv4NjnRHv1LAYUpXo8HSuXfWZeXvDPZ77Vq?=
 =?us-ascii?Q?KHyQ4pcAIpFHtKuUC3KLoKxxI2vfgzaVzdMB/QU8HJd5A3lmx8ceGyecowQp?=
 =?us-ascii?Q?HSBWPSZr+rkHjNlrbd3VTO1fyP1wsAPnsaJOnDiH1Ygoq5cQyWmVvjQwu8qx?=
 =?us-ascii?Q?Ah8IEwaRna1WFCAAJjHZnJyDnsq8xnwP3qkCX1NQeEe6jIJLA8XD2bVAgQPB?=
 =?us-ascii?Q?uTBcmi8awufES8rQQUWRUSCpkgpVbFBSQzT4nW1FoGGCzRq89X5poFpWQ8at?=
 =?us-ascii?Q?f4t9L47nq9K9l6TXrZzE6UyyVoWU2SXEnsTS42vKhBU/r8LPUaa3MbMnkAW1?=
 =?us-ascii?Q?N7yt/PZeTInu7kuO+MK+TfRpGWVfBSrt0Cr5mMjodZyIvMNnnEokESGYF8+x?=
 =?us-ascii?Q?0tIS8p/prwRWmECW3XALCbogdmiuErHvmaJ3449UNlldrq2zMpyzOC2+M+sd?=
 =?us-ascii?Q?JJeN4pmPMV26EZJaGTIKZ+2whNvOTGXPznIk94/Ull2e+Z0EHiAXB44D+ip1?=
 =?us-ascii?Q?OQceSL3mVFFjQsAregjrYSlRo/Yl3MmKtW8SxvDNoioFB4cEE+pCOSGVabPo?=
 =?us-ascii?Q?IWsEzRhoWGK5spXjA1JVNFb1BeH+0FxzFkwB48US1FU4Wp4iPh2c06a7X1mp?=
 =?us-ascii?Q?+nR85QyuLw7eZ6+8S87H+s0wzfxO5qX0IL2jEcN2LfLovTZOodvJ0PgRr8WS?=
 =?us-ascii?Q?1x0Ncn7vwbiyg2eSHnOunNVm/dk5tfGjqZiFJPazqq+zJPE+aqif/mHGJlUp?=
 =?us-ascii?Q?aLbVtEoE4bOlEEwcnC9PD4BdzHAzp1bCAJU4Z/OOdk8hiOvY2AcRvgqqfufu?=
 =?us-ascii?Q?6Z/MMuFpUTdas/y5pTcmYrrVSAMnHeX7J6MEOMQimGwJKbwfwahVl3YKBhI6?=
 =?us-ascii?Q?RCqhJAns3IMCOozeIMwoQ0moABIuNwXoR9qm+0nizagpuwn8rXtmSVdnynua?=
 =?us-ascii?Q?k003N9Tr7ZyYREQTLaVHdA4LZzQBq5VkVneGUGrS6fi3RaxcWPIpZM2KkHXP?=
 =?us-ascii?Q?+z0Uw+z+m4K/Pn6uBU0GuKGVHSVbJQlDRCCxrr3gvh7gU80I4HTlb1Ap9qsr?=
 =?us-ascii?Q?J0rQY+cDGOaIZQOEXWy5LR7uJCV5QG8umwx5G6d1Df1/Yb4j3PhJXlwA8+9A?=
 =?us-ascii?Q?lBn8/EiUWyjQxDkpJ9g546OQbTUPO96aPjSC+PGAu4d5hUe3sCQksx0va5dg?=
 =?us-ascii?Q?eGaDfVCSH278oud7yfOnfZWa3u1AXcIZarDrbDwg4Q5EHUZSjhH9zU7IRHC6?=
 =?us-ascii?Q?QhIXhMflSb5swKgEYbgnBewGyeobhtZiwzaWlHG0ClhaFnvl3jiOh4eNMydC?=
 =?us-ascii?Q?nQgTqLLz1C16c9/IrXGj7APxIXNrz2rVPMfmwX0MQ0bov9XUbpkTEv50IQhB?=
 =?us-ascii?Q?298JKYuRa2B95UNfjXvP7ds8PVQYSduevP/bR+eB7LOCdgo+Uft7Yf9ZOSzK?=
 =?us-ascii?Q?JTsg4akkq0fWF6tJ93y+6RaYPSg2Nt+rYQxMrPq0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LmcCaYuMsTUaDjIX/gRQNgfJo13XyLATYtW9TyqvlRSqHLCFZaIpBli+dFXY+jG/8WKuIto0Gooh+rURYu+GKQ3iF3/RPMa/vHq1770b3H3rEbl17j9weuhG3Uw2eIiUBT/uouERpy+UdMx8CTrU3jMGfsuc0N8vvWRMz3M13n22MkAWSKjK4GvaD1rN2UBZ3xZDGGHyhJTGoJxC/57HV4SYTnuAjdjDSUKOeFZOYk0zeUslNF9MCUNR4KrYF2rzqssf7ePJV77EX4rHc4+7vKRi/ymD2gfEEIEv0dWVQjmfP9hc1bYGnUXfn0yK7x5NOgmgfry+Qx2kanc+V7Jrvzw8V0HYd/zKeaG01LEBaNBlBhoIJ1Uwpai7IfhldwoAWA+RtjVbJPJE4n7zEEi+SjVab2RGXrVzNETwzq4uvgsUqJl3XPve8VujbyD4S0T8NwBb4uBNMfm+OmRwDBKCMMK3IHyFxg/29gNPnoyxPuZbPvl6xDCPS/IBbU+y4H8VD8X21dKz+YMSNmCSN3S6CDAsTE7WvtJmzPLxQDRI4XH/ToVQ9bK8494ZHMjEMgxuTnA3pspuh7GSsmmRLdQUMSseTvgtzyvvEnuhaINzWBI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f5d266-16a7-4171-e0a9-08de111a49a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:22:53.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Eok0Tp9w2lu4Ooj68Y/Z1tbFZSv/h5bctHNOw1dZBYE3Zg5L7B3ZHlGRADtTVaYe8soO7gAFmS/O2cKh4HdvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-GUID: AgagGPmYUxcYOqsRjcU_bwhHCWnbr4pk
X-Proofpoint-ORIG-GUID: AgagGPmYUxcYOqsRjcU_bwhHCWnbr4pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX5WXdaPW8UybW
 iF38qYmz6CsrB//lSHMPw92Zgx56ayoMkaZTqRlfablhny3oaJGNfms/W4WA5K2W0PlF2YJVtYP
 n6wpPI4XRAfAtSMuXEnnWbstaU2EqcJPOwuHT8v5l0EMat58BPcLGClzZGr279B8jwZ+OgsQ7P1
 LH8Go3bS/sCAsfB53TU4h/LluGuke8FNIKWVJ2uMEoWm8uAkPwyijwGTx4rvyhftPrwDSqfuK3Y
 sHfwxZB0DjHs+kxlld5sJ04SH7Nx3BEpV5Y/K4ygGYh7TLMJ6X/V10RV0a6R/0IKd05HyL5pSvV
 USL5sfq7PZUHNK5y9WKTZyh4uBQJU78zK7/cZIiseN/C6I/7s9IQjDfwP0+LnzvaqmU3mkLCEob
 JsZm+42hmw5czGpadtOeX76k7GfMVg==
X-Authority-Analysis: v=2.4 cv=Nu7cssdJ c=1 sm=1 tr=0 ts=68f84e2c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=pocrWxXa84N-BMzY-54A:9

From: Eugene Loh <eugene.loh@oracle.com>

The id has already been defined above.  Replace the second definition.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/dtrace_builtin_variable_reference.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index c9a7dfebc..607c8f0dd 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -169,7 +169,7 @@ However, in probe descriptions, macro variables are expanded and concatenated wi
 
 Macro variables are only expanded one time within each probe description field and they can't contain probe description delimiters \(`:`\).
 
-### Macro Arguments {#dt_macrov_scrpt}
+### Macro Arguments {#dt_macroa_scrpt}
 
 The D compiler also provides a set of macro variables corresponding to any more argument operands that are specified as part of the `dtrace` command invocation. These *macro arguments* are accessed by using the built-in names `$0`, for the name of the D program file or `dtrace` command, `$1`, for the first extra operand, `$2` for the second operand, and so on. If you use the `-s` option, `$0` expands to the value of the name of the input file that's used with this option. For D programs that are specified on the command line, `$0` expands to the value of `argv[0]`, which is used to run the `dtrace` command itself.
 
-- 
2.47.3

