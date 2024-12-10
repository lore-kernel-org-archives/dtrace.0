Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B932451C7
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 23:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871734; cv=fail; b=n6C4AkZYRDUVE8G3ydEhT30YqDj+3GbM4dx+kiQS6rufD6bR1gYk7iZP+65htup8oLnRYiB2Y7KmmOt98psqh8qsBm5IbYMdOOesoUmNonMqbScIqQ914TAkAaAOEZlIwTU4TFsZuau6eGKr1s3ufeOCk3XyrWc9MVmdoB2l4bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871734; c=relaxed/simple;
	bh=wbfzN05Iq70JoOXrI5hFHFoee7wi3ckLzcFt7po/1Ro=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=siQkF8G/pYig2/DrfftOn9UCkooAdZNYbBedOk65CdyjRhG5b+zS3DIMFjoBzPpZW7sOMT78ee5Im5wesFfymv8wzgQjn2SMykLgXtCoAg1lf0VspbTDp+x6BYoMA+ms73NGFOnmhi7iGcs2ZWoZD7CuyaQbgax32eRl/2Mn3kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BcxxGuuG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jQYX+toJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BcxxGuuG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jQYX+toJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BALllEr028725
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 23:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=uONo/M2+GCJJoy9X9jpwAoDAo9V2D7wU5te0SWi6l7I=; b=
	BcxxGuuGHbyhkU4RbRxdscLpEPxjj3fRWXOpgHqmINWO74p8G2T5jIkww+G9VsTT
	Zd9NgYBKWBmQNnD7myURIRyzbLUn+8ZL+R0yXia5UM/AWefx2HI6iFp47nONXXYm
	MjVAWakza1nvjmh07/cM2rRQtX6QfAkRFBTG2PHW1fVWtkkTplvwOvjlAXjkHk09
	zRSlXTxvRIlL+bb67YZnqxcF08K/NJn3a/dHvT4foFDD+wUktaQ59aIPJCYe0dkT
	yE3zNNXjhexGu1D/47DjeabvPnJPKM43NUgFVXxaffESOZkySiBFT0NGD7yG/BJo
	wvilCtTIiLt9ZJrDO1/BIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cedc7821-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 23:02:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BALT7LP034978
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 23:02:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctgf8p8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 23:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4QXzttJHO2lYeS4TV7xoz/yXH6qwHNn5em+lhri3vIjmp+4taSlZObCJ3c6VS+9XZKWCs9lxXonsDmUonfSsfRvZ71DUaFEpEEp/3aecZAH0IRXE/C2otz5ltH//z9J4tVDjOhDzBuRU7kna3t0a4oNIdOe3kJAfTg5JMtC9GWKMRwk14bCb/VoAEUGls1rBsJiEmOglbENHsaJMCJS3c5rYHpF/mVrZmwP2UrxCPbq+t4mvymfghYYLrp56HW5uq9/DNVfz3V3d3Q0Bfin5zA6gcdt6AFSJMJ/yaS3lJo6cJvRwOW4jInI/dabKa4MhGbgf76JNkcsIqw1/yxwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uONo/M2+GCJJoy9X9jpwAoDAo9V2D7wU5te0SWi6l7I=;
 b=R8rDEawtYtq5yzBZOS0HRlKUo1w36b8nr9Q0nbWbWE39/g7yzQ7Z32Mnuf9prlJdI/3PjH7E6VLAXJqr35/urlF15cBt3K4grg2zTbot75ywrFouBEmxu/wsgDvaWkAmD7crzu79r9u/UrxUlvCpqQtgozaOoMJ7/v3qqsm+zttTr8UjKhAuIcw/+ZsaeCI+4Hec/tMeGOTLQifiUwp8uiiuCS4xwqR+aT6sZ7vm1IlHxbetFPoL8ZYYOyJC47qVZGhk00CJD7aBN76AjYLQTA98ybwD8wB8RkVFwN9mt1udRHA7mXDBXbx2YDjEzkVvGEDc2rhCthTXo8ZxDSObYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uONo/M2+GCJJoy9X9jpwAoDAo9V2D7wU5te0SWi6l7I=;
 b=jQYX+toJIy3bEWZTtOhIhjrp8a567eY8mPa3SLRSNHXML/9Rr7uFXPnBFeNRoz0DCrUX+mnp7Jipj2i8cKs+wNGHuzMxaHl6xtCM6s9NUhN7bfuB+Z+3lAdHnhNvlvP5gspvg7IloBdZn8jnsyi2x/3YcaLAfoitVtjgAAohFHs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4631.namprd10.prod.outlook.com (2603:10b6:510:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 10 Dec
 2024 23:02:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 23:02:07 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Have USDT "deferred" tests wait for dtrace to start
Date: Tue, 10 Dec 2024 18:02:02 -0500
Message-Id: <20241210230202.16603-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4ce546-2e08-42b3-634b-08dd196eab75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QgqlmW7O3Qd6B7iTrS+u9iwSCZ2rrnEjgDuITSG6Jk22J8Zpg0fmr7cS/Jjx?=
 =?us-ascii?Q?4W3c9MQNBBLNndL9RflseOeIxI9ui4YFqedYfkVmo3AgQ3LT8BkW2bvBM7uH?=
 =?us-ascii?Q?Yt51eJW2r7WZkfIu5QqvLRQwm3k3KtPMlPSqrcwKOzy+/jF7Bb8XgLKZE5Rm?=
 =?us-ascii?Q?cAohtv8izz4DvnsiCjk2pCT96406IS9L5GVjpmSks2BT19lyyJQC4lMsshKm?=
 =?us-ascii?Q?5tnxkbv2isDWq+Jxjqa3CvI6WU+L+PCTSl8QoAzvtbsiI6Ixcp6An3IwSGmX?=
 =?us-ascii?Q?qR511qt4vAQh5mDCR6rhrfeZs5tkqaP8LbFBVP/hPPkVUaDdIgXRZH4y8psn?=
 =?us-ascii?Q?u0EhRAA06zn+6co91JaTelhzA2mcx6DQI6WliQiNqZajgjn5uIa09flYTnS6?=
 =?us-ascii?Q?/MzSbYJ2Yt/cdC5cIf1PErtdsNkZpHemhW4UjJsEKseP7ZHXBoSdO2fczOr5?=
 =?us-ascii?Q?LnjyaG9gWgDb9tB1zg990c/JZ2nXG+m7YcVffTTe9YcW5zFE+tlm2dVbtWfg?=
 =?us-ascii?Q?4476egbmXUfhuTkLnr14QOKK67SB2Cy3/F3/ITrwz6CHAPfklyqjOw02IObE?=
 =?us-ascii?Q?Ra2SYZPOlJg0qNfaYY5DuHOhL93RI5uoVspu8wb2YR1w1BOZ45sEruYoW28f?=
 =?us-ascii?Q?MQ+Na32FgFQ4j7KarZKz62H3xq3zbuxrozGeMCQ95Q1CZqUID4usjWlfIA8k?=
 =?us-ascii?Q?nd89RvZ3nZU2+30XHQ0iQAAy14VVCrMqDfaRAoxDc/P7s03PPnCgcXHVEhZk?=
 =?us-ascii?Q?lXoeHYWMChW09c7Zu7kGGDVwKrJaDMyO3C1gKlKEEOzl3afySGcvXaBR1jgW?=
 =?us-ascii?Q?EQZRuaucLZJKxSnXYxhNWT28G65ZOjCKm3+cJIqU1roBNMln2SRO6gz6OJB9?=
 =?us-ascii?Q?OtWwKvjusOkZtAxsmWpWWE2yQ0SQfyJN4jLzZSjgrY/rD66OllW9sppO/29k?=
 =?us-ascii?Q?6zdKrdwwQ1RXzFNzQ9p0egi3xsVjweXmSSVbbUOi8bIdUzKoll0nlrh4fdsR?=
 =?us-ascii?Q?BAd62midOUE8OoI4VXYmfSBFoEZe3kf93uQAXzBwucaNcUWR4pikSbPrCMiO?=
 =?us-ascii?Q?wIklAEo/IYOh5WSq7h96OpLIOBvUhZNHFIlILgdh9NcUQveUia5w2RBYgOts?=
 =?us-ascii?Q?xtEuLoXiiMj3EKu8dl8Y8ORJ5rd6cSZQpAatZYH8fsoGjI0EP+ENWdar/C5t?=
 =?us-ascii?Q?mGFDWaPbba84XfrAYZBMN1lmAp+UfAr0IjPDW+r1auRIpuPtuRXqtwB6ejjm?=
 =?us-ascii?Q?XdtcihYIxCN7AbCysJ9fQL5fmTPCoZqXXAl0yFwLAx+leHJWu6SEK7pY/rXm?=
 =?us-ascii?Q?rz0sYTOgMP72dsdDN/huZc1bTEct+do1s1MyXOHRlVtCDw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t5Lv58Hc0Q2922NztVnr7au3NiqgJvB6yGNyRCDqss/JtTrI9UtYkbzSQ5fz?=
 =?us-ascii?Q?BxBZGKoUXGPZFvHItTdeYCz096JWJ7M+8iLIm/anY3UGZmozNupfc2470Fjr?=
 =?us-ascii?Q?P/w92Khom17ids8w1YopFin86BFJd4OH1co8s1I8FhHey+K6Daz2H5PGYFSr?=
 =?us-ascii?Q?pFU7NKlCwHSRYWvUIO1FQoITdBNYBdo0SyIl1swrU71FHfFvs1JvRMrkkWvv?=
 =?us-ascii?Q?9gHtC6JS3Pn8B1ifzL6OGUKVqZFMmxfY+yuHfrqsXX0+Q5IbOdQarz0l4Wg4?=
 =?us-ascii?Q?FNxr+/23XLyHFlt8cVPKbNj/DtqOGe0Va8mY1i6wjwdHCA02DGuKMHX3fQ5q?=
 =?us-ascii?Q?/u2lYCIkthgZ8ipfmCqSFoxGQdbU7KVDfyQC0cYaUzy+5j0Zi2dANqI/up+v?=
 =?us-ascii?Q?SbrhmDryJYpInOIuB8xmGcLtjHTRDsfgKY6toUFAJM+edumhnDxVbpRi2hix?=
 =?us-ascii?Q?TsZuu3YhCzlYHg1+iU3XrRKiNla8W5pcELJAR3zp40B0BVZcO6/rYI2dX4Zr?=
 =?us-ascii?Q?Pt4GPY8OH5f/gQm93vKPkKPer0Iz+sCfp+GV/0gC1V1YQcWMxIKapDRMGfMM?=
 =?us-ascii?Q?zvXucIgbdLCWoFABwnn3Wl7dtApr4Gck+62eLEmjrf6CZ1XeF5OT9/imb2o/?=
 =?us-ascii?Q?6aT0RSeNg4Olle8A/BJv1sW590MHM9qLXUE9H3hj5BUXUU1uEMNo8UwhHrZq?=
 =?us-ascii?Q?mGc8i1LzwvHDgUj11UAjW1lbaUL8cjQ0WgmyJhv4ivx49VoSuY+6kzk9+hPb?=
 =?us-ascii?Q?depafnsU+bkHXSLVyzSUoIftG5UbQuFKqazbRFDDT9zDMQIoF2p89qx+0xiX?=
 =?us-ascii?Q?KYQVYPSg/V46CAwphsrw6Jo5MtW0EpHDuIRxhsozq9xaURzM274P1po40g6C?=
 =?us-ascii?Q?jukyNUMBngkt19KK3zgzti9XbW7CAWkhz0bZhm+cjR9yek/NSYEjH7nzfLXA?=
 =?us-ascii?Q?MtnrL5M32nknS1LueN80JJoTCVFTI4jnswvRNNH7O5402chyJYaGTzE6BwPn?=
 =?us-ascii?Q?a8E4cnRav+zhls5jL7K+GSyadlIDv/d86Yu+De9UQC5z1W5Lm5tK3H3+KiMK?=
 =?us-ascii?Q?Ep6T7Cb+ox/kH+RgtqjKzjzpc1HlcOJ8ZmHkcgPjCDwvnwBiX0Mk7wmrGOVm?=
 =?us-ascii?Q?HH405fH7GFVsQUZqSvJXH1LhVQXSJx3DjYO3Worq+6h8Wl6Zb4m4uaL7apvT?=
 =?us-ascii?Q?hvHuxWH8jqx+3DjfNSaKMyEC0gvwkhXngBpy+9yQx3isdiiODCQfWe63xiiJ?=
 =?us-ascii?Q?ExeqyWEyJXL8mS5D+hiEn1AvBxsyZQTp3MDWKxB75BG0/O7uZDUJGXFs9nSA?=
 =?us-ascii?Q?+DMGtR7bLpCU0Au6sSz77awEISw+Ipce1yfIB0xqIxD2gtVa/WYGsi/UaDf0?=
 =?us-ascii?Q?fk4RmgvCAcPoEB5IhI5B35fe0K7m15wWOoS93BaYz5y2GwZ9fZLplxWl0SME?=
 =?us-ascii?Q?676M5/+H9Ro3B++BotNQZbP0NKd3G/agYPdwP1zrcz/g1Bx6cSE3ksGKgXnt?=
 =?us-ascii?Q?6bOHLcvFX6ZtKFltZwRnTtjbzWVu5AxlXDdspmM+L9OiCb6hxOWe4X/h9Fsi?=
 =?us-ascii?Q?CkBH+ZD2V30D4QXzmg7HPtoAOpDew417mzFdtZXg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XA975tiV1b/5m6C9exHhYf7zNlpresvFgqD6RhEMNSgO05cvVHvTAXb7wTEvPbvSp1yfFt+QgAxe++gK64mKlPSNC2xPqS6h+svPmbmlnQLPuBY9k+MZ9sXo0OEaKSrWc0Q6BPfIg7tJ2DKP+JP+tL0Gl/NBk7e/EMjS1zxkihZ+CFRHAyTwZEgYjQlmlYgFs3EvRBouwM9iEp0JMzWKU5+njXyWLHfmR7KbarXOBgNKopna4/ef9l2GKP4a57yhCTTq0dMFQncE0FV/56k4HxKmBO5cVn9FjGBeI4LLVvDjCSMlZBj1x2moPhRWog9An8BA6f7FvsJTY8OjN392YuaPA5gmw1xa7QtSvUVAzBYgSG7e2DUo1cMEOjefKHtwDktuj17R3e/OVm4+9VPcFCfbDY9sGuZPuuV4ALq04bGMu5Ub/gYoIW5AvyjZfOGOii/k7reZ21gexyMQSkbkoajYc864LfIj1OH7TnLkRRHvFjo/7JKtw0XLuEyJVpNhfBRXhrfsgsQMorKB7zq4WlVHHPuqyc6SJcZZfii8DN0FLFzCJ/qci6uujCAio/SGeVSAneKTJvj3J8TZhz075DCIyljwUhsNCGdMPb9aUFc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4ce546-2e08-42b3-634b-08dd196eab75
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 23:02:07.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr2BxksozDpCHRQgqES53j/cuLZ7V7yHG/MyW0TRQQh+E0FyU05bbWBJV8caRbM9LIVch43prnqFahVtrEfp8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_12,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412100165
X-Proofpoint-ORIG-GUID: 1CwFzPvOCoQboFtrPSu6Wmuxi7VKQwh5
X-Proofpoint-GUID: 1CwFzPvOCoQboFtrPSu6Wmuxi7VKQwh5

From: Eugene Loh <eugene.loh@oracle.com>

Systemwide USDT tracing includes having dtrace track USDT processes
that start after it does.  Associated tests start dtrace first, wait
a few seconds, and then start processes to be traced.

Waiting "a few seconds" can be insufficient, especially on slower
systems or as more work is being performed during dtrace startup.

Change tests to wait for dtrace to start by polling on the output file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/err.Z_no-w.sh      | 17 ++++++++++++++---
 test/unittest/usdt/tst.defer-Z.sh     | 17 ++++++++++++++---
 test/unittest/usdt/tst.defer.sh       | 17 ++++++++++++++---
 test/unittest/usdt/tst.nusdtprobes.sh | 16 +++++++++++++---
 4 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
index 3833b4400..4f129341d 100755
--- a/test/unittest/usdt/err.Z_no-w.sh
+++ b/test/unittest/usdt/err.Z_no-w.sh
@@ -34,9 +34,20 @@ testprov*:::foo
 	raise(SIGUSR1);
 }' &
 dtpid=$!
-sleep 4
-if [[ ! -d /proc/$dtpid ]]; then
-	echo ERROR dtrace died prematurely
+
+# Wait up to half of the timeout period for dtrace to start up.
+
+iter=$((timeout / 2))
+while [ $iter -gt 0 ]; do
+	sleep 1
+	if [ -e dtrace.out ]; then
+		break
+	fi
+	iter=$((iter - 1))
+done
+if [[ $iter -eq 0 ]]; then
+	echo ERROR starting DTrace job
+	cat dtrace.out
 	exit 1
 fi
 
diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
index 52e92eb6b..ff2c5cbf1 100755
--- a/test/unittest/usdt/tst.defer-Z.sh
+++ b/test/unittest/usdt/tst.defer-Z.sh
@@ -45,9 +45,20 @@ testprov*4:::bar
 	@[pid, 3] = sum(pid % 100);
 }' &
 dtpid=$!
-sleep 2
-if [[ ! -d /proc/$dtpid ]]; then
-	echo ERROR dtrace died
+
+# Wait up to half of the timeout period for dtrace to start up.
+
+iter=$((timeout / 2))
+while [ $iter -gt 0 ]; do
+	sleep 1
+	if [ -e dtrace.out ]; then
+		break
+	fi
+	iter=$((iter - 1))
+done
+if [[ $iter -eq 0 ]]; then
+	echo ERROR starting DTrace job
+	cat dtrace.out
 	exit 1
 fi
 
diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
index 02ed1a767..073af12d5 100755
--- a/test/unittest/usdt/tst.defer.sh
+++ b/test/unittest/usdt/tst.defer.sh
@@ -51,9 +51,20 @@ testprov*'$lastdigit':::bar
 	@[pid, 3] = sum(pid % 100);
 }' &
 dtpid=$!
-sleep 2
-if [[ ! -d /proc/$dtpid ]]; then
-	echo ERROR dtrace died
+
+# Wait up to half of the timeout period for dtrace to start up.
+
+iter=$((timeout / 2))
+while [ $iter -gt 0 ]; do
+	sleep 1
+	if [ -e dtrace.out ]; then
+		break
+	fi
+	iter=$((iter - 1))
+done
+if [[ $iter -eq 0 ]]; then
+	echo ERROR starting DTrace job
+	cat dtrace.out
 	kill -USR1 ${pids[0]}
 	wait       ${pids[0]}
 	exit 1
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index d2d80fe8d..f275f921f 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -105,9 +105,19 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
 		@[probeprov, probemod, probefunc, probename] = count();
 	}' &
 	dtpid=$!
-	sleep 2
-	if [[ ! -d /proc/$dtpid ]]; then
-		echo ERROR dtrace died
+
+	# Wait a little for dtrace to start up.
+
+	iter=$((timeout / 4))
+	while [ $iter -gt 0 ]; do
+		sleep 1
+		if [ -e dtrace.out ]; then
+			break
+		fi
+		iter=$((iter - 1))
+	done
+	if [[ $iter -eq 0 ]]; then
+		echo ERROR starting DTrace job
 		cat dtrace.out
 		exit 1
 	fi
-- 
2.43.5

