Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CD1885B0
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324519; cv=fail; b=R9vjWiSMnI0/WqenfBrWBhp6ebI5miu6w+AXQmsHAr54cULdJoVKpWcT+XE5ow+xmir6UAo0Y/rHTmM+UGSHSxv72hK+ujHnB/4rg67lBggIZ4JH6rNC6BvxhX3rfGQHIQePgafT/SAguew8TdIKqF59nBxVU3dxT6KFR6SYx0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324519; c=relaxed/simple;
	bh=oHycLRSUYCxZNf/HMTbyc6RJUAAVpqWjXgGl5pFSjsY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aaV6Fe1OTPVWXzERvx1CsCKWjU/bE91l5jEgenQGsf+vFzK6wyJED2FmX2ksyfJexL6RLCFhvAV6yWubi+Yq4X5JgRgt0Q1uEWRzMqinRHLrUcbvONbRhYZBWVXHd5iKlAoES/P8Euv4YRkGPfWdzYXvOIfjSJeyl12tm+5hcxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jp8GHw0H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iXHsIFGn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jp8GHw0H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iXHsIFGn"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9sn5T032367
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 11:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=lrZRx2gxTIeZ3OzW
	FbPdVQbdkshMhq+9yghYikuz/xc=; b=jp8GHw0HnwKa1kbOEBJ8jEYjsgdqapps
	v+vAxxQas1cS9mOW674tiayssmpNtc1rUofKCxsxVDUPrnR/QAFyAS1B5sYeoWlC
	q9b281kHuyV9CoVddL74SBnB96x4zzznsT3V/8BwAjpe3f3sxrDR/fD1tjFtVeG5
	EHdPSiwsQnRqd9Bwyy6ZckZAak1Lnbk4QK2zLVl4pa5T5zCi2gzlt/kk6zg4gTul
	LaVYupeWICWDRvn3gPt1iMZAMr21bOMsYbxYk/sf3wnim2/Avo/ukyTVUiL2wn4u
	29PbmzkdKpGHFPFcObNR0yuN8IgRQhsdYGcDDNaa/GZURxtcoYkxEg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwj8ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 11:28:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABA9nf6037220
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 11:28:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66wwun-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 11:28:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bd5ePA+HOhpWHE4ifWokJCGKfrrA/3qu4M5C6MoSDHjFGKbCVdyFP2tzVO7B/1X5TeIUNGx866hY0MGzRfJ6ssSMrbTPasNrJtHwq3vdXaVI3OGwgIjdImsNJRyomHSQ/g9CcLgTJsXwo75sUJzqQIjT0vgHx4gT5iSYpjAZEJO6T8MVtVjS1m0f5xuboKuYEjCU5ISYSGzAqkAkLZ+XieoH2OBW2kkgLi9NFpIgb2e+ZaU5iENOPz1SzeoF+kzHWz9aJBytYa+kgvBRLQvSzI30OYrehcbEFOr7KagAbebzzwnDZuagMtvnSGscBIGKBkBM+Du1qOy6okvch6euVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrZRx2gxTIeZ3OzWFbPdVQbdkshMhq+9yghYikuz/xc=;
 b=lAcvF0ztcbqkIw4S6xIPZYXDgi9LuNKaaVVdwZO+y2YpZS6iq6Drr7lJUS5F0cXTuknjViqa1dTw9ByYgxqDsYuNRenMliWZtjIGx3zzViRnTThev2Ecqdn8oIjApMfokasjIb8Jv1fmV9Dk2iw0TCPg7zPBgH+CxQSlgVzghJ1KoIe77kJs49m/ljdW97nVLPz4qv5PQ5EJr+xgDU/iMlZE/IkHOpwSenPfk6V5z5JFAxsL/4P1L6oWX+L4XLtvdo34rORxtuvc2hzhNdUYfGvHEcnUfR7JJoQtRQ/vKkuJrflu0PfpsqbQRHS04SNNWaLMNfVpewlr+NqTpbGVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrZRx2gxTIeZ3OzWFbPdVQbdkshMhq+9yghYikuz/xc=;
 b=iXHsIFGnowBE1YUcIxY/zJnrxWjcRi0kV3TwVmtyUiPcFjWS3uVJuEFFQGDlUdoc0cpxa2prhWk+fiEAJ0PqbaFl9y/d3A8m/G9Aqvm9LkebWqP2RZthZjVX2SG9J8DrffQkaMCcOR+aM9eXU2dOW9MdZfC+v15Hg+srQcOEKN4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB7748.namprd10.prod.outlook.com (2603:10b6:408:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:28:07 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 11:28:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: add missing files
Date: Mon, 11 Nov 2024 11:28:03 +0000
Message-ID: <20241111112803.442129-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc0ff99-0ff9-4fc4-da51-08dd0243ea0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aZjQNcflf//toqV7TjqSDr6eWVJ9WNqDK4C7mdzzoeYASMBc5HTD9TOW1v7p?=
 =?us-ascii?Q?8cKgOyeosFIy45oakLdyJDk4Bbikz429z5Jwo8YhDc/8rNboQPLSEEmO50UA?=
 =?us-ascii?Q?E/S/KGoGMZb4ariYx1B7VuiYOtna67J575ZrBtcUfyLKuUjwrLM5bhd3Shd8?=
 =?us-ascii?Q?KG+FSlqX+fFtC4cTwS4EaZocXTWV4GNouQ5Ho4xD3dNfRw0XA5UVQuiHjVDt?=
 =?us-ascii?Q?lSyN5q1ICYsmV/0HBZ4wHlrtkLqTd4g+TA/2S1N2zcfMEczV/8JYh4hh8zCS?=
 =?us-ascii?Q?NF0+/AoUQDMzC0si1EhF/lGDVqHO3yYSX74rSfjggzwQpwlBOj/wXbyR7umm?=
 =?us-ascii?Q?9FZyZ5v3J8KPIepkkeS5sH/h3ODeEyPU31UQCioEakUgI5P1eofL5W135bQr?=
 =?us-ascii?Q?N6MyBMauJYyOAQd8kCLyTS1QRl0A6ZE8xncu0QQXheAnFOMBbclUeMMBbkjJ?=
 =?us-ascii?Q?ARZQiRuCPnQEDX7ch0oiunL23/f7MP6KPGIICC+ZfakS44uYXIBGHEn7U2nc?=
 =?us-ascii?Q?/4DjD56rVm5FHJ3vsZrMDsmp6lMHomsgPeOKxuEUVp3OYYDhu8HDbtLjR4mn?=
 =?us-ascii?Q?sgu540DM2JICk6sI+YuY1U24KZD7+MNcDsJCigt7N6mBH5DWwml604fGg15t?=
 =?us-ascii?Q?/RgFXQHyC5DThOtZZx29jRVcRXIr2YKl98e3cZJkIqpL6av1daKIm90CSgzv?=
 =?us-ascii?Q?qChaPyMvqkimZSU42DZKr4JYccsQXDAUWmOL6GtOWd57F0VAtIUvZ5bm9xaI?=
 =?us-ascii?Q?GJeaQuItoLiBg/8Gx5v/Zfb7nyGZtcbMv8N028rR+zuXm/qMUNd/QusBIYms?=
 =?us-ascii?Q?skCpPiuLGPucI10HwWXYWSO0r7B05fWo4sqI+rJM/j0uWXFg+VZ+p4FkbKTx?=
 =?us-ascii?Q?yG7Mr9LDNng+A1u3Q84yNGjDrnx/5ZR38ecsHSSXXZN91OErfDfXw4gIZu6e?=
 =?us-ascii?Q?/kBHaTPhv4g1pzD+tEFlBa2ste+lg+oKFZKABBuQzCbp2YOxp/iyKsT/kpgq?=
 =?us-ascii?Q?1awVZceu57RV+O3aiX/VYAypM+WonCzXBjIl9UXewYSYFi2lq5wkrEWDtW/e?=
 =?us-ascii?Q?wR+vqemmuQ6SAcAtREKIqpi43UYxRsAbUZUYVDu42hcojiwOPzc0PFNLAf7i?=
 =?us-ascii?Q?29kKPhOOciOIg9QQxwfmH5d9WL2dTWXe382wEiLnbTJ4a8Jh5QbQPetEiEXH?=
 =?us-ascii?Q?UcYyzlqKlnCGVQOgxzILvn8HcL+AOWJ6Rh/TzzRJcoMmGe3SIkS86Y9Ucheo?=
 =?us-ascii?Q?Ht2kO0ViJ7GcoYbAhVlZq2c+8K3aJJiLbYFxH9UZwHEzR1TIho1PDAtFuIjs?=
 =?us-ascii?Q?Fcumx0A+eDqdBkr/fORP24gR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dflw0aR6P2E5heQ24oVp7hCD85N3ylgATKuRqbGWEwIatt0btepOBtKpcubA?=
 =?us-ascii?Q?8bwqvRQw6MtIEt7S728JgB8DP6cTUdvui0enw5CMfUPO7FZfnHdEKOOTyOfD?=
 =?us-ascii?Q?Sy098oTf731C+w/eh+pvtEVhbKYTKV1mh+JrDz5T5JQ0Fr2HbLaqyuG6MDtR?=
 =?us-ascii?Q?K3V37tILW46h3c035jhh0SstmxCr59CnrZwo2gOIT+dyurF5dZMKnGUxNjY6?=
 =?us-ascii?Q?F9226uj/xkYRl7ar26J9gIw+1LeUCfGR+hvO5PNYx8ONt/lA7flnoEFI9f1/?=
 =?us-ascii?Q?/HIsC9rElyQRI/ga4npVdVn52TYD3HiqySqXE80Ho/PORiGDS3P+IX/8brZk?=
 =?us-ascii?Q?Hiz5DqK1nHGTh8c4fHKUkeQ10K07KhomZdiEpQrhIYy5/GGfQv/t/mWPnjyF?=
 =?us-ascii?Q?DChC4LFg15qDrmdfh1mMYYDZvg/rvtiP/CqBheDeujDqYcKzBZDX2FGgzbS3?=
 =?us-ascii?Q?UiseEcnyhuzS4GtMF1fpYwlwuLkB75P7uMmNT9dxAixH6S1fMkMigixlXlIU?=
 =?us-ascii?Q?zry0GHEC41WRWseh82xwEWdxLuL1Ak3/juy9UEa4yVsppk090bkm1ZSyUGA4?=
 =?us-ascii?Q?I490MMbQB3THPsnUdDiojJPehaBU+0XRMrZ26wUVAWhOItXlnkCGf7hfaGf7?=
 =?us-ascii?Q?Cw2WUeeQvK0acqSRf+8rXH4s0CDWeM48ruDDSgMlu1WmAR+ftBazReF3enU4?=
 =?us-ascii?Q?dkxfJy8WZ5IZH4P8c35xD9uERI6Jqj8t1HwXAQAOwHqvzjs87T/D4InhNXzU?=
 =?us-ascii?Q?7xFJZBK7JSqESXsQ0r+iAVtwRRi+1qBudj6lDZNZPm1cUDDQKl4YPTaIJz1w?=
 =?us-ascii?Q?F09x1J3IdG2TaL1/zVpcSb1/z3M8gcMQekQ3nQcMwbVP6Duv4Mx5wIgzGu/N?=
 =?us-ascii?Q?1UcBDEm6u6SHseIzET/bGq1VvNkjQGOey1pUkGR6WlK9Tj3NzBiBgv/E0P1X?=
 =?us-ascii?Q?oqHBp+Z+tUShkAFozWgADl5QhKcCMODFYQDRYRRf0ALVkH86tGO3rY00WVho?=
 =?us-ascii?Q?y43h9FBhtMWlRhFe9zfnGK1kmXBTeIDN23mwxDdZhHjPxvJbuNKLvO0OrO9H?=
 =?us-ascii?Q?jg+w31NJ5RHSmibAwtWnTxq6qLrHyXN+r4w/UkawNp489wAA+X3O8Q+EhaPE?=
 =?us-ascii?Q?x9meA/ui9GFQFZd2uSXJN4wkjL4ZFNk+DRsPGqO78EtEHIGVnazRD+uFj7/r?=
 =?us-ascii?Q?Bb/RwHBud61+3Xz6bdOwLiMGHbldcuY39UdQjPFqs6U8pSMRAsEaVo+8NX50?=
 =?us-ascii?Q?zdYD8ASiKNMGzZ44yS0QZqfU87sss3I3cxbVmxzdnmIwKeZVPCAP0rANgkNj?=
 =?us-ascii?Q?Cyv4NVa0THxjo9mT3ICz1yqWjKDhrzcWgw5CqoGRLMWo3CNl/zJqVbo6tj3d?=
 =?us-ascii?Q?Rwv0i/khvHGCyHeL1zRG5aRo1qyqP9nUA35lutDwxzsTcfrgUf8nqoq0yKLe?=
 =?us-ascii?Q?OiCb7h2gTa+4bIsjj+lBUb+w+bJxJK8v54SuuM54AuGm6/zF+udoBq2jD/cP?=
 =?us-ascii?Q?R47nlNL2QFnOL/v60XcpUn5OKrcRcc8frndZ606H6qKlsw6v8MYbIdhpWN+9?=
 =?us-ascii?Q?LguNMpxFeI6uDKsG6Pvs9fZwtfg/QXQdNPOUqH+EzkTMn9dAXziZmu9rsG+S?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZNn4SbLV+8O72dYUmytAP+DGCmLYm61Yv9DhvUEoy887i4Pd3nxCUAzD1NZ+7SpDnAMUHAP4Zw46937GURcu05VsaIatwswywJekapX+wLjgIyCLY9kLCLnmJi+z6aaImrbHMLDaJ8Qs2p9i6SaGI7geI/rBQJgEY0vtlD5tdCjJO3KYFvtm5vXfywqN7tjhldYkd9T8Ij5IRnmCnxblirFU9u8uZFGM6Aqz6C2xGPgB4GQwylXs4xvZuFGXNif0dKywf35fxPvsDIPoK5bJJvTwO7ID13AJ7JpYR41xpCBu5r7JEWqoS213Z0JXBsNA5A6sOjPBiPWlMuJ7IQ4qUvCoZxL02FyeyQZjjT10Hugv108d0KYClfBxw8o15aCCs+8P9hd/03bLzEF8odt/5j09XLuHBAzNV6CDY/C5T4g4UUmkaOIHHBjnDUuWCdzTJNeXHNlVYSotZFTv4p/697jNRq5Gy0tn2THN/kAGK2loWdmictLIOOSkETn1c+ynCsv8vNqzMQ6KhGnUqLvE29WCF15vLYw7JlzA8x3XZiqopqYSC7XqySjxy2sX6xTMlTbYpYBY9yggvNDhLY2RqhFofUBnG0JiLP5QcHt2rSY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc0ff99-0ff9-4fc4-da51-08dd0243ea0b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:28:07.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqDN2XHUswddULtvwpaCgLUOSIU7FwzPvI2Q0/5TPgQHcWiH7rjY7dSPT/x0KweBaHvod7v89Bu61cIHulx7oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110097
X-Proofpoint-GUID: Kog5T5GUQozfvpLJLij2UQ4HNBtaHgYD
X-Proofpoint-ORIG-GUID: Kog5T5GUQozfvpLJLij2UQ4HNBtaHgYD

I added a manpage for dtprobed and a specfile for consumer writers
but failed to add either to the specfile.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dtrace.spec b/dtrace.spec
index 1887fcadaed6..af98274cb17e 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -248,6 +248,7 @@ systemctl start dtprobed || :
 %{_sbindir}/dtprobed
 %{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
+%{_mandir}/man8/dtprobed.8.gz
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
@@ -260,6 +261,7 @@ systemctl start dtprobed || :
 %{_includedir}/dtrace.h
 %{_includedir}/sys/dtrace.h
 %{_includedir}/sys/dtrace_types.h
+%{_datadir}/pkgconfig/dtrace.pc
 
 %files testsuite
 %defattr(-,root,root,-)

base-commit: ba6e6542c44f22b3707949e859b13209bebefae2
prerequisite-patch-id: 32a3530f9ee5456481ad7f36ae491ad9a1642790
-- 
2.46.0.278.g36e3a12567

