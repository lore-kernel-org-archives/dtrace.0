Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894334BA25
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758218651; cv=fail; b=X4wvBoAxNN2s13Yd379KGU1JvegLLwaB58SzOtIKMElbIHhoUwb3kemX5HJrclkty2JEXQmRRQwBUpyl5yBIdPjY3wztfEK2i3escg2l1+0S/hcX5uhXAYZoXv1NaFR6ePR1UTDwehhztI+t2F+daPUTHwcyxZFAHj7Qaa6JarY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758218651; c=relaxed/simple;
	bh=BbClotcwVF4AFPxjN12j8uENPHumbyxOuE3k76xt8vY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eJ6KmVZwL+laKazckkzXQ7AT97oFqnjJBPqEqnhm4YHqv3maww0tbKnc6LrweQmtI96ymkAabDaOwnKJ79lLQrS5gPoOYxeaq4L1VJQ+A33GUyaCY+V5gM/zrVmD8Dr94Fn6aSACTCoxr6UwSj6FK+fiS+SnpGOj27VAgSEJ6fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EOUcB5+f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sON/AcNs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EOUcB5+f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sON/AcNs"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IGFxkV020087
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=t5Rz9Kw09sdOnoeXnP3E+NVrpGjrFAYsXE9DFY70yOs=; b=
	EOUcB5+fZ+1UZnZJlsu4UkdFrmJzwmHPzVAupJLnnkFPQIpxrCFhlcoWVbqiMotu
	l3p5YjPtgjIwA/+PrnJqoZjq6XS+BEvxJk+CgaXMAx1wrGfV9tDQAVJA94T8mec5
	H9kIMyc+HuV06ygjLMQMFoXwf04R0uuoo03y0TYPavZzyhGEiSTjfAT35R8ea0rz
	IzLcKAdDzrLa95Im8XL8gecEmQWHIzcFAxw7mf3p1LKCkvwgayGgNGz1B8z78srp
	hcu6ARXoIMKTvvnsKzJ1PCQNqWKSq7My35g+2u57fqDfskatyySZY98bKbzlg4yF
	P8VVxphqlflB7X740Jlf1A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx6m2tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IHAbna028813
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:05 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fgm1k-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvQGeAZJkiHrHBCqTdzF+B9c+NOLQBUXFX0g+TN/5mPX3fjjVTzKUc46egfik7opAsrv8cTIXiF8Pm/divMvzi1BZqb6Gcit65RK0ViJM8EtxWnCgTvEC4q6J4AiCoLHpQishx4+OfoFaxaHAYOGQtumR0J0GVTFZUCVsHXdI15izKPTVAMHUvyk99bbmga0cjz8XyoBBm7i79SM3qUvWPZAmbXtIDHm8/pefPUs4pkC29uOf6W9q0XU06Ugk8PJvjGiDAnJkow84EHPtFtdGMRcRUGNIlXKpdAOfGiEVmE9g19Dv1AzJe6KCJhr9qj/XZ8L4+u4GkLUCqCMZQ5+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5Rz9Kw09sdOnoeXnP3E+NVrpGjrFAYsXE9DFY70yOs=;
 b=gAGvat1sJe/qt5sKrjJnQSzvgmVxLJDUp0/zdPbSAqvMQWXlE2puKfhWJLZ5ETiFdJBv5lfoGASbWYJTwogniDOj20rt29C9W7E04viFkW2QAn255atVGuNSVW/9hIaMr/mv6sNs2wTNRZ/YVljXULpv3Tqs0WhBoQ5m3nIL+QJnRMKURPCb3nbdDsCo62CmFSuzmusreE0iL4cXfog8g9LYhNUmNQ3K5U6g4j/uY5cJiSm/PY3KTNEk5le2ztKfd6bRpvS+o/eYxh7S4cdBM4wV4mCTJYgXb83KJNsPAn6xBWK8c23icONXDW2bEbkUgKVKikga6/N2F0K0wQWAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5Rz9Kw09sdOnoeXnP3E+NVrpGjrFAYsXE9DFY70yOs=;
 b=sON/AcNs3A3BnZu2xAWXIDVGwuyt/n9GGVxjEzxTdXf716mAWYuKMM1spxfuWRhhBAk98xei8DBH2nuPLyW6csfm5MAUwQQqEtbAyO5hYvkjuF6gMnj9vIn+Tmk76A0pN9bTYxLMfHZPxU9shYOBUPfQO4NCfYGiHd+pmv73mwU=
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b) by IA4PR10MB8279.namprd10.prod.outlook.com
 (2603:10b6:208:55f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 18 Sep
 2025 18:03:52 +0000
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822]) by DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822%4]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 18:03:52 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] test: fix test failure when no /usr/sbin/dtrace exists
Date: Thu, 18 Sep 2025 19:03:38 +0100
Message-ID: <20250918180338.197827-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
In-Reply-To: <20250918180338.197827-1-nick.alcock@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFA0EC85B6E:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2b6a65-364f-4aa4-70d2-08ddf6ddb936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mZh86UkyfpV7HPQFRPkXGD+hFRF+yuDrwJpsjTV6BHsjhrpWRDpKghw6R4j8?=
 =?us-ascii?Q?X1YhmVE/l8YuswjrAFdHnKVt2G8HNMc9y66UwJ5REF4nLo6fTGX9DRMf8FQj?=
 =?us-ascii?Q?SzGWCLRXYom7bvD6EkLqGcUf0uvmlFAyCfcX5TCfUtcGTXe3+m/ir8NpQD5z?=
 =?us-ascii?Q?xukgAUuZH9uCEVWnmCPnxPRCOpHx5/mZVQJEcvyyDhGLHvhg8JYGPmQtgFSm?=
 =?us-ascii?Q?MwpnC8ugYuNoJT07b3XnVZ3ouujTgnf1NPpwxmf+xMhssRFIt79sNmggkrCZ?=
 =?us-ascii?Q?j9eNFb3Ilg0undDi0OnkiXApDRRHqRZW16oWYDr0VxXRz0Eos1UI3uS+Yzq/?=
 =?us-ascii?Q?2JYR/BuYkGhly5D2M1STIg9TjYpJl4IKWVA51dcRkyMWj/crH2X73ALt6Wc8?=
 =?us-ascii?Q?VvObRjx0IAXnbCDhNUvH5HZWJIRz0z6740dP8ujSZyGC90LooXxTASRMXLB4?=
 =?us-ascii?Q?5TcWIFaPeMlgW45APap7J4jbAfgAka8juECPktNITI+yNqdWuiIJ1KDao7bM?=
 =?us-ascii?Q?SzqwWVPcfdyo3P+uJAFN6w3w2snHOwvfJaR9OEkRK65QFkrAfkkBr/kcDEXy?=
 =?us-ascii?Q?RmbPCs8PB5xsx0FsT47TxVhOWAI05d+7e5Hnmqz/6yIw4rrOfiuzHbGJCLzd?=
 =?us-ascii?Q?kidufVs/7YVtMoACmIspqZ+kWJN/3WnB90owvyLnUzLhAaSf40PEugE/bzj3?=
 =?us-ascii?Q?D+elfo9WFhYJr+19bAYzfWtSywfAIEniUX6NWIHibAzQxGdLadWn/x6IfT3y?=
 =?us-ascii?Q?fkStgRJfr/NROYpxd+bjZFPNRl0U38saWfY/ZggfbDAzhu7nPbyElsN3Dc8E?=
 =?us-ascii?Q?f8E0c8kCJLLlYtTwlajSshLtr5sXNQXflImcGiwF4cfB0I2lsFyb3JegLknI?=
 =?us-ascii?Q?nP7bSM5Z9Xpo43soxwRzolB0v9jxhMkiOiZKfcA1TOKkPG5kOmrK/5QZ+jIb?=
 =?us-ascii?Q?fOhdrEJyf0m8i2d37IQu6QmPkzUvt0nP+zT7b9vT2pLUtEcXNnAihqB/Q+hW?=
 =?us-ascii?Q?MoGXLxLcH4ao6ygVb7PEggh0vpvIQBoslHWHvRx2Ul/w8xONuj3DmZ+DX1JM?=
 =?us-ascii?Q?UJBQMhkZ5urVc4Imt5JAd2n2YsSWhBVNrUgUaCeGmtaK/elBFJLkTugEY7MW?=
 =?us-ascii?Q?gfTxR7AIZmumNNKRIlC8VssaDjtEDEy38434+m4l7l4mvFPbQmxTesstcQDG?=
 =?us-ascii?Q?nTyHLaq3nSzjog9X4mfaoBjva4aGYpYWIZHVOPE5Ogg3R4YfE7F9UJpN3mrJ?=
 =?us-ascii?Q?26u6VsfMdOly+hMuV2p18s+gdySqYIMd2ayzGRXX+jgYsZyB/+fIaxqE2hrq?=
 =?us-ascii?Q?1JDf1VsuMxcQHhO4wKO8yKjLVJ448nFedaUHO4sV5yeneLEZiUFn2v/QmAzk?=
 =?us-ascii?Q?ekXW/QUOBbthmAOmDlc7G3hjveNJ4R0PA8IWwtPpyNSFtZkV/9MB0lh9IlZt?=
 =?us-ascii?Q?37/6QmIoupk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFA0EC85B6E.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0aySq1VY8IXkprzsiTqSjW9srkmERNAmfgZ/Vdx/RggwozPh5rzd83G6Jo6W?=
 =?us-ascii?Q?GLk0hn/aa4EW6otjVfwPSC8Rdyrtf6wq1FnNTMRnNtupQqZeWV4s2wiqlZHc?=
 =?us-ascii?Q?UKFmXtasQF0juFSbpbnOqVERzPHqo3DFjRyuU3KWmKXalvQlche3JkpPyeRr?=
 =?us-ascii?Q?etZkAQpVWdDBZqJirtwQ/xCArEP1bFPMRyaYLCQNOJu9kZavr1aoQfu29+Y5?=
 =?us-ascii?Q?pULxSQciGpmwvs2ybanzsvyM3FC5AJgceQhfh2Y9emRPAzoLhATq2XdGEjlu?=
 =?us-ascii?Q?lCrNKT1OhOCfsXgQCRX3cpIBuV6e0s1wJBo7IyHxpw5T8+wJc4cFrTwplit5?=
 =?us-ascii?Q?eo53B4FVNiEGDxVo1iSnxcrK8Iyuc5vvs7CQr8Io67/rhNfMG67DpTDY0vG/?=
 =?us-ascii?Q?Q/6sbT1MVV/HuzdMb/tPSTPEul+r31oi5hphNXu/8URk/shOyjKV3kJZp6YH?=
 =?us-ascii?Q?0NTdYjuvDGnZvG1DWOFVi2/KJl2XQv3kpMhXTfy04dZDUONZYXNkxKPxLwiu?=
 =?us-ascii?Q?9SayuPxShY88iGybI3OffTD8MDpQJiSrx26yrq9u86Euu3J0DXOXHyMEszVi?=
 =?us-ascii?Q?rY+lfEmnxReFqnhsCm6lPH/g5P9Dg4ZNdw+YcHLSBTDVNNhUTEKH9Bb9BM5W?=
 =?us-ascii?Q?yUG5wF0rznUyBet61rtcK2XqWeFEjE1uS012JElC7V89gJ2Ka2JPm5iwTWvQ?=
 =?us-ascii?Q?ey+zW56l8Dyve88V7Vl0L62MmjU3pRrisgCGtj23ko6KNQZZQgJVTEh8FQee?=
 =?us-ascii?Q?fMPVOEOZFhq+AG6+DgIbkKcF/F2eCireZsIXzfOI9S4dqmqBPVgPnUKa+1/H?=
 =?us-ascii?Q?trb5zVlK0tN9DXq/xZsMwz/kwggIaHpOnb2b3IphKFZJTg1CpIN2g6UZya5k?=
 =?us-ascii?Q?IZwBGNjTtIswgVPxye/3hXoJXLN1fQXavqJP/xybUGLEVK6Bx5FjHoUBi1dz?=
 =?us-ascii?Q?/yhSlmlHYyy8a5K0SY6tJm1c2vO9nmJrTz6BhlFr/NW0q7/iMYosIFrQOh8N?=
 =?us-ascii?Q?yam03V6xrK7dlt5wLq0pta8xdjZd+2ptZTnwV+LPkPvh295oGD/I2IJT5fkw?=
 =?us-ascii?Q?mQYYZg4Z0Y9uOoXriIJyslm7ng42o26xByUoBIctMuzOdZaamfOqtr4YjdzK?=
 =?us-ascii?Q?kAWOG7qaIc+HoBcvP/P13BaD3IUj0al9A/cFCd1CRvhFph5hGp8mss4S8LvP?=
 =?us-ascii?Q?V1TQdqd861Qt313g+5snNVOp0aOBZdcn9X6XBdpUUBs57FbWJIBlGBZn/NZF?=
 =?us-ascii?Q?msLNZcjvf6yl6PgBKBHrWOCNFIIeHYDsIA9EuH1jR4cS6zNtZ0sUseKplcom?=
 =?us-ascii?Q?bQekCvUBAblvNfhCZ97tILnKrxOo71qdh0fFXSTDmcKxQmcYJyPbdP6n+Xgr?=
 =?us-ascii?Q?Z56G0J5sHuOnJskNV2EjCqsnQWlm3z8LH07BN7mdpMiPraHuAgCF7odoa9mi?=
 =?us-ascii?Q?ky4e3ZJgs0XTeXzkXSP8rLL7GjVGkW07N0lkvTkmKOBJBsXJu5pzJwiEwSRH?=
 =?us-ascii?Q?7biTpA63xwUBVB8595RzMXRJhN4sjwL1a4QJYXTeRFuCNBw4XrAM7X13HQlE?=
 =?us-ascii?Q?3L+VXE8jt08d46DgnPGcjMGp8CG9uZsLONpnmRFGLSAzRTFdhOCffmb184Jk?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0Uf/hpnWt3hoXeASYHCefnhlSbKCaBIxk6Oa8gApIjiSRumfvHwx5iVCJ1xDCvLolGnoGTsBcKySi114zG70iFrJq5ejABYVlEs+tidk/rGzkUysLU+cNtGzglVtK3H4oBKqjgFtreOU9ZaDhHIZyOv0kwUnBb9jxsaqe6F5sTIDEOrwPKd6z3bvknA2MCZr+lbT70Ur9GQNpxl5sd6zIRIewlRbXMPpBl4poe4lQmxcMFYdV1rc42HWEj5IAFptw9O89hRKXPBzePK2O7Lqsfbx5FvnVCcgdca0voEafs3hm7WFt/N2bxgrhmSSoLZU8K+dw4kBYiT4G7YBGVr0tPGecqsHtqUc21WJQbsCZqD8jPu9i7ir5KRrH818Oj2zjb4+pYQW76AjgzXOBzz5GME32ro461ypf5rU+ENqEOh3jR/qoLPbGyu0ercAiZ9YU/U9BGbEYQOhB2H8arETEsNDUkBXdP7SPQktHMAQKvs8xlD7h6BVoVUPcBSEKu0rSdzVhvFLyBoD5vOSscqmPxxATtynCdGIGkrLCkCaPPhYXa2LsscB96Eu7J/gs1wup9SOOMhf2tsJOJwf5B1O06t+CQQv8qL8cPzk9koCb4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b6a65-364f-4aa4-70d2-08ddf6ddb936
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFA0EC85B6E.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:03:51.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1myJ8unhtrkPahmO6bOeORC6HiOwu9NE/hZjNCNxuUOrs7g4iIaxgu4xbFbFkbay/hPqSdrQENMxoz3zb2Ehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180160
X-Authority-Analysis: v=2.4 cv=TqbmhCXh c=1 sm=1 tr=0 ts=68cc4997 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zj7MPgeaqOmcQ1_OYVkA:9
X-Proofpoint-GUID: 17LFVPaknNCr8Y7_ZSpnjttSG0H9lgqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/8zfUnDvMbSB
 XpmRwwAO3UIositPkXzBU/Zn7yZ5Jz1/19c1orvsCgXI/BvVXRcGWUhrRyyyGTpAohVmWLp9HUZ
 IgUWFwzmKO+pX+5iVQ8BhybFIzn13/1Gf8Xr8ijNWG3UcmESxQc7hE8PTZrgb9HOaDlHPAhPaIh
 6A4MbIIEm3DfRTnZSJ68rMN6QuLFHM/hr+vc6lxJTgZF3/jUi/9jJCDTfVrcN6GBNhxGrVk8yl+
 iPLgw58nLWtqNkKlOFWd0uRmNrNFhPcmPGVGsl4+GGV/HRP9umTRXgNfl5gX42f+4knjerchdjB
 JOGKw35/aC4QwvBh6KzBTyVrqT1xcptZtJu5fFjK5H1d7K8zgQGVRAaTTsPrGaxBt6zKjO1CtEi
 hroWbA1N
X-Proofpoint-ORIG-GUID: 17LFVPaknNCr8Y7_ZSpnjttSG0H9lgqx

A missing $ led to this test spuriously failing in this case.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/usdt/tst.exec-dof-replacement.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index b7ec5f2dc5e92..81833cc8b77f8 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -33,7 +33,7 @@ provider test_prov {
 };
 EOF
 
-if ! { $dtrace $dt_flags -h -s prov1.d && dtrace -h -s prov2.d; } then
+if ! { $dtrace $dt_flags -h -s prov1.d && $dtrace -h -s prov2.d; } then
 	echo "failed to generate header files" >&2
 	exit 1
 fi
-- 
2.48.1.283.g18c60a128c

