Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E8726773C
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 06:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758175345; cv=fail; b=lIcXlD6iA+cnK5JOJ7k8Twjm4fDf+nBlrSN/jCTqyGymuKaRdR/eJrkCW5eM5X9TaIXHt2k6JOC4+n9PXzrwcLraTP3lmTAxahqTBAO7pe9xOIENVrIXWzdhWi5qOgnsr3Q1jTu/hHpMcDCmYdvadjk5FwkWqwWhlaNcMQ+rcsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758175345; c=relaxed/simple;
	bh=Jw5WH63YILaV0qQ/vPI13pgqtU6VvsMI5pYLximhupc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jDD0qKyOv3I5ZOoeg+/1f07wRk4cEiKezJkOqyTVcdcduPRBZDTijiHHH8lQWPwzC9HanTlHS03u8u3DAwqp+gbTWRheBbZItwHW5R5+9u5BFeh/Nmj1NRXrjHITppt/w3ZJr84YAxw6MnGxT3jUmzU9rSxTaEeaYVfUelqbZwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mtEqlTSu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gkZ37Te0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mtEqlTSu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gkZ37Te0"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HM4G5w031343
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 06:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=9OpG5ByKsWHJJ96I66ffIMYkMt+vZBxfN3XiCC9Qbk0=; b=
	mtEqlTSuCFkufDDgq7fx9cF4chfWwvinVjBXMex7tUq6/u24GlwkM5hWxSZVaSle
	ZP/nLzB/7+ICJ/285PMHpqlTxRVEXXsFCnc0y3+Cht5KxtYo7UPznq9hueA9ushL
	P+uHsTGUJ4aYHUQ3dzBCLbD8FUOO/f8GXGap4RCm5l+4aLw90gWNl+qpx5TbXIDu
	XGfWZn7wvw3QNBhM6qfCSS+pvfPwXwySwBAp80sxX0mIDklN6Jj1oqvw6s9oXi7f
	Cjrcds1TIaqZQvkDTatYwHlK2BGzV4D2ge8zG3/6V4b8pu1OksEmsNfkGbRbQ/05
	DEq9mZ6vQtTeawczwiYDWA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fxb2r5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 06:02:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58I4f7Id033675
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 06:02:21 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2emse1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 06:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYG/K4GisRKCC0975Qs6Cl7PCKV6XDjjdhwef/s0bNRs4zniFzEtC38SDTKnYFUZ93sZH7kafHvKD9+Rlv42dA51kyF9hL7HwMBqS3lJzigQXd2P35maHMad7zi0A2UgJ4FahrW0agTwCSmVbvva4aE8XQedF9by5cGaeA7f87rg09auFHx1MQZjst+b8pRRk4GdRtBGeXQU5ee7am6Nzj4q42NZ7J8nVzqF4JtEBs4yDwMCmqZMoJ9OUg/u7KqgkSJ5Qh52Ob6U5FSFo5FTKIxBYgVyHY2+kw8GR3qb108lIewTzQO2FGm0wQ040dhDd7TIm8fm0kp/CeTh7MtNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OpG5ByKsWHJJ96I66ffIMYkMt+vZBxfN3XiCC9Qbk0=;
 b=DYHRN05ktq55fckGhvHD1CGYUV9pgD/BsP7XvyuM3CYtLdLzKJp847PYb0ND4z+ZU4NALykdRWY4DRKDVdwffOQB25+w1R6WcDBDQZgNnQyDHCsnN0ACnTSAwA6g7Z5PEVJ8ggICnu+H/g/5BmLtEvxJmnBjosGfi0SVor6/6V8CpNCs1Eir6YegH3L90BPb6gLwqJ+8emW+QpswCMshwl1GwMiW/wyRQZb11mKeSW1KgX3SRtqufsOBdTOB3uoGFBFWlVJIrj84QrKQDUhQvm90njf6x1IVaBPUfrGNR6aBiNvyx2XahlbJV8s4gWpwtga0L+ef/RwOfVteLXNuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OpG5ByKsWHJJ96I66ffIMYkMt+vZBxfN3XiCC9Qbk0=;
 b=gkZ37Te01g7soRETav8Fj8UPAojVlohcoCk8tBCiHpulMMHYnybMjEsTlksrNbLeXyoOhoumZBx2UvczDsMLA0XqycMtT+SULSvJJCIcJRo3BtIl3tjVrGcv2E+XF3HHfAz6H1SBHde7/WI+t9L07LYCaghP/H8/eyot1BGoE/Q=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4766.namprd10.prod.outlook.com (2603:10b6:a03:2ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 06:02:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 06:02:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Allow probes not to attach if they were not "needed"
Date: Thu, 18 Sep 2025 02:02:13 -0400
Message-Id: <20250918060213.26896-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:408:142::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4766:EE_
X-MS-Office365-Filtering-Correlation-Id: 555aaa0b-d554-40ed-c7fe-08ddf678ebe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cVdN67aQDg2bcy24DgdKU5WGru9iT6Icq3meA0366LSHTKR5aW+JWthxAVGh?=
 =?us-ascii?Q?50kG9EszVLxuYeLg1Bc81JSi7q2t0zEtC9/hrSV4uEf0ezIDT7cOlu4ecY+I?=
 =?us-ascii?Q?ZB27RiFqswf/8QWs2voDpaAeP8hc6Bjf5o8fqJEjNu1AlhyXR29JqP1M6M3R?=
 =?us-ascii?Q?tFoqg9BFsAWlrxCB6AGMplkESxyzC1Orv/Zpecx2qoyb08hYrQsiuJzn/M8U?=
 =?us-ascii?Q?T9Oq+bQepQG3Jz7k0H1DYGE5wYV6xiiEfC+dMAulDxOzRdQffcBkPeCG2u4J?=
 =?us-ascii?Q?RWmZp5skuLqfFiYMS/Y94BZu/lTZoVbFEmXPa53l5GwXEQVKpcbmS1NNmbS5?=
 =?us-ascii?Q?PtFcnkKrgfnykXf2YC4y/MCq/ez9iAda4y+F2r1YDnesMIqc4zUHKhtB8CBO?=
 =?us-ascii?Q?uIqNwt81iZOxXoVAwok0Q6typ7/4eQzOQulq/QSoL606MQ0f+ga7qY1EUg2a?=
 =?us-ascii?Q?mxgmK3/87s3uw0zTdaTPRDLihHtHI2OlKBjtw5SYKmaeAKjm5LUuqUoCo2Hy?=
 =?us-ascii?Q?XNoAG8oubT+qb9cZlfck8R/fJo5rUICi0MK6LF/ZafzWHe2cnHbgjaS2a6E+?=
 =?us-ascii?Q?GTaL+fcEMkCSl5JTKrHMHrqgGrlx0ZI3e++LBENEIXsLkKnKzipU8Pvf6IJj?=
 =?us-ascii?Q?8Sz0oqEX/HCOdz/0TXbSCutD8f5b/ZMM2DqQ8Z9eWFLwHVlKcKY7QTPd1DyO?=
 =?us-ascii?Q?yyOuqxdieZhZrU2bG3Cfqz2o5AStY+KTX9tS6DcMEOCSC/C9LOx5IwBWgWpX?=
 =?us-ascii?Q?VSsvO9wWaBMHc1fp66lqYvLYfX/bUoq3VNLFKWbebrCnfKLEotVgDS47mtVU?=
 =?us-ascii?Q?EUsLz+cewbhrJTgEQwWJBY3EbHCNgacrAZDE4Bfz8s9SZjHzQTARxoLRwFZI?=
 =?us-ascii?Q?ddFjV9rEpUCy0LWm7TFnmb1oYW0ItsvBj8M5xHsk1HyIze8pr1Sj+47x4PkQ?=
 =?us-ascii?Q?9NSEgbU3yzdfDG62r1fGvb47XztUT1Fp9Ups9S49N7MIetDlzHtJ9Zga8VTN?=
 =?us-ascii?Q?pILHrMCIQmJuulSjHdZnj5qVA2Nn+w65i0K0oRAEigegA4JUEUbL1UOajvoG?=
 =?us-ascii?Q?XK8giffVmFRGSrNS6i0+8bO0th1cy2wwLGrRw21mrrWfjaeoiOEj4goGMQZg?=
 =?us-ascii?Q?mlWG9on5idOCvmOP3b75DJpXsXDNVYTS5CICC/1W2YnZhzRF0M+iZBGf99iM?=
 =?us-ascii?Q?1zm9d00O7b0J0/eUcBIgXvNGVx7OASQI4y9m5Vq7C2vtX0PEcbRt7gdTYOUU?=
 =?us-ascii?Q?9ZXYL1+4I+5T9CvzTb8UZJRdOmjggZcs2fi49kib7nf3H45F57PG17y9ORQw?=
 =?us-ascii?Q?FlXaWK/LzrirKY7ROl5lk+0hpiv1hfeIAk3h/YptQ2Ki4qDpGQWzkjIiqOrs?=
 =?us-ascii?Q?Ee5XlDonbq7CzgfI+iknzhQim8G++nKdhs+WDwvj7xJF+AjJBdDDlwhH38HT?=
 =?us-ascii?Q?9PPkF4+xdLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BMVBBNNKuyIhksR2kUcWRqEaYMdMwHEoSQ7varqG90nupTR52W9iGjxsCWi6?=
 =?us-ascii?Q?jRxjM6APuW3FkSPrXGoSdmlS2ovbjUUm/xXxFm5wCH9oPyfHhMhncw+2k3qP?=
 =?us-ascii?Q?LLMBI+youaDhkKLHuBE2bSrcbPXhrumo2hIngecAoiWASB8MBFjD5gL652zo?=
 =?us-ascii?Q?RqKj2/P+6ubn+ORHBR/Nuku3H/S5IjU+3V3NVgJhOaKFwN6LrzTT8KucknYA?=
 =?us-ascii?Q?sW6sLneYFeJ02KtM0PtVum2ivT/nEnlrqx8XEKlzymRqUumc9hdSHL50lgkg?=
 =?us-ascii?Q?70gZHPnj/w9wD0xgl/+tRbYUtJfVBilO3DER1rVRcyPbgjU0FkoSXkgm1sqn?=
 =?us-ascii?Q?zdcUt8ynIJOwxgbFIMGQHjg3HQVZFtgWyCrHR6r4QD+hsxVYP7Ak9UEJo+B7?=
 =?us-ascii?Q?0qIF1g2/r/oX9BKaxg9ulxBIjHK2OcBxRWAIFsvTvEFGQmLd/N12qzp1qsYP?=
 =?us-ascii?Q?oUw5ZMH2q5L6K9+nI262eQWPzZXus6OgO2KDus+/hqsrzN870el6G2evxtmM?=
 =?us-ascii?Q?VXbTfAOQccLYZKYj0JQBzl+a5CMjg77Y+RGHsNRKvQvUxK3yF+k5Y6qHkAAR?=
 =?us-ascii?Q?vU9BCFjCAeqNW8F2mKxOhdw6sOVh5qS6PyvvFjfxv9YPCj6O6NNNFFe8zdCj?=
 =?us-ascii?Q?/RsQW8Zp40zlnk2AYJuQOrTKWwoxv2kRcavzpRKzyawllCvTxEsPUpviWs7M?=
 =?us-ascii?Q?gxqkJXnswt302NleaFns5A223/UMv3OpRkwpQvPYsi8xXWh0QneXe0xIc/Zl?=
 =?us-ascii?Q?TVjSRM991vlhSYTC6HNXZLO3vwJzIocfA0bYDM/I23A2X2LbHjKPquVweLHq?=
 =?us-ascii?Q?yY5uR9KvE0Jqlqds860nNZmRMZ4gMXoog6IoHW4w5Ri4NKhH+kH48LX/wmF+?=
 =?us-ascii?Q?UqnljdekmFwFdV5tHIGGT+gwOcBrKfiEFkB2QAIBPjvTaZSiOotrVADgURh2?=
 =?us-ascii?Q?WYXpL3yTsjMIG8EZkfz1+mzgTu0ss8GIt1X9HQQRpgyIdS58LQfaZlKLsVJ7?=
 =?us-ascii?Q?mH2QvRjeBzGRBK7S4BZquQUsrAegzYuNZyLSY7rzB2lt/9Cfl8OBBLz79ohX?=
 =?us-ascii?Q?HC0aRhMeLbLLvjkiqxCpwakTNcXUURqoB79GVCUFZiiKfCFQ5M/Jo0Mb84DZ?=
 =?us-ascii?Q?kLAmyHDGAuM1ejeQY8pGTTR5mVns/qN9NC3+gjQVuei7g5qNdIW1tewqVupd?=
 =?us-ascii?Q?1bx2L4W4mciQnKoWqXZYGSC7+QuVep7Lxz/LLJWOd5gghhyzZcc0AVSI4lO3?=
 =?us-ascii?Q?inzwv+ewi8yn6cpRA/dHZdF5hYHQdTGDiL8Ts/D/oueQz58mcwLSMX1Zkbpz?=
 =?us-ascii?Q?FGKHyOWD4zwEYrex0ctAnpc34qjEHg/YbkZAJusag9QhQxb3Ad5ufIMott/l?=
 =?us-ascii?Q?VYGqs+3P6sMzIE2rxCh1FGhWwaoYXspQkdEk0T57l4BqYPYKfpe0Booi/XdN?=
 =?us-ascii?Q?ace3hpIOFuGHAcxlbjMWisSfGJMI9iAahZqsHDY+Nh9QWHFZJN2GJ+DmrrTJ?=
 =?us-ascii?Q?vy0k0g72HlLauw1fBV1ykqpHhwcqthTKCIzXwbMu/pGi0Z8+t7q53NtQOnRI?=
 =?us-ascii?Q?xcMI2OSaOe6FeJeTTwkpuJdoTAv0BcsHyZd/s1GJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2TFBmW1fVuGGFAaLoMBdo3JRbzeX3BhvbtACv/1EpZXUGViTzCksZPw0zUkefKLzwrtpCuctQfqiNfUd/tZQVta/Eg56e4p+x5j8AGqKQVY9+l+CXTOTvyl6p/PjxI1CzwH0vGjCpsrt7g76D0/pnwOLo15KOmAruItUe/M6qs5RY2ixOpevlpWbq8RYLcDJKeXxntbxSXltkFEZs5vYo7IMNKrk5VKGbCmUTbIRriMFi6ar6p3VwbROm776QsSHQ7yM5J/cfQ+lWSaPifVZqxuVFSZIIAvPmBcdr1HUme6zDR2n+GlKPGg+Vho/hcPIIq/H3/5456hyNHFi9LkZVAmZNjt27+8vPV8G9NqJmoVD6LTPn5gmZuJsLXf5yOWUSakKcyhvlaX4ixLDpc1Z6/8RCb9W4QtTZ9e+WFmVIp4Uk6oTUeCsE6mMrfEqffPOjkWjByQCJQXMYjGucSXD3MzGP2m5NBpwIFg1j5vMyU1lQwflI1gQZQBflqwDtRoblJ4Kn/y4p1inCWQmIkUzUrUsqURiZ8256PfgXOhGW1+LPTsw2Ny/vhEtGfLcDWzLzkQiYsIvpuVeGebkIXv6U/i3oN9abrw2gksvmMhFmzo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555aaa0b-d554-40ed-c7fe-08ddf678ebe7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 06:02:17.3588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74Ruto2CWUdFZOj4XVFc21t/ZN1Nm1A8493I4kqwv7szzxdWnalu+BGY7izldqW4axFPAss0AfZV8WDSLsLGhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4766
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180052
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1w8OcVxcZwXc
 aiAskFV/anleQVXWQCqjm1xClf/QY2xlvOCHp7/8cAS2bRTIVsAD2XslaXVB3VN/s9Cn/XtIrPJ
 QUr97c+gmnZcdLvoZiHntJSXcAx9oNun69BRHRUYysM+VVyBYEP9QsHmyJq9dPeZ8Y82RUI8Aga
 BQlaHS9Co2C97HuUMipMODFWEje3JgFmJ4MsZaq4t804VpSCOM9TO+DRjOD88GGbBodJgxIQR6U
 APCJMzm8JfYM65KF3SZpkCrL5nmnZfWdXh4mNRLZxPPj+h+ghjxQ7gZPI1uP3EtKa+u4fpXBhD7
 95fzF3Najof037FTRLrxY8XzOGR2NzHmL/HHKW7yQT1vk5sFEqq9VIqbgPUgEwFoW/J97bYrM12
 km+0IEwv
X-Authority-Analysis: v=2.4 cv=KOJaDEFo c=1 sm=1 tr=0 ts=68cba06e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=mJyVdKuwy1mpQMmB:21 a=xqWC_Br6kY4A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=kO9HT28NNgcKIzFy5qwA:9
X-Proofpoint-GUID: 6y4z2tuM2sKZQRCQNiqaMBJOYuBWczwK
X-Proofpoint-ORIG-GUID: 6y4z2tuM2sKZQRCQNiqaMBJOYuBWczwK

From: Eugene Loh <eugene.loh@oracle.com>

Various kernels prevent the placement of uprobes on particular
instructions -- e.g., on x86 on hlt or multi-byte nops, or on aarch64 on
autiasp.  This means, for example, that one cannot place a pid probe on
every possible instruction.  If a user explicitly places a probe on a
forbidden instruction, an error message indicates there is a problem.

On the other hand, if the user specifies a wildcard in a pid probe
name, we should skip instructions where no uprobe can be placed.

The problem is that we do not find out an instruction is problematic
until we try to attach, which is long after probe descriptions have been
processed.  And when we walk probe descriptions, we do not have
information about which kernels and instructions are problematic.

The motivating problem pertains to pid probes, but we would like
a provider-agnostic solution.

Set an "OPTIONAL" probe flag when a probe is not needed:

* In dt_probe.h, DT_PROBE_FLAG_OPTIONAL is used for the "flags"
  member of dt_probe_t.

* For pid-style probes (including USDT and stapsdt), in
  include/dtrace/pid.h, DT_PID_PSP_FLAG_OPTIONAL is used for
  the pps_flags member of pid_probespec_t.

Remove the old check on "hlt" instructions, since it was not sufficiently
general for other kernels and other problematic instructions.

Existing tests that expose the problem are

    test/unittest/pid/tst.coverage.d
    test/unittest/pid/tst.emptystack.d
    test/unittest/pid/tst.entry_off0.sh
        hlt instruction on x86

    test/unittest/pid/tst.float.d
        multi-byte nop on x86 on newer platforms

    test/unittest/pid/tst.entry_off0.sh
        autiasp instruction on aarch64 on newer platforms
        depending on how the trigger process was built

New tests are added to check that a probe set explicitly on a
problematic instruction will still lead to an error, even if a
probe description before or after it tolerates attach failure.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/pid.h                          |  3 +++
 libdtrace/dt_bpf.c                            |  2 +-
 libdtrace/dt_pid.c                            |  7 +----
 libdtrace/dt_probe.h                          |  3 +++
 libdtrace/dt_prov_uprobe.c                    | 26 ++++++++++++++++---
 .../pid/err.opt_after_needed.aarch64.x        |  3 +++
 test/unittest/pid/err.opt_after_needed.sh     | 25 ++++++++++++++++++
 .../pid/err.opt_after_needed.x86_64.x         |  6 +++++
 .../pid/err.opt_before_needed.aarch64.x       |  3 +++
 test/unittest/pid/err.opt_before_needed.sh    | 25 ++++++++++++++++++
 .../pid/err.opt_before_needed.x86_64.x        |  6 +++++
 test/unittest/pid/err.optional.aarch64.x      |  3 +++
 test/unittest/pid/err.optional.sh             | 25 ++++++++++++++++++
 test/unittest/pid/err.optional.x86_64.x       |  6 +++++
 test/unittest/pid/tst.entry_off0.sh           |  4 +--
 15 files changed, 135 insertions(+), 12 deletions(-)
 create mode 100755 test/unittest/pid/err.opt_after_needed.aarch64.x
 create mode 100755 test/unittest/pid/err.opt_after_needed.sh
 create mode 100755 test/unittest/pid/err.opt_after_needed.x86_64.x
 create mode 100755 test/unittest/pid/err.opt_before_needed.aarch64.x
 create mode 100755 test/unittest/pid/err.opt_before_needed.sh
 create mode 100755 test/unittest/pid/err.opt_before_needed.x86_64.x
 create mode 100755 test/unittest/pid/err.optional.aarch64.x
 create mode 100755 test/unittest/pid/err.optional.sh
 create mode 100755 test/unittest/pid/err.optional.x86_64.x

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 8ddb1167e..4a239b076 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -47,6 +47,7 @@ typedef struct pid_probespec {
 	size_t pps_xargvlen;			/* (high estimate of) length of array */
 	int8_t *pps_argmap;			/* mapped arg indexes */
 	char *pps_sargv;			/* list of arg sources */
+	int pps_flags;				/* flags */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
@@ -55,4 +56,6 @@ typedef struct pid_probespec {
 	uint64_t pps_nameoff;			/* offset to use for name */
 } pid_probespec_t;
 
+#define DT_PID_PSP_FLAG_OPTIONAL	1	/* probe is optional */
+
 #endif /* _DTRACE_PID_H */
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 31781ac9f..0223764a6 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1385,7 +1385,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		if (prp->prov->impl->attach)
 			rc = prp->prov->impl->attach(dtp, prp, fd);
 
-		if (rc < 0) {
+		if (rc < 0 && !(prp->flags & DT_PROBE_FLAG_OPTIONAL)) {
 			close(fd);
 			dt_attach_error(dtp, rc,
 					prp->desc->prv, prp->desc->mod,
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index ffc52132f..7d6cfb4dc 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -386,15 +386,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 #define disasm(x, y) 4
 #endif
 
+		psp->pps_flags |= DT_PID_PSP_FLAG_OPTIONAL;
 		for (off = 0; off < symp->st_size; off += disasm(off, &disasm_info)) {
 			char offstr[32];
 
-#if defined(__amd64)
-			/* Newer kernels do not allow uprobes on "hlt" instructions. */
-			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
-				continue;
-#endif
-
 			snprintf(offstr, sizeof(offstr), "%lx", off);
 			if (!gmatch(offstr, pp->dpp_name))
 				continue;
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index 2a78cb9ca..637875183 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -53,10 +53,13 @@ typedef struct dt_probe {
 	uint8_t *mapping;		/* translated argument mapping */
 	dtrace_typeinfo_t *argv;	/* output argument types */
 	int argc;			/* output argument count */
+	int flags;			/* flags for the probe */
 	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
 	dtrace_difo_t *difo;		/* BPF probe program */
 } dt_probe_t;
 
+#define DT_PROBE_FLAG_OPTIONAL	1	/* probe is optional */
+
 extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
 extern dt_probe_t *dt_probe_create(dtrace_hdl_t *, dt_ident_t *, int,
     dt_node_t *, uint_t, dt_node_t *, uint_t);
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 07b26f20f..3b7145a50 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -957,9 +957,16 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 				       upp);
 		if (uprp == NULL)
 			goto fail;
-	} else
+
+		if (psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL)
+			uprp->flags |= DT_PROBE_FLAG_OPTIONAL;
+	} else {
 		upp = uprp->prv_data;
 
+		if (!(psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL))
+			uprp->flags &= ~DT_PROBE_FLAG_OPTIONAL;
+	}
+
 	/*
 	 * Only one USDT probe can correspond to each underlying probe.
 	 */
@@ -1049,6 +1056,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	/* Look up the overlying probe. */
 	prp = dt_probe_lookup(dtp, &pd);
 	if (prp != NULL) {
+		/*
+		 * If not optional, pass that info on.
+		 */
+		if (!(psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL))
+			prp->flags &= ~DT_PROBE_FLAG_OPTIONAL;
+
 		/*
 		 * Probe already exists.  If it's already in the underlying
 		 * probe's probe list, there is nothing left to do.
@@ -1079,10 +1092,17 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	 */
 
 	pup->probe = uprp;
-	if (prp == NULL)
+	if (prp == NULL) {
 		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
 				      pup);
-	else
+
+		/*
+		 * If not optional, pass that info on.
+		 */
+		if (psp->pps_flags & DT_PID_PSP_FLAG_OPTIONAL)
+			prp->flags |= DT_PROBE_FLAG_OPTIONAL;
+
+	} else
 		dt_list_append((dt_list_t *)prp->prv_data, pup);
 
 	if (prp == NULL) {
diff --git a/test/unittest/pid/err.opt_after_needed.aarch64.x b/test/unittest/pid/err.opt_after_needed.aarch64.x
new file mode 100755
index 000000000..bd5b41a36
--- /dev/null
+++ b/test/unittest/pid/err.opt_after_needed.aarch64.x
@@ -0,0 +1,3 @@
+#!/bin/sh
+echo "skip on aarch64"
+exit 2
diff --git a/test/unittest/pid/err.opt_after_needed.sh b/test/unittest/pid/err.opt_after_needed.sh
new file mode 100755
index 000000000..3ee65cd93
--- /dev/null
+++ b/test/unittest/pid/err.opt_after_needed.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# We should not be able to trace on a hlt instruction, which is forbidden
+# by the kernel.
+#
+# (Test tst.entry_off0.sh should be okay, since there the probe on that
+# instruction is optional, and dtrace will silently skip over such
+# problematic instructions.  Here, however, the probe on the instruction
+# is explicitly requested by the user.)
+
+dtrace=$1
+trig=`pwd`/test/triggers/ustack-tst-basic
+off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
+
+$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off',pid$target:a.out::
+{
+	trace("hlt instruction");
+	exit(0);
+}'
diff --git a/test/unittest/pid/err.opt_after_needed.x86_64.x b/test/unittest/pid/err.opt_after_needed.x86_64.x
new file mode 100755
index 000000000..158336d98
--- /dev/null
+++ b/test/unittest/pid/err.opt_after_needed.x86_64.x
@@ -0,0 +1,6 @@
+#!/bin/sh
+if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
+    echo "did not find hlt instruction in trigger"
+    exit 2
+fi
+exit 0
diff --git a/test/unittest/pid/err.opt_before_needed.aarch64.x b/test/unittest/pid/err.opt_before_needed.aarch64.x
new file mode 100755
index 000000000..bd5b41a36
--- /dev/null
+++ b/test/unittest/pid/err.opt_before_needed.aarch64.x
@@ -0,0 +1,3 @@
+#!/bin/sh
+echo "skip on aarch64"
+exit 2
diff --git a/test/unittest/pid/err.opt_before_needed.sh b/test/unittest/pid/err.opt_before_needed.sh
new file mode 100755
index 000000000..f1f172a18
--- /dev/null
+++ b/test/unittest/pid/err.opt_before_needed.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# We should not be able to trace on a hlt instruction, which is forbidden
+# by the kernel.
+#
+# (Test tst.entry_off0.sh should be okay, since there the probe on that
+# instruction is optional, and dtrace will silently skip over such
+# problematic instructions.  Here, however, the probe on the instruction
+# is explicitly requested by the user.)
+
+dtrace=$1
+trig=`pwd`/test/triggers/ustack-tst-basic
+off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
+
+$dtrace $dt_flags -c $trig -n 'pid$target:a.out::,pid$target:a.out:-:'$off'
+{
+	trace("hlt instruction");
+	exit(0);
+}'
diff --git a/test/unittest/pid/err.opt_before_needed.x86_64.x b/test/unittest/pid/err.opt_before_needed.x86_64.x
new file mode 100755
index 000000000..158336d98
--- /dev/null
+++ b/test/unittest/pid/err.opt_before_needed.x86_64.x
@@ -0,0 +1,6 @@
+#!/bin/sh
+if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
+    echo "did not find hlt instruction in trigger"
+    exit 2
+fi
+exit 0
diff --git a/test/unittest/pid/err.optional.aarch64.x b/test/unittest/pid/err.optional.aarch64.x
new file mode 100755
index 000000000..bd5b41a36
--- /dev/null
+++ b/test/unittest/pid/err.optional.aarch64.x
@@ -0,0 +1,3 @@
+#!/bin/sh
+echo "skip on aarch64"
+exit 2
diff --git a/test/unittest/pid/err.optional.sh b/test/unittest/pid/err.optional.sh
new file mode 100755
index 000000000..1dbef4e45
--- /dev/null
+++ b/test/unittest/pid/err.optional.sh
@@ -0,0 +1,25 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# We should not be able to trace on a hlt instruction, which is forbidden
+# by the kernel.
+#
+# (Test tst.entry_off0.sh should be okay, since there the probe on that
+# instruction is optional, and dtrace will silently skip over such
+# problematic instructions.  Here, however, the probe on the instruction
+# is explicitly requested by the user.)
+
+dtrace=$1
+trig=`pwd`/test/triggers/ustack-tst-basic
+off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
+
+$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off'
+{
+	trace("hlt instruction");
+	exit(0);
+}'
diff --git a/test/unittest/pid/err.optional.x86_64.x b/test/unittest/pid/err.optional.x86_64.x
new file mode 100755
index 000000000..158336d98
--- /dev/null
+++ b/test/unittest/pid/err.optional.x86_64.x
@@ -0,0 +1,6 @@
+#!/bin/sh
+if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
+    echo "did not find hlt instruction in trigger"
+    exit 2
+fi
+exit 0
diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
index 1a4c3d207..304be4568 100755
--- a/test/unittest/pid/tst.entry_off0.sh
+++ b/test/unittest/pid/tst.entry_off0.sh
@@ -1,14 +1,14 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 # Although the D script takes only "one second," it takes a long time to
 # shut down.  Until that has been solved, increase the timeout for the test.
-# @@timeout: 120
+# @@timeout: 240
 
 dtrace=$1
 
-- 
2.47.3

