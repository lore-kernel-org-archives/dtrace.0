Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB5195
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765196; cv=fail; b=ILJZiMW4nny9HI3aUYKBwbAj7WWTDpUFZs8SS83jz9QxGFa0qS1o7OYiGk7lf34pXaGlC+qak5X9F6GEYVFluAfaM8fX8yTOYLPFCeUQ67TlA0KEE3jOMNkDYireY/y9joyxyD4sMXy51A3mdQMKhU3PGsbB9gi+UsJePDKdGf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765196; c=relaxed/simple;
	bh=fF2ShgeSlZPRi5gZ2WezWmP/wcQYPd8CLD01fDcNgj0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ps415ezT4uENFT1Q93cP/Oaw7AictzVOpNKxAKO7Tj3f6M0yAeB30exV5d3m8iknqcd4p9+J0Tw9Nqs/l65PI/mqIoiQI4mUNDb0e7FHUm5GWT5LVHQK2OC+dyRmUcJMRzWY+HpitBaEfJd2cQMtSRv2gLRCtEk0jJAi7XZFDlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I1CV8Pam; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GBvq0c59; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I1CV8Pam";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GBvq0c59"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Lh4hf025745
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=CoEVo9JexUr89r/7
	nUQNsGVMTJANQ6HPbl67/AAE7eQ=; b=I1CV8Pam70LISdI6IZ8pwcYkZfolpZlO
	9qunGidH89jLZtoJJY05ogR66fnMNai9foX39EDJ5CejOCd2yK643NoGwFU0wQ93
	D82BvVAr1dz+J9YOimVqR7pP32lg6noFOALHNLqXg6XuTg7rwiwptL6tcu+vKeQj
	9nTFEjbjdEVHVORJhwBv541+7wNknH0znLWu1IhFqr6yHcMpjyaNe568b8X+ytfh
	jNq49dz9gANAT1DN/sE7LZ20/8tO/NRdKuUEbyJPYoFoR4jWPd0MkuS2bBUixaqL
	h6elHON1QbvAt3EFk27mWfR0EvRN/VHeLu5du7sVMvgIqdb/1b1FFQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nby8v2dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Nx1pZ035603
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:17 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahcrbav-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2cBDUKivSmoP4XS2b9wpOaOxV/qpJLyPvHvliPpINurT9LueRLqiJC8oLtYjdApzgSN5gsY07PZnLYptb8v+CPu9pO+9t7mLpcINHcsGL1sbV+GbRYyihfAvpUjisVZ4aDA4S6eCvF7uAJHrqXoiucFhj9mP/MYrtc8FVd1hvcFX1bTIq/dF00pYcB67X7Qwj9yFyOF3MJUZsDKoCXz5SSqsePofpys/+/t6aFs4uaro7zEmycxg/s8tByJtBKrXaHMFY771UCgWtVYciUVpF/4zywUySTu+vBb64MUWjLASxy1Ftr19JesGmC3OFjPq6s7hQtvqmooyqfm61O5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoEVo9JexUr89r/7nUQNsGVMTJANQ6HPbl67/AAE7eQ=;
 b=uaO0W7xhzFoWKgplwwpuO6xzHBSwBOzFsI+yLS+oSgJqd9T0BKVxz3/s+pfFYIlwORttF44PL+U+izLISdv0VEGebsS6XP7PXMGHXwwnKaNoxqbiaGLYN1gmr1XczuXzehgYpSMvT5RNzv2Otvjz939cytDBsNM3ejviVYWf5nJrfE6uVehMoWlbqPhLj7j1cu5Dcyv1ozM8qIWQWFEVIPifqrPmkuh81WllmMWa3GtGe6ZzqLIC/3oy5rSDVTqxFxUrb8Z0noLNBnFklZZ7hbWVVUJAzp/vh5n2gP0uxUzHNLb0PkTTGxzPYfT35pmOU1esE/fIarNalTOXwSS20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoEVo9JexUr89r/7nUQNsGVMTJANQ6HPbl67/AAE7eQ=;
 b=GBvq0c59No4nkIXJy4OP+o8l7zKUZyxWmdBf9F0Pp52M7nFka/TPz87zTNwjrsGq0wY6YQ41uB+YMv9yY6sU+rxQUiCcLkw+eewCwV3TWUbCWeQ4P+BRUqWb38gSF6rLX/wOmuTQIJ49MiRgf2MTXPgFnVWCtggYRTzAmWeeQiw=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:15 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 0/6] usdt typed args, translators and arg mapping
Date: Tue,  5 Nov 2024 00:06:02 +0000
Message-ID: <20241105000608.333229-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::10) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 359097df-0cad-423e-7565-08dcfd2da9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7UCKhl+Wpid4TL2qhifzhBd3Uf5aPWoL+IdKc4+DoWWX9ze7VLqADDsx/TRX?=
 =?us-ascii?Q?ry14NBDhDEeyrAisXVPDpG4fRAz1rUJOGdpj0MRdXdj84jNL7aFAykHVFHVx?=
 =?us-ascii?Q?h4kkSoeyZVPgxnwRmtdssQ0zx2ul5HLDcPYo3eR9wTN7Toxn6yfMO1xqEVUo?=
 =?us-ascii?Q?8iA6HbPyI7bLMgdAmeIFhZLVW50DduvTK/DupiniAdTjAdfCjPpeOqwLn33Z?=
 =?us-ascii?Q?bFbL6ik5eXATUqsdnKa9/6EXXMRjA47am8APk4smLC6JHdCOf5qAD5vhDvIq?=
 =?us-ascii?Q?Uf/cIEML3lO2WPcq66NPnIaGL/xs3/S0ay/e0T+YY2mMnvLZ7YUmx2fvIFKq?=
 =?us-ascii?Q?Zouew3tm8g90dVYwI/wQU85YyMtoGWeTN7qb8xxpYRPGkHr11PydxJl4hFrs?=
 =?us-ascii?Q?bb1jJuuFCafivr+bI5OWwVssdG3Md2zwMILalzooB3ZM+E+TJWBMqQ/+fC0e?=
 =?us-ascii?Q?i9C+fmTT0Mn0i5aKUcyf6UBDBbISO7hlh47DIkZW8bP7cjp1jgb2XcLdqhH6?=
 =?us-ascii?Q?xqjRfkoDE4H4e9sLVnpn7KiMHxbR4Dv3skIJqSAxcX+h6Zoi/9purp8uV3Qz?=
 =?us-ascii?Q?wUBQ7EdTTQ5T05IFMk2BBluKBevHJHVB7zvb0vpE3WtXOAo2Jwg7LPgEwggb?=
 =?us-ascii?Q?+Mf5MBYsdqF83wTQku3jnMp5nRDzHcAaiouAr6k3FX8O6uvdRwX2EeFhU2wu?=
 =?us-ascii?Q?Pr8WgdOLclC5iSdH0FJfB2+Ri4lTywvD31dWqZpdySKn+C2AqsNr3GETCf+o?=
 =?us-ascii?Q?7LCp9c6fSiNVp0FEJrL+ALe6Zv0YcRvbM9Zkiegd0drrRhadDebmzNrKnX24?=
 =?us-ascii?Q?cOs4DvNWB9umpVoyAfAqhhxVgzKg3WZ73ifbDYb1rMY3sKajVy9VGlWHeu/R?=
 =?us-ascii?Q?NESYg7PGj4xlHPiLS9BEBkolIUxsaeJu+LHjlyEwvO2sVEAd1h/Cq0gZM9pJ?=
 =?us-ascii?Q?GiWj+/scIz5BLXsEc8exJAydBG86BHbb+/ebsc/d6OZ8p1lvYjWR3i1Ab2w9?=
 =?us-ascii?Q?DJT3Y75KUDE6D8sNT7VayrKp/QqDmXsnAIiRJJEXg3/ULcO3X0ieu8GHL103?=
 =?us-ascii?Q?YfTpiE/Z4I+XsarXnUgM8tHcJcSJ+AQ4rTEIMvyl52JI08dLdtqep09Nveyn?=
 =?us-ascii?Q?iQoLQg8PByk6R4mE23JF7R0W8aNIsBVfzyWvlNOcOllCo9SXDU5usEsNHfRI?=
 =?us-ascii?Q?lzabxpoWT/Ia+IUGLn5JOT5ou+ZyZa2rDxTYoZ5sRl8gz7ewARmnK3mgQ1zS?=
 =?us-ascii?Q?YyJeRtU4fI8jvfNvRRHKRF8cMVa2KxJmNBaPR81+/DgOrAUCV55+/DK06HNR?=
 =?us-ascii?Q?egbeWHNGYqs2n7VAZZSpMFW7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xOHwLQm+uk2BPOvBkgbea5YzlT4v8dcQCLuXd+5PTljrSd8iPsy0QZAtVfwh?=
 =?us-ascii?Q?DvFFNun6zGhWJwwC4iV+mvs/2qfbnaMckw7G5DHykBEnnF+iTkx5pf7stWwm?=
 =?us-ascii?Q?zcWJxQ2AtI9NkG/RZSMiUqPQJmRU2NXme6vVh9BLqtQuTBP8QFW6yCRh8TSy?=
 =?us-ascii?Q?ZXyBa7LisRK8fWqkbgrvD7sPWsWmPHrH4lNPH95aBDdiHyQ7SUXCB3EQU9X1?=
 =?us-ascii?Q?S0fUO6eVSwP+JOhNh3pMMb5KMpeyROCeATNVBRQW8EXpuds5uwoh9xkoFoPQ?=
 =?us-ascii?Q?Rf2rJq/tF8dUjalXfMuhQVufPslNTXZo0Mm4BtFGgAeyDjnT+sKs2YCRNL6n?=
 =?us-ascii?Q?cs6EaSKdm25MZXHzytheFfXLJUjnSWgUwr6zGNCGNbGw2pM83Y7ASY7YcU/r?=
 =?us-ascii?Q?Cj1jO6zcdamk7Ij6VT9I0Y7mMPmfs4QIkSHFXDen56nhvIKouKUJjkM64oj8?=
 =?us-ascii?Q?Kk/YHez9Rq7gE6xi0QhCYTDHuSlNC3AL9CaeDzjxz8+qwNwaqZuxq2qCzmCO?=
 =?us-ascii?Q?IhojFjwcp3n3D3LkoOByBlTZTYJr1MhK5Y4KW05TRz5teNMLq+ZSFwL/nnsu?=
 =?us-ascii?Q?llEDxrpCwd+HY61au4N/e8wCksTS0ayyh5F1KyIaPXSvrqCk/u7yz9jrQqop?=
 =?us-ascii?Q?+mKFaIRsLECP+YtSJKWBA7QtLW6+ZPsxCJMOpC1SOn8inlo8tWKNnjWwuiex?=
 =?us-ascii?Q?+aOKQ4kUK74lTNcZcMzpvuAF5SsJ/nJYZVuDvIEwkijVd9QcCTbBrK0g1foE?=
 =?us-ascii?Q?uEm1OZnRtLj2R/4oobLwPAWrZYz832R99lSr1KP0Pw4o77K9c4zuLll2BfhD?=
 =?us-ascii?Q?kl7ahCgN+F+HNZagcy/9LFQIy/r5KcQlbVAf8/zKEPXLQoNQ3+BzPOaBdv2B?=
 =?us-ascii?Q?a2U2RlFM0ORtfacMmEK7wlkfLqD6kMDV3GTBTU24kF42/tdR5+DsExzmjXCY?=
 =?us-ascii?Q?g0xXbUTE+EU4D8FA9nIrYwTFu9go/XsCm2k3KW4nhZCDiYIJEp/E4LKkCf9M?=
 =?us-ascii?Q?zIm8D+azCBUXcYkxzMedRsYdcPW9JabU0poF2Hf+gMXFDiEhhWfpN+Mg0Hne?=
 =?us-ascii?Q?V2eBP4vd+GoAKUeNWVIPpTAIYRcQGa6k599+jVQOXQjTO5yJGnz6w2YsaT8x?=
 =?us-ascii?Q?vqn790+4ofAq5mRYP66hxKMxqb0tZ6R8LAwMyU3vwpb8qFZi0aYdzdmfqZki?=
 =?us-ascii?Q?X1aY1LB5TxQnVGpMqGyqQjbq3XkDpB7cJDQq/3FzL+PIQC0/i9N5NpNXiA/O?=
 =?us-ascii?Q?DMOLzs4Pj7s3lLbldqW+SREFrvF1SPivzCvYQDUeQr8Nql8Pb8lceK1NNSU5?=
 =?us-ascii?Q?1hJ1vPoNvQ7eQANaucENBUvpBBkUoEbJUp+TlZcej5mVVnXJdu9JF3Re0k7N?=
 =?us-ascii?Q?5/AiBKa+RNjKawNepctOeJX52EEqqzWsqoBkHl2omcyPvjrzyNVCCXg3OvbS?=
 =?us-ascii?Q?m3jACiBtJ5XyWFff5ZsncNyBL7v6o1coWTU8wpzBrxiyXmtfU9+MxmGTdUin?=
 =?us-ascii?Q?EwqdcIJs93qX4sicumpU2RjowTBu7h2v3Y/5KaIiv7i5a1gMrgLJbnwCLXQT?=
 =?us-ascii?Q?R+870RuV+S/r3Zaz9c2WjHprB2METYehIKG1GNwhfE40HBhi3ka4skYt4wv/?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Zk+57umO1sryhsa4zPzjIsw76OfvPpjYg2TqLEawa3zXmMRjeV5SqcJJNk4dS5mMDTtNcRUbsKfN1tHJEoiw1PXDNKl5AR3+8cbSdBxvAKiDY+VqMJ526xYJGDaULqOofK4Wnj4yurjpsSThgeSyO49aZBk6xbKw1OqbBr1u8b8rhfg4sg+kRdFXvazO0xjedottWGUJJ+ClFNMVYEnnGvQN21F5Vbfz091QsFq3sxQBOahlL9ojwgDsORoVRqtxPjnYZTJi7asdEazyPEGM7vKkbfMX30ajIPxIvZ10MiwvuGRVsbqRwUHnlWznV6SxISxmfjPTxdv/U5z4O6auEhjbVdvuUteAWliB3NfITwv7B7dpvDDVdWj2jtfSiTwbxW2lE3bLb/HlTCc6PSuDkDHrbpl2bA04NNSofAXxq8ZPSR4ZAsS8Y3uD9j2MWVYnRMyMSUcPFldH8s+HfkDGFG6yEftWPKJ6MTwduL23yHeVVfTNuw364E6eJdqxWUdQmzND/kIy/Yl2RdoTRV4XmNXGH6Ioean52Fr3+ODe3YgCTLDVi5YyaFvwtHTmYkK7za5uTYPxCMhp0z7LloSGcEMdcC2FBQg/67gs3PuN9Wk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359097df-0cad-423e-7565-08dcfd2da9f2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:14.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8L6HA+U9h4tba1LuGwKU4hGQU4JQnRwDnoawOliMNEk5lNOnKu31pc31F8kb+Zu/nymJBPILO7/MgEmhebqXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040192
X-Proofpoint-ORIG-GUID: qOgGXlv0C3zY2RB6HqfP6qd7sfL_9EKz
X-Proofpoint-GUID: qOgGXlv0C3zY2RB6HqfP6qd7sfL_9EKz

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
mappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to map not only arg[N] but
also argN references (the single existing test for USDT arg mapping
verifies that this works), but the SDT machinery depends on argN being
left unchanged!  So we do the mapping in dt_prov_uprobe.c while reshuffling
things into dt_argdesc_t's, and tell the higher layers that no arg mapping
is ever being performed, then do the actual movement of args in the trampoline
by physically reshuffling the arguments.  This seems to work without breaking
SDT on all supported architectures, and is surprisingly simple (at least, it
surprised me: multiple places where I thought I'd need hundreds of lines of
complex code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types change,
when arg counts change, and when there are no args at all, and that dtrace
-vln produces the right output (all previous tests for USDT -vln, translated
or not, are currently disabled because they all use wildcards: this new one
doesn't).

We also add new tests to test that pid/USDT interoperability does not
break arg mapping and USDT args in general (deferred args are coming,
but are trickier to get working).  That's in a separate commit because
it renames and modifies an existing test significantly (it still does the
same thing).

We also fix a tiny error-path-related bug in usdt encountered in the
course of development.

Changes since v4:
  Moved the arg saving into the dt_prov_uprobe trampoline.
  Store the args in one contiguous strtab rather than two distinct
  ones.
  Drop some unnecessary "no xargs, fall back to nargs" code (there are
  always xargs if there are any user-visible args at all, the nargs
  are not user-visible).
  Set up the arguments even if USDT probes with args find that their
  underlying probe is already in place for a pid probe.
  Identify USDT probes reliably and use this to prevent creation of
  multiple USDT probes at the same locus (new DTPPT_USDT probe type:
  DTPPT_OFFSETS is now reserved for pid offset probes).
  Fixed up a few bad comments.
  Added test/unittest/usdt/tst.pid*sh, out of the guts of
  tst.pidprobes.sh, which is renamed and modified to pidprobes.sh and
  called by all three tests.

Changes since v3:
  Rebase against latest dev, adjusting the trampoline: we should now
  handle the overlapping pid and usdt case, though this still being
  verified.
  Eliminate remaining references to 'remapping'.
  Move mis-merged hunk of dt_cg.c changes into the right commit.
  Drop showUSDT arg stuff in favour of Kris's improved version.

Changes since v2:
  Populate dt_argdesc_t's in USDT probe discovery rather than in
  probe_info.

Changes since v1:
  Adapted to review comments (all comments but the stuff around
  trampolines and arg mapping, which I don't understand well
  enough to implement); in particular track xlated args and
  mappings together, and move from a flags word in the
  dof_parser struct's DIT_PROBE record to an arg count

Nick Alcock (5):
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: fix create_underlying error path

*** BLURB HERE ***

Nick Alcock (6):
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: new tests for USDT arg sanity with overlapping pid probes
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  21 +-
 dtprobed/dtprobed.c                           |  10 +-
 include/dtrace/pid.h                          |   8 +
 libcommon/dof_parser.c                        | 150 ++++++---
 libcommon/dof_parser.h                        |  64 +++-
 libdtrace/dt_cg.c                             |  26 ++
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_pid.c                            |  62 +++-
 libdtrace/dt_prov_uprobe.c                    | 187 +++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 +++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++
 test/unittest/usdt/err.argmap-null.d          |  41 +++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   |  54 +++-
 test/unittest/usdt/tst.argmap-null.d          |  32 ++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 test/unittest/usdt/tst.pidargmap.sh           |  11 +
 test/unittest/usdt/tst.pidargs.sh             |  11 +
 test/unittest/usdt/tst.pidprobes.sh           | 284 +-----------------
 25 files changed, 829 insertions(+), 368 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 copy test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (83%)
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

-- 
2.46.0.278.g36e3a12567

