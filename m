Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966C446A2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909203; cv=fail; b=CSMLsSK81JzbbmIczXFfZ2E+t23+wuNPYukkkKLSAWhr50ccc+8sguLX7Y969VAwXPtqXWcA8dRGFlLcSzZ5MIsjQPCoKVRxhJC3PwZ/nxrwaCq4lvJdcnTO5GglQqHnBw/M7nhCpH1v2GqvH++vDwR5fnrbxt6O3qHTvOiYKfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909203; c=relaxed/simple;
	bh=1vZtmmLDxbxmsGmy4w6m65rZ/e4q64eSHznCB/SdJa8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IoRdeUWyoCYIh/Y144xRt1QYtDnOgyKIzY0zlmIyR/gPQsFTXljPhaht6pWegqQ0qeBdstcF7P9dsknBU+w2id14XInXz9stdJuKOTzJxrABazinCfWr7tIZSvmk4oiOnaaIS2bgM61RheX4WcXMcdHOrGR1D+6ih76al2AQ3hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F7+ZVNaZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cwdy7Djr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F7+ZVNaZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cwdy7Djr"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fbdn010733
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Ny01EBaoGoLQ59
	7peV1zz930lJ5YQ9fay6KyJLyD73g=; b=F7+ZVNaZaQrqh6+TEpN7XFWoAbcIIQ
	7rNe45g+n8uQsgBMtewKtjc93zNx8S8rDmkq8+LMAvH/KV4IPwas8BEvce/paJN/
	VUso2qHUp6gErL4Yq32Hcxs6IrJ5Rft7833+jrHIJ63le/BaAZDbYo4cEeLwVHWa
	rpz02l+hTkgMke70Po1JK9ZYpCMJF6SGpy4KNXgCLEWp3A/7aebd3LsBkoiPOyDe
	3Cj99NFgQqwLSP38ut/3KL4e5g4uufdsUTaRaUO3f588rcCpAifJJDpe0FYxtGfN
	2b9b+A40OstMMkJS/gYdzEWmyMXPiYI7o3XMwDEZ0v7VjQw3t/hAdMiQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419puguch6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3lRll035057
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfpb7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQk9KwwR8CX21skifNDUhPgy0Lavu1ZJy7AoGW7Mzq7IVKPaLR4RBwhWQMxnOmyDo+sf+n4R0PmkF4PfuupxP7mAZo5VO8VPsguMTzl/VNITP4j9LA4Y3TqNhblfFnsuNREGQmHai5TuRXqtKU14Y8cTMtCdH04iz3sMEci5/a/+gT7TNq7Cc5lCZjxibxEicmv4eiu7ttvFnHwPY2NoBTv4tXpAx3zFaBRHaSFGN0OWyjKu4FmNVFpAbXdoaiucV2UDVT5hkoU2gNQmh6IWckWhE3MPq5z7f3XW+4nG0FAuRuYPzX9RuqKJOH6aDRcxirUY7bKPcBa/AOlFO/bnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny01EBaoGoLQ597peV1zz930lJ5YQ9fay6KyJLyD73g=;
 b=puu0NcpEAI/nhy9Lfq/TRFrsOtkO+/70n3xjHN0mpzGQz7RjA6nHtTTAm7yv9Q829yeCv585sC1fGMDnQNdST8m8ZbvbXdx4FBhaBCeZRna5vlbx7G4zWrqpjto+I01pIppWjRF1rozDm2axnCFnHy2j/mgXllZ5dsw0xYeRYKFaDuh1EA4JbnZfgqelKRRmtI5I48jRk6hV0Elf90+yHYnFD1k41ud9jNjE7jNg+OG/qx4Lb3nGhzo6nySRboqQ4tRT4elC/sAJ7gpPwGgcfznlmAvBtbZgYK/Aruwr+4ASncCwTFgD2xgP8+Qq6JHjFV2TV2mR8dnleQ7l1DQfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny01EBaoGoLQ597peV1zz930lJ5YQ9fay6KyJLyD73g=;
 b=cwdy7Djr1WmMfcxDmH9uYMxXb18xxveoCdVIX7QDLRc5KMByvpaKNWPf0ytgd0arbVfTPY6WV8aQzUf4ekN9IhXdU6bCDPuGlohxp7EwkVDvJRFcMzTJwbg2aotyCAeKDdblrT+JlvFZUCnm/XrvapihwvQLkk+t9Lhx90w0wIA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/19] Ignore clauses in USDT trampoline if we know they are impossible
Date: Thu, 29 Aug 2024 01:25:53 -0400
Message-Id: <20240829052558.3525-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: d6140b19-d2fc-4272-af42-08dcc7eb27e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1u0g3fT81c/ZsQRH/fe3YPUrX6Ge0xXMDeHQuePh43Hy8UGKiMaygKmDNCIc?=
 =?us-ascii?Q?6T3UpTpjFon/r9kNiFpZsx/HDs7gMFTQdK2zjd/FdUD4T/6IK1rq5/r/wZem?=
 =?us-ascii?Q?50A0H578PNpzFfQNCGnhwMeWVzCEm17fy6UrHlWynSc/KkBu/IFMEBe4c2cY?=
 =?us-ascii?Q?np9GBGjiLFQPwW1t4QQgCjA0htGQWDy/tt+DOJvrlY17rN1WxcUyGUiTO4eX?=
 =?us-ascii?Q?D0caMkp35rn/1hR7rv+OcTjaKETCIrKJRFX7MFXVEITW8wJ3WkUNl3aokPlG?=
 =?us-ascii?Q?SQrJDjD2AXnk5b1CUqhdcHTuAr40tNUEJSnBPYIZYH3lLIpNte5rdT8brNaR?=
 =?us-ascii?Q?JxXUyuVoYj6jQS00Ui6v5P0f4ymEx84Jr2ceNzZEgEG2lrBAxdou3+2QFXZu?=
 =?us-ascii?Q?37VG/to3tp8Yqg+O8d8Bfh5vF6GZxL7bJmzqpJ2BOAnqghz8dJXMqAtmls1l?=
 =?us-ascii?Q?jSyHNPEsgrpW1st8O9DQyuBz+cIG7VAG3Qk8etIHQ1/7qzPWV3AK/Czx8xdu?=
 =?us-ascii?Q?aV/+9JJfnsqoIU+Tfjm+UUwgyip0yh5j8ap3H8tff+lzUPtggWXz01KxfbLE?=
 =?us-ascii?Q?V5bwgg+KPCLTYy1NHa0DIAxLineaamwTiu/WCCEmJwaK03JPaDcSwrn9Iw8I?=
 =?us-ascii?Q?HKWqDNGjuFmYSxOZH2LlTiYV+A3lZ2pa67i8L0MF9sMdUrzb5uVDLhNewlnr?=
 =?us-ascii?Q?RncnWsy3QXOmjwEPxKI2Cau2llitGZ8198ff8tCW+75TP59H43Ks+tV89fv5?=
 =?us-ascii?Q?yCRbONCnJBumnQVUGguHIzAElcCAnzrnDyNDl8DlxWYFmnbuQURpNBcYqBMR?=
 =?us-ascii?Q?3ctr1k0Pm1lCc3xagECe83X6GI+d7I2E1/I2mjFjVcaMe2IYAtl5Q60QEcbQ?=
 =?us-ascii?Q?Nq8adJvjAIbZZcxMl7B779csfR+rkiSRyaeZ+y4vqR8CPffLG6WOPjZ1NWXL?=
 =?us-ascii?Q?mnvqhrqZooQ+CU/wh+M3SRweN3BYt56Ir8fFFIsLekBm/23bHMINXYfqBHfk?=
 =?us-ascii?Q?hTJ50TiKGkj7XXDIcZvfnP9d5KPK/HfBfn8JEz3lDKOnsloeG7Lo99kna/di?=
 =?us-ascii?Q?yi35l5N5zZ5zYADpZKCXTpqKLQAm8+YXSaV94Dkw0SDkHVndnujCbzNExe4V?=
 =?us-ascii?Q?00A8i5tOGWwsW12kK4082WW/aOuJ6uooKfBDmZyne/1j9bPn1NIhoIyfWCz6?=
 =?us-ascii?Q?f92fLAfBHG8jPgusyjkWhe4Z/WuP5hVT+sXXRNKQSmM+xKpNc8DaGzIedcEk?=
 =?us-ascii?Q?JyvEW9LXTEa7PPOzeFLIuf/iE0CVdrup2SUq7uwX0E0y3BH870HoSzXyV5wr?=
 =?us-ascii?Q?6XaBez9HN2qzr/KSSM558/P+epe4YtCeR266X3UQtQPI9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1iv76NSuQ2SRaoOiUPcgRJLU0DMhIfDcIiJ3bahRhROcSwJKPFKyc+IaN3w?=
 =?us-ascii?Q?5xdAVD2WZMC6yiyV2HyEdovPplQZIEhIwspIsPWb1gi5nY80BD5zdw4yXwVR?=
 =?us-ascii?Q?3Dh6cF6qByllG/ZLNiCj4B4IKW2ZV/bVKTcAVXy1+RbX1QWLh9VFYo9MGQie?=
 =?us-ascii?Q?jD6QT1EpbOHsQFMCC4gv6rZYRp0Fq5GREHv+0eKZWmBPXTyMM9k/wb5ujOpF?=
 =?us-ascii?Q?sQCRNUCmnwr5o0nRtfN48/QtI+1HkJlJo3YNQOmfD+ownvOwcJAPJ56ovwdj?=
 =?us-ascii?Q?6V2W8gJBEKEvY/MwhcVDdHL4t1pwL1iQttbvOjdZ4xFT/CMjZf0kVwm4rRDX?=
 =?us-ascii?Q?xbRn85XthfymbvAxscI8xxdwC+FrEw+C9KK4KHb7CQJN6Lywum17CEhv1vW5?=
 =?us-ascii?Q?b2AG+71CvmfVwDUHVSqrLnjQajuBY4nQWgDPUkDwJK/rMJWgQK0P/a1Y3u8q?=
 =?us-ascii?Q?gsDmdIOeuWTU34t15xZvOY3rzCjADfCyGZLMrpBaX3uacYXTR97l2owXYZYP?=
 =?us-ascii?Q?3rtKWrHTv0tyY2UlBmH/47ZGotNrLAmNS75L6mPQHdWhbGX3LJX/6giHrQNI?=
 =?us-ascii?Q?wB9uhpmLkrkZJJKJlsyD+jSJ5hxVI1eBowEmLrE7xjQ6D5esGYG8Y3inJ2j7?=
 =?us-ascii?Q?OUajlfaCydiC8h0K49GJy86CZpa1++uHfhIKiPGAmINMRkta1y7hBm2pX+a9?=
 =?us-ascii?Q?cl6WyeY/rxue7UXW+x69wGQ/E22Zy4UNGahDuwfI25KWeBvpZyZ7SBxM84bM?=
 =?us-ascii?Q?Zw8w70612iOicDsGD/2oIh0VaBZ3/VEtN1Ix8gjoh61zN1As+0ZiCWFbRm7T?=
 =?us-ascii?Q?rHCbl/eHK+XEAeonvK5/ym69INP91hnyquZ7lHtYYevzN4ej4lqBGsGebRVS?=
 =?us-ascii?Q?dH3vlyLDFTvzlDTYE5MD+37sd83Za1oDjOIk+SAUNzaQO9iMmfOMlxBOV2ub?=
 =?us-ascii?Q?cypHyA0KW9WZmNlAUt6wH3wZ8v31MzENqe8/5Rk7Ad+C29kTtb+d02O2uRg1?=
 =?us-ascii?Q?y7ptULgUjoDFtaDs2d/pvETK7KzbqDuptc/+U71rUa7YxOUhYvMAj48ggmrj?=
 =?us-ascii?Q?0hijtwJnE2pUZ8aYg8mo5ayQb2A5x2UzXNbPcjOE/Kow1pQFOy9TQLr/GSOO?=
 =?us-ascii?Q?pG9ZDg9/58VEqx2xOuhIQyO+VABf7VqefkPyglX+A9Zq1G6mSqBztBwS09iR?=
 =?us-ascii?Q?6DxGoehQ41jAPlL1PIAyBMZ4gh/7KN4cl8lO5PMhuma8CFoaSBK/Kr/u4UBZ?=
 =?us-ascii?Q?SJhSYMZZU1NXPW7wwdQevrceDtkjCYoWrpPYpshSQ6Ki5JMD1FaIgkyQUm+6?=
 =?us-ascii?Q?VlA/X28KMEwhP20FOvOXhubDpMRBDvBMHIq40LKlKgHI1qulNPzd4vAq87oM?=
 =?us-ascii?Q?W2X3AUaPshjlShImQ/jFFvCUgoU2iH+E1MvZXx6pC3GpJrpD2GraLaJVa78f?=
 =?us-ascii?Q?o21kw0HJueL05pQysbI3Ozn1ajhFVSI+dFx/umwW1NCCGoCitTT3cjz5UCLp?=
 =?us-ascii?Q?aL90YUeDwJmQt3KLYqzaXuFgNi1yfo2GQKf+/TVs/cKENqzeD6Ib4065w63g?=
 =?us-ascii?Q?mUw9ZikwmKGut/dwajYR9Q9DQmrPeDRdRFfYPM6o?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cv2BiNeHnsv9Tj4NaR4+0ydD/Q6Pwb2fWxwABhyWfo75USxRFiFVpUDAukC9UjVmZG2bOCFbdDrAQhg0RotDgMndCWlOApROCuLlkmTa7LGciUS67crbQbBXV+WApJApZyTIQZt0yFab7FxPKQ9oB9m8SDfjWwBosq0wvEksRB8vfaxiEi1TX1r8kcidcGXBvjORuBFeP7CDiXN6HbQYkAT5F4vjeIzXnKLwpRhsmY6EfYJpgc5OctOpA35semDW/P8KyXRo1IsjSyEk1jNYq0xzoMg5TNSYkBIOwVzVlLsKRp0ulDlzQ3IG1mYel/oroZn8CwKm+cytp6K9Od0gEzp8nxTG6TmlU0H2wQUSaOKnsz7E3QyWKuF18tSE+vsImWw2blRBvxtLa/3VgzjAymPrHfqfRKbyRuBPnCW9UgVne3NgUpqz4D+LNesb0NnVZs2md9P4al3uaI8+8lGIPXYxui8UKAfjS1ZZ6fqKBmOh/go4vxTHngMxEFD7N2BwXuTyp37qvPYiXOTnkeuJci3A2iDzu86L3EZM0wOlOXXIDSUIWfYu52f3g8ysil7MgSJo7d95f2hhJ7tmbXJJ31wPt79KY+dIqJ65yZqcDkw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6140b19-d2fc-4272-af42-08dcc7eb27e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:38.1156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BG1dDwx4gpG2VIzlapPLqNGYqksvdJKjViY3OQV+W9megs6MlDmYI5RmcjWFeZi8iYUnN8dSkd5aTwjoL2L/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: nbWWCRriPG0YJY4kqBIN4ZZEdZ3Y3H2B
X-Proofpoint-ORIG-GUID: nbWWCRriPG0YJY4kqBIN4ZZEdZ3Y3H2B

From: Eugene Loh <eugene.loh@oracle.com>

An underlying probe might have to call all sorts of clauses if new
USDT processes start up.  Currently, the underlying probe trampoline
simply loops over all clauses, deciding whether to call a clause
based on a run-time bit mask.

While this approach works, it can mean, e.g., that clauses are being
loaded unnecessarily into BPF programs, bloating code.  It also means
that the trampoline is looping over unnecessarily many clauses.

Meanwhile, it is possible to know in certain cases that a clause
could never be called for a particular underlying probe.  The
heuristics can be tricky, but that challenge can be faced incrementally.

Introduce an ignore_clause() function that, for an underlying probe,
determines whether some clause (denoted by index) can safely be
ignored.

The same ignore_clause() function should be called both during code
generation of the trampoline as well as during the construction of
the bit mask.  Further, for a given clause n and underlying probe upp,
the function should always give the same output.  The set of ignored
clauses should remain fixed over the lifetime of an underlying probe.

For now, conservatively, ignore_clause() ignores nothing.  Later
patches will introduce heuristics for ignoring clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 98d7b79b..883a3e9d 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -232,6 +232,17 @@ grow_strtab(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Judge whether clause "n" could ever be called as a USDT probe
+ * for this underlying probe.
+ */
+static int
+ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
+{
+	/* To be safe, ignore nothing. */
+	return 0;
+}
+
 /*
  * Update the uprobe provider.
  */
@@ -348,6 +359,9 @@ static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
 				int n;
 
 				for (n = 0; n < dtp->dt_clause_nextid; n++) {
+					if (ignore_clause(dtp, n, uprp))
+						continue;
+
 					if (dt_gmatch(prp->desc->prv, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.prv) &&
 					    dt_gmatch(prp->desc->mod, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.mod) &&
 					    dt_gmatch(prp->desc->fun, dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe.fun) &&
@@ -803,7 +817,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	for (n = 0; n < dtp->dt_clause_nextid; n++) {
 		dt_ident_t	*idp = dtp->dt_stmts[n]->dtsd_clause;
-		uint_t		lbl_next = dt_irlist_label(dlp);
+		uint_t		lbl_next;
+
+		if (ignore_clause(dtp, n, uprp))
+			continue;
+
+		lbl_next = dt_irlist_label(dlp);
 
 		/* If the lowest %r6 bit is 0, skip over this clause. */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
-- 
2.43.5

