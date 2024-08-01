Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B82B183CC5
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518569; cv=fail; b=AmXkFhioJnZZ8mr2NgpnK6ACvwYBjwk0jyE2+ibpNd9n5rMQ/jjOe6wV3Ep/BichNW/v/Exsr3RKCflbyXDD/0nQA2WK9FDvFphbpz7OsfsJeXq2TQa15K32h2pgeXGUxLYURgFVeFEaN/SmRb6CEhxIJyBgMs49Lv2QjctxVpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518569; c=relaxed/simple;
	bh=DZFjaJ0KpB2h0ZQy3ojwg2eA/VgqDt2j3BKz/Zw3IFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oom1qEhhtHAc9iMyKE1NiOiNH0DUz5T0WFLCMnniCXQ1GVN/J5EHh5zhQspnUbD0j96gcb9BKqnB3u7ouXn2BCnEHfUXjSuWiATukf2ogaig7WSQD2Nqadc7gikQzzLiQDxB0FxKFryUhNio7KXQhdD/Fy2CrW0ditRCGMXqLAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L2wxKF8q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YXci8AXD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L2wxKF8q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YXci8AXD"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tsBZ027526
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=3TKA/P164wKbdYhi/cDYVSSTSqvKkgxUSsQWRNFah9E=; b=
	L2wxKF8q2ELRKYmtJL9bYCLAOABdis+brHvle982yP1NOL5gm4k8CNy4ECoPXHEN
	j7nUHO1wSDcdfzTR452nOfBr6odJa4/L9ay89ZKU4VHTnQ1fyNyqC3bsk2NCFSas
	4d9s78ztmRBATVpcy7fa/NPAxFKMDd705e4lnT94rH2oWV7wZAICPsaGgXPW2msK
	Hg6cFYDXY+lmP/tzWPyZGTWudmTvoQL381bBFHXynhSYSdE06I3aJFJBhm14BBrU
	nvOIUhGVqTvak/kP7Y9uI2BPF1EoEExJs2HWV9tc2EHqaaTVaApg4StJajP7Svg1
	erHT1uPpC42LGwjrhDMhxA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrxc1vtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471CIhlh031032
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehvubnc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbmSo3Aq93k8N8JCz+nZ2kNAbm4QUm19F76ZkE/9RpymLKsnSvX1lDA0GI4K3pQUvzQq0P6LFUt4cdEikwXEhlWWqkGf8OYREtd9Mb9+hvM4PlnsXJIKYc5Tbm8kKJhkLn2w3YpG5kIfY7h5Z8IhtgDkbOsOfY41CP0Wq4cAtcqQgfv8ZOc7aA/aeAXfY7K5b0o+PZil6UO27gkMyfR1OF+9JdDakj1qWnP/a0GaJ3AYwEHYPp8QDb58j3eqOy5N4k/ojU6v0YGfAR389iXbybZv6ABf3/DyQLmdz/h2qv98yHY4zuGir/UC9JRMMhMQpB5ROgcfvJNiu4RYcLgFow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TKA/P164wKbdYhi/cDYVSSTSqvKkgxUSsQWRNFah9E=;
 b=InTHRiR0fyZ4GBzEhI6FXSf90bmnx35mpJry9f1WBsRil4n4jxArYV+dTHm0qoAL2t1waIbfehgdePHWLRKNUgzt4LEdZ2mVwdxK2gXsD1IPhHps6WZ29X3zO8QAGDn9cVLoYhDwUEuZVzMipRykYdUI37atXZg/gRJQfqmAa/gFR3n0TeCAkPxH+tnrTnx7r0fa8S/equ6jpUkLVkjbsxDUYRHkPWVuiLZnD9EVtvJCSb/hrqjxhbMZ5uMrGxf/YptQIPVbur8HP3Z0Uq5zxczrb97At1QXCLnnk+lhmzLjM3jASG4LH3vzp3uSD9XQpKoL+1cjN6ByhzjK0RPeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TKA/P164wKbdYhi/cDYVSSTSqvKkgxUSsQWRNFah9E=;
 b=YXci8AXDXa1ttBoDPaMk2/GNA95xx4fNWiZOXilpJRSDAWFZ3Pq6U6KaUgqJ4YKXEqLVSBOckBQWgTjnvJjuEYNnTH/V5ErcLK1EkwBvXfyouQ2y5v0ld3XmoEcKgMin9hY40/pf2MlAjYItMZWrJpLxUqvdzmXeXEaJWE32S9o=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:43 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 5/9] build: the TESTDIR is relative to the LIBDIR by default
Date: Thu,  1 Aug 2024 14:21:52 +0100
Message-ID: <20240801132156.286780-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0141.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::20) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f72507b-bdcd-41cc-55d1-08dcb22d0663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbD/Zgn07wTEr2+aBzzs6LGCgBpzp9PbBf1+Ts6pajHCprlunevV+b17unpX?=
 =?us-ascii?Q?4nvIO1X/LyobRQs8xvRcLS4iJsMPEropXWpWu6tWKB7aCtAKehhCo37uVT2F?=
 =?us-ascii?Q?wfhm85u8eAcpW87Y5dwrX979bE+8HugxjPXxZdKmvA/8B3cxtckKQWzd4twN?=
 =?us-ascii?Q?qDqQ6FLxe1WSipF0yNFU87qzCgovJrPtmN4JZHxM0VjfmPI7NYnRmaxDyZo3?=
 =?us-ascii?Q?/WybKhOZbBlZuZGqdM147VFZQ8Fie8uFU88bnCpNOAMwkMqLjQB+kpX6SB5r?=
 =?us-ascii?Q?Tq0EtaRTSKBDnjot8XCPZR9n8nViFNvWJxrd1Kt0YivBQaAZwVo17BJerR8b?=
 =?us-ascii?Q?jJ1QFKBerqNZH1DJ5PZQF7VhiQoXxAipDqBvgPSROih5Z9DHyjQ3LaB9dKJ8?=
 =?us-ascii?Q?ob5Vbf7kGIpLzCVLLAj8ics+FRxGj1negdpkS8DQCgMJc/kHWjTA42dNe1rG?=
 =?us-ascii?Q?PYl7s0wA/6ZeJRxszz5N0B6EVAvi0RGSQw+xKBETMrnzDan2NDPesEuaxUVF?=
 =?us-ascii?Q?6FYXFU7UGoWR9IxrtZpFkFMV+gtF0pmqUDMnUbxbZ6qJYgrAMQfLd7HT+LXB?=
 =?us-ascii?Q?Y7HaV4FtciqtJS7k1a0NGLzY2wGMQZaGpkXbY01N7CBYrs97WIPwO8tsK1bq?=
 =?us-ascii?Q?fokwKNf4S/GEY/vsEJeLp4vH8ZJkbdiFqqeCcfTSO7AQ6ad4HLaDBKYZwG8/?=
 =?us-ascii?Q?MVPaDZ8w3vxAag60xqiP63OzeVl/dgUV6NMBLgDH0xagvPcfAU09mxZdIoUp?=
 =?us-ascii?Q?TFxTcHbRfCx1MxO2tfsEQe/R0fe+Fbxu+fVs3eG9ncINUoImWgE89DBzWXSj?=
 =?us-ascii?Q?DPDz/09zlU94XKyiSLa/glRNi22C/rdDYG5P+iU0E8mtblc0zb05NZg5+eg6?=
 =?us-ascii?Q?uNcMzi6DpjPA2/Zt+abO+yzFZfCMy1jxQ8IaH+FxLHZpc92saxVArR8f4wIQ?=
 =?us-ascii?Q?dxRTojBqvTSorXDp3jh4hRPkFbiSbAVo/VFMZmEPpLnvxtsIj0OFnAHgCldn?=
 =?us-ascii?Q?8raOaD+7ur8pkZYNkdhhIvhYUH0nVZElsz+I7gOzZqbIcatsXDN9R1J1N5DW?=
 =?us-ascii?Q?jc9uBg7aF1Avs+VdW2V1QaMnP3HzJaU5K6fWqz0J+g00sS13B4gxrs4fimx3?=
 =?us-ascii?Q?TvEQRlS8g9PQW9f/wabDHJfrmzVAQsRPGafwEzSgNIBmpn8BxvuhIRhfKlwJ?=
 =?us-ascii?Q?hu7nkRa19GNE01As1g7ulU6Ir8AZ9dxhREiVVtIfOityg7Ro/lOFN8lDoAAF?=
 =?us-ascii?Q?ZwbBxyEJcyC2fGtdCFsrqBcM5z0FiQK6z8Kz9RC2HClqrLIXKmuPXmI0k+XL?=
 =?us-ascii?Q?r3iCAghrVO4ObM+htRKVq3nFJ6boGUWdtCre/UlEX1bnwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?irJqTeCMB3EjIy3xsQRTy2lsoZsbj4fG6WhtuzrkQrVVV6E0dHXLASVUClE/?=
 =?us-ascii?Q?h6ZukdcwSAngIG0X3VenB0Jbe53uEpCNvd9PE1SFeNKJe1EQo90aOTIzgI4I?=
 =?us-ascii?Q?znGzEhWcFcMHLYsIGreC7Gaegmhfk4y0jBIraiC0wjOKE5bL5DsiKlfbvw4D?=
 =?us-ascii?Q?tmeePPLkBeKWKO16hXNM6mYrT0xqmQqWpBAHelR0n1wscEKKoVGkqTx/fsF0?=
 =?us-ascii?Q?brYBr26VKBR2pY/3551UiRbQPifgKk2xETFFmd9YXh9GjsyflvBcRcnPtSiU?=
 =?us-ascii?Q?5+oPhScFN3lZqAYjduOYhu9FzXziGnTqldxkvpFCtTRXayC1mhzxaaxOIKcV?=
 =?us-ascii?Q?vJhBgPckxpfQojOF64kG/TboKKlTqkrJoKP8VQzPGn5yw51kGVjggVR8Dsdj?=
 =?us-ascii?Q?cwaEPtPVvxTYjRk4tT4/POh11XDSLfSmTZx+vO3DTZ/GDMlUCr3ez1VFbMNx?=
 =?us-ascii?Q?lFUUdG8nyFEDuoonyJt+AZxgHUT/nrv7n/66hKiccWMDU7BBnE3SIZX/Tezz?=
 =?us-ascii?Q?zFD0Hdl6IYI6OhDBRbDospqKpdQk+UoGMExUFrw94Y+iboRNLbK8aXUFwYyC?=
 =?us-ascii?Q?xhZHX+uhW5h6dmw1LRlkBnQ4fB6JsqdoqDLA1CEPlRAaiMlSNQbaYp2li/p1?=
 =?us-ascii?Q?xu8Wv3PLtHiRxapXiAm+NW9ygOfdbVnw4uuTnAOb7KlDMIr9giZbZ/z4fniV?=
 =?us-ascii?Q?Dhs/Bi8xmDbxHH5l5H9xx5o3BS9NQVEY5+ZCy2npUIutvJRK03PuPk4xzEzx?=
 =?us-ascii?Q?7AiCu554oruxO3DSgIWXH2eB2rlhwYn8ArsaLW3aTFfNLH2hvpxIplXdLD0+?=
 =?us-ascii?Q?nmYv8oeRCxXLVjv4YsDsEF9Q4wiZWniEIqZzQF4vKhO44VVFg0+tqmfftuMc?=
 =?us-ascii?Q?HsU8SX12v8y3pxxNInLlQhEAMhu4WDLgivTevAJLfeuO2w2xXTfuJeFPjYh9?=
 =?us-ascii?Q?+zovxznFfxQSay/xl2LDHNeSYj30Vr2k9+PA8Z/mp4rOem8aPjxSgZD39Hg5?=
 =?us-ascii?Q?el9gcQ5eyQtYOTI/8KSpDo1ZAxnKEb3tm6vyDSY/LX/Jn2d7XtRu5SN6CGNO?=
 =?us-ascii?Q?rEseMrPW5eTkJUvA2BPBaWsHGUafmy1F2hiCIZlWTbOAr2FVyIl1s/FVE7Bf?=
 =?us-ascii?Q?h+Ck3oyODQTTa2JBOrLg+zY9Y/1kSxq0mmJV+lHCBjiw5vO1gMfZ//XptoYo?=
 =?us-ascii?Q?JMYCCq0mOKT9L4UuuBXn3HCIfACLI8yDPPrVDTDbWKLGYTTDI/FwGmfKVLBt?=
 =?us-ascii?Q?yutlfVFOQPeP28OKbNh5xAhTTb9kknP+3K4iy2ZQN/rnzW4yrUF5Sg3nCc6T?=
 =?us-ascii?Q?1Y5PbAMj6DbRGa8vI43EyAmK2opFqmi4eL+2OPZ33f0l09ZYeHFVpI9ZEHRF?=
 =?us-ascii?Q?yEQb84HKF0M3loNT6djTXDq69t3CYdRY4boJm44viLNS+cVEhFDalyyB+7Ds?=
 =?us-ascii?Q?mVIHpqsi9zbIEkZWF1uyfCUXWJ2k/u6Cenyz13gf0jV35EPGfkmef1n8rjQD?=
 =?us-ascii?Q?4Rr2M8iQlFLlROY92HG30R/zQ64irQlOzOrPN5vXanxeusj/pAMCI6iihh9Y?=
 =?us-ascii?Q?mhaAU+BhdSMK+mAVlODzfDh/RjA1muPzeanecdLy0p8e0RIDEzlOZZHKK3Y7?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mq/m7/zYO29hsWy49ZUU/T80BtKGoLQ7/V5YXN6E7pTzqGC+PuQqxuhm/mHo/7Nkz9Afwj5ElphG7St7BVkFec+dccxN5pgaQBan1JtLEkk0258v5ZqcbDeqM1lmwuWKoLHl3VbOneN8cHzVPppY6k0F+BT9ZIwJ2o4XCceNx1bhuqY0Nuf1/+l/yJhftnYgOfYft6g7gBRsuxx2vo6ArCN/0vo4wk7eXvpLg6km8igO4gDduzK8ctRplPhBB1nc1qrL+9Yz6Ftd1vUYaELjp5lbuzH08cduBvxSe+RSbUZg+evp/P8VWa0/qWIG5KzdxB9w03FLv/alrDca85r8N32ThyPfA/Pz4fR60UfyODk9l9d3KMWfBkk951M6kxL44hdNQ/1l1RCVB78WfridayDZnFH5JdcoITQrEsJH+n6Yp1teNTWc3KwKbmyMsqElJASmbFGenV42l6oLvn4AVs7NluAAr4yHvdRkvsxWVT6Z5zD2NzyFWhlVpAPorZAAyylCbh6FDCiQ132NJoHBnqUQRTwD8LIbGnoLm+JhVEpJQGhdATGPMUwV+JVw0DDRheaFH2iHd+Y7beQwKpLCQyWNdz+VDR/JeLrvrBWZKI4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f72507b-bdcd-41cc-55d1-08dcb22d0663
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:43.1898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AlCm5JfBhCsMMRH2fsCQGnxgFiUxk7EZy9PX/seh7vdD126NYHCzpKX3Gbk+PdQ0uZKBUqySEgf3G3Yqhtd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010086
X-Proofpoint-GUID: 8IRWoU6TVWk5sQz5DHKysomyPabxJuC-
X-Proofpoint-ORIG-GUID: 8IRWoU6TVWk5sQz5DHKysomyPabxJuC-

If users change the LIBDIR but not the TESTDIR, the TESTDIR
is meant to follow it, but wasn't.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/GNUmakefile b/GNUmakefile
index 5903a8e355f6..e7657d466df5 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -100,7 +100,7 @@ MANDIR = $(prefix)/share/man/man8
 INSTMANDIR = $(DESTDIR)$(MANDIR)
 PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
-TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
+TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 TARGETS =
 
-- 
2.46.0.277.ge12b8151ed

