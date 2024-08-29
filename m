Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976183AC28
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908967; cv=fail; b=Mcg1F41ByXDikN7zSdb0+L9PEIfhQ5/eGl2eQZ1dmpfK3I/R/pIAgIuwhtdS+4ULVz7BGncI4aoqZ8o5RlZLAX7iZet2twhRHi3lMN8eW58G0HGs7Qjf3MwoCYY6eYpvg90Vi2XAWXJVyjHiApmt/5P0ssIpOSd0cr881M/hrDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908967; c=relaxed/simple;
	bh=qvBB7BmVTd6RZ+Ti1dxMRIU8okGjnnYHPV7HlAQ7wgY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J00zdkf74EezD9d5GoPj0v7ycJBfyoJXrNqjuJgBXYPWqYagqC+HcsHDArg1quPMTJ60IqwVQaZNLuO2WuaSVUuiKU/2kjjzAGa8N09lborVx/OVEj2zdxP1ty4rROeMu8KkdEELb/JN/ALK7GfcfZjQeJjNDPInS35ss2pcxtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MsLqzISd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i5kVGdWW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MsLqzISd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i5kVGdWW"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fblu005695
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=SVkTQOZ2Jvmlnb
	YJYkovT2mMAOadN7Ak+DJzka0gP2A=; b=MsLqzISdxUCpzCvoSBrQ8QTiPyoTj+
	quxl31f0IXfkjHji6ftxvIFl/NlPRm+8pLaxpJPnE3CesWGIHWWx/qUIhRN6tsZU
	KjL2nl4uDysAkJWochk7AXmWdUE6F23oMhCRRaPnvlTgrR4GrI+18YUans/O1Txb
	tUKW2122P4QUg0wT3OTC34jdPTNOSJvwXMxOsS+Tyn8n2amwfYsJgTMeuwuYt/4j
	qNDyDoCwJN4VkcYpeEvZMW2NHb6D0Dn0/3FfULMQ50CU52J2JXDZRtRf4q6+JHfA
	Kuw7RABTULGmJf4lyHnyQbPOP+RpvcCYX7DdED6Pdl7ZRPwHYUU/uJ+w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu992-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4W33f036604
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmrp9b-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6AnNmvOhTMA2wMMfAMOSMEAlfhwJEaGd+pd0fhNXmAN6r+j8ev4CYQ+Ceyaz3PLPqhHI/zjyBk/cSY5xhjSlZ5HbZcj7HWr2JuCOzNla5S+3n9ixwS2YOc14nMKyUKmhZ+5+JHeo4L8ZkwEpxlPWaTVqlSR0vdjrXzlSHyOFrJ47+Wze8Mku3TdioxtrJrImissbPs7Z0tFjcqCG3kc6NrB0kVvuBXCGSD12thaiSHmqBDQ/672DFDQyW8sNtCNyT/VFAVQu99JGwMbWHovH3Z/kbwnaqALdPK7IYxOo0YBJIpidaaAiCROXnYJhTIOD3rVYgrTHTrBptBEdc2+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVkTQOZ2JvmlnbYJYkovT2mMAOadN7Ak+DJzka0gP2A=;
 b=Q4wqyqSCk4GIiviGgCbjV/Q1RAS3/fts1BaltSlyKu0sksVvq3YkdWU6RFyvlfI+wVt6rW+U3AcX8/80lCfUizH49z+IM533WqMfzHGimfmyeJIOzh3vYAQgg22tK+nLDPIVI/+Rge1XJVNPNWR26zaV9jW3HoNx/1PnHYHoGRxklwz5vV+Qb7EfLJM71GnWiwrmAjIfLkC1+pykYMFXANQd4auUiqQFet0gVtld+1kcJ+SBqqXomj4GIWGfcdnx2KXmuwihYs8yBHGH4Kx07RVJzsPl8IafSlKCSyv18ArXc2Y3eY/IAUUHYe5YyExwMwsGCB2jpxzmkvb/If+MeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVkTQOZ2JvmlnbYJYkovT2mMAOadN7Ak+DJzka0gP2A=;
 b=i5kVGdWWTL1bweScxT1ge9BiotZhvM+SJusH9gWYOH/q6DnFVbB1/7iJyw5omARSA3Fum7xUZDLjlo4GqOXz6uBJXeh8r274DAsqjB4dJ52Jy8OPPad0SvqhMOkv4azbJO2JsxPVZo4AO6iukS6JYJsRqqP+HIFlrHMRPNQ02Go=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:37 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/22] Simplify dtrace_stmt_create() attr init
Date: Thu, 29 Aug 2024 01:22:07 -0400
Message-Id: <20240829052219.3234-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:208:15e::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a904e3-d2ab-46bb-169a-08dcc7ea987e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C6lt/XpUPe50BUcbuX+Qb27J78+pvs7uvw6i5aTAnY1S++4qw6brUox5ABGK?=
 =?us-ascii?Q?mWuCNW7tK92Hy0MWtZB4kFyrsXI1rfP+6TKVfnFY0D/HPjk7jXmYxshSB8sR?=
 =?us-ascii?Q?BKfFv91+bNciL/lzT7b9oRwlgecHFcS1H+ysvc1CojXhnyEk4EHLwPtqY/ZE?=
 =?us-ascii?Q?wqCz+XJgHWltQOzyjoRc6fECL5oqaOM/a4i+VFFth/qntIB/eI3bHEmpINhJ?=
 =?us-ascii?Q?OvyCTO+SS6JrnWmZM9x8L8N/qAY6Eqqgm6d5E178vv70lgYWmToq58UEVdHy?=
 =?us-ascii?Q?K8xvpQSFoXCEaFu5R5fnj/t6QfV49PWzvKN28sbmjP13KsrA0w3SVIM3K5l7?=
 =?us-ascii?Q?8cOG6YlYx+HsQdtwbZdHv+I6G4jZhEq7Ph/MdWrIo/zf/TvI6tnjFZ6l5CiC?=
 =?us-ascii?Q?ynmFmSUGCtOvhwtWNafvFHG5hOwi+6G60mBLIqheoeeZm783yMULmC5Q7Cou?=
 =?us-ascii?Q?XOPkZugLCBonvLg4AB2PDRLKIyip9J5FS1u/PDeXlRfz8IVYAu8vYYjvkszO?=
 =?us-ascii?Q?pEJFOTA1ib258ObbVs3s0W/NRmy2spcUREL+Evpm/TW/C7ld5LafHkER4rqI?=
 =?us-ascii?Q?crtUGG54saFh/d3WrvCkBhPBqnjmKUHmF6NYl1OG2CpLquNZmNOXBWwKXcSx?=
 =?us-ascii?Q?XmFhcOIfj7Fka84JHVbINDPny0TnnrVvJkTWYlmQscBuTo8Lv1USiusr4gSg?=
 =?us-ascii?Q?FXjFJ81PX7SXAPbljC3MkxBVxHKXd1D61AeycV++QLejGQsdR0Hr8ofMP/uG?=
 =?us-ascii?Q?qy0KF/By29fhfqxIlvOCY3xPGd3m1Xeu4xZvrEMkla7F3U90GoWLM2k4OTgI?=
 =?us-ascii?Q?DDiImeO1FTVuwRY5hjinPpsliEvmNUeUpGoDM9nMDb+ztbABy+hTXDgHqUhn?=
 =?us-ascii?Q?MHSSTk13pWM4In35m5jyjzUY6fnpf3E4EYdsu88wFxF6CUH1llb0o4SYvolX?=
 =?us-ascii?Q?dTcG3W4BtxBEi8FQVJQ3s+Wo7r3dygDXAZvbnRiUIe4Bgg9C7yheDpNFRMnn?=
 =?us-ascii?Q?J/seNOoKUL9G6zXCAnFw01iEMl8Ex6B5vZNVL55AS7Q4oPdeY1XSoKQuZFJg?=
 =?us-ascii?Q?czNc1WL5/LA2OCXK/bhk+ur92iTdmOlab43/uQEd8A6PSliBtfWFMG2/4HOm?=
 =?us-ascii?Q?f6SRsudwubPgzx1r1ruAfOnp1XoSIXtfBwldJLJyeffhlVDA0rwAUXLkNyCE?=
 =?us-ascii?Q?Z7/Z2VDkvPDiMBznpthIMUrOCXkMmvqSDYqmC0OBP1efp3NdwIOok0n9GEVh?=
 =?us-ascii?Q?vqWYeAdaoA8BFBLLFml6obi0Bc9JedZ9oqWyA6xzgmsRnT+4PmK8cvS+WNEB?=
 =?us-ascii?Q?2B6bwbgEQ+eJfLM6Bq7cYSA9q1j2xQBM5WmUI6qr8zwXNg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eVWV7wwKL32zIpisU/gu9/5wBQYYuXESHyjX66dErVCA8CwVaV3tnyaT2keN?=
 =?us-ascii?Q?u0SxziTKbFOFSSDwZ5LWy9Mi0YWQqaBcpu/ebSDhSliyrLJqcO0fTxD3wzZk?=
 =?us-ascii?Q?5qcerPGsVlUM1jnG5AZ4fwDWwyBc878/UNZ9yRrWbtpie+i5L8oFu/mbZK/Q?=
 =?us-ascii?Q?tX58wZcG3o79kVwadFj3VLk3YiyEJ6MAWRHK1AfU51GhZfBe7L0E+Y1mRYhs?=
 =?us-ascii?Q?iXbwzM7yaplUiO1SWwr+hLe0vuL0Z4MqREIeTB6f7LII7Fhx3Ths3rIaMqVf?=
 =?us-ascii?Q?xE5UFk0C7TcEuXOj00glMLXWvGn1wvMEdUBdXchslZcD7XIg+Z6jVy9aKiK5?=
 =?us-ascii?Q?XDV4IGejK+ewFlYDC3k/cwXcdgDLx2DdvR60Oh/lcne32l83JLEMb8ISSBM7?=
 =?us-ascii?Q?t1OH6B9yd2TOb+FHl5ZntboJoEY7r6offjRMBf5/rSOeLr1Q8IJ9DP/+7xnt?=
 =?us-ascii?Q?ro/P3Vkq5srP/d7hh3YJlhoaGhlhPncbKlKUTTq3NHDhspVilgFxdm9uTmC3?=
 =?us-ascii?Q?xtuV0xAOB5QXHb0R87FxXrRQxUZ2fsvUuCEg79xlMRvJu8neaR3zCqf+HlFs?=
 =?us-ascii?Q?A3Dc7SHmXEhf3oihJtQQJq0XRAyk6UPSW0hmwOYOp1WE/C51tGmj0iJgbgyV?=
 =?us-ascii?Q?8GraOIHahFCp60OAvRQGxHcldFW+ojk+3dFsYdNd7YLmrbJTGVQVdZqf3YXj?=
 =?us-ascii?Q?OFDtZRfXu6puNbV3c59N5MUgqGT61l8b/qKCYGzdJAHB8Y5lHUVei517bgAf?=
 =?us-ascii?Q?IXuSl6EOhJ5WyWWJs5IpBjeyAHtBgFVGMRYOTGD5dbN9CAHO3REMmBbnfwQu?=
 =?us-ascii?Q?/95ph8Rf0EIGuecNCh/kkdIO3EksmdJ9RAhE28YTl49Ecu8ET+RJGbziH/fy?=
 =?us-ascii?Q?+MuUh8D1nkE6fzpEkwNlji8PAlAIsv2KFCJ6P2svEPCDpvKAMyBBXkobaAmd?=
 =?us-ascii?Q?j9TpEbG8rFmfvwBHiGXRnTTT76mbn2lBoMcXNsUfrCVQ8Q8JqJb2l8QyFeWc?=
 =?us-ascii?Q?Ktw/vSr4lyD3EO96lVbw4HU8KFxWzMuSB2Td1fikWg9yasvE5hQOVJfKZX1A?=
 =?us-ascii?Q?NqfYjOy1KJfCNxPHEzQxD+jy+vVHn/VewaHT6X4oE5gymRgwwMoh0tjpRKAO?=
 =?us-ascii?Q?dgBSQjlSMRlFSmmnlM6NcPSP3aD1ktxayANEX+RTVXUU/WQauh/LgXCLCZl0?=
 =?us-ascii?Q?feUhq5cv1AAk08Z8szgo1Tbr5COoqujivsgbnSRhEYhA1hYNxC5YCfbRRy+E?=
 =?us-ascii?Q?VBOCI60dhVKIw25pVpueIKaECNzg7j9ZbACNHaKezTxl4Jo0cSe8JlmnIURC?=
 =?us-ascii?Q?SjRvqfECMAtxvfw/u4YPz0+p4OMLczGhyXJu6UG2RY+bWS178YuaxLL40Qxw?=
 =?us-ascii?Q?F6izT1YZryjsXjAF4DtoB/u+Yg3CvOEI+Z4xHCsvJb5iewujJK3fvhawebUM?=
 =?us-ascii?Q?1WA3YX9Jx19g8C2f7VpVx3eWb6jfH3uqYyfvTIEli0sga+AhGPiDZ+rYsmBr?=
 =?us-ascii?Q?DgAv81FuuWMcrz4yeyjhd/FxDClCxLoi0evygiyM6KUAQKqMYB6C2jPOjvDH?=
 =?us-ascii?Q?Yh7FPr0S9x7QZvWFv8raYrE/n4fz7tTfO59R5i4X?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jCQsH9l5TrvhQNRNXcD8dvv20O+hCNbNzvBA51z4vQSYSo8iOKQzdSUybaUCv3/QPUyCaswjyrObu3HR0jmo+HNNAOGWbwNgchiNC4+QUhH63jfPpS5H79reYi+wC7/6O4nWVSDvsqUbGeBq/b1oUocWcQvj0i43leCnxGH68IVPCbj/J/2eDIaU23Aw4Mn8ZzVQ6p6rnYNt9e8p42GH+CIGaavZWi2nHhYuaXnEEplxlgRGhjRtsutP2XADe9uUwvI9w88oB+dUoQ86wH+wpsLuCI/F+PHT3Gm96DTvSYPVe0uimoNqq2/WBgNzEabu0zSULiwzBQYbtxPSisP+caAey/V8b4WbxefgTrctvYcG72Q1biDRKHEFYyfsm/2nMQsYHWKWgG10ELFlN2d0BexwMud7k/r2I0Qlny4anPu2noX1Fnp+pMagCNeHaLYr7iTeXISdasdt/BOTiKOGL9BSzR3JXSrhrogCZTaKKph4658wOvW9XsCMUFsQJRYpEY/X1c8p+lTy4nwpn1WG2Bu9WjkR5LZB1AhPUqazzuqwIAXd7cYXgdltYgekmxl9LsNfLPm2cDbK4ALBBIRVXYM/ON2ULfUfNnExh6abNgU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a904e3-d2ab-46bb-169a-08dcc7ea987e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:37.6316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZBD+3gIdbSXNlFH4aduEpHLluJDTGd1wEOvVXHsaGV8HXur/dn0bo7jtTYRC9rK9p3CY/2d0Ijwcbt5L49aUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: QJVgawc59fq9Tt9dN7E8P6_rjzIVZXJ6
X-Proofpoint-GUID: QJVgawc59fq9Tt9dN7E8P6_rjzIVZXJ6

From: Eugene Loh <eugene.loh@oracle.com>

Even though dtrace_stmt_create() initializes dtsd_descattr and
dtsd_stmtattr, there is no point to doing so.  Its only caller
is dt_stmt_create(), which itself sets these members.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_program.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index a4b052fc..bdb434e0 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -240,8 +240,6 @@ dtrace_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp)
 
 	dt_ecbdesc_hold(edp);
 	sdp->dtsd_ecbdesc = edp;
-	sdp->dtsd_descattr = _dtrace_defattr;
-	sdp->dtsd_stmtattr = _dtrace_defattr;
 
 	return sdp;
 }
-- 
2.43.5

