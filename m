Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCCB12F5A5
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738045910; cv=fail; b=Ik8sG739IahnrW0lLZ3jUGHqT52Kww2y3qR3IjUx67fvyDVM42zFSs/GPkRUGVVFyM0W3siriWgbWai5E9ubRK+3JgZ9To4zdDUqLAFWP25Va5EhzzfHHwfgTCCvI5jYCNYDmRYhalQ2fgwD40TY+YSUPx6kR2vzD+Unc4F4Jjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738045910; c=relaxed/simple;
	bh=t5YWemZdFtm+tdCrmRFbH1G82rPOY0+0QSku/ObbhZ4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=spwSsHj5ZbUieQ6fCEHspPl4n8fwvvf1Hy6xUyWa5HTrQJW+3t5v+95F2GK/6BxHGrSnM4ZUPuH9aFjupdeiBY+AY2GYiX3sUvLUT6fknKAeHKx0mW7U+n39r4RiJCArXBEKjrp5Gkpe1viPdE7XkzF4nWTW+6Nqxtm5zGC67Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nqsTHJ0o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k04Qe3Pp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nqsTHJ0o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k04Qe3Pp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5bTI7015086
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=n4an5dChVUfPmtTlTRDKL/iw3PYAeeIKkX96hKBYAjs=; b=
	nqsTHJ0oM7kHWf4dd8osibGCIuKYgzylKH1vmTmRgmRZv8JwRkelTpkb+dGi0n9W
	/jT+suV8/evPb7gfPhQn3s2eUafhKxc+AX/fm6bnz5RFP6LBmTe+4uNsEOQuYe2J
	ZNHqOJtk5DFPPje6tGiE/1PakcQ6c4AfN6UbM5vLSj9ehRpLHWeWHZINpr834tsV
	/7jawuiteZLyMEJodrEUs8kkjBbGI6lmvyGRd19Z8FHvbzKpjokxc0lJm7mdrlU9
	4l1Pw+E3m5XiZH6felQuEHJ+DTr8f0Mwp4OUeeBKJfV1Ogffgoz0dkUvMp9qryxi
	0neZHWvFCl4b3+kdzXqKAA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44es88024u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S3t8hn034609
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpde09w4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXXQ9IuKCzy7dKJtSmw+KOSGH1wdOfz0mPS61Ig96HC22axHAU/tt1bAttcCt730Gol9+B/XGV3UtRVkk0IxG3RdtYAnKgWAKDC3Wb+lW9IfJG7HH2LAu3QVqcn/QK2u8cg4dq4YcovRox4acgh2qwf6dG1rUF3B8zLXetSUWKvMKhW80F0HnRFPSwe+sn6ZujMwQZzfvqqOQPPRPktsXH9j5HHFt1ry8dHIy6aTMqvAmuD1s3OiZmKv4QhJ8PgaJYGysFUYxEm8mKD//6MNZdt2CLOJ7XhrDbrFaJdK7QQEjCiMx5lvj0FX8OKqsyjQulOlEIQ5kLex+WNn6r1BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4an5dChVUfPmtTlTRDKL/iw3PYAeeIKkX96hKBYAjs=;
 b=Bf0GX4+KmRUriwJQ2ZmidQDBgrkCTfl2RUuYTI7ackGnQP8g2VuP0Mojx0F07H9zpidvwKKXI49jLYmcoB2iTjG99Q1VHAg8gyBaYEHEuaZZGfX0RucXdlfVhpEOQS84K0OSOgYi5ti4xeG373IJNGRHK8PIpF0bHPTmBnfbtqiU9/v/aXZXtUz/KrD4xXUXsDqVAC08+WYuP474Fr0NcF2O6cTprL8Qy/l2y/OGl2som2/fkobmw7WDvTaRuvH7zzzLy0wirKcIEKuPi8/GmDTdGRBnIM6olOFd2xLfySDWnc9jEDWp7jTKIFPH0vccdDKy8A8ECPRwrzYZ46O+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4an5dChVUfPmtTlTRDKL/iw3PYAeeIKkX96hKBYAjs=;
 b=k04Qe3PpDIb++VLtmVDnEs2X+lmyUzdrm3EocFZ4cD5HuVoKW5IeXXvdtg9WPqcbvRAS+Z7wkGe0hQJ2wn9IoP6s6keNGmZv+t1yaEquKpgyklyfdf91byGqa+g446RexjfvsdFcb+Sm4abDHRLLOVR+LLk1IVIQVzYkcbH3yWM=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:31:45 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:31:45 +0000
Date: Tue, 28 Jan 2025 01:31:43 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] bpf: implement additional relocation types
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB633706565F4BEEEDA1D562F9C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: c1eca36b-d9d8-43a6-b982-08dd3f656f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X1T5/DdOZQsYFSc/V4Ac7nrauZ7X5SEY7zJJguDFKuIZSMn+UpVu/Rv7A/2Z?=
 =?us-ascii?Q?BHpLBHEcbbCIPsfjNJ8Zg9/csy/Iy0eTcMZZAfHaU9dTTJkUYhnU8CQqCIIj?=
 =?us-ascii?Q?lgH0VWahbUcrGnTJt5JjqZF455qnUEbejYMrT7i6fyU+Xm88btGoNzyfECl+?=
 =?us-ascii?Q?dnGDg3S8fhst9QwbekGYyEP9fxQX3UBGdxXvfTHJhjCrGDAp1kZyHhA/hrYG?=
 =?us-ascii?Q?eKLALNuE8irmMy3Ua83AyB6b4TK7lP7oIJt2W6qHCQ9kCj96Hgd/uf70nqo6?=
 =?us-ascii?Q?Nf1FR9MzyW3Z7ZEnIK/dY2fCjDpeoxyowVFlg3981q1jTM8CXQysup8CkYaD?=
 =?us-ascii?Q?vHEFSu53J1o0bnazyyPjHrgWP9/Gvz8hVwCQod+kSPCT7BkT3D/cq/nwibSR?=
 =?us-ascii?Q?EgpfCOBbe0KXO6lH1Y+E78IztTV1/Md1bWo/C9A8vh04ZxSh7NvcwQTJtVFF?=
 =?us-ascii?Q?pMfAF8XnhiaxGad5WgNt5xwlaM3ibyEF1w/1bh6ilRP9H+u1Ol7+sG2bgy8O?=
 =?us-ascii?Q?Vx4/sEUbvnfWHj2s6jDBNCuplEqBfGV59rBQYi9rHLN7hihlthVQSwfLj2pq?=
 =?us-ascii?Q?dbBCp1Sk00ENm47SEnTtepYNxyOqlazp5WZWZzy2jzL4n6Q29s+d6R5SJcBN?=
 =?us-ascii?Q?v3n0jlAK1BaQHmI7+azdq5T6Haab7UMO7zqi4vtQToSZg0j5g+33O+bGWxxr?=
 =?us-ascii?Q?oc+idKVevkriExlPqrT2kaHyjw80G2eo4HlhCneJnopDUQzw8O06Wme1+AYV?=
 =?us-ascii?Q?7rdNup/jqKhPxduVLrowwC2CAMeB0yU3lA9WugQAA95fUPBK1bgj+6Td08W2?=
 =?us-ascii?Q?Oaava+sIUd5ewIloKnJ9L/Laq4RkUHEPk/jk+9JPUJaUftpofnfL5YC1m0iZ?=
 =?us-ascii?Q?jCGmYilSC8ebgpiEvh2GpdIu3KVmkmVYC/zBRyRT5tTB8AX9ncPvywknR6PZ?=
 =?us-ascii?Q?vhbqY1+2biyqm4yAjNfZFdorPoXYl7vX/YWEHnvYZ8ZL7Wz9LAUtDSomVyS1?=
 =?us-ascii?Q?bBu1IlnqiB/HIH1TdMwGBxwNtJkN7M+haF0IY8qavyjwJMP6GtA5dzL1+X6Y?=
 =?us-ascii?Q?ejKDMd4LSAjK+uxqBf5O9r1H6sqrrD/Jhx0NzG9qzjqhYFfXo5WinJ+TV8r4?=
 =?us-ascii?Q?/5woi/0fih1omynMAjS6sRH0TSS8PkbpDk+FJvaGoGN+SV9IIeDnduhHkTmg?=
 =?us-ascii?Q?p+EFcPx7eAiJFVbR3r6Ubr0LYeZS0aERXdyqQdJ8d3XqLmEGMqUH4cyFgmha?=
 =?us-ascii?Q?VjJlbdo3cO61kyrade/q1M45TNtwjxlwIDoemXfYkv3DGBzA/aw0zWccaQAw?=
 =?us-ascii?Q?ooBigVyixXLXW3y7IZdv7dC82QMqp/wvkV6KXIdrcdpKmyMQFQR5BSmwtMSP?=
 =?us-ascii?Q?C66ZsGSrp1hHS80Xs9kst6V+ji/m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N/BRklMWp4yKHNQj9AFnbqa/d6AKDVRr7A71D1H6jKEWurzT3O02ZDMRqC2i?=
 =?us-ascii?Q?McH76xLwgu6ZYhmdp4FsSOIcMcNVUsEwPMxIgS6TOjuX4rFaBIx/QS64acEB?=
 =?us-ascii?Q?/P60nXNpJoYgMx/3c+GAHcUOdjg2XOjA80lfi087id1vVSMgpyXEnoJ39Hp4?=
 =?us-ascii?Q?yd4IHLojd53h0/4QBj8DkhK9ZrGbish1oAOIf9QsDDMqEbkPBwIusGa8WE2K?=
 =?us-ascii?Q?Q9JHlg1xa0Z6Ir1vf0RAQaeDal0TSXuiJlWlI57v/N45+8rvL81H0whqrKzY?=
 =?us-ascii?Q?fns6Aqp4L191iXdz0aAvll/p2+T8ORuzQqhem88kJkYpu+IXCGU7evP3bYlt?=
 =?us-ascii?Q?wUluxZBml+cMwghuCEJCq4cU/D8N6OWzVEkgZ38qvZSJkGVCYIAnLcl/B9u6?=
 =?us-ascii?Q?t/Q70bM4JuDXtvttu0OhVwhLz+IwGp50ZSZaYN9UproKahiE6kWv+kUo6I9L?=
 =?us-ascii?Q?tV59lNPqddSobFybnpj09ceAbKBygEzLSmrQA+5WpslxHafOJ6WOVezibK6P?=
 =?us-ascii?Q?Oj9he7LkHMiMYUjIfOjv5uv3cB1kjZfNJ3zWIIEl7oo2a61klW0bFSgostO4?=
 =?us-ascii?Q?dZIKWWfpR7cd7KLvF6Z+Nld0S7SK1p3DUjT5OEw/Pmr5mi54vO/tceL7LH0p?=
 =?us-ascii?Q?2n7zPynQh2xVsj5jLwx6oqMxd/CNnkQwtk7HqO340NF8c9oZhQrlMvNjbObM?=
 =?us-ascii?Q?xInNX8/Hqv/CebZyPXmim6laZ8EeVDsAvKCOUxwzYpY4RdQxBYS/WepVpsJf?=
 =?us-ascii?Q?H8UdsAYu7j8Q6c3f9elQmvUPsUWmhic3MsioSCAptDAwV6LwMdeaykn/2DmN?=
 =?us-ascii?Q?5ZFzMiokCEG8E4T+pdFr7V5qM7ZFjxvo8Ca8KqjACDyH1eJnoiwPHPOlwpK5?=
 =?us-ascii?Q?jZY5gMERZZDl9Uh1JJ8+f9NIb4UpkG+o0cCyl8XZPBiOJhZ8qDBmJhdKEI9P?=
 =?us-ascii?Q?GLJ6XLyB7n2zOxINzCCFIlG7le5Uth0B2Dq8SV6p6rDgaCt7elMz8SPQqI62?=
 =?us-ascii?Q?ysIjDxkoqUKwYBWKaCciLI+1ehb8ZN1a3ObkdXNwprBIbRD1TvL8mXLOVHXV?=
 =?us-ascii?Q?KFS1EFbLpsVa3+2kXiqh1suBpFCuxq9x23h8czxiogE6sm02jGQn6UuT0P9Y?=
 =?us-ascii?Q?bCgLZ1MVUzWQPHJpyxBziXffG4CUZYF92D/3Ez91KOXKqE+/r3+SKN1VYkum?=
 =?us-ascii?Q?/SlJkJHe5uXryTPDBxsQ83Sy+XVQOzHfRwhnOO8GeUwehTc4gd/qukeaAI8N?=
 =?us-ascii?Q?IMqF6EhtKezb5Y6sbCFsZi6avaWa6a/TCoHKBi7V/xq44zjZlymz5IFnWnuW?=
 =?us-ascii?Q?cP71RuLREI1NSR/9hvrP41FPaaff4rxo0V1O+RatBPRtVYIwUns8xdZsh7yq?=
 =?us-ascii?Q?mp0qdNBvOjkhvj+84wUCFz7op7zkuFcsJImsHTSHYhNQjsK/i2JHogE0+OIX?=
 =?us-ascii?Q?1wwLsDqgfE8SJZaeUWfyNcf1kBHNn+28cur77v6PTWfXDTCdFlcFz/7v0VGf?=
 =?us-ascii?Q?j3TnTpeOU5E2wHxmTodholyDyMli6EDhqlyN8GlSIOOVoPtsq9bhSUOVpU8D?=
 =?us-ascii?Q?vlzf3OOUKaKaFMmpMNWtQS0OZs2UrBBn92zmPwX4ugwPbWK2vmyKurnxzSQW?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nIE6fdQWVjoC3dOtxFnamadT0k5HGiRCiC35NJXm5Qqg6FiDLV8iG0QEt1OzIwz1Vi/vTvEy0hkzJ1kbJpNSD41za3iS0TEzcMINdJgs/FuGfLpZINQIZeBWCLZVQ8K8Lol2+rBWvKmkecBQ6n8B7OW/IICrA6oZ+BLV58BcQgcqTm9vNtibOMdzORg/hC478L8FnWPw8fFVwnx26wPyXV/qPKUrSxWtRuuEcyDw1k1z1Zi2FWe9iSAN4IUwtZwMUm9FPJVfvRIW1xw3hT3Ev+6ylHTDVENy09Em6YAvsymdG8rrPYC97QolWUdJWTC1Pf8agezLv02SJwK60wwr9Q0710mvekrE60Gcg4O/bFwe3oSXVDCnLhzneZeKPkucty3NicknlixDOwjPuqX2MeFoyjBJMl+uQjlqly6WLB6joGNTPPJtnzFUpsuJ6bk8UpRhF6s42p2m6zJS12Tdbcv4YpvhNoI09zYZlGD3ogxIwNnA471DR7NmZ2pysVJmqTclDA3ThNwhMwhc90VOXh4sWoFDgNO8i5q/qp9xsPb8cs3Rrod2MQe3kbK2F2KsralBs5ba9bQP75cgnrx8sct19kx+QgktXJR5AKtd5Qo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eca36b-d9d8-43a6-b982-08dd3f656f63
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:31:45.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvPuqYLaOya4yqaRWss0/fMgDfWjpJhyv/21pcyxrkonEmhyq+KulA0PztszcOXB41ccfbOjQAhR+PLCvNcZqhg6E9YuEMg8nsCrXF1ACkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280048
X-Proofpoint-GUID: JNxYOQYT37z01o5RFrcWQFEMndKKxWHq
X-Proofpoint-ORIG-GUID: JNxYOQYT37z01o5RFrcWQFEMndKKxWHq

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/port.h     | 6 ++++++
 libdtrace/dt_as.c  | 2 +-
 libdtrace/dt_cc.c  | 3 ++-
 libdtrace/dt_dis.c | 9 ++++++++-
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/port.h b/include/port.h
index 6ce8611e..0aadacb8 100644
--- a/include/port.h
+++ b/include/port.h
@@ -88,6 +88,12 @@ pid_t gettid(void);
 #ifndef R_BPF_64_64
 #define R_BPF_64_64		1
 #endif
+#ifndef R_BPF_64_ABS64
+#define R_BPF_64_ABS64		2
+#endif
+#ifndef R_BPF_64_ABS32
+#define R_BPF_64_ABS32		3
+#endif
 #ifndef R_BPF_64_32
 #define R_BPF_64_32		10
 #endif
diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
index a634b855..d3126f9a 100644
--- a/libdtrace/dt_as.c
+++ b/libdtrace/dt_as.c
@@ -492,7 +492,7 @@ fail:
 			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
 			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
 			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
-				rp->dofr_type = R_BPF_64_32;
+				rp->dofr_type = R_BPF_64_ABS32;
 				break;
 			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
 				rp->dofr_type = R_BPF_64_64;
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index eebd923c..29cfbd84 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1266,7 +1266,8 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
 		if (rp->dofr_type == R_BPF_64_64) {
 			buf[ioff].imm = val & 0xffffffff;
 			buf[ioff + 1].imm = val >> 32;
-		} else if (rp->dofr_type == R_BPF_64_32)
+		} else if (rp->dofr_type == R_BPF_64_32 ||
+			   rp->dofr_type == R_BPF_64_ABS32)
 			buf[ioff].imm = (uint32_t)val;
 	}
 }
diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
index d983c099..b2e66754 100644
--- a/libdtrace/dt_dis.c
+++ b/libdtrace/dt_dis.c
@@ -639,6 +639,12 @@ dt_dis_rtab(const char *rtag, const dtrace_difo_t *dp, FILE *fp,
 		case R_BPF_64_32:
 			tstr = "R_BPF_INSN_DISP32";
 			break;
+		case R_BPF_64_ABS64:
+			tstr = "R_BPF_DATA_64";
+			break;
+		case R_BPF_64_ABS32:
+			tstr = "R_BPF_DATA_32";
+			break;
 		default:
 			tstr = "R_???";
 		}
@@ -853,7 +859,8 @@ dt_dis_difo(const dtrace_difo_t *dp, FILE *fp, const dt_ident_t *idp,
 		for (; cnt; cnt--, rp++) {
 			if (rp->dofr_offset < i * sizeof(uint64_t))
 				continue;
-			if (rp->dofr_offset == i * sizeof(uint64_t))
+			if (rp->dofr_offset >= i * sizeof(uint64_t) &&
+			    rp->dofr_offset < (i + 1) * sizeof(uint64_t))
 				rname = dt_difo_getstr(dp, rp->dofr_name);
 
 			break;
-- 
2.45.2

