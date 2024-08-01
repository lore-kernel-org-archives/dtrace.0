Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DA9132114
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 05:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722490102; cv=fail; b=BPVoj14/s6DZdE4kWhN2qCQ3Bf156aRfDSf2BaPIN6NZgEYQ2fXRW9Bet5k1RyJRY49zBPARIox+peXdIUxFaT+r2r3f4TIzb7tJRQH3twVgAoneSGAy20N2nBj5WX+IbYM5gWsGvFh19ji1rwtFEqtHuAKJq7BF3NioE2xhheE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722490102; c=relaxed/simple;
	bh=sOJuWyYEWrRB7MqE0bnmiTi1qf9H/c+PMLEGDzY2sRs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=uIwVp7V1Tzav9ts89bIaS1zdOcLuCdh5beuFy0+/2Wn9kP/CbvD3/MJggMCWvDjAmaN+k6TWK3Fc7StiDHtKguWlAHwpeek9K955iImKsqiU0xL3ZvY8alZXFxkTwVUZQbnfSokrHR3zoJp5o4Iy1nxYXSGehwHqZi/Je3ofDWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mEuVHqIO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ya4ZTiHr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mEuVHqIO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ya4ZTiHr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VLH91C010366
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 05:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=JBvpgmt4ocA0Ph0bGSRFfMXmmzCKc3Bq9A38vY5JsAM=; b=
	mEuVHqIO4ywBYhoPo3+G1+2tZF68g8a0fGtQzVNkYGWfeva/KSAZUPidicoXNay2
	DhfygA6q5QcTLU+bwGD0Tr8C+s0Nb1YT0EEgkikeSb1zeS5dJYs9adXn6OIUfUeK
	ON7EhAcyHJ1PTS52GVQNvJa2Oxh0k+aEjF0eLKdv7dyfgQi99OceBEm72873g5p1
	NElEYNmdlUsEdVfAhlTYg4C/Jqcp4TwQVXKOyQ+Zp+Mi0nbfQx2EhdwNKEJ1ADeq
	Gel0fe1E9ZVx34wtKTGHG+seMhXAP5jTf0y58wxvBM4ywoVrlF7cIz4YGNiMLfF/
	/SFJTsO9tGHCWDACmDce5w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgs8wxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 05:28:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4714UqwM003776
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 05:28:18 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c2d352-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 05:28:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm56sVsOMeGs/30h2LR32C6AoKhsuINc1x5++7iE2/zYILmWh5uK6o3qeyNrhMgA19+LrtRjXWJvfdOJFKJjGGR9m/djvrIe+0914y8+rio16JKRziI8iUGDBxLEFBKGikk2aiZ54UJ6THd31qlCOuWjq1+LIyb7UoaZRtxToVZcofYdKz8Z9xg5IPTj8JuQBxDm1FSUOH/AkCw3C8sW46vyLNJt3hKKSY7r2xTrjV3qxliBKEtfSCpWuAT+zN4rPcItdZG/nnjj+AJYFZ5CiJROlOZGjRSaaJjF1gbHxg6VUGXEZYju+ucwF2lhNu/M1mwC/LraXK9bZU5VCNMfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBvpgmt4ocA0Ph0bGSRFfMXmmzCKc3Bq9A38vY5JsAM=;
 b=BLrnSlH0RijkcjXSDS0Cb1rzq7JPXsYGwSWzzsmkePeQLXdvoZMDH6IBTFBAgDpGDhhTlUw7Z3Hk0BSQ+OE7LoS2dOv0+ItZTqO9i20rDKjLkxyiuygZbi/aIGk+JjFWMGJd8mSLqGICAJWT/vmog1253ImvP71U4jxGOp4veKOs+MHg8ZySli2nzoRt1eQ6FEWM0jF4zct4subAhZrLUqS97SDXs44LZrc51e+3IhqRm+oIZWERCWOVF2NCR8FFx+GWfgLnU8s/RtiNj3As3l2BsOWDgKimj2oUMuJhwGENaQugLajC/9uF34r+yJUpkLijSGii+HiloMLzI9wApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBvpgmt4ocA0Ph0bGSRFfMXmmzCKc3Bq9A38vY5JsAM=;
 b=Ya4ZTiHr3aAVbVEEjF8ilW8oXFOyZvlZ6LIZrfeD5/JP61d3F+4E9PT3DRQqnfyPs1BDMdD0glmg89cyuTM4vitBdwEK1Qyb5xwSz0fR2jo8eHaKX96oTg+wKnfMLqC6WbKmep9VyVv7xfIL+0+6KYadwjXlqUD3OXJXqxe8+e4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB6722.namprd10.prod.outlook.com (2603:10b6:208:440::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 05:27:51 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 05:27:51 +0000
Date: Thu, 01 Aug 2024 01:19:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] fbt: implement return value support for fexit-based FBT
 return probes
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287AD841705B5857204F3BEC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 95020a8d-c796-4df8-222c-08dcb1eab008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dHONsFJ0d8Le8qpyM9uNak5rPprLxL8AuO3ogD4SmXa6ErSRhTEhccMQ/rYJ?=
 =?us-ascii?Q?GamihBXoYMb8ksMHPeXwjJa1LAZiowGDruN3aR0BgC9RRSH4jyCaDy0dbzNv?=
 =?us-ascii?Q?wTtFTCOvAjbcHPaY8sqao4c1qcCemowqMx74UwNk3e09OBEQheK/UbFnSYbH?=
 =?us-ascii?Q?XoRPzeYiqY982Xep8QcZGTEDYgxaJDP8edUxVyrNMEPNQkVPj8ZkXvN2Op3A?=
 =?us-ascii?Q?dSnP2s/JvtxyXyJoLw9OtFoS1qhsLmzV9wAz0vjNgLJ4VtD2yaLLQXtCgHe3?=
 =?us-ascii?Q?qKk+eG5BFx8bfmzyeblqkk/4NhQn6TC+zBVGSpHXSbldpYSYSodl0xt9OAlp?=
 =?us-ascii?Q?VZR9Y5ttgY/+tqPPXSoPggxpdK09ChGiyxyMtUZsuCrnFl1Mp77+K/g4jt6h?=
 =?us-ascii?Q?LdxW/dOwPkXJTe8CzfNiihN9bob2xn24EW7c36rErHEAnXGgfnU1AgEHtBw+?=
 =?us-ascii?Q?bwehXHaFrjN6hu7jsxWJ415bin5D4fbrv6q0IANWjpVlZVycnw+S3L0MS7sy?=
 =?us-ascii?Q?Gxm3S6YReGRUXaCVnCrsgG84RggT/7zU6SWEdeiBjS6CHkCB536s/x0exmiS?=
 =?us-ascii?Q?iddBHnsEENeZ7KWaDWvIfaSHM02hn7TBWIggmEGM09/sLypVapp0w1+xB1Lz?=
 =?us-ascii?Q?JpMCuIBoJkxVu4EduwMCudiRPV3aCIvHe8zzcgNsY1yhlC/his0hrkaojba8?=
 =?us-ascii?Q?RDuF5VfplhvCppc98ewrL96hKSE5cab9Zx2uUdXUNxHL8jnfZImdviEgzMP7?=
 =?us-ascii?Q?tVyTZwv3T4HwR+29qCLKuAPZsX7JZ8J6lk+8dlUmltsK/XAVgd8k/pDzycQr?=
 =?us-ascii?Q?gkDs1Px5YY82UXZs2oy7AJ0h3l//upll56wOIQn9V4NpbeTQXqE8Mxf6hH0X?=
 =?us-ascii?Q?kPTVCOnEhF+jWkYR8aIogW7fzaMi2c1MQAZj/LCeJyFPQEFwVfGrrOHe/U+m?=
 =?us-ascii?Q?GqvpnyfPa0qC255udBfja4PpV5Uf1AfFYfWxaZZI42h79sNbSB/vZH5Y1ShN?=
 =?us-ascii?Q?tpkvnQ5FyhKvUt4l81krN8LRSLe+U9HEz0XGDXCVrWyf4Lp/LbOHxBfH9JA1?=
 =?us-ascii?Q?r9Kk18GJUzXVnQOkAQYzQTjrQeZkFQap3nrVpe6nw1m8kvsVoG8OG9ywPh+y?=
 =?us-ascii?Q?I6IKgxUwqYF3xMwVYk0E9FTzBmnd3gnv2EVxMsKUysu2ETsr3nZuDzhATFJ5?=
 =?us-ascii?Q?7mTT6ihKmuC/tD8qkj/zeTWkLHvDGJ47Goz76QqN/ujz+n+bNIPCI3QougSF?=
 =?us-ascii?Q?NtRCrfehGa9hIAPkQbju0B9TLlGgE19b8IzJk8UXROUwZTyRldW7R5FnppQ3?=
 =?us-ascii?Q?HmrKxiJGyg/YRN2ckfFrCywNqBcCs+kNTNnznnuxEMeryg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8UhT716KpKMHDzd+xIV914FyhEohJsddxEFfI8jHv7hv3FjSoo4/qIE0ygQl?=
 =?us-ascii?Q?7fP1SZ1fDMa+vopoTINPHPkwcypm+XT0YDRxwXcQ0Gm5H+Wg4x8+f7JWIed2?=
 =?us-ascii?Q?Drk9eXMZbBG+IOs3Hw2Ixbz/SHAC+yNi/8NO4zQtmuTxGZ/B3Ksiu+9UL5fH?=
 =?us-ascii?Q?ORsunz9gP1Ze9VjHD6C64ommPvLnkrq3H6o58eSBHOOkDQ3LK3aBDC76vCwb?=
 =?us-ascii?Q?ol0byUyXCNTfrYkINbOuUjBXPbFmYcaVCtNs8Adg093C+KhqMc/VMm4E/umr?=
 =?us-ascii?Q?u0l7XFvAgW6J5pCgfy6zqtFe6w9vi/mq9FXPnzMDYnzeDefWVCvXNi8PXr/u?=
 =?us-ascii?Q?7heigjT/R07aVFmIjtUyXD4x+znHQz5jiI5xVHmht4MCGjuVCckNWwF+ZOJW?=
 =?us-ascii?Q?267VzrEty0i69tIThUL3gyJdMOM5ASAb38YSgzeUv1ElVcnw1HxwYn6SYjjz?=
 =?us-ascii?Q?ttBUsH6OdxrrYW1CzIL0RXhWwfOfP+kzHz2NvguYy56SQkps/l2I7X12QNJ3?=
 =?us-ascii?Q?KDTPO2zRUhGeApWUJ6uhh/DHiJkNy7n4F84xQKdRO/AAPyobxv3BdZkMCjJa?=
 =?us-ascii?Q?kpVEHyJ9ctHcbfDlW9q0aXEEwJGYaa+X//lOurLc5qCWX4wRln9jJs45DMye?=
 =?us-ascii?Q?UNOIWMYZ0ShgnFsVFXPwvZxfLRHj7hGa5ds0MTbYjSlwme6KJHMrsAPeodii?=
 =?us-ascii?Q?dPtxZFYtMhRg8FKtd/G6aQDhAhoLLzWJxrIQx7LCgZ/Wxqz/hiXEgCSOfPzg?=
 =?us-ascii?Q?bZj/1AXZduVBYDe+TAS0OMnSSkToU+8aT5IvIr2lXlcz5WR9cf66yvByvfuF?=
 =?us-ascii?Q?B9m3xBxTdrGkDgXmzve6R/NGfczfBvCfrG9U/LIwM7vAwQO/KOlOdcYS04dq?=
 =?us-ascii?Q?5vLAVRepJv5t4xLCFMPfhKeAXjkNGHasl5mK6yFK0IJJGQvJqJJd+ItZIgJV?=
 =?us-ascii?Q?7hVEhXkq5zAB4ppTInEW2ZFt7+qNmQEixZnu4gFdA6CvbgPQeQLNM4So7rMd?=
 =?us-ascii?Q?KUk40mOFylwgkcpjvNWfS3ihd5xuAYPxKu3WCJD7oOOU7KSfwspucFJvSxj/?=
 =?us-ascii?Q?2YbcMV4LWPWeoE2rxO9Mc25NxCYdWZhi09Tc4vRo/scnRes+6W2fTjZahKap?=
 =?us-ascii?Q?gL8l1GRAIss0yOMyiuowjYSWUHLpi8x3r6MQ68CLSAMTPPURrfyePke3b28h?=
 =?us-ascii?Q?q2vABlk/obFRGkYp+1IVFURBmcy9+fjESGznutNDZOxjOeNUJ3CtvCeLQbZR?=
 =?us-ascii?Q?7Dj5Y/4J07OJUCz4iK6nEUjuTckmcoyoXGMXzLreCQ+mJ4B/n4EU6Z+EWuRD?=
 =?us-ascii?Q?IUDuGRpaz40x0AmV3uHqKC6MxzdIrLxIVuYhiGlfyKTP22Ez+ScFTGa8mmuz?=
 =?us-ascii?Q?DDeN5wbJLhH6Tb+0hV5T6gYAhg0E9i6/QiRXgpRU3b6ze74WkQjjtHzKY1/J?=
 =?us-ascii?Q?Zjavkw7AShq2xulJ4Ekg8SFNTvdOn3i+71S/I+jAKc8pV8IroR22T5A73ym6?=
 =?us-ascii?Q?tB6J8DG3g/H1cB0T00fxEViL9uLKGA9/7kRR7Xe3VX3wgDP6jiZl0ybcWLIa?=
 =?us-ascii?Q?IO5JnYzHojNzH9nyV6Kp9btjSLiyM4HAsUyqOHjJSoU2npxelOHbTIccLODr?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8vW5v0hi3rtUAZiwb3/+PcIGh0yd8buD2bBCAD599tvu8TFkph1Go4sXaBsKIBBIbN7SleSIDvMF2hk/VLCqu8cbnBcjDJubo8LAj/DfpVOF+4HMrYebi5n644wIcn4h7Zgz2KuHdPI4VObmG+dq0sClCSY3jH5qoe1YQvzMY4o9bU72iM4BFFdDa81woZAZdzRq4VTS5VutD7nQqL0E9hrikXencQsDvMnLgLG7efkzGQuJ+U8huT5SwElVYDfmvmBxoB1T60HgR0UgGN2jX6Id3McU5mCSvtNZ37w+qfjb8S7FVH8An8ZKhatWRB/Jvs3rnIDt2rKWxmuW2tcb2d24mJiZbCfLn28Tudgj8eNidnK3F0yGBLGMlXka66BBBvHHzYQlvWkOeBo5XqH/BqB8olYIC565bSODXJOZSTP9wMeb3cYHr4EQpoMewIe3ZKmMTXyaCkKQPACuYBUfWJnGwsj9ljzc9pBPRL5aAInZdYatkuqZvpuAyO1PrN24sbywPNQKdUEnIEzMHEBLsFLKZ6cO5DuPV+d6FmGmw5srMEtc2OSc2XePBiF3PS9YjS4mfbb7ydoOTUSzAOn/236XxQ6YhBBgWII4XcapR3Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95020a8d-c796-4df8-222c-08dcb1eab008
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 05:27:51.5286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZvZJfhLWsx3Q/g6oovNRarQ4paGqPKm8Yoa4Mh/94/mDj08XJ/dwDTuujC9c8U18n/lV1BvnQ0fpk9bVHFd9cb0Rx/rajI+rbqCJNDVx4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_02,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010030
X-Proofpoint-GUID: 5ASfcYOh5MJRDRD4yf2DOBs5BOLBTBCA
X-Proofpoint-ORIG-GUID: 5ASfcYOh5MJRDRD4yf2DOBs5BOLBTBCA

Commit fe2101e5 ("fbt: implement based on fentry/fexit probes") failed
to provide a proper implementation to pass the function return value as
arg1 for FBT return probes based on fexit probes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index fa888ed8..99b42586 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -172,6 +172,7 @@ static int populate(dtrace_hdl_t *dtp)
  */
 static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 
@@ -185,6 +186,8 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 		}
 	} else {
+		dt_module_t	*dmp;
+
 		/*
 		 * fbt:::return arg0 should be the function offset for the
 		 * return instruction.  The fexit prpbe fires at a point where
@@ -194,6 +197,21 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 */
 		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
 		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+
+		/*
+		 * The return value is provided by the fexit probe as an
+		 * argument slot past the last function argument.  We can get
+		 * the number of function arguments using the BTF id that has
+		 * been stored as the tracepoint event id.
+		 */
+		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
+		if (dmp != NULL) {
+			int32_t	btf_id = dt_tp_get_event_id(prp);
+			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
+
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
+		}
 	}
 
 	dt_cg_tramp_epilogue(pcb);
@@ -274,7 +292,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	dt_module_t			*dmp;
 
 	atype = strcmp(desc->prb, "entry") == 0 ? BPF_TRACE_FENTRY
-						     : BPF_TRACE_FEXIT;
+						: BPF_TRACE_FEXIT;
 
 	dmp = dt_module_lookup_by_name(dtp, desc->mod);
 	if (dmp == NULL)
-- 
2.45.2

