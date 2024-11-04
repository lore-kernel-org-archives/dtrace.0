Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB418C342
	for <dtrace@lists.linux.dev>; Mon,  4 Nov 2024 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730748243; cv=fail; b=eBoPTHv+kYr2mEwtttBdVo69Bmv+aIvZqwO48YXlRi52HYvyAgOTMaBX9jAgjQpy2R+402Om4UmqjACFZxk2rEo+8QoYl58YXCxaAY2yrzc3sfgnMZsgysbO03i5GvrsvvRPgQB1t2JUJ1jxI+pbQeeONs/jrkhyeaGQ6yJWp1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730748243; c=relaxed/simple;
	bh=5dYJtAgpm/3w0w1RMohF+oIyLtqI321YTXZaF9AXRmY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hJ2EaStCsVjp00q7iB2QC0QcSNy4YttM38h2sPlTQTbdoOmPkK37sJW2deayGjtQdvpgwxDb8eNTy+FilZXI6XcgTN6YEl4cCzoJXJhnQ/69bZPnZjqNpgkYnsAoVDdBS4lvcgIPuem2zzC5xxd6wS6Gl/BflSUiTI2d56fjkn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=obnJwezc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oshjPG1G; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="obnJwezc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oshjPG1G"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4IMWLq026872
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 19:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=XXCUzsH6JR9mggEIUDPVtMt81LT/x6GGh/X+Vw4p78I=; b=
	obnJwezc1UW00uD9jmW6hV3IMkCna7MiZz92sMOFlHDACM0L3Iv3VoVp3V4qBwgs
	tcer/doh9a9SuWy/1seAooo++u0kuFzUBo7fzS8kfZEMmlvaPmWo7sPx0phay2SP
	I6yBb24Geo6df5Lwb2HZJad1gC0UxvU4nfKRXCFlMY6GTh6YMAulPcVU9rl9DCvF
	zpyYGTk7zZaBDNmaaFNxzZqGyWPcXvK2CUMzK94AcU0kLSnnLIlwrYSKtRb3oMN6
	o1WOmc5OgiymYaNyXajJH9D2pN3ys29mPWsb/xBS8z3ppD4pYcjn54V5eLIP7C6V
	WlkRrd2B+AQWJycmZcy/+Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nby8uk6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 19:24:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4IZbXT031433
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 19:24:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah5xrhk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 19:24:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzIo8jin1wQjGmIp9JcHzS5KgBVySHKcdp4hW9opJ+hvWmWn3XawbV/niOHUxs0sfw0R/rRrgXXMaXm0fXrzm5Ydtv60qzEbTTSizMemu2dQuon+i9YM8g48VauhglhbTwhNKZ3hnfsEvDk/qfWTzlXQRSuATf8B3mGIW9Q3ERN5ugIe7s0CoqT0xG89MZGg9PP/SoQQr5tr79LeLVJKHQp/qV5v6N3oxBRu0CMvRQPAMrbxyPs7O0pqjCidZur2Nw9WXYj1ikxRTHnmIVgi1yH8fulrMjsJwFFkS8FpLeBEfYPJXVpE+Z4hbWdFw8bd6UmlJrCe0EJ1DOQddFLGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXCUzsH6JR9mggEIUDPVtMt81LT/x6GGh/X+Vw4p78I=;
 b=LoDjqYQ3h/nNpXYqre6VNwJ/5CnpZ9EgK3ChTp1JENjCc/IHNA8mav1WsHCRk9wD6FtZqaMpZfgQ+tFw1OorQf4dyqLDlUfczD6oWl8aqQwZkUkwM7lV3y+9xjk/304OIcJSs92Snod3IGN7eTltm3e8Zd7HzhNSwCv+BB1XpyyGc9m5+sGUzeNz3BTROi+nutf5xX4wXq0/7DRRa2rTPlBVj6Sa8i0GqaK7xu4BPtArOrd1x1vHw4h8LJZB9m391FN3LFKj7nNtGfWLmYHC6gaqP/LdUr0zoL5azOpOa1yuSA8rNALpeYXtH/W3b0ABZ5cUwZaiEaVFQB8heDagVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXCUzsH6JR9mggEIUDPVtMt81LT/x6GGh/X+Vw4p78I=;
 b=oshjPG1G/Efyk7zsbVfck7HsrTX+j/BSSIm6GWdio4TVE3sQi39nqniou5ps83v7TFjR1+ldoovmzbu/1WAPO7iI/qFo9p8CrhYK1XGxoAXbyYnisJcTRvoQ+WnlBriNTxo/GdRgZ/2OqtGiaRMM8vti0ubl6ujY+YsU75Cuyr8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 19:23:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 19:23:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Remove duplicated check
Date: Mon,  4 Nov 2024 14:23:54 -0500
Message-Id: <20241104192354.27566-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:408:e7::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a622fc-92a7-4da4-efdf-08dcfd063a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P2zqk6fNX2YFgqhpyPIqdHWUhldZt0akauuwfCmEvVL/QcHLmWTws3ypQY2/?=
 =?us-ascii?Q?bHg5ZSwqjQlTuylGx6VCngbRvPnYDTp2KNvs4vMGlIllREC6DoZLwQndw+u+?=
 =?us-ascii?Q?j5aUh2kMs7jnvSUbXCsoEoucN/lJ8nSJPldq4BI14Ee6Ayy0odXqxWR2xjfj?=
 =?us-ascii?Q?5tvEDyBUHvZFg6WefJFclNX2oQ5twTH+k6XFpd+wxgXOdZDm5oed0FGmYsaB?=
 =?us-ascii?Q?xOu17C67jZjSQODYi0SVTx3DzjgE+qg2exxkfPrTpF8sOOjfOP4xCtXcnxnY?=
 =?us-ascii?Q?D5YvLaXyQ+ZbsWdg2jUnoQzM1slJtIsh+Zoqlse2vO9KiowQt7Z3HRNpgKHv?=
 =?us-ascii?Q?GKsScMhNo7f89aYla06k1Zs+gQGnETggp1pJVkLMCPIaDlQp6zM4SswRCeW6?=
 =?us-ascii?Q?P64+968G7d4Lqs/DoN6INJ1TIsO42udGmJgsuKStBxszaKyoALPz8Bwi5J5v?=
 =?us-ascii?Q?jbILWWLzkaZ5y9rlCWV/58KgLb+P3JNV/qn0kgymDqTYs9a19HnT7RJhEpiH?=
 =?us-ascii?Q?cmSb/908r1Z8XNqL0vPNdg+Xivy8DuVEJ+SJalxOq7fP62FTf491QKiNLFnv?=
 =?us-ascii?Q?JmtaeFnlP0LgkTAjQZUVs5Ceo20k75os6vAyoJJ1qdC2oRsZWKqbj6uLe2NU?=
 =?us-ascii?Q?QcmGtfUqZ0htdj5ST/iPG7zcbT+u+dWHzoOm074GU4r8rDzCrpAaicTx46aK?=
 =?us-ascii?Q?hSWHn926p5Tqp9m0YKic4SQ90/Ph5bx/26b1fOTyGPHxGi67jOSwC2hE6eTW?=
 =?us-ascii?Q?mNlTpbnuLSby+Sv8ItS2uylNDhK4QwBe19Fm60UAQ9s/Uh+o9mJrQ2juJy/T?=
 =?us-ascii?Q?hMOtlA/5hgY/Kc8MG1mT7U4LKduvzZq9ZHnSqN6Di/wSG+D8PyVo7YluEEnd?=
 =?us-ascii?Q?dcjHa5vKENc76vToEvptpli8ub89V9DTmsjqXEZsoSChUsyLeDVRsn0PlesB?=
 =?us-ascii?Q?eKaXL4nxXxEw1tK5tRBUbLtifUF6wIOyBbcARza9xRihtC2KrH6i2pm06iVK?=
 =?us-ascii?Q?W1bRavrYW1/VPKNQk/+KdzvuTsPgrje9S9pIAcwGVKT1tVBNJAUBkX8f/z2r?=
 =?us-ascii?Q?9wrWJImp9gu7GbVA7Cz/JBGVvJLX86/CKTx8diYsb0DcK4xhmWTkUTfc6XB1?=
 =?us-ascii?Q?VxWlLR6Mc9PKnTE8nTCJdJ/s3O2CUfrEBKNtJmzN5lnQmGfHKdodRepZvfql?=
 =?us-ascii?Q?Syxawsw6tU69oBp4N9wrHOh4CMXQIT4BStQ0mVa+VSXmUI5QR0c2n5KOkPPv?=
 =?us-ascii?Q?oE7glC6PP82GEGxsYNxfmc7TK49vmMLMvALDLv8PjSSO3G/uSuduLuod5E1B?=
 =?us-ascii?Q?0+EhXBZ8BGBpBV+NHVuMwxBt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pyFr12mqXKwyYUxpjPDXtht6n0jJ4dx72XhRL6EtoMa8ppnKrkhW/9UPivSJ?=
 =?us-ascii?Q?s2zcn/jHSkVscN8nOlc3sZlrRerLUpssF2QFrHzsW3djfbicELdATVbm6VRE?=
 =?us-ascii?Q?2UbvxN/immVQhiaLMi+flPLjba/rFkXcPOCs9rJ+yCDNRaICdjXpOuTtTllI?=
 =?us-ascii?Q?A7haqIaNR/XlRjg5C9eOoF2SYQyIn5lwDBLaWJ4fwEleIE7pCAUpQD2qDpUD?=
 =?us-ascii?Q?wRAlg2wISH/wTdJws8ECEzfa6jJ/qve5lA5GOKT9W2UNkTro1agpGmxh+MRR?=
 =?us-ascii?Q?EUfeadJvNWJ2u40WesXJ6ePIl87vQtSSS2epZqYC1rGX7uQFRwzYn+01pbnY?=
 =?us-ascii?Q?dPuZ4GhP5yaRrLJ0OvX13aWJWp9Bxwj9hmTPmFdSgBiUEbKB80eQ2TIncTun?=
 =?us-ascii?Q?qiBGd0eXN29IQ5L/4rB6WqaCyLOz5iGE3/KIwkpj5a8etrcPjb1wd8rENheM?=
 =?us-ascii?Q?+tN+U4BL/xzpOmKWA+Su5sXg68fM3GsNRIOWpxgqc8UDZcpGDIJ5UiRtAFxn?=
 =?us-ascii?Q?4xt4GQURDZGbL2upNvcjX1Ihw0Vsheysw8DsdBIuO7pOCOG5KO9rZiV72j1k?=
 =?us-ascii?Q?stgNOE+PG+vFuHmJnejDdRyv+a3noLjcGXXQjh5HHlUjWEGTms+L1az+1YEB?=
 =?us-ascii?Q?6e+3satnbYwGg5rnIag2/IVvXMd0WukjhBI0T+nRI1iw5PUmH6+t9923hXhY?=
 =?us-ascii?Q?b5WWGtnm1rTnNMnVO43DwjxtzrbFN9E19GLTtXZONDgi4s278xJgyCoHBydW?=
 =?us-ascii?Q?CF/4BJzd8jwbjFawCewJ2O9fieJoziRJ6/2T7Pj5uIPZjWRIxT2C5kN9sFVL?=
 =?us-ascii?Q?om3M8IGwxRf9RfhoWR5T/kJAuExTp68ze+9Kd3g0z7BVxG3orxtsn7ncKbRw?=
 =?us-ascii?Q?u2uc8VJjqE6rfyNbVhtgMKwmXqFZoWoNrlmeBG5qKg60cnybGF2r8tT0vgI9?=
 =?us-ascii?Q?99JD5eEui+F6jQonTLzhMXNZoWTNpflDLNejSsoXzSirVnaBzuDbLZMthj5d?=
 =?us-ascii?Q?rmSDZZ37iWe074FelHpTCh8BaxYlARR6slD1R91BwcYUyt95CzgIo1n8EHv8?=
 =?us-ascii?Q?xWB7iwNtZYaa3Ter+uJIgZF6yp3Zda2EDotL6Rt/K2TJm81lddFxpqnov6vQ?=
 =?us-ascii?Q?9wdq3v+DZ5O01xyn//SSIPo2pQ5WHmUerriyK08UH3LmQEr7SLELuKDPQWSy?=
 =?us-ascii?Q?u1x4HHdzmYxklZCGiXrqaN2fI1Efz2J0X1zgwkJy+kSEKoMNNZT2iETB52Z2?=
 =?us-ascii?Q?JI8egV4Kb2ipRYDo4gJEBG3VPO8wnxwqnMo7SKMk5nM2hpWtqALYdsrq9zOQ?=
 =?us-ascii?Q?bYAC0KeOSHASwzLKf9FBNJUa1P4bz3UhHRGE2PMGsF9/j5+ineK4oHnr7jGg?=
 =?us-ascii?Q?BZEGtPk2QQ6948sm4ut31kdSFC4ZZPIQeroIy5SBhPrmt3bvpBRi2387A7aL?=
 =?us-ascii?Q?NBFg7rqbknbtdmdb/GCLrBjOZvpMPnIOL51+Ugubxw6Z8BoVMKa18q8lWs/k?=
 =?us-ascii?Q?9fNyw/gTh8dDgeUNcBot7J83VyQyb/1nYQ6/4T7I1peBvNrfTZZTK1IvCPOA?=
 =?us-ascii?Q?vlrb8QuSCjxo/AQoywpgeHtdArT/NaeZSZ83JD/0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D/LJmOBTLzkWB7eMrSyHYCP12rqbzMZGXBBleSsC/ZzYzkbzg+vpsksSJI/Ab+PLp0btDGTgwvanAjHwxlrm75lGreghXp9v4eN9KlguLZX367CIc9LDCR4sqN1j5rWCi1tluGPWqHO12A0ZvLOsf8FeLVJGHmqGMc8tcFwfYhXG0bEPTKpCuZO9PwNxaytp4yIpkbHPoBO6Rs6UZ5uHo8PTuq1p/iWTrE0zXXMOuE9KZn1h5NYPTHOU84P177AmbBo+J2JFs21haIXsHf/wAAoXHJZIE8GfGHz3XMl4l3x3MRpnNNUVtw1HPR4xF5h+prWRFllJGP/ExiGZ/pg49jmEn4UmclOAinWmZQ2YHzIs/CCsLt52TVwXUhfgYVHMSUQ6BTKrDE20UFlSmld3UYl8a4piqKwiXySoJY8uwD6HzWMy2U2F93uaI60YYORnTv4JLXbUbEAuxu8ZscDrAITsmOxOK1DDjzGyIASTe8RyIUgbObsQT1jqHY/YHOoIXUAWiL4K6iY1ehT9zyDKjAbqL89q6vTwQ3Np6qyIw/nQg02F1Mdhe3Gh+wAy2mh4uN2v6uLWgqA6Q7EAX8LbRel+JWS9DAKtlz7UXV+O45Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a622fc-92a7-4da4-efdf-08dcfd063a32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:23:56.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T521TzdXrlJFnMlPW5a8oLIu5H5FtCfADJEwILcNzZuqo7LrKiapfH9Pn4DdjAC0D5r2lzSJTKQe3Ffj1k0YFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_17,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040158
X-Proofpoint-ORIG-GUID: 2bRVogeWxj0Wn7hNBk7oQXGuKEQnXemc
X-Proofpoint-GUID: 2bRVogeWxj0Wn7hNBk7oQXGuKEQnXemc

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.sh | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 8d18c89a4..25fee8553 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -99,15 +99,6 @@ if [ $? -ne 0 ]; then
 	cat dtrace.out
 	exit 1
 fi
-echo "my result: 10" > main.out2.expected
-if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong when using DTrace
-	echo === got ===
-	cat main.out2
-	echo === expected ===
-	cat main.out2.expected
-	exit 1
-fi
 
 # Check that the program output is 10 when the USDT probe is enabled.
 # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
@@ -115,7 +106,7 @@ fi
 echo "my result: 10" > main.out2.expected
 
 if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong
+	echo '"my result"' looks wrong when using DTrace
 	echo === got ===
 	cat main.out2
 	echo === expected ===
-- 
2.43.5

