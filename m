Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA8173
	for <dtrace@lists.linux.dev>; Tue,  3 Jun 2025 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748924516; cv=fail; b=XQnVO5OnjXzluE+k/5s1IBbEx4JZgn7scl6xgEntEopFbz9i968b8WdjpRP76sepGTPye1XROSmbGL3td1YuUyz6ohL2XS4LXWpT7j4aw1OKP5b2rtdduMv7rfgsWN15qAzBtMGmT2HiqhkFRHX3J7Re/Xk7ykArpNOivggoraQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748924516; c=relaxed/simple;
	bh=dsd7selHkrscC+EJiOtbi9cZg19VfQrtLV+u9DXOS58=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=g5TyKKtvzBSluF+K+z0jOmdbcAsAudFMEizELcnGK3u1wSu7VAwOkAMsHWXcnCjZXLTZKd2G8cRfpX7ZDg+xIrhaL35WWR2dZFf3BV9vSOoF5PAN4GIB7mgO1Do4ToVb/AxsDlnlPaCFLXSwJKXjvLwPNYRbQZUjmfubUTuVZ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h+pg2TGY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iNQbbm2n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h+pg2TGY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iNQbbm2n"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552LNUr8009807
	for <dtrace@lists.linux.dev>; Tue, 3 Jun 2025 04:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=B3FfB8YszcP/+kq6xTtkKcyLo9GdnURyUL20c2LdRrE=; b=
	h+pg2TGYftXkJyo1g9CRl1kG+M/qkC/ksF3g/xmfAEH3mRuQYQPQmcWV2fhLwXVk
	9QUn6Q4QEt/Wfuw0u4Kkn0+qd9h25azFlhTJHEauuD9sqtsVbPv1B5U4zqC5eJda
	j2UARe4ICmi5z7vodyEkHPeiOj152pfClNiTVtOS4FfyFYF/W6Kg4HrWs3n0KMl4
	su34ATBFA00WkFRUk551tnxllvEWD4fLDIVcmtL3hzkvtVLCDsMZ3Ec00xQ8hT1k
	CbSDJmMrsmtmL7vyOV3juZs3nyLCgIVSErDmE5IMNl3bd3fwHTyNcgbVp58WY+HX
	hxhHobZ+hT0m/t6ha5S7Wg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gah913e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Jun 2025 04:21:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55324c21030620
	for <dtrace@lists.linux.dev>; Tue, 3 Jun 2025 04:21:52 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr78sqvr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Jun 2025 04:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZfnXtuA1VMepH4jiVY58wPwWG/BDZ313YNWKecHOwMK7g+r+My7N4k28ha5JqWI8M9nrbhsmtkLspyN+bplCXTWlOD+G5gVkJulVa1/fCaNZsgvjNJBpHwWYF0XZI6h8FwOn8viFCUXsCRU/4SrqpGMOepe6KSehpC8j80oRbbYGtcZ4csJZl6rdDUR1y7kQxB2eku0AubzZmYFxJDv8njkqbqU9k95MuXUQ2NQZyafpDuVu9LRB4VtHCSD4pWHgvNWwCwP7LzSMDDNGw0T514KRhpYIt/LvQhpZ3pCrad9YN1+TG4LQoxNtepLTbHmT7XE1CnVyHfWlGli02SuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3FfB8YszcP/+kq6xTtkKcyLo9GdnURyUL20c2LdRrE=;
 b=gp1sj0c/rB2vtph6Sa1FvcdsU+9OPTzW9ANOZE00gEn7ah29oM09zSikKNhuhh3BwVBmGRHVN7kXjqHNeGm3Fwfa6f0GAcuZeKDg5Z+Oh5lE4o6wSm7lLgTR21dXhpPJ4PIxaQMPD6FRhY9VFsm/z45kdTNRfLYyv8VXOE4NksYWncw9Kji6ek5NXWydScHfW3FhJsOW1QBl0yQQ3gXr9LVkkdB5SOSu0nKSLFTav4zVnk8gtWnneSP+YPKlYh6nxeNr/MCcjZBZrS382kv4dhxh71YtXaaGFzHcebuoeymk9PSGxR93ie3WG5cxSSI/MDwQsnHRwPEZ2i3TdocwGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3FfB8YszcP/+kq6xTtkKcyLo9GdnURyUL20c2LdRrE=;
 b=iNQbbm2nUwRstONwE9sowheh6RySv8EBetqe/eBXSF/LvI9wyrZjEXGHe/HuQRcP/K9WtSW8xtn0DO92BAXStQ25XPo1i5chaaML3s+bXsDQ8CWF6kNVwWIAsmGGC1WiYg5KtLI//VbVl6vcePuwOy1fGwN6MA+Lie3ozt4dvzs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH4PR10MB8099.namprd10.prod.outlook.com (2603:10b6:610:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 04:21:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 04:21:50 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test:  Adapt USDT PC search for USDT LTO changes
Date: Tue,  3 Jun 2025 00:21:46 -0400
Message-Id: <20250603042146.11894-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0559.namprd03.prod.outlook.com
 (2603:10b6:408:138::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH4PR10MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8520bcb2-79f9-49f9-dbbd-08dda256291b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XjsQkdBwO12X2Q2F63kpmjZhDiis+xj+fRvzcN8YNnnzvMK80UwJni9HdXw1?=
 =?us-ascii?Q?qQVL/nIDnKMtggYw7BGViaqhiZi5Pzt25ppZjKgBgAsfEbWZ8U1+ltYBzsIQ?=
 =?us-ascii?Q?jkxJFcWlZdPFjq20fLemvpLJEfJ6dXnGQBm0LRpBWf9ZgZOABXHRIatGEJ7N?=
 =?us-ascii?Q?E0xGVbIRs08Xc/eHOl0kDS08OPlMaDLDVDhRF/N0ylcPaITO8OHEHn/p2T7E?=
 =?us-ascii?Q?xlpYEnGYtZmSmmJTTerqarQlHSPf/w84Ikdn5dHrrNY52F0Z8CK7d9k8usGj?=
 =?us-ascii?Q?Gy6siWewwHBC0uEerpdpSrZXnEI7AEoeOhgLf0uf0sUhpO9cgPUmzdk3UigY?=
 =?us-ascii?Q?YaRGuOyVhV/G1qFpfspuqCuosHW4buHAtLsJrA+FSyyyfE/RNiE/a/MzXT+O?=
 =?us-ascii?Q?a1nFqs6de+EXmg9oB9mnIwFS1jMLQIgMzG6DOX/B8zzPDIeERJVdTae9Sg+z?=
 =?us-ascii?Q?m861zazMzU/1o0mbeo0RdE1j4vsrpDMSERxnrcS6/+DCyeUDvbV/ZPlLthhN?=
 =?us-ascii?Q?KGFIZzILoLcSwbxmSTdmoEnuigMU07H9zKQC26oxjbZbvFku1FDgWrUG1pCr?=
 =?us-ascii?Q?6fcBYat+rwUqno/kzzgLwUk2Mukwyxrffx+1iMDup9h2BlSh6SThr6KtdS+Q?=
 =?us-ascii?Q?dimnS3LfUxboo8f8DqDq+0dXsX/xYu78OP2YZo3tH5o4M1xPchKfgPMCVl9l?=
 =?us-ascii?Q?pK+9WJe8Z9eXPA808ztbRLFLswe5mCGSDQ/rCgP0GZNtDe+/zMrmMCe+41BT?=
 =?us-ascii?Q?JtdA2Sb5u/UKEZ84iX+k7t6UwwAt1UiMnWRmSKaqz9ZqQkjkYzi8k4RaZyVj?=
 =?us-ascii?Q?x7CPReKnzQK7wg8qf9/vkj87v780029Gt8PFKsofhlmQcA1ikc31kIqklFJO?=
 =?us-ascii?Q?W4/C3Qwp5oD5FU5o2drp2CSR2n5ps7jaFSrSAdl2JZEtBy8cOO/5Hyid+Cy6?=
 =?us-ascii?Q?KGhO2acDhkVlLp3jC4n88skx3UedNNi5nc6cmbGI0TWkPKtLniYb2PNBNHi6?=
 =?us-ascii?Q?jhIsrMldFd19zRpcNdJc/zszLKcyK2zqmBtqooYKdGxxMTr5je7HHAapm29U?=
 =?us-ascii?Q?kzMYfQRVMzwV4E4CrNz2usbb6fNMCdxpb/eXmialsojnB57+4rgSz9vfq1mw?=
 =?us-ascii?Q?rgr9FT5hNMcbAmKj4hwm3KDdDXNoO5PGwBXrPD5MVQqXcqiGS/yXoZmGuIea?=
 =?us-ascii?Q?frgvBHifqo/fjuVgbNvcZJjL8HNjOHDU3ISBxWVY4qLk3KqwRL/Py57belJG?=
 =?us-ascii?Q?xv4mCjZm18f38rbwCt/fCNLdU+vKdqimLKj7dFWhkGcP8p5DrDy3semnJtKr?=
 =?us-ascii?Q?eUVa72Im82jbnKsQYCeLFHq3ydtwFVZJ5Lfg60bESv8iJPeqOoB/B3cclfzA?=
 =?us-ascii?Q?ML8cbJ7nvJIF+Yqd+V1+PUVpogra4aMNIX66Yv2bisy5ZqKIKIMTAe4vUOSS?=
 =?us-ascii?Q?AQI3iKstCfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPUSEDyDVptwC6oFpkJy7WQQc36Ker30aPWOvf3wVymJN4Vx8sQlDLp3JrDW?=
 =?us-ascii?Q?Cd7rkYy3uDE3lYQzLIyV9vp1WL+4fVYywa9mwb0hMGYhXMP/bNqcr3Cm2kLy?=
 =?us-ascii?Q?CWYtxUHWMw/ZkftvHcJFqhmquJT5gOyopXhx0/Hz4TyaSsjOH3O4ndFROrg0?=
 =?us-ascii?Q?UmwXfAyb6JQc2EFDXe+bk4vVET6sDJIAFiByaR73dmac1zP2dZFX4RTfYKXY?=
 =?us-ascii?Q?WJtc/RgaxL4p5/53Fr2vPm3B9szCrHM+iAdQU+vVB/ytkqqmX2d5W6F19703?=
 =?us-ascii?Q?Q8M/NFQcsvpe/SsVtcwiR5I6UbEF5zq10rEvGlNhFz0XWI0iU9MLnXPMpzbV?=
 =?us-ascii?Q?XPxlv8IQPJg0Cc7Lmmb52BnIVfIR9vMBlNdYjSVbgqKneahe7XwfTvt49yfF?=
 =?us-ascii?Q?C/1TYUIvu9tQWOz7dprMR63dnwI8nQXMvZF36IOnqIv3La6N3VT9mORtczqC?=
 =?us-ascii?Q?3U//K0zKJsGKxLgKa2dgxIWVhvF6f83UdbCsDMTYyJNZFi49Vra0e00FmZD+?=
 =?us-ascii?Q?fs3pUkbn7Vi+oLmm06OzrY4yXiN8yx4R1mB7OoeJ1cCIUtnpq4ssPOjw8F16?=
 =?us-ascii?Q?oyY+ZUHWA9F+SorP39YA++Sf6sppjKTPx+Z9oEPKL6OojxbSdW7HtkOOj973?=
 =?us-ascii?Q?9+sfdPY2bvxrzoPOSl6h4XTYps+ayZ2RB3CP7vn3xIOCfH8/9TtcrUAM+4Ry?=
 =?us-ascii?Q?8ecK/oJ6D1OM8XRKoyFKtOSPlkhNZH4h/nOeF/FzQuJqDNXp+QsHTLHYxqUL?=
 =?us-ascii?Q?uTaiMGjlm7UkN2ZdHdcbujJIIDDPHQuOUvQNvb5XiH1HxED+qRuvo4I1VAwD?=
 =?us-ascii?Q?YfYIrY0GmTAzOWMp1RiRxeuUntxbFpZ11s6C9R74TAVRSibv/0EWv7DlujZj?=
 =?us-ascii?Q?xu0lfzstnqlWkSo11OsHSMeWxb3pBQDIOlJgknzyoXHod7hI4Z3I2bbrQ1PL?=
 =?us-ascii?Q?kyHMkKTOa1uIWrK7RRSwqRn/g8fqrdIZIlEgHUo+bszro1qcuHLmeeQIYWDS?=
 =?us-ascii?Q?VhP7f0HuqTqZwrvTgQoahqr/UZMeZ37IfLkmxFJXLypBM9UrWD7qF9b6ylEN?=
 =?us-ascii?Q?HKNfuTQky6plSGbE2yLM+vlFsYlxfIrRRqjdAKZUmrIXgTAb9SGjvyo84IV4?=
 =?us-ascii?Q?hTWrWObt+WY6DXfa/nMtS11R/kM+1rujU/Ty6YUmrxnUEx5PWEB2QsepHF2w?=
 =?us-ascii?Q?bbzkD9jubU8Bd31AA0pB2SJ5pL4UdtRYDUZLIYencbsKV29S+62hFnv2eSDq?=
 =?us-ascii?Q?/zCSqrPifQ1uSLQgWMgS2+4CIBBCwwaLCItbjPkIcEm/uYaJRQmAF1YIrMOY?=
 =?us-ascii?Q?EsCVvzZWnVzmdpwynw6GoAvSslOgfewC6/JTVS/uOAuQnc5qXBPezf+gPmRd?=
 =?us-ascii?Q?19Gv1+rYHAX1wBjImykRfZoswcOgaeNPphq6tUPpSndQkNyrVhv93/V5+qNu?=
 =?us-ascii?Q?rfyIeQ/ePMs4KWst5vXqYQuUkLQDv2byOxYNn3eIY8tRBXuuoAOE+3kfrd+u?=
 =?us-ascii?Q?ZNiA/JnWMdwc0JfB4jFbRNNHwf2ZjniWC/Xb0PLCwr0XL+FKnDuV4n9yPxDj?=
 =?us-ascii?Q?PRZN9RyxuFK5gwe7FvYs2ViRfbTopZIbU5QaeqiS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D7Q9izmm+xX3BUHpP3D1ukHPuYAR923HiTtyhqfV4QyUWNIjH0NLpI+InCZ6hnSTKgqfHFvnCv6KjpXdyNFZdGq2R1myBd4iAb8v5VfXR9XIXX9FIYHBDYR1OJd5BFXch08Ap7bvA+bI7tmQevSnlgszTciY0RmgDY/RZoRwjNtz3JgDKMmy8Szo1NyXKtRpwyB24o2jiBHL9AtgxsVC/Xs7M8erRugr4A2MCPMznnr8P8VKYXafDSuWy0CoSCYqBGvTwYRIBqM1748fIfcmJyhm2Kk7Cft0Nz2H8p+SCpUIxCxK+EK6JzYVTFc1YnHqnOYhMaMmc0wsSN6ZAf8w45mmFaBijVm/r+HPnbalibJ3elHZP7o4q/JMW6hqPAbxG29q9sPnXuo3lIR+Aq54UBsPeNHTWgBG0rwf1a5kR/LFzqBj6abIRguR3mAERIj1fhsFkNwIYrVjnnHHYZSXEhWqoRFJHnTiZqJazLhElXZ6zm/TywNSrZ35GG+zqIWjRiwtq+1LiO/DOs1r4g4yRs60qKOULm0HTymdG947lelOLPaBehvjfTi67BRDpHwDkh22y5/uJISRqpfUtkcNtF/CeGypIk0yqUQ4n4c8cuw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8520bcb2-79f9-49f9-dbbd-08dda256291b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:21:49.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nfk9Np8ht9+URxyhHGmF57odNF3dSWchahqFbr4uZQp5f2N05enXKqMdbyGASG4Q1Iot2ghmwgz8hNDxDKC9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030035
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=683e7861 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=C1VMY0C3mZ2_8WTrQPgA:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: ab6TPNSybaA1btZsFXUdUyLJXqujTWU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAzNSBTYWx0ZWRfX9Deuu2LLs2pW ae5WRm8NfwVJYvQgb9gS/YyHwUaDZ69HENHy/0yK8dQWzQ7KsJoiS6yi4izksAzaO7GajXZjFXx pkth1nhYGc1SuXHzsXjAFc6DMDsqJPgkVT4jFc56os+b3zQayVpq3V+PKhNVV66k7Xh5z19+b2Z
 YavrzJNrx4eyXBOw2CeXMwTTDJVLbjt1w4HObU/+xOhsnCPMtMi5FLnPqgzk9EXoy7/B1OG+kDg PPgHgsDOAwqcdiTZPqcywjO6LOAZrKho+J+UKwyNV1rHhSkql/VAh5Wgec2BsNYnCK93OtRg+hd MUOdd0pPrZW/wUkjk27XVvGhVZiVPcrlZM+8ZeMZngiIHkWCnPVSzXyjd/Ltbic5AIgcwF5NKvg
 56k68ZOBkVBU3FAcwAPAHcTt7e+Ypdk/ZuNiG+KY5fl+0A1THKNVHM0nDwAV4K9KehgB+byv
X-Proofpoint-ORIG-GUID: ab6TPNSybaA1btZsFXUdUyLJXqujTWU3

From: Eugene Loh <eugene.loh@oracle.com>

To check USDT PCs, we looked at disassembly for characteristics that
indicated USDT probes.

With LTO, however, USDT instrumentation has changed.

Therefore, use showUSDT in tst.pidprobes.sh to extract USDT PCs.

Note that tst.pidargs.sh and tst.pidargmap.sh depend on
tst.pidprobes.sh.  Therefore, those tests also benefit from this change.
They do not yet pass, however, since index 0 for args[] is said to be
out of range.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c          |   2 +-
 test/unittest/usdt/tst.pidprobes.sh | 114 ++++++++++------------------
 2 files changed, 40 insertions(+), 76 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 26f513fe..aecb07d5 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -901,7 +901,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.fun = "";
 	pd.prb = prb;
 
-fprintf(stderr, "Underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv, psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
+// fprintf(stderr, "Underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv, psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
 	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
 		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
 	uprp = dt_probe_lookup(dtp, &pd);
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 0c75d796..6a1fa984 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -19,6 +19,7 @@ mapping=${3:-}
 
 # Set up test directory.
 
+d=`pwd`
 DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
 mkdir -p $DIRNAME
 cd $DIRNAME
@@ -74,9 +75,6 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
 fi
-if [[ `uname -m` = "aarch64" ]]; then
-	objdump -d main.o > disasm_foo.txt.before
-fi
 $dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
@@ -183,84 +181,50 @@ if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
 fi
 pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
 
-# From the disassembly, get the PCs for USDT probes.
-# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
-# what sequence of instructions signal a USDT probe.
-
-if [[ `uname -m` = "x86_64" ]]; then
-
-	# It is the first of five nop instructions in a row.
-	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
-	# as well as whether they are nop.
-
-	usdt_pcs_all=`awk '
-	BEGIN {
-		pc6 = -1; is_nop6 = 0;
-		pc5 = -1; is_nop5 = 0;
-		pc4 = -1; is_nop4 = 0;
-		pc3 = -1; is_nop3 = 0;
-		pc2 = -1; is_nop2 = 0;
-		pc1 = -1; is_nop1 = 0;
+# From showUSDT output, get the PCs for USDT probes.  We look for output like:
+#     Note usdt, type N:
+#       Offset 0xoffset
+#       Function Offset 0xfoffset
+#       Probe pyramid::foo:entry
+$d/test/utils/showUSDT main | awk '
+/^ *Note usdt, type / {
+	getline;
+	if (!match($0, /^ *Offset *0x[0-9a-f]* *$/)) {
+		print "ERROR: expect Offset";
+		exit(1);
 	}
-	{
-		# pc0 is current instruction
-		pc0 = strtonum("0x"$1);
-
-		# decide whether it is a nop
-		is_nop0 = 0;
-		if (NF == 3 &&
-		    $2 == "90" &&
-		    $3 == "nop")
-			is_nop0 = 1;
-
-		# report if pc[-5] is a USDT instruction
-		if (is_nop6 == 0 &&
-		    is_nop5 == 1 &&
-		    is_nop4 == 1 &&
-		    is_nop3 == 1 &&
-		    is_nop2 == 1 &&
-		    is_nop1 == 1 &&
-		    is_nop0 == 0)
-			print pc5;
-
-		# prepare advance to next instruction
-		pc6 = pc5;  is_nop6 = is_nop5;
-		pc5 = pc4;  is_nop5 = is_nop4;
-		pc4 = pc3;  is_nop4 = is_nop3;
-		pc3 = pc2;  is_nop3 = is_nop2;
-		pc2 = pc1;  is_nop2 = is_nop1;
-		pc1 = pc0;  is_nop1 = is_nop0;
-	}' disasm_foo.txt`
-
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
-		cat disasm_foo.txt
-		exit 1
-	fi
+	off = strtonum($2);
 
-	# Separate them into regular and is-enabled PCs.
-	# We assume they alternate.
-	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
-	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
+	getline;
+	if (!match($0, /^ *Function Offset *0x[0-9a-f]* *$/)) {
+		print "ERROR: expect Function Offset";
+		exit(1);
+	}
 
-elif [[ `uname -m` = "aarch64" ]]; then
+	getline;
+	if (!match($0, /^ *Probe pyramid::foo:entry/)) {
+		print "ERROR: expect Probe pyramid::foo:entry";
+		exit(1);
+	}
 
-	# The initial compilation of foo() makes it obvious where the
-	# USDT probes are.  We just have to add the function offset in.
-	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
-	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
+	print off, $0;
+} ' > usdt_pcs.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: showUSDT output to awk
+	$d/test/utils/showUSDT main
+	exit 1
+fi
+usdt_pcs=`awk '!/is-enabled/ { sub("0x", ""); print $1}' usdt_pcs.txt`
+usdt_pcs_isenabled=`awk '/is-enabled/ { sub("0x", ""); print $1}' usdt_pcs.txt`
 
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
-	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
-		cat disasm_foo.txt.before
-		exit 1
-	fi
+# We expect 2 USDT probes plus 2 is-enabled.
 
-else
-	echo ERROR unrecognized machine hardware name
+if [ `echo $usdt_pcs           | awk '{print NF}'` -ne 2 ]; then
+	echo ERROR: expected 2 USDT regular probes but got $usdt_pcs
+	exit 1
+fi
+if [ `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
+	echo ERROR: expected 2 USDT is-enabled probes but got $usdt_pcs_isenabled
 	exit 1
 fi
 
-- 
2.43.5

