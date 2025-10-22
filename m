Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E429257828
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103410; cv=fail; b=cMvAK7YQQyaiE9VpKuDA5PHP5L5ARUkU0/p83wqrWOMS+jevu2eYoFPfgxRrgNbAI/cjGjYeSz/0AImdmjL8ZzFhaUNimwwpw2H/1Dt0NE+LtLGHXOVeDy8smP7PuAJ/+cptTubhSG5SAwjTU4l+KtqsZJXcYK6VAWypYFgVE2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103410; c=relaxed/simple;
	bh=+Zt/v3AeQdUb07X1RHFfdTNANhC1gos7NrSNivNWgkQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z0E69np/dUYCp6DSDCAT9Tq9iT15aBf/nhOhOOUrvvABZJ/55/fSvalX00ZAgtfW1Gf2WvRrxrAtSYDGYAOGS+GkgjBM1v/GcB2YLiqlkDjqZPMC0tEfTBrycIo1kPNy4kevETQlDe+jMU3l3JHqDEMFd+c9uPS6ywyEQE7XEds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cFURxlWz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bw7DAojm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cFURxlWz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bw7DAojm"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NRUw005591
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YCjUzDoMmoo8QU/POY
	16Nri+GTCEDcJznYX1ubjKlkA=; b=cFURxlWzSS/QXxEZj6nAlv5tCmEE6Keeve
	VDD2gH4fIZkIIqVAr58Y9icbHfET8k+LwxM2HWG7BRcyf5VBLyVCmMts7ZApavHj
	rYj/1KKXb0/ERB8f1Alb+6DPTISAT/iUCJEi5gmRBjIbxCi6naz6Ew8yXcfLzovZ
	T88h4ir2z/P8AXZHESb80Jff1Uh+punrqFrB46Zjz7sDhWho2b1EJosRxJ8Ia43i
	Iiwbpd7IYI4LW0wq3B0sfLuAdj0/Z62+5tPK1AZd7LDGOMONaEseGu25g1+ywrOQ
	K4RZ83IHqQjwv4jwnhHvs2iYV7G9MAFPZPht82oFJ4pP7ABU5rag==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2waxvp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBr025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:26 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOKWMo2ysYLZ4quFY/6YNI8H5HSMuqPEs8yZSEEDCuMqHXiGoc2VV67L4qJRFOPHTi6p0OvnQgdP46fcADMSyoGjvUvkckWyxTJuZz8iHgEOvyJGoJjSrfidSr8nlaZtdWsEN8r4R/zZ29/i1/nVmuQ0RFv15eQatH/iGWfvFjZo2BaQdWi0hoaOb53iT8zabI4FkMGNiQeAXrVLElUz8YiJcETAuxk09+Dkz543NVOB99HZkZv0+Zx2traaCloNvBVOGmRCcBdaqnRf5w0QIu9r914REQ2gc+yNZZ4wl3Ic7bdoYRWNYCiTDFbNJTpf5VPtwZomBAZB/eNSWX5GNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCjUzDoMmoo8QU/POY16Nri+GTCEDcJznYX1ubjKlkA=;
 b=b2pg0KfV9gwFGgvIzI7bi8obv19xPEGFLLhkHOeBPvWZQpP/UWOAXwKF2Vr0uH3/DqXWhZ4Bcu+6c6WCK6mCuCu5QE8hdLM2hC095MY8oYhWI0xIP9hwieWubQnXVFKB9omloQuPcIqVGnRptPrq6m1HQp2Qk8O3k5hZIsta43VKDXmaNH5WBESoVF5dAH2KkUhfNuwSx/5CoU4DlKPYWp2fQ7rI7RZVedFTWamvEGoPxiKu+n68AF925sO2pnIw/4qHVRyGe+JBh0BzDdXqA+8KfhXd1h7ENsxp8mQOzIDJzQDA/Lj8mSvaYp2nyr/iDgSIHjKnsTJrTq3gwOM3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCjUzDoMmoo8QU/POY16Nri+GTCEDcJznYX1ubjKlkA=;
 b=Bw7DAojm1qiIl93CAN3oZoWXV8i51Q/HTd5UmJs3KF8VRh8nURUGsUW6pkSpIUUCSxYEui0I5m/7fOt0sHdsdsIQeU5JnodKXbCNeglW5gpCa6wsMdj4mu67a6T+zMorXDrA09fsiye1qHl9shXxe4wqNejnvhK8GoHGPr9HXEo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:11 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 15/20] doc: Clean up profile unit table
Date: Tue, 21 Oct 2025 23:22:45 -0400
Message-Id: <20251022032251.2010-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e269ca-a2eb-4d10-05ff-08de111a5463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?To/AtgkYlrrrV6xeX5Pk8HVui8dPdDdf+mgtH869eFvH6yL8T7z45ySQJ2yo?=
 =?us-ascii?Q?0ftFTUkcVtaRjhD0ZsFwklsgdyvujOFd0khPYyV3k1an2xxdh1+cUd8p1PHo?=
 =?us-ascii?Q?oHN/SvYZ12ShHxjLqU1Q5/W128r5vG+698xA/LvECtsavF97BnBTE2LlmgHI?=
 =?us-ascii?Q?sj2IzO9vzN6sTGcFOUUvJGhmwtBHzjXyO3lhQXm6/gGR1AfNjlO4rZmMJarL?=
 =?us-ascii?Q?sBnl/KLHuYM0QiQHgAv/wkNLbEFZuL6coMz/CZ7h2X57fOrtVQfIBrYU6SMi?=
 =?us-ascii?Q?N2GNjlX54Qo12MSSenlJReMFcuPzGitzdySKULc3bFqgh9PmxAAWOQHWsrH0?=
 =?us-ascii?Q?JBgfquCcotBWqrYbdVu7rOBMYFoEqHWzi9c/CS0tVddCmDQen54jFvd+bnB9?=
 =?us-ascii?Q?9gefUAspbiXtWeoe2I8iFoPipA+SVuYTSgfBvJ/ic2WIKmrqoFe+2YInzR92?=
 =?us-ascii?Q?OxQ84QfiP/kHrFj3jAzyLCGw1HBuwC1FByr+Svaxe7Qo6/kRBBWj8qFtMp8W?=
 =?us-ascii?Q?nxzx7YTuw3f5iNu44XtqKF45jl3O9+ClfWzwtY7uF9A/M7Lu4wku4RgZrUsG?=
 =?us-ascii?Q?t+Uxj9+8TAwB45mYFGWYYrxzvhE1rtBVGK//QCl/6iflhM84GtrJS2z82qoD?=
 =?us-ascii?Q?2umd0/XL/7ms4n20W2U2dS4wCdZ1C5eL26DWrJMigrW+gEFcokw91DvnqM0w?=
 =?us-ascii?Q?EUZuHibxaUfzYnPvob8FJbkeCejln//+bGqUkfdw2gM+vup7kQkzpIDL7Ska?=
 =?us-ascii?Q?LMLj0LM/qN50uVE5lTs5+XPtDEDDFwJgf2K9PRzATHfoPbHv+y1Yq8bqRL7t?=
 =?us-ascii?Q?Pq/PoLGd1+XRWudCq+wwk0a7fGaKDwqpvqgHkqxvHHEYJlcUh3/Zu0R/NxY4?=
 =?us-ascii?Q?RhBHwy7GU8E1intF/2aRzu1VLNPXPJDJRRy2ndrpP7OXkKui+zmjBlJVe7fl?=
 =?us-ascii?Q?8cJMY5RT+58j3u6GAOL39Nq+AilgtNZkwd31Fw2KPHWBt4YsUsf6OEe4PWrk?=
 =?us-ascii?Q?iIxCxrvbhcsg3DbrRzZitV0qaile3P0uUYN1fpYGtBFdM9KexDF+90Mzev4R?=
 =?us-ascii?Q?+es/3CSsNuxKEuhR28sJx5rMUqGr2ZgXuU+bc6IjUmQRkNUXlnKwOHaAiPlP?=
 =?us-ascii?Q?eG2nyUbpwbY9INoDldv5EgV8pKLN4Y1uC2QXyM4mnXIC7jFW/PZubzHvIDxl?=
 =?us-ascii?Q?TDkW07w3jcl5KEMs1Ob+zEtfRUhQm8TKxkSnU/mjkjKhocIXRW+5DLDWyIV7?=
 =?us-ascii?Q?ajsmp7luorhdNqKHkaHLIcf3rA4Hxg/LvgMSZvWk5kFYgVT9ESWsC2iVF+v8?=
 =?us-ascii?Q?znrzZmcMz2jDUo5anBbsHcFJ9fod2ObFOTqoMkfVZ4Ef2YyeVouJSqwATlw8?=
 =?us-ascii?Q?005ffYvoAZYEv3yl5Yq6Hplv7TRcx93cmBY0x3p/j+265AXC/GKJa2NLY2tm?=
 =?us-ascii?Q?tWniY9JJIEsOyvFftlLYQN2vxX9gQCv/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?stNj6TxAj6MnmQUihk5K28iXq39/ogpEm48VnOStP51rlPMUj6X0m3VFYwse?=
 =?us-ascii?Q?9oazgTL7am7qmjBgwwQWkDMo8OcDLStEUdREDH7BgP+t+38A+SeW1YQIHmzg?=
 =?us-ascii?Q?Rz5aUpzs6JMTjtZMiEP48OQ8S5+he/m9/azPVgX+jL2kd9uDSvqj1NquDK1t?=
 =?us-ascii?Q?5Ep0BSxV0NoIxyGy3+HuCscUZrcESy7p0f7GVpHAcOTPubpfhmJLrWTWSGWD?=
 =?us-ascii?Q?5xd1z7z76CqpFgG4tf+bnpW9pH7z1poPj0/+qnPbmBw6BpmDC1iN9k1U9h6+?=
 =?us-ascii?Q?NdB4fBESgTqwOXlZT1+VfNGe9zdrC2deSowGAoquh0BLPEJgqF5bRIrEGDkm?=
 =?us-ascii?Q?FRGQ+A3y1ZZ9OdNGs9zSl8fsDL3kER8TR5v2/Oj8C/wiMMv9PcXgS/RrsQC9?=
 =?us-ascii?Q?0QWhuD2BuXbzmkf6Iox5HbkpDiigJJpokffJ+6gyxeTLyp8xtBkewIGF95sX?=
 =?us-ascii?Q?MXGZdIAqqZwgvAaMEfq2Z1lA4XvWULyZZAPaCiehagwv06AKSHRDUs4phakL?=
 =?us-ascii?Q?z827twxwvzELid5Ov7kl2sKDIRNcwvGJrMZBM6H645biit5f7DaXidv3DfMy?=
 =?us-ascii?Q?FgFgOmnve7mo/bDPDnFgqmSdD1aT12IFiP6fqvO2b98OCfNxWVcCIlDRRfCK?=
 =?us-ascii?Q?+ifNMZYItqG9oiYwu+pWDllXMzcCqzBdQBjmnG7FrWvIMBDJgpF/YztnJi3U?=
 =?us-ascii?Q?w8NlNcRiR46VHAwU96tb63Q11iy2zgURjbVG7d3m+f/fqz+YPH/G3sjJuQ9L?=
 =?us-ascii?Q?k2MDZgG9FXO+4JbW6ydvG/3A9ngUWUBVDaXdEX3myUJzp031AWIhOZJl9lpj?=
 =?us-ascii?Q?zmg1CbM1XQWup8irUhxEncxhmK00FxSjgeXvIxUmj0reFrekcy4phJOtIX5g?=
 =?us-ascii?Q?SGHCQnKzEtGN3gsMXfFVbnN39PwIpWOpGhzR5aZnGCj3AqJUxtHzUYUPr75k?=
 =?us-ascii?Q?mTqAXQOiRj7dosMRaOXdSk56SSjd/O4YoKHJ+VgAeJrn5S4XsXzgvjjYgNTz?=
 =?us-ascii?Q?OB9iSZR+aSB2Chc3ZuhV/C+hnNDLTwZWKY1YNChrVhcW61mb46fufSrEKjoG?=
 =?us-ascii?Q?ncHduIsVS1NcpnD+yQQnwHIqwIOm5hMKu3sPC1aBfVjUpd7sXiAjQ1/AIGRU?=
 =?us-ascii?Q?cor2EcCNbHe41dzOdppbFea9AzE8pZbm0qcAY0zgW2y5KnTeekqkJAR0HIUy?=
 =?us-ascii?Q?VEur4uwbwjFTwq6vldj/ONI1QGVeyGUIPVICKd1CJM4XsXHcVVV0I0XwDiPr?=
 =?us-ascii?Q?bpi7Ckr8Jyiud1idwNqF2QGK3fmLjr4tKFpCMnvfWs9EaeDp1eBtUddWvW91?=
 =?us-ascii?Q?4EJ2jb7VUvxLc+eAGO74D21Pk1gxmNzdb8rsh4NQ4R7NmGeYvZizRbUedbyq?=
 =?us-ascii?Q?K4iedCbF+fSfVs794LzMBDewIQDZo/CZbjubo6qXuCMSxTcw0sIOq31qcLZ+?=
 =?us-ascii?Q?+HWUOU8L6x0Ec6jCSUFtFxKdeThwuUKTAWawGnc7/5WRsqqU8K6YS9hn+Czy?=
 =?us-ascii?Q?fLC1bm9KeF25zSm903qpV+85PQdjWi3AOlIrFv+xl2rIgFlMThCOw0WeQ8tU?=
 =?us-ascii?Q?kEeX3tx7izZ5POO1QvlS5wyNxXv2gsiAZ/D4bu16?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5e4VxuVq9cMrwP2qSfF5ArNhzuNIiZvGvksdaryu3Nk/0D/B/55lihmlyP7luBvot+YU3jV98rvmWjsLqaRrrSkhm+T5KUhieGTUoMrwytk4PZuQj1hrr0tcaodWIttNCD7z7RD78ZZYmF1cFEFEVJHoiKSaD3pnqQr0kdvnOSiuF1T6qV8JfOl/hxbMh5Pwm/AJw5k1KjV4EtAjfzZf9md+9egCzhlGTeZNG7vrr1X/qpG42vvUXDTJrBLhaWJhw62CZ5QMlHkGL39LvQgacjA7Iju2MgwkzCSXm0glsMro2zfpssLP6mUpPsFyPPDdUmVwz12tFe0jUfn7sIzjRE+3bLOSV6fnOTzJqjpWUyaXcaKyhSyuVzLoZInEs9HIvpUvnqW7cKGicBUCHANjU8PELwn970bG5zrauR7k0QF4wHnCszZ9p5hTXJkg8ipa0w9oxTV2eLOrUfSsFeW3TEqvYaUgn8lU0Z9uwj7PeqfcxeDgmtYpqlr55MN4ntUSJWYQPd0fydDyE9eeVExrZ1wqOZCZjgiaUt215ka/zcvqRRYBbynBs0PuDXrAlXAyW2SEt/nFFn8JcR16eKJEwCYC051mFMsCmuKFfnzGFAw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e269ca-a2eb-4d10-05ff-08de111a5463
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:11.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMffbyl6eJljFMD7jEb4bHN4vEQtgN4JUT6Cn/gGXBK7DlOEDoqClokQnCscGHQ6Qdma+7/QcOL/UrGEKY6VLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-ORIG-GUID: h6LO61kr3dAvNTJr0zLHRKVgTg_IqpdW
X-Authority-Analysis: v=2.4 cv=Pf3yRyhd c=1 sm=1 tr=0 ts=68f84e2e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=ya8n6P55ioffdQ_uoxoA:9 a=ht3SdGwVgXH9XrWC:21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXwS7Rm1KcpWoJ
 1gF/5tFkIK5BrxTKHHL0Zgy0lIqI2Zp+BgT5eJfWg9npeWJeSz3WPEEdMh25aC0vDqHuOj1kai4
 YYoycHLczJxMindvAosd0uqo7Oa6PY2CNgpwtRwzlgDEY9batsuWhMz5arcDQ3Sr14sZuxEL4R8
 FvMUvKePZrbVRaxckH3dpwqbluIwhdgNwPcrfQLwI0ZOtVQd++4p/L7a/muErp/sMq/Vp2U6oSm
 KerVlYuSlc6Ef6bRnAQ90tb3Wi5NBEwzDEDYoyTWY4PP0ai8y3Jg6hBrJrvEKaU1eN+Z+74kCfY
 ssiHFpMyn5PtuTJigchiSOQJZkdWxMjwKTsqMqfGLKuKK7+u4KNc0oVnrnzIf+eV74RPQMiHQB6
 JMJDqwE1kUVyCAF5oK9R62rCc+XwDQ==
X-Proofpoint-GUID: h6LO61kr3dAvNTJr0zLHRKVgTg_IqpdW

From: Eugene Loh <eugene.loh@oracle.com>

There are two references to "Table 1" (which is not otherwise
identified), along with links to an undefined ID.  Rework these
references.

While we're at it, convert the table from HTML to Markdown and break up
some longer lines, improving readability and maintainability of the
Markdown source file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../reference/dtrace_providers_profile.md     | 95 ++++---------------
 1 file changed, 20 insertions(+), 75 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
index da83e8561..762109d02 100644
--- a/doc/userguide/reference/dtrace_providers_profile.md
+++ b/doc/userguide/reference/dtrace_providers_profile.md
@@ -11,86 +11,31 @@ Such probes aren't associated with any particular point of execution, but rather
 
 The `profile-*n*` probes fire at a fixed interval, at a high-interrupt level on all active CPUs.
 
-The units of *n* default to a frequency that's expressed as a rate of firing per second, but the value can also have an optional suffix , as shown in [Table 1](dtrace_providers_profile.md#dt_t1_prov), which specifies either a time interval or a frequency. The following table describes valid time suffixes for a `tick-` *n* probe.
+The units of *n* default to a frequency that's expressed as a rate of firing per second,
+but the value can also have an optional suffix, as shown in the following table,
+which specifies either a time interval or a frequency.
+The following table describes valid time suffixes for a `tick-` *n* probe.
+
+| Suffix         | Time Units                                       |
+| :---           | :---                                             |
+| `nsec` or `ns` | nanoseconds                                      |
+| `usec` or `us` | microseconds                                     |
+| `msec` or `ms` | milliseconds                                     |
+| `sec` or `s`   | seconds                                          |
+| `min` or `m`   | minutes                                          |
+| `hour` or `h`  | hours                                            |
+| `day` or `d`   | days                                             |
+| `hz`           | hertz \(frequency expressed as rate per second\) |
 
-<table><thead><tr><th>
-
-Suffix
-
-</th><th>
-
-Time Units
-
-</th></tr></thead><tbody><tr><td>
-
-`nsec` or `ns`
-
-</td><td>
-
-nanoseconds
-
-</td></tr><tr><td>
-
-`usec` or `us`
-
-</td><td>
-
-microseconds
-
-</td></tr><tr><td>
-
-`msec` or `ms`
-
-</td><td>
-
-milliseconds
-
-</td></tr><tr><td>
-
-`sec` or `s`
-
-</td><td>
-
-seconds
-
-</td></tr><tr><td>
-
-`min` or `m`
-
-</td><td>
-
-minutes
-
-</td></tr><tr><td>
-
-`hour` or `h`
-
-</td><td>
-
-hours
-
-</td></tr><tr><td>
-
-`day` or `d`
-
-</td><td>
-
-days
-
-</td></tr><tr><td>
-
-`hz`
-
-</td><td>
-
-hertz \(frequency expressed as rate per second\)
-
-</td></tr><tbody></table>
 ## tick-*n* Probes <a id="dt_ref_profile-tick-n_prov">
 
 The `tick-*n*` probes fire at fixed intervals, at a high interrupt level on only one CPU per interval.
 
-Unlike `profile-*n*` probes, which fire on every CPU, `tick-*n*` probes fire on only one CPU per interval and the CPU on which they fire can change over time. The units of *n* default to a frequency expressed as a rate of firing per second, but the value can also have an optional time suffix as shown in [Table 1](dtrace_providers_profile.md#dt_t1_prov), which specifies either a time interval or a frequency.
+Unlike `profile-*n*` probes, which fire on every CPU,
+`tick-*n*` probes fire on only one CPU per interval and the CPU on which they fire can change over time.
+The units of *n* default to a frequency expressed as a rate of firing per second,
+but the value can also have an optional time suffix as shown in the earlier table,
+which specifies either a time interval or a frequency.
 
 The `tick-*n*` probes have several uses, such as providing some periodic output or taking a periodic action.
 
-- 
2.47.3

