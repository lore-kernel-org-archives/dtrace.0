Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5A1D0786
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732043904; cv=fail; b=NrWzHx8VBTCAew8Dj+EODGcT0RgzAVFKOQZPQ3Hs7JihpaLaYJI0PkofpMv+PKPF8xm0YeIeRRy3UWOgt7l/FnEhBIiE49gljY8cA0S4+WX1zY9Cy+ft+iKnN+hnUUf7B/o0/2tq1lJFHwJdSJGNEHu2vyeF4zVKWUoeB++BB1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732043904; c=relaxed/simple;
	bh=bC1syff9ziVc1ZnPIwLJNXVd090RnYmG5zS6TRKvJM4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=clwgOIKifDL5jo4W/C1HH8h7bJFXcL0hwJ9+OpAcye682O0rcD2dd1ShAAuMhT8tz/5Qa1/lMUAn9DS7FhvjsUbV++g02qfm3WdcKka//ZtXy7ZmAzHzPNn1rCRHtL5q3X9EuRPZNKxlvAWaIKNuretAQ19G22QX7k3to6sFkAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kxK01avU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zOtVv7a7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kxK01avU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zOtVv7a7"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIMYrv018849
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=gUuHNgNRh89vXtxFZYAlKorNcWWzkseQhg8awyUMgOI=; b=
	kxK01avUD41j7o8aX2R8sJGhuEogE+Tq8pT1f+LqZvYbG5ezPCY3FAVsvDfucrTc
	BsDLks7G4SMnfgO2W/0/O3dPRdwz/uLipEdWTNAvPlQVnPIswVfG3eMXWdFnvmiP
	2WOxT7HH/pxc+/DMkoWlun+TEt8Be8QtATvddX0sl9CZDaHFx9B4VcS+Xv1U4WX2
	0LQf273Zz5ePtBL3yXT78z6qUOMbuhA/dP6eoWG6qb9OiEJe2Rr2o68yrfPSaxQi
	HBjrdlqnMSzNp0ev4zVURM/BEiJCRAMEVtfvlCiRjacCLjMoYuZ29B4zC9FTgHAt
	YAqRweAR2qD6XAWRulffFw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xhtc5trj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:18:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJI1UYR023316
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:18:21 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhu9ds66-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:18:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDA2XOi1uiZeRzLybhfO1CpD1EcpxTEZWP33jtSz5eiaGIlngzoazaxDV6jG19dHuYDuvrgCcvjQOtpqCZU9Ca+VCbD7OYLZvdFxKvE6IVWvYhxpqF3VH72X8zagFF+FkTiZFeSp7MEnWs6cnn8kq3JVeZGBIwmP5V5qCMJ2ChObaQJrb2clvBN/jqcL39VHsV9+WeMXP76vR3PE/lEKhuTWJf6r0kKbctcvKM1n6MnHU6MVVJkvPEWYfifGzPJoTwwDe2k/RTJmYALo0sh08orX855lgrhk8PbFHalIQd8ZImnSWtp05c++GUMNWvw688RfeHawItyboR9PRZ81dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUuHNgNRh89vXtxFZYAlKorNcWWzkseQhg8awyUMgOI=;
 b=XjCChmzlFBCIVv1yLScWM4xG3ldTcfjI3da+vCMP0XW4lO5bPVV7GN1jI+C6kuzIa9wABdL5gRzddGheqahZE5HffYlY7c5Wdd45fCp7DKRjEc7ZhrU4TXbdiboGsdnfwCA7y2pL8LeUNQQL/kWay8g8wWamfsRiQogGtN4gyG6xe+SN5UZ6SzUN7fIZgfUcIWDqaSZ+a8Vou3BWQGVTqp5i5hYiAmrkf6a2wHn8Stg69XOki8Nyk74nmWrv/+g4JltgZUazh+XMD9dICq6H17pUjMczHC4jjRjh+/VmVX9ogs51Vbd7PshPDTs0tRz1jfH8QpWFVwdLctSnfEroxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUuHNgNRh89vXtxFZYAlKorNcWWzkseQhg8awyUMgOI=;
 b=zOtVv7a74Bm857pDuyp02d38blO7FdKrfg0Bm+i+bFMZ5gRMB4u/s84MUZSZpsIoPFr5E2zHfgRfe8B51SjnxurSXWs3z+9XIl/S5KsGFCQTnbwwN1dgbNO/fKubh0+faxgR+1IRTho1NK34B9w/DOoqmWCzpdHhfUmtUMregVE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4539.namprd10.prod.outlook.com (2603:10b6:806:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 19:18:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 19:18:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Change open() to openat() in specopen
Date: Tue, 19 Nov 2024 14:18:15 -0500
Message-Id: <20241119191815.17767-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:208:236::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 0085a96f-e9e8-435d-50e4-08dd08ceec46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9qZH58HA/JgWGKGWNqI66ZOLntpsKy3NVG1P/l4wA7D+WTWfTGaBnnkLFWhx?=
 =?us-ascii?Q?dZ8eztxCt+NZSVGFBXY/T/6/DNOAX6Gyqtof0RcgN5EC9E1xEuYCEvvd8XI8?=
 =?us-ascii?Q?jiiHVZQQQtWdgPCw7Nf2MWleFVTdGwb8Jx/EuDB3j0L4heCzxcJ2hCmRPG1L?=
 =?us-ascii?Q?LjK0DbCw08zN/QMTzZET2OLA8JLOslIYXUtQl+wQOMyUXkoHG7a46RRz67hs?=
 =?us-ascii?Q?AF8VJQNCIgOiBFalfkeEeVY+f5kjy+Q6GJZBnD0Ys659HBX+gUg5nvD4eJca?=
 =?us-ascii?Q?mnet7CTPrp6R6iLA019PVqrqqh1J13R3mQQq0BEtsnE+ThRdbGkkjvfPdrnA?=
 =?us-ascii?Q?3RcXOGvBcPo5G3dZq1AqvDBqEhIIeYeDyfDlapHymPwqrMU5WQYabc2zTUuB?=
 =?us-ascii?Q?NR8tAP6F9mFGPAw2oHpD0hMXM8R+kZfmEYZFMp0IkBzOBlPcGchiTDMfXzFk?=
 =?us-ascii?Q?ir+/TwpFkbrATXA3YxAxF8sbXHnBBLYvLrHLL2MR92EdJwPkSKZpNCtqYOuI?=
 =?us-ascii?Q?zKTvSu47uBLZejhGhlgUDAgnkxj4eYlBO+/B6xrSQwEYgNANdIerchjHrWu0?=
 =?us-ascii?Q?LdqW12XsXoACLXTQFH7l/tcqRZQCfQK115xGBUbaWwFIQRyFWGfqkYMrC7Ql?=
 =?us-ascii?Q?2mU+zUOQp5ncR5Lq4L4blf7dTnqBRhRoIubOLk+b2zLQaGjA2bFBI4KOCosQ?=
 =?us-ascii?Q?b/yxxKK69zcYsf/jKDYhvwJ1YvzW9q1d5WExo4ELFTLNBTwthqjXSB+7LoKN?=
 =?us-ascii?Q?3+gv3MyQqvsBJdZirWyET/crFfEN17ihTlgirNJIaGt0jFs/mieQQi/OPwUe?=
 =?us-ascii?Q?Ad9dkMhrYmFIHRzjpOKdD6Xf21pI3QN3bMqoZ70sK5L92yExkAXnPjSmZ553?=
 =?us-ascii?Q?u1io39iwhsxU+IkFkXI4TM9pY2D2WpU3vsm0lWsw0g5ghKBrCAthKkNABgkN?=
 =?us-ascii?Q?XogVVDGw4U6xZzL/HiGGx14cDvH/UEJH9AFeGLPD1axubX40BjAhvOeWtBE0?=
 =?us-ascii?Q?97GkVXxRPLiKekqOgUHztd0t4ThZnf8f055lkBVON+YSWBf8tc2j2d3iKQFz?=
 =?us-ascii?Q?RdzbdgMf1iC52A5zvcc/P7U9hgLarOocMHfryHihP2DgJ53g4vp6yOWp4cWk?=
 =?us-ascii?Q?C+grZgskk4bA8INupxx58Ifp5vd+SXmHSDURBcMwUFHkmHu2HtrJnKoH/8/p?=
 =?us-ascii?Q?IDyf+4OTkrP1PxlNm6mShJsmJF3L15Ii7Xy/OXE1oBQfreTVYgKSasTYViuK?=
 =?us-ascii?Q?MmT43vyxksePqWcpLMhBo7/uueHdbTYUI01N2V+mhA6GFnsqFIj7oCaGy1vk?=
 =?us-ascii?Q?f/vG7B2WprxNabXA+b5SH/YS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F5z/Vy4UAtyWVICujuD8EOehxU+2D4PYS75wgwxR0GVeDu4iMcfoo0UrpQEt?=
 =?us-ascii?Q?veok1IgH1o0xdglioMhuf071eqEGwAPti3ATsmJYIxNhuwpiu5TMgWjRg9NH?=
 =?us-ascii?Q?aHEo/JV7OduzsNCTBPbTmpY0qnn3+PM3tzDtjJpELxO+a652zm8zjHEkvrHV?=
 =?us-ascii?Q?OR9T7ZN1KpqDx+qZjS2BjgQt2Im7jOjkx8hvaKiCoQxk6WI8NbTTx80kPNYU?=
 =?us-ascii?Q?cgTRx8oh7WSMKQ8bLLYnfOUBInTISMJiGgvFSBoZb09ty0cQSb0Caq6dEUGN?=
 =?us-ascii?Q?NnFd2EGg8YulEftClXTSzfhwEjmt1XyCLnxrhk07mRg0FKkDcfR00LO0Bvwz?=
 =?us-ascii?Q?h+jWsU9eLh/iswYbzrNUn2v0fJl4/qLgVrqonQR21ezITtaA27xsB3u2FkCW?=
 =?us-ascii?Q?xukcE6yKGCc8x1wec06gqr6iqqF7/1JXB3ThV2Cd9HGht6R6UFVYffeFUeEe?=
 =?us-ascii?Q?IvUnffcTpmlHC2DGPitFdi4aEDDT9YhRAqq5LdpaVq/ofFLKE34WQn/V1w/i?=
 =?us-ascii?Q?1MhJYNp9EOtSgmhKHGL9MAfaWbn2+ZDSqvuuEvrl0KDLWfmubk/k0QmS69yE?=
 =?us-ascii?Q?aZb9eXzged19lb5BmXGCb7SL13ruvRsQqGUs/pJBc3wO2Mvz6cCOAuX38Ox1?=
 =?us-ascii?Q?GoLaosHrf/pECeDDjCksPe8Qx6UCRNCB+nAg2QYb/LjnBSTdeN8vuSWJvhSL?=
 =?us-ascii?Q?WOtj+z1GLYuvA6LTFvZCE1L/d1vj74R2Hjk805Ui/jSaW5yX6ZFb8wfzoYWj?=
 =?us-ascii?Q?+smCeC7+cu0u+gHUZsEBWBz/Fy2o5Gg01h7bn6C/OwLHAFLRnv+G9lMgsYKM?=
 =?us-ascii?Q?VYCYPYJhxI7z0xIJyUMQrUdagU5uXnFRQ+oH+MhFZrl17GEEa5HWfTCm1JOC?=
 =?us-ascii?Q?hrSb6jO0vOVBpe29ijNTmqNTfXc+YUIi97nXeaJ1H+z3wyOZ861d9HyCpPH8?=
 =?us-ascii?Q?MlvVr2nlBsHE9+ppL4fhgOobjSvMHazO6IRoEYBkl1DOvLzbqEq8v2BBrsFJ?=
 =?us-ascii?Q?YTz6QqfTETofOCcnr+TgOfb4IoRXA6dzrI9ECwY5lTA5zplr1wvEZUAN/hBo?=
 =?us-ascii?Q?QlMvLT+C4uK4MrvmZ6nEALVd/IPZ0FabNT+TIZ3TsT6XJZ7/cGCgnJKTJ9Qk?=
 =?us-ascii?Q?3JLAXpE76KbQ1rk3mHdDlkIf9GirU1JgX2ywp0jOJAE0mfwIh22Z3hzMK8Jn?=
 =?us-ascii?Q?axuYTeKl4IQBOUhKtKbcdg3NIWLm/qXFD0TV2deHr9eAegEqxVxcGxGJZKUc?=
 =?us-ascii?Q?vQwBHUPLstdImblFq7E85GoC2gr04DQGK4VAbpCMxER3wtrvRA86USscM+9+?=
 =?us-ascii?Q?F44kn+Km4vWEa0weFf8tJrrqG1xvcuahJ59wFygHUiPJ7NouvYIy3IxUfT5u?=
 =?us-ascii?Q?m2TJ2rVEdjyW8bVejNhbPHYr3+H08nk6UuuyJzmQbWYFyW3B3+uZoZT1GTMh?=
 =?us-ascii?Q?iwcIqJQZVQRZHIG5ngx73+lAnFn/jiZm1E8xD/JLGW7aWxI6APRSuPdeq1LL?=
 =?us-ascii?Q?OiX9takK0qoO4BMPoq2ZQKXl/WFV/S/oQzOu6pHHq5hC5192QN4D2gPhEk9l?=
 =?us-ascii?Q?8CELNOxKpnLQUAs5zi9+i3DGMo4NZ03ZH6C6H0yj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gky6JTlueZBcfCokk+j057/KPWavDVlo8AQA92d7TGn5CAClAaCHfg8663i4mBWC1/msrKLQOU8VuBJ1nTFNQDZPq4Tku43B/Zw5WIyJFIncwNDVZ8b2QCxfRB/gGM6gxqhPu68XRskB1Ufx9+VJl5I3ZI5Z2ykZhDtFwVMqlMZkrYJAW2IYbG+1lzvOGiV5OQP9/EkoptKHNvxGZeRTsqjFN+x1/7gozkaBTGRIDMSMqCt5iI5WeFyUNiXQJll5Zh626aT7TPgtfFqLfd5r/7j0CQIPFONAqx5kQZdqg1bQMPqCGeF8LCyQ1K4cdIeBda3Eqb7QCVTDJWGMMPEbF/OiyXZS9g8pC9cNwJZKS+CDoJCsNoTrtTnUpFhj2m9ecLyB8VzTS36MKsTux5dwIgypweD34cBe6tTrRC7Tfj06SERZDBrOXXYMaGG3YBk7X/OMT3a7s2FP/eI3x7IPsUBYEmcSatYoIxGCrXPllRMroc3Qmp4Hy5JeHjaiZbZniR28cBT/6R46JYNxbbtfWOXZaL1bquSW2LHcmmKqFGC8BaLgv077YUe6kpbr01Cgvv9PRSGQZ7cCILujAph5WT/1/DFouPqvUJL+GtzF6iQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0085a96f-e9e8-435d-50e4-08dd08ceec46
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 19:18:17.8937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYNtG2Yqdeci/IL2Ad2HIPp2HEMo1rStLn1pp/Oy+t++bLmDouWNVHES0+3H8Fz+Epf43PQip0dkUtExcouHuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-19_10,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411190143
X-Proofpoint-GUID: fKAfmvrr5-NgIbyZlomo9CLZ03Ib8-py
X-Proofpoint-ORIG-GUID: fKAfmvrr5-NgIbyZlomo9CLZ03Ib8-py

From: Eugene Loh <eugene.loh@oracle.com>

In commit 751f8f46dd29 "test: Clean up tst.specopen.d", there was
minor cleanup to make this example run.  Actually, it should have
converted to openat() calls, since open() is deprecated.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/demo/spec/specopen.d | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
index 700bdd9ff..e7dbc3b25 100644
--- a/test/demo/spec/specopen.d
+++ b/test/demo/spec/specopen.d
@@ -7,7 +7,7 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-syscall::open:entry
+syscall::openat:entry
 {
 	/*
 	 * The call to speculation() creates a new speculation.  If this fails,
@@ -23,7 +23,7 @@ syscall::open:entry
 	 * speculatively traced; it will only appear in the data buffer if the
 	 * speculation is subsequently commited.
 	 */
-	printf("%s", stringof(copyinstr(arg0)));
+	printf("%s", stringof(copyinstr(arg1)));
 }
 
 fbt:::
@@ -35,20 +35,20 @@ fbt:::
 	speculate(self->spec);
 }
 
-syscall::open:return
+syscall::openat:return
 /self->spec/
 {
 	/*
 	 * To balance the output with the -F option, we want to be sure that
 	 * every entry has a matching return.  Because we speculated the
-	 * open entry above, we want to also speculate the open return.
+	 * openat entry above, we want to also speculate the openat return.
 	 * This is also a convenient time to trace the errno value.
 	 */
 	speculate(self->spec);
 	trace(errno);
 }
 
-syscall::open:return
+syscall::openat:return
 /self->spec && errno != 0/
 {
 	/*
@@ -58,7 +58,7 @@ syscall::open:return
 	self->spec = 0;
 }
 
-syscall::open:return
+syscall::openat:return
 /self->spec && errno == 0/
 {
 	/*
-- 
2.43.5

