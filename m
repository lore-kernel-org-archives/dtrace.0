Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0E51A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466539; cv=fail; b=JkD7LAcHQmLXPPh1RL9ndGkUSE5BJSc6RpePmpXxG2F0jg7L4mxr5jomq0/HFh8d7HSwLjUGwi9OjsW9se0ly0ezkTZ1X9O46Z7WxhHdoCq5QygiJZN9DKQ3rwkEi5vt23nJphBBSryLtKlPez1bZuT+hBETyzNc+RQWk5ZWlaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466539; c=relaxed/simple;
	bh=1sx9ez5PnFruU0ylL4kk/Lxq8YXTT/SNpH8Y8zwdNGY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VYf0O83bmHZi6+6PKwerZAMRrShzi6ME5BHmmDDHtL6zJNNLJ/CgkUw39sVYgTsSVzEo0CBDy2kx5jv844qaHvVCT8RgVfyqAWOeYPKI/xXvxYM7PsnzSlCt+mFmYn9HxjgxThNTj4GJuf9Svsr89og7SEAL/CvPl7j7Zk3kWWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hm5YrpJP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zUwcpbgG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hm5YrpJP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zUwcpbgG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMW5Y030890
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=bMOZiQHCRJLeYA
	+vRGoQuhrO8UNS/65J5QdM4ZJYJz8=; b=hm5YrpJP0yoyL5OCzQwY0WQguCVeA7
	0mePgdDwXAyH2KtRel130tjAYeidUfee8WrJ7ec4A2dULyQX7b+k+4uB9XpJbCdE
	oPItSVfQxyqWNWg/z9jTv0Jwu8HnRZX7rQBDU9RPWHUlmZMKyFib99GuavIonBIE
	oy48S69IsqSaVuuP9Cg3NC+mz6FNe2rOCc55op4KbrBbsOXSoAzWFkzZZhAnnsrj
	jx/Bu3s3SmMTyzqW9e2D3KpAuqhbiqu1FBOQYZ+zZpniTRkWLsgjg3t4ewAU2jbF
	hnOUt7i7mbTDgJmv8/1FwYWmt9+7l0mpFQ+Qoz4zL73iEPYsbOp7iEKA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb525k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5UivM010846
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2ge6fw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeIQ6AasPK3sOXCOw5HkHdaa8RwpYqoo/mmr44iDOgqAvULP1X/gvtyCTfeAFuIYrSacP56J//C1cTfln257RjUK33/5tYrOLwxhAfA8LrnU1cAf0VMn4BzJUk6ZqkcOTHC+p9AAPeS2nCL2Or89mXC2mzcNIwAM7mYC0d+kZyfoe+pbxS9YEuLW5cdFWtjkp9XLoYMPn3imEbgyKL6VDHSPltUJHou2Bn7+XyeeEz7eixnIhKZwGBeMy6PYepJatReCOqA2qxUJ3twJnUnTfhx1yHGRSSLs38WrVvOaucWPtPRmcdSFqTRkbzs6ZEEhZYEzR+r/yZQcq7c51zAM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMOZiQHCRJLeYA+vRGoQuhrO8UNS/65J5QdM4ZJYJz8=;
 b=QkF04c45zF8oVCAtfbJqc8rOTcrqhbY8kjkKSewBrKDrKzv+niJUBAqUJNnJ5xxmFPYisHDSWVyNQFWtbr5l1gUEkLcJZP1WrvC1LtzRAUCv+uWPYzbi+DtbJowGmjlrz5EOHR1qtSC/ZCY05GLPCytLYSBp90EdfsCGIn4vER2CoMcwkq+55eVsf93m0bvBtkiYtY6Zkzqx03iSP/ENQmhvWnkL1NXPIvrf6yVFF0q4wphYeG0k+kNCq55d3I743WhmFJ1luerdZ+SSZwy3W4kRqESOmLnySw5KZl+MpeOuIdn0haW5OrUEmYiHySVeVWR6o7CDB6OpslHxDMJVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMOZiQHCRJLeYA+vRGoQuhrO8UNS/65J5QdM4ZJYJz8=;
 b=zUwcpbgG1NGcZm5yorBuOJDHpXhb709GAi7fNRy2MFevZo3KU8ncxL1J0rvFcsLD0YZG8vxgdDNXvCn1SenHAjx0vGuL/jj7USksM6dxtxzbCR/0DgdVZIUoqZpT3ZSFop03Xc3m7ONpxs1rsjTqYN/iWpGcgW5xSPeaiRu1WFk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/38] USDT module names may contain dots; remove incorrect check
Date: Thu, 27 Jun 2024 01:34:29 -0400
Message-Id: <20240627053455.21567-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aebefc5-432c-45d2-3f16-08dc966af4e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XQIhJ35B6nxYy88f9IYEOvaw3SfmuwmFDo23mUwR8LkhI3Sbd0S+cIFEgggh?=
 =?us-ascii?Q?qugDtHbaypARrFlM/WNbZx4V9Yl5EBrbuYVsOoYc/MsyLw3N9QJbnr39FW52?=
 =?us-ascii?Q?kEjSGZ1RonnOLdC28vrwpbmuMzpRIDO8JkmjKZeiif5y4Lrm8vrpZg7Dc88U?=
 =?us-ascii?Q?w4ublmV84It2BEIS2+naynA+i8jnsuCk2eq1K3Rmdna+C3nhNIFyHX3HMYn9?=
 =?us-ascii?Q?8oslpLjhQS+zMQRUwwQdDfimLo9t1R/qXaVVmIfEbv096iRBm1aL3axnwqrB?=
 =?us-ascii?Q?gnbspEcQPI6/G7DBiHJa1+16N0vMzguCBCMShcjHPOjEYIu6oJpXGVAheWqw?=
 =?us-ascii?Q?Cms1j1WwR6IiAgTfCm3MK32B07wIt//btovgYNZiKeXWQD/FXm/tgERkfIJj?=
 =?us-ascii?Q?NR3HAXI/t/z/D20882+fndjLPpIbOj06TnFci/FmSpgQhTQfzBYxmRZYVuTA?=
 =?us-ascii?Q?AMQtR0cxMVM3Dh4yry0OwWHN5v1rWDtd8AUlOBu6rJ/elGtC8mAnxHt+T199?=
 =?us-ascii?Q?2r0/y0sMOwdtb76/yTMrO9bJ4a4vcihygahFYGhdJXmG9K0Vs4NqsQO9JWrj?=
 =?us-ascii?Q?X3h9FkNIsmUaQigFAnrXBydHa39jX0sQruWpT9Wpqkh+7QKGmlTSV5O24Gdd?=
 =?us-ascii?Q?periEyWVOoPSNEMDwujrVzo2Ea2PWCA1An7g1oJm80c/8fgbcW77Dh8+yJ4I?=
 =?us-ascii?Q?s5udawyCQLMeaB2iXJVddbqwPDfBNqSuJkkwwTDfG10aDYuQ/FSqr8x+5y9I?=
 =?us-ascii?Q?dzZNcJZKD1qHPE68yLOYczQpOSEO1zwtcURIv2RuRhhQNHB7M2lZcpaUl6uH?=
 =?us-ascii?Q?ruDDAihisRmcqgFlylCmxm/X2Amz8KlQVXd9PXVU6niuUlEwSi9c6191HBnO?=
 =?us-ascii?Q?a4X2nW+Y9J/45RjSO2zqI55y88JglBYrYyBC328klyB4mYH9JB8X0nEUzC6W?=
 =?us-ascii?Q?PUoux6R8XdvVpSljnAe4u3bTYLUrLqZNep/iAg2voZI7pJDRn7Jxc0l6R7A5?=
 =?us-ascii?Q?Ma7h33tbCOkv9WgyI+Fyd0OgawSrTvTI6uP6An4pgHAfX06aQ5Qlr/fzfaX/?=
 =?us-ascii?Q?g2c2lLB6h5C1Z6EHeULPn7z/1aM4ilqfOB9nDtoGlscmTHZJTsIpWPkpJTaS?=
 =?us-ascii?Q?6dWyD1Lk35Po6eRDiWtS7m+Y0RY+b/7FIOzXVXGtxb9cvh6dmrKgxGcqoM5p?=
 =?us-ascii?Q?C5hscUeKH9AubYcCcTpszXZHqMxlvX6ffKy6r6pzGr5U/G4dh6LZ0rUpIFJg?=
 =?us-ascii?Q?4rfks4X+fUnEnlhnFbsSyq6tpyfwYs+KZS7D9qSatO9uxJcrIlo14Ui5JT6r?=
 =?us-ascii?Q?Qlkr6k86AqC1apzsqKo1BHowSnvWz6Vnyxy9MAWTJVoEWA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PRhPb19skcqKJvDSHj896VQcjWmop36vkHJ5ZSjJJNZsBVz4HpT7/Fbez0hE?=
 =?us-ascii?Q?6//QNcPYUwPjpsfdykAzOklsJ4Z+Wp6gf4K3C1eMjPpO+KMKy3/V51Q4JO15?=
 =?us-ascii?Q?mb4t2Pbk/cuW6jyTTgW1SN1XMLmVbBGLAoXfwap1CioZTCY7N5F/B80IEo5J?=
 =?us-ascii?Q?d890B2JCyh69zRKqhnMyHgU8My3XgtzLTL7HFJ4SLDCFfM9HGHgV9nosgFe8?=
 =?us-ascii?Q?PMNz+/yWmHNqFhvPKfx7UJVDX1KrWvM60mF2+v7dDGYiVqYsYdPtoAqpd7ZB?=
 =?us-ascii?Q?0CAgCx0VXrbZOFRi9iP+99zofokp8rLp50BDLr4WH8EDXx9pr18yb1c6OYpX?=
 =?us-ascii?Q?sdGV8gJZrS7agNlqD3ZYOZp+/fLyAtGg8k/EUPD8orrQ2zqBJcRLy0bpuIK+?=
 =?us-ascii?Q?m9Qze2XMvOpXFHgG4KFYfuQU8P58RgdjPZ879z9z1SNH03CLZPl8OWJ52hzt?=
 =?us-ascii?Q?cm6KgpKNDsXIQKaB9PcjbslZXE5VGJGc+zzsMbvrz/iPllOjLqc/bzm6ZtlR?=
 =?us-ascii?Q?Pab5bAixtO9Jf9tR/3xCd5YaafedqsAd0jJDTKrK0UzIG+u5+MNCpQ9k3zYz?=
 =?us-ascii?Q?ZCghN1RSdEU2aICnglS9IGRfDf3c+TPdLpdtzt1nhCHzivNWQWkNnLlfRm9p?=
 =?us-ascii?Q?Dz58ZB7TRKy9ENa/aLCIVF5wEJS7QmLaD3NDws4qcgAYPseavcEchxDRLW++?=
 =?us-ascii?Q?9OAQAh1oq2hdFgKJiLnSnaXiKOgY/yJVoQEEUMpK7gtNgX1o+ukhL8p3nwc6?=
 =?us-ascii?Q?TxGVA+hkJyC7/bOn8K8XNJVbd2IaBdwYHf8JdldOyqjkPvfDV08BtrB8bQ0e?=
 =?us-ascii?Q?ww4kcQomCnrAIBKGQ0RuKKkSdIx3pwIS4nCgG/+gm0RG0o8Rroj6p7WOJqLJ?=
 =?us-ascii?Q?jt+i+0fk5JELnfbDMy2/LYhRyGlYKefdYVm+0/pYPIjg5LeB2VJYE2m3LXUW?=
 =?us-ascii?Q?0T/uqHm4juyetocnf2JXmaVBr5H/y6qcjQjeibemB1ePoMQ78jFus4gGGqmv?=
 =?us-ascii?Q?J5vzMzayP8rNWE6mRwm/rXP3USdulR17eAXKAzMaTJzMBhPgg+paGBzFizWc?=
 =?us-ascii?Q?S3UV/r8AdZYZUhm2RMc9Hlpmq2EqVs73GwB+S04AvCxNLgOPKyhFh6RrbkTD?=
 =?us-ascii?Q?HQliJt3/M75lYl6TxTf+zT8HI3yDu58vQO7ZkXbVvp3BAz/lYRYeXqlVXyoo?=
 =?us-ascii?Q?C99Qy+g7Y2tCtn5vs3zCyoZ9+VUMnjuZwF611I79nClpvX3KCc4CzDjJjMe/?=
 =?us-ascii?Q?rzG5AFA320ryE7R4G48oZhxgxCBTN4yhjwg4qF+efPTtfp7qP9OAs93YiQK6?=
 =?us-ascii?Q?G0bv/qwBQE/XF07zWOpBXGe6crfHxSVysXUUUhkuT0/yL2QwlINH5k9BtLnG?=
 =?us-ascii?Q?VwRLMvsciBeAdGI+O6jSexBmEB185KzXwWb+KkPSkuiOfPnD8J9S91oZN8ON?=
 =?us-ascii?Q?JNb/XFbQ6AKfnAkGLqamf1wm9LL3oyBIwGN9hoWS0y+o55aa5uPXVtYBwWGc?=
 =?us-ascii?Q?aAdIhAjKWKIrYDFzlVtFSSNdYAce+Bz9VHBz4qWBfE5TyNtBWXGh8UU2qFCx?=
 =?us-ascii?Q?EJ8mPBoSbGILvCI61ObBTq54t9s0uadCZkHBJWAe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	CGo/gseMFdSHHt4h2ZNL4de093fYpzE3YgWupLoaiQPc7caMTu7v6wDczbVlp27YcYvkoBk3fVLXfEhOc7vfNYKxp0oYSxWPPeEy921sPDwztQAFRCa42pcbv6fnFN2jHuMhck0FuFbf9ADz/CD1WEe8ArSUE6EGzgmoc0BvrNWsmbIvepJE5jHdqdX0x8uRpIG0ty1uI45PN7D7gfvM7GXXZpguT3O4YbV4od+OM0SKhfBa3lVOUOLToEgZnA6Je/nPtfBBiuPT1aPa+Ko+5MqqTgF/oXHirWrXXCuNXIiDdWeC1BwoUa51zx0Jwxdh96qJY4AtBsg53RKuwuj6mGZeSSISTyLth5DGfNa0WH2F6GmaAT7fq/Ihh5hSh+PqJZAU4/IN3AKEQUzVJLYxAvOJvTOpLKmRZBp4zKgJz/McJ4jei0KgXpau/rywjH3C9eA1WVUy0hLpy1ilqJ/s6lhDlB6LkuKF9zCDpHi9NG0d5RCNkKr3OXynA1oOBJdLJAMIzgrVNtslgr7HdKjeNl51+NHAVt5NZfGitSNCr2cu5qT8wOasiDY3Bz6lh/B3NXobElFMEugM6spy3Wpl8lS1IX6H+4UQSq+fZdZmuYY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aebefc5-432c-45d2-3f16-08dc966af4e2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:30.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b7Izc7t8mj+Cz5l4gO4ELPlWW7hzPapmiysZGaDhHvZKZMnjjUVnduvHoH2ybdsVeC3GcB0Uw30I1x3iDi06g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-GUID: nax1dVft0Du3hdh6Xp3ZX4KTlIJxLgXL
X-Proofpoint-ORIG-GUID: nax1dVft0Du3hdh6Xp3ZX4KTlIJxLgXL

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7c7d7e30..996543b1 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -833,14 +833,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 
 	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
 
-	if (strchr(pdp->prv, '.') != NULL ||
-	    strchr(pdp->mod, '.') != NULL ||
-	    strchr(pdp->fun, '.') != NULL ||
-	    strchr(pdp->prb, '.') != NULL) {
-		dt_dprintf("Probe component contains dots: cannot be a USDT probe.\n");
-		return 0;
-	}
-
 	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
 		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
 		     pdp->mod[0] == '\0' ? "*" : pdp->mod,
-- 
2.18.4

