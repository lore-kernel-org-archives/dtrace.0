Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CE22B8BA
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 06:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733811669; cv=fail; b=kLmeWV6TIqzr7wxHeNKMOkdL/Esk0QIMPxjCWEbEcpexdpT1viekWpy2CmvuHk6RYZcqV0vdFLcaWRWrVWw2P4PUIHbDcuYBcb3R18Hf21cLDVVQstaq9bXbEgqWSzx20QsnR6tzKDkSegrk1GNrfV3aQCLhFPSS+XzOPUswrLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733811669; c=relaxed/simple;
	bh=qegJ73IHc8GqrgbwI9yp+xPPyjAR3t4rTEBR/SJ6e+U=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AiHXkV2Y3McGtQ0T8FUnq6si4eRmq+CQAwpw5sunwpETmD5rCil9CE8wX+Eg8DP307Ag32hym4OvuS1menUgtO8Ue+P92zt3QptzuUdn4SLKpaCQVbFHsgtJkBuiF9nHyWmsDpIkY51xfYZxDmAKuEt8kRusDtXKv/p4k23Y3Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ouVSeTq2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kXc7CXik; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ouVSeTq2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kXc7CXik"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA1BrlV012344
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 06:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=v5hSNJubXHIREGVeec5xxXDgqNOGkKIdbYsKJ8ksDso=; b=
	ouVSeTq2lNEfSCLmeVbStaozfVNPyyo7D0R6EHrVvz01/KeMWMD99oB++MOLVV1W
	RU/dg5rPclQAikz3lBWtP4Ummom83TlHyak/COffD1iVWx5pTPvH3yqTs8Nz9aSy
	vUEXfFHKeEw1FkHetbsEsac4sgUrwt++ElYq79QZpvuczUeGO0yMRSF4LBqyjO5k
	bqJFd6Yu6JMlOtaQaVPx9Fvyu27p9lm/fEf1NAdzjuHcG6z8xVkCKBiJOYSQOudd
	IDz3aevq+bhSaFilp4qo9paPKQZzp2lzkzluEDgbZqSB2JzVziG+QFGGgdCNCfsS
	CJYcb+KtPvuWjbp7J1H/OA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43dx5s23hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 06:20:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA5k5vg021234
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 06:20:58 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cct7wggj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Dec 2024 06:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxIaoKq5rKHvLuhh1FwueqPh3ObBGz5eDbctJxvpQCQWcSKgr+sc1Gr1rd2j2SQxBWX4T2DWq0H/gQSlLIkOrCVRVDv9+DXGZn+GT2noPJpCBp1XYYeZKQIBhAbLMNt8bWfkL8YJrWP049U36RwOmV9dc1jd+C4oTaWdjspM1++HCIk+OW+Z/+1Lc8s6adODo2YTUQiwamKm5Qx9J0mlRrNB4rv8amD6I6Po/9ShZr40JRH19Di9bUdq0lu7DnTJJ6uP4ViEEyWl5Jwh2bDvyiXXfx+LT6oj8Z4QbmK8dlQM4RRcjq0sHb9QTaDuxVbCcUPDKDsmPLw2OicV0HCU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5hSNJubXHIREGVeec5xxXDgqNOGkKIdbYsKJ8ksDso=;
 b=Zb99B51sQz/rp7m6cMAK6NBKQdPwaER3sJcP3vxlsQVKZQoxfNLrpXbZ+sbKB/fhrq7rGf7HHY2XGzJPY7cQv9xXDxMZMU3/vtLHaoBroHiWE8KW8gC7SRWg2jvHJ4/GXvk32x18x4QdgnfKU4hcf67Hfj03PSLetdQ8mDk1DB7+xB9DZ6th5dsiIcVecfOzjresPtSXpcxejTHYvrTOjxyhIhDuRMw6HmH22NEFJaK+eyv4NfBlhHRw9+kSUI6daCerp5djE7c7K8EPOy+5aHxy68lFuYbgO1GEuZIFn3zOJP/dTHySN5ICd4Xpydw7qB6FcJsoqhV9vRK2cw80oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5hSNJubXHIREGVeec5xxXDgqNOGkKIdbYsKJ8ksDso=;
 b=kXc7CXik8mN3+japmb+IjUkFx5ySkKaT8vRaQjAora23juTF47NjwqpteS5h564J65fPAzo5pe2Hw1on57NMkYXmWoOz4Ones8JwxXOSWCyHvQwofCyts6SWSYu6eql5YM4gvSiF9lytUPBh7eCPdhn904pU+96r7X3RdXj4qDo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7229.namprd10.prod.outlook.com (2603:10b6:208:400::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.21; Tue, 10 Dec
 2024 06:20:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 06:20:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Make tests more resilient to changes in start-up performance
Date: Tue, 10 Dec 2024 01:20:52 -0500
Message-Id: <20241210062052.9717-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:408:143::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: af9bca07-10f9-415f-6beb-08dd18e2cd99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mcraGsiGWU4UM3BphN9kxoLKQbv5RuLG64dHC7XGHwGtfe00HI5j/xCgHXtp?=
 =?us-ascii?Q?whgh4scEmaOxdA9p7XPVzfiPiBMdTesAwHQ681usk5Nz4ctzLs9BoK5WNdOn?=
 =?us-ascii?Q?ojz88ZuDNSbSd380tg4Vo5Fgsj3SLh8GgJMrYRTnp9nPafkMPUoSzBkNyRXw?=
 =?us-ascii?Q?pxzIimgMg89PpuHIq8jTxnHVygaIZdzTrp4moMjLdU43INpBGumYPWxAFnH6?=
 =?us-ascii?Q?kEq3Q3DXqhuea4CX0aWFjlhsw3m1MTuv7aqng3QJ2p+qqBsg92FBifRZxWbX?=
 =?us-ascii?Q?07MgM6D9WyLBaZ3eddbQq3htg2QIdyJ1M6F5RsYoHkHY2F507P6ohmhG2Cjd?=
 =?us-ascii?Q?Fi3TBX24W+NmIHMFCkQTfuVJyz29s8Adgb61zEO37SRr5ZZME8TmfdJkf04N?=
 =?us-ascii?Q?wlXn3lNjKreL9+YVR8MT5wA08UUd0tUZjrbU2mqt/hQhGiSWUTjIWPvTslBu?=
 =?us-ascii?Q?8Al3fAXOjXMRLrLUUkqig6dVqGdWfOfksuvYG/TKINN05ALwlSqK0dm3eDI+?=
 =?us-ascii?Q?U7w6ioWASjsWIkzjmM6rgmgcAvW3Oypo2OTZgTc/SPLHkjImaCedsvHW3r9a?=
 =?us-ascii?Q?DqA0W+YPThR1BLZxjYxlFzlebzCQUNz7bd19LtSAweI5Yre1d3hre9Xz91WG?=
 =?us-ascii?Q?y9XgoSmDO+xQvTlsBw1On9KCNSJR0Ybi7/01t8LhQgp9zQ/N5X8uYmWGz8uv?=
 =?us-ascii?Q?zrUvD7SGfxI8tttB2PzVS5VJEgcj3qRvEg3sOdEoHDxy/uE/KbdKjywjpV1F?=
 =?us-ascii?Q?DtwaCGsbygRjdZurVg6Q/wxzj0jbPw+vvtiOsPp+stXDOdFN+Cnszvvtuzlu?=
 =?us-ascii?Q?8G86eFfEsK89Cn9DD3QJpNXjiaCXJQxFKdoe8xtz5tuUmeR3oax72R7FudOY?=
 =?us-ascii?Q?LM8eUxwyA8B0amN2x1EaCRBsik5TrEPdVH+ZIzEi9OT69VEAXvxFB3OyGZXV?=
 =?us-ascii?Q?hKELFiRxTzs3AI7Mce2zGLKzvNHpTRg5smQskibwChI6bJi43ies9M5Ozee1?=
 =?us-ascii?Q?uQ9A/trl8z2oNL3wJNH146y07OCg/1KGALeDBfFuCgFwqMDgoMUmfahKUbp1?=
 =?us-ascii?Q?ii6eD/jIKDOTLeizbMICnkxTq5eLdnOSNe77rJi39GXBYN/sFPEpNABKmvQh?=
 =?us-ascii?Q?C8Pvv0nhLn5jHqdBLCCY4I6UyWIJ/3uCXrRb3i7LbAHnvY9NZIzK4TcfvH1a?=
 =?us-ascii?Q?o85XBVAf7BC5uvAayJIX8AMPU2YDg98nAvOH1lFsqfhc7F9OOzIbE+A9ycBf?=
 =?us-ascii?Q?R1mk/1JLmJbq8jerrsxOMbS4QUmI+XwiwVbVhNtW2LCSw4sMXcj53Z418Q+e?=
 =?us-ascii?Q?HQj3uLecilFzhrHfiBmaHB0sN1hnIavoWooZz2rGhsWFAdGi3PLo9N10bCiT?=
 =?us-ascii?Q?qY3DQlU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gg/DddslVh6v2IagK5gKPehPceMSLNIiczEArqmvjI/VXM3ZpR62oYPAVW0n?=
 =?us-ascii?Q?ZYnx0NrouZDgKn63mm+reNf0B4ga1RJjCUv27/kFKKznylIwaJfOwf6lekDG?=
 =?us-ascii?Q?gtCMTRt8EqPpZTEv3CotiIXs3AqJmDiwZfT7njM3x1ylgXzFBDGk/N/SrMAV?=
 =?us-ascii?Q?vEmwKDV/XYKAf+c5dczkPpGSGiBsH36nvdIi4KQpXulbINd5H43OClDjX/dv?=
 =?us-ascii?Q?T0nfVLMW9bZvw83JL242XfMmVaXJegAyJYQYZHJWSLW2vK49iEONdOX/X3Ye?=
 =?us-ascii?Q?YpNxXJO5cT4hZE8VW2M5rT6qnxibhDla7Gt4f3QF4XZrU8DygptGFPZWbWBN?=
 =?us-ascii?Q?/uimxtGcE/HkW2cHuj12eVNW8kLdfEyO1iPAgZSQpwDFVU4g4jj9L7olV+Ck?=
 =?us-ascii?Q?wZcN5uqFgHZB6lafnoWT1vfxB5W5CECGj6/bjT+YlHWuchNxz+ttOkPoq1/g?=
 =?us-ascii?Q?DfPViIr6RR39qiB3PlJ6BzZo9FLFQQ6Uf/yiq7H/I0F15o9YImrzvRhKQJ+y?=
 =?us-ascii?Q?TyzHETjJbfVnKYDn+LFsXiehtjb0GKJsuVXCOic4u9OVskdSoozczUUd29kh?=
 =?us-ascii?Q?PjrpTESB174yDTiBCGYB0gN8kFcGBKj9bLHBo08JysVXHpYh6REW80KPvRnA?=
 =?us-ascii?Q?Iyz69nR4seDrS33Jr+Jc5y+Eay6N8Rntba+ckXT/fd69vd6jTnHvIKKCK2jI?=
 =?us-ascii?Q?UGpsyYGjUsZFnF5WD1SgqzysS0L+mJEPHYfOsweePN347zsGP19n8Pc6EOs2?=
 =?us-ascii?Q?8hb33XQn9Ki8jpV5q5vN98gdnNGJYrOebnKlftcAXTaKXw5etmOPCCf98R98?=
 =?us-ascii?Q?KQzBN5Z2MMC8Ufol6dMzTewCWZY7hDxijw7R52xkJNyRTnt4x/o5tQte2qzi?=
 =?us-ascii?Q?vq1kBmde+u3IXsuJfze72wZrCSG8sUC6NrOiDmQhtCv5LX3qQBVfizVRcUfe?=
 =?us-ascii?Q?A1IGgf90YiAbPexSqOgBl7ZGCuJlDrlLIdm0AigfLBmJ1yIjEpQSJVni+wyo?=
 =?us-ascii?Q?yIVnQr+MFtj2g+Gn+XmEodp/mHfHHWkcoPPNJIj9rqHBlXnFDVOqo5DIvuHL?=
 =?us-ascii?Q?nRqGUhPld5i1H+955W3/e5yagwGChH4Zb99klPv4Za4PB1c0qcAENFIKoe0t?=
 =?us-ascii?Q?47jqZcUqBd6qi3rw9zRSbPA5Fg744vh5johI8/hhSmAIwhL0N/wwQDbqQicf?=
 =?us-ascii?Q?Wx+kdA4pS8uMUfymnKP7FpV3iO2TSjhLeT3ejKzmMSqZJyaZy4G/YOFGF6KN?=
 =?us-ascii?Q?la3Lk9ts9jatpH6IjPaOkvhYnr17lZUYoRinSGmvQR6kkfrjdxbft/PnrpoT?=
 =?us-ascii?Q?n0zTwmiTt2ObMdYEcBvy2qTwavFx0CSUG7uEhNzvRjcD8AI1g03rZNTXwxW4?=
 =?us-ascii?Q?Q6hl7+M2BBh7l6YOy9Zyg4KmZyb1yYzamUYMx9QjxCon7Op5BFQPvYw2Bge4?=
 =?us-ascii?Q?L7OP24DRqJ/eWsysUtxvenQFCIMurucrQK6qjklNO4xBBhfs0A3KTLQ2/WC9?=
 =?us-ascii?Q?5LryfYGGVA+1xmAddKU+2OiE7gfa7XJMY7HT6BMjbWAbFlUxyGO1CG6FR35U?=
 =?us-ascii?Q?1ilKup6hhMbRLdrEpy8QsJZobxoXouLO1CJMM3Eu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	49QV8/zQX/cjbXhlrjQcV6UezjIidJUnaPmo0p4+3w7cbAv4qMRicjXZau04/zlm9aQ2ZFT8ywB+ZDdmpUoZQ4wHL+g+P6W9hKWxZ4lWC3Xxi2tmrcEZdNiBYy18UMFAZhj3ylJm3mK0/6Ez1+1SZJwXoRKkMUWPgwnCRUQ7c1rq7oTp+VJ1LNMr7SZER+MMOW/0y2R+78ueAuIU723qA+RrLI8ZtuYmjtYXwucYe8VkSb0RLFHgha3LTlSSSlfX8wi7HNfyngjmRegGOcJUnLnzzHG66PDkcgn1jqxxp1bMX0FIbxJwo/krAzuBQOEnJBbZGzi0s402Dgx6sWFA1niiQPlc713CCj4r8fywUhMviWMDVCJfohvxcKCQ6DbA+cEFXmg9weVU9LqEHmtorOyejsdi+uIZYQm5Vj35742a5L027AggKo06ui3OZQ4MbmDvOkLu2dO+FzvhpJD3TejbEW8kxrgjMZLV2st04dfBLDXbCs+pwno6pINhLiXsZZ2nwIvoinaFi6rjRH6TvtZx5YjHpGX1PX1CJ1cc3srs/GnFafCUc7Li+lx33LBX+QK5qUS3uRXU8Jp/5gyb4CEbxAtncdtzGIAZm1+Fch8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9bca07-10f9-415f-6beb-08dd18e2cd99
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 06:20:55.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sL/2HOU0JhvgkKbn+Cm007wlqLPqevTa4UJSU0Kxodt0eaPgoAiALgMh/bFbLTQc1rPc0x5LAIni6IRDsdZ5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_02,2024-12-09_05,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412100046
X-Proofpoint-ORIG-GUID: SIFllqc8NfQBwPQ_yc7A5X-q_uqNTwGZ
X-Proofpoint-GUID: SIFllqc8NfQBwPQ_yc7A5X-q_uqNTwGZ

From: Eugene Loh <eugene.loh@oracle.com>

The tests with no target might start dtrace many times.  The test
time-out values should be long enough to withstand many starts
even on slow test systems.  Use time-out values for dtrace
start-up times of as long as 10 seconds.

The tests with a target might start the target first and then
expect more than one dtrace to start up and find that target.
Make sure the target runs sufficiently long.  Do not worry about
making the target run too long, since the test will kill the
target anyhow once it is no longer needed.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh     | 2 +-
 test/unittest/dtrace-util/tst.ListProbesFunc.sh         | 4 +++-
 test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh     | 4 ++--
 test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh   | 4 ++--
 test/unittest/dtrace-util/tst.ListProbesName.sh         | 4 ++--
 test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh     | 4 ++--
 test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh | 4 ++--
 7 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
index 2184f2bbb..737f2cc88 100755
--- a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -53,7 +53,7 @@ main(int argc, char **argv)
 	TEST_PROV_GO_DOUBLED(666, "foo");
 	TEST_PROV_GO_HALVED(666, "foo");
 	TEST_PROV_GO_VANISHING(666, "foo");
-	sleep(10);
+	sleep(1000); /* long sleep is okay; we kill the process when we no longer need it */
 }
 EOF
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesFunc.sh b/test/unittest/dtrace-util/tst.ListProbesFunc.sh
index a311da217..b14aad2f5 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFunc.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFunc.sh
@@ -1,11 +1,13 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2021, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
+# @@timeout: 100
+
 ##
 #
 # ASSERTION:
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index 587b2ddfb..f8083f2c9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -49,7 +49,7 @@ int
 main(int argc, char **argv)
 {
 	TEST_PROV_GO();
-	sleep(10);
+	sleep(1000); /* long sleep is okay; we kill the process when we no longer need it */
 }
 EOF
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index 1c5cc986e..dc6cb1008 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -49,7 +49,7 @@ int
 main(int argc, char **argv)
 {
 	TEST_PROV_GO();
-	sleep(10);
+	sleep(1000); /* long sleep is okay; we kill the process when we no longer need it */
 }
 EOF
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesName.sh b/test/unittest/dtrace-util/tst.ListProbesName.sh
index 6fadf9482..4dd3cbcff 100755
--- a/test/unittest/dtrace-util/tst.ListProbesName.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesName.sh
@@ -1,12 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
-# @@timeout: 90
+# @@timeout: 160
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index 865e2d00e..59b8dca56 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -49,7 +49,7 @@ int
 main(int argc, char **argv)
 {
 	TEST_PROV_GO();
-	sleep(10);
+	sleep(1000); /* long sleep is okay; we kill the process when we no longer need it */
 }
 EOF
 
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index a5e9b8b97..64fc185da 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -49,7 +49,7 @@ int
 main(int argc, char **argv)
 {
 	TEST_PROV_GO();
-	sleep(10);
+	sleep(1000); /* long sleep is okay; we kill the process when we no longer need it */
 }
 EOF
 
-- 
2.43.5

