Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9782741B6
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382764; cv=fail; b=i1vVmnOwdisu8adkQZBB4aQUSGtV/A1vrhc0ldzFkrC6MrGUW5xRiD3too393LR+MKmmPFXbwy/AABjyj8M8/m8qpORpbUJJr/BbCvjl45qYca37wm3Qhlf5n83E4i+9EwJjde+G+anKdiT1I/zJ2Wyu9BBBGEjNoMbnI18IfQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382764; c=relaxed/simple;
	bh=VwJWCo/M/vn78RDFK20huz84RBkYS7pfBuOuUApKv4s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=R89ge3PB16giUDXbEKFLnwcdeCLM4EVkYUM9XOqo3rCHlxCURDju/W5fJ//c/jEmlQ9YQ8iUwy0+lmgJrAcpbGQnBjydpL3mZ793riF5WqrtZK1VOwFggOWxRC6N1WLYOf/gYm0ArwAzujARmtXZEiOfG4HxN2ARyQzhulSDxMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k22GQ2DY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PfMOpInR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k22GQ2DY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PfMOpInR"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561D9URh026899
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 15:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=jD0SMab4nQJp73LhGBaRxHUFVKoBEN7+iFnAzBGnZV0=; b=
	k22GQ2DYLlJSjmwRVtAfDtDc2oqsXzQsO9VKB9u/N20WMvJmzidp+9djQ6eD2qjt
	b8+n+VHut1HJMsSO0uxhuRArOntVwLxUKUIk02NR9IMv63/Hxxs+HzZd2RCLr1Z0
	9nMQJQiIvnHBdIIqPEIDxXXkEhGQ3LTtfnfoZEUhc/5HtZsT1IN2NTi2jSYY4qfK
	/Ndz+MLapCu4Jjp1dhNcEuF6n9FVukrym7b+hmHu0tXvZ3iy5KYyWUS8Br0HkW5m
	iCMmzPBHPT3DAZRL6/7iICLO6K4Ydx81QPag3Osg4VGUZXtq8bVfKALIqQ8cvHrx
	+4LseHOkfUtX/PSf96VpSA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx4yp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 15:12:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561F2JL4027461
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 15:12:40 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9we2h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 15:12:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgBg7XH/oo3rOQ0XsqxNBkXyCke990Bp/jdj/kPLVYGMOUOpZD7q7vIbooT2CNnTlcjPiDB0FZ6l9ceteYBJXamiE9gjUTTMFNWMDbrPVJt/9oBwp5vc7Cbg3S1rqjSQwaInQh3GI2aDEW8yvLWQtdgRCgsK02OXyShEWZW+smOlc9z3nZGEvgPHKdS6U2vQJZ9sC/YmHg+HHdCNBd4ojiN9e6OO8BRkXZrj6UcH5psqyhyyTbRpKlE2xuhUEm0pA2UrsQvxWipnZeQ/UkMf2M5YYDuKxXTdZgSxKJzNtxrCRhQxBjn1IqDHJxNtCupd/C6Zqd4ZAG0x5rbkkkbLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD0SMab4nQJp73LhGBaRxHUFVKoBEN7+iFnAzBGnZV0=;
 b=k0S8f3F4kIjkKjVGkndO5xog8URi/fwl+QIn/ieXWS6L/R9op3aWoSHvb2LJCwa9RJmihTrX+y+tuWHhlQau0SQrIC4VuyRutmwR6yQsqdAi7+E8gVcO4ETvhCKr+gX89lxVXP21k2BRkNbh1m6RDSFqBkz5qF2zBz1dEibCbEMt/XEM6VOqC2fvg+8GpWw2n2QeSeCG0jTRSyo7dUsU74PNKKxci7sWxfqzrbsO5DvSKsHXUqgec8dNVJBghuhTtt6tguLTGwIbnSIsH1cx6isMmlmZGCewE/0GBooYtB9iCpulLAnN27yBamVVDJqqeS3l+hGtGOvgCbeDb8tQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD0SMab4nQJp73LhGBaRxHUFVKoBEN7+iFnAzBGnZV0=;
 b=PfMOpInREFoRCvlzmj+GLTdTKI1zw6rUimsiHcfTvjDQ9rxAlJKWi3OoQX4KjOX/6AyL2PVifdwKiBtfNgb4FII2YulwYrW3DWUfneUumgxPRNYmGLXUnrxgUVVwPiI8upnrlRmOEb1hYyncQ6jKFXa/ABfEJJOO7qeyIQEpy3E=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB6796.namprd10.prod.outlook.com (2603:10b6:208:438::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 15:12:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 15:12:35 +0000
Date: Tue, 01 Jul 2025 11:12:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/3] usdt parser: handle encoded hyphens
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56720870F2337F7D89A41C8CC241A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a59b84-2449-4ade-bae6-08ddb8b1b5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DsiD1pThzQwrM6gnua0AusAPOJ9omRDBEnhHIVj2NcbhWbT8sXP2yWJNTdns?=
 =?us-ascii?Q?JQhd6KNThlQvCoWR74DeJV6QXz+Pz1Y1Z3Aj2aW/wP5OEjfs7ZEo+Rh2cY5d?=
 =?us-ascii?Q?jcRw3Zru/tAmvjEQeroyszI/VBEVbh0o3woG2SYVcSISfL1oDe/odBFcR4oH?=
 =?us-ascii?Q?JF73vGe9nNXgvSAI490RFu2L1eUCtq6+dMQq/KvITTYpU0u9mDoMqX1WrLr0?=
 =?us-ascii?Q?d6q3kA3hYnG1bp1vdMWkmUHqwLqaJwZu4d/FcJ+S0nX+YyflM0Q//r546baO?=
 =?us-ascii?Q?5q7Qj/y4NwErsZHfeayjwYWy+b0Ed7FM+BwaMeh6cZzftuBo7fgU5FvxelgR?=
 =?us-ascii?Q?KvEfMHwMhXxJigKohFLMqFsNDBfmy0ov8i+9wU2W81ivVJM0E2C4bnt64qA2?=
 =?us-ascii?Q?I2OgeHGl3u1ZxVEPV/fOaUJxdDIj5JvmBWbouDEECUrwbCE/y6yoS/zCPPTl?=
 =?us-ascii?Q?iD2uiOWkwIj1vZ51miDXbg2MZmj101l98fHOkFC89Yud6LJ5qV3pZ8JD0hEv?=
 =?us-ascii?Q?ZYGvqWYxGevUkE9x3wTYVwSDdGc43IARv03M+Fg98anP2NnKeBW+hL9529j7?=
 =?us-ascii?Q?d2yKynXI5iXN2Jmb9DG7ozOGlsicJOvpvAmd+8ptFyYX8hcoJmKNRN08bDzD?=
 =?us-ascii?Q?Zxr+yMDp43EAikmhCodoh/p+fYRbXtuG65gbiKeCGv0w40icYOSyKNyxcR3o?=
 =?us-ascii?Q?bIiJBLQqKV0zaUrwByAacllUT80pzYI96JZv2dGLWRhK/zU6PzGtdBNhrhls?=
 =?us-ascii?Q?UzPAhTsfsSYcO3YliXCa6lbkUEDUKumssjDe+VKxq+dFxGKTkmX7z9taKAkh?=
 =?us-ascii?Q?/qFa5HNLmx16esOH5fL4SWohV38WjubkipXipe/kST7ZN11RUmxscnUHrYMZ?=
 =?us-ascii?Q?1yTT87oygegFUxtSGipEhqIgWwDBDqd4IJE+3GH5AfMPMcnSWY4Iphyd5gBq?=
 =?us-ascii?Q?cZ3VCzHDVT3weDPG05qebSyBrRdXIewksuS5LJuSHDJV6RcimHjCE4Ru29sr?=
 =?us-ascii?Q?oNWhUVhMQQ5yc4mSqf/b2Pxk0S9gr/MUZ1xU/ijERpsqq/Q2w+urZWXe/qhO?=
 =?us-ascii?Q?5kYcEGBeLnG/Wt6ZVXJ1TBAqDNRCee0E1+fiPUkhpdZ5vL+Y6zHalsVWoP1L?=
 =?us-ascii?Q?FkXqcs3lSLi4JuX8PbZ+jGgyAvLWnh3sYy7SHE/u/nPX71KwfVhpZaIVgORi?=
 =?us-ascii?Q?hiQf17npK7JUx+cjidvIfn8MnuvO6wY76XwYfAc7AQoNFXySYCUGd0pv3zfg?=
 =?us-ascii?Q?gmu4RcurSsT/Sq1DMtNAd3p0EoyXuXl7sQVBXK5jhA3OZGIKfcpQAg9z+XG+?=
 =?us-ascii?Q?tdBoRiIsvcvwW5YJ98NNH5yLQXbK9rFDhRVl2ifUNkN0ski6Ot3EyR8UDeYU?=
 =?us-ascii?Q?0aRHF83tybrn1mN+fer9v0IxLN/QSE+pYe7mXRbAcQcgmzgbLAUDCbvPyqS5?=
 =?us-ascii?Q?cUtVckA7BOk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MyshsBtWQ/r9Ly3cLpGdN2RAFcMw7iHkgvwMftEHz05QPnNcfGsg+8fY8PDP?=
 =?us-ascii?Q?w1JDEGVC5Og44mkIQKiMC+6LwGLzw6gI6C3cDz/4xSG0VVXl7utJJLUhRCjz?=
 =?us-ascii?Q?16vSE4K2XvXDS1lhvkUEUAgWlpbR2ytt9rOgj9BqSJduN8OI+q/3OYqwDvdp?=
 =?us-ascii?Q?AJ5gCY+1zTx4hMmPf7gz+qTC4Qcz1oSXfpDENVzbS/nL8SxQH9k0Ky9uKbae?=
 =?us-ascii?Q?IqZSOGZn2NM3YTBRyFeWa1SI1WekmuEAyOcRx4TbLUsxmvu4QTfOo9+zdER3?=
 =?us-ascii?Q?7mgpja7hcxA2zsMZIw4qIjG97ZhkjVEKPyY5lsYB7q/J8pKuNNnDF7zwSSHk?=
 =?us-ascii?Q?vBwNrYJIE3FSohQkFnfMLqsJg647a6+E4d8Sh9iHgiHcFx+FzObysHnppNFK?=
 =?us-ascii?Q?r6yBUrYwbZLnBLe6ygquYl+1UGZJCw62xzYEljBmFnVoV9rqrXt9lz92PXrb?=
 =?us-ascii?Q?0qFvGk7GUmJLmLNdwdn2FD21M7pxEKA/SP39USztet88y9/YSh0fSTKlcUUq?=
 =?us-ascii?Q?MxKwBCL8FcqFeg204ytE+3BsHuwZMvsbJymKeJyeq1jgOi22IJCJ4Ah39Brf?=
 =?us-ascii?Q?zr/B9imO7/ELJeBrFoeKCLZk2RqLPoeAy2/C+FfTEfaV89UkyHat+x+EnG5/?=
 =?us-ascii?Q?IvgX1Sr1IwQE0AMH6uydZONoo2bP3N5Wgtv0pMWnLg90B2uFsrWZNI8vtLRB?=
 =?us-ascii?Q?h/mODrVpCkaCsqn9+qDK4UKq0uCe991/j4BMTS4lSUM2PQDE5usDHg351bZ1?=
 =?us-ascii?Q?IWGJVPLCYvgD438UMfsnTC+qybPOrOeACHYX3wF3ukMTzmKC6cKslzkTwQjz?=
 =?us-ascii?Q?aVlLAqfiLf3/W+pxQOo+M3CfnHVtiyQ/iNaz9z7gi3UKdA9H/pjmRq7iV5Kv?=
 =?us-ascii?Q?ZufvEdN++Pr2uugK8VaYoNFypB8I9H0MnPihXaE1zPxgVtVai8qOT/Tk+tF1?=
 =?us-ascii?Q?N4cdsw2zcx/o9d7dVeMxkUK0ZFtpYz9eyGBsLfPnGveWoBuZLWh2W4JTNWez?=
 =?us-ascii?Q?M/dhwnjlW28KO8TGmEUHtwQWSzFG0tHTzRbMQY3du75w6pVaGp1yTv4UipMR?=
 =?us-ascii?Q?hlssPiHdt1kGpK1izz21EAyxB9tzPfQhttt4Mpgspvz6BRVIRXnBjfUj0zfs?=
 =?us-ascii?Q?8iTKok3clAvl06w0rfyScVEypdpX2V7mFLxuVS4ZD8ndDqJbiVf+BevRDNIb?=
 =?us-ascii?Q?+feWo3c+dAFS7NSoZM3xhbL4q9Hx6uEm0n8qrk0mmQfXLlD1Ez4K4Qw8dGuW?=
 =?us-ascii?Q?3go1b3SGB812a/KDmWEfheGOp+q1NG2N8NxxVuDkB4jrGdeAe56yarB5PxAs?=
 =?us-ascii?Q?K4l0hVLiqojvx3Yw8i1Y6F+y4GVtf4HAvXiDgh0dcjs2EIjB44QqNUePHEcF?=
 =?us-ascii?Q?w9KyP9QJBezf6rr8iM52IjTYgxHmaVvSH3mp90mKgVWsQ+VKwmj8J1NcMkhU?=
 =?us-ascii?Q?+UkZImp1JOdMVOUFEJT/iubmS7ptYNh9ZHAA/zkIsLrU6vtXsiAiPeMt+e9G?=
 =?us-ascii?Q?T8hSZSYqstRJ9Qn5WIHtuBzzEIDw7ELcuemMs5Y5Xg+I6z5BMdvCXf/4E3X1?=
 =?us-ascii?Q?ZA1luUW05C0yxVDBDReq0F7ElDJ29v0u/6dhV2W5KrcjOSxkkCAc2l++BrYB?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AtE1TVNWW4Ya5wd6KRIZo52K+4Crt5yet2LcKWCOotjSFvqRo/3i3OJFBSJEovGt/H6l6XcvSYIy2QB3q66KMZgPjg+H0/pjex6H98CcDgH5ugdxwAtjrJraouTE7TQ6huH8NAUeVAEFvp/5JHaeDcFIJnxci44uacf3NawLCW+k6vlk5mnHXZbuUumHn72CZ8jlK/bM+JNRgx7tSKjYUkXRGlal3oxGbjIK2u3hXinY11Mgb8QxlLJz+n/2wu9xffx1knY1QdnwU98Js0rKKY1TCdbe8H1y+0Z1byGZv+YZaa+TgRJxKMjHxdUrIG0i1yDZX49/ffathv5kQzUSnTHlhOhU+0s7seLv/RK+8eN+h7NCFYVzEdgz8GwgEdXy/+uEUreWV79M+gGKxkVt5UOMF9rgtGh10+7B9BklE5Iu598QoXiX+upHOOzi+0zL4HPU2Uzj5m2dIzEf8EEJtUdm/wicVIZ/4Y+H7DrrZSrLweM24ezRM9/lPXyZas/1r4mgZhZ+RTXuJ+sb3g5YKqLhtmXdvGloHfzlfWA7icx1KujNai+RrGKdnPZx7cGUOEYqiNNfzoUAS4auBE64jeOnmXTsvM11WHGf9F60urk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a59b84-2449-4ade-bae6-08ddb8b1b5df
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:12:35.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP29xirdwnGw1KE+A4FIXEMwzTQTgAcAiOND3iazjqHID84YtCtezBx0a0S4kR+ofanWw9ECqyH5YRdENR2vC0cKMfwhd8aQGfixcB7bNFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507010100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMSBTYWx0ZWRfX2scUHZTqMocU ig1CbM+aPJDosUxsHEtj3sFLZ/ETfVNsY4VrznQWJ6T5ceQbIG0dsKnewiRnn0DJEavklTMAVgr WcTyJWfXmI+Ncf+Q0yvIl46yFvPhIG/ryMR2XlaPzxNM+cqh1S+n+CAiGRzRtqXWvQdmtt+xwzH
 C6AXK7gcuf1Li74GWUX8VQt3R16BmKS+TpV5QHJsv2YhnF7lSJBnXKcnMiM2UActZ8X3PKZfL8B j/LeyjH+R+g0uYHJQq5GVgb6GPjGzjlb/QlPmkNiQbfVao5LMCRjdx9c+EDqh4aNeec+nMQcQ8c QiHTb+CqpdzxzLUFUsvZiShmQYKRu7tKbyrTmzNP9NG+hOlMJO5KcgByLV6Ucf7+PwuUlkXriwd
 SbWgAXy78erMcoOjZeSiXbtkazjn2eIcs3YWp2EI4VQkHrR5PLbers1T4zq2QElM7JdDiUeZ
X-Proofpoint-ORIG-GUID: suPfh10IZ_NcTfeOfdREWS8-lcSREBq7
X-Proofpoint-GUID: suPfh10IZ_NcTfeOfdREWS8-lcSREBq7
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6863fae8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DIZIz7l0vq8MUqUDxOYA:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/usdt_parser_notes.c             | 17 ++++++
 test/unittest/usdt/tst.encoded_hyphens.r  |  0
 test/unittest/usdt/tst.encoded_hyphens.sh | 74 +++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 test/unittest/usdt/tst.encoded_hyphens.r
 create mode 100755 test/unittest/usdt/tst.encoded_hyphens.sh

diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index fb57f119..d3d744fb 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -471,6 +471,23 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	}
 	prbt.off = off;
 
+	/*
+	 * If the probe name has encoded hyphens, perform in-place changing
+	 * from "__" into "-".
+	 */
+	if (strstr(prbt.prb, "__") != NULL) {
+		char		*q;
+		const char	*s = prbt.prb, *e = p;
+
+		for (q = (char *)s; s < e; s++, q++) {
+			if (s[0] == '_' && s[1] == '_') {
+				*q = '-';
+				s++;
+			} else if (s > q)
+				*q = *s;
+		}
+	}
+
 	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
 		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
 			usdt_error(out, ENOMEM, "Failed to allocate probe");
diff --git a/test/unittest/usdt/tst.encoded_hyphens.r b/test/unittest/usdt/tst.encoded_hyphens.r
new file mode 100644
index 00000000..e69de29b
diff --git a/test/unittest/usdt/tst.encoded_hyphens.sh b/test/unittest/usdt/tst.encoded_hyphens.sh
new file mode 100755
index 00000000..90608e25
--- /dev/null
+++ b/test/unittest/usdt/tst.encoded_hyphens.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/usdt-entryreturn.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > test.c <<EOF
+#include <sys/sdt.h>
+
+int
+main(int argc, char **argv)
+{
+	DTRACE_PROBE(test_prov, entry);
+	DTRACE_PROBE(test_prov, __entry);
+	DTRACE_PROBE(test_prov, foo__entry);
+	DTRACE_PROBE(test_prov, carpentry);
+	DTRACE_PROBE(test_prov, miniatureturn);
+	DTRACE_PROBE(test_prov, foo__return);
+	DTRACE_PROBE(test_prov, __return);
+	/*
+	 * Unfortunately, a "return" probe is not currently possible due to
+	 * the conflict with a reserved word.
+	 */
+	DTRACE_PROBE(test_prov, done);
+}
+EOF
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe entry();
+	probe __entry();
+	probe foo__entry();
+	probe carpentry();
+	probe miniatureturn();
+	probe foo__return();
+	probe __return();
+	probe done();
+};
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace $dt_flags -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create USDT data" >& 2
+	exit 1
+fi
+${CC} ${LDFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+./test
+status=$?
+
+exit $status
-- 
2.43.5

