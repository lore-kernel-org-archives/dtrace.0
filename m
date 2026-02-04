Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F8038E12C
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210552; cv=fail; b=SUdIJJIjyCm9QgKwOGgHKpK4YHcX6tvEc/In7NTZ+8rkcrWorvXhkOJ3NYHaRuG+rplgpIy2BN4JeR3oH9MUIwgwkIxqjhxETOA97gttRRVxoI3nP4clU3sv20OLFxKhWo6LYR33uhkBmm8dhGiZAWoxdkvoaoDtIY8/GZ9ZksY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210552; c=relaxed/simple;
	bh=x049Z/GHTcxqOo6qgY0gkMgmgSNhr60EfhS02hmfeSk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gmoUWtj2EL/BXETld+6bfh+MA/eB+IV4A4Na30+UsNzOoAcvMCNZp46xC+skuWklA/TJ9jGvyZoAzTZldDvlbZZq328L41QICJK/kaNjt6fAwH5xVW753kysas8kak1IA70n2ID2NclSRFIq2rw5e0un34csS2n3wXiUGAIPFEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K5M/HEW3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LeyvdZRf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K5M/HEW3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LeyvdZRf"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614A9dHM318462
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 13:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=QXo65c3rOOfmemOkyxLid6ZDPigjTUqpIvnRJXFnBxU=; b=
	K5M/HEW3Foz45D7PWGag/01Ytl823F3lnjlUGnYmzl3nTrsz4ZQX11ZWUHOtkYwg
	ZGTHW3Mzk/fImq79O2FXUsa6BEpGsy3DkgDRyui6qILQbJPI5Kx4C+GQY2p2WCzj
	liyzW9TTb8hKRNjORi8aYSUoPCSccChihWcjU6Yhp96USiDMtdsa68j5NKTMqTLM
	K4/Hi89Z2fs3rDTK3ZWVwbSiJx8ACTCDmg4pJ0xHQsQLagR4MQpVJ6FZEp2jdItG
	Qmk9zcsPbfD5A5iU/CGt5qEEUJPfjUNjmyDXcxzFWDt8ugCqSY+I5iGTXoJbIdtT
	rhxsh2hhgWt/TvLAIMKEVQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k7uhr9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 13:09:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614CpNTe025868
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 13:09:09 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c257a147n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 13:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZjMXFOQ8QEoDC0w3TBZismHuhjozHAzhoI3YEEi8m7bJIrerGsTf8chpEe5ILXYcjYKNML13QyZzFBU96MMr4Z1Bfw3b4eb35EhNQctAQC2HfjX4+Ab+hR7Y6qdAmbgsuYwOMOhABd4TunqINFEHcqhMY+ATmghgwpAhn4pqh8ZZ4DFvCRQ9Wd5HYa1hEgfLLNfb+9GG0xTwhdN37JQ2oIIWrRW6/hlS5OYs1UaFo7MlMx3glQK1j5tyOhH6YH8Gl7z7mNQhkV9R/cldkFdZFVM4IUaLOx2U250+/tpz2zKOw035VQ5sMIY6oeqhFC2+fvMlJoy1qx9w3idkmcQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXo65c3rOOfmemOkyxLid6ZDPigjTUqpIvnRJXFnBxU=;
 b=BOP0p3BIMAMO9rygGMas3WOu1UwEqefy1febjTcjp9iDh89Xxq1rVv8I4aQxVskbqMLaqVg9jolOSFMt1W/khFoWEPAufmfbOvXYmpZzg6lZyI5wlsO2+YfagLBiGEUKKgjaqRQtTgYrocWMNmEV/t/KQZYyCf1CXFpHDnUTSlgW7hcZhqmtbOmoJ1E7/n7S4RNLrDE/pjjjvqD70IWzbGxDM8ENWKSmr70ePyTNhA2SxLpKP53U+rxboNWJ6Y5Wl3vob8XpNeC9bAWSXpPF/YDG0vUXHMDtdvojeRvyrMsbJFiMJpEP9uf+gSGOcDTQflEv0lpSzuNI/o2XqeSy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXo65c3rOOfmemOkyxLid6ZDPigjTUqpIvnRJXFnBxU=;
 b=LeyvdZRfVfI4NGsMAfWoVwf8hmkjDXAp9BKNI9IqfdDOakWFvv6IUKXAa9M0X8XPaClYeEsQQjOztSSgFmpQMAakGGupqwES+hcC1PsG0nkN+9T3B0TbZkOn29h2bQL+s5T+117RFUvwtIjxGBKRZSr0nHCoK+XjT77ychUOpLg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6080.namprd10.prod.outlook.com (2603:10b6:8:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:09:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 13:09:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] NEWS/dtrace.spec: Add items for release 2.0.5
Date: Wed,  4 Feb 2026 08:09:03 -0500
Message-Id: <20260204130903.3426-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 913bd94d-c04b-4e63-b10a-08de63ee9324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lEe6VgUXg0QXB4fhDlpvmoVOD5YeW9wzA5suV6uzS6HxfM9S0Cpp/vnFpFEN?=
 =?us-ascii?Q?Lh+97hVWC3jPSVZ6zHKKStHCHnYXtpqDMD9RVYXL1Q8zeA13qYtCFHHMf8JK?=
 =?us-ascii?Q?9X7zNQ+Ge9hSVz4wOVQnCMrVqM8tLi7x/lQyp+59vBFtBhn72nBHKD175ORR?=
 =?us-ascii?Q?6ywwdAqRgF6H3I/PLMMNYsORRepKkzcb7JXQpt3iHMRkeZQkl799bEGAYpYe?=
 =?us-ascii?Q?bvF0u627WQimjPUgbSU0TjSsYfxpyq7sTbJEF4S+Qz728Gm+OAXkRNLnTHtL?=
 =?us-ascii?Q?H0WvWaq1wk2y1FSOyncExFYEVMjIPyjZVnnZrJZ+IU92E5gCue+8Rru6Kcrb?=
 =?us-ascii?Q?nTqkifRPPqB5TKhBCj0etA2sf4JQ/u1/84UVzz/ehbnGwKF7AMFax+TmwdCc?=
 =?us-ascii?Q?BCGHQWbOo8HH75imVYgxd2gNt3lHgHYeCs/ShgYyg6Yh9y9hLfT01YRfJaOa?=
 =?us-ascii?Q?xsD1rqMIP7MwgaSX4m+hxEU5qQ5FGu7YL0FDk//2fsievLKoBHV1FX4N5Goe?=
 =?us-ascii?Q?sTTvQ5Nqw3CX75VMmX3WK9DhnpIOPTCVgZZKJWeyrL+vSriLE+Y29c2LoCly?=
 =?us-ascii?Q?brUy2XMkXvHpkzluDvBrpdzv8WFg0+gFWEC08xt61uRXDqBhnfdDfZUNdu4G?=
 =?us-ascii?Q?i9POo6W7XlJmFvTjICd1oOtx8O0v279XPOAzpEGZLV8SyKgC95R6XSuOmT9O?=
 =?us-ascii?Q?qW3AJEC8t9go8/QJuakEwIAGTuoEg7iSVYchE3rhlx1ch6BMkdpeX3iqRj5M?=
 =?us-ascii?Q?otEZMmv0RujQDZ2dgiLkKC/XP11YNNTZ/CjsOzL8AkZrCYCVF+ocEVFLDJTt?=
 =?us-ascii?Q?Ns5vbBTuQdP5XftrL0KJT6kvSew6Tr+dBiFoPEh7g/M1nLfTWSU5e2KcBGuE?=
 =?us-ascii?Q?znVu3eacZVYKhr9lkGmwsdpc6vHuzWsJZ8KrH+BM9j/jWZlyaDUPJOIKF1s9?=
 =?us-ascii?Q?2ll2ZRC0oNrQ/n6ihv6noA23pMU5rPQIzRmO7qdveGurVTMgTUKH5sOp6kOc?=
 =?us-ascii?Q?QYIhyDV5iFHbLMOCf9RGoMrHkhz0b/Wtn4idJQuvetZyYHY9ZWwBEpKR1G03?=
 =?us-ascii?Q?8LOtmosl7lmGRrnC/tvTDVl+cW8PYUSVtvarASjHO0rirHdoNpXFpuckvB2S?=
 =?us-ascii?Q?+umTLWO+Ao9FpptDVlNJX9bJnPO8mYnjSRqi//wMmiHvxxDZ304BAwgQbKmq?=
 =?us-ascii?Q?rYQYX8h5ppGxSuLlC+TyQf0n62J/C+8pL0taDQn5tb/n8SaJ2D5u68/7q1DA?=
 =?us-ascii?Q?tzyJ7L0xJ0E0j/L3yI9Az299rD54VMzGhqmEXlhCCYNNuMH7CqN2BkOixZ0R?=
 =?us-ascii?Q?vPzDM01Hoaf3zrVamK8Tj+UpaucTcjYBcHxSpdHTgFU55SQKMLtPKROvsofx?=
 =?us-ascii?Q?i+N7SPtPrrBsj8ty6E5W0ljglcxrZj8OOVq2nz9I1iSeUSdwmx+Qv7u4N2Sr?=
 =?us-ascii?Q?OfuVD70NcrGoFGZjQ95N4MCcm2jsfaFpQRxZDfmPXI//yTNjgR4OBrelj+Hl?=
 =?us-ascii?Q?h6hTbSX6ibzkeBU5R6oCx9S/FMdlmJlbWjz6k/tPR0uRS5uPTyiAFT0IFSmb?=
 =?us-ascii?Q?msR5vclU3/LjnXWQRMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8NR9egNRqiFX0Rlv8QQhKRrwg8sNzypJrlLoqGH2hQ0QEeWFl0k3T5IXROvj?=
 =?us-ascii?Q?RFFd8QSAdc3M0f1XznKFsq9PTafsFFT+2WL+btojqWJawk0GzyaKeczMi0jO?=
 =?us-ascii?Q?4bx2l4tIeNsG32CnmgtLpAtYgZoe99jk6FH9W6e9XQ/xQ6zwowSznQ5dFrHM?=
 =?us-ascii?Q?ZEI/KB9bJujz/YJgdiNqh+eE7v0oVD2zZkEGRevHCC2Uu3d0H6xgzecP5RrQ?=
 =?us-ascii?Q?+4QFtOGX7zjKwNRgWVGHRs5nyqJZx+hQXHs7YDPTrPKt8PS57kb7DJSnpjZi?=
 =?us-ascii?Q?NU+iUOIQYCauympUlRy0X5Dk5HY7gmiPa7773Fk0yY7bJYg6Vir3UXTgREnU?=
 =?us-ascii?Q?vzZQRY4qzh1/lOjx2+mgFZ29k8miMG/B3ykA70nWHVxaktvnM/FTvgdJEHYc?=
 =?us-ascii?Q?b7Ahv4RnLFNO8Ra6x2rkePRkKXKa8u2qu+Pr64/0bsqDWwpd23r9Z7X3jXhY?=
 =?us-ascii?Q?YLSuNG9Ztd4l3DxXv5xR6fQr41holVdJHa6QRwNKZQavVInZ5vuphb3WS5KI?=
 =?us-ascii?Q?m4iqfs4DRzOmK0KcLdEMgtmivWgBmsdhG3IPkz91Lb+nZQyiEfjXyHD7eCwe?=
 =?us-ascii?Q?A4kMwT7Dh403OIq3sXkZ20UW9xyXPpMQYODricdMbPdv2attOLJOMsLq399E?=
 =?us-ascii?Q?ExnmrekSr9YZcEICEcP8sBG/g3weZ4q1aE71BmhRccahEg7LdSLJHC4cVhos?=
 =?us-ascii?Q?kpiDA+6HmYjquOUO3GNCWoLHTBPjEEl43lQmuSU7paQ/lqLlbbwl62IG2FWD?=
 =?us-ascii?Q?EnT11KWsP8L+AEjwNN5nNPz+YC/IRpsa3T8947E38hswyuH/nnKrd+LJunmU?=
 =?us-ascii?Q?PINUpCjd4xuzUkEw31cIrWKt48dY5hw/YL+Jr6BLaSFvCSYuG5QR29tvQUEg?=
 =?us-ascii?Q?IKp/mWPrwFCNsx9kznUe4inE0j3azCCGDpQ25u1OD64NnatV8q6GF/s3PTDY?=
 =?us-ascii?Q?DJwO5YVgKokF9i3Df4NR3sxmZXFG9NG99BTBqGhVmnDqB1s9H/e1i9c+Jn1K?=
 =?us-ascii?Q?f3KAU8MKInD4WZDTM+3etzEoBZIFK4ADC88D4wcJj6qm8rSJ3Bcuq4YyfXXy?=
 =?us-ascii?Q?/evHG8FF35SP5ILCVrzA1+WnlZc7BlL91H9Bgx6yyVyJTev++o1P4W1O5qKv?=
 =?us-ascii?Q?g15/rM3A0HWWLfZMv3jzNmDbijIMKBwvM4aaEWcndJjwtLW0BadH24ZdEqqV?=
 =?us-ascii?Q?tGBSEvKnfz5WNi72isRl/a3gSuxmU5e1mM1rWTIzdD8278YIKnMQptIjvfsv?=
 =?us-ascii?Q?iwHx5SxlBthfNVFWd7jO7xZz7sQHSlcXBAKKc/splmkqQyTR/MI9jQvTMjZE?=
 =?us-ascii?Q?IavTcg3zCAr68v9Xorpv6QuRfXDDxst2zScRsVhXjK4PC8KOcodhe9GHdfcM?=
 =?us-ascii?Q?VAxcb8ia3nKSsbgOQiyNwXXHqD7YnQCVZNLs3Zj80MqrkKMqqobvfoHlPMx6?=
 =?us-ascii?Q?h9XbtsslzQdEoz0cQF59JCAzjpDNhwtT5AeMloTvI3eFW2XcT/N3s0N4KS3v?=
 =?us-ascii?Q?zH3j6nTYPLNfOKv7W0tMigYLP8Yaaw9MhCiDa2SKdaF83jdQ8pobCY2yK1FN?=
 =?us-ascii?Q?7kXsKVlw/R2rGHfvxMppFTz0NdcTW0oepDfFkFHIeZYYQ51qysYIZPjAx0Xf?=
 =?us-ascii?Q?8nZaTuNxedvQevXL2lbAvuUi/Ib4L7oDy/QLDv/m5p9cpHEwNyrKwU4XV3HU?=
 =?us-ascii?Q?UHAtx6u7go1vax4WtgZLhaQSs1DbOjHijVfzGbFcz7UrMHlkEH5cBchcTaEU?=
 =?us-ascii?Q?bCZEbGj5eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ttn1yuIdEVxBPvwjaME//FoaX9GksOItrGMi8HJLqMBee4byfBsID9xf4aj+/XEO8l2aEyQmKQ4JYsJn5T/+1izyzXg943sM/kHSXzhfOZLzI90gAX53k2KJaHXgKzo4aktgEb1MmIxm+Hcvb2M09ngjrdZkMLxQ+5sg2KYwTVefm8/mjtSRzCBVUBtU9j8ukUgUwUwyBO+DSeB3n9b4Zv4bIOA8DED4UOoZqLAK3Ko2XjDgDwtfGWtn//3nt8EMAiRDO5LxtrIxaFzJDrv4Hj1LtWXcdyKUJf4e2iYgYcFvH++4nOQrrenK0xX67kYtbGAPwCQLIu3ZgcRBSlG8ad3k14q/EyPIZvKJeki7c0rdAJ7aOXTkg/wkMXhKvkwVxvyA7C8lS7zdnywcKfzoKryryNP7a0idsQeQBCj4AehOY3dQk2AU+35XAPHEI3NNCBGBp1jqhGlioEH4kNJTNjzXcLO2/B+hN/wmVPPbwyRJ0SOsqsrqzNjC0U9ykKh79nbgAo0U7FDAWh21cfmryUhu5EXaUeyu+ETZftVwgoQ0W1SPNGPkICWvfaNKg6a6Sxg1pK2N+BJ7KHODSTnRsrTjJJWLL+06kghLoEZlYsI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913bd94d-c04b-4e63-b10a-08de63ee9324
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:09:05.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34rNZvwbHfEa++DMgFSVJbfkYirLw/yHPkpoLPHZxW6P8o58UjE9fj6ZcWDoQzosGznVjRjcppyNSYpFwRwryA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6080
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMCBTYWx0ZWRfX0h5PP6hYUwJM
 eSbKoKNecsGy/XYGqrom3UL0VdbeGX00+PbkpgPLbgZKT7+MDF3WoBrDV0PIQbMeYky1GEYMXpP
 +1drTxzXRlz2AERuA+lXPEAXYRTwPjxRnzuj4o1wirDcQGtzvotV+uWclXQstjWPz/EkOgUUFLf
 V+0WCuAmZZPgSaspU7O+ysve55P2Fv7sXloRg7vMRILvs50jEO/SK7GS58dBGgt9vAkk9FYWXec
 x7IXPw5jjKGje7w37+PLgYys+ZemHMPkaZf8bplK5Nje70A3CyxNEJx7RHArPgpfb7EtT5fH18O
 myi1IKpPAL2Cb9yyr+eXNtFRnHJJuU+RysD6IPzg5gKIHjd1BW3DgwMNPppQBroEMAM16Ly/Ufl
 ZM2cEJ1psthbx0vm1Jv8q3bXJeFK6wZKVz437NkJkJ4pxDHBH7xbTPy9/qsQYUX+JQtDeMEWouW
 J82JzU3bxRUyB4+WBCikhCplp7JcPfcBuwro7fMQ=
X-Proofpoint-GUID: LBfMcRBEqJKYxVDjNu6yTdxP2V7Sx_dT
X-Authority-Analysis: v=2.4 cv=Z7Dh3XRA c=1 sm=1 tr=0 ts=698344f6 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=wUCvHKAjjeeHZHeFqnMA:9 cc=ntf awl=host:13644
X-Proofpoint-ORIG-GUID: LBfMcRBEqJKYxVDjNu6yTdxP2V7Sx_dT

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 NEWS        | 4 +++-
 dtrace.spec | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/NEWS b/NEWS
index 8f9ea6f4..bd20932a 100644
--- a/NEWS
+++ b/NEWS
@@ -1,4 +1,4 @@
-2.0.5-1 (Jan 27th, 2026)
+2.0.5-1 (Feb 4th, 2026)
 ------------------------
 
 New features:
@@ -9,6 +9,8 @@ Bugfixes:
 
  - Allocate the buffers BPF map to fit highest CPU id.
 
+ - Fix argument handling for multi-location user probes.
+
  - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
 
  - Fix prvname so that both rawfbt and fbt probes are seen.
diff --git a/dtrace.spec b/dtrace.spec
index d43b3c20..ee6c37b0 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -230,9 +230,11 @@ systemctl start dtprobed || :
 %{_libdir}/dtrace/testsuite
 
 %changelog
-* Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
+* Wed Feb  4 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
 - Implement PID-specific uprobes.  (Kris Van Hees)
 - Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
+- Fix argument handling for multi-location user probes.
+  (Kris Van Hees) [Orabug: 38922360]
 - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
   [Orabug: 38776929]
 - Fix prvname so that both rawfbt and fbt probes are seen.
-- 
2.47.3

