Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD626A088
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941534; cv=fail; b=Tykzv0DmcoiMepj/ho9G/vrABDeLb3q3HY9bXEJqPrlAFBufWfmqHDR+4dQs3J+QB3QIqGQRxTJz0hmRVvqY0zF0FKEjlX7vrOnoZeicQB+mYy5CoukM8PUKskfTMqcJbxn7Vwbv4IwggLtqi7IrNLJe6mqcV4qWOjhaN7xCn2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941534; c=relaxed/simple;
	bh=1f2PsfqpH/HEdwFWeeShImE+SDkk+WKmesghs5t4VWU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=No53I/l6Ft2dviaebbAL26bCoCsBCEV3VP0RCGra2GgDG+eZLM57SZSwDva/s98emP8agU1iYYzvZNPcPiULW5H45sGI0WJc+oWQCRNaSzD6IlUtlrWSftn8qphj/rmuTHvCJVaU5wxL9zXVYCQARWPXoyLeJ9bPFsOlydGHhGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kjufR7vL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=abnyjIA6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kjufR7vL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="abnyjIA6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PLtsZS001822
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+WVwRAnlzA+hOw9x/7
	HfqiaXDt9cO5hGPQRRuYBLpSU=; b=kjufR7vL6drV2rThpHVqOjIyLLbtoorac8
	q+XdgDJybd3jLh95GqTDlMpqDnfbtyEm5QJBS+cqW0sKSCVRpVGicnPYcf8hHMzB
	68T2Pi69C+N0N5/m/tiCaS1iFwiPqU1YxfINDbtLMBd87b5Pm0seATqRN8RYibrc
	XKIDVbGWTjLYpBgjFTBrLxieIs65QaEoskokcRNEL9grxb/FzTX1v78dJtEg0zrc
	ivQNM2MqsI0qEsRGJHC0w1Dtmr7vI+jHt6Gm6lqOVWKM+DA6Q+WlKUx4Efx+4YCz
	56un+TiDX94UV8wf00Gdhku/iRZQskAoW/yLjXU4t9fpqA7kZgPA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn5m8b9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52PKsQmW028773
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jj6t38uy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMslzRkbznBCAJcEMaaS/2I9hpe//0CfyoCF/w1/NFSIpkGyKd/B/rHE1f65Wdffyki6Xfw3WlBDNb/IB2VCIDzDyDXdcFePJHqWEFq5NVeFSjIITDzUlz6tCEot9/VzNhGNm70R8IS2jWdE05h+sZZ4UFhHg1I/+FyBsodnWdn+biK/44wH577/eqngAl9asKvoDQ1I15rDdPvD3WVSvugiipx9PS3xGZSIUVUWV5TXGR5R9jqBfPh4Qv9PSL9zch/BJSJZQD6tPGHkc4rxBJxqvXOn7tF/OXZ4vvUGWbuG3vI6RkTEMRGRi5Yjk5r2NtYD0HcZeKvdCS8QZhRTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WVwRAnlzA+hOw9x/7HfqiaXDt9cO5hGPQRRuYBLpSU=;
 b=QD7ayn5v6zBY6MPovitltWl6Pkw4H7Av78TxeMl/ZOuKU9WAUoY0yNYGwA1zR+/yZ9bA5RivPZqHeZF4WUlypY3I/Jrjv6nWWHNFQ7iLV7t9vlNcw6451GOM//6uGDJ0yw/NwcK/fFqbV5/jNehyUbuDI4CyemWBWxkBZmNzFHqoWl3NSM7fotB9Zuyop2Xp31RmXbai4QhxpP/xqbFc6VpbSitIes/B3GaiIME1A9NHC3XHwqUWgTZO+2SBEMdg1FkveX9hCkqGdkaI5MSC8dIVt23oe5XQzJcIPMCqAiQqPyxq8trRSptQm+VVnkr2TaIWmPDrLamukSxJvzlHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WVwRAnlzA+hOw9x/7HfqiaXDt9cO5hGPQRRuYBLpSU=;
 b=abnyjIA6ZroIEoPc0Xt2PPRH2C4v5cpI+dXiI5OZbOAf2kwI99c4O0xmGA4HbcES0eb6UvbKkSvDLboUOrEz0C/yqeIdN0H+tYo4nGGXL3Zmf4i2eIOwem/Ufu8EP2VuUXbS3Kv1wHuBLkgKushxEFaXTGDz6cL8naRw6cjd2BE=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA4PR10MB8586.namprd10.prod.outlook.com (2603:10b6:208:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 22:25:28 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 22:25:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] Pad strings in the output buffer with NUL bytes after terminating byte
Date: Tue, 25 Mar 2025 18:25:21 -0400
Message-Id: <20250325222521.15224-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250325222521.15224-1-eugene.loh@oracle.com>
References: <20250325222521.15224-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA4PR10MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: df1e187e-8ed9-46de-faa6-08dd6bebf1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0bpPfJ4K552WgcyawFQSfKTMpPEielxyYf8kpAfZ1T7Zubm8pXoWh13DPBab?=
 =?us-ascii?Q?G8P5F+xHCRpWw9782Avs+qYjq2bGKsL/vu7hv3WzD4JYmJpkHavHpL94j+bv?=
 =?us-ascii?Q?MJ0GOSB8siWxF/Iu/gDIETVB5foLe8m/jaRO1B+zKPH5hMj5vGHIBng3iyss?=
 =?us-ascii?Q?/Wg47zY948FTPiB2dL5b0Mko13IoiKjfq8FHfSqWWVGwU68voW7mgLuvi2W4?=
 =?us-ascii?Q?5sdAGgByr7invNY8jpjHuFsMr86zUHwQLOal7tYBTbT8RJMiMH1c0/L6HNoy?=
 =?us-ascii?Q?9sXHOu5i2L0MxItFebUmJXFZoCqo3kFWFnNYeScLhbm61edmqdKXl/oJreVP?=
 =?us-ascii?Q?zA/+XNwO3DDmzLq+1/ec6GQ9LTH8gKCUkuVxM15gxzyfDj6xIQstM5kHb4nr?=
 =?us-ascii?Q?j0y6yIFN1MGQmOyC77tAG9S2yYixlRAs+M59moSgvxZdw2alqN11SWH1MG1D?=
 =?us-ascii?Q?kqLuCTpCFIL/LpLMRE3LdATRs3Xf7EgG2B9i8TEM3FUa+Y34nu/TGl5ITX1y?=
 =?us-ascii?Q?ZorXjZErrEIoITA0QlXqMEZs3hmuqL5RYMi88wiuYd8PxphleFLix6t8AS3N?=
 =?us-ascii?Q?cXrp104FGFWKsfsM4iUoX5YnO9OmYApDYqbyy/o1o1AzMeWTuc5s5j8dZXFK?=
 =?us-ascii?Q?X3r3fdcwA/FFG47KjoW6AIUmAsphVrNZAlECZyxt2TvYKTFNBTSZuoD3Ych7?=
 =?us-ascii?Q?xFElLqzZ1HCsav4LV9bUgrEzOvCMkaIgCKcHQGchU7MSYMw1b+WsS5b+BLvr?=
 =?us-ascii?Q?Yfot83fNi89p7wRRPD9ZSRH11CvOTiFqjUgdv4UUsqjIgqYls3yzkafqErgK?=
 =?us-ascii?Q?5j7ernlmDsSYcegQtrr2rQBZpT0nVQ+m64ij7ymVwG38gQRDkAab97SF61Pn?=
 =?us-ascii?Q?W2QdRo8xP1k5xVjLZbh1xhDlTuPN1SPI7EtTmiZ5lqFzAZ11DB6imgtVXEJm?=
 =?us-ascii?Q?CzvFw3r/IdIVAAzYDK/lX3kEe0AM8E7kOtURSt58gw5hoYt+foZsiVICxX7w?=
 =?us-ascii?Q?UH/t7bWyMQzsqVh/2imVcnVD7tFJ8s43VtdF5DRX9hkqwxEwSkWeZG8a7oRG?=
 =?us-ascii?Q?ZC2OHsyicu7psqRj1r73UAERjy9qtW1I7w94+d4XFwbydYS1g4DDKm76Csxp?=
 =?us-ascii?Q?/b+aOsbZGjMljeJgYaEqQ/ixV7QZDlDQuXife1tjC3DbtAmkNorx6xVD1Q6u?=
 =?us-ascii?Q?dIurX9ax1vu7HbrSjxwiuIGWuvdigJYlB34azKoHocxW1mpK7RqNoDqy12LU?=
 =?us-ascii?Q?96rGuOYJLhtM7FlHbCcnhuKtdkG5GSwvfoLktJYEQbfYm3gF2Iy1Hd0klZio?=
 =?us-ascii?Q?QyiCbBZiA0nSfTe5snnIr8re0y28cc/J7x7q8kbw2qXU1uegoNj4iDSfmePu?=
 =?us-ascii?Q?S5WM/76S4Job2U/tFt0DzK4V9SWA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d2iLniELoUZ5lkoJLAjOxlGk3MCa+LTFRg5L5QfatIJXGlisbuSQ/2ngS4qc?=
 =?us-ascii?Q?TJlnkE+dJjxpC9ZFazlfJmTshyuJAZhvpBpaHJ2aRrbM2knk46S9/ewlPVaK?=
 =?us-ascii?Q?TDOe/1uTs7AcYxdiKCBpPHmHvzBXX4/fP1pZ2T+wwxVRMD4yVhLGnFhpR418?=
 =?us-ascii?Q?ONhUgqPHc8SYzN834ucH9Ni3V3v6/WgcesmN/Obi8ioqQcZPVeCMjsNLQ0G2?=
 =?us-ascii?Q?ygtsn2oLgRT+Kmhy1hmtNpsGszpwN3kInyMk/+duxmLAKoYow1udCsrlB934?=
 =?us-ascii?Q?U+w6lpTI1LlCJ7GZy4oz/MXU0lXL4V1zUTcAEl41tVd55luxigyr9pYdcsnD?=
 =?us-ascii?Q?iQO/hjNBNNQ+fesipUuSqCJF3ymZXESFonuPXASrNK0Xjh4XNIq3Ld70E40F?=
 =?us-ascii?Q?3k5YNVTLWaA6UJraH+FfdyGabAQcDpLrq9nphyimARZaJ3pcEHmzPsU/GdAG?=
 =?us-ascii?Q?CZqKLIiB2S+qIfgO+qsW1PgemhUKp+mQ5IUL5mF6Xtr5RTvsXAqKbyvxNF4T?=
 =?us-ascii?Q?YakxX+QiCq4THM8jMVPbKDglGa6GC0kvQagQtwlwxP6sleZRc8hFUL6Qh5iX?=
 =?us-ascii?Q?ghg3zA06mct4gMu+DD9p4poUAA4B3qTJjK5sx0B4fRdxVsKW9d365hdrATHJ?=
 =?us-ascii?Q?NHCBkNdfA7TmqS1ZauhbDyiAk68l1GeSicM5o4VshaYX69QPB1UP1TbtlJxx?=
 =?us-ascii?Q?SyuQk+SvcOm01X8a2nR58BhjtWMmV+iDG7rCuM8WwIHSIfXWx7tWXvfZa+W8?=
 =?us-ascii?Q?xpGbL2ZqVtA2r86jygDBhCJ/ZKtXMUy83lZPU3w6ypKi3AH0CL7u97rGhBuA?=
 =?us-ascii?Q?s3LHx/ABoxTQxI6KYLfhVwpIsNLaQnOq+TOAGuwgkcYKuNmL6RoTQzi1Zfbr?=
 =?us-ascii?Q?tUJJnQpK8IA6GXvXrVGxFsxv7Tae9M0XNZhBfX+xLWTxcOQuHrq9vbc2Eh1h?=
 =?us-ascii?Q?zoxswMOK8nepPCH7R37nzUjuMbJEKi8uSEYWrAp42JAz3RLsDBSTXsiYqtOU?=
 =?us-ascii?Q?1lKrnrssvxV8/E3FT0X9HPXIbJUBVe1xmh4KJOazff7JZlDqCOJz9/FDZS/x?=
 =?us-ascii?Q?dFQUNZ4UMF+tricHCDHZHNZ9OwzgzU5sqkcwFoVYdaGTPGrVhogz2nEROQ3H?=
 =?us-ascii?Q?KGE4kO6VkJCTjZY4g12vTqxMC/jsWgfFh7U/bbj1F0sV75+j0qa0utxu4M5o?=
 =?us-ascii?Q?cjccJ6YnPrlAoAxR3D27/VIiYNpZcE2jUB7Fk5RPwvRHV5q+EKKBQ9PB5nCd?=
 =?us-ascii?Q?9mWXf+ZtcvMgIkUruO7wQsY2kPvdFkIdx2/zd5YkwMNONmvh9ih4dojwajr0?=
 =?us-ascii?Q?NjMRznbR5jT6x/7THvJ6XZDU/5zVDzAKiBC2eZS4XTyiYkUZP8VfNxBTG1uU?=
 =?us-ascii?Q?q6gkGfNw2zgI5l4LciT4kT66Ct56jSeRugNFxj9NNkDH71yfB2GScfRGNEdI?=
 =?us-ascii?Q?HbBgcIrztwcm2LMOlNhT7ISIA6bg8WTtcAa5M3SdWRPiznMLplBLqkWobCaK?=
 =?us-ascii?Q?q1B2pR3QjSam0ynzivMpaaDIWCAAxUktJaxKgoLI3rBuBLBJtUMyh1Qi+dPM?=
 =?us-ascii?Q?S2jdrOd2JP1jRmPlSGVhhVleV7YzWcU6dqWgYhPw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1jImqsVpLzCpKvxeDzVhNyPxlnb3dM5sumFd5VB3F00+D3Ty3QKmq0AErOGseE0VJljid75XGh5ohcbTsA9pJd0z4HeLMM9AQhvMz/QVAFf3Q8eAHHBjLBn6Pgevv6dWB6MYnIu6UOnyFJF1Iotiur3JgXu825FK7J8uxJSTSZWb13Hlgx0RhBDuPof92pA/ydbk0o6suMGje2Si5T+qSrTZiYb28+kTzcBWYvQ76M0UwA/sC9K/PYwk0aRbCp1/bBzL9wgfxIx6hI3KFHS1UhrM6DPg6b8ZvMIvtgfeDFeZNe5LY37ZKLGZqyR88v5cRqreAMswvjdK3WZm2mjmHYJSs2gu0esqQP8PCRZriiquTxBjIZrdaFEEpK99WGaCB9VvR9UBw9Cp6zllWq519LeHcFJbZzw5D+aVa1LlzfE/GRg+ni3Azc0EJLpDOMpu70zQdCzBXRIhdNQlKoZ6VLS2v/9ETH2P1RNEgzgjB374PuQur993jA/Ni0OK30PYNonhIFefgZEO73s6FJtGKcU+ItDSzCnXxoovRftnR2j9bYAgjUrThyfluRGicZdhFI800n8Hfl6RJIRdLu4I18ds5g0d5NXLZ7hYRkFdhs4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1e187e-8ed9-46de-faa6-08dd6bebf1ea
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 22:25:27.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cBSG2JcKD7DIc2JQpbrXK5SNe0VtB+tijQTFa6n/qW7dWx0XJAuCjr69rSM+e9N3tkP3RLU5jBJn6IUG/k55A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8586
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503250149
X-Proofpoint-GUID: ndQB3wWsU3ra6lgCeUmmlM703x6_yTUc
X-Proofpoint-ORIG-GUID: ndQB3wWsU3ra6lgCeUmmlM703x6_yTUc

From: Eugene Loh <eugene.loh@oracle.com>

The consumer checks if there are non-NUL bytes after the terminating
NUL byte to decide whether to print the contents of the output buffer
as a string or as raw bytes.  So, for strings, make sure that the
string is padded with NUL bytes.

A robust test that shows the problem can be hard to devise.  Some tests
encounter the problem.  This patch adds another test that might show
the problem.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c                      | 46 ++++++++++++++++++--------
 test/unittest/error/tst.trace_string.d | 26 +++++++++++++++
 2 files changed, 59 insertions(+), 13 deletions(-)
 create mode 100644 test/unittest/error/tst.trace_string.d

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 9b3592b9c..6dcf4cd3d 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1596,6 +1596,22 @@ dt_cg_check_ptr_arg(dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dnp,
 
 static void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
 
+/*
+ * Store a pointer to the 'memory block of zeros' in reg.
+ */
+static void
+dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
+
+	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
+	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
+}
+
+/*
+ * Store a value to the output buffer.
+ */
 static int
 dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		dt_pfargv_t *pfp, int arg)
@@ -1676,6 +1692,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 		goto ok;
 	} else if (dt_node_is_string(dnp)) {
+		uint_t	lbl_ok = dt_irlist_label(dlp);
 		size_t	strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
 
 		if (!not_null)
@@ -1702,6 +1719,22 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_str));
 		dt_regset_free_args(drp);
+
+		/*
+		 * Pad the rest with zeroes, if necessary.
+		 */
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
+		if (dt_regset_xalloc_args(drp) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
+		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
+		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
+		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
+		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+		dt_regset_free_args(drp);
+		emitl(dlp, lbl_ok, BPF_NOP());
 		dt_regset_free(drp, BPF_REG_0);
 		TRACE_REGSET("store_val(): End   ");
 
@@ -3042,19 +3075,6 @@ dt_cg_pop_stack(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
 	dt_regset_free(drp, treg);
 }
 
-/*
- * Store a pointer to the 'memory block of zeros' in reg.
- */
-static void
-dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
-{
-	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
-	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
-
-	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
-	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
-}
-
 /*
  * Generate code to promote signed scalars (size < 64 bits) to native register
  * size (64 bits).
diff --git a/test/unittest/error/tst.trace_string.d b/test/unittest/error/tst.trace_string.d
new file mode 100644
index 000000000..4b06aef88
--- /dev/null
+++ b/test/unittest/error/tst.trace_string.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test ERROR probe firing.
+ *
+ * SECTION: dtrace Provider
+ */
+
+#pragma D option quiet
+
+ERROR
+{
+	trace("Error fired");
+	exit(0);
+}
+
+BEGIN
+{
+	*(char *)NULL;
+	exit(1);
+}
-- 
2.43.5

