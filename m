Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884EDEAF9
	for <dtrace@lists.linux.dev>; Sun,  8 Sep 2024 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725813630; cv=fail; b=iBA/mkQCg9QYfQkpv5J+284clZqbB2BdjG4ljTvTpjfe04fXc5B0LcL5wztTpf2fcVqBnJVoU1chj0ZlB4XcRs86WDvK03P3f5QvBj2gwrqU3K4y5rLfqct0DfLz0Knl+FGh92LeErZjDxyrjWTuh9cVCkAQv5Ejp77VmJnBEy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725813630; c=relaxed/simple;
	bh=w+LSgfJDfo7ugJEZAyMUQWZwm8KhJDQBuB2jNn5PsSA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nrsDUFk0lS16EoUDTqSdygP8eIUlbhoGv7zsc++upYmGgJo6ejf5VPpl8i3VRrHHxG0SfFaVWQRXCkYqYsVPC4b0Mh963ac2tJnJdNmme9v1ivFFW+OLHckQdcb0QFmIxxxei7wfxo7z7X3k/NPdccycjO8dUHDJJslmgxArKyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=moJ/Py7C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hO2oJPwu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="moJ/Py7C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hO2oJPwu"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488FZ8b3021836
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=j7w11w2yY4NqB7JmQkek2Q9/b4XzJ2sEciodU5bW5nU=; b=
	moJ/Py7CpLxRCjAQN23bd7Mwey+TcOH/HNIUa4MOyOHxmv4l6EbNY4Vf7iDE2oDC
	B5Docil5zFOsODlwI6eVbuxsj6SmBNNYk5JuJr5/MLI5cnh+iCDVGObP9gKgavVQ
	WiVT5yK+3HiBXl9WtC4XlNqBTZaUgVivCjdkDliI7AAcve1RIP3YqXZx/23kkjDo
	eajf+Xmjcpz8YvNVeYVNRd05q4GD01FR05xF4ug58ldIlnf3zB6plJDn1RnAgrPa
	eD5cARHFFTboHHGFbRzykWT8rw0NKwJW/u7vNoGO1LRJqFOv3ayEl6JVWcBO4ZhO
	iuQCRW/3kdX2Bd8LKJCEQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2hfek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:40:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 488G0fd9040755
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:40:22 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97q3gm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe7o6pEDB9F548dmaokjaoy9Ho6CiShLwLa7gszF7HPYj59IFiLPnKQ16DB8PMVFcKnmLN6tHrApZRIFreEvK/kCE3xe/Uh+oZO67l8cUoQZbgfS/Atesh2paQsh2F/QnUNRZxNxqC1gxB1P585iEiz11ltEGLqcBNjTkcwnm+HS1+kZPkIbtJTdX6fHCBVObhUR5BAwUA//n5LpqM/AZNykU4i6Z2HUOlXV5ZGCYqWWfW8S+4/yK5O3kohmg/pa0NETgIXW9sBdZAvvPFxDfhg3ynYn6ETtxtjY8iGyW6r5+RVAjuEzkq3iITBaOTcxMg+YHB1AXFJedL0aWBuK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7w11w2yY4NqB7JmQkek2Q9/b4XzJ2sEciodU5bW5nU=;
 b=kFEwyT6+X9XKk5pEIFT9OM516178z2w7uApEfEPH8EKCYc7Zx6c1lhPCUi13mdVtcychneR2VYLzHNRQlFi1yvj7TOcy1BblUXbLNdcQZMfdriKcZj8v075iBXASD/QQKWEDDTHjkSW8DY5wuyBRhMiByLwQFpS7m8/Ar3DkxSxuVCtg+jbCxHa699p5OR4sqkJVZVN6Hroftai90MlbcufS3I17nhIldpm36nzEQGjeJG2EkOQCSPAmurqdFI3s1t9dZNIOYaFZiQyWORxq2fFvHBhfi/vXQ0TXJb0Or3cM+1CJ/pSzrQwIdQ0rs1wq8QIDIEKJ/Y9VPK1+UMwtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7w11w2yY4NqB7JmQkek2Q9/b4XzJ2sEciodU5bW5nU=;
 b=hO2oJPwurs1+O2xKCjcdCts+LkLRyyNZ9p5oEi/M/qeYleq08JE2CkbxYwZQbNFcZ5JF/f/vEXGshxrCf6230hPZX/8fMXXqQLczD2MXdm9ojnrfHV/7X/ozSpeg8TzjY8UHjdLDrqiX+Sk6idP3AI8hE8m8DuEIcT8JIRUg5ZU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7779.namprd10.prod.outlook.com (2603:10b6:610:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Sun, 8 Sep
 2024 16:40:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Sun, 8 Sep 2024
 16:40:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 03/19] Deprecate enabled probe ID (epid)
Date: Sun,  8 Sep 2024 12:40:14 -0400
Message-Id: <20240908164016.3820-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: d28584b8-304d-4525-e303-08dcd024ec26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XTySwVicPPNXelR66SrAiilADMqqqUX6GHBFKjnUVB43YRhp7hwlrgbn53Gy?=
 =?us-ascii?Q?cpIDjWlln/TiCKHNNPaMRWHVMnCtu8/AD5NpWgzRXlY39oiyoUbKSxjQ1Zjs?=
 =?us-ascii?Q?rBJfN/v85khiN7W4j7l0Cd2IUUP62ke89gqkG9qICMEa2sCsnZaRoxgWPc8D?=
 =?us-ascii?Q?IE4NOuDRE13T1hGwIxE/hUFfsB4A90JlbzI84fPzaKwjs2Ek5xF2l6ZrRbbW?=
 =?us-ascii?Q?7tibdelAnd8XHzlfooMcjBbuEcC+UzNxLQ9KcJsOMJMdvKHPD1JhHFLAhR6A?=
 =?us-ascii?Q?kh2Qw4+LgLQHcyV4Wr9lkcrMV8gGZAUadfID0InRsAqiSlE84Hlpnsx0pzLH?=
 =?us-ascii?Q?F3HKlwAJehRzdJr9XPEEXAenWH/oGDWVtWFjFhgu+8dgh46EvyVWTHOySjGV?=
 =?us-ascii?Q?BsfKee2fA11xxRoWBzYKZaTmBxvgfZyVD5ng1ekOEO83CtVaGpT5drJo5YJS?=
 =?us-ascii?Q?VlxmBzlwQuBzTs3Rdy1dt1pnfcMFAhrqTTppd/nWTfP9gJ8iMjxZmwalqA5q?=
 =?us-ascii?Q?w84POD+vkzlIYtB6Gs3l80aIGEj0PdkezzNeX4pLroV8Ewel/7jYj4aVSRMU?=
 =?us-ascii?Q?62M81DsOo/AX1VFZBmwdmJVBoGfIfxwRWm29peZJXhzuHR2RMMjO0Xncf4n8?=
 =?us-ascii?Q?Ec7zHuuZvFC1iJynShg7Jgo2qECV3DUFbeeA5t1h5arFldkhM6g+5QYBXapS?=
 =?us-ascii?Q?/yADelMYTnC3ViWz6yNiVcJbi+AJf9z1ziKSMB4lgrZUa8Vh170s/+ne1KFx?=
 =?us-ascii?Q?YTroOQOvwrunsL3BjxqnNm5E0CCTAksuRiXVUgNzlAnFAA7Z+KA/r11U1Sig?=
 =?us-ascii?Q?u7U93qKYbfhWwchHoKDq0s40c2xBhZ5K72FnXo7vvbezx8YTxIB6vj7RXVtx?=
 =?us-ascii?Q?U0TuUKbTm30XczO6avOYdxU37IRV206X1iZp+amSX96YCQTo5GrhWcQcBkYb?=
 =?us-ascii?Q?DJf1IPxYtJ0RTP6Izqft0KlAh89QF1Jz7/GgmHjVgmRuNSbfbW919I6RJhEG?=
 =?us-ascii?Q?Z8kfbnuazodOYRzhsOb3HZNCKgKZTXXwpSEX06aug0uw3PNc3W8dBt+XUDno?=
 =?us-ascii?Q?v8z1tnN6F4ZueEv7mYvEcqv9dW9Cu8ykc/SpnS7ex/5t7KIN/IAo5cBkJG75?=
 =?us-ascii?Q?IQvWEUIkw+DYZfzja+Th3W7mvXl1ESZ+XSAjHGTyRHcTauOsfmApIzDie+mW?=
 =?us-ascii?Q?IpNwdFf8YaUuUxPSl0JQG1Yp5T85uuArZHY6vcPnENf2Sap/WE+2eM0ZuDUP?=
 =?us-ascii?Q?7jtaaZjTDfO0W4h3kcPCimg3u4gdr53PnJmfN6D9wWWkyL5X2annoTtwW6tp?=
 =?us-ascii?Q?jeGrX21n1sRvqGr9L31WdDlDbLDlzz5ikk0+xFZdwt18Xw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WK7kgDpYvisqDBeQbdJxJ5dZmqBCrRlFMIOehuPCTVAOaMbMgFN4gfY0TNWD?=
 =?us-ascii?Q?BM5rAmSsWDZR3fVo03o14YPPJ1r4/tbaZTtfBaQUELBxb6BJNHa5sNKWrrI4?=
 =?us-ascii?Q?Vq1hB7SyWE7EUrmLozNyH52n7/+y49fpPz9uiy7lJqqB3z27OQ536iaqavxi?=
 =?us-ascii?Q?Sd6svM+h0w3TY13EN91jrbU959/sGPetXi3nBIPcj6xTzxXUTMVW4WYfLtmo?=
 =?us-ascii?Q?eC2JwawvAXjerjSQhWEQ3p5SyKxG79V7hMY2H8kcf4JRngrK7/KcZTj828ET?=
 =?us-ascii?Q?WIVNJzyiMV+7A/cANfLS4Ap2POFlZdMH6VviGTIrskrOIRk4M30iA1V9VMIo?=
 =?us-ascii?Q?iaXk0yi6XDcAmx2Ut2rvRRyNs/Kt3kv3dAo4qhbrVEGlOAd3EntdKuUJfqpD?=
 =?us-ascii?Q?4JPkfrF+kXI34L+IKK3HAnfB1edyR9KwIcXpJKzFwNfyhjNeHVYvYjwssoqV?=
 =?us-ascii?Q?/XyDUIpEMBtX94IwEuJYweKiGlWnv4tmRzJ4vwD/gpGDno3vzVZH8Bc3Ro5P?=
 =?us-ascii?Q?hIdWChBRu0W91chD4oS1KAv1NZwOJlEv7Iak3w/ftIESC0qeoE4ho/D++7hM?=
 =?us-ascii?Q?MFthoppKCDgWkIm/Jplo9PaGyiAUh7b/O7V5VGmzmAFqIs3K2fryTD+8a+bc?=
 =?us-ascii?Q?oC6FP1XbPQP+RRp0cEpJC2ke+d52tFc6Bs+3LIVGfsPqGj/T6QKdchv6a2fO?=
 =?us-ascii?Q?QohKYLmQkFi77kmHI56OUDIyhnaOvJepsQNUruZf6pz2bLbFKY4ZEgziOP42?=
 =?us-ascii?Q?+r4SpXBZ9+Kw+zXqZYFNZa62vGvBrNdv2Z6Uib/s8asRCH59qEMEHa1AXQpT?=
 =?us-ascii?Q?QjmDzCMG9Iam8j67g+8vVYKheymDNUdte/QarnNnQCt/1RiI1LpBKzWxUDqF?=
 =?us-ascii?Q?t5VG7pJK3buTbHqd/Cg0yA7lAnt84wPq78oANa38Gt2eFdDNbZJyw7BDuUZI?=
 =?us-ascii?Q?bA3z6mkwsZqGhZ40odH47x+fV9P6pN5tfP3aOGmUtkpx9p26e2GG/Nb9G90b?=
 =?us-ascii?Q?cyRMJmhVh+r8volMSWN8loHq/z+yOSQrSPI/tRAYDh3ff02ZI7CMctOHsYr6?=
 =?us-ascii?Q?+axTtFAGVHbmyEAWYpGpF36xOLBcctWCgEZdW/4819klkMgT8kcwOvVPqrGB?=
 =?us-ascii?Q?q17BFODYyk9EkbJn5GZvAM8BvXYloev6TE/deo/urPoF/Yo8ft3w+7LSTMfl?=
 =?us-ascii?Q?fv/uoyHWoCQ3MUuKdWxB9p3l/u3M5T+BaIwVSfQiLWtVbAs8y9iSMsoGfM1E?=
 =?us-ascii?Q?eX6wCmQPeQJQPtSRZI5/+OGyrgII3GkTcxFIRL4MoIV2Lj0kVpVWxObAEcEj?=
 =?us-ascii?Q?J0IDueaHEi+O6eBNQpciNo1z+jo/HLeHGI16+DAjsIlXyMyRX0JIXKq1CUJZ?=
 =?us-ascii?Q?sRyyn/BWbpKvnzdaBnY3t5UbFF6a/isKKdonRjTE5Fjm7DZskSMGl4SzSLB8?=
 =?us-ascii?Q?w6V1G8+QeAi39HzQ0TzyAp6m9ZXmn5nsGSduGrnjYbZ+YKDnwiqE0fD8I22B?=
 =?us-ascii?Q?9V+SLsagV4RjUCo0rbkf8cYS633xMyp/fFA61vwBoc/Ihsmk+0pYJz0GCT5M?=
 =?us-ascii?Q?GtuwYdw9/1G+uZMswvyIO29Bbjk3PplzAQuT7lvM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mf6Dk/WPKRqt4GmNhauIMPzc9euvm4hAkmXGuJG+vvAUDqsk1pk2hOu9qA4qOVVXCCy8fi1smyiZvHYfjmxfMF7umfDsk4eBmvso5VSHOAeb5S/b/hZer8oBw1mJVXvtD7IynYsdTBR4NkGOfMq2/9kFDbnJ+Pvh+P6/EXkHDURWkFmjkHeI/1Q0pjFVvOemILPMMhkAQ0cczO3DhvYPYriir8NNigPy3YG1VqTmknsZKGbUjAf/Igl57Dds6zOLBcgEiuAiNPDlThs1NWYikdmIlInKLCCH8A4LwSOBGqf45unAkCD0r9AHQkLNTdJ6dGSPp8OGMWQWMdsPC7vS7ROYkbxTQDJ8zpmLaQ1qKZOmIqoJFIG2bDvskDlatPX6kYnFxHzjKFzm1cOjDVZpdFqPKpstSVaddogpur7VHNUjn+LbwXiObgO2MaBBeL88pjDwTJ+xxWhGMFbBmMoSf4YKBtL/e4l4Rt7hbTZIhbSTgUJgNUoZ3k+Jp/F+5SlIwuaH3HbmhOGdhYE/Hq/Ysz2Scp611Ihvf9eN3UzwGcRhamFgXtrvKklifOnvPZ+/nIkZQ5fjV5OytpNqSJ9lYvo5U8A5tPtQqQ1fMbtGpxc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28584b8-304d-4525-e303-08dcd024ec26
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 16:40:18.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVLfjn8NRmqUxoOcs6vgiYgdMqZhGnGr6wHGZCgulgnbavD7INXtHb2YJY3PWnuDfM9ZAM0AvxasdcfeFrhQwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409080141
X-Proofpoint-GUID: QwAhB3FM3xhLO6-d-_M6J-TPCfAzbVdL
X-Proofpoint-ORIG-GUID: QwAhB3FM3xhLO6-d-_M6J-TPCfAzbVdL

From: Eugene Loh <eugene.loh@oracle.com>

Historically, the enabled probe id (epid) was an integer, passed from
producer to consumer, that uniquely identified probe ID and statement
(data description).  It was used in error reporting and was available
to D users via a built-in variable "epid".

However, its value was opaque to users and difficult to use.

Deprecate the use of EPID:

*)  Have the producer pass to the consumer the probe ID and statement
    ID explicitly, instead of passing an opaque integer that requires
    additional lookup tables.

*)  Keep an array dt_stmts[] of statements, from which we can retrieve
    probe descriptions and data descriptions.

*)  Remove data structures related to epid: dt_ddesc[], dt_pdesc[],
    dt_nextepid, dt_maxprobe, etc.

Nevertheless, continue to provide a value for the built-in "epid" variable
for back compatability.  Expand the epid from 4 bytes to 8 bytes:  the
upper half is the probe ID and the lower half the statement ID.

The output buffer (written by the producer, read by the consumer) is
rearranged slightly.  Note that:

*)  It starts with a 4-byte size, which perf_event writes.

*)  The beginning of the output buffer should have 8-byte alignment.

*)  The beginning of the trace data within the output buffer should
    also have 8-byte alignment.

*)  So the buffer looks like:

         0: size (written by perf_event)
         4: was pad, now prid
         8: was epid, now stid
        12: specid
        16: data[n]

    We used to start the output buffer after the first 8 bytes,
    which we did not write.  Now, start the output buffer with
    the size, even if we still do not write it.

For error reporting:

*)  Report errors in terms of the probe ID (and description) and the
    clause function name, which is decipherable in terms of the
    disassembly output.  Specifically, change ERROR-probe arguments:

    -)  arg1 changes from epid to the probe ID

    -)  arg2 changes from "clause index" (which is no longer needed)
        to the statement ID that identifies the clause named in
        disassembly output

*)  No longer report the "action number", which has lost much of its
    meaning in the port to eBPF.  Nonetheless, keep dteda_action;  its
    value is not used, but set the value to stid for possible future use.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c                                |  5 +-
 bpf/probe_error.c                             |  8 +-
 include/dtrace/metadesc.h                     |  4 +-
 include/dtrace/universal.h                    |  3 +-
 libdtrace/dt_bpf.c                            |  2 -
 libdtrace/dt_bpf.h                            | 46 +++++----
 libdtrace/dt_cc.c                             | 47 +++-------
 libdtrace/dt_cg.c                             | 49 +++++-----
 libdtrace/dt_consume.c                        | 85 +++++++++--------
 libdtrace/dt_dctx.h                           | 23 +++--
 libdtrace/dt_dlibs.c                          |  2 -
 libdtrace/dt_error.c                          |  2 +-
 libdtrace/dt_handle.c                         | 41 ++++----
 libdtrace/dt_impl.h                           | 15 +--
 libdtrace/dt_map.c                            | 94 ++-----------------
 libdtrace/dt_open.c                           |  5 +-
 libdtrace/dt_program.c                        |  9 +-
 libdtrace/dtrace.h                            |  3 +-
 test/demo/builtin/eipd.d                      |  4 -
 test/demo/dtrace/error.r                      |  2 +-
 test/demo/spec/specopen.d                     |  5 +-
 test/stress/buffering/tst.resize3-manual.d    |  2 +-
 test/stress/buffering/tst.resize3-manual.r    |  2 +-
 test/stress/buffering/tst.resize3.d           |  2 +-
 test/stress/buffering/tst.resize3.r           |  2 +-
 test/unittest/actions/setopt/tst.badopt.r     | 14 +--
 .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
 test/unittest/builtinvar/tst.id_ERROR.r.p     |  2 +-
 test/unittest/codegen/err.deref_0.r           |  2 +-
 test/unittest/codegen/err.deref_1.r           |  2 +-
 test/unittest/codegen/err.deref_i0.r          |  2 +-
 test/unittest/codegen/err.deref_i1.r          |  2 +-
 .../unittest/codegen/err.deref_string-assoc.r |  2 +-
 test/unittest/codegen/err.deref_string-gvar.r |  2 +-
 test/unittest/codegen/err.deref_string-lvar.r |  2 +-
 test/unittest/codegen/err.deref_string-tvar.r |  2 +-
 .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
 .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
 .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
 .../codegen/err.str_NULL_plus_offset.r        |  2 +-
 test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
 test/unittest/drops/drp.DTRACEDROP_DBLERROR.r |  2 +-
 .../tst.DTRACEFLT_BADADDR.null_ptr_field.d    |  6 +-
 .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
 test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
 test/unittest/error/tst.DTRACEFLT_BADADDR2.r  |  4 +-
 .../error/tst.DTRACEFLT_DIVZERO.div.d         | 11 ++-
 .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
 .../error/tst.DTRACEFLT_DIVZERO.mod.d         | 11 ++-
 .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
 .../error/tst.clause_scope-begin-ended.r      |  2 +-
 test/unittest/error/tst.clause_scope-begin.r  |  2 +-
 .../unittest/error/tst.clause_scope-regular.r |  2 +-
 .../error/tst.clause_scope-regular.r.p        |  8 +-
 test/unittest/error/tst.error.r               |  2 +-
 test/unittest/error/tst.errorend.r            |  2 +-
 .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
 .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
 .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
 .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
 .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
 .../alloca/err.alloca-crossing-clauses.r      |  2 +-
 .../alloca/err.alloca-load-before-bottom.r    |  2 +-
 .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
 .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
 .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
 .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
 .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
 .../alloca/err.alloca-store-before-bottom.r   |  2 +-
 .../alloca/err.alloca-store-beyond-top.r      |  2 +-
 .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
 test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
 test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
 test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
 test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
 test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
 test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
 test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
 test/unittest/funcs/err.badalloca.r           |  2 +-
 test/unittest/funcs/err.badalloca.r.p         |  8 +-
 test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
 test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
 .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
 .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
 test/unittest/funcs/strlen/tst.null.r         |  2 +-
 test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
 .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
 .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
 .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
 .../funcs/substr/err.substr_null_arg1.r       |  2 +-
 test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
 test/unittest/pointers/err.BadAlign.r         |  2 +-
 test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
 test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
 .../speculation/err.CommitWithInvalid.r       |  2 +-
 .../speculation/err.DiscardWithInvalid.r      |  2 +-
 test/unittest/speculation/tst.negcommit.r     |  2 +-
 .../unittest/variables/bvar/tst.arg3-ERROR.sh |  2 +-
 105 files changed, 292 insertions(+), 382 deletions(-)
 delete mode 100644 test/demo/builtin/eipd.d

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index a0c04f3a..37f29a59 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -48,8 +48,9 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 			mst->tstamp = bpf_ktime_get_ns();
 
 		return mst->tstamp;
-	case DIF_VAR_EPID:
-		return mst->epid;
+	case DIF_VAR_EPID: {
+		return (((uint64_t)mst->prid) << 32) | mst->stid;
+	}
 	case DIF_VAR_ID:
 		return mst->prid;
 	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index ee1a1793..237e0527 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -16,8 +16,8 @@ extern int64_t dt_error(const dt_dctx_t *dctx);
 /*
  * DTrace ERROR probes provide 6 arguments:
  *	arg0 = always NULL (used to be kernel consumer state pointer)
- *	arg1 = EPID of probe that triggered the fault
- *	arg2 = clause index of code that triggered the fault
+ *	arg1 = probe ID that triggered the fault
+ *	arg2 = statement ID that triggered the fault
  *	arg3 = BPF offset in the clause that triggered the fault (or -1)
  *	arg4 = fault type
  *	arg5 = fault-specific value (usually address being accessed or 0)
@@ -29,8 +29,8 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 	int		oldprid = mst->prid;
 
 	mst->argv[0] = 0;
-	mst->argv[1] = mst->epid;
-	mst->argv[2] = mst->clid;
+	mst->argv[1] = mst->prid;
+	mst->argv[2] = mst->stid;
 	mst->argv[3] = pc;
 	mst->argv[4] = fault;
 	mst->argv[5] = illval;
diff --git a/include/dtrace/metadesc.h b/include/dtrace/metadesc.h
index ab9061f7..41125ff1 100644
--- a/include/dtrace/metadesc.h
+++ b/include/dtrace/metadesc.h
@@ -19,8 +19,8 @@
 
 /*
  * DTrace separates the trace data stream from the metadata stream.  The only
- * metadata tokens placed in the data stream are enabled probe identifiers
- * (EPIDs) or (in the case of aggregations) aggregation identifiers.  In order
+ * metadata tokens placed in the data stream are probe and statement identifiers
+ * or (in the case of aggregations) aggregation identifiers.  In order
  * to determine the structure of the data, DTrace uses the token to perform a
  * lookup to retrieve the corresponding description of the enabled probe (via
  * the dtrace_datadesc structure) or the aggregation (via the dtrace_aggdesc
diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
index d6562489..325586e5 100644
--- a/include/dtrace/universal.h
+++ b/include/dtrace/universal.h
@@ -17,7 +17,6 @@
 
 #define	DTRACE_CPUALL		-1	/* all CPUs */
 #define	DTRACE_IDNONE		0	/* invalid probe identifier */
-#define	DTRACE_EPIDNONE		0	/* invalid enabled probe identifier */
 #define	DTRACE_AGGIDNONE	0	/* invalid aggregation identifier */
 #define	DTRACE_AGGVARIDNONE	0	/* invalid aggregation variable ID */
 #define	DTRACE_CACHEIDNONE	0	/* invalid predicate cache */
@@ -37,7 +36,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
 
 typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
 typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
-typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
+typedef uint32_t	dtrace_stid_t;		/* statement identifier */
 typedef uint32_t	dtrace_optid_t;		/* option identifier */
 typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
 
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 70597d65..3f9c42ea 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -774,7 +774,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
  * The size of the memory region is the sum of:
  *	- size of the DTrace machine state, rounded up to the nearest
  *	  multiple of 8
- *	- 8 bytes padding for trace buffer alignment purposes
  *	- maximum trace buffer record size, rounded up to the nearest
  *	  multiple of 8
  *	- size of dctx->mem (see dt_dctx.h)
@@ -783,7 +782,6 @@ static int
 gmap_create_mem(dtrace_hdl_t *dtp)
 {
 	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
-		     8 +
 		     roundup(dtp->dt_maxreclen, 8) +
 		     DMEM_SIZE(dtp);
 
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5b2df264..5716d232 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -32,30 +32,28 @@ extern "C" {
 					(dtp)->dt_bpffeatures |= (feat); \
 				} while (0)
 
-#define DT_CONST_EPID			1
-#define DT_CONST_PRID			2
-#define DT_CONST_CLID			3
-#define DT_CONST_ARGC			4
-#define DT_CONST_STBSZ			5
-#define DT_CONST_STRSZ			6
-#define DT_CONST_STKSIZ			7
-#define DT_CONST_BOOTTM			8
-#define DT_CONST_NSPEC			9
-#define DT_CONST_NCPUS			10
-#define DT_CONST_PC			11
-#define DT_CONST_TUPSZ			12
-#define DT_CONST_TASK_PID		13
-#define DT_CONST_TASK_TGID		14
-#define DT_CONST_TASK_REAL_PARENT	15
-#define DT_CONST_TASK_COMM		16
-#define DT_CONST_MUTEX_OWNER		17
-#define DT_CONST_RWLOCK_CNTS		18
-#define DT_CONST_DCTX_RODATA		19
-#define DT_CONST_RODATA_OFF		20
-#define DT_CONST_RODATA_SIZE		21
-#define DT_CONST_ZERO_OFF		22
-#define DT_CONST_STACK_OFF		23
-#define DT_CONST_STACK_SKIP		24
+#define DT_CONST_PRID			1
+#define DT_CONST_ARGC			2
+#define DT_CONST_STBSZ			3
+#define DT_CONST_STRSZ			4
+#define DT_CONST_STKSIZ			5
+#define DT_CONST_BOOTTM			6
+#define DT_CONST_NSPEC			7
+#define DT_CONST_NCPUS			8
+#define DT_CONST_PC			9
+#define DT_CONST_TUPSZ			10
+#define DT_CONST_TASK_PID		11
+#define DT_CONST_TASK_TGID		12
+#define DT_CONST_TASK_REAL_PARENT	13
+#define DT_CONST_TASK_COMM		14
+#define DT_CONST_MUTEX_OWNER		15
+#define DT_CONST_RWLOCK_CNTS		16
+#define DT_CONST_DCTX_RODATA		17
+#define DT_CONST_RODATA_OFF		18
+#define DT_CONST_RODATA_SIZE		19
+#define DT_CONST_ZERO_OFF		20
+#define DT_CONST_STACK_OFF		21
+#define DT_CONST_STACK_SKIP		22
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d1ee3843..4202771a 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -123,6 +123,7 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
 	if (sdp == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
+	sdp->dtsd_id = dtp->dt_stmt_nextid++;
 	assert(yypcb->pcb_stmt == NULL);
 	yypcb->pcb_stmt = sdp;
 	yypcb->pcb_maxrecs = 0;
@@ -133,11 +134,10 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
 	return sdp;
 }
 
-static dt_ident_t *
-dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
+static void
+dt_stmt_set_clause(dtrace_hdl_t *dtp, dtrace_difo_t *dp, dtrace_stmtdesc_t *sdp)
 {
 	char		*name;
-	int		len;
 	dt_ident_t	*idp;
 
 	/*
@@ -156,25 +156,21 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
 	/*
 	 * Generate a symbol name.
 	 */
-	len = snprintf(NULL, 0, "dt_clause_%d", dtp->dt_clause_nextid) + 1;
-	name = dt_alloc(dtp, len);
-	if (name == NULL)
+	if (asprintf(&name, "dt_clause_%d", sdp->dtsd_id) < 0)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
-	snprintf(name, len, "dt_clause_%d", dtp->dt_clause_nextid++);
-
 	/*
 	 * Add the symbol to the BPF identifier table and associate the DIFO
 	 * with the symbol.
 	 */
 	idp = dt_dlib_add_func(dtp, name);
-	dt_free(dtp, name);
+	free(name);
 	if (idp == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
 	dt_ident_set_data(idp, dp);
 
-	return idp;
+	sdp->dtsd_clause = idp;
 }
 
 static void
@@ -214,7 +210,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
 	 * Compile the clause (predicate and action).
 	 */
 	dt_cg(yypcb, cnp);
-	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
+	dt_stmt_set_clause(dtp, dt_as(yypcb), sdp);
 
 	assert(yypcb->pcb_stmt == sdp);
 	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
@@ -947,7 +943,7 @@ static int get_boottime() {
 static int
 dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 		  dt_ident_t *idp, const dtrace_difo_t *sdp, uint_t *pcp,
-		  uint_t *rcp, uint_t *vcp, dtrace_epid_t epid, uint_t clid)
+		  uint_t *rcp, uint_t *vcp)
 {
 	uint_t			pc = *pcp;
 	uint_t			rc = *rcp;
@@ -958,7 +954,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	uint_t			len = sdp->dtdo_brelen;
 	const dof_relodesc_t	*rp = sdp->dtdo_breltab;
 	dof_relodesc_t		*nrp = &dp->dtdo_breltab[rc];
-	dtrace_id_t		prid = prp->desc->id;
 	int			no_deps = 0;
 
 	if (idp != NULL) {
@@ -1029,7 +1024,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	for (; len != 0; len--, rp++, nrp++) {
 		const char	*name = dt_difo_getstr(sdp, rp->dofr_name);
 		dtrace_difo_t	*rdp;
-		dtrace_epid_t	nepid;
 		int		ipc;
 
 		idp = dt_dlib_get_sym(dtp, name);
@@ -1044,15 +1038,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			}
 
 			switch (idp->di_id) {
-			case DT_CONST_EPID:
-				nrp->dofr_data = epid;
-				continue;
 			case DT_CONST_PRID:
 				nrp->dofr_data = prp->desc->id;
 				continue;
-			case DT_CONST_CLID:
-				nrp->dofr_data = clid;
-				continue;
 			case DT_CONST_ARGC:
 				nrp->dofr_data = 0;	/* FIXME */
 				continue;
@@ -1196,11 +1184,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_STACK_SKIP:
 				nrp->dofr_data = prp->prov->impl->stack_skip;
 				continue;
-			default:
-				/* probe name -> value is probe id */
-				if (strchr(idp->di_name, ':') != NULL)
-					prid = rp->dofr_data;
-				continue;
 			}
 
 			continue;
@@ -1216,13 +1199,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			rdp = dt_dlib_get_func_difo(dtp, idp);
 			if (rdp == NULL)
 				return -1;
-			if (rdp->dtdo_ddesc != NULL) {
-				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc, prid);
-				clid++;
-			} else
-				nepid = 0;
 			ipc = dt_link_construct(dtp, prp, dp, idp, rdp, pcp,
-						rcp, vcp, nepid, clid);
+						rcp, vcp);
 			if (ipc == -1)
 				return -1;
 
@@ -1263,8 +1241,8 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
 			continue;
 
 		/*
-		 * We are only relocating constants (EPID and ARGC) and call
-		 * instructions to functions that have been linked in.
+		 * We are only relocating constants and call instructions to
+		 * functions that have been linked in.
 		 */
 		switch (idp->di_kind) {
 		case DT_IDENT_SCALAR:
@@ -1336,8 +1314,7 @@ dt_link(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	 */
 	insc = relc = varc = 0;
 
-	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc, 0,
-			       0);
+	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc);
 	dt_dlib_reset(dtp, B_FALSE);
 	if (rc == -1)
 		goto fail;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a7861829..37ee97d6 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -277,15 +277,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
 	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
 	 *				// add %r0, roundup(
 	 *						sizeof(dt_mstate_t), 8)
-	 *	*((uint64_t *)&buf[0]) = 0;
-	 *				// stdw [%r0 + 0], 0
-	 *	buf += 8;		// add %r0, 8
-	 *				//     (%r0 = pointer to buffer space)
 	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
 	 */
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
-	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
 	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
 
 	/*
@@ -1047,7 +1041,8 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
  *
  *	- Store the base pointer to the output data buffer in %r9.
  *	- Initialize the machine state (dctx->mst).
- *	- Store the epid at [%r9 + DBUF_EPID].
+ *	- Store the prid at [%r9 + DBUF_PRID].
+ *	- Store the stid at [%r9 + DBUF_STID].
  *	- Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].
  *	- Evaluate the predicate expression and return if false.
  *
@@ -1057,11 +1052,6 @@ static void
 dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	dt_ident_t	*epid = dt_dlib_get_var(pcb->pcb_hdl, "EPID");
-	dt_ident_t	*clid = dt_dlib_get_var(pcb->pcb_hdl, "CLID");
-
-	assert(epid != NULL);
-	assert(clid != NULL);
 
 	/*
 	 * void dt_program(dt_dctx_t *dctx)
@@ -1093,18 +1083,24 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	 *				// stdw [%r0 + DMST_FAULT], 0
 	 *	dctx->mst->tstamp = 0;	// stdw [%r0 + DMST_TSTAMP], 0
 	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
-	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
-	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
-	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
-	 *				// stw [%r9 + DBUF_EPID], EPID
+	 *	dctx->mst->stid = STID;	// stw [%r0 + DMST_STID], STID
 	 */
 	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_TSTAMP, 0));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_STID, pcb->pcb_stmt->dtsd_id));
+
+	/*
+	 *	*((uint32_t *)&buf[DBUF_PRID]) = dctx->mst->prid;
+	 *				// ld %r1, [%r0 + DMST_PRID]
+	 *				// st [%r9 + DBUF_PRID], %r1
+	 *	*((uint32_t *)&buf[DBUF_STID]) = stid;
+	 *				// st [%r9 + DBUF_STID], stid
+	 */
+	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
+	emit (dlp, BPF_STORE(BPF_W, BPF_REG_9, DBUF_PRID, BPF_REG_1));
+	emit (dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_STID, pcb->pcb_stmt->dtsd_id));
 
 	/*
 	 *	Set the speculation ID field to zero to indicate no active
@@ -1132,10 +1128,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	TRACE_REGSET("Prologue: End  ");
 
 	/*
-	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
-	 * offset 4).
+	 * Set the offset for the beginning of trace data.
 	 */
-	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
+	pcb->pcb_bufoff = DBUF_DATA;
 }
 
 /*
@@ -1170,15 +1165,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		/*
 		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
 		 *				   BPF_F_CURRENT_CPU,
-		 *				   buf - 4, bufoff + 4);
+		 *				   buf + 4, bufoff - 4);
 		 *				// lddw %r1, [%fp + DT_STK_DCTX]
 		 *				// lddw %r1, [%r1 + DCTX_CTX]
 		 *				// lddw %r2, &buffers
 		 *				// lddw %r3, BPF_F_CURRENT_CPU
 		 *				// mov %r4, %r9
-		 *				// add %r4, -4
+		 *				// add %r4, 4
 		 *				// mov %r5, pcb->pcb_bufoff
-		 *				// add %r5, 4
+		 *				// add %r5, -4
 		 *				// call bpf_perf_event_output
 		 */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
@@ -1186,9 +1181,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
 		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
 		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
 
 		/*
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 51eb6c80..99f5fa7b 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -15,9 +15,11 @@
 #include <alloca.h>
 #include <dt_impl.h>
 #include <dt_aggregate.h>
+#include <dt_dctx.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
 #include <dt_peb.h>
+#include <dt_probe.h>
 #include <dt_state.h>
 #include <dt_string.h>
 #include <libproc.h>
@@ -433,7 +435,7 @@ static dt_htab_ops_t dt_spec_buf_htab_ops = {
 };
 
 static int
-dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
+dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_id_t lastprid, dtrace_stid_t laststid)
 {
 	dtrace_probedesc_t	*pd = data->dtpda_pdesc;
 	dtrace_flowkind_t	flow = DTRACEFLOW_NONE;
@@ -445,7 +447,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
 	static const char	*r_str[2] = { " <- ", " <= " };
 	static const char	*ent = "entry", *ret = "return";
 	static int		entlen = 0, retlen = 0;
-	dtrace_epid_t		id = data->dtpda_epid;
+	dtrace_stid_t		stid = data->dtpda_stid;
 
 	if (entlen == 0) {
 		assert(retlen == 0);
@@ -473,13 +475,12 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
 
 	/*
 	 * If we're going to indent this, we need to check the ID of our last
-	 * call.  If we're looking at the same probe ID but a different EPID,
+	 * call.  If we're looking at the same probe ID but a different STID,
 	 * we _don't_ want to indent.  (Yes, there are some minor holes in
 	 * this scheme -- it's a heuristic.)
 	 */
 	if (flow == DTRACEFLOW_ENTRY) {
-		if (last != DTRACE_EPIDNONE && id != last &&
-		    pd->id == dtp->dt_pdesc[last]->id)
+		if (stid != laststid && pd->id == lastprid)
 			flow = DTRACEFLOW_NONE;
 	}
 
@@ -2145,8 +2146,8 @@ static dtrace_workstatus_t
 dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 		     dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
 		     dtrace_consume_rec_f *rfunc, int flow, int quiet,
-		     int peekflags, dtrace_epid_t *last, int committing,
-		     void *arg);
+		     int peekflags, dtrace_id_t *lastprid,
+		     dtrace_stid_t *laststid, int committing, void *arg);
 
 /*
  * Commit one speculation.
@@ -2155,7 +2156,8 @@ static dtrace_workstatus_t
 dt_commit_one_spec(dtrace_hdl_t *dtp, FILE *fp, dt_spec_buf_t *dtsb,
 		   dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
 		   dtrace_consume_rec_f *rfunc, int flow, int quiet,
-		   int peekflags, dtrace_epid_t *last, void *arg)
+		   int peekflags, dtrace_id_t *lastprid,
+		   dtrace_stid_t *laststid, void *arg)
 {
 	dt_spec_buf_data_t 	*dsbd;
 
@@ -2169,7 +2171,7 @@ dt_commit_one_spec(dtrace_hdl_t *dtp, FILE *fp, dt_spec_buf_t *dtsb,
 		ret = dt_consume_one_probe(dtp, fp, dsbd->dsbd_data,
 					   dsbd->dsbd_size, &specpdat,
 					   efunc, rfunc, flow, quiet,
-					   peekflags, last, 1, arg);
+					   peekflags, lastprid, laststid, 1, arg);
 		if (ret != DTRACE_WORKSTATUS_OKAY)
 			return ret;
 	}
@@ -2181,34 +2183,33 @@ static dtrace_workstatus_t
 dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 		     dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
 		     dtrace_consume_rec_f *rfunc, int flow, int quiet,
-		     int peekflags, dtrace_epid_t *last, int committing,
-		     void *arg)
+		     int peekflags, dtrace_id_t *lastprid,
+		     dtrace_stid_t *laststid, int committing, void *arg)
 {
-	dtrace_epid_t		epid;
+	int			specid;
+	dtrace_stid_t		stid;
+	uint32_t		prid;
 	dtrace_datadesc_t	*epd;
 	dt_spec_buf_t		tmpl;
 	dt_spec_buf_t		*dtsb;
-	int			specid;
 	int			i;
 	int			rval;
 	dtrace_workstatus_t	ret;
 	int			commit_discard_seen, only_commit_discards;
 	int			data_recording = 1;
 
-	epid = ((uint32_t *)data)[0];
-	specid = ((uint32_t *)data)[1];
+	specid = *((uint32_t *)(data + DBUF_SPECID));
+	prid = *((uint32_t *)(data + DBUF_PRID));
+	stid = *((uint32_t *)(data + DBUF_STID));
 
-	/*
-	 * Fill in the epid and address of the epid in the buffer.  We need to
-	 * pass this to the efunc and possibly to create speculations.
-	 */
-	pdat->dtpda_epid = epid;
+	pdat->dtpda_stid = stid;
 	pdat->dtpda_data = data;
 
-	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc,
-					 &pdat->dtpda_pdesc);
-	if (rval != 0)
-		return dt_set_errno(dtp, EDT_BADEPID);
+	if (prid > dtp->dt_probe_id)
+		return dt_set_errno(dtp, EDT_BADID);
+	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
+	if (dt_stid_lookup(dtp, stid, &pdat->dtpda_ddesc) != 0)
+		return dt_set_errno(dtp, EDT_BADSTID);
 
 	epd = pdat->dtpda_ddesc;
 	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
@@ -2306,7 +2307,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 
 	if (data_recording) {
 		if (flow)
-			dt_flowindent(dtp, pdat, *last);
+			dt_flowindent(dtp, pdat, *lastprid, *laststid);
 
 		rval = (*efunc)(pdat, arg);
 
@@ -2569,14 +2570,15 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 	}
 
 	/*
-	 * Call the record callback with a NULL record to indicate
-	 * that we're done processing this EPID.  The return value is ignored in
-	 * this case. XXX should we respect at least DTRACE_CONSUME_ABORT?
+	 * Call the record callback with a NULL record to indicate that we're
+	 * done processing this record.  The return value is ignored in this
+	 * case. XXX should we respect at least DTRACE_CONSUME_ABORT?
 	 */
 	if (data_recording) {
 		(*rfunc)(pdat, NULL, arg);
 
-		*last = epid;
+		*lastprid = prid;
+		*laststid = stid;
 	}
 
 	/*
@@ -2597,7 +2599,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 				if ((ret = dt_commit_one_spec(dtp, fp, dtsb,
 							      pdat, efunc, rfunc,
 							      flow, quiet, peekflags,
-							      last, arg)) !=
+							      lastprid, laststid, arg)) !=
 				    DTRACE_WORKSTATUS_OKAY) {
 					dt_spec_buf_data_destroy(dtp, dtsb);
 					return ret;
@@ -2623,7 +2625,7 @@ static dtrace_workstatus_t
 dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 	       dtrace_probedata_t *pdat, dtrace_consume_probe_f *efunc,
 	       dtrace_consume_rec_f *rfunc, int flow, int quiet, int peekflags,
-	       dtrace_epid_t *last, void *arg)
+	       dtrace_id_t *lastprid, dtrace_stid_t *laststid, void *arg)
 {
 	char				*data = buf;
 	struct perf_event_header	*hdr;
@@ -2639,8 +2641,8 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 		 * struct {
 		 *	struct perf_event_header	header;
 		 *	uint32_t			size;
-		 *	uint32_t			pad;
-		 *	uint32_t			epid;
+		 *	uint32_t			prid;
+		 *	uint32_t			stid;
 		 *	uint32_t			specid;
 		 *	uint64_t			data[n];
 		 * }
@@ -2651,17 +2653,21 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 			return dt_set_errno(dtp, EDT_DSIZE);
 
 		size = *(uint32_t *)data;
-		data += sizeof(size);
 		ptr += sizeof(size) + size;
 		if (ptr != buf + hdr->size)
 			return dt_set_errno(dtp, EDT_DSIZE);
 
-		data += sizeof(uint32_t);		/* skip padding */
-		size -= sizeof(uint32_t);
+		/*
+		 * "size" measures from after &size to the end.  But buffer
+		 * offsets are relative to &size itself, to preserve 8-byte
+		 * alignment.  So, we leave data pointing at &size, and we
+		 * increase size by 4 bytes.
+		 */
+		size += 4;
 
 		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
 					    rfunc, flow, quiet, peekflags,
-					    last, 0, arg);
+					    lastprid, laststid, 0, arg);
 	} else if (hdr->type == PERF_RECORD_LOST) {
 		return DTRACE_WORKSTATUS_OKAY;
 	} else
@@ -2692,7 +2698,8 @@ dt_consume_cpu(dtrace_hdl_t *dtp, FILE *fp, dt_peb_t *peb,
 {
 	struct perf_event_mmap_page	*rb_page = (void *)peb->base;
 	struct perf_event_header	*hdr;
-	dtrace_epid_t			last = DTRACE_EPIDNONE;
+	dtrace_id_t			lastprid;
+	dtrace_stid_t			laststid;
 	char				*base;
 	char				*event;
 	uint32_t			len;
@@ -2764,7 +2771,7 @@ dt_consume_cpu(dtrace_hdl_t *dtp, FILE *fp, dt_peb_t *peb,
                 }
 
                 rval = dt_consume_one(dtp, fp, event, &pdat, efunc, rfunc, flow,
-                                      quiet, peekflags, &last, arg);
+                                      quiet, peekflags, &lastprid, &laststid, arg);
                 if (rval == DTRACE_WORKSTATUS_DONE)
                   return DTRACE_WORKSTATUS_OKAY;
                 if (rval != DTRACE_WORKSTATUS_OKAY)
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 1422ad24..c05bf3bb 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -18,9 +18,8 @@
  * The DTrace machine state.
  */
 typedef struct dt_mstate {
-	uint32_t	epid;		/* Enabled probe ID */
 	uint32_t	prid;		/* Probe ID */
-	uint32_t	clid;		/* Clause ID (unique per probe) */
+	uint32_t	stid;		/* Statement ID */
 	uint32_t	tag;		/* Tag (for future use) */
 	uint32_t	scratch_top;	/* Current top of scratch space */
 	int32_t		syscall_errno;	/* syscall errno */
@@ -33,9 +32,8 @@ typedef struct dt_mstate {
 	uint64_t	saved_argv[10];	/* Saved probe arguments */
 } dt_mstate_t;
 
-#define DMST_EPID		offsetof(dt_mstate_t, epid)
 #define DMST_PRID		offsetof(dt_mstate_t, prid)
-#define DMST_CLID		offsetof(dt_mstate_t, clid)
+#define DMST_STID		offsetof(dt_mstate_t, stid)
 #define DMST_TAG		offsetof(dt_mstate_t, tag)
 #define DMST_SCRATCH_TOP	offsetof(dt_mstate_t, scratch_top)
 #define DMST_ERRNO		offsetof(dt_mstate_t, syscall_errno)
@@ -82,16 +80,23 @@ typedef struct dt_dctx {
  * The dctx->buf pointer references a block of memory that contains:
  *
  *                       +----------------+
- *                  0 -> | EPID           |
+ *                  0 -> | size           |
  *                       +----------------+
- *		    4 -> | Speculation ID |
+ *                  4 -> | PRID           |
  *                       +----------------+
- *                       | Trace Data     |
+ *                  8 -> | STID           |
+ *                       +----------------+
+ *                 12 -> | Speculation ID |
+ *                       +----------------+
+ *                 16 -> | Trace Data     |
  *                       |      ...       |
  *                       +----------------+
  */
-#define DBUF_EPID	0
-#define DBUF_SPECID	4
+#define DBUF_SIZE	0
+#define DBUF_PRID	4
+#define DBUF_STID	8
+#define DBUF_SPECID	12
+#define DBUF_DATA	16
 
 /*
  * The dctx->mem pointer references a block of memory that contains:
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index bc883e11..ba4d4abe 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -73,9 +73,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
 
 	/* BPF internal identifiers */
-	DT_BPF_SYMBOL_ID(EPID, DT_IDENT_SCALAR, DT_CONST_EPID),
 	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
-	DT_BPF_SYMBOL_ID(CLID, DT_IDENT_SCALAR, DT_CONST_CLID),
 	DT_BPF_SYMBOL_ID(ARGC, DT_IDENT_SCALAR, DT_CONST_ARGC),
 	DT_BPF_SYMBOL_ID(STBSZ, DT_IDENT_SCALAR, DT_CONST_STBSZ),
 	DT_BPF_SYMBOL_ID(STRSZ, DT_IDENT_SCALAR, DT_CONST_STRSZ),
diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index dbf18c76..16a605d3 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -54,7 +54,7 @@ static const struct {
 	{ EDT_DOFFSET,	"Data record offset exceeds buffer boundary" },
 	{ EDT_DALIGN,	"Data record has inappropriate alignment" },
 	{ EDT_DSIZE,	"Data record has incorrect size" },
-	{ EDT_BADEPID,	"Invalid EPID" },
+	{ EDT_BADSTID,	"Invalid statement ID" },
 	{ EDT_BADOPTNAME, "Invalid option name" },
 	{ EDT_BADOPTVAL, "Invalid value for specified option" },
 	{ EDT_BADOPTCTX, "Option cannot be used from within a D program" },
diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index 4c9b9413..468dde54 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -14,6 +14,7 @@
 #include <alloca.h>
 
 #include <dt_impl.h>
+#include <dt_probe.h>
 #include <dt_program.h>
 
 static const char _dt_errprog[] =
@@ -127,9 +128,9 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	dtrace_datadesc_t *dd = data->dtpda_ddesc, *errdd;
 	dtrace_probedesc_t *pd = data->dtpda_pdesc, *errpd;
 	dtrace_errdata_t err;
-	dtrace_epid_t epid;
+	dtrace_id_t prid;
+	dtrace_stid_t stid;
 
-	char where[30];
 	char details[30];
 	char offinfo[30];
 	const int slop = 80;
@@ -144,34 +145,32 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 		return dt_set_errno(dtp, EDT_BADERROR);
 
 	/*
-	 * This is an error.  We have the following items here:  EPID,
-	 * faulting action, BPF pc, fault code and faulting address.
+	 * This is an error.  We have the following items here:  PRID,
+	 * statement ID, BPF pc, fault code and faulting address.
 	 */
-	epid = (uint32_t)DT_REC(uint64_t, 0);
+	prid = DT_REC(uint64_t, 0);
+	stid = DT_REC(uint64_t, 1);
 
-	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
+	if (prid > dtp->dt_probe_id)
 		return dt_set_errno(dtp, EDT_BADERROR);
-
+	if (dt_stid_lookup(dtp, stid, &errdd) != 0)
+		return dt_set_errno(dtp, EDT_BADERROR);
+	errpd = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 	err.dteda_ddesc = errdd;
 	err.dteda_pdesc = errpd;
 	err.dteda_cpu = data->dtpda_cpu;
-	err.dteda_action = (int)DT_REC(uint64_t, 1);
+	err.dteda_action = stid;
 	err.dteda_offset = (int)DT_REC(uint64_t, 2);
 	err.dteda_fault = (int)DT_REC(uint64_t, 3);
 	err.dteda_addr = DT_REC(uint64_t, 4);
 
 	faultstr = dtrace_faultstr(dtp, err.dteda_fault);
-	len = sizeof(where) + sizeof(offinfo) + strlen(faultstr) +
+	len = sizeof(offinfo) + strlen(faultstr) +
 	      strlen(errpd->prv) + strlen(errpd->mod) + strlen(errpd->fun) +
 	      strlen(errpd->prb) + slop;
 
 	str = (char *)alloca(len);
 
-	if (err.dteda_action == 0)
-		sprintf(where, "predicate");
-	else
-		sprintf(where, "action #%d", err.dteda_action);
-
 	if (err.dteda_offset != -1)
 		sprintf(offinfo, " at BPF pc %d", err.dteda_offset);
 	else
@@ -195,11 +194,12 @@ no_addr:
 		details[0] = 0;
 	}
 
-	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
-			   "%s%s in %s%s",
-		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
+	snprintf(str, len, "error in %s for probe ID %u (%s:%s:%s:%s): "
+			   "%s%s%s",
+		 dtp->dt_stmts[stid]->dtsd_clause->di_name,
+		 errpd->id, errpd->prv, errpd->mod, errpd->fun,
 		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
-		 where, offinfo);
+		 offinfo);
 
 	err.dteda_msg = str;
 
@@ -256,8 +256,9 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
 	str = alloca(len);
 
 	snprintf(str, len,
-		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
-		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
+		 "error in %s for probe ID %u (%s:%s:%s:%s): %s",
+		 dtp->dt_stmts[data->dtpda_stid]->dtsd_clause->di_name,
+		 errpd->id, errpd->prv, errpd->mod,
 		 errpd->fun, errpd->prb, faultstr);
 
 	err.dteda_msg = str;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 98fddc23..c0399a06 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -271,10 +271,11 @@ struct dtrace_hdl {
 	const char *dt_errtag;	/* tag used with last call to dt_set_errmsg() */
 	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
 	ulong_t dt_gen;		/* compiler generation number */
-	uint_t dt_clause_nextid; /* next ID to use for programs */
+	uint_t dt_stmt_nextid;	/* next ID to use for statements */
 	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
 	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
 	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
+	dtrace_stmtdesc_t **dt_stmts; /* array of stmts */
 	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
 	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
 	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
@@ -341,10 +342,6 @@ struct dtrace_hdl {
 	ctf_id_t dt_type_symaddr; /* cached CTF identifier for _symaddr type */
 	ctf_id_t dt_type_usymaddr; /* cached CTF ident. for _usymaddr type */
 	ctf_id_t dt_type_void;	/* cached CTF identifier for void type */
-	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
-	size_t dt_maxprobe;	/* max enabled probe ID */
-	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
-	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
 	struct dt_aggregate *dt_aggregate; /* aggregate */
@@ -604,7 +601,7 @@ enum {
 	EDT_DOFFSET,		/* record data offset error */
 	EDT_DALIGN,		/* record data alignment error */
 	EDT_DSIZE,		/* record data size error */
-	EDT_BADEPID,		/* invalid enabled probe id */
+	EDT_BADSTID,		/* invalid statement id */
 	EDT_BADOPTNAME,		/* invalid dtrace_setopt option name */
 	EDT_BADOPTVAL,		/* invalid dtrace_setopt option value */
 	EDT_BADOPTCTX,		/* invalid dtrace_setopt option context */
@@ -773,11 +770,7 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
 extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
 extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
-extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *,
-				 dtrace_id_t);
-extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **,
-			  dtrace_probedesc_t **);
-extern void dt_epid_destroy(dtrace_hdl_t *);
+extern int dt_stid_lookup(dtrace_hdl_t *, dtrace_stid_t, dtrace_datadesc_t **);
 typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
 extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
 			   uint32_t, uint16_t, dt_pfargv_t *, uint64_t);
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index 60a2eca2..50d0aaa7 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -85,98 +85,18 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
 	return 0;
 }
 
-/*
- * Associate a probe data description and probe description with an enabled
- * probe ID.  This means that the given ID refers to the program matching the
- * probe data description being attached to the probe that matches the probe
- * description.
- */
-dtrace_epid_t
-dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
-{
-	dtrace_id_t	max = dtp->dt_maxprobe;
-	dtrace_epid_t	epid;
-
-	epid = dtp->dt_nextepid++;
-	if (epid >= max || dtp->dt_ddesc == NULL) {
-		dtrace_id_t		nmax = max ? (max << 1) : 2;
-		dtrace_datadesc_t	**nddesc;
-		dtrace_probedesc_t	**npdesc;
-
-		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
-		npdesc = dt_calloc(dtp, nmax, sizeof(void *));
-		if (nddesc == NULL || npdesc == NULL) {
-			dt_free(dtp, nddesc);
-			dt_free(dtp, npdesc);
-			return dt_set_errno(dtp, EDT_NOMEM);
-		}
-
-		if (dtp->dt_ddesc != NULL) {
-			size_t	osize = max * sizeof(void *);
-
-			memcpy(nddesc, dtp->dt_ddesc, osize);
-			dt_free(dtp, dtp->dt_ddesc);
-			memcpy(npdesc, dtp->dt_pdesc, osize);
-			dt_free(dtp, dtp->dt_pdesc);
-		}
-
-		dtp->dt_ddesc = nddesc;
-		dtp->dt_pdesc = npdesc;
-		dtp->dt_maxprobe = nmax;
-	}
-
-	if (dtp->dt_ddesc[epid] != NULL)
-		return epid;
-
-	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
-	dtp->dt_pdesc[epid] = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
-
-	return epid;
-}
-
 int
-dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
-	       dtrace_probedesc_t **pdp)
+dt_stid_lookup(dtrace_hdl_t *dtp, dtrace_stid_t stid, dtrace_datadesc_t **ddp)
 {
-	if (epid >= dtp->dt_maxprobe ||
-	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
-		return -1;
-
-	*ddp = dtp->dt_ddesc[epid];
-	*pdp = dtp->dt_pdesc[epid];
-
-	return 0;
-}
-
-void
-dt_epid_destroy(dtrace_hdl_t *dtp)
-{
-	size_t i;
-
-	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
-	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
-	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
-
-	if (dtp->dt_pdesc == NULL)
-		return;
+	dtrace_difo_t *rdp;
 
-	for (i = 0; i < dtp->dt_maxprobe; i++) {
-		if (dtp->dt_ddesc[i] == NULL) {
-			assert(dtp->dt_pdesc[i] == NULL);
-			continue;
-		}
-
-		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
-		assert(dtp->dt_pdesc[i] != NULL);
-	}
+	if (stid >= dtp->dt_stmt_nextid)
+		return -1;
 
-	free(dtp->dt_pdesc);
-	dtp->dt_pdesc = NULL;
+	rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[stid]->dtsd_clause);
+	*ddp = rdp->dtdo_ddesc;
 
-	free(dtp->dt_ddesc);
-	dtp->dt_ddesc = NULL;
-	dtp->dt_nextepid = 0;
-	dtp->dt_maxprobe = 0;
+	return (*ddp == NULL) ? -1 : 0;
 }
 
 uint32_t
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 77ffb6d2..848141dd 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -170,7 +170,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "void(int)" },
 { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_type, "uint_t" },
+	&dt_idops_type, "uint64_t" },
 { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "int" },
 { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
@@ -739,8 +739,6 @@ dt_vopen(int version, int flags, int *errp,
 	dt_proc_hash_create(dtp);
 	dt_proc_signal_init(dtp);
 	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
-	dtp->dt_nextepid = 1;
-	dtp->dt_maxprobe = 0;
 	if (dt_aggregate_init(dtp) == -1)
 		return set_open_errno(dtp, errp, dtrace_errno(dtp));
 	dtp->dt_vmax = DT_VERS_LATEST;
@@ -1303,7 +1301,6 @@ dtrace_close(dtrace_hdl_t *dtp)
 	if (dtp->dt_poll_fd != -1)
 		close(dtp->dt_poll_fd);
 
-	dt_epid_destroy(dtp);
 	dt_aggid_destroy(dtp);
 	dt_buffered_destroy(dtp);
 	dt_aggregate_destroy(dtp);
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index afbf7265..09956f22 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -100,7 +100,7 @@ dtrace_program_info(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
 
 		/*
 		 * If there aren't any actions, account for the fact that
-		 * recording the epid will generate a record.
+		 * the default action will generate a record.
 		 */
 		dp = dt_dlib_get_func_difo(dtp, stp->ds_desc->dtsd_clause);
 		if (dp != NULL)
@@ -165,6 +165,13 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
 	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
 	int			rc;
 
+	if (dtp->dt_stmts == NULL) {
+		dtp->dt_stmts = dt_calloc(dtp, dtp->dt_stmt_nextid, sizeof(dtrace_stmtdesc_t *));
+		if (dtp->dt_stmts == NULL)
+			return dt_set_errno(dtp, EDT_NOMEM);
+	}
+	dtp->dt_stmts[sdp->dtsd_id] = sdp;
+
 	st.cnt = cnt;
 	st.sdp = sdp;
 	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 09a87977..0f716cd4 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -150,6 +150,7 @@ typedef struct dtrace_stmtdesc {
 	dtrace_attribute_t dtsd_descattr;	/* probedesc attributes */
 	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
 	int dtsd_clauseflags;			/* clause flags */
+	int dtsd_id;				/* index in dtp->dt_stmts */
 } dtrace_stmtdesc_t;
 
 /* dtsd clause flags */
@@ -189,7 +190,7 @@ typedef enum {
 
 typedef struct dtrace_probedata {
 	dtrace_hdl_t *dtpda_handle;		/* handle to DTrace library */
-	dtrace_epid_t dtpda_epid;		/* enabled probe ID */
+	dtrace_stid_t dtpda_stid;		/* statement ID */
 	dtrace_datadesc_t *dtpda_ddesc;		/* probe data description */
 	dtrace_probedesc_t *dtpda_pdesc;	/* probe description */
 	unsigned int dtpda_cpu;			/* CPU for data */
diff --git a/test/demo/builtin/eipd.d b/test/demo/builtin/eipd.d
deleted file mode 100644
index 659b0940..00000000
--- a/test/demo/builtin/eipd.d
+++ /dev/null
@@ -1,4 +0,0 @@
-BEGIN {
-	trace(epid);
-	exit(0);
-}
diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
index d3904f47..3c434721 100644
--- a/test/demo/dtrace/error.r
+++ b/test/demo/dtrace/error.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
index 528d6c25..c510045b 100644
--- a/test/demo/spec/specopen.d
+++ b/test/demo/spec/specopen.d
@@ -2,7 +2,7 @@
 
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -33,8 +33,7 @@ fbt:::
 /self->spec/
 {
 	/*
-	 * A speculate() with no other actions speculates the default action:
-	 * tracing the EPID.
+	 * A speculate() with no other actions speculates the default action.
 	 */
 	speculate(self->spec);
 }
diff --git a/test/stress/buffering/tst.resize3-manual.d b/test/stress/buffering/tst.resize3-manual.d
index 99589beb..56c8575d 100644
--- a/test/stress/buffering/tst.resize3-manual.d
+++ b/test/stress/buffering/tst.resize3-manual.d
@@ -31,7 +31,7 @@ BEGIN
 BEGIN
 {
 	speculate(spec);
-	trace(epid);
+	trace(12345678);
 }
 
 BEGIN
diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
index 43b647c7..3a1fd5da 100644
--- a/test/stress/buffering/tst.resize3-manual.r
+++ b/test/stress/buffering/tst.resize3-manual.r
@@ -1,5 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN           3
+                          :BEGIN    12345678
                           :BEGIN 
 
 -- @@stderr --
diff --git a/test/stress/buffering/tst.resize3.d b/test/stress/buffering/tst.resize3.d
index 59fe0b4a..464bf566 100644
--- a/test/stress/buffering/tst.resize3.d
+++ b/test/stress/buffering/tst.resize3.d
@@ -27,7 +27,7 @@ BEGIN
 BEGIN
 {
 	speculate(spec);
-	trace(epid);
+	trace(12345678);
 }
 
 BEGIN
diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
index 9c471158..33384c71 100644
--- a/test/stress/buffering/tst.resize3.r
+++ b/test/stress/buffering/tst.resize3.r
@@ -1,5 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN           3
+                          :BEGIN    12345678
                           :BEGIN 
 
 -- @@stderr --
diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
index 29e39fd4..e2f6d2c3 100644
--- a/test/unittest/actions/setopt/tst.badopt.r
+++ b/test/unittest/actions/setopt/tst.badopt.r
@@ -1,16 +1,16 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
 
diff --git a/test/unittest/arrays/tst.declared-bounds.runtime_out.r b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
index 4917528d..9ab1ab8d 100644
--- a/test/unittest/arrays/tst.declared-bounds.runtime_out.r
+++ b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
@@ -1,3 +1,3 @@
 expected run-time error
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): index out of bounds (8) at BPF pc NNN
diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
index 884b43f4..cd035080 100755
--- a/test/unittest/builtinvar/tst.id_ERROR.r.p
+++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
 # Drop the line with run-dependent PRID for profile probe.
-!/error on enabled probe ID/ { print }
+!/dtrace: error in dt_clause_. for probe ID [0-9]* \(profile:::tick-1s):/ { print }
diff --git a/test/unittest/codegen/err.deref_0.r b/test/unittest/codegen/err.deref_0.r
index 07c1dc52..812ca433 100644
--- a/test/unittest/codegen/err.deref_0.r
+++ b/test/unittest/codegen/err.deref_0.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (0) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_1.r b/test/unittest/codegen/err.deref_1.r
index a2ca8ac4..01ca1037 100644
--- a/test/unittest/codegen/err.deref_1.r
+++ b/test/unittest/codegen/err.deref_1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_i0.r b/test/unittest/codegen/err.deref_i0.r
index 07c1dc52..812ca433 100644
--- a/test/unittest/codegen/err.deref_i0.r
+++ b/test/unittest/codegen/err.deref_i0.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (0) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_i1.r b/test/unittest/codegen/err.deref_i1.r
index a2ca8ac4..01ca1037 100644
--- a/test/unittest/codegen/err.deref_i1.r
+++ b/test/unittest/codegen/err.deref_i1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-assoc.r b/test/unittest/codegen/err.deref_string-assoc.r
index 08277992..5d4a36ff 100644
--- a/test/unittest/codegen/err.deref_string-assoc.r
+++ b/test/unittest/codegen/err.deref_string-assoc.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-gvar.r b/test/unittest/codegen/err.deref_string-gvar.r
index 08277992..5d4a36ff 100644
--- a/test/unittest/codegen/err.deref_string-gvar.r
+++ b/test/unittest/codegen/err.deref_string-gvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-lvar.r b/test/unittest/codegen/err.deref_string-lvar.r
index 08277992..5d4a36ff 100644
--- a/test/unittest/codegen/err.deref_string-lvar.r
+++ b/test/unittest/codegen/err.deref_string-lvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-tvar.r b/test/unittest/codegen/err.deref_string-tvar.r
index 08277992..5d4a36ff 100644
--- a/test/unittest/codegen/err.deref_string-tvar.r
+++ b/test/unittest/codegen/err.deref_string-tvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address (1) at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset.r b/test/unittest/codegen/err.str_NULL_plus_offset.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
index 06d7c52b..53e5f618 100644
--- a/test/unittest/disasm/tst.vartab-bvar.r
+++ b/test/unittest/disasm/tst.vartab-bvar.r
@@ -4,7 +4,7 @@ curthread               scl glb r    D type (pointer) (size 8)
 timestamp               scl glb r    D type (integer) (size 8)
 vtimestamp              scl glb r    D type (integer) (size 8)
 ipl                     scl glb r    D type (integer) (size 4)
-epid                    scl glb r    D type (integer) (size 4)
+epid                    scl glb r    D type (integer) (size 8)
 id                      scl glb r    D type (integer) (size 4)
 arg0                    scl glb r    D type (integer) (size 8)
 arg1                    scl glb r    D type (integer) (size 8)
diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
index 9fa54dd9..364e0860 100644
--- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
+++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
@@ -4,4 +4,4 @@
 -- @@stderr --
 dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
 dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d
index df3ded2d..8b7a4d63 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2021, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -15,13 +15,13 @@
 
 BEGIN
 {
-	myepid = epid;
+	myid = id;
 	trace(((struct task_struct *)NULL)->pid);
 	exit(1);
 }
 
 ERROR
 {
-	exit(arg1 != myepid || arg2 != 1 || arg4 != DTRACEFLT_BADADDR ||
+	exit(arg1 != myid || arg2 != 0 || arg4 != DTRACEFLT_BADADDR ||
 	     arg5 != 0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
index b9f5f43c..ec23cd45 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
@@ -1,6 +1,6 @@
-The arguments are 3 1 1 0
+The arguments are 1 1 1 0
 The value of arg4 should be 1
 The value of arg5 should be 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
index 6c5fa119..712678d8 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
@@ -1,6 +1,6 @@
-The arguments are 3 1 1 16384
+The arguments are 1 1 1 16384
 The value of arg4 should be 1
 The value of arg5 should be 16384
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d
index bcd5e9aa..b1d15423 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -13,9 +13,14 @@
 
 #pragma D option quiet
 
+BEGIN { myid = id } /* clause 0 */
+BEGIN { myid = id } /* clause 1 */
+BEGIN { myid = id } /* clause 2 */
+BEGIN { myid = id } /* clause 3 */
+
 BEGIN
 {
-	myepid = epid;
+	myid = id;
 	i = 1;
 	j = 2;
 	j = i / (j - 2);
@@ -24,6 +29,6 @@ BEGIN
 
 ERROR
 {
-	exit(arg1 != myepid || arg2 != 1 || arg4 != DTRACEFLT_DIVZERO ||
+	exit(arg1 != myid || arg2 != 4 || arg4 != DTRACEFLT_DIVZERO ||
 	     arg5 != 0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
index e6d6afa2..45a787e5 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
+dtrace: error in dt_clause_4 for probe ID 1 (dtrace:::BEGIN): divide-by-zero at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d
index 105523f8..69452d8c 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2021, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -13,9 +13,14 @@
 
 #pragma D option quiet
 
+BEGIN { myid = id; } /* clause 0 */
+BEGIN { myid = id; } /* clause 1 */
+BEGIN { myid = id; } /* clause 2 */
+BEGIN { myid = id; } /* clause 3 */
+
 BEGIN
 {
-	myepid = epid;
+	myid = id;
 	i = 1;
 	j = 2;
 	j = i % (j - 2);
@@ -24,6 +29,6 @@ BEGIN
 
 ERROR
 {
-	exit(arg1 != myepid || arg2 != 1 || arg4 != DTRACEFLT_DIVZERO ||
+	exit(arg1 != myid || arg2 != 4 || arg4 != DTRACEFLT_DIVZERO ||
 	     arg5 != 0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
index e6d6afa2..45a787e5 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
+dtrace: error in dt_clause_4 for probe ID 1 (dtrace:::BEGIN): divide-by-zero at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index 1e4fdd64..caa5570f 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,5 +1,5 @@
-The arguments are 3 1 PC 1 64
+The arguments are 1 1 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-begin-ended.r b/test/unittest/error/tst.clause_scope-begin-ended.r
index 8d57382e..e806cc80 100644
--- a/test/unittest/error/tst.clause_scope-begin-ended.r
+++ b/test/unittest/error/tst.clause_scope-begin-ended.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-begin.r b/test/unittest/error/tst.clause_scope-begin.r
index 8d57382e..e806cc80 100644
--- a/test/unittest/error/tst.clause_scope-begin.r
+++ b/test/unittest/error/tst.clause_scope-begin.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-regular.r b/test/unittest/error/tst.clause_scope-regular.r
index fff6fe1e..d1b71add 100644
--- a/test/unittest/error/tst.clause_scope-regular.r
+++ b/test/unittest/error/tst.clause_scope-regular.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID nnn: profile:::tick-10ms): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID nnn (profile:::tick-10ms): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
index 7659601b..f7a200c4 100755
--- a/test/unittest/error/tst.clause_scope-regular.r.p
+++ b/test/unittest/error/tst.clause_scope-regular.r.p
@@ -1,3 +1,7 @@
-#!/bin/sed -f
+#!/usr/bin/awk -f
+
 # This report has a variable probe ID in it.
-s/ID [0-9][0-9]*: profile/ID nnn: profile/
+{
+    sub("for probe ID [0-9][0-9]* .profile", "for probe ID nnn (profile");
+    print;
+}
diff --git a/test/unittest/error/tst.error.r b/test/unittest/error/tst.error.r
index 0d29bcc8..d9f80037 100644
--- a/test/unittest/error/tst.error.r
+++ b/test/unittest/error/tst.error.r
@@ -1,4 +1,4 @@
 Error fired
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/error/tst.errorend.r b/test/unittest/error/tst.errorend.r
index 73abf697..9c07fa70 100644
--- a/test/unittest/error/tst.errorend.r
+++ b/test/unittest/error/tst.errorend.r
@@ -2,4 +2,4 @@ Error fired
 End fired after exit
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_2 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
index 4257f567..fab8ca7f 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
index f5ff855d..6bea5653 100644
--- a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
+++ b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
+++ b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref.r b/test/unittest/funcs/alloca/err.alloca-null-deref.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-null-deref.r
+++ b/test/unittest/funcs/alloca/err.alloca-null-deref.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
index 4257f567..fab8ca7f 100644
--- a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
+++ b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy1.r b/test/unittest/funcs/bcopy/err.badbcopy1.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy1.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy4.r b/test/unittest/funcs/bcopy/err.badbcopy4.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy4.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy5.r b/test/unittest/funcs/bcopy/err.badbcopy5.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy5.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy5.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy6.r b/test/unittest/funcs/bcopy/err.badbcopy6.r
index 4257f567..fab8ca7f 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy6.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy6.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy7.r b/test/unittest/funcs/bcopy/err.badbcopy7.r
index 4257f567..fab8ca7f 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy7.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy7.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy8.r b/test/unittest/funcs/bcopy/err.badbcopy8.r
index 4257f567..fab8ca7f 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy8.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy8.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyin/err.badaddr.r b/test/unittest/funcs/copyin/err.badaddr.r
index ba4a4695..7b0c5949 100644
--- a/test/unittest/funcs/copyin/err.badaddr.r
+++ b/test/unittest/funcs/copyin/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyin/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyin/err.null_arg1.r b/test/unittest/funcs/copyin/err.null_arg1.r
index a806d107..270dc9ce 100644
--- a/test/unittest/funcs/copyin/err.null_arg1.r
+++ b/test/unittest/funcs/copyin/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyin/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyinstr/err.badaddr.r b/test/unittest/funcs/copyinstr/err.badaddr.r
index 0f566d6e..6f341979 100644
--- a/test/unittest/funcs/copyinstr/err.badaddr.r
+++ b/test/unittest/funcs/copyinstr/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinstr/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyinstr/err.null_arg1.r b/test/unittest/funcs/copyinstr/err.null_arg1.r
index cdd7c22c..cac3de0e 100644
--- a/test/unittest/funcs/copyinstr/err.null_arg1.r
+++ b/test/unittest/funcs/copyinstr/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinstr/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.badaddr.r b/test/unittest/funcs/copyinto/err.badaddr.r
index 11861e1f..c86debc0 100644
--- a/test/unittest/funcs/copyinto/err.badaddr.r
+++ b/test/unittest/funcs/copyinto/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.badsize.r b/test/unittest/funcs/copyinto/err.badsize.r
index ec4b062e..1be8abf4 100644
--- a/test/unittest/funcs/copyinto/err.badsize.r
+++ b/test/unittest/funcs/copyinto/err.badsize.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.badsize.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid size ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.null_arg1.r b/test/unittest/funcs/copyinto/err.null_arg1.r
index f568ee5c..215e0f19 100644
--- a/test/unittest/funcs/copyinto/err.null_arg1.r
+++ b/test/unittest/funcs/copyinto/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/err.badalloca.r b/test/unittest/funcs/err.badalloca.r
index 30224330..078630b6 100644
--- a/test/unittest/funcs/err.badalloca.r
+++ b/test/unittest/funcs/err.badalloca.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID NNN: profile:::tick-1): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID NNN (profile:::tick-1): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/err.badalloca.r.p b/test/unittest/funcs/err.badalloca.r.p
index d7a88a39..93d0acfb 100755
--- a/test/unittest/funcs/err.badalloca.r.p
+++ b/test/unittest/funcs/err.badalloca.r.p
@@ -1,3 +1,7 @@
-#!/bin/sed -f
+#!/usr/bin/awk -f
 
-s/(ID [0-9]*/(ID NNN/g
+# This report has a variable probe ID in it.
+{
+    sub("for probe ID [0-9]* .profile", "for probe ID NNN (profile");
+    print;
+}
diff --git a/test/unittest/funcs/err.link_ntopbadaddr.r b/test/unittest/funcs/err.link_ntopbadaddr.r
index b798b5e0..5acdfe61 100644
--- a/test/unittest/funcs/err.link_ntopbadaddr.r
+++ b/test/unittest/funcs/err.link_ntopbadaddr.r
@@ -1,3 +1,3 @@
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
 
diff --git a/test/unittest/funcs/err.link_ntopbadarg.r b/test/unittest/funcs/err.link_ntopbadarg.r
index e386a67c..32c13dde 100644
--- a/test/unittest/funcs/err.link_ntopbadarg.r
+++ b/test/unittest/funcs/err.link_ntopbadarg.r
@@ -1,3 +1,3 @@
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
 
diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
+++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
+++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/strlen/tst.null.r b/test/unittest/funcs/strlen/tst.null.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/strlen/tst.null.r
+++ b/test/unittest/funcs/strlen/tst.null.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_null.r b/test/unittest/funcs/strtok/tst.strtok_null.r
index 03226aa1..319af487 100644
--- a/test/unittest/funcs/strtok/tst.strtok_null.r
+++ b/test/unittest/funcs/strtok/tst.strtok_null.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_null.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nulldel.r b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
index 70f8e4e2..82bbba19 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nulldel.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nulldel.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr.r b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
index a57b2469..1183b2bd 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nullstr.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
index d7df3aca..082e0e0c 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
@@ -4,4 +4,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr2.d' matched 4 probes
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/funcs/substr/err.substr_null_arg1.r b/test/unittest/funcs/substr/err.substr_null_arg1.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/funcs/substr/err.substr_null_arg1.r
+++ b/test/unittest/funcs/substr/err.substr_null_arg1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/pointers/err.AllocaOverrun.r b/test/unittest/pointers/err.AllocaOverrun.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/pointers/err.AllocaOverrun.r
+++ b/test/unittest/pointers/err.AllocaOverrun.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/pointers/err.BadAlign.r
+++ b/test/unittest/pointers/err.BadAlign.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/pointers/err.InvalidAddress2.r
+++ b/test/unittest/pointers/err.InvalidAddress2.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
index 187543b6..fa9c63a9 100644
--- a/test/unittest/pointers/err.InvalidAddress4.r
+++ b/test/unittest/pointers/err.InvalidAddress4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
diff --git a/test/unittest/speculation/err.CommitWithInvalid.r b/test/unittest/speculation/err.CommitWithInvalid.r
index fc072417..0449b242 100644
--- a/test/unittest/speculation/err.CommitWithInvalid.r
+++ b/test/unittest/speculation/err.CommitWithInvalid.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
diff --git a/test/unittest/speculation/err.DiscardWithInvalid.r b/test/unittest/speculation/err.DiscardWithInvalid.r
index fc072417..0449b242 100644
--- a/test/unittest/speculation/err.DiscardWithInvalid.r
+++ b/test/unittest/speculation/err.DiscardWithInvalid.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
+dtrace: error in dt_clause_1 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
diff --git a/test/unittest/speculation/tst.negcommit.r b/test/unittest/speculation/tst.negcommit.r
index 69f246a0..cf8fb6f8 100644
--- a/test/unittest/speculation/tst.negcommit.r
+++ b/test/unittest/speculation/tst.negcommit.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/speculation/tst.negcommit.d' matched 2 probes
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): illegal operation at BPF pc NNN
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
index 4f2c70f3..38cb38df 100755
--- a/test/unittest/variables/bvar/tst.arg3-ERROR.sh
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
@@ -120,7 +120,7 @@ done
 
 # Do a sanity check on DTrace's error output.
 
-awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
+awk '/^dtrace: error in dt_clause_[1-4] for probe ID 1 \(dtrace:::BEGIN): invalid address \(0x40) at BPF pc [0-9]*$/ { print $NF }' \
   disasm.out > err_pcs.txt.chk1
 if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
 	echo ERROR: problem with DTrace error output
-- 
2.43.5

