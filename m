Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02446274671
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103509; cv=fail; b=a7egX6HC9siG+wOsX2dO/uyCQnVkK/zbtjpcQofgCzy2n7Kf9l3SVPGuTkhN+ahhH7zc53B9UrM6nCQBuCzSeBMNiZF1DFAbSuR/f05o39phzCK0Etl+te4VHsJE8vc7lOK7+XFjVnKKlkxZ6Am8C1dqlGYteYtXEBkg3z5J3L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103509; c=relaxed/simple;
	bh=6/Ftbm/hyHCKxgGbNBe1dXw7CyFp4dKsK63uv7t4KDg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JVdEia2Ojt3mz7I0pEfrceK5MS4qfbwE71MIRmBXMtVNfHLmMMNSEB5bD02jTqhOdlYalZBQO8cW6pWYQWI2u65YVilILgpao9JYwBA4sz78HsSA2SJ2hkTEJ1lxl3gsItGEe6uKPfms19h+uAzzOCz9aDTjPV+w3dJu/ye/z6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jr3nqyDM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lgSwK3bX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jr3nqyDM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lgSwK3bX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3P7G6025709
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FwE7+u63Gk3WEoJ6fb
	DNz7hrGryWHik8CncJDPy+rNs=; b=jr3nqyDMYRfzJ3yLgZy4xfvQlWHpK88Byy
	9eV6EHU43ntbxQTv6Di6JqmSlh0cPN0/y0kLCkdhjXFvJcjgeVNQobFer1sJPDeH
	aEnlMqHlPevpctrFrgDwz3Q2A0wnlqjSCBHWrSbONhJDzwhPYnDmbzL8FKG/GgIz
	EMd2Fl70InUmk+c5Ek/TK0piUbgL3dF+zXuERZTIN5MlU6fjniOk+iN5wiF+hbCH
	HE6Mf4/E5ZjOynenQGPM07iWtg8ZGuES42WNxK04hVtJPU+F4CrlU4FpdHeKSSIB
	74k9GW7ex0aRNI3SVaG594davV0Wt0GXVq3DKC9qcCCtW68KcBbw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v3espxdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:25:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBn025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wea3BjISXP3jC4njP9t2mq5M0kaBP4cJ0XeiN0xnZR9yOWaDE1nTOcTvCOB2WobaDF9VFjqqk8I80eC0ji8IQNfNV2tiDoB2jpha04/Uo+KtfjDJm+8lbbUAoYHa4f3BQqx/etcRAWbKOKUcw769pYJt1SXVbvGghJgKVfihOyrxbZ0zogWSIxniNaj00FlUP2peICJHQbzyoWNuVx9C/vBUq/kzOyU4eenl+M8tLbsGXG5zmZjQeOJTygXn/wquRJ0kB6hmq1j3YJcVZV0jny6ujWz9LeS5wK5VF/E0LcZWE0OQVLlJwOPYmg7McnC0wGMDEmdWibtTC/DTq2FCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwE7+u63Gk3WEoJ6fbDNz7hrGryWHik8CncJDPy+rNs=;
 b=k/KxbLl7YD3zyVXjQbOGMMD3M/rJxh4upjX3UbnaEz7co1zy16JTQQK3C6f6bqxo2Ckta11ORQwZyJtVPyD2IgMUXDFow/rdWhNRArb/mdG02kajG3iwlL7n0vHQWQz99Wkgq7ZBh6W0m1dI8Cdwhm9B9LqSYSz7dJkTlszpoMxcr/kXaFTvCOQFPSQG3D3Vc5RVbrS+lDvIy+Iy2waJg/3m6kU9jcNdoeCIy+d5Y+J8k79Hdxs1yrk1jbce+pmx0Vaid4HZ0jTiaUaZPZob5mrlfrU+oS5LU07bk0FyoJYZVnDINVU2JyKeqtdN3MsSRnH4LNRiWPyAGCTuZxLV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwE7+u63Gk3WEoJ6fbDNz7hrGryWHik8CncJDPy+rNs=;
 b=lgSwK3bXm+US7uFTu/PlItP+Us+i4rpFbUBzo9mUXpDWX3cwhiBX0plRs9Iq50zWpi//Qjr3jxWLpcjWIhLG7t2cxpFYsmWeWW/cEsFD/N3AdoiUI1dk511hR+/LI+szM7Knvg48Idsx5sCmFDXH4g60T1eM84B/J9fu0XMQdNs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 11/20] doc: Fix anchor links for how-to/
Date: Tue, 21 Oct 2025 23:22:41 -0400
Message-Id: <20251022032251.2010-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:510:174::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: f11cd008-3314-4869-2910-08de111a4fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gJLVHYxD9x+qBtg3yADMk+nobFIXzYLJLMRf/pQBbxSlsJbCzG8rEdd/ebyZ?=
 =?us-ascii?Q?A7ZbDznNEN4bI6Y0LQjPyaxn0pSx6FbGBGFRP5TsYqSRRkJFeJ+5DFBUObEj?=
 =?us-ascii?Q?SQ8JmrJFxRldCwMPqUxHiF76OuFqHDY+5QMCe0pSNSDgBv8WK/F2YIkns74t?=
 =?us-ascii?Q?NjsYtjhZUaLI6ZVBJOn8YZDXoAc4dfDtTrKLzqXx38pe5soyFka3LTLSBrMo?=
 =?us-ascii?Q?eid0HMkm/T9vZcNleOos2y/jD3RBSdyZptPz7oA7CmW+9UEkWuJZ429W85A8?=
 =?us-ascii?Q?uZ059B7wMpsyxJRzTwOWmvtjY72/9rQuhPqBPvp+GUkAM/bXkDs1ZBBJDH5Q?=
 =?us-ascii?Q?3bV6UkW0UMpbFh1F63ohZOtfJS6/HK88rBanYxFzlPm/dJBJ2TbgLnYHGUbs?=
 =?us-ascii?Q?h9+23tAlQox1nKjs7YFdlj1ckaGjz95xmzLmZbWhOJHdMXhzJyZAqg6lFvx0?=
 =?us-ascii?Q?Igh5V0Knyb8rw8PVEljZt1ps6joGt6pNiZcKdkPMzXUuTtWYrwp80/biXhNK?=
 =?us-ascii?Q?skToz1kjd0+xMImY2ucjfBlAYjQRnY2pYnAxmox1ZTcvqym6ghdk0D2/8LEM?=
 =?us-ascii?Q?ogGgIiExLY5vHehNMA/3qTJcnn0ULzQ6O1JMH1mCSasKqk3M3AG1seHdVAVj?=
 =?us-ascii?Q?I1Mqkhyv9rQtaf2JciODWdif7uA+Uqsik3Ykuos1frcnYY81mJMMgC1DhoD6?=
 =?us-ascii?Q?zZ+ONpvcOXZG8QkJGGPvK3UL5yDnvDtkFWpYETLsiFuxuSobUeGbX797B2GO?=
 =?us-ascii?Q?LX+tJjkt5fo8OnD87UnHXSFAS3O8l+qBqrQhkx8S3goMjPWi4j2rw6bimw5L?=
 =?us-ascii?Q?AJubWhPrGSsmiAt5HBfq2qw9O3ka99iLNrIZUJYWconabe37H4ZHLzo1gxh+?=
 =?us-ascii?Q?fvJpasCQA1IpZPIDWItCQEVHmzMhOA54aJVJ8nXefJg8yrNqD52fDi8RJ+4+?=
 =?us-ascii?Q?tekuAf+Nce9hCLZ+rRV1BUtJWgP+pZLu90ZnrvYUQsvsNJalZJ7k3bfDjHXW?=
 =?us-ascii?Q?NTdgORgKNHpN93y8kCJ8waoCOkOsGwfhMqcrmAWy/CYewUVVQxNXyzBHC+6h?=
 =?us-ascii?Q?WVbGO0PTXeInE5mlw5tXUr3bSWK6rpFd3a7CPb6rq5fXZRTZZaBCbgQsX0my?=
 =?us-ascii?Q?IyRZhRBrFePyt/dFjAoOA43f0EJg6ZL6wa1g8rR7Gv/4uFpzK3U4oI5alrcT?=
 =?us-ascii?Q?xbNJ8alDiMU5POsaEzWVCFCR+dhXMviVoei3GtRrfQ3GON0XJDnPPrTbuXVg?=
 =?us-ascii?Q?W/1m+Fb3YcDW9v4SwlOrbrX4HN1masXOnrrPm8zXTP6rgYkQgC9fc/SD++HH?=
 =?us-ascii?Q?PGaaAspdygvylD8vALkW8lMphA6XILuvdxRjnuCdCcQGTaNf0ZakvxCA+AdQ?=
 =?us-ascii?Q?qJiUiIugJQjHvGtxN7q8Wq8QX/YhqpV1ILYdmX/GH/nW7lFhfH9IPUVo0mtz?=
 =?us-ascii?Q?pFGZbeD4r0BEW/dX+vbmVgl25tL5ndiX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yirrF7bTioXVmobVBkXQhbbWgyoAFnbHGjXMRCFeIGKTNIA5ChDQj5znQ2QN?=
 =?us-ascii?Q?Dd7G0x6MtVAFTKZsjCjD73kH5G+co2/1zRRcdKULuHDAWPcDDRuxxGPoyaPD?=
 =?us-ascii?Q?4i363sLqTj1gI7NefikNBDtKnv+9Kjd/v8dGWsdhjoSVuSxmBIs39oCsRaSC?=
 =?us-ascii?Q?ALC2ItlMJa1YuKSjr4y2UT9fhg9XmwiilnhbGvTWumd8Q2yl38DKIgL0Xg3D?=
 =?us-ascii?Q?os+V892C4xynHFuI8X8qBVkl6XYlD2oPgPhlrPwIQu2qzMHFZbXOBJFIsdYt?=
 =?us-ascii?Q?m1Xg6bSfJTxOr8JpYuMUpBv8fQyQXQOJ0y1nLKxq0g/O9Ag078+rC//kLtmA?=
 =?us-ascii?Q?1n+lSIXVs16wvMtjqyiD+7WQCFSSeE0LHwj29IedmYlQzRi8F9rTHwNEdZV6?=
 =?us-ascii?Q?Ke9X1M1APUm6zSa6WCJR/cb6/+Aq64nYyIAYaALRq8S5JYDrbJPbFGHkU+L2?=
 =?us-ascii?Q?qjHjyHddCiq/uYp5zl0tpmtmJ7kxUMQgpFeFR/gJv4stpIwd8Cms1vWiou9r?=
 =?us-ascii?Q?1drQLXE9vJVvejz930YvfNd3XWSjqYDpSeMzOfU4kiuG72ZTBElRvUJlVE4c?=
 =?us-ascii?Q?R6pLpTKnhfgLhOu51qpk3BHDs8LaG2x01FEB5lsA0qP4h7RwEzsta4ehaP1R?=
 =?us-ascii?Q?y5nmzA712ibPCLFr3+kkWB61mlVUpaPgsepmfOSGJj3NewVZ+bVmgEMMIKmK?=
 =?us-ascii?Q?yYx8muaMRAKsJQc4O3S2X3g+L91VnlKZg/QGD3V0F0GvHnhomIr/whChlwNa?=
 =?us-ascii?Q?3bmiGmWNAnzegRePHTNKJQ07RTewD6Ll+QtAm7w7u8TuUy0cXRtv2LN5bA3L?=
 =?us-ascii?Q?o8FLY2FHNfgKju0FKpDiBFwKRnteTEDWDgjaLpYl905p4cVBN1faZr9ZjOkp?=
 =?us-ascii?Q?rRFU47ZJ1kniSrV3QSPmTeB6ysXFIfLmee8EEEKLxQHEIipXaosDC4LXcP+O?=
 =?us-ascii?Q?0GFNeIWLcwgkn2pVq8jwlwUHHk3n7h+ODiI/FzW/Og7Wjnh2wZYOkxrmpVkB?=
 =?us-ascii?Q?Kwcp9iqy350CupvlR+DvrDbbbVU/5ai+2GFrO4a3xSaUbga1bsnhcvDRkPr0?=
 =?us-ascii?Q?WIJWM9SNLPjwBhIaZLZsBFRW9Q+D/WdUcDvP4r+0xYNbgKlMAaP+q0lCWz2t?=
 =?us-ascii?Q?1/QuZqpuJ1KFPbnywMgl/nbsIPwIoLxi0n3z9goudFtlombvGXdN0sQ7b5bP?=
 =?us-ascii?Q?ZNTU7DcePztPkTWWzh6l7e0M7n4YGdyCXtU4YInlMUXaKXQ3NZWtf/fT3RQZ?=
 =?us-ascii?Q?UoJJC9prFlX4IKkcASmWApv5b2JTnNucKdaZLWyVdN/QMfyeoM9LmS8lP29Q?=
 =?us-ascii?Q?Xvm8yrh5pofjPelxYtRL/lJhWOj8do29dUk2f3nFbVNJLw178MUTqRKet3rq?=
 =?us-ascii?Q?qsOEVpZwwr5iIlNR9OJyNNQl44yoz78zukpyv+BOpLIPzklg/UV1o/GBoRPN?=
 =?us-ascii?Q?6d6gMiSyZjB3eQEJIanRYwA7WGWxuFhLr22lQZDs1zaSebHi0NApmZ/yeAxm?=
 =?us-ascii?Q?ZLn6ukjk73QUuT4peHC2wNy9eQ2tF8yTx+c1bwHIjJJNU3e2KzBkez4j9YHc?=
 =?us-ascii?Q?CKUht/+5Y0fNOmg2xW5bIOdFyye6rYmBmdDcWXaE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QAiar+VVHoi9I9n/ib2N8tVTqvGg27SIooqXTqFhgfTl1BD+Hrsh7q6YVqX9MxXlarYbwH8+B93MrcznOn6WFciE5wEQyJd1caC107cdppFV02fQsJS4+vXZKsi9Y6V/WbAH/Wp2TjC1ME6DrNW5MlCRPCed0a/VrpidthQotTPeWeu8C+4V9lJSuZPR7d4ZZUKxq6MP7qQXL3LcHXeL4YkjddLoI0rjRN1u+VrpTzyWfpYvNqBx06za68z6Br/yRC72KfcVFZdjpTnmJvclX+4yGEaF6D6vPubeN4L5w695K2S5zdGZeSGZQRN7GIqvyTkjeTFM4wgp+cyx/iNN2QFhOMkZKLf3J3lFpnAnOuiS1SXy05LT3jeGfx56JHmC1SE11yxryQ5VD5etyxhn0nd67LEJ6ns7no+wFwp2Sq6Mq8EzTuqaCo5vTvS9tT1YnfJsilfnSsYTdcyuEDKP3vAzmN9oV0RnqK0HK2k86NwhkWRdaB1UX2e8x5v6dQ7aMxsSWJV4B8latomYb9Eh25Kw3WHHNqBIdeseGgH8f1Sb7QXZmJHhVNJ9yGjJNONA419J95jRJ7GhvVRIRL2GycFD7KeOqU9NH4vAJ06a0Go=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11cd008-3314-4869-2910-08de111a4fc7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:04.0196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcU6C/YUmwZnN/C0xi6UNdD8FABHd5q4ot2E25zz36LUb+Vi86gVC2Ic/4R6ke8bmklMIMzRmGtiyS0dER3fpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Authority-Analysis: v=2.4 cv=N8Mk1m9B c=1 sm=1 tr=0 ts=68f84e93 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Pt-A83H3FNNgIOtAph0A:9
X-Proofpoint-ORIG-GUID: axygv_Z5_japgHp552q4oEDmzgjhvx6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX/bdZbIYX82rx
 cq2pi243SaDQZQ8JaMhibF2EcQXJGNmkulswNfqjUngBENwrpfBoc9iob3SC3/XxvOxT4AVu6gN
 xwtWpl6zCBWp6ageA4FiBovU1P0l/ibAWkRYaVMNlPv3LC+d4aCWMvhPy85UjRpS5LzjveUl3qT
 T4bBKBrcvzKs0Jwi6QU3FD2pSYnENU7MRy+tt0qxUfWLisWH+Ye3L12sB8CXSz/N4YHcnZsk5l1
 5ij7QrvmxFMNpvuGjKXF6T7JynhNJah2nFC2/GduT2D+JR6ddvtrmuKVTVACy/rCMIBJ7GimeU1
 GwwyBO+Iu3gI5qEuNs6HwWcBAtq1POz7UgrVzgysmi2fkF/D3mNYmLgSS/nIv2qkBhRe15oNMYr
 tL8EkoNZ+fVnerkUSE2CuFyuGo5Fqg==
X-Proofpoint-GUID: axygv_Z5_japgHp552q4oEDmzgjhvx6S

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../how-to/dtrace-howto-create-a-dtrace-script.md |  2 +-
 .../how-to/dtrace-howto-install-dtrace.md         | 15 ++++++++-------
 .../how-to/dtrace-howto-list-and-enable-probes.md |  2 +-
 .../how-to/dtrace-howto-use-predicates.md         |  2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
index 199649a9f..949ade0bf 100644
--- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
+++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
@@ -1,5 +1,5 @@
 
-# Create a DTrace Script {#dt_create_script}
+# Create a DTrace Script <a id="dt_create_script">
 
 Learn how to create a DTrace script to develop understanding of the D Programming language.
 
diff --git a/doc/userguide/how-to/dtrace-howto-install-dtrace.md b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
index 45da88fd8..3bc29e14e 100644
--- a/doc/userguide/how-to/dtrace-howto-install-dtrace.md
+++ b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
@@ -1,10 +1,11 @@
-# Install DTrace{#install_dtrace}
+
+# Install DTrace <a id="install_dtrace">
 
 The following instructions provide steps to install DTrace on different Linux distributions and to verify that the installation was successful.
 
 **Parent topic:**[Get Started With DTrace](../how-to/dtrace-guide.md)
 
-## Build and Install DTrace on Gentoo Linux {#build_install_dtrace_gentoo_linux}
+## Build and Install DTrace on Gentoo Linux <a id="build_install_dtrace_gentoo_linux">
 
   ```
   emerge dev-debug/dtrace
@@ -15,7 +16,7 @@ The following instructions provide steps to install DTrace on different Linux di
 ## Install DTrace on Oracle Linux
 
 
-### Install DTrace on Oracle Linux 10 {#install_dtrace_oracle_linux_10}
+### Install DTrace on Oracle Linux 10 <a id="install_dtrace_oracle_linux_10">
 
 1.  Enable the yum repository.
 
@@ -38,7 +39,7 @@ The following instructions provide steps to install DTrace on different Linux di
     ```
 
 
-### Install DTrace on Oracle Linux 9 {#install_dtrace_oracle_linux_9}
+### Install DTrace on Oracle Linux 9 <a id="install_dtrace_oracle_linux_9">
 
 1.  Enable the yum repository.
 
@@ -61,7 +62,7 @@ The following instructions provide steps to install DTrace on different Linux di
     ```
 
 
-### Install DTrace on Oracle Linux 8 {#install_dtrace_oracle_linux_8}
+### Install DTrace on Oracle Linux 8 <a id="install_dtrace_oracle_linux_8">
 
 1.  Enable the yum repository.
 
@@ -86,7 +87,7 @@ The following instructions provide steps to install DTrace on different Linux di
     ```
 
 
-### Install DTrace on Oracle Linux 7 {#install_dtrace_oracle_linux_7}
+### Install DTrace on Oracle Linux 7 <a id="install_dtrace_oracle_linux_7">
 
 **Warning:**
 
@@ -111,7 +112,7 @@ Migrate applications and data to Oracle Linux 8, Oracle Linux 9, or Oracle Linux
     ```
 
 
-## Verify the DTrace Installation {#verify_install}
+## Verify the DTrace Installation <a id="verify_install">
 
 Check that DTrace is installed to the correct location and verify the DTrace version.
 
diff --git a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
index ad9c3a4d3..9325c6f1d 100644
--- a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
+++ b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
@@ -1,5 +1,5 @@
 
-# List and Enable Probes {#list_enable_probes}
+# List and Enable Probes <a id="list_enable_probes">
 
 DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
 
diff --git a/doc/userguide/how-to/dtrace-howto-use-predicates.md b/doc/userguide/how-to/dtrace-howto-use-predicates.md
index c32f3050f..d00d31a01 100644
--- a/doc/userguide/how-to/dtrace-howto-use-predicates.md
+++ b/doc/userguide/how-to/dtrace-howto-use-predicates.md
@@ -1,5 +1,5 @@
 
-# Use Predicates For Control Flow {#dt_preds_dlang}
+# Use Predicates For Control Flow <a id="dt_preds_dlang">
 
 For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
 
-- 
2.47.3

