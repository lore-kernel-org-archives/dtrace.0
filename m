Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425521D3F8
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123785; cv=fail; b=rD4/AZvjK5zvOFJ3+n54NxaunN3SxX5gnTmESA9dxf5bofdKlFZjZOioNKfrHV8nzqrGXIa80eWRBKv8pF7QlJ/hB3ZdondelDIRVeBcZ1juuOB9mFRR1sR9t6XpZomVg2LG11iuGUpf5qaOl+kWHsWejnfhl8JsEhk9DNUD7lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123785; c=relaxed/simple;
	bh=byZhQikKhCKmL3HfqfupkyjDkdvENOzOfPizZpKb+Is=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l30GsqO8mD+tuH44+VW1SvMRYKQ2ugtZrtMWF/UVSK0G3OxhJ4XXYHUxTnpk8sUMOwejrrEn78k6hOpvv7Ywp04mOfJSrxmzufdiBhbQX3PXNRaQp5JTTBCPsq79A+x88lkYiwwMIGEdDCi7thh/Jdb4+X4qiE9+mOjWO8oc/zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XUJVX2xO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cLhXIg/y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XUJVX2xO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cLhXIg/y"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Hu07h017333
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oJeAjgHJHaiE6kujRJ
	EVTBC/a5lV8r7lDng4sde80jM=; b=XUJVX2xOliWHh1+2yWLRmUAPixyiZ8fObp
	PlqZ/HPR3I8uL+/bUjT/ZynLTTcsH4VT3yOdKPVtwzztBRA9HQ3sKZrEhM/ERgUM
	HCAIDBp6YkgO7xu928PPVe4qQXFzvwRqmPjyWtF9wC87B8HaXVbePV01li/R0TRx
	0IYwSAe+qy5kiencyYgui6SpvMUvcX8wCnk7zw/P0nSE5w/qro5oALkHZ4tGhANp
	xIxP1v9eX5xp50m2xB2mqLcYf2U6WvmiD1fLJKZEXcw8p1paV8WXmIz7xfxBJ+/U
	wsndgV7oS2NndAbULSYtZ+js6DUz8FQbz9spCk4tocSfmrHPtqag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uqkn6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:23:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541HDvZv013857
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:23:01 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012033.outbound.protection.outlook.com [40.93.1.33])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcuwrw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:23:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkKsQ52v6WPAlpt0OiHuyC2MbYModK4wobucGzeUxQvouaavA9NPR7aOGCtzCG+1Gpa4pL8ALtXW1qyN3wJDSGL4SWB2U7T6jyAtLi6DUlVwautRK4yk24LZvMkNXjocSo1h4xZRiqCRJA1D171wVzWFUe84Bb9lWO4Ynvt7JOy2erguvE8shk/VjN6D14eCOnJ99NoODgtUrotBlMUeWhZuaEOgIFs78TfIlId+zrlXwsgP9JoXBaueCIlPyy5BmucfxnPQ4xHDDSPFWLDFZQeptwqZ3E2hHgBigZBOe/opt34vzwRAAw4/SChBQDiyssGoaMda8/QIxBxchz0f+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJeAjgHJHaiE6kujRJEVTBC/a5lV8r7lDng4sde80jM=;
 b=QXTcv5lO2mQwSpV4MEkSzYOzTx3NlwI/j0uhiZOgT7zDM1frYaUiKf/15PkI0bHu7Bes7nEIaFu9q0fN+2TCR65HtSIyLDAvPyxYHlqHL8Fm+NgJMj8iy2ZVO7wXO1qYtGn9IC1115EwB7VH/+B9iZd7RJaaTLsMsDhqzTeHdMyUbX/k26bppRQFLzNiLPdDsS1OYbjwoZuqgb1YmAQZjc36mM7XuCzO4WkG26ic+7RcJa0OIa5P/GA4Gto6CWaAmNt7G960zAhOjXyLdC0VHgdQ0RITOUfyfWUviEKGwXRU3bEEk7nxKnUxF05miDnriVldpuk9bspCUKt7DqGSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJeAjgHJHaiE6kujRJEVTBC/a5lV8r7lDng4sde80jM=;
 b=cLhXIg/yJaWyFiVwIxFginxxQOzc+ciCWnKgOrbAXZSt9o2eWTObXaVUmMcW3g07YshZbS0utbe9lvOjs57JOD7wj5tKKzUtUZSZM7Wepnb283CI6Lf9f3H7FGewEhBWMibru+IpO4ErEp82Cwcm9JSYpfr/Jp76KX8y1yM49ys=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8321.namprd10.prod.outlook.com (2603:10b6:208:575::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 18:22:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 18:22:59 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] test: Convert tick-* probes to ioctl:entry for tst.trunc[quant].d
Date: Thu,  1 May 2025 14:22:51 -0400
Message-Id: <20250501182252.27772-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250501182252.27772-1-eugene.loh@oracle.com>
References: <20250501182252.27772-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0903.namprd03.prod.outlook.com
 (2603:10b6:408:107::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: d03081af-a392-4ccc-ab79-08dd88dd3389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uwK2Pi2SSGOxEa7lpgDHQK1QuoO4SK0qLhFxdHoNkqrGjbcoVdiQaBMly8vB?=
 =?us-ascii?Q?ab5Yntv8K67k0VKyQD89lSUxKmV1fwaLhj5Cjq3Joe3fk8Aoe/7x+SHnUlw1?=
 =?us-ascii?Q?u+IZhUDVRMfByNIQQAKTWRi3Vwszz2US5pjT5UUIM4/xvl4Y6/QCkNq6EZKC?=
 =?us-ascii?Q?nkyyun0L/W0eYwCqRXLceWxBw3izuff+/RK4okd5Nf9qQrkq0ewdPks+l0oI?=
 =?us-ascii?Q?25rusPsLk90tVkOhP43ztMDeyLoi+eLiif8zrd3iP1VheolQarXgLxvvPDWa?=
 =?us-ascii?Q?R9AWCo/ksw7XZPjOY0vQVl5UTML/XZzWvzw++4NxwPVxGG86JWp3tf6jDf0v?=
 =?us-ascii?Q?BEW34umQKCLc4vQe7WxKz3OupHoVXmg0zVboZfDMaA9DE8sCK+IuJ6mxbuFI?=
 =?us-ascii?Q?/fZVwSEXaQE6N0skG3XLLOkTOrA25DTgfSVVD2q+4EgcX8DSX0xMlVoq2q/l?=
 =?us-ascii?Q?ZiBVV+X4nCCnfT7SKOBFQejJs84SpRdQZ3TlIeQD/wJpGW8JMRmFJSYLkUf1?=
 =?us-ascii?Q?aq2snDXzOgVY6g1VUVWR9ddn7zgWOTRUDLdmGwaE4gBt82AvLjMM7vEj9Rzi?=
 =?us-ascii?Q?o7nqbCpR3m2ckNaKz1PdVlB5o9ldxsYBNgvgdKVGdHy1sTO1+FHROZ0oBRCN?=
 =?us-ascii?Q?OgRrrKh/Jb1AcCKDy6ZbE72ekqoUY3mBi1eEz0+/aeFT3XFoBMYnRhxchQYU?=
 =?us-ascii?Q?ss9uRH3DH7OsNeF98OgEiA35nKD04CKJkHTvdhW6rqzlBPcYsfcIAX2U+YLA?=
 =?us-ascii?Q?LaDP/gpbleVcyDn1+LWbu9GdrXXr07fpAFxG0yEEOF/MSt+pSqLOmuULVY/G?=
 =?us-ascii?Q?mEudgPEA9QSLM7G6aNidpfJuMMvg496DpEeUi+xzlyx88kEwiHTJ7b6tIwoL?=
 =?us-ascii?Q?D+lZnmjtHeN4UC+a7cCmIo8c1bQFb4BASaL1A7yN43z3YarQMAGT5xMT78rJ?=
 =?us-ascii?Q?Y3EAUYQZ7vSADUF1mUNYBALOXZDKlPsNpUMqbCSIj+UIlGIl7sSyy0BPFPnQ?=
 =?us-ascii?Q?KjB//HLYCUecEb9EM5tTxzfPkVTty5L459wcwVJ3ivJ4Zf91G40xykAv2KiQ?=
 =?us-ascii?Q?amxzrtEV6KZGbiX8lvyHPdQM2ULVoO9bpxhn1BApRHniFddJ7EBbNQqbA311?=
 =?us-ascii?Q?YN5TPl+Y/6ab0s9nX3767TvFGIadI1UPl7oJ4oCjbOG2wXdyETiH8+V56Hos?=
 =?us-ascii?Q?12UVOiCcoYaY7ZMqubO94SW+Jth5/cQmfT+lzrsoBIFf2VJPq0+UwA7MGIbY?=
 =?us-ascii?Q?BYsl0FHOYrCj1xr9fpB9GBKbIV9AArbf/soTb404KSQAXEFuW9ng8mrCo2wc?=
 =?us-ascii?Q?YsHlT3HrnruwPH3rC5b+SfIgOBwtNN2e+gGo3mo+NlhEVb0FqpYS7zbDOhZ7?=
 =?us-ascii?Q?8wsJS9uLOvUspnt7nv4eBPC7qSB26VRPLsrwCiiwVm4orqTymlWzoEzYlK+j?=
 =?us-ascii?Q?5k0Wa2Q/Q2g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDYVTHA352M0THwD7gkcj5q+vHGS/OkhWu7ELJuU0givcbnKe06usg4qxV26?=
 =?us-ascii?Q?MtmVkKWsweOMSFZGG9VBQTk6pFSsBeVs+AEhHIfijKuaH+22Kq94Pc27S4Uj?=
 =?us-ascii?Q?KED9WOfqetbK75mgXFqjgDuCtU/JDzuNyXDD5xZn8s+AxJtKYbcf2jycq0TR?=
 =?us-ascii?Q?/8/o5QCC4S2QPZ5ZY2vFJBU9S6uDSgDco8xzniUpq9O30K8V/l4aLYJ0Esfg?=
 =?us-ascii?Q?z3pYP/DcQ5GuGpMnFEgFv8m7Jno7aroCLlARYgpRsuY+9yEWjZrFX579Fccc?=
 =?us-ascii?Q?1mUz1S1WqR4r3MSGSbm3I/D7ruNrvit/+s1Wlx6lm1II/9Z3GDiYf+scIVXq?=
 =?us-ascii?Q?DWX+otgqVsqVirU63tYrHNlLNrdbl0UShqX7FailRbtBIHdaAXQT0coYid7K?=
 =?us-ascii?Q?153nAxrdrA8Tw+UXuKa0oFp4+PegJRaJbMJmbGsc8eCen1V7e6go79mMYxFx?=
 =?us-ascii?Q?ngFsO/PFnsROFU26mTsDZThhXAVHEHfVS0viKUhCMKBKNHbltVR8bIAAkoN7?=
 =?us-ascii?Q?GLffcD1fVfPl7rllVLDeEHzyObomrcjhqzXXOLIGI5+i8o3w4iT9xXKMAQ7f?=
 =?us-ascii?Q?1tMEbpZ2UXskYTRFBC/3/7m/PJP7kUpzkUkCLrSRO7bQMRUFjJZh4FllO36j?=
 =?us-ascii?Q?ek0Av6eBPuB8mpUuSrtYlL7v7FWLc/Wz7ZASL7lV3lD8SWeUpBwdC2p1kVYG?=
 =?us-ascii?Q?pOXz9Ul1kJeko5m6RNs8KJFMwoOxmXM6jsttu5VuahFLnBobYKnsNWAJngb/?=
 =?us-ascii?Q?0JzefPVm3q7esl4JlxnJOxuzHNVFCD8Ky6h2+snWgJbPsUWKXncJCqFubauy?=
 =?us-ascii?Q?A8GWaapgPbyigNugaK5TubXQh+pIS8tz24Zo2G3GFSjv6lFZWkHQxff+oU+r?=
 =?us-ascii?Q?RJv4qIUXbwgUWW5HQcQm60gC2CT0vLpcgi6GuoSYAeBlwztkWFQhVt3poIim?=
 =?us-ascii?Q?H/EQLXCNfJnp5uSetf1wVINpqO2QiLnj6seteaiK7IzX9UJG/j9FLxJiZKbT?=
 =?us-ascii?Q?8Y7+Wx+WP41EgB+xjpyDOBLP+7B/EBN5/dHrfTNfoccDiDHupZ0f6G8lPpwK?=
 =?us-ascii?Q?g5xZiOpDH+uTX7fhlFXgMYLFXgePotf3mSrGdPqdLCt1GOrON9DV6gQbbmV4?=
 =?us-ascii?Q?KHGpHlV5UYNtUo9TqP7zMvQdZZ/eK/fuAGDIPrnw9fv4QECDylToar4uorKs?=
 =?us-ascii?Q?hl0FrQ9qS51w2aKYUDxbJw9gzVReSwxC0N7hKX4ZbQ/w7h40CoTAoCSd9ITl?=
 =?us-ascii?Q?uQdjvJghDbDELhGP0f6fDd91t0KjHInGEREGiLfHs+MgsXFQTV6oFSq4hyBt?=
 =?us-ascii?Q?TR/Ug11rwKSsCt+TkNs2o4cwNRKKNca4u9J2GNWm1/PfJ13+2E7xeRFyqBjy?=
 =?us-ascii?Q?AoW7W/+1uRnnaj5pQK95UGN05u1AqqZUz9nJL5sdhE4MhTL7Eb62mM7jvixo?=
 =?us-ascii?Q?bvgZ7yzF+PJQkAWtRBeoJXACcA5WLW7D4BjPLEesck5fqlyQdantWg0RA9Rz?=
 =?us-ascii?Q?Xr02lO/ZZbQQ5AsFXjSjesgj6YD1iyBsPUlFCwphFCCnfBaUZXxP/A3PhO/f?=
 =?us-ascii?Q?rCjQhGfUUVAZF8Kb9wLraHk1cc15ewpfpRpNr5v2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uyJC8Cqn2CfsI2jzzVZIj27+lGAPhkMdeqMONMIxydaj2IBp7CzfpSf9hzc+tGyaI/6rLiHf8PYOdZiT/51JzISfCB7XzIOxEhyC8LsdegS0XaotEEnSawo5NCTZ6BdaFIg0Vn4cYq1tpUn/tT7XaCjPYRZxK3+6EZZ+mBuAPb9prFhmxiZFlbk+5Ta/MlxYL4Hv0StvC47nYa23Ty7eeYk4uCQZVJUszPjGoUOftVKdbM22xe6hXTOSa+9y23nbwIHaLi6sFEdn1GXhGRoEb9KG1OR2o/xYxLUPmjkwNI95XLe7MAxNaHu5BT34xxE31WeWHnAymfydbVO56Om68YlHl29VUZ1BdE0TT+j4TDzdiB7u8TZtXNB2DYBu97okGRxH4zkmpGOrVr+mWWfYFs4IQvsRN3OFxhto9X60xMKZZUcXUEsDJsWukV3Y80+4NjfhgNtJqNbxfoseMmMfYrzNfgUQlSTZ1gqWjasI8q/5FmV9rtxVL2+u+P+ZkO4Pk7rNKpFx/jfQLYPHAViK+e7+/L9J4nvxL9QIyJexqZQRLg39SmTv+8gI5YT6IYgfdyLftt2A6YmX579g0BNDfg9ugAej1aZHNPDLC6142sA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03081af-a392-4ccc-ab79-08dd88dd3389
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:22:59.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kP/EtF8Btxu9ws1BvUoxTQ5HD1D9KyDpdj8ctxm2fJaKHFYXh6OT9R9m2IJ5mLNO11bROBcTeO32fmtj+Oxo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8321
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010139
X-Proofpoint-ORIG-GUID: dHjD9jrtFW9sj-iMvIxvPA98map0kXoR
X-Authority-Analysis: v=2.4 cv=Vq8jA/2n c=1 sm=1 tr=0 ts=6813bc06 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=RGfX4nZaH8jZ1AlW1uMA:9
X-Proofpoint-GUID: dHjD9jrtFW9sj-iMvIxvPA98map0kXoR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0MCBTYWx0ZWRfX3sKvcTEpcgQD i85arXfHF73JX7/zI/Wc+x3RPhpsK9s0SXnNBqVtmvpg+eFZSrNXno4KNKImYTW0EY3fFV7nPys JIHp/eTh1PHhp3uW1RnIOtgl6GeAS8TPyKQuv7ozOUb64cac74/1CKC2y2n/EXz85sLHmdq6CcL
 kM0AmVIpy7P9qYvf3JkDjDmueXT+XjHEvp0Us4r63uZXaMr4e0Y7UwBQuniJsEddcxuzZWvlH/s XNKbN718dQQZvdTdSqmSHOlisEhsKgurMmxoLrKNjhIbDae8GN+bY7DBp1YTLPY2XjAkhzYwOdI jKv6ixr5nDEOnFKgISotdNelnh7K/qh8tzn5kZFpJ9ehcXmjo/GJDk/wX861G1tg9CD83ncGBoV
 9HdEV+vdX0SLEPiJqZ0toZzWPfHWIBd0QShsAaX9WoDjYfEeHB+nYb4Q78RkrksxMQSToTux

From: Eugene Loh <eugene.loh@oracle.com>

Historically, many tests have used tick-* probes to get multiple
probe firings, but those probes can be unreliable, depending on
how a kernel is configured.  Tests that required very many probe
firings have been converted to ioctl:entry.  Tests that required
very few have been left alone.

Convert more of these tests.  They normally pass, but with erratic
execution time and sometimes time out.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/aggs/tst.trunc.d      | 12 +++++++-----
 test/unittest/aggs/tst.truncquant.d | 12 +++++++-----
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/test/unittest/aggs/tst.trunc.d b/test/unittest/aggs/tst.trunc.d
index dbaeb09a8..044afb3a6 100644
--- a/test/unittest/aggs/tst.trunc.d
+++ b/test/unittest/aggs/tst.trunc.d
@@ -1,23 +1,25 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
+/* @@trigger: bogus-ioctl */
+/* @@nosort */
 
 #pragma D option quiet
 
 int i;
 
-tick-10ms
-/i < 100/
+syscall::ioctl:entry
+/pid == $target/
 {
 	@[i] = sum(i);
 	i++;
 }
 
-tick-10ms
-/i == 100/
+syscall::ioctl:entry
+/pid == $target && i == 100/
 {
 	exit(0);
 }
diff --git a/test/unittest/aggs/tst.truncquant.d b/test/unittest/aggs/tst.truncquant.d
index 9a8b707e5..9b9794e40 100644
--- a/test/unittest/aggs/tst.truncquant.d
+++ b/test/unittest/aggs/tst.truncquant.d
@@ -1,16 +1,18 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
+/* @@trigger: bogus-ioctl */
+/* @@nosort */
 
 #pragma D option quiet
 
 int i;
 
-tick-10ms
-/i < 100/
+syscall::ioctl:entry
+/pid == $target/
 {
 	@[i] = lquantize(i, 0, 150);
 	@[i] = lquantize(i + 1, 0, 150);
@@ -19,8 +21,8 @@ tick-10ms
 	i++;
 }
 
-tick-10ms
-/i == 100/
+syscall::ioctl:entry
+/pid == $target && i == 100/
 {
 	exit(0);
 }
-- 
2.43.5

