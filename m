Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C41266560
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757714256; cv=fail; b=YzkkBQLxYbmWSM+gQrm3s7f2kczrWn41QSmiw7c40D7b4iST5TFcS0dicOqTwnfmBJrUu/yc0Avis5E2g0721g8yKe6DW3Qk6tsvB2cP4b2ehnKyZLpuoGHKrq4BlWiGoyPT+yH/lsmMUORwpr+6tVe/WjCCwW8j1XAqeFbp4KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757714256; c=relaxed/simple;
	bh=nExPS5UvSZhNxXMDG85COaja5AZsI8jo5rrfVu0TgRw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHMvpP4NJW9oYy1fhNXwiki323IPNlSQaSM5WTBBcghdTqOt6hGUG1jTfATwQyWwhDIUTPtwaH+v5dh6OOuQkaC3FiOP8b2g/cJylD0nl4GG8do7jmW/QdcdEm5VG2PkfspqLfYo2nS9FwLjMYYGelh9AABM8XUgmCsXncENUW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XaRUbng7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EYbfVvJ8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XaRUbng7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EYbfVvJ8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CLgGOs000887
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GEyfgmjIq32MOouTgKGCKWjKD2tQGDZw3GaFZvTzAq0=; b=
	XaRUbng7htkTewbdFn0+we4X0XrZp+NxDJGoDuxZXfU6UvzQtGOsKv9YHmuzfJil
	RoP/i9FxNcit69jpNyCIVtPNa7/dYqvp/02ze1S08tPuPQ+6h0q/ABidM4gD4t18
	ZdU1LYmiyiQ2RZv6MNinrbSuEfMP6/3qjUP3xm5kQ8CToTWUwKz0Sa1GXL0/gQUL
	NRJhA/PcvUbwGVH5X3yhr7aBfFP0i2EsIjwcCEK9t5PZ22YV7q3LGwR/0jfEnr22
	FfipxHB/T9YuS8msCDMXRpAEh5Z/QE1j1TP78GuS0TZeeUBiDbQwDTigJcRGsp1e
	iBtOJJgiwU21DLiqePB1rw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922sj0y11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58CJXRGG032819
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:32 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 490bdfcym6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Sep 2025 21:57:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkCoYOMNGNjN6y438s2N83mDf6qyj+uk9HPs6eYAReLIG/sJxUFO0SFkXssD/LHK3HYSp7BtknCchSVS848ckzSF+kAzru2t5jghkD5qv8dBuKyeX0DCrXC5MNhcSRjz9okwtaqPe5dK/y7XsQqATlzxia4x3K8tvpbLKXs1NibRrPjXKbBf7+14PeyMnBTJTBXZ3qeZfZmXET5fW3UgFVatZhvxbopUvHEYTVk3Kio9yt/WBH1KtVTecNcnuLA0EZNZ7YL3TAcKmMzMeEjsgXJNGK0tnQLYWBKl8vEpRNAxs7PjLXlUSXyiK5ZIFPdu29aMkAWOodkNOsfP4fXaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEyfgmjIq32MOouTgKGCKWjKD2tQGDZw3GaFZvTzAq0=;
 b=LirNKUPYNpBlOBuYAFh3VSuL4VBC1WjOMMi3PBMYwwpNnDvvZQBcwgJfurSt4D1dRHXMb4iFm8SZnJPFQ3CcUY+bX2NHrxK6y4lxNIasdFDCA2LcTnZAL6g6bzszPgGO18GO9IiTLcv5n+OY0yGn1DNeX3oxD9bMFr25ROeWPKhKYMA7a2c5TEImLggfsfM1ZArrMr5pY16BhVFBkd3CHyefvkYPsxvZM/71DtYqKjUzn8421K7gj8LKncaiIYvR2B8DS/J7LJwkpLNCvQWNJwV06agLr875ySEnrFXdH2Q3n1kn1TIxi17KHLRpShmykWvSXEaNzSpvtFkuKsbh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEyfgmjIq32MOouTgKGCKWjKD2tQGDZw3GaFZvTzAq0=;
 b=EYbfVvJ8EoEdFQ9+aQvJHkzLE/Eh/ZFKLbNY14UFO/pEeU0mQQNeC3zo5mkfI6tMjKP8IPvjDvGJFYXnsFBttDUBVef2PDZBKcwa7+ZqrIQYBzxzGR5zT5NC3E2pYhfev+/h6cX7ZzKeXf2pMecxmataFPdgyJ8N1D0oYu1xCu0=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH3PPF63308C95B.namprd10.prod.outlook.com (2603:10b6:518:1::7a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 21:57:29 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 21:57:29 +0000
From: Elena Zannoni <elena.zannoni@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH 1/1] Make sure the doc dir is cleaned up on RPM uninstall
Date: Fri, 12 Sep 2025 15:56:58 -0600
Message-ID: <20250912215706.1109973-2-elena.zannoni@oracle.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912215706.1109973-1-elena.zannoni@oracle.com>
References: <20250912215706.1109973-1-elena.zannoni@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0089.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:9::20) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH3PPF63308C95B:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1030b7-e322-4ccf-6a83-08ddf2475e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZGldVPQvbJJa0q7Fd3qdBXR91E3sAKBqO9j0C4cx2F6nwtHhDRnkCWUV9oLk?=
 =?us-ascii?Q?daHrmqVaibcq71jm3IUtrO4ayZC8uIsBTOPpagPWAgooGEUUNczNRdam47jM?=
 =?us-ascii?Q?Iz9H+XulRbhLYojCgdeXV7s4fOtZDf2XOcZUleVUna+IEcqXk71yHnx1ab15?=
 =?us-ascii?Q?Ka9AeLF77R7hnsG4fcTjJW2TAnXGkMIcRNFC7lFDTwSNsAFABcGoamrheVhi?=
 =?us-ascii?Q?C7Sc9Ijs8yK0JERrCfFgAqoj3n2w1T+NTCW1q1FtFj0ME77wOXLisw+zoM3c?=
 =?us-ascii?Q?2SSuMhgynI0KaexQUpIWnla3NHnZMN4zbQG/wkTsjoq15XlbW1qDiGDbSInd?=
 =?us-ascii?Q?llLx+eXF4bWHa/8vTCbdxNdXKrjSMUb9k3sBHlXvSr0XTjhVCtAxvLAWHSe6?=
 =?us-ascii?Q?vgHOuPyQSE7Eolh8G4v1euD89PKa25/v4gQ5ElScUGKCmvcMxQwMI5PlqXQ0?=
 =?us-ascii?Q?S7Q64cbraPuJt2MyL8/bbOEGqgwUYC6qYBoAo2DX34RnrC0dLGLBW3S80kRP?=
 =?us-ascii?Q?T1PFk+wjqXufBCgz9GSlmi2MXNGW4wHmBtWNExVfHZasxpMS7lvZszyentMc?=
 =?us-ascii?Q?9Fiv5bwyAPi7YDR8tFGokpJN1ydagoNPZNQUH61c0Eb3xSyMyY8faRma3yxo?=
 =?us-ascii?Q?LgfdMHBfTBVR1jfoctiQU0uZUVJ1lgUdVHsmBjn0duCi3TocnJnx6eAegYU9?=
 =?us-ascii?Q?xS25me1wxl5CDMgGKiqid8xAZH0b0bf0m7RkxY7A8TEQXC2kST93wovkXv8T?=
 =?us-ascii?Q?lgP2vy2l5mLTE7rLN4YouphhDjLftqt2C91fEHb/MNUxXG5w2UK0eQfxw63V?=
 =?us-ascii?Q?CC3cZ6MP48N582ptWXogu0cHhoi/mERmNexn/EjVpEXe5SfjCuh6KH78isfi?=
 =?us-ascii?Q?EmScbEEFJeSHSNrILCuQGJ5Xq6zLAT+Ad6cxOs/9RC7r0DL5H8IZMQ6xAVaP?=
 =?us-ascii?Q?WoOpx3tHLQPgTbb36NLIhmku6vVI06kacw+1tVmHl77TnCMsk4RyRhcaog5I?=
 =?us-ascii?Q?9YftGgad1q85HiDjhOxSkx5VTHxrR/MRUx+AbIsrYyEeUGdt8yCdpeZ+XC1V?=
 =?us-ascii?Q?uQf63y2ym/r/Ziwov8RQQFxx15+u3SUNSDX1wxQ5PRm45jGsECD7KViDU7CZ?=
 =?us-ascii?Q?1Ho5mpEuklgxuf4bYMcatlxllTLMxOtM0MIJhoWqY2qzE9DMG3OGcVcp25l/?=
 =?us-ascii?Q?7jLqwDddwqVvwHm5m93w1JsYuDJo8tple1sgg3dRUcOunNoatCMMBa2tVVUt?=
 =?us-ascii?Q?4jeV/sk7Izr+XlRM1sQSvMQK7KmZOn9XSamg/8Fw3/bQdD+FNGOJBk7J1s5j?=
 =?us-ascii?Q?nuq9DOv5jFWla/4Do/2LBVavR+r+g3daM5joFrRo4QAh28aUvSkf1gvEwJ1T?=
 =?us-ascii?Q?Dy5Wb4AyGK47radtQCvjtQ8zkSPS4wQ7kwODwGKCX2uPvKrQWMZ81d8sTbrq?=
 =?us-ascii?Q?gRUny+V32F8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3lNEASqphb8+tpBDPPelJRe+rGEcXzqE03618IODzyWIrMeJPYDaZ2Da5ZFg?=
 =?us-ascii?Q?EHEVyQrKX2ctQFpcWf3Cm1KBDG8v4zLPP9eQc1nbuwcnPFolYLDNjWjCKEN/?=
 =?us-ascii?Q?9+8/gPyqXNTRNYSiHQ/4GtJCbmpoFH88zrJFZRTuozrqJbarX2YWnkTq0D9l?=
 =?us-ascii?Q?WoGQdS3MRWuGkNKYzyMpWNIN/pEWFIrXlQL1lz1f5Z0/UIop9HvvGZVRTUSo?=
 =?us-ascii?Q?FWtTjkiEbSdnQAUvL2bi6dGIdFjb1HQ1a8n+ES4BmEdY0KKvrg2Rfdh/uuBQ?=
 =?us-ascii?Q?Lhq4W2/rpD2S3Qd0LhmGd3ybFp9DpoZ/TzhkcizAeMtJ1+peuoD66M9IbeDk?=
 =?us-ascii?Q?R132gOfn1lZ0XCsCHa6QIffTBjt/YBNkBmigrVxQXwz2taHlLAe5DBK1afHy?=
 =?us-ascii?Q?cvfOKV/iQT0D8YQEnINFLKoSVGgS/eOZNQsvNl17KI68thuoVL7iwCUdi4l0?=
 =?us-ascii?Q?v+RjWTXll1dxuAtAqpHmYpcRy0dBBcfwzzIkPmv0msbNJniR4fpBZH+K4+t5?=
 =?us-ascii?Q?ldIPqGoJ76PKUhA7c1nEc0PCIkuFlpKdF13kxNhpogAbeJtr2U6EBumpvpcc?=
 =?us-ascii?Q?Yci2bIqAbnbOYggJ/2AgRZISqpvezjoPP97dDc/MJPYFYgjabdHk39FqSQ2x?=
 =?us-ascii?Q?gHleF1dM9KoAg9AgDNk7j5et0G2BuPjIyum68nzvQwzklj5PIM0lKMdqz4yS?=
 =?us-ascii?Q?/E20Tb0rDSwB6OcO3vDTlAD22JAD8BieINsytY7QcKRGOLpaLs8sIobXV1Zi?=
 =?us-ascii?Q?h862d+WUH9zpc7fIHGkrgVD144i5HbRxj4gCFcMmxGGtbWYrsYiQeo3JX2h+?=
 =?us-ascii?Q?Hs38E7Tc90dThIhSYhewy41aB+BHHpXT0R1VXDxAQ92aGj1TsjuOlJC7Sw0+?=
 =?us-ascii?Q?XhlrCJsS8vC9DKfbxmC/lbFeNMLTX3B/yPPcLXnGEAaqUf7TpDy4vXajCxvT?=
 =?us-ascii?Q?eQlfVj5PPiqRL1NRuRhbQ+2pzYkDLFXPNfJ+NXwaNcWEySPSYL5Fhpf6sewu?=
 =?us-ascii?Q?aFupGLgVwPIlC69a96yxuVrBcmsRgdj+GJSOQJrDhXzTstRT1cKBzj1Uzdae?=
 =?us-ascii?Q?nm+leH1FLS0c+yrh5nEctRBXi8xMQm6dXbayFJd7rSqCUL8IQRgMQR4B/kO4?=
 =?us-ascii?Q?luMyO3H1UcYp/Cp/5rbVSqD3TxhEjEnigvECVPdy91I6/ZjXVBH8qu/nAZkb?=
 =?us-ascii?Q?tVLmG8rfj178Z3pxAo5vECJo5zkwrYWo7fmkx24kq9FdfBJpZDeafboPcDUJ?=
 =?us-ascii?Q?dDSkg4qATvWFoWcfjOztdDFU5Mi01/Nyu+iEZanKgraUwUsj+GS7vhfzzTa5?=
 =?us-ascii?Q?bnCzl6SpEkxnM4jWGgM5QsIDU4Z7IaWMfcEivKF1nEDSGRX8Ay7g/8Xx2tEU?=
 =?us-ascii?Q?E6vGPz8oUFM5tAWmfwgNyiEmbPkO4BqOyrTpAEi7bctFmtzL5Bn2DiedBefv?=
 =?us-ascii?Q?2/JLc1bYMwgd7xl0tYxrHdVvrlPnVJHKgtbl70hwGC4Ey8I0yRFVGWYy+W7B?=
 =?us-ascii?Q?gXYCh2saXgPGfp6U0gg0uU6RIYU9aJ9RLQOVUJ2dk3SvBDNHwDhmzzAfU1R1?=
 =?us-ascii?Q?BlNAE272ySM7aeuDiLEE4Q8l7Xh6kr4fdGAJbGtubQ2z3+yH6+iEfqnfgGJB?=
 =?us-ascii?Q?xPalNs1yHKmX2dlJjHDRaJE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w4GMYOqHb7tZDDtd9RZe9UjF8Q9TWUZqMHCZLZstWvUMzmDucQ0xxoT4q11zdWtxiWnLz46yW7kpsT/rpSes9AiTSl1usEt7I7Bi4KzlR2eb7tcTAZDv2OQ18jg+eR04MtHwoQs3pPHkKfw2cVUrT5oi+jglOCEJp+eoEpbl4a51wRn+z0uEkEWWAZ+M/4ZXeKwPKc0SC23kdvBDeuNeaucNMg3OsAyfozQSvqk7LJ+CT4dr0JqRtv+kUeeGAHuxzYJ0K/NcewxJlffMX6lsvjISRJMYbtvyfBHBSmQDdQklh3gCRB53aY3XXCWWeyDdZ9IwFVnRy00atPyLF7FtrnKZbvC28iydZ5ymkB6N4JJSZ2T/jmwB0Y+7GbhiU9jTRr6iF7va1OJWGVmqnKVVZ/w+9+Aq3kM5NgY6phKnNeVthLWoRA2mtjF8wKrzmlM8d5mmitPD8gGpbn677zw7L1yAm80fZej0tjjGr7L7QQMQcfHnkamVhTCCX6p2tZJCt9W/bLxzFHi0wi4xVWM9l7+w89ozcPLL5xrHsd1ISZ6/P8BTWNOScVeC0iEyrsAXV1i4YsGG6ZmNbi1pY8rwPQP5UzTrXrn/bOd5cNknwe4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1030b7-e322-4ccf-6a83-08ddf2475e36
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 21:57:29.4716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xyOTZCycnYcdf+REGiLHjWGS14Zn2dvK0VwXdEd6dtxi25JV/srZX+9J1WhTEgkT+0mbaJlRGtbX7GjID64HG190x5JoVLHO0Dxl5kLDJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF63308C95B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509120202
X-Authority-Analysis: v=2.4 cv=esTfzppX c=1 sm=1 tr=0 ts=68c4974d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WRDVYJ5r6RYah7UemGcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NSBTYWx0ZWRfX/TImjpUmbcRl
 lPJUepGBgyFsThe+b6xiuLM34HF5S9kU/U/qX5T/nQV16LjC++eS47mFuAmSsLvA4zBx7DNcz3n
 aYOfePzDbXkJ+Fx7IPd8C4e1nQOn8qSPPv/zsrCLG17ABcaHwf5Z5b/q17UciUVYUpe56JkfRbu
 dMUu/EMjMaFsWccBFRdg4yRDmfFglfhB97Orv+gG7sbSnvSGMNRq/E5R7zc6XSWBX3ZluPdmOCc
 EBwCtmN+yU/v3NYRChi40WDKDvIIKqSaNEsSwYUzCx/QesRQGK3w4haWW4IEPsqy5B72hoOCaR/
 W5zeTAHhwk7QtZlRvXczrBonR/SkF2y00RjkTT5gg1IV62+Lhgi8JQj7Ege1dhrQGqTPn3PVbZX
 W2LkPZHO
X-Proofpoint-GUID: dcf7WE0EdJt82ZIhCW4n5gE2Y2tIFogk
X-Proofpoint-ORIG-GUID: dcf7WE0EdJt82ZIhCW4n5gE2Y2tIFogk

 Add to the RPM file list the entire dtrace doc directory,
 not just its contents

Signed-off-by: Elena Zannoni <elena.zannoni@oracle.com>
---
 dtrace.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtrace.spec b/dtrace.spec
index 115cea60..a325993a 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -211,7 +211,7 @@ systemctl start dtprobed || :
 %{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
 %{_mandir}/man8/dtprobed.8.gz
-%doc %{_docdir}/dtrace-%{version}/*
+%doc %{_docdir}/dtrace-%{version}
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
 %{_presetdir}/50-dtprobed.preset
-- 
2.49.0

