Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0772269D04
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941532; cv=fail; b=crzQ0TalzKh2d23jz8UV+4DnMhgLe/ynufqV+lyOZajAwWVEX+ouj1VP3UNCzUvKJ3Bi8R4NhnNjF0SDxijTTPFssQ60M1VKTN+bRhgWhmAW5zh042ijbUIR+WwPKH4dSWB5feiODzIthHKU663/97DJ7NmUeM9GQNmQx7XP3TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941532; c=relaxed/simple;
	bh=Ds9TcJfOwP0M99Jb/safinWNT/12PAujTEbND0m6664=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B4ja3fEEIYARPq822NCzHArjEyNGldKP079qehTAmbYNUW+jLuTonkESQuvuHyDKkmjaoc7yOtgsaXonEzZcrNgt/HQbhypx/APR2qiaEJnw5imLmuJ7d4mff5zImUgLOKwPx7CVNyG9ps09HytAWShbj79hnocDv9+xjs0t6g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=loUzLPMw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ds9yhzsZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="loUzLPMw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ds9yhzsZ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PLtugo001836
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Cnv1WuCS+i4QDurCEB
	90Tu367cU5LmvKJJBuQJrJe90=; b=loUzLPMwWNzPgxGWLA1WsSknGAYF/foYIw
	6jDU8P0yCaNyq3GRNgmyNpSiPrSbPtVtvwf5vS3KMh3QgBFt0OYNFxW8YGi2lYGG
	0nDEDGyTs+nHPu1KqMTQlDUEgogPRb/xg62YrrtSv3o/gZmGUxCdn0oBGmk+S+S4
	AsdtxjWltLRuY9GR8UFI6/7MKkdneSZcY2DfafKMx4hTrXOrpjDgFUo8qUhW6yZg
	FGm7D6xP8kJvaIJNfYx3UGXQyAs6v04cVBQXN6HOD9fvokwHbmSZSKRzmnjbYdp3
	hKf7ZVdnaY5Jv3gL/lStnlmL/R2yLKi3PRKO2PdZxtqeY/h/CT4Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn5m8b9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52PL0rGO028681
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jj6t38uh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyGesbkX8Dym+3U0VMU8wROAznqTA5hJcvajJppuBaRE6z2LpBxBObTAz4SRT3iesLXW7NwS0pD0xtzXjmbfytEjT5R2DypmYisDxivTx9pN9eF05rSm1uMtusgMKnN3msTQkOn9NLvv/8Jj55QLkHUdbQR/GciKvzodG9O2XTQjQOkR1VrRNS8FYV6R+A743kgn3fscWme93UQgOrCrFccZs235onUqxpMyaPy2E6CrUOhG3ysKN+OZbmophmlZki5D6pyxNbd7FxMUwkGzylY2d6BnSAwP4VqyAENQW4RzykH74BYJ/AVqUDAnxPy0dS+/Zj1S6K3l5RjFBu2VRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cnv1WuCS+i4QDurCEB90Tu367cU5LmvKJJBuQJrJe90=;
 b=svo7a4LxDctBeSH58m0b7QJBTWIbr7LXBmxAHaD6wdvBPBHThlycif1QnAW5uMd4kOPAsXHY6PfG4L/gaLydPuXm4tjnSgWJsjqhUCGP/ek+bhSNIjCGfmcqnqhEJGDB52KNbS84jP53x1PjMues/b210FRNUovGzHkHbfqL5B1YZ400cCxAqoScGW6RUgifwsIp9A0Tbj9ZWuAQCLEJOGwUUSTQvFuGpECQBOPra3yxSBcqXQvSVHCVbFOUhoZ7KjSDo9a9CSgfwmebbfNq/VYq8jXNGDO1X7j3sOXiAcyVvFojMptMrXBD1xAfRkPT54nFH9ogS7WCv0FCGIxRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cnv1WuCS+i4QDurCEB90Tu367cU5LmvKJJBuQJrJe90=;
 b=Ds9yhzsZLiLt7ZT96pbEwSaFCpVz8x4D5d1HkHDRnayGtsj9HOq2lBtRWl4x9IA+xbfPGoI7K8xZ49wQp8O8mZ4X/BVGZbWwH8jZyxzPYl5V1FmL9rGj0ejvsH03U7UKFNvucnYPdL27qr1gL28VttTpVAjjydkQMqH95EIYLOY=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA4PR10MB8586.namprd10.prod.outlook.com (2603:10b6:208:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 22:25:26 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 22:25:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] test: Update some char-array results files
Date: Tue, 25 Mar 2025 18:25:20 -0400
Message-Id: <20250325222521.15224-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250325222521.15224-1-eugene.loh@oracle.com>
References: <20250325222521.15224-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA4PR10MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: f949011f-56ee-4cd5-2267-08dd6bebf104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Td5uL3kQlt9O+Eq4DDMcWfNn8LQ2EXSsUSbBaGn0ANr9T9ieMh/HVv6tHEF3?=
 =?us-ascii?Q?B4et2QTA/T1PNwbjW7o5YL+OE/w59ZJJi6kq1rZw/k4rzYE7Elxp4yN5rDtt?=
 =?us-ascii?Q?9RrlpJO8dLamLrLpxlEG4Vsv0H6yj8V4dqFGcoqSdcHqkTkeWDWLTF5Ah1RK?=
 =?us-ascii?Q?bTuLa2Cfh5gsm71LVXL+2ykHifL7u0g0uFg/tbeIdD/GfCOtmQy1AzVUOhlg?=
 =?us-ascii?Q?8Fecnr44drM3DT8VKHPTGitVAV8TLVwnDOKj21VFaH92QbD/ypaclXtN21WU?=
 =?us-ascii?Q?5Dv12hi1MV78GJYzQN8Nz/z7Ag+++nvLpEgns4nc1uvkEU5DKlBYf7kWoyn3?=
 =?us-ascii?Q?eXIcnaUDvwhP0Hzj90dtA7Ga8EPNRn5xqOc+MTZgetZ8hYsSqwHYXOtIlfBi?=
 =?us-ascii?Q?FDhEGI3cNTV+PEBzpPIpc7436cHkDPZJgF5EJI2helQy1x6z5Xgo8AfYOiFc?=
 =?us-ascii?Q?3YOvkvLBTil42tIKXDmQK1zifgrDNVwYIe+KnVKW19AoCnTJjt91BZIBJbwE?=
 =?us-ascii?Q?z8JsV+JjAlnSoBlSGAR5J3Bs7ozUG02z48vb7Lbs5vFQtv6thY6pTuCfixYT?=
 =?us-ascii?Q?MR52qUSBC5UEcGYYmQrM6k2kpCsqZTdXQdIOv5IgDTtHl+LTD00hAGh5ipWl?=
 =?us-ascii?Q?bI5TL+/V8pocfvwHCTrYnyQzBPLkWAm3bES9MCJjPew8ScFnxx2/JJ7JcBoh?=
 =?us-ascii?Q?ZUC2CkiN9vsJLLA5ZQpEbC5ZfvoeVLMY+pwG98Q0rx8cgVDH8oAuwyu9GZHc?=
 =?us-ascii?Q?tfBBYDmqgdDP9rKU8TE8b9OfdSGi2MPXo7g7Dy4z1PfTWz1RZRSFKbhIExlq?=
 =?us-ascii?Q?3Wre63xrFepA+bjiqAElnSlbyPXtvnR/e/LjnW7QCOZUfXHa4ZBdVxxQR+/B?=
 =?us-ascii?Q?w+y/d8qN+LQtD7JygRN64IV5BGBfhrA5hSQ+ZJzCCXRASmFpxX1991wdkQc5?=
 =?us-ascii?Q?6lK1nLJZhminA+css6EZZMISunhAb3PTYcm6MULClZZ1vMvNYHgp9mCpmkkY?=
 =?us-ascii?Q?hOVDn9guL9NxZLcxa7hkmAXKhFg0PzVjtvCvF4tq3NmK2AW+FWYgowVnpdck?=
 =?us-ascii?Q?9K0LWKvG4tSNeM3GWvGL85kX1mnyy+SbpnK0ABbs8t51r7LOHJXzYZfl6SlY?=
 =?us-ascii?Q?k6m50zSAqZj6iZ8FGceXiZNnpNrBtAC8YhYSYPa2K9++SLljidIdYl+QoGMv?=
 =?us-ascii?Q?3t0cBJcCDoYhjqGpQCPSjGC7n0LA1P/lauUXLfNchG20jH90/EV/+5vWcB17?=
 =?us-ascii?Q?FyjvLcGT3bM4LaeCx8/d1+j2R8PmsfPo47johIkCY0m0Y3RubKMqUXmxxaj7?=
 =?us-ascii?Q?dp36w1v/VFuGqiuA84u0sAyUPRCTICIkteOWuShvsel1XVSCFumz3GVnS2AQ?=
 =?us-ascii?Q?Njx+LyryxcVheyczqL7BVtnHqzW0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O7bNfVbiuUWWY7wmJ2cwkPAnKVQr76ynzoWbHjZx3Ysl5NHtAQxniB3ipSl3?=
 =?us-ascii?Q?Gul0cEymRWOmZvrB57wXbZ9T3vewkuI79WPzKaB0We7PrGG8QabjErqSRgUX?=
 =?us-ascii?Q?UxxLbMq7xaEwVm6sRt6QSIlh9WrrgUUf0llWIIgAK2MxVpcAf7cRDsQk3I5p?=
 =?us-ascii?Q?rp0LKelnzc/zmQU9SCRscdPxAcrNnxV1sUD/rGlgjhi/EVD0kWO3iMHhmLlh?=
 =?us-ascii?Q?F0IiBatnYgvyDUSGP+yyqJD31KBEr8bxoc0NvxsvAtfc7b1KEOTJ+2NIaofc?=
 =?us-ascii?Q?GcJSTNZ2ZjNni+9ISKBlJeDwLhyc8RhF+HDNL8q72a4y5hEYXcgugB8OWr73?=
 =?us-ascii?Q?OIXSZlR6xxmATZuYixQZyubsTjT3n4fq+x+5MPX69Q0K3CZViFMY2GylxrsA?=
 =?us-ascii?Q?x4N0C2/lLQyOtIRhSoSN6KPvcsmkW3pW2VTgGuyy3pxncgyI0aYjAiT69PbZ?=
 =?us-ascii?Q?C318nxuhiTHSIhz0BrAhH4Re0ZulpBLyODiwxUw4e7rSisEBm0ULkBupdV2t?=
 =?us-ascii?Q?yBsFpe8+JvCzlaWDRkggnaDabl0+E9Y7M7Urwi0RNIVOr9Nd954oLBivMB5a?=
 =?us-ascii?Q?CN7w6tezZvxYGXmvM7dp6T5Aev7AamxfLDo04LnegsuBj/FOCpbydXM+oMx8?=
 =?us-ascii?Q?XH0cMT9Wd5rR8qzKNPMYO6M1a9V1sqFU5pVPJ39qE44hfrKo4iu54bvEFoCW?=
 =?us-ascii?Q?cJLHCeJCMdtCFfyo5bai0d6NwHO4j0gVQjb6ByE1OM//fHZ947vxIO0iVn3A?=
 =?us-ascii?Q?1+3hQfD9nfmn0tD21fPZrXWZ5MDtfWZc8v6NLBW8gY63sIpy1paMA0Mo+uHI?=
 =?us-ascii?Q?NgvxhHN284yDJCrqaVPU82TmniKp/PapCyq1EPl3Qat7JnmQZimMJssJTzw1?=
 =?us-ascii?Q?ephaMGEh5sAIJje6z7w57ssyZ9HWgmloyBrRQ2CFD0st2fN1CzPzmCFrOctN?=
 =?us-ascii?Q?sspTjbIQrr9OjWch5hCUG2EZTn3lcYkqIlftn10voXTd1fIX9SkbeojaxG1f?=
 =?us-ascii?Q?e59218PpyCWwY/ICuMDaK1uyr4JHvSLmzZgWU+LcJ4KrLLB+NLbh1Eh38Ve4?=
 =?us-ascii?Q?jsxjEAuomJ+QxImTH4PJSOR5RcyLslLc/6Cl7venLyjHSkzwop3P6vRYqfHP?=
 =?us-ascii?Q?X6HP8V0VLyUBNrParSZ8Wcg/NHMjaCZqZoynPH8KCnbRioXfxRgYVTMid1U6?=
 =?us-ascii?Q?M/ZnIWdFCUrvdnV0HY6u6RaALbgczRK0j+r8koUc8RY3y7GVyAwF00286Jgx?=
 =?us-ascii?Q?bOBZVeUGTHoK/K2acIkKaFGwOggrEYyVftJx4uraiQ0H6/U1piAzkmJAZ8zw?=
 =?us-ascii?Q?FKQTHVFEs1SMcp1CKtggd0jwr+npEK8i6o3X75gPmIehMrGqGElNnvm02y8G?=
 =?us-ascii?Q?ivmGWkXv6Zdu59XpQUQ24eveSIewSdLCyC/9RX3qSeyjV3q8gQkPuDnYUeNQ?=
 =?us-ascii?Q?3qjxpCDrIV28yovbj9XvV5qTHLvLdBMa3c6dpMGvRgfJxybTvGI96IhpDbAg?=
 =?us-ascii?Q?MiGeCLJXELMjCJwjHM+7j+d3m6n6LOfZqplKRH0arDF7HSalpGlXAIj5JJ+a?=
 =?us-ascii?Q?TD+M8wVca6S1GqFY5yzF8fLlkuXpLDQNvb3flCPj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VMhGCUgHMfKkHbrW98OtejRAV3NkVPf1+/48WBDL7m2TdhpsTBl2qTvLUSzixhukvbZpJ6E7FSja3mHF3zwU2IlC3QrKcnqBifm1S7sZ6ix6PuBX5598yQAulJDEqW8994Zk6sIekRBy2zaFU4quazAYuS+5sTSiqfVmQRdAEfP2THqX0i2AkK4AK8zDVc0Y4KssJNyy7dmOzVtIGVbMzZQuv+vqQ6zKn11FwfHeXkQngry1NQKo2J5luNOYq6o0fONzS4UiYoKKYFqdBrJ8NKYUYL01xj85EJ2YtlaTF+CcORArMuVy0S14smrsrWLTioauZQ/p2g8fozAE/GROS+uSEvIu4LByOjfeviMr56fKZaT/f6tI1ff6+ZtqsHz2fYRb831yhawzyMm3EEgVRUXNIbZzPpVXhRfv0ZRnw79FFvWg6fhnERRQaD2SeHcX948gMnbe5HrVP87KopnEsYXkN2EpRg08SA4sEDQqBZmFoHokqQKrAzrX4f+moQyf51/HHHgbJIl2R0NaNf8EjPzShhtpR1MHAmc9sWsQ4xa2xicMG5oeYhgPN03xnfejwGtkLtJbVrsGUXmkCVPbU6GKf2eTGgT5aR70Am7sXw8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f949011f-56ee-4cd5-2267-08dd6bebf104
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 22:25:26.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7tMSfo94zxdsQB5ihSv2fBg7FA5k0vhGmqqtpmDenP8/X9sA+sMKRX9ux4nENMiO5b2nr1Qhev0w9tA7wC1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8586
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503250149
X-Proofpoint-GUID: SQps-Y4zOzZPOkLZVWDdLooTBvCQ__Bz
X-Proofpoint-ORIG-GUID: SQps-Y4zOzZPOkLZVWDdLooTBvCQ__Bz

From: Eugene Loh <eugene.loh@oracle.com>

A few tests started failing with commit 3a551bfd
("trace: fix char-array handling").  Update the results files to
reflect older behavior, whether on Solaris or with the legacy
Linux DTrace implementation.

Notice that test/unittest/funcs/substr/tst.substr-large-idx.d
specifies strsize=256.  The older behavior would result in 256
chars being shown.  We add a results file that includes a 257th
char.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../funcs/substr/tst.substr-large-idx.r       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/test/unittest/funcs/substr/tst.substr-large-idx.r b/test/unittest/funcs/substr/tst.substr-large-idx.r
index 8b1378917..79fecbd32 100644
--- a/test/unittest/funcs/substr/tst.substr-large-idx.r
+++ b/test/unittest/funcs/substr/tst.substr-large-idx.r
@@ -1 +1,20 @@
 
+             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
+         0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+       100: 00                                               .
+
-- 
2.43.5

