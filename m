Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA422262FEC
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103411; cv=fail; b=KdJ06f9uQ17EJ/QR/EAQkqx10+TL2kseWbeinuvoiqfKRULBq/6M1W/ygRSkTFh2pdC3dzzik0Mz8rhVAbaK2C8Wn6cJMbwPfgId7QPLC95o2NcyqUMOH/MpUVKXVPyu2BCt/P5xJNWUvXj9vskF2ABTnPdkmyzzwD6APT1IDYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103411; c=relaxed/simple;
	bh=Y9jtNzNEAVTidcIFk+i5SiNNp2iD12fkQ5mQaNtg4oc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qPcrGMH2eJXXX7nJw0X9C/A5awBrLkt2+AkKR3FsJMvl7CPT4OnCn5HTtMkkqXi/DakC8yUzGDeqpo/kXRCDyuaThoAdR8sC10NsFlfvdhW2LOnRYZ+urEd+llbQtYBx/DuSb4OwzCJtiDLtYhdysLF1HjKT4GehItZ2YeuXBNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jEh2wIyh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SYmRyuV2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jEh2wIyh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SYmRyuV2"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NTkb032694
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UczU8f0ZA7tU/4buAh
	BvQpMq8HoHsKVqdF2cayspYw4=; b=jEh2wIyhJadTSoOERjmNCEIYQRCsEdqLQx
	Rh2qhwmtHSCFuGyJRJcTyihAECL4NfwaX8yXnQqioHFgkS/MQPD2NE/xJIYXjx32
	0BDnm9lpZ6x8wCL4ibtLESX51XAC+4Af+PJ3HTT+3OqwNyZTiEQWXL6X9weU/bCU
	y2Yc9m2eruemeXWZnHUZSFXM2z5ZuGgwai9CSvR1/HP3f7wLG5vsWsGIoo5ySAm2
	nDmPNjjnee/AJnqxr7Ecdg2qz68WdlZl3/xNoJ88kDNdwYu8HxcD+0o+pzIZ+iMp
	PumcBLfkAIdADpuEdOJ8nG7i9Q/NzMZtQSt3NIKzwdEp0t1nIwIg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v31d6xxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkBx025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJGTf+YgBcrrvTC9iNPmOlPVlH6G0T1ezAbS8ovmpc1I8cUqRYlKSPJTjJzptkOkojjnUSwx3AP7+JuEgxUwnaE2oYl9nfga3PFQktEQRvl3Wv3uWIWevDMGzGJhD0ywobs8GEf0Me92IatDtMPVBZ29HB09f5nBClkaZbDITYrGVdoFHpYaNKSsQ/1+xTXo0bzyiAztzUn0iw0jMquVCSE19BfNisqx/5g6ihGrzmhMiabN1eKhY8CqDQ3esXufQfABQl63SKjXu6fNuOSQM8b+gtHvbZ5rOWIcFITjMalGWD7VNuTkJc4jmh9DzX84XmzJLILFtV4wo2aZeWuZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UczU8f0ZA7tU/4buAhBvQpMq8HoHsKVqdF2cayspYw4=;
 b=g2M2pPInEIIvo7eNExiku1fnICIShtXU4x02zKZOPe3gJFsIc2nOUn+XMRIFpvBnm/Hvd8SK5sX9WV8UPIVYUAo28z6Wi14Wcg3GcUymOwu8zhVVp+19x5yZJ20xpadn8IEXNALAg/myHYF51mjRPt1NGnCuSt/KythSpRXQfKwModKQh5YnCNahV+QEja+SrLQYOsLcq1AaPoSMSnyaM0Ypm3LIT5ViV7lGJCU34SH3SOJBzExdxIynLren3mxDZVulls7vPfSuuuI7g/511GDhSeKubgyrPSypEjA0eCx3jq6Cn7vmv2wkjqp8sgODyP/CvuOCN2a1ZbHwKckMPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UczU8f0ZA7tU/4buAhBvQpMq8HoHsKVqdF2cayspYw4=;
 b=SYmRyuV29X0gtom/Zx09cCY9vEeCLzo7H8ffJq9gWV5nQIOmYja/MIg/LdIUHMx2GFMChHtHJIGxltXdldyWML8v9tfBWcq2AcaKdjtoMU5LNn6vJlwdolJlHMN4i0gAWfwM7NjhdmsX8bL8GdnZ/ru1dtKy9HPJkYlBNuDUvcE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 18/20] doc: Add TCP provider documentation
Date: Tue, 21 Oct 2025 23:22:48 -0400
Message-Id: <20251022032251.2010-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: cb239a23-77ec-473d-4a74-08de111a584b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sSRfqvk3E7CmS49F/FpTxygpmgSkI/xhaKzTFDFNNGjcQ+wqKEhpPCVDVxPi?=
 =?us-ascii?Q?qADlLO7OYUx3EKHkTHYqCP/qnQKfGRYPeCT7NzEw2xOGsSGu5K+RiX1h91oY?=
 =?us-ascii?Q?I3YK5amvxP6s33NFlci0yjW90aKcHPE7mSmCLTPMHoJaurHOJZJGCe4GUBcJ?=
 =?us-ascii?Q?GdLMZaUIB57zsLabFahc0LxrMAor+1RN53/gkRfLQxAH3rejWDZwlWds2mRZ?=
 =?us-ascii?Q?FdhpJGxjDF+/F5I05+7GbQak3A2DY/0TOc5eEMufSSSlme+81d+J5To+2s7d?=
 =?us-ascii?Q?hckCQWhQfnZZ5Sd5JiBWWLxQgCZ0CCilHo60liEaERGW1J4is6VQDwEI60Nu?=
 =?us-ascii?Q?CfPRw3cPvIQ3mdKgdXINHnpPRB+cGsswmVjIZ/e/3K2MMj1ryj6KkypCGR5f?=
 =?us-ascii?Q?0xHVnQtO2q3ngj/xRm20Y5dhopkt/hmj5kpEqKBhxd7mq0oYEYWS5Q3NN3Ib?=
 =?us-ascii?Q?if+QFLSsv8G9S0xbaiDaOHVtyS6672iG089xR1eAri8/s49LThnK9WyYausf?=
 =?us-ascii?Q?iSsoMTDBrQ4RDUHwWU0CCu/e/T8u9zhBsq+845DY0s0E8fqhoeBcRqM2rPsZ?=
 =?us-ascii?Q?sQIj/MvUyRvlotE/cc9CFkt2BdwzoQJ14xve4PAH0RUmV8FBepecNkUQUJkq?=
 =?us-ascii?Q?nfrqzOeq5/uUPmu5ra8O48+ZEyYn6Hq5XJ0M/JDuoYI3GZ+DFImopKpG6y25?=
 =?us-ascii?Q?xZHHvp/YfDpoAkgg88uvGx/Z0tT2gy1SMG3i9zOGzvpUJ/JN/1VQ4DZftJWy?=
 =?us-ascii?Q?z5QvjUFwHV8t3PYu09sNu83DyfhG0qD/FwZdZfI9R7bFF1g3QZwKcZSX9ZPk?=
 =?us-ascii?Q?VvHju/0nBiu6pLgXb4AUR48fiTgDvlkm8Y6FoU4qVKgPTpfp9vSXTF6ozuB8?=
 =?us-ascii?Q?ErVtJ68Gfe8+/LL0yGYsONhCXYEbY3gGPnN7e8eRYAwnxZL6Q4VtDYUd1qGq?=
 =?us-ascii?Q?D5C5C+aCAe6cUyTuFXhVuhdhx/Ea7PZddN2MTfGRKV+PY1kOKyOIf2RJ5EOq?=
 =?us-ascii?Q?peeGw/6a9wtYsdyNkonFedlYa61weLMBM7WNdB39Xxu3PS9Td6ulmSMNhvSP?=
 =?us-ascii?Q?LuWV/tpRs47R/iEUVl60dQtHV/g0gzJfJrlcj6G6YlVWSrHdtFRHqq8zqcM5?=
 =?us-ascii?Q?70qLi2aih4RNNTe00aV3daihdKksNWZkQbbYUi4yyDqNAwXDBnXkTSEsWfJz?=
 =?us-ascii?Q?dgVBqBb/Qvz7e2qDeOB9JNPNQ4VvS0ilTbEGVnnY4HuoUA1sUEwcG45j5zkK?=
 =?us-ascii?Q?39IsjJppbPxfn+xd8mlBvjoTi5gxpSZSeW2VT7FD+vOnuLJhrkCaxqgQ2Iol?=
 =?us-ascii?Q?wEq1gQP/r6NnIDXIxU+/B5UeDls8V1CH5Z8WfUKuxi6v4nBrviRg9JsRdEoV?=
 =?us-ascii?Q?2hY+F2p+p7IAXjwdYllQtOO/sErhvqT8gYmszdrBc8Luk/JShHDmOfYq8Lft?=
 =?us-ascii?Q?YPKCAB2fn0t1/561/eI7Pr67rxb+jFCS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQcLUV15kE8oV2y/qwIY5UhV4v3YcCdqnT5cIrE0GSi1+t32MhqyWiGVqNg4?=
 =?us-ascii?Q?AiO+XUed3DJe3BKZ8SPG2IJ50hWVsz76C2vaCraRXMVpNZEiEuxIWsAVPXJs?=
 =?us-ascii?Q?VLnulhDcOE8xMWIPbWcfZfUxKqOfC5FMDUG/qzpgBrmfRwVlL8nWKjyKI2rq?=
 =?us-ascii?Q?TtJCUWlC2QMkKEihkuJ2lKDM3fhiZuLJPSm6DFNqPliitAIfdZMQRKbCr/sN?=
 =?us-ascii?Q?mYzCjCl04vcwJQRXxGZ0veUMZoguja0L2An0i4tm4zJFch3gZHH3MR8Kk4Yw?=
 =?us-ascii?Q?Hn8DTWA4d4ZTrzHsznTin4dSR7YNkqOSsOMQKkGJCY7R7xlFbV6XELoTecvU?=
 =?us-ascii?Q?AYWxIm3mXNAeqzqilGVPh1NJnA/eP1vYNZV3WItqj5zAF2DivJ5GDQLcDorj?=
 =?us-ascii?Q?zblTZyZWuUvDakgPyaZht2Te1amh+F8G8ZOUUWZxJl/G0mTarVqqCSIRoxOj?=
 =?us-ascii?Q?A66Q7w9keN3AJmaGsc1ppvEXAdvbJ7Fw+UqrtjRtVjZWL5uIrC/ore5SHAhW?=
 =?us-ascii?Q?FQS7GzJg8PegpfNKFCiJp/JLX6eLSyCgDR0T7OVqwrxh+SrRnzQan7iC1yUl?=
 =?us-ascii?Q?MRCzgZeHajnMw6fhl8oZwV+Q4vvXa1/1Np6klFUm7t280Q+S2hchsNY3Sj/h?=
 =?us-ascii?Q?xlnrgsQrbOTN1wrCUjpt7KFiH2IGjd5ZzfA+BoCGpHKSPCgyhSez7ewIPLEk?=
 =?us-ascii?Q?+yIkfqfciFJyj4TV17D3ED1A17xf2MrY2OjeQ1fsi5XVCmK56fgVWA80WmUk?=
 =?us-ascii?Q?6KtqpkV6RAzELP5w+Ic1Z5dNErA1bAg4JuuHLsmxujWVRqAzTqPGSPDm1BEZ?=
 =?us-ascii?Q?LaeKxGBlHL6pd+wVwyyBKSOi/jncspt6PZ+2O3TZTPxyHqbJUwjKe45xaLuz?=
 =?us-ascii?Q?kYYHr+Cf5dHZUzDZeStnC7f2IQq9p0gY//m6hSWR514cHPFeusteJwo56cLo?=
 =?us-ascii?Q?BE6ys8V1+7ZG2mPg2+Om8tpgKZEB+0spPpFMoTu/kJO67DSAmBeFwXceHTU7?=
 =?us-ascii?Q?NhcwNNyX3g7HpGOF49lXV7I8MfozhWz1BhrSAI0BZD6OuEnZExiaeGHoUKsy?=
 =?us-ascii?Q?kbjVDKECZ0AhtwC9il0YOn+LeeNzbd9sUIGg0BxHLS5mNtGe4pjTsRRYG3tv?=
 =?us-ascii?Q?euzZOOuuoKpkQYLqyXkSaVwkWfCSp669UPsBgxwAkPGQXOgmnLmpFOOoIiiZ?=
 =?us-ascii?Q?3OzhEdY97wKj2lgaLUbR+kkauyatVHysOo3MpvV9d1H5kSKbKcACyO3l6Ee6?=
 =?us-ascii?Q?zRn6G9RHHfYuwZeDnKoMZrYbIneAEMvMinmO3Z5jkWPweInDruhL+e7A5dEE?=
 =?us-ascii?Q?ZM0doH0fnsuhUFo9IPxMNNWlusb8FR120tFrUtWYJkkPoY5y7MwB/PM8CoDo?=
 =?us-ascii?Q?KuqtFSq9PJkfUkk0tau0m5AX6b1S/MCsQSWUAa3RKMnMTl5HO2opxQWhUnCn?=
 =?us-ascii?Q?uTYYNUMfOmYK2IddU7/GwxPKO8dfZMmhKOXssWQ3UIW6eO+ZCpT9t3LUBnEk?=
 =?us-ascii?Q?+txSMNLLRb/NBfywEiCZ2yJ4oD3tuGxoQxLoxNTPxL3LmrhsNF1TKxKyDlLC?=
 =?us-ascii?Q?vcrapKCWo63ZxeWwlXL7qheNYbDs9NY3OAvYm9q4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L78wn9RxO/FZJcML43FPzJQuhN4uOfrkvf3qKGg5pw87KLxoCh9IoMUyzqQc4Xn7CkWSGTMCscf3EvdmxVCO922xqw539xlv/uryDR6Id206uu8EpJeEXASU/ZTHP/0swm7DbeI39aPCKmtPgMq33mSLD1IlML1ClUeUYylnRV5wQny/NLJYvbCT6IpD7s3tGvMD6na6uVeBFBTRr12xtzkZEzX2X/6gdjwh5PhuG0G88l7jUC2VV5m8aFKa+4HAhpGXilHEzhgZWGi2/EsifA5mNK/i8qbrs3BIv7GoZehVOmSHXhFdURv79/3WAN81ZGj4QBCoFCsc2Mgg9HIsXK2Pc9IBK9bVAcWa6Ku4LOowAJZdK99xjDwTU/C4GykRrFBewIigZw2z4NR+sD93dsSdpZwEI82a/n9FdgtswKHIM0gEHpD1DW8Tb0SvFOjDGhMTERqk9n1k6W67HzApUEeYjdRcbnaK8dl5MJgfLCXgmKzHRGRQOD718sIIHUoa53lkfyC4Qum6l7fjo9Dl1OIiSBfTNrWSIQsJwyiQj47UjsKKrRNgejWVJQkod7E5N2cFM5lkSS74IM7hlaQ68AFnilD5FHmC10lYVWi0+eM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb239a23-77ec-473d-4a74-08de111a584b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:18.4939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz85UzFvOm3S8lkZcSlNdvZBkyn551qBoeWrTRigeSa6o+DUupYxQ7anWEdVFFeVlfEQl3AnBJvs3YAmMmvCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX3PuCWHHuc8q5
 uRvS9qc6XdZfqnZml2ggCJVOWN4jXTVu7TywRvBwBM7rcns34vfXMNB3f8M1ycypQLg4D16XJVy
 XfEIjBPVEcbv+ufVBCTaOG+q28kDLqsk782evgXlanE/CniZfYCo8C6ichiZTkJmzxPyRoCDGVd
 2rblhlr0g9r1qF7gc0gToPI96/6lr++NTvMVVbv+z0ct3YYPV6tj0aNgSFTGLTj5NjdMbChdyAz
 dG9IAyrrexHzJJNFnnqnYBzsDp9nv++ZISBZ04QJVXeEnQtssg1kQ1ZGVegJHzQL1EIce8AlI90
 bKolo9nG6nlc+vZr2wmhcH/pc1R47V70ZIbHI5hDYE+7MErl9NqEIOQd4M493P3FE0Rlb2sZPFB
 2f9BXyakLHFJuUvh9ibYeFdxm0jP6w==
X-Proofpoint-GUID: EGpU_t6Cl5fU6bwKgPUAmTA8jCh8tUz0
X-Authority-Analysis: v=2.4 cv=KoZAGGWN c=1 sm=1 tr=0 ts=68f84e30 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=iEjL8w5UfK9TKoV2nYYA:9
X-Proofpoint-ORIG-GUID: EGpU_t6Cl5fU6bwKgPUAmTA8jCh8tUz0

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |   8 +-
 doc/userguide/reference/dtrace_providers.md   |   2 +
 .../reference/dtrace_providers_tcp.md         | 127 ++++++++++++++++++
 3 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 doc/userguide/reference/dtrace_providers_tcp.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 063881c6d..fa9d9d021 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -259,9 +259,15 @@
         -   [syscall Probes](reference/dtrace_providers_syscall.md#dt_ref_syscallprobes_prov)
         -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#dt_ref_syscallargs_prov)
         -   [syscall Stability](reference/dtrace_providers_syscall.md#dt_ref_syscallstab_prov)
+    -   [TCP Provider](reference/dtrace_providers_tcp.md)
+        -   [tcp Probes](reference/dtrace_providers_tcp.md#dt_ref_tcpprobes_prov)
+        -   [tcp Probe Arguments](reference/dtrace_providers_tcp.md#dt_ref_tcpargs_prov)
+            -   [tcpinfo\_t](reference/dtrace_providers_tcp.md#dt_ref_tcptcp_prov)
+            -   [tcpsinfo\_t](reference/dtrace_providers_tcp.md#dt_ref_tcptcps_prov)
+            -   [tcplsinfo\_t](reference/dtrace_providers_tcp.md#dt_ref_tcptcpls_prov)
+        -   [tcp Stability](reference/dtrace_providers_tcp.md#dt_ref_tcpstab_prov)
     -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_prov)
         -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
         -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
         -   [Building Applications With USDT Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
         -   [USDT Examples](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtexamples_prov)
-
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index a225f4486..7da634d2a 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -29,6 +29,8 @@ The `sched` provider makes available probes related to CPU scheduling.
 The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
 -   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
+-   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
+The `tcp` provider makes available probe at different phases of TCP processing.
 -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
 
diff --git a/doc/userguide/reference/dtrace_providers_tcp.md b/doc/userguide/reference/dtrace_providers_tcp.md
new file mode 100644
index 000000000..fefa9d629
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_tcp.md
@@ -0,0 +1,127 @@
+# TCP Provider
+
+The `tcp` provider makes available probes that mark different
+phases of tcp processing.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## tcp Probes <a id="dt_ref_tcpprobes_prov">
+
+`tcp` provides a probe for each of TCP accept (established or refused), connect
+(request, established, refused), send, receive, and state-change:
+
+- `accept-established`
+- `accept-refused`
+- `connect-request`
+- `connect-established`
+- `connect-refused`
+- `send`
+- `receive`
+- `state-change`
+
+The module name is always `vmlinux` and the function name is empty.
+
+## tcp Probe Arguments <a id="dt_ref_tcpargs_prov">
+
+The following table lists the argument types for `tcp` probes.
+
+| probe                 | `args[0]`     | `args[1]`    | `args[2]`    | `args[3]`      | `args[4]`     | `args[5]`       |
+| :---                  | :---          | :---         | :---         | :---           | :---          | :---            |
+| `accept-established`  | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `accept-refused`      | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `connect-request`     | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `connect-established` | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `connect-refused`     | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `send`                | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `receive`             | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
+| `state-change`        | `void`        | `csinfo_t *` | `void`       | `tcpsinfo_t *` | `void`        | `tcplsinfo_t *` |
+
+The `pktinfo_t`, `csinfo_t`, and `ipinfo_t` structures are described in [IP Provider](dtrace_providers_ip.md).
+
+### tcpinfo\_t <a id="dt_ref_tcptcp_prov">
+
+The `tcpinfo_t` structure contains TCP header fields.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
+The definition of `tcpinfo_t` is as follows:
+
+```nocopybutton
+typedef struct tcpinfo {
+        uint16_t tcp_sport;      /* source port */
+        uint16_t tcp_dport;      /* destination port */
+        uint32_t tcp_seq;        /* sequence number */
+        uint32_t tcp_ack;        /* acknowledgment number */
+        uint8_t tcp_offset;      /* data offset, in bytes */
+        uint8_t tcp_flags;       /* flags */
+        uint16_t tcp_window;     /* window size */
+        uint16_t tcp_checksum;   /* checksum */
+        uint16_t tcp_urgent;     /* urgent data pointer */
+        uintptr_t tcp_hdr;       /* raw TCP header */
+} tcpinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `tcpinfo_t` from a `struct tcphdr *`.
+
+### tcpsinfo\_t <a id="dt_ref_tcptcps_prov">
+
+The `tcpsinfo_t` structure contains stable TCP details from tcp_t.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
+The definition of `tcpsinfo_t` is as follows:
+
+```nocopybutton
+typedef struct tcpsinfo {
+        uintptr_t tcps_addr;
+        int tcps_local;              /* is delivered locally, boolean */
+        uint16_t tcps_lport;         /* local port */
+        uint16_t tcps_rport;         /* remote port */
+        string tcps_laddr;           /* local address, as a string */
+        string tcps_raddr;           /* remote address, as a string */
+        int tcps_state;              /* TCP state */
+        uint32_t tcps_iss;           /* Initial sequence # sent */
+        uint32_t tcps_suna;          /* sequence # sent but unacked */
+        uint32_t tcps_snxt;          /* next sequence # to send */
+        uint32_t tcps_rnxt;          /* next sequence # expected */
+        uint32_t tcps_swnd;          /* send window size */
+        int32_t tcps_snd_ws;         /* send window scaling */
+        uint32_t tcps_rwnd;          /* receive window size */
+        int32_t tcps_rcv_ws;         /* receive window scaling */
+        uint32_t tcps_cwnd;          /* congestion window */
+        uint32_t tcps_cwnd_ssthresh; /* threshold for congestion avoidance */
+        uint32_t tcps_sack_snxt;     /* next SACK seq # for retransmission */
+        uint32_t tcps_rto;           /* round-trip timeout, msec */
+        uint32_t tcps_mss;           /* max segment size */
+        int tcps_retransmit;         /* retransmit send event, boolean */
+        uint32_t tcps_rtt;           /* smoothed avg round-trip time, msec */
+        uint32_t tcps_rtt_sd;        /* standard deviation of RTT */
+        uint32_t tcps_irs;           /* Initial recv sequence # */
+} tcpsinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `tcpsinfo_t` from a `struct tcp_sock *`.
+
+### tcplsinfo\_t <a id="dt_ref_tcptcpls_prov">
+
+The `tcplsinfo_t` structure has the old tcp state for state changes.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
+The definition of `tcplsinfo_t` is as follows:
+
+```nocopybutton
+typedef struct tcplsinfo {
+        int tcps_state;        /* previous TCP state */
+} tcplsinfo_t;
+```
+
+## tcp Stability <a id="dt_ref_tcpstab_prov">
+
+The `tcp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
-- 
2.47.3

