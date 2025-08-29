Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9759443
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493199; cv=fail; b=iyWED7cj4BP+lfOZqR9aeCIcqV9pNi2eGdZGAFlq6ja8p8NQjOZ+ymqGoywnXl7+MxW6qzBDM12NB4euTZpeNXQgSVVbfCkdIbZyARHiOSqIRzIuNqZMopdduEKrNwFbVzlhOZ1kvRJi0ZPkoxNuz0KR9fnWJCQrKfwaGa8DPsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493199; c=relaxed/simple;
	bh=npC8LOtGMOs9bDGeU1I1uGwNICyO3Cqaf3gjMwKKqBw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=eAkWNHVJGqdl62IKQOg1EgpAm+Ggk9VGeVKDRO4lwzpYYM39uBe/eBpzNzAiw9Kf7c7g5DXmaZj3Wv4s6QouGAyYxubsRavAUoSm+Iqn+Y+WODPo7db4vIDrlD5JarkdwwLPuaBs5X+ynm1BxVx0M5JLajWhQN3AcUEadCV9B4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aCjwWilP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LoYY/D2z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aCjwWilP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LoYY/D2z"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGflQb009036
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ADmGUeUQtp3tLX1PJON163uHgQI2yhziO0yoQULQBhE=; b=
	aCjwWilPBKiEbSyrAI/7kosTGDlsEfhtTRj4LUBD7pAEuA36qZNZZEX0MMLgkMFq
	2Ms3u4wodNzGDQnNeUg0h9+PNGh/pSf/E/lRLv/EFoZVCXsh13q4V7HIEXD+4RGT
	PKksELT33u1/SrlHmC4XTCDcwMSJLBxQl1amvcIeMpF/DWjOHyTQ+80BRGMt7KL2
	DldQr+9EAUNdeqfU3NBj/dTbioRMqE82QzLoKn0A7OKNI2VFZA23rF5s4ddibFlV
	SgrQSKP6dXSZcsPmCcNtoD5xlcQSklOipBg0eXzqSvRk8ODpJ+QVJXhIaQQpnX8M
	jdKSYkLfbLgE/ZgF+j66iA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8twhr0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57THDkpG005064
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43djs05-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpALWLltHfyqdq8iHq2bvkgnYJiBudnXdTwlPpvhrxrorSHpz7lVJuPgjWurl2TVchSHMmI1CCmI1q6B1cogreNCKxK29uUlWzOa/hfcB7j7pBZLdziDEC9hS5gFY5oseBMWhy/Y3Xz6O4OlNxR1u5T5WMc0AB4mupoFXqr0l5/U/BYJYmmOjRRRwEVi62CvuoKI8zUsov4btdsO/xyManHfrZ+GEcuVX8XQhWVM01jnnU4IOt33TnOJsj4JJEYDAz2r9IG5+F2Br9JFNlJq4AkKdsxqeh0tCHYx42bGrrxV3mGFIOytj5Nj2+NR6/r0wOO/0fqGJssXi7CSBrnBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADmGUeUQtp3tLX1PJON163uHgQI2yhziO0yoQULQBhE=;
 b=Gtacd1ZwpF/EzpkvlMhS3cf+euU1Xc9pGcsUVCAatp/8XDvNuLqnj2dLryID8TVXZfqj2T096WFJZ67PnhfBGPsuBq5qvYjoM5gvKFOvi1t888CqGO5r9pZujM4jgz3xL+PGS39wa0lZlsLma6BP0Vgh1OMY7aDFyfOVSVlncO5RdVkzkF+jD/PGaZmR+MUCz6YcKvGH3V0Tt3d9kMbFcptbpi5ewjUcEsM37agGWi8oEziMGaMoP100UxnhIMFy048ySkKnRII+79XnuIf/dYzNvHYNjB+ZY8CyZJYj8SQ1frVdHmuB7ep4j5KKz10mviUTjY2sJU66XvUj3row5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADmGUeUQtp3tLX1PJON163uHgQI2yhziO0yoQULQBhE=;
 b=LoYY/D2zvjbTaB9UQREF78NMtjwE0owg5yMyH7I3veysPm67M0LmDnbeJksdJAp4edY1VEmYZkhPDbtO71LX+Qtf/YwJS1m2wpXrbFWcHWDXfw0Dlwj2lwP+9PYwtfa5Rgfj4Wk/2VEhOvM/wPtr5dScRctxDeh5ACD/dl8shyg=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 18:46:30 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Fri, 29 Aug 2025
 18:46:29 +0000
Date: Fri, 29 Aug 2025 14:46:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] stapsdt: fix out-of-bounds access when provider name is
 not specified
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672584FFCA103989DCF31BBC23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: 627b8356-7931-4a72-eb3f-08dde72c5dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GjM7cdWB4R0LK6KbBjTNx3AcDH0+1XPVLTKT3wGczHPuYdpVHxqCswHKASco?=
 =?us-ascii?Q?nAC8Sb4enFUJ1zBun8CGEJufzD8zf1G609S/wLzMIJJoixJCda+UIqCz1iOj?=
 =?us-ascii?Q?UG/nn6Zkr8zUG8XXW2WCtahFkwhKJS+RJdA9lkIXOw6lv6C2qY2oIgagu66R?=
 =?us-ascii?Q?lXJ2PeQZogUhk6xhQVrqcmlSA8R+LJfEyRv10X96OyQmm1JUSakdfPcapwns?=
 =?us-ascii?Q?H3mbKWkIo0Wv+IKa+/Leqmp17TR0ZqQBZxoA61X1lgb41B9DTQPMVktE7yT5?=
 =?us-ascii?Q?80I/5dswMMUtojjZwQFy/Im4hDKJEXpCZdpHuzG4jIV18p6Ag8UI/mHou3nw?=
 =?us-ascii?Q?MItudKWkdGVLly+sS4vxaSQGDwj701oxvIxolCDNEFQazU3GkrOmxKR5DkJJ?=
 =?us-ascii?Q?8t23/04f+UMskITR+w4JyuwtYBGS0NgkPrSxlQaAEe6xTUVWUvNPFy+KuXgk?=
 =?us-ascii?Q?/bE2vemz/EQdAA2I9A1UwkKFNLqDwy/X1jCIjtWQa3KB2pS+bpQlYZW3CYUU?=
 =?us-ascii?Q?QRFjM84oxc4VcEsg7NHlGAxX9qQD8vm3j0rRYYk0W3AOo9U4FkwJZt+A4ieU?=
 =?us-ascii?Q?ZOhFbAXrxuGxwQXUalHjRIWzFldk97DZXRitmlZJQQVv0Q4il2vKZBYnKuv4?=
 =?us-ascii?Q?EYJU0kdBdlu+RD4hXje0IuHHRnljaLdb6W2uKdECJc/2uYquKzEHyqer4j7y?=
 =?us-ascii?Q?Mnc4ZUtDBwuWR+KYRjk0o2wl60buqOP11aUFj01dg5ZtkCV28/aRn1/khn6s?=
 =?us-ascii?Q?xTTRPjU5lZLdwMyQmtY4XkdJQrvT3EsA/ffz6jNr8JaOjR2f0YZbaSpJ6jKP?=
 =?us-ascii?Q?icraFV8czE2vzJHN7NbVvIek2SbB8pPbZVqFtBgz7+mrm8Ht5gYtVAf6KwoU?=
 =?us-ascii?Q?ifR8aebOeGnyBMYH9ejaE+Hy2N75WSLKwRwmoeXZpGDDkmtdFbkbrSgdE/gD?=
 =?us-ascii?Q?sm/O55Gzk1tnY1IUbGC5cB7y1i/B4iAQ8CZxgNZplZe5OmyQBWx5gu6qloRk?=
 =?us-ascii?Q?tFy83Qsbqz9EPpLrz/1nEQmaoMUhUqnszWSrEjnOzm5NfIi4PZBfxttpdZdc?=
 =?us-ascii?Q?r4BhEZknkH7B1584G47LBMY1VCBPIfsrTFNaR+YB8h2ejP3KrzZoV3m56UC0?=
 =?us-ascii?Q?N9t3MNPGGW8X7DwmrsLXssUcTw8EAI5MGwKKOkL+wwZS98nZn/gcNU1ZVJMK?=
 =?us-ascii?Q?0EXcXc/P34/SN04MMWib5LB1He1eCs3HZsvbZ7AS8PuJ79JmevWzh1pjuvJL?=
 =?us-ascii?Q?1vs/5rE/xaeDhICLnby7ctdi3ksBuma0l3V5jBXbGywoFxy74N6ILSoq9OS8?=
 =?us-ascii?Q?7Yyt1WKpz7eyjTFE6hzMSAd6BqWTqS5FWIfmJF5evMRiILPU9KxWUFD1xLgB?=
 =?us-ascii?Q?8+6S6nJ8ZkD9cM9/FUZVC6NWHrromD9+j9qZByLhqItVIggUdiE1hmZfmSZy?=
 =?us-ascii?Q?i5qhJdAatbo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PhpJaf1g3xJYOVzP9+C8JPBKN7PD1fW9Tf4ehmX6lv9sJ8ieWuNdzeIHPX+y?=
 =?us-ascii?Q?x63TfgGys9syJeC06yhm5Dw6upW4qlBnfLgSKvjGaA/V441HQYgNjE/qYP3A?=
 =?us-ascii?Q?f7YtPP6IIqImXp+EeGVYTBc5JyBBzTWhjj1pgzSVc/FfQOPHek5mFdGg96FZ?=
 =?us-ascii?Q?RhgaC/+kdm8NdUG0rDo84HSc4hN1jLIw7KGiuVxyU6+ieBg/4TT/K+jXEZYe?=
 =?us-ascii?Q?C+jPY3LkGJR2YKw+G6g0rax+X4cvZI3TL1KTDyLAfxVALO073gtHwDpGV5pF?=
 =?us-ascii?Q?tsA4kA5aIlYdP/J+/5+Tu7jFIZUQKmGA1DCqS5pUaWNWpIyTPIGYIMlOX4We?=
 =?us-ascii?Q?Sz03uTWXpsR+KntXV7ig1nEU3EWHTq0NgSd5WGaqlyngzpu/QOzRoIj8VFeC?=
 =?us-ascii?Q?BsO/ffipPAk/vbPiID1Rjdm0PWPOeGq0/1sz1jYxIHIuHd6930VzJYUS+Y5/?=
 =?us-ascii?Q?uOyVwDPR5hqNnTyVEW/AlBlxJKRQwNtdtfjWnMlGDyNliDa5oKC7FZ1I+gnw?=
 =?us-ascii?Q?oesAiNpEE9bWd6b1x/Q3xcJ8ZCMP0wzdup54sUFuJX4Mv+BWz40BCIQCs+Rh?=
 =?us-ascii?Q?T3qoUlB5wkXKkLzBnrF+cvfYobs4QAj/qp5kEVO9hJvfoW7sMOYG1ZO+bVzN?=
 =?us-ascii?Q?8P9Hx5QpilZ85GltCSutrh/aZuhEx+77/pXfj0TRySI2x5Gfr0hz3o9dKR4s?=
 =?us-ascii?Q?zkCRdwjGOGF4l1XRqBcNH3G4BoolcpEiXKfgUBgOZYV2qpEpgAYZtc8Atr0Z?=
 =?us-ascii?Q?6b7laVa04sJp6Jc9ChFlo6PenMG4KjuCmcNU8lVyr4eYFXzwnOge1/QMkUX3?=
 =?us-ascii?Q?kN81snfP1iU99D9Hv3gxQmRy6Z08OFpzv6ps7wtbAVwf4QHGts5QI4WmTNoH?=
 =?us-ascii?Q?cnPcNcj+QqBVoTemy39XLoHOjK9ufOcFTyUQqJidvk9552WAxW+Y5wpbxQUN?=
 =?us-ascii?Q?0hSaQOu5EWLobcXiRmkMRnoutOufBS+4pmwXJzlZA/3ZhTQPwYAHSBFHVgC4?=
 =?us-ascii?Q?/21gr/SfKBappHSOslWmQ+Nc8Kw2HJXsW0Z0TacrT4jwtCEJRlqnLy7h4yAg?=
 =?us-ascii?Q?CDFDZFKv1N3XEug2wSy9O84LVY56SZVSXAIOxXqKxPpyY+1RBbi/PrRPCkSG?=
 =?us-ascii?Q?OmCSpXPn5W56ECeD/19x1MeG++QbUsY5NPi00bQBGHpmVPpAtyIRUvrhhPvP?=
 =?us-ascii?Q?nRMa1XH+gt71sTa+F9h4EACIMu6t0rt3VPqLjNGA8EHCgJh2fHkmYvhKjQ8z?=
 =?us-ascii?Q?Z8z3CPAa2TGJ4V412UI2jDKIVhz9P7UVfA7Y86kXyTmPTuRUVbzZE48EV6kn?=
 =?us-ascii?Q?9Yg04XAs2HLq/2SouESZzBuHbYLZQkNEa1vauk0s28T5XIEOsAeaKT7Dkywq?=
 =?us-ascii?Q?2AFcQi5jyLrVdXdLqJUw3PM3GwK1BZAqu7XLTPZL3HWDPxQb74tGXwet7nbd?=
 =?us-ascii?Q?pquz8Wo82THnycjsmOufEfgmkiHWyjxnEcYk1dpMmLwSpHNtF/3xrN5DoS5m?=
 =?us-ascii?Q?bPgER752FKBgA1aZAHHhXU269hnzq7vzNveI6FmwcvzOP3gvUlNQKf/shFfE?=
 =?us-ascii?Q?wMSfkf/5BAyY57H/plTw5BQFf1qG+/DDGumjc/CLGwRJqDcXQ4xgn6mJR8yS?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1HbvgN5RSiYQ0Y9SJq5Mcwfi55y+j877C4Im/Q9N/WkkJ+iygSOK9V4eGZqeEuoCm3PC3MdCZ20E/w1ykm6NkWy8OhEVUho/VE+JRXTN0kVE6BSb3kVzL6a08ekziNfBkrlRGcqhN4wFSEEbS8GrlzbMCBT08qQYSwBT4m9/8vFftoYUQpAdEuw4ewavDkMmk7rGwR/o/dgiKz34DP9wWV9YVumpxSdp7GKq9je/MvH9mcoLNbZ2Ag7/ExZWS0wSCzBWKjCWoP7hXofS503FAt41hImkEEHbNsO+9e7PN6sUkyXtFkEvK5Mq76fssnVGhod784iJXoOtWQonJ0qQ0epC+aCUnIRAwtPKshmV8/EQ9uwF4F53LKhlePPTaaIrdacGkhbTcalTd/yFxViEMto13FeW4yOZhdle+Pelb/eZcBKWf84MI/QVcoeDZwd3QySSc7+KsAZmxOwyNyghS/s9v1uB5ntqkYc7YLfAd4KgMHR1BfRfOE80WztW9TZ2brOWV+SquaL7VpY51jA8g4/2wUq7UjBWOZKNO4mmEZcFLmyOsX01RUWEN4RjwdmF5sgNoC8fBOoflsmPJ3/ZPJP64Zm2o4rT675ybo9qkUg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627b8356-7931-4a72-eb3f-08dde72c5dcb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 18:46:29.6935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dwhSqn9FajniEPs112M+hXID3rS+FZxT3yu27lkymcBUNKsXqIth/AWumZPvXdRWu1BJu0KVNHPJaErLfu7LqI0IsHaCbpnCdNmk84rpJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290165
X-Proofpoint-ORIG-GUID: cunWQ0byjAzn_zX52d-g5QGPnNqGC5y-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfXyDdkYyAo/Lci
 REmwrPC+nhfWPqjSu4V3OSv3/bXiy8EbqaiywE0OHQc2LESEiqW1fV5lEn6UjJh+YMG27uMvX7z
 LaLliliLXoRWQ1+bKOEIgIFhfwWGssq7cc0w2WgLwTVANPsB3H9Qt43lxQAQisCHIP4YxPRdEzb
 6W5pc3PJ25d3wwantO+8exhT/HeLkEhLLDj8zQas5SoRwU26S7lsy2T0sfeAmly58931zmmxA2U
 MC1jPjR7CZT6L5WrH0w0hLAGl1cHSfdeOSwNxd5xyLP1H9lN25HFWRuIru2fmrlR1dOM/PQrGGn
 gkAkH1I7fDyrZhhKlRBIalyV9fs9spB7awt8Y6TgCbDOG3EjPtXFherilcxdmRVBi1LySdRf8pN
 4x0qlyLB
X-Proofpoint-GUID: cunWQ0byjAzn_zX52d-g5QGPnNqGC5y-
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68b1f58d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=RhjOqVG3GVUh007URP4A:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pid.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 4af9141aa..ffc52132f 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1518,10 +1518,14 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 	dt_proc_t *dpr = NULL;
 	const char *pidstr;
 	pid_t pid;
+	size_t len = strlen(pdp->prv);
+
+	if (len == 0)
+		return 0;
 
 	assert(pcb != NULL);
 
-	pidstr = &pdp->prv[strlen(pdp->prv)];
+	pidstr = &pdp->prv[len];
 
 	while (isdigit(*(pidstr - 1)))
 		pidstr--;
-- 
2.45.2

