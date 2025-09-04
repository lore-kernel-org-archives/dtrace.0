Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72A1F2C34
	for <dtrace@lists.linux.dev>; Thu,  4 Sep 2025 19:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012558; cv=fail; b=V8+D4V+SFhGu4UMwKI5ZYGeS0cu8pfxIO5a1oGRbJ7lU9nWfNzfpoyr6MfIUnz/Ao1Noc+NMNf5c16BVx6I4dq4mpbYVbwUO90EDu5ZubfeSMzcFonNwWkamretBcHetvfsBoLb8XFFPsvoOovOSbWpxjoVoFxZ3LMKvbZi9xm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012558; c=relaxed/simple;
	bh=m+4doDxE1+ZCUTydn+W/UFwd9hSReJlfvurpC5/8k4c=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z7w94zzTiLALaJm2RdmNvU1dmhGg5iGI+x8kJTXepHqEwxMY16dAPIf6LuKBV4ZHJvVzR0xp7e90x5ra1YUtch5zfA/s433qcrbe0RkOTNc1vHDsKu95JMFgX5hMlXpSCHU6pbaJDtuqz1sxHO5ZEVagpD4qj2Yr3C05JUuh2WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a485uiSJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kVyPUMtB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a485uiSJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kVyPUMtB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJdOc004869
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 19:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Rlc+NwhMg3r26FE5UUWxdwF022BOLC5oXeKywVDvJTY=; b=
	a485uiSJhc3SRjDYyRdrDIHAs67GToCLj5mRYjeCaNDWus1xP60DfN+5pRCQH1wv
	JihaJvVydirjocbuyRrjxCRh68/qXYy1uvU3RBGZ4cjyk/tBByFMCNwFbP9JK5zo
	E0e8BdyFWdzHI92l5tKJ65MaoxltWMWW6nBc7CTroCXrVITANBHNXBWjjl1Tpr+g
	5jitA8tdeKIoqEotm3XQvigW43kg80VhXcKz81K4hn4CGEySUMNz8wAQxlR9nN6P
	YmmKS8wdDRCe4XHvUoMIOTMQoLLLkBsdRSTDBl0ZDLyOLrXZVhrjzIE0bbCRoIjy
	IT2AgYka41ps8Bx4bi1bAg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yfxrr34k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Sep 2025 19:02:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 584I2u3V015802
	for <dtrace@lists.linux.dev>; Thu, 4 Sep 2025 19:02:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48v01r6mxd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 04 Sep 2025 19:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpQPTWdZX+YO1WDFyvR8P5q4eaKLxiZAx+hl2jtYBHeSPNZb1FTyASY13khLZbAwfu7B7VteTRX5X4WGsFE7ZmFGa1MDSrY1VecRc4aoy5+Pv3t97BQ1Dw2TaPXp0g6BR1MzL2w+8y6YLj/sl9naaNfHc9ojvulOZo6bTo5Xzhp0V3r2CXtCRD0j+5d1MPtDlU/MerzNHwM27uKB3baTl2lWFwdHPBfuR4LvvP8C+EstKUJyoYZaMOSaw7m4GFVH7k/R18CzfR+cyxiizM1rZ0hKkeslv3cASgsEbCB3W9IKbMbRi2aTDfce4cDGyPG6Qc2Q54E9bxduOZFXM5sqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rlc+NwhMg3r26FE5UUWxdwF022BOLC5oXeKywVDvJTY=;
 b=aoFC+mQ86J+rV0UNTkQ8wHWfeHsbchTVDJZ762vyziGNvAuu00ukH8W5MEkzqhNoV2uMKol1+Nfe92sBsV8rvbLTp2tQW+DpDbS0hgx306cAG4WIYBREEoz7QmOeUMohyorKUuGhnJ0XMxSDjGAqmzOQ05rwYQx/hW7VJowGu3MVHKdJa1+2OvBXpEvab2qLrIOu8L49Rl4FKkFScY4l4DdM6hWcU+aWoZIhW91IRZo9q17jac0/KkUVTXfdwkcRkIysgBZcHv6FEnv4a7cSqjvfEtR57ttaxEqcNR9kaywp6FMGA9+vnsIH2pAuMedeAzsmwMUYOdsgTUj59CKhLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rlc+NwhMg3r26FE5UUWxdwF022BOLC5oXeKywVDvJTY=;
 b=kVyPUMtBl2yXJww7XTeOBgss8C+kQDVZGUZpFA2kDaOOsabmcs2l0D6bJDKibvdv+GR2C/fQXpURreGWr824LIg37NVZAxj9iw1oHF7qCdVaDAHvq+bzWTYkTRIhSpdOCJ4V89ltDEPvPNXPnnBti2ijz14qZoQMkDAOptqkY7U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 19:02:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 19:02:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Allow probes not to attach if they were not "needed"
Date: Thu,  4 Sep 2025 15:02:26 -0400
Message-Id: <20250904190226.31242-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF000132EF.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ed087b-6fd6-4d07-a596-08ddebe597ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OaGh0xSHBvXCrxKK15pTPaScC9dM8LVAo5romBF7Q/FBVjpPgN2mmnwh/ALx?=
 =?us-ascii?Q?nfouJofw/KpIaLr8pLVpUtVZ/PBNJS/2XRIBdxVaBKUysmxbDi45NLh5k9oS?=
 =?us-ascii?Q?ZQNFldWe9fVl5I9vOJVpaqMlcfBXSAQ26N/N/Ystz3JMXhDVvGx9J9sE5MXk?=
 =?us-ascii?Q?1gdNk5Cp0ctJb79qBNtnsk4ZUrZ1IQi1GadytfMDqRrouzTTkwgxpfWIbWhb?=
 =?us-ascii?Q?78a45X/n8rBUSD/g5N+NWzd2Pd/lFIhMpjy65ASprVtPLBVvtoWrYeEToYVd?=
 =?us-ascii?Q?mZV9Be/ttfnNSgElH/DGf9mVEq2Qnp1zJbv86AkbBlo++T2DU3wF3cLf6NV9?=
 =?us-ascii?Q?zPyUrTJSUsMPHORokptR1jc+0pQoiUmkR8yTDGTk3lUeqAEkf1B8S2NTLm9h?=
 =?us-ascii?Q?jpBV8fMG2CaFnBI4xGuTUvx9R3HvjeslNeQfeksosSwP1mX3DCTiSCA9RHZx?=
 =?us-ascii?Q?cZDtGHD4P3nJzwZQWksjnvNpxx6mVd+HIVPrcxrLh+ryzQjkPGii5ASEt0h0?=
 =?us-ascii?Q?l4Xw58OAZ5qj84G632q+KHQdagBk1R79slIjQUY1HJOXszaf25SKJSzr6m05?=
 =?us-ascii?Q?CF8dLCA2Qk3vhHQ38dsA0yh/azoE8OAUsMqAf47haiXQpWi1opFWAmWVwvmJ?=
 =?us-ascii?Q?DHJCZwIAbNzTPwlxNwjj5EAxVvwdpr/flWmoR5SDPTrK0i6hWQsim3DNvKlm?=
 =?us-ascii?Q?q72Bji15KQvIfYz+/bl++6ShYyYSihu89zvAHjIIyQN9GMq+lly3ZFLozXUc?=
 =?us-ascii?Q?rnG2W7rHa2ORJNbXKL5+MLRnfV4X1i299LYmGg5hj05w05RglNWbJFG8l9o5?=
 =?us-ascii?Q?zmQtMcJCcC9YB/7gnKOpj9nn8A45vnHocJbDtVnEdJ0tJDIoZ03rsfOv2J4j?=
 =?us-ascii?Q?YErku8Mnphqhe7jdMTV/qmwtR91DxhiTYwTv1vuRaZVroFVtBTalyy0MArBI?=
 =?us-ascii?Q?47vLH7jgS/s8E8yKug+Y7ZsAGFdgrQb/EJbe/k+3Pgxa6A20BZup4IZbbhEe?=
 =?us-ascii?Q?6ubqapcz5a/bSjVZz7QxPFerZZrI6XYM9ONxh4CWKD1Qb6NaHPZ4Y7/n22SU?=
 =?us-ascii?Q?KGQS7uhzJHSo7nSmNDyoY8yP3HTEFWBkaFRHVsmB5LdDCiUEuMQx8rZFcoIV?=
 =?us-ascii?Q?/xPwmIWCeGDPjsR9RN+hvFMsYnIEFEH1u2O9XEVd8RXFlkKFbQ/JDED+xbsf?=
 =?us-ascii?Q?dUgQWfVUS6L9NJZopa+nbe86KGYI9QFHSDNZBytnITcP5WXNKBlyQhUltu4W?=
 =?us-ascii?Q?6DikXd6wZzNbZY+a10y23itS0YNXDoLCoAr5ELlqUSF7OmQKVphTA6N8dB6F?=
 =?us-ascii?Q?IYSvflflNUoDRSAohHgC4Sf0EV1LiW8CM7KKX4N/JWmoM6r8O84WoyS5AAD9?=
 =?us-ascii?Q?nOoy/AI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?745Z+NJt6/0qJX6U/NKLPvblvy3ZAaO1EQsTJIHAz/iv62PS5Sv5fY0bWwpN?=
 =?us-ascii?Q?PUdDQ6kiuE/SKdSDiiG92VADsVp66H8opJhz68APaeNh4hXQ0SVCY36+hTRH?=
 =?us-ascii?Q?g4GaD8dmJlxdBbVd2EOQk9K5BUhdTqbNXn/0GnxhGcpPD4kDzNeqWikyv6Kz?=
 =?us-ascii?Q?Lhw6JPQQMU4AmImujnUDls1TbZvBVYmNy/XIwx41WurppQtDzW8r/6+M1sBJ?=
 =?us-ascii?Q?rZKEj/9q7b3c/j4sUsBBVGHV7d02iYTGqiRwT3C4JHsWcFWZ0bMZyo6hlEU4?=
 =?us-ascii?Q?3fLgyfhALDvG/TNg7W4Vnrgh29F+EiFTOo2MM6V2oH6FjNYK0eqtasFubQZu?=
 =?us-ascii?Q?Xt+UMKWlh/B7g/VrkK1RobAvXROWL0XFLZ9Tcu/gV3E96e7Pc2bwmKjW8gPJ?=
 =?us-ascii?Q?azm3CysH6+ySUrKL9o9Rcz6N7CAh8+rZ9e9OPRNzT9YzSSpY4uT8dDW6Bp7r?=
 =?us-ascii?Q?G7W30l7xORsAi6Nudn/+k1of7iETfC4j73QqWBCq3Ge95NknCQctxRMQQsT+?=
 =?us-ascii?Q?wOH8idgxIwWvUNoJZ3WB9NFuTX0u+LOIC4zuCkseOlZmyLg5puXx2pDs4YIX?=
 =?us-ascii?Q?l1PXCGMvNX2LZueGeXPeHLoESnXnI0pZ1PvluhydaqRMxEMkOKhg7J273cC/?=
 =?us-ascii?Q?1WWn1MICMwURZ/xnmL+yeTKIhj+MTVeHq06NZ22xY7V8Xh1Ql3LhPik1xJH6?=
 =?us-ascii?Q?04pp+2UFi3q9anZPCDmsLWlS3T5VthpIu1sFksDzUeoKtKw/u5yyqXe3gh9C?=
 =?us-ascii?Q?s73c/2uP0Wl1wT2B1zyEynMs9xa4DnYFKP4vuS8Snb37LGmC3v3LJN+2Z/oA?=
 =?us-ascii?Q?UVuKSYWfXf1CxvgmQ28zhhFJg5up4B6Yk/nBzRzqJv60lIuNS4oD67OiOvl9?=
 =?us-ascii?Q?DYz6yqqErsdnN11AQnoyAlRtqnc+Imis1if81O1kqdCWv60KyoOxtkWoRgO/?=
 =?us-ascii?Q?TsdLrogthdiJbULYjTuXi5owDiNQEWEBuXslrgaUByctip7c+6dzZTSBcj0p?=
 =?us-ascii?Q?t07HLQaQWqXqNRjQPcefhZ05RWptSKk0huqTUHg9HA5MnFsk7hcWdzIje4eG?=
 =?us-ascii?Q?CCzJGEJJXD/V9+5IQIQ0k7Ug2b8is2q4D6FVPbCvLa43sH29OSIY2WfvDDBA?=
 =?us-ascii?Q?EhTjQuWtuyR8+S8qa9CzzZw0x6lrk5F4sXsacvsdGEQvvkYiInhkNbwgspEo?=
 =?us-ascii?Q?RyZjmRj1J/h53JtN9IxFAnwXVBi9DBLC/I4vc0AcBR1b6ri/dcDGOHgZWsMR?=
 =?us-ascii?Q?PHadsUxmioBg8C1hYuwTJQ3xcIC9XPwVIXLF5512LagzzD67HQHHymUN6Wg+?=
 =?us-ascii?Q?wRdsqGiX2f0B2zxUqKkEv8ziMjqBiUaoqkKhiKFle+MsfuwSM/hk38mMbv46?=
 =?us-ascii?Q?PqKwGy2sauZuKEsoS/SqFQ9TVKz++6oCZh+9+IorNW/qe9IWJb6OgEjS+xub?=
 =?us-ascii?Q?S/vmnItYuMCYxr4JhfJLMqOA85iMVXQB8Anz8dFobw/5wxhxl8luQTflygHK?=
 =?us-ascii?Q?nxWMxqm3KP02pKtoJpotOLUw3V8CIEmaMoeb/rrJzNIug6AtBsqecSkPLvEw?=
 =?us-ascii?Q?LEkEG6VslePNCkA1nctG3cSjYVfbcxWEph9wBzCx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t0FJ7yATn0Bdbx/9uucAhqB9+nfQXVGA27XpfFBNXjBgiYXLhaEO2K0v5PgmtpVCGedw8qW/E57Zelx2FTDdx+9F4JsaAGtMUNfu4AZKXRdykYfrjb2xsYei224pRsFAqU54RqWC//D6ohcMHLWMpZknDyyxgT/+ppHAvw0kjgwRz90wCWFpRlDhx+dxX2MqCocyKwis1w4kGNHSWNEOoI+YD8OrWz6vVbnDNzLUMBaYGCFZvvgeieGmJNO3YIeV1IIWeYOjiXaX2Q2Tnh78IrrLXHWPKepniiOgfVmNeCIYLu1+2g/eg2/l1xTXthASgSfxEHnydYlwioh+xC38nW3O0h/ZkP7K7mEKgsu6/uWn7MiR2y1cW2dGWXp0e78n27ZPMo8kImf1mczN4wVG6FL+BJ9mlacTQYhFegohp2iJIulW4lOFqhGW85i1mGjCkgbh2GZPlm91Kd4GWDi2vWcdSoJOEKKpEPHwLBSmZ/opIodTxM7e2mz9jgu8Ql1wLpeGOwwI0viiKQcUiv9unlM/n/WDMvIt5ZodZtIiRGrUIOdip9EE0cfb0Y1JmO8MASlBbwCwrVMTQ0c0YqJK1ZTt/UGCUbrgx6gB+CGFGvo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ed087b-6fd6-4d07-a596-08ddebe597ae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:02:28.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZq5OTJdt1ysaCjh3ootP54xLtqAX4FDJ/CUJyJ8O6O4w+KvGc3dYXOOcC/KNzpeOVTYG6th56vZcrRsFxVx/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040187
X-Proofpoint-GUID: g2j8h2fIMneESYxqpsctgl6N72UhR9lD
X-Authority-Analysis: v=2.4 cv=OO8n3TaB c=1 sm=1 tr=0 ts=68b9e24b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=mJyVdKuwy1mpQMmB:21 a=xqWC_Br6kY4A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=RhFX5oSkz7eY8FRtJKgA:9
X-Proofpoint-ORIG-GUID: g2j8h2fIMneESYxqpsctgl6N72UhR9lD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE4MSBTYWx0ZWRfX3q/WzfZqUL91
 Sqr1xNOz2Jg2D0VtLLnzQujwBnkJG3Ss5CplyIGDmM5UMx1oHD01IDHiQVeDdaiYQEieI9dWFSG
 NeUdKFeJRoXVGcgo/eMuT/MzBkioPzugT5HJNxQv+IIvXdUSgFVK5WVazwcu2JGXWvYqdqrpDg9
 jhbEV+/6eYHbOla4KOvoLaCbGCk7uVXzfeViIsaLSAzGtqVdQnTIKIqOZwBQdXbWLZsPhMvrJiW
 znkM4uIG1tWQt/qj4f4ejwR31f+iSknFAFBXhCo8PrhucRKpALHVpp9KulgmhRYF93wJlYRRjpD
 vnBqK1oi625N5XcFi07HlDgPPOjVd6rVDX4JcqDwIrzOP9QQPsUIRpyjHUGJoTK+2CeLAelEoHi
 D7zI+YIL

From: Eugene Loh <eugene.loh@oracle.com>

Various kernels prevent the placement of uprobes on particular
instructions -- e.g., on x86 on hlt or multi-byte nops, or on aarch64 on
autiasp.  This means, for example, that one cannot place a pid probe on
every possible instruction.  If a user explicitly places a probe on a
forbidden instruction, an error message indicates there is a problem.

On the other hand, if the user specifies a wildcard in a pid probe
description, we should skip instructions where no uprobe can be placed.

The problem is that we do not find out an instruction is problematic
until we try to attach, which is long after probe descriptions have been
processed.  And when we walk probe descriptions, we do not have
information about which kernels and instructions are problematic.

The motivating problem pertains to pid probes, but we would like
a provider-agnostic solution.

Introduce a "NEEDED" probe flag.  Set the flag when a probe is explicitly
needed (say, it was specifically named).  We use two such flags:

* In dt_probe.h, DT_PROBE_FLAG_NEEDED is used for the "flags"
  member of dt_probe_t.

* For pid-style probes (including USDT and stapsdt), in
  include/dtrace/pid.h, DT_PID_PSP_FLAG_NEEDED is used for
  the pps_flags member of pid_probespec_t.

Set the "NEEDED" flag for a probe in these situations:

* In dt_tp_probe_insert(), set the flag for each probe we insert.
  This covers the dtrace, fbt, rawtp, sdt, and syscall providers.

* In dt_sdt_populate(), set the flag for each probe we insert.
  This covers, e.g., the io, ip, lockstat, proc, sched, and tcp
  providers.

* For the cpc and profile providers, set the flag for probes created
  with the "provide" functions (explicitly requested by the user)
  but not with the "populate" functions (chosen by default by dtrace).

* For providers that will sit on underlying probes, set the NEEDED
  flag for pid_probespec_t.  Specifically,

  * In dt_pid_per_sym(), set the NEEDED flag to cover entry,
    return, and explicit offsets.  Unset the flag for glob offsets.
    In dt_pid_create_usdt_probes_proc() and dt_stapsdt_parse(),
    set the flag.

  * In dt_prov_uprobe(), pass the pid_probespec_t NEEDED flag
    to dt_probe_t, for both the overlying and underlying probe.

In dt_bpf.c, if the return code from the attach function indicates
failure, return a failure only if the probe was NEEDED.

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

A new test is added to check that a probe set explicitly on a
problematic instruction will still lead to an error.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/pid.h                   |  3 +++
 libdtrace/dt_bpf.c                     |  2 +-
 libdtrace/dt_pid.c                     | 10 ++++------
 libdtrace/dt_probe.h                   |  3 +++
 libdtrace/dt_prov_cpc.c                | 10 ++++++++--
 libdtrace/dt_prov_profile.c            | 10 ++++++++--
 libdtrace/dt_prov_uprobe.c             | 18 ++++++++++++++++++
 libdtrace/dt_provider_sdt.c            |  8 ++++++--
 libdtrace/dt_provider_tp.c             |  7 ++++++-
 test/unittest/pid/err.needed.aarch64.x |  3 +++
 test/unittest/pid/err.needed.sh        | 23 +++++++++++++++++++++++
 test/unittest/pid/err.needed.x86_64.x  |  6 ++++++
 test/unittest/pid/tst.entry_off0.sh    |  4 ++--
 13 files changed, 91 insertions(+), 16 deletions(-)
 create mode 100755 test/unittest/pid/err.needed.aarch64.x
 create mode 100755 test/unittest/pid/err.needed.sh
 create mode 100755 test/unittest/pid/err.needed.x86_64.x

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 8ddb1167e..7829e47c0 100644
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
 
+#define DT_PID_PSP_FLAG_NEEDED	1		/* probe is needed */
+
 #endif /* _DTRACE_PID_H */
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 31781ac9f..dc3d47f56 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1385,7 +1385,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		if (prp->prov->impl->attach)
 			rc = prp->prov->impl->attach(dtp, prp, fd);
 
-		if (rc < 0) {
+		if (rc < 0 && (prp->flags & DT_PROBE_FLAG_NEEDED)) {
 			close(fd);
 			dt_attach_error(dtp, rc,
 					prp->desc->prv, prp->desc->mod,
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 4af9141aa..6e7fba287 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -184,6 +184,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	psp->pps_fun = (char *) func;
 	psp->pps_nameoff = 0;
 	psp->pps_off = symp->st_value - pp->dpp_vaddr;
+	psp->pps_flags |= DT_PID_PSP_FLAG_NEEDED;
 
 	/*
 	 * The special function "-" means the probe name is an absolute
@@ -386,15 +387,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 #define disasm(x, y) 4
 #endif
 
+		psp->pps_flags &= ~DT_PID_PSP_FLAG_NEEDED;
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
@@ -1064,6 +1060,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			psp.pps_pid = dpr->dpr_pid;
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
+			psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
 
 			if (nargv) {
 				psp.pps_nargc = probe->probe.nargc;
@@ -1421,6 +1418,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		psp.pps_inum = pmp->pr_inum;
 		psp.pps_pid = dpr->dpr_pid;
 		psp.pps_nameoff = 0;
+		psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
 
 		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
 			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index 2a78cb9ca..ffd994844 100644
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
 
+#define DT_PROBE_FLAG_NEEDED	1	/* probe is needed */
+
 extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
 extern dt_probe_t *dt_probe_create(dtrace_hdl_t *, dt_ident_t *, int,
     dt_node_t *, uint_t, dt_node_t *, uint_t);
diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
index 57b11b135..9fb165cb6 100644
--- a/libdtrace/dt_prov_cpc.c
+++ b/libdtrace/dt_prov_cpc.c
@@ -347,6 +347,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 {
 	dt_provider_t *prv;
 	struct perf_event_attr attr;
+	dt_probe_t *prp;
 
 	prv = dt_provider_lookup(dtp, prvname);
 	if (!prv)
@@ -358,17 +359,22 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 		return 0;
 
 	/* return if we already have this probe */
-	if (dt_probe_lookup(dtp, pdp))
+	prp = dt_probe_lookup(dtp, pdp);
+	if (prp) {
+		prp->flags |= DT_PROBE_FLAG_NEEDED;
 		return 0;
+	}
 
 	/* check if the probe name can be decoded */
 	if (decode_probename(&attr, prv, pdp->prb) == -1)
 		return 0;
 
 	/* try to add this probe */
-	if (cpc_probe_insert(dtp, prv, pdp->prb) == NULL)
+	prp = cpc_probe_insert(dtp, prv, pdp->prb);
+	if (prp == NULL)
 		return 0;
 
+	prp->flags |= DT_PROBE_FLAG_NEEDED;
 	return 1;
 }
 
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index e1369ca9b..ec32ce83b 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -160,6 +160,7 @@ static uint64_t get_period(const char *name)
 static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 {
 	dt_provider_t	*prv;
+	dt_probe_t	*prp;
 	int		kind;
 	uint64_t	period;
 
@@ -176,8 +177,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 		return 0;
 
 	/* return if we already have this probe */
-	if (dt_probe_lookup(dtp, pdp))
+	prp = dt_probe_lookup(dtp, pdp);
+	if (prp) {
+		prp->flags |= DT_PROBE_FLAG_NEEDED;
 		return 0;
+	}
 
 	/* get the provider - should have been created in populate() */
 	prv = dt_provider_lookup(dtp, prvname);
@@ -189,9 +193,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 		return 0;
 
 	/* try to add this probe */
-	if (profile_probe_insert(dtp, prv, pdp->prb, kind, period) == NULL)
+	prp = profile_probe_insert(dtp, prv, pdp->prb, kind, period);
+	if (prp == NULL)
 		return 0;
 
+	prp->flags |= DT_PROBE_FLAG_NEEDED;
 	return 1;
 }
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 07b26f20f..2396522ce 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -960,6 +960,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	} else
 		upp = uprp->prv_data;
 
+	/*
+	 * Pass flag info from psp to uprp
+	 */
+	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
+		uprp->flags |= DT_PROBE_FLAG_NEEDED;
+
 	/*
 	 * Only one USDT probe can correspond to each underlying probe.
 	 */
@@ -1049,6 +1055,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	/* Look up the overlying probe. */
 	prp = dt_probe_lookup(dtp, &pd);
 	if (prp != NULL) {
+		/*
+		 * Pass flag info from psp to uprp
+		 */
+		if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
+			prp->flags |= DT_PROBE_FLAG_NEEDED;
+
 		/*
 		 * Probe already exists.  If it's already in the underlying
 		 * probe's probe list, there is nothing left to do.
@@ -1091,6 +1103,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 		return -1;
 	}
 
+	/*
+	 * Pass flag info from psp to uprp
+	 */
+	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
+		prp->flags |= DT_PROBE_FLAG_NEEDED;
+
 	/*
 	 * Add the overlying probe to the list of probes for the underlying probe.
 	 */
diff --git a/libdtrace/dt_provider_sdt.c b/libdtrace/dt_provider_sdt.c
index 962848485..f9a51fa25 100644
--- a/libdtrace/dt_provider_sdt.c
+++ b/libdtrace/dt_provider_sdt.c
@@ -48,10 +48,14 @@ dt_sdt_populate(dtrace_hdl_t *dtp, const char *prvname, const char *modname,
 	 * entries to identify the probe names.
 	 */
 	for (arg = &probe_args[0]; arg->name != NULL; arg++) {
+		dt_probe_t *prp;
+
 		if (arg->argno == 0 &&
-		    dt_probe_insert(dtp, prv, prvname, modname, "", arg->name,
-				    NULL))
+		    (prp = dt_probe_insert(dtp, prv, prvname, modname,
+					   "", arg->name, NULL))) {
+			prp->flags |= DT_PROBE_FLAG_NEEDED;
 			n++;
+		}
 	}
 
 	return n;
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 3d4ec1e03..4531a88a8 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -368,12 +368,17 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
 		   const char *mod, const char *fun, const char *prb)
 {
 	tp_probe_t	*tpp;
+	dt_probe_t	*prp;
 
 	tpp = dt_tp_alloc(dtp);
 	if (tpp == NULL)
 		return NULL;
 
-	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
+	prp = dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
+	if (prp)
+		prp->flags |= DT_PROBE_FLAG_NEEDED;
+
+	return prp;
 }
 
 /*
diff --git a/test/unittest/pid/err.needed.aarch64.x b/test/unittest/pid/err.needed.aarch64.x
new file mode 100755
index 000000000..bd5b41a36
--- /dev/null
+++ b/test/unittest/pid/err.needed.aarch64.x
@@ -0,0 +1,3 @@
+#!/bin/sh
+echo "skip on aarch64"
+exit 2
diff --git a/test/unittest/pid/err.needed.sh b/test/unittest/pid/err.needed.sh
new file mode 100755
index 000000000..d6b041b60
--- /dev/null
+++ b/test/unittest/pid/err.needed.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# We should not be able to trace on a hlt instruction.
+#
+# (When the probe is "needed" -- that is, explicitly requested by the user
+# -- we should incur an error.  Test tst.entry_off0.sh should be okay,
+# since dtrace will silently skip over such problematic instructions.)
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
diff --git a/test/unittest/pid/err.needed.x86_64.x b/test/unittest/pid/err.needed.x86_64.x
new file mode 100755
index 000000000..158336d98
--- /dev/null
+++ b/test/unittest/pid/err.needed.x86_64.x
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

