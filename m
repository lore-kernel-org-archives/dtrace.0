Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011631A8F6D
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672050; cv=fail; b=hjLOM0Z2GOBnRToGhXa/LC4a2Lzs4aItFN7ews9/zbN/0j//RMmkb8j7tsTE920uS/UJmUfTpAxGHaQHuEIi2nfLt26k1jWirQTxZKlnpOathRsyxtei53N1om0muyou3gTmhSlg6sC3Qxv5hoXRBX8SdpPkxwp9Ktw9gNwFuME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672050; c=relaxed/simple;
	bh=54h0aAazuNSyctVdL2hRGDUG9NqWYXhdWzQMQ5xx1hM=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=RXk84DflwmjYlF8BYvTgUAvuUcR8aou45pqmLjPcUpCvI+z4tG+V3q4WeVhDq8KUVY/OwuSvmnREwU9nrfbPv9F3GRiZSdqcqQS8Gm+zcpO2fjRgS4zdVlWXQH8i05j/f/2zuhngqnFJBShjLVv7om0lTNfWXKcc+UlbrjxJvBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pjyd2vi9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R3TE8vNW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pjyd2vi9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R3TE8vNW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7g1Uo023894
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DfIpY0WZllhzSNKbdt
	B1CYIvv3bzSnpNNrfTBnlps1M=; b=Pjyd2vi9fGXbFUySNyQ4Rw0vgVdMlYJDFs
	VH305EQDbyTrRY2eT+fBavZCn2OPtVue1nv8VpppQ+bQhBmMXu0xMwL7txdCX/WH
	IQf5cHB3kP6c7zk53CLI5h4TFMwOylOes5FP6VpsgkOGa1z2HzZbQ9hBCHRc/Xi6
	y534eSIP4crQU8yisGimFxdiF4gkC6hanv/b1NU1fymA7IJv1DtkbZB1nqbSeV0L
	bNS+FxcKqnBdmvD+iB6K63RuQca83H9aiI+xCSHUagqC0yUYQiK3L1ywsw+Tjm5c
	ThnWBUFnmMW1ArtGwxBqqW5XBscHmjKNsNS1nNNO9B30m3TmPMPQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujr10t0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:20:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDBNuN013061
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:20:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5aueas-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttp7aQo3+k4RWbBpGAV1TAE1CVRgUK2D+4TGdGHx2EkO0/k0Sj8zSL5P9cWyCI+Zr3nLwxlMjzoyBGc7OrewrbPmNbcbWPXFE0BsjyyKoJAoG0vigUYPhbVEKLmYq1TKPlm5Cc63QeR0LUn4WiCsPFAaiktHviLhn2vaJKZ6Fls/quJGwLyEaU8RxRKODCoVAsYPoGunIEDVYyV26wZS7g+S3rUvxM8cbvMoegJpoRXhJKZWmvbBRlf0hlrJt1jSdsfCiB0Qw9ktELTcKStoArvRsQmxvzgvPlh+XPgo/PqbsuxSbd+XQjVC8bum1rWFmSPUJLDf/wBy0iwCxb0j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfIpY0WZllhzSNKbdtB1CYIvv3bzSnpNNrfTBnlps1M=;
 b=njd54yimTHaSzGwj2Mnf5jWk4ltk/qKGqZaqON897bqes3zhHCRbSIaZBICDxXFF5qBtYCO7x67+xRqe6ClageKLUtq9fTEJVABltM/mkkpJYEX5BZgNqkA6CMV3DCNWxMfpChdghwKdf0rGo2Y2G9fPmUxFLdOjjLhzy8YNG1rBD31T4gjffIV86PBm2uat5b3QKJZct07wX6QgLzOuhiHDS7tZJsCxbysx3QwDgopozqVFMUCArVEpNUvV/T6/njrsWLRZuJE+rAiscQWXXAdr8WIdDNhhWm+fR+YEVeKkwz2ezQy+r2/HNA/q+9I2JgJ/lLG1QvGqbql53QWpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfIpY0WZllhzSNKbdtB1CYIvv3bzSnpNNrfTBnlps1M=;
 b=R3TE8vNWWpt//+b7OSSJVE2hl9PfCTaJM+F2UON4HxeYKDBEvovRCr8F5mji/BtECcynYcmlobW08kafGS1W8Pz9+05iCbopxjc0kl7/eiCh8q2ELYgwwy236KTCXjF5Niinls1iNNkukO+AQqHCqztvR32rod9LvOe7Y9QUXGI=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by SA1PR10MB6592.namprd10.prod.outlook.com (2603:10b6:806:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 13:20:42 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 13:20:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: <eugene.loh@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [DTrace-devel] [PATCH 1/3] Cache per-CPU agg map IDs
References: <20250501182252.27772-1-eugene.loh@oracle.com>
Emacs: don't try this at home, kids!
Date: Wed, 16 Jul 2025 14:20:40 +0100
In-Reply-To: <20250501182252.27772-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 1 May 2025 14:22:50 -0400")
Message-ID: <87v7nsmfvb.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::6) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|SA1PR10MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2613627e-fe1a-4560-4f57-08ddc46b9087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K7SMwF0k1R1CdD2tl5TAjhMv5zMYiCNWf0HaXkCJ6l6qVvk6MDlAtDyILM2a?=
 =?us-ascii?Q?WWpGg/jW+B8MA4RDc+i/BABsUzFkqjLyzerUHGfcbWK94Ju0y90H9f9abkcC?=
 =?us-ascii?Q?NU8SSoHsM/VFDnIFMugFtxZ6qgKZ5Hzymvk445wcg6z34MUrvXVRKGast4Bs?=
 =?us-ascii?Q?H1vQJGc2nS5ym/r+Pe0cRXF4kkFmbcHZQl0V49IyM8cE4LwaN4jwwPorE60D?=
 =?us-ascii?Q?1FyEcekbyvlkdcEKIFidDqCT26bc2WtYDQpws6JkLiqAWQWH19RTxKBfNx6j?=
 =?us-ascii?Q?CEcKo3Iuh1UMCW16uALG6HlX+1POxC7vTyZ8TXl/qDxKyANKI0BUQucteEBe?=
 =?us-ascii?Q?hWIu0N5tNFztnm4mjPuCA2c2sspP9eJcUFEv87gBXESGeKVVr+3U6tWQrHBB?=
 =?us-ascii?Q?DikvpwqrBT+WbKX+K+7qHwuhXBpZ3ZnH9xnbBnM3pDCJiBfulyt5wR9SA0FN?=
 =?us-ascii?Q?D3vsk3k9Orht93gAMSkfSkD3tccugS7CdIOpPT2pVdTA4QmGfqYVI30ecXUJ?=
 =?us-ascii?Q?YS2g6DBNJVD5oyF3hyXgdyqpeSR1oyYBXWAUQm9TYC7NeR9v96KhDpt9laLB?=
 =?us-ascii?Q?5Yr7oouEnkTUIirSAPB3218bPuIQQHAvOMuOh+L0UxpJm8eTOvHw6Ew3PHAS?=
 =?us-ascii?Q?s2HZFW4jleuY4DJ0uaae90tll6kWB6s53z5JOGRkN+uJKMCT4LPmu/QlMJc5?=
 =?us-ascii?Q?WpTHYkGGGDVAwq6f4STIKZQeIbH+/0JXSr7/r/pXSaTGOHMOlYmvwh77Mt6I?=
 =?us-ascii?Q?jURtENnMj6fikDYIazBNtwShQfgrhll20JU5dkEeKw+5vtsjCKVv5xU8OqvL?=
 =?us-ascii?Q?zrZJCs+b/UX3XCtz5w/yHCc+KQh4tLXS88x51pmuQQOFBWtfY/9Gvogy8sk9?=
 =?us-ascii?Q?Viw7Tkh0ARrMdgviTKn8A4DnAGnxO72xKg2TIrTGcTcCxNNvfy6K8ThRal8L?=
 =?us-ascii?Q?9tARfhphLGLACzWsWazUaAtQ7FkU2vVnoxg5RW8ZaCEk+M033jtj+WVUmVEo?=
 =?us-ascii?Q?8Z5TJBaqGnsa/xvP9OxM6dzru8utns5m0ZV31t3PqK0RCMrv6gAnGMm4273d?=
 =?us-ascii?Q?7sttnMr2gdSm+rfsDrkG7u2NcTNFTohgFNG7K7sC/SkXLEO+zWJXK8ExCBwN?=
 =?us-ascii?Q?phKcHV/O+bKp4HPnORsUAGYOTOCLTOD7aOmk7j+tEqU8ehWrsGvvxdd2HfJc?=
 =?us-ascii?Q?upjAPZ/JU3G1NNhUUB6rF1uUE9glzQENJC3NJqiwjrGNxSo+c1MCz7sB/+ss?=
 =?us-ascii?Q?TcELILlijR5DuWrQpJh/GYkjwjx6VsbWLF3bZpLpvWBM2fuZMioqNE7iwcZ0?=
 =?us-ascii?Q?9gH3Z/mm6Aw+zTi83Sjle+1A2G0r7VvJ+eghCwKFoTqqLgE1t7TL5vkMNerf?=
 =?us-ascii?Q?ZCiPWv5DwupQcCvhIvfLoHhAYmnhISzEgUvdCsc9XfLLPKIzxL4b9u/wUrrK?=
 =?us-ascii?Q?z3Ji9IRQqwM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vzwPqrwGrO5jJpj/tUjq3LxIeLkjTNpNiSp0J9dY6hevYYugGPQHVbV/9XAe?=
 =?us-ascii?Q?ufVlZk/F1BaYT0AK1+a70zAuWIB2QkwhBuCTe/d7uqhpf9fZaeBC1TrLAYIL?=
 =?us-ascii?Q?VrM4qwKa8GducRGHFu6x5jXIk4YU6JMXZigTiLU8YzY3vH8GtSRFU5iZr0yi?=
 =?us-ascii?Q?VUXki6aWwqSHrhVWzJOUytZMVSexphKg9CZs56k0fsY824nJiQ2spjfguY9P?=
 =?us-ascii?Q?JMAFki0xPoYwmHzHn//d0jqh72+w10+jcwiTlvBh/y/Z05ZnqyEoEjMNl9aR?=
 =?us-ascii?Q?046pdo4I8VU47zAXjLDgm68w5Xuqk7V9V2Az9wn5zse27TdnuqYeRoYv4em2?=
 =?us-ascii?Q?j1EDd+VWnvkPBs93upyUtxKn5ptsCm8V0Iu3lQc7ui9nkQ+bU+J+aa43mfxk?=
 =?us-ascii?Q?wEJ/Tgs8nuTtbF9diYW8HKCuv5L4ngyTQYJ6P2h4hzobijolw9ye8sidgmKl?=
 =?us-ascii?Q?+nWlXF9R4Hz/BYcVLotrUSwZ8pssGrr8tMJAXI0Q5Tvbx+owPexVeMRmcA+J?=
 =?us-ascii?Q?PrZVUXonb84MlSeIfmEueRbOqkkrdlBBzXHYExZgPIdwkSdkMBXy+BgeCTfT?=
 =?us-ascii?Q?V/yesa8pVYo/U5sGBfR0CpPKOA5KCX+nxiYG2qyy0gQTP8+hLbWcVm101Z23?=
 =?us-ascii?Q?Zg2XTHCapURRgA61LKG24DC7SGFckaZsahoMF4ieXaaVWyldfvebUeO3ghDL?=
 =?us-ascii?Q?7HrysaAK8vBPUY2MivrZcnawn94H3P6kWL9+HCN978imVpJBaUTwasKyGW2J?=
 =?us-ascii?Q?099Rxr71aZWq3ciiZC/TS7TVNAsw/pUYUXvtZ0IHSLk8PUPX2yfn91dAYpK4?=
 =?us-ascii?Q?49WErdA2NF1CrbM8+zyW4PN8fcpFE3K3/eRgItMQK8NB2gZYHqAzW3RWf9O3?=
 =?us-ascii?Q?Ruu1JN9YEJgWdeyzJAAGTSalboqVgKvF654HazCF1uRxNdSGT6O0DJ3UBTQb?=
 =?us-ascii?Q?5f/Rq7wtEdQuQ/6+mz7pY9csy4JPeA6FO01JS8q7dnN4Y5vkd10HHzyLo/MZ?=
 =?us-ascii?Q?FmMzmtPEhO2Jr4lgK7Wx+s6I1NgWhe9p+GZv7WzaoidbadZrNpP0nnVpmuFz?=
 =?us-ascii?Q?XK8Fp0wqXGy/SG+VVto3HXhfYQd6xgcCBwfg1rXkO7whG+wiuhCpJAKgzEsR?=
 =?us-ascii?Q?PF8uhk8U6AKKuEfTBOSlNM5bCWAmEUqyXZkmjhmqO2zklEVlqIsfNjg5xwAb?=
 =?us-ascii?Q?IBUBVGt+7gXJDE5SVSRRuevT6UI4ByQJze2JL6SI6Ujy0hvRw0ShbAttK/xV?=
 =?us-ascii?Q?Th1Ep8zkS5Ku4H+82uX27sBzOH54XxjtWmlZginrolDEnggO35BEn1QezyfF?=
 =?us-ascii?Q?3yT0VRrXC2z1L/LaFSiJqLAbLf2dZOZBBROLw19Z/F4EtZ/ZBviPJJmAYgQk?=
 =?us-ascii?Q?ZFDaCGGN4G/xh9bDP7CnajQnrq0gBNSd2B78e/a+q4741LEny64w+C9mpJgK?=
 =?us-ascii?Q?mjXoj9nJO0EiQWCBVj9UlfLuj2mOlSG62sedlHaUEh3+hjQHxvsnxndDZLuz?=
 =?us-ascii?Q?QaRLwVUSGilHbPz/P5k0KOCHQxStBMGOnH98Xa4oTgOmo8EmTes2r0moSbTn?=
 =?us-ascii?Q?SmglLvNkCeE5xvkampOk6C3Y1N9d5kUMxybRDpRGQ7piYYeUuw3BcloO0bLg?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YFIM/K/YFxrxtLvRq9wL2RU9QHXJKgAhe3aQdF37EcyVmVwNFfjywq/VuH5VLEJFIkjws3uSVA84HFQuOSeQIBxbMVcpET5lXayydp3UIawJ7rvZagkvt4ldLz0a4dL1gN64Vt4HkU2Lt/fb8vGxe/7d8waguZaniM2x8W6xPhLVnPlAQ1O08xb30ppKzVb0ItoUSZY0WLjDYxP5w6AqM/Q1ptzqVysSfyx6kO+iuUzPzsc2VTcQARP32/6uBTSmMMSoKlhWs1MUW4FQP0RIv1lICuNqZCVCDjam5zpdT7cDzTnizJVhj+9+pRQEPAjWRmb38rITNz9G1buxX284DJkNEZGcE+cgsElGKH1EIXMqTl301JVuro14J26j4jmg5uUOutLhF2Pj2oqWBDWdk663VNek6hGrwgK2JSUsw9wrDuaxdGA7gq7gYsQGwy9T++xoldLY8FHX30ng1Fpusffam2Ssbphl/48ZviVeUVdIpbAMUBJfjUE6COiToYVLxEn2tE42gNT21Uu//GqZlb6Ob4G2tnRgAzZjuDBeV6iJSYgw0XljUxPMgj4d66ZezZEE2BTz5cD9hqDNs3XBZPYIdwryv4AQ0hW6PVdFgn0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2613627e-fe1a-4560-4f57-08ddc46b9087
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:20:42.7665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf1pqbjloIGVB79lOntdsFgD6Q2qJ1DiC94fWFsHkMMasy9OeYk5n9I1Nqpllg43sEBpdwWbpq+lNOkdRJfxFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160119
X-Authority-Analysis: v=2.4 cv=d9T1yQjE c=1 sm=1 tr=0 ts=6877a72f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=vEpUksjfCpjYV03ekIQA:9 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: Y73iRQlOFQj83LmSW3EUFc1p-FQ93cSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDExOSBTYWx0ZWRfXxSACdHw6uIzW 7T/Ht4rL4/+ENlDNZAJU6iq3M17RbCZyABkbOV6kKfQZBJFAu2ScArWz99nUD+Wf2UUjD8SkF5e ZW9aEYA8JBG6sbmyKj97iEHotSA2xH8w6dSFRPJImwmeDP3u1bDIdCKbz5bdZKQTirUyvUgUhJX
 +YVBuJaZjfwT3QvG1BCTprAjykb/0oB7QeQKf83NAwUMbWE3QIS2WImsxWFDICRG8lHKxXEwH5P AA9wRr8Esy4MbYEh5WOHzGLb9JAJPYYCl8TbZiRet1vJBwR2TO5uffkroUYdMHhTUEnr3SM2MrO qOinWawLcM5xoqOICrjdDd+LZJXTPBdjpORkAJLl8WMtoz/mu8IZcow92PyCGrR6fX5iMm/UNeG
 Csl2vNnmIFwiSPHryPCM9cSaJVj0mS7Qx5fkQshx7BLM2K8V/5E1W39RZ0k2qpl+AfDLgdVS
X-Proofpoint-GUID: Y73iRQlOFQj83LmSW3EUFc1p-FQ93cSf

On 1 May 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu) call that is used to
> snap or truncate aggregations takes a few milliseconds, which seems all
> right.  For large systems (e.g., 100 CPUs) and many truncations (e.g.,
> tst.trunc.d, etc.), however, a trunc() might end up costing a minute on
> the consumer side, which is unreasonable and causes such tests to time
> out.  The run time is due almost exclusively to looking up the per-CPU
> agg map ID.

... how on earth did you figure this out? Some sort of profiler,
presumably...

> Cache the per-CPU agg map IDs.

LGTM, doing the slow operation only once rather than once per snap seems
sensible. (If this turns out to slow down the no-aggs case too much,
we could always populate the map just once on the first call to
dtrace_aggregate_snap() and dt_aggwalk_remove(). But presumably just one
operation is fast enough.)

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(as long as Kris is happy with this probably-theoretical slowdown.)

-- 
NULL && (void)
