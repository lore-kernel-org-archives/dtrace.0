Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6869221F2D
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913579; cv=fail; b=STumlddVeTysJ3chdA3GkOh6RyAcO5X3DlnNUM4h+esD9AvU9wH5/V+hNL4o7go/matplqrMK1QRxY9qmpgjG2OIFykrAkxeiYjE3OETt86FMkPmV5lfwktDCbBR3nXCdFmxw5iGyRaNlDReYYajKNot/8r0Ctl1BttPKvq84w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913579; c=relaxed/simple;
	bh=46zJC8arb9U8cDHCAcAlHDjNbc6Z4QTbzVP6aE53fRM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l9e7y/8DwudKvdSZ93tmqzr2DvdY9k1vwV+yaDiVeEFKzjGkezm0Wsc58iIIs+y5KcquDk8vW7ehtSLGLZzUrihMUmcqeS0e+yWaLuvN3E7v1J0Zo+MDzIfESYkPSNSiFYarmKCwO/LyoyYEFpkk7x2YTGrixqyXacqE2NztlKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T9TAUdGI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w8SenrEA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T9TAUdGI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w8SenrEA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINL3R030858
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FGAqnAbJjAjRlcEEl2
	Xx+12QB+m+dZzbzsmErFtMtsw=; b=T9TAUdGIKfnczUqS/RGmfrfb2LByXolCJo
	tRfX/+8YN7UYPDYKNMHlvdQ8QhuOg5C6+0j63peXQy7l0HdWjmSsZJI9pTD79klE
	V6CVuKTJcQNWeRXsudaWWNSzV8rcpbMqW/svlSAoXOgZdccYOMnODjFWMJetpbUs
	E/8uCcXWh7vk1neXGOIMvXmEYs7KsBA/p7tEibKpaKTE1Bsxxe7eR5o9K1qkGqnn
	MiJaVGdl6kjkm37AtoxGg7jdCp+m5bvTjquWOfqRsUSL1F4KORuTBPbfjUWW5b37
	1OugBffmLoqxUOsOsl3PaCsik9X6ejs3wTKMZvjj3XkTUjpBc34w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dyv182ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIP9BW023334
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:14 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f6v-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsS1ZUKjVYguB/hOb9XLHFUB3xUVtg1Iznnwiz8jat5inoZ7k6DB9j6J4+ogyV1Tt6yCe44rn3O9spe8gcRB9aea7ikYxvPEeJoDUB77W1P1B2FoFq8n1mlsePa88BXTHpNn/bxf/qecoci5vJCqRqriJnioI8Nx53VKY0wKkoSp4ueCvt1m/ZH4OV/9guuB0Mfb2/dxrHc3rXXaNfV7cDgiUugTdtziUW4De43Ie4KdPTDg7MawDsQvlNVjszyWpPm5H3T0m6I+JfuU7ewOdXZT0VEnxNGiBtcxaGbEDU4oCv/d7K82t2pE7g43OdU0D8/ejnQoMXKWLS6Qe1a35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGAqnAbJjAjRlcEEl2Xx+12QB+m+dZzbzsmErFtMtsw=;
 b=licWXurmeyJrsewkZbcMlzRCbWQVIGzTEauNiUK9nmn5fKQUKx5lzVJhuL3eLVeFTpsohKhDYyveiC0qYTGWNBkLh5wBgZXFdkf7Ocmt+25D5F7Z4jTZpqNeW1gnofH7To3if00jZ4C2Q8gQ9DNbbY0tDjfszWETCoQpItkZ8MKvs1h+WoNpxbf3fu/6dVYEAjZkDfCodAdOOQMnuoHcrU5MzQsCzfDaz1SVj7btsCvQSIjo+ZJD15MRUtZx3LIJZ+rG/w5BsuvFrSgvbJHeICX66ExeJmkVjzIoI1fIviwyd0X3Veff29LKgLgnb/0ALi9bGEALXjaL+BUbwfQYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGAqnAbJjAjRlcEEl2Xx+12QB+m+dZzbzsmErFtMtsw=;
 b=w8SenrEADQh2Cez2BgRJo5zSbxvT/oe+A/MGf03LscfKQhikhsRawnRV5Fi38vGZ1fusVuVGAiThU7ag4ui+u1NWiYhYu8TVTcPU0elMilo+/aF6VoC87x8RKjASxVyKf4HCwKzWUhbQSZx/MTBZb6deG0i7AqNWFnwPpeffiUE=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:08 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/20] doc: Clean up dangling anchor links
Date: Fri, 26 Sep 2025 15:05:43 -0400
Message-Id: <20250926190557.8485-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc82f3c-538b-4ede-f591-08ddfd2fc024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eIX8292uiGN3TK8fFoZpgv0f9vOrqjTlhmaY1r3YRE/ygmLdcwJLFH6yIll6?=
 =?us-ascii?Q?gW/2Kd0jxpTw4UVlzRNP1z13aGPgr1fWluAzv3jzwkQIdFZ5ZqLZMHa7s3Tw?=
 =?us-ascii?Q?Ps+Els26EyXFxm/sulGVSlnJEmyMEGx752UZHiDWE6GUjoOr3XNbZCvZ5wdI?=
 =?us-ascii?Q?eX38DjssZFnZUs6dnAe7MF9dW4nmkLbIhJnCfBEUTzdyEDG0xDeZaFS8+iaJ?=
 =?us-ascii?Q?8WcSausqFemKRMq1+QdxOYt6Ji5dF7jKAEc90zg9+PHxhE2Mg1UjK02KQsAo?=
 =?us-ascii?Q?FxDMrakxbmaSqXHqQJH7hvQpz80U0rsBepdvwCwxF+nloimeJXGFinZyCS75?=
 =?us-ascii?Q?iUGrDStaDsU1Ne6c5vpWXeqoL9d3d1Hly3ZlKfyu0Fl2XxGNRzzvOjfMPhnD?=
 =?us-ascii?Q?6/2bmRfpJoN/X98AlAtZ8f8ikFHx14UQg6ZnJShQL+hXPV9NnCx38qoZ0M1n?=
 =?us-ascii?Q?vxEWb9czwZLuVzgdduurNcXHzt0k0M8HGuwoY2kdUaImeAeQBhqaN+ZhQ5jZ?=
 =?us-ascii?Q?nR+DATZwzXDNCYO6PnZwCOjZVjpao1cgTQS99H5/Ov+QoYHDZ8T23Z7AEVMi?=
 =?us-ascii?Q?2I1TyZHGWdHhgCHoHz1qJfzq+Z2d7iX3rxKWnZM6vLC+D0UwpNnumg4uwXDu?=
 =?us-ascii?Q?TK997THikab5FntC2BGFKsljJAup49UvNFadac9/nO+l7j4eipBeOEHMxyiZ?=
 =?us-ascii?Q?RPn23PceZryvyRavBnsKqCfWKmAggP9zZRjEH0QHszvGOlgmmy0vVRL7M2LB?=
 =?us-ascii?Q?QEB56wB3oKx9yVVbF7E4VdImnfeT9Ji7KVrcww1vNovcDt1c+15JXa5C98gN?=
 =?us-ascii?Q?8YGM/hqV9HvYcBb0fE8MhbKBkvPPP44MZ9/XQxHgZ3zu5KfxkS2VIQkViVvJ?=
 =?us-ascii?Q?GnqrkJo9SYv8dKzI+IT7cZP1Fq5jb7vn4lV7jg/e5OdHQ1APy4lI1c5esefA?=
 =?us-ascii?Q?ec8uK6hkEsv0DZNekqJui/dYbEFe7CL8D7/Z72o7vkGdSMaujNnwGvE+AHTL?=
 =?us-ascii?Q?ayexu2Mop8zrCjRenyKYqH53TOEyNWIZe+GBsyiBUFRQDQnsx/4EXr1iPYMZ?=
 =?us-ascii?Q?+Oq94nXmE5oRH7ySfPTArU5t8zPIMV8VJFoOj6xjPWj+5sHloFPeN1APO5Ls?=
 =?us-ascii?Q?MpVwwISYPb6B4wWCbG0jDBCc54+Tic3338sYNSYosnPa62Jl+HO32P7vGOsq?=
 =?us-ascii?Q?B+I4yc5TJHLPel8hrVvDBKUxA7MbcmdXlfsi3YhgWhKSC4ip+CusmlovUEbQ?=
 =?us-ascii?Q?R0tmlm+P/6YFkk9+s0TMBzZDdelS6sPvsBFP2KIHo5opmmV34DLw8kDGPKAq?=
 =?us-ascii?Q?xrwVvNnx9zz8ID9wIvTO7K/D8187NKRTbLmJtxEqxen2LJeHnXiIClVt5iic?=
 =?us-ascii?Q?KMmN5v338jKmgaZ0QkTbvj8KaMBk/Xsg/86bVqegTM0yp3KYVhwxlN9Ma43T?=
 =?us-ascii?Q?AJ8rOUZWJiwumVuIeNCp0N+BGQl8PBiZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AmHmYwHvqAow2mDRyBjYViONLXTIya9vMTJfRFSHv7bQWSn6VekO9VYvvDSU?=
 =?us-ascii?Q?370HvQlI2LjEJ+JkTTZovm2rkSjcW88siokpIhj3+X2PSuGGTUZzqSpDNjys?=
 =?us-ascii?Q?5uJ0iLavwK8BTh5NxPXOsK5i4NVuWWUy/42qC1nWi9y/Lc4w20zgHfaui9Rp?=
 =?us-ascii?Q?fYov+QbBGTDfrgT27YUpGvvCpbfAo0CCMNa72AzzVm7BJ/LtKjg09fmz1tKU?=
 =?us-ascii?Q?YiZ3eJpfvuvlEtl39sSHgFvBmxep+2eiaANKrQ5DqYKa9aYUsneSaJ9H3Y5g?=
 =?us-ascii?Q?YmqTWkeJ3zNlcAEqU9uLH6eZGh2L5PUNPoqRXNskAd79NvCNvPV+TXivHWJi?=
 =?us-ascii?Q?07j2VGvIrlxKOyjjQO9gXuiRlE6e3D7vFNzRsXpW9vXkCUOCoHn2hLeG4gcr?=
 =?us-ascii?Q?xABSZjOQG3JrjKwqpeyBc14fL1ct92aLjF9n5UabEioFPTPkqDnS7KCvTDip?=
 =?us-ascii?Q?6MRAP7zh4sFhfd9VwV4B5FpCYXxcrjXgUjHsJPDyqz81sZGx86+5fweJFFhi?=
 =?us-ascii?Q?mPG5y3/zgckZ/MvgY2lkKvpxO8QAQIhxqt+Tmqn25aERMbbm7ui2DE2MvNFj?=
 =?us-ascii?Q?RTYmedgWYdy+uOAb5Yfln3rZRk279FnbMh7IwrSvXB8Bu0vh7o0Nq7chNYQa?=
 =?us-ascii?Q?G3/buseBdJ2I4PavYR6NLTSiWaR/dBmXboQQ5tJAxqny5OozSCU84xTWU9H0?=
 =?us-ascii?Q?pLqvaglE/oO/2SPZamjL65ds539s+qlY0YkNMAqplP24oDbqsvUyqyZCdfQe?=
 =?us-ascii?Q?Q6iMvlyhxcyTgcRW8Fml/QUYuweJHJbdhzEuywJq16YwOiWoWb0gcuEdKO2j?=
 =?us-ascii?Q?/LttVDxPxCdJFrfsvFW/0MvwwXjFqHup0dmNUMph+6xzGb7+OPrk+WhByxZl?=
 =?us-ascii?Q?FXmO31Mn+IWMOAORLnGSZcxGj3EZBoOqCxITEgaWIyNi/IekDuBZbhaaaN37?=
 =?us-ascii?Q?i4StpqUAn5jCzlqgvlIJJdLEua24tXR8TcKy3MKaZP5K0e/DHyES9dvEssqn?=
 =?us-ascii?Q?B1py48CTu8s0PFXR/OKqzifUUmSsEE7F5y7WXMgp5cg87odfb/dBgogYjt+I?=
 =?us-ascii?Q?qg99vgOaEQOvrut+Klg0eTbFKSlnAry6EmG42VI/3jkDvPprawaVDMm9Ug1B?=
 =?us-ascii?Q?2QUfzXuUVuQ6hXmWAlTxORl0xNOrl3KPx9ig7xtWIKsq6ia8rW7BcQRAR6OA?=
 =?us-ascii?Q?8lVxFwIWyyhwmXj+5c1yXIeftrJhDxaQFrydc+2o4c7LhEX64YazifGDKCaZ?=
 =?us-ascii?Q?XW2LYCRp5XJ68b/oomLrYfRnjgUwpEr63DE/jDRk+EI9u8EvP/MHWuS9UFB6?=
 =?us-ascii?Q?Qo5T7Qa6zxhLyqDG0Q5t59NyxG+U6xnHTPqQIHkQRxhI0taDzEKu2BIfZvox?=
 =?us-ascii?Q?EZt/Yz39selfxeYrWDGgQ57kt4QfPPtpIOSR1hPF59q1XOKJsF3yEdBYF/IF?=
 =?us-ascii?Q?mAcJKW+ezsn/w7tyjHrXu2ceap5vqR0PTMQZYBqeDdZLVX9fbkKw2AD1Ib2i?=
 =?us-ascii?Q?4xQVjRQBf1AeN1qTXyTtdZScUGLWMGvEteLauxjOfBQcCyjUSLMzVNtGCSdg?=
 =?us-ascii?Q?U4uTe61seg4L9eL/zKUKV40efbcGMDzS4vSKkUDE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gvEq+YJcPNm2G8uN7jHYDO+aSCB/r0AEJ2FemMcJ0I5ay84pPTq3ECGqQ7smaGDFI1yNWHDyC0m0AGI6GujnH+8K5cuweCgUcvR/inZgBRt3phzjAM/VoHQ21NHQ5ateiHiV3pFa13B93rfOVkq6TkiGcfRVgYbSq4B6Hx7EcW6+kiwIVs62v9xQLVcS4yLnLb5IbDda0C9jJ0yQMTk5Is0PGP3w+foteww/PwQePnjXxqCmzoKaYxNrwWfBMUVpMbg1/vZ4q4jFlP5KD8B4V024AQAbVV+dMoCwuKCWt0nr6G7Zf53vkjyvDk1V5ehLLAjmfsmCAh3h8fO9XOW2c1gQPiS7njwL2tiRhNrBOp/Ds0KDtF/6fK3PIVWEJkPWflW8KwwZ5f/4ZL/Z6lExxw8bZ1piO7jgq8CwR5BOH0CzueWF74ERS9nydWjf8suNGc4NER36hMv9UkR1odbYm3KeabjPQ/Z6jWLg8XGYPFO4vz3CZKlamAGAD22URFNel3d5UZrlKkX86iyB5wWfoODpL9UDoN/5vZqqva3l9X9bbLXAGumrxA9pYbfhrLMJV5wsK7FhZhfOknqN6STLBX/p1CHYvWgQudICbRycHUs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc82f3c-538b-4ede-f591-08ddfd2fc024
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:08.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ktuac09zqNyUaMaasYQKG7e5RhBHzfYExJMMhtTvSCWR1ZO/gx/urBLBzNPg2HRdgRD7NnEVX6DZasox5wOWTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: YH5nk9Y0numhoDq9lNSv_9Pxdo9MJ9lc
X-Authority-Analysis: v=2.4 cv=PdDyRyhd c=1 sm=1 tr=0 ts=68d6e427 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1I4LuXStgUQjPqsxYl4A:9
 a=Vl0SkxlkIPbKrL4X:21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2NCBTYWx0ZWRfXx5qMWSm4CCq5
 60TsBut/DNJlfZxSrc1tMRUsfdZS/w+T5hkxTud6bQrlE6O0VibrZCQLTjklQuVigsIicSMTesn
 FWJJPgC6IXDVMF8N1Osa70iuE0HdWvKwNN924tYNelJxR2j+l/LtbuceUatQj/ONHT5jt9nvD5t
 fQF3Oe3S8QsbMARs3ujP3wzD+OgG7romgrFPq3wER8Tc5imNPmdtzRRs58Zu0fVa215zCE9EhIz
 yawzDg9T+GhVA0DaCoNR2p7WBY2r+S36w6qSTjvTZ6V4ZqbIdYQNw1WQJmyLCtOCtECpn/ctUf4
 1JfxUP6Qghkul19cvBA/0fKG7R5JffaFcjCNQ5gRJE/PRbeky+CTgUaIj6Z9gwSE4foWWo+fgNb
 FnbGc0b7ygEr03Lnxb2lXRzhgoWnZg==
X-Proofpoint-GUID: YH5nk9Y0numhoDq9lNSv_9Pxdo9MJ9lc

From: Eugene Loh <eugene.loh@oracle.com>

Links within the User Guide can point to specific anchor tags within a
page by appending '#' to the page in the link.  A number of links have
the '#' but no tag.  That's okay, but tidy them up for a cleaner look.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../dtrace-components-and-terminology.md      | 10 +++---
 doc/userguide/explanation/dtrace-concepts.md  |  4 +--
 doc/userguide/how-to/dtrace-guide.md          |  8 ++---
 .../dtrace-howto-create-a-dtrace-script.md    |  2 +-
 .../reference/d_program_syntax_reference.md   | 16 +++++-----
 .../dtrace-ref-DTraceSupportforStrings.md     |  4 +--
 .../dtrace-ref-PointersandScalarArrays.md     |  2 +-
 ...dtrace-ref-TypesOperatorsandExpressions.md |  4 +--
 .../reference/dtrace-ref-Variables.md         |  4 +--
 .../dtrace_builtin_variable_reference.md      |  2 +-
 .../reference/dtrace_command_reference.md     |  8 ++---
 doc/userguide/reference/dtrace_providers.md   | 31 +++++++++----------
 .../reference/dtrace_providers_proc.md        |  2 +-
 .../reference/dtrace_providers_sched.md       |  2 +-
 .../reference/dtrace_runtime_options.md       | 14 ++++-----
 15 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
index be6c649d7..b187055a4 100644
--- a/doc/userguide/explanation/dtrace-components-and-terminology.md
+++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
@@ -3,7 +3,7 @@
 
 Learn about the different components and the terms used to describe them within the DTrace framework.
 
-DTrace is a framework that dynamically traces data into buffers that are read by the `dtrace` command line utility. The `dtrace` command line utility can run programs that can implement certain functions by compiling D programs to generate eBPF code that's loaded into the kernel. In practice, all interaction with DTrace is performed by using the `dtrace` command line utility. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md#) for information on how to install the command line utility.
+DTrace is a framework that dynamically traces data into buffers that are read by the `dtrace` command line utility. The `dtrace` command line utility can run programs that can implement certain functions by compiling D programs to generate eBPF code that's loaded into the kernel. In practice, all interaction with DTrace is performed by using the `dtrace` command line utility. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md) for information on how to install the command line utility.
 
 **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
 
@@ -31,7 +31,7 @@ Output is displayed to show each of the different values that are used to refere
     ...
 ```
 
-See [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#) for more information on how to list and enable specific probes.
+See [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md) for more information on how to list and enable specific probes.
 
 Probes are made available by *providers*, which group particular kinds of instrumentation together. If a provider is related to source code, its probes might also include information about the piece of code that the probe relates to in a *module* and a *function* identifier. Therefore, a probe is identified by a *probe description*, grouped into four fields:
 
@@ -64,7 +64,7 @@ Some probes don't have a module or function identifier when they're listed. When
 dtrace:::BEGIN
 ```
 
-Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md#) or the [CPC Provider](../reference/dtrace_providers_cpc.md#), also don't include module or function identifiers in their descriptions.
+Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
 
 ## D Programs {#concept_terms_programs}
 
@@ -119,12 +119,12 @@ The program probe description matches all system call functions at the entry poi
 
 Although you could code an application to calculate an aggregation for a set of data, when many probes are firing concurrently, they can overwrite each other's updates to the aggregating variable or the calculation can become a serial bottleneck.
 
-DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md#) for more information.
+DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md) for more information.
 
 ## Speculation {#concept_terms_speculation}
 
 While predicates can be used to filter out uninteresting events, they're only useful if you already know which events you need to filter. Because DTrace is often used to help debug particular system behaviors, DTrace includes a set of *speculation* functions that can be used to trace data speculatively.
 
-Speculation is used to trace quantities temporarily until particular information is known, at which case the data can be discarded or committed. By performing speculative tracing you can trace data until you know whether it's useful. For example, to trace data about events that might trigger a particular return code or error, you could speculatively trace all events and discard the trace data if it doesn't match the return code that you're interested in. See [Speculation](../reference/dtrace-ref-speculation.md#) for more information.
+Speculation is used to trace quantities temporarily until particular information is known, at which case the data can be discarded or committed. By performing speculative tracing you can trace data until you know whether it's useful. For example, to trace data about events that might trigger a particular return code or error, you could speculatively trace all events and discard the trace data if it doesn't match the return code that you're interested in. See [Speculation](../reference/dtrace-ref-speculation.md) for more information.
 
 
diff --git a/doc/userguide/explanation/dtrace-concepts.md b/doc/userguide/explanation/dtrace-concepts.md
index adb5413d3..6e2b91a65 100644
--- a/doc/userguide/explanation/dtrace-concepts.md
+++ b/doc/userguide/explanation/dtrace-concepts.md
@@ -5,8 +5,8 @@ Explore DTrace at a conceptual level and understand DTrace components and termin
 
 The topics in this section are general and can help you to understand what DTrace is and how it works.
 
--   **[About DTrace](../explanation/dtrace-about.md#)**
+-   **[About DTrace](../explanation/dtrace-about.md)**
 DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
--   **[DTrace Components and Terminology](../explanation/dtrace-components-and-terminology.md#)**
+-   **[DTrace Components and Terminology](../explanation/dtrace-components-and-terminology.md)**
 Learn about the different components and the terms used to describe them within the DTrace framework.
 
diff --git a/doc/userguide/how-to/dtrace-guide.md b/doc/userguide/how-to/dtrace-guide.md
index 137d62e3a..02863588b 100644
--- a/doc/userguide/how-to/dtrace-guide.md
+++ b/doc/userguide/how-to/dtrace-guide.md
@@ -8,12 +8,12 @@ Most of the information in this document is generic and applies to all flavors o
 
 The topics in this section provide guidance on how to perform particular operations with DTrace and serve as an introduction to installing and using DTrace. By following steps in this guide, you can get started with DTrace immediately. After you have explored these topics, you can either review [DTrace Concepts](../explanation/dtrace-concepts.md) to get a better understanding of how DTrace works and how you can improve the way that you use it, or you can use the various references that are included to find out more about writing D programs that do what you need them to do.
 
--   **[Install DTrace](../how-to/dtrace-howto-install-dtrace.md#)**
+-   **[Install DTrace](../how-to/dtrace-howto-install-dtrace.md)**
 
--   **[List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#)**
+-   **[List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md)**
 DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
--   **[Create a DTrace Script](../how-to/dtrace-howto-create-a-dtrace-script.md#)**
+-   **[Create a DTrace Script](../how-to/dtrace-howto-create-a-dtrace-script.md)**
 Learn how to create a DTrace script to develop understanding of the D Programming language.
--   **[Use Predicates For Control Flow](../how-to/dtrace-howto-use-predicates.md#)**
+-   **[Use Predicates For Control Flow](../how-to/dtrace-howto-use-predicates.md)**
 For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
 
diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
index c4fcb4ed3..199649a9f 100644
--- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
+++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
@@ -3,7 +3,7 @@
 
 Learn how to create a DTrace script to develop understanding of the D Programming language.
 
-Ensure that DTrace is installed on the system and that you can list and enable probes. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md#) and [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#).
+Ensure that DTrace is installed on the system and that you can list and enable probes. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md) and [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md).
 
 This tutorial provides successive steps toward developing a DTrace script that you can use on a system to gather useful information. You can use this tutorial as a framework to create other scripts for DTrace, in future.
 
diff --git a/doc/userguide/reference/d_program_syntax_reference.md b/doc/userguide/reference/d_program_syntax_reference.md
index cd1ad5c1b..862ce0322 100644
--- a/doc/userguide/reference/d_program_syntax_reference.md
+++ b/doc/userguide/reference/d_program_syntax_reference.md
@@ -3,20 +3,20 @@
 
 This reference describes how to write D programs that can be used with DTrace to enable probes and perform operations.
 
--   **[Program Structure](../reference/d_program_syntax_reference_program_structure.md#)**  
+-   **[Program Structure](../reference/d_program_syntax_reference_program_structure.md)**  
 A D program consists of a set of clauses that describe the probes to enable, an optional predicate that controls when to run, and one or more statements that often describe some functionality to implement when the probe fires.
--   **[Types, Operators, and Expressions](../reference/dtrace-ref-TypesOperatorsandExpressions.md#)**  
+-   **[Types, Operators, and Expressions](../reference/dtrace-ref-TypesOperatorsandExpressions.md)**  
 
--   **[Variables](../reference/dtrace-ref-Variables.md#)**  
+-   **[Variables](../reference/dtrace-ref-Variables.md)**  
 
--   **[Pointers](../reference/dtrace-ref-PointersandScalarArrays.md#)**  
+-   **[Pointers](../reference/dtrace-ref-PointersandScalarArrays.md)**  
 
--   **[Structs and Unions](../reference/dtrace-ref-StructsandUnions.md#)**  
+-   **[Structs and Unions](../reference/dtrace-ref-StructsandUnions.md)**  
 
--   **[DTrace String Processing](../reference/dtrace-ref-DTraceSupportforStrings.md#)**  
+-   **[DTrace String Processing](../reference/dtrace-ref-DTraceSupportforStrings.md)**  
 
--   **[Aggregations](../reference/aggregation.md#)**
+-   **[Aggregations](../reference/aggregation.md)**
 
--   **[Speculation](../reference/dtrace-ref-speculation.md#)**
+-   **[Speculation](../reference/dtrace-ref-speculation.md)**
 
 
diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index ea9dfa306..98f482c63 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -31,7 +31,7 @@ In the next D statement, if `s` is of type `string`, the string type indicates t
 trace(s);
 ```
 
-You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md#).
+You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md).
 
 ## String Constants {#dt_strcon_dlang}
 
@@ -80,7 +80,7 @@ Scalar type expressions, such as a pointer or integer, or a scalar array address
 
 ## String Comparison {#dt_strcomp_dlang}
 
-D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md#) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
+D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
 
 <table><thead><tr><th>
 
diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
index c68982d40..da4b69333 100644
--- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
+++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
@@ -53,7 +53,7 @@ dtrace: script '/tmp/badptr.d' matched 1 probe
 dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address (0x0) in action #1 at BPF pc 156
 ```
 
-Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md#).
+Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
 
 ## Pointer and Array Relationship {#dt_ptrarel_dlang}
 
diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index 0e776867c..1a1549445 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -390,7 +390,7 @@ Type Name
 16 bytes
 
 </td></tr><tbody></table>
-D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md#).
+D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md).
 
 ## Constants {#dt_consts_dlang}
 
@@ -664,7 +664,7 @@ Arithmetic in D can only be performed on integer operands or on pointers. Arithm
 
 However, the DTrace execution environment does automatically check for and report division by zero errors resulting from improper use of the `/` and `%` operators. If a D program contains an invalid division operation that's detectable at compile time, a compile error is returned and the compilation fails. If the invalid division operation takes place at run time, processing of the current clause is quit, and the `ERROR` probe is activated. If the D program has no clause for the `ERROR` probe, the error is printed and tracing continues. Otherwise, the actions in the clause assigned to the `ERROR` probe are processed. Errors that are detected by DTrace have no effect on other DTrace users or on the OS kernel. You therefore don't need to be concerned about causing any damage if a D program inadvertently contains one of these errors.
 
-In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md#). You can control precedence by grouping expressions in parentheses \(`()`\).
+In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md). You can control precedence by grouping expressions in parentheses \(`()`\).
 
 ## Relational Operators {#dt_relatops_dlang}
 
diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
index da2130fa6..bc10071ca 100644
--- a/doc/userguide/reference/dtrace-ref-Variables.md
+++ b/doc/userguide/reference/dtrace-ref-Variables.md
@@ -15,7 +15,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
 
     where *name* is any valid D identifier and *expression* is any value or expression that the variable contains.
 
-    DTrace includes several built-in scalar variables that can be referenced within D programs. The values of these variables are automatically populated by DTrace. See [DTrace Built-in Variable Reference](dtrace_builtin_variable_reference.md#) for a complete list of these variables.
+    DTrace includes several built-in scalar variables that can be referenced within D programs. The values of these variables are automatically populated by DTrace. See [DTrace Built-in Variable Reference](dtrace_builtin_variable_reference.md) for a complete list of these variables.
 
 -   **Associative Arrays**
 
@@ -29,7 +29,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
 
     Where *name* is any valid D identifier, *key* is a comma-separated list of one or more expressions, often as string values, and *expression* is the value that's contained by the array for the specified key.
 
-    The type of each object that's contained in the array is also fixed for all elements in the array. You can use any of the assignment operators that are defined in [Types, Operators, and Expressions](dtrace-ref-TypesOperatorsandExpressions.md#) to change associative array elements, subject to the operand rules defined for each operator. The D compiler produces an appropriate error message if you try an incompatible assignment. You can use any type with an associative array key or value that can be used with a scalar variable.
+    The type of each object that's contained in the array is also fixed for all elements in the array. You can use any of the assignment operators that are defined in [Types, Operators, and Expressions](dtrace-ref-TypesOperatorsandExpressions.md) to change associative array elements, subject to the operand rules defined for each operator. The D compiler produces an appropriate error message if you try an incompatible assignment. You can use any type with an associative array key or value that can be used with a scalar variable.
 
     You can reference values in an associative array by specifying the array name and the appropriate key.
 
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index be91cd81c..37beb34c2 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -325,7 +325,7 @@ The built-in variable `execname` references the name that was passed to `execve(
 fileinfo_t fds[]
 ```
 
-The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md#).
+The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md).
 
 ## gid {#dt_ref_var_gid}
 
diff --git a/doc/userguide/reference/dtrace_command_reference.md b/doc/userguide/reference/dtrace_command_reference.md
index 90209d123..2c45d8e4b 100644
--- a/doc/userguide/reference/dtrace_command_reference.md
+++ b/doc/userguide/reference/dtrace_command_reference.md
@@ -3,12 +3,12 @@
 
 The `dtrace` command is a generic front-end utility for the DTrace facility. The command implements an interface to invoke the D language compiler. The `dtrace` command can also retrieve buffered trace data from the DTrace kernel facility and includes a set of basic routines to format and print traced data.
 
--   **[About the dtrace Command](../reference/dtrace_command_desc.md#)**  
+-   **[About the dtrace Command](../reference/dtrace_command_desc.md)**  
 The `dtrace` command provides a generic interface to all the essential services that are provided by the DTrace facility.
--   **[dtrace Command Options](../reference/dtrace_command_options.md#)**  
+-   **[dtrace Command Options](../reference/dtrace_command_options.md)**  
 
--   **[dtrace Command Operands](../reference/dtrace_command_operands.md#)**  
+-   **[dtrace Command Operands](../reference/dtrace_command_operands.md)**  
 
--   **[dtrace Command Exit Status](../reference/dtrace_command_exit_status.md#)**  
+-   **[dtrace Command Exit Status](../reference/dtrace_command_exit_status.md)**  
 
 
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 6fd0fec6e..9f64935c6 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -3,30 +3,29 @@
 
 DTrace exposes different providers that publish probes that are grouped together for particular instrumentation or functionality.
 
--   **[CPC Provider](../reference/dtrace_providers_cpc.md#)**
+-   **[CPC Provider](../reference/dtrace_providers_cpc.md)**
 The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
--   **[DTrace Provider](../reference/dtrace_providers_dtrace.md#)**  
+-   **[DTrace Provider](../reference/dtrace_providers_dtrace.md)**  
 The `dtrace` provider includes several probes that are specific to DTrace itself.
--   **[FBT Provider](../reference/dtrace_providers_fbt.md#)**  
+-   **[FBT Provider](../reference/dtrace_providers_fbt.md)**  
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
--   **[IO Provider](../reference/dtrace_providers_io.md#)**
- The `io` provider makes available probes that relate to data input and output.
--   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md#)**
+-   **[IO Provider](../reference/dtrace_providers_io.md)**
+The `io` provider makes available probes that relate to data input and output.
+-   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
--   **[Pid Provider](../reference/dtrace_providers_pid.md#)**
+-   **[Pid Provider](../reference/dtrace_providers_pid.md)**
 The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
--   **[Proc Provider](../reference/dtrace_providers_proc.md#)**
+-   **[Proc Provider](../reference/dtrace_providers_proc.md)**
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
--   **[Profile Provider](../reference/dtrace_providers_profile.md#)**
+-   **[Profile Provider](../reference/dtrace_providers_profile.md)**
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
--   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md#)**  
+-   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**  
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
--   **[Sched Provider](../reference/dtrace_providers_sched.md#)**
+-   **[Sched Provider](../reference/dtrace_providers_sched.md)**
 The `sched` provider makes available probes related to CPU scheduling.
--   **[SDT Provider](../reference/dtrace_providers_sdt.md#)**  
- The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
--   **[Syscall Provider](../reference/dtrace_providers_syscall.md#)**  
+-   **[SDT Provider](../reference/dtrace_providers_sdt.md)**  
+The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
+-   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
--   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#)**
+-   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
-
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index 40903775d..6c1fa8ecf 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -130,7 +130,7 @@ No fundamental difference between a process and a thread that a process creates,
 
 ## proc Probe Arguments {#dt_ref_procargs_prov}
 
-The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md#) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
+The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
 <table><thead><tr><th>
 
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index 68bcdf715..f6d183708 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -245,7 +245,7 @@ Probe
 </td></tr><tbody></table>
 ### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
 
-The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
+The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
 
 ### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
 
diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
index b721f64e6..766709af2 100644
--- a/doc/userguide/reference/dtrace_runtime_options.md
+++ b/doc/userguide/reference/dtrace_runtime_options.md
@@ -5,19 +5,19 @@ DTrace uses reasonable default values and flexible default policies for runtime
 
 Options that can be specified when running the `dtrace` utility can be categorized into three types:
 
--   [Compile-time Options](compiler_options.md#): affect the compilation process but might also affect runtime behavior.
+-   [Compile-time Options](compiler_options.md): affect the compilation process but might also affect runtime behavior.
 
--   [Runtime Options](runtime_options.md#): affect the runtime behavior of DTrace but which are often set at compile time.
+-   [Runtime Options](runtime_options.md): affect the runtime behavior of DTrace but which are often set at compile time.
 
--   [Dynamic Runtime Options](dynamic_runtime_options.md#): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
+-   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
 
 
--   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md#)**  
+-   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md)**  
 You can tune DTrace by setting or enabling a selection of runtime or compiler options. You can set options by either using the `-x` command line switch when running the `dtrace` command, or by specifying `pragma` lines in D programs. If an option takes a value, follow the option name with an equal sign \(`=`\) and the option value.
--   **[Compile-time Options](../reference/compiler_options.md#)**  
+-   **[Compile-time Options](../reference/compiler_options.md)**  
 Compile-time options can control how DTrace programs are compiled into eBPF code that's loaded into kernel space.
--   **[Runtime Options](../reference/runtime_options.md#)**  
+-   **[Runtime Options](../reference/runtime_options.md)**  
 Runtime options can control how the DTrace utility behaves.
--   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md#)**  
+-   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md)**  
 Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
 
-- 
2.47.3

