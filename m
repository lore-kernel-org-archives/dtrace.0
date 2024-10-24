Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB91B85DB
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769925; cv=fail; b=kcgL+FCz8Uji7alXCIlvI/g7A3HKsTS4tRBUSYClrSZjS8Zsc8ZhU6Sho3v2S9/N4kwnIHlswBr5WVskK1WCNboCfqlFg94X6wsTxXNl8/Vw3XqNulC9A9LpBNn/r1KKTOmsH1w3nn8UxlnME3kNBW8V22aUbWiASQIKw6pjcg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769925; c=relaxed/simple;
	bh=xbDHH7onK5/m+8zFVL2b12tj60J0NrFbqlePBo7UmrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jji/vrhx3SvtFHUeObeTaNL0840horBsHVtsIscd9REtbuuLkMKcaQiBmDIfpuTrOmzkQaVsqCvsByOc7iNt5XCTXVFrwxAKpPKgQ5fEW4udDv/8ldHXb2HkpxZkQx/y7ylYd88tc/5scEtOBcJPg7xK41ddo4Not5CTEpGGvcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XpNqqJZP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e6x/4fEd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XpNqqJZP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e6x/4fEd"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2g67w030638;
	Thu, 24 Oct 2024 11:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mcXf9e4TXUqUh9M3sGZoPF8tVxRE4U9k8ZHlG7jcCEA=; b=
	XpNqqJZP5ORIflJekMj6VrIO/oiWXfg7wLs2xeB1UrqKU9srFcXYzX1MD3CBKpiT
	NzDGh/BpJLopPeTrUE4GdURKmheOhb2DWip9lQDuymVUDNexxkHAsupGfTbWgMDK
	/0RvrFLHAMSmHwdThs18d/XdjFFTWHY9bv5YQoDvuImq2nLWpRUtZZ9bA7OQPSC0
	2rYKcZP1GIQ8QlWDyzvMKLlgYONKVL8nMsu8VWo0MDuxa5tSsNgn6M+eCa3P/MRJ
	muBsIkN/2Ze4Jsoferm73iu3dpPQSucCIKBgYArkitmk1bZbAy434YBpnRwjJo1G
	2EEgSASS8kd9xl6lZQ4IDA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjc0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OB8t8O030951;
	Thu, 24 Oct 2024 11:38:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh2tbb2-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iClcPzz0AcYuCqlhHuR/Bo/q2/Dbyqs3IQRujs5m1Jd+0uPxJXN8Ivr3A7Mwck3u6riX19dDIqDHBqLq0l2FB+HaTxmC+KHSnFnrnjpvSzDjWwaxrkOneY9oXY6Is1UgJmt1R3LORCdt1Qhb5u3M9b7r9SaXbyXNm/D4SGOhxaTaSlstpM0zD/0e5Rsj2I20eOCLcWoJveJWKDiUiN3YatFcrNryAWTTYH4iPmKHKNjAUihjymXJcJp27o8jUu3ptOahc/bl/eoIJvzvm1e+eK80siCezlgHf7I3oI1K1OF/LE3Z2QMpsDA9ChxrboYxBMwdzb3urVFODNaf0vYMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcXf9e4TXUqUh9M3sGZoPF8tVxRE4U9k8ZHlG7jcCEA=;
 b=PAQSR4S1w3la30M6hbzSKXBqgqtSnQBlo0SmyxFLjeADqp26nJghTE/WKP2mdJFyNVYrJMua1al6BtTrrf30cxS9iWckFniNmoskZPlUmVFMNYLX87Ls/IPs2/cBIuF/1bkvGVQol/t/sldD+ZnaVZcVZPoSnOTl3Vb+dxrSI27yOWyOGzA0o1+etDeJ03kSbF8Y5qk3eIW4HQOg2OIeUbFkVjUXIlJU4GCEe4YdGZl3WIXO2W46/lfnDtuphyKm8ZyGvpyDdonhlZBGS1cqzf/GRTfKIBnRU0/s44cnQc2xCTYsdacPGtLXjeSC164XZeFrEV0U2ELEhmabGVumiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcXf9e4TXUqUh9M3sGZoPF8tVxRE4U9k8ZHlG7jcCEA=;
 b=e6x/4fEd9c4+Ir4knBveCsnAwxP16z95GyN5TVuD2V0MOFm5/tpB7qKlg1Sp40ExSZ5L1ORQNTdwsF+G44By30BsbGQBEWGealeLpW/HBQ9B19YnrHF1OdnuYgS+/L9jXO0X5UbCBdDyNBIXekuvB8zWvfrZuCPeNsGeJM7iEB0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:38:27 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:27 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 13/14] man: drop double-\fB at the start of every option line
Date: Thu, 24 Oct 2024 12:37:57 +0100
Message-ID: <20241024113758.182050-14-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0469.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::6) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd85067-68b7-4838-439f-08dcf420604e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?isdwQI3LUe7uljLVns8IQ8MV7vFzsJwB5KyAUDaWf56lpO5IX9wop6hjef/c?=
 =?us-ascii?Q?5qYqbt1Epozt0k0Gm9zCNLDsTlSGg2Cnd6CIy5BiFAoDMrjgDyvFW3/AFPld?=
 =?us-ascii?Q?f7J1/XClOhcyuXMiRA0PPQvG6P7E0F+uuSLBUOVOPdoFstHTHr3MCe3SRBIb?=
 =?us-ascii?Q?70nkH0E6gHLAbbWFzTeOZ+ax3wL3Yp46gTJABthYwwFY/dei9Y7r9f8HCr7Z?=
 =?us-ascii?Q?etMH2LOeO1DR2O7o8LZlxO8zmmv1lBNU7akJiqVV0hCq2+3/MdtVnOfslTwl?=
 =?us-ascii?Q?UBfr/n7wyvdG3qVpEdIIpiFsObf1bqAADRsOBd4GhNXIFUbmkQ1ZMHJwbhBK?=
 =?us-ascii?Q?Vs0VXatCh8RVCz8RNwTg5kid1pHCRtJfgnvfa5LkRVxmTacm8zJblRNepxP4?=
 =?us-ascii?Q?uSNjDDSnKjXmgEIKtUJmPWDDuOAu3r0325sHsCa1+X+M4/lLmwc4if1FbJxm?=
 =?us-ascii?Q?ja4SdIbgGrmAYNK2vLRJfNkzuX50kzoJzeeMYHLCAPlZ8Qhj5DIUen9tzxSr?=
 =?us-ascii?Q?Q9iG2y9RZQ5ma7RLeVyva/zUgzoUhnjYD5PKP4Z+YXaYG0HYRBQRFjOpjALx?=
 =?us-ascii?Q?8yG8WhDEt2okKdY2OogEDINiSuVhlnd7WI3D56AN8r0v2UUmq5xC91pBGgCE?=
 =?us-ascii?Q?rsBvD7wIpE5/3Mkj5rQTxseR2/SHYuTKu7W89/aIwRFA5CSR+9MpGpjxpjtB?=
 =?us-ascii?Q?9CkAPlrIUORyhOs4gtMcv9BsOc/dfWwU8W4UgXb2f3QDUS72rt3JMocqyxA2?=
 =?us-ascii?Q?ewPC1hagl9jx+VanIWipR3xaRb8jmEvfuN1tGPAlruDO4AQlpxgFirchxsvG?=
 =?us-ascii?Q?78aNf5i5QdazWXFYZfwPtG0B598ooRtn4i1AISlBi7nPFFvsiP5c42y095k4?=
 =?us-ascii?Q?Shb9uuCHwtCFvsW3ezuwv0PnaadEv8nMUDNhlK/LZD1gYLMCBX7Ja6NXt165?=
 =?us-ascii?Q?udVmR2ow2e7Na5yyZRn0jpjJErMluYscn/BL80bSSUYrafiu755WDx0rWMC0?=
 =?us-ascii?Q?p6HMoJBRJlLB9BKG73bXM7riOUYrUAQZ6eQa3HwgJSwHlPaVFvLhpQNU3Vvs?=
 =?us-ascii?Q?y66y4KuBgyXDunx1QIy13SXQeM5+2B/apMOHYkjqAfiAnaDD6pv7f8SbPhDn?=
 =?us-ascii?Q?sJMrwg8kaGFHxlv+ZatFob7hn5XNPQrPMvq01mFm/qKxD9KjBDBFMA7xeTi8?=
 =?us-ascii?Q?rVyAJTzsCEegLOzYsD/X0/cVALAg6hYe82vHF4tHAbXRA8fCTyBCCtW7WS6I?=
 =?us-ascii?Q?QzUsNhZXDMGb7Ti6o/cpOZeSR7SybSM7SDQBmhIlpEsydASoOgDM9dxJetG/?=
 =?us-ascii?Q?F0hdQQbtHrcjOnuIM45pNtMB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMg9g/9Hj1/wFcEvT2GTAYfEC3b9WvCijnCVqYiaXjo8cxVboAhODt6qaO1I?=
 =?us-ascii?Q?8pwz1/ukj6stndTWtkn2HjG6KoXC+91kE0SW4pwdKFzK6+5Ous6CnZwzeyWD?=
 =?us-ascii?Q?GskzLJ6XqWOIQTx/6FBmJ8LbIIwIwIbn1MFo0CNwm/AK2aKn1CJobKncylRU?=
 =?us-ascii?Q?u4lpyGIfHLAvZ1pLGSvIRT7x7VSr2i2Pg8Q0f32J+3OSZV1Jhm+JuMLvMUCl?=
 =?us-ascii?Q?GRxLJFa3sXjNDny1SzL9eLyM+0laiqb23/P6XNK0+EJd9a9V5LMg37kwxkNa?=
 =?us-ascii?Q?lXp5ZV88WEHVv15EfPvlMQ8My51Ya24IMgcGRRL/GlyjqpQV5VvZyg+uuAeC?=
 =?us-ascii?Q?9AGFIgTPfKFjXbiKaLZY6FO5CX+U5XJ4sP4HcftpWj47FZcniJbxetVNsHN5?=
 =?us-ascii?Q?JGcNjdjZt1fC1FMO6hbQXyq00EJT4C+z9WDEHla2LFmAARv/pN8+qztuiO+T?=
 =?us-ascii?Q?vqmILBqzQxRNIRU2smwZWCaLkF1fo/i+XeHMAzMWv3K2Uz+XYTNAzzfeJXmG?=
 =?us-ascii?Q?/IEto0XgqnQB1JI7Gaz6aoY+PROibZkvONIykixlR5zr/ASlLxjLSyzWk1yg?=
 =?us-ascii?Q?n6ddJbL20/MiFmDd/WDDpMn2I6yoEpHr9ZC/5s4bhxlA2+evorJ+VemcApU8?=
 =?us-ascii?Q?8rsO/AsXs9QLtl/yoU6jrdCdeHjtr8ZGR4Ajdo3iFSDSVXGmfmZfZ+AldG+Z?=
 =?us-ascii?Q?65dYSK/NCi5XgV05LDD6nel91NmYzXKTJDCrouR2cujDtZ4z2qgih2nSU4EM?=
 =?us-ascii?Q?5BnQkiTiQJ5CHKCd2GPn9WTbv/TUu2NLPFXSa1CYYRaWwUNGRsjhl8HPfKEv?=
 =?us-ascii?Q?USDF883IzNf/Y3yHcyDqs0iJtbhRaQWNa943CDpJdF6mKNIpJdaGBj3JHA10?=
 =?us-ascii?Q?O+3nKpKHHs/BgYRvBW36dd5A3dQ/26L8CJJK6MZ1gVZUU291dhN4KETi2+tJ?=
 =?us-ascii?Q?j6G29/7hVWEEWqYlwL1DZYG7J9+CP5mQZXipDqEQ2cbGG/x05Pii55LiMq2B?=
 =?us-ascii?Q?BoRJ7XD/0mQW5wMec3vCeAvVkguzP/LeXmjp7I01elK1DDcBYVQ2Pqb+RM5Z?=
 =?us-ascii?Q?GrIBaRzWQq4HpCrNjVZrzm7MFecxXHk1PoX6uNhdfpcDQ8+b+ZMq3VgZvgeg?=
 =?us-ascii?Q?z1Lh3xOg5ZntmjEn+wVxVMWprEGE8ohanb+wldIihy9kNFcd/jL6UQ5E41iy?=
 =?us-ascii?Q?h3RSoQ8tVekir4EWHBye/DmoPRcDxygDfqSVebm+FHBt78XJgyLmfY455Zew?=
 =?us-ascii?Q?pFrK26+HE27QxEYZe5GdrdqTmhIY8GVEm8BMXvZLw8ltajBSfAgP39wH0sBO?=
 =?us-ascii?Q?sWATq+J1u9Fr72lj9Zmyt00TdLJL/YmIu6ppzN6yfzGQJv7zboFBJamydrte?=
 =?us-ascii?Q?VXr9WG4fo8ZFm0kvziilF3+SIiST+wnnQPXHwLf25t91F36TGK6qT8Qr+5kx?=
 =?us-ascii?Q?4Dk+EbNhokFbgR0Tn+ZaCfsI2/wj+xYLbqN205Kl5frHCgj/rMvWbxQhnASU?=
 =?us-ascii?Q?Sv5SM+DQj0ipURp/13f4jEbEExS1PzwE2WLVM4duw6fKL1cr8Kid8+JhMbAP?=
 =?us-ascii?Q?DoxdE8rycBgQgy9jKluvDPI/3WFXRI1X8ZFAVXtKo4w3yBuOF2EoV49whnGi?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pDwIkNhGB9rSBiN6jixBS0G8w3PHKpAwzyE1ZJz3rCzzVAYVaJgf6vIBcWIktP8tBmwO9LfOHrYTpTfOa/D/ipAKscJ9FLyPMvm2C+JYE2G2whfcJYXNeeWIxImaWJ27P/bLbrqHXH70boiIisS8noUNeeMDmt1gIt5BV++NTr4QK/N1B94oeusfzvwQnwGqH4YlWcblOgDso5uc4C8eHD2DR+LDXleHDTwkILBf0MnpXWQVTJXSoTVzZ9xPUZ73fL9K27YNVGRIPzHxDqWOmfzzM+BWehaIowGCAXIY2iqFtHg4f1Wm5jvWulaS7nyVyIR8DrECMHYmmOqGfZNnzkeiLT+SF79KB1XZTyKrUUKo0mdGVpcdN0LZ7X/7CRWyuFisPYPS/003vcCQQfHuiAucpKx0nz+W9AwIbhuYgmMWrjLcp/UysCzUqhEOGoHyiFa+f8F2/z47PByCRj5XmvgAnSQJ9Gwnp92iBp36T0Iv3goDhitlbmZWBhckZITcJIe3S34yLJzFS55wY03S6ZBRsraV134D68WnwfVpR5eIYLvMyYNhDl/BjoVucf+sXGxaC1u1VSCNO+Tm3qAOFTMVIkrX/bKQaQS3VPZ2f3E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd85067-68b7-4838-439f-08dcf420604e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:27.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XO9h0VT8Eu4+s/pFrFu6c06oCAxtrRkmg75y4FMBJ94CfVEGySmasL2ruQ3XVuBgicm382BTSHTlloAfFNcvJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: c-hLHBLj8nug51yp4IaKgfOoOYlwieC6
X-Proofpoint-ORIG-GUID: c-hLHBLj8nug51yp4IaKgfOoOYlwieC6

All this does is stops \fP (which goes back to the previous font)
from working.  (The manpage looks fine afterwards, both on
the terminal and typeset.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8 | 56 ++++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index c299073239eb..355484bd0d34 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -64,88 +64,88 @@ The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \f
 .LP
 The following options are supported:
 .TP
-\fB\fB\-b\fR \fIbufsz\fR\fR
+\fB\-b\fP \fIbufsz\fP
 Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
 .TP
-\fB\fB\-c\fR \fIcmd\fR\fR
+\fB\-c\fP \fIcmd\fP
 Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB\-C\fR\fR
+\fB\-C\fP
 Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
 .TP
-\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
+\fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
 Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB\-e\fR\fR
+\fB\-e\fP
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
-\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
+\fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
 Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
 .TP
-\fB\fB\-F\fR\fR
+\fB\-F\fP
 Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
 .TP
-\fB\fB\-G\fR\fR
+\fB\-G\fP
 Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
 .TP
-\fB\fB\-H\fR\fR
+\fB\-H\fP
 Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
 .TP
-\fB\fB\-h\fR\fR
+\fB\-h\fP
 Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
 .TP
-\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
+\fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
 Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
 .TP
-\fB\fB\-I\fR \fIpath\fR\fR
+\fB\-I\fP \fIpath\fP
 Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
 .TP
-\fB\fB\-L\fR \fIpath\fR\fR
+\fB\-L\fP \fIpath\fP
 Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
-\fB\fB\-l\fR\fR
+\fB\-l\fP
 List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
 .TP
-\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
+\fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
 Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
 .TP
-\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
+\fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
 Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
 .TP
-\fB\fB\-o\fR \fIoutput\fR\fR
+\fB\-o\fP \fIoutput\fP
 Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
 .TP
-\fB\fB\-p\fR \fIpid\fR\fR
+\fB\-p\fP \fIpid\fP
 Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
+\fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
 Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
 .TP
-\fB\fB\-q\fR\fR
+\fB\-q\fP
 Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
 .TP
-\fB\fB\-s\fR\fR
+\fB\-s\fP
 Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
-\fB\fB\-S\fR\fR
+\fB\-S\fP
 Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
 .TP
-\fB\fB\-U\fR \fIname\fR\fR
+\fB\-U\fP \fIname\fP
 Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB\-v\fR\fR
+\fB\-v\fP
 Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
 .TP
-\fB\fB\-V\fR\fR
+\fB\-V\fP
 Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
 .TP
-\fB\fB\-w\fR\fR
+\fB\-w\fP
 Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
-\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
+\fB\-x\fP \fIarg\fP [\fI=val\fP]
 Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
 .TP
-\fB\fB\-Z\fR\fR
+\fB\-Z\fP
 Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
 .
 .SH OPERANDS
-- 
2.46.0.278.g36e3a12567

