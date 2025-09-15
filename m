Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A2D1C5F2C
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757967398; cv=fail; b=DrAZmWuBR0AH9MXj5DKF20cIPvoVrUI9pBgdRiNPXO6Qr8YGpQuKp/KZH6wt7pHqmwEO4limQDYx3gE/40+7Iu60aoOQfcnLPL+GTuIxawgdPVCcuI+gJzxGr9gqbKfdLak1D2bRn+neW5ZEOE393aUCJOprCZaxk/qoxQDdGOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757967398; c=relaxed/simple;
	bh=z2kUYBvHei68Et9Y+xCp8z0W244CXmqBx//MQADTKC0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=REELxMvPedEo9OJxXtgPycIovGHC/gePu92yHlKSRQAxPqTEeYPZVoxUXFll3TSImPyXiq1sotBqitAtrOn8T9qWckdA4xy/MjNbau7abfU1/qqOGygf2ckR6gJl2Uhp6f4SqNtPy1AZ/pmUTrfoahwBJQY1JgNoXFdLmEqE9Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OuGPbxGq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RTqYc/AC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OuGPbxGq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RTqYc/AC"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FK7WKB026806
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=HLNW96Zr7Ha/0JMo
	LzCiGVeyxNGOTs1yj3HTmhKUrPQ=; b=OuGPbxGqk+Wxa1GFTLtHbf+zjvMIwb5x
	YozZZ2GOGe0ZmUpEZnN99FKh0sIqGjB1FmE4oF0h2Sh6Ddbg/UHU8WmRVMxe4bz3
	F3doUrmCBn/KOWEprNOwEMK0fSve35HjSw0pqAMd+yWnUuKzWCdmPj2iDGTY5gV0
	K1s1nmlk12aoE1oLf0RX6TEH+rjC6/lwd58M5houDeGFtIk9C5krWaSxeYbJouaH
	q/mz+NmK+WTxBa7qyZbio38P+nhSj4xvnkhAMvqqYoY5igXYNw5cgc6SGf5gmUnO
	iZs+y6xmbE+zZM1Ah0XTX+ePy8i1P7xbfhyuy92Hp8T0mUIK04193g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4950nf38we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:16:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58FIdACb010564
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:16:34 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2bgajb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 20:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1KFrvMoW13lebA/e9ISOjz847opiXQtHlxJbdd0z/lCVx/+TpKtSyz8MzbdmpmPEj0SRP13kwSeuLivb/4Omy3fC41mfZeD8emvISJe05EOz9TyWiAwKMeOztI2KLxFXNQq8CNTnSfMsRSlHqE8bJwyUR/xDH+YEdRD6fI910Md3iEYsET+sYxRdKSlm/zSxtRlCXixaDSom/QJZaET/7jRWHRmYdzUd+O3txPemnycAoP0tJXgpIJ65Phq/rZrhEYrxjgAC5sY+Yb617n5nf+cbbelQK3G9B2Eq+TSBYsoJHYIzDz+qCrEMey20PkRAEaT4jVAOOM3TrcSDCJlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLNW96Zr7Ha/0JMoLzCiGVeyxNGOTs1yj3HTmhKUrPQ=;
 b=pWUxjj3XsDE4s43lgPTv4DfJc29UbLhNrsTyNF2h7jrGe+eRL7LUzQWo7BaeZ/kROftZzGEqvbfSh506KZW1ULjNKBJJICautES35JeFYC4UPRCGNukXHhfnSaqFwkQ2NS1BHcsZ3+UbSbh52MTYDxU3ECzr3MWF+pkMvR4uV8CHNcYc9KgqoRHwj5/g7l3ZRK9o04c6SJuHQcv0ErhOHezIw0fgv5U1cR4qnNG5HAWXi56bK5c8T3dtrP6H6iAHGI/Uq+l+JojIxk0RkLtMXKhyL362ybdsoTjZqx7Cv6gtlERcX9KEJv/L0FuFW9rs8ZmTp4BptD0vL6rVOd7JaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLNW96Zr7Ha/0JMoLzCiGVeyxNGOTs1yj3HTmhKUrPQ=;
 b=RTqYc/AC0Nfsfb7xG0it6Vuj11qBWjkkurW12vqQaeG3uPKnyykfrs+TEpL+eVFw4+4/P/z35+HFEn06ChvWQCz531iagcspLxek2QS1yA3EOAkxEp8nPvgJ6SD76jRQmw1IC9POu1X5jflvvpSWFcFdDncSe4mNcCZZkGd+HSA=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by SJ2PR10MB7811.namprd10.prod.outlook.com (2603:10b6:a03:56e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 20:16:32 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 20:16:32 +0000
From: Elena Zannoni <elena.zannoni@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH] Add the userguide to the install step
Date: Mon, 15 Sep 2025 14:15:42 -0600
Message-ID: <20250915201616.1364605-1-elena.zannoni@oracle.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0106.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::7) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|SJ2PR10MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5dce16-7a02-4e5e-06c6-08ddf494c2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+rX+bnKvAIkWmu8gVGbAKx9Udoye6H3j6oiqIGMHnLlEFO1Tqw8PBW51XODP?=
 =?us-ascii?Q?vc3ij+U9076jT3KgE/MXu4ss342FPUQZ2i0yZnqEFmoWhDSZswQRGY14vC/D?=
 =?us-ascii?Q?aXEOEfbM1UQI/OSxEdcDbzOZflKk4n1DgXMB8jM7p6TLpbeY6fjwam60D9+J?=
 =?us-ascii?Q?KHJ2baIr0wfowZEKmxiHAZs6gytNC997JILRaFc64J9+wNnQYULPH9xLoaLR?=
 =?us-ascii?Q?oBWy7OLvyR4bDarm+lhSqcrbXZMuvZ6ZwnR3XtP6GgYhbcsD/Z+Ic4z1YU2w?=
 =?us-ascii?Q?+57tZ9js7XRCDXvWfe/JtIrVI3qiUHY74CTKnF2yBqbC4mL66fR4cK85R1WR?=
 =?us-ascii?Q?xtz5UyVLZWWsQjZwhSu0slZMh4bJUOUkzvQDkWS9adRoxiH4ZRp5pCWMpTbC?=
 =?us-ascii?Q?rWwDbBZ69sgZCcM9zeFQT/tx2zBEbrZ6JxawV2K9KPV1VHblujCZvGv3H1IE?=
 =?us-ascii?Q?lS3K9Pi3nfGnRmncCgNuV+BqZ9YY8qJJIX/O+Z4qHEnxN4BMyXoDUiggEDsw?=
 =?us-ascii?Q?oJyspecs/DbtJ2AIPp4oEj8bCkhLcY7x3hdrweN0tclIErUP3wsyXWjwTKHy?=
 =?us-ascii?Q?3q0+GbQEK4rfLkOohc7SN5TzoTPovJGhxwKciQmzFhKB+3+uB1R3PHICgI9B?=
 =?us-ascii?Q?M4pbInUu9VyaoDzSFyIcic5Tu6RVXIEZ9f7renXXBRQRnbjAcFKG2pDIPECR?=
 =?us-ascii?Q?gj8SSoy98oYnI3PevQDp1rDplqs00isCWP/MuXGzqC52xV9NZrGDkH471W/K?=
 =?us-ascii?Q?+A39AZZiuWw9TWKvOoPuwTuwx0RzkQXx6sIp3oLsPG/ZKWmg/NZtPb8gjjAo?=
 =?us-ascii?Q?3gYey4nN+4TXysEXHLeT5rkhEvM8lRzruLTYrYIUkk6hvQBh/QQMQo8kDtJh?=
 =?us-ascii?Q?cpx4Ghts/k+TGV7oWtDaZ5wXkg6Een7H9Br7MMbnMT5F9Zyer3CeaaQsIib2?=
 =?us-ascii?Q?1CZ/qtAWy8catOOEsKXJAsJiD6vmDoAEBVNKAmAWtBwBsnrluFH+9qtlx8XE?=
 =?us-ascii?Q?kSx2Lbx2y5TTQDMlqoqSUjH0GVaCuGATxfe8ylvyNdTWeX4989A5PiYWAw1r?=
 =?us-ascii?Q?fFkr+i0hDVaAkJaU28RUorpCxjrFS3UA/TxmyJQPPDyU9X0BgHWBuQYX2vgI?=
 =?us-ascii?Q?/w73vCDEkkRTLf/UezPbsrdLLhnc9dkfkats9grdbLLJj+fFOUhlr5+AnmvG?=
 =?us-ascii?Q?kqcrGFhhApjzJLsrrY7patXfNxacIXLhabjNvLnCo/kuM2JGPmyXVmqFKVND?=
 =?us-ascii?Q?H2yEUmNIFBedvUufW0VYzrLKKrzrmnyicOlII0OS1WKavpa43LRh2yMrJES+?=
 =?us-ascii?Q?8FJE8Ubrg184VkNmuTtTXlRnuy0CH5tgCq+JxKOZ+Ib8CCEC5nQYjGgafrB0?=
 =?us-ascii?Q?4wys39VmpUvMG7n4JTttZgosDK0JhvtufcWDQ9ecMKuIKexEddWwzibZpwTd?=
 =?us-ascii?Q?PbNfH6XJRbg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ywP1f6uiyHhNFUZrqIYcvtcah9TSrg+VjNoaIZd4Gb6fW9TR0dWjlDf4Eq4J?=
 =?us-ascii?Q?heYoB3WDDmbxJ5yIRMTOlHzmPpT99OwR9TJ7f2Ieihs9Nc/ge3VOXqf7HyxU?=
 =?us-ascii?Q?A2+8W94mvzeelEJmBt6bARHRQKgyiYjXRKvVWRGmCVc05MM3DzsQn6HLVYNZ?=
 =?us-ascii?Q?Ku9qjviRdOuJnv9u5pzHjBUWMZ6ohth3FrYl3GnXDARXLdB/QDQKgalcSMvy?=
 =?us-ascii?Q?s7WyWxcHoVUy/J8xUlYoDXLFOUwHnDEdp8b0wD8fgCLGEhSStb2yMH4GDtTt?=
 =?us-ascii?Q?29d+seVbFC2bVsg6af5TZc9uwyT83c4lqU2zUAZW/yjZgC9saS9AInOGkLgQ?=
 =?us-ascii?Q?DTS6bK6GMy3WakhguB1zxJqcuCSi2mShhsxnCjDPENSufSz9uJ2CHrPyMDdF?=
 =?us-ascii?Q?52OKPU4xgoZp+f3tLShN4I2xNsGmMvJ8hlHknXxomd4p5RSMIUudyeXJHyVN?=
 =?us-ascii?Q?XSY0yd4nhB6uESna2JlIq967pIuWJNxFYRYruv64usCyvFDOxPi7ryDU0Kx9?=
 =?us-ascii?Q?CB2662abJ8X1Is+RGhGVy5Hsai3nf9jDa/qNVtqsylOg+mcUWAS9nowk2Wrz?=
 =?us-ascii?Q?a23OV5PpH6P1QXwdxmVCGFNgawZTuMdEmaB0PMBJps0ewurEfvo1umYIxfhF?=
 =?us-ascii?Q?TET5gFClIERaYZIq+CbLnQxCZ2J1vhBxququKBaDHe8YZTq7EotluVjYnVC9?=
 =?us-ascii?Q?PS56cNib2uCGZKczkC4eWR/9Ulm6seujI7yfHlfgKQmJeiUap3xmABL8jYc3?=
 =?us-ascii?Q?ARbQrTAqilJqpe29BnbH5BT6sL9v1TKLPl0+VvtPGse3TtLEfmmfydUk16PF?=
 =?us-ascii?Q?yhWlQyn/CXGpsiXIP3IlIvfivSjg1TF0zziYLxO5fyCpdpKv1GD1yH5LhVte?=
 =?us-ascii?Q?HEJkiQ3HNG5RqINRpMkGxfeFdkc2c82FJrS3LhRBIFBRdYUz/aut6FsYpnHm?=
 =?us-ascii?Q?okqXLikCrPUJv25lCUS1D3KSL71r5Ma6Lzi8W+E8yhS0ZzrLf8HjEkC80XhJ?=
 =?us-ascii?Q?puOcIkOxYWQymnBvYrSVVjyMco8Bn6bUyNRWFebTV0fo4FMpz1uUO7nDf1EB?=
 =?us-ascii?Q?617wkRZaucEihSbB8NnnpUwJqoZ0TbLfZl+cle0GcLwJZZ7DnvutK2obxrXV?=
 =?us-ascii?Q?RTCODeYEYFlpHvzvrp5GdGkI+8ssM+RbDDVBewUbZThNYM+hpNvHOQdpeyj2?=
 =?us-ascii?Q?3DNt6/snMuzov2Yk+l9cqbxDYFMHFIavqeL0atNhgJvMyZvYytyNtuBLZk6z?=
 =?us-ascii?Q?oqZuFtEgew2btUGBXZgv2GuwwkKOXnENVEcS5EgLA02LqRkWpm+qirHAHr+E?=
 =?us-ascii?Q?NVTYblmO1oNQcWvo1a8uNkUD7IMnYdDU/NnQXMRlUsp3U7LxwSdqM4BNS1dX?=
 =?us-ascii?Q?nPzfw0oH7138p5CkJOxJn1VMZLPVHhVUFjVJuUA0jlFfd/s6lYwdQFvpvwwt?=
 =?us-ascii?Q?bZX1gSpfLYoQCj909YsOnIqNbUxkV47AmYXYlVuoTtXaQ3LfIe46qi4uTwC8?=
 =?us-ascii?Q?DCz1ooHkZIx/bcfiX1PvzZvCy9LMHOCxtJ4hN2BdaXfvEUTDEqPE3eDZanke?=
 =?us-ascii?Q?+oV0Md7JaX5rd7RckyGF8mdO4jfAOnswgFtE9xW9NM8SjFiEnKFBo/v6iuKG?=
 =?us-ascii?Q?TfgcqaQkWpwKuFu9fomd/44=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0pkz+DRKk2CnXG/DO9rSxJImW7DGU7BSi8FD4sPtKmzjQ9fjRxt/Bh7/s/nANuiwWSuibzjCoJ1vqHewEGWp/GbpMc5YpsgTmnyKHGJH7CWdvn2/fNTWau0kGmUau46c2dYNz+vxJdu3dJH5cH0csFVtgdxjNZZcKlIn137UC2edbGOqnctS73kWq6Wd2jhY+ja9CDb42PXsiu6uqrpzr2p0witBwjuxiIa2BEbQSijPL1c3Ir0Ja1b+FgLhXXQtVQjbnRs/uroyytfrVIjnwxsj3qhzKDMGkS2+ed1bcEHdYbErP6wIcS2fgl0oH2e7lDrADQoFSytprOH0QUu0+1E1NDB9GLOVTErAddy4lGUSfZ4exNlsqoV6yHaolArfJzOOss4ODiY7dWNgcEE+1niNhgJk9rIfKaaBrdGCCoKeSpHXOFj5Mb+/mRXsS9yWEiygKKN+g9bC5PhSBadNQ3bGYVDroHYrgfsdrnVsRkllxUF7Bf7LRuQ1Kv0oOKlfsGtXI3JB/da4uAUaxxoeB5p0ZVpP2aCZ7+FXVPuj9vCzL98hawigLkbosaxXTTGl0toCC4ZNhjE3+8QPWrFAnZl3AtW00jZ0P7st4NglTsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5dce16-7a02-4e5e-06c6-08ddf494c2d1
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:16:31.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVXWqGHiJPKhwl4DXFtSBEzOf0JQsgEIgHMp6ng/HQQ1LC/5CMoJDQQc51xYuB7X+KEfjuxm4WtZuOrkyEH6c/jbX4vZ/aoYGEjiZGSBn80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7811
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509150190
X-Authority-Analysis: v=2.4 cv=S7vZwJsP c=1 sm=1 tr=0 ts=68c87423 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=D79Co0WSXZo8P_rvoAkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX5pDH0zdhoKM4
 yThAaFax7qec6rOq3+7qVivdRWZG0GUOj1CAhzZTH/P9+55Ll25sz6i4dC08e1dV1ZT02Wh7B+0
 sl1YEZnkqaKZdL0lnK6UDbbAFc9erXWFK5RvSL28jOvBe3vppLIEQaFZ2j89J5o7rrIGO3MCloN
 PUa/PtHiz8jkgTsIx/OBbQivGAdGxMcErFfBbRzjdEm0KN/8PMCNdB4vO5g7L1ZFUd/nXbZ5OTM
 6TRlYWdtWh1O7yV6LjID7neMDS6b9CdqvtvzvJdpuEHAPtYja4aQtpx5pCj8O52mOO8GfDzAZf5
 tEm+Nmxw7P1uXKoC4m2KGb+z+f0bOKa8wQx3Ug/kytXO16vbATml9Pq7m6my73j6AMX8i5AnQHo
 csbznyYp
X-Proofpoint-ORIG-GUID: gSgaZ_BKFkhjDAo6dn-a7frF2SZPYlDm
X-Proofpoint-GUID: gSgaZ_BKFkhjDAo6dn-a7frF2SZPYlDm

---
 Build | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Build b/Build
index 485e75d6..1a66a824 100644
--- a/Build
+++ b/Build
@@ -3,8 +3,16 @@
 
 install::
 	mkdir -p $(INSTDOCDIR)
-	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS)
+	mkdir -p $(INSTDOCDIR)/userguide
+	mkdir -p $(INSTDOCDIR)/userguide/explanation
+	mkdir -p $(INSTDOCDIR)/userguide/how-to
+	mkdir -p $(INSTDOCDIR)/userguide/reference
+	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS doc/userguide)
 	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
+	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
+	install -m 644 doc/userguide/explanation/* $(INSTDOCDIR)/userguide/explanation
+	install -m 644 doc/userguide/how-to/* $(INSTDOCDIR)/userguide/how-to
+	install -m 644 doc/userguide/reference/* $(INSTDOCDIR)/userguide/reference
 
 install-test::
 	mkdir -p $(INSTTESTDIR)
-- 
2.51.0

