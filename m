Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC6015747C
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733667; cv=fail; b=syYIzq/I9xIpP67nuxXPr1PPoD9urOIll6RTwxnI8MLIOM11et6oxa0XZJCd51FKPxPMbVXhw0XmtZamM5p3Tt/K3KQBSHAAaXoafLGNUCP7RAVSzPlyJX4YaX6tqfq8M3RLdO1VNyCG4bnku69UFABqOcRcTYAPuOAdulps7l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733667; c=relaxed/simple;
	bh=Nb0SOt9oJ61R90vat0w0YDyDkhlOArn99QJ9cdqMq/Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hN2WuegotBsp6iYRd5n7RobfQ3YD+rxfkFqotHy8xBKN/SsS8uBpnN9UF2AtHb80klyluGWxxj7adS7+w/HJsrtRwL8vA2Yjgto1AYwcJ7xXwofaBkqMW6eoq53qi5PUFZHED+98A3K57Lf2Q5EDWGqEszPdHLbpiz4kkCq+4M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=etZztsJ3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NiKfHpCp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="etZztsJ3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NiKfHpCp"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNLDU025079
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=nOPWG1taA6GGZtsUMb
	Ji/PcpM3Y3XnArtGdAONpTtu4=; b=etZztsJ3+kcyyV0hbXXkyb3scO4j48dKue
	/Kx8G59NLN/U8HfNOccZ/oIIGijkc4mkKnsZ5Tp2EYnlglyiq9+EwQ0o2ic+pFgU
	X4N9QRANw8KZS9z2GAh43zQ9V3LgAxDlMM1rTx0z1L4ENWDwN7mLH8t77CU/TsYI
	LOtXgd2UpSWBe7UZ9FMkxZULU1Uvng3OAphcmJnGiC7SenQbS7X9zxGL95z5V3Z3
	71lfUkqmDK3c+x10Oq2ajoHORqsAMKbqu6S6yVb/fIazbw+J3GQ2qLsZjYRIjdod
	ZJ9cp06e3hOH8/e15SFu/mG+xPoSsETFOFlsWHGjnXGwE68kaGWQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0ecdyk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLABCH000719
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:42 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fd2efw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVwzvRoC5svbOhpC4i77+PhswYvjixmpOITimtFwYe4V8ViEuynQVBDG8zwz/f25c8/P2xrAuFMLBg6lupHFi4KRApNSoTf0Cbp0Fsz7ZreJMLLYlHUlQnvtyk8AA2fGxd6BgS/ZUSVi0G45XLgowof0OlXWtsOM2UptWm3Zw0eh0b/chgLyV534c6ij7r3Y8bGvpfXtr3KX+Xh3mcivL6zBq3YUskDddC+U37AJ5BA9isQlsvB1MMTfb3/Zkzi+UQfh82a7rt++VJPUTcfsi82kbL0noE0LJoYizOrtLyGmV7ansGOYmYmEA97/dW46kqFNn5FKS6K7QpO2TH8lBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOPWG1taA6GGZtsUMbJi/PcpM3Y3XnArtGdAONpTtu4=;
 b=fCO6jjUbKtYDE+T53um0H3NbrG4TS4IHlEqxwmJpLSp/megyydgaROElcH/aVCohpF8UsiyE5PNVfIVhwxbeIR4Nh5goEE/DBE52cqj3uSob7+3Zpezzp9o3iwuvdemkf56+Scw17hryS1xTbu4NKpf2X2b4MopDfAv6c4iY7wecX7DYMS8qTb33CDoO3ZYdu6iUKFMkZVJx+zz1unO4OcNo7EbD4xZYMCKxDZ6X5d0wdnFhx8HLAFhmPN8NT3OrQ+eIphgsKIMJu6IJ81NCpklMta71tsQwiZ0EvTJJl+1ZgETJXYieQYIeNGeMbO9MrZxkFdibOR2VsA5p0eB48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOPWG1taA6GGZtsUMbJi/PcpM3Y3XnArtGdAONpTtu4=;
 b=NiKfHpCpirPBg3C0midovr6xl5GjWoWOip/XiocaHzyNZFZwRn+GiSpHUjkZDu7BRvP7LA5vsdakaTXQ00KPqWhLdUULFDicv6pzWAaJjCxff9c2mLkbJCdVlWncFQUscJ7QQ9Tk7bKkzBG1NnSBCogrWaub6gBU8yfz3KH/31c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7167.namprd10.prod.outlook.com (2603:10b6:208:3f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 22:27:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:27:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] Add support for pid function "-" with absolute offset
Date: Fri, 20 Dec 2024 17:27:16 -0500
Message-Id: <20241220222716.18511-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222716.18511-1-eugene.loh@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae6dee0-768f-4aea-91a1-08dd2145810d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O5N1ML6FKxcATGGmnQkiQ1LNs2s8bA2RhpsxXQ/jDY7WMWe5DACiUm8jxpY/?=
 =?us-ascii?Q?M2hTs0RK/8cYGiNA9FAAd83G9+G/QgUBKw97nPujaD8qhHkE9x5akZMJe0nZ?=
 =?us-ascii?Q?iYKX22KnkLo+qhXyVKckBC3F4SaPW5+If+5HmaNAJsPLQhu8T9+YQxvuknUf?=
 =?us-ascii?Q?NPD9OJ1atfNe1YdiUyWuTQLz4xUbLhZOQPZGdSMLfii/8G/DcyscrU5hOMAZ?=
 =?us-ascii?Q?bDSCDG8PMR4Bu47VRJyFn9rdf+G7/IfiQMtlk1KHvOlHlTwCW0YHcdPIHqHs?=
 =?us-ascii?Q?oJ7EsZ/Xr7x/9uQ6xKdwPaA+fq9nmHMArYxKmWLZ+D5IywogZz+Ll6TxhStb?=
 =?us-ascii?Q?YN2UcXHVrAqmqjjwmU36/HH+IkRCWoo00BGFz9Me6Aw1H2XpEP0C/ka1Hw5G?=
 =?us-ascii?Q?yNc2/hG4bgSR6I9KIQXLRy/TAyoH5UmQqNNGqaO9AN5l7ylEPIZNhd13nIla?=
 =?us-ascii?Q?bEOOxEdRhsO1kkoE6HXiiWcGO4oMs4R6S/CmJkSlzJK7jucPp6G9JBnL4t2u?=
 =?us-ascii?Q?mo0pXSSVor0I9YMMZKjq/GQ5SNOiLXsxz9p0jb68NB4jo9B+PmqM1okDqfJr?=
 =?us-ascii?Q?NCKmCfWZXiVxX46N17zAq+7bEjM/i93M8fvaazsd3o+zqYCGnEWb9vRaBvnY?=
 =?us-ascii?Q?kzVi0N5manCHr/7hf3IuYJ+CvJG3NT0m5Ova1SbuDsHpmhXL+3Zt5UyET5+7?=
 =?us-ascii?Q?8jO4xzmBRuHrDbDrJ+y2ZWrbscUjyMdIoku/M7DUksfjECaAYk39qlxZK/r4?=
 =?us-ascii?Q?SpGpBHLYlNLLeRa0uvsWjhWV6OyZLk9MdEBEry8nk8DXqVDzcI+BwGyj+piU?=
 =?us-ascii?Q?jjGsttqGgi0J1M8SE3u2PPUfgKiXIFv/cxHiw2M3Tow0scGT0N8A4O3Qswgi?=
 =?us-ascii?Q?jcn495u0Vs6rhgnjt/w1H/9TxMSMp9CfZE14RJ+o+KvHkKe8RhV+4sGtIYqE?=
 =?us-ascii?Q?MWT7x6ySF8DjSmiyii8Ih7pWNXIVxPoR3/74ipHVC+v8ul72ta5t1wfQ4Nkr?=
 =?us-ascii?Q?bR1zJztH2LoGpthn6JwYypcoM/t5lEQGou36M97kt1VM0pgp1l2BMgZhgn+W?=
 =?us-ascii?Q?JyuttSSLJb7uRm4zgjrs4kIn+bapUAoLhAYH2yHr/G1oseOLEfqt6R0s+++c?=
 =?us-ascii?Q?iKdCLphkIdeNaVYPdOSawBZcOyVdYiMWhikxXjTxVuiqSQJTQa8QEBog9o+K?=
 =?us-ascii?Q?f6rRxKIzlymfsfJ/fyGDGtES9Fpami/fEShMH7/lQ/J4kkLhlCWitLJwpmzy?=
 =?us-ascii?Q?FMk+AOq4pPe4vHsq6K8T7zKBBt3fHjPl/EYyOADx5/CsFtoY+7xYIy4er1VA?=
 =?us-ascii?Q?NAifKwU1ogjmuRsR49WKtPUuD+68hY7QB3aP9jpqiawmifqCrEJ+TUpTbOqQ?=
 =?us-ascii?Q?rW3ub5s4rQU9BbSe5ZYqk6jbrB24?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xQ6EHGUS+j45dZr0BcH37NVdLjDXO8UnvxdCqFJPgc4bd0yc8vZla1RD2Qeb?=
 =?us-ascii?Q?V3YDK0izTQZoiyXtqIQet+KIcLhbxNDp41VyvGi2Lx1Owhm0p1iFTFR12Rrx?=
 =?us-ascii?Q?gFYhlk/uIsAlWFf6UuCnJ3HTWkfvU0SICdieUadwg3AFva3mfGC9CncMJrB6?=
 =?us-ascii?Q?mfN0oJWLpJsP+KrUFK1RK7Rk/nCSeMeP/mXUjQIXwMCjlN7w90WfGbiwtPX/?=
 =?us-ascii?Q?Oak29GDztQspZhhwCJ51i18tUsFEnHv3jgiPZrBmS787FaAbY3U2l/wrua4F?=
 =?us-ascii?Q?pvE78giXtg4AR0TbvB16odlLAK5OQG+PA6SwMoGczrhhWdk9wR4Xb8NTgx7M?=
 =?us-ascii?Q?7e8pgalpPQC0hL3JEW/1KFth5+YZBLBcGfwr1AUYBfTdXIL5YIeZ7B6eFAJZ?=
 =?us-ascii?Q?bAGxpoGUTRTRJJzFAF4pDN7/V04v5aBgn4IAy1ffAHvlcwyF0Q2TXSfzXdXE?=
 =?us-ascii?Q?zpI/q9+khJl0XAVgn1dVunFKs/aBocvZXaOqp87Ps3AaS7OJ9ke3H2rUxUZs?=
 =?us-ascii?Q?D1R7M3wv+flnIEd4KRB+9n1Z67B6R23BrCs9lzFILUSnnID83umtLDU+Aohr?=
 =?us-ascii?Q?7DGtBU+73Y7ni75gk/JsEc4p5ETG8tz4Jf7yGXS3I8+ghGfa3cMqrj0MQZfa?=
 =?us-ascii?Q?T4a1bE0/+hE7B7CpnsCEJnDEI2CPFSB/FzNQtO7sWuXnwAmMNzwC9mCQ+sTt?=
 =?us-ascii?Q?Q8L2DH9M3TAa4CAsiux5UTnCYQXQzPilTcy5YClqnK+HkSYeLpHzSmDlSCnx?=
 =?us-ascii?Q?OUQcMVMK5w2aNtva18Wh8GLOSQVEObI77oZS2EPnps544WNmVRBAW1WByzQr?=
 =?us-ascii?Q?jvtaWonwitd9z7bOy/6PXrBvrA0XzWMaUOPA8W6DGEnANVvFleXDt45n0GsJ?=
 =?us-ascii?Q?zc03uZBRuPmOKxh2dBtbxBMk7/Q+mOjK3/PeGh0QeNLXvvnMJBRTI6x1rd9b?=
 =?us-ascii?Q?NW+0cqeKEGncQCkzdmr5CXKvKvbCgujDHdDBvo7h3gUZ8XbxJ6BwddwxwwwY?=
 =?us-ascii?Q?sPVW9Ac058l6/AIQu6UjfU4UVx0SOVlt3eP/IjJTPIA0tmNb5iG4E+rOo6pb?=
 =?us-ascii?Q?UWMPq8aT58RD80nJR95ZPjnw4itE1dWf8q/9NOxfs1VwpsuwDzgOgjg15CPA?=
 =?us-ascii?Q?tJXilZBnH4BGTmVezAy08Yb5USMzRGhUcWfPOO1DSPOwQtAmLrfEujjaqbtW?=
 =?us-ascii?Q?8IPDZh0WaP041H3m//qe75BWb/9Qghg1ck+/LDnVJhTejRvk94lGSb+4RamK?=
 =?us-ascii?Q?SghJ4/+IzF1e4j0Uirfspz/MV8dzcx5ElQt0PdG7cucYu+GbT2txufbe9KU0?=
 =?us-ascii?Q?jE34fi/iHhlAWew+RY5rEifAUtixdY6B7kWUun1RlesGFM58FWMfsEG96EiB?=
 =?us-ascii?Q?lmDMkHQpV8/o7t9mzDwHPBzv2cYfALjshazSnx6k3+6rVbn5vPqGt7cZqWI2?=
 =?us-ascii?Q?L+zxeGEpBaifEYWtW/rxPXpFU9WPFHpu50BrPApytPVgoGGGXz2uNJnJMX3N?=
 =?us-ascii?Q?oBVWObYh8WhLOKjfq4si9De3rsYKlu/sVGsRCBpGOujXRT90+ZJTmJf3JFOh?=
 =?us-ascii?Q?bjAx3LzkEsbOTuS0IRNGLr658OVCC1N5SGMLNNOy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FN/s3lqVxi6ueGbym7YDt0aCCswTXU9SSzl0rThNluYuUaNlzXjDvAzIJtWPF2vuIoQ2eipRdUBZ133HHx6QLPKv79pyOZ6A16a+Ovu6Dw5KSE+oNctnDUlvSjV9tO0nNsnPjVcPq3TKxm/ImmKYFNnKd8hegXbstq6F4S4ImRvjVtybkA7hEi+neWddD5pqmpxbjpUIy6Cgu+RJqfm9vw8/Xx2S3KVo9tO/AlzaDgq6LcSXLeML8Y03+deA41b/IKGBXBEPrkrIB3lEVWcmJSUY/86xou4duZABABgLeNqw4kisomFgs+6ZUW7414P9ehFQC45b6vnZjxW9CA+Fz+Vq1o7xdIcYHsmcn1zScAddzD9J38JZoMiJpKmZN1X0w/15cNUhuXRtCS6fmQ80PDC3s4OgdinFxGczSHZS3RTuBt8PWmY3MW6C7tBkLrInR+YQPD41H/RBRB/pJcMdiSwYsHFqN5i5ZvBHZkYAQlYSXNDhhao78dsWclPIHDEFHSHcHXJySEFS64dwH7zv5jfkH/sTUg3HJjrM6hVr5C+3+36OhvAQy2NHMTFnz01VpjpEwsDfYt86jlm5lh+v2ZmuNSfZzbSmXEzDUL4jOOo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae6dee0-768f-4aea-91a1-08dd2145810d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:27:35.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FidV23zoC3/JajMOU6SNDW/JdUkcOkrFIkxCW+SPXPc92JflcNS1HZYO00JcatqjQkcak4D1Mti824Vk8Hl+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: kdNHqtoNSKbERDD9cqjg1hD37qJzKyrD
X-Proofpoint-ORIG-GUID: kdNHqtoNSKbERDD9cqjg1hD37qJzKyrD

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/pid.h                |   1 +
 libdtrace/dt_pid.c                  |  75 +++++++++++++-----
 libdtrace/dt_prov_uprobe.c          |   2 +-
 test/unittest/pid/tst.dash.r        |   1 +
 test/unittest/pid/tst.dash.sh       | 118 ++++++++++++++++++++++++++++
 test/unittest/usdt/tst.pidprobes.sh |  18 ++++-
 6 files changed, 192 insertions(+), 23 deletions(-)
 create mode 100644 test/unittest/pid/tst.dash.r
 create mode 100755 test/unittest/pid/tst.dash.sh

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index c53e60047..ad0aad9d8 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -47,6 +47,7 @@ typedef struct pid_probespec {
 	/*
 	 * Fields below this point do not apply to underlying probes.
 	 */
+	int pps_absoff;				/* use "-" for overlying probe function */
 	pid_t pps_pid;				/* task PID */
 	uint64_t pps_nameoff;			/* offset to use for name */
 } pid_probespec_t;
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index b8bbb0396..dae499422 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -155,7 +155,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	uint_t nmatches = 0;
 	ulong_t sz;
 	int glob, rc = 0;
-	int isdash = strcmp("-", func) == 0;
 	pid_t pid;
 
 	/*
@@ -182,8 +181,50 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	psp->pps_fun = (char *) func;
 	psp->pps_nameoff = 0;
 	psp->pps_off = symp->st_value - pp->dpp_vaddr;
+	psp->pps_absoff = 0;
 
-	if (!isdash && gmatch("return", pp->dpp_name)) {
+	/*
+	 * The special function "-" means the probe name is an absolute
+	 * virtual address.
+	 */
+	if (strcmp("-", func) == 0) {
+		char *end;
+		GElf_Sym sym;
+
+		off = strtoull(pp->dpp_name, &end, 16);
+		if (*end != '\0') {
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+					  "'%s' is an invalid probe name",
+					  pp->dpp_name);
+			goto out;
+		}
+
+		psp->pps_absoff = 1;
+		psp->pps_nameoff = off;
+
+		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
+			if (psp->pps_fun != func && psp->pps_fun != NULL)
+				free(psp->pps_fun);
+			goto out;
+		}
+
+		psp->pps_prb = (char*)pp->dpp_name;  // make sure dt_prov_uprobe uses it
+		psp->pps_off = off - sym.st_value;   // make sure dt_prov_uprobe uses it // dump this
+		psp->pps_off = off - pp->dpp_vaddr;  // make sure dt_prov_uprobe uses it
+
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_OFFSETS) < 0)
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
+			    "failed to create probes at '%s+0x%llx': %s",
+			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
+		else
+			pp->dpp_nmatches++;
+		free(psp->pps_fun);
+		goto out;
+	}
+
+	if (gmatch("return", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -195,7 +236,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		nmatches++;
 	}
 
-	if (!isdash && gmatch("entry", pp->dpp_name)) {
+	if (gmatch("entry", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -240,7 +281,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		}
 
 		nmatches++;
-	} else if (glob && !isdash) {
+	} else if (glob) {
 #if defined(__amd64)
 		/*
 		 * We need to step through the instructions to find their
@@ -449,31 +490,26 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	else
 		pp->dpp_obj++;
 
+	/*
+	 * If it is the special function "-", cut to dt_pid_per_sym() now.
+	 */
+	if (strcmp("-", pp->dpp_func) == 0)
+		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
+
 	/*
 	 * If pp->dpp_func contains any globbing meta-characters, we need
 	 * to iterate over the symbol table and compare each function name
 	 * against the pattern.
 	 */
 	if (!strisglob(pp->dpp_func)) {
-		/*
-		 * If we fail to lookup the symbol, try interpreting the
-		 * function as the special "-" function that indicates that the
-		 * probe name should be interpreted as a absolute virtual
-		 * address. If that fails and we were matching a specific
+		/* If we are matching a specific
 		 * function in a specific module, report the error, otherwise
 		 * just fail silently in the hopes that some other object will
 		 * contain the desired symbol.
 		 */
 		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
 					pp->dpp_func, &sym, NULL) != 0) {
-			if (strcmp("-", pp->dpp_func) == 0) {
-				sym.st_name = 0;
-				sym.st_info =
-				    GELF_ST_INFO(STB_LOCAL, STT_FUNC);
-				sym.st_other = 0;
-				sym.st_value = 0;
-				sym.st_size = Pelf64(pp->dpp_pr) ? -1ULL : -1U;
-			} else if (!strisglob(pp->dpp_mod)) {
+			if (!strisglob(pp->dpp_mod)) {
 				return dt_pid_error(
 					dtp, pcb, dpr, D_PROC_FUNC,
 					"failed to lookup '%s' in module '%s'",
@@ -647,9 +683,10 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	if (strcmp(pp.dpp_func, "-") == 0) {
 		const prmap_t *aout, *pmp;
 
-		if (pdp->mod[0] == '\0') {
-			pp.dpp_mod = pdp->mod;
+		if (strcmp(pp.dpp_mod, "*") == 0) {
+			/* Tolerate two glob cases:  "" and "*". */
 			pdp->mod = "a.out";
+			pp.dpp_mod = pdp->mod;
 		} else if (strisglob(pp.dpp_mod) ||
 		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
 		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index acf1c914f..ae4b262ac 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -735,7 +735,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prv;
 	pd.mod = psp->pps_mod;
-	pd.fun = psp->pps_fun;
+	pd.fun = psp->pps_absoff ? "-" : psp->pps_fun;
 	pd.prb = prb;
 
 	/* Get (or create) the provider for the PID of the probe. */
diff --git a/test/unittest/pid/tst.dash.r b/test/unittest/pid/tst.dash.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/pid/tst.dash.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
new file mode 100755
index 000000000..996b79f4f
--- /dev/null
+++ b/test/unittest/pid/tst.dash.sh
@@ -0,0 +1,118 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+DIRNAME=$tmpdir/pid-dash.$$.$RANDOM
+mkdir $DIRNAME
+cd $DIRNAME
+
+# Make trigger program.
+
+cat << EOF > main.c
+int foo0(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int foo1(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int foo2(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int main(int c, char **v) {
+    int i = 0;
+
+    i = foo0(i) ^ i;
+    i = foo1(i) ^ i;
+    i = foo2(i) ^ i;
+
+    return i;
+}
+EOF
+
+gcc main.c
+if [ $? -ne 0 ]; then
+	echo ERROR compile
+	exit 1
+fi
+
+# Loop over functions in the program.
+
+for func in foo0 foo1 foo2 main; do
+	# For each function, get the absolute and relative
+	# (to the function) address of some instruction in
+	# the function.
+	read ABS REL <<< `objdump -d a.out | awk '
+	  # Look for the function.
+	  /^[0-9a-f]* <'$func'>:$/ {
+
+	  # Get the first instruction and note the base address of the function.
+	  getline; sub(":", ""); base = strtonum("0x"$1);
+
+	  # Get the next instruction.
+	  getline;
+
+	  # Get the next instruction.  Note its PC.
+	  getline; sub(":", ""); pc = strtonum("0x"$1);
+
+	  # Print the address, both absolute and relative.
+	  printf("%x %x\n", pc, pc - base);
+	  exit(0);
+	  }'`
+
+	# Write the expected output to the compare file.
+	echo got $ABS $func:$REL >> dtrace.exp
+	echo got $ABS "-":$ABS   >> dtrace.exp
+
+	# Write the actual dtrace output to the output file.
+	# Specify the pid probe with both relative and absolute
+	# forms.
+	for probe in $func:$REL "-:$ABS"; do
+		$dtrace -c ./a.out -o dtrace.out -qn '
+		    pid$target:a.out:'$probe'
+		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
+							  probename); }'
+		if [ $? -ne 0 ]; then
+			echo ERROR: dtrace
+			cat dtrace.out
+			exit 1
+		fi
+	done
+done
+
+# Check results.
+
+if ! diff -q dtrace.exp dtrace.out; then
+	echo ERROR: 
+	echo "==== expected"
+	cat dtrace.exp
+	echo "==== actual"
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 54444d49b..e3e4e2043 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -121,7 +121,13 @@ fi
 pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
 pc0=`echo $pcs | awk '{print $1}'`
 
-# Run dtrace.
+# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
+
+for pc in $pcs; do
+	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
+done
+
+# Construct D script:  add a glob for all pid and USDT pyramid probes in foo.
 
 cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
@@ -130,6 +136,8 @@ p*d$target::foo:
 }
 EOF
 
+# Construct D script:  add a glob for all USDT pyramid probes, dumping args.
+
 if [[ -n $usdt ]]; then
 	echo 'pyramid$target::foo: {' >> pidprobes.d
 
@@ -141,6 +149,8 @@ if [[ -n $usdt ]]; then
 	echo '}' >> pidprobes.d
 fi
 
+# Run dtrace.
+
 $dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
@@ -286,14 +296,16 @@ fi
 # - a blank line
 # - pid entry
 # - pid return
-# - pid offset
+# - pid offset (relative -- that is, pid$pid:main:foo:$reloff)
+# - pid offset (absolute -- that is, pid$pid:main:-:$absoff)
 # - two USDT probes (ignore is-enabled probes)
 
 echo > dtrace.out.expected
-printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
+printf "$pid pid$pid:main:foo:entry %x\n" $pc0   >> dtrace.out.expected
 echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
 for pc in $pcs; do
 	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
+	printf "$pid pid$pid:main:-:%x %x\n"      $pc          $pc >> dtrace.out.expected
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
-- 
2.43.5

