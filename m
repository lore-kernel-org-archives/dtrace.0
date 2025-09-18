Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6700F34BA25
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758218649; cv=fail; b=OvbZG3tKqorzoNRuw3yl1J+Ilmw6TlVJrkbus3kH82y689dK0GY5TUtBMbWmtIDpSIJ0quZN1ySxPBh3wuRxmHCmApoaylKM8LNGttu5gRTAX/wrgCnSK3OvJKI2r/pgGUnsdd/6fT8yDACFqGOJoA17kGc9/VLSed+HIvIoS0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758218649; c=relaxed/simple;
	bh=NrKfTOgcPOUS+cGBVlzp+vnhfPPG+C7xS76uoj+f9/c=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n4wJXkJtaJvQdSXlWi0pfeEOaNpBQLX0Xp4AJ7h5Fd/a5G4uRgjioDk20hr3SRIrzTAay2JgIkPX0hA7VH39GDLaKbFto5k5/siKpFQhUIHu2RH0zN1SCuKWeFyI/TuF18yDEVoNF4GwkoDIG3ld84mSTyvW6UCaiTkrEPQiHyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PbBVwIbp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lrWUYFXp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PbBVwIbp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lrWUYFXp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IGOpWa003481
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=auLOhRW8Ndo/vUjh
	l1neungVYkqB8UpWGMCvXrzzmps=; b=PbBVwIbpFYCZcfkUfSYQvGWHsww+vxFW
	Vnhu7hoR1uX1qWsTqqhReNLuX2D4E+i1QbeoGwJ9QBgK3Gxg23pBN4f0SBFzjGmV
	4Q6JU7OCHIOq1sHv1z3dlIYsuhjZuHsDSM746c84Lxbgip4WhQFCMQcUHaqkKMGR
	lnoi1C46b0vhngRSEi+ERqdlrkrkDJHw/HEm4vEKxbptKe9o/inZObzgE0qToGEB
	T3FzjVSsaFfqWNM/r34Svr9BDA4gIJIe+VCH2xg62k9ELnqP1TXYoyuOlYOG+exL
	Wz3ZzrohQBZnvxmfslEGxCkDh22/2AFoTOe0X3h/QpQnKpcfia38/g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx9416s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IHAbnT028813
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:02 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fgm1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOwz8GBbuqgv+k3T74DHwI+LfeALhkfSDkNmsEJt7QfmgjkQ86RaY8HkhlenmognNbusPUtbBq3aw4UscR0gWitcvRsAZeIC60WQP4VPt2vTeV6O4rsAQBZHGxu01Um0ihC79tb+HyHwLIYqN9wAzA77RMQxH5gRqmmtlmnYNYmmjMJ4EDTXTb28+RNySS6bdLZSH5z0cenCB/81SCG7yNNlR/DKptzXW2fb42EPbaKTjGbwMR9K+ur6RL+Yx/C/c/JDCai9VbaA4oO05yoht0oYodUuMNpY4So1Ti1+mvNCmUM7v9Na2AcZCh36Zc1gfRPJUVB381VijZjHvgfBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auLOhRW8Ndo/vUjhl1neungVYkqB8UpWGMCvXrzzmps=;
 b=xfIenxbky0EL2Xf2Lg91hLVY93hZAY6lR2O6T/pIe2kkrjJsY3WMOl4/uTDBz4HdCP3JbgcoZn1X2A22d9IkFpF2kDML96sZnopFAwAUsKhRLRS3w1kUYu+B1EA1lYijCzxpU3tCikhubPfXqnzycjFuI54SoHgToqMDe3Sw49GDpyxCJwyZj5+0lXl2tCjQcJp93coO0LiVZRjShoRdNUy4K4/XFFlQYHMTlyAGmyL55Fk2eXgbNpruX6LhEBS+i4jAgOnm22Wz/hYF/GuMa8qhWXJabILPt9Kn+bWmolgsi3vlvzI5iPWdGceG/7r1ELevQzQZzQG872Niivn0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auLOhRW8Ndo/vUjhl1neungVYkqB8UpWGMCvXrzzmps=;
 b=lrWUYFXpjqjKGvSbnJyAvXlaL6ws7h8jnTdi4le0r3JtioDbgWqXgfwAsLW8y/1EiUHj0pRS0geD41DJgWskzzQ9zOwmHDRpcRCbiP0BgEfhY4IFX40TNp+dXo8AP5Hkg6f+gZZFeJk9+KNgVd1Pnk7/9/BTGWlWGu35jKob0pg=
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b) by IA4PR10MB8279.namprd10.prod.outlook.com
 (2603:10b6:208:55f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 18 Sep
 2025 18:03:45 +0000
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822]) by DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822%4]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 18:03:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] parser: fix parser debugging yet again
Date: Thu, 18 Sep 2025 19:03:35 +0100
Message-ID: <20250918180338.197827-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0542.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::7) To DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFA0EC85B6E:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c7c62b-a6c1-465f-8a8b-08ddf6ddb4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+tD4296XTfaEwK4HuFlhQbKrVLrYu3KWbldp4L4e4yvHeCRsnvQtg2vSRD+u?=
 =?us-ascii?Q?qbO1O6Wlwz/QdPD8UoZJfAlflGxYPEqDaTbT5tDx1iRDrnW9naJTu89dbgvO?=
 =?us-ascii?Q?IOtRJZ4XibTzF8lVi6pZi+muMZgYWGjOhVfguHYcDKQ5B+aBkVMArkE/t6BN?=
 =?us-ascii?Q?ydUw3zzruIAKqebTcqAIYiTIV4yeGKnMbliOgz7YjqZIGZWeK3qwnByl7Qf6?=
 =?us-ascii?Q?+cNwUjtiUgofrS1qxJn1KTTEkJ9C50e9GvJTZxmf8GyY2No87Oe5yi2Zezmo?=
 =?us-ascii?Q?PIqcK6L1iuCTDUO9nziIpSR14l5lLKyxsqHcpmG+InakW6MeMuJf16bIOPGA?=
 =?us-ascii?Q?ZBnKTaNGZhPv5NVG4n79BC0IFCRZuHAKBo/wTcpuxTg5siipgcng5ui08pHA?=
 =?us-ascii?Q?MMPlMCWf56YqXOjZ65yfBvUUjKRG1XgE9FZ6HCBhtFbK6RKDDYYBG/m+URhV?=
 =?us-ascii?Q?kxUjH7pGorUm2y1nhn9E6w3sBH33Gv5L8WsNsPC30tjmo1Wm/6iedYcdVh57?=
 =?us-ascii?Q?CGomKmGWhJEGDGMqlSlpRSHn7pbACsbArSMpP+AbYB4I75LiuP/b9Uu75meq?=
 =?us-ascii?Q?srB7NK/uqYuxVkUDJeYy2n9b7G+0dKji56DhyAVFdDqaRr7jcCsyZH5tzC1e?=
 =?us-ascii?Q?GNvEPdmiFkNv3zS+bUWvvkJDbnf/V7YwsDpnQzOtyEBkjDkkcu2404iJ3DaL?=
 =?us-ascii?Q?gM+wlycCMzMCNv5kmqZ2E4IIScSvm1IwvSzdYrIofjpslrJByNnN6BDqLodd?=
 =?us-ascii?Q?O5fn9VcEHYYk/J2NGd9v3j1ijbxYVWfCdV3Z+6CfbDy/+QIqo7P19CD7CBh3?=
 =?us-ascii?Q?0LMHpQNDYv/Z0108eQjqfMr5bArApWcb5D2cbaxh/xgpPrIxru57lKM/n6Kc?=
 =?us-ascii?Q?yDJG0PN7vVfsyxUjX3ttbswK3qrIqOUgnR4qDJuSLO0oVMZR8lkPmlSargFE?=
 =?us-ascii?Q?FCw25hVsAB1TcGafbVGYOWC7G0fUW62STTtACbruvpKRLZLC5lBl0KIauoNC?=
 =?us-ascii?Q?z29Qm2RNCmdc7rAOTFX9iiCRM9aXrm6jyBxXbbsvZsq7jGlUCwnu5cYbY6/5?=
 =?us-ascii?Q?UAUO1+TOSeSfHJCj+Dg12Nd+va0mnd7kymPm5l98nc3J4TGcDUm/3XnCcX2b?=
 =?us-ascii?Q?Nam+7cDlChSrFRtVmJwweRGPZlpgjRtgZ1kNhrkEd3KNtc2cO+/9aaiP6c/U?=
 =?us-ascii?Q?a3WYLX4dWZxnmUk9Vpk2A/DR0ruOc6bMpRKYUXoQRlvxPnAFBLgojH5svRc2?=
 =?us-ascii?Q?n65O3SpmtxGP+BfMIJAmzRiLndzu1UwWGeGQOFFKMGrfHlybZhbXqTQ8lTT4?=
 =?us-ascii?Q?cae/Yef/e0OPUi/kStUcyECrxlo576btwJ7cTRiCjiu/zpkb4094cfLvQ8Jh?=
 =?us-ascii?Q?TQSlDhRlu9hOSxSjisAbXkB7np07h7lV/NrByDlN59sKrrKM1nPUCmF0CGbq?=
 =?us-ascii?Q?eIiUVU9UFAc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFA0EC85B6E.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d81mk0mUnw/eYuer/981zoPO2QA/xAysoCfTNNrrzbuHMYjoqFU7Jtr2bnGi?=
 =?us-ascii?Q?xwEfD2CUussqGA/NziFlmucqiRNbEW46vHo1pLAm27EQjbVEcwpRkdLmp5fW?=
 =?us-ascii?Q?m/snN48FWOToDGJr+WmaOSXq8oKB1B89SfKr0xaXxHMfn+iOnq6I8xDilUpQ?=
 =?us-ascii?Q?NquTlCfCik50NBMrj4qxKPHTth6WtfcEdVBqenRrL+nPfXJyNgBfJobDjFzT?=
 =?us-ascii?Q?hFju+uvjOBp4nEV2NvtdC9lGDy7qcNRQfhnoQJ8TsWCOpLl6giUe1Ml3S6rq?=
 =?us-ascii?Q?QWUt1gzyykx92RrejdXOwhHXupwPhgoBKwJtyrzZnUHEPMG+aihRDUEIGYy1?=
 =?us-ascii?Q?+jvR25kq8AjbvddikqEqX+iW2BIO10QpllJ4Zrp/n73dE8fLwLL9ScM/fk7R?=
 =?us-ascii?Q?HQU8g6hQktG5drGa8d4nljvFEQNTSQi2jpDWdZNLxMKk7SDf2J0t1B56p0gO?=
 =?us-ascii?Q?9QyAzQi663vGiOlrOkTSdTRE2W7iCg4tVWVcHse6iwOhiYKrJfAYe8WoZBZy?=
 =?us-ascii?Q?iMtC7oiOIiAMz8DRT4M3iDxsBhuaSKx4Fv9w8CwofJIWfJtVNne9AsfNYgIo?=
 =?us-ascii?Q?lo8c8Edr9BpWvFxJFRdJ7NphVzr+96XvoKTsdBqj5WdYpANSHuXhJXU+gOLI?=
 =?us-ascii?Q?RxJV5AE1AMDPD8wMcv8bg9/nR4vU8ThGByA0j13Vnu/nU0t1d7c6CbeCmR/1?=
 =?us-ascii?Q?pe8GU6kB7obHuPWAS4qMrBA+1a4ssBJXpJbzBF2FVXB/wNfWKFrDIW2chFx5?=
 =?us-ascii?Q?TfayMVbaF0vDRbfEYElEd98pNDwixQXbyuOMBj8kPB7k7ZoVlUqjxxRtzy9R?=
 =?us-ascii?Q?aeJYOjOvIl2lLrry/Bu0eCu+cH2S/p4ZjHwYDeMoyF8Gu+gkj4DkNaiyjkYz?=
 =?us-ascii?Q?xxHIvJzU+iubLX3W+zPKTDynKASXFmGuetYZdn8dcYd59yyGHCRitlVkaT3s?=
 =?us-ascii?Q?Y968zkoG6JoGVxpPbUPiBPhc7nvPHRnej+Mk2SZqjB4UKww6C1YTBMLrIv3H?=
 =?us-ascii?Q?clv+RpJLhS0G5mXGeLcTBA+LN/JvOzMLt45M0FAyKX+gHCUGYOXWsRAZTaIs?=
 =?us-ascii?Q?4PaJUahtI+GFo81RZqRH1n2bPHtX0+9LdGqHraIDcZ/HH9yOUV1/fAEjmxKj?=
 =?us-ascii?Q?lWMvRRtCcf+OaNYH4qJCG8cOZZbWOs5zCyTDvHttdvVMFWZmcG2JXyuxvFtZ?=
 =?us-ascii?Q?kjKSY1GQDvhgKGzvcLvuWDKuMBVQBv2njtQgtcc1ZXnaEDR4Zn8mM4K56Zag?=
 =?us-ascii?Q?j6WxBrWEL/KtseTH8bo5RLPVHR8kL4oWdMKWwZD5flehyiCLyjMuKrpMTmf1?=
 =?us-ascii?Q?q9FNwezeFwLfXNPqsvZRzUvA+N4l7KYVxeWV475ZYZqWY9paG6tDnlqjKANA?=
 =?us-ascii?Q?KgJUgEj5q46Ajhnza0bW9+g41gGngEx54QaA7WB+dskr7Mqe3Uch7+B1VDfJ?=
 =?us-ascii?Q?NrRL0L4Eev0PT3Q82J8S9dnG5NpcZTi/GxddkRThb8pnxcMFLemd+LSGfI7/?=
 =?us-ascii?Q?csiv8tAHCL/6yOFO7aKRkRTc5pOkJA4hB5/6TZElPN0t8OtkKNl9c+V29Clk?=
 =?us-ascii?Q?5DrFN9R2dEtDvPQNLhXYKWYMJ6P+hVbpsubO4h4x8RJZjxFhc9p569OwFsit?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	El9qdAzlehpe+jH8dMcnr8MnIeSHOPMYzsmRCzZb/tCQzqn3VpL8qTnLYh4QBWLIfnO5aKNHQN1eA9z0j0Ni66h7J4m68A2WCR3PP0AmVyxVmmH/utMvFFT3s4XgNA3hEsZifPHg28chJqWw6okXjadQmn6jW36H9cHbeiC9nU4gTwc+/f/Twuc8Kk7uhrEQpTeOoB/FVhxqwKsxzXmfcUQsChyJidsi5w1Fpj7RZk6W8dMIBs3m4Xffr72BbPgSDMNteHlWVVCFNRH88RS+jh4EjUsG+7n2tIrK3dPiH3sZeB2mz5EtghXWyDVjQwc9GWrf/DhY2a9KlUXZ51WWf02IlsfnxBySbPoda6IsqXZ5gVUZfr39xnZuSUXFSm9L5w2acppx3woGPWJs9bFUJlmEASNeGYo27CpSAcim2g98teBdAIiRDIUNtQw1MJWXWQo4lN5tQtC8lOvB9sT+rsjZIeHjqpfpJ0NE0paJazUUbn3lMEQfb+s9vGfoGdPWV7PEAeATI2WLpcBcCE5MBwPhITAmcfz8fFjUNJE2o09G+fsPh4Zx637d5FUXlzMqjtiTHPoVDvgxGTetn6orX5F21IqoYDk77YGFgHS7jX4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c7c62b-a6c1-465f-8a8b-08ddf6ddb4a9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFA0EC85B6E.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:03:43.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BR20GxExwCYyx/eaOfONUtFIpeQQEBeblXz+Nc/AnjVAGULG/rV+Wu0Gxm6YEKUI7daIcvGf4/sWszVbr483Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180160
X-Proofpoint-ORIG-GUID: WE8XkuwftALEC1W8-3broFnbqeqPCIwm
X-Proofpoint-GUID: WE8XkuwftALEC1W8-3broFnbqeqPCIwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+bLNJuO+EEF7
 sXEVSYrdiCID3d4eZezmlLhDB8cDRb6Yfuugeqdu5kE5LiMximWKlUhTZxlnubdAqXLTrn4H9hC
 ISst0xx1gVAULWTeSVARHKQZ9+41Pcj4s80YGXMNO1GkBSbgeZuBNJHs7My/Fwt19dmyxY+FUXd
 0QPR5EaE9qiSf8D8yBigzUlL89UhZlM57pMpSX16KytdnLgpKDaA4UqO6UxNTwIGeurkP9/d/Xb
 EZTTMc0cIWyW5O/3YbKclzP9yURiL9tRp21CyMZ0uMNjEyStgzm/x4BJYro0sptv0i9veNwkTYP
 rT+u2n61RHh1jyEgJPQrc4MxFpxzEiAQyVNcULo7J2AcamaaXI+mdTur0dKL38Fm6y6vQJ4K80R
 Cy/MtTa6
X-Authority-Analysis: v=2.4 cv=N/QpF39B c=1 sm=1 tr=0 ts=68cc4995 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Zt3L8XSzp14EBbFjSBsA:9

The interaction between YYDEBUG and the yydebug extern variable has
changed repeatedly in the various iterations of flex and bison.  The one
thing that is consistent is that yydebug is not used if YYDEBUG is unset
or set to 0; if it's set to 1, the parser skeleton defines it for you.

So (now that -fno-common is on by default) dl_lex.l should not be
defining yydebug itself, and dt_impl.h should only be declaring it
extern if YYDEBUG is 1.

With this in place, we link and run with the parser debugger set to the
expected state when compiling with YYDEBUG 1, YYDEBUG 0, and YYDEBUG
unset.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_impl.h | 2 ++
 libdtrace/dt_lex.l  | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7d8e4432a24ad..9c4651a46baa6 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -808,7 +808,9 @@ extern char yyintsuffix[4];	/* int token suffix ([uUlL]*) */
 extern int yyintdecimal;	/* int token is decimal (1) or octal/hex (0) */
 extern char *yytext;		/* lex input buffer */
 extern int yylineno;		/* lex line number */
+#if defined(YYDEBUG) && YYDEBUG == 1
 extern int yydebug;		/* lex debugging */
+#endif
 extern dt_node_t *yypragma;	/* lex token list for control lines */
 
 extern const dtrace_attribute_t _dtrace_maxattr; /* maximum attributes */
diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index e8f3bc8c25bb0..9f12f5c7ca289 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -21,8 +21,6 @@
 static int id_or_type(const char *);
 static size_t dt_input(char *buf, size_t max_size);
 
-int yydebug;
-
 #define YY_INPUT(buf,result,max_size)                                   \
         result = dt_input(buf,max_size);
 
@@ -663,7 +661,7 @@ if (yypcb->pcb_token != 0) {
 void
 yybegin(yystate_t state)
 {
-#ifdef	YYDEBUG
+#if defined(YYDEBUG) && YYDEBUG == 1
 	yydebug = _dtrace_debug;
 #endif
 	if (yypcb->pcb_yystate == state)
-- 
2.48.1.283.g18c60a128c

