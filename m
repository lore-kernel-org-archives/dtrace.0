Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8E626CE2D
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484940; cv=fail; b=h7qSfq+yC1PMF4628qrXt+NDF0CPr9/6UaGpjeWifM0KQhbnfy5CSmru8sWMqYf6tRzPQ/+mfEsWte/q1VOIjFX4A1lC+fCtuCjSj4sgF3Qyd+adiVmY/8z93zI8xtpJ+XufuvbbJ7Qlag1TsbDpuW3He+Nnfe4sWnPx2ZGVxmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484940; c=relaxed/simple;
	bh=jXydliN1VTmOes4iqQXpOsAL/qloYYQjv/+A64gRCy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oum+0qyBBHfpS0mC40E1LOCSHP8k56hHTCwMEhYUvLzxIAprZqf82rBp2NyUahXRMuA5OORQNC5X2EbyI3jScNSZB8iNq8O5zs6k+9BDv6z6DB02LyRBSWGy7dH3Xs5cuK3DtSdWfDiyDXz/5DTCT1Isr8k2NmIRz5H29LwsYnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c0rwKTrE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H1OhWXVD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c0rwKTrE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H1OhWXVD"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIDRjum012693
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HKQEHGWwxZRrF0x40b
	EUA+oE7AYuWB8f4KyHllaxBUU=; b=c0rwKTrEM8S6ME4teRO5iFz1EG209QHfcr
	8rsT2ylSafShB+vPkOIUjdaLDY8x9oQBrCrWMmb98cSBCGBCJ1BMPVvjO7o51rKB
	CYUbd2I2wVS+ZA3Z6BoLFTTuSPruwhnYSCSLe5wR06Uktemeq0x+LhNsjzBGsL0v
	HguK9SBMRiFHiW2VZX4a06s45j2hktatCcOrQl6ZmIMcZ3beNZbp5SqXpV4xroS+
	+hZXuGjZVsjikHBG6mcjUZqwN4km6BnW5f2jI7NLLkeTBeR7w5w19nLIhwIYL5RJ
	7lyW6yfSylFQNPz95PbPV9ZJLhBg4cBtnd1YiGvEzM8vAQqb4syw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej9059my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:55:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIG5hvs039893
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:55:36 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykq67d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:55:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXbQbHpVNEiMWO7Yd6cGrL9nrYO6uxE9oJbwv0fi5JfkkugISRET4xu98srpmZPOz50/IUf79krP5wdJdzaf/3w70j2A/4YJ6jrCDFEuMhqp8Uyhpr5PF20LWJg92yYsXkiAXjZpndQGhr+JJIXD5so1LYcgZTBosLHaaZyS6R5CizOd813Dtz3s1zeswlkI6VTkRVF9v6vTnpUrE6dPQPWEIGeijDOgsF7Q3DZoTGieLftGfWyz8HFNxTGAJQ7P1KwozMgPIVD/vGesbQbdeSDjp+fw0GKBVgL2bjUIRu7YEO9PYFVSvcDk8fTnFi91w+05hOwMHfWUQLgxerQWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKQEHGWwxZRrF0x40bEUA+oE7AYuWB8f4KyHllaxBUU=;
 b=jxuyDZwxGum75q+SW9+SVvDdKOPjUZV+PJwgNexgGwBmmMb+VT/J0JJFeH8eSoy3wJUqlao/bAP6BVp52gTrtlrh1JJJDSAJhntSXMYnYzP5slgCvBwEuan280UiOIUWiU68rb1f376a/aZQmrauWBg1xgvB/75eWXyN0KaBI20g2KCHg1IpoSJJ/NELKSjl4thpdpVqCAfU3T/0neeg7bd8VnnC0gf9oUE9ClnjX+/SJkM0OFwav285hYW6l17sHH49eI1xPDDiSDARFOQzlCX5QW9XFyEAaZKSN/bp0lLzolLMmm5n/n/IO0zGTtmTGsOIQM45iGFCbmN5Kgft6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKQEHGWwxZRrF0x40bEUA+oE7AYuWB8f4KyHllaxBUU=;
 b=H1OhWXVDKSH0qL1jmoGlBCQfYKFBxmsVhQ/GprCxlILjljVZsE+B07ixpEohdBogSYAAzbr36g0qAytnJqURW7u/bjFgqlvZQ137MXdr1tTYMlX65KmLpgmtrFkM6CwyMP+NQXuBMN1NgBVy4/CWGlGxvubvWYAUKvi/UPmgVVU=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH7PR10MB6354.namprd10.prod.outlook.com (2603:10b6:510:1b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:55:33 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:55:33 +0000
Date: Tue, 18 Nov 2025 11:55:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Update README.md for RPM info
Message-ID: <aRylAsWjIcE2cME5@oracle.com>
References: <20251114200514.27242-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114200514.27242-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH7PR10MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e2bb0d-1210-473f-1933-08de26c349b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ABwyH91vmaKifqUsWPReo1jrjFy2bpoqNcMPrhhBbjSMC2E3Xc1/CVhmSSeN?=
 =?us-ascii?Q?Y94hqxZfBIF7KdSalEkKJjASg5Th5swU3U2IHvHLPKfdijdKeOHNRYLiqbf4?=
 =?us-ascii?Q?i2RwweeQzfZ7kTDE2UMcmLD3JaiJW7H9PCmWX6S9BvIM+AzhLMkxKC9d5WBi?=
 =?us-ascii?Q?lyutaXLQJeUBGJFRoAbhysFvJQ1VjgvujFqofc2EgQvLPbCLAYTiPoZgblPQ?=
 =?us-ascii?Q?8Nx2UHU3K9C/0ZqXDHrSOzUx5ZtaEH1s4AAH43HW7/j7GBfBYsuWWEwrdpCI?=
 =?us-ascii?Q?1+gYPcvTc3U5fEJT5b1i8H2cXmVzfNSsV+cToMIPfl87goMBNmBXuwG32hkz?=
 =?us-ascii?Q?7r0DGvO64Z0MjJYtiUfD7mYoBBG7azuSv/+ChyJpRAafM4AcPSOxbozCYepK?=
 =?us-ascii?Q?5gOnpPGl5Mc8gXLdXigoh60JsLuUH9KQL8+e6hW/KOieFeIxdFwTUv0b2Nnh?=
 =?us-ascii?Q?uUdJl7nRX/aSqzQ+90KVC78NBkhpGaOG4+KsoBqJaI07SEQ6LyTmrSp7UhOB?=
 =?us-ascii?Q?vQq1JqXYEwNvFKWhaQXCzy2AEpSpKbgFDHFV2Lihw9kPvupgjcnBOFQ9hy/d?=
 =?us-ascii?Q?JKBLKI3tCFueHxKAJzWSz8SzNCB3zTUrWzxGw+J6f+wSJcDyrMabvpFCmv7O?=
 =?us-ascii?Q?V8nPMx8vDzOcm3/CNgD22tZE7fUz0VwMqqLzCxlLPa09by3hgpGOtsQC4OXC?=
 =?us-ascii?Q?qtWmU11oxQzzcSAk8ABQQ0ddLrgSo7/gLUn3KrnYaIpWnBUX6cBgIR5pwmyf?=
 =?us-ascii?Q?gQWkm92v6H6pad9xt1Gl7LUygicVPKDqh8h/Xx0fZmImaMkDEUtU9SmvB/g4?=
 =?us-ascii?Q?5jwuxWHBJAhtPj9O93MTHZSWBBRZ86ZAWCU4wAyWNuYv1M7NKE6WDlSgIc1u?=
 =?us-ascii?Q?oZ5wNb//MN/XHKYNxHuQe9V8m7syg6ZYb9qrh7XBij/HLHOVuoITwIFLYPhC?=
 =?us-ascii?Q?Q2d56xfIik9JdTg9W1u/9R/Jp4gjC34kZL1Vjv9nkcN3mqvjG/YiWM0ewsw9?=
 =?us-ascii?Q?6KFELjrbvHs0SFHx5xzCm0JJ0QoZLEE7KDeR2Ynv2Sa5+IbqhO5RrAr+7buk?=
 =?us-ascii?Q?AK14Y6wxEjsTJy+JEzehZ43a4pUvYsP182AhmCieAaQnIXYkFBhoRO90SRIy?=
 =?us-ascii?Q?gTDe746s1TEA5NGBhyGxYeeC4NTjjUpjf+WM+t3hokLZkjOZtcHXH3+dSqtP?=
 =?us-ascii?Q?tXD7+uXzSANVQIZgxTgyPyYMvXGKNI1q+hHYqhhah7r/3Tr6ewwW/jVD8FHY?=
 =?us-ascii?Q?t5WZh9LihP5VHEcqrhgabfPIWf7VqitljrxCf0ROxZ9E1HbeMXJf/TKHD5k4?=
 =?us-ascii?Q?WtdPJQi9riBadf0DagFwFkPI/vpV++mJsED9X5hp64AYkLyr6rM2+WATii8a?=
 =?us-ascii?Q?pH+RCApG/LPzuj7iTNPcaqB1x85FF5U+nR5GfEuE4P0LRhfLjwKxWCBDrbBj?=
 =?us-ascii?Q?eU7EjlM0h9Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IKsn/BvuswD7/85InB6t12l0Ocs8DhzBGMlAtsm+0iiUg3he+32On4+a3Sgf?=
 =?us-ascii?Q?w0HwmUIGajtJt5GS0MAa0tVhbaDJ5eHi/0CEYw+c9OKTGRq6mrWMs1heH5pd?=
 =?us-ascii?Q?y0AVhVNawQyzCT//Q9y6NGbsNEQ6MZ+KC0CD2UDailyGdO2mkasc4lcRdpmP?=
 =?us-ascii?Q?Rzvp66Z9ccTour0HmRA9isxQc769jBy5W2GZUYabCZ64SUt9ox5M2FFSC0tY?=
 =?us-ascii?Q?+M9pU4Sa0Ys1xcib3LRz5smRy5hJ2Nn0rANU8TWCmqPsYkSTan+MjEpMo6pm?=
 =?us-ascii?Q?gF3dbamSaJt5yEd2CYQ77S24XRb2oC2+4653ScYCedQ+oarU5cfQ71yclKS/?=
 =?us-ascii?Q?i+9IIGwfbVDbAmKK44WCBax1ZeH7AWBiCyylSUTu+YK243AU9szWW8a0RBum?=
 =?us-ascii?Q?jaxZjztCuY5C79YwZytxanf0Au9woq7D710S2f3loxHfGab1HlCfcak6xElg?=
 =?us-ascii?Q?st+H1kI5dfLoW+qxlJ307Tl9699ks0EhwmGg4mJ1r+RtHV1Is2BtASRGViv0?=
 =?us-ascii?Q?pNgCjzS5bef2lsTSpwQAhdEES4Smj7giY/br/kFtbJyZsiyVFAxT4t6TdBKx?=
 =?us-ascii?Q?RCZSF3Nyu/qxT2r0kwnEFiqUGFmkpFhMv4vX6olIV2Wz0kHiMjvo3UCU5OsD?=
 =?us-ascii?Q?UgFk1jjSK980zXUjfHNAEVFAa1hBWwEoFOyCgsJNFj2k2xzPGz8StXM2Th3a?=
 =?us-ascii?Q?lOzf8jeT9rXYuGjAp3hC+VE0DsrnSqt3uaiWqAgbaRQkYHrscEGY45rLfZZ5?=
 =?us-ascii?Q?twhB0Aa7YVDlRWMoefeqXQB+ZpvObgflpXvq/JQQnayncyDvS6y4QZEV3Q4w?=
 =?us-ascii?Q?/K3KYccAr7k07LBNrZTieb74/7AD0Z2+HwG1Hfmw5cxvOwMG+BDDgp3jLKFP?=
 =?us-ascii?Q?Jwf58Oelb7Y/NLVe+mJWWMyCgT9WsdmBM8/56XiSQoYOFchIPZwS60hnJP+l?=
 =?us-ascii?Q?WFUI0wxBpT0tIS/jUrbk+5TA9XW6APDqhLYmTggBz70lRMorKxoxH+eF/i1d?=
 =?us-ascii?Q?/0XRc7nTOJFgYkTMtxrHFtujYsyMiV0fE5B2azNiz67flUbk4W3X1aa0dmOn?=
 =?us-ascii?Q?icHt1oLaXHUxS4VQDIP8Nqlw0VQIbbFMhXpVyujc3rj2z42EvCjvCZzQBtz5?=
 =?us-ascii?Q?+DTKMaTx7jBQqYPahBJC10X+c+ryJSHabh8nmGxhzDABDSkRJbiad3TbnR7o?=
 =?us-ascii?Q?6CThvVRKf/+CQBNYHe8TA74oB6DFKhDgaIygRGl/JNHkNPsCJqv+e+D4gPKT?=
 =?us-ascii?Q?rxoiIwI/9wOM08zM5vX9FXXZJONY7ZQ2A8g7iYfGdwlSCzwVyWfW534JOPz1?=
 =?us-ascii?Q?nmew4EFnRXR1F9LtOheN+mMPmjokkvkC7NEwrAvj07kmQlkiDAha19yyHIfr?=
 =?us-ascii?Q?9njsninh5bf5xBmMlVjC9qFmyR0D9TUrePGjddhYZtfSmfp0j4bfOvW2oVVA?=
 =?us-ascii?Q?jMIaghIgggRr0U/jmfPNqVy2hv0Q52/f4uVK68QkOEQ2ubPBr/CLk7lNTHzo?=
 =?us-ascii?Q?hKzpjqOsvqzm5/y23QZ8d0+/s9q1z9c2rkxL+zlDrdj2rgL8hKZrWxnvsW/c?=
 =?us-ascii?Q?lrKbrWUZwmXhLm4jb4uLjsX2MV7puHW1b1gu1wM3V2MNyIkG8axsaEjqCdxa?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dZnQBSUImmyRU5SDifukNVNzD0byOdFch3qI2pj6o6KPNBlT7DvMUm8LjnMJwmoG7P04VpXLUTJBc+WcCunLiszFNLDJOn1SCYAq12ECSeBXxcCxEzzonP7YT/ZTX+MwSa+/5kEbShBWf/KlfvDwmwHDoHyzTD8mce1wUC2dc5PzYStlwzt5iTrM2MvOMjkZ4mVyQTdrZDuBCuZA5MSq/UzDZPZJZkPy3AZwekjyStBWIzTcErY6d2Qmnc1u3/+662Mv9+U6vr4Aj7vVcQDGJNN2rrFifoxUYmjLOAWM8hPZQcooV3rhxH+LAe+SgsG64vVd9mpX0ndHzDfR8MbcM0byVLUkpnz51+qmIsBjAxG1Hzatvrk212+w1W84cZQollJwUwjx/Y0VQffQ+H6yH/wq1iyxnVrrXsOpuHdXPY1lplBx4RDwfD/n7iN071TpWBlLJJV1DexaJdBwj+dlfjw5uREb9bra8ZdxpEs1CQlZJIy4b2cptqU1KVaJRN8VJIJKLF7byXySbe7zSCd2MiU6DTeOOFXiRSGBGG9PGn90d52WCJujNCv9EAfRyXJTRawgvT0w+I/+sIb64skNDAysZ6rNE8c2UIpwcswSP3g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e2bb0d-1210-473f-1933-08de26c349b0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:55:33.1537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg89SazzHRprqThEYa2rmWIryYmRUW1jVL8ahw0dzHGNlvdCAiARR9R0Y9wipegEddMBwC5Qoyvn/3HB36F8bbmMzEQ23NN+yboWhWJyw0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180136
X-Authority-Analysis: v=2.4 cv=OMAqHCaB c=1 sm=1 tr=0 ts=691ca509 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=lQUw4oWQ-gQhL0rVlqsA:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12099
X-Proofpoint-ORIG-GUID: 40PZY2VXTf8ipEJBCb1_vx5HlDSAQG9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX+CLEX+xBleEd
 YSUjhgOnKfgVLZL1l72Ranye6VtDgWgZEIb6WI4C8CI7o7AOMlo2oVuTSq/vETMH/zV52k6exH2
 1oVq2Lg6zsp9SbXpKWMbfIhF2Tlkf6mbshBB1c/iF+cRq2OFQ8LstvXqHCcFeESDaFex62ZRr7o
 xJ8VHkwaXzu25Umq2xWIkjcB77gJ3S/I2CBLmAW0jUDnY2p1fwCEsf+/OnL2RZ33QFJbWnD+Gu5
 Nd6UiGotYXYsro631aTjLK3RdXun2POle46U2R1asE2Kl3aIli4gH1fe/89KVlz9lWu3+lUDrvy
 +YkmVMqMdCXt30qrTTfq9NoxjXTg7L3J0SvIESwVeuUed52EIhwmIYCOCW5symnYwrAAqnTx8Lw
 O68+UJdFpgU4msZRLsVuVWZdRp9/qLAxnqx2o9gzo0U56mN2kHM=
X-Proofpoint-GUID: 40PZY2VXTf8ipEJBCb1_vx5HlDSAQG9n

On Fri, Nov 14, 2025 at 03:05:14PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  README.md | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/README.md b/README.md
> index b54189b1d..3abd8a367 100644
> --- a/README.md
> +++ b/README.md
> @@ -9,21 +9,28 @@ community.
>  
>  The main development branch is [devel](https://github.com/oracle/dtrace-utils/tree/devel).
>  
> -We provide prebuilt x86_64 and aarch64 DTrace userspace packages for Oracle
> -Linux 9 (UEK7 kernel), Oracle Linux 8 (UEK7 or UEK6 kernel), and Oracle Linux 7
> -(UEK6 kernel).  These packages are based on the Oracle Linux specific release
> -branch [2.0-branch](https://github.com/oracle/dtrace-utils/tree/2.0-branch).
> +We provide prebuilt x86_64 and aarch64 DTrace userspace packages for
> +Oracle Linux 10 (UEK8 kernel),
> +Oracle Linux 9 (UEK8 or UEK7 kernel),
> +Oracle Linux 8 (UEK7 or UEK6 kernel),
> +and Oracle Linux 7 (UEK6 kernel).
> +These packages are based on the Oracle Linux specific release
> +branch [stable](https://github.com/oracle/dtrace-utils/tree/stable).

This is not correct.  The 'stable' branch is not Oracle Linux specific - it is
merely the branch that is up to date with the latest released version of
DTrace.

At this point, the changes that are specific to Oracle Linux are primarily
build system related and a single case of needing to deal with a discrepancy
between the UEK kernel vs upstream kernel as a result of some patches that
were backported.  I think that just mentioning which RPMs we build and provide
is sufficient here.

>  The latest packages can be obtained from the following
>  [Oracle Linux yum server](https://yum.oracle.com) repositories: 
> +- Oracle Linux 10 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/x86_64/
> +- Oracle Linux 10 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/aarch64/
> +- Oracle Linux 9 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/x86_64/
> +- Oracle Linux 9 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/aarch64/
>  - Oracle Linux 9 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR7/x86_64/
>  - Oracle Linux 9 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL9/baseos/latest/aarch64/
>  - Oracle Linux 8 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/x86_64/
>  - Oracle Linux 8 (aarch64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/aarch64/
>  - Oracle Linux 8 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR6/x86_64/
>  - Oracle Linux 8 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/
> -- Oracle Linux 7 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/
> -- Oracle Linux 7 (aarch64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/aarch64/
> +- Oracle Linux 7 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/ (up to dtrace-2.0.1-1)
> +- Oracle Linux 7 (aarch64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/aarch64/ (up to dtrace-2.0.1-1)

I would separate these last 2 lines from the others and put a line before them
pointing out that we provide RPMs up to 2.0.1-1, and that building for OL7 has
been deprecated.

>  Source code for the UEK kernel is available on github in the
>  [linux-uek repo](https://github.com/oracle/linux-uek).
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
