Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ADD6A33F
	for <dtrace@lists.linux.dev>; Tue,  8 Apr 2025 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119919; cv=fail; b=VRyq2hzS1HsVO3luKp35tMvvYGZ266PN1yP8BK0vWCxhNmmzBuFw56UsHEJT+HyuALBsCT9s7aNxtjxNTRGVDQoMZykE2lCsgALPSQudGxrMc4KCH8QesplJbXQ0kl867im+3nSMk4lH03+gO80GCIR8Lv3dD3KX3he5MfIxAt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119919; c=relaxed/simple;
	bh=GvFAr4KthhvogKmLpd9AmRTZGmtpAMoKgHJOoZOSwb0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RvsibJ1XrxXgQPl4M9lY7q1SO6gNrNP8wEngd5ZrtYhH3Uv9//bvGKDG5ymWXQ0P6NbqVm2zD/KEHGsbE9gOSsH85oRu0LwHUhiyj/WsYFHevsxnVWHmeCjE+J9xw1TY/TF+MKlk07CgOqrLWOwNLzazMEgw3p8X9ataGwtRBhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Eba3VGTf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aDApYwYu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Eba3VGTf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aDApYwYu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6klU011265
	for <dtrace@lists.linux.dev>; Tue, 8 Apr 2025 13:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=0o6wd2LWvIIcPoy1WlpMBfwIAvnxcgOeQOTe5Ifskrw=; b=
	Eba3VGTfOSnskYWjhpju85cSrY04fnxEhkiqSAmoIOpwx8zTz3YPVp0Y9JHeodTg
	YyUWDRj5zZmg7FO9b/6KkcWkns6LmxdVtWMtUwEA+dPm9l8xyBBhseH4/LoVb/Au
	KmOvlciE6Mdww0rPvfTqAzTjCU6nVUcS5fGRyu0qin5RP50+V46JIlJxIhsgvM8P
	QEQOhjkmUwUVvojLZn9P23dvddsgn2N4oCwtUVbfjcyMqkCeM0glS+4S9nIU0pfO
	wicaSS62nKkVKz0y6zWiuK/6MZXRCC/Ze0+5+h7u0x1GzVknUNAedbAag6iVXsss
	dD87/IaOF1Ove+cb+OGrbg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ttxcvsk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Apr 2025 13:45:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538CQ9v2016124
	for <dtrace@lists.linux.dev>; Tue, 8 Apr 2025 13:45:15 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010005.outbound.protection.outlook.com [40.93.10.5])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty99txr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Apr 2025 13:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBkIkRiyAGLO72VTQc6lVVFglx0FOvx7DjfFhYJwLvQQf+xneQBgGBdRKp+uIF/IdEGvDgGFysIjSuDzvZ4sFBl1b2XGuLRPq8LEFmaDYXN8bd0CEhdxe5szWDCebWgJMuZ9iL6JYVDWHEtz3H5cOII+rshzt92nilLrna+nphtD0gOTyw4VJUDXbX9ce+4etqO3tRyrjDa8OAgVJth82yfsf0qYsdwQOdrDbXJ4L1d36c0AmjDg1pifta/b9oCeLjnfoORYDgooHIgUdRTXUyvFjwsHAsr+0kAUzdp2JDBwdQpmIp2i72FXKFyRKHUl3vmh5VHpjVpbkyD/aXR6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0o6wd2LWvIIcPoy1WlpMBfwIAvnxcgOeQOTe5Ifskrw=;
 b=BYhqaU2/75trNIHhWn8DiQ5+ppDO6gvCSYj57hH7kMdIMMtIUlFMWEmRe/s+5WBFYWVlTEjtkMO3G9BDyR4GC2FM9thPKZq6wwY8CiZTEL0IkIAILs1VPhdKs9hfu8Jm9yf2CArHlL/zbA4dvjtkRZvtGnKt8WQGj9+lfqVWrQTBXKZOAWLqdUsjrqeYlJof7gQpqDdP4LDlzwOyz+gEAck1SCsV272fYqQxEmUp8hlpL4pH40pedxk+gW69FD1Z+Aoi7bw7063zeYbWu3T+Lan0ylfVsZCNEySoauXz6ah0l+Ih8qdJ9DfGnltWVeklvGL36ks4i36sZ+tK6Z2/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0o6wd2LWvIIcPoy1WlpMBfwIAvnxcgOeQOTe5Ifskrw=;
 b=aDApYwYuStGZEQ1vu0HfM3/wlSj6UeqFcUUUQ+cDstK438Bs9Q+ARmPU8+Ye20pDHD3taU3NuibnuDHtZKZmWWQmlG8MmN1KZ9uw83nhhvdyRTl3H/Sg3YMcEURNvkXO1wbYB3zCrhJwk6CFXzhcvkn3YwR/bPjCobySq60KYpY=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SJ2PR10MB7759.namprd10.prod.outlook.com (2603:10b6:a03:578::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 13:45:12 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 13:45:12 +0000
Date: Tue, 08 Apr 2025 09:45:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: add support for building on OL10
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB6337616572DBE54821CA25A5C2B52@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SJ2PR10MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce554de-6438-4bc1-f2f4-08dd76a3960c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HRQn8QCYOyEHmI2HNv4B+LfpOR37+xa6EMT5SF0m66K/au1qFcfYM9XZMupJ?=
 =?us-ascii?Q?x2DAposD92+DsN4YN1rj4UkUVLYJ/wtq/sQwtRZVrmTh6n5E8ml0CE3gTqgy?=
 =?us-ascii?Q?v9ausrBCAYv60iA/uxd38n/bIqgKe9Vvzvq7A+NRjpqFaZNUDBGf7cC9yljV?=
 =?us-ascii?Q?pvF8m65GAam+eaOlnxT1kAoS6km+fMaAatS0XwbUUcgG4SG2S1b9rKbZL1hL?=
 =?us-ascii?Q?FRhZhxge9yIoqKGYOcSqwXJtOV4Cl2LLZyTUQNsvqE5hcz6ji5FVzmrvH57x?=
 =?us-ascii?Q?w3VnLWnYicKT9onahfGmPIbwzIgOAxo4Esp6Y72peQjvnRJjk0fN+U+sPDdc?=
 =?us-ascii?Q?FqGKybfkzHPBG9SIGXEMgfDcM9DGwMwBkiLljx8ep+RwgftK6Ap8iyMKu/9L?=
 =?us-ascii?Q?VpxPxKAlN6kQd67uMp6s9TK3z85PYlX9DXr3Ol6DiUmAlJGeoFLBmT8Lr8eK?=
 =?us-ascii?Q?SH8/3T9bnpfzNDIlO0/Nln+bauaW1SFCKhmeaiqkMcXcsRUqnUq6H0vNdWnS?=
 =?us-ascii?Q?ZR3N9BgCmMMOJ6wKWF2U0VPYuBbtInv9e3oDcfAPaKudvGCuQe9BeYwpC+bd?=
 =?us-ascii?Q?jNbSFm8MzkQUD9XKlCU02HD/vjrR9W4/6vZiAcf1Vd1MKb+oO6K8+bUNguFq?=
 =?us-ascii?Q?aPfUdcapNuT12IVxr5iwPEaHrjWvKEVa4YaoJByZae6CDV/qGNcZ8JxpJgbl?=
 =?us-ascii?Q?0aDws+pTy9TDuG0a3GWizv+o7fJYzDBdjJAWt+riuxJ63Jc7MtgDCVjjKOLU?=
 =?us-ascii?Q?BcoQtXI9SLAO6aGKguTVBjlD0xLAIiIy0vKb4CqhQXiNuDROdAtXOLxETU7s?=
 =?us-ascii?Q?NNf0Yj3ALR2bHRQN+P98j6nKdw/jX7uzYdfrz/7j7LLZHvuE6jlyktqSAWsy?=
 =?us-ascii?Q?sKUYZXuNk5rRGxM7LHJ2w0kcq5ozi2E9WHHxA2WFBdUhFLHsH72VByloebPE?=
 =?us-ascii?Q?LmFwaMSKXINtfuKwCxRQ3e5FJQSkQDt5hz007tsq4sibELdT3LWcBNHYw/yB?=
 =?us-ascii?Q?adIYoxSTM/0892QkEf6pgE+chm9jutDCsblI1bIpPHY3AbiK4GWSndN3fRK8?=
 =?us-ascii?Q?+gkllb2MkjvQCkBwLx7vWDAGTxvtBhHr+WvQ3P6UZyimBKOubOYN5YrKN99Z?=
 =?us-ascii?Q?s3IkKX27J+A4gkw0S1L6QEvCsepA56wfu8arjfv9xr0Xdn5INkK+pPhWU1JT?=
 =?us-ascii?Q?mjmvx76TCVQ1Gz4g37J1S94heWyauEzt7M5h2uw2nfk+ft7/OIZuB+UYq5xK?=
 =?us-ascii?Q?sdxB8do97Tdhm3TWQ8OS2mDYyW23Jg69muci1bJTWgY3+BlgFY43OMUdNzLU?=
 =?us-ascii?Q?rROoRtOzNxY1TvPo0f+yjbKo0MPrwPPlrNl7/zPUW/kxsr24TPVfSEuW7cUu?=
 =?us-ascii?Q?xs3T3Lzas8qlPuU0aUIgTK2UaaU/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tt0OojNH4hR6bI/JIwaHPzJ54SkFsrJe9ZFGTev0vWzADkBPp1cU39lYuatO?=
 =?us-ascii?Q?sP7cozqlhLf0brL8sy96RPPkvDEIJ0XdiegExGuF0UYU1o+H0MEI1Qh6EheH?=
 =?us-ascii?Q?G+Iwl68lvlJ89GGUIPa4OnkTlc+khTXze2Yw6T4atpvdCeuG184PoApYWkH7?=
 =?us-ascii?Q?TVFhepzWVWYpLLJJT6iJ+11h2PPssKqMi9MAi3d3I9aA11wCHi1/pK4GIZng?=
 =?us-ascii?Q?jwnCjCxBp2ZmnssT+7KeL/6s42tHvZiynmeHihKx2YJIfXTuXfgJ7AKSJd16?=
 =?us-ascii?Q?grtps2RP/QXOCChFdCWFixncQr3Kdo3WruvNyBic7QteRknKPA09R1k25ckW?=
 =?us-ascii?Q?4aGKxZVinGBrI17Ru29lMCtx55JwILtxR6yzOoGYSnRuIrw/y2KB4ww1z1jT?=
 =?us-ascii?Q?MYjc7RCA3TJ8AvKCPAl2K64NwXdyiUCWhWXmprxRBG4q0wiIRtjqD4vLJ8Hm?=
 =?us-ascii?Q?KudZm8qKfSNnt82VS5yMH650b4Ufimy/6QlVtYsgDmf+azyE5YshfDKnK0Hu?=
 =?us-ascii?Q?ZzcDo49tfXLbWfUg9nYsgkg00QfLmWfqVZjltI4bQJT5mfIuqxzLAEyNAZgs?=
 =?us-ascii?Q?fU/bfFLaTaQzhgbDROXUjfvl2rcgDfw4r4QjDbFngRHDWA0ajmtd46iWsZz2?=
 =?us-ascii?Q?vCWk6+mlV3m7XmhXcZSK6Btl+Mxjddq94dqeMRM3x42LyY7lS8iEn/rk3GOW?=
 =?us-ascii?Q?D7BxRO6BmdnS6mZlm2QBq0ewHhCMo2s9fTm7jTW6SeEymtn/s4XHIshC8yLp?=
 =?us-ascii?Q?xUrNvpOBocQ2n3X74JpCWkdw1RN4/wxZ9z3SBtIV+PE639PrIqOuZoFiP4FF?=
 =?us-ascii?Q?2/A9YRUSHYupOgLQn1XSyMXk511KfuiFhzpw8h9Mob4aEMBww/FOSpOf0ckM?=
 =?us-ascii?Q?v7GUENxDayQ1q/0tofn1f5J5lGPPvXNtNNDjWgFomYR2rBJvV9yVdoWWfTYe?=
 =?us-ascii?Q?qidoUMR06k/2rg6yuaBJoKglZNha1yvoZlx5/InWEEqRNkbWFG1FWgIZyKgw?=
 =?us-ascii?Q?ntFiJVxzNxaBGUKWUzodb9Xf5avsV3x/d6AQf/oYofY7Wm34SkG/swsf1Bg4?=
 =?us-ascii?Q?WgyE9Yk7twWi1aLA7M42jnqfITvY1mfTkFD0P0XQh/J4x1sKaihtvIVR+tmv?=
 =?us-ascii?Q?hypPRhSlw3LXOZHoJ0InTMNuofbsKvJX0Q84SxbJ8vA12yK8grarPu82UH+S?=
 =?us-ascii?Q?u229ORARXIvwv+4HV79xCEBvChrgPxWwFnMY9fnAR/18si2E/iH+aXe1T9Fw?=
 =?us-ascii?Q?NM5zOdwQ8s76O1FQ25j9XC3WRfqtZsHWheUSRi73MQ826jI7qspEOVBYuLMQ?=
 =?us-ascii?Q?OgCgdZa8WtFp/dp2dtNv9JQiPxCA5O0ZId5DeHM0HJYq3JKNMqg3CLwzaP5H?=
 =?us-ascii?Q?1fZJOhUV4TzctscU6AqR7ocUaNddRBZYNL9JH1HfY8esgfXm08TlGhwcrvrX?=
 =?us-ascii?Q?axbz0JrokelIRScnE8TZ8RJuy4uBRIERPAJMnojBFSjD/P66tuKUPM26hHMz?=
 =?us-ascii?Q?SCIHFdAThvWHhgUzj7bn9zqht6GBvEdojsqRh+qHdkjCxDHJ/FEeR8EomgXw?=
 =?us-ascii?Q?lufXwQI19mBaXtovf+2mbGONv/R2tL8aOYMmBWEaXDWhCh1/4L5nIcXs7Q7D?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sXsx6NRLlsBj7CWyufw8/MoSO4ZSPHLO+GDqqPID8A6jQnTcVVfoeBBmftYAUQLDKN4QBgcOSld1T6HuKfd7BdFflhgVemPifFCH6BhTuF1bHumyWn0LAxaBSH9KAQyH9E9yv+h+Wtv67GE+pmCiyDVmuLc2Lg8+eCznFzakMMgxMZ4to79JKo3OMYAro4+TPKF7qLBgy9t1fjHGq5GjZH6iQJftW2KrD04xXAAyO9wVbpghuPXs8TpVfo83OWBTmCEhQ0UFTcOY6NO+0agASh1Q0BRyeBG0rWZ/cu5HHoPAyfL1Rxvqh7z5Eov4hO1jqICQThp0B1IJKxu63/OCmJuAFSd6f5uVahVYKS/W3WB8slMfvg08krhMNmOfv09FgFCFdTNs+9RwuCxRWKGg94FKjhOPi8bD2aGMtSdpdkPaSwIEd3dfKmdOYY8JMIc6qOj8u7W+DyzifA4OML2qHwlMDvxlYh6Odk0BH2kxCtEETFpxGUkvFRT7fvhrCDoCM+kKbOD4dfw5sUhmfjWTB2o4GYe74pzUcTZn3P+2pC0i3QM7gbhuomFp8IwLRzRUYK2ZLYRJuwXaD4MRMEKJc7PhTE83NLb4AKBENQM8UUs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce554de-6438-4bc1-f2f4-08dd76a3960c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:45:12.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geSto3Z5DdPKxaOMbgJgyTKq6SM1mcr04Lr4WdnxW9E3syJG0RBWqL6W5L9pvN/GJxCZ5PtJ98y46TU77HjOb4EwbJMyxsywehllafZVyic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7759
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504080097
X-Proofpoint-GUID: mwAs0JPlz4lDVTkjIs_4ypMZO1LBqRTM
X-Proofpoint-ORIG-GUID: mwAs0JPlz4lDVTkjIs_4ypMZO1LBqRTM

Building on OL10 requires a few adjustments.  This patch also removes
some dead portions of the spec file concerning the former translator
generation mechanism.

LTO is also disabled for building DTrace.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 85 +++++++++++++++--------------------------------------
 1 file changed, 23 insertions(+), 62 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 902ad7d8..776432e0 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -13,43 +13,32 @@
 # "--without libctf" to the rpmbuild command to bypass libctf.
 %define with_libctf %{?_without_libctf: 0} %{?!_without_libctf: 1}
 
-# Kernel lists
-#
-# Translators are automatically generated by M4 macros from selected kernels.
-# Only major.minor version impacts produced data so there is no need to add
-# each specific kernel to the list.
-#
-# A list of kernels used during translator processing is in the dtrace_kernels
-# macro.  A selected kernel whose headers are used during compilation is in the
-# build_kernel macro.
-#
-# You can override both from the rpmbuild command line if required.  To build an
-# RPM from locally-installed headers, define local_build on the command line.
-# To build translators against locally-installed kernel headers in directories
-# under /usr/src/kernels, define local_kernels on the command line (in addition
-# to dtrace_kernels).
-
-%if "%{?dist}" == ".el9"
-%{!?build_kernel: %define build_kernel 5.15.0-0.16.2%{?dist}uek}
-%{!?dtrace_kernels: %define dtrace_kernels %{build_kernel}}
-%endif
-%if "%{?dist}" == ".el8"
-%{!?build_kernel: %define build_kernel 5.4.17-2102.206.1%{?dist}uek}
-%{!?dtrace_kernels: %define dtrace_kernels %{build_kernel} 5.15.0-0.16.2%{?dist}uek}
-%endif
 %if "%{?dist}" == ".el7"
-%{!?build_kernel: %define build_kernel 5.4.17-2018%{?dist}uek}
-%{!?dtrace_kernels: %define dtrace_kernels %{build_kernel}}
 %define with_libctf 0
 %endif
 
-# ARM64 doesn't yet have a 32-bit glibc, so all support for 32-on-64 must be
-# disabled.
-%ifnarch aarch64
-%define glibc32 glibc-devel(%{__isa_name}-32) libgcc(%{__isa_name}-32)
+# OL10 requires an explicit BPF toolset version.
+%if "%{?dist}" == ".el10"
+%define bpfv -14
+%define bpfc BPFC=bpf-unknown-none-gcc-14
 %else
+%define bpfv %{nil}
+%define bpfc %{nil}
+%endif
+
+# By default, do not build with 32-on-64 support.
 %define glibc32 %{nil}
+
+# Enable it for non-ARM64 builds excpet for OL10.
+# ARM64 does not support 32-on-64 either.
+%ifnarch aarch64
+%if "%{?dist}" != ".el10"
+%define glibc32 glibc-devel(%{__isa_name}-32) libgcc(%{__isa_name}-32)
 %endif
+%endif
+
+# Build DTrace without LTO.
+%global _lto_cflags %{nil}
 
 BuildRequires: rpm
 Name:         dtrace
@@ -69,11 +58,7 @@ BuildRequires: fuse3-devel >= 3.2.0
 %define maybe_use_fuse2 %{nil}
 %endif
 %{?systemd_requires}
-BuildRequires: kernel%{variant}-devel = %{build_kernel}
-%if "%{?dist}" == ".el8"
-BuildRequires: kernel%{variant}-devel = 5.15.0-0.16.2%{?dist}uek
-%endif
-BuildRequires: gcc-bpf-unknown-none
+BuildRequires: gcc-bpf-unknown-none%{bpfv}
 BuildRequires: binutils-bpf-unknown-none
 %ifnarch aarch64
 Requires:     binutils
@@ -88,32 +73,11 @@ BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
 Summary:      DTrace user interface.
 Version:      2.0.2
-Release:      1%{?dist}
+Release:      5%{?dist}
 Source:       dtrace-%{version}.tar.bz2
 BuildRoot:    %{_tmppath}/%{name}-%{version}-build
 ExclusiveArch:    x86_64 aarch64
 
-# Substitute in kernel-version-specific requirements.
-
-%{lua:
-  local srcdirexp = ""
-  dtrace_kernels = rpm.expand("%{dtrace_kernels}")
-  local_kernels = rpm.expand("%{local_kernels}")
-  for k in string.gmatch(dtrace_kernels, "[^ ]+") do
-      if local_kernels == "" then
-         print(rpm.expand("BuildRequires: kernel%{variant}-devel = " .. k .. "\n"))
-      end
-      srcdirexp = srcdirexp .. " " .. k .. "*"
-  end
-  rpm.define("srcdirexp " .. srcdirexp)
-}
-
-# Expand kernel versions to full directory names
-%global kerneldirs %(cd /usr/src/kernels; \
-		     for ver in %{srcdirexp}; do printf "%s " $ver; done)
-%global bldkerneldir %(cd /usr/src/kernels; \
-		     for ver in %{build_kernel}*; do printf "%s" $ver; done)
-
 %description
 DTrace user interface and dtrace(1) command.
 
@@ -148,7 +112,7 @@ Summary:      DTrace testsuite.
 Requires:     make glibc-devel(%{__isa_name}-64) libgcc(%{__isa_name}-64)
 Requires:     dtrace-headers >= 2.0.0 module-init-tools
 Requires:     %{name}-devel = %{version}-%{release} perl gcc java
-Requires:     java-1.8.0-openjdk-devel perl-IO-Socket-IP xfsprogs
+Requires:     java-devel perl-IO-Socket-IP xfsprogs
 Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
 Requires:     coreutils wireshark %{glibc32}
 Requires:     perf time bc nfs-utils
@@ -168,8 +132,7 @@ it always tests the installed DTrace.
 
 %build
 make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
-	KERNELMODDIR=/usr/src/kernels KERNELSRCNAME= KERNELBLDNAME= \
-	KERNELS="%{kerneldirs}" %{maybe_use_fuse2}
+	%{bpfc} %{maybe_use_fuse2}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
@@ -183,8 +146,6 @@ make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
 
 mkdir -p $RPM_BUILD_ROOT/usr/sbin
 make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
-     KERNELMODDIR=/usr/src/kernels KERNELSRCNAME= KERNELBLDNAME= \
-     KERNELS="%{kerneldirs}" \
      HDRPREFIX="$RPM_BUILD_ROOT/usr/include" \
      install install-test
 
-- 
2.42.0

