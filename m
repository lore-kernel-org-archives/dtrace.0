Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130F4188A0C
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143885; cv=fail; b=r3d/M3ZrVfKZNo2Fb2jAmPWzlH4eHu4qB3qPj7UkiNvdjIobsGilKms42T9S1yHHJwtFLoJ9hIbU24lajEh32QOK4vj9gk1//dO7AIzKW1aDGTQXltOh8dVHqakLeAHF6vmPf8bzVbD02/KHKd0qHNS4Xd8KL+Yeoqxxc30bNtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143885; c=relaxed/simple;
	bh=CfgVkRKLXEC/PuZR1PnHvVIlDoClkwr/daessx7Ytrw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=urSi4A7L1JJvC5kaq9lt/OvWXGwQVfDGw9OBE6wR+jGRQFPj1TDeqlZd37+2Z7+qSELvBA2odaxxGPq4bVtmCEB7xFu5hRZPbhEjzPgvHfmxtaIRlJtwZCAoewPPidNm0MNIcN2KOFZ/DZSKW/NGB7MbqAnxL42J0M8P6EiP2p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ApNfC307; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vFZd0EVv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ApNfC307";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vFZd0EVv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLu0V6019560
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=4xXrQrJlepJP3VeW8aFENJGdI3o7yazAM9yOdUAYP2o=; b=
	ApNfC307bG575VYJgd/E7cFYCfRmTaLwzKPFaBfDR5c/bVBvMUZm3A/3ol2q6BzD
	hCjF4aYt/rjP1ZZw+C9zK/SbeZbVtJkQjG/G2HCzF8sc3LEIMLNgz0G4D0WPtoiS
	G55ORygHlkmiKi6qLq9Xy3roMahH4jC7mNehsWsEc20rp2A8scRBS7TUkN87iuA9
	9QpuAPf7tcRf07ISYhUbns9mPtcMMJBqpLsVcbdTg88UTvEJhUCJu7Ryg6bT+fMP
	8FRj/f7/k2tFtf84qhgmXulRakvrkXfAjHR1EbGGFi162azzFomkM5OtayLP0heb
	bd396MxOdXt4HhO7VDJNnQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcf8xq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57E1T1gp030166
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsc71m4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdkodDGwRSAG12OjTdZUHQ3ZX4CzfErVwZ2+q4KpAEor+c4KxFn4ZVSfrtJY1nJCb7jfywXGuExVVHmjlWt2K2Fr3TAxDAjuizLduwVj9gEia61o7qoc35VnEAHZ02HPn+Mh9ej4n4+pnTKtZMiARKSMbKb+D4cTia2Ai2rauPLvt0BiKypOQUFXXE6FBlTaUNgOXHKvbkhqKQNa7gYoAQrpnZePctHUqZP+761f/Hmcyalx5fvpmGEVR0v3zHDOyEPB58bWIlGrUQtvmP32dkFQnFFHok6lDL75ztdZ9QewrAWZc3/PMUExLS78pBPZ4DhpFwGfxlZXzdOoRQIzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xXrQrJlepJP3VeW8aFENJGdI3o7yazAM9yOdUAYP2o=;
 b=kt9U0T/sM7DNnp3QBUD5kqMmp2DETH5u36osh3TLUt/cFjOqdwJzhw+PypAyH1BwaqysG0+r9vtqCnec46CKj5AXYjDA0WwuWQfm8+MPBR7Nwd8g0DD6BS57rxp9odUNlFfGOWMWy6GG0FHdvgjsE/e7E9cCAzzDh0VmfW4U0PYb3Ochf83Wt/lfdendyEnaM+tbek6L/yC4ZeHTb1YZvNoR1bV+f/BQTG9H5rvjPjgQaNon0045YsAiGZ0lLU5A/8hz5n6gtzFKTuwAlJAK05BUKPuDEz+avUcBDznKiwlOm37i+G5lr75N2CCtq7Ev9xKOCbvFYqnEhQ45+FqCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xXrQrJlepJP3VeW8aFENJGdI3o7yazAM9yOdUAYP2o=;
 b=vFZd0EVvYJ+rk0suIkJeQrm7VY4VTx5SVqaatnB0yp+/kC91PrLa5GYWiK4HEhsYMyw3oYNnOiJ9NgtgskC2rsdE94NvJ0bSiVpU7U/MhTzabhvUZKj4GVfLEt/6qEc401of1wCA9U+oGE0M8sMnajP2XL4GGqdKXNocCSxhV+0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MW5PR10MB5875.namprd10.prod.outlook.com (2603:10b6:303:191::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 03:57:58 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 03:57:58 +0000
Date: Wed, 13 Aug 2025 23:57:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] string: ensure string size is handled correctly
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672AF8E9BAC559BEDBB4F7DC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MW5PR10MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: d906a176-ed7e-4684-af6e-08dddae6c162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9gMabcBDPBEbBSxl1b/dSUhzZ40iQPNtmVSCcBVGBi4L0wgYHioahvaj+tfB?=
 =?us-ascii?Q?YTQWDHJ3RchRYIzRsO9W3tLJNEeyw0AfZ0FotTFjPJ56N8M150BamskUwPtF?=
 =?us-ascii?Q?1ZdS0De6+P5hZbtGXAvDJpN3vmtS9KTKQduIH2eernb8nin8/n4M34KcOEUR?=
 =?us-ascii?Q?X6/gCNbIFHjCFYTXCdOoRVBw0ZK0Ob2VZu3bAW6GjV0TkHtxZgWO3fIuyRoi?=
 =?us-ascii?Q?pD1UnymOl9MMIo/YUV1Mm40luHeF6bhoxdDQbzX8PMkpBjgppFxzz/Et2xn/?=
 =?us-ascii?Q?bEVvRDyUdDw/a8vVtQtQxTm6y/xLbxT2EG4E5TLjv40bmaz+nTwUovtKSHaI?=
 =?us-ascii?Q?W9ML7HvQZMjy1FtKZ4vlvCgdXB4scdH9X40s/5vJWyAl6PojjcyCPNTMAbb2?=
 =?us-ascii?Q?UyCzgMElI2kvzEAoYp9cF33+1/Qw7MTPKERUtOv3OwB34eVig5Uf2GXjCsni?=
 =?us-ascii?Q?ICo3aQp649RlJb2vfe7H7O/QOQQ0/k8jXKVZEnfMUw4GxfmlTn0O2l0/0N7t?=
 =?us-ascii?Q?QbYGK6OcIRFnePBMK2i91+dx3jqU2BFbhg5/UctwbUjQb5mFfFCJkQaXwkiI?=
 =?us-ascii?Q?+LD//QL2cT+E3BIH+buO9KfDaCLYIctN495wbtncRe+muyywCrORVQ1fMnh0?=
 =?us-ascii?Q?jO9/PH0i/IvSmfY3aYrUgOoRJU6aGUS+O5kdXLUu5Sf8q0wdkjZi9u7jxb69?=
 =?us-ascii?Q?F4jV5/kGyh8AbCk66wFAU6mUZbzbT8JRKxgHbV7aVvh3lmNOlkAsBnE0klAH?=
 =?us-ascii?Q?Jh45z4yhDVrSt9snG4lYYxrZtg0PmelVO31I2K56HP8P0lgQiBeINlfQhgQc?=
 =?us-ascii?Q?D1viRd5BR39N/9db/kHM1PmUyHT6vVtnS24i9qOgP9dNn85q8pQ7XxXZHPhF?=
 =?us-ascii?Q?nIfRydq01N6bkv2EvyPnRlFZXYth4y/N0XSmndPrsCbAn9z1zniXMYxKm4n1?=
 =?us-ascii?Q?W9KphnBfA7+jF+hmwZX8V4Jc8AmSeuLa+lcDFvMYHkJyIk1fk1tbGcansndN?=
 =?us-ascii?Q?WEYrM4+gLNAE19Lf+Oi2cIrf9kiS22JRBy8YvwBv5s+pxhbgmbzK5QxyQxMf?=
 =?us-ascii?Q?gNrPhbgprO1w6MS57j+xetXqjMN9GcW7hcR/qzu4WpMBJqEsztPCiESHeeLj?=
 =?us-ascii?Q?73Xtwoj1FxH1WE4LHjEqeVSlCT3UK9tmdpOMUzaOeaXV31wuRlT132DdU+RN?=
 =?us-ascii?Q?rKBZ+u+n2qOIra7qEqm3SJA4i8i5U8liRnmRgIX/eJzfNUNLSGfzKUtbORPD?=
 =?us-ascii?Q?h60z6/ft+tAuqETm6293UYEcSS2Zxuy7NufU9zfgaitQtNCaKkUCXYrfV6eU?=
 =?us-ascii?Q?ExZAbwtbVdhDkYBAFRrpITSZxfEpO2V+I0OKyDvzeeoWgSk4c7YWq6d48DBa?=
 =?us-ascii?Q?uR8eq9UIfbdfKol8CYqBBxrvVjJ/M696qPZpLxiWQ1cr/LlrfNkn9NK/o89K?=
 =?us-ascii?Q?FA4NAxpHV84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?izNRaPnxwLbfx8iWi9CV5NEoD/ZaPCe6MyEszVvV5obHJn83BaCCtGrgaCq3?=
 =?us-ascii?Q?Pxb2DRjQuwn6ppVzU9AWjvbS2GNDro9VJPkQh9HUQe1ZHvjbkWE6WJ+lHXvl?=
 =?us-ascii?Q?Cb1ALJDdz+mHkq6BvuZgO++riPJ6hSigw+0th0hR3yEbDQsi7Dm6JaPHga+N?=
 =?us-ascii?Q?s/jofcYcfNcwk/z2rs0ixZ9gPoLH/75llaFtpvZ31Nhx7rBk5q+fS5JlDEUC?=
 =?us-ascii?Q?4uQnXhOmbArfO6cMDOVKjtof2qCj+rhaXuzQFvlL6mTchpHGz0765XNTtjsB?=
 =?us-ascii?Q?jHbUqaZB602skVahOWeWY8kh93DsWkyuBtUYaGYj4pTrUClNXsIv1PhKB0gv?=
 =?us-ascii?Q?N09VGto1CKh6UQjBUYrEH5/sZw070q9fQ4dG3yrfQS/5xiQoeQ/UYO/C1M52?=
 =?us-ascii?Q?IAy+d0KrAfSYkUDWS8gUKHEinIO4Qt1HMGbneGcl7W49PSM6hfHdCrGaDhuG?=
 =?us-ascii?Q?OFx/b+x7QHiWGI0WGs7fyr26L1C2YmDfaWIw26DgnBl8MEwgqNSQL6dOIdC5?=
 =?us-ascii?Q?wQ33j5i2yZ60U8xjzcE0mIlxR5hVBV68d5ZHLytDyvMUWcbstdiMHYOeOmYA?=
 =?us-ascii?Q?TR17KG8Z+20T+rNk+TI771JiiL4GWMpfVUUYehWsNlxwvfFbKl6t86zSfKAY?=
 =?us-ascii?Q?J+j8IIg/Rptjp12oCspkZ1D6Re4lFFL3QThCDRae1RE8xg6R3uRHVPobrYPW?=
 =?us-ascii?Q?moXfn+HVBy5pVaEqWLJnXvpHOElhJT9nj3ScM8CiPhzm7dPTCw5tFAzBLBfg?=
 =?us-ascii?Q?Lz5ffoJz18sjim0srZ+qKOWarMQMV25LMTg04g+DCyw4s1JdENeT+zqDNix7?=
 =?us-ascii?Q?lYmozp+LhSNx832zMUuMRmYKoBsK3txtRD+r2wOyc2TnUEdaag6rMHyPUCmZ?=
 =?us-ascii?Q?JdXUEZkVGBeVUAPkcHg+dGVj9huSdwPEbslmMj53/FawHPGvgzhk+d4IRj+u?=
 =?us-ascii?Q?iU3NV7XIEu66zET5eAopAyzDgI9/zO0gjRJ91xU3LJsAFUy2zcWjE+skhYy0?=
 =?us-ascii?Q?9zgdMQnK+aF8EOXmhIaQRR0ySTnu6d3Q2/43lZ4+cM21zKZt1Jm+ytkcdSDn?=
 =?us-ascii?Q?NyZ1V3qgnF+o6h7s6Fr7s2i72ykPcsmHji+o3+1ZTO5PWaTvPPB3X/IV4MiW?=
 =?us-ascii?Q?3PQzibN8DHFSwVsSELhY1GOvFbV2wzzLiq55xDgNWfvveLqMnCt9NWyLxgBT?=
 =?us-ascii?Q?7jXAo4etU2Dq8HscZE2CTRJb1qxMlovgWuqI5J0PkoAVIGvVwmO8qMgrNRQa?=
 =?us-ascii?Q?3ksCo2D1BKFU6BDG4KgkjoyDEV5IPstR4uJF42TjTCwIYQLq4wRggp+sfumo?=
 =?us-ascii?Q?HVuBblp74/HILeKzJF90Nu0owNs3QPrsVEP1E4Qf9R9swgTBYBEbsxLjRb5M?=
 =?us-ascii?Q?aGU1K5ch+UPxbtP8xPuzzZgA7rHTq4YmupmlutYbPdjzKHO5bGpza2+5Ba55?=
 =?us-ascii?Q?ws+xksNT6JNpG44G2be4b3VVTwjmcgMxnFXF1LTH6iNWRlqs3mtcIvFDwawj?=
 =?us-ascii?Q?1tG9hocf/0nc4UObJ77Xs7Mr9/TPbEwRsxxXh0XdMZxIy/16EXygBHX+cwDx?=
 =?us-ascii?Q?EKvPyWd9KFsFjUnljJuHXipzvl5NruhBscO7xQOOzK/rvRT2XbPBHOTDOzEW?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PExi2z5215H+wz3K8GTH7rEMUoJhE1nUTU4dOl6CfkQN8STV7AIzCdw9PcsSvS+3oBHAm/7wUg5hHcH+kklvDvK7tApq8nCE/MqdO4CKnFx04WbRsDDweo9kkkI/EGx/bfwWVfY6hf8Yh2nA7P7P/T4W4tNcIaEWXMvNFZ+BQ0sphlt1XO2CvRmm0vAFHtOMkoNyC/+2jynG3k++fednA8Jj4f7IA7mzcne8WeoNIttldF7vCxUoAlBzMyXp3uMWtLE8I/5t/AJ0/sDScSoihu36XMAhU5Cp34E8gX4g4+5rQCOCTtzLgO6TwgVUcjkoCg5dX5rebYTstw1YEoN/W/bHndNORwROMnR5NiwChjD4g+8wdOYzH+MlKTBFmS3nacAncCyhmsufNPjF/U08GcbCuwRggFCJLLEwyNWae2CINNasdnlQhGtjFrW59H6lpW/hUzo5zH/j97F1CrtM6XVodshRERNzlOjoFYBWPEWVsBUosZExJGu6NQ2kw6YfWe7konFGORHWLG7B8SB14w1oAQ4HUzHzG6Ig+TU5ZaW9Ad1GDUhrwSth+QnBfZ0p3sZDEm1J8whvcaFjrwY5KWZv7OoW43glxaUlCPqqGY4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d906a176-ed7e-4684-af6e-08dddae6c162
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 03:57:57.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlKgv+ME6009TsYKFmXD5W9q2zJfJpvR4aZts0I2weiAVCtxacnh4x6Ia23jB0AVbAh7Sdog2e7UUKHxZ3DkQyNOBP9zRGMeaK+zcmaeIj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5875
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140027
X-Proofpoint-GUID: C3D0WxClENd-SGGmBywtJj50X8NvYsHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDAyOCBTYWx0ZWRfX5Ze/jt1vbCdQ
 KXv8GYzG8ZKwhKn5+pWGHq00XfcajetW8v8CJmLRXbBsGwBcIgt/mSaWA0F7i0I5IyDbAIZHnOw
 28f1DjDU9N9yg9WPxWTMnQiTc49H512GNIUsdAAiiUrT0uhdusK19MZ0DE9604K/GU5qu0najo8
 t+5g3KSCrGVgvOVipn2D6LKBPLB4eLsGTB7TgKCYcWL2FZJr8TfMQCvh4txSPgPjNHqjoApdZrk
 Iuh4cuDbCik7BgNA3RtjNVsq+8eTnvPZwMls729zOT5frYYsAtVcR+7qlnyL7EDkGU9zebZy9x0
 0SymEYVZbcFnlOt8IICpbzPZgQe2cijivLN5bzH5rQeg2tBy/TxGIMzE+uHFZcybFZVLvaCimO9
 at8va1A1cnMF+c82IJVYWAnf3DvQaldSYcVGWDsiVoyS3KJK/Dd38a2g9778P+5muEN+nEkA
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689d5ec9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=08Fkt15WRQj5A9UmBdcA:9
 a=tKNFYOeudD_96IlG:21
X-Proofpoint-ORIG-GUID: C3D0WxClENd-SGGmBywtJj50X8NvYsHi

A string is defined as a character array of size strsize.  Strings
that are less that strsize in length are terminated by a NUL byte.
This implies that the NUL byte is part of the array and therefore,
strsuze is indeed the size of the array and not the maximum number
of characters in the string.

Tests are adjusted to reflect this behaviour.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c                                    |  4 ++--
 libdtrace/dt_cg.c                                     | 11 +++++------
 test/unittest/codegen/tst.str_store_var.d             |  2 +-
 .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
 test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
 .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
 .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
 test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
 test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
 test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
 test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
 test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
 test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
 test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
 test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
 test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
 test/unittest/funcs/tst.lltostr-short.d               |  2 +-
 17 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ddf703ddd..31781ac9f 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -910,8 +910,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	while (buf < end) {
 		uint_t	len = strlen((char *)buf);
 
-		if (len > strsize)
-			buf[strsize] = '\0';
+		if (len >= strsize)
+			buf[strsize - 1] = '\0';
 
 		buf += len + 1;
 	}
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 88dddb087..cd9e7f4e9 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
 
 		TRACE_REGSET("store_val(): Begin ");
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
-				 arg);
+		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
 
 		/*
-		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
+		 * Copy the string data (no more than STRSIZE bytes) to the
 		 * buffer at (%r9 + off).  We depend on the fact that
 		 * probe_read_str() stops at the terminating NUL byte.
 		 */
@@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
-		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
 		dt_regset_free(drp, dnp->dn_reg);
 		dt_cg_tstring_free(pcb, dnp);
@@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		/*
 		 * Pad the rest with zeroes, if necessary.
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
 		if (dt_regset_xalloc_args(drp) == -1)
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
 		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
-		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
 		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
 		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
 		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
diff --git a/test/unittest/codegen/tst.str_store_var.d b/test/unittest/codegen/tst.str_store_var.d
index c14714c01..cfd37404f 100644
--- a/test/unittest/codegen/tst.str_store_var.d
+++ b/test/unittest/codegen/tst.str_store_var.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
index 5e7d49b03..8090daad6 100644
--- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
+++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
@@ -1,8 +1,8 @@
-fe80:7060:
-1080::808:
+fe80:7060
+1080::808
 ::1
 ::
 127.0.0.1
 127.0.0.1
-::fffe:7f0
+::fffe:7f
 
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
index 253b2d6ef..1ac5ffd12 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=5
+#pragma D option strsize=6
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
index 625c786b6..44a6acd88 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
index 52718325a..d2982a70b 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
index fe5b323f7..b54fd2f29 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=10
+#pragma D option strsize=11
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
index a1816f975..2b700a5a8 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
index 1fbe415dc..254a65485 100644
--- a/test/unittest/funcs/strtok/tst.strtok_long.d
+++ b/test/unittest/funcs/strtok/tst.strtok_long.d
@@ -9,8 +9,8 @@
 
 BEGIN
 {
-	/* 256-char string ending in "XYZ" */
-	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
+	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
+	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
 
 	/* check whether the last char of a long string is seen */
 	y = "a";
diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
index a752554e8..4b172ca1b 100644
--- a/test/unittest/funcs/strtok/tst.strtok_long.r
+++ b/test/unittest/funcs/strtok/tst.strtok_long.r
@@ -1,5 +1,5 @@
-_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
+____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
 zyxwvutsrqponmlkjihgfedcba
-_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
+____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
 Z
 
diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
index 97d2b0f61..fa3e5337c 100644
--- a/test/unittest/funcs/substr/tst.substr-stored-len.d
+++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
@@ -13,7 +13,7 @@
 
 #pragma D option quiet
 #pragma D option rawbytes
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
index b4d0cc63e..04eab4297 100644
--- a/test/unittest/funcs/substr/tst.substr-strsize.d
+++ b/test/unittest/funcs/substr/tst.substr-strsize.d
@@ -15,7 +15,7 @@
 
 #pragma D option quiet
 #pragma D option rawbytes
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
index 9d847ab6f..3e10af08e 100644
--- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
+++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
index 4f93685f7..cecef827b 100644
--- a/test/unittest/funcs/tst.basename_nonDPTR.d
+++ b/test/unittest/funcs/tst.basename_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
index 500c53e86..f079c7ef4 100644
--- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
+++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
index 969045667..65a5714c2 100644
--- a/test/unittest/funcs/tst.lltostr-short.d
+++ b/test/unittest/funcs/tst.lltostr-short.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=7
+#pragma D option strsize=8
 
 BEGIN
 {
-- 
2.45.2

