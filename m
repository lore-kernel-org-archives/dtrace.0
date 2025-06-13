Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC181E1DE9
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833209; cv=fail; b=n9ce/YOd3RzFojOXu+33wZmG9KtPM/G7Ie8RShFRq+RLCuGA/sws9TZYTGg7QNdkYs9GAaO+Peddo4Z3C7GcqFJy49TMe76Ejjt5zSyFvF7yPbWqVOQydCuDhw3YTGSKP9jwUQ487K35HunuxdPRNaZEWtu4lpv0nznxVLpOiHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833209; c=relaxed/simple;
	bh=qf8cjCsXYktkwBoWQbvlnTAAhThaui42SHqAjlCmUz0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Bz3KtP6j5oosaPOJTrcNH/y1iBBRXhE/s6z4smA3oC4w7UAePJb+n9m+4q8iwUJqBOabbbpadOIvfGUNOCxFaD7vHBfRHL2f69ti/Qpt73+1hmo8prM/xP7dOQS2Poh/Vl40FTP2/aicE8LHre7/qAe52GbBV2H3cQ2uIrLPtTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oYpUfteX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VYwnPQZu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oYpUfteX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VYwnPQZu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCteaI020279
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 16:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=AJ4WbRFC0qRPZnJV
	sKOolNRZ9Z3jK5YF8O1eKphTcqs=; b=oYpUfteXh8SCFlr4oeLRTd6GULDzX+KU
	rg/ErSYfb8BAdcuBNvNvJFYELjJIj5qoTJJ6yerae25j2Q+74qc0a4NhF9DevqIA
	MmPAilMNKSmCfyjNEvl/dpEgwwQDpeyFw25vCUDcKUEo6Gw1q555bP6XRsvzne07
	E3PVrTLJ8dpI6j3epGgq8msZy1FSJkh7bAfHu0zA0FIt9bGOIevXj6mxmQnoqja1
	9vnC7ARW3+MK2qFonajotvoNodUSXlWz4wS72argsqu82c2EglMjVPDPW6kbUIo7
	2egm0TiPA01nKrrMsHtBvkzN1bUSDlQIHFjsFzeqj0CyX9pr8A+cEw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474bufbuf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 16:46:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DGWrno031849
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 16:46:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd47w5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 16:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEg0zcWhOSS9xh5CFMtM5pXMTioCMejvbO2/eiiHFIL5tHmJO0aZMOAebvYbFM300DTvQnneHiTBJFtNMUuXUSCi/GI+5JW7+E3Ycr7PBqBL6+9H2nw4ICfM/NMJQ7fy4EnRKkUknv3DLmtqI4dzM0tyXyCKpVyCVuLmsUHD1qn4qLKpMMxsNssO8VLiCxt+yXwYEcfhzIo3uC1fu8HpdJyRV5CUYbuBwvvS+T2lcIdJlz3ZxCW+MCfFNlUkIZDwqJNRaW0ymllwZJesjzWFQ1c0eUGoWsfuTQa3toMq3NcrQtXj7qyRPqVCEr+0SviTTANJoL4jDMwgVvm+ABe6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ4WbRFC0qRPZnJVsKOolNRZ9Z3jK5YF8O1eKphTcqs=;
 b=mh1lz/M/hZQJdZ6VYtuiei4KZDLolK/IhEaEeDQu2j0I56M/Yi4lAR6c5J6h+lE3jQHEPUu2paIm/87c7l6IptCGWaRqxdDEGl+Sssk9E+kyJTrF0HjCb3pdGoQMCdZVqdcR0+vqR0bgiKLLzWMa8dL0nVDUai6IyOWW6Zbz7r3rrl9pKNtItq9ae9UqDv8Yia2OVIrP3xypxHr2Z8CRTSGZuAL7A7RGC+BK8g/KoSadckTvumYDcQbPt3DFCFLBMFp2MVYVLWgEAlH2epcA2YA9txui24+4+tC8kSsb7VfwU7MLzu69+7UBT9gh4SkiUxxzxVelk0sr1RrGQu8U8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ4WbRFC0qRPZnJVsKOolNRZ9Z3jK5YF8O1eKphTcqs=;
 b=VYwnPQZuI1iRI1RAVI7siW1Hl8/Nmyot/QUY1jnLTdUCB6EIJlRFoa1ZXi51YLGNwMlBsK5I3f3Zh0bgfxmKj2zUVxH3sRh5Nj38FErkL8xeUDeNgYcED7nk25DfmjHGaRif2Wbbdr6rMPgDC0eyFqIZwx0195pENzrH+3i11pI=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 16:46:42 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 16:46:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] libproc: make Psystem_daemon() detect modern systemd properly
Date: Fri, 13 Jun 2025 17:46:37 +0100
Message-ID: <20250613164637.3110-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0151.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA2PR10MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7f6116-87c6-4fdf-a5b0-08ddaa99e03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ieNZgOmfwEB40f6g9xmoQ8Xgr9VT5vh2Rv/+8lRKpmZnXjUUuw4P97nEbi1?=
 =?us-ascii?Q?okrtSMSGkP9IK9emCXSLikzZb+NtEhPkulizw5OspctLQXoePXIvvvjqXbbI?=
 =?us-ascii?Q?5NectzOwsLZe7JU3don1O/7zLdmHqeTQ8mrw4on4PQDC3Xu4J28s4liKwKx0?=
 =?us-ascii?Q?GINDpE+fTIijERr2wygEZJgAwEgukK7u9I3EiSmHf9OYj6Twp7Zznj2NiUpW?=
 =?us-ascii?Q?3mdX96ou6pZrDUjeBNQ0BZ0l3PAy/oLXmGkWX9MzIw/dx6KtiCPmZKmwNOrl?=
 =?us-ascii?Q?c0T3iddnzbLm8PoZf8LppQnr3ytVX57h2ggVimy8aENr14rSsHiiUZbTqrjd?=
 =?us-ascii?Q?/zMnnG3h1y20RluwyJdpYjf436Sieo5eQxpGfRjMTAJeENoSuFMelArxO5Ye?=
 =?us-ascii?Q?O7Up/Q5wUzWX2QX7rL7eN7Ylac4yril8DiiP+B5WZQNKHijbHe/q/ly2Oz4n?=
 =?us-ascii?Q?kxHyarLyjdJ2KPSiyXNz/KejxHwSA69MeZ6uGfFG1iKs8+cIxscJdktXT21U?=
 =?us-ascii?Q?hvwIcBQ1wDsBWEqB62jb+90MI2zKj8y9PhMI5z2yWpAfZyZB8uwkMN3POTgc?=
 =?us-ascii?Q?3zZNIM3H+ixaaq3p7X5cIXGsiDRjHuzIdN2e1e//HvsaDueLndXEhyh8/7E1?=
 =?us-ascii?Q?2sbo/BdQ8rw5r4uKiwkzFfT11LXUR0FQX2FJdlgP4Mo3uVzAewAkUnOmeByY?=
 =?us-ascii?Q?2P1iMMfPoGGlguB9kphfTxni15UiRWVZhXLZj/tecN/VYJEaDTvckipKxEcp?=
 =?us-ascii?Q?H34WSyD5H66hYyw1Lp1L5SLdEykegjPN5SDjIFHDHj0o3noDzcxL2D5V/Zhs?=
 =?us-ascii?Q?G+8uyCh9M/hTzMDsAlW8u8k35lv69tgFLHchpymXfMSP2GrKJNMW07qZXpn4?=
 =?us-ascii?Q?3+hWYlR5jEHQPUBbifyGwhKeNZEgAmsUR9MDCn6n4W02RrfBdOe7Vd3LMQ4G?=
 =?us-ascii?Q?llNZBD2BOWCTemPlC4cGgH+E0/5mijI25TSFVSsWvNlrU5oq2mgRZG2UWZKY?=
 =?us-ascii?Q?IiLBGXxp15KLwyLCHLMTqHWSPlCyVd1DjP5FpwsLfuIXoXUO5Ad9rA86bII/?=
 =?us-ascii?Q?x6JtBNumek3tZf40DT6DFRZbwAbpF2YDCZ/9POhBu1kVw+Lq1z1ArWKmZbbw?=
 =?us-ascii?Q?NSgrC+e4LutqIcQ15BmwCIiH2sdtBwHK7+k/fy8NaGQEqjky93WNHwDqg+QW?=
 =?us-ascii?Q?4zLXTU6JYRmSjCAPStzVE/5Co3d8G1wEs6lis+4pK9dh3LqNHPJOv1u4sSa3?=
 =?us-ascii?Q?LhhzJJP8I/2DI6txFzOX4HwjoRcJuIq51lIf19S5KsHf4NVkyoBgJVU5rGrB?=
 =?us-ascii?Q?Ut6fWdjjPNhcrnRBnkmif2Wf8C4KAdmquCZGZGdxjHKAyGWfQWXUVtORE4MD?=
 =?us-ascii?Q?6/mwHA7CnkYzIJLbheLMgheEbuhAR7+GYuc0xBdAqRf+rmwg9CqTwhgYM0aq?=
 =?us-ascii?Q?HHEw4e8ajjY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/THuK91ftayqwZbcCAM93CJr3jRa71gFHnep91LlshPNLvP16X+arjkWePRz?=
 =?us-ascii?Q?EE7xJ+DbK+g0aJaANZHnXcnKQxlZOUm2c9h6PVOcGCMcrjnCN6BPq5Riaj+c?=
 =?us-ascii?Q?ZZ+hn1LAf73w5y081hMYZH8GYBF8Q1IOZianTHhUc4V05qU/ez0/iKtzaJ9D?=
 =?us-ascii?Q?oDxU9xXCsLtLESZz63nPKIgAXCEu86rkwIeXb+HUWeLG3h9GnxJ5DeoIBmAi?=
 =?us-ascii?Q?slO5c9yqgCXyHG6S1jqeSFRQRJIxJjLKlwWGPT5ICp+VcyIN87ResqfxYHKi?=
 =?us-ascii?Q?X9Q8diZ1hE57IlCZ7L4HrGYMdchmdhwdQky4QnaF6lCNouxDmTzcTepYe+zq?=
 =?us-ascii?Q?VIjoykhnGIHcxOPk8I3f2NOjGn++gsW5Fv0SZfkA3o7GA+hG2ScBp6EPqJcf?=
 =?us-ascii?Q?I718lOHXLzgiKHvbJ6vbtyuGe1DfZgfeCVZu1dkfnxA8hm4V5sHGCIXqcIeB?=
 =?us-ascii?Q?A5VltIlBn7bzl8X1r+lnLn2ssDJTU5QFAsVPCcbIkGdUacDEoj/BJH/7iM3d?=
 =?us-ascii?Q?2THwraUshyElvKVBpEfRpAy2fEgXiDW+9SCCNEsA+leqd9mwTJCwoccTLnDw?=
 =?us-ascii?Q?t7wAHZ1ufwPXLCmiJ6/tC9omrR35AW1yRkBtrozFNWgjguC6Ts192UyRv9Fx?=
 =?us-ascii?Q?SgI4zXQIDxOeyWgdiz0hJJj/R5HfnaD1cffudt1W+uGinXrlJC02I74nOMCw?=
 =?us-ascii?Q?rjaA8qVpBFQx+Cpx0zF0QDLVTtdoyjuIfdAm6ZtVf5eRB94IPY/7/t18P+pI?=
 =?us-ascii?Q?+1mKjfNcgmnwlD3zaIdlHI0r9Rqby/f8Oy9Okr9gHcOy5j1FuCVlIBAQSefA?=
 =?us-ascii?Q?HerTHRhdSo0H5ubvHIeyY9uwo07JyCvDdViTJqfqhC8d4QxiB8glxdJYI9vj?=
 =?us-ascii?Q?3Opv7QBPDZQ+QlNaTYH8tlnpp2yj9iyoNAUN+GHwezFlUY8fbjLzWstCYIC8?=
 =?us-ascii?Q?3Hth6cygNNheJStsRrqMHTLAH0J+MfzMIeqRWBzKCUzGTpy9MQOuUHj1D065?=
 =?us-ascii?Q?tvZyP5lihwxofoCo0mKdTBO8kBYqN8P7p+Mg/JeoqqX9TiY/sMAuY0uIfHev?=
 =?us-ascii?Q?ggC5bid8gEU8S7SWMVcAuJs6Ay+wZlCX7o9xX0yZHcK8zx5gwDlJDFEYIWEQ?=
 =?us-ascii?Q?xZCjEjfVxo0PWMXeBEAtA3K/tPqDo0p8/WW05VTAqTML0kgU9lo4t7C32UJF?=
 =?us-ascii?Q?2VW8uRbsjcI1hguCHjI1UgJDcaTKzrWAgPtV7jU1EsgmegH+0tsx3iTJ+G8Q?=
 =?us-ascii?Q?JFg3o2o4M3NVF4UDwhbnD8epiXXg3Ux8ohdLWXRjlsgcJ1RfRGUjZuE1fvuH?=
 =?us-ascii?Q?ALSMdf1ZdDkES22ZteDK79d1RBahFPnVhMEk+dTtq8M/d1T9ObUb3VzI49m+?=
 =?us-ascii?Q?pS/R4zvog6jQ2waYay0nyZmjqMlXMv8uwQjayVY+SfP0dmM/1j+wvtXoYNh8?=
 =?us-ascii?Q?Tn0u63blB9AUwKO8xy53EbzFyo87QWmZJLaGa4f0Vz21+oU8N1bnQj1MnFp9?=
 =?us-ascii?Q?xfKd2tWsXbYMBCZ1Obfx463boavcWuwNg5vykzgkQKu2ec+q/2FbaTrf9NOR?=
 =?us-ascii?Q?I71/6mvB4BP3ogzxYPRee1BsGZUZyx38LM947rdmRLw87JGf7DdSeSicTBqL?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VrDH2MIYCEJJeroVUDkUw3223j9Por/uXPD+CTkULSvTAYz2DxM2ctvLld3CdzMIy7XhYzKPaoqiicwH/zZN/+du6ev61QyWPjtp8gpLfGY8tL+VfFhQhzECz+MRqU46uRZh89ecB8BvfC+GzwJg+nCUhS20o4BoNmlmqJUkPHVU2fQUGbb/WefnrE+g0R2LRsuCg6wEsOhk4FyXy8l7mSfUAVvHqkpAmR4KPzqkmztMKSU/BEVhoXILH2aur+imA4R6SNQdzXUIc9FtU6nrFIbgj0SY6bafaaUsjXIXmi4AZ6jUTMb2lPymJo7JKSqVHV6ey7bwNqcXLqLBEriAZ+JbPvnwxpoRU8e3C8ZLNAK3aQxAA5nivxqIwLnAn8e+fcyvfKT0dxAQHw/RqCqe59CtEI0D6xtox8oIP8QppYOsuRlOgvXRNsUh3MzalzZMVk9yO4vHImQI+/60GKjTPWID++rvwBP2ovptLoFfUayBoTzYf1FX9Gxhhw6u2TTllYzknncflrDWWzQY+keKgBcDaO3/qsRlHTDIzdP3ZbfTV9Am2kuokhosvq6K25lx4To+NN43hI/wxcR8ZySEOuHVRqxedfjn/CDWv72lZBw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7f6116-87c6-4fdf-a5b0-08ddaa99e03c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:46:42.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZ+m+xbRBZ56sMw7YnV8Yo4DAq2F5GzO4RMmK5znNxIx0xdP+kTdwYjtPt3y9Ud3KUIMsOfUMMRYpOHI8GOLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4524
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130120
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=684c55f6 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=j9ekrCJNRKJN9YTXoHEA:9
X-Proofpoint-GUID: YS6GmNk0INcFfbJtA4bbFC426mROG0Ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEyMCBTYWx0ZWRfXyS9D8140OoW+ sgUkirBbYuZhQLpqBpXsmcs3NZyAcaCrCd3ov4NCPMJPLnkgyWf/yjMb2LT2hWze57eQctk1vtI JqCv2Gj4S+chaXKqazwfJGnnOM1kV+evKoB0ieiay/ljUtN0A14Z0cusARdfV1Mmi8wUlQE6V8F
 BA53qoyA+WqBnNO9BznqnlHcvnjfNCsFtbOBSAJYn/sLk44dN06dZ+Bbx+UGvVQgNklx5xes6Ba uUOeCFI+sK5eiRsO+G9vUgu2XjFm2vjscrS2cdXTdEiz1G7mqyHsgHoxqs1Ukf44sk07GTRKoTG E9gU7yO8Y+F32b6xfTrLaQQkUaPjZrkz2u60jNuGZlraK5b7u72QHvZQ2mxfuaUi9PIOvLq9TW0
 38UhKYclTcXoHjdp88gw+Tyxqc4333XYWifXJpLFGVjJMVjRN6R+hycHzxi/rHSZ7Pga1+aC
X-Proofpoint-ORIG-GUID: YS6GmNk0INcFfbJtA4bbFC426mROG0Ti

Psystem_daemon() is used when carrying out shortlived grabs to detect
whether a process is too risky to carry out invasive grabs of (you wouldn't
usually want to stop syslogd or, God forbid, try to ptrace PID 1, unless
explicitly requested via -p: the process just coming up in routine probe
firing is not enough).

This has two code paths: a reliable one for systemd systems (which checks to
see if the process is in the system slice, which contains precisely and only
system daemons), and an unreliable one for other systems (which does the old
Unix approach of consdering anything in the user uid range or with a TTY or
with open standard FDs to TTYs to be not system daemons, and everything else
to possibly be one).

We were checking to see if a system was systemd by looking for the systemd
cgroup hierarchy name in any of the victim process's cgroups.  This was
reliable back in the days of cgroups v1, but alas in v2 where systemd runs
all the cgroups if it runs any and there are no longer multiple hierarchies,
systemd no longer names its cgroups this way and the test fails, causing us
to fall back to the unreliable pre-systemd approach.

Use a more reliable approach to detect systemd, the same approach used by
sd_booted() in libsystemd; check for the existence of the
/run/systemd/system directory.  Fix slice detection to work in the absence
of a systemd hierarchy name, and everything else works unchanged.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libproc/Pcontrol.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
index 7d9b5055f8201..02da472553d99 100644
--- a/libproc/Pcontrol.c
+++ b/libproc/Pcontrol.c
@@ -2927,10 +2927,24 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
 	int fd;
 
 	/*
-	 * If this is a system running systemd, or we don't know yet, dig out
-	 * the systemd cgroup line from /proc/$pid/cgroup.
+	 * If we don't know if this systemd is running systemd, find out.
 	 */
-	if (systemd_system != 0) {
+	if (systemd_system < 0) {
+		struct stat st;
+
+		if (stat("/run/systemd/system", &st) < 0 ||
+		    !S_ISDIR(st.st_mode))
+			systemd_system = 0;
+		else
+			systemd_system = 1;
+		_dprintf("systemd system.\n");
+	}
+
+	/*
+	 * If this is a system running systemd, dig out the systemd cgroup line
+	 * from /proc/$pid/cgroup.
+	 */
+	if (systemd_system) {
 		snprintf(procname, sizeof(procname), "%s/%d/cgroup",
 		    procfs_path, pid);
 
@@ -2941,20 +2955,19 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
 		}
 
 		while (getline(&buf, &n, fp) >= 0) {
-			if (strstr(buf, ":name=systemd:") != NULL) {
-				systemd_system = 1;
+			if (strstr(buf, ".slice/") != NULL) {
 				break;
 			}
 		}
 		fclose(fp);
 		if (systemd_system < 0)
 			systemd_system = 0;
-	}
 
-	/*
-	 * We have the systemd cgroup line in buf.  Look at our slice name.
-	 */
-	if (systemd_system) {
+		/*
+		 * We have our slice's cgroup line in buf.  Extract the slice
+		 * name, skipping over the hierarchy number and controller
+		 * fields.
+		 */
 		char *colon = strchr(buf, ':');
 		if (colon)
 			colon = strchr(colon + 1, ':');

base-commit: aa63660a7cfcdeb1daf4fb63f1c15f75a1693064
prerequisite-patch-id: fb67028e06b7f26c5cab857477a44609f50a1706
prerequisite-patch-id: f663cbb68f1b30be83e8327ff098fff812ba85e6
prerequisite-patch-id: 7f3cf0adb87fb636276334b0002338ec656f86f7
prerequisite-patch-id: f4716e3bf14ed8233d49d2f7f07bda796f2f2ba7
prerequisite-patch-id: 66c5402691e142580c92584b2eaa4e793146b1a1
prerequisite-patch-id: f96954068cbbaca32084ca999daa825d6668ddd4
prerequisite-patch-id: 6e71861d033f5658a807814dce1161465cc600c5
prerequisite-patch-id: 7e219f03f4634783ebd0550542fa8dbe33e70fa3
prerequisite-patch-id: e7dad794aa72e6d48edc277370f8cca25292d3ba
prerequisite-patch-id: 9288cd08c77af53d45e9eef5828bca8bddd22258
prerequisite-patch-id: 994fc434d3e5684814f090acd558aa1d29e737b6
prerequisite-patch-id: 0b84e67ab3948f9edcf987ddbf9ce38df5656ed3
prerequisite-patch-id: cb433110beec8b9e5745acb05930c06b890f4788
prerequisite-patch-id: 71925afd1991d6b1800e0767e5c1420f5b8b43ed
prerequisite-patch-id: 67fc0d710b58d6205a6877c4e89b531147b61b51
prerequisite-patch-id: 5b2284dbf7638adacab912d64ccfa775a00632be
-- 
2.48.1.283.g18c60a128c

