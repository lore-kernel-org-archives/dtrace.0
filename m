Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8613C81B
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322018; cv=fail; b=hA6av7pcMySwIj/Kft36ppni7Gv2Hy5dauayefDApWkM0zdvXWvaXm4nawK5PGPTZrccUycnZ3qUs46BS4Hxr/I0L4M+Xr4BrD7FUVjzx8Hu4odnrEVqYUWE63L1jesdkbagEyQIzQB4FHQPZctn9VgLTm8uwNkZG1aWmVv8LeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322018; c=relaxed/simple;
	bh=HOvJrXuiyujgGACTz0yDGJNilAuTZUTZB9KoEu4k85U=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A2HT93CwOLscG6itnAeo7nSt/kk7+b42HC21up2tOTNT8DKyAuQX3iqPxOYoAGLtrAueuYDYATQtNKDu8yC4Sqm3niLQiE4MvacQpYRJGbWKVQ/AFoIpVq1f8Iq4OYhWQapVnZSHUjNJmk1Klg5wKTWnn0sG/uWVjrm6s2MgQsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D5/iTaON; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D928DauF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D5/iTaON";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D928DauF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9sm32027946
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 10:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=6GRFgbcqE07aQXw0
	ckzGRRti8WDHjGbiGVP1RR0C3Sc=; b=D5/iTaONXh0WPHAZK6k8acqLsGTtDTpV
	8EzYvGVzK1oZUBlu8zy4v4CTg7ty+xbHZeohjpRb0sHXWvSFsomPPFlpoQXrXixf
	Wf1p8GbIkgRftd2yMA2nOlN1sNam30/CV/7CEV60AllKxx18v3BauJwDWn43VqfD
	QQc+9L2ZaAFW3vqF/pwlANmiiIu5dkaeout9N8hAw1qDCqZFE2xjhsVRrz7hDI7q
	o9B8P4awnk/4u8zuHZRQTpz424a0OFvmdppQWGqVgdqanqVhVMmTZc3vQcSRoybA
	mAS1xHyEdpu+Fo8llvPvV318CRu081pvR5jx5cZ4totMjMQJd0pEtg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k225wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 10:46:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABA4LOg024252
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 10:46:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66mt7f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 10:46:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUunHlG+cKKTmxrP0ohoXvqrJepP2+CdEjTU0KjKEK5+Dhq6ZUP2Q7j6vBNGIPcDHMhkJhlSqPk7NHjEWoAF92l1Hf1aH2cg3Lqul+wIIdunDclzgUc1aQuPAewSy3qqxr0lSLxh6Jp+Ga0pDJLjrLVwtGYRnmB88V3oStEypSOxdjftFkLgdzZJdVj5GtM9i+wp8eDDf/3qcBVQBBSUd9IDq/bWVsfIjMa4ifxJHFZcGsbuCpK08Wb5g1dA+V9D7OSjPPjkN9kSIMBKW+za7MD2gLV40wS5DD4YOg4D4Rw28zNUK8D/De/ecX5r1tO2Sgzz6W/lhsn/GT3YwhLuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GRFgbcqE07aQXw0ckzGRRti8WDHjGbiGVP1RR0C3Sc=;
 b=c9OG5IR8LsXd/ncWBjRisWb6O9FAYenvy4f4uqxZyd24WB9D5imrFETia4McX7LxaIPz8VBcQTvA3o73FvW0vqZ1rxm9RRInKnKEff4odDJbWMWusENfk5H6mzk4JdfHjibNq9mkAy4Zb1qBKuxkpBGfi40iPPrxGNfeFRooFxJdWn/t9XQyyGWWEtS2oQ478LAJyTJJvNrKwx/b6Bju7GvYSszE2Eatz9onEPSac9e7ibCgQJiXmb48Ev+aHjs+lYhWvFw151+03sAt3pvS8UoIOfhoGq+tGYwogLurPqgjozDjByTsxWS+cvhtoQSo1dT/V9uqhK1l9T0I1sXg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GRFgbcqE07aQXw0ckzGRRti8WDHjGbiGVP1RR0C3Sc=;
 b=D928DauFjYIuRgPf+2cxDjaCTnIX916RVm5gEN+JU2Lh0mERcPrPDHthacg68kOcqlOjhwNOgsBQuVK8MdcEk94dfAS56xQLIqoSQNaOQgnPcS3o4SGD20QbhHuem9pV0RfBwCdQoIlJ1D287YRsD3oc34egJ3slxLmNJxC1hy0=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CH3PR10MB7235.namprd10.prod.outlook.com (2603:10b6:610:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 10:46:51 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 10:46:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] dtprobed: don't chown systemd service files to root during install
Date: Mon, 11 Nov 2024 10:46:46 +0000
Message-ID: <20241111104646.435193-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::16) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CH3PR10MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e33c30d-7fc4-494f-8699-08dd023e267b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?toIv/DG9vM0ldfZwEo/lrzVLNV4CEDxdMJdyheanHu0SO+lqL8+6JjZcC2J4?=
 =?us-ascii?Q?/ObIA+fg0mUKIk6Y0NqFc4NFIy/6X839di17Ml16397rZtnHfX12sKTdNbK4?=
 =?us-ascii?Q?uXzZNQQCzl5XisANuS/Efy6M5IkdoQ+z5rfgbmDks/wvTiesgQqPeFcA5sN7?=
 =?us-ascii?Q?JKe+KHw50Bj9RwtG5/STsA2PNoBB3wRrjHo/gbNP6H6g82cdnD+HNJO1koMM?=
 =?us-ascii?Q?/uZDx6BCRqkFVSbz7d2b7see6HAm0YpfkC2MWM9eQTta89hjtnoT39D6QgEV?=
 =?us-ascii?Q?YMhnkFwECzVcOuG9iXwNMJc/1PZ2jZUkd492Pvkg7kS7AWDs04Sp02U8JK5r?=
 =?us-ascii?Q?vH+Zbkyi9fj/qExMGePr1yBg5GZXDCRSw0ML7z/IXbfXXquyaqYQmErHvkIt?=
 =?us-ascii?Q?1Wy+dj4DS1ffWEpIm2OjccNuUOc/LuaJAcLAGmloFCu0qDZbrGh82RR1y++E?=
 =?us-ascii?Q?E/4HgmomRMyG3FaDzd/5L3tod9c0H2ptAGgixCCME/LDMEAFGZNO9B7Jzcr6?=
 =?us-ascii?Q?YKew+J/ZxNozW/quADg5MbbVw3NxIA+U1BcZ0kdYL3KojL/g1fhffs+kBZP5?=
 =?us-ascii?Q?Zc8VtLDmd2VBveB0zhwNGYMIsTJKon0UAJ6my+ywYZHfSqs922ZKRFqxVAsF?=
 =?us-ascii?Q?9Fk9k6hQSps0qn1s5fzqJFJTOGdmxyJe32knBLDeIxyZnBSZMTMkMS64ygps?=
 =?us-ascii?Q?NSO7bRkl7K84c5xIHCDUoOudaJUXHohVGP85Vu0YvalwZTNNHICzLx2vDmAF?=
 =?us-ascii?Q?sia0pGQ0NE9Ng6CfQeHXsrZarQv2Zfu3LqyAmYnxtscAGxvfaFX8cFBTktQL?=
 =?us-ascii?Q?dHtS2AaEDWpeNthQyuwvRLmoPiyDJF7nRMduafwDK3oC7Q51jRlkaXq5/q5N?=
 =?us-ascii?Q?N6DcsRrF9t2WTfCcB5NLg9bEStw/JGgJ2VTo8xxJjXxN+D3PCK2SsUIZzafS?=
 =?us-ascii?Q?GozDpJfMfnFprUAl6VLaFwahl5+1oHWLrJRaAPtmcW8N/fRnAuuo18Xl5Cli?=
 =?us-ascii?Q?usX+eZLZ46mb20NUEaGcUtM5gXp25t7aELMug/TeufKZWZ0E6VfPcEMFt/sO?=
 =?us-ascii?Q?JxzvOerg23Nu50K63wyiEcNk3zuuVCeqdtYHNGyNP9ntyE3gD52or6YUzLT6?=
 =?us-ascii?Q?8nmR3T85B5o1z8KU3ey74xP8oWiB87tSKDZHArA3A8QF9tPAUImyGkWjIcWD?=
 =?us-ascii?Q?C8LOfjjMlsYpUZqcQnHer4hLOX33A3ttiWX1hNOt5BF+pKbDHw7PyQEsU0cE?=
 =?us-ascii?Q?zLAtZtvCDw36u+RbnWkYei1+Rb2Qf4HGfY0PqEsl+4oxdSuOyjKuwPxL4k5E?=
 =?us-ascii?Q?1ryTLdRguuh/nu4GXAk2J+qc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0R7yS8ycJ8dwujcqFQtXeSPtSpcWDHt8JGNJANKFf41/AMaWnk5ts1L+cZj?=
 =?us-ascii?Q?U58SQTRC9yaDnyOgNt5VZZWJitYNjequ7Bb/mp0mhZxKi8Aa5vF1rVOaGEz9?=
 =?us-ascii?Q?DPKuahhlaqz6+32ZNI6JHULbfLF1VgVAOplQaui9FlAg3R2zXWc/YU8B0xgl?=
 =?us-ascii?Q?h0nNikaDd+XOcXTcVBBs48JzirKXiySMn+fbNGZ4ExnpM7s6rsYTSrH9Gk02?=
 =?us-ascii?Q?KlCvBRjsIOvP9TgDSeKnXKNo8nJesf23Gz/61qDwUkHJT95Wl7iKB04lf28u?=
 =?us-ascii?Q?wsCFOCm9oymlmLr7rqq/HOLSnZ0PgjH1LUdiCY7sA2T1I8+ZQ5GRExjbxut5?=
 =?us-ascii?Q?UB5lis3eflGhIunlATKgdSp7H5p3MWIMn3Da3rmdnNXfa7XM2XB0aJ82pG6c?=
 =?us-ascii?Q?NbsE4we2Cz1J95eiBEAUGFIkKirg09YjTYQy7rezVvBvO/mTz8eedXzjaI65?=
 =?us-ascii?Q?CMsRrzLaYKAx+UxFNn5fv854CD5P/wlogNhKZklvAlN2Dnc0/pauNPxpB87H?=
 =?us-ascii?Q?534Tf3psA0wKwER3T6C6BSml+7q3Xiyw2votCIUo4od0hN+Bi/e/JXCDtBxW?=
 =?us-ascii?Q?7kKQnrgOEfynzd3mjbXh41qmKWSgael8NtKkTqSLC63AQzGyZB9jNA/xppKM?=
 =?us-ascii?Q?QQJ2Xs+e3jPnXLnCTsz1m2WPkhy7f7ku+237EpSJmN5XQis/2iO2Ngdi3MHq?=
 =?us-ascii?Q?K5bBQGrPPWrRFbsN8ASjSt4IRU6qmaa7c/SeNtHe89XNxue8DfRsKxCcmInp?=
 =?us-ascii?Q?9TieICZG2Gtj4a2g9cucPINupTHKTs6l5ggRs2wc1Z5XUC5VtFXqkEwnIyhI?=
 =?us-ascii?Q?xT3jBe2N4vhL4nGJUnqSagNQidej+NeABJjSi6Pk8pf9Ij/X6BJNnCiA91Ji?=
 =?us-ascii?Q?pcp6W3c6lulITgAhCceqUNSCeltZBMU4m7rk24pkNCtlBBLH56fpqWd2G85y?=
 =?us-ascii?Q?Ry9hdzRD7IiOlhRmdrfysqJXa/GEla9UDBTuG/3tcz+VzdK/HgVF9Ls3L2Gm?=
 =?us-ascii?Q?eBIxJDeMW3y0Yj744wcpM5ihTsi5db7DlWspqLx4lISbmYNvKaIeFje60IZN?=
 =?us-ascii?Q?67KFouh8tCOBhwKO/eewjMtSsPPMGBC5jLzIMueUXvF/myYyXZ5V25OUxcA0?=
 =?us-ascii?Q?BgFlcSesSqiTsR2Rn6apn1xVBHkEGmXNPBeyCM888uP1t96CasNp7UPQ19SZ?=
 =?us-ascii?Q?QzQaUoiCAYrSNdbmuAfXtxvWAGM4ZtLtQM4SwFoMO8MAiVUEXi3z2BEpqhpN?=
 =?us-ascii?Q?DdoykNizToeCQKnhyCaQD0/t4UB1qIwuCAubCzCAODX8v7WobVzbeQat0foD?=
 =?us-ascii?Q?TMWNRa1sHq2XIs3vg8Qp6szDeoTZm/VXe/OHDsIpf54hDja67iP5ap9zfdLJ?=
 =?us-ascii?Q?0FUK/pON/vwzGywYG87eN7AecJ4otm3KXcLENpopFWzf5ksPnUVapxFJaaIy?=
 =?us-ascii?Q?jQbBKd3YYn8XkVpOEw0DmODmYmIw5z0smrJLd21FYMmIe35LnwZuhL25byee?=
 =?us-ascii?Q?VOLOKqODIWRBdIz3QwYMyL3743ccpBQFqR26XbhA+mNIbTXNvXrXAaqdXVAD?=
 =?us-ascii?Q?WQZoFlo09wAZQNvgslwyB7Tv28/GkzYRcCoJz1v/4XKvCiKoCVjRzJiohlTy?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H4Q40q31lpIbCQdrFQ9AjnpFt1D0csbUyuBz++02JIvYaAsR4B+bXqG7Dy04OenTEU5ntdzirE19to3SsqIp3IhKEHQyg2Q/zMkNZX9dp1YzTtVrNJi4kWNeUksmD/377KncbsNY06QJZkwxN5NysE10l5VZevBTjPMNKh+WbzCbWm8a3rLFHelhdw8taJW4ALRHHMlwfWN/wrQvnCJap32gKAkOEKmeQrbmLK8dltcScfdVOffMj024ctljZTXyjCQAV/iDaB1HXApvm0Fov2YmODlS0aL8yZ6rQn2fGb9hMLWIj2uKaq9kZ2+b+0KDNxQimcfnspqrlJfFZpNUqyUBVzzfE02rYy995lK94E/41TWs+I+gJg+Yr4mhB5x57c95GMzRLAs0MY7K64fXCwYFzEJmOQawxiciVcRDpX8AAbKAvx3ngZS0kzT9YlZlV/hE9L1i+Hnpw+byq8TLMz7SfcD+ETkJhW5sgYNlpaYvwPNmU7boByawoAbPav7NAEuUvBgcKDpWt1d/rk4/PmvSpDqskCtGrnn0wHkrLj73wGFS+8GgMj9FeSHQcWXMTkwfNM1th2qLoZZhrrYk6QcS6wISnB7AjNo5VPM93hg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e33c30d-7fc4-494f-8699-08dd023e267b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 10:46:51.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBDhJtYy2vXGbohF+GHHRINZoyaWMyH5WkTCSaG3E0XPvKnqYbQMtNc0UsbV2VfsQcDxElsu/subYAJA7SY4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7235
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411110091
X-Proofpoint-ORIG-GUID: L6WSVM2Q8N9Vm_Sj7bhiWLYOqzkW_dup
X-Proofpoint-GUID: L6WSVM2Q8N9Vm_Sj7bhiWLYOqzkW_dup

I put this in while thinking vaguely that "systemd requires these
to be root-owned, we're not using install(1) so we should fix that".
If redirecting, the ownership will be the ownership of the running
process unless the file already exists (and the thing to do there is
to rm -f it first, not to chown it afterwards): and if we're not
root, chowning isn't going to work anyway (and will abort the
install).

So take the chown out and replace it with an rm -f in the right place.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/Build b/dtprobed/Build
index c43b62778381..a242afab94fc 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -41,8 +41,8 @@ install-dtprobed-autostart::
 ifneq ($(WITH_SYSTEMD),)
 	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
+	rm -f $(INSTSYSTEMDUNITDIR)/dtprobed.service
 	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
-        chown root:root $(INSTSYSTEMDUNITDIR)/dtprobed.service
 	chmod 0644 $(INSTSYSTEMDUNITDIR)/dtprobed.service
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtrace-usdt.target)
 	install -m 644 $(dtprobed_DIR)dtrace-usdt.target $(INSTSYSTEMDUNITDIR)

base-commit: ba6e6542c44f22b3707949e859b13209bebefae2
-- 
2.46.0.278.g36e3a12567

