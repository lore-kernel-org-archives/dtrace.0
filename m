Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03E4C83
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825281; cv=fail; b=bi8ml71nZzMU/O6StvTgcZKFKV5lpAxd+bkk0iC/HLReJ0t8pY2L/Qp8AkOm2mQdMqBj0zIZYY0ebqYJ4onZciDZU9WMsUb/VH7rTDjCrCptnZqbRzB6+uJ0LoBMPE4e7LFu6BUXIN4ztpJ1iWDJI+etZg0g0djmCbibi7Dol/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825281; c=relaxed/simple;
	bh=3WqYxpAMBoCDFMX0W26vGrwwx9Zi+6+xUt/THCvxbes=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CzXy105tiKzyrPoTpx6I1R4TGIMDlLuhlfdRmKwVei725AnE6QjIJxAkTH/rO2xIoYgBqHo+0Vkyvt7rhFcYVDgfZIBvif1rB3jeVroq5RU7oYLOtfeXMsZM9mCQ1PgpjcskwC8XriLgU17/6Uegno2B7UtEMUAaa+aNpUh49uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eA8TOirb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sOke/R3L; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eA8TOirb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sOke/R3L"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMiejQ019013
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ipNpMoqQ7xdiPzHbns
	C76RcSgtKDU19UFVdHkThKJw4=; b=eA8TOirb4QuUENJlvhCZ6hyp1Ck8f50dmX
	LVhsJyZ2eLYBci2Lek6thnbUmGNyvdhnHGyOu9/7NEqqXjC059v+sXZjSRwQMu3K
	7PszGHJXyhifIRowjh7uQ1AnPMO8w3SbQFY/8VExPm8Ukj6i6noC6d8Y4OTxN8n4
	MIeF9DJdRiPbdGiZxT3Gp4wEZWTHMUzuymLgBlf0XFTzZ7o6KYa+hA2jRVEEuBCN
	d4wQPYLZg5s0AxsfvHHNStvAdzd/VNJmzLwE+3po+6OZSglWlkIWVS157k6NGY4G
	LKxZaap0/9KZNxX3xsEqFxzgfSx+W5vwdA7AojV6WptnsyWF9IWQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1bPo1007432
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkus-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXRyUxFe/zOSLDsy0aF5FBTmJW/upW9JAy4+vJ0jL+5mhFUBE8cwcJIKatSPuZCaaWZlMKozCj+3/N1IdIMbR42UCwmWWlbNm0Q9nu4vy0VjzftaJ7ABBdWc42c964CVIpFCV7UEiaTaYX7HtsT8ntI5X7tSjWNzxEqK9myXO1x8Qkw/XBemTrnAkkMXlHdXO8bs+KjQk0u6in0PojZb3bmeltfUZKJ/oJT6KxlG6YA4nfvv82duw45uZzA0sc5AWT+wxKGjcbionaJ4Z1s6NBLyb0iUYOtdl7ZYECnHqXwa51g5x8CKxBMyy/mO/qii/C88Pm05wNlQuFcUVaxbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipNpMoqQ7xdiPzHbnsC76RcSgtKDU19UFVdHkThKJw4=;
 b=mw4cVrlZiCVNWQLZcX8VviwojRQiS/kJre50vIMgooUDs6IlkOdpSzWL6sDd0ASgMVWW9jqW+IV28vckcw/RQo+fp7dimKzrXcHIvcJjdgkLrP4TL60kcRQ0STLIqt+WG3KIycRlCx1ponI5SvOU7a0qdEjpjRTLZ1pG8jf5LzG3wxpIZFYdZb3xCwO5rOz7Gk0QgHBPD3ARX8s278by6wGwFa4v5hRgDrcw6FjK1Ge/ti2HqJTmdAyaTrERdxRC2ce1fms8KE9KjfubUNDVbxolyzr2VyW7GBMA8hHV+7jVxkuTjRE4hLwgUItdnXKCcRkTajLtKNprMS3Fwq2QSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipNpMoqQ7xdiPzHbnsC76RcSgtKDU19UFVdHkThKJw4=;
 b=sOke/R3LwHEIJInfrMW0KPLDf3GTtcW1v08vgDh+CD4PBnx43qkM0O65VvR5Hh/NcwpoajxH2ZcS34BwClg0oYn+r53PQQ8UFeckyzijVwUBJzs3fQ+BPjH+vu/XTZYlZVWmnNwuQZMLgLam5O1mUvn0fvQiD7XGRDIxd8duqPo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 04/14] test: caller and stackdepth tests for fbt provider
Date: Wed, 25 Jun 2025 00:20:57 -0400
Message-Id: <20250625042107.13571-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c91583-d32c-4764-ec7c-08ddb39fb94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IkdQhXq6CvlRRND5D67l6NDcNtz+n6lX1AfQHHVXWm7AbtcP7TQKkGvwf/F8?=
 =?us-ascii?Q?PFlJqke1c0MtmrtdIM8dIQeWj9FDZN0dqIHQv1u3YYrlPmKxPZHmOvG+GZQc?=
 =?us-ascii?Q?MOzsImtSXKyemAL8moB9bsaiXVpUAS0/MI2QVGUPdsTwswEDQlI4uu8OCy+J?=
 =?us-ascii?Q?xIgH2hr+qMWPM8la58WmcCkPqmWDBifp8V7EAu1N2Y3ZxTUmrM/VwQVnsOCx?=
 =?us-ascii?Q?irR1hDkt8X4wRaOZScAImLfWQBnYapntTG10gf0hXVLrJJ08Oazilyi7WBad?=
 =?us-ascii?Q?7nyWMw5zcBwAs+fOLMpxXIbp5PT31seEIjHzuWp6aeQGZWNmpiCNVihMpfsG?=
 =?us-ascii?Q?NfVEkD0tyNUgV/aIsUBJWLNwKbbEtczqAzbIP03hEjj3DkGNTwLsILHQXhuX?=
 =?us-ascii?Q?MchZkzTSxbAuzba52ScEzyZRYtuJbN1NhEuCU1miaXnGuk1fB35isNyJBKHx?=
 =?us-ascii?Q?+y/TCpnHxIjGysrprtZvBMcjfCTGSt14UyJul5fDZ01pbUj+uUF4AsWtsW4S?=
 =?us-ascii?Q?VQklRMXkq+cYOrhMx3gAK2mw6Rz426sIkBFv3efjfe1rNvXMnL0Hc4JqdLce?=
 =?us-ascii?Q?L5Hj3Ot3550zmwUlxTeuEfRSPBqUvkeG8lJZxDxpUTTPsg0gbKm/A8JA1hP5?=
 =?us-ascii?Q?bJaf0wFtaEZqqae7Q4SG3lS1ETl5E/8YRHEEM87Legx567B/uc4wRYm/eAus?=
 =?us-ascii?Q?qtdr5uSn7PSezcffQCHaP3Pj7RXIupTIEzA4PAoD3K0hEhNMIk5KDhtj+I5M?=
 =?us-ascii?Q?NFBYEkKOx0StJ6WC/7OeXNxMOt1vOELbDN/j0O/49okbxT0Mvm7Zp04d4XDo?=
 =?us-ascii?Q?2H3Y2WOXbZUvK5Iyeqd/INB7d/VMZHzSwZ3+23NRrdu7WVFt9LJeMeb7og+X?=
 =?us-ascii?Q?qPhEhOrV6fm+5iHLoUxywxBAhynRfJ58+dzQbwmHasPrIczrCE7DFyHtaflS?=
 =?us-ascii?Q?m3WtHnfVUznMXPQJUW0inrJUqvDtgxuVKZPQKTSf0x4myYxa6vluvQaSO0/R?=
 =?us-ascii?Q?3GnJi0B9+GjjEmRBQpdWEamdmCXY4ROOF3X55Mun5hnvBtmRAgUkdZ9f03Ff?=
 =?us-ascii?Q?P4p0wf3c5/Gwk/MTudkCtb0Pzh4Zuk3hlZJpdHUR4tzWAAZ+45CkqG2yv922?=
 =?us-ascii?Q?tLgCSkhMQq7jOp/0VM3jWHy5tt4HH0f+07ryKdffqWDwmlicLVV4QdCYG904?=
 =?us-ascii?Q?4mMcc/veb8FALg5hdv/4VhkB+VFDUg2UAH8OZPbzVtMRW4CZ8doSCd+dgSKN?=
 =?us-ascii?Q?KXMBatnqg5etDvZBNmxOIWCibl0Vb8Ijp/9rw/AXDnA99LV4ar/k6k1sYhPS?=
 =?us-ascii?Q?NHcX/w/hq17JVcVaEz1zhNEtwLNoTXGe4IU4deSVUF3FwJy3F3imB81374r9?=
 =?us-ascii?Q?BSBkCjRaa7CGAWZC/m4s/fR2QH3IuTZBYB7VvBcGaGrD8po4e51hAQtnBkqY?=
 =?us-ascii?Q?VM3ouDBMKhg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ysZh4h+bI+Jz51UVXtzm/p45hjGznHUjT1Mhfab49X6ggekXNRSX3O2yNlie?=
 =?us-ascii?Q?ydU2Dgt/RsBPFWOfJLO2DNTxs0O1pYjlTYY24RFHYoIoQrSKDuwYMvjz9SIE?=
 =?us-ascii?Q?ddwLA/VN8BQbEtDX9rtne0vR30afEqyiDwfAnMoZYe368U7zcjAD6BGO3QwS?=
 =?us-ascii?Q?4ph27n6wngkJgD6sU3FCokPAHZdGlUkmFd5oziZKK5K6tmysWbzp8duZzSYE?=
 =?us-ascii?Q?N6uFKrQCstpTcdQhrbEkfeWvBWtrQ6cXXgO4l9/cRJClA75oHNiNG/3vlSSf?=
 =?us-ascii?Q?NMowgO/LgnT+EUVRiRS9SkIrEAquvacqQ3mJha5KL07XRQrRCP8kWmjvBNqA?=
 =?us-ascii?Q?p8xh9bHyWk+Ak1s+Cu++zsw87WPc17jhcjMM+dYcacHUm/UKDboQltEqT99O?=
 =?us-ascii?Q?g/dSHjWcoLexVsTPVDQ7lZAbxwmKemAdcvw7CaAGWa/hGRl1Y0mzoYT7IrZM?=
 =?us-ascii?Q?UjP3EB7xKd9iEQu6Kln6DkfqNRBww5jyNGMEFWsG624KnnGAIpV/jO+LerLw?=
 =?us-ascii?Q?cTRPIlpVS+3KQD1mL4DxplVLsnliPkrlsHLwVO1mPUkn6i7Uu9l9NgYc/LUw?=
 =?us-ascii?Q?Fy9MW6gteqZk2Dw4HgtfJZqDg4dYhJwwM2IBXnxGMIxq/4eQHqPn1rYkVZgl?=
 =?us-ascii?Q?4ormzgz6NV3VQEbFLEDyI8NvEIAGTsLsNkb2a2iTOPoO/LFGIhUTI2Kvcw93?=
 =?us-ascii?Q?CiZaOokuvJJqn/MKqSVcFB9Hf21XwLQcApGfmnUcQiquihCuMyeuxhGr7sEQ?=
 =?us-ascii?Q?UXvu8FxP3ZCa0Q4t92AbkHPoP8lvTISc76okFodRzFvl1ooYlWtg0RyUioY5?=
 =?us-ascii?Q?zCkChPy2d1e0yELcW4H+KIH9DUz4aLG2ERAcEzlWcNix+/OSRVJ0W/7S54GK?=
 =?us-ascii?Q?dxq+uZJWQ6YeCzkA6PxO9ACvqSbht5QUxSYPN10QlJPPAOqlsXZ4WFohRBqx?=
 =?us-ascii?Q?TBFrIc9/bwxSbQlGQo5XDiRIBPuwRsUvRm96/CjRLTDYzVK9Bw6SLrEWaiJH?=
 =?us-ascii?Q?8WYsXPG66m7Lp2tLP9THnc1OXuJjYj11SMG9QAjFyorzztVOqFsFpkkXA3Fn?=
 =?us-ascii?Q?oHZ5vZLCU7lrGiYg7wiGVLXPtLNFeYHQipy7pRq99sOwh9RAAYnCFuNUPJLz?=
 =?us-ascii?Q?oDQGVfaiu7xlhV1QhQZf3AchLjbFXYDbBVI8lXbMyNR+bCMRaJIL6Q5duNwK?=
 =?us-ascii?Q?WAUAg6mYYmClp+bruaRVyKtZb45/iL0Fv6aXkRawXp8U80lQRp9IfhYECahE?=
 =?us-ascii?Q?H8Iq5veSedVbjJZM4BToxaa0aGYjeCyC/g+u7POvsl+OcwEATUZJS2EoeCEY?=
 =?us-ascii?Q?57uE8gQ1A2YjoUC17v/dueE+yFZ5cKndwr6VgZVSncr06WRuoGJS1l7fa70t?=
 =?us-ascii?Q?Sio2Sc4Y6iJWcJ6Mv7myzMwl2SUAUgwT490rVWpIg1fnFExRjh8Q3LGZl5uS?=
 =?us-ascii?Q?vTAQZG/xL+LjW5BeaKOjLmy9oNPqye8WLWwl/7EW0rFYJGXu447AMt9TQrh0?=
 =?us-ascii?Q?yzZA4iji8F9ilGm5djbLWhBs3WiNsc7pQZNicC4WlkK6NjWM/NO7s3vz6qpq?=
 =?us-ascii?Q?+xCqlB9ijUkf15VfjEM8WTsfGRqrgaRO71/rxibW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V7ujcJ2pyHGubFADZZkvSdDDdNvMn6qeoj12+pDxGtmgILYZcjn7YbRdxHq6yC7JJ0A+DGf0+PxRtz8J+owDeu4Qp/yfmTF1m9gpHZxTCj1OcfBZlzWVbV4osAHYEHxQ2IRSYflHtkNWi+kBf5/M6YLTjFPAsTg0uX//97cZYcnEqwho3xH1bTXYsTWKSU85R1q9qFZkFzTAnOG1XTLMD8m8rnmSjgDi0EtTjZruuG0JMbCnPPFcbuS0A1o0zIr6JxjiuU01SZSfStJU+4Ny3hSdB8zcnMMqLzHVEDull6YY20RcIknJIEGx5xZsrFjUF608yKnRGowJdyUbDlHFYMem0+bvVdPkQE/TnypBCot1rbtJ3nNNgEy1aAnmvae+eDqh/lQHOHoUYPngqEbGAqatBFm1xfPtUA7wckrF3DgGLeNlTBPSR/WzckyXlOxyH6A4zVVKBDgBLKT0txDVhtwHZxPydhEKOD0O2AB5MFgzEunJjUw/1ukTXWVGUnr5ivHqcw5tvQwPAAvDU7pDHD7WAwbEqR6OY9uufdzExY3ruWFrfRq4xAUtzcazQ2ne5vb267JSyqDa+b/xBEOs0dckZ+RmnZ4dKE6tvATQX0s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c91583-d32c-4764-ec7c-08ddb39fb94b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:14.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8JZekJssDF17e1sEv4oie19+3sYAT75M27BUd1ypsejZBlwWLFxsc4ajFQHQvVA9s0TzGqzKm5XPAmba8a27A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-GUID: i_6xdJJuMFTbItwP-tC_r-XeQsDypfyN
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b793f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4xIc-4EMh5p-rtFnVp4A:9
X-Proofpoint-ORIG-GUID: i_6xdJJuMFTbItwP-tC_r-XeQsDypfyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfXyPkXfH/OxKsX ClYn2WyxefJYWm21Jm7dSgjE1UQtXmGaTcY3ZX4NdlGVLYLqYKpcl0oRg6HZm+NAtWutDciiJML M9menQMxi8Vn2kLkKLcSJUNWK01rBFcnL9aZXh5Y1wShGuer+HzAgDIr8WplbJSmE5QiXqfbfrt
 MM21pmBUU+EiX5tdy7UfwmxMQdGAu8M6uWr/bFG7+7mh2/rfjWSYRUv4VasVJ9/CxhDhZPNQIul V75Z9R/07n5Faoqg1CAL3qTqmnFhPGZ4iW4cLv5KSpKEyI8Yrr5y/e+eizeR1O2kydNI7Dl/JTl 6bby2f6/g6G/pScnsaqZSOVxiQ2Au3ODU4CeQ8xIjF4SMnHqUOlG1rAmNs+LZWcbfNtDo9+XwCw
 n3qnjSz/4C4BIAbStkfXV0JAzutiROki3d8aSGsrdpB1zlQAan9dZH5/tkc6ZY+dxrqKJMQy

From: Eugene Loh <eugene.loh@oracle.com>

We will introduce a set of tests for the caller and stackdepth
built-in variables for a wide selection of providers.

For the caller test, we will essentially call
        stack(2);
        sym(caller);
and then compare the caller to the second stack frame using
the new script check_caller_to_stack2.awk.

For the stackdepth test, we will essentially call
        printf("%d\n", stackdepth);
        stack();
and then compare the stackdepth to the reported frames using
the new script check_stackdepth_to_stack.awk.

In this patch, introduce tests for the fbt provider, along with
the support scripts they need.  Subsequent patches will handle
other providers.

The old tst.caller2.d and tst.stackdepth2.d, which tested fbt,
become obsolete.  Remove them.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../variables/bvar/check_caller_to_stack2.awk | 32 +++++++++++++++++
 ...pth2.r.p => check_stackdepth_to_stack.awk} | 16 ++++++---
 test/unittest/variables/bvar/tst.caller-fbt.d | 26 ++++++++++++++
 test/unittest/variables/bvar/tst.caller-fbt.r |  1 +
 .../variables/bvar/tst.caller-fbt.r.p         |  1 +
 test/unittest/variables/bvar/tst.caller2.d    | 31 ----------------
 test/unittest/variables/bvar/tst.caller2.r    |  1 -
 test/unittest/variables/bvar/tst.caller2.r.p  | 11 ------
 .../variables/bvar/tst.stackdepth-fbt.d       | 28 +++++++++++++++
 ...tst.stackdepth2.r => tst.stackdepth-fbt.r} |  0
 .../variables/bvar/tst.stackdepth-fbt.r.p     |  1 +
 .../unittest/variables/bvar/tst.stackdepth2.d | 36 -------------------
 12 files changed, 101 insertions(+), 83 deletions(-)
 create mode 100755 test/unittest/variables/bvar/check_caller_to_stack2.awk
 rename test/unittest/variables/bvar/{tst.stackdepth2.r.p => check_stackdepth_to_stack.awk} (63%)
 create mode 100644 test/unittest/variables/bvar/tst.caller-fbt.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-fbt.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-fbt.r.p
 delete mode 100644 test/unittest/variables/bvar/tst.caller2.d
 delete mode 100644 test/unittest/variables/bvar/tst.caller2.r
 delete mode 100755 test/unittest/variables/bvar/tst.caller2.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-fbt.d
 rename test/unittest/variables/bvar/{tst.stackdepth2.r => tst.stackdepth-fbt.r} (100%)
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-fbt.r.p
 delete mode 100644 test/unittest/variables/bvar/tst.stackdepth2.d

diff --git a/test/unittest/variables/bvar/check_caller_to_stack2.awk b/test/unittest/variables/bvar/check_caller_to_stack2.awk
new file mode 100755
index 000000000..8499852a7
--- /dev/null
+++ b/test/unittest/variables/bvar/check_caller_to_stack2.awk
@@ -0,0 +1,32 @@
+#!/usr/bin/gawk -f
+
+# Check output of tst.caller-$provider.d tests of the form
+#
+# {
+#     stack(2);
+#     sym(caller);
+# }
+#
+# Confirm that the caller information matches the stack information.
+
+# Look for the first nonblank line.
+NF != 0 {
+	# It is the current frame.  Skip it.
+	if (getline != 1) { print "ERROR: missing expected output"; exit(1); }
+
+	# Now we have the caller frame.  Strip off the offset.
+	expect=$1
+	sub("+0x[0-9a-f]*$", "", expect);
+
+	# Finally, get the sym(caller) output.
+	if (getline != 1) { print "ERROR: missing expected output"; exit(1); }
+
+	# Compare.
+	if (expect == $1) {
+		print "success";
+		exit(0);
+	} else {
+		print "ERROR: expect", expect, "but got", $1;
+		exit(1);
+	}
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth2.r.p b/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
similarity index 63%
rename from test/unittest/variables/bvar/tst.stackdepth2.r.p
rename to test/unittest/variables/bvar/check_stackdepth_to_stack.awk
index 9b071181f..fba1f4242 100755
--- a/test/unittest/variables/bvar/tst.stackdepth2.r.p
+++ b/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
@@ -1,8 +1,16 @@
 #!/usr/bin/gawk -f
-# Oracle Linux DTrace.
-# Copyright (c) 2016, 2021, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
+#
+# Check output of tst.stackdepth-$provider.d tests of the form
+#
+# {
+#     printf("DEPTH %d\n", stackdepth);
+#     printf("TRACE BEGIN\n");
+#     stack();
+#     printf("TRACE END\n");
+#     exit(0);
+# }
+#
+# Confirm that the stackdepth information matches the stack information.
 
 /^DEPTH/ {
 	depth = int($2);
diff --git a/test/unittest/variables/bvar/tst.caller-fbt.d b/test/unittest/variables/bvar/tst.caller-fbt.d
new file mode 100644
index 000000000..a81353335
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-fbt.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+fbt::ksys_write:entry
+/pid == $target/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-fbt.r b/test/unittest/variables/bvar/tst.caller-fbt.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-fbt.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-fbt.r.p b/test/unittest/variables/bvar/tst.caller-fbt.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-fbt.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller2.d b/test/unittest/variables/bvar/tst.caller2.d
deleted file mode 100644
index ca6dbfd22..000000000
--- a/test/unittest/variables/bvar/tst.caller2.d
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The 'caller' should be consistent with stack().
- *
- * SECTION: Variables/Built-in Variables/caller
- */
-
-#pragma D option quiet
-#pragma D option destructive
-
-BEGIN
-{
-        system("echo write something > /dev/null");
-}
-
-fbt::ksys_write:entry
-{
-	stack(2);
-	sym(caller);
-	exit(0);
-}
-
-ERROR {
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.caller2.r b/test/unittest/variables/bvar/tst.caller2.r
deleted file mode 100644
index 0cfbf0888..000000000
--- a/test/unittest/variables/bvar/tst.caller2.r
+++ /dev/null
@@ -1 +0,0 @@
-2
diff --git a/test/unittest/variables/bvar/tst.caller2.r.p b/test/unittest/variables/bvar/tst.caller2.r.p
deleted file mode 100755
index 1a26a4df2..000000000
--- a/test/unittest/variables/bvar/tst.caller2.r.p
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/bash
-
-# sed:  remove +0x{ptr} offsets
-# awk:  look for the ksys_write frame, then write the next two lines
-# uniq:  count unique lines
-# awk:  report the counts
-
-sed 's/+0x.*$//' \
-| /usr/bin/gawk '/ksys_write/ {getline; print $1; getline; print $1; exit(0)}' \
-| uniq -c \
-| /usr/bin/gawk '{print $1}'
diff --git a/test/unittest/variables/bvar/tst.stackdepth-fbt.d b/test/unittest/variables/bvar/tst.stackdepth-fbt.d
new file mode 100644
index 000000000..d33897a5f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-fbt.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+fbt::ksys_write:entry
+/pid == $target/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth2.r b/test/unittest/variables/bvar/tst.stackdepth-fbt.r
similarity index 100%
rename from test/unittest/variables/bvar/tst.stackdepth2.r
rename to test/unittest/variables/bvar/tst.stackdepth-fbt.r
diff --git a/test/unittest/variables/bvar/tst.stackdepth-fbt.r.p b/test/unittest/variables/bvar/tst.stackdepth-fbt.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-fbt.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth2.d b/test/unittest/variables/bvar/tst.stackdepth2.d
deleted file mode 100644
index 2b1c0866a..000000000
--- a/test/unittest/variables/bvar/tst.stackdepth2.d
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#pragma D option destructive
-#pragma D option quiet
-
-/*
- * ASSERTION:
- *   Test the stackdepth variable.  Verify its value against the stack trace.
- *
- * SECTION: Variables/Built-in Variables
- *
- */
-
-BEGIN
-{
-	system("echo write something > /dev/null");
-}
-
-fbt::ksys_write:entry
-{
-	printf("DEPTH %d\n", stackdepth);
-	printf("TRACE BEGIN\n");
-	stack();
-	printf("TRACE END\n");
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
-- 
2.43.5

