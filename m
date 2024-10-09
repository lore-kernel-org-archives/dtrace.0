Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7F156C6C
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728513049; cv=fail; b=aKMXkN8K8X4WnM+V0fC6UfJpNKNHmMAqfQebXEneg/qI34jDanT3mIAmurIbThXnWjj2KTv3Usiexc/q2pmiMt0R50ie4PEk5dT9gi3HA2oUG7KbMB602RyDOTKOWccWRNj/nyDFi96TlpPIh6uHenDcXw+r66z/ZP6wnsixO2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728513049; c=relaxed/simple;
	bh=gWz8Ywl45+1G/1M/LNDhy6WPQBcQHgNLS4N7UOfIllQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NM0CQ2Jka92A+Pwxp3coSLURfy6IlUKfUy0IkT9I4X4IcoywT0DznhQYNT47kyi/F9Mf5PG3ZLEWEWjgk8aiTjNzukgd4Anfb0QrKmSMacrPTtdElTe1U50medjD6pDWcK2Jr3MvacbFHghheu9uQNAeWhZ8cpIBIQ03nDu7dPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N1e+b9iD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UYl4BQmX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N1e+b9iD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UYl4BQmX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499Lth0l005798
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 22:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=WzN/T2/sVEeHaBp42X
	OliO2uu0t2ppzf940wWrWeMCo=; b=N1e+b9iDkZGZ2vMzfdAvRkbyzgtqKYWgol
	zBaF2ctgyfRvdkPlIkhBxZc9lTETuVwcLcDvSPLwE85/WzQf3hBaR+mheaKhT7Fw
	XhnfiNKqrxNAWxNiWGT+6nC2g37+fMYERMdARPFU1t2JwN700PLI2MpPIZ+McJgf
	SrmyiJD0MER1HlE0LY1qOhfaO/qWiVBMCmpofgcJzNsNb9sA5QCtAnXP29zorbs/
	K6LwEYTOaAgnF7kQJFCAHtMooUKdCc3zHBWKIixdmCOGAc+5vUH1esGxjjIdNJ8e
	5nXXQVxewrIDYJ+RZHDgASb9s4R3hbeykjIrRoLj7w71XevXX/gw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dsj0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 22:30:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499KaKEB038420
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 22:30:45 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uw9b00y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 22:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocL6CcFV57x/LiHcl493lqf6OqqOEtHduCI9i+shWoQGQVR8QI419UtdqcVuUrq2W/3tpwAe5oWb5elR025uOlmTwqoYY/Jh82F5ZtJFaGZWf/XMaySib8Ibj48m0tdNMVyQtluVsdiWbUPfSVZOTjRsh8Gl77Tgil3WFE4W1wTelsa1CHsZe3hWnQ2vIBAYGnTPVHtd4O+kCPj6aUK0iG2+fBm8lmK/noBHRYViC+QqsOjh4w7W89Z1NaBq5gkpHBQc9yjB/+ygGxeYX9zjqJyAMnnO1KRFEd/ThCJXRTiHU/xdFfnEbh7IuAdm/Y9Jj6CDK0hS4dYD5KlT1OBLjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzN/T2/sVEeHaBp42XOliO2uu0t2ppzf940wWrWeMCo=;
 b=JcousEOdgK+VAvmdSdVWfUBqNNPU7sTcleaY3BnRVlwYl5I62mI9ZqTqqZ0g1GJC87n3TllxOKvBYeCQqQZCUvZDWFNUu0FgoZAhm+95PvhCAaCQ1a+RzNp4Wx0J8GE7pyaUX63nCgIOswMScpTvu4Q7meyZmARCMvvz1JVeEXrMJ0MaLSyq1NNPW7bR4cnQR2WOgIRI6OsGVj8fqFNYhu9qwQ+/Hq8XlyM352c9Pn5fu8X0jRKUx/lCBhPIpcmnJEY63jB8qJ5ntVmMlYWw/RVu38TWADW3WLlG8fSVfCQfcMRcZp+t3pB2xlBcTnyhroOygSeqo+eEtfw5BBl3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzN/T2/sVEeHaBp42XOliO2uu0t2ppzf940wWrWeMCo=;
 b=UYl4BQmXBBj5KgXujy/5t+yeYePWNv7rsQlzkP6xcCEdK5uoqjE/sFqWvaU+4cczpXCiIgXCT0FLGV3F6780lJ4hzpB2cp9xI3vLy4n7vpRyUlOMxoPwIq8Y2sekwJ/a7Oz9xDU7CpN+GLkjHxjtBTxMf1kV9PxhMzcpaoMTVLU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4323.namprd10.prod.outlook.com (2603:10b6:a03:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Wed, 9 Oct
 2024 22:30:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 22:30:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Fix prid fencepost errors
Date: Wed,  9 Oct 2024 18:30:35 -0400
Message-Id: <20241009223035.5659-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241009223035.5659-1-eugene.loh@oracle.com>
References: <20241009223035.5659-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8e7107-88aa-4cb3-4f00-08dce8b201f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ULwrDOOjtXtZJwU4oOuoLhmt/tibNwBc4IyEImzqIu49Ak8VGf8cYh+ue+5S?=
 =?us-ascii?Q?zKF/kbjg7cW56GsKqA68H4WrpT+7UGK2OFQ4z4+HTqc7WemB9jgaw9NlCwr2?=
 =?us-ascii?Q?0nvuacCA88cOAgLxS2BXbH7oAJzmO3y4j/qRGQTcC2s+lmuIC4CFZS2OzgH5?=
 =?us-ascii?Q?DrPawDG5N0jz7oLQxeEta373D0/Z2AftcnUEpFv3CCw82eHO5IOu82qlDxJX?=
 =?us-ascii?Q?t3llQnKd1yiaHCB5XpuAcX0QSWW07czuBMvkBnFJEQup1LmJoVBZWdUVXcGj?=
 =?us-ascii?Q?dbRBwD6vcQBfGsNiUabOuTk5B9RDluj/vDZLfe3o/wnoeNgVI/FYZQl3w7yu?=
 =?us-ascii?Q?KGb9VWBRqPRAaFHW65Wnw0155lJyeEH6VFI9T7tqIRVZ8i64f71k6yT5oAgH?=
 =?us-ascii?Q?K3OMrop+5p8J3neAaLR7MQxQ/Xm7sa7lOPffWMmbAboG9k54ukDgGEZZtcYl?=
 =?us-ascii?Q?zYY4VAgsvGqwzBG7B6LBMfEj6APgwZZ+5wNfmKtzaQAvjY/HX0CRckzqL/6y?=
 =?us-ascii?Q?0vmT29R5+932f1Za7a0qUKBlzwWGJvRbmjbrSd3K8IFmJ0kaveEZUTYcrDZT?=
 =?us-ascii?Q?LovhMrwxHzIPu4GCq5vyJoCoOF8Jmr9cBGbGl+fgqqhBU5IOW0w73ARaoc0U?=
 =?us-ascii?Q?LXQ9mJLQQSn9zrpwhu6BBPmFRI7lBsWSvro6Mleq/FT7xWaV/paU+9hIsxI+?=
 =?us-ascii?Q?Hz/f6IJwj8uPQyk24sc0klC2e54TCkIOHfK9/mnfPA3dSDR5zBmHdlcxIkYK?=
 =?us-ascii?Q?pn5MUhZC51zs+OnpHP4v2rIqExy3stR8Mw3GACn9tPnHUeDcatECvONn9Umg?=
 =?us-ascii?Q?ZGuQdvbSL8W23Nsfpk3lA5Mss8Qhrq0Sw7zkFeY2OOexsZv93v7S0pELHraI?=
 =?us-ascii?Q?YL8RwsvT5JwjEYV83FcDB1tu0CIm7VqBZIwshGIxuoLnQudJcPduhB4ZSgwU?=
 =?us-ascii?Q?zARjznWbUH9fZZKO7K5tIrhJQ9sI8pa8UcIRws+emb5A8iyWMiccC7gCkjwj?=
 =?us-ascii?Q?34I4Z0jSJhH3RU/XG/tjPIyvlvc+XFjMaA+i4qWBNHO3jVolGkWAAe0DhGN4?=
 =?us-ascii?Q?0TLSyJZGcXUeU95sPD2ZmHPGUgqDfIhIg4p0SwshKpr6bUjTYd2OGJ6Xcw1V?=
 =?us-ascii?Q?BnYIn/w1oA60stBAxDfyOJRz97jpAZooPQVj/AK4odovs9e0G1D0DXc9THMW?=
 =?us-ascii?Q?rCapsU0xfanxhPU8S+tRs7plh9TYpE4+ZhE0+f66r9NXof7f8W9NczZj5Xv1?=
 =?us-ascii?Q?lPdJspjR0Fy9qmyE/hhr1CwyKwYG0QFrdlmf82hFrQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EtVAVMm/Hu2rlo+sxtMNDYZafvBW8Jfzl0OSzJl/CEtibU+lojl1mBaMDSv3?=
 =?us-ascii?Q?mP1h2UAOksVNjhTIfRaVvnwCPTrUUHciju6PKigX34n8xxPZoMZyIYok/qGY?=
 =?us-ascii?Q?9n2OA+ITC2f0JYkzJ5Gv9IBsZsR7yRJfACevwCnP7EszTgL92HIGBfAo+tL/?=
 =?us-ascii?Q?O0uJRRUFjWuharO3W95xnzy1VAwWBaEOgTSPHEtMV8CsQ1aoCjZiEnBabypb?=
 =?us-ascii?Q?zzg09fWSebwzYHaafULDp8SQ6hLW87WVvf4FNMeflxXIvwJihSB6Ghw0hWgG?=
 =?us-ascii?Q?tVMElk7xFzPUrChtBw1IWSprYiB+PAm3peUUeFMVcR5WGrx+H2IUrN7gFNIC?=
 =?us-ascii?Q?CBo6UAL/SDHLDEQ7g5CjZigdD5QQUHZWFMeXi0w+cuFKgTScj7LuosRiE9qg?=
 =?us-ascii?Q?uKCcgMVAntlBsIr2cIIB5s/cnjqCClACwAoCwLnCNby1EY4SGAfee3o+EcBF?=
 =?us-ascii?Q?e5h40JdTFTTCvCABF4ReLbDRnHMFljJPXZWQh/MlByZh6oWTOwW0ZETyUWld?=
 =?us-ascii?Q?LhvFuP+uJ3N/PmnpKkquguod8WcCZCONkecjnE4xUWJk5SbO8A35alqbaDA5?=
 =?us-ascii?Q?5MYaTQDDzzyuXXI5JHBcyYycDL6YZX9qtFfbfVL6cjBDqdIggroQrioBsgPQ?=
 =?us-ascii?Q?zdoZHhltU//I0BrfOw+g4f5T1JdGsmzr7/Nqu+g8fPlIkIvo4ehg5oVODpYb?=
 =?us-ascii?Q?RngtSjqiaOsDWJ51GvmNJa4XcX/7GofpRgHrBN4/YCh2CYmLpfPiF50c+RjF?=
 =?us-ascii?Q?oPw6QTEwQipEcwphzevQnTFOqLieaDagA5qa/ZiXZfF6Nt9NuZ8TeP1jelv8?=
 =?us-ascii?Q?u9vVFCH9twnT7eNsqCJGbiERsKa7CCQ4HVEY4ZllVzkWvyLC4M161KoE6J7+?=
 =?us-ascii?Q?8Jkjhmtu07dc2DWHoDxldaoh+Kz9fluc9pArRegiBZbtisPQ/pJjj4Kb3wXG?=
 =?us-ascii?Q?uwJqCfJPLzseIFfpuLLb2dBNuJIpBIwAv1rUBINaBGZVK/O1esVXIt4LoF/w?=
 =?us-ascii?Q?ffxF5gMNtfFtn6c6cb0G9JZw5t73ONw3r0utIhLdA4l5FnwD0YxmJEVQIrel?=
 =?us-ascii?Q?CYk1iaSy3BJsKT3yPSM+ITUux8Rc8zXSK9SHFn4GZmYmuwgaHCjvj/c+95f/?=
 =?us-ascii?Q?nqfQmvzj6OWS2mIyX7Xjc7f7t5J+BFdszB4Rttvj54kQJpmF5ZPRt5wb0RDY?=
 =?us-ascii?Q?dqU/bB/MWTG6HdJIn9/A3+XtduuTrCw7FMPkp3gqZyWWkih4M/tdE2cCFPNc?=
 =?us-ascii?Q?NcqQc6YGEJkpKvtRACAX6hbkjZNySWdG893r9Tky67EeYxwtYCQltHB3lseR?=
 =?us-ascii?Q?/lLAVMspvnMGHojPR/GbcLnt4gtbGL7n30dTiC0T/lUuQdPUZhexLz5zui8B?=
 =?us-ascii?Q?rfpdDFJzHr76G+hvA9iWbU+JRBGmXKa47arKhS4blgMLSq8UMKMtsgJ0T8s+?=
 =?us-ascii?Q?J0HAbw0ORqDzn30o+PRfcfS6bWDH+HjrTLVQNm7sRgWKahGuYrbRRqLerVUD?=
 =?us-ascii?Q?B8+cQ/4FbGtrUeogYqnVMfkwNWozCDTKLP3SWc8Rsm07Oga7GddUmzBXrFzI?=
 =?us-ascii?Q?cAFrRvGS4umcEjdWjjqlyObRZwbO09GqSVz8T/gD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mzOFnrQ1hox6gNKWZZS8ji4go7y2dCiyjbk7efmkWuMzOx2dYftYJtUK0j037CuO+xHbBfo9SzQh6mkTJlIkv1BS7g7KcKKwusaTqqt+ktKb1sONjLCCfwVHTuhi/FxS12A9ngNnKlsh6wLcrkoURXyuT8fT+8OfdH0DCMx2zBKvZ9GaTkrT5oLwg9OwzjtxQX2zkzz3WXrJfVtI5Ixlv+tuYCE9+EwzIMwf1aLQuda0kshfPWR8VKJ3I9itIm9O69l8DtlCUSRoXDRcVaMbhNIFYSnQffaRIghAr4bMFVqnE/+rlurn8gAZWdEpOw0YhWu/eASxblZbOy7NtwMDWuIIY7WudJ5xfUg1QGV6kr2wm6VT8QYHb1mIYk2wj4KFUiSPAfCzfp/U38rri5FzURVnTyChVwQI2UtJXKXKSwqsiYa4kIUREbhLDo/DbRnUfnIYeUFqA6h0yDPK+/QtumVtxn1cs4FW6P9/izlahwN/tWD96LIj1IdwPrDChJcRURgNiF8MR7UUUnMbco+eQt9POopQ9F2UeDLLiP6nv2jKVhp9do8VxIXImKzJ+rteMIKEMj1WV7gYLUoI5LXmpFnkAZfGa5elOhPKzZknBqo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8e7107-88aa-4cb3-4f00-08dce8b201f0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 22:30:41.5843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lcjDw2WNzX4pgOg6DcZOe29T615TjntaQxcWKkQ1Uw4H0iu+fssdnUDfTGM/SpBdUtwniLd5/7zmYPz8RVV7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4323
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_20,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090139
X-Proofpoint-ORIG-GUID: amw35XPen86lJptJIjLf1qzWTzurt2vm
X-Proofpoint-GUID: amw35XPen86lJptJIjLf1qzWTzurt2vm

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c | 2 +-
 libdtrace/dt_handle.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 3e8e1b465..74004c69a 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2205,7 +2205,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 	pdat->dtpda_stid = stid;
 	pdat->dtpda_data = data;
 
-	if (prid > dtp->dt_probe_id)
+	if (prid >= dtp->dt_probe_id)
 		return dt_set_errno(dtp, EDT_BADID);
 	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 	if (dt_stid_lookup(dtp, stid, &pdat->dtpda_ddesc) != 0)
diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index 09fae99c3..69a6dd388 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -148,7 +148,7 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	prid = DT_REC(uint64_t, 0);
 	stid = DT_REC(uint64_t, 1);
 
-	if (prid > dtp->dt_probe_id)
+	if (prid >= dtp->dt_probe_id)
 		return dt_set_errno(dtp, EDT_BADERROR);
 	if (dt_stid_lookup(dtp, stid, &errdd) != 0)
 		return dt_set_errno(dtp, EDT_BADERROR);
-- 
2.43.5

