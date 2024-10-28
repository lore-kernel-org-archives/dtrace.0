Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF71E0B87
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150328; cv=fail; b=hzce0N2j8esBGg3NUPcytcjbNbRxjvHw/uZlaaq1ncZazJ9F4b1hASaY8p8HexyLmtIZI+SA2hw5NEfonzGwceZx737B+zBGwULOuj8YleNowxK0OWGq58hs5qkvhEpmFSqIXSeGF0JN6XaPSNz88t80jc5RJrfFQNKlJ3Vc5zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150328; c=relaxed/simple;
	bh=2is5JtR0bkzGFX/KeJ+YI5VOfkme7dF7xDieV/1wbJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KlRoEMqdOUcCb1wDm2iYGhcNqAmkXSu6sSHfTS0f7cJPkBeu8m+gyVOZQbNv7F6oz8dTwNQjy24gIQYlaQzu0RDCPC1gdjm3CaZX20OIqjhuBYCyMYebQ2yuqn0Y0SM7HEhxjGKzEBFuV2CxxgOB1VLp/rVmtWUqYznqMEYu+sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z3+V0RPL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VX/1Ktrh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z3+V0RPL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VX/1Ktrh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaGb024346;
	Mon, 28 Oct 2024 21:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=f6w8AkKEp2y0SW52QmiUqPrMmGXb6VZeLwRN78vUTcA=; b=
	Z3+V0RPLrOIjsD0JB5dEeN5Iut07l1Qt7E85EEi8tzrh4E2zm9jqOdF8gTy+myFF
	LtHQ0sA4lvqY+mxykL78mi0yh5zM0JGg9X7YMAnPnhZhQRz/2U1iD9kD0QYsluMz
	2/q5uybCf/UWL5HntMBGxXLBx9HCX2O/zg4jrJ2rqsjnua4g8EbdrT8LxjwHqx2d
	QdopQVP+eJIbpVaM18pb7/eT2apXudFJ3Lqno+9l9COm98UkLlb1l404z6ip4cPu
	rF9sy/rhilEnEpkGgSzLOac53G65zRMNyJLvqh0oSEV11NPD6E75w50OeHiuXwDC
	1Y40j8iF6Fk1UR3vrrJ5kA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqby7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SL1TAJ011760;
	Mon, 28 Oct 2024 21:18:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnabe7tb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gokrFLwof/oviHOVbBhKOCNH4UlPPa1c0M6QDpg7xwWjs9CdF1MUac03UDMNsD68W0ZtiZIBBrFirCV6DWBF50zk2uSJPvJP32UjQm1pLe2JFOcmmyD3lhJasH0FYnXPvNxO2z2BDg5cKlJhHLlpfL76gneV5K31r6DdCVYywO6nmw49ft9OSfdX+zHPMfg7DjIcVN9rs3HrDsuZznDZY6PvqQQ9SzxuxpP+NMuHPoGIv39bcWg1IH9KCrmFa0TJV/WzjcVLMyFYP/e4Dtrx0p7Z1SiJ5KvqCyc3HJP4jomvHe7nolwbpUcUIpore69aDQ5coqyoQyJTv9MxS+pHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6w8AkKEp2y0SW52QmiUqPrMmGXb6VZeLwRN78vUTcA=;
 b=gba6inx+AqqMo0Mw2E0I0OoMnO6T/O9nzGObISSCk7olGYQ3f1FQUBG5OX9TW4FNpZc22ZYxvXqrsxS/wyIacG9bYnRnS9mP7+RLa+S7v6hGVByS6qUo3Q3OX60BO290CqsrHMgd5DI6603+Q5r0QgXdko6chKYTiqGMkyGS8FQ3esiwzSv2YjAu7GYs+LpQ9NZ2NF54djrqoo9I2z1tw+sxbvEFNBATzW3L6F8ho0LCQcAq0jAyBOHsapZmufRKzQqpyaZkAaUVXu10yi27cip+1TgKdetYwCZf3nLQXNx9zhUexlfQuUCmGFKZ2/PmVuKk4QSCmkSFVYKVj4ntbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6w8AkKEp2y0SW52QmiUqPrMmGXb6VZeLwRN78vUTcA=;
 b=VX/1KtrhyVp/x3rFj3MUfJONdM5GEFnuLo+XON14k7kgo2YOKfOwvy724R8UoCTJmox/nHATAvOEsJqdXhBH9IcV3GeKad1xVNHNzqsrRTvUfRU3slqJdmSwyBEEDbZx9BVmaGJRXLrLpUW4R6bmhKKq561hshGYgZinXx3zDwk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:35 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 13/14] man: drop double-\fB at the start of every option line
Date: Mon, 28 Oct 2024 21:18:02 +0000
Message-ID: <20241028211803.458685-14-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e60a09-ddc7-4c56-8bf9-08dcf7961543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?46GiPRnUP2Xtg1GAJqNT70ANU3yVL27H/5efXaK8Q8dd//cMwDYPS3mcReeZ?=
 =?us-ascii?Q?YqazBfqgtfuI7wi7m/1y3OVBhBrBCPc4CrWZ175T8MCGnE/IAdS52dh0+QY4?=
 =?us-ascii?Q?5QSMN6/zOcBHc9dqshaWWYfWIPfZ/WL//Z6NjEHDNPFWnklP4EX0zoBxmvqZ?=
 =?us-ascii?Q?q5SIeXmMombd1yaIj6O7yQdWwjx4oZBCSMRWA/3ItTNeCA/GpsjF+vrUNwUx?=
 =?us-ascii?Q?/G63rwkFGxLGmn+X3GiX0UBANyUT6cRMZqpyALI+POXvS4sajpubqrm8OQ0/?=
 =?us-ascii?Q?xOPvRPs+xeHeWLW04d0ROSCxulFntPRp+8DHEKQWwvtgxtyor1brGHOdDBth?=
 =?us-ascii?Q?XjvXWZclDQNmMLtHJdx/fesfpPi2IPDSXUYKC/oEGdJ9vGfV6fWstX404ugf?=
 =?us-ascii?Q?nQsdHE37QLF4OGzOAyIYkHcHbv6x28nbfdf2kJEPZKWCq4c1jD6Zf7B0GKpJ?=
 =?us-ascii?Q?nV1s5xAgH7yQ1AbFDoJjvpoYS4Cteovbw7y38y/UXrP7uy0jTM3JC2rIPpTb?=
 =?us-ascii?Q?IFqGiq1RmspINdDPFF/RfBmZ7htM2GZsf5Va09n0fb+rLUzqlfklElTIt/5Z?=
 =?us-ascii?Q?S0Okrlq5+Xy7o6HW+rmjqtapUUyADkV3X6v09GyLEsDKafrgsK4ZjqYaRKHi?=
 =?us-ascii?Q?TqAuTZvDCXYxCryp7cHecK/sPl1chi1G+/ulNp1ltP62JmKufp3TPZjLyNgc?=
 =?us-ascii?Q?SnaBXXccW/wC2e4dwixwNXJ6NlBYmaZF8DoqKTqGUNI8QiVGQroO5cEHVi5X?=
 =?us-ascii?Q?Uy5pMucxES8rzQd5ZUj432IcMGrpECyiBW1wL4PViiYEM5pFy8xxumWFryuo?=
 =?us-ascii?Q?iLb5W0f3+z+aTEfo3I13cnmPlMQmqmqQ6EF60656CT2f5+F6YBpUhAAIt41C?=
 =?us-ascii?Q?+CklGCOumJWZ/PfE2dpqMwsxOS7Icngs2TJKUk3WOQ/fs/G6VBFA9/RIGilX?=
 =?us-ascii?Q?ufY40LAZ5cJF4YH7QX/+cbVBjp3SamfEk9azC2hAfs7ViIAQxKyvP97Ce/Vl?=
 =?us-ascii?Q?8i7AtSpZY7VsVeYIjAKzc06zCwYKt+xgFZIqhLSW89nEgPf0aPB9EVhZQ8R0?=
 =?us-ascii?Q?qjlKNXAekW0lf+uIPdMcWhB7W/aoC55rMWpcdRuKEeYLWUGTM5esKu0QPrUm?=
 =?us-ascii?Q?avOmLyBwpgnGb/Cqd6/tn8p/ANIA6Nxut2vFDI7hpe87t9UkQEqE2Ar3g0pI?=
 =?us-ascii?Q?KJdDa5zB/oG5VeB+aAEHp0nuVfCSbUDM+duXOpBUW3mI0ItjOXnIbvodZ2Sj?=
 =?us-ascii?Q?4N6U77muw5D1ttSdgRmOmBzhTD43OeOCZSp9a4yDThUbDKmn8KFwHhkkrO7b?=
 =?us-ascii?Q?7Jtq9zG5yQqToC/apVZ6CzCj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bt1AM6TgvD9HyBCFNqBH90IGmPKwUYg5TpoUO5BP7i88NHzBmNnes7DjpV3U?=
 =?us-ascii?Q?f/zGL527UcjLEDvRl03tuBs1P0KD8XKEDwFSMFPlhzinTieNslPs1G7+ve3a?=
 =?us-ascii?Q?euvB+4uqsVOevKwqNzVns6s+Rhb7tHGkIrgzW1zg9IB8aP/cX5FSong7V4fE?=
 =?us-ascii?Q?GfiC1MLo5L5qFCCWKDP0Mv6TzmYwIsH7dC4no9LbcSZ2h8Y6XJ52XW7Ju17p?=
 =?us-ascii?Q?p+L0eBz12r+hW5ixandi3w3tTXfZT+xEgxUI7JGMig0R1NDUXfWURhs6GW8Q?=
 =?us-ascii?Q?e/gwKm7SDKV0+jK+F2YFIP3+SI1IWdkWtYxLub0zmiEjOsaZEm65zwm8xknm?=
 =?us-ascii?Q?ZiJ5irle6F68zdI/eyP5HVgKgErg1JA/LdvktF0W7fkah/F4kdd7xJfMRdHx?=
 =?us-ascii?Q?RQ8HvsWz4h5csr11D7pPH0Be5R5L3io70Msk4okxo9uqzUHc2e2+IIbNWgPC?=
 =?us-ascii?Q?bymV2VSKI6ak16rPQlrozp9vr0X0ICJ2PCDGKKMmu9MBDSQgfw7qEJwGJrEv?=
 =?us-ascii?Q?kzjYMkUdb61fZzqPyj+HkPfQU7m5EvWcEY704LEy8znyQfD4B+B471Sc0jRo?=
 =?us-ascii?Q?n01vM5dSduswhNXjsPO4MLZZdfQR4xwOF045o/LZBIPJWtL1j1ASbToklAap?=
 =?us-ascii?Q?NJmD91FG5MGAJdty6NSFgtj0J1mPB8r9QHsQvJBYU1HvRrKLprk+EPLEOwVD?=
 =?us-ascii?Q?mQUQYbYC6DWe97+OEMz2MZXiJRSrC8NEikgJ5taXF33xCMe9cifDMmgE1Syt?=
 =?us-ascii?Q?W+uIoT933pMAljT9WGCbO0y9zpRC2EJCnv5HFKs+mSXuMLNTORV3A3aYlP5b?=
 =?us-ascii?Q?Bc/l+XSmhh6AB+pyxElDoRUEtJ8zzqSskmK9wKduXM2LC35ucU+p3v43+ZPV?=
 =?us-ascii?Q?weoBaFBMS9U2IJux5MekIvwQN8StUN/dyVFSZ5gmf8YAzS8+zMX515n9UafI?=
 =?us-ascii?Q?kQLLokpEat6YjgbQY/4RD9xHBZYxQ052cyRoUeJj7YDOLnzb7UMrAXHRTUAs?=
 =?us-ascii?Q?fnV43PPu4CCL1Lu7zqlnS32adbf8+HOUVLW3sO5hu3QN+dZrblVsZClru9sP?=
 =?us-ascii?Q?/cc39rzcKJw20kitOcitdpFmv2tDqAe++rwtorxB67Ogx3kxaLR/Ovrw5Ocu?=
 =?us-ascii?Q?JItb+zvz6A8AZUHMUwS+vn3gnOu01WlsQ4vo0G+8e0x8Q2g/NyE0tZ9IkKqQ?=
 =?us-ascii?Q?D5qswDsE1MkuIGSeVGd9Tt95S+GdvbfA3Dy35I6cKKCdk37vSLhtCrt3CDeq?=
 =?us-ascii?Q?N1Faifiv0Utz61T0RU+rzYz++M95BLNHx97EtZsnpHfjzu2c/h7SB02e99Kp?=
 =?us-ascii?Q?p+BxuWinmEDRdM+vN40UFgcrpKzk8iKK5W2+tKQsrlbWsJ59xwWL6zNSxyzs?=
 =?us-ascii?Q?WtzndNCohZzyhA7WSMV568iO6OTa1C6/za4Mh7wtBOfLCVVGKKV19NDK1nr1?=
 =?us-ascii?Q?8h2Tboshy99L80q66lvfJNutw6jFnMT0eoU4ou+u5VDVZldo40fCp8PHfLJ4?=
 =?us-ascii?Q?Ry+k84bxJrW4J627G4wiAmw2ao2RgYJwuBIVlrXelUjwm7fx33MA4ff49QI/?=
 =?us-ascii?Q?NtMHcaJjLI7GfhLG4V1d1cPg4ASwB9q424EV7AVRd914J0Q2LGq5AnJ5fB2P?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bq2bDLsMp0CZa6mvnjS9wkz7EO99BYGdaiinlrwmYsjUugfjc0GPGcmM8jTUpFzgQRfGXLnN2SeYpD52PdsbjIxY/1GHhN4sXFpcPyus7KWf86rdxAg+gg8Gw3caoZBkYIgDnDAeMN9D3v8yjRQWoUi4kogWw0Y/QJCHBTOl/lXj89ZU+SkHRilwNNzITETJJd7wEGRu9v4eYCG9B3oBUhATJXIe/4OamX+IIQaKrT+sG3AmhzpHwuRlIWRAjJgahFCDBSnLXeb1dcXDep9zch1ATIt6UukZWaMBzse88ykgp4eKezJASGltGn2p7o31p6elfdOkXP2IXBJEl0M85JTPQLkeYM3DB/G7P6lR4tZSYRICwkOAlC92GIVQU98jyte60qPHVdhngYGjnA9ZBJC8UHO3F2+DTvC8AWXbyotEcnR+gI4PgFLBBP3eo4xBO+sx2/tpBnKoMTO5n8+3gU6spXN8brlVerdVWOKBZqIBz7Mzik+PR8Yz/X1nPQwC8PSzbL5tRU5QT0HTFNdDaQNt1OJkPMhY/gVxWEzWkbAcWAdohwHzgr1YS7R2zUdN2PYVvh9CLyxbCfZf6tNmg9dNoeTwPwuEZzRHUyAEgzU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e60a09-ddc7-4c56-8bf9-08dcf7961543
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:35.4775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/SIzx4XgsLm5FcRD2xY6ywEbVWKzGCR8LB+/ig26FH9s5bxdDq0z5wklv6pCJfmmWRLve7nCZq7H74W4WFATQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: S_0evc3vG2LXnr6QyTX5ioZFNYMgBBaT
X-Proofpoint-ORIG-GUID: S_0evc3vG2LXnr6QyTX5ioZFNYMgBBaT

All this does is stops \fP (which goes back to the previous font)
from working.  (The manpage looks fine afterwards, both on
the terminal and typeset.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
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

