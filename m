Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653F213236
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754488727; cv=fail; b=VfhTBFqG4P5UCaryVF0DWt5bknjrBmNpEZjjQ60fte4j9+wY6fAXmgWMr9R6Kmq6a5BP08o9iBhbDUGuPFOqhaWWaNuMQrQLU4lZer92rMsloxanvTzUocqnFX+Ft/0LJs+am9fhU+vIGgrHuAqrkDVaUGmaaWpesBNlb8YgkRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754488727; c=relaxed/simple;
	bh=l+nMKsXYDbPkBcVmo81w8P10ygQOSPI9iPBBHB8ohvI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=QJaKQiDphYdIvbmDFlBUozRJZgKDoIHYkkgFm9Hq+mI8PwjBQ3mIYPGtYmOX7xVapIvO5eNMLn6AUA9cEIxLrCIRFAl+Fv2sm65aCHiryefX5LVlzlfctCXVXk0ZAUV4RO4Jv1nJjqRecVX2cS8Na4QoCtjGt1xI0ROwC0sYIMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kD7u10PA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ldNGPnsD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kD7u10PA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ldNGPnsD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CS5NP023164
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 13:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=2OL74uWDDNPacUjOgYZpip4dDO4jKRZDCQpKzWxzJik=; b=
	kD7u10PAv/kORojzpGT+i8/7QWX4TG09ycOJ0Fs92JjRweOha2r7mLHfRVhXbava
	TCORwtZbsaewdt7jsD7ltEMtbfB70xnBpZajAYL4vStghoJWcIhVrYSLdQbxFemi
	lkCI6u89ISh7z2lJTPbqrLUR6uFEqc1yOd+my5jtV5qMJNp+Qz5R81fMH9T27dq0
	nitGnIDSw9/OGoXqtl9Sr3KHNoTu9eD2LUczivVupa8qpBKGUF070TdO8F15MZZc
	1nXNx/gRgi5MjHDSuYTBUAzsYRqu4870OWWMa3gCJl+l27lyw0CxeqBC7voNELyn
	/piQVhuoZ0j1gD7OTdyylQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvh1qkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 13:58:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576CxLdK009695
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 13:58:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwm2exn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 13:58:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLl02kGwjHyTCcIIFXh0xazV1HNs1athv3P6gjhuZuzEViJ7+9j5m0K2NIkfQgTpsPTVlsZP07I+JGnWmEl+fmtJiSPDMnNE3xFc/o4DnixrPznJWTtH8p0OeyP/tvlEtyMx8paW11XHGDdORHdliOp8NUFngXAwTsGG9lu/jXlQRQyUrAwPE4zY4fJeweJZqtNzUzlpn9te835zvlMYP9ThKCHBbP/SN4t246skATN0bFBbERU1G61oYt/4LVGWgWYmO0b5Aj7qj0SkmtaWSivbUBW/fbt8DtEDIQcXPfwdCRqPqL9j4GJnea9OqTwiEn4VQr+1cKgAdNMsX4/LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OL74uWDDNPacUjOgYZpip4dDO4jKRZDCQpKzWxzJik=;
 b=mPRMClQ5gI3mEEzuw3cGg0JKCrQh2ihHpV0/ReKz7k+E6wSm/ns0K9utOMpGwC0qRoZC52JhgHfw8ybjeMSBCHQrQeUtPA8cvk/JJ5Kax7GZsUVouJWu6BSwiHQfSTgCoyT8Amp6KL8Pjf+cOus9gqtj7jAfuUPHosTEyI+Wva3uT4yyfw1pMSQZqfyrXTRU67Rd10V/3qRLN1nnmRmSVC1yxVp5xDi2040hWEJ902hyfrtpWhX6fRDWC100JOHJXic5+UDU+H4CFpLA6H4jdsFdzWjXne6u4hz1TcrxZxvWps2iimwaC/YoeGNLoVU4wO7u9Yhmzt5Kk0MDXbLZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OL74uWDDNPacUjOgYZpip4dDO4jKRZDCQpKzWxzJik=;
 b=ldNGPnsDsSnAdHGS8V8+Jr2+BpNlR6PGEsNsZGl40YaDG6vSM3YsB9nKcLX9Xiw9f6UlE3U/Mro2s+gjGgBXRP8FKRZXMpFGzyUNEOeN4Zo5Ll0OnoGZn+dPfBJjQOAOs+Ai5rbn9Qfs4/ENBA4eP4ohDTNtjCrPQz4Y2OWVfv0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BLAPR10MB4849.namprd10.prod.outlook.com (2603:10b6:208:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 13:58:40 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 13:58:40 +0000
Date: Wed, 06 Aug 2025 09:58:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix various memory leaks related to stapsdt and usdt
 probes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672DC48BED654643C7F8912C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BLAPR10MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4cb3f9-b69b-4743-bc26-08ddd4f158e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XS6RTpre7eL499mHqjl92+pp7Ua4kzpMWY69wC9KmUexTgpB2QnoFE2gBy0g?=
 =?us-ascii?Q?2nhBhL0g+LrsLoABaFiUUSoBpZmp2f788WezRcMFYaHimh9lRWivvW5Gs+/a?=
 =?us-ascii?Q?i4mvxr4RhSMz7XJq4dwiCLKI0PgOQmVCG2YbI5G2IeeUjCcG6So1r+VU3QWK?=
 =?us-ascii?Q?hgq+DLA+MzFkpJ5b8/8mmINBJ+kcQ0WUtjDaxTlEfWiZhNzTgSvF/9OHzDv1?=
 =?us-ascii?Q?crLNXbGJq2IcrojW/3KmBaffnZLGd8/+8pURQJiAY3nHD3f/KxCW+j1kTazK?=
 =?us-ascii?Q?wz3QsI1xr7eo3lam042gUb7R+/qVZHRbZ0VjzF46OCL3Cn0nvpvd3H783HUA?=
 =?us-ascii?Q?5XdmGqy3MK/rM23uUaeD+In6NzIc4E7riynWpG95BQkTnzdT0814y0415os7?=
 =?us-ascii?Q?6zUAKg40mrzVjJTxlZ5x3llErdFBlZ8MQdIfaXvVvoaRvNAEPYSHli6viBRQ?=
 =?us-ascii?Q?8jZTjCrbwZ5f3QxPl+6UTZP6VFYGoihdEoxJIpxubeP28llhkys0bxxA612V?=
 =?us-ascii?Q?9DqsxbGqhVo6Wg29btvW1GevCq5jC/V/xmx17rkJ1CnWPicJfXv2+Jy4uyv/?=
 =?us-ascii?Q?B7gQNKuSrJQ6G5DucWyilaulpNgGnhEMRybIE0AfJn2Xr10q988qjCyv/pb1?=
 =?us-ascii?Q?4UBrx4GlJ9hqZWjQboICVq9HA7kNHS+2O3FD0p2BSNuScnj/jPkM3oWFCePO?=
 =?us-ascii?Q?XHsgbgDrDq7ee4mFcb3pIWNGxsR/18ocKoFTyfuz95LWNcRYWpHGQW6Mps/4?=
 =?us-ascii?Q?20hdC4ltqcXAdBm6J2AAQBkk3s7MmpUgAHnjhV653C07VTfQdS6XZC70jGhX?=
 =?us-ascii?Q?4DtigZlKaYv0VmXSxVU7bIkkJXTZzRdMUPsuILH0RKjAJf2DLV34eUzclfcu?=
 =?us-ascii?Q?dMQVKCNQyvLIATlsYoah1yBCFSYSAfz8aU3nBSWpWlkFZtsOnbKikFmBQhNG?=
 =?us-ascii?Q?1OZZbvVRpWCIAnjyvjqJFSFgYmMdaPLYNkOPBbQoetoTf86GOceuzNNt0hrr?=
 =?us-ascii?Q?5R6kmpXOOuZBsoQ6NTopNmboa/LOH9AI9bDfKZO6fh1rEyiPww/8QiJR3ODW?=
 =?us-ascii?Q?Ya70tcM07WO5f0TQUskF9y87nsqC9pF462pxwuCAKOTk24seVq7W5Bp0wYfY?=
 =?us-ascii?Q?gD4UGeonT8jxOXHbSwNvWODqZBkxrJqZtv4ak9bAZWt7mf2WvEXVxdLtx9FW?=
 =?us-ascii?Q?xdZfReBdBJD9a3UT9/uOoLoTtMbpfm/YqsdeF0R5vdpGhLPI6hsFnFUrRi7c?=
 =?us-ascii?Q?f47ctJKbQQsmlR+GW+fJXGtUstS2ZEGKvt/rQF0kpZAxQCkhLzMM80n1NtAZ?=
 =?us-ascii?Q?kom1B8mxQ0yppmJjTC8N089UQ4UO2Fv1o2XnV+tjHICRo+F4miYXtxYpl39/?=
 =?us-ascii?Q?aYVn8qVHIwYPOOs7DCF0QzlGEnwUBPaDVSrIMQTefoPwzej5x3q0zj8NxybB?=
 =?us-ascii?Q?ge4RtZUwKGc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xbNaW+UJFsI227E9ye1+/wJUcWscnsm7owbQhiu2I/vYXlAKcXfRrWjr6AZM?=
 =?us-ascii?Q?X6lmeV2lzsEPiCqjxckysw7d9E7e4eia3P33wAB1x91DlmKc+q40oUzwhQn4?=
 =?us-ascii?Q?WKcbi72gnZ9oT1IujKcMP9QdxtUvSEYxa+DG5gxPJ0syKCTsUmRUMCAwdKPb?=
 =?us-ascii?Q?n267mFm2t33B31/gpfsBNF3FDwIQPqX3rvrBGE6M/DG2+UCO/XpNmQgPqmp8?=
 =?us-ascii?Q?a5UgJKxoL7R+10grzMVh6lbqqdxZ/j5wP1DS+oHt+plIPU8urrlrkgw7Y/OZ?=
 =?us-ascii?Q?6GUKAhFQBlHhU+xz5daj36px0xVrfc+ORIdkoYKEUwFn1x8FzD4ad1TryaO/?=
 =?us-ascii?Q?T8gLvWrGdGWxB+gMAVbFtEHRrWpo/cuvJRRCk1g8E27UotYfXRGDiO3EddZH?=
 =?us-ascii?Q?/liFUsGXxvXbHyjD0bvZsgg3ICGHUIMqk/fK4lYBi/2+MoANMev/FQgBdDEC?=
 =?us-ascii?Q?gfMXTexiEaATR5agJLnOeyd2bd2bJdkwy4EO7RVKaIHHgXDD+jNrw/iL0r/7?=
 =?us-ascii?Q?yHGOnTnAWyD/jWgHKR0SbwExsUuUtbAY+qTqE2rnmowJGwNbjrzR8vXB5YzJ?=
 =?us-ascii?Q?rtMrYz41DxMxK7b9Vk8YX8vf8xW3/WsMVQP+/6l9FHvA6XZwPknOwQOrGLv8?=
 =?us-ascii?Q?a1bLMPwvzuWNnsCgVU5H40xL52c6d8LXxNrc3teL+qvqa2MbOMhKSCVb90Q0?=
 =?us-ascii?Q?rZXm14KnbrwuKRVeY62whtU7dkngt8wdyGS48NaOywD3Czv78Sq4I7DjLMOx?=
 =?us-ascii?Q?kA28SZcRwqnSbcnF0FowUd3qLToNvPLp2LyoWvn9mko8lmgBjbR3EYxg0pWx?=
 =?us-ascii?Q?Pyhb1kmfQ/7o6Q2CfLBhRwdQpDLrHmrM2zEIH8PG8ZuMCgujqiIo7HpaEhJ0?=
 =?us-ascii?Q?ntUOvKkAOdCEVmZINHTY0g6QoeA/0Sm3P9P5mwWmZUyl/q7nJTeAM0HzVdZg?=
 =?us-ascii?Q?mrHgOh5gj43RV4ar4YkFyCsXcaXaE9RSoKZFas823j0CeoiKGiC7yx9F7GVf?=
 =?us-ascii?Q?vnxrEKINxz+v8xEAz0IlRtLjE3jrcrGbFIf92H8cKOzNtmaSWq8Gvm6+WLVh?=
 =?us-ascii?Q?bJT45pV7CM84YSzv9mUs5dOyPum0pDoOWvVYjAMXo3oP9zdqEXZgzRxNYyTi?=
 =?us-ascii?Q?mfa37+z45vPV8hoNMWHqik0z/hN3D/5cAwJBn2Mmr5qubfARJv/ZF3JKUkZh?=
 =?us-ascii?Q?lMiZPab8Vbi+jXP4DLYEPDVYUUPV5/PoMm+DZcZeQECg5BcMkK1z7H9Y2s8p?=
 =?us-ascii?Q?FWXKigUHEaOL0eeanRyA9Ra82KbDrxo6/EkTVbGo9P/brJVv8e56b3xHJ4DE?=
 =?us-ascii?Q?ef73ApWK3cYU3uzoCN9k8YPR7vkGlKOhEv1bulEBcbbQJXWvpvmLT1Pv20Gx?=
 =?us-ascii?Q?x1peWajWmFCDMK/Fo7C+t2QjRY3adRZTkewml0B0HI18dsr+gVbBQ2eFogLr?=
 =?us-ascii?Q?M/o1QBKmprjrQJO2mgKVyXS2GU3rfr1vJm0TqtWzYDvcYyXL8myZewWHipbJ?=
 =?us-ascii?Q?K8HOe0h/SQqW2LxxVvrsE68EO3l0gegUM/9gsTVsUFjbQtQZwOgRb4ZqVgTG?=
 =?us-ascii?Q?U503b2bjbZghMRvNdntDwSFIAX6Wly2x5EEDhaVTM6TVx8YkDQRec30ow/pw?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6PsYps2JpeStLMOgeGzmkZxWBC1DS9icPohdK72q+VbrBj1wK9jMBG68wfppigS/KzaDSbdI7f+pH/6KEfa2ilbJEJH4YMKcwtwxNYorVxb3prmQ+LRRJCQiESclN8AtvYJBWs44Ddk9u0+zUBO8p4MnlYasSX8kjAwdqEkvjYD/l+PGAcCCbLBoIbR0AHGjUlBmA5Iq3WZ5wde9fNjIz+xn9zJ7WjwasLK4HmO6d2xMeQJfynOcT5G1Tk19kyJ4cDwg6i+F8QGpn/DHcznTyrcKsJg4HmQg1AvdMmwdkRp6hIuIU+vNjh403qajod2tzrp50g/4VFZ42HcaOB8Cuk0BQHfWmIvN7LkLAPUwMqAQf9txZIcTC8EOo0FE7sHAMQfOC+yCMHVqzYsTh+JhxN47egDqjPZzQF0T8QsLktQjJox3UWmukGDNm/0BsQ0dblwa0I3XQrFbqH7dP6LgLAkI54Al3lC6JsCXIlkBQXX2rt6HU8wUW3x8X0iLvBkifXZNsC3VCcWX9TzjmBIKxrNwU9q2FaTqVWiVKgSFyJBPOs5qTLIJfe1qV3QHjRB1BlGR35SfcAwlflfz8BT4CJvB4Y8L5LBHvNo6wqu+4pA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4cb3f9-b69b-4743-bc26-08ddd4f158e1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 13:58:40.1888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zTEkuM6psVDlTQgJGwrcLYMPoJarAQJWkJptF0UbWKxlas49G9rsSU5dR5r9vF6ManpluJib/7E7u0f8igyHx/+iCfl2exVaD6lRXyomA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060088
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA4OCBTYWx0ZWRfX2K5bRlnN/Sjz
 AdtG9O4lgqze2/jCf6SwQQg1JJA2ZjyItgLpdgyNT/VLeHgCFsElkLlL7qoHgBIq6Lnu5Nj5GRf
 iRIOENOU2BpudaUfYwg8NZTjQPr+C+Fu1qZVf2CEyHJ7NGYp3UapvIV4oRaFNIayrneMGl3Upz8
 J362L8mDFDp2u97+4NEVtEHoOKWb+Au8b37qxNlHfTnIINi443QFh1cqvXy67FMg+MCaNv202zF
 +3/NpkkrS77YWuPqPjG/jfpfQmBYtjnmEABDOxTPvGChsHeFy+pgbTmKh3f87OerjOW3FB9/Jth
 57/1BsbO3NXMV//Kh4ysjOMs/rZbK6mzVmQ59ecmVfr4bNN/7chjGxeayduYaXGcP0iV8t3GZDF
 CRZAqf9UOyVHpptOtqW7JspxVNvWTRBrSnpVN69Wl1w/idygIz4lR6FKOOgnzmFFS7b217AC
X-Proofpoint-ORIG-GUID: H7IP2unGEanJypAptUh3msDkqD0bpRcI
X-Proofpoint-GUID: H7IP2unGEanJypAptUh3msDkqD0bpRcI
X-Authority-Analysis: v=2.4 cv=Hpl2G1TS c=1 sm=1 tr=0 ts=68935f94 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=I22fiKtnywe7zpspZQ8A:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pid.c         | 14 ++++++++++----
 libdtrace/dt_prov_uprobe.c | 13 +++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 42f667fe1..4af9141aa 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1282,6 +1282,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 	int i, err = 0;
 	int fd = -1;
 	char *mod;
+	char *no_fun = "";
 
 	fd = open(path, O_RDONLY);
 	if (fd < 0) {
@@ -1415,7 +1416,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 				       &fun, &sym) == 0)
 			psp.pps_fun = (char *)fun;
 		else
-			psp.pps_fun = "";
+			psp.pps_fun = no_fun;
 		psp.pps_dev = pmp->pr_dev;
 		psp.pps_inum = pmp->pr_inum;
 		psp.pps_pid = dpr->dpr_pid;
@@ -1430,6 +1431,9 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		}
 		if (err == -1)
 			break;
+
+		if (psp.pps_fun != no_fun)
+			free(psp.pps_fun);
 	}
 
 out:
@@ -1513,7 +1517,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 	const dt_provider_t *pvp;
 	dt_proc_t *dpr = NULL;
 	const char *pidstr;
-	char *path = NULL;
 	pid_t pid;
 
 	assert(pcb != NULL);
@@ -1525,8 +1528,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 	if (strlen(pidstr) == 0)
 		return 0;
 
-	asprintf(&path, "/proc/%s/maps", pidstr);
-
 	pvp = dt_provider_lookup(dtp, "stapsdt");
 	assert(pvp != NULL);
 
@@ -1542,8 +1543,13 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 	}
 	dpr = dt_proc_lookup(dtp, pid);
 	if (dpr) {
+		char *path = NULL;
+
+		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1)
+			longjmp(pcb->pcb_jmpbuf, EDT_NOMEM);
 		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
 						  pvp, dpr, path);
+		free(path);
 		dt_proc_release_unlock(dtp, pid);
 	}
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 8c8dcae0c..986ac0ead 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -795,6 +795,10 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	char	*nptr = NULL, *xptr = NULL;
 	size_t	i;
 
+	/* Nothing to do if we already populated the arguments. */
+	if (upp->argc >= 0)
+		return 0;
+
 	upp->argc = psp->pps_xargc;
 
 	/* Copy argument value source string data (if any). */
@@ -941,6 +945,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		upp->refcntr_off = psp->pps_refcntr_off;
 		upp->fn = strdup(psp->pps_fn);
 		upp->func = NULL;
+		upp->argc = -1;			/* no argument data yet */
 		upp->tp = dt_tp_alloc(dtp);
 		if (upp->tp == NULL)
 			goto fail;
@@ -1716,6 +1721,7 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
 	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
 
 out:
+	free(spec);
 	if (fd != -1)
 		close(fd);
 	if (rc < 0) {
@@ -1975,6 +1981,12 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
 	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
 }
 
+/* Clean up the private provider data. */
+static void destroy(dtrace_hdl_t *dtp, void *arg)
+{
+	dt_htab_destroy((dt_htab_t *)arg);
+}
+
 /*
  * Used for underlying probes (uprobes).
  */
@@ -2014,6 +2026,7 @@ dt_provimpl_t	dt_usdt = {
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
+	.destroy	= &destroy,
 };
 
 /*
-- 
2.45.2

