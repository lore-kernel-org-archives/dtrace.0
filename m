Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAE219D8AC
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937421; cv=fail; b=nnF8RqZ2WgLFYfiowRbe6I50NxfaU2XGDw4cChOEkpWPPk7rXOSuBF3EWdZJ7J60sxJL+UxTK08azzoghtgntAG7HVcZmjkTM9qCNqB1fbHKHAb9diCu/y5z7hVqI33zqX1L7DDaqFs2Zrqgh2JGlO/JG1vNIiz7FkVektuOOpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937421; c=relaxed/simple;
	bh=UjY0ldjdbJZArvUGaLFjR2ADjQ1CBcB7lrlSYkVJsq0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aYleLz7liXseqMUdC/PKtDwes8iNDXgHBOej8FzJ6Dn7eoWRMitZvF86WtY/Mnuf4w7fFfQinb/Olfjfsq9ejedrfWP8UXbV0k7u6Ve1FIfPgt2T213ahOt8PMJ5q22UvthBIYGKqNd9niSlwpaaW0KQdWW05d1Ih3kr7PySInc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cVvQ0Hfc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xj37887m; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cVvQ0Hfc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xj37887m"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI75sY019688
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=zLIYoT2A/NOBrjKn0N
	xtm+cfYTL+MKJKOsMKN0CaMPU=; b=cVvQ0Hfc+fXg9JtA9yRV81nL1yPKB22QrX
	gqAw5pM+BECiey8NWsPjjex+NLrpwuezUpdC/A80q+lZ807bo6Uy/DLgc6deRAsg
	AUhr+bu/xIDrL+wPRh7lQ+lfkE0DVJiIf5bcb+/CEFIFsZr8luKtcuaShXaVFpyo
	tZOC76idbLcOSDIeHj6Ixpfku8nQGBvxK7CF/2QLxLpEM+wikQPtC6x07/f7aODN
	CoIy4WyU6oUrjhjY95AkFDf+JKss+afxaV46wPqNiYSO7NHveNRlgd/F8uW+DQpL
	rXj9GhcdM4SygbusVJuQUGAyhA819VM5Dmpnv+wUPdYqUxOFvoWw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t8x0006s-16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:10:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHYwgk033586
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rweq0eyp-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe7jXqdq/P21KNOYTNSGM395ud5kLMKfNMm/Jn1xYWw1Ivz3p033oX78Bya2rlgLnry7T35Z3BEsZ7xkFd113pFoXc8rhsW3sR1ueEvkuTGyMOuSVcHVavGoy0oL1RbImxM5az63FZVoPWqAs9GSB30EHDWWCIiMghUhMWB86ViY6UZvqsGsO0SwBXLfiKLMH5rmDbc90aq0HPyei9F5A4v8DlZOrtyoYdjUDfpaOgO0gASNQqLl5zO8QGP2+wGGA80KBOzMPpTphQKIfX3LObSh4aRCM9a5bxChYibkaykn6aKTD41M78LnHJtMlBM23zukDi7VA6xtUHJx7Xh9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLIYoT2A/NOBrjKn0Nxtm+cfYTL+MKJKOsMKN0CaMPU=;
 b=sjRomiouaP3lRWiLdQ8hnOgP3Lb7pDoOmPzi4dIz/nGEik7hKYLvsRG2NTK+GEMIHgvgmM8x8ydBn3RwW7fNGikFSF/iWvpQGfxSjLVHpJsf0ME5EmPTEnq5/QsIjCRjzlgXWg1YanS6Hl/hwRuCzIMf4xh+oWZnD9W2y3uQpbDCHRaCzFDPWlVpAPFmIw4Ai0t3f66xkuK8JLd9Y7dVs+vMMkOp4Ad3AdCLUQiCtx1AlbnOkgKXNY7Ml4nFb/PsFUXYjOaIjWFm7oABBHZz9jSRA2gQOrNr3obFp3BtKWK4l3tV92Hxg98AEZQBjWk20jc7FG5MjIFhQ7naNjo4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLIYoT2A/NOBrjKn0Nxtm+cfYTL+MKJKOsMKN0CaMPU=;
 b=Xj37887mCOygUr1J/TaSVP0gRU3T4HH9ADv8ZyB6TKuHjXQbYWtu4D5RRwr7S3pkYLOGFSJrA4s7MwzmAP/8ZR4zp4pA/6q9AG6a5uiRu4vpa24+odGr54N0/KOLCPJNVowmJKgWbR+tWxOfxfW7sVoyqBByGcVGAGe4OF0d0EA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 18:01:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/14] Test: caller and stackdepth tests for rawfbt provider
Date: Thu, 22 May 2025 14:01:16 -0400
Message-Id: <20250522180118.27343-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: a94c89ae-6c25-4c13-7847-08dd995abe0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BkOEw6+APJUaM2TOqtqJXrgwTHrO5U1FjV7hrbagl1WDKrQgCWHjhu9eAW0M?=
 =?us-ascii?Q?I5Ps7gDLVU/gC5uePUtAvS0RFL5UD2V1AFyNPzUEE69101XWz7mjC+wB6h5w?=
 =?us-ascii?Q?2zfNMmPw39a7NKwGDRQbgfjFCqbLKoa7voiqDGsCJpGNdThanqQFpFTMgf2y?=
 =?us-ascii?Q?hObozmZHVDFNPhMFk5dMnuCWVsBdWD9ZlstBhtfXJbeAmycXn+UzauK5YHgq?=
 =?us-ascii?Q?NVW3esrl949YZ5cf5D6+KkzRV0ovPGODwETwtSDKKwRoQ8EswSijQkI+V4O5?=
 =?us-ascii?Q?9/9LkUN7bXfwUj6kFwa7IdmAlCoxf0fFLbmbfq9vGQ4itlDZALAy9nJ09wQh?=
 =?us-ascii?Q?kXRFk5uaW3dl1NMYOBdqAiGoRMiRY6L0FtVCbNEobBTKwb7RUASxQA3UKxq8?=
 =?us-ascii?Q?ap6osvaQVTUpqg1DBkqTZpzY0H349esxQ/YkqEwlQgNCkfvP2t/NGXMyNqKl?=
 =?us-ascii?Q?2ar6fbhERSkRqgKLZKNqLidMHY4CPTZ9Qe2w8helmePKLhm0T8icp/0DLFg8?=
 =?us-ascii?Q?2SUxsHV6Iyn/9UJ/tmLekvEufYkr+hmzunF1gXG5KR1GTxan2hlBFEej7gyE?=
 =?us-ascii?Q?0bDavegQeUw1YObF+d6MDfLcJBNxfa5vb4Hl2R8nX2jpro3LQZLaMvWxGx0f?=
 =?us-ascii?Q?ra+YDvAfgnjow8syja3YQfLqMXF4IzzNfPBC/uZF8EM3gFqEfy4KG0hsnS3E?=
 =?us-ascii?Q?KUNNPj6pUm7aEGIaNbIuRZmXo0ZSGz5wPwxzson2Z1nbNpgom1tx3DQBLFOB?=
 =?us-ascii?Q?31P7TUztK4FAqRRYu6aSa32rLC+zs/ajdFwkpRgZjzq8L9ANauKZIcwam0ro?=
 =?us-ascii?Q?IBpblIhwbaC7iDFDn2B3/SS2dJzmUezJOlF4c5C0C4orSpOwWBNGI194bLwX?=
 =?us-ascii?Q?0GTje8mUAxYmDv/cXW10FFKyVrmpFbBqWdVkvRKC/lDcGWOVvor/x9IY1jIG?=
 =?us-ascii?Q?0h9fEcxKyEZ4JmkhYD5+07SXRS3HfNZTOEYH8s2q/hylkue7Fu/7zyfB4tvP?=
 =?us-ascii?Q?vF3juSVM0D75jft6hWn8mjiZcaJKXUqT1CvZaqZ/h8NMO3WUv2czyH05afS4?=
 =?us-ascii?Q?Pu+mCLJhM4wE35+uYrgdH1szStfNcBdnh0SRDpN+rz7RDLjqQUyryheemcDx?=
 =?us-ascii?Q?aQzaN4kZdxXCCYfEE1GOnfuXxINPfAMkP+/jSqOtz5iHGUSHmg6fUR59U6Xd?=
 =?us-ascii?Q?l0XWY6o/3ZiO2sTzsW83Zs8Zl3abqq0BBLkZuISPOd53hir63d64fLYrl8pY?=
 =?us-ascii?Q?3DkIIMRgXHDUsv4qA2RGFdW1djvfXIjMWcGZ0iuhEFBbFW4WUwEuWHbtmJNX?=
 =?us-ascii?Q?YrV/tNV8gXjYEOpM3Zg8516ldOyEcOcyHQmJYXupsC7yEOWgtiH/FOL2OADc?=
 =?us-ascii?Q?aHRgLAWp2k3CsRemTN19HrAM9nwm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uAv4NvHHLbKMnlkUX4HndOBc1mPQGWZ/kzxkl9+ykFaaREMYeHQTcb0Cb0Fq?=
 =?us-ascii?Q?3Nymn9oye1E+kAN9cTJWOGzZl0I5gQIuYjbCgc7SxRcDii1eY6eZHRcdNL5J?=
 =?us-ascii?Q?3YGp3m0R2vNC52wqepLepk+tAt/l7XzpYF3t8icFC4fVekVw7tkTuOGnf6ov?=
 =?us-ascii?Q?KTPvB5tyYL/lZvOt5HOZIgnpsDPBefCC8UC2MARJgGMoPZWYG/n14v7EK9jd?=
 =?us-ascii?Q?TAoYvSSxDpqBfvNZYajn2Asa6aQPyBO++mH9eyE2C6Atx5D3hCPQ2+h2vkaS?=
 =?us-ascii?Q?k7kWTKBsI1v2tSiFr1PgTf2wlEuI1kyfGI+M6mLmC2OJaDHr+C6NbBvd9PuZ?=
 =?us-ascii?Q?jfSAl4TPDvrzyHPV2Weyh5OwCQ9hYG2YlOHUc/lwbBSuYk8BllG6JotmN/l0?=
 =?us-ascii?Q?0KCk3TiFkSs9ykHTfJRc3Yv2KiNDjWQMKnoQy99gc6SBPNXYlmbxt93ELEum?=
 =?us-ascii?Q?HdAdw8U1ATX58gxawOiFLiOzFZ5UAsLrBOdbQ2+avHuLsTY6iHDsPiBVGbN2?=
 =?us-ascii?Q?mGBMqtbQ0H/wSiCbQLawbYUhO05v4jwNkzTzU551GRgoMb83Q46alg/5JIOH?=
 =?us-ascii?Q?hZwpwPCgdkOBSO6MRUd4m3dJ7iaYyvlSdf8r7A7ARuLQP4zOozYYrgfNJfVe?=
 =?us-ascii?Q?Ieq1kEE2M0GlD+gBtXbXKDznYtfaquQ3aL7oZdilCrJjLDEy2ncZ8m101TMF?=
 =?us-ascii?Q?j28xKtg/kqyF8aEGvk1Jg6Xl6wVAonrdKlrrWjcPbhEICZzoSGSE8N4BCuzH?=
 =?us-ascii?Q?MugaTEADu+KHow1RUkp4ULnkDgMHVlIUIkfsuTJqYfXi7nyiuu9csaKJGroO?=
 =?us-ascii?Q?wyBLCVMhRAxsX60AoF9NDrafEXr2PnKzwpM2v03zXBY3HD47rPOJEI/CwHtO?=
 =?us-ascii?Q?1vxOw7jUPMJ46u2YvQNxqtrvJHUxVErjLS7ZGGU6D5H7/Q7KQy+9uJCicJ4s?=
 =?us-ascii?Q?u6u9c1hjFXb+4IB7vVdXMN5D5KYT8dkbiY2Zk/y6cLnuWNgUoWa3aXQXgBeh?=
 =?us-ascii?Q?C3vUbowsV/XBbH0UymrTsCP59q2JCLokO3MBNJfJvwl1PTchW26vkTtyaGes?=
 =?us-ascii?Q?Npp97ECSiZaytOO+uJXp6JMHpDOqroKD+IzOyrqrnUDP2f5FUfFOEErD36M6?=
 =?us-ascii?Q?9aKuvx07A2wjq9utGaWw75a5BB9wS1xnJy3VbmHKvCfXZbw2A7x47wfOnvR0?=
 =?us-ascii?Q?hfm87dcv6SvyCMx7CcPXXBG2wZVq2BPwF0tLPBqhmxFCzTROri6IMG+URV0f?=
 =?us-ascii?Q?OdjP8XeNtwWNhWVp4G5buUAQ46789fTFzM0hEzGOH4qh2wyePOtcmhcverqu?=
 =?us-ascii?Q?Ng5TP6EKYtqi2P0a95/lVy+tWkhrKc4cZiWnljZXzDWm95nzQ86dqbKFDjvo?=
 =?us-ascii?Q?xGCiv82/eYdzhfq2ZuRJWT1ddAYBAeGIy2FR28bA0V7ct+lrh16qDhhtP3Co?=
 =?us-ascii?Q?vvDMoy9kwCFyyfL9SYox14K4tmC+TuOub+M3MWwInKxvOrz6VQJJxMuQ7oq2?=
 =?us-ascii?Q?86g8zSv5MgZHlagXS87zjfGLJaGXWYLgwP9ODtzYE8WffDz9K6bsrqa5d/zK?=
 =?us-ascii?Q?4yfsl7rWFeoyl4+a9P3xYLnrKV7C7muI/+jD4zeA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5Ftfk3dqcQIlxNajZy/+Ap2Nb+Kg7Ca//dPIPV6aNzXa8Vr0i72DxefEaRZB/DUN53bT29LrcMR6saXNycNEEgJL7TiwKMyXJmtdZPDFlN86pXzXjUGdkIQ0ZBKzPEyQIl8MB2+DT1RNSvVKioAiWtGYQ5SLXG7Zj3a93Zke/q+WKtswPSOPUBkiMkaSYUCRoEkL+nmKF+OlbtnQ0WY/rhokyp33oc1RrE8BtElepex0r+8h34AcyesARwX4xT9kiVk/BOp7z60zMXhbeQqguRC7XNjz3gnWyB5LMXkk/AG3Rnev90oVQoYPk6maWRVQrl28x3HuHB/UoC0WpWseL+HNSKV4Cjk9BllfpH+Rv5SgfylHcVwtAktrfx19/aeI5UVordgRzdvL2IpPCkeKjIbWpCT5wn9Qo2J6KZ6A++sojiN6jHJxR+/TcX9nLYNbbLJHyZF2QHRCfMe/UIbLJ0/Ix3LurZNBOvz468hvbkk5jS9dvu2hvUpdOwGjo5VEP7GjAn8Trb2pYNs/1LcNgV4nIeyuNyudczLmXt9zUUWiVN3uhSan1k54CRLWVc4SdccMqYi5rOjLpwjPn5ry+N3jztWVr3Sqkel0dIOXdXU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94c89ae-6c25-4c13-7847-08dd995abe0a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:57.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmnyUEEl5dhTHTHSFtRzQpei52RXPnWV/AXdr2uEwrjFK5I/hlpLi5CBr0RA+L+ZX+vYXW58P+5dA/ILD3CTDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX2zhp1yiIaZc+ 6/aOWgFD6LId6kywCTyBoOiXDBleEHEHsJWPBwp8G0wL49q6+qlMEXsJgNJz4o8NFjUkcoUcAQk yVot2jjUGT7kD3DekqLvxQeIhHmSQ05hUhb0vSLZXbhS4W8SFpTZQXbTgbKSKv7dFbvX+NVrnGP
 3CeD3RyGei1z9ntMrivKIN+qM4ZGPtljcF+BiG5xaq3kgvsFSG4QAWB4rW3IPUNXf4buKEdNsTn I0Eej1zVvq0irEzy7dwO9gtJeeqDuWgHx9qfkcYChU5j324t1Hb+WAOnbDoODO+wQyDuyKj2f3A plPW7WI/CJ0qL2iQwOF8XXxhwXEHQLv2ZylCphxTuea7HWYy0y04lUrq/Hcv1WVmLhux+KrjvLm
 XrE7mIKczuE4TbRx2sYEE6FLEURKBIjS5vK4VQScYtE9C2d7xSjQxs2h1zqHAXGReoyfxRJX
X-Proofpoint-ORIG-GUID: TBtFp4qpP0ixFhxHr341kKo8t-7vTiMM
X-Proofpoint-GUID: TBtFp4qpP0ixFhxHr341kKo8t-7vTiMM
X-Authority-Analysis: v=2.4 cv=TZKWtQQh c=1 sm=1 tr=0 ts=682f688a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/tst.caller-rawfbt.d        | 25 +++++++++++++++++
 .../variables/bvar/tst.caller-rawfbt.r        |  1 +
 .../variables/bvar/tst.caller-rawfbt.r.p      |  1 +
 .../variables/bvar/tst.stackdepth-rawfbt.d    | 27 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-rawfbt.r    |  1 +
 .../variables/bvar/tst.stackdepth-rawfbt.r.p  |  1 +
 6 files changed, 56 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawfbt.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawfbt.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-rawfbt.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawfbt.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawfbt.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-rawfbt.d b/test/unittest/variables/bvar/tst.caller-rawfbt.d
new file mode 100644
index 000000000..08ab3eba1
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawfbt.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+rawfbt::ksys_write:entry
+/pid == $target/
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
diff --git a/test/unittest/variables/bvar/tst.caller-rawfbt.r b/test/unittest/variables/bvar/tst.caller-rawfbt.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawfbt.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-rawfbt.r.p b/test/unittest/variables/bvar/tst.caller-rawfbt.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawfbt.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawfbt.d b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.d
new file mode 100644
index 000000000..15a9991cb
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+rawfbt::ksys_write:entry
+/pid == $target/
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
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

